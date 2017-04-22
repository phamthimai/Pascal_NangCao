Program P110712;   {Loai lan luot cac ban}
Uses  Crt;
Const inp='P11\p110710.TXT';
      out='P11\OUT.TXT';
Type  ptr=^rec;
      rec=record
            name: string[20];
            next: ptr;
          end;
Var   n,k: integer;
      p,l: ptr;

Procedure Nhap;
Var f: text;
Begin
 Assign(f,inp); Reset(f);
 New(p); l:=p;
 Readln(f,p^.name);
 While not EoF(f) do
 begin
   New(p^.next);
   p:=p^.next;
   Readln(f,p^.name);
 end;
 p^.next:=l;
 Close(f);
 Write('Nhap so k>1: '); Readln(k);
End;

Procedure Xuli;
Var f: text; i: integer; q: Ptr;
Begin
 Assign(f,out); Rewrite(f);
 n:=0;
 Repeat
   p:=l;
   For i:=2 to k do p:=p^.next;          {Tim vi tri cuoi}
   q:=p^.next;
   Inc(n); Writeln(f,p^.name:20,n:4);
   p:=l; For i:=3 to k do p:=p^.next;     {Tim vi tri dau}
   p^.next:=q;
   l:=q;
 Until p^.next=p;
 Inc(n); Writeln(f,p^.name:20,n:4);
 Close(f);
End;

BEGIN
 Nhap;
 Xuli;
END.