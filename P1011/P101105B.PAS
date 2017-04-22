{$N+}
Program  P101105b;   {Noi doan thang max lay theo k va l}
Uses  Crt,Graph;
Const nmax=100;
      inp='P1011\P101105.inp';
      ep=0.5;
Var   gd,gm : integer;
      f : text;
      n: integer;
      max: real;
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

Procedure TimMax;
Var i,j: integer;
Begin
 max:=0;
 For i:=1 to n do
   For j:=1 to n do
     If kc(x[i],y[i],x[j],y[j])>max then
       max:=kc(x[i],y[i],x[j],y[j]);
End;

Procedure Ve;
Var i,j: integer;
Begin
 For i:=1 to n do
 begin
   Circle(x[i],y[i],4);
   For j:=1 to n do
     If abs(kc(x[i],y[i],x[j],y[j])-max)<ep then Line(x[i],y[i],x[j],y[j]);
 end;
End;

BEGIN
 ClrScr;
 Nhap;
 gd:=Detect;
 InitGraph(gd,gm,'');
 TimMax;
 Ve;
 Repeat Until KeyPressed;
 CloseGraph;
END.
12 54
74 1
45 88
234 132
