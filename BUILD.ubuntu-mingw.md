# How to build
*May be incomplete*  
Tested on Ubuntu 20.04 (amd64) with MinGW

 1. Launch `bash` or a shell of your favorite
 2. Update APT repository: `sudo apt update`
 3. Install Git and build-essential: `sudo apt install git build-essential`
 4. Install MinGW: `sudo apt install mingw-w64{,-common,-{i686,x86-64}-dev,-tools} binutils-mingw-w64`
 5. Dump GCC specs: `<mingw-triplets>-gcc-<mingw-variant> -dumpspecs > specs`
    (ex. `i686-w64-mingw32-gcc-win32 -dumpspecs > specs`)
 6. Replace `-lmsvcrt` in specs with `-lmsvcr120`: `sed -i -e 's/-lmsvcrt/-lmsvcr120/g' specs`
 7. Install modified GCC specs: `sudo install specs -pm 0644 --target-directory=/usr/lib/gcc/<mingw-triplets>/<gcc-version>-<mingw-variant>`
    (ex. `sudo install specs -pm 0644 --target-directory=/usr/lib/gcc/i686-w64-mingw32/9.3-win32`)
 8. Clone this repo: `git clone https://github.com/nnn1590/WinUpdate_XP_x86.git -b mingw`
 9. `cd WinUpdate_XP_x86/updlist`
10. Edit `Makefile` or `../build.sh` as you need
11. Run `make` or `../build.sh`

5 ~ 7:
```bash
declare -r _MINGW_TRIPLETS='i686-w64-mingw32'  # 'x86_64-w64-mingw32'
declare -r _MINGW_VARIANT='win32'  # 'posix'

"${_MINGW_TRIPLETS}-gcc-${_MINGW_VARIANT}" -dumpspecs | sed -e 's/-lmsvcrt/-lmsvcr120/g' > specs
sudo install specs -pm 0644 --target-directory="/usr/lib/gcc/${_MINGW_TRIPLETS}/$("${_MINGW_TRIPLETS}-gcc-${_MINGW_VARIANT}" --version | head -n1 | awk '{print $3;}')"
rm specs
```
