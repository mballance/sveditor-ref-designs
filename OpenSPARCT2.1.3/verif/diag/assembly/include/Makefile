all : interrupt0x60

interrupt0x60: interrupt0x60_defines.h interrupt0x60_handler.s interrupt0x60_sys_init.s

interrupt0x60_defines.h: interrupt0x60_defines.h.pal
	pal -o interrupt0x60_defines.h interrupt0x60_defines.h.pal

interrupt0x60_handler.s: interrupt0x60_handler.s.pal
	pal -o interrupt0x60_handler.s interrupt0x60_handler.s.pal

interrupt0x60_sys_init.s: interrupt0x60_sys_init.s.pal
	pal -o interrupt0x60_sys_init.s interrupt0x60_sys_init.s.pal
