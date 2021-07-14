# caesarCipher
Class realize Caesar encryption metods

![caesarCipher](https://cdn.discordapp.com/attachments/834769719823302666/864828939654135808/Caesar_cipher_left_shift_of_3.png)

The action of a Caesar cipher is to replace each plaintext letter with a different one a fixed number of places down the alphabet. The cipher illustrated here uses a left shift of three, so that (for example) each occurrence of E in the plaintext becomes B in the ciphertext. 

How to use?
```
    const Caesar_Cipher = new caesarCipher()
    // method to decode
    Caesar_Cipher.decode( "simple data" , "key")
    // method to encode
    Caesar_Cipher.encode( "simple data" , "key")
```
