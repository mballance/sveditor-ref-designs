// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: ncu_c2isd_ctl.v
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










module ncu_c2isd_ctl (
  iol2clk, 
  tcu_scan_en, 
  scan_in, 
  scan_out, 
  tcu_pce_ov, 
  tcu_clk_stop, 
  tcu_aclk, 
  tcu_bclk, 
  tap_iob_packet, 
  cpubuf_dout, 
  cpubuf_rd, 
  pas, 
  pa_ld, 
  pcx_packet, 
  pcx_packet_ue, 
  cpubuf_uei, 
  pcx_packet_pe, 
  cpubuf_pei, 
  tap_sel, 
  cpu_packet_type, 
  cpu_packet_size, 
  c2i_packet_addr, 
  c2i_packet, 
  c2i_rd_nack_packet, 
  wr_ack_iopkt, 
  mb0_cpubuf_bus_sel, 
  cpubuf_mb0_data, 
  cpubufsyn) ;
wire cpubuf_pa_ff_scanin;
wire cpubuf_pa_ff_scanout;
wire [143:0] cpubuf_pa;
wire l1clk;
wire [143:0] cpubuf_dout_muxed_a;
wire eccchk6i_0;
wire eccchk6i_1;
wire cpubuf_ue_n;
wire unused_ce;
wire [5:0] cpubuf_dout_muxed_b;
wire [4:0] unused_co;
wire [9:0] cpubuf_pfail_n;
wire [128:0] cpubuf_dout_muxed;
wire pcx_packet_ff_scanin;
wire pcx_packet_ff_scanout;
wire cpubufsyn_ff_scanin;
wire cpubufsyn_ff_scanout;
wire pcx_packet_pe_ff_scanin;
wire pcx_packet_pe_ff_scanout;
wire pcx_packet_ue_ff_scanin;
wire pcx_packet_ue_ff_scanout;
wire [127:0] cpu_packet;
wire [144:0] wr_ack_packet;
wire [7:0] wr_ack_packet_cpu;
wire [3:0] nack_packet_type;
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

// TAP interface
input [127:0]	tap_iob_packet;

// CPU buffer interface
input [143:0]	cpubuf_dout;

// c2i sc blk //
input		cpubuf_rd;
input		pas;
input		pa_ld;
output [128:0]	pcx_packet;
output		pcx_packet_ue;
input		cpubuf_uei;
output		pcx_packet_pe;
input		cpubuf_pei;
input		tap_sel;
input [3:0]	cpu_packet_type;
input [2:0]	cpu_packet_size;

output [39:0]	c2i_packet_addr;

// UCB buffer interface
output [127:0]	c2i_packet;

// Nack buffer interface
output [63:0]	c2i_rd_nack_packet;

// i2c slow datapath interface
output [152:0]	wr_ack_iopkt;

// mb0 signals //
input [4:0]	mb0_cpubuf_bus_sel;
output [7:0]	cpubuf_mb0_data;

// err par //
output [50:0]	cpubufsyn;


// Internal signals

reg [7:0]	cpubuf_mb0_data;
always@(cpubuf_dout or mb0_cpubuf_bus_sel) begin
    case(mb0_cpubuf_bus_sel[4:0]) //synopsys parallel_case full_case infer_mux
    5'd0  : cpubuf_mb0_data[7:0] = {6'b0,cpubuf_dout[129:128]};
    5'd1  : cpubuf_mb0_data[7:0] = cpubuf_dout[127:120];
    5'd2  : cpubuf_mb0_data[7:0] = cpubuf_dout[119:112];
    5'd3  : cpubuf_mb0_data[7:0] = cpubuf_dout[111:104];
    5'd4  : cpubuf_mb0_data[7:0] = cpubuf_dout[103: 96];
    5'd5  : cpubuf_mb0_data[7:0] = cpubuf_dout[ 95: 88];
    5'd6  : cpubuf_mb0_data[7:0] = cpubuf_dout[ 87: 80];
    5'd7  : cpubuf_mb0_data[7:0] = cpubuf_dout[ 79: 72];
    5'd8  : cpubuf_mb0_data[7:0] = cpubuf_dout[ 71: 64];
    5'd9  : cpubuf_mb0_data[7:0] = cpubuf_dout[ 63: 56];
    5'd10 : cpubuf_mb0_data[7:0] = cpubuf_dout[ 55: 48];
    5'd11 : cpubuf_mb0_data[7:0] = cpubuf_dout[ 47: 40];
    5'd12 : cpubuf_mb0_data[7:0] = cpubuf_dout[ 39: 32];
    5'd13 : cpubuf_mb0_data[7:0] = cpubuf_dout[ 31: 24];
    5'd14 : cpubuf_mb0_data[7:0] = cpubuf_dout[ 23: 16];
    5'd15 : cpubuf_mb0_data[7:0] = cpubuf_dout[ 15:  8];
    default: cpubuf_mb0_data[7:0] = cpubuf_dout[ 7:  0];
    endcase
