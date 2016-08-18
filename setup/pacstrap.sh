#!/bin/bash
set -xe

CHROOT_SCRIPT_URL="https://raw.github.com/T0rt4nk/setup/master/chroot.sh"

# Run archlinux commands for pacstraping the server
mount /dev/vg_ssd/lv_ssd /mnt
mkdir /mnt/boot
mount /dev/sda1 /mnt/boot
swapon /dev/sda3

pacstrap /mnt base

genfstab -p /mnt >> /mnt/etc/fstab
arch-chroot /mnt sh -c "$(curl -fsSL $CHROOT_SCRIPT_URL)"

umount /mnt/boot
umount /mnt

reboot
