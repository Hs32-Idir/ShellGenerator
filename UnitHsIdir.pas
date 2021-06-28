
{ http://www.Hs32-Idir.tk }



unit unithsidir;

interface

uses windows;

function CopyEx(const str:string; pOne,pTwo:integer):string;
function ExtractFilePath(const FullPath:string):string;
function ExtractFileName(const FullPath:string):string;
function ExtractRoot(const fullpath:string):string;
function IntToStr(iNt:integer):string;
function StrToInt(sTr:string):integer;
function TrimAll(str:string):string;
//function Trim(str:string):string;
function TrimLeft(str:string):string;
function TrimRight(str:string):string;
function TrimEx(str:string):string;
function ReadFileToSTr(lpfile:string):string;
function WriteFromStr(lpFile:string; mainstr:string):boolean;
function ReplaceChr(pMainStr,sChr,dChr:string):string;
function IntToHex(Value: Integer; Digits: Integer): string;
function ExtractFileExt(const fullpath:string):string;
procedure DeleteEx(var Str:String; pOne,pTwo:Integer);

implementation


procedure DeleteEx(var Str:String; pOne,pTwo:Integer);
var
 I:Integer;
 tStr,pStr,eStr:String;
begin
  if Length(Str) <= 0 then Exit;
  if pOne = 0 then Exit;
  eSTr := Str;
  for I := 1 To Length(eStr) do
  begin
   if I <> pOne then
    tStr := tStr + eStr[I]
   else if I = pOne then Break;
  end;
 for I := pTwo + 1 To Length(eStr) do pStr := pSTr + eStr[I];
  Str := tStr + pStr;
end;

function CopyEx(const str:string; pOne,pTwo:integer):string;
var
 i:integer;
 exStr:string;
 cbegin:boolean;
 label pBreak;
begin
  cbegin := false;
 for i := 1 to length(str)  do
  begin
   if pone = 0 then cbegin := true;
   if i = pOne then cbegin := true;
   if cbegin = true then exStr := exStr + str[i];
   if i = pTwo then goto pBreak;
  end;
  pBreak :
  Result := exStr;
end;

function ExtractFilePath(const FullPath:string):string;
var
 i:integer;
 exstr,fstr:string;
label pBreak;
begin
 for i := length(fullpath)  downto 1 do
  begin
    exstr := copyex(fullpath , i , length(fullpath));
   if (pos('\',exstr)>0) or (pos('/',exstr)>0) then
    begin
      fstr := copyex(fullpath , 0 , i);
      goto pBreak;
    end;
  end;
  pBreak :
  Result := fstr;
end;

function ExtractFileName(const FullPath:string):string;
var
 i:integer;
 exstr,fstr:string;
 label pBreak;
begin
 for i := length(fullpath) downto 1 do
  begin
    exstr := copyex(fullpath , i , length(fullpath));
   if (pos('\',exstr)>0) or (pos('/',exstr)>0) then
    begin
      fstr := copyex(exstr,2,maxint);
      goto pBreak;
    end;
  end;
 pBreak :
 Result := fstr;
end;

function ExtractRoot(const fullpath:string):string;
var
 i:integer;
 label pBreak;
begin
 for i := 0 to length(fullpath) do
  begin
   if (fullpath[i] = '\') or (fullpath[i] = '/') then
   goto pBreak;
  end;
 pBreak :
 Result := copyex(fullpath , 0 , i);
end;

function ExtractFileExt(const fullpath:string):string;
var
 i :integer;
 tmpstr,exstr:string;
 label pBreak,SetResult;
begin
 for i := length(fullpath) downto 1 do
  begin
    if fullpath[i] <> '.' then
    tmpstr := tmpstr + fullpath[i]
    else goto pBreak;
  end;
 pBreak :
  for i := length(tmpstr) downto 1 do
   begin
     exstr := exstr + tmpstr[i];
     if i = 1 then goto SetResult;
   end;
  SetResult :
  result := '.' + exstr;
end;

function IntToStr(iNt:integer):string;
begin
  Str(int, result);
end;

function StrToInt(sTr:string):integer;
begin
  val(sTr, result , result);
end;

function StrToInt64(str:string):int64;
var
 code:integer;
begin
  val(str, result ,code);
end;

function TrimAll(str:string):string;
var
 i:integer;
 fstr:string;
begin
 for i := 1 to length(str) do
  begin
   if (str[i] <> #13) and
      (str[i] <> #13#10) and
      (str[i] <> #10) and
      (str[i] <> Chr(0)) and
      (str[i] <> ' ') then
    fstr := fstr + str[i];
  end;
  result := fstr;
end;

function Trim(str:string):string;
var
 i,b,c:integer;
 label GetC,SetF;
begin
  b := 0;
  c := 0;
 for i := 1 to length(str) do
  begin
   if (str[i] <> #13) and
      (str[i] <> #13#10) and
      (str[i] <> #10) and
      (str[i] <> Chr(0)) and
      (str[i] <> ' ') then
    begin
      b := i;
      goto GetC;
    end;
  end;
 GetC :
 for i := length(str) downto 1 do
  begin
   if (str[i] <> #13) and
      (str[i] <> #13#10) and
      (str[i] <> #10) and
      (str[i] <> Chr(0)) and
      (str[i] <> ' ') then
    begin
      c := i;
      goto SetF;
    end;
  end;
  SetF :
  Result := CopyEx(str , b , c);
end;

function TrimLeft(str:string):string;
var
 i,b:integer;
 label GetB;
begin
  b := 0;
 for i := 1 to length(str) do
  begin
   if (str[i] <> #13) and
      (str[i] <> #13#10) and
      (str[i] <> #10) and
      (str[i] <> Chr(0)) and
      (str[i] <> ' ') then
    begin
      b := i;
      goto GetB;
    end;
  end;
 GetB :
 Result := CopyEx(str , b , length(str));
end;

function TrimRight(str:string):string;
var
 i,C:integer;
 label GetC,SetF;
begin
  c := 0;
 for i := length(str) downto 1 do
  begin
   if (str[i] <> #13) and
      (str[i] <> #13#10) and
      (str[i] <> #10) and
      (str[i] <> Chr(0)) and
      (str[i] <> ' ') then
    begin
      c := i;
      goto GetC;
    end;
  end;
 GetC :
 Result := CopyEx(str , 0 , C);
end;

function TrimEx(str:string):string;
begin
  result := trimleft(trimright(str));
end;

function ReplaceChr(pMainStr,sChr,dChr:string):string;
var
 i:integer;
 fstr,tstr:string;
begin
 for i := 1 to length(pMainStr) do
  begin
    if (pMainStr[i] <> sChr) then
    tstr := pMainStr[i] else
    tstr := dChr;
    fstr := fstr + tstr;
  end;
  result := fstr;
end;

function ReadFileToSTr(lpfile:string):string;
var
 h:thandle;
 rByte:dword;
begin
  result := '';
  h := createfile(pchar(lpFile),generic_read,file_share_read , nil , open_existing , file_attribute_normal , 0);
  if h <> invalid_handle_value then
   begin
     setlength(result  , getfilesize(h , nil));
     readfile(h , result[1], getfilesize(h , nil) , rbyte , nil);
     closehandle(h);
   end;
end;

function WriteFromStr(lpFile:string; mainstr:string):boolean;
var
 h:thandle;
 wByte:dword;
begin
  result := false;
  h := createfile(pchar(lpfile), generic_write, file_share_write , nil , create_new, file_attribute_normal , 0);
  if h <> invalid_handle_value then
   begin
     writefile(h , mainstr[1] , length(mainstr) , wbyte , nil);
     result := closehandle(h);
   end;
end;

procedure CvtInt;
asm
        OR      CL,CL
        JNZ     @CvtLoop
@C1:    OR      EAX,EAX
        JNS     @C2
        NEG     EAX
        CALL    @C2
        MOV     AL,'-'
        INC     ECX
        DEC     ESI
        MOV     [ESI],AL
        RET
@C2:    MOV     ECX,10

@CvtLoop:
        PUSH    EDX
        PUSH    ESI
@D1:    XOR     EDX,EDX
        DIV     ECX
        DEC     ESI
        ADD     DL,'0'
        CMP     DL,'0'+10
        JB      @D2
        ADD     DL,('A'-'0')-10
@D2:    MOV     [ESI],DL
        OR      EAX,EAX
        JNE     @D1
        POP     ECX
        POP     EDX
        SUB     ECX,ESI
        SUB     EDX,ECX
        JBE     @D5
        ADD     ECX,EDX
        MOV     AL,'0'
        SUB     ESI,EDX
        JMP     @z
@zloop: MOV     [ESI+EDX],AL
@z:     DEC     EDX
        JNZ     @zloop
        MOV     [ESI],AL
@D5:
end;


function IntToHex(Value: Integer; Digits: Integer): string;
asm
        CMP     EDX, 32
        JBE     @A1
        XOR     EDX, EDX
@A1:    PUSH    ESI
        MOV     ESI, ESP
        SUB     ESP, 32
        PUSH    ECX
        MOV     ECX, 16
        CALL    CvtInt
        MOV     EDX, ESI
        POP     EAX
        CALL    System.@LStrFromPCharLen
        ADD     ESP, 32
        POP     ESI
end;

end.
