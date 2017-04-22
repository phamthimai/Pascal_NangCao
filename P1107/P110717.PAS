Program P110717;   {dung bien bo nho}
Uses  Crt, Graph;
Const X=400; Y=200; W=100; H=20; G=15;
Var   Gd,Gm,i,j: Integer;
      P: Pointer;
      Size: Word;

Procedure VeXetang;
Begin
 SetBkColor(0);
 SetFillStyle (1,7);
 Bar(X,Y,X+W,Y+W);
 SetColor(8);
 Line(X,Y+H,X+W,Y+H);
 Line(X,Y+W-H,X+W,Y+W-H);
 Circle(X+W div 2-5,Y+W div 2,W div 2-H-5);
 Circle(X+W div 2-5,Y+W div 2,W div 2-H-13);
 SetFillStyle (1,8);
 Bar(X,Y+H,X+G,Y+W-H);
 FloodFill(X+W div 2-5,Y+H+10,8);
 SetFillStyle (1,7);
 Bar(X-5,Y+W div 2-2,X+H+3,Y+W div 2+2);
 Readln;
End;

BEGIN
 Gd:=Detect;
 InitGraph(Gd,Gm,' ');
 VeXetang;
 Size:=ImageSize(X,Y,X+W,Y+W);
 GetMem(P,Size);
 GetImage(X,Y,X+W,Y+W,P^);
 i:=0; j:=200;
 PutImage(i,j,P^,NormalPut);
 Readln;
 CloseGraph;
END.
