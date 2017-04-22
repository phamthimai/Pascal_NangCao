Program P111005;   {Tim dinh con lai cua hinh chu nhat}
Uses Crt;
Var  i: byte;
     x,y: array [1..4] of real;

Procedure Error;
Begin
 Write('Du lieu sai');
 Readln;
 halt;
End;

BEGIN
 Clrscr;
 For i:=1 to 3 do
 begin
   Write('Nhap toa do dinh thu ',i,' (x,y) = ');
   Readln(x[i],y[i]);
 end;
 If (x[1]=x[2]) and (x[2]=x[3]) then Error;
 If (y[1]=y[2]) and (y[2]=y[3]) then Error;
 If (x[1]=x[2]) then x[4]:=x[3] Else
 If (x[2]=x[3]) then x[4]:=x[1] Else
 If (x[3]=x[1]) then x[4]:=x[2] Else Error;
 If (y[1]=y[2]) then y[4]:=y[3] Else
 If (y[2]=y[3]) then y[4]:=y[1] Else
 If (y[3]=y[1]) then y[4]:=y[2] Else Error;
 Clrscr;
 Write('Toa do dinh thu 4 la (x,y) = ',x[4]:5:2,'   ',y[4]:5:2);
 Readln;
END.