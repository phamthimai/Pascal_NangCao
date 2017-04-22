Program P120205;   {kiem tra file doi xung}
Uses  Crt;
Const fi='P120205.TXT';
Var   f: file of char;
      c1,c2: char;
      size,d1,d2: word;

BEGIN
 Assign(f,fi); Reset(f);
 d2:=FileSize(f)-1; d1:=0;
 While (abs(d1-d2)>1) do
 begin
   Seek(f,d1); Read(f,c1);
   Seek(f,d2); Read(f,c2);
   Inc(d1); Dec(d2);
   If c1<>c2 then
   begin
     Write(' Day khong phai file doi xung');
     Close(f);
     Readln;
     Exit;
   end;
 end;
 Write(' Day la file doi xung');
 Readln;
 Close(f)
END.