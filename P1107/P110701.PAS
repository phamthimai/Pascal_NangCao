 Program P110701;
 {Khai bao bien kieu con tro Pointer}
 Type
   BytePtr  = ^Byte;
   WordPtr  = ^Word;
   IdentPtr = ^IdentRec;
   IdentRec = record
               Ident: string[15];
               RefCount: Word;
               Next: IdentPtr;
              end;