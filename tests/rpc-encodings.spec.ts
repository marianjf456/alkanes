import { describe, it } from 'node:test';
import {
  decodeRunesResponse,
  encodeBlockHeightInput,
  encodeProtorunesByHeightInput,
} from '../lib/outpoint';
import { decodeWalletOutput, encodeProtorunesWalletInput } from '../lib/wallet';
import { expect } from 'chai';

const addHexPrefix = (s) => (s.substr(0, 2) === '0x' ? s : '0x' + s);

describe('rpc', () => {
  it('encode block height', async () => {
    expect(encodeBlockHeightInput(849235)).to.equal('0x08d3ea33');
  });

  it('decode runes response', () => {
    // console.log(decodeRunesResponse(addHexPrefix("0x0a1c121150495454534255524748504952415445532080042a04f09fa58e0a19120e4d494e4e45534f54415457494e532080022a04f09fa58e0a1a120f434f4c4f5241444f524f434b4945532080012a04f09fa58e0a1d1212434c4556454c414e44475541524449414e532080022a04f09fa58e0a19120f53454154544c454d4152494e45525320402a04f09fa58e0a19120e43494e43494e4e415449524544532080042a04f09fa58e0a1b12104d494c5741554b4545425245574552532080022a04f09fa58e")));
    expect(
      decodeRunesResponse(
        addHexPrefix(
          '0x0a1e121651554f52554d47454e4553495350524f544f52554e4520a0202a01510a1a12125448454a414d4553444156494456414e43452084212a014a',
        ),
      ),
    ).to.deep.equal({
      runes: [
        {
          runeId: '0:0',
          name: 'QUORUMGENESISPROTORUNE',
          divisibility: 0,
          spacers: 4128,
          symbol: 'Q',
        },
        {
          runeId: '0:0',
          name: 'THEJAMESDAVIDVANCE',
          divisibility: 0,
          spacers: 4228,
          symbol: 'J',
        },
      ],
    });
  });
  it('protobyheight', async () => {
    expect(encodeProtorunesByHeightInput(849235, BigInt(1))).to.equal('0x08d3ea3312020801');
  });

  it('protobyaddress', async () => {
    expect(
      encodeProtorunesWalletInput(
        'bc1pyxevp40ffke2ylcdvjd0aylc5wlgue04sew0wshudn2mhep4x85sv47mk',
        BigInt(1),
      ),
    ).to.equal(
      '0x0a3d626331707978657670343066666b6532796c6364766a643061796c6335776c67756530347365773077736875646e326d68657034783835737634376d6b12020801',
    );
  });
});
