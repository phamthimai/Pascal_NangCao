Program P120117;  {Tim cach dat 12 con ma}
Uses  Crt;
Const px: Array [1..8] of shortint = (1,2,2,1,-1,-2,-2,-1);
      py: Array [1..8] of shortint = (-2,-1,1,2,2,1,-1,-2);
Var   a,b: Array [1..10,1..9] of byte;
      max: integer;

Procedure hien;
Var i,j: byte;
Begin
 For i:=1 to 10 do
 For j:=1 to 9 do
 begin
   GotoXY(j*2,i);
   Write(b[i,j]);
 end;
End;

Function test(x,y: byte): boolean;
Var i,x1,y1: integer;
Begin
 test:=false;
 For i:=1 to 8 do
 begin
   x1:=x+px[i];
   y1:=y+py[i];
   If(x1>0) and (x1<10) and (y1>0) and (y1<11) and ((a[y1,x1]=1) or (b[y1,x1]=1)) then exit;
  end;
  test:=true;
End;

Procedure put(x,y,t: byte);
Var i,x1,y1: integer;
Begin
 b[y,x]:=t;
 For i:=1 to 8 do
 begin
   x1:=x+px[i];
   y1:=y+py[i];
   If(x1>0) and (x1<10) and (y1>0) and (y1<11) then a[y1,x1]:=t;
 end;
End;

Procedure tim(x,y,dem: byte);
Var i,j,t: byte;
Begin
 If dem>max then
 begin
   hien;
   Writeln;
   Write(dem:4);
   max:=dem;
   If max = 12 then
   begin
     Writeln;
     Write(' Da tim duoc');
     Readln;
     Halt;
    end;
  end;
  If x=9 then
  begin
    t:=0;
    Inc(y);
  end Else t:=x+1;
  If y>10 then exit;
  For i:=y to 10 do
  For j:=t to 9 do
  If test(j,i) then
  begin
    put(j,i,1);
    tim(j,i,dem+1);
    put(j,i,0);
  end;
End;

BEGIN
 Clrscr;
 FillChar(a,SizeOf(a),0);
 FillChar(b,SizeOf(b),0);
 max:=0;
 tim(0,1,0);
END.