Program P100309;   {Ghi tu file f sang files g1 va g2}
Uses Crt;
Var  i: integer;
     f,g1,g2: text;

BEGIN
 Assign(f,'P10\P100309.TXT'); Reset(f);
 Assign(g1,'P10\P1003091.TXT'); Rewrite(g1);
 Assign(g2,'P10\P1003092.TXT'); Rewrite(g2);
 While not SeekEoF(f) do
 begin
   Read(f,i);
   If Odd(i) then Write(g1,i,' ') Else Write(g2,i,' ');
   If SeekEoLn(f) then begin Writeln(g1); Writeln(g2); end;
 end;
 Close(f); Close(g1); Close(g2);
END.

