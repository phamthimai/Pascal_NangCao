Program P110903;    {dieu khien van toc cua hinh vuong}
Uses Crt, Graph;
Var  Gd,Gm,x,y,v: Integer;
     Pa,Pb: Pointer;
     Size: Word;
     c: char;

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
 x:=0; y:=200; v:=20;
 Repeat
   Repeat
     PutImage(x,y,Pa^,NormalPut);
     Delay(v);
     PutImage(x,y,Pb^,NormalPut);
     Inc(x);
     If x>600 then x:=0;
   Until KeyPressed;
   c:=ReadKey; If c=#0 then c:=ReadKey;
   If (c=#72)and(v>0) then Dec(v);
   If (c=#80)and(v<100) then Inc(v);
 Until (c=#27)or(c=#13);
 CloseGraph;
END.
