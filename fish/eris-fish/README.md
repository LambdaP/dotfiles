# The Eris prompt

A prompt worthy of all those who worship the Goddess! Praise to her!

To experience the Eris prompt at its finest, the ddate command should
be installed.

This prompt was written by Pope Patrick Lambein (https://github.com/LambdaP/).
However, it uses a lot of good hacks stolen from people more clever than
him.

## Switch mode

The Eris prompt comes in different flavours! To switch prompt mode, run

    $ eris [mode]

Currently available modes are light and regular. Running "eris" without
argument displays the current mode.

## Regular mode

In regular mode, the prompt displays:

* User (@ Hostname if distant)
* PWD
* Current git branch
* Dirty working directory
* Number of sleeping and background processes
* If the previous command failed (red char)
* Battery status

The battery status option rests on two different script, depending on
the OS (darwin/linux). This option might not be working properly and
therefore might need for the user to edit the script by hand.

## Light mode

In light mode, the prompt takes only one line and displays:

* $ User (@ Hostname if distant)
* PWD
* Current git branch
* Dirty working directory
* Number of sleeping and background processes
