	.arch armv8-a
	.file	"main.c"
	.text
	.global	h
	.bss
	.align	2
	.type	h, %object
	.size	h, 4
h:
	.zero	4
	.global	i
	.align	2
	.type	i, %object
	.size	i, 4
i:
	.zero	4
	.text
	.align	2
	.global	main
	.type	main, %function
main:
.LFB6:
	.cfi_startproc
	stp	x29, x30, [sp, -16]!
	.cfi_def_cfa_offset 16
	.cfi_offset 29, -16
	.cfi_offset 30, -8
	mov	x29, sp
	mov	w0, 4
	bl	lgGpiochipOpen
	mov	w1, w0
	adrp	x0, h
	add	x0, x0, :lo12:h
	str	w1, [x0]
	adrp	x0, h
	add	x0, x0, :lo12:h
	ldr	w0, [x0]
	mov	w3, 0
	mov	w2, 17
	mov	w1, 0
	bl	lgGpioClaimOutput
.L2:
	adrp	x0, h
	add	x0, x0, :lo12:h
	ldr	w0, [x0]
	mov	w2, 0
	mov	w1, 17
	bl	lgGpioWrite
	fmov	d0, 1.0e+0
	bl	lguSleep
	adrp	x0, h
	add	x0, x0, :lo12:h
	ldr	w0, [x0]
	mov	w2, 1
	mov	w1, 17
	bl	lgGpioWrite
	fmov	d0, 1.0e+0
	bl	lguSleep
	b	.L2
	.cfi_endproc
.LFE6:
	.size	main, .-main
	.ident	"GCC: (Debian 12.2.0-14+deb12u1) 12.2.0"
	.section	.note.GNU-stack,"",@progbits
