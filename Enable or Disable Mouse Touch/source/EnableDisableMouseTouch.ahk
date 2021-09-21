; This program is used to enable or disable the mouse touch, created to avoid accidental touch on mousepad during touch typing practice

!s::
KeyWait Alt
BlockInput, MouseMove
return

!e::
KeyWait Alt
BlockInput, MouseMoveOff