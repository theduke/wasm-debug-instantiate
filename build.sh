#! /bin/bash

set -eux pipefail

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null && pwd )"
cd $DIR


mkdir -p build

echo "Building..."
cargo build  --target wasm32-unknown-unknown
echo "Generating wasm and js files with wasm-bindgen..."
wasm-bindgen target/wasm32-unknown-unknown/debug/wasm_crash.wasm --out-dir build --no-modules --no-modules-global wasm_crash

