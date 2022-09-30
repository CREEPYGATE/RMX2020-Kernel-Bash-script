#!/bin/bash

clear

echo   '_________  __  ______  ______   _______ '
echo  '/ ___/ __ \/  |/  / _ \/  _/ /  / __/ _ \'
echo '/ /__/ /_/ / /|_/ / ___// // /__/ _// , _/'
echo  '\___/\____/_/  /_/_/  /___/____/___/_/|_|' 
echo 'DEBIAN BASED RMX2020 ANDROID KERNEL COMPILER (BASH)'
echo ''
echo 'example /home/user/Desktop/Toolchains/aarch64/bin'
read -p 'TOOLCHAINS aarch64:' arm64
clear
echo 'ARM64 TC DIR:'$arm64
echo   '_________  __  ______  ______   _______ '
echo  '/ ___/ __ \/  |/  / _ \/  _/ /  / __/ _ \'
echo '/ /__/ /_/ / /|_/ / ___// // /__/ _// , _/'
echo  '\___/\____/_/  /_/_/  /___/____/___/_/|_|' 
echo 'DEBIAN BASED RMX2020 ANDROID KERNEL COMPILER (BASH)'
echo ''
echo 'example /home/user/Desktop/Toolchains/arm/bin'
read -p 'TOOLCHAINS arm:' arm32
clear
echo 'ARM64 TC DIR:'$arm64
echo 'ARM32 TC DIR:'$arm32
echo   '_________  __  ______  ______   _______ '
echo  '/ ___/ __ \/  |/  / _ \/  _/ /  / __/ _ \'
echo '/ /__/ /_/ / /|_/ / ___// // /__/ _// , _/'
echo  '\___/\____/_/  /_/_/  /___/____/___/_/|_|' 
echo 'DEBIAN BASED RMX2020 ANDROID KERNEL COMPILER (BASH)'
echo ''
echo 'example /home/user/Desktop/proton-clang/bin'
read -p 'TOOLCHAINS proton-clang:' clang
clear
echo   '_________  __  ______  ______   _______ '
echo  '/ ___/ __ \/  |/  / _ \/  _/ /  / __/ _ \'
echo '/ /__/ /_/ / /|_/ / ___// // /__/ _// , _/'
echo  '\___/\____/_/  /_/_/  /___/____/___/_/|_|' 
echo 
echo 'ARM64 TC DIR:'$arm64
echo 'ARM32 TC DIR:'$arm32
echo 'clang DIR:'$clang
read -p 'YOU SURE? WANT TO PROCEED TO FINAL STEP?'
clear
echo ok
sleep 1
clear
read -p 'RMX2020 KERNEL DIRECTORY:' directory
clear
cd $directory
echo 'KERNEL VERSION SETUP [HOSTNAME AND USER]'
read -p 'KERNEL HOSTNAME:' HOSTNAME
read -p 'USER:' user
clear
echo proceeding...
sleep 3 
cd $directory


config=RMX2020_defconfig
export PATH="$arm64:$arm32:$clang:$PATH"
export ARCH=arm64
export CROSS_COMPILE=aarch64-linux-android-
export CROSS_COMPILE_ARM32=arm-linux-androideabi-
export CLANG_TRIPLE=aarch64-linux-gnu-
export KBUILD_BUILD_HOST=$HOSTNAME
export KBUILD_BUILD_USER="$user"
sleep 2
echo $PATH
echo $directory
rm -rf output
read -p 'BUILD SECTION-PRESS ANY KEY TO CONTINUE-'
make -j2 CC=clang O=output $config
read -p 'CONFIGURE KERNEL?'
make -j2 CC=clang O=output menuconfig
read -p 'BUILD NOW?'
make -j2 CC=clang O=output 
