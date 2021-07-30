#!/usr/bin/bash
set -eu +f

[[ -f 'updlist/updlist.vcproj' ]] && cd updlist

for _PREFIX in 'x86_64-w64-mingw32-' 'i686-w64-mingw32-'; do
	[[ "${_PREFIX}" == 'x86_64-w64-mingw32-' ]] && _OUTPUT='updlist_x86_64.exe' || _OUTPUT='updlist_x86.exe'
	"${_PREFIX}windres" updlist.rc --output-format=coff -o "${_PREFIX}updlist.res"
	"${_PREFIX}g++" -DUNICODE -D_UNICODE -mwindows -mwin32 -municode $(grep RelativePath updlist.vcproj | grep -o '".*"' | grep -vE '(ReadMe.txt|.rc|.ico)"' | sed -ze 's/".\\//g; s/\"\n/ /g') "${_PREFIX}updlist.res" -o "${_OUTPUT}" -l version -l shlwapi -l crypt32 -static-libstdc++ # &
done
#wait
