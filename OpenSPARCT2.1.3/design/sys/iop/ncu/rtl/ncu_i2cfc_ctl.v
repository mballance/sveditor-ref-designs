// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: ncu_i2cfc_ctl.v
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
`define RF_RDEN_OFFSTATE            1'b1

//====================================
`define NCU_INTMANRF_DEPTH         128
`define NCU_INTMANRF_DATAWIDTH      16
`define NCU_INTMANRF_ADDRWIDTH       7
//====================================

//====================================
`define NCU_MONDORF_DEPTH           64
`define NCU_MONDORF_DATAWIDTH       72
`define NCU_MONDORF_ADDRWIDTH        6
//====================================

//====================================
`define NCU_CPUBUFRF_DEPTH          32
`define NCU_CPUBUFRF_DATAWIDTH     144
`define NCU_CPUBUFRF_ADDRWIDTH       5
//====================================

//====================================
`define NCU_IOBUFRF_DEPTH          32
`define NCU_IOBUFRF_DATAWIDTH     144
`define NCU_IOBUFRF_ADDRWIDTH       5
//====================================

//====================================
`define NCU_IOBUF1RF_DEPTH          32
`define NCU_IOBUF1RF_DATAWIDTH      32
`define NCU_IOBUF1RF_ADDRWIDTH       5
//====================================

//====================================
`define NCU_INTBUFRF_DEPTH          32
`define NCU_INTBUFRF_DATAWIDTH     144
`define NCU_INTBUFRF_ADDRWIDTH       5
//====================================

//== fix me : need to remove when warm //
//== becomes available //
`define WMR_LENGTH		10'd999
`define WMR_LENGTH_P1		10'd1000

//// NCU CSR_MAN address   80_0000_xxxx ////
`define NCU_CSR_MAN			16'h0000
`define NCU_CREG_INTMAN			16'h0000
//`define NCU_CREG_INTVECDISP		16'h0800
`define NCU_CREG_MONDOINVEC		16'h0a00
`define NCU_CREG_SERNUM			16'h1000
`define NCU_CREG_FUSESTAT		16'h1008
`define NCU_CREG_COREAVAIL		16'h1010
`define NCU_CREG_BANKAVAIL		16'h1018
`define NCU_CREG_BANK_ENABLE		16'h1020
`define NCU_CREG_BANK_ENABLE_STATUS 	16'h1028
`define NCU_CREG_L2_HASH_ENABLE		16'h1030
`define NCU_CREG_L2_HASH_ENABLE_STATUS	16'h1038


`define NCU_CREG_MEM32_BASE	16'h2000
`define NCU_CREG_MEM32_MASK	16'h2008
`define NCU_CREG_MEM64_BASE	16'h2010
`define NCU_CREG_MEM64_MASK	16'h2018
`define NCU_CREG_IOCON_BASE	16'h2020
`define NCU_CREG_IOCON_MASK	16'h2028
`define NCU_CREG_MMUFSH		16'h2030

`define NCU_CREG_ESR		16'h3000
`define NCU_CREG_ELE		16'h3008
`define NCU_CREG_EIE		16'h3010
`define NCU_CREG_EJR		16'h3018
`define NCU_CREG_FEE		16'h3020
`define NCU_CREG_PER		16'h3028
`define NCU_CREG_SIISYN		16'h3030
`define NCU_CREG_NCUSYN		16'h3038
`define NCU_CREG_SCKSEL         16'h3040
`define NCU_CREG_DBGTRIG_EN     16'h4000

//// NUC CSR_MONDO address 80_0004_xxxx ////
`define NCU_CSR_MONDO		16'h0004
`define NCU_CREG_MDATA0  	16'h0000 
`define NCU_CREG_MDATA1  	16'h0200 
`define NCU_CREG_MDATA0_ALIAS	16'h0400 
`define NCU_CREG_MDATA1_ALIAS	16'h0600 
`define NCU_CREG_MBUSY		16'h0800 
`define NCU_CREG_MBUSY_ALIAS	16'h0a00 



// ASI shared reg 90_xxxx_xxxx//
`define NCU_ASI_A_HIT			10'h104 // 6-bits cpuid and thread id are "x"
`define NCU_ASI_B_HIT			10'h1CC // 6-bits cpuid and thread id are "x"
`define NCU_ASI_C_HIT			10'h114	// 6-bits cpuid and thread id are "x"
`define NCU_ASI_COREAVAIL		16'h0000
`define NCU_ASI_CORE_ENABLE_STATUS	16'h0010
`define NCU_ASI_CORE_ENABLE		16'h0020
`define NCU_ASI_XIR_STEERING		16'h0030
`define NCU_ASI_CORE_RUNNINGRW		16'h0050
`define NCU_ASI_CORE_RUNNING_STATUS	16'h0058
`define NCU_ASI_CORE_RUNNING_W1S	16'h0060
`define NCU_ASI_CORE_RUNNING_W1C	16'h0068
`define NCU_ASI_INTVECDISP		16'h0000
`define NCU_ASI_ERR_STR                 16'h1000
`define NCU_ASI_WMR_VEC_MASK            16'h0018
`define NCU_ASI_CMP_TICK_ENABLE		16'h0038


//// UCB packet type ////
`define UCB_READ_NACK	4'b0000    // ack/nack types
`define UCB_READ_ACK	4'b0001
`define UCB_WRITE_ACK	4'b0010
`define UCB_IFILL_ACK	4'b0011
`define UCB_IFILL_NACK	4'b0111

`define UCB_READ_REQ	4'b0100    // req types
`define UCB_WRITE_REQ	4'b0101
`define UCB_IFILL_REQ	4'b0110

`define UCB_INT		4'b1000    // plain interrupt
`define UCB_INT_VEC	4'b1100    // interrupt with vector
`define UCB_INT_SOC_UE	4'b1001    // soc interrup ue
`define UCB_INT_SOC_CE  4'b1010    // soc interrup ce
`define UCB_RESET_VEC	4'b0101    // reset with vector
`define UCB_IDLE_VEC	4'b1110    // idle with vector
`define UCB_RESUME_VEC	4'b1111    // resume with vector

`define UCB_INT_SOC 	4'b1101    // soc interrup ce


//// PCX packet type ////
`define	PCX_LOAD_RQ	5'b00000
`define	PCX_IMISS_RQ	5'b10000
`define	PCX_STORE_RQ	5'b00001
`define PCX_FWD_RQs	5'b01101
`define PCX_FWD_RPYs	5'b01110

//// CPX packet type ////
//`define CPX_LOAD_RET	4'b0000
`define CPX_LOAD_RET	4'b1000
`define CPX_ST_ACK	4'b0100
//`define CPX_IFILL_RET	4'b0001
`define CPX_IFILL_RET	4'b1001
`define CPX_INT_RET	4'b0111
`define CPX_INT_SOC	4'b1101
//`define CPX_FWD_RQ_RET	4'b1010
//`define CPX_FWD_RPY_RET	4'b1011




