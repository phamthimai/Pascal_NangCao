Program P120212;     {Danh so thu tu cho danh sach}
Uses  Crt;
Const fi = 'hoten.txt';
      fo = 'hoten1.txt';
Var   inp,out: text;
      S: string;
      i: integer;

BEGIN
 Assign(inp,fi); Reset(inp);
 Assign(out,fo); Rewrite(out);
 i:=0;
 Repeat
   Readln(inp,S);
   Inc(i);
   Writeln(out,i:3,'. ',S);
 Until Eof(inp);
 Close(inp); Close(out);
END.