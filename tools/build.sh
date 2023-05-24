#!/bin/bash
#
# Use ADB to install openssh tools on a connected Android device.

set -e

SCRIPT_DIR=`cd $(dirname $0);pwd -P`

if [ "$ANDROID_NDK_ROOT" == "" ]; then
    echo "Expected ANDROID_NDK_ROOT to be defined."
    exit 1
fi

cd $SCRIPT_DIR/../jni

$ANDROID_NDK_ROOT/ndk-build -j8

cd $SCRIPT_DIR/..

OUT=obj/local/armeabi-v7a

pushd $OUT
mv ssh_exe ssh
OUT_FILES=`ls | grep -v objs`

#split
for file in $OUT_FILES; do
	$ANDROID_NDK_ROOT/toolchains/llvm/prebuilt/linux-x86_64/bin/llvm-strip $file;
done

tar zcf $SCRIPT_DIR/../ssh_armeabi-v7a.tgz $OUT_FILES
popd
