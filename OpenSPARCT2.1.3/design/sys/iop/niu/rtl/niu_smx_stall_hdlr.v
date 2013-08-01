// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: niu_smx_stall_hdlr.v
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

module niu_smx_stall_hdlr(
/*AUTOARG*/
   // Outputs
   niu_dbg1_stall_ack, stall_enable, 
   // Inputs
   clk, reset_l, dbg1_niu_stall, dbg1_niu_resume, 
   tid_valid_rdata_bus, wreq_cmdreq_idle, rdreq_cmdreq_idle, 
   wreq_cmdff_empty, rdreq_cmdff_empty, siireq_idle,
   smx_nc_err	
   );

input clk;
input reset_l;

input     dbg1_niu_stall;
input	  dbg1_niu_resume;
output    niu_dbg1_stall_ack;


// status if
input [63:0] tid_valid_rdata_bus; 
output 		stall_enable;

input		wreq_cmdreq_idle;
input		rdreq_cmdreq_idle;
input		wreq_cmdff_empty;
input		rdreq_cmdff_empty;
input		siireq_idle;	

input		smx_nc_err; //non-recoverable error


parameter stall_s0= 2'h0, 
	  stall_s1= 2'h1,
	  stall_s2= 2'h2; 

reg niu_dbg1_stall_ack, niu_dbg1_stall_ack_n;
reg stall;
reg set_stall_n, rst_stall_n;
reg [1:0] stall_cs, stall_ns;
reg tid_done;
reg dbg1_niu_stall_r;
reg dbg1_niu_resume_r;

wire stall_enable= stall | smx_nc_err;

wire all_done_n= tid_done && wreq_cmdreq_idle && rdreq_cmdreq_idle &&
		wreq_cmdff_empty && rdreq_cmdff_empty && siireq_idle;

always @(posedge clk)  begin
  if(!reset_l) begin
    dbg1_niu_stall_r<= `SMX_PD 1'b0;
    dbg1_niu_resume_r<= `SMX_PD 1'b0;
    tid_done<= `SMX_PD 1'b0;
  end
  else begin
    dbg1_niu_stall_r<= `SMX_PD dbg1_niu_stall;
    dbg1_niu_resume_r<= `SMX_PD dbg1_niu_resume;
    tid_done<= `SMX_PD ~(|tid_valid_rdata_bus);
  end 
end

always @(posedge clk)  begin
  if(!reset_l) begin
    niu_dbg1_stall_ack<= `SMX_PD 1'b0;
    stall<= `SMX_PD 1'b0;
    stall_cs<= 	`SMX_PD 2'h0;
  end
  else begin
    niu_dbg1_stall_ack<= `SMX_PD niu_dbg1_stall_ack_n;
    if(set_stall_n) stall<= `SMX_PD 1'b1;
    else if(rst_stall_n) stall<= `SMX_PD 1'b0;
    stall_cs<= 	`SMX_PD stall_ns;
  end
end

always @ (/*AUTOSENSE*/all_done_n or dbg1_niu_resume_r
	  or dbg1_niu_stall_r or stall_cs) begin
  niu_dbg1_stall_ack_n= 1'b0;
  set_stall_n= 1'b0;
  rst_stall_n= 1'b0;
  stall_ns= stall_cs;
  case(stall_cs) 
    stall_s0: begin	// idle; wait dbg1 stall 
		if(dbg1_niu_stall_r) begin
		  set_stall_n= 1'b1;
		  stall_ns= stall_s1;
	 	end
	      end	
    stall_s1: begin	// wait all done
		if(all_done_n) begin
		  niu_dbg1_stall_ack_n= 1'b1;
		  stall_ns= stall_s2;
		end
	      end	
    stall_s2: begin	// wait resume
	 	if(dbg1_niu_resume_r) begin
		  rst_stall_n= 1'b1;
		  stall_ns= stall_s0;
		end
	      end	
  endcase
end

endmodule

