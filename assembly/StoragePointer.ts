import { Box } from "metashrew-as/assembly/utils/box";
import { env } from "./env";

@final
@unmanaged
export class StoragePointer {
  [key: number]: number;
  constructor(keyPrefix: ArrayBuffer) {
    return StoragePointer.wrap(keyPrefix);
  }
  static wrap(pointer: ArrayBuffer): StoragePointer {
    return changetype<StoragePointer>(pointer);
  }
  static for(keyword: string): StoragePointer {
    return StoragePointer.wrap(String.UTF8.encode(keyword));
  }
  unwrap(): ArrayBuffer {
    return changetype<ArrayBuffer>(this);
  }
  select(key: ArrayBuffer): StoragePointer {
    const res = Box.concat([Box.from(this.unwrap()), Box.from(key)]);
    return StoragePointer.wrap(res);
  }
  selectValue<T>(key: T): StoragePointer {
    const keyBytes = new ArrayBuffer(sizeof<T>());
    store<T>(changetype<usize>(keyBytes), bswap<T>(key));
    return this.select(keyBytes);
  }
  keyword(key: string): StoragePointer {
    return this.select(String.UTF8.encode(key));
  }
  getValue<T>(): T {
    const value = this.get();
    if (value.byteLength === 0) return <T>0;
    const container = new ArrayBuffer(sizeof<T>());
    memory.copy(
      changetype<usize>(container),
      changetype<usize>(value),
      <usize>value.byteLength,
    );
    return load<T>(changetype<usize>(container));
  }
  setValue<T>(v: T): void {
    const value = new ArrayBuffer(sizeof<T>());
    store<T>(changetype<usize>(value), v);
    this.set(value);
  }
  set(v: ArrayBuffer): void {
    env.storage.store(this.unwrap(), Box.from(v).toArrayBuffer());
  }
  get(): ArrayBuffer {
    return Box.from(env.storage.load(this.unwrap())).toArrayBuffer();
  }
  lengthKey(): StoragePointer {
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
  extend(): StoragePointer {
    const lengthKey = this.lengthKey();
    const length = lengthKey.getValue<u32>();
    lengthKey.setValue<u32>(length + 1);
    return this.selectIndex(length);
  }
  selectIndex(index: u32): StoragePointer {
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
