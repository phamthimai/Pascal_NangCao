Program P101101;   {Mang so thuc}
Uses  Crt;
Const nmax=100;
      inp='P1011\p101101.inp';
Var   f: text; n: byte;
      a: array [1..nmax,1..nmax] of real;

Procedure Nhap;
Var i,j: byte;
Begin
 Assign(f,inp); Reset(f);
 Readln(f,n);
 For i:=1 to n do
 begin
   For j:=1 to n do Read(f,a[i,j]);
   Readln(f);
 end;
 Close(f);
End;

Procedure XacDinh;
Var   i,j: byte;
      TongA,TongB,Max: real;
Begin
 TongA:=0;
 TongB:=0;
 Max:=0;
 For i:=1 to n do
 begin
   TongA:=TongA+a[i,i];
   TongB:=TongB+a[i,n-i+1];
   If a[i,n-i+1]>Max then Max:=a[i,n-i+1];
   If (i<n)and(Max<a[i,n-i]) then Max:=a[i,n-i];
   If (i>1)and(Max<a[i,n-i+2]) then Max:=a[i,n-i+2];
 end;
 Writeln('Ket qua:');
 Writeln('a. ',TongA:0:3);
 Writeln('b. ',TongB:0:3);
 Writeln('c. ',Max:0:3);
End;

BEGIN
 ClrScr;
 Nhap;
 XacDinh;
END.