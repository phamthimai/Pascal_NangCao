Program P111509;  {Tim do dai duong di ngan nhat}
Uses  Crt;
Const nmax=100;
      inp='INPUT.DAT';
Var   f: text;
      n,imin: byte;
      d,dmin: longint;
      a: array [1..nmax,1..nmax] of integer;
      b,bmin,c: array [1..nmax] of byte;

Procedure Nhap;
Var i,j: byte;
Begin
 Assign(f,inp); Reset(f);
 Readln(f,n);
 For i:=1 to n do
 begin
   For j:=1 to n do Read(f,a[i,j]); Readln(f);
 end;
 Close(f);
End;

Procedure Viet;
Var i: integer;
Begin
 Writeln('Duong di ngan nhat la:');
 For i:=1 to imin do Write(bmin[i],' '); Writeln;
 Write('co do dai ',dmin);
 Readln;
End;

Procedure Sinh(i: integer);
Var j,k: integer;
Begin
 For j:=1 to n do
 If (a[b[i-1],j]<>0)and(c[j]=0)and(d<dmin) then
 begin
   b[i]:=j; c[j]:=1; d:=d+a[b[i-1],j];
   If (j=n) then
   begin
     If dmin>d then
     begin
       dmin:=d;
       imin:=i;
       For k:=1 to i do bmin[k]:=b[k];
     end;
   end
   Else If (i<n) then sinh(i+1);
   c[j]:=0; d:=d-a[b[i-1],j];
 end;
End;

BEGIN
 Nhap;
 b[1]:=1; dmin:=MaxInt;
 Sinh(2);
 Viet;
END.