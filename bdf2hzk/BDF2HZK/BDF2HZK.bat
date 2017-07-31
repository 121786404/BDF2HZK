@ECHO OFF

del /q/f ..\..\use\mz\SimSun\*.mz ..\..\use\bin\SimSun\*.bin
del /q/f ..\..\use\mz\Zfull-GB\*.mz ..\..\use\bin\Zfull-GB\*.bin


python BDF2HZK.py -s "12x12" -o "../../use/bin/SimSun/HZ12.bin" "../../use/bdf/SimSun/SimSun-12.bdf"
python BDF2HZK.py -s "13x13" -o "../../use/bin/SimSun/HZ13.bin" "../../use/bdf/SimSun/SimSun-13.bdf"
python BDF2HZK.py -s "14x14" -o "../../use/bin/SimSun/HZ14.bin" "../../use/bdf/SimSun/SimSun-14.bdf"
python BDF2HZK.py -s "15x15" -o "../../use/bin/SimSun/HZ15.bin" "../../use/bdf/SimSun/SimSun-15.bdf"
python BDF2HZK.py -s "16x16" -o "../../use/bin/SimSun/HZ16.bin" "../../use/bdf/SimSun/SimSun-16.bdf"
python BDF2HZK.py -s "17x17" -o "../../use/bin/SimSun/HZ17.bin" "../../use/bdf/SimSun/SimSun-17.bdf"

..\..\use\tools\miniz.exe c ../../use/bin/SimSun/HZ12.bin ../../use/mz/SimSun/HZ12.mz
..\..\use\tools\miniz.exe c ../../use/bin/SimSun/HZ13.bin ../../use/mz/SimSun/HZ13.mz
..\..\use\tools\miniz.exe c ../../use/bin/SimSun/HZ14.bin ../../use/mz/SimSun/HZ14.mz
..\..\use\tools\miniz.exe c ../../use/bin/SimSun/HZ15.bin ../../use/mz/SimSun/HZ15.mz
..\..\use\tools\miniz.exe c ../../use/bin/SimSun/HZ16.bin ../../use/mz/SimSun/HZ16.mz
..\..\use\tools\miniz.exe c ../../use/bin/SimSun/HZ17.bin ../../use/mz/SimSun/HZ17.mz



python BDF2HZK.py -s "8x8" -o "../../use/bin/Zfull-GB/HZ8.bin" "../../use/bdf/Zfull-GB/Zfull-GB-8.bdf"
python BDF2HZK.py -s "9x9" -o "../../use/bin/Zfull-GB/HZ9.bin" "../../use/bdf/Zfull-GB/Zfull-GB-9.bdf"
python BDF2HZK.py -s "10x10" -o "../../use/bin/Zfull-GB/HZ10.bin" "../../use/bdf/Zfull-GB/Zfull-GB-10.bdf"
python BDF2HZK.py -s "11x11" -o "../../use/bin/Zfull-GB/HZ11.bin" "../../use/bdf/Zfull-GB/Zfull-GB-11.bdf"
python BDF2HZK.py -s "12x12" -o "../../use/bin/Zfull-GB/HZ12.bin" "../../use/bdf/Zfull-GB/Zfull-GB-12.bdf"
python BDF2HZK.py -s "13x13" -o "../../use/bin/Zfull-GB/HZ13.bin" "../../use/bdf/Zfull-GB/Zfull-GB-13.bdf"
python BDF2HZK.py -s "14x14" -o "../../use/bin/Zfull-GB/HZ14.bin" "../../use/bdf/Zfull-GB/Zfull-GB-14.bdf"
python BDF2HZK.py -s "15x15" -o "../../use/bin/Zfull-GB/HZ15.bin" "../../use/bdf/Zfull-GB/Zfull-GB-15.bdf"
python BDF2HZK.py -s "16x16" -o "../../use/bin/Zfull-GB/HZ16.bin" "../../use/bdf/Zfull-GB/Zfull-GB-16.bdf"
python BDF2HZK.py -s "17x17" -o "../../use/bin/Zfull-GB/HZ17.bin" "../../use/bdf/Zfull-GB/Zfull-GB-17.bdf"
python BDF2HZK.py -s "18x18" -o "../../use/bin/Zfull-GB/HZ18.bin" "../../use/bdf/Zfull-GB/Zfull-GB-18.bdf"
python BDF2HZK.py -s "19x19" -o "../../use/bin/Zfull-GB/HZ19.bin" "../../use/bdf/Zfull-GB/Zfull-GB-19.bdf"
python BDF2HZK.py -s "20x20" -o "../../use/bin/Zfull-GB/HZ20.bin" "../../use/bdf/Zfull-GB/Zfull-GB-20.bdf"
python BDF2HZK.py -s "21x21" -o "../../use/bin/Zfull-GB/HZ21.bin" "../../use/bdf/Zfull-GB/Zfull-GB-21.bdf"
python BDF2HZK.py -s "22x22" -o "../../use/bin/Zfull-GB/HZ22.bin" "../../use/bdf/Zfull-GB/Zfull-GB-22.bdf"
python BDF2HZK.py -s "23x23" -o "../../use/bin/Zfull-GB/HZ23.bin" "../../use/bdf/Zfull-GB/Zfull-GB-23.bdf"
python BDF2HZK.py -s "24x24" -o "../../use/bin/Zfull-GB/HZ24.bin" "../../use/bdf/Zfull-GB/Zfull-GB-24.bdf"


