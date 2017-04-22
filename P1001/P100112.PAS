Program P100112;   {Tao Menu}
Uses Crt;
Var  i,c: integer;
     sh,s: real;

Procedure Tinhtong1;
Begin
 i:=1; s:=0;
 While i<=100 do
 begin
   s:=s+i;
   inc(i);
 end;
 Write('1+2+...+100 = ', s:0:0);
End;

Procedure Tinhtich;
Begin
 i:=1; s:=1;
 While i<=30 do
 begin
   s:=s*i;
   inc(i);
 end;
 Write('1.2...30 = ', s:0:0);
End;

Procedure Tinhtong2;
Begin
 sh:=1; s:=0;
 While sh>=0.000001 do
 begin
   sh:=sh/3;
   s:=s+sh;
 end;
 Write('1/3+1/9+1/27+... = ', s:0:7);
End;

BEGIN
 Clrscr;
 Writeln('1. Tinh tong 1+2+...+100');
 Writeln('2. Tinh tich 1.2...30');
 Writeln('3. Tinh tong 1/3+1/9+1/27+... voi sai so e<0.000001');
 Write('   Lua chon cua ban: '); Readln(c);
 Case c of
   1: Tinhtong1;
   2: Tinhtich;
   3: Tinhtong2;
   Else Write('Ban da khong chon 1, 2, hoac 3! ');
 End;
 Readln;
END.