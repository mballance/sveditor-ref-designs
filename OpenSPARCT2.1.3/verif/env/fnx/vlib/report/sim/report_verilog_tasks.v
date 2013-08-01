// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: report_verilog_tasks.v
// Copyright (C) 1995-2007 Sun Microsystems, Inc. All Rights Reserved
// 4150 Network Circle, Santa Clara, California 95054, U.S.A.
//
// * DO NOT ALTER OR REMOVE COPYRIGHT NOTICES OR THIS FILE HEADER. 
//
// This program is free software; you can redistribute it and/or modify
// it under the terms of the GNU General Public License as published by
// the Free Software Foundation; version 2 of the License.
//
// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU General Public License for more details.
//
// You should have received a copy of the GNU General Public License
// along with this program; if not, write to the Free Software
// Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
// 
// For the avoidance of doubt, and except that if any non-GPL license 
// choice is available it will apply instead, Sun elects to use only 
// the General Public License version 2 (GPLv2) at this time for any 
// software where a choice of GPL license versions is made 
// available with the language indicating that GPLv2 or any later version 
// may be used, or where a choice of which version of the GPL is applied is 
// otherwise unspecified. 
//
// Please contact Sun Microsystems, Inc., 4150 Network Circle, Santa Clara, 
// CA 95054 USA or visit www.sun.com if you need additional information or 
// have any questions. 
// 
// ========== Copyright Header End ============================================
module report_verilog_tasks;

////////////////////////////////////////////////////////////////////////////////
// Class variable accessors

task report_verilog_set_global_print_threshold;
	input [31:0]        new_print_threshold;
    input [31:0]		locked_by;
    
    begin
    	$report_set_global_print_threshold(new_print_threshold, locked_by);
    end    
endtask         // report_verilog_set_global_print_threshold

// report_verilog_get_global_print_threshold:   unnecessary -- use ReportClass::get_global_print_threshold()

task report_verilog_set_max_error_count;
	input [31:0]        max_error_count;
    
    begin
    	$report_set_max_error_count(max_error_count);
    end
endtask         // report_verilog_set_max_error_count

// report_verilog_get_max_error_count:          unnecessary -- use ReportClass::get_max_error_count()

task report_verilog_inc_global_error_count;
	begin
    	$report_inc_global_error_count;
    end
endtask         // report_verilog_inc_global_error_count

task report_verilog_get_global_error_count;
	output [31:0] global_error_count;
    
    begin
    	global_error_count = $report_get_global_error_count;
    end
endtask         // report_verilog_get_global_error_count

task report_verilog_inc_global_warning_count;
	begin
    	$report_inc_global_warning_count;
    end
endtask         // report_verilog_inc_global_warning_count

task report_verilog_get_global_warning_count;
	output [31:0] global_warning_count;
    
    begin
    	global_warning_count = $report_get_global_warning_count;
    end
endtask         // report_verilog_get_global_warning_count

task report_verilog_set_short_pathnames;
	input [31:0] short_names;
    
    begin
    	$report_set_short_pathnames(short_names);
    end
endtask         // report_verilog_set_short_pathnames

// report_verilog_get_short_pathnames:  unnecessary -- use ReportClass::get_short_pathnames()

task report_verilog_set_path_prefix;
	input [256*8:0] path_prefix_str;
    
    begin
    	$report_set_path_prefix(path_prefix_str);
    end
endtask         

task report_verilog_set_exit_on_error;
	input [31:0] exit_on_error;

	begin
		$report_set_exit_on_error(exit_on_error);
	end
endtask

task report_verilog_get_exit_on_error;
	output [31:0] exit_on_error;

	begin
		exit_on_error = $report_get_exit_on_error;
	end
endtask

task report_verilog_disable_fatal_errors;
	input [31:0] num_nonfatal_cycles;
    
    begin
    	$report_disable_fatal_errors(num_nonfatal_cycles);
    end
endtask         // report_verilog_disable_fatal_errors

// report_verilog_get_num_remaining_nonfatal_cycles:  unnecessary -- use ReportClass::get_num_...

task report_verilog_set_show_simulation_time;
	input [31:0] show_sim_time;
    
    begin
    	$report_set_show_simulation_time(show_sim_time);
    end
endtask        // report_verilog_set_show_simulation_time

// report_verilog_get_show_simulation_time:             unnecessary -- use ReportClass::get_show_simulation_time


////////////////////

task report_verilog_test_complete;
      input [31:0] cycle;
      input [31:0] errors;
      input [31:0] warnings;
    
    begin     
		$write("\n================================================================================\nReport:: Cycle at finish: %0d\nReport:: Total errors\t = %0d\nReport:: Total warnings\t = %0d\n", cycle, errors, warnings);
		$report_print_cycles_per_second;
    end
    
endtask         // report_verilog_test_complete



//////////////////////////////////////////////////////////////////
// Set defaults
//
task report_verilog_set_default_print_level;
    input [31:0] report_type;
    input [31:0] print_level;
    
    begin
    	$report_set_default_print_level(report_type, print_level);
    end
endtask         // report_verilog_set_default_print_level

//
task report_verilog_set_default_error_level;
    input [31:0] report_type;
    input [31:0] error_level;
    
    begin
    	$report_set_default_error_level(report_type, error_level);
    end
endtask         // report_verilog_set_default_error_level

//
task report_verilog_set_default_table_mode;
    input [31:0] report_type;
    input [31:0] table_mode;
    
    begin
    	$report_set_default_table_mode(report_type, table_mode);
    end
endtask         // report_verilog_set_default_table_mode


////////////////////////////////////////////////////////////////////////////////
// Instance variable accessors

task report_verilog_set_print_level;
    input [(256*8)-1:0] regexp;
    input [31:0] report_type;
    input [31:0] print_level;
    
    begin
    	$report_set_print_level(regexp, report_type, print_level);
    end
endtask         // report_verilog_set_print_level

task report_verilog_set_error_level;
    input [(256*8)-1:0] regexp;
    input [31:0] report_type;
    input [31:0] error_level;
    
    begin
    	$report_set_error_level(regexp, report_type, error_level);
    end
endtask         // report_verilog_set_error_level

task report_verilog_set_table_mode;
	input [(256*8)-1:0] regexp;
    input [31:0] report_type;
    input [31:0] table_mode;
    
    begin
    	$report_set_table_mode(regexp, report_type, table_mode);
    end
endtask         // report_verilog_set_table_mode   

//
task report_verilog_print_cycles_per_second;
	begin
    	$report_print_cycles_per_second;
    end
endtask         //report_print_cycles_per_second

endmodule       // report_verilog_tasks
