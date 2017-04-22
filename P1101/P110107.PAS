Program P110107; {Lap mang B mot chieu tu mang A hai chieu}
Uses Crt;
Const nmax=8;
      inp='INPUT.DAT';
Type  Mang1=array [1..nmax*nmax] of real;
      Mang2=array [1..nmax,1..nmax] of real;
Var   a: Mang2; b: Mang1;
      n,i,j,k,l: integer;

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

BEGIN
 Nhap;
 ClrScr;
 Xuat2(a);
 Writeln;
 (* xet cac duong cheo phu *)
 l:=0;
 For k:=1 to 2*n-1 do
   If (k mod 2)=1 then
     If k<=n then
       begin
         i:=k; j:=1;
         Repeat
           l:=l+1;b[l]:=a[i,j];i:=i-1;j:=j+1;
         Until i<1;
       end
     Else {k<=n}
       begin
         i:=n; j:=1+k-n;
         Repeat
           l:=l+1;b[l]:=a[i,j];i:=i-1;j:=j+1;
         Until i<1+k-n;
       end
   Else {(k mod 2)=1}
     If k<=n then
       begin
         i:=1; j:=k;
         Repeat
           l:=l+1;b[l]:=a[i,j];i:=i+1;j:=j-1;
         Until j<1;
       end
     Else {k<=n}
       begin
         i:=1+k-n; j:=n;
         Repeat
           l:=l+1;b[l]:=a[i,j];i:=i+1;j:=j-1;
         Until j<1+k-n;
       end;
 Xuat1(b);
 Readln;
END.