// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: ncu_c2ifc_ctl.v
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










module ncu_c2ifc_ctl (
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
  pcx_ncu_data_rdy_px1, 
  ncu_pcx_stall_pq, 
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
  cpu_mondo_addr_invld_d2, 
  cpubuf_head_s, 
  cpubuf_tail_f, 
  intbuf_wr, 
  intbuf_wr2i2c, 
  cpu_mondo_rd_d2, 
  intbuf_hit_hwm, 
  io_mondo_data_wr_s, 
  io_mondo_data_wr_addr_s, 
  tap_mondo_acc_addr_s, 
  tap_mondo_acc_seq_s, 
  tap_mondo_wr_s, 
  tap_mondo_acc_addr_invld_d2_f, 
  tap_mondo_acc_seq_d2_f, 
  mondo_data_addr_p0, 
  mondo_busy_addr_p0, 
  mondo_data_addr_p1, 
  mondo_busy_addr_p1, 
  mondo_busy_wr_p1, 
  mondo_busy_addr_p2, 
  mondo_busy_wr_p2, 
  mondo_data0_wr, 
  mondo_data1_wr, 
  cpubuf_wr, 
  cpubuf_tail_ptr, 
  mb0_mondo_wr_en, 
  mb0_waddr, 
  mb0_raddr, 
  mb0_run, 
  mb1_run, 
  mb1_waddr, 
  mb1_cpubuf_wr_en, 
  mb0_intbuf_wr_en) ;
wire pcx_ncu_data_rdy_px2_ff_scanin;
wire pcx_ncu_data_rdy_px2_ff_scanout;
wire pcx_ncu_data_rdy_px2;
wire l1clk;
wire pcx_ncu_data_rdy_ff_scanin;
wire pcx_ncu_data_rdy_ff_scanout;
wire pcx_ncu_data_rdy;
wire cpu_mondo_acc;
wire cpu_mondo_rd;
wire cpu_mondo_wr;
wire cpu_mondo_rd_d1_ff_scanin;
wire cpu_mondo_rd_d1_ff_scanout;
wire cpu_mondo_rd_d1;
wire cpu_mondo_rd_d2_ff_scanin;
wire cpu_mondo_rd_d2_ff_scanout;
wire cpu_mondo_wr_d1_ff_scanin;
wire cpu_mondo_wr_d1_ff_scanout;
wire cpu_mondo_wr_d1;
wire cpu_mondo_wr_d2_ff_scanin;
wire cpu_mondo_wr_d2_ff_scanout;
wire cpu_mondo_wr_d2;
wire cpu_mondo_rd_wr;
wire cpu_mondo_rd_wr_d2;
wire cpu_mondo_rd_wr_ff_scanin;
wire cpu_mondo_rd_wr_ff_scanout;
wire intbuf_wr2i2c_ff_scanin;
wire intbuf_wr2i2c_ff_scanout;
wire c_creg_mdata0_alias_dec;
wire c_creg_mdata1_alias_dec;
wire c_creg_mbusy_alias_dec;
wire c_creg_mdata0_proper_dec;
wire c_creg_mdata1_proper_dec;
wire c_creg_mbusy_proper_dec;
wire c_use_thr_addr;
wire [5:0] cpu_mondo_data_addr;
wire cpu_mondo_addr_creg_mdata0_dec;
wire cpu_mondo_addr_creg_mdata1_dec;
wire cpu_mondo_addr_creg_mbusy_dec;
wire cpu_mondo_addr_invld;
wire cpu_mondo_addr_creg_mdata0_dec_d1_ff_scanin;
wire cpu_mondo_addr_creg_mdata0_dec_d1_ff_scanout;
wire cpu_mondo_addr_creg_mdata0_dec_d1;
wire cpu_mondo_addr_creg_mdata1_dec_d1_ff_scanin;
wire cpu_mondo_addr_creg_mdata1_dec_d1_ff_scanout;
wire cpu_mondo_addr_creg_mdata1_dec_d1;
wire cpu_mondo_addr_creg_mbusy_dec_d1_ff_scanin;
wire cpu_mondo_addr_creg_mbusy_dec_d1_ff_scanout;
wire cpu_mondo_addr_creg_mbusy_dec_d1;
wire cpu_mondo_addr_invld_d1_ff_scanin;
wire cpu_mondo_addr_invld_d1_ff_scanout;
wire cpu_mondo_addr_invld_d1;
wire cpu_mondo_addr_invld_d2_ff_scanin;
wire cpu_mondo_addr_invld_d2_ff_scanout;
wire io_mondo_data_wr_ff_scanin;
wire io_mondo_data_wr_ff_scanout;
wire io_mondo_data_addr_ff_scanin;
wire io_mondo_data_addr_ff_scanout;
wire [5:0] io_mondo_data_addr;
wire tap_mondo_acc_addr_ff_scanin;
wire tap_mondo_acc_addr_ff_scanout;
wire [21:0] tap_mondo_acc_addr;
wire t_creg_mdata0_alias_dec;
wire t_creg_mdata1_alias_dec;
wire t_creg_mbusy_alias_dec;
wire t_creg_mdata0_proper_dec;
wire t_creg_mdata1_proper_dec;
wire t_creg_mbusy_proper_dec;
wire t_use_thr_addr;
wire [5:0] tap_mondo_data_addr;
wire tap_mondo_addr_creg_mdata0_dec;
wire tap_mondo_addr_creg_mdata1_dec;
wire tap_mondo_addr_creg_mbusy_dec;
wire tap_mondo_addr_invld;
wire tap_mondo_addr_creg_mdata0_dec_d1_ff_scanin;
wire tap_mondo_addr_creg_mdata0_dec_d1_ff_scanout;
wire tap_mondo_addr_creg_mdata0_dec_d1;
wire tap_mondo_acc;
wire tap_mondo_addr_creg_mdata1_dec_d1_ff_scanin;
wire tap_mondo_addr_creg_mdata1_dec_d1_ff_scanout;
wire tap_mondo_addr_creg_mdata1_dec_d1;
wire tap_mondo_addr_creg_mbusy_dec_d1_ff_scanin;
wire tap_mondo_addr_creg_mbusy_dec_d1_ff_scanout;
wire tap_mondo_addr_creg_mbusy_dec_d1;
wire tap_mondo_addr_invld_d1_ff_scanin;
wire tap_mondo_addr_invld_d1_ff_scanout;
wire tap_mondo_addr_invld_d1;
wire tap_mondo_addr_invld_d2_ff_scanin;
wire tap_mondo_addr_invld_d2_ff_scanout;
wire tap_mondo_addr_invld_d2;
wire tap_mondo_acc_addr_invld_d2_f_ff_scanin;
wire tap_mondo_acc_addr_invld_d2_f_ff_scanout;
wire tap_mondo_acc_seq_ff_scanin;
wire tap_mondo_acc_seq_ff_scanout;
wire tap_mondo_acc_seq;
wire tap_mondo_acc_seq_d1_ff_scanin;
wire tap_mondo_acc_seq_d1_ff_scanout;
wire tap_mondo_acc_seq_d1;
wire tap_mondo_acc_seq_d2_ff_scanin;
wire tap_mondo_acc_seq_d2_ff_scanout;
wire tap_mondo_acc_seq_d2;
wire tap_mondo_acc_seq_d2_f_ff_scanin;
wire tap_mondo_acc_seq_d2_f_ff_scanout;
wire tap_mondo_wr_ff_scanin;
wire tap_mondo_wr_ff_scanout;
wire tap_mondo_wr;
wire tap_mondo_rd;
wire tap_mondo_rd_d1_ff_scanin;
wire tap_mondo_rd_d1_ff_scanout;
wire tap_mondo_rd_d1;
wire tap_mondo_rd_d2_ff_scanin;
wire tap_mondo_rd_d2_ff_scanout;
wire mondo_addr_creg_mdata0_dec_d1;
wire mondo_addr_creg_mdata0_dec_d2_ff_scanin;
wire mondo_addr_creg_mdata0_dec_d2_ff_scanout;
wire mondo_addr_creg_mdata1_dec_d1;
wire mondo_addr_creg_mdata1_dec_d2_ff_scanin;
wire mondo_addr_creg_mdata1_dec_d2_ff_scanout;
wire mondo_addr_creg_mbusy_dec_d1;
wire mondo_addr_creg_mbusy_dec_d2_ff_scanin;
wire mondo_addr_creg_mbusy_dec_d2_ff_scanout;
wire mondo_data0_wr_f;
wire mondo_data1_wr_f;
wire mondo_data_wr_d1_ff_scanin;
wire mondo_data_wr_d1_ff_scanout;
wire mondo_data_wr_d1;
wire mondo_data_addr_p0_d1_ff_scanin;
wire mondo_data_addr_p0_d1_ff_scanout;
wire [5:0] mondo_data_addr_p0_d1;
wire mondo_data_addr_p1_d1_ff_scanin;
wire mondo_data_addr_p1_d1_ff_scanout;
wire [5:0] mondo_data_addr_p1_d1;
wire mondo_data_bypass_d1;
wire mondo_data_bypass_d2_ff_scanin;
wire mondo_data_bypass_d2_ff_scanout;
wire cpubuf_tail_ff_scanin;
wire cpubuf_tail_ff_scanout;
wire [5:0] cpubuf_tail;
wire [5:0] cpubuf_tail_plus;
wire cpubuf_tail_f_ff_scanin;
wire cpubuf_tail_f_ff_scanout;
wire cpubuf_head_ff_scanin;
wire cpubuf_head_ff_scanout;
wire [5:0] cpubuf_head;
wire [5:0] cpubuf_tail_plus6;
wire cpubuf_hit_hwm;
wire ncu_pcx_stall_pq_ff_scanin;
wire ncu_pcx_stall_pq_ff_scanout;
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

