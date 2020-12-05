; Windows 10 creates "File Open" dialogs at a default size that is small to use effectively
; and without "maximize window" button, all while simultaneously (and baffingly) 
; blocking input to anything else on the screen. (Why make the default size of the
; dialog unusably small if the rest of the screen isn't and can't be used for anything?)
;
; To add insult to injury, if users manually resize the dialogs to actually be able to
; read or select anything in them, the size preference only persists per program.
;  
; This program makes (most) "File Open dialogs" automatically maximize upon creation,
; sparing the user from manually click-dragging dialogs' borders until  
; "maximized" for each Windows program that can open files.

#NoEnv
#Persistent
#SingleInstance, Force

Loop {
	maximizeFileOpenDialog()
}

maximizeFileOpenDialog() {
	WinWaitActive ahk_class #32770
	WinGetActiveTitle, dialogTitle
	IfInString, dialogTitle, "Open"
	{
		WinMaximize ;
	}
	IfWinNotActive ahk_class #32770
	Return
}
