Program P101111; {Dua ra 100 tu thuong gap nhat do dai khong gioi han va so lan xuat hien}
Uses Crt;
Const nmax=5000;
      inp='P10\P1011\p101111.inp';
      out='';
Var
    f:text;
    n:integer;
    pmark:pointer;
    a:array[1..nmax]of ^string;
    l:array[1..nmax]of integer;

Function Lap(s:string):boolean;
Var     i:integer;
Begin
  Lap:=true;
  For i:=1 to n do
   If a[i]^=s then
    begin
    Inc(l[i]);
    Exit;
    end;
   Lap:=false;
End;

Procedure Nhap;
Var      s:string;
Begin
  mark(pmark);
  n:=0;
  Assign(f,inp);Reset(f);
  While not Eof(f) do
   begin
   Readln(f,s);
   If not Lap(s) then
    begin
    Inc(n);
    l[n]:=1;
    new(a[n]);
    a[n]^:=s;
    end;
   end;
  Close(f);
End;

Procedure SapXep(t,p:integer);
Var
     i,j,x,tg:integer;
     st:string;
Begin
  i:=t; j:=p; x:=l[(t+p) div 2];
  Repeat
  While l[i]>x do Inc(i);
   While x>l[j] do Dec(j);
    If i<=j then
    begin
     tg:=l[i]; l[i]:=l[j]; l[j]:=tg;
     st:=a[i]^; a[i]^:=a[j]^; a[j]^:=st;
     Inc(i);
     Dec(j);
    end;
  Until i>j;
  If t<j then SapXep(t,j);
  If i<p then SapXep(i,p);
End;

Procedure Xuly;
Var      i:byte;
Begin
  SapXep(1,n);
  Assign(f,out);Rewrite(f);
  If n>100 then
   For i:=1 to 100 do Writeln(f,a[i]^,' ',l[i])
  Else
   For i:=1 to n do Writeln(f,a[i]^,' ',l[i]);
   Readln;
  Close(f);
End;

BEGIN
ClrScr;
  Nhap;
  XuLy;
  Release(pmark);
END.