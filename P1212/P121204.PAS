Program P121204;
{tam giac chua tam giac}
Uses Crt;
Type dinh = record
              a,b,c: real;
            end;
Var  a,b,c,a1,b1,c1: real;
     d,d1: array [1..3] of dinh;

Function ArcCos(x: real): real;
Begin
 If x=0 then arccos:=pi/2
 Else arccos:=ArcTan(sqrt(1-sqr(x))/x);
End;

Procedure Vert(a,b,c: real; Var d: dinh);
Begin
 d.a:=arccos((b*b+c*c-a*a)/(2*b*c));
 d.b:=b; d.c:=c;
End;

Function Test(d1,d2: dinh): boolean;
Begin
 test:=true;
 If (d1.a>=d2.a)and(((d1.b>=d2.b)and(d1.c>=d2.c))
   or((d1.b>=d2.c)and(d1.c>=d2.b))) then exit;
 test:=false;
End;

Var i,j: byte;

BEGIN
 Write('Nhap 3 canh tam giac ABC ');    Readln(a,b,c);
 Write('Nhap 3 canh tam giac A1B1C1 '); Readln(a1,b1,c1);
 Vert(a,b,c,d[1]);
 Vert(b,c,a,d[2]);
 Vert(c,a,b,d[3]);
 Vert(a1,b1,c1,d1[1]);
 Vert(b1,c1,a1,d1[2]);
 Vert(c1,a1,b1,d1[3]);
 For i:=1 to 3 do
   For j:=1 to 3 do
     If Test(d[i],d1[j]) then
     begin
       Write('Tam giac ABC co the chua duoc tam giac A1B1C1');
       Readln;
       Exit;
     end;
 Write('Tam giac ABC khong the chua duoc tam giac A1B1C1');
 Readln;
END.