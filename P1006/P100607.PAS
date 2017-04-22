Program P100607;   {Sap xep danh sach theo thu tu Bang chu cai Moi}
Uses  Crt;
Const nmax=20;
      inp='P10\P100610.TXT';
      out='P10\P100610.OUT';
Type  str20 = string[20];
Var   f: text;
      n: integer;
      alph: String[26];
      TT: array ['A'..'Z'] of byte;
      a: array [1..nmax,1..2] of String;

Procedure Nhap;
Var i,j: integer;
Begin
 Assign(f,inp);
 Reset(f);
 Readln(f,alph);
 For i:=1 to 26 do alph[i]:=Upcase(alph[i]);
 Readln(f,n);
 For i:=1 to n do
 begin
   Readln(f,a[i,1]);
   While a[i,1,1]=#32 do Delete(a[i,1],1,1);
   a[i,2]:=a[i,1];
   For j:=1 to Length(a[i,2]) do a[i,2,j]:=UpCase(a[i,2,j]);
 end;
 Close(f);
 For i:=1 to 26 do TT[alph[i]]:=i;
End;

Function Truoc(A,B: string): boolean;
Var i: integer;
Begin
 While (A[1]=B[1])and(Length(A)>0)and(Length(B)>0) do
 begin
   Delete(A,1,1);
   Delete(B,1,1);
 end;
 If (Length(A)=0) then Truoc:=True
 Else If (Length(B)=0) then Truoc:=False
      Else If TT[A[1]]<=TT[B[1]] then Truoc:=True
           Else Truoc:=False;
End;

Procedure Sap_xep;
Var i,j,k: integer; t: String;
Begin
 For i:=1 to n-1 do
 begin
   k:=i;
   For j:=i+1 to n do
     If Truoc(a[j,2],a[k,2]) then k:=j;
   If k<>i then
   begin
     t:=a[i,1]; a[i,1]:=a[k,1]; a[k,1]:=t;
     t:=a[i,2]; a[i,2]:=a[k,2]; a[k,2]:=t;
   end;
 end;
End;

Procedure In_kq;
Var i:integer;
Begin
 Assign(f,out);
 Rewrite(f);
 For i:=1 to n do Writeln(f,a[i,1]);
 Close(f);
End;

BEGIN
 Clrscr;
 Nhap;
 Sap_xep;
 In_kq;
END.