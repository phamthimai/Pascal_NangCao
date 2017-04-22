Program P110706;
Uses Crt;
Type Str18=String[18];
Var  P: ^Str18;

BEGIN
 ClrScr;
 New(P);
 P^:='Now you see it...';
 Writeln(p^);
 Dispose(P);
 Readln;
END.

