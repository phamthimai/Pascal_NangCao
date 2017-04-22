Program P110214;   {Giai ma cac bit thong tin}
Uses Crt;
Var  i,j: byte;
     s1,s2: string;
     l: array [0..2] of byte;

BEGIN
 Clrscr;
 Write('Nhap xau nhi phan thong tin: '); Readln(s1);
 s2:='';
 Clrscr;
 For i:=1 to length(s1) do
   If pos(s1[i],'01')=0 then
   begin
     Write('Doan ma bit khong hop le.');
     Readln;
     exit;
   end;
 While (length(s1) mod 3)<>0 do s1:=s1+'2';
 For i:=1 to length(s1) div 3 do
 begin
   FillChar(l,SizeOf(l),0);
   For j:=1 to 3 do Inc(l[ord(s1[(i-1)*3+j])-48]);
   If l[0]>=2 then s2:=s2+'0'
   Else If l[1]>=2 then s2:=s2+'1';
 end;
 Writeln('Thong tin nhan duoc: ',s1);
 Writeln('Thong tin giai ma: ',s2);
 Readln;
END.