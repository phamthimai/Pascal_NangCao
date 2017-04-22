Program P120110;   {Cac phep tinh phan so}
Uses  Crt;
Const Td: Array[1..4] Of String = ('Tong ','Hieu ','Tich ','Thuong ');

Type  Phanso=Record
               Tu,Mau: Integer;
             End;
Var   Ps1,Ps2,Ps: Phanso;
               D: Byte;

Procedure Nhapphanso(Var Ps: Phanso);
Begin
 Write('Nhap tu so : '); Readln(Ps.Tu);
 Write('Nhap mau so: '); Readln(Ps.Mau);
End;

Procedure Vietphanso(Ps: Phanso);
Begin
 Write(Ps.Tu);
 If Ps.Mau <> 1 then Write('/',Ps.Mau);
End;

Function USCLN(a,b: integer): integer;
Var r: integer;
Begin
 While B<>0 do
 begin
   r:=A mod B;
   A:=B; B:=r;
 end;
 USCLN:=A;
End;

Procedure Toigian(Var Ps: Phanso);
Var US: integer;
Begin
 With Ps do
 begin
   US:=USCLN(Tu,Mau);
   Tu:=Tu div US;
   Mau:=Mau div US;
 end;
End;

Procedure Tong(Ps1,Ps2: Phanso; Var Ps: Phanso);
Begin
 Ps.Mau:=Ps1.Mau*Ps2.Mau;
 Ps.Tu :=Ps1.Tu*Ps2.Mau+Ps2.Tu*Ps1.Mau;
 Toigian(Ps);
End;

Procedure Hieu(Ps1,Ps2: Phanso; Var Ps: Phanso);
Begin
 Ps2.Tu:=-Ps2.Tu;
 Tong(Ps1,Ps2,Ps);
End;

Procedure Tich(Ps1,Ps2: Phanso; Var Ps: Phanso);
Begin
 Ps.Tu :=Ps1.Tu*Ps2.Tu;
 Ps.Mau:=Ps1.Mau*Ps2.Mau;
 Toigian(Ps);
End;

Procedure Thuong(Ps1,Ps2: Phanso; Var Ps: Phanso);
Var T: integer;
Begin
 T:=Ps2.Mau;
 Ps2.Mau:=Ps2.Tu;
 Ps2.Tu :=T;
 Tich(Ps1,Ps2,Ps);
End;

Procedure Nhapdulieu;
Begin
 Clrscr;
 Writeln('Nhap phan so thu nhat: ');
 Nhapphanso(Ps1);
 Writeln('Nhap phan so thu hai: ');
 Nhapphanso(Ps2);
 Writeln('1_Cong;2_Tru;3_NHan;4_Chia');
 Write('Cho biet phep tinh ban muon dung(1/2/3/4): ');
 Readln(D);
End;

Procedure Trinhbay;
Begin
 Write(Td[D],'cua hai phan so la: ');
 Case D of
   1: Tong(Ps1,Ps2,Ps);
   2: Hieu(Ps1,Ps2,Ps);
   3: Tich(Ps1,Ps2,Ps);
   4: Thuong(Ps1,Ps2,Ps);
 End;
 Vietphanso(Ps);
 Readln;
End;

BEGIN
 Nhapdulieu;
 Trinhbay;
END.