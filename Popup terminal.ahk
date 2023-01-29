#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

i::ToggleTerminal()

ShowAndPositionTerminal()
{
    WinShow ahk_class ahk_class ConsoleWindowClass
    WinActivate ahk_class ahk_class ConsoleWindowClass

    SysGet, WorkArea, MonitorWorkArea
    TerminalWidth := A_ScreenWidth * 0.9
    if (A_ScreenWidth / A_ScreenHeight) > 1.5 {
        TerminalWidth := A_ScreenWidth * 0.6
    }
    WinMove, ahk_class ahk_class ConsoleWindowClass,, (A_ScreenWidth - TerminalWidth) / 2, WorkAreaTop - 2, TerminalWidth, A_ScreenHeight * 0.5,
}

ToggleTerminal()
{
    WinMatcher := "ahk_class ahk_class ConsoleWindowClass"

    DetectHiddenWindows, On

    if WinExist(WinMatcher)
    ; Window Exists
    {
        DetectHiddenWindows, Off

        ; Check if its hidden
        if !WinExist(WinMatcher) || !WinActive(WinMatcher)
        {
            ShowAndPositionTerminal()
        }
        else if WinExist(WinMatcher)
        {
            ; Script sees it without detecting hidden windows, so..
            WinHide ahk_class ahk_class ConsoleWindowClass
            Send !{Esc}
        }
    }
    else
    {
        Run "C:\Windows\System32\cmd.exe"
        Sleep, 1000
        ShowAndPositionTerminal()
    }
}