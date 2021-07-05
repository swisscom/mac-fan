#!/bin/bash

SMC="/Applications/smcFanControl.app/Contents/Resources/smc"

function get_bytes(){
  $SMC -r -k "$1" | grep -E -o 'bytes [0-9a-f ]+' | cut -d ' ' -f 2- | sed -E 's/ //g'
}

function hex_to_f32(){
  python3 -c "import struct; print(int(struct.unpack('f', bytes.fromhex('$1'))[0]))"
}

function f32_to_hex(){
  python3 -c "import struct; print(struct.pack('f', $1).hex())"
}
