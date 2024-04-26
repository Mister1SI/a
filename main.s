.data
	msg: .asciz "Hello\n"


.text
.global _start
.extern prints
_start:
	
	adr x0, msg
	bl prints

	mov x8, #93
	mov x0, xzr
	svc #0

