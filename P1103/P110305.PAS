Program P110305;
Uses  Crt;
Const thoat: set of char=['e','E'];
Var   ch: char;
BEGIN
	Write('Hay go E de thoat khoi chuong trinh: ');
	Repeat ch:=readkey; Until ch in thoat;
END.

