Program P101508;   {Doi Decimal thanh Binary}
Uses Crt;
Var  n: longint;

Procedure B(k: longint);
Begin
 If k>0 then
 begin
   B(k div 2);
   Write(k mod 2);
 end;
End;

BEGIN
 ClrScr;
 Write('Cho N = '); Readln(n);
 Write('Dang nhi phan cua ',n,': ');
 B(n);
 Readln;
END.