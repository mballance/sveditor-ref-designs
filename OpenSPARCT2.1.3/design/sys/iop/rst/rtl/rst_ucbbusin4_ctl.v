// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: rst_ucbbusin4_ctl.v
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
`define   ASSERT               1'b0            // For active low signal.
`define DEASSERT               1'b1            // For active low signal.

`define INFO   20
                                               //                     (Origin:)
`define IOB_CREG_RESET_GEN    40'h89_0000_0808 //Adr of RESET_GEN    reg (Fire.)
`define IOB_CREG_RESET_SOURCE 40'h89_0000_0818 //Adr of RESET_SOURCE reg (Fire.)
`define IOB_CREG_SSYSRESET    40'h89_0000_0838 //Adr of SSYS_RESET   reg (N1.)
`define IOB_CREG_RESETSTAT    40'h89_0000_0810 //Adr of RSET_STAT    reg (N1.)
`define IOB_CREG_CCU_TIME     40'h89_0000_0860 //Adr of CCU_TIME     reg (N2.)
`define IOB_CREG_LOCK_TIME    40'h89_0000_0870 //Adr of LOCK_TIME    reg (N2.)
`define IOB_CREG_PROP_TIME    40'h89_0000_0880 //Adr of PROP_TIME    reg (N2.)
`define IOB_CREG_NIU_TIME     40'h89_0000_0890 //Adr of NIU_TIME     reg (N2.)
`define IOB_CREG_RESET_FEE    40'h89_0000_0820 //Adr of RESET_FEE    reg (N2.)
//________________________________________________________________

`define RST_FSM_WIDTH           33
`define RST_INIT_STATE          33'h0_0000_0001
`define POR1_LOCK_TIME          33'h0_0000_0002
`define POR1_ARST_TIME          33'h0_0000_0004
`define POR1_SYNC_STABLE        33'h0_0000_0008
`define POR1_ASICFLUSH_STOP_ACK 33'h0_0000_0010
`define POR1_NIU_TIME           33'h0_0000_0020
`define POR1_FLUSH_STOP_ACK     33'h0_0000_0040
`define POR1_BISX_DONE          33'h0_0000_0080
`define POR2_FLUSH_INIT_ACK     33'h0_0000_0100
`define POR2_LOCK_TIME          33'h0_0000_0200
`define POR2_FLUSH_STOP_ACK     33'h0_0000_0400
`define POR2_EFU_DONE           33'h0_0000_0800
`define POR2_ASSERT_RUN         33'h0_0000_1000
`define POR2_UNPARK_THREAD      33'h0_0000_2000
`define WMR1_WMR_GEN            33'h0_0000_4000
`define WMR1_DEASSERT_RUN       33'h0_0000_8000
`define WMR1_FLUSH_INIT_ACK     33'h0_0001_0000
`define WMR1_PRE_PLL1           33'h0_0002_0000
`define WMR1_PRE_PLL2           33'h0_0004_0000
`define WMR1_CCU_PLL            33'h0_0008_0000
`define WMR1_LOCK_TIME          33'h0_0010_0000
`define WMR1_ARST_TIME          33'h0_0020_0000
`define WMR1_PROP_TIME          33'h0_0040_0000
`define WMR1_SYNC_STABLE        33'h0_0080_0000
`define WMR1_FLUSH_STOP_ACK     33'h0_0100_0000
`define WMR1_BISX_DONE          33'h0_0200_0000
`define WMR2_FLUSH_INIT_ACK     33'h0_0400_0000
`define WMR2_PROP_TIME          33'h0_0800_0000
`define WMR2_FLUSH_STOP_ACK     33'h0_1000_0000
`define WMR2_NIU_TIME           33'h1_0000_0000
`define WMR2_ASSERT_RUN         33'h0_2000_0000
`define WMR2_UNPARK_THREAD      33'h0_4000_0000
`define RST_ARBITER             33'h0_8000_0000

