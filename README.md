# mac-fan

A small collection of utilities to control your Macbook fan speed.

## Rationale

My Macbook Pro 16-inch, 2019 (MacBookPro16,1) gets super hot 90% of the time due to the bad design of the airflow
on this HW. To solve the problem, Apple seems to be throttling the CPU rather than spinning up the fans.  
  
To not throttle the CPU and use the Macbook Pro without lags, the scripts in this project will help you set the fan
speed of your Macbook manually.

## Requirements

- [smcFanControl](https://github.com/hholtmann/smcFanControl) (`brew install --cask smcfancontrol`)

## Examples

### MacBookPro16,1

### Check the current fan speed

```
./mbp16-2019/get.sh
```

returns:

```
F0: 5000 (1836, 5297)
F1: 5000 (1700, 4905)
```

### Set fan speed

#### Specific RPM

```
./mbp16-2019/set.sh custom 5000
```

#### Return to auto

```
./mbp16-2019/set.sh auto
```

#### Max (WARNING!)

Setting your fans to `max` will set them to a faster speed than the SW limit thanks to an integer overflow bug (?).
This might void your warranty, but might also be the only way to quickly cool down your MacBook / generate a loud fan
noise.

```
./mbp16-2019/set.sh max
```


