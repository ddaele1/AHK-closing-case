#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

#IfWinActive ahk_exe clarify.exe  ;  hotkeys werken enkel in clarify
; muis 2 (forward) of pijltje links voor case t&i
xButton2::
Left::
Click 1840 780
Click, 320 278
Send, {Home}
Send, {tab}
Send, t
Send, {tab}
Send, j
Click, 960 315
Send, {End}
Send, {Enter}
return

; muis 1 (back) of pijltje rechts voor case idtv
XButton1::
Right::
Click 1840 780
Click, 320 278
Send, {Home}
Send, {tab}
Send, i
Send, {tab}
Send, j
Click, 960 315
Send, {End}
Send, {Enter}
return

; muiswiel en pijltj omhoog(of omlaag) voor case admin(billing)
MButton::
Up::
Down::
Click 1840 780
Click, 320 278
Send, {Home}
Send, {tab}
Send, a
Send, {tab}
Send, j
Click, 960 315
Send, {End}
Send, {Enter}
return