`define XIR_IDLE                 2'h1
`define XIR_DONE                 2'h2

`define DMU_IDLE                 3'h1
`define DMU_TIME1                3'h2
`define DMU_TIME2                3'h4

`define NIU_IDLE                 2'h1
`define NIU_TIME                 2'h2
//________________________________________________________________

// Already taken addresses, in address order:
// sort -t "'" -k 2 /home/jl148824/project/NCU/include/iop.h:

//`define IOB_CREG_INTMAN            32'h00000000
//`define IOB_CREG_INTSTAT           32'h00000000
//`define IOB_CREG_INTCTL            32'h00000400
//`define IOB_CREG_MDATA0            32'h00000400
//`define IOB_CREG_MDATA1            32'h00000500
//`define IOB_CREG_MDATA0_ALIAS      32'h00000600
//`define IOB_CREG_MDATA1_ALIAS      32'h00000700
//`define IOB_CREG_INTVECDISP        32'h00000800
//                                   32'h00000808 // Adr of RESET_GEN    reg.
// Bill Bryg removed the CHIP_RESET reg from the Niagara 1 spec Feb 4 '03.
//`define IOB_CREG_RESETSTAT         32'h00000810 // Adr of RSET_STAT    reg.
//`define IOB_CREG_SERNUM            32'h00000820
//`define IOB_CREG_TMSTATCTRL        32'h00000828
//`define IOB_CREG_COREAVAIL         32'h00000830
//`define IOB_CREG_SSYSRESET         32'h00000838 // Adr of SSYS_RESET   reg.
//`define IOB_CREG_FUSESTAT          32'h00000840
//`define IOB_CREG_MARGIN            32'h00000850
//`define IOB_CREG_MBUSY             32'h00000900
//`define IOB_CREG_JINTV             32'h00000a00
//`define IOB_CREG_MBUSY_ALIAS       32'h00000b00
//`define IOB_CREG_DBG_IOBVIS_CTRL   32'h00001000
//`define IOB_CREG_DBG_L2VIS_CTRL    32'h00001800 
//`define IOB_CREG_DBG_L2VIS_MASKA   32'h00001820 
//`define IOB_CREG_DBG_L2VIS_MASKB   32'h00001828 
//`define IOB_CREG_DBG_L2VIS_CMPA    32'h00001830
//`define IOB_CREG_DBG_L2VIS_CMPB    32'h00001838
//`define IOB_CREG_DBG_L2VIS_TRIG    32'h00001840
//`define IOB_CREG_DBG_ENET_CTRL     32'h00002000
//`define IOB_CREG_DBG_ENET_IDLEVAL  32'h00002008
//`define IOB_CREG_DBG_JBUS_CTRL     32'h00002100
//`define IOB_CREG_DBG_JBUS_LO_MASK0 32'h00002140
//`define IOB_CREG_DBG_JBUS_LO_CMP0  32'h00002148
//`define IOB_CREG_DBG_JBUS_LO_CNT0  32'h00002150
//`define IOB_CREG_DBG_JBUS_LO_MASK1 32'h00002160
//`define IOB_CREG_DBG_JBUS_LO_CMP1  32'h00002168
//`define IOB_CREG_DBG_JBUS_LO_CNT1  32'h00002170
//`define IOB_CREG_DBG_JBUS_HI_MASK0 32'h00002180
//`define IOB_CREG_DBG_JBUS_HI_CMP0  32'h00002188
//`define IOB_CREG_DBG_JBUS_HI_CNT0  32'h00002190
//`define IOB_CREG_DBG_JBUS_HI_MASK1 32'h000021a0
//`define IOB_CREG_DBG_JBUS_HI_CMP1  32'h000021a8
//`define IOB_CREG_DBG_JBUS_HI_CNT1  32'h000021b0
//________________________________________________________________

// Verilog define statements for:
//   rst_ucbbusin4_ctl.sv    and:
//   rst_ucbbusout4_ctl.sv:

