Program P120512;
{Tim da thuc bac cao nhat la USC cua hai da thuc cho truoc}
Uses Crt;
Type Dathuc = Record
                Deg : Byte;
                Koef: Array [0..100] of Real;
              End;
Var  Dt1,Dt2,Dt3: Dathuc;

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
 While (Dt.Deg>0)and(Dt.Koef[Dt.Deg]=0) do Dt.Deg:=Dt.Deg-1;
End;

Procedure Hieu(Dt1,Dt2: Dathuc; Var Dt3: Dathuc);
Var i: Byte;
Begin
 Dt3.Deg:=Dt2.Deg;
 If Dt1.Deg > Dt2.Deg then Dt3.Deg:=Dt1.Deg;
 For i:=0 to Dt3.Deg do
   Dt3.Koef[i]:=Dt1.Koef[i]-Dt2.Koef[i];
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

Procedure Chia(Dt1,Dt2: Dathuc; Var Dt3,Dt4: Dathuc);
Var Dt,Dt5: Dathuc; i,j: Byte;
Begin
 FillChar(Dt3,SizeOf(Dt3),0);
 If Dt1.Deg<Dt2.Deg then
 begin
   Dt4:=Dt1;
   Exit;
 end;
 Dt3.Deg:=Dt1.Deg-Dt2.Deg;
 Dt3.Koef[Dt1.Deg-Dt2.Deg]:=Dt1.Koef[Dt1.Deg]/Dt2.Koef[Dt2.Deg];
 Tich(Dt3,Dt2,Dt);
 Hieu(Dt1,Dt,Dt4);
 For i:=Dt1.Deg-1 downto Dt2.Deg do
   If Dt4.Deg>=Dt2.Deg then
   begin
     Dt3.Koef[i-Dt2.Deg]:=Dt4.Koef[Dt4.Deg]/Dt2.Koef[Dt2.Deg];
     Fillchar(Dt5,SizeOf(Dt5),0);
     Dt5.Deg:=Dt4.Deg-Dt2.Deg;
     Dt5.Koef[Dt5.Deg]:=Dt3.Koef[i-Dt2.Deg];
     Tich(Dt5,Dt2,Dt);
     Hieu(Dt4,Dt,Dt4);
   end;
End;

Procedure USC(Dt1,Dt2: Dathuc; Var Dt3: Dathuc);
Var Dt: Dathuc;
Begin
 If Dt1.Deg<Dt2.Deg then
 begin
   Dt:=Dt1; Dt1:=Dt2; Dt2:=Dt;
 end;
 Chia(Dt1,Dt2,Dt1,Dt);
 While (Dt.Deg>0)or(Dt.Koef[0]<>0) do
 begin
   Dt:=Dt1; Dt1:=Dt2; Dt2:=Dt;
   Chia(Dt1,Dt2,Dt1,Dt);
 end;
 Dt3:=Dt2;
End;

BEGIN
 Clrscr;
 Writeln('Nhap da thuc thu nhat: ');
 Nhapdathuc(Dt1);
 Writeln('Nhap da thuc thu hai: ');
 Nhapdathuc(Dt2);
 USC(DT1,DT2,DT3);
 Writeln('Uoc so chung cua hai da thuc la: ');
 Vietdathuc(Dt3);
 Readln;
END.