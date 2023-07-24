#!/bin/bash

set -eE 
trap 'echo Error: in $0 on line $LINENO' ERR

if [ "$(id -u)" -ne 0 ]; then 
    echo "Please run as root"
    exit 1
fi

cd "$(dirname -- "$(readlink -f -- "$0")")" && cd ..
mkdir -p build && cd build

# if [ ! -d linux-rockchip ]; then
#     git clone --single-branch --progress -b linux-5.10-gen-rkr4 https://github.com/OpenHD/linux-rockchip.git linux-rockchip
# fi

# cd linux-rockchip

# # Compile kernel into a deb package
# dpkg-buildpackage -a "$(cat debian/arch)" -d -b -nc -uc

#fake it till you make it

wget https://github.com/OpenHD/RK_Kernel/releases/download/testing/linux-headers-5.10.160-rockchip_5.10.160-8_arm64.deb
wget https://github.com/OpenHD/RK_Kernel/releases/download/testing/linux-image-5.10.160-rockchip_5.10.160-8_arm64.deb
#doesn't make sense but he downloads them twice ?!
rm -Rf *.deb.1
rm -f ../*.buildinfo ../*.changes
