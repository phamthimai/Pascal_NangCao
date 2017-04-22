Program P111012;  {Tim tam giac cuc tieu}
Uses  Crt;
Const max=100;
      e=0.000001;
Var   i,n,d1,d2,d3,d4: word;
      x,y: array [1..max] of real;
      c1,c2,c3,p,dth: real;

Function kc(cs1,cs2: word): real;
Begin
 kc:=sqrt(sqr(x[cs1]-x[cs2])+sqr(y[cs1]-y[cs2]));
End;

Function dt(d1,d2,d3: word): real;
Begin
 c1:=kc(d1,d2);
 c2:=kc(d2,d3);
 c3:=kc(d3,d1);
 p:=(c1+c2+c3)/2;
 dt:=sqrt(p*(p-c1)*(p-c2)*(p-c3));
End;

Function Found: boolean;
Var i: word;
Begin
 For i:=1 to n do
   If (i<>d1)and(i<>d2)and(i<>d3)and
   (abs(dth-dt(d1,d2,i)-dt(d2,d3,i)-dt(d3,d1,i))<e) then
   begin
     d4:=i;
     Found:=true;
     exit;
   end;
 Found:=false;
End;

BEGIN
 Repeat
 Clrscr;
 Write('Co bao nhieu diem: ');
 Readln(n);
 Until n>2;
 For i:=1 to n do
 begin
   Write('Nhap toa do diem thu ',i,': ');
   Readln(x[i],y[i]);
 end;
 d1:=1;
 d2:=2;
 d3:=3;
 dth:=dt(d1,d2,d3);
 While Found do
 begin
   d3:=d4;
   dth:=dt(d1,d2,d3);
 end;
 Clrscr;
 Write('Tam giac cuc tieu co 3 dinh la: ',d1:5,d2:5,d3:5);
 Readln;
END.