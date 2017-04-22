{$N+}
Program P111102;   {Ve hinh vuong quay va chuyen dong}
Uses  Crt,Graph;
Const GocLech=pi/180;
      GocLechHV=4*pi/180;
      MauHinhVuong=1;
      BanKinhHV=50;
      BanKinh=150;
Var   gd,gm: integer;
      xHV,yHV: array [1..4] of integer;
      xTam,yTam,xG,yG: integer;
      GocXoayHV,GocXoay: real;

Procedure KhoiTao;
Begin
 xG:=320;
 yG:=240;
 Randomize;
 GocXoayHV:=random(180)*pi/180;
 GocXoay:=random(180)*pi/180;
End;

Procedure VeHinhVuong(Mau: byte);
Var i: byte;
Begin
 For i:=1 to 4 do
 begin
   xHV[i]:=xTam+round(BanKinhHV*sin(GocXoayHV+(i-1)*(pi/2)));
   yHV[i]:=yTam+round(BanKinhHV*cos(GocXoayHV+(i-1)*(pi/2)));
 end;
 SetColor(Mau);
 For i:=1 to 3 do Line(xHV[i],yHV[i],xHV[i+1],yHV[i+1]);
 Line(xHV[1],yHV[1],xHV[4],yHV[4]);
 SetFillStyle(1,Mau);
 FloodFill(xTam+3,yTam+3,Mau);
 SetColor(4);
 Circle(xTam,yTam,2);
 Circle(xG,yG,BanKinh);
End;

BEGIN
 gd:=detect;
 InitGraph(gd,gm,'d:\tp70\bgi');
 KhoiTao;
 Repeat
   GocXoayHV:=GocXoayHV+GocLechHV;
   GocXoay:=GocXoay+GocLech;
   xTam:=xG+round(BanKinh*cos(GocXoay));
   yTam:=yG+round(BanKinh*sin(GocXoay));
   VeHinhVuong(MauHinhVuong);
   Delay(20);
   VeHinhVuong(0);
 Until KeyPressed;
 CloseGraph;
END.