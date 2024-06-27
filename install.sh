#!/bin/bash

usr=$(whoami)

echo "==== MACURSUS BOOTSTRAPER ===="
echo "--> Credits: procursus (this is a procursus bootstraper)"
echo "Enter your arch: (amd64 or arm64)"
read arch
procursusurl=bootstrap-darwin-$arch.tar.zst
echo "-> installing zstd..."
brew install zstd
echo "-> downloading procursus..."
curl $procursusurl -o bootstrap.tar.zst
echo "-> extracting..."
zstd -d bootstrap.tar.zst
tar -xvf bootstrap.tar
sudo mkdir /opt
echo "-> installing..."
sudo cp -r opt /
echo "-> almost done"
sudo chown $usr /opt
sudo mkdir -p /opt/procursus/var/lib/dpkg
sudo touch /opt/procursus/var/lib/dpkg/lock-frontend
echo "----> DONE!"
echo "add /opt/procursus/bin to your path."
