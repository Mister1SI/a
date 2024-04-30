



#
# _preprocessor invokes the preprocessor
#
# Arguments
# x0		fd
#
# Return
# void
#
#

.bss
	filebuffer: .skip 16384		# File buffer, 16kB


.text
.extern prints
.global _preprocessor
_preprocessor:
	
	stp fp, lr, [sp, #-0x20]!
	stp x19, x20, [sp, #0x10]
	mov fp, sp

	mov x19, x0		# store fd in x19




	ldp x19, x20, [sp, #0x10]
	ldp fp, lr, [sp], #0x20
	ret

_read:
	# x0	fd
	# x1	offset

	stp fp, lr, [sp, #-0x20]!
	stp x19, x20, [sp, #0x10]
	mov fp, sp

	mov x19, x0
	mul x20, x1, #16384

	mov x8, #63
	mov x0, x19
	adr x1, filebuffer
	mov x2, #16384
	svc #0

	ldp x19, x20, [sp, #0x10]
	ldp fp, lr, [sp], #0x20
	ret

