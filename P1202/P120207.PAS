Program P120207;
Type Rec=Record
            y: set of byte;
         end;
     Mang=array [1..10] of Rec;
     P=^Mang;
Var  x: P;
     S: set of byte;

BEGIN
 S:=x^[5].y+[5];
END.
