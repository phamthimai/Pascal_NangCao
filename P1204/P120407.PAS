Program Show_Mouse;
{Hien thi chuot tren man hinh o che do do hoa}
Uses    Dos,Graph;
var     reg: registers;
        Gd,Gm: Integer;

Procedure InitMouse;
Begin
 reg.ax:=$0000;
 intr($33,reg);
End;

Procedure ShowMouse;
Begin
 reg.ax:=$0001;
 intr($33,reg);
End;

BEGIN
 Gd:=Detect;
 InitGraph(Gd,Gm,'c:\turbo\graph');
 InitMouse;
 ShowMouse;
 Readln;
 CloseGraph;
END.