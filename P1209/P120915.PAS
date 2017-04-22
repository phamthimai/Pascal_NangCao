Program P120915;  {Tim toa do trong tam cua chat the}
Uses Crt;
Var  f     : text;
     i,n   : integer;
     x,y,m : array [1..100] of real;
     xo,yo,Sm,Smx,Smy: real;

Procedure Nhap;
Var f: text;
Begin
 Assign(f,'P120915.inp'); Reset(f);
 n:=0;
 While not EOF(f) do
 begin
   Inc(n);
   Readln(f,x[n],y[n],m[n]);
 end;
 Close(f);
End;

BEGIN
 Nhap;
 Sm:=0; Smx:=0; Smy:=0;
 For i:=1 to n do Sm:=Sm+m[i];
 For i:=1 to n do Smx:=Smx+m[i]*x[i];
 For i:=1 to n do Smy:=Smy+m[i]*y[i];
 xo:=Smx/Sm; yo:=Smy/Sm;
 Writeln('Toa do trong tam : (',xo:0:2,',',yo:0:2,')');
 Readln;
END.