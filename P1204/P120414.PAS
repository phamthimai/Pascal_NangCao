Program P120414;  {Bieu dien duong di cua mot con hau}
Uses Crt,Dos,Graph;
Type ba=array [0..0] of byte;
     bap=^ba;
Var  reg: registers;
     Gd,Gm: integer;
     xHau,yHau,xHauL,yHauL: integer;
     a: array [1..8,1..8,1..2] of integer;
     ODen,OTrang,HauTrang,HauDen: bap;

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
 xmouse:=reg.cx; ymouse:=reg.dx;
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

Procedure CatHinh;
Begin
 SetColor(14); Rectangle(1,1,51,51);
 SetFillStyle(1,8);
 FloodFill(2,2,14);
 Getmem(ODen,ImageSize(1,1,51,51)); Getimage(1,1,51,51,ODen^);
 SetFillStyle(1,15); FloodFill(2,2,14);
 Getmem(OTrang,ImageSize(1,1,51,51)); Getimage(1,1,51,51,OTrang^);
 SetColor(2);
 Circle(26,26,20);
 SetFillStyle(1,4);
 FloodFill(26,26,2);
 SetTextStyle(0,0,3);
 OutTextxy(16,16,'H');
 Getmem(HauTrang,ImageSize(1,1,51,51)); Getimage(1,1,51,51,HauTrang^);
 Putimage(1,1,ODen^,normalput);
 Circle(26,26,20);
 SetFillStyle(1,4);
 FloodFill(26,26,2);
 OutTextxy(16,16,'H');
 Getmem(HauDen,ImageSize(1,1,51,51));Getimage(1,1,51,51,HauDen^);
End;

Procedure VeBang;
Var xd,yd,l,i,j: integer;
Begin
 ClearDevice;
 SetTextStyle(1,0,1);
 OutTextxy(10,10,'Quƒn hƒu: H');
 l:=50;
 xd:=(640-8*l)div 2; yd:=(480-8*l)div 2;
 SetColor(14);
 Rectangle(xd,yd,xd+l*8,yd+l*8);
 For i:=1 to 7 do
 begin
   Line(xd+l*i,yd,xd+l*i,yd+l*8);
   Line(xd,yd+l*i,xd+l*8,yd+l*i);
 end;
 For i:=1 to 8 do
   For j:=1 to 8 do
   begin
     a[i,j,1]:=xd+(j-1)*l; a[i,j,2]:=yd+(i-1)*l;
     If (i+j)mod 2=0 then SetFillStyle(1,8)
     Else SetFillStyle(1,15);
     FloodFill(a[i,j,1]+1,a[i,j,2]+1,14);
   end;
 Randomize;
 xHauL:=random(8)+1; yHauL:=random(8)+1;
 If Odd(xHauL+yHauL) then
    Putimage(a[xHauL,yHauL,1],a[xHauL,yHauL,2],HauTrang^,normalput)
 Else putimage(a[xHauL,yHauL,1],a[xHauL,yHauL,2],HauDen^,normalput);
End;

Procedure TimViTri(x,y: integer);
Var i,j: byte;
Begin
 For i:=1 to 8 do
   For j:=1 to 8 do
     If (a[i,j,1]<x)and(a[i,j,1]+49>x)and(a[i,j,2]<y)and(a[i,j,2]+49>y) then
     begin
       xHau:=i; yHau:=j;
       exit;
     end;
End;

Function Ok: boolean;
Begin
 Ok:=true;
 If (xHau=xHauL)or(yHau=yHauL) then exit;
 If abs(xHau-xHauL)=abs(yHau-yHaul) then exit;
 Ok:=false;
End;

Procedure ChuyenQuan;
Var x,y: integer;
Begin
 GetMousePosition(x,y);
 TimViTri(x,y);
 If not Ok then exit;
 HideMouse;
 If (xHauL+yHauL)mod 2=0 then
        Putimage(a[xHauL,yHauL,1],a[xHauL,yHauL,2],ODen^,normalput)
 Else Putimage(a[xHauL,yHauL,1],a[xHauL,yHauL,2],OTrang^,normalput);
 If Odd(xHau+yHau) then
    Putimage(a[xHau,yHau,1],a[xHau,yHau,2],HauTrang^,normalput)
 Else Putimage(a[xHau,yHau,1],a[xHau,yHau,2],HauDen^,normalput);
 ShowMouse;
 xHauL:=xHau; yHauL:=yHau;
End;

BEGIN
 Gd:=Detect;
 InitGraph(Gd,Gm,'c:\tp70\bgi');
 CatHinh;
 VeBang;
 InitMouse;
 ShowMouse;
 While true do
 begin
   reg.ax:=$0003;
   intr($33,reg);
   If (reg.bx and 1)=1 then ChuyenQuan;
   If (reg.bx and 2)=2 then break;
 end;
 CloseGraph;
END.