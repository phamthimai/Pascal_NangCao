Program P100217; {Thu duoc so co 4 chu so lon nhat tu xau ki tu}
Uses Crt;
Var  S: String;
     c: char;
     n,i,j,k: integer;

BEGIN
 Clrscr;
 Write('Nhap xau S co it nhat 4 chu so: '); Readln(S);
 i:=1;
 Repeat   {Xoa cac ki tu khong la chu so}
   If (S[i] in ['0'..'9']) then Inc(i)
   Else Delete(S,i,1);
 Until i>Length(S);
 For i:=1 to 4 do
 begin
   k:=i;
   For j:=i to Length(S)+i-4 do If (S[k]<S[j]) then k:=j;
   If k>i then Delete(S,i,k-i);
 end;
 If Length(S)>4 then Delete(S,5,Length(S)-4);
 Write(' ',S);
 Readln;
END.