//// Global CSR decode ////
`define NCU_CSR		8'h80
`define NIU_CSR		8'h81
//`define RNG_CSR		8'h82
`define DBG1_CSR               8'h86
`define CCU_CSR		8'h83
`define MCU_CSR		8'h84
`define TCU_CSR		8'h85
`define DMU_CSR		8'h88
`define RCU_CSR		8'h89
`define NCU_ASI		8'h90
			/////8'h91 ~ 9F reserved
			/////8'hA0 ~ BF L2 CSR////
`define DMU_PIO		4'hC   // C0 ~ CF
			/////8'hB0 ~ FE reserved
`define SSI_CSR		8'hFF


//// NCU_SSI ////
`define SSI_ADDR 	 	12'hFF_F
`define SSI_ADDR_TIMEOUT_REG	40'hFF_0001_0088
`define SSI_ADDR_LOG_REG	40'hFF_0000_0018

`define IF_IDLE 2'b00
`define IF_ACPT 2'b01
`define IF_DROP 2'b10

`define SSI_IDLE     3'b000
`define	SSI_REQ      3'b001
`define	SSI_WDATA    3'b011
`define	SSI_REQ_PAR  3'b101
`define	SSI_ACK      3'b111
`define	SSI_RDATA    3'b110
`define	SSI_ACK_PAR  3'b010










module ncu_i2cfc_ctl (
  l2clk, 
  cmp_io_sync_en, 
  io_cmp_sync_en, 
  scan_in, 
  scan_out, 
  tcu_pce_ov, 
  tcu_clk_stop, 
  tcu_scan_en, 
  tcu_aclk, 
  tcu_bclk, 
  cpx_ncu_grant_cx, 
  intbuf_cpx_req, 
  iobuf_cpx_req, 
  ncu_cpx_req_next, 
  intbuf_sel_next, 
  iobuf_sel_next, 
  intbuf_rd, 
  iobuf_rd, 
  iobuf_vld, 
  io_pa_ld, 
  io_pas, 
  intbuf_vld, 
  int_pa_ld, 
  int_pas, 
  iobuf_dout_d1_ue, 
  intbuf_dout_d1_ue, 
  intbuf_hit_hwm, 
  iobuf_tail_s, 
  iobuf_head_f, 
  intbuf_wr2i2c, 
  intbuf_tail_ptr, 
  intbuf_head_ptr, 
  mb0_raddr, 
  mb0_waddr, 
  mb0_intbuf_rd_en, 
  mb0_iobuf_rd_en, 
  mb0_run, 
  iobuf_head_ptr, 
  iobuf_rden, 
  intbuf_rden) ;
wire [7:0] cpx_buf_full;
wire [7:0] cpx_ncu_grant;
wire cpx_ncu_grant_ff_scanin;
wire cpx_ncu_grant_ff_scanout;
wire l1clk;
wire cpx_cnt0_plus1_sel;
wire cpx_cnt0_minus1_sel;
wire [1:0] cpx_cnt0_plus1;
wire [1:0] cpx_cnt0;
wire [1:0] cpx_cnt0_minus1;
wire cpx_cnt0_ff_scanin;
wire cpx_cnt0_ff_scanout;
wire cpx_cnt1_plus1_sel;
wire cpx_cnt1_minus1_sel;
wire [1:0] cpx_cnt1_plus1;
wire [1:0] cpx_cnt1;
wire [1:0] cpx_cnt1_minus1;
wire cpx_cnt1_ff_scanin;
wire cpx_cnt1_ff_scanout;
wire cpx_cnt2_plus1_sel;
wire cpx_cnt2_minus1_sel;
wire [1:0] cpx_cnt2_plus1;
wire [1:0] cpx_cnt2;
wire [1:0] cpx_cnt2_minus1;
wire cpx_cnt2_ff_scanin;
wire cpx_cnt2_ff_scanout;
wire cpx_cnt3_plus1_sel;
wire cpx_cnt3_minus1_sel;
wire [1:0] cpx_cnt3_plus1;
wire [1:0] cpx_cnt3;
wire [1:0] cpx_cnt3_minus1;
wire cpx_cnt3_ff_scanin;
wire cpx_cnt3_ff_scanout;
wire cpx_cnt4_plus1_sel;
wire cpx_cnt4_minus1_sel;
wire [1:0] cpx_cnt4_plus1;
wire [1:0] cpx_cnt4;
wire [1:0] cpx_cnt4_minus1;
wire cpx_cnt4_ff_scanin;
wire cpx_cnt4_ff_scanout;
wire cpx_cnt5_plus1_sel;
wire cpx_cnt5_minus1_sel;
wire [1:0] cpx_cnt5_plus1;
wire [1:0] cpx_cnt5;
wire [1:0] cpx_cnt5_minus1;
wire cpx_cnt5_ff_scanin;
wire cpx_cnt5_ff_scanout;
wire cpx_cnt6_plus1_sel;
wire cpx_cnt6_minus1_sel;
wire [1:0] cpx_cnt6_plus1;
wire [1:0] cpx_cnt6;
wire [1:0] cpx_cnt6_minus1;
wire cpx_cnt6_ff_scanin;
wire cpx_cnt6_ff_scanout;
wire cpx_cnt7_plus1_sel;
wire cpx_cnt7_minus1_sel;
wire [1:0] cpx_cnt7_plus1;
wire [1:0] cpx_cnt7;
wire [1:0] cpx_cnt7_minus1;
wire cpx_cnt7_ff_scanin;
wire cpx_cnt7_ff_scanout;
wire [5:0] intbuf_tail_plus;
wire [5:0] intbuf_tail;
wire intbuf_tail_ff_scanin;
wire intbuf_tail_ff_scanout;
wire [5:0] intbuf_tail_plus10;
wire [5:0] intbuf_head;
wire intbuf_head_d1_ff_scanin;
wire intbuf_head_d1_ff_scanout;
wire [5:0] intbuf_head_d1;
wire int_pipe_full;
wire int_aov;
wire int_pav;
wire int_pbv;
wire intbuf_head_inc;
wire int_aog;
wire intrd;
wire int_aog_ff_scanin;
wire int_aog_ff_scanout;
wire int_aov_next;
wire int_aov_ff_scanin;
wire int_aov_ff_scanout;
wire int_pav_ff_scanin;
wire int_pav_ff_scanout;
wire int_pb_ld;
wire int_pbv_ff_scanin;
wire int_pbv_ff_scanout;
wire int_pbs_next;
wire int_pbs_ff_scanin;
wire int_pbs_ff_scanout;
wire int_pbs;
wire int_mov;
wire intbuf_vld_next;
wire intbuf_vld_ff_scanin;
wire intbuf_vld_ff_scanout;
wire iobuf_tail_ff_scanin;
wire iobuf_tail_ff_scanout;
wire [5:0] iobuf_tail;
wire iobuf_head_d1_ff_scanin;
wire iobuf_head_d1_ff_scanout;
wire [5:0] iobuf_head_d1;
wire [5:0] iobuf_head;
wire iobuf_head_f_ff_scanin;
wire iobuf_head_f_ff_scanout;
wire io_pipe_full;
wire io_aov;
wire io_pav;
wire io_pbv;
wire iobuf_head_inc;
wire io_aog;
wire iord;
wire io_aog_ff_scanin;
wire io_aog_ff_scanout;
wire io_aov_next;
wire io_aov_ff_scanin;
wire io_aov_ff_scanout;
wire io_pav_ff_scanin;
wire io_pav_ff_scanout;
wire io_pb_ld;
wire io_pbv_ff_scanin;
wire io_pbv_ff_scanout;
wire io_pbs_next;
wire io_pbs_ff_scanin;
wire io_pbs_ff_scanout;
wire io_pbs;
wire io_mov;
wire iobuf_vld_next;
wire iobuf_vld_ff_scanin;
wire iobuf_vld_ff_scanout;
wire siclk;
wire soclk;
wire se;
wire pce_ov;
wire stop;


