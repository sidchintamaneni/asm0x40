ENTRY(start)

SECTIONS {
	. = 0x00100000;

	.boot :
	{
		KEEP(*(.multiboot_header))
	}

	.text ALIGN(0x1000) :
	{
		*(.text)
	}
}
