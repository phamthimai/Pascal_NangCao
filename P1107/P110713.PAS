Program P110713;   {Chen them ban ghi vao danh sach}
Uses  Crt;
Const inp='P11\P110710.txt';
Type  ptr=^rec;
      rec=record
            name: string[20];
            next: ptr;
          end;
Var   f: text;
      k: integer;
      p,s,l: ptr;

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

 New(s);
 Clrscr;
 Writeln('Nhap ban ghi can chen: ');
 Write('Ten: '); Readln(s^.name);
 Write('Vi tri can chen: '); Readln(k);
End;

Procedure Chen_rec;
Var i: integer;
  Procedure Cat(Var L: ptr);
  Begin s^.next:=l; l:=s; end;
Begin
 p:=l; For i:=3 to k do p:=p^.next;     {Tim vi tri}
 If k>1 then Cat(p^.next) Else Cat(l);  {Cat -  Noi}
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
 Chen_rec;
 In_kq;
END.