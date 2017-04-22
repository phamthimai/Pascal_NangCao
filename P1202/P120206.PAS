Program P120206;   {Sua van ban}
Uses  Crt;
Const fi='P120206.TXT';
Var   f: text;
      s: string;
      ch: char;

BEGIN
 Assign(f,fi); Reset(f);
 s:='';
 Repeat
   Read(f,ch);
   If (ch='#')then Delete(s,length(s),1) Else s:=s+ch;
 Until Eof(f);
 Close(f);
 Assign(f,fi); Rewrite(f);
 Writeln(f,s);
 Close(f);
End.