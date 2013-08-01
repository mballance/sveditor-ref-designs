// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: dmu_pmu_prm.v
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
module dmu_pmu_prm (
		clk,
		rst_l,

      // Debug
		cr2pm_dbg_sel_a,	
		cr2pm_dbg_sel_b,	
		pm2cr_dbg_a, 
		pm2cr_dbg_b, 

        cm2pm_rcd_enq,
        cm2pm_rcd,
		pm2cm_rcd_full,
        pm2cl_rcd_enq, 
		pm2cl_rcd,
		cl2pm_rcd_full,
        pm2ps_i_req,
        ps2pm_i_gnt,
	    pm2ps_i_trn,
        ps2pm_i_n_trn,
        pm2ps_i_cmd_type,
		ps2pm_i_full,
		pm2ps_i_wr_data,
        ps2pm_i_rd_data						 
       );
     
//************************************************
//				PARAMETERS
//************************************************

// Ingress Packet Record Field Widths

//   parameter CM2PM_WDTH    = `FIRE_DLC_IPR_REC_WDTH,       //93

   parameter IPRMSB = `FIRE_DLC_IPR_MSB;                     // CM2PM_WDTH -1
   
   parameter PRTYP_WDTH      = `FIRE_DLC_IPR_TYP_WDTH,       // 7
			 PRLEN_WDTH      = `FIRE_DLC_IPR_LEN_WDTH,       //10
			 PRBYTCNT_WDTH   = `FIRE_DLC_IPR_BYTCNT_WDTH,    //12
			 PRCNTXTNUM_WDTH = `FIRE_DLC_IPR_CNTXTNUM_WDTH,  // 5
			 PRPKSEQNUM_WDTH = `FIRE_DLC_IPR_PKSEQNUM_WDTH,  // 5
			 PRADDR_WDTH     = `FIRE_DLC_IPR_ADDR_WDTH,      //41
			 PRADDRERR_WDTH  = `FIRE_DLC_IPR_ADDRERR_WDTH,   // 1
			 PRDPTR_WDTH     = `FIRE_DLC_IPR_DPTR_WDTH,      // 7
			 PRSBDTAG_WDTH   = `FIRE_DLC_IPR_SBDTAG_WDTH;    // 5   

   parameter PRTYPMSB        = PRTYP_WDTH -1,
			 PRLENMSB        = PRLEN_WDTH -1,
			 PRBYTCNTMSB     = PRBYTCNT_WDTH -1,
			 PRCNTXTNUMMSB   = PRCNTXTNUM_WDTH -1,
			 PRPKSEQNUMMSB   = PRPKSEQNUM_WDTH -1,
			 PRADDRMSB       = PRADDR_WDTH -1,
			 PRADDRERRMSB    = PRADDRERR_WDTH -1,
			 PRDPTRMSB       = PRDPTR_WDTH -1,
			 PRSBDTAGMSB     = PRSBDTAG_WDTH -1;

// Ingress Command Record Field Widths
//   parameter PM2CL_WDTH    = `FIRE_DLC_ICR_REC_WDTH,      //60

   parameter ICRMSB = `FIRE_DLC_ICR_MSB;                    // PM2CL_WDTH -1;
   
   parameter CRTYP_WDTH    = `FIRE_DLC_ICR_TYP_WDTH,        // 7
//			 CRCLSTS_WDTH  = `FIRE_DLC_ICR_CLSTS_WDTH,      // 1
			 CRADDR_WDTH   = `FIRE_DLC_ICR_ADDR_WDTH,       //37
			 CRSTAT_WDTH   = `FIRE_DLC_ICR_STAT_WDTH,       // 3
			 CRDPTR_WDTH   = `FIRE_DLC_ICR_DPTR_WDTH,       // 7
			 CRSBDTAG_WDTH = `FIRE_DLC_ICR_SBDTAG_WDTH;     // 5   

   parameter CRTYPMSB      = CRTYP_WDTH  -1,
			 CRADDRMSB     = CRADDR_WDTH -1,
			 CRSTATMSB     = CRSTAT_WDTH -1,
			 CRDPTRMSB     = CRDPTR_WDTH -1,
			 CRSBDTAGMSB   = CRSBDTAG_WDTH -1;
   
    
// Packet Scoreboard (PSB) Record Field Widths
   parameter PM2PS_RCDWDTH = 41;
   
   parameter PSRCDMSB    = PM2PS_RCDWDTH -1;
   
   parameter PSCMDTYPE_WDTH = 4,
             PSCMDTRN_WDTH  = 5,
             PSITRN_WDTH    = 5,
//BP n2 5-24-04
//			 PSRDWDTH       = 6,
			 PSRDWDTH       = 7,
             CLTOT_WDTH     = 4;
   
   parameter PSCMDTYPMSB = PSCMDTYPE_WDTH -1;
   parameter PSCMDTRNMSB = PSCMDTRN_WDTH -1;   
   parameter PSRDMSB     = PSRDWDTH  -1;
   parameter PSITRNMSB   = PSITRN_WDTH -1;   
   parameter CLTOTMSB    = CLTOT_WDTH -1;
   
//************************************************
//				PORTS
//************************************************

  input clk;                                // input clock
  input rst_l;                              // synopsys sync_set_reset "rst_l"
  input cm2pm_rcd_enq;                      // enqueue to packet record queue
  input [IPRMSB :0] cm2pm_rcd;              // packet record in
  output pm2cm_rcd_full;                    // packet record queue is full
   
  output pm2cl_rcd_enq;                     // enqueue output command record
  output [ICRMSB :0] pm2cl_rcd;             // command record out
  input cl2pm_rcd_full;                     // CLU record fifo full

  output pm2ps_i_req;                       // PSB request
  input  ps2pm_i_gnt;                       // PSB grant
  output [PSITRNMSB :0] pm2ps_i_trn;        // pk_tag to look up
   
  input  [PSCMDTRNMSB :0] ps2pm_i_n_trn;    // carries pk_tag from PSB
  output [PSCMDTYPMSB :0] pm2ps_i_cmd_type; // command for PSB to run
  input  ps2pm_i_full;                      // PSB full indicator   
  output [PSRCDMSB :0] pm2ps_i_wr_data;     // PSB record data

  input [PSRDMSB :0] 	ps2pm_i_rd_data;

// Debug Ports   
   input [`FIRE_DLC_PMU_DS_BITS] cr2pm_dbg_sel_a;   // PMU debug select a
   input [`FIRE_DLC_PMU_DS_BITS] cr2pm_dbg_sel_b;   // PMU debug select b

   output [`FIRE_DBG_DATA_BITS] pm2cr_dbg_a;        // PMU debug output a	
   output [`FIRE_DBG_DATA_BITS] pm2cr_dbg_b;        // PMU debug output b    

//************************************************
//				SIGNALS
//************************************************

// Packet Record queue signals 
   wire pkmpty;   
   
// Packet Record field assignments to PRM signals
   wire [PRTYPMSB :0] pkttyp;   
   wire [PRLENMSB :0] pktlen;
   wire [PRBYTCNTMSB :0] pktbyt_cnt;
   wire [PRCNTXTNUMMSB :0] pktcntxt_num;
   wire [PRPKSEQNUMMSB :0] pktseq_num;
   wire [PRADDRMSB :0] pktaddr;
   wire [PRADDRERRMSB :0] pktaddr_err;
   wire [PRDPTRMSB :0] pktdptr;
   wire [PRSBDTAGMSB :0] pkttr_tag;

   reg ld_pipe;
   reg ld_ptr;   
   
// Command Record field assignments to PRM signals

   reg [CLTOTMSB :0] pipe_cltot;   
   reg [3:0] pipe_clastyp;
   reg [CRTYPMSB :0] pipe_typ;
//BP n2 5-24-04
//   reg [CRADDRMSB :6] pipe_addr_hi;   
   reg [CRADDRMSB :7] pipe_addr_hi;   
