	.arch 	armv7-a
	.fpu 	vfpv3-d16
    .section  .rodata
    .align  2
    .syntax unified

.LC0:
    .ascii  "The sum is %i\012\000"
    .text
    .global main
    .type   main, %function

main:
        push    {fp, lr}
        add     fp, sp, #4

        sub     sp, sp, #64     @@ space for locals and args

        mov     r3, #1
        str     r3, [fp, #-8]

        mov     r3, #2
        str     r3, [fp, #-12]

        mov     r3, #3
        str     r3, [fp, #-16]

        mov     r3, #4
        str     r3, [fp, #-20]

        mov     r3, #5
        str     r3, [fp, #-24]

        mov     r3, #6
        str     r3, [fp, #-28]

        mov     r3, #7
        str     r3, [fp, #-32]

        mov     r3, #8
        str     r3, [fp, #-36]

        mov     r3, #9
        str     r3, [fp, #-40]

        ldr     r3, [fp, #-40]
        str     r3, [sp, #16]    @@ arg i

        ldr     r3, [fp, #-36]
        str     r3, [sp, #12]    @@ arg h
        
        ldr     r3, [fp, #-32]
        str     r3, [sp, #8]     @@ arg g
       
        ldr     r3, [fp, #-28]
        str     r3, [sp, #4]     @@ arg f
       
        ldr     r3, [fp, #-24]
        str     r3, [sp]         @@ arg e
       
        ldr     r3, [fp, #-20]   @@ arg d
        ldr     r2, [fp, #-16]   @@ arg c
        ldr     r1, [fp, #-12]   @@ arg b
        ldr     r0, [fp, #-8]    @@ arg a
        bl      sumNine

        str     r0, [fp, #-44]
        
        ldr     r1, [fp, #-44]
        ldr     r0, .L3
        bl      printf
        
        mov     r3, #0
        mov     r0, r3
        sub     sp, fp, #4

        pop     {fp, pc}
.L4:
        .align  2
.L3:
        .word   .LC0
    