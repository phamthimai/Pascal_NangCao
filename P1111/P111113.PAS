Program P111113;  {Cap nhat File}
Uses  Crt;
Const inp1='P11\P1111\P111113.inp';
      inp2='P11\P1111\P1111131.inp';
      out='P11\P1111\P111113.out';
Type  KiemKe=record
               TenHang: string[40];
               TonKho : integer;
             end;
      HoaDon=record
               TenHang  : string[40];
               Nhap,Xuat: integer;
             end;
Var   f,h: file of KiemKe;
      g: file of HoaDon;
      kk,CapNhat: KiemKe;
      hd: HoaDon;

Procedure Nhap;
Begin
 Assign(f,inp1); Rewrite(f);
 Write('Ten hang: '); Readln(Kk.Tenhang) ;
 Write('Ton kho :') ; Readln(Kk.Tonkho);
 Write(f,kk) ;
 Assign(g,inp2); Rewrite(g);
 Write('Ten hang: '); Readln(Hd.Tenhang) ;
 Write('Nhap : '); Readln(Hd.Nhap);
 Write('Xuat : '); Readln(Hd.Xuat);
 Write(g,hd);
 Readln;
 Close(f); Close(g);
end;

Procedure ghi;
Begin
 Assign(f,inp1); Reset(f);
 Assign(g,inp2); Reset(g);
 Assign(h,out);  Rewrite(h);
 While not Eof(f) do
 begin
   Read(f,kk); Read(g,hd);
   CapNhat.TenHang:=kk.TenHang;
   CapNhat.Tonkho:=kk.TonKho+hd.Nhap-hd.Xuat;
   Write(h,CapNhat);
   Write('So luong con lai trong kho la: ',Capnhat.Tonkho)
 end;Readln;
 Close(h); Close(g); Close(f);
 end;

BEGIN
 Nhap;
 Ghi;
END.