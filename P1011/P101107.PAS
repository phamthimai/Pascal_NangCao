Program  P101107;  {Mang nhi phan noi i j khi aij=1 }
Uses  Crt,Graph;
Const nmax=100;
      inp='P1011\DATA.INP';
Var   f: text;
      n: byte;
      gd,gm: integer;
      x,y: array [1..nmax] of integer;
      a: array [1..nmax,1..nmax] of 0..1;

Procedure Nhap;
Var i,j: byte;
Begin
 Assign(f,inp); Reset(f);
 Readln(f,n);
 For i:=1 to n do Readln(f,x[i],y[i]);
 For i:=1 to n do
 begin
   For j:=1 to n do Read(f,a[i,j]);
   Readln(f);
 end;
 Close(f);
End;

Procedure Ve;
Var i,j: byte;
Begin
 SetColor(4);
 For i:=1 to n do
   For j:=1 to n do
     If a[i,j]=1 then Line(x[i],y[i],x[j],y[j]);
End;

BEGIN
 Nhap;
 gd:=Detect;
 InitGraph(gd,gm,'');
 Ve;
 Repeat Until KeyPressed;
 CloseGraph;
END.