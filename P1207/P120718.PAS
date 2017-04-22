Program P120818;  { Sinh day nhi phan ngau nhien}
Uses Crt;
Var  k,i: word;
     s  : String;

BEGIN
 Clrscr;
 Writeln;
 Write(' Nhap K: '); Readln(k);
 s:='';
 Randomize;
 For i:=1 to k do s:=s+chr(random(2)+48);
 Write(s);
 Readln;
END.