Program P120517;   {Tinh he so da thuc}
Uses Crt;
Type Dathuc = Record
                Deg : Byte;
                Koef: Array [0..100] of Real;
              End;
Var  Dt,Dt1,Dt2,Dt3: Dathuc;
     N: Byte;

Procedure Vietdathuc(Dt: Dathuc);
Var i: Byte;
Begin
 With Dt do
 begin
   Writeln('Bac cua da thuc la: ',Deg);
   For i:=Deg downto 0 do
     Writeln('He so A[',i,'] cua da thuc la: ',Koef[i]);
 end;
End;

Procedure Chuanhoa(Var Dt: Dathuc);
Var i: Byte;
Begin
 While Dt.Koef[Dt.Deg]=0 do Dt.Deg:=Dt.Deg-1;
End;

Procedure Hieu(Dt1,Dt2: Dathuc; Var Dt3: Dathuc);
Var i: Byte;
Begin
 Dt3.Deg:=Dt2.Deg;
 If Dt1.Deg>Dt2.Deg then Dt3.Deg:=Dt1.Deg;
 For i:=0 to Dt3.Deg do Dt3.Koef[i]:=Dt1.Koef[i]-Dt2.Koef[i];
 Chuanhoa(Dt3);
End;

Procedure Tich(Dt1,Dt2: Dathuc; Var Dt3: Dathuc);
Var i,j: Byte;
Begin
 FillChar(Dt3,SizeOf(Dt3),0);
 Dt3.Deg:=Dt1.Deg+Dt2.Deg;
 For i:=0 to Dt1.Deg do
   For j:=0 to Dt2.Deg do
     Dt3.Koef[i+j]:=Dt3.Koef[i+j]+Dt1.Koef[i]*Dt2.Koef[j];
End;

Procedure Tinh;
Var i: Byte;
Begin
 Dt1.Deg:=0; Dt1.Koef[0]:=1;
 Dt2.Deg:=1; Dt2.Koef[1]:=1;
 Dt2.Koef[0]:=0;
 Dt.Deg:=1;
 Dt.Koef[0]:=0; Dt.Koef[1]:=2;
 If N=0 then  Dt3:=Dt1
 Else         Dt3:=Dt2;
 For i:=2 to N do
 begin
   Tich(Dt,Dt2,Dt3);
   Hieu(Dt3,Dt1,Dt3);
   Dt1:=Dt2; Dt2:=Dt3;
 end;
End;

BEGIN
 Clrscr;
 Write('Nhap so N: ');
 Readln(N);
 Tinh;
 Vietdathuc(Dt3);
 Readln;
END.