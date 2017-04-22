Program P120716;   {Sinh so ngau nhien}
Uses Crt;
Var  f: text;
     i: integer;

BEGIN
 Assign(f,'RANDOM.DAT');
 Rewrite(f);
 Randomize;
 For i:=1 to 10000 do Writeln(f,Random);
 Close(f);
END.