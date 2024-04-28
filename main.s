.data
	msg: .asciz "Hello\n"

.text
.global _start
.global z_end
.extern prints
.extern _print_help

_start:
	
	ldp x0, x1, [sp]		// Load argc (x0) and argv (x1)
	cmp x0, #1				// Check for 0 args
	b.ne arg_gt_1
	adr x30, z_end			// Change link register to z_end
	b _print_help
	arg_gt_1:

	adr x0, msg
	bl prints


	z_end:
	mov x8, #93
	mov x0, xzr
	svc #0

	

