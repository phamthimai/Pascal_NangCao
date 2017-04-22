Program P121203;
{Kiem tra xem co tao thanh 5 canh cua ngu giac khong}
Uses  Crt;
Const	fn = 'NGUGIAC.INP';
    	fg = 'NGUGIAC.OUT';
Var   a,b,c,d,e: real;

Procedure Nhap;
Var f: text;
Begin
 Assign(f,fn); Reset(f);
 Readln(f,a,b,c,d);
 Close(f);
End;

Procedure Out(s: string);
Var f: text;
Begin
 Assign(f,fg); Rewrite(f);
 Write(f,s);
 Close(f);
End;

BEGIN
 ClrScr;
 Nhap;
 If (a+b+c+e<=d)or(a+b+d+e<=c)or(a+c+d+e<=b)or
    (b+c+d+e<=a)or(a+b+c+d<=e)or(a<=0)or(b<=0)or
    (c<=0)or(d<=0)or(e<=0) then Out('Khong')
 Else Out('Co');
END.