////////////////////////////////////////////////////////////////////////
// Signal declarations
////////////////////////////////////////////////////////////////////////
// Global interface
input		l2clk;
input		cmp_io_sync_en;
input		io_cmp_sync_en;
input		scan_in;
output		scan_out;
input		tcu_pce_ov;
input		tcu_clk_stop;
input		tcu_scan_en;
input		tcu_aclk;
input		tcu_bclk;

// Crossbar interface
input [7:0]	cpx_ncu_grant_cx;

 
// i2c fast datapath interface
input [7:0]	intbuf_cpx_req;
input [7:0]	iobuf_cpx_req;
input [7:0]	ncu_cpx_req_next;

output		intbuf_sel_next;
output		iobuf_sel_next;

output		intbuf_rd;
output		iobuf_rd;

output		iobuf_vld;
output		io_pa_ld;
output		io_pas;
output		intbuf_vld;
output		int_pa_ld;
output		int_pas;

input		iobuf_dout_d1_ue;
input		intbuf_dout_d1_ue;


// c2i fast control interface
//input		cpu_mondo_rd_d2;
//input		cpu_mondo_wr_d2;

output		intbuf_hit_hwm;


// i2c slow control interface
input [5:0]	iobuf_tail_s;
output [5:0]	iobuf_head_f;


// interrupt table read result buffer interface
input		intbuf_wr2i2c;
output [4:0]	intbuf_tail_ptr;
output [4:0]	intbuf_head_ptr;

// mb0 signals //
input [4:0]	mb0_raddr;
input [4:0]	mb0_waddr;
//input		mb0_intbuf_sel;
//input		mb0_intbuf_wr_en;
input		mb0_intbuf_rd_en;
//input		mb0_iobuf_sel;
input		mb0_iobuf_rd_en;
input		mb0_run;

// IO buffer interface
output [4:0]	iobuf_head_ptr;
output 		iobuf_rden;
output 		intbuf_rden;

// Internal signals
// interrupt buffer head and tail ////
////
////


////////////////////////////////////////////////////////////////////////
// Code starts here
////////////////////////////////////////////////////////////////////////
   /************************************************************
    * IO-to-CPX Mux Control
    ************************************************************/   
   // Generate mux selects
assign 	intbuf_sel_next = ~|(cpx_buf_full[7:0] & ~cpx_ncu_grant[7:0] & intbuf_cpx_req[7:0]) &
		                   intbuf_vld & 
				   ~intbuf_dout_d1_ue ;

assign 	iobuf_sel_next = ~|(cpx_buf_full[7:0] & ~cpx_ncu_grant[7:0] & iobuf_cpx_req[7:0]) &
		                  ~intbuf_sel_next & iobuf_vld & 
				  ~iobuf_dout_d1_ue ;


   /************************************************************
    * Flop grant from CPX
    ************************************************************/
ncu_i2cfc_ctl_msff_ctl_macro__width_8 cpx_ncu_grant_ff 
				(
				.scan_in(cpx_ncu_grant_ff_scanin),
				.scan_out(cpx_ncu_grant_ff_scanout),
				.dout		(cpx_ncu_grant[7:0]),
				.l1clk		(l1clk),
				.din		(cpx_ncu_grant_cx[7:0]),
  .siclk(siclk),
  .soclk(soclk)
				);


/************************************************************
 * Counters to keep track of each CPX's buffer level
 ************************************************************/

/***********************/
/***** CPX0 Count ******/
/***********************/
//i2c_cpx_cnt count0 ( .clk(l2clk),   .ncu_cpx_req_next(ncu_cpx_req_next[0]),
//		       .cpx_ncu_grant(cpx_ncu_grant[0]),  .cpx_buf_full(cpx_buf_full[0]));
reg [1:0]	cpx_cnt0_next;
// Assertion: request cannot be asserted if count is 2
//            grant cannot be asserted if count is 0
assign	cpx_cnt0_plus1_sel = ncu_cpx_req_next[0] & ~cpx_ncu_grant[0];
assign	cpx_cnt0_minus1_sel = cpx_ncu_grant[0] &  ~ncu_cpx_req_next[0];
assign	cpx_cnt0_plus1[1:0] = cpx_cnt0[1:0] + 2'b01;
assign	cpx_cnt0_minus1[1:0] = cpx_cnt0[1:0] - 2'b01;
always @(cpx_cnt0 or cpx_cnt0_minus1 or cpx_cnt0_minus1_sel or 
	 cpx_cnt0_plus1 or cpx_cnt0_plus1_sel)
  case ({cpx_cnt0_minus1_sel,cpx_cnt0_plus1_sel}) // 0in case -parallel -full
    2'b01 : cpx_cnt0_next[1:0] = cpx_cnt0_plus1[1:0];
    2'b10 : cpx_cnt0_next[1:0] = cpx_cnt0_minus1[1:0];
    default : cpx_cnt0_next[1:0] = cpx_cnt0[1:0];   
  endcase //case(cpx_cnt_plus1_sel,cpx_cnt_minus1_sel)

ncu_i2cfc_ctl_msff_ctl_macro__width_2 cpx_cnt0_ff 
				(
				.scan_in(cpx_cnt0_ff_scanin),
				.scan_out(cpx_cnt0_ff_scanout),
				.dout		(cpx_cnt0[1:0]),
				.l1clk		(l1clk),
				.din		(cpx_cnt0_next[1:0]),
  .siclk(siclk),
  .soclk(soclk)
				);

