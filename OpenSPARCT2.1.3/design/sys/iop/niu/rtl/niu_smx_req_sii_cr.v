// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: niu_smx_req_sii_cr.v
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

module niu_smx_req_sii_cr(
/*AUTOARG*/
   // Outputs
   ocr_avail, bcr_avail, 
   // Inputs
   clk, reset_l,
   sii_niu_oqdq, sii_niu_bqdq, o_enq, b_enq
   );

input clk;
input reset_l;

// sii if
input 		sii_niu_oqdq;
input 		sii_niu_bqdq;

// arb if
input 		o_enq;
input 		b_enq;
output 		ocr_avail;
output 		bcr_avail;


reg [4:0] order_cr;
reg [4:0] bypass_cr;

reg sii_niu_oqdq_r, sii_niu_bqdq_r;
always @(posedge clk) begin
  if(!reset_l) begin
    sii_niu_oqdq_r<= `SMX_PD  1'b0;
    sii_niu_bqdq_r<= `SMX_PD  1'b0;
  end
  else begin
    sii_niu_oqdq_r<= `SMX_PD  sii_niu_oqdq;
    sii_niu_bqdq_r<= `SMX_PD  sii_niu_bqdq;
  end
end

wire o_deq= sii_niu_oqdq_r;
wire b_deq= sii_niu_bqdq_r;

wire inc_ocr_n= o_deq & ~o_enq; 
wire dec_ocr_n= ~o_deq & o_enq; 

wire inc_bcr_n= b_deq & ~b_enq; 
wire dec_bcr_n= ~b_deq & b_enq; 


	// clamp cr in case over
wire [4:0] inc_order_cr_n= (order_cr==`SMX_SII_MAX_ORD_CR)? `SMX_SII_MAX_ORD_CR : 
						order_cr + 1'b1; 
wire [4:0] dec_order_cr_n= (order_cr==5'h0)? 5'h0 : order_cr - 1'b1; 

wire [4:0] inc_bypass_cr_n= (bypass_cr==`SMX_SII_MAX_BYP_CR)? `SMX_SII_MAX_BYP_CR : 
						bypass_cr + 1'b1; 
wire [4:0] dec_bypass_cr_n= (bypass_cr==5'h0)? 5'h0 : bypass_cr - 1'b1; 

always @(posedge clk) begin
  if(!reset_l) begin
    order_cr<= `SMX_PD  `SMX_SII_MAX_ORD_CR; 
    bypass_cr<= `SMX_PD  `SMX_SII_MAX_BYP_CR; 
  end
  else begin 
    if(inc_ocr_n) order_cr<= `SMX_PD  inc_order_cr_n; 
    else if(dec_ocr_n) order_cr<= `SMX_PD  dec_order_cr_n;
    if(inc_bcr_n) bypass_cr<= `SMX_PD  inc_bypass_cr_n;
    else if(dec_bcr_n) bypass_cr<= `SMX_PD  dec_bypass_cr_n;
  end
end

wire ocr_avail= |order_cr;
wire bcr_avail= |bypass_cr;

endmodule
 


