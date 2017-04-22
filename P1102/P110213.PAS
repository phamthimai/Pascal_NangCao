Program P110213;  {Kiem tra khoa va ma hoa van ban}
Uses Crt;
Var  i,j,max,l:word;
     code: array [1..2,1..9] of byte;
     dl: array[ 1..300] of char;
     s: array [1..2] of string;
     khoa,tam,out: string;

Procedure Error;
Begin
 Write('Khoa khong hop le');
 Readln;
 halt;
End;

Procedure Mahoa(xau: string; khoa: byte);
Begin
 For i:=1 to length(xau) do dl[i]:=xau[i];
 l:=length(xau);
 For i:=1 to max-(length(xau) mod max) do dl[l+i]:=' ';
 Inc(l,max-(length(xau) mod max));
 For i:=1 to l div max do
 begin
   tam:='';
   For j:=1 to max do tam:=tam+dl[(i-1)*max+j];
   For j:=1 to max do out[j]:=tam[code[khoa,j]];
   Write(out);
 end;
End;

BEGIN
 Clrscr;
 Write('Nhap khoa: '); Readln(khoa);
 max:=0; tam:='';
 If length(khoa)=0 then Error;
 For i:=1 to Length(khoa) do
 begin
   If pos(khoa[i],'123456789')=0 then Error;
   If pos(khoa[i],tam)<>0 then Error;
   tam:=tam+khoa[i];
   If max<ord(khoa[i]) then max:=ord(khoa[i]);
 end;
 max:=max-48;
 If max<>length(khoa) then Error;
 For i:=1 to max do
 begin
   code[1,i]:=ord(khoa[i])-48;
   code[2,ord(khoa[i])-48]:=i;
 end;
 Out:='';
 For i:=1 to max do out:=out+' ';
 Write('Nhap xau can ma hoa: '); Readln(s[1]);
 Write('Nhap xau can giai ma: '); Readln(s[2]);
 Clrscr;
 Writeln('Xau ban dau: ',s[1]);
 Write('Xau ma hoa: '); Mahoa(s[1],1); Writeln;
 Writeln('Xau ban dau: ',s[2]);
 Write('Xau giai ma: '); Mahoa(s[2],2); Readln;
END.