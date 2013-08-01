// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: ccu_csr.v
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
`define PLL_REG 	40'h8300000000
`define RNGCTL_REG 	40'h8300000020
`define RNGDAT_REG 	40'h8300000030


// POLYNOMIAL DEFINITION 
// x64 + x61 + x57 + x56 + x52 + x51 + x50 + x48 + x47 +
// x46 + x43 + x42 + x41 + x39 + x38 + x37 + x35 + x32 +
// x28 + x25 + x22 + x21 + x17 + x15 + x13 + x12 + x11 +
// x7 + x5 + x + 1

// poly coeffecients starting with x^63 going down to x^0 (x^64 tap is always 1)
`define RNGCRC_POLY	64'b00100011000111011_100111011101001_000100100110001010111_00010100011
// default values - currently set to 62
`define DEFAULT_RNG_WAIT_VAL 16'h003E 

// FIELD DEFINITION 
`define PLL_DIV1 		5:0
`define PLL_DIV2 		11:6
`define PLL_DIV3 		17:12
`define PLL_DIV4 		24:18
`define ST_PHASE_HI		25 
`define ST_DELAY_CMP	27:26 
`define SERDES_DTM1		28 
`define SERDES_DTM2		29 
`define ALIGN_SHIFT		31:30 
`define CHANGE			32
`define PLL_CHAR_IN		33 
`define ST_DELAY_DR		35:34
`define PLL_CLAMP_FLTR  36
`define PLL_RES 		63:37 

`define RNG_RES 		63:25 
`define RNG_WAIT_CNT 	24:9 
`define	RNG_BYPASS		8
`define	RNG_VCOCTRL_SEL	7:6
`define	RNG_ANLG_SEL	5:4 
`define RNG_CTL4 		3
`define RNG_CTL3 		2
`define RNG_CTL2 		1
`define RNG_CTL1 		0


// STATE DEFINITION 
`define CCUCSR_IDLE				3'b000
`define CCUCSR_WRITE			3'b001
`define CCUCSR_READ 			3'b010
`define CCUCSR_READ_SUCCESS 	3'b011
`define CCUCSR_READ_PROB 		3'b100

`timescale 1 ns / 10 ps

module ccu_csr (
	// ucb connectivity side
	io_clk,

	wr_req_vld,		
	addr_in,
	data_in, 	
	req_accepted,	

	rd_req_vld,		
	thr_id_in,
	buf_id_in,

	rack_busy, 

	data_out, 	
	thr_id_out,
	buf_id_out,
	rd_ack_vld,  
	rd_nack_vld,  

	int_busy,
	dev_id,  
	int_vld,

	// other block connectivity
	rst_n,
	wmr_protect,
	rng_data_in,
	// RNG outputs
	rng_ctl1,
	rng_ctl2,
	rng_ctl3,
	rng_bypass, 
	rng_vcoctrl_sel,
	rng_anlg_sel, 
	// PLL outputs
	pll_div1,
	pll_div2,
	pll_div3,
	pll_div4, 
	st_phase_hi,
	st_delay_cmp,
    st_delay_dr,	
	serdes_dtm1,
	serdes_dtm2,
	change,
	align_shift,
    pll_clamp_fltr,
	pll_char_in
);

// *****************************************
// PORT DECLARATION
// *****************************************

// ucb connectivity side
// ------------------------
input io_clk;

// CSR Write case:
input wr_req_vld;		// when signal is asserted, following are valid to Local Unit
input [39:0] addr_in;	// Based on addr_in Local Unit will update the CSR info accordingly
input [63:0] data_in; 	// Write command to invalid address should be discarded silently
output req_accepted;	// CSR Reg Block will assert a 1 clock pulse to indicate acceptance


// CSR read case:
input rd_req_vld;		// when signal is asserted, following are valid to Local Unit
// input [39:0] addr_in;	// Based on addr_in Local Unit will read the CSR info accordingly
input [5:0] thr_id_in;
input [1:0] buf_id_in;
input rack_busy; // until deasserted, CSR reg Block should NOT assert rd_ack_vld/"rd_nack_vld 

