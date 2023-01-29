#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#SingleInstance, Force

!+f::
	Run, ms-settings:network-airplanemode
	WinWait, Settings ahk_class ApplicationFrameWindow
	WinActivate, Settings ahk_class ApplicationFrameWindow
	WinWaitActive, Settings ahk_class ApplicationFrameWindow
	Sleep, 1000
	Send, {Space}
	WinClose, Settings ahk_class ApplicationFrameWindow
return