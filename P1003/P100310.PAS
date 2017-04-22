Program P100310; {Ghi tu file f sang file g theo thu tu nguoc lai}
Uses Crt;
Var  i,n: integer;
     a: array [1..10000] of Integer;
     f,g: text;

BEGIN
 Assign(f,'P10\P100310f.TXT'); Reset(f);
 Assign(g,'P10\P100310g.TXT'); Rewrite(g);
 n:=0;
 While not SeekEoF(f) do
 begin
   Read(f,i);
   Inc(n);
   a[n]:=i;
 end;
 For i:=n downto 1 do Write(g,a[i],' ');
 Close(f); Close(g);
END.