assign	cpx_buf_full[0] = cpx_cnt0[1];


/***********************/
/***** CPX1 Count ******/
/***********************/
//i2c_cpx_cnt count1 ( .clk(l2clk),  .ncu_cpx_req_next(ncu_cpx_req_next[1]),
//		       .cpx_ncu_grant(cpx_ncu_grant[1]), .cpx_buf_full(cpx_buf_full[1])); 
reg [1:0]	cpx_cnt1_next;
// Assertion: request cannot be asserted if count is 2
//            grant cannot be asserted if count is 0
assign	cpx_cnt1_plus1_sel = ncu_cpx_req_next[1] & ~cpx_ncu_grant[1];
assign	cpx_cnt1_minus1_sel = cpx_ncu_grant[1] &  ~ncu_cpx_req_next[1];
assign	cpx_cnt1_plus1[1:0] = cpx_cnt1[1:0] + 2'b01;
assign	cpx_cnt1_minus1[1:0] = cpx_cnt1[1:0] - 2'b01;
always @(cpx_cnt1 or cpx_cnt1_minus1 or cpx_cnt1_minus1_sel or 
	 cpx_cnt1_plus1 or cpx_cnt1_plus1_sel)
  case ({cpx_cnt1_minus1_sel,cpx_cnt1_plus1_sel}) // 0in case -parallel -full
    2'b01 : cpx_cnt1_next[1:0] = cpx_cnt1_plus1[1:0];
    2'b10 : cpx_cnt1_next[1:0] = cpx_cnt1_minus1[1:0];
    default : cpx_cnt1_next[1:0] = cpx_cnt1[1:0];
  endcase //case(cpx_cnt_plus1_sel,cpx_cnt_minus1_sel)

ncu_i2cfc_ctl_msff_ctl_macro__width_2 cpx_cnt1_ff 
				(
				.scan_in(cpx_cnt1_ff_scanin),
				.scan_out(cpx_cnt1_ff_scanout),
				.dout		(cpx_cnt1[1:0]),
				.l1clk		(l1clk),
				.din		(cpx_cnt1_next[1:0]),
  .siclk(siclk),
  .soclk(soclk)
				);

assign	cpx_buf_full[1] = cpx_cnt1[1];


/***********************/
/***** CPX2 Count ******/
/***********************/
//i2c_cpx_cnt count2 ( .clk(l2clk),    .ncu_cpx_req_next(ncu_cpx_req_next[2]),
//		       .cpx_ncu_grant(cpx_ncu_grant[2]),  .cpx_buf_full(cpx_buf_full[2]));
reg [1:0]	cpx_cnt2_next;
// Assertion: request cannot be asserted if count is 2
//            grant cannot be asserted if count is 0
assign	cpx_cnt2_plus1_sel = ncu_cpx_req_next[2] & ~cpx_ncu_grant[2];
assign	cpx_cnt2_minus1_sel = cpx_ncu_grant[2] &  ~ncu_cpx_req_next[2];
assign	cpx_cnt2_plus1[1:0] = cpx_cnt2[1:0] + 2'b01;
assign	cpx_cnt2_minus1[1:0] = cpx_cnt2[1:0] - 2'b01;
always @(cpx_cnt2 or cpx_cnt2_minus1 or cpx_cnt2_minus1_sel or 
	 cpx_cnt2_plus1 or cpx_cnt2_plus1_sel)
  case ({cpx_cnt2_minus1_sel,cpx_cnt2_plus1_sel}) // 0in case -parallel -full
    2'b01 : cpx_cnt2_next[1:0] = cpx_cnt2_plus1[1:0];
    2'b10 : cpx_cnt2_next[1:0] = cpx_cnt2_minus1[1:0];
    default : cpx_cnt2_next[1:0] = cpx_cnt2[1:0];
  endcase //case(cpx_cnt_plus1_sel,cpx_cnt_minus1_sel)

ncu_i2cfc_ctl_msff_ctl_macro__width_2 cpx_cnt2_ff 
				(
				.scan_in(cpx_cnt2_ff_scanin),
				.scan_out(cpx_cnt2_ff_scanout),
				.dout		(cpx_cnt2[1:0]),
				.l1clk		(l1clk),
				.din		(cpx_cnt2_next[1:0]),
  .siclk(siclk),
  .soclk(soclk)
				);

assign	cpx_buf_full[2] = cpx_cnt2[1];


/***********************/
//***** CPX3 Count *****/
/***********************/
//i2c_cpx_cnt count3 ( .clk(l2clk),   .ncu_cpx_req_next(ncu_cpx_req_next[3]),
//		       .cpx_ncu_grant(cpx_ncu_grant[3]),  .cpx_buf_full(cpx_buf_full[3]));
reg [1:0]	cpx_cnt3_next;
// Assertion: request cannot be asserted if count is 2
//            grant cannot be asserted if count is 0
assign	cpx_cnt3_plus1_sel = ncu_cpx_req_next[3] & ~cpx_ncu_grant[3];
assign	cpx_cnt3_minus1_sel = cpx_ncu_grant[3] &  ~ncu_cpx_req_next[3];
assign	cpx_cnt3_plus1[1:0] = cpx_cnt3[1:0] + 2'b01;
assign	cpx_cnt3_minus1[1:0] = cpx_cnt3[1:0] - 2'b01;
always @(cpx_cnt3 or cpx_cnt3_minus1 or cpx_cnt3_minus1_sel or 
	 cpx_cnt3_plus1 or cpx_cnt3_plus1_sel)
  case ({cpx_cnt3_minus1_sel,cpx_cnt3_plus1_sel}) // 0in case -parallel -full
    2'b01 : cpx_cnt3_next[1:0] = cpx_cnt3_plus1[1:0];
    2'b10 : cpx_cnt3_next[1:0] = cpx_cnt3_minus1[1:0];
    default : cpx_cnt3_next[1:0] = cpx_cnt3[1:0];
  endcase //case(cpx_cnt_plus1_sel,cpx_cnt_minus1_sel)

ncu_i2cfc_ctl_msff_ctl_macro__width_2 cpx_cnt3_ff 
				(
				.scan_in(cpx_cnt3_ff_scanin),
				.scan_out(cpx_cnt3_ff_scanout),
				.dout		(cpx_cnt3[1:0]),
				.l1clk		(l1clk),
				.din		(cpx_cnt3_next[1:0]),
  .siclk(siclk),
  .soclk(soclk)
				);

assign	cpx_buf_full[3] = cpx_cnt3[1];


