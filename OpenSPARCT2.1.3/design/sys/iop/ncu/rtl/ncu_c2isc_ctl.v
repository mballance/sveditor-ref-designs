// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: ncu_c2isc_ctl.v
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










module ncu_c2isc_ctl (
  iol2clk, 
  tcu_scan_en, 
  scan_in, 
  scan_out, 
  tcu_pce_ov, 
  tcu_clk_stop, 
  tcu_aclk, 
  tcu_bclk, 
  pcx_packet, 
  pcx_packet_ue, 
  pcx_packet_pe, 
  pas, 
  pa_ld, 
  cpubuf_rd, 
  cpu_packet_type, 
  cpu_packet_size, 
  c2i_packet_addr, 
  cpubuf_tail_f, 
  cpubuf_head_s, 
  cpubuf_head_ptr, 
  cpubuf_rden, 
  mem32_base, 
  mem32_mask, 
  mem32_en, 
  mem64_base, 
  mem64_mask, 
  mem64_en, 
  iocon_base, 
  iocon_mask, 
  iocon_en, 
  cpubuf_pe, 
  cpubuf_ue, 
  mb0_raddr, 
  mb1_run, 
  mb1_addr, 
  mb1_cpubuf_rd_en, 
  c2i_packet_vld, 
  c2i_packet_is_rd_req, 
  c2i_packet_is_wr_req, 
  dmupio_ucb_sel, 
  com_map, 
  dmupio_addr35to24, 
  dmupio_ucb_buf_acpt, 
  dmucsr_ucb_sel, 
  dmucsr_ucb_buf_acpt, 
  ssi_ucb_sel, 
  ssi_ucb_buf_acpt, 
  mcu0_ucb_sel, 
  mcu0_ucb_buf_acpt, 
  mcu1_ucb_sel, 
  mcu1_ucb_buf_acpt, 
  mcu2_ucb_sel, 
  mcu2_ucb_buf_acpt, 
  mcu3_ucb_sel, 
  mcu3_ucb_buf_acpt, 
  ccu_ucb_sel, 
  ccu_ucb_buf_acpt, 
  rcu_ucb_sel, 
  rcu_ucb_buf_acpt, 
  dbg1_ucb_sel, 
  dbg1_ucb_buf_acpt, 
  niu_ucb_sel, 
  niu_ucb_buf_acpt, 
  ncu_man_ucb_sel, 
  ncu_man_ucb_buf_acpt, 
  ncu_int_ucb_sel, 
  ncu_int_ucb_buf_acpt, 
  bounce_ucb_sel, 
  bounce_ucb_buf_acpt, 
  rd_nack_ucb_sel, 
  rd_nack_ucb_buf_acpt, 
  srvc_wr_ack, 
  iobuf_avail, 
  c2i_wait, 
  tap_iob_packet_vld, 
  tap_iob_packet, 
  iob_tap_busy, 
  tap_sel) ;
wire cpubuf_tail_ff_scanin;
wire cpubuf_tail_ff_scanout;
wire [5:0] cpubuf_tail;
wire l1clk;
wire cpubuf_head_d1_ff_scanin;
wire cpubuf_head_d1_ff_scanout;
wire [5:0] cpubuf_head_d1;
wire [5:0] cpubuf_head;
wire pipe_full;
wire aov;
wire pav;
wire pbv;
wire cpu_vld;
wire head_inc;
wire aog;
wire rd;
wire cpubuf_rden_nobist_eco;
wire aog_ff_scanin;
wire aog_ff_scanout;
wire aov_next;
wire aov_ff_scanin;
wire aov_ff_scanout;
wire pav_ff_scanin;
wire pav_ff_scanout;
wire pb_ld;
wire pbv_ff_scanin;
wire pbv_ff_scanout;
wire pbs_next;
wire pbs_ff_scanin;
wire pbs_ff_scanout;
wire pbs;
wire mov;
wire cpu_sel;
wire ucb_buf_acpt;
wire cpu_packet_needs_wr_ack;
wire cpu_vld_next;
wire cpu_vld_ff_scanin;
wire cpu_vld_ff_scanout;
wire tap_vld;
wire [3:0] cpu_wr_pkt_sz;
wire unconnect_cpu_wr_pkt_sz_0;
wire [2:0] cpu_wr_pkt_sz_enc;
wire cpu_packet_is_8B;
wire tap_packet_is_8B;
wire c2i_packet_is_if_req;
wire c2i_packet_is_ack;
wire c2i_packet_is_8B;
wire tcu_ucb_sel;
wire pcie_hit;
wire [11:0] mem32_masked;
wire [11:0] mem64_masked;
wire [11:0] iocon_masked;
wire mem32_vld;
wire mem64_vld;
wire iocon_vld;
wire [11:0] muxed_mask;
wire no_match_ucb;
wire blackhole_acpt;
wire siclk;
wire soclk;
wire se;
wire pce_ov;
wire stop;



