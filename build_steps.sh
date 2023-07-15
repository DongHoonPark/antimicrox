# Build step of antimicro in ubuntu 18.04 bionic aarch64(64bit arm)
# https://github.com/AntiMicroX/antimicrox/blob/master/BUILDING.md

# setup dependencies
sudo apt install g++ cmake extra-cmake-modules qttools5-dev qttools5-dev-tools libsdl2-dev libxi-dev libxtst-dev libx11-dev itstool gettext ninja-build

# upgrade cmake version to 3.25
sudo apt remove --purge --auto-remove cmake
wget -O - https://apt.kitware.com/keys/kitware-archive-latest.asc 2>/dev/null | gpg --dearmor - | sudo tee /etc/apt/trusted.gpg.d/kitware.gpg >/dev/null
sudo apt-add-repository 'deb https://apt.kitware.com/ubuntu/ bionic main'
sudo apt update 
sudo apt install cmake

# prepare source
git clone https://github.com/AntiMicroX/antimicrox
cd antimicrox
mkdir build && cd build
cmake .. -DCPACK_GENERATOR="DEB"
cmake --build . --target package

