make clean
export NDK=/home/gibbs/work/android-ndk-r15c
#一定要注意设置的架构，要与后面编译ffmpeg的架构保持一致，否则ffmpeg找不到x264
export PREBUILT=$NDK/toolchains/arm-linux-androideabi-4.9/prebuilt
export PLATFORM=$NDK/platforms/android-26/arch-arm
export PREFIX=../../fflib
build_one(){
./configure --target-os=linux --prefix=$PREFIX \
--enable-cross-compile \
--enable-runtime-cpudetect \
--disable-asm \
--arch=arm \
--cc=$PREBUILT/linux-x86_64/bin/arm-linux-androideabi-gcc \
--cross-prefix=$PREBUILT/linux-x86_64/bin/arm-linux-androideabi- \
--disable-stripping \
--nm=$PREBUILT/linux-x86_64/bin/arm-linux-androideabi-nm \
--sysroot=$PLATFORM \
--enable-shared \
--enable-static \
--enable-pic \
--host=arm-linux
}
build_one
make
make install
echo Android ARM builds finished
