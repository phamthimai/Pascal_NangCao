Program P110715;   {Sap xep cac ban ghi trong danh sach theo Name}
Uses  Crt;
Const inp='P11\P110710.txt';
Type  ptr=^rec;
      rec=record
            name: string[20];
            next: ptr;
          end;
Var   f: text;
      n,i,j: integer;
      p,l: ptr;
      teni,tenj: string;

Procedure Nhap;
Begin
 Assign(f,inp); Reset(f);
 New(p); l:=p; n:=0;
 While not EoF(f) do
 begin
   Readln(f,p^.name);
   New(p^.next);
   p:=p^.next;
   Inc(n);
 end;
 p^.next:=nil;
 Close(f);
End;

Procedure Doicho(i,j: integer);
Var k: integer;
Begin
 p:=l; For k:=2 to i do p:=p^.next; p^.name:=tenj;
 p:=l; For k:=2 to j do p:=p^.next; p^.name:=teni;
End;

Procedure Sapxep;
Var k: integer;
Begin
 For i:=1 to n-1 do
   For j:=i+1 to n do
   begin
     p:=l; For k:=2 to i do p:=p^.next; teni:=p^.name;
     p:=l; For k:=2 to j do p:=p^.next; tenj:=p^.name;
     If teni>tenj then Doicho(i,j);
   end;
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
 Clrscr;
 Nhap;
 Sapxep;
 In_kq;
END.