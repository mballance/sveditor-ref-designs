// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: ncu_ssisif_ctl.v
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









module ncu_ssisif_ctl (
  iol2clk, 
  tcu_pce_ov, 
  tcu_clk_stop, 
  tcu_scan_en, 
  tcu_aclk, 
  tcu_bclk, 
  scan_in, 
  scan_out, 
  ucbif_sif_timeval, 
  ucbif_sif_timeout_accpt, 
  ncu_scksel, 
  sif_ucbif_timeout, 
  sif_ucbif_timeout_rw, 
  sif_ucbif_par_err, 
  sif_ucbif_busy, 
  ucbif_sif_vld, 
  ucbif_sif_rw, 
  ucbif_sif_size, 
  ucbif_sif_addr, 
  ucbif_sif_wdata, 
  ucbif_sif_rdata_accpt, 
  sif_ucbif_rdata, 
  sif_ucbif_rdata_vld, 
  io_jbi_ssi_miso, 
  jbi_io_ssi_mosi, 
  jbi_io_ssi_sck, 
  tcu_sck_bypass, 
  sck_cntexp) ;
wire [2:0] ssi_sm;
wire sck_posedge_d1;
wire req_info_en;
wire [63:0] next_wdata;
wire wdata_en;
wire [2:0] next_wdata_sel;
wire wdata_sel_en;
wire [1:0] next_size;
wire size_en;
wire next_rw;
wire rw_en;
wire u_dffrle_rw_scanin;
wire u_dffrle_rw_scanout;
wire rw;
wire l1clk;
wire u_dffrle_size_scanin;
wire u_dffrle_size_scanout;
wire [1:0] size;
wire u_dffrle_wdata_scanin;
wire u_dffrle_wdata_scanout;
wire [63:0] wdata;
wire u_dffrle_wdata_sel_scanin;
wire u_dffrle_wdata_sel_scanout;
wire [2:0] wdata_sel;
wire u_dffrle_sif_ucbif_rdata_scanin;
wire u_dffrle_sif_ucbif_rdata_scanout;
wire sif_ucbif_rdata_en;
wire n_par;
wire par_rst_l;
wire u_dffrle_par_scanin;
wire u_dffrle_par_scanout;
wire par;
wire par_en;
wire [23:0] n_timeout_cnt;
wire timeout_cnt_rst_l;
wire [23:0] next_timeout_cnt;
wire u_dffrle_timeout_cnt_scanin;
wire u_dffrle_timeout_cnt_scanout;
wire [23:0] timeout_cnt;
wire sck_posedge;
wire timeout_cnt_en;
wire mosi_shreg0_s_in;
wire mosi_shreg1_s_in;
wire [7:0] mosi_shreg0_p_out;
wire mosi_shreg2_s_in;
wire [7:0] mosi_shreg1_p_out;
wire mosi_shreg3_s_in;
wire [7:0] mosi_shreg2_p_out;
wire mosi_shreg4_s_in;
wire [7:0] mosi_shreg3_p_out;
wire mosi_shreg5_s_in;
wire [7:0] mosi_shreg4_p_out;
wire mosi_shreg6_s_in;
wire [7:0] mosi_shreg5_p_out;
wire mosi_shreg7_s_in;
wire [7:0] mosi_shreg6_p_out;
wire [7:0] mosi_shreg0_p_in;
wire [63:0] mosi_shreg_din;
wire [7:0] mosi_shreg1_p_in;
wire [7:0] mosi_shreg2_p_in;
wire [7:0] mosi_shreg3_p_in;
wire [7:0] mosi_shreg4_p_in;
wire [7:0] mosi_shreg5_p_in;
wire [7:0] mosi_shreg6_p_in;
wire [7:0] mosi_shreg7_p_in;
wire u_mosi_shreg0_scanin;
wire u_mosi_shreg0_scanout;
wire mosi_shift_n;
wire mosi_load_n;
wire u_mosi_shreg1_scanin;
wire u_mosi_shreg1_scanout;
wire u_mosi_shreg2_scanin;
wire u_mosi_shreg2_scanout;
wire u_mosi_shreg3_scanin;
wire u_mosi_shreg3_scanout;
wire u_mosi_shreg4_scanin;
wire u_mosi_shreg4_scanout;
wire u_mosi_shreg5_scanin;
wire u_mosi_shreg5_scanout;
wire u_mosi_shreg6_scanin;
wire u_mosi_shreg6_scanout;
wire [7:0] mosi_shreg7_p_out;
wire u_mosi_shreg7_scanin;
wire u_mosi_shreg7_scanout;
wire sck_cyc_cnt_rst_l;
wire [6:0] next_sck_cyc_cnt;
wire sck_posedge_d4;
wire [6:0] sck_cyc_cnt;
wire [30:0] ssi_req;
wire sck_posedge_d2;
wire io_jbi_ssi_miso_ff;
wire rdata_shift_n;
wire [63:0] srg64p_out_next;
wire [63:0] srg64p_out;
wire [63:0] rdata_shreg;
wire srg64p_out_ff_scanin;
wire srg64p_out_ff_scanout;
wire next_sif_ucbif_rdata_vld;
wire ack_par_rdy;
wire sif_ucbif_timeout_rst_l;
wire next_sif_ucbif_timeout;
wire next_sif_ucbif_par_err;
wire [2:0] cntr_n;
wire [2:0] cntr;
wire cntr_ff_scanin;
wire cntr_ff_scanout;
wire u_dffrl_async_ctu_jbi_ssiclk_ff_scanin;
wire u_dffrl_async_ctu_jbi_ssiclk_ff_scanout;
wire ctu_jbi_ssiclk_ff;
wire next_jbi_io_ssi_sck;
wire u_dffrl_async_jbi_io_ssi_sck_scanin;
wire u_dffrl_async_jbi_io_ssi_sck_scanout;
wire u_dff_io_jbi_ssi_miso_ff_scanin;
wire u_dff_io_jbi_ssi_miso_ff_scanout;
wire sck_posedge_ff_scanin;
wire sck_posedge_ff_scanout;
wire sck_posedge_d1_ff_scanin;
wire sck_posedge_d1_ff_scanout;
wire sck_posedge_d2_ff_scanin;
wire sck_posedge_d2_ff_scanout;
wire sck_posedge_d3_ff_scanin;
wire sck_posedge_d3_ff_scanout;
wire sck_posedge_d3;
wire sck_posedge_d4_ff_scanin;
wire sck_posedge_d4_ff_scanout;
wire [2:0] n_ssi_sm;
wire ssi_sm_rst_l;
wire u_dffrl_ssi_sm_scanin;
wire u_dffrl_ssi_sm_scanout;
wire [6:0] n_sck_cyc_cnt;
wire u_dffrl_sck_cyc_cnt_scanin;
wire u_dffrl_sck_cyc_cnt_scanout;
wire u_dffrl_sif_ucbif_rdata_vld_scanin;
wire u_dffrl_sif_ucbif_rdata_vld_scanout;
wire n_sif_ucbif_timeout;
wire u_dffrl_sif_ucbif_timeout_scanin;
wire u_dffrl_sif_ucbif_timeout_scanout;
wire u_dffrl_sif_ucbif_par_err_scanin;
wire u_dffrl_sif_ucbif_par_err_scanout;
wire u_dffrl_jbi_io_ssi_mosi_scanin;
wire u_dffrl_jbi_io_ssi_mosi_scanout;
wire sck_cnt_ff_scanin;
wire sck_cnt_ff_scanout;
wire [17:0] sck_cnt;
wire [17:0] next_sck_cnt;
wire sck_bypass_ff_scanin;
wire sck_bypass_ff_scanout;
wire sck_bypass;
wire spares_scanin;
wire spares_scanout;
wire siclk;
wire soclk;
wire se;
wire pce_ov;
wire stop;

////////////////////////////////////////////////////////////////////////
// Interface signal list declarations
////////////////////////////////////////////////////////////////////////
input iol2clk;
input	tcu_pce_ov;
input	tcu_clk_stop;
input	tcu_scan_en;
input	tcu_aclk;
input	tcu_bclk;
input	scan_in;
output	scan_out;

// CSR
input [23:0] 	ucbif_sif_timeval;
input 		ucbif_sif_timeout_accpt;
input [1:0]     ncu_scksel;
output		sif_ucbif_timeout;     //assert until accepted
output		sif_ucbif_timeout_rw;  //timeout of a rd or wr
output		sif_ucbif_par_err;     //for rd par err, assert until accepted

//issue SSI command
output 		sif_ucbif_busy;
input  		ucbif_sif_vld;
input  		ucbif_sif_rw;            //instr w/o data will have no dlen asserted
input [1:0]	ucbif_sif_size;
input [27:0] 	ucbif_sif_addr;
input [63:0]	ucbif_sif_wdata;

//read return data
input 		ucbif_sif_rdata_accpt;
output [63:0]	sif_ucbif_rdata;
output 		sif_ucbif_rdata_vld;

// SSI bus signals
input 		io_jbi_ssi_miso;
output 		jbi_io_ssi_mosi;
output 		jbi_io_ssi_sck;
input		tcu_sck_bypass;
output		sck_cntexp;

////////////////////////////////////////////////////////////////////////
// Interface signal type declarations
////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////
// Local signal declarations 
////////////////////////////////////////////////////////////////////////
//
// Code start here 
//
//parameter SSI_IDLE    = 3'b000,
	  //SSI_REQ     = 3'b001,
	  //SSI_WDATA   = 3'b011,
	  //SSI_REQ_PAR = 3'b101,
	  //SSI_ACK     = 3'b111,
	  //SSI_RDATA   = 3'b110,
	  //SSI_ACK_PAR = 3'b010;

reg [2:0]	next_ssi_sm;
reg 		next_par;


reg [63:0] 	next_sif_ucbif_rdata;
reg 		next_jbi_io_ssi_mosi;




reg 		mosi_wdata_bit;


//*******************************************************************************
// Accept new request
//*******************************************************************************

