Program P110315;  {Nhap mot hoan vi}
Uses Crt;
Var  n,i: byte;
     so: set of byte;
     Ok: boolean;
     a: array[1..126] of byte;

BEGIN
 Clrscr;
 Repeat
   Write('Nhap so n (0<n<126): '); Readln(n);
   If (n<1)or(n>125) then Writeln(#7,'Sai');
 Until (n>=1)and(n<=125);
 so:=[];
 Writeln('Nhap mot hoan vi cua cac so tu 1 den ',n,': ');
 For i:=1 to n do
 begin
   Repeat
     Write('Nhap phan tu thu ',i,': '); Readln(a[i]);
     If (a[i] in so)or(n<a[i])or(a[i]<1) then Ok:=false Else Ok:=true;
   Until Ok;
   so:=so+[a[i]];
 end;
 For i:=1 to n do Write(a[i]:8); Readln;
END.