/***********************/
/***** CPX4 Count ******/
/***********************/
//i2c_cpx_cnt count4 ( .clk(l2clk),   .ncu_cpx_req_next(ncu_cpx_req_next[4]),
//		       .cpx_ncu_grant(cpx_ncu_grant[4]), .cpx_buf_full(cpx_buf_full[4]));
reg [1:0]	cpx_cnt4_next;
// Assertion: request cannot be asserted if count is 2
//            grant cannot be asserted if count is 0
assign	cpx_cnt4_plus1_sel = ncu_cpx_req_next[4] & ~cpx_ncu_grant[4];
assign	cpx_cnt4_minus1_sel = cpx_ncu_grant[4] &  ~ncu_cpx_req_next[4];
assign	cpx_cnt4_plus1[1:0] = cpx_cnt4[1:0] + 2'b01;
assign	cpx_cnt4_minus1[1:0] = cpx_cnt4[1:0] - 2'b01;
always @(cpx_cnt4 or cpx_cnt4_minus1 or cpx_cnt4_minus1_sel or 
	 cpx_cnt4_plus1 or cpx_cnt4_plus1_sel)
  case ({cpx_cnt4_minus1_sel,cpx_cnt4_plus1_sel}) // 0in case -parallel -full
    2'b01 : cpx_cnt4_next[1:0] = cpx_cnt4_plus1[1:0];
    2'b10 : cpx_cnt4_next[1:0] = cpx_cnt4_minus1[1:0];
    default : cpx_cnt4_next[1:0] = cpx_cnt4[1:0];
  endcase //case(cpx_cnt_plus1_sel,cpx_cnt_minus1_sel)

ncu_i2cfc_ctl_msff_ctl_macro__width_2 cpx_cnt4_ff 
				(
				.scan_in(cpx_cnt4_ff_scanin),
				.scan_out(cpx_cnt4_ff_scanout),
				.dout		(cpx_cnt4[1:0]),
				.l1clk		(l1clk),
				.din		(cpx_cnt4_next[1:0]),
  .siclk(siclk),
  .soclk(soclk)
				);

assign	cpx_buf_full[4] = cpx_cnt4[1];



/***********************/
/***** CPX5 Count ******/
/***********************/
//i2c_cpx_cnt count5 ( .clk(l2clk),   .ncu_cpx_req_next(ncu_cpx_req_next[5]),
//		       .cpx_ncu_grant(cpx_ncu_grant[5]),  .cpx_buf_full(cpx_buf_full[5]));
reg [1:0]	cpx_cnt5_next;
// Assertion: request cannot be asserted if count is 2
//            grant cannot be asserted if count is 0
assign	cpx_cnt5_plus1_sel = ncu_cpx_req_next[5] & ~cpx_ncu_grant[5];
assign	cpx_cnt5_minus1_sel = cpx_ncu_grant[5] &  ~ncu_cpx_req_next[5];
assign	cpx_cnt5_plus1[1:0] = cpx_cnt5[1:0] + 2'b01;
assign	cpx_cnt5_minus1[1:0] = cpx_cnt5[1:0] - 2'b01;
always @(cpx_cnt5 or cpx_cnt5_minus1 or cpx_cnt5_minus1_sel or 
	 cpx_cnt5_plus1 or cpx_cnt5_plus1_sel)
  case ({cpx_cnt5_minus1_sel,cpx_cnt5_plus1_sel}) // 0in case -parallel -full
    2'b01 : cpx_cnt5_next[1:0] = cpx_cnt5_plus1[1:0];
    2'b10 : cpx_cnt5_next[1:0] = cpx_cnt5_minus1[1:0];
    default : cpx_cnt5_next[1:0] = cpx_cnt5[1:0];
  endcase //case(cpx_cnt_plus1_sel,cpx_cnt_minus1_sel)

ncu_i2cfc_ctl_msff_ctl_macro__width_2 cpx_cnt5_ff 
				(
				.scan_in(cpx_cnt5_ff_scanin),
				.scan_out(cpx_cnt5_ff_scanout),
				.dout		(cpx_cnt5[1:0]),
				.l1clk		(l1clk),
				.din		(cpx_cnt5_next[1:0]),
  .siclk(siclk),
  .soclk(soclk)
				);

assign	cpx_buf_full[5] = cpx_cnt5[1];



/***********************/
/***** CPX6 Count ******/
/***********************/
//i2c_cpx_cnt count6 ( .clk(l2clk),   .ncu_cpx_req_next(ncu_cpx_req_next[6]),
//		       .cpx_ncu_grant(cpx_ncu_grant[6]), .cpx_buf_full(cpx_buf_full[6]));
reg [1:0]	cpx_cnt6_next;
// Assertion: request cannot be asserted if count is 2
//            grant cannot be asserted if count is 0
assign	cpx_cnt6_plus1_sel = ncu_cpx_req_next[6] & ~cpx_ncu_grant[6];
assign	cpx_cnt6_minus1_sel = cpx_ncu_grant[6] &  ~ncu_cpx_req_next[6];
assign	cpx_cnt6_plus1[1:0] = cpx_cnt6[1:0] + 2'b01;
assign	cpx_cnt6_minus1[1:0] = cpx_cnt6[1:0] - 2'b01;
always @(cpx_cnt6 or cpx_cnt6_minus1 or cpx_cnt6_minus1_sel or 
	 cpx_cnt6_plus1 or cpx_cnt6_plus1_sel)
  case ({cpx_cnt6_minus1_sel,cpx_cnt6_plus1_sel}) // 0in case -parallel -full
    2'b01 : cpx_cnt6_next[1:0] = cpx_cnt6_plus1[1:0];
    2'b10 : cpx_cnt6_next[1:0] = cpx_cnt6_minus1[1:0];
    default : cpx_cnt6_next[1:0] = cpx_cnt6[1:0];
  endcase //case(cpx_cnt_plus1_sel,cpx_cnt_minus1_sel)

ncu_i2cfc_ctl_msff_ctl_macro__width_2 cpx_cnt6_ff 
				(
				.scan_in(cpx_cnt6_ff_scanin),
				.scan_out(cpx_cnt6_ff_scanout),
				.dout		(cpx_cnt6[1:0]),
				.l1clk		(l1clk),
				.din		(cpx_cnt6_next[1:0]),
  .siclk(siclk),
  .soclk(soclk)
				);

assign	cpx_buf_full[6] = cpx_cnt6[1];



