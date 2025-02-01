NAME := basic_kernel
kernel := $(NAME).bin
iso := $(NAME).iso

all: $(kernel) $(iso)

linker_script := linker.ld
grub_cfg := grub.cfg
assembly_source_files := $(wildcard *.S)
assembly_object_files := $(patsubst %.S, \
    %.o, $(assembly_source_files))

$(iso): $(kernel) $(grub_cfg)
	mkdir -p isofiles/boot/grub
	cp $(kernel) isofiles/boot/kernel.bin
	cp $(grub_cfg) isofiles/boot/grub
	grub-mkrescue -o $(iso) isofiles 2> /dev/null
	rm -r isofiles

$(kernel): $(assembly_object_files) $(linker_script)
	ld -melf_i386 -T $(linker_script) -o $(kernel) $(assembly_object_files)

%.o: %.S
	nasm -f elf32 $< -o $@

clean:
	rm -rf build $(assembly_object_files) $(kernel) $(iso)

run: $(iso)
	qemu-system-i386 -cdrom $(iso) -display none -serial stdio
