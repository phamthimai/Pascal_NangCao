Program P110901;   {hinh vuong chuyen dong deu tu trai sang phai }
Uses Crt, Graph;
Var  Gd,Gm,x,y: Integer;
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
 x:=0; y:=200;
 Repeat
   PutImage(x,y,Pa^,NormalPut);
   Delay(10);
   PutImage(x,y,Pb^,NormalPut);
   Inc(x);
   If x>600 then x:=0;
 Until KeyPressed;
 CloseGraph;
END.
