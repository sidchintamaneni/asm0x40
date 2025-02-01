all: asm link

clean:
	rm -rf *.o kernel

asm:
	nasm -f elf32 basic_kernel.S -o kernel.o

link:
	ld -melf_i386 -T linker.ld kernel.o -o kernel

run:
	qemu-system-i386 -kernel kernel -display none -serial stdio
