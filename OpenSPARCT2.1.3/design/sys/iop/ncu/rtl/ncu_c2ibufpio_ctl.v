// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: ncu_c2ibufpio_ctl.v
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










module ncu_c2ibufpio_ctl (
  iol2clk, 
  tcu_scan_en, 
  scan_in, 
  scan_out, 
  tcu_pce_ov, 
  tcu_clk_stop, 
  tcu_aclk, 
  tcu_bclk, 
  tcu_dbr_gateoff, 
  c2i_packet, 
  dmupio_addr35to24, 
  c2i_packet_vld, 
  ucb_sel, 
  ucb_buf_acpt, 
  com_map, 
  mmufsh_data, 
  mmufsh_vld, 
  mmu_ld, 
  dmu_ncu_wrack_vld, 
  dmu_ncu_wrack_tag, 
  dmu_ncu_wrack_par, 
  dmu_cr_id_rtn_err, 
  dmu_cr_id_rtn_erri, 
  sii_cr_id_rtn_vld, 
  sii_cr_id_rtn, 
  dmubuf_din, 
  dmubuf0_wr, 
  dmubuf1_wr, 
  dmubuf_waddr, 
  dmubuf_raddr, 
  dmubuf_rden, 
  dmubuf0_dout, 
  dmubuf1_dout, 
  dmupio_wack_iopkt, 
  dmupio_srvc_wack, 
  c2i_wait, 
  iobuf_avail, 
  ncu_dmu_pio_data, 
  ncu_dmu_pio_hdr_vld, 
  ncu_dmu_mmu_addr_vld, 
  ncu_dmu_dpar, 
  dmubufsyn, 
  dmubuf_pue, 
  dmubuf_pei, 
  mb1_dmubuf0_wr_en, 
  mb1_dmubuf1_wr_en, 
  mb1_dmubuf0_rd_en, 
  mb1_dmubuf1_rd_en, 
  mb1_addr, 
  mb1_wdata, 
  mb1_run) ;
wire fifo_wr;
wire fifo_full;
wire [143:0] dmubuf_din_f;
wire [11:0] parity;
wire [4:0] ct_cmd_ecc;
wire pipe_full;
wire aov;
wire pav;
wire pbv;
wire fifo_dout_v;
wire raddr_inc;
wire aog;
wire fifo_rd;
wire [6:0] raddr_p1;
wire [6:0] raddr;
wire [6:0] raddr_muxed;
wire [6:0] waddr_n;
wire [6:0] waddr_p1;
wire [6:0] waddr;
wire aov_n;
wire dmubuf_rden_nobist_eco;
wire pa_ld;
wire fifo_dout_ld;
wire pb_ld;
wire pbs_n;
wire pas;
wire pbs;
wire mov;
wire fifo_dout_v_n;
wire a_full;
wire t_full;
wire fifo_full_n;
wire [143:0] dmubuf_dout;
wire dmubuf1_sel2;
wire aog_ff_scanin;
wire aog_ff_scanout;
wire l1clk;
wire aov_ff_scanin;
wire aov_ff_scanout;
wire pav_ff_scanin;
wire pav_ff_scanout;
wire pbv_ff_scanin;
wire pbv_ff_scanout;
wire pbs_ff_scanin;
wire pbs_ff_scanout;
wire dmubuf1_sel1_ff_scanin;
wire dmubuf1_sel1_ff_scanout;
wire dmubuf1_sel1;
wire dmubuf1_sel2_ff_scanin;
wire dmubuf1_sel2_ff_scanout;
wire raddr_ff_scanin;
wire raddr_ff_scanout;
wire waddr_ff_scanin;
wire waddr_ff_scanout;
wire fifo_full_ff_scanin;
wire fifo_full_ff_scanout;
wire [143:0] dout_muxed_a;
wire [143:0] pad;
wire pad_ff_scanin;
wire pad_ff_scanout;
wire dmubuf_ue_n;
wire unused_ce;
wire [10:0] dout_muxed_b;
wire [4:0] unused_co;
wire [11:0] dmubuf_pfail_n;
wire fifo_dout_v_ff_scanin;
wire fifo_dout_v_ff_scanout;
wire [126:0] dout_muxed;
wire fifo_dout_ff_scanin;
wire fifo_dout_ff_scanout;
wire [126:0] fifo_dout;
wire fifo_dout_pue_ff_scanin;
wire fifo_dout_pue_ff_scanout;
wire fifo_dout_pue;
wire fifo_dout_pe_ff_scanin;
wire fifo_dout_pe_ff_scanout;
wire fifo_dout_pe;
wire fifo_dout_ue_ff_scanin;
wire fifo_dout_ue_ff_scanout;
wire fifo_dout_ue;
wire [4:0] dmubufsyn_rtyp;
wire dmubufsyn_ff_scanin;
wire dmubufsyn_ff_scanout;
wire fifo_rd_from_pio;
wire piowr;
wire pio_rdy;
wire dmu_pio_bb;
wire cr_id_vld;
wire pio_ld;
wire cr_id_con;
wire [2:0] pa_lower3bits;
wire eco060628net1;
wire [63:0] pio_hdr;
wire [63:0] ncu_dmu_pio_data_n;
wire [63:0] dmu_pio_pld;
wire [1:0] ncu_dmu_dpar_n;
wire dmu_pio_bb_n;
wire dmu_pio_bb_ff_scanin;
wire dmu_pio_bb_ff_scanout;
wire dmu_pio_pld_ff_scanin;
wire dmu_pio_pld_ff_scanout;
wire ncu_dmu_pio_hdr_vld_f;
wire ncu_dmu_pio_hdr_vld_ff_scanin;
wire ncu_dmu_pio_hdr_vld_ff_scanout;
wire ncu_dmu_pio_data_ff_scanin;
wire ncu_dmu_pio_data_ff_scanout;
wire ncu_dmu_dpar_ff_scanin;
wire ncu_dmu_dpar_ff_scanout;
wire ncu_dmu_mmu_addr_vld_f;
wire ncu_dmu_mmu_addr_vld_ff_scanin;
wire ncu_dmu_mmu_addr_vld_ff_scanout;
wire [3:0] dmupio_cpx_type;
wire [144:0] dmupio_wrack_pkt;
wire [7:0] dmupio_wrack_cpu;
wire rdy0_ff_scanin;
wire rdy0_ff_scanout;
wire rdy0;
wire rdy1_ff_scanin;
wire rdy1_ff_scanout;
wire rdy1;
wire cr_id_rtn1_vld_ff_scanin;
wire cr_id_rtn1_vld_ff_scanout;
wire dmu_cr_id_rtn_vld;
wire cr_id_rtn1_ff_scanin;
wire cr_id_rtn1_ff_scanout;
wire [3:0] dmu_cr_id_rtn;
wire cr_id_rtn1_par_ff_scanin;
wire cr_id_rtn1_par_ff_scanout;
wire dmu_cr_id_rtn_par;
wire [15:0] cr_id_rtn1_sel;
wire [15:0] cr_id_rtn2_sel;
wire [15:0] cr_id_rtn_sel;
wire [15:0] cr_id_con_sel;
wire [15:0] token_avail_n;
wire [15:0] token_avail;
wire [15:0] token_avail_n_;
wire [15:0] token_avail_;
wire token_avail_l_ff_scanin;
wire token_avail_l_ff_scanout;
wire siclk;
wire soclk;
wire se;
wire pce_ov;
wire stop;


