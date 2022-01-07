## img2metasprite
This script converts any image file (except gifs, i donno why) into two files: a .chr file containing binary pixel data, and an .asm file acting as a metasprite table for sprites. It requires [love2d 11.3](https://github.com/love2d/love/releases) to run. Just drag and drop your image on the black screen and these steps will occur:

1. The image is quantised into three colors plus one transparency color. If your image already has one transparency color, it will use it. (Multiple transparent colors are not tested yet) If there is no transparency in the image, the darkest quartile of colors will become transparent, and the other three quartiles will become the opaque sprite colors.

2. The image is broken up into 8x16 tiles. Images with dimensions not evenly divisible by 8 and 16 are fine; it will not be cropped but rather have blank strips on the edge. Redundant tiles are automatically consolidated! Fully empty tiles are allowed in your image but will not be counted as part of any sprite.

3. Each metasprite is assigned a number and pointer in a metasprite table. The tileset and metasprite table are exported. As of now they will always have the names "funtus.chr" and "test.asm". 

## Usage
"funtus.chr" can be INCBIN'd into your assembly file, and the contents of "test.asm" can simply be pasted into the assembly file directly. The tiles of "funtus.chr" can be copied directly into VRAM, and the data from "test.asm" can be parsed with a routine called drawBigObject. 

Each metasprite can have a variable width and 16 pixels height. The paramaters of the drawBigObject routine: 
- bc: x and y position of top-leftmost pixel of the metasprite
- e: metasprite number

For an example of this usage, see folder 004.


 
