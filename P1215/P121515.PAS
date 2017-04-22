Program Net;
Const
  MaxN=200;           { max number of schools }
Type
  GraphType=Array[1..MaxN,0..MaxN] Of 0..MaxN;
  VertexSet=Set Of 1..MaxN;
Var
  OutFile: Text;
  N :Word;            { the number of schools }
  G: GraphType;       { representation of the network with graph G; }
                      { G[p,0] is the number of edges outgoing from p }
                      { the outgoing edges from p: (p, G[p,i]) 1<=i<=G[p,0]) }
  Domin,              { dominator set }
  CoDomin: VertexSet; { codominator set }
  NoDomins,           { number of dominator elements   }
  NoCoDomins: 0..MaxN;{ number of codominator elements }
  AnswerB: 0..MaxN;   { solution of subtask B }
  p: 0..MaxN;

Procedure ReadInput;
{ Global output variables: N, G }
  Var InFile: Text;
  i,p: Word;
  Begin
    Assign(InFile, 'input.txt'); Reset(InFile);
    ReadLn(InFile,N);

    For i:=1 To N Do
      G[i,0]:=0;
    For i:=1 To N Do Begin
      Read(InFile, p);
      While p<>0 Do Begin
        Inc(G[i,0]);
        G[i,G[i,0]]:=p;
        Read(InFile, p);
      End;
      ReadLn(InFile);
    End;

    Close(InFile);
  End { ReadInput };

Procedure ComputeDomin(Const G: GraphType; Var D: VertexSet);
{ Computes a minimal dominator set D of graph G }
{ Global input variables: N }
  Var
    Dominated, Reachable: Set of 1..MaxN;
    p: 1..MaxN;

  Procedure Search(p:Word);
    Var i: Word;
  Begin
    Exclude(D, p);
    Include(Dominated, p);
    For i:= 1 To G[p,0] Do
      If Not (G[p,i] in Reachable) Then Begin
        Include(Reachable,G[p,i]);
        Search(G[p,i]);
      End;
  End { Search };

  Begin { ComputeDomin }
    D:=[];
    Dominated:=[];
    For p:=1 To N Do
      If Not (p In Dominated) Then Begin
        Reachable:=[p];
        Search(p);
        Include(D, p);
      End;
  End { ComputeDomin };

Procedure ComputeCoDomin(Const G: GraphType; Var CD: VertexSet);
{ Computes a minimal codominator set D of graph G }
{ Global input variables: N }
  Var
    GT: GraphType;           { transposed graph of G }
    p,q: 1..MaxN; i:Word;

  Begin { ComputeCoDomin }
    For p:=1 To N Do
      GT[p,0]:=0;
    For p:=1 To N Do         { compute the transpose of the graph G in GT }
      For i:=1 To G[p,0] Do Begin
        q:=G[p,i];
        Inc(GT[q,0]); GT[q,GT[q,0]]:=p;
      End;
  ComputeDomin(GT, CD)        { computes CD, the dominator set of GT }
  End;{ ComputeCoDomin }

Begin { Program }
  ReadInput;
  ComputeDomin(G,Domin);
  ComputeCoDomin(G,CoDomin);

  NoDomins:=0;
  For p:=1 To N Do     { count the number of elements in the set Domin }
    If p In Domin Then Inc(NoDomins);

  NoCoDomins:=0;
  For p:=1 To N Do     { count the number of elements in the set CoDomin }
    If p In CoDomin Then Inc(NoCoDomins);

  If (Domin=[1]) And (CoDomin=[1])  { strongly connected }
    Then AnswerB:=0
    Else If NoDomins > NoCoDomins
      Then AnswerB:=NoDomins
      Else AnswerB:=NoCoDomins;

  Assign(OutFile, 'output.txt'); Rewrite(OutFile);
  WriteLn(OutFile, NoDomins);
  Writeln(OutFile, AnswerB);
  Close(OutFile);
End.