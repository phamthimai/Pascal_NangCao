PROGRAM P120516;  {Da thuc bieu dien duong cong}
Uses Crt;
Type Dathuc = Record
                Deg : Byte;
                Koef: Array [0..100] of Real;
              End;
Var  Dt: Dathuc;
     A,B: Real;
     C: Array [0..100,0..100] of LongInt;

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

Procedure Khoitao;
Var i: Byte;
Begin
 FillChar(C,SizeOf(C),0);
 For i:=0 to 100 do
 begin
   C[0,i]:=1; C[i,i]:=1;
 end;
End;

Function Tohop(K,N: Byte): Word;
Begin
 If C[K,N]<>0 Then Tohop:=C[K,N]
 Else
 begin
   C[K,N]:=Tohop(K-1,N-1)+Tohop(K,N-1);
   Tohop:=C[K,N];
 end;
End;

Procedure Chuanhoa(Var Dt: Dathuc);
Var i: Byte;
Begin
 While (Dt.Deg>0)and(Dt.Koef[Dt.Deg] =0) do Dt.Deg:=Dt.Deg-1;
End;

Function Luythua(Coso: Real; Somu: Integer): Real;
Begin
 If Somu=0 then
 begin
   Luythua:=1;
   Exit;
 end;
 If Somu>0 then
 begin
   If Somu Mod 2 =0 then Luythua:=Sqr(Luythua(Coso,Somu Div 2))
   Else Luythua:=Sqr(Luythua(Coso,Somu Div 2)) * Coso;
   Exit;
 end;
 If Somu<0 then Luythua:=1/Luythua(Coso,-Somu);
End;

Procedure Tinh;
Var i,j: Byte;
Begin
 With Dt do
   For i:=Deg downto 1 do
     For j:=i-1 downto 0 do
       Koef[j]:=Koef[j]+Tohop(i-j,i)*Luythua(A,i-j);
 Dt.Koef[0]:=Dt.Koef[0]-B;
 Chuanhoa(Dt);
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
 Nhapdathuc(Dt);
 Write('Nhap so A: ');
 Readln(A);
 Write('Nhap so B: ');
 Readln(B);
 Khoitao;
 Tinh;
 Vietdathuc(Dt);
 Readln;
END.