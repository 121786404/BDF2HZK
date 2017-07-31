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

dwx0 = 0
dwy0 = 0

def my_bdf_char(f):
    
    global dwx0
    global dwy0

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
        [BBw, BBh, BBxoff0x, BByoff0y] = [int(p) for p in props["BBX"].split()]

    if "DWIDTH" in props:
        [dwx0, dwy0] = [int(p) for p in props["DWIDTH"].split()]
     
    bbx = (BBw, BBh, BBxoff0x, BByoff0y)
    dwidth = (dwx0, dwy0)

    try:
        im = Image.frombytes("1", (BBw, BBh), bitmap, "hex", "1")
        #im = Image.frombytes("1", (x, y), bitmap)
    except ValueError:
        # deal with zero-width characters
        im = Image.new("1", (BBw, BBh))

    return id, int(props["ENCODING"]), bbx, dwidth, im


##
# Font file plugin for the X11 BDF format.

class MyBdfFontFile(object):

    def __init__(self, fp):


        self.glyph = [None] * 65536
        #self.dwidth
        #self.fbbx

        s = fp.readline()
        if s[:9] != b"STARTFONT":
            raise SyntaxError("not a valid BDF file")

        props = {}
        comments = []
        global dwx0
        global dwy0
        while True:
            s = fp.readline()
            if not s or s[:13] == b"ENDPROPERTIES":
                break
            i = s.find(b" ")
            props[s[:i].decode('ascii')] = s[i+1:-1].decode('ascii')
  
        if "DWIDTH" in props:
            [dwx0, dwy0] = [int(p) for p in props["DWIDTH"].split()]
            #self.dwidth =  [dwx0, dwy0]

        if "FONTBOUNDINGBOX" in props:
            [FBBx, FBBy , Xoff, Yoff] = [int(p) for p in props["FONTBOUNDINGBOX"].split()]
            self.fbbx = {}
            self.fbbx['FBBx'] = FBBx
            self.fbbx['FBBy'] = FBBy
            self.fbbx['Xoff'] = Xoff
            self.fbbx['Yoff'] = Yoff


        #if "CHARS" in props:
        #    chars = [int(p) for p in props["CHARS"].split()]   

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

            id, ch, bbx, dwidth,im = c
            if 0 <= ch < len(self.glyph):
                self.glyph[ch] = {}
                self.glyph[ch]['id'] = id
                self.glyph[ch]['bbx'] = {}
                self.glyph[ch]['bbx']['BBw'] = bbx[0]
                self.glyph[ch]['bbx']['BBh'] = bbx[1]
                self.glyph[ch]['bbx']['BBxoff0x'] = bbx[2]
                self.glyph[ch]['bbx']['BByoff0y'] = bbx[3]
                self.glyph[ch]['dwidth'] = {}
                self.glyph[ch]['dwidth']['dwx0'] = dwidth[0]
                self.glyph[ch]['dwidth']['dwy0'] = dwidth[1]
                self.glyph[ch]['im'] = im
                num = num +1
    
    def __getitem__(self, ix):
        return self.glyph[ix]

