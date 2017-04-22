Program P101002;    {Cac dang phong chu}
Uses  Graph;
Const K=3;
Var   Gd,Gm,Font,Color,Size,i: Integer;
      S: String;

BEGIN
 Gd:=Detect;
 InitGraph(Gd,Gm,' ');
 Color:=0;
 For Font:=0 to 11 do
 Begin
   ClearDevice;
   For i:=1 to 4 do
   begin
     Size:=(i-1)*K+1;
     Inc(Color); Color:=Color mod 15+1;
     SetColor(Color);
     SetTextStyle(Font,HorizDir,Size);
     Str(Size,S); S:='Size '+S;
     OutTextXY(100,i*80,S) ;
   end;
   Readln;
 end;
 CloseGraph;
END.

