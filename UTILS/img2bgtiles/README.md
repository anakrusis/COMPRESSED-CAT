## img2bgtiles
This script converts any image file (except gifs, i donno why) into two files: a .chr file containing binary pixel data, and an .asm file acting as a tilemap. It requires [love2d 11.3](https://github.com/love2d/love/releases) to run. Just drag and drop your image on the black screen and these steps will occur:

1. The image is quantised into four colors from dark to light. No special palette is needed. Images with more than four colors will be assigned their colors based on quartiles. Images with less than four colors behave strangely (sorry).

2. The image is broken up into 8x8 tiles. Images with dimensions not evenly divisible by 8 are fine; it will not be cropped but rather have blank strips on the edge. Redundant tiles are automatically consolidated!

3. The tileset and tilemap are exported. As of now they will always have the names "test.chr" and "test.asm". 

## Usage
"test.chr" can be INCBIN'd into your assembly file, and the contents of "test.asm" can simply be pasted into the assembly file directly. For example of usage to copy the data to VRAM, read from the "begin" label in folders 003 and 004.
