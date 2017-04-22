Program P110705;
Type kdl=integer;
Var i: ^kdl;
    a: kdl;

BEGIN
 i:=Addr(a);
 a:=100;
 Writeln(i^);
 i^:=200;
 Writeln(a);
 Readln;
END.
