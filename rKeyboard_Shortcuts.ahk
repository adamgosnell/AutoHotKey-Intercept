;-----------------------
;                       
;    On script start    
;                       
;-----------------------

;----AHK Recommended Settings----
#NoEnv                                                  ; For performance and compatibility with future AutoHotkey releases.
SetWorkingDir %A_ScriptDir%                             ; Ensures a consistent starting directory.

;----Settings----
#SingleInstance force                                   ; On script's reload, kill the first instance.
SetNumLockState, AlwaysOn                               ; NumLock always on.
#Hotstring, SI                                          ; Send hotstrings using "SendInput," faster.
#InstallKeybdHook

;----Standard Variables----
FormatTime, CurrentTime,, Time
FormatTime, CurrentShortDate,, MM/dd/yyyy
FormatTime, CurrentLongDate,, LongDate

;----Intercept----                                      ; Intercept distinguishes inputs from 1st- and 2nd-keyboards.
Process, Close, intercept.exe                           ; It intercepts (mostly 2nd-keyboard) hotkeys and replaces them with F12+hotkey. 
Sleep, 200
SetWorkingDir D:\Hotkeys_and_Keyboards\intercept\intercept\
Run D:\Hotkeys_and_Keyboards\intercept\intercept\intercept.exe /apply
WinWait D:\Hotkeys_and_Keyboards\intercept\intercept\intercept.exe
WinHide D:\Hotkeys_and_Keyboards\intercept\intercept\intercept.exe

;----AHK Startup Image----                              ; AHK logo on script start, FYI
SplashImage, D:\Hotkeys_and_Keyboards\AutoHotkeyLogoSplash.jpg, B
Sleep, 800
SplashImage, Off
return

;------------------
;                  
;    Hotstrings    
;                  
;------------------

;----Everyday Use----
::.h::Hi!{Enter}{Enter}{Enter}I hope you're doing well. 
::.b::Hi{!} Just making sure you saw this. 
::.b2::Hey{!} What's the progress on this? 
::.b3::I've reached out a couple times, but haven't heard back yet. Would it make sense to get back to you on this next week? 
::.tys::Thank you, sir{!} 
::.clo::clockout
::.p::                                                  ; my phone number, (XXX) XXX - XXXX 
::.comment::[-----------------------------------------------------A] ; this is an indicator I use for spacing the comments the way I like them. 
::.mp::Morning Prayer
::.ep::Evening Prayer
:*:--::—                                                ; replaces double hyphens with an em-dash

;----Clients----                                        ; abbreviations for my clients, redacted

;----Ministry Partner Development----                   ; hotstrings I use for Ministry Partner Development, redacted

;----Common Mistakes----                                ; at least now we know I'm not redacting out of pride... 
::counselling::counseling

;----Dates or Times----
::.t::
    SendInput %CurrentTime%{Space} 
    return
::.d::
    SendInput %CurrentShortDate%{Space} 
    return
::.dd::
    SendInput, %CurrentLongDate%{Space}
    return

;---------------
;               
;    Hotkeys    
;               
;---------------

;----Autoformat Times on Numpad----
$NumLock::                                              ; Because Numlock is always on (see above), I use the numlock key as a hotkey, single-press is "AM" formatting, double press is "PM"
	KeyWait, NumLock, T0.1
	if (ErrorLevel)
	{
		MsgBox Long press of NumLock
		Return
	} else {
		KeyWait, NumLock, D T0.1
		if (ErrorLevel)
		{
			SendInput, {Left}
			SendInput, {Right}
			SendInput, {Enter}
			SendInput, {Left}{Left}
			SendInput, :
			SendInput, {Down}{Right}
			SendInput, {Space} AM
			SendInput, {Tab}
			Return
		} else {
			SendInput, {Left}
			SendInput, {Right}
			SendInput, {Enter}
			SendInput, {Left}{Left}
			SendInput, :
			SendInput, {Down}{Right}
			SendInput, {Space} PM
			SendInput, {Tab}
			Return
		}
	}
	KeyWait, NumLock
	return
SC121::                                                 ; This is a key that comes automatically on my 3rd numberpad, I moved it here b/c (a) I don't know how to wrap it with intercept, and (b) because there's no danger in mispressing it without intercept. 
	Msgbox 3rd numpadCalc
	return

