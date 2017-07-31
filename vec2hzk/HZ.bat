@ECHO OFF

rem pyinstaller -F HZK.py
del /q/f *.mz *.bin
dist\HZK.exe -s "8x8" -o HZ8.bin "simkai.ttf"
miniz.exe c HZ8.bin HZ8.mz
dist\HZK.exe -s "12x12" -o HZ12.bin "simkai.ttf"
miniz.exe c HZ12.bin HZ12.mz
dist\HZK.exe -s "16x16" -o HZ16.bin "simkai.ttf"
miniz.exe c HZ16.bin HZ16.mz
dist\HZK.exe -s "24x24" -o HZ24.bin "simkai.ttf"
miniz.exe c HZ24.bin HZ24.mz
dist\HZK.exe -s "32x32" -o HZ32.bin "simkai.ttf"
miniz.exe c HZ32.bin HZ32.mz
dist\HZK.exe -s "48x48" -o HZ48.bin "simkai.ttf"
miniz.exe c HZ48.bin HZ48.mz
dist\HZK.exe -s "64x64" -o HZ64.bin "simkai.ttf"
miniz.exe c HZ64.bin HZ64.mz