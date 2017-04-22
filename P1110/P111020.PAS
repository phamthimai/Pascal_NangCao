Program P111020;  {Tim bao dong loi}
Uses  Crt;
Const max=100;
Var   i,j,n,l: word;
      tam: integer;
      x,y: array [1..max] of real;
      d: array [1..max] of word;
      cx: array [1..max] of boolean;
      a,b,c: real;
      found,stop: boolean;

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
   Gan(-1,0,x[cs1]);
   exit;
 end;
 If y[cs1]=y[cs2] then
 begin
   Gan(0,-1,y[cs1]);
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

Function Dung(cs1,cs2: word): boolean;
Var i: word;
Begin
 Timdt(cs1,cs2);
 Tam:=0;
 For i:=1 to n do
   If (i<>cs1) and (i<>cs2) then
   begin
     If f(i)<0 then tam:=-1 Else tam:=1;
     break;
   end;
 For i:=1 to n do
   If (i<>cs1) and (i<>cs2) then
     If f(i)*tam<0 then
     begin
       dung:=false;
       exit;
     end;
 dung:=true;
End;

BEGIN
 Clrscr;
 Write('Co bao nhieu diem: ');
 Readln(n);
 For i:=1 to n do
 begin
   Write('Nhap toa do diem thu ',i,': ');
   Readln(x[i],y[i]);
 End;
 Found:=false;
 FillChar(cx,SizeOf(cx),true);
 For i:=1 to n-1 do
 begin
   For j:=i+1 to n do
     If dung(i,j) then
     begin
       l:=2;
       d[1]:=i;
       d[2]:=j;
       cx[i]:=false;
       cx[j]:=false;
       found:=true;
       break;
     end;
   If found then break;
 end;
 stop:=false;
 While not stop do
 begin
   stop:=true;
   For i:=1 to n do
     If cx[i] and dung(d[l],i) then
     begin
       stop:=false;
       Inc(l);
       d[l]:=i;
       cx[i]:=false;
     end;
 end;
 Clrscr;
 Writeln('Da giac loi chua tat ca co ',l,' dinh la cac dinh: ');
 For i:=1 to l do
 begin
   Write(d[i]:5);
   If i mod 10=0 then Writeln;
 end;
 Readln;
END.