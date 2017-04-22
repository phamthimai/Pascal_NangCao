Program Jobs;
Const
  MaxM=30;                    { max number of machines }
Type
  Operation='A'..'B';
  ProcTime=Array[Operation,1..MaxM] Of Word;
Var
  N:Longint;                  { number of jobs }
  M:Array[Operation] Of Word; { M[op] is the number of machines of type op }
  PTime: ProcTime;            { PTime[op,m] is the processing time for machine
                                m of type op }
  TA,         { the time needed to perform single operation A on all N jobs }
  TB: Longint;{ the time needed to perform single operation B on all N jobs }
  d :Longint;

Procedure ReadInput;
{ Global output variables: N, M, PTime }
  Var InFile: Text; i: Word;
  Begin
    Assign(InFile, 'input.txt'); Reset(InFile);
    ReadLn(InFile,N);
    ReadLn(InFile,M['A']);
    For i:=1 To M['A'] Do
      Read(InFile, PTime['A',i]);
    ReadLn(InFile);
    ReadLn(InFile,M['B']);
    For i:=1 To M['B'] Do
      Read(InFile, PTime['B',i]);

    Close(InFile);
  End {ReadInput};

Function Compute_Time(Op:Operation):Longint;
{Computes the minimal time that is needed to perform operation Op on N jobs}
{ Global input variables: M, PTime }
  Var t,Processed:Longint;
    i:Word;
  Begin
    t:=0;
    Repeat
      Inc(t);
      Processed:=0;
      For i:=1 To M[Op] Do
        Processed:=Processed+(t Div PTime[Op,i]);
    Until Processed>=N;
    Compute_Time:=t;
  End;{Compute_Time}

Function Finish(Op:Operation; t: Longint): Longint;
{ Finish(Op,t) is the number of jobs that are finished at time t
  according to the optimal schedule for single operation Op for N jobs. }
{ Global input variables: N, M, PTime }
  Var Res,UpTo: Longint;
    i: Word;
  Begin
    Res:=0;
    For i:=1 To M[Op] Do
      If (t Mod PTime[Op,i])=0 Then Inc(Res);
    { If the number of jobs that can be completed up to time t
      is more then N then decrease Res to the proper value. }
    UpTo:=0;
    For i:=1 To M[Op] Do UpTo:= UpTo+ (t-1) Div PTime[Op,i];
    If Upto >= N Then
      Res:= 0
    Else If Upto+Res>N Then
      Res:= N-UpTo;
    Finish:=Res;
  End {Finish};

Procedure Adjust;
{ Computes the delay time d when the first type B machine starts to work }
{ Global input variables: TA, TB }
{ Global output variables: d }
  Var Inter:Word;{ number of jobs in the intermediate container }
    t: Longint;
    JB:Word;
  Begin
    d:=1; t:=0; Inter:=0;
    While d+t<TA Do Begin
      Inter:=Inter+Finish('A',d+t);
      JB:=Finish('B',TB-t);    { # jobs starting at time d+t }
      While Inter<JB Do Begin  { while not enough jobs available }
        Inc(d);
        Inter:=Inter+Finish('A',d+t);
      End;
      Inter:=Inter-JB;
      Inc(t);
    End;
  End;{Adjust}

Procedure WriteOut(AnswerA,AnswerB:Longint);
  Var OutFile: Text;
  Begin
    Assign(OutFile, 'output.txt'); Rewrite(OutFile);
    WriteLn(OutFile, AnswerA);
    WriteLn(OutFile, AnswerB);
    Close(OutFile);
  End;{WriteOut}

Begin {Main}
  ReadInput;
  TA:= Compute_Time('A');
  TB:= Compute_Time('B');
  Adjust;
  WriteOut(TA, d+TB);
End.

