{$N+}
Program  P101105;   {Hien thi cac doan thang max lay theo l}
Uses  Crt,Graph;
Const nmax=100;
      inp='P1011\P101105.inp';
      ep=0.1;
Var   gd,gm: integer;
      f: text;
      n: integer;
      x,y: array [1..nmax] of integer;

Procedure Nhap;
Begin
 n:=0;
 Assign(f,inp); Reset(f);
 While not Eof(f) do
 begin
   Inc(n);
   Readln(f,x[n],y[n]);
 end;
 Close(f);
End;

Function kc(x1,y1,x2,y2:real): real;
Begin
 kc:=sqrt(sqr(x1-x2)+sqr(y1-y2));
End;

Procedure Tim_max(i: integer; var max: real);
Var j: integer;
Begin
 max:=0;
 For j:=1 to n do
 If kc(x[i],y[i],x[j],y[j])>max then max:=kc(x[i],y[i],x[j],y[j]);
End;

Procedure Ve;
Var i,j: integer; max: real;
Begin
 SetColor(4);
 For i:=1 to n do
 begin
   Circle(x[i],y[i],4);
   Tim_max(i,max);
   For j:=1 to n do
   If abs(kc(x[i],y[i],x[j],y[j])-max)<ep then Line(x[i],y[i],x[j],y[j]);
 end;
End;

BEGIN
 ClrScr;
 Nhap;
 gd:=detect;
 InitGraph(gd,gm,'d:\tp70\bgi');
 Ve;
 Repeat Until KeyPressed;
 CloseGraph;
END.
12 54
74 1
45 88
234 132
