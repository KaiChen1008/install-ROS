#!/bin/bash

KEYGEN=$1

help () {
	printf "Usage: $0 ROS-Keygen\n"
	printf "You can get the keygen from ROS webpage\n\n"
	exit 1
}

if [[ -z "${KEYGEN}" ]]; then
	printf "Please enter the ROS keygen\n\n"
	help
fi

printf "Start intalling ROS-melodic"

sudo -v
# Setup your computer to accept software from packages.ros.org
sudo sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'

# Set up your keys
# if you get problem see : http://wiki.ros.org/kinetic/Installation/Ubuntu
sudo apt-key adv --keyserver hkp://ha.pool.sks-keyservers.net:80 --recv-key ${KEYGEN}

# apt-get update
sudo apt-get update -y

sudo -v

# install 
sudo apt-get install -y ros-melodic-desktop-full
sudo apt-get install -y doxygen \
						pip \
						pip3

# install catkin_pkg
pip install catkin_pkg
pip3 install catkin_pkg


# init ROS
sudo rosdep init
rosdep update


# enviroment setup
echo "source /opt/ros/kinetic/setup.bash" >> ~/.bashrc
. ~/.bashrc

# install dependency
sudo apt install -y python-rosinstall python-rosinstall-generator python-wstool build-essential
