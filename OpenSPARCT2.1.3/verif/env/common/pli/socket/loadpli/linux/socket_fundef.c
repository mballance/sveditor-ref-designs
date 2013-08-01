     
     { userfunction, 0, 0, queue_size, queue_call, 0, "$queue",1 },
     { userfunction, 0, 0, queue_size, sim_recv_call, 0, "$sim_recv",1 },
     { userfunction, 0, 0, queue_size, sim_send_call, 0, "$sim_send",1 },
     { usertask, 0, 0, 0, sim_flush_call, 0, "$sim_flush",1 },
     { usertask, 0, 0, 0, socket_init_call, 0, "$socket_init",1 },
