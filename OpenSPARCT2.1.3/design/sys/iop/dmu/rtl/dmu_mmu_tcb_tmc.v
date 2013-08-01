// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: dmu_mmu_tcb_tmc.v
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
module dmu_mmu_tcb_tmc 
  (
   clk,				// clock
   rst_l,			// reset
   csr2tcb_av,	 		// csr access violation
   csr2tcb_be,	 		// csr bypass enable
   csr2tcb_cm,	 		// csr cache mode
   csr2tcb_ds_a,		// csr debug select a
   csr2tcb_ds_b,		// csr debug select b
   csr2tcb_pd,	 		// csr processing disable
   csr2tcb_te,	 		// csr translation enable
   pab2tcb_err,	 		// pab errors
   tlb2tcb_hit,	 		// tlb virtual tag hit
   vab2tcb_err,	  		// vab errors
   vab2tcb_vld,	 		// vab valids
   vab2tcb_sun4v_va_oor,	// sun4v va oor
   vab2tcb_4vor,	 	// sun4v out of range
   vab2tcb_s4uf,	 	// sun4v underflow
   qcb2tcb_hld,	 		// qcb hold
   qcb2tcb_vld,	 		// qcb valid
   vtb2tcb_hit,	 		// vtb hit
   tcc2tmc_ack,	 		// tcc acknowledge
   tcc2tmc_dbg,	 		// tcc debug
   tcc2tmc_vld,	 		// tcc valid
   tdc2tmc_dbg,	 		// tdc debug
   tdc2tmc_err,	 		// tdc errors
   tcb2csr_dbg_a,		// csr debug bus a
   tcb2csr_dbg_b,		// csr debug bus b
   tcb2csr_err, 		// csr errors
   tcb2csr_prf, 		// csr performance events
   tcb2csr_tpl, 		// csr translation pipeline not empty
   tcb2pab_err,	 		// pab error
   tcb2pab_sel,	 		// pab select
   tcb2qcb_hld,	 		// qcb hold
   tcb2qcb_vld,	 		// qcb valids
   tcb2tlb_hld,	 		// tlb holds
   tcb2tlb_sel,	 		// tlb select
   tcb2vab_hld,	 		// vab hold
   tcb2vtb_hld,	 		// vtb holds
   tcb2vtb_tmv,	 		// vtb valid
   vaq2tcb_deq_en,
   tmc2tcc_req,	 		// tcc request
   tdb2tmc_kerr,	 	// key error on ppn readout out of ram
   tlb2tmc_kerr, 		// key error on ppn readout out of tlb single entry
   srq2tmc_ipe,	 		// iotsb parity error sunv4 mode only
   srq2tmc_ivld,	 	// iotsb valid bit and'ed with sun4v_mode
   sun4v_mode,	 		// 1 = sun4v_mode
   srq2tmc_sun4v_pgsz_err	// 1 = sun4v_mode illegal page size
   );

// ----------------------------------------------------------------------------
// Parameters
// ----------------------------------------------------------------------------
  parameter 	IDLE = 2'b00,			// state machine states
		THLD = 2'b01,
		QHLD = 2'b10,
		BOTH = 2'b11;

//  parameter 	ERR_MSK = 16'hFDFF;		// error mask
  parameter 	ERR_MSK = 21'h1FFDFF;		// error mask

