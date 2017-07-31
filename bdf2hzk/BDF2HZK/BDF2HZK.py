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
                bitmap.append(True)
            else:
                bitmap.append(False)
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
    fbbx = bdf_font.fbbx
    hz_width  = (font_width + 7)/8*8;
    hz_height = font_height

    with open(outfilename, 'wb') as outfile:
        for qu in range(1, 88):
            for wei in range(1, 95):
                #qu = 1
                #wei = 2
                gb2312_code = chr(qu + 160 ) + chr(wei + 160 )
                try:
                    unicode_code = gb2312_code.decode('gb2312')
                except: 
                    hz_image = Image.new("1", (hz_width, hz_height), 0)
                    get_pix(hz_image).tofile(outfile)
                    continue
 
                bfd_glyph = bdf_font[ord(unicode_code)]
                if bfd_glyph is None:
                    hz_image = Image.new("1", (hz_width, hz_height), 0)
                    get_pix(hz_image).tofile(outfile)
                    continue
                else:
                    bbx = bfd_glyph['bbx']
                    im  = bfd_glyph['im']
                    #im.show()
                    
                    #       fbbx  bbx
                    # w     FBBx  BBw
                    # h     FBBy  BBh
                    # offx  Xoff  BBxoff0x
                    # offy  Yoff  BByoff0y
            
                    # offleft = (-1)*font.offx + glyph.offx;
                    # offbottom = (-1)*font.offy + glyph.offy;
                    # offtop = font.h - glyph.h - offbottom;

                    offleft   = bbx['BBxoff0x'] - fbbx['Xoff'];
                    offbottom = bbx['BByoff0y'] - fbbx['Yoff'];
                    offtop    = fbbx['FBBy'] - bbx['BBh'] - offbottom;

                    bbx_im = Image.new("1", (fbbx['FBBx'], fbbx['FBBy']), 0)
                    bbx_im.paste(im,(offleft,offtop))
                    #bbx_im.show()

                    hz_image = Image.new("1", (hz_width, hz_height), 0)
                    hz_image.paste(bbx_im,(0,0))
                    #hz_image.show()

                    get_pix(hz_image).tofile(outfile)

if __name__ == '__main__':
    main()
