Program P110205;  {Sap xep van ban theo thu tu bang chu cai}
Uses Crt;
Var  i,j,sl,dau: byte;
     s,sx,tu: string;
     d,l: array [1..300] of byte;
     co: boolean;

Procedure Laytu;
Begin
 co:=false;
 While (dau<=length(s))and(s[dau]=' ') do Inc(dau);
 If dau>length(s) then exit;
 co:=true; Inc(sl);
 d[sl]:=dau; l[sl]:=0;
 While (dau<=length(s))and(s[dau]<>' ') do
   begin
     Inc(l[sl]); Inc(dau);
   end;
End;

Procedure Kiemtra;
Begin
 tu:=copy(s,d[sl],l[sl]);
 If sl=1 then sx:=chr(1)
 Else
   For i:=1 to length(sx) do
   begin
     If tu<copy(s,d[ord(sx[i])],l[ord(sx[i])]) then
     begin
       Insert(chr(sl),sx,i); break;
     end;
     sx:=sx+chr(sl);
   end;
End;

BEGIN
 ClrScr;
 Write('Nhap doan van ban can sap xep: ');
 Readln(s);
 sx:=''; sl:=0; dau:=1;
 While dau<=length(s) do
 begin
   Laytu;
   If co then Kiemtra;
   If dau=length(s) then break;
 end;
 Writeln('Co ',sl,' tu da duoc sap xep :');
 For i:=1 to sl do
 begin
   If (i mod 20)=0 then ClrScr;
   Writeln(copy(s,d[ord(sx[i])],l[ord(sx[i])]));
   If ((i mod 20)=1)and(i>1) then Readln;
 end;
 If not (((i mod 20)=1)and(i>1)) then Readln;
END.