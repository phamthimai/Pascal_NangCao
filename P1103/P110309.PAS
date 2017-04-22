Program P110509; {Tap hop cac so nguyen chan khong chia het cho 3}
Uses Crt;
Var  so: set of byte;
     i: byte;

BEGIN
 Clrscr;
 so:=[];
 For i:=0 to 255 do
   If i mod 2=0 then so:=so+[i];
 For i:=0 to 255 do
   If (i mod 3=0) then so:=so-[i];
 For i:=0 to 255 do
   If i in so then Write(i:4);
 Readln;
END.