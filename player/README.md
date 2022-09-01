# Assembling within a Docker container

## Prerequisites
* Docker
* This repo checked out

## Building the docker image
To build the docker container containing the tools, change into this directory in the git checkout then
```
docker build -t z80-build .
```

You should see some output similar to the following (there will be a lot more when built for the first time with no cache)

```
Sending build context to Docker daemon  586.2kB
Step 1/4 : FROM debian:unstable-slim
 ---> 36663c2c334f
Step 2/4 : RUN apt-get -y update && apt-get -y install build-essential git bison flex libxml2-dev subversion zlib1g-dev m4 ragel re2c dos2unix texinfo texi2html gdb curl perl cpanminus ccache libboost-all-dev libmodern-perl-perl libyaml-perl liblocal-lib-perl libcapture-tiny-perl libpath-tiny-perl libtext-table-perl libdata-hexdump-perl libregexp-common-perl libclone-perl libfile-slurp-perl && cpanm --local-lib=~/perl5 App::Prove CPU::Z80::Assembler Data::Dump Data::HexDump File::Path List::Uniq Modern::Perl Object::Tiny::RW Regexp::Common Test::Harness Text::Diff Text::Table YAML::Tiny && eval $(perl -I ~/perl5/lib/perl5/ -Mlocal::lib) && git clone --recurse-submodules --branch v1.20.1 https://github.com/z00m128/sjasmplus.git && git clone --recurse-submodules https://github.com/z88dk/z88dk.git && cd sjasmplus && make && cd ../z88dk && export BUILD_SDCC=1 && export BUILD_SDCC_HTTP=1 && chmod 777 build.sh && ./build.sh
 ---> Using cache
 ---> 2d4bfb98bbca
Step 3/4 : ENV PATH "/z88dk/bin:/sjasmplus:$PATH"     ZCCCFG="/z88dk/lib/config/"
 ---> Using cache
 ---> 472186f6ac08
Step 4/4 : WORKDIR /src
 ---> Using cache
 ---> a4e7ad1df2e2
Successfully built a4e7ad1df2e2
Successfully tagged z80-build:latest
```

## Running the assembler
To assemble PTxPlay with tune and generate an intel hex file, run the following commands

First run this to assemble
```
docker run -v ${PWD}:/src/ -it z80-build sjasmplus PTxPlay.asm
```

You should see output similar to
```
SjASMPlus Z80 Cross-Assembler v1.20.1 (https://github.com/z00m128/sjasmplus)
Pass 1 complete (0 errors)
Pass 2 complete (0 errors)
PTxPlay.asm(292): warning: value 0x1F0 is truncated to 8bit value: 0xF0
PTxPlay.asm(352): warning: value 0xC774 is truncated to 8bit value: 0x74
PTxPlay.asm(399): warning: value 0xC780 is truncated to 8bit value: 0x80
PTxPlay.asm(672): warning: value 0x1A3E5 is truncated to 16bit value: 0xA3E5
PTxPlay.asm(994): warning: value 0xC949 is truncated to 8bit value: 0x49
PTxPlay.asm(1058): warning: value 0xC849 is truncated to 8bit value: 0x49
PTxPlay.asm(1412): warning: value 0xDD8 is truncated to 8bit value: 0xD8
PTxPlay.asm(1424): warning: value 0xCDA is truncated to 8bit value: 0xDA
PTxPlay.asm(1437): warning: value 0xE08 is truncated to 8bit value: 0x08
PTxPlay.asm(1449): warning: value 0xFC0 is truncated to 8bit value: 0xC0
include data: name=tunes/MmcM_-_Recollection_(2015).pt3 (7963 bytes) Offset=0  Len=7963
Pass 3 complete
Errors: 0, warnings: 10, compiled: 1513 lines, work time: 0.004 seconds
```

Then convert the binary file to intel hex with the following
```
docker run -v ${PWD}:/src/ -it z80-build z88dk-appmake +rom -b PTxPlay.out --org 49152 --ihex
```

You should now have a PTxPlay.ihx in the current directory.

## Changing the song being played
Search for `MDLADDR EQU $` in PTxPlay.asm and change the referenced song

## Changing the port
Search for `IF RC` and adjust the output code ports