

	//{ userfunction, 0, 0, mem_size, config_mem_call, 0, "$config_mem", 1},
	{ usertask, 0, 0, 0, read_mem_call, 0, "$read_mem", 1},
	{ usertask, 0, 0, 0, write_mem_call, 0, "$write_mem", 1},
	//{ usertask, 0, 0, 0, in_order_call, 0, "$in_order", 1},
	{ usertask, 0, 0, 0, init_dram_call, 0, "$init_dram", 1},
	//{ usertask, 0, 0, 0, v_dump_call, 0, "$v_dump", 1},
	//{ usertask, 0, 0, 0, v_force_call, 0, "$v_force", 1},
	//{ usertask, 0, 0, 0, v_set_delay_call, 0, "$v_delay", 1},
	//{ usertask, 0, 0, 0, slam_mem_call, 0, "$slam_mem", 1},
	//{ usertask, 0, 0, 0, slam_random_call, 0, "$slam_random", 1},
	//{ userfunction, 0, 0, mem_size, create_event_handle_call, 0, "$create_event_handle", 1},
	//{ usertask, 0, 0, 0, mon_event_call, 0, "$mon_event", 1},
	{ userfunction, 0, 0, mem_size, read_dram_call, 0, "$read_dram", 1},
	{ usertask, 0, 0, 0, write_dram_call, 0, "$write_dram", 1},



