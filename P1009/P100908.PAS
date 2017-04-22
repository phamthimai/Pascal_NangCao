Program P100908;   {Mau chu so}
Uses  Crt,Graph;
Const inp='P10\Bai9\P100908.TXT';
      W=8; D=1; X0=300; Y0=200;
Var   Gd,Gm,i,j,X,Y: Integer;
      f: text;
      cs: array [0..9] of string[129];
      a: array [1..5] of 0..9;

Procedure Nhap;
Var i: integer;
Begin
 Assign(f,inp);
 Reset(f);
 For i:=0 to 9 do Readln(f,cs[i]);
 Close(f);
End;

Procedure So(x0,y0,So,C,B: integer);
Var i,x,y,M: integer;
Begin
 For i:=1 to 128 do
 begin
   x:=(i-1) mod 8+X0; y:=(i-1) div 8+Y0;
   If cs[So,i]='1' then M:=C Else M:=B;
   PutPixel(x,y,M);
 end;
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
 Y:=Y0;
 For i:=j downto 1 do
 begin
   X:=X0+(j-i)*(W+2*D);
   So(x,y,a[i],15,0);
 end;
 Readln;
 CloseGraph;
END.