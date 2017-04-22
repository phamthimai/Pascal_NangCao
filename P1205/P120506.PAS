Program P120506;  {Tim ngiem huu ti cua mot da thuc he so nguyen}
Uses Crt;
Type Dathuc = Record
                Deg : Byte;
                Koef: Array [0..100] of Integer;
              End;
Var  Dt: Dathuc;
     X : real;

Procedure Nhapdathuc(Var Dt: Dathuc);
Var k: Byte;
Begin
 FillChar(Dt,SizeOf(Dt),0);
 With Dt do
 begin
   Write('Cho bac cua da thuc: '); Readln(Deg);
   For k:=Deg downto 0 do
   begin
     Write('Cho he so A[',k,'] cua da thuc: '); Readln(Koef[k]);
   end;
 end;
End;

Function Tinhdathuc(Dt: Dathuc; X: Real): Real;
Var k: Byte; Y: Real;
Begin
 With Dt do
 begin
   Y:=Koef[Deg];
   For k:=Deg-1 downto 0 do Y:=X*Y+Koef[k];
 end;
 Tinhdathuc:=Y;
End;

Procedure Tinh;
Var k,l,S: Byte; X: Real;
Begin
 S:=0;
 While Dt.Koef[0]=0 do
 begin
   S:=S+1;
   Writeln('Nghiem thu ',S,' la: ',0);
   For k:=0 to Dt.Deg-1 do
   Dt.Koef[k]:=Dt.Koef[k+1];
   Dt.Deg:=Dt.Deg-1;
 end;
 For l:=1 to Dt.Koef[Dt.Deg] do
  If Dt.Koef[Dt.Deg] Mod l=0 then
    For k:=1 to Dt.Koef[0] do
      If Dt.Koef[0] Mod k=0 then
      begin
        X:=k/l;
        If Tinhdathuc(Dt,X)=0 then
        begin
          S:=S+1;
          Writeln('Nghiem thu ',S,' la: ',X);
        end;
        X:=-X;
        If Tinhdathuc(Dt,X)=0 then
        begin
          S:=S+1;
          Writeln('Nghiem thu ',S,' la: ',X);
        end;
      end;
 Writeln('So nghiem cua da thuc la: ',S);
 Readln;
End;

BEGIN
 Clrscr;
 Nhapdathuc(Dt);
 Tinh;
END.