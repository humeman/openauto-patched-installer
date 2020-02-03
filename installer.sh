#!/bin/bash

# https://github.com/humeman/openauto_patched_installer
# Tested with Raspbian Buster (2019-09-26 or later), but other versions may work.

# Check for error function
error () {
    if [ $? != 0 ]
    then
        log "\e[0m\e[1m\e[31mERROR: \e[0m\e[31m$1\e[0m\e[37m"
        log "\e[0m\e[31mIf necessary, report this under the Issues tab on the installer github at https://github.com/humeman/openauto-patched-installer."
        exit 1
    fi
}

# Logging function
log() {
    echo -e "\e[1m\e[33m[OAInstaller] \e[97m$1\e[0m\e[37m"
}

# Update apt
log "Updating APT"
sudo apt update
error "Couldn't update apt!"

# Install all 44dependencies
log "Installing dependencies"
sudo apt-get install -y libboost-all-dev libusb-1.0.0-dev libssl-dev cmake libprotobuf-dev protobuf-c-compiler protobuf-compiler libqt5multimedia5 libqt5multimedia5-plugins libqt5multimediawidgets5 qtmultimedia5-dev libqt5bluetooth5 libqt5bluetooth5-bin qtconnectivity5-dev pulseaudio librtaudio-dev libraspberrypi-doc libraspberrypi-dev
error "Couldn't install all dependencies! Is Raspbian up to date?"

# Clone AASDK
log "Cloning AASDK"
cd ~
git clone -b development https://github.com/abraha2d/aasdk aasdk
error "Couldn't clone AASDK!"

# Build AASDK
log "Building AASDK"
cd ~
mkdir aasdk_build
cd aasdk_build
cmake -DCMAKE_BUILD_TYPE=Release ~/aasdk
error "Couldn't run CMake on AASDK!"
make -j2
error "Couldn't build AASDK!"

# Build ilclient
log "Building ilclient"
cd /opt/vc/src/hello_pi/libs/ilclient
make -j2
error "Couldn't build ilclient!"

# Clone OpenAuto
log "Cloning OpenAuto"
cd ~
git clone -b development https://github.com/humeman/openauto openauto
error "Couldn't clone OpenAuto!"

# Build OpenAuto
log "Building OpenAuto"
cd ~
mkdir openauto_build
cd openauto_build
cmake -DCMAKE_BUILD_TYPE=Release -DRPI3_BUILD=TRUE -DAASDK_INCLUDE_DIRS="/home/$USER/aasdk/include" -DAASDK_LIBRARIES="/home/$USER/aasdk/lib/libaasdk.so" -DAASDK_PROTO_INCLUDE_DIRS="/home/$USER/aasdk_build" -DAASDK_PROTO_LIBRARIES="/home/$USER/aasdk/lib/libaasdk_proto.so" .~/openauto
error "Couldn't run CMake on OpenAuto!"
make -j2
error "Couldn't build OpenAuto!"

# Finish up
log "Done!"
log "To start OpenAuto in the future, run \e[1msudo ~/openauto/bin/autoapp"
log "Starting for first time..."
sudo ~/openauto/bin/autoapp