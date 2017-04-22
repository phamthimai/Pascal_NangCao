Program P111002;
{Kiem tra 3 so co tao thanh tam giac gi}
Uses Crt;
Var  a,b,c: real;

Function Vuong(c1,c2,c3:real): boolean;
Begin
 Vuong:=c1*c1=c2*c2+c3*c3;
End;

Function tu(c1,c2,c3:real): boolean;
Begin
 tu:=c1*c1>c2*c2+c3*c3;
End;

BEGIN
 Repeat
   Clrscr;
   Write('Nhap do dai 3 canh cua 1 tam giac: ');
   Readln(a,b,c);
 Until (a>0)and(b>0)and(c>0)and(a<b+c)and(b<c+a)and(c<a+b);
 If Vuong(a,b,c)or Vuong(b,c,a)or Vuong(c,b,a) then
   Write('Tam giac do la tam giac vuong.')
 Else If tu(a,b,c)or tu(b,c,a)or tu(c,a,b) then
        Write('Tam giac do la tam giac tu.')
      Else Write('Tam giac do la tam giac nhon.');
 Readln;
END.