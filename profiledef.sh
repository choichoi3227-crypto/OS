#!/usr/bin/env bash
# CloudOS Custom Arch ISO Profile

iso_name="CloudOS"
iso_label="CLOUDOS_$(date +%Y%m%d)"
iso_publisher="choichoi3227-crypto <https://github.com/choichoi3227-crypto/CloudOS>"
iso_application="CloudOS (Arch Linux Based)"
iso_version="1.0.0"
install_dir="arch"
buildmodes=('iso')
bootmodes=('uefi-x64.systemd-boot' 'uefi-x64.grub' 'bios.syslinux')
arch="x86_64"
pacman_conf="pacman.conf"
airootfs_dir="airootfs"
