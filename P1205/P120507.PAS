Program P120507;
{Tim nghiem huu ti cua da thuc bac 3 va phan tich no thanh 2 thua so}
Uses Crt;
Type Dathuc = Record
                Deg : Byte;
                Koef: Array [0..100] of Real;
              End;
Var  Dt,Dt1,Dt2: Dathuc;
     X0: Real;
     Cn: Boolean;

Procedure Nhapdathuc(Var Dt: Dathuc);
Var i: Byte;
Begin
 FillChar(Dt,SizeOf(Dt),0);
 With Dt do
 begin
   Deg:=3;
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

Procedure Chia(Dt1,Dt2: Dathuc; Var Dt3,Dt4: Dathuc);
Var Dt,Dt5: Dathuc; i,j: Byte;
Begin
 FillChar(Dt3,SizeOf(Dt3),0);
 If Dt1.Deg<Dt2.Deg Then
 begin
   Dt4:=Dt1;
   Exit;
 end;
 Dt3.Deg:=Dt1.Deg-Dt2.Deg;
 Dt3.Koef[Dt1.Deg-Dt2.Deg]:=Dt1.Koef[Dt1.Deg]/Dt2.Koef[Dt2.Deg];
 Tich(Dt3,Dt2,Dt);
 Hieu(Dt1,Dt,Dt4);
 For i:=Dt1.Deg-1 downto Dt2.Deg do
   If Dt4.Deg >=Dt2.Deg then
   begin
     Dt3.Koef[i-Dt2.Deg]:=Dt4.Koef[Dt4.Deg]/Dt2.Koef[Dt2.Deg];
     Fillchar(Dt5,SizeOf(Dt5),0);
     Dt5.Deg:=Dt4.Deg-Dt2.Deg;
     Dt5.Koef[Dt5.Deg]:=Dt3.Koef[i-Dt2.Deg];
     Tich(Dt5,Dt2,Dt);
     Hieu(Dt4,Dt,Dt4);
   end;
End;

Procedure Tinh;
Var i,j: Byte;
Begin
 While Dt.Koef[0]=0 do
 begin
   For i:=0 to Dt.Deg-1 do
   Dt2.Koef[i]:=Dt2.Koef[i+1];
   Dt2.Deg:=Dt.Deg-1;
   X0:=0;
   Cn:=True;
   Exit;
 end;
 For i:=1 to Round(Dt.Koef[Dt.Deg]) do
   If Round(Dt.Koef[Dt.Deg]) Mod i=0 then
     For j:=1 to Round(Dt.Koef[0]) do
       If Round(Dt.Koef[0]) Mod j=0 then
       begin
         X0:=j/i;
         If Tinhdathuc(Dt,X0)=0 then
         begin
           Dt1.Deg:=1;
           Dt1.Koef[1]:=1;
           Dt1.Koef[0]:=-X0;
           Chia(Dt,Dt1,Dt2,Dt1);
           Cn:=True;
           Exit;
         end;
         X0:=-X0;
         If Tinhdathuc(Dt,X0)=0 then
         begin
           Dt1.Deg:=1;
           Dt1.Koef[1]:=1;
           Dt1.Koef[0]:=-X0;
           Chia(Dt,Dt1,Dt2,Dt1);
           Cn:=True;
           Exit;
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

BEGIN
 Clrscr;
 Cn:=False;
 Nhapdathuc(Dt);
 Tinh;
 If Cn then
   begin
   Writeln('Nghiem cua da thuc la: ',X0);
   Writeln('Thua so thu hai cua da thuc la: ');
   Vietdathuc(Dt2);
   end
 Else Writeln('Da thuc vo nghiem.');
 Readln;
END.






