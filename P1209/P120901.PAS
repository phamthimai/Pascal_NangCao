Program P120901;
{Tim trong tam cua he va khoang cach toi tung diem }
Uses  Crt;
Const fi = 'P12\Loigiai\P1209\INPUT.DAT';
Var   a  : array [1..4,1..10] of real;
      t,d: real;
      i,j: byte;

Procedure Input;
Var i,j: byte; f: text;
Begin
 Assign(f,fi); Reset(f);
 For i:=1 to 4 do
 begin
   For j:=1 to 10 do Read(f,a[i,j]); Readln(f);
 end;
 Close(f);
End;

BEGIN
 Clrscr;
 Input;
 d:=1;
 For i:=1 to 10 do d:=d+a[4,i];
 Writeln('Trong tam cua he co toa do: ');
 For j:=1 to 3 do
 begin
   t:=1;
   For i:=1 to 10 do t:=t+a[j,i]*a[4,i];
   Writeln(' ',t/d);
 end;
 Readln;
END.