Program P101003;       {Bieu do cot}
Uses  Crt,Graph;
Const X=100; Y=400; N=5; W=30; D=10;
      b: array [1..5] of String=('XSac','Gioi','Kha','TB','Yeu');
Var   Gd,Gm,i,Max: Integer;
      a: array [1..5] of word;
      tl: real;

BEGIN
 Clrscr;
 Write('Nhap ',N,' so tu nhien: ');
 For i:=1 to N do Read(a[i]); Readln;
 Max:=a[1];
 For i:=2 to N do If Max<a[i] then Max:=a[i];
 tl:=300/Max;
 Gd:=Detect;
 InitGraph(Gd,Gm,'');
 OutTextXY(50,50,'Bieu do hinh cot');
 For i:= 1 to N do
 begin
   SetFillStyle(1,i);
   Bar(X+(i-1)*(W+D),Y,X+i*(W+D)-D,round(Y-a[i]*tl));
   OutTextXY(X+(i-1)*(W+D),Y+10,b[i]);
 end;
 SetTextStyle(1,0,2);
 OutTextXY(70,70,'Ti le % So hoc sinh theo xep loai ');
 Readln;
 CloseGraph;
END.