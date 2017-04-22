Program P110902;   {hinh vuong chuyen dong deu tu trai sang phai }
Uses Crt, Graph;
Var  Gd,Gm,x,y: Integer;
     P: Pointer;
     Size: Word;

BEGIN
 Gd:=Detect;
 InitGraph(Gd,Gm,' ');
 Bar(1,0,11,10);
 Size:=ImageSize(0,0,11,10);
 GetMem(P,Size);
 GetImage(0,0,11,10,P^);
 ClearDevice;
 x:=0; y:=200;
 Repeat
   PutImage(x,y,P^,NormalPut);
   Delay(10);
   Inc(x);
   If x>600 then x:=0;
 Until KeyPressed;
 CloseGraph;
END.