// output req_accepted;	// CSR Reg Block will assert a 1 clock pulse to indicate acceptance
output [63:0] data_out;
output [5:0] thr_id_out;
output [1:0] buf_id_out;
output rd_ack_vld;  // CSR Reg Block asserts this to send return data to CSR Interface logic
output rd_nack_vld;  // if not valid, Reg Block asserts this along with thr_id_in and buf_id_in 

				
// Interrupts : 		// unused stuff	for now
output int_busy;
output [5:0] dev_id; // When Local Unit needs to send intr to NCU, there should be set 
output int_vld;  // asserted indicates a valid interrupt to NCU, and asserts only when int_busy is 0. 


// other block connectivity
// ------------------------
input	rst_n;
input 	wmr_protect;
input   rng_data_in;

// PLL_REG fields
output 	[5:0] pll_div1;
output 	[5:0] pll_div2;
output 	[5:0] pll_div3;
output 	[6:0] pll_div4;

output pll_char_in;
output change;
output [1:0] align_shift;
output serdes_dtm2;
output serdes_dtm1;
output [1:0] st_delay_cmp;
output [1:0] st_delay_dr;	
output st_phase_hi;
output pll_clamp_fltr; 


// RNG_CTL fields
output rng_ctl1;
output rng_ctl2;
output rng_ctl3;
output rng_bypass; 
output [1:0] rng_vcoctrl_sel;
output [1:0] rng_anlg_sel; 


// *****************************************
// WIRE/REG DECLARATION
// *****************************************

// ucb connectivity side
wire io_clk;

wire wr_req_vld;		
wire [39:0] addr_in;	
wire [63:0] data_in; 
reg req_accepted;	

wire rd_req_vld;	
wire [5:0] thr_id_in;
wire [1:0] buf_id_in;
wire rack_busy; 

reg [63:0] data_out;
// reg [5:0] thr_id_out;
// reg [1:0] buf_id_out;
wire [5:0] thr_id_out;
wire [1:0] buf_id_out;
reg rd_ack_vld;  
reg rd_nack_vld;  
				
wire int_busy;
wire [5:0] dev_id;  
wire int_vld;  


wire	rst_n;
wire 	wmr_protect;	
wire 	rng_data_in;
// PLL_REG fields
wire 	[5:0] pll_div1;
wire 	[5:0] pll_div2;
wire 	[5:0] pll_div3;
wire 	[6:0] pll_div4;

wire pll_char_in;
wire change;
wire [1:0] align_shift;
wire serdes_dtm2;
wire serdes_dtm1;
wire [1:0] st_delay_cmp;
wire [1:0] st_delay_dr;	
wire st_phase_hi;
wire pll_clamp_fltr; 


// RNG_CTL fields
wire rng_ctl1;
wire rng_ctl2;
wire rng_ctl3;
wire  rng_bypass; 
wire  [1:0] rng_vcoctrl_sel;
wire  [1:0] rng_anlg_sel; 
wire [15:0] rng_wait_cnt;

// ---------------------------------
// internal wire/reg stuff
// ---------------------------------

wire    rng_data_in_gated;

// for instantiated flops
wire [63:0] pll_r;
wire [63:0] rngctl_r;
wire [63:0] rngdat_r;
wire 	rng_ctl4;
wire [2:0] state;

wire    rng_data_synced;

wire pll_match ;
wire rngctl_match ;
wire rngdat_match ; 
wire pll_wr_en;
wire rngctl_wr_en;
// wire rngdat_wr_en;

wire pll_rd_en;
wire rngctl_rd_en;
wire rngdat_rd_en;

wire wr_ok;
wire rd_ok;
wire rd_nok;

wire l1clk;

wire rng_busy;
wire rng_cnt_reached; 
reg [15:0] rng_cnt;

wire [63:0] lfsr_in;
reg  [63:0] lfsr_data;
wire  [63:0] msb_sel;  // pick out msb based on poly coeff
wire [63:0] poly;  // given in decreasing powers of x
wire lfsr_fdbk;

wire [63:0] lfsr_data_muxed;
wire [15:0] max_cnt; 

wire rng_wait_done;
reg  rng_cnt_reached_q1;
// ***********************************************************
// Unused outputs 
// ***********************************************************

assign int_vld = 1'b0;
assign int_busy = 1'b0;
assign dev_id = 6'b0_0000;

// ***********************************************************
// CSR Fields 
// ***********************************************************