input		tcu_scan_en;
input		scan_in;
output		scan_out;
input		tcu_pce_ov;
input		tcu_clk_stop;
input		tcu_aclk;
input		tcu_bclk;

// Crossbar interface
input		pcx_ncu_data_rdy_px1;
output		ncu_pcx_stall_pq;
 
// c2i fast datapath interface
input		pcx_ncu_vld;
input [4:0]	pcx_ncu_req;
input [39:0]	pcx_ncu_addr;
input [5:0]	pcx_ncu_cputhr;
 			      
output		io_mondo_data_wr;
output		mondo_data_bypass_d2;
output		mondo_addr_creg_mdata0_dec_d2;
output		mondo_addr_creg_mdata1_dec_d2;
output		mondo_addr_creg_mbusy_dec_d2;
output		tap_mondo_rd_d2;
output		cpu_mondo_addr_invld_d2;

// c2i slow control interface
input [5:0]	cpubuf_head_s;
output [5:0]	cpubuf_tail_f;

// i2c fast control interface
output		intbuf_wr;
output		intbuf_wr2i2c;
output		cpu_mondo_rd_d2;

input		intbuf_hit_hwm;

// i2c slow control interface
input		io_mondo_data_wr_s;

// i2c slow datapath interface
input [5:0]	io_mondo_data_wr_addr_s;

// IOB control interface
input [21:0]	tap_mondo_acc_addr_s;
input		tap_mondo_acc_seq_s;
input		tap_mondo_wr_s;
output		tap_mondo_acc_addr_invld_d2_f;
output		tap_mondo_acc_seq_d2_f;

// Mondo data table interface
output [5:0]	mondo_data_addr_p0;
output [5:0]	mondo_busy_addr_p0;

output [5:0]	mondo_data_addr_p1;
output [5:0]	mondo_busy_addr_p1;
output		mondo_busy_wr_p1;

output [5:0]	mondo_busy_addr_p2;
output		mondo_busy_wr_p2;

output		mondo_data0_wr;
output		mondo_data1_wr;

// Cpu buffer interface
output		cpubuf_wr;
output [4:0]	cpubuf_tail_ptr;

// mb0 signals //
input		mb0_mondo_wr_en;
input [5:0]	mb0_waddr;
input [5:0]	mb0_raddr;
input 		mb0_run;
input		mb1_run;
input[5:0]	mb1_waddr;
input		mb1_cpubuf_wr_en;
input		mb0_intbuf_wr_en;



// Internal signals









/*****************************************************************
 * Read/Write request to the interrupt status table, mondo data tables,
 * and mondo busy table from CPU.
 * Write will not update the tables (only generates ack) except the
 * mondo busy bit because the entries are read-only by software.
 *****************************************************************/ 
ncu_c2ifc_ctl_msff_ctl_macro__width_1 pcx_ncu_data_rdy_px2_ff 
				(
				.scan_in(pcx_ncu_data_rdy_px2_ff_scanin),
				.scan_out(pcx_ncu_data_rdy_px2_ff_scanout),
				.dout		(pcx_ncu_data_rdy_px2),
				.l1clk		(l1clk),
				.din		(pcx_ncu_data_rdy_px1),
  .siclk(siclk),
  .soclk(soclk)
				);

ncu_c2ifc_ctl_msff_ctl_macro__width_1 pcx_ncu_data_rdy_ff 
				(
				.scan_in(pcx_ncu_data_rdy_ff_scanin),
				.scan_out(pcx_ncu_data_rdy_ff_scanout),
				.dout		(pcx_ncu_data_rdy),
				.l1clk		(l1clk),
				.din		(pcx_ncu_data_rdy_px2),
  .siclk(siclk),
  .soclk(soclk)
				);

   // Check address to see if request is mondo data, or mondo busy.
   // They are all in the NCU_MONDO CSR space.
