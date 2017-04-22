Program P120417;    {Kiem tra viec re chuot}
Uses Crt,Dos,Graph;
Var  reg: registers;
     Gd,Gm: integer;
     xd,yd,xc,yc: integer;
     c: char;
     s1,s2,s3,s4: string;

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

Procedure GetMousePosition(Var xmouse,ymouse: integer);
Begin
 reg.ax:=$0003;
 intr($33,reg);
 xmouse:=reg.cx;
 ymouse:=reg.dx;
End;

Procedure HideMouse;
Begin
 reg.ax:=$0002;
 intr($33,reg);
End;

Function MouseClick: char;
Var n: char;
Begin
 reg.ax:=$0003;
 intr($33,reg);
 n:='A';
 If (reg.bx and 1)=1 then n:='L';
 If (reg.bx and 2)=2 then n:='R';
 MouseClick:=n;
End;

BEGIN
 Gd:=Detect;
 InitGraph(Gd,Gm,'c:\tp70\bgi');
 InitMouse;
 ShowMouse;
 SetColor(14);
 Repeat
   c:=MouseClick;
   If c='L' then
   begin
     ClearDevice;
     GetMousePosition(xd,yd);
     HideMouse;
     Str(xd,s1); Str(yd,s2);
     OutTextxy(xd,yd,s1+':'+s2);
     ShowMouse;
     While MouseClick='L' do;
     GetMousePosition(xc,yc);
     HideMouse;
     Str(xc,s3); Str(yc,s4);
     OutTextxy(xc,yc,s3+':'+s4);
     ShowMouse;
   end;
 Until c='R';
 CloseGraph;
END.