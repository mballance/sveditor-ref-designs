/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: cReport.h
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
#ifndef _CREPORT_H
#define _CREPORT_H

#include "report_msg_format.h"
#include "report_info.h"

  // Definitions, constants, etc.
#define REPORT_DEFAULT_PRINT_THRESHOLD		RPRT_INFO
#define REPORT_DEFAULT_PRINT_LEVEL		RPRT_INFO
#define REPORT_DEFAULT_MAX_ERROR_COUNT		1
#define REPORT_MAX_LINE_LENGTH			1024
#define REPORT_MAX_FIELD_WIDTH			256
#define REPORT_MAX_NUM_VARARGS			12
#define REPORT_CPP_DEFAULT_TIME_STR		""
#define REPORT_CPP_DEFAULT_LOCATION_STR		"C++"

  // This value is the number of cycles a sim will run before 
  // is called after the maximum error count has been reached.
#define REPORT_DEATH_CYCLE_DELAY		10		

class ReportClass { 
 private:
  // Private data
    
  // Class Variables (for all reports)
  static PrintLevel global_print_threshold;
  static int max_error_count;
  static int global_error_count;
  static int global_warning_count;
  static int use_short_pathnames;
  static const char* path_prefix;
  static int num_remaining_nonfatal_cycles;
  static int show_simulation_time;

  // For command line or Vera overriding
  static int global_print_threshold_locked_by;
  static int report_type_display_locked_by[R_NUM_REPORT_TYPES];

  // Instance variables (just this message type)
  PrintLevel *localized_print_level_by_type;
  ErrorLevel *localized_error_level_by_type;
  int *localized_table_mode_by_type;
    
 public:
  // Public methods
  virtual void report(ReportType report_type, 
		      const char* time_str, const char* location_str, const char* format_str, ...);
  virtual void report_test_complete(int finish_cycle);
  virtual int this_will_print(ReportType report_type);

  // Accessors for class variables
  static void set_global_print_threshold(PrintLevel new_print_threshold, int locked_by = REPORT_LOCKED_BY_NO_ONE);
  static PrintLevel get_global_print_threshold();
  static void set_max_error_count(int error_count);
  static int get_max_error_count();
  static void inc_global_error_count();
  static int get_global_error_count();
  static void inc_global_warning_count();
  static int get_global_warning_count();
  static void set_short_pathnames(int use_short);
  static int get_short_pathnames();
  static void set_path_prefix(const char* prefix);
  static const char* get_path_prefix();
  static void disable_fatal_errors(int num_cycles);
  static int get_num_remaining_nonfatal_cycles();
  static void dec_num_remaining_nonfatal_cycles();
  static void set_show_simulation_time(int show_sim_time);
  static int get_show_simulation_time();

  // Set defaults
  virtual void set_default_print_level(ReportType report_type, PrintLevel new_print_level);
  virtual void set_default_error_level(ReportType report_type, ErrorLevel new_error_level);
  virtual void set_default_table_mode(ReportType report_type, int mode);

  // Accessors for instance variables
  virtual void set_print_level(ReportType report_type, PrintLevel new_print_level, int silent = 0);
  virtual PrintLevel get_print_level(ReportType report_type);
  virtual void set_error_level(ReportType report_type, ErrorLevel new_error_level, int silent = 0);
  virtual ErrorLevel get_error_level(ReportType report_type);
  virtual void set_table_mode(ReportType report_type, int table_mode, int silent = 0);
  virtual int get_table_mode(ReportType report_type);

  // Public constructor
  ReportClass() {
    // Initialize all instance properties (to sane values)
    localized_print_level_by_type = NULL;
    localized_error_level_by_type = NULL;
    localized_table_mode_by_type  = NULL;
  }

 protected:
  // Protected methods

  const char* get_prefix(ReportType type, ErrorLevel error_level) {
    switch (error_level) {
      case RERR_MESSAGE: {
	return report_prefix_by_type[type];
	break;
      }
      case RERR_WARNING: {
	return REPORT_KEYWORD_WARNING;
	break;
      }
      case RERR_ERROR: {
	return REPORT_KEYWORD_FATAL_ERROR;
	break;
      }
    }
    return ">> INVALID_TYPE <<";
  }

  virtual void handle_error() {
    // user can extend ReportClass to define this method.
  }

};
  

#endif //#ifndef _CREPORT_H


