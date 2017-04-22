Program P120501;  {Tinh gia tri cua da thuc}
Uses Crt;
Type Dathuc = Record
                Deg : Byte;
                Koef: Array [0..100] of Real;
              End;
Var  Dt: Dathuc;
     X : Real;

Procedure Nhapdathuc(Var Dt : Dathuc);
Var i: Byte;
Begin
 Write('Cho bac cua da thuc: '); Readln(Dt.Deg);
 For i:=Dt.Deg downto 0 do
 begin
   Write('Cho he so A[',i,'] cua da thuc: '); Readln(Dt.Koef[i]);
 end;
End;

Function Tinhdathuc(Dt: Dathuc; X: Real) : Real;
Var i: Byte; Y: Real;
Begin
 Y:=Dt.Koef[Dt.Deg];
 For i:=Dt.Deg-1 downto 0 do Y:=Y*X+Dt.Koef[i];
 Tinhdathuc:=Y;
End;

BEGIN
 Clrscr;
 Nhapdathuc(Dt);
 Write('Cho biet gia tri cua bien so X: '); Readln(X);
 Write('Gia tri cua da thuc tai ',X:10:2,' la: ',Tinhdathuc(Dt,X):10:2);
 Readln;
END.