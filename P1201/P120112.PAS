{$R+,B-}
Program P120112;  {Tinh dien tich da giac loi}
Uses  Crt;
Const fi = 'POLYGON.DAT';
Type  arr= array [1..100] of real;
Var   f  : text;
      x,y: arr;
      n  : integer;
      dt : real;

Procedure Nhap;
Var i: integer;
Begin
 Assign(f,fi); Reset(f);
 Readln(f,n);
 For i:=1 to n do Readln(f,x[i],y[i]);
 Close(f);
End;

Function kc(x1,y1,x2,y2: real): real;
Begin
 kc:=sqrt(sqr(x1-x2)+sqr(y1-y2));
End;

Function s(x1,y1,x2,y2,x3,y3: real): real;
Var kc1,kc2,kc3,p: real;
Begin
 kc1:=kc(x1,y1,x2,y2);
 kc2:=kc(x3,y3,x2,y2);
 kc3:=kc(x1,y1,x3,y3);
 p:=(kc(x1,y1,x2,y2)+kc(x3,y3,x2,y2)+kc(x1,y1,x3,y3))/2;
 s:=sqrt(p*(p-kc1)*(p-kc2)*(p-kc3));
End;

Procedure Tinh;
Var i: integer;
Begin
 dt:=0;
 For i:=3 to n do
   dt:=dt+s(x[i-1],y[i-1],x[i],y[i],x[1],y[1]);
End;

Procedure Inkq;
Begin
 Clrscr;
 Writeln('Dien tich tu giac loi: ',dt:10:2);
 Readln;
End;

BEGIN
 Nhap;
 Tinh;
 Inkq;
END.