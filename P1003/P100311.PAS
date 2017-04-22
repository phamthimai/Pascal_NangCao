Program P100311;  {Ghi tu file f sang file g khong lap lai}
Uses Crt;
Var  i,n,Trung: integer;
     a: array [1..10000] of Integer;
     f,g: text;

BEGIN
 Assign(f,'P10\P100311f.TXT'); Reset(f);
 Assign(g,'P10\P100311g.TXT'); Rewrite(g);
 n:=0;
 While not SeekEoF(f) do
 begin
   Inc(n);
   Read(f,a[n]);
   Trung:=0; For i:=1 to n-1 do If a[i]=a[n] then inc(Trung);
   If Trung=0 then Write(g,a[n],' ');
   If SeekEoLn(f) then Writeln(g);
 end;
 Close(f); Close(g);
END.

