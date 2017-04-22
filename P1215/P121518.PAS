Program P121518;{Magic Square}
Const
  Size=8;
  M   =40320;
Type
  Trans =Array[1..Size] Of 1..Size;
  Config=Array[1..Size] Of 1..Size;
Const
  BT  :Array['A'..'C'] Of Trans=((8,7,6,5,4,3,2,1),
                                 (4,1,2,3,6,7,8,5),
                                 (1,7,2,4,5,3,6,8));
  BT_1:Array['A'..'C'] Of Trans=((8,7,6,5,4,3,2,1),
                                 (2,3,4,1,8,5,6,7),
                                 (1,3,6,4,5,7,2,8));
  Ini :Config=(1,2,3,4,5,6,7,8);
Var
  T    :Config;
  Answer:String;
  Fact :Array[0..Size] Of Longint;
  Last :Array[0..M] Of Char;

Procedure ReadInput;
Var InFile:Text;
  i:Word;
Begin
 Assign(InFile,'input.txt'); Reset(Infile);
 For i:=1 To Size Do Read(Infile,T[i]);
 Close(Infile);
End;

Procedure ComputeFact;
Var i:Word;
Begin
 Fact[1]:=1;Fact[0]:=1;
 For i:=2 To Size Do
   Fact[i]:=i*Fact[i-1];
End;

Function Rank(Const P:Config): Word;
Var Res,l,i,j:Word;
Begin
 Res:=0;
 For i:=1 To Size Do Begin
   l:=0;
   For j:=1 To i-1 Do
     If P[j]<P[i] Then Inc(l);
   Res:=Res+(P[i]-1-l)*Fact[Size-i];
 End;
 Rank:=Res;
End;

Procedure Apply(Const T:Config; X:Char; Var R:Config);
Var i:Word;
Begin
 For i:=1 To Size Do R[i]:=T[BT[X][i]];
End;

Procedure Apply_1(Const T:Config; X:Char; Var R:Config);
Var i:Word;
Begin
 For i:=1 To Size Do R[i]:=T[BT_1[X][i]];
End;

Function Equal(Const R,T:Config): Boolean;
Var i:Word;
Begin
 i:=1;
 While (i<=Size) And (R[i]=T[i]) Do Inc(i);
 Equal:= i>Size;
End;

Procedure Generate(Const T: Config);
Const
 Qs=7000;
Var
 Queue:Array[0..Qs-1] Of Config;
 NotFound:Boolean;
 Head,Tail:Word;
 R,S: Config;
 X: Char;

Procedure InitGener;
Var i:Word;
Begin
 For i:=0 To M Do Last[i]:=' ';
 Last[0]:='.';
End;

Procedure InitQueue;
Begin
 Head:=0; Tail:=1;
 Queue[0]:=Ini;
End;

Procedure Enqueue(Const Q:Config);
Begin
 Queue[Tail]:=Q;
 Inc(Tail); If Tail=Qs Then Tail:=0;
End;

Procedure Dequeue(Var Q:Config);
Begin
 Q:=Queue[Head];
 Inc(Head); If Head=Qs Then Head:=0;
End;

Function NotMember(Const Q:Config; X:Char):Boolean;
Var RankQ:Word;
Begin
 RankQ:=Rank(Q);
 If Last[RankQ]=' ' Then Begin
   NotMember:=True;
   Last[RankQ]:=X;
 End Else
   NotMember:=False;
End;

Begin
 InitGener;
 InitQueue;
 NotFound:=True;
 While NotFound Do Begin
   Dequeue(R);
   For X:='A' To 'C' Do Begin
     Apply(R, X, S);
     If NotMember(S,X) Then Begin
       If Equal(T,S) Then Begin
         NotFound:= False;
         Break;
       End;
       Enqueue(S);
     End;
   End;
 End;
End;

Procedure Compose(Const T: Config; Var S:String);
Var
 RankQ:Word; X:Char;
 P,Q  : Config;
Begin
 Q:=T;
 RankQ:=Rank(Q);
 S:='';
 While RankQ <> 0 Do Begin
   X:=Last[RankQ];
   S:=X+S;
   Apply_1(Q,X,P);
   Q:=P;
   RankQ:=Rank(Q);
 End;
End;

Procedure WriteOut;
Var OutFile:Text;
 L,i:Word;
Begin
 Assign(OutFile,'output.txt'); Rewrite(OutFile);
 L:=Length(Answer);
 WriteLn(OutFile,L);
 For i:=1 To L Do  WriteLn(OutFile,Answer[i]);
 Close(OutFile);
End;

Begin
 ReadInput;
 ComputeFact;
 Generate(T);
 Compose(T, Answer);
 WriteOut;
End.