// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: tx_byte_counter.v
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
/*%W%	%G%*/

/*******************************************************************
 *
 * File Name    : tx_byte_counter.v
 * Author Name  : John Lo
 * Description  : 
 * Parent Module: xmac
 * Child  Module: 
 * Interface Mod: 
 * Date Created : 3/24/04
 *
 * Copyright (c) 2020, Sun Microsystems, Inc. 
 * Sun Proprietary and Confidential   
 *
 * 
 * Modification :
 * 
 * Synthesis Notes: 
 * 
 ******************************************************************/

module tx_byte_counter (
       tx_clk, 
       tx_reset, 
       last_byte_position,
       eop_tag,
       tx_byte_count_en,
// outputs
       tx_byte_count,
       nx_tx_byte_count
       );

   input           tx_clk;
   input           tx_reset;
   input [2:0]     last_byte_position;
   input           eop_tag;
   input           tx_byte_count_en;
   output [13:0]   tx_byte_count;
   output [13:0]   nx_tx_byte_count;

   reg [13:0]   nx_tx_byte_count;
   
always @ (tx_byte_count_en or eop_tag or tx_byte_count or last_byte_position)
  if (tx_byte_count_en)
    casex (eop_tag) // synopsys parallel_case full_case
       1'b0:    nx_tx_byte_count = tx_byte_count + 8; // in the middle of xfr
       1'b1:    nx_tx_byte_count = tx_byte_count + 1 + {11'b0,last_byte_position};
    endcase // casex({eop_tag})
  else          nx_tx_byte_count = tx_byte_count ;
   

 // We can only support 16k jumbo packet	
RegRst #(14) tx_byte_count_RegRst (
.clk(tx_clk),
.reset(tx_reset),
.din(nx_tx_byte_count),
.qout(tx_byte_count));

endmodule // tx_byte_counter

