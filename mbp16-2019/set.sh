#!/bin/bash

if [ $# -ne 1 ]; then
  echo "Usage: $0 auto|min|normal|max"
fi

MODE="$1"
SMC="/Applications/smcFanControl.app/Contents/Resources/smc"


function to_smc_hex(){
  VAL="$1"

  python3 -c "print('%08x' % (($VAL << 2) + 1))"
}

function fan_speed(){
  TARGET_FAN="$1"
  SPEED="$2"

  "$SMC" -k "F${TARGET_FAN}Tg" -w "$(to_smc_hex "$SPEED")"
}

"$SMC" -k "F0Md" -w 01
"$SMC" -k "F1Md" -w 01

case "$MODE" in
  auto)
    echo "Auto speed"
    "$SMC" -k "F0Md" -w 00
    "$SMC" -k "F1Md" -w 00
    ;;

  min)
    echo "MIN speed"
    fan_speed 0 2111825
    fan_speed 1 2111825
    ;;
  normal)
    echo "NORMAL speed"
    fan_speed 0 2238801
    fan_speed 1 2238801
    ;;

  max)
    echo "MAX speed"
    fan_speed 0 1587801
    fan_speed 1 1587801
    ;;

  *)
    echo "Invalid speed"
    ;;
esac
