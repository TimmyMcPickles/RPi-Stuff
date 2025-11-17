@ Define my Raspberry Pi
    @ .cpu    cortex-a53
    @ .fpu    neon-fp-armv8

@ Define my beaglebone
	.arch armv7-a
	.fpu vfpv3-d16

    .syntax unified         @ modern syntax

@ Useful source code constants
    .equ    z,-16
    .equ    local,8

@ Constant program data
    .section  .rodata
    .align  2

formatMsg:
    .asciz	 "%i + %i = %i\n"

@ Program code
    .text        
	.align  2
    .global main
    .type   main, %function

main:
    sub     sp, sp, 12      @ space for saving regs
    str     fp, [sp, 0]     @ save fp
    str     lr, [sp, 4]     @      lr
    str     r5, [sp, 8]     @      r5
    str     r4, [sp, 12]    @   and r4
    add     fp, sp, 12      @ our frame pointer
    sub     sp, sp, local   @ allocate memory for local var

    mov     r5, 123         @ x = 123;
    ldr     r4, yValue      @ y = 4567;
    add     r3, r5, r4      @ x + y
    str     r3, [fp, z]     @ z = x + y;

    ldr     r0, formatMsgAddr  @ printf("%i + %i = %i\n",
    mov     r1, r5          @            x,
    mov     r2, r4          @            y,
    ldr     r3, [fp, z]     @            z);
    bl      printf

    mov     r0, 0           @ return 0;
    add     sp, sp, local   @ deallocate local var
    ldr     fp, [sp, 0]     @ restore fp
    ldr     lr, [sp, 4]     @      lr
    ldr     r5, [sp, 8]     @      r5
    ldr     r4, [sp, 12]    @      r4
    add     sp, sp, 12      @   and sp
    bx      lr              @ return

    .align  2

yValue:
    .word   4567

formatMsgAddr:
    .word   formatMsg
