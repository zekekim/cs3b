//
// Ezekiel Kim
// RASM-1
// Program to Perform Operations on 4 inputted numbers.
// Ezekiel Kim
// /2023
//
	.global _start // Provide program starting address

	.data
		szName:	.asciz	" Name: Ezekiel Kim"
		szClas:	.asciz	"Class: CS 3B"
		szLab:	.asciz	"  Lab: RASM1"
		szDate:	.asciz	" Date: 8/23/2018"
		szMsg1:	.asciz	"Enter a whole number: "
		szMsg2:	.asciz	"The address of the 4 ints: "
		szOpp:	.asciz	"("
		szClp:	.asciz	")"
		szAdd:	.asciz	" + "
		szSub:	.asciz	" - "
		szEq:	.asciz	" = "
		szSp:	.asciz	"   "
		szA:	.skip	21
		szB:	.skip	21
		szC:	.skip	21
		szD:	.skip	21
		szPa:	.skip	21
		szPb:	.skip	21
		szPc:	.skip	21
		szPd:	.skip	21
		szSum:	.skip	21
		dbA:	.quad	0
		dbB:	.quad	0
		dbC:	.quad	0
		dbD:	.quad	0
		dbSum:	.quad	0
		chCr:	.byte	10

	.text

_start:
// Print header
	ldr	x0,	=szName // Store name to be printed
	bl	putstring	// Print name
	ldr	x0,	=chCr	// Store carriage return to be printed
	bl	putch	// Print carriage return
	ldr	x0,	=szClas // Store Class to be printed
	bl	putstring	// Print Class
	ldr	x0,	=chCr	// Store carriage return to be printed
	bl	putch	// Print carriage return
	ldr	x0,	=szLab	// Store Lab to be printed
	bl	putstring	// Print Lab
	ldr	x0,	=chCr	// Store carriage return to be printed
	bl	putch	// Print carriage return
	ldr	x0,	=szDate	// Store Date to be printed
	bl	putstring	// Print date
	ldr	x0,	=chCr	// Store carriage return to be printed
	bl	putch	// print carriage return
	ldr	x0,	=chCr	// Store carriage return to be printed
	bl	putch		// print carriage return

// Start getting values for A,B,C,D
	mov	x1, 	#21	// Every string will be storing 21 bytes
// Get user input for A
	ldr	x0,	=szMsg1	// Add message to prompt user for input
	bl	putstring	// Prompt user for input
	ldr	x0,	=szA	// Set input variable as pointer to string A
	bl	getstring	// Get user input
// Get user input for B
	ldr	x0,	=szMsg1	// Add message to prompt user for input
	bl	putstring	// Prompt user for input
	ldr	x0,	=szB	// Set input variable as pointer to string B
	bl	getstring	// Get user input
// Get user input for C
	ldr	x0,	=szMsg1	// Add message to prompt user for input
	bl	putstring	// Prompt user for input
	ldr	x0,	=szC	// Set input variable as pointer to string C
	bl	getstring	// Get user input
// Get user input for D
	ldr	x0,	=szMsg1	// Add message to prompt user for input
	bl	putstring	// Prompt user for input
	ldr	x0,	=szD	// Set input variable as pointer to string D
	bl	getstring	// Get user input

// Now convert string A,B,C,D to integers in respective db variables
// Initialize dbA using ascint64 and store pointer value
	ldr	x0,	=szA	// Load szA to be converted
	bl	ascint64	// Call conversion
	ldr	x1,	=dbA	// Load dbA to store value
	str	x0,	[x1]	// Store value in dbA
	mov	x0,	x1	// Loads address of A
	ldr	x1,	=szPa	// Loads x1 as string to receive pointer value
	bl	int64asc	// Converts address to string
// Initialize dbB using ascint64 and store pointer value
	ldr	x0,	=szB	// Load szB to be converted
	bl	ascint64	// Call conversion
	ldr	x1,	=dbB	// Load dbB to store value
	str	x0,	[x1]	// Store value in dbB
	mov	x0,	x1	// Loads address of B
	ldr	x1,	=szPb	// Loads x1 as string to receive pointer value
	bl	int64asc	// Converts address to string