end
/*****************************************************************
 * Flop data from CPU buffer
 *****************************************************************/
ncu_c2isd_ctl_msff_ctl_macro__en_1__width_144 cpubuf_pa_ff  
				(
				.scan_in(cpubuf_pa_ff_scanin),
				.scan_out(cpubuf_pa_ff_scanout),
				.dout		(cpubuf_pa[143:0]),
				.l1clk		(l1clk),
				.en		(pa_ld),
				.din		(cpubuf_dout[143:0]),
  .siclk(siclk),
  .soclk(soclk)
				);

//reg [15:0]	cntr;
//initial cntr[15:0]=16'b0;
//always@(posedge iol2clk) begin
	//cntr[15:0] <=  mov ? cntr[15:0]+1'b1 : cntr[15:0] ;
//end


assign	cpubuf_dout_muxed_a[143:0] = pas ? cpubuf_pa[143:0] : cpubuf_dout[143:0] ;

assign	eccchk6i_0 = cpubuf_dout_muxed_a[129]^cpubuf_uei;
assign	eccchk6i_1 = cpubuf_dout_muxed_a[130]^cpubuf_uei;
ncu_eccchk6_ctl  c2isdeccchk6 (.din(cpubuf_dout_muxed_a[122:117]),
				.ci({cpubuf_dout_muxed_a[133:131],eccchk6i_1,eccchk6i_0}),
				.ue(cpubuf_ue_n),
				.ce(unused_ce),
				.dout(cpubuf_dout_muxed_b[5:0]),
				.co(unused_co[4:0]) );

assign	cpubuf_pfail_n[0] =  ~^{cpubuf_dout_muxed_a[0],  cpubuf_dout_muxed_a[10], cpubuf_dout_muxed_a[20], 
				cpubuf_dout_muxed_a[30], cpubuf_dout_muxed_a[40], cpubuf_dout_muxed_a[50],
				cpubuf_dout_muxed_a[60], cpubuf_dout_muxed_a[70], cpubuf_dout_muxed_a[80],
				cpubuf_dout_muxed_a[90], cpubuf_dout_muxed_a[100],cpubuf_dout_muxed_a[110],
			        cpubuf_dout_muxed_a[134],cpubuf_pei};
assign	cpubuf_pfail_n[1] =  ~^{cpubuf_dout_muxed_a[1],  cpubuf_dout_muxed_a[11], cpubuf_dout_muxed_a[21], 
				cpubuf_dout_muxed_a[31], cpubuf_dout_muxed_a[41], cpubuf_dout_muxed_a[51],
				cpubuf_dout_muxed_a[61], cpubuf_dout_muxed_a[70], cpubuf_dout_muxed_a[81],
				cpubuf_dout_muxed_a[91], cpubuf_dout_muxed_a[101],cpubuf_dout_muxed_a[111], 
				cpubuf_dout_muxed_a[135]};
