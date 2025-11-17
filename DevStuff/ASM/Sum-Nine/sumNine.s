        .arch 	armv7-a
	.fpu 	vfpv3-d16
        .syntax unified
        .text
        .align  2
        .global sumNine
        .type   sumNine, %function

sumNine:
        str     fp, [sp, #-4]!
        add     fp, sp, #0

        sub     sp, sp, #28
        str     r0, [fp, #-16]   @@ save the arguments
        str     r1, [fp, #-20]   @@     passed in
        str     r2, [fp, #-24]   @@     registers
        str     r3, [fp, #-28]   @@     in local area
        
        ldr     r2, [fp, #-16]   @@ load arg one
        ldr     r3, [fp, #-20]   @@ and arg two
        add     r2, r2, r3       @@ r2 is subtotal

        ldr     r3, [fp, #-24]   @@ load arg three
        add     r2, r2, r3       @@ add to subtotal

        ldr     r3, [fp, #-28]   @@    etc...
        add     r2, r2, r3

        ldr     r3, [fp, #4]
        add     r2, r2, r3

        ldr     r3, [fp, #8]
        add     r2, r2, r3

        ldr     r3, [fp, #12]
        add     r2, r2, r3

        ldr     r3, [fp, #16]
        add     r2, r2, r3

        ldr     r3, [fp, #20]    @@ load arg nine
        add     r3, r2, r3       @@ add to subtotal

        str     r3, [fp, #-8]    @@ store in x
        ldr     r3, [fp, #-8]
        
        mov     r0, r3           @@ return x;
        
        add     sp, fp, #0
        ldr     fp, [sp], #4

        bx      lr