Program  P101111;  {Chon 100 tu moi tu khong dai qua 6 ki tu}
Uses  Crt;
Const nmax=5000;
      inp='P1011\P101111.INP';
      out='P1011\P101111.OUT';
Type  str6=string[6];
Var   f: text;
      n: integer;
      a: array [1..nmax] of str6;
      l: array [1..nmax] of integer;

Function Lap(s: str6): boolean;
Var i: integer;
Begin
 lap:=true;
 For i:=1 to n do
   If a[i]=s then
   begin
     Inc(l[i]);
     Exit;
   end;
 lap:=false;
End;

Procedure Nhap;
Var s: str6;
Begin
 n:=0;
 Assign(f,inp); Reset(f);
 While not Eof(f) do
 begin
   Readln(f,s);
   If not Lap(s) then
   begin
     Inc(n);
     l[n]:=1;
     a[n]:=s;
   end;
 end;
 Close(f);
End;

Procedure SapXep(t,p: integer);
Var i,j,x,tg: integer; st: str6;
Begin
 i:=t; j:=p; x:=l[(t+p) div 2];
 Repeat
   While l[i]>x do Inc(i);
   While x>l[j] do Dec(j);
   If i<=j then
   begin
     tg:=l[i]; l[i]:=l[j]; l[j]:=tg;
     st:=a[i]; a[i]:=a[j]; a[j]:=st;
     Inc(i);
     Dec(j);
   end;
 Until i>j;
 If t<j then SapXep(t,j);
 If i<p then SapXep(i,p);
End;

Procedure Xuly;
Var i: byte;
Begin
 SapXep(1,n);
 Assign(f,out); Rewrite(f);
 If n>100 then
   For i:=1 to 100 do Writeln(f,a[i],' ',l[i])
 Else
   For i:=1 to n do Writeln(f,a[i],' ',l[i]);
 Close(f);
End;

BEGIN
 ClrScr;
 Nhap;
 XuLy;
END.