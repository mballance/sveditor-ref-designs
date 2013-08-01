// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: dmu_psb_default_grp.v
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
module dmu_psb_default_grp 
	(
	clk,
	psb_dma_ext_select,
	psb_dma_select,
	psb_dma_ext_read_data,
	psb_dma_ext_done,
	psb_pio_ext_select,
	psb_pio_select,
	psb_pio_ext_read_data,
	psb_pio_ext_done,
	rst_l,
	ext_addr_in,
	ext_addr_out,
	read_data_0_out,
	ext_done_0_out
	);

//====================================================
//     Polarity declarations
//====================================================
input  clk;  // Clock signal
output psb_dma_ext_select;  // When set, register psb_dma is selected. This
                            // signal is a level.
input  psb_dma_select;  // select
input  [`FIRE_CSRBUS_DATA_WIDTH - 1:0] psb_dma_ext_read_data;  // Read Data
input  psb_dma_ext_done;  // ExtDone
output psb_pio_ext_select;  // When set, register psb_pio is selected. This
                            // signal is a level.
input  psb_pio_select;  // select
input  [`FIRE_CSRBUS_DATA_WIDTH - 1:0] psb_pio_ext_read_data;  // Read Data
input  psb_pio_ext_done;  // ExtDone
input  rst_l;  // HW reset
input  [4:0] ext_addr_in;  // Ext addr
output [4:0] ext_addr_out;  // Ext addr
output [`FIRE_CSRBUS_DATA_WIDTH - 1:0] read_data_0_out;  // Read Data
output ext_done_0_out;  // Ext Done

//====================================================
//     Type declarations
//====================================================
wire clk;  // Clock signal
wire psb_dma_ext_select;  // When set, register psb_dma is selected. This signal
                          // is a level.
wire psb_dma_select;  // select
wire [`FIRE_CSRBUS_DATA_WIDTH - 1:0] psb_dma_ext_read_data;  // Read Data
wire psb_dma_ext_done;  // ExtDone
wire psb_pio_ext_select;  // When set, register psb_pio is selected. This signal
                          // is a level.
wire psb_pio_select;  // select
wire [`FIRE_CSRBUS_DATA_WIDTH - 1:0] psb_pio_ext_read_data;  // Read Data
wire psb_pio_ext_done;  // ExtDone
wire rst_l;  // HW reset
wire [4:0] ext_addr_in;  // Ext addr
wire [4:0] ext_addr_out;  // Ext addr
wire [`FIRE_CSRBUS_DATA_WIDTH - 1:0] read_data_0_out;  // Read Data
reg ext_done_0_out;  // Ext Done


//====================================================
//   Local signals
//====================================================

//====================================================
//     Pipelining (First stage)
//====================================================
//----- delayed select for ext_select
reg psb_dma_select_piped;
reg psb_pio_select_piped;

always @(posedge clk)
  begin
     if(~rst_l)
       begin
          ext_done_0_out <= 1'b0;
          psb_dma_select_piped <= 1'b0;
          psb_pio_select_piped <= 1'b0;
       end
     else
       begin
          ext_done_0_out <=
             psb_dma_ext_done |
             psb_pio_ext_done;

          psb_dma_select_piped <= psb_dma_select;
          psb_pio_select_piped <= psb_pio_select;
        end
  end

//====================================================
//     Assignments only (first stage)
//====================================================
assign ext_addr_out = ext_addr_in;

//====================================================
//      Automatic hw_ld / hw_write
//====================================================

//====================================================
//      Extern select
//====================================================
assign psb_dma_ext_select =
           psb_dma_select_piped;

assign psb_pio_ext_select =
           psb_pio_select_piped;


//=====================================================
//      OUTPUT: read_data_out
//=====================================================
dmu_psb_csrpipe_2 dmu_psb_csrpipe_2_inst_1
	(
	.clk	(clk),
	.rst_l	(rst_l),
	.reg_in	(1'b1),
	.reg_out	(1'b1),
	.data0	(psb_dma_ext_read_data),
	.sel0	(psb_dma_select),
	.data1	(psb_pio_ext_read_data),
	.sel1	(psb_pio_select),
	.out	(read_data_0_out)
	);


//====================================================
//     Instantiation of registers
//====================================================

endmodule // dmu_psb_default_grp
