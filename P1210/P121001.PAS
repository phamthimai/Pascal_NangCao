Program P121001;  {Day not dung trong am nhac}
Uses  Crt;
Const d3=261;
Var   a: array [0..95] of integer;
      i: integer;
      q,f: real;

BEGIN
 q:=Exp(ln(2)/12);
 f:=d3;
 For i:=36 to 95 do
 begin
   a[i]:=round(f); f:=f*q;
 end;
 f:=d3;
 For i:=36 downto 0 do
 begin
   a[i]:=round(f); f:=f/q;
 end;
 For i:=0 to 95 do
 begin
   Sound(a[i]);
   Delay(100);
 end;
 NoSound;
END.