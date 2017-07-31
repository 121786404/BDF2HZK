@ECHO OFF

del /q/f *.mz *.bin
python BDF2HZK.py -s "8x8" -o bin/HZ12.bin bdf/SimSun-12.bdf
python BDF2HZK.py -s "13x13" -o bin/HZ13.bin bdf/SimSun-13.bdf
python BDF2HZK.py -s "14x14" -o bin/HZ14.bin bdf/SimSun-14.bdf
python BDF2HZK.py -s "15x15" -o bin/HZ15.bin bdf/SimSun-15.bdf
python BDF2HZK.py -s "16x16" -o bin/HZ16.bin bdf/SimSun-16.bdf
python BDF2HZK.py -s "17x17" -o bin/HZ17.bin bdf/SimSun-17.bdf
python BDF2HZK.py -s "18x18" -o bin/HZ18.bin bdf/SimSun-18.bdf