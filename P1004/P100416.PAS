Program P100416;   {Lap mang nhi phan B tu mang A}
Uses Crt;
Var  A,Ba,Bb: array[1..50,1..50] of integer;
     n,i,j,p,q: integer;
     OKa,OKb: boolean;

Procedure Nhap;
Begin
 Clrscr;
 Write('Nhap kich thuoc cua mang A: n = '); Readln(n);
 Writeln('Nhap mang A: ');
 For i:=1 to n do
 begin
   For j:=1 to n do Read(a[i,j]); Readln;
 end;
End;

Procedure Xuat;
Begin
 Writeln('a. Mang B la:');
 For i:=1 to n do
 begin
   For j:=1 to n do write(Ba[i,j]:8); Writeln;
 end;
 Writeln('b. Mang B la:');
 For i:=1 to n do
 begin
   For j:=1 to n do write(Bb[i,j]:8); Writeln;
 end;
 Readln;
End;

Function Max(a,b: integer): integer;
Begin
  If a>b then Max:=a Else Max:=b;
End;

Function Min(a,b: integer): integer;
Begin
  If a<b then Min:=a Else Min:=b;
End;

BEGIN
 Nhap;
 For i:=1 to n do
   For j:=1 to n do
   begin
     OKa:=True; OKb:=False;
     For p:=Max(i-1,1) to Min(i+1,n) do
       For q:=Max(j-1,1) to Min(j+1,n) do
         If (p<>i)or(q<>j) then
         begin
           If (a[p,q]>=a[i,j]) then OKa:=false;
           If (a[p,q] =a[i,j]) then OKb:=true;
         end;
     If OKa then Ba[i,j]:=1 Else Ba[i,j]:=0;
     If OKb then Bb[i,j]:=1 Else Bb[i,j]:=0;
   end;
 Xuat;
END.