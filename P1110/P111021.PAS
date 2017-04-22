Program P111021;{phu roi nhau cua hinh chu nhat CN0}
Uses crt;
Const fi = 'P111021.inp';

Var c:Array[1..100,1..2] of byte;
    d:Array[1..200,1..200] of byte;
    dx:Array[1..4] of byte;
    s,n,i,cx,cy:integer;
    f:text;

Procedure put(a,b,x,y,t:byte);
Var i,j:byte;
Begin
  For i:=y to y+b-1 do
  For j:=x to x+a-1 do
  d[i,j]:=t;
End;

Function test(a,b,x,y:byte):boolean;
Var i,j:byte;
Begin
  test:=false;
  If y+b-1> cy then exit;
  If x+a-1> cx then exit;
  For i:=y to y+b-1 do
  For j:=x to x+a-1 do
  If d[i,j]=1 then exit;
  test:=true;
End;

Procedure tim(k:byte);
Var i,a,b,x,y:byte;
Begin
  If k=n then
  Begin
    write(' Xep duoc');
    readln;
    halt;
  End;
  For y:=1 to cy do
  For x:=1 to cx do
  If d[y,x]=0 then
  Begin
    For i:=1 to n do
    If dx[i]=0 then
    Begin
      dx[i]:=1;
      a:=c[i,1];
      b:=c[i,2];
      If test(a,b,x,y) then
      Begin
        put(a,b,x,y,1);
        tim(k+1);
        put(a,b,x,y,0);
      End;
      a:=c[i,2];
      b:=c[i,1];
      If test(a,b,x,y) then
      Begin
        put(a,b,x,y,1);
        tim(k+1);
        put(a,b,x,y,0);
      End;
      dx[i]:=0;
    End;
    exit;
  End;
End;

Begin
  s:=0;
  assign(f,fi);
  reset(f);
  readln(f,n,cx,cy);
  For i:=1 to n do
  Begin
    readln(f,c[i,1],c[i,2]);
    s:=s+c[i,1]*c[i,2];
  End;
  close(f);
  If s<>cx*cy then
  Begin
    write('Khong the xep duoc thanh hinh vuong');
    readln;
    halt;
  End;
  fillchar(dx,sizeof(dx),0);
  clrscr;
  tim(0);
End.