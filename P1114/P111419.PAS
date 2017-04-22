Program P111419;   {Xep domino}
Uses Crt;
Var  a: array [1..28,1..2] of byte;
     dx: array [1..28] of byte;
     b: array [1..100] of byte;
     i,j,dem: byte;

Procedure Tim(k: byte);
Var i: byte;
Begin
 If k>28 then
 begin
   For i:=1 to 28 do Write(b[(i-1)*2+1],' ',b[(i-1)*2+2],'  ');
   Readln;
   Halt;
 end;
 For i:=1 to 28 do
   If (dx[i]=0) then
   begin
     dx[i]:=1;
     If a[i,1]=b[2*(k-1)] then
     begin
       b[2*k-1]:=a[i,1];
       b[2*k]:=a[i,2];
       Tim(k+1);
     end;
     If (a[i,1]<>a[i,2])and(a[i,2]=b[2*(k-1)]) then
     begin
       b[2*k-1]:=a[i,2];
       b[2*k]:=a[i,1];
       Tim(k+1);
     end;
     dx[i]:=0;
   end;
End;

BEGIN
 ClrScr;
 dem:=0;
 For i:=0 to 6 do
   For j:=i to 6 do
   begin
     Inc(dem);
     a[dem,1]:=i;
     a[dem,2]:=j;
   end;
 FillChar(dx,sizeof(dx),0);
 For i:=1 to 28 do
 begin
   FillChar(b,Sizeof(b),0);
   dx[i]:=1;
   b[1]:=a[i,1];
   b[2]:=a[i,2];
   Tim(2);
   dx[i]:=0;
 end;
END.