assign	cpubuf_pfail_n[2] =  ~^{cpubuf_dout_muxed_a[2],  cpubuf_dout_muxed_a[12], cpubuf_dout_muxed_a[22], 
				cpubuf_dout_muxed_a[32], cpubuf_dout_muxed_a[42], cpubuf_dout_muxed_a[52],
				cpubuf_dout_muxed_a[62], cpubuf_dout_muxed_a[72], cpubuf_dout_muxed_a[82],
				cpubuf_dout_muxed_a[92], cpubuf_dout_muxed_a[102],cpubuf_dout_muxed_a[114],
			        cpubuf_dout_muxed_a[136]};
assign	cpubuf_pfail_n[3] =  ~^{cpubuf_dout_muxed_a[3],  cpubuf_dout_muxed_a[13], cpubuf_dout_muxed_a[23], 
				cpubuf_dout_muxed_a[33], cpubuf_dout_muxed_a[43], cpubuf_dout_muxed_a[52],
				cpubuf_dout_muxed_a[63], cpubuf_dout_muxed_a[73], cpubuf_dout_muxed_a[83],
				cpubuf_dout_muxed_a[93], cpubuf_dout_muxed_a[103],cpubuf_dout_muxed_a[124],
			        cpubuf_dout_muxed_a[137]};
assign	cpubuf_pfail_n[4] =  ~^{cpubuf_dout_muxed_a[4],  cpubuf_dout_muxed_a[14], cpubuf_dout_muxed_a[24], 
				cpubuf_dout_muxed_a[34], cpubuf_dout_muxed_a[44], cpubuf_dout_muxed_a[54],
				cpubuf_dout_muxed_a[64], cpubuf_dout_muxed_a[74], cpubuf_dout_muxed_a[84],
				cpubuf_dout_muxed_a[94], cpubuf_dout_muxed_a[104],cpubuf_dout_muxed_a[125],
			        cpubuf_dout_muxed_a[138]};
assign	cpubuf_pfail_n[5] =  ~^{cpubuf_dout_muxed_a[5],  cpubuf_dout_muxed_a[15], cpubuf_dout_muxed_a[25], 
				cpubuf_dout_muxed_a[35], cpubuf_dout_muxed_a[45], cpubuf_dout_muxed_a[55],
				cpubuf_dout_muxed_a[65], cpubuf_dout_muxed_a[75], cpubuf_dout_muxed_a[85],
				cpubuf_dout_muxed_a[95], cpubuf_dout_muxed_a[105],cpubuf_dout_muxed_a[126],
			        cpubuf_dout_muxed_a[139]};
assign	cpubuf_pfail_n[6] =  ~^{cpubuf_dout_muxed_a[6],  cpubuf_dout_muxed_a[16], cpubuf_dout_muxed_a[26], 
				cpubuf_dout_muxed_a[36], cpubuf_dout_muxed_a[46], cpubuf_dout_muxed_a[56],
				cpubuf_dout_muxed_a[66], cpubuf_dout_muxed_a[76], cpubuf_dout_muxed_a[86],
				cpubuf_dout_muxed_a[96], cpubuf_dout_muxed_a[106],cpubuf_dout_muxed_a[127],
			        cpubuf_dout_muxed_a[140]};
assign	cpubuf_pfail_n[7] =  ~^{cpubuf_dout_muxed_a[7],  cpubuf_dout_muxed_a[17], cpubuf_dout_muxed_a[27], 
				cpubuf_dout_muxed_a[37], cpubuf_dout_muxed_a[47], cpubuf_dout_muxed_a[57],
				cpubuf_dout_muxed_a[67], cpubuf_dout_muxed_a[77], cpubuf_dout_muxed_a[87],
				cpubuf_dout_muxed_a[98], cpubuf_dout_muxed_a[107],cpubuf_dout_muxed_a[128],
			        cpubuf_dout_muxed_a[141]};
assign	cpubuf_pfail_n[8] =  ~^{cpubuf_dout_muxed_a[8],  cpubuf_dout_muxed_a[18], cpubuf_dout_muxed_a[28], 
				cpubuf_dout_muxed_a[38], cpubuf_dout_muxed_a[48], cpubuf_dout_muxed_a[58],
				cpubuf_dout_muxed_a[68], cpubuf_dout_muxed_a[78], cpubuf_dout_muxed_a[88],
				cpubuf_dout_muxed_a[98], cpubuf_dout_muxed_a[108],cpubuf_dout_muxed_a[142]};
