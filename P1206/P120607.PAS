Program P120607;   {Tinh dinh thuc bang hoan vi}
Uses  Crt;
Const fi='p120607.inp';
Var   a   : array [1..20,1..20] of real;
      b,dx: array [1..20] of byte;
      det : real;
      n   : byte;

Procedure Input;
Var f: text; i,j: byte;
Begin
 Assign(f,fi); Reset(f);
 Readln(f,n);
 For i:=1 to n do
 begin
   For j:=1 to n do Read(f,a[i,j]); Readln(f);
 end;
 Close(f);
End;

Function Dau: integer;
Var d,i,j,count: integer;
Begin
 count:=0;
 For i:=1 to n-1 do
   For j:=i+1 to n do If b[i]>b[j] then inc(count);
 If (count mod 2)=0 then dau:=1 Else dau:=-1;
End;

Procedure Tinh(dem: byte);
Var i: byte; t: real;
Begin
 If dem>n then
 begin
   t:=1;
   For i:=1 to n do
   begin
        Write(b[i],' ');
        t:=t*a[i,b[i]];
   end;
   det:=det+dau*t;
   Writeln;
   Exit;
 end;
 For i:=1 to n do
   If dx[i]=0 then
   begin
     dx[i]:=1;
     b[dem]:=i;
     tinh(dem+1);
     dx[i]:=0;
   end;
End;

BEGIN
 Input;
 Fillchar(dx,Sizeof(dx),0);
 det:=0;
 Tinh(1);
 Write(det);
 Readln;
END.
