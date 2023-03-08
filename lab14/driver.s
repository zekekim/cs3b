//
// Ezekiel Kim
// Lab 14
// Program to drive Factorial
// Ezekiel Kim
// 3/7//2023
//
	.global _start // Provide program starting address

	.data
		dbN:	.quad	5
		szN:	.skip	21
		dbRes:	.quad	0
		szRes:	.skip	21
		szMsg1:	.asciz	"Factorial of "
		szMsg2:	.asciz	" is "
		chCr:	.byte	10

	.text

_start:
	ldr	x0,	=dbN	// Get dbN
	ldr	x0,	[x0]	// Load dbN
	ldr	x1,	=szN	// Load szN
	bl	int64asc	// Turn into string
	ldr	x0,	=dbN	// Get dbN
	ldr	x0,	[x0]	// Dereference
	bl	fact		// Run factorial
	ldr	x1,	=dbRes	// Get dbRes
	str	x0,	[x1]	// Load result into dbRes
	ldr	x1,	=szRes	// Load string result
	bl	int64asc	// Store value in string
	ldr	x0,	=szMsg1	// Load szMsg1
	bl	putstring	// Print it
	ldr	x0,	=szN	// Load szN
	bl	putstring	// Print it
	ldr	x0,	=szMsg2	// Load szMsg2
	bl	putstring	// Print it
	ldr	x0,	=szRes	// Print result
	bl	putstring	// Print result
	ldr	x0,	=chCr	// Get carriage return
	bl	putch	// Print it
// Setup the parameters to exit the program and then call Linux to do it.
	mov	x0,	#0	// Sets return code to 0
	mov	x8,	#93	// Service command code 93 terminates
	svc	0	// Call linux to terminate the program
	.end
