all:	hexload.txt

hexload.txt: hexload.bin
	./bin2bas1.py > hexload.txt

hexload.bin: hexload.asm
	z80asm -l -b hexload.asm
	mv hexload_INIT.bin hexload.bin

test.bin: test.asm
	z80asm -l -b test.asm
	appmake +rom -b test_INIT.bin --org 49152 --ihex

pt:
	-sjasm PTxPlay.asm
	appmake +rom -b PTxPlay.out --org 45056 --ihex

.PHONY clean:
	rm -f *.bin *.err *.hex *.lis *.obj *.o *.out *.rom *.lst *.ihx
