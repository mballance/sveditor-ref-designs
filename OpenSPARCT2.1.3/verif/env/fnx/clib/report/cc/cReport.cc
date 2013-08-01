// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: cReport.cc
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

#include <stdio.h>
#include <stdarg.h>
#include <string.h>
#include "cReport.h"
#include "report_msg_format.h"
#include "report_info.h"

extern "C" int g_cycle_count, g_death_cycle_count, g_exit_on_error;


////////////////////////////////////////////////////////////////////////////////
// Class variable definitions
//
PrintLevel ReportClass::global_print_threshold	= REPORT_DEFAULT_PRINT_THRESHOLD;
int ReportClass::max_error_count			= REPORT_DEFAULT_MAX_ERROR_COUNT;
int ReportClass::global_error_count			= 0;
int ReportClass::global_warning_count			= 0;
int ReportClass::use_short_pathnames			= 0;
const char* ReportClass::path_prefix			= "";
int ReportClass::num_remaining_nonfatal_cycles		= 0;
int ReportClass::show_simulation_time			= 0;
int ReportClass::global_print_threshold_locked_by	= REPORT_LOCKED_BY_NO_ONE;
int ReportClass::report_type_display_locked_by[R_NUM_REPORT_TYPES];

////////////////////////////////////////////////////////////////////////////////
//
// Message display functions


// ReportClass::report
//
// Display a message of the given type.  The message will use
// the current print level and error level for this report type.
// Accepts a printf-like format string and arg list.
//
//
void ReportClass::report(ReportType report_type, 
			 const char* time_str, const char* location_str, const char* format_str, ...)
{
  void* varargs[REPORT_MAX_NUM_VARARGS];
  const char* prefix_str;
  PrintLevel my_print_level = get_print_level(report_type);
  ErrorLevel my_error_level = get_error_level(report_type);

  // Actually do the output, if the print level is appropriate.
  if (my_print_level >= global_print_threshold) {
    // review:  1. Support output redirection here!!!

    
    //    - if fatal errors are disabled, make errors into warnings.
    if (num_remaining_nonfatal_cycles > 0 && my_error_level == RERR_ERROR)	
      prefix_str = get_prefix(report_type, RERR_MESSAGE);
    else
      prefix_str = get_prefix(report_type, my_error_level);

    
    if (!get_table_mode(report_type)) {
      fprintf(stdout, REPORT_MSG_FORMAT_STRING, prefix_str, time_str, location_str);
    }

    // If fatal error, output the error type.
    if (my_error_level == RERR_ERROR) {
      fprintf(stdout, "%s: ", report_type_to_str(report_type));
    }

    // Print message string, extracting any arguments from the varargs list.
    // Use the format string to find out how many arguments we should expect.	  
    {
      va_list ap;
      const char *fp = format_str;
      int i, j = 0;
	    
      for (i = 0; i < REPORT_MAX_NUM_VARARGS; i++) 
	varargs[i] = 0;

      va_start(ap, format_str);
      while (fp = strchr(fp, '%'))
	{
	  // Found another '%' in the formatting string.
	  // If it's actually associated with a vararg, grab the next one.
	  if (*(++fp) != '%') 
	    varargs[j++] = va_arg(ap, void*);
	}
      va_end(ap);
    }
    // This is it.  This is where the message is finally printed.
    fprintf(stdout, format_str,
	    varargs[0], varargs[1], varargs[2], varargs[3], varargs[4],
	    varargs[5], varargs[6], varargs[7], varargs[8], varargs[9]);

    // Print newline (if not in table mode)
    if (!get_table_mode(report_type)) {
      fprintf(stdout, "\n");
    }
  }

  // If this report produced a fatal error or a warning, deal with the situation.
  if (my_error_level == RERR_ERROR) {
    if (get_num_remaining_nonfatal_cycles() == 0) {
      // Increase the ReportClass's global error count,
      // but only if fatal errors are not currently disabled!
      inc_global_error_count();
    }

    // If this error pushed us over the maximum number of allowable errors, 
    // schedule a cycle soon in which the sim will be killed.
    if(get_global_error_count() >= get_max_error_count() 
       && !g_death_cycle_count
       && g_exit_on_error) {
            g_death_cycle_count = g_cycle_count + REPORT_DEATH_CYCLE_DELAY;
      fprintf(stdout, "Report:(%0d) [PLI] Scheduling $finish for cycle %0d\n", g_cycle_count, g_death_cycle_count);
      // Call user handler
      handle_error();
    }

  } else if (my_error_level == RERR_WARNING) {
    // Increase the ReportClass's global warning count.
    inc_global_warning_count();
  }

} // ReportClass::report(...)


