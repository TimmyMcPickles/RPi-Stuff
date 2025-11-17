	.arch armv7-a
	.fpu vfpv3-d16
	.syntax unified
    .section	.rodata
	.align	2

helloMsg:
	.ascii	"Hello !\0"

    .text
	.global	main
	.type	main, %function

main:
	push	{fp, lr}
 
 	ldr	r0, helloMsgAddr
 	bl	puts

	pop	{fp, pc}

helloMsgAddr:
	.word	helloMsg