Program P111210;   {Liet ke cac day con cua day da cho}
Uses  Crt;
Const out='P111210.out';
Var   m,n: integer;
      a,b: array [0..20] of integer;
      f: text;
      count: longint;

Procedure Nhap;
Var i,c: integer;
Begin
 ClrScr;
 Write('n = '); Readln(n);
 Writeln('Nhap mot day n so:');
 For i:=1 to n do Readln(a[i]);
End;

Procedure Viet(m: integer);
Var i: integer;
Begin
 Inc(count);
 For i:=1 to m do Write(f,a[b[i]],' '); Writeln(f);
End;

Procedure Sinh(i: integer);
Var j: integer;
Begin
 For j:=b[i-1]+1 to n do
 begin
   b[i]:=j;
   Viet(i);
   If n>b[i] then sinh(i+1);
 end;
End;

BEGIN
 Nhap;
 Assign(f,OUT); Rewrite(f);
 count:=0; b[0]:=0;
 Sinh(1);
 Writeln(f,'Tong so cac day con la: ',count);
 Close(f);
END.