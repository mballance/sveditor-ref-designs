// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: ncu_i2csd_ctl.v
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










module ncu_i2csd_ctl (
  iol2clk, 
  scan_in, 
  scan_out, 
  tcu_pce_ov, 
  tcu_clk_stop, 
  tcu_scan_en, 
  tcu_aclk, 
  tcu_bclk, 
  sii_mondo_data0, 
  sii_mondo_data1, 
  sii_mondo_target, 
  sii_mondo_ctagerr, 
  ssi_int_packet, 
  mcu0_int_packet, 
  mcu1_int_packet, 
  mcu2_int_packet, 
  mcu3_int_packet, 
  niu_int_packet, 
  ncu_man_int_packet, 
  siipio_ack_packet, 
  dmucsr_ack_packet, 
  ccu_ack_packet, 
  mcu0_ack_packet, 
  mcu1_ack_packet, 
  mcu2_ack_packet, 
  mcu3_ack_packet, 
  ssi_ack_packet, 
  rcu_ack_packet, 
  dbg1_ack_packet, 
  niu_ack_packet, 
  ncu_man_ack_packet, 
  ncu_int_ack_packet, 
  bounce_ack_packet, 
  rd_nack_packet, 
  io_mondo_data_wr_addr_s, 
  io_mondo_data0_din_s, 
  io_mondo_data1_din_s, 
  io_intman_addr, 
  intman_tbl_dout, 
  io_rd_intman_d2, 
  int_sel, 
  ack_sel, 
  mondo_srvcd_d1, 
  int_srvcd_d2, 
  ack_srvcd_d1, 
  intman_dout_v, 
  ucb_ack_packet_d1, 
  mb0_wdata, 
  mb0_iobuf_wr_en, 
  mb0_run, 
  mb0_addr, 
  wr_ack_iopkt, 
  dmupio_wack_iopkt, 
  srvc_wr_ack, 
  mondoinvec, 
  iobuf_din, 
  iob_tap_packet, 
  raserrce, 
  raserrue) ;
wire [5:0] intman_ct_dout;
wire [5:0] intman_vec_dout;
wire io_mondo_data_wr_addr_s_ff_scanin;
wire io_mondo_data_wr_addr_s_ff_scanout;
wire l1clk;
wire io_mondo_data0_din_s_ff_scanin;
wire io_mondo_data0_din_s_ff_scanout;
wire io_mondo_data1_din_s_ff_scanin;
wire io_mondo_data1_din_s_ff_scanout;
wire sii_mondo_ctagerr_d_ff_scanin;
wire sii_mondo_ctagerr_d_ff_scanout;
wire sii_mondo_ctagerr_d;
wire [7:0] mondo_packet_cpu_d1;
wire [152:0] mondo_iopkt;
wire ucb_int_pt_d1_ff_scanin;
wire ucb_int_pt_d1_ff_scanout;
wire [3:0] ucb_int_pt_d1;
wire ucb_int_pt_d2_ff_scanin;
wire ucb_int_pt_d2_ff_scanout;
wire [3:0] ucb_int_pt_d2;
wire io_rd_intman_d2_n;
wire io_rd_intman_d2_pre;
wire io_rd_intman_d2_pre_ff_scanin;
wire io_rd_intman_d2_pre_ff_scanout;
wire ucb_int_ct_d1_ff_scanin;
wire ucb_int_ct_d1_ff_scanout;
wire [5:0] ucb_int_ct_d1;
wire ucb_int_ct_d2_ff_scanin;
wire ucb_int_ct_d2_ff_scanout;
wire [5:0] ucb_int_ct_d2;
wire ucb_int_iv_d1_ff_scanin;
wire ucb_int_iv_d1_ff_scanout;
wire [5:0] ucb_int_iv_d1;
wire ucb_int_iv_d2_ff_scanin;
wire ucb_int_iv_d2_ff_scanout;
wire [5:0] ucb_int_iv_d2;
wire [5:0] int_packet_cputhr_d2;
wire [7:0] int_packet_cpu_d2;
wire [1:0] tt_d2;
wire [5:0] int_packet_vec_d2;
wire ucb_int_soc;
wire [5:0] int_iopkt_bit_13_8;
wire [3:0] int_iopkt_rt;
wire [1:0] err_type;
wire [152:0] int_iopkt;
wire siipio_upper64b_d1_ff_scanin;
wire siipio_upper64b_d1_ff_scanout;
wire [63:0] siipio_upper64b_d1;
wire ack_packet_d1_ff_scanin;
wire ack_packet_d1_ff_scanout;
wire ack_sel_b14_d1_ff_scanin;
wire ack_sel_b14_d1_ff_scanout;
wire ack_sel_b14_d1;
wire [63:0] ack_packet_upper_pld_d1;
wire ack_packet_is_nack_d1;
wire ack_packet_is_ifill_d1;
wire [3:0] ack_packet_type_d1;
wire [7:0] ack_packet_cpu_d1;
wire [152:0] ack_iopkt;
wire [175:0] iopkt;
wire spares_scanin;
wire spares_scanout;
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

