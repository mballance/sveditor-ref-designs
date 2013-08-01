// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: ncu_c2ifd_ctl.v
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










module ncu_c2ifd_ctl (
  l2clk, 
  cmp_io_sync_en, 
  io_cmp_sync_en, 
  tcu_scan_en, 
  scan_in, 
  scan_out, 
  tcu_pce_ov, 
  tcu_clk_stop, 
  tcu_aclk, 
  tcu_bclk, 
  pcx_ncu_data_px2, 
  pcx_ncu_vld, 
  pcx_ncu_req, 
  pcx_ncu_addr, 
  pcx_ncu_cputhr, 
  io_mondo_data_wr, 
  mondo_data_bypass_d2, 
  mondo_addr_creg_mdata0_dec_d2, 
  mondo_addr_creg_mdata1_dec_d2, 
  mondo_addr_creg_mbusy_dec_d2, 
  tap_mondo_rd_d2, 
  cpu_mondo_rd_d2, 
  cpu_mondo_addr_invld_d2, 
  io_mondo_data0_din_s, 
  io_mondo_data1_din_s, 
  tap_mondo_din_s, 
  tap_mondo_dout_d2_f, 
  mb0_mondo_wr_en, 
  mb0_wdata, 
  mb0_run, 
  mondotbl_pei, 
  mondotbl_pe_f, 
  mb1_run, 
  mb1_wdata, 
  mb1_cpubuf_wr_en, 
  mb1_addr, 
  intbuf_din, 
  mondo_data0_din, 
  mondo_data0_dout, 
  mondo_data1_din, 
  mondo_data1_dout, 
  mondo_busy_addr_p0, 
  mondo_busy_addr_p1, 
  mondo_busy_wr_p1, 
  mondo_busy_addr_p2, 
  mondo_busy_wr_p2, 
  mondo_busy_vec_f, 
  cpubuf_din) ;
wire pcx_ncu_data_ff_scanin;
wire pcx_ncu_data_ff_scanout;
wire [143:0] pcx_ncu_data;
wire l1clk;
wire pcx_ncu_vld_ff_scanin;
wire pcx_ncu_vld_ff_scanout;
wire [4:0] pcxecc;
wire io_mondo_data0_din_ff_scanin;
wire io_mondo_data0_din_ff_scanout;
wire [63:0] io_mondo_data0_din;
wire io_mondo_data1_din_ff_scanin;
wire io_mondo_data1_din_ff_scanout;
wire [63:0] io_mondo_data1_din;
wire tap_mondo_din_ff_scanin;
wire tap_mondo_din_ff_scanout;
wire [63:0] tap_mondo_din;
wire [71:0] mondo_data0_pre;
wire mondo_data0_din_d1_ff_scanin;
wire mondo_data0_din_d1_ff_scanout;
wire [71:0] mondo_data0_din_d1;
wire mondo_data0_din_d2_ff_scanin;
wire mondo_data0_din_d2_ff_scanout;
wire [71:0] mondo_data0_din_d2;
wire [71:0] mondo_data1_pre;
wire mondo_data1_din_d1_ff_scanin;
wire mondo_data1_din_d1_ff_scanout;
wire [71:0] mondo_data1_din_d1;
wire mondo_data1_din_d2_ff_scanin;
wire mondo_data1_din_d2_ff_scanout;
wire [71:0] mondo_data1_din_d2;
wire mondo_addr_creg_mbusy_dec_d3_ff_scanin;
wire mondo_addr_creg_mbusy_dec_d3_ff_scanout;
wire mondo_addr_creg_mbusy_dec_d3;
wire mondo_busy_din_p1;
wire mondo_busy_din_p2;
wire [71:0] mondo_data0_dout_byp;
wire [71:0] mondo_data1_dout_byp;
wire [71:0] mondo_dout;
wire mondo_busy_dout_d2;
wire mondo_dout_d1_ff_scanin;
wire mondo_dout_d1_ff_scanout;
wire [71:0] mondo_dout_d1;
wire mondotbl_pei_ff_scanin;
wire mondotbl_pei_ff_scanout;
wire mondotbl_pei_f;
wire [7:0] mtbl_pfail;
wire mtbl_perr;
wire cpu_mondo_rd_d3;
wire mtbl_perr_hldr_n;
wire mtbl_perr_hldr;
wire mtbl_perr_hldr_ff_scanin;
wire mtbl_perr_hldr_ff_scanout;
wire mondotbl_pe_f_ff_scanin;
wire mondotbl_pe_f_ff_scanout;
wire cpu_mondo_cpu_id_d1_ff_scanin;
wire cpu_mondo_cpu_id_d1_ff_scanout;
wire [2:0] cpu_mondo_cpu_id_d1;
wire cpu_mondo_cpu_id_d2_ff_scanin;
wire cpu_mondo_cpu_id_d2_ff_scanout;
wire [2:0] cpu_mondo_cpu_id_d2;
wire cpu_mondo_thr_id_d1_ff_scanin;
wire cpu_mondo_thr_id_d1_ff_scanout;
wire [2:0] cpu_mondo_thr_id_d1;
wire cpu_mondo_thr_id_d2_ff_scanin;
wire cpu_mondo_thr_id_d2_ff_scanout;
wire [2:0] cpu_mondo_thr_id_d2;
wire cpu_mondo_bis_d1_ff_scanin;
wire cpu_mondo_bis_d1_ff_scanout;
wire cpu_mondo_bis_d1;
wire cpu_mondo_bis_d2_ff_scanin;
wire cpu_mondo_bis_d2_ff_scanout;
wire cpu_mondo_bis_d2;
wire cpu_mondo_addr10_3_d1_ff_scanin;
wire cpu_mondo_addr10_3_d1_ff_scanout;
wire [7:0] cpu_mondo_addr10_3_d1;
wire cpu_mondo_addr10_3_d2_ff_scanin;
wire cpu_mondo_addr10_3_d2_ff_scanout;
wire [7:0] cpu_mondo_addr10_3_d2;
wire cpu_mondo_size_d1_ff_scanin;
wire cpu_mondo_size_d1_ff_scanout;
wire [7:0] cpu_mondo_size_d1;
wire cpu_mondo_size_d2_ff_scanin;
wire cpu_mondo_size_d2_ff_scanout;
wire [7:0] cpu_mondo_size_d2;
wire pcx_pkt_data_d1_ff_scanin;
wire pcx_pkt_data_d1_ff_scanout;
wire [63:0] pcx_pkt_data_d1;
wire pcx_pkt_data_d2_ff_scanin;
wire pcx_pkt_data_d2_ff_scanout;
wire [63:0] pcx_pkt_data_d2;
wire [7:0] cpu_mondo_cpu_id_dec_d2;
wire [143:0] mondo2cpu_pkt;
wire [4:0] mondofifoecc;
wire mondo2cpu_pkt_ff_scanin;
wire mondo2cpu_pkt_ff_scanout;
wire [121:0] mondo2cpu_pkta;
wire [121:0] mondo2cpu_pkt_n;
wire cpu_mondo_rd_d3_ff_scanin;
wire cpu_mondo_rd_d3_ff_scanout;
wire tap_mondo_dout_d2_ff_scanin;
wire tap_mondo_dout_d2_ff_scanout;
wire [63:0] tap_mondo_dout_d2;
wire tap_mondo_dout_d2_f_ff_scanin;
wire tap_mondo_dout_d2_f_ff_scanout;
wire wr1_a_d1_ff_scanin;
wire wr1_a_d1_ff_scanout;
wire [5:0] wr1_a_d1;
wire wr2_a_d1_ff_scanin;
wire wr2_a_d1_ff_scanout;
wire [5:0] wr2_a_d1;
wire din1_d1_ff_scanin;
wire din1_d1_ff_scanout;
wire din1_d1;
wire din2_d1_ff_scanin;
wire din2_d1_ff_scanout;
wire din2_d1;
wire wen1_d1_ff_scanin;
wire wen1_d1_ff_scanout;
wire wen1_d1;
wire wen2_d1_ff_scanin;
wire wen2_d1_ff_scanout;
wire wen2_d1;
wire [63:0] wr1_a_dec_d1;
wire [63:0] wr2_a_dec_d1;
wire [63:0] wen1_dec_d1;
wire [63:0] wen2_dec_d1;
wire [63:0] vec_n;
wire [63:0] vec;
wire [63:0] vec_n_inv;
wire [63:0] vec_inv;
wire vec_ff_scanin;
wire vec_ff_scanout;
wire mondo_busy_vec_ff_scanin;
wire mondo_busy_vec_ff_scanout;
wire rd_a_d1_ff_scanin;
wire rd_a_d1_ff_scanout;
wire [5:0] rd_a_d1;
wire [63:0] rd_a_dec_d1;
wire mondo_busy_dout_d1;
wire mondo_busy_dout_d2_ff_scanin;
wire mondo_busy_dout_d2_ff_scanout;
wire siclk;
wire soclk;
wire se;
wire pce_ov;
wire stop;


////////////////////////////////////////////////////////////////////////
// Interface signal type declarations
////////////////////////////////////////////////////////////////////////
// Global interface
input		l2clk;
input		cmp_io_sync_en;
input		io_cmp_sync_en;