`define UCB_BUS_WIDTH     4
`define UCB_BUS_WIDTH_M1  3
`define CYC_NUM          32
`define CYC_NUM_M1       31

`define RST_UCB_DATA_WIDTH 16
// Width of:
//   data_in_io            ;// Convert    from io  to cmp to sys.
//   data_in_sys           ;// Convert    from io  to cmp to sys.
//   data_out_sys2         ;// Convert    from sys to cmp.
//   data_out_cmp2         ;// Convert    from sys to cmp to io.
// The following stay 64 bits wide:
//   data_in               ;// Convert    from io  to cmp to sys.
//   data_out              ;// Converted  from        cmp to io.
// If you modify RST_UCB_DATA_WIDTH, adjust the width of x'b0 in
// the following two concatenations:
//   assign         data_out     [                   63:0] =
//   assign data_out_sys[`RST_UCB_DATA_WIDTH-1:0] =

`define RST_TIME_WIDTH 16
// Width of:
//   lock_time_addr    ? {32'b0, lock_time_q   [31:0] }:// LOCK_TIME
//   prop_time_addr    ? {32'b0, prop_time_q   [31:0] }:// PROP_TIME
//   niu_time_addr     ? {32'b0, niu_time_q    [31:0] }:// NIU_TIME
//   msff_ctl_macro lock_time_ff         (width=32,en=1,clr_=1)
//   msff_ctl_macro lock_count_ff        (width=32,en=0,clr_=1)
//   msff_ctl_macro prop_time_ff         (width=32,en=1,clr_=1)
//   msff_ctl_macro prop_count_ff        (width=32,en=0,clr_=1)
//   msff_ctl_macro niu_time_ff          (width=32,en=1,clr_=1)
//   msff_ctl_macro niu_count_ff         (width=32,en=0,clr_=1)
//   msff_ctl_macro dmu_time_ff          (width=32,en=1,clr_=1)
//   msff_ctl_macro dmu_count_ff         (width=32,en=0,clr_=1)


// `define UCB_BUS_WIDTH 4
// `define UCB_BUS_WIDTH_M1 3
// `define CYC_NUM 32
// `define CYC_NUM_M1 31

module rst_ucbbusin4_ctl (
  iol2clk, 
  ucb_clr_io_, 
  scan_in, 
  scan_out, 
  tcu_pce_ov, 
  tcu_clk_stop, 
  tcu_aclk, 
  tcu_bclk, 
  tcu_scan_en, 
  vld, 
  data, 
  stall, 
  indata_buf_vld, 
  indata_buf, 
  stall_a1) ;
wire stall_d1_;
wire stall_d1;
wire vld_d1_ff_scanin;
wire vld_d1_ff_scanout;
wire vld_d1;
wire l1clk;
wire data_d1_ff_scanin;
wire data_d1_ff_scanout;
wire [3:0] data_d1;
wire stall_ff_scanin;
wire stall_ff_scanout;
wire stall_d1_ff_scanin;
wire stall_d1_ff_scanout;
wire skid_buf0_en;
wire vld_buf0_ff_scanin;
wire vld_buf0_ff_scanout;
wire vld_buf0;
wire data_buf0_ff_scanin;
wire data_buf0_ff_scanout;
wire [3:0] data_buf0;
wire skid_buf1_en_ff_scanin;
wire skid_buf1_en_ff_scanout;
wire skid_buf1_en;
wire vld_buf1_ff_scanin;
wire vld_buf1_ff_scanout;
wire vld_buf1;
wire data_buf1_ff_scanin;
wire data_buf1_ff_scanout;
wire [3:0] data_buf1;
wire skid_buf0_sel;
wire skid_buf1_sel_ff_scanin;
wire skid_buf1_sel_ff_scanout;
wire skid_buf1_sel;
wire vld_mux;
wire [3:0] data_mux;
wire [31:0] indata_vec_next;
wire [31:0] indata_vec;
wire stall_a1_;
wire indata_vec_ff_scanin;
wire indata_vec_ff_scanout;
wire [127:0] indata_buf_next;
wire indata_buf_ff_scanin;
wire indata_buf_ff_scanout;
wire indata_vec0_d1_ff_scanin;
wire indata_vec0_d1_ff_scanout;
wire indata_vec0_d1;
wire siclk;
wire soclk;
wire pce_ov;
wire stop;
wire se;


