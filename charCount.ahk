; Inspired by Skrommel's WhatColor script
; https://www.dcmembers.com/skrommel/download/whatcolor/

#Requires AutoHotkey v2.0
#SingleInstance
SendMode "Input" ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir A_InitialWorkingDir ; Ensures a consistent starting directory.

#HotIf GetKeyState("Capslock", "P")
c::
{
	ClipSaved := ClipboardAll()
	SendEvent "^c"
	cSelected := A_Clipboard
	Sleep 500
	A_Clipboard := ClipSaved
	charCount := StrLen(cSelected)
	wordCount := StrSplit(cSelected, A_Space).length

	; Loop so tooltip moves with mouse
	Loop 60 ; 60 iterations with Sleep 50 ~= 3 seconds
  {
		Sleep 50
		MouseGetPos &xpos,&ypos
		ToolTip("Char count: " charCount "`nWord count: " wordCount,,(ypos + 35))

		; On the last iteration close the tooltip
		if (A_Index == 60)
		{
			ToolTip()
		}
  }
}
