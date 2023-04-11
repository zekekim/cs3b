//
// Ezekiel Kim
// Lab 18
// Program to Create a linked list
// Ezekiel Kim
// 4/3/2023
//
	.global _start // Provide program starting address

	.data
		str1:  		.asciz "The Cat in the Hat\n"
		str2:  		.asciz "\n"
		str3:  		.asciz  "By Dr. Seuss\n"
		str4:		.asciz  "\n"
		str5:  		.asciz "The sun did not shine.\n"
		headPtr:	.quad	0
		tailPtr:	.quad	0
	.text

copy:
	stp	x29,	x30,	[sp,	#-16]!
	
	copy_loop:
		ldrb	w3,	[x0],	#1
		cmp	x3,	#0
		b.eq 	copy_end
		strb	w3,	[x1],	#1
		b	copy_loop

	copy_end:
	ldp	x29,	x30,	[sp],	#16
	ret

loop:
	stp	x29,	x30,	[sp,	#-16]!
	mov	x0,	x21
	bl	String_length
	bl	malloc
	mov	x1,	x0
	mov	x19,	x0
	mov	x0,	x21
	bl	copy
	mov	x0,	#16
	bl	malloc
	str	x19,	[x0]
	mov	x19,	#0
	str	x19,	[x0,	#8]
	mov	x20,	x0
	ldr	x1,	=headPtr
	str	x0,	[x1]
	ldp	x29,	x30,	[sp],	#16

	ret

loop_after:
	stp	x29,	x30,	[sp,	#-16]!
	mov	x0,	x21
	bl	String_length
	bl	malloc
	mov	x1,	x0
	mov	x19,	x0
	mov	x0,	x21
	bl	copy
	mov	x0,	#16
	bl	malloc
	str	x19,	[x0]
	mov	x19,	#0
	ldr	x19,	[x0,	#8]
	str	x0,	[x20,	#8]
	mov	x20,	x0
	ldp	x29,	x30,	[sp],	#16

	ret

_start:
	ldr	x21,	=str1
	bl	loop

	ldr	x21,	=str2	
	bl	loop_after
	
	ldr	x21,	=str3	
	bl	loop_after

	ldr	x21,	=str4	
	bl	loop_after

	ldr	x21,	=str5	
	bl	loop_after
	
	ldr	x0,	=tailPtr
	str	x20,	[x0]

	ldr	x19,	=headPtr
	ldr	x19,	[x19]

	loop_del:
	// x0 is this
	// x20 is nextNode
	// x19 is currentNode
	// cmp to tailptr
	// First access this
	// Free x0
	// mov x0,	x1
	// Start all over again
		ldr	x0,	[x19]
		ldr	x20,	[x19,	#8]
		bl	putstring
		ldr	x0,	[x19]
		bl free
		mov	x0,	x19
		bl free
		mov	x19,	x20
		cmp	x20,	#0
		b.eq	done
		b loop_del



done:
// Setup the parameters to exit the program and then call Linux to do it.
	mov	x0,	#0	// Sets return code to 0
	mov	x8,	#93	// Service command code 93 terminates
	svc	0	// Call linux to terminate the program
	.end
