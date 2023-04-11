/* Macro name: PUSH
 * Purpose: Stores registers through the Stack Pointer
 * Parameters:
 * reg - The register to store
 */
.MACRO PUSH reg
	STR \reg,[SP,#-16]! //Stores the register
.ENDM

/* Macro name: POP
 * Purpose: Loads registers through the Stack Pointer
 * Parameters:
 * reg - The register to load
 */
.MACRO POP reg
	LDR \reg,[SP],#16   //Loads the register
.ENDM

