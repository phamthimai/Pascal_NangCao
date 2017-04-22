Program P110702;
Uses Crt;
Type kdl=integer;
Var  i: ^kdl;
     a: kdl;

BEGIN
 Clrscr;
 i:=Addr(a);
 a:=100;
 Write(i^);
 Readln;
END.