..\..\use\tools\miniz.exe c ../../use/bin/Zfull-GB/HZ8.bin ../../use/mz/Zfull-GB/HZ8.mz
..\..\use\tools\miniz.exe c ../../use/bin/Zfull-GB/HZ9.bin ../../use/mz/Zfull-GB/HZ9.mz
..\..\use\tools\miniz.exe c ../../use/bin/Zfull-GB/HZ10.bin ../../use/mz/Zfull-GB/HZ10.mz
..\..\use\tools\miniz.exe c ../../use/bin/Zfull-GB/HZ11.bin ../../use/mz/Zfull-GB/HZ11.mz
..\..\use\tools\miniz.exe c ../../use/bin/Zfull-GB/HZ12.bin ../../use/mz/Zfull-GB/HZ12.mz
..\..\use\tools\miniz.exe c ../../use/bin/Zfull-GB/HZ13.bin ../../use/mz/Zfull-GB/HZ13.mz
..\..\use\tools\miniz.exe c ../../use/bin/Zfull-GB/HZ14.bin ../../use/mz/Zfull-GB/HZ14.mz
..\..\use\tools\miniz.exe c ../../use/bin/Zfull-GB/HZ15.bin ../../use/mz/Zfull-GB/HZ15.mz
..\..\use\tools\miniz.exe c ../../use/bin/Zfull-GB/HZ16.bin ../../use/mz/Zfull-GB/HZ16.mz
..\..\use\tools\miniz.exe c ../../use/bin/Zfull-GB/HZ17.bin ../../use/mz/Zfull-GB/HZ17.mz
..\..\use\tools\miniz.exe c ../../use/bin/Zfull-GB/HZ18.bin ../../use/mz/Zfull-GB/HZ18.mz
..\..\use\tools\miniz.exe c ../../use/bin/Zfull-GB/HZ19.bin ../../use/mz/Zfull-GB/HZ19.mz
..\..\use\tools\miniz.exe c ../../use/bin/Zfull-GB/HZ20.bin ../../use/mz/Zfull-GB/HZ20.mz
..\..\use\tools\miniz.exe c ../../use/bin/Zfull-GB/HZ21.bin ../../use/mz/Zfull-GB/HZ21.mz
..\..\use\tools\miniz.exe c ../../use/bin/Zfull-GB/HZ22.bin ../../use/mz/Zfull-GB/HZ22.mz
..\..\use\tools\miniz.exe c ../../use/bin/Zfull-GB/HZ23.bin ../../use/mz/Zfull-GB/HZ23.mz
..\..\use\tools\miniz.exe c ../../use/bin/Zfull-GB/HZ24.bin ../../use/mz/Zfull-GB/HZ24.mz