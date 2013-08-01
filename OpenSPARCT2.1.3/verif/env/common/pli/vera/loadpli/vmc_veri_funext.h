/* #include "vera_ifc.h" */

/* VMC external declarations */


extern int vmc_size();
extern int vmc_init();
extern int vmc_init_misctf (int data, int reason, int paramvc);
extern int vmc_init_check();
extern int vmc_setup_start();
extern int vmc_setup_misctf();
extern int vmc_system_clock();
extern int vmc_start_program();
extern int vmc_add_variable();
extern int vmc_add_variable_array();
extern int vmc_add_variable_array_elmt();
extern int vmc_add_interface_signal();
extern int vmc_signal_change_misctf(int data, int reason, int paramvc);
extern int vmc_add_verilog_task();
extern int vmc_done_task_misctf(int data, int reason, int paramvc);
extern int vmc_add_vera_task();
extern int vmc_vera_task_call();
extern int vmc_vera_load();
extern int vmc_vera_mload();
extern int vmc_vera_pload();
extern int vmc_vera_debugger();
extern int vmc_vera_add_parameter();
extern int vmc_get_export_index();
