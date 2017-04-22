Program P120415;
{Hien thi con Xe va con Hau tren ban co va dieu khien no}
Uses  Crt,Dos,Graph;
Type  ba= array [0..0]of byte;
      bap=^ba;
Var   reg: registers;
      Gd,Gm: integer;
      ChonXe,ChonHau: boolean;
      xHau,yHau,xHauL,yHauL,xXe,yXe,xXeL,yXeL: integer;
      xMouse,yMouse: integer;
      a: array [1..8,1..8,1..2] of integer;
      b: array [1..8,1..8] of byte;
      ODen,OTrang,HauTrang,HauDen,XeTrang,XeDen: bap;

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

Procedure GetMousePosition(Var xmouse,ymouse:integer);
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
 SetFillStyle(1,8); FloodFill(2,2,14);
 Getmem(ODen,ImageSize(1,1,51,51)); GetImage(1,1,51,51,ODen^);
 SetFillStyle(1,15); FloodFill(2,2,14);
 Getmem(OTrang,ImageSize(1,1,51,51)); Getimage(1,1,51,51,OTrang^);
 SetColor(2);
 SetTextStyle(0,0,3);
 Circle(26,26,20);
 SetFillStyle(1,4); FloodFill(26,26,2);
 OutTextxy(16,16,'H');
 Getmem(HauTrang,ImageSize(1,1,51,51)); Getimage(1,1,51,51,HauTrang^);
 SetColor(4); OutTextxy(16,16,'H');
 SetColor(2); OutTextxy(16,16,'X');
 Getmem(XeTrang,imagesize(1,1,51,51)); Getimage(1,1,51,51,XeTrang^);
 Putimage(1,1,ODen^,normalput);
 Circle(26,26,20);
 SetFillStyle(1,4); FloodFill(26,26,2);
 OutTextxy(16,16,'H');
 Getmem(HauDen,ImageSize(1,1,51,51)); Getimage(1,1,51,51,HauDen^);
 SetColor(4); OutTextxy(16,16,'H');
 SetColor(2); OutTextxy(16,16,'X');
 Getmem(XeDen,imagesize(1,1,51,51)); Getimage(1,1,51,51,XeDen^);
End;

Procedure VeBang;
Var xd,yd,l,i,j: integer;
Begin
 ClearDevice;
 SetTextStyle(1,0,1);
 OutTextxy(10,10,'Quハ hブ : H   -   Quハ Xe : X');
 l:=50;
 xd:=(640-8*l)div 2; yd:=(480-8*l)div 2;
 SetColor(14);
 Rectangle(xd,yd,xd+l*8,yd+l*8);
 For i:=1 to 7 do
 begin
   Line(xd+l*i,yd,xd+l*i,yd+l*8); Line(xd,yd+l*i,xd+l*8,yd+l*i);
 end;
 For i:=1 to 8 do
   For j:=1 to 8 do
   begin
     a[i,j,1]:=xd+(j-1)*l; a[i,j,2]:=yd+(i-1)*l;
     If (i+j)mod 2=0 then SetFillStyle(1,8)
     Else SetFillStyle(1,15);
     FloodFill(a[i,j,1]+1,a[i,j,2]+1,14);
   end;
 ChonHau:=false; ChonXe:=false;
 Randomize;
 xHauL:=Random(8)+1; yHauL:=Random(8)+1;
 Repeat
   xXeL:=Random(8)+1; yXeL:=Random(8)+1;
 Until (xXeL<>xHauL)or(yXeL<>yHauL);
 If Odd(xHauL+yHauL) then
    Putimage(a[xHauL,yHauL,1],a[xHauL,yHauL,2],HauTrang^,normalput)
 Else Putimage(a[xHauL,yHauL,1],a[xHauL,yHauL,2],HauDen^,normalput);
 If Odd(xXeL+yXeL) then
    Putimage(a[xXeL,yXeL,1],a[xXeL,yXeL,2],XeTrang^,normalput)
 Else Putimage(a[xXeL,yXeL,1],a[xXeL,yXeL,2],XeDen^,normalput);
 FillChar(b,Sizeof(b),0);
 b[xHauL,yHauL]:=1; b[xXeL,yXeL]:=2;
