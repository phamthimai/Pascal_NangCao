Program P110304;    {ham dem so phan tu cua tap hop}
Uses  Crt;
Type  Tap=set of 0..99;
Const inp='Number.dat';
Var   S: Tap;
      i: byte;

Procedure Nhap;
Var a: byte; f: text;
Begin
 S:=[];
 Assign(f,inp); Reset(f);
 While not SeekEoF(f) do
 begin
   Readln(f,a); If (a>=0)and(a<=99) then S:=S+[a];
 end;
 Close(f);
End;

Function Card(S: Tap): byte;
Var i,n: byte;
Begin
 n:=0;
 For i:=0 to 99 do If i in S then Inc(n);
 Card:=n;
End;

BEGIN
 Nhap;
 Clrscr;
 Write('Tap S co ',Card(S),' phan tu.');
 Readln;
END.

