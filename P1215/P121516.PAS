Program Game;
Uses Play;
Const
  MaxN=100;
Var
  N: Word;
  Board:Array[1..MaxN] Of Word;
  Sum:Word;
  Sel:Word;
  Odds:Boolean;

Procedure ReadInput;
Var InFile: Text;i:Word;
Begin
 Assign(InFile,'input.txt'); Reset(InFile);
 ReadLn(InFile,N);
 Sum:=0;
 For i:=1 To N Do Begin
   ReadLn(InFile,Board[i]);
   Sum:=Sum+Board[i];
 End;
 Close(InFile);
End;

Procedure Preprocess;
Var i:Word;
 OddSum,EvenSum:Word;
Begin
 OddSum:=0;
 EvenSum:=0;
 For i:=1 To N Do
 If Odd(i) Then Inc(OddSum,Board[i])
 Else Inc(EvenSum,Board[i]);
 Odds:=OddSum>=EvenSum;
End;

Procedure Playing;
Var M,i:Word;
 C1,
 C2:Char;
 Head,
 Tail:1..MaxN;
Begin
 Sel:=0;
 Head:=1; Tail:=N;
 M:=N Div 2;
 For i:=1 To M Do Begin
   If Odds Then Begin
     If Odd(Head) Then Begin
         Sel:=Sel+Board[Head];
         Inc(Head);
         C1:='L';
       End Else Begin
         Sel:=Sel+Board[Tail];
         Dec(Tail);
         C1:='R';
       End;
   End Else Begin
     If Odd(Head) Then Begin
       Sel:=Sel+Board[Tail];
       Dec(Tail);
       C1:='R';
     End Else Begin
       Sel:=Sel+Board[Head];
       Inc(Head);
       C1:='L';
     End;
   End;
   MyMove(C1);
   YourMove(C2);
   If C2='L' Then Inc(Head)
   Else Dec(Tail);
 End;
End;

Procedure WriteOut;
Var OutFile: Text;
Begin
 Assign(OutFile,'output.txt'); Rewrite(OutFile);
 WriteLn(OutFile,Sel,' ',Sum-Sel);
 Close(OutFile);
End;

Begin
 ReadInput;
 Preprocess;
 StartGame;
 Playing;
 WriteOut;
End.