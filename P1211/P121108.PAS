Program P121108;    {do min}
Uses Crt,Graph;
{$i P1211\mouse.pas}
Var  Gd,Gm    : integer;
     xm,ym,r,d: integer;

Procedure Play;
Begin
 Repeat
   MouseEventgr;
   d:=Round(sqrt(sqr(mouseX-xm)+sqr(mouseY-ym)));
   Sound(1280-2*d);
   If mouseL and(d<r) then
   begin
     HideMouse;
     Circle(xm,ym,r);
     ShowMouse;
     Readln;
     CloseGraph;
     Write(' Dung min');
     Nosound;
     Readln;
     Halt;
   end;
 Until KeyPressed;
 Nosound;
End;

BEGIN
 Gd:=Detect;
 InitGraph(Gd,Gm,'');
 Randomize;
 xm:=Random(640)+1;
 ym:=Random(480)+1;
 r:=10;
 ShowMouse;
 Play;
 HideMouse;
 CloseGraph;
END.