input		tcu_scan_en;
input		scan_in;
output		scan_out;
input		tcu_pce_ov;
input		tcu_clk_stop;
input		tcu_aclk;
input		tcu_bclk;

// Crossbar interface
input [129:0]	pcx_ncu_data_px2;

// c2i fast control interface
output		pcx_ncu_vld;
output [4:0]	pcx_ncu_req;
output [39:0]	pcx_ncu_addr;
output [5:0]	pcx_ncu_cputhr;

input		io_mondo_data_wr;
input		mondo_data_bypass_d2;
input		mondo_addr_creg_mdata0_dec_d2;
input		mondo_addr_creg_mdata1_dec_d2;
input		mondo_addr_creg_mbusy_dec_d2;
//input		cpu_mondo_rd_d1;
input		tap_mondo_rd_d2;
input		cpu_mondo_rd_d2;
input		cpu_mondo_addr_invld_d2;

// i2c slow datapath interface
input [63:0]	io_mondo_data0_din_s;
input [63:0]	io_mondo_data1_din_s;
//input [5:0]	io_mondo_source_din_s;

// IOB control interface
input [63:0]	tap_mondo_din_s;
output [63:0]	tap_mondo_dout_d2_f;


// mb0 signals //
input		mb0_mondo_wr_en;
//input		mb0_intbuf_wr_en;
//input		mb0_cpubuf_sel;
input [7:0]	mb0_wdata;
input		mb0_run;
input		mondotbl_pei;
output		mondotbl_pe_f;
input		mb1_run;
input [7:0]	mb1_wdata;
input		mb1_cpubuf_wr_en;
input[5:0]	mb1_addr;
// i2c fast datapath interface
output [143:0]	intbuf_din;

// Mondo data table interface
output [71:0]	mondo_data0_din;
input [71:0]	mondo_data0_dout;

output [71:0]	mondo_data1_din;
input [71:0]	mondo_data1_dout;

input [5:0]	mondo_busy_addr_p0;

input [5:0]	mondo_busy_addr_p1;
input		mondo_busy_wr_p1;

input [5:0]	mondo_busy_addr_p2;
input		mondo_busy_wr_p2;

output [63:0]	mondo_busy_vec_f;

// Cpu buffer interface
output [143:0]	cpubuf_din;

// Internal signals















/*****************************************************************
 * Flop data from PCX
 *****************************************************************/ 
ncu_c2ifd_ctl_msff_ctl_macro__width_129 pcx_ncu_data_ff 
				(
				.scan_in(pcx_ncu_data_ff_scanin),
				.scan_out(pcx_ncu_data_ff_scanout),
				.dout		(pcx_ncu_data[128:0]),
				.l1clk		(l1clk),
				.din		(pcx_ncu_data_px2[128:0]),
  .siclk(siclk),
  .soclk(soclk)
				);

ncu_c2ifd_ctl_msff_ctl_macro__width_1 pcx_ncu_vld_ff 
				(
				.scan_in(pcx_ncu_vld_ff_scanin),
				.scan_out(pcx_ncu_vld_ff_scanout),
				.dout		(pcx_ncu_vld),
				.l1clk		(l1clk),
				.din		(pcx_ncu_data_px2[129]),
  .siclk(siclk),
  .soclk(soclk)
				);
assign  cpubuf_din[143:0] = mb1_run ? {18{mb1_wdata[7:0]}} : {pcx_ncu_data[143:0]} ;
//assign  cpubuf_din[143:0] = pcx_ncu_data[143:0];	// cpubuf no longer goes to mb0.

////// pcx_ncu_vld 
assign 	pcx_ncu_req[4:0] = pcx_ncu_data[128:124];
assign 	pcx_ncu_addr[39:0] = pcx_ncu_data[103:64];
assign 	pcx_ncu_cputhr[5:0] = pcx_ncu_data[122:117];

//// par and ecc gen ////
assign	pcx_ncu_data[133:129]=pcxecc[4:0];
ncu_eccgen6_ctl c2ifdeccgen6 (.din(pcx_ncu_cputhr[5:0]),
				 .dout(pcxecc[4:0]));

assign	pcx_ncu_data[134] = ~^{pcx_ncu_data[0], pcx_ncu_data[10],pcx_ncu_data[20], pcx_ncu_data[30],
			       pcx_ncu_data[40],pcx_ncu_data[50],pcx_ncu_data[60], pcx_ncu_data[70],
			       pcx_ncu_data[80],pcx_ncu_data[90],pcx_ncu_data[100],pcx_ncu_data[110]};

assign	pcx_ncu_data[135] = ~^{pcx_ncu_data[1], pcx_ncu_data[11],pcx_ncu_data[21], pcx_ncu_data[31],
			       pcx_ncu_data[41],pcx_ncu_data[51],pcx_ncu_data[61], pcx_ncu_data[70],
			       pcx_ncu_data[81],pcx_ncu_data[91],pcx_ncu_data[101],pcx_ncu_data[111]};

assign	pcx_ncu_data[136] = ~^{pcx_ncu_data[2], pcx_ncu_data[12],pcx_ncu_data[22], pcx_ncu_data[32],
			       pcx_ncu_data[42],pcx_ncu_data[52],pcx_ncu_data[62], pcx_ncu_data[72],
			       pcx_ncu_data[82],pcx_ncu_data[92],pcx_ncu_data[102],pcx_ncu_data[114]};

assign	pcx_ncu_data[137] = ~^{pcx_ncu_data[3], pcx_ncu_data[13],pcx_ncu_data[23], pcx_ncu_data[33],
			       pcx_ncu_data[43],pcx_ncu_data[52],pcx_ncu_data[63], pcx_ncu_data[73],
			       pcx_ncu_data[83],pcx_ncu_data[93],pcx_ncu_data[103],pcx_ncu_data[124]};

assign	pcx_ncu_data[138] = ~^{pcx_ncu_data[4], pcx_ncu_data[14],pcx_ncu_data[24], pcx_ncu_data[34],
			       pcx_ncu_data[44],pcx_ncu_data[54],pcx_ncu_data[64], pcx_ncu_data[74],
			       pcx_ncu_data[84],pcx_ncu_data[94],pcx_ncu_data[104],pcx_ncu_data[125]};

assign	pcx_ncu_data[139] = ~^{pcx_ncu_data[5], pcx_ncu_data[15],pcx_ncu_data[25], pcx_ncu_data[35],
			       pcx_ncu_data[45],pcx_ncu_data[55],pcx_ncu_data[65], pcx_ncu_data[75],
			       pcx_ncu_data[85],pcx_ncu_data[95],pcx_ncu_data[105],pcx_ncu_data[126]};

assign	pcx_ncu_data[140] = ~^{pcx_ncu_data[6], pcx_ncu_data[16],pcx_ncu_data[26], pcx_ncu_data[36],
			       pcx_ncu_data[46],pcx_ncu_data[56],pcx_ncu_data[66], pcx_ncu_data[76],
			       pcx_ncu_data[86],pcx_ncu_data[96],pcx_ncu_data[106],pcx_ncu_data[127]};

assign	pcx_ncu_data[141] = ~^{pcx_ncu_data[7], pcx_ncu_data[17],pcx_ncu_data[27], pcx_ncu_data[37],
			       pcx_ncu_data[47],pcx_ncu_data[57],pcx_ncu_data[67], pcx_ncu_data[77],
			       pcx_ncu_data[87],pcx_ncu_data[98],pcx_ncu_data[107],pcx_ncu_data[128]};

assign	pcx_ncu_data[142] = ~^{pcx_ncu_data[8], pcx_ncu_data[18],pcx_ncu_data[28], pcx_ncu_data[38],
			       pcx_ncu_data[48],pcx_ncu_data[58],pcx_ncu_data[68], pcx_ncu_data[78],
			       pcx_ncu_data[88],pcx_ncu_data[98],pcx_ncu_data[108]};
			       
assign	pcx_ncu_data[143] = ~^{pcx_ncu_data[9], pcx_ncu_data[19],pcx_ncu_data[29], pcx_ncu_data[39],
			       pcx_ncu_data[49],pcx_ncu_data[59],pcx_ncu_data[69], pcx_ncu_data[79],
			       pcx_ncu_data[89],pcx_ncu_data[99],pcx_ncu_data[109]};

/*****************************************************************
 * Mondo data0/data1/busy table write data
 *****************************************************************/
// Convert from BSC to CPU clock
ncu_c2ifd_ctl_msff_ctl_macro__en_1__width_64 io_mondo_data0_din_ff  
				(
				.scan_in(io_mondo_data0_din_ff_scanin),
				.scan_out(io_mondo_data0_din_ff_scanout),
				.dout		(io_mondo_data0_din[63:0]),
				.l1clk		(l1clk),
				.en		(io_cmp_sync_en),
				.din		(io_mondo_data0_din_s[63:0]),
  .siclk(siclk),
  .soclk(soclk)
				);

