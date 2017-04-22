Program P110211;   {Ma hoa xau ki tu}
Uses Crt;
Var  i,j,l,d,c: word;
     s1,s2: string;
     a: array [1..20,1..20] of char;

Procedure Gan1(ch: char);
Begin
 If (c<>l) then Inc(c)
 Else
 begin
   c:=1; Inc(d);
 end;
 a[d,c]:=ch;
End;

Procedure Gan2(ch: char);
Begin
 If (d<>l) then Inc(d)
 Else
 begin
   d:=1; Inc(c);
 end;
 a[d,c]:=ch;
End;

BEGIN
 Clrscr;
 Write('Nhap xau can ma hoa: '); Readln(s1);
 Write('Nhap xau can giai ma: '); Readln(s2);
 Clrscr;
 l:=trunc(sqrt(length(s1)));
 If l*l<length(s1) then Inc(l);
 d:=1; c:=0;
 For i:=1 to length(s1) do Gan1(s1[i]);
 For i:=1 to l*l-length(s1) do Gan1(' ');
 Writeln('Xau ban dau: ',s1);
 Write('Xau ma hoa: ');
 For i:=1 to l do
   For j:=1 to l do Write(a[j,i]);
 Writeln;
 l:=trunc(sqrt(length(s2)));
 If l*l<length(s2) then Inc(l);
 d:=0; c:=1;
 For i:=1 to length(s2) do Gan2(s2[i]);
 For i:=1 to l*l-length(s2) do Gan2(' ');
 Writeln('Xau ban dau: ',s2);
 Write('Xau ma hoa: ');
 For i:=1 to l do
   For j:=1 to l do Write(a[i,j]);
 Readln;
END.