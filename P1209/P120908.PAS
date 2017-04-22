Program P120908;  {Tro choi "Life"}
Uses  Crt;
Const px: array [1..8] of shortint = (0,1,1,1,0,-1,-1,-1);
      py: array [1..8] of shortint = (-1,-1,0,1,1,1,0,-1);
      fi = 'P1209\P120908.inp';
Var   a,b: array [1..125,1..125] of byte;
      m,n: byte;
      f  : text;

Procedure Show;
Var i,j: byte;
Begin
 For i:=1 to 25 do
   For j:=1 to 40 do
   begin
     If a[i+51,j+43]=1 then TextColor(4) Else TextColor(1);
     Gotoxy(j*2,i); Write('*');
   end;
End;

Procedure Input;
Var i,j: byte;
Begin
 Assign(f,fi); Reset(f);
 Readln(f,m,n);
 For i:=63-m div 2 to 62+m-m div 2 do
 begin
   For j:=63-n div 2  to 62-n div 2+n  do Read(f,a[i,j]); Readln(f);
 end;
 Close(f);
 M:=125; N:=125;
End;

Function Sum(x,y: byte): byte;
Var x1,y1,i,t: byte;
Begin
 t:=0;
 For i:=1 to 8 do
 begin
   x1:=x+px[i]; y1:=y+py[i];
   If (x1 in [1..n])and(y1 in [1..m])and(a[y1,x1]=1) then Inc(t);
 end;
 Sum:=t;
End;

Procedure Work;
Var i,j: byte; ok: boolean;
Begin
 Repeat
   Show;
   ok:=true;
   FillChar(b,Sizeof(b),0);
   For i:=1 to m do
     For j:=1 to n do
     begin
       Case sum(j,i) of
          2: b[i,j]:=a[i,j];
          3: b[i,j]:=1;
       End;
       If b[i,j]=1 then ok:=false;
     end;
   a:=b;
 Until KeyPressed or ok;
End;

BEGIN
 Clrscr;
 Input;
 Work;
END.
