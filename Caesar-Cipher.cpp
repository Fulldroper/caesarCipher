#include <iostream>
#include <stdio.h>
#include <string.h>
using namespace std;
/** 
 * @file Class realize Caesar encryption metods.
 * @class caesarCipher
 * @author Full_droper <full_droper@pm.me>
 * @version 0.0.1
*/
class CaesarCipher {
    public:
        /**
        * Encode input data by Caesar Cipher.
        * @name encode
        * @param {string} rawData - raw data for encode.
        * @param {number} key - (default 1) count of shift.
        * @return {string} The encoded by Caesar Cipher data 
        */
        string encode(string rawData,int key){
            char data[rawData.length() + 1];
            strcpy(data, rawData.c_str());
            if(key < 1) key = 1;
            std:string result = "";
            for (int i = 0 ; i < ( sizeof(data) / sizeof(data[0]) - 1); i++) {
                result += (char) (( (int) data[i] ) + key);
            }
            return result;
        }
        /**
        * Decode input data by Caesar Cipher.
        * @name encode
        * @param {string} rawData - raw data for encode.
        * @param {number} key - (default 1) count of shift.
        * @return {string} The decoded by Caesar Cipher data 
        */
        string decode(string rawData,int key){
            char data[rawData.length() + 1];
            strcpy(data, rawData.c_str());
            if(key < 1) key = 1;
            std:string result = "";
            for (int i = 0 ; i < ( sizeof(data) / sizeof(data[0]) - 1 ); i++) {
                result += (char) (( (int) data[i] ) - key);
            }
            return result;
        }
};

// int main()
// {
//     CaesarCipher cc;
//     string en = cc.encode("Hello World", 2);
//     string de = cc.decode(en, 2);
//     cout<<"Hello World -> "<<en<<" -> "<<de<<endl;

//     return 0;
// }
