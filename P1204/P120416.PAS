Program P120416;   {Kich dup chuot}
Uses  Dos,Graph,Smouse;
Const doubletime=3;
Var   reg: registers;
      Gd,Gm: integer;
      xmouse,ymouse,xl,yl: integer;
      s1,s2: string;
      c: char;

BEGIN
 Gd:=Detect;
 InitGraph(Gd,Gm,'c:\turbo\graph');
 MouseInit;
 MouseShow;
 GetMousePos(xl,yl);
 Repeat
   If MouseLclick then
   begin
     t1:=t2;
     If DoubleClick then
     begin
       SetColor(0);
       MouseHide;
       OutTextxy(xl,yl,s1+':'+s2);
       GetMousePos(xmouse,ymouse);
       xl:=xmouse; yl:=ymouse;
       Str(xmouse,s1); Str(ymouse,s2);
       SetColor(14);
       OutTextxy(xmouse,ymouse,s1+':'+s2);
       MouseShow;
     end;
   end;
 Until MouseRclick;
 CloseGraph;
END.