Program P121202;
{Kiem tra chu nhat xem co long nhau khong}
Uses  Crt;
Const fn = 'P1212\CHUNHAT.INP';
	    fg = 'CHUNHAT.OUT';
Var   a,b,c,d: real;

Procedure Nhap;
Var f: text;
Begin
 Assign(f,fn); Reset(f);
 Readln(f,a,b,c,d);
 Close(f);
End;

Procedure Chuanbi;
Var h: real;
Begin
 If c<d then
 begin
   h:=c; c:=d; d:=h
 end;
End;

Procedure Out(s: string);
Var f: text;
Begin
 Assign(f,fg); Rewrite(f);
 Write(f,s);
 Close(f);
End;

BEGIN
 Clrscr;
 Nhap;
 Chuanbi;
 If (c*d>a*b)or(c*c>a*a+b*b)or
    (d>a*a+b*b+c*c-2) then Out('Khong')
 Else Out('Co');
END.