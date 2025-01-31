#!/usr/bin/env bash
set -eu +f

[[ -f 'updlist/updlist.vcproj' ]] && cd updlist

declare _SUFFIX="-win32"
for _PREFIX in 'x86_64-w64-mingw32-' 'i686-w64-mingw32-'; do
	#[[ "${_PREFIX}" == 'x86_64-w64-mingw32-' ]] && continue  # Skip x86_64 build
	#[[ "${_PREFIX}" == 'i686-w64-mingw32-' ]] && continue  # Skip x86 build
	"${_PREFIX}g++${_SUFFIX}" -dumpspecs | sed -e 's/-lmsvcrt/-lmsvcr120/g' > "${_PREFIX}g++${_SUFFIX}.specs"
	[[ "${_PREFIX}" == 'x86_64-w64-mingw32-' ]] && _OUTPUT="updlist_x86_64${_SUFFIX}.exe" || _OUTPUT="updlist_x86${_SUFFIX}.exe"
	"${_PREFIX}windres" updlist.rc --output-format=coff -o "${_PREFIX}updlist${_SUFFIX}.res"
	"${_PREFIX}g++${_SUFFIX}" -specs="${_PREFIX}g++${_SUFFIX}.specs" -DUNICODE -D_UNICODE -municode --static -static-libgcc -static-libstdc++ $(grep RelativePath updlist.vcproj | grep -o '".*"' | grep -vE '(ReadMe.txt|.rc|.ico|.h)"' | sed -ze 's/".\\//g; s/\"\n/ /g') "${_PREFIX}updlist${_SUFFIX}.res" -o "${_OUTPUT}" -lversion -lshlwapi -lcrypt32 -lmsvcr120
done
#wait
