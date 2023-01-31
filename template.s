//
// Ezekiel Kim
// Lab {#}
// Program to ...
// Ezekiel Kim
// /2023
//
	.global _start // Provide program starting address

	.data

	.text

_start:
// Setup the parameters to exit the program and then call Linux to do it.
	mov	x0,	#0	// Sets return code to 0
	mov	x8,	#93	// Service command code 93 terminates
	svc	0	// Call linux to terminate the program
	.end
