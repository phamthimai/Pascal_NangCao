Program P110203;  {Giong hang phai}
Uses  Crt;
Const inp='P110204.INP';
      out='P110204.out';
Var   Max,m,n,i,j,l,a,b: word;
      S: string;
      finp,fout: text;

Procedure RTrim(Var S: string);
Begin
 While S[Length(S)]=#32 do Delete(S,Length(S),1);
End;

Function Rong: Word;
Var Max: integer;
Begin
 Assign(finp,inp); Reset(finp);
 Max:=0;
 While not EoF(finp) do
 begin
   Readln(finp,S);
   RTrim(S);
   n:=0; m:=0;i:=1; l:=Length(S);
   While (S[i]=#32)and(i<=l) do Inc(i);
   Repeat
     If S[i]=#32 then
     begin
       While (S[i]=#32)and(i<=l) do begin Inc(n); Inc(i); end;
       Inc(m);
     end;
     While (S[i]<>#32)and(i<=l) do Inc(i);
   Until i>l;
   If Max<l-n+m then Max:=l-n+m;
 end;
 Close(finp);
 Rong:=Max;
End;

BEGIN
 ClrScr;
 Max:=Rong; {Do rong van ban}
 Assign(finp,inp); Reset(finp);
 Assign(fout,out); Rewrite(fout);
 While not SeekEoF(finp) do  {Xu li tung dong}
 begin
   Readln(finp,S);
   RTrim(S);          {Tinh so lieu cua dong}
   n:=0; m:=0;i:=1; l:=Length(S);
   While (S[i]=#32)and(i<=l) do Inc(i);
   Repeat
     If S[i]=#32 then
     begin
       While (S[i]=#32)and(i<=l) do begin Inc(n); Inc(i); end;
       Inc(m);
     end;
     While (S[i]<>#32)and(i<=l) do Inc(i);
   Until i>l;
   l:=l-n;
   a:=(Max-l) div m; b:=(Max-l) mod m;
   {Xu li dong}
   i:=1; m:=0;
   While (S[i]=#32)and(i<=l) do Inc(i);
   Repeat
     If S[i]=#32 then
     begin
       Inc(m); If m<=b then n:=a+1 Else n:=a;
       While (s[i]=#32)and(i<=Length(S)) do Delete(S,i,1);
       For j:=1 to n do Insert(' ',S,i); i:=i+n;
     end;
     While (s[i]<>#32)and(i<=Length(S)) do Inc(i);
   Until i>=Max;
   Writeln(fout,S);
 end;
 Close(finp); Close(fout);
END.