assign	cpubuf_pfail_n[9] =  ~^{cpubuf_dout_muxed_a[9],  cpubuf_dout_muxed_a[19], cpubuf_dout_muxed_a[29], 
				cpubuf_dout_muxed_a[39], cpubuf_dout_muxed_a[49], cpubuf_dout_muxed_a[59],
				cpubuf_dout_muxed_a[69], cpubuf_dout_muxed_a[79], cpubuf_dout_muxed_a[89],
				cpubuf_dout_muxed_a[99], cpubuf_dout_muxed_a[109],cpubuf_dout_muxed_a[143]};


assign	cpubuf_dout_muxed[128:0] = {cpubuf_dout_muxed_a[128:123],cpubuf_dout_muxed_b[5:0],cpubuf_dout_muxed_a[116:0]};
ncu_c2isd_ctl_msff_ctl_macro__en_1__width_129 pcx_packet_ff  
				(
				.scan_in(pcx_packet_ff_scanin),
				.scan_out(pcx_packet_ff_scanout),
				.dout		(pcx_packet[128:0]),
				.l1clk		(l1clk),
				.en		(cpubuf_rd),
				.din		(cpubuf_dout_muxed[128:0]),
  .siclk(siclk),
  .soclk(soclk)
				);

ncu_c2isd_ctl_msff_ctl_macro__en_1__width_51 cpubufsyn_ff  
				(
				.scan_in(cpubufsyn_ff_scanin),
				.scan_out(cpubufsyn_ff_scanout),
				.dout		(cpubufsyn[50:0]),
				.l1clk		(l1clk),
				.en		(cpubuf_rd),
				.din		({cpubuf_dout_muxed_a[128:124],cpubuf_dout_muxed_b[5:0],cpubuf_dout_muxed_a[103:64]}),
  .siclk(siclk),
  .soclk(soclk)
				);

ncu_c2isd_ctl_msff_ctl_macro__en_1__width_1 pcx_packet_pe_ff  
				(
				.scan_in(pcx_packet_pe_ff_scanin),
				.scan_out(pcx_packet_pe_ff_scanout),
				.dout		(pcx_packet_pe),
				.l1clk		(l1clk),
				.en		(cpubuf_rd),
				.din		(|cpubuf_pfail_n[9:0]),
  .siclk(siclk),
  .soclk(soclk)
				);

ncu_c2isd_ctl_msff_ctl_macro__en_1__width_1 pcx_packet_ue_ff  
				(
				.scan_in(pcx_packet_ue_ff_scanin),
				.scan_out(pcx_packet_ue_ff_scanout),
				.dout		(pcx_packet_ue),
				.l1clk		(l1clk),
				.en		(cpubuf_rd),
				.din		(cpubuf_ue_n),
  .siclk(siclk),
  .soclk(soclk)
				);



			

//// parity check for normal data path ////

// Convert from PCX format to UCB format   
assign 	cpu_packet[127:0] =  // request packet to IO devices
			     {pcx_packet[63:0],       // data [127:64]
			      pcx_packet[114],	      // reserved bit[63] (bis)
			      pcx_packet[111:104],    // reserved bits [62:55] (bytemask)
			      pcx_packet[103:64],     // address [54:15]
			      cpu_packet_size[2:0],   // size  [14:12]
			      2'b00,                  // buffer ID [11:10]
			      pcx_packet[122:117],    // cpu thr ID  [9:4]
			      cpu_packet_type[3:0]} ; // packet type [3:0]

