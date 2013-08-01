// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: ncu_i2cbufsii_ctl.v
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










module ncu_i2cbufsii_ctl (
  iol2clk, 
  scan_in, 
  scan_out, 
  tcu_pce_ov, 
  tcu_clk_stop, 
  tcu_scan_en, 
  tcu_aclk, 
  tcu_bclk, 
  sii_ncu_data, 
  sii_ncu_dparity, 
  sii_ncu_req, 
  ncu_sii_gnt, 
  sii_ncu_syn_data, 
  sii_ncu_syn_vld, 
  sii_mondo_vld, 
  sii_mondo_data0, 
  sii_mondo_data1, 
  sii_mondo_target, 
  sii_mondo_ctagerr, 
  ncu_dmu_mondo_id, 
  ncu_dmu_mondo_id_par, 
  sii_mondo_rd, 
  sii_cr_id_rtn, 
  sii_cr_id_rtn_vld, 
  req_ack_obj, 
  req_ack_vld, 
  rd_req_ack_dbl_buf, 
  ncuctag_ue, 
  ncuctag_uei, 
  ncuctag_ce, 
  ncuctag_cei, 
  ncusiid_pe, 
  ncusiid_pei, 
  ncudpsyn, 
  siierrsyn, 
  siierrsyn_done) ;
wire [2:0] sii_rcv_cntr_n;
wire cntr_inc;
wire [2:0] sii_rcv_cntr;
wire sii_rcv_cntr_n_0_n;
wire sii_rcv_cntr_0_;
wire sii_rcv_cntr_0_ff_scanin;
wire sii_rcv_cntr_0_ff_scanout;
wire l1clk;
wire sii_rcv_cntr_1_ff_scanin;
wire sii_rcv_cntr_1_ff_scanout;
wire sii_rcv_cntr_n_2_n;
wire sii_rcv_cntr_2_n;
wire sii_rcv_cntr_2_ff_scanin;
wire sii_rcv_cntr_2_ff_scanout;
wire sii_ncu_data_d1_ff_scanin;
wire sii_ncu_data_d1_ff_scanout;
wire [31:0] sii_ncu_data_d1;
wire sii_ncu_dparity_d1_ff_scanin;
wire sii_ncu_dparity_d1_ff_scanout;
wire [1:0] sii_ncu_dparity_d1;
wire sii_ncu_req_d1_ff_scanin;
wire sii_ncu_req_d1_ff_scanout;
wire sii_ncu_req_d1;
wire hdr_ld;
wire hdr_a_ff_scanin;
wire hdr_a_ff_scanout;
wire [31:0] hdr_a;
wire [1:0] hdr_b;
wire hdrctag_ue;
wire hdrctag_ce;
wire [15:0] hdr;
wire [5:0] unused_co;
wire pld_ld;
wire [127:0] pld_n;
wire [127:0] pld;
wire pld_ff_scanin;
wire pld_ff_scanout;
wire dpchk_fail1;
wire dpchk_fail0;
wire dperr_n;
wire dperr;
wire dperr_ff_scanin;
wire dperr_ff_scanout;
wire ncusiid_pe_n;
wire sii_buf_unload;
wire ncusiid_pe_ff_scanin;
wire ncusiid_pe_ff_scanout;
wire ncu_sii_gnt_n;
wire ncu_sii_gnt_shadow;
wire ncu_sii_gnt_shadow_f;
wire mondo_hdr_vld;
wire pio_hdr_vld;
wire piortn_dblbuf_full;
wire rdy0_ff_scanin;
wire rdy0_ff_scanout;
wire rdy0;
wire rdy1_ff_scanin;
wire rdy1_ff_scanout;
wire rdy1;
wire ncu_sii_gnt_ff_scanin;
wire ncu_sii_gnt_ff_scanout;
wire ncu_sii_gnt_shadow_ff_scanin;
wire ncu_sii_gnt_shadow_ff_scanout;
wire ncu_sii_gnt_shadow_f_ff_scanin;
wire ncu_sii_gnt_shadow_f_ff_scanout;
wire cntr_inc_ff_scanin;
wire cntr_inc_ff_scanout;
wire hdrvld_n;
wire hdrvld;
wire hdrvld_ff_scanin;
wire hdrvld_ff_scanout;
wire [3:0] pldvld_n;
wire [3:0] pldvld;
wire pldvld_ff_scanin;
wire pldvld_ff_scanout;
wire wr_piortn_dblbuf;
wire wr_mondo_buf;
wire drop_pkt;
wire sii_cr_id_rtn_vld_n;
wire sii_cr_id_rtn_ff_scanin;
wire sii_cr_id_rtn_ff_scanout;
wire sii_cr_id_rtn_vld_ff_scanin;
wire sii_cr_id_rtn_vld_ff_scanout;
wire ncuctag_ue_n;
wire ncuctag_ce_n;
wire ncuctag_ue_ff_scanin;
wire ncuctag_ue_ff_scanout;
wire ncuctag_ce_ff_scanin;
wire ncuctag_ce_ff_scanout;
wire ncudpsyn_ff_scanin;
wire ncudpsyn_ff_scanout;
wire [3:0] piortn_ptyp;
wire [139:0] indata_buf;
wire [5:0] ncu_dmu_mondo_id_n;
wire sii_mondo_ctagerr_n;
wire sii_mondo_ctagerr_ff_scanin;
wire sii_mondo_ctagerr_ff_scanout;
wire ncu_dmu_mondo_idpre_ff_scanin;
wire ncu_dmu_mondo_idpre_ff_scanout;
wire [5:0] ncu_dmu_mondo_idpre;
wire ncu_dmu_mondo_id_par_n;
wire ncu_dmu_mondo_id_par_ff_scanin;
wire ncu_dmu_mondo_id_par_ff_scanout;
wire ncu_dmu_mondo_id_ff_scanin;
wire ncu_dmu_mondo_id_ff_scanout;
wire sii_mondo_target_ff_scanin;
wire sii_mondo_target_ff_scanout;
wire sii_mondo_data0_ff_scanin;
wire sii_mondo_data0_ff_scanout;
wire sii_mondo_data1_ff_scanin;
wire sii_mondo_data1_ff_scanout;
wire sii_mondo_vld_n;
wire sii_mondo_vld_ff_scanin;
wire sii_mondo_vld_ff_scanout;
wire wr_buf0;
wire buf1_vld;
wire buf0_vld;
wire buf1_older;
wire wr_buf1;
wire rd_buf0;
wire rd_buf1;
wire rd_buf;
wire buf1_older_n;
wire buf1_older_ff_scanin;
wire buf1_older_ff_scanout;
wire en_vld0;
wire en_vld1;
wire buf0_vld_ff_scanin;
wire buf0_vld_ff_scanout;
wire buf1_vld_ff_scanin;
wire buf1_vld_ff_scanout;
wire buf0_obj_ff_scanin;
wire buf0_obj_ff_scanout;
wire [139:0] buf0_obj;
wire buf1_obj_ff_scanin;
wire buf1_obj_ff_scanout;
wire [139:0] buf1_obj;
wire sii_ncu_syn_data_d1_ff_scanin;
wire sii_ncu_syn_data_d1_ff_scanout;
wire [3:0] sii_ncu_syn_data_d1;
wire sii_ncu_syn_vld_d1_ff_scanin;
wire sii_ncu_syn_vld_d1_ff_scanout;
wire sii_ncu_syn_vld_d1;
wire [63:0] siierrsyn_n;
wire [3:0] errsyncntr_n;
wire [3:0] errsyncntr;
wire siierrsyn_done_n;
wire siierrsyn_ff_scanin;
wire siierrsyn_ff_scanout;
wire siierrsyn_done_ff_scanin;
wire siierrsyn_done_ff_scanout;
wire errsyncntr_ff_scanin;
wire errsyncntr_ff_scanout;
wire [5:0] unused_i2cbufsii;
wire siclk;
wire soclk;
wire se;
wire pce_ov;
wire stop;



   // Global interface
