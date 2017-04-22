Program P101509;   {cac so co 2 chu so}
Uses Crt;
Var  i,j: byte;

BEGIN
 ClrScr;
 Writeln('Cac so co 2 chu so lap nen tu 4 chu so 1,2,3,4:');
 For i:=1 to 4 do
   For j:=1 to 4 do Writeln(i,j);
 Readln;
END.