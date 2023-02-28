//
// Ezekiel Kim
// Lab 11
// Program to store and output an array
// Ezekiel Kim
// 2/27/2023
//
	.global _start // Provide program starting address

	.data
		rgArr:	.quad	0,0,0,0,0,0,0,0,0,0
		index:	.byte	0
		dbTemp:	.quad	0
		szTemp:	.skip	21
		szPmpt:	.asciz	"Enter a number: "
		szSpa:	.asciz	"    "
		chCr:	.byte	10
	.text

_start:

getValues:
	ldr	x0,	=szPmpt		// Prompt user for values
	bl	putstring		// Print
	ldr	x0,	=szTemp		// Get temp string
	bl	getstring		// Get string
	ldr	x0,	=szTemp		// Get temp string
	bl	ascint64		// Convert to int
	ldr	x4,	=index		// Load index
	ldr	x3,	[x4]		// Dereference Index
	ldr	x2,	=rgArr		// Get pointer to first element
	str	x0,	[x2, x3]	// Store value into array
	add	x3,	x3,	#8	// Next value is 8 bytes away
	str	x3,	[x4]		// Add to index
	cmp	x3,	#80		// Check if at last element
	b.ge	printArr		// Print array
	b	getValues		// Else keep looping

printArr:
	ldr	x0,	=index		// Initialize index
	mov	x1,	#0		// Store 0 in x1
	str	x1,	[x0]		// Make index 0
loop:
	ldr	x3,	=index		// Get index
	ldr	x3,	[x3]		// Dereference
	ldr	x2,	=rgArr		// Get first pointer
	ldr	x0,	[x2,	x3]	// Get current element
	ldr	x1,	=szTemp		// Get temporary string
	bl	int64asc		// Conert int to string
	ldr	x0,	=szTemp		// Get szTemp
	bl	putstring		// Print this string
	ldr	x0,	=szSpa		// Get szSpa
	bl	putstring		// Print this string
	ldr	x3,	=index		// Get index
	ldr	x3,	[x3]		// Dereference index
	add	x3,	x3,	#8	// Get next value
	ldr	x4,	=index		// Get index
	str	x3,	[x4]		// Save index
	cmp	x3,	#80		// Check if at last element
	b.lt	loop			// Keep looping
	ldr	x0,	=chCr		// Print carriage return
	bl	putch			// Print it

// Setup the parameters to exit the program and then call Linux to do it.
	mov	x0,	#0	// Sets return code to 0
	mov	x8,	#93	// Service command code 93 terminates
	svc	0	// Call linux to terminate the program
	.end
