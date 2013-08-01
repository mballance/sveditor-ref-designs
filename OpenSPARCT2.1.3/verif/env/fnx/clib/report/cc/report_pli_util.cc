// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: report_pli_util.cc
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
#include <string.h>
#include <malloc.h>
#include <sys/types.h>
#include <regex.h>
#include <cReport.h>
#include <veriuser.h>

//#ifdef __cplusplus
//extern "C" {
//#endif  

/*
 * regex_match
 *
 * [This function is borrowed verbatim from Andrew Milia's pos_report implementation.]
 *
 * This function takes a string that
 * is a regular expression and a target string
 * and returns:
 *    0 - if target string matches pattern
 *    1 - if target string does not match string
 *    2 - an error in compiling the regular expression
 *        has occurred and a reason for the error
 *        has been printed to stderr
 * if the pattern is NULL then the pattern that was
 * compiled the last time this function was called
 * will be used.
 *
 */
  int regex_match(const char *pattern, const char *string)
    {
      static regex_t compiled_regex = {NULL}; /* the compiled regex pattern
					       * (static so that it can be reused between calls)
					       */
      static int initd = 0;
      int return_status;  /* return status from function calls */

      if( (!initd) && (! pattern) ) {
	tf_error("Report: Uninitialized regexp in regexp_match");
      }

      initd = 1;

      /* if pattern is not null then recompile a new pattern */
      if( pattern &&
	  (return_status = regcomp( &compiled_regex, pattern, REG_NOSUB)) )
	{	
	  /* we got a regex compile error
	   * so we need a place to put the error message
	   */
	  char error_message[1024]; 
	  
	  regfree( &compiled_regex );
	  regerror( return_status, &compiled_regex, error_message, 1024);
	  tf_error(
		   "(%s) line: %d BAD REGULAR EXPRESSION:\"%s\"\n",
		   __FILE__, 
		   __LINE__,
		   error_message
		   );
	  
	  return(2);
	}

      if( regexec(&compiled_regex, string, (size_t) 0, NULL, 0) )    
	return(1);

      return(0);
    }

/*
 * parse_format_string
 *
 * Utility function to convert a format string to a fixed message string.
 *
 */
void parse_format_string(char* msg_str, char* format_str, int param)
  {
    char* fmt_mark = format_str;      // format string pointer
    char* msg_mark = msg_str;         
    char* target;
    char format_char;
    int count;
    
    // Parse the next piece of the format string.
    // This is the piece between the current point and the next '%'.
    while (target = (char*)strchr(fmt_mark, '%'))
	{
	  // Stash everything between the last '%' and the current '%' into msg_str.
	  *target = (char)0;		// add a terminating character
	  format_char = *(target+1);
	  strcpy(msg_mark, fmt_mark);
	  
	  // Move the msg string pointer to the end of what was just copied.
	  msg_mark += (target - fmt_mark);	  
	  
	  // Output the formatted argument, based on format_char.
	  if (format_char == '%')
	    {
	      count = sprintf(msg_mark, "%%");
	    }
	  else if (format_char == 's')
	    {
	      // Use a special PLI routine to format a C character string.
	      count = sprintf(msg_mark, "%s", tf_getcstringp(param++));
	    }
	  else
	    {
	      // Use a PLI routine to format the argument in the same way
	      // as the  routine.
	      count = sprintf(msg_mark, "%s", tf_strgetp(param++, format_char));
	    }

	  // Move the string pointers past what we just parsed.
	  fmt_mark = target + 2;
	  msg_mark += count;
	}

    // Copy the remainder of the format string.
    strcpy(msg_mark, fmt_mark);

    // Deal with any extra arguments.
    while (param < tf_nump())
	{
	  if (tf_typep(param) == tf_nullparam)
	    {
	      // Print a space for null parameters
	      sprintf(msg_mark, " ");
	      msg_mark++;
	    }
	  else
	    {
	      // Everything else just gets decimal format.
	      count = sprintf(msg_mark, "%s", tf_strgetp(param, 'd'));
	 
	    }
	  param++;
	}     
  }

//#ifdef __cplusplus
//}
//#endif

