Program P121501;  {IOI 94}
Const Test = true;
Var   inp,out: text;

Procedure Init;
Begin
 If Test then Writeln('IOI''94 - Day 1 - Problem 1: The Triangle');
 Assign(inp,'input.txt'); Reset(inp);
 Assign(out,'output.txt'); ReWrite(out);
 If Test then Writeln('Initialized')
End;

Procedure Fini;
Begin
 Close(inp); Close(out)
End;

Const MaxN = 100;
Type  index = 1..MaxN;
      number = 0..99;
Var   N: index;
      T: array [index,index] of number;
      m: integer;

Procedure ReadInput;
Var r,p: index;
Begin
 Readln(inp,N);
 If Test then Writeln('Number of rows is ',N:1);
 For r:=1 to N do
 begin
   For p:=1 to r do Read(inp,T[r,p]);
   Readln(inp);
 end;
 If Test then Writeln('All input Read')
End;

Procedure ComputeAnswer;
 Function Max(x,y: integer): integer;
 Begin
  If x>y then Max:=x Else Max:=y
 End;
 Function MaxRS(r,p: index): integer;
 Begin
  If r=N then MaxRS:=T[r,p]
  Else MaxRS:=T[r,p]+Max(MaxRS(r+1,p),MaxRS(r+1,p+1))
 End;
Begin
 m:=MaxRS(1,1)
End;

Procedure WriteOutput;
Begin
 Writeln(out,m:1);
 If Test then Writeln('The maximum route sum is ',m:1)
End;

BEGIN
 Init;
 ReadInput;
 ComputeAnswer;
 WriteOutput;
 Fini
END.
