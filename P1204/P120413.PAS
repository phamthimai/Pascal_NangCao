Program P120413;   {Bang chu nhat}
Uses  Crt,Dos,Graph;
Var   Gd,Gm: integer;
      reg: registers;
      a: array [1..2,1..3,1..2] of integer;

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

Procedure Ve_bang;
Var i,j: byte; xd,yd: integer;
Begin
 SetColor(7);
 xd:=240; yd:=190;
 For i:=0 to 1 do
 begin
   Line(xd,yd+i*50,xd+150,yd+i*50);
   For j:=0 to 2 do
   begin
     Line(xd+j*50,yd,xd+j*50,yd+100);
     a[i+1,j+1,1]:=xd+50*j; a[i+1,j+1,2]:=yd+50*i;
   end;
 end;
 Line(xd,yd+100,xd+150,yd+100); Line(xd+150,yd,xd+150,yd+100);
 SetFillStyle(1,1);  FloodFill(a[1,1,1]+1,a[1,1,2]+1,7);
 SetFillStyle(1,2);  FloodFill(a[1,2,1]+1,a[1,2,2]+1,7);
 Setfillstyle(1,3);  FloodFill(a[1,3,1]+1,a[1,3,2]+1,7);
 SetFillStyle(1,4);  FloodFill(a[2,1,1]+1,a[2,1,2]+1,7);
 SetFillStyle(1,15); FloodFill(a[2,2,1]+1,a[2,2,2]+1,7);
 SetFillStyle(1,5);  FloodFill(a[2,3,1]+1,a[2,3,2]+1,7);
End;

Procedure Tim(Var xa,ya,xt,yt: integer; m: byte);
Var i,j: byte;
Begin
 xt:=0;
 For i:=1 to 2 do
 For j:=1 to 3 do
   If Getpixel(a[i,j,1]+1,a[i,j,2]+1)=m then
   begin
     xa:=a[i,j,1]+1; ya:=a[i,j,2]+1;
     If (i>1)and(getpixel(a[i-1,j,1]+1,a[i-1,j,2]+1)=15) then
       begin xt:=a[i-1,j,1]+1; yt:=a[i-1,j,2]+1; exit; end;
     If (i<2)and(getpixel(a[i+1,j,1]+1,a[i+1,j,2]+1)=15) then
       begin xt:=a[i+1,j,1]+1; yt:=a[i+1,j,2]+1; exit; end;
     If (j>1)and(getpixel(a[i,j-1,1]+1,a[i,j-1,2]+1)=15) then
       begin xt:=a[i,j-1,1]+1; yt:=a[i,j-1,2]+1; exit; end;
     If (j<3)and(getpixel(a[i,j+1,1]+1,a[i,j+1,2]+1)=15) then
       begin xt:=a[i,j+1,1]+1; yt:=a[i,j+1,2]+1; exit; end;
     exit;
  end;
End;

Procedure Doi;
Var mau,xa,ya,xt,yt,xm,ym: integer;
Begin
 GetMousePosition(xm,ym);
 HideMouse;
 mau:=Getpixel(xm,ym);
 ShowMouse;
 If (mau=0)or(mau=7) then exit;
 Tim(xa,ya,xt,yt,mau);
 If xt=0 then exit;
 HideMouse;
 SetColor(mau);
 SetFillStyle(1,mau);
 FloodFill(xt,yt,7);
 SetFillStyle(1,15);
 FloodFill(xa,ya,7);
 ShowMouse;
End;

BEGIN
 Gd:=Detect;
 InitGraph(Gd,Gm,'');
 Ve_bang;
 InitMouse;
 ShowMouse;
 While true do
 begin
   reg.ax:=$0003;
   intr($33,reg);
   If (reg.bx and 1)=1 then Doi;
   If (reg.bx and 2)=2 then break;
 end;
 CloseGraph;
END.