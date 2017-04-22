Program P121019;  {Mo phong tieng coi hu}
Uses  Crt;

Procedure Siren;
Var Fr: integer;
Begin
 For Fr:=500 to 2000 do
 begin
   Delay(1); Sound(Fr);
 end;
 For Fr:=2000 downto 500 do
 begin
   Delay(1); Sound(Fr);
 end;
 NoSound;
End;

BEGIN
  Repeat Siren Until KeyPressed;
END.