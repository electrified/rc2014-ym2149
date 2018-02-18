test.bin: test.asm
	z80asm -l -b test.asm
	appmake +rom -b test_INIT.bin --org 49152 --ihex

pt:
	-sjasm PTxPlay.asm
	appmake +rom -b PTxPlay.out --org 49152 --ihex

int:
	-sjasm interrupt/PTxPlay.asm
	appmake +rom -b interrupt/PTxPlay.out --org 45056 --ihex


.PHONY clean:
	rm -f *.bin *.err *.hex *.lis *.obj *.o *.out *.rom *.lst *.ihx