/***********************/
/***** CPX7 Count ******/
/***********************/
//i2c_cpx_cnt count7 ( .clk(l2clk),   .ncu_cpx_req_next(ncu_cpx_req_next[7]),
//		       .cpx_ncu_grant(cpx_ncu_grant[7]),   .cpx_buf_full(cpx_buf_full[7]));
reg [1:0]	cpx_cnt7_next;
// Assertion: request cannot be asserted if count is 2
//            grant cannot be asserted if count is 0
assign	cpx_cnt7_plus1_sel = ncu_cpx_req_next[7] & ~cpx_ncu_grant[7];
assign	cpx_cnt7_minus1_sel = cpx_ncu_grant[7] &  ~ncu_cpx_req_next[7];
assign	cpx_cnt7_plus1[1:0] = cpx_cnt7[1:0] + 2'b01;
assign	cpx_cnt7_minus1[1:0] = cpx_cnt7[1:0] - 2'b01;
always @(cpx_cnt7 or cpx_cnt7_minus1 or cpx_cnt7_minus1_sel or 
	 cpx_cnt7_plus1 or cpx_cnt7_plus1_sel)
  case ({cpx_cnt7_minus1_sel,cpx_cnt7_plus1_sel}) // 0in case -parallel -full
    2'b01 : cpx_cnt7_next[1:0] = cpx_cnt7_plus1[1:0];
    2'b10 : cpx_cnt7_next[1:0] = cpx_cnt7_minus1[1:0];
    default : cpx_cnt7_next[1:0] = cpx_cnt7[1:0];
  endcase //case(cpx_cnt_plus1_sel,cpx_cnt_minus1_sel)

ncu_i2cfc_ctl_msff_ctl_macro__width_2 cpx_cnt7_ff 
				(
				.scan_in(cpx_cnt7_ff_scanin),
				.scan_out(cpx_cnt7_ff_scanout),
				.dout		(cpx_cnt7[1:0]),
				.l1clk		(l1clk),
				.din		(cpx_cnt7_next[1:0]),
  .siclk(siclk),
  .soclk(soclk)
				);

assign	cpx_buf_full[7] = cpx_cnt7[1];



/************************************************************
 * Interrupt Status Table Read Result Buffer Control
 * An 16 deep buffer to store interrupt table read results.
 * 
 *                                               __decode int stat table read
 *                                     flop req |
 *                                         |    |        __read int stat table here      
 *                                         |    |       |
 *                                         |    |       |    __flop read result
 *                                         |    |       |   |
 *                                         |    |       |   |       __tail pointer increment
 *                                         |    |       |   |      |
 *                                         |    |       |   |      |   compute hwm   __stall sent here
 *                                         |    |       |   |      |       |        | 
 *                                         V    V       V   V  d2  V       V        V
 *     PQ      PA      PX1     rptr    PX2     C1      C2      C3      C4      C5      rptr
 *             PQ      PA      PX1     rptr    PX2     C1      C2      C3      C4      C5      rptr
 *                     PQ      PA      PX1     rptr    PX2     C1      C2      C3      C4
 *                             PQ      PA      PX1     rptr    PX2     C1      C2      C3
 *                                     PQ      PA      PX1     rptr    PX2     C1      C2
 *                                             PQ      PA      PX1     rptr    PX2     C1
 *                                                     PQ      PA      PX1     rptr    PX2
 *                                                             PQ      PA      PX1     rptr
 *                                                                     PQ      PA      PX1     rptr
 *                                                                             PQ      PA      PX1     rptr
 *                                                                                     PQ      PA      PX1
 *                                                                                        -->  PQ
 *                                                                                       |
 *                                                                                       |
 *                                                              packet in this PQ is stalled
 * 
 * When stall is signalled, there can potentially be 10 packets in C4, C3,
 * C2, C1, PX2, rptr, PX1, PA, PQ, and PQ-1 that need to be queued in the CPU shared buffer.
 ************************************************************/
//assign 	cpu_mondo_rdwr_d2 = cpu_mondo_rd_d2 | cpu_mondo_wr_d2;
//assign 	intbuf_wr = cpu_mondo_rdwr_d2;

   // Tail pointer to interrupt table read result buffer
assign 	intbuf_tail_plus[5:0] = intbuf_tail[5:0] + 6'd1;
assign 	intbuf_tail_ptr[4:0] = mb0_run ? mb0_waddr[4:0] : intbuf_tail[4:0];
ncu_i2cfc_ctl_msff_ctl_macro__en_1__width_6 intbuf_tail_ff  
				(
				.scan_in(intbuf_tail_ff_scanin),
				.scan_out(intbuf_tail_ff_scanout),
				.dout		(intbuf_tail[5:0]),
				.l1clk		(l1clk),
				.en		(intbuf_wr2i2c),
				.din		(intbuf_tail_plus[5:0]),
  .siclk(siclk),
  .soclk(soclk)
				);

assign 	intbuf_tail_plus10[5:0] = intbuf_tail[5:0] + 6'd8;
assign       intbuf_hit_hwm = ((intbuf_tail_plus10[5] != intbuf_head[5]) &
                                (intbuf_tail_plus10[4:0] >= intbuf_head[4:0])) |
                               ((intbuf_tail_plus10[5] == intbuf_head[5]) &
                                (intbuf_tail_plus10[4:0] <= intbuf_head[4:0]));


/************************************************************
 * INT Buffer Control
 ************************************************************/
ncu_i2cfc_ctl_msff_ctl_macro__width_6 intbuf_head_d1_ff 
				(
				.scan_in(intbuf_head_d1_ff_scanin),
				.scan_out(intbuf_head_d1_ff_scanout),
				.dout		(intbuf_head_d1[5:0]),
				.l1clk		(l1clk),
				.din		(intbuf_head[5:0]),
  .siclk(siclk),
  .soclk(soclk)
				);

//assign  mb0_intbuf_sel = mb0_run & mb0_intbuf_rd_en;
assign	intbuf_head_ptr[4:0] = mb0_run ? mb0_raddr[4:0] : intbuf_head[4:0];

assign	int_pipe_full =  ~int_aov ? (int_pav & int_pbv & intbuf_vld) :
		    	 ~int_pav ? (int_pbv & intbuf_vld) :
		    	 ~int_pbv ? (intbuf_vld) : 1'b1 ;

assign	intbuf_head_inc = int_aog & (intrd | ~int_pipe_full) ;
assign	intbuf_head[5:0] = intbuf_head_inc ? intbuf_head_d1[5:0]+6'h01 : intbuf_head_d1[5:0] ;

assign	intbuf_rden = mb0_run ? mb0_intbuf_rd_en : (intbuf_tail[4:0] != intbuf_head[4:0]) ;
ncu_i2cfc_ctl_msff_ctl_macro__width_1 int_aog_ff 
				(
				.scan_in(int_aog_ff_scanin),
				.scan_out(int_aog_ff_scanout),
				.dout		(int_aog),
				.l1clk		(l1clk),
				.din		(intbuf_rden),
  .siclk(siclk),
  .soclk(soclk)
				);

assign	int_aov_next = intbuf_rden & (intbuf_head_inc | ~int_aog);
ncu_i2cfc_ctl_msff_ctl_macro__width_1 int_aov_ff 
				(
				.scan_in(int_aov_ff_scanin),
				.scan_out(int_aov_ff_scanout),
				.dout		(int_aov),
				.l1clk		(l1clk),
				.din		(int_aov_next),
  .siclk(siclk),
  .soclk(soclk)
				);

