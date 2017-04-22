Program P121407;   {chen nhi phan}
Uses  Crt;
Const fi = 'P121308.inp';
      fo = 'P121008.out';
Var   a,b: array [0..10000] of integer;
      n,d: integer;
      f: text;

Procedure chen(k,t: integer);
Var i: integer;
Begin
 inc(d);
 For i:=d downto t+1 do b[i]:=b[i-1];
 b[t]:=k;
End;

Procedure input;
Var i: integer;
Begin
 Assign(f,fi); Reset(f);
 Readln(f,n);
 For i:=1 to n do Read(f,a[i]);
 Close(f);
End;

Function tim(k: integer; Var chen: boolean): integer;
Var x,y: integer;
Begin
 x:=0; y:=d;
 Repeat
   If k>b[(y+x) div 2] then x:=(y+x) div 2
   Else y:=(y+x) div 2;
 Until (y-x)<2;
 tim:=y;
 chen:=(k<>b[y]) and (k<>b[x]);
End;

Procedure work;
Var i,t: integer; ok: boolean;
Begin
 b[0]:=-maxint;
 b[1]:=maxint;
 d:=1;
 For i:=1 to n do
 begin
   t:=tim(a[i],ok);
   If ok then chen(a[i],t);
 end;
End;

Procedure output;
Var i: integer;
Begin
 Assign(f,fo); Rewrite(f);
 Writeln(f,d-1);
 For i:=1 to d-1 do Write(f,' ',b[i]);
 Close(f);
End;

BEGIN
 input;
 work;
 output;
END.