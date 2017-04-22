Program P111011;   {Dem so trung tuyen cua tap}
Uses  Crt;
Const max=100;
Var   i,j,n,sd: word;
      x,y: array [1..max] of real;
      a,b,c: real;

Procedure Gan(am,bm,cm: real);
Begin
 a:=am;
 b:=bm;
 c:=cm;
End;

Procedure Timdt(cs1,cs2: word);
Begin
 If x[cs1]=x[cs2] then
 begin
   gan(-1,0,x[cs1]);
   exit;
 end;
 If y[cs1]=y[cs2] then
 begin
   gan(0,-1,y[cs1]);
   exit;
 end;
 a:=1;
 b:=(x[cs1]-x[cs2])/(y[cs2]-y[cs1]);
 c:=-x[cs1]-b*y[cs1];
End;

Function f(cs: word): real;
Begin
 f:=a*x[cs]+b*y[cs]+c;
End;

Function Ok(cs1,cs2: word): boolean;
Var f1,f2,i: word;
Begin
 f1:=0;
 f2:=0;
 For i:=1 to n do
   If (i<>cs1)and(i<>cs2) then
     If f(i)<0 then Inc(f1)
     Else If f(i)>0 then Inc(f2);
 Ok:=f1=f2;
End;

BEGIN
 Repeat
 Clrscr;
 Write('Co bao nhieu diem: ');
 Readln(n);
 Until not odd(n);
 For i:=1 to n do
 begin
   Write('Nhap toa do diem thu ',i,': ');
   Readln(x[i],y[i]);
 end;
 sd:=0;
 For i:=1 to n-1 do
   For j:=i+1 to n do
   begin
     timdt(i,j);
     If ok(i,j) then Inc(sd);
   end;
 Clrscr;
 Write('Co ',sd,' duong trung binh.');
 Readln;
END.