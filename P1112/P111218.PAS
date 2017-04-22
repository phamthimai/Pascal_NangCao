Program P111218;  {Bai Toan xep 5 con hau tren ban co }
Uses  Crt;
Const Ke: Array[1..2,1..8] of ShortInt
      =((-1,-1,-1,0,1,1,1,0),(-1,0,1,1,1,0,-1,-1));
Var   A: Array[1..8,1..8] of Boolean;
      Gn: Array[1..8,1..8] of Boolean;

Procedure Khoitao;
Begin
 Clrscr;
 Fillchar(A,Sizeof(A),False);
 Fillchar(Gn,Sizeof(Gn),False);
End;

Function Ngoai(i,j: Byte): Boolean;
Begin
 Ngoai:=(i=0)or(j=0)or(i=9)or(j=9);
End;

Procedure Tinh;
Var i,j,k,L,H,S,M,Ti,Tj,Li,Lj: Byte;
Begin
 For i:=1 to 5 do
 begin
   M:=0;
   For j:=1 to 8 do
     For k:=1 to 8 do
     begin
       S:=0;
       Ti:=j;
       Tj:=k;
       If not A[Ti,Tj] then
       begin
         If not Gn[Ti,Tj] then S:=S+1;
         For H:=1 to 8 do
         begin
           L:=1;
           While not Ngoai(Ti+L*Ke[1,H],Tj+L*ke[2,H]) do
           begin
             If not Gn[Ti+L*ke[1,H],Tj+L*Ke[2,H]] then S:=S+1;
             L:=L+1;
           end;
         end;
         If S>M then
         begin
           M:=S; Li:=Ti; Lj:=Tj;
         end;
       end;
     end;
   A[Li,Lj]:=True;
   Gn[Li,Lj]:=True;
   For H:=1 to 8 do
   begin
     L:=1;
     While not Ngoai(Li+L*Ke[1,H],Lj+L*Ke[2,H]) do
     begin
       Gn[Li+L*Ke[1,H],Lj+L*Ke[2,H]]:=True;
       L:=L+1;
     end;
   end;
 end;
End;

Procedure Viet;
Var i,j: Byte;
Begin
 For i:=1 to 8 do
   For j:=1 to 8 do
     If A[i,j] then Writeln(i,' ',j);
 Readln;
End;

BEGIN
 Khoitao;
 Tinh;
 Viet;
END.