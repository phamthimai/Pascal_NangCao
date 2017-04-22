Program P100901;  {Duong gap khuc}
Uses  Crt,Graph;
Const W=600; H=400;
      inp='P10\Bai9\P100901.TXT';
Var   Gd,Gm,n,d,X0,Y0: Integer;
      S: String;
      f: text;

Procedure Nhap;
Var i: integer;
Begin
 Assign(f,inp);
 Reset(f);
 Readln(f,S);
 Close(f);
End;

Procedure Tinh;
Var  i,x,y,MaxX,MinX,MaxY,MinY: integer;
Begin
 n:=Length(S);
 x:=0; y:=0; MaxX:=0; MaxY:=0; MinX:=0; MinY:=0;
 For i:=1 to n do
 begin
   Case S[i] of
     'D': x:=x+i;
     'T': x:=x-i;
     'N': y:=y+i;
     'B': y:=y-i;
   End;
   If x>MaxX then MaxX:=x;
   If x<MinX then MinX:=x;
   If y>MaxY then MaxY:=y;
   If y<MinY then MinY:=y;
 end;
 If (W/(MaxX-MinX)>H/(MaxY-MinY)) then d:=H div (MaxY-MinY)
 Else d:=W div (MaxX-MinX);
 Gd:=Detect;
 InitGraph(Gd,Gm,' ');
 X0:=d*Abs(MinX)+(GetMaxX-W) div 2;
 Y0:=d*Abs(MinY)+(GetMaxY-H) div 2;
End;

Procedure Ve;
Var  i: integer;
Begin
 MoveTo(X0,Y0);
 SetColor(4);
 For i:=1 to n do
 begin
{   Bar();}
   Case S[i] of
     'D': LineRel(i*d,0);
     'T': LineRel(-i*d,0);
     'N': LineRel(0,i*d);
     'B': LineRel(0,-i*d);
   End;
 end;
 Readln;
 CloseGraph;
End;

BEGIN
 Nhap;
 Tinh;
 Ve;
END.