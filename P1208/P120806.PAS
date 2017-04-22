Program P120806;   {Nhan hai so nguyen duong}
Uses  Crt;
Const MN = 30;
Var   a,b,t: longint;

Procedure Nhap;
Begin
 Write('A = '); Readln(A);
 Write('B = '); Readln(B);
End;

Procedure Vietso(a,t: longint);
Var s: string; i: integer;
Begin
 str(a,s);
 For i:=1 to t do s:=s+' ';
 While length(s)<MN do s:=' '+s;
 Writeln(s);
End;

Procedure Viet;
Var c,cc: longint;
Begin
 ClrScr;
 t:=a*b; cc:=0;
 Vietso(a,0);
 Vietso(b,0);
 Writeln;
 While b<>0 do
 begin
   c:=b mod 10;
   b:=b div 10;
   If c<>0 then Vietso(c*a,cc);
   Inc(cc);
 end;
 Writeln;
 Vietso(t,0);
End;

BEGIN
 ClrScr;
 Nhap;
 Viet;
 Readln;
END.