// ReportClass:report_test_complete
//
void ReportClass::report_test_complete(int finish_cycle)
{
  fprintf(stdout, REPORT_TEST_DONE_FORMAT_STRING, finish_cycle, get_global_error_count(), get_global_warning_count());
}


// ReportClass::will_this_print
//
// Return true if the report_type will print, false otherwise
//
//
int ReportClass::this_will_print(ReportType report_type)
{
  //fprintf(stdout,"ReportClass::this_will_print: report_type: %d(%d), global_print_threshold: %d\n",
  //report_type, get_print_level(report_type), global_print_threshold);
  return( get_print_level(report_type) >= global_print_threshold);
}


////////////////////////////////////////////////////////////////////////////////
// Accessors for class variables


// ReportClass::set_global_print_threshold
//
// This accessor may be called with a "lock" variable to prevent further changes.
// This can be used to lock in changes from the command line, for example.
// NOTE! The lock variable can only be set once; further changes are ignored.
//
//
void ReportClass::set_global_print_threshold(PrintLevel new_print_threshold, int locked_by)
{
  ReportClass temp_report;

  if (ReportClass::global_print_threshold_locked_by == REPORT_LOCKED_BY_NO_ONE)
    {
      // No lock currently set for the print threshold.
      if (locked_by != REPORT_LOCKED_BY_NO_ONE)
	{
	  // Set the new lock.
	  temp_report.report(RTYP_REPORT_MSG, REPORT_CPP_DEFAULT_TIME_STR, REPORT_CPP_DEFAULT_LOCATION_STR,
			     "Locked global print threshold to %s -- further changes will be ignored",
			     print_level_to_str(new_print_threshold));	  
	  ReportClass::global_print_threshold_locked_by = locked_by;
	}
      else
	{
	  // No new lock specified -- just change the thing.
	  temp_report.report(RTYP_REPORT_MSG, REPORT_CPP_DEFAULT_TIME_STR, REPORT_CPP_DEFAULT_LOCATION_STR,
			     "Changing global print threshold from %s to %s",
			     print_level_to_str(ReportClass::global_print_threshold), 
			     print_level_to_str(new_print_threshold));
	}
      ReportClass::global_print_threshold = new_print_threshold;
    }
  else
    {
      // Print threshold has already been locked.
      // Only allow changes if 'locked_by' matches the lock.
      if (locked_by == ReportClass::global_print_threshold_locked_by)
	{
	  temp_report.report(RTYP_REPORT_MSG, REPORT_CPP_DEFAULT_TIME_STR, REPORT_CPP_DEFAULT_LOCATION_STR,
			     "Changing global print threshold from %s to %s",
			     print_level_to_str(ReportClass::global_print_threshold), 
			     print_level_to_str(new_print_threshold));
	  ReportClass::global_print_threshold = new_print_threshold;	      
	}
      else
	{
	  temp_report.report(RTYP_REPORT_MSG, REPORT_CPP_DEFAULT_TIME_STR, REPORT_CPP_DEFAULT_LOCATION_STR,
			     "Can't change global print threshold to %s -- it's locked!",
			     print_level_to_str(new_print_threshold));
	}
    }
}


// ReportClass::get_global_print_threshold
//
PrintLevel ReportClass::get_global_print_threshold()
{
  return global_print_threshold;
}


