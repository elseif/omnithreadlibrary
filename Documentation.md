# Introduction #

OmniThreadLibrary (OTL for short) is simple to use threading library for Delphi. Versions 2007, 2009, and 2010 are supported.

OmniThreadLibrary is an open source project, licensed under the [BSD License](http://www.opensource.org/licenses/bsd-license.php).

# Details #

OTL's main "selling" points (besides the price, of course ;) are power, simplicity, and openess. With just few lines of code, you can set up multiple threads, send messages between them, process Windows messages and more. OTL doesn't limit you in any way - if it is not powerfull enough for you, you can ignore any part of its "smartness" and replace it with your own code. You can also ignore the threading part and use only the communication subsystem. Or vice versa. You're the boss.

OTL can be used at different levels. It contains [reusable structures](ReusableStructures.md), [simple task management](TaskManagement.md),
[thread pool management](ThreadPools.md), and [high-level parallelism structures](ParallelTasks.md).

# Contributors #

OTL would not be the same without two Slovenian Delphi hackers - GJ, who wrote the lock-free communication code and Lee\_Nover, who found numerous problems in my code and helped with suggestions when I got stuck. Thanks, guys!