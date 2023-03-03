//
// Ezekiel Kim
// Lab 12
// Program to find the string length of a string.
// Ezekiel Kim
// /2023
//
	.global String_length // program starting address

	.data

	.text

String_length:
	str	x1,	[sp,	#-16]!	// Store x1 on the stack
	str	x2,	[sp,	#-16]!	// Store x2 on the stack
	str	x19,	[sp,	#-16]!	// Store x19 on the stack
	str	x20,	[sp,	#-16]!	// Store x19 on the stack
	str	x21,	[sp,	#-16]!	// Store x19 on the stack
	str	x22,	[sp,	#-16]!	// Store x19 on the stack
	str	x23,	[sp,	#-16]!	// Store x19 on the stack
	str	x24,	[sp,	#-16]!	// Store x19 on the stack
	str	x25,	[sp,	#-16]!	// Store x19 on the stack
	str	x26,	[sp,	#-16]!	// Store x19 on the stack
	str	x27,	[sp,	#-16]!	// Store x19 on the stack
	str	x28,	[sp,	#-16]!	// Store x19 on the stack
	str	x29,	[sp,	#-16]!	// Store x19 on the stack
	str	x30,	[sp,	#-16]!	// Store x19 on the stack
	
	mov	x1,	#0	// Initialize the counter

	loop:
	ldrb	w2,	[x0,	x1]	// load the byte at string address
	cmp	w2,	#0		// compare value to 0
	b.eq	end			// if it is 0, end the program
	add	x1,	x1,	#1	// add to the index
	b	loop

	end:
	mov	x0,	x1		// Return the length of the string
	ldr	x30,	[sp],	#16	// Retrive x30 from stack
	ldr	x29,	[sp],	#16	// Retrive x29 from stack
	ldr	x28,	[sp],	#16	// Retrive x28 from stack
	ldr	x27,	[sp],	#16	// Retrive x27 from stack
	ldr	x26,	[sp],	#16	// Retrive x26 from stack
	ldr	x25,	[sp],	#16	// Retrive x25 from stack
	ldr	x24,	[sp],	#16	// Retrive x24 from stack
	ldr	x23,	[sp],	#16	// Retrive x23 from stack
	ldr	x22,	[sp],	#16	// Retrive x22 from stack
	ldr	x21,	[sp],	#16	// Retrive x21 from stack
	ldr	x20,	[sp],	#16	// Retrive x20 from stack
	ldr	x19,	[sp],	#16	// Retrive x19 from stack
	ldr	x2,	[sp],	#16	// Retrive x2 from stack
	ldr	x1,	[sp],	#16	// Retrive x1 from stack
	ret
	
	.end
