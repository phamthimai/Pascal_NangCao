Program P120113;  {Tim nghiem nguyen, theo so do Hoorner}
Uses Crt;
Type Dathuc=Record
              Deg : Byte;
              Koef: Array[0..100] of integer;
            End;
Var  Dt: Dathuc;

Procedure Nhapdathuc(Var Dt: Dathuc);
Var i: Byte;
Begin
 ClrScr;
 FillChar(Dt,SizeOf(Dt),0);
 With Dt do
 begin
   Write('Cho bac cua da thuc: '); Readln(Deg);
   For i:=Deg downto 0 do
   begin
     Write('Cho he so A[',i,'] cua da thuc: ');
     Readln(Koef[i]);
   end;
 end;
End;

Function Tinhdathuc(Dt: Dathuc; X: real): real;
Var i: byte; Y: real;
Begin
 With Dt Do
 begin
   Y:=Koef[Deg];
   For i:=Deg-1 downto 0 do Y:=X*Y+Koef[i];
 end;
 Tinhdathuc:=Y;
End;

Procedure Tinh;
Var i,j,S: byte; X: integer;
Begin
 S:=0;
 While Dt.Koef[0] = 0 do
 begin
   S:=S+1;
   Writeln('Nghiem thu ',S,' la: ',0);
   For i := 0 to Dt.Deg-1 do Dt.Koef[i]:=Dt.Koef[i+1];
   Dt.Deg:=Dt.Deg-1;
 end;
 For i:=1 to Dt.Koef[Dt.Deg] do
   If Dt.Koef[Dt.Deg] mod i=0 then
     For j:=1 to Dt.Koef[0] do
       If Dt.Koef[0] mod j=0 then
         If j mod i=0 then
         begin
           X:=Round(J/I);
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
 Readln;
End;

BEGIN
 Nhapdathuc(Dt);
 Tinh;
END.