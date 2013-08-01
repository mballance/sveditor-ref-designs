// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: dmu_ilu_isb.v
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
module dmu_ilu_isb (
			 clk,
			 rst_l,
			 eil2isb_log,
			 eil2isb_tag,
			 eil2isb_low_addr,
			 iil2isb_clr,
			 iil2isb_tag,
			 isb2iil_vld,
			 isb2iil_low_addr,

                         // debug
                         low_dbg_sel_a,
                         low_dbg_sel_b,
                         isb_dbg_a,
                         isb_dbg_b, 			 

			 // idle check
			 isb_is_idle );
  
  //synopsys sync_set_reset "my_rst_l"
  
  // >>>>>>>>>>>>>>>>>>>>>>>>> Parameter Declarations <<<<<<<<<<<<<<<<<<<<<<<<<

  // >>>>>>>>>>>>>>>>>>>>>>>>> Port Declarations <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<

  input		clk;		// input clock
  input		rst_l;	        // input reset
  
  input 	eil2isb_log;    // turn the eil2isb_tag associated valid bit on
  input [4:0] 	eil2isb_tag;
  input [3:2] 	eil2isb_low_addr;

  input 	iil2isb_clr;    // turn the iil2isb_tag associated valid bit off
  input [4:0] 	iil2isb_tag;
  output 	isb2iil_vld;
  output [3:2] 	isb2iil_low_addr;

  output 	isb_is_idle;

  //------------------------------------------------------------------------
  //   debug
  //------------------------------------------------------------------------
  input [2:0]                         low_dbg_sel_a;
  input [2:0]                         low_dbg_sel_b;
  output [`FIRE_DBG_DATA_BITS]        isb_dbg_a;
  output [`FIRE_DBG_DATA_BITS]        isb_dbg_b;

  // >>>>>>>>>>>>>>>>>>>>>>>>> Data Type Declarations <<<<<<<<<<<<<<<<<<<<<<<<<

  // ~~~~~~~~~~~~~~~~~~~~~~~~~ REGISTER - FLOPS ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
  reg [31:0] 	isb_pio_vld;    // score board vector for non-posted outstanding PIOs
  reg [3:2] 	isb_pio_low_addr [0:31] ; 

  // ~~~~~~~~~~~~~~~~~~~~~~~~~ REGISTER - NON-FLOPS ~~~~~~~~~~~~~~~~~~~~~~~~~~

  // ~~~~~~~~~~~~~~~~~~~~~~~~~ REGISTER - FLOPS ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  reg [`FIRE_DBG_DATA_BITS]           dbg_bus [0:1];

  // ~~~~~~~~~~~~~~~~~~~~~~~~~ REGISTER - NON-FLOPS ~~~~~~~~~~~~~~~~~~~~~~~~

  reg [`FIRE_DBG_DATA_BITS]           nxt_dbg_bus [0:1];
  reg [2:0]                           dbg_sel [0:1];

  integer                              j;

  // ~~~~~~~~~~~~~~~~~~~~~~~~~ NETS ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  
  // >>>>>>>>>>>>>>>>>>>>>>>>> RTL/Behavioral Model <<<<<<<<<<<<<<<<<<<<<<<<<<<

  
  assign isb2iil_vld = isb_pio_vld[iil2isb_tag];
  assign isb2iil_low_addr = isb_pio_low_addr[iil2isb_tag];
  
  always @ (posedge clk)
    if (!rst_l) begin
      isb_pio_vld <= 32'b0;
		begin:	addr_rst
		integer i;
    for (i = 0; i < 32; i = i + 1) begin
	isb_pio_low_addr[i] <= {2{1'b0}};
		end
		end
   end
    else begin
      if (iil2isb_clr) isb_pio_vld[iil2isb_tag] <= 1'b0;
      if (eil2isb_log) begin
	isb_pio_vld[eil2isb_tag] <= 1'b1;
	isb_pio_low_addr[eil2isb_tag] <= eil2isb_low_addr;
      end
    end
  
  //---------------------------------------------------------------------
  // idle check output - when there is no PIO transaction pending, it's idle
  //---------------------------------------------------------------------
  assign isb_is_idle = ~(|isb_pio_vld);

  //---------------------------------------------------------------------
  // debug
  //---------------------------------------------------------------------

  always @ (low_dbg_sel_a or low_dbg_sel_b) begin
    dbg_sel[0] = low_dbg_sel_a;
    dbg_sel[1] = low_dbg_sel_b;
  end

  always @ (dbg_sel[0] or dbg_sel[1] or
	    eil2isb_log or
	    eil2isb_tag or
	    iil2isb_clr or
	    iil2isb_tag or
	    isb2iil_vld or
	    isb_pio_vld ) begin : dbg_out
	    integer i;
    for (i = 0; i < 2; i = i + 1) begin
      case (dbg_sel[i]) // synopsys infer_mux
        3'b000: nxt_dbg_bus[i] = {2'b0, eil2isb_log, eil2isb_tag};
        3'b001: nxt_dbg_bus[i] = {1'b0, iil2isb_clr, iil2isb_tag, isb2iil_vld};
        3'b010: nxt_dbg_bus[i] = isb_pio_vld[31:24];
        3'b011: nxt_dbg_bus[i] = isb_pio_vld[23:16];
        3'b100: nxt_dbg_bus[i] = isb_pio_vld[15:8];
        3'b101: nxt_dbg_bus[i] = isb_pio_vld[7:0];
        3'b110: nxt_dbg_bus[i] = 8'b0;
        3'b111: nxt_dbg_bus[i] = 8'b0;
      endcase
    end
  end

  assign isb_dbg_a = dbg_bus[0];
  assign isb_dbg_b = dbg_bus[1];

  always @ (posedge clk) 
	if(~rst_l) begin : dbg_rst
	  integer i;
    for (i = 0; i < 2; i = i + 1) begin
      dbg_bus[i] <= {8{1'b0}};
	  end
     end
	else begin
    for (j = 0; j < 2; j = j + 1) begin
      dbg_bus[j] <= nxt_dbg_bus[j];
    end
  end


  
  
endmodule // dmu_ilu_isb

