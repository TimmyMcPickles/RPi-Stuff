	.arch 	armv7-a
	.fpu 	vfpv3-d16
	.syntax unified

	.text
	.align	2
	.global	main
	.type	main, %function

main:
	@ prologue
	nop
	sub     sp, sp, 8       @ space for fp, lr
    str     fp, [sp, 0]     @ save fp     sp + 0
    str     lr, [sp, 4]     @   and lr    sp + 4
    add     fp, sp, 4       @ set our frame pointer
	
	sub     sp, sp, #8		@ allocate from stack memory -> 8 bytes for local storage

    mov		r3, #10			@ move immediate value 10 to r3
  	str		r3, [fp, #-8]   @ store r3 to address fp with offset -8         

	mov 	r3, #12			@ move immediate value 12 to r3
	str		r3, [fp, #-12]  @ store r3 to address fp with offset -12        
        
	ldr     r2, [fp, #-8]	@ load r2 with value at address fp with offset -8
	ldr     r3, [fp, #-12]	@ load r2 with value at address fp with offset -12
	add     r1, r2, r3		@ add values r2 and r3, store resulting value in r1
	mov     r0, r1			@ move value in r1 to r0 for return to caller

    add     sp, sp, #8 		@ deallocate 8 bytes of stack used for local storage

	@ epilogue
	ldr     fp, [sp, 0]     @ restore caller fp
    ldr     lr, [sp, 4]     @       lr
    add     sp, sp, 8       @   and sp

    bx      lr              @ return
