// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: ncu_ssiuif_ctl.v
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









module ncu_ssiuif_ctl (
  iol2clk, 
  tcu_pce_ov, 
  tcu_clk_stop, 
  tcu_scan_en, 
  tcu_aclk, 
  tcu_bclk, 
  scan_in, 
  scan_out, 
  io_jbi_ext_int_l, 
  ucb_ucbif_rd_req_vld, 
  ucb_ucbif_ifill_req_vld, 
  ucb_ucbif_wr_req_vld, 
  ucb_ucbif_thr_id_in, 
  ucb_ucbif_buf_id_in, 
  ucb_ucbif_size_in, 
  ucb_ucbif_addr_in, 
  ucb_ucbif_data_in, 
  ucb_ucbif_ack_busy, 
  ucb_ucbif_int_busy, 
  ucbif_ucb_req_acpted, 
  ucbif_ucb_rd_ack_vld, 
  ucbif_ucb_rd_nack_vld, 
  ucbif_ucb_ifill_ack_vld, 
  ucbif_ucb_ifill_nack_vld, 
  ucbif_ucb_thr_id_out, 
  ucbif_ucb_buf_id_out, 
  ucbif_ucb_data_out, 
  ucbif_ucb_int_vld, 
  ucbif_ucb_int_type, 
  ucbif_ucb_dev_id, 
  sif_ucbif_busy, 
  ucbif_sif_vld, 
  ucbif_sif_rw, 
  ucbif_sif_size, 
  ucbif_sif_addr, 
  ucbif_sif_wdata, 
  sif_ucbif_rdata, 
  sif_ucbif_rdata_vld, 
  ucbif_sif_rdata_accpt, 
  ucbif_sif_timeout_accpt, 
  sif_ucbif_timeout, 
  sif_ucbif_timeout_rw, 
  sif_ucbif_par_err, 
  ucbif_sif_timeval) ;
wire timeout_reg_en;
wire [1:0] if_sm;
wire timeout_reg_addr_match;
wire [24:0] next_timeout_reg;
wire toreg_ld1_n;
wire [24:0] timeout_reg;
wire [23:0] timeout_timeval;
wire timeout_erren;
wire ssi_addr_match;
wire ifill_en;
wire next_ifill;
wire log_reg_addr_match;
wire [1:0] log_reg;
wire log_parity_reg;
wire log_tout_reg;
wire log_reg_en;
wire log_par_err;
wire log_timeout;
wire ack_vld;
wire ifill;
wire next_ucbif_sif_rdata_accpt;
wire next_ucbif_sif_timeout_accpt;
wire [5:0] next_ucbif_ucb_thr_id_out;
wire [1:0] next_ucbif_ucb_buf_id_out;
wire ucbif_ucb_thr_id_out_en;
wire ucbif_ucb_buf_id_out_en;
wire err_int_rst_l;
wire err_int_accpt;
wire next_err_int;
wire err_int;
wire ext_int_l_negedge_rst_l;
wire ext_int_accpt;
wire next_ext_int_l_negedge;
wire ext_int_l;
wire ext_int_l_d1;
wire ext_int_l_d2;
wire ext_int_l_d3;
wire ext_int_l_d4;
wire ext_int_l_d5;
wire ext_int_l_d6;
wire ext_int_l_d7;
wire ext_int_l_negedge;
wire u_dff_io_jbi_ext_int_l_pre_sync_scanin;
wire u_dff_io_jbi_ext_int_l_pre_sync_scanout;
wire io_jbi_ext_int_l_pre_sync;
wire l1clk;
wire u_dff_io_jbi_ext_int_l_sync_scanin;
wire u_dff_io_jbi_ext_int_l_sync_scanout;
wire io_jbi_ext_int_l_sync;
wire u_dff_timeout_reg_scanin;
wire u_dff_timeout_reg_scanout;
wire u_dff_log_parity_reg_scanin;
wire u_dff_log_parity_reg_scanout;
wire u_dff_log_tout_reg_scanin;
wire u_dff_log_tout_reg_scanout;
wire u_dff_ext_int_l_scanin;
wire u_dff_ext_int_l_scanout;
wire u_dff_ext_int_l_d1_scanin;
wire u_dff_ext_int_l_d1_scanout;
wire u_dff_ext_int_l_d2_scanin;
wire u_dff_ext_int_l_d2_scanout;
wire u_dff_ext_int_l_d3_scanin;
wire u_dff_ext_int_l_d3_scanout;
wire u_dff_ext_int_l_d4_scanin;
wire u_dff_ext_int_l_d4_scanout;
wire u_dff_ext_int_l_d5_scanin;
wire u_dff_ext_int_l_d5_scanout;
wire u_dff_ext_int_l_d6_scanin;
wire u_dff_ext_int_l_d6_scanout;
wire u_dff_ext_int_l_d7_scanin;
wire u_dff_ext_int_l_d7_scanout;
wire u_dffrl_if_sm_scanin;
wire u_dffrl_if_sm_scanout;
wire u_dffrl_ucbif_sif_rdata_accpt_scanin;
wire u_dffrl_ucbif_sif_rdata_accpt_scanout;
wire u_dffrl_ucbif_sif_timeout_accpt_scanin;
wire u_dffrl_ucbif_sif_timeout_accpt_scanout;
wire n_err_int;
wire u_dffrl_err_int_scanin;
wire u_dffrl_err_int_scanout;
wire n_ext_int_l_negedge;
wire u_dffrl_ext_int_l_negedge_scanin;
wire u_dffrl_ext_int_l_negedge_scanout;
wire toreg_ld0_ff_scanin;
wire toreg_ld0_ff_scanout;
wire toreg_ld0_;
wire toreg_ld1_ff_scanin;
wire toreg_ld1_ff_scanout;
wire u_dffrle_ifill_scanin;
wire u_dffrle_ifill_scanout;
wire u_dffrle_ucbif_ucb_thr_id_out_scanin;
wire u_dffrle_ucbif_ucb_thr_id_out_scanout;
wire u_dffrle_ucbif_ucb_buf_id_out_scanin;
wire u_dffrle_ucbif_ucb_buf_id_out_scanout;
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

