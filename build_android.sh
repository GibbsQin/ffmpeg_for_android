# build.sh
# 在Linux下编译FFmpeg成功的脚本
# 注意Linux和windows的换行符\r\n不太一样，要转换（dos2unix）
#!/bin/sh
make clean
export NDK=/home/gibbs/work/android-ndk-r15c
export PREBUILT=$NDK/toolchains/arm-linux-androideabi-4.9/prebuilt
export PLATFORM=$NDK/platforms/android-26/arch-arm
export PREFIX=../fflib
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
--enable-gpl --enable-shared --disable-static --enable-small \
--disable-doc --disable-ffprobe --disable-ffplay --disable-ffmpeg --disable-debug \
--extra-cflags="-fPIC -DANDROID -D__thumb__ -mthumb -Wfatal-errors -Wno-deprecated -mfloat-abi=softfp -marm -march=armv7-a" \
--enable-libx264 \
--extra-cflags=-I/home/gibbs/work/fflib/include \
--extra-ldflags=-L/home/gibbs/work/fflib/lib \
--disable-decoders --enable-decoder=h264 --enable-decoder=aac \
--disable-encoders --enable-encoder=aac --enable-encoder=libx264 \
--disable-demuxers --enable-demuxer=rtsp --enable-demuxer=rtp --enable-demuxer=flv --enable-demuxer=h264 \
--disable-muxers --enable-muxer=rtsp --enable-muxer=rtp --enable-muxer=flv --enable-muxer=h264 \
--disable-parsers --enable-parser=aac --enable-parser=h264 \
--disable-protocols --enable-protocol=rtmp --enable-protocol=rtp --enable-protocol=tcp --enable-protocol=udp \
--disable-bsfs \
--disable-indevs \
--disable-outdevs \
--disable-filters \
--disable-postproc
}
build_one
make
make install
