PROGRAM P101511;  {liet ke hoan vi tu n phan tu bang de qui}
Uses  Crt;
Const out='P101511.txt';
Type  mang=array [1..9] of byte;
      S= set of byte;
Var   f: text;
      n: byte;
      a: mang;
      b: s;
      c: integer;

Procedure Vong_For(i: byte; Var a: mang; b: s);
Var j,k: byte;
Begin
 For j:=1 to n do
   If not(j in b) then
   begin
     a[i]:=j;
     b:=[]; For k:=1 to i do b:=b+[a[k]];
     If i<n then Vong_For(i+1,a,b)
     else begin
            For k:=1 to n do Write(f,a[k]); Write(f,' ');
            Inc(c);
            If c*(n+1)>1010 then begin c:=0; Writeln(f); end;
          end;
   end;
End;

BEGIN
 Clrscr;
 Assign(f,out); Rewrite(f);
 Write('Hay nhap so n<9: '); Readln(n);
 Vong_For(1,a,b);
 Close(f);
END.