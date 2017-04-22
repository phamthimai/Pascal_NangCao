Program P120511;   {Khao sat va ve do thi cua mot ham da thuc bac 4}
Uses Crt,Graph;
Type Dathuc = Record
                Deg : Byte;
                Koef: Array [0..100] of Real;
              End;
Var  X0,Y0,WX,WY,TX,TY: Integer;
     Dt: Dathuc;
     N: Byte;
     SX,FX,DX: Real;

Procedure MhDohoa;
Var ErrorCode,GraphDriver, GraphMode: Integer; Path: String;
Begin
 Clrscr;
 Path:='D:\BORLAND\TP\BGI';
 Repeat
   GraphDriver:=Detect;
   InitGraph(GraphDriver,GraphMode,Path);
   ErrorCode:=GraphResult;
   If ErrorCode<>grOk then
   begin
     Writeln('Loi do hoa:',GraphErrorMsg(ErrorCode));
     If Errorcode=GrFilenotFound then
     begin
       Write('Go duong dan toi cac file BGI:');
       Readln(Path);
     end
     Else
     begin
       Readln;
       Halt(1);
     end;
   end;
 Until ErrorCode=GrOK;
 SetColor(White);
 X0:=GetMaxX Div 2; Y0:=GetMaxY Div 2;
 Moveto(X0,0); LineTo(X0,GetMaxY);
 Moveto(0,Y0); LineTo(GetMaxX,Y0);
End;

Procedure Docdulieu;
Begin
 Write('Cho he so phong dai: '); Readln(N);
 Write('Cho diem bat dau ve: '); Readln(SX);
 Write('Cho diem ket thuc: ');   Readln(FX);
 Write('Cho gia so X: ');        Readln(DX);
End;

Procedure Chuanbi(X,Y: Real);
Begin
 Y:=-Y; X:=X*N; Y:=Y*N;
 X:=X+X0; Y:=Y+Y0;
 Tx:=Round(X); Ty:=Round(Y);
End;

Procedure Diden(X,Y: Real);
Begin
 Chuanbi(X,Y);
 Moveto(Tx,Ty);
End;

Procedure Veden(X,Y: Real);
Begin
 Chuanbi(X,Y);
 LineTo(Tx,Ty);
End;

Procedure Chiatruc;
Var i: integer;
Begin
 For i:=-(Y0 Div N) to (Y0 Div N) do
 begin
   MoveTo(X0-3,Y0+(i-1)*N);
   LineTo(X0+3,Y0+(i-1)*N);
 end;
 For i:=-(X0 Div N) to (X0 Div N) do
 begin
   MoveTo(X0+(i-1)*N,Y0-3);
   LineTo(X0+(i-1)*N,Y0+3);
 end;
End;

Procedure Nhapdathuc(Var Dt: Dathuc);
Var i: Byte;
Begin
 FillChar(Dt,SizeOf(Dt),0);
 Dt.Deg:=4;
 With Dt do
 begin
   For i:=2 downto 0 do
   begin
     Write('Cho he so A[',i*2,'] cua da thuc: ');
     Readln(Koef[i*2]);
   end;
 end;
End;

Procedure Daoham(Dt1: Dathuc; Var Dt2: Dathuc);
Var i: Byte;
Begin
 Dt2.Deg:=Dt1.Deg-1;
 For i:=Dt1.Deg downto 1 do Dt2.Koef[i-1]:=Dt1.Koef[i]*i;
End;

Procedure Vietdathuc(Dt: Dathuc);
Var i: Byte;
Begin
 With Dt do
 begin
   Writeln('Bac cua da thuc la: ',Deg);
   For i:=Deg downto 0 do
     Writeln('He so A[',i,'] cua da thuc la: ',Koef[i]);
 end;
End;

Procedure Ptb2(A,B,C: Real; Var Delta,X1,X2: Real);
Begin
 Delta:=Sqr(B)-4*A*C;
 If Delta<0 then Exit;
 X1:=(-B+Sqrt(Delta))/(2*A);
 X2:=(-B-Sqrt(Delta))/(2*A);
End;

Function Tinhdathuc(Dt: Dathuc; X: Real): Real;
Var i: Byte; Y: Real;
Begin
 With Dt do
 begin
   Y:=Koef[Deg];
   For i:=Deg-1 downto 0 do Y:=X*Y+Koef[i];
 End;
 Tinhdathuc:=Y;
End;

Procedure Trinhbay;
Var X1,X2,Delta: Real; Dt1: Dathuc;
Begin
 Daoham(Dt,Dt1);
 Writeln('Dao ham cua da thuc la: ');
 Vietdathuc(Dt1);
 Ptb2(Dt.Koef[4],Dt.Koef[2],Dt.Koef[0],Delta,X1,X2);
 If Delta >=0 then
 begin
   Writeln('Ham so co cac nghiem la: ');
   If X1>=0 then
     Write(Sqrt(X1),',',-Sqrt(X1));
     If X2>=0 then
        Writeln(Sqrt(X2),',',-Sqrt(X2));
 end;
 PtB2(Dt1.Koef[3],Dt1.Koef[2],Dt1.Koef[1],Delta,X1,X2);
 Writeln('Do thi co cac cuc tri tai:');
 Writeln(0,',',Tinhdathuc(Dt,0));
 If Delta>0 then
 begin
   Writeln(X1,',',Tinhdathuc(Dt,X1));
   Writeln(X2,',',Tinhdathuc(Dt,X2));
 end;
 Write('Nhan Enter de tiep tuc..');
 Readln;
End;

Procedure Ve;
Begin
 Diden(SX,Tinhdathuc(Dt,SX));
 While SX<FX Do
 begin
   SX:=SX+DX;
   Veden(SX,Tinhdathuc(Dt,SX));
 end;
End;

BEGIN
 Clrscr;
 Nhapdathuc(Dt);
 Trinhbay;
 Docdulieu;
 Mhdohoa;
 Chiatruc;
 Ve;
 Readln;
 CloseGraph;
END.