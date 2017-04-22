Program P101005;  {Do thi ham so y = Sqr(x)}
Uses Graph;
Const X0=320;Y0=300;E=50;
Var  Gd,Gm,i,j,k: Integer;
     x,y: real;
     S: String;

BEGIN
 Gd:=Detect;
 InitGraph(Gd,Gm,' ');
 Line(100,Y0,550,Y0);          {Truc Ox}
 OutTextXY(540,Y0+10,'x');
 For k:=-3 to 3 do
 begin
   i:=k*E+X0; j:=Y0;
   Str(k,S);
   OutTextXY(i-10,j+8,S);
   Bar(i-1,j-1,i+1,j+1);
 end;
 Line(X0,50,X0,370);           {Truc Oy}
 OutTextXY(X0-20,50,'y');
 For k:=-1 to 4 do
 begin
   i:=X0; j:=-k*E+Y0;
   Str(k,S);
   If k<>0 then OutTextXY(i-20,j,S);
   Bar(i-1,j-1,i+1,j+1);
 end;
 For i:=X0-2*E to X0+2*E do    {Do thi}
 begin
   x:=(i-X0)/E; y:=Sqr(x); j:=Round(-y*E+Y0);
   PutPixel(i,j,10);
 end;
 SetTextStyle(1,0,2);
 OutTextXY(100,400,'Do thi ham so y = Sqr(x):');
 Readln;
 CloseGraph;
END.