input		iol2clk;
input		tcu_scan_en;
input		scan_in;
output		scan_out;

input		tcu_pce_ov;
input		tcu_clk_stop;
input		tcu_aclk;
input		tcu_bclk;
input		tcu_dbr_gateoff;

////
input [127:0]	c2i_packet;
input [11:0]	dmupio_addr35to24;
input		c2i_packet_vld;
input		ucb_sel;
output		ucb_buf_acpt;
input [1:0]	com_map;
input [63:0]	mmufsh_data;
input		mmufsh_vld;
output		mmu_ld;

input		dmu_ncu_wrack_vld;
input [3:0]	dmu_ncu_wrack_tag;
input		dmu_ncu_wrack_par;
output		dmu_cr_id_rtn_err;
input		dmu_cr_id_rtn_erri;
input		sii_cr_id_rtn_vld;
input [3:0]	sii_cr_id_rtn;

output [143:0]	dmubuf_din;
output		dmubuf0_wr;
output		dmubuf1_wr;
output [4:0]	dmubuf_waddr;
output [4:0]	dmubuf_raddr;
output		dmubuf_rden;
input  [143:0]	dmubuf0_dout;
input  [143:0]	dmubuf1_dout;

output [152:0]	dmupio_wack_iopkt;
output 		dmupio_srvc_wack;
output		c2i_wait;
input		iobuf_avail;

output [63:0]	ncu_dmu_pio_data;
output		ncu_dmu_pio_hdr_vld;
output		ncu_dmu_mmu_addr_vld;
output [1:0]	ncu_dmu_dpar;

//// ecc err ////
output [46:0]	dmubufsyn;
output		dmubuf_pue;
input		dmubuf_pei;

//  mb1  //
input		mb1_dmubuf0_wr_en;
input		mb1_dmubuf1_wr_en;
input		mb1_dmubuf0_rd_en;
input		mb1_dmubuf1_rd_en;
input [4:0]	mb1_addr;
input [7:0] 	mb1_wdata;
input		mb1_run;


reg [4:0]	cr_id;


assign	fifo_wr = c2i_packet_vld & ucb_sel & ~fifo_full;
assign	ucb_buf_acpt = fifo_wr;

//// fifo_din ////
assign	dmubuf_din_f[143:0] = {  
			parity[11:0],	    //[143:132]
			ct_cmd_ecc[4:0],    //[131:127]
			c2i_packet[127:64], //[126:63] pld
			c2i_packet[63:55],  //[62:54] bis,bytemask
			com_map[1:0],       //[53:52] 
			c2i_packet[52:51],  //[51:50] dummy, not used//
			//c2i_packet[50:39],    //[49:38] pa35to24
			dmupio_addr35to24[11:0], //[49:38] pa35to24
			c2i_packet[38:15],  //[37:14] pa23to0
			c2i_packet[14:12],  //[13:11] req_size
			c2i_packet[10:0] }; //[10:0] 1bit bufid,cputhr[5:0],cmd[3:0]//
assign dmubuf_din = mb1_run ? {18{mb1_wdata[7:0]}} : dmubuf_din_f[143:0];

//// ecc / par generation ////
ncu_eccgen11_ctl c2ibufpioeccgen11 (.din(c2i_packet[10:0]), .dout(ct_cmd_ecc[4:0]) );

assign	parity[0] = ~^{c2i_packet[12],c2i_packet[24],c2i_packet[36],      dmupio_addr35to24[9], c2i_packet[60],
			c2i_packet[72],c2i_packet[84],c2i_packet[96], c2i_packet[108],c2i_packet[120]};
assign	parity[1] = ~^{c2i_packet[13],c2i_packet[25],c2i_packet[37],      dmupio_addr35to24[10],c2i_packet[61],
			c2i_packet[73],c2i_packet[85],c2i_packet[97], c2i_packet[109],c2i_packet[121]};
assign	parity[2] = ~^{c2i_packet[14],c2i_packet[26],c2i_packet[38],      dmupio_addr35to24[11],c2i_packet[62],
			c2i_packet[74],c2i_packet[86],c2i_packet[98], c2i_packet[110],c2i_packet[122]};
assign	parity[3] = ~^{c2i_packet[15],c2i_packet[27],dmupio_addr35to24[0],c2i_packet[51],       c2i_packet[63],
			c2i_packet[75],c2i_packet[87],c2i_packet[99], c2i_packet[111],c2i_packet[123]};
assign	parity[4] = ~^{c2i_packet[16],c2i_packet[28],dmupio_addr35to24[1],c2i_packet[52],       c2i_packet[64],
			c2i_packet[76],c2i_packet[88],c2i_packet[100],c2i_packet[112],c2i_packet[124]};
assign	parity[5] = ~^{c2i_packet[17],c2i_packet[29],dmupio_addr35to24[2],com_map[0],           c2i_packet[65],
			c2i_packet[77],c2i_packet[89],c2i_packet[101],c2i_packet[113],c2i_packet[125]};
assign	parity[6] = ~^{c2i_packet[18],c2i_packet[30],dmupio_addr35to24[3],com_map[1],           c2i_packet[66],
			c2i_packet[78],c2i_packet[90],c2i_packet[102],c2i_packet[114],c2i_packet[126]};