assign	int_pa_ld = (int_pav==intbuf_rd) ;
ncu_i2cfc_ctl_msff_ctl_macro__en_1__width_1 int_pav_ff  
				(
				.scan_in(int_pav_ff_scanin),
				.scan_out(int_pav_ff_scanout),
				.dout		(int_pav),
				.l1clk		(l1clk),
				.en		(int_pa_ld),
				.din		(int_pbv),
  .siclk(siclk),
  .soclk(soclk)
				);

assign	int_pb_ld = (~int_pav | intbuf_rd | ~int_pbv) ;
ncu_i2cfc_ctl_msff_ctl_macro__en_1__width_1 int_pbv_ff  
				(
				.scan_in(int_pbv_ff_scanin),
				.scan_out(int_pbv_ff_scanout),
				.dout		(int_pbv),
				.l1clk		(l1clk),
				.en		(int_pb_ld),
				.din		(int_aov),
  .siclk(siclk),
  .soclk(soclk)
				);

assign	int_pbs_next = int_pas ? (int_aov & !int_pbv & int_pav)&intrd : intbuf_rd ;
ncu_i2cfc_ctl_msff_ctl_macro__width_1 int_pbs_ff 
				(
				.scan_in(int_pbs_ff_scanin),
				.scan_out(int_pbs_ff_scanout),
				.dout		(int_pbs),
				.l1clk		(l1clk),
				.din		(int_pbs_next),
  .siclk(siclk),
  .soclk(soclk)
				);

assign 	int_pas = ~int_pbs;
assign	int_mov = int_pas ? int_pav : int_pbv ;
assign	intbuf_rd = int_mov & (~intbuf_vld | intrd) ;

assign	intbuf_vld_next = intbuf_rd | (intbuf_vld & ~intbuf_sel_next & ~intbuf_dout_d1_ue);

assign	intrd = intbuf_vld & (intbuf_sel_next|intbuf_dout_d1_ue) ;

ncu_i2cfc_ctl_msff_ctl_macro__width_1 intbuf_vld_ff 
				(
				.scan_in(intbuf_vld_ff_scanin),
				.scan_out(intbuf_vld_ff_scanout),
				.dout		(intbuf_vld),
				.l1clk		(l1clk),
				.din		(intbuf_vld_next),
  .siclk(siclk),
  .soclk(soclk)
				);



/************************************************************
 * IO Buffer Control
 ************************************************************/
// Flop tail pointer once to convert to cpu clock domain
ncu_i2cfc_ctl_msff_ctl_macro__en_1__width_6 iobuf_tail_ff  
				(
				.scan_in(iobuf_tail_ff_scanin),
				.scan_out(iobuf_tail_ff_scanout),
				.dout		(iobuf_tail[5:0]),
				.l1clk		(l1clk),
				.en		(io_cmp_sync_en),
				.din		(iobuf_tail_s[5:0]),
  .siclk(siclk),
  .soclk(soclk)
				);

ncu_i2cfc_ctl_msff_ctl_macro__width_6 iobuf_head_d1_ff 
				(
				.scan_in(iobuf_head_d1_ff_scanin),
				.scan_out(iobuf_head_d1_ff_scanout),
				.dout		(iobuf_head_d1[5:0]),
				.l1clk		(l1clk),
				.din		(iobuf_head[5:0]),
  .siclk(siclk),
  .soclk(soclk)
				);
//assign  mb0_iobuf_sel = mb0_run & mb0_iobuf_rd_en;
assign	iobuf_head_ptr[4:0] = mb0_run ? mb0_raddr[4:0] : iobuf_head[4:0];
ncu_i2cfc_ctl_msff_ctl_macro__en_1__width_6 iobuf_head_f_ff  
				(
				.scan_in(iobuf_head_f_ff_scanin),
				.scan_out(iobuf_head_f_ff_scanout),
				.dout		(iobuf_head_f[5:0]),
				.l1clk		(l1clk),
				.en		(cmp_io_sync_en),
				.din		(iobuf_head[5:0]),
  .siclk(siclk),
  .soclk(soclk)
				);

assign	io_pipe_full =  ~io_aov ? (io_pav & io_pbv & iobuf_vld) :
		    	~io_pav ? (io_pbv & iobuf_vld) :
		    	~io_pbv ? (iobuf_vld) : 1'b1 ;

assign	iobuf_head_inc = io_aog & (iord | ~io_pipe_full) ;
assign	iobuf_head[5:0] = iobuf_head_inc ? iobuf_head_d1[5:0]+6'h01 : iobuf_head_d1[5:0] ;

assign	iobuf_rden = mb0_run ? mb0_iobuf_rd_en : (iobuf_tail[5:0] != iobuf_head[5:0]) ;
ncu_i2cfc_ctl_msff_ctl_macro__width_1 io_aog_ff 
				(
				.scan_in(io_aog_ff_scanin),
				.scan_out(io_aog_ff_scanout),
				.dout		(io_aog),
				.l1clk		(l1clk),
				.din		(iobuf_rden),
  .siclk(siclk),
  .soclk(soclk)
				);

assign	io_aov_next = iobuf_rden & (iobuf_head_inc | ~io_aog);
ncu_i2cfc_ctl_msff_ctl_macro__width_1 io_aov_ff 
				(
				.scan_in(io_aov_ff_scanin),
				.scan_out(io_aov_ff_scanout),
				.dout		(io_aov),
				.l1clk		(l1clk),
				.din		(io_aov_next),
  .siclk(siclk),
  .soclk(soclk)
				);

assign	io_pa_ld = (io_pav==iobuf_rd) ;
ncu_i2cfc_ctl_msff_ctl_macro__en_1__width_1 io_pav_ff  
				(
				.scan_in(io_pav_ff_scanin),
				.scan_out(io_pav_ff_scanout),
				.dout		(io_pav),
				.l1clk		(l1clk),
				.en		(io_pa_ld),
				.din		(io_pbv),
  .siclk(siclk),
  .soclk(soclk)
				);

assign	io_pb_ld = (~io_pav | iobuf_rd | ~io_pbv) ;
ncu_i2cfc_ctl_msff_ctl_macro__en_1__width_1 io_pbv_ff  
				(
				.scan_in(io_pbv_ff_scanin),
				.scan_out(io_pbv_ff_scanout),
				.dout		(io_pbv),
				.l1clk		(l1clk),
				.en		(io_pb_ld),
				.din		(io_aov),
  .siclk(siclk),
  .soclk(soclk)
				);

