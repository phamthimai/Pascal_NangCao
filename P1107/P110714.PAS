Program P110714;   {Doi cho 2 ban ghi trong danh sach}
Uses  Crt;
Const inp='P11\P110710.txt';
Type  ptr=^rec;
      rec=record
            name: string[20];
            next: ptr;
          end;
Var   f: text;
      j,k: integer;
      p,l: ptr;
      tenj,tenk: string;

Procedure Nhap;
Begin
 Assign(f,inp); Reset(f);
 New(p); l:=p;
 While not EoF(f) do
 begin
   Readln(f,p^.name);
   New(p^.next);
   p:=p^.next;
 end;
 p^.next:=nil;
 Close(f);
 Clrscr;
 Write('Nhap vi tri 2 ban ghi can doi cho: '); Readln(j,k);
End;

Procedure Doicho;
Var i: integer;
Begin
 p:=l; For i:=2 to k do p:=p^.next; tenk:=p^.name;
 p:=l; For i:=2 to j do p:=p^.next; tenj:=p^.name;
 p:=l; For i:=2 to k do p:=p^.next; p^.name:=tenj;
 p:=l; For i:=2 to j do p:=p^.next; p^.name:=tenk;
End;

Procedure In_kq;
Begin
 While (l^.next<>nil) do
 begin
   Writeln(l^.name);
   l:=l^.next;
 end;
 Readln;
End;

BEGIN
 Nhap;
 Doicho;
 In_kq;
END.