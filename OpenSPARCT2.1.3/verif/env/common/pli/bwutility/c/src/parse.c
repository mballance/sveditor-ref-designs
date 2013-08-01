/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: parse.c
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
#include "vcsuser.h"
#include "acc_user.h"
#include "malloc.h"
#include "string.h"
#include "ctype.h"  /* for toupper */
#include "stdio.h"  /* for sscanf.h */

int parse_debug;

/************************************************************************/
/* parse check routine                                        */
/************************************************************************/
void parse_check(int data, int reason)
{
  parse_debug = 0;
   return;
} /* value_check */



/************************************************************************/
/* parese call routine                                         */
/************************************************************************/

void parse_call(int data, int reason)
{
  char *ptr, *ptr_start;
  float argf;
  char *ptr_parse_str;
  char *ptr_fmt_str;
  char c, sep_c;
  int arg_count;
  int max_args;
  int ret_null_str;
  int i;

    static s_acc_value avalue = {accIntVal};    /* Holds argument value */
    static s_setval_delay delay_s = {{0}, accNoDelay};

    max_args =  tf_nump();

    ptr_parse_str = tf_getcstringp(1);
    ptr_fmt_str = tf_getcstringp(2);
    ptr = tf_getcstringp(3);
    ret_null_str = 0;

    if (*ptr_parse_str == 0) {
      tf_putp(0, 0); 
      return;
    }
    if (parse_debug == 1) 
      io_printf ("parse_debug: parse-str=%s, fmt-str=%s, max-args=%d\n", ptr_parse_str, ptr_fmt_str, max_args); 
    arg_count = 3;    
    
    c = *ptr_fmt_str++; // %
    c = *ptr_fmt_str++;    

    ptr_start = ptr_parse_str;
    for (i = 3; i <= (max_args); i++) {
      sep_c = *ptr_fmt_str++;
      if (parse_debug == 1) 
	io_printf ("parse_debug: sep-char=%c\n", sep_c); 
      ptr = ptr_start;
      while (ptr && *ptr && (*ptr != sep_c)) ptr++;
      ret_null_str = *ptr;
      *ptr = 0;
      if (parse_debug == 1) 
	io_printf ("parse_debug: value-string=%s\n", ptr_start); 
      avalue.value.str = strdup (ptr_start);
      ptr_start = ptr+1;

      switch (c) {
      case 'b': {
	/* Write the binary string into the register */
	avalue.format = accBinStrVal;
	acc_set_value(acc_handle_tfarg(i), &avalue, &delay_s);
	break;
      } /* %b */
      
      case 'd': {
	/* Write the decimal string into the register */
	avalue.format = accDecStrVal;
	acc_set_value(acc_handle_tfarg(i), &avalue, &delay_s);
	break;
      } /* %d */

      case 'e': {
	/* Write the floating string into the register */
	sscanf(ptr, "%e", &argf);
	avalue.format = accRealVal;
	avalue.value.real = argf;
	acc_set_value(acc_handle_tfarg(i), &avalue, &delay_s);
	break;
      } /* %e */

      case 'f': {
	/* Write the floating string into the register */
	sscanf(ptr, "%f", &argf);
	avalue.format = accRealVal;
	avalue.value.real = argf;
	acc_set_value(acc_handle_tfarg(i), &avalue, &delay_s);
	break;
      } /* %f */

      case 'g': {
	/* Write the floating string into the register */
	sscanf(ptr, "%g", &argf);
	avalue.format = accRealVal;
	avalue.value.real = argf;
	acc_set_value(acc_handle_tfarg(i), &avalue, &delay_s);
	break;
      } /* %g */

      case 'h': {
	/* Write the hexadecimal string into the register */
	avalue.format = accHexStrVal;
	acc_set_value(acc_handle_tfarg(i), &avalue, &delay_s);
	break;
      } /* %h */

      case 'o': {
	/* Write the octal string into the register */
	/* I'll give you a buck for anyone who still uses octal */
	avalue.format = accOctStrVal;
	acc_set_value(acc_handle_tfarg(i), &avalue, &delay_s);
	break;
      } /* %o */

      case 's': {
	avalue.format = accStringVal;
	acc_set_value(acc_handle_tfarg(i), &avalue, &delay_s);
	break;
      } /* %s */

      default: {
	tf_error("plus error in undefined format = %c", c);
	tf_dofinish();
      } /* default */
            
      } /* switch fmt->type */
      c = *ptr_fmt_str++; // %
      if (parse_debug == 1) 
	io_printf ("parse_debug: format string= %c ", c); 
      c = *ptr_fmt_str++;
      if (parse_debug == 1) 
	io_printf ("parse_debug: format char= %c\n", c); 

    }
    if (ret_null_str)
      avalue.value.str = strdup (ptr_start);
    else
      *avalue.value.str = 0;
    avalue.format = accStringVal;
    acc_set_value(acc_handle_tfarg(1), &avalue, &delay_s);
    tf_putp(0, 1);
    return;
}


