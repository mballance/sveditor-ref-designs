// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: dispmonDefines.vh
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
`ifdef DISPMONDEFINESVH

`else

`define DISPMONDEFINESVH


// Level 49 - Errors - default ON
`define ERROR 49
// incErr and incWarn are functions that inc
// the counts. They always return >0.
`define PR_ERROR if (`TOP.incErr(1)) $dispmon
`define WR_ERROR if (`TOP.incErr(1)) $writemon
// Level 48 - Warnings - default ON
`define WARN 48
// incErr and incWarn are functions that inc
// the counts. They always return >0.
`define PR_WARN if (`TOP.incWarn(1)) $dispmon
`define WR_WARN if (`TOP.incWarn(1)) $writemon
// Level 30 - General - default ON
`define NORMAL 30
`define PR_NORMAL if (`TOP.quiet!==1'b1) $dispmon
`define WR_NORMAL if (`TOP.quiet!==1'b1) $writemon
// Level 20 - Informational - default off
`define INFO 20
`define PR_INFO if (`TOP.info===1'b1) $dispmon
`define WR_INFO if (`TOP.info===1'b1) $writemon
// Level 1 - Debug - default off
`define DEBUG 1
`define PR_DEBUG if (`TOP.debug===1'b1) $dispmon
`define WR_DEBUG if (`TOP.debug===1'b1) $writemon
// Level 0 - Always - Always ON
`define ALWAYS 0
`define PR_ALWAYS $dispmon
`define WR_ALWAYS $writemon

// These are used in vera. Including for flexability.
// We should have just one set but it may be too late...
`define MON_ALWAYS      0
`define MON_DEBUG       1
`define MON_DBG         1
`define MON_INFO        20
`define MON_NORMAL      30
`define MON_WARN        48
`define MON_ERR         49
`define MON_ERROR       49

`endif
