Program P101012;   {Mau chu}
Uses  Crt,Graph;
Const inp='P1010\P101012.TXT';
Var   Gd,Gm,X,Y: Integer;
      chu: array ['a'..'z'] of string[129];
      c: char;

Procedure Nhap;
Var f: text;
Begin
 Assign(f,inp);
 Reset(f);
 For c:='a' to 'z' do Readln(f,chu[c]);
 Close(f);
 Write('Nhap mot chu cai: '); Readln(c);
 Write('Nhap vi tri hien chu cai: '); Readln(x,y);
End;

Procedure Vietchu(x0,y0: integer; Ch: char; Mau: integer);
Var i,x,y,M: integer;
Begin
 For i:=1 to 128 do
 begin
   x:=(i-1) mod 8+X0; y:=(i-1) div 8+Y0;
   If chu[Ch,i]='1' then M:=Mau Else M:=0;
   PutPixel(x,y,M);
 end;
End;

BEGIN
 Nhap;
 Gd:=Detect;
 InitGraph(Gd,Gm,'');
 Vietchu(x,y,c,15);
 Readln;
 CloseGraph;
END.