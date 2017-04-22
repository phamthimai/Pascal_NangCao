Program P111019; {Kiem tra da giac}
Uses  Crt;
Const max=100;
Var   i,j,n: word;
      tam: integer;
      x,y: array [1..max+1] of real;
      a,b,c: real;
      ok1,ok2: boolean;

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

Function Cat(cs1,cs2: word): boolean;
Begin
 Timdt(cs1,cs1+1);
 If f(cs2)*f(cs2+1)<0 then
 begin
   Timdt(cs2,cs2+1);
   If f(cs1)*f(cs1+1)<0 then
   begin
     cat:=true;
     exit;
   end;
 end;
 Cat:=false;
End;

Function Dung(cs1,cs2: word): boolean;
Var i: word;
Begin
 Timdt(cs1,cs2);
 Tam:=0;
 For i:=1 to n do
 If (i<>cs1)and(i<>cs2) then
 begin
   If f(i)<0 then tam:=-1 Else tam:=1;
   break;
 end;
 For i:=1 to n do
   If (i<>cs1)and(i<>cs2) then
     If f(i)*tam<0 then
       begin
         Dung:=false;
         exit;
       end;
 Dung:=true;
End;

BEGIN
 Repeat
   Clrscr;
   Write('Co bao nhieu diem: ');
   Readln(n);
 Until n>2;
 For i:=1 to n do
 begin
   Write('Nhap toa do diem thu ',i,' : ');
   Readln(x[i],y[i]);
 end;
 x[n+1]:=x[1];
 y[n+1]:=y[1];
 ok1:=true;
 For i:=1 to n-1 do
 begin
   For j:=i+1 to n do
     If cat(i,j) then
     begin
       ok1:=false;
       break;
     end;
   If not ok1 then break;
 end;
 If not ok1 then ok2:=false
 Else
 begin
   ok2:=true;
   For i:=1 to n-1 do
     If not Dung(i,i+1) then
     begin
       ok2:=false;
       break;
     end;
   If not dung(1,n) then ok2:=false;
 end;
 Clrscr;
 If ok1 then Writeln('Da giac khong tu cat.')
 Else Writeln('Da giac co tu cat.');
 If ok2 then Writeln('Da giac la da giac loi.')
 Else Writeln('Da giac khong phai la da giac loi.');
 Readln;
END.