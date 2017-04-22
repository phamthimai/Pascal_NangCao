Program P121107;   {mo phong te bao song}
Uses  Crt;
Const px: array [1..8] of shortint = (0,1,1,1,0,-1,-1,-1);
      py: array [1..8] of shortint = (-1,-1,0,1,1,1,0,-1);
      fi = 'P1211\P121107.inp';

Var   a,b: array [1..100,1..100] of byte;
      m,n: byte;
      f  : text;

Procedure Show;
Var i,j: byte;
Begin
 For i:=1 to m do
   For j:=1 to n do
   begin
     Gotoxy(j*2,i);
     Write(a[i,j]);
   end;
End;

Procedure Input;
Var i,j: byte;
Begin
 Assign(f,fi); Reset(f);
 Readln(f,m,n);
 For i:=1 to m do
 begin
   For j:=1 to n do Read(f,a[i,j]); Readln(f);
 end;
 Close(f);
End;

Function Sum(x,y: byte): byte;
Var x1,y1,i,t: byte;
Begin
 t:=0;
 For i:=1 to 8 do
 begin
   x1:=x+px[i]; y1:=y+py[i];
   If (x1 in [1..n])and(y1 in [1..m])and(a[y1,x1]=1) then inc(t);
 end;
 Sum:=t;
End;

Procedure Work;
Var i,j: byte; ok: boolean;
Begin
 Repeat
   Show;
   Delay(1000);
   ok:=true;
   FillChar(b,sizeof(b),0);
   For i:=1 to m do
     For j:=1 to n do
     begin
       Case Sum(j,i) of
         3        : b[i,j]:=1;
         5,6,7,8,0: b[i,j]:=0;
       End;
       If b[i,j]=1 then ok:=false;
     end;
   a:=b;
 Until ok;
End;

BEGIN
 Clrscr;
 Input;
 Work;
END.
