.data
	help_text: .asciz "Super useful help text\nBanana monkeys\nasdriyoufghyuioadsefrhfgou8iedigho\n"


.text
.extern _prints
.global _print_help
_print_help:
	
	stp fp, lr, [sp, #-0x10]!
	mov fp, sp

	adr x0, help_text
	bl _prints


	ldp fp, lr, [sp], #0x10
	ret

