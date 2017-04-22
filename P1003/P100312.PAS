Program P100312;  {Ghi vao cuoi file f tu 'end'}
Uses Crt;
Var  f: text;

BEGIN
 Assign(f,'P10\P100312.TXT');
 Append(f);
 Writeln(f,'end');
 Close(f);
END.

