Program Doc_Ghi_Record;
Uses Crt;
Var  a: record
          hoten: string[26];
          tuoi: byte;
        end;
Begin
 Write('Nhap hoten:'); Readln(a.hoten);
 Write('Nhap tuoi :'); Readln(a.tuoi);
 Writeln('Ghi tu a ra:'); Write(a.hoten,' ',a.tuoi);
 Readln;
End.

