/** 
 * @file Class realize Caesar encryption metods.
 * @class caesarCipher
 * @author Full_droper <full_droper@pm.me>
 * @version 0.0.1
*/
public class CaesarCipher {
    public static void main(String[] args) {
      // String en = encode("Hello World",2);
      // String de = decode(en,2);
      // System.out.println("Hello World -> "+ en + " -> " + de);
    }
  /**
   * Encode input data by Caesar Cipher.
   * @name encode
   * @param {string} rawData - raw data for encode.
   * @param {number} key - (default 1) count of shift.
   * @return {string} The encoded by Caesar Cipher data 
   */
  public String encode(String rawData,int key) {
    char[] data = new char[rawData.length()];
    for (int i = 0; i < rawData.length(); i++) {
      data[i] = rawData.charAt(i);
    }
    if(key < 1) key = 1;
    for (int i = 0 ; i < data.length; i++) {
      data[i] = (char) (( (int) data[i] ) + key);
    }
    return String.valueOf(data);
  }
  /**
   * Decode input data by Caesar Cipher.
   * @name decode
   * @param {string} rawData - raw data for decode.
   * @param {number} key - (default 1) count of shift.
   * @return {string} The decoded by Caesar Cipher data 
   */
  public String decode(String rawData,int key) {
    char[] data = new char[rawData.length()];
    for (int i = 0; i < rawData.length(); i++) {
      data[i] = rawData.charAt(i);
    }
    if(key < 1) key = 1;
    for (int i = 0 ; i < data.length; i++) {
      data[i] = (char) (( (int) data[i] ) - key);
    }
    return String.valueOf(data);
  }
}
  