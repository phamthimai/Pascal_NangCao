Program P100111;  {Tinh tong 1/3+1/(3*3)+...}
Uses Crt;
Var  sohang,tong: real;
BEGIN
 Clrscr;
 sohang:=1;
 tong:=0;
 Repeat
   sohang:=sohang/3;
   tong:=tong+sohang;
 Until sohang<0.000001;
 Writeln('Tong cua bieu thuc la: ', tong:2:9);
 Readln;
END.