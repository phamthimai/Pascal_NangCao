Program P111010;
{n-2 diem nam ve mot phia cua duong thang qua 2 diem}
Uses  Crt;
Const max=100;
Var   i,n: word;
      tam: integer;
      x,y: array [1..max] of real;
      ok: array [1..max] of boolean;
      lk: array [1..max] of word;
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

Function dung(cs1,cs2: word): boolean;
Var i: word;
Begin
 Timdt(cs1,cs2);
 tam:=0;
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
       dung:=false;
       exit;
     end;
 dung:=true;
End;

Procedure Tim(cs: word);
Var i: word;
Begin
 Ok[cs]:=true;
 For i:=1 to cs-1 do
   If lk[i]<cs then
     If dung(cs,i) then
     begin
       lk[cs]:=i;
       exit;
     end;
 For i:=cs+1 to n do
   If dung(cs,i) then
   begin
     lk[cs]:=i;
     Ok[i]:=true;
     exit;
   end;
 Ok[cs]:=false;
End;

BEGIN
 Clrscr;
 Write('Co bao nhieu diem: ');
 Readln(n);
 For i:=1 to n do
 begin
   Write('Nhap toa do diem thu ',i,': ');
   Readln(x[i],y[i]);
 end;
 FillChar(Ok,SizeOf(Ok),false);
 FillChar(lk,SizeOf(lk),0);
 Clrscr;
 For i:=1 to n do
   If not Ok[i] then
   begin
     Tim(i);
     If not Ok[i] then
     begin
       Write(n,' diem da cho khong thoa man dieu kien.');
       Readln;
       halt;
     end;
   end;
 Write(n,' diem da cho thoa man dieu kien.');
 Readln;
END.