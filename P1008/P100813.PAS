Program P100813;   {Hien thi anh da duoc ma hoa}
Uses Crt,Graph;
Var  Gd,Gm,i,j,k,X,Y: Integer;
     a: string;
     f: text;

BEGIN
 Assign(f,'P10\P100813.TXT');
 Reset(f);
 Gd:=Detect;
 InitGraph(Gd,Gm,'');
 X:=GetMaxX div 2-16;
 Y:=GetMaxY div 2-8;
 For k:=1 to 2 do
 begin
   Readln(f,a);
   For i:=1 to 16 do
     For j:=1 to 8 do PutPixel(k*8+j+X,i+Y,ord(a[(i-1)*8+j])-47);
 end;
 Close(f);
 Readln;
 CloseGraph;
END.