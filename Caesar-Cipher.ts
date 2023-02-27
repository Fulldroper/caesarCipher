/**
 * @file Class realize Caesar encryption metods.
 * @class caesarCipher
 * @author DemonWayne <80221813+DemonWayne@users.noreply.github.com>
 * @version 0.0.1
 */
export default class caesarCipher {
  /**
   * Encode input data by Caesar Cipher.
   * @name encode
   */
  public encode(rawData: inputDataType, key = 1): string | undefined {
    const data = this.inputProcessing(rawData);
    if (!data || !data.length) return;

    key = key > 1 ? this.keyProcessing(key) : key;

    return data.map(el => String.fromCharCode(el.charCodeAt(0) + key)).join('');
  }

  /**
   * Decode input data by Caesar Cipher.
   * @name decode
   */
  public decode(rawData: inputDataType, key = 1): string | undefined {
    const data = this.inputProcessing(rawData);
    if (!data || !data.length) return;

    key = key > 1 ? this.keyProcessing(key) : key;

    return data.map(el => String.fromCharCode(el.charCodeAt(0) - key)).join('');
  }

  /**
   * Convert input data to array.
   * @name inputProcessing
   */
  private inputProcessing(rawData: inputDataType): Array<string> | undefined {
    const input = typeof rawData === 'object' ? rawData.value : rawData;
    return typeof input === 'string' || typeof input === 'number' ? `${input}`.split('') : undefined;
  }

  /**
   * Convert input key to number.
   * @name keyProcessing
   */
  private keyProcessing(key: keyProcessingType): number {
    if (typeof key === 'object' && 'value' in key) return key.value;
    return Array.isArray(key) ? key[0] : +key;
  }
}

interface keyProcessingObject {
  value: number;
}

interface inputProcessingObject {
  value: string;
}

type inputDataType = string | number | inputProcessingObject;

type keyProcessingType = string | number | keyProcessingObject | Array<number>;
