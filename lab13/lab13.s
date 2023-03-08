//
// Ezekiel Kim
// Lab 13
// Program to malloc and print
// Ezekiel Kim
// 3/7/2023
//
	.global _start // Provide program starting address

	.data
		szX:	.asciz	"Cat"
		szY:	.asciz	"in the hat."
		ptrString:	.quad	0

	.text

_start:
	mov	x0,	#18	// Bytes needed to store Cat in the hat
	bl	malloc		// Create memory allocation
	ldr	x1,	=ptrString	// Pointer value
	str	x0,	[x1]	// Put it in pointer string
	ldr	x1,	=szX	// Set pointer
	ldr	x1,	[x1]	// Dereference
	str	x1,	[x0], #3	// Store cat in x0
	mov	w1,	#' '	// Store 20 immediate value for " "
	strb	w1,	[x0], #1	// Store space after cat
	ldr	x1,	=szY	// Load in the hat
	ldr	x2,	[x1], #8	// Load first 32 bits
	ldr	x3,	[x1]	// Dereference hat
	stp	x2,	x3,	[x0]	// Store in pointer
	ldr	x0,	=ptrString	// Get string pointer
	ldr	x0,	[x0]		// Get value for pointer
	mov	x1,	#0		// Clear x1
	bl	putstring	// Print the string


	
// Setup the parameters to exit the program and then call Linux to do it.
	mov	x0,	#0	// Sets return code to 0
	mov	x8,	#93	// Service command code 93 terminates
	svc	0	// Call linux to terminate the program
	.end
