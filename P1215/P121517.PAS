Program P121517;{Sort3}
Const
  MaxN =1000;
Type
  ElemType = 1..3;
  ArrayType= Array[1..MaxN] Of ElemType;
  Matrix   = Array[ElemType, ElemType] of Integer;
Var
  N : Word;
  S : ArrayType;
  Na: Array[ElemType] Of Word;
  NEP : Matrix;
  First: Matrix;
  NoCh: Word;
  OutFile: Text;

Procedure ReadInput;
Var
 InFile: Text;
 i,j: Word;
Begin
 Assign(InFile, 'input.txt');
 Reset(Infile);

 ReadLn(InFile, N);
 For i:=1 To 3 Do Na[i]:=0;
 For i:=1 To N Do Begin
   ReadLn(InFile,S[i]);
   Inc(Na[S[i]]);
 End;
 Close(InFile);
End;

Function Min(X,Y: Word):Word;
Begin
 If X<Y Then Min:=X
        ELse Min:=Y
End;

Procedure Preprocess;
Var i,j,M:Word;
Begin
 For i:=1 To 3 Do Begin
   For j:=1 To 3 Do Begin
     NEP[i,j]:=0; First[i,j]:=0
   End;
 End;

 For i:=1 To N Do Begin
  If i<=Na[1] Then Begin
    If NEP[S[i],1]=0 Then First[S[i],1]:=i;
    Inc(NEP[S[i],1]);
  End Else If i<=Na[1]+Na[2] Then Begin
    If NEP[S[i],2]=0 Then First[S[i],2]:=i;
    Inc(NEP[S[i],2]);
  End Else Begin
    If NEP[S[i],3]=0 Then First[S[i],3]:=i;
    Inc(NEP[S[i],3])
  End;
 End;
 NoCh:= Min(NEP[1,2], NEP[2,1])+
        Min(NEP[1,3], NEP[3,1])+
        Min(NEP[2,3], NEP[3,2])+
        2*Abs(NEP[1,2]-NEP[2,1]);
End;

Procedure Next(i1,i2:Byte);
Begin
 Dec(NEP[i1,i2]);
 If NEP[i1,i2]>0 Then Begin
   Repeat
     Inc(First[i1,i2]);
   Until S[First[i1,i2]]=i1;
 End;
End;

Procedure Pairs;
Var M,i,x,y :Word;
Begin
 For x:=1 To 3 Do
   For y:=x+1 To 3 Do Begin
     M:=Min(NEP[x,y], NEP[y,x]);
     For i:=1 To M Do Begin
       WriteLn(OutFile, First[x,y],' ',First[y,x]);
       Next(x,y); Next(y,x);
     End;
   End;
End;

Procedure Triples;
Var M,i: Word;
Begin
 If NEP[1,2] > 0 Then Begin
   M:=NEP[1,2];
   For i:=1 To M Do Begin
     WriteLn(OutFile, First[3,1],' ',First[1,2]);
     WriteLn(OutFile, First[1,2],' ',First[2,3]);
     Next(3,1); Next(1,2); Next(2,3);
   End;
 End Else Begin
   M:=NEP[2,1];
   For i:=1 To M Do Begin
     WriteLn(OutFile, First[2,1],' ',First[1,3]);
     WriteLn(OutFile, First[1,3],' ',First[3,2]);
     Next(2,1); Next(3,2); Next(1,3);
   End;
 End;
End;

Begin
 ReadInput;
 Preprocess;
 Assign(OutFile, 'output.txt');
 Rewrite(OutFile);
 WriteLn(OutFile,NoCh);
 Pairs;
 Triples;
 Close(OutFile);
End.