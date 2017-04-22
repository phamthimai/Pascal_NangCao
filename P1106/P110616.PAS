Program P110616;    {Su dung file chi muc}
Uses  Crt;
Const inp='Hocsinh.dat';
      idx='Hocsinh.idx';
Type  Hocsinh=Record
                Ten : String[30];
                Tuoi: Byte;
              End;
Var   k : integer;
      f1: file of integer;
      f : file of Hocsinh;
      Hs: hocsinh;

BEGIN
 Assign(f,inp);  Reset(f);
 Assign(f1,idx); Reset(f1);
 While not EoF(f1) do
 begin
   Read(f1,k);
   Seek(f,k); Read(f,Hs);
   With Hs do Writeln(ten:25,tuoi:4);
 end;
 Close(f1); Close(f);
 Readln;
END.