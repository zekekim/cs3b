//
// Ezekiel Kim
// Lab 4
// Program to find the sum of two Ascii integers
// Ezekiel Kim
// 1/29/2023
//
	.global _start // Provide program starting address

	.data
		szX: 	.asciz "10"
		szY: 	.asciz "15"
		dbX: 	.quad 0
		dbY: 	.quad 0
		dbSum: 	.quad 0
		szAdd: 	.asciz " + "
		szEq:	.asciz " = "
		szSum:  .skip 21	
		chCr:	.asciz "\n"

	.text

// Convert the first ascii string to integer
_start:
	ldr	x0,	=szX	// Loads szX to x0 register
	ldr	x1,	=dbX	// Loads dbX to x1 register
	bl	ascint64	// Call the ascint64 to convert the value to integer
	str	x0,	[x1]	// Stores result in dbX
// Convert the second ascii string to integer
	ldr	x0,	=szY	// Loads szY to x0 register
	ldr	x1,	=dbY	// Loads dbY to x1 register
	bl	ascint64	// Call the ascint64 to convert the value to integer
	str	x0,	[x1]	// Stores result in dbY
// Sum the two values in dbSum
	ldr	x0,	=dbSum	// Loads dbSum to x0 register
	ldr	x1,	=dbX	// Loads dbX to x1 register
	ldr	x1,	[x1]	// Dereference dbX
	ldr	x2,	=dbY	// Loads dbY to x2 register
	ldr	x2,	[x2]	// Dereference dbY
	add	x1,	x1,	x2	// Adds the two values and stores in x1
	str	x1,	[x0]	// Set dbSum to x1
// Convert to string from int
	ldr	x0,	[x0]	// Dereference int64 value
	ldr	x1,	=szSum	// Sets string to be stored 
	bl	int64asc	// Calls function to convert, result is stored in szSum
// Print the statement
	ldr	x0,	=szX	// Load szX to print
	bl 	putstring	// Print szX
	ldr	x0,	=szAdd	// Load szAdd to print
	bl	putstring	// Print szAdd
	ldr	x0,	=szY	// Load szY to print
	bl	putstring	// Print szY
	ldr 	x0,	=szEq	// Load szEq to print
	bl	putstring	// Print szEq
	ldr	x0,	=szSum	// Load szSum to print
	bl	putstring	// Print szSum
	ldr	x0,	=chCr	// Load szNl to print
	bl	putstring	// Print szNl
// Setup the parameters to exit the program and then call Linux to do it.
	mov	x0,	#0	// Sets return code to 0
	mov	x8,	#93	// Service command code 93 terminates
	svc	0	// Call linux to terminate the program
	.end