ncu_c2ifd_ctl_msff_ctl_macro__en_1__width_64 io_mondo_data1_din_ff  
				(
				.scan_in(io_mondo_data1_din_ff_scanin),
				.scan_out(io_mondo_data1_din_ff_scanout),
				.dout		(io_mondo_data1_din[63:0]),
				.l1clk		(l1clk),
				.en		(io_cmp_sync_en),
				.din		(io_mondo_data1_din_s[63:0]),
  .siclk(siclk),
  .soclk(soclk)
				);


ncu_c2ifd_ctl_msff_ctl_macro__en_1__width_64 tap_mondo_din_ff  
				(
				.scan_in(tap_mondo_din_ff_scanin),
				.scan_out(tap_mondo_din_ff_scanout),
				.dout		(tap_mondo_din[63:0]),
				.l1clk		(l1clk),
				.en		(io_cmp_sync_en),
				.din		(tap_mondo_din_s[63:0]),
  .siclk(siclk),
  .soclk(soclk)
				);


//assign  mb0_mondo_sel = mb0_run * mb0_mondo_wr_en;
assign 	mondo_data0_din[71:0] = mb0_run ? {9{mb0_wdata[7:0]}} : mondo_data0_pre[71:0] ;
			     //io_mondo_data_wr ? io_mondo_data0_din[63:0] : tap_mondo_din[63:0];

assign	mondo_data0_pre[63:0] = io_mondo_data_wr ? io_mondo_data0_din[63:0] : tap_mondo_din[63:0];
assign	mondo_data0_pre[64] = ~^{mondo_data0_pre[0],  mondo_data0_pre[8],  mondo_data0_pre[16], mondo_data0_pre[24], 
				 mondo_data0_pre[32], mondo_data0_pre[40], mondo_data0_pre[48], mondo_data0_pre[56] };
assign	mondo_data0_pre[65] = ~^{mondo_data0_pre[1],  mondo_data0_pre[9],  mondo_data0_pre[17], mondo_data0_pre[25], 
				 mondo_data0_pre[33], mondo_data0_pre[41], mondo_data0_pre[49], mondo_data0_pre[57] };
assign	mondo_data0_pre[66] = ~^{mondo_data0_pre[2],  mondo_data0_pre[10], mondo_data0_pre[18], mondo_data0_pre[26], 
				 mondo_data0_pre[34], mondo_data0_pre[42], mondo_data0_pre[50], mondo_data0_pre[58] };
assign	mondo_data0_pre[67] = ~^{mondo_data0_pre[3],  mondo_data0_pre[11], mondo_data0_pre[19], mondo_data0_pre[27], 
				 mondo_data0_pre[35], mondo_data0_pre[43], mondo_data0_pre[51], mondo_data0_pre[59] };
assign	mondo_data0_pre[68] = ~^{mondo_data0_pre[4],  mondo_data0_pre[12], mondo_data0_pre[20], mondo_data0_pre[28], 
				 mondo_data0_pre[36], mondo_data0_pre[44], mondo_data0_pre[52], mondo_data0_pre[60] };
assign	mondo_data0_pre[69] = ~^{mondo_data0_pre[5],  mondo_data0_pre[13], mondo_data0_pre[21], mondo_data0_pre[29], 
				 mondo_data0_pre[37], mondo_data0_pre[45], mondo_data0_pre[53], mondo_data0_pre[61] };
assign	mondo_data0_pre[70] = ~^{mondo_data0_pre[6],  mondo_data0_pre[14], mondo_data0_pre[22], mondo_data0_pre[30], 
				 mondo_data0_pre[38], mondo_data0_pre[46], mondo_data0_pre[54], mondo_data0_pre[62] };
assign	mondo_data0_pre[71] = ~^{mondo_data0_pre[7],  mondo_data0_pre[15], mondo_data0_pre[23], mondo_data0_pre[31], 
				 mondo_data0_pre[39], mondo_data0_pre[47], mondo_data0_pre[55], mondo_data0_pre[63] };

ncu_c2ifd_ctl_msff_ctl_macro__width_72 mondo_data0_din_d1_ff 
				(
				.scan_in(mondo_data0_din_d1_ff_scanin),
				.scan_out(mondo_data0_din_d1_ff_scanout),
				.dout		(mondo_data0_din_d1[71:0]),
				.l1clk		(l1clk),
				.din		(mondo_data0_din[71:0]),
  .siclk(siclk),
  .soclk(soclk)
				);

ncu_c2ifd_ctl_msff_ctl_macro__width_72 mondo_data0_din_d2_ff 
				(
				.scan_in(mondo_data0_din_d2_ff_scanin),
				.scan_out(mondo_data0_din_d2_ff_scanout),
				.dout		(mondo_data0_din_d2[71:0]),
				.l1clk		(l1clk),
				.din		(mondo_data0_din_d1[71:0]),
  .siclk(siclk),
  .soclk(soclk)
				);



assign 	mondo_data1_din[71:0] = mb0_run ? {9{mb0_wdata[7:0]}} : mondo_data1_pre[71:0] ;
	 		     //io_mondo_data_wr ? io_mondo_data1_din[63:0] : tap_mondo_din[63:0];

assign	mondo_data1_pre[63:0] = io_mondo_data_wr ? io_mondo_data1_din[63:0] : tap_mondo_din[63:0];
assign	mondo_data1_pre[64] = ~^{mondo_data1_pre[0],  mondo_data1_pre[8],  mondo_data1_pre[16], mondo_data1_pre[24], 
				 mondo_data1_pre[32], mondo_data1_pre[40], mondo_data1_pre[48], mondo_data1_pre[56] };
assign	mondo_data1_pre[65] = ~^{mondo_data1_pre[1],  mondo_data1_pre[9],  mondo_data1_pre[17], mondo_data1_pre[25], 
				 mondo_data1_pre[33], mondo_data1_pre[41], mondo_data1_pre[49], mondo_data1_pre[57] };
assign	mondo_data1_pre[66] = ~^{mondo_data1_pre[2],  mondo_data1_pre[10], mondo_data1_pre[18], mondo_data1_pre[26], 
				 mondo_data1_pre[34], mondo_data1_pre[42], mondo_data1_pre[50], mondo_data1_pre[58] };
assign	mondo_data1_pre[67] = ~^{mondo_data1_pre[3],  mondo_data1_pre[11], mondo_data1_pre[19], mondo_data1_pre[27], 
				 mondo_data1_pre[35], mondo_data1_pre[43], mondo_data1_pre[51], mondo_data1_pre[59] };
assign	mondo_data1_pre[68] = ~^{mondo_data1_pre[4],  mondo_data1_pre[12], mondo_data1_pre[20], mondo_data1_pre[28], 
				 mondo_data1_pre[36], mondo_data1_pre[44], mondo_data1_pre[52], mondo_data1_pre[60] };
assign	mondo_data1_pre[69] = ~^{mondo_data1_pre[5],  mondo_data1_pre[13], mondo_data1_pre[21], mondo_data1_pre[29], 
				 mondo_data1_pre[37], mondo_data1_pre[45], mondo_data1_pre[53], mondo_data1_pre[61] };
assign	mondo_data1_pre[70] = ~^{mondo_data1_pre[6],  mondo_data1_pre[14], mondo_data1_pre[22], mondo_data1_pre[30], 
				 mondo_data1_pre[38], mondo_data1_pre[46], mondo_data1_pre[54], mondo_data1_pre[62] };
assign	mondo_data1_pre[71] = ~^{mondo_data1_pre[7],  mondo_data1_pre[15], mondo_data1_pre[23], mondo_data1_pre[31], 
				 mondo_data1_pre[39], mondo_data1_pre[47], mondo_data1_pre[55], mondo_data1_pre[63] };

ncu_c2ifd_ctl_msff_ctl_macro__width_72 mondo_data1_din_d1_ff 
				(
				.scan_in(mondo_data1_din_d1_ff_scanin),
				.scan_out(mondo_data1_din_d1_ff_scanout),
				.dout		(mondo_data1_din_d1[71:0]),
				.l1clk		(l1clk),
				.din		(mondo_data1_din[71:0]),
  .siclk(siclk),
  .soclk(soclk)
				);

ncu_c2ifd_ctl_msff_ctl_macro__width_72 mondo_data1_din_d2_ff 
				(
				.scan_in(mondo_data1_din_d2_ff_scanin),
				.scan_out(mondo_data1_din_d2_ff_scanout),
				.dout		(mondo_data1_din_d2[71:0]),
				.l1clk		(l1clk),
				.din		(mondo_data1_din_d1[71:0]),
  .siclk(siclk),
  .soclk(soclk)
				);

ncu_c2ifd_ctl_msff_ctl_macro__width_1 mondo_addr_creg_mbusy_dec_d3_ff 
				(
				.scan_in(mondo_addr_creg_mbusy_dec_d3_ff_scanin),
				.scan_out(mondo_addr_creg_mbusy_dec_d3_ff_scanout),
				.dout		(mondo_addr_creg_mbusy_dec_d3),
				.l1clk		(l1clk),
				.din		(mondo_addr_creg_mbusy_dec_d2),
  .siclk(siclk),
  .soclk(soclk)
				);

assign 	mondo_busy_din_p1 = io_mondo_data_wr ? 1'b1 : tap_mondo_din[6];