input		scan_in;
output		scan_out; 
input		tcu_pce_ov;
input		tcu_clk_stop;
input		tcu_scan_en;
input		tcu_aclk;
input		tcu_bclk;


   // UCB buffer interface
input [63:0]	sii_mondo_data0;
input [63:0]	sii_mondo_data1;
input [5:0]	sii_mondo_target;
input		sii_mondo_ctagerr;

input [24:0]	ssi_int_packet;
input [24:0]	mcu0_int_packet;
input [24:0]	mcu1_int_packet;
input [24:0]	mcu2_int_packet;
input [24:0]	mcu3_int_packet;
input [24:0]	niu_int_packet; 
input [24:0]	ncu_man_int_packet; //// from ctrl block ////

input [139:0]	siipio_ack_packet;
input [127:0]	dmucsr_ack_packet;
input [127:0]	ccu_ack_packet;
input [127:0]	mcu0_ack_packet;
input [127:0]	mcu1_ack_packet;
input [127:0]	mcu2_ack_packet;
input [127:0]	mcu3_ack_packet;
input [127:0]	ssi_ack_packet;
input [127:0]	rcu_ack_packet;
input [127:0]	dbg1_ack_packet;
input [127:0]	niu_ack_packet;

input [127:0]	ncu_man_ack_packet; //// from ctrl block ////
input [127:0]	ncu_int_ack_packet; //// from ctrl block tap_mondo access////
input [127:0]	bounce_ack_packet;  //// from ctrl block ////
input [63:0]	rd_nack_packet;     //// from ctrl block ////

// Mondo table interface to c2i
output [5:0]    io_mondo_data_wr_addr_s;
output [63:0]	io_mondo_data0_din_s;
output [63:0]	io_mondo_data1_din_s;
//output [5:0]	io_mondo_source_din_s;

// Interrupt table interface
output [6:0]	io_intman_addr;
input [11:0]	intman_tbl_dout;
output		io_rd_intman_d2;

// i2c slow control interface
input [6:0]	int_sel;
input [14:0]	ack_sel;
input		mondo_srvcd_d1;
input		int_srvcd_d2;
input		ack_srvcd_d1;
output		intman_dout_v;

output [127:0]	ucb_ack_packet_d1;

// mb0 signals /
input [7:0]	mb0_wdata;
input 		mb0_iobuf_wr_en;
input		mb0_run;
input [5:0]	mb0_addr;

// c2i slow datapath
input [152:0]	wr_ack_iopkt;
input [152:0]	dmupio_wack_iopkt;
input		srvc_wr_ack;

// IOB control interface
input [5:0]	mondoinvec;

// IO buffer interface
output [175:0]	iobuf_din;
	  
// TAP interface
output [127:0]	iob_tap_packet;

//err par//

input 		raserrce;
input  		raserrue;

// Internal signals

assign	{intman_ct_dout[5:0],
	 intman_vec_dout[5:0]} = intman_tbl_dout[11:0];



reg [24:0]	ucb_int_packet;

reg [127:0]	ucb_ack_packet;

