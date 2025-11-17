	.arch armv8-a
	.file	"max.c"
	.text
	.section	.rodata
	.align	3
.LC0:
	.string	"%d\n"
	.text
	.align	2
	.global	main
	.type	main, %function
main:
.LFB0:
	stp	x29, x30, [sp, -16]!
.LCFI0:
	mov	x29, sp
	mov	w1, 2
	mov	w0, 3
	bl	max
	mov	w1, w0
	adrp	x0, .LC0
	add	x0, x0, :lo12:.LC0
	bl	printf
	mov	w0, 0
	ldp	x29, x30, [sp], 16
.LCFI1:
	ret
.LFE0:
	.size	main, .-main
	.align	2
	.global	max
	.type	max, %function
max:
.LFB1:
	sub	sp, sp, #16
.LCFI2:
	str	w0, [sp, 12]
	str	w1, [sp, 8]
	ldr	w1, [sp, 12]
	ldr	w0, [sp, 8]
	cmp	w1, w0
	ble	.L4
	ldr	w0, [sp, 12]
	b	.L5
.L4:
	ldr	w0, [sp, 8]
.L5:
	add	sp, sp, 16
.LCFI3:
	ret
.LFE1:
	.size	max, .-max
	.section	.eh_frame,"a",@progbits
.Lframe1:
	.4byte	.LECIE1-.LSCIE1
.LSCIE1:
	.4byte	0
	.byte	0x3
	.string	"zR"
	.uleb128 0x1
	.sleb128 -8
	.uleb128 0x1e
	.uleb128 0x1
	.byte	0x1b
	.byte	0xc
	.uleb128 0x1f
	.uleb128 0
	.align	3
.LECIE1:
.LSFDE1:
	.4byte	.LEFDE1-.LASFDE1
.LASFDE1:
	.4byte	.LASFDE1-.Lframe1
	.4byte	.LFB0-.
	.4byte	.LFE0-.LFB0
	.uleb128 0
	.byte	0x4
	.4byte	.LCFI0-.LFB0
	.byte	0xe
	.uleb128 0x10
	.byte	0x9d
	.uleb128 0x2
	.byte	0x9e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI1-.LCFI0
	.byte	0xde
	.byte	0xdd
	.byte	0xe
	.uleb128 0
	.align	3
.LEFDE1:
.LSFDE3:
	.4byte	.LEFDE3-.LASFDE3
.LASFDE3:
	.4byte	.LASFDE3-.Lframe1
	.4byte	.LFB1-.
	.4byte	.LFE1-.LFB1
	.uleb128 0
	.byte	0x4
	.4byte	.LCFI2-.LFB1
	.byte	0xe
	.uleb128 0x10
	.byte	0x4
	.4byte	.LCFI3-.LCFI2
	.byte	0xe
	.uleb128 0
	.align	3
.LEFDE3:
	.ident	"GCC: (Debian 12.2.0-14+deb12u1) 12.2.0"
	.section	.note.GNU-stack,"",@progbits
