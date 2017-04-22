Program P111101;   {So sanh hai File}
Uses  Crt;
Const inp1='P11\P1111\s1.inp';
      inp2='P11\P1111\s2.inp';
Var   f1,f2: file of byte;
      c1,c2: byte;

BEGIN
 Clrscr;
 Assign(f1,inp1); Reset(f1);
 Assign(f2,inp2); Reset(f2);
 While (not Eof(f1))and(not Eof(f2)) do
 begin
   Read(f1,c1);
   Read(f2,c2);
   If c1<>c2 then
   begin
     Writeln('Hai file khac nhau');Readln;
     Close(f2);
     Close(f1);
     exit;
   end;
 end;
 If (not Eof(f1))or(not Eof(f2)) then Writeln('Hai file khac nhau.')
 Else Writeln('Hai file giong nhau.');
 Close(f2); Close(f1);
 Readln;
END.