input 		iol2clk;
input		scan_in;
output		scan_out;
input		tcu_pce_ov;
input		tcu_clk_stop;
input		tcu_scan_en;
input		tcu_aclk;
input		tcu_bclk;

//// sii i/f signal ////
input [31:0]	sii_ncu_data;
input [1:0]	sii_ncu_dparity;
input		sii_ncu_req;
output		ncu_sii_gnt;

input [3:0]	sii_ncu_syn_data;
input		sii_ncu_syn_vld;

output		sii_mondo_vld;
output [63:0]	sii_mondo_data0;
output [63:0]	sii_mondo_data1;
output [5:0]	sii_mondo_target;
output		sii_mondo_ctagerr;
output [5:0]	ncu_dmu_mondo_id;
output		ncu_dmu_mondo_id_par;
input		sii_mondo_rd;

output [3:0]	sii_cr_id_rtn;
output		sii_cr_id_rtn_vld;

// i2c slow control/datapath interface
output [139:0] 		req_ack_obj;
output 		 	req_ack_vld;
input 		        rd_req_ack_dbl_buf;

// error reporting for ncu //
output		ncuctag_ue;
input		ncuctag_uei;
output		ncuctag_ce;
input		ncuctag_cei;
output		ncusiid_pe;
input		ncusiid_pei;
output [15:0]	ncudpsyn;

// error reporting for sii//
output [63:0]	siierrsyn;
output		siierrsyn_done;


/************************************************************
 * Assemble inbound packet
 ************************************************************/
//ucb_bus_in #(UCB_BUS_WIDTH) ucb_bus_in 
//				( .clk(iol2clk),
//				.vld(ucb_iob_vld),
//				.data(ucb_iob_data[UCB_BUS_WIDTH-1:0]),
//				.stall(iob_ucb_stall),
//				.indata_buf_vld(indata_buf_vld),
//				.indata_buf(indata_buf[127:0]),
//				.stall_a1(iob_ucb_stall_a1)); 















