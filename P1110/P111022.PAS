Program P111022;{diem nam trong nhieu hinh chu nhat}
Uses crt;
Const fi = 'P111022.inp';
Var f:text;
    i,n:byte;
    c:array[1..100,1..4] of byte;
    d:array[1..200,1..200] of byte;

Procedure input;
Begin
  Assign(f,fi);
  Reset(f);
  Readln(f,n);
  For i:=1 to n do Readln(f,c[i,1],c[i,2],c[i,3],c[i,4]);
  Close(f);
End;

Procedure work;
Var i,j,k,x,y:byte;
    s,max:integer;
Begin
  Fillchar(d,sizeof(d),0);
  For k:=1 to n do
  Begin
    For i:=c[k,1] to c[k,3] do
    For j:=c[k,2] to c[k,4] do inc(d[i,j]);
  End;
  s:=0;
  For i:=1 to 200 do
  For j:=1 to 200 do If d[i,j]<>0 then inc(s);
  Writeln(' Dien tich che phu la: ',s);
  max:=0;
  For i:=1 to 200 do
  For j:=1 to 200 do
  If d[i,j]>max then
  Begin
    max:=d[i,j];
    x:=j;
    y:=i;
  End;
  Writeln('Diem nam trong nhieu hinh chu nhat nhat la: (',x,',',y,')');
  Writeln('Nam trong ',d[y,x],' hinh');
End;

Begin
  clrscr;
  input;
  work;
End.