////////////////////////////////////////////////////////////////////////
// Signal declarations
////////////////////////////////////////////////////////////////////////
// Global interface
input		iol2clk;

input		tcu_scan_en;
input		scan_in;
output		scan_out;
input		tcu_pce_ov;
input		tcu_clk_stop;
input		tcu_aclk;
input		tcu_bclk;

// c2i sdp 
input [128:0]	pcx_packet;
input		pcx_packet_ue;
input		pcx_packet_pe;
output		pas;		// 0in known_driven
output		pa_ld;		// 0in known_driven
output		cpubuf_rd;	// 0in known_driven
//output	cpu_packet_is_req;
output [3:0]	cpu_packet_type;
output [2:0]	cpu_packet_size;
input [39:0]	c2i_packet_addr;

// c2i fctrl
input [5:0]	cpubuf_tail_f; // 0in known_driven
output [5:0]	cpubuf_head_s; // 0in known_driven

// CPU buffer interface
output [4:0]	cpubuf_head_ptr;// 0in known_driven
output		cpubuf_rden;	// 0in known_driven

// creg from ctrl blk //
input [11:0]	mem32_base;	// 0in known_driven
input [11:0]	mem32_mask;	// 0in known_driven
input		mem32_en;	// 0in known_driven
input [11:0]	mem64_base;	// 0in known_driven
input [11:0]	mem64_mask;	// 0in known_driven
input		mem64_en;	// 0in known_driven
input [11:0]	iocon_base;	// 0in known_driven
input [11:0]	iocon_mask;	// 0in known_driven
input		iocon_en;	// 0in known_driven
output		cpubuf_pe;	// 0in known_driven
output		cpubuf_ue;	// 0in known_driven

// mb0 signals //
input [5:0]	mb0_raddr;
//input		mb0_cpubuf_sel;
input		mb1_run;
input [5:0]     mb1_addr;
input		mb1_cpubuf_rd_en;


// UCB buffer interface
output		c2i_packet_vld; // 0in known_driven
output		c2i_packet_is_rd_req; // 0in known -active c2i_packet_vld
output		c2i_packet_is_wr_req; // 0in known -active c2i_packet_vld

