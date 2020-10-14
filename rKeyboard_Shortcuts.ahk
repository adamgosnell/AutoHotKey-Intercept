;-----------------------
;                       
;    On script start    
;                       
;-----------------------

	;----AHK Recommended Settings----
		#NoEnv                                                  ; For performance and compatibility with future AutoHotkey releases.
		;SendMode Input                                         ; For new scripts due to its superior speed and reliability.
		SetWorkingDir %A_ScriptDir%                             ; Ensures a consistent starting directory.

	;----Settings----
		#SingleInstance force                                   ; On script's reload, kill the first instance.
		SetNumLockState, AlwaysOn                               ; NumLock always on.
		#Hotstring, SI                                          ; Send hotstrings using "SendInput," faster.

	;----Intercept----                                     		; Intercept distinguishes inputs from 1st- and 2nd-keyboards.
		Process, Close, intercept.exe                           ; It intercepts (mostly 2nd-keyboard) hotkeys and replaces them with F12+hotkey.
		Sleep, 200
		SetWorkingDir D:\Hotkeys_and_Keyboards\intercept\intercept\
		Run D:\Hotkeys_and_Keyboards\intercept\intercept\intercept.exe /apply
		WinWait D:\Hotkeys_and_Keyboards\intercept\intercept\intercept.exe
		WinHide D:\Hotkeys_and_Keyboards\intercept\intercept\intercept.exe

	;----AHK Startup Image----                              	; AHK logo on script start, FYI
		SplashImage, D:\Hotkeys_and_Keyboards\AutoHotkeyLogoSplash.jpg, B
		Sleep, 800
		SplashImage, Off
		Return

	;----Test transparent splash----
		SplashImageGUI(Picture, X, Y, Duration, Transparent = false)
		{
		Gui, XPT99:Margin , 0, 0
		Gui, XPT99:Add, Picture,, %Picture%
		Gui, XPT99:Color, ECE9D8
		Gui, XPT99:+LastFound -Caption +AlwaysOnTop +ToolWindow -Border
		If Transparent
		{
			Winset, TransColor, ECE9D8
		}
		Gui, XPT99:Show, x%X% y%Y% NoActivate
		SetTimer, DestroySplashGUI, -%Duration%
		return

		DestroySplashGUI:
		Gui, XPT99:Destroy
		return
		}

