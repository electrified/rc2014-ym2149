# YM2149F/AY-3-8190 Sound card for the RC2014 computer

![Picture of the board](./R1-board-pic.jpg?raw=true)

Video demonstration: https://www.youtube.com/watch?v=-iLwi9FagFE

## The board
This is a YM2149F/AY-3-8910 sound card for the RC2014 Z80 8-bit computer. It adds the ability to make music with your RC2014!

## What can you use this for?

* Playing music ripped from spectrum games
* Playing Spectrum Protracker demoscene tunes from e.g. http://zxart.ee/eng/music/ and http://zxtunes.com with Sergei Bulba's playback routines available at http://bulba.untergrund.net/progr_e.htm
* Adding music to your own games
* Making music from BASIC or ASM!

## Features

* Stereo Line out, with golden ratio mixer. If you only want mono, jumpers can be used in place of the mixing resistors.
* Header for the 2 8-bit I/O ports. These could be used for reading from joysticks, additional serial ports, LED indicators etc.
* Both YM2149F and AY-3-8910 ICs may be used
* Jumperable to the same IO port as the ZX Spectrum AY, making it easier to play ripped Spectrum music.
* Tested with standard RC2014 setup, as well as under CP/M with Scott Baker's 512k RAM/ROM SIO/2 and CTC boards. No address conflicts were observed.
* Divides the RC2014 clock by 2 or 4 using flip flops to bring it under the 2Mhz max clock speed of the AY.
* Additionally supports enabling the YM2149F's internal clock divider. This means that bus speeds up to 16Mhz could be supported without overclocking the chip. (AY does not have this feature)

## History
The Yamaha YM2149F and General Instrument AY-3-8910 are popular sound chips that were used in a wide variety of computers and arcade machines in the 1980s and 1990s. The most notable of those being the ZX Spectrum 128, Atari ST and MSX computers.

## Jumpers

Jumpering the pins marked default below will give the board a data port of 0xD0 and register port of 0xD8. The example programs in the player directory should work without modification.

Pin 1 is identified by having square pad.

### JP1
Use the A4 line for chip enable

pins|description
----|------------
1-2 | No - Default
2-3 | Yes

### JP2
Use JP1 and JP4 settings for address decoding

pins|description
----|------------
1-2 | Yes - Default
2-3 | No (Use A15 - Spectrum 128 address mode)

### JP3
Address mode selector i.e. which line in addition to the base address needs to be high to select address bus mode.
The YM has 3 bus modes: read, write and address, address is used to specify the register for the next read or write operation.

pins|description
----|------------
1-2 | A14 (Spectrum)
3-4 | A3 - Default
5-6 | A2

### JP4
Base address

pins|with JP1 on 1&2
----|------------
1-2 | 0x10
3-4 | 0x90
5-6 | 0x50
7-8 | 0xD0 - Default
9-10 | 0x30
11-12 | 0xB0
13-14 | 0x70
15-16 | 0xF0

pins|with JP1 on 2&3
----|------------
1-2 | 0x0
3-4 | 0x80
5-6 | 0x40
7-8 | 0xC0
9-10 | 0x20
11-12 | 0xA0
13-14 | 0x60
15-16 | 0xE0

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

The majority of the components are fairly generic and can be swapped out with other parts, e.g. all the 74HCT' components, resistors, pin headers, capacitors etc. The audio out jack must be the Cliff FCR1295 however.

Both the AY-3-8910 and YM2194F is unfortunately not in production any more, but reclaimed chips are available fairly plentifully on eBay from suppliers in China. I would suggest using a standard 40 pin DIL socket for the AY as they are more accommodating to bent/soldered pins than a turned pin ones.

## How to use from BASIC

See player/test.bas

## How to upload music with HEXLOAD

0. Build the Intel hex file using make pt
1. Load .ihx file
2. DOKE &h8124, &hC000
3. PRINT usr(0)

## How to use from CP/M
Start the Microsoft basic interpreter, mbasic, and run player/test.bas

## Things to experiment with
* Altering resistor values for the stereo mixing network. The values used where taken from the Melodik 2 design here: http://hw.speccy.cz/melodik2.html
If you don't want stereo output, or consider that the resistors attenuate the output too much you could use different values.
