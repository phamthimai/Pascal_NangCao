Program P100906;   {Mau chu so dien tu 7 doan}
Uses  Crt,Graph;
Const inp='P10\Bai9\P100906.TXT';
      W=30; H=25; D=2;
Var   Gd,Gm,i,j,X,Y: Integer;
      f: text;
      a: array [1..5] of 0..9;
      cs: array [0..9] of string[7];

Procedure Nhap;
Var i: integer;
Begin
 Assign(f,inp);
 Reset(f);
 For i:=0 to 9 do Readln(f,cs[i]);
 Close(f);
End;

Procedure So(x,y,So,C,B: integer);
Var i,M: integer;
Begin
 SetFillStyle(1, B);
 Bar(x-D,y-D,x+W+D,y+2*H+D);
 SetColor(C);
 For i:=1 to 7 do If cs[So,i]='1' then
   Case i of
     1: Line(x,y,x+W,y);
     2: Line(x,y,x,y+H);
     3: Line(x+W,y,x+W,y+H);
     4: Line(x,y+H,x+W,y+H);
     5: Line(x,y+H,x,y+2*H);
     6: Line(x+W,y+H,x+W,y+2*H);
     7: Line(x,y+2*H,x+W,y+2*H);
   End;
End;

BEGIN
 Nhap;
 Write('Nhap mot so: '); Readln(i);
 j:=0;
 Repeat
   Inc(j);
   a[j]:= i mod 10;
   i:=i div 10;
 Until i=0;
 Gd:=Detect;
 InitGraph(Gd,Gm,'');
 Y:=200;
 For i:=j downto 1 do
 begin
   X:=300+(j-i)*(W+2*D+2);
   So(x,y,a[i],4,3);
 end;
 Readln;
 CloseGraph;
END.