////////////////////////////////////////////////////////////////////////
// Code starts here
////////////////////////////////////////////////////////////////////////
   /************************************************************
    * Flop Mondo interrupt data, source, target
    ************************************************************/
   // Write to Mondo data0, data1 and source
ncu_i2csd_ctl_msff_ctl_macro__width_6 io_mondo_data_wr_addr_s_ff 
				(
				.scan_in(io_mondo_data_wr_addr_s_ff_scanin),
				.scan_out(io_mondo_data_wr_addr_s_ff_scanout),
				.dout		(io_mondo_data_wr_addr_s[5:0]),
				.l1clk		(l1clk),
				.din		(sii_mondo_target[5:0]),
  .siclk(siclk),
  .soclk(soclk)
				);
ncu_i2csd_ctl_msff_ctl_macro__width_64 io_mondo_data0_din_s_ff 
				(
				.scan_in(io_mondo_data0_din_s_ff_scanin),
				.scan_out(io_mondo_data0_din_s_ff_scanout),
				.dout		(io_mondo_data0_din_s[63:0]),
				.l1clk		(l1clk),
				.din		(sii_mondo_data0[63:0]),
  .siclk(siclk),
  .soclk(soclk)
				);
ncu_i2csd_ctl_msff_ctl_macro__width_64 io_mondo_data1_din_s_ff 
				(
				.scan_in(io_mondo_data1_din_s_ff_scanin),
				.scan_out(io_mondo_data1_din_s_ff_scanout),
				.dout		(io_mondo_data1_din_s[63:0]),
				.l1clk		(l1clk),
				.din		(sii_mondo_data1[63:0]),
  .siclk(siclk),
  .soclk(soclk)
				);
ncu_i2csd_ctl_msff_ctl_macro__width_1 sii_mondo_ctagerr_d_ff 
				(
				.scan_in(sii_mondo_ctagerr_d_ff_scanin),
				.scan_out(sii_mondo_ctagerr_d_ff_scanout),
				.dout		(sii_mondo_ctagerr_d),
				.l1clk		(l1clk),
				.din		(sii_mondo_ctagerr),
  .siclk(siclk),
  .soclk(soclk)
				);
   // Assemble CPX packet
assign 	 mondo_packet_cpu_d1[7:0] = 8'b0000_0001 <<  io_mondo_data_wr_addr_s[5:3]; 

