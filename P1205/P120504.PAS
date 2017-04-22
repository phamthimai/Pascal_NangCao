Program P120504; {Tinh luy thua bac n cua mot da thuc cho truoc}
Uses Crt;
Type Dathuc = Record
                Deg : Byte;
                Koef: Array [0..100] of Real;
              End;
Var  Dt1,Dt2,Dt3: Dathuc;
     N: Byte;

Procedure Nhapdathuc(Var Dt: Dathuc);
Var i: Byte;
Begin
 FillChar(Dt,SizeOf(Dt),0);
 With Dt do
 begin
   Write('Cho bac cua da thuc: '); Readln(Deg);
   For i:=Deg downto 0 do
   begin
     Write('Cho he so A[',i,'] cua da thuc: '); Readln(Koef[i]);
   end;
 end;
End;

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
 Dt2:=Dt1;
 For i:=2 to N do
 begin
   Tich(Dt1,Dt2,Dt3);
   Dt1:=Dt3;
 end;
End;

BEGIN
 Clrscr;
 Writeln('Nhap da thuc: ');
 Nhapdathuc(Dt1);
 Write('Nhap so N: ');
 Readln(N);
 Tinh;
 Writeln('Luy thua bac ',N,' cua da thuc la: ');
 Vietdathuc(Dt1);
 Readln;
END.