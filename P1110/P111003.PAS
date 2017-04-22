Program P111003;{tia sang}
Uses crt;
Var alpha:real;
Begin
  Write(' Nhap goc alpha ');Readln(alpha);
  Writeln(' Tia sang cham Oy tai: ', abs(1-cos(alpha)/sin(alpha)):3:3);
  Readln;
End.