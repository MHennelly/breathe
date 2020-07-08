### Breathe - Simple CLI for cyclic backlight effects

##### Overview

I recently got a refurbished X1 Carbon and was interested in experimenting with the keyboard's
backlight. I wrote these Bash scripts to give my backlight the ability to cycle through brightness
modes. The dependencies are 'dbus-send', 'upower', and of course a keyboard with a backlight. I've
only tested on an X1 Carbon, so if it doesn't work on other systems you may need to edit breathe.sh.

##### Installation

Run 'install.sh'. Make sure '/usr/local/bin' is in your path. Once installed, if you manually setup
a keyboard shortcut which runs the command 'breathe-toggle' you can now toggle the breathe effect
with whatever shorcut you chose.

##### Demo

Here's a GIF that shows it working. Quality could be better, but I'm content
with it. Anyways, this is it running with default settings of cycling between
brightness mode 1 and mode 2 over a period of 2 seconds.

![](./lightup.gif)