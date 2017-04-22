{$R+,B-}
Program P111209;   {Liet ke to hop tap con cua tap da cho}
Uses  Crt;
Const out='P111208.out';
Var   m,n: integer;
      a,b: array [0..20] of integer;
      cx: array [1..20] of boolean;
      f: text;
      count: longint;

Procedure Nhap;
Var i,c: integer; S: set of byte;
Begin
 Write('n = '); Readln(n);
 Writeln('Nhap mot tap n so:');
 i:=0; S:=[];
 Repeat
   Readln(c);
   If not(c in S) then
   begin
     S:=S+[c];
     Inc(i); a[i]:=c;
   end;
 Until i=n;
End;

Procedure Viet;
Var i: integer;
Begin
 Inc(count);
 For i:=1 to m do Write(f,a[b[i]],' '); Writeln(f);
End;

Procedure Sinh(i: integer);
Var j: integer;
Begin
 For j:=b[i-1]+1 to n do
   If cx[j] then
   begin
     b[i]:=j;
     cx[j]:=false;
     If i=m then viet Else sinh(i+1);
     cx[j]:=true;
   end;
End;

BEGIN
 Clrscr;
 Nhap;
 Assign(f,OUT); Rewrite(f);
 count:=0;
 b[0]:=0;
 For m:=1 to n do
 begin
   FillChar(cx,SizeOf(cx),1);
   Sinh(1);
 end;
 Writeln(f,'So cac tap hop con la: ',count);
 Close(f);
END.