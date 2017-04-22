Program P110106;  {lap mang 1 chieu tu mang vuong}
Uses Crt;
Const nmax=7;
      inp='INPUT.DAT';
Type  Mang1=array [1..nmax*nmax] of real;
      Mang2=array [1..nmax,1..nmax] of real;
Var   a: Mang2; b: Mang1;
      n,i,j: integer;

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
 (* Vong ngoai *)
 For i:=1 to 6 do
 begin
   b[i]:=a[1,i];
   b[i+6]:=a[i,7];
   b[i+12]:=a[7,8-i];
   b[i+18]:=a[8-i,1];
 end;
 (* Vong thu hai *)
 For i:=2 to 5 do
 begin
   b[i+23]:=a[2,i];
   b[i+27]:=a[i,6];
   b[i+31]:=a[6,8-i];
   b[i+35]:=a[8-i,2];
 end;
 (* Vong thu ba *)
 For i:=3 to 4 do
 begin
   b[i+38]:=a[3,i];
   b[i+40]:=a[i,5];
   b[i+42]:=a[5,8-i];
   b[i+44]:=a[8-i,3];
 end;
 b[49]:=a[4,4];
 Xuat1(b);
 Readln;
END.