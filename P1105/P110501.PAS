Type hocsinh=record
               hoten: string[26];
               tuoi: byte;
             end;
		 giaovien=array[1..10] of string[26];
     lop=record
           ten: string[4];
           gv: giaovien;
           hs: hocsinh;
         end;
Var class: lop;
