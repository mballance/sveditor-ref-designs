/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: get_plus_args.c
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
#include <stdlib.h>
#include <stdio.h>
#include <string.h>

/* 
 * Returning a 0 in VERILOG_ERROR is *bad*, because
 * a zero is a legitimate number to pass in for
 * get_plus_args_num.  I've changed Verilog_error to
 * return a -1, which in verilog is FFFF...FFFF.  The
 * user had better explicitly check the return value.
 *
 * The functions were designed inconsistent with each other.
 * They both should return status and set a value just
 * like get_plus_args_str.  AMS  19-july-1996
 */

#define	VERILOG_ERROR  -1
#define	VERILOG_OK  1
/* #define	DEBUG_PLUS_ARGS 1 */
#define	DEBUG_PLUS_ARGS 0

int util_get_plus_args_str() {

/* Example use:

invocation script (bosox is passed in as first argument)
-----------------
set basename = $1
verilog mymodule.v +tst_file_name${basename}.tst +log_file_name${basename}.log
  +err_file_name${basename}.err +result_file_name${basename}.result

mymodule.v
----------
reg   [32*8:1]  tst_file_name;		// plus argument string value 
reg   [32*8:1]  err_file_name;		// plus argument string value
reg   [32*8:1]  log_file_name;		// plus argument string value
reg   [32*8:1]  result_file_name;	// plus argument string value
integer         plus_arg_ok;            // 0 if ok, 1 if no plus argument value

initial
  begin
    // get strings from plus argument values
    plus_arg_ok = $util_get_plus_args_str("tst_file_name", tst_file_name);
    plus_arg_ok = $util_get_plus_args_str("err_file_name", err_file_name);
    plus_arg_ok = $util_get_plus_args_str("log_file_name", log_file_name);
    plus_arg_ok = $util_get_plus_args_str("result_file_name",result_file_name);

    $display("tst_file_name is %s", tst_file_name);
    $display("err_file_name is %s", err_file_name);
    $display("log_file_name is %s", log_file_name);
    $display("result_file_name is %s", result_file_name);
  end

*/


/* Input is string
	Returning value is string.
*/

    handle		wrk_out;
    char		*strArgIn;
    int			sizeOut,sizeS_in;
    int			numArgs;
    int			cnt,size;
    char		*buffer, *bufferout;
    s_setval_value	value_out;
    s_setval_delay	delay_out;

    delay_out.model = accNoDelay;
    delay_out.time.type = accRealTime;
    delay_out.time.real = 0.0;
    value_out.format = accHexStrVal;

    acc_initialize();

    numArgs = tf_nump();
    if(numArgs !=2) {
	tf_error("$get_plus_arg_string must have two arguments");
	tf_putp(0,VERILOG_ERROR);
	return(VERILOG_ERROR);
    }

/* Fetch the input register and size */

    wrk_out = acc_handle_tfarg(2);
    sizeOut = (acc_fetch_size(wrk_out)/8);

/* Get the string value */
    
    strArgIn = mc_scan_plusargs(tf_getcstringp(1));

    if (strArgIn == NULL) {
	if (DEBUG_PLUS_ARGS)
	    io_printf("get_plus_args_str():  Matching string is not found: %s.\n", tf_getcstringp(1));
	tf_putp(0,VERILOG_ERROR);
	return(VERILOG_ERROR);
    }

    if (strArgIn) {
        if (DEBUG_PLUS_ARGS)
	    io_printf("get_plus_args_str():  Got string value: %s\n",strArgIn);
    }
    else {
	io_printf("get_plus_args_str():  Bad input string value.\n");
	tf_putp(0,VERILOG_ERROR);
	return(VERILOG_ERROR);
    }


/* Build new string */

    sizeS_in = strlen(strArgIn);
    bufferout = (char *) malloc(sizeS_in + 1);
    sprintf(bufferout, "%s",strArgIn);

    if (sizeOut < sizeS_in) {
	tf_error("get_plus_args_str():  Register %s is not large enough.\n",
		 acc_fetch_fullname(wrk_out));
	tf_putp(0,VERILOG_ERROR);
	return(VERILOG_ERROR);
    }

    size = sizeS_in*2;
    buffer = (char *) malloc(size + 1);
    for (cnt =0; cnt < size; cnt +=2){
	if (cnt < size){
	    /* Convert string into HEX code */
	    sprintf(&buffer[cnt],"%x",bufferout[cnt/2]);
	}
    }

/*	 Null out the rest of the register 
	else {
	buffer[cnt] = '\0';
	buffer[cnt +1] = '\0';
}
*/

    /* assign buffer to the verilog register */
	
    value_out.value.str = buffer;
    acc_set_value(wrk_out, &value_out, &delay_out);  
    tf_putp(0,VERILOG_OK);
    acc_close();

    free(buffer);
    free(bufferout);
    return(VERILOG_OK);
}

int util_get_plus_args_num() {

/* Example use

integer         num_vectors;            // number of test vectors
integer         MAX_FAILURES;           // max failed vectors before aborting

initial
  begin
    // get integers from plus argument values
    num_vectors = $util_get_plus_args_num("num_vectors");
    MAX_FAILURES = $util_get_plus_args_num("max_failures");
    $display("%d VECTORS IN TEST FILE.", num_vectors);
    $display("Maximum number of failures is %d", MAX_FAILURES);
  end
*/

   /*  Input: [unsigned int which is a string |
    *                            C string ]
    *  Returns: Arg. value in 32 bit integer.
    *            On error returns VERILOG_C_ERROR
    *  Action:  Gets the parameter, calls  'mc_scan_plusargs'
    *            to get the arg. value.
    *     
    */
					   
				
    int np;
    char *cp;

    np = tf_nump();
    if ( np != 1 ) {
        if (DEBUG_PLUS_ARGS) {
	    io_printf("get_plus_args_num(): Error: Number of args != 1.\n");
        }
	tf_putp(0, VERILOG_ERROR);
	return(VERILOG_ERROR);
    }

    cp = mc_scan_plusargs(tf_getcstringp(1));
    if (cp == NULL ) {
      if (DEBUG_PLUS_ARGS) {
	  io_printf("get_plus_args_num():  Matching number is not found:  %d\n", tf_getcstringp(1));
      }
      tf_putp(0, VERILOG_ERROR);
      return(VERILOG_ERROR);
    }

    if (DEBUG_PLUS_ARGS)
	io_printf("get_plus_args_num():  Got integer value: %d\n", atoi(cp));

    tf_putp(0, atoi(cp) );
    return(VERILOG_OK);
}