// ReportClass::set_max_error_count
//
void ReportClass::set_max_error_count(int error_count)
{
  ReportClass temp_report;
  temp_report.report(RTYP_REPORT_MSG, REPORT_CPP_DEFAULT_TIME_STR, REPORT_CPP_DEFAULT_LOCATION_STR,
		     "Changing maximum error count from %d to %d", max_error_count, error_count);
  max_error_count = error_count;
}

// ReportClass::get_max_error_count
//
int ReportClass::get_max_error_count()
{
  return max_error_count;
}

// ReportClass::get_global_error_count
//
int ReportClass::get_global_error_count()
{
  return global_error_count;
}


// ReportClass::inc_global_error_count
//
// Increase the global error count and generate a "fatal error" report
// which should cause a test to be marked as failing.
// NOTE: The simulation itself should be killed by the calling code!
//
///
void ReportClass::inc_global_error_count()
{
  ReportClass temp_report;
  if (++global_error_count == max_error_count)
    {
      temp_report.report(RTYP_REPORT_MSG, REPORT_CPP_DEFAULT_TIME_STR, REPORT_CPP_DEFAULT_LOCATION_STR,
			 "Maximum error count of %d has been reached!", max_error_count);
    }
}


// ReportClass::get_global_warning_count
//
int ReportClass::get_global_warning_count()
{
  return global_warning_count;
}

// ReportClass::inc_global_warning_count
//
void ReportClass::inc_global_warning_count()
{
  ++global_warning_count;
}


// ReportClass::set_short_pathnames
//
void ReportClass::set_short_pathnames(int use_short)
{
  ReportClass temp_report;
  if (use_short)
    temp_report.report(RTYP_REPORT_MSG, REPORT_CPP_DEFAULT_TIME_STR, REPORT_CPP_DEFAULT_LOCATION_STR, "Using short pathnames.");
  else
    temp_report.report(RTYP_REPORT_MSG, REPORT_CPP_DEFAULT_TIME_STR, REPORT_CPP_DEFAULT_LOCATION_STR, "Using long pathnames.");
  use_short_pathnames = use_short;
}
  
// ReportClass::get_short_pathnames
//
int ReportClass::get_short_pathnames()
{
  return use_short_pathnames;
}


//
void ReportClass::set_path_prefix(const char* prefix)
{
  ReportClass temp_report;
  temp_report.report(RTYP_REPORT_MSG, REPORT_CPP_DEFAULT_TIME_STR, REPORT_CPP_DEFAULT_LOCATION_STR, 
		     "Setting path prefix to %s", prefix);
  path_prefix = prefix;
}


//
const char* ReportClass::get_path_prefix()
{
  return path_prefix;
}


// ReportClass::disable_fatal_errors
//
void ReportClass::disable_fatal_errors(int num_cycles)
{
  if (num_cycles > 0)
    {
      ReportClass temp_report;
      temp_report.report(RTYP_REPORT_MSG, REPORT_CPP_DEFAULT_TIME_STR, REPORT_CPP_DEFAULT_LOCATION_STR,
			 "Disabling fatal errors for %0d cycles.", num_cycles);
      num_remaining_nonfatal_cycles = num_cycles;
    }
}


// ReportClass::get_num_remaining_nonfatal_cycles
//
int ReportClass::get_num_remaining_nonfatal_cycles()
{
  return num_remaining_nonfatal_cycles;
}


// ReportClass::dec_num_remaining_nonfatal_cycles
//
void ReportClass::dec_num_remaining_nonfatal_cycles()
{
  if (get_num_remaining_nonfatal_cycles() == 0)
    {
      ReportClass temp_report;
      temp_report.report(RTYP_WARNING, REPORT_CPP_DEFAULT_TIME_STR, REPORT_CPP_DEFAULT_LOCATION_STR,
			 "Attempting to decrement a num_remaining_nonfatal_cycles of zero!");
    }
  else
    num_remaining_nonfatal_cycles--;
}

