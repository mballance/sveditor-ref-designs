// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: niu_smx_sm_req_datareq.v
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

module niu_smx_sm_req_datareq(
/*AUTOARG*/
   // Outputs
   rst_cmdflag, datareq_busy, datareq_idle, datareq, dreq_cs, 
   // Inputs
   clk, reset_l, cmdflag, cmdflag_data, early_cmdflag_n, 
   early_cmdflag_data_n, dv_pad_done, cfg_pad_wait
   );

input		clk;
input		reset_l;

	// cmdreq if
input 		cmdflag;
input [4:0] 	cmdflag_data;
input 		early_cmdflag_n;
input [4:0] 	early_cmdflag_data_n;
output 		rst_cmdflag; 
output 		datareq_busy;
output 		datareq_idle;

	// dmc if
output 		datareq;

	// dv if
input 		dv_pad_done;
input		cfg_pad_wait;

output [2:0] 	dreq_cs;

reg rst_cmdflag_n;
wire rst_cmdflag= rst_cmdflag_n;

parameter s0= 3'h0,
	  s1= 3'h1,
	  s2= 3'h2,
	  s3= 3'h3,
	  s4= 3'h4,
	  s5= 3'h5;

reg datareq_n, datareq;
reg [2:0] dreq_ns, dreq_cs;
wire datareq_busy= (!(dreq_cs==s0)|| cmdflag); 
wire datareq_idle= (dreq_cs==s0);

always @(posedge clk)begin
  if(!reset_l) begin
    datareq<= `SMX_PD  1'b0;
    dreq_cs<= `SMX_PD  s0;
  end
  else begin
    datareq<= `SMX_PD  datareq_n;
    dreq_cs<= `SMX_PD  dreq_ns;
  end
end

reg ld_cmdflag_data_n;
reg [4:0] cmdflag_data_r;
always @(posedge clk)begin
  if(ld_cmdflag_data_n) cmdflag_data_r<= `SMX_PD  (cmdflag)? cmdflag_data : 
					     early_cmdflag_data_n;
end

always @(/*AUTOSENSE*/cfg_pad_wait or cmdflag or cmdflag_data
	 or cmdflag_data_r or dreq_cs or dv_pad_done
	 or early_cmdflag_data_n or early_cmdflag_n) begin
  datareq_n= 1'b0;
  ld_cmdflag_data_n= 1'b0;
  rst_cmdflag_n= 1'b0;
  dreq_ns= dreq_cs;
  case(dreq_cs)
    s0: begin
	  if(cmdflag || early_cmdflag_n) begin // wait for flag
	    datareq_n= (cmdflag)? cmdflag_data[0] : early_cmdflag_data_n[0];
	    ld_cmdflag_data_n= 1'b1;
	    rst_cmdflag_n= cmdflag; // clear flag for next 
	    dreq_ns= s1;
	  end
        end
    s1: begin
	  datareq_n= cmdflag_data_r[1];
	  dreq_ns= s2;
	end 
    s2: begin
	  datareq_n= cmdflag_data_r[2];
	  dreq_ns= s3;
	end 
    s3: begin
	  datareq_n= cmdflag_data_r[3];
	  dreq_ns= ((&cmdflag_data_r[3:0]) | ~cfg_pad_wait)? 
				((cmdflag_data_r[4])? s5 : s0): s4;
	end 
    s4: begin // wait dv done pad; 
		// only for pad case in case client 
		// pack lastline (which needs pad) 
		// with next line (no gap)
		// (despite datareq issues gap at pad,
		// no guarantee client return with same gap)
          if(dv_pad_done) begin
	    dreq_ns= s0;
	  end
	end
    s5: begin // eop dummy state
	  dreq_ns= s0;
        end
  endcase
end

endmodule
