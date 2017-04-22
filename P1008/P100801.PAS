Program P100801;       {Bieu do cot}
Uses Crt,Graph;
Var  Gd,Gm,i,Max: Integer;
     a: array [1..5] of word;
     tl: real;
     Pattern : FillPatternType;

BEGIN
 Write('Nhap 5 so tu nhien: ');
 For i:=1 to 5 do Read(a[i]); Readln;
 Max:=a[1];
 For i:=2 to 5 do If Max<a[i] then Max:=a[i];
 tl:=300/Max;
 Gd:=Detect;
 InitGraph(Gd,Gm,'');
 GetFillPattern(Pattern);
 For i:= 1 to 5 do
 begin
   SetFillPattern(Pattern,i);
   Bar(i*30+100,400,i*30+120,round(400-a[i]*tl));
 end;
 Readln;
 CloseGraph;
END.