// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: tiia_checkers.v
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
module tiia_checkers;


`define tiia_top `CPU.dmu
`define tiia_clk `tiia_top.l1clk
//`define tiia_clk `tiia_top.iol2clk
`define tiia_rst ~`tiia_top.wmr_
//`define tiia_rst ~`tiia_top.rst_wmr_  // this is before it goes thru clk hdr


////////////////////////
// known/driven checkers

/* 0in known_driven -var `tiia_top.y2k_rcd_enq
   -clock `tiia_clk -reset `tiia_rst */
/* 0in known_driven -var `tiia_top.y2k_rcd
   -active `tiia_top.y2k_rcd_enq
   -clock `tiia_clk -reset `tiia_rst */
/* 0in known_driven -var `tiia_top.k2y_rcd_deq
   -clock `tiia_clk -reset `tiia_rst */

/* 0in known_driven -var `tiia_top.k2y_rcd_enq
   -clock `tiia_clk -reset `tiia_rst */
/* 0in known_driven -var `tiia_top.k2y_rcd
   -active `tiia_top.k2y_rcd_enq
   -clock `tiia_clk -reset `tiia_rst */
/* 0in known_driven -var `tiia_top.y2k_rcd_deq
   -clock `tiia_clk -reset `tiia_rst */

/* 0in known_driven -var `tiia_top.k2y_rel_enq
   -clock `tiia_clk -reset `tiia_rst */
/* 0in known_driven -var `tiia_top.k2y_rel_rcd
   -active `tiia_top.k2y_rel_enq
   -clock `tiia_clk -reset `tiia_rst */

/* 0in known_driven -var `tiia_top.y2k_rel_enq
   -clock `tiia_clk -reset `tiia_rst */
/* 0in known_driven -var `tiia_top.y2k_rel_rcd
   -active `tiia_top.y2k_rel_enq
   -clock `tiia_clk -reset `tiia_rst */

/* 0in known_driven -var `tiia_top.k2y_buf_addr
   -clock `tiia_clk -reset `tiia_rst */


//////////////////
// credit checkers

// fails with simultaneous enq/deq

/* ~0in fifo -depth 5
   -enq `tiia_top.y2k_rcd_enq
   -deq `tiia_top.k2y_rcd_deq
   -clock `tiia_clk -reset `tiia_rst */

/* ~0in fifo -depth 4
   -enq `tiia_top.k2y_rcd_enq
   -deq `tiia_top.y2k_rcd_deq
   -clock `tiia_clk -reset `tiia_rst */


//////////////////////////
// ingress record checkers - see Fire MAS 5-586 table 7-1

wire [`FIRE_DLC_IPE_ADDR_WDTH-1:0]  y2k_rcd_addr;
wire [`FIRE_DLC_IPE_FDWBE_WDTH-1:0] y2k_rcd_fdwbe;
wire [`FIRE_DLC_IPE_LDWBE_WDTH-1:0] y2k_rcd_ldwbe;
wire [`FIRE_DLC_IPE_TAG_WDTH-1:0]   y2k_rcd_tag;
wire [`FIRE_DLC_IPE_REQID_WDTH-1:0] y2k_rcd_reqid;
wire [`FIRE_DLC_IPE_LEN_WDTH-1:0]   y2k_rcd_len;
wire [`FIRE_DLC_IPE_ATR_WDTH-1:0]   y2k_rcd_atr;
wire [`FIRE_DLC_IPE_TC_WDTH-1:0]    y2k_rcd_tc;
wire [`FIRE_DLC_IPE_TYPE_WDTH-1:0]  y2k_rcd_type;
wire [`FIRE_DLC_IPE_F_WDTH-1:0]     y2k_rcd_f;

assign y2k_rcd_addr  = `tiia_top.y2k_rcd[`FIRE_DLC_IPE_ADDR_MSB:`FIRE_DLC_IPE_ADDR_LSB];
assign y2k_rcd_fdwbe = `tiia_top.y2k_rcd[`FIRE_DLC_IPE_FDWBE_MSB:`FIRE_DLC_IPE_FDWBE_LSB];
assign y2k_rcd_ldwbe = `tiia_top.y2k_rcd[`FIRE_DLC_IPE_LDWBE_MSB:`FIRE_DLC_IPE_LDWBE_LSB];
assign y2k_rcd_tag   = `tiia_top.y2k_rcd[`FIRE_DLC_IPE_TAG_MSB:`FIRE_DLC_IPE_TAG_LSB];
assign y2k_rcd_reqid = `tiia_top.y2k_rcd[`FIRE_DLC_IPE_REQID_MSB:`FIRE_DLC_IPE_REQID_LSB];
assign y2k_rcd_len   = `tiia_top.y2k_rcd[`FIRE_DLC_IPE_LEN_MSB:`FIRE_DLC_IPE_LEN_LSB];
assign y2k_rcd_atr   = `tiia_top.y2k_rcd[`FIRE_DLC_IPE_ATR_MSB:`FIRE_DLC_IPE_ATR_LSB];
assign y2k_rcd_tc    = `tiia_top.y2k_rcd[`FIRE_DLC_IPE_TC_MSB:`FIRE_DLC_IPE_TC_LSB];
assign y2k_rcd_type  = `tiia_top.y2k_rcd[`FIRE_DLC_IPE_TYPE_MSB:`FIRE_DLC_IPE_TYPE_LSB];
assign y2k_rcd_f     = `tiia_top.y2k_rcd[`FIRE_DLC_IPE_F_MSB:`FIRE_DLC_IPE_F_LSB];