assign pll_div1 		= pll_r[`PLL_DIV1]; 
assign pll_div2 		= pll_r[`PLL_DIV2];
assign pll_div3 		= pll_r[`PLL_DIV3]; 
assign pll_div4 		= pll_r[`PLL_DIV4];
assign st_phase_hi 		= pll_r[`ST_PHASE_HI]; 
assign st_delay_cmp  	= pll_r[`ST_DELAY_CMP];  
assign serdes_dtm1 		= pll_r[`SERDES_DTM1]; 
assign serdes_dtm2 		= pll_r[`SERDES_DTM2]; 
assign align_shift 		= pll_r[`ALIGN_SHIFT]; 
assign change 	   		= pll_r[`CHANGE];
assign pll_char_in 		= pll_r[`PLL_CHAR_IN]; 
assign st_delay_dr  	= pll_r[`ST_DELAY_DR];   // late addition 
assign pll_clamp_fltr   = pll_r[`PLL_CLAMP_FLTR]; // late addition 

assign rng_ctl1 		= rngctl_r[`RNG_CTL1]; 
assign rng_ctl2 		= rngctl_r[`RNG_CTL2]; 
assign rng_ctl3 		= rngctl_r[`RNG_CTL3]; 
assign rng_ctl4 		= rngctl_r[`RNG_CTL4]; 
assign rng_anlg_sel 	= rngctl_r[`RNG_ANLG_SEL]; 
assign rng_vcoctrl_sel 	= rngctl_r[`RNG_VCOCTRL_SEL]; 
assign rng_bypass 		= rngctl_r[`RNG_BYPASS]; 
assign rng_wait_cnt 	= rngctl_r[`RNG_WAIT_CNT];

// address decodes & read/write enables  

assign pll_match = (addr_in == `PLL_REG);
assign rngctl_match = (addr_in == `RNGCTL_REG);
assign rngdat_match = (addr_in == `RNGDAT_REG);

assign pll_wr_en = wr_req_vld & pll_match;
assign rngctl_wr_en = wr_req_vld & rngctl_match; 
// assign rngdat_wr_en = wr_req_vld & rngdat_match; 

assign pll_rd_en = rd_req_vld & pll_match;
assign rngctl_rd_en = rd_req_vld & rngctl_match; 
assign rngdat_rd_en = rd_req_vld & rngdat_match; 


// write success -- has no effect on acknowledge
assign wr_ok = (pll_wr_en | rngctl_wr_en | wr_req_vld); 

// read success
assign rd_ok = (pll_rd_en | rngctl_rd_en | rngdat_rd_en ); 

// read no success
assign rd_nok = rd_req_vld & ~(pll_match | rngctl_match | rngdat_match); 


// ***********************************************************
// CSR Write implementation:
// ***********************************************************
// 		reg updates

wire rst_gated_n;
assign rst_gated_n = rst_n | wmr_protect;


// WARM RESET PROTECTED FLOPS
/* commented out to replace with instantiated flops

always @(posedge l1clk or negedge rst_gated_n) begin
	if (!rst_gated_n) begin
		// pll default values
		`PLL_DIV1 <= 	6'h01;	// /2 of sysclk			00_0001
		`PLL_DIV2 <= 	6'h07; 	// x8 of sysclk/2 		00_0111
		`PLL_DIV3 <= 	6'h00;	// no post-division		00_0000
		`PLL_DIV4 <= 	7'h04;	// divide by 2 			00_0010_0
		`ST_PHASE_HI <= 1'b0;                                 0
		`ST_DELAY_A <= 2'b0;                                 00
		`SERDES_DTM1 <= 1'b0;                                 0
		`SERDES_DTM2 <= 1'b0;                                 0
		`ALIGN_SHIFT <= 2'b0;                                00
		`CHANGE 	<= 1'b1;                                  1
		`PLL_CHAR_IN <= 1'b0;                                 0
		`PLL_RES <= 30'b0;               00_0000_0000_0000_0000
	end else begin
		pll_r <= (!wmr_protect && pll_wr_en)?data_in:pll_r;
	end
end
*/ 

wire rst_gated;
assign rst_gated = ~rst_gated_n;

wire [63:0] pll_r_tmp;
wire [63:0] pll_r_in;
wire [63:0] pll_r_pre_in;

