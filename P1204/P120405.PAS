Program P120405;
{Hien thi cac hinh tron chuyen dong xien voi van toc khac nhau}
Uses  Crt,Graph;
Const BanKinh=15; Smax=8; Tre=10; Nmax=5;
Var   n: byte;
      Gd,Gm: integer;
      x,y: array [1..Nmax] of integer;
      Huong: array [1..Nmax] of real;
      MauBong,s: array [1..Nmax] of byte;

Procedure KhoiTao;
Var i: byte;
Begin
 Randomize;
 n:=Random(Nmax-2)+3;
 For i:=1 to n do
 begin
   x[i]:=Random(640-2*BanKinh)+BanKinh;
   y[i]:=Random(480-2*BanKinh)+BanKinh;
   MauBong[i]:=Random(15)+1;
   SetColor(MauBong[i]);
   Circle(x[i],y[i],BanKinh);
   SetFillStyle(1,MauBong[i]);
   FloodFill(x[i],y[i],MauBong[i]);
   Huong[i]:=Random(360)*pi/180;
   s[i]:=Random(Smax)+1;
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

Begin
 Gd:=Detect;
 InitGraph(Gd,Gm,'c:\turbo\graph');
 KhoiTao;
 While not KeyPressed do
 begin
   Delay(Tre);
   ClearDevice;
   ChuyenDong;
 end;
 CloseGraph;
End.