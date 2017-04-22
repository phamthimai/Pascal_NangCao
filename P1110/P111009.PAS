Program P111009;{Diem tron n duong tron}
Uses crt;
Const fi='P111009.inp';

Var f:text;
    c:array[1..100,1..3] of real;
    d,x,y,min:real;
    n,i,t:byte;

function inside(x,y:real):boolean;
Var i:byte;
Begin
  inside:=false;
  For i:=1 to n do
  If sqr(x-c[i,2])+sqr(y-c[i,1])>sqr(c[i,3]) then exit;
  inside:=true;
End;

Begin
  Clrscr;
  Assign(f,fi);
  Reset(f);
  Readln(f,n);
  min:=10000;
  For i:=1 to n do
  Begin
    Readln(f,c[i,1],c[i,2],c[i,3]);
    If c[i,3]<min then
    Begin
      min:=c[i,3];
      t:=i;
    End;
  End;
  y:=c[t,1]-c[t,3];
  d:=0.1;
  Repeat
    x:=c[t,2]-c[t,3];
    Repeat
      x:=x+d;
      If inside(x,y) then
      Begin
        Writeln('Diem (',x:3:2,',',y:3:2,') nam trong tat ca cac hinh tron');
        Readln;
        Exit;
      End;
    Until x>c[t,2]+c[t,3];
    y:=y+d;
  Until y>c[t,1]+c[t,3];
  Close(f);
End.