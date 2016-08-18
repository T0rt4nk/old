#!/bin/sh
set -xe

ln -s /usr/share/zoneinfo/Europe/Paris /etc/localtime

sed -ri 's/(block) (filesystems)/\1 lvm2 \2/' /etc/mkinitcpio.conf
mkinitcpio -p linux

pacman -S --noconfirm grub
grub-install /dev/sda
grub-mkconfig -o /boot/grub/grub.cfg

passwd
