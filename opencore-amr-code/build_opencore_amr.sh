NDK_HOME=/home/gibbs/work/android-ndk-r15c
SYSROOT=$NDK_HOME/platforms/android-26/arch-arm
ANDROID_BIN=$NDK_HOME/toolchains/arm-linux-androideabi-4.9/prebuilt/linux-x86_64/bin/
CROSS_COMPILE=${ANDROID_BIN}/arm-linux-androideabi-
ARM_INC=$SYSROOT/usr/include
ARM_LIB=$SYSROOT/usr/lib
#用前确认路径
LDFLAGS=" -nostdlib -Bdynamic -Wl,--whole-archive -Wl,--no-undefined -Wl,-z,noexecstack  -Wl,-z,nocopyreloc -Wl,-soname,/system/lib/libz.so -Wl,-rpath-link=$ARM_LIB,-dynamic-linker=/system/bin/linker -L$NDK_HOME/sources/cxx-stl/gnu-libstdc++/4.9/libs/armeabi -L$NDK_HOME/toolchains/arm-linux-androideabi-4.9/prebuilt/linux-x86_64/arm-linux-androideabi/lib -L$ARM_LIB  -lc -lgcc -lm -ldl  "  
  
FLAGS="--host=arm-androideabi-linux --enable-static --disable-shared"

export CXX="${CROSS_COMPILE}g++ --sysroot=${SYSROOT}"

export LDFLAGS="$LDFLAGS"

export CC="${CROSS_COMPILE}gcc --sysroot=${SYSROOT}"

./configure $FLAGS \
--prefix=/home/gibbs/work/fflib
