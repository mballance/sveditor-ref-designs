// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: report_pli.cc
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
// Test if GNU gcc version is less than 3.x. If so, use pre-standard lib includes
#if __GNUC__ < 3
// VSP-modification end

//#include <iostream.h>
#include <stdio.h>
#include <string.h>
#include <time.h>
#include <limits.h>

// VSP-modification begin
#else

#include <iostream>
#include <cstdarg>
#include <string>
#include <ctime>
#include <limits>

#endif // else __GNUC__ < 3
// VSP-modification end

#include <sys/types.h>
#include <sys/times.h>
#include <unistd.h>
#include <cReport.h>
#include <report_info.h>
#include <Hash.h>
#include <veriuser.h>

// utility functions
extern void parse_format_string(char*, char*, int);
extern int regex_match(const char*, const char*);

#ifdef __cplusplus
extern "C" {
#endif  

// Global variables
HashTable	*g_report_hash_table;
int		g_report_hash_table_initialized = 0;
ReportClass	g_internal_reports;		// for report utility information
int		g_cycle_count = 0, g_death_cycle_count;
int		g_exit_on_error = 1;
clock_t		start_time;
struct		tms start_tmsbuf;

////////////////////////////////////////////////////////////////////////////////
// PLI accessor functions
  
//
// ReportClass_report
//
// PLI accessor for the function ReportClass::report()
//
//
void ReportClass_report()
{
  const HashValueListNode *this_key, *this_value;
  const char *mip_name = tf_mipname(); // Stash the module pathname in mip_name.
  ReportType report_type = (ReportType)tf_getp(1);

  // Create a key and retrieve the correct ReportClass* from the hash.
  this_key = new HashValueListNode(mip_name, report_type);   this_value = g_report_hash_table->lookup(*this_key);
  if (this_value == NULL) {
    tf_error("ReportClass (Internal): Couldn't find value for key with mipname %s!\n", 
	     mip_name);
    tf_dofinish();
  }
  delete this_key;

  {
    ReportClass this_report = *this_value->report_class;

    if (this_report.this_will_print(report_type)) {
      char format_str[REPORT_MAX_LINE_LENGTH];
      char time_str[REPORT_MAX_LINE_LENGTH];
      char msg_str[REPORT_MAX_LINE_LENGTH];

      // Parse the format string and argument list to produce a
      
      strncpy(format_str, tf_getcstringp(2), REPORT_MAX_LINE_LENGTH); // make a copy so we can modify it in parse_format_string.
      format_str[REPORT_MAX_LINE_LENGTH-1] = '\0';
      parse_format_string(msg_str, format_str, 3);

      // Generate the time string.
      //    - tack on simulation time if so desired.
      if (ReportClass::get_show_simulation_time())
	sprintf(time_str, "%d,%d", g_cycle_count, tf_gettime());
      else
	sprintf(time_str, "%d", g_cycle_count);

      // Generate the location string, shortening the pathname if so desired.
      if (ReportClass::get_short_pathnames()) {
	const char * loc_p = strrchr(mip_name, '.');
	mip_name = (loc_p == NULL) ? mip_name : ++loc_p;
      }

      // Actually make the report.  Note that msg_str is always a simple
      // string at this point, with no format chars.
      this_report.report(report_type, time_str, mip_name, "%s", msg_str);
    } else {
      // no need for strings that won't print.
      this_report.report(report_type, "", "", "%s", "");
    }

  }
} // ReportClass_report


// report_verilog_check
//
// This function is called at the beginning of simulation for each call
// made in the design.  This allows us to populate an hash table with a
// pointer to each {report_type, instance_id} pair.
//
void report_verilog_check(void)
{
  int nparam;
  HashValueListNode *key;
      
  // first time through
  if (g_report_hash_table_initialized == 0) {
    // Instantiate a ReportClass object so we can use it to print and such.
    //g_internal_reports = new ReportClass();
    g_report_hash_table = new HashTable();
    g_report_hash_table_initialized++;
  }

  // check that we have at least 2 parameters
  nparam =  tf_nump();
  if( nparam < 2 ) {
    tf_error("$report: (%s) line: %d; Too few arguments to ",
	     __FILE__,__LINE__);
    tf_dofinish();
  }

  // Check that the report's arguments are valid.
  {
    const char *index;
    int nformats = 0;

    // Check that print format characters belong to the set [hHdDoObBsS]
    index = tf_getcstringp(2);
    while( *index ) {
      if( *index == '%' ) {
	index++;
	switch( *index ) {
	  case 'h': case 'H':
	    case 'd': case 'D':
	    case 'o': case 'O':
	    case 'b': case 'B':
	    case 's': case 'S':
	    nformats++;
	  case '%':
	    break;
	  default : {
	    tf_error("$report: (%s) line: %d; Illegal format to : \"%%%c\"",
		     __FILE__,__LINE__, (char)*index);
	    tf_dofinish();
	  }
	} // switch()
      }
      index++;
    }      


    // Check that there are at least as many parameters as formats
    if (nformats > (nparam - 2)) {
      tf_error("$report: (%s) line: %d: Missing arguments to $report call (%d expected, %d found)",
	       __FILE__,__LINE__, nformats, nparam-2);
      tf_dofinish();
    }
  } // done checking args

  {
    const char *mip_name = tf_mipname();
    ReportType report_type = (ReportType)tf_getp(1);

    if (!is_report_type_valid(report_type)) {
      tf_error("$report: (%s) line: %d; Invalid report type in %s: %d",
	       __FILE__, __LINE__, mip_name, report_type);
    }

    // Build a new hash key for this report and insert it into the table.
    key = new HashValueListNode(mip_name, report_type);
    if (key == 0) {
      tf_error("report_verilog_check:: unable to allocate space for new HashValueListNode");
    }

    // Insert our element into the list
    if (g_report_hash_table->lookup(*key) == NULL) {
      key->report_class = new ReportClass();
      g_report_hash_table->insert(key);
    } else {
      delete key;
    }
  }

} // report_verilog_check


//////////////////////////////////////////////////////////////////
// Wrappers for setting default states.
//
// Set the *default* print level per type.  The change applies to all report
// objects for which set_print_level() has not been called previously.
void ReportClass_set_default_print_level() {
  ReportType type	= (ReportType) tf_getp(1);
  PrintLevel pl		= (PrintLevel) tf_getp(2);

  g_internal_reports.set_default_print_level(type, pl);
}

// Set the *default* error level per type.  The change applies to all report
// objects for which set_error_level() has not been called previously.
void ReportClass_set_default_error_level() {
  ReportType type	= (ReportType) tf_getp(1);
  ErrorLevel el		= (ErrorLevel) tf_getp(2);

  g_internal_reports.set_default_error_level(type, el);
}

// Set the *default* table_mode  per type.  The change applies to all report
// objects for which set_table_mode() has not been called previously.
void ReportClass_set_default_table_mode() {
  ReportType type	= (ReportType) tf_getp(1);
  int mode		= (int) tf_getp(2);

  g_internal_reports.set_default_table_mode(type, mode);
}


////////////////////////////////////////////////////////////////////////////////
// PLI accessors for ReportClass instance variables

/*
 * ReportClass_set_print_level( regexp, report_type, print_level )
 *
 * This function performs the same tasks as "pos_level_control" did for pos_report.
 * Its arguments are:
 *
 *	(1) regular expression -- matches the hierarchical paths for which the
 *	    print level should be changed
 *
 *	(2) report type -- the message types which should be changed.  Using
 *	    ALL_REPORTS as the report type will change the print level for all
 *	    messages that match the regexp.
 *
 *	(3) print level -- the level to which the matching classes should be set
 *
 * example:
 *  to suppress all timeout reporting and failures in the "mdu"
 *  instance and all instances beneath it:
 *
 *  (".*\.mdu\..*", RTYP_TIMEOUT, RPRT_NOP);
 *
 * note that because periods are special regular expression characters
 * they must be escaped.
 *
 * If no matches are found for the regex_pattern a warning will be printed.  */
void ReportClass_set_print_level() {
  char *match_pattern	= tf_getcstringp(1);
  ReportType type	= (ReportType) tf_getp(2);
  PrintLevel pl		= (PrintLevel) tf_getp(3);
  int regex_status;
  int found_match	= 0;
  const HashValueListNode *value	= NULL;
  char prefixed_pattern[REPORT_MAX_FIELD_WIDTH];

  // Check that the arguments are valid.
  if (!is_report_type_valid(type))
    tf_error("ReportClass::set_print_level: Invalid report type (%d) to ", type);
  if (!is_print_level_valid(pl))
    tf_error("ReportClass::set_print_level: Invalid print level (%d) to ", pl);

  
  strcpy(prefixed_pattern, ReportClass::get_path_prefix());
  strncat(prefixed_pattern, match_pattern, REPORT_MAX_FIELD_WIDTH-strlen(prefixed_pattern));
  regex_status = regex_match(prefixed_pattern, "");
  if (regex_status == 2) {
    tf_error("ReportClass::set_print_level: Bad regular expression (%s)", prefixed_pattern);
    tf_dofinish();
  }

  // Walk through the hash, finding entries which match the regexp.
  g_report_hash_table->start_walk();
  while (value = g_report_hash_table->next_element()) {
    // Attempt to match the stored pathname to the pre-compiled regular expression.
    regex_status = regex_match(NULL, value->mip_name);

    // Actually set the print level if we have a match.  We have to
    // construct our own report to tell the user about this, since the
    // ReportClass itself doesn't know time or location.
    if (regex_status == 0) {
      char cycle_str[REPORT_MAX_FIELD_WIDTH];
      value->report_class->set_print_level(type, pl, TRUE); // silently -- class doesn't know the path
      sprintf(cycle_str, "%d", g_cycle_count);
      g_internal_reports.report(RTYP_REPORT_MSG,
				cycle_str, value->mip_name,
				"Setting print level for report type %s to %s",
				report_type_to_str(value->report_type),
				print_level_to_str(pl));
      found_match = 1;
    }
  }

  if (!found_match)
    tf_warning("ReportClass (Internal): Could not find match for regular expression \"%s\"\n", prefixed_pattern);

}


/*
 * report_set_error_level
 *
 * This function sets the error level for a given instance of ReportClass.
 * It follows the same semantics as "set_print_level" above.
 */
void ReportClass_set_error_level()
{
  char *match_pattern	= tf_getcstringp(1);
  ReportType type	= (ReportType) tf_getp(2);
  ErrorLevel el		= (ErrorLevel) tf_getp(3);
  int regex_status;    
  int found_match	= 0;
  const HashValueListNode *value	= NULL;
  char prefixed_pattern[REPORT_MAX_FIELD_WIDTH];

  // Check that the arguments are valid.
  if (!is_report_type_valid(type))
    tf_error("ReportClass::set_error_level: Invalid report type (%d) to ", type);
  if (!is_error_level_valid(el))
    tf_error("ReportClass::set_error_level: Invalid error level (%d) to ", el);

  
  strcpy(prefixed_pattern, ReportClass::get_path_prefix());
  strncat(prefixed_pattern, match_pattern, REPORT_MAX_FIELD_WIDTH-strlen(prefixed_pattern));
  regex_status = regex_match(match_pattern, "");
  if (regex_status == 2) {
    tf_error("ReportClass::set_error_level): Bad regular expression (%s)", match_pattern);
    tf_dofinish();
  }
    
  // Walk through the hash, finding entries which match the regexp.
  g_report_hash_table->start_walk();
  while (value = g_report_hash_table->next_element()) {
    // Attempt to match the stored pathname to the pre-compiled regular expression.
    regex_status = regex_match(NULL, value->mip_name);
	  
    // Actually set table mode for the matching instances.  We do this silently.
    if (regex_status == 0) {	      	      
      char cycle_str[REPORT_MAX_FIELD_WIDTH];
      value->report_class->set_error_level(type, el, TRUE);
      sprintf(cycle_str, "%d", g_cycle_count);
      g_internal_reports.report(RTYP_REPORT_MSG,
				cycle_str, value->mip_name,
				"Setting error level for report type %s to %s", 
				report_type_to_str(value->report_type),
				error_level_to_str(el));
      found_match = 1;
    }
  }
    
  if (!found_match)
    tf_warning("ReportClass (Internal): Could not find match for regular expression \"%s\"\n", match_pattern);
}


/*
 * ReportClass_set_table_mode
 *
 * This function sets the "table mode" parameter for a given instance of ReportClass.   
 * It follows the same semantics as the "set_print_level" function above.
 *
 * Placing a particular message type in table mode will:
 *	- remove the prefixes from its output
 *	- remove automatic carriage returns from its output
 * This might be useful for (duh) printing tables of information, statistics, etc.
 *
 */
void ReportClass_set_table_mode()
{
  char *match_pattern	= tf_getcstringp(1);
  ReportType type	= (ReportType) tf_getp(2);
  int table_mode	= tf_getp(3);
  int regex_status;    
  int found_match	= 0;
  const HashValueListNode *value	= NULL;
  char prefixed_pattern[REPORT_MAX_FIELD_WIDTH];

  // Check that the arguments are valid.
  if (!is_report_type_valid(type))
    tf_error("ReportClass::set_table_mode: Invalid report type (%d) to ", type);

  
  strcpy(prefixed_pattern, ReportClass::get_path_prefix());
  strncat(prefixed_pattern, match_pattern, REPORT_MAX_FIELD_WIDTH-strlen(prefixed_pattern));
  regex_status = regex_match(match_pattern, "");
  if (regex_status == 2) {
    tf_error("ReportClass::set_table_mode: Bad regular expression (%s)", match_pattern);
    tf_dofinish();
  }

  // Walk through the hash, finding entries which match the regexp.
  g_report_hash_table->start_walk();
  while (value = g_report_hash_table->next_element()) {
    // Attempt to match the stored pathname to the pre-compiled regular expression.
    regex_status = regex_match(NULL, value->mip_name);
	  
    // Actually set table mode for the matching instances.  We do this silently.
    if (regex_status == 0) {	      	      
      char cycle_str[REPORT_MAX_FIELD_WIDTH];
      value->report_class->set_table_mode(type, table_mode, 1);	// silently
      sprintf(cycle_str, "%d", g_cycle_count);
      g_internal_reports.report(RTYP_REPORT_MSG,
				cycle_str, value->mip_name,
				"Setting table mode for report type %s to %s",
				report_type_to_str(value->report_type),
				table_mode ? "ON" : "OFF");
      found_match = 1;
    }
  }
    
  if (!found_match)
    tf_warning("ReportClass (Internal): Could not find match for regular expression \"%s\"\n", match_pattern);
}

////////////////////////////////////////////////////////////////////////////////
// PLI accessors for ReportClass static variables

/*
 * ReportClass_set_global_print_threshold(int print_level, (int locked_by = REPORT_LOCKED_BY_NO_ONE))
 *
 */
void ReportClass_set_global_print_threshold()
{
  PrintLevel pl = (PrintLevel) tf_getp(1);      
  if (!is_print_level_valid(pl))
    tf_error("ReportClass (Internal): Invalid print level %d to ", pl);
  if (tf_nump() > 1)
    {
      // Lock parameter specified -- pass it along to C++.
      int lock = tf_getp(2);
      ReportClass::set_global_print_threshold(pl, lock);
    }
  else
    {
      // No lock specified.
      ReportClass::set_global_print_threshold(pl);
    }
}

/*
 * ReportClass_get_global_print_threshold
 *
 */
void ReportClass_get_global_print_threshold()
{
  tf_putp(0, (int)ReportClass::get_global_print_threshold());
  return;
}

/*
 * ReportClass_set_max_error_count()
 *
 */
void ReportClass_set_max_error_count()
{
  int ec = tf_getp(1);
  if (ec > 0)
    ReportClass::set_max_error_count(ec);
  else
    tf_error("ReportClass (Internal): Invalid error count (%d) passed to ", ec);
}

/*
 * ReportClass_get_max_error_count
 *
 */
void ReportClass_get_max_error_count()
{
  tf_putp(0, ReportClass::get_max_error_count());
  return;
}

/*
 * ReportClass_inc_global_error_count()
 *
 */
void ReportClass_inc_global_error_count()
{
  ReportClass::inc_global_error_count();
  return;
}

/*
 * ReportClass_get_global_error_count
 */
void ReportClass_get_global_error_count()
{
  tf_putp(0, ReportClass::get_global_error_count());
  return;
}

/*
 * ReportClass_inc_global_warning_count()
 */
void ReportClass_inc_global_warning_count()
{
  ReportClass::inc_global_warning_count();
  return;
}

/*
 * ReportClass_get_global_warning_count()
 *
 */
void ReportClass_get_global_warning_count()
{
  tf_putp(0, ReportClass::get_global_warning_count());
  return;
}

/*
 * ReportClass_set_short_pathnames
 */
void ReportClass_set_short_pathnames()
{
  ReportClass::set_short_pathnames(tf_getp(1));
  return;
}

/*
 * ReportClass_get_short_pathnames
 */
void ReportClass_get_short_pathnames()
{
  tf_putp(0, ReportClass::get_short_pathnames());
  return;
}

/*
 * ReportClass_set_path_prefix
 */
void ReportClass_set_path_prefix()
{
  ReportClass::set_path_prefix(tf_getcstringp(1));
  return;
}

/*
 * ReportClass_get_path_prefix
 */
void ReportClass_get_path_prefix()
{
  // review: How to return a string value via the PLI?
  return;
}

/*
 * ReportClass_disable_fatal_errors
 */
void ReportClass_disable_fatal_errors()
{
  ReportClass::disable_fatal_errors(tf_getp(1));
  return;
}

/* 
 * ReportClass_get_num_remaining_nonfatal_cycles
 */
void ReportClass_get_num_remaining_nonfatal_cycles()
{
  tf_putp(0, ReportClass::get_num_remaining_nonfatal_cycles());
  return;
}

/*
 * ReportClass_set_show_simulation_time
 */
void ReportClass_set_show_simulation_time()
{
  ReportClass::set_show_simulation_time(tf_getp(1));
  return;
}

/*
 * ReportClass_get_show_simulation_time
 */
void ReportClass_get_show_simulation_time()
{
  tf_putp(0, ReportClass::get_show_simulation_time());
  return;
}

////////////////////////////////////////////////////////////////////////////////
// Other PLI calls 

/*
 * report_inc_cycle_count
 *
 */
void report_inc_cycle_count()
{
  // Increment the cycle count, which is kept in the PLI as a global.
  g_cycle_count++;

  // If the ReportClass has errors disabled, decrement the its number
  // of remaining nonfatal cycles.
  if (ReportClass::get_num_remaining_nonfatal_cycles() > 0) {
    ReportClass::dec_num_remaining_nonfatal_cycles();
  }
    
  if (g_death_cycle_count && (g_cycle_count >= g_death_cycle_count)) {
    io_printf("Report:(%0d) [PLI] calling  for error which occured at cycle %0d\n", 
	      g_cycle_count, g_cycle_count - REPORT_DEATH_CYCLE_DELAY);
    tf_dofinish();
  }
}

/*
 * report_set_exit_on_error
 *
 */
void report_set_exit_on_error()
{
  int x = tf_getp(1);
  io_printf("Report:() Setting exit on error to %0d\n", x);
  g_exit_on_error = x;
  return;
}

/*
 * report_get_exit_on_error
 *
 */
void report_get_exit_on_error()
{
  tf_putp(0, g_exit_on_error);
  return;
}

////////////////////////////////////////////////////////////////////////////////
// System functions

/* 
 * check_number_of_args()
 *
 * Called at compile time to ensure that each PLI call is made with
 * the expected number of arguments.  The number of arguments is 
 * specified in the PLI .tab file as a data parameter to this function.
 *
 */
void check_number_of_args( long expected_args ) {
  if( tf_nump() != expected_args ) {
    tf_error("(%s) line: %d; wrong number of arguments to pli call. expected %d args",
	     __FILE__,__LINE__,expected_args);
    exit(1);
  }
  return;
}

/*
 * do_cleanup()
 *
 *	This function is called at the end of simulation.
 */
static void do_cleanup(int code) {
  
}

/*
 * set_start_timestamp
 *
 * Called at "elaboration time" as a PLI check function for print_cycles_per_second.
 * Places the wall-clock time into a global variable for calculation the CPS of this sim.
 *
 */
void set_start_timestamp()
{
  start_time = times(&start_tmsbuf);
}

/*
 * print_cycles_per_second
 *
 * Called by report_test_complete() in Vera land to output
 * the performance in cycles/sec for this simulation.
 *
 */
void report_print_cycles_per_second()
{
  clock_t end_time;
  struct tms end_tmsbuf;
  double cps_cpu; 
  double elapsed_time_cpu;
  char *top;

  end_time = times(&end_tmsbuf);

  // Total CPU Time is sum of user and system CPU time for calling and child processes
  elapsed_time_cpu = (double) ((end_tmsbuf.tms_utime - start_tmsbuf.tms_utime) +     // Calling Process User Time
			       (end_tmsbuf.tms_stime - start_tmsbuf.tms_stime) +     // Calling Process System Time
			       (end_tmsbuf.tms_cutime - start_tmsbuf.tms_cutime) +   // Child Processes User Time
			       (end_tmsbuf.tms_cstime - start_tmsbuf.tms_cstime))    // Child Processes System Time
    / CLK_TCK ; // Divide by clock ticks per second  

  // Avoid division by zero, make sure elapsed time is at least 1/CLK_TCK seconds
  if (elapsed_time_cpu <= 0) 
    elapsed_time_cpu = 1/CLK_TCK;

  cps_cpu = g_cycle_count/elapsed_time_cpu;

  top = (char *)sbrk(0);

  io_printf("Report:: Total CPU Time (seconds): %0.2f\n", elapsed_time_cpu);
  io_printf("Report:: Effective cycles per second: %0.2f\n", cps_cpu);
  io_printf("Report:: Apparent virtual memory size: %d bytes\n", top);
  io_printf("================================================================================\n\n");
}  
  
  
#ifdef __cplusplus
}
#endif
