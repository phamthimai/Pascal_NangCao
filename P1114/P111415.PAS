Program P1111415;     {Tim 1 duong di khep kin cua con ma}
Uses  Crt;
Const out='P111415.out';
      n=8;
Type  M1=array [0..n*n-1] of byte;
      M2=array [0..n*n-1,0..n*n-1] of byte;
Var   a: M2;
      b,c: M1;
      i: byte;
      f: text;

Procedure Input;
Var i,j,xi,yi,xj,yj: byte;
Begin
 For i:=0 to n*n-1 do
   For j:=0 to n*n-1 do
   begin
     xi:=i div n; yi:=i mod n;
     xj:=j div n; yj:=j mod n;
     If ((abs(xi-xj)=1)and(abs(yi-yj)=2))or((abs(xi-xj)=2)and(abs(yi-yj)=1))
     then a[i,j]:=1 Else a[i,j]:=0;
   end;
 For i:=0 to n*n-1 do c[i]:=0;
End;

Procedure InB(b: M1);
Var i: integer;
begin
 For i:=0 to n*n-1 do Write(f,b[i],' '); Writeln(f);
 Close(f);
 Halt;
end;

Procedure Tim(b,c: M1; i:byte);
Var j,k: byte;
Begin
 For j:=0 to n*n-1 do
   If (a[b[i-1],j]=1)and(c[j]=0) then
   begin
     b[i]:=j; c[j]:=1;
     If i<n*n-1 then Tim(b,c,i+1)
     Else If (a[b[i],b[0]]=1) then InB(b);
     c[j]:=0;
   end;
End;

BEGIN
 Input;
 b[0]:=0; c[0]:=1; i:=1;
 Assign(f,out); Rewrite(f);
 Write('...');
 Tim(b,c,i);
 Close(f);
END.