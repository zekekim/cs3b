//
// Ezekiel Kim
// Lab 17
// Program to Read a .txt file
// Ezekiel Kim
// 4/3/2023
//
	.global _start // Provide program starting address

	.data
		szFile: 	.asciz	"input.txt"
		szBuff:		.skip	21
		szCurr:		.skip	21
		chCr:		.byte	10
		dbArr:		.quad	0,0,0,0,0

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
	ldr	x20,	=szCurr
	ldr	x21,	=dbArr
	
	loop:
		// Read the int
		mov	x0,	x19
		mov	x8,	#63
		ldr	x1,	=szBuff
		mov	x2,	#1
		svc	0

		// Compare the current character
		ldr	x0,	=szBuff
		ldrb	w0,	[x0]
		cmp	x0,	#0
		b.eq	done
		cmp	x0,	#10
		b.eq	intFound
		
		// Store the character if no newline or EOF
		strb	w0,	[x20],	#1
		b loop

	intFound:
		// Convert string to int
		ldr	x0,	=szCurr
		bl	ascint64
		
		// Store into array
		str	x0,	[x21],	#8

		// Clear buffer and current int
		ldr	x0,	=szBuff
		mov	x1,	#0
		str	x1,	[x0]
		ldr	x20,	=szCurr
		mov	x1,	#0
		str	x1,	[x0]
		b loop

done:
	// Close the file
	mov	x8,	#57
	svc	0

// Setup the parameters to exit the program and then call Linux to do it.
	mov	x0,	#0	// Sets return code to 0
	mov	x8,	#93	// Service command code 93 terminates
	svc	0	// Call linux to terminate the program
	.end
