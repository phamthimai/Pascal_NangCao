{Chuong trinh chay voi file inp nho hon 55000 byte
tile : chia cho tong so chu cai}
Program P120803;
Uses  Crt;
Const MN = 255;
      fn = 'P1208\P120803.inp';
      gn = 'P120803.out';
Type  mang1 = array [0..255] of integer;
Var   a  : mang1;
      f,g: text;

Procedure Doc;
Var c: char;
Begin
 Assign(f,fn); Reset(f);
 FillChar(a,SizeOf(a),0);
 While not Eof(f) do
 begin
   While not Eoln(f) do
   begin
     Read(f,c); c:=UpCase(c);
     Inc(a[ord(c)]);
   end;
   Readln(f);
 end;
 Close(f);
End;

Procedure Viet;
Var i,tong: integer;
Begin
 Assign(g,gn); Rewrite(g);
 Tong:=0;
 For i:=0 to 255 do
   If chr(i) in ['a'..'z','A'..'Z'] then Tong:=Tong+a[i];
 For i:=0 to 255 do
   If chr(i) in ['a'..'z','A'..'Z'] then
     If a[i]<>0 then Writeln(g,chr(i),': ',a[i]/Tong*100:4:4,' %');
 Close(g);
End;

BEGIN
 Clrscr;
 Doc;
 Viet;
END.
