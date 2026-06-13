---
title: "Ubuntu 26.04 on Dell Inspiron 14 Plus 7441 (Snapdragon)"
date: 2026-06-13T08:01:24-07:00
draft: false
---

Ubuntu on Snapdragon X devices has been a long way coming. Getting it working on my Dell Inspiron 14 Plys (7441), was a fairly easy task. Thanks to improvements like **Stubble**, Secure Boot works as well. Here are the basics on getting Ubuntu 26.04 installed. Be sure to read through the whole guide before proceeding.

## Before Installation

Before installing Ubuntu, you'll need to perform a couple tasks within Windows.

- Using **Disk Management** shrink your Windows partition to make room for Ubuntu
- Create a tar file of `C:\Windows\system32\DriverStore\FileRepository` and transfer to a USB stick or network share. From Ubuntu, you'll extract the firmware needed for Video, Audio, etc.
- Make sure you have a copy of your Bitlocker Recovery Key handy. You may be prompted for it the first couple times you boot back into Windows.

## Installation

1. Insert the USB stick containing the installer image
2. Spam F12, until you get a boot menu option. Pick the USB stick.
3. Go through the setup wizard. Don't wipe the disk.
4. Once the install has finished, boot into Ubuntu.
5. Transfer the tar of FileRepository to your system. Then, extract it.
6. Install the firmware tool, `sudo apt install qcom-firmware-extract`
7. Extract the firmware, `sudo qcom-firmware-extract -d /full/path/to/FileRepository`
8. Reboot.

Once the system comes back up, the following should be working:

- Battery indicator
- Fan shouldn't be screaming
- Sound
- Webcam
- Graphics should perform better

## Issues

- GRUB generates a lockdown error for devicetree. This is a non-issue, other than a need to hit the Enter key.
- The **Resources** app shows the wrong number of CPU cores
- `/proc/cpuinfo` shows a bogus value for BogoMIPS
- Hibernate doesn't work.
