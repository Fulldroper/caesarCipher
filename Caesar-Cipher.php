<?php
/** 
 * @file Class realize Caesar encryption metods.
 * @class caesarCipher
 * @author Full_droper <full_droper@pm.me>
 * @version 0.0.1
*/
class caesarCipher {
    /**
     * Encode input data by Caesar Cipher.
     * @name encode
     * @param {string} rawData - raw data for encode.
     * @param {number\string} key - (default 1) count of shift.
     * @return {string} The encoded by Caesar Cipher data 
     */
    function encode($rawData,$key = 1) {
        if (
            empty($rawData) ||
            gettype($rawData) != "string" ||
            (gettype($key) != "integer" &&
            gettype($key) != "string") 
            ) return null;
        if (gettype($key) == "string") $key = intval($key,10);
        if ($key < 1 ) $key = 1;
        $data = str_split($rawData);
        foreach ($data as &$value) {
            $value = chr(ord($value) + $key);
        }
        return implode("",$data);
    }
    /**
     * Decode input data by Caesar Cipher.
     * @name decode
     * @param {string} rawData - raw data for decode.
     * @param {number\string} key - (default 1) count of shift.
     * @return {string} The decoded by Caesar Cipher data 
     */
    function decode($rawData,$key = 1) {
        if (
            empty($rawData) ||
            gettype($rawData) != "string" ||
            (gettype($key) != "integer" &&
            gettype($key) != "string") 
            ) return null;
        if (gettype($key) == "string") $key = intval($key,10);
        if ($key < 1 ) $key = 1;
        $data = str_split($rawData);
        foreach ($data as &$value) {
            $value = chr(ord($value) - $key);
        }
        return implode("",$data);
    }
}
// $conv = new caesarCipher();
// $str1 = $conv->encode("Hello world", 2);
// $str2 = $conv->decode($str1,2);
// echo "Hello world -> ".$str1." -> ".$str2;
?>