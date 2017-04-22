Program P120111;  {Tinh chu vi va duong kinh cua mot da giac}
Uses  Crt;
Const fi='POLYGON.DAT';
Var   f: text;
      n,i,j: integer;
      point: array[1..1000,1..2] of real;
      cv,bk: real;

Function distance(i,j: integer): real;
Begin
 distance:=sqrt(sqr(point[i,1]-point[j,1])+sqr(point[i,2]-point[j,2]));
End;

BEGIN
 Clrscr;
 Assign(f,fi); Reset(f);
 Readln(f,n);
 For i:=1 to n do readln(f,point[i,1],point[i,2]);
 Close(f);
 cv:=distance(n,1);
 For i:=1 to n-1 do cv:=cv+distance(i,i+1);
 Writeln(' Chu vi   = ',cv:10:2);
 bk:=0;
 For i:=1 to n-1 do
   For j:=i+1 to n do
     If distance(i,j)>bk then bk:=distance(i,j);
 Writeln(' Ban kinh = ',bk:10:2);
 Readln;
END.