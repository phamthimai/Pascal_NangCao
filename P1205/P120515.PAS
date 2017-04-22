Program P120515;   {Tinh dien tich}
Uses Crt;
Type Dathuc = Record
                Deg : Byte;
                Koef: Array [0..100] of Real;
              End;
Var  A,B,S: Real;
     Dt: Dathuc;
     N: Byte;

Procedure Nhapdathuc(Var Dt: Dathuc);
Var  i: Byte;
Begin
 With Dt do
 begin
   Write('Cho bac cua da thuc: '); Readln(Deg);
   For i:=Deg downto 0 do
   begin
     Write('Cho he so A[',i,'] cua da thuc: '); Readln(Koef[i]);
   end;
 end;
End;

Function Tinhdathuc(Dt: Dathuc; X: Real): Real;
Var i: Byte; Y: Real;
Begin
 With Dt do
 begin
   Y:=Koef[Deg];
   For i:=Deg-1 downto 0 do Y:=X*Y+Koef[i];
 end;
 Tinhdathuc:=Y;
End;

Procedure Tinh;
Var C,C1,C2: Real; i: Byte;
Begin
 S:=0; C1:=A; C:=(B-A)/N; C2:=C1+C;
 For i:=1 to N do
 begin
   S:=S+C*(Tinhdathuc(Dt,C1)+Tinhdathuc(Dt,C2))/2;
   C1:=C2; C2:= C1+C;
 end;
End;

BEGIN
 Clrscr;
 Nhapdathuc(Dt);
 Write('Nhap so A: ');
 Readln(A);
 Write('Nhap so B: ');
 Readln(B);
 Write('Nhap do chinh xac N: ');
 Readln(N);
 Tinh;
 Writeln('Dien tich la: ',S);
 Readln;
END.