;------------------
;                  
;    Hotstrings    
;                  
;------------------

	;----Everyday Use----
		::.ad::[my address]
		::.h::Hi!{Enter}{Enter}{Enter}I hope you're doing well. 
		::.b::Hi{!} Just making sure you saw this. 
		::.b2::Hey{!} Circling back around on this. 
		::.b3::Hey{!} Just wanted to get this back on your radar.
		::.b4::I've reached out a couple times, but haven't heard back yet. Would it make sense to get back to you on this in a few weeks? 
		::.tys::Thank you, sir{!} 
		::.clo::clockout
		::.p::[my phone number]
		::.comment::[-----------------------------------------------------A]
		::.mp::Morning Prayer
		::.ep::Evening Prayer
		::.em::[my email]
		::.zss::
		:o:.s::asg{+}                                           ; I don't use this much, because I have a gmail sig, but I use it in my digital file titles
		:o:.(s::{(}asg{+}{)}
		:?*:--::—
		::.trip::Trip ____, Don't Schedule Anything
		::.tript::Trip Tomorrow, Don't Schedule Anything
		::.tripy::Trip Yesterday, Don't Schedule Anything
		::.ex::Exercise (until 12:35p), Lunch                   ; I use this in my Daily Log.
		::.start::
			FormatTime, CurrentShortDate,, MM/dd/yyyy
			Send, %CurrentShortDate%{Enter}{Enter}
			Send, {#} Getting Organized{Enter}_Survey:_{Enter}Gather everything in one source{Enter}Is it actionable? (trash, someday, reference){Enter}What's the next action? (project plans){Enter}Will it take less than two minutes (delegate, defer to cal, defer to to-do){Enter}_Prioritize To-Do:_{Enter}Reply to emails in 24 hours.{Enter}What projects will make me money?{Enter}What will get worse if I don't do it today?{Enter}{Enter}{#} To-Do{Enter}
			Return
		:o:1:1::One-on-One
		::.th::Thanks for your email.
		::.thk::Thanks for your kind email.
		::.=::Blessings,{Enter}
		::.may::May the souls of all the faithful departed, through the mercies of God, rest in peace.
		::.formal::
			FormatTime, CurrentLongDate,,MMMM d{,} yyyy
			Send, %CurrentLongDate%{Enter}{Enter}Adam Salter Gosnell{Enter}Executive Director{Enter}Gosnell Projects{Enter}[my email address]{Enter}[my phone number]{Enter}{Enter}
			Send, To{Enter}Position{Enter}Organization{Enter}Email{Enter}Phone{Enter}{Enter}TITLE
			Return
		::.memo::
			FormatTime, CurrentLongDate,,MMMM d{,} yyyy
			Send To{:}{Tab}{Tab}NN{Enter}{Tab}{Tab}POS{,} ORG{Enter}From{:}{Tab}{Tab}Adam Salter Gosnell{Enter}{Tab}{Tab}POS{,} ORG{Enter}Date{:}{Tab}{Tab}%CurrentLongDate%{Enter}Subject{:}{Tab}SUB
			Return
		::.top::
			Send, Adam Salter Gosnell{+}{Enter}
			Send, INSERTPOSITION{Enter}
			Send, INSERTORGANIZATION{Enter}
			FormatTime, CurrentLongDate,,MMMM d{,} yyyy
			Send, %CurrentLongDate%{Enter}{Enter}
			Return
		::.n::
			Send, NOTES{Enter}{Enter}{Enter}
			Send, ACCOUNT{Enter}{Enter}{Enter}
			Send, SUMMARY{Enter}{Enter}{Enter}
			Send, ASSESSMENT{Enter}{Enter}{Enter}
			Send, PLAN{Enter}{Enter}{Enter}
			Return
		::.pos::
			Send, [my current job title]
		::.examen::
			Send, GRATITUDE{Enter}{Enter}{Enter}
			Send, ASK FOR GRACE{Enter}{Enter}{Enter}
			Send, "DEMAND FROM YOUR SOUL AN ACCOUNT": THOUGHTS, WORDS, ACTIONS{Enter}{Enter}{Enter}
			Send, During this time I thought:{Enter}During this time I said:{Enter}During this time I acted:{Enter}Consolation (under the influence of the good spirit, moving towards God) or Desolation?{Enter}
			Send, ASK FOR FORGIVENESS{Enter}{Enter}{Enter}
			Send, RESOLVE AMENDMENT, WITH GOD'S HELP{Enter}{Enter}{Enter}
			Send, Close with the Our Father.
			Return
		::.j:: ; journal 
			Send, Adam Salter Gosnell{+}{Enter}
			Send, Personal Journal{Enter}
			Send, [LOCATION]{Enter}
			FormatTime, CurrentTime,, h:mm tt
			FormatTime, DayLongDate,,dddd{,} MMMM d{,} yyyy
			Send, %DayLongDate% @ %CurrentTime%{Enter Enter}
			Return
		::.x::✓
		::.checkin::Physically, Emotionally, Spiritually, Low Points, High Points
		::.checkinn::Physically, Emotionally, Professionally, Financially, Spiritually, Family

	;----Clients----

	;----Ministry Partner Development----
		::.meet::[N1], meet [N2]{Enter}[Where I met N2][N2 credentials][hook for reason to connect]{Enter}{Enter}[N2], meet [N1]{Enter}[Where I met N1][N1 credentials][hook for reason to connect]{Enter}{Enter}[suggestions about how to connect]
		::.back::Thanks for getting back to me{!} I really appreciate it. 
		::.oc::Of course. I understand entirely. 
		::.up::I'll add you to the update list{!}
		::.long::It's been a long time{!} I hope you're well. 
		::.fro::
			SendInput, First reach out
			Sleep, 200
			SendInput, {Tab}In 2 Days, 1 of 2
			Sleep 200
			SendInput, {Enter}
			Return
		::.clck::
			SendInput, Click for More
			SendInput, !{Enter}
			Return

	;----Common Mistakes----

	;----Dates or Times----
		::.t::
   		    FormatTime, CurrentTime,, h:mm tt
		    SendInput %CurrentTime%{Space} 
		    Return
		::.d::
		    FormatTime, CurrentShortDate,, MM/dd/yyyy
		    SendInput %CurrentShortDate%{Space} 
		    Return
		::.dy::
		    FormatTime, CurrentFileDate,, yyyyMMdd
		    SendInput %CurrentFileDate%{Space} 
		    Return
		::.dh::
		    FormatTime, CurrentHyphenDate,, MM-dd-yyyy
		    SendInput %CurrentHyphenDate%{Space} 
		    Return
		::.dd::
		    FormatTime, CurrentLongDate,,MMMM d{,} yyyy
		    SendInput, %CurrentLongDate%{Space}
		    Return

;---------------
;               
;    Hotkeys    
;               
;---------------

	;----Autoformat Times on Daily Log----
		$NumLock::
			KeyWait, NumLock, T0.1
			
			If (ErrorLevel)
			{
				MsgBox Long press of NumLock
				Return
			} Else {
				KeyWait, NumLock, D T0.1
				If (ErrorLevel)
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
				} Else {
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
		    Return
		$NumpadDot::
			KeyWait, NumpadDot, T0.075
			
			If (ErrorLevel)
			{
				SendInput, .
				Return
			} Else {
				KeyWait, NumpadDot, D T0.075
				If (ErrorLevel)
				{
					SendInput, .
					Return
				} Else {
					SendInput, :
					Return
				}
			}
			KeyWait, NumpadDot
		    Return
		SC121::
			;3rd numpad Calc
			WinActivate,, obs64
			SendInput, ^!+{F11}
			Return

	;----2nd-Numpad----
		#If (getKeyState("F22", "P"))                           ; If this keystroke was intercepted from the 2nd-keyboard (and now F12 is pressed).
		F22::Return
		Numpad0::                                               ; Standard input, hotkey use of Numpad0 and Numpad00 dealt with above.
		    Run [Read_Me URL]
		    ToolTip, Read_Me                                    
		    SetTimer, RemoveToolTip, 1000
		    Return
		NumpadDot::
			Reload
		    Return
		NumpadEnter::
		    Send, {Enter}
		    Return
		Numpad1::
		    Run chrome.exe "[Daily Log URL]" ; " --new-window" ; Run Chrome in a new window, direct to the Log
			ToolTip, log ; tooltip
			SetTimer, RemoveToolTip, 1000 ; set timer for tooltip removal subroutine
			Return
		Numpad2::
		    Run https://mail.google.com/
		    ToolTip, gmail 
		    SetTimer, RemoveToolTip, 1000
		    Return
		Numpad3::
		    Run, https://drive.google.com
		    ToolTip, drive 
		    SetTimer, RemoveToolTip, 1000
		    Return
		Numpad4::
		    Run, [URL to Financials Spreadsheet]
		    ToolTip, FY20XX
		    SetTimer, RemoveToolTip, 1000
		    Return
		Numpad5::
			Run, "D:\Wyze"
			WinWait, BlueStacks
			WinMove, -1080, -350
			Return
		Numpad6::
		    Run, https://youtube.com
		    ToolTip, youtube 
		    SetTimer, RemoveToolTip, 1000
		    Return
		Numpad7::
		    Run, C:\Program Files\obs-studio\bin\64bit\obs64.exe
		    Run, C:\Users\Adam Salter Gosnell\AppData\Roaming\Zoom\bin\Zoom.exe
		    ToolTip, zoom 
		    SetTimer, RemoveToolTip, 1000
		    Return
		Numpad8::
		    Run, C:\Windows\System32\calc.exe
		    ToolTip, calculator 
		    SetTimer, RemoveToolTip, 1000
		    Return
		Numpad9::
		    FormatTime, CurrentShortDate,, MM/dd/yyyy
			Run, "C:\Program Files\Sublime Text 3\sublime_text.exe" -n "D:\! - Notes\notebook.sublime-project"
			Run, D:\! - Notes\public\.Working_Notes.md
			WinWait, D:\! - Notes\public\.Working_Notes.md (notebook) - Sublime Text (UNREGISTERED)
			WinMove, D:\! - Notes\public\.Working_Notes.md (notebook) - Sublime Text (UNREGISTERED), , -1056, 598, 1033, 776
			; GoSub, AutoSave
		    Return
		NumpadSub::
		    SendInput, {Volume_Down 5}
		    Return
		NumpadAdd::
		    SendInput, {Volume_Up 5}
		    Return
		NumLock::
		    SoundSet, +1, MASTER, mute, 11
		    SoundGet, master_mute, , mute, 11
		    ToolTip, Microphone Mute %master_mute% 
		    SetTimer, RemoveToolTip, 1000
		    Return
		NumpadDiv::
		    toggleOutput:=!toggleOutput
		    If toggleOutput
			{
				Run nircmd setdefaultsounddevice "Speakers"
				Run nircmd setdefaultsounddevice "Speakers" 2
				Output = s ; this is helpful for the mute, later
			    ToolTip, Output: Speakers
		        SetTimer, RemoveToolTip, 1000
		    } Else {
		        Run nircmd setdefaultsounddevice "Headphones"
   				Run nircmd setdefaultsounddevice "Headphones" 2
				Output = h ; this is helpful for the mute, later
			    ToolTip, Output: Headphones
		        SetTimer, RemoveToolTip, 1000
		    }
		    Return
		NumpadMult::
		SC00E::                                                 ; NumpadBackspace.
		    Send, {Volume_Mute}
		    Return
		#if  

	;----3rd-Numpad----
		#if (getKeyState("F23", "P"))
		F23::Return
		Numpad0::
			Msgbox 3rd numpad0
			Return
		NumpadDot::
			Run, C:\Program Files\AutoHotkey\WindowSpy.ahk
		    ToolTip, WindowSpy
		    SetTimer, RemoveToolTip, 1000
			Return
		NumpadEnter::
			SendInput {Enter}
			Return
		Numpad1::
		Numpad2::
			Run, https://calendar.google.com/calendar/r
			ToolTip, Calendar
		    SetTimer, RemoveToolTip, 1000
			Return
		Numpad3::
		Numpad4::
			Run, https://open.spotify.com/
			ToolTip, music
		    SetTimer, RemoveToolTip, 1000
			Return
		Numpad5::
		Numpad6::
		Numpad7::
			Run, https://app.youneedabudget.com
			Return
		Numpad8::
			SendInput, ^+a
			Return
		Numpad9::
			Msgbox 3rd numpad9
			Return
		NumpadSub::
			Msgbox 3rd numpad-
			Return
		NumpadAdd::
			Msgbox 3rd numpad+
			Return
			; NumLock:: ; can we use this one on the third keyboard?
			;	Msgbox 3rd numLock
			;	return
		NumpadDiv::
			Msgbox 3rd numpad/
			Return
		NumpadMult::
			Msgbox 3rd numpad*
			Return
		SC00E::
			; 3rd numpadBackspace
			Msgbox, 3rd numpadBackspace
			Return
		Esc::
			SplashImage, D:\Hotkeys_and_Keyboards\AutoHotkeyNumpadShortcuts.png, B
			Sleep, 2000
			SplashImage, Off
			Return
		; 3rdnumpad Calc is above
		Tab::
			WinActivate,, obs64
			SendInput, ^!+{F12}
			Return
		=::
			toggleRiftS:=!toggleRiftS
		    If toggleRiftS
			{
				Run nircmd setdefaultsounddevice "Rift S Speakers"
				Run nircmd setdefaultsounddevice "Rift S Speakers" 2
		        Run nircmd setdefaultsounddevice "Rift S Microphone"		    	
		        Run nircmd setdefaultsounddevice "Rift S Microphone" 2
				Output = rifts ; this is helpful for the mute, later
			    ToolTip, Input and Output: Rift S
		        SetTimer, RemoveToolTip, 1000
		    } Else {
		        Run nircmd setdefaultsounddevice "Microphone"		    	
		        Run nircmd setdefaultsounddevice "Microphone" 2
		        Run nircmd setdefaultsounddevice "Headphones"
				Run nircmd setdefaultsounddevice "Headphones" 2
				Output = h ; this is helpful for the mute, later
			    ToolTip, Input: Boom / Output: Headphones
		        SetTimer, RemoveToolTip, 1000
		    }
		    Return
			Return
		#if

	;----Subroutines----
		RemoveToolTip:
		    SetTimer, RemoveToolTip, Off
		    ToolTip
		    Return
