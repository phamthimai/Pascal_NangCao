Program P110610;  {Doc va ghi vao cuoi tep cac ban ghi}
Uses  Crt;
Const inp='Hocsinh.dat';
Type  Hocsinh=Record
                Ten : String[30];
                Tuoi: Byte;
              End;
Var   F : file of Hocsinh;
      Hs: Hocsinh;

BEGIN
  Assign(f,inp); Reset(f);
  Write('Ho va ten: '); Readln(Hs.Ten);
  Write('Tuoi     : '); Readln(Hs.Tuoi);
  Seek(f,Filesize(F));
  Write(f,Hs);
  Close(f);
END.