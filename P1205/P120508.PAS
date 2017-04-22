Program P120508;  {Tinh dao ham cua mot da thuc cho truoc}
Uses Crt;
Type Dathuc = Record
                Deg : Byte;
                Koef: Array [0..100] of Real;
              End;
Var  Dt1,Dt2: Dathuc;
     X: Real;

Procedure Nhapdathuc(Var Dt: Dathuc);
Var i: Byte;
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

Procedure Tinh;
Var i: Byte;
Begin
 Dt2.Deg:=Dt1.Deg-1;
 For i:=Dt1.Deg downto 1 do Dt2.Koef[i-1]:=Dt1.Koef[i]*i;
End;

BEGIN
 Clrscr;
 Nhapdathuc(Dt1);
 Tinh;
 Vietdathuc(Dt2);
 Readln;
END.