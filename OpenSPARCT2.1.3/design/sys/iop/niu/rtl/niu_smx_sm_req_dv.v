// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: niu_smx_sm_req_dv.v
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

module niu_smx_sm_req_dv(
/*AUTOARG*/
   // Outputs
   ff_wr, ff_wdata, pcmd_ff_wr, pcmd_ff_wdata, lnen_ff_rd, 
   dv_pad_done, dv_cs, 
   // Inputs
   clk, reset_l, dv, data, data_status, xfer_comp, lnen_ff_rdata, 
   lnen_ff_empty
   );

input		clk;
input		reset_l;

	// dmc if
input 		dv;
input [127:0] 	data;
input [3:0] 	data_status; // ???
input 		xfer_comp;

	// dataff if
output 		ff_wr;
output [127:0] 	ff_wdata;

	// reqcmd if
// output 		eop;

	// pcmd_ff if
output 		pcmd_ff_wr;
output [3:0] 	pcmd_ff_wdata; // ??? not sure what to write yet

	// lnen ff if
input [4:0] 	lnen_ff_rdata; // {eop, line_en[3:0]}
input		lnen_ff_empty;
output  	lnen_ff_rd;

	// datareq if
output		dv_pad_done;

output[1:0] dv_cs;

parameter s0= 2'h0,
	  s1= 2'h1,
	  s2= 2'h2,
	  s3= 2'h3;

reg ff_wr_n;
wire ff_wr= ff_wr_n;
wire [127:0] ff_wdata_n= (dv)? data : 128'h0;
wire [127:0] ff_wdata= ff_wdata_n;

reg lnen_ff_rd_n;
wire lnen_ff_rd= lnen_ff_rd_n;

reg[1:0] dv_cs, dv_ns;
reg comp0, comp0_n;
reg comp1, comp1_n;
reg comp2, comp2_n;
// reg comp3, comp3_n;
// reg eop, eop_n;
reg eop_n;

reg  ld_status_n;
reg [3:0] status;
wire [3:0] data_status_or_status_n= (data_status | status);

reg  or_status_n;
reg pcmd_ff_wr_n;
wire pcmd_ff_wr= pcmd_ff_wr_n;
wire [3:0] pcmd_ff_wdata_n= (or_status_n)?  status : 
				 data_status_or_status_n;
		// sample at s3; need to look at data_status if dv  
wire [3:0] pcmd_ff_wdata= pcmd_ff_wdata_n;

wire dv_pad_done= ~(&lnen_ff_rdata[3:0]) & eop_n;

	// lnen_ff (line enable) added to match expected dv;  
	// this is incase client dv comes back as non-contiguous 64B;
	// client must "space out" per datareq in order to pad
always @ (/*AUTOSENSE*/comp0 or comp1 or comp2 or dv or dv_cs
	  or lnen_ff_empty or lnen_ff_rdata or xfer_comp) begin
  ff_wr_n= 1'b0;
  pcmd_ff_wr_n= 1'b0;
  lnen_ff_rd_n= 1'b0; 
  ld_status_n= 1'b0;
  or_status_n= 1'b0;
  dv_ns= dv_cs;
  comp0_n= comp0;
  comp1_n= comp1;
  comp2_n= comp2;
  eop_n= 1'b0;
  case(dv_cs)
    s0: begin
          if(!lnen_ff_empty) begin
		// lnen_ff_rdata[3:0] check if 0; handle spc??? 		
            if(dv) begin
	      ff_wr_n= 1'b1;
	      ld_status_n= 1'b1;
	      dv_ns= s1;
    	      comp0_n= xfer_comp;
            end
          end
	end 
    s1: begin  	
	  if(lnen_ff_rdata[1]) begin 
	    ff_wr_n= dv;
	    dv_ns= (dv)? s2 : s1;
          end
	  else begin
	    ff_wr_n= 1'b1;
	    dv_ns= s2;
 	  end
	  or_status_n= dv;
    	  comp1_n= dv&xfer_comp;
	end 
    s2: begin
	  if(lnen_ff_rdata[2]) begin 
	    ff_wr_n= dv;
	    dv_ns= (dv)? s3 : s2;
          end
	  else begin
	    ff_wr_n= 1'b1;
	    dv_ns= s3;
	  end
	  or_status_n= dv;
    	  comp2_n= dv&xfer_comp;
	end 
    s3: begin
	  if(lnen_ff_rdata[3]) begin 
	    ff_wr_n= dv;
	    dv_ns= (dv)? s0 : s3;
  	    lnen_ff_rd_n= dv;
	    pcmd_ff_wr_n= dv; // move data comp to the 4th line
    	    eop_n= dv & (xfer_comp | comp2 | comp1 | comp0 | lnen_ff_rdata[4]);
          end
	  else begin
	    ff_wr_n= 1'b1;
	    dv_ns= s0;
  	    lnen_ff_rd_n= 1'b1; 
	    pcmd_ff_wr_n= 1'b1;
    	    eop_n= (dv&xfer_comp) | comp2 | comp1 | comp0 | lnen_ff_rdata[4];
	  end
	  or_status_n= dv;
	end 
  endcase
end

always @(posedge clk) begin
  if(!reset_l) begin
    dv_cs<= `SMX_PD  s0;
    comp0<= `SMX_PD  1'b0;
    comp1<= `SMX_PD  1'b0;
    comp2<= `SMX_PD  1'b0;
//    eop<= `SMX_PD  1'b0;
  end
  else begin
    dv_cs<= `SMX_PD  dv_ns;
    comp0<= `SMX_PD  comp0_n;
    comp1<= `SMX_PD  comp1_n;
    comp2<= `SMX_PD  comp2_n;
//    eop<= `SMX_PD  eop_n;
  end
end

always @(posedge clk) begin
  if(!reset_l)
    status<= `SMX_PD  4'h0;
  else begin
    if(ld_status_n) status<= `SMX_PD  data_status;
    else 
     if(or_status_n) status<= `SMX_PD  data_status_or_status_n;
  end
end


endmodule
