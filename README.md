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
Use the A4 line high for chip enable

pins|description
----|------------
1-2 | No
2-3 | Yes - Default

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

pins|with JP1 on 2&3
----|------------
1-2 | 0x0
3-4 | 0x80
5-6 | 0x40
7-8 | 0xC0 - Default
9-10 | 0x20
11-12 | 0xA0
13-14 | 0x60
15-16 | 0xE0

With JP1 on 1&2, the AY will additionally respond on the following ports as well:

pins|with JP1 on 1&2
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

### JP7

Use the A4 line low for chip enable. Either this OR JP1 can be set to yes, but not both at the same time.

pins|description
----|------------
1-2 | No - Default
2-3 | Yes

## Outputs

J1 - 3.5mm audio out

J2 - 2 8 bit I/O ports

## Construction

Rev 3 of the PCB unfortunately omitted the schematic references from the silkscreen - please refer to the below picture which has the references on.

![Board Layout](./R3-board-layout.png?raw=true)

## Bill Of Materials

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


If you want mono output, use wire links for R4 R5 R6 and R7

I've also made the BOM available on Octopart https://octopart.com/bom-tool/CikqAiJP

The majority of the components are fairly generic and can be swapped out with other parts, e.g. all the 74HCT' components, resistors, pin headers, capacitors etc. The audio out jack must be the Cliff FCR1295 however, which only seems to be available from Element 14 (Farnell, CPC etc) and Rapid. See http://uk.farnell.com/cliff-electronic-components/fcr1295/connector-stereo-jack-pcb/dp/2392727

Both the AY-3-8910 and YM2194F are unfortunately not in production any more, but reclaimed chips are available fairly plentifully on eBay from suppliers in China. I would suggest using a standard 40 pin DIL socket for the AY as they are more accommodating to bent/soldered pins than a turned pin ones.

## How to use from BASIC

See player/test.bas

## How to play Protracker 3 tunes using PTxPlay

0. Toward the end of PTxPlay.asm are some ```incbin``` statements which include the music file as data. Uncomment lines as required for the desired tune.
1. Build a .ihx file by running ```make pt```. This requires the SJASM assembler.
2. Load .ihx file
3. ```DOKE &h8124, &hC000```
4. ```PRINT usr(0)```

## How to use from CP/M
Start the Microsoft basic interpreter, mbasic, and run player/test.bas

Alternatively, PTxPlay can be assembled with an origin of 0x100. The resulting binary can then be uploaded and run as a .com file.

## Things to experiment with
* Altering resistor values for the stereo mixing network. The values used were taken from the Melodik 2 design here: http://hw.speccy.cz/melodik2.html
