#! /bin/bash

DEBIAN_FRONTEND=noninteractive

# Clone Upstream
git clone https://github.com/xhess/apt-btrfs-snapper
cp -rvf ./debian ./apt-btrfs-snapper/
cd ./apt-btrfs-snapper/
chmod +x apt-btrfs-snapper
chmod +x 80snapper


# Get build deps
apt-get build-dep ./ -y

# Build package
dpkg-buildpackage --no-sign

# Move the debs to output
cd ../
mkdir -p ./output
mv ./*.deb ./output/
