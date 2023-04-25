
.global	_start

.data
	szBuff:		.skip	21
	strPtr1:	.quad	0
	strPtr2:	.quad	0
	szMsg1:		.asciz	"Enter String #1: "
	szMsg2:		.asciz	"Enter String #2: "
	szMsg3:		.asciz	"Displaying String #1: "
	szMsg4:		.asciz	"Displaying String #2: "
	szMsgConvert:	.asciz	"Converting to Upper Case ...\n"
	chCr:		.byte	10

.text

_start:
	// Get first string and store
	ldr	x0,	=szMsg1
	bl	putstring
	ldr	x0,	=szBuff
	bl	getstring
	ldr	x0,	=szBuff
	bl	String_copy
	ldr	x1,	=strPtr1
	str	x0,	[x1]

	// Get second string and store
	ldr	x0,	=szMsg2
	bl	putstring
	ldr	x0,	=szBuff
	bl	getstring
	ldr	x0,	=szBuff
	bl	String_copy
	ldr	x1,	=strPtr2
	str	x0,	[x1]

	// Print first message
	ldr	x0,	=szMsg3
	bl	putstring
	ldr	x0,	=strPtr1
	ldr	x0,	[x0]
	bl	putstring
	ldr	x0,	=chCr
	bl	putch

	// Print second message
	ldr	x0,	=szMsg4
	bl	putstring
	ldr	x0,	=strPtr2
	ldr	x0,	[x0]
	bl	putstring
	ldr	x0,	=chCr
	bl	putch
	
	// Print converting to uppercase...
	ldr	x0,	=szMsgConvert
	bl	putstring

	// Convert to upper
	ldr	x0,	=strPtr1
	ldr	x0,	[x0]
	mov	x19,	x0
	bl	String_toUpperCase
	mov	x20,	x0
	mov	x0,	x19
	bl	free
	ldr	x1,	=strPtr1
	mov	x0,	x20
	str	x0,	[x1]
	
	// Convert to upper
	ldr	x0,	=strPtr2
	ldr	x0,	[x0]
	mov	x19,	x0
	bl	String_toUpperCase
	mov	x20,	x0
	mov	x0,	x19
	bl	free
	ldr	x1,	=strPtr2
	mov	x0,	x20
	str	x0,	[x1]

	// Print first message
	ldr	x0,	=szMsg3
	bl	putstring
	ldr	x0,	=strPtr1
	ldr	x0,	[x0]
	bl	putstring
	ldr	x0,	=chCr
	bl	putch

	// Print second message
	ldr	x0,	=szMsg4
	bl	putstring
	ldr	x0,	=strPtr2
	ldr	x0,	[x0]
	bl	putstring
	ldr	x0,	=chCr
	bl	putch

	// Free pointers
	ldr	x0,	=strPtr1
	ldr	x0,	[x0]
	bl	free
	ldr	x0,	=strPtr2
	ldr	x0,	[x0]
	bl	free

.end