assign	parity[7] = ~^{c2i_packet[19],c2i_packet[31],dmupio_addr35to24[4],c2i_packet[55],       c2i_packet[67],
			c2i_packet[79],c2i_packet[91],c2i_packet[103],c2i_packet[115],c2i_packet[127]};
assign	parity[8] = ~^{c2i_packet[20],c2i_packet[32],dmupio_addr35to24[5],c2i_packet[56],       c2i_packet[68],
			c2i_packet[80],c2i_packet[92],c2i_packet[104],c2i_packet[116]};
assign	parity[9] = ~^{c2i_packet[21],c2i_packet[33],dmupio_addr35to24[6],c2i_packet[57],       c2i_packet[69],
			c2i_packet[81],c2i_packet[93],c2i_packet[105],c2i_packet[117]};
assign	parity[10]= ~^{c2i_packet[22],c2i_packet[34],dmupio_addr35to24[7],c2i_packet[58],       c2i_packet[70],
			c2i_packet[82],c2i_packet[94],c2i_packet[106],c2i_packet[118]};
assign	parity[11]= ~^{c2i_packet[23],c2i_packet[35],dmupio_addr35to24[8],c2i_packet[59],       c2i_packet[71],
			c2i_packet[83],c2i_packet[95],c2i_packet[107],c2i_packet[119]};



//======================================================================
//================== dbl_buf ===========================================
// jimmu : ============ (now has become 64entries fifo)=================
////write dbl_buf////
//fifo_din
//fifo_wr
//fifo_full
////read dbl_buf////
//fifo_dout_v
//fifo_dout
//fifo_rd
//// mem signals ////
//memdin
//memwaddr
//memwren
//wr_clk
//memdout
//memraddr
//memrden
//rd_clk

assign	pipe_full = ~aov ? (pav & pbv & fifo_dout_v) :
		    ~pav ? (pbv & fifo_dout_v) :
		    ~pbv ? (fifo_dout_v) : 1'b1 ;

assign	raddr_inc = aog & (fifo_rd | ~pipe_full) ;
assign	raddr_p1[6:0] = raddr[6:0]+7'd1 ;
assign	raddr_muxed[6:0] = raddr_inc ? raddr_p1[6:0] : raddr[6:0] ;

assign  waddr_n[6:0]  = fifo_wr ? waddr_p1[6:0] : waddr[6:0] ;
assign	waddr_p1[6:0] = waddr[6:0]+7'd1 ;

assign	aov_n = dmubuf_rden_nobist_eco & (raddr_inc | ~aog);

assign	pa_ld = (pav==fifo_dout_ld) ;

assign	pb_ld = (~pav | fifo_dout_ld | ~pbv) ;

assign	pbs_n = pas ? (aov & !pbv & pav)&fifo_rd : fifo_dout_ld ;

assign 	pas = ~pbs;

assign	mov = pas ? pav : pbv ;

assign	fifo_dout_ld = mov & (~fifo_dout_v | fifo_rd) ;
assign 	fifo_dout_v_n = fifo_dout_v ? (~fifo_rd|mov) : mov ;

assign	a_full = (waddr_p1[6]^raddr[6]) & (waddr_p1[5:0]==raddr[5:0]) ;
assign	t_full = (waddr[6]^raddr[6]) & (waddr[5:0]==raddr[5:0]) ;
assign	fifo_full_n = (a_full&(fifo_wr&~fifo_rd))|t_full;

assign	dmubuf_waddr[4:0] = mb1_run ? mb1_addr[4:0] : waddr[4:0] ;
assign	dmubuf0_wr= mb1_run ? mb1_dmubuf0_wr_en : (fifo_wr&~waddr[5]);
assign	dmubuf1_wr= mb1_run ? mb1_dmubuf1_wr_en : (fifo_wr& waddr[5]);

assign	dmubuf_raddr[4:0] = mb1_run ? mb1_addr[4:0] : raddr_muxed[4:0] ;
assign	dmubuf_rden = mb1_run ? (mb1_dmubuf0_rd_en|mb1_dmubuf1_rd_en) : (waddr[6:0]!=raddr_muxed[6:0]) ;
assign  dmubuf_rden_nobist_eco = (waddr[6:0]!=raddr_muxed[6:0]) ;
assign	dmubuf_dout[143:0] = dmubuf1_sel2 ? dmubuf1_dout[143:0] : dmubuf0_dout[143:0] ;

ncu_c2ibufpio_ctl_msff_ctl_macro__width_1 aog_ff 
				(
				.scan_in(aog_ff_scanin),
				.scan_out(aog_ff_scanout),
				.dout		(aog),
				.l1clk		(l1clk),
				.din		(dmubuf_rden_nobist_eco ),
  .siclk(siclk),
  .soclk(soclk)
				);
ncu_c2ibufpio_ctl_msff_ctl_macro__width_1 aov_ff 
				(
				.scan_in(aov_ff_scanin),
				.scan_out(aov_ff_scanout),
				.dout		(aov),
				.l1clk		(l1clk),
				.din		(aov_n),
  .siclk(siclk),
  .soclk(soclk)
				);
ncu_c2ibufpio_ctl_msff_ctl_macro__en_1__width_1 pav_ff  
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
ncu_c2ibufpio_ctl_msff_ctl_macro__en_1__width_1 pbv_ff  
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
ncu_c2ibufpio_ctl_msff_ctl_macro__width_1 pbs_ff 
				(
				.scan_in(pbs_ff_scanin),
				.scan_out(pbs_ff_scanout),
				.dout		(pbs),
				.l1clk		(l1clk),
				.din		(pbs_n),
  .siclk(siclk),
  .soclk(soclk)
				);
ncu_c2ibufpio_ctl_msff_ctl_macro__width_1 dmubuf1_sel1_ff 
				(
				.scan_in(dmubuf1_sel1_ff_scanin),
				.scan_out(dmubuf1_sel1_ff_scanout),
				.dout		(dmubuf1_sel1),
				.l1clk		(l1clk),
				.din		(raddr_muxed[5]),
  .siclk(siclk),
  .soclk(soclk)
				);
ncu_c2ibufpio_ctl_msff_ctl_macro__width_1 dmubuf1_sel2_ff 
				(
				.scan_in(dmubuf1_sel2_ff_scanin),
				.scan_out(dmubuf1_sel2_ff_scanout),
				.dout		(dmubuf1_sel2),
				.l1clk		(l1clk),
				.din		(dmubuf1_sel1),
  .siclk(siclk),
  .soclk(soclk)
				);
