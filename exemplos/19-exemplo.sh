adb devices
adb shell getprop ro.product.cpu.abi
adb shell getconf PAGE_SIZE
adb logcat -b crash -d
adb logcat -d -s AndroidRuntime:E ReactNativeJS:E VisionCamera:E
