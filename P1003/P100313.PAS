Program P100313;   {Doi noi dung file f1 va f2}

Procedure Chep(a,b: String);
Var  S: String; f,g: text;
Begin
 Assign(f,a); Reset(f);
 Assign(g,b); Rewrite(g);
 While not EoF(f) do
 begin
   Readln(f,S); Writeln(g,S)
 end;
 Close(f); Close(g);
End;

BEGIN
 Chep('P10\P1003131.TXT','P10\P100313.TXT');
 Chep('P10\P1003132.TXT','P10\P1003131.TXT');
 Chep('P10\P100313.TXT','P10\P1003132.TXT');
END.

