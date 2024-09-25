## Installation

Add the following to `~/.zshrc` or whatever:
```bash
export MOBILE_DIR=/sgoinfre/goinfre/Perso/$USER/mobile
export ANDROID_HOME=$MOBILE_DIR/Android/Sdk
export ANDROID_SDK_ROOT=$ANDROID_HOME
export GRADLE_USER_HOME=$MOBILE_DIR/.gradle
export ANDROID_BUILD_CACHE_DIR=$MOBILE_DIR/.android_cache
export JAVA_HOME=$MOBILE_DIR/jdk
export ANDROID_USER_HOME=$MOBILE_DIR/.android
# export ANDROID_EMULATOR_HOME=$MOBILE_DIR/emulators
# export ANDROID_AVD_HOME=$MOBILE_DIR/emulators

export PATH=$MOBILE_DIR/flutter/bin:$PATH
export PATH=$JAVA_HOME/bin:$PATH
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/cmdline-tools/latest/bin
export PATH=$PATH:$ANDROID_HOME/platform-tools
```

Restart the terminal or run `source ~/.zshrc`.

```bash
wget https://github.com/adoptium/temurin21-binaries/releases/download/jdk-21.0.4%2B7/OpenJDK21U-jdk_x64_linux_hotspot_21.0.4_7.tar.gz
tar xvf OpenJDK21U-jdk_x64_linux_hotspot_21.0.4_7.tar.gz
mv jdk-21.0.4+7 jdk
```

```bash
mkdir -p /sgoinfre/goinfre/Perso/$USER/mobile/Android/Sdk
cd /sgoinfre/goinfre/Perso/$USER/mobile
wget https://redirector.gvt1.com/edgedl/android/studio/ide-zips/2024.1.2.13/android-studio-2024.1.2.13-linux.tar.gz
tar xvf android-studio-2024.1.2.13-linux.tar.gz
./android-studio/bin/studio.sh
```

Wizard: Custom -> Android SDK location: `/sgoinfre/goinfre/Perso/$USER/mobile/Android/Sdk`
Open Android Studio and accept creating a desktop icon. (not important)

Open Android Studio: Settings -> Languages & Frameworks -> Android SDK.
Make sure the following are installed:
- Android SDK Platform, API 35.0.1
- Android SDK Command-line Tools
- Android SDK Build-Tools
- Android SDK Platform-Tools
- Android Emulator

```bash
wget https://storage.googleapis.com/flutter_infra_release/releases/stable/linux/flutter_linux_3.24.3-stable.tar.xz
tar xvf flutter_linux_3.24.3-stable.tar.xz
```

```bash
flutter config --android-sdk $ANDROID_HOME
flutter doctor --android-licenses
flutter doctor # should be entirely green
```

Install Flutter extension on VSCode.