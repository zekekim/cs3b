//
// Ezekiel Kim
// Lab {#}
// Program to ...
// Ezekiel Kim
// /2023
//
	.global _start // Provide program starting address

	.data
		szOut:	.asciz	"Output: \n"
		szTest:	.asciz	"This is a string."
		szStr:	.asciz	"String length = "
		szRes:	.skip	21
		chCr:	.byte	10

	.text

_start:
	ldr	x0,	=szTest	// Store the test string
	bl	String_length	// Find string length
	ldr	x1,	=szRes	// Result string addy
	bl	int64asc	// Store into string
	ldr	x0,	=szOut	// Print Output:
	bl	putstring
	ldr	x0,	=szStr	// Print String length ="
	bl	putstring
	ldr	x0,	=szRes	// Print Result
	bl	putstring
	ldr	x0,	=chCr	// Print carriage return
	bl	putch
	
// Setup the parameters to exit the program and then call Linux to do it.
	mov	x0,	#0	// Sets return code to 0
	mov	x8,	#93	// Service command code 93 terminates
	svc	0	// Call linux to terminate the program
	.end