//assign 	 mondo_iobuf_din[152:0] = mb0_iobuf_sel ? {mb0_wdata[1:0],{19{mb0_wdata[7:0]}}} :
assign 	 mondo_iopkt[152:0] = 
		    {	mondo_packet_cpu_d1[7:0],	//cpu ID	[152:145]
			//1'b1,				//valid		[145]
			`CPX_INT_RET,			//return type	[144:141]
			1'b0,				//un-used	[140]
			{sii_mondo_ctagerr_d,1'b0},	//err   	[139:138]
			1'b0,				//un-used	[137]
			io_mondo_data_wr_addr_s[2:0],	//thr_id	[136:134]
			6'b0,				//un-used	[133:128]
			64'b0,				//un-used	[127:64]
			48'b0,				//un-used	[63:16]
			2'b00,				//tt		[15:14]
			io_mondo_data_wr_addr_s[5:0],	//cputhr ID	[13:8]
			2'b0,				//un-used	[7:6]
			mondoinvec[5:0] };		//int vector	[5:0]


   /************************************************************
    * Mux out Int that we are going to service
    ************************************************************/
always @(/*AUTOSENSE*/int_sel or mcu0_int_packet or mcu1_int_packet
	 or mcu2_int_packet or mcu3_int_packet or ncu_man_int_packet
	 or niu_int_packet or ssi_int_packet) begin
   case (int_sel[6:0]) // 0in case -parallel -full
      7'b1_0000_00: ucb_int_packet[24:0] = ssi_int_packet[24:0];
      7'b0_1000_00: ucb_int_packet[24:0] = mcu0_int_packet[24:0];
      7'b0_0100_00: ucb_int_packet[24:0] = mcu1_int_packet[24:0];
      7'b0_0010_00: ucb_int_packet[24:0] = mcu2_int_packet[24:0];
      7'b0_0001_00: ucb_int_packet[24:0] = mcu3_int_packet[24:0];
      7'b0_0000_10: ucb_int_packet[24:0] = niu_int_packet[24:0];
      7'b0_0000_01: ucb_int_packet[24:0] = ncu_man_int_packet[24:0];
          default : ucb_int_packet[24:0] = 25'b0;
   endcase // case(int_sel)
end // always @ (...



ncu_i2csd_ctl_msff_ctl_macro__width_4 ucb_int_pt_d1_ff 
				(
				.scan_in(ucb_int_pt_d1_ff_scanin),
				.scan_out(ucb_int_pt_d1_ff_scanout),
				.dout		(ucb_int_pt_d1[3:0]),
				.l1clk		(l1clk),
				.din		(ucb_int_packet[3:0]),
  .siclk(siclk),
  .soclk(soclk)
				);

ncu_i2csd_ctl_msff_ctl_macro__width_4 ucb_int_pt_d2_ff 
				(
				.scan_in(ucb_int_pt_d2_ff_scanin),
				.scan_out(ucb_int_pt_d2_ff_scanout),
				.dout		(ucb_int_pt_d2[3:0]),
				.l1clk		(l1clk),
				.din		(ucb_int_pt_d1[3:0]),
  .siclk(siclk),
  .soclk(soclk)
				);

assign io_rd_intman_d2_n = ucb_int_pt_d1[3:0]==`UCB_INT ;
assign io_rd_intman_d2 = io_rd_intman_d2_pre&int_srvcd_d2 ;
ncu_i2csd_ctl_msff_ctl_macro__width_1 io_rd_intman_d2_pre_ff 
				(
				.scan_in(io_rd_intman_d2_pre_ff_scanin),
				.scan_out(io_rd_intman_d2_pre_ff_scanout),
				.dout		(io_rd_intman_d2_pre),
				.l1clk		(l1clk),
				.din		(io_rd_intman_d2_n),
  .siclk(siclk),
  .soclk(soclk)
				);

ncu_i2csd_ctl_msff_ctl_macro__width_6 ucb_int_ct_d1_ff 
				(
				.scan_in(ucb_int_ct_d1_ff_scanin),
				.scan_out(ucb_int_ct_d1_ff_scanout),
				.dout		(ucb_int_ct_d1[5:0]),
				.l1clk		(l1clk),
				.din		(ucb_int_packet[9:4]),
  .siclk(siclk),
  .soclk(soclk)
				);
ncu_i2csd_ctl_msff_ctl_macro__width_6 ucb_int_ct_d2_ff 
				(
				.scan_in(ucb_int_ct_d2_ff_scanin),
				.scan_out(ucb_int_ct_d2_ff_scanout),
				.dout		(ucb_int_ct_d2[5:0]),
				.l1clk		(l1clk),
				.din		(ucb_int_ct_d1[5:0]),
  .siclk(siclk),
  .soclk(soclk)
				);

ncu_i2csd_ctl_msff_ctl_macro__width_6 ucb_int_iv_d1_ff 
				(
				.scan_in(ucb_int_iv_d1_ff_scanin),
				.scan_out(ucb_int_iv_d1_ff_scanout),
				.dout		(ucb_int_iv_d1[5:0]),
				.l1clk		(l1clk),
				.din		(ucb_int_packet[24:19]),
  .siclk(siclk),
  .soclk(soclk)
				);
ncu_i2csd_ctl_msff_ctl_macro__width_6 ucb_int_iv_d2_ff 
				(
				.scan_in(ucb_int_iv_d2_ff_scanin),
				.scan_out(ucb_int_iv_d2_ff_scanout),
				.dout		(ucb_int_iv_d2[5:0]),
				.l1clk		(l1clk),
				.din		(ucb_int_iv_d1[5:0]),
  .siclk(siclk),
  .soclk(soclk)
				);

   // Read from interrupt vector/interrupt CPU table
assign 	 io_intman_addr[6:0] = ucb_int_packet[16:10]; 

   // Assemble CPX packet
assign	 intman_dout_v = (ucb_int_pt_d2[3:0] == `UCB_INT) ;
assign 	 int_packet_cputhr_d2[5:0] = intman_dout_v ? intman_ct_dout[5:0] : ucb_int_ct_d2[5:0];
 
assign 	 int_packet_cpu_d2[7:0] = 8'b0000_0001 <<  int_packet_cputhr_d2[5:3];
	 			  // 0in bits_on -var int_packet_cpu_d2[7:0] -max 1

assign	tt_d2[1:0] = (ucb_int_pt_d2[3:0]==`UCB_RESET_VEC) ? 2'b01 :
	             (ucb_int_pt_d2[3:0]==`UCB_IDLE_VEC)  ? 2'b10 :
	             (ucb_int_pt_d2[3:0]==`UCB_RESUME_VEC)? 2'b11 : 2'b00 ; //UCB_INT,UCB_INT_VEC//

assign	int_packet_vec_d2[5:0] = intman_dout_v ? intman_vec_dout[5:0] : ucb_int_iv_d2[5:0] ;


assign  ucb_int_soc = (ucb_int_pt_d2[3:0]==`UCB_INT_SOC_UE)|
		      (ucb_int_pt_d2[3:0]==`UCB_INT_SOC_CE) ;

assign	int_iopkt_bit_13_8[5:0] = ucb_int_soc ? 6'h0 : int_packet_cputhr_d2[5:0]; 
assign	int_iopkt_rt[3:0] = ucb_int_soc ? `CPX_INT_SOC : `CPX_INT_RET ;

assign  err_type[1:0] = (ucb_int_pt_d2[3:0]==`UCB_INT_SOC_UE) ? 2'b10 : (ucb_int_pt_d2[3:0]==`UCB_INT_SOC_CE) ?
			2'b01 : 2'b00 ;
//assign err_type[1:0] = raserrue ? 2'b10: (raserrce ? 2'b01 : 2'b00);

   // assemble interrupt back to CPU
assign 	 int_iopkt[152:0] = 
		    {	int_packet_cpu_d2[7:0],		//cpu ID	[152:145]
			//1'b1,				//valid		[145]
			int_iopkt_rt[3:0],		//return type	[144:141]
			1'b0,				//un-used	[140]
			err_type[1:0],			//err field	[139:138], ue=10, ce=01
			1'b0,				//un-used	[137]
			int_packet_cputhr_d2[2:0],	//thr_id	[136:134]
			6'b0,				//un-used	[133:128]
			64'b0,				//un-used	[127:64]
			48'b0,				//un-used	[63:16]
			tt_d2[1:0],			//tt		[15:14]
			int_iopkt_bit_13_8[5:0],	//cputhr ID	[13:8]
			2'b0,				//un-used	[7:6]
			int_packet_vec_d2[5:0] };	//int vector	[5:0]
			
			
   /************************************************************
    * Mux out Ack that we are going to service
    ************************************************************/
   always @(   ack_sel or siipio_ack_packet or dmucsr_ack_packet or 
	   	ccu_ack_packet or mcu0_ack_packet or mcu1_ack_packet or 
		mcu2_ack_packet or mcu3_ack_packet or ssi_ack_packet or 
		rcu_ack_packet or dbg1_ack_packet or niu_ack_packet or 
		ncu_man_ack_packet or ncu_int_ack_packet or bounce_ack_packet or 
		rd_nack_packet ) begin
   ucb_ack_packet[127:0] = 128'b0 ;
   case (ack_sel[14:0]) // 0in case -parallel -full
	15'b100_0000_0000_0000: ucb_ack_packet[127:0] = {siipio_ack_packet[75:12],52'b0,siipio_ack_packet[11:0]};
	15'b010_0000_0000_0000: ucb_ack_packet[127:0] = dmucsr_ack_packet[127:0];
	15'b001_0000_0000_0000: ucb_ack_packet[127:0] = ccu_ack_packet[127:0];
	15'b000_1000_0000_0000: ucb_ack_packet[127:0] = mcu0_ack_packet[127:0];
	15'b000_0100_0000_0000: ucb_ack_packet[127:0] = mcu1_ack_packet[127:0];
	15'b000_0010_0000_0000: ucb_ack_packet[127:0] = mcu2_ack_packet[127:0];
	15'b000_0001_0000_0000: ucb_ack_packet[127:0] = mcu3_ack_packet[127:0];
	15'b000_0000_1000_0000: ucb_ack_packet[127:0] = ssi_ack_packet[127:0];
	15'b000_0000_0100_0000: ucb_ack_packet[127:0] = rcu_ack_packet[127:0];
	15'b000_0000_0010_0000: ucb_ack_packet[127:0] = dbg1_ack_packet[127:0];
	15'b000_0000_0001_0000: ucb_ack_packet[127:0] = niu_ack_packet[127:0]; 
	15'b000_0000_0000_1000: ucb_ack_packet[127:0] = ncu_man_ack_packet[127:0];
	15'b000_0000_0000_0100: ucb_ack_packet[127:0] = ncu_int_ack_packet[127:0];
	15'b000_0000_0000_0010: ucb_ack_packet[127:0] = bounce_ack_packet[127:0];
	15'b000_0000_0000_0001: ucb_ack_packet[127:0] = {64'b0,rd_nack_packet[63:0]};
		      default : ucb_ack_packet[127:0] = 128'b0 ;
   endcase // case(ack_sel)
