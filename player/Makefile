test.bin: test.asm
	z88dk-z80asm -l -b test.asm
	z88dk-appmake +rom -b test_INIT.bin --org 49152 --ihex

pt:
	-sjasmplus PTxPlay.asm
	z88dk-appmake +rom -b PTxPlay.out --org 49152 --ihex

int:
	-sjasmplus interrupt/PTxPlay.asm
	z88dk-appmake +rom -b interrupt/PTxPlay.out --org 45056 --ihex


.PHONY clean:
	rm -f *.bin *.err *.hex *.lis *.obj *.o *.out *.rom *.lst *.ihx
