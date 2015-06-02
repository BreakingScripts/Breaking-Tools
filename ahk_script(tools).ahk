#IfWinActive, Path of Exile
menu, tray, add ; Insipired by @Sanctus, futher optimization and Garena.Poe support by @BreakingScripts.
menu, tray, add, Windowed (Borders), Border
menu, tray, add, Windowed (Borderless), Borderless
Menu, Tray, Tip, F1: /oos`nF2: /remaining`nF3: /itemlevel`nF4: logout`nF5: /hideout`nF6: auto logout\pots`nF7: reload script`nF8: Terminate Script
;i = bordertop+bottom, j = borderleft+right, l=bordertop, k=borderleft
toggle = 0
IniRead, i, borderonoff.ini, border, i
IniRead, j, borderonoff.ini, border, j
IniRead, k, borderonoff.ini, border, k
IniRead, l, borderonoff.ini, border, l
return

F4::
BlockInput On
SendInput, 112234
SendInput, {Enter}
Sleep 2
SendInput, {/}exit
SendInput, {Enter}
BlockInput Off
return

F6::
WinGetPos,,, w, h, A
HX := % Round(127 / (1920 / (w - i))) + l
HY := % Round(983 / (1080 / (h - j))) + k
CX := % Round(16 / (1920 / (w - i))) + l
CY := % Round(882 / (1080 / (h - j))) + k
PixelGetColor, hpcolor , %HX%, %HY%
PixelGetColor, hpcolorrgb , %HX%, %HY%, RGB
PixelGetColor, chaticon , %CX%, %CY% 
PixelGetColor, chaticonrgb , %CX%, %CY%, RGB
OBX := % Round(4 / (1920 / (w - i))) + l
OBY := % Round(873 / (1080 / (h - j))) + k
OBXX := % Round(25 / (1920 / (w - i))) + l
OBYY := % Round(894 / (1080 / (h - j))) + k
DHX := % Round(60 / (1920 / (w - i))) + l
DHY := % Round(872 / (1080 / (h - j))) + k
DHXX := % Round(170 / (1920 / (w - i))) + l
DHYY := % Round(972 / (1080 / (h - j))) + k
HQX := % Round(60 / (1920 / (w - i))) + l
HQY := % Round(872 / (1080 / (h - j))) + k
HQXX := % Round(170 / (1920 / (w - i))) + l
HQYY := % Round(991 / (1080 / (h - j))) + k

gui, new
gui, Default
gui, +LastFound +LabelMyGui
gui, add, groupbox, w205 h100, Colors:
gui, add, text, yp+25 xp+10, Test Color:
gui, add, Progress, xp+80 yp-5 w100 h20 c%chaticonrgb%,100
gui, add, text, yp+25 xp-80, HP Color:
gui, add, Progress, xp+80 yp-5 w100 h20 c%hpcolorrgb%,100
gui, add, button, xp-80 yp+25 w25 h25 gDone, OK
gui, show,, Cheater ebanii
Loop {
IfWinActive, Path of Exile
{
	;Chat icon color finder for color test.
	PixelSearch, FoundoX, FoundoY, %OBX%, %OBY%, %OBXX%, %OBYY%, %chaticon%, 10, Fast
	if ErrorLevel = 0
	{
		;Pots on ~50% hp.
		PixelSearch, FoundhX, FoundhY, %DHX%, %DHY%, %DHXX%, %DHYY%, %hpcolor%, 10, Fast
		if ErrorLevel = 1
		{
			SendInput, 12
		}
		;Autoquit on ~35% hp.
		PixelSearch, FoundhX, FoundhY, %HQX%, %HQY%, %HQXX%, %HQYY%, %hpcolor%, 10, Fast
		if ErrorLevel = 1
		{
			BlockInput On
			SendInput, 112234
			SendInput, {Enter}
			Sleep 2
			SendInput, {/}exit
			SendInput, {Enter}
			Sleep 5
			BlockInput Off
		}
	}
}
Sleep, 100
}
return

Border:
MsgBox, Windowed (Borders all around)
;For Windowed (with Borders all round)
i = 16
j = 38
l = 8
k = 30
IniWrite, %i%, borderonoff.ini, border, i
IniWrite, %j%, borderonoff.ini, border, j
IniWrite, %l%, borderonoff.ini, border, l
IniWrite, %k%, borderonoff.ini, border, k
return

Borderless:
MsgBox, Borderless (No Borders)
;For Fullscreen Borderless
i = 0
j = 0
l = 0
k = 0
IniWrite, %i%, borderonoff.ini, border, i
IniWrite, %j%, borderonoff.ini, border, j
IniWrite, %l%, borderonoff.ini, border, l
IniWrite, %k%, borderonoff.ini, border, k
return

Done:
gui,submit,nohide
gui, destroy
return

F1::
BlockInput On
SendInput, {Enter}
sleep, 20
SendInput, {/}oos
SendInput, {Enter}
BlockInput Off
return

F2::
BlockInput On
SendInput, {Enter}
Sleep 2
SendInput, {/}remaining
SendInput, {Enter}
BlockInput Off
return

F3::
BlockInput On
MouseClick, Left
SendInput, {Enter}
SendInput, {/}itemlevel
SendInput, {Enter}
Sleep, 100
MouseClick, Left
BlockInput Off
return

F5::
BlockInput On
SendInput, {Enter}
Sleep 2
SendInput, {/}hideout
SendInput, {Enter}
BlockInput Off
return

F7::Reload
F8::ExitApp 