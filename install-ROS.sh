#!/bin/bash

sudo -v

# Setup your computer to accept software from packages.ros.org
sudo sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'

# Set up your keys
# if you get problem see : http://wiki.ros.org/kinetic/Installation/Ubuntu
sudo apt-key adv --keyserver hkp://ha.pool.sks-keyservers.net:80 --recv-key 421C365BD9FF1F717815A3895523BAEEB01FA116

# apt-get update
apt-get update

# install 
apt-get install ros-kinetic-desktop-full

# init ROS
rosdep init
rosdep update


# enviroment setup
echo "source /opt/ros/kinetic/setup.bash" >> ~/.bashrc
source ~/.bashrc

# install dependency
apt install python-rosinstall python-rosinstall-generator python-wstool build-essential