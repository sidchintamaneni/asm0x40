global start

MAGIC_NUMBER equ 0x1BADB002
FLAGS		 equ 0x0
CHECKSUM	 equ -MAGIC_NUMBER


section .text:								
align 4								; The code is 4 byte aligned -> why?
	dd MAGIC_NUMBER
	dd FLAGS
	dd CHECKSUM

%macro __disp 1
	mov dx, 0x3f8
	mov al, %1
	out dx, al
%endmacro

start:
	__disp 0x41

	hlt
