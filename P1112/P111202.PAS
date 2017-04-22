Program P111202;  {De qui liet ke cac chu so lap tu n so}
Uses  Crt;
Const out='P111202.out';
Var   n: integer;
      b: array [1..10] of integer;
      f: text;

Procedure Sinh(i: integer);
Var j,k: integer;
Begin
 For j:=1 to 5 do
 begin
   b[i]:=j;
   If i=n then begin For k:=1 to n do Write(f,b[k]); Writeln(f); end
   Else sinh(i+1);
 end;
End;

BEGIN
 ClrScr;
 Write('n = '); Readln(n);
 Assign(f,out); Rewrite(f);
 Sinh(1);
 Close(f);
END.