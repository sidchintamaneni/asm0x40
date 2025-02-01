global start

MAGIC_NUMBER equ 0x1BADB002
FLAGS		 equ 0x0
CHECKSUM	 equ -MAGIC_NUMBER


section .text:								
align 4								; The code is 4 byte aligned -> why?
	dd MAGIC_NUMBER
	dd FLAGS
	dd CHECKSUM

start:
	mov dx, 0x3f8
	mov eax, 0x41
	out dx, al

	hlt
