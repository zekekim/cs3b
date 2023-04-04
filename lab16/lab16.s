//
// Ezekiel Kim
// Lab 16
// Program to Read a .txt file
// Ezekiel Kim
// 4/3/2023
//
	.global _start // Provide program starting address

	.data
		szFile: 	.asciz	"output.txt"
		szBuff:		.skip	21
		chCr:		.byte	10

	.text

_start:

	// Open File
	mov	x0,	#-100
	mov	x8,	#56
	ldr	x1,	=szFile
	mov	x2,	#0100
	mov	x3,	#0600
	svc	0
	mov	x19,	x0
	
	// Load First Line
	mov	x8,	#63
	ldr	x1,	=szBuff
	mov	x2,	#15
	svc	0

	// Print first line
	ldr	x0,	=szBuff
	bl	putstring

	// Clear buffer
	ldr	x0,	=szBuff
	mov	x1,	#0
	str	x1,	[x0]

	// Load Second Line
	mov	x0,	x19
	mov	x8,	#63
	ldr	x1,	=szBuff
	mov	x2,	#20
	svc	0

	// Print second line
	ldr	x0,	=szBuff
	bl	putstring
	ldr	x0,	=chCr
	bl	putch

	// Close the file
	mov	x8,	#57
	svc	0

// Setup the parameters to exit the program and then call Linux to do it.
	mov	x0,	#0	// Sets return code to 0
	mov	x8,	#93	// Service command code 93 terminates
	svc	0	// Call linux to terminate the program
	.end
