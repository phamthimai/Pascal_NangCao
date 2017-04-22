{$N+}
Program P111103;   {Hinh vuong chuyen dong tren qui dao Ellipse}
Uses  Crt,Graph;
Const GocLechHV=4*pi/180;
      MauHinhVuong=1;
      BanKinhHV=50;
      a=250;
      b=80;
Var   gd,gm: integer;
      xHV,yHV: array [1..4] of integer;
      xTam,yTam,xG,yG: integer;
      GocXoayHV,temp: real;
      DoDoiX: integer;

Procedure KhoiTao;
Begin
 xG:=320;
 yG:=240;
 Randomize;
 GocXoayHV:=random(180)*pi/180;
 xTam:=random(a);
 DoDoix:=1;
End;

Procedure VeHinhVuong(Mau: byte);
Var i: byte;
Begin
 For i:=1 to 4 do
 begin
   xHV[i]:=xG+xTam+round(BanKinhHV*sin(GocXoayHV+(i-1)*(pi/2)));
   yHV[i]:=yG+yTam+round(BanKinhHV*cos(GocXoayHV+(i-1)*(pi/2)));
 end;
 SetColor(Mau);
 For i:=1 to 3 do line(xHV[i],yHV[i],xHV[i+1],yHV[i+1]);
 line(xHV[1],yHV[1],xHV[4],yHV[4]);
 SetFillStyle(1,Mau);
 FloodFill(xG+xTam+3,yG+yTam+3,Mau);
 SetColor(15);
 Ellipse(xG,yG,0,360,a,b);
 Circle(xG+xTam,yG+yTam,2);
End;

Function Can(x1,a1,b1: real): real;
Var r: real;
Begin
 r:=(1-((x1*x1)/(a1*a1)));
 If r<0.01 then Can:=0
 Else Can:=sqrt(r*b1*b1);
End;

BEGIN
 gd:=detect;
 InitGraph(gd,gm,'d:\tp70\bgi');
 KhoiTao;
 Repeat
   GocXoayHV:=GocXoayHV+GocLechHV;
   If (xTam<-a)or(xTam>a) then DoDoix:=-DoDoix;
   xTam:=xTam+DoDoix;
   If (xTam=-a)or(xTam=a) then temp:=0
   Else temp:=can(xtam,a,b);
   If DoDoix>0 then yTam:=round(temp)
   Else yTam:=-round(temp);
   VeHinhVuong(MauHinhVuong);
   Delay(20);
   VeHinhVuong(0);
 Until KeyPressed;
 Closegraph;
END.