output		dmupio_ucb_sel;		// 0in known -active c2i_packet_vld
output [1:0]	com_map;		// 0in known -active c2i_packet_vld
output [11:0]	dmupio_addr35to24 ;
input		dmupio_ucb_buf_acpt; 	// 0in known -active c2i_packet_vld
output		dmucsr_ucb_sel;		// 0in known -active c2i_packet_vld
input		dmucsr_ucb_buf_acpt; 	// 0in known -active c2i_packet_vld
output		ssi_ucb_sel;		// 0in known -active c2i_packet_vld
input		ssi_ucb_buf_acpt; 	// 0in known -active c2i_packet_vld
output		mcu0_ucb_sel;		// 0in known -active c2i_packet_vld
input		mcu0_ucb_buf_acpt; 	// 0in known -active c2i_packet_vld
output		mcu1_ucb_sel;		// 0in known -active c2i_packet_vld
input		mcu1_ucb_buf_acpt; 	// 0in known -active c2i_packet_vld
output		mcu2_ucb_sel;		// 0in known -active c2i_packet_vld
input		mcu2_ucb_buf_acpt; 	// 0in known -active c2i_packet_vld
output		mcu3_ucb_sel;		// 0in known -active c2i_packet_vld
input		mcu3_ucb_buf_acpt; 	// 0in known -active c2i_packet_vld
output		ccu_ucb_sel;		// 0in known -active c2i_packet_vld
input		ccu_ucb_buf_acpt; 	// 0in known -active c2i_packet_vld
output		rcu_ucb_sel;		// 0in known -active c2i_packet_vld
input		rcu_ucb_buf_acpt; 	// 0in known -active c2i_packet_vld
output          dbg1_ucb_sel;           // 0in known -active c2i_packet_vld
input           dbg1_ucb_buf_acpt;      // 0in known -active c2i_packet_vld
output		niu_ucb_sel;		// 0in known -active c2i_packet_vld
input		niu_ucb_buf_acpt; 	// 0in known -active c2i_packet_vld
output		ncu_man_ucb_sel;	// 0in known -active c2i_packet_vld
input		ncu_man_ucb_buf_acpt; 	// 0in known -active c2i_packet_vld
output		ncu_int_ucb_sel;	// 0in known -active c2i_packet_vld
input		ncu_int_ucb_buf_acpt; 	// 0in known -active c2i_packet_vld
output		bounce_ucb_sel;		// 0in known -active c2i_packet_vld
input		bounce_ucb_buf_acpt; 	// 0in known -active c2i_packet_vld
output		rd_nack_ucb_sel;	// 0in known -active c2i_packet_vld
input		rd_nack_ucb_buf_acpt; 	// 0in known -active c2i_packet_vld

output		srvc_wr_ack;	// 0in known_driven
input		iobuf_avail;	// 0in known_driven
input		c2i_wait;	// 0in known_driven

input		tap_iob_packet_vld;	// 0in known_driven
input [127:0]	tap_iob_packet;
output		iob_tap_busy;		// 0in known_driven
output		tap_sel;


// Internal signals


reg		cpu_packet_is_rd_req;
reg		cpu_packet_is_wr_req;
reg		cpu_packet_is_if_req;
reg [3:0]	cpu_packet_type;
reg [2:0]	cpu_packet_size;

reg		tap_packet_is_rd_req;
reg		tap_packet_is_wr_req;
reg		tap_packet_is_ack;
reg		tap_packet_is_if_req;



// Request packets for these masters will go to one ucb




/*****************************************************************
 * CPU Buffer Control
 *****************************************************************/ 
// Flop tail pointer to convert to io clock domain
ncu_c2isc_ctl_msff_ctl_macro__width_6 cpubuf_tail_ff 
				(
				.scan_in(cpubuf_tail_ff_scanin),
				.scan_out(cpubuf_tail_ff_scanout),
				.dout		(cpubuf_tail[5:0]),
				.l1clk		(l1clk),
				.din		(cpubuf_tail_f[5:0]),
  .siclk(siclk),
  .soclk(soclk)
				);
ncu_c2isc_ctl_msff_ctl_macro__width_6 cpubuf_head_d1_ff 
				(
				.scan_in(cpubuf_head_d1_ff_scanin),
				.scan_out(cpubuf_head_d1_ff_scanout),
				.dout		(cpubuf_head_d1[5:0]),
				.l1clk		(l1clk),
				.din		(cpubuf_head[5:0]),
  .siclk(siclk),
  .soclk(soclk)
				);

assign	cpubuf_head_ptr[4:0] = mb1_run ? mb1_addr[4:0] : cpubuf_head[4:0];
assign 	cpubuf_head_s[5:0] = cpubuf_head_d1[5:0];
//assign 	pipe_full = (aov+pav+pbv+cpu_vld)==2'b11 ;
assign	pipe_full = ~aov ? (pav & pbv & cpu_vld) :
		    ~pav ? (pbv & cpu_vld) :
		    ~pbv ? (cpu_vld) : 1'b1 ;