wire [5:0] mask_div1;
wire [5:0] mask_div2;
wire [5:0] mask_div3;
wire [6:0] mask_div4;

// mask bits help to set to 1 during reset where needed
// (aka use default values)
assign mask_div1 = 6'b00_0001;
assign mask_div2 = 6'b00_0111;
assign mask_div3 = 6'b00_0001; 
assign mask_div4 = 7'b00_0100_0;

assign pll_r_pre_in = (!wmr_protect && pll_wr_en)?data_in:pll_r;

// invert inputs where needed
assign pll_r_in = pll_r_pre_in ^ {31'b0, 1'b1, 7'b0, mask_div4, mask_div3, mask_div2, mask_div1}; 

ccu_msff_arst_4x_64 pll_r_bank64 (  
	.q (pll_r_tmp), .reset_n (rst_gated_n), .d (pll_r_in), .l1clk (l1clk), 
	.si (1'b0), .siclk (1'b0), .soclk (1'b0), .so () 
);

assign pll_r[`PLL_DIV1    ] = pll_r_tmp[`PLL_DIV1    ] ^ mask_div1; 
assign pll_r[`PLL_DIV2    ] = pll_r_tmp[`PLL_DIV2    ] ^ mask_div2; 
assign pll_r[`PLL_DIV3    ] = pll_r_tmp[`PLL_DIV3    ] ^ mask_div3; 
assign pll_r[`PLL_DIV4    ] = pll_r_tmp[`PLL_DIV4    ] ^ mask_div4; 
assign pll_r[`ST_PHASE_HI ] = pll_r_tmp[`ST_PHASE_HI ]; 
assign pll_r[`ST_DELAY_CMP] = pll_r_tmp[`ST_DELAY_CMP];  // from `st_delay_a
assign pll_r[`SERDES_DTM1 ] = pll_r_tmp[`SERDES_DTM1 ];
assign pll_r[`SERDES_DTM2 ] = pll_r_tmp[`SERDES_DTM2 ];
assign pll_r[`ALIGN_SHIFT ] = pll_r_tmp[`ALIGN_SHIFT ]; 
assign pll_r[`CHANGE 	  ] = ~pll_r_tmp[`CHANGE 	 ]; // bit is 1 by default
assign pll_r[`PLL_CHAR_IN ] = pll_r_tmp[`PLL_CHAR_IN ]; 
assign pll_r[`ST_DELAY_DR ] = pll_r_tmp[`ST_DELAY_DR ];   // late addition 
assign pll_r[`PLL_CLAMP_FLTR] = pll_r_tmp[`PLL_CLAMP_FLTR]; // late addition 
assign pll_r[`PLL_RES     ] = pll_r_tmp[`PLL_RES     ];


// NOT WARM RESET PROTECTED 
/* commented out to replace with instantiated flops

always @(posedge l1clk or negedge rst_n) begin
	if (!rst_n) begin
		// rng default values
		`RNG_RES 	<= 55'b0;
		`RNG_BYPASS	<= 1'b0;
		`RNG_VCOCTRL_SEL <= 2'b0;
		`RNG_ANLG_SEL	 <= 2'b0;
		`RNG_CTL4 	<= 1'b0;
		`RNG_CTL3 	<= 1'b1;
		`RNG_CTL2 	<= 1'b1;
		`RNG_CTL1 	<= 1'b1;
	end else begin
		rngctl_r <= (rngctl_wr_en)?data_in:rngctl_r; 
	end
end
*/

wire [63:0] rngctl_r_in; 
wire [63:0] rngctl_r_tmp; 
wire [63:0] rngctl_r_pre_in; 

wire rst;
assign rst = ~rst_n;

assign rngctl_r_pre_in = (rngctl_wr_en)?data_in:rngctl_r; 
assign rngctl_r_in = rngctl_r_pre_in ^ 
	{39'b0,`DEFAULT_RNG_WAIT_VAL,9'b0_0000_1111}; // invert mask bits 

ccu_msff_arst_4x_64 rngctl_r_bank64 (  
	.q (rngctl_r_tmp), .reset_n (rst_n), .d (rngctl_r_in), .l1clk (l1clk), 
	.si (1'b0), .siclk (1'b0), .soclk (1'b0), .so () 
);

// inversion needed when asynchronously resetting to 1 is desired
assign rngctl_r[`RNG_RES] 	      =  rngctl_r_tmp[`RNG_RES]; 
assign rngctl_r[`RNG_WAIT_CNT]    =  rngctl_r_tmp[`RNG_WAIT_CNT] ^ `DEFAULT_RNG_WAIT_VAL;
assign rngctl_r[`RNG_BYPASS]	  =  rngctl_r_tmp[`RNG_BYPASS]; 
assign rngctl_r[`RNG_VCOCTRL_SEL] =  rngctl_r_tmp[`RNG_VCOCTRL_SEL]; 
assign rngctl_r[`RNG_ANLG_SEL]    =  rngctl_r_tmp[`RNG_ANLG_SEL]; 
assign rngctl_r[`RNG_CTL4] 	      = ~rngctl_r_tmp[`RNG_CTL4]; 
assign rngctl_r[`RNG_CTL3] 	      = ~rngctl_r_tmp[`RNG_CTL3]; 
assign rngctl_r[`RNG_CTL2] 	      = ~rngctl_r_tmp[`RNG_CTL2]; 
assign rngctl_r[`RNG_CTL1] 	      = ~rngctl_r_tmp[`RNG_CTL1]; 


// ***********************************************************
// CSR read implementation:
// ***********************************************************
// 		reg reads 
always @(posedge l1clk) begin
	if (pll_rd_en) data_out <= pll_r; 
	else if (rngctl_rd_en) data_out <= rngctl_r; 
	else if (rngdat_rd_en && rng_wait_done) data_out <= rngdat_r; 
	else data_out <= data_out;
end

// 		thread and dev id reads 


assign	thr_id_out[5:0]	=  thr_id_in[5:0]; 
assign	buf_id_out[1:0]	=  buf_id_in[1:0]; 


// ***********************************************************
// CSR read/write acknowledgement: 
// ***********************************************************
// finally settled for a simpler moore machine design
//
//  	state outputs 
always @(state) begin
	case (state) 
		`CCUCSR_IDLE: begin
				req_accepted = 1'b0;
				rd_ack_vld   = 1'b0;  
				rd_nack_vld  = 1'b0;  
			end
		`CCUCSR_WRITE: begin
				req_accepted = 1'b1;
				rd_ack_vld   = 1'b0;  
				rd_nack_vld  = 1'b0;  
			end
		`CCUCSR_READ: begin
				req_accepted = 1'b0;
				rd_ack_vld   = 1'b0;
				rd_nack_vld  = 1'b0;  
			end
		`CCUCSR_READ_PROB: begin
				req_accepted = 1'b1; 
				rd_ack_vld   = 1'b0; 
				rd_nack_vld  = 1'b1; 
			end
		`CCUCSR_READ_SUCCESS: begin
				req_accepted = 1'b1; 
				rd_ack_vld   = 1'b1; 
				rd_nack_vld  = 1'b0; 
			end
		default: begin
				req_accepted = 1'b0;
				rd_ack_vld   = 1'b0;  
				rd_nack_vld  = 1'b0;  
			end
	endcase	
end


reg [2:0]	state_in;
always @(wr_ok or rd_req_vld or rack_busy  or rng_busy or rd_ok or rd_nok or state) begin
 	case (state) 		

		`CCUCSR_IDLE: begin
			if (wr_ok) 
				state_in = `CCUCSR_WRITE;
			else if (rd_req_vld)
				state_in = `CCUCSR_READ;
			else 
				state_in = `CCUCSR_IDLE;
		end

		`CCUCSR_WRITE:	state_in = `CCUCSR_IDLE;	// always return to idle 

		`CCUCSR_READ: begin	
			if (rack_busy  || rng_busy)	// handles special rng read 
				state_in = `CCUCSR_READ;
			else if (rd_ok)  
				state_in = `CCUCSR_READ_SUCCESS;
			else if (rd_nok)  
				state_in = `CCUCSR_READ_PROB;
			else 
				state_in = `CCUCSR_READ;
		end

		`CCUCSR_READ_PROB:	state_in = `CCUCSR_IDLE;	// always return to idle 

		`CCUCSR_READ_SUCCESS: state_in = `CCUCSR_IDLE;	// always return to idle 

		default: state_in = `CCUCSR_IDLE;
	endcase
end


ccu_msff_arst_4x_3 state_bank3 ( 
	.q(state), 
	.so(), 
	.d(state_in), 
	.l1clk(l1clk),
	.si(1'b0), 
	.siclk(1'b0), 
	.soclk(1'b0), 
	.reset_n (rst_n) 
);


// ***********************************************************
// rng read mode for diagnostics  
// ***********************************************************
//

assign rng_cnt_reached = (rng_cnt == max_cnt);
// assign rng_busy = rngdat_rd_en & rng_ctl4 & ~rng_cnt_reached; 
assign rng_busy = rngdat_rd_en & ~rng_wait_done; 
assign max_cnt = (rng_ctl4) ? rng_wait_cnt : 16'd62; // + 2 cycles for states

// convert rng_cnt_reached to a pulse 
assign rng_wait_done = ~rng_cnt_reached_q1 &  rng_cnt_reached;

always @(posedge l1clk) begin
	if (!rst_n) 
		rng_cnt_reached_q1 <= 1'b0;
	else 
		rng_cnt_reached_q1 <= rng_cnt_reached;
end 

					 							
// count up to max_cnt and hold till "idle" 
always @(posedge l1clk) begin
	if (!rst_n) 
		rng_cnt <= 16'h0000;
	else begin
		if (state == `CCUCSR_IDLE) 
			rng_cnt <= 16'h0000;
		else begin		
			if (rng_cnt == max_cnt)
				rng_cnt <= max_cnt;
			else 
				rng_cnt <=  rng_cnt + 16'h0001;
		end
	end
end

// ***********************************************
// synchronizer flop (for rngdata)
// ***********************************************

assign rng_data_in_gated = (rng_ctl1 | rng_ctl2 | rng_ctl3) & rng_data_in; 

cl_a1_clksyncff_4x rng_data_syncff (
	.l1clk (l1clk), .d (rng_data_in_gated), .q(rng_data_synced),
	.si(1'b0), .siclk(1'b0), .soclk (1'b0), .so() 
);

// ***********************************************************
// LFSR implementation & update register
// ***********************************************************

// load serial shift reg/LFSR 
assign poly = `RNGCRC_POLY ; // [a63..a0] for a63.x^63 + ... a0.x^0, a64=1
// added xor for quicker entropy building; (ctl4==0) -> shift reg, period.
assign lfsr_fdbk = rng_ctl4 & (lfsr_data[63] ^ rng_data_synced); 
assign msb_sel = {64{lfsr_fdbk}} & `RNGCRC_POLY;  

// flush with one's when a read is successful & (ctl4==1) 
// need to break next statement into 2 pieces to fix shift-reg bug 
//     assign lfsr_in[63:0] = ((state == `CCUCSR_READ_SUCCESS) && rng_ctl4) ?  
// 	        64'hFFFF_FFFF_FFFF_FFFF : {lfsr_data[62:0],1'b0} ^ msb_sel[63:0];  
assign lfsr_in[63:1] = ((state == `CCUCSR_READ_SUCCESS) && rng_ctl4) ?  
 	63'h7FFF_FFFF_FFFF_FFFF : lfsr_data[62:0] ^ msb_sel[63:1];  
assign lfsr_in[0] = (rng_ctl4 == 1'b0) ? rng_data_synced :
		((state == `CCUCSR_READ_SUCCESS) && rng_ctl4) ?  1'b1 : msb_sel[0];  

// convert to sync reset for convenience
always @(posedge l1clk) begin
	if (!rst_n) begin
		lfsr_data <= 64'hFFFF_FFFF_FFFF_FFFF; 
	end else begin
		lfsr_data <= lfsr_in;
	end
end

// update rngdat_r register when done waiting
assign lfsr_data_muxed = (rng_wait_done) ? lfsr_data: rngdat_r; 

// always @(posedge l1clk) rngdat_r <= lfsr_data_muxed;
// do not flop in this stage 
assign rngdat_r = lfsr_data_muxed;

// ***********************************************************
// L1 header - io clk 
// ***********************************************************
//
cl_a1_l1hdr_8x header_io (
    .l2clk(io_clk),
    .l1clk(l1clk),
    .pce(1'b1),
    .se(1'b0),
    .pce_ov(1'b0),
    .stop(1'b0)
);



endmodule


