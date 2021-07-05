#!/bin/bash
set -e
. utils.sh

F0_TARGET_BYTES=$(get_bytes "F0Tg")
F0_MIN_BYTES=$(get_bytes "F0Mn")
F0_MAX_BYTES=$(get_bytes "F0Mx")

F1_TARGET_BYTES=$(get_bytes "F1Tg")
F1_MIN_BYTES=$(get_bytes "F1Mn")
F1_MAX_BYTES=$(get_bytes "F1Mx")

F0_TARGET=$(hex_to_f32 "$F0_TARGET_BYTES")
F0_MIN=$(hex_to_f32 "$F0_MIN_BYTES")
F0_MAX=$(hex_to_f32 "$F0_MAX_BYTES")

F1_TARGET=$(hex_to_f32 "$F1_TARGET_BYTES")
F1_MIN=$(hex_to_f32 "$F1_MIN_BYTES")
F1_MAX=$(hex_to_f32 "$F1_MAX_BYTES")

function print_fan(){
  NUMBER="$1"
  TARGET="$2"
  F_MIN="$3"
  F_MAX="$4"

  echo "F$NUMBER: $2 ($F_MIN, $F_MAX)"
}

print_fan 0 "$F0_TARGET" "$F0_MIN" "$F0_MAX"
print_fan 1 "$F1_TARGET" "$F1_MIN" "$F1_MAX"
