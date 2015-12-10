# Constants #

|[COtlReservedMsgID](COtlReservedMsgID.md)| Message ID reserved for internal messaging. |
|:----------------------------------------|:--------------------------------------------|
|[CMaxSendWaitTime\_ms](CMaxSendWaitTime_ms.md)| Default SendWait timeout.                   |
|[CDefaultQueueSize](CDefaultQueueSize.md)| Default queue size (counted in number of messages). |

# Records #

|[TOmniMessage](TOmniMessage.md)| Message-carrying packet. |
|:------------------------------|:-------------------------|

# Interfaces #

|[IOmniCommDispatchingObserver](IOmniCommDispatchingObserver.md)| |
|:--------------------------------------------------------------|:|
|[IOmniCommunicationEndpoint](IOmniCommunicationEndpoint.md)    | Communication endpoint. |
|[IOmniTwoWayChannel](IOmniTwoWayChannel.md)                    | Bidirectional channel consisting of two communication endpoints. |

# Classes #

|[TOmniMessageQueue](TOmniMessageQueue.md)| Fixed-size ring buffer of TOmniMessage data. |
|:----------------------------------------|:---------------------------------------------|
|[TOmniMessageQueueTee](TOmniMessageQueueTee.md)|                                              |

# Global Functions #

|[CreateDispatchingObserver](CreateDispatchingObserver.md)| |
|:--------------------------------------------------------|:|
|[CreateTwoWayChannel](CreateTwoWayChannel.md)            | Bidirectional channel factory. |

# Source #

http://code.google.com/p/omnithreadlibrary/source/browse/trunk/OtlComm.pas