ncu_c2ibufpio_ctl_msff_ctl_macro__width_7 raddr_ff 
				(
				.scan_in(raddr_ff_scanin),
				.scan_out(raddr_ff_scanout),
				.dout		(raddr[6:0]),
				.l1clk		(l1clk),
				.din		(raddr_muxed[6:0]),
  .siclk(siclk),
  .soclk(soclk)
				);
ncu_c2ibufpio_ctl_msff_ctl_macro__width_7 waddr_ff 
				(
				.scan_in(waddr_ff_scanin),
				.scan_out(waddr_ff_scanout),
				.dout		(waddr[6:0]),
				.l1clk		(l1clk),
				.din		(waddr_n[6:0]),
  .siclk(siclk),
  .soclk(soclk)
				);
ncu_c2ibufpio_ctl_msff_ctl_macro__width_1 fifo_full_ff 
				(
				.scan_in(fifo_full_ff_scanin),
				.scan_out(fifo_full_ff_scanout),
				.dout		(fifo_full),
				.l1clk		(l1clk),
				.din		(fifo_full_n),
  .siclk(siclk),
  .soclk(soclk)
				);


    // jimmy : cntr[15:0] <=  mov ? cntr[15:0]+1'b1 : cntr[15:0] ;

assign	dout_muxed_a[143:0] = pas ? pad[143:0] : dmubuf_dout[143:0] ;
ncu_c2ibufpio_ctl_msff_ctl_macro__en_1__width_144 pad_ff  
				(
				.scan_in(pad_ff_scanin),
				.scan_out(pad_ff_scanout),
				.dout		(pad[143:0]),
				.l1clk		(l1clk),
				.en		(pa_ld),
				.din		((dmubuf_dout[143:0])),
  .siclk(siclk),
  .soclk(soclk)
				);

ncu_eccchk11_ctl c2ibufpioeccchk11 (	.din(dout_muxed_a[10:0]),
					.ci(dout_muxed_a[131:127]),
					.ue(dmubuf_ue_n),
					.ce(unused_ce),
					.dout(dout_muxed_b[10:0]),
					.co(unused_co[4:0]) );

assign	dmubuf_pfail_n[0] = ~^{dout_muxed_a[11],dout_muxed_a[23],dout_muxed_a[35],dout_muxed_a[47],dout_muxed_a[59],dout_muxed_a[71],
				dout_muxed_a[83],dout_muxed_a[95], dout_muxed_a[107],dout_muxed_a[119],dout_muxed_a[132], dmubuf_pei};
assign	dmubuf_pfail_n[1] = ~^{dout_muxed_a[12],dout_muxed_a[24],dout_muxed_a[36],dout_muxed_a[48],dout_muxed_a[60],dout_muxed_a[72],
				dout_muxed_a[84],dout_muxed_a[96], dout_muxed_a[108],dout_muxed_a[120],dout_muxed_a[133]};
assign	dmubuf_pfail_n[2] = ~^{dout_muxed_a[13],dout_muxed_a[25],dout_muxed_a[37],dout_muxed_a[49],dout_muxed_a[61],dout_muxed_a[73],
				dout_muxed_a[85],dout_muxed_a[97], dout_muxed_a[109],dout_muxed_a[121],dout_muxed_a[134]};
assign	dmubuf_pfail_n[3] = ~^{dout_muxed_a[14],dout_muxed_a[26],dout_muxed_a[38],dout_muxed_a[50],dout_muxed_a[62],dout_muxed_a[74],
				dout_muxed_a[86],dout_muxed_a[98], dout_muxed_a[110],dout_muxed_a[122],dout_muxed_a[135]};
assign	dmubuf_pfail_n[4] = ~^{dout_muxed_a[15],dout_muxed_a[27],dout_muxed_a[39],dout_muxed_a[51],dout_muxed_a[63],dout_muxed_a[75],
				dout_muxed_a[87],dout_muxed_a[99 ],dout_muxed_a[111],dout_muxed_a[123],dout_muxed_a[136]};
assign	dmubuf_pfail_n[5] = ~^{dout_muxed_a[16],dout_muxed_a[28],dout_muxed_a[40],dout_muxed_a[52],dout_muxed_a[64],dout_muxed_a[76],
				dout_muxed_a[88],dout_muxed_a[100],dout_muxed_a[112],dout_muxed_a[124],dout_muxed_a[137]};
assign	dmubuf_pfail_n[6] = ~^{dout_muxed_a[17],dout_muxed_a[29],dout_muxed_a[41],dout_muxed_a[53],dout_muxed_a[65],dout_muxed_a[77],
				dout_muxed_a[89],dout_muxed_a[101],dout_muxed_a[113],dout_muxed_a[125],dout_muxed_a[138]};
assign	dmubuf_pfail_n[7] = ~^{dout_muxed_a[18],dout_muxed_a[30],dout_muxed_a[42],dout_muxed_a[54],dout_muxed_a[66],dout_muxed_a[78],
				dout_muxed_a[90],dout_muxed_a[102],dout_muxed_a[114],dout_muxed_a[126],dout_muxed_a[139]};
assign	dmubuf_pfail_n[8] = ~^{dout_muxed_a[19],dout_muxed_a[31],dout_muxed_a[43],dout_muxed_a[55],dout_muxed_a[67],dout_muxed_a[79],
				dout_muxed_a[91],dout_muxed_a[103],dout_muxed_a[115],dout_muxed_a[140]};
assign	dmubuf_pfail_n[9] = ~^{dout_muxed_a[20],dout_muxed_a[32],dout_muxed_a[44],dout_muxed_a[56],dout_muxed_a[68],dout_muxed_a[80],
				dout_muxed_a[92],dout_muxed_a[104],dout_muxed_a[116],dout_muxed_a[141]};
assign	dmubuf_pfail_n[10]= ~^{dout_muxed_a[21],dout_muxed_a[33],dout_muxed_a[45],dout_muxed_a[57],dout_muxed_a[69],dout_muxed_a[81],
				dout_muxed_a[93],dout_muxed_a[105],dout_muxed_a[117],dout_muxed_a[142]};
