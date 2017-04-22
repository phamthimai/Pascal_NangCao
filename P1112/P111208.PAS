{$R+,B-}
Program P111208;   {Liet ke to hop m tu n so}
Uses  Crt;
Const out='P111208.out';
Var   m,n: integer;
      b: array [1..20] of integer;
      cx: array [1..20] of boolean;
      f: text;
      count: longint;

Procedure Nhap;
Begin
 Clrscr;
 Write('n = '); Readln(n);
 Write('m = '); Readln(m);
 FillChar(cx,SizeOf(cx),true);
End;

Procedure Viet;
Var i: integer;
Begin
 Inc(count);
 For i:=1 to m do Write(f,b[i],' ');
 Writeln(f);
End;

Procedure Sinh(i: integer);
Var  j: integer;
Begin
 For j:=1 to n do
   If cx[j] then
   begin
     b[i]:=j;
     cx[j]:=false;
     If i=m then viet Else sinh(i+1);
     cx[j]:=true;
   end;
End;

BEGIN
 Nhap;
 Assign(f,out); Rewrite(f);
 count:=0;
 sinh(1);
 Writeln(f,'So tu: ',count);
 Close(f);
END.