assign	cpu_mondo_acc = pcx_ncu_data_rdy & pcx_ncu_vld &
	                (pcx_ncu_addr[39:16] == {`NCU_CSR,`NCU_CSR_MONDO});

assign 	cpu_mondo_rd = cpu_mondo_acc & (pcx_ncu_req[4:0] == `PCX_LOAD_RQ);

//jimmy : this will only cause a wr ack back to source cputhr //
assign 	cpu_mondo_wr = cpu_mondo_acc & (pcx_ncu_req[4:0] == `PCX_STORE_RQ);

ncu_c2ifc_ctl_msff_ctl_macro__width_1 cpu_mondo_rd_d1_ff 
				(
				.scan_in(cpu_mondo_rd_d1_ff_scanin),
				.scan_out(cpu_mondo_rd_d1_ff_scanout),
				.dout		(cpu_mondo_rd_d1),
				.l1clk		(l1clk),
				.din		(cpu_mondo_rd),
  .siclk(siclk),
  .soclk(soclk)
				);

ncu_c2ifc_ctl_msff_ctl_macro__width_1 cpu_mondo_rd_d2_ff 
				(
				.scan_in(cpu_mondo_rd_d2_ff_scanin),
				.scan_out(cpu_mondo_rd_d2_ff_scanout),
				.dout		(cpu_mondo_rd_d2),
				.l1clk		(l1clk),
				.din		(cpu_mondo_rd_d1),
  .siclk(siclk),
  .soclk(soclk)
				);

ncu_c2ifc_ctl_msff_ctl_macro__width_1 cpu_mondo_wr_d1_ff 
				(
				.scan_in(cpu_mondo_wr_d1_ff_scanin),
				.scan_out(cpu_mondo_wr_d1_ff_scanout),
				.dout		(cpu_mondo_wr_d1),
				.l1clk		(l1clk),
				.din		(cpu_mondo_wr),
  .siclk(siclk),
  .soclk(soclk)
				);

ncu_c2ifc_ctl_msff_ctl_macro__width_1 cpu_mondo_wr_d2_ff 
				(
				.scan_in(cpu_mondo_wr_d2_ff_scanin),
				.scan_out(cpu_mondo_wr_d2_ff_scanout),
				.dout		(cpu_mondo_wr_d2),
				.l1clk		(l1clk),
				.din		(cpu_mondo_wr_d1),
  .siclk(siclk),
  .soclk(soclk)
				);

assign		intbuf_wr = mb0_run ? mb0_intbuf_wr_en : cpu_mondo_rd_wr ;
assign 		cpu_mondo_rd_wr_d2 = (cpu_mondo_rd_d2 | cpu_mondo_wr_d2) ;
//assign		intbuf_wr_n = mb0_run ? mb0_intbuf_wr_en : (cpu_mondo_rd_d2 | cpu_mondo_wr_d2) ;

/*
msff_ctl_macro intbuf_wr_ff (width=1)
				(
				.scan_in(intbuf_wr_ff_scanin),
				.scan_out(intbuf_wr_ff_scanout),
				.dout		(intbuf_wr),
				.l1clk		(l1clk),
				.din		(intbuf_wr_n)
				);
*/

ncu_c2ifc_ctl_msff_ctl_macro__width_1 cpu_mondo_rd_wr_ff 
				(
				.scan_in(cpu_mondo_rd_wr_ff_scanin),
				.scan_out(cpu_mondo_rd_wr_ff_scanout),
				.dout		(cpu_mondo_rd_wr),
				.l1clk		(l1clk),
				.din		(cpu_mondo_rd_wr_d2),
  .siclk(siclk),
  .soclk(soclk)
				);


ncu_c2ifc_ctl_msff_ctl_macro__width_1 intbuf_wr2i2c_ff 
				(
				.scan_in(intbuf_wr2i2c_ff_scanin),
				.scan_out(intbuf_wr2i2c_ff_scanout),
				.dout		(intbuf_wr2i2c),
				.l1clk		(l1clk),
				//.din		(intbuf_wr_n)
				.din 	(cpu_mondo_rd_wr_d2),
  .siclk(siclk),
  .soclk(soclk)
				);

/*******************************************************
 * Decode cpu side address to access interrupt table 
 *******************************************************/

