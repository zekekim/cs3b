

.global String_toUpperCase
String_toUpperCase:
	stp	x19,	x20,	[sp, #-16]!
	stp	x29,	x30,	[sp, #-16]!
	mov	x19,	x0
	bl	String_length
	bl	malloc
	mov	x20,	x0
	mov	x1,	#0
	
	String_to_UpperCase_loop:
		ldrb	w0,	[x19],	#1
		cmp	x0,	#0
		b.eq	end
		cmp	x0,	#'a'
		b.ge	toUpper
		b	store

	toUpper:
		sub	x0,	x0,	#32
		b	store
	
	store:
		strb	w0,	[x20,	x1]
		add	x1,	x1,	#1
		b	String_to_UpperCase_loop

	end:
		strb	w0,	[x20,	x1]	
		mov	x0,	x20
		ldp	x29,	x30,	[sp],	#16
		ldp	x19,	x20,	[sp],	#16
		ret


.global String_copy
String_copy:
	stp	x19,	x20,	[sp, #-16]!
	stp	x29,	x30,	[sp, #-16]!
	mov	x19,	x0
	bl	String_length
	bl	malloc
	mov	x20,	x0
	mov	x1,	#0
	
	String_copy_loop:
		ldrb	w0,	[x19],	#1
		cmp	x0,	#0
		b.eq	String_copy_end
		strb	w0,	[x20,	x1]
		add	x1,	x1,	#1
		b	String_copy_loop

	String_copy_end:
		strb	w0,	[x20,	x1]	
		mov	x0,	x20
		ldp	x29,	x30,	[sp],	#16
		ldp	x19,	x20,	[sp],	#16
		ret

