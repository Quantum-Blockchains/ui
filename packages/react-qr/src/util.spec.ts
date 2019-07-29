// Copyright 2017-2019 @polkadot/react-qr authors & contributors
// This software may be modified and distributed under the terms
// of the Apache-2.0 license. See the LICENSE file for details.

import { u8aToHex, u8aToString } from '@polkadot/util';

import { createAddressPayload, createSignPayload, createFrames, encodeNumber, encodeString } from './util';

describe('util', (): void => {
  describe('encodeNumber', (): void => {
    it('encodes 1 correctly', (): void => {
      expect(
        encodeNumber(1)
      ).toEqual(new Uint8Array([0, 1]));
    });

    it('encodes 257 correctly', (): void => {
      expect(
        encodeNumber(257)
      ).toEqual(new Uint8Array([1, 1]));
    });
  });
  describe('createAddressPayload', (): void => {
    it('encodes an address properly', (): void => {
      expect(
        u8aToString(
          createAddressPayload('5GKhfyctwmW5LQdGaHTyU9qq2yDtggdJo719bj5ZUxnVGtmX')
        )
      ).toEqual('substrate:5GKhfyctwmW5LQdGaHTyU9qq2yDtggdJo719bj5ZUxnVGtmX');
    });
  });

  describe('createSignPayload', (): void => {
    it('encodes a payload properly', (): void => {
      expect(
        u8aToHex(
          createSignPayload('5HbgaJEuVN5qGbkhgtuDQANivSWwHXWsC2erP1SQUXgciTVq', 'THIS IS SPARTA!')
        )
      ).toEqual(
        '0x' + // prefix
        '53' + // substrate
        '01' + // sr25519
        '00' + // sign tx
        'f4cd755672a8f9542ca9da4fbf2182e79135d94304002e6a09ffc96fef6e6c4c' + // publickey
        '544849532049532053504152544121' // THIS IS SPARTA!
      );
    });
  });

  describe('createFrames', (): void => {
    it('encodes frames properly', (): void => {
      expect(
        createFrames(
          createSignPayload('5HbgaJEuVN5qGbkhgtuDQANivSWwHXWsC2erP1SQUXgciTVq', '0x12345678')
        ).map((str): string => u8aToHex(encodeString(str)))
      ).toEqual([
        '0x' +
        '00' + // multipart
        '0001' + // length
        '0000' + // index
        '530100' + // payload info, substrate + sr25519 + signtx
        'f4cd755672a8f9542ca9da4fbf2182e79135d94304002e6a09ffc96fef6e6c4c' + // publicKey
        '12345678' // data
      ]);
    });
  });
});