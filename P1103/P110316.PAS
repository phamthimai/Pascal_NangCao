Program P110316;
Uses Crt;
Var  tap: set of char;
     ch: char;

BEGIN
 tap:=[];
 Write('Nhap cac phan tu cho mot tap hop cac ki tu: ');
 Repeat
   ch:=ReadKey;
   tap:=tap+[ch];
   Writeln(ch);
 Until not(ch in ['a'..'z']);
 For ch:='a' to 'z' do
   If ch in tap then Write(ch,' ');
 Readln;
END.

