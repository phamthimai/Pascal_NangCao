Program P120518;   {Tinh da thuc cua da thuc}
Uses Crt;
Type Dathuc = Record
                Deg : Byte;
                Koef: Array [0..100] of Real;
              End;
Var  DtP,DtQ,Dt: Dathuc;
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
 While (Dt.Deg >0)and(Dt.Koef[Dt.Deg]=0) do Dt.Deg:=Dt.Deg-1;
End;

Procedure Tong(Dt1,Dt2: Dathuc; Var Dt3: Dathuc);
Var i: Byte;
Begin
 Dt3.Deg:=Dt2.Deg;
 If Dt1.Deg>Dt2.Deg then Dt3.Deg:=Dt1.Deg;
 For i:=0 to Dt3.Deg do
   Dt3.Koef[i]:=Dt2.Koef[i]+Dt1.Koef[i];
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

Procedure Hop(DtP,DtQ: Dathuc; Var Dt: Dathuc);
Var Dt1,Dt2: Dathuc; i: Byte;
Begin
 FillChar(Dt,SizeOf(Dt),0);
 Dt.Koef[0]:=DtP.Koef[0];
 Dt1.Deg:=0;
 Dt1.Koef[0]:=1;
 For i:=1 to DtP.Deg do
 begin
   Tich(Dt1,DtQ,Dt2);
   Dt1:=Dt2;
   Dt2.Deg:=0;
   Dt2.Koef[0]:=Dtp.Koef[i];
   Tich(Dt2,Dt1,Dt2);
   Tong(Dt2,Dt,Dt);
 end;
End;

BEGIN
 Clrscr;
 Writeln('Nhap da thuc P: ');
 Nhapdathuc(DtP);
 Writeln('Nhap da thuc Q: ');
 Nhapdathuc(DtQ);
 Write('P(Q(X)) la: ');
 Hop(DtP,DtQ,Dt);
 Vietdathuc(Dt);
 Write('Q(P(X)) la: ');
 Hop(DtQ,DtP,Dt);
 Vietdathuc(Dt);
 Readln;
END.