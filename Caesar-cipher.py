class caesarCipher:
    """
      Encode input data by Caesar Cipher.
      `@name` encode
      `@param` {`string`} text - raw data for encode.
      `@param` {`number`} key - (`default 1`) count of shift.
      `@return` {`string`} The encoded by Caesar Cipher data 
    """
    @staticmethod
    def encode(text, key=1):
        try:
            text
            if type(text) != str:
                throw
            text = list(text)
            if type(key) is str and key > 1:
                key = int(key)
        except NameError:
            return None
        res = []
        for el in text:
            res.append(chr(ord(el) + key))
        return "".join([str(el) for el in res])

    """
      Decode input data by Caesar Cipher.
      `@name` decode 
      `@param` {`string`} text - raw data for decode.
      `@param` {`number`} key - (`default 1`) count of shift.
      `@return` {`string`} The decoded by Caesar Cipher data
    """
    @staticmethod
    def decode(text, key=1):
        try:
            text
            if type(text) != str:
                throw
            text = list(text)
            if type(key) is str and key > 1:
                key = int(key)
        except NameError:
            return None
        res = []
        for el in text:
            res.append(chr(ord(el) - key))
        return "".join([str(el) for el in res])
