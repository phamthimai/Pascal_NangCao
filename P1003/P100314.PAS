Program P100314a;  {Ghi tu file f sang file g co sap xep}
Uses Crt;
Var  i: integer;
     f,g,h: text;

BEGIN
 Assign(f,'P10\P100314f.TXT'); Reset(f);
 Assign(g,'P10\P100314g.TXT'); Rewrite(g);
 Assign(h,'P10\P100314h.TXT'); Rewrite(h);
 While not SeekEoF(f) do
 begin
   Read(f,i);
   If i>0 then Write(g,i,' ') Else Write(h,i,' ');
 end;
 Reset(h);
 While not SeekEoF(h) do
 begin
   Read(h,i); Write(g,i,' ')
 end;
 Close(f); Close(g); Close(h);
END.

