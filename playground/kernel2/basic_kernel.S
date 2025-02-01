global start

MULTIBOOT2_HEADER_MAGIC equ 0xe85250d6
GRUB_MULTIBOOT_ARCHITECTURE_I386 equ 0
MULTIBOOT_HEADER_TAG_END  equ 0

; check README for multiboot header definition
section .multiboot_header
header_start:
	dd MULTIBOOT2_HEADER_MAGIC 
	dd GRUB_MULTIBOOT_ARCHITECTURE_I386
	dd header_end - header_start
	dd -(MULTIBOOT2_HEADER_MAGIC + GRUB_MULTIBOOT_ARCHITECTURE_I386 + (header_end - header_start))

	framebuffer_tag_end:
	dw MULTIBOOT_HEADER_TAG_END 
	dw 0 
	dd 8
header_end:

section .text								

%macro __disp 1
	mov dx, 0x3f8
	mov al, %1
	out dx, al
%endmacro

start:
	__disp 0x41

	hlt
