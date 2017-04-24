TexView 2 for ArmA2 OA
=========
Copyright (c) 2011 Bohemia Interactive a.s. All rights reserved.

For more information about the tool visit http://community.bistudio.com/wiki/TexView_2

TextView 2 is a texture viewer and conversion tool supporting internal texture formats of Bohemia Interactive's game engines.

TexView 2 is provided free of charge for any non-commercial use without any support from Bohemia Interactive. Use it at your own risk. Refer to the end user license agreement as displayed during the setup process of this application for more details.

Supported formats
=================

Input:
JPG
TGA (24 bit / 32 bit with alpha channel )
PNG (with or without alpha channel)
PAA
PAC

Important note: All input textures must have resolution 2^x / 2^y (e.g. 16 / 16, 32 / 32, 64 / 64, 256 /256). The largest texture size commonly supported by graphics cards and BI's game engines is 2048x2048, in future graphics textures 4096x4096 or even larger could be possible and it is already supported in TexView 2.

Output:
PAA/PAC (file format is used depending on file name as defined in TexConvert.cfg file that is installed to TexView 2 main application directory)
TGA (32 bit with alpha channel)
PNG (with alpha channel)



How to use it
=============
You can open any supported image using menu File / Open or drag and drop the image file icon into the main window of Texview (tip: you may assign PAA file extensions to TexView 2application using Windows desktop).

You can save the file into the format you need. The output file format (PAC, PAA or TGA) will be choosen depending on the extension you write in "Save As..." dialog to the filename line. Bit depth and optional alpha channel will be selected automaticaly depending on the file name in texture format as defined in TexConvert.cfg file, default standard for current Bohemia Interactive's products is:

    * _CO - color (difuse map)
    * _CA - color alpha (difuse map with alpha)
    * _NO - normal map
    * _NS - normal map specular (with alpha)
    * _NOF - normal map faded (mipmaps fade the texture in distance, usefull for terrain)
    * _NOHQ - normal map high quality
    * _NOVHQ - normal map high quality
    * _DT - detail texture, average color should be 0.5, texture has got fad out filter in mipmaps
    * _CDT - colored detail texture, average color should be 0.5 in all R G B channels, texture has got fad out filter in mipmaps
    * _SKY - sky texture
    * _MC - macro texture
    * _AS - ambient shadow texture
    * _SM - specular map HQ normálové mapy (HQ Normal Maps)
    * _SMDI - optimised specular mapa for better bitdepth HQ_normálové_mapy_
    * _LCO - land color map, texture used for satelite and mask textures on the terrain
    * _MCO - multiply color map, texture used to multiply with color map (as cdt) without fade out filter, average color should be 0.5 in all R G B channels

The texture name should be simple ascii, containing only letters, digits and underscore (no letters with diacritics). Only one dot is allowed leading the extension.

Example of texture name: M151A1_fuelTank01_CO.tga

The source texture file format is PNG (preferred) or TGA (no compression, only 24b or 32b).

Please be aware that bit depth of the exported texture may be lower than bit depth of your source image and compression causing some visual artifacts can be applied. During the export all mipmap levels of the texture will be created automatically. Alternatively, you can also move the texture by holding the middle mouse button.


Available functions
===================

-File
--Open [Ctrl + O] : open an image file
--Save [Ctrl + S] : saves the file in the support file format (paa is default for any unsupported extension)
--Refresh [F5] : Reloads the file
--Save as... : export the image file to desired format (default is paa but you can manually change the extension to tga or png)
--Source control : allows to bind data to a scc compliant source control system
--Generate : allows simple procedural texture generation based on formulas, example of a circle texture:
a=abs(u)<sqrt(1-v*v);
r=a;
g=a;
b=a
--Next File (Page Down) / Previous File (Page UP) : browses the current directory for other bitmaps

-Edit--Filter : Filter process executed for each pixel of the texture. You can load some of pre-made useful filters stored in Filters subfolder of main Tex View 2 working directory.

-MipMap
--Prev [up] : display previous mipmap level
--Next [down] : display next mipmap level
--Preview mipmaps : generate mipmaps
--Preview mipmap - specific types: preview various specific supported mipmap types

-View
--Status Bar: display resolution of the currently displayed mipmap and maximum resolution of the texture and status of Tex View 2
--Info bar: display max, avg and under cursor color in RGBA
--View bar: Allos you to select, preview and compare various types of textures (note that texture type to be stored is determined by filename only and this is only for preview purposes)
--Zoom In [+] / Zoom Out [-]: Zoom the texture in and out (you can also use mouse wheel to zoom in and out)
--RGB (0..1): Show RGB values on scale from 0 to 1 and not from 0 to 255

Mouse controls: hold right mouse button and drag the texture by mouse if it can't fit on screen, use mouse wheel to zoom in and out.


Command Line Conversion
=======================

For commandline and batch conversions use Pal2PacE.exe.

Arguments used:
Usage:  pal2pace [saveoptions] <source> [<destination>]
or       pal2pac -combine [saveoptions] [options] <source1> <source2> <source3>
<source4> <destination>

SaveOptions:
        -size=<n>

Options:
        -xborder=<bordersize> (0<bordersize<0.5, default 0.125)
        -yborder=<bordersize>
        -mask=<maskname>
        -water=<watername>

example how to generate new paa files from TGA sources:
Pal2PacE x:\Test\*.tga