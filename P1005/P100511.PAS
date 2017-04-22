Program P100511;   {Tim vi tri chen mot so vao mang}
Uses Crt;
Var  f: text;
     b: real;
     n: integer;
     a: array[1..500] of real;

Procedure Nhap;
Var i: integer;
Begin
 Assign(f,'INP.TXT');
 Reset(f);
 Readln(f,n,b);
 For i:=1 to n do read(f,a[i]);
 Close(f);
End;

Procedure Xu_ly;
Var d,c,g: integer;
Begin
 If b<a[1] then Writeln('Dat vi tri 1')
 Else
   If b>=a[n] then Writeln('Dat vi tri ',n)
   Else
   begin
     d:=1; c:=n+1;
     Repeat
       g:=(d+c)div 2;
       If b<a[g] then c:=g Else d:=g;
     Until d+1=c;
     Writeln('Dat vi tri ',c);
   end;
End;

BEGIN
 Clrscr;
 Nhap;
 Xu_ly;
END.