parameter   
	      IDMA_MRD32   = 7'b0000000,
	      IDMA_MRD64   = 7'b0100000,
	      IDMA_MRDLK32 = 7'b0000001,
	      IDMA_MRDLK64 = 7'b0100001,
	      IDMA_MWR32   = 7'b1000000,
	      IDMA_MWR64   = 7'b1100000,
	      IDMA_UR      = 7'b0001001,
 	      // the lower 3 bits of a dma are dont-care
	      IDMA_MSG0    = 7'b0110000,
	      IDMA_MSG1    = 7'b0110001,
	      IDMA_MSG2    = 7'b0110010,
	      IDMA_MSG3    = 7'b0110011,
	      IDMA_MSG4    = 7'b0110100,
	      IDMA_MSG5    = 7'b0110101,
	      IDMA_MSG6    = 7'b0110110,
	      IDMA_MSG7    = 7'b0110111,
	      IPIO_CPL     = 7'b0001010,
	      IPIO_CPLD    = 7'b1001010;

/* 0in value
   -var {y2k_rcd_f, y2k_rcd_type}
   -val IDMA_MRD32 IDMA_MRD64 IDMA_MRDLK32 IDMA_MRDLK64 IDMA_MWR32 IDMA_MWR64 
        IDMA_UR          IPIO_CPL IPIO_CPLD
        IDMA_MSG0 IDMA_MSG1 IDMA_MSG2 IDMA_MSG3 IDMA_MSG4 IDMA_MSG5 IDMA_MSG6 IDMA_MSG7 
   -active `tiia_top.y2k_rcd_enq
   -clock `tiia_clk 
   -reset `tiia_rst
 */



/////////////////////////
// egress record checkers - see Fire MAS 5-596 table 7-21

wire [`FIRE_DLC_EPE_DPTR_WDTH-1:0]  k2y_rcd_dptr;
wire [`FIRE_DLC_EPE_ADDR_WDTH-1:0]  k2y_rcd_addr;
wire [`FIRE_DLC_EPE_FDWBE_WDTH-1:0] k2y_rcd_fdwbe;
wire [`FIRE_DLC_EPE_LDWBE_WDTH-1:0] k2y_rcd_ldwbe;
wire [`FIRE_DLC_EPE_TAG_WDTH-1:0]   k2y_rcd_tag;
wire [`FIRE_DLC_EPE_REQID_WDTH-1:0] k2y_rcd_reqid;

