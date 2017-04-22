Program P121402;   {Xay dung xau khong lap bac N}
Uses  Crt;
Const Out  ='P121402.Out';
      Lmax = 64000;
      Nmax = 16;
Var   N: byte;
      A: array [1..Lmax] of byte;
      L: longint;

Procedure Nhap;
Begin
 Write('N = '); Readln(n);
End;

Function Lap(k: longint): boolean;
Var so,so1,i,ii: longint;
Begin
 Lap:=true;
 so:=0;
 For i:=1 to n do
 begin
   so:=so shl 1;
   so:=so or A[k+i-1];
 end;
 so1:=so;
 For ii:=k-1 downto 1 do
 begin
   so1:=so1 shr 1;
   so1:=so1 or(A[ii] shl (n - 1));
   If so=so1 then exit;
 end;
 Lap:=false;
End;

Function Thu(gt: byte): boolean;
Begin
 A[L]:=gt;
 Thu:=not Lap(L-N+1);
End;

Procedure TaoDay;
Var i: byte; KetThuc: boolean;
Begin
 For i:=1 to N do A[i]:=1;
 L:=N;
 KetThuc:=false;
 Repeat
   inc(L);
   If not Thu(0) then
     If not Thu(1) then KetThuc:=true;
 Until KetThuc;
 Dec(L);
end;

Procedure InKq;
Var i: integer; f: text;
Begin
 Assign(f,Out); Rewrite(f);
 Writeln(f,L);
 For i:=1 to L do Write(f,A[i]);
 Close(f);
End;

BEGIN
 Clrscr;
 Nhap;
 TaoDay;
 InKq;
END.