;----Handling 2nd-Numpad's 00----                       ; My second numberpad has a 00 key that actually just presses 0 twice really fast, so I couldn't incorporate it into intercept. You'll see, I actually intercept my regular 0 key (below)
#MaxThreadsPerHotkey 5                                  ; $Numpad0's routine can run overlappingly.
$Numpad0::                                              ; The $-prefix forces use of the "keyboard hook", slower but more malliable method for hotkeyying.
    #MaxThreadsPerHotkey 1                              ; Placing this in the routine means that the hotkey cannot call itself. 
    SetBatchLines, 100                                  ; Make the routine run a little faster in this case.
    DelayBetweenKeys = 30                               
    If A_PriorHotkey = %A_ThisHotkey% 
	{                                                   ; If 0 is entered TWICE...
        If A_TimeSincePriorHotkey < %DelayBetweenKeys% 
		{                                               ; ... within the delay, run Super Mario (my son loves it)
            SplashImage F:\NES Nintendo\NintendoLogo_small.png, B
			Sleep 1000
			SplashImage Off
			Run, F:\NES Nintendo\Mesen.exe
			WinWait, Mesen, , 3
			WinActivate, Mesen
			Sleep, 500                                  ; This seems to be an error point, we can adjust this later if things don't work.
			Send ^o
			SendInput, Super Mario Bros (1985).nes{Enter}
			CalledReentrantly = y                  
            return
        }                                               ; this closes the "A_TimeSincePriorHotkey < %DelayBetweenKeys%..." section.
    }                                                   ; this closes the "if A_PriorHotkey = %A_ThisHotkey%..." section.
    CalledReentrantly = n                               ; If 0 is entered ONCE...
    Sleep, %DelayBetweenKeys%                           ; Sleep for the delay. (During this sleep, the Numpad 0 may be pressed again, in a different "thread.")
    If CalledReentrantly = y 
	{                                                   ; If, during the sleep, another thread changed this variable, it's the first part of a double-press, not a single-press.
        CalledReentrantly = n                           ; ... so hide the first press from the system.
        return                                          
    }
    Run [...]                                           ; If 0 is entered ONCE, open [redacted, Google Doc]
    ToolTip, Read_Me                                    
    SetTimer, RemoveToolTip, 1000
    return                                              

;----2nd-Numpad----                                     ; Almost all of these keys are intercepted with intercept (*wink*), keymap.ini wraps them in F22
#if (getKeyState("F22", "P"))                           ; If this keystroke was intercepted from the 2nd-keyboard (and now F22 is pressed).
F22::return
Numpad0::                                               ; Standard input, hotkey use of Numpad0 and Numpad00 dealt with above.
    SendInput, 0
	return
NumpadDot::                                             ; Unhides the intercept window (so I can see when things are getting pressed), and opens the AHK script to edit
	toggleEdit:=!toggleEdit                             ; this works on a basic toggle, press once to edit, press again to hide things and reload AHK script
    if toggleEdit 
	{
        WinShow, D:\Hotkeys_and_Keyboards\intercept\intercept\intercept.exe    
		Edit, D:\Hotkeys_and_Keyboards\Keyboard_Shortcuts.ahk
    } else {
		WinHide, D:\Hotkeys_and_Keyboards\intercept\intercept\intercept.exe
		WinActivate D:\Hotkeys_and_Keyboards\Keyboard_Shortcuts.ahk - Notepad++
		WinMenuSelectItem, A,,File, Save
		WinMenuSelectItem, A,,File, Exit
		Reload
    }
    return
NumpadEnter::                                           ; When I loaded intercept, I thought I was going to use enter, come to find out, I like it being a regular enter, so it's basically a passthrough
    Send, {Enter}
	return
Numpad1::
	Run, [...]                                          ; [redacted, Google Doc for logging my time]
	ToolTip, log 
	SetTimer, RemoveToolTip, 1000
	Return
Numpad2::                                               ; opens my gmail
    Run https://mail.google.com/
    ToolTip, gmail 
    SetTimer, RemoveToolTip, 1000
    return
Numpad3::                                               ; opens my Google Drive
    Run, https://drive.google.com
    ToolTip, drive 
    SetTimer, RemoveToolTip, 1000
    return
Numpad4::
    Run, [...]                                          ; Opens the spreadsheet I use for my budget and Ministry Partner Development
    ToolTip, FY20XX
    SetTimer, RemoveToolTip, 1000
    return