assign	head_inc = aog & (rd | ~pipe_full) ;
assign	cpubuf_head[5:0] = head_inc ? cpubuf_head_d1[5:0]+6'h01 : cpubuf_head_d1[5:0] ;

assign	cpubuf_rden = mb1_run ? mb1_cpubuf_rd_en : (cpubuf_tail[5:0] != cpubuf_head[5:0]) ;
assign	cpubuf_rden_nobist_eco = (cpubuf_tail[5:0] != cpubuf_head[5:0]) ;
//assign	aog_next = (cpubuf_tail[5:0] != cpubuf_head[5:0]) ;
ncu_c2isc_ctl_msff_ctl_macro__width_1 aog_ff 
				(
				.scan_in(aog_ff_scanin),
				.scan_out(aog_ff_scanout),
				.dout		(aog),
				.l1clk		(l1clk),
				.din		(cpubuf_rden_nobist_eco),
  .siclk(siclk),
  .soclk(soclk)
				);

assign	aov_next = cpubuf_rden_nobist_eco & (head_inc | ~aog);
ncu_c2isc_ctl_msff_ctl_macro__width_1 aov_ff 
				(
				.scan_in(aov_ff_scanin),
				.scan_out(aov_ff_scanout),
				.dout		(aov),
				.l1clk		(l1clk),
				.din		(aov_next),
  .siclk(siclk),
  .soclk(soclk)
				);

assign	pa_ld = (pav==cpubuf_rd) ;
ncu_c2isc_ctl_msff_ctl_macro__en_1__width_1 pav_ff  
				(
				.scan_in(pav_ff_scanin),
				.scan_out(pav_ff_scanout),
				.dout		(pav),
				.l1clk		(l1clk),
				.en		(pa_ld),
				.din		(pbv),
  .siclk(siclk),
  .soclk(soclk)
				);

assign	pb_ld = (~pav | cpubuf_rd | ~pbv) ;
ncu_c2isc_ctl_msff_ctl_macro__en_1__width_1 pbv_ff  
				(
				.scan_in(pbv_ff_scanin),
				.scan_out(pbv_ff_scanout),
				.dout		(pbv),
				.l1clk		(l1clk),
				.en		(pb_ld),
				.din		(aov),
  .siclk(siclk),
  .soclk(soclk)
				);

assign	pbs_next = pas ? (aov & !pbv & pav)&rd : cpubuf_rd ;
ncu_c2isc_ctl_msff_ctl_macro__width_1 pbs_ff 
				(
				.scan_in(pbs_ff_scanin),
				.scan_out(pbs_ff_scanout),
				.dout		(pbs),
				.l1clk		(l1clk),
				.din		(pbs_next),
  .siclk(siclk),
  .soclk(soclk)
				);
assign 	pas = ~pbs;


assign	mov = pas ? pav : pbv ;
assign	cpubuf_rd = mov & (~cpu_vld | rd) ;

assign	rd = (cpu_vld & ( (cpu_sel&ucb_buf_acpt)|
			   pcx_packet_ue|
			  (pcx_packet_pe&cpu_packet_needs_wr_ack&(iobuf_avail&~c2i_wait))) );

//assign	cpubuf_ue = rd&pcx_packet_ue;
assign	cpubuf_ue = cpu_vld&pcx_packet_ue;
assign	cpubuf_pe = rd&pcx_packet_pe;

/*****************************************************************
 * Arbitrate between TAP and CPU requests
 *****************************************************************/ 
// Valid indicates which master has a valid packet pending
assign	cpu_vld_next = cpu_vld ? (~rd|mov) : mov ;
//assign 	cpu_vld_next = cpubuf_rd | (cpu_vld & ~(cpu_sel & ucb_buf_acpt));

