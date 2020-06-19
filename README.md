# YM2149F/AY-3-8190 Sound card for the RC2014 computer

![Picture of the board](./R5-board-pic.jpg?raw=true)

Video demonstration: https://www.youtube.com/watch?v=-iLwi9FagFE

## The board
This is a YM2149F/AY-3-8910 sound card for the RC2014 Z80 8-bit computer. It adds the ability to play music on your RC2014!

## What can you use this for?

* Playing music ripped from spectrum games
* Playing Spectrum Protracker 2/3 and tunes in MYM format
* Adding music to your own games
* Making music from BASIC or ASM!

## Features

* Stereo Line out, with golden ratio mixer.
* Header for the 2 8-bit I/O ports. These could be used for reading from joysticks, additional serial ports, LED indicators etc.
* Both YM2149F and AY-3-8910 ICs may be used
* Supported in RomWBW
* Possible to jumper to the same IO port as the ZX Spectrum AY
* Known to work on the standard RC2014 setup, as well as on Steve Cousin's SC126 and SC130
* Divides the RC2014 clock by 2 or 4 using flip flops to bring it under the 2Mhz max clock speed of the AY.
* Supports enabling the YM2149F's internal clock divider. This means that bus speeds up to 16Mhz could be supported without overclocking the chip. (AY does not have this feature)

## History
The Yamaha YM2149F and General Instrument AY-3-8910 are popular sound chips that were used in a wide variety of computers and arcade machines in the 1980s and 1990s. The most notable of those being the ZX Spectrum 128, Atari ST and MSX computers.

## Construction Steps

