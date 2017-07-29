from __future__ import print_function
from PIL import Image

# --------------------------------------------------------------------
# parse X Bitmap Distribution Format (BDF)
# --------------------------------------------------------------------

bdf_slant = {
    "R": "Roman",
    "I": "Italic",
    "O": "Oblique",
    "RI": "Reverse Italic",
    "RO": "Reverse Oblique",
    "OT": "Other"
}

bdf_spacing = {
    "P": "Proportional",
    "M": "Monospaced",
    "C": "Cell"
}

dx = 0
dy = 0

def my_bdf_char(f):
    global dx
    global dy

    # skip to STARTCHAR
    while True:
        s = f.readline()
        if not s:
            return None
        if s[:9] == b"STARTCHAR":
            break
    id = s[9:].strip().decode('ascii')

    # load symbol properties
    props = {}
    while True:
        s = f.readline()
        if not s or s[:6] == b"BITMAP":
            break
        i = s.find(b" ")
        props[s[:i].decode('ascii')] = s[i+1:-1].decode('ascii')

    # load bitmap
    bitmap = []
    while True:
        s = f.readline()
        if not s or s[:7] == b"ENDCHAR":
            break
        bitmap.append(s[:-1])
    bitmap = b"".join(bitmap)
    
    if "BBX" in props:
        [x, y, l, d] = [int(p) for p in props["BBX"].split()]

    if "DWIDTH" in props:
        [dx, dy] = [int(p) for p in props["DWIDTH"].split()]
    
    bbox = (dx, dy), (l, -d-y, x+l, -d), (0, 0, x, y)

    try:
        im = Image.frombytes("1", (x, y), bitmap, "hex", "1")
        #im = Image.frombytes("1", (x, y), bitmap)
    except ValueError:
        # deal with zero-width characters
        im = Image.new("1", (x, y))

    return id, int(props["ENCODING"]), bbox, im


##
# Font file plugin for the X11 BDF format.

class MyBdfFontFile(object):

    def __init__(self, fp):


        self.glyph = [None] * 65536

        s = fp.readline()
        if s[:9] != b"STARTFONT":
            raise SyntaxError("not a valid BDF file")

        props = {}
        comments = []
        global dx
        global dy
        while True:
            s = fp.readline()
            if not s or s[:13] == b"ENDPROPERTIES":
                break
            i = s.find(b" ")
            props[s[:i].decode('ascii')] = s[i+1:-1].decode('ascii')
  
        if "DWIDTH" in props:
            [dx, dy] = [int(p) for p in props["DWIDTH"].split()]

        # font = props["FONT"].split("-")

        # font[4] = bdf_slant[font[4].upper()]
        # font[11] = bdf_spacing[font[11].upper()]

        # ascent = int(props["FONT_ASCENT"])
        # descent = int(props["FONT_DESCENT"])

        # fontname = ";".join(font[1:])

        # print("#", fontname)
        # for i in comments:
        #       print("#", i)
        num = 0
        while True:
            c = my_bdf_char(fp)
            if not c:
                break

            id, ch, (xy, dst, src), im = c
            if 0 <= ch < len(self.glyph):
                self.glyph[ch] = num, xy, dst, src, im
                num = num +1
    
    def __getitem__(self, ix):
        return self.glyph[ix]

