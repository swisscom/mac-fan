#!/bin/bash
set -e
. utils.sh

if [ $# -ne 1 ]; then
  echo "Usage: $0 auto|min|normal|high|max"
fi

MODE="$1"
SMC="/Applications/smcFanControl.app/Contents/Resources/smc"


function fan_speed(){
  TARGET_FAN="$1"
  SPEED="$2"

  "$SMC" -k "F${TARGET_FAN}Md" -w 01
  "$SMC" -k "F${TARGET_FAN}Tg" -w "$(f32_to_hex "$SPEED")"
}


case "$MODE" in
  auto)
    echo "Auto speed"
    "$SMC" -k "F0Md" -w 00
    "$SMC" -k "F1Md" -w 00
    ;;

  min)
    echo "MIN speed"
    fan_speed 0 1000 
    fan_speed 1 1000 
    ;;
  normal)
    echo "NORMAL speed"
    fan_speed 0 3000
    fan_speed 1 3000 
    ;;

  high)
    echo "High speed"
    fan_speed 0 5000
    fan_speed 1 5000
    ;;

  max)
    echo "MAX speed"
    fan_speed 0 7500
    fan_speed 1 7500
    ;;

  *)
    echo "Invalid speed"
    ;;
esac
