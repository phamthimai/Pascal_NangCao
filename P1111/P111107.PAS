Program P111107;  {Ve cac hinh tron va dem so diem trong moi hinh tron }
Uses  Crt,Graph;
Const inp='P11\P1111\p111107.inp';
      out='P11\P1111\p111107.out';
Var   f: text;
      gd,gm: integer;
      m,n: byte;
      a: array [1..100] of byte;
      r: array [1..100] of real;
      x,y: array [1..100] of integer;

Procedure Nhap;
Var i: byte;
Begin
 Assign(f,inp);Reset(f);
 Readln(f,n);
 For i:=1 to n do Read(f,r[i]); Readln(f);
 Readln(f,m);
 For i:=1 to m do Readln(f,x[i],y[i]);
 Close(f);
End;

Function Can(x1,y1: real): real;
Begin
 Can:=sqrt(sqr(x1)+sqr(y1));
End;

Function Trong(i,j: byte): boolean;
Begin
 If Can(x[j],y[j])<=r[i] then Trong:=true
 Else Trong:=false;
End;

Procedure Tinh;
Var i,j: byte;
Begin
 FillChar(a,Sizeof(a),0);
 For i:=1 to n do
   For j:=1 to m do
     If Trong(i,j) then Inc(a[i]);
 Assign(f,out); Rewrite(f);
 For i:=1 to n do Writeln(f,a[i]);
 Close(f);
End;

Procedure Ve;
Var i:byte;
Begin
 SetColor(green);
 For i:=1 to n do Circle(0,0,round(r[i]));
 SetColor(14);
 For i:=1 to m do Circle(x[i],y[i],2);
End;

BEGIN
 Nhap;
 Tinh;
 gd:=detect; InitGraph(gd,gm,'d:\tp70\bgi');
 Ve;
 Repeat Until KeyPressed;
 CloseGraph;
END.