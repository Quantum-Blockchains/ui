#!/usr/bin/env bash

mkdir tmp && cd tmp
git clone https://github.com/Quantum-Blockchains/common.git
cd common
git checkout kostia/v12.4.2
yarn install
yarn build

rm -r ../../node_modules/@polkadot/wasm-bridge
rm -r ../../node_modules/@polkadot/wasm-crypto
rm -r ../../node_modules/@polkadot/wasm-crypto-asmjs
rm -r ../../node_modules/@polkadot/wasm-crypto-init
rm -r ../../node_modules/@polkadot/wasm-crypto-wasm
rm -r ../../node_modules/@polkadot/wasm-util
rm -r ../../node_modules/@polkadot/keyring
rm -r ../../node_modules/@polkadot/networks
rm -r ../../node_modules/@polkadot/util
rm -r ../../node_modules/@polkadot/util-crypto
rm -r ../../node_modules/@polkadot/x-bigint
rm -r ../../node_modules/@polkadot/x-bundle
rm -r ../../node_modules/@polkadot/x-global
rm -r ../../node_modules/@polkadot/x-randomvalues
rm -r ../../node_modules/@polkadot/x-textdecoder
rm -r ../../node_modules/@polkadot/x-textencoder

cp -r node_modules/@polkadot/wasm-bridge ../../node_modules/@polkadot/wasm-bridge
cp -r node_modules/@polkadot/wasm-crypto ../../node_modules/@polkadot/wasm-crypto
cp -r node_modules/@polkadot/wasm-crypto-asmjs ../../node_modules/@polkadot/wasm-crypto-asmjs
cp -r node_modules/@polkadot/wasm-crypto-init ../../node_modules/@polkadot/wasm-crypto-init
cp -r node_modules/@polkadot/wasm-crypto-wasm ../../node_modules/@polkadot/wasm-crypto-wasm
cp -r node_modules/@polkadot/wasm-util ../../node_modules/@polkadot/wasm-util
cp -r packages/keyring/build ../../node_modules/@polkadot/keyring
cp -r packages/networks/build ../../node_modules/@polkadot/networks
cp -r packages/util/build ../../node_modules/@polkadot/util
cp -r packages/util-crypto/build ../../node_modules/@polkadot/util-crypto
cp -r packages/x-bigint/build ../../node_modules/@polkadot/x-bigint
cp -r packages/x-bundle/build ../../node_modules/@polkadot/x-bundle
cp -r packages/x-global/build ../../node_modules/@polkadot/x-global
cp -r packages/x-randomvalues/build ../../node_modules/@polkadot/x-randomvalues
cp -r packages/x-textdecoder/build ../../node_modules/@polkadot/x-textdecoder
cp -r packages/x-textencoder/build ../../node_modules/@polkadot/x-textencoder

cd ../../
rm -r -f tmp

yarn build:ui