assign	dmubuf_pfail_n[11]= ~^{dout_muxed_a[22],dout_muxed_a[34],dout_muxed_a[46],dout_muxed_a[58],dout_muxed_a[70],dout_muxed_a[82],
				dout_muxed_a[94],dout_muxed_a[106],dout_muxed_a[118],dout_muxed_a[143]};

ncu_c2ibufpio_ctl_msff_ctl_macro__width_1 fifo_dout_v_ff 
				(
				.scan_in(fifo_dout_v_ff_scanin),
				.scan_out(fifo_dout_v_ff_scanout),
				.dout		(fifo_dout_v),
				.l1clk		(l1clk),
				.din		(fifo_dout_v_n),
  .siclk(siclk),
  .soclk(soclk)
				);

assign	dout_muxed[126:0] = {dout_muxed_a[126:11],dout_muxed_b[10:0]};
ncu_c2ibufpio_ctl_msff_ctl_macro__en_1__width_127 fifo_dout_ff  
				(
				.scan_in(fifo_dout_ff_scanin),
				.scan_out(fifo_dout_ff_scanout),
				.dout		(fifo_dout[126:0]),
				.l1clk		(l1clk),
				.en		(fifo_dout_ld),
				.din		(dout_muxed[126:0]),
  .siclk(siclk),
  .soclk(soclk)
				);

ncu_c2ibufpio_ctl_msff_ctl_macro__en_1__width_1 fifo_dout_pue_ff  
				(
				.scan_in(fifo_dout_pue_ff_scanin),
				.scan_out(fifo_dout_pue_ff_scanout),
				.dout		(fifo_dout_pue),
				.l1clk		(l1clk),
				.en		(fifo_rd|~fifo_dout_v),
				.din		((|{dmubuf_pfail_n[11:0],dmubuf_ue_n})&fifo_dout_v_n),
  .siclk(siclk),
  .soclk(soclk)
				);

ncu_c2ibufpio_ctl_msff_ctl_macro__en_1__width_1 fifo_dout_pe_ff  
				(
				.scan_in(fifo_dout_pe_ff_scanin),
				.scan_out(fifo_dout_pe_ff_scanout),
				.dout		(fifo_dout_pe),
				.l1clk		(l1clk),
				.en		(fifo_rd|~fifo_dout_v),
				.din		((|{dmubuf_pfail_n[11:0]})&fifo_dout_v_n),
  .siclk(siclk),
  .soclk(soclk)
				);

ncu_c2ibufpio_ctl_msff_ctl_macro__en_1__width_1 fifo_dout_ue_ff  
				(
				.scan_in(fifo_dout_ue_ff_scanin),
				.scan_out(fifo_dout_ue_ff_scanout),
				.dout		(fifo_dout_ue),
				.l1clk		(l1clk),
				.en		(fifo_rd|~fifo_dout_v),
				.din		(dmubuf_ue_n&fifo_dout_v_n),
  .siclk(siclk),
  .soclk(soclk)
				);

assign	dmubufsyn_rtyp[4:0] = dout_muxed_b[0] ? `PCX_STORE_RQ : `PCX_LOAD_RQ ;

ncu_c2ibufpio_ctl_msff_ctl_macro__en_1__width_47 dmubufsyn_ff  
				(
				.scan_in(dmubufsyn_ff_scanin),
				.scan_out(dmubufsyn_ff_scanout),
				.dout		(dmubufsyn[46:0]),
				.l1clk		(l1clk),
				.en		(fifo_dout_ld),
				.din		({dmubufsyn_rtyp[4:0],dout_muxed_b[9:4],dout_muxed[49:14]}),
  .siclk(siclk),
  .soclk(soclk)
				);

assign	dmubuf_pue = fifo_dout_pue ;

assign	fifo_rd = fifo_rd_from_pio | (fifo_dout_ue) | (fifo_dout_pe&iobuf_avail) ;

//=========================================== dbl_buf =================
//=====================================================================
//=====================================================================



