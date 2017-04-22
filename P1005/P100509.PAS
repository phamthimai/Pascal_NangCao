Program P100509;   {Tim vi tri chen mot so vao mang}
Uses Crt;
Var  f: text;
     b: real;
     n,i: integer;
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

BEGIN
 Clrscr;
 Nhap;
 i:=1;
 While (a[i]<b)and(i<=n) do Inc(i);
 Writeln('Vi tri chen: ',i);
 Readln;
END.