; A AHK Script that calls the Windows API for cascading the Windows. This feature was removed in Windows 11, for no reason.
; https://learn.microsoft.com/en-us/windows/win32/api/winuser/nf-winuser-cascadewindows

#C:: ; This binds the DLL Call to Windows Key + C keyboard shorcut.
DllCall( "CascadeWindows", uInt,0, Int,4, Int,0, Int,0, Int,0 )
return