end

ncu_i2csd_ctl_msff_ctl_macro__width_64 siipio_upper64b_d1_ff 
				(
				.scan_in(siipio_upper64b_d1_ff_scanin),
				.scan_out(siipio_upper64b_d1_ff_scanout),
				.dout		(siipio_upper64b_d1[63:0]),
				.l1clk		(l1clk),
				.din		(siipio_ack_packet[139:76]),
  .siclk(siclk),
  .soclk(soclk)
				);

ncu_i2csd_ctl_msff_ctl_macro__width_128 ack_packet_d1_ff 
				(
				.scan_in(ack_packet_d1_ff_scanin),
				.scan_out(ack_packet_d1_ff_scanout),
				.dout		(ucb_ack_packet_d1[127:0]),
				.l1clk		(l1clk),
				.din		(ucb_ack_packet[127:0]),
  .siclk(siclk),
  .soclk(soclk)
				);

ncu_i2csd_ctl_msff_ctl_macro__width_1 ack_sel_b14_d1_ff 
				(
				.scan_in(ack_sel_b14_d1_ff_scanin),
				.scan_out(ack_sel_b14_d1_ff_scanout),
				.dout		(ack_sel_b14_d1),
				.l1clk		(l1clk),
				.din		(ack_sel[14]),
  .siclk(siclk),
  .soclk(soclk)
				);

