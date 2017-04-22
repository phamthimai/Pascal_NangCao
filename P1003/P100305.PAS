Program P100305;  {Chep file f sang file g}
Uses Crt;
Var  S: String;
     f,g: text;

BEGIN
 Assign(f,'P10\P1003051.TXT'); Reset(f);
 Assign(g,'P10\P1003052.TXT'); Rewrite(g);
 While not EoF(f) do
 begin
   Readln(f,S);
   Writeln(g,S);
 end;
 Close(f); Close(g);
END.

