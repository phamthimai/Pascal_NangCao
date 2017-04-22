Program P110316;  {loai bo cac phan tu khoi tap hop}
Uses Crt;
Var  tap: set of char;
     ch: char;

BEGIN
 tap:=[];
 Writeln('Nhap cac phan tu cho mot tap hop cac ki tu: ');
 Repeat
   ch:=ReadKey;
   tap:=tap+[ch];
   Writeln(ch);
 Until not(ch in ['a'..'z']);
 Writeln('Cac phan tu cua tap hop la:');
 For ch:='a' to 'z' do
   If ch in tap then Write(ch,' ');
 Writeln;
 Writeln('Ban muon bo cac phan tu nao khoi tap hop:');
 Repeat
   ch:=ReadKey;
   tap:=tap-[ch];
   Writeln(ch);
 Until not(ch in ['a'..'z']);
 Writeln('Cac phan tu con lai cua tap hop la:');
 For ch:='a' to 'z' do
   If ch in tap then Write(ch,' ');
 Readln;
END.

