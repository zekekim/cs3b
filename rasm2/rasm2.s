//
// Ezekiel Kim
// RASM-2
// Program to perform operations on two numbers
// Ezekiel Kim
// /2023
//
	.global _start // Provide program starting address

	.data
		dbA:	.quad	0
		dbB:	.quad	0
		dbSum:	.quad	0
		dbDiff:	.quad	0
		dbProd:	.quad	0
		dbQuot:	.quad	0
		dbRem:	.quad	0
		szA:	.skip	21
		szB:	.skip	21
		szSum:	.skip	21
		szDiff:	.skip	21
		szProd:	.skip	21
		szQuot:	.skip	21
		szRem:	.skip	21
		szPmtA:	.asciz	"Enter your first number:   "
		szPmtB:	.asciz	"Enter your second number:  "
		szPmtSum:	.asciz	"The sum is "
		szPmtDiff:	.asciz	"The difference is "
		szPmtProd:	.asciz	"The product is "
		szPmtQuot:	.asciz	"The quotient is "
		szPmtRem:	.asciz	"The remainder is "
		szDivByZero:	.asciz	"You cannot divide by 0. Thus, there is no quotient or remainder\n"
		szOverflowAdd:	.asciz	"OVERFLOW occured when ADDING\n"
		szOverflowSub:	.asciz	"OVERFLOW occured when SUBTRACTING\n"
		szErrorMul:	.asciz	"RESULT OUTSIDE ALLOWABLE 64 BIT SIGNED INTEGERE RANGE WHEN MULTIPLYING\n"
		szInvalidString:	.asciz	"INVALID NUMERIC STRING. RE-ENTER VALUE\n"
		szInvalidInteger:	.asciz	"NUMBER OUTSIDE ALLOWABLE 64 BIT SIGNED INTEGER RE-ENTER VALUE:\n"
		szGoodbye:		.asciz	"Thanks for using my program!! Good day!"
		iLimitNum:	.word	21
		chCr:	.byte	10
		
	.text

_start:

promptA:
	ldr	x0,	=szPmtA	// Prompt user for A
	bl	putstring	// Print prompt for A
	ldr	x0,	=szA	// Load address of A
	bl	getstring	// Get A value as string
	ldr	x0,	=szA	// Load address of A
	ldrb	w0,	[x0]	// Dereference
	cmp	w0,	#0	// Check if user inputs 0
	b.eq	end		// If user inputs CR, end the program.
	bl	stringACheck	// Always check if the string is valid to convert.
	ldr	x0,	=szA	// Load address of A
	bl	ascint64	// Convert the value to quad
	ldr	x1,	=dbA	// Load address of A quad
	str	x0,	[x1]	// Store the quad in dbA
	b.vs	inputAOverflow	// Jump to overflow handling
	b	promptB		// Jump to B prompt