assign  ack_packet_upper_pld_d1[63:0] = ack_sel_b14_d1 ? siipio_upper64b_d1[63:0] : ucb_ack_packet_d1[127:64] ;

assign	ack_packet_is_nack_d1 = ((ucb_ack_packet_d1[3:0] == `UCB_READ_NACK) | 
				 (ucb_ack_packet_d1[3:0] == `UCB_IFILL_NACK));

//assign  ack_err_type[1:0] = (ack_packet_is_nack_d1|raserrue) ? 2'b10 : (raserrce ? 2'b01 : 2'b00);

assign	ack_packet_is_ifill_d1 = ((ucb_ack_packet_d1[3:0] == `UCB_IFILL_ACK) | 
				  (ucb_ack_packet_d1[3:0] == `UCB_IFILL_NACK));

assign	ack_packet_type_d1[3:0] = ack_packet_is_ifill_d1 ? `CPX_IFILL_RET : `CPX_LOAD_RET ;

assign	ack_packet_cpu_d1[7:0] = 8'b0000_0001 <<  ucb_ack_packet_d1[9:7];
			 
assign	ack_iopkt[152:0] =     {	ack_packet_cpu_d1[7:0],	    // cpu ID  [152:145]
					//1'b1,			    // valid   [145]
					ack_packet_type_d1[3:0],    // rtn typ [144:141]
					1'b0,			    // l2miss  [140]
					ack_packet_is_nack_d1,1'b0, // err     [139:138]
					///////ack_err_type[1:0],
					1'b1,			    // nc      [137]
					ucb_ack_packet_d1[6:4],     // thr     [136:134]
					3'b0,			    // un-used [133:131]
					ack_packet_is_ifill_d1,	    // F4B     [130]
					2'b0,			    // un-used [129:128]
					ack_packet_upper_pld_d1[63:0], // data    [127:64]
					ucb_ack_packet_d1[127:64] };// data    [63:0]


   /************************************************************
    * Mux transaction to IO buffer
    ************************************************************/
