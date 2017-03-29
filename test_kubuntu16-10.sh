#!/bin/bash

# This script was only tested under Kubuntu 16.10 and will probably NOT WORK
# in most of other Linux distributions! Use it at your own risk.

# This script installs the theme into your system under some circumstances,
# i.e the default.plymouth file is located in the /etc/alternatives directory.
# If not, then its best for the user to study this script and adapt it to their
# environment or install it by hand.

# Note: If you get a frozen screen, make sure to move your mouse cursor!

# Make sure you're root
if [[ $EUID != 0 ]]; then
    echo "This script must be run as superuser"
    exit 1
fi

# Checks if default.plymouth is located in /etc/alternatives
if [[ ! -f /etc/alternatives/default.plymouth ]]; then
    echo "There is no /etc/alternatives/default.plymouth in
your system, so this script is probably not safe to
run. Please modify it manually to work on your system."
    exit 1
fi

# If this theme was installed before, then remove the previous files
if [[ -f /usr/share/plymouth/themes/hellonavi ]]; then
    rm -rf /usr/share/plymouth/themes/hellonavi
fi

# Making sure working directory is the same as the script's
cd "${0%/*}"

# Copying the theme to theme folder
cp -r ./hellonavi /usr/share/plymouth/themes/hellonavi

# Making a backup of the current default.plymouth
cp /etc/alternatives/default.plymouth ./default.plymouth.bak

# Removing old default.plymouth (it's a symlink to the current Plymouth theme)
rm /etc/alternatives/default.plymouth

# Making a symlink to the new
ln -s /home/yqi/projects/plymouth/hellonavi/hellonavi/hellonavi.plymouth /etc/alternatives/default.plymouth

# Updating current intrd with the new theme
update-initramfs -u

# Testing the theme
plymouthd --debug --debug-file=/tmp/plymouth-debug-out ; plymouth --show-splash ; for ((I=0;I<10;I++)); do sleep 1 ; plymouth --update=event$I ; done ; plymouth --quit

# Restoring old default.plymouth from backup
rm /etc/alternatives/default.plymouth
mv ./default.plymouth.bak /etc/alternatives/default.plymouth

echo "The previous default.plymouth was restored. Run the command
'update-initramfs -u' to restore the old Plymouth theme if you want."
