//
// Ezekiel Kim
// Lab 9
// Program to change number from big to little endian
// Ezekiel Kim
// /2023
//
	.global _start // Provide program starting address

	.data

	.text

_start:
	ldr	x0,	=0x123456789ABCDEF0	// Initialize Number
	
	// Get first byte
	mov	x2,	x0
	lsl	x2,	x2,	#56
	add	x1,	x1,	x2

	// Get second byte
	mov	x2,	x0
	lsr	x2,	x2,	#8
	lsl	x2,	x2,	#56
	lsr	x2,	x2,	#8
	add	x1,	x1,	x2

	// Get third byte
	mov	x2,	x0	
	lsr	x2,	x2,	#16
	lsl	x2,	x2,	#56
	lsr	x2,	x2,	#16
	add	x1,	x1,	x2

	// Get fourth byte
	mov	x2,	x0
	lsr	x2,	x2,	#24
	lsl	x2,	x2,	#56
	lsr	x2,	x2,	#24
	add	x1,	x1,	x2

	// Get fifth byte
	mov	x2,	x0
	lsr	x2,	x2,	#32
	lsl	x2,	x2,	#56
	lsr	x2,	x2,	#32
	add	x1,	x1,	x2

	// Get 6th byte
	mov	x2,	x0
	lsr	x2,	x2,	#40
	lsl	x2,	x2,	#56
	lsr	x2,	x2,	#40
	add	x1,	x1,	x2

	// Get 7th byte
	mov	x2,	x0
	lsr	x2,	x2,	#48
	lsl	x2,	x2,	#56
	lsr	x2,	x2,	#48
	add	x1,	x1,	x2

	// Get 8th byte
	mov	x2,	x0
	lsr	x2,	x2,	#56
	lsl	x2,	x2,	#56
	lsr	x2,	x2,	#56
	add	x1,	x1,	x2

	
// Setup the parameters to exit the program and then call Linux to do it.
	mov	x0,	#0	// Sets return code to 0
	mov	x8,	#93	// Service command code 93 terminates
	svc	0	// Call linux to terminate the program
	.end
