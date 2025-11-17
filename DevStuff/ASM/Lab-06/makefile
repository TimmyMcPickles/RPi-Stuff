default:
	gcc -S -o max.s max.c -fno-asynchronous-unwind-tables -fno-dwarf2-cfi-asm
	gcc -g -o max max.s

asm:
	gcc -S -o max.s max.c -fno-asynchronous-unwind-tables -fno-dwarf2-cfi-asm

debug:
	gcc -g -o max max.s

