Program P120215;   {Dem ( ) Begin End}
Uses  Crt;
Const fi='P12\Loigiai\P1202\P120215.txt';

Function Dem(c: string): integer;
Var n,l: integer; f: text; S: string;
Begin
 l:=Length(c); n:=0;
 Assign(f,fi); Reset(f);
 While not Eof(f) do
 begin
   Readln(f,S);
   While pos(c,s)<>0 do
   begin
     Inc(n); Delete(s,pos(c,s),l);
   end;
 end;
 Close(f);
 Dem:=n;
End;

BEGIN
 Clrscr;
 Write(' So luong cac dau ( va ) ');
 If Dem('(')<>Dem(')') then Writeln('khong bang nhau.')
 Else Writeln('bang nhau.');
 Write(' So luong cac tu Begin va End ');
 If Dem('End')<>Dem('Begin') then Writeln('khong bang nhau.')
 Else Writeln('bang nhau.');
 Readln;
END.