Numpad5::                                               ; Opens my baby monitor
	Run, "C:\Program Files (x86)\VideoLAN\VLC\vlc.exe"
    WinWait, VLC media player
    WinActivate, VLC media player
    WinWaitActive, VLC media player
    Send, ^n
    Send, {Enter}{Enter}
    WinWait, [rtsp://...] - VLC media player,, 3
	WinMove, [rtsp://...],,-1080, -420, 1075, 700
	CoordMode, Pixel, Screen                            ; I can't explain why screen makes more sense to me, it just does
	Loop                                                ; starts a loop, watches for a pixel color to turn 0x000000 before doing anything else
	{
		PixelGetColor, color, -1010, -281
		Continue
	} Until (color = 0x000000)
	WinMove, rtsp://192.168.1.220/live/ch0 - VLC media player,,-1080, -420, 1075, 700 ; this is a little sloppy, but it wouldn't resize it until it was loaded
	Return
Numpad6::                                               ; I admit to laziness
    Run, https://youtube.com
    ToolTip, youtube 
    SetTimer, RemoveToolTip, 1000
    return
Numpad7::                                               ; Runs Zoom, for video-meetings
    Run, [...]
    ToolTip, Zoom 
    SetTimer, RemoveToolTip, 1000
    return
Numpad8::                                               ; runs the calculator
    Run, C:\Windows\System32\calc.exe
    ToolTip, calculator 
    SetTimer, RemoveToolTip, 1000
    return
Numpad9::                                               ; I'm testing out Sublime Text 3 for notetaking and coding, you can use notepad or whatever instead too. 
	Run, D:\! - Notes\public\Working_Notes.md
	WinWait, D:\! - Notes\public\Working_Notes.md - Sublime Text (UNREGISTERED)
	WinMove, D:\! - Notes\public\Working_Notes.md - Sublime Text (UNREGISTERED), , -1056, 598, 1033, 776
;	GoSub, AutoSave                                     ; This is a dream I have. It's not done yet. We'll see.
	return
NumpadSub::                                             ; these are pretty self-explanatory
    SendInput, {Volume_Down 10}
    return
NumpadAdd::
    SendInput, {Volume_Up 10}
    return
NumLock::                                               ; Mutes the mic, see https://www.autohotkey.com/boards/viewtopic.php?t=15509
    SoundSet, +1, MASTER, mute, 11
    SoundGet, master_mute, , mute, 11
    ToolTip, Microphone %master_mute% 
    SetTimer, RemoveToolTip, 1000
    return
NumpadDiv::                                             ; this toggles between speakers and headphones using the nircmd program, https://www.nirsoft.net/utils/nircmd.html
    toggleOutput:=!toggleOutput
    If toggleOutput
	{
		Run nircmd setdefaultsounddevice "Speakers"
		Output = s ; this is helpful for the mute, later
	    ToolTip, Output: Speakers
        SetTimer, RemoveToolTip, 1000
    } else {
        Run nircmd setdefaultsounddevice "Headphones"
		Output = h ; this is helpful for the mute, later
	    ToolTip, Output: Headphones
        SetTimer, RemoveToolTip, 1000
    }
    return
NumpadMult::                                            ; this opens a gmail for my wife in an incognito window (so gmail will still take me straight to MINE!!)
    Run chrome.exe "https://mail.google.com/" " --incognito "
    WinWait Gmail - Google Chrome
    Sleep, 750
    WinActivate
    Send, [...]
    Sleep, 750 
    Send, [...]
    Send, {Enter} 
    return
SC00E::                                                 ; NumpadBackspace.
    Send, {Volume_Mute}
    return
#if  

;----3rd-Numpad----
#if (getKeyState("F23", "P"))                           ; this basically works the same way as the 2nd numberpad, but with F23 wrap instead of F22
F23::return
Numpad0::                                               ; I won't comment on all of these, but this is my placeholder until I find a function I want for the hotkey
	Msgbox 3rd numpad0
	return
NumpadDot::                                             ; part of the AHK kit, but MAD useful
	Run, C:\Program Files\AutoHotkey\WindowSpy.ahk
    ToolTip, WindowSpy
    SetTimer, RemoveToolTip, 1000
	return
NumpadEnter::                                           ; I'm a man of consistency. 
	SendInput {Enter}
	Return
Numpad1::                                               ; This clocks me out on my Google Doc Log
    Run chrome.exe "https://[...]" " --new-window"      ; Run Chrome in a new winder, direct to the Log
	ToolTip, clockout                                   ; tooltip
	SetTimer, RemoveToolTip, 1000                       ; set timer for tooltip removal subroutine
	WinRestore, .Log (asg+) - Google Sheets - Google Chrome ; un-maximize if (if needed)
	WinWait, .Log (asg+) - Google Sheets - Google Chrome ; Wait until it's loaded
	WinMove, .Log (asg+) - Google Sheets - Google Chrome,,-1080, -413, 1081, 946 ; Move it to the left screen, top half
	CoordMode, Pixel, Screen                            ; set the coordinate mode for pixels to by "screen" location
	Loop                                                ; start the loop
	{
		If (target_color=0xA4A19E)                      ; if the target pixel IS target_color (i.e. the Google Doc is loaded, based on the little folder icon)...
		{
			Break                                       ; and break the loop
		} Else {                                        ; if the target pixel IS NOT target_color
			PixelGetColor, target_color, -851, -277     ; get the target-pixel color again
			Continue                                    ; and run the loop again
		}
	}
	Sleep, 500                                          ; buffer
	SendInput, ^{Down}                                  ; go to the bottom of the frozen rows
	SendInput, ^{Down}                                  ; Got to the last row with an input
	SendInput, {Down}                                   ; start a new row
	SendInput, %CurrentShortDate%{Tab}{Tab}             ; put in the date (tab through the auto-generating day-of-the-week column)
	SendInput, 5:00 PM{Tab}                             ; enter time
	SendInput, -{Tab}                                   ; enter client name (n/a)
	SendInput, clockout{Enter}                          ; enter activity description
	Return
Numpad2::
	Msgbox 3rd numpad3
	return
Numpad3::
	Msgbox 3rd numpad3
	return
Numpad4::
	Msgbox 3rd numpad4
	return
Numpad5::
	Msgbox 3rd numpad5
	return
Numpad6::
	Msgbox 3rd numpad6
	return
Numpad7::
	Msgbox 3rd numpad7
	return
Numpad8::
	Msgbox 3rd numpad8
	return
Numpad9::
	Msgbox 3rd numpad9
	return
NumpadSub::
	Msgbox 3rd numpad-
	return
NumpadAdd::
	Msgbox 3rd numpad+
	return
; NumLock::                                             ; this is a dead button, Numpad 3 uses numlock mechanically, so "Numlock always on" doesn't work with it
NumpadDiv::
	Msgbox 3rd numpad/
	return
NumpadMult::
	Msgbox 3rd numpad*
	return
Esc::                                                   ; I use this until I have a whole page, then I print them, cut them out, and tape them to my keys like the OCD organizer I am
	SplashImage, D:\Hotkeys_and_Keyboards\AutoHotkeyNumpadShortcuts.png, B
	Sleep, 2000
	SplashImage, Off
	return
	return
Tab::
	Msgbox 3rd numpadTab
	return
SC00E::
	Msgbox 3rd numpadBackspace
	return
=::
	Msgbox 3rd numpadEqual
	return
#if

;----Subroutines----
AutoSave:                                               ; I haven't quite figured this out yet, so it's just chillin'
    ToolTip, Entered AutoSave Subroutine
    SetTimer, RemoveToolTip, 1000 
	If WinExist("ahk_class Notepad") 
	{
;		SetTimer, AutoSave, 5000 ; move to 60000 once I know it works
		return
	} else {
		SetTimer, AutoSave, Off
		return
	}
RemoveToolTip:                                          ; This is a subroutine called in basically every hotkey that removes the tooltip 
    SetTimer, RemoveToolTip, Off
    ToolTip
    return

;------------------------------
;                              
;    Long-Press ESC to Exit    
;                              
;------------------------------

;$Escape::                                              ; This is just a cool code I found, I used it some for some of my other keys
;    KeyWait, Escape, T0.5                              ; Wait for the Esc key to be released for 0.5 seconds (suppressing auto-repeat).
;    If ErrorLevel 
;	{                                                   ; If the key is still down.
;        WinGet, X, ProcessName, A                      ; Get the active process's name.
;        SplashTextOn,,150,,`nRelease button to close %x%`n`nKeep pressing it to NOT close window...
;        KeyWait, Escape, T3                             ; Wait for the Esc Key to be released for 3 seconds.
;        SplashTextOff
;        If !ErrorLevel 
;		{                                                ; No timeout, so key was released...
;            PostMessage, 0x112, 0xF060,,, A             ; ... so close window.
;            return
;        }                                               ; Otherwise,
;        KeyWait, Escape                                 ; Wait for button to be released...
;        return                                          ; ... then do nothing, send
;    }
;    Send {Esc}                                          ; ... a regular escape.
;    return                                              ;
