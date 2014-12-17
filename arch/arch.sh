#!/bin/sh

DISK=/dev/sda
ROOTVOL=/dev/sda1
BTRFSLABEL=arch
ROOTDIR=/broot
BTRFS_ROOT=__active
MOUNTDIR=/mnt
SNAPSHOT=__snapshot

# New GPT.
echo "Erasing and writing the new GPT table."
sgdisk -Z /dev/sda
sgdisk -o /dev/sda
sgdisk -N 1 -a 2048 /dev/sda

# Marking $ROOTVOL as BTRFS.
echo "Marking $ROOTVOL as BTRFS"
mkfs.btrfs -L arch /dev/sda1 -f

# Mounting the root partition.
echo "Mounting the partition."
mkdir -p /broot
mount $ROOTVOL $ROOTDIR

# Creating all the BTRFS subvolumes.
echo "Creating the BTRFS subvolumes."
btrfs subvolume create $ROOTDIR/$BTRFS_ROOT
btrfs subvolume create $ROOTDIR/$BTRFS_ROOT/home
btrfs subvolume create $ROOTDIR/$BTRFS_ROOT/usr
btrfs subvolume create $ROOTDIR/$BTRFS_ROOT/var
btrfs subvolume create $ROOTDIR/$SNAPSHOT

# Mounting the new BTRFS subvolumes.
echo "Mounting the new BTRFS subvolumes"
mount -o subvol=$BTRFS_ROOT             $ROOTVOL $MOUNTDIR
mount -o subvol=$BTRFS_ROOT/home        $ROOTVOL $MOUNTDIR/home
mount -o subvol=$BTRFS_ROOT/var         $ROOTVOL $MOUNTDIR/var
mount -o subvol=$BTRFS_ROOT/usr         $ROOTVOL $MOUNTDIR/usr

# Mounting /boot.
echo "Mounting /boot"
mkdir -p $ROOTDIR/boot $MOUNTDIR/boot
mount --bind $ROOTDIR/boot $MOUNTDIR/boot

# Add testing and multilib to pacman.conf.
echo "Adding testing and multilib to pacman.conf."
echo "[testing]" 			  >> /etc/pacman.conf
echo "Include = /etc/pacman.d/mirrorlist" >> /etc/pacman.conf
echo "[multilib]" 			  >> /etc/pacman.conf
echo "Include = /etc/pacman.d/mirrorlist" >> /etc/pacman.conf
cp /etc/pacman.conf $MOUNTDIR/etc/pacman.conf

# Installing the system.
echo "Installing the system"
pacstrap $MOUNTDIR base base-devel syslinux btrfs-progs openssh gptfdisk

# Installing syslinux.
echo "Installing syslinux."
syslinux-install_update -i -c $MOUNTDIR
sgdisk $DISK --attributes=1:set:2
sgdisk $DISK --attributes=1:show
syslinux-install_update -m -c $MOUNTDIR

# Generate fstab
echo "Generate fstab. Do not forget to edit later on."
mkdir -p $MOUNTDIR/etc
mkdir -p $MOUNTDIR/var/lib/btrfs
genfstab -U $MOUNTDIR >> $MOUNTDIR/etc/fstab

# Preparing for chroot.
echo "Preparing for chroot."
cp /etc/resolv.conf $MOUNTDIR/etc/
cp /etc/pacman.d/mirrorlist $MOUNTDIR/etc/pacman.d/
mount -t proc proc $MOUNTDIR/proc
mount --rbind /sys $MOUNTDIR/sys
mount --rbind /dev $MOUNTDIR/dev
mount --rbind /run $MOUNTDIR/run

# Chroot options.
echo "Setting options in chroot."
echo "arch"              >  $MOUNTDIR/etc/hostname
echo "en_US.UTF-8 UTF-8" >  $MOUNTDIR/etc/locale.gen
echo "en_US ISO-8859-1"  >> $MOUNTDIR/etc/locale.gen
echo "LANG=en_US.UTF-8"  >  $MOUNTDIR/etc/locale.conf
chroot $MOUNTDIR ln -sf /usr/share/Europe/Paris /etc/localtime
chroot $MOUNTDIR locale-gen
chroot $MOUNTDIR passwd

# Enable network
# Check the interfaces with ip link if failing
echo "Enable network."
chroot $MOUNTDIR systemctl enable dhcpcd@enp0s8.service
chroot $MOUNTDIR systemctl enable dhcpcd@enp0s3.service
chroot $MOUNTDIR systemctl enable sshd

# Update mkinitcpio.conf.
echo "Update mkinitcpio.conf."
sed -i -e 's/^MODULES=\"\"$/MODULES=\"crc32c\"/' -e '/^HOOKS=\"/s/\"$/ btrfs_advanced\"/' $MOUNTDIR/etc/mkinitcpio.conf

# Downloading mkinitcpio-btrfs.
echo "Downloading and extracting mkinitcpio-btrfs."
mkdir -p $MOUNTDIR/tmp/aur
cd $MOUNTDIR/tmp/aur
wget https://aur.archlinux.org/packages/mk/mkinitcpio-btrfs/mkinitcpio-btrfs.tar.gz
tar axf mkinitcpio-btrfs.tar.gz
echo "Now you have to: - install mkinitcpio-btrfs"
echo "                 - deal with fstab"
echo "                 - deal with syslinux.cfg"
echo "Read the comments in the script file for info."
chroot $MOUNTDIR /bin/bash

# Now we have to install mkinitcpio-btrfs, by hand
# cd tmp/aur/mkinitcpio-btrfs
# makepkg --asroot -s
# pacman -U ....pkg.tar.xz

# chroot $MOUNTDIR mkinitcpio -p linux

# deal with fstab: see the fstab file for example
# deal with syslinux.cfg: APPEND root=/dev/sda1 rw rootflags=subvol=__active
