Program P121511;  {IOI 94}
Const Test  = true;
      Trace = false;
Var   inp,out: text;

Procedure Init;
Begin
 If Test then Writeln('IOI''94 - Day 2 - Problem 3: The Circle');
 Assign(inp,'input.txt');  Reset(inp);
 Assign(out,'output.txt'); ReWrite(out);
 If Test then Writeln('Initialized')
End;

Procedure Fini;
Begin
 Close(inp); Close(out)
End;

Const Max_n =  6;
      Max_k = 20;
      Max_m = 20;

Type  Circle = array [1..Max_n] of integer;

Procedure WriteCircle(Var f: text; c: Circle; len: integer);
Var i: integer;
Begin
 For i:=1 to len do Write(f,' ',c[i]:2);
 Writeln(f)
End;

Var   n: 1..Max_n;
      m: 1..Max_m;
      k: 1..Max_k;

Var   BestCount: integer;
      BestTail : integer;

Procedure ReadInput;
Begin
 Readln(inp,n); Readln(inp,m); Readln(inp,k);
 If Test then Writeln('n, m, k = ',n:1,', ',m:1,', ',k:1)
End;

Procedure WriteOutput;
Var i,j: integer;
Begin
 If Test then
   Writeln('Max tail = ',BestTail:1,'; # arr. = ',BestCount:1)
End;

Var   Arr : Circle;
      Tail: integer;

Procedure ComputeTail;
Var a,b,s,u: integer;
  Creatable: array [1..51] of boolean;
Begin
 u:=1+m+(n-1)*n;
 For a:=1 to u do Creatable[a]:=false;
 For a:=1 to n do
 begin
   s:=0;
   For b:=a to n do
   begin
     s:=s+Arr[b];
     If s<=u then Creatable[s]:=true;
   end;
   For b:=1 to a-2 do
   begin
     s:=s+Arr[b];
     If s<=u then Creatable[s]:=true;
   end;
 end;
 Tail := m;
 While Creatable[Tail] do Inc(Tail);
 Dec(Tail)
End;

Procedure CheckArrangement;
Begin
 ComputeTail;
 If Tail>BestTail then
 begin
   BestCount:=1; BestTail:=Tail;
   Close(out); ReWrite(out);
   Writeln(out,BestTail:1);
   WriteCircle(out,Arr,n);
 end
 Else
 If Tail=BestTail then
 begin
   Inc(BestCount);
   WriteCircle(out,Arr,n);
 end;
End;

Procedure ComputeUpperBound(i: integer; Var ub: integer);
Var a,b,s,u: integer;
  Creatable: array [1..51] of boolean;
Begin
 u:=1+m+(n-1)*n;
 For a:=1 to u do Creatable[a]:=false;
 For a:=1 to pred(i) do
 begin
   s:=0;
   For b:=a to pred(i) do
   begin
     s:=s+Arr[b];
     If s<=u then Creatable[s]:=true;
   end;
 end;
 a:=n-i;
 a:=n*a-(a*succ(a)) div 2+1;
 ub:=m;
 While a<>0 do
 begin
   While Creatable[ub] do inc(ub);
   Inc(ub); Dec(a);
 end;
End;

Procedure FillRemainder(i: integer);
Var j,u: integer;
Begin
 If i>n then CheckArrangement
 Else
 begin
   If Trace then WriteCircle(output,Arr,pred(i));
   ComputeUpperBound(i,u);
   For j:=Arr[1] to u do
   begin
     Arr[i]:=j;
     FillRemainder(succ(i));
   end;
 end;
End;

Procedure ComputeAnswer;
Var j: integer;
Begin
 BestCount:=0; BestTail:=m+n-1;
 For j:=k to m do
 begin
   Arr[1]:=j;
   FillRemainder(2);
 end;
End;

BEGIN
 Init;
 ReadInput;
 ComputeAnswer;
 WriteOutput;
 Fini;
END.
