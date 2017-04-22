Program P110904;    {dieu khien vi tri cua hinh vuong}
Uses Crt, Graph;
Var  Gd,Gm,x,y,v: Integer;
     Pa,Pb: Pointer;
     Size: Word;
     c: char;

BEGIN
 Gd:=Detect;
 InitGraph(Gd,Gm,' ');
 Size:=ImageSize(0,0,20,20);
 GetMem(Pb,Size);
 GetImage(0,0,20,20,Pb^);
 GetMem(Pa,Size);
 Bar(0,0,20,20);
 GetImage(0,0,20,20,Pa^);
 ClearDevice;
 x:=300; y:=200; v:=10; c:=#77;
 Repeat
   PutImage(x,y,Pa^,NormalPut);
   Repeat Until KeyPressed;
   c:=ReadKey; If c=#0 then c:=ReadKey;
   PutImage(x,y,Pb^,NormalPut);
   Case c of
     #72: Dec(y);
     #75: Dec(x);
     #77: Inc(x);
     #80: Inc(y);
   End;
   If x>600 then x:=0;
   If x<0 then x:=600;
   If y>440 then y:=0;
   If y<0 then y:=440;
 Until (c=#27)or(c=#13);
 CloseGraph;
END.
