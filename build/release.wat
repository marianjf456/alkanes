(module
 (type $0 (func (param i32)))
 (type $1 (func (param i32) (result i32)))
 (type $2 (func))
 (type $3 (func (param i32 i32 i32 i32)))
 (type $4 (func (param i32 i32) (result i32)))
 (type $5 (func (result i32)))
 (import "env" "abort" (func $~lib/builtins/abort (param i32 i32 i32 i32)))
 (import "env" "__request_block" (func $assembly/env/__request_block (result i32)))
 (import "env" "__load_block" (func $assembly/env/__load_block (param i32)))
 (import "env" "console.log" (func $~lib/bindings/dom/console.log (param i32)))
 (global $~lib/rt/stub/offset (mut i32) (i32.const 0))
 (global $~lib/as-bignum/assembly/globals/__res128_hi (mut i64) (i64.const 0))
 (global $assembly/env/env (mut i32) (i32.const 0))
 (memory $0 1 32768)
 (data $0 (i32.const 1036) "\1c\02")
 (data $0.1 (i32.const 1048) "\04\00\00\00\00\02\00\00000102030405060708090a0b0c0d0e0f101112131415161718191a1b1c1d1e1f202122232425262728292a2b2c2d2e2f303132333435363738393a3b3c3d3e3f404142434445464748494a4b4c4d4e4f505152535455565758595a5b5c5d5e5f606162636465666768696a6b6c6d6e6f707172737475767778797a7b7c7d7e7f808182838485868788898a8b8c8d8e8f909192939495969798999a9b9c9d9e9fa0a1a2a3a4a5a6a7a8a9aaabacadaeafb0b1b2b3b4b5b6b7b8b9babbbcbdbebfc0c1c2c3c4c5c6c7c8c9cacbcccdcecfd0d1d2d3d4d5d6d7d8d9dadbdcdddedfe0e1e2e3e4e5e6e7e8e9eaebecedeeeff0f1f2f3f4f5f6f7f8f9fafbfcfdfeff")
 (data $1 (i32.const 1580) "<")
 (data $1.1 (i32.const 1592) "\02\00\00\00(\00\00\00A\00l\00l\00o\00c\00a\00t\00i\00o\00n\00 \00t\00o\00o\00 \00l\00a\00r\00g\00e")
 (data $2 (i32.const 1644) "<")
 (data $2.1 (i32.const 1656) "\02\00\00\00\1e\00\00\00~\00l\00i\00b\00/\00r\00t\00/\00s\00t\00u\00b\00.\00t\00s")
 (data $3 (i32.const 1708) "\1c\02")
 (data $3.1 (i32.const 1720) "\04\00\00\00\00\02\00\00000102030405060708090a0b0c0d0e0f101112131415161718191a1b1c1d1e1f202122232425262728292a2b2c2d2e2f303132333435363738393a3b3c3d3e3f404142434445464748494a4b4c4d4e4f505152535455565758595a5b5c5d5e5f606162636465666768696a6b6c6d6e6f707172737475767778797a7b7c7d7e7f808182838485868788898a8b8c8d8e8f909192939495969798999a9b9c9d9e9fa0a1a2a3a4a5a6a7a8a9aaabacadaeafb0b1b2b3b4b5b6b7b8b9babbbcbdbebfc0c1c2c3c4c5c6c7c8c9cacbcccdcecfd0d1d2d3d4d5d6d7d8d9dadbdcdddedfe0e1e2e3e4e5e6e7e8e9eaebecedeeeff0f1f2f3f4f5f6f7f8f9fafbfcfdfeff")
 (data $4 (i32.const 2252) "\1c\01")
 (data $4.1 (i32.const 2264) "\01\00\00\00\00\01\00\00\98/\8aB\91D7q\cf\fb\c0\b5\a5\db\b5\e9[\c2V9\f1\11\f1Y\a4\82?\92\d5^\1c\ab\98\aa\07\d8\01[\83\12\be\851$\c3}\0cUt]\ber\fe\b1\de\80\a7\06\dc\9bt\f1\9b\c1\c1i\9b\e4\86G\be\ef\c6\9d\c1\0f\cc\a1\0c$o,\e9-\aa\84tJ\dc\a9\b0\\\da\88\f9vRQ>\98m\c61\a8\c8\'\03\b0\c7\7fY\bf\f3\0b\e0\c6G\91\a7\d5Qc\ca\06g))\14\85\n\b7\'8!\1b.\fcm,M\13\r8STs\ne\bb\njv.\c9\c2\81\85,r\92\a1\e8\bf\a2Kf\1a\a8p\8bK\c2\a3Ql\c7\19\e8\92\d1$\06\99\d6\855\0e\f4p\a0j\10\16\c1\a4\19\08l7\1eLwH\'\b5\bc\b04\b3\0c\1c9J\aa\d8NO\ca\9c[\f3o.h\ee\82\8ftoc\a5x\14x\c8\84\08\02\c7\8c\fa\ff\be\90\eblP\a4\f7\a3\f9\be\f2xq\c6")
 (data $5 (i32.const 2540) ",")
 (data $5.1 (i32.const 2552) "\06\00\00\00\10\00\00\00\e0\08\00\00\e0\08\00\00\00\01\00\00@")
 (data $6 (i32.const 2588) ",")
 (data $6.1 (i32.const 2600) "\02\00\00\00\1c\00\00\00I\00n\00v\00a\00l\00i\00d\00 \00l\00e\00n\00g\00t\00h")
 (data $7 (i32.const 2636) "<")
 (data $7.1 (i32.const 2648) "\02\00\00\00&\00\00\00~\00l\00i\00b\00/\00a\00r\00r\00a\00y\00b\00u\00f\00f\00e\00r\00.\00t\00s")
 (data $8 (i32.const 2700) "<")
 (data $8.1 (i32.const 2712) "\02\00\00\00(\00\00\00/\00b\00l\00o\00c\00k\00h\00a\00s\00h\00/\00b\00y\00h\00e\00i\00g\00h\00t\00/")
 (data $9 (i32.const 2764) "<")
 (data $9.1 (i32.const 2776) "\02\00\00\00$\00\00\00U\00n\00p\00a\00i\00r\00e\00d\00 \00s\00u\00r\00r\00o\00g\00a\00t\00e")
 (data $10 (i32.const 2828) ",")
 (data $10.1 (i32.const 2840) "\02\00\00\00\1c\00\00\00~\00l\00i\00b\00/\00s\00t\00r\00i\00n\00g\00.\00t\00s")
 (data $11 (i32.const 2876) "<")
 (data $11.1 (i32.const 2888) "\02\00\00\00(\00\00\00/\00h\00e\00i\00g\00h\00t\00/\00b\00y\00b\00l\00o\00c\00k\00h\00a\00s\00h\00/")
 (data $12 (i32.const 2940) "<")
 (data $12.1 (i32.const 2952) "\02\00\00\00$\00\00\00/\00r\00u\00n\00e\00s\00/\00b\00y\00o\00u\00t\00p\00o\00i\00n\00t\00/")
 (data $13 (i32.const 3004) "<")
 (data $13.1 (i32.const 3016) "\02\00\00\00&\00\00\00/\00h\00e\00i\00g\00h\00t\00/\00b\00y\00o\00u\00t\00p\00o\00i\00n\00t\00/")
 (data $14 (i32.const 3068) "<")
 (data $14.1 (i32.const 3080) "\02\00\00\00\1e\00\00\00/\00t\00x\00i\00d\00s\00/\00b\00y\00h\00e\00i\00g\00h\00t")
 (data $15 (i32.const 3132) ",")
 (data $15.1 (i32.const 3144) "\02\00\00\00\1c\00\00\00/\00r\00u\00n\00e\00s\00/\00s\00y\00m\00b\00o\00l\00/")
 (data $16 (i32.const 3180) ",")
 (data $16.1 (i32.const 3192) "\02\00\00\00\16\00\00\00/\00r\00u\00n\00e\00s\00/\00c\00a\00p\00/")
 (data $17 (i32.const 3228) ",")
 (data $17.1 (i32.const 3240) "\02\00\00\00\1c\00\00\00/\00r\00u\00n\00e\00s\00/\00s\00p\00a\00c\00e\00s\00/")
 (data $18 (i32.const 3276) "<")
 (data $18.1 (i32.const 3288) "\02\00\00\00$\00\00\00/\00r\00u\00n\00e\00s\00/\00o\00f\00f\00s\00e\00t\00/\00e\00n\00d\00/")
 (data $19 (i32.const 3340) "<")
 (data $19.1 (i32.const 3352) "\02\00\00\00(\00\00\00/\00r\00u\00n\00e\00s\00/\00o\00f\00f\00s\00e\00t\00/\00s\00t\00a\00r\00t\00/")
 (data $20 (i32.const 3404) "<")
 (data $20.1 (i32.const 3416) "\02\00\00\00(\00\00\00/\00r\00u\00n\00e\00s\00/\00h\00e\00i\00g\00h\00t\00/\00s\00t\00a\00r\00t\00/")
 (data $21 (i32.const 3468) "<")
 (data $21.1 (i32.const 3480) "\02\00\00\00$\00\00\00/\00r\00u\00n\00e\00s\00/\00h\00e\00i\00g\00h\00t\00/\00e\00n\00d\00/")
 (data $22 (i32.const 3532) ",")
 (data $22.1 (i32.const 3544) "\02\00\00\00\1c\00\00\00/\00r\00u\00n\00e\00s\00/\00a\00m\00o\00u\00n\00t\00/")
 (data $23 (i32.const 3580) "L")
 (data $23.1 (i32.const 3592) "\02\00\00\00.\00\00\00/\00r\00u\00n\00e\00s\00/\00m\00i\00n\00t\00s\00-\00r\00e\00m\00a\00i\00n\00i\00n\00g\00/")
 (data $24 (i32.const 3660) "<")
 (data $24.1 (i32.const 3672) "\02\00\00\00\1e\00\00\00/\00r\00u\00n\00e\00s\00/\00p\00r\00e\00m\00i\00n\00e\00/")
 (data $25 (i32.const 3724) "<")
 (data $25.1 (i32.const 3736) "\02\00\00\00(\00\00\00/\00r\00u\00n\00e\00s\00/\00d\00i\00v\00i\00s\00i\00b\00i\00l\00i\00t\00y\00/")
 (data $26 (i32.const 3788) "<")
 (data $26.1 (i32.const 3800) "\02\00\00\00\"\00\00\00/\00h\00e\00i\00g\00h\00t\00/\00b\00y\00r\00u\00n\00e\00i\00d\00/")
 (data $27 (i32.const 3852) ",")
 (data $27.1 (i32.const 3864) "\02\00\00\00\18\00\00\00/\00r\00u\00n\00e\00s\00/\00n\00a\00m\00e\00s")
 (data $28 (i32.const 3900) "<")
 (data $28.1 (i32.const 3912) "\02\00\00\00$\00\00\00/\00e\00t\00c\00h\00i\00n\00g\00/\00b\00y\00r\00u\00n\00e\00i\00d\00/")
 (data $29 (i32.const 3964) "<")
 (data $29.1 (i32.const 3976) "\02\00\00\00$\00\00\00/\00r\00u\00n\00e\00i\00d\00/\00b\00y\00e\00t\00c\00h\00i\00n\00g\00/")
 (data $30 (i32.const 4028) "<")
 (data $30.1 (i32.const 4040) "\02\00\00\00\"\00\00\009\009\002\004\006\001\001\004\009\002\008\001\004\009\004\006\002")
 (data $31 (i32.const 4092) ",")
 (data $31.1 (i32.const 4104) "\02\00\00\00\1a\00\00\00I\00n\00v\00a\00l\00i\00d\00 \00r\00a\00d\00i\00x")
 (data $32 (i32.const 4140) "\\")
 (data $32.1 (i32.const 4152) "\02\00\00\00@\00\00\00~\00l\00i\00b\00/\00a\00s\00-\00b\00i\00g\00n\00u\00m\00/\00a\00s\00s\00e\00m\00b\00l\00y\00/\00u\00t\00i\00l\00s\00.\00t\00s")
 (data $33 (i32.const 4237) "\01\02\03\04\05\06\07\08\t$$$$$$$\n\0b\0c\r\0e\0f\10\11\12\13\14\15\16\17\18\19\1a\1b\1c\1d\1e\1f !\"#$$$$$$\n\0b\0c\r\0e\0f\10\11\12\13\14\15\16\17\18\19\1a\1b\1c\1d\1e\1f !\"#")
 (data $34 (i32.const 4316) "\\")
 (data $34.1 (i32.const 4328) "\02\00\00\00J\00\00\006\004\000\002\003\006\004\003\006\003\004\001\005\004\004\003\006\000\003\002\002\008\005\004\001\002\005\009\009\003\006\002\001\001\009\002\006")
 (export "_start" (func $assembly/index/_start))
 (export "memory" (memory $0))
 (start $~start)
 (func $~lib/rt/stub/__alloc (param $0 i32) (result i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  local.get $0
  i32.const 1073741820
  i32.gt_u
  if
   i32.const 1600
   i32.const 1664
   i32.const 33
   i32.const 29
   call $~lib/builtins/abort
   unreachable
  end
  global.get $~lib/rt/stub/offset
  local.set $1
  global.get $~lib/rt/stub/offset
  i32.const 4
  i32.add
  local.tee $2
  local.get $0
  i32.const 19
  i32.add
  i32.const -16
  i32.and
  i32.const 4
  i32.sub
  local.tee $0
  i32.add
  local.tee $3
  memory.size
  local.tee $4
  i32.const 16
  i32.shl
  i32.const 15
  i32.add
  i32.const -16
  i32.and
  local.tee $5
  i32.gt_u
  if
   local.get $4
   local.get $3
   local.get $5
   i32.sub
   i32.const 65535
   i32.add
   i32.const -65536
   i32.and
   i32.const 16
   i32.shr_u
   local.tee $5
   local.get $4
   local.get $5
   i32.gt_s
   select
   memory.grow
   i32.const 0
   i32.lt_s
   if
    local.get $5
    memory.grow
    i32.const 0
    i32.lt_s
    if
     unreachable
    end
   end
  end
  local.get $3
  global.set $~lib/rt/stub/offset
  local.get $1
  local.get $0
  i32.store
  local.get $2
 )
 (func $~lib/rt/stub/__new (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
  (local $3 i32)
  local.get $0
  i32.const 1073741804
  i32.gt_u
  if
   i32.const 1600
   i32.const 1664
   i32.const 86
   i32.const 30
   call $~lib/builtins/abort
   unreachable
  end
  local.get $0
  i32.const 16
  i32.add
  call $~lib/rt/stub/__alloc
  local.tee $3
  i32.const 4
  i32.sub
  local.tee $2
  i32.const 0
  i32.store offset=4
  local.get $2
  i32.const 0
  i32.store offset=8
  local.get $2
  local.get $1
  i32.store offset=12
  local.get $2
  local.get $0
  i32.store offset=16
  local.get $3
  i32.const 16
  i32.add
 )
 (func $~lib/arraybuffer/ArrayBuffer#constructor (param $0 i32) (result i32)
  (local $1 i32)
  local.get $0
  i32.const 1073741820
  i32.gt_u
  if
   i32.const 2608
   i32.const 2656
   i32.const 52
   i32.const 43
   call $~lib/builtins/abort
   unreachable
  end
  local.get $0
  i32.const 1
  call $~lib/rt/stub/__new
  local.tee $1
  i32.const 0
  local.get $0
  memory.fill
  local.get $1
 )
 (func $"~lib/map/Map<~lib/string/String,~lib/arraybuffer/ArrayBuffer>#constructor"
  (local $0 i32)
  i32.const 24
  i32.const 7
  call $~lib/rt/stub/__new
  local.tee $0
  i32.const 16
  call $~lib/arraybuffer/ArrayBuffer#constructor
  i32.store
  local.get $0
  i32.const 3
  i32.store offset=4
  local.get $0
  i32.const 48
  call $~lib/arraybuffer/ArrayBuffer#constructor
  i32.store offset=8
  local.get $0
  i32.const 4
  i32.store offset=12
  local.get $0
  i32.const 0
  i32.store offset=16
  local.get $0
  i32.const 0
  i32.store offset=20
 )
 (func $~lib/metashrew-as/assembly/indexer/tables/IndexPointer.for (param $0 i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  local.get $0
  local.tee $1
  i32.const 20
  i32.sub
  i32.load offset=16
  local.get $1
  i32.add
  local.set $3
  loop $while-continue|0
   local.get $1
   local.get $3
   i32.lt_u
   if
    local.get $1
    i32.load16_u
    local.tee $4
    i32.const 128
    i32.lt_u
    if (result i32)
     local.get $2
     i32.const 1
     i32.add
    else
     local.get $4
     i32.const 2048
     i32.lt_u
     if (result i32)
      local.get $2
      i32.const 2
      i32.add
     else
      local.get $4
      i32.const 64512
      i32.and
      i32.const 55296
      i32.eq
      local.get $1
      i32.const 2
      i32.add
      local.get $3
      i32.lt_u
      i32.and
      if
       local.get $1
       i32.load16_u offset=2
       i32.const 64512
       i32.and
       i32.const 56320
       i32.eq
       if
        local.get $2
        i32.const 4
        i32.add
        local.set $2
        local.get $1
        i32.const 4
        i32.add
        local.set $1
        br $while-continue|0
       end
      end
      local.get $2
      i32.const 3
      i32.add
     end
    end
    local.set $2
    local.get $1
    i32.const 2
    i32.add
    local.set $1
    br $while-continue|0
   end
  end
  local.get $2
  i32.const 1
  call $~lib/rt/stub/__new
  local.set $2
  local.get $0
  local.tee $1
  i32.const 20
  i32.sub
  i32.load offset=16
  i32.const -2
  i32.and
  local.get $1
  i32.add
  local.set $3
  local.get $2
  local.set $0
  loop $while-continue|00
   local.get $1
   local.get $3
   i32.lt_u
   if
    local.get $1
    i32.load16_u
    local.tee $2
    i32.const 128
    i32.lt_u
    if (result i32)
     local.get $0
     local.get $2
     i32.store8
     local.get $0
     i32.const 1
     i32.add
    else
     local.get $2
     i32.const 2048
     i32.lt_u
     if (result i32)
      local.get $0
      local.get $2
      i32.const 6
      i32.shr_u
      i32.const 192
      i32.or
      local.get $2
      i32.const 63
      i32.and
      i32.const 128
      i32.or
      i32.const 8
      i32.shl
      i32.or
      i32.store16
      local.get $0
      i32.const 2
      i32.add
     else
      local.get $2
      i32.const 63488
      i32.and
      i32.const 55296
      i32.eq
      if
       local.get $2
       i32.const 56320
       i32.lt_u
       local.get $1
       i32.const 2
       i32.add
       local.get $3
       i32.lt_u
       i32.and
       if
        local.get $1
        i32.load16_u offset=2
        local.tee $4
        i32.const 64512
        i32.and
        i32.const 56320
        i32.eq
        if
         local.get $0
         local.get $2
         i32.const 1023
         i32.and
         i32.const 10
         i32.shl
         i32.const 65536
         i32.add
         local.get $4
         i32.const 1023
         i32.and
         i32.or
         local.tee $2
         i32.const 63
         i32.and
         i32.const 128
         i32.or
         i32.const 24
         i32.shl
         local.get $2
         i32.const 6
         i32.shr_u
         i32.const 63
         i32.and
         i32.const 128
         i32.or
         i32.const 16
         i32.shl
         i32.or
         local.get $2
         i32.const 12
         i32.shr_u
         i32.const 63
         i32.and
         i32.const 128
         i32.or
         i32.const 8
         i32.shl
         i32.or
         local.get $2
         i32.const 18
         i32.shr_u
         i32.const 240
         i32.or
         i32.or
         i32.store
         local.get $0
         i32.const 4
         i32.add
         local.set $0
         local.get $1
         i32.const 4
         i32.add
         local.set $1
         br $while-continue|00
        end
       end
      end
      local.get $0
      local.get $2
      i32.const 12
      i32.shr_u
      i32.const 224
      i32.or
      local.get $2
      i32.const 6
      i32.shr_u
      i32.const 63
      i32.and
      i32.const 128
      i32.or
      i32.const 8
      i32.shl
      i32.or
      i32.store16
      local.get $0
      local.get $2
      i32.const 63
      i32.and
      i32.const 128
      i32.or
      i32.store8 offset=2
      local.get $0
      i32.const 3
      i32.add
     end
    end
    local.set $0
    local.get $1
    i32.const 2
    i32.add
    local.set $1
    br $while-continue|00
   end
  end
 )
 (func $~lib/as-bignum/assembly/utils/atou128 (param $0 i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i64)
  (local $4 i32)
  (local $5 i32)
  (local $6 i32)
  (local $7 i32)
  (local $8 i64)
  (local $9 i64)
  (local $10 i64)
  (local $11 i32)
  (local $12 i64)
  (local $13 i64)
  (local $14 i64)
  (local $15 i32)
  i32.const 10
  local.set $4
  block $folding-inner0
   local.get $0
   i32.const 20
   i32.sub
   i32.load offset=16
   i32.const 1
   i32.shr_u
   local.tee $5
   i32.eqz
   br_if $folding-inner0
   local.get $0
   i32.const 20
   i32.sub
   i32.load offset=16
   i32.const 1
   i32.shr_u
   if (result i32)
    local.get $0
    i32.load16_u
   else
    i32.const -1
   end
   local.tee $1
   i32.const 48
   i32.eq
   local.get $5
   i32.const 1
   i32.eq
   i32.and
   br_if $folding-inner0
   local.get $1
   i32.const 45
   i32.eq
   local.tee $6
   local.get $1
   i32.const 43
   i32.eq
   i32.or
   local.tee $2
   local.get $0
   i32.const 20
   i32.sub
   i32.load offset=16
   i32.const 1
   i32.shr_u
   i32.ge_u
   if (result i32)
    i32.const -1
   else
    local.get $0
    local.get $2
    i32.const 1
    i32.shl
    i32.add
    i32.load16_u
   end
   i32.const 48
   i32.eq
   if
    local.get $2
    i32.const 1
    i32.add
    local.tee $2
    local.get $0
    i32.const 20
    i32.sub
    i32.load offset=16
    i32.const 1
    i32.shr_u
    i32.ge_u
    if (result i32)
     i32.const -1
    else
     local.get $0
     local.get $2
     i32.const 1
     i32.shl
     i32.add
     i32.load16_u
    end
    local.tee $1
    i32.const 32
    i32.or
    i32.const 120
    i32.eq
    if
     i32.const 16
     local.set $4
     local.get $2
     i32.const 1
     i32.add
     local.set $2
    else
     local.get $1
     i32.const 32
     i32.or
     i32.const 111
     i32.eq
     if
      i32.const 8
      local.set $4
      local.get $2
      i32.const 1
      i32.add
      local.set $2
     else
      local.get $1
      i32.const 32
      i32.or
      i32.const 98
      i32.eq
      if
       i32.const 2
       local.set $4
       local.get $2
       i32.const 1
       i32.add
       local.set $2
      else
       local.get $1
       i32.const 48
       i32.eq
       if
        loop $while-continue|0
         local.get $2
         local.get $5
         i32.lt_s
         if (result i32)
          local.get $2
          local.get $0
          i32.const 20
          i32.sub
          i32.load offset=16
          i32.const 1
          i32.shr_u
          i32.ge_u
          if (result i32)
           i32.const -1
          else
           local.get $0
           local.get $2
           i32.const 1
           i32.shl
           i32.add
           i32.load16_u
          end
          i32.const 48
          i32.eq
         else
          i32.const 0
         end
         if
          local.get $2
          i32.const 1
          i32.add
          local.set $2
          br $while-continue|0
         end
        end
       end
      end
     end
    end
   end
   i32.const 16
   i32.const 8
   call $~lib/rt/stub/__new
   local.tee $1
   i64.const 0
   i64.store
   local.get $1
   i64.const 0
   i64.store offset=8
   local.get $2
   local.get $5
   i32.ge_s
   if
    return
   end
   block $break|1
    block $case3|1
     block $case2|1
      block $case1|1
       local.get $4
       i32.const 2
       i32.ne
       if
        local.get $4
        i32.const 10
        i32.eq
        br_if $case1|1
        local.get $4
        i32.const 16
        i32.eq
        br_if $case2|1
        br $case3|1
       end
       loop $do-loop|2
        local.get $2
        local.get $0
        i32.const 20
        i32.sub
        i32.load offset=16
        i32.const 1
        i32.shr_u
        i32.ge_u
        if (result i32)
         i32.const -1
        else
         local.get $0
         local.get $2
         i32.const 1
         i32.shl
         i32.add
         i32.load16_u
        end
        i32.const 48
        i32.sub
        local.tee $4
        i32.const 2
        i32.lt_u
        if
         local.get $1
         i64.load offset=8
         i64.const 1
         i64.shl
         local.get $1
         i64.load
         local.tee $3
         i64.const 63
         i64.shr_u
         i64.or
         local.set $8
         i32.const 16
         i32.const 8
         call $~lib/rt/stub/__new
         local.tee $1
         local.get $3
         i64.const 1
         i64.shl
         i64.store
         local.get $1
         local.get $8
         i64.store offset=8
         i32.const 16
         i32.const 8
         call $~lib/rt/stub/__new
         local.tee $7
         local.get $4
         i64.extend_i32_u
         i64.store
         local.get $7
         i64.const 0
         i64.store offset=8
         local.get $1
         i64.load
         local.get $7
         i64.load
         i64.or
         local.set $3
         local.get $1
         i64.load offset=8
         local.get $7
         i64.load offset=8
         i64.or
         local.set $8
         i32.const 16
         i32.const 8
         call $~lib/rt/stub/__new
         local.tee $1
         local.get $3
         i64.store
         local.get $1
         local.get $8
         i64.store offset=8
         local.get $5
         local.get $2
         i32.const 1
         i32.add
         local.tee $2
         i32.gt_s
         br_if $do-loop|2
        end
       end
       br $break|1
      end
      loop $do-loop|3
       local.get $2
       local.get $0
       i32.const 20
       i32.sub
       i32.load offset=16
       i32.const 1
       i32.shr_u
       i32.ge_u
       if (result i32)
        i32.const -1
       else
        local.get $0
        local.get $2
        i32.const 1
        i32.shl
        i32.add
        i32.load16_u
       end
       i32.const 48
       i32.sub
       local.tee $4
       i32.const 10
       i32.lt_u
       if
        local.get $1
        i64.load offset=8
        i64.const 3
        i64.shl
        local.get $1
        i64.load
        local.tee $3
        i64.const 61
        i64.shr_u
        i64.or
        local.set $8
        i32.const 16
        i32.const 8
        call $~lib/rt/stub/__new
        local.tee $7
        local.get $3
        i64.const 3
        i64.shl
        i64.store
        local.get $7
        local.get $8
        i64.store offset=8
        local.get $1
        i64.load offset=8
        i64.const 1
        i64.shl
        local.get $1
        i64.load
        local.tee $3
        i64.const 63
        i64.shr_u
        i64.or
        local.set $8
        i32.const 16
        i32.const 8
        call $~lib/rt/stub/__new
        local.tee $1
        local.get $3
        i64.const 1
        i64.shl
        i64.store
        local.get $1
        local.get $8
        i64.store offset=8
        local.get $7
        i64.load
        local.tee $3
        local.get $1
        i64.load
        i64.add
        local.set $8
        local.get $3
        local.get $8
        i64.gt_u
        i64.extend_i32_u
        local.get $7
        i64.load offset=8
        local.get $1
        i64.load offset=8
        i64.add
        i64.add
        local.set $3
        i32.const 16
        i32.const 8
        call $~lib/rt/stub/__new
        local.tee $1
        local.get $8
        i64.store
        local.get $1
        local.get $3
        i64.store offset=8
        i32.const 16
        i32.const 8
        call $~lib/rt/stub/__new
        local.tee $7
        local.get $4
        i64.extend_i32_u
        i64.store
        local.get $7
        i64.const 0
        i64.store offset=8
        local.get $1
        i64.load
        local.tee $3
        local.get $7
        i64.load
        i64.add
        local.set $8
        local.get $3
        local.get $8
        i64.gt_u
        i64.extend_i32_u
        local.get $1
        i64.load offset=8
        local.get $7
        i64.load offset=8
        i64.add
        i64.add
        local.set $3
        i32.const 16
        i32.const 8
        call $~lib/rt/stub/__new
        local.tee $1
        local.get $8
        i64.store
        local.get $1
        local.get $3
        i64.store offset=8
        local.get $5
        local.get $2
        i32.const 1
        i32.add
        local.tee $2
        i32.gt_s
        br_if $do-loop|3
       end
      end
      br $break|1
     end
     loop $do-loop|4
      block $do-break|4
       local.get $2
       local.get $0
       i32.const 20
       i32.sub
       i32.load offset=16
       i32.const 1
       i32.shr_u
       i32.ge_u
       if (result i32)
        i32.const -1
       else
        local.get $0
        local.get $2
        i32.const 1
        i32.shl
        i32.add
        i32.load16_u
       end
       i32.const 48
       i32.sub
       local.tee $4
       i32.const 74
       i32.gt_u
       br_if $do-break|4
       local.get $4
       i32.const 4236
       i32.add
       i32.load8_u
       local.tee $4
       i32.const 16
       i32.ge_u
       br_if $do-break|4
       local.get $1
       i64.load offset=8
       i64.const 4
       i64.shl
       local.get $1
       i64.load
       local.tee $3
       i64.const 60
       i64.shr_u
       i64.or
       local.set $8
       i32.const 16
       i32.const 8
       call $~lib/rt/stub/__new
       local.tee $1
       local.get $3
       i64.const 4
       i64.shl
       i64.store
       local.get $1
       local.get $8
       i64.store offset=8
       i32.const 16
       i32.const 8
       call $~lib/rt/stub/__new
       local.tee $7
       local.get $4
       i64.extend_i32_u
       i64.store
       local.get $7
       i64.const 0
       i64.store offset=8
       local.get $1
       i64.load
       local.get $7
       i64.load
       i64.or
       local.set $3
       local.get $1
       i64.load offset=8
       local.get $7
       i64.load offset=8
       i64.or
       local.set $8
       i32.const 16
       i32.const 8
       call $~lib/rt/stub/__new
       local.tee $1
       local.get $3
       i64.store
       local.get $1
       local.get $8
       i64.store offset=8
       local.get $5
       local.get $2
       i32.const 1
       i32.add
       local.tee $2
       i32.gt_s
       br_if $do-loop|4
      end
     end
     br $break|1
    end
    i32.const 16
    i32.const 8
    call $~lib/rt/stub/__new
    local.tee $7
    local.get $4
    i64.extend_i32_s
    i64.store
    local.get $7
    i64.const 0
    i64.store offset=8
    loop $do-loop|5
     block $do-break|5
      local.get $2
      local.get $0
      i32.const 20
      i32.sub
      i32.load offset=16
      i32.const 1
      i32.shr_u
      i32.ge_u
      if (result i32)
       i32.const -1
      else
       local.get $0
       local.get $2
       i32.const 1
       i32.shl
       i32.add
       i32.load16_u
      end
      i32.const 48
      i32.sub
      local.tee $11
      i32.const 74
      i32.gt_u
      br_if $do-break|5
      local.get $11
      i32.const 4236
      i32.add
      i32.load8_u
      local.tee $11
      local.get $4
      i32.ge_u
      br_if $do-break|5
      local.get $1
      i64.load
      local.tee $3
      i64.const 4294967295
      i64.and
      local.tee $9
      local.get $7
      i64.load
      local.tee $8
      i64.const 4294967295
      i64.and
      local.tee $10
      i64.mul
      local.set $12
      local.get $9
      local.get $8
      i64.const 32
      i64.shr_u
      local.tee $13
      i64.mul
      local.get $10
      local.get $3
      i64.const 32
      i64.shr_u
      local.tee $9
      i64.mul
      local.get $12
      i64.const 32
      i64.shr_u
      i64.add
      local.tee $14
      i64.const 4294967295
      i64.and
      i64.add
      local.set $10
      local.get $9
      local.get $13
      i64.mul
      local.get $14
      i64.const 32
      i64.shr_u
      i64.add
      local.get $8
      local.get $1
      i64.load offset=8
      i64.mul
      i64.add
      local.get $7
      i64.load offset=8
      local.get $3
      i64.mul
      i64.add
      local.get $10
      i64.const 32
      i64.shr_u
      i64.add
      global.set $~lib/as-bignum/assembly/globals/__res128_hi
      global.get $~lib/as-bignum/assembly/globals/__res128_hi
      local.set $3
      i32.const 16
      i32.const 8
      call $~lib/rt/stub/__new
      local.tee $15
      local.get $12
      i64.const 4294967295
      i64.and
      local.get $10
      i64.const 32
      i64.shl
      i64.or
      i64.store
      local.get $15
      local.get $3
      i64.store offset=8
      i32.const 16
      i32.const 8
      call $~lib/rt/stub/__new
      local.tee $1
      local.get $11
      i64.extend_i32_u
      i64.store
      local.get $1
      i64.const 0
      i64.store offset=8
      local.get $15
      i64.load
      local.tee $3
      local.get $1
      i64.load
      i64.add
      local.set $8
      local.get $3
      local.get $8
      i64.gt_u
      i64.extend_i32_u
      local.get $15
      i64.load offset=8
      local.get $1
      i64.load offset=8
      i64.add
      i64.add
      local.set $3
      i32.const 16
      i32.const 8
      call $~lib/rt/stub/__new
      local.tee $1
      local.get $8
      i64.store
      local.get $1
      local.get $3
      i64.store offset=8
      local.get $5
      local.get $2
      i32.const 1
      i32.add
      local.tee $2
      i32.gt_s
      br_if $do-loop|5
     end
    end
   end
   local.get $6
   if
    local.get $1
    i64.load
    i64.const -1
    i64.xor
    local.tee $3
    i64.const 1
    i64.add
    local.set $8
    local.get $3
    local.get $8
    i64.gt_u
    i64.extend_i32_u
    local.get $1
    i64.load offset=8
    i64.const -1
    i64.xor
    i64.add
    local.set $3
    i32.const 16
    i32.const 8
    call $~lib/rt/stub/__new
    local.tee $0
    local.get $8
    i64.store
    local.get $0
    local.get $3
    i64.store offset=8
   end
   return
  end
  i32.const 16
  i32.const 8
  call $~lib/rt/stub/__new
  local.tee $0
  i64.const 0
  i64.store
  local.get $0
  i64.const 0
  i64.store offset=8
 )
 (func $~lib/string/String.UTF8.decode (param $0 i32) (result i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  (local $6 i32)
  local.get $0
  i32.const 20
  i32.sub
  i32.load offset=16
  local.tee $1
  local.get $0
  i32.add
  local.tee $3
  local.get $0
  i32.lt_u
  if
   i32.const 0
   i32.const 2848
   i32.const 770
   i32.const 7
   call $~lib/builtins/abort
   unreachable
  end
  local.get $1
  i32.const 1
  i32.shl
  i32.const 2
  call $~lib/rt/stub/__new
  local.tee $4
  local.set $2
  loop $while-continue|0
   local.get $0
   local.get $3
   i32.lt_u
   if
    block $while-break|0
     local.get $0
     i32.load8_u
     local.set $1
     local.get $0
     i32.const 1
     i32.add
     local.set $0
     local.get $1
     i32.const 128
     i32.and
     if
      local.get $0
      local.get $3
      i32.eq
      br_if $while-break|0
      local.get $0
      i32.load8_u
      i32.const 63
      i32.and
      local.set $5
      local.get $0
      i32.const 1
      i32.add
      local.set $0
      local.get $1
      i32.const 224
      i32.and
      i32.const 192
      i32.eq
      if
       local.get $2
       local.get $1
       i32.const 31
       i32.and
       i32.const 6
       i32.shl
       local.get $5
       i32.or
       i32.store16
      else
       local.get $0
       local.get $3
       i32.eq
       br_if $while-break|0
       local.get $0
       i32.load8_u
       i32.const 63
       i32.and
       local.set $6
       local.get $0
       i32.const 1
       i32.add
       local.set $0
       local.get $1
       i32.const 240
       i32.and
       i32.const 224
       i32.eq
       if
        local.get $1
        i32.const 15
        i32.and
        i32.const 12
        i32.shl
        local.get $5
        i32.const 6
        i32.shl
        i32.or
        local.get $6
        i32.or
        local.set $1
       else
        local.get $0
        local.get $3
        i32.eq
        br_if $while-break|0
        local.get $0
        i32.load8_u
        i32.const 63
        i32.and
        local.get $1
        i32.const 7
        i32.and
        i32.const 18
        i32.shl
        local.get $5
        i32.const 12
        i32.shl
        i32.or
        local.get $6
        i32.const 6
        i32.shl
        i32.or
        i32.or
        local.set $1
        local.get $0
        i32.const 1
        i32.add
        local.set $0
       end
       local.get $1
       i32.const 65536
       i32.lt_u
       if
        local.get $2
        local.get $1
        i32.store16
       else
        local.get $2
        local.get $1
        i32.const 65536
        i32.sub
        local.tee $1
        i32.const 10
        i32.shr_u
        i32.const 55296
        i32.or
        local.get $1
        i32.const 1023
        i32.and
        i32.const 56320
        i32.or
        i32.const 16
        i32.shl
        i32.or
        i32.store
        local.get $2
        i32.const 2
        i32.add
        local.set $2
       end
      end
     else
      local.get $2
      local.get $1
      i32.store16
     end
     local.get $2
     i32.const 2
     i32.add
     local.set $2
     br $while-continue|0
    end
   end
  end
  local.get $2
  local.get $4
  i32.sub
  local.tee $2
  i32.const 1073741804
  i32.gt_u
  if
   i32.const 1600
   i32.const 1664
   i32.const 99
   i32.const 30
   call $~lib/builtins/abort
   unreachable
  end
  local.get $4
  i32.const 16
  i32.sub
  local.tee $0
  i32.const 15
  i32.and
  i32.const 1
  local.get $0
  select
  if
   i32.const 0
   i32.const 1664
   i32.const 45
   i32.const 3
   call $~lib/builtins/abort
   unreachable
  end
  global.get $~lib/rt/stub/offset
  local.get $0
  i32.const 4
  i32.sub
  local.tee $1
  i32.load
  local.tee $3
  local.get $0
  i32.add
  i32.eq
  local.set $4
  local.get $2
  i32.const 16
  i32.add
  local.tee $5
  i32.const 19
  i32.add
  i32.const -16
  i32.and
  i32.const 4
  i32.sub
  local.set $6
  local.get $3
  local.get $5
  i32.lt_u
  if
   local.get $4
   if
    local.get $5
    i32.const 1073741820
    i32.gt_u
    if
     i32.const 1600
     i32.const 1664
     i32.const 52
     i32.const 33
     call $~lib/builtins/abort
     unreachable
    end
    local.get $0
    local.get $6
    i32.add
    local.tee $3
    memory.size
    local.tee $4
    i32.const 16
    i32.shl
    i32.const 15
    i32.add
    i32.const -16
    i32.and
    local.tee $5
    i32.gt_u
    if
     local.get $4
     local.get $3
     local.get $5
     i32.sub
     i32.const 65535
     i32.add
     i32.const -65536
     i32.and
     i32.const 16
     i32.shr_u
     local.tee $5
     local.get $4
     local.get $5
     i32.gt_s
     select
     memory.grow
     i32.const 0
     i32.lt_s
     if
      local.get $5
      memory.grow
      i32.const 0
      i32.lt_s
      if
       unreachable
      end
     end
    end
    local.get $3
    global.set $~lib/rt/stub/offset
    local.get $1
    local.get $6
    i32.store
   else
    local.get $6
    local.get $3
    i32.const 1
    i32.shl
    local.tee $1
    local.get $1
    local.get $6
    i32.lt_u
    select
    call $~lib/rt/stub/__alloc
    local.tee $1
    local.get $0
    local.get $3
    memory.copy
    local.get $1
    local.set $0
   end
  else
   local.get $4
   if
    local.get $0
    local.get $6
    i32.add
    global.set $~lib/rt/stub/offset
    local.get $1
    local.get $6
    i32.store
   end
  end
  local.get $0
  i32.const 4
  i32.sub
  local.get $2
  i32.store offset=16
  local.get $0
  i32.const 16
  i32.add
 )
 (func $assembly/index/_start
  (local $0 i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  global.get $assembly/env/env
  local.tee $1
  i32.load
  i32.eqz
  if
   local.get $1
   call $assembly/env/__request_block
   call $~lib/arraybuffer/ArrayBuffer#constructor
   i32.store
   local.get $1
   i32.load
   call $assembly/env/__load_block
  end
  local.get $1
  i32.load
  local.tee $1
  i32.const 20
  i32.sub
  i32.load offset=16
  local.set $2
  i32.const 8
  i32.const 21
  call $~lib/rt/stub/__new
  local.tee $3
  i32.const 0
  i32.store
  local.get $3
  i32.const 0
  i32.store offset=4
  local.get $3
  local.get $1
  i32.store
  local.get $3
  local.get $2
  i32.store offset=4
  local.get $3
  i32.load
  local.set $1
  local.get $3
  i32.load offset=4
  local.tee $2
  i32.const 1
  i32.shl
  i32.const 2
  i32.add
  call $~lib/arraybuffer/ArrayBuffer#constructor
  local.tee $3
  i32.const 30768
  i32.store16
  loop $for-loop|0
   local.get $0
   local.get $2
   i32.lt_u
   if
    local.get $3
    i32.const 2
    i32.add
    local.get $0
    i32.const 1
    i32.shl
    i32.add
    local.get $0
    local.get $1
    i32.add
    i32.load8_u
    i32.const 1
    i32.shl
    i32.const 1056
    i32.add
    i32.load16_u
    i32.store16
    local.get $0
    i32.const 1
    i32.add
    local.set $0
    br $for-loop|0
   end
  end
  local.get $3
  call $~lib/string/String.UTF8.decode
  call $~lib/bindings/dom/console.log
 )
 (func $~start
  (local $0 i32)
  i32.const 4412
  global.set $~lib/rt/stub/offset
  i32.const 0
  i32.const 5
  call $~lib/rt/stub/__new
  i32.eqz
  if
   i32.const 0
   i32.const 0
   call $~lib/rt/stub/__new
   drop
  end
  call $"~lib/map/Map<~lib/string/String,~lib/arraybuffer/ArrayBuffer>#constructor"
  call $"~lib/map/Map<~lib/string/String,~lib/arraybuffer/ArrayBuffer>#constructor"
  i32.const 2720
  call $~lib/metashrew-as/assembly/indexer/tables/IndexPointer.for
  i32.const 2896
  call $~lib/metashrew-as/assembly/indexer/tables/IndexPointer.for
  i32.const 2960
  call $~lib/metashrew-as/assembly/indexer/tables/IndexPointer.for
  i32.const 3024
  call $~lib/metashrew-as/assembly/indexer/tables/IndexPointer.for
  i32.const 3088
  call $~lib/metashrew-as/assembly/indexer/tables/IndexPointer.for
  i32.const 3152
  call $~lib/metashrew-as/assembly/indexer/tables/IndexPointer.for
  i32.const 3200
  call $~lib/metashrew-as/assembly/indexer/tables/IndexPointer.for
  i32.const 3248
  call $~lib/metashrew-as/assembly/indexer/tables/IndexPointer.for
  i32.const 3296
  call $~lib/metashrew-as/assembly/indexer/tables/IndexPointer.for
  i32.const 3360
  call $~lib/metashrew-as/assembly/indexer/tables/IndexPointer.for
  i32.const 3424
  call $~lib/metashrew-as/assembly/indexer/tables/IndexPointer.for
  i32.const 3488
  call $~lib/metashrew-as/assembly/indexer/tables/IndexPointer.for
  i32.const 3552
  call $~lib/metashrew-as/assembly/indexer/tables/IndexPointer.for
  i32.const 3600
  call $~lib/metashrew-as/assembly/indexer/tables/IndexPointer.for
  i32.const 3680
  call $~lib/metashrew-as/assembly/indexer/tables/IndexPointer.for
  i32.const 3744
  call $~lib/metashrew-as/assembly/indexer/tables/IndexPointer.for
  i32.const 3808
  call $~lib/metashrew-as/assembly/indexer/tables/IndexPointer.for
  i32.const 3872
  call $~lib/metashrew-as/assembly/indexer/tables/IndexPointer.for
  i32.const 3920
  call $~lib/metashrew-as/assembly/indexer/tables/IndexPointer.for
  i32.const 3984
  call $~lib/metashrew-as/assembly/indexer/tables/IndexPointer.for
  i32.const 4048
  call $~lib/as-bignum/assembly/utils/atou128
  i32.const 16
  i32.const 8
  call $~lib/rt/stub/__new
  local.tee $0
  i64.const 26
  i64.store
  local.get $0
  i64.const 0
  i64.store offset=8
  i32.const 4336
  call $~lib/as-bignum/assembly/utils/atou128
  i32.const 0
  i32.const 14
  call $~lib/rt/stub/__new
  i32.eqz
  if
   i32.const 0
   i32.const 0
   call $~lib/rt/stub/__new
   drop
  end
  i32.const 16
  i32.const 15
  call $~lib/rt/stub/__new
  local.tee $0
  i32.const 0
  i32.store
  local.get $0
  i32.const 0
  i32.store offset=4
  local.get $0
  i32.const 0
  i32.store offset=8
  local.get $0
  i32.const 0
  i32.store offset=12
  local.get $0
  i32.const 0
  i32.store
  local.get $0
  i32.const 0
  i32.store offset=4
  local.get $0
  i32.const 0
  i32.store offset=8
  local.get $0
  i32.const 0
  i32.store offset=12
  local.get $0
  global.set $assembly/env/env
 )
)
