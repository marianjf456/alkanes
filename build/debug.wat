(module
 (type $0 (func (param i32) (result i32)))
 (type $1 (func (param i32 i32)))
 (type $2 (func))
 (type $3 (func (param i32 i32) (result i32)))
 (type $4 (func (param i32)))
 (type $5 (func (param i32 i32 i32) (result i32)))
 (type $6 (func (param i32 i64)))
 (type $7 (func (param i32) (result i64)))
 (type $8 (func (result i32)))
 (type $9 (func (param i32 i32 i32 i32)))
 (type $10 (func (param i32 i32 i32)))
 (type $11 (func (param i32 i32 i32 i32 i32) (result i32)))
 (type $12 (func (param i32 i64 i64) (result i32)))
 (type $13 (func (param i64 i64 i64 i64) (result i64)))
 (import "env" "abort" (func $~lib/builtins/abort (param i32 i32 i32 i32)))
 (import "env" "__request_block" (func $assembly/env/__request_block (result i32)))
 (import "env" "__load_block" (func $assembly/env/__load_block (param i32)))
 (import "env" "console.log" (func $~lib/bindings/dom/console.log (param i32)))
 (global $~lib/metashrew-as/assembly/utils/hex/hexLookupTable i32 (i32.const 32))
 (global $~lib/rt/stub/startOffset (mut i32) (i32.const 0))
 (global $~lib/rt/stub/offset (mut i32) (i32.const 0))
 (global $~lib/metashrew-as/assembly/utils/logging/console (mut i32) (i32.const 0))
 (global $~lib/fast-sha256-as/assembly/hex/hexLookupTable i32 (i32.const 704))
 (global $~lib/fast-sha256-as/assembly/sha256/K i32 (i32.const 1536))
 (global $~lib/shared/runtime/Runtime.Stub i32 (i32.const 0))
 (global $~lib/shared/runtime/Runtime.Minimal i32 (i32.const 1))
 (global $~lib/shared/runtime/Runtime.Incremental i32 (i32.const 2))
 (global $~lib/native/ASC_RUNTIME i32 (i32.const 0))
 (global $~lib/metashrew-as/assembly/indexer/index/_updates (mut i32) (i32.const 0))
 (global $~lib/metashrew-as/assembly/indexer/index/_updateKeys (mut i32) (i32.const 0))
 (global $~lib/metashrew-as/assembly/indexer/index/BUFFER_SIZE i32 (i32.const 1048576))
 (global $~lib/metashrew-as/assembly/indexer/index/_filled (mut i32) (i32.const 0))
 (global $~lib/metashrew-runes/assembly/indexer/constants/index/RUNESTONE_TAG i32 (i32.const 23914))
 (global $~lib/metashrew-runes/assembly/indexer/constants/index/OP_RETURN i32 (i32.const 106))
 (global $~lib/metashrew-runes/assembly/indexer/constants/index/GENESIS i32 (i32.const 840000))
 (global $~argumentsLength (mut i32) (i32.const 0))
 (global $~lib/metashrew-runes/assembly/indexer/constants/index/HEIGHT_TO_BLOCKHASH (mut i32) (i32.const 0))
 (global $~lib/metashrew-runes/assembly/indexer/constants/index/BLOCKHASH_TO_HEIGHT (mut i32) (i32.const 0))
 (global $~lib/metashrew-runes/assembly/indexer/constants/index/OUTPOINT_TO_RUNES (mut i32) (i32.const 0))
 (global $~lib/metashrew-runes/assembly/indexer/constants/index/OUTPOINT_TO_HEIGHT (mut i32) (i32.const 0))
 (global $~lib/metashrew-runes/assembly/indexer/constants/index/HEIGHT_TO_TRANSACTION_IDS (mut i32) (i32.const 0))
 (global $~lib/metashrew-runes/assembly/indexer/constants/index/SYMBOL (mut i32) (i32.const 0))
 (global $~lib/metashrew-runes/assembly/indexer/constants/index/CAP (mut i32) (i32.const 0))
 (global $~lib/metashrew-runes/assembly/indexer/constants/index/SPACERS (mut i32) (i32.const 0))
 (global $~lib/metashrew-runes/assembly/indexer/constants/index/OFFSETEND (mut i32) (i32.const 0))
 (global $~lib/metashrew-runes/assembly/indexer/constants/index/OFFSETSTART (mut i32) (i32.const 0))
 (global $~lib/metashrew-runes/assembly/indexer/constants/index/HEIGHTSTART (mut i32) (i32.const 0))
 (global $~lib/metashrew-runes/assembly/indexer/constants/index/HEIGHTEND (mut i32) (i32.const 0))
 (global $~lib/metashrew-runes/assembly/indexer/constants/index/AMOUNT (mut i32) (i32.const 0))
 (global $~lib/metashrew-runes/assembly/indexer/constants/index/MINTS_REMAINING (mut i32) (i32.const 0))
 (global $~lib/metashrew-runes/assembly/indexer/constants/index/PREMINE (mut i32) (i32.const 0))
 (global $~lib/metashrew-runes/assembly/indexer/constants/index/DIVISIBILITY (mut i32) (i32.const 0))
 (global $~lib/metashrew-runes/assembly/indexer/constants/index/RUNE_ID_TO_HEIGHT (mut i32) (i32.const 0))
 (global $~lib/metashrew-runes/assembly/indexer/constants/index/ETCHINGS (mut i32) (i32.const 0))
 (global $~lib/metashrew-runes/assembly/indexer/constants/index/RUNE_ID_TO_ETCHING (mut i32) (i32.const 0))
 (global $~lib/metashrew-runes/assembly/indexer/constants/index/ETCHING_TO_RUNE_ID (mut i32) (i32.const 0))
 (global $~lib/as-bignum/assembly/utils/RadixCharsTable i32 (i32.const 3212))
 (global $~lib/native/ASC_SHRINK_LEVEL i32 (i32.const 0))
 (global $~lib/as-bignum/assembly/globals/__res128_hi (mut i64) (i64.const 0))
 (global $~lib/metashrew-runes/assembly/indexer/constants/index/MINIMUM_NAME (mut i32) (i32.const 0))
 (global $~lib/metashrew-runes/assembly/indexer/constants/index/TWENTY_SIX (mut i32) (i32.const 0))
 (global $~lib/metashrew-runes/assembly/indexer/constants/index/RESERVED_NAME (mut i32) (i32.const 0))
 (global $~lib/metashrew-runes/assembly/indexer/constants/index/SUBSIDY_HALVING_INTERVAL i64 (i64.const 210000))
 (global $~lib/metashrew-runes/assembly/indexer/constants/index/HEIGHT_INTERVAL i64 (i64.const 17500))
 (global $~lib/metashrew-runes/assembly/indexer/constants/index/MAX_BYTES_LEB128_INT i32 (i32.const 18))
 (global $~lib/metashrew-as/assembly/utils/constant/CYCLE_EPOCHS i32 (i32.const 6))
 (global $~lib/metashrew-as/assembly/utils/constant/SUBSIDY_HALVING_INTERVAL i32 (i32.const 210000))
 (global $~lib/metashrew-as/assembly/utils/constant/COIN_VALUE i32 (i32.const 100000000))
 (global $~lib/metashrew-as/assembly/utils/constant/DIFFCHANGE_INTERVAL i32 (i32.const 2016))
 (global $~lib/metashrew-as/assembly/utils/constant/COINBASE_MATURITY i32 (i32.const 100))
 (global $~lib/metashrew-as/assembly/utils/opcodes/OP_FALSE i32 (i32.const 0))
 (global $~lib/metashrew-as/assembly/utils/opcodes/OP_PUSHDATA1 i32 (i32.const 76))
 (global $~lib/metashrew-as/assembly/utils/opcodes/OP_PUSHDATA2 i32 (i32.const 77))
 (global $~lib/metashrew-as/assembly/utils/opcodes/OP_PUSHDATA4 i32 (i32.const 78))
 (global $~lib/metashrew-as/assembly/utils/opcodes/OP_IF i32 (i32.const 99))
 (global $~lib/metashrew-as/assembly/utils/opcodes/OP_NOTIF i32 (i32.const 100))
 (global $~lib/metashrew-as/assembly/utils/opcodes/OP_ELSE i32 (i32.const 103))
 (global $~lib/metashrew-as/assembly/utils/opcodes/OP_ENDIF i32 (i32.const 104))
 (global $~lib/metashrew-as/assembly/utils/opcodes/OP_VERIFY i32 (i32.const 105))
 (global $~lib/metashrew-as/assembly/utils/opcodes/OP_RETURN i32 (i32.const 106))
 (global $~lib/metashrew-as/assembly/utils/opcodes/OP_1 i32 (i32.const 81))
 (global $~lib/metashrew-as/assembly/utils/yabsp/console (mut i32) (i32.const 0))
 (global $~lib/protorune/assembly/indexer/ProtoruneRuneId/ProtoruneRuneId.MAX_LEB_SIZE_BYTES i32 (i32.const 31))
 (global $assembly/env/env (mut i32) (i32.const 0))
 (global $~lib/memory/__heap_base i32 (i32.const 3388))
 (memory $0 1 32768)
 (data $0 (i32.const 12) "\1c\02\00\00\00\00\00\00\00\00\00\00\04\00\00\00\00\02\00\00000102030405060708090a0b0c0d0e0f101112131415161718191a1b1c1d1e1f202122232425262728292a2b2c2d2e2f303132333435363738393a3b3c3d3e3f404142434445464748494a4b4c4d4e4f505152535455565758595a5b5c5d5e5f606162636465666768696a6b6c6d6e6f707172737475767778797a7b7c7d7e7f808182838485868788898a8b8c8d8e8f909192939495969798999a9b9c9d9e9fa0a1a2a3a4a5a6a7a8a9aaabacadaeafb0b1b2b3b4b5b6b7b8b9babbbcbdbebfc0c1c2c3c4c5c6c7c8c9cacbcccdcecfd0d1d2d3d4d5d6d7d8d9dadbdcdddedfe0e1e2e3e4e5e6e7e8e9eaebecedeeeff0f1f2f3f4f5f6f7f8f9fafbfcfdfeff\00\00\00\00\00\00\00\00\00\00\00\00")
 (data $1 (i32.const 556) "<\00\00\00\00\00\00\00\00\00\00\00\02\00\00\00(\00\00\00A\00l\00l\00o\00c\00a\00t\00i\00o\00n\00 \00t\00o\00o\00 \00l\00a\00r\00g\00e\00\00\00\00\00")
 (data $2 (i32.const 620) "<\00\00\00\00\00\00\00\00\00\00\00\02\00\00\00\1e\00\00\00~\00l\00i\00b\00/\00r\00t\00/\00s\00t\00u\00b\00.\00t\00s\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00")
 (data $3 (i32.const 684) "\1c\02\00\00\00\00\00\00\00\00\00\00\04\00\00\00\00\02\00\00000102030405060708090a0b0c0d0e0f101112131415161718191a1b1c1d1e1f202122232425262728292a2b2c2d2e2f303132333435363738393a3b3c3d3e3f404142434445464748494a4b4c4d4e4f505152535455565758595a5b5c5d5e5f606162636465666768696a6b6c6d6e6f707172737475767778797a7b7c7d7e7f808182838485868788898a8b8c8d8e8f909192939495969798999a9b9c9d9e9fa0a1a2a3a4a5a6a7a8a9aaabacadaeafb0b1b2b3b4b5b6b7b8b9babbbcbdbebfc0c1c2c3c4c5c6c7c8c9cacbcccdcecfd0d1d2d3d4d5d6d7d8d9dadbdcdddedfe0e1e2e3e4e5e6e7e8e9eaebecedeeeff0f1f2f3f4f5f6f7f8f9fafbfcfdfeff\00\00\00\00\00\00\00\00\00\00\00\00")
 (data $4 (i32.const 1228) "\1c\01\00\00\00\00\00\00\00\00\00\00\01\00\00\00\00\01\00\00\98/\8aB\91D7q\cf\fb\c0\b5\a5\db\b5\e9[\c2V9\f1\11\f1Y\a4\82?\92\d5^\1c\ab\98\aa\07\d8\01[\83\12\be\851$\c3}\0cUt]\ber\fe\b1\de\80\a7\06\dc\9bt\f1\9b\c1\c1i\9b\e4\86G\be\ef\c6\9d\c1\0f\cc\a1\0c$o,\e9-\aa\84tJ\dc\a9\b0\\\da\88\f9vRQ>\98m\c61\a8\c8\'\03\b0\c7\7fY\bf\f3\0b\e0\c6G\91\a7\d5Qc\ca\06g))\14\85\n\b7\'8!\1b.\fcm,M\13\r8STs\ne\bb\njv.\c9\c2\81\85,r\92\a1\e8\bf\a2Kf\1a\a8p\8bK\c2\a3Ql\c7\19\e8\92\d1$\06\99\d6\855\0e\f4p\a0j\10\16\c1\a4\19\08l7\1eLwH\'\b5\bc\b04\b3\0c\1c9J\aa\d8NO\ca\9c[\f3o.h\ee\82\8ftoc\a5x\14x\c8\84\08\02\c7\8c\fa\ff\be\90\eblP\a4\f7\a3\f9\be\f2xq\c6\00\00\00\00\00\00\00\00\00\00\00\00")
 (data $5 (i32.const 1516) ",\00\00\00\00\00\00\00\00\00\00\00\06\00\00\00\10\00\00\00\e0\04\00\00\e0\04\00\00\00\01\00\00@\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00")
 (data $6 (i32.const 1564) ",\00\00\00\00\00\00\00\00\00\00\00\02\00\00\00\1c\00\00\00I\00n\00v\00a\00l\00i\00d\00 \00l\00e\00n\00g\00t\00h\00")
 (data $7 (i32.const 1612) "<\00\00\00\00\00\00\00\00\00\00\00\02\00\00\00&\00\00\00~\00l\00i\00b\00/\00a\00r\00r\00a\00y\00b\00u\00f\00f\00e\00r\00.\00t\00s\00\00\00\00\00\00\00")
 (data $8 (i32.const 1676) "<\00\00\00\00\00\00\00\00\00\00\00\02\00\00\00(\00\00\00/\00b\00l\00o\00c\00k\00h\00a\00s\00h\00/\00b\00y\00h\00e\00i\00g\00h\00t\00/\00\00\00\00\00")
 (data $9 (i32.const 1740) "<\00\00\00\00\00\00\00\00\00\00\00\02\00\00\00$\00\00\00U\00n\00p\00a\00i\00r\00e\00d\00 \00s\00u\00r\00r\00o\00g\00a\00t\00e\00\00\00\00\00\00\00\00\00")
 (data $10 (i32.const 1804) ",\00\00\00\00\00\00\00\00\00\00\00\02\00\00\00\1c\00\00\00~\00l\00i\00b\00/\00s\00t\00r\00i\00n\00g\00.\00t\00s\00")
 (data $11 (i32.const 1852) "<\00\00\00\00\00\00\00\00\00\00\00\02\00\00\00(\00\00\00/\00h\00e\00i\00g\00h\00t\00/\00b\00y\00b\00l\00o\00c\00k\00h\00a\00s\00h\00/\00\00\00\00\00")
 (data $12 (i32.const 1916) "<\00\00\00\00\00\00\00\00\00\00\00\02\00\00\00$\00\00\00/\00r\00u\00n\00e\00s\00/\00b\00y\00o\00u\00t\00p\00o\00i\00n\00t\00/\00\00\00\00\00\00\00\00\00")
 (data $13 (i32.const 1980) "<\00\00\00\00\00\00\00\00\00\00\00\02\00\00\00&\00\00\00/\00h\00e\00i\00g\00h\00t\00/\00b\00y\00o\00u\00t\00p\00o\00i\00n\00t\00/\00\00\00\00\00\00\00")
 (data $14 (i32.const 2044) "<\00\00\00\00\00\00\00\00\00\00\00\02\00\00\00\1e\00\00\00/\00t\00x\00i\00d\00s\00/\00b\00y\00h\00e\00i\00g\00h\00t\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00")
 (data $15 (i32.const 2108) ",\00\00\00\00\00\00\00\00\00\00\00\02\00\00\00\1c\00\00\00/\00r\00u\00n\00e\00s\00/\00s\00y\00m\00b\00o\00l\00/\00")
 (data $16 (i32.const 2156) ",\00\00\00\00\00\00\00\00\00\00\00\02\00\00\00\16\00\00\00/\00r\00u\00n\00e\00s\00/\00c\00a\00p\00/\00\00\00\00\00\00\00")
 (data $17 (i32.const 2204) ",\00\00\00\00\00\00\00\00\00\00\00\02\00\00\00\1c\00\00\00/\00r\00u\00n\00e\00s\00/\00s\00p\00a\00c\00e\00s\00/\00")
 (data $18 (i32.const 2252) "<\00\00\00\00\00\00\00\00\00\00\00\02\00\00\00$\00\00\00/\00r\00u\00n\00e\00s\00/\00o\00f\00f\00s\00e\00t\00/\00e\00n\00d\00/\00\00\00\00\00\00\00\00\00")
 (data $19 (i32.const 2316) "<\00\00\00\00\00\00\00\00\00\00\00\02\00\00\00(\00\00\00/\00r\00u\00n\00e\00s\00/\00o\00f\00f\00s\00e\00t\00/\00s\00t\00a\00r\00t\00/\00\00\00\00\00")
 (data $20 (i32.const 2380) "<\00\00\00\00\00\00\00\00\00\00\00\02\00\00\00(\00\00\00/\00r\00u\00n\00e\00s\00/\00h\00e\00i\00g\00h\00t\00/\00s\00t\00a\00r\00t\00/\00\00\00\00\00")
 (data $21 (i32.const 2444) "<\00\00\00\00\00\00\00\00\00\00\00\02\00\00\00$\00\00\00/\00r\00u\00n\00e\00s\00/\00h\00e\00i\00g\00h\00t\00/\00e\00n\00d\00/\00\00\00\00\00\00\00\00\00")
 (data $22 (i32.const 2508) ",\00\00\00\00\00\00\00\00\00\00\00\02\00\00\00\1c\00\00\00/\00r\00u\00n\00e\00s\00/\00a\00m\00o\00u\00n\00t\00/\00")
 (data $23 (i32.const 2556) "L\00\00\00\00\00\00\00\00\00\00\00\02\00\00\00.\00\00\00/\00r\00u\00n\00e\00s\00/\00m\00i\00n\00t\00s\00-\00r\00e\00m\00a\00i\00n\00i\00n\00g\00/\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00")
 (data $24 (i32.const 2636) "<\00\00\00\00\00\00\00\00\00\00\00\02\00\00\00\1e\00\00\00/\00r\00u\00n\00e\00s\00/\00p\00r\00e\00m\00i\00n\00e\00/\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00")
 (data $25 (i32.const 2700) "<\00\00\00\00\00\00\00\00\00\00\00\02\00\00\00(\00\00\00/\00r\00u\00n\00e\00s\00/\00d\00i\00v\00i\00s\00i\00b\00i\00l\00i\00t\00y\00/\00\00\00\00\00")
 (data $26 (i32.const 2764) "<\00\00\00\00\00\00\00\00\00\00\00\02\00\00\00\"\00\00\00/\00h\00e\00i\00g\00h\00t\00/\00b\00y\00r\00u\00n\00e\00i\00d\00/\00\00\00\00\00\00\00\00\00\00\00")
 (data $27 (i32.const 2828) ",\00\00\00\00\00\00\00\00\00\00\00\02\00\00\00\18\00\00\00/\00r\00u\00n\00e\00s\00/\00n\00a\00m\00e\00s\00\00\00\00\00")
 (data $28 (i32.const 2876) "<\00\00\00\00\00\00\00\00\00\00\00\02\00\00\00$\00\00\00/\00e\00t\00c\00h\00i\00n\00g\00/\00b\00y\00r\00u\00n\00e\00i\00d\00/\00\00\00\00\00\00\00\00\00")
 (data $29 (i32.const 2940) "<\00\00\00\00\00\00\00\00\00\00\00\02\00\00\00$\00\00\00/\00r\00u\00n\00e\00i\00d\00/\00b\00y\00e\00t\00c\00h\00i\00n\00g\00/\00\00\00\00\00\00\00\00\00")
 (data $30 (i32.const 3004) "<\00\00\00\00\00\00\00\00\00\00\00\02\00\00\00\"\00\00\009\009\002\004\006\001\001\004\009\002\008\001\004\009\004\006\002\00\00\00\00\00\00\00\00\00\00\00")
 (data $31 (i32.const 3068) ",\00\00\00\00\00\00\00\00\00\00\00\02\00\00\00\1a\00\00\00I\00n\00v\00a\00l\00i\00d\00 \00r\00a\00d\00i\00x\00\00\00")
 (data $32 (i32.const 3116) "\\\00\00\00\00\00\00\00\00\00\00\00\02\00\00\00@\00\00\00~\00l\00i\00b\00/\00a\00s\00-\00b\00i\00g\00n\00u\00m\00/\00a\00s\00s\00e\00m\00b\00l\00y\00/\00u\00t\00i\00l\00s\00.\00t\00s\00\00\00\00\00\00\00\00\00\00\00\00\00")
 (data $33 (i32.const 3212) "\00\01\02\03\04\05\06\07\08\t$$$$$$$\n\0b\0c\r\0e\0f\10\11\12\13\14\15\16\17\18\19\1a\1b\1c\1d\1e\1f !\"#$$$$$$\n\0b\0c\r\0e\0f\10\11\12\13\14\15\16\17\18\19\1a\1b\1c\1d\1e\1f !\"#")
 (data $34 (i32.const 3292) "\\\00\00\00\00\00\00\00\00\00\00\00\02\00\00\00J\00\00\006\004\000\002\003\006\004\003\006\003\004\001\005\004\004\003\006\000\003\002\002\008\005\004\001\002\005\009\009\003\006\002\001\001\009\002\006\00\00\00")
 (table $0 1 1 funcref)
 (elem $0 (i32.const 1))
 (export "__execute" (func $assembly/index/__execute))
 (export "memory" (memory $0))
 (start $~start)
 (func $~lib/rt/stub/maybeGrowMemory (param $newOffset i32)
  (local $pagesBefore i32)
  (local $maxOffset i32)
  (local $pagesNeeded i32)
  (local $4 i32)
  (local $5 i32)
  (local $pagesWanted i32)
  memory.size
  local.set $pagesBefore
  local.get $pagesBefore
  i32.const 16
  i32.shl
  i32.const 15
  i32.add
  i32.const 15
  i32.const -1
  i32.xor
  i32.and
  local.set $maxOffset
  local.get $newOffset
  local.get $maxOffset
  i32.gt_u
  if
   local.get $newOffset
   local.get $maxOffset
   i32.sub
   i32.const 65535
   i32.add
   i32.const 65535
   i32.const -1
   i32.xor
   i32.and
   i32.const 16
   i32.shr_u
   local.set $pagesNeeded
   local.get $pagesBefore
   local.tee $4
   local.get $pagesNeeded
   local.tee $5
   local.get $4
   local.get $5
   i32.gt_s
   select
   local.set $pagesWanted
   local.get $pagesWanted
   memory.grow
   i32.const 0
   i32.lt_s
   if
    local.get $pagesNeeded
    memory.grow
    i32.const 0
    i32.lt_s
    if
     unreachable
    end
   end
  end
  local.get $newOffset
  global.set $~lib/rt/stub/offset
 )
 (func $~lib/rt/common/BLOCK#set:mmInfo (param $this i32) (param $mmInfo i32)
  local.get $this
  local.get $mmInfo
  i32.store
 )
 (func $~lib/rt/stub/__alloc (param $size i32) (result i32)
  (local $block i32)
  (local $ptr i32)
  (local $size|3 i32)
  (local $payloadSize i32)
  local.get $size
  i32.const 1073741820
  i32.gt_u
  if
   i32.const 576
   i32.const 640
   i32.const 33
   i32.const 29
   call $~lib/builtins/abort
   unreachable
  end
  global.get $~lib/rt/stub/offset
  local.set $block
  global.get $~lib/rt/stub/offset
  i32.const 4
  i32.add
  local.set $ptr
  block $~lib/rt/stub/computeSize|inlined.0 (result i32)
   local.get $size
   local.set $size|3
   local.get $size|3
   i32.const 4
   i32.add
   i32.const 15
   i32.add
   i32.const 15
   i32.const -1
   i32.xor
   i32.and
   i32.const 4
   i32.sub
   br $~lib/rt/stub/computeSize|inlined.0
  end
  local.set $payloadSize
  local.get $ptr
  local.get $payloadSize
  i32.add
  call $~lib/rt/stub/maybeGrowMemory
  local.get $block
  local.get $payloadSize
  call $~lib/rt/common/BLOCK#set:mmInfo
  local.get $ptr
  return
 )
 (func $~lib/rt/common/OBJECT#set:gcInfo (param $this i32) (param $gcInfo i32)
  local.get $this
  local.get $gcInfo
  i32.store offset=4
 )
 (func $~lib/rt/common/OBJECT#set:gcInfo2 (param $this i32) (param $gcInfo2 i32)
  local.get $this
  local.get $gcInfo2
  i32.store offset=8
 )
 (func $~lib/rt/common/OBJECT#set:rtId (param $this i32) (param $rtId i32)
  local.get $this
  local.get $rtId
  i32.store offset=12
 )
 (func $~lib/rt/common/OBJECT#set:rtSize (param $this i32) (param $rtSize i32)
  local.get $this
  local.get $rtSize
  i32.store offset=16
 )
 (func $~lib/rt/stub/__new (param $size i32) (param $id i32) (result i32)
  (local $ptr i32)
  (local $object i32)
  local.get $size
  i32.const 1073741804
  i32.gt_u
  if
   i32.const 576
   i32.const 640
   i32.const 86
   i32.const 30
   call $~lib/builtins/abort
   unreachable
  end
  i32.const 16
  local.get $size
  i32.add
  call $~lib/rt/stub/__alloc
  local.set $ptr
  local.get $ptr
  i32.const 4
  i32.sub
  local.set $object
  local.get $object
  i32.const 0
  call $~lib/rt/common/OBJECT#set:gcInfo
  local.get $object
  i32.const 0
  call $~lib/rt/common/OBJECT#set:gcInfo2
  local.get $object
  local.get $id
  call $~lib/rt/common/OBJECT#set:rtId
  local.get $object
  local.get $size
  call $~lib/rt/common/OBJECT#set:rtSize
  local.get $ptr
  i32.const 16
  i32.add
  return
 )
 (func $~lib/object/Object#constructor (param $this i32) (result i32)
  local.get $this
  i32.eqz
  if
   i32.const 0
   i32.const 0
   call $~lib/rt/stub/__new
   local.set $this
  end
  local.get $this
 )
 (func $~lib/metashrew-as/assembly/utils/logging/Console#constructor (param $this i32) (result i32)
  local.get $this
  i32.eqz
  if
   i32.const 0
   i32.const 5
   call $~lib/rt/stub/__new
   local.set $this
  end
  local.get $this
  call $~lib/object/Object#constructor
  local.set $this
  local.get $this
 )
 (func $start:~lib/metashrew-as/assembly/utils/logging
  global.get $~lib/memory/__heap_base
  i32.const 4
  i32.add
  i32.const 15
  i32.add
  i32.const 15
  i32.const -1
  i32.xor
  i32.and
  i32.const 4
  i32.sub
  global.set $~lib/rt/stub/startOffset
  global.get $~lib/rt/stub/startOffset
  global.set $~lib/rt/stub/offset
  i32.const 0
  call $~lib/metashrew-as/assembly/utils/logging/Console#constructor
  global.set $~lib/metashrew-as/assembly/utils/logging/console
 )
 (func $start:~lib/metashrew-as/assembly/utils/utils
  call $start:~lib/metashrew-as/assembly/utils/logging
 )
 (func $start:~lib/metashrew-as/assembly/utils/sha256
  call $start:~lib/metashrew-as/assembly/utils/utils
 )
 (func $~lib/arraybuffer/ArrayBuffer#constructor (param $this i32) (param $length i32) (result i32)
  (local $buffer i32)
  local.get $length
  i32.const 1073741820
  i32.gt_u
  if
   i32.const 1584
   i32.const 1632
   i32.const 52
   i32.const 43
   call $~lib/builtins/abort
   unreachable
  end
  local.get $length
  i32.const 1
  call $~lib/rt/stub/__new
  local.set $buffer
  i32.const 0
  global.get $~lib/shared/runtime/Runtime.Incremental
  i32.ne
  drop
  local.get $buffer
  i32.const 0
  local.get $length
  memory.fill
  local.get $buffer
  return
 )
 (func $~lib/rt/stub/__link (param $parentPtr i32) (param $childPtr i32) (param $expectMultiple i32)
 )
 (func $"~lib/map/Map<~lib/string/String,~lib/arraybuffer/ArrayBuffer>#set:buckets" (param $this i32) (param $buckets i32)
  local.get $this
  local.get $buckets
  i32.store
  local.get $this
  local.get $buckets
  i32.const 0
  call $~lib/rt/stub/__link
 )
 (func $"~lib/map/Map<~lib/string/String,~lib/arraybuffer/ArrayBuffer>#set:bucketsMask" (param $this i32) (param $bucketsMask i32)
  local.get $this
  local.get $bucketsMask
  i32.store offset=4
 )
 (func $"~lib/map/Map<~lib/string/String,~lib/arraybuffer/ArrayBuffer>#set:entries" (param $this i32) (param $entries i32)
  local.get $this
  local.get $entries
  i32.store offset=8
  local.get $this
  local.get $entries
  i32.const 0
  call $~lib/rt/stub/__link
 )
 (func $"~lib/map/Map<~lib/string/String,~lib/arraybuffer/ArrayBuffer>#set:entriesCapacity" (param $this i32) (param $entriesCapacity i32)
  local.get $this
  local.get $entriesCapacity
  i32.store offset=12
 )
 (func $"~lib/map/Map<~lib/string/String,~lib/arraybuffer/ArrayBuffer>#set:entriesOffset" (param $this i32) (param $entriesOffset i32)
  local.get $this
  local.get $entriesOffset
  i32.store offset=16
 )
 (func $"~lib/map/Map<~lib/string/String,~lib/arraybuffer/ArrayBuffer>#set:entriesCount" (param $this i32) (param $entriesCount i32)
  local.get $this
  local.get $entriesCount
  i32.store offset=20
 )
 (func $"~lib/map/Map<~lib/string/String,~lib/arraybuffer/ArrayBuffer>#constructor" (param $this i32) (result i32)
  local.get $this
  i32.eqz
  if
   i32.const 24
   i32.const 7
   call $~lib/rt/stub/__new
   local.set $this
  end
  local.get $this
  i32.const 0
  i32.const 4
  i32.const 4
  i32.mul
  call $~lib/arraybuffer/ArrayBuffer#constructor
  call $"~lib/map/Map<~lib/string/String,~lib/arraybuffer/ArrayBuffer>#set:buckets"
  local.get $this
  i32.const 4
  i32.const 1
  i32.sub
  call $"~lib/map/Map<~lib/string/String,~lib/arraybuffer/ArrayBuffer>#set:bucketsMask"
  local.get $this
  i32.const 0
  i32.const 4
  block $"~lib/map/ENTRY_SIZE<~lib/string/String,~lib/arraybuffer/ArrayBuffer>|inlined.0" (result i32)
   i32.const 12
   br $"~lib/map/ENTRY_SIZE<~lib/string/String,~lib/arraybuffer/ArrayBuffer>|inlined.0"
  end
  i32.mul
  call $~lib/arraybuffer/ArrayBuffer#constructor
  call $"~lib/map/Map<~lib/string/String,~lib/arraybuffer/ArrayBuffer>#set:entries"
  local.get $this
  i32.const 4
  call $"~lib/map/Map<~lib/string/String,~lib/arraybuffer/ArrayBuffer>#set:entriesCapacity"
  local.get $this
  i32.const 0
  call $"~lib/map/Map<~lib/string/String,~lib/arraybuffer/ArrayBuffer>#set:entriesOffset"
  local.get $this
  i32.const 0
  call $"~lib/map/Map<~lib/string/String,~lib/arraybuffer/ArrayBuffer>#set:entriesCount"
  local.get $this
 )
 (func $start:~lib/metashrew-as/assembly/indexer/index
  call $start:~lib/metashrew-as/assembly/utils/sha256
  i32.const 0
  call $"~lib/map/Map<~lib/string/String,~lib/arraybuffer/ArrayBuffer>#constructor"
  global.set $~lib/metashrew-as/assembly/indexer/index/_updates
  i32.const 0
  call $"~lib/map/Map<~lib/string/String,~lib/arraybuffer/ArrayBuffer>#constructor"
  global.set $~lib/metashrew-as/assembly/indexer/index/_updateKeys
 )
 (func $start:~lib/metashrew-as/assembly/indexer/tables
  call $start:~lib/metashrew-as/assembly/indexer/index
 )
 (func $~lib/rt/common/OBJECT#get:rtSize (param $this i32) (result i32)
  local.get $this
  i32.load offset=16
 )
 (func $~lib/string/String.UTF8.byteLength (param $str i32) (param $nullTerminated i32) (result i32)
  (local $strOff i32)
  (local $strEnd i32)
  (local $bufLen i32)
  (local $c1 i32)
  local.get $str
  local.set $strOff
  local.get $strOff
  local.get $str
  i32.const 20
  i32.sub
  call $~lib/rt/common/OBJECT#get:rtSize
  i32.add
  local.set $strEnd
  local.get $nullTerminated
  i32.const 0
  i32.ne
  local.set $bufLen
  block $while-break|0
   loop $while-continue|0
    local.get $strOff
    local.get $strEnd
    i32.lt_u
    if
     local.get $strOff
     i32.load16_u
     local.set $c1
     local.get $c1
     i32.const 128
     i32.lt_u
     if
      local.get $nullTerminated
      local.get $c1
      i32.eqz
      i32.and
      if
       br $while-break|0
      end
      local.get $bufLen
      i32.const 1
      i32.add
      local.set $bufLen
     else
      local.get $c1
      i32.const 2048
      i32.lt_u
      if
       local.get $bufLen
       i32.const 2
       i32.add
       local.set $bufLen
      else
       local.get $c1
       i32.const 64512
       i32.and
       i32.const 55296
       i32.eq
       if (result i32)
        local.get $strOff
        i32.const 2
        i32.add
        local.get $strEnd
        i32.lt_u
       else
        i32.const 0
       end
       if
        local.get $strOff
        i32.load16_u offset=2
        i32.const 64512
        i32.and
        i32.const 56320
        i32.eq
        if
         local.get $bufLen
         i32.const 4
         i32.add
         local.set $bufLen
         local.get $strOff
         i32.const 4
         i32.add
         local.set $strOff
         br $while-continue|0
        end
       end
       local.get $bufLen
       i32.const 3
       i32.add
       local.set $bufLen
      end
     end
     local.get $strOff
     i32.const 2
     i32.add
     local.set $strOff
     br $while-continue|0
    end
   end
  end
  local.get $bufLen
  return
 )
 (func $~lib/string/String#get:length (param $this i32) (result i32)
  local.get $this
  i32.const 20
  i32.sub
  call $~lib/rt/common/OBJECT#get:rtSize
  i32.const 1
  i32.shr_u
  return
 )
 (func $~lib/string/String.UTF8.encodeUnsafe (param $str i32) (param $len i32) (param $buf i32) (param $nullTerminated i32) (param $errorMode i32) (result i32)
  (local $strEnd i32)
  (local $bufOff i32)
  (local $c1 i32)
  (local $b0 i32)
  (local $b1 i32)
  (local $c2 i32)
  (local $b0|11 i32)
  (local $b1|12 i32)
  (local $b2 i32)
  (local $b3 i32)
  (local $b0|15 i32)
  (local $b1|16 i32)
  (local $b2|17 i32)
  (local $18 i32)
  local.get $str
  local.get $len
  i32.const 1
  i32.shl
  i32.add
  local.set $strEnd
  local.get $buf
  local.set $bufOff
  loop $while-continue|0
   local.get $str
   local.get $strEnd
   i32.lt_u
   if
    local.get $str
    i32.load16_u
    local.set $c1
    local.get $c1
    i32.const 128
    i32.lt_u
    if
     local.get $bufOff
     local.get $c1
     i32.store8
     local.get $bufOff
     i32.const 1
     i32.add
     local.set $bufOff
     local.get $nullTerminated
     local.get $c1
     i32.eqz
     i32.and
     if
      local.get $bufOff
      local.get $buf
      i32.sub
      return
     end
    else
     local.get $c1
     i32.const 2048
     i32.lt_u
     if
      local.get $c1
      i32.const 6
      i32.shr_u
      i32.const 192
      i32.or
      local.set $b0
      local.get $c1
      i32.const 63
      i32.and
      i32.const 128
      i32.or
      local.set $b1
      local.get $bufOff
      local.get $b1
      i32.const 8
      i32.shl
      local.get $b0
      i32.or
      i32.store16
      local.get $bufOff
      i32.const 2
      i32.add
      local.set $bufOff
     else
      local.get $c1
      i32.const 63488
      i32.and
      i32.const 55296
      i32.eq
      if
       local.get $c1
       i32.const 56320
       i32.lt_u
       if (result i32)
        local.get $str
        i32.const 2
        i32.add
        local.get $strEnd
        i32.lt_u
       else
        i32.const 0
       end
       if
        local.get $str
        i32.load16_u offset=2
        local.set $c2
        local.get $c2
        i32.const 64512
        i32.and
        i32.const 56320
        i32.eq
        if
         i32.const 65536
         local.get $c1
         i32.const 1023
         i32.and
         i32.const 10
         i32.shl
         i32.add
         local.get $c2
         i32.const 1023
         i32.and
         i32.or
         local.set $c1
         local.get $c1
         i32.const 18
         i32.shr_u
         i32.const 240
         i32.or
         local.set $b0|11
         local.get $c1
         i32.const 12
         i32.shr_u
         i32.const 63
         i32.and
         i32.const 128
         i32.or
         local.set $b1|12
         local.get $c1
         i32.const 6
         i32.shr_u
         i32.const 63
         i32.and
         i32.const 128
         i32.or
         local.set $b2
         local.get $c1
         i32.const 63
         i32.and
         i32.const 128
         i32.or
         local.set $b3
         local.get $bufOff
         local.get $b3
         i32.const 24
         i32.shl
         local.get $b2
         i32.const 16
         i32.shl
         i32.or
         local.get $b1|12
         i32.const 8
         i32.shl
         i32.or
         local.get $b0|11
         i32.or
         i32.store
         local.get $bufOff
         i32.const 4
         i32.add
         local.set $bufOff
         local.get $str
         i32.const 4
         i32.add
         local.set $str
         br $while-continue|0
        end
       end
       local.get $errorMode
       i32.const 0
       i32.ne
       if
        local.get $errorMode
        i32.const 2
        i32.eq
        if
         i32.const 1760
         i32.const 1824
         i32.const 742
         i32.const 49
         call $~lib/builtins/abort
         unreachable
        end
        i32.const 65533
        local.set $c1
       end
      end
      local.get $c1
      i32.const 12
      i32.shr_u
      i32.const 224
      i32.or
      local.set $b0|15
      local.get $c1
      i32.const 6
      i32.shr_u
      i32.const 63
      i32.and
      i32.const 128
      i32.or
      local.set $b1|16
      local.get $c1
      i32.const 63
      i32.and
      i32.const 128
      i32.or
      local.set $b2|17
      local.get $bufOff
      local.get $b1|16
      i32.const 8
      i32.shl
      local.get $b0|15
      i32.or
      i32.store16
      local.get $bufOff
      local.get $b2|17
      i32.store8 offset=2
      local.get $bufOff
      i32.const 3
      i32.add
      local.set $bufOff
     end
    end
    local.get $str
    i32.const 2
    i32.add
    local.set $str
    br $while-continue|0
   end
  end
  local.get $nullTerminated
  if
   local.get $bufOff
   local.tee $18
   i32.const 1
   i32.add
   local.set $bufOff
   local.get $18
   i32.const 0
   i32.store8
  end
  local.get $bufOff
  local.get $buf
  i32.sub
  return
 )
 (func $~lib/string/String.UTF8.encode (param $str i32) (param $nullTerminated i32) (param $errorMode i32) (result i32)
  (local $buf i32)
  local.get $str
  local.get $nullTerminated
  call $~lib/string/String.UTF8.byteLength
  i32.const 1
  call $~lib/rt/stub/__new
  local.set $buf
  local.get $str
  local.get $str
  call $~lib/string/String#get:length
  local.get $buf
  local.get $nullTerminated
  local.get $errorMode
  call $~lib/string/String.UTF8.encodeUnsafe
  drop
  local.get $buf
  return
 )
 (func $~lib/string/String.UTF8.encode@varargs (param $str i32) (param $nullTerminated i32) (param $errorMode i32) (result i32)
  block $2of2
   block $1of2
    block $0of2
     block $outOfRange
      global.get $~argumentsLength
      i32.const 1
      i32.sub
      br_table $0of2 $1of2 $2of2 $outOfRange
     end
     unreachable
    end
    i32.const 0
    local.set $nullTerminated
   end
   i32.const 0
   local.set $errorMode
  end
  local.get $str
  local.get $nullTerminated
  local.get $errorMode
  call $~lib/string/String.UTF8.encode
 )
 (func $~lib/metashrew-as/assembly/indexer/tables/IndexPointer.wrap (param $pointer i32) (result i32)
  local.get $pointer
  return
 )
 (func $~lib/metashrew-as/assembly/indexer/tables/IndexPointer.for (param $keyword i32) (result i32)
  local.get $keyword
  i32.const 0
  i32.const 1
  global.set $~argumentsLength
  i32.const 0
  call $~lib/string/String.UTF8.encode@varargs
  call $~lib/metashrew-as/assembly/indexer/tables/IndexPointer.wrap
  return
 )
 (func $~lib/as-bignum/assembly/integer/u128/u128#set:lo (param $this i32) (param $lo i64)
  local.get $this
  local.get $lo
  i64.store
 )
 (func $~lib/as-bignum/assembly/integer/u128/u128#set:hi (param $this i32) (param $hi i64)
  local.get $this
  local.get $hi
  i64.store offset=8
 )
 (func $~lib/as-bignum/assembly/integer/u128/u128#constructor (param $this i32) (param $lo i64) (param $hi i64) (result i32)
  local.get $this
  i32.eqz
  if
   i32.const 16
   i32.const 8
   call $~lib/rt/stub/__new
   local.set $this
  end
  local.get $this
  local.get $lo
  call $~lib/as-bignum/assembly/integer/u128/u128#set:lo
  local.get $this
  local.get $hi
  call $~lib/as-bignum/assembly/integer/u128/u128#set:hi
  local.get $this
 )
 (func $~lib/string/String#charCodeAt (param $this i32) (param $pos i32) (result i32)
  local.get $pos
  local.get $this
  call $~lib/string/String#get:length
  i32.ge_u
  if
   i32.const -1
   return
  end
  local.get $this
  local.get $pos
  i32.const 1
  i32.shl
  i32.add
  i32.load16_u
  return
 )
 (func $~lib/as-bignum/assembly/integer/u128/u128#get:lo (param $this i32) (result i64)
  local.get $this
  i64.load
 )
 (func $~lib/as-bignum/assembly/integer/u128/u128#get:hi (param $this i32) (result i64)
  local.get $this
  i64.load offset=8
 )
 (func $~lib/as-bignum/assembly/globals/__multi3 (param $al i64) (param $ah i64) (param $bl i64) (param $bh i64) (result i64)
  (local $u i64)
  (local $v i64)
  (local $w i64)
  (local $k i64)
  (local $u1 i64)
  (local $v1 i64)
  (local $t i64)
  (local $w1 i64)
  (local $lo i64)
  (local $hi i64)
  local.get $al
  local.set $u
  local.get $bl
  local.set $v
  local.get $u
  i64.const 4294967295
  i64.and
  local.set $u1
  local.get $u
  i64.const 32
  i64.shr_u
  local.set $u
  local.get $v
  i64.const 4294967295
  i64.and
  local.set $v1
  local.get $v
  i64.const 32
  i64.shr_u
  local.set $v
  local.get $u1
  local.get $v1
  i64.mul
  local.set $t
  local.get $t
  i64.const 4294967295
  i64.and
  local.set $w1
  local.get $u
  local.get $v1
  i64.mul
  local.get $t
  i64.const 32
  i64.shr_u
  i64.add
  local.set $t
  local.get $t
  i64.const 4294967295
  i64.and
  local.set $k
  local.get $t
  i64.const 32
  i64.shr_u
  local.set $w
  local.get $u1
  local.get $v
  i64.mul
  local.get $k
  i64.add
  local.set $t
  local.get $t
  i64.const 32
  i64.shl
  local.get $w1
  i64.or
  local.set $lo
  local.get $u
  local.get $v
  i64.mul
  local.get $w
  i64.add
  local.set $hi
  local.get $hi
  local.get $ah
  local.get $bl
  i64.mul
  i64.add
  local.set $hi
  local.get $hi
  local.get $al
  local.get $bh
  i64.mul
  i64.add
  local.set $hi
  local.get $hi
  local.get $t
  i64.const 32
  i64.shr_u
  i64.add
  local.set $hi
  local.get $hi
  global.set $~lib/as-bignum/assembly/globals/__res128_hi
  local.get $lo
  return
 )
 (func $~lib/as-bignum/assembly/utils/atou128 (param $str i32) (param $radix i32) (result i32)
  (local $len i32)
  (local $first i32)
  (local $isNeg i32)
  (local $index i32)
  (local $second i32)
  (local $result i32)
  (local $table i32)
  (local $9 i32)
  (local $num i32)
  (local $value i32)
  (local $shift i32)
  (local $shift64 i64)
  (local $mod1 i64)
  (local $mod2 i64)
  (local $vl i64)
  (local $lo i64)
  (local $hi i64)
  (local $value|19 i64)
  (local $a i32)
  (local $b i32)
  (local $num|22 i32)
  (local $value|23 i32)
  (local $shift|24 i32)
  (local $shift64|25 i64)
  (local $mod1|26 i64)
  (local $mod2|27 i64)
  (local $vl|28 i64)
  (local $lo|29 i64)
  (local $hi|30 i64)
  (local $value|31 i32)
  (local $shift|32 i32)
  (local $shift64|33 i64)
  (local $mod1|34 i64)
  (local $mod2|35 i64)
  (local $vl|36 i64)
  (local $lo|37 i64)
  (local $hi|38 i64)
  (local $a|39 i32)
  (local $b|40 i32)
  (local $alo i64)
  (local $lo|42 i64)
  (local $hi|43 i64)
  (local $value|44 i64)
  (local $a|45 i32)
  (local $b|46 i32)
  (local $alo|47 i64)
  (local $lo|48 i64)
  (local $hi|49 i64)
  (local $n i32)
  (local $num|51 i32)
  (local $value|52 i32)
  (local $shift|53 i32)
  (local $shift64|54 i64)
  (local $mod1|55 i64)
  (local $mod2|56 i64)
  (local $vl|57 i64)
  (local $lo|58 i64)
  (local $hi|59 i64)
  (local $value|60 i64)
  (local $a|61 i32)
  (local $b|62 i32)
  (local $value|63 i64)
  (local $radix128 i32)
  (local $n|65 i32)
  (local $num|66 i32)
  (local $a|67 i32)
  (local $b|68 i32)
  (local $value|69 i64)
  (local $a|70 i32)
  (local $b|71 i32)
  (local $alo|72 i64)
  (local $lo|73 i64)
  (local $hi|74 i64)
  (local $this i32)
  (local $lo|76 i64)
  (local $hi|77 i64)
  (local $lo1 i64)
  local.get $radix
  i32.const 2
  i32.lt_s
  if (result i32)
   i32.const 1
  else
   local.get $radix
   i32.const 36
   i32.gt_s
  end
  if
   i32.const 3088
   i32.const 3136
   i32.const 144
   i32.const 5
   call $~lib/builtins/abort
   unreachable
  end
  local.get $str
  call $~lib/string/String#get:length
  local.set $len
  local.get $len
  i32.eqz
  if
   block $~lib/as-bignum/assembly/integer/u128/u128.get:Zero|inlined.0 (result i32)
    i32.const 0
    i64.const 0
    i64.const 0
    call $~lib/as-bignum/assembly/integer/u128/u128#constructor
    br $~lib/as-bignum/assembly/integer/u128/u128.get:Zero|inlined.0
   end
   return
  end
  local.get $str
  i32.const 0
  call $~lib/string/String#charCodeAt
  local.set $first
  local.get $len
  i32.const 1
  i32.eq
  if (result i32)
   local.get $first
   i32.const 48
   i32.eq
  else
   i32.const 0
  end
  if
   block $~lib/as-bignum/assembly/integer/u128/u128.get:Zero|inlined.1 (result i32)
    i32.const 0
    i64.const 0
    i64.const 0
    call $~lib/as-bignum/assembly/integer/u128/u128#constructor
    br $~lib/as-bignum/assembly/integer/u128/u128.get:Zero|inlined.1
   end
   return
  end
  local.get $first
  i32.const 45
  i32.eq
  local.set $isNeg
  local.get $isNeg
  local.get $first
  i32.const 43
  i32.eq
  i32.or
  i32.const 0
  i32.ne
  local.set $index
  local.get $str
  local.get $index
  call $~lib/string/String#charCodeAt
  i32.const 48
  i32.eq
  if
   local.get $str
   local.get $index
   i32.const 1
   i32.add
   local.tee $index
   call $~lib/string/String#charCodeAt
   local.set $second
   local.get $second
   i32.const 32
   i32.or
   i32.const 120
   i32.eq
   if
    i32.const 16
    local.set $radix
    local.get $index
    i32.const 1
    i32.add
    local.set $index
   else
    local.get $second
    i32.const 32
    i32.or
    i32.const 111
    i32.eq
    if
     i32.const 8
     local.set $radix
     local.get $index
     i32.const 1
     i32.add
     local.set $index
    else
     local.get $second
     i32.const 32
     i32.or
     i32.const 98
     i32.eq
     if
      i32.const 2
      local.set $radix
      local.get $index
      i32.const 1
      i32.add
      local.set $index
     else
      local.get $second
      i32.const 48
      i32.eq
      if
       loop $while-continue|0
        local.get $index
        local.get $len
        i32.lt_s
        if (result i32)
         local.get $str
         local.get $index
         call $~lib/string/String#charCodeAt
         i32.const 48
         i32.eq
        else
         i32.const 0
        end
        if
         local.get $index
         i32.const 1
         i32.add
         local.set $index
         br $while-continue|0
        end
       end
      end
     end
    end
   end
  end
  block $~lib/as-bignum/assembly/integer/u128/u128.get:Zero|inlined.2 (result i32)
   i32.const 0
   i64.const 0
   i64.const 0
   call $~lib/as-bignum/assembly/integer/u128/u128#constructor
   br $~lib/as-bignum/assembly/integer/u128/u128.get:Zero|inlined.2
  end
  local.set $result
  global.get $~lib/as-bignum/assembly/utils/RadixCharsTable
  local.set $table
  local.get $index
  local.get $len
  i32.ge_s
  if
   local.get $result
   return
  end
  i32.const 0
  i32.const 1
  i32.ge_s
  drop
  block $break|1
   block $case3|1
    block $case2|1
     block $case1|1
      block $case0|1
       local.get $radix
       local.set $9
       local.get $9
       i32.const 2
       i32.eq
       br_if $case0|1
       local.get $9
       i32.const 10
       i32.eq
       br_if $case1|1
       local.get $9
       i32.const 16
       i32.eq
       br_if $case2|1
       br $case3|1
      end
      block $do-break|2
       loop $do-loop|2
        local.get $str
        local.get $index
        call $~lib/string/String#charCodeAt
        i32.const 48
        i32.sub
        local.set $num
        local.get $num
        i32.const 2
        i32.ge_u
        if
         br $do-break|2
        end
        block $~lib/as-bignum/assembly/integer/u128/u128.shl|inlined.0 (result i32)
         local.get $result
         local.set $value
         i32.const 1
         local.set $shift
         local.get $shift
         i32.const 127
         i32.and
         local.set $shift
         local.get $shift
         i64.extend_i32_s
         local.set $shift64
         local.get $shift64
         i64.const 127
         i64.add
         local.get $shift64
         i64.or
         i64.const 64
         i64.and
         i64.const 6
         i64.shr_u
         i64.const 1
         i64.sub
         local.set $mod1
         local.get $shift64
         i64.const 6
         i64.shr_u
         i64.const 1
         i64.sub
         local.set $mod2
         local.get $shift64
         i64.const 63
         i64.and
         local.set $shift64
         local.get $value
         call $~lib/as-bignum/assembly/integer/u128/u128#get:lo
         local.set $vl
         local.get $vl
         local.get $shift64
         i64.shl
         local.set $lo
         local.get $lo
         local.get $mod2
         i64.const -1
         i64.xor
         i64.and
         local.set $hi
         local.get $hi
         local.get $value
         call $~lib/as-bignum/assembly/integer/u128/u128#get:hi
         local.get $shift64
         i64.shl
         local.get $vl
         i64.const 64
         local.get $shift64
         i64.sub
         i64.shr_u
         local.get $mod1
         i64.and
         i64.or
         local.get $mod2
         i64.and
         i64.or
         local.set $hi
         i32.const 0
         local.get $lo
         local.get $mod2
         i64.and
         local.get $hi
         call $~lib/as-bignum/assembly/integer/u128/u128#constructor
         br $~lib/as-bignum/assembly/integer/u128/u128.shl|inlined.0
        end
        local.set $result
        block $~lib/as-bignum/assembly/integer/u128/u128.or|inlined.0 (result i32)
         local.get $result
         local.set $a
         block $~lib/as-bignum/assembly/integer/u128/u128.fromU64|inlined.0 (result i32)
          local.get $num
          i64.extend_i32_u
          local.set $value|19
          i32.const 0
          local.get $value|19
          i64.const 0
          call $~lib/as-bignum/assembly/integer/u128/u128#constructor
          br $~lib/as-bignum/assembly/integer/u128/u128.fromU64|inlined.0
         end
         local.set $b
         i32.const 0
         local.get $a
         call $~lib/as-bignum/assembly/integer/u128/u128#get:lo
         local.get $b
         call $~lib/as-bignum/assembly/integer/u128/u128#get:lo
         i64.or
         local.get $a
         call $~lib/as-bignum/assembly/integer/u128/u128#get:hi
         local.get $b
         call $~lib/as-bignum/assembly/integer/u128/u128#get:hi
         i64.or
         call $~lib/as-bignum/assembly/integer/u128/u128#constructor
         br $~lib/as-bignum/assembly/integer/u128/u128.or|inlined.0
        end
        local.set $result
        local.get $index
        i32.const 1
        i32.add
        local.tee $index
        local.get $len
        i32.lt_s
        br_if $do-loop|2
       end
      end
      br $break|1
     end
     block $do-break|3
      loop $do-loop|3
       local.get $str
       local.get $index
       call $~lib/string/String#charCodeAt
       i32.const 48
       i32.sub
       local.set $num|22
       local.get $num|22
       i32.const 10
       i32.ge_u
       if
        br $do-break|3
       end
       block $~lib/as-bignum/assembly/integer/u128/u128.add|inlined.0 (result i32)
        block $~lib/as-bignum/assembly/integer/u128/u128.shl|inlined.1 (result i32)
         local.get $result
         local.set $value|23
         i32.const 3
         local.set $shift|24
         local.get $shift|24
         i32.const 127
         i32.and
         local.set $shift|24
         local.get $shift|24
         i64.extend_i32_s
         local.set $shift64|25
         local.get $shift64|25
         i64.const 127
         i64.add
         local.get $shift64|25
         i64.or
         i64.const 64
         i64.and
         i64.const 6
         i64.shr_u
         i64.const 1
         i64.sub
         local.set $mod1|26
         local.get $shift64|25
         i64.const 6
         i64.shr_u
         i64.const 1
         i64.sub
         local.set $mod2|27
         local.get $shift64|25
         i64.const 63
         i64.and
         local.set $shift64|25
         local.get $value|23
         call $~lib/as-bignum/assembly/integer/u128/u128#get:lo
         local.set $vl|28
         local.get $vl|28
         local.get $shift64|25
         i64.shl
         local.set $lo|29
         local.get $lo|29
         local.get $mod2|27
         i64.const -1
         i64.xor
         i64.and
         local.set $hi|30
         local.get $hi|30
         local.get $value|23
         call $~lib/as-bignum/assembly/integer/u128/u128#get:hi
         local.get $shift64|25
         i64.shl
         local.get $vl|28
         i64.const 64
         local.get $shift64|25
         i64.sub
         i64.shr_u
         local.get $mod1|26
         i64.and
         i64.or
         local.get $mod2|27
         i64.and
         i64.or
         local.set $hi|30
         i32.const 0
         local.get $lo|29
         local.get $mod2|27
         i64.and
         local.get $hi|30
         call $~lib/as-bignum/assembly/integer/u128/u128#constructor
         br $~lib/as-bignum/assembly/integer/u128/u128.shl|inlined.1
        end
        local.set $a|39
        block $~lib/as-bignum/assembly/integer/u128/u128.shl|inlined.2 (result i32)
         local.get $result
         local.set $value|31
         i32.const 1
         local.set $shift|32
         local.get $shift|32
         i32.const 127
         i32.and
         local.set $shift|32
         local.get $shift|32
         i64.extend_i32_s
         local.set $shift64|33
         local.get $shift64|33
         i64.const 127
         i64.add
         local.get $shift64|33
         i64.or
         i64.const 64
         i64.and
         i64.const 6
         i64.shr_u
         i64.const 1
         i64.sub
         local.set $mod1|34
         local.get $shift64|33
         i64.const 6
         i64.shr_u
         i64.const 1
         i64.sub
         local.set $mod2|35
         local.get $shift64|33
         i64.const 63
         i64.and
         local.set $shift64|33
         local.get $value|31
         call $~lib/as-bignum/assembly/integer/u128/u128#get:lo
         local.set $vl|36
         local.get $vl|36
         local.get $shift64|33
         i64.shl
         local.set $lo|37
         local.get $lo|37
         local.get $mod2|35
         i64.const -1
         i64.xor
         i64.and
         local.set $hi|38
         local.get $hi|38
         local.get $value|31
         call $~lib/as-bignum/assembly/integer/u128/u128#get:hi
         local.get $shift64|33
         i64.shl
         local.get $vl|36
         i64.const 64
         local.get $shift64|33
         i64.sub
         i64.shr_u
         local.get $mod1|34
         i64.and
         i64.or
         local.get $mod2|35
         i64.and
         i64.or
         local.set $hi|38
         i32.const 0
         local.get $lo|37
         local.get $mod2|35
         i64.and
         local.get $hi|38
         call $~lib/as-bignum/assembly/integer/u128/u128#constructor
         br $~lib/as-bignum/assembly/integer/u128/u128.shl|inlined.2
        end
        local.set $b|40
        local.get $a|39
        call $~lib/as-bignum/assembly/integer/u128/u128#get:lo
        local.set $alo
        local.get $alo
        local.get $b|40
        call $~lib/as-bignum/assembly/integer/u128/u128#get:lo
        i64.add
        local.set $lo|42
        local.get $a|39
        call $~lib/as-bignum/assembly/integer/u128/u128#get:hi
        local.get $b|40
        call $~lib/as-bignum/assembly/integer/u128/u128#get:hi
        i64.add
        local.get $lo|42
        local.get $alo
        i64.lt_u
        i64.extend_i32_u
        i64.add
        local.set $hi|43
        i32.const 0
        local.get $lo|42
        local.get $hi|43
        call $~lib/as-bignum/assembly/integer/u128/u128#constructor
        br $~lib/as-bignum/assembly/integer/u128/u128.add|inlined.0
       end
       local.set $result
       block $~lib/as-bignum/assembly/integer/u128/u128.add|inlined.1 (result i32)
        local.get $result
        local.set $a|45
        block $~lib/as-bignum/assembly/integer/u128/u128.fromU64|inlined.1 (result i32)
         local.get $num|22
         i64.extend_i32_u
         local.set $value|44
         i32.const 0
         local.get $value|44
         i64.const 0
         call $~lib/as-bignum/assembly/integer/u128/u128#constructor
         br $~lib/as-bignum/assembly/integer/u128/u128.fromU64|inlined.1
        end
        local.set $b|46
        local.get $a|45
        call $~lib/as-bignum/assembly/integer/u128/u128#get:lo
        local.set $alo|47
        local.get $alo|47
        local.get $b|46
        call $~lib/as-bignum/assembly/integer/u128/u128#get:lo
        i64.add
        local.set $lo|48
        local.get $a|45
        call $~lib/as-bignum/assembly/integer/u128/u128#get:hi
        local.get $b|46
        call $~lib/as-bignum/assembly/integer/u128/u128#get:hi
        i64.add
        local.get $lo|48
        local.get $alo|47
        i64.lt_u
        i64.extend_i32_u
        i64.add
        local.set $hi|49
        i32.const 0
        local.get $lo|48
        local.get $hi|49
        call $~lib/as-bignum/assembly/integer/u128/u128#constructor
        br $~lib/as-bignum/assembly/integer/u128/u128.add|inlined.1
       end
       local.set $result
       local.get $index
       i32.const 1
       i32.add
       local.tee $index
       local.get $len
       i32.lt_s
       br_if $do-loop|3
      end
     end
     br $break|1
    end
    block $do-break|4
     loop $do-loop|4
      local.get $str
      local.get $index
      call $~lib/string/String#charCodeAt
      i32.const 48
      i32.sub
      local.set $n
      local.get $n
      i32.const 122
      i32.const 48
      i32.sub
      i32.gt_u
      if
       br $do-break|4
      end
      local.get $table
      local.get $n
      i32.add
      i32.load8_u
      local.set $num|51
      local.get $num|51
      i32.const 16
      i32.ge_u
      if
       br $do-break|4
      end
      block $~lib/as-bignum/assembly/integer/u128/u128.shl|inlined.3 (result i32)
       local.get $result
       local.set $value|52
       i32.const 4
       local.set $shift|53
       local.get $shift|53
       i32.const 127
       i32.and
       local.set $shift|53
       local.get $shift|53
       i64.extend_i32_s
       local.set $shift64|54
       local.get $shift64|54
       i64.const 127
       i64.add
       local.get $shift64|54
       i64.or
       i64.const 64
       i64.and
       i64.const 6
       i64.shr_u
       i64.const 1
       i64.sub
       local.set $mod1|55
       local.get $shift64|54
       i64.const 6
       i64.shr_u
       i64.const 1
       i64.sub
       local.set $mod2|56
       local.get $shift64|54
       i64.const 63
       i64.and
       local.set $shift64|54
       local.get $value|52
       call $~lib/as-bignum/assembly/integer/u128/u128#get:lo
       local.set $vl|57
       local.get $vl|57
       local.get $shift64|54
       i64.shl
       local.set $lo|58
       local.get $lo|58
       local.get $mod2|56
       i64.const -1
       i64.xor
       i64.and
       local.set $hi|59
       local.get $hi|59
       local.get $value|52
       call $~lib/as-bignum/assembly/integer/u128/u128#get:hi
       local.get $shift64|54
       i64.shl
       local.get $vl|57
       i64.const 64
       local.get $shift64|54
       i64.sub
       i64.shr_u
       local.get $mod1|55
       i64.and
       i64.or
       local.get $mod2|56
       i64.and
       i64.or
       local.set $hi|59
       i32.const 0
       local.get $lo|58
       local.get $mod2|56
       i64.and
       local.get $hi|59
       call $~lib/as-bignum/assembly/integer/u128/u128#constructor
       br $~lib/as-bignum/assembly/integer/u128/u128.shl|inlined.3
      end
      local.set $result
      block $~lib/as-bignum/assembly/integer/u128/u128.or|inlined.1 (result i32)
       local.get $result
       local.set $a|61
       block $~lib/as-bignum/assembly/integer/u128/u128.fromU64|inlined.2 (result i32)
        local.get $num|51
        i64.extend_i32_u
        local.set $value|60
        i32.const 0
        local.get $value|60
        i64.const 0
        call $~lib/as-bignum/assembly/integer/u128/u128#constructor
        br $~lib/as-bignum/assembly/integer/u128/u128.fromU64|inlined.2
       end
       local.set $b|62
       i32.const 0
       local.get $a|61
       call $~lib/as-bignum/assembly/integer/u128/u128#get:lo
       local.get $b|62
       call $~lib/as-bignum/assembly/integer/u128/u128#get:lo
       i64.or
       local.get $a|61
       call $~lib/as-bignum/assembly/integer/u128/u128#get:hi
       local.get $b|62
       call $~lib/as-bignum/assembly/integer/u128/u128#get:hi
       i64.or
       call $~lib/as-bignum/assembly/integer/u128/u128#constructor
       br $~lib/as-bignum/assembly/integer/u128/u128.or|inlined.1
      end
      local.set $result
      local.get $index
      i32.const 1
      i32.add
      local.tee $index
      local.get $len
      i32.lt_s
      br_if $do-loop|4
     end
    end
    br $break|1
   end
   block $~lib/as-bignum/assembly/integer/u128/u128.fromU64|inlined.3 (result i32)
    local.get $radix
    i64.extend_i32_s
    local.set $value|63
    i32.const 0
    local.get $value|63
    i64.const 0
    call $~lib/as-bignum/assembly/integer/u128/u128#constructor
    br $~lib/as-bignum/assembly/integer/u128/u128.fromU64|inlined.3
   end
   local.set $radix128
   block $do-break|5
    loop $do-loop|5
     local.get $str
     local.get $index
     call $~lib/string/String#charCodeAt
     i32.const 48
     i32.sub
     local.set $n|65
     local.get $n|65
     i32.const 122
     i32.const 48
     i32.sub
     i32.gt_u
     if
      br $do-break|5
     end
     local.get $table
     local.get $n|65
     i32.add
     i32.load8_u
     local.set $num|66
     local.get $num|66
     local.get $radix
     i32.const 255
     i32.and
     i32.ge_u
     if
      br $do-break|5
     end
     block $~lib/as-bignum/assembly/integer/u128/u128.mul|inlined.0 (result i32)
      local.get $result
      local.set $a|67
      local.get $radix128
      local.set $b|68
      i32.const 0
      local.get $a|67
      call $~lib/as-bignum/assembly/integer/u128/u128#get:lo
      local.get $a|67
      call $~lib/as-bignum/assembly/integer/u128/u128#get:hi
      local.get $b|68
      call $~lib/as-bignum/assembly/integer/u128/u128#get:lo
      local.get $b|68
      call $~lib/as-bignum/assembly/integer/u128/u128#get:hi
      call $~lib/as-bignum/assembly/globals/__multi3
      global.get $~lib/as-bignum/assembly/globals/__res128_hi
      call $~lib/as-bignum/assembly/integer/u128/u128#constructor
      br $~lib/as-bignum/assembly/integer/u128/u128.mul|inlined.0
     end
     local.set $result
     block $~lib/as-bignum/assembly/integer/u128/u128.add|inlined.2 (result i32)
      local.get $result
      local.set $a|70
      block $~lib/as-bignum/assembly/integer/u128/u128.fromU64|inlined.4 (result i32)
       local.get $num|66
       i64.extend_i32_u
       local.set $value|69
       i32.const 0
       local.get $value|69
       i64.const 0
       call $~lib/as-bignum/assembly/integer/u128/u128#constructor
       br $~lib/as-bignum/assembly/integer/u128/u128.fromU64|inlined.4
      end
      local.set $b|71
      local.get $a|70
      call $~lib/as-bignum/assembly/integer/u128/u128#get:lo
      local.set $alo|72
      local.get $alo|72
      local.get $b|71
      call $~lib/as-bignum/assembly/integer/u128/u128#get:lo
      i64.add
      local.set $lo|73
      local.get $a|70
      call $~lib/as-bignum/assembly/integer/u128/u128#get:hi
      local.get $b|71
      call $~lib/as-bignum/assembly/integer/u128/u128#get:hi
      i64.add
      local.get $lo|73
      local.get $alo|72
      i64.lt_u
      i64.extend_i32_u
      i64.add
      local.set $hi|74
      i32.const 0
      local.get $lo|73
      local.get $hi|74
      call $~lib/as-bignum/assembly/integer/u128/u128#constructor
      br $~lib/as-bignum/assembly/integer/u128/u128.add|inlined.2
     end
     local.set $result
     local.get $index
     i32.const 1
     i32.add
     local.tee $index
     local.get $len
     i32.lt_s
     br_if $do-loop|5
    end
   end
   br $break|1
  end
  local.get $isNeg
  if (result i32)
   block $~lib/as-bignum/assembly/integer/u128/u128#neg|inlined.0 (result i32)
    local.get $result
    local.set $this
    local.get $this
    call $~lib/as-bignum/assembly/integer/u128/u128#get:lo
    i64.const -1
    i64.xor
    local.set $lo|76
    local.get $this
    call $~lib/as-bignum/assembly/integer/u128/u128#get:hi
    i64.const -1
    i64.xor
    local.set $hi|77
    local.get $lo|76
    i64.const 1
    i64.add
    local.set $lo1
    i32.const 0
    local.get $lo1
    local.get $hi|77
    local.get $lo1
    local.get $lo|76
    i64.lt_u
    i64.extend_i32_u
    i64.add
    call $~lib/as-bignum/assembly/integer/u128/u128#constructor
    br $~lib/as-bignum/assembly/integer/u128/u128#neg|inlined.0
   end
  else
   local.get $result
  end
  return
 )
 (func $start:~lib/metashrew-runes/assembly/indexer/constants/index
  (local $value i32)
  (local $value|1 i32)
  (local $radix i32)
  (local $value|3 i32)
  (local $value|4 i64)
  (local $value|5 i32)
  (local $value|6 i32)
  (local $radix|7 i32)
  call $start:~lib/metashrew-as/assembly/indexer/tables
  i32.const 1696
  call $~lib/metashrew-as/assembly/indexer/tables/IndexPointer.for
  global.set $~lib/metashrew-runes/assembly/indexer/constants/index/HEIGHT_TO_BLOCKHASH
  i32.const 1872
  call $~lib/metashrew-as/assembly/indexer/tables/IndexPointer.for
  global.set $~lib/metashrew-runes/assembly/indexer/constants/index/BLOCKHASH_TO_HEIGHT
  i32.const 1936
  call $~lib/metashrew-as/assembly/indexer/tables/IndexPointer.for
  global.set $~lib/metashrew-runes/assembly/indexer/constants/index/OUTPOINT_TO_RUNES
  i32.const 2000
  call $~lib/metashrew-as/assembly/indexer/tables/IndexPointer.for
  global.set $~lib/metashrew-runes/assembly/indexer/constants/index/OUTPOINT_TO_HEIGHT
  i32.const 2064
  call $~lib/metashrew-as/assembly/indexer/tables/IndexPointer.for
  global.set $~lib/metashrew-runes/assembly/indexer/constants/index/HEIGHT_TO_TRANSACTION_IDS
  i32.const 2128
  call $~lib/metashrew-as/assembly/indexer/tables/IndexPointer.for
  global.set $~lib/metashrew-runes/assembly/indexer/constants/index/SYMBOL
  i32.const 2176
  call $~lib/metashrew-as/assembly/indexer/tables/IndexPointer.for
  global.set $~lib/metashrew-runes/assembly/indexer/constants/index/CAP
  i32.const 2224
  call $~lib/metashrew-as/assembly/indexer/tables/IndexPointer.for
  global.set $~lib/metashrew-runes/assembly/indexer/constants/index/SPACERS
  i32.const 2272
  call $~lib/metashrew-as/assembly/indexer/tables/IndexPointer.for
  global.set $~lib/metashrew-runes/assembly/indexer/constants/index/OFFSETEND
  i32.const 2336
  call $~lib/metashrew-as/assembly/indexer/tables/IndexPointer.for
  global.set $~lib/metashrew-runes/assembly/indexer/constants/index/OFFSETSTART
  i32.const 2400
  call $~lib/metashrew-as/assembly/indexer/tables/IndexPointer.for
  global.set $~lib/metashrew-runes/assembly/indexer/constants/index/HEIGHTSTART
  i32.const 2464
  call $~lib/metashrew-as/assembly/indexer/tables/IndexPointer.for
  global.set $~lib/metashrew-runes/assembly/indexer/constants/index/HEIGHTEND
  i32.const 2528
  call $~lib/metashrew-as/assembly/indexer/tables/IndexPointer.for
  global.set $~lib/metashrew-runes/assembly/indexer/constants/index/AMOUNT
  i32.const 2576
  call $~lib/metashrew-as/assembly/indexer/tables/IndexPointer.for
  global.set $~lib/metashrew-runes/assembly/indexer/constants/index/MINTS_REMAINING
  i32.const 2656
  call $~lib/metashrew-as/assembly/indexer/tables/IndexPointer.for
  global.set $~lib/metashrew-runes/assembly/indexer/constants/index/PREMINE
  i32.const 2720
  call $~lib/metashrew-as/assembly/indexer/tables/IndexPointer.for
  global.set $~lib/metashrew-runes/assembly/indexer/constants/index/DIVISIBILITY
  i32.const 2784
  call $~lib/metashrew-as/assembly/indexer/tables/IndexPointer.for
  global.set $~lib/metashrew-runes/assembly/indexer/constants/index/RUNE_ID_TO_HEIGHT
  i32.const 2848
  call $~lib/metashrew-as/assembly/indexer/tables/IndexPointer.for
  global.set $~lib/metashrew-runes/assembly/indexer/constants/index/ETCHINGS
  i32.const 2896
  call $~lib/metashrew-as/assembly/indexer/tables/IndexPointer.for
  global.set $~lib/metashrew-runes/assembly/indexer/constants/index/RUNE_ID_TO_ETCHING
  i32.const 2960
  call $~lib/metashrew-as/assembly/indexer/tables/IndexPointer.for
  global.set $~lib/metashrew-runes/assembly/indexer/constants/index/ETCHING_TO_RUNE_ID
  block $~lib/as-bignum/assembly/integer/u128/u128.from<~lib/string/String>|inlined.0 (result i32)
   i32.const 3024
   local.set $value
   i32.const 0
   drop
   i32.const 0
   drop
   i32.const 0
   drop
   i32.const 0
   drop
   i32.const 0
   drop
   i32.const 0
   drop
   i32.const 0
   drop
   i32.const 0
   drop
   i32.const 0
   drop
   i32.const 0
   drop
   i32.const 0
   drop
   i32.const 0
   drop
   i32.const 0
   drop
   i32.const 0
   drop
   i32.const 0
   drop
   i32.const 0
   drop
   i32.const 0
   drop
   i32.const 1
   drop
   block $~lib/as-bignum/assembly/integer/u128/u128.fromString|inlined.0 (result i32)
    local.get $value
    local.set $value|1
    i32.const 10
    local.set $radix
    local.get $value|1
    local.get $radix
    call $~lib/as-bignum/assembly/utils/atou128
    br $~lib/as-bignum/assembly/integer/u128/u128.fromString|inlined.0
   end
   br $~lib/as-bignum/assembly/integer/u128/u128.from<~lib/string/String>|inlined.0
  end
  global.set $~lib/metashrew-runes/assembly/indexer/constants/index/MINIMUM_NAME
  block $~lib/as-bignum/assembly/integer/u128/u128.from<i32>|inlined.0 (result i32)
   i32.const 26
   local.set $value|3
   i32.const 0
   drop
   i32.const 0
   drop
   i32.const 0
   drop
   i32.const 0
   drop
   i32.const 0
   drop
   i32.const 1
   drop
   block $~lib/as-bignum/assembly/integer/u128/u128.fromI64|inlined.0 (result i32)
    local.get $value|3
    i64.extend_i32_s
    local.set $value|4
    i32.const 0
    local.get $value|4
    local.get $value|4
    i64.const 63
    i64.shr_s
    call $~lib/as-bignum/assembly/integer/u128/u128#constructor
    br $~lib/as-bignum/assembly/integer/u128/u128.fromI64|inlined.0
   end
   br $~lib/as-bignum/assembly/integer/u128/u128.from<i32>|inlined.0
  end
  global.set $~lib/metashrew-runes/assembly/indexer/constants/index/TWENTY_SIX
  block $~lib/as-bignum/assembly/integer/u128/u128.from<~lib/string/String>|inlined.1 (result i32)
   i32.const 3312
   local.set $value|5
   i32.const 0
   drop
   i32.const 0
   drop
   i32.const 0
   drop
   i32.const 0
   drop
   i32.const 0
   drop
   i32.const 0
   drop
   i32.const 0
   drop
   i32.const 0
   drop
   i32.const 0
   drop
   i32.const 0
   drop
   i32.const 0
   drop
   i32.const 0
   drop
   i32.const 0
   drop
   i32.const 0
   drop
   i32.const 0
   drop
   i32.const 0
   drop
   i32.const 0
   drop
   i32.const 1
   drop
   block $~lib/as-bignum/assembly/integer/u128/u128.fromString|inlined.1 (result i32)
    local.get $value|5
    local.set $value|6
    i32.const 10
    local.set $radix|7
    local.get $value|6
    local.get $radix|7
    call $~lib/as-bignum/assembly/utils/atou128
    br $~lib/as-bignum/assembly/integer/u128/u128.fromString|inlined.1
   end
   br $~lib/as-bignum/assembly/integer/u128/u128.from<~lib/string/String>|inlined.1
  end
  global.set $~lib/metashrew-runes/assembly/indexer/constants/index/RESERVED_NAME
 )
 (func $~lib/metashrew-as/assembly/utils/yabsp/Console#constructor (param $this i32) (result i32)
  local.get $this
  i32.eqz
  if
   i32.const 0
   i32.const 14
   call $~lib/rt/stub/__new
   local.set $this
  end
  local.get $this
  call $~lib/object/Object#constructor
  local.set $this
  local.get $this
 )
 (func $start:~lib/metashrew-as/assembly/utils/yabsp
  i32.const 0
  call $~lib/metashrew-as/assembly/utils/yabsp/Console#constructor
  global.set $~lib/metashrew-as/assembly/utils/yabsp/console
 )
 (func $start:~lib/metashrew-as/assembly/utils/index
  call $start:~lib/metashrew-as/assembly/utils/yabsp
 )
 (func $start:~lib/metashrew-runes/assembly/indexer/RuneId
  call $start:~lib/metashrew-as/assembly/utils/index
 )
 (func $start:~lib/metashrew-runes/assembly/indexer/Edict
  call $start:~lib/metashrew-runes/assembly/indexer/RuneId
 )
 (func $start:~lib/metashrew-runes/assembly/utils
  call $start:~lib/metashrew-runes/assembly/indexer/constants/index
  call $start:~lib/metashrew-runes/assembly/indexer/Edict
 )
 (func $assembly/env/AlkaneEnvironment#set:_block (param $this i32) (param $_block i32)
  local.get $this
  local.get $_block
  i32.store
  local.get $this
  local.get $_block
  i32.const 0
  call $~lib/rt/stub/__link
 )
 (func $assembly/env/AlkaneEnvironment#set:_transaction (param $this i32) (param $_transaction i32)
  local.get $this
  local.get $_transaction
  i32.store offset=4
  local.get $this
  local.get $_transaction
  i32.const 0
  call $~lib/rt/stub/__link
 )
 (func $assembly/env/AlkaneEnvironment#set:_sequence (param $this i32) (param $_sequence i32)
  local.get $this
  local.get $_sequence
  i32.store offset=8
  local.get $this
  local.get $_sequence
  i32.const 0
  call $~lib/rt/stub/__link
 )
 (func $assembly/env/AlkaneEnvironment#set:_context (param $this i32) (param $_context i32)
  local.get $this
  local.get $_context
  i32.store offset=12
  local.get $this
  local.get $_context
  i32.const 0
  call $~lib/rt/stub/__link
 )
 (func $assembly/env/AlkaneEnvironment#constructor (param $this i32) (result i32)
  local.get $this
  i32.eqz
  if
   i32.const 16
   i32.const 15
   call $~lib/rt/stub/__new
   local.set $this
  end
  local.get $this
  i32.const 0
  call $assembly/env/AlkaneEnvironment#set:_block
  local.get $this
  i32.const 0
  call $assembly/env/AlkaneEnvironment#set:_transaction
  local.get $this
  i32.const 0
  call $assembly/env/AlkaneEnvironment#set:_sequence
  local.get $this
  i32.const 0
  call $assembly/env/AlkaneEnvironment#set:_context
  local.get $this
  i32.const 0
  call $assembly/env/AlkaneEnvironment#set:_block
  local.get $this
  i32.const 0
  call $assembly/env/AlkaneEnvironment#set:_transaction
  local.get $this
  i32.const 0
  call $assembly/env/AlkaneEnvironment#set:_sequence
  local.get $this
  i32.const 0
  call $assembly/env/AlkaneEnvironment#set:_context
  local.get $this
 )
 (func $start:assembly/env
  call $start:~lib/metashrew-runes/assembly/utils
  i32.const 0
  call $assembly/env/AlkaneEnvironment#constructor
  global.set $assembly/env/env
 )
 (func $start:assembly/index
  call $start:assembly/env
 )
 (func $assembly/env/AlkaneEnvironment#get:_block (param $this i32) (result i32)
  local.get $this
  i32.load
 )
 (func $assembly/env/AlkaneEnvironment#get:block (param $this i32) (result i32)
  local.get $this
  call $assembly/env/AlkaneEnvironment#get:_block
  i32.const 0
  i32.eq
  if
   local.get $this
   i32.const 0
   call $assembly/env/__request_block
   call $~lib/arraybuffer/ArrayBuffer#constructor
   call $assembly/env/AlkaneEnvironment#set:_block
   local.get $this
   call $assembly/env/AlkaneEnvironment#get:_block
   call $assembly/env/__load_block
  end
  local.get $this
  call $assembly/env/AlkaneEnvironment#get:_block
  return
 )
 (func $~lib/metashrew-as/assembly/utils/box/Box#set:start (param $this i32) (param $start i32)
  local.get $this
  local.get $start
  i32.store
 )
 (func $~lib/metashrew-as/assembly/utils/box/Box#set:len (param $this i32) (param $len i32)
  local.get $this
  local.get $len
  i32.store offset=4
 )
 (func $~lib/metashrew-as/assembly/utils/box/Box#constructor (param $this i32) (param $start i32) (param $len i32) (result i32)
  local.get $this
  i32.eqz
  if
   i32.const 8
   i32.const 21
   call $~lib/rt/stub/__new
   local.set $this
  end
  local.get $this
  i32.const 0
  call $~lib/metashrew-as/assembly/utils/box/Box#set:start
  local.get $this
  i32.const 0
  call $~lib/metashrew-as/assembly/utils/box/Box#set:len
  local.get $this
  local.get $start
  call $~lib/metashrew-as/assembly/utils/box/Box#set:start
  local.get $this
  local.get $len
  call $~lib/metashrew-as/assembly/utils/box/Box#set:len
  local.get $this
 )
 (func $~lib/arraybuffer/ArrayBuffer#get:byteLength (param $this i32) (result i32)
  local.get $this
  i32.const 20
  i32.sub
  call $~lib/rt/common/OBJECT#get:rtSize
  return
 )
 (func $~lib/metashrew-as/assembly/utils/box/Box.from (param $data i32) (result i32)
  i32.const 0
  local.get $data
  local.get $data
  call $~lib/arraybuffer/ArrayBuffer#get:byteLength
  call $~lib/metashrew-as/assembly/utils/box/Box#constructor
  return
 )
 (func $~lib/metashrew-as/assembly/utils/box/Box#get:start (param $this i32) (result i32)
  local.get $this
  i32.load
 )
 (func $~lib/metashrew-as/assembly/utils/box/Box#get:len (param $this i32) (result i32)
  local.get $this
  i32.load offset=4
 )
 (func $~lib/metashrew-as/assembly/utils/hex/encodeHexUTF8 (param $start i32) (param $len i32) (result i32)
  (local $result i32)
  (local $i i32)
  i32.const 0
  i32.const 2
  local.get $len
  i32.const 2
  i32.mul
  i32.add
  call $~lib/arraybuffer/ArrayBuffer#constructor
  local.set $result
  local.get $result
  i32.const 30768
  i32.store16
  i32.const 0
  local.set $i
  loop $for-loop|0
   local.get $i
   local.get $len
   i32.lt_u
   if
    i32.const 2
    local.get $result
    i32.add
    local.get $i
    i32.const 2
    i32.mul
    i32.add
    global.get $~lib/metashrew-as/assembly/utils/hex/hexLookupTable
    i32.const 2
    local.get $start
    local.get $i
    i32.add
    i32.load8_u
    i32.mul
    i32.add
    i32.load16_u
    i32.store16
    local.get $i
    i32.const 1
    i32.add
    local.set $i
    br $for-loop|0
   end
  end
  local.get $result
  return
 )
 (func $~lib/rt/common/BLOCK#get:mmInfo (param $this i32) (result i32)
  local.get $this
  i32.load
 )
 (func $~lib/rt/stub/__realloc (param $ptr i32) (param $size i32) (result i32)
  (local $block i32)
  (local $actualSize i32)
  (local $isLast i32)
  (local $size|5 i32)
  (local $payloadSize i32)
  (local $7 i32)
  (local $8 i32)
  (local $newPtr i32)
  local.get $ptr
  i32.const 0
  i32.ne
  if (result i32)
   local.get $ptr
   i32.const 15
   i32.and
   i32.eqz
  else
   i32.const 0
  end
  i32.eqz
  if
   i32.const 0
   i32.const 640
   i32.const 45
   i32.const 3
   call $~lib/builtins/abort
   unreachable
  end
  local.get $ptr
  i32.const 4
  i32.sub
  local.set $block
  local.get $block
  call $~lib/rt/common/BLOCK#get:mmInfo
  local.set $actualSize
  local.get $ptr
  local.get $actualSize
  i32.add
  global.get $~lib/rt/stub/offset
  i32.eq
  local.set $isLast
  block $~lib/rt/stub/computeSize|inlined.1 (result i32)
   local.get $size
   local.set $size|5
   local.get $size|5
   i32.const 4
   i32.add
   i32.const 15
   i32.add
   i32.const 15
   i32.const -1
   i32.xor
   i32.and
   i32.const 4
   i32.sub
   br $~lib/rt/stub/computeSize|inlined.1
  end
  local.set $payloadSize
  local.get $size
  local.get $actualSize
  i32.gt_u
  if
   local.get $isLast
   if
    local.get $size
    i32.const 1073741820
    i32.gt_u
    if
     i32.const 576
     i32.const 640
     i32.const 52
     i32.const 33
     call $~lib/builtins/abort
     unreachable
    end
    local.get $ptr
    local.get $payloadSize
    i32.add
    call $~lib/rt/stub/maybeGrowMemory
    local.get $block
    local.get $payloadSize
    call $~lib/rt/common/BLOCK#set:mmInfo
   else
    local.get $payloadSize
    local.tee $7
    local.get $actualSize
    i32.const 1
    i32.shl
    local.tee $8
    local.get $7
    local.get $8
    i32.gt_u
    select
    call $~lib/rt/stub/__alloc
    local.set $newPtr
    local.get $newPtr
    local.get $ptr
    local.get $actualSize
    memory.copy
    local.get $newPtr
    local.tee $ptr
    i32.const 4
    i32.sub
    local.set $block
   end
  else
   local.get $isLast
   if
    local.get $ptr
    local.get $payloadSize
    i32.add
    global.set $~lib/rt/stub/offset
    local.get $block
    local.get $payloadSize
    call $~lib/rt/common/BLOCK#set:mmInfo
   end
  end
  local.get $ptr
  return
 )
 (func $~lib/rt/stub/__renew (param $oldPtr i32) (param $size i32) (result i32)
  (local $newPtr i32)
  local.get $size
  i32.const 1073741804
  i32.gt_u
  if
   i32.const 576
   i32.const 640
   i32.const 99
   i32.const 30
   call $~lib/builtins/abort
   unreachable
  end
  local.get $oldPtr
  i32.const 16
  i32.sub
  i32.const 16
  local.get $size
  i32.add
  call $~lib/rt/stub/__realloc
  local.set $newPtr
  local.get $newPtr
  i32.const 4
  i32.sub
  local.get $size
  call $~lib/rt/common/OBJECT#set:rtSize
  local.get $newPtr
  i32.const 16
  i32.add
  return
 )
 (func $~lib/string/String.UTF8.decodeUnsafe (param $buf i32) (param $len i32) (param $nullTerminated i32) (result i32)
  (local $bufOff i32)
  (local $bufEnd i32)
  (local $str i32)
  (local $strOff i32)
  (local $u0 i32)
  (local $u1 i32)
  (local $u2 i32)
  (local $lo i32)
  (local $hi i32)
  local.get $buf
  local.set $bufOff
  local.get $buf
  local.get $len
  i32.add
  local.set $bufEnd
  local.get $bufEnd
  local.get $bufOff
  i32.ge_u
  i32.eqz
  if
   i32.const 0
   i32.const 1824
   i32.const 770
   i32.const 7
   call $~lib/builtins/abort
   unreachable
  end
  local.get $len
  i32.const 1
  i32.shl
  i32.const 2
  call $~lib/rt/stub/__new
  local.set $str
  local.get $str
  local.set $strOff
  block $while-break|0
   loop $while-continue|0
    local.get $bufOff
    local.get $bufEnd
    i32.lt_u
    if
     local.get $bufOff
     i32.load8_u
     local.set $u0
     local.get $bufOff
     i32.const 1
     i32.add
     local.set $bufOff
     local.get $u0
     i32.const 128
     i32.and
     i32.eqz
     if
      local.get $nullTerminated
      local.get $u0
      i32.eqz
      i32.and
      if
       br $while-break|0
      end
      local.get $strOff
      local.get $u0
      i32.store16
     else
      local.get $bufEnd
      local.get $bufOff
      i32.eq
      if
       br $while-break|0
      end
      local.get $bufOff
      i32.load8_u
      i32.const 63
      i32.and
      local.set $u1
      local.get $bufOff
      i32.const 1
      i32.add
      local.set $bufOff
      local.get $u0
      i32.const 224
      i32.and
      i32.const 192
      i32.eq
      if
       local.get $strOff
       local.get $u0
       i32.const 31
       i32.and
       i32.const 6
       i32.shl
       local.get $u1
       i32.or
       i32.store16
      else
       local.get $bufEnd
       local.get $bufOff
       i32.eq
       if
        br $while-break|0
       end
       local.get $bufOff
       i32.load8_u
       i32.const 63
       i32.and
       local.set $u2
       local.get $bufOff
       i32.const 1
       i32.add
       local.set $bufOff
       local.get $u0
       i32.const 240
       i32.and
       i32.const 224
       i32.eq
       if
        local.get $u0
        i32.const 15
        i32.and
        i32.const 12
        i32.shl
        local.get $u1
        i32.const 6
        i32.shl
        i32.or
        local.get $u2
        i32.or
        local.set $u0
       else
        local.get $bufEnd
        local.get $bufOff
        i32.eq
        if
         br $while-break|0
        end
        local.get $u0
        i32.const 7
        i32.and
        i32.const 18
        i32.shl
        local.get $u1
        i32.const 12
        i32.shl
        i32.or
        local.get $u2
        i32.const 6
        i32.shl
        i32.or
        local.get $bufOff
        i32.load8_u
        i32.const 63
        i32.and
        i32.or
        local.set $u0
        local.get $bufOff
        i32.const 1
        i32.add
        local.set $bufOff
       end
       local.get $u0
       i32.const 65536
       i32.lt_u
       if
        local.get $strOff
        local.get $u0
        i32.store16
       else
        local.get $u0
        i32.const 65536
        i32.sub
        local.set $u0
        local.get $u0
        i32.const 10
        i32.shr_u
        i32.const 55296
        i32.or
        local.set $lo
        local.get $u0
        i32.const 1023
        i32.and
        i32.const 56320
        i32.or
        local.set $hi
        local.get $strOff
        local.get $lo
        local.get $hi
        i32.const 16
        i32.shl
        i32.or
        i32.store
        local.get $strOff
        i32.const 2
        i32.add
        local.set $strOff
       end
      end
     end
     local.get $strOff
     i32.const 2
     i32.add
     local.set $strOff
     br $while-continue|0
    end
   end
  end
  local.get $str
  local.get $strOff
  local.get $str
  i32.sub
  call $~lib/rt/stub/__renew
  return
 )
 (func $~lib/string/String.UTF8.decode (param $buf i32) (param $nullTerminated i32) (result i32)
  local.get $buf
  local.get $buf
  call $~lib/arraybuffer/ArrayBuffer#get:byteLength
  local.get $nullTerminated
  call $~lib/string/String.UTF8.decodeUnsafe
  return
 )
 (func $~lib/metashrew-as/assembly/utils/hex/encodeHex (param $start i32) (param $len i32) (result i32)
  local.get $start
  local.get $len
  call $~lib/metashrew-as/assembly/utils/hex/encodeHexUTF8
  i32.const 0
  call $~lib/string/String.UTF8.decode
  return
 )
 (func $~lib/metashrew-as/assembly/utils/box/Box#toHexString (param $this i32) (result i32)
  local.get $this
  call $~lib/metashrew-as/assembly/utils/box/Box#get:start
  local.get $this
  call $~lib/metashrew-as/assembly/utils/box/Box#get:len
  call $~lib/metashrew-as/assembly/utils/hex/encodeHex
  return
 )
 (func $~lib/console/console.log (param $message i32)
  local.get $message
  call $~lib/bindings/dom/console.log
 )
 (func $assembly/index/__execute (result i32)
  global.get $assembly/env/env
  call $assembly/env/AlkaneEnvironment#get:block
  call $~lib/metashrew-as/assembly/utils/box/Box.from
  call $~lib/metashrew-as/assembly/utils/box/Box#toHexString
  call $~lib/console/console.log
  i32.const 0
  return
 )
 (func $~start
  call $start:assembly/index
 )
)
