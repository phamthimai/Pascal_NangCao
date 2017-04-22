Program P120819;   { Sinh day so thap phan ngau nhien}
Uses Crt;
Var  k,i: word;
     s  : String;

BEGIN
 Write(' Nhap K: '); Readln(k);
 s:='';
 Randomize;
 For i:=1 to k do s:=s+chr(random(9)+49);
 Write(s);
 Readln;
END.