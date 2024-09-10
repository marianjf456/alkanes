(module
 (type $0 (func (param i32 i32)))
 (type $1 (func (param i32) (result i32)))
 (type $2 (func (param i32 i32) (result i32)))
 (type $3 (func))
 (type $4 (func (param i32 i32 i32)))
 (type $5 (func (param i32 i32 i32) (result i32)))
 (type $6 (func (result i32)))
 (type $7 (func (param i32)))
 (type $8 (func (param i32 i64)))
 (type $9 (func (param i32) (result i64)))
 (type $10 (func (param i32 i32 i32 i32)))
 (type $11 (func (param i32 i32 i32 i32 i32) (result i32)))
 (type $12 (func (param i32 i32 i32 i32) (result i32)))
 (type $13 (func (param i32 i64 i64) (result i32)))
 (type $14 (func (param i64 i64 i64 i64) (result i64)))
 (type $15 (func (param i32 i64 i32)))
 (type $16 (func (param i64 i32) (result i32)))
 (type $17 (func (param i32 i64 i32 i32)))
 (import "env" "abort" (func $~lib/builtins/abort (param i32 i32 i32 i32)))
 (import "env" "__host_len" (func $~lib/metashrew-as/assembly/indexer/index/__host_len (result i32)))
 (import "env" "__load_input" (func $~lib/metashrew-as/assembly/indexer/index/__load_input (param i32)))
 (import "env" "__log" (func $~lib/metashrew-as/assembly/utils/logging/__log (param i32)))
 (import "env" "__flush" (func $~lib/metashrew-as/assembly/indexer/index/__flush (param i32)))
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
 (global $~lib/metashrew-as/assembly/blockdata/version/Version.AUXPOW (mut i32) (i32.const 256))
 (global $~lib/metashrew-as/assembly/blockdata/version/Version.POS_START (mut i32) (i32.const 512))
 (global $~lib/metashrew-as/assembly/blockdata/version/Version.CHAIN_START (mut i32) (i32.const 65536))
 (global $~lib/metashrew-as/assembly/blockdata/version/Version.CHAIN_ID (mut i32) (i32.const 20))
 (global $~lib/metashrew-as/assembly/utils/yabsp/console (mut i32) (i32.const 0))
 (global $~lib/metashrew-as/assembly/utils/b32/ENCODING_CONST_BECH32 i32 (i32.const 1))
 (global $~lib/metashrew-as/assembly/utils/b32/ENCODING_CONST_BECH32M i32 (i32.const 734539939))
 (global $~argumentsLength (mut i32) (i32.const 0))
 (global $~lib/metashrew-as/assembly/utils/b32/ONE (mut i32) (i32.const 0))
 (global $~lib/metashrew-as/assembly/utils/b32/ALPHABET_MAP i32 (i32.const 1888))
 (global $~lib/metashrew-as/assembly/utils/b32/ALPHABET i32 (i32.const 2176))
 (global $~lib/metashrew-as/assembly/utils/b58/ALPHABET i32 (i32.const 2240))
 (global $~lib/metashrew-as/assembly/utils/b58/LEADER (mut i32) (i32.const 0))
 (global $~lib/metashrew-runes/assembly/indexer/constants/index/RUNESTONE_TAG i32 (i32.const 23914))
 (global $~lib/metashrew-runes/assembly/indexer/constants/index/OP_RETURN i32 (i32.const 106))
 (global $~lib/metashrew-runes/assembly/indexer/constants/index/GENESIS i32 (i32.const 840000))
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
 (global $~lib/as-bignum/assembly/utils/RadixCharsTable i32 (i32.const 3852))
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
 (global $~lib/protorune/assembly/indexer/ProtoruneRuneId/ProtoruneRuneId.MAX_LEB_SIZE_BYTES i32 (i32.const 31))
 (global $~lib/metashrew-runes/assembly/indexer/Field/Field.BODY (mut i64) (i64.const 0))
 (global $~lib/metashrew-runes/assembly/indexer/Field/Field.FLAGS (mut i64) (i64.const 2))
 (global $~lib/metashrew-runes/assembly/indexer/Field/Field.RUNE (mut i64) (i64.const 4))
 (global $~lib/metashrew-runes/assembly/indexer/Field/Field.PREMINE (mut i64) (i64.const 6))
 (global $~lib/metashrew-runes/assembly/indexer/Field/Field.CAP (mut i64) (i64.const 8))
 (global $~lib/metashrew-runes/assembly/indexer/Field/Field.AMOUNT (mut i64) (i64.const 10))
 (global $~lib/metashrew-runes/assembly/indexer/Field/Field.HEIGHTSTART (mut i64) (i64.const 12))
 (global $~lib/metashrew-runes/assembly/indexer/Field/Field.HEIGHTEND (mut i64) (i64.const 14))
 (global $~lib/metashrew-runes/assembly/indexer/Field/Field.OFFSETSTART (mut i64) (i64.const 16))
 (global $~lib/metashrew-runes/assembly/indexer/Field/Field.OFFSETEND (mut i64) (i64.const 18))
 (global $~lib/metashrew-runes/assembly/indexer/Field/Field.MINT (mut i64) (i64.const 20))
 (global $~lib/metashrew-runes/assembly/indexer/Field/Field.POINTER (mut i64) (i64.const 22))
 (global $~lib/metashrew-runes/assembly/indexer/Field/Field.CENOTAPH (mut i64) (i64.const 126))
 (global $~lib/metashrew-runes/assembly/indexer/Field/Field.DIVISIBILITY (mut i64) (i64.const 1))
 (global $~lib/metashrew-runes/assembly/indexer/Field/Field.SPACERS (mut i64) (i64.const 3))
 (global $~lib/metashrew-runes/assembly/indexer/Field/Field.SYMBOL (mut i64) (i64.const 5))
 (global $~lib/metashrew-runes/assembly/indexer/Field/Field.NOP (mut i64) (i64.const 127))
 (global $~lib/metashrew-runes/assembly/indexer/Flag/Flag.ETCHING (mut i64) (i64.const 0))
 (global $~lib/metashrew-runes/assembly/indexer/Flag/Flag.TERMS (mut i64) (i64.const 1))
 (global $~lib/metashrew-runes/assembly/indexer/Flag/Flag.CENOTAPH (mut i64) (i64.const 127))
 (global $~lib/protorune/assembly/indexer/fields/ProtoruneField/ProtoruneField.BODY (mut i64) (i64.const 0))
 (global $~lib/protorune/assembly/indexer/fields/ProtoruneField/ProtoruneField.FLAGS (mut i64) (i64.const 2))
 (global $~lib/protorune/assembly/indexer/fields/ProtoruneField/ProtoruneField.MESSAGE (mut i64) (i64.const 81))
 (global $~lib/protorune/assembly/indexer/fields/ProtoruneField/ProtoruneField.BURN (mut i64) (i64.const 83))
 (global $~lib/protorune/assembly/indexer/fields/ProtoruneField/ProtoruneField.SPLIT (mut i64) (i64.const 85))
 (global $~lib/protorune/assembly/indexer/fields/ProtoruneField/ProtoruneField.POINTER (mut i64) (i64.const 91))
 (global $~lib/protorune/assembly/indexer/fields/ProtoruneField/ProtoruneField.REFUND (mut i64) (i64.const 93))
 (global $~lib/protorune/assembly/indexer/fields/ProtoruneField/ProtoruneField.FROM (mut i64) (i64.const 95))
 (global $~lib/protorune/assembly/indexer/fields/ProtoruneField/ProtoruneField.CENOTAPH (mut i64) (i64.const 126))
 (global $~lib/protorune/assembly/indexer/fields/ProtoruneField/ProtoruneField.NOP (mut i64) (i64.const 127))
 (global $~lib/protorune/assembly/indexer/tables/protorune/PROTOCOLS_TO_INDEX (mut i32) (i32.const 0))
 (global $~lib/protorune/assembly/constants/PROTOCOL_FIELD i64 (i64.const 16383))
 (global $~lib/quorumgenesisprotorune/assembly/tables/PROPOSALS (mut i32) (i32.const 0))
 (global $~lib/quorumgenesisprotorune/assembly/tables/RUNE_TO_OUTPOINT (mut i32) (i32.const 0))
 (global $~lib/quorumgenesisprotorune/assembly/tables/OUTPOINT_TO_RUNE_RANGES (mut i32) (i32.const 0))
 (global $assembly/indexer/tables/ALKANES_INDEX (mut i32) (i32.const 0))
 (global $assembly/indexer/vm/FUEL_LIMIT i64 (i64.const 268435456))
 (global $assembly/indexer/vm/MEMORY_LIMIT i32 (i32.const 268435456))
 (global $~lib/memory/__heap_base i32 (i32.const 6428))
 (memory $0 1 32768)
 (data $0 (i32.const 12) "\1c\02\00\00\00\00\00\00\00\00\00\00\04\00\00\00\00\02\00\00000102030405060708090a0b0c0d0e0f101112131415161718191a1b1c1d1e1f202122232425262728292a2b2c2d2e2f303132333435363738393a3b3c3d3e3f404142434445464748494a4b4c4d4e4f505152535455565758595a5b5c5d5e5f606162636465666768696a6b6c6d6e6f707172737475767778797a7b7c7d7e7f808182838485868788898a8b8c8d8e8f909192939495969798999a9b9c9d9e9fa0a1a2a3a4a5a6a7a8a9aaabacadaeafb0b1b2b3b4b5b6b7b8b9babbbcbdbebfc0c1c2c3c4c5c6c7c8c9cacbcccdcecfd0d1d2d3d4d5d6d7d8d9dadbdcdddedfe0e1e2e3e4e5e6e7e8e9eaebecedeeeff0f1f2f3f4f5f6f7f8f9fafbfcfdfeff\00\00\00\00\00\00\00\00\00\00\00\00")
 (data $1 (i32.const 556) "<\00\00\00\00\00\00\00\00\00\00\00\02\00\00\00(\00\00\00A\00l\00l\00o\00c\00a\00t\00i\00o\00n\00 \00t\00o\00o\00 \00l\00a\00r\00g\00e\00\00\00\00\00")
 (data $2 (i32.const 620) "<\00\00\00\00\00\00\00\00\00\00\00\02\00\00\00\1e\00\00\00~\00l\00i\00b\00/\00r\00t\00/\00s\00t\00u\00b\00.\00t\00s\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00")
 (data $3 (i32.const 684) "\1c\02\00\00\00\00\00\00\00\00\00\00\04\00\00\00\00\02\00\00000102030405060708090a0b0c0d0e0f101112131415161718191a1b1c1d1e1f202122232425262728292a2b2c2d2e2f303132333435363738393a3b3c3d3e3f404142434445464748494a4b4c4d4e4f505152535455565758595a5b5c5d5e5f606162636465666768696a6b6c6d6e6f707172737475767778797a7b7c7d7e7f808182838485868788898a8b8c8d8e8f909192939495969798999a9b9c9d9e9fa0a1a2a3a4a5a6a7a8a9aaabacadaeafb0b1b2b3b4b5b6b7b8b9babbbcbdbebfc0c1c2c3c4c5c6c7c8c9cacbcccdcecfd0d1d2d3d4d5d6d7d8d9dadbdcdddedfe0e1e2e3e4e5e6e7e8e9eaebecedeeeff0f1f2f3f4f5f6f7f8f9fafbfcfdfeff\00\00\00\00\00\00\00\00\00\00\00\00")
 (data $4 (i32.const 1228) "\1c\01\00\00\00\00\00\00\00\00\00\00\01\00\00\00\00\01\00\00\98/\8aB\91D7q\cf\fb\c0\b5\a5\db\b5\e9[\c2V9\f1\11\f1Y\a4\82?\92\d5^\1c\ab\98\aa\07\d8\01[\83\12\be\851$\c3}\0cUt]\ber\fe\b1\de\80\a7\06\dc\9bt\f1\9b\c1\c1i\9b\e4\86G\be\ef\c6\9d\c1\0f\cc\a1\0c$o,\e9-\aa\84tJ\dc\a9\b0\\\da\88\f9vRQ>\98m\c61\a8\c8\'\03\b0\c7\7fY\bf\f3\0b\e0\c6G\91\a7\d5Qc\ca\06g))\14\85\n\b7\'8!\1b.\fcm,M\13\r8STs\ne\bb\njv.\c9\c2\81\85,r\92\a1\e8\bf\a2Kf\1a\a8p\8bK\c2\a3Ql\c7\19\e8\92\d1$\06\99\d6\855\0e\f4p\a0j\10\16\c1\a4\19\08l7\1eLwH\'\b5\bc\b04\b3\0c\1c9J\aa\d8NO\ca\9c[\f3o.h\ee\82\8ftoc\a5x\14x\c8\84\08\02\c7\8c\fa\ff\be\90\eblP\a4\f7\a3\f9\be\f2xq\c6\00\00\00\00\00\00\00\00\00\00\00\00")
 (data $5 (i32.const 1516) ",\00\00\00\00\00\00\00\00\00\00\00\06\00\00\00\10\00\00\00\e0\04\00\00\e0\04\00\00\00\01\00\00@\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00")
 (data $6 (i32.const 1564) ",\00\00\00\00\00\00\00\00\00\00\00\02\00\00\00\1c\00\00\00I\00n\00v\00a\00l\00i\00d\00 \00l\00e\00n\00g\00t\00h\00")
 (data $7 (i32.const 1612) "<\00\00\00\00\00\00\00\00\00\00\00\02\00\00\00&\00\00\00~\00l\00i\00b\00/\00a\00r\00r\00a\00y\00b\00u\00f\00f\00e\00r\00.\00t\00s\00\00\00\00\00\00\00")
 (data $8 (i32.const 1676) ",\00\00\00\00\00\00\00\00\00\00\00\02\00\00\00\14\00\00\00u\00s\00e\00 \00s\00t\00r\00i\00c\00t\00\00\00\00\00\00\00\00\00")
 (data $9 (i32.const 1724) "\1c\00\00\00\00\00\00\00\00\00\00\00\02\00\00\00\02\00\00\001\00\00\00\00\00\00\00\00\00\00\00")
 (data $10 (i32.const 1756) "<\00\00\00\00\00\00\00\00\00\00\00\02\00\00\00$\00\00\00U\00n\00p\00a\00i\00r\00e\00d\00 \00s\00u\00r\00r\00o\00g\00a\00t\00e\00\00\00\00\00\00\00\00\00")
 (data $11 (i32.const 1820) ",\00\00\00\00\00\00\00\00\00\00\00\02\00\00\00\1c\00\00\00~\00l\00i\00b\00/\00s\00t\00r\00i\00n\00g\00.\00t\00s\00")
 (data $12 (i32.const 1868) "\1c\01\00\00\00\00\00\00\00\00\00\00\04\00\00\00\00\01\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\0f\00\n\11\15\14\1a\1e\07\05\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\1d\00\18\r\19\t\08\17\00\12\16\1f\1b\13\00\01\00\03\10\0b\1c\0c\0e\06\04\02\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00")
 (data $13 (i32.const 2156) "<\00\00\00\00\00\00\00\00\00\00\00\04\00\00\00 \00\00\00qpzry9x8gf2tvdw0s3jn54khce6mua7l\00\00\00\00\00\00\00\00\00\00\00\00")
 (data $14 (i32.const 2220) "L\00\00\00\00\00\00\00\00\00\00\00\04\00\00\00:\00\00\00123456789ABCDEFGHJKLMNPQRSTUVWXYZabcdefghijkmnopqrstuvwxyz\00\00")
 (data $15 (i32.const 2300) "<\00\00\00\00\00\00\00\00\00\00\00\02\00\00\00$\00\00\00I\00n\00d\00e\00x\00 \00o\00u\00t\00 \00o\00f\00 \00r\00a\00n\00g\00e\00\00\00\00\00\00\00\00\00")
 (data $16 (i32.const 2364) "<\00\00\00\00\00\00\00\00\00\00\00\02\00\00\00&\00\00\00~\00l\00i\00b\00/\00s\00t\00a\00t\00i\00c\00a\00r\00r\00a\00y\00.\00t\00s\00\00\00\00\00\00\00")
 (data $17 (i32.const 2428) "<\00\00\00\00\00\00\00\00\00\00\00\02\00\00\00(\00\00\00/\00b\00l\00o\00c\00k\00h\00a\00s\00h\00/\00b\00y\00h\00e\00i\00g\00h\00t\00/\00\00\00\00\00")
 (data $18 (i32.const 2492) "<\00\00\00\00\00\00\00\00\00\00\00\02\00\00\00(\00\00\00/\00h\00e\00i\00g\00h\00t\00/\00b\00y\00b\00l\00o\00c\00k\00h\00a\00s\00h\00/\00\00\00\00\00")
 (data $19 (i32.const 2556) "<\00\00\00\00\00\00\00\00\00\00\00\02\00\00\00$\00\00\00/\00r\00u\00n\00e\00s\00/\00b\00y\00o\00u\00t\00p\00o\00i\00n\00t\00/\00\00\00\00\00\00\00\00\00")
 (data $20 (i32.const 2620) "<\00\00\00\00\00\00\00\00\00\00\00\02\00\00\00&\00\00\00/\00h\00e\00i\00g\00h\00t\00/\00b\00y\00o\00u\00t\00p\00o\00i\00n\00t\00/\00\00\00\00\00\00\00")
 (data $21 (i32.const 2684) "<\00\00\00\00\00\00\00\00\00\00\00\02\00\00\00\1e\00\00\00/\00t\00x\00i\00d\00s\00/\00b\00y\00h\00e\00i\00g\00h\00t\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00")
 (data $22 (i32.const 2748) ",\00\00\00\00\00\00\00\00\00\00\00\02\00\00\00\1c\00\00\00/\00r\00u\00n\00e\00s\00/\00s\00y\00m\00b\00o\00l\00/\00")
 (data $23 (i32.const 2796) ",\00\00\00\00\00\00\00\00\00\00\00\02\00\00\00\16\00\00\00/\00r\00u\00n\00e\00s\00/\00c\00a\00p\00/\00\00\00\00\00\00\00")
 (data $24 (i32.const 2844) ",\00\00\00\00\00\00\00\00\00\00\00\02\00\00\00\1c\00\00\00/\00r\00u\00n\00e\00s\00/\00s\00p\00a\00c\00e\00s\00/\00")
 (data $25 (i32.const 2892) "<\00\00\00\00\00\00\00\00\00\00\00\02\00\00\00$\00\00\00/\00r\00u\00n\00e\00s\00/\00o\00f\00f\00s\00e\00t\00/\00e\00n\00d\00/\00\00\00\00\00\00\00\00\00")
 (data $26 (i32.const 2956) "<\00\00\00\00\00\00\00\00\00\00\00\02\00\00\00(\00\00\00/\00r\00u\00n\00e\00s\00/\00o\00f\00f\00s\00e\00t\00/\00s\00t\00a\00r\00t\00/\00\00\00\00\00")
 (data $27 (i32.const 3020) "<\00\00\00\00\00\00\00\00\00\00\00\02\00\00\00(\00\00\00/\00r\00u\00n\00e\00s\00/\00h\00e\00i\00g\00h\00t\00/\00s\00t\00a\00r\00t\00/\00\00\00\00\00")
 (data $28 (i32.const 3084) "<\00\00\00\00\00\00\00\00\00\00\00\02\00\00\00$\00\00\00/\00r\00u\00n\00e\00s\00/\00h\00e\00i\00g\00h\00t\00/\00e\00n\00d\00/\00\00\00\00\00\00\00\00\00")
 (data $29 (i32.const 3148) ",\00\00\00\00\00\00\00\00\00\00\00\02\00\00\00\1c\00\00\00/\00r\00u\00n\00e\00s\00/\00a\00m\00o\00u\00n\00t\00/\00")
 (data $30 (i32.const 3196) "L\00\00\00\00\00\00\00\00\00\00\00\02\00\00\00.\00\00\00/\00r\00u\00n\00e\00s\00/\00m\00i\00n\00t\00s\00-\00r\00e\00m\00a\00i\00n\00i\00n\00g\00/\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00")
 (data $31 (i32.const 3276) "<\00\00\00\00\00\00\00\00\00\00\00\02\00\00\00\1e\00\00\00/\00r\00u\00n\00e\00s\00/\00p\00r\00e\00m\00i\00n\00e\00/\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00")
 (data $32 (i32.const 3340) "<\00\00\00\00\00\00\00\00\00\00\00\02\00\00\00(\00\00\00/\00r\00u\00n\00e\00s\00/\00d\00i\00v\00i\00s\00i\00b\00i\00l\00i\00t\00y\00/\00\00\00\00\00")
 (data $33 (i32.const 3404) "<\00\00\00\00\00\00\00\00\00\00\00\02\00\00\00\"\00\00\00/\00h\00e\00i\00g\00h\00t\00/\00b\00y\00r\00u\00n\00e\00i\00d\00/\00\00\00\00\00\00\00\00\00\00\00")
 (data $34 (i32.const 3468) ",\00\00\00\00\00\00\00\00\00\00\00\02\00\00\00\18\00\00\00/\00r\00u\00n\00e\00s\00/\00n\00a\00m\00e\00s\00\00\00\00\00")
 (data $35 (i32.const 3516) "<\00\00\00\00\00\00\00\00\00\00\00\02\00\00\00$\00\00\00/\00e\00t\00c\00h\00i\00n\00g\00/\00b\00y\00r\00u\00n\00e\00i\00d\00/\00\00\00\00\00\00\00\00\00")
 (data $36 (i32.const 3580) "<\00\00\00\00\00\00\00\00\00\00\00\02\00\00\00$\00\00\00/\00r\00u\00n\00e\00i\00d\00/\00b\00y\00e\00t\00c\00h\00i\00n\00g\00/\00\00\00\00\00\00\00\00\00")
 (data $37 (i32.const 3644) "<\00\00\00\00\00\00\00\00\00\00\00\02\00\00\00\"\00\00\009\009\002\004\006\001\001\004\009\002\008\001\004\009\004\006\002\00\00\00\00\00\00\00\00\00\00\00")
 (data $38 (i32.const 3708) ",\00\00\00\00\00\00\00\00\00\00\00\02\00\00\00\1a\00\00\00I\00n\00v\00a\00l\00i\00d\00 \00r\00a\00d\00i\00x\00\00\00")
 (data $39 (i32.const 3756) "\\\00\00\00\00\00\00\00\00\00\00\00\02\00\00\00@\00\00\00~\00l\00i\00b\00/\00a\00s\00-\00b\00i\00g\00n\00u\00m\00/\00a\00s\00s\00e\00m\00b\00l\00y\00/\00u\00t\00i\00l\00s\00.\00t\00s\00\00\00\00\00\00\00\00\00\00\00\00\00")
 (data $40 (i32.const 3852) "\00\01\02\03\04\05\06\07\08\t$$$$$$$\n\0b\0c\r\0e\0f\10\11\12\13\14\15\16\17\18\19\1a\1b\1c\1d\1e\1f !\"#$$$$$$\n\0b\0c\r\0e\0f\10\11\12\13\14\15\16\17\18\19\1a\1b\1c\1d\1e\1f !\"#")
 (data $41 (i32.const 3932) "\\\00\00\00\00\00\00\00\00\00\00\00\02\00\00\00J\00\00\006\004\000\002\003\006\004\003\006\003\004\001\005\004\004\003\006\000\003\002\002\008\005\004\001\002\005\009\009\003\006\002\001\001\009\002\006\00\00\00")
 (data $42 (i32.const 4028) ",\00\00\00\00\00\00\00\00\00\00\00\02\00\00\00\16\00\00\00/\00p\00r\00o\00p\00o\00s\00a\00l\00s\00/\00\00\00\00\00\00\00")
 (data $43 (i32.const 4076) "<\00\00\00\00\00\00\00\00\00\00\00\02\00\00\00 \00\00\00/\00o\00u\00t\00p\00o\00i\00n\00t\00/\00b\00y\00r\00u\00n\00e\00\00\00\00\00\00\00\00\00\00\00\00\00")
 (data $44 (i32.const 4140) "<\00\00\00\00\00\00\00\00\00\00\00\02\00\00\00 \00\00\00/\00r\00u\00n\00e\00/\00b\00y\00o\00u\00t\00p\00o\00i\00n\00t\00\00\00\00\00\00\00\00\00\00\00\00\00")
 (data $45 (i32.const 4204) ",\00\00\00\00\00\00\00\00\00\00\00\02\00\00\00\12\00\00\00/\00a\00l\00k\00a\00n\00e\00s\00/\00\00\00\00\00\00\00\00\00\00\00")
 (data $46 (i32.const 4252) ",\00\00\00\00\00\00\00\00\00\00\00\02\00\00\00\1a\00\00\00~\00l\00i\00b\00/\00a\00r\00r\00a\00y\00.\00t\00s\00\00\00")
 (data $47 (i32.const 4300) "|\00\00\00\00\00\00\00\00\00\00\00\02\00\00\00^\00\00\00E\00l\00e\00m\00e\00n\00t\00 \00t\00y\00p\00e\00 \00m\00u\00s\00t\00 \00b\00e\00 \00n\00u\00l\00l\00a\00b\00l\00e\00 \00i\00f\00 \00a\00r\00r\00a\00y\00 \00i\00s\00 \00h\00o\00l\00e\00y\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00")
 (data $48 (i32.const 4428) ",\00\00\00\00\00\00\00\00\00\00\00\02\00\00\00\14\00\00\00g\00o\00t\00 \00b\00l\00o\00c\00k\00 \00\00\00\00\00\00\00\00\00")
 (data $49 (i32.const 4476) "|\00\00\00\00\00\00\00\00\00\00\00\02\00\00\00d\00\00\00t\00o\00S\00t\00r\00i\00n\00g\00(\00)\00 \00r\00a\00d\00i\00x\00 \00a\00r\00g\00u\00m\00e\00n\00t\00 \00m\00u\00s\00t\00 \00b\00e\00 \00b\00e\00t\00w\00e\00e\00n\00 \002\00 \00a\00n\00d\00 \003\006\00\00\00\00\00\00\00\00\00")
 (data $50 (i32.const 4604) "<\00\00\00\00\00\00\00\00\00\00\00\02\00\00\00&\00\00\00~\00l\00i\00b\00/\00u\00t\00i\00l\00/\00n\00u\00m\00b\00e\00r\00.\00t\00s\00\00\00\00\00\00\00")
 (data $51 (i32.const 4668) "\1c\00\00\00\00\00\00\00\00\00\00\00\02\00\00\00\02\00\00\000\00\00\00\00\00\00\00\00\00\00\00")
 (data $52 (i32.const 4700) "0\000\000\001\000\002\000\003\000\004\000\005\000\006\000\007\000\008\000\009\001\000\001\001\001\002\001\003\001\004\001\005\001\006\001\007\001\008\001\009\002\000\002\001\002\002\002\003\002\004\002\005\002\006\002\007\002\008\002\009\003\000\003\001\003\002\003\003\003\004\003\005\003\006\003\007\003\008\003\009\004\000\004\001\004\002\004\003\004\004\004\005\004\006\004\007\004\008\004\009\005\000\005\001\005\002\005\003\005\004\005\005\005\006\005\007\005\008\005\009\006\000\006\001\006\002\006\003\006\004\006\005\006\006\006\007\006\008\006\009\007\000\007\001\007\002\007\003\007\004\007\005\007\006\007\007\007\008\007\009\008\000\008\001\008\002\008\003\008\004\008\005\008\006\008\007\008\008\008\009\009\000\009\001\009\002\009\003\009\004\009\005\009\006\009\007\009\008\009\009\00")
 (data $53 (i32.const 5100) "\1c\04\00\00\00\00\00\00\00\00\00\00\02\00\00\00\00\04\00\000\000\000\001\000\002\000\003\000\004\000\005\000\006\000\007\000\008\000\009\000\00a\000\00b\000\00c\000\00d\000\00e\000\00f\001\000\001\001\001\002\001\003\001\004\001\005\001\006\001\007\001\008\001\009\001\00a\001\00b\001\00c\001\00d\001\00e\001\00f\002\000\002\001\002\002\002\003\002\004\002\005\002\006\002\007\002\008\002\009\002\00a\002\00b\002\00c\002\00d\002\00e\002\00f\003\000\003\001\003\002\003\003\003\004\003\005\003\006\003\007\003\008\003\009\003\00a\003\00b\003\00c\003\00d\003\00e\003\00f\004\000\004\001\004\002\004\003\004\004\004\005\004\006\004\007\004\008\004\009\004\00a\004\00b\004\00c\004\00d\004\00e\004\00f\005\000\005\001\005\002\005\003\005\004\005\005\005\006\005\007\005\008\005\009\005\00a\005\00b\005\00c\005\00d\005\00e\005\00f\006\000\006\001\006\002\006\003\006\004\006\005\006\006\006\007\006\008\006\009\006\00a\006\00b\006\00c\006\00d\006\00e\006\00f\007\000\007\001\007\002\007\003\007\004\007\005\007\006\007\007\007\008\007\009\007\00a\007\00b\007\00c\007\00d\007\00e\007\00f\008\000\008\001\008\002\008\003\008\004\008\005\008\006\008\007\008\008\008\009\008\00a\008\00b\008\00c\008\00d\008\00e\008\00f\009\000\009\001\009\002\009\003\009\004\009\005\009\006\009\007\009\008\009\009\009\00a\009\00b\009\00c\009\00d\009\00e\009\00f\00a\000\00a\001\00a\002\00a\003\00a\004\00a\005\00a\006\00a\007\00a\008\00a\009\00a\00a\00a\00b\00a\00c\00a\00d\00a\00e\00a\00f\00b\000\00b\001\00b\002\00b\003\00b\004\00b\005\00b\006\00b\007\00b\008\00b\009\00b\00a\00b\00b\00b\00c\00b\00d\00b\00e\00b\00f\00c\000\00c\001\00c\002\00c\003\00c\004\00c\005\00c\006\00c\007\00c\008\00c\009\00c\00a\00c\00b\00c\00c\00c\00d\00c\00e\00c\00f\00d\000\00d\001\00d\002\00d\003\00d\004\00d\005\00d\006\00d\007\00d\008\00d\009\00d\00a\00d\00b\00d\00c\00d\00d\00d\00e\00d\00f\00e\000\00e\001\00e\002\00e\003\00e\004\00e\005\00e\006\00e\007\00e\008\00e\009\00e\00a\00e\00b\00e\00c\00e\00d\00e\00e\00e\00f\00f\000\00f\001\00f\002\00f\003\00f\004\00f\005\00f\006\00f\007\00f\008\00f\009\00f\00a\00f\00b\00f\00c\00f\00d\00f\00e\00f\00f\00\00\00\00\00\00\00\00\00\00\00\00\00")
 (data $54 (i32.const 6156) "\\\00\00\00\00\00\00\00\00\00\00\00\02\00\00\00H\00\00\000\001\002\003\004\005\006\007\008\009\00a\00b\00c\00d\00e\00f\00g\00h\00i\00j\00k\00l\00m\00n\00o\00p\00q\00r\00s\00t\00u\00v\00w\00x\00y\00z\00\00\00\00\00")
 (data $55 (i32.const 6252) "\1c\00\00\00\00\00\00\00\00\00\00\00\02\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00")
 (data $56 (i32.const 6284) "<\00\00\00\00\00\00\00\00\00\00\00\02\00\00\00$\00\00\00K\00e\00y\00 \00d\00o\00e\00s\00 \00n\00o\00t\00 \00e\00x\00i\00s\00t\00\00\00\00\00\00\00\00\00")
 (data $57 (i32.const 6348) ",\00\00\00\00\00\00\00\00\00\00\00\02\00\00\00\16\00\00\00~\00l\00i\00b\00/\00m\00a\00p\00.\00t\00s\00\00\00\00\00\00\00")
 (data $58 (i32.const 6396) "\1c\00\00\00\00\00\00\00\00\00\00\00$\00\00\00\08\00\00\00\01\00\00\00\00\00\00\00\00\00\00\00")
 (table $0 2 2 funcref)
 (elem $0 (i32.const 1) $~lib/metashrew-as/assembly/indexer/index/_flush~anonymous|0)
 (export "_start" (func $assembly/indexer/index/_start))
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
 (func $~lib/metashrew-as/assembly/utils/yabsp/Console#constructor (param $this i32) (result i32)
  local.get $this
  i32.eqz
  if
   i32.const 0
   i32.const 8
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
         i32.const 1776
         i32.const 1840
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
 (func $start:~lib/metashrew-as/assembly/utils/b32
  (local $0 i32)
  (local $1 i32)
  i32.const 1696
  drop
  i32.const 1744
  i32.const 0
  i32.const 1
  global.set $~argumentsLength
  i32.const 0
  call $~lib/string/String.UTF8.encode@varargs
  global.set $~lib/metashrew-as/assembly/utils/b32/ONE
 )
 (func $~lib/staticarray/StaticArray<u8>#get:length (param $this i32) (result i32)
  local.get $this
  i32.const 20
  i32.sub
  call $~lib/rt/common/OBJECT#get:rtSize
  i32.const 0
  i32.shr_u
  return
 )
 (func $~lib/staticarray/StaticArray<u8>#__get (param $this i32) (param $index i32) (result i32)
  (local $value i32)
  local.get $index
  local.get $this
  call $~lib/staticarray/StaticArray<u8>#get:length
  i32.ge_u
  if
   i32.const 2320
   i32.const 2384
   i32.const 78
   i32.const 41
   call $~lib/builtins/abort
   unreachable
  end
  local.get $this
  local.get $index
  i32.const 0
  i32.shl
  i32.add
  i32.load8_u
  local.set $value
  i32.const 0
  drop
  local.get $value
  return
 )
 (func $start:~lib/metashrew-as/assembly/utils/b58
  (local $0 i32)
  i32.const 1696
  drop
  global.get $~lib/metashrew-as/assembly/utils/b58/ALPHABET
  i32.const 0
  call $~lib/staticarray/StaticArray<u8>#__get
  global.set $~lib/metashrew-as/assembly/utils/b58/LEADER
 )
 (func $start:~lib/metashrew-as/assembly/blockdata/address
  call $start:~lib/metashrew-as/assembly/utils/b32
  call $start:~lib/metashrew-as/assembly/utils/b58
 )
 (func $start:~lib/metashrew-as/assembly/blockdata/transaction
  call $start:~lib/metashrew-as/assembly/utils/yabsp
  call $start:~lib/metashrew-as/assembly/blockdata/address
 )
 (func $start:~lib/metashrew-as/assembly/blockdata/block
  call $start:~lib/metashrew-as/assembly/blockdata/transaction
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
   i32.const 9
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
   i32.const 3728
   i32.const 3776
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
  i32.const 2448
  call $~lib/metashrew-as/assembly/indexer/tables/IndexPointer.for
  global.set $~lib/metashrew-runes/assembly/indexer/constants/index/HEIGHT_TO_BLOCKHASH
  i32.const 2512
  call $~lib/metashrew-as/assembly/indexer/tables/IndexPointer.for
  global.set $~lib/metashrew-runes/assembly/indexer/constants/index/BLOCKHASH_TO_HEIGHT
  i32.const 2576
  call $~lib/metashrew-as/assembly/indexer/tables/IndexPointer.for
  global.set $~lib/metashrew-runes/assembly/indexer/constants/index/OUTPOINT_TO_RUNES
  i32.const 2640
  call $~lib/metashrew-as/assembly/indexer/tables/IndexPointer.for
  global.set $~lib/metashrew-runes/assembly/indexer/constants/index/OUTPOINT_TO_HEIGHT
  i32.const 2704
  call $~lib/metashrew-as/assembly/indexer/tables/IndexPointer.for
  global.set $~lib/metashrew-runes/assembly/indexer/constants/index/HEIGHT_TO_TRANSACTION_IDS
  i32.const 2768
  call $~lib/metashrew-as/assembly/indexer/tables/IndexPointer.for
  global.set $~lib/metashrew-runes/assembly/indexer/constants/index/SYMBOL
  i32.const 2816
  call $~lib/metashrew-as/assembly/indexer/tables/IndexPointer.for
  global.set $~lib/metashrew-runes/assembly/indexer/constants/index/CAP
  i32.const 2864
  call $~lib/metashrew-as/assembly/indexer/tables/IndexPointer.for
  global.set $~lib/metashrew-runes/assembly/indexer/constants/index/SPACERS
  i32.const 2912
  call $~lib/metashrew-as/assembly/indexer/tables/IndexPointer.for
  global.set $~lib/metashrew-runes/assembly/indexer/constants/index/OFFSETEND
  i32.const 2976
  call $~lib/metashrew-as/assembly/indexer/tables/IndexPointer.for
  global.set $~lib/metashrew-runes/assembly/indexer/constants/index/OFFSETSTART
  i32.const 3040
  call $~lib/metashrew-as/assembly/indexer/tables/IndexPointer.for
  global.set $~lib/metashrew-runes/assembly/indexer/constants/index/HEIGHTSTART
  i32.const 3104
  call $~lib/metashrew-as/assembly/indexer/tables/IndexPointer.for
  global.set $~lib/metashrew-runes/assembly/indexer/constants/index/HEIGHTEND
  i32.const 3168
  call $~lib/metashrew-as/assembly/indexer/tables/IndexPointer.for
  global.set $~lib/metashrew-runes/assembly/indexer/constants/index/AMOUNT
  i32.const 3216
  call $~lib/metashrew-as/assembly/indexer/tables/IndexPointer.for
  global.set $~lib/metashrew-runes/assembly/indexer/constants/index/MINTS_REMAINING
  i32.const 3296
  call $~lib/metashrew-as/assembly/indexer/tables/IndexPointer.for
  global.set $~lib/metashrew-runes/assembly/indexer/constants/index/PREMINE
  i32.const 3360
  call $~lib/metashrew-as/assembly/indexer/tables/IndexPointer.for
  global.set $~lib/metashrew-runes/assembly/indexer/constants/index/DIVISIBILITY
  i32.const 3424
  call $~lib/metashrew-as/assembly/indexer/tables/IndexPointer.for
  global.set $~lib/metashrew-runes/assembly/indexer/constants/index/RUNE_ID_TO_HEIGHT
  i32.const 3488
  call $~lib/metashrew-as/assembly/indexer/tables/IndexPointer.for
  global.set $~lib/metashrew-runes/assembly/indexer/constants/index/ETCHINGS
  i32.const 3536
  call $~lib/metashrew-as/assembly/indexer/tables/IndexPointer.for
  global.set $~lib/metashrew-runes/assembly/indexer/constants/index/RUNE_ID_TO_ETCHING
  i32.const 3600
  call $~lib/metashrew-as/assembly/indexer/tables/IndexPointer.for
  global.set $~lib/metashrew-runes/assembly/indexer/constants/index/ETCHING_TO_RUNE_ID
  block $~lib/as-bignum/assembly/integer/u128/u128.from<~lib/string/String>|inlined.0 (result i32)
   i32.const 3664
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
   i32.const 3952
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
 (func $start:~lib/metashrew-runes/assembly/indexer/RuneId
  call $start:~lib/metashrew-runes/assembly/indexer/constants/index
 )
 (func $~lib/set/Set<~lib/string/String>#set:buckets (param $this i32) (param $buckets i32)
  local.get $this
  local.get $buckets
  i32.store
  local.get $this
  local.get $buckets
  i32.const 0
  call $~lib/rt/stub/__link
 )
 (func $~lib/set/Set<~lib/string/String>#set:bucketsMask (param $this i32) (param $bucketsMask i32)
  local.get $this
  local.get $bucketsMask
  i32.store offset=4
 )
 (func $~lib/set/Set<~lib/string/String>#set:entries (param $this i32) (param $entries i32)
  local.get $this
  local.get $entries
  i32.store offset=8
  local.get $this
  local.get $entries
  i32.const 0
  call $~lib/rt/stub/__link
 )
 (func $~lib/set/Set<~lib/string/String>#set:entriesCapacity (param $this i32) (param $entriesCapacity i32)
  local.get $this
  local.get $entriesCapacity
  i32.store offset=12
 )
 (func $~lib/set/Set<~lib/string/String>#set:entriesOffset (param $this i32) (param $entriesOffset i32)
  local.get $this
  local.get $entriesOffset
  i32.store offset=16
 )
 (func $~lib/set/Set<~lib/string/String>#set:entriesCount (param $this i32) (param $entriesCount i32)
  local.get $this
  local.get $entriesCount
  i32.store offset=20
 )
 (func $~lib/set/Set<~lib/string/String>#constructor (param $this i32) (result i32)
  local.get $this
  i32.eqz
  if
   i32.const 24
   i32.const 16
   call $~lib/rt/stub/__new
   local.set $this
  end
  local.get $this
  i32.const 0
  i32.const 4
  i32.const 4
  i32.mul
  call $~lib/arraybuffer/ArrayBuffer#constructor
  call $~lib/set/Set<~lib/string/String>#set:buckets
  local.get $this
  i32.const 4
  i32.const 1
  i32.sub
  call $~lib/set/Set<~lib/string/String>#set:bucketsMask
  local.get $this
  i32.const 0
  i32.const 4
  block $~lib/set/ENTRY_SIZE<~lib/string/String>|inlined.0 (result i32)
   i32.const 8
   br $~lib/set/ENTRY_SIZE<~lib/string/String>|inlined.0
  end
  i32.mul
  call $~lib/arraybuffer/ArrayBuffer#constructor
  call $~lib/set/Set<~lib/string/String>#set:entries
  local.get $this
  i32.const 4
  call $~lib/set/Set<~lib/string/String>#set:entriesCapacity
  local.get $this
  i32.const 0
  call $~lib/set/Set<~lib/string/String>#set:entriesOffset
  local.get $this
  i32.const 0
  call $~lib/set/Set<~lib/string/String>#set:entriesCount
  local.get $this
 )
 (func $~lib/protorune/assembly/indexer/tables/protorune/ProtocolIndexer#set:set (param $this i32) (param $set i32)
  local.get $this
  local.get $set
  i32.store
  local.get $this
  local.get $set
  i32.const 0
  call $~lib/rt/stub/__link
 )
 (func $~lib/protorune/assembly/indexer/tables/protorune/ProtocolIndexer#constructor (param $this i32) (result i32)
  local.get $this
  i32.eqz
  if
   i32.const 4
   i32.const 15
   call $~lib/rt/stub/__new
   local.set $this
  end
  local.get $this
  call $~lib/object/Object#constructor
  local.set $this
  local.get $this
  i32.const 0
  call $~lib/set/Set<~lib/string/String>#constructor
  call $~lib/protorune/assembly/indexer/tables/protorune/ProtocolIndexer#set:set
  local.get $this
 )
 (func $start:~lib/protorune/assembly/indexer/tables/protorune
  i32.const 0
  call $~lib/protorune/assembly/indexer/tables/protorune/ProtocolIndexer#constructor
  global.set $~lib/protorune/assembly/indexer/tables/protorune/PROTOCOLS_TO_INDEX
 )
 (func $start:~lib/protorune/assembly/indexer/protomessage/IncomingRune
  call $start:~lib/protorune/assembly/indexer/tables/protorune
 )
 (func $start:~lib/protorune/assembly/indexer/protomessage/MessageContext
  call $start:~lib/protorune/assembly/indexer/protomessage/IncomingRune
 )
 (func $start:~lib/protorune/assembly/indexer/protomessage/ProtoMessage
  call $start:~lib/protorune/assembly/indexer/protomessage/MessageContext
 )
 (func $start:~lib/protorune/assembly/indexer/protomessage/index
  call $start:~lib/protorune/assembly/indexer/protomessage/ProtoMessage
 )
 (func $start:~lib/protorune/assembly/indexer/Indexer
  call $start:~lib/protorune/assembly/indexer/protomessage/index
 )
 (func $start:~lib/protorune/assembly/indexer/index
  call $start:~lib/protorune/assembly/indexer/Indexer
 )
 (func $start:~lib/quorumgenesisprotorune/assembly/tables
  i32.const 4048
  call $~lib/metashrew-as/assembly/indexer/tables/IndexPointer.for
  global.set $~lib/quorumgenesisprotorune/assembly/tables/PROPOSALS
  i32.const 4096
  call $~lib/metashrew-as/assembly/indexer/tables/IndexPointer.for
  global.set $~lib/quorumgenesisprotorune/assembly/tables/RUNE_TO_OUTPOINT
  i32.const 4160
  call $~lib/metashrew-as/assembly/indexer/tables/IndexPointer.for
  global.set $~lib/quorumgenesisprotorune/assembly/tables/OUTPOINT_TO_RUNE_RANGES
 )
 (func $start:~lib/quorumgenesisprotorune/assembly/indexer/numbering/NumberingMixin
  call $start:~lib/quorumgenesisprotorune/assembly/tables
 )
 (func $start:~lib/quorumgenesisprotorune/assembly/indexer/numbering/index
  call $start:~lib/quorumgenesisprotorune/assembly/indexer/numbering/NumberingMixin
 )
 (func $start:assembly/indexer/tables
  i32.const 4224
  call $~lib/metashrew-as/assembly/indexer/tables/IndexPointer.for
  global.set $assembly/indexer/tables/ALKANES_INDEX
 )
 (func $start:assembly/indexer/vm
  call $start:assembly/indexer/tables
 )
 (func $start:assembly/indexer/index
  call $start:~lib/metashrew-as/assembly/indexer/index
  call $start:~lib/metashrew-as/assembly/blockdata/block
  call $start:~lib/metashrew-runes/assembly/indexer/RuneId
  call $start:~lib/protorune/assembly/indexer/index
  call $start:~lib/quorumgenesisprotorune/assembly/indexer/numbering/index
  call $start:assembly/indexer/vm
 )
 (func $~lib/metashrew-as/assembly/indexer/index/input (result i32)
  (local $data i32)
  i32.const 0
  call $~lib/metashrew-as/assembly/indexer/index/__host_len
  call $~lib/arraybuffer/ArrayBuffer#constructor
  local.set $data
  local.get $data
  call $~lib/metashrew-as/assembly/indexer/index/__load_input
  local.get $data
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
   i32.const 17
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
 (func $~lib/metashrew-as/assembly/utils/box/Box#shrinkFront (param $this i32) (param $distance i32) (result i32)
  local.get $this
  local.get $this
  call $~lib/metashrew-as/assembly/utils/box/Box#get:start
  local.get $distance
  i32.add
  call $~lib/metashrew-as/assembly/utils/box/Box#set:start
  local.get $this
  local.get $this
  call $~lib/metashrew-as/assembly/utils/box/Box#get:len
  local.get $distance
  i32.sub
  call $~lib/metashrew-as/assembly/utils/box/Box#set:len
  local.get $this
  return
 )
 (func $~lib/metashrew-as/assembly/utils/utils/parsePrimitive<u32> (param $data i32) (result i32)
  (local $result i32)
  local.get $data
  call $~lib/metashrew-as/assembly/utils/box/Box#get:start
  i32.load
  local.set $result
  local.get $data
  i32.const 4
  call $~lib/metashrew-as/assembly/utils/box/Box#shrinkFront
  drop
  local.get $result
  return
 )
 (func $~lib/metashrew-as/assembly/utils/pointer/nullptr<~lib/array/Array<~lib/metashrew-as/assembly/blockdata/transaction/Transaction>> (result i32)
  i32.const 0
  return
 )
 (func $~lib/metashrew-as/assembly/blockdata/block/Block#set:transactions (param $this i32) (param $transactions i32)
  local.get $this
  local.get $transactions
  i32.store offset=8
  local.get $this
  local.get $transactions
  i32.const 0
  call $~lib/rt/stub/__link
 )
 (func $~lib/metashrew-as/assembly/utils/pointer/nullptr<~lib/metashrew-as/assembly/utils/box/Box> (result i32)
  i32.const 0
  return
 )
 (func $~lib/metashrew-as/assembly/blockdata/block/Block#set:prevBlock (param $this i32) (param $prevBlock i32)
  local.get $this
  local.get $prevBlock
  i32.store offset=12
  local.get $this
  local.get $prevBlock
  i32.const 0
  call $~lib/rt/stub/__link
 )
 (func $~lib/metashrew-as/assembly/blockdata/block/Block#set:merkleRoot (param $this i32) (param $merkleRoot i32)
  local.get $this
  local.get $merkleRoot
  i32.store offset=16
  local.get $this
  local.get $merkleRoot
  i32.const 0
  call $~lib/rt/stub/__link
 )
 (func $~lib/metashrew-as/assembly/utils/pointer/nullptr<~lib/metashrew-as/assembly/blockdata/auxpow/AuxPow> (result i32)
  i32.const 0
  return
 )
 (func $~lib/metashrew-as/assembly/blockdata/block/Header#set:auxpow (param $this i32) (param $auxpow i32)
  local.get $this
  local.get $auxpow
  i32.store offset=28
  local.get $this
  local.get $auxpow
  i32.const 0
  call $~lib/rt/stub/__link
 )
 (func $~lib/metashrew-as/assembly/blockdata/version/Version#set:value (param $this i32) (param $value i32)
  local.get $this
  local.get $value
  i32.store
 )
 (func $~lib/metashrew-as/assembly/blockdata/version/Version#constructor (param $this i32) (param $value i32) (result i32)
  local.get $this
  i32.eqz
  if
   i32.const 4
   i32.const 20
   call $~lib/rt/stub/__new
   local.set $this
  end
  local.get $this
  i32.const 0
  call $~lib/metashrew-as/assembly/blockdata/version/Version#set:value
  local.get $this
  local.get $value
  call $~lib/metashrew-as/assembly/blockdata/version/Version#set:value
  local.get $this
 )
 (func $~lib/metashrew-as/assembly/blockdata/block/Header#set:version (param $this i32) (param $version i32)
  local.get $this
  local.get $version
  i32.store
  local.get $this
  local.get $version
  i32.const 0
  call $~lib/rt/stub/__link
 )
 (func $~lib/metashrew-as/assembly/utils/box/Box#sliceFrom (param $this i32) (param $start i32) (result i32)
  i32.const 0
  local.get $this
  call $~lib/metashrew-as/assembly/utils/box/Box#get:start
  local.get $start
  i32.add
  local.get $this
  call $~lib/metashrew-as/assembly/utils/box/Box#get:len
  local.get $start
  i32.sub
  call $~lib/metashrew-as/assembly/utils/box/Box#constructor
  return
 )
 (func $~lib/metashrew-as/assembly/utils/utils/parseBytes (param $data i32) (param $sz i32) (result i32)
  (local $result i32)
  local.get $data
  i32.const 0
  call $~lib/metashrew-as/assembly/utils/box/Box#sliceFrom
  local.set $result
  local.get $result
  local.get $sz
  call $~lib/metashrew-as/assembly/utils/box/Box#set:len
  local.get $data
  local.get $sz
  call $~lib/metashrew-as/assembly/utils/box/Box#shrinkFront
  drop
  local.get $result
  return
 )
 (func $~lib/metashrew-as/assembly/blockdata/block/Header#set:prevBlock (param $this i32) (param $prevBlock i32)
  local.get $this
  local.get $prevBlock
  i32.store offset=4
  local.get $this
  local.get $prevBlock
  i32.const 0
  call $~lib/rt/stub/__link
 )
 (func $~lib/metashrew-as/assembly/blockdata/block/Header#set:merkleRoot (param $this i32) (param $merkleRoot i32)
  local.get $this
  local.get $merkleRoot
  i32.store offset=8
  local.get $this
  local.get $merkleRoot
  i32.const 0
  call $~lib/rt/stub/__link
 )
 (func $~lib/metashrew-as/assembly/blockdata/block/Header#set:time (param $this i32) (param $time i32)
  local.get $this
  local.get $time
  i32.store offset=12
 )
 (func $~lib/metashrew-as/assembly/blockdata/block/Header#set:bits (param $this i32) (param $bits i32)
  local.get $this
  local.get $bits
  i32.store offset=16
 )
 (func $~lib/metashrew-as/assembly/blockdata/block/Header#set:nonce (param $this i32) (param $nonce i32)
  local.get $this
  local.get $nonce
  i32.store offset=20
 )
 (func $~lib/metashrew-as/assembly/utils/pointer/toPointer (param $v i32) (result i32)
  (local $this i32)
  (local $ptr i32)
  block $~lib/metashrew-as/assembly/utils/pointer/Pointer#constructor|inlined.0 (result i32)
   i32.const 0
   local.set $this
   local.get $v
   local.set $ptr
   local.get $ptr
   br $~lib/metashrew-as/assembly/utils/pointer/Pointer#constructor|inlined.0
  end
  return
 )
 (func $~lib/metashrew-as/assembly/blockdata/block/Header#set:bytes (param $this i32) (param $bytes i32)
  local.get $this
  local.get $bytes
  i32.store offset=24
  local.get $this
  local.get $bytes
  i32.const 0
  call $~lib/rt/stub/__link
 )
 (func $~lib/metashrew-as/assembly/blockdata/block/Header#get:version (param $this i32) (result i32)
  local.get $this
  i32.load
 )
 (func $~lib/metashrew-as/assembly/blockdata/version/Version#get:value (param $this i32) (result i32)
  local.get $this
  i32.load
 )
 (func $~lib/metashrew-as/assembly/blockdata/version/Version#isAuxPow (param $this i32) (result i32)
  local.get $this
  call $~lib/metashrew-as/assembly/blockdata/version/Version#get:value
  global.get $~lib/metashrew-as/assembly/blockdata/version/Version.AUXPOW
  i32.and
  i32.const 0
  i32.ne
  return
 )
 (func $~lib/metashrew-as/assembly/blockdata/transaction/Transaction#set:bytes (param $this i32) (param $bytes i32)
  local.get $this
  local.get $bytes
  i32.store
  local.get $this
  local.get $bytes
  i32.const 0
  call $~lib/rt/stub/__link
 )
 (func $~lib/array/Array<~lib/metashrew-as/assembly/blockdata/transaction/Input>#set:buffer (param $this i32) (param $buffer i32)
  local.get $this
  local.get $buffer
  i32.store
  local.get $this
  local.get $buffer
  i32.const 0
  call $~lib/rt/stub/__link
 )
 (func $~lib/array/Array<~lib/metashrew-as/assembly/blockdata/transaction/Input>#set:dataStart (param $this i32) (param $dataStart i32)
  local.get $this
  local.get $dataStart
  i32.store offset=4
 )
 (func $~lib/array/Array<~lib/metashrew-as/assembly/blockdata/transaction/Input>#set:byteLength (param $this i32) (param $byteLength i32)
  local.get $this
  local.get $byteLength
  i32.store offset=8
 )
 (func $~lib/array/Array<~lib/metashrew-as/assembly/blockdata/transaction/Input>#set:length_ (param $this i32) (param $length_ i32)
  local.get $this
  local.get $length_
  i32.store offset=12
 )
 (func $~lib/array/Array<~lib/metashrew-as/assembly/blockdata/transaction/Input>#constructor (param $this i32) (param $length i32) (result i32)
  (local $2 i32)
  (local $3 i32)
  (local $bufferSize i32)
  (local $buffer i32)
  local.get $this
  i32.eqz
  if
   i32.const 16
   i32.const 28
   call $~lib/rt/stub/__new
   local.set $this
  end
  local.get $this
  i32.const 0
  call $~lib/array/Array<~lib/metashrew-as/assembly/blockdata/transaction/Input>#set:buffer
  local.get $this
  i32.const 0
  call $~lib/array/Array<~lib/metashrew-as/assembly/blockdata/transaction/Input>#set:dataStart
  local.get $this
  i32.const 0
  call $~lib/array/Array<~lib/metashrew-as/assembly/blockdata/transaction/Input>#set:byteLength
  local.get $this
  i32.const 0
  call $~lib/array/Array<~lib/metashrew-as/assembly/blockdata/transaction/Input>#set:length_
  local.get $length
  i32.const 1073741820
  i32.const 2
  i32.shr_u
  i32.gt_u
  if
   i32.const 1584
   i32.const 4272
   i32.const 70
   i32.const 60
   call $~lib/builtins/abort
   unreachable
  end
  local.get $length
  local.tee $2
  i32.const 8
  local.tee $3
  local.get $2
  local.get $3
  i32.gt_u
  select
  i32.const 2
  i32.shl
  local.set $bufferSize
  local.get $bufferSize
  i32.const 1
  call $~lib/rt/stub/__new
  local.set $buffer
  i32.const 0
  global.get $~lib/shared/runtime/Runtime.Incremental
  i32.ne
  drop
  local.get $buffer
  i32.const 0
  local.get $bufferSize
  memory.fill
  local.get $this
  local.get $buffer
  call $~lib/array/Array<~lib/metashrew-as/assembly/blockdata/transaction/Input>#set:buffer
  local.get $this
  local.get $buffer
  call $~lib/array/Array<~lib/metashrew-as/assembly/blockdata/transaction/Input>#set:dataStart
  local.get $this
  local.get $bufferSize
  call $~lib/array/Array<~lib/metashrew-as/assembly/blockdata/transaction/Input>#set:byteLength
  local.get $this
  local.get $length
  call $~lib/array/Array<~lib/metashrew-as/assembly/blockdata/transaction/Input>#set:length_
  local.get $this
 )
 (func $~lib/metashrew-as/assembly/blockdata/transaction/Transaction#set:ins (param $this i32) (param $ins i32)
  local.get $this
  local.get $ins
  i32.store offset=12
  local.get $this
  local.get $ins
  i32.const 0
  call $~lib/rt/stub/__link
 )
 (func $~lib/array/Array<~lib/metashrew-as/assembly/blockdata/transaction/Output>#set:buffer (param $this i32) (param $buffer i32)
  local.get $this
  local.get $buffer
  i32.store
  local.get $this
  local.get $buffer
  i32.const 0
  call $~lib/rt/stub/__link
 )
 (func $~lib/array/Array<~lib/metashrew-as/assembly/blockdata/transaction/Output>#set:dataStart (param $this i32) (param $dataStart i32)
  local.get $this
  local.get $dataStart
  i32.store offset=4
 )
 (func $~lib/array/Array<~lib/metashrew-as/assembly/blockdata/transaction/Output>#set:byteLength (param $this i32) (param $byteLength i32)
  local.get $this
  local.get $byteLength
  i32.store offset=8
 )
 (func $~lib/array/Array<~lib/metashrew-as/assembly/blockdata/transaction/Output>#set:length_ (param $this i32) (param $length_ i32)
  local.get $this
  local.get $length_
  i32.store offset=12
 )
 (func $~lib/array/Array<~lib/metashrew-as/assembly/blockdata/transaction/Output>#constructor (param $this i32) (param $length i32) (result i32)
  (local $2 i32)
  (local $3 i32)
  (local $bufferSize i32)
  (local $buffer i32)
  local.get $this
  i32.eqz
  if
   i32.const 16
   i32.const 30
   call $~lib/rt/stub/__new
   local.set $this
  end
  local.get $this
  i32.const 0
  call $~lib/array/Array<~lib/metashrew-as/assembly/blockdata/transaction/Output>#set:buffer
  local.get $this
  i32.const 0
  call $~lib/array/Array<~lib/metashrew-as/assembly/blockdata/transaction/Output>#set:dataStart
  local.get $this
  i32.const 0
  call $~lib/array/Array<~lib/metashrew-as/assembly/blockdata/transaction/Output>#set:byteLength
  local.get $this
  i32.const 0
  call $~lib/array/Array<~lib/metashrew-as/assembly/blockdata/transaction/Output>#set:length_
  local.get $length
  i32.const 1073741820
  i32.const 2
  i32.shr_u
  i32.gt_u
  if
   i32.const 1584
   i32.const 4272
   i32.const 70
   i32.const 60
   call $~lib/builtins/abort
   unreachable
  end
  local.get $length
  local.tee $2
  i32.const 8
  local.tee $3
  local.get $2
  local.get $3
  i32.gt_u
  select
  i32.const 2
  i32.shl
  local.set $bufferSize
  local.get $bufferSize
  i32.const 1
  call $~lib/rt/stub/__new
  local.set $buffer
  i32.const 0
  global.get $~lib/shared/runtime/Runtime.Incremental
  i32.ne
  drop
  local.get $buffer
  i32.const 0
  local.get $bufferSize
  memory.fill
  local.get $this
  local.get $buffer
  call $~lib/array/Array<~lib/metashrew-as/assembly/blockdata/transaction/Output>#set:buffer
  local.get $this
  local.get $buffer
  call $~lib/array/Array<~lib/metashrew-as/assembly/blockdata/transaction/Output>#set:dataStart
  local.get $this
  local.get $bufferSize
  call $~lib/array/Array<~lib/metashrew-as/assembly/blockdata/transaction/Output>#set:byteLength
  local.get $this
  local.get $length
  call $~lib/array/Array<~lib/metashrew-as/assembly/blockdata/transaction/Output>#set:length_
  local.get $this
 )
 (func $~lib/metashrew-as/assembly/blockdata/transaction/Transaction#set:outs (param $this i32) (param $outs i32)
  local.get $this
  local.get $outs
  i32.store offset=16
  local.get $this
  local.get $outs
  i32.const 0
  call $~lib/rt/stub/__link
 )
 (func $~lib/metashrew-as/assembly/blockdata/transaction/Transaction#set:witnessDataBytes (param $this i32) (param $witnessDataBytes i32)
  local.get $this
  local.get $witnessDataBytes
  i32.store offset=24
  local.get $this
  local.get $witnessDataBytes
  i32.const 0
  call $~lib/rt/stub/__link
 )
 (func $~lib/metashrew-as/assembly/blockdata/transaction/Transaction#set:legacyInputOutputBytes (param $this i32) (param $legacyInputOutputBytes i32)
  local.get $this
  local.get $legacyInputOutputBytes
  i32.store offset=28
  local.get $this
  local.get $legacyInputOutputBytes
  i32.const 0
  call $~lib/rt/stub/__link
 )
 (func $~lib/metashrew-as/assembly/blockdata/transaction/Transaction#set:flag (param $this i32) (param $flag i32)
  local.get $this
  local.get $flag
  i32.store8 offset=8
 )
 (func $~lib/metashrew-as/assembly/blockdata/transaction/Transaction#set:_txid (param $this i32) (param $_txid i32)
  local.get $this
  local.get $_txid
  i32.store offset=32
  local.get $this
  local.get $_txid
  i32.const 0
  call $~lib/rt/stub/__link
 )
 (func $~lib/metashrew-as/assembly/blockdata/transaction/Transaction#set:version (param $this i32) (param $version i32)
  local.get $this
  local.get $version
  i32.store offset=4
 )
 (func $~lib/metashrew-as/assembly/utils/utils/parsePrimitive<u8> (param $data i32) (result i32)
  (local $result i32)
  local.get $data
  call $~lib/metashrew-as/assembly/utils/box/Box#get:start
  i32.load8_u
  local.set $result
  local.get $data
  i32.const 1
  call $~lib/metashrew-as/assembly/utils/box/Box#shrinkFront
  drop
  local.get $result
  return
 )
 (func $~lib/metashrew-as/assembly/utils/utils/parsePrimitive<u64> (param $data i32) (result i64)
  (local $result i64)
  local.get $data
  call $~lib/metashrew-as/assembly/utils/box/Box#get:start
  i64.load
  local.set $result
  local.get $data
  i32.const 8
  call $~lib/metashrew-as/assembly/utils/box/Box#shrinkFront
  drop
  local.get $result
  return
 )
 (func $~lib/metashrew-as/assembly/utils/utils/parsePrimitive<u16> (param $data i32) (result i32)
  (local $result i32)
  local.get $data
  call $~lib/metashrew-as/assembly/utils/box/Box#get:start
  i32.load16_u
  local.set $result
  local.get $data
  i32.const 2
  call $~lib/metashrew-as/assembly/utils/box/Box#shrinkFront
  drop
  local.get $result
  return
 )
 (func $~lib/metashrew-as/assembly/utils/utils/parseVarInt (param $data i32) (result i64)
  (local $first i32)
  (local $2 i32)
  local.get $data
  call $~lib/metashrew-as/assembly/utils/box/Box#get:start
  i32.load8_u
  local.set $first
  local.get $data
  i32.const 1
  call $~lib/metashrew-as/assembly/utils/box/Box#shrinkFront
  drop
  block $case3|0
   block $case2|0
    block $case1|0
     block $case0|0
      local.get $first
      local.set $2
      local.get $2
      i32.const 255
      i32.eq
      br_if $case0|0
      local.get $2
      i32.const 254
      i32.eq
      br_if $case1|0
      local.get $2
      i32.const 253
      i32.eq
      br_if $case2|0
      br $case3|0
     end
     local.get $data
     call $~lib/metashrew-as/assembly/utils/utils/parsePrimitive<u64>
     return
    end
    local.get $data
    call $~lib/metashrew-as/assembly/utils/utils/parsePrimitive<u32>
    i64.extend_i32_u
    return
   end
   local.get $data
   call $~lib/metashrew-as/assembly/utils/utils/parsePrimitive<u16>
   i64.extend_i32_u
   return
  end
  local.get $first
  i64.extend_i32_u
  return
 )
 (func $~lib/metashrew-as/assembly/blockdata/transaction/Input#set:hash (param $this i32) (param $hash i32)
  local.get $this
  local.get $hash
  i32.store offset=4
  local.get $this
  local.get $hash
  i32.const 0
  call $~lib/rt/stub/__link
 )
 (func $~lib/metashrew-as/assembly/blockdata/transaction/Input#set:index (param $this i32) (param $index i32)
  local.get $this
  local.get $index
  i32.store offset=8
 )
 (func $~lib/metashrew-as/assembly/utils/utils/parseLenThenBytes (param $data i32) (result i32)
  (local $length i64)
  local.get $data
  call $~lib/metashrew-as/assembly/utils/utils/parseVarInt
  local.set $length
  local.get $data
  local.get $length
  i32.wrap_i64
  call $~lib/metashrew-as/assembly/utils/utils/parseBytes
  return
 )
 (func $~lib/metashrew-as/assembly/blockdata/transaction/Input#set:script (param $this i32) (param $script i32)
  local.get $this
  local.get $script
  i32.store offset=12
  local.get $this
  local.get $script
  i32.const 0
  call $~lib/rt/stub/__link
 )
 (func $~lib/metashrew-as/assembly/blockdata/transaction/Input#set:sequence (param $this i32) (param $sequence i32)
  local.get $this
  local.get $sequence
  i32.store offset=16
 )
 (func $~lib/metashrew-as/assembly/utils/pointer/nullptr<~lib/metashrew-as/assembly/blockdata/witness/Witness> (result i32)
  i32.const 0
  return
 )
 (func $~lib/metashrew-as/assembly/blockdata/transaction/Input#set:witness (param $this i32) (param $witness i32)
  local.get $this
  local.get $witness
  i32.store offset=20
  local.get $this
  local.get $witness
  i32.const 0
  call $~lib/rt/stub/__link
 )
 (func $~lib/metashrew-as/assembly/blockdata/transaction/Input#set:bytes (param $this i32) (param $bytes i32)
  local.get $this
  local.get $bytes
  i32.store
  local.get $this
  local.get $bytes
  i32.const 0
  call $~lib/rt/stub/__link
 )
 (func $~lib/metashrew-as/assembly/blockdata/transaction/Input#constructor (param $this i32) (param $data i32) (result i32)
  (local $head i32)
  (local $tail i32)
  (local $this|4 i32)
  (local $len i32)
  (local $this|6 i32)
  (local $this|7 i32)
  local.get $this
  i32.eqz
  if
   i32.const 24
   i32.const 24
   call $~lib/rt/stub/__new
   local.set $this
  end
  local.get $this
  i32.const 0
  call $~lib/metashrew-as/assembly/blockdata/transaction/Input#set:bytes
  local.get $this
  i32.const 0
  call $~lib/metashrew-as/assembly/blockdata/transaction/Input#set:hash
  local.get $this
  i32.const 0
  call $~lib/metashrew-as/assembly/blockdata/transaction/Input#set:index
  local.get $this
  i32.const 0
  call $~lib/metashrew-as/assembly/blockdata/transaction/Input#set:script
  local.get $this
  i32.const 0
  call $~lib/metashrew-as/assembly/blockdata/transaction/Input#set:sequence
  local.get $this
  i32.const 0
  call $~lib/metashrew-as/assembly/blockdata/transaction/Input#set:witness
  local.get $data
  call $~lib/metashrew-as/assembly/utils/box/Box#get:start
  local.set $head
  local.get $this
  local.get $data
  i32.const 32
  call $~lib/metashrew-as/assembly/utils/utils/parseBytes
  call $~lib/metashrew-as/assembly/blockdata/transaction/Input#set:hash
  local.get $this
  local.get $data
  call $~lib/metashrew-as/assembly/utils/utils/parsePrimitive<u32>
  call $~lib/metashrew-as/assembly/blockdata/transaction/Input#set:index
  local.get $this
  local.get $data
  call $~lib/metashrew-as/assembly/utils/utils/parseLenThenBytes
  call $~lib/metashrew-as/assembly/blockdata/transaction/Input#set:script
  local.get $this
  local.get $data
  call $~lib/metashrew-as/assembly/utils/utils/parsePrimitive<u32>
  call $~lib/metashrew-as/assembly/blockdata/transaction/Input#set:sequence
  local.get $this
  call $~lib/metashrew-as/assembly/utils/pointer/nullptr<~lib/metashrew-as/assembly/blockdata/witness/Witness>
  call $~lib/metashrew-as/assembly/blockdata/transaction/Input#set:witness
  local.get $data
  call $~lib/metashrew-as/assembly/utils/box/Box#get:start
  local.set $tail
  local.get $this
  block $~lib/metashrew-as/assembly/utils/pointer/Pointer#toBox|inlined.1 (result i32)
   local.get $head
   call $~lib/metashrew-as/assembly/utils/pointer/toPointer
   local.set $this|4
   local.get $tail
   local.get $head
   i32.sub
   local.set $len
   i32.const 0
   block $~lib/metashrew-as/assembly/utils/pointer/Pointer#asUsize|inlined.1 (result i32)
    local.get $this|4
    local.set $this|6
    block $~lib/metashrew-as/assembly/utils/pointer/Pointer#asRef<usize>|inlined.1 (result i32)
     local.get $this|6
     local.set $this|7
     local.get $this|7
     br $~lib/metashrew-as/assembly/utils/pointer/Pointer#asRef<usize>|inlined.1
    end
    br $~lib/metashrew-as/assembly/utils/pointer/Pointer#asUsize|inlined.1
   end
   local.get $len
   call $~lib/metashrew-as/assembly/utils/box/Box#constructor
   br $~lib/metashrew-as/assembly/utils/pointer/Pointer#toBox|inlined.1
  end
  call $~lib/metashrew-as/assembly/blockdata/transaction/Input#set:bytes
  local.get $this
 )
 (func $~lib/metashrew-as/assembly/blockdata/transaction/Transaction#get:ins (param $this i32) (result i32)
  local.get $this
  i32.load offset=12
 )
 (func $~lib/array/Array<~lib/metashrew-as/assembly/blockdata/transaction/Input>#get:length_ (param $this i32) (result i32)
  local.get $this
  i32.load offset=12
 )
 (func $~lib/arraybuffer/ArrayBufferView#get:byteLength (param $this i32) (result i32)
  local.get $this
  i32.load offset=8
 )
 (func $~lib/arraybuffer/ArrayBufferView#get:buffer (param $this i32) (result i32)
  local.get $this
  i32.load
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
 (func $~lib/array/ensureCapacity (param $array i32) (param $newSize i32) (param $alignLog2 i32) (param $canGrow i32)
  (local $oldCapacity i32)
  (local $oldData i32)
  (local $6 i32)
  (local $7 i32)
  (local $newCapacity i32)
  (local $9 i32)
  (local $10 i32)
  (local $11 i32)
  (local $12 i32)
  (local $newData i32)
  local.get $array
  call $~lib/arraybuffer/ArrayBufferView#get:byteLength
  local.set $oldCapacity
  local.get $newSize
  local.get $oldCapacity
  local.get $alignLog2
  i32.shr_u
  i32.gt_u
  if
   local.get $newSize
   i32.const 1073741820
   local.get $alignLog2
   i32.shr_u
   i32.gt_u
   if
    i32.const 1584
    i32.const 4272
    i32.const 19
    i32.const 48
    call $~lib/builtins/abort
    unreachable
   end
   local.get $array
   call $~lib/arraybuffer/ArrayBufferView#get:buffer
   local.set $oldData
   local.get $newSize
   local.tee $6
   i32.const 8
   local.tee $7
   local.get $6
   local.get $7
   i32.gt_u
   select
   local.get $alignLog2
   i32.shl
   local.set $newCapacity
   local.get $canGrow
   if
    local.get $oldCapacity
    i32.const 1
    i32.shl
    local.tee $9
    i32.const 1073741820
    local.tee $10
    local.get $9
    local.get $10
    i32.lt_u
    select
    local.tee $11
    local.get $newCapacity
    local.tee $12
    local.get $11
    local.get $12
    i32.gt_u
    select
    local.set $newCapacity
   end
   local.get $oldData
   local.get $newCapacity
   call $~lib/rt/stub/__renew
   local.set $newData
   i32.const 0
   global.get $~lib/shared/runtime/Runtime.Incremental
   i32.ne
   drop
   local.get $newData
   local.get $oldCapacity
   i32.add
   i32.const 0
   local.get $newCapacity
   local.get $oldCapacity
   i32.sub
   memory.fill
   local.get $newData
   local.get $oldData
   i32.ne
   if
    local.get $array
    local.get $newData
    i32.store
    local.get $array
    local.get $newData
    i32.store offset=4
    local.get $array
    local.get $newData
    i32.const 0
    call $~lib/rt/stub/__link
   end
   local.get $array
   local.get $newCapacity
   i32.store offset=8
  end
 )
 (func $~lib/array/Array<~lib/metashrew-as/assembly/blockdata/transaction/Input>#get:dataStart (param $this i32) (result i32)
  local.get $this
  i32.load offset=4
 )
 (func $~lib/array/Array<~lib/metashrew-as/assembly/blockdata/transaction/Input>#__set (param $this i32) (param $index i32) (param $value i32)
  local.get $index
  local.get $this
  call $~lib/array/Array<~lib/metashrew-as/assembly/blockdata/transaction/Input>#get:length_
  i32.ge_u
  if
   local.get $index
   i32.const 0
   i32.lt_s
   if
    i32.const 2320
    i32.const 4272
    i32.const 130
    i32.const 22
    call $~lib/builtins/abort
    unreachable
   end
   local.get $this
   local.get $index
   i32.const 1
   i32.add
   i32.const 2
   i32.const 1
   call $~lib/array/ensureCapacity
   local.get $this
   local.get $index
   i32.const 1
   i32.add
   call $~lib/array/Array<~lib/metashrew-as/assembly/blockdata/transaction/Input>#set:length_
  end
  local.get $this
  call $~lib/array/Array<~lib/metashrew-as/assembly/blockdata/transaction/Input>#get:dataStart
  local.get $index
  i32.const 2
  i32.shl
  i32.add
  local.get $value
  i32.store
  i32.const 1
  drop
  local.get $this
  local.get $value
  i32.const 1
  call $~lib/rt/stub/__link
 )
 (func $~lib/metashrew-as/assembly/blockdata/transaction/Transaction#get:flag (param $this i32) (result i32)
  local.get $this
  i32.load8_u offset=8
 )
 (func $~lib/metashrew-as/assembly/blockdata/transaction/Transaction#get:outs (param $this i32) (result i32)
  local.get $this
  i32.load offset=16
 )
 (func $~lib/metashrew-as/assembly/blockdata/transaction/Output#set:value (param $this i32) (param $value i64)
  local.get $this
  local.get $value
  i64.store offset=8
 )
 (func $~lib/metashrew-as/assembly/blockdata/transaction/Output#set:script (param $this i32) (param $script i32)
  local.get $this
  local.get $script
  i32.store offset=16
  local.get $this
  local.get $script
  i32.const 0
  call $~lib/rt/stub/__link
 )
 (func $~lib/metashrew-as/assembly/blockdata/transaction/Output#set:bytes (param $this i32) (param $bytes i32)
  local.get $this
  local.get $bytes
  i32.store
  local.get $this
  local.get $bytes
  i32.const 0
  call $~lib/rt/stub/__link
 )
 (func $~lib/metashrew-as/assembly/blockdata/transaction/Output#set:segwit (param $this i32) (param $segwit i32)
  local.get $this
  local.get $segwit
  i32.store8 offset=20
 )
 (func $~lib/metashrew-as/assembly/blockdata/transaction/Output#constructor (param $this i32) (param $data i32) (param $segwit i32) (result i32)
  (local $head i32)
  (local $tail i32)
  (local $this|5 i32)
  (local $len i32)
  (local $this|7 i32)
  (local $this|8 i32)
  local.get $this
  i32.eqz
  if
   i32.const 21
   i32.const 29
   call $~lib/rt/stub/__new
   local.set $this
  end
  local.get $this
  i32.const 0
  call $~lib/metashrew-as/assembly/blockdata/transaction/Output#set:bytes
  local.get $this
  i64.const 0
  call $~lib/metashrew-as/assembly/blockdata/transaction/Output#set:value
  local.get $this
  i32.const 0
  call $~lib/metashrew-as/assembly/blockdata/transaction/Output#set:script
  local.get $this
  i32.const 0
  call $~lib/metashrew-as/assembly/blockdata/transaction/Output#set:segwit
  local.get $data
  call $~lib/metashrew-as/assembly/utils/box/Box#get:start
  local.set $head
  local.get $this
  local.get $data
  call $~lib/metashrew-as/assembly/utils/utils/parsePrimitive<u64>
  call $~lib/metashrew-as/assembly/blockdata/transaction/Output#set:value
  local.get $this
  local.get $data
  call $~lib/metashrew-as/assembly/utils/utils/parseLenThenBytes
  call $~lib/metashrew-as/assembly/blockdata/transaction/Output#set:script
  local.get $data
  call $~lib/metashrew-as/assembly/utils/box/Box#get:start
  local.set $tail
  local.get $this
  block $~lib/metashrew-as/assembly/utils/pointer/Pointer#toBox|inlined.2 (result i32)
   local.get $head
   call $~lib/metashrew-as/assembly/utils/pointer/toPointer
   local.set $this|5
   local.get $tail
   local.get $head
   i32.sub
   local.set $len
   i32.const 0
   block $~lib/metashrew-as/assembly/utils/pointer/Pointer#asUsize|inlined.2 (result i32)
    local.get $this|5
    local.set $this|7
    block $~lib/metashrew-as/assembly/utils/pointer/Pointer#asRef<usize>|inlined.2 (result i32)
     local.get $this|7
     local.set $this|8
     local.get $this|8
     br $~lib/metashrew-as/assembly/utils/pointer/Pointer#asRef<usize>|inlined.2
    end
    br $~lib/metashrew-as/assembly/utils/pointer/Pointer#asUsize|inlined.2
   end
   local.get $len
   call $~lib/metashrew-as/assembly/utils/box/Box#constructor
   br $~lib/metashrew-as/assembly/utils/pointer/Pointer#toBox|inlined.2
  end
  call $~lib/metashrew-as/assembly/blockdata/transaction/Output#set:bytes
  local.get $this
  local.get $segwit
  call $~lib/metashrew-as/assembly/blockdata/transaction/Output#set:segwit
  local.get $this
 )
 (func $~lib/array/Array<~lib/metashrew-as/assembly/blockdata/transaction/Output>#get:length_ (param $this i32) (result i32)
  local.get $this
  i32.load offset=12
 )
 (func $~lib/array/Array<~lib/metashrew-as/assembly/blockdata/transaction/Output>#get:dataStart (param $this i32) (result i32)
  local.get $this
  i32.load offset=4
 )
 (func $~lib/array/Array<~lib/metashrew-as/assembly/blockdata/transaction/Output>#push (param $this i32) (param $value i32) (result i32)
  (local $oldLen i32)
  (local $len i32)
  local.get $this
  call $~lib/array/Array<~lib/metashrew-as/assembly/blockdata/transaction/Output>#get:length_
  local.set $oldLen
  local.get $oldLen
  i32.const 1
  i32.add
  local.set $len
  local.get $this
  local.get $len
  i32.const 2
  i32.const 1
  call $~lib/array/ensureCapacity
  i32.const 1
  drop
  local.get $this
  call $~lib/array/Array<~lib/metashrew-as/assembly/blockdata/transaction/Output>#get:dataStart
  local.get $oldLen
  i32.const 2
  i32.shl
  i32.add
  local.get $value
  i32.store
  local.get $this
  local.get $value
  i32.const 1
  call $~lib/rt/stub/__link
  local.get $this
  local.get $len
  call $~lib/array/Array<~lib/metashrew-as/assembly/blockdata/transaction/Output>#set:length_
  local.get $len
  return
 )
 (func $~lib/metashrew-as/assembly/blockdata/witness/Witness#set:bytes (param $this i32) (param $bytes i32)
  local.get $this
  local.get $bytes
  i32.store
  local.get $this
  local.get $bytes
  i32.const 0
  call $~lib/rt/stub/__link
 )
 (func $~lib/array/Array<~lib/metashrew-as/assembly/blockdata/witness/WitnessPart>#set:buffer (param $this i32) (param $buffer i32)
  local.get $this
  local.get $buffer
  i32.store
  local.get $this
  local.get $buffer
  i32.const 0
  call $~lib/rt/stub/__link
 )
 (func $~lib/array/Array<~lib/metashrew-as/assembly/blockdata/witness/WitnessPart>#set:dataStart (param $this i32) (param $dataStart i32)
  local.get $this
  local.get $dataStart
  i32.store offset=4
 )
 (func $~lib/array/Array<~lib/metashrew-as/assembly/blockdata/witness/WitnessPart>#set:byteLength (param $this i32) (param $byteLength i32)
  local.get $this
  local.get $byteLength
  i32.store offset=8
 )
 (func $~lib/array/Array<~lib/metashrew-as/assembly/blockdata/witness/WitnessPart>#set:length_ (param $this i32) (param $length_ i32)
  local.get $this
  local.get $length_
  i32.store offset=12
 )
 (func $~lib/array/Array<~lib/metashrew-as/assembly/blockdata/witness/WitnessPart>#constructor (param $this i32) (param $length i32) (result i32)
  (local $2 i32)
  (local $3 i32)
  (local $bufferSize i32)
  (local $buffer i32)
  local.get $this
  i32.eqz
  if
   i32.const 16
   i32.const 27
   call $~lib/rt/stub/__new
   local.set $this
  end
  local.get $this
  i32.const 0
  call $~lib/array/Array<~lib/metashrew-as/assembly/blockdata/witness/WitnessPart>#set:buffer
  local.get $this
  i32.const 0
  call $~lib/array/Array<~lib/metashrew-as/assembly/blockdata/witness/WitnessPart>#set:dataStart
  local.get $this
  i32.const 0
  call $~lib/array/Array<~lib/metashrew-as/assembly/blockdata/witness/WitnessPart>#set:byteLength
  local.get $this
  i32.const 0
  call $~lib/array/Array<~lib/metashrew-as/assembly/blockdata/witness/WitnessPart>#set:length_
  local.get $length
  i32.const 1073741820
  i32.const 2
  i32.shr_u
  i32.gt_u
  if
   i32.const 1584
   i32.const 4272
   i32.const 70
   i32.const 60
   call $~lib/builtins/abort
   unreachable
  end
  local.get $length
  local.tee $2
  i32.const 8
  local.tee $3
  local.get $2
  local.get $3
  i32.gt_u
  select
  i32.const 2
  i32.shl
  local.set $bufferSize
  local.get $bufferSize
  i32.const 1
  call $~lib/rt/stub/__new
  local.set $buffer
  i32.const 0
  global.get $~lib/shared/runtime/Runtime.Incremental
  i32.ne
  drop
  local.get $buffer
  i32.const 0
  local.get $bufferSize
  memory.fill
  local.get $this
  local.get $buffer
  call $~lib/array/Array<~lib/metashrew-as/assembly/blockdata/witness/WitnessPart>#set:buffer
  local.get $this
  local.get $buffer
  call $~lib/array/Array<~lib/metashrew-as/assembly/blockdata/witness/WitnessPart>#set:dataStart
  local.get $this
  local.get $bufferSize
  call $~lib/array/Array<~lib/metashrew-as/assembly/blockdata/witness/WitnessPart>#set:byteLength
  local.get $this
  local.get $length
  call $~lib/array/Array<~lib/metashrew-as/assembly/blockdata/witness/WitnessPart>#set:length_
  local.get $this
 )
 (func $~lib/metashrew-as/assembly/blockdata/witness/Witness#set:parts (param $this i32) (param $parts i32)
  local.get $this
  local.get $parts
  i32.store offset=4
  local.get $this
  local.get $parts
  i32.const 0
  call $~lib/rt/stub/__link
 )
 (func $~lib/metashrew-as/assembly/blockdata/witness/WitnessPart#set:bytes (param $this i32) (param $bytes i32)
  local.get $this
  local.get $bytes
  i32.store
  local.get $this
  local.get $bytes
  i32.const 0
  call $~lib/rt/stub/__link
 )
 (func $~lib/metashrew-as/assembly/blockdata/witness/WitnessPart#get:bytes (param $this i32) (result i32)
  local.get $this
  i32.load
 )
 (func $~lib/metashrew-as/assembly/blockdata/witness/WitnessPart#set:firstByte (param $this i32) (param $firstByte i32)
  local.get $this
  local.get $firstByte
  i32.store8 offset=4
 )
 (func $~lib/metashrew-as/assembly/blockdata/witness/WitnessPart#get:firstByte (param $this i32) (result i32)
  local.get $this
  i32.load8_u offset=4
 )
 (func $~lib/metashrew-as/assembly/blockdata/witness/WitnessPart#set:taprootAnnex (param $this i32) (param $taprootAnnex i32)
  local.get $this
  local.get $taprootAnnex
  i32.store8 offset=6
 )
 (func $~lib/metashrew-as/assembly/blockdata/witness/WitnessPart#set:isScript (param $this i32) (param $isScript i32)
  local.get $this
  local.get $isScript
  i32.store8 offset=5
 )
 (func $~lib/metashrew-as/assembly/blockdata/witness/WitnessPart#constructor (param $this i32) (param $data i32) (result i32)
  (local $2 i32)
  local.get $this
  i32.eqz
  if
   i32.const 7
   i32.const 26
   call $~lib/rt/stub/__new
   local.set $this
  end
  local.get $this
  i32.const 0
  call $~lib/metashrew-as/assembly/blockdata/witness/WitnessPart#set:bytes
  local.get $this
  i32.const 0
  call $~lib/metashrew-as/assembly/blockdata/witness/WitnessPart#set:firstByte
  local.get $this
  i32.const 0
  call $~lib/metashrew-as/assembly/blockdata/witness/WitnessPart#set:isScript
  local.get $this
  i32.const 0
  call $~lib/metashrew-as/assembly/blockdata/witness/WitnessPart#set:taprootAnnex
  local.get $this
  local.get $data
  call $~lib/metashrew-as/assembly/utils/utils/parseLenThenBytes
  call $~lib/metashrew-as/assembly/blockdata/witness/WitnessPart#set:bytes
  local.get $this
  local.get $this
  call $~lib/metashrew-as/assembly/blockdata/witness/WitnessPart#get:bytes
  i32.const 0
  call $~lib/metashrew-as/assembly/utils/box/Box#sliceFrom
  call $~lib/metashrew-as/assembly/utils/utils/parsePrimitive<u8>
  call $~lib/metashrew-as/assembly/blockdata/witness/WitnessPart#set:firstByte
  block $break|0
   block $case2|0
    block $case1|0
     block $case0|0
      local.get $this
      call $~lib/metashrew-as/assembly/blockdata/witness/WitnessPart#get:firstByte
      i32.const 255
      i32.and
      local.set $2
      local.get $2
      i32.const 80
      i32.eq
      br_if $case0|0
      local.get $2
      i32.const 48
      i32.eq
      br_if $case1|0
      br $case2|0
     end
     local.get $this
     i32.const 1
     call $~lib/metashrew-as/assembly/blockdata/witness/WitnessPart#set:taprootAnnex
     local.get $this
     i32.const 0
     call $~lib/metashrew-as/assembly/blockdata/witness/WitnessPart#set:isScript
     br $break|0
    end
    local.get $this
    i32.const 0
    call $~lib/metashrew-as/assembly/blockdata/witness/WitnessPart#set:isScript
    local.get $this
    i32.const 0
    call $~lib/metashrew-as/assembly/blockdata/witness/WitnessPart#set:taprootAnnex
    br $break|0
   end
   local.get $this
   i32.const 0
   call $~lib/metashrew-as/assembly/blockdata/witness/WitnessPart#set:taprootAnnex
   local.get $this
   i32.const 1
   call $~lib/metashrew-as/assembly/blockdata/witness/WitnessPart#set:isScript
  end
  local.get $this
  call $~lib/metashrew-as/assembly/blockdata/witness/WitnessPart#get:bytes
  call $~lib/metashrew-as/assembly/utils/box/Box#get:len
  i32.const 1
  i32.le_u
  if
   local.get $this
   i32.const 0
   call $~lib/metashrew-as/assembly/blockdata/witness/WitnessPart#set:isScript
  end
  local.get $this
 )
 (func $~lib/metashrew-as/assembly/blockdata/witness/Witness#get:parts (param $this i32) (result i32)
  local.get $this
  i32.load offset=4
 )
 (func $~lib/array/Array<~lib/metashrew-as/assembly/blockdata/witness/WitnessPart>#get:length_ (param $this i32) (result i32)
  local.get $this
  i32.load offset=12
 )
 (func $~lib/array/Array<~lib/metashrew-as/assembly/blockdata/witness/WitnessPart>#get:dataStart (param $this i32) (result i32)
  local.get $this
  i32.load offset=4
 )
 (func $~lib/array/Array<~lib/metashrew-as/assembly/blockdata/witness/WitnessPart>#__set (param $this i32) (param $index i32) (param $value i32)
  local.get $index
  local.get $this
  call $~lib/array/Array<~lib/metashrew-as/assembly/blockdata/witness/WitnessPart>#get:length_
  i32.ge_u
  if
   local.get $index
   i32.const 0
   i32.lt_s
   if
    i32.const 2320
    i32.const 4272
    i32.const 130
    i32.const 22
    call $~lib/builtins/abort
    unreachable
   end
   local.get $this
   local.get $index
   i32.const 1
   i32.add
   i32.const 2
   i32.const 1
   call $~lib/array/ensureCapacity
   local.get $this
   local.get $index
   i32.const 1
   i32.add
   call $~lib/array/Array<~lib/metashrew-as/assembly/blockdata/witness/WitnessPart>#set:length_
  end
  local.get $this
  call $~lib/array/Array<~lib/metashrew-as/assembly/blockdata/witness/WitnessPart>#get:dataStart
  local.get $index
  i32.const 2
  i32.shl
  i32.add
  local.get $value
  i32.store
  i32.const 1
  drop
  local.get $this
  local.get $value
  i32.const 1
  call $~lib/rt/stub/__link
 )
 (func $~lib/metashrew-as/assembly/blockdata/witness/Witness#constructor (param $this i32) (param $data i32) (result i32)
  (local $head i32)
  (local $len i32)
  (local $i i32)
  (local $tail i32)
  (local $this|6 i32)
  (local $len|7 i32)
  (local $this|8 i32)
  (local $this|9 i32)
  local.get $this
  i32.eqz
  if
   i32.const 8
   i32.const 25
   call $~lib/rt/stub/__new
   local.set $this
  end
  local.get $this
  i32.const 0
  call $~lib/metashrew-as/assembly/blockdata/witness/Witness#set:bytes
  local.get $this
  i32.const 0
  call $~lib/metashrew-as/assembly/blockdata/witness/Witness#set:parts
  local.get $this
  call $~lib/metashrew-as/assembly/utils/pointer/nullptr<~lib/metashrew-as/assembly/utils/box/Box>
  call $~lib/metashrew-as/assembly/blockdata/witness/Witness#set:bytes
  local.get $data
  call $~lib/metashrew-as/assembly/utils/box/Box#get:start
  local.set $head
  local.get $data
  call $~lib/metashrew-as/assembly/utils/utils/parseVarInt
  i32.wrap_i64
  local.set $len
  local.get $this
  i32.const 0
  local.get $len
  call $~lib/array/Array<~lib/metashrew-as/assembly/blockdata/witness/WitnessPart>#constructor
  call $~lib/metashrew-as/assembly/blockdata/witness/Witness#set:parts
  i32.const 0
  local.set $i
  loop $for-loop|0
   local.get $i
   local.get $len
   i32.lt_s
   if
    local.get $this
    call $~lib/metashrew-as/assembly/blockdata/witness/Witness#get:parts
    local.get $i
    i32.const 0
    local.get $data
    call $~lib/metashrew-as/assembly/blockdata/witness/WitnessPart#constructor
    call $~lib/array/Array<~lib/metashrew-as/assembly/blockdata/witness/WitnessPart>#__set
    local.get $i
    i32.const 1
    i32.add
    local.set $i
    br $for-loop|0
   end
  end
  local.get $data
  call $~lib/metashrew-as/assembly/utils/box/Box#get:start
  local.set $tail
  local.get $this
  block $~lib/metashrew-as/assembly/utils/pointer/Pointer#toBox|inlined.4 (result i32)
   local.get $head
   call $~lib/metashrew-as/assembly/utils/pointer/toPointer
   local.set $this|6
   local.get $tail
   local.get $head
   i32.sub
   local.set $len|7
   i32.const 0
   block $~lib/metashrew-as/assembly/utils/pointer/Pointer#asUsize|inlined.4 (result i32)
    local.get $this|6
    local.set $this|8
    block $~lib/metashrew-as/assembly/utils/pointer/Pointer#asRef<usize>|inlined.4 (result i32)
     local.get $this|8
     local.set $this|9
     local.get $this|9
     br $~lib/metashrew-as/assembly/utils/pointer/Pointer#asRef<usize>|inlined.4
    end
    br $~lib/metashrew-as/assembly/utils/pointer/Pointer#asUsize|inlined.4
   end
   local.get $len|7
   call $~lib/metashrew-as/assembly/utils/box/Box#constructor
   br $~lib/metashrew-as/assembly/utils/pointer/Pointer#toBox|inlined.4
  end
  call $~lib/metashrew-as/assembly/blockdata/witness/Witness#set:bytes
  local.get $this
 )
 (func $~lib/array/Array<~lib/metashrew-as/assembly/blockdata/transaction/Input>#__get (param $this i32) (param $index i32) (result i32)
  (local $value i32)
  local.get $index
  local.get $this
  call $~lib/array/Array<~lib/metashrew-as/assembly/blockdata/transaction/Input>#get:length_
  i32.ge_u
  if
   i32.const 2320
   i32.const 4272
   i32.const 114
   i32.const 42
   call $~lib/builtins/abort
   unreachable
  end
  local.get $this
  call $~lib/array/Array<~lib/metashrew-as/assembly/blockdata/transaction/Input>#get:dataStart
  local.get $index
  i32.const 2
  i32.shl
  i32.add
  i32.load
  local.set $value
  i32.const 1
  drop
  i32.const 0
  i32.eqz
  drop
  local.get $value
  i32.eqz
  if
   i32.const 4320
   i32.const 4272
   i32.const 118
   i32.const 40
   call $~lib/builtins/abort
   unreachable
  end
  local.get $value
  return
 )
 (func $~lib/metashrew-as/assembly/blockdata/transaction/Transaction#set:locktime (param $this i32) (param $locktime i32)
  local.get $this
  local.get $locktime
  i32.store offset=20
 )
 (func $~lib/metashrew-as/assembly/blockdata/transaction/Transaction#constructor (param $this i32) (param $data i32) (result i32)
  (local $head i32)
  (local $saved i32)
  (local $marker i32)
  (local $flag i32)
  (local $inputLegacyHead i32)
  (local $vinLen i32)
  (local $i i32)
  (local $voutLen i32)
  (local $i|10 i32)
  (local $outputLegacyTail i32)
  (local $this|12 i32)
  (local $len i32)
  (local $this|14 i32)
  (local $this|15 i32)
  (local $witnessHead i32)
  (local $i|17 i32)
  (local $witnessTail i32)
  (local $this|19 i32)
  (local $len|20 i32)
  (local $this|21 i32)
  (local $this|22 i32)
  (local $tail i32)
  (local $this|24 i32)
  (local $len|25 i32)
  (local $this|26 i32)
  (local $this|27 i32)
  local.get $this
  i32.eqz
  if
   i32.const 36
   i32.const 23
   call $~lib/rt/stub/__new
   local.set $this
  end
  local.get $this
  i32.const 0
  call $~lib/metashrew-as/assembly/blockdata/transaction/Transaction#set:bytes
  local.get $this
  i32.const 0
  call $~lib/metashrew-as/assembly/blockdata/transaction/Transaction#set:version
  local.get $this
  i32.const 0
  call $~lib/metashrew-as/assembly/blockdata/transaction/Transaction#set:flag
  local.get $this
  i32.const 0
  call $~lib/metashrew-as/assembly/blockdata/transaction/Transaction#set:ins
  local.get $this
  i32.const 0
  call $~lib/metashrew-as/assembly/blockdata/transaction/Transaction#set:outs
  local.get $this
  i32.const 0
  call $~lib/metashrew-as/assembly/blockdata/transaction/Transaction#set:locktime
  local.get $this
  i32.const 0
  call $~lib/metashrew-as/assembly/blockdata/transaction/Transaction#set:witnessDataBytes
  local.get $this
  i32.const 0
  call $~lib/metashrew-as/assembly/blockdata/transaction/Transaction#set:legacyInputOutputBytes
  local.get $this
  i32.const 0
  call $~lib/metashrew-as/assembly/blockdata/transaction/Transaction#set:_txid
  local.get $this
  call $~lib/metashrew-as/assembly/utils/pointer/nullptr<~lib/metashrew-as/assembly/utils/box/Box>
  call $~lib/metashrew-as/assembly/blockdata/transaction/Transaction#set:bytes
  local.get $this
  i32.const 0
  i32.const 0
  call $~lib/array/Array<~lib/metashrew-as/assembly/blockdata/transaction/Input>#constructor
  call $~lib/metashrew-as/assembly/blockdata/transaction/Transaction#set:ins
  local.get $this
  i32.const 0
  i32.const 0
  call $~lib/array/Array<~lib/metashrew-as/assembly/blockdata/transaction/Output>#constructor
  call $~lib/metashrew-as/assembly/blockdata/transaction/Transaction#set:outs
  local.get $this
  call $~lib/metashrew-as/assembly/utils/pointer/nullptr<~lib/metashrew-as/assembly/utils/box/Box>
  call $~lib/metashrew-as/assembly/blockdata/transaction/Transaction#set:witnessDataBytes
  local.get $this
  call $~lib/metashrew-as/assembly/utils/pointer/nullptr<~lib/metashrew-as/assembly/utils/box/Box>
  call $~lib/metashrew-as/assembly/blockdata/transaction/Transaction#set:legacyInputOutputBytes
  local.get $this
  i32.const 0
  call $~lib/metashrew-as/assembly/blockdata/transaction/Transaction#set:flag
  local.get $this
  i32.const 0
  i32.const 0
  call $~lib/arraybuffer/ArrayBuffer#constructor
  call $~lib/metashrew-as/assembly/blockdata/transaction/Transaction#set:_txid
  local.get $data
  call $~lib/metashrew-as/assembly/utils/box/Box#get:start
  local.set $head
  local.get $this
  local.get $data
  call $~lib/metashrew-as/assembly/utils/utils/parsePrimitive<u32>
  call $~lib/metashrew-as/assembly/blockdata/transaction/Transaction#set:version
  local.get $data
  i32.const 0
  call $~lib/metashrew-as/assembly/utils/box/Box#sliceFrom
  local.set $saved
  local.get $data
  call $~lib/metashrew-as/assembly/utils/utils/parsePrimitive<u8>
  local.set $marker
  local.get $data
  call $~lib/metashrew-as/assembly/utils/utils/parsePrimitive<u8>
  local.set $flag
  local.get $marker
  i32.const 0
  i32.eq
  if (result i32)
   local.get $flag
   i32.const 1
   i32.eq
  else
   i32.const 0
  end
  if
   local.get $this
   i32.const 1
   call $~lib/metashrew-as/assembly/blockdata/transaction/Transaction#set:flag
  else
   local.get $data
   local.get $saved
   call $~lib/metashrew-as/assembly/utils/box/Box#get:start
   call $~lib/metashrew-as/assembly/utils/box/Box#set:start
   local.get $data
   local.get $saved
   call $~lib/metashrew-as/assembly/utils/box/Box#get:len
   call $~lib/metashrew-as/assembly/utils/box/Box#set:len
  end
  local.get $data
  call $~lib/metashrew-as/assembly/utils/box/Box#get:start
  local.set $inputLegacyHead
  local.get $data
  call $~lib/metashrew-as/assembly/utils/utils/parseVarInt
  i32.wrap_i64
  local.set $vinLen
  i32.const 0
  local.set $i
  loop $for-loop|0
   local.get $i
   local.get $vinLen
   i32.lt_s
   if
    local.get $this
    call $~lib/metashrew-as/assembly/blockdata/transaction/Transaction#get:ins
    local.get $i
    i32.const 0
    local.get $data
    call $~lib/metashrew-as/assembly/blockdata/transaction/Input#constructor
    call $~lib/array/Array<~lib/metashrew-as/assembly/blockdata/transaction/Input>#__set
    local.get $i
    i32.const 1
    i32.add
    local.set $i
    br $for-loop|0
   end
  end
  local.get $data
  call $~lib/metashrew-as/assembly/utils/utils/parseVarInt
  i32.wrap_i64
  local.set $voutLen
  i32.const 0
  local.set $i|10
  loop $for-loop|1
   local.get $i|10
   local.get $voutLen
   i32.lt_s
   if
    local.get $this
    call $~lib/metashrew-as/assembly/blockdata/transaction/Transaction#get:flag
    if
     local.get $this
     call $~lib/metashrew-as/assembly/blockdata/transaction/Transaction#get:outs
     i32.const 0
     local.get $data
     i32.const 1
     call $~lib/metashrew-as/assembly/blockdata/transaction/Output#constructor
     call $~lib/array/Array<~lib/metashrew-as/assembly/blockdata/transaction/Output>#push
     drop
    else
     local.get $this
     call $~lib/metashrew-as/assembly/blockdata/transaction/Transaction#get:outs
     i32.const 0
     local.get $data
     i32.const 0
     call $~lib/metashrew-as/assembly/blockdata/transaction/Output#constructor
     call $~lib/array/Array<~lib/metashrew-as/assembly/blockdata/transaction/Output>#push
     drop
    end
    local.get $i|10
    i32.const 1
    i32.add
    local.set $i|10
    br $for-loop|1
   end
  end
  local.get $data
  call $~lib/metashrew-as/assembly/utils/box/Box#get:start
  local.set $outputLegacyTail
  local.get $this
  block $~lib/metashrew-as/assembly/utils/pointer/Pointer#toBox|inlined.3 (result i32)
   local.get $inputLegacyHead
   call $~lib/metashrew-as/assembly/utils/pointer/toPointer
   local.set $this|12
   local.get $outputLegacyTail
   local.get $inputLegacyHead
   i32.sub
   local.set $len
   i32.const 0
   block $~lib/metashrew-as/assembly/utils/pointer/Pointer#asUsize|inlined.3 (result i32)
    local.get $this|12
    local.set $this|14
    block $~lib/metashrew-as/assembly/utils/pointer/Pointer#asRef<usize>|inlined.3 (result i32)
     local.get $this|14
     local.set $this|15
     local.get $this|15
     br $~lib/metashrew-as/assembly/utils/pointer/Pointer#asRef<usize>|inlined.3
    end
    br $~lib/metashrew-as/assembly/utils/pointer/Pointer#asUsize|inlined.3
   end
   local.get $len
   call $~lib/metashrew-as/assembly/utils/box/Box#constructor
   br $~lib/metashrew-as/assembly/utils/pointer/Pointer#toBox|inlined.3
  end
  call $~lib/metashrew-as/assembly/blockdata/transaction/Transaction#set:legacyInputOutputBytes
  local.get $this
  call $~lib/metashrew-as/assembly/blockdata/transaction/Transaction#get:flag
  if
   local.get $data
   call $~lib/metashrew-as/assembly/utils/box/Box#get:start
   local.set $witnessHead
   i32.const 0
   local.set $i|17
   loop $for-loop|2
    local.get $i|17
    local.get $vinLen
    i32.lt_s
    if
     local.get $this
     call $~lib/metashrew-as/assembly/blockdata/transaction/Transaction#get:ins
     local.get $i|17
     call $~lib/array/Array<~lib/metashrew-as/assembly/blockdata/transaction/Input>#__get
     i32.const 0
     local.get $data
     call $~lib/metashrew-as/assembly/blockdata/witness/Witness#constructor
     call $~lib/metashrew-as/assembly/blockdata/transaction/Input#set:witness
     local.get $i|17
     i32.const 1
     i32.add
     local.set $i|17
     br $for-loop|2
    end
   end
   local.get $data
   call $~lib/metashrew-as/assembly/utils/box/Box#get:start
   local.set $witnessTail
   local.get $this
   block $~lib/metashrew-as/assembly/utils/pointer/Pointer#toBox|inlined.5 (result i32)
    local.get $witnessHead
    call $~lib/metashrew-as/assembly/utils/pointer/toPointer
    local.set $this|19
    local.get $witnessTail
    local.get $witnessHead
    i32.sub
    local.set $len|20
    i32.const 0
    block $~lib/metashrew-as/assembly/utils/pointer/Pointer#asUsize|inlined.5 (result i32)
     local.get $this|19
     local.set $this|21
     block $~lib/metashrew-as/assembly/utils/pointer/Pointer#asRef<usize>|inlined.5 (result i32)
      local.get $this|21
      local.set $this|22
      local.get $this|22
      br $~lib/metashrew-as/assembly/utils/pointer/Pointer#asRef<usize>|inlined.5
     end
     br $~lib/metashrew-as/assembly/utils/pointer/Pointer#asUsize|inlined.5
    end
    local.get $len|20
    call $~lib/metashrew-as/assembly/utils/box/Box#constructor
    br $~lib/metashrew-as/assembly/utils/pointer/Pointer#toBox|inlined.5
   end
   call $~lib/metashrew-as/assembly/blockdata/transaction/Transaction#set:witnessDataBytes
  end
  local.get $this
  local.get $data
  call $~lib/metashrew-as/assembly/utils/utils/parsePrimitive<u32>
  call $~lib/metashrew-as/assembly/blockdata/transaction/Transaction#set:locktime
  local.get $data
  call $~lib/metashrew-as/assembly/utils/box/Box#get:start
  local.set $tail
  local.get $this
  block $~lib/metashrew-as/assembly/utils/pointer/Pointer#toBox|inlined.6 (result i32)
   local.get $head
   call $~lib/metashrew-as/assembly/utils/pointer/toPointer
   local.set $this|24
   local.get $tail
   local.get $head
   i32.sub
   local.set $len|25
   i32.const 0
   block $~lib/metashrew-as/assembly/utils/pointer/Pointer#asUsize|inlined.6 (result i32)
    local.get $this|24
    local.set $this|26
    block $~lib/metashrew-as/assembly/utils/pointer/Pointer#asRef<usize>|inlined.6 (result i32)
     local.get $this|26
     local.set $this|27
     local.get $this|27
     br $~lib/metashrew-as/assembly/utils/pointer/Pointer#asRef<usize>|inlined.6
    end
    br $~lib/metashrew-as/assembly/utils/pointer/Pointer#asUsize|inlined.6
   end
   local.get $len|25
   call $~lib/metashrew-as/assembly/utils/box/Box#constructor
   br $~lib/metashrew-as/assembly/utils/pointer/Pointer#toBox|inlined.6
  end
  call $~lib/metashrew-as/assembly/blockdata/transaction/Transaction#set:bytes
  local.get $this
 )
 (func $~lib/metashrew-as/assembly/blockdata/merkletransaction/MerkleTransaction#set:redundantParentBlockHash (param $this i32) (param $redundantParentBlockHash i32)
  local.get $this
  local.get $redundantParentBlockHash
  i32.store offset=36
  local.get $this
  local.get $redundantParentBlockHash
  i32.const 0
  call $~lib/rt/stub/__link
 )
 (func $~lib/array/Array<~lib/metashrew-as/assembly/utils/box/Box>#set:buffer (param $this i32) (param $buffer i32)
  local.get $this
  local.get $buffer
  i32.store
  local.get $this
  local.get $buffer
  i32.const 0
  call $~lib/rt/stub/__link
 )
 (func $~lib/array/Array<~lib/metashrew-as/assembly/utils/box/Box>#set:dataStart (param $this i32) (param $dataStart i32)
  local.get $this
  local.get $dataStart
  i32.store offset=4
 )
 (func $~lib/array/Array<~lib/metashrew-as/assembly/utils/box/Box>#set:byteLength (param $this i32) (param $byteLength i32)
  local.get $this
  local.get $byteLength
  i32.store offset=8
 )
 (func $~lib/array/Array<~lib/metashrew-as/assembly/utils/box/Box>#set:length_ (param $this i32) (param $length_ i32)
  local.get $this
  local.get $length_
  i32.store offset=12
 )
 (func $~lib/array/Array<~lib/metashrew-as/assembly/utils/box/Box>#constructor (param $this i32) (param $length i32) (result i32)
  (local $2 i32)
  (local $3 i32)
  (local $bufferSize i32)
  (local $buffer i32)
  local.get $this
  i32.eqz
  if
   i32.const 16
   i32.const 31
   call $~lib/rt/stub/__new
   local.set $this
  end
  local.get $this
  i32.const 0
  call $~lib/array/Array<~lib/metashrew-as/assembly/utils/box/Box>#set:buffer
  local.get $this
  i32.const 0
  call $~lib/array/Array<~lib/metashrew-as/assembly/utils/box/Box>#set:dataStart
  local.get $this
  i32.const 0
  call $~lib/array/Array<~lib/metashrew-as/assembly/utils/box/Box>#set:byteLength
  local.get $this
  i32.const 0
  call $~lib/array/Array<~lib/metashrew-as/assembly/utils/box/Box>#set:length_
  local.get $length
  i32.const 1073741820
  i32.const 2
  i32.shr_u
  i32.gt_u
  if
   i32.const 1584
   i32.const 4272
   i32.const 70
   i32.const 60
   call $~lib/builtins/abort
   unreachable
  end
  local.get $length
  local.tee $2
  i32.const 8
  local.tee $3
  local.get $2
  local.get $3
  i32.gt_u
  select
  i32.const 2
  i32.shl
  local.set $bufferSize
  local.get $bufferSize
  i32.const 1
  call $~lib/rt/stub/__new
  local.set $buffer
  i32.const 0
  global.get $~lib/shared/runtime/Runtime.Incremental
  i32.ne
  drop
  local.get $buffer
  i32.const 0
  local.get $bufferSize
  memory.fill
  local.get $this
  local.get $buffer
  call $~lib/array/Array<~lib/metashrew-as/assembly/utils/box/Box>#set:buffer
  local.get $this
  local.get $buffer
  call $~lib/array/Array<~lib/metashrew-as/assembly/utils/box/Box>#set:dataStart
  local.get $this
  local.get $bufferSize
  call $~lib/array/Array<~lib/metashrew-as/assembly/utils/box/Box>#set:byteLength
  local.get $this
  local.get $length
  call $~lib/array/Array<~lib/metashrew-as/assembly/utils/box/Box>#set:length_
  local.get $this
 )
 (func $~lib/metashrew-as/assembly/blockdata/merkletransaction/MerkleTransaction#set:merkleBranch (param $this i32) (param $merkleBranch i32)
  local.get $this
  local.get $merkleBranch
  i32.store offset=40
  local.get $this
  local.get $merkleBranch
  i32.const 0
  call $~lib/rt/stub/__link
 )
 (func $~lib/metashrew-as/assembly/blockdata/merkletransaction/MerkleTransaction#get:merkleBranch (param $this i32) (result i32)
  local.get $this
  i32.load offset=40
 )
 (func $~lib/array/Array<~lib/metashrew-as/assembly/utils/box/Box>#get:length_ (param $this i32) (result i32)
  local.get $this
  i32.load offset=12
 )
 (func $~lib/array/Array<~lib/metashrew-as/assembly/utils/box/Box>#get:length (param $this i32) (result i32)
  local.get $this
  call $~lib/array/Array<~lib/metashrew-as/assembly/utils/box/Box>#get:length_
  return
 )
 (func $~lib/array/Array<~lib/metashrew-as/assembly/utils/box/Box>#get:dataStart (param $this i32) (result i32)
  local.get $this
  i32.load offset=4
 )
 (func $~lib/array/Array<~lib/metashrew-as/assembly/utils/box/Box>#__set (param $this i32) (param $index i32) (param $value i32)
  local.get $index
  local.get $this
  call $~lib/array/Array<~lib/metashrew-as/assembly/utils/box/Box>#get:length_
  i32.ge_u
  if
   local.get $index
   i32.const 0
   i32.lt_s
   if
    i32.const 2320
    i32.const 4272
    i32.const 130
    i32.const 22
    call $~lib/builtins/abort
    unreachable
   end
   local.get $this
   local.get $index
   i32.const 1
   i32.add
   i32.const 2
   i32.const 1
   call $~lib/array/ensureCapacity
   local.get $this
   local.get $index
   i32.const 1
   i32.add
   call $~lib/array/Array<~lib/metashrew-as/assembly/utils/box/Box>#set:length_
  end
  local.get $this
  call $~lib/array/Array<~lib/metashrew-as/assembly/utils/box/Box>#get:dataStart
  local.get $index
  i32.const 2
  i32.shl
  i32.add
  local.get $value
  i32.store
  i32.const 1
  drop
  local.get $this
  local.get $value
  i32.const 1
  call $~lib/rt/stub/__link
 )
 (func $~lib/metashrew-as/assembly/blockdata/merkletransaction/MerkleTransaction#set:merkleBranchSideMask (param $this i32) (param $merkleBranchSideMask i32)
  local.get $this
  local.get $merkleBranchSideMask
  i32.store offset=44
 )
 (func $~lib/metashrew-as/assembly/blockdata/merkletransaction/MerkleTransaction#constructor (param $this i32) (param $data i32) (result i32)
  (local $i i32)
  local.get $this
  i32.eqz
  if
   i32.const 48
   i32.const 22
   call $~lib/rt/stub/__new
   local.set $this
  end
  local.get $this
  i32.const 0
  call $~lib/metashrew-as/assembly/blockdata/merkletransaction/MerkleTransaction#set:redundantParentBlockHash
  local.get $this
  i32.const 0
  call $~lib/metashrew-as/assembly/blockdata/merkletransaction/MerkleTransaction#set:merkleBranch
  local.get $this
  i32.const 0
  call $~lib/metashrew-as/assembly/blockdata/merkletransaction/MerkleTransaction#set:merkleBranchSideMask
  local.get $this
  local.get $data
  call $~lib/metashrew-as/assembly/blockdata/transaction/Transaction#constructor
  local.set $this
  local.get $this
  local.get $data
  i32.const 32
  call $~lib/metashrew-as/assembly/utils/utils/parseBytes
  call $~lib/metashrew-as/assembly/blockdata/merkletransaction/MerkleTransaction#set:redundantParentBlockHash
  local.get $this
  i32.const 0
  local.get $data
  call $~lib/metashrew-as/assembly/utils/utils/parseVarInt
  i32.wrap_i64
  call $~lib/array/Array<~lib/metashrew-as/assembly/utils/box/Box>#constructor
  call $~lib/metashrew-as/assembly/blockdata/merkletransaction/MerkleTransaction#set:merkleBranch
  i32.const 0
  local.set $i
  loop $for-loop|0
   local.get $i
   local.get $this
   call $~lib/metashrew-as/assembly/blockdata/merkletransaction/MerkleTransaction#get:merkleBranch
   call $~lib/array/Array<~lib/metashrew-as/assembly/utils/box/Box>#get:length
   i32.lt_s
   if
    local.get $this
    call $~lib/metashrew-as/assembly/blockdata/merkletransaction/MerkleTransaction#get:merkleBranch
    local.get $i
    local.get $data
    i32.const 32
    call $~lib/metashrew-as/assembly/utils/utils/parseBytes
    call $~lib/array/Array<~lib/metashrew-as/assembly/utils/box/Box>#__set
    local.get $i
    i32.const 1
    i32.add
    local.set $i
    br $for-loop|0
   end
  end
  local.get $this
  local.get $data
  call $~lib/metashrew-as/assembly/utils/utils/parsePrimitive<u32>
  call $~lib/metashrew-as/assembly/blockdata/merkletransaction/MerkleTransaction#set:merkleBranchSideMask
  local.get $this
 )
 (func $~lib/metashrew-as/assembly/blockdata/auxpow/AuxPow#set:parentBlockHeader (param $this i32) (param $parentBlockHeader i32)
  local.get $this
  local.get $parentBlockHeader
  i32.store offset=56
  local.get $this
  local.get $parentBlockHeader
  i32.const 0
  call $~lib/rt/stub/__link
 )
 (func $~lib/metashrew-as/assembly/blockdata/auxpow/AuxPow#set:chainMerkleBranch (param $this i32) (param $chainMerkleBranch i32)
  local.get $this
  local.get $chainMerkleBranch
  i32.store offset=48
  local.get $this
  local.get $chainMerkleBranch
  i32.const 0
  call $~lib/rt/stub/__link
 )
 (func $~lib/metashrew-as/assembly/blockdata/auxpow/AuxPow#get:chainMerkleBranch (param $this i32) (result i32)
  local.get $this
  i32.load offset=48
 )
 (func $~lib/metashrew-as/assembly/blockdata/auxpow/AuxPow#set:chainMerkleBranchSideMask (param $this i32) (param $chainMerkleBranchSideMask i32)
  local.get $this
  local.get $chainMerkleBranchSideMask
  i32.store offset=52
 )
 (func $~lib/metashrew-as/assembly/utils/box/Box#setLength (param $this i32) (param $len i32) (result i32)
  local.get $this
  local.get $len
  call $~lib/metashrew-as/assembly/utils/box/Box#set:len
  local.get $this
  return
 )
 (func $~lib/metashrew-as/assembly/blockdata/auxpow/AuxPow#constructor (param $this i32) (param $data i32) (result i32)
  (local $i i32)
  local.get $this
  i32.eqz
  if
   i32.const 60
   i32.const 21
   call $~lib/rt/stub/__new
   local.set $this
  end
  local.get $this
  i32.const 0
  call $~lib/metashrew-as/assembly/blockdata/auxpow/AuxPow#set:chainMerkleBranch
  local.get $this
  i32.const 0
  call $~lib/metashrew-as/assembly/blockdata/auxpow/AuxPow#set:chainMerkleBranchSideMask
  local.get $this
  i32.const 0
  call $~lib/metashrew-as/assembly/blockdata/auxpow/AuxPow#set:parentBlockHeader
  local.get $this
  local.get $data
  call $~lib/metashrew-as/assembly/blockdata/merkletransaction/MerkleTransaction#constructor
  local.set $this
  local.get $this
  i32.const 0
  call $~lib/metashrew-as/assembly/blockdata/auxpow/AuxPow#set:parentBlockHeader
  local.get $this
  i32.const 0
  local.get $data
  call $~lib/metashrew-as/assembly/utils/utils/parseVarInt
  i32.wrap_i64
  call $~lib/array/Array<~lib/metashrew-as/assembly/utils/box/Box>#constructor
  call $~lib/metashrew-as/assembly/blockdata/auxpow/AuxPow#set:chainMerkleBranch
  i32.const 0
  local.set $i
  loop $for-loop|0
   local.get $i
   local.get $this
   call $~lib/metashrew-as/assembly/blockdata/auxpow/AuxPow#get:chainMerkleBranch
   call $~lib/array/Array<~lib/metashrew-as/assembly/utils/box/Box>#get:length
   i32.lt_s
   if
    local.get $this
    call $~lib/metashrew-as/assembly/blockdata/auxpow/AuxPow#get:chainMerkleBranch
    local.get $i
    local.get $data
    i32.const 32
    call $~lib/metashrew-as/assembly/utils/utils/parseBytes
    call $~lib/array/Array<~lib/metashrew-as/assembly/utils/box/Box>#__set
    local.get $i
    i32.const 1
    i32.add
    local.set $i
    br $for-loop|0
   end
  end
  local.get $this
  local.get $data
  call $~lib/metashrew-as/assembly/utils/utils/parsePrimitive<u32>
  call $~lib/metashrew-as/assembly/blockdata/auxpow/AuxPow#set:chainMerkleBranchSideMask
  local.get $this
  i32.const 0
  local.get $data
  i32.const 0
  call $~lib/metashrew-as/assembly/utils/box/Box#sliceFrom
  i32.const 80
  call $~lib/metashrew-as/assembly/utils/box/Box#setLength
  call $~lib/metashrew-as/assembly/blockdata/block/Header#constructor
  call $~lib/metashrew-as/assembly/blockdata/auxpow/AuxPow#set:parentBlockHeader
  local.get $data
  i32.const 80
  call $~lib/metashrew-as/assembly/utils/box/Box#shrinkFront
  drop
  local.get $this
 )
 (func $~lib/metashrew-as/assembly/blockdata/block/Header#constructor (param $this i32) (param $data i32) (result i32)
  (local $head i32)
  (local $tail i32)
  (local $this|4 i32)
  (local $len i32)
  (local $this|6 i32)
  (local $this|7 i32)
  local.get $this
  i32.eqz
  if
   i32.const 32
   i32.const 19
   call $~lib/rt/stub/__new
   local.set $this
  end
  local.get $this
  i32.const 0
  call $~lib/metashrew-as/assembly/blockdata/block/Header#set:version
  local.get $this
  i32.const 0
  call $~lib/metashrew-as/assembly/blockdata/block/Header#set:prevBlock
  local.get $this
  i32.const 0
  call $~lib/metashrew-as/assembly/blockdata/block/Header#set:merkleRoot
  local.get $this
  i32.const 0
  call $~lib/metashrew-as/assembly/blockdata/block/Header#set:time
  local.get $this
  i32.const 0
  call $~lib/metashrew-as/assembly/blockdata/block/Header#set:bits
  local.get $this
  i32.const 0
  call $~lib/metashrew-as/assembly/blockdata/block/Header#set:nonce
  local.get $this
  i32.const 0
  call $~lib/metashrew-as/assembly/blockdata/block/Header#set:bytes
  local.get $this
  i32.const 0
  call $~lib/metashrew-as/assembly/blockdata/block/Header#set:auxpow
  local.get $data
  call $~lib/metashrew-as/assembly/utils/box/Box#get:start
  local.set $head
  local.get $this
  call $~lib/metashrew-as/assembly/utils/pointer/nullptr<~lib/metashrew-as/assembly/blockdata/auxpow/AuxPow>
  call $~lib/metashrew-as/assembly/blockdata/block/Header#set:auxpow
  local.get $this
  i32.const 0
  local.get $data
  call $~lib/metashrew-as/assembly/utils/utils/parsePrimitive<u32>
  call $~lib/metashrew-as/assembly/blockdata/version/Version#constructor
  call $~lib/metashrew-as/assembly/blockdata/block/Header#set:version
  local.get $this
  local.get $data
  i32.const 32
  call $~lib/metashrew-as/assembly/utils/utils/parseBytes
  call $~lib/metashrew-as/assembly/blockdata/block/Header#set:prevBlock
  local.get $this
  local.get $data
  i32.const 32
  call $~lib/metashrew-as/assembly/utils/utils/parseBytes
  call $~lib/metashrew-as/assembly/blockdata/block/Header#set:merkleRoot
  local.get $this
  local.get $data
  call $~lib/metashrew-as/assembly/utils/utils/parsePrimitive<u32>
  call $~lib/metashrew-as/assembly/blockdata/block/Header#set:time
  local.get $this
  local.get $data
  call $~lib/metashrew-as/assembly/utils/utils/parsePrimitive<u32>
  call $~lib/metashrew-as/assembly/blockdata/block/Header#set:bits
  local.get $this
  local.get $data
  call $~lib/metashrew-as/assembly/utils/utils/parsePrimitive<u32>
  call $~lib/metashrew-as/assembly/blockdata/block/Header#set:nonce
  local.get $data
  call $~lib/metashrew-as/assembly/utils/box/Box#get:start
  local.set $tail
  local.get $this
  block $~lib/metashrew-as/assembly/utils/pointer/Pointer#toBox|inlined.0 (result i32)
   local.get $head
   call $~lib/metashrew-as/assembly/utils/pointer/toPointer
   local.set $this|4
   local.get $tail
   local.get $head
   i32.sub
   local.set $len
   i32.const 0
   block $~lib/metashrew-as/assembly/utils/pointer/Pointer#asUsize|inlined.0 (result i32)
    local.get $this|4
    local.set $this|6
    block $~lib/metashrew-as/assembly/utils/pointer/Pointer#asRef<usize>|inlined.0 (result i32)
     local.get $this|6
     local.set $this|7
     local.get $this|7
     br $~lib/metashrew-as/assembly/utils/pointer/Pointer#asRef<usize>|inlined.0
    end
    br $~lib/metashrew-as/assembly/utils/pointer/Pointer#asUsize|inlined.0
   end
   local.get $len
   call $~lib/metashrew-as/assembly/utils/box/Box#constructor
   br $~lib/metashrew-as/assembly/utils/pointer/Pointer#toBox|inlined.0
  end
  call $~lib/metashrew-as/assembly/blockdata/block/Header#set:bytes
  local.get $this
  call $~lib/metashrew-as/assembly/blockdata/block/Header#get:version
  call $~lib/metashrew-as/assembly/blockdata/version/Version#isAuxPow
  if (result i32)
   local.get $data
   call $~lib/metashrew-as/assembly/utils/box/Box#get:len
   i32.const 0
   i32.ne
  else
   i32.const 0
  end
  if
   local.get $this
   i32.const 0
   local.get $data
   call $~lib/metashrew-as/assembly/blockdata/auxpow/AuxPow#constructor
   call $~lib/metashrew-as/assembly/blockdata/block/Header#set:auxpow
  end
  local.get $this
 )
 (func $~lib/metashrew-as/assembly/blockdata/block/Block#set:header (param $this i32) (param $header i32)
  local.get $this
  local.get $header
  i32.store offset=4
  local.get $this
  local.get $header
  i32.const 0
  call $~lib/rt/stub/__link
 )
 (func $~lib/array/Array<~lib/metashrew-as/assembly/blockdata/transaction/Transaction>#set:buffer (param $this i32) (param $buffer i32)
  local.get $this
  local.get $buffer
  i32.store
  local.get $this
  local.get $buffer
  i32.const 0
  call $~lib/rt/stub/__link
 )
 (func $~lib/array/Array<~lib/metashrew-as/assembly/blockdata/transaction/Transaction>#set:dataStart (param $this i32) (param $dataStart i32)
  local.get $this
  local.get $dataStart
  i32.store offset=4
 )
 (func $~lib/array/Array<~lib/metashrew-as/assembly/blockdata/transaction/Transaction>#set:byteLength (param $this i32) (param $byteLength i32)
  local.get $this
  local.get $byteLength
  i32.store offset=8
 )
 (func $~lib/array/Array<~lib/metashrew-as/assembly/blockdata/transaction/Transaction>#set:length_ (param $this i32) (param $length_ i32)
  local.get $this
  local.get $length_
  i32.store offset=12
 )
 (func $~lib/array/Array<~lib/metashrew-as/assembly/blockdata/transaction/Transaction>#constructor (param $this i32) (param $length i32) (result i32)
  (local $2 i32)
  (local $3 i32)
  (local $bufferSize i32)
  (local $buffer i32)
  local.get $this
  i32.eqz
  if
   i32.const 16
   i32.const 32
   call $~lib/rt/stub/__new
   local.set $this
  end
  local.get $this
  i32.const 0
  call $~lib/array/Array<~lib/metashrew-as/assembly/blockdata/transaction/Transaction>#set:buffer
  local.get $this
  i32.const 0
  call $~lib/array/Array<~lib/metashrew-as/assembly/blockdata/transaction/Transaction>#set:dataStart
  local.get $this
  i32.const 0
  call $~lib/array/Array<~lib/metashrew-as/assembly/blockdata/transaction/Transaction>#set:byteLength
  local.get $this
  i32.const 0
  call $~lib/array/Array<~lib/metashrew-as/assembly/blockdata/transaction/Transaction>#set:length_
  local.get $length
  i32.const 1073741820
  i32.const 2
  i32.shr_u
  i32.gt_u
  if
   i32.const 1584
   i32.const 4272
   i32.const 70
   i32.const 60
   call $~lib/builtins/abort
   unreachable
  end
  local.get $length
  local.tee $2
  i32.const 8
  local.tee $3
  local.get $2
  local.get $3
  i32.gt_u
  select
  i32.const 2
  i32.shl
  local.set $bufferSize
  local.get $bufferSize
  i32.const 1
  call $~lib/rt/stub/__new
  local.set $buffer
  i32.const 0
  global.get $~lib/shared/runtime/Runtime.Incremental
  i32.ne
  drop
  local.get $buffer
  i32.const 0
  local.get $bufferSize
  memory.fill
  local.get $this
  local.get $buffer
  call $~lib/array/Array<~lib/metashrew-as/assembly/blockdata/transaction/Transaction>#set:buffer
  local.get $this
  local.get $buffer
  call $~lib/array/Array<~lib/metashrew-as/assembly/blockdata/transaction/Transaction>#set:dataStart
  local.get $this
  local.get $bufferSize
  call $~lib/array/Array<~lib/metashrew-as/assembly/blockdata/transaction/Transaction>#set:byteLength
  local.get $this
  local.get $length
  call $~lib/array/Array<~lib/metashrew-as/assembly/blockdata/transaction/Transaction>#set:length_
  local.get $this
 )
 (func $~lib/array/Array<~lib/metashrew-as/assembly/blockdata/transaction/Transaction>#get:length_ (param $this i32) (result i32)
  local.get $this
  i32.load offset=12
 )
 (func $~lib/array/Array<~lib/metashrew-as/assembly/blockdata/transaction/Transaction>#get:dataStart (param $this i32) (result i32)
  local.get $this
  i32.load offset=4
 )
 (func $~lib/array/Array<~lib/metashrew-as/assembly/blockdata/transaction/Transaction>#__set (param $this i32) (param $index i32) (param $value i32)
  local.get $index
  local.get $this
  call $~lib/array/Array<~lib/metashrew-as/assembly/blockdata/transaction/Transaction>#get:length_
  i32.ge_u
  if
   local.get $index
   i32.const 0
   i32.lt_s
   if
    i32.const 2320
    i32.const 4272
    i32.const 130
    i32.const 22
    call $~lib/builtins/abort
    unreachable
   end
   local.get $this
   local.get $index
   i32.const 1
   i32.add
   i32.const 2
   i32.const 1
   call $~lib/array/ensureCapacity
   local.get $this
   local.get $index
   i32.const 1
   i32.add
   call $~lib/array/Array<~lib/metashrew-as/assembly/blockdata/transaction/Transaction>#set:length_
  end
  local.get $this
  call $~lib/array/Array<~lib/metashrew-as/assembly/blockdata/transaction/Transaction>#get:dataStart
  local.get $index
  i32.const 2
  i32.shl
  i32.add
  local.get $value
  i32.store
  i32.const 1
  drop
  local.get $this
  local.get $value
  i32.const 1
  call $~lib/rt/stub/__link
 )
 (func $~lib/metashrew-as/assembly/blockdata/transaction/Transaction.parseTransactionsFromBlock (param $data i32) (result i32)
  (local $txsLen i64)
  (local $result i32)
  (local $i i32)
  local.get $data
  call $~lib/metashrew-as/assembly/utils/utils/parseVarInt
  local.set $txsLen
  i32.const 0
  local.get $txsLen
  i32.wrap_i64
  call $~lib/array/Array<~lib/metashrew-as/assembly/blockdata/transaction/Transaction>#constructor
  local.set $result
  i32.const 0
  local.set $i
  loop $for-loop|0
   local.get $i
   local.get $txsLen
   i32.wrap_i64
   i32.lt_s
   if
    local.get $result
    local.get $i
    i32.const 0
    local.get $data
    call $~lib/metashrew-as/assembly/blockdata/transaction/Transaction#constructor
    call $~lib/array/Array<~lib/metashrew-as/assembly/blockdata/transaction/Transaction>#__set
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
 (func $~lib/metashrew-as/assembly/blockdata/block/Block#set:bytes (param $this i32) (param $bytes i32)
  local.get $this
  local.get $bytes
  i32.store
  local.get $this
  local.get $bytes
  i32.const 0
  call $~lib/rt/stub/__link
 )
 (func $~lib/metashrew-as/assembly/blockdata/block/Block#constructor (param $this i32) (param $data i32) (result i32)
  (local $head i32)
  (local $tail i32)
  (local $this|4 i32)
  (local $len i32)
  (local $this|6 i32)
  (local $this|7 i32)
  local.get $this
  i32.eqz
  if
   i32.const 20
   i32.const 18
   call $~lib/rt/stub/__new
   local.set $this
  end
  local.get $this
  i32.const 0
  call $~lib/metashrew-as/assembly/blockdata/block/Block#set:bytes
  local.get $this
  i32.const 0
  call $~lib/metashrew-as/assembly/blockdata/block/Block#set:header
  local.get $this
  i32.const 0
  call $~lib/metashrew-as/assembly/blockdata/block/Block#set:transactions
  local.get $this
  i32.const 0
  call $~lib/metashrew-as/assembly/blockdata/block/Block#set:prevBlock
  local.get $this
  i32.const 0
  call $~lib/metashrew-as/assembly/blockdata/block/Block#set:merkleRoot
  local.get $this
  call $~lib/metashrew-as/assembly/utils/pointer/nullptr<~lib/array/Array<~lib/metashrew-as/assembly/blockdata/transaction/Transaction>>
  call $~lib/metashrew-as/assembly/blockdata/block/Block#set:transactions
  local.get $this
  call $~lib/metashrew-as/assembly/utils/pointer/nullptr<~lib/metashrew-as/assembly/utils/box/Box>
  call $~lib/metashrew-as/assembly/blockdata/block/Block#set:prevBlock
  local.get $this
  call $~lib/metashrew-as/assembly/utils/pointer/nullptr<~lib/metashrew-as/assembly/utils/box/Box>
  call $~lib/metashrew-as/assembly/blockdata/block/Block#set:merkleRoot
  local.get $data
  call $~lib/metashrew-as/assembly/utils/box/Box#get:start
  local.set $head
  local.get $this
  i32.const 0
  local.get $data
  call $~lib/metashrew-as/assembly/blockdata/block/Header#constructor
  call $~lib/metashrew-as/assembly/blockdata/block/Block#set:header
  local.get $this
  local.get $data
  call $~lib/metashrew-as/assembly/blockdata/transaction/Transaction.parseTransactionsFromBlock
  call $~lib/metashrew-as/assembly/blockdata/block/Block#set:transactions
  local.get $data
  call $~lib/metashrew-as/assembly/utils/box/Box#get:start
  local.set $tail
  local.get $this
  block $~lib/metashrew-as/assembly/utils/pointer/Pointer#toBox|inlined.7 (result i32)
   local.get $head
   call $~lib/metashrew-as/assembly/utils/pointer/toPointer
   local.set $this|4
   local.get $tail
   local.get $head
   i32.sub
   local.set $len
   i32.const 0
   block $~lib/metashrew-as/assembly/utils/pointer/Pointer#asUsize|inlined.7 (result i32)
    local.get $this|4
    local.set $this|6
    block $~lib/metashrew-as/assembly/utils/pointer/Pointer#asRef<usize>|inlined.7 (result i32)
     local.get $this|6
     local.set $this|7
     local.get $this|7
     br $~lib/metashrew-as/assembly/utils/pointer/Pointer#asRef<usize>|inlined.7
    end
    br $~lib/metashrew-as/assembly/utils/pointer/Pointer#asUsize|inlined.7
   end
   local.get $len
   call $~lib/metashrew-as/assembly/utils/box/Box#constructor
   br $~lib/metashrew-as/assembly/utils/pointer/Pointer#toBox|inlined.7
  end
  call $~lib/metashrew-as/assembly/blockdata/block/Block#set:bytes
  local.get $this
 )
 (func $~lib/util/number/decimalCount32 (param $value i32) (result i32)
  local.get $value
  i32.const 100000
  i32.lt_u
  if
   local.get $value
   i32.const 100
   i32.lt_u
   if
    i32.const 1
    local.get $value
    i32.const 10
    i32.ge_u
    i32.add
    return
   else
    i32.const 3
    local.get $value
    i32.const 10000
    i32.ge_u
    i32.add
    local.get $value
    i32.const 1000
    i32.ge_u
    i32.add
    return
   end
   unreachable
  else
   local.get $value
   i32.const 10000000
   i32.lt_u
   if
    i32.const 6
    local.get $value
    i32.const 1000000
    i32.ge_u
    i32.add
    return
   else
    i32.const 8
    local.get $value
    i32.const 1000000000
    i32.ge_u
    i32.add
    local.get $value
    i32.const 100000000
    i32.ge_u
    i32.add
    return
   end
   unreachable
  end
  unreachable
 )
 (func $~lib/util/number/utoa32_dec_lut (param $buffer i32) (param $num i32) (param $offset i32)
  (local $t i32)
  (local $r i32)
  (local $d1 i32)
  (local $d2 i32)
  (local $digits1 i64)
  (local $digits2 i64)
  (local $t|9 i32)
  (local $d1|10 i32)
  (local $digits i32)
  (local $digits|12 i32)
  (local $digit i32)
  loop $while-continue|0
   local.get $num
   i32.const 10000
   i32.ge_u
   if
    local.get $num
    i32.const 10000
    i32.div_u
    local.set $t
    local.get $num
    i32.const 10000
    i32.rem_u
    local.set $r
    local.get $t
    local.set $num
    local.get $r
    i32.const 100
    i32.div_u
    local.set $d1
    local.get $r
    i32.const 100
    i32.rem_u
    local.set $d2
    i32.const 4700
    local.get $d1
    i32.const 2
    i32.shl
    i32.add
    i64.load32_u
    local.set $digits1
    i32.const 4700
    local.get $d2
    i32.const 2
    i32.shl
    i32.add
    i64.load32_u
    local.set $digits2
    local.get $offset
    i32.const 4
    i32.sub
    local.set $offset
    local.get $buffer
    local.get $offset
    i32.const 1
    i32.shl
    i32.add
    local.get $digits1
    local.get $digits2
    i64.const 32
    i64.shl
    i64.or
    i64.store
    br $while-continue|0
   end
  end
  local.get $num
  i32.const 100
  i32.ge_u
  if
   local.get $num
   i32.const 100
   i32.div_u
   local.set $t|9
   local.get $num
   i32.const 100
   i32.rem_u
   local.set $d1|10
   local.get $t|9
   local.set $num
   local.get $offset
   i32.const 2
   i32.sub
   local.set $offset
   i32.const 4700
   local.get $d1|10
   i32.const 2
   i32.shl
   i32.add
   i32.load
   local.set $digits
   local.get $buffer
   local.get $offset
   i32.const 1
   i32.shl
   i32.add
   local.get $digits
   i32.store
  end
  local.get $num
  i32.const 10
  i32.ge_u
  if
   local.get $offset
   i32.const 2
   i32.sub
   local.set $offset
   i32.const 4700
   local.get $num
   i32.const 2
   i32.shl
   i32.add
   i32.load
   local.set $digits|12
   local.get $buffer
   local.get $offset
   i32.const 1
   i32.shl
   i32.add
   local.get $digits|12
   i32.store
  else
   local.get $offset
   i32.const 1
   i32.sub
   local.set $offset
   i32.const 48
   local.get $num
   i32.add
   local.set $digit
   local.get $buffer
   local.get $offset
   i32.const 1
   i32.shl
   i32.add
   local.get $digit
   i32.store16
  end
 )
 (func $~lib/util/number/utoa_hex_lut (param $buffer i32) (param $num i64) (param $offset i32)
  loop $while-continue|0
   local.get $offset
   i32.const 2
   i32.ge_u
   if
    local.get $offset
    i32.const 2
    i32.sub
    local.set $offset
    local.get $buffer
    local.get $offset
    i32.const 1
    i32.shl
    i32.add
    i32.const 5120
    local.get $num
    i32.wrap_i64
    i32.const 255
    i32.and
    i32.const 2
    i32.shl
    i32.add
    i32.load
    i32.store
    local.get $num
    i64.const 8
    i64.shr_u
    local.set $num
    br $while-continue|0
   end
  end
  local.get $offset
  i32.const 1
  i32.and
  if
   local.get $buffer
   i32.const 5120
   local.get $num
   i32.wrap_i64
   i32.const 6
   i32.shl
   i32.add
   i32.load16_u
   i32.store16
  end
 )
 (func $~lib/util/number/ulog_base (param $num i64) (param $base i32) (result i32)
  (local $value i32)
  (local $b64 i64)
  (local $b i64)
  (local $e i32)
  block $~lib/util/number/isPowerOf2<i32>|inlined.0 (result i32)
   local.get $base
   local.set $value
   local.get $value
   i32.popcnt
   i32.const 1
   i32.eq
   br $~lib/util/number/isPowerOf2<i32>|inlined.0
  end
  if
   i32.const 63
   local.get $num
   i64.clz
   i32.wrap_i64
   i32.sub
   i32.const 31
   local.get $base
   i32.clz
   i32.sub
   i32.div_u
   i32.const 1
   i32.add
   return
  end
  local.get $base
  i64.extend_i32_s
  local.set $b64
  local.get $b64
  local.set $b
  i32.const 1
  local.set $e
  loop $while-continue|0
   local.get $num
   local.get $b
   i64.ge_u
   if
    local.get $num
    local.get $b
    i64.div_u
    local.set $num
    local.get $b
    local.get $b
    i64.mul
    local.set $b
    local.get $e
    i32.const 1
    i32.shl
    local.set $e
    br $while-continue|0
   end
  end
  loop $while-continue|1
   local.get $num
   i64.const 1
   i64.ge_u
   if
    local.get $num
    local.get $b64
    i64.div_u
    local.set $num
    local.get $e
    i32.const 1
    i32.add
    local.set $e
    br $while-continue|1
   end
  end
  local.get $e
  i32.const 1
  i32.sub
  return
 )
 (func $~lib/util/number/utoa64_any_core (param $buffer i32) (param $num i64) (param $offset i32) (param $radix i32)
  (local $base i64)
  (local $shift i64)
  (local $mask i64)
  (local $q i64)
  local.get $radix
  i64.extend_i32_s
  local.set $base
  local.get $radix
  local.get $radix
  i32.const 1
  i32.sub
  i32.and
  i32.const 0
  i32.eq
  if
   local.get $radix
   i32.ctz
   i32.const 7
   i32.and
   i64.extend_i32_s
   local.set $shift
   local.get $base
   i64.const 1
   i64.sub
   local.set $mask
   loop $do-loop|0
    local.get $offset
    i32.const 1
    i32.sub
    local.set $offset
    local.get $buffer
    local.get $offset
    i32.const 1
    i32.shl
    i32.add
    i32.const 6176
    local.get $num
    local.get $mask
    i64.and
    i32.wrap_i64
    i32.const 1
    i32.shl
    i32.add
    i32.load16_u
    i32.store16
    local.get $num
    local.get $shift
    i64.shr_u
    local.set $num
    local.get $num
    i64.const 0
    i64.ne
    br_if $do-loop|0
   end
  else
   loop $do-loop|1
    local.get $offset
    i32.const 1
    i32.sub
    local.set $offset
    local.get $num
    local.get $base
    i64.div_u
    local.set $q
    local.get $buffer
    local.get $offset
    i32.const 1
    i32.shl
    i32.add
    i32.const 6176
    local.get $num
    local.get $q
    local.get $base
    i64.mul
    i64.sub
    i32.wrap_i64
    i32.const 1
    i32.shl
    i32.add
    i32.load16_u
    i32.store16
    local.get $q
    local.set $num
    local.get $num
    i64.const 0
    i64.ne
    br_if $do-loop|1
   end
  end
 )
 (func $~lib/util/number/utoa32 (param $value i32) (param $radix i32) (result i32)
  (local $out i32)
  (local $decimals i32)
  (local $buffer i32)
  (local $num i32)
  (local $offset i32)
  (local $decimals|7 i32)
  (local $buffer|8 i32)
  (local $num|9 i32)
  (local $offset|10 i32)
  (local $decimals|11 i32)
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
   i32.const 4496
   i32.const 4624
   i32.const 350
   i32.const 5
   call $~lib/builtins/abort
   unreachable
  end
  local.get $value
  i32.eqz
  if
   i32.const 4688
   return
  end
  local.get $radix
  i32.const 10
  i32.eq
  if
   local.get $value
   call $~lib/util/number/decimalCount32
   local.set $decimals
   local.get $decimals
   i32.const 1
   i32.shl
   i32.const 2
   call $~lib/rt/stub/__new
   local.set $out
   local.get $out
   local.set $buffer
   local.get $value
   local.set $num
   local.get $decimals
   local.set $offset
   i32.const 0
   i32.const 1
   i32.ge_s
   drop
   local.get $buffer
   local.get $num
   local.get $offset
   call $~lib/util/number/utoa32_dec_lut
  else
   local.get $radix
   i32.const 16
   i32.eq
   if
    i32.const 31
    local.get $value
    i32.clz
    i32.sub
    i32.const 2
    i32.shr_s
    i32.const 1
    i32.add
    local.set $decimals|7
    local.get $decimals|7
    i32.const 1
    i32.shl
    i32.const 2
    call $~lib/rt/stub/__new
    local.set $out
    local.get $out
    local.set $buffer|8
    local.get $value
    local.set $num|9
    local.get $decimals|7
    local.set $offset|10
    i32.const 0
    i32.const 1
    i32.ge_s
    drop
    local.get $buffer|8
    local.get $num|9
    i64.extend_i32_u
    local.get $offset|10
    call $~lib/util/number/utoa_hex_lut
   else
    local.get $value
    i64.extend_i32_u
    local.get $radix
    call $~lib/util/number/ulog_base
    local.set $decimals|11
    local.get $decimals|11
    i32.const 1
    i32.shl
    i32.const 2
    call $~lib/rt/stub/__new
    local.set $out
    local.get $out
    local.get $value
    i64.extend_i32_u
    local.get $decimals|11
    local.get $radix
    call $~lib/util/number/utoa64_any_core
   end
  end
  local.get $out
  return
 )
 (func $~lib/number/U32#toString (param $this i32) (param $radix i32) (result i32)
  local.get $this
  local.get $radix
  call $~lib/util/number/utoa32
  return
 )
 (func $~lib/string/String#concat (param $this i32) (param $other i32) (result i32)
  (local $thisSize i32)
  (local $otherSize i32)
  (local $outSize i32)
  (local $out i32)
  local.get $this
  call $~lib/string/String#get:length
  i32.const 1
  i32.shl
  local.set $thisSize
  local.get $other
  call $~lib/string/String#get:length
  i32.const 1
  i32.shl
  local.set $otherSize
  local.get $thisSize
  local.get $otherSize
  i32.add
  local.set $outSize
  local.get $outSize
  i32.const 0
  i32.eq
  if
   i32.const 6272
   return
  end
  local.get $outSize
  i32.const 2
  call $~lib/rt/stub/__new
  local.set $out
  local.get $out
  local.get $this
  local.get $thisSize
  memory.copy
  local.get $out
  local.get $thisSize
  i32.add
  local.get $other
  local.get $otherSize
  memory.copy
  local.get $out
  return
 )
 (func $~lib/string/String.__concat (param $left i32) (param $right i32) (result i32)
  local.get $left
  local.get $right
  call $~lib/string/String#concat
  return
 )
 (func $~lib/metashrew-as/assembly/utils/logging/Console#log (param $this i32) (param $v i32)
  local.get $v
  i32.const 1
  i32.const 2
  global.set $~argumentsLength
  i32.const 0
  call $~lib/string/String.UTF8.encode@varargs
  call $~lib/metashrew-as/assembly/utils/logging/__log
 )
 (func $"~lib/map/Map<~lib/string/String,~lib/arraybuffer/ArrayBuffer>#get:entries" (param $this i32) (result i32)
  local.get $this
  i32.load offset=8
 )
 (func $"~lib/map/Map<~lib/string/String,~lib/arraybuffer/ArrayBuffer>#get:entriesOffset" (param $this i32) (result i32)
  local.get $this
  i32.load offset=16
 )
 (func $~lib/array/Array<~lib/string/String>#set:buffer (param $this i32) (param $buffer i32)
  local.get $this
  local.get $buffer
  i32.store
  local.get $this
  local.get $buffer
  i32.const 0
  call $~lib/rt/stub/__link
 )
 (func $~lib/array/Array<~lib/string/String>#set:dataStart (param $this i32) (param $dataStart i32)
  local.get $this
  local.get $dataStart
  i32.store offset=4
 )
 (func $~lib/array/Array<~lib/string/String>#set:byteLength (param $this i32) (param $byteLength i32)
  local.get $this
  local.get $byteLength
  i32.store offset=8
 )
 (func $~lib/array/Array<~lib/string/String>#set:length_ (param $this i32) (param $length_ i32)
  local.get $this
  local.get $length_
  i32.store offset=12
 )
 (func $~lib/array/Array<~lib/string/String>#constructor (param $this i32) (param $length i32) (result i32)
  (local $2 i32)
  (local $3 i32)
  (local $bufferSize i32)
  (local $buffer i32)
  local.get $this
  i32.eqz
  if
   i32.const 16
   i32.const 34
   call $~lib/rt/stub/__new
   local.set $this
  end
  local.get $this
  i32.const 0
  call $~lib/array/Array<~lib/string/String>#set:buffer
  local.get $this
  i32.const 0
  call $~lib/array/Array<~lib/string/String>#set:dataStart
  local.get $this
  i32.const 0
  call $~lib/array/Array<~lib/string/String>#set:byteLength
  local.get $this
  i32.const 0
  call $~lib/array/Array<~lib/string/String>#set:length_
  local.get $length
  i32.const 1073741820
  i32.const 2
  i32.shr_u
  i32.gt_u
  if
   i32.const 1584
   i32.const 4272
   i32.const 70
   i32.const 60
   call $~lib/builtins/abort
   unreachable
  end
  local.get $length
  local.tee $2
  i32.const 8
  local.tee $3
  local.get $2
  local.get $3
  i32.gt_u
  select
  i32.const 2
  i32.shl
  local.set $bufferSize
  local.get $bufferSize
  i32.const 1
  call $~lib/rt/stub/__new
  local.set $buffer
  i32.const 0
  global.get $~lib/shared/runtime/Runtime.Incremental
  i32.ne
  drop
  local.get $buffer
  i32.const 0
  local.get $bufferSize
  memory.fill
  local.get $this
  local.get $buffer
  call $~lib/array/Array<~lib/string/String>#set:buffer
  local.get $this
  local.get $buffer
  call $~lib/array/Array<~lib/string/String>#set:dataStart
  local.get $this
  local.get $bufferSize
  call $~lib/array/Array<~lib/string/String>#set:byteLength
  local.get $this
  local.get $length
  call $~lib/array/Array<~lib/string/String>#set:length_
  local.get $this
 )
 (func $"~lib/map/MapEntry<~lib/string/String,~lib/arraybuffer/ArrayBuffer>#get:taggedNext" (param $this i32) (result i32)
  local.get $this
  i32.load offset=8
 )
 (func $"~lib/map/MapEntry<~lib/string/String,~lib/arraybuffer/ArrayBuffer>#get:key" (param $this i32) (result i32)
  local.get $this
  i32.load
 )
 (func $~lib/array/Array<~lib/string/String>#get:length_ (param $this i32) (result i32)
  local.get $this
  i32.load offset=12
 )
 (func $~lib/array/Array<~lib/string/String>#get:dataStart (param $this i32) (result i32)
  local.get $this
  i32.load offset=4
 )
 (func $~lib/array/Array<~lib/string/String>#__set (param $this i32) (param $index i32) (param $value i32)
  local.get $index
  local.get $this
  call $~lib/array/Array<~lib/string/String>#get:length_
  i32.ge_u
  if
   local.get $index
   i32.const 0
   i32.lt_s
   if
    i32.const 2320
    i32.const 4272
    i32.const 130
    i32.const 22
    call $~lib/builtins/abort
    unreachable
   end
   local.get $this
   local.get $index
   i32.const 1
   i32.add
   i32.const 2
   i32.const 1
   call $~lib/array/ensureCapacity
   local.get $this
   local.get $index
   i32.const 1
   i32.add
   call $~lib/array/Array<~lib/string/String>#set:length_
  end
  local.get $this
  call $~lib/array/Array<~lib/string/String>#get:dataStart
  local.get $index
  i32.const 2
  i32.shl
  i32.add
  local.get $value
  i32.store
  i32.const 1
  drop
  local.get $this
  local.get $value
  i32.const 1
  call $~lib/rt/stub/__link
 )
 (func $~lib/array/Array<~lib/string/String>#set:length (param $this i32) (param $newLength i32)
  local.get $this
  local.get $newLength
  i32.const 2
  i32.const 0
  call $~lib/array/ensureCapacity
  local.get $this
  local.get $newLength
  call $~lib/array/Array<~lib/string/String>#set:length_
 )
 (func $"~lib/map/Map<~lib/string/String,~lib/arraybuffer/ArrayBuffer>#keys" (param $this i32) (result i32)
  (local $start i32)
  (local $size i32)
  (local $keys i32)
  (local $length i32)
  (local $i i32)
  (local $entry i32)
  (local $7 i32)
  local.get $this
  call $"~lib/map/Map<~lib/string/String,~lib/arraybuffer/ArrayBuffer>#get:entries"
  local.set $start
  local.get $this
  call $"~lib/map/Map<~lib/string/String,~lib/arraybuffer/ArrayBuffer>#get:entriesOffset"
  local.set $size
  i32.const 0
  local.get $size
  call $~lib/array/Array<~lib/string/String>#constructor
  local.set $keys
  i32.const 0
  local.set $length
  i32.const 0
  local.set $i
  loop $for-loop|0
   local.get $i
   local.get $size
   i32.lt_s
   if
    local.get $start
    local.get $i
    block $"~lib/map/ENTRY_SIZE<~lib/string/String,~lib/arraybuffer/ArrayBuffer>|inlined.1" (result i32)
     i32.const 12
     br $"~lib/map/ENTRY_SIZE<~lib/string/String,~lib/arraybuffer/ArrayBuffer>|inlined.1"
    end
    i32.mul
    i32.add
    local.set $entry
    local.get $entry
    call $"~lib/map/MapEntry<~lib/string/String,~lib/arraybuffer/ArrayBuffer>#get:taggedNext"
    i32.const 1
    i32.and
    i32.eqz
    if
     local.get $keys
     local.get $length
     local.tee $7
     i32.const 1
     i32.add
     local.set $length
     local.get $7
     local.get $entry
     call $"~lib/map/MapEntry<~lib/string/String,~lib/arraybuffer/ArrayBuffer>#get:key"
     call $~lib/array/Array<~lib/string/String>#__set
    end
    local.get $i
    i32.const 1
    i32.add
    local.set $i
    br $for-loop|0
   end
  end
  local.get $keys
  local.get $length
  call $~lib/array/Array<~lib/string/String>#set:length
  local.get $keys
  return
 )
 (func $~lib/array/Array<~lib/array/Array<u8>>#set:buffer (param $this i32) (param $buffer i32)
  local.get $this
  local.get $buffer
  i32.store
  local.get $this
  local.get $buffer
  i32.const 0
  call $~lib/rt/stub/__link
 )
 (func $~lib/array/Array<~lib/array/Array<u8>>#set:dataStart (param $this i32) (param $dataStart i32)
  local.get $this
  local.get $dataStart
  i32.store offset=4
 )
 (func $~lib/array/Array<~lib/array/Array<u8>>#set:byteLength (param $this i32) (param $byteLength i32)
  local.get $this
  local.get $byteLength
  i32.store offset=8
 )
 (func $~lib/array/Array<~lib/array/Array<u8>>#set:length_ (param $this i32) (param $length_ i32)
  local.get $this
  local.get $length_
  i32.store offset=12
 )
 (func $~lib/array/Array<~lib/array/Array<u8>>#constructor (param $this i32) (param $length i32) (result i32)
  (local $2 i32)
  (local $3 i32)
  (local $bufferSize i32)
  (local $buffer i32)
  local.get $this
  i32.eqz
  if
   i32.const 16
   i32.const 35
   call $~lib/rt/stub/__new
   local.set $this
  end
  local.get $this
  i32.const 0
  call $~lib/array/Array<~lib/array/Array<u8>>#set:buffer
  local.get $this
  i32.const 0
  call $~lib/array/Array<~lib/array/Array<u8>>#set:dataStart
  local.get $this
  i32.const 0
  call $~lib/array/Array<~lib/array/Array<u8>>#set:byteLength
  local.get $this
  i32.const 0
  call $~lib/array/Array<~lib/array/Array<u8>>#set:length_
  local.get $length
  i32.const 1073741820
  i32.const 2
  i32.shr_u
  i32.gt_u
  if
   i32.const 1584
   i32.const 4272
   i32.const 70
   i32.const 60
   call $~lib/builtins/abort
   unreachable
  end
  local.get $length
  local.tee $2
  i32.const 8
  local.tee $3
  local.get $2
  local.get $3
  i32.gt_u
  select
  i32.const 2
  i32.shl
  local.set $bufferSize
  local.get $bufferSize
  i32.const 1
  call $~lib/rt/stub/__new
  local.set $buffer
  i32.const 0
  global.get $~lib/shared/runtime/Runtime.Incremental
  i32.ne
  drop
  local.get $buffer
  i32.const 0
  local.get $bufferSize
  memory.fill
  local.get $this
  local.get $buffer
  call $~lib/array/Array<~lib/array/Array<u8>>#set:buffer
  local.get $this
  local.get $buffer
  call $~lib/array/Array<~lib/array/Array<u8>>#set:dataStart
  local.get $this
  local.get $bufferSize
  call $~lib/array/Array<~lib/array/Array<u8>>#set:byteLength
  local.get $this
  local.get $length
  call $~lib/array/Array<~lib/array/Array<u8>>#set:length_
  local.get $this
 )
 (func $~lib/util/hash/HASH<~lib/string/String> (param $key i32) (result i32)
  (local $key|1 i32)
  (local $h i32)
  (local $len i32)
  (local $pos i32)
  (local $s1 i32)
  (local $s2 i32)
  (local $s3 i32)
  (local $s4 i32)
  (local $end i32)
  (local $h|10 i32)
  (local $key|11 i32)
  (local $h|12 i32)
  (local $key|13 i32)
  (local $h|14 i32)
  (local $key|15 i32)
  (local $h|16 i32)
  (local $key|17 i32)
  (local $end|18 i32)
  i32.const 1
  drop
  block $~lib/util/hash/hashStr|inlined.0 (result i32)
   local.get $key
   local.set $key|1
   local.get $key|1
   i32.const 0
   i32.eq
   if
    i32.const 0
    br $~lib/util/hash/hashStr|inlined.0
   end
   local.get $key|1
   call $~lib/string/String#get:length
   i32.const 1
   i32.shl
   local.set $h
   local.get $h
   local.set $len
   local.get $key|1
   local.set $pos
   local.get $len
   i32.const 16
   i32.ge_u
   if
    i32.const 0
    i32.const -1640531535
    i32.add
    i32.const -2048144777
    i32.add
    local.set $s1
    i32.const 0
    i32.const -2048144777
    i32.add
    local.set $s2
    i32.const 0
    local.set $s3
    i32.const 0
    i32.const -1640531535
    i32.sub
    local.set $s4
    local.get $len
    local.get $pos
    i32.add
    i32.const 16
    i32.sub
    local.set $end
    loop $while-continue|0
     local.get $pos
     local.get $end
     i32.le_u
     if
      block $~lib/util/hash/mix|inlined.0 (result i32)
       local.get $s1
       local.set $h|10
       local.get $pos
       i32.load
       local.set $key|11
       local.get $h|10
       local.get $key|11
       i32.const -2048144777
       i32.mul
       i32.add
       i32.const 13
       i32.rotl
       i32.const -1640531535
       i32.mul
       br $~lib/util/hash/mix|inlined.0
      end
      local.set $s1
      block $~lib/util/hash/mix|inlined.1 (result i32)
       local.get $s2
       local.set $h|12
       local.get $pos
       i32.load offset=4
       local.set $key|13
       local.get $h|12
       local.get $key|13
       i32.const -2048144777
       i32.mul
       i32.add
       i32.const 13
       i32.rotl
       i32.const -1640531535
       i32.mul
       br $~lib/util/hash/mix|inlined.1
      end
      local.set $s2
      block $~lib/util/hash/mix|inlined.2 (result i32)
       local.get $s3
       local.set $h|14
       local.get $pos
       i32.load offset=8
       local.set $key|15
       local.get $h|14
       local.get $key|15
       i32.const -2048144777
       i32.mul
       i32.add
       i32.const 13
       i32.rotl
       i32.const -1640531535
       i32.mul
       br $~lib/util/hash/mix|inlined.2
      end
      local.set $s3
      block $~lib/util/hash/mix|inlined.3 (result i32)
       local.get $s4
       local.set $h|16
       local.get $pos
       i32.load offset=12
       local.set $key|17
       local.get $h|16
       local.get $key|17
       i32.const -2048144777
       i32.mul
       i32.add
       i32.const 13
       i32.rotl
       i32.const -1640531535
       i32.mul
       br $~lib/util/hash/mix|inlined.3
      end
      local.set $s4
      local.get $pos
      i32.const 16
      i32.add
      local.set $pos
      br $while-continue|0
     end
    end
    local.get $h
    local.get $s1
    i32.const 1
    i32.rotl
    local.get $s2
    i32.const 7
    i32.rotl
    i32.add
    local.get $s3
    i32.const 12
    i32.rotl
    i32.add
    local.get $s4
    i32.const 18
    i32.rotl
    i32.add
    i32.add
    local.set $h
   else
    local.get $h
    i32.const 0
    i32.const 374761393
    i32.add
    i32.add
    local.set $h
   end
   local.get $key|1
   local.get $len
   i32.add
   i32.const 4
   i32.sub
   local.set $end|18
   loop $while-continue|1
    local.get $pos
    local.get $end|18
    i32.le_u
    if
     local.get $h
     local.get $pos
     i32.load
     i32.const -1028477379
     i32.mul
     i32.add
     local.set $h
     local.get $h
     i32.const 17
     i32.rotl
     i32.const 668265263
     i32.mul
     local.set $h
     local.get $pos
     i32.const 4
     i32.add
     local.set $pos
     br $while-continue|1
    end
   end
   local.get $key|1
   local.get $len
   i32.add
   local.set $end|18
   loop $while-continue|2
    local.get $pos
    local.get $end|18
    i32.lt_u
    if
     local.get $h
     local.get $pos
     i32.load8_u
     i32.const 374761393
     i32.mul
     i32.add
     local.set $h
     local.get $h
     i32.const 11
     i32.rotl
     i32.const -1640531535
     i32.mul
     local.set $h
     local.get $pos
     i32.const 1
     i32.add
     local.set $pos
     br $while-continue|2
    end
   end
   local.get $h
   local.get $h
   i32.const 15
   i32.shr_u
   i32.xor
   local.set $h
   local.get $h
   i32.const -2048144777
   i32.mul
   local.set $h
   local.get $h
   local.get $h
   i32.const 13
   i32.shr_u
   i32.xor
   local.set $h
   local.get $h
   i32.const -1028477379
   i32.mul
   local.set $h
   local.get $h
   local.get $h
   i32.const 16
   i32.shr_u
   i32.xor
   local.set $h
   local.get $h
   br $~lib/util/hash/hashStr|inlined.0
  end
  return
 )
 (func $"~lib/map/Map<~lib/string/String,~lib/arraybuffer/ArrayBuffer>#get:buckets" (param $this i32) (result i32)
  local.get $this
  i32.load
 )
 (func $"~lib/map/Map<~lib/string/String,~lib/arraybuffer/ArrayBuffer>#get:bucketsMask" (param $this i32) (result i32)
  local.get $this
  i32.load offset=4
 )
 (func $~lib/util/string/compareImpl (param $str1 i32) (param $index1 i32) (param $str2 i32) (param $index2 i32) (param $len i32) (result i32)
  (local $ptr1 i32)
  (local $ptr2 i32)
  (local $7 i32)
  (local $a i32)
  (local $b i32)
  local.get $str1
  local.get $index1
  i32.const 1
  i32.shl
  i32.add
  local.set $ptr1
  local.get $str2
  local.get $index2
  i32.const 1
  i32.shl
  i32.add
  local.set $ptr2
  i32.const 0
  i32.const 2
  i32.lt_s
  drop
  local.get $len
  i32.const 4
  i32.ge_u
  if (result i32)
   local.get $ptr1
   i32.const 7
   i32.and
   local.get $ptr2
   i32.const 7
   i32.and
   i32.or
   i32.eqz
  else
   i32.const 0
  end
  if
   block $do-break|0
    loop $do-loop|0
     local.get $ptr1
     i64.load
     local.get $ptr2
     i64.load
     i64.ne
     if
      br $do-break|0
     end
     local.get $ptr1
     i32.const 8
     i32.add
     local.set $ptr1
     local.get $ptr2
     i32.const 8
     i32.add
     local.set $ptr2
     local.get $len
     i32.const 4
     i32.sub
     local.set $len
     local.get $len
     i32.const 4
     i32.ge_u
     br_if $do-loop|0
    end
   end
  end
  loop $while-continue|1
   local.get $len
   local.tee $7
   i32.const 1
   i32.sub
   local.set $len
   local.get $7
   if
    local.get $ptr1
    i32.load16_u
    local.set $a
    local.get $ptr2
    i32.load16_u
    local.set $b
    local.get $a
    local.get $b
    i32.ne
    if
     local.get $a
     local.get $b
     i32.sub
     return
    end
    local.get $ptr1
    i32.const 2
    i32.add
    local.set $ptr1
    local.get $ptr2
    i32.const 2
    i32.add
    local.set $ptr2
    br $while-continue|1
   end
  end
  i32.const 0
  return
 )
 (func $~lib/string/String.__eq (param $left i32) (param $right i32) (result i32)
  (local $leftLength i32)
  local.get $left
  local.get $right
  i32.eq
  if
   i32.const 1
   return
  end
  local.get $left
  i32.const 0
  i32.eq
  if (result i32)
   i32.const 1
  else
   local.get $right
   i32.const 0
   i32.eq
  end
  if
   i32.const 0
   return
  end
  local.get $left
  call $~lib/string/String#get:length
  local.set $leftLength
  local.get $leftLength
  local.get $right
  call $~lib/string/String#get:length
  i32.ne
  if
   i32.const 0
   return
  end
  local.get $left
  i32.const 0
  local.get $right
  i32.const 0
  local.get $leftLength
  call $~lib/util/string/compareImpl
  i32.eqz
  return
 )
 (func $"~lib/map/Map<~lib/string/String,~lib/arraybuffer/ArrayBuffer>#find" (param $this i32) (param $key i32) (param $hashCode i32) (result i32)
  (local $entry i32)
  (local $taggedNext i32)
  local.get $this
  call $"~lib/map/Map<~lib/string/String,~lib/arraybuffer/ArrayBuffer>#get:buckets"
  local.get $hashCode
  local.get $this
  call $"~lib/map/Map<~lib/string/String,~lib/arraybuffer/ArrayBuffer>#get:bucketsMask"
  i32.and
  i32.const 4
  i32.mul
  i32.add
  i32.load
  local.set $entry
  loop $while-continue|0
   local.get $entry
   if
    local.get $entry
    call $"~lib/map/MapEntry<~lib/string/String,~lib/arraybuffer/ArrayBuffer>#get:taggedNext"
    local.set $taggedNext
    local.get $taggedNext
    i32.const 1
    i32.and
    i32.eqz
    if (result i32)
     local.get $entry
     call $"~lib/map/MapEntry<~lib/string/String,~lib/arraybuffer/ArrayBuffer>#get:key"
     local.get $key
     call $~lib/string/String.__eq
    else
     i32.const 0
    end
    if
     local.get $entry
     return
    end
    local.get $taggedNext
    i32.const 1
    i32.const -1
    i32.xor
    i32.and
    local.set $entry
    br $while-continue|0
   end
  end
  i32.const 0
  return
 )
 (func $"~lib/map/MapEntry<~lib/string/String,~lib/arraybuffer/ArrayBuffer>#get:value" (param $this i32) (result i32)
  local.get $this
  i32.load offset=4
 )
 (func $"~lib/map/Map<~lib/string/String,~lib/arraybuffer/ArrayBuffer>#get" (param $this i32) (param $key i32) (result i32)
  (local $entry i32)
  local.get $this
  local.get $key
  local.get $key
  call $~lib/util/hash/HASH<~lib/string/String>
  call $"~lib/map/Map<~lib/string/String,~lib/arraybuffer/ArrayBuffer>#find"
  local.set $entry
  local.get $entry
  i32.eqz
  if
   i32.const 6304
   i32.const 6368
   i32.const 105
   i32.const 17
   call $~lib/builtins/abort
   unreachable
  end
  local.get $entry
  call $"~lib/map/MapEntry<~lib/string/String,~lib/arraybuffer/ArrayBuffer>#get:value"
  return
 )
 (func $~lib/array/Array<u8>#set:buffer (param $this i32) (param $buffer i32)
  local.get $this
  local.get $buffer
  i32.store
  local.get $this
  local.get $buffer
  i32.const 0
  call $~lib/rt/stub/__link
 )
 (func $~lib/array/Array<u8>#set:dataStart (param $this i32) (param $dataStart i32)
  local.get $this
  local.get $dataStart
  i32.store offset=4
 )
 (func $~lib/array/Array<u8>#set:byteLength (param $this i32) (param $byteLength i32)
  local.get $this
  local.get $byteLength
  i32.store offset=8
 )
 (func $~lib/array/Array<u8>#set:length_ (param $this i32) (param $length_ i32)
  local.get $this
  local.get $length_
  i32.store offset=12
 )
 (func $~lib/array/Array<u8>#constructor (param $this i32) (param $length i32) (result i32)
  (local $2 i32)
  (local $3 i32)
  (local $bufferSize i32)
  (local $buffer i32)
  local.get $this
  i32.eqz
  if
   i32.const 16
   i32.const 13
   call $~lib/rt/stub/__new
   local.set $this
  end
  local.get $this
  i32.const 0
  call $~lib/array/Array<u8>#set:buffer
  local.get $this
  i32.const 0
  call $~lib/array/Array<u8>#set:dataStart
  local.get $this
  i32.const 0
  call $~lib/array/Array<u8>#set:byteLength
  local.get $this
  i32.const 0
  call $~lib/array/Array<u8>#set:length_
  local.get $length
  i32.const 1073741820
  i32.const 0
  i32.shr_u
  i32.gt_u
  if
   i32.const 1584
   i32.const 4272
   i32.const 70
   i32.const 60
   call $~lib/builtins/abort
   unreachable
  end
  local.get $length
  local.tee $2
  i32.const 8
  local.tee $3
  local.get $2
  local.get $3
  i32.gt_u
  select
  i32.const 0
  i32.shl
  local.set $bufferSize
  local.get $bufferSize
  i32.const 1
  call $~lib/rt/stub/__new
  local.set $buffer
  i32.const 0
  global.get $~lib/shared/runtime/Runtime.Incremental
  i32.ne
  drop
  local.get $buffer
  i32.const 0
  local.get $bufferSize
  memory.fill
  local.get $this
  local.get $buffer
  call $~lib/array/Array<u8>#set:buffer
  local.get $this
  local.get $buffer
  call $~lib/array/Array<u8>#set:dataStart
  local.get $this
  local.get $bufferSize
  call $~lib/array/Array<u8>#set:byteLength
  local.get $this
  local.get $length
  call $~lib/array/Array<u8>#set:length_
  local.get $this
 )
 (func $~lib/metashrew-as/assembly/indexer/index/arrayBufferToArray (param $data i32) (result i32)
  (local $result i32)
  i32.const 0
  local.get $data
  call $~lib/arraybuffer/ArrayBuffer#get:byteLength
  call $~lib/array/Array<u8>#constructor
  local.set $result
  local.get $result
  local.get $data
  i32.store
  local.get $result
  i32.const 4
  i32.add
  local.get $data
  i32.store
  local.get $result
  return
 )
 (func $~lib/array/Array<~lib/array/Array<u8>>#get:length_ (param $this i32) (result i32)
  local.get $this
  i32.load offset=12
 )
 (func $~lib/array/Array<~lib/array/Array<u8>>#get:dataStart (param $this i32) (result i32)
  local.get $this
  i32.load offset=4
 )
 (func $~lib/array/Array<~lib/array/Array<u8>>#push (param $this i32) (param $value i32) (result i32)
  (local $oldLen i32)
  (local $len i32)
  local.get $this
  call $~lib/array/Array<~lib/array/Array<u8>>#get:length_
  local.set $oldLen
  local.get $oldLen
  i32.const 1
  i32.add
  local.set $len
  local.get $this
  local.get $len
  i32.const 2
  i32.const 1
  call $~lib/array/ensureCapacity
  i32.const 1
  drop
  local.get $this
  call $~lib/array/Array<~lib/array/Array<u8>>#get:dataStart
  local.get $oldLen
  i32.const 2
  i32.shl
  i32.add
  local.get $value
  i32.store
  local.get $this
  local.get $value
  i32.const 1
  call $~lib/rt/stub/__link
  local.get $this
  local.get $len
  call $~lib/array/Array<~lib/array/Array<u8>>#set:length_
  local.get $len
  return
 )
 (func $~lib/metashrew-as/assembly/indexer/index/_flush~anonymous|0 (param $r i32) (param $v i32) (param $i i32) (param $ary i32) (result i32)
  local.get $r
  global.get $~lib/metashrew-as/assembly/indexer/index/_updateKeys
  local.get $v
  call $"~lib/map/Map<~lib/string/String,~lib/arraybuffer/ArrayBuffer>#get"
  call $~lib/metashrew-as/assembly/indexer/index/arrayBufferToArray
  call $~lib/array/Array<~lib/array/Array<u8>>#push
  drop
  local.get $r
  global.get $~lib/metashrew-as/assembly/indexer/index/_updates
  local.get $v
  call $"~lib/map/Map<~lib/string/String,~lib/arraybuffer/ArrayBuffer>#get"
  call $~lib/metashrew-as/assembly/indexer/index/arrayBufferToArray
  call $~lib/array/Array<~lib/array/Array<u8>>#push
  drop
  local.get $r
  return
 )
 (func $~lib/array/Array<~lib/string/String>#reduce<~lib/array/Array<~lib/array/Array<u8>>> (param $this i32) (param $fn i32) (param $initialValue i32) (result i32)
  (local $acc i32)
  (local $i i32)
  (local $len i32)
  (local $6 i32)
  (local $7 i32)
  local.get $initialValue
  local.set $acc
  i32.const 0
  local.set $i
  local.get $this
  call $~lib/array/Array<~lib/string/String>#get:length_
  local.set $len
  loop $for-loop|0
   local.get $i
   local.get $len
   local.tee $6
   local.get $this
   call $~lib/array/Array<~lib/string/String>#get:length_
   local.tee $7
   local.get $6
   local.get $7
   i32.lt_s
   select
   i32.lt_s
   if
    local.get $acc
    local.get $this
    call $~lib/array/Array<~lib/string/String>#get:dataStart
    local.get $i
    i32.const 2
    i32.shl
    i32.add
    i32.load
    local.get $i
    local.get $this
    i32.const 4
    global.set $~argumentsLength
    local.get $fn
    i32.load
    call_indirect (type $12)
    local.set $acc
    local.get $i
    i32.const 1
    i32.add
    local.set $i
    br $for-loop|0
   end
  end
  local.get $acc
  return
 )
 (func $~lib/metashrew-as/assembly/proto/metashrew/metashrew.KeyValueFlush#set:list (param $this i32) (param $list i32)
  local.get $this
  local.get $list
  i32.store
  local.get $this
  local.get $list
  i32.const 0
  call $~lib/rt/stub/__link
 )
 (func $~lib/metashrew-as/assembly/proto/metashrew/metashrew.KeyValueFlush#constructor (param $this i32) (result i32)
  local.get $this
  i32.eqz
  if
   i32.const 4
   i32.const 37
   call $~lib/rt/stub/__new
   local.set $this
  end
  local.get $this
  call $~lib/object/Object#constructor
  local.set $this
  local.get $this
  i32.const 0
  i32.const 0
  call $~lib/array/Array<~lib/array/Array<u8>>#constructor
  call $~lib/metashrew-as/assembly/proto/metashrew/metashrew.KeyValueFlush#set:list
  local.get $this
 )
 (func $"~lib/map/Map<~lib/string/String,~lib/arraybuffer/ArrayBuffer>#clear" (param $this i32)
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
  block $"~lib/map/ENTRY_SIZE<~lib/string/String,~lib/arraybuffer/ArrayBuffer>|inlined.2" (result i32)
   i32.const 12
   br $"~lib/map/ENTRY_SIZE<~lib/string/String,~lib/arraybuffer/ArrayBuffer>|inlined.2"
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
 )
 (func $~lib/metashrew-as/assembly/proto/metashrew/__proto.Encoder#get:buf (param $this i32) (result i32)
  local.get $this
  i32.load
 )
 (func $~lib/metashrew-as/assembly/proto/metashrew/metashrew.KeyValueFlush#get:list (param $this i32) (result i32)
  local.get $this
  i32.load
 )
 (func $~lib/array/Array<~lib/array/Array<u8>>#get:length (param $this i32) (result i32)
  local.get $this
  call $~lib/array/Array<~lib/array/Array<u8>>#get:length_
  return
 )
 (func $~lib/array/Array<u8>#get:length_ (param $this i32) (result i32)
  local.get $this
  i32.load offset=12
 )
 (func $~lib/array/Array<u8>#get:dataStart (param $this i32) (result i32)
  local.get $this
  i32.load offset=4
 )
 (func $~lib/array/Array<u8>#push (param $this i32) (param $value i32) (result i32)
  (local $oldLen i32)
  (local $len i32)
  local.get $this
  call $~lib/array/Array<u8>#get:length_
  local.set $oldLen
  local.get $oldLen
  i32.const 1
  i32.add
  local.set $len
  local.get $this
  local.get $len
  i32.const 0
  i32.const 1
  call $~lib/array/ensureCapacity
  i32.const 0
  drop
  local.get $this
  call $~lib/array/Array<u8>#get:dataStart
  local.get $oldLen
  i32.const 0
  i32.shl
  i32.add
  local.get $value
  i32.store8
  local.get $this
  local.get $len
  call $~lib/array/Array<u8>#set:length_
  local.get $len
  return
 )
 (func $~lib/metashrew-as/assembly/proto/metashrew/__proto.Encoder#varint64 (param $this i32) (param $value i64)
  (local $v i64)
  local.get $value
  local.set $v
  loop $while-continue|0
   local.get $v
   i64.const 127
   i64.gt_u
   if
    local.get $this
    call $~lib/metashrew-as/assembly/proto/metashrew/__proto.Encoder#get:buf
    local.get $v
    i64.const 127
    i64.and
    i64.const 128
    i64.or
    i32.wrap_i64
    call $~lib/array/Array<u8>#push
    drop
    local.get $v
    i64.const 7
    i64.shr_u
    local.set $v
    br $while-continue|0
   end
  end
  local.get $this
  call $~lib/metashrew-as/assembly/proto/metashrew/__proto.Encoder#get:buf
  local.get $v
  i32.wrap_i64
  call $~lib/array/Array<u8>#push
  drop
 )
 (func $~lib/array/Array<~lib/array/Array<u8>>#__get (param $this i32) (param $index i32) (result i32)
  (local $value i32)
  local.get $index
  local.get $this
  call $~lib/array/Array<~lib/array/Array<u8>>#get:length_
  i32.ge_u
  if
   i32.const 2320
   i32.const 4272
   i32.const 114
   i32.const 42
   call $~lib/builtins/abort
   unreachable
  end
  local.get $this
  call $~lib/array/Array<~lib/array/Array<u8>>#get:dataStart
  local.get $index
  i32.const 2
  i32.shl
  i32.add
  i32.load
  local.set $value
  i32.const 1
  drop
  i32.const 0
  i32.eqz
  drop
  local.get $value
  i32.eqz
  if
   i32.const 4320
   i32.const 4272
   i32.const 118
   i32.const 40
   call $~lib/builtins/abort
   unreachable
  end
  local.get $value
  return
 )
 (func $~lib/array/Array<u8>#get:length (param $this i32) (result i32)
  local.get $this
  call $~lib/array/Array<u8>#get:length_
  return
 )
 (func $~lib/array/Array<u8>#__get (param $this i32) (param $index i32) (result i32)
  (local $value i32)
  local.get $index
  local.get $this
  call $~lib/array/Array<u8>#get:length_
  i32.ge_u
  if
   i32.const 2320
   i32.const 4272
   i32.const 114
   i32.const 42
   call $~lib/builtins/abort
   unreachable
  end
  local.get $this
  call $~lib/array/Array<u8>#get:dataStart
  local.get $index
  i32.const 0
  i32.shl
  i32.add
  i32.load8_u
  local.set $value
  i32.const 0
  drop
  local.get $value
  return
 )
 (func $~lib/metashrew-as/assembly/proto/metashrew/metashrew.KeyValueFlush#encodeU8Array (param $this i32) (param $encoder i32) (result i32)
  (local $buf i32)
  (local $n i32)
  (local $this|4 i32)
  (local $value i32)
  (local $this|6 i32)
  (local $value|7 i32)
  (local $this|8 i32)
  (local $value|9 i32)
  (local $i i32)
  local.get $encoder
  call $~lib/metashrew-as/assembly/proto/metashrew/__proto.Encoder#get:buf
  local.set $buf
  local.get $this
  call $~lib/metashrew-as/assembly/proto/metashrew/metashrew.KeyValueFlush#get:list
  call $~lib/array/Array<~lib/array/Array<u8>>#get:length
  i32.const 0
  i32.gt_s
  if
   i32.const 0
   local.set $n
   loop $for-loop|0
    local.get $n
    local.get $this
    call $~lib/metashrew-as/assembly/proto/metashrew/metashrew.KeyValueFlush#get:list
    call $~lib/array/Array<~lib/array/Array<u8>>#get:length
    i32.lt_s
    if
     local.get $encoder
     local.set $this|4
     i32.const 10
     local.set $value
     local.get $this|4
     local.get $value
     i64.extend_i32_u
     call $~lib/metashrew-as/assembly/proto/metashrew/__proto.Encoder#varint64
     local.get $encoder
     local.set $this|6
     local.get $this
     call $~lib/metashrew-as/assembly/proto/metashrew/metashrew.KeyValueFlush#get:list
     local.get $n
     call $~lib/array/Array<~lib/array/Array<u8>>#__get
     call $~lib/array/Array<u8>#get:length
     local.set $value|7
     local.get $this|6
     local.get $value|7
     i64.extend_i32_u
     call $~lib/metashrew-as/assembly/proto/metashrew/__proto.Encoder#varint64
     local.get $encoder
     local.set $this|8
     local.get $this
     call $~lib/metashrew-as/assembly/proto/metashrew/metashrew.KeyValueFlush#get:list
     local.get $n
     call $~lib/array/Array<~lib/array/Array<u8>>#__get
     local.set $value|9
     i32.const 0
     local.set $i
     loop $for-loop|1
      local.get $i
      local.get $value|9
      call $~lib/array/Array<u8>#get:length
      i32.lt_s
      if
       local.get $this|8
       call $~lib/metashrew-as/assembly/proto/metashrew/__proto.Encoder#get:buf
       local.get $value|9
       local.get $i
       call $~lib/array/Array<u8>#__get
       call $~lib/array/Array<u8>#push
       drop
       local.get $i
       i32.const 1
       i32.add
       local.set $i
       br $for-loop|1
      end
     end
     local.get $n
     i32.const 1
     i32.add
     local.set $n
     br $for-loop|0
    end
   end
  end
  local.get $buf
  return
 )
 (func $~lib/metashrew-as/assembly/proto/metashrew/__proto.Encoder#set:buf (param $this i32) (param $buf i32)
  local.get $this
  local.get $buf
  i32.store
  local.get $this
  local.get $buf
  i32.const 0
  call $~lib/rt/stub/__link
 )
 (func $~lib/metashrew-as/assembly/proto/metashrew/__proto.Encoder#constructor (param $this i32) (param $buf i32) (result i32)
  local.get $this
  i32.eqz
  if
   i32.const 4
   i32.const 38
   call $~lib/rt/stub/__new
   local.set $this
  end
  local.get $this
  i32.const 0
  call $~lib/metashrew-as/assembly/proto/metashrew/__proto.Encoder#set:buf
  local.get $this
  local.get $buf
  call $~lib/metashrew-as/assembly/proto/metashrew/__proto.Encoder#set:buf
  local.get $this
 )
 (func $~lib/metashrew-as/assembly/proto/metashrew/metashrew.KeyValueFlush#encodeU8Array@varargs (param $this i32) (param $encoder i32) (result i32)
  block $1of1
   block $0of1
    block $outOfRange
     global.get $~argumentsLength
     br_table $0of1 $1of1 $outOfRange
    end
    unreachable
   end
   i32.const 0
   i32.const 0
   i32.const 0
   call $~lib/array/Array<u8>#constructor
   call $~lib/metashrew-as/assembly/proto/metashrew/__proto.Encoder#constructor
   local.set $encoder
  end
  local.get $this
  local.get $encoder
  call $~lib/metashrew-as/assembly/proto/metashrew/metashrew.KeyValueFlush#encodeU8Array
 )
 (func $~lib/staticarray/StaticArray.fromArray<u8> (param $source i32) (result i32)
  (local $length i32)
  (local $outSize i32)
  (local $out i32)
  local.get $source
  call $~lib/array/Array<u8>#get:length
  local.set $length
  local.get $length
  i32.const 0
  i32.shl
  local.set $outSize
  local.get $outSize
  i32.const 4
  call $~lib/rt/stub/__new
  local.set $out
  i32.const 0
  drop
  local.get $out
  local.get $source
  call $~lib/array/Array<u8>#get:dataStart
  local.get $outSize
  memory.copy
  local.get $out
  return
 )
 (func $~lib/metashrew-as/assembly/proto/metashrew/metashrew.KeyValueFlush#encode (param $this i32) (result i32)
  local.get $this
  i32.const 0
  global.set $~argumentsLength
  i32.const 0
  call $~lib/metashrew-as/assembly/proto/metashrew/metashrew.KeyValueFlush#encodeU8Array@varargs
  call $~lib/staticarray/StaticArray.fromArray<u8>
  return
 )
 (func $~lib/metashrew-as/assembly/indexer/index/_flush
  (local $hashKeys i32)
  (local $protobufInput i32)
  (local $message i32)
  global.get $~lib/metashrew-as/assembly/indexer/index/_updateKeys
  call $"~lib/map/Map<~lib/string/String,~lib/arraybuffer/ArrayBuffer>#keys"
  local.set $hashKeys
  i32.const 0
  i32.const 0
  call $~lib/array/Array<~lib/array/Array<u8>>#constructor
  local.set $protobufInput
  local.get $hashKeys
  i32.const 6416
  local.get $protobufInput
  call $~lib/array/Array<~lib/string/String>#reduce<~lib/array/Array<~lib/array/Array<u8>>>
  drop
  i32.const 0
  call $~lib/metashrew-as/assembly/proto/metashrew/metashrew.KeyValueFlush#constructor
  local.set $message
  local.get $message
  local.get $protobufInput
  call $~lib/metashrew-as/assembly/proto/metashrew/metashrew.KeyValueFlush#set:list
  global.get $~lib/metashrew-as/assembly/indexer/index/_updateKeys
  call $"~lib/map/Map<~lib/string/String,~lib/arraybuffer/ArrayBuffer>#clear"
  local.get $message
  call $~lib/metashrew-as/assembly/proto/metashrew/metashrew.KeyValueFlush#encode
  call $~lib/metashrew-as/assembly/indexer/index/__flush
 )
 (func $assembly/indexer/index/_start
  (local $data i32)
  (local $box i32)
  (local $height i32)
  (local $block i32)
  call $~lib/metashrew-as/assembly/indexer/index/input
  local.set $data
  local.get $data
  call $~lib/metashrew-as/assembly/utils/box/Box.from
  local.set $box
  local.get $box
  call $~lib/metashrew-as/assembly/utils/utils/parsePrimitive<u32>
  local.set $height
  i32.const 0
  local.get $box
  call $~lib/metashrew-as/assembly/blockdata/block/Block#constructor
  local.set $block
  global.get $~lib/metashrew-as/assembly/utils/logging/console
  i32.const 4448
  local.get $height
  i32.const 10
  call $~lib/number/U32#toString
  call $~lib/string/String.__concat
  call $~lib/metashrew-as/assembly/utils/logging/Console#log
  call $~lib/metashrew-as/assembly/indexer/index/_flush
 )
 (func $~start
  call $start:assembly/indexer/index
 )
)
