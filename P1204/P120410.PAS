Program P120410;     {MouseClick}
Uses Dos,Graph;
Var  reg: registers;
     XMouse,YMouse,Gd,Gm,x,y: integer;
     S1,S2: string[11];

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

Procedure HideMouse;
Begin
 reg.ax:=$0002;
 intr($33,reg);
End;

Procedure GetMousePosition(Var Xmouse,YMouse: integer);
Begin
 reg.ax:=$0003;
 intr($33,reg);
 XMouse:=reg.cx;
 YMouse:=reg.dx;
End;

Function MouseClick: char;
Var n: char;
Begin
 reg.ax:=$0003;
 intr($33,reg);
 If (reg.bx and 1)=1 then n:='L';
 If (reg.bx and 2)=2 then n:='R';
 MouseClick:=n;
End;

BEGIN
 Gd:=Detect;
 InitGraph(Gd,Gm,'c:\turbo');
 InitMouse;
 ShowMouse;
 Repeat
   GetMousePosition(XMouse,YMouse);
   If MouseClick='L' then
   begin
     HideMouse;
     Setcolor(16);
     Str(x,S1); Str(y,S2);
     Outtextxy(x,y, S1+':'+S2);
     Setcolor(15);
     Str(XMouse,S1); Str(YMouse,S2);
     Outtextxy(XMouse,YMouse, S1+':'+S2);
     x:=XMouse; y:=YMouse;
     ShowMouse;
   end;
 Until MouseClick='R';
 CloseGraph;
END.