#Requires AutoHotkey v2.0
SendMode "Input" ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir A_ScriptDir  ; Ensures a consistent starting directory.
#SingleInstance

QuickNotePath := IniRead("_config.ini", "config", "QuickNotePath")

MakeGui()
{
	MyGui := Gui()
	MyGui.Opt("+Resize -MaximizeBox -MinimizeBox")
	MyGui.Add("Text", "x32 y16 w212 h38" , "Create quick note`nAlt + S to save")
	MyGui.AddEdit("x32 y49 w410 h150 vNote")
	MyGui.Add("Button", "x363 y210 w82 h30",  "&Save").OnEvent("Click", ButtonSave)
	MyGui.Add("Button", "x262 y210 w82 h30" , "&Cancel").OnEvent("Click", ButtonCancel)
	MyGui.OnEvent("Escape", OnEscape)
	MyGui.Title := "Quick Note"
	MyGui.Show("x327 y207 h265 w479")
}

ButtonSave(ButtonCtrlObj, Info)
{
	NoteGui := ButtonCtrlObj.Gui
	Saved := NoteGui.Submit()
	NoteDate := FormatTime(, "dd/MM/yy HH:mm")
	if (StrLen(Saved.Note) > 0) {
		FileAppend
		(
		"---------------------`n" NoteDate "`n" Saved.Note "`n`n"
		), QuickNotePath
	}
	NoteGui.Destroy()
}

ButtonCancel(ButtonCtrlObj, Info)
{
	NoteGui := ButtonCtrlObj.Gui
	NoteGui.Destroy()
}

OnEscape(EventGui){
	EventGui.Destroy()
}

#HotIf GetKeyState("Capslock", "P")
q::MakeGui()
;Show note file
!q::Run QuickNotePath

