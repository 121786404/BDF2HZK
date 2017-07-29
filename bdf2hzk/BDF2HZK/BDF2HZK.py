#!/usr/bin/env python
# -*- coding: utf-8 -*-

from PIL import Image, ImageDraw, ImageFont
import bitarray
from bitarray import bitarray
import getopt
import sys
import os
import re
import MyBdfFontFile

def get_pix(image):
    pixel = image.load()
    width, height = image.size
    bitmap = bitarray()
    for h in range(height):
        for w in range(width):
            if pixel[w, h] > 0:
                bitmap.append(False)
            else:
                bitmap.append(True)
    return bitmap


def main():
    help = 'Usage: %s [option] <truetype-file>' % sys.argv[0]
    help += '''\noption:
    -h | --help                                 display this information
    -s | --size geometry                        width and height of font
    -o | --output output-dot-matrix-font        specify output file
example:
    gendotmatrix.py -o ubuntu-c.font "/usr/share/fonts/truetype/ubuntu-font-family/Ubuntu-C.ttf"
    '''
    short_opts = 'hi:s:o:'
    opts = ['help', 'size=', 'output=']
    try:
        opts, args = getopt.getopt(sys.argv[1:], short_opts, opts)
    except getopt.GetoptError as err:
        print(err)
        print(help)
        sys.exit(1)

    font_width = 16
    font_height = 16
    outfilename = 'dot_matrix.font'
    for opt, arg in opts:
        if opt in ('-h', '--help'):
            print(help)
            sys.exit()
        elif opt in ('-s', '--size'):
            fontsize = re.split(r'\D', arg)
            font_width = int(fontsize[0])
            font_height = int(fontsize[1])
        elif opt in ('-o', '--output'):
            outfilename = arg
        else:
            print(help)
            sys.exit(1)

    if len(args) > 0:
        bdfilename = args[0]
    else:
        bdfilename = ''
    if not bdfilename:
        print(help)
        sys.exit(1)

    bdf_file = open(bdfilename, "rb")
    bdf_font = MyBdfFontFile.MyBdfFontFile(bdf_file)
    bmp_file_mame = os.path.splitext(bdfilename)[0] + ".bmp";
    bmp_image = Image.open(bmp_file_mame)

    with open(outfilename, 'wb') as outfile:
        for i in range(0xA1, 0xF8):
            for j in range(0xA1, 0xFF):
                i = 0xA5
                j - 0xA2
                gb2312_code = chr(i) + chr(j)
                try:
                    unicode_code = gb2312_code.decode('gb2312')
                except: 
                    pass
 
                bfd_glyph = bdf_font[ord(unicode_code)]
                if bfd_glyph is None:
                    pass
                else:
                    bmp_pos = bfd_glyph[0];
                    # 为什么bmp里面的字宽度是17？
                    left  = (bmp_pos%(bmp_image.width/font_width))*(font_width + 1) + 2
                    upper = (bmp_pos/(bmp_image.width/font_width))*(font_height + 2) + 2
                    right = left + font_width - 1
                    lower = upper + font_height
                    box = (left,upper,right,lower)
                    region = bmp_image.crop(box)
                    #region.show()
                    get_pix(region).tofile(outfile)


if __name__ == '__main__':
    main()
