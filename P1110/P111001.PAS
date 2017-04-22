Program P111001;{4 hinh chu nhat}
Uses Crt;
Var c:Array[1..4,1..2] of byte;
    d:Array[1..200,1..200] of byte;
    dx:Array[1..4] of byte;
    i:byte;
    s,n:integer;

Procedure put(a,b,x,y,t:byte);
Var i,j:byte;
Begin
  For i:=y to y+b-1 do
  For j:=x to x+a-1 do
  d[i,j]:=t;
End;

function test(a,b,x,y:byte):boolean;
Var i,j:byte;
Begin
  test:=false;
  If y+b-1> n then exit;
  If x+a-1> n then exit;
  For i:=y to y+b-1 do
  For j:=x to x+a-1 do
  If d[i,j]=1 then exit;
  test:=true;
End;

Procedure tim;
Var i,a,b,x,y:byte;
    ok:boolean;
Begin
  ok:=false;
  For y:=1 to n do
  For x:=1 to n do
  If d[y,x]=0 then
  Begin
    ok:=true;
    For i:=1 to 4 do
    If dx[i]=0 then
    Begin
      dx[i]:=1;
      a:=c[i,1];
      b:=c[i,2];
      If test(a,b,x,y) then
      Begin
        put(a,b,x,y,1);
        tim;
        put(a,b,x,y,0);
      End;
      a:=c[i,2];
      b:=c[i,1];
      If test(a,b,x,y) then
      Begin
        put(a,b,x,y,1);
        tim;
        put(a,b,x,y,0);
      End;
      dx[i]:=0;
    End;
    exit;
  End;
  If ok=false then
  Begin
    Write(' Xep duoc thanh hinh vuong');
    readln;
    halt;
  End;
End;

Begin
  s:=0;
  For i:=1 to 4 do
  Begin
    Write(' Nhap toa do hinh chu nhat thu ',i,' ');readln(c[i,1],c[i,2]);
    s:=s+c[i,1]*c[i,2];
  End;
  If round(sqrt(s))<>sqrt(s) then
  Begin
    Write('Khong the xep duoc thanh hinh vuong');
    readln;
    halt;
  End;
  n:=round(sqrt(s));
  fillchar(dx,sizeof(dx),0);
  clrscr;
  tim;
End.