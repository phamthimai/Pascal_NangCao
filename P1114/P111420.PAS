Program P111420;{dat domino}
Uses Crt;
Var  a: array [1..28,1..2] of byte;
     dx: array [1..28] of byte;
     b: array [0..100] of byte;
     c: array [0..100] of byte;
     i,j,dem,db,dc,t1,t2: byte;

Procedure Input;
Begin
 Write(' Nhap a: '); Readln(t1);
 Write(' Nhap b: '); Readln(t2);
 c[0]:=t1;
 b[0]:=t2;
End;

Procedure Tim(k: byte);
Var i,j: byte;
Begin
 If k>28 then
 begin
   For i:=dc downto 0 do
   begin
     Write(c[i]);
     If odd(i) then Write('  ') Else Write(' ');
   end;
   For i:=0 to db do
   begin
     Write(b[i]);
     If not odd(i) then Write('  ') Else Write(' ');
   end;
   Writeln;
   Readln;
   Halt;
 End;
 For i:=1 to 28 do
   If (dx[i]=0) then
   Begin
     dx[i]:=1;
     If b[db]=a[i,1] then
     begin
       b[db+1]:=a[i,1]; b[db+2]:=a[i,2];
       Inc(db,2); Tim(k+1); Dec(db,2);
     end;
     If (a[i,2]<>a[i,1])and(a[i,2]=b[db]) then
     begin
       b[db+1]:=a[i,2]; b[db+2]:=a[i,1];
       Inc(db,2); Tim(k+1); Dec(db,2);
     end;
     If c[dc]=a[i,1] then
     begin
       c[dc+1]:=a[i,1]; c[dc+2]:=a[i,2];
       Inc(dc,2); Tim(k+1); Dec(dc,2);
     end;
     If (a[i,2]<>a[i,1])and(a[i,2]=c[dc]) then
     begin
       c[dc+1]:=a[i,2]; c[dc+2]:=a[i,1];
       Inc(dc,2); Tim(k+1); Dec(dc,2);
     end;
     dx[i]:=0;
 end;
End;

BEGIN
 Input;
 dem:=0;
 For i:=0 to 6 do
   For j:=i to 6 do
   begin
     Inc(dem);
     If((i=t1)and(j=t2))or((i=t2)and(i=t1)) then dx[i]:=1;
     a[dem,1]:=i;
     a[dem,2]:=j;
   end;
 FillChar(dx,Sizeof(dx),0);
 dc:=0;
 db:=0;
 Tim(2);
END.