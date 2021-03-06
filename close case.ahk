#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#SingleInstance force

; Vind het monitor nummer
GetCurrentMonitor()
{
  SysGet, numberOfMonitors, MonitorCount
  WinGetPos, winX, winY, winWidth, winHeight, A
  winMidX := winX + winWidth / 2
  winMidY := winY + winHeight / 2
  Loop %numberOfMonitors%
  {
    SysGet, monArea, Monitor, %A_Index%
    if (winMidX > monAreaLeft && winMidX < monAreaRight && winMidY < monAreaBottom && winMidY > monAreaTop)
      return A_Index
  }
  SysGet, primaryMonitor, MonitorPrimary
  return "No Monitor Found"
}

; Vind resolutie van gegeven monitor
FindRes(Monnumb)
{
SysGet, BoundingCoordinates, Monitor, Monnumb
global ResolutionWidth := BoundingCoordinatesRight - BoundingCoordinatesLeft
global ResolutionHeight := BoundingCoordinatesBottom - BoundingCoordinatesTop
}

; Geef correcte click coordinaten door
SetClickCoordinates(ResolutionWidth, ResolutionHeight)
{
if (ResolutionWidth = 1920 && ResolutionHeight = 1080)
{
global Click1a := 1840
global Click1b := 780
global Click2a := 320
global Click2b := 278
global Click3a := 960
global Click3b := 315
}
else if (ResolutionWidth = 2256 && ResolutionHeight = 1504)
{
global Click1a := 2185
global Click1b := 1079
global Click2a := 385
global Click2b := 391
global Click3a := 1164
global Click3b := 471
}
else
{
MsgBox Deze resolutie wordt(nog)niet standaard ondersteund. Gebruik aub de configureerbare versie.
ExitApp
}
}


#IfWinActive ahk_exe clarify.exe  ;  hotkeys werken enkel in clarify

; muis 2 (forward) of F2 voor case t&i
xButton2::
F2::
MNumb := GetCurrentMonitor()
FindRes(MNumb)
SetClickCoordinates(ResolutionWidth, ResolutionHeight)
Click, %Click1a% %Click1b%
Click, %Click2a% %Click2b%
Send, {Home}
Send, {tab}
Send, t
Send, {tab}
Send, j
Click, %Click3a% %Click3b%
Send, {End}
Send, {Enter}
return

; muis 1 (back) of F3 voor case idtv
XButton1::
F3::
MNumb := GetCurrentMonitor()
FindRes(MNumb)
SetClickCoordinates(ResolutionWidth, ResolutionHeight)
Click, %Click1a% %Click1b%
Click, %Click2a% %Click2b%
Send, {Home}
Send, {tab}
Send, i
Send, {tab}
Send, j
Click, %Click3a% %Click3b%
Send, {End}
Send, {Enter}
return

; muiswiel en F4 voor case admin(billing)
MButton::
F4::
MNumb := GetCurrentMonitor()
FindRes(MNumb)
SetClickCoordinates(ResolutionWidth, ResolutionHeight)
Click, %Click1a% %Click1b%
Click, %Click2a% %Click2b%
Send, {Home}
Send, {tab}
Send, a
Send, {tab}
Send, j
Click, %Click3a% %Click3b%
Send, {End}
Send, {Enter}
return
return

; case id naar klembord
F7::
Send, ^+y
Send, {tab}
Send, {tab}
Send, ^c
Send, {tab}
Send, {tab}
Send, {tab}
Send, {Enter}
return