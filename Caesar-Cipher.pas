{$mode objfpc} // directive to be used for defining classes
program caesarCipherClass;
type
    (* 
    * @file Class realize Caesar encryption metods.
    * @class caesarCipher
    * @author Full_droper <full_droper@pm.me>
    * @version 0.0.1
    *)
    caesarCipher = class
    public
    constructor create();
    (**
     * Encode input data by Caesar Cipher.
     * @name encode
     * @param {object} rawData - raw data for encode.
     * @param {number} key - (default 1) count of shift.
     * @return {object} The encoded by Caesar Cipher data 
     *)
    function encode(rawData:string; key: cardinal): string;
    (**
     * Decode input data by Caesar Cipher.
     * @name decode
     * @param {object} rawData - raw data for decode.
     * @param {number} key - (default 1) count of shift.
     * @return {object} The decoded by Caesar Cipher data 
     *)
    function decode(rawData:string; key: cardinal): string;

end;
var
    // temp vars
    World, str1, str2: string;
    conv : caesarCipher;
constructor caesarCipher.create();
begin
    // nothing
end;
function caesarCipher.encode(rawData:string; key: cardinal): string;
var
  i : Integer;
begin
    for i := 1 to length(rawData) do
     rawData[i] := Chr(ord(rawData[i]) + key); 
    encode := rawData;
end;
function caesarCipher.decode(rawData:string; key: cardinal): string;
var
  i : Integer;
begin
    for i := 1 to length(rawData) do
     rawData[i] := Chr(ord(rawData[i]) - key); 
    decode := rawData;
end;
begin
    conv := caesarCipher.create();
    World := 'Hello World';
    str1 := conv.encode(World, 2);
    str2 := conv.decode(str1, 2);
    write (World,' -> ',str1,' -> ',str2);
end.