// Initialize dbC using ascint64 and store pointer value
	ldr	x0,	=szC	// Load szC to be converted
	bl	ascint64	// Call conversion
	ldr	x1,	=dbC	// Load dbC to store value
	str	x0,	[x1]	// Store value in dbC
	mov	x0,	x1	// Loads address of C
	ldr	x1,	=szPc	// Loads x1 as string to receive pointer value
	bl	int64asc	// Converts address to string
// Initialize dbD using ascint64 and store pointer value
	ldr	x0,	=szD	// Load szD to be converted
	bl	ascint64	// Call conversion
	ldr	x1,	=dbD	// Load dbD to store value
	str	x0,	[x1]	// Store value in dbD
	mov	x0,	x1	// Loads address of D
	ldr	x1,	=szPd	// Loads x1 as string to receive pointer value
	bl	int64asc	// Converts address to string

// Setup for addition
	ldr	x0,	=dbA	// Load dbA
	ldr	x0,	[x0]	// Dereference
	ldr	x1,	=dbB	// Load dbB
	ldr	x1,	[x1]	// Dereference
	ldr	x2,	=dbC	// Load dbC
	ldr	x2,	[x2]	// Dereference
	ldr	x3,	=dbD	// Load dbD
	ldr	x3,	[x3]	// Dereference
// Add the values and store to dbSum
	add	x0,	x0,	x1	// Add dbA and dbB
	add	x2,	x2,	x3	// Add dbC and dbD
	sub	x0,	x0,	x2	// Subtract sums
	ldr	x1,	=dbSum	// Load x1 with result
	str	x0,	[x1]	// Store result in dbSum
// Convert result into string
	ldr	x1,	=szSum	// Load x1 with result string
	bl	int64asc	// Convert result into string szR

// Print operations statement
	ldr	x0,	=szOpp	// Load open paren to be printed
	bl	putstring	// Print open paren
	ldr	x0,	=szA	// Load string A to be printed
	bl	putstring	// Print string A
	ldr	x0,	=szAdd	// Load string add to be printed
	bl	putstring	// Print add symbol
	ldr	x0,	=szB	// Load string B to be printed
	bl	putstring	// Print string B
	ldr	x0,	=szClp	// Load	closed paren to be printed
	bl	putstring	// Print closed paren
	ldr	x0,	=szSub	// Load string sub to be printed
	bl	putstring	// Print subtract symbol
	ldr	x0,	=szOpp	// Load open paren to be printed
	bl	putstring	// Print open paren
	ldr	x0,	=szC	// Load string C to be printed
	bl	putstring	// Print string C
	ldr	x0,	=szAdd	// Load string add to be printed
	bl	putstring	// Print add symbol
	ldr	x0,	=szD	// Load string D to be printed
	bl	putstring	// Print string	D
	ldr	x0,	=szClp	// Load closed paren to be printed
	bl	putstring	// Print closed paren
	ldr	x0,	=szEq	// Load string eq to be printed
	bl	putstring	// Print equal symbol
	ldr	x0,	=szSum	// Load string sum to be printed
	bl	putstring	// Print string sum
	ldr	x0,	=chCr	// Load carriage return
	bl	putch		// Carriage Return

// Print memory addresses for dbs
	ldr	x0,	=szMsg2	// Load szMsg2 to be printed
	bl	putstring	// Print szMsg2
	ldr	x0,	=chCr	// Load Carriage return to be printed
	bl	putch		// Print Carriage Return
	ldr	x0,	=szPa	// Load pointer A string to be printed
	bl	putstring	// Print pointer A
	ldr	x0,	=szSp	// Load spacer to be printed
	bl	putstring	// Print spacer 
	ldr	x0,	=szPb	// Load pointer B string to be printed
	bl	putstring	// Print pointer B
	ldr	x0,	=szSp	// Load spacer to be printed
	bl	putstring	// Print spacer
	ldr	x0,	=szPc	// Load pointer C string to be printed
	bl	putstring	// Print pointer C
	ldr	x0,	=szSp	// Load spacer to be printed
	bl	putstring	// Print spacer
	ldr	x0,	=szPd	// Load pointer D string to be printed
	bl	putstring	// Print pointer D
	ldr	x0,	=chCr	// Load carriage return
	bl	putch		// Print carriage return

// Setup the parameters to exit the program and then call Linux to do it.
	mov	x0,	#0	// Sets return code to 0
	mov	x8,	#93	// Service command code 93 terminates
	svc	0	// Call linux to terminate the program
	.end
