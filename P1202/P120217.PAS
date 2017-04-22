Program P120217;   {Cat khoang trong thua}
Uses  Crt;
Const fi = 'P120217.inp';
      fo = 'P120217.out';
Var   inp,out: text;
      s: string;

BEGIN
 Assign(inp,fi); Reset(inp);
 Assign(out,fo); Rewrite(out);
 While not Eof(inp) do
 begin
   Readln(inp,s);
   While (s[1]=' ')and(Length(s)>0) do Delete(s,1,1);
   While (s[Length(s)]=' ')and(Length(s)>0) do Delete(s,Length(s),1);
   While (Length(s)>0)and(pos('  ',s)<>0) do Delete(s,pos('  ',s),1);
   Writeln(out,s);
 end;
 Close(out); Close(inp);
END.
