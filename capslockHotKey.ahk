; Setup for using capslock as a hotkey with #HotIf
; Makes capslock do nothing, but can use shift + capslock to toggle as normal
; Must run before other scripts

#Requires AutoHotkey v2.0
#SingleInstance
#NoTrayIcon
SendMode "Input" ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir A_InitialWorkingDir  ; Ensures a consistent starting directory.

+CapsLock::
{
	SetCapsLockState !GetKeyState("CapsLock", "T")
	return
}

#InputLevel 1
CapsLock::return