//BP n2 5-24-04
//   reg [5 :0] pipe_addr_lo;   
   reg [6 :0] pipe_addr_lo;   
   reg pipe_clsts;   
   reg [CRSTATMSB :0] pipe_stat;  
   reg [CRDPTRMSB :0] pipe_dptr;   
   reg [CRSBDTAGMSB :0] pipe_sbdtag;
   reg [PRLENMSB :0] pipe_pktlen;
   reg [PRBYTCNTMSB :0] pipe_pktbyt_cnt;
   reg pipe_multicycle;
   reg pipe_full;

   wire [CLTOTMSB :0]  new_pktlen;
   wire [PRLENMSB :0]  offset_len;
   wire [PRLENMSB :0]  rem_len;
   wire [CLTOTMSB :0]  trail;   

// alignment
   wire [PRLENMSB :0] real_size;
   wire [PRLENMSB :0] align_size;
   wire 			  align_adj;
   wire [PRLENMSB :0] block_size;
   wire 			  block_adj;
   wire last_clsts;      
   reg  line_clsts;
   reg [3 :0] persist_last_dwbe;   

// Packet Scoreboard record field assignments
   wire [PSRCDMSB :0] next_pm2ps_i_wr_data;  // next PSB record data
   wire [PRLENMSB :0] cacheline;
   
// Registers  
   reg pm2cl_rcd_enq;   
   reg next_gen_crcd, gen_crcd;
   reg next_deq_rcd;
   reg next_gen_trn;   
   
   reg [1:0] deq_state;
   reg [1:0] deq_next;

   reg [1:0] bld_state;
   reg [1:0] bld_next;

   reg [CRTYPMSB :0] cmd_typ;
   reg cmd_clsts;
   reg [3:0] cmd_clastyp;   
//BP n2 5-24-04
//   reg [CRADDRMSB :6] cmd_addr_hi;   
   reg [CRADDRMSB :7] cmd_addr_hi;   
//BP n2 5-24-04
//   reg [5 :0] cmd_addr_lo;   
   reg [6 :0] cmd_addr_lo;   
   reg [CRSTATMSB :0] cmd_stat;  
   reg [CRDPTRMSB :0] cmd_dptr;   
   reg [CRSBDTAGMSB :0] cmd_sbdtag;
   reg [CLTOTMSB :0] cmd_cltot;   
   reg [PRLENMSB :0] cmd_pktlen;
   reg cmd_multicycle;
   
   reg [CLTOTMSB :0] num_cmd;   
   reg [PSCMDTYPMSB :0] next_scbd_fun;
   reg [PSCMDTYPMSB :0] pm2ps_i_cmd_type;
   reg [PSRCDMSB :0] pm2ps_i_wr_data;         // PSB record data
   reg pm2ps_i_req;
   reg [PSITRNMSB :0] pm2ps_i_trn;   

   reg multicycle;
   reg [3:0] clastyp;
   
   reg [PRLENMSB :0] next_pktlen;
   reg next_clsts;

   reg [CRSTATMSB :0] next_stat;   
   reg [CLTOTMSB :0] next_cltot;   
   reg [PRBYTCNTMSB :0] next_pktbyt_cnt;

   reg pmu_is_idle;

