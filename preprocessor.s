



#
# _preprocessor invokes the preprocessor
#
# Arguments
# x0		Pointer to start of file 
# x1		File length
#
# Return
# void
#
#


.text
.extern prints
.global _preprocessor
_preprocessor:
	
	stp fp, lr, [sp, #-0x10]!
	mov fp, sp

	


	ldp fp, lr, [sp], #0x10
	ret


