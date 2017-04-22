Program P111207;    {Liet ke cac hoan vi cua cac to hop m so}
Uses  Crt;
Const OUT='P111207.OUT';
Var   N,M: Byte;
      A: Array [0..100] Of Byte;
      Cs: Array [1..100] Of Byte;
      Gn: Array [1..100] Of Boolean;
      F: Text;

Procedure Viet;
Var I: Byte;
Begin
 For I:=1 to M do Write(F,A[Cs[I]],' ');
 Writeln(F);
End;

Procedure Chuanbi;
Begin
 Clrscr;
 Write('Cho so M: '); Readln(M);
 Write('Cho so N: '); Readln(N);
 Assign(F,OUT); Rewrite(F);
End;

Procedure SinhHV(I: Byte);
Var J: Byte;
Begin
 For J:=1 to M do
   If not GN[J] then
   begin
     Cs[I]:=J;
     GN[J]:=True;
     If I=M then Viet
     Else SinhHV(I+1);
     GN[J]:=False;
   end;
End;

Procedure SinhTH(I: Byte);
Var J: Byte;
Begin
 For J:=A[I-1]+1 to N do
 begin
   A[I]:=J;
   If I=M Then
     begin
       FillChar(Gn,SizeOf(Gn),False);
       SinhHV(1)
     end
   Else SinhTH(I+1);
 end;
End;

BEGIN
 Chuanbi;
 A[0]:=0;
 SinhTH(1);
 Close(F);
END.