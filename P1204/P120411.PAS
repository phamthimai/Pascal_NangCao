Program P120411;           {Cac hinh vuong doi mau}
Uses  Crt,Dos,Graph;
Const w=20; x0=200; y0=100;
Var   reg: registers;
      XMouse,YMouse,Gd,Gm,i,j: integer;
      a: array [0..9, 0..9] of byte;

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

Procedure GetMousePosition(Var XMouse,YMouse: integer);
Begin
 reg.ax:=$0003;
 intr($33,reg);
 XMouse:=reg.cx;
 YMouse:=reg.dx;
End;

BEGIN
 Gd:=Detect;
 InitGraph(Gd,Gm,'');
 SetFillStyle(1,11);
 Bar(x0,y0,x0+10*w-1,y0+10*w-1);
 InitMouse;
 ShowMouse;
 Repeat
   GetMousePosition(XMouse,YMouse);
   If (XMouse>=x0)and(XMouse<x0+10*w)and(YMouse>=y0)and(YMouse<y0+10*w)
                  and(MouseClick='L') then
   begin
     j:=(XMouse-x0)div w; i:=(YMouse-y0)div w;
     If a[i,j]<>4 then a[i,j]:=4 Else a[i,j]:=11;
     SetFillStyle(1,a[i,j]);
     HideMouse;
     Bar(x0+j*w,y0+i*w,x0+(j+1)*w-1,y0+(i+1)*w-1);
     ShowMouse;
     Delay(300);
   end;
 Until MouseClick='R';
 CloseGraph;
END.