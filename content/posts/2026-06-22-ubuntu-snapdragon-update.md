---
title: "Ubuntu on Snapdragon Update"
date: 2026-06-22T19:36:01-07:00
---

On UEFI systems, Ubuntu uses `stubble` to load the device tree. However, it still ships `flash-kernel` in case you want to use it. This normally wouldn't be an issue, but if you have SecureBoot enabled, this causes an error message in GRUB that must be dismissed with the Enter key. Removing `flash-kernel` prevents the error message.

```bash
sudo rm -rf /boot/dtb*
sudo update-grub
sudo apt purge flash-kernel
```
