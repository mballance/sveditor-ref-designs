// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: niu_ipp_pkt_dsc.v
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
/**********************************************************
***********************************************************

    Project         : Niu 

    File name       : niu_ipp_pkt_dsc.v

    Module(s) name  : niu_ipp_pkt_dsc

    Parent modules  : niu_ipp.v

    Child modules   :                              

    Author's name   : George Chu 

    Date            : January 2004

    Description     : This file lists packet discard condition 

    Synthesis Notes:

    Modification History:

    Date       Description
    ----       -----------

************************************************************
***********************************************************/

module niu_ipp_pkt_dsc (
                        ipp_hfifo_par_err_inc,
                        ipp_runt,
                        clr_ipp_unload,
                        reset,
                        clk,
                        ipp_dsc_pkt,
                        ipp_inc_pkt_dsc_cnt
                       );

input           ipp_hfifo_par_err_inc; 
input           ipp_runt; 
input           clr_ipp_unload;                 // 1 cycle pulse 

input           reset;
input           clk;          			// clock

output          ipp_dsc_pkt;
output          ipp_inc_pkt_dsc_cnt;

reg             ipp_dsc_pkt;
wire            ipp_inc_pkt_dsc_cnt = ipp_dsc_pkt && clr_ipp_unload ||
                                      ipp_runt;

wire            discard_pkt   = (ipp_hfifo_par_err_inc);

wire            n_ipp_dsc_pkt = (reset || clr_ipp_unload) ? 1'h0 :
                                 discard_pkt              ? 1'h1 : ipp_dsc_pkt;

  always @(posedge clk)
    ipp_dsc_pkt <= n_ipp_dsc_pkt;

endmodule

