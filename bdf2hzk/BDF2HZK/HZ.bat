@ECHO OFF

del /q/f mz\SimSun\*.mz bin\SimSun\*.bin
del /q/f mz\Zfull-GB\*.mz bin\Zfull-GB\*.bin


python BDF2HZK.py -s "12x12" -o bin/SimSun/HZ12.bin bdf/SimSun-12.bdf
python BDF2HZK.py -s "13x13" -o bin/SimSun/HZ13.bin bdf/SimSun-13.bdf
python BDF2HZK.py -s "14x14" -o bin/SimSun/HZ14.bin bdf/SimSun-14.bdf
python BDF2HZK.py -s "15x15" -o bin/SimSun/HZ15.bin bdf/SimSun-15.bdf
python BDF2HZK.py -s "16x16" -o bin/SimSun/HZ16.bin bdf/SimSun-16.bdf
python BDF2HZK.py -s "17x17" -o bin/SimSun/HZ17.bin bdf/SimSun-17.bdf


python BDF2HZK.py -s "8x8" -o bin/Zfull-GB/HZ8.bin bdf/Zfull-GB-8.bdf
python BDF2HZK.py -s "9x9" -o bin/Zfull-GB/HZ9.bin bdf/Zfull-GB-9.bdf
python BDF2HZK.py -s "10x10" -o bin/Zfull-GB/HZ10.bin bdf/Zfull-GB-10.bdf
python BDF2HZK.py -s "11x11" -o bin/Zfull-GB/HZ11.bin bdf/Zfull-GB-11.bdf
python BDF2HZK.py -s "12x12" -o bin/Zfull-GB/HZ12.bin bdf/Zfull-GB-12.bdf
python BDF2HZK.py -s "13x13" -o bin/Zfull-GB/HZ13.bin bdf/Zfull-GB-13.bdf
python BDF2HZK.py -s "14x14" -o bin/Zfull-GB/HZ14.bin bdf/Zfull-GB-14.bdf
python BDF2HZK.py -s "15x15" -o bin/Zfull-GB/HZ15.bin bdf/Zfull-GB-15.bdf
python BDF2HZK.py -s "16x16" -o bin/Zfull-GB/HZ16.bin bdf/Zfull-GB-16.bdf
python BDF2HZK.py -s "17x17" -o bin/Zfull-GB/HZ17.bin bdf/Zfull-GB-17.bdf
python BDF2HZK.py -s "18x18" -o bin/Zfull-GB/HZ18.bin bdf/Zfull-GB-18.bdf
python BDF2HZK.py -s "19x19" -o bin/Zfull-GB/HZ19.bin bdf/Zfull-GB-19.bdf
python BDF2HZK.py -s "20x20" -o bin/Zfull-GB/HZ20.bin bdf/Zfull-GB-20.bdf
python BDF2HZK.py -s "21x21" -o bin/Zfull-GB/HZ21.bin bdf/Zfull-GB-21.bdf
python BDF2HZK.py -s "22x22" -o bin/Zfull-GB/HZ22.bin bdf/Zfull-GB-22.bdf
python BDF2HZK.py -s "23x23" -o bin/Zfull-GB/HZ23.bin bdf/Zfull-GB-23.bdf
python BDF2HZK.py -s "24x24" -o bin/Zfull-GB/HZ24.bin bdf/Zfull-GB-24.bdf



miniz.exe c bin/SimSun/HZ12.bin mz/SimSun/HZ12.mz
miniz.exe c bin/SimSun/HZ13.bin mz/SimSun/HZ13.mz
miniz.exe c bin/SimSun/HZ14.bin mz/SimSun/HZ14.mz
miniz.exe c bin/SimSun/HZ15.bin mz/SimSun/HZ15.mz
miniz.exe c bin/SimSun/HZ16.bin mz/SimSun/HZ16.mz
miniz.exe c bin/SimSun/HZ17.bin mz/SimSun/HZ17.mz
miniz.exe c bin/SimSun/HZ18.bin mz/SimSun/HZ18.mz

miniz.exe c bin/Zfull-GB/HZ8.bin mz/Zfull-GB/HZ8.mz
miniz.exe c bin/Zfull-GB/HZ9.bin mz/Zfull-GB/HZ9.mz
miniz.exe c bin/Zfull-GB/HZ10.bin mz/Zfull-GB/HZ10.mz
miniz.exe c bin/Zfull-GB/HZ11.bin mz/Zfull-GB/HZ11.mz
miniz.exe c bin/Zfull-GB/HZ12.bin mz/Zfull-GB/HZ12.mz
miniz.exe c bin/Zfull-GB/HZ13.bin mz/Zfull-GB/HZ13.mz
miniz.exe c bin/Zfull-GB/HZ14.bin mz/Zfull-GB/HZ14.mz
miniz.exe c bin/Zfull-GB/HZ15.bin mz/Zfull-GB/HZ15.mz
miniz.exe c bin/Zfull-GB/HZ16.bin mz/Zfull-GB/HZ16.mz
miniz.exe c bin/Zfull-GB/HZ17.bin mz/Zfull-GB/HZ17.mz
miniz.exe c bin/Zfull-GB/HZ18.bin mz/Zfull-GB/HZ18.mz
miniz.exe c bin/Zfull-GB/HZ19.bin mz/Zfull-GB/HZ19.mz
miniz.exe c bin/Zfull-GB/HZ20.bin mz/Zfull-GB/HZ20.mz
miniz.exe c bin/Zfull-GB/HZ21.bin mz/Zfull-GB/HZ21.mz
miniz.exe c bin/Zfull-GB/HZ22.bin mz/Zfull-GB/HZ22.mz
miniz.exe c bin/Zfull-GB/HZ23.bin mz/Zfull-GB/HZ23.mz
miniz.exe c bin/Zfull-GB/HZ24.bin mz/Zfull-GB/HZ24.mz

pause