// ReportClass::set_show_simulation_time
//
void ReportClass::set_show_simulation_time(int sim_time)
{
  ReportClass temp_report;
  if (!sim_time)
    temp_report.report(RTYP_REPORT_MSG, REPORT_CPP_DEFAULT_TIME_STR, REPORT_CPP_DEFAULT_LOCATION_STR,
		       "Not displaying simulation time.");
  else
    temp_report.report(RTYP_REPORT_MSG, REPORT_CPP_DEFAULT_TIME_STR, REPORT_CPP_DEFAULT_LOCATION_STR,
		       "Displaying simulation time.");
  show_simulation_time = sim_time;
}


// ReportClass::get_show_simulation_time
//
int ReportClass::get_show_simulation_time()
{
  return show_simulation_time;
}

////////////////////////////////////////////////////////////////////////////////
//
// Accessors for instance variables

// ReportClass::set_default_print_level
//	  Changes the print level of all messages which have not thus far been
//	  overridden by set_print_level.
//
void ReportClass::set_default_print_level(ReportType report_type, PrintLevel new_print_level) {
  report(RTYP_REPORT_MSG, REPORT_CPP_DEFAULT_TIME_STR,
	 REPORT_CPP_DEFAULT_LOCATION_STR, "Setting *default* print level for type %s to %s",
	 report_type_to_str(report_type),
	 print_level_to_str(new_print_level));

  // If the type is "ALL_REPORTS", set everything.  Otherwise, just set the desired type.
  if (report_type == RTYP_ALL_REPORTS) {
    for (int type = __RTYP_FIRST_TYPE; type <= __RTYP_LAST_TYPE; type++) {
      default_print_level_by_type[type] = new_print_level;
    }
  } else {
    default_print_level_by_type[report_type] = new_print_level;
  }
}


// ReportClass::set_default_error_level
//	  Changes the error level of all messages which have not thus far been
//	  overridden by set_error_level.
//
void ReportClass::set_default_error_level(ReportType report_type, ErrorLevel new_error_level) {
  report(RTYP_REPORT_MSG, REPORT_CPP_DEFAULT_TIME_STR,
	 REPORT_CPP_DEFAULT_LOCATION_STR, "Setting *default* error level for type %s to %s",
	 report_type_to_str(report_type),
	 error_level_to_str(new_error_level));

  // If the type is "ALL_REPORTS", set everything.  Otherwise, just set the desired type.
  if (report_type == RTYP_ALL_REPORTS) {
    for (int type = __RTYP_FIRST_TYPE; type <= __RTYP_LAST_TYPE; type++) {
      default_error_level_by_type[type] = new_error_level;
    }
  } else {
    default_error_level_by_type[report_type] = new_error_level;
  }
}


// ReportClass::set_default_table_mode
//	  Changes the table_mode of all messages which have not thus far been
//	  overridden by set_table_mode.
//
void ReportClass::set_default_table_mode(ReportType report_type, int mode) {
  report(RTYP_REPORT_MSG, REPORT_CPP_DEFAULT_TIME_STR,
	 REPORT_CPP_DEFAULT_LOCATION_STR, "Setting *default* print level for type %s to %s",
	 report_type_to_str(report_type),
	 mode ? "ON" : "OFF");

  // If the type is "ALL_REPORTS", set everything.  Otherwise, just set the desired type.
  if (report_type == RTYP_ALL_REPORTS) {
    for (int type = __RTYP_FIRST_TYPE; type <= __RTYP_LAST_TYPE; type++) {
      default_table_mode_by_type[type] = mode;
    }
  } else {
    default_table_mode_by_type[report_type] = mode;
  }
}

