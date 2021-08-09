package main

import "fmt"
/** 
 * @file Class realize Caesar encryption metods.
 * @author Full_droper <full_droper@pm.me>
 * @version 0.0.1
*/
func main()  {
	const text string = "Hello World"
	const key int = 32
	
	var str1 string = encode(text, key)
	var str2 string = decode(str1, key)

	fmt.Println(text, " -> ", str1, " -> ", str2)
}
/**
* Encode input data by Caesar Cipher.
* @name encode
* @param {string} rawData - raw data for encode.
* @param {number} key - (default 1) count of shift.
* @return {string} The encoded by Caesar Cipher data 
*/
func encode(str string, key int) (string) {
	if key < 1 {
		key = 1
	}
	var str_tmp string = ""
	for pos, char := range str {
		_ = pos
		str_tmp += string(int(char) + key)
	}
	return str_tmp
}
/**
* Decode input data by Caesar Cipher.
* @name encode
* @param {string} rawData - raw data for encode.
* @param {number} key - (default 1) count of shift.
* @return {string} The decoded by Caesar Cipher data 
*/
func decode(str string, key int) (string) {
	if key < 1 {
		key = 1
	}
	var str_tmp string = ""
	for pos, char := range str {
		_ = pos
		str_tmp += string(int(char) - key)
	}
	return str_tmp
}