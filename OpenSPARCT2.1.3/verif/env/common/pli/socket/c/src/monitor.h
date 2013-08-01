/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: monitor.h
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
#ifndef _MONITOR_H_
#define _MONITOR_H_
#define MON_ALWAYS     0      /* (ON always) Printing REQUIRED messages */
#define MON_DEBUG      1      /* (OFF by default) Use for printing 
                                 more detailed debug info  */
#define MON_INFO      20      /* (OFF by default) Use for printing 
                                 info critical to debug by anyone */
#define MON_NORMAL    30       /* (ON by default) Used for concise status 
                                 info useful to everyone */
#define MON_WARN      48      /* (ON by default) Only generates warnings 
                                 does not end the simulation */
#define MON_ERR       49      /* (ON by default) Used for error 
                                 conditions the simulation WILL stop */

#include <stdarg.h>
#include <stdlib.h>
extern int cWritemon(const char *unitName, int tag, const char *format, ...);
extern int cDispmon(const char *unitName, int tag, const char *format, ...);
void cDomon(int p_add_newline, const char *p_unitName, int p_tag, 
    const char *p_format, va_list p_args);
char *dispmon_parse(const char *fmt, int nump, int start, 
		    const char *unit);
size_t monitor_nfmtargs(char *fmt);
#endif