ncu_c2isc_ctl_msff_ctl_macro__width_1 cpu_vld_ff 
				(
				.scan_in(cpu_vld_ff_scanin),
				.scan_out(cpu_vld_ff_scanout),
				.dout		(cpu_vld),
				.l1clk		(l1clk),
				.din		(cpu_vld_next),
  .siclk(siclk),
  .soclk(soclk)
				);

assign 	tap_vld = tap_iob_packet_vld;


// TAP packets priority > PCX packets priority
assign 	tap_sel = tap_vld;
assign 	cpu_sel = ~tap_vld;

// Signal masters if the packet is accepted
assign 	iob_tap_busy = tap_vld & ~ucb_buf_acpt;


assign 	c2i_packet_vld = tap_vld | (cpu_vld & ~pcx_packet_ue & ~(pcx_packet_pe&cpu_packet_is_wr_req) & 
						( dmupio_ucb_sel|
	                                        ~(cpu_packet_needs_wr_ack&(~iobuf_avail|c2i_wait))    
				                ) );


assign		cpu_wr_pkt_sz[3:0]  = 	({3'b0,pcx_packet[111]}+{3'b0,pcx_packet[110]}) +
					({3'b0,pcx_packet[109]}+{3'b0,pcx_packet[108]}) +
					({3'b0,pcx_packet[107]}+{3'b0,pcx_packet[106]}) +
					({3'b0,pcx_packet[105]}+{3'b0,pcx_packet[104]})  ;

assign		unconnect_cpu_wr_pkt_sz_0 = cpu_wr_pkt_sz[0];
assign		cpu_wr_pkt_sz_enc[2:0] = cpu_wr_pkt_sz[3] ? 3'b011 : cpu_wr_pkt_sz[3:1] ;

/*****************************************************************
 * Decode packet from CPU buffer
 *****************************************************************/
