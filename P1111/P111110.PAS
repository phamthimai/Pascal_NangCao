Program P111110;  {Cac diem chuyen dong voi van toc khac nhau}
Uses  Crt,Graph;  {Gap canh man hinh thi phan xa tro lai}
Const BanKinh=3;
      Smax=5;
      Tre=10;
      Nmax=10;
Var   n: byte;
      gd,gm: integer;
      x,y: array [1..Nmax] of integer;
      Huong: array [1..Nmax] of real;
      MauBong,s: array [1..Nmax] of byte;

Procedure KhoiTao;
Var i: byte;
Begin
 Randomize;
 n:=random(Nmax-5)+5;
 For i:=1 to n do
 begin
   x[i]:=random(640-2*BanKinh)+BanKinh;
   y[i]:=random(480-2*BanKinh)+BanKinh;
   MauBong[i]:=random(15)+1;
   SetColor(MauBong[i]);
   Circle(x[i],y[i],BanKinh);
   SetFillStyle(1,MauBong[i]);
   FloodFill(x[i],y[i],MauBong[i]);
   Huong[i]:=random(360)*pi/180;
   s[i]:=random(Smax)+1;
 end;
End;

Procedure ChuyenDong;
Var i: byte;
Begin
 For i:=1 to n do
 begin
   x[i]:=x[i]+round(s[i]*cos(Huong[i]));
   y[i]:=y[i]+round(s[i]*sin(Huong[i]));
   SetColor(MauBong[i]);
   Circle(x[i],y[i],BanKinh);
   SetFillStyle(1,MauBong[i]);
   FloodFill(x[i],y[i],MauBong[i]);
   If x[i]<=BanKinh then
     If Huong[i]>pi then Huong[i]:=3*pi-Huong[i]
     Else Huong[i]:=pi-Huong[i];
   If x[i]>=640-BanKinh then
     If Huong[i]<pi then Huong[i]:=pi-Huong[i]
     Else Huong[i]:=3*pi-Huong[i];
   If y[i]<=BanKinh then Huong[i]:=2*pi-Huong[i];
   If y[i]>=480-BanKinh then Huong[i]:=2*pi-Huong[i];
 end;
End;

BEGIN
 gd:=detect;
 InitGraph(gd,gm,'d:\tp70\bgi');
 KhoiTao;
 While not KeyPressed do
 begin
   Delay(Tre);
   ClearDevice;
   ChuyenDong;
 end;
 CloseGraph;
END.