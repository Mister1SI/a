.data
	msg: .asciz "Hello\n"

.bss
	filename: .skip 4096

.text
.global _start
.global z_end
.extern _prints
.extern _print_help
.extern _preprocessor

_start:
	
	ldp x0, x1, [sp]		// Load argc (x0) and argv (x1)
	cmp x0, #1				// Check for 0 args
	b.ne arg_ne_1			// If argc != 1 jump to reading the file
	adr x30, z_end			// Change link register to z_end
	b _print_help			// Jump to _print_help, lr wil return to z_end
	
	arg_ne_1:				// File supplied; open, read, and mmap
	ldr w2, [x1]			// Load the first element of argv

	mov x0, x2				// Print the argument
	bl _prints


	z_end:
	mov x8, #93
	mov x0, xzr
	svc #0

	

