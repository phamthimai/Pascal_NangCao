Program P120301;
{Tinh so chu so khac nhau trong bieu dien thap phan cua M/N}
Uses Crt;
Var  m,n,t,k: LongInt;
     cs: set of 0..9;
     r: array [1..MaxInt] of 0..9; {Mang so du}

Function Trung: Boolean;
Var i,kt: LongInt;
Begin
 kt:=0;
 For i:=1 to k-1 do If r[k]=r[i] then Inc(kt);
 If kt>0 then Trung:=true Else Trung:=false;
End;

Function S: byte;
Var i,kt: byte;
Begin
 kt:=0; For i:=0 to 9 do If i in cs then Inc(kt); S:=kt;
End;

BEGIN
 ClrScr;
 Write('Nhap so M: '); Readln(m);
 Write('Nhap so N: '); Readln(n);
 t:=m div n;
 Write('M/N = ',t,'.');
 Repeat
   cs:=cs+[t mod 10];
   t:=t div 10
 Until t=0;
 m:=m mod n;
 k:=0;
 While (m<>0)and(s<10)and(not Trung) do
 begin
   m:=m*10; t:=m div n; cs:=cs+[t];  Write(t);
   m:=m mod n; Inc(k); r[k]:=m;
 end;
 Writeln;
 Write('Trong bieu dien thap phan cua M/N co ',s,' chu so khac nhau.');
 Readln;
END.