End;

Procedure TimViTri(Var x,y: byte);
Var i,j: byte;
Begin
 x:=0;
 For i:=1 to 8 do
   For j:=1 to 8 do
     If (a[i,j,1]<xMouse)and(a[i,j,1]+49>xMouse)and
        (a[i,j,2]<yMouse)and(a[i,j,2]+49>yMouse) then
     begin
       x:=i; y:=j;
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

Procedure ChuyenHau(x,y: byte);
Begin
 xHau:=x; yHau:=y;
 If not Ok then exit;
 HideMouse;
 If Odd(xHauL+yHauL) then
    Putimage(a[xHauL,yHauL,1],a[xHauL,yHauL,2],OTrang^,normalput)
 Else Putimage(a[xHauL,yHauL,1],a[xHauL,yHauL,2],ODen^,normalput);
 If Odd(xHau+yHau) then
    Putimage(a[xHau,yHau,1],a[xHau,yHau,2],HauTrang^,normalput)
 Else Putimage(a[xHau,yHau,1],a[xHau,yHau,2],HauDen^,normalput);
 ShowMouse;
 b[xHaul,yHauL]:=0;
 b[xHau,yHau]:=1;
 xHauL:=xHau; yHauL:=yHau;
End;

Procedure ChuyenXe(x,y: byte);
Begin
 xXe:=x; yXe:=y;
 If (xXe<>xXeL)and(yXe<>yXeL) then exit;
 HideMouse;
 If Odd(xXeL+yXeL) then
    Putimage(a[xXeL,yXeL,1],a[xXeL,yXeL,2],OTrang^,normalput)
 Else Putimage(a[xXeL,yXeL,1],a[xXeL,yXeL,2],ODen^,normalput);
 If Odd(xXe+yXe) then
    Putimage(a[xXe,yXe,1],a[xXe,yXe,2],XeTrang^,normalput)
 Else Putimage(a[xXe,yXe,1],a[xXe,yXe,2],XeDen^,normalput);
 ShowMouse;
 b[xXel,yXeL]:=0;
 b[xXe,yXe]:=2;
 xXeL:=xXe; yXeL:=yXe;
End;

Procedure ChuyenQuan;
Var x,y: byte;
Begin
 GetMousePosition(xMouse,yMouse);
 TimViTri(x,y);
 If x=0 then exit;
 If b[x,y]=1 then
 begin
   HideMouse;
   ChonHau:=true; ChonXe:=false;
   SetColor(0);
   OutTextxy(450,10,'Chon Xe');
   If Odd(xXeL+yXeL) then SetColor(15)
   Else SetColor(8);
   Circle(a[xXeL,yXeL,1]+25,a[xXeL,yXeL,2]+25,22);
   SetColor(1);
   OutTextxy(450,10,'Chon Hブ');
   Circle(a[x,y,1]+25,a[x,y,2]+25,22);
   ShowMouse;
 end;
 If b[x,y]=2 then
 begin
   HideMouse;
   ChonHau:=false; ChonXe:=true;
   SetColor(0);
   OutTextxy(450,10,'Chon Hブ');
   If Odd(xHauL+yHauL) then SetColor(15)
   Else SetColor(8);
   Circle(a[xHauL,yHauL,1]+25,a[xHauL,yHauL,2]+25,22);
   SetColor(1);
   OutTextxy(450,10,'Chon Xe');
   Circle(a[x,y,1]+25,a[x,y,2]+25,22);
   ShowMouse;
 end;
 If (b[x,y]=0)and(not ChonHau)and(not ChonXe) then exit;
 If b[x,y]=0 then
 begin
   If ChonHau then ChuyenHau(x,y);
   If ChonXe then ChuyenXe(x,y);
 end;
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