// ----------------------------------------------------------------------------
// Ports
// ----------------------------------------------------------------------------
  input					clk;
  input 				rst_l;

  input 				csr2tcb_av;
  input 				csr2tcb_be;
  input  [`FIRE_DLC_MMU_CSR_CM_BITS]	csr2tcb_cm;
  input  [`FIRE_DLC_MMU_CSR_DS_BITS]	csr2tcb_ds_a;
  input  [`FIRE_DLC_MMU_CSR_DS_BITS]	csr2tcb_ds_b;
  input 				csr2tcb_pd;
  input 				csr2tcb_te;
  input  [`FIRE_DLC_MMU_PAB_ERR_BITS]	pab2tcb_err;
  input 				tlb2tcb_hit;
  input  [`FIRE_DLC_MMU_VAB_ERR_BITS]	vab2tcb_err;
  input  [`FIRE_DLC_MMU_VAB_VLD_BITS]	vab2tcb_vld;
  input  				vab2tcb_sun4v_va_oor;
  input  				vab2tcb_4vor;
  input  				vab2tcb_s4uf;
  input 				qcb2tcb_hld;
  input 				qcb2tcb_vld;
  input 				vtb2tcb_hit;
  input 				tcc2tmc_ack;
  input  [`FIRE_DBG_DATA_BITS]		tcc2tmc_dbg;
  input 				tcc2tmc_vld;
  input  [`FIRE_DBG_DATA_BITS]		tdc2tmc_dbg;
  input  [`FIRE_DLC_MMU_TDC_ERR_BITS]	tdc2tmc_err;
  input 				vaq2tcb_deq_en;
  input 				tdb2tmc_kerr;
  input 				tlb2tmc_kerr;
  input 				srq2tmc_ipe;
  input 				srq2tmc_ivld;
  input 				sun4v_mode;
  input 				srq2tmc_sun4v_pgsz_err;

  output [`FIRE_DBG_DATA_BITS]		tcb2csr_dbg_a;
  output [`FIRE_DBG_DATA_BITS]		tcb2csr_dbg_b;
  output [`FIRE_DLC_MMU_CSR_ERR_BITS]	tcb2csr_err;
  output [`FIRE_DLC_MMU_TCB_PRF_BITS]	tcb2csr_prf;
  output				tcb2csr_tpl;
  output				tcb2pab_err;
  output				tcb2pab_sel;
  output				tcb2qcb_hld;
  output [`FIRE_DLC_MMU_PLS_DPTH:1]	tcb2qcb_vld;
  output				tcb2tlb_hld;
  output				tcb2tlb_sel;
  output				tcb2vab_hld;
  output				tcb2vtb_hld;
  output				tcb2vtb_tmv;
  output				tmc2tcc_req;

// ----------------------------------------------------------------------------
// Variables
// ----------------------------------------------------------------------------
  wire [`FIRE_DBG_DATA_BITS]		tcb2csr_dbg_a, tcb2csr_dbg_b;
  wire [`FIRE_DLC_MMU_CSR_ERR_BITS]	tcb2csr_err, err_ne0, err_ne1, err_ne2;
  wire [`FIRE_DLC_MMU_TCB_PRF_BITS]	tcb2csr_prf;
  wire [`FIRE_DLC_MMU_PLS_DPTH:1]	tcb2qcb_vld, nxt_vld;
  wire [`FIRE_DLC_MMU_PLS_DPTH-1:1]	nxt_bmv, nxt_tmv;
  wire [`FIRE_DLC_MMU_TDC_ERR_BITS]	nxt_err, twk_err;

  reg  [`FIRE_DLC_MMU_TDC_ERR_BITS]	err;
  reg  [`FIRE_DLC_MMU_CSR_ERR_BITS]	err_ps1, err_ps2;
  reg  [`FIRE_DLC_MMU_PLS_DPTH:0]	vld;
  reg  [`FIRE_DLC_MMU_PLS_DPTH-1:0]	bmv, tmv;
  reg  [`FIRE_DLC_MMU_PLS_DPTH-1:0]	hld;
  reg  [1:0]				state, nxt_state;
  reg					ack, req, nxt_req;
  reg					hit_ps1, hit_ps2;
  reg					bmv_err, tmv_err, tdm_err;
  reg					sun4v_pgsz_err;

  reg  [`FIRE_DLC_MMU_CSR_DS_BITS]	dbg_sel [0:1];
  reg  [`FIRE_DBG_DATA_BITS]		dbg_bus [0:1];

  integer i;

// ----------------------------------------------------------------------------
// Zero In Checkers
// ----------------------------------------------------------------------------

  // 0in state_transition -var state -val IDLE -next THLD QHLD BOTH
  // 0in state_transition -var state -val THLD -next IDLE QHLD BOTH
  // 0in state_transition -var state -val QHLD -next IDLE THLD BOTH
  // 0in state_transition -var state -val BOTH -next IDLE THLD QHLD

// ----------------------------------------------------------------------------
// Combinational
// ----------------------------------------------------------------------------
  assign tcb2csr_tpl = |vld;
  assign tcb2qcb_vld = vld[`FIRE_DLC_MMU_PLS_DPTH:1];