assign	piowr  = (fifo_dout[3:0]==`UCB_WRITE_REQ) ;  //nq signal //

assign	pio_rdy = fifo_dout_v & ~fifo_dout_pue & ~dmu_pio_bb & ~mmufsh_vld & cr_id_vld ;
assign	pio_ld = pio_rdy & ((piowr&iobuf_avail)|~piowr);
assign	fifo_rd_from_pio = pio_ld;
assign	cr_id_con = pio_ld;
assign	mmu_ld = mmufsh_vld & ~dmu_pio_bb;

//eco 060628 zero out addr bit 28 for cmd_map = io space (when bit 28 is 1)//
//



//// puting together the PIO packet ////
assign  pa_lower3bits[2:0] = fifo_dout[16:14] & {3{~piowr}} ; //turn off lower 3 bits for pio wr//
assign  eco060628net1 = fifo_dout[53]&fifo_dout[42] ; //fixing bug117042 : turning off addr bit28 for io mapping//
assign	pio_hdr[63:0] = { 3'b0,			//rsvd	     [63:61]
			  ~piowr,		//piord	     [60], piowr=1 write, piowr=0 read
			  //byte_cnt[3:0], 	//byte count [53:50]
	                  cr_id[3:0],		//cr_id	     [59:56]
			  fifo_dout[61:54], 	//byte mask  [55:48]
			  {1'b0,fifo_dout[10]},	//bufid      [47:46]
			  fifo_dout[9:4],	//cputh_id   [45:40]
			  2'b0,			//rsvd	     [39:38]
			  fifo_dout[53:52],     //com map    [37:36]
			  fifo_dout[49:43],	//addr35:29  [35:29]
			  eco060628net1,	//addr28     [28]
			  fifo_dout[41:17],	//addr27:3   [27:3]
			  pa_lower3bits[2:0]	//addr2:0    [2:0]
			  };
///////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////

assign	ncu_dmu_pio_data_n[63:0] = mmu_ld ? mmufsh_data[63:0] :
				   pio_ld ? pio_hdr[63:0]     :   dmu_pio_pld[63:0] ;

/////////////////////////////////
/////// original parity /////////
//assign	ncu_dmu_dpar_n[1:0] =  mmu_ld ? {^mmufsh_data[63:32],^mmufsh_data[31:0]} :
				//pio_ld ? {^pio_hdr[63:32],^pio_hdr[31:0]} : 
					 //{^dmu_pio_pld[63:32],^dmu_pio_pld[31:0]} ;
/////////////////////////////////
///// new parity ////////////////
assign	ncu_dmu_dpar_n[0] = 
	~^{ncu_dmu_pio_data_n[0], ncu_dmu_pio_data_n[2], ncu_dmu_pio_data_n[4], ncu_dmu_pio_data_n[6],
	   ncu_dmu_pio_data_n[8], ncu_dmu_pio_data_n[10],ncu_dmu_pio_data_n[12],ncu_dmu_pio_data_n[14],
	   ncu_dmu_pio_data_n[16],ncu_dmu_pio_data_n[18],ncu_dmu_pio_data_n[20],ncu_dmu_pio_data_n[22],
	   ncu_dmu_pio_data_n[24],ncu_dmu_pio_data_n[26],ncu_dmu_pio_data_n[28],ncu_dmu_pio_data_n[30],
	   ncu_dmu_pio_data_n[32],ncu_dmu_pio_data_n[34],ncu_dmu_pio_data_n[36],ncu_dmu_pio_data_n[38],
	   ncu_dmu_pio_data_n[40],ncu_dmu_pio_data_n[42],ncu_dmu_pio_data_n[44],ncu_dmu_pio_data_n[46],
	   ncu_dmu_pio_data_n[48],ncu_dmu_pio_data_n[50],ncu_dmu_pio_data_n[52],ncu_dmu_pio_data_n[54],
	   ncu_dmu_pio_data_n[56],ncu_dmu_pio_data_n[58],ncu_dmu_pio_data_n[60],ncu_dmu_pio_data_n[62] };

assign	ncu_dmu_dpar_n[1] =
	~^{ncu_dmu_pio_data_n[1], ncu_dmu_pio_data_n[3], ncu_dmu_pio_data_n[5], ncu_dmu_pio_data_n[7],
	   ncu_dmu_pio_data_n[9], ncu_dmu_pio_data_n[11],ncu_dmu_pio_data_n[13],ncu_dmu_pio_data_n[15],
	   ncu_dmu_pio_data_n[17],ncu_dmu_pio_data_n[19],ncu_dmu_pio_data_n[21],ncu_dmu_pio_data_n[23],
	   ncu_dmu_pio_data_n[25],ncu_dmu_pio_data_n[27],ncu_dmu_pio_data_n[29],ncu_dmu_pio_data_n[31],
	   ncu_dmu_pio_data_n[33],ncu_dmu_pio_data_n[35],ncu_dmu_pio_data_n[37],ncu_dmu_pio_data_n[39],
	   ncu_dmu_pio_data_n[41],ncu_dmu_pio_data_n[43],ncu_dmu_pio_data_n[45],ncu_dmu_pio_data_n[47],
	   ncu_dmu_pio_data_n[49],ncu_dmu_pio_data_n[51],ncu_dmu_pio_data_n[53],ncu_dmu_pio_data_n[55],
	   ncu_dmu_pio_data_n[57],ncu_dmu_pio_data_n[59],ncu_dmu_pio_data_n[61],ncu_dmu_pio_data_n[63] };



assign	dmu_pio_bb_n = pio_ld & piowr;

ncu_c2ibufpio_ctl_msff_ctl_macro__width_1 dmu_pio_bb_ff 
				(
				.scan_in(dmu_pio_bb_ff_scanin),
				.scan_out(dmu_pio_bb_ff_scanout),
				.dout		(dmu_pio_bb),
				.l1clk		(l1clk),
				.din		(dmu_pio_bb_n),
  .siclk(siclk),
  .soclk(soclk)
				);

ncu_c2ibufpio_ctl_msff_ctl_macro__width_64 dmu_pio_pld_ff 
				(
				.scan_in(dmu_pio_pld_ff_scanin),
				.scan_out(dmu_pio_pld_ff_scanout),
				.dout		(dmu_pio_pld[63:0]),
				.l1clk		(l1clk),
				.din		(fifo_dout[126:63]),
  .siclk(siclk),
  .soclk(soclk)
				);

assign ncu_dmu_pio_hdr_vld = ncu_dmu_pio_hdr_vld_f & tcu_dbr_gateoff;
ncu_c2ibufpio_ctl_msff_ctl_macro__width_1 ncu_dmu_pio_hdr_vld_ff 
				(
				.scan_in(ncu_dmu_pio_hdr_vld_ff_scanin),
				.scan_out(ncu_dmu_pio_hdr_vld_ff_scanout),
				.dout		(ncu_dmu_pio_hdr_vld_f),
				.l1clk		(l1clk),
				.din		(pio_ld),
  .siclk(siclk),
  .soclk(soclk)
				);

ncu_c2ibufpio_ctl_msff_ctl_macro__width_64 ncu_dmu_pio_data_ff 
				(
				.scan_in(ncu_dmu_pio_data_ff_scanin),
				.scan_out(ncu_dmu_pio_data_ff_scanout),
				.dout		(ncu_dmu_pio_data[63:0]),
				.l1clk		(l1clk),
				.din		(ncu_dmu_pio_data_n[63:0]),
  .siclk(siclk),
  .soclk(soclk)
				);

ncu_c2ibufpio_ctl_msff_ctl_macro__width_2 ncu_dmu_dpar_ff 
				(
				.scan_in(ncu_dmu_dpar_ff_scanin),
				.scan_out(ncu_dmu_dpar_ff_scanout),
				.dout		(ncu_dmu_dpar[1:0]),
				.l1clk		(l1clk),
				.din		(ncu_dmu_dpar_n[1:0]),
  .siclk(siclk),
  .soclk(soclk)
				);

assign ncu_dmu_mmu_addr_vld = ncu_dmu_mmu_addr_vld_f & tcu_dbr_gateoff;
ncu_c2ibufpio_ctl_msff_ctl_macro__width_1 ncu_dmu_mmu_addr_vld_ff 
				(
				.scan_in(ncu_dmu_mmu_addr_vld_ff_scanin),
				.scan_out(ncu_dmu_mmu_addr_vld_ff_scanout),
				.dout		(ncu_dmu_mmu_addr_vld_f),
				.l1clk		(l1clk),
				.din		(mmu_ld),
  .siclk(siclk),
  .soclk(soclk)
				);

assign		dmupio_cpx_type[3:0] = piowr ? `CPX_ST_ACK : `CPX_LOAD_RET ;
assign	dmupio_wrack_pkt[144:0] = 
			{dmupio_cpx_type[3:0], //[144:141] rtntype
			 1'b0,		//[140] l2miss
			 ~piowr,1'b0,	//[139:138] err
			 1'b1,		//[137] nc
			 fifo_dout[6:4], //[136:134] thr
			 6'b0,		//[133:128] misc
			 2'b0,		//[127:126]
			 fifo_dout[62], //[125] bis
			 2'b0,		//[124:123]
			 fifo_dout[19:18], //[122:121] addr[5:4]
			 fifo_dout[9:7], //[120:118] cpuid
			 1'b0,		   //[117]
			 fifo_dout[24:20], //[116:112] addr[10:6]
			 7'b0,
			 fifo_dout[17], //addr[3]
			 fifo_dout[61:54], //bytemask
			 32'b0,
			 fifo_dout[126:63] }; //data
		 
assign	dmupio_wrack_cpu[7:0] = 8'b0000_0001 << fifo_dout[9:7] ;
assign	dmupio_wack_iopkt[152:0] = {dmupio_wrack_cpu[7:0],dmupio_wrack_pkt[144:0]};

// adding fifo_dout[10] to the equation. fifo_dout[10] is the 1bit bufid
// no ack is needed if a packet is from TCU with bufid 1 
assign	dmupio_srvc_wack = iobuf_avail & ((pio_rdy&piowr)|(fifo_dout_pe))&~fifo_dout[10];
assign	c2i_wait        = (pio_rdy&piowr)|(fifo_dout_pe)&~fifo_dout[10] ;
					


//=========== token engine ===============

ncu_c2ibufpio_ctl_msff_ctl_macro__width_1 rdy0_ff 
				(
				.scan_in(rdy0_ff_scanin),
				.scan_out(rdy0_ff_scanout),
				.dout		(rdy0),
				.l1clk		(l1clk),
				.din		(1'b1),
  .siclk(siclk),
  .soclk(soclk)
				);

ncu_c2ibufpio_ctl_msff_ctl_macro__width_1 rdy1_ff 
				(
				.scan_in(rdy1_ff_scanin),
				.scan_out(rdy1_ff_scanout),
				.dout		(rdy1),
				.l1clk		(l1clk),
				.din		(rdy0),
  .siclk(siclk),
  .soclk(soclk)
				);

// flop input from dmu//
ncu_c2ibufpio_ctl_msff_ctl_macro__en_1__width_1 cr_id_rtn1_vld_ff  
				(
				.scan_in(cr_id_rtn1_vld_ff_scanin),
				.scan_out(cr_id_rtn1_vld_ff_scanout),
				.dout		(dmu_cr_id_rtn_vld),
				.l1clk		(l1clk),
				.en		(rdy1),
				.din		(dmu_ncu_wrack_vld),
  .siclk(siclk),
  .soclk(soclk)
				);

ncu_c2ibufpio_ctl_msff_ctl_macro__width_4 cr_id_rtn1_ff 
				(
				.scan_in(cr_id_rtn1_ff_scanin),
				.scan_out(cr_id_rtn1_ff_scanout),
				.dout		(dmu_cr_id_rtn[3:0]),
				.l1clk		(l1clk),
				.din		(dmu_ncu_wrack_tag[3:0]),
  .siclk(siclk),
  .soclk(soclk)
				);

ncu_c2ibufpio_ctl_msff_ctl_macro__width_1 cr_id_rtn1_par_ff 
				(
				.scan_in(cr_id_rtn1_par_ff_scanin),
				.scan_out(cr_id_rtn1_par_ff_scanout),
				.dout		(dmu_cr_id_rtn_par),
				.l1clk		(l1clk),
				.din		(dmu_ncu_wrack_par),
  .siclk(siclk),
  .soclk(soclk)
				);

//assign  dmu_cr_id_rtn_err = dmu_ncu_wrack_vld & (^dmu_cr_id_rtn[3:0]^dmu_cr_id_rtn_par^dmu_cr_id_rtn_erri);
assign dmu_cr_id_rtn_err = dmu_cr_id_rtn_vld & ~(^dmu_cr_id_rtn[3:0]^dmu_cr_id_rtn_par^dmu_cr_id_rtn_erri);

assign	cr_id_rtn1_sel[15:0] = {16{dmu_cr_id_rtn_vld}} & (16'h0001 << dmu_cr_id_rtn[3:0]) ;
assign	cr_id_rtn2_sel[15:0] = {16{sii_cr_id_rtn_vld}} & (16'h0001 << sii_cr_id_rtn[3:0]) ;

assign  cr_id_rtn_sel[15:0]  = cr_id_rtn1_sel[15:0] | cr_id_rtn2_sel[15:0] ;
assign	cr_id_con_sel[15:0] = {16{cr_id_con}} & (16'h0001 << cr_id[3:0]) ;

assign	cr_id_vld = cr_id[4];

assign	token_avail_n[15:0] = cr_id_rtn_sel[15:0] | 
				( token_avail[15:0] & (~cr_id_con_sel[15:0]) ) ;

// token_avail should be powered up with all 1's (16'hffff)
assign	token_avail_n_[15:0] = ~token_avail_n[15:0];
assign 	token_avail[15:0] = ~token_avail_[15:0];
ncu_c2ibufpio_ctl_msff_ctl_macro__width_16 token_avail_l_ff 
				(
				.scan_in(token_avail_l_ff_scanin),
				.scan_out(token_avail_l_ff_scanout),
				.dout		(token_avail_[15:0]),
				.l1clk		(l1clk),
				.din		(token_avail_n_[15:0]),
  .siclk(siclk),
  .soclk(soclk)
				);

always@(token_avail) begin
    casex(token_avail[15:0]) // 0in case -parallel -full
    16'bxxxx_xxxx_xxxx_xxx1: cr_id[4:0] = 5'h10;
    16'bxxxx_xxxx_xxxx_xx10: cr_id[4:0] = 5'h11;
    16'bxxxx_xxxx_xxxx_x100: cr_id[4:0] = 5'h12;
    16'bxxxx_xxxx_xxxx_1000: cr_id[4:0] = 5'h13;
    16'bxxxx_xxxx_xxx1_0000: cr_id[4:0] = 5'h14;
    16'bxxxx_xxxx_xx10_0000: cr_id[4:0] = 5'h15;
    16'bxxxx_xxxx_x100_0000: cr_id[4:0] = 5'h16;
    16'bxxxx_xxxx_1000_0000: cr_id[4:0] = 5'h17;
    16'bxxxx_xxx1_0000_0000: cr_id[4:0] = 5'h18;
    16'bxxxx_xx10_0000_0000: cr_id[4:0] = 5'h19;
    16'bxxxx_x100_0000_0000: cr_id[4:0] = 5'h1a;
    16'bxxxx_1000_0000_0000: cr_id[4:0] = 5'h1b;
    16'bxxx1_0000_0000_0000: cr_id[4:0] = 5'h1c;
    16'bxx10_0000_0000_0000: cr_id[4:0] = 5'h1d;
    16'bx100_0000_0000_0000: cr_id[4:0] = 5'h1e;
    16'b1000_0000_0000_0000: cr_id[4:0] = 5'h1f;
		    default: cr_id[4:0] = 5'h00;
    endcase
end






/**** adding clock header ****/
ncu_c2ibufpio_ctl_l1clkhdr_ctl_macro clkgen (
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
assign aog_ff_scanin             = scan_in                  ;
assign aov_ff_scanin             = aog_ff_scanout           ;
assign pav_ff_scanin             = aov_ff_scanout           ;
assign pbv_ff_scanin             = pav_ff_scanout           ;
assign pbs_ff_scanin             = pbv_ff_scanout           ;
assign dmubuf1_sel1_ff_scanin    = pbs_ff_scanout           ;
assign dmubuf1_sel2_ff_scanin    = dmubuf1_sel1_ff_scanout  ;
assign raddr_ff_scanin           = dmubuf1_sel2_ff_scanout  ;
assign waddr_ff_scanin           = raddr_ff_scanout         ;
assign fifo_full_ff_scanin       = waddr_ff_scanout         ;
assign pad_ff_scanin             = fifo_full_ff_scanout     ;
assign fifo_dout_v_ff_scanin     = pad_ff_scanout           ;
assign fifo_dout_ff_scanin       = fifo_dout_v_ff_scanout   ;
assign fifo_dout_pue_ff_scanin   = fifo_dout_ff_scanout     ;
assign fifo_dout_pe_ff_scanin    = fifo_dout_pue_ff_scanout ;
assign fifo_dout_ue_ff_scanin    = fifo_dout_pe_ff_scanout  ;
assign dmubufsyn_ff_scanin       = fifo_dout_ue_ff_scanout  ;
assign dmu_pio_bb_ff_scanin      = dmubufsyn_ff_scanout     ;
assign dmu_pio_pld_ff_scanin     = dmu_pio_bb_ff_scanout    ;
assign ncu_dmu_pio_hdr_vld_ff_scanin = dmu_pio_pld_ff_scanout   ;
assign ncu_dmu_pio_data_ff_scanin = ncu_dmu_pio_hdr_vld_ff_scanout;
assign ncu_dmu_dpar_ff_scanin    = ncu_dmu_pio_data_ff_scanout;
assign ncu_dmu_mmu_addr_vld_ff_scanin = ncu_dmu_dpar_ff_scanout  ;
assign rdy0_ff_scanin            = ncu_dmu_mmu_addr_vld_ff_scanout;
assign rdy1_ff_scanin            = rdy0_ff_scanout          ;
assign cr_id_rtn1_vld_ff_scanin  = rdy1_ff_scanout          ;
assign cr_id_rtn1_ff_scanin      = cr_id_rtn1_vld_ff_scanout;
assign cr_id_rtn1_par_ff_scanin  = cr_id_rtn1_ff_scanout    ;
assign token_avail_l_ff_scanin   = cr_id_rtn1_par_ff_scanout;
assign scan_out                  = token_avail_l_ff_scanout ;
// fixscan end:
endmodule





// any PARAMS parms go into naming of macro

module ncu_c2ibufpio_ctl_msff_ctl_macro__width_1 (
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

module ncu_c2ibufpio_ctl_msff_ctl_macro__en_1__width_1 (
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

module ncu_c2ibufpio_ctl_msff_ctl_macro__width_7 (
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

module ncu_c2ibufpio_ctl_msff_ctl_macro__en_1__width_144 (
  din, 
  en, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [143:0] fdin;
wire [142:0] so;

  input [143:0] din;
  input en;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [143:0] dout;
  output scan_out;
assign fdin[143:0] = (din[143:0] & {144{en}}) | (dout[143:0] & ~{144{en}});






dff #(144)  d0_0 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[143:0]),
.si({scan_in,so[142:0]}),
.so({so[142:0],scan_out}),
.q(dout[143:0])
);












endmodule






// any PARAMS parms go into naming of macro

module ncu_c2ibufpio_ctl_msff_ctl_macro__en_1__width_127 (
  din, 
  en, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [126:0] fdin;
wire [125:0] so;

  input [126:0] din;
  input en;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [126:0] dout;
  output scan_out;
assign fdin[126:0] = (din[126:0] & {127{en}}) | (dout[126:0] & ~{127{en}});






dff #(127)  d0_0 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[126:0]),
.si({scan_in,so[125:0]}),
.so({so[125:0],scan_out}),
.q(dout[126:0])
);












endmodule













// any PARAMS parms go into naming of macro

module ncu_c2ibufpio_ctl_msff_ctl_macro__en_1__width_47 (
  din, 
  en, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [46:0] fdin;
wire [45:0] so;

  input [46:0] din;
  input en;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [46:0] dout;
  output scan_out;
assign fdin[46:0] = (din[46:0] & {47{en}}) | (dout[46:0] & ~{47{en}});






dff #(47)  d0_0 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[46:0]),
.si({scan_in,so[45:0]}),
.so({so[45:0],scan_out}),
.q(dout[46:0])
);












endmodule













// any PARAMS parms go into naming of macro

module ncu_c2ibufpio_ctl_msff_ctl_macro__width_64 (
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

module ncu_c2ibufpio_ctl_msff_ctl_macro__width_2 (
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

module ncu_c2ibufpio_ctl_msff_ctl_macro__width_4 (
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

module ncu_c2ibufpio_ctl_msff_ctl_macro__width_16 (
  din, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [15:0] fdin;
wire [14:0] so;

  input [15:0] din;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [15:0] dout;
  output scan_out;
assign fdin[15:0] = din[15:0];






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

module ncu_c2ibufpio_ctl_l1clkhdr_ctl_macro (
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








