Program Show_Text_Mouse;
Uses Dos;
var reg: registers;

Procedure InitMouse;
Begin
 reg.ax:=$0000;
 intr($33,reg);
End;

Procedure ShowMouse;
Begin
 reg.ax:=$0001;
 intr($33,reg);
End;

Begin
 Initmouse;
 Showmouse;
 Readln;
End.