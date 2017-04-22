Program P101210; {Hoan vi dwoc cho dwoi dang tich cua cac xich doc lap}
Uses Crt;
Var  a,b: array[1..100] of integer;
     start,i,j,k,n,c,m: integer;
     t: boolean;

BEGIN
 Clrscr;
 Write('Nhap so n<100: '); Readln(n);
 For i:=1 to n do a[i]:=i;
 Write('  So lwong cac xich doc lap: '); Readln(m);
 Writeln('Nhap cac xich doc lap, moi xich hai dong:');
 For i:=1 to m do
 begin
   Write('  Do dai xich thu ',i,' : '); Readln(k);
   Write('    Nhap xich thu ',i,' : ');
   For j:=1 to k do Read(b[j]); Readln;
   For j:=1 to k-1 do a[b[j]]:=b[j+1]; a[b[k]]:=b[1];
 end;
 For i:=1 to n do write(a[i],' ');
 Readln;
END.