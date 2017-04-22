Program P120204;   {Lap Ma tran ke tu Danh sach ke}
Uses  Crt;
Const fi='P120203.OUT';
      fo='P120204.out';
Var   a: array [1..200,1..200] of byte;
      f: text;
      n: byte;

Procedure Input;
Var i,j,k: byte;
Begin
 Assign(f,fi); Reset(f);
 Readln(f,n);
 For i:=1 to n do
 begin
   While(not SeekEoln(f)) do
   begin
     Read(f,k); a[i,k]:=1;
   end;
   Readln(f);
 end;
 Close(f);
End;

Procedure Output;
Var i,j: byte;
Begin
 Assign(f,fo); Rewrite(f);
 Writeln(f,n);
 For i:=1 to n do
 begin
   For j:=1 to n do Write(f,' ',a[i,j]); Writeln(f);
 end;
 Close(f);
End;

BEGIN
 Input;
 Output;
END.