///*iobdg_int_mondo_addr_dec cpu_mondo_addr_dec (.addr_in(pcx_ncu_addr[39:0]),
//				    	.thr_id_in(pcx_ncu_cputhr[5:0]),
//				    	.creg_mdata0_dec(cpu_mondo_addr_creg_mdata0_dec),
//				    	.creg_mdata1_dec(cpu_mondo_addr_creg_mdata1_dec),
//				    	.creg_mbusy_dec(cpu_mondo_addr_creg_mbusy_dec),
//				    	.mondo_data_addr(cpu_mondo_data_addr[5:0]),
//				    	.addr_invld(cpu_mondo_addr_invld)); */
assign  c_creg_mdata0_alias_dec = (pcx_ncu_addr[15:0] == `NCU_CREG_MDATA0_ALIAS );
assign  c_creg_mdata1_alias_dec = (pcx_ncu_addr[15:0] == `NCU_CREG_MDATA1_ALIAS );
assign  c_creg_mbusy_alias_dec  = (pcx_ncu_addr[15:0] == `NCU_CREG_MBUSY_ALIAS );

// 16'hff07
assign  c_creg_mdata0_proper_dec = ((pcx_ncu_addr[15:0]&16'hfe07) == `NCU_CREG_MDATA0 );
assign  c_creg_mdata1_proper_dec = ((pcx_ncu_addr[15:0]&16'hfe07) == `NCU_CREG_MDATA1 );
assign  c_creg_mbusy_proper_dec  = ((pcx_ncu_addr[15:0]&16'hfe07) == `NCU_CREG_MBUSY );

assign	c_use_thr_addr = c_creg_mdata0_alias_dec |
		         c_creg_mdata1_alias_dec |
		         c_creg_mbusy_alias_dec;

assign	cpu_mondo_data_addr[5:0] = c_use_thr_addr ? pcx_ncu_cputhr[5:0] : pcx_ncu_addr[8:3];

assign	cpu_mondo_addr_creg_mdata0_dec = c_creg_mdata0_proper_dec | c_creg_mdata0_alias_dec;
assign	cpu_mondo_addr_creg_mdata1_dec = c_creg_mdata1_proper_dec | c_creg_mdata1_alias_dec;
assign	cpu_mondo_addr_creg_mbusy_dec  = c_creg_mbusy_proper_dec  | c_creg_mbusy_alias_dec;

assign	cpu_mondo_addr_invld = ~cpu_mondo_addr_creg_mdata0_dec &
				~cpu_mondo_addr_creg_mdata1_dec &
				~cpu_mondo_addr_creg_mbusy_dec ;

					
ncu_c2ifc_ctl_msff_ctl_macro__width_1 cpu_mondo_addr_creg_mdata0_dec_d1_ff 
				(
				.scan_in(cpu_mondo_addr_creg_mdata0_dec_d1_ff_scanin),
				.scan_out(cpu_mondo_addr_creg_mdata0_dec_d1_ff_scanout),
				.dout		(cpu_mondo_addr_creg_mdata0_dec_d1),
				.l1clk		(l1clk),
				.din		(cpu_mondo_addr_creg_mdata0_dec),
  .siclk(siclk),
  .soclk(soclk)
				);

ncu_c2ifc_ctl_msff_ctl_macro__width_1 cpu_mondo_addr_creg_mdata1_dec_d1_ff 
				(
				.scan_in(cpu_mondo_addr_creg_mdata1_dec_d1_ff_scanin),
				.scan_out(cpu_mondo_addr_creg_mdata1_dec_d1_ff_scanout),
				.dout		(cpu_mondo_addr_creg_mdata1_dec_d1),
				.l1clk		(l1clk),
				.din		(cpu_mondo_addr_creg_mdata1_dec),
  .siclk(siclk),
  .soclk(soclk)
				);

ncu_c2ifc_ctl_msff_ctl_macro__width_1 cpu_mondo_addr_creg_mbusy_dec_d1_ff 
				(
				.scan_in(cpu_mondo_addr_creg_mbusy_dec_d1_ff_scanin),
				.scan_out(cpu_mondo_addr_creg_mbusy_dec_d1_ff_scanout),
				.dout		(cpu_mondo_addr_creg_mbusy_dec_d1),
				.l1clk		(l1clk),
				.din		(cpu_mondo_addr_creg_mbusy_dec),
  .siclk(siclk),
  .soclk(soclk)
				);

ncu_c2ifc_ctl_msff_ctl_macro__width_1 cpu_mondo_addr_invld_d1_ff 
				(
				.scan_in(cpu_mondo_addr_invld_d1_ff_scanin),
				.scan_out(cpu_mondo_addr_invld_d1_ff_scanout),
				.dout		(cpu_mondo_addr_invld_d1),
				.l1clk		(l1clk),
				.din		(cpu_mondo_addr_invld),
  .siclk(siclk),
  .soclk(soclk)
				);

ncu_c2ifc_ctl_msff_ctl_macro__width_1 cpu_mondo_addr_invld_d2_ff 
				(
				.scan_in(cpu_mondo_addr_invld_d2_ff_scanin),
				.scan_out(cpu_mondo_addr_invld_d2_ff_scanout),
				.dout		(cpu_mondo_addr_invld_d2),
				.l1clk		(l1clk),
				.din		(cpu_mondo_addr_invld_d1),
  .siclk(siclk),
  .soclk(soclk)
				);
  
/*****************************************************************
 * Write request to the mondo data0, mondo data1, mondo busy table
 * from JBI
 *****************************************************************/
 // Write will be asserted for multiple cycles.  That's okay.  The
 // same entry in the array will be written several times.
ncu_c2ifc_ctl_msff_ctl_macro__en_1__width_1 io_mondo_data_wr_ff  
				(
				.scan_in(io_mondo_data_wr_ff_scanin),
				.scan_out(io_mondo_data_wr_ff_scanout),
				.dout		(io_mondo_data_wr),
				.l1clk		(l1clk),
				.en		(io_cmp_sync_en),
				.din		(io_mondo_data_wr_s),
  .siclk(siclk),
  .soclk(soclk)
				);

ncu_c2ifc_ctl_msff_ctl_macro__en_1__width_6 io_mondo_data_addr_ff  
				(
				.scan_in(io_mondo_data_addr_ff_scanin),
				.scan_out(io_mondo_data_addr_ff_scanout),
				.dout		(io_mondo_data_addr[5:0]),
				.l1clk		(l1clk),
				.en		(io_cmp_sync_en),
				.din		(io_mondo_data_wr_addr_s[5:0]),
  .siclk(siclk),
  .soclk(soclk)
				);

/*****************************************************************
 * Read/Write request to the mondo data, mondo busy table from TAP
 *****************************************************************/ 
// Flop address to convert to cpu clock domain
ncu_c2ifc_ctl_msff_ctl_macro__en_1__width_22 tap_mondo_acc_addr_ff  
				(
				.scan_in(tap_mondo_acc_addr_ff_scanin),
				.scan_out(tap_mondo_acc_addr_ff_scanout),
				.dout		(tap_mondo_acc_addr[21:0]),
				.l1clk		(l1clk),
				.en		(io_cmp_sync_en),
				.din		(tap_mondo_acc_addr_s[21:0]),
  .siclk(siclk),
  .soclk(soclk)
				);

// Decode address to access interrupt table, mondo data, mondo busy
// Thread ID is hardwired to zero.  TAP should use alias address to access
// mondo data table.  If it tries to use the software address, only
// thread 0's entry is accessible.
/*iobdg_int_mondo_addr_dec tap_mondo_addr_dec (.addr_in(tap_mondo_acc_addr),
				    	.thr_id_in(5'b0),
				    	.creg_mdata0_dec(tap_mondo_addr_creg_mdata0_dec),
				    	.creg_mdata1_dec(tap_mondo_addr_creg_mdata1_dec),
				    	.creg_mbusy_dec(tap_mondo_addr_creg_mbusy_dec),
				    	.mondo_data_addr(tap_mondo_data_addr),
				    	.addr_invld(tap_mondo_addr_invld));*/
assign  t_creg_mdata0_alias_dec = (tap_mondo_acc_addr[15:0] == `NCU_CREG_MDATA0_ALIAS );
assign  t_creg_mdata1_alias_dec = (tap_mondo_acc_addr[15:0] == `NCU_CREG_MDATA1_ALIAS );
assign  t_creg_mbusy_alias_dec  = (tap_mondo_acc_addr[15:0] == `NCU_CREG_MBUSY_ALIAS );

// 16'hff07
assign  t_creg_mdata0_proper_dec = ((tap_mondo_acc_addr[15:0]&16'hfe07) == `NCU_CREG_MDATA0 );
assign  t_creg_mdata1_proper_dec = ((tap_mondo_acc_addr[15:0]&16'hfe07) == `NCU_CREG_MDATA1 );
assign  t_creg_mbusy_proper_dec  = ((tap_mondo_acc_addr[15:0]&16'hfe07) == `NCU_CREG_MBUSY );

assign	t_use_thr_addr = t_creg_mdata0_alias_dec |
		         t_creg_mdata1_alias_dec |
		         t_creg_mbusy_alias_dec;

assign	tap_mondo_data_addr[5:0] = t_use_thr_addr ? tap_mondo_acc_addr[21:16] : tap_mondo_acc_addr[8:3];

assign	tap_mondo_addr_creg_mdata0_dec = t_creg_mdata0_proper_dec | t_creg_mdata0_alias_dec;
assign	tap_mondo_addr_creg_mdata1_dec = t_creg_mdata1_proper_dec | t_creg_mdata1_alias_dec;
assign	tap_mondo_addr_creg_mbusy_dec  = t_creg_mbusy_proper_dec  | t_creg_mbusy_alias_dec;

assign	tap_mondo_addr_invld = ~tap_mondo_addr_creg_mdata0_dec &
				~tap_mondo_addr_creg_mdata1_dec &
				~tap_mondo_addr_creg_mbusy_dec ;


ncu_c2ifc_ctl_msff_ctl_macro__en_1__width_1 tap_mondo_addr_creg_mdata0_dec_d1_ff  
				(
				.scan_in(tap_mondo_addr_creg_mdata0_dec_d1_ff_scanin),
				.scan_out(tap_mondo_addr_creg_mdata0_dec_d1_ff_scanout),
				.dout		(tap_mondo_addr_creg_mdata0_dec_d1),
				.l1clk		(l1clk),
				.en		(tap_mondo_acc),
				.din		(tap_mondo_addr_creg_mdata0_dec),
  .siclk(siclk),
  .soclk(soclk)
				);

ncu_c2ifc_ctl_msff_ctl_macro__en_1__width_1 tap_mondo_addr_creg_mdata1_dec_d1_ff  
				(
				.scan_in(tap_mondo_addr_creg_mdata1_dec_d1_ff_scanin),
				.scan_out(tap_mondo_addr_creg_mdata1_dec_d1_ff_scanout),
				.dout		(tap_mondo_addr_creg_mdata1_dec_d1),
				.l1clk		(l1clk),
				.en		(tap_mondo_acc),
				.din		(tap_mondo_addr_creg_mdata1_dec),
  .siclk(siclk),
  .soclk(soclk)
				);

ncu_c2ifc_ctl_msff_ctl_macro__en_1__width_1 tap_mondo_addr_creg_mbusy_dec_d1_ff  
				(
				.scan_in(tap_mondo_addr_creg_mbusy_dec_d1_ff_scanin),
				.scan_out(tap_mondo_addr_creg_mbusy_dec_d1_ff_scanout),
				.dout		(tap_mondo_addr_creg_mbusy_dec_d1),
				.l1clk		(l1clk),
				.en		(tap_mondo_acc),
				.din		(tap_mondo_addr_creg_mbusy_dec),
  .siclk(siclk),
  .soclk(soclk)
				);

ncu_c2ifc_ctl_msff_ctl_macro__en_1__width_1 tap_mondo_addr_invld_d1_ff  
				(
				.scan_in(tap_mondo_addr_invld_d1_ff_scanin),
				.scan_out(tap_mondo_addr_invld_d1_ff_scanout),
				.dout		(tap_mondo_addr_invld_d1),
				.l1clk		(l1clk),
				.en		(tap_mondo_acc),
				.din		(tap_mondo_addr_invld),
  .siclk(siclk),
  .soclk(soclk)
				);

ncu_c2ifc_ctl_msff_ctl_macro__width_1 tap_mondo_addr_invld_d2_ff 
				(
				.scan_in(tap_mondo_addr_invld_d2_ff_scanin),
				.scan_out(tap_mondo_addr_invld_d2_ff_scanout),
				.dout		(tap_mondo_addr_invld_d2),
				.l1clk		(l1clk),
				.din		(tap_mondo_addr_invld_d1),
  .siclk(siclk),
  .soclk(soclk)
				);

   // Send result back to BSC clock domain
ncu_c2ifc_ctl_msff_ctl_macro__en_1__width_1 tap_mondo_acc_addr_invld_d2_f_ff  
				(
				.scan_in(tap_mondo_acc_addr_invld_d2_f_ff_scanin),
				.scan_out(tap_mondo_acc_addr_invld_d2_f_ff_scanout),
				.dout		(tap_mondo_acc_addr_invld_d2_f),
				.l1clk		(l1clk),
				.en		(cmp_io_sync_en),
				.din		(tap_mondo_addr_invld_d2),
  .siclk(siclk),
  .soclk(soclk)
				);

   // Flop sequence number to convert to cpu clock domain
ncu_c2ifc_ctl_msff_ctl_macro__en_1__width_1 tap_mondo_acc_seq_ff  
				(
				.scan_in(tap_mondo_acc_seq_ff_scanin),
				.scan_out(tap_mondo_acc_seq_ff_scanout),
				.dout		(tap_mondo_acc_seq),
				.l1clk		(l1clk),
				.en		(io_cmp_sync_en),
				.din		(tap_mondo_acc_seq_s),
  .siclk(siclk),
  .soclk(soclk)
				);

// Keep track of which sequence number has been serviced
ncu_c2ifc_ctl_msff_ctl_macro__en_1__width_1 tap_mondo_acc_seq_d1_ff  
				(
				.scan_in(tap_mondo_acc_seq_d1_ff_scanin),
				.scan_out(tap_mondo_acc_seq_d1_ff_scanout),
				.dout		(tap_mondo_acc_seq_d1),
				.l1clk		(l1clk),
				.en		(tap_mondo_acc),
				.din		(tap_mondo_acc_seq),
  .siclk(siclk),
  .soclk(soclk)
				);

ncu_c2ifc_ctl_msff_ctl_macro__width_1 tap_mondo_acc_seq_d2_ff 
				(
				.scan_in(tap_mondo_acc_seq_d2_ff_scanin),
				.scan_out(tap_mondo_acc_seq_d2_ff_scanout),
				.dout		(tap_mondo_acc_seq_d2),
				.l1clk		(l1clk),
				.din		(tap_mondo_acc_seq_d1),
  .siclk(siclk),
  .soclk(soclk)
				);

   // Send result back to JBUS clock domain
ncu_c2ifc_ctl_msff_ctl_macro__en_1__width_1 tap_mondo_acc_seq_d2_f_ff  
				(
				.scan_in(tap_mondo_acc_seq_d2_f_ff_scanin),
				.scan_out(tap_mondo_acc_seq_d2_f_ff_scanout),
				.dout		(tap_mondo_acc_seq_d2_f),
				.l1clk		(l1clk),
				.en		(cmp_io_sync_en),
				.din		(tap_mondo_acc_seq_d2),
  .siclk(siclk),
  .soclk(soclk)
				);


   // Flop write signal to convert to cpu clock domain
ncu_c2ifc_ctl_msff_ctl_macro__en_1__width_1 tap_mondo_wr_ff  
				(
				.scan_in(tap_mondo_wr_ff_scanin),
				.scan_out(tap_mondo_wr_ff_scanout),
				.dout		(tap_mondo_wr),
				.l1clk		(l1clk),
				.en		(io_cmp_sync_en),
				.din		(tap_mondo_wr_s),
  .siclk(siclk),
  .soclk(soclk)
				);


   // CPU read and IO write has higher priority than TAP read/write
assign 	tap_mondo_acc = ~cpu_mondo_acc &
		        ~io_mondo_data_wr &
	               (tap_mondo_acc_seq != tap_mondo_acc_seq_d1);

assign 	tap_mondo_rd = tap_mondo_acc & ~tap_mondo_wr;

ncu_c2ifc_ctl_msff_ctl_macro__width_1 tap_mondo_rd_d1_ff 
				(
				.scan_in(tap_mondo_rd_d1_ff_scanin),
				.scan_out(tap_mondo_rd_d1_ff_scanout),
				.dout		(tap_mondo_rd_d1),
				.l1clk		(l1clk),
				.din		(tap_mondo_rd),
  .siclk(siclk),
  .soclk(soclk)
				);

ncu_c2ifc_ctl_msff_ctl_macro__width_1 tap_mondo_rd_d2_ff 
				(
				.scan_in(tap_mondo_rd_d2_ff_scanin),
				.scan_out(tap_mondo_rd_d2_ff_scanout),
				.dout		(tap_mondo_rd_d2),
				.l1clk		(l1clk),
				.din		(tap_mondo_rd_d1),
  .siclk(siclk),
  .soclk(soclk)
				);


   /*****************************************************************
    * Mux out decoded signals depending on CPU or TAP access
    *****************************************************************/
assign 	mondo_addr_creg_mdata0_dec_d1 = 
		cpu_mondo_rd_d1 ? cpu_mondo_addr_creg_mdata0_dec_d1 :
		                  tap_mondo_addr_creg_mdata0_dec_d1;

ncu_c2ifc_ctl_msff_ctl_macro__width_1 mondo_addr_creg_mdata0_dec_d2_ff 
				(
				.scan_in(mondo_addr_creg_mdata0_dec_d2_ff_scanin),
				.scan_out(mondo_addr_creg_mdata0_dec_d2_ff_scanout),
				.dout		(mondo_addr_creg_mdata0_dec_d2),
				.l1clk		(l1clk),
				.din		(mondo_addr_creg_mdata0_dec_d1),
  .siclk(siclk),
  .soclk(soclk)
				);


assign 	mondo_addr_creg_mdata1_dec_d1 = 
		cpu_mondo_rd_d1 ? cpu_mondo_addr_creg_mdata1_dec_d1 :
		                  tap_mondo_addr_creg_mdata1_dec_d1;

ncu_c2ifc_ctl_msff_ctl_macro__width_1 mondo_addr_creg_mdata1_dec_d2_ff 
				(
				.scan_in(mondo_addr_creg_mdata1_dec_d2_ff_scanin),
				.scan_out(mondo_addr_creg_mdata1_dec_d2_ff_scanout),
				.dout		(mondo_addr_creg_mdata1_dec_d2),
				.l1clk		(l1clk),
				.din		(mondo_addr_creg_mdata1_dec_d1),
  .siclk(siclk),
  .soclk(soclk)
				);


assign 	mondo_addr_creg_mbusy_dec_d1 = 
		cpu_mondo_rd_d1 ? cpu_mondo_addr_creg_mbusy_dec_d1 :
		                  tap_mondo_addr_creg_mbusy_dec_d1;

ncu_c2ifc_ctl_msff_ctl_macro__width_1 mondo_addr_creg_mbusy_dec_d2_ff 
				(
				.scan_in(mondo_addr_creg_mbusy_dec_d2_ff_scanin),
				.scan_out(mondo_addr_creg_mbusy_dec_d2_ff_scanout),
				.dout		(mondo_addr_creg_mbusy_dec_d2),
				.l1clk		(l1clk),
				.din		(mondo_addr_creg_mbusy_dec_d1),
  .siclk(siclk),
  .soclk(soclk)
				);


		
/*****************************************************************
 * Setup read/write access to mondo data table
 *****************************************************************/ 
//assign  mb0_mondo_sel = mb0_run * mb0_mondo_rd_en;
assign 	mondo_data_addr_p0[5:0] = mb0_run ? mb0_raddr[5:0] :
				  cpu_mondo_acc ? cpu_mondo_data_addr[5:0] : tap_mondo_data_addr[5:0];

assign 	mondo_data_addr_p1[5:0] = mb0_run ? mb0_waddr[5:0] :
			       io_mondo_data_wr ? io_mondo_data_addr[5:0] : tap_mondo_data_addr[5:0];

assign  mondo_data0_wr = mb0_run ? mb0_mondo_wr_en : mondo_data0_wr_f;
assign 	mondo_data0_wr_f = io_mondo_data_wr |
		         (tap_mondo_acc & tap_mondo_wr & tap_mondo_addr_creg_mdata0_dec);

assign  mondo_data1_wr = mb0_run ? mb0_mondo_wr_en : mondo_data1_wr_f;
assign 	mondo_data1_wr_f = io_mondo_data_wr |
		         (tap_mondo_acc & tap_mondo_wr & tap_mondo_addr_creg_mdata1_dec);

// Bypass detection - Only bypass if io_mondo_data_wr.  This bypass
//                    is for the case when Jbus interrupt updates the
//                    tables and CPU tries to read the exact same
//                    entry.
//                    No need to bypass if TAP is writing because
//                    TAP access is allowed only if CPU is not
//                    accessing the tables.
ncu_c2ifc_ctl_msff_ctl_macro__width_1 mondo_data_wr_d1_ff 
				(
				.scan_in(mondo_data_wr_d1_ff_scanin),
				.scan_out(mondo_data_wr_d1_ff_scanout),
				.dout		(mondo_data_wr_d1),
				.l1clk		(l1clk),
				.din		(io_mondo_data_wr),
  .siclk(siclk),
  .soclk(soclk)
				);

ncu_c2ifc_ctl_msff_ctl_macro__width_6 mondo_data_addr_p0_d1_ff 
				(
				.scan_in(mondo_data_addr_p0_d1_ff_scanin),
				.scan_out(mondo_data_addr_p0_d1_ff_scanout),
				.dout		(mondo_data_addr_p0_d1[5:0]),
				.l1clk		(l1clk),
				.din		(mondo_data_addr_p0[5:0]),
  .siclk(siclk),
  .soclk(soclk)
				);

ncu_c2ifc_ctl_msff_ctl_macro__width_6 mondo_data_addr_p1_d1_ff 
				(
				.scan_in(mondo_data_addr_p1_d1_ff_scanin),
				.scan_out(mondo_data_addr_p1_d1_ff_scanout),
				.dout		(mondo_data_addr_p1_d1[5:0]),
				.l1clk		(l1clk),
				.din		(mondo_data_addr_p1[5:0]),
  .siclk(siclk),
  .soclk(soclk)
				);

assign 	mondo_data_bypass_d1 = mondo_data_wr_d1 &
	                          (mondo_data_addr_p0_d1[5:0] == mondo_data_addr_p1_d1[5:0]);

ncu_c2ifc_ctl_msff_ctl_macro__width_1 mondo_data_bypass_d2_ff 
				(
				.scan_in(mondo_data_bypass_d2_ff_scanin),
				.scan_out(mondo_data_bypass_d2_ff_scanout),
				.dout		(mondo_data_bypass_d2),
				.l1clk		(l1clk),
				.din		(mondo_data_bypass_d1),
  .siclk(siclk),
  .soclk(soclk)
				);


/*****************************************************************
 * Setup read/write access to mondo busy
 *****************************************************************/
// Need two write ports because JBUS and CPU may write the Busy bit
// at the same time.  If they try to write the same entry at the same
// time (which is probably a software bug), JBUS wins.
// Port 0 - CPU or TAP read
// Port 1 - JBUS or TAP write
// Port 2 - CPU write
assign 	mondo_busy_addr_p0 = mondo_data_addr_p0;

assign 	mondo_busy_addr_p1 = mondo_data_addr_p1;

assign 	mondo_busy_addr_p2 = cpu_mondo_data_addr;


assign 	mondo_busy_wr_p1 = io_mondo_data_wr |
                                (tap_mondo_acc & tap_mondo_wr & tap_mondo_addr_creg_mbusy_dec);

assign 	mondo_busy_wr_p2 = cpu_mondo_acc & cpu_mondo_wr & cpu_mondo_addr_creg_mbusy_dec;

 
/*****************************************************************
 * Cpu Buffer Control
 *****************************************************************/ 
assign 	cpubuf_wr = mb1_run ? mb1_cpubuf_wr_en : (pcx_ncu_data_rdy & pcx_ncu_vld & ~(cpu_mondo_rd | cpu_mondo_wr));
//assign 	cpubuf_wr_l = ~cpubuf_wr;


// Tail pointer to cpu buffer
ncu_c2ifc_ctl_msff_ctl_macro__en_1__width_6 cpubuf_tail_ff  
				(
				.scan_in(cpubuf_tail_ff_scanin),
				.scan_out(cpubuf_tail_ff_scanout),
				.dout		(cpubuf_tail[5:0]),
				.l1clk		(l1clk),
				.en		(cpubuf_wr),
				.din		(cpubuf_tail_plus[5:0]),
  .siclk(siclk),
  .soclk(soclk)
				);

assign 	cpubuf_tail_plus[5:0] = cpubuf_tail[5:0] + 6'd1;

assign 	cpubuf_tail_ptr[4:0] = mb1_run ? mb1_waddr[4:0] : cpubuf_tail[4:0];
//assign cpubuf_tail_ptr[4:0] = cpubuf_tail[4:0];		// cpubuf no longer goes to mb0;

// Send tail pointer to BSC clock domain
ncu_c2ifc_ctl_msff_ctl_macro__en_1__width_6 cpubuf_tail_f_ff  
				(
				.scan_in(cpubuf_tail_f_ff_scanin),
				.scan_out(cpubuf_tail_f_ff_scanout),
				.dout		(cpubuf_tail_f[5:0]),
				.l1clk		(l1clk),
				.en		(cmp_io_sync_en),
				.din		(cpubuf_tail[5:0]),
  .siclk(siclk),
  .soclk(soclk)
				);


// Flop head pointer to convert to CPU clock domain
ncu_c2ifc_ctl_msff_ctl_macro__en_1__width_6 cpubuf_head_ff  
				(
				.scan_in(cpubuf_head_ff_scanin),
				.scan_out(cpubuf_head_ff_scanout),
				.dout		(cpubuf_head[5:0]),
				.l1clk		(l1clk),
				.en		(io_cmp_sync_en),
				.din		(cpubuf_head_s[5:0]),
  .siclk(siclk),
  .soclk(soclk)
				);

			      
//// this is the original n1 scheme, n2 is similar but different//
/************************************************************************
 *                                                   __tail incremented here
 *                                      flop req    |  for packet in PX2
 *                                          |       |
 *                                          |       |    compute    __stall sent here  
 *                                          |       |      hwm     |
 *                                          |       |       |      |
 *                                          V       V       V      V
 *     PQ      PA      PX1     rptr    PX2     C1      C2      C3      rtpr
 *             PQ      PA      PX1     rptr    PX2     C1      C2      C3      rptr
 *                     PQ      PA      PX1     rptr    PX2     C1      C2      C3      rptr
 *                             PQ      PA      PX1     rptr    PX2     C1      C2      C3      rptr
 *                                     PQ      PA      PX1     rptr    PX2     C1      C2      C3      rptr
 *                                             PQ      PA      PX1     rptr    PX2     C1      C2      C3      rptr
 *                                                     PQ      PA      PX1     rptr    PX2     C1      C2      C3      rptr
 *                                                             PQ      PA      PX1     rptr    PX2     C1      C2      C3      rptr
 *                                                                     PQ      PA      PX1     rptr    PX2     C1      C2      C3      rptr
 *                                                                         --> PQ      PA      
 *                                                                        |    
 *                                                                        |    
 *                                                           packet in this PQ is stalled
 * 
 * When the stall is signalled, there can potentially be 8 packets in
 * C2, C1, PX2, rptr, PX1, PA, PQ, and PQ-1 that need to be queued in
 * the CPU shared buffer.
 * Hence, the high water mark is 16 - 8 = 8.
 ************************************************************************/
// Assert stall to crossbar if we are 7 or less entries away from filling
// up cpu buffer.
assign 	cpubuf_tail_plus6[5:0] = cpubuf_tail[5:0] + 6'd6;

assign 	cpubuf_hit_hwm = ((cpubuf_tail_plus6[5] != cpubuf_head[5]) &
	             		   (cpubuf_tail_plus6[4:0] >= cpubuf_head[4:0])) |
				  ((cpubuf_tail_plus6[5] == cpubuf_head[5]) &
	             		   (cpubuf_tail_plus6[4:0] <= cpubuf_head[4:0]));

ncu_c2ifc_ctl_msff_ctl_macro__width_1 ncu_pcx_stall_pq_ff 
				(
				.scan_in(ncu_pcx_stall_pq_ff_scanin),
				.scan_out(ncu_pcx_stall_pq_ff_scanout),
				.dout		(ncu_pcx_stall_pq),
				.l1clk		(l1clk),
				.din		(cpubuf_hit_hwm | intbuf_hit_hwm),
  .siclk(siclk),
  .soclk(soclk)
				);


/**** adding clock header ****/
ncu_c2ifc_ctl_l1clkhdr_ctl_macro clkgen (
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
assign pcx_ncu_data_rdy_px2_ff_scanin = scan_in                  ;
assign pcx_ncu_data_rdy_ff_scanin = pcx_ncu_data_rdy_px2_ff_scanout;
assign cpu_mondo_rd_d1_ff_scanin = pcx_ncu_data_rdy_ff_scanout;
assign cpu_mondo_rd_d2_ff_scanin = cpu_mondo_rd_d1_ff_scanout;
assign cpu_mondo_wr_d1_ff_scanin = cpu_mondo_rd_d2_ff_scanout;
assign cpu_mondo_wr_d2_ff_scanin = cpu_mondo_wr_d1_ff_scanout;
assign cpu_mondo_rd_wr_ff_scanin = cpu_mondo_wr_d2_ff_scanout;
assign intbuf_wr2i2c_ff_scanin   = cpu_mondo_rd_wr_ff_scanout     ;
assign cpu_mondo_addr_creg_mdata0_dec_d1_ff_scanin = intbuf_wr2i2c_ff_scanout ;
assign cpu_mondo_addr_creg_mdata1_dec_d1_ff_scanin = cpu_mondo_addr_creg_mdata0_dec_d1_ff_scanout;
assign cpu_mondo_addr_creg_mbusy_dec_d1_ff_scanin = cpu_mondo_addr_creg_mdata1_dec_d1_ff_scanout;
assign cpu_mondo_addr_invld_d1_ff_scanin = cpu_mondo_addr_creg_mbusy_dec_d1_ff_scanout;
assign cpu_mondo_addr_invld_d2_ff_scanin = cpu_mondo_addr_invld_d1_ff_scanout;
assign io_mondo_data_wr_ff_scanin = cpu_mondo_addr_invld_d2_ff_scanout;
assign io_mondo_data_addr_ff_scanin = io_mondo_data_wr_ff_scanout;
assign tap_mondo_acc_addr_ff_scanin = io_mondo_data_addr_ff_scanout;
assign tap_mondo_addr_creg_mdata0_dec_d1_ff_scanin = tap_mondo_acc_addr_ff_scanout;
assign tap_mondo_addr_creg_mdata1_dec_d1_ff_scanin = tap_mondo_addr_creg_mdata0_dec_d1_ff_scanout;
assign tap_mondo_addr_creg_mbusy_dec_d1_ff_scanin = tap_mondo_addr_creg_mdata1_dec_d1_ff_scanout;
assign tap_mondo_addr_invld_d1_ff_scanin = tap_mondo_addr_creg_mbusy_dec_d1_ff_scanout;
assign tap_mondo_addr_invld_d2_ff_scanin = tap_mondo_addr_invld_d1_ff_scanout;
assign tap_mondo_acc_addr_invld_d2_f_ff_scanin = tap_mondo_addr_invld_d2_ff_scanout;
assign tap_mondo_acc_seq_ff_scanin = tap_mondo_acc_addr_invld_d2_f_ff_scanout;
assign tap_mondo_acc_seq_d1_ff_scanin = tap_mondo_acc_seq_ff_scanout;
assign tap_mondo_acc_seq_d2_ff_scanin = tap_mondo_acc_seq_d1_ff_scanout;
assign tap_mondo_acc_seq_d2_f_ff_scanin = tap_mondo_acc_seq_d2_ff_scanout;
assign tap_mondo_wr_ff_scanin    = tap_mondo_acc_seq_d2_f_ff_scanout;
assign tap_mondo_rd_d1_ff_scanin = tap_mondo_wr_ff_scanout  ;
assign tap_mondo_rd_d2_ff_scanin = tap_mondo_rd_d1_ff_scanout;
assign mondo_addr_creg_mdata0_dec_d2_ff_scanin = tap_mondo_rd_d2_ff_scanout;
assign mondo_addr_creg_mdata1_dec_d2_ff_scanin = mondo_addr_creg_mdata0_dec_d2_ff_scanout;
assign mondo_addr_creg_mbusy_dec_d2_ff_scanin = mondo_addr_creg_mdata1_dec_d2_ff_scanout;
assign mondo_data_wr_d1_ff_scanin = mondo_addr_creg_mbusy_dec_d2_ff_scanout;
assign mondo_data_addr_p0_d1_ff_scanin = mondo_data_wr_d1_ff_scanout;
assign mondo_data_addr_p1_d1_ff_scanin = mondo_data_addr_p0_d1_ff_scanout;
assign mondo_data_bypass_d2_ff_scanin = mondo_data_addr_p1_d1_ff_scanout;
assign cpubuf_tail_ff_scanin     = mondo_data_bypass_d2_ff_scanout;
assign cpubuf_tail_f_ff_scanin   = cpubuf_tail_ff_scanout   ;
assign cpubuf_head_ff_scanin     = cpubuf_tail_f_ff_scanout ;
assign ncu_pcx_stall_pq_ff_scanin = cpubuf_head_ff_scanout   ;
assign scan_out                  = ncu_pcx_stall_pq_ff_scanout;
// fixscan end:
endmodule // c2i_fctrl







// any PARAMS parms go into naming of macro

module ncu_c2ifc_ctl_msff_ctl_macro__width_1 (
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

module ncu_c2ifc_ctl_msff_ctl_macro__en_1__width_1 (
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

module ncu_c2ifc_ctl_msff_ctl_macro__en_1__width_6 (
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

module ncu_c2ifc_ctl_msff_ctl_macro__en_1__width_22 (
  din, 
  en, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [21:0] fdin;
wire [20:0] so;

  input [21:0] din;
  input en;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [21:0] dout;
  output scan_out;
assign fdin[21:0] = (din[21:0] & {22{en}}) | (dout[21:0] & ~{22{en}});






dff #(22)  d0_0 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[21:0]),
.si({scan_in,so[20:0]}),
.so({so[20:0],scan_out}),
.q(dout[21:0])
);












endmodule













// any PARAMS parms go into naming of macro

module ncu_c2ifc_ctl_msff_ctl_macro__width_6 (
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

module ncu_c2ifc_ctl_l1clkhdr_ctl_macro (
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