assign	io_pbs_next = io_pas ? (io_aov & !io_pbv & io_pav)&iord : iobuf_rd ;
ncu_i2cfc_ctl_msff_ctl_macro__width_1 io_pbs_ff 
				(
				.scan_in(io_pbs_ff_scanin),
				.scan_out(io_pbs_ff_scanout),
				.dout		(io_pbs),
				.l1clk		(l1clk),
				.din		(io_pbs_next),
  .siclk(siclk),
  .soclk(soclk)
				);

assign 	io_pas = ~io_pbs;
assign	io_mov = io_pas ? io_pav : io_pbv ;
assign	iobuf_rd = io_mov & (~iobuf_vld | iord) ;

assign	iobuf_vld_next = iobuf_rd | (iobuf_vld & ~iobuf_sel_next & ~iobuf_dout_d1_ue);

assign	iord = iobuf_vld & (iobuf_sel_next|iobuf_dout_d1_ue) ;

ncu_i2cfc_ctl_msff_ctl_macro__width_1 iobuf_vld_ff 
				(
				.scan_in(iobuf_vld_ff_scanin),
				.scan_out(iobuf_vld_ff_scanout),
				.dout		(iobuf_vld),
				.l1clk		(l1clk),
				.din		(iobuf_vld_next),
  .siclk(siclk),
  .soclk(soclk)
				);


/**** adding clock header ****/
ncu_i2cfc_ctl_l1clkhdr_ctl_macro clkgen (
				.l2clk	(l2clk),
				.l1en	(1'b1),
				.l1clk	(l1clk),
  .pce_ov(pce_ov),
  .stop(stop),
  .se(se)
				);

/*** building tcu port ***/
assign	siclk = tcu_aclk;
assign	soclk = tcu_bclk;
assign	   se = tcu_scan_en;
assign	pce_ov = tcu_pce_ov;
assign	stop = tcu_clk_stop;

// fixscan start:
assign cpx_ncu_grant_ff_scanin   = scan_in                  ;
assign cpx_cnt0_ff_scanin        = cpx_ncu_grant_ff_scanout ;
assign cpx_cnt1_ff_scanin        = cpx_cnt0_ff_scanout      ;
assign cpx_cnt2_ff_scanin        = cpx_cnt1_ff_scanout      ;
assign cpx_cnt3_ff_scanin        = cpx_cnt2_ff_scanout      ;
assign cpx_cnt4_ff_scanin        = cpx_cnt3_ff_scanout      ;
assign cpx_cnt5_ff_scanin        = cpx_cnt4_ff_scanout      ;
assign cpx_cnt6_ff_scanin        = cpx_cnt5_ff_scanout      ;
assign cpx_cnt7_ff_scanin        = cpx_cnt6_ff_scanout      ;
assign intbuf_tail_ff_scanin     = cpx_cnt7_ff_scanout      ;
assign intbuf_head_d1_ff_scanin  = intbuf_tail_ff_scanout   ;
assign int_aog_ff_scanin         = intbuf_head_d1_ff_scanout;
assign int_aov_ff_scanin         = int_aog_ff_scanout       ;
assign int_pav_ff_scanin         = int_aov_ff_scanout       ;
assign int_pbv_ff_scanin         = int_pav_ff_scanout       ;
assign int_pbs_ff_scanin         = int_pbv_ff_scanout       ;
assign intbuf_vld_ff_scanin      = int_pbs_ff_scanout       ;
assign iobuf_tail_ff_scanin      = intbuf_vld_ff_scanout    ;
assign iobuf_head_d1_ff_scanin   = iobuf_tail_ff_scanout    ;
assign iobuf_head_f_ff_scanin    = iobuf_head_d1_ff_scanout ;
assign io_aog_ff_scanin          = iobuf_head_f_ff_scanout  ;
assign io_aov_ff_scanin          = io_aog_ff_scanout        ;
assign io_pav_ff_scanin          = io_aov_ff_scanout        ;
assign io_pbv_ff_scanin          = io_pav_ff_scanout        ;
assign io_pbs_ff_scanin          = io_pbv_ff_scanout        ;
assign iobuf_vld_ff_scanin       = io_pbs_ff_scanout        ;
assign scan_out                  = iobuf_vld_ff_scanout     ;
// fixscan end:
endmodule // i2c_fctrl








// any PARAMS parms go into naming of macro

module ncu_i2cfc_ctl_msff_ctl_macro__width_8 (
  din, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [7:0] fdin;
wire [6:0] so;

  input [7:0] din;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [7:0] dout;
  output scan_out;
assign fdin[7:0] = din[7:0];






dff #(8)  d0_0 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[7:0]),
.si({scan_in,so[6:0]}),
.so({so[6:0],scan_out}),
.q(dout[7:0])
);












endmodule













// any PARAMS parms go into naming of macro

module ncu_i2cfc_ctl_msff_ctl_macro__width_2 (
  din, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [1:0] fdin;
wire [0:0] so;

  input [1:0] din;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [1:0] dout;
  output scan_out;
assign fdin[1:0] = din[1:0];






dff #(2)  d0_0 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[1:0]),
.si({scan_in,so[0:0]}),
.so({so[0:0],scan_out}),
.q(dout[1:0])
);












endmodule













// any PARAMS parms go into naming of macro

module ncu_i2cfc_ctl_msff_ctl_macro__en_1__width_6 (
  din, 
  en, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [5:0] fdin;
wire [4:0] so;

  input [5:0] din;
  input en;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [5:0] dout;
  output scan_out;
assign fdin[5:0] = (din[5:0] & {6{en}}) | (dout[5:0] & ~{6{en}});






dff #(6)  d0_0 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[5:0]),
.si({scan_in,so[4:0]}),
.so({so[4:0],scan_out}),
.q(dout[5:0])
);












endmodule













// any PARAMS parms go into naming of macro

module ncu_i2cfc_ctl_msff_ctl_macro__width_6 (
  din, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [5:0] fdin;
wire [4:0] so;

  input [5:0] din;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [5:0] dout;
  output scan_out;
assign fdin[5:0] = din[5:0];






dff #(6)  d0_0 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[5:0]),
.si({scan_in,so[4:0]}),
.so({so[4:0],scan_out}),
.q(dout[5:0])
);












endmodule













// any PARAMS parms go into naming of macro

module ncu_i2cfc_ctl_msff_ctl_macro__width_1 (
  din, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [0:0] fdin;

  input [0:0] din;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [0:0] dout;
  output scan_out;
assign fdin[0:0] = din[0:0];






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

module ncu_i2cfc_ctl_msff_ctl_macro__en_1__width_1 (
  din, 
  en, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [0:0] fdin;

  input [0:0] din;
  input en;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [0:0] dout;
  output scan_out;
assign fdin[0:0] = (din[0:0] & {1{en}}) | (dout[0:0] & ~{1{en}});






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

module ncu_i2cfc_ctl_l1clkhdr_ctl_macro (
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








