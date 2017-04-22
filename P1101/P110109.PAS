Program P110109;   {lap mang 1 chieu tu mang 2 chieu}
Uses  Crt;
Const nmax=50;
      inp='INPUT.DAT';
Type  Mang1=array [1..nmax*nmax] of real;
      Mang2=array [1..nmax,1..nmax] of real;
Var   a: Mang2; O: Mang1;
      n,i,j,k,l,r,t,b: integer;

Procedure Nhap;
Var i,j: integer; f: text;
Begin
 Assign(f,inp); Reset(f);
 Readln(f,n);
 For i:=1 to n do
   begin
     For j:=1 to n do Read(f,a[i,j]); Readln(f);
   end;
 Close(f);
End;

Procedure Xuat1(a: Mang1);
Var i: integer;
Begin
 For i:=1 to Sqr(n) do Write(a[i]:8:2);
End;

Procedure Xuat2(a: Mang2);
Var i,j: integer;
Begin
 For i:=1 to n do
   begin
     For j:=1 to n do Write(a[i,j]:8:2); Writeln;
   end;
End;

Procedure Xep;
Begin
 Repeat
   O[k]:=a[i,j]; Inc(k);
   If (i=t)and(j<r) then Inc(j)
   Else If (j=r)and(i<b) then Inc(i)
        Else If (i=b)and(j>l) then Dec(j)
             Else If (j=l)and(i>t) then Dec(i);
 Until (i=t)and(j=l);
 Inc(l); Inc(t); Dec(r); Dec(b); i:=t; j:=l;
 If k<=Sqr(n) then Xep;
End;

BEGIN
 Nhap;
 i:=1; j:=1; k:=1; l:=1; r:=n; t:=1; b:=n;
 Xep;
 ClrScr;
 Xuat2(a);
 Writeln;
 Xuat1(O);
 Readln;
END.