assign 	wr_ack_packet[144:0] = {
				`CPX_ST_ACK ,		// return type [144:141]
				1'b0,			// l2miss     [140]
				2'b0,			// error      [139:138]
				1'b1,			// NC         [137]
				pcx_packet[119:117],	// thread ID  [136:134]
				6'b0,			// 	      [133:128]
				2'b0,			// XX         [127:126]
				pcx_packet[114],	// BIS        [125]
				2'b0,			// XX         [124:123]
				pcx_packet[69:68],	// addr[5:4]  [122:121]
				pcx_packet[122:120],	// cpu ID     [120:118]
				1'b0,			//	      [117]
				pcx_packet[74:70],	// addr[10:6] [116:112]
				7'b0,			// XXXXXXX    [111:105]
				pcx_packet[67],		// addr[3]    [104]
				pcx_packet[111:104],	// byte mask  [103:96]
				32'b0,			// unused     [95:64]
				pcx_packet[63:0] };	// data	      [63:0]

assign 	wr_ack_packet_cpu[7:0] = 8'b0000_0001 << pcx_packet[122:120];

assign 	wr_ack_iopkt[152:0] = {wr_ack_packet_cpu[7:0],wr_ack_packet[144:0]};

/*****************************************************************
 * Mux between TAP and CPU packet
 *****************************************************************/
// TAP packets priority > PCX packets priority
assign 	c2i_packet[127:0] = tap_sel ? tap_iob_packet[127:0] : cpu_packet[127:0];

assign 	c2i_packet_addr[39:0] = c2i_packet[54:15];


/*****************************************************************
 * Generate read nack for read to undefined address space
 *****************************************************************/
//assign 	nack_packet_type[3:0] = (cpu_packet[3:0] == `UCB_IFILL_REQ) ?  `UCB_IFILL_NACK : `UCB_READ_NACK ;
assign 	nack_packet_type[3:0] = 
	((~tap_sel&(cpu_packet[3:0]    ==`UCB_IFILL_REQ)) |
	 ( tap_sel&(tap_iob_packet[3:0]==`UCB_IFILL_REQ))) ? `UCB_IFILL_NACK : `UCB_READ_NACK ;

assign 	c2i_rd_nack_packet[63:0] = {9'b0,              // reserved bits
				    40'b0,             // address
				    3'b0,              // size
				    c2i_packet[11:10], // buffer ID
				    c2i_packet[9:4],   // thread ID
				    nack_packet_type[3:0] }; // packet type



/**** adding clock header ****/
ncu_c2isd_ctl_l1clkhdr_ctl_macro clkgen (
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
assign cpubuf_pa_ff_scanin       = scan_in                  ;
assign pcx_packet_ff_scanin      = cpubuf_pa_ff_scanout     ;
assign cpubufsyn_ff_scanin       = pcx_packet_ff_scanout    ;
assign pcx_packet_pe_ff_scanin   = cpubufsyn_ff_scanout     ;
assign pcx_packet_ue_ff_scanin   = pcx_packet_pe_ff_scanout ;
assign scan_out                  = pcx_packet_ue_ff_scanout ;
// fixscan end:
endmodule // c2i_sdp


// Local Variables:
// verilog-auto-sense-defines-constant:t
// End:









// any PARAMS parms go into naming of macro

module ncu_c2isd_ctl_msff_ctl_macro__en_1__width_144 (
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

module ncu_c2isd_ctl_msff_ctl_macro__en_1__width_129 (
  din, 
  en, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [128:0] fdin;
wire [127:0] so;

  input [128:0] din;
  input en;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [128:0] dout;
  output scan_out;
assign fdin[128:0] = (din[128:0] & {129{en}}) | (dout[128:0] & ~{129{en}});






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

module ncu_c2isd_ctl_msff_ctl_macro__en_1__width_51 (
  din, 
  en, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [50:0] fdin;
wire [49:0] so;

  input [50:0] din;
  input en;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [50:0] dout;
  output scan_out;
assign fdin[50:0] = (din[50:0] & {51{en}}) | (dout[50:0] & ~{51{en}});






dff #(51)  d0_0 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[50:0]),
.si({scan_in,so[49:0]}),
.so({so[49:0],scan_out}),
.q(dout[50:0])
);












endmodule













// any PARAMS parms go into naming of macro

module ncu_c2isd_ctl_msff_ctl_macro__en_1__width_1 (
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

module ncu_c2isd_ctl_l1clkhdr_ctl_macro (
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