// ----------------------------------------------------------------------------
// Pipeline stage 0 controls
// ----------------------------------------------------------------------------
reg vaq2tcb_deq_en_d;
always @(posedge clk) begin
   if(rst_l == 1'b0) begin
	vaq2tcb_deq_en_d <= 1'b0;
	end
	else vaq2tcb_deq_en_d <= vaq2tcb_deq_en;
end

  wire	 vld_ps0 = qcb2tcb_vld & ~csr2tcb_pd & ~hld[0] & (vaq2tcb_deq_en && vaq2tcb_deq_en_d);

// valid signals
  always @ (csr2tcb_be or csr2tcb_te or vab2tcb_vld or vld_ps0 or srq2tmc_sun4v_pgsz_err) begin
    bmv_err = ~(csr2tcb_be | vab2tcb_vld[2]) & vld_ps0 & vab2tcb_vld[0];
    bmv[0]  =  (csr2tcb_be | vab2tcb_vld[2]) & vld_ps0 & vab2tcb_vld[0];
    tmv_err = ~csr2tcb_te & vld_ps0 & vab2tcb_vld[1];
    tmv[0]  =  csr2tcb_te & vld_ps0 & vab2tcb_vld[1];
    vld[0]  =  vld_ps0;
    sun4v_pgsz_err = srq2tmc_sun4v_pgsz_err & tmv[0];
  end

// vtb valid
  wire	 tcb2vtb_tmv = tmv[0];
 wire	ivld		= tmv[0] & srq2tmc_ivld;
 wire	ipe		= tmv[0] & srq2tmc_ipe;
 wire	sun4v_va_oor	= tmv[0]  & vab2tcb_sun4v_va_oor;

//BP 11-30-05
// I don't need to explicitly add ~bmv_err to mask sun4v errors since tmv is added to
//	all of the error cases, the same for tmv_err
// errors
  assign err_ne0[0]  = bmv_err;		// bypass error
  assign err_ne0[1]  = 0;		// bypass out of range error
  assign err_ne0[2]  = sun4v_pgsz_err & // sun4v page size error, illegal selection
			~sun4v_va_oor & ~ipe  & ~ivld ;	
  assign err_ne0[3]  = 0;		// spare
  assign err_ne0[4]  = tmv_err;		// translation error
  assign err_ne0[5]  = 0;		// translation out of range error
  assign err_ne0[6]  = 0;		// tte invalid
  assign err_ne0[7]  = 0;		// tte protection error
  assign err_ne0[8]  = 0;		// tte cache parity error
  assign err_ne0[9]  = 0;		// csr cache access violation
  assign err_ne0[10] = 0;		// spare
  assign err_ne0[11] = 0;		// spare
  assign err_ne0[12] = 0;		// tablewalk disabled error
  assign err_ne0[13] = 0;		// tablewalk unexpected data
  assign err_ne0[14] = 0;		// tablewalk error
  assign err_ne0[15] = 0;		// tablewalk parity error
  assign err_ne0[16] = ivld  &  // sun4v iotsb valid bit not set
				~sun4v_va_oor & ~srq2tmc_ipe ;	
  assign err_ne0[17] = ipe  & // sun4v iotsb parity error
				~sun4v_va_oor ;		
  assign err_ne0[18] = sun4v_va_oor ;		// sun4v va out of range
  assign err_ne0[19] = 0;		// sun4v va underflow
  assign err_ne0[20] = 0;		// sun4v key error

// next valids
  assign nxt_bmv[1] = bmv[0];
  assign nxt_tmv[1] = tmv[0];
  assign nxt_vld[1] = vld[0];

// ----------------------------------------------------------------------------
// Pipeline stage 1 controls
// ----------------------------------------------------------------------------

// tlb hit and tablewalk test
  wire	 tlb_hit = tlb2tcb_hit & tcc2tmc_vld;
//  wire	 twk_tst = tmv[1] & ~hld[1] & ~vab2tcb_err[1];
//BP n2 9-24-04  inhibit tablewalk on all 4 of the n2 errors, bits [19:16], bit 20 is after translation
// 	so it is handled similar to a tdb parity error
wire	sun4v_uf,sun4v_or;
  wire	 twk_tst = tmv[1] & ~hld[1] & ~((vab2tcb_err[1] & ~sun4v_mode) |
			(err_ps1[18] | err_ps1[17] | err_ps1[16] | err_ps1[2] | sun4v_or | sun4v_uf ));

// tablewalk request
  always @ (csr2tcb_cm or vtb2tcb_hit or tlb_hit or twk_tst) begin
    case (csr2tcb_cm)  // synopsys parallel_case
      2'b00 : nxt_req = twk_tst & ~tlb_hit;
      2'b01 : nxt_req = 1'b0;
      2'b10 : nxt_req = twk_tst & ~(tlb_hit | vtb2tcb_hit);
      2'b11 : nxt_req = twk_tst & ~(tlb_hit | vtb2tcb_hit);
    endcase
  end

// tablewalk disabled miss error
  always @ (csr2tcb_cm or vtb2tcb_hit or twk_tst) begin
    case (csr2tcb_cm)  // synopsys parallel_case
      2'b00 : tdm_err = 1'b0;
      2'b01 : tdm_err = twk_tst & ~vtb2tcb_hit;
      2'b10 : tdm_err = 1'b0;
      2'b11 : tdm_err = 1'b0;
    endcase
  end

// hit
  always @ (csr2tcb_cm or vtb2tcb_hit or twk_tst) begin
    case (csr2tcb_cm)  // synopsys parallel_case
      2'b00 : hit_ps1 = 1'b0;
      2'b01 : hit_ps1 = twk_tst & vtb2tcb_hit;
      2'b10 : hit_ps1 = twk_tst & vtb2tcb_hit;
      2'b11 : hit_ps1 = twk_tst & vtb2tcb_hit;
    endcase
  end

// sun4v mode errors , n2 only
 assign	sun4v_or	=	tmv[1] & ~hld[1] & vab2tcb_4vor;
 assign	sun4v_uf	=	tmv[1] & ~hld[1] & vab2tcb_s4uf ;

// errors
  assign err_ne1[0]  = err_ps1[0];
  assign err_ne1[1]  = err_ps1[1] | (bmv[1] & vab2tcb_err[0]);
  assign err_ne1[2]  = err_ps1[2] ;
  assign err_ne1[3]  = err_ps1[3];
  assign err_ne1[4]  = err_ps1[4];
  assign err_ne1[5]  = err_ps1[5] | (tmv[1] & (vab2tcb_err[1] & ~sun4v_mode)) | 
			(sun4v_or & ~sun4v_uf & ~err_ps1[18] & ~err_ps1[17] & ~err_ps1[16] & ~err_ps1[2]);
  assign err_ne1[6]  = err_ps1[6];
  assign err_ne1[7]  = err_ps1[7];
  assign err_ne1[8]  = err_ps1[8];
  assign err_ne1[9]  = err_ps1[9];
  assign err_ne1[10] = err_ps1[10];
  assign err_ne1[11] = err_ps1[11];
  assign err_ne1[12] = err_ps1[12] | tdm_err;
  assign err_ne1[13] = err_ps1[13];
  assign err_ne1[14] = err_ps1[14];
  assign err_ne1[15] = err_ps1[15];
  assign err_ne1[16] = err_ps1[16];
  assign err_ne1[17] = err_ps1[17];
  assign err_ne1[18] = err_ps1[18] ;
  assign err_ne1[19] = err_ps1[19] | (sun4v_uf & ~err_ps1[18] & ~err_ps1[17] & ~err_ps1[16] & ~err_ps1[2]);
  assign err_ne1[20] = err_ps1[20];

// next valids
  assign nxt_bmv[2] = bmv[1] & ~hld[1] & ~vab2tcb_err[0];
  assign nxt_tmv[2] = tmv[1] & ~hld[1] & ~((vab2tcb_err[1] & ~sun4v_mode) | 
		(err_ps1[18] | err_ps1[17] | err_ps1[16] | err_ps1[2] | sun4v_or | sun4v_uf )) & ~tdm_err;
  assign nxt_vld[2] = vld[1] & ~hld[1];

// tablewalk request
  wire	 tmc2tcc_req = nxt_req;

// ----------------------------------------------------------------------------
// Pipeline stage 2 controls
// ----------------------------------------------------------------------------

// tablewalk errors
  assign twk_err = err | tdc2tmc_err;
  assign nxt_err = hld[2] ? twk_err : 0;

// pab error enable
  wire   pab_en = tmv[2] & ~|twk_err;

//BP n2 10-05-04
// log key errors, 4 cases, see pg 226 fire prm
reg	key_err;
  always @ (csr2tcb_cm or tlb2tmc_kerr or tdb2tmc_kerr or pab_en or tcb2pab_sel) begin
    case (csr2tcb_cm)  // synopsys parallel_case
      2'b00 : key_err = pab_en & tlb2tmc_kerr;
      2'b01 : key_err = pab_en & tdb2tmc_kerr;
      2'b10 : key_err = pab_en & (tcb2pab_sel ? tlb2tmc_kerr : tdb2tmc_kerr );
      2'b11 : key_err = pab_en & (tcb2pab_sel ? tlb2tmc_kerr : tdb2tmc_kerr );
    endcase
  end


// errors
  assign err_ne2[0]  = err_ps2[0];
  assign err_ne2[1]  = err_ps2[1];
  assign err_ne2[2]  = err_ps2[2];
  assign err_ne2[3]  = err_ps2[3];
  assign err_ne2[4]  = err_ps2[4];
  assign err_ne2[5]  = err_ps2[5];
  assign err_ne2[6]  = err_ps2[6] | (pab_en & pab2tcb_err[0] );
  assign err_ne2[7]  = err_ps2[7] | (pab_en & pab2tcb_err[1] );
  assign err_ne2[8]  = err_ps2[8] | (pab_en & pab2tcb_err[2] );
  assign err_ne2[9]  = err_ps2[9] | csr2tcb_av;
  assign err_ne2[10] = err_ps2[10];
  assign err_ne2[11] = err_ps2[11];
  assign err_ne2[12] = err_ps2[12];
  assign err_ne2[13] = err_ps2[13] | twk_err[0];
  assign err_ne2[14] = err_ps2[14] | twk_err[1];
  assign err_ne2[15] = err_ps2[15] | twk_err[2];
  assign err_ne2[16] = err_ps2[16] ;
  assign err_ne2[17] = err_ps2[17] ;
  assign err_ne2[18] = err_ps2[18] ;
  assign err_ne2[19] = err_ps2[19] ;
  assign err_ne2[20] = err_ps2[20] | key_err ;

// next valids
  assign nxt_vld[3] = vld[2] & ~hld[2];

// errors and selects
  assign tcb2csr_err = nxt_vld[3] ? err_ne2 : err_ne2 & ~ERR_MSK;
  wire	 tcb2pab_err = |(err_ne2 & ERR_MSK);
  wire	 tcb2pab_sel = ~hit_ps2;
  wire	 tcb2tlb_sel = ~tmv[2];

// ----------------------------------------------------------------------------
// Pipeline hold state machine
// ----------------------------------------------------------------------------

// next state
  always @ (state or qcb2tcb_hld or ack or req) begin
    case (state) // synopsys parallel_case
      IDLE :
	case ({qcb2tcb_hld, req}) // synopsys parallel_case
	  2'b00 : nxt_state = IDLE;
	  2'b01 : nxt_state = THLD;
	  2'b10 : nxt_state = QHLD;
	  2'b11 : nxt_state = BOTH;
	endcase
      THLD :
	case ({qcb2tcb_hld, ack}) // synopsys parallel_case
	  2'b00 : nxt_state = THLD;
	  2'b01 : nxt_state = IDLE;
	  2'b10 : nxt_state = BOTH;
	  2'b11 : nxt_state = QHLD;
	endcase
      QHLD :
	case ({qcb2tcb_hld, req}) // synopsys parallel_case
	  2'b00 : nxt_state = IDLE;
	  2'b01 : nxt_state = THLD;
	  2'b10 : nxt_state = QHLD;
	  2'b11 : nxt_state = BOTH;
	endcase
      BOTH :
	case ({qcb2tcb_hld, ack}) // synopsys parallel_case
	  2'b00 : nxt_state = THLD;
	  2'b01 : nxt_state = IDLE;
	  2'b10 : nxt_state = BOTH;
	  2'b11 : nxt_state = QHLD;
	endcase
    endcase
  end
    
// state machine outputs
  always @ (state or nxt_state) begin
    case (state) // synopsys parallel_case
      IDLE :
	case (nxt_state) // synopsys parallel_case
	  IDLE : hld = 3'b000;
	  THLD : hld = 3'b111;
	  QHLD : hld = 3'b011;
	  BOTH : hld = 3'b111;
	endcase
      THLD :
	case (nxt_state) // synopsys parallel_case
	  IDLE : hld = 3'b000;
	  THLD : hld = 3'b111;
	  QHLD : hld = 3'b011;
	  BOTH : hld = 3'b111;
	endcase
      QHLD :
	case (nxt_state) // synopsys parallel_case
	  IDLE : hld = 3'b000;
	  THLD : hld = 3'b000;
	  QHLD : hld = 3'b111;
	  BOTH : hld = 3'b011;
	endcase
      BOTH :
	case (nxt_state) // synopsys parallel_case
	  IDLE : hld = 3'b000;
	  THLD : hld = 3'b111;
	  QHLD : hld = 3'b111;
	  BOTH : hld = 3'b111;
	endcase
    endcase
  end

// holds
//SV  wire	 tcb2qcb_hld = hld[0] | csr2tcb_pd;
  wire	 tcb2qcb_hld = hld[0] | csr2tcb_pd | ~(vaq2tcb_deq_en && vaq2tcb_deq_en_d);
  wire	 tcb2tlb_hld = hld[2];
  wire	 tcb2vab_hld = hld[1];
  wire	 tcb2vtb_hld = hld[1];

// ----------------------------------------------------------------------------
// Performance Events
// ----------------------------------------------------------------------------
  assign tcb2csr_prf[0] = ~hld[2] & (bmv[2] | tmv[2]);	// total tranlations
  assign tcb2csr_prf[1] = |state;			// total stall cycles
  assign tcb2csr_prf[2] = ack;				// total misses
  assign tcb2csr_prf[3] = state[0];			// tablewalk stall cycles
  assign tcb2csr_prf[4] = ~hld[2] & bmv[2];		// bypass mode trans
  assign tcb2csr_prf[5] = ~hld[2] & tmv[2];		// translation mode trans
  assign tcb2csr_prf[6] = state[1];			// flow control stall
  
// ----------------------------------------------------------------------------
// Debug
// ----------------------------------------------------------------------------
  always @ (csr2tcb_ds_a or csr2tcb_ds_b) begin
    dbg_sel[0] = csr2tcb_ds_a;
    dbg_sel[1] = csr2tcb_ds_b;
  end

  assign tcb2csr_dbg_a = dbg_bus[0];
  assign tcb2csr_dbg_b = dbg_bus[1];

// ----------------------------------------------------------------------------
// Sequential
// ----------------------------------------------------------------------------
  always @ (posedge clk) begin
    if (!rst_l) begin
      ack   <= 0;
      err   <= 0;
      req   <= 0;
      state <= IDLE;
    end
    else begin
      ack   <= tcc2tmc_ack;
      err   <= nxt_err;
      req   <= nxt_req;
      state <= nxt_state;
    end
  end

// pipeline stage 1
  always @ (posedge clk) begin
    if (!rst_l) begin
      err_ps1 <= 0;
      bmv[1]  <= 0;
      tmv[1]  <= 0;
      vld[1]  <= 0;
    end
    else if (~hld[1]) begin
      err_ps1 <= err_ne0;
      bmv[1]  <= nxt_bmv[1];
      tmv[1]  <= nxt_tmv[1];
      vld[1]  <= nxt_vld[1];
    end
  end

// pipeline stage 2
  always @ (posedge clk) begin
    if (!rst_l) begin
      err_ps2 <= 0;
      hit_ps2 <= 0;
      bmv[2]  <= 0;
      tmv[2]  <= 0;
      vld[2]  <= 0;
    end
    else if (~hld[2]) begin
      err_ps2 <= err_ne1;
      hit_ps2 <= hit_ps1;
      bmv[2]  <= nxt_bmv[2];
      tmv[2]  <= nxt_tmv[2];
      vld[2]  <= nxt_vld[2];
    end
  end

// pipeline stage 3
  always @ (posedge clk) begin
    if (!rst_l) begin
      vld[3]  <= 0;
    end
    else begin
      vld[3]  <= nxt_vld[3];
    end
  end

// debug
  always @ (posedge clk) begin
    if (!rst_l) begin
    for (i = 0; i < 2; i = i + 1) begin
	dbg_bus[i]	<= 8'b0;
	end
	end
	else begin
    for (i = 0; i < 2; i = i + 1) begin
      case (dbg_sel[i]) // synopsys infer_mux
	3'b000: dbg_bus[i] <= { 1'b0, hld, vld };
	3'b001: dbg_bus[i] <= { state, tmv, bmv };
	3'b010: dbg_bus[i] <= { tlb2tcb_hit, tcc2tmc_vld, hld, tmv};
	3'b011: dbg_bus[i] <= { vtb2tcb_hit, twk_tst, hld, tmv};
	3'b100: dbg_bus[i] <= tcc2tmc_dbg;
	3'b101: dbg_bus[i] <= tdc2tmc_dbg;
	3'b110: dbg_bus[i] <= tcb2csr_err[7:0];
	3'b111: dbg_bus[i] <= tcb2csr_err[15:8];
      endcase
    end
    end
  end
  
endmodule // dmu_mmu_tcb_tmc
