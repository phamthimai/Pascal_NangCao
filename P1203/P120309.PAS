Program P120309;   {Viet so bang chu so La Ma}
Uses  Crt;
Const ch: array [1..7] of char = ('I','V','X','S','C','D','M');
      vt: array [1..3] of byte = (2,4,6);
      d : array [1..9,1..2] of shortint =
      ((1,1),(1,2),(1,3),(2,-1),(2,0),(2,1),(2,2),(2,3),(3,-1));
Var   i,j: byte;
      s,ch1,ch2: string;
      n,k: integer;

BEGIN
 ClrScr;
 s:='';
 Write(' Nhap N: '); Readln(n);
 i:=0;
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
 Write(s);
 Readln;
END.
{
  I = 1
  V = 5
  X = 10
  S = 50
  C = 100
  D = 500
  M = 1000
}