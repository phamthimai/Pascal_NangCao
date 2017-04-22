Program P100306;   {Doi chu hoa thanh chu thuong}
Uses Crt;
Var  S: String;
     i: integer;
     f,g: text;

BEGIN
 Assign(f,'P10\P1003061.TXT'); Reset(f);
 Assign(g,'P10\P1003062.TXT'); Rewrite(g);
 While not EoF(f) do
 begin
   Readln(f,S);
   For i:=1 to Length(S) do
     If S[i] in ['A'..'Z'] then S[i]:=Chr(Ord(S[i])+32);
   Writeln(g,S);
 end;
 Close(f); Close(g);
END.

