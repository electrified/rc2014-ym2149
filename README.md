# YM2149F/AY-3-8190 Sound card for the RC2014 computer

![Picture of the board](./R1-board-pic.jpg?raw=true)

# WARNING!
This repo contains R2 of the board which fixes an error present in R1. I believe it should work correctly, but I've not had an R2 manufactured yet.

## History
The Yamaha YM2149F and General Instrument AY-3-8910 are popular sound chips that were used in a wide variety of computers and arcade machines in the 1980's and 1990s. The most notable of those being the ZX Spectrum 128, Atari ST and MSX computers.

## The board
The YM and AY are essentially pin compatible and both may be used in this board, although the YM has the ability to be jumpered to halve it's clock which the AY does not.

This board can be jumpered for either Spectrum style address decoding (is quite loose so may conflict with other hardware and is not usable from BASIC as needs the high address byte setting) or for a more specific address.

## What can you use this for?

* Playing music ripped from spectrum games
* Playing Spectrum Protracker demoscene tunes from e.g. http://zxart.ee/eng/music/ and http://zxtunes.com with Sergei Bulba's playback routines available at http://bulba.untergrund.net/progr_e.htm
* Adding music to your own games
* Making music from BASIC!

## Jumpers

Jumpering the pins marked default below will set the board up to respond to Spectrum 128 ports, and will divide the RC21014's clock down for use with both the AY and YM.

### JP1
Use A4 line for chip enable

pins|description
----|------------
1-2 | No
2-3 | Yes

### JP2
Use JP1 and JP4 setting for address decoding

pins|description
----|------------
1-2 | Yes
2-3 | No (Use A15 - Spectrum 128 address mode) - Default

### JP3
YM Address mode selector (YM has 3 bus modes, read write and address, address is used to specify the register for read write operations)

pins|description
----|------------
1-2 | A14 (Spectrum) - Default
3-4 | A3
5-6 | A2

### JP4
Base address

pins|with JP1 on 2&3
----|------------
1-2 | 0x10
3-4 | 0x90
5-6 | 0x50
7-8 | 0xD0
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

## Bill Of Materials

I've made the BOM available on Octopart https://octopart.com/bom-tool/CikqAiJP

The majority of the components are fairly generic and can be swapped out with other parts, e.g. all the 74' components, the resistors, pin headers, capacitors etc. The audio out jack must be the Cliff one specified to fit on the footprint however.

The AY/YM is unfortunately not in production any more, but reclaimed chips are available fairly plentifully on eBay from suppliers in China.

## How to use from BASIC
See player/test.bas

## How to upload music with HEXLOAD

0. Build the Intel hex file using make pt
1. Load .ihx file
2. DOKE &h8124, &hC000
3. PRINT usr(0)

## How to use from CP/M
TBD