stringACheck:
	ldr	x1,	=szA	// Load adress of string A
	mov	x0,	#0	// i = 0
	ldrb	w3,	[x1,	#20]	// Check last character
	cmp	w3,	#0		// Check if 0
	b.ne	aLengthError		// Buffer is too long
	ldrb	w2,	[x1,	x0]	// Check for hyphen for negative
	cmp	w2,	#'-'		// If it is a hyphen...
	b.eq	hyphenCheckA		// Go to hyphenCheckA
	stringACheckLoop:
		ldrb	w2,	[x1,	x0]	// Loads first byte into w3
		// Now need to check if 48 <= x <= 57
		cmp	w2,	#0		// Check if reached end of string
		b.eq	checkADone		// Goes back to promptA
		cmp	w2,	#'0'		// Check if less than 0
		b.lo	stringAError		// Jump to string error
		cmp	w2,	#'9'		// Compare with 57
		b.hi	stringAError		// Jump to string error
		add	x0,	x0,	#1	// Add 1 to x0
		b.ne	stringACheckLoop	// Loop until completed

hyphenCheckA:
	add	x0,	x0,	#1		// Add to avoid first index
	b	stringACheckLoop

stringAError:
	ldr	x0,	=szInvalidString	// Load invalid string message
	bl	putstring			// Print invalid string message
	b	promptA				// Prompt user again

inputAOverflow:
	ldr	x0,	=szInvalidInteger	// Load invalid integer message
	bl	putstring			// Print invalid integer message
	b	promptA				// Prompt user again

aLengthError:
	ldr	x0,	=szInvalidInteger	// Print error
	bl	putstring			// Print error
	b	promptA				// Prompt user again

checkADone:
	ret
	
promptB:
	ldr	x0,	=szPmtB	// Prompt user for B
	bl	putstring	// Print prompt for B
	ldr	x0,	=szB	// Load address of B
	bl	getstring	// Get B value as string
	ldr	x0,	=szB	// Load address of B
	ldrb	w0,	[x0]	// Get first byte
	cmp	w0,	#0	// Check if user inputs 0
	b.eq	end		// If user inputs CR, end the program.
	bl	stringBCheck	// Blways check if the string is valid to convert.
	ldr	x0,	=szB	// Load address of B
	bl	ascint64	// Convert the value to quad
	ldr	x1,	=dbB	// Load address of B quad
	str	x0,	[x1]	// Store the quad in dbB
	b.vs	inputBOverflow	// Jump to overflow handling
	b	sum		// Jump to sum


stringBCheck:
	ldr	x1,	=szB	// Load adress of string B
	mov	x0,	#0	// i = 0
	ldrb	w3,	[x1,	#20]	// Check last character
	cmp	w3,	#0		// Check if 0
	b.ne	bLengthError		// Buffer is too long
	ldrb	w2,	[x1,	x0]	// Check for hyphen for negative
	cmp	w2,	#'-'		// If it is a hyphen...
	b.eq	hyphenCheckB		// Go to hyphenCheckA

	stringBCheckLoop:
		ldrb	w2,	[x1,	x0]	// Loads first byte into w3
		// Now need to check if 48 <= x <= 57
		cmp	w2,	#0		// Check if reached end of string
		b.eq	checkBDone		// Goes back to promptB
		cmp	w2,	#'0'		// Check if less than 0
		b.lo	stringBError		// Jump to string error
		cmp	w2,	#'9'		// Compare with 57
		b.hi	stringBError		// Jump to string error
		add	x0,	x0,	#1	// Add 1 to x0
		b.ne	stringBCheckLoop	// Loop until completed

hyphenCheckB:
	add	x0,	x0,	#1		// Add to avoid first index
	b	stringBCheckLoop

stringBError:
	ldr	x0,	=szInvalidString	// Load invalid string message
	bl	putstring			// Print invalid string message
	b	promptB				// Prompt user again

inputBOverflow:
	ldr	x0,	=szInvalidInteger	// Load invalid integer message
	bl	putstring			// Print invalid integer message
	b	promptB				// Prompt user again

bLengthError:
	ldr	x0,	=szInvalidInteger	// Print error
	bl	putstring			// Print error
	b	promptB				// Prompt user again

checkBDone:
	ret

sum:
	ldr	x0,	=dbA			// Load A integer
	ldr	x0,	[x0]			// Dereference
	ldr	x1,	=dbB			// Load B integer
	ldr	x1,	[x1]			// Dereference
	adds	x0,	x0,	x1		// Add both values and store in x0
	b.vs	sumOverflow			// Check for sum overflow
	ldr	x2,	=dbSum			// Load Sum integer
	str	x0,	[x2]			// Store integer into dbSum
	ldr	x1,	=szSum			// Load Sum string
	bl 	int64asc			// Convert sum to string
	ldr	x0,	=szPmtSum		// Load sum prompt
	bl	putstring			// Print sum prompt
	ldr	x0,	=szSum			// Load sum string
	bl	putstring			// Print sum string
	ldr	x0,	=chCr			// Load chCr
	bl	putch				// Print CR
	b	difference			// Move onto difference calc

sumOverflow:
	ldr	x0,	=szOverflowAdd		// Add error message
	bl	putstring			// print error message
	b	difference			// Move onto difference calc

difference:
	ldr	x0,	=dbA			// Load A integer
	ldr	x0,	[x0]			// Dereference
	ldr	x1,	=dbB			// Load B integer
	ldr	x1,	[x1]			// Dereference
	subs	x0,	x0,	x1		// Subtract both values and store in x0
	b.vs	diffOverflow			// If overflow go to handling
	ldr	x2,	=dbDiff			// Load Diff integer
	str	x0,	[x2]			// Store integer into dbDiff
	ldr	x1,	=szDiff			// Load Diff string
	bl 	int64asc			// Convert sum to string
	ldr	x0,	=szPmtDiff		// Load sum prompt
	bl	putstring			// Print sum prompt
	ldr	x0,	=szDiff			// Load sum string
	bl	putstring			// Print sum string
	ldr	x0,	=chCr			// Load chCr
	bl	putch				// Print CR
	b	product				// Move onto product calc

diffOverflow:
	ldr	x0,	=szOverflowSub		// Add error message
	bl	putstring			// Print error message
	b	product				// Move onto product calculator

product:
	ldr	x0,	#0			// Index for loop
	ldr	x1,	=dbA			// Load A integer
	ldr	x1,	[x1]			// Dereference
	ldr	x2,	=dbB			// Load B integer
	ldr	x2,	[x2]			// Dereference
	ldr	x3,	#0			// Instantiate product
	smulh	x3,	x1,	x2		// Check for overflow
	cmp	x3,	#0			// Check CMP
	b.gt	productOverflow			// Check if product is overflowed
	mul	x3,	x1,	x2		// Multiply
	ldr	x4,	=dbProd			// Load dbProd address
	str	x3,	[x4]			// Store value into dbProd
	mov	x0,	x3			// Move value into x0 register
	ldr	x1,	=szProd			// Load product string
	bl	int64asc			// Convert to ascii
	ldr	x0,	=szPmtProd		// Load product prompt
	bl	putstring			// Print product prompt
	ldr	x0,	=szProd			// Load product string
	bl	putstring			// Print product string
	ldr	x0,	=chCr			// Load CR
	bl	putch				// Print CR
	b	quotient			// Go to quotient

productOverflow:
	ldr	x0,	=szErrorMul		// Print multiply error
	bl	putstring			// Print multiply error
	b	quotient			// Move onto quotient

quotient:
	ldr	x0,	#0			// Index for loop
	ldr	x1,	=dbA			// Load A integer
	ldr	x1,	[x1]			// Dereference
	ldr	x2,	=dbB			// Load B integer
	ldr	x2,	[x2]			// Dereference
	cmp	x2,	#0			// Find if divisor is 0
	b.eq	divideByZero			// Handle divide by zero
	ldr	x3,	#0			// Initialize quotient
	ldr	x4,	#0			// Initialize product to find remainder
	ldr	x5,	#0			// Initialize remainder
	sdiv	x3,	x1,	x2		// Find quotient
	mul	x4,	x3,	x2		// Find multiplied by quotient
	sub	x5,	x1,	x4		// Find remainder
	ldr	x0,	=dbQuot			// Load quotient
	str	x3,	[x0]			// Store into quotient
	ldr	x0,	=dbRem			// Load remainder
	str	x5,	[x0]			// Store into remainder
	ldr	x0,	=dbQuot			// Load quotient
	ldr	x0,	[x0]			// Dereference
	ldr	x1,	=szQuot			// Load quotient string address
	bl	int64asc			// Convert to string
	ldr	x0,	=dbRem			// Load remainder
	ldr	x0,	[x0]			// Dereference
	ldr	x1,	=szRem			// Load remainder string address
	bl	int64asc			// Convert to string
	ldr	x0,	=szPmtQuot		// Load quotient prompt
	bl	putstring			// Print string
	ldr	x0,	=szQuot			// Load quotient address
	bl	putstring			// Print quotient
	ldr	x0,	=chCr			// Load CR
	bl	putch				// Print CR
	ldr	x0,	=szPmtRem		// Load remainder prompt
	bl	putstring			// Print prompt
	ldr	x0,	=szRem			// Load remainder string
	bl	putstring			// Print prompt
	ldr	x0,	=chCr			// Load CR
	bl	putch				// Print CR
	ldr	x0,	=chCr			// Load CR
	bl	putch				// Print CR
	b	promptA				// Go to end
	
divideByZero:
	ldr	x0,	=szDivByZero		// Divide by Zero Error String
	bl	putstring			// Print string
	ldr	x0,	=chCr			// Load CR
	bl	putch				// Print CR
	b	promptA				// Go to end

end:
	ldr	x0,	=chCr			// Load CR
	bl	putch				// Print CR
	ldr	x0,	=szGoodbye		// Print goodbye string
	bl	putstring			// Print string
	ldr	x0,	=chCr			// Load CR
	bl	putch				// Print CR
	ldr	x0,	=chCr			// Load CR
	bl	putch				// Print CR
// Setup the parameters to exit the program and then call Linux to do it.
	mov	x0,	#0	// Sets return code to 0
	mov	x8,	#93	// Service command code 93 terminates
	svc	0	// Call linux to terminate the program
	.end