assign	iobuf_din[175:0] =  mb0_run ?  {22{mb0_wdata[7:0]}} : iopkt[175:0];

//assign 	 iobuf_din[153:0] = mondo_srvcd_d1 ? mondo_iobuf_din[153:0] :  // mondo
assign 	 iopkt[152:0] = mondo_srvcd_d1 ? mondo_iopkt[152:0] :  // mondo
		          int_srvcd_d2 ? int_iopkt[152:0] :    // interrupt
		         ack_srvcd_d1  ? ack_iopkt[152:0] :    // read ack/nack
                           srvc_wr_ack ? wr_ack_iopkt[152:0] : // cpubuf write ack
				         dmupio_wack_iopkt[152:0] ;

//// par ecc gen ////
//// using iopkt 152:145 to generate 157:153
ncu_eccgen11_ctl i2csdeccgen11 (.din({iopkt[152:145],iopkt[136:134]}),
				.dout(iopkt[157:153]) );
assign	iopkt[158] = ~^{iopkt[0],  iopkt[18], iopkt[36],iopkt[54],iopkt[72],
			iopkt[90], iopkt[108],iopkt[126]};
assign	iopkt[159] = ~^{iopkt[1],  iopkt[19], iopkt[37],iopkt[53],iopkt[73],
			iopkt[91], iopkt[109],iopkt[127]};
assign	iopkt[160] = ~^{iopkt[2],  iopkt[20], iopkt[38],iopkt[56],iopkt[14],
			iopkt[92], iopkt[110],iopkt[128]};
assign	iopkt[161] = ~^{iopkt[3],  iopkt[21], iopkt[39],iopkt[57],iopkt[75],
			iopkt[93], iopkt[111],iopkt[129]};
assign	iopkt[162] = ~^{iopkt[4],  iopkt[22], iopkt[40],iopkt[58],iopkt[76],
			iopkt[94], iopkt[112],iopkt[130]};
assign	iopkt[163] = ~^{iopkt[5],  iopkt[23], iopkt[41],iopkt[59],iopkt[77],
			iopkt[95], iopkt[113],iopkt[131]};
assign	iopkt[164] = ~^{iopkt[6],  iopkt[24], iopkt[42],iopkt[60],iopkt[78],
			iopkt[96], iopkt[114],iopkt[132]};
assign	iopkt[165] = ~^{iopkt[7],  iopkt[25], iopkt[43],iopkt[61],iopkt[79],
			iopkt[97], iopkt[115],iopkt[133]};
assign	iopkt[166] = ~^{iopkt[8],  iopkt[26], iopkt[44],iopkt[61],iopkt[82],
			iopkt[98] ,iopkt[116],iopkt[137]};
assign	iopkt[167] = ~^{iopkt[9],  iopkt[27], iopkt[45],iopkt[63],iopkt[81],
			iopkt[99], iopkt[117],iopkt[138]};
assign	iopkt[168] = ~^{iopkt[10], iopkt[28], iopkt[46],iopkt[64],iopkt[82],
			iopkt[100],iopkt[118],iopkt[139]};
assign	iopkt[169] = ~^{iopkt[11], iopkt[29], iopkt[47],iopkt[65],iopkt[83],
			iopkt[101],iopkt[119],iopkt[140]};
assign	iopkt[170] = ~^{iopkt[12], iopkt[30], iopkt[48],iopkt[66],iopkt[84],
			iopkt[102],iopkt[120],iopkt[141]};
assign	iopkt[171] = ~^{iopkt[13], iopkt[31], iopkt[49],iopkt[67],iopkt[85],
			iopkt[143],iopkt[131],iopkt[142]};
