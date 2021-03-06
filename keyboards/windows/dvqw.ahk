#if (!WinActive("ahk_exe ahk_exe ubuntu.exe"))

; Use Scroll Lock to control keyboard ("off" is Dvorak)
; and do not let Control, Alt, or Win modifiers act on Dvorak
; PrintScreen::Suspend
~RWin::Suspend, On
~RWin UP::Suspend, Off
~LWin::
    Suspend, On
    duration := 0
    If (GetKeyState("LWin","p")) 
    {
        start := A_TickCount
        While (GetKeyState("LWin"))
            Sleep, 1
        duration := A_TickCount - start
    }
    if (duration > 500)
        Send {LWin}
    Return

~LWin UP::Suspend, Off
~Ctrl::Suspend, On
~Ctrl UP::Suspend, Off
~Alt::Suspend, On
~Alt UP::Suspend, Off

CapsLock::Enter
Enter::Backspace
Backspace::Esc
Esc::CapsLock

; QWERTY to Dvorak mapping
-::[
=::]

q::'
w::,
e::.
r::p
t::y
y::f
u::g
i::c
o::r
p::l
[::/
]::=

;a::a
s::o
d::e
f::u
g::i
h::d
j::h
k::t
l::n
`;::s
'::-

z::`;
x::q
c::j
v::k
b::x
n::b
;m::m
,::w
.::v
/::z

F7::
WinSet, AlwaysOnTop, Toggle, A
