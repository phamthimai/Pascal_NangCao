Program P121502;   {IOI 94}
Const Test = true;
Var   inp,out: text;

Procedure Init;
Begin
 If Test then Writeln('IOI''94 - Day 1 - Problem 2: The Castle');
 Assign(inp,'input.txt'); Reset(inp);
 Assign(out,'output.txt'); ReWrite(out);
 If Test then Writeln('Initialized')
End;

Procedure Fini;
Begin
 Close(inp); Close(out)
End;

Const MaxM = 50; MaxN = 50;

Type  Row = 1..MaxM;
      Column = 1..MaxN;
      Direction = (west, north, east, south);
      Module = Record
                 wall: array [Direction] of boolean;
                 nr: integer;
               End;
Var   M: Row;
      N: Column;
      Map: array [Row, Column] of Module;

Procedure ReadInput;
Var r: Row; c: Column; w: integer; d: Direction;
Begin
 Readln(inp,M,N);
 If Test then Writeln('Number of rows is ',M:1,', number of columns ',N:1);
 For r:=1 to M do
 begin
   For c:=1 to N do with Map[r,c] do
   begin
     Read(inp,w);
     For d:=west to south do
     begin
       wall[d]:=odd(w);
       w:=w div 2
     end;
     nr:=-1
   end;
   Readln(inp)
 end;
 If Test then Writeln('Input Read');
End;

Procedure WriteCastle;
Var r: Row; c: Column;
Begin
 For c:=1 to N do With Map[1,c] do
   If wall[north] then Write(' _') Else Write('  ');
 Writeln;
 For r:=1 to M do
 begin
   For c:=1 to N do With Map[r,c] do
   begin
     If (c=1) then
       If wall[west] then Write('|') Else Write(' ');
     If wall[south] then Write('_') Else Write(' ');
     If wall[east] then Write('|') Else Write(' ');
   end;
   Writeln;
 end;
End;

Type  RoomNumber = 0..MaxM*MaxN;

Var   rooms: RoomNumber;
      area: array [RoomNumber] of integer;
      maxarea: integer;

Procedure PaintMap;
Procedure PaintRoom(r: Row; c: Column);
Begin
 With Map[r, c] do
   If nr=-1 then
   begin
     nr:=rooms; inc(area[rooms]);
     If not wall[west]  then PaintRoom(r,c-1);
     If not wall[north] then PaintRoom(r-1,c);
     If not wall[east]  then PaintRoom(r,c+1);
     If not wall[south] then PaintRoom(r+1,c)
   end;
End;

Var r: Row; c: Column;
Begin
 rooms:=0; maxarea:=0;
 For r:=1 to M do
   For c:=1 to N do
     If Map[r,c].nr=-1 then
     begin
       area[rooms]:=0;
       PaintRoom(r,c);
       If area[rooms]>maxarea then maxarea:=area[rooms];
       rooms:=succ(rooms)
     end;
End;

Procedure WriteColors;
Var r: Row; c: Column;
Begin
 For r:=1 to M do
 begin
   For c:=1 to N do Write(Map[r,c].nr:2);
   Writeln;
 end;
End;

Var   bestrow: Row; bestcol: Column; bestdir: Direction;

Procedure BestWall;
Var r: Row; c: Column; maxp: integer;

  Procedure Update(k1,k2: RoomNumber; d: Direction);
  Var p: integer;
  Begin
   If k1=k2 then p:=area[k1] Else p:=area[k1]+area[k2];
   If p > maxp then
   begin
     maxp:=p; bestrow:=r; bestcol:=c; bestdir:=d
   end;
  End;

Begin
 maxp:=0;
 For r:=1 to M do
   For c:=1 to N do with Map[r,c] do
   begin
     If (r<>M)and wall[south] then Update(nr,Map[r+1,c].nr,south);
     If (c<>N)and wall[east]  then Update(nr,Map[r,c+1].nr,east);
   end
End;

Procedure ComputeAnswer;
Begin
 PaintMap;
 If Test then WriteColors;
 BestWall;
End;

Procedure WriteOutput;
Begin
 If Test then
 begin
   Writeln('Number of rooms = ',rooms:1);
   Writeln('Maximum room area = ',maxarea:1);
 end;
 Writeln(out,rooms:1);
 Writeln(out,maxarea:1);
 Write(out,bestrow:1,' ',bestcol:1,' ');
 Case bestdir of
   south: Writeln(out,'S');
   east : Writeln(out,'E');
 End;
End;

BEGIN
 Init;
 ReadInput;
 If Test then WriteCastle;
 ComputeAnswer;
 WriteOutput;
 Fini;
END.
