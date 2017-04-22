Program P110202;  {Tao 3 mang tu 1 mang}
Uses  Crt;
Const max=100;
Var   n,i,p: word;
      S: string;
      ten,holot: array [1..max] of string[20];
      lop: array [1..max] of string[5];
      danhsach: array [1..max] of string[45];

Procedure Nhap;
Var f: text;
Begin
 Assign(f,'Danhsach.TXT'); Reset(f);
 n:=0;
 While not EoF(f) do
 begin
   Inc(n);
   Readln(f,danhsach[n]);
 end;
 Close(f);
End;

Procedure Xuat;
Var i: integer;
Begin
 For i:=1 to n do Writeln(Holot[i]:20,ten[i]:10,lop[i]:5);
End;

BEGIN
 Nhap;
 For i:=1 to n do
 begin
   s:=danhsach[i];
   While s[Length(s)]=#32 do Delete(s,Length(s),1);
   p:=length(s);
   While s[p]<>#32 do Dec(p);
   Lop[i]:=Copy(s,p+1,length(s)-p);
   Delete(s,p+1,length(s)-p);
   While s[Length(s)]=#32 do Delete(s,Length(s),1);
   p:=length(s);
   While s[p]<>#32 do Dec(p);
   Ten[i]:=Copy(s,p+1,length(s)-p);
   Delete(s,p+1,length(s)-p);
   Holot[i]:=s;
 end;
 Xuat;
 Readln;
END.