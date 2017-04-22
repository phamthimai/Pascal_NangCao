Program P111506; {Khong tim thay de dau ca}
Uses Crt;
Const
      nmax=15;
      inp='P11\P111506.inp';
Var
      f:text;
      n,xp:byte;
      min:integer;
      cx:array[1..nmax]of boolean;
      a,opt:array[1..nmax]of byte;
      c:array[1..nmax,1..nmax]of integer;

Procedure Nhap;
Var i,j: byte;
Begin
  Assign(f,inp);Reset(f);
  Readln(f,n);
  For i:=1 to n do
  begin
    For j:=1 to n do Read(f,c[i,j]);
    Readln(f);
  end;
  Close(f);
  Write('Cho vi tri xuat phat: ');Readln(xp);
End;

Procedure Ghi(s:integer);
Begin
  opt:=a;
  min:=s;
End;

Procedure Try(k:byte;s:integer);
Var i: byte;
Begin
  For i:=1 to n do
  If (cx[i])and(s+c[a[k-1],i]<min) then
  begin
    a[k]:=i;
    cx[i]:=false;
    If k=n then Ghi(s+c[a[k-1],i])
    Else Try(k+1,s+c[a[k-1],i]);
    cx[i]:=true;
  end;
End;

Procedure Xu_ly;
Var i: byte;
Begin
  min:=maxint;
  FillChar(cx,Sizeof(cx),true);
  cx[xp]:=false;
  a[1]:=xp;
  Try(2,0);
  Writeln('Tong thoi gian phai di nho nhat: ',min);
  Write('Thu tu cac vi tri da di: ');
  For i:=1 to n do Write(opt[i],' ');
End;

BEGIN
  ClrScr;
  Nhap;
  Xu_ly;
END.