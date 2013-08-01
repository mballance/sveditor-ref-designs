/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: veriuser.c
* Copyright (C) 1995-2007 Sun Microsystems, Inc. All Rights Reserved
* 4150 Network Circle, Santa Clara, California 95054, U.S.A.
*
* DO NOT ALTER OR REMOVE COPYRIGHT NOTICES OR THIS FILE HEADER. 
*
* This program is free software; you can redistribute it and/or modify
* it under the terms of the GNU General Public License as published by
* the Free Software Foundation; version 2 of the License.
*
* This program is distributed in the hope that it will be useful,
* but WITHOUT ANY WARRANTY; without even the implied warranty of
* MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
* GNU General Public License for more details.
*
* You should have received a copy of the GNU General Public License
* along with this program; if not, write to the Free Software
* Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
*
* For the avoidance of doubt, and except that if any non-GPL license 
* choice is available it will apply instead, Sun elects to use only 
* the General Public License version 2 (GPLv2) at this time for any 
* software where a choice of GPL license versions is made 
* available with the language indicating that GPLv2 or any later version 
* may be used, or where a choice of which version of the GPL is applied is 
* otherwise unspecified. 
*
* Please contact Sun Microsystems, Inc., 4150 Network Circle, Santa Clara, 
* CA 95054 USA or visit www.sun.com if you need additional information or 
* have any questions. 
*
* 
* ========== Copyright Header End ============================================
*/
#include "veriuser.h"
#include "acc_user.h"

#ifndef accVersionLatest
#include "vxl_acc_user.h"
#include "vxl_veriuser.h"
#endif

char *veriuser_version_str = 
	"=== Verilog with report pli ===\n";	


bool err_intercept(int level, char *facility, char *code)
{
  return(true);
}

/* Report utility */
extern int check_number_of_args();
extern int report_verilog_check();
extern int set_start_timestamp();
extern int ReportClass_report();
extern int ReportClass_set_global_print_threshold();
extern int ReportClass_get_global_print_threshold();
extern int ReportClass_set_max_error_count();
extern int ReportClass_get_max_error_count();
extern int ReportClass_inc_global_error_count();
extern int ReportClass_get_global_error_count();
extern int ReportClass_inc_global_warning_count();
extern int ReportClass_get_global_warning_count();
extern int ReportClass_set_short_pathnames();
extern int ReportClass_get_short_pathnames();
extern int ReportClass_set_path_prefix();
extern int ReportClass_get_path_prefix();
extern int ReportClass_disable_fatal_errors();
extern int ReportClass_get_num_remaining_nonfatal_cycles();
extern int ReportClass_set_show_simulation_time();
extern int ReportClass_get_show_simulation_time();
extern int report_inc_cycle_count();
extern int ReportClass_set_print_level();
extern int ReportClass_set_default_print_level();
extern int ReportClass_set_table_mode();
extern int ReportClass_set_default_table_mode();
/* UNIMPLEMENTED: extern int ReportClass_get_table_mode(); */
extern int ReportClass_set_error_level();
extern int ReportClass_set_default_error_level();
/* UNIMPLEMENTED: extern int report_get_error_level(); */
extern int report_set_exit_on_error();
extern int report_get_exit_on_error();
extern int report_print_cycles_per_second();

