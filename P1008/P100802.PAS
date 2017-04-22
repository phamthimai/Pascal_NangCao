Program P100802;       {Bieu do tron}
Uses Crt,Graph;
Var  Gd,Gm,i,S: Integer;
     a: array [1..5] of word;
     tl: real;
     Pattern : FillPatternType;

BEGIN
 Write('Nhap 5 so tu nhien: ');
 For i:=1 to 5 do Read(a[i]); Readln;
 S:=0; For i:=1 to 5 do S:=S+a[i];
 tl:=360/S;
 Gd:=Detect;
 InitGraph(Gd,Gm,'');
 GetFillPattern(Pattern);
 S:=0;
 For i:= 1 to 5 do
 begin
   SetFillPattern(Pattern,i);
   PieSlice(GetMaxX div 2,GetMaxY div 2,S,S+round(a[i]*tl),100);
   S:=S+round(a[i]*tl);
 end;
 Readln;
 CloseGraph;
END.