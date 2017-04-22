Program P120412;           {Co nhay}
Uses  Crt,Dos,Graph;
Const w=30; x0=220; y0=200;
      a: array [0..6] of shortint=(4,4,4,0,11,11,11);
Var   reg: registers;
      XMouse,YMouse,Gd,Gm,i: integer;

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

Function MouseClick: char;
Begin
 reg.ax:=$0003;
 intr($33,reg);
 If reg.bx=1 then MouseClick:='L';
 If reg.bx=2 then MouseClick:='R';
End;

Procedure GetMousePosition(Var Xmouse,Ymouse: integer);
Begin
 reg.ax:=$0003;
 intr($33,reg);
 XMouse:=reg.cx;
 YMouse:=reg.dx;
End;

Procedure Ve(i: integer);
Begin
 SetFillStyle(1, a[i]);
 HideMouse;
 Bar(x0+i*w,y0,x0+(i+1)*w-1,y0+w-1);
 ShowMouse;
End;

Procedure Nhay(i,j: integer);
Var tg: shortint;
Begin
 tg:=a[i]; a[i]:=a[j]; a[j]:=tg;
 Ve(i);
 Ve(j);
End;

BEGIN
 Gd:=Detect;
 InitGraph(Gd,Gm,'');
 SetFillStyle(1,4);
 For i:=0 to 6 do Ve(i);
 InitMouse;
 ShowMouse;
 Repeat
   GetMousePosition(XMouse,YMouse);
   If (XMouse>=x0)and(XMouse<x0+7*w)and(YMouse>=y0)and(YMouse<y0+w)
                  and(MouseClick='L') then
   begin
     i:=(XMouse-x0) div w;
     If (i>0)and(a[i-1]=0) then nhay(i,i-1);
     If (i>1)and(a[i-2]=0) then nhay(i,i-2);
     If (i<6)and(a[i+1]=0) then nhay(i,i+1);
     If (i<5)and(a[i+2]=0) then nhay(i,i+2);
     Delay(300);
   end;
 Until MouseClick='R';
 CloseGraph;
END.