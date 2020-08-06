After installing flutter you'll need to install ANDROID SDK.  
Make directory called `android`.  
[Download](https://developer.android.com/studio/#command-tools) and put them into `android/cmdline-tools/latest`  
So that `android/cmdline-tools/latest/bin` will contain `sdkmanager` and other tools.  

Now set some environment variables:
```fish
set PATH $PATH /snap/bin # if flutter was installed using snap

set ANDROID_HOME /home/orsenkucher/android
set ANDROID_SDK_ROOT /home/orsenkucher/android/cmdline-tools/latest
set PATH $PATH $ANDROID_HOME $ANDROID_SDK_ROOT $ANDROID_SDK_ROOT/bin
```

Install SDK
```fish
sdkmanager "system-images;android-27;default;x86_64"
sdkmanager "platform-tools"
sdkmanager "build-tools;28.0.3" # at least version 28 needed
sdkmanager "platforms;android-28" # at least version 28 needed
sdkmanager emulator # if you want emulator
```

Accept licenses
```fish
sdkmanager --licenses
```

Configure flutter
```fish
flutter config --android-sdk path/to/android
```

Moment of truth
```fish
flutter doctor -v
```
