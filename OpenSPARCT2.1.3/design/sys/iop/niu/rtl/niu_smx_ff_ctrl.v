// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: niu_smx_ff_ctrl.v
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

module niu_smx_ff_ctrl(/*AUTOARG*/
   // Outputs
   full, empty, mwr, mwaddr, mrd, mraddr, 
   // Inputs
   clk, reset_l, wr, rd
   );
	//
	// auto read ahead at mem (ram/regfl); 
	// data available at rdata bus when
	// empty flag is 0;
	// tailor for mem file with rd control
	// and data available one cycle after rd;
	//
	// empty flag adjust to match data out 
	//
	// whenever not empty, reader sees valid data 
	// at rdata bus;
	//
	// note for ram, rdata reflects output
	// at ram (no registered out)
	//
	// for regfl, rdata is registered
	// 
parameter ADDR_WIDTH= 4;

// fifo if
input clk;
input reset_l;

input wr;
input rd;                  

output full;
output empty;


// mem if (ram/regfl)
output mwr;
output [ADDR_WIDTH-1:0] mwaddr;
output mrd;
output [ADDR_WIDTH-1:0] mraddr;


/*
output [DATA_WIDTH-1:0]rdata;
wire [DATA_WIDTH-1:0]rdata_n; // reflects at ram/regfl out immediate

wire [DATA_WIDTH-1:0]rdata= rdata_n; // reflects fifo out
*/


reg pre_empty, pre_empty_n;     // reflects at ram/regfl out immediate
reg pre_empty1;
wire empty= (pre_empty)? pre_empty : pre_empty1;
		// if empty, reflects immediate;
		// if transition to not empty (ie. empty= 0), 
		// delay 1 cycle with pre_empty1;
		// in a corner case when both pre_empty, pre_empty1=0, 
		// and rd, wr at same time (rd going into a just written entry),
		// force delay 1 cycle by making pre_empty1= 1
reg [ADDR_WIDTH-1:0] wptr;
reg [ADDR_WIDTH-1:0] rptr;  // reflects ptr to ram/regfl
wire [ADDR_WIDTH-1:0] wptr_n= wptr + 1'b1;
wire [ADDR_WIDTH-1:0] rptr_n= rptr + 1'b1;
 
always @ (posedge clk) begin
  if(!reset_l)
    pre_empty1<= `SMX_PD  1'b1;
  else
    if(({rd,wr} == 2'b11) && (rptr_n==wptr))
			// rptr going to just written entry;
                        // data not available until nxt cycle at wr
                        //  make empty first
      pre_empty1<= `SMX_PD  1'b1;
    else
      pre_empty1<= `SMX_PD  pre_empty; // add one cycle to empty to match
                         // data availablility at wr (from empty to not-empty)
end


reg full, full_n;

 always @ (posedge clk) begin
    if(!reset_l) begin
      wptr<= `SMX_PD  {ADDR_WIDTH{1'b0}};
      rptr<= `SMX_PD  {ADDR_WIDTH{1'b0}};
      full<= `SMX_PD  1'b0;
      pre_empty<= `SMX_PD  1'b1;
    end
    else begin
      full<= `SMX_PD  full_n;
      pre_empty<= `SMX_PD  pre_empty_n;
      if(wr) wptr<= `SMX_PD  wptr_n;

      if(rd) rptr<= `SMX_PD  rptr_n;
    end  // not reset
  end    // always

wire [ADDR_WIDTH-1:0] wptr_cmp_n= wptr + 1'b1; // use wptr_cmp_n in case needs 
					      // to make full ahead;
					      // driver must NOT register wr if 
					      // inc by 1'b1 !!!! 	
                           		      // if driver register wr;
					      // make full ahead (inc by 2;
                           		      // one more word on line
                                              // before it sees the full
                           		      // status)


 always @ (/*AUTOSENSE*/full or pre_empty or rd or rptr or rptr_n
	   or wptr or wptr_cmp_n or wr) begin
    full_n= full;
    pre_empty_n= pre_empty;
    case({rd,wr})
      2'b00: begin
               full_n= full;
               pre_empty_n= pre_empty;
             end
      2'b01: begin
               if(full) // auto ignore wr if already full
                 full_n= full;
               else
                 full_n= (wptr_cmp_n==rptr)? 1'b1 : 1'b0;
               pre_empty_n= 1'b0;
             end
      2'b10: begin
               if(full) // make sure read enough before taking away full
                 full_n= (wptr_cmp_n==rptr_n)? 1'b0 : 1'b1;
               else
                 full_n= 1'b0;
               if(pre_empty) // auto ignore rd if already empty
                 pre_empty_n= pre_empty;
               else
                 pre_empty_n= (rptr_n==wptr)? 1'b1 : 1'b0;
             end
      2'b11: begin
               full_n= full;
               pre_empty_n= pre_empty;
             end
      endcase
  end   // always


wire [ADDR_WIDTH-1:0] mem_rptr_n= (rd)? rptr_n : rptr;
			// read ahead next entry when reading current
// mem if 
wire [ADDR_WIDTH-1:0] mraddr= mem_rptr_n;
wire [ADDR_WIDTH-1:0] mwaddr= wptr;
wire mrd= !(mem_rptr_n==wptr); // read whenever fifo not empty
wire mwr= wr;

endmodule

