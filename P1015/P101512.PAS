Program P101512;    {Anh Ma tran}
Uses  Crt,Graph;
Const X0=100; y0=100;
Var   Gd,Gm: integer;
      N: integer;

Procedure Matran(m,a,b: integer);
Var i,j,x,y,k,l: integer;
Begin
 k:=1; For l:=2 to m do k:=k*3;
 For i:=0 to 2 do
   For j:=0 to 2 do
   begin
     x:=a+i*k; y:=b+j*k;
     If not Odd(i+j) then
       If m=1 then PutPixel(x,y,2)
       Else Matran(m-1,x,y);
   end;
End;

BEGIN
 Clrscr;
 Write('Nhap N: '); Readln(N);
 Gd:=Detect;
 Initgraph(Gd,Gm,'');
 Matran(n,x0,y0);
 Readln;
 Closegraph;
END.