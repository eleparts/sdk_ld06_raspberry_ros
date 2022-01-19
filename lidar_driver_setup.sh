#!/bin/bash

# Exit on error
set -e
set -x

if grep -q Raspberry /proc/cpuinfo; then
    echo "Running on a Raspberry Pi"
else
    echo "Not running on a Raspberry Pi. Use at your own risk!"
fi

WORK_DIR=~/sdk_ld06_raspberry_ros
cd $WORK_DIR

echo "Build driver"
catkin_make

echo "Update bashrc"
if ! grep -xq "source $WORK_DIR/devel/setup.bash" ~/.bashrc; then
	echo "source $WORK_DIR/devel/setup.bash" >> ~/.bashrc
fi

echo "Update link loader"
sudo ldconfig
