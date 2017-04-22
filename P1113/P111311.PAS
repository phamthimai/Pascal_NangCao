Program P111311;     {Liet ke cac duong di Euler}
Uses  Crt;
Const inp='P111308.inp';
      out='P111311.out';
Type  M1=array [0..10] of byte;
      M2=array [1..10,1..10] of byte;
Var   a: M2;
      b: M1;
      n,m,i,u: byte;
      f: text;
      Ok: boolean;

Procedure Input;
Var i,j,s,d: byte;
Begin
 Assign(f,inp); Reset(f);
 Readln(f,n);
 u:=1; m:=0; d:=0;
 For i:=1 to n do
 begin
   s:=0;
   For j:=1 to n do
   begin
     Read(f,a[i,j]); s:=s+a[i,j];
   end;
   If Odd(s) then begin Inc(d); u:=i; end;
   m:=m+s;
   Readln(f);
 end;
 m:=m div 2;
 Close(f);
 If d>2 then Ok:=false Else Ok:=true;
End;
Procedure InB;
Var i: integer;
begin
  For i:=0 to m do Write(f,b[i],' '); Writeln(f);
end;

Procedure Tim(CE: M1; a:M2; i:byte);
Var j,k: byte;
Begin
 For j:=1 to n do
   If (a[b[i-1],j]=1) then
   begin
     a[b[i-1],j]:=0; a[j,b[i-1]]:=0;
     b[i]:=j;
     If i=m then InB
     Else Tim(b,a,i+1);
     a[b[i-1],j]:=1; a[j,b[i-1]]:=1;
   end;
End;

BEGIN
 Input;
 b[0]:=u; i:=1;
 Assign(f,out); Rewrite(f);
 If Ok then Tim(b,a,i)
 Else Write('Khong co duong di Euler.');
 Close(f);
END.