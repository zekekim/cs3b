//
// Ezekiel Kim
// Lab 14
// Subroutine to find the factorial
// Ezekiel Kim
// 3/7/2023
//
	.global fact // Provide program starting address

	.data

	.text

fact:
	stp	x29,	x30,	[sp, #-16]!	// Save x29 and x30 on the stack
	stp	x19,	x20,	[sp, #-16]!	// Save x19 and x20 on the stack

	cmp	x0,	#0	// Check if x0 is 0
	b.eq	return
	mov	x19,	x0	// Store x0 into x19
	sub	x0,	x0,	#1	// Subtract 1 from x0
	bl	fact			// 
	mul	x0,	x19,	x0	// Return n * fact(n-1)
	bl	end

return:
	mov	x0,	#1	// Store 1 into x0
	bl	end

end:
	ldp	x19,	x20,	[sp],	#16	// Load back onto registers x19 and x20
	ldp	x29,	x30,	[sp],	#16	// Load back onto registers x29 and x30
	ret

	.end
