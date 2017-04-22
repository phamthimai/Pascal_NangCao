Program P110613;  {chen vao tep cac ban ghi vao vi tri tuy chon}
Uses  Crt;
Const inp='Hocsinh.dat';
Type  Hocsinh=Record
                Ten : String[30];
                Tuoi: Byte;
              End;
Var   f : file of Hocsinh;
      Hs,Hs1: Hocsinh;
      k : integer;

BEGIN
  Assign(f,inp); Reset(f);
  Write('Ho va ten: '); Readln(Hs1.Ten);
  Write('Tuoi     : '); Readln(Hs1.Tuoi);
  Write('Vi tri chen: '); Readln(k);
  Seek(f,k);
  While not EoF(f) do
  begin
    Read(f,Hs);
    Seek(f,k);
    Write(f,Hs1);
    Hs1:=Hs;
    Inc(k);
  end;
  Write(f,Hs1);
  Close(f);
END.