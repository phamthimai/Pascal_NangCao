Program P120209;  {Tron 2 file}
Uses  Crt;
Const f1 = 'file1.txt';
      f2 = 'file2.txt';
      f3 = 'file3.txt';
Var   f,g,h: text;
      a,b: integer;
      Fa,Fb: boolean;

Procedure Doc(Var FN: text; Var VN: integer; Var VF: boolean);
Begin
 If not SeekEof(FN) then Read(FN,VN) Else VF:=true;
End;

Procedure Ghi(VN: integer);
Begin
 Write(h,' ',VN);
End;

Procedure Ghi2(Var FN: text; VN: integer);
Begin
 Write(h,' ',VN);
 While not SeekEof(FN) do begin Read(FN,VN); Write(h,' ',VN); end;
End;

BEGIN
 Assign(f,f1); Reset(f);
 Assign(g,f2); Reset(g);
 Assign(h,f3); Rewrite(h);
 Fa:=false; Fb:=false;
 Doc(f,a,Fa); Doc(g,b,Fb);
 While not(Fa or Fb) do
   If(a<b) then begin Ghi(a); Doc(f,a,Fa); end
   Else         begin Ghi(b); Doc(g,b,Fb); end;
 If Fa then Ghi2(g,b);
 If Fb then Ghi2(f,a);
 Close(h); Close(f); Close(g);
 Readln;
END.
