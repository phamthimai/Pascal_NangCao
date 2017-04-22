Program P101112;  {Diem binh chon ca si}
Uses  Crt;
Const dmax=1000;
      inp='P1011\P101112.INP';
      out='P1011\P101112.OUT';
Var   f,g: text;
      n: integer;
      d: array [1..dmax] of byte;

Procedure SapXep;
Var i,j,k,t: integer;
Begin
 For i:=1 to n-1 do
 begin
   k:=i;
   For j:=i+1 to n do If d[j]>d[k] then k:=j;
   If k<>i then
   begin
     t:=d[i]; d[i]:=d[k]; d[k]:=t;
   end;
 end;
End;

Procedure ChamDiem;
Var loai,i: integer; s: real;
Begin
 If n=0 then Exit;
 SapXep;
 If ((5*n)/100)-trunc((5*n)/100)=0 then loai:=trunc((5*n)/100)
 Else loai:=trunc((5*n)/100)+1;
 s:=0;
 For i:=loai+1 to n-loai do s:=s+d[i];
 If (n-2*loai)>0 then Writeln(g,s/(n-2*loai):0:2)
 Else Writeln(g,'Khong tinh duoc.');
End;

Procedure XuLy;
Var s: string; diem,kt: integer;
Begin
 Assign(f,inp); Reset(f);
 Assign(g,out); Rewrite(g);
 n:=0;
 While not Eof(f) do
 begin
   Readln(f,s);
   Val(s,diem,kt);
   If kt<>0 then
     begin
       ChamDiem; Write(g,s,': '); n:=0;
     end
   Else
     If (diem<=100) and (diem>0) then
     begin
       Inc(n); d[n]:=diem;
     end;
 end;
 ChamDiem;
 Close(g);
 Close(f);
End;

BEGIN
 XuLy;
END.