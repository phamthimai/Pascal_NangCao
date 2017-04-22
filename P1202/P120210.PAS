Program P120210;   {Doi noi dung file}
Uses  Crt;
Const f1 = 'file1.txt';
      f2 = 'file2.txt';
      f3 = 'file3.dat';
Var   f,g,h: file;

Procedure CopyFile(fi1,fi2: string);
Var nread,nbuf: word;
    buf: array [1..1024] of byte;
    f1,f2: file;
Begin
 Assign(f,fi1); Reset(f,1);
 Assign(g,fi2); Rewrite(g,1);
 nbuf:=1024;
 Repeat
   Blockread(f,buf,nbuf,nread);
   Blockwrite(g,buf,nread);
 Until nread<>nbuf;
 Close(f); Close(g);
End;

BEGIN
 CopyFile(f1,f3);
 CopyFile(f2,f1);
 CopyFile(f3,f2);
END.