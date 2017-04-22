Program P110312;   {Hien thi menu}
Uses  Crt;
Const menu: set of char = ['1'..'5','X','S','L','N','T'];
Var   ch: char;

BEGIN
 Clrscr;
 Writeln('  1. Xem      ');
 Writeln('  2. Sua chua ');
 Writeln('  3. Loai bo  ');
 Writeln('  4. Nhap them');
 Writeln('  5. Thoat    ');
 Write('Lua chon cua ban: ');
 Repeat
   ch:=readkey; ch:=Upcase(ch);
 Until ch in menu;
 Writeln;
 Write('Ban da chon:');
 Case ch of
   '1','X': Writeln('  1. Xem      ');
   '2','S': Writeln('  2. Sua chua ');
   '3','L': Writeln('  3. Loai bo  ');
   '4','N': Writeln('  4. Nhap them');
   '5','T': Writeln('  5. Thoat    ');
 End;
 Readln;
END.