0. If you have bought one of Spencer's kits, obtain a YM2149 chip from your local friendly eBay seller :)
1. Verify the components supplied in the kit match up with [bill of materials](https://github.com/electrified/rc2014-ym2149/blob/master/README.md#bill-of-materials)
2. Solder the components to the board, matching the components in the [BOM](https://github.com/electrified/rc2014-ym2149/blob/master/README.md#bill-of-materials) to the component references printed on the PCB, starting with the lowest height ones first e.g. bypass capacitors and resistors, then moving on to IC sockets, pin headers and do the electrolytic capacitors and output jack last.
3. Insert the ICs in their sockets. The component reference marking on the PCB (e.g. U1) is nearest to pin 1 for all ICs
4. If you have a Z80 based system, configure the jumpers on the board so it looks like the picture in the README. This will ensure it is at the right IO address. If you have an SC-126 or SC-130 that uses the Z180 micro, you will have to change the default addressing to the 0x60 range, moving JP1 onto 1-2, JP7 onto 2-3 and JP4 to the position that links pins 13-14. This way you avoid conflicting with the 0xC0-FF range that is reserved for the Z180 internal peripherals. 
5. Insert board into backplane/SBC
6. Boot into RomWBW ensure you have the "tune.com" application (it's not included in the ROM drive but should be on the disk images)
7. Find some music to play. There are some example files in https://github.com/wwarthen/RomWBW/tree/dev/Source/Apps/Tune/Tunes that you could transfer to the system.
8. Use tune.com to play the music file. If you download the RomWBW*-Package.zip corresponding to whatever version of RomWBW you are using the from the releases page here https://github.com/wwarthen/RomWBW/releases, the tune.com executable will be in the `Binary/Apps` directory.

## Bill Of Materials

![Picture of the board](./r5-board-render.png?raw=true)

Qty|Schematic Reference|Description
---|-------------------|-----------
2|U1 U2| 16 pin DIP socket 2.54 mm pin pitch, 7.62 mm wide
1|U5|	40 pin DIP socket, 2.54mm pin pitch, 15.24mm wide
1|U5|	Yamaha YM2149F or General Instrument AY-3-8910
1|U4|	74HCT74
2|U3 U4| 14 pin DIP socket 2.54 mm pin pitch, 7.62 mm wide
1|U3|	74HCT00
2|U1 U2| 74HCT138
2|R6 R7| 1k6 ohm 1/4 watt metal film resistor
2 |R4 R5| 1k ohm 1/4 watt metal film resistor
3|R1 R2 R3|	3k ohm 1/4 watt metal film resistor
1|P1|	40 pin right angled 2.54mm header
1|J1|	Cliff FCR1295 3.5mm PCB mount jack socket
2|C6 C7| 470uF electrolytic capacitor
5|C1 C2 C3 C4 C5|	0.1uF ceramic capacitor 2.54 mm pin pitch
2|JP1 JP2 JP5| 3 x 1 straight pin header 2.54 mm pin pitch
1|JP3| 3 x 2 straight pin header 2.54 mm pin pitch
1|JP4| 8 x 2 straight pin header 2.54 mm pin pitch
1|J2| 9 x 2 straight pin header 2.54 mm pin pitch
5|Various|Jumpers

The BOM is available on Octopart https://octopart.com/bom-tool/CikqAiJP

The majority of the components are widely available. Availability of the audio out jack (Cliff FCR1295) is more limited, however it is stocked by Element 14 (Farnell, CPC etc) and Rapid. See https://www.rapidonline.com/cliff-electronic-fcr1295-jack-skt-3-5-mm-pcb-tht-blk-50-3284

Both the AY-3-8910 and YM2194F are unfortunately not in production any more, but reclaimed chips are available fairly plentifully on eBay from suppliers in China. I would suggest using a standard 40 pin DIL socket for the AY as they are more accommodating to bent/soldered pins than a turned pin ones.

## Jumpers

Jumpering the pins marked default below will give the board a data port of 0xD0 and register port of 0xD8. The example programs in the player directory should work without modification.

Pin 1 is identified by having square pad.

### JP1
Use the A4 line high for chip enable

pins|description
----|------------
1-2 | No
2-3 | Yes - Default

### JP7

This is not present on boards prior to Rev 5
Use the A4 line low for chip enable. Either this OR JP1 can be set to yes, but not both at the same time.

pins|description
----|------------
1-2 | No - Default
2-3 | Yes

### JP2
Use JP1, JP7 and JP4 settings for address decoding

pins|description
----|------------
1-2 | Yes - Default
2-3 | No (Use A15 - Spectrum 128 address mode)

### JP3
Register mode selector i.e. which line in addition to the base address needs to be high to select address bus mode.
The YM has 3 bus modes: read, write and address, address is used to specify the register for the next read or write operation.

pins|description
----|------------
1-2 | A14 (Spectrum)
3-4 | A3 - Default (Register IO port is base address + 8)
5-6 | A2 - (Register IO port is base address + 4)

### JP4
Base address

pins|with JP1 on 1&2 and JP7 on 2&3
----|------------
1-2 | 0x0
3-4 | 0x80
5-6 | 0x40
7-8 | 0xC0
9-10 | 0x20
11-12 | 0xA0
13-14 | 0x60
15-16 | 0xE0

pins|with JP1 on 2&3 and JP7 on 1&2
----|------------
1-2 | 0x10
3-4 | 0x90
5-6 | 0x50
7-8 | 0xD0 - Default
9-10 | 0x30
11-12 | 0xB0
13-14 | 0x70
15-16 | 0xF0

### JP5
External clock divide

pins|description
----|------------
1-2 | Divide by 2
2-3 | Divide by 4 - Default

### JP6

YM2149 only, internally halve clock if jumpered


## Outputs

J1 - 3.5mm audio out

J2 - 2 8 bit I/O ports


## How to use from BASIC

See the BASIC programs in ```player/test```. ```descend.bas``` plays some descending tones, ```io_in.bas``` demonstrates reading from the IO port, and ```io_out.bas``` demonstrates writing to an IO port.

## How to use from RomWBW

Wayne has incorporated a player called "Tune" into RomWBW that will play PT2, PT3 and MYM files. See here for the source: https://github.com/wwarthen/RomWBW/tree/master/Source/Apps/Tune. It should be present within RomWBW disk images.

Alternatively start the Microsoft BASIC interpreter mbasic, and refer to the above BASIC examples.

## Sources for music to play

ZXArt is my favourite site: https://zxart.ee/eng/music/mainpage/

http://zxtunes.com/ is another massive collection.

http://ftp.kameli.net/pub/mym/ has a collection of MYM files

This tool compresses YMs to MYMs, which makes a lot of music available: http://osdk.org/index.php?page=documentation&subpage=ym2mym although your mileage may vary, I found some YMs weren't convertible.

This is a large archive of YM tunes to try with the above tool: ftp://ftp.modland.com/pub/modules/YM/

The CPC Power site has a lot of Amstrad YMs: https://www.cpc-power.com/index.php?page=database

There are some PT2s, PT3s and YMs on Sergei Bulba's site: http://bulba.untergrund.net/music_e.htm (although a lot of tunes in other formats)

## Acknowledgements
* Some ideas and the golden ratio output mixing were taken from the Melodik 2 design here: http://hw.speccy.cz/melodik2.html

## License

Copyright Ed Brindley 2020.

This source describes Open Hardware and is licensed under the CERN-OHL-P v2
You may redistribute and modify this documentation and make products using it under the terms of the CERN-OHL-P v2 (https:/cern.ch/cern-ohl). This documentation is distributed WITHOUT ANY EXPRESS OR IMPLIED WARRANTY, INCLUDING OF MERCHANTABILITY, SATISFACTORY QUALITY AND FITNESS FOR A PARTICULAR PURPOSE. Please see the CERN-OHL-P v2 for applicable conditions