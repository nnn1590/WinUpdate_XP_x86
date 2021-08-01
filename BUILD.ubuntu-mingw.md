# How to build
*May be incomplete*  
Tested on Ubuntu 20.04 (amd64) with MinGW

1. Launch `bash` or a shell of your favorite
2. Update APT repository: `sudo apt update`
3. Install Git and build-essential: `sudo apt install git build-essential`
4. Install MinGW: `sudo apt install mingw-w64{,-common,-{i686,x86-64}-dev,-tools} binutils-mingw-w64`
5. Clone this repo: `git clone https://github.com/nnn1590/WinUpdate_XP_x86.git -b mingw`
6. `cd WinUpdate_XP_x86/updlist`
7. Edit `Makefile` or `../build.sh` as you need
8. Run `make` or `../build.sh`
