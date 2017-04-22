Program P120203;   {Ma tran ke}
Uses  Crt;
Const fi='P120203.inp';
      fo='P120203.out';
Var   a: array [1..200,1..200] of byte;
      n: byte;
      f: text;

Procedure Input;
Var i,j: byte;
Begin
 Assign(f,fi); Reset(f);
 Readln(f,n);
 For i:=1 to n do
 begin
   For j:=1 to n do Read(f,a[i,j]); Readln(f);
 end;
 Close(f);
End;

Function Test: boolean; {kiem tra do thi vo huong}
Var i,j: byte;
Begin
 test:=false;
 For i:=1 to n-1 do
   For j:=i+1 to n do
     If a[i,j]<>a[j,i] then exit;
 test:=true;
End;

Procedure Output;
Var i,j: byte;
Begin
 Assign(f,fo); Rewrite(f);
 Writeln(f,n);
 For i:=1 to n do
 begin
   For j:=1 to n do
     If (a[i,j]=1)and(i<>j) then Write(f,' ',j);
   Writeln(f);
 end;
 Close(f);
End;

BEGIN
 Input;
 Output;
END.