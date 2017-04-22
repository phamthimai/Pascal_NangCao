Program P121201;
{Kiem tra tu giac voi do dai cac canh lien nhau}
Uses  Crt;
Const	fn = 'P1212\TUGIAC.INP';
    	fg = 'TUGIAC.OUT';
Var 	a,b,c,d: real;

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
 If (a+b+c<=d)or(a+b+d<=c)or(a+c+d<=b)or(b+c+d<=a)
   or(a<=0)or(b<=0)or(c<=0)or(d<=0) then out('Khong')
 Else out('Co');
 Readln;
END.