//////////////////////////////////////////////////////////////////
//
// ReportClass::set_print_level
//	  Changes the print level of this message type only, on this
//	  ReportClass instance only.
//
void ReportClass::set_print_level(ReportType report_type, PrintLevel new_print_level, int silent) {
  if (!silent) {
    report(RTYP_REPORT_MSG, REPORT_CPP_DEFAULT_TIME_STR,
	   REPORT_CPP_DEFAULT_LOCATION_STR, "Setting print level for type %s to %s",
	   report_type_to_str(report_type),
	   print_level_to_str(new_print_level));
  }

  if (localized_print_level_by_type == NULL) {
    // copy the default array.
    localized_print_level_by_type = new PrintLevel[R_NUM_REPORT_TYPES];
    for (int type = __RTYP_FIRST_TYPE; type <= __RTYP_LAST_TYPE; type++) {
      localized_print_level_by_type[type] = default_print_level_by_type[type];
    }
  }

  // If the type is "ALL_REPORTS", set everything.  Otherwise, just set the desired type.
  if (report_type == RTYP_ALL_REPORTS) {
    for (int type = __RTYP_FIRST_TYPE; type <= __RTYP_LAST_TYPE; type++) {
      localized_print_level_by_type[type] = new_print_level;
    }
  } else {
    localized_print_level_by_type[report_type] = new_print_level;
  }
}


// ReportClass::get_print_level
//
PrintLevel ReportClass::get_print_level(ReportType report_type) {
  return localized_print_level_by_type == NULL ? default_print_level_by_type[report_type] : localized_print_level_by_type[report_type];
}


// ReportClass::set_error_level
//	  Changes the error level of this message type only, on this
//        ReportClass instance only.
//
void ReportClass::set_error_level(ReportType report_type, ErrorLevel new_error_level, int silent) {
  if (!silent) {
    report(RTYP_REPORT_MSG, REPORT_CPP_DEFAULT_TIME_STR,
	   REPORT_CPP_DEFAULT_LOCATION_STR, "Setting error level for type %s to %s",
	   report_type_to_str(report_type),
	   error_level_to_str(new_error_level));
  }

  if (localized_error_level_by_type == NULL) {
    // copy the default array.
    localized_error_level_by_type = new ErrorLevel[R_NUM_REPORT_TYPES];
    for (int type = __RTYP_FIRST_TYPE; type <= __RTYP_LAST_TYPE; type++) {
      localized_error_level_by_type[type] = default_error_level_by_type[type];
    }
  }

  // If the type is "ALL_REPORTS", set everything.  Otherwise, just set the desired type.
  if (report_type == RTYP_ALL_REPORTS) {
    for (int type = __RTYP_FIRST_TYPE; type <= __RTYP_LAST_TYPE; type++) {
      localized_error_level_by_type[type] = new_error_level;
    }
  } else {
    localized_error_level_by_type[report_type] = new_error_level;
  }
}

// ReportClass::get_error_level
//
ErrorLevel ReportClass::get_error_level(ReportType report_type) {
  return localized_error_level_by_type == NULL ? default_error_level_by_type[report_type] : localized_error_level_by_type[report_type];
}


// ReportClass::set_table_mode
//
void ReportClass::set_table_mode(ReportType report_type, int mode, int silent) {
  if (!silent) {
    report(RTYP_REPORT_MSG, REPORT_CPP_DEFAULT_TIME_STR,
	   REPORT_CPP_DEFAULT_LOCATION_STR, "Set table mode for type %s to %s.",
	   report_type_to_str(report_type),
	   mode ? "ON" : "OFF");
  }

  if (localized_table_mode_by_type == NULL) {
    // copy the default array.
    localized_table_mode_by_type = new int[R_NUM_REPORT_TYPES];
    for (int type = __RTYP_FIRST_TYPE; type <= __RTYP_LAST_TYPE; type++) {
      localized_table_mode_by_type[type] = default_table_mode_by_type[type];
    }
  }

  // If the type is "ALL_REPORTS", set everything.  Otherwise, just set the desired type.
  if (report_type == RTYP_ALL_REPORTS) {
    for (int type = __RTYP_FIRST_TYPE; type <= __RTYP_LAST_TYPE; type++) {
      localized_table_mode_by_type[type] = mode;
    }
  } else {
    localized_table_mode_by_type[report_type] = mode;
  }
}


// ReportClass::get_table_mode
//
int ReportClass::get_table_mode(ReportType report_type) {
  return localized_table_mode_by_type == NULL ? default_table_mode_by_type[report_type] : localized_table_mode_by_type[report_type];
}

//
////////////////////////////////////////////////////////////////////////////////
  

