Program P111205;
{Liet ke va dem cac tu khac nhau lap tu bang chu cai da cho}
Uses  Crt ;
Const am=['a','e','i'];
      out='P111205.OUT';
Var   c: array[1..5] of char;
      co: boolean;
      count,n: longint;
      f: text;

Procedure Viet;
Var i: integer;
Begin
 Inc(count);
 For i:=1 to n do Write(f,c[i],' ');
 Writeln(f);
End;

Procedure Sinh(i: integer);
Var ch: char; luu: boolean;
Begin
 luu:=co;
 For ch:='a' to 'i' do
 begin
   c[i]:=ch;
   If ch in am then co:=true;
   If (i=n) then begin If co then viet end
   Else sinh(i+1);
   co:=luu;
 end;
End;

BEGIN
 Clrscr;
 Count:=0;
 Assign(f,out); Rewrite(f);
 For n:=2 to 4 do
 begin
   co:=false;
   sinh(1);
 end;
 Writeln(f,'So tu = ',count);
 Readln;
 Close(f);
END.