Program P111217;   {Ma tran Latinh}
Uses  Crt;
Const OUT='P111217.OUT';
Var   D,C: Array [1..5] of Byte;
      A: Array [1..5,1..5] of Byte;
      Gn,GnD: Array [1..5] of Boolean;
      f: Text;

Procedure Viet;
Var i,j,k: Byte;
Begin
 For i:=1 to 5 do
 begin
   j:=1;
   While C[i]<>D[j] do j:=j+1;
   For k:=0 to 4 do Write(f,D[(i+j+k-2) mod 5+1],' ');
   Writeln(f);
 end;
 Writeln(f);
End;

Procedure SinhHVD(i: Byte);
Var j: Byte;
Begin
 For j:=1 to 5 do
   If Not GND[j] Then
   begin
     C[i]:=j;
     GND[j]:=True;
     If i=5 Then Viet Else SinhHVD(i+1);
     GND[j]:=false;
   End;
End;

Procedure SinhHV(i: Byte);
Var j: Byte;
Begin
 For j:=1 to 5 do
   If not GN[j] Then
   begin
     D[i]:=j;
     GN[j]:=True;
     If i=5 then
       begin
         FillChar(GnD,SizeOf(GnD),false);
         GnD[D[1]]:=True;
         C[1]:=D[1];
         SinhHVD(2);
       end
     Else SinhHV(i + 1);
     GN[j]:=false;
   end;
End;

BEGIN
 Assign(f,OUT); Rewrite(f);
 Fillchar(Gn,SizeOf(Gn),false);
 SinhHV(1);
 Close(f);
END.