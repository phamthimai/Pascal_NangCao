Program P100308;   {Ghep file f1 va f2 vao file g}
Uses Crt;
Var  S: String;
     f1,f2,g: text;

BEGIN
 Assign(f1,'P10\P1003081.TXT'); Reset(f1);
 Assign(f2,'P10\P1003082.TXT'); Reset(f2);
 Assign(g,'P10\P1003083.TXT'); Rewrite(g);
 While not EoF(f1) do
 begin
   Readln(f1,S); Writeln(g,S)
 end;
 While not EoF(f2) do
 begin
   Readln(f2,S); Writeln(g,S)
 end;
 Close(f1); Close(f2); Close(g);
END.

