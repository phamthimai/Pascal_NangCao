Program P111211;   {Tim day con don dieu tang dai nhat}
Uses  Crt;
Const out='P111211.out';
Var   max,n: integer;
      a,b,c: array [0..100] of integer;
      f: text;

Procedure Nhap;
Var i: integer;
Begin
 ClrScr;
 Write('n = '); Readln(n);
 Writeln('Nhap mot day n so:');
 For i:=1 to n do Read(a[i]); Readln;
End;

Procedure Viet;
Var i: integer;
Begin
 Assign(f,OUT); Rewrite(f);
 Writeln(f,'Day ban dau chua ',n,' phan tu la:');
 For i:=1 to n do Write(f,a[i],' '); Writeln(f);
 Writeln(f,'Day con dai nhat chua ',Max,' phan tu la:');
 For i:=1 to max do Write(f,a[c[i]],' '); Writeln(f);
 Close(f);

End;

Procedure Sinh(i: integer);
Var j,k: integer;
Begin
 For j:=b[i-1]+1 to n do If a[b[i-1]]<a[j] then
 begin
   b[i]:=j;
   If i>Max then
   begin
      Max:=i;
      For k:=1 to Max do c[k]:=b[k];
   end;
   If n>b[i] then sinh(i+1);
 end;
End;

BEGIN
 Nhap;
 b[0]:=0; a[0]:=-MaxInt; Max:=0;
 Sinh(1);
 Viet;
END.