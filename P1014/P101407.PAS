Program P101407; {tinh so nghiem nguyen cua phuong trinh x1+x2+x3=11}
Uses  Crt;
Var   i,j,k,d: byte;

BEGIN
 ClrScr;
 d:=0;
 For i:=0 to 11 do
   For j:=0 to 11 do
     For k:=0 to 11 do
       If i+j+k=11 then Inc(d);
 Write('Phuong trinh co ',d,' nghiem nguyen khong am.');
 Readln;
END.