assign	sii_rcv_cntr_n[2:0] =  cntr_inc ? 3'd0 :
			      (sii_rcv_cntr[2:0]==3'd5) ? 3'd5 : sii_rcv_cntr[2:0]+3'd1; 

//sii_rcv_cntr[2:0] power up and stops at 5
//0in range -var sii_rcv_cntr -min 0 -max 5
assign	sii_rcv_cntr_n_0_n = ~sii_rcv_cntr_n[0];
assign	sii_rcv_cntr[0] = ~sii_rcv_cntr_0_;
ncu_i2cbufsii_ctl_msff_ctl_macro__width_1 sii_rcv_cntr_0_ff 
				(
				.scan_in(sii_rcv_cntr_0_ff_scanin),
				.scan_out(sii_rcv_cntr_0_ff_scanout),
				.dout		(sii_rcv_cntr_0_),
				.l1clk		(l1clk),
				.din		(sii_rcv_cntr_n_0_n),
  .siclk(siclk),
  .soclk(soclk)
				);

ncu_i2cbufsii_ctl_msff_ctl_macro__width_1 sii_rcv_cntr_1_ff 
				(
				.scan_in(sii_rcv_cntr_1_ff_scanin),
				.scan_out(sii_rcv_cntr_1_ff_scanout),
				.dout		(sii_rcv_cntr[1]),
				.l1clk		(l1clk),
				.din		(sii_rcv_cntr_n[1]),
  .siclk(siclk),
  .soclk(soclk)
				);

assign	sii_rcv_cntr_n_2_n = ~sii_rcv_cntr_n[2];
assign	sii_rcv_cntr[2] = ~sii_rcv_cntr_2_n ;
ncu_i2cbufsii_ctl_msff_ctl_macro__width_1 sii_rcv_cntr_2_ff 
				(
				.scan_in(sii_rcv_cntr_2_ff_scanin),
				.scan_out(sii_rcv_cntr_2_ff_scanout),
				.dout		(sii_rcv_cntr_2_n),
				.l1clk		(l1clk),
				.din		(sii_rcv_cntr_n_2_n),
  .siclk(siclk),
  .soclk(soclk)
				);

ncu_i2cbufsii_ctl_msff_ctl_macro__width_32 sii_ncu_data_d1_ff 
				(
				.scan_in(sii_ncu_data_d1_ff_scanin),
				.scan_out(sii_ncu_data_d1_ff_scanout),
				.dout		(sii_ncu_data_d1[31:0]),
				.l1clk		(l1clk),
				.din		(sii_ncu_data[31:0]),
  .siclk(siclk),
  .soclk(soclk)
				);

ncu_i2cbufsii_ctl_msff_ctl_macro__width_2 sii_ncu_dparity_d1_ff 
				(
				.scan_in(sii_ncu_dparity_d1_ff_scanin),
				.scan_out(sii_ncu_dparity_d1_ff_scanout),
				.dout		(sii_ncu_dparity_d1[1:0]),
				.l1clk		(l1clk),
				.din		(sii_ncu_dparity[1:0]),
  .siclk(siclk),
  .soclk(soclk)
				);

ncu_i2cbufsii_ctl_msff_ctl_macro__width_1 sii_ncu_req_d1_ff 
				(
				.scan_in(sii_ncu_req_d1_ff_scanin),
				.scan_out(sii_ncu_req_d1_ff_scanout),
				.dout		(sii_ncu_req_d1),
				.l1clk		(l1clk),
				.din		(sii_ncu_req),
  .siclk(siclk),
  .soclk(soclk)
				);

assign	hdr_ld = (sii_rcv_cntr[2:0]==3'b0) ;
ncu_i2cbufsii_ctl_msff_ctl_macro__en_1__width_32 hdr_a_ff  
				(
				.scan_in(hdr_a_ff_scanin),
				.scan_out(hdr_a_ff_scanout),
				.dout		(hdr_a[31:0]),
				.l1clk		(l1clk),
				.en		(hdr_ld),
				.din		(sii_ncu_data_d1[31:0]),
  .siclk(siclk),
  .soclk(soclk)
				);

assign	hdr_b[1:0] = ncuctag_uei ? {~hdr_a[1],~hdr_a[0]} : 
		     ncuctag_cei ?  {hdr_a[1],~hdr_a[0]} : hdr_a[1:0] ;
			  
ncu_eccchk16_ctl i2cbufsiieccchk16 (.din({hdr_a[15:2],hdr_b[1:0]}),
				    .ci(hdr_a[21:16]),
				    .ue(hdrctag_ue),
				    .ce(hdrctag_ce),
				    .dout(hdr[15:0]),
				    .co(unused_co[5:0]) );

////
assign	pld_ld = (sii_rcv_cntr[2:0]!=3'd5) ;
//assign	pld_n[127:0] = {sii_ncu_data_d1[31:0],pld[127:32]};
assign  pld_n[127:0] = {pld[95:0],sii_ncu_data_d1[31:0]};

ncu_i2cbufsii_ctl_msff_ctl_macro__en_1__width_128 pld_ff  
				(
				.scan_in(pld_ff_scanin),
				.scan_out(pld_ff_scanout),
				.dout		(pld[127:0]),
				.l1clk		(l1clk),
				.en		(pld_ld),
				.din		(pld_n[127:0]),
  .siclk(siclk),
  .soclk(soclk)
				);

//assign	sii_ncu_data_b = ncusiid_pei^sii_ncu_data_a[0] ;
assign	dpchk_fail1 =  ~^{sii_ncu_dparity_d1[1],sii_ncu_data_d1[31], sii_ncu_data_d1[29],
			  sii_ncu_data_d1[27],  sii_ncu_data_d1[25], sii_ncu_data_d1[23],
			  sii_ncu_data_d1[21],  sii_ncu_data_d1[19], sii_ncu_data_d1[17],
			  sii_ncu_data_d1[15],  sii_ncu_data_d1[13], sii_ncu_data_d1[11],
			  sii_ncu_data_d1[9],   sii_ncu_data_d1[7],  sii_ncu_data_d1[5],
			  sii_ncu_data_d1[3],   sii_ncu_data_d1[1]};
assign	dpchk_fail0 =  ~^{sii_ncu_dparity_d1[0],sii_ncu_data_d1[30], sii_ncu_data_d1[28],
		 	  sii_ncu_data_d1[26],  sii_ncu_data_d1[24], sii_ncu_data_d1[22],
			  sii_ncu_data_d1[20],  sii_ncu_data_d1[18], sii_ncu_data_d1[16],
			  sii_ncu_data_d1[14],  sii_ncu_data_d1[12], sii_ncu_data_d1[10],
			  sii_ncu_data_d1[8],   sii_ncu_data_d1[6],  sii_ncu_data_d1[4],
			  sii_ncu_data_d1[2],   sii_ncu_data_d1[0], ncusiid_pei };

//assign	dperr_n = hdr_ld ? 1'b0 : (dpchk_fail0|dpchk_fail1|dperr) ;
assign        dperr_n = hdr_ld ? 1'b0 : pld_ld ? (dpchk_fail0|dpchk_fail1|dperr) : dperr ;
ncu_i2cbufsii_ctl_msff_ctl_macro__width_1 dperr_ff 
				(
				.scan_in(dperr_ff_scanin),
				.scan_out(dperr_ff_scanout),
				.dout		(dperr),
				.l1clk		(l1clk),
				.din		(dperr_n),
  .siclk(siclk),
  .soclk(soclk)
				);

assign	ncusiid_pe_n = dperr&sii_buf_unload&~hdr_a[28] ;
ncu_i2cbufsii_ctl_msff_ctl_macro__width_1 ncusiid_pe_ff 
				(
				.scan_in(ncusiid_pe_ff_scanin),
				.scan_out(ncusiid_pe_ff_scanout),
				.dout		(ncusiid_pe),
				.l1clk		(l1clk),
				.din		(ncusiid_pe_n),
  .siclk(siclk),
  .soclk(soclk)
				);

//ignore req_d1 at cntr = 0 or 1, ignore req at gnt or cyc after gnt.
assign	ncu_sii_gnt_n = ( (sii_rcv_cntr[2:1]==2'b00)|cntr_inc|ncu_sii_gnt_shadow|ncu_sii_gnt_shadow_f) ? 1'b0 :
			         sii_ncu_req_d1 & ~( (mondo_hdr_vld&(sii_mondo_vld&~sii_mondo_rd)) |
				 		  (pio_hdr_vld&(piortn_dblbuf_full&~rd_req_ack_dbl_buf)) ) ;
			
ncu_i2cbufsii_ctl_msff_ctl_macro__width_1 rdy0_ff 
				(
				.scan_in(rdy0_ff_scanin),
				.scan_out(rdy0_ff_scanout),
				.dout		(rdy0),
				.l1clk		(l1clk),
				.din		(1'b1),
  .siclk(siclk),
  .soclk(soclk)
				);
ncu_i2cbufsii_ctl_msff_ctl_macro__width_1 rdy1_ff 
				(
				.scan_in(rdy1_ff_scanin),
				.scan_out(rdy1_ff_scanout),
				.dout		(rdy1),
				.l1clk		(l1clk),
				.din		(rdy0),
  .siclk(siclk),
  .soclk(soclk)
				);

ncu_i2cbufsii_ctl_msff_ctl_macro__en_1__width_1 ncu_sii_gnt_ff  
				(
				.scan_in(ncu_sii_gnt_ff_scanin),
				.scan_out(ncu_sii_gnt_ff_scanout),
				.dout		(ncu_sii_gnt),
				.l1clk		(l1clk),
				.en		(rdy1),
				.din		(ncu_sii_gnt_n),
  .siclk(siclk),
  .soclk(soclk)
				);

ncu_i2cbufsii_ctl_msff_ctl_macro__en_1__width_1 ncu_sii_gnt_shadow_ff  
				(
				.scan_in(ncu_sii_gnt_shadow_ff_scanin),
				.scan_out(ncu_sii_gnt_shadow_ff_scanout),
				.dout		(ncu_sii_gnt_shadow),
				.l1clk		(l1clk),
				.en		(rdy1),
				.din		(ncu_sii_gnt_n),
  .siclk(siclk),
  .soclk(soclk)
				);

ncu_i2cbufsii_ctl_msff_ctl_macro__width_1 ncu_sii_gnt_shadow_f_ff 
				(
				.scan_in(ncu_sii_gnt_shadow_f_ff_scanin),
				.scan_out(ncu_sii_gnt_shadow_f_ff_scanout),
				.dout		(ncu_sii_gnt_shadow_f),
				.l1clk		(l1clk),
				.din		(ncu_sii_gnt_shadow),
  .siclk(siclk),
  .soclk(soclk)
				);

ncu_i2cbufsii_ctl_msff_ctl_macro__width_1 cntr_inc_ff 
				(
				.scan_in(cntr_inc_ff_scanin),
				.scan_out(cntr_inc_ff_scanout),
				.dout		(cntr_inc),
				.l1clk		(l1clk),
				.din		(ncu_sii_gnt_shadow_f),
  .siclk(siclk),
  .soclk(soclk)
				);

assign	hdrvld_n = (sii_rcv_cntr[2:0]==3'b0) ? 1'b1 :
		        sii_buf_unload ? 1'b0 : hdrvld ;
ncu_i2cbufsii_ctl_msff_ctl_macro__width_1 hdrvld_ff 
				(
				.scan_in(hdrvld_ff_scanin),
				.scan_out(hdrvld_ff_scanout),
				.dout		(hdrvld),
				.l1clk		(l1clk),
				.din		(hdrvld_n),
  .siclk(siclk),
  .soclk(soclk)
				);

assign	pldvld_n[3:0] = sii_buf_unload ? 4'b0 :
			(sii_rcv_cntr[2:0]!=3'd5) ? {hdrvld,pldvld[3:1]} : pldvld[3:0] ;
ncu_i2cbufsii_ctl_msff_ctl_macro__width_4 pldvld_ff 
				(
				.scan_in(pldvld_ff_scanin),
				.scan_out(pldvld_ff_scanout),
				.dout		(pldvld[3:0]),
				.l1clk		(l1clk),
				.din		(pldvld_n[3:0]),
  .siclk(siclk),
  .soclk(soclk)
				);

assign	mondo_hdr_vld = hdrvld & ~hdr[15] ;
assign	pio_hdr_vld   = hdrvld &  hdr[15] ;
assign	sii_buf_unload = wr_piortn_dblbuf | wr_mondo_buf | (pldvld[0]&drop_pkt) ;
assign	drop_pkt = (pio_hdr_vld&(hdrctag_ue|hdr_a[28])) | (mondo_hdr_vld&dperr) ;

assign	sii_cr_id_rtn_vld_n = pio_hdr_vld&~pldvld[3]&~hdrctag_ue ;

ncu_i2cbufsii_ctl_msff_ctl_macro__width_4 sii_cr_id_rtn_ff 
				(
				.scan_in(sii_cr_id_rtn_ff_scanin),
				.scan_out(sii_cr_id_rtn_ff_scanout),
				.dout		(sii_cr_id_rtn[3:0]),
				.l1clk		(l1clk),
				.din		(hdr[11:8]),
  .siclk(siclk),
  .soclk(soclk)
				);

ncu_i2cbufsii_ctl_msff_ctl_macro__width_1 sii_cr_id_rtn_vld_ff 
				(
				.scan_in(sii_cr_id_rtn_vld_ff_scanin),
				.scan_out(sii_cr_id_rtn_vld_ff_scanout),
				.dout		(sii_cr_id_rtn_vld),
				.l1clk		(l1clk),
				.din		(sii_cr_id_rtn_vld_n),
  .siclk(siclk),
  .soclk(soclk)
				);

//assign	ncuctag_ue_n = hdrctag_ue&pldvld[3]&~pldvld[2]&~hdr_a[28]; -jimmy 3/30/05
//assign	ncuctag_ce_n = hdrctag_ce&pldvld[3]&~pldvld[2]&~hdr_a[28]; -jimmy 3/30/05
assign	ncuctag_ue_n = hdrctag_ue&sii_buf_unload&~hdr_a[28];
assign	ncuctag_ce_n = hdrctag_ce&sii_buf_unload&~hdr_a[28];
ncu_i2cbufsii_ctl_msff_ctl_macro__width_1 ncuctag_ue_ff 
				(
				.scan_in(ncuctag_ue_ff_scanin),
				.scan_out(ncuctag_ue_ff_scanout),
				.dout		(ncuctag_ue),
				.l1clk		(l1clk),
				.din		(ncuctag_ue_n),
  .siclk(siclk),
  .soclk(soclk)
				);
ncu_i2cbufsii_ctl_msff_ctl_macro__width_1 ncuctag_ce_ff 
				(
				.scan_in(ncuctag_ce_ff_scanin),
				.scan_out(ncuctag_ce_ff_scanout),
				.dout		(ncuctag_ce),
				.l1clk		(l1clk),
				.din		(ncuctag_ce_n),
  .siclk(siclk),
  .soclk(soclk)
				);
ncu_i2cbufsii_ctl_msff_ctl_macro__en_1__width_16 ncudpsyn_ff  
				(
				.scan_in(ncudpsyn_ff_scanin),
				.scan_out(ncudpsyn_ff_scanout),
				.dout		(ncudpsyn[15:0]),
				.l1clk		(l1clk),
				//.en		(pldvld[0]), -jimmy 3/30/05
				.en		(sii_buf_unload),
				.din		(hdr[15:0]),
  .siclk(siclk),
  .soclk(soclk)
				);

//pktvld = pldvld[0]//
assign	wr_piortn_dblbuf = pldvld[0] & ~drop_pkt & pio_hdr_vld & ~piortn_dblbuf_full ;

//// to, ue, umap , ebit, err of pio return cause UCB NACK ////
assign	piortn_ptyp[3:0]= ((|hdr_a[31:28])|dperr) ? `UCB_READ_NACK : `UCB_READ_ACK ;

//// generating UCB packet here ////
assign	indata_buf[139:0] = { pld[127:0] , //pld
			//9'b0,	  //rsvd
			//40'b0,  //pa (dummy)
			//3'b0,	  //req_sz (dummy)
			//2'b0,   //buf_id (dummy)
			hdr[7:6], //buf_id 
			hdr[5:0], //cpu_thr
			piortn_ptyp[3:0] } ; 

//pktvld = pldvld[0]//
//assign  wr_mondo_buf = (pldvld[3]&mondo_hdr_vld) & 
//                       (~sii_mondo_vld | (sii_mondo_vld&sii_mondo_rd));
assign	wr_mondo_buf = (pldvld[0]&~drop_pkt&mondo_hdr_vld) & (~sii_mondo_vld | (sii_mondo_vld&sii_mondo_rd));
assign	ncu_dmu_mondo_id_n[5:0] = {hdr[14:11],hdr[2:1]};
assign  sii_mondo_ctagerr_n = mondo_hdr_vld&(hdrctag_ue|hdr_a[28]) ;

ncu_i2cbufsii_ctl_msff_ctl_macro__en_1__width_1 sii_mondo_ctagerr_ff  
				(
				.scan_in(sii_mondo_ctagerr_ff_scanin),
				.scan_out(sii_mondo_ctagerr_ff_scanout),
				.dout		(sii_mondo_ctagerr),
				.l1clk		(l1clk),
				.en		(wr_mondo_buf),
				.din		(sii_mondo_ctagerr_n),
  .siclk(siclk),
  .soclk(soclk)
				);

ncu_i2cbufsii_ctl_msff_ctl_macro__en_1__width_6 ncu_dmu_mondo_idpre_ff  
				(
				.scan_in(ncu_dmu_mondo_idpre_ff_scanin),
				.scan_out(ncu_dmu_mondo_idpre_ff_scanout),
				.dout		(ncu_dmu_mondo_idpre[5:0]),
				.l1clk		(l1clk),
				.en		(wr_mondo_buf),
				.din		(ncu_dmu_mondo_id_n[5:0]),
  .siclk(siclk),
  .soclk(soclk)
				);

assign	ncu_dmu_mondo_id_par_n = ~^ncu_dmu_mondo_idpre[5:0] ;
ncu_i2cbufsii_ctl_msff_ctl_macro__width_1 ncu_dmu_mondo_id_par_ff 
				(
				.scan_in(ncu_dmu_mondo_id_par_ff_scanin),
				.scan_out(ncu_dmu_mondo_id_par_ff_scanout),
				.dout		(ncu_dmu_mondo_id_par),
				.l1clk		(l1clk),
				.din		(ncu_dmu_mondo_id_par_n),
  .siclk(siclk),
  .soclk(soclk)
				);

ncu_i2cbufsii_ctl_msff_ctl_macro__width_6 ncu_dmu_mondo_id_ff 
				(
				.scan_in(ncu_dmu_mondo_id_ff_scanin),
				.scan_out(ncu_dmu_mondo_id_ff_scanout),
				.dout		(ncu_dmu_mondo_id[5:0]),
				.l1clk		(l1clk),
				.din		(ncu_dmu_mondo_idpre[5:0]),
  .siclk(siclk),
  .soclk(soclk)
				);

ncu_i2cbufsii_ctl_msff_ctl_macro__en_1__width_6 sii_mondo_target_ff  
				(
				.scan_in(sii_mondo_target_ff_scanin),
				.scan_out(sii_mondo_target_ff_scanout),
				.dout		(sii_mondo_target[5:0]),
				.l1clk		(l1clk),
				.en		(wr_mondo_buf),
				.din		(pld[75:70]),
  .siclk(siclk),
  .soclk(soclk)
				);

ncu_i2cbufsii_ctl_msff_ctl_macro__en_1__width_64 sii_mondo_data0_ff  
				(
				.scan_in(sii_mondo_data0_ff_scanin),
				.scan_out(sii_mondo_data0_ff_scanout),
				.dout		(sii_mondo_data0[63:0]),
				.l1clk		(l1clk),
				.en		(wr_mondo_buf),
				.din		(pld[127:64]),
  .siclk(siclk),
  .soclk(soclk)
				);

ncu_i2cbufsii_ctl_msff_ctl_macro__en_1__width_64 sii_mondo_data1_ff  
				(
				.scan_in(sii_mondo_data1_ff_scanin),
				.scan_out(sii_mondo_data1_ff_scanout),
				.dout		(sii_mondo_data1[63:0]),
				.l1clk		(l1clk),
				.en		(wr_mondo_buf),
				.din		(pld[63:0]),
  .siclk(siclk),
  .soclk(soclk)
				);

assign	sii_mondo_vld_n = wr_mondo_buf | (sii_mondo_vld & ~sii_mondo_rd) ;
ncu_i2cbufsii_ctl_msff_ctl_macro__width_1 sii_mondo_vld_ff 
				(
				.scan_in(sii_mondo_vld_ff_scanin),
				.scan_out(sii_mondo_vld_ff_scanout),
				.dout		(sii_mondo_vld),
				.l1clk		(l1clk),
				.din		(sii_mondo_vld_n),
  .siclk(siclk),
  .soclk(soclk)
				);


//======================================================================
//======================================================================
//================================================== dbl_buf ===========
///////////////////////////////////////////////
// Double buffer to store non-interrupt packets
///////////////////////////////////////////////
//assign	wr_piortn_dblbuf = req_ack_pending & ~piortn_dblbuf_full;
// dbl_buf #(128) req_ack_dbl_buf (
//			 .clk(iol2clk),
//			 .wr(wr_piortn_dblbuf),
//			 .din(indata_buf[127:0]),
//			 .rd(rd_req_ack_dbl_buf),
//			 .dout(req_ack_obj[127:0]),
//			 .vld(req_ack_vld),
//			 .full(piortn_dblbuf_full));

// if both entries are empty, write to entry pointed to by the older pointer
assign	wr_buf0 = wr_piortn_dblbuf & (buf1_vld | (~buf0_vld & ~buf1_older));
assign	wr_buf1 = wr_piortn_dblbuf & (buf0_vld | (~buf1_vld & buf1_older));

// read from the older entry
assign	rd_buf0 = rd_req_ack_dbl_buf & ~buf1_older;
assign	rd_buf1 = rd_req_ack_dbl_buf &  buf1_older;

// flip older pointer when an entry is read
assign	rd_buf = rd_req_ack_dbl_buf & (buf0_vld | buf1_vld);
assign	buf1_older_n = ~buf1_older ;
ncu_i2cbufsii_ctl_msff_ctl_macro__en_1__width_1 buf1_older_ff  
				(
				.scan_in(buf1_older_ff_scanin),
				.scan_out(buf1_older_ff_scanout),
				.dout		(buf1_older),
				.l1clk		(l1clk),
				.en		(rd_buf),
				.din		(buf1_older_n),
  .siclk(siclk),
  .soclk(soclk)
				);

// set valid bit for writes and reset for reads
assign	en_vld0 = wr_buf0 | rd_buf0;
assign	en_vld1 = wr_buf1 | rd_buf1;

// the actual buffers
ncu_i2cbufsii_ctl_msff_ctl_macro__en_1__width_1 buf0_vld_ff  
				(
				.scan_in(buf0_vld_ff_scanin),
				.scan_out(buf0_vld_ff_scanout),
				.dout		(buf0_vld),
				.l1clk		(l1clk),
				.en		(en_vld0),
				.din		(wr_buf0),
  .siclk(siclk),
  .soclk(soclk)
				);

ncu_i2cbufsii_ctl_msff_ctl_macro__en_1__width_1 buf1_vld_ff  
				(
				.scan_in(buf1_vld_ff_scanin),
				.scan_out(buf1_vld_ff_scanout),
				.dout		(buf1_vld),
				.l1clk		(l1clk),
				.en		(en_vld1),
				.din		(wr_buf1),
  .siclk(siclk),
  .soclk(soclk)
				);

ncu_i2cbufsii_ctl_msff_ctl_macro__en_1__width_140 buf0_obj_ff  
				(
				.scan_in(buf0_obj_ff_scanin),
				.scan_out(buf0_obj_ff_scanout),
				.dout		(buf0_obj[139:0]),
				.l1clk		(l1clk),
				.en		(wr_buf0),
				.din		(indata_buf[139:0]),
  .siclk(siclk),
  .soclk(soclk)
				);

ncu_i2cbufsii_ctl_msff_ctl_macro__en_1__width_140 buf1_obj_ff  
				(
				.scan_in(buf1_obj_ff_scanin),
				.scan_out(buf1_obj_ff_scanout),
				.dout		(buf1_obj[139:0]),
				.l1clk		(l1clk),
				.en		(wr_buf1),
				.din		(indata_buf[139:0]),
  .siclk(siclk),
  .soclk(soclk)
				);

// mux out the older entry
assign	req_ack_obj[139:0] = (buf1_older) ? buf1_obj[139:0] : buf0_obj[139:0] ;

assign	req_ack_vld = buf0_vld | buf1_vld;
assign	piortn_dblbuf_full = buf0_vld & buf1_vld;
//================================================== dbl_buf ===========
//======================================================================
//======================================================================



ncu_i2cbufsii_ctl_msff_ctl_macro__width_4 sii_ncu_syn_data_d1_ff 
				(
				.scan_in(sii_ncu_syn_data_d1_ff_scanin),
				.scan_out(sii_ncu_syn_data_d1_ff_scanout),
				.dout		(sii_ncu_syn_data_d1[3:0]),
				.l1clk		(l1clk),
				.din		(sii_ncu_syn_data[3:0]),
  .siclk(siclk),
  .soclk(soclk)
				);

ncu_i2cbufsii_ctl_msff_ctl_macro__width_1 sii_ncu_syn_vld_d1_ff 
				(
				.scan_in(sii_ncu_syn_vld_d1_ff_scanin),
				.scan_out(sii_ncu_syn_vld_d1_ff_scanout),
				.dout		(sii_ncu_syn_vld_d1),
				.l1clk		(l1clk),
				.din		(sii_ncu_syn_vld),
  .siclk(siclk),
  .soclk(soclk)
				);

assign	siierrsyn_n[63:0] = {sii_ncu_syn_data_d1[3:0],siierrsyn[63:4]};

assign	errsyncntr_n[3:0] = (~sii_ncu_syn_vld_d1) ? 4'd0 : errsyncntr[3:0]+4'd1 ;

assign	siierrsyn_done_n = (errsyncntr[3:0]==4'd15) ;

ncu_i2cbufsii_ctl_msff_ctl_macro__en_1__width_64 siierrsyn_ff  
				(
				.scan_in(siierrsyn_ff_scanin),
				.scan_out(siierrsyn_ff_scanout),
				.dout		(siierrsyn[63:0]),
				.l1clk		(l1clk),
				.en		(sii_ncu_syn_vld_d1),
				.din		(siierrsyn_n[63:0]),
  .siclk(siclk),
  .soclk(soclk)
				);

ncu_i2cbufsii_ctl_msff_ctl_macro__width_1 siierrsyn_done_ff 
				(
				.scan_in(siierrsyn_done_ff_scanin),
				.scan_out(siierrsyn_done_ff_scanout),
				.dout		(siierrsyn_done),
				.l1clk		(l1clk),
				.din		(siierrsyn_done_n),
  .siclk(siclk),
  .soclk(soclk)
				);

ncu_i2cbufsii_ctl_msff_ctl_macro__width_4 errsyncntr_ff 
				(
				.scan_in(errsyncntr_ff_scanin),
				.scan_out(errsyncntr_ff_scanout),
				.dout		(errsyncntr[3:0]),
				.l1clk		(l1clk),
				.din		(errsyncntr_n[3:0]),
  .siclk(siclk),
  .soclk(soclk)
				);



assign	unused_i2cbufsii[5:0] = {hdr_a[27:22]} ;





/**** adding clock header ****/
ncu_i2cbufsii_ctl_l1clkhdr_ctl_macro clkgen (
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
assign sii_rcv_cntr_0_ff_scanin  = scan_in                  ;
assign sii_rcv_cntr_1_ff_scanin  = sii_rcv_cntr_0_ff_scanout;
assign sii_rcv_cntr_2_ff_scanin  = sii_rcv_cntr_1_ff_scanout;
assign sii_ncu_data_d1_ff_scanin = sii_rcv_cntr_2_ff_scanout;
assign sii_ncu_dparity_d1_ff_scanin = sii_ncu_data_d1_ff_scanout;
assign sii_ncu_req_d1_ff_scanin  = sii_ncu_dparity_d1_ff_scanout;
assign hdr_a_ff_scanin           = sii_ncu_req_d1_ff_scanout;
assign pld_ff_scanin             = hdr_a_ff_scanout         ;
assign dperr_ff_scanin           = pld_ff_scanout           ;
assign ncusiid_pe_ff_scanin      = dperr_ff_scanout         ;
assign rdy0_ff_scanin            = ncusiid_pe_ff_scanout    ;
assign rdy1_ff_scanin            = rdy0_ff_scanout          ;
assign ncu_sii_gnt_ff_scanin     = rdy1_ff_scanout          ;
assign ncu_sii_gnt_shadow_ff_scanin = ncu_sii_gnt_ff_scanout   ;
assign ncu_sii_gnt_shadow_f_ff_scanin = ncu_sii_gnt_shadow_ff_scanout;
assign cntr_inc_ff_scanin        = ncu_sii_gnt_shadow_f_ff_scanout;
assign hdrvld_ff_scanin          = cntr_inc_ff_scanout      ;
assign pldvld_ff_scanin          = hdrvld_ff_scanout        ;
assign sii_cr_id_rtn_ff_scanin   = pldvld_ff_scanout        ;
assign sii_cr_id_rtn_vld_ff_scanin = sii_cr_id_rtn_ff_scanout ;
assign ncuctag_ue_ff_scanin      = sii_cr_id_rtn_vld_ff_scanout;
assign ncuctag_ce_ff_scanin      = ncuctag_ue_ff_scanout    ;
assign ncudpsyn_ff_scanin        = ncuctag_ce_ff_scanout    ;
assign ncu_dmu_mondo_idpre_ff_scanin = ncudpsyn_ff_scanout      ;
assign sii_mondo_ctagerr_ff_scanin = ncu_dmu_mondo_idpre_ff_scanout;
assign ncu_dmu_mondo_id_par_ff_scanin = sii_mondo_ctagerr_ff_scanout;
assign ncu_dmu_mondo_id_ff_scanin = ncu_dmu_mondo_id_par_ff_scanout;
assign sii_mondo_target_ff_scanin = ncu_dmu_mondo_id_ff_scanout;
assign sii_mondo_data0_ff_scanin = sii_mondo_target_ff_scanout;
assign sii_mondo_data1_ff_scanin = sii_mondo_data0_ff_scanout;
assign sii_mondo_vld_ff_scanin   = sii_mondo_data1_ff_scanout;
assign buf1_older_ff_scanin      = sii_mondo_vld_ff_scanout ;
assign buf0_vld_ff_scanin        = buf1_older_ff_scanout    ;
assign buf1_vld_ff_scanin        = buf0_vld_ff_scanout      ;
assign buf0_obj_ff_scanin        = buf1_vld_ff_scanout      ;
assign buf1_obj_ff_scanin        = buf0_obj_ff_scanout      ;
assign sii_ncu_syn_data_d1_ff_scanin = buf1_obj_ff_scanout      ;
assign sii_ncu_syn_vld_d1_ff_scanin = sii_ncu_syn_data_d1_ff_scanout;
assign siierrsyn_ff_scanin       = sii_ncu_syn_vld_d1_ff_scanout;
assign siierrsyn_done_ff_scanin  = siierrsyn_ff_scanout     ;
assign errsyncntr_ff_scanin      = siierrsyn_done_ff_scanout;
assign scan_out                  = errsyncntr_ff_scanout    ;
// fixscan end:
endmodule // i2c_buf











// any PARAMS parms go into naming of macro

module ncu_i2cbufsii_ctl_msff_ctl_macro__width_1 (
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

module ncu_i2cbufsii_ctl_msff_ctl_macro__width_32 (
  din, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [31:0] fdin;
wire [30:0] so;

  input [31:0] din;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [31:0] dout;
  output scan_out;
assign fdin[31:0] = din[31:0];






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

module ncu_i2cbufsii_ctl_msff_ctl_macro__width_2 (
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

module ncu_i2cbufsii_ctl_msff_ctl_macro__en_1__width_32 (
  din, 
  en, 
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
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [31:0] dout;
  output scan_out;
assign fdin[31:0] = (din[31:0] & {32{en}}) | (dout[31:0] & ~{32{en}});






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

module ncu_i2cbufsii_ctl_msff_ctl_macro__en_1__width_128 (
  din, 
  en, 
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
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [127:0] dout;
  output scan_out;
assign fdin[127:0] = (din[127:0] & {128{en}}) | (dout[127:0] & ~{128{en}});






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

module ncu_i2cbufsii_ctl_msff_ctl_macro__en_1__width_1 (
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

module ncu_i2cbufsii_ctl_msff_ctl_macro__width_4 (
  din, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [3:0] fdin;
wire [2:0] so;

  input [3:0] din;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [3:0] dout;
  output scan_out;
assign fdin[3:0] = din[3:0];






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

module ncu_i2cbufsii_ctl_msff_ctl_macro__en_1__width_16 (
  din, 
  en, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [15:0] fdin;
wire [14:0] so;

  input [15:0] din;
  input en;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [15:0] dout;
  output scan_out;
assign fdin[15:0] = (din[15:0] & {16{en}}) | (dout[15:0] & ~{16{en}});






dff #(16)  d0_0 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[15:0]),
.si({scan_in,so[14:0]}),
.so({so[14:0],scan_out}),
.q(dout[15:0])
);












endmodule













// any PARAMS parms go into naming of macro

module ncu_i2cbufsii_ctl_msff_ctl_macro__en_1__width_6 (
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

module ncu_i2cbufsii_ctl_msff_ctl_macro__width_6 (
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

module ncu_i2cbufsii_ctl_msff_ctl_macro__en_1__width_64 (
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

module ncu_i2cbufsii_ctl_msff_ctl_macro__en_1__width_140 (
  din, 
  en, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [139:0] fdin;
wire [138:0] so;

  input [139:0] din;
  input en;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [139:0] dout;
  output scan_out;
assign fdin[139:0] = (din[139:0] & {140{en}}) | (dout[139:0] & ~{140{en}});






dff #(140)  d0_0 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[139:0]),
.si({scan_in,so[138:0]}),
.so({so[138:0],scan_out}),
.q(dout[139:0])
);












endmodule













// any PARAMS parms go into naming of macro

module ncu_i2cbufsii_ctl_l1clkhdr_ctl_macro (
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








