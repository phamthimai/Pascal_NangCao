Program P111006;{Vi tri tuong doi giua cac duong thang}
Uses crt;
Const fi = 'P111006.inp';
Var f:text;
    n:byte;
    l:array[1..100,1..3] of real;

Procedure input;
Var i:byte;
Begin
  Assign(f,fi);
  Reset(f);
  Readln(f,n);
  For i:=1 to n do Readln(f,l[i,1],l[i,2],l[i,3]);
  Close(f);
End;

Procedure work;
Var i,j,k:byte;
    x,y,da,dx,dy:real;
Begin
  For i:=1 to n-1 do
  For j:=i+1 to n do
  Begin
    da:=l[i,1]*l[j,2]-l[j,1]*l[i,2];
    dx:=-l[i,3]*l[j,2]+l[j,3]*l[i,2];
    dy:=-l[i,3]*l[j,1]+l[j,3]*l[i,1];
    If da=0 then
    Begin
      If l[i,1]*l[j,3]-l[j,1]*l[i,3]<>0 then
        Writeln(i,' va ',j,' song song')
      else
        Writeln(i,' va ',j,' chung nhau');
    End
    else
    Begin
      x:=dx/da;
      y:=dy/da;
      For k:=j+1 to n do
      If l[i,1]*x+l[i,2]*y+l[i,3]=0 then Writeln(i,',',j,',',k,' chung nhau');
    End;
  End;
End;

Begin
  Clrscr;
  input;
  work;
  Readln;
End.