assign	iopkt[172] = ~^{iopkt[14], iopkt[32], iopkt[50],iopkt[68],iopkt[86],
			iopkt[104],iopkt[122],iopkt[143]};
assign	iopkt[173] = ~^{iopkt[15], iopkt[23], iopkt[51],iopkt[69],iopkt[87],
			iopkt[105],iopkt[123],iopkt[144]};
assign	iopkt[174] = ~^{iopkt[16], iopkt[34], iopkt[52],iopkt[70],iopkt[88],
			iopkt[106],iopkt[124],iopkt[145]};
assign	iopkt[175] = ~^{iopkt[17], iopkt[35], iopkt[53],iopkt[71],iopkt[89],
			iopkt[107],iopkt[125]}; 





   /************************************************************
    * Send transaction to TAP
    ************************************************************/
assign 	 iob_tap_packet[127:0] = ucb_ack_packet_d1[127:0];

/* spare gate, 58957 cells / 450 = 132 */

ncu_i2csd_ctl_spare_ctl_macro__num_11 spares  (
                .scan_in(spares_scanin),
                .scan_out(spares_scanout),
                .l1clk  (l1clk),
  .siclk(siclk),
  .soclk(soclk)
        );




/**** adding clock header ****/
ncu_i2csd_ctl_l1clkhdr_ctl_macro clkgen (
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
assign io_mondo_data_wr_addr_s_ff_scanin = scan_in                  ;
assign io_mondo_data0_din_s_ff_scanin = io_mondo_data_wr_addr_s_ff_scanout;
assign io_mondo_data1_din_s_ff_scanin = io_mondo_data0_din_s_ff_scanout;
assign sii_mondo_ctagerr_d_ff_scanin = io_mondo_data1_din_s_ff_scanout;
assign ucb_int_pt_d1_ff_scanin   = sii_mondo_ctagerr_d_ff_scanout;
assign ucb_int_pt_d2_ff_scanin   = ucb_int_pt_d1_ff_scanout ;
assign io_rd_intman_d2_pre_ff_scanin = ucb_int_pt_d2_ff_scanout ;
assign ucb_int_ct_d1_ff_scanin   = io_rd_intman_d2_pre_ff_scanout;
assign ucb_int_ct_d2_ff_scanin   = ucb_int_ct_d1_ff_scanout ;
assign ucb_int_iv_d1_ff_scanin   = ucb_int_ct_d2_ff_scanout ;
assign ucb_int_iv_d2_ff_scanin   = ucb_int_iv_d1_ff_scanout ;
assign siipio_upper64b_d1_ff_scanin = ucb_int_iv_d2_ff_scanout ;
assign ack_packet_d1_ff_scanin   = siipio_upper64b_d1_ff_scanout;
assign ack_sel_b14_d1_ff_scanin  = ack_packet_d1_ff_scanout ;
assign spares_scanin             = ack_sel_b14_d1_ff_scanout;
assign scan_out                  = spares_scanout           ;
// fixscan end:
endmodule // i2c_sdp

			       
// Local Variables:
// verilog-auto-sense-defines-constant:t
// End:








// any PARAMS parms go into naming of macro

module ncu_i2csd_ctl_msff_ctl_macro__width_6 (
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

module ncu_i2csd_ctl_msff_ctl_macro__width_64 (
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

module ncu_i2csd_ctl_msff_ctl_macro__width_1 (
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

module ncu_i2csd_ctl_msff_ctl_macro__width_4 (
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

module ncu_i2csd_ctl_msff_ctl_macro__width_128 (
  din, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [127:0] fdin;
wire [126:0] so;

  input [127:0] din;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [127:0] dout;
  output scan_out;
assign fdin[127:0] = din[127:0];






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






//  Description:        Spare gate macro for control blocks
//
//  Param num controls the number of times the macro is added
//  flops=0 can be used to use only combination spare logic


module ncu_i2csd_ctl_spare_ctl_macro__num_11 (
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






// any PARAMS parms go into naming of macro

module ncu_i2csd_ctl_l1clkhdr_ctl_macro (
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