// pad
input io_jbi_ext_int_l;

// ucb interface
input 		ucb_ucbif_rd_req_vld;
input 		ucb_ucbif_ifill_req_vld;  // 4-byte read
input 		ucb_ucbif_wr_req_vld;
input [5:0] 	ucb_ucbif_thr_id_in;
input [1:0] 	ucb_ucbif_buf_id_in;
input [2:0] 	ucb_ucbif_size_in;
input [39:0] 	ucb_ucbif_addr_in;
input [63:0] 	ucb_ucbif_data_in;
input 		ucb_ucbif_ack_busy;
input 		ucb_ucbif_int_busy;
output		ucbif_ucb_req_acpted;
output 		ucbif_ucb_rd_ack_vld;
output 		ucbif_ucb_rd_nack_vld;
output 		ucbif_ucb_ifill_ack_vld;
output 		ucbif_ucb_ifill_nack_vld;
output [5:0]  	ucbif_ucb_thr_id_out;
output [1:0]  	ucbif_ucb_buf_id_out;
output [63:0] 	ucbif_ucb_data_out;
output 		ucbif_ucb_int_vld;
output [3:0] 	ucbif_ucb_int_type;
output [8:0] 	ucbif_ucb_dev_id;

//issue SSI command
input 		 sif_ucbif_busy;
output 		 ucbif_sif_vld;
output 		 ucbif_sif_rw;            //instr w/o data will have no dlen asserted
output [1:0] 	 ucbif_sif_size;
output [27:0]    ucbif_sif_addr;
output [63:0] 	 ucbif_sif_wdata;

//read return data
input [63:0] 	 sif_ucbif_rdata;
input 		 sif_ucbif_rdata_vld;
output 		 ucbif_sif_rdata_accpt;
output 		 ucbif_sif_timeout_accpt;

// SSI CSR 
input 		 sif_ucbif_timeout;
input 		 sif_ucbif_timeout_rw;
input 		 sif_ucbif_par_err;
output [23:0] 	 ucbif_sif_timeval;


//parameter SSI_ADDR = 12'hFF_F,
	  //SSI_ADDR_TIMEOUT_REG = 40'hFF_0001_0088,
	  //SSI_ADDR_LOG_REG     = 40'hFF_0000_0018;

//parameter IF_IDLE = 2'b00,
	  //IF_ACPT = 2'b01,
	  //IF_DROP = 2'b10;

////////////////////////////////////////////////////////////////////////
// Interface signal type declarations
////////////////////////////////////////////////////////////////////////
reg [63:0]  ucbif_ucb_data_out;
reg [8:0]   ucbif_ucb_dev_id;
reg [1:0]   ucbif_sif_size;

