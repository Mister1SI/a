
# prints
# Same as C puts() but without auto-newline
#
# Arguments
# x0	char* to string
#
# Clobbers
# x16	working register for byte comaprison
#


.section .text
.global _prints
_prints:
	# Prologue
	stp fp, lr, [sp, #-0x30]!
	stp x0, x1, [sp, #0x10]
	stp x2, x8, [sp, #0x20]
	mov fp, sp

	# Set up syscall registers
	mov x1, x0 		// Move pointer into x1 for syscall
	mov x0, #1		// stdout
	mov x2, #1		// Print one byte at a time
	mov x8, #64		// Write syscall

	loop:
	mov x16, xzr			// Clear x16
	ldrb w16, [x1]			// Load the byte in question
	cmp x16, #0				// Check for null byte
	b.eq exit				// End if null byte
	svc #0					// Print
	add x1, x1, #1
	b loop					// Branch to check next byte

	# Epilogue
	exit:
	ldp x0, x1, [sp, #0x10]
	ldp x2, x8, [sp, #0x20]
	ldp fp, lr, [sp], #0x30
	ret


