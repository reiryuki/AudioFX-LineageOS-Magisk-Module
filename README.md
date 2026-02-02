# AudioFX LineageOS Magisk Module

## DISCLAIMER
- LineageOS apps and blobs are owned by LineageOS™.
- The MIT license specified here is for the Magisk Module only, not for LineageOS apps and blobs.

## Descriptions
- Equalizer sound effects ported from LineageOS ROM and integrated as a Magisk Module for all supported and rooted devices with Magisk
- Global type sound effect
- Conflicted with Samsung Sound Alive effect

## Sources
- LineageOS 21 Android 14 AP1A.240505.005 eng.build.20240512.192842
- libmagiskpolicy.so: Kitsune Mask R6687BB53

## Screenshots
- https://t.me/androidryukimodsdiscussions/27160

## Requirements
- Android 6 (SDK 23) and up
- Magisk or Kitsune Mask or KernelSU or Apatch installed

## Installation Guide & Download Link
- If you are using KernelSU, you need to disable Unmount Modules by Default in KernelSU app settings and install https://github.com/KernelSU-Modules-Repo/meta-overlayfs first
- Do not use AOSP Sound Effects Remover Magisk Module nor Samsung Sound Alive Magisk Module nor anything that disables your stock AOSP sound effects libraries.
- Install this module https://www.pling.com/p/1557380/ via Magisk app or Kitsune Mask app or KernelSU app or Apatch app or Recovery if Magisk or Kitsune Mask installed
- Install AML Magisk Module https://t.me/ryukinotes/34 only if using any other else audio mod module
- If you are in Samsung One UI/TouchWiz ROM, then you need to install Sound Alive Effect Remover (and AML) also: https://github.com/reiryuki/Sound-Alive-FX-Remover-Magisk-Module
- Reboot
- If you are using KernelSU, you need to allow superuser list manually all package name listed in package.txt (and your home launcher app also) (enable show system apps) and reboot afterwards
- If you are using SUList, you need to allow list manually your home launcher app (enable show system apps) and reboot afterwards
- If AudioFX doesn't work, then type:

  `su`
  
  `afx`
  
  at Terminal/Termux app while playing music
- If afx command triggers integrity failure in your ROM then you can use Xperia Music instead: https://github.com/reiryuki/Xperia-Music-Magisk-Module and choose Sound effects in the app

## Optionals
- Global: https://t.me/ryukinotes/35
- Stream: https://t.me/ryukinotes/52

## Troubleshootings
- https://t.me/ryukinotes/71
- Global: https://t.me/ryukinotes/34

## Support & Bug Report
- https://t.me/ryukinotes/54
- If you don't do above, issues will be closed immediately

## Credits and Contributors
- @HuskyDG
- https://t.me/viperatmos
- https://t.me/androidryukimodsdiscussions
- You can contribute ideas about this Magisk Module here: https://t.me/androidappsportdevelopment

## Sponsors
- https://t.me/ryukinotes/25