assign 	mondo_busy_din_p2 = pcx_ncu_data[6];


/*****************************************************************
 * Mondo data0/data1/busy table read data (CPU read)
 *****************************************************************/ 
assign 	mondo_data0_dout_byp[71:0] = mondo_data_bypass_d2 ? mondo_data0_din_d2[71:0] : 
							    mondo_data0_dout[71:0];

assign 	mondo_data1_dout_byp[71:0] = mondo_data_bypass_d2 ? mondo_data1_din_d2[71:0] : 
							    mondo_data1_dout[71:0];

// Use AND/OR to implement a mux
assign 	mondo_dout[71:0] = ({72{mondo_addr_creg_mdata0_dec_d2}}  & mondo_data0_dout_byp[71:0]) |
                       ({72{mondo_addr_creg_mdata1_dec_d2}} & mondo_data1_dout_byp[71:0]) |
		       ({72{mondo_addr_creg_mbusy_dec_d2}}  & {8'b0,57'b0,mondo_busy_dout_d2,6'b0});


ncu_c2ifd_ctl_msff_ctl_macro__width_72 mondo_dout_d1_ff 
				(
				.scan_in(mondo_dout_d1_ff_scanin),
				.scan_out(mondo_dout_d1_ff_scanout),
				.dout		(mondo_dout_d1[71:0]),
				.l1clk		(l1clk),
				.din		(mondo_dout[71:0]),
  .siclk(siclk),
  .soclk(soclk)
				);

ncu_c2ifd_ctl_msff_ctl_macro__en_1__width_1 modotbl_pei_ff 
				(
                                .scan_in(mondotbl_pei_ff_scanin),
                                .scan_out(mondotbl_pei_ff_scanout),
                                .dout           (mondotbl_pei_f),
                                .l1clk          (l1clk),
				.en		(io_cmp_sync_en),
                                .din            (mondotbl_pei),
  .siclk(siclk),
  .soclk(soclk)
                                );


assign	mtbl_pfail[0] = ~^{mondo_dout_d1[0],  mondo_dout_d1[8],  mondo_dout_d1[16], mondo_dout_d1[24], 
	 	mondo_dout_d1[32], mondo_dout_d1[40], mondo_dout_d1[48], mondo_dout_d1[56], mondo_dout_d1[64], 
		mondotbl_pei_f };

assign	mtbl_pfail[1] = ~^{mondo_dout_d1[1],  mondo_dout_d1[9],  mondo_dout_d1[17], mondo_dout_d1[25], 
	 	mondo_dout_d1[33], mondo_dout_d1[41], mondo_dout_d1[49], mondo_dout_d1[57], mondo_dout_d1[65] };

assign	mtbl_pfail[2] = ~^{mondo_dout_d1[2],  mondo_dout_d1[10], mondo_dout_d1[18], mondo_dout_d1[26], 
	 	mondo_dout_d1[34], mondo_dout_d1[42], mondo_dout_d1[50], mondo_dout_d1[58], mondo_dout_d1[66] };

assign	mtbl_pfail[3] = ~^{mondo_dout_d1[3],  mondo_dout_d1[11], mondo_dout_d1[19], mondo_dout_d1[27], 
	 	mondo_dout_d1[35], mondo_dout_d1[43], mondo_dout_d1[51], mondo_dout_d1[59], mondo_dout_d1[67] };

assign	mtbl_pfail[4] = ~^{mondo_dout_d1[4],  mondo_dout_d1[12], mondo_dout_d1[20], mondo_dout_d1[28], 
	 	mondo_dout_d1[36], mondo_dout_d1[44], mondo_dout_d1[52], mondo_dout_d1[60], mondo_dout_d1[68] };

assign	mtbl_pfail[5] = ~^{mondo_dout_d1[5],  mondo_dout_d1[13], mondo_dout_d1[21], mondo_dout_d1[29], 
	 	mondo_dout_d1[37], mondo_dout_d1[45], mondo_dout_d1[53], mondo_dout_d1[61], mondo_dout_d1[69] };

assign	mtbl_pfail[6] = ~^{mondo_dout_d1[6],  mondo_dout_d1[14], mondo_dout_d1[22], mondo_dout_d1[30], 
	 	mondo_dout_d1[38], mondo_dout_d1[46], mondo_dout_d1[54], mondo_dout_d1[62], mondo_dout_d1[70] };

assign	mtbl_pfail[7] = ~^{mondo_dout_d1[7],  mondo_dout_d1[15], mondo_dout_d1[23], mondo_dout_d1[31], 
	 	mondo_dout_d1[39], mondo_dout_d1[47], mondo_dout_d1[55], mondo_dout_d1[63], mondo_dout_d1[71] };

//// holding logic for domain crossing //

assign	mtbl_perr = (|(mtbl_pfail[7:0])) & cpu_mondo_rd_d3 & ~mondo_addr_creg_mbusy_dec_d3 ;
assign  mtbl_perr_hldr_n = cmp_io_sync_en ? mtbl_perr : mtbl_perr_hldr|mtbl_perr ;
ncu_c2ifd_ctl_msff_ctl_macro__width_1 mtbl_perr_hldr_ff 
				(
				.scan_in(mtbl_perr_hldr_ff_scanin),
				.scan_out(mtbl_perr_hldr_ff_scanout),
				.dout		(mtbl_perr_hldr),
				.l1clk		(l1clk),
				.din		(mtbl_perr_hldr_n),
  .siclk(siclk),
  .soclk(soclk)
				);
ncu_c2ifd_ctl_msff_ctl_macro__en_1__width_1 mondotbl_pe_f_ff  
				(
				.scan_in(mondotbl_pe_f_ff_scanin),
				.scan_out(mondotbl_pe_f_ff_scanout),
				.dout		(mondotbl_pe_f),
				.l1clk		(l1clk),
				.en		(cmp_io_sync_en),
				.din		(mtbl_perr_hldr),
  .siclk(siclk),
  .soclk(soclk)
				);





//***************************************************
//// hold for capturing new synd and ue ////
//assign	iobuf_ue_vld_n = cmp_io_sync_en ? (iobuf_vld&iobuf_dout_d1_ue) : 
					  //(iobuf_vld&iobuf_dout_d1_ue)|iobuf_ue_vld;
//jlau_dff #(1)	iobuf_ue_vld_ff (.din(iobuf_ue_vld_n), .clk(l2clk), .q(iobuf_ue_vld) );
//
//// signal for domain crossing ////
//jlau_dffe #(1)	iobuf_ue_f_ff ( .din(iobuf_ue_vld), .clk(l2clk), .en(cmp_io_sync_en),
				//.q(iobuf_ue_f) );
//***************************************************/

////
ncu_c2ifd_ctl_msff_ctl_macro__width_3 cpu_mondo_cpu_id_d1_ff 
				(
				.scan_in(cpu_mondo_cpu_id_d1_ff_scanin),
				.scan_out(cpu_mondo_cpu_id_d1_ff_scanout),
				.dout		(cpu_mondo_cpu_id_d1[2:0]),
				.l1clk		(l1clk),
				.din		(pcx_ncu_data[122:120]),
  .siclk(siclk),
  .soclk(soclk)
				);
ncu_c2ifd_ctl_msff_ctl_macro__width_3 cpu_mondo_cpu_id_d2_ff 
				(
				.scan_in(cpu_mondo_cpu_id_d2_ff_scanin),
				.scan_out(cpu_mondo_cpu_id_d2_ff_scanout),
				.dout		(cpu_mondo_cpu_id_d2[2:0]),
				.l1clk		(l1clk),
				.din		(cpu_mondo_cpu_id_d1[2:0]),
  .siclk(siclk),
  .soclk(soclk)
				);
////
ncu_c2ifd_ctl_msff_ctl_macro__width_3 cpu_mondo_thr_id_d1_ff 
				(
				.scan_in(cpu_mondo_thr_id_d1_ff_scanin),
				.scan_out(cpu_mondo_thr_id_d1_ff_scanout),
				.dout		(cpu_mondo_thr_id_d1[2:0]),
				.l1clk		(l1clk),
				.din		(pcx_ncu_data[119:117]),
  .siclk(siclk),
  .soclk(soclk)
				);
ncu_c2ifd_ctl_msff_ctl_macro__width_3 cpu_mondo_thr_id_d2_ff 
				(
				.scan_in(cpu_mondo_thr_id_d2_ff_scanin),
				.scan_out(cpu_mondo_thr_id_d2_ff_scanout),
				.dout		(cpu_mondo_thr_id_d2[2:0]),
				.l1clk		(l1clk),
				.din		(cpu_mondo_thr_id_d1[2:0]),
  .siclk(siclk),
  .soclk(soclk)
				);
////
ncu_c2ifd_ctl_msff_ctl_macro__width_1 cpu_mondo_bis_d1_ff 
				(
				.scan_in(cpu_mondo_bis_d1_ff_scanin),
				.scan_out(cpu_mondo_bis_d1_ff_scanout),
				.dout		(cpu_mondo_bis_d1),
				.l1clk		(l1clk),
				.din		(pcx_ncu_data[114]),
  .siclk(siclk),
  .soclk(soclk)
				);
ncu_c2ifd_ctl_msff_ctl_macro__width_1 cpu_mondo_bis_d2_ff 
				(
				.scan_in(cpu_mondo_bis_d2_ff_scanin),
				.scan_out(cpu_mondo_bis_d2_ff_scanout),
				.dout		(cpu_mondo_bis_d2),
				.l1clk		(l1clk),
				.din		(cpu_mondo_bis_d1),
  .siclk(siclk),
  .soclk(soclk)
				);
////
ncu_c2ifd_ctl_msff_ctl_macro__width_8 cpu_mondo_addr10_3_d1_ff 
				(
				.scan_in(cpu_mondo_addr10_3_d1_ff_scanin),
				.scan_out(cpu_mondo_addr10_3_d1_ff_scanout),
				.dout		(cpu_mondo_addr10_3_d1[7:0]),
				.l1clk		(l1clk),
				.din		(pcx_ncu_data[74:67]),
  .siclk(siclk),
  .soclk(soclk)
				);
ncu_c2ifd_ctl_msff_ctl_macro__width_8 cpu_mondo_addr10_3_d2_ff 
				(
				.scan_in(cpu_mondo_addr10_3_d2_ff_scanin),
				.scan_out(cpu_mondo_addr10_3_d2_ff_scanout),
				.dout		(cpu_mondo_addr10_3_d2[7:0]),
				.l1clk		(l1clk),
				.din		(cpu_mondo_addr10_3_d1[7:0]),
  .siclk(siclk),
  .soclk(soclk)
				);
////
ncu_c2ifd_ctl_msff_ctl_macro__width_8 cpu_mondo_size_d1_ff 
				(
				.scan_in(cpu_mondo_size_d1_ff_scanin),
				.scan_out(cpu_mondo_size_d1_ff_scanout),
				.dout		(cpu_mondo_size_d1[7:0]),
				.l1clk		(l1clk),
				.din		(pcx_ncu_data[111:104]),
  .siclk(siclk),
  .soclk(soclk)
				);
ncu_c2ifd_ctl_msff_ctl_macro__width_8 cpu_mondo_size_d2_ff 
				(
				.scan_in(cpu_mondo_size_d2_ff_scanin),
				.scan_out(cpu_mondo_size_d2_ff_scanout),
				.dout		(cpu_mondo_size_d2[7:0]),
				.l1clk		(l1clk),
				.din		(cpu_mondo_size_d1[7:0]),
  .siclk(siclk),
  .soclk(soclk)
				);
////
ncu_c2ifd_ctl_msff_ctl_macro__width_64 pcx_pkt_data_d1_ff 
				(
				.scan_in(pcx_pkt_data_d1_ff_scanin),
				.scan_out(pcx_pkt_data_d1_ff_scanout),
				.dout		(pcx_pkt_data_d1[63:0]),
				.l1clk		(l1clk),
				.din		(pcx_ncu_data[63:0]),
  .siclk(siclk),
  .soclk(soclk)
				);
ncu_c2ifd_ctl_msff_ctl_macro__width_64 pcx_pkt_data_d2_ff 
				(
				.scan_in(pcx_pkt_data_d2_ff_scanin),
				.scan_out(pcx_pkt_data_d2_ff_scanout),
				.dout		(pcx_pkt_data_d2[63:0]),
				.l1clk		(l1clk),
				.din		(pcx_pkt_data_d1[63:0]),
  .siclk(siclk),
  .soclk(soclk)
				);

assign 	cpu_mondo_cpu_id_dec_d2[7:0] = 8'b0000_0001 << cpu_mondo_cpu_id_d2[2:0];

//assign  mb0_intbuf_sel = mb0_run & mb0_intbuf_wr_en;
assign 	intbuf_din[143:0] = mb0_run ? {18{mb0_wdata[7:0]}} : mondo2cpu_pkt[143:0] ;


////////////////////////////////
////// intbuf par and ecc //////
//ncu_eccgen11_ctl c2ifdeccgen11 (.din({cpu_mondo_cpu_id_dec_d2[7:0],cpu_mondo_thr_id_d2[2:0]}),
ncu_eccgen11_ctl c2ifdeccgen11 (.din({mondo2cpu_pkt[121:114],mondo2cpu_pkt[104:102]}),
				//.dout(mondo2cpu_pkt[126:122]) );
				.dout(mondofifoecc[4:0]) );
assign	mondo2cpu_pkt[126:122]=mondofifoecc[4:0];

assign	mondo2cpu_pkt[127] = ~^{mondo2cpu_pkt[0], mondo2cpu_pkt[17],mondo2cpu_pkt[34],
			        mondo2cpu_pkt[51],mondo2cpu_pkt[68],mondo2cpu_pkt[86],mondo2cpu_pkt[106]};
assign	mondo2cpu_pkt[128] = ~^{mondo2cpu_pkt[1], mondo2cpu_pkt[18],mondo2cpu_pkt[35],
			        mondo2cpu_pkt[52],mondo2cpu_pkt[69],mondo2cpu_pkt[87],mondo2cpu_pkt[107]};
assign	mondo2cpu_pkt[129] = ~^{mondo2cpu_pkt[2], mondo2cpu_pkt[19],mondo2cpu_pkt[36],
			        mondo2cpu_pkt[53],mondo2cpu_pkt[70],mondo2cpu_pkt[88],mondo2cpu_pkt[108]};
assign	mondo2cpu_pkt[130] = ~^{mondo2cpu_pkt[3], mondo2cpu_pkt[20],mondo2cpu_pkt[37],
			        mondo2cpu_pkt[54],mondo2cpu_pkt[71],mondo2cpu_pkt[89],mondo2cpu_pkt[109]};
assign	mondo2cpu_pkt[131] = ~^{mondo2cpu_pkt[4], mondo2cpu_pkt[21],mondo2cpu_pkt[38],
			        mondo2cpu_pkt[55],mondo2cpu_pkt[72],mondo2cpu_pkt[90],mondo2cpu_pkt[110]};
assign	mondo2cpu_pkt[132] = ~^{mondo2cpu_pkt[5], mondo2cpu_pkt[22],mondo2cpu_pkt[39],
			        mondo2cpu_pkt[56],mondo2cpu_pkt[73],mondo2cpu_pkt[91],mondo2cpu_pkt[111]};
assign	mondo2cpu_pkt[133] = ~^{mondo2cpu_pkt[6], mondo2cpu_pkt[23],mondo2cpu_pkt[40],
			        mondo2cpu_pkt[57],mondo2cpu_pkt[74],mondo2cpu_pkt[92],mondo2cpu_pkt[112]};
assign	mondo2cpu_pkt[134] = ~^{mondo2cpu_pkt[7], mondo2cpu_pkt[24],mondo2cpu_pkt[41],
			        mondo2cpu_pkt[58],mondo2cpu_pkt[75],mondo2cpu_pkt[93],mondo2cpu_pkt[113]};
assign	mondo2cpu_pkt[135] = ~^{mondo2cpu_pkt[8], mondo2cpu_pkt[25],mondo2cpu_pkt[42],
			        mondo2cpu_pkt[59],mondo2cpu_pkt[76],mondo2cpu_pkt[94]};
assign	mondo2cpu_pkt[136] = ~^{mondo2cpu_pkt[9], mondo2cpu_pkt[26],mondo2cpu_pkt[43],
			        mondo2cpu_pkt[60],mondo2cpu_pkt[78],mondo2cpu_pkt[95]};
assign	mondo2cpu_pkt[137] = ~^{mondo2cpu_pkt[10],mondo2cpu_pkt[27],mondo2cpu_pkt[44],
			        mondo2cpu_pkt[61],mondo2cpu_pkt[79],mondo2cpu_pkt[96]};
assign	mondo2cpu_pkt[138] = ~^{mondo2cpu_pkt[11],mondo2cpu_pkt[28],mondo2cpu_pkt[45],
			        mondo2cpu_pkt[62],mondo2cpu_pkt[80],mondo2cpu_pkt[97]};
assign	mondo2cpu_pkt[139] = ~^{mondo2cpu_pkt[12],mondo2cpu_pkt[29],mondo2cpu_pkt[46],
			        mondo2cpu_pkt[63],mondo2cpu_pkt[81],mondo2cpu_pkt[98]};
assign	mondo2cpu_pkt[140] = ~^{mondo2cpu_pkt[13],mondo2cpu_pkt[30],mondo2cpu_pkt[47],
			        mondo2cpu_pkt[64],mondo2cpu_pkt[82],mondo2cpu_pkt[79]};
assign	mondo2cpu_pkt[141] = ~^{mondo2cpu_pkt[14],mondo2cpu_pkt[31],mondo2cpu_pkt[48],
			        mondo2cpu_pkt[65],mondo2cpu_pkt[83],mondo2cpu_pkt[100]};
assign	mondo2cpu_pkt[142] = ~^{mondo2cpu_pkt[15],mondo2cpu_pkt[32],mondo2cpu_pkt[49],
			        mondo2cpu_pkt[66],mondo2cpu_pkt[84],mondo2cpu_pkt[101]};
assign	mondo2cpu_pkt[143] = ~^{mondo2cpu_pkt[16],mondo2cpu_pkt[33],mondo2cpu_pkt[50],
			        mondo2cpu_pkt[67],mondo2cpu_pkt[85],mondo2cpu_pkt[105]};

ncu_c2ifd_ctl_msff_ctl_macro__width_122 mondo2cpu_pkt_ff 
				(
				.scan_in(mondo2cpu_pkt_ff_scanin),
				.scan_out(mondo2cpu_pkt_ff_scanout),
				.dout		(mondo2cpu_pkta[121:0]),
				.l1clk		(l1clk),
				.din		(mondo2cpu_pkt_n[121:0]),
  .siclk(siclk),
  .soclk(soclk)
				);

// make sure to set the err bit when perr happen //
assign	mondo2cpu_pkt[121:0] = {mondo2cpu_pkta[121:108],mondo2cpu_pkta[107]|mtbl_perr,mondo2cpu_pkta[106:0]} ;

ncu_c2ifd_ctl_msff_ctl_macro__width_1 cpu_mondo_rd_d3_ff 
				(
				.scan_in(cpu_mondo_rd_d3_ff_scanin),
				.scan_out(cpu_mondo_rd_d3_ff_scanout),
				.dout		(cpu_mondo_rd_d3),
				.l1clk		(l1clk),
				.din		(cpu_mondo_rd_d2),
  .siclk(siclk),
  .soclk(soclk)
				);

assign	mondo2cpu_pkt_n[121:0] =
	     cpu_mondo_rd_d2 ?
	          ////// read ack to CPU ////
	              {cpu_mondo_cpu_id_dec_d2[7:0], // cpu ID      [153:146],[121:114]
		       1'b1,                         // valid       [145]    ,[113]
		       `CPX_LOAD_RET,                // ret type    [144:141],[112:109]
		       1'b0,			     // l2miss	    [140]    ,[108]
		       {cpu_mondo_addr_invld_d2,1'b0},// error      [139:138],[107:106]
		       1'b1,                         // NC          [137]    ,[105]
		       cpu_mondo_thr_id_d2[2:0],     // thread ID   [136:134],[104:102]
		       1'b0,			     // wv          [133]    ,[101]
		       2'b0,			     // w/mmuid     [132:131],[100:99]
		       1'b0,                         // w/f4b       [130]    ,[98]
		       2'b0,                         // un-used     [129:128],[97:96]==
		       mondo_dout[63:32],	     //                       [95:64]
		       mondo_dout[63:0]} :           // intr status [63:0]==
	          ////// write ack to CPU //////
	              {cpu_mondo_cpu_id_dec_d2[7:0], // cpu ID	   [153:146],[121:114]
		       1'b1,                         // valid       [145]    ,[113]
		       `CPX_ST_ACK,                  // return type [144:141],[112:109]
		       1'b0,			     // l2miss	   [140]    ,[108]
		       2'b0,                         // error       [139:138],[107:106]
		       1'b1,                         // NC          [137]    ,[105]
		       cpu_mondo_thr_id_d2[2:0],     // thread ID   [136:134],[104:102]
		       6'b0,                         // unused      [133:128],[101:96]==
		       2'b0,                         // unused      [127:126],[95:94]
		       cpu_mondo_bis_d2,             // bis         [125]    ,[93]
		       2'b0,			     // unused      [124:123],[92:91]
		       cpu_mondo_addr10_3_d2[2:1],   // addr[5:4]   [122:121],[90:89]
		       cpu_mondo_cpu_id_d2[2:0],     // cpu_id      [120:118],[88:86]
		       1'b0,			     //             [117]    ,[85]
		       cpu_mondo_addr10_3_d2[7:3],   // addr[10:6]  [116:112],[84:80]
		       7'b0,                         // unused      [111:105],[79:73]
		       cpu_mondo_addr10_3_d2[0],     // addr[3]     [104]    ,[72]
		       cpu_mondo_size_d2[7:0],	     // byte mask   [103:96] ,[71:64]
		       //32'b0,		     	     // unused      [95:64]  
		       pcx_pkt_data_d2[63:0] };      //             [63:0]   ,[63:0]


/*****************************************************************
 * Interrupt status table, Mondo data0/data1/busy table read data (TAP read)
 *****************************************************************/ 
ncu_c2ifd_ctl_msff_ctl_macro__en_1__width_64 tap_mondo_dout_d2_ff  
				(
				.scan_in(tap_mondo_dout_d2_ff_scanin),
				.scan_out(tap_mondo_dout_d2_ff_scanout),
				.dout		(tap_mondo_dout_d2[63:0]),
				.l1clk		(l1clk),
				.en		(tap_mondo_rd_d2),
				.din		(mondo_dout[63:0]),
  .siclk(siclk),
  .soclk(soclk)
				);

// Send result back to BSC clock domain   
ncu_c2ifd_ctl_msff_ctl_macro__en_1__width_64 tap_mondo_dout_d2_f_ff  
				(
				.scan_in(tap_mondo_dout_d2_f_ff_scanin),
				.scan_out(tap_mondo_dout_d2_f_ff_scanout),
				.dout		(tap_mondo_dout_d2_f[63:0]),
				.l1clk		(l1clk),
				.en		(cmp_io_sync_en),
				.din		(tap_mondo_dout_d2[63:0]),
  .siclk(siclk),
  .soclk(soclk)
				);


//===================================================================
//===================================================================
//================================================ mondo_busy =======

ncu_c2ifd_ctl_msff_ctl_macro__width_6 wr1_a_d1_ff 
				(
				.scan_in(wr1_a_d1_ff_scanin),
				.scan_out(wr1_a_d1_ff_scanout),
				.dout		(wr1_a_d1[5:0]),
				.l1clk		(l1clk),
				.din		(mondo_busy_addr_p1[5:0]),
  .siclk(siclk),
  .soclk(soclk)
				);

ncu_c2ifd_ctl_msff_ctl_macro__width_6 wr2_a_d1_ff 
				(
				.scan_in(wr2_a_d1_ff_scanin),
				.scan_out(wr2_a_d1_ff_scanout),
				.dout		(wr2_a_d1[5:0]),
				.l1clk		(l1clk),
				.din		(mondo_busy_addr_p2[5:0]),
  .siclk(siclk),
  .soclk(soclk)
				);

ncu_c2ifd_ctl_msff_ctl_macro__width_1 din1_d1_ff 
				(
				.scan_in(din1_d1_ff_scanin),
				.scan_out(din1_d1_ff_scanout),
				.dout		(din1_d1),
				.l1clk		(l1clk),
				.din		(mondo_busy_din_p1),
  .siclk(siclk),
  .soclk(soclk)
				);

ncu_c2ifd_ctl_msff_ctl_macro__width_1 din2_d1_ff 
				(
				.scan_in(din2_d1_ff_scanin),
				.scan_out(din2_d1_ff_scanout),
				.dout		(din2_d1),
				.l1clk		(l1clk),
				.din		(mondo_busy_din_p2),
  .siclk(siclk),
  .soclk(soclk)
				);

ncu_c2ifd_ctl_msff_ctl_macro__width_1 wen1_d1_ff 
				(
				.scan_in(wen1_d1_ff_scanin),
				.scan_out(wen1_d1_ff_scanout),
				.dout		(wen1_d1),
				.l1clk		(l1clk),
				.din		(mondo_busy_wr_p1),
  .siclk(siclk),
  .soclk(soclk)
				);

ncu_c2ifd_ctl_msff_ctl_macro__width_1 wen2_d1_ff 
				(
				.scan_in(wen2_d1_ff_scanin),
				.scan_out(wen2_d1_ff_scanout),
				.dout		(wen2_d1),
				.l1clk		(l1clk),
				.din		(mondo_busy_wr_p2),
  .siclk(siclk),
  .soclk(soclk)
				);

assign	wr1_a_dec_d1[63:0] = 64'h0000_0000_0000_0001 << wr1_a_d1[5:0];
   
assign	wr2_a_dec_d1[63:0] = 64'h0000_0000_0000_0001 << wr2_a_d1[5:0];
   
assign	wen1_dec_d1[63:0] = {64{wen1_d1}} & wr1_a_dec_d1[63:0];

assign	wen2_dec_d1[63:0] = {64{wen2_d1}} & wr2_a_dec_d1[63:0];

assign	vec_n[0]   =	wen1_dec_d1[0]  ? din1_d1 :
			wen2_dec_d1[0]  ? din2_d1 : vec[0] ;
assign	vec_n[1]   =	wen1_dec_d1[1]  ? din1_d1 :
			wen2_dec_d1[1]  ? din2_d1 : vec[1] ;
assign	vec_n[2]   =	wen1_dec_d1[2]  ? din1_d1 :
			wen2_dec_d1[2]  ? din2_d1 : vec[2] ;
assign	vec_n[3]   =	wen1_dec_d1[3]  ? din1_d1 :
			wen2_dec_d1[3]  ? din2_d1 : vec[3] ;
assign	vec_n[4]   =	wen1_dec_d1[4]  ? din1_d1 :
			wen2_dec_d1[4]  ? din2_d1 : vec[4] ;
assign	vec_n[5]   =	wen1_dec_d1[5]  ? din1_d1 :
			wen2_dec_d1[5]  ? din2_d1 : vec[5] ;
assign	vec_n[6]   =	wen1_dec_d1[6]  ? din1_d1 :
			wen2_dec_d1[6]  ? din2_d1 : vec[6] ;
assign	vec_n[7]   =	wen1_dec_d1[7]  ? din1_d1 :
			wen2_dec_d1[7]  ? din2_d1 : vec[7] ;
assign	vec_n[8]   =	wen1_dec_d1[8]  ? din1_d1 :
			wen2_dec_d1[8]  ? din2_d1 : vec[8] ;
assign	vec_n[9]   =	wen1_dec_d1[9]  ? din1_d1 :
			wen2_dec_d1[9]  ? din2_d1 : vec[9] ;
assign	vec_n[10]  =	wen1_dec_d1[10] ? din1_d1 :
			wen2_dec_d1[10] ? din2_d1 : vec[10] ;
assign	vec_n[11]  =	wen1_dec_d1[11] ? din1_d1 :
			wen2_dec_d1[11] ? din2_d1 : vec[11] ;
assign	vec_n[12]  =	wen1_dec_d1[12] ? din1_d1 :
			wen2_dec_d1[12] ? din2_d1 : vec[12] ;
assign	vec_n[13]  =	wen1_dec_d1[13] ? din1_d1 :
			wen2_dec_d1[13] ? din2_d1 : vec[13] ;
assign	vec_n[14]  =	wen1_dec_d1[14] ? din1_d1 :
			wen2_dec_d1[14] ? din2_d1 : vec[14] ;
assign	vec_n[15]  =	wen1_dec_d1[15] ? din1_d1 :
			wen2_dec_d1[15] ? din2_d1 : vec[15] ;
assign	vec_n[16]  =	wen1_dec_d1[16] ? din1_d1 :
			wen2_dec_d1[16] ? din2_d1 : vec[16] ;
assign	vec_n[17]  =	wen1_dec_d1[17] ? din1_d1 :
			wen2_dec_d1[17] ? din2_d1 : vec[17] ;
assign	vec_n[18]  =	wen1_dec_d1[18] ? din1_d1 :
			wen2_dec_d1[18] ? din2_d1 : vec[18] ;
assign	vec_n[19]  =	wen1_dec_d1[19] ? din1_d1 :
			wen2_dec_d1[19] ? din2_d1 : vec[19] ;
assign	vec_n[20]  =	wen1_dec_d1[20] ? din1_d1 :
			wen2_dec_d1[20] ? din2_d1 : vec[20] ;
assign	vec_n[21]  =	wen1_dec_d1[21] ? din1_d1 :
			wen2_dec_d1[21] ? din2_d1 : vec[21] ;
assign	vec_n[22]  =	wen1_dec_d1[22] ? din1_d1 :
			wen2_dec_d1[22] ? din2_d1 : vec[22] ;
assign	vec_n[23]  =	wen1_dec_d1[23] ? din1_d1 :
			wen2_dec_d1[23] ? din2_d1 : vec[23] ;
assign	vec_n[24]  =	wen1_dec_d1[24] ? din1_d1 :
			wen2_dec_d1[24] ? din2_d1 : vec[24] ;
assign	vec_n[25]  =	wen1_dec_d1[25] ? din1_d1 :
			wen2_dec_d1[25] ? din2_d1 : vec[25] ;
assign	vec_n[26]  =	wen1_dec_d1[26] ? din1_d1 :
			wen2_dec_d1[26] ? din2_d1 : vec[26] ;
assign	vec_n[27]  =	wen1_dec_d1[27] ? din1_d1 :
			wen2_dec_d1[27] ? din2_d1 : vec[27] ;
assign	vec_n[28]  =	wen1_dec_d1[28] ? din1_d1 :
			wen2_dec_d1[28] ? din2_d1 : vec[28] ;
assign	vec_n[29]  =	wen1_dec_d1[29] ? din1_d1 :
			wen2_dec_d1[29] ? din2_d1 : vec[29] ;
assign	vec_n[30]  =	wen1_dec_d1[30] ? din1_d1 :
			wen2_dec_d1[30] ? din2_d1 : vec[30] ;
assign	vec_n[31]  =	wen1_dec_d1[31] ? din1_d1 :
			wen2_dec_d1[31] ? din2_d1 : vec[31] ;
assign	vec_n[32]  =	wen1_dec_d1[32] ? din1_d1 :
			wen2_dec_d1[32] ? din2_d1 : vec[32] ;
assign	vec_n[33]  =	wen1_dec_d1[33] ? din1_d1 :
			wen2_dec_d1[33] ? din2_d1 : vec[33] ;
assign	vec_n[34]  =	wen1_dec_d1[34] ? din1_d1 :
			wen2_dec_d1[34] ? din2_d1 : vec[34] ;
assign	vec_n[35]  =	wen1_dec_d1[35] ? din1_d1 :
			wen2_dec_d1[35] ? din2_d1 : vec[35] ;
assign	vec_n[36]  =	wen1_dec_d1[36] ? din1_d1 :
			wen2_dec_d1[36] ? din2_d1 : vec[36] ;
assign	vec_n[37]  =	wen1_dec_d1[37] ? din1_d1 :
			wen2_dec_d1[37] ? din2_d1 : vec[37] ;
assign	vec_n[38]  =	wen1_dec_d1[38] ? din1_d1 :
			wen2_dec_d1[38] ? din2_d1 : vec[38] ;
assign	vec_n[39]  =	wen1_dec_d1[39] ? din1_d1 :
			wen2_dec_d1[39] ? din2_d1 : vec[39] ;
assign	vec_n[40]  =	wen1_dec_d1[40] ? din1_d1 :
			wen2_dec_d1[40] ? din2_d1 : vec[40] ;
assign	vec_n[41]  =	wen1_dec_d1[41] ? din1_d1 :
			wen2_dec_d1[41] ? din2_d1 : vec[41] ;
assign	vec_n[42]  =	wen1_dec_d1[42] ? din1_d1 :
			wen2_dec_d1[42] ? din2_d1 : vec[42] ;
assign	vec_n[43]  =	wen1_dec_d1[43] ? din1_d1 :
			wen2_dec_d1[43] ? din2_d1 : vec[43] ;
assign	vec_n[44]  =	wen1_dec_d1[44] ? din1_d1 :
			wen2_dec_d1[44] ? din2_d1 : vec[44] ;
assign	vec_n[45]  =	wen1_dec_d1[45] ? din1_d1 :
			wen2_dec_d1[45] ? din2_d1 : vec[45] ;
assign	vec_n[46]  =	wen1_dec_d1[46] ? din1_d1 :
			wen2_dec_d1[46] ? din2_d1 : vec[46] ;
assign	vec_n[47]  =	wen1_dec_d1[47] ? din1_d1 :
			wen2_dec_d1[47] ? din2_d1 : vec[47] ;
assign	vec_n[48]  =	wen1_dec_d1[48] ? din1_d1 :
			wen2_dec_d1[48] ? din2_d1 : vec[48] ;
assign	vec_n[49]  =	wen1_dec_d1[49] ? din1_d1 :
			wen2_dec_d1[49] ? din2_d1 : vec[49] ;
assign	vec_n[50]  =	wen1_dec_d1[50] ? din1_d1 :
			wen2_dec_d1[50] ? din2_d1 : vec[50] ;
assign	vec_n[51]  =	wen1_dec_d1[51] ? din1_d1 :
			wen2_dec_d1[51] ? din2_d1 : vec[51] ;
assign	vec_n[52]  =	wen1_dec_d1[52] ? din1_d1 :
			wen2_dec_d1[52] ? din2_d1 : vec[52] ;
assign	vec_n[53]  =	wen1_dec_d1[53] ? din1_d1 :
			wen2_dec_d1[53] ? din2_d1 : vec[53] ;
assign	vec_n[54]  =	wen1_dec_d1[54] ? din1_d1 :
			wen2_dec_d1[54] ? din2_d1 : vec[54] ;
assign	vec_n[55]  =	wen1_dec_d1[55] ? din1_d1 :
			wen2_dec_d1[55] ? din2_d1 : vec[55] ;
assign	vec_n[56]  =	wen1_dec_d1[56] ? din1_d1 :
			wen2_dec_d1[56] ? din2_d1 : vec[56] ;
assign	vec_n[57]  =	wen1_dec_d1[57] ? din1_d1 :
			wen2_dec_d1[57] ? din2_d1 : vec[57] ;
assign	vec_n[58]  =	wen1_dec_d1[58] ? din1_d1 :
			wen2_dec_d1[58] ? din2_d1 : vec[58] ;
assign	vec_n[59]  =	wen1_dec_d1[59] ? din1_d1 :
			wen2_dec_d1[59] ? din2_d1 : vec[59] ;
assign	vec_n[60]  =	wen1_dec_d1[60] ? din1_d1 :
			wen2_dec_d1[60] ? din2_d1 : vec[60] ;
assign	vec_n[61]  =	wen1_dec_d1[61] ? din1_d1 :
			wen2_dec_d1[61] ? din2_d1 : vec[61] ;
assign	vec_n[62]  =	wen1_dec_d1[62] ? din1_d1 :
			wen2_dec_d1[62] ? din2_d1 : vec[62] ;
assign	vec_n[63]  =	wen1_dec_d1[63] ? din1_d1 :
			wen2_dec_d1[63] ? din2_d1 : vec[63] ;

// FF's for storage


assign	vec_n_inv[63:0] = ~vec_n[63:0] ;
assign	vec[63:0] = ~vec_inv[63:0] ;

ncu_c2ifd_ctl_msff_ctl_macro__width_64 vec_ff 
				(
				.scan_in(vec_ff_scanin),
				.scan_out(vec_ff_scanout),
				.dout		(vec_inv[63:0]),
				.l1clk		(l1clk),
				.din		(vec_n_inv[63:0]),
  .siclk(siclk),
  .soclk(soclk)
				);
// send vec to other clock domanin
ncu_c2ifd_ctl_msff_ctl_macro__en_1__width_64 mondo_busy_vec_ff  
				(
				.scan_in(mondo_busy_vec_ff_scanin),
				.scan_out(mondo_busy_vec_ff_scanout),
				.dout		(mondo_busy_vec_f[63:0]),
				.l1clk		(l1clk),
				.en		(cmp_io_sync_en),
				.din		(vec[63:0]),
  .siclk(siclk),
  .soclk(soclk)
				);
// flop read address
ncu_c2ifd_ctl_msff_ctl_macro__width_6 rd_a_d1_ff 
				(
				.scan_in(rd_a_d1_ff_scanin),
				.scan_out(rd_a_d1_ff_scanout),
				.dout		(rd_a_d1[5:0]),
				.l1clk		(l1clk),
				.din		(mondo_busy_addr_p0[5:0]),
  .siclk(siclk),
  .soclk(soclk)
				);

assign	rd_a_dec_d1[63:0] = 64'h0000_0000_0000_0001 << rd_a_d1[5:0];
   
assign	mondo_busy_dout_d1 = |(vec[63:0] & rd_a_dec_d1[63:0]);
ncu_c2ifd_ctl_msff_ctl_macro__width_1 mondo_busy_dout_d2_ff 
				(
				.scan_in(mondo_busy_dout_d2_ff_scanin),
				.scan_out(mondo_busy_dout_d2_ff_scanout),
				.dout		(mondo_busy_dout_d2),
				.l1clk		(l1clk),
				.din		(mondo_busy_dout_d1),
  .siclk(siclk),
  .soclk(soclk)
				);

//================================================ mondo_busy =======
//===================================================================
//===================================================================





/**** adding clock header ****/
ncu_c2ifd_ctl_l1clkhdr_ctl_macro clkgen (
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
assign pcx_ncu_data_ff_scanin    = scan_in                  ;
assign pcx_ncu_vld_ff_scanin     = pcx_ncu_data_ff_scanout  ;
assign io_mondo_data0_din_ff_scanin = pcx_ncu_vld_ff_scanout   ;
assign io_mondo_data1_din_ff_scanin = io_mondo_data0_din_ff_scanout;
assign tap_mondo_din_ff_scanin   = io_mondo_data1_din_ff_scanout;
assign mondo_data0_din_d1_ff_scanin = tap_mondo_din_ff_scanout ;
assign mondo_data0_din_d2_ff_scanin = mondo_data0_din_d1_ff_scanout;
assign mondo_data1_din_d1_ff_scanin = mondo_data0_din_d2_ff_scanout;
assign mondo_data1_din_d2_ff_scanin = mondo_data1_din_d1_ff_scanout;
assign mondo_addr_creg_mbusy_dec_d3_ff_scanin = mondo_data1_din_d2_ff_scanout;
assign mondo_dout_d1_ff_scanin   = mondo_addr_creg_mbusy_dec_d3_ff_scanout;
assign mondotbl_pei_ff_scanin    = mondo_dout_d1_ff_scanout ;
assign mtbl_perr_hldr_ff_scanin  = mondotbl_pei_ff_scanout ;
assign mondotbl_pe_f_ff_scanin   = mtbl_perr_hldr_ff_scanout;
assign cpu_mondo_cpu_id_d1_ff_scanin = mondotbl_pe_f_ff_scanout ;
assign cpu_mondo_cpu_id_d2_ff_scanin = cpu_mondo_cpu_id_d1_ff_scanout;
assign cpu_mondo_thr_id_d1_ff_scanin = cpu_mondo_cpu_id_d2_ff_scanout;
assign cpu_mondo_thr_id_d2_ff_scanin = cpu_mondo_thr_id_d1_ff_scanout;
assign cpu_mondo_bis_d1_ff_scanin = cpu_mondo_thr_id_d2_ff_scanout;
assign cpu_mondo_bis_d2_ff_scanin = cpu_mondo_bis_d1_ff_scanout;
assign cpu_mondo_addr10_3_d1_ff_scanin = cpu_mondo_bis_d2_ff_scanout;
assign cpu_mondo_addr10_3_d2_ff_scanin = cpu_mondo_addr10_3_d1_ff_scanout;
assign cpu_mondo_size_d1_ff_scanin = cpu_mondo_addr10_3_d2_ff_scanout;
assign cpu_mondo_size_d2_ff_scanin = cpu_mondo_size_d1_ff_scanout;
assign pcx_pkt_data_d1_ff_scanin = cpu_mondo_size_d2_ff_scanout;
assign pcx_pkt_data_d2_ff_scanin = pcx_pkt_data_d1_ff_scanout;
assign mondo2cpu_pkt_ff_scanin   = pcx_pkt_data_d2_ff_scanout;
assign cpu_mondo_rd_d3_ff_scanin = mondo2cpu_pkt_ff_scanout ;
assign tap_mondo_dout_d2_ff_scanin = cpu_mondo_rd_d3_ff_scanout;
assign tap_mondo_dout_d2_f_ff_scanin = tap_mondo_dout_d2_ff_scanout;
assign wr1_a_d1_ff_scanin        = tap_mondo_dout_d2_f_ff_scanout;
assign wr2_a_d1_ff_scanin        = wr1_a_d1_ff_scanout      ;
assign din1_d1_ff_scanin         = wr2_a_d1_ff_scanout      ;
assign din2_d1_ff_scanin         = din1_d1_ff_scanout       ;
assign wen1_d1_ff_scanin         = din2_d1_ff_scanout       ;
assign wen2_d1_ff_scanin         = wen1_d1_ff_scanout       ;
assign vec_ff_scanin             = wen2_d1_ff_scanout       ;
assign mondo_busy_vec_ff_scanin  = vec_ff_scanout           ;
assign rd_a_d1_ff_scanin         = mondo_busy_vec_ff_scanout;
assign mondo_busy_dout_d2_ff_scanin = rd_a_d1_ff_scanout       ;
assign scan_out                  = mondo_busy_dout_d2_ff_scanout;
// fixscan end:
endmodule // c2i_fdp

// Local Variables:
// verilog-auto-sense-defines-constant:t
// End:






// any PARAMS parms go into naming of macro

module ncu_c2ifd_ctl_msff_ctl_macro__width_129 (
  din, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [128:0] fdin;
wire [127:0] so;

  input [128:0] din;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [128:0] dout;
  output scan_out;
assign fdin[128:0] = din[128:0];






dff #(129)  d0_0 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[128:0]),
.si({scan_in,so[127:0]}),
.so({so[127:0],scan_out}),
.q(dout[128:0])
);












endmodule













// any PARAMS parms go into naming of macro

module ncu_c2ifd_ctl_msff_ctl_macro__width_1 (
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

module ncu_c2ifd_ctl_msff_ctl_macro__en_1__width_64 (
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

module ncu_c2ifd_ctl_msff_ctl_macro__width_72 (
  din, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [71:0] fdin;
wire [70:0] so;

  input [71:0] din;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [71:0] dout;
  output scan_out;
assign fdin[71:0] = din[71:0];






dff #(72)  d0_0 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[71:0]),
.si({scan_in,so[70:0]}),
.so({so[70:0],scan_out}),
.q(dout[71:0])
);












endmodule













// any PARAMS parms go into naming of macro

module ncu_c2ifd_ctl_msff_ctl_macro__en_1__width_1 (
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

module ncu_c2ifd_ctl_msff_ctl_macro__width_3 (
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

module ncu_c2ifd_ctl_msff_ctl_macro__width_8 (
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

module ncu_c2ifd_ctl_msff_ctl_macro__width_64 (
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

module ncu_c2ifd_ctl_msff_ctl_macro__width_122 (
  din, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [121:0] fdin;
wire [120:0] so;

  input [121:0] din;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [121:0] dout;
  output scan_out;
assign fdin[121:0] = din[121:0];






dff #(122)  d0_0 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[121:0]),
.si({scan_in,so[120:0]}),
.so({so[120:0],scan_out}),
.q(dout[121:0])
);












endmodule













// any PARAMS parms go into naming of macro

module ncu_c2ifd_ctl_msff_ctl_macro__width_6 (
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

module ncu_c2ifd_ctl_l1clkhdr_ctl_macro (
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








