Program P121503;     {IOI 94}
Const Test = true;
Var   inp,out: text;

Procedure Init;
Begin
 If Test then Writeln('IOI''94 - Day 1 - Problem 3: The Primes');
 Assign(inp,'input.txt'); Reset(inp);
 Assign(out,'output.txt'); ReWrite(out);
 If Test then Writeln('Initialized')
End;

Procedure Fini;
Begin
 Close(inp); Close(out)
End;

Type  digit = 0..9;
      index = 1..5;

Var   ds: integer;
      tld: digit;
      S: array [index, index] of digit;

Procedure ReadInput;
Begin
 Readln(inp,ds);
 If Test then Writeln('Digit sum is ',ds:1);
 Readln(inp,tld);
 If Test then Writeln('Digit in top left-hand corner is ',tld:1);
End;

Type  number = Record
                 d: array [index] of digit;
                 v: integer
               End;

Var   n: integer;
      prime: array [0..800] of number;
      first,last: array [digit] of integer;

Procedure ReadPrimes;
Var primes: text; p,s: integer; i: index; f: digit;
Begin
 Assign(primes,'primes-5.dat'); Reset(primes);
 For n:=1 to 9 do begin first[n]:=-1; last[n]:=-2; end;
 n:=0;
 While not eof(primes) do
 begin
   Readln(primes,p,s);
   If s=ds then With prime[n] do
   Begin
     v:=p;
     For i:=5 downto 1 do begin d[i]:=p mod 10; p:=p div 10; end;
     If first[d[1]]=-1 then first[d[1]]:=n;
     last[d[1]]:=n;
     Inc(n);
   End;
 end;
 If Test then
 begin
   Writeln('Number of 5-digit primes with digit sum ',ds:1,' is ',n:1);
   Writeln('Number of these primes with first digit f:');
   Write('  f = ');
   For f:=1 to 9 do Write(f:4);
   Writeln; Write('  # = ');
   For f:=1 to 9 do Write(last[f]+1-first[f]:4);
   Writeln;
 end;
End;

Function IsPrime(w: integer): boolean;
Var i,j,h: integer;
Begin
 i:=0; j:=n;
 While i<>pred(j) do
 begin
   h:=(i+j) div 2;
   If prime[h].v<=w then i:=h Else j:=h
 end;
 IsPrime:=(prime[i].v=w);
End;

Procedure WriteSquare(Var ff: text);
Var r,c: index;
Begin
 For r:=1 to 5 do
 begin
   For c:=1 to 5 do Write(ff,S[r,c]:1);
   Writeln(ff)
 end;
 Writeln(ff);
End;

Var   solutions: integer;

Procedure WriteSolution;
Begin
 WriteSquare(out);
 Inc(solutions);
 If Test then
 begin
   Writeln('Solution ',solutions:1);
   WriteSquare(output)
 end;
End;

Procedure H1; Forward;
Procedure H2; Forward;
Procedure H3; Forward;
Procedure H4; Forward;
Procedure H5; Forward;
Procedure V1; Forward;
Procedure V2; Forward;
Procedure V3; Forward;
Procedure V4; Forward;
Procedure V5; Forward;
Procedure D1; Forward;
Procedure D2; Forward;

Procedure ComputeAnswer;
Begin
 S[1,1]:=tld;
 solutions:=0;
 H1;
 If Test then Writeln('Number of solutions = ',solutions:1)
End;

Procedure H1;
Const R=1;
Var i: integer; c: index;
Begin
 For i:=first[tld] to last[tld] do with prime[i] do
   If d[2]<>0 then
     If d[3]<>0 then
       If d[4]<>0 then
       begin
         For c:=2 to 5 do S[R,c]:=d[c];
         V1;
       end;
End;

Procedure V1;
Const C=1;
Var i: integer; r: index;
Begin
 For i:=first[tld] to last[tld] do With prime[i] do
   If d[2]<>0 then
     If d[3]<>0 then
       If d[4]<>0 then
       begin
         For r:=2 to 5 do S[r,C]:=d[r];
         D2;
       end;
End;

Procedure D2;
Var i: integer;
Begin
 For i:=first[S[5,1]] to last[S[5,1]] do With prime[i] do
   If d[5]=S[1,5] then
   begin
     S[4,2]:=d[2]; S[3,3]:=d[3]; S[2,4]:=d[4];
     H2;
   end;
End;

Procedure H2;
Const R = 2;
Var i: integer;
Begin
 For i:=first[S[R,1]] to last[S[R,1]] do With prime[i] do
   If d[4]=S[R,4] then
   Begin
     S[R,2]:=d[2]; S[R,3]:=d[3]; S[R,5]:=d[5];
     V2;
   end;
End;

Procedure V2;
Const C = 2;
Var i: integer;
Begin
 For i:=first[S[1,C]] to last[S[1,C]] do With prime[i] do
   If d[2]=S[2,C] then
     If d[4]=S[4,C] then
     begin
       S[3,C]:=d[3]; S[5,C]:=d[5];
       H3;
     end;
End;

Procedure H3;
Const R = 3;
Var i: integer;
Begin
 For i:=first[S[R,1]] to last[S[R,1]] do With prime[i] do
   If d[2]=S[R,2] then
     If d[3]=S[R,3] then
     begin
       S[R,4]:=d[4]; S[R,5]:=d[5];
       V3;
     end;
End;

Procedure V3;
Const C = 3;
Var i: integer;
Begin
 For i:=first[S[1,C]] to last[S[1,C]] do With prime[i] do
   If d[2]=S[2,C] then
     If d[3]=S[3,C] then
     begin
       S[4,C]:=d[4]; S[5,C]:=d[5];
       H4;
     end;
End;

Procedure H4;
Const R = 4;
Var i: integer;
Begin
 For i:=first[S[R,1]] to last[S[R,1]] do With prime[i] do
   If d[2]=S[R,2] then
     If d[3]=S[R,3] then
     begin
       S[R,4]:=d[4]; S[R,5]:=d[5];
       V4;
     end;
End;

Procedure V4;
Const C = 4;
Var d,w: integer; r: index;
Begin
 d:=ds; w:=0;
 For r:=1 to 4 do
 begin
   d:=d-S[r,C];
   w:=10*w+S[r,C]
 end;
 If odd(d)and(0<=d)and(d<=9) then
   If IsPrime(10*w+d) then
   begin
     S[5,C]:=d;
     H5;
   end;
End;

Procedure H5;
Const R = 5;
Var d,w: integer; c: index;
Begin
 d:=ds; w:=0;
 For c:=1 to 4 do
 begin
   d:=d-S[R,c];
   w:=10*w+S[R,c]
 end;
 If odd(d)and(0<=d)and(d<=9) then
 If IsPrime(10*w+d) then
 begin
   S[R,5]:=d;
   V5;
 end;
End;

Procedure V5;
Const C = 5;
Var w: integer; r: index;
Begin
 w:=0;
 For r:=1 to 5 do w:=10*w+S[r,C];
 If IsPrime(w) then D1;
End;

Procedure D1;
Var w: integer; rc: index;
Begin
 w:=0;
 For rc:=1 to 5 do w:=10*w+S[rc,rc];
 If IsPrime(w) then WriteSolution;
End;

BEGIN
 Init;
 ReadInput;
 ReadPrimes;
 ComputeAnswer;
 Fini
END.
