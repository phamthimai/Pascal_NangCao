Program P100702;   {Khoi tao che do do hoa}
Uses Crt,Graph;
Var  GrDriver,GrMode,ErrCode: Integer;
     X,Y,S: string;

BEGIN
 GrDriver:=Detect;
 InitGraph(GrDriver,GrMode,' ');
 ErrCode:=GraphResult;
 If ErrCode=GrOk then
 begin  { Do graphics }
   str(GrDriver,X);
   S:='Graph Driver: '+X;
   OutTextXY(100,100,S);
   str(GrMode,Y);
   S:='Graph Mode: '+Y;
   OutTextXY(100,110,S);
   str(GetMaxX,X);
   str(GetMaxY,Y);
   S:='Do phan giai: '+X+'*'+Y;
   OutTextXY(100,120,S);
   Readln;
   CloseGraph;
 end
 Else Writeln('Graphics error:', GraphErrorMsg(ErrCode));
END.



