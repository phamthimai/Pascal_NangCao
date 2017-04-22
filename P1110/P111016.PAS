Program P111016;{Dien tich cua hop n hinh chu nhat}
Uses crt;
Const fi = 'P111016.inp';

Type mang=Array[1..101] of real;

Var n:byte;
    x,y:mang;
    dx,dy:byte;
    d:array[1..200,1..4] of real;
    c:array[1..200,1..200] of byte;
    f:text;

Procedure cut(t:byte;Var len:byte;Var m:mang);
Var i:byte;
Begin
  Dec(len);
  For i:=t to len do m[i]:=m[i+1];
End;

Procedure xapxep(Var len:byte;Var m:mang);
Var i,j:byte;
    d:real;
Begin
  For i:=1 to len-1 do
  For j:=i+1 to len do
  If m[j]<m[i] then
  Begin
    d:=m[j];
    m[j]:=m[i];
    m[i]:=d;
  End;
  i:=1;
  While (i<len) do If m[i]=m[i+1] then cut(i,len,m) else inc(i);
End;

Procedure input;
Var i,j:byte;
Begin
 dx:=0;
 dy:=0;
 Assign(f,fi);
 Reset(f);
 Readln(f,n);
 For i:=1 to n do
 Begin
   Readln(f,d[i,1],d[i,2],d[i,3],d[i,4]);
   Inc(dx,2);
   Inc(dy,2);
   x[dx-1]:=d[i,2];
   y[dy-1]:=d[i,1];
   x[dx]:=d[i,4];
   y[dy]:=d[i,3];
 End;
 Close(f);
 xapxep(dx,x);
 xapxep(dy,y);
End;

Procedure work;
Var i,j,k,x1,y1,x2,y2:byte;
    sum:real;
Begin
  Fillchar(c,sizeof(c),0);
  For k:=1 to n do
  Begin
    For x1:=1 to dx do If d[k,2]=x[x1] then break;
    For x2:=1 to dx do If d[k,4]=x[x2] then break;
    For y1:=1 to dy do If d[k,1]=y[y1] then break;
    For y2:=1 to dy do If d[k,3]=y[y2] then break;
    For i:=y1 to y2-1 do
    For j:=x1 to x2-1 do
    c[i,j]:=1;
  End;
  sum:=0;
  For i:=1 to dy-1 do
  For j:=1 to dx-1 do
  sum:=sum+c[i,j]*(y[i+1]-y[i])*(x[j+1]-x[j]);
  writeln;
  write(' Tong dien tich che phu la: ',sum:6:3);
End;

Begin
  input;
  work;
End.