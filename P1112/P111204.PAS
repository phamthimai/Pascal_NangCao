Program P111204;
{Liet ke va dem cac tu lap nen tu bang chu cai da cho}
Uses  Crt;
Const am=['a','e','i'];
      out='P111203.out';
Var   c: array [1..3] of char;
      co: boolean;
      count: integer;
      f: text;

Procedure Viet;
Var i: integer;
Begin
 Inc(Count);
 For i:=1 to 3 do Write(f,c[i]); Writeln(f);
End;

Procedure Sinh(i: integer);
Var ch: char; luu: boolean;
Begin
 luu:=co;
 For ch:='a' to 'i' do
 begin
   c[i]:=ch;
   If ch in am then co:=true;
   If (i=3) then begin If co then Viet end
   Else sinh(i+1);
   co:=luu;
 end;
End;

BEGIN
 Clrscr;
 co:=false; count:=0;
 Assign(f,out); Rewrite(f);
 Sinh(1);
 Write(f,'Tong cac tu khac nhau la: ',Count);
 Close(f);
END.

