Program P110704;
Type ref=^integer;
Var  p,q: ref;

BEGIN
 p^:=5; q^:=6; p^:=q^;
 If p=q then p:=nil Else If p^=q^ then q:=p;
 If p=q then q^:=4;
 Writeln(p^);
END.
