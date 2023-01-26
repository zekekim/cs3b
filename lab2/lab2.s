//
// Ezekiel Kim
// Lab 2
// Program to run 192-Bit addition with the ADDS/ADCS/ADC instructions.
// Ezekiel Kim
// 1/25/2023
//
	.global _start // Privode program starting address

	.data

	.text

// Load the registers with some data
// First 192-Bit number is 0xFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
_start: MOV	X3,	#0xFFFFFFFFFFFFFFFF	// Lower order 64-Bits
	MOV	X4,	#0xFFFFFFFFFFFFFFFF	// Middle order 64-Bits
	MOV	X5,	#0xFFFFFFFFFFFFFFFF	// Upper order 64-Bits
// Second 192-Bit number is 0xFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
	MOV	X6,	#0xFFFFFFFFFFFFFFFF	// Lower order 64-Bits
	MOV	X7,	#0xFFFFFFFFFFFFFFFF	// Middle order 64-Bits
	MOV	X8,	#0xFFFFFFFFFFFFFFFF	// Upper order 64-Bits	
// Add the Order of Bits
	ADDS	X2,	X3,	X6	// Lower order 64-Bits
	ADCS	X1, 	X4, 	X7	// Middle order 64-Bits
	ADC	X0, 	X5, 	X8	// Upper order 64-Bits
// Setup the parameters to exit the program and then call Linux to do it.
// W0 is the return code and will be what we calculated above.
	MOV	X8,	#93	// Service command code 93 terminates
	SVC	0	// Call linux to terminate the program
	.end