// Debug
  wire [`FIRE_DLC_PMU_PRM_DS_BITS] dbg2prm_dbg_sel_a;
  wire [`FIRE_DLC_PMU_PRM_DS_BITS] dbg2prm_dbg_sel_b;
  reg  [`FIRE_DLC_PMU_PRM_DS_BITS] prm_dbg_sel [0:1];

  wire [`FIRE_DBG_DATA_BITS]  prm2dbg_dbg1_a;
  wire [`FIRE_DBG_DATA_BITS]  prm2dbg_dbg1_b;
  wire [`FIRE_DBG_DATA_BITS]  prm2dbg_dbg2_a;
  wire [`FIRE_DBG_DATA_BITS]  prm2dbg_dbg2_b;
  reg  [`FIRE_DBG_DATA_BITS]  nxt_prm_dbg1_bus [0:1];
  reg  [`FIRE_DBG_DATA_BITS]  nxt_prm_dbg2_bus [0:1];
  reg  [`FIRE_DBG_DATA_BITS]  prm_dbg1_bus [0:1];
  reg  [`FIRE_DBG_DATA_BITS]  prm_dbg2_bus [0:1];

  reg  [`FIRE_DBG_DATA_BITS]  dbg_bus [0:1];
  reg  [`FIRE_DBG_DATA_BITS]  nxt_dbg_bus [0:1];
  integer i, j, k, l;
					  
// *************** Local Declarations *************************************

   parameter DEQIDLE     = 2'b00,   // Idle
			 DEQGNT      = 2'b01,   // psb gnt wait state
			 DEQ         = 2'b10;   // dequeue packets

   parameter BLDIDLE     = 2'b00,   // Idle
			 BLDXFR      = 2'b01;   // write commands ready

   parameter CLASWR      = 4'b0001,
			 CLASRD      = 4'b0010,
			 CLASRDL     = 4'b0000,
			 CLASPIO     = 4'b0011,
			 CLASUNSP    = 4'b0100,
			 CLASMSG     = 4'b0101,
			 CLASMSI     = 4'b0110,
			 CLASMDO     = 4'b0111,
			 CLASNUL     = 4'b1000;   

//************************************************
// Zero In checkers
//************************************************

// Request Grant check
// 0in req_ack -req pm2ps_i_req  -ack ps2pm_i_gnt -req_until_ack

// deq_fsm
    //0in state_transition  -var deq_state  -val DEQIDLE  -next DEQIDLE DEQGNT DEQ
    //0in state_transition  -var deq_state  -val DEQGNT   -next DEQGNT DEQ
    //0in state_transition  -var deq_state  -val DEQ      -next DEQIDLE

// build_crcd (pipeline staging and command record build)
    //0in state_transition  -var bld_state  -val BLDIDLE -next BLDXFR BLDIDLE
    //0in state_transition  -var bld_state  -val BLDXFR  -next BLDXFR BLDIDLE

// *************** Build Command Record Procedures (build_crcd)*********/   
   
// Transaction Type Decode - PSB Function Encoding(typ_dcd)
always @(pkttyp)   
  begin
     clastyp[3:0] = 0;
	 next_scbd_fun = 4'b0000;
	 
     case (pkttyp)         // synopsys parallel_case
	   7'b0000000 : begin
		  clastyp[3:0] = CLASRD;             // DMAMR
          next_scbd_fun = 4'b0101;
	   end
	   7'b0100000 : begin
		  clastyp[3:0] = CLASRD;             // DMAMR
          next_scbd_fun = 4'b0101;
	   end
	   7'b0000001 : begin
		  clastyp[3:0] = CLASRDL;            // DMAMRDLK
          next_scbd_fun = 4'b0101;     
	   end
	   7'b0100001 : begin
		  clastyp[3:0] = CLASRDL;            // DMARDLK_alt
          next_scbd_fun = 4'b0101;     
	   end
	   7'b0001001 : begin
		  clastyp[3:0] = CLASUNSP;           // UNSUP
          next_scbd_fun = 4'b0101;     
	   end
	   7'b1000000 : begin
		  clastyp[3:0] = CLASWR;             // DMAMWR
          next_scbd_fun = 4'b0000;     
	   end
	   7'b1100000 : begin
		  clastyp[3:0] = CLASWR;             // DMAMWR
          next_scbd_fun = 4'b0000;     
	   end
	   7'b1111000 : begin
		  clastyp[3:0] = CLASMSI;            // MSIEQWR
          next_scbd_fun = 4'b0000;     
	   end
	   7'b1011000 : begin
		  clastyp[3:0] = CLASMSI;            // MSIEQWR
          next_scbd_fun = 4'b0000;     
	   end
	   7'b1110000 : begin
		  clastyp[3:0] = CLASMSG;            // MSGEQWR
          next_scbd_fun = 4'b0000;     
	   end
	   7'b1010000 : begin
		  clastyp[3:0] = CLASMSG;            // MSGEQWR
          next_scbd_fun = 4'b0000;     
	   end
	   7'b1111100 : begin
		  clastyp[3:0] = CLASNUL;            // NULL
          next_scbd_fun = 4'b0000;     
	   end
	   7'b1111010 : begin
		  clastyp[3:0] = CLASMDO;            // MDO
          next_scbd_fun = 4'b0000;     
	   end
	   7'b0001010 : begin
		  clastyp[3:0] = CLASPIO;            // PIOCP
          next_scbd_fun = 4'b1001;     
	   end
	   7'b1001010 : begin
		  clastyp[3:0] = CLASPIO;           // PIOCPLD
		  next_scbd_fun = 4'b1001;     
	   end
       default : begin
		  clastyp[3:0] = 4'b1111;           // to satisfy vlint
		  next_scbd_fun = 4'b0000;     
	   end
	 endcase // case(pkttyp)
  end // always @ (pkttyp)   

// Parse Packet Record to issue Command Records
// lengths are represented in DW's

always @(clastyp or pktaddr_err or pktlen or pktaddr or pktbyt_cnt or
         pktcntxt_num or cacheline or new_pktlen or align_adj or 
         block_adj or rem_len or trail)
  begin
	 next_cltot[CLTOTMSB :0]  = 0;
	 next_pktlen[PRLENMSB :0] = 0;
	 next_clsts               = 0;
     next_stat[CRSTATMSB :0]  = 0; 
     multicycle               = 0;

	 case (clastyp)      // synopsys full_case parallel_case
	   CLASWR: begin      // DMA Wr
		  next_pktbyt_cnt[PRBYTCNTMSB :0] = pktbyt_cnt;
		  if (pktlen < cacheline) begin                 //(length LT 16)
			 if (pktaddr[3:0] == 4'h0) begin          // aligned
				next_pktlen[PRLENMSB :0] = pktlen[PRLENMSB :0];     // DW's
				next_stat[CRSTATMSB :0]  = {2'b00,pktaddr_err};
				if(align_adj) begin
				   next_cltot[CLTOTMSB :0]  = 4'b0010;
				   multicycle               = 1'b1;
				  
				   if(pktbyt_cnt[7:0] == 8'hff) next_clsts  = 1'b0;
				   else next_clsts  = 1'b1;

				end
				else begin
				   next_cltot[CLTOTMSB :0]  = 4'b0001;				   
				   next_clsts               = 1'b1;
				   multicycle               = 1'b0;
				end				
			 end // if (pktaddr[3:0] == 4'h0)			 
			 else begin                               // unaligned				
				next_pktlen[PRLENMSB :0] = pktlen[PRLENMSB :0];    // DW's
				next_stat[CRSTATMSB :0]  = {2'b00,pktaddr_err};
				if(align_adj) begin
				   next_cltot[CLTOTMSB :0]  = 4'b0010;
				   next_clsts               = 1'b1;
				   multicycle               = 1'b1;
				end
				else begin
				   next_cltot[CLTOTMSB :0]  = 4'b0001;				   
				   next_clsts               = 1'b1;
				   multicycle               = 1'b0;
				end
			 end // else: !if(pktaddr[3:0] == 4'h0)
		  end // if (pktlen < cacheline)		  

		  if (pktlen == cacheline) begin                 //(length LT 16)
			 if (pktaddr[3:0] == 4'h0) begin          // aligned
				next_cltot[CLTOTMSB :0]  = 4'b0001;
				next_pktlen[PRLENMSB :0] = pktlen[PRLENMSB :0];     // DW's
				next_stat[CRSTATMSB :0]  = {2'b00,pktaddr_err};
				multicycle               = 1'b0;

				   if(pktbyt_cnt[7:0] == 8'hff) next_clsts  = 1'b0;
				   else next_clsts  = 1'b1;

				end // if ((pktlen[PRLENMSB :0] < 5'h10)...
			 else begin                               // unaligned				
				next_pktlen[PRLENMSB :0] = pktlen[PRLENMSB :0];    // DW's
				next_stat[CRSTATMSB :0]  = {2'b00,pktaddr_err};
				if(block_adj) begin
				   next_cltot[CLTOTMSB :0]  = 4'b0010;
				   next_clsts               = 1'b1;
				   multicycle               = 1'b1;
				end
				else begin
				   next_cltot[CLTOTMSB :0]  = 4'b0001;				   
				   next_clsts               = 1'b0;
				   multicycle               = 1'b0;
				end
			 end // else: !if(pktaddr[3:0] == 4'h0)
		  end // if (pktlen < cacheline)		  

 		  if (pktlen > cacheline) begin  
			 if (pktaddr[3:0] == 4'h0) begin          // aligned
				next_pktlen[PRLENMSB :0] = pktlen[PRLENMSB :0];    // DW's
				next_stat[CRSTATMSB :0]  = {2'b00,pktaddr_err};
				multicycle               = 1'b1;

				if(pktbyt_cnt[3:0] == 4'hf) next_clsts  = 1'b0;
				else next_clsts  = 1'b1;

				if(block_adj) begin
				   next_cltot[CLTOTMSB :0]  = new_pktlen[CLTOTMSB :0] + 4'h1;
				end
				else begin
				   next_cltot[CLTOTMSB :0]  = new_pktlen[CLTOTMSB :0];
				end
			 end
			 else begin                               // unaligned
				next_pktlen[PRLENMSB :0] = pktlen[PRLENMSB :0];    // DW's
				next_stat[CRSTATMSB :0]  = {2'b00,pktaddr_err};
				next_clsts               = 1'b1;
				multicycle               = 1'b1;
				if(block_adj) begin
				   next_cltot[CLTOTMSB :0]  = new_pktlen[CLTOTMSB :0] + 4'h1;
				end
				else begin
				   next_cltot[CLTOTMSB :0]  = new_pktlen[CLTOTMSB :0];
				end
			 end // else: !if(pktaddr[3:0] == 4'h0)
		  end // if (pktlen > cacheline)		  
	   end // case: CLASWR

	   CLASRD : begin     // DMA Rd
		  next_pktbyt_cnt[PRBYTCNTMSB :0] = pktbyt_cnt;
		  if (pktlen <= cacheline)  begin             //(length LE 16)
			 if (pktaddr[3:0] == 4'h0) begin          // aligned
				if(pktaddr_err) begin
				   next_cltot[CLTOTMSB :0]  = 4'b0001;
				   next_pktlen[PRLENMSB :0] = 10'h000;    // DW's
				   next_clsts               = 1'b1;
				   next_stat[CRSTATMSB :0]  = {2'b00,pktaddr_err};
				   multicycle               = 1'b0;
				end
				else begin
				   next_cltot[CLTOTMSB :0]  = 4'b0001;
				   next_pktlen[PRLENMSB :0] = pktlen[PRLENMSB :0];    // DW's
				   next_clsts               = 1'b1;
				   next_stat[CRSTATMSB :0]  = {2'b00,pktaddr_err};
				   multicycle               = 1'b0;
				end
			 end // if (pktaddr[3:0] == 4'h0)			 
			 else begin                               // unaligned
				next_stat[CRSTATMSB :0]  = {2'b00,pktaddr_err};
				if(align_adj) begin
				   if(pktaddr_err) begin
					  next_cltot[CLTOTMSB :0]  = 4'b0001;
					  next_pktlen[PRLENMSB :0] = 10'h000;    // DW's
					  next_clsts               = 1'b1;
					  multicycle               = 1'b0;
				   end
				   else begin
					  next_cltot[CLTOTMSB :0]  = 4'b0010;
					  next_pktlen[PRLENMSB :0] = pktlen[PRLENMSB :0];    // DW's
					  next_clsts               = 1'b1;
					  multicycle               = 1'b1;
				   end // else: !if(pktaddr_err)
				end // if (align_adj)				
				else begin
				   if(pktaddr_err) begin
					  next_cltot[CLTOTMSB :0]  = 4'b0001;
					  next_pktlen[PRLENMSB :0] = 10'h000;    // DW's
					  next_clsts               = 1'b1;
					  multicycle               = 1'b0;
				   end
				   else begin
					  next_cltot[CLTOTMSB :0]  = 4'b0001;
					  next_pktlen[PRLENMSB :0] = pktlen[PRLENMSB :0];    // DW's
					  next_clsts               = 1'b1;
					  multicycle               = 1'b0;
				   end // else: !if(pktaddr_err)
				end // else: !if(align_adj)				
			 end // else: !if(pktaddr[3:0] == 4'h0)
		  end // if (pktlen <= cacheline)		  

 		  if (pktlen > cacheline) begin               //(length GT 16)
			 if (pktaddr[3:0] == 4'h0) begin          // aligned
				next_stat[CRSTATMSB :0]  = {2'b00,pktaddr_err};
				   if(pktaddr_err) begin					  
					  next_cltot[CLTOTMSB :0]  = 4'b0001;
					  next_pktlen[PRLENMSB :0] = 10'h000;    // DW's
					  next_clsts               = 1'b1;
					  multicycle               = 1'b0;
				   end
				   else begin
					  next_cltot[CLTOTMSB :0]  = 4'h1 + rem_len[7:4] + trail;
					  next_pktlen[PRLENMSB :0] = pktlen[PRLENMSB :0];    // DW's
					  next_clsts               = 1'b1;
					  multicycle               = 1'b1;
				   end // else: !if(pktaddr_err)
			 end // if (pktaddr[3:0] == 4'h0)			
			 else begin                               // unaligned
				next_stat[CRSTATMSB :0]  = {2'b00,pktaddr_err};
				   if(pktaddr_err) begin
					  next_cltot[CLTOTMSB :0]  = 4'b0001;
					  next_pktlen[PRLENMSB :0] = 10'h000;    // DW's
					  next_clsts               = 1'b1;
					  multicycle               = 1'b0;
				   end
				   else begin
					  next_cltot[CLTOTMSB :0]  = 4'h1 + rem_len[7:4] + trail;
					  next_pktlen[PRLENMSB :0] = pktlen[PRLENMSB :0];    // DW's
					  next_clsts               = 1'b1;
					  multicycle               = 1'b1;
				   end // else: !if(pktaddr_err)				
			 end // else: !if(pktaddr[3:0] == 4'h0)
		  end // if (pktlen > cacheline)		  
	   end // case: CLASRD
	   
	   CLASPIO : begin    // PIO CplD
		  next_pktbyt_cnt[PRBYTCNTMSB :0] = pktbyt_cnt;
		  next_cltot[CLTOTMSB :0]  = 4'b0001;
		  next_pktlen[PRLENMSB :0] = pktlen[PRLENMSB :0];    // DW's
		  if (pktlen == cacheline) next_clsts = 1'b0;
		  else next_clsts = 1'b1;

		  next_stat[CRSTATMSB :0]  = pktcntxt_num[2:0];
		  multicycle               = 1'b0;
	   end
	   
	   CLASRDL,             // DMARdLk
	   CLASNUL : begin      // 'Null
		  next_pktbyt_cnt[PRBYTCNTMSB :0] = pktbyt_cnt;
		  next_cltot[CLTOTMSB :0]  = 4'b0001;
		  next_pktlen[PRLENMSB :0] = 10'h000;    // DW's
		  next_clsts               = 1'b0;
		  next_stat[CRSTATMSB :0]  = {2'b00,pktaddr_err};
		  multicycle               = 1'b0;
	   end

       CLASUNSP : begin     // Unsup
		  next_pktbyt_cnt[PRBYTCNTMSB :0] = 12'h004;
		  next_cltot[CLTOTMSB :0]  = 4'b0001;
		  next_pktlen[PRLENMSB :0] = 10'h000;		  
		  next_clsts               = 1'b0;
		  next_stat[CRSTATMSB :0]  = {2'b00,pktaddr_err};
		  multicycle               = 1'b0;
	   end
	   
	   CLASMSI,
       CLASMSG,
       CLASMDO : begin      // MSI,MSG,Mondo Wr
		  next_pktbyt_cnt[PRBYTCNTMSB :0] = pktbyt_cnt;
		  
		  if ((pktlen == cacheline)                    //(length EQ 16)
			  && (pktaddr[3:0] == 4'h0))
			begin
  			   next_cltot[CLTOTMSB :0]  = 4'b0001;
			   next_pktlen[PRLENMSB :0] = pktlen[PRLENMSB :0];    // DW's
			   next_clsts               = 1'b0;
               next_stat[CRSTATMSB :0]  = {2'b00,pktaddr_err}; 
               multicycle               = 1'b0;			   
			end // if ((pktlen[PRLENMSB :0] == 5'h10)...
	   end // case: CLASMSI,...	   

	   default begin
		  next_pktbyt_cnt[PRBYTCNTMSB :0] = 0;
		  next_cltot[CLTOTMSB :0]  = 0;
		  next_pktlen[PRLENMSB :0] = 0;
		  next_clsts               = 0;
		  next_stat[CRSTATMSB :0]  = 0;
		  multicycle               = 0;
	   end	   
	 endcase // case(clastyp)
  end // always @ (clastyp or pktaddr_err or pktlen or pktaddr or pktbyt_cnt...   
   
// Pipelined computed values for the next multi-command 
// build for a given packet record.

always @(posedge clk)
  begin
    if (rst_l == 1'b0) begin
       num_cmd   <= 0;                 // command counter
     end
    else begin
       case ({bld_state,cmd_multicycle})   // synopsys parallel_case
		 {BLDIDLE,1'b0},
		 {BLDIDLE,1'b1} : num_cmd  <= 0;
		 {BLDXFR, 1'b0} : num_cmd  <= 0;
         {BLDXFR, 1'b1} : num_cmd  <= next_gen_crcd ? (num_cmd + 1'b1) : num_cmd;
		 default : num_cmd  <= num_cmd;
	   endcase // case({bld_state,pipe_multicycle})	   
	end // else: !if(rst_l == 1'b0)
  end // always @ (posedge clk)

// Pipeline stages for Command build   
always @(posedge clk)
    if (rst_l == 1'b0) begin
	 pipe_clastyp <= 4'b0; 
	 pipe_cltot   <= {CLTOT_WDTH{1'b0}};
	 pipe_typ     <= {CRTYP_WDTH{1'b0}}; 
	 pipe_pktlen  <= {PRLEN_WDTH{1'b0}}; 
	 pipe_pktbyt_cnt <= {PRBYTCNT_WDTH{1'b0}}; 
	 pipe_addr_hi <= {(CRADDR_WDTH -7){1'b0}}; 
	 pipe_addr_lo <= 7'b0; 
	 pipe_dptr   <= {CRDPTR_WDTH{1'b0}}; 
	 pipe_clsts  <= 1'b0; 
	 pipe_stat   <= {CRSTAT_WDTH{1'b0}}; 
         pipe_multicycle  <= 1'b0;
         pipe_sbdtag   <= {CRSBDTAG_WDTH{1'b0}};
	end
	else begin
	 pipe_clastyp <= ld_pipe  ? clastyp : pipe_clastyp;
	 pipe_cltot   <= ld_pipe ? next_cltot : pipe_cltot;
	 pipe_typ     <= ld_pipe ? pkttyp : pipe_typ;	   
	 pipe_pktlen  <= ld_pipe ? next_pktlen : pipe_pktlen;
	 pipe_pktbyt_cnt <= ld_pipe ? next_pktbyt_cnt : pipe_pktbyt_cnt;
	 pipe_addr_hi <= ld_pipe ? ((clastyp == CLASPIO)
                                 ? {PRADDRMSB - 9{1'b0}}
                                 : pktaddr[PRADDRMSB :10])
                             : pipe_addr_hi;	   
	 pipe_addr_lo <= ld_pipe ? ((clastyp == CLASPIO)
	                             ? ps2pm_i_rd_data
//BP n2 5-24-04
//                                 : pktaddr[9 :4])
                                 : {1'b0,pktaddr[9 :4]})
                             : pipe_addr_lo;	   		
	 pipe_dptr   <= ld_pipe ? ((clastyp == CLASRD)
                                ? {3'b000,next_cltot}
                                : pktdptr)
                            : pipe_dptr;	   
	 pipe_clsts  <= ld_pipe ? next_clsts : pipe_clsts;	   
	 pipe_stat   <= ld_pipe ? next_stat : pipe_stat;

	 case(clastyp)
	   CLASRD,
       CLASRDL,
       CLASUNSP : begin
		  case({ld_pipe,ps2pm_i_gnt})
			2'b00 : pipe_sbdtag <= pipe_sbdtag;
			2'b10 : pipe_sbdtag <= ps2pm_i_n_trn;
			2'b01 : pipe_sbdtag <= pipe_sbdtag;
			2'b11 : pipe_sbdtag <= ps2pm_i_n_trn;
		  endcase // case({ld_pipe,ps2pm_i_gnt})		  
	   end
	   CLASMDO : begin
		  pipe_sbdtag <= ld_pipe ? {3'b000,next_pktbyt_cnt[1:0]}  : pipe_sbdtag;
	   end
	   default : begin
		  pipe_sbdtag <= ld_pipe ?  pkttr_tag : pipe_sbdtag;
	   end
	 endcase // case(clastyp)
		  
	 pipe_multicycle <= ld_pipe ? multicycle : pipe_multicycle;

  end // always @ (posedge clk) 

// Registered Outputs   
//Pipeline stages for next command address, dptr generator  

always @(posedge clk)
    if (rst_l == 1'b0) begin
	   cmd_clastyp <= 4'b0;
	end
  else begin
	 case (bld_state)   // synopsys parallel_case
	   BLDIDLE : cmd_clastyp <= ld_ptr ? pipe_clastyp : cmd_clastyp;
       BLDXFR  : cmd_clastyp <= cmd_clastyp;
	   default : cmd_clastyp <= cmd_clastyp;
	 endcase // case(bld_state)
  end // always @ (posedge clk)   
   
always @(posedge clk)
    if (rst_l == 1'b0) begin
			cmd_typ        <= {CRTYP_WDTH{1'b0}};
			cmd_clsts      <= 1'b0;
			cmd_stat       <= {CRSTAT_WDTH{1'b0}};
			cmd_sbdtag     <= {CRSBDTAG_WDTH{1'b0}};
			cmd_pktlen     <= {PRLEN_WDTH{1'b0}};
			cmd_addr_hi    <= {(CRADDR_WDTH -7){1'b0}};
			cmd_addr_lo    <= 7'b0;
			cmd_dptr       <= {CRDPTR_WDTH{1'b0}};
			cmd_cltot      <= {CLTOT_WDTH{1'b0}};
			cmd_multicycle <= 1'b0;
	end
  else begin
       case (bld_state)   // synopsys parallel_case
         BLDIDLE : begin
			cmd_typ        <= ld_ptr ? pipe_typ : cmd_typ;
			cmd_clsts      <= ld_ptr ? pipe_clsts  : cmd_clsts;
			cmd_stat       <= ld_ptr ? pipe_stat : cmd_stat;
			cmd_sbdtag     <= ld_ptr ? pipe_sbdtag : cmd_sbdtag;
			cmd_pktlen     <= ld_ptr ? pipe_pktlen : cmd_pktlen;			
			cmd_addr_hi    <= ld_ptr ? pipe_addr_hi : cmd_addr_hi;
			cmd_addr_lo    <= ld_ptr ? pipe_addr_lo : cmd_addr_lo;
			cmd_dptr       <= ld_ptr ? pipe_dptr : cmd_dptr;
			cmd_cltot      <= ld_ptr ? pipe_cltot : cmd_cltot;
			cmd_multicycle <= ld_ptr ? pipe_multicycle : cmd_multicycle;	
		 end
         BLDXFR : begin
			case(cmd_multicycle) // synopsys full_case parallel_case
			  1'b0 : begin
				 cmd_typ     <=  cmd_typ;
				 cmd_clsts   <=  cmd_clsts;
				 cmd_stat    <=  cmd_stat;
				 cmd_sbdtag  <=  cmd_sbdtag;
                 cmd_pktlen  <=  cmd_pktlen;				 
				 cmd_addr_hi <=  cmd_addr_hi;
				 cmd_addr_lo <=  cmd_addr_lo;
				 cmd_dptr    <=  cmd_dptr;
				 cmd_cltot   <=  cmd_cltot;
				 cmd_multicycle <= cmd_multicycle;	
			  end
			  1'b1 : begin
				 case (cmd_clastyp)   // synopsys parallel_case
				   CLASPIO,
				   CLASMSI,
				   CLASMSG,
				   CLASMDO,
				   CLASNUL,
				   CLASWR : begin
					  cmd_typ     <= ld_ptr ? pipe_typ : cmd_typ;
					  cmd_clsts   <= ld_ptr ? pipe_clsts
                                            : (next_gen_crcd ? last_clsts : cmd_clsts);
					  cmd_stat    <= ld_ptr ? pipe_stat : cmd_stat;
					  cmd_sbdtag  <= ld_ptr ? pipe_sbdtag : cmd_sbdtag;
					  cmd_pktlen  <= ld_ptr ? pipe_pktlen
									        : (gen_crcd ? (cmd_pktlen - cacheline) 
                                                        : cmd_pktlen);
					  cmd_addr_hi <= ld_ptr ? pipe_addr_hi : cmd_addr_hi;
					  cmd_addr_lo <= ld_ptr ? pipe_addr_lo
									        : (gen_crcd ? (cmd_addr_lo + 1'b1) 
                                                        : cmd_addr_lo);
					  cmd_dptr    <= cmd_dptr;
					  cmd_cltot   <= ld_ptr ? pipe_cltot : cmd_cltot;
					  cmd_multicycle <= ld_ptr ? pipe_multicycle : cmd_multicycle;
				   end // case: CLASWR

				   CLASRD,
                   CLASRDL,
				   CLASUNSP : begin
					  cmd_typ     <= ld_ptr ? pipe_typ : cmd_typ;
					  cmd_clsts   <= ld_ptr ? pipe_clsts : (gen_crcd ? 1'b0 : cmd_clsts);
					  cmd_stat    <= ld_ptr ? pipe_stat : cmd_stat;
					  cmd_sbdtag  <= ld_ptr ? pipe_sbdtag : cmd_sbdtag;
					  cmd_pktlen  <= ld_ptr ? pipe_pktlen
									        : (gen_crcd ? (cmd_pktlen - cacheline) 
                                                        : cmd_pktlen);
					  cmd_addr_hi <= ld_ptr ? pipe_addr_hi : cmd_addr_hi;
					  cmd_addr_lo <= ld_ptr ? pipe_addr_lo
									        : (gen_crcd ? (cmd_addr_lo + 1'b1) 
                                                        : cmd_addr_lo);
					  cmd_dptr    <= ld_ptr ? pipe_dptr 
                                            : (gen_crcd ? (cmd_dptr - 1'b1) 
                                                        : cmd_dptr);
					  
					  cmd_cltot   <= ld_ptr ? pipe_cltot : cmd_cltot;
					  cmd_multicycle <= ld_ptr ? pipe_multicycle : cmd_multicycle;
				   end // case: CLASWR
				   default : begin
					  cmd_typ     <=  cmd_typ;
					  cmd_clsts   <=  cmd_clsts;
					  cmd_stat    <=  cmd_stat;
					  cmd_sbdtag  <=  cmd_sbdtag;
					  cmd_pktlen  <=  cmd_pktlen;
					  cmd_addr_hi <=  cmd_addr_hi;
					  cmd_addr_lo <=  cmd_addr_lo;
					  cmd_dptr    <=  cmd_dptr;
					  cmd_cltot   <=  cmd_cltot;
					  cmd_multicycle <= cmd_multicycle;
				   end // case: default				   
				 endcase // case(cmd_clastyp)
			  end // case: 1'b1
			endcase // case(cmd_multicycle)			
		 end // case: BLDXFR		 

		 default : begin
			cmd_typ     <=  cmd_typ;
			cmd_clsts   <=  cmd_clsts;
			cmd_stat    <=  cmd_stat;
			cmd_sbdtag  <=  cmd_sbdtag;
            cmd_pktlen  <=  cmd_pktlen;			
			cmd_addr_hi <=  cmd_addr_hi;
			cmd_addr_lo <=  cmd_addr_lo;
			cmd_dptr    <=  cmd_dptr;
			cmd_cltot   <=  cmd_cltot;
			cmd_multicycle <= cmd_multicycle;	
         end			
	   endcase // case({bld_state,pipe_multicycle})	   
  end // always @ (posedge clk)   

always @(posedge clk)
  begin
    if (rst_l == 1'b0) begin
	   pmu_is_idle <= 1'b1;	   
     end
    else begin
	   pmu_is_idle <= ((pkmpty == 1'b1) && (deq_state ==  DEQIDLE) &&
                       (pipe_full == 1'b0) && (bld_state == BLDIDLE))
                      ? 1'b1 : 1'b0;
	end
  end
	 
// ***************State Machine Procedures ********************************/	 

// Record Dequeue
// State machine 
   
// DEQ next state
always @(deq_state or pkmpty or ps2pm_i_gnt or pipe_full
         or clastyp or ps2pm_i_full or cl2pm_rcd_full)
  begin
    case (deq_state)	// synopsys parallel_case
      DEQIDLE : begin
         case(pkmpty) // synopsys full_case parallel_case
          1'b1: deq_next = DEQIDLE;
          1'b0: begin
			 case (pipe_full) // synopsys full_case parallel_case
			   1'b1 : deq_next = DEQIDLE;
			   1'b0 : begin
				  case (clastyp) // synopsys parallel_case
					CLASRD,
                    CLASRDL,
                    CLASUNSP : begin
					   case (ps2pm_i_full)  // synopsys full_case parallel_case
						 1'b1 : deq_next = DEQIDLE;
						 1'b0 : deq_next = DEQGNT;
					   endcase // case(ps2pm_i_full)
					end
					CLASPIO  : deq_next = DEQGNT;
					CLASWR ,
					CLASMSI,
					CLASMSG,
					CLASMDO,
					CLASNUL : deq_next = DEQ;
					default : deq_next = DEQIDLE;
				  endcase // case(clastyp)
			   end // case: 1'b0
			 endcase // case(pipe_full)			 
		  end // case: 1'b0
		 endcase // case(pkmpty)
	  end // case: DEQIDLE

      DEQGNT : begin
		 case(ps2pm_i_gnt) // synopsys full_case parallel_case
		   1'b1: deq_next = DEQ;
		   1'b0: deq_next = DEQGNT;
		 endcase // case(ps2pm_i_gnt)
	  end	  		 

      DEQ : begin
		 case(cl2pm_rcd_full) // synopsys full_case parallel_case
		   1'b1 : deq_next = DEQ;
		   1'b0 : deq_next = DEQIDLE;
		 endcase // case(cl2pm_rcd_full)		 
	  end // case: DEQ

     default: deq_next = DEQIDLE;
	  
	endcase // case(deq_state)
  end // always @ (deq_state or pkmpty or ps2pm_i_gnt or pipe_full...
   
// DEQ state machine outputs
always @(deq_state or pkmpty or pipe_full or ps2pm_i_gnt or
         clastyp or ps2pm_i_full or cl2pm_rcd_full)
  begin
    case (deq_state)	// synopsys parallel_case
      DEQIDLE : begin
		 case(pkmpty) // synopsys full_case parallel_case
          1'b1: begin
			 ld_pipe   = 1'b0;
			 next_gen_trn = 1'b0;
			 next_deq_rcd = 1'b0;
		  end		   
          1'b0: begin
			 case (pipe_full) // synopsys full_case parallel_case
			   1'b1 : begin
				  ld_pipe   = 1'b0;
				  next_gen_trn = 1'b0;
				  next_deq_rcd = 1'b0;
			   end
			   1'b0 : begin
				  case (clastyp) // synopsys parallel_case
					CLASRD,
                    CLASRDL,
                    CLASUNSP : begin
					   next_deq_rcd = 1'b0;
					   ld_pipe   = 1'b0;
					   case (ps2pm_i_full)  // synopsys full_case parallel_case
						 1'b1 : next_gen_trn = 1'b0;
						 1'b0 : next_gen_trn = 1'b1;
					   endcase // case(ps2pm_i_full)
					end					

					CLASPIO : begin
					   next_deq_rcd = 1'b0;
					   ld_pipe   = 1'b0;
					   next_gen_trn = 1'b1;
					end

					CLASWR,
					CLASMSI,
					CLASMSG,
					CLASMDO,
					CLASNUL  : begin
					   ld_pipe   = 1'b1;
					   next_gen_trn = 1'b0;
					   next_deq_rcd = 1'b0;
					end
					default :  begin
					   ld_pipe   = 1'b0;
					   next_gen_trn = 1'b0;
					   next_deq_rcd = 1'b0;
					end
				  endcase // case(clastyp)
			   end // case: 1'b0
			 endcase // case(pipe_full | cl2pm_rcd_full)
		  end // case: 1'b0
		 endcase // case(pkmpty)
	  end // case: DEQIDLE

      DEQGNT : begin
		 next_gen_trn = 1'b0;
		 next_deq_rcd = 1'b0;
		 case(ps2pm_i_gnt)
		   1'b1: ld_pipe = 1'b1;		   
		   1'b0: ld_pipe = 1'b0;
		 endcase // case(ps2pm_i_gnt)
	  end	  		
	  
     DEQ : begin
		case(cl2pm_rcd_full) // synopsys full_case parallel_case
		  1'b1 : begin
			 ld_pipe   = 1'b0;
			 next_gen_trn = 1'b0;
			 next_deq_rcd = 1'b0;
		  end
		  1'b0 : begin
			 ld_pipe   = 1'b0;
			 next_gen_trn = 1'b0;
			 case (pkmpty)  // synopsys full_case parallel_case
			   1'b1 : next_deq_rcd = 1'b0;			   
			   1'b0 : next_deq_rcd = 1'b1;
			 endcase // case(pkmpty)			 
		  end
		endcase // case(cl2pm_rcd_full)
	 end // case: DEQ	  
 
     default: begin
		ld_pipe   = 1'b0;
		next_gen_trn = 1'b0;
		next_deq_rcd = 1'b0;
	 end
	endcase // case(deq_state)
  end // always @ (deq_state or pkmpty or pipe_full or clastyp or...   

// DEQ state transitions
always @(posedge clk)
  begin
	 if (rst_l == 1'b0)
	   deq_state <= DEQIDLE;	// Synchronous Reset
	 else begin
		deq_state <= deq_next;
	 end
  end   
    

   
// Command Build Process
// State machine (build_crcd)
   
// BLD next state
always @(bld_state or pipe_full or cl2pm_rcd_full or cmd_multicycle 
         or num_cmd or cmd_cltot)
  begin
    case (bld_state)	// synopsys parallel_case
      BLDIDLE : begin
         case(pipe_full) // synopsys full_case parallel_case
          1'b0: bld_next = BLDIDLE;
          1'b1: bld_next = BLDXFR;
		 endcase // case(pipe_full)		 
	  end
	  
      BLDXFR : begin
		case(cl2pm_rcd_full)   // synopsys full_case parallel_case
		  1'b1 : bld_next = BLDXFR;
		  1'b0 : begin
			 case(cmd_multicycle)  // synopsys full_case parallel_case
			   1'b0 : bld_next = BLDIDLE;
               1'b1 : begin				  
				  if(num_cmd == cmd_cltot) bld_next = BLDIDLE;
				  else bld_next = BLDXFR;
			   end
			 endcase // case(cmd_multicycle)			 
		  end // case: 1'b0
		endcase // case(cl2pm_rcd_full)
	 end // case: BLDXFR		  

     default: bld_next = BLDIDLE;
	  
	endcase // case(bld_state)
  end // always @ (bld_state or pipe_full or cl2pm_rcd_full or pipe_multicycle...   


// BLD state machine outputs
always @(bld_state or pipe_full or cl2pm_rcd_full or num_cmd 
         or cmd_multicycle or cmd_cltot)
  begin
    case (bld_state)	// synopsys parallel_case
	  BLDIDLE : begin
		 next_gen_crcd = 1'b0;
		 
		 case (pipe_full)  // synopsys full_case parallel_case
		   1'b0 : ld_ptr   = 1'b0;
		   1'b1 : ld_ptr   = 1'b1;
		 endcase // case(pipe_full)		 
	  end // case: BLDIDLE	  

	  BLDXFR : begin
		 ld_ptr   = 1'b0;

		 case(cl2pm_rcd_full)   // synopsys full_case parallel_case
		   1'b1 : next_gen_crcd = 1'b0;
		   1'b0 : begin
			  case (cmd_multicycle)  // synopsys full_case parallel_case
				1'b0 : next_gen_crcd = 1'b1;
                1'b1 : begin
				   if(num_cmd == cmd_cltot) next_gen_crcd = 1'b0;
				   else next_gen_crcd = 1'b1;
				end
			  endcase // case(cmd_multicycle)			  
		   end // case: 1'b0
		 endcase // case(cl2pm_rcd_full)
	  end // case: BLDXFR

     default: begin
		ld_ptr   = 1'b0;
		next_gen_crcd = 1'b0;
	 end
	endcase // case(bld_state)
  end // always @ (bld_state or pipe_full or cl2pm_rcd_full or num_cmd...   

// BLD state transitions
always @(posedge clk)
  begin
	 if (rst_l == 1'b0)
	   bld_state <= BLDIDLE;	// Synchronous Reset
	 else begin
		bld_state <= bld_next;
	 end
  end   


//************************************************
//				MODULES
//************************************************

dmu_pmu_prcd_q prm_queue (
		.clk (clk), 	
		.rst_l (rst_l),
        .enq (cm2pm_rcd_enq),
		.rcd_in (cm2pm_rcd),
        .deq (next_deq_rcd), 
        .typ (pkttyp),
        .len(pktlen),
        .byt_cnt(pktbyt_cnt),
        .cntxt_num(pktcntxt_num),
        .pkseq_num(pktseq_num),
        .addr(pktaddr),
        .addr_err(pktaddr_err),
        .dptr(pktdptr),
        .sbd_tag(pkttr_tag),
		.full (pm2cm_rcd_full),
        .overflow(),
        .underflow(),
        .empty (pkmpty)
		);

// ********************** signal registers *************************/

always @(posedge clk)
  begin	 
    if (rst_l == 1'b0) begin
       pm2cl_rcd_enq <= 1'b0;
       gen_crcd <= 1'b0;
	   pipe_full <= 0;
	   line_clsts <= 0;
	   persist_last_dwbe <= 0;	   
	end	 
    else begin
       pm2cl_rcd_enq <= next_gen_crcd;
       gen_crcd <= next_gen_crcd;
	   pipe_full <= ld_pipe ? 1'b1 : (~ld_ptr & pipe_full);
	   persist_last_dwbe <= ld_ptr ? pipe_pktbyt_cnt[7:4] : persist_last_dwbe;	   
       line_clsts <= ld_ptr ? 1'b0 
                            : (((cmd_pktlen[3:0] != 4'h0) || (persist_last_dwbe != 4'hf)) ? 1'b1 : line_clsts);	   
	end // else: !if(rst_l == 1'b0)	 
  end // always @ (posedge clk)


// ----------------------------------------------------------------------------
// Debug
// ----------------------------------------------------------------------------
   
always @ (dbg2prm_dbg_sel_a or dbg2prm_dbg_sel_b)
  begin
	 prm_dbg_sel[0] = dbg2prm_dbg_sel_a;
	 prm_dbg_sel[1] = dbg2prm_dbg_sel_b;	 
  end

always @ (prm_dbg_sel[0] or prm_dbg_sel[1] or next_cltot or clastyp or 
            pipe_cltot or pipe_clastyp or pipe_multicycle or bld_state or 
            cm2pm_rcd_enq or pkmpty or next_deq_rcd or ld_pipe or
            pipe_full or deq_state or ld_ptr or next_gen_trn or 
            next_gen_crcd or cl2pm_rcd_full or cmd_multicycle or pm2ps_i_req or 
            ps2pm_i_gnt or ps2pm_i_full or pm2ps_i_cmd_type or pm2cl_rcd_enq or 
            cmd_clsts or cmd_cltot or pmu_is_idle
            )
  begin
	 for (i = 0; i < 2; i = i + 1) begin
		case (prm_dbg_sel[i]) // synopsys infer_mux
		  3'b000: nxt_prm_dbg1_bus[i] = {pmu_is_idle,next_cltot,clastyp[2:0]};
		  3'b001: nxt_prm_dbg1_bus[i] = {pipe_cltot,pipe_clastyp};
		  3'b010: nxt_prm_dbg1_bus[i] = {1'b0,pipe_multicycle,clastyp,bld_state};
		  3'b011: nxt_prm_dbg1_bus[i] = {1'b0,cm2pm_rcd_enq,pkmpty,next_deq_rcd,ld_pipe,pipe_full,deq_state};
		  3'b100: nxt_prm_dbg1_bus[i] = {ld_ptr,pipe_full,next_gen_trn,next_gen_crcd,pipe_clastyp};
		  3'b101: nxt_prm_dbg1_bus[i] = {cl2pm_rcd_full,cmd_multicycle,clastyp,bld_state};		  
		  3'b110: nxt_prm_dbg1_bus[i] = {1'b0,pm2ps_i_req,ps2pm_i_gnt,ps2pm_i_full,pm2ps_i_cmd_type};
		  3'b111: nxt_prm_dbg1_bus[i] = {2'b00,pm2cl_rcd_enq,cmd_clsts,cmd_cltot};		
		endcase // case(prm_dbg_sel[i])
	 end // for (i = 0; i < 2; i = i + 1)
  end // always @ (prm_dbg_sel[0] or prm_dbg_sel[1] or...

always @ (prm_dbg_sel[0] or prm_dbg_sel[1] or num_cmd or 
          cmd_clastyp or cmd_typ or cmd_pktlen or cmd_addr_hi or 
          cmd_addr_lo or cmd_dptr or rem_len or cmd_sbdtag or 
          last_clsts or cmd_cltot or cmd_stat
          )
  begin
	 for (j = 0; j < 2; j = j + 1) begin
		case (prm_dbg_sel[j]) // synopsys infer_mux
		  3'b000: nxt_prm_dbg2_bus[j] = {num_cmd,cmd_clastyp};
		  3'b001: nxt_prm_dbg2_bus[j] = {1'b0,cmd_typ};
		  3'b010: nxt_prm_dbg2_bus[j] = {cmd_pktlen[7:0]};
//BP n2 5-24-04
//		  3'b011: nxt_prm_dbg2_bus[j] = {cmd_addr_hi[7:6],cmd_addr_lo};
		  3'b011: nxt_prm_dbg2_bus[j] = {cmd_addr_hi[8:7],cmd_addr_lo[5:0]};
		  3'b100: nxt_prm_dbg2_bus[j] = {1'b0,cmd_dptr};
		  3'b101: nxt_prm_dbg2_bus[j] = {1'b0,rem_len[9:8],cmd_sbdtag};		  
		  3'b110: nxt_prm_dbg2_bus[j] = {last_clsts,cmd_cltot, cmd_stat};
		  3'b111: nxt_prm_dbg2_bus[j] = {8'h00};		
		endcase // case(prm_dbg_sel[i])
	 end // for (j = 0; j < 2; j = j + 1)	 
  end // always @ (prm_dbg_sel[0] or prm_dbg_sel[1] or...   
   
  always @ (cr2pm_dbg_sel_a or prm2dbg_dbg1_a or prm2dbg_dbg2_a)
    begin
	   case (cr2pm_dbg_sel_a[5:3]) // synopsys infer_mux
		 3'b000: nxt_dbg_bus[0] = prm2dbg_dbg1_a;
		 3'b001: nxt_dbg_bus[0] = prm2dbg_dbg2_a;
		 3'b010: nxt_dbg_bus[0] = 8'h00;
		 3'b011: nxt_dbg_bus[0] = 8'h00;
		 3'b100: nxt_dbg_bus[0] = 8'h00;
		 3'b101: nxt_dbg_bus[0] = 8'h00;
		 3'b110: nxt_dbg_bus[0] = 8'h00;
		 3'b111: nxt_dbg_bus[0] = 8'h00;
	   endcase // case(cr2pm_dbg_sel_a[5:3])
	end // always @ (cr2pm_dbg_sel_b or prm2dbg_dbg1_a ...

  always @ (cr2pm_dbg_sel_b or prm2dbg_dbg1_b or prm2dbg_dbg2_b)
    begin
	   case (cr2pm_dbg_sel_b[5:3]) // synopsys infer_mux
		 3'b000: nxt_dbg_bus[1] = prm2dbg_dbg1_b;
		 3'b001: nxt_dbg_bus[1] = prm2dbg_dbg2_b;
		 3'b010: nxt_dbg_bus[1] = 8'h00;
		 3'b011: nxt_dbg_bus[1] = 8'h00;
		 3'b100: nxt_dbg_bus[1] = 8'h00;
		 3'b101: nxt_dbg_bus[1] = 8'h00;
		 3'b110: nxt_dbg_bus[1] = 8'h00;
		 3'b111: nxt_dbg_bus[1] = 8'h00;
	   endcase // case(cr2pm_dbg_sel_b[5:3])
	end // always @ (cr2pm_dbg_sel_b or prm2dbg_db1g_b ...

// ********************** Output Procedures ************************/
   
// Debug
always @ (posedge clk) begin
   if(rst_l == 1'b0) begin
    for (k = 0; k < 2; k = k + 1) begin
      prm_dbg1_bus[k] <= 8'h00;
      prm_dbg2_bus[k] <= 8'h00;
    end
   end
   else begin
	  for (k = 0; k < 2; k = k + 1) begin
		 prm_dbg1_bus[k] <= nxt_prm_dbg1_bus[k];
		 prm_dbg2_bus[k] <= nxt_prm_dbg2_bus[k];		 
	  end
   end
end // always @ (posedge clk)

// Debug
always @ (posedge clk) begin
   if(rst_l == 1'b0) begin
    for (l = 0; l < 2; l = l + 1) begin
      dbg_bus[l] <= 8'h00;
    end
   end
   else begin
	  for (l = 0; l < 2; l = l + 1) begin
		 dbg_bus[l] <= nxt_dbg_bus[l];
	  end
   end
end // always @ (posedge clk)   
   
// PSB outputs
always @(posedge clk)
  begin
    if (rst_l == 1'b0) begin
       pm2ps_i_req <= 1'b0;	   
       pm2ps_i_cmd_type[PSCMDTYPMSB : 0] <= 0;
	   pm2ps_i_wr_data[PSRCDMSB :0] <= 0;
	   pm2ps_i_trn <= 0;

      end
    else begin
       pm2ps_i_req <= next_gen_trn ? 1'b1 : (~ps2pm_i_gnt & pm2ps_i_req);
       pm2ps_i_cmd_type[PSCMDTYPMSB:0] <= next_gen_trn 
                                            ? next_scbd_fun[PSCMDTYPMSB:0]
                                            : pm2ps_i_cmd_type[PSCMDTYPMSB:0];

	   pm2ps_i_wr_data[PSRCDMSB :0]    <= next_gen_trn 
                                            ? next_pm2ps_i_wr_data[PSRCDMSB:0]
                                            : pm2ps_i_wr_data[PSRCDMSB:0];

   	   pm2ps_i_trn <= next_gen_trn ? pkttr_tag[PRSBDTAGMSB :0] :  pm2ps_i_trn;

	end // else: !if(rst_l == 1'b0)	 
  end // always @ (posedge clk)   


// ***********************Assignments *****************************/
   
   assign cacheline[PRLENMSB :0] = 10'h010;
   
   assign real_size = ({1'b0,pktaddr[8:0]} + pktlen);
   assign align_size = ({1'b0,pktaddr[8:4], 4'b0000} + cacheline);
   assign align_adj = (real_size > align_size) ? 1'b1 : 1'b0;

   assign block_size = ({1'b0,pktaddr[8:4], 4'b0000} + {2'b00,new_pktlen,4'b0000});   
   assign block_adj = (real_size > block_size) ? 1'b1 : 1'b0;

   assign new_pktlen[CLTOTMSB :0] = pktlen[7 :4];
   assign offset_len[PRLENMSB :0] = cacheline - {6'h00,pktaddr[3 :0]};
   assign rem_len = pktlen  - offset_len;
   assign trail = (rem_len[3:0] != 4'b0) ? 4'h1 : 4'h0;
   

   assign last_clsts = ((num_cmd + 4'h1) == cmd_cltot) ? line_clsts : 1'b0;
   
   assign pm2cl_rcd [ICRMSB :0] = {                   // CLU Record
								   cmd_typ[CRTYPMSB :0],
								   cmd_clsts,
								   {cmd_addr_hi,cmd_addr_lo},
								   cmd_stat[CRSTATMSB :0],
								   cmd_dptr[CRDPTRMSB :0],
								   cmd_sbdtag[CRSBDTAGMSB :0]
								   };

   assign next_pm2ps_i_wr_data[PSRCDMSB :0] = {      // next PSB Record
											   pkttr_tag[PRSBDTAGMSB :0],
											   pktcntxt_num[PRCNTXTNUMMSB :0],
											   pktseq_num[PRPKSEQNUMMSB :0],
											   next_cltot[CLTOTMSB :0],
											   next_pktlen[PRLENMSB :0],
											   next_pktbyt_cnt[PRBYTCNTMSB :0]
											   };
// debug select and data port distribution
  assign dbg2prm_dbg_sel_a = cr2pm_dbg_sel_a [`FIRE_DLC_PMU_PRM_DS_BITS];
  assign dbg2prm_dbg_sel_b = cr2pm_dbg_sel_b [`FIRE_DLC_PMU_PRM_DS_BITS];

// Debug
  assign prm2dbg_dbg1_a = prm_dbg1_bus[0];
  assign prm2dbg_dbg1_b = prm_dbg1_bus[1];
  assign prm2dbg_dbg2_a = prm_dbg2_bus[0];
  assign prm2dbg_dbg2_b = prm_dbg2_bus[1];
  assign pm2cr_dbg_a = dbg_bus[0];
  assign pm2cr_dbg_b = dbg_bus[1];
   
endmodule 