////////////////////////////////////////////////////////////////////////
// Signal declarations
////////////////////////////////////////////////////////////////////////
// Global interface
input		iol2clk;
input		ucb_clr_io_;           //BP 8-19-05
input		scan_in;
output		scan_out;
input		tcu_pce_ov;
input		tcu_clk_stop;
input		tcu_aclk    ;
input		tcu_bclk    ;
input		tcu_scan_en ;

// UCB bus interface
input		vld;
input [`UCB_BUS_WIDTH_M1 :0]	data;
output		stall;


// Local interface
output		indata_buf_vld;
output [127:0]	indata_buf;
input		stall_a1;


// Internal signals

////////////////////////////////////////////////////////////////////////
// Code starts here
////////////////////////////////////////////////////////////////////////
/************************************************************
 * UCB bus interface flops
 * This is to make signals going between IOB and UCB flop-to-flop
 * to improve timing.
 ************************************************************/
assign stall_d1_ = ~stall_d1;
rst_ucbbusin4_ctl_msff_ctl_macro__clr__1__en_1__width_1 vld_d1_ff   
				(
				.scan_in(vld_d1_ff_scanin),
				.scan_out(vld_d1_ff_scanout),
				.dout		(vld_d1),
				.clr_		(ucb_clr_io_),	//BP 8-19-05
				.l1clk		(l1clk),
				.en		(stall_d1_),
				.din		(vld),
  .siclk(siclk),
  .soclk(soclk)
				);

rst_ucbbusin4_ctl_msff_ctl_macro__clr__1__en_1__width_4 data_d1_ff   
				(
				.scan_in(data_d1_ff_scanin),
				.scan_out(data_d1_ff_scanout),
				.dout		(data_d1[`UCB_BUS_WIDTH_M1:0]),
				.clr_		(ucb_clr_io_),	//BP 8-19-05
				.l1clk		(l1clk),
				.en		(stall_d1_),
				.din		(data[`UCB_BUS_WIDTH_M1:0]),
  .siclk(siclk),
  .soclk(soclk)
				);

rst_ucbbusin4_ctl_msff_ctl_macro__clr__1__width_1 stall_ff  
				(
				.scan_in(stall_ff_scanin),
				.scan_out(stall_ff_scanout),
				.dout		(stall),
				.clr_		(ucb_clr_io_),	//BP 8-19-05
				.l1clk		(l1clk),
				.din		(stall_a1),
  .siclk(siclk),
  .soclk(soclk)
				);

rst_ucbbusin4_ctl_msff_ctl_macro__clr__1__width_1 stall_d1_ff  
				(
				.scan_in(stall_d1_ff_scanin),
				.scan_out(stall_d1_ff_scanout),
				.dout		(stall_d1),
				.clr_		(ucb_clr_io_),	//BP 8-19-05
				.l1clk		(l1clk),
				.din		(stall),
  .siclk(siclk),
  .soclk(soclk)
				);


/************************************************************
 * Skid buffer
 * We need a two deep skid buffer to handle stalling.
 ************************************************************/
// Assertion: stall has to be deasserted for more than 1 cycle
//            ie time between two separate stalls has to be
//            at least two cycles.  Otherwise, contents from
//            skid buffer will be lost.

// Buffer 0
assign  skid_buf0_en = stall_a1 & ~stall;

rst_ucbbusin4_ctl_msff_ctl_macro__clr__1__en_1__width_1 vld_buf0_ff   
				(
				.scan_in(vld_buf0_ff_scanin),
				.scan_out(vld_buf0_ff_scanout),
				.dout		(vld_buf0),
				.clr_		(ucb_clr_io_),	//BP 8-19-05
				.l1clk		(l1clk),
				.en		(skid_buf0_en),
				.din		(vld_d1),
  .siclk(siclk),
  .soclk(soclk)
				);

rst_ucbbusin4_ctl_msff_ctl_macro__clr__1__en_1__width_4 data_buf0_ff    
				(
				.scan_in(data_buf0_ff_scanin),
				.scan_out(data_buf0_ff_scanout),
				.dout		(data_buf0[`UCB_BUS_WIDTH_M1 :0]),
				.clr_		(ucb_clr_io_),	//BP 8-19-05
				.l1clk		(l1clk),
				.en		(skid_buf0_en),
				.din		(data_d1[`UCB_BUS_WIDTH_M1 :0]),
  .siclk(siclk),
  .soclk(soclk)
				);

// Buffer 1
rst_ucbbusin4_ctl_msff_ctl_macro__clr__1__width_1 skid_buf1_en_ff  
				(
				.scan_in(skid_buf1_en_ff_scanin),
				.scan_out(skid_buf1_en_ff_scanout),
				.dout		(skid_buf1_en),
				.clr_		(ucb_clr_io_),	//BP 8-19-05
				.l1clk		(l1clk),
				.din		(skid_buf0_en),
  .siclk(siclk),
  .soclk(soclk)
				);

rst_ucbbusin4_ctl_msff_ctl_macro__clr__1__en_1__width_1 vld_buf1_ff   
				(
				.scan_in(vld_buf1_ff_scanin),
				.scan_out(vld_buf1_ff_scanout),
				.dout		(vld_buf1),
				.clr_		(ucb_clr_io_),	//BP 8-19-05
				.l1clk		(l1clk),
				.en		(skid_buf1_en),
				.din		(vld_d1),
  .siclk(siclk),
  .soclk(soclk)
				);

rst_ucbbusin4_ctl_msff_ctl_macro__clr__1__en_1__width_4 data_buf1_ff    
				(
				.scan_in(data_buf1_ff_scanin),
				.scan_out(data_buf1_ff_scanout),
				.dout		(data_buf1[`UCB_BUS_WIDTH_M1 :0]),
				.clr_		(ucb_clr_io_),	//BP 8-19-05
				.l1clk		(l1clk),
				.en		(skid_buf1_en),
				.din		(data_d1[`UCB_BUS_WIDTH_M1 :0]),
  .siclk(siclk),
  .soclk(soclk)
				);


/************************************************************
 * Mux between skid buffer and interface flop
 ************************************************************/
// Assertion: stall has to be deasserted for more than 1 cycle
//            ie time between two separate stalls has to be
//            at least two cycles.  Otherwise, contents from
//            skid buffer will be lost.

assign	skid_buf0_sel = ~stall_a1 & stall;

rst_ucbbusin4_ctl_msff_ctl_macro__clr__1__width_1 skid_buf1_sel_ff  
				(
				.scan_in(skid_buf1_sel_ff_scanin),
				.scan_out(skid_buf1_sel_ff_scanout),
				.dout		(skid_buf1_sel),
				.clr_		(ucb_clr_io_),	//BP 8-19-05
				.l1clk		(l1clk),
				.din		(skid_buf0_sel),
  .siclk(siclk),
  .soclk(soclk)
				);

assign	vld_mux = skid_buf0_sel ? vld_buf0 : 
	   	     skid_buf1_sel ? vld_buf1 :
		                     vld_d1;

assign	data_mux[`UCB_BUS_WIDTH_M1 :0] = skid_buf0_sel ? data_buf0[`UCB_BUS_WIDTH_M1 :0] : 
					skid_buf1_sel ? data_buf1[`UCB_BUS_WIDTH_M1 :0] : 
					       		 data_d1[`UCB_BUS_WIDTH_M1 :0];


/************************************************************
 * Assemble inbound data
 ************************************************************/
// valid vector
assign	indata_vec_next[`CYC_NUM_M1:0] = {vld_mux, indata_vec[`CYC_NUM_M1 :1]};

assign	stall_a1_ = ~stall_a1;
rst_ucbbusin4_ctl_msff_ctl_macro__clr__1__en_1__width_32 indata_vec_ff    
				(
				.scan_in(indata_vec_ff_scanin),
				.scan_out(indata_vec_ff_scanout),
				.dout		(indata_vec[`CYC_NUM_M1 :0]),
				.clr_		(ucb_clr_io_),	//BP 8-19-05
				.l1clk		(l1clk),
				.en		(stall_a1_),
				.din		(indata_vec_next[`CYC_NUM_M1 :0]),
  .siclk(siclk),
  .soclk(soclk)
				);

// data buffer
assign	indata_buf_next[127:0] = {data_mux[`UCB_BUS_WIDTH_M1 :0], indata_buf[127:`UCB_BUS_WIDTH ]};
rst_ucbbusin4_ctl_msff_ctl_macro__clr__1__en_1__width_128 indata_buf_ff   
				(
				.scan_in(indata_buf_ff_scanin),
				.scan_out(indata_buf_ff_scanout),
				.dout		(indata_buf[127:0]),
				.clr_		(ucb_clr_io_),	//BP 8-19-05
				.l1clk		(l1clk),
				.en		(stall_a1_),
				.din		(indata_buf_next[127:0]),
  .siclk(siclk),
  .soclk(soclk)
				);

// detect a new packet	  
rst_ucbbusin4_ctl_msff_ctl_macro__clr__1__en_1__width_1 indata_vec0_d1_ff   
				(
				.scan_in(indata_vec0_d1_ff_scanin),
				.scan_out(indata_vec0_d1_ff_scanout),
				.dout		(indata_vec0_d1),
				.clr_		(ucb_clr_io_),	//BP 8-19-05
				.l1clk		(l1clk),
				.en		(stall_a1_),
				.din		(indata_vec[0]),
  .siclk(siclk),
  .soclk(soclk)
				);

assign	indata_buf_vld = indata_vec[0] & ~indata_vec0_d1;



/**** adding clock header ****/
rst_ucbbusin4_ctl_l1clkhdr_ctl_macro clkgen (
				.l2clk	(iol2clk),
				.l1en	(1'b1),
                             // .pce_ov (1'b0   ),
                                .stop   (1'b0   ),
                             // .se     (1'b0   ),
				.l1clk	(l1clk),
  .pce_ov(pce_ov),
  .se(se)
				);

/*** building tcu port ***/
assign	siclk  = tcu_aclk    ;
assign	soclk  = tcu_bclk    ;
assign	pce_ov = tcu_pce_ov  ;
assign	stop   = tcu_clk_stop;
// scan renames
assign  se     = tcu_scan_en ;
// end scan

// fixscan start:
assign vld_d1_ff_scanin          = scan_in                  ;
assign data_d1_ff_scanin         = vld_d1_ff_scanout        ;
assign stall_ff_scanin           = data_d1_ff_scanout       ;
assign stall_d1_ff_scanin        = stall_ff_scanout         ;
assign vld_buf0_ff_scanin        = stall_d1_ff_scanout      ;
assign data_buf0_ff_scanin       = vld_buf0_ff_scanout      ;
assign skid_buf1_en_ff_scanin    = data_buf0_ff_scanout     ;
assign vld_buf1_ff_scanin        = skid_buf1_en_ff_scanout  ;
assign data_buf1_ff_scanin       = vld_buf1_ff_scanout      ;
assign skid_buf1_sel_ff_scanin   = data_buf1_ff_scanout     ;
assign indata_vec_ff_scanin      = skid_buf1_sel_ff_scanout ;
assign indata_buf_ff_scanin      = indata_vec_ff_scanout    ;
assign indata_vec0_d1_ff_scanin  = indata_buf_ff_scanout    ;
assign scan_out                  = indata_vec0_d1_ff_scanout;
// fixscan end:
endmodule // ucb_bus_in






// any PARAMS parms go into naming of macro

module rst_ucbbusin4_ctl_msff_ctl_macro__clr__1__en_1__width_1 (
  din, 
  en, 
  clr_, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [0:0] fdin;

  input [0:0] din;
  input en;
  input clr_;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [0:0] dout;
  output scan_out;
assign fdin[0:0] = (din[0:0] & {1{en}} & ~{1{(~clr_)}}) | (dout[0:0] & ~{1{en}} & ~{1{(~clr_)}});






dff #(1)  d0_0 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[0:0]),
.si(scan_in),
.so(scan_out),
.q(dout[0:0])
);












endmodule













// any PARAMS parms go into naming of macro

module rst_ucbbusin4_ctl_msff_ctl_macro__clr__1__en_1__width_4 (
  din, 
  en, 
  clr_, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [3:0] fdin;
wire [2:0] so;

  input [3:0] din;
  input en;
  input clr_;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [3:0] dout;
  output scan_out;
assign fdin[3:0] = (din[3:0] & {4{en}} & ~{4{(~clr_)}}) | (dout[3:0] & ~{4{en}} & ~{4{(~clr_)}});






dff #(4)  d0_0 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[3:0]),
.si({scan_in,so[2:0]}),
.so({so[2:0],scan_out}),
.q(dout[3:0])
);












endmodule













// any PARAMS parms go into naming of macro

module rst_ucbbusin4_ctl_msff_ctl_macro__clr__1__width_1 (
  din, 
  clr_, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [0:0] fdin;

  input [0:0] din;
  input clr_;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [0:0] dout;
  output scan_out;
assign fdin[0:0] = din[0:0] & ~{1{(~clr_)}};






dff #(1)  d0_0 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[0:0]),
.si(scan_in),
.so(scan_out),
.q(dout[0:0])
);












endmodule













// any PARAMS parms go into naming of macro

module rst_ucbbusin4_ctl_msff_ctl_macro__clr__1__en_1__width_32 (
  din, 
  en, 
  clr_, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [31:0] fdin;
wire [30:0] so;

  input [31:0] din;
  input en;
  input clr_;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [31:0] dout;
  output scan_out;
assign fdin[31:0] = (din[31:0] & {32{en}} & ~{32{(~clr_)}}) | (dout[31:0] & ~{32{en}} & ~{32{(~clr_)}});






dff #(32)  d0_0 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[31:0]),
.si({scan_in,so[30:0]}),
.so({so[30:0],scan_out}),
.q(dout[31:0])
);












endmodule













// any PARAMS parms go into naming of macro

module rst_ucbbusin4_ctl_msff_ctl_macro__clr__1__en_1__width_128 (
  din, 
  en, 
  clr_, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [127:0] fdin;
wire [126:0] so;

  input [127:0] din;
  input en;
  input clr_;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [127:0] dout;
  output scan_out;
assign fdin[127:0] = (din[127:0] & {128{en}} & ~{128{(~clr_)}}) | (dout[127:0] & ~{128{en}} & ~{128{(~clr_)}});






dff #(128)  d0_0 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[127:0]),
.si({scan_in,so[126:0]}),
.so({so[126:0],scan_out}),
.q(dout[127:0])
);












endmodule













// any PARAMS parms go into naming of macro

module rst_ucbbusin4_ctl_l1clkhdr_ctl_macro (
  l2clk, 
  l1en, 
  pce_ov, 
  stop, 
  se, 
  l1clk);


  input l2clk;
  input l1en;
  input pce_ov;
  input stop;
  input se;
  output l1clk;



 

cl_sc1_l1hdr_8x c_0 (


   .l2clk(l2clk),
   .pce(l1en),
   .l1clk(l1clk),
  .se(se),
  .pce_ov(pce_ov),
  .stop(stop)
);



endmodule








