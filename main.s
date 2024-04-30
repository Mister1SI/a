.data
	msg: .asciz "Hello\n"

.bss
	filename: .skip 4096
	cwd: .skip 4096

.text
.global _start
.global z_end
.extern _prints
.extern _print_help
.extern _preprocessor

_start:
	
	ldp x0, x1, [sp]		// Load argc (x0) and the first argument (x1)
	ldp x2, x3, [sp, #0x10]	// Load the second and third arguments
	cmp x0, #1				// Check for 0 args
	b.ne arg_ne_1			// If argc != 1 jump to reading the file
	adr x30, z_end			// Change link register to z_end
	b _print_help			// Jump to _print_help, lr wil return to z_end
	
	arg_ne_1:				// File supplied; open, read, and mmap
	mov x0, x2				// Print the argument
	bl _prints

	mov x8, #17				// getcwd
	adr x0, cwd				// Buffer
	mov x1, #4096			//
	svc #0

	mov x8, #56				// openat
	adr x0, cwd				// dirfd
	mov x1, x2				// Filename
	mov x2, #0x0			// Flags
	mov x3, #0644			// Mode
	svc #0
	mov x19, x0				// Store fd in x19

	mov x8, #222			// mmap
	mov x0, xzr				// Supply no address
	mov x1, xzr				// Length
	mov x2, xzr				// prot
	mov x3, xzr				// flags
	mov x4, x19				// fd
	mov x5, xzr				// offset
	svc #0
	mov x20, x0				// Store void* into x20


	mov x8, #57				// close
	mov x0, x19				// fd
	svc #0

	z_end:
	mov x8, #93
	mov x0, xzr
	svc #0

	

