//
// Ezekiel Kim
// Lab 15
// Program to 
// Ezekiel Kim
// /2023
//
	.global _start // Provide program starting address

	.data
		szFile: 	.asciz	"output.txt"
		szMessage:	.asciz	"cat in the hat"

	.text

_start:

	// Open File
	mov	x0,	#-100
	mov	x8,	#56
	ldr	x1,	=szFile
	mov	x2,	#0101
	mov	x3,	#0600
	svc	0
	
	// Load Input Into File
	mov	x8,	#64
	ldr	x1,	=szMessage
	mov	x2,	#15
	svc	0
	
	// Close the file
	mov	x8,	#57
	svc	0

// Setup the parameters to exit the program and then call Linux to do it.
	mov	x0,	#0	// Sets return code to 0
	mov	x8,	#93	// Service command code 93 terminates
	svc	0	// Call linux to terminate the program
	.end