always @(/*AUTOSENSE*/cpu_wr_pkt_sz_enc or pcx_packet) begin
   // Packet will be dropped if it is not a request 
   case (pcx_packet[128:124]) //rqtyp//
	`PCX_LOAD_RQ : begin
	   cpu_packet_is_rd_req = 1'b1;
	   cpu_packet_is_wr_req = 1'b0;
	   cpu_packet_is_if_req = 1'b0;
	   cpu_packet_type[3:0] = `UCB_READ_REQ ;
	   cpu_packet_size[2:0] = {1'b0,pcx_packet[105:104]} ;
	end
	`PCX_IMISS_RQ : begin
	   cpu_packet_is_rd_req = 1'b0;
	   cpu_packet_is_wr_req = 1'b0;
	   cpu_packet_is_if_req = 1'b1;
	   cpu_packet_type[3:0] = `UCB_IFILL_REQ ;
	   cpu_packet_size[2:0] = {1'b0,pcx_packet[105:104]} ;
	end
	`PCX_STORE_RQ : begin
	   cpu_packet_is_rd_req = 1'b0;
	   cpu_packet_is_wr_req = 1'b1;
	   cpu_packet_is_if_req = 1'b0;
	   cpu_packet_type[3:0] = `UCB_WRITE_REQ ;
	   cpu_packet_size[2:0] = cpu_wr_pkt_sz_enc[2:0] ;
	end
	default : begin
           cpu_packet_is_rd_req = 1'b0;
           cpu_packet_is_wr_req = 1'b0;
           cpu_packet_is_if_req = 1'b0;
           cpu_packet_type[3:0] = 4'hf;
	   cpu_packet_size[2:0] = 3'b0;
	end
   endcase // case(pcx_packet[128:124])
end


// Decode PCX packet to see if it is a write request.  We need to
// generate acks for writes.
assign 	cpu_packet_needs_wr_ack = (pcx_packet[128:124] == `PCX_STORE_RQ) ;

//assign 	cpu_packet_is_8B = pcx_packet[106:104] == 3'b011;
assign 	cpu_packet_is_8B = (cpu_packet_size[2:0] == 3'b011) ;


/*****************************************************************
 * Decode packet from TAP
 *****************************************************************/
always @(/*AUTOSENSE*/tap_iob_packet) begin
   case (tap_iob_packet[3:0])
	`UCB_READ_REQ : begin
	   tap_packet_is_rd_req = 1'b1;
	   tap_packet_is_wr_req = 1'b0;
	   tap_packet_is_ack = 1'b0;
	   tap_packet_is_if_req = 1'b0;
	end
	`UCB_WRITE_REQ : begin
	   tap_packet_is_rd_req = 1'b0;
	   tap_packet_is_wr_req = 1'b1;
	   tap_packet_is_ack = 1'b0;
	   tap_packet_is_if_req = 1'b0;
	end
	`UCB_IFILL_REQ : begin
	   tap_packet_is_rd_req = 1'b0;
	   tap_packet_is_wr_req = 1'b0;
	   tap_packet_is_ack = 1'b0;
	   tap_packet_is_if_req = 1'b1;
	end
	`UCB_READ_NACK,
	`UCB_READ_ACK : begin
	   tap_packet_is_rd_req = 1'b0;
	   tap_packet_is_wr_req = 1'b0;
	   tap_packet_is_ack = 1'b1;
	   tap_packet_is_if_req = 1'b0;
	end
	default : begin
           tap_packet_is_rd_req = 1'b0;
           tap_packet_is_wr_req = 1'b0;
           tap_packet_is_ack = 1'b0;
	   tap_packet_is_if_req = 1'b0;
	end
   endcase
end // always @ (...

assign 	tap_packet_is_8B = tap_iob_packet[14:12] == 3'b011;


/*****************************************************************
 * Mux between TAP and CPU packet
 *****************************************************************/
assign 	c2i_packet_is_rd_req = tap_sel ? tap_packet_is_rd_req : cpu_packet_is_rd_req;

assign 	c2i_packet_is_wr_req = tap_sel ? tap_packet_is_wr_req : cpu_packet_is_wr_req;

assign 	c2i_packet_is_if_req = tap_sel ? tap_packet_is_if_req : cpu_packet_is_if_req;

assign c2i_packet_is_ack = tap_sel ? tap_packet_is_ack : 1'b0 ;

assign 	c2i_packet_is_8B = tap_sel ? tap_packet_is_8B : cpu_packet_is_8B;


/*****************************************************************
 * Decode 8 MSB of c2i packet address to figure out which UCB it
 * should go to
 *****************************************************************/ 
// jimmy: assign mem_ucb_sel  = ((c2i_packet_addr[39:32] <= `DRAM_DATA_HI) &
// jimmy: 	    (c2i_packet_addr[39:32] >= `DRAM_DATA_LO)) &
// jimmy: 	   (c2i_packet_is_rd_req | c2i_packet_is_wr_req);

// jimmy: assign l2_ucb_sel   =  (c2i_packet_addr[39:32] == `TAP2L2C) &

// jimmy: assign asi_ucb_sel  =  (c2i_packet_addr[39:32] == `TAP2ASI) &
// jimmy: 	    (c2i_packet_is_rd_req | c2i_packet_is_wr_req) & c2i_packet_is_8B;

assign tcu_ucb_sel  =  (c2i_packet_addr[39:32] == `TCU_CSR) &
 	    (c2i_packet_is_rd_req | c2i_packet_is_wr_req) & c2i_packet_is_8B;

////
// Bit 13:12 indicate which DRAM control we want
assign 	mcu0_ucb_sel    = ((c2i_packet_addr[39:32] == `MCU_CSR) &
			   (c2i_packet_addr[13:12] == 2'b00)) &
			  (c2i_packet_is_rd_req | c2i_packet_is_wr_req) & c2i_packet_is_8B;

assign 	mcu1_ucb_sel    = ((c2i_packet_addr[39:32] == `MCU_CSR) &
			   (c2i_packet_addr[13:12] == 2'b01)) &
			  (c2i_packet_is_rd_req | c2i_packet_is_wr_req) & c2i_packet_is_8B;

assign 	mcu2_ucb_sel    = ((c2i_packet_addr[39:32] == `MCU_CSR) &
			   (c2i_packet_addr[13:12] == 2'b10)) &
			  (c2i_packet_is_rd_req | c2i_packet_is_wr_req) & c2i_packet_is_8B;

assign 	mcu3_ucb_sel    = ((c2i_packet_addr[39:32] == `MCU_CSR) &
			   (c2i_packet_addr[13:12] == 2'b11)) &
			  (c2i_packet_is_rd_req | c2i_packet_is_wr_req) & c2i_packet_is_8B;

assign 	dmucsr_ucb_sel  = (c2i_packet_addr[39:32] == `DMU_CSR) &
			  (c2i_packet_is_rd_req | c2i_packet_is_wr_req) & c2i_packet_is_8B;

////
assign	pcie_hit = (c2i_packet_addr[39:36]==`DMU_PIO) ;
assign	mem32_masked[11:0] = c2i_packet_addr[35:24] & mem32_mask[11:0] ;
assign	mem64_masked[11:0] = c2i_packet_addr[35:24] & mem64_mask[11:0] ;
assign	iocon_masked[11:0] = c2i_packet_addr[35:24] & iocon_mask[11:0] ;
assign	mem32_vld = (mem32_masked[11:0]==mem32_base[11:0]) & pcie_hit & mem32_en ;
assign	mem64_vld = (mem64_masked[11:0]==mem64_base[11:0]) & pcie_hit & mem64_en ;
assign	iocon_vld = (iocon_masked[11:0]==iocon_base[11:0]) & pcie_hit & iocon_en ;
assign	com_map[1:0] =  mem64_vld ? 2'b11 :
			mem32_vld ? 2'b10 : {1'b0,c2i_packet_addr[28]} ; 

assign	muxed_mask[11:0] = mem64_vld ? mem64_mask[11:0] :
			   mem32_vld ? mem32_mask[11:0] :
			     	       iocon_mask[11:0] ;

assign  dmupio_addr35to24[11:0] = c2i_packet_addr[35:24] & {~muxed_mask[11:0]} ;

assign 	dmupio_ucb_sel  = ((mem32_vld|mem64_vld|iocon_vld) &
			   (c2i_packet_is_rd_req | c2i_packet_is_wr_req) ) ;

////
assign 	ssi_ucb_sel     = (c2i_packet_addr[39:32] == `SSI_CSR) &
			  (c2i_packet_is_rd_req | c2i_packet_is_wr_req | 
			    c2i_packet_is_if_req);

assign 	ccu_ucb_sel     = (c2i_packet_addr[39:32] == `CCU_CSR) &
			  (c2i_packet_is_rd_req | c2i_packet_is_wr_req) & c2i_packet_is_8B;

assign 	rcu_ucb_sel     = (c2i_packet_addr[39:32] == `RCU_CSR) &
			  (c2i_packet_is_rd_req | c2i_packet_is_wr_req) & c2i_packet_is_8B;

assign 	dbg1_ucb_sel     = (c2i_packet_addr[39:32] == `DBG1_CSR) &
			  (c2i_packet_is_rd_req | c2i_packet_is_wr_req) & c2i_packet_is_8B;

assign 	niu_ucb_sel     = (c2i_packet_addr[39:32] == `NIU_CSR) & (c2i_packet_addr[2:0]==3'b000) &
			  (c2i_packet_is_rd_req | c2i_packet_is_wr_req) & c2i_packet_is_8B;

//// addr[18] to tell if ncu's access is man or int(tap_mondo) ////
assign 	ncu_man_ucb_sel = ( ((c2i_packet_addr[39:32] == `NCU_CSR)&(c2i_packet_addr[31:16]==`NCU_CSR_MAN)) | 
                            (c2i_packet_addr[39:32] == `NCU_ASI) ) &
			  (c2i_packet_is_rd_req | c2i_packet_is_wr_req) & c2i_packet_is_8B ;

assign 	ncu_int_ucb_sel = (c2i_packet_addr[39:32] == `NCU_CSR)&(c2i_packet_addr[31:16]==`NCU_CSR_MONDO) &
			  (c2i_packet_is_rd_req | c2i_packet_is_wr_req) & c2i_packet_is_8B;

// Request to L2/TAP/ASI addresses can only be accessed through the i2c path
// Ack to CPU/TAP is also sent through the i2c path
assign  bounce_ucb_sel = tcu_ucb_sel | c2i_packet_is_ack;

// Any request that does not match any defined address space
assign  no_match_ucb = 	~(	tcu_ucb_sel |
				mcu0_ucb_sel |
				mcu1_ucb_sel |
				mcu2_ucb_sel |
				mcu3_ucb_sel |
				dmucsr_ucb_sel |
				dmupio_ucb_sel |
				ssi_ucb_sel |
				ccu_ucb_sel |
				rcu_ucb_sel |
				dbg1_ucb_sel |
				niu_ucb_sel |
				ncu_man_ucb_sel |
				ncu_int_ucb_sel  ) ;


// This handles either read nack or ifill nack
assign     rd_nack_ucb_sel = no_match_ucb &
	                        (c2i_packet_is_rd_req | c2i_packet_is_if_req);

// The Black-Hole ucb is for sinking packets with undefined transaction type
assign     blackhole_acpt = c2i_packet_vld &
	                       ((~c2i_packet_is_rd_req & ~c2i_packet_is_wr_req &
				 ~c2i_packet_is_if_req & ~c2i_packet_is_ack) |
				(no_match_ucb & c2i_packet_is_wr_req));

// ucb_buf_acpt means c2i_packet has been accepted by a ucb buffer
// Assertion: At most only one device should accept
assign     ucb_buf_acpt =  (	dmupio_ucb_buf_acpt |
				dmucsr_ucb_buf_acpt |
				ssi_ucb_buf_acpt |
				mcu0_ucb_buf_acpt |
				mcu1_ucb_buf_acpt |
				mcu2_ucb_buf_acpt |
				mcu3_ucb_buf_acpt |
				ccu_ucb_buf_acpt |
				rcu_ucb_buf_acpt |
				dbg1_ucb_buf_acpt |
				niu_ucb_buf_acpt |
				ncu_man_ucb_buf_acpt |
				ncu_int_ucb_buf_acpt |
				bounce_ucb_buf_acpt |
				rd_nack_ucb_buf_acpt |
				blackhole_acpt );


// Generate write ack if ucb buffer is accepting a write request
assign     srvc_wr_ack = cpu_sel & (ucb_buf_acpt|(cpu_vld&pcx_packet_pe)) & 
			          cpu_packet_needs_wr_ack & ~dmupio_ucb_sel;


/**** adding clock header ****/
ncu_c2isc_ctl_l1clkhdr_ctl_macro clkgen (
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
assign cpubuf_tail_ff_scanin     = scan_in                  ;
assign cpubuf_head_d1_ff_scanin  = cpubuf_tail_ff_scanout   ;
assign aog_ff_scanin             = cpubuf_head_d1_ff_scanout;
assign aov_ff_scanin             = aog_ff_scanout           ;
assign pav_ff_scanin             = aov_ff_scanout           ;
assign pbv_ff_scanin             = pav_ff_scanout           ;
assign pbs_ff_scanin             = pbv_ff_scanout           ;
assign cpu_vld_ff_scanin         = pbs_ff_scanout           ;
assign scan_out                  = cpu_vld_ff_scanout       ;
// fixscan end:
endmodule // c2i_sctrl


// Local Variables:
// verilog-auto-sense-defines-constant:t
// End:






// any PARAMS parms go into naming of macro

module ncu_c2isc_ctl_msff_ctl_macro__width_6 (
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

module ncu_c2isc_ctl_msff_ctl_macro__width_1 (
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

module ncu_c2isc_ctl_msff_ctl_macro__en_1__width_1 (
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

module ncu_c2isc_ctl_l1clkhdr_ctl_macro (
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








