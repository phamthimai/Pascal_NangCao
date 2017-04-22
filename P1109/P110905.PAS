Program P110905;     {hinh vuong chuyen dong xien deu}
Uses  Crt, Graph;
Const a=-pi/4; d=5; v=200;
Var   Gd,Gm,x,y,dx,dy: Integer;
      Pa,Pb: Pointer;
      Size: Word;

BEGIN
 Gd:=Detect;
 InitGraph(Gd,Gm,' ');
 Size:=ImageSize(0,0,10,10);
 GetMem(Pb,Size);
 GetImage(0,0,10,10,Pb^);
 GetMem(Pa,Size);
 Bar(0,0,10,10);
 GetImage(0,0,10,10,Pa^);
 ClearDevice;
 x:=300; y:=200; dx:=round(d*cos(a)); dy:=round(d*sin(a));
 Repeat
   PutImage(x,y,Pa^,NormalPut);
   Delay(v);
   PutImage(x,y,Pb^,NormalPut);
   Inc(x,dx); Inc(y,dy);
   If x>600 then x:=0;
   If x<0 then x:=600;
   If y>440 then y:=0;
   If y<0 then y:=440;
 Until KeyPressed;
 CloseGraph;
END.
