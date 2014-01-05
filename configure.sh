#!/bin/bash
#CURL_EXTRA="--disable-file --disable-ldap --disable-ldaps --disable-rtsp --disable-proxy --disable-dict --disable-telnet --disable-tftp --disable-pop3 --disable-imap --disable-smtp --disable-gopher --disable-sspi"i
DEVICE="mako"
A="/path/to/android/source/root" && \
LIBGCCA="$A/prebuilts/gcc/linux-x86/arm/arm-eabi-4.7/lib/gcc/arm-eabi/4.7/libgcc.a" && \
PATH="$A/prebuilts/gcc/linux-x86/arm/arm-eabi-4.7/bin:$PATH" && \
./configure --host=arm-linux CC=arm-eabi-gcc \
CPPFLAGS="-DANDROID -I$A/bionic/libc/arch-arm/include -I$A/bionic/libc/include -I$A/bionic/libc/kernel/common -I$A/bionic/libc/kernel/arch-arm -I$A/external/zlib " \
CFLAGS="-fno-exceptions -Wno-multichar -mthumb-interwork -mthumb -nostdlib " \
LIBS="-lc -ldl -lz $LIBGCCA " \
LDFLAGS="-L$A/out/target/product/$DEVICE/system/lib " \
--enable-ipv6 --disable-manual --with-random=/dev/urandom \
--with-ssl=$A/external/openssl --without-ca-bundle --without-ca-path \
--with-zlib $CURL_EXTRA
