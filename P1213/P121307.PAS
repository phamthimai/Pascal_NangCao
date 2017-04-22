Program P121407;     {chen nhi phan}
Uses  Crt;
Const fi = 'P121307.inp';
      fo = 'P121007.out';
Var   a,b: array [0..10000] of integer;
      n,d: integer;
      f: text;

Procedure chen(k,t: integer);
Var i: integer;
Begin
 Inc(d);
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

Function tim(k: integer): integer;
Var x,y: integer;
Begin
 x:=0;
 y:=d;
 Repeat
   If k>b[(y+x) div 2] then x:=(y+x) div 2
   Else y:=(y+x) div 2;
 Until (y-x)<2;
 tim:=y;
End;

Procedure work;
Var i: integer;
Begin
 b[0]:=-maxint;
 b[1]:=maxint;
 d:=1;
 For i:=1 to n do chen(a[i],tim(a[i]));
End;

Procedure output;
Var i: integer;
Begin
 Assign(f,fo); Rewrite(f);
 Writeln(f,n);
 For i:=1 to n do Write(f,' ',b[i]);
 Close(f);
End;

BEGIN
 input;
 work;
 output;
END.