/** 
 * @file Class realize Caesar encryption metods.
 * @class caesarCipher
 * @author Full_droper <full_droper@pm.me>
 * @version 0.0.1
*/
export class caesarCipher{
    /**
     * Convert input data to array. 
     * @name inputProcessing
     * @param rawData - raw data from input.
     * @return {object} The converted to array input data 
     */
    #inputProcessing(rawData){
        if (rawData&&rawData.length>0) {
            switch (typeof(rawData)) {
                case 'string': return rawData.split('');break;
                case 'object': return rawData;break;
                case 'number': return `${rawData}`.split('');break;
                default: return undefined;break;
            }
        } else {
            return undefined;
        }
    }
    /**
     * Convert input key to number.
     * @name keyProcessing
     * @param {number} key - raw key from input.
     * @return {number} The converted to number input key 
     */
    #keyProcessing(key){
        switch (typeof(key)) {
            case 'string': return +key;break;
            case 'object': return key.value || key[0] ;break;
            case 'number': return key;break;
            default: return undefined;break;
        }
    }
    /**
     * Encode input data by Caesar Cipher.
     * @name encode
     * @param {object} rawData - raw data for encode.
     * @param {number} key - (default 1) count of shift.
     * @return {object} The encoded by Caesar Cipher data 
     */
    encode(rawData,key = 1){
        const data = this["__#10172@#inputProcessing"](rawData);
        key = key > 1?this["__#25137@#keyProcessing"](key):key;
        if (data === undefined) {
            return undefined;
        } else {
            const res = new Array();
            data.forEach(el => {
                res.push(String.fromCharCode(el.charCodeAt()+key))
            });
            return res.join('');
        }
    }
    /**
     * Decode input data by Caesar Cipher.
     * @name decode
     * @param {object} rawData - raw data for decode.
     * @param {number} key - (default 1) count of shift.
     * @return {object} The decoded by Caesar Cipher data 
     */
    decode(rawData,key = 1){
        const data = this["__#10172@#inputProcessing"](rawData);
        key = key > 1?this["__#25137@#keyProcessing"](key):key;
        if (data === undefined) {
            return undefined;
        } else {
            const res = new Array();
            data.forEach(el => {
                res.push(String.fromCharCode(el.charCodeAt()-key))
            });
            return res.join('');
        }
    }
}