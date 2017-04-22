Program P120408c;   {Get Mouse Position}
Uses Crt,Dos,Graph;
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

Procedure GetMousePosition(Var XMouse,YMouse: integer);
Begin
 reg.ax:=$0003;
 intr($33,reg);
 XMouse:=reg.cx; YMouse:=reg.dx;
End;

Begin
 Gd:=Detect;
 InitGraph(Gd,Gm,'');
 InitMouse;
 ShowMouse;
 Repeat
   GetMousePosition(XMouse,YMouse);
   If (XMouse<>x)or(YMouse<>y) then
   begin
      Setcolor(16);
      Str(x,S1); Str(y,S2);
      Outtextxy(x,y, S1+':'+S2);
      Setcolor(15);
      Str(XMouse,S1);
      Str(YMouse,S2);
      Outtextxy(XMouse,YMouse, S1+':'+S2);
      x:=XMouse; y:=YMouse;
   end;
 Until KeyPressed;
 CloseGraph;
End.