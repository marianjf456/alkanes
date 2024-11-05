import { 
@final
@unmanaged
export class IndexPointer {
  [key: number]: number;
  constructor(keyPrefix: ArrayBuffer) {
    return IndexPointer.wrap(keyPrefix);
  }
  static wrap(pointer: ArrayBuffer): IndexPointer {
    return changetype<IndexPointer>(pointer);
  }
  static for(keyword: string): IndexPointer {
    return IndexPointer.wrap(String.UTF8.encode(keyword));
  }
  unwrap(): ArrayBuffer {
    return changetype<ArrayBuffer>(this);
  }
  select(key: ArrayBuffer): IndexPointer {
    const res = Box.concat([Box.from(this.unwrap()), Box.from(key)]);
    return IndexPointer.wrap(res);
  }
  selectValue<T>(key: T): IndexPointer {
    const keyBytes = new ArrayBuffer(sizeof<T>());
    store<T>(changetype<usize>(keyBytes), bswap<T>(key));
    return this.select(keyBytes);
  }
  keyword(key: string): IndexPointer {
    return this.select(String.UTF8.encode(key));
  }
  getValue<T>(): T {
    const value = this.get();
    if (value.byteLength === 0) return <T>0;
    const container = new ArrayBuffer(sizeof<T>());
    memcpy(
      changetype<usize>(container),
      changetype<usize>(value),
      value.byteLength,
    );
    return load<T>(changetype<usize>(container));
  }
  getImmutableValue<T>(): T {
    const value = this.getImmutable();
    if (value.byteLength === 0) return <T>0;
    const container = new ArrayBuffer(sizeof<T>());
    memcpy(
      changetype<usize>(container),
      changetype<usize>(value),
      value.byteLength,
    );
    return load<T>(changetype<usize>(container));
  }
  setValue<T>(v: T): void {
    const value = new ArrayBuffer(sizeof<T>());
    store<T>(changetype<usize>(value), v);
    this.set(value);
  }
  set(v: ArrayBuffer): void {
    set(this.unwrap(), v);
  }
  get(): ArrayBuffer {
    return Box.from(get(this.unwrap())).toArrayBuffer();
  }
  getImmutable(): ArrayBuffer {
    return getImmutable(this.unwrap());
  }
  lengthKey(): IndexPointer {
    return this.keyword("/length");
  }
  length(): u32 {
    return this.lengthKey().getValue<u32>();
  }
  getList(): Array<ArrayBuffer> {
    const result = new Array<ArrayBuffer>(<i32>this.length());
    for (let i: i32 = 0; i < result.length; i++) {
      result[i] = this.selectIndex(i).get();
    }
    return result;
  }
  getListValues<T>(): Array<T> {
    const result = new Array<T>(<i32>this.length());
    for (let i: i32 = 0; i < result.length; i++) {
      result[i] = this.selectIndex(i).getValue<T>();
    }
    return result;
  }
  extend(): IndexPointer {
    const lengthKey = this.lengthKey();
    const length = lengthKey.getValue<u32>();
    lengthKey.setValue<u32>(length + 1);
    return this.selectIndex(length);
  }
  selectIndex(index: u32): IndexPointer {
    return this.keyword("/" + index.toString(10));
  }
  nullify(): void {
    this.set(new ArrayBuffer(0));
  }
  pop(): ArrayBuffer {
    const lengthKey = this.lengthKey();
    const length = lengthKey.getValue<u32>();
    if (length === 0) return new ArrayBuffer(0);
    const newLength = length - 1;
    lengthKey.setValue<u32>(newLength);
    return this.selectIndex(newLength).get();
  }
  popValue<T>(): ArrayBuffer {
    const lengthKey = this.lengthKey();
    const length = lengthKey.getValue<u32>();
    if (length === 0) return new ArrayBuffer(0);
    const newLength = length - 1;
    lengthKey.setValue<u32>(newLength);
    return this.selectIndex(newLength).getValue<T>();
  }
  append(v: ArrayBuffer): void {
    this.extend().set(v);
  }
  appendValue<T>(v: T): void {
    this.extend().setValue<T>(v);
  }
}
