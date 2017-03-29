hellonavi: A theme for Plymouth
===============================

Description
-----------

This Plymouth theme is based on the boot screen of the Navi computer, featured
in the japanese series Serial Experiments Lain. It is a simple animation that
replaces replace the default Plymouth theme.

Installation
------------

### Important note ###

The following instructions were tested in Kubuntu 16.10. The steps you'll need
to take to install this software in your system may be different - don't make
changes to your system if you can't reproduce any of the steps below in your
system and you don't know how to adapt the instructions!

### Instructions ###

1. Copy the hellonavi folder to /usr/share/plymout/themes

**Recommended**: At this point you should make a backup of the file
/etc/alternatives/default.plymouth:

`# cp /etc/alternatives/default.plymouth /etc/alternatives/default.plymouth.bak`

2. Remove the symbolic link to the current plymouth theme.

`# rm /etc/alternatives/default.plymouth`

3. In /etc/alternatives/, make a symbolic link to hellonavi.plymouth with the
following command:

`# ln -s /usr/share/plymouth/themes/hellonavi/hellonavi.plymouth /etc/alternatives/default.plymouth`

4. Update your initramfs so it includes the new theme

`# update-initramfs -u`

5. Done. The new theme should show up on boot and shutdown.

### Additional notes ###

The test script included was only tested under Kubuntu 16.10 and will probably not work in most
other flavors of Linux. It's probably best to manually adapt it to your system before running.

The Plymouth's theme folder may be located in
/lib/plymouth/themes in some distributions

default.plymouth may be located inside of the
themes folder in some distributions

Imagemagick can be used to convert GIF files into PNG files numbered upwards
from 0. The command I use is below.

`$ convert -coalesce input_file.gif prefix%01d.png`


Thanks/Credits
--------------

* [virpara][1] from askubuntu.com, for the [explanation][2] on how to build a
custom plymouth theme and the example code upon which hellonavi was based.

* [dreamingusagi][3] from deviantart.com, for the [Lain Navi Os][4] animation
from which I took the visual assets used in this theme.

[1]: [http://askubuntu.com/users/40166/virpara]
[2]: [http://askubuntu.com/questions/143330/how-can-i-customize-the-ubuntu-boot-up-logo/147769#147769]
[3]: [http://dreamingusagi.deviantart.com/]
[4]: [http://dreamingusagi.deviantart.com/art/Lain-Navi-Os-78251341?q=boost%3Apopular%20lain%20navi%20os&qo=0]
