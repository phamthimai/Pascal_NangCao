Program P111203;   {Liet ke day so}
Uses  Crt;
Const out='P111203.out';
Var   n: integer;
      b: array [1..10] of integer;
      f: text;

Procedure Viet;
Var i: integer;
Begin
 For i:=1 to n do Write(f,b[i]); Writeln(f);
End;

Procedure Sinh(i: integer);
Var j: integer;
Begin
 For j:=0 to 4 do
 begin
   b[i]:=j;
   If i=n then Viet
   Else If (i>1)or(j<>0) then Sinh(i+1);
 end;
End;

BEGIN
 Clrscr;
 Write('n = '); Readln(n);
 Assign(f,out); Rewrite(f);
 Sinh(1);
 Close(f);
END.