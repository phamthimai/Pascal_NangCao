Program P120310;   {Doi so Lama thanh so Arap}
Uses  Crt;
Const ch: array [1..7] of char = ('I','V','X','L','D','C','M');
      vt: array [1..3] of byte = (2,4,6);
      d : array [1..9,1..2] of shortint =
      ((1,1),(1,2),(1,3),(2,-1),(2,0),(2,1),(2,2),(2,3),(3,-1));
Var   s: string;
      n: integer;

Function lama(n: integer): string;
Var i,j: byte;
    s,ch1,ch2: string;
    k: integer;
Begin
 s:=''; i:=0;
 While N>0 do
 begin
   k:=n mod 10;
   n:=n div 10;
   If k<>0 then
   begin
     If d[k,1]<>1 then ch1:=ch[d[k,1]+i] Else ch1:='';
     ch2:='';
     For j:=1 to abs(d[k,2]) do ch2:=ch2+ch[i+1];
     If d[k,2]>0 then s:=ch1+ch2+s Else s:=ch2+ch1+s;
   end;
   Inc(i,2);
 end;
 lama:=s;
End;

BEGIN
 Clrscr;
 Write('Nhap mot so la ma: '); Readln(s);
 For n:=1 to 1000 do
   If lama(n)=s then
   begin
     Write(' Co so a rap la ',n);
     Readln;
     Exit;
   end;
END.
{  I = 1
  V = 5
  X = 10
  L = 50
  D = 100
  C = 500
  M = 1000}