wire [`FIRE_DLC_EPE_LEN_WDTH-1:0]  k2y_rcd_len;
wire [`FIRE_DLC_EPE_ATR_WDTH-1:0]  k2y_rcd_atr;
wire [`FIRE_DLC_EPE_TC_WDTH-1:0]   k2y_rcd_tc;
wire [`FIRE_DLC_EPE_TYPE_WDTH-1:0] k2y_rcd_type;
wire [`FIRE_DLC_EPE_F_WDTH-1:0]    k2y_rcd_f;

assign k2y_rcd_dptr  = `tiia_top.k2y_rcd[`FIRE_DLC_EPE_DPTR_MSB:`FIRE_DLC_EPE_DPTR_LSB];
assign k2y_rcd_addr  = `tiia_top.k2y_rcd[`FIRE_DLC_EPE_ADDR_MSB:`FIRE_DLC_EPE_ADDR_LSB];
assign k2y_rcd_fdwbe = `tiia_top.k2y_rcd[`FIRE_DLC_EPE_FDWBE_MSB:`FIRE_DLC_EPE_FDWBE_LSB];
assign k2y_rcd_ldwbe = `tiia_top.k2y_rcd[`FIRE_DLC_EPE_LDWBE_MSB:`FIRE_DLC_EPE_LDWBE_LSB];
assign k2y_rcd_tag   = `tiia_top.k2y_rcd[`FIRE_DLC_EPE_TAG_MSB:`FIRE_DLC_EPE_TAG_LSB];
assign k2y_rcd_reqid = `tiia_top.k2y_rcd[`FIRE_DLC_EPE_REQID_MSB:`FIRE_DLC_EPE_REQID_LSB];
assign k2y_rcd_len   = `tiia_top.k2y_rcd[`FIRE_DLC_EPE_LEN_MSB:`FIRE_DLC_EPE_LEN_LSB];
assign k2y_rcd_atr   = `tiia_top.k2y_rcd[`FIRE_DLC_EPE_ATR_MSB:`FIRE_DLC_EPE_ATR_LSB];
assign k2y_rcd_tc    = `tiia_top.k2y_rcd[`FIRE_DLC_EPE_TC_MSB:`FIRE_DLC_EPE_TC_LSB];
assign k2y_rcd_type  = `tiia_top.k2y_rcd[`FIRE_DLC_EPE_TYPE_MSB:`FIRE_DLC_EPE_TYPE_LSB];
assign k2y_rcd_f     = `tiia_top.k2y_rcd[`FIRE_DLC_EPE_F_MSB:`FIRE_DLC_EPE_F_LSB];

parameter   
	      EPIO_MRD32   = 7'b00_00000,
	      EPIO_MRD64   = 7'b01_00000,
	      EPIO_IORD    = 7'b00_00010,
	      EPIO_CFGRD0  = 7'b00_00100,
	      EPIO_CFGRD1  = 7'b00_00101,
	      EPIO_MWR32   = 7'b10_00000,
	      EPIO_MWR64   = 7'b11_00000,
	      EPIO_IOWR    = 7'b10_00010,
	      EPIO_CFGWR0  = 7'b10_00100,
	      EPIO_CFGWR1  = 7'b10_00101,
	      EDMA_CPL     = 7'b00_01010,
	      EDMA_CPLLK   = 7'b00_01011,
	      EDMA_CPLD    = 7'b10_01010;

/* 0in value
   -var {k2y_rcd_f,k2y_rcd_type}
   -val EPIO_MRD32 EPIO_MRD64 EPIO_IORD EPIO_CFGRD0 EPIO_CFGRD1 EPIO_MWR32 EPIO_MWR64
        EPIO_IOWR EPIO_CFGWR0 EPIO_CFGWR1 EDMA_CPL EDMA_CPLLK EDMA_CPLD
   -active `tiia_top.k2y_rcd_enq
   -clock `tiia_clk 
   -reset `tiia_rst
 */


/* 0in value
   -var k2y_rcd_tc
   -val 3'h0
   -active ( `tiia_top.k2y_rcd_enq &
             ( ( k2y_rcd_type == 5'h00 ) |
               ( k2y_rcd_type == 5'h02 ) |
               ( k2y_rcd_type == 5'h04 ) |
               ( k2y_rcd_type == 5'h05 ) ) )
   -clock `tiia_clk -reset `tiia_rst */

/* 0in value
   -var k2y_rcd_atr
   -val 2'h0
   -active ( `tiia_top.k2y_rcd_enq &
             ( ( k2y_rcd_type == 5'h00 ) |
               ( k2y_rcd_type == 5'h02 ) |
               ( k2y_rcd_type == 5'h04 ) |
               ( k2y_rcd_type == 5'h05 ) ) )
   -clock `tiia_clk -reset `tiia_rst */

/* 0in value
   -var k2y_rcd_len
   -val 10'h1
   -active ( `tiia_top.k2y_rcd_enq &
             ( ( k2y_rcd_type == 5'h02 ) |
               ( k2y_rcd_type == 5'h04 ) |
               ( k2y_rcd_type == 5'h05 ) ) )
   -clock `tiia_clk -reset `tiia_rst */

/* 0in value
   -var k2y_rcd_len
   -val 10'h0
   -active ( `tiia_top.k2y_rcd_enq &
             ( ( {k2y_rcd_f,k2y_rcd_type} == EDMA_CPL ) |
               ( {k2y_rcd_f,k2y_rcd_type} == EDMA_CPLLK ) ) )
   -clock `tiia_clk -reset `tiia_rst */

/* xxx0in value
   -var k2y_rcd_reqid
   -val 16'h0000
   -active `tiia_top.k2y_rcd_enq
   -clock `tiia_clk 
   -reset `tiia_rst 
 */

/* 0in value
   -var k2y_rcd_ldwbe
   -val 4'h0
   -active ( `tiia_top.k2y_rcd_enq &
             ( ( k2y_rcd_type == 5'h02 ) |
               ( k2y_rcd_type == 5'h04 ) |
               ( k2y_rcd_type == 5'h05 ) ) )
   -clock `tiia_clk 
   -reset `tiia_rst 
 */


endmodule // tiia_checkers
