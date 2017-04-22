Program P110105;  {lap mang vuong}
Uses Crt;
Var  a: array [1..7,1..7] of integer;
     i,j,hang: integer;

BEGIN
 Clrscr;
 hang:=2;
 (* Vong ngoai *)
 For i:=1 to 6 do
 begin
   a[1,i]:=i;a[i,7]:=i+6;a[7,8-i]:=i+12;a[8-i,1]:=i+18;
 end;
 (* Vong thu hai *)
 For i:=2 to 5 do
 begin
   a[2,i]:=i+23;a[i,6]:=i+27;a[6,8-i]:=i+31;a[8-i,2]:=i+35;
 end;
 (* Vong thu ba *)
 For i:=3 to 4 do
 begin
   a[3,i]:=i+38;a[i,5]:=i+40;a[5,8-i]:=i+42;a[8-i,3]:=i+44;
 end;
 a[4,4]:=49;
 ClrScr;
 For i:= 1 to 7 do
   For j:=1 to 7 do
   begin
     Gotoxy((j-1)*6+10,hang+(i*2)); Write(a[i,j]:5);
   end;
 Readln;
END.