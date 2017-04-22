Program P121306;        {Sap xep}
Uses  Crt;
Const Inp='P121306.Inp';
      Out='P121306.Out';
      Nmax=100;
      Mmax=100;
Type  Dong=array[1..Nmax+3]of integer;
Var   F: text;
      M,N: byte;
      A,B: array [0..Mmax] of Dong;

Procedure Nhap;
Var i,j: byte;
Begin
 Assign(F,Inp); Reset(F);
 Readln(F,M,N);
 For i:=1 to M do
 begin
   For j:=1 to N do Read(F,A[i,j]); Readln(f);
 end;
 Close(F);
End;

Procedure InMang;
Var i,j: byte;
Begin
 For i:=1 to M do
 begin
   For j:=1 to N do Write(F,B[i,j]:6); Writeln(F);
 end;
 Writeln(F);
End;

Procedure CauA;
Var i,j,k: byte; T: Dong;
Begin
 B:=A;
 For i:=1 to M-1 do
 begin
   k:=i;
   For j:=i+1 to M do
     If B[k,1]>B[j,1] then k:=j;
       If k<>i then
       begin
         T:=B[i];
         B[i]:=B[k];
         B[k]:=T;
       end;
 end;
 Writeln(F,'Cau A');
 InMang;
End;

Procedure CauB;
Var i,j,k: byte; T: Dong;
Begin
 {B[i,N+1] chua tong cac phan tu cua dong i}
 B:=A;
 For i:=1 to M do
 begin
   B[i,N+1]:=0;
   For j:=1 to N do B[i,N+1]:=B[i,N+1]+B[i,j];
 end;
 For i:=1 to M-1 do
 begin
   k:=i;
   For j:=i+1 to M do
     If B[k,N+1]>B[j,N+1] then k:=j;
   If k<>i then
   begin
     T:=B[i];
     B[i]:=B[k];
     B[k]:=T;
   end;
 end;
 Writeln(F,'Cau B');
 InMang;
End;

Procedure CauC;
Var i,j,k: byte; T: Dong;
Begin
 {B[i,N+2] chua phan tu nho nhat cua dong i}
 B:=A;
 For i:=1 to M do
 begin
   B[i,N+2]:=Maxint;
   For j:=1 to N do
     if B[i,N+2]>B[i,j] then B[i,N+2]:=B[i,j];
 end;

 For i:=1 to M-1 do
 begin
   k:=i;
   For j:=i+1 to M do
     If B[k,N+2]>B[j,N+2] then k:=j;
     If k<>i then
     begin
       T:=B[i];
       B[i]:=B[k];
       B[k]:=T;
     end;
 end;
 Writeln(F,'Cau C');
 InMang;
End;

Procedure CauD;
Var i,j,k: byte; T: Dong;
Begin
 {B[i,N+3] chua phan tu lon nhat cua dong i}
 B:=A;
 For i:=1 to M do
 begin
   B[i,N+3]:=-Maxint;
   For j:=1 to N do
     If B[i,N+3]<B[i,j] then B[i,N+3]:=B[i,j];
 end;

 For i:=1 to M-1 do
 begin
   k:=i;
   For j:=i+1 to M do
     If B[k,N+3]<B[j,N+3] then k:=j;
   If k<>i then
   begin
     T:=B[i];
     B[i]:=B[k];
     B[k]:=T;
   end;
 end;
 Writeln(F,'Cau D');
 InMang;
End;

BEGIN
 Clrscr;
 Nhap;
 Assign(F,Out);
 Rewrite(F);
 CauA;
 CauB;
 CauC;
 CauD;
 Close(F);
END.
3 3
6 2 3
0 4 5
1 3 4