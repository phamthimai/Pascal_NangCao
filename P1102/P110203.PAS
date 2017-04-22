Program P110203;  {Sua loi chinh ta}
Uses  Crt;
Const Dau1: set of char=['.',',',':',';','!'];
      Dau2: set of char=['.',':','!'];
Var   p,i: word;
      S: string;
      finp,fout: text;

BEGIN
 Assign(finp,'Anphabet.TXT'); Reset(finp);
 Assign(fout,'KQ.TXT'); Rewrite(fout);
 While not EoF(finp) do
 begin
   Readln(finp,S);
   Repeat
     p:=Pos('  ',S);
     If p<>0  then Delete(S,p,1);
   Until p=0;
   i:=1;
   Repeat
     If S[i] in Dau1 then
     begin
       If S[i-1]=' ' then begin Delete(S,i-1,1); Dec(i); end;
       If S[i+1]<>' ' then Insert(' ',S,i+1);
     end;
     If S[i] in Dau2 then S[i+2]:=Upcase(S[i+2]);
     Inc(i);
   Until i=Length(S);
   Writeln(fout,S);
 end;
 Close(finp); Close(fout);
END.