{$N+}
Program P111108;  {Doan thang quay quanh diem co dinh}
Uses  Crt,Graph;
Const GocLech=pi/180;
      MauDoanthang=1;
      DoDai=100;
Var   gd,gm: integer;
      xTam,yTam: integer;
      GocXoay: real;

Procedure KhoiTao;
Begin
 Randomize;
 xTam:=random(640); yTam:=random(480);
 GocXoay:=random(180)*pi/180;
End;

Procedure VeDoanthang(Mau: byte);
Var x1,x2,y1,y2: integer;
Begin
 x1:=xTam+round(DoDai*cos(GocXoay));
 y1:=yTam+round(DoDai*sin(GocXoay));
 x2:=xTam+round(DoDai*cos(GocXoay+pi));
 y2:=yTam+round(DoDai*sin(GocXoay+pi));
 SetColor(Mau);
 Line(x1,y1,x2,y2);
 SetColor(4);
 Circle(xTam,yTam,2);
End;

BEGIN
 gd:=detect;
 InitGraph(gd,gm,'d:\tp70\bgi');
 KhoiTao;
 Repeat
   GocXoay:=GocXoay+GocLech;
   VeDoanthang(MauDoanthang);
   Delay(30);
   VeDoanthang(0);
 Until keypressed;
 CloseGraph;
END.