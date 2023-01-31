//
// Ezekiel Kim
// Lab 5
// Program to add 100,1000, 10000000, 100000000000 and print the sum
// Ezekiel Kim
// 1/30/2023
//
	.global _start // Provide program starting address

	.data
	chCr:	.asciz	"\n"
	szAdd:	.asciz	" + "
	szEq:	.asciz 	" = "
	szA:	.asciz	"100"
	szB:	.asciz	"10000"
	szC:	.asciz	"10000000"
	szD:	.asciz	"10000000000"
	szR:	.skip	21
	dbA:	.quad	0
	dbB:	.quad	0
	dbC:	.quad	0
	dbD:	.quad	0
	dbR:	.quad	0

	.text

_start:
// Initialize dbA using ascint64
	ldr	x0,	=szA	// Load szA to be converted
	bl	ascint64	// Call conversion
	ldr	x1,	=dbA	// Load dbA to store value
	str	x0,	[x1]	// Store value in dbA
// Initialize dbB using ascint64
	ldr	x0,	=szB	// Load szB to be converted
	bl	ascint64	// Call conversion
	ldr	x1,	=dbB	// Load dbB to store value
	str	x0,	[x1]	// Store value in dbB
// Initialize dbC using ascint64
	ldr	x0,	=szC	// Load szC to be converted
	bl	ascint64	// Call conversion
	ldr	x1,	=dbC	// Load dbC to store value
	str	x0,	[x1]	// Store value in dbC
// Initialize dbD using ascint64
	ldr	x0,	=szD	// Load szD to be converted
	bl	ascint64	// Call conversion
	ldr	x1,	=dbD	// Load dbD to store value
	str	x0,	[x1]	// Store value in dbD
// Setup for addition
	ldr	x0,	=dbA	// Load dbA
	ldr	x0,	[x0]	// Dereference
	ldr	x1,	=dbB	// Load dbB
	ldr	x1,	[x1]	// Dereference
	ldr	x2,	=dbC	// Load dbC
	ldr	x2,	[x2]	// Dereference
	ldr	x3,	=dbD	// Load dbD
	ldr	x3,	[x3]	// Dereference
// Add the values and store to dbR
	add	x0,	x0,	x1	// Add dbA and dbB
	add	x0,	x0,	x2	// Add dbC to sum
	add	x0,	x0,	x3	// Add dbD to sum
	ldr	x1,	=dbR	// Load x1 with result
	str	x0,	[x1]	// Store result in dbR
// Convert result into string
	ldr	x1,	=szR	// Load x1 with result string
	bl	int64asc	// Convert result into string szR
// Print string
	ldr	x0,	=szA	// Load szA
	bl	putstring	// Print
	ldr	x0,	=szAdd	// Load szAdd
	bl	putstring	// Print
	ldr	x0,	=szB	// Load szB
	bl	putstring	// Print
	ldr	x0,	=szAdd	// Load szAdd
	bl	putstring	// Print
	ldr	x0,	=szC	// Load szC
	bl	putstring	// Print
	ldr	x0,	=szAdd	// Load szAdd
	bl	putstring	// Print
	ldr	x0,	=szD	// Load szD
	bl	putstring	// Print
	ldr	x0,	=szEq	// Load szEq
	bl	putstring	// Print
	ldr	x0,	=szR	// Load szR
	bl	putstring	// Print
	ldr	x0,	=chCr	// Load chCr
	bl 	putstring	// Print

// Setup the parameters to exit the program and then call Linux to do it.
	mov	x0,	#0	// Sets return code to 0
	mov	x8,	#93	// Service command code 93 terminates
	svc	0	// Call linux to terminate the program
	.end