p_tfcell report_boot() {

  static s_tfcell report_util_tfs[] = {
    
    /* Report utility */

    { usertask, 0, report_verilog_check, 0, ReportClass_report, 0, "$report", 1 },
    { usertask, 0, 0, 0, ReportClass_set_global_print_threshold, 0, "$report_set_global_print_threshold", 1 },  
    { userfunction, 0, check_number_of_args, 0, ReportClass_get_global_print_threshold, 0, "$report_get_global_print_threshold", 1 },
    { usertask, 1, check_number_of_args, 0, ReportClass_set_max_error_count, 0, "$report_set_max_error_count", 1 },  
    { userfunction, 0, check_number_of_args, 0, ReportClass_get_max_error_count, 0, "$report_get_max_error_count", 1 },
    { usertask, 0, check_number_of_args, 0, ReportClass_inc_global_error_count, 0, "$report_inc_global_error_count", 1 },  
    { userfunction, 0, check_number_of_args, 0, ReportClass_get_global_error_count, 0, "$report_get_global_error_count", 1 },
    { usertask, 0, check_number_of_args, 0, ReportClass_inc_global_warning_count, 0, "$report_inc_global_warning_count", 1 },  
    { userfunction, 0, check_number_of_args, 0, ReportClass_get_global_warning_count, 0, "$report_get_global_warning_count", 1 },
    { usertask, 1, check_number_of_args, 0, ReportClass_set_short_pathnames, 0, "$report_set_short_pathnames", 1 },  
    { userfunction, 0, check_number_of_args, 0, ReportClass_get_short_pathnames, 0, "$report_get_short_pathnames", 1 },
    { usertask, 1, check_number_of_args, 0, ReportClass_set_path_prefix, 0, "$report_set_path_prefix", 1 },  
    /* review!  { userfunction, 0, check_number_of_args, 0, ReportClass_get_path_prefix, 0, "$report_get_path_prefix", 1 }, */
    { usertask, 1, check_number_of_args, 0, ReportClass_disable_fatal_errors, 0, "$report_disable_fatal_errors", 1 },  
    { userfunction, 0, check_number_of_args, 0, ReportClass_get_num_remaining_nonfatal_cycles, 0, "$report_get_num_remaining_nonfatal_cycles", 1 },
    { usertask, 1, check_number_of_args, 0, ReportClass_set_show_simulation_time, 0, "$report_set_show_simulation_time", 1 },  
    { userfunction, 0, check_number_of_args, 0, ReportClass_get_show_simulation_time, 0, "$report_get_show_simulation_time", 1 },
    { usertask, 0, check_number_of_args, 0, report_inc_cycle_count, 0, "$report_inc_cycle_count", 1 },
    { usertask, 3, check_number_of_args, 0, ReportClass_set_print_level, 0, "$report_set_print_level", 1 },
    { usertask, 2, check_number_of_args, 0, ReportClass_set_default_print_level, 0, "$report_set_default_print_level", 1 },
    { usertask, 3, check_number_of_args, 0, ReportClass_set_table_mode, 0, "$report_set_table_mode", 1 },
    { usertask, 2, check_number_of_args, 0, ReportClass_set_default_table_mode, 0, "$report_set_default_table_mode", 1 },
    /* UNIMPLEMENTED: { userfunction, 0, check_number_of_args, 0, ReportClass_get_table_mode, 0, "$report_get_table_mode", 1 }, */
    { usertask, 3, check_number_of_args, 0, ReportClass_set_error_level, 0, "$report_set_error_level", 1 },
    { usertask, 2, check_number_of_args, 0, ReportClass_set_default_error_level, 0, "$report_set_default_error_level", 1 },
    /* UNIMPLEMENTED: { userfunction, 0, check_number_of_args, 0, report_get_error_level, 0, "$report_get_error_level", 1 }, */
    { usertask, 1, check_number_of_args, 0, report_set_exit_on_error, 0, "$report_set_exit_on_error", 1 },  
    { userfunction, 0, check_number_of_args, 0, report_get_exit_on_error, 0, "$report_get_exit_on_error", 1 },
    { usertask, 0, set_start_timestamp, 0, report_print_cycles_per_second, 0, "$report_print_cycles_per_second", 1 },

    {0}

  };

  io_printf("*** Report PLI tasks completed registration ***\n");
  return (report_util_tfs);
}

int (*endofcompile_routines[])() = 
{
  /*** my_eoc_routine, ***/
  0 /*** final entry must be 0 ***/
};

