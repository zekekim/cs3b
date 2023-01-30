//
// Ezekiel Kim
// Lab 3
// Program to print two strings szMsg1 and szMsg2
// Ezekiel Kim
// 1/29/2023
//
	.global _start // Provide program starting address

	.data
	szMsg1: .asciz "The sun did not shine."
	szMsg2: .asciz "It was too wet to play."
	chCr: .byte 10

	.text

// Prints first string
_start:	ldr 	X0,	=szMsg1	// Register 0 now contains null-terminated string szMsg1
	bl	putstring	// Calls the function
// Prints second string
	ldr	X0,	=szMsg2	// Register 0 now contains null-terminated string szMsg2
	bl	putstring	// Calls the function
// Setup the parameters to exit the program and then call Linux to do it.
	mov	x0,	#0	// Sets return code to 0
	mov	x8,	#93	// Service command code 93 terminates
	svc	0	// Call linux to terminate the program
	.end