reg [1:0]  next_if_sm;
reg 	   next_log_parity_reg;
reg 	   next_log_tout_reg;










//-----------------------
// Timeout Register
//-----------------------

assign timeout_reg_en =   if_sm[1:0] == `IF_ACPT 
                     & timeout_reg_addr_match
		        & ucb_ucbif_wr_req_vld;

//assign	next_timeout_reg[24:0] = ~toreg_ld1_n ? 25'h080_0000 :
assign	next_timeout_reg[24:0] = ~toreg_ld1_n ? 25'h020_0000 :
				timeout_reg_en ? ucb_ucbif_data_in[24:0] : timeout_reg[24:0] ;

assign timeout_timeval[23:0] = timeout_reg[23:0];
assign timeout_erren   = timeout_reg[24];

assign ucbif_sif_timeval = timeout_timeval;

//*******************************************************************************
// Accept UBC Request
//*******************************************************************************

always @(/*AUTOSENSE*/if_sm or sif_ucbif_busy or ssi_addr_match
	 or ucb_ucbif_ack_busy or ucb_ucbif_ifill_req_vld
	 or ucb_ucbif_rd_req_vld or ucb_ucbif_size_in
	 or ucb_ucbif_wr_req_vld) begin
case (if_sm[1:0])
   `IF_IDLE: begin
	 if ((ucb_ucbif_rd_req_vld 
	      | ucb_ucbif_wr_req_vld
	      | ucb_ucbif_ifill_req_vld)
	     & ~sif_ucbif_busy) begin
	    if (  (~ucb_ucbif_ifill_req_vld
		   & ucb_ucbif_size_in == 3'b111)  //drop all 16-byte req and nack reads
		| (ucb_ucbif_ifill_req_vld
		   & ~ssi_addr_match))                 //drop ifill access to ssi csr
	       next_if_sm[1:0] = `IF_DROP ;
	    else
	       next_if_sm[1:0] = `IF_ACPT ;
	 end
	 else
	    next_if_sm[1:0] = `IF_IDLE ;
   end

   `IF_ACPT: begin
	 if (ssi_addr_match)
	    next_if_sm[1:0] = `IF_IDLE ;
	 else begin
	    // reg addr match
	    if  (ucb_ucbif_rd_req_vld
		 & ucb_ucbif_ack_busy)
	       next_if_sm[1:0] = `IF_ACPT ;    // wait until ~ack_busy to accept reg read
	    else
	       next_if_sm[1:0] = `IF_IDLE ;
	 end
   end

   `IF_DROP: begin
	 if (  (ucb_ucbif_rd_req_vld | ucb_ucbif_ifill_req_vld)
	     & ucb_ucbif_ack_busy)
	    next_if_sm[1:0] = `IF_DROP ;
	 else
	    next_if_sm[1:0] = `IF_IDLE ;
   end
	 
   default: begin
	 next_if_sm[1:0] = 2'b0 ;
   end
endcase
end


assign ucbif_ucb_req_acpted =   (if_sm[1:0] == `IF_ACPT
				 & ~(  ~ssi_addr_match     // reg read
				     & ucb_ucbif_rd_req_vld
				     & ucb_ucbif_ack_busy))
                           | (  if_sm[1:0] == `IF_DROP 
				 & next_if_sm[1:0] == `IF_IDLE);

assign ifill_en = next_if_sm[1:0] == `IF_ACPT ;
assign next_ifill = ucb_ucbif_ifill_req_vld;

//------------------
// Address Decode
//------------------
assign timeout_reg_addr_match = ucb_ucbif_addr_in[39:0]  == `SSI_ADDR_TIMEOUT_REG ;
assign log_reg_addr_match     = ucb_ucbif_addr_in[39:0]  == `SSI_ADDR_LOG_REG ;
assign ssi_addr_match         = ucb_ucbif_addr_in[39:28] == `SSI_ADDR ;

//-----------------------
// Log Register
//-----------------------

assign log_reg[1] = log_parity_reg;
assign log_reg[0]   = log_tout_reg;

assign log_reg_en = if_sm[1:0] == `IF_ACPT 
		    & log_reg_addr_match
		    & ucb_ucbif_wr_req_vld;

assign log_par_err = sif_ucbif_par_err 
                  & timeout_erren
	             & (~sif_ucbif_rdata_vld
	                | ucbif_sif_rdata_accpt);
assign log_timeout = sif_ucbif_timeout 
                  & ucbif_sif_timeout_accpt 
	             & timeout_erren;

always @ ( /*AUTOSENSE*/log_par_err or log_parity_reg or log_reg_en
	  or ucb_ucbif_data_in) begin
if (log_reg_en & ucb_ucbif_data_in[1])
   next_log_parity_reg = 1'b0;
else begin
   if (log_par_err)
	 next_log_parity_reg = 1'b1;
   else
	 next_log_parity_reg = log_parity_reg;
end
end

always @ ( /*AUTOSENSE*/log_reg_en or log_timeout or log_tout_reg
	  or ucb_ucbif_data_in) begin
if (log_reg_en & ucb_ucbif_data_in[0])
   next_log_tout_reg = 1'b0;
else begin
   if (log_timeout)
	 next_log_tout_reg = 1'b1;
   else
	 next_log_tout_reg = log_tout_reg;
end
end

//------------------------
// Launch SSI Transaction
//------------------------
assign ucbif_sif_vld   =   if_sm[1:0] == `IF_IDLE
			 & next_if_sm[1:0] == `IF_ACPT 
			 & ssi_addr_match;
assign ucbif_sif_rw    = ~ucb_ucbif_wr_req_vld;
assign ucbif_sif_addr  = ucb_ucbif_addr_in[27:0];
assign ucbif_sif_wdata = ucb_ucbif_data_in[63:0];

always @ ( /*AUTOSENSE*/ucb_ucbif_ifill_req_vld or ucb_ucbif_size_in) begin
if (ucb_ucbif_ifill_req_vld)
   ucbif_sif_size = 2'b10;
else
   ucbif_sif_size  = ucb_ucbif_size_in[1:0];
end

   
//*******************************************************************************
// Return Read Data
//*******************************************************************************
assign ack_vld =   (sif_ucbif_rdata_vld
		    & ~ucbif_sif_rdata_accpt
		    & ~ucb_ucbif_ack_busy) //SSI rd return
              | (if_sm[1:0] == `IF_ACPT 
		    & ~ssi_addr_match      // reg addr match
		    & ucb_ucbif_rd_req_vld
		    & ~ucb_ucbif_ack_busy);

assign ucbif_ucb_rd_ack_vld    = ack_vld & ~sif_ucbif_par_err & ~ifill;
assign ucbif_ucb_ifill_ack_vld = ack_vld & ~sif_ucbif_par_err &  ifill;

assign ucbif_ucb_rd_nack_vld    =   ( ~ifill 
                                  & (  (ack_vld & sif_ucbif_par_err)
					| (sif_ucbif_timeout 
				       	   & sif_ucbif_timeout_rw 
				       	   & ~ucb_ucbif_ack_busy)))
                               | (if_sm[1:0] == `IF_DROP
				     & ucb_ucbif_rd_req_vld
				     & ~ucb_ucbif_ack_busy);

assign ucbif_ucb_ifill_nack_vld =   (ifill 
                                  & (  (ack_vld & sif_ucbif_par_err)
					| (sif_ucbif_timeout 
					   & sif_ucbif_timeout_rw 
					   & ~ucb_ucbif_ack_busy)))
                               | (if_sm[1:0] == `IF_DROP
				     & ucb_ucbif_ifill_req_vld
				     & ~ucb_ucbif_ack_busy);

always @(/*AUTOSENSE*/if_sm or log_reg or sif_ucbif_rdata
	 or sif_ucbif_timeout or timeout_reg or ucb_ucbif_addr_in) begin
if (if_sm[1:0] == `IF_IDLE)
   ucbif_ucb_data_out[63:0] = sif_ucbif_rdata[63:0];
else if (sif_ucbif_timeout)
   ucbif_ucb_data_out[63:0] = 64'b0;
else begin
   case (ucb_ucbif_addr_in[39:0])
	 `SSI_ADDR_TIMEOUT_REG: ucbif_ucb_data_out[63:0] = { 39'b0, timeout_reg[24:0] };
	 `SSI_ADDR_LOG_REG:     ucbif_ucb_data_out[63:0] = { 62'b0, log_reg[1:0] };
	 default:              ucbif_ucb_data_out[63:0] =   64'b0;
   endcase
end
end

assign next_ucbif_sif_rdata_accpt = sif_ucbif_rdata_vld
				    & ~ucbif_sif_rdata_accpt
				    & ~ucb_ucbif_ack_busy;

assign next_ucbif_sif_timeout_accpt = sif_ucbif_timeout
                                   & ~ucbif_sif_timeout_accpt
                                   & (  ~sif_ucbif_timeout_rw
                                      | ~ucb_ucbif_ack_busy);

assign next_ucbif_ucb_thr_id_out[5:0] = ucb_ucbif_thr_id_in[5:0];
assign next_ucbif_ucb_buf_id_out[1:0] = ucb_ucbif_buf_id_in[1:0];
assign ucbif_ucb_thr_id_out_en = next_if_sm[1:0] != `IF_IDLE ;
assign ucbif_ucb_buf_id_out_en = next_if_sm[1:0] != `IF_IDLE ;

//*******************************************************************************
// Interrupt
//*******************************************************************************

// error interrupt
assign err_int_rst_l = ~err_int_accpt;
assign next_err_int  = err_int | log_par_err | log_timeout;

// external interrupt
assign ext_int_l_negedge_rst_l = ~ext_int_accpt;
assign next_ext_int_l_negedge  =   ~ext_int_l
                              & ~ext_int_l_d1
                              & ~ext_int_l_d2
                              & ~ext_int_l_d3
                              &  ext_int_l_d4
                              &  ext_int_l_d5
                              &  ext_int_l_d6
                              &  ext_int_l_d7;

// signal interrupt
// - for simplicity, always give error interrupts priority
assign err_int_accpt = ~ucb_ucbif_int_busy &  err_int;
assign ext_int_accpt = ~ucb_ucbif_int_busy & ~err_int & ext_int_l_negedge;

assign ucbif_ucb_int_vld = err_int_accpt | ext_int_accpt;

always @ ( /*AUTOSENSE*/err_int_accpt) begin
if (err_int_accpt)
   //original IOB in N1 only looks at the lower 2 bit of the dev_id
   //ucbif_ucb_dev_id   = 9'd17;
   ucbif_ucb_dev_id   = 9'd1;
else
   //ucbif_ucb_dev_id   = 9'd30;
   ucbif_ucb_dev_id   = 9'd2;
end
 
assign ucbif_ucb_int_type = 4'b1000;

//*******************************************************************************
//  Synchronization DFF
//*******************************************************************************
//----------------------
// Async -> JBUS
//----------------------

ncu_ssiuif_ctl_msff_ctl_macro__width_1 u_dff_io_jbi_ext_int_l_pre_sync 
				(
				.scan_in(u_dff_io_jbi_ext_int_l_pre_sync_scanin),
				.scan_out(u_dff_io_jbi_ext_int_l_pre_sync_scanout),
				.dout		(io_jbi_ext_int_l_pre_sync),
				.l1clk		(l1clk),
				.din		(io_jbi_ext_int_l),
  .siclk(siclk),
  .soclk(soclk)
				);

ncu_ssiuif_ctl_msff_ctl_macro__width_1 u_dff_io_jbi_ext_int_l_sync 
				(
				.scan_in(u_dff_io_jbi_ext_int_l_sync_scanin),
				.scan_out(u_dff_io_jbi_ext_int_l_sync_scanout),
				.dout		(io_jbi_ext_int_l_sync),
				.l1clk		(l1clk),
				.din		(io_jbi_ext_int_l_pre_sync),
  .siclk(siclk),
  .soclk(soclk)
				);

//*******************************************************************************
// DFF Instantiations
//*******************************************************************************
ncu_ssiuif_ctl_msff_ctl_macro__width_25 u_dff_timeout_reg 
				(
				.scan_in(u_dff_timeout_reg_scanin),
				.scan_out(u_dff_timeout_reg_scanout),
				.dout		(timeout_reg[24:0]),
				.l1clk		(l1clk),
				.din		(next_timeout_reg[24:0]),
  .siclk(siclk),
  .soclk(soclk)
				);

ncu_ssiuif_ctl_msff_ctl_macro__width_1 u_dff_log_parity_reg 
				(
				.scan_in(u_dff_log_parity_reg_scanin),
				.scan_out(u_dff_log_parity_reg_scanout),
				.dout		(log_parity_reg),
				.l1clk		(l1clk),
				.din		(next_log_parity_reg),
  .siclk(siclk),
  .soclk(soclk)
				);

ncu_ssiuif_ctl_msff_ctl_macro__width_1 u_dff_log_tout_reg 
				(
				.scan_in(u_dff_log_tout_reg_scanin),
				.scan_out(u_dff_log_tout_reg_scanout),
				.dout		(log_tout_reg),
				.l1clk		(l1clk),
				.din		(next_log_tout_reg),
  .siclk(siclk),
  .soclk(soclk)
				);

ncu_ssiuif_ctl_msff_ctl_macro__width_1 u_dff_ext_int_l 
				(
				.scan_in(u_dff_ext_int_l_scanin),
				.scan_out(u_dff_ext_int_l_scanout),
				.dout		(ext_int_l),
				.l1clk		(l1clk),
				.din		(io_jbi_ext_int_l_sync),
  .siclk(siclk),
  .soclk(soclk)
				);

ncu_ssiuif_ctl_msff_ctl_macro__width_1 u_dff_ext_int_l_d1 
				(
				.scan_in(u_dff_ext_int_l_d1_scanin),
				.scan_out(u_dff_ext_int_l_d1_scanout),
				.dout		(ext_int_l_d1),
				.l1clk		(l1clk),
				.din		(ext_int_l),
  .siclk(siclk),
  .soclk(soclk)
				);

ncu_ssiuif_ctl_msff_ctl_macro__width_1 u_dff_ext_int_l_d2 
				(
				.scan_in(u_dff_ext_int_l_d2_scanin),
				.scan_out(u_dff_ext_int_l_d2_scanout),
				.dout		(ext_int_l_d2),
				.l1clk		(l1clk),
				.din		(ext_int_l_d1),
  .siclk(siclk),
  .soclk(soclk)
				);

ncu_ssiuif_ctl_msff_ctl_macro__width_1 u_dff_ext_int_l_d3 
				(
				.scan_in(u_dff_ext_int_l_d3_scanin),
				.scan_out(u_dff_ext_int_l_d3_scanout),
				.dout		(ext_int_l_d3),
				.l1clk		(l1clk),
				.din		(ext_int_l_d2),
  .siclk(siclk),
  .soclk(soclk)
				);

ncu_ssiuif_ctl_msff_ctl_macro__width_1 u_dff_ext_int_l_d4 
				(
				.scan_in(u_dff_ext_int_l_d4_scanin),
				.scan_out(u_dff_ext_int_l_d4_scanout),
				.dout		(ext_int_l_d4),
				.l1clk		(l1clk),
				.din		(ext_int_l_d3),
  .siclk(siclk),
  .soclk(soclk)
				);

ncu_ssiuif_ctl_msff_ctl_macro__width_1 u_dff_ext_int_l_d5 
				(
				.scan_in(u_dff_ext_int_l_d5_scanin),
				.scan_out(u_dff_ext_int_l_d5_scanout),
				.dout		(ext_int_l_d5),
				.l1clk		(l1clk),
				.din		(ext_int_l_d4),
  .siclk(siclk),
  .soclk(soclk)
				);

ncu_ssiuif_ctl_msff_ctl_macro__width_1 u_dff_ext_int_l_d6 
				(
				.scan_in(u_dff_ext_int_l_d6_scanin),
				.scan_out(u_dff_ext_int_l_d6_scanout),
				.dout		(ext_int_l_d6),
				.l1clk		(l1clk),
				.din		(ext_int_l_d5),
  .siclk(siclk),
  .soclk(soclk)
				);

ncu_ssiuif_ctl_msff_ctl_macro__width_1 u_dff_ext_int_l_d7 
				(
				.scan_in(u_dff_ext_int_l_d7_scanin),
				.scan_out(u_dff_ext_int_l_d7_scanout),
				.dout		(ext_int_l_d7),
				.l1clk		(l1clk),
				.din		(ext_int_l_d6),
  .siclk(siclk),
  .soclk(soclk)
				);


//*******************************************************************************
// DFFR Instantiations
//*******************************************************************************

ncu_ssiuif_ctl_msff_ctl_macro__width_2 u_dffrl_if_sm 
				(
				.scan_in(u_dffrl_if_sm_scanin),
				.scan_out(u_dffrl_if_sm_scanout),
				.dout		(if_sm[1:0]),
				.l1clk		(l1clk),
				.din		(next_if_sm[1:0]),
  .siclk(siclk),
  .soclk(soclk)
				);

ncu_ssiuif_ctl_msff_ctl_macro__width_1 u_dffrl_ucbif_sif_rdata_accpt 
				(
				.scan_in(u_dffrl_ucbif_sif_rdata_accpt_scanin),
				.scan_out(u_dffrl_ucbif_sif_rdata_accpt_scanout),
				.dout		(ucbif_sif_rdata_accpt),
				.l1clk		(l1clk),
				.din		(next_ucbif_sif_rdata_accpt),
  .siclk(siclk),
  .soclk(soclk)
				);

ncu_ssiuif_ctl_msff_ctl_macro__width_1 u_dffrl_ucbif_sif_timeout_accpt 
				(
				.scan_in(u_dffrl_ucbif_sif_timeout_accpt_scanin),
				.scan_out(u_dffrl_ucbif_sif_timeout_accpt_scanout),
				.dout		(ucbif_sif_timeout_accpt),
				.l1clk		(l1clk),
				.din		(next_ucbif_sif_timeout_accpt),
  .siclk(siclk),
  .soclk(soclk)
				);

assign	n_err_int = err_int_rst_l ? next_err_int : 1'b0 ;
ncu_ssiuif_ctl_msff_ctl_macro__width_1 u_dffrl_err_int 
				(
				.scan_in(u_dffrl_err_int_scanin),
				.scan_out(u_dffrl_err_int_scanout),
				.dout		(err_int),
				.l1clk		(l1clk),
				.din		(n_err_int),
  .siclk(siclk),
  .soclk(soclk)
				);

assign	n_ext_int_l_negedge = ext_int_l_negedge_rst_l ? next_ext_int_l_negedge : 1'b0 ;
ncu_ssiuif_ctl_msff_ctl_macro__width_1 u_dffrl_ext_int_l_negedge 
				(
				.scan_in(u_dffrl_ext_int_l_negedge_scanin),
				.scan_out(u_dffrl_ext_int_l_negedge_scanout),
				.dout		(ext_int_l_negedge),
				.l1clk		(l1clk),
				.din		(n_ext_int_l_negedge),
  .siclk(siclk),
  .soclk(soclk)
				);

 
ncu_ssiuif_ctl_msff_ctl_macro__width_1 toreg_ld0_ff 
				(
				.scan_in(toreg_ld0_ff_scanin),
				.scan_out(toreg_ld0_ff_scanout),
				.dout		(toreg_ld0_),
				.l1clk		(l1clk),
				.din		(1'b1),
  .siclk(siclk),
  .soclk(soclk)
				);


ncu_ssiuif_ctl_msff_ctl_macro__width_1 toreg_ld1_ff 
				(
				.scan_in(toreg_ld1_ff_scanin),
				.scan_out(toreg_ld1_ff_scanout),
				.dout		(toreg_ld1_n),
				.l1clk		(l1clk),
				.din		(toreg_ld0_),
  .siclk(siclk),
  .soclk(soclk)
				);
 
//*******************************************************************************
// DFFRE Instantiations
//*******************************************************************************

ncu_ssiuif_ctl_msff_ctl_macro__en_1__width_1 u_dffrle_ifill  
				(
				.scan_in(u_dffrle_ifill_scanin),
				.scan_out(u_dffrle_ifill_scanout),
				.dout		(ifill),
				.l1clk		(l1clk),
				.en		(ifill_en),
				.din		(next_ifill),
  .siclk(siclk),
  .soclk(soclk)
				);

ncu_ssiuif_ctl_msff_ctl_macro__en_1__width_6 u_dffrle_ucbif_ucb_thr_id_out  
				(
				.scan_in(u_dffrle_ucbif_ucb_thr_id_out_scanin),
				.scan_out(u_dffrle_ucbif_ucb_thr_id_out_scanout),
				.dout		(ucbif_ucb_thr_id_out[5:0]),
				.l1clk		(l1clk),
				.en		(ucbif_ucb_thr_id_out_en),
				.din		(next_ucbif_ucb_thr_id_out[5:0]),
  .siclk(siclk),
  .soclk(soclk)
				);

ncu_ssiuif_ctl_msff_ctl_macro__en_1__width_2 u_dffrle_ucbif_ucb_buf_id_out  
				(
				.scan_in(u_dffrle_ucbif_ucb_buf_id_out_scanin),
				.scan_out(u_dffrle_ucbif_ucb_buf_id_out_scanout),
				.dout		(ucbif_ucb_buf_id_out[1:0]),
				.l1clk		(l1clk),
				.en		(ucbif_ucb_buf_id_out_en),
				.din		(next_ucbif_ucb_buf_id_out[1:0]),
  .siclk(siclk),
  .soclk(soclk)
				);


//*******************************************************************************
// Rule Checks
//*******************************************************************************

//synopsys translate_off

//always @ ( /*AUTOSENSE*/if_sm or sif_ucbif_rdata_vld) begin
//@iol2clk;
//if (if_sm == IF_ACPT & sif_ucbif_rdata_vld)
   //$dispmon ("jbi_ssi_ucbif", 49, "%d %m: ERROR - unexpected read return in IF_ACPT state", $time);
//end

//synopsys translate_on


/**** adding clock header ****/
ncu_ssiuif_ctl_l1clkhdr_ctl_macro clkgen (
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
assign u_dff_io_jbi_ext_int_l_pre_sync_scanin = scan_in                  ;
assign u_dff_io_jbi_ext_int_l_sync_scanin = u_dff_io_jbi_ext_int_l_pre_sync_scanout;
assign u_dff_timeout_reg_scanin  = u_dff_io_jbi_ext_int_l_sync_scanout;
assign u_dff_log_parity_reg_scanin = u_dff_timeout_reg_scanout;
assign u_dff_log_tout_reg_scanin = u_dff_log_parity_reg_scanout;
assign u_dff_ext_int_l_scanin    = u_dff_log_tout_reg_scanout;
assign u_dff_ext_int_l_d1_scanin = u_dff_ext_int_l_scanout  ;
assign u_dff_ext_int_l_d2_scanin = u_dff_ext_int_l_d1_scanout;
assign u_dff_ext_int_l_d3_scanin = u_dff_ext_int_l_d2_scanout;
assign u_dff_ext_int_l_d4_scanin = u_dff_ext_int_l_d3_scanout;
assign u_dff_ext_int_l_d5_scanin = u_dff_ext_int_l_d4_scanout;
assign u_dff_ext_int_l_d6_scanin = u_dff_ext_int_l_d5_scanout;
assign u_dff_ext_int_l_d7_scanin = u_dff_ext_int_l_d6_scanout;
assign u_dffrl_if_sm_scanin      = u_dff_ext_int_l_d7_scanout;
assign u_dffrl_ucbif_sif_rdata_accpt_scanin = u_dffrl_if_sm_scanout    ;
assign u_dffrl_ucbif_sif_timeout_accpt_scanin = u_dffrl_ucbif_sif_rdata_accpt_scanout;
assign u_dffrl_err_int_scanin    = u_dffrl_ucbif_sif_timeout_accpt_scanout;
assign u_dffrl_ext_int_l_negedge_scanin = u_dffrl_err_int_scanout  ;
assign toreg_ld0_ff_scanin       = u_dffrl_ext_int_l_negedge_scanout;
assign toreg_ld1_ff_scanin       = toreg_ld0_ff_scanout     ;
assign u_dffrle_ifill_scanin     = toreg_ld1_ff_scanout     ;
assign u_dffrle_ucbif_ucb_thr_id_out_scanin = u_dffrle_ifill_scanout   ;
assign u_dffrle_ucbif_ucb_buf_id_out_scanin = u_dffrle_ucbif_ucb_thr_id_out_scanout;
assign scan_out                  = u_dffrle_ucbif_ucb_buf_id_out_scanout;
// fixscan end:
endmodule

// Local Variables:
// verilog-library-directories:("." "../../common/rtl")
// verilog-auto-sense-defines-constant:t
// End:








// any PARAMS parms go into naming of macro

module ncu_ssiuif_ctl_msff_ctl_macro__width_1 (
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

module ncu_ssiuif_ctl_msff_ctl_macro__width_25 (
  din, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [24:0] fdin;
wire [23:0] so;

  input [24:0] din;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [24:0] dout;
  output scan_out;
assign fdin[24:0] = din[24:0];






dff #(25)  d0_0 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[24:0]),
.si({scan_in,so[23:0]}),
.so({so[23:0],scan_out}),
.q(dout[24:0])
);












endmodule













// any PARAMS parms go into naming of macro

module ncu_ssiuif_ctl_msff_ctl_macro__width_2 (
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

module ncu_ssiuif_ctl_msff_ctl_macro__en_1__width_1 (
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

module ncu_ssiuif_ctl_msff_ctl_macro__en_1__width_6 (
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

module ncu_ssiuif_ctl_msff_ctl_macro__en_1__width_2 (
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

module ncu_ssiuif_ctl_l1clkhdr_ctl_macro (
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