assign sif_ucbif_busy = ~sck_cntexp | ((ssi_sm[2:0]!=`SSI_IDLE) |
			               sif_ucbif_rdata_vld |
                                       sif_ucbif_timeout | 
				       ~sck_posedge_d1)  ;

assign req_info_en = ucbif_sif_vld & ~sif_ucbif_busy;


// Store command info
assign next_wdata[63:0] = ucbif_sif_wdata[63:0];
assign wdata_en = req_info_en;

assign next_wdata_sel[2:0] = ucbif_sif_addr[2:0];
assign wdata_sel_en   = req_info_en;

assign next_size[1:0] = ucbif_sif_size[1:0];
assign size_en   = req_info_en;

assign next_rw = ucbif_sif_rw;
assign rw_en   = req_info_en;

//*******************************************************************************
// DFFRE Instantiations
//*******************************************************************************

ncu_ssisif_ctl_msff_ctl_macro__en_1__width_1 u_dffrle_rw  
				(
				.scan_in(u_dffrle_rw_scanin),
				.scan_out(u_dffrle_rw_scanout),
				.dout		(rw),
				.l1clk		(l1clk),
				.en		(rw_en),
				.din		(next_rw),
  .siclk(siclk),
  .soclk(soclk)
				);

ncu_ssisif_ctl_msff_ctl_macro__en_1__width_2 u_dffrle_size  
				(
				.scan_in(u_dffrle_size_scanin),
				.scan_out(u_dffrle_size_scanout),
				.dout		(size[1:0]),
				.l1clk		(l1clk),
				.en		(size_en),
				.din		(next_size[1:0]),
  .siclk(siclk),
  .soclk(soclk)
				);

ncu_ssisif_ctl_msff_ctl_macro__en_1__width_64 u_dffrle_wdata  
				(
				.scan_in(u_dffrle_wdata_scanin),
				.scan_out(u_dffrle_wdata_scanout),
				.dout		(wdata[63:0]),
				.l1clk		(l1clk),
				.en		(wdata_en),
				.din		(next_wdata[63:0]),
  .siclk(siclk),
  .soclk(soclk)
				);

ncu_ssisif_ctl_msff_ctl_macro__en_1__width_3 u_dffrle_wdata_sel  
				(
				.scan_in(u_dffrle_wdata_sel_scanin),
				.scan_out(u_dffrle_wdata_sel_scanout),
				.dout		(wdata_sel[2:0]),
				.l1clk		(l1clk),
				.en		(wdata_sel_en),
				.din		(next_wdata_sel[2:0]),
  .siclk(siclk),
  .soclk(soclk)
				);

ncu_ssisif_ctl_msff_ctl_macro__en_1__width_64 u_dffrle_sif_ucbif_rdata  
				(
				.scan_in(u_dffrle_sif_ucbif_rdata_scanin),
				.scan_out(u_dffrle_sif_ucbif_rdata_scanout),
				.dout		(sif_ucbif_rdata[63:0]),
				.l1clk		(l1clk),
				.en		(sif_ucbif_rdata_en),
				.din		(next_sif_ucbif_rdata[63:0]),
  .siclk(siclk),
  .soclk(soclk)
				);

 assign	n_par = par_rst_l ? next_par : 1'b0 ;
ncu_ssisif_ctl_msff_ctl_macro__en_1__width_1 u_dffrle_par  
				(
				.scan_in(u_dffrle_par_scanin),
				.scan_out(u_dffrle_par_scanout),
				.dout		(par),
				.l1clk		(l1clk),
				.en		(par_en|~par_rst_l),
				.din		(n_par),
  .siclk(siclk),
  .soclk(soclk)
				);

assign	n_timeout_cnt[23:0] = timeout_cnt_rst_l ? next_timeout_cnt[23:0] : 24'b0 ;
ncu_ssisif_ctl_msff_ctl_macro__en_1__width_24 u_dffrle_timeout_cnt  
				(
				.scan_in(u_dffrle_timeout_cnt_scanin),
				.scan_out(u_dffrle_timeout_cnt_scanout),
				.dout		(timeout_cnt[23:0]),
				.l1clk		(l1clk),
				.en		((sck_posedge&timeout_cnt_en)|~timeout_cnt_rst_l),
				.din		(n_timeout_cnt[23:0]),
  .siclk(siclk),
  .soclk(soclk)
				);

//------------------
// Shift Registers
//------------------

assign mosi_shreg0_s_in = 1'b0;
assign mosi_shreg1_s_in = mosi_shreg0_p_out[7];
assign mosi_shreg2_s_in = mosi_shreg1_p_out[7];
assign mosi_shreg3_s_in = mosi_shreg2_p_out[7];
assign mosi_shreg4_s_in = mosi_shreg3_p_out[7];
assign mosi_shreg5_s_in = mosi_shreg4_p_out[7];
assign mosi_shreg6_s_in = mosi_shreg5_p_out[7];
assign mosi_shreg7_s_in = mosi_shreg6_p_out[7];

assign mosi_shreg0_p_in[7:0] = mosi_shreg_din[ 7: 0];
assign mosi_shreg1_p_in[7:0] = mosi_shreg_din[15: 8];
assign mosi_shreg2_p_in[7:0] = mosi_shreg_din[23:16];
assign mosi_shreg3_p_in[7:0] = mosi_shreg_din[31:24];
assign mosi_shreg4_p_in[7:0] = mosi_shreg_din[39:32];
assign mosi_shreg5_p_in[7:0] = mosi_shreg_din[47:40];
assign mosi_shreg6_p_in[7:0] = mosi_shreg_din[55:48];
assign mosi_shreg7_p_in[7:0] = mosi_shreg_din[63:56];


//DW03_shftreg #(8) u_mosi_shreg0 (/*AUTOINST*/
ncu_ssisrg8_ctl u_mosi_shreg0 (/*AUTOINST*/
				 // Outputs
				 .p_out	(mosi_shreg0_p_out[7:0]),	 // Templated
				 // Inputs
				 .scan_in(u_mosi_shreg0_scanin),
				 .scan_out(u_mosi_shreg0_scanout),
				 .iol2clk	(iol2clk),
				 .tcu_pce_ov (tcu_pce_ov),
				 .tcu_clk_stop (tcu_clk_stop),
				 .tcu_scan_en (tcu_scan_en),
				 .tcu_aclk (tcu_aclk),
				 .tcu_bclk (tcu_bclk),
				 .s_in	(mosi_shreg0_s_in),	 // Templated
				 .p_in	(mosi_shreg0_p_in[7:0]),	 // Templated
				 .shift_n(mosi_shift_n),	 // Templated
				 .load_n(mosi_load_n));		 // Templated
ncu_ssisrg8_ctl u_mosi_shreg1 (/*AUTOINST*/
				 // Outputs
				 .p_out	(mosi_shreg1_p_out[7:0]),	 // Templated
				 // Inputs
				 .scan_in(u_mosi_shreg1_scanin),
				 .scan_out(u_mosi_shreg1_scanout),
				 .iol2clk	(iol2clk),
				 .tcu_pce_ov (tcu_pce_ov),
				 .tcu_clk_stop (tcu_clk_stop),
				 .tcu_scan_en (tcu_scan_en),
				 .tcu_aclk (tcu_aclk),
				 .tcu_bclk (tcu_bclk),
				 .s_in	(mosi_shreg1_s_in),	 // Templated
				 .p_in	(mosi_shreg1_p_in[7:0]),	 // Templated
				 .shift_n(mosi_shift_n),	 // Templated
				 .load_n(mosi_load_n));		 // Templated
ncu_ssisrg8_ctl u_mosi_shreg2 (/*AUTOINST*/
				 // Outputs
				 .p_out	(mosi_shreg2_p_out[7:0]),	 // Templated
				 // Inputs
				 .scan_in(u_mosi_shreg2_scanin),
				 .scan_out(u_mosi_shreg2_scanout),
				 .iol2clk	(iol2clk),
				 .tcu_pce_ov (tcu_pce_ov),
				 .tcu_clk_stop (tcu_clk_stop),
				 .tcu_scan_en (tcu_scan_en),
				 .tcu_aclk (tcu_aclk),
				 .tcu_bclk (tcu_bclk),
				 .s_in	(mosi_shreg2_s_in),	 // Templated
				 .p_in	(mosi_shreg2_p_in[7:0]),	 // Templated
				 .shift_n(mosi_shift_n),	 // Templated
				 .load_n(mosi_load_n));		 // Templated
ncu_ssisrg8_ctl u_mosi_shreg3 (/*AUTOINST*/
				 // Outputs
				 .p_out	(mosi_shreg3_p_out[7:0]),	 // Templated
				 // Inputs
				 .scan_in(u_mosi_shreg3_scanin),
				 .scan_out(u_mosi_shreg3_scanout),
				 .iol2clk	(iol2clk),
				 .tcu_pce_ov (tcu_pce_ov),
				 .tcu_clk_stop (tcu_clk_stop),
				 .tcu_scan_en (tcu_scan_en),
				 .tcu_aclk (tcu_aclk),
				 .tcu_bclk (tcu_bclk),
				 .s_in	(mosi_shreg3_s_in),	 // Templated
				 .p_in	(mosi_shreg3_p_in[7:0]),	 // Templated
				 .shift_n(mosi_shift_n),	 // Templated
				 .load_n(mosi_load_n));		 // Templated
ncu_ssisrg8_ctl u_mosi_shreg4 (/*AUTOINST*/
				 // Outputs
				 .p_out	(mosi_shreg4_p_out[7:0]),	 // Templated
				 // Inputs
				 .scan_in(u_mosi_shreg4_scanin),
				 .scan_out(u_mosi_shreg4_scanout),
				 .iol2clk	(iol2clk),
				 .tcu_pce_ov (tcu_pce_ov),
				 .tcu_clk_stop (tcu_clk_stop),
				 .tcu_scan_en (tcu_scan_en),
				 .tcu_aclk (tcu_aclk),
				 .tcu_bclk (tcu_bclk),
				 .s_in	(mosi_shreg4_s_in),	 // Templated
				 .p_in	(mosi_shreg4_p_in[7:0]),	 // Templated
				 .shift_n(mosi_shift_n),	 // Templated
				 .load_n(mosi_load_n));		 // Templated
ncu_ssisrg8_ctl u_mosi_shreg5 (/*AUTOINST*/
				 // Outputs
				 .p_out	(mosi_shreg5_p_out[7:0]),	 // Templated
				 // Inputs
				 .scan_in(u_mosi_shreg5_scanin),
				 .scan_out(u_mosi_shreg5_scanout),
				 .iol2clk	(iol2clk),
				 .tcu_pce_ov (tcu_pce_ov),
				 .tcu_clk_stop (tcu_clk_stop),
				 .tcu_scan_en (tcu_scan_en),
				 .tcu_aclk (tcu_aclk),
				 .tcu_bclk (tcu_bclk),
				 .s_in	(mosi_shreg5_s_in),	 // Templated
				 .p_in	(mosi_shreg5_p_in[7:0]),	 // Templated
				 .shift_n(mosi_shift_n),	 // Templated
				 .load_n(mosi_load_n));		 // Templated
ncu_ssisrg8_ctl u_mosi_shreg6 (/*AUTOINST*/
				 // Outputs
				 .p_out	(mosi_shreg6_p_out[7:0]),	 // Templated
				 // Inputs
				 .scan_in(u_mosi_shreg6_scanin),
				 .scan_out(u_mosi_shreg6_scanout),
				 .iol2clk	(iol2clk),
				 .tcu_pce_ov (tcu_pce_ov),
				 .tcu_clk_stop (tcu_clk_stop),
				 .tcu_scan_en (tcu_scan_en),
				 .tcu_aclk (tcu_aclk),
				 .tcu_bclk (tcu_bclk),
				 .s_in	(mosi_shreg6_s_in),	 // Templated
				 .p_in	(mosi_shreg6_p_in[7:0]),	 // Templated
				 .shift_n(mosi_shift_n),	 // Templated
				 .load_n(mosi_load_n));		 // Templated
ncu_ssisrg8_ctl u_mosi_shreg7 (/*AUTOINST*/
				 // Outputs
				 .p_out	(mosi_shreg7_p_out[7:0]),	 // Templated
				 // Inputs
				 .scan_in(u_mosi_shreg7_scanin),
				 .scan_out(u_mosi_shreg7_scanout),
				 .iol2clk	(iol2clk),
				 .tcu_pce_ov (tcu_pce_ov),
				 .tcu_clk_stop (tcu_clk_stop),
				 .tcu_scan_en (tcu_scan_en),
				 .tcu_aclk (tcu_aclk),
				 .tcu_bclk (tcu_bclk),
				 .s_in	(mosi_shreg7_s_in),	 // Templated
				 .p_in	(mosi_shreg7_p_in[7:0]),	 // Templated
				 .shift_n(mosi_shift_n),	 // Templated
				 .load_n(mosi_load_n));		 // Templated


//*******************************************************************************
// SCK Dependencies
// - ctu_jbi_ssiclk is jbus clk divided by 4
//*******************************************************************************

////assign sck_posedge_d1 = ~ctu_jbi_ssiclk_d1 &  ctu_jbi_ssiclk_ff;
////assign sck_negedge_d1 =  ctu_jbi_ssiclk_d1 & ~ctu_jbi_ssiclk_ff;

//assign sck_negedge = sck_posedge_d2;
//sck cycle count increments at rising edge of sck
assign sck_cyc_cnt_rst_l = ssi_sm[2:0] == next_ssi_sm[2:0];  //clear count when jumping into new state

assign next_sck_cyc_cnt[6:0] = (  (  (ssi_sm[2:0] == `SSI_RDATA | ssi_sm[2:0] == `SSI_ACK_PAR) & sck_posedge_d4)
    				| ( ~(ssi_sm[2:0] == `SSI_RDATA | ssi_sm[2:0] == `SSI_ACK_PAR) & sck_posedge) ) ?
					sck_cyc_cnt[6:0] + 7'd1 : sck_cyc_cnt[6:0] ;



//***********************************************************************************
//  signal at pin (board level, note, mosi and miso do not active at same time)
//***********************************************************************************
//            | 0 | 1 | 2 | 3 | 4 | 5 | 6 | 7 | 8 | 9 |10 |11 |12 |13 |14 |15 |16 |
//                 _   _   _   _   _   _   _   _   _   _   _   _   _   _   _   _   _   _
//iol2clk        _| |_| |_| |_| |_| |_| |_| |_| |_| |_| |_| |_| |_| |_| |_| |_| |_| |_|
//                 _______________                 _______________                 _____
//sck(pin)       _|a              |_______________|b              |_______________|  
//               _____ _______________________________ _______________
//mosi(pin)      _____X_________data_out______________X_______________ 
//               __                              _________________               _________
//miso(pin)      __XXXXXXXXXXXXXXXXXXXXXXXXXXXXXX___data_a________XXXXXXXXXXXXXXX__data_b_
//                                                ^                               ^     
//                                                MIO sample miso @ rising of sck    
//
//***********************************************************************************
// AT NCU port level (note mosi and miso do not active at same time)
//***********************************************************************************
//            | 0 | 1 | 2 | 3 | 4 | 5 | 6 | 7 | 8 | 9 |10 |11 |12 |13 |14 |15 |16 |17 |
//             _   _   _   _   _   _   _   _   _   _   _   _   _   _   _   _   _   
//iol2clk     | |_| |_| |_| |_| |_| |_| |_| |_| |_| |_| |_| |_| |_| |_| |_| |_| |_|
//                 _______________                 _______________                 _
//sck(pin)     ___|a              |_______________|b              |_______________|  
//             _______________                 _______________                 _____
//io_ssi_sck _|a              |_______________|b              |_______________|  
//              __ _______________________________ _______________________________ __
//ssi_mosi(ncu) __X_____data______________________X_________data__________________X__
//                                                 _______________________________ ______    
//ssi_miso(ncu)        XXXXXXXXXXXXXXXXXXXXXXXXXXXX__data_a_______________________X______     
//                                                    ^ncu sample ssi_miso(from mio)  ^
//                                                     _______________________________ __
//ssi_miso_ff(internal) XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX__data_a_______________________X__        
//
//            | 0 | 1 | 2 | 3 | 4 | 5 | 6 | 7 | 8 | 9 |10 |11 |12 |13 |14 |15 |16 |17 |18 |
//                                             P2  P3  P4  P5
//                                                      ^Internally processing at P4
//















// Load miso shift register
assign ssi_req[27:0]  = ucbif_sif_addr[27:0];
assign ssi_req[29:28] = ucbif_sif_size[1:0];
assign ssi_req[30]    = ucbif_sif_rw;

assign mosi_shreg_din[63:0] = (ssi_sm[2:0] == `SSI_IDLE) ? { {33{1'b1}}, ssi_req[30:0] } : wdata[63:0] ;


assign mosi_load_n = ~(ssi_sm[2:0] == `SSI_IDLE | 
			(ssi_sm[2:0] == `SSI_REQ & sck_cyc_cnt[5] & ~rw));

// Advance miso shift register
assign mosi_shift_n = ~(sck_posedge_d1
			& (ssi_sm[2:0] == `SSI_REQ | ssi_sm[2:0] == `SSI_WDATA) & mosi_load_n);

// Determine where wdata is to be taken
always @ ( /*AUTOSENSE*/mosi_shreg0_p_out or mosi_shreg1_p_out
	  or mosi_shreg2_p_out or mosi_shreg3_p_out
	  or mosi_shreg4_p_out or mosi_shreg5_p_out
	  or mosi_shreg6_p_out or mosi_shreg7_p_out or wdata_sel) begin
case(wdata_sel[2:0])
   3'd0: mosi_wdata_bit = mosi_shreg7_p_out[7];
   3'd1: mosi_wdata_bit = mosi_shreg6_p_out[7];
   3'd2: mosi_wdata_bit = mosi_shreg5_p_out[7];
   3'd3: mosi_wdata_bit = mosi_shreg4_p_out[7];
   3'd4: mosi_wdata_bit = mosi_shreg3_p_out[7];
   3'd5: mosi_wdata_bit = mosi_shreg2_p_out[7];
   3'd6: mosi_wdata_bit = mosi_shreg1_p_out[7];
   3'd7: mosi_wdata_bit = mosi_shreg0_p_out[7];
endcase
end

// Generate parity
assign par_en =   (  sck_posedge_d2  // gen par
		   & (ssi_sm[2:0] == `SSI_REQ | ssi_sm[2:0] == `SSI_WDATA))
             | (  sck_posedge_d4  // check par
		   & (ssi_sm[2:0] == `SSI_ACK | ssi_sm[2:0] == `SSI_RDATA | ssi_sm[2:0] == `SSI_ACK_PAR));
			  
assign par_rst_l =   ~(  ssi_sm[2:0] == `SSI_IDLE
	              | ssi_sm[2:0] == `SSI_ACK & ~(sck_posedge_d4 & io_jbi_ssi_miso_ff));

always @ ( /*AUTOSENSE*/io_jbi_ssi_miso_ff or next_jbi_io_ssi_mosi
	  or par or ssi_sm) begin
    case (ssi_sm[2:0])
    `SSI_REQ,
    `SSI_WDATA   : next_par = par ^ next_jbi_io_ssi_mosi;
    `SSI_ACK,
    `SSI_RDATA,
    `SSI_ACK_PAR : next_par = par ^ io_jbi_ssi_miso_ff;
    default      : next_par = 1'b0;
endcase
end


// Output MOSI
always @ ( /*AUTOSENSE*/mosi_shreg3_p_out or mosi_wdata_bit or par
	  or ssi_sm) begin
case (ssi_sm[2:0])
   `SSI_REQ:      next_jbi_io_ssi_mosi = mosi_shreg3_p_out[7]; // include start bit
   `SSI_WDATA:    next_jbi_io_ssi_mosi = mosi_wdata_bit;
   `SSI_REQ_PAR:  next_jbi_io_ssi_mosi = par;
   default: next_jbi_io_ssi_mosi = 1'b0;
endcase
end

//*******************************************************************************
// SO Packing
//*******************************************************************************

//assign rdata_shift_n = ~(ssi_sm[2:0] == `SSI_RDATA & sck_posedge_d2);
assign rdata_shift_n = ~(ssi_sm[2:0] == `SSI_RDATA & sck_posedge_d4);

assign	srg64p_out_next[63:0] = rdata_shift_n ? srg64p_out[63:0] : 
	                                  {srg64p_out[62:0],io_jbi_ssi_miso_ff} ;
assign	rdata_shreg[63:0]=srg64p_out[63:0];

ncu_ssisif_ctl_msff_ctl_macro__width_64 srg64p_out_ff 
				(
				.scan_in(srg64p_out_ff_scanin),
				.scan_out(srg64p_out_ff_scanout),
				.dout		(srg64p_out[63:0]),
				.l1clk		(l1clk),
				.din		(srg64p_out_next[63:0]),
  .siclk(siclk),
  .soclk(soclk)
				);

// Signal read return data
assign sif_ucbif_rdata_en = ssi_sm[2:0] == `SSI_ACK_PAR ;
always @ ( /*AUTOSENSE*/rdata_shreg or size) begin
case (size[1:0])
   2'b00: next_sif_ucbif_rdata[63:0] = {8{rdata_shreg[7:0]}};
   2'b01: next_sif_ucbif_rdata[63:0] = {4{rdata_shreg[15:0]}};
   2'b10: next_sif_ucbif_rdata[63:0] = {2{rdata_shreg[31:0]}};
   2'b11: next_sif_ucbif_rdata[63:0] = rdata_shreg;
   //default: next_sif_ucbif_rdata[63:0] = 64'bx;
endcase
end

assign next_sif_ucbif_rdata_vld = ack_par_rdy & rw
				  | (sif_ucbif_rdata_vld 
				     & ~ucbif_sif_rdata_accpt);

//*******************************************************************************
// Error Handling
// - Ack Timeout
// - Parity 
//*******************************************************************************

// Timeout
assign timeout_cnt_en = ssi_sm[2:0] == `SSI_ACK ;
assign timeout_cnt_rst_l = ssi_sm[2:0] == `SSI_ACK ;
assign next_timeout_cnt[23:0] = timeout_cnt[23:0] + 24'd1;

assign sif_ucbif_timeout_rst_l = ~ucbif_sif_timeout_accpt;

assign next_sif_ucbif_timeout = sif_ucbif_timeout | (timeout_cnt[23:0] == 
						     ucbif_sif_timeval[23:0]);

assign sif_ucbif_timeout_rw = rw;

// Parity - even parity
assign ack_par_rdy = (ssi_sm[2:0] == `SSI_ACK_PAR) & (next_ssi_sm[2:0] != `SSI_ACK_PAR);
assign next_sif_ucbif_par_err =  ack_par_rdy & par 
                            | (sif_ucbif_par_err
				  & sif_ucbif_rdata_vld
				  & ~ucbif_sif_rdata_accpt);


//*******************************************************************************
// Async Reset DFFRL Instantiations
//*******************************************************************************
assign	cntr_n[2:0] = cntr[2:0] + 3'd1 ;
//assign	iol2clk_by8 = cntr[2];
//assign  iol2clk_by4 = cntr[1];

reg iol2clk_div;
reg sck_posedge_next;
//reg sck_negedge_next;

always @(ncu_scksel[1:0] or cntr[2:0])
begin
  case(ncu_scksel[1:0])
    2'b00: begin iol2clk_div = cntr[2]; 
		 sck_posedge_next = cntr[2:0]==3'b011; 
 		 //sck_negedge_next = cntr[2:0]==3'b111 ;
 	   end
    2'b01: begin iol2clk_div = cntr[1]; 
		 sck_posedge_next = cntr[1:0]==2'b01; 
		 //sck_negedge_next = cntr[1:0]==2'b11 ;
 	   end
    default: begin iol2clk_div = cntr[2]; 
	     	   sck_posedge_next = cntr[2:0]==3'b011; 
		   //sck_negedge_next = cntr[2:0]==3'b111 ;
             end
  endcase
end
  
ncu_ssisif_ctl_msff_ctl_macro__width_3 cntr_ff 
				(
				.scan_in(cntr_ff_scanin),
				.scan_out(cntr_ff_scanout),
				.dout		(cntr[2:0]),
				.l1clk		(l1clk),
				.din		(cntr_n[2:0]),
  .siclk(siclk),
  .soclk(soclk)
				);

ncu_ssisif_ctl_msff_ctl_macro__width_1 u_dffrl_async_ctu_jbi_ssiclk_ff 
				(
				.scan_in(u_dffrl_async_ctu_jbi_ssiclk_ff_scanin),
				.scan_out(u_dffrl_async_ctu_jbi_ssiclk_ff_scanout),
				.dout		(ctu_jbi_ssiclk_ff),
				.l1clk		(l1clk),
				.din		(iol2clk_div),
  .siclk(siclk),
  .soclk(soclk)
				);
  //.rst_l (arst_l),

assign next_jbi_io_ssi_sck = ctu_jbi_ssiclk_ff;
ncu_ssisif_ctl_msff_ctl_macro__width_1 u_dffrl_async_jbi_io_ssi_sck 
				(
				.scan_in(u_dffrl_async_jbi_io_ssi_sck_scanin),
				.scan_out(u_dffrl_async_jbi_io_ssi_sck_scanout),
				.dout		(jbi_io_ssi_sck),
				.l1clk		(l1clk),
				.din		(next_jbi_io_ssi_sck),
  .siclk(siclk),
  .soclk(soclk)
				);
 //.rst_l(arst_l),

//*******************************************************************************
// DFF Instantiations
//*******************************************************************************

ncu_ssisif_ctl_msff_ctl_macro__width_1 u_dff_io_jbi_ssi_miso_ff 
				(
				.scan_in(u_dff_io_jbi_ssi_miso_ff_scanin),
				.scan_out(u_dff_io_jbi_ssi_miso_ff_scanout),
				.dout		(io_jbi_ssi_miso_ff),
				.l1clk		(l1clk),
				.din		(io_jbi_ssi_miso),
  .siclk(siclk),
  .soclk(soclk)
				);

ncu_ssisif_ctl_msff_ctl_macro__width_1 sck_posedge_ff 
				(
				.scan_in(sck_posedge_ff_scanin),
				.scan_out(sck_posedge_ff_scanout),
				.dout		(sck_posedge),
				.l1clk		(l1clk),
				.din		(sck_posedge_next),
  .siclk(siclk),
  .soclk(soclk)
				);
ncu_ssisif_ctl_msff_ctl_macro__width_1 sck_posedge_d1_ff 
				(
				.scan_in(sck_posedge_d1_ff_scanin),
				.scan_out(sck_posedge_d1_ff_scanout),
				.dout		(sck_posedge_d1),
				.l1clk		(l1clk),
				.din		(sck_posedge),
  .siclk(siclk),
  .soclk(soclk)
				);
ncu_ssisif_ctl_msff_ctl_macro__width_1 sck_posedge_d2_ff 
				(
				.scan_in(sck_posedge_d2_ff_scanin),
				.scan_out(sck_posedge_d2_ff_scanout),
				.dout		(sck_posedge_d2),
				.l1clk		(l1clk),
				.din		(sck_posedge_d1),
  .siclk(siclk),
  .soclk(soclk)
				);

ncu_ssisif_ctl_msff_ctl_macro__width_1 sck_posedge_d3_ff 
				(
				.scan_in(sck_posedge_d3_ff_scanin),
				.scan_out(sck_posedge_d3_ff_scanout),
				.dout		(sck_posedge_d3),
				.l1clk		(l1clk),
				.din		(sck_posedge_d2),
  .siclk(siclk),
  .soclk(soclk)
				);

ncu_ssisif_ctl_msff_ctl_macro__width_1 sck_posedge_d4_ff 
				(
				.scan_in(sck_posedge_d4_ff_scanin),
				.scan_out(sck_posedge_d4_ff_scanout),
				.dout		(sck_posedge_d4),
				.l1clk		(l1clk),
				.din		(sck_posedge_d3),
  .siclk(siclk),
  .soclk(soclk)
				);

//msff_ctl_macro sck_negedge_ff (width=1)
				//(
				//.scan_in(sck_negedge_ff_scanin),
				//.scan_out(sck_negedge_ff_scanout),
				//.dout		(sck_negedge),
				//.l1clk		(l1clk),
				//.din		(sck_negedge_next)
				//);
//msff_ctl_macro sck_negedge_d1_ff (width=1)
				//(
				//.scan_in(sck_negedge_d1_ff_scanin),
				//.scan_out(sck_negedge_d1_ff_scanout),
				//.dout		(sck_negedge_d1),
				//.l1clk		(l1clk),
				//.din		(sck_negedge)
				//);

////dff #(1) u_dff_ctu_jbi_ssiclk_d1
////(.din(ctu_jbi_ssiclk_ff),
////.clk(iol2clk),
////.q(ctu_jbi_ssiclk_d1) 
////);

//dff_ns #(1) u_dff_sck_posedge_d2
//   (.din(sck_posedge_d1),
//    .clk(clk),
//    .q(sck_posedge_d2) 
//    );

//*******************************************************************************
// DFFR Instantiations
//*******************************************************************************
assign	n_ssi_sm[2:0] = ssi_sm_rst_l ? next_ssi_sm[2:0] : 3'b0 ;
ncu_ssisif_ctl_msff_ctl_macro__width_3 u_dffrl_ssi_sm 
				(
				.scan_in(u_dffrl_ssi_sm_scanin),
				.scan_out(u_dffrl_ssi_sm_scanout),
				.dout		(ssi_sm[2:0]),
				.l1clk		(l1clk),
				.din		(n_ssi_sm[2:0]),
  .siclk(siclk),
  .soclk(soclk)
				);

assign	n_sck_cyc_cnt[6:0] = sck_cyc_cnt_rst_l ?  next_sck_cyc_cnt[6:0] : 7'b0 ;
ncu_ssisif_ctl_msff_ctl_macro__width_7 u_dffrl_sck_cyc_cnt 
				(
				.scan_in(u_dffrl_sck_cyc_cnt_scanin),
				.scan_out(u_dffrl_sck_cyc_cnt_scanout),
				.dout		(sck_cyc_cnt[6:0]),
				.l1clk		(l1clk),
				.din		(n_sck_cyc_cnt[6:0]),
  .siclk(siclk),
  .soclk(soclk)
				);

ncu_ssisif_ctl_msff_ctl_macro__width_1 u_dffrl_sif_ucbif_rdata_vld 
				(
				.scan_in(u_dffrl_sif_ucbif_rdata_vld_scanin),
				.scan_out(u_dffrl_sif_ucbif_rdata_vld_scanout),
				.dout		(sif_ucbif_rdata_vld),
				.l1clk		(l1clk),
				.din		(next_sif_ucbif_rdata_vld),
  .siclk(siclk),
  .soclk(soclk)
				);

assign	n_sif_ucbif_timeout = sif_ucbif_timeout_rst_l ? next_sif_ucbif_timeout : 1'b0 ;
ncu_ssisif_ctl_msff_ctl_macro__width_1 u_dffrl_sif_ucbif_timeout 
				(
				.scan_in(u_dffrl_sif_ucbif_timeout_scanin),
				.scan_out(u_dffrl_sif_ucbif_timeout_scanout),
				.dout		(sif_ucbif_timeout),
				.l1clk		(l1clk),
				.din		(n_sif_ucbif_timeout),
  .siclk(siclk),
  .soclk(soclk)
				);

ncu_ssisif_ctl_msff_ctl_macro__width_1 u_dffrl_sif_ucbif_par_err 
				(
				.scan_in(u_dffrl_sif_ucbif_par_err_scanin),
				.scan_out(u_dffrl_sif_ucbif_par_err_scanout),
				.dout		(sif_ucbif_par_err),
				.l1clk		(l1clk),
				.din		(next_sif_ucbif_par_err),
  .siclk(siclk),
  .soclk(soclk)
				);

ncu_ssisif_ctl_msff_ctl_macro__width_1 u_dffrl_jbi_io_ssi_mosi 
				(
				.scan_in(u_dffrl_jbi_io_ssi_mosi_scanin),
				.scan_out(u_dffrl_jbi_io_ssi_mosi_scanout),
				.dout		(jbi_io_ssi_mosi),
				.l1clk		(l1clk),
				.din		(next_jbi_io_ssi_mosi),
  .siclk(siclk),
  .soclk(soclk)
				);
//*******************************************************************************
//sck_cnt[17:0] (lock counter) starting all 0's and inc to all 1's, then
//allow busy signal to be drop and can accept request from uif block
//counting is bypassed if tcu_sck_bypass is 1 (for testing or debugging use)
//*******************************************************************************

ncu_ssisif_ctl_msff_ctl_macro__width_18 sck_cnt_ff 
				(
				.scan_in(sck_cnt_ff_scanin),
				.scan_out(sck_cnt_ff_scanout),
				.dout		(sck_cnt[17:0]),
				.l1clk		(l1clk),
				.din		(next_sck_cnt[17:0]),
  .siclk(siclk),
  .soclk(soclk)
				);

ncu_ssisif_ctl_msff_ctl_macro__width_1 sck_bypass_ff 
                                (
                                .scan_in(sck_bypass_ff_scanin),
                                .scan_out(sck_bypass_ff_scanout),
                                .dout           (sck_bypass),
                                .l1clk          (l1clk),
                                .din            (tcu_sck_bypass),
  .siclk(siclk),
  .soclk(soclk)
                                );

assign sck_cntexp = (sck_cnt[17:0] == 18'h3FFFF);
assign next_sck_cnt[17:0] = sck_bypass ? 18'h3FFFF : 
			    (~sck_cntexp & sck_posedge) ? (sck_cnt[17:0] + 18'b1) : 
			    			           sck_cnt[17:0];

//*******************************************************************************
// SSI State Machine
//*******************************************************************************

assign ssi_sm_rst_l = ~sif_ucbif_timeout; // stop processing after timeout

//jimmy: sm runs at d1 and change at d2 for IDLE->REQ-WDATA-REQPAR
always @(/*AUTOSENSE*/io_jbi_ssi_miso_ff or rw or sck_cyc_cnt
	 or sck_posedge_d4 or sck_posedge_d1 or sif_ucbif_timeout or size
	 or ssi_sm or ucbif_sif_vld) begin
case(ssi_sm[2:0])
   `SSI_IDLE: begin
	 if (ucbif_sif_vld & sck_posedge_d1)  // must line up with mosi
	    next_ssi_sm[2:0] = `SSI_REQ ;
	 else
	    next_ssi_sm[2:0] = `SSI_IDLE ;
   end

   `SSI_REQ: begin  
	 if (sck_cyc_cnt[5]) begin // == 32 which includes start bit
	    if (rw)
	       next_ssi_sm[2:0] = `SSI_REQ_PAR ;
	    else 
	       next_ssi_sm[2:0] = `SSI_WDATA ;
	 end
	 else
	    next_ssi_sm[2:0] = `SSI_REQ ;
   end

   `SSI_WDATA: begin
	 if (  (size[1:0] == 2'b00 & sck_cyc_cnt[3])
	     | (size[1:0] == 2'b01 & sck_cyc_cnt[4])
	     | (size[1:0] == 2'b10 & sck_cyc_cnt[5])
	     | (size[1:0] == 2'b11 & sck_cyc_cnt[6]))
	    next_ssi_sm[2:0] = `SSI_REQ_PAR ;
	 else
	    next_ssi_sm[2:0] = `SSI_WDATA ;
   end

   `SSI_REQ_PAR: begin
	 if (sck_cyc_cnt[0])
	    next_ssi_sm[2:0] = `SSI_ACK ;
	 else
	    next_ssi_sm[2:0] = `SSI_REQ_PAR ;
   end

   `SSI_ACK: begin  
   //sample at posedge of sck period + 10 cycle delay from io_ssi_sck gen to recv
	 if (sck_posedge_d4 & io_jbi_ssi_miso_ff) begin
	    if (rw)
	       next_ssi_sm[2:0] = `SSI_RDATA ;
	    else
	       next_ssi_sm[2:0] = `SSI_ACK_PAR ;
	 end
	 else if (sif_ucbif_timeout)
	    next_ssi_sm[2:0] = `SSI_IDLE ;
	 else
	    next_ssi_sm[2:0] = `SSI_ACK ;
   end

   `SSI_RDATA: begin 
    //sample at  posedge of sck period + 10 cycle delay from io_ssi_sck gen to recv
	if (  (size[1:0] == 2'b00 & sck_cyc_cnt[3])  
	    | (size[1:0] == 2'b01 & sck_cyc_cnt[4])
	    | (size[1:0] == 2'b10 & sck_cyc_cnt[5])
	    | (size[1:0] == 2'b11 & sck_cyc_cnt[6]))
	   next_ssi_sm[2:0] = `SSI_ACK_PAR ;
	else
	   next_ssi_sm[2:0] = `SSI_RDATA ;
   end
   
   `SSI_ACK_PAR: begin
	 if (sck_cyc_cnt[0])
	    next_ssi_sm[2:0] = `SSI_IDLE ;
	 else
	    next_ssi_sm[2:0] = `SSI_ACK_PAR ;
   end

   default: begin
	 next_ssi_sm[2:0] = `SSI_IDLE ;
   end
endcase
end

/* spare gate, 4531 cells / 450 = 11 */

ncu_ssisif_ctl_spare_ctl_macro__num_11 spares  (
                .scan_in(spares_scanin),
                .scan_out(spares_scanout),
                .l1clk  (l1clk),
  .siclk(siclk),
  .soclk(soclk)
        );



/**** adding clock header ****/
ncu_ssisif_ctl_l1clkhdr_ctl_macro clkgen (
				.l2clk	(iol2clk),
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
assign u_dffrle_rw_scanin        = scan_in                  ;
assign u_dffrle_size_scanin      = u_dffrle_rw_scanout      ;
assign u_dffrle_wdata_scanin     = u_dffrle_size_scanout    ;
assign u_dffrle_wdata_sel_scanin = u_dffrle_wdata_scanout   ;
assign u_dffrle_sif_ucbif_rdata_scanin = u_dffrle_wdata_sel_scanout;
assign u_dffrle_par_scanin       = u_dffrle_sif_ucbif_rdata_scanout;
assign u_dffrle_timeout_cnt_scanin = u_dffrle_par_scanout     ;
assign u_mosi_shreg0_scanin      = u_dffrle_timeout_cnt_scanout;
assign u_mosi_shreg1_scanin      = u_mosi_shreg0_scanout    ;
assign u_mosi_shreg2_scanin      = u_mosi_shreg1_scanout    ;
assign u_mosi_shreg3_scanin      = u_mosi_shreg2_scanout    ;
assign u_mosi_shreg4_scanin      = u_mosi_shreg3_scanout    ;
assign u_mosi_shreg5_scanin      = u_mosi_shreg4_scanout    ;
assign u_mosi_shreg6_scanin      = u_mosi_shreg5_scanout    ;
assign u_mosi_shreg7_scanin      = u_mosi_shreg6_scanout    ;
assign srg64p_out_ff_scanin      = u_mosi_shreg7_scanout    ;
assign cntr_ff_scanin            = srg64p_out_ff_scanout    ;
assign u_dffrl_async_ctu_jbi_ssiclk_ff_scanin = cntr_ff_scanout          ;
assign u_dffrl_async_jbi_io_ssi_sck_scanin = u_dffrl_async_ctu_jbi_ssiclk_ff_scanout;
assign u_dff_io_jbi_ssi_miso_ff_scanin = u_dffrl_async_jbi_io_ssi_sck_scanout;
assign sck_posedge_ff_scanin     = u_dff_io_jbi_ssi_miso_ff_scanout;
assign sck_posedge_d1_ff_scanin  = sck_posedge_ff_scanout   ;
assign sck_posedge_d2_ff_scanin  = sck_posedge_d1_ff_scanout;
assign sck_posedge_d3_ff_scanin  = sck_posedge_d2_ff_scanout;
assign sck_posedge_d4_ff_scanin  = sck_posedge_d3_ff_scanout;
//assign sck_negedge_ff_scanin     = sck_posedge_d2_ff_scanout;
//assign sck_negedge_d1_ff_scanin  = sck_negedge_ff_scanout   ;
//assign u_dffrl_ssi_sm_scanin     = sck_negedge_d1_ff_scanout;
assign u_dffrl_ssi_sm_scanin     = sck_posedge_d4_ff_scanout;
assign u_dffrl_sck_cyc_cnt_scanin = u_dffrl_ssi_sm_scanout   ;
assign u_dffrl_sif_ucbif_rdata_vld_scanin = u_dffrl_sck_cyc_cnt_scanout;
assign u_dffrl_sif_ucbif_timeout_scanin = u_dffrl_sif_ucbif_rdata_vld_scanout;
assign u_dffrl_sif_ucbif_par_err_scanin = u_dffrl_sif_ucbif_timeout_scanout;
assign u_dffrl_jbi_io_ssi_mosi_scanin = u_dffrl_sif_ucbif_par_err_scanout;
assign sck_cnt_ff_scanin         = u_dffrl_jbi_io_ssi_mosi_scanout;
assign sck_bypass_ff_scanin	 = sck_cnt_ff_scanout;
assign spares_scanin             = sck_bypass_ff_scanout       ;
assign scan_out                  = spares_scanout           ;
// fixscan end:
endmodule

// Local Variables:
// verilog-library-directories:("." "/import/datools/vendor/synopsys/v2003.03-beta1/dw/dw03/src_ver/")
// verilog-auto-sense-defines-constant:t
// End:








// any PARAMS parms go into naming of macro

module ncu_ssisif_ctl_msff_ctl_macro__en_1__width_1 (
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

module ncu_ssisif_ctl_msff_ctl_macro__en_1__width_2 (
  din, 
  en, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [1:0] fdin;
wire [0:0] so;

  input [1:0] din;
  input en;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [1:0] dout;
  output scan_out;
assign fdin[1:0] = (din[1:0] & {2{en}}) | (dout[1:0] & ~{2{en}});






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

module ncu_ssisif_ctl_msff_ctl_macro__en_1__width_64 (
  din, 
  en, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [63:0] fdin;
wire [62:0] so;

  input [63:0] din;
  input en;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [63:0] dout;
  output scan_out;
assign fdin[63:0] = (din[63:0] & {64{en}}) | (dout[63:0] & ~{64{en}});






dff #(64)  d0_0 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[63:0]),
.si({scan_in,so[62:0]}),
.so({so[62:0],scan_out}),
.q(dout[63:0])
);












endmodule













// any PARAMS parms go into naming of macro

module ncu_ssisif_ctl_msff_ctl_macro__en_1__width_3 (
  din, 
  en, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [2:0] fdin;
wire [1:0] so;

  input [2:0] din;
  input en;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [2:0] dout;
  output scan_out;
assign fdin[2:0] = (din[2:0] & {3{en}}) | (dout[2:0] & ~{3{en}});






dff #(3)  d0_0 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[2:0]),
.si({scan_in,so[1:0]}),
.so({so[1:0],scan_out}),
.q(dout[2:0])
);












endmodule













// any PARAMS parms go into naming of macro

module ncu_ssisif_ctl_msff_ctl_macro__en_1__width_24 (
  din, 
  en, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [23:0] fdin;
wire [22:0] so;

  input [23:0] din;
  input en;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [23:0] dout;
  output scan_out;
assign fdin[23:0] = (din[23:0] & {24{en}}) | (dout[23:0] & ~{24{en}});






dff #(24)  d0_0 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[23:0]),
.si({scan_in,so[22:0]}),
.so({so[22:0],scan_out}),
.q(dout[23:0])
);












endmodule






// any PARAMS parms go into naming of macro

module ncu_ssisif_ctl_msff_ctl_macro__width_8 (
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

module ncu_ssisif_ctl_l1clkhdr_ctl_macro (
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













// any PARAMS parms go into naming of macro

module ncu_ssisif_ctl_msff_ctl_macro__width_64 (
  din, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [63:0] fdin;
wire [62:0] so;

  input [63:0] din;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [63:0] dout;
  output scan_out;
assign fdin[63:0] = din[63:0];






dff #(64)  d0_0 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[63:0]),
.si({scan_in,so[62:0]}),
.so({so[62:0],scan_out}),
.q(dout[63:0])
);












endmodule













// any PARAMS parms go into naming of macro

module ncu_ssisif_ctl_msff_ctl_macro__width_3 (
  din, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [2:0] fdin;
wire [1:0] so;

  input [2:0] din;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [2:0] dout;
  output scan_out;
assign fdin[2:0] = din[2:0];






dff #(3)  d0_0 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[2:0]),
.si({scan_in,so[1:0]}),
.so({so[1:0],scan_out}),
.q(dout[2:0])
);












endmodule













// any PARAMS parms go into naming of macro

module ncu_ssisif_ctl_msff_ctl_macro__width_1 (
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

module ncu_ssisif_ctl_msff_ctl_macro__width_7 (
  din, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [6:0] fdin;
wire [5:0] so;

  input [6:0] din;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [6:0] dout;
  output scan_out;
assign fdin[6:0] = din[6:0];






dff #(7)  d0_0 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[6:0]),
.si({scan_in,so[5:0]}),
.so({so[5:0],scan_out}),
.q(dout[6:0])
);












endmodule













// any PARAMS parms go into naming of macro

module ncu_ssisif_ctl_msff_ctl_macro__width_18 (
  din, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [17:0] fdin;
wire [16:0] so;

  input [17:0] din;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [17:0] dout;
  output scan_out;
assign fdin[17:0] = din[17:0];






dff #(18)  d0_0 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[17:0]),
.si({scan_in,so[16:0]}),
.so({so[16:0],scan_out}),
.q(dout[17:0])
);












endmodule









//  Description:        Spare gate macro for control blocks
//
//  Param num controls the number of times the macro is added
//  flops=0 can be used to use only combination spare logic


module ncu_ssisif_ctl_spare_ctl_macro__num_11 (
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  scan_out);
wire si_0;
wire so_0;
wire spare0_flop_unused;
wire spare0_buf_32x_unused;
wire spare0_nand3_8x_unused;
wire spare0_inv_8x_unused;
wire spare0_aoi22_4x_unused;
wire spare0_buf_8x_unused;
wire spare0_oai22_4x_unused;
wire spare0_inv_16x_unused;
wire spare0_nand2_16x_unused;
wire spare0_nor3_4x_unused;
wire spare0_nand2_8x_unused;
wire spare0_buf_16x_unused;
wire spare0_nor2_16x_unused;
wire spare0_inv_32x_unused;
wire si_1;
wire so_1;
wire spare1_flop_unused;
wire spare1_buf_32x_unused;
wire spare1_nand3_8x_unused;
wire spare1_inv_8x_unused;
wire spare1_aoi22_4x_unused;
wire spare1_buf_8x_unused;
wire spare1_oai22_4x_unused;
wire spare1_inv_16x_unused;
wire spare1_nand2_16x_unused;
wire spare1_nor3_4x_unused;
wire spare1_nand2_8x_unused;
wire spare1_buf_16x_unused;
wire spare1_nor2_16x_unused;
wire spare1_inv_32x_unused;
wire si_2;
wire so_2;
wire spare2_flop_unused;
wire spare2_buf_32x_unused;
wire spare2_nand3_8x_unused;
wire spare2_inv_8x_unused;
wire spare2_aoi22_4x_unused;
wire spare2_buf_8x_unused;
wire spare2_oai22_4x_unused;
wire spare2_inv_16x_unused;
wire spare2_nand2_16x_unused;
wire spare2_nor3_4x_unused;
wire spare2_nand2_8x_unused;
wire spare2_buf_16x_unused;
wire spare2_nor2_16x_unused;
wire spare2_inv_32x_unused;
wire si_3;
wire so_3;
wire spare3_flop_unused;
wire spare3_buf_32x_unused;
wire spare3_nand3_8x_unused;
wire spare3_inv_8x_unused;
wire spare3_aoi22_4x_unused;
wire spare3_buf_8x_unused;
wire spare3_oai22_4x_unused;
wire spare3_inv_16x_unused;
wire spare3_nand2_16x_unused;
wire spare3_nor3_4x_unused;
wire spare3_nand2_8x_unused;
wire spare3_buf_16x_unused;
wire spare3_nor2_16x_unused;
wire spare3_inv_32x_unused;
wire si_4;
wire so_4;
wire spare4_flop_unused;
wire spare4_buf_32x_unused;
wire spare4_nand3_8x_unused;
wire spare4_inv_8x_unused;
wire spare4_aoi22_4x_unused;
wire spare4_buf_8x_unused;
wire spare4_oai22_4x_unused;
wire spare4_inv_16x_unused;
wire spare4_nand2_16x_unused;
wire spare4_nor3_4x_unused;
wire spare4_nand2_8x_unused;
wire spare4_buf_16x_unused;
wire spare4_nor2_16x_unused;
wire spare4_inv_32x_unused;
wire si_5;
wire so_5;
wire spare5_flop_unused;
wire spare5_buf_32x_unused;
wire spare5_nand3_8x_unused;
wire spare5_inv_8x_unused;
wire spare5_aoi22_4x_unused;
wire spare5_buf_8x_unused;
wire spare5_oai22_4x_unused;
wire spare5_inv_16x_unused;
wire spare5_nand2_16x_unused;
wire spare5_nor3_4x_unused;
wire spare5_nand2_8x_unused;
wire spare5_buf_16x_unused;
wire spare5_nor2_16x_unused;
wire spare5_inv_32x_unused;
wire si_6;
wire so_6;
wire spare6_flop_unused;
wire spare6_buf_32x_unused;
wire spare6_nand3_8x_unused;
wire spare6_inv_8x_unused;
wire spare6_aoi22_4x_unused;
wire spare6_buf_8x_unused;
wire spare6_oai22_4x_unused;
wire spare6_inv_16x_unused;
wire spare6_nand2_16x_unused;
wire spare6_nor3_4x_unused;
wire spare6_nand2_8x_unused;
wire spare6_buf_16x_unused;
wire spare6_nor2_16x_unused;
wire spare6_inv_32x_unused;
wire si_7;
wire so_7;
wire spare7_flop_unused;
wire spare7_buf_32x_unused;
wire spare7_nand3_8x_unused;
wire spare7_inv_8x_unused;
wire spare7_aoi22_4x_unused;
wire spare7_buf_8x_unused;
wire spare7_oai22_4x_unused;
wire spare7_inv_16x_unused;
wire spare7_nand2_16x_unused;
wire spare7_nor3_4x_unused;
wire spare7_nand2_8x_unused;
wire spare7_buf_16x_unused;
wire spare7_nor2_16x_unused;
wire spare7_inv_32x_unused;
wire si_8;
wire so_8;
wire spare8_flop_unused;
wire spare8_buf_32x_unused;
wire spare8_nand3_8x_unused;
wire spare8_inv_8x_unused;
wire spare8_aoi22_4x_unused;
wire spare8_buf_8x_unused;
wire spare8_oai22_4x_unused;
wire spare8_inv_16x_unused;
wire spare8_nand2_16x_unused;
wire spare8_nor3_4x_unused;
wire spare8_nand2_8x_unused;
wire spare8_buf_16x_unused;
wire spare8_nor2_16x_unused;
wire spare8_inv_32x_unused;
wire si_9;
wire so_9;
wire spare9_flop_unused;
wire spare9_buf_32x_unused;
wire spare9_nand3_8x_unused;
wire spare9_inv_8x_unused;
wire spare9_aoi22_4x_unused;
wire spare9_buf_8x_unused;
wire spare9_oai22_4x_unused;
wire spare9_inv_16x_unused;
wire spare9_nand2_16x_unused;
wire spare9_nor3_4x_unused;
wire spare9_nand2_8x_unused;
wire spare9_buf_16x_unused;
wire spare9_nor2_16x_unused;
wire spare9_inv_32x_unused;
wire si_10;
wire so_10;
wire spare10_flop_unused;
wire spare10_buf_32x_unused;
wire spare10_nand3_8x_unused;
wire spare10_inv_8x_unused;
wire spare10_aoi22_4x_unused;
wire spare10_buf_8x_unused;
wire spare10_oai22_4x_unused;
wire spare10_inv_16x_unused;
wire spare10_nand2_16x_unused;
wire spare10_nor3_4x_unused;
wire spare10_nand2_8x_unused;
wire spare10_buf_16x_unused;
wire spare10_nor2_16x_unused;
wire spare10_inv_32x_unused;


input		l1clk;
input		scan_in;
input		siclk;
input		soclk;
output		scan_out;

cl_sc1_msff_8x spare0_flop (.l1clk(l1clk),
                               .siclk(siclk),
                               .soclk(soclk),
                               .si(si_0),
                               .so(so_0),
                               .d(1'b0),
                               .q(spare0_flop_unused));
assign si_0 = scan_in;

cl_u1_buf_32x   spare0_buf_32x (.in(1'b1),
                                   .out(spare0_buf_32x_unused));
cl_u1_nand3_8x spare0_nand3_8x (.in0(1'b1),
                                   .in1(1'b1),
                                   .in2(1'b1),
                                   .out(spare0_nand3_8x_unused));
cl_u1_inv_8x    spare0_inv_8x (.in(1'b1),
                                  .out(spare0_inv_8x_unused));
cl_u1_aoi22_4x spare0_aoi22_4x (.in00(1'b1),
                                   .in01(1'b1),
                                   .in10(1'b1),
                                   .in11(1'b1),
                                   .out(spare0_aoi22_4x_unused));
cl_u1_buf_8x    spare0_buf_8x (.in(1'b1),
                                  .out(spare0_buf_8x_unused));
cl_u1_oai22_4x spare0_oai22_4x (.in00(1'b1),
                                   .in01(1'b1),
                                   .in10(1'b1),
                                   .in11(1'b1),
                                   .out(spare0_oai22_4x_unused));
cl_u1_inv_16x   spare0_inv_16x (.in(1'b1),
                                   .out(spare0_inv_16x_unused));
cl_u1_nand2_16x spare0_nand2_16x (.in0(1'b1),
                                     .in1(1'b1),
                                     .out(spare0_nand2_16x_unused));
cl_u1_nor3_4x spare0_nor3_4x (.in0(1'b0),
                                 .in1(1'b0),
                                 .in2(1'b0),
                                 .out(spare0_nor3_4x_unused));
cl_u1_nand2_8x spare0_nand2_8x (.in0(1'b1),
                                   .in1(1'b1),
                                   .out(spare0_nand2_8x_unused));
cl_u1_buf_16x   spare0_buf_16x (.in(1'b1),
                                   .out(spare0_buf_16x_unused));
cl_u1_nor2_16x spare0_nor2_16x (.in0(1'b0),
                                   .in1(1'b0),
                                   .out(spare0_nor2_16x_unused));
cl_u1_inv_32x   spare0_inv_32x (.in(1'b1),
                                   .out(spare0_inv_32x_unused));

cl_sc1_msff_8x spare1_flop (.l1clk(l1clk),
                               .siclk(siclk),
                               .soclk(soclk),
                               .si(si_1),
                               .so(so_1),
                               .d(1'b0),
                               .q(spare1_flop_unused));
assign si_1 = so_0;

cl_u1_buf_32x   spare1_buf_32x (.in(1'b1),
                                   .out(spare1_buf_32x_unused));
cl_u1_nand3_8x spare1_nand3_8x (.in0(1'b1),
                                   .in1(1'b1),
                                   .in2(1'b1),
                                   .out(spare1_nand3_8x_unused));
cl_u1_inv_8x    spare1_inv_8x (.in(1'b1),
                                  .out(spare1_inv_8x_unused));
cl_u1_aoi22_4x spare1_aoi22_4x (.in00(1'b1),
                                   .in01(1'b1),
                                   .in10(1'b1),
                                   .in11(1'b1),
                                   .out(spare1_aoi22_4x_unused));
cl_u1_buf_8x    spare1_buf_8x (.in(1'b1),
                                  .out(spare1_buf_8x_unused));
cl_u1_oai22_4x spare1_oai22_4x (.in00(1'b1),
                                   .in01(1'b1),
                                   .in10(1'b1),
                                   .in11(1'b1),
                                   .out(spare1_oai22_4x_unused));
cl_u1_inv_16x   spare1_inv_16x (.in(1'b1),
                                   .out(spare1_inv_16x_unused));
cl_u1_nand2_16x spare1_nand2_16x (.in0(1'b1),
                                     .in1(1'b1),
                                     .out(spare1_nand2_16x_unused));
cl_u1_nor3_4x spare1_nor3_4x (.in0(1'b0),
                                 .in1(1'b0),
                                 .in2(1'b0),
                                 .out(spare1_nor3_4x_unused));
cl_u1_nand2_8x spare1_nand2_8x (.in0(1'b1),
                                   .in1(1'b1),
                                   .out(spare1_nand2_8x_unused));
cl_u1_buf_16x   spare1_buf_16x (.in(1'b1),
                                   .out(spare1_buf_16x_unused));
cl_u1_nor2_16x spare1_nor2_16x (.in0(1'b0),
                                   .in1(1'b0),
                                   .out(spare1_nor2_16x_unused));
cl_u1_inv_32x   spare1_inv_32x (.in(1'b1),
                                   .out(spare1_inv_32x_unused));

cl_sc1_msff_8x spare2_flop (.l1clk(l1clk),
                               .siclk(siclk),
                               .soclk(soclk),
                               .si(si_2),
                               .so(so_2),
                               .d(1'b0),
                               .q(spare2_flop_unused));
assign si_2 = so_1;

cl_u1_buf_32x   spare2_buf_32x (.in(1'b1),
                                   .out(spare2_buf_32x_unused));
cl_u1_nand3_8x spare2_nand3_8x (.in0(1'b1),
                                   .in1(1'b1),
                                   .in2(1'b1),
                                   .out(spare2_nand3_8x_unused));
cl_u1_inv_8x    spare2_inv_8x (.in(1'b1),
                                  .out(spare2_inv_8x_unused));
cl_u1_aoi22_4x spare2_aoi22_4x (.in00(1'b1),
                                   .in01(1'b1),
                                   .in10(1'b1),
                                   .in11(1'b1),
                                   .out(spare2_aoi22_4x_unused));
cl_u1_buf_8x    spare2_buf_8x (.in(1'b1),
                                  .out(spare2_buf_8x_unused));
cl_u1_oai22_4x spare2_oai22_4x (.in00(1'b1),
                                   .in01(1'b1),
                                   .in10(1'b1),
                                   .in11(1'b1),
                                   .out(spare2_oai22_4x_unused));
cl_u1_inv_16x   spare2_inv_16x (.in(1'b1),
                                   .out(spare2_inv_16x_unused));
cl_u1_nand2_16x spare2_nand2_16x (.in0(1'b1),
                                     .in1(1'b1),
                                     .out(spare2_nand2_16x_unused));
cl_u1_nor3_4x spare2_nor3_4x (.in0(1'b0),
                                 .in1(1'b0),
                                 .in2(1'b0),
                                 .out(spare2_nor3_4x_unused));
cl_u1_nand2_8x spare2_nand2_8x (.in0(1'b1),
                                   .in1(1'b1),
                                   .out(spare2_nand2_8x_unused));
cl_u1_buf_16x   spare2_buf_16x (.in(1'b1),
                                   .out(spare2_buf_16x_unused));
cl_u1_nor2_16x spare2_nor2_16x (.in0(1'b0),
                                   .in1(1'b0),
                                   .out(spare2_nor2_16x_unused));
cl_u1_inv_32x   spare2_inv_32x (.in(1'b1),
                                   .out(spare2_inv_32x_unused));

cl_sc1_msff_8x spare3_flop (.l1clk(l1clk),
                               .siclk(siclk),
                               .soclk(soclk),
                               .si(si_3),
                               .so(so_3),
                               .d(1'b0),
                               .q(spare3_flop_unused));
assign si_3 = so_2;

cl_u1_buf_32x   spare3_buf_32x (.in(1'b1),
                                   .out(spare3_buf_32x_unused));
cl_u1_nand3_8x spare3_nand3_8x (.in0(1'b1),
                                   .in1(1'b1),
                                   .in2(1'b1),
                                   .out(spare3_nand3_8x_unused));
cl_u1_inv_8x    spare3_inv_8x (.in(1'b1),
                                  .out(spare3_inv_8x_unused));
cl_u1_aoi22_4x spare3_aoi22_4x (.in00(1'b1),
                                   .in01(1'b1),
                                   .in10(1'b1),
                                   .in11(1'b1),
                                   .out(spare3_aoi22_4x_unused));
cl_u1_buf_8x    spare3_buf_8x (.in(1'b1),
                                  .out(spare3_buf_8x_unused));
cl_u1_oai22_4x spare3_oai22_4x (.in00(1'b1),
                                   .in01(1'b1),
                                   .in10(1'b1),
                                   .in11(1'b1),
                                   .out(spare3_oai22_4x_unused));
cl_u1_inv_16x   spare3_inv_16x (.in(1'b1),
                                   .out(spare3_inv_16x_unused));
cl_u1_nand2_16x spare3_nand2_16x (.in0(1'b1),
                                     .in1(1'b1),
                                     .out(spare3_nand2_16x_unused));
cl_u1_nor3_4x spare3_nor3_4x (.in0(1'b0),
                                 .in1(1'b0),
                                 .in2(1'b0),
                                 .out(spare3_nor3_4x_unused));
cl_u1_nand2_8x spare3_nand2_8x (.in0(1'b1),
                                   .in1(1'b1),
                                   .out(spare3_nand2_8x_unused));
cl_u1_buf_16x   spare3_buf_16x (.in(1'b1),
                                   .out(spare3_buf_16x_unused));
cl_u1_nor2_16x spare3_nor2_16x (.in0(1'b0),
                                   .in1(1'b0),
                                   .out(spare3_nor2_16x_unused));
cl_u1_inv_32x   spare3_inv_32x (.in(1'b1),
                                   .out(spare3_inv_32x_unused));

cl_sc1_msff_8x spare4_flop (.l1clk(l1clk),
                               .siclk(siclk),
                               .soclk(soclk),
                               .si(si_4),
                               .so(so_4),
                               .d(1'b0),
                               .q(spare4_flop_unused));
assign si_4 = so_3;

cl_u1_buf_32x   spare4_buf_32x (.in(1'b1),
                                   .out(spare4_buf_32x_unused));
cl_u1_nand3_8x spare4_nand3_8x (.in0(1'b1),
                                   .in1(1'b1),
                                   .in2(1'b1),
                                   .out(spare4_nand3_8x_unused));
cl_u1_inv_8x    spare4_inv_8x (.in(1'b1),
                                  .out(spare4_inv_8x_unused));
cl_u1_aoi22_4x spare4_aoi22_4x (.in00(1'b1),
                                   .in01(1'b1),
                                   .in10(1'b1),
                                   .in11(1'b1),
                                   .out(spare4_aoi22_4x_unused));
cl_u1_buf_8x    spare4_buf_8x (.in(1'b1),
                                  .out(spare4_buf_8x_unused));
cl_u1_oai22_4x spare4_oai22_4x (.in00(1'b1),
                                   .in01(1'b1),
                                   .in10(1'b1),
                                   .in11(1'b1),
                                   .out(spare4_oai22_4x_unused));
cl_u1_inv_16x   spare4_inv_16x (.in(1'b1),
                                   .out(spare4_inv_16x_unused));
cl_u1_nand2_16x spare4_nand2_16x (.in0(1'b1),
                                     .in1(1'b1),
                                     .out(spare4_nand2_16x_unused));
cl_u1_nor3_4x spare4_nor3_4x (.in0(1'b0),
                                 .in1(1'b0),
                                 .in2(1'b0),
                                 .out(spare4_nor3_4x_unused));
cl_u1_nand2_8x spare4_nand2_8x (.in0(1'b1),
                                   .in1(1'b1),
                                   .out(spare4_nand2_8x_unused));
cl_u1_buf_16x   spare4_buf_16x (.in(1'b1),
                                   .out(spare4_buf_16x_unused));
cl_u1_nor2_16x spare4_nor2_16x (.in0(1'b0),
                                   .in1(1'b0),
                                   .out(spare4_nor2_16x_unused));
cl_u1_inv_32x   spare4_inv_32x (.in(1'b1),
                                   .out(spare4_inv_32x_unused));

cl_sc1_msff_8x spare5_flop (.l1clk(l1clk),
                               .siclk(siclk),
                               .soclk(soclk),
                               .si(si_5),
                               .so(so_5),
                               .d(1'b0),
                               .q(spare5_flop_unused));
assign si_5 = so_4;

cl_u1_buf_32x   spare5_buf_32x (.in(1'b1),
                                   .out(spare5_buf_32x_unused));
cl_u1_nand3_8x spare5_nand3_8x (.in0(1'b1),
                                   .in1(1'b1),
                                   .in2(1'b1),
                                   .out(spare5_nand3_8x_unused));
cl_u1_inv_8x    spare5_inv_8x (.in(1'b1),
                                  .out(spare5_inv_8x_unused));
cl_u1_aoi22_4x spare5_aoi22_4x (.in00(1'b1),
                                   .in01(1'b1),
                                   .in10(1'b1),
                                   .in11(1'b1),
                                   .out(spare5_aoi22_4x_unused));
cl_u1_buf_8x    spare5_buf_8x (.in(1'b1),
                                  .out(spare5_buf_8x_unused));
cl_u1_oai22_4x spare5_oai22_4x (.in00(1'b1),
                                   .in01(1'b1),
                                   .in10(1'b1),
                                   .in11(1'b1),
                                   .out(spare5_oai22_4x_unused));
cl_u1_inv_16x   spare5_inv_16x (.in(1'b1),
                                   .out(spare5_inv_16x_unused));
cl_u1_nand2_16x spare5_nand2_16x (.in0(1'b1),
                                     .in1(1'b1),
                                     .out(spare5_nand2_16x_unused));
cl_u1_nor3_4x spare5_nor3_4x (.in0(1'b0),
                                 .in1(1'b0),
                                 .in2(1'b0),
                                 .out(spare5_nor3_4x_unused));
cl_u1_nand2_8x spare5_nand2_8x (.in0(1'b1),
                                   .in1(1'b1),
                                   .out(spare5_nand2_8x_unused));
cl_u1_buf_16x   spare5_buf_16x (.in(1'b1),
                                   .out(spare5_buf_16x_unused));
cl_u1_nor2_16x spare5_nor2_16x (.in0(1'b0),
                                   .in1(1'b0),
                                   .out(spare5_nor2_16x_unused));
cl_u1_inv_32x   spare5_inv_32x (.in(1'b1),
                                   .out(spare5_inv_32x_unused));

cl_sc1_msff_8x spare6_flop (.l1clk(l1clk),
                               .siclk(siclk),
                               .soclk(soclk),
                               .si(si_6),
                               .so(so_6),
                               .d(1'b0),
                               .q(spare6_flop_unused));
assign si_6 = so_5;

cl_u1_buf_32x   spare6_buf_32x (.in(1'b1),
                                   .out(spare6_buf_32x_unused));
cl_u1_nand3_8x spare6_nand3_8x (.in0(1'b1),
                                   .in1(1'b1),
                                   .in2(1'b1),
                                   .out(spare6_nand3_8x_unused));
cl_u1_inv_8x    spare6_inv_8x (.in(1'b1),
                                  .out(spare6_inv_8x_unused));
cl_u1_aoi22_4x spare6_aoi22_4x (.in00(1'b1),
                                   .in01(1'b1),
                                   .in10(1'b1),
                                   .in11(1'b1),
                                   .out(spare6_aoi22_4x_unused));
cl_u1_buf_8x    spare6_buf_8x (.in(1'b1),
                                  .out(spare6_buf_8x_unused));
cl_u1_oai22_4x spare6_oai22_4x (.in00(1'b1),
                                   .in01(1'b1),
                                   .in10(1'b1),
                                   .in11(1'b1),
                                   .out(spare6_oai22_4x_unused));
cl_u1_inv_16x   spare6_inv_16x (.in(1'b1),
                                   .out(spare6_inv_16x_unused));
cl_u1_nand2_16x spare6_nand2_16x (.in0(1'b1),
                                     .in1(1'b1),
                                     .out(spare6_nand2_16x_unused));
cl_u1_nor3_4x spare6_nor3_4x (.in0(1'b0),
                                 .in1(1'b0),
                                 .in2(1'b0),
                                 .out(spare6_nor3_4x_unused));
cl_u1_nand2_8x spare6_nand2_8x (.in0(1'b1),
                                   .in1(1'b1),
                                   .out(spare6_nand2_8x_unused));
cl_u1_buf_16x   spare6_buf_16x (.in(1'b1),
                                   .out(spare6_buf_16x_unused));
cl_u1_nor2_16x spare6_nor2_16x (.in0(1'b0),
                                   .in1(1'b0),
                                   .out(spare6_nor2_16x_unused));
cl_u1_inv_32x   spare6_inv_32x (.in(1'b1),
                                   .out(spare6_inv_32x_unused));

cl_sc1_msff_8x spare7_flop (.l1clk(l1clk),
                               .siclk(siclk),
                               .soclk(soclk),
                               .si(si_7),
                               .so(so_7),
                               .d(1'b0),
                               .q(spare7_flop_unused));
assign si_7 = so_6;

cl_u1_buf_32x   spare7_buf_32x (.in(1'b1),
                                   .out(spare7_buf_32x_unused));
cl_u1_nand3_8x spare7_nand3_8x (.in0(1'b1),
                                   .in1(1'b1),
                                   .in2(1'b1),
                                   .out(spare7_nand3_8x_unused));
cl_u1_inv_8x    spare7_inv_8x (.in(1'b1),
                                  .out(spare7_inv_8x_unused));
cl_u1_aoi22_4x spare7_aoi22_4x (.in00(1'b1),
                                   .in01(1'b1),
                                   .in10(1'b1),
                                   .in11(1'b1),
                                   .out(spare7_aoi22_4x_unused));
cl_u1_buf_8x    spare7_buf_8x (.in(1'b1),
                                  .out(spare7_buf_8x_unused));
cl_u1_oai22_4x spare7_oai22_4x (.in00(1'b1),
                                   .in01(1'b1),
                                   .in10(1'b1),
                                   .in11(1'b1),
                                   .out(spare7_oai22_4x_unused));
cl_u1_inv_16x   spare7_inv_16x (.in(1'b1),
                                   .out(spare7_inv_16x_unused));
cl_u1_nand2_16x spare7_nand2_16x (.in0(1'b1),
                                     .in1(1'b1),
                                     .out(spare7_nand2_16x_unused));
cl_u1_nor3_4x spare7_nor3_4x (.in0(1'b0),
                                 .in1(1'b0),
                                 .in2(1'b0),
                                 .out(spare7_nor3_4x_unused));
cl_u1_nand2_8x spare7_nand2_8x (.in0(1'b1),
                                   .in1(1'b1),
                                   .out(spare7_nand2_8x_unused));
cl_u1_buf_16x   spare7_buf_16x (.in(1'b1),
                                   .out(spare7_buf_16x_unused));
cl_u1_nor2_16x spare7_nor2_16x (.in0(1'b0),
                                   .in1(1'b0),
                                   .out(spare7_nor2_16x_unused));
cl_u1_inv_32x   spare7_inv_32x (.in(1'b1),
                                   .out(spare7_inv_32x_unused));

cl_sc1_msff_8x spare8_flop (.l1clk(l1clk),
                               .siclk(siclk),
                               .soclk(soclk),
                               .si(si_8),
                               .so(so_8),
                               .d(1'b0),
                               .q(spare8_flop_unused));
assign si_8 = so_7;

cl_u1_buf_32x   spare8_buf_32x (.in(1'b1),
                                   .out(spare8_buf_32x_unused));
cl_u1_nand3_8x spare8_nand3_8x (.in0(1'b1),
                                   .in1(1'b1),
                                   .in2(1'b1),
                                   .out(spare8_nand3_8x_unused));
cl_u1_inv_8x    spare8_inv_8x (.in(1'b1),
                                  .out(spare8_inv_8x_unused));
cl_u1_aoi22_4x spare8_aoi22_4x (.in00(1'b1),
                                   .in01(1'b1),
                                   .in10(1'b1),
                                   .in11(1'b1),
                                   .out(spare8_aoi22_4x_unused));
cl_u1_buf_8x    spare8_buf_8x (.in(1'b1),
                                  .out(spare8_buf_8x_unused));
cl_u1_oai22_4x spare8_oai22_4x (.in00(1'b1),
                                   .in01(1'b1),
                                   .in10(1'b1),
                                   .in11(1'b1),
                                   .out(spare8_oai22_4x_unused));
cl_u1_inv_16x   spare8_inv_16x (.in(1'b1),
                                   .out(spare8_inv_16x_unused));
cl_u1_nand2_16x spare8_nand2_16x (.in0(1'b1),
                                     .in1(1'b1),
                                     .out(spare8_nand2_16x_unused));
cl_u1_nor3_4x spare8_nor3_4x (.in0(1'b0),
                                 .in1(1'b0),
                                 .in2(1'b0),
                                 .out(spare8_nor3_4x_unused));
cl_u1_nand2_8x spare8_nand2_8x (.in0(1'b1),
                                   .in1(1'b1),
                                   .out(spare8_nand2_8x_unused));
cl_u1_buf_16x   spare8_buf_16x (.in(1'b1),
                                   .out(spare8_buf_16x_unused));
cl_u1_nor2_16x spare8_nor2_16x (.in0(1'b0),
                                   .in1(1'b0),
                                   .out(spare8_nor2_16x_unused));
cl_u1_inv_32x   spare8_inv_32x (.in(1'b1),
                                   .out(spare8_inv_32x_unused));

cl_sc1_msff_8x spare9_flop (.l1clk(l1clk),
                               .siclk(siclk),
                               .soclk(soclk),
                               .si(si_9),
                               .so(so_9),
                               .d(1'b0),
                               .q(spare9_flop_unused));
assign si_9 = so_8;

cl_u1_buf_32x   spare9_buf_32x (.in(1'b1),
                                   .out(spare9_buf_32x_unused));
cl_u1_nand3_8x spare9_nand3_8x (.in0(1'b1),
                                   .in1(1'b1),
                                   .in2(1'b1),
                                   .out(spare9_nand3_8x_unused));
cl_u1_inv_8x    spare9_inv_8x (.in(1'b1),
                                  .out(spare9_inv_8x_unused));
cl_u1_aoi22_4x spare9_aoi22_4x (.in00(1'b1),
                                   .in01(1'b1),
                                   .in10(1'b1),
                                   .in11(1'b1),
                                   .out(spare9_aoi22_4x_unused));
cl_u1_buf_8x    spare9_buf_8x (.in(1'b1),
                                  .out(spare9_buf_8x_unused));
cl_u1_oai22_4x spare9_oai22_4x (.in00(1'b1),
                                   .in01(1'b1),
                                   .in10(1'b1),
                                   .in11(1'b1),
                                   .out(spare9_oai22_4x_unused));
cl_u1_inv_16x   spare9_inv_16x (.in(1'b1),
                                   .out(spare9_inv_16x_unused));
cl_u1_nand2_16x spare9_nand2_16x (.in0(1'b1),
                                     .in1(1'b1),
                                     .out(spare9_nand2_16x_unused));
cl_u1_nor3_4x spare9_nor3_4x (.in0(1'b0),
                                 .in1(1'b0),
                                 .in2(1'b0),
                                 .out(spare9_nor3_4x_unused));
cl_u1_nand2_8x spare9_nand2_8x (.in0(1'b1),
                                   .in1(1'b1),
                                   .out(spare9_nand2_8x_unused));
cl_u1_buf_16x   spare9_buf_16x (.in(1'b1),
                                   .out(spare9_buf_16x_unused));
cl_u1_nor2_16x spare9_nor2_16x (.in0(1'b0),
                                   .in1(1'b0),
                                   .out(spare9_nor2_16x_unused));
cl_u1_inv_32x   spare9_inv_32x (.in(1'b1),
                                   .out(spare9_inv_32x_unused));

cl_sc1_msff_8x spare10_flop (.l1clk(l1clk),
                               .siclk(siclk),
                               .soclk(soclk),
                               .si(si_10),
                               .so(so_10),
                               .d(1'b0),
                               .q(spare10_flop_unused));
assign si_10 = so_9;

cl_u1_buf_32x   spare10_buf_32x (.in(1'b1),
                                   .out(spare10_buf_32x_unused));
cl_u1_nand3_8x spare10_nand3_8x (.in0(1'b1),
                                   .in1(1'b1),
                                   .in2(1'b1),
                                   .out(spare10_nand3_8x_unused));
cl_u1_inv_8x    spare10_inv_8x (.in(1'b1),
                                  .out(spare10_inv_8x_unused));
cl_u1_aoi22_4x spare10_aoi22_4x (.in00(1'b1),
                                   .in01(1'b1),
                                   .in10(1'b1),
                                   .in11(1'b1),
                                   .out(spare10_aoi22_4x_unused));
cl_u1_buf_8x    spare10_buf_8x (.in(1'b1),
                                  .out(spare10_buf_8x_unused));
cl_u1_oai22_4x spare10_oai22_4x (.in00(1'b1),
                                   .in01(1'b1),
                                   .in10(1'b1),
                                   .in11(1'b1),
                                   .out(spare10_oai22_4x_unused));
cl_u1_inv_16x   spare10_inv_16x (.in(1'b1),
                                   .out(spare10_inv_16x_unused));
cl_u1_nand2_16x spare10_nand2_16x (.in0(1'b1),
                                     .in1(1'b1),
                                     .out(spare10_nand2_16x_unused));
cl_u1_nor3_4x spare10_nor3_4x (.in0(1'b0),
                                 .in1(1'b0),
                                 .in2(1'b0),
                                 .out(spare10_nor3_4x_unused));
cl_u1_nand2_8x spare10_nand2_8x (.in0(1'b1),
                                   .in1(1'b1),
                                   .out(spare10_nand2_8x_unused));
cl_u1_buf_16x   spare10_buf_16x (.in(1'b1),
                                   .out(spare10_buf_16x_unused));
cl_u1_nor2_16x spare10_nor2_16x (.in0(1'b0),
                                   .in1(1'b0),
                                   .out(spare10_nor2_16x_unused));
cl_u1_inv_32x   spare10_inv_32x (.in(1'b1),
                                   .out(spare10_inv_32x_unused));
assign scan_out = so_10;



endmodule

