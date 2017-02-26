all:	test.bin

test.bin: test.asm
	z80asm -l -b test.asm
	./bin2bas.py test_INIT.bin F800

test2.bin: test2.asm
	z80asm -l -b test2.asm
	./bin2bas.py test2_INIT.bin C000

.PHONY clean:
	rm -f *.bin *.err *.hex *.lis *.obj *.o
