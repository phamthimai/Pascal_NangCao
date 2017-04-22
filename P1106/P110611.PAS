Program P110611;  {ghi de vao tep cac ban ghi vao vi tri tuy chon}
Uses  Crt;
Const inp='Hocsinh.dat';
Type  Hocsinh=Record
                Ten : String[30];
                Tuoi: Byte;
              End;
Var   f : file of Hocsinh;
      Hs: Hocsinh;
      k : integer;

BEGIN
  Assign(f,inp); Reset(f);
  Write('Ho va ten: '); Readln(Hs.Ten);
  Write('Tuoi     : '); Readln(Hs.Tuoi);
  Write('Vi tri de: '); Readln(k);
  Seek(f,k); Write(f,Hs);
  Close(f);
END.