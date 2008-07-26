unit testOmniThreadLibrary1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls,
  OtlComm,
  OtlTask,
  OtlTaskControl,
  OtlEventMonitor;


type
  TInitTest = class(TOmniWorker)
  strict private
    itSuccess: boolean;
  public
    constructor Create(success: boolean);
    function  Initialize: boolean; override;
  end;

  TfrmTestOTL = class(TForm)
    btnTestFailure        : TButton;
    btnTestSuccess        : TButton;
    lbLog                 : TListBox;
    OmniTaskEventDispatch1: TOmniTaskEventDispatch;
    procedure btnTestFailureClick(Sender: TObject);
    procedure btnTestSuccessClick(Sender: TObject);
    procedure OmniTaskEventDispatch1TaskMessage(task: IOmniTaskControl);
    procedure OmniTaskEventDispatch1TaskTerminated(task: IOmniTaskControl);
  private
  strict protected
    procedure Test(success: boolean);
  end;

var
  frmTestOTL: TfrmTestOTL;

implementation

uses
  DSiWin32;

{$R *.dfm}

{ TInitTest }

constructor TInitTest.Create(success: boolean);
begin
  itSuccess := success;
end;

function TInitTest.Initialize: boolean;
begin
  Task.Comm.Send(0, 'pre-init');
  if itSuccess then
    Task.SetExitStatus(1, Format('ok, thread priority = %d', [GetThreadPriority(GetCurrentThread)]))
  else
    Task.SetExitStatus(-1, 'fail');
  Result := itSuccess;
end;

{ TfrmTestOTL }

procedure TfrmTestOTL.btnTestFailureClick(Sender: TObject);
begin
  Test(false);
end;

procedure TfrmTestOTL.btnTestSuccessClick(Sender: TObject);
begin
  Test(true);
end;

procedure TfrmTestOTL.OmniTaskEventDispatch1TaskMessage(task: IOmniTaskControl);
var
  msg: TOmniMessage;
begin
  task.Comm.Receive(msg);
  lbLog.ItemIndex := lbLog.Items.Add(Format('%d: %d %s', [task.UniqueID, msg.msgID, msg.MsgData]));
end;

procedure TfrmTestOTL.OmniTaskEventDispatch1TaskTerminated(task: IOmniTaskControl);
begin
  lbLog.ItemIndex := lbLog.Items.Add(Format('~%d', [task.UniqueID]));
end;

procedure TfrmTestOTL.Test(success: boolean);
var
  task: IOmniTaskControl;
begin
  task := OmniTaskEventDispatch1.Monitor(CreateTask(TInitTest.Create(success), 'InitTest'))
    .FreeOnTerminate
    .SetPriority(tpIdle)
    .Run;
  if task.WaitForInit then
    lbLog.Items.Add('Init OK')
  else
    lbLog.Items.Add('Init failed');
  lbLog.ItemIndex := lbLog.Items.Count - 1;
  Application.ProcessMessages; // process waiting messages
  lbLog.Items.Add(Format('Exit code: %d', [task.ExitCode]));
  lbLog.Items.Add(Format('Exit message: %s', [task.ExitMessage]));
  task.Terminate;
  task := nil;
end;

initialization
  Randomize;
end.
