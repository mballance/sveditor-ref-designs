// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: dmu_cmu.v
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
module dmu_cmu (
		clk, 	
		rst_l,

        // Debug Ports
        cr2cm_dbg_sel_a,		// CMU debug select a
        cm2cr_dbg_a,    // CMU debug output a	
        cr2cm_dbg_sel_b,		// CMU debug select b
        cm2cr_dbg_b,    // CMU debug output b

        // RCM
        mm2cm_rcd_enq,
        mm2cm_rcd,
		cm2mm_rcd_full,
        cm2pm_rcd_enq, 
		cm2pm_rcd,
		pm2cm_rcd_full,

        // TCM
        cl2cm_rcd_enq,
        cl2cm_rcd,
		cm2cl_rcd_full,
        cm2rm_rcd_enq, 
		cm2rm_rcd,
		rm2cm_rcd_full,

        // ILU  
		y2k_mps
       );
     
//************************************************
//				PARAMETERS
//************************************************
   
//   parameter MM2CM_WDTH    = `FIRE_DLC_ISR_REC_WDTH,  //79
//             CM2PM_WDTH    = `FIRE_DLC_IPR_REC_WDTH,  //93
//             CL2CM_WDTH    = `FIRE_DLC_EPR_REC_WDTH,  //80
//             CM2RM_WDTH    = `FIRE_DLC_ERR_REC_WDTH;  //70   

   parameter SRMSB           = `FIRE_DLC_ISR_MSB,         // MM2CM_SRWDTH -1
             IPRMSB          = `FIRE_DLC_IPR_MSB,         // CM2PM_PRWDTH -1
			 EPRMSB          = `FIRE_DLC_EPR_MSB,         // CL2CM_PRWDTH -1
             RRMSB           = `FIRE_DLC_ERR_MSB;         // CM2RM_RRWDTH -1

// ILU
   parameter MPS_WDTH   = `FIRE_DLC_MPS;
   parameter MPSMSB     =  MPS_WDTH - 1;

// CTX
//   parameter CTXARRAY_WDTH      = 43,           // Context CTX entry width
   parameter CTXARRAY_WDTH      = 44,           // Context CTX entry width
			 CTXARRAYMSB        = CTXARRAY_WDTH -1,
             CTXADDRLSB         = 0,
			 CTXADDR_WDTH       = 5,
             CTXADDRMSB         = CTXADDRLSB + CTXADDR_WDTH -1;   
 
// PKSEQ   
   parameter PSEQARRAY_WDTH     = 5,            // Context PKSEQ entry width
			 PSEQARRAYMSB       = PSEQARRAY_WDTH -1,
             PSEQADDRLSB        = 0,
			 PSEQADDR_WDTH      = 5,
			 PSEQADDRMSB        = PSEQADDRLSB + PSEQADDR_WDTH -1;

// CLST
   parameter CLSTARRAY_WDTH     = 54,            // Context CLST entry width
			 CLSTARRAYMSB       = CLSTARRAY_WDTH -1,
             CLSTADDRLSB        = 0,
			 CLSTADDR_WDTH      = 4,
			 CLSTADDRMSB        = CLSTADDRLSB + CLSTADDR_WDTH -1;

   parameter RETADDRARRAY_WDTH  = 17,
			 RETADDRMSB         = RETADDRARRAY_WDTH -1;   

//************************************************
//				PORTS
//************************************************

   input clk;                                      // The input clock
   input rst_l;                                    // The fifo rst_l

// RCM
   input  mm2cm_rcd_enq;
   input  [SRMSB : 0] mm2cm_rcd;
   output cm2mm_rcd_full;

   output cm2pm_rcd_enq;
   output [IPRMSB : 0] cm2pm_rcd;
   input  pm2cm_rcd_full;

// TCM
   input  cl2cm_rcd_enq;
   input  [EPRMSB : 0]  cl2cm_rcd;
   output cm2cl_rcd_full;
		 
   output cm2rm_rcd_enq;
   output [RRMSB : 0]  cm2rm_rcd;
   input  rm2cm_rcd_full;

//ILU
   input [MPSMSB :0] y2k_mps;

// Debug Ports   
   input [`FIRE_DLC_CMU_DS_BITS] cr2cm_dbg_sel_a;   // CMU debug select a
   input [`FIRE_DLC_CMU_DS_BITS] cr2cm_dbg_sel_b;   // CMU debug select b

   output [`FIRE_DBG_DATA_BITS] cm2cr_dbg_a;   // CMU debug output a	
   output [`FIRE_DBG_DATA_BITS] cm2cr_dbg_b;   // CMU debug output b

//************************************************
//				SIGNALS
//************************************************
 
   wire clk;
   wire rst_l;

   wire [MPSMSB :0] y2k_mps;
   
// RCM
   wire mm2cm_rcd_enq;
   wire [SRMSB : 0]mm2cm_rcd;
   wire cm2mm_rcd_full;
   wire cm2pm_rcd_enq; 
   wire [IPRMSB : 0]cm2pm_rcd;
   wire pm2cm_rcd_full;
   
// TCM
   wire cl2cm_rcd_enq;
   wire [EPRMSB : 0]cl2cm_rcd;
   wire cm2cl_rcd_full;
   wire cm2rm_rcd_enq; 
   wire [RRMSB : 0]cm2rm_rcd;
   wire rm2cm_rcd_full;

//RCM - CTX
   wire rcm2ctx_ctx_req;   
   wire ctx2rcm_ctx_gnt; 
   wire [CTXADDRMSB :0] ctx2rcm_nxctx_addr;
   wire [CTXADDRMSB :0] rcm2ctx_ctx_addr;
   wire rcm2ctx_ctx_rw;
   wire [CTXARRAYMSB : 0] ctx2rcm_cur_ctx;
   wire [CTXARRAYMSB : 0] rcm2ctx_ctx;
   wire rcm2ctx_seq_req;
   wire ctx2rcm_seq_gnt;
   wire [PSEQADDRMSB :0] ctx2rcm_nxseq_addr;
   wire [PSEQADDRMSB :0] rcm2ctx_pkseq_addr;
   wire rcm2ctx_pkseq_rw;
   wire [PSEQARRAYMSB : 0] rcm2ctx_pkseq;
   
//TCM - CTX   
   wire [CTXADDRMSB :0] tcm2ctx_ctx_addr;
   wire tcm2ctx_ctx_rw;
   wire [CTXARRAYMSB : 0] ctx2tcm_cur_ctx;
   wire [CTXARRAYMSB : 0] tcm2ctx_ctx;
   wire [PSEQADDRMSB :0] tcm2ctx_pkseq_addr;
   wire tcm2ctx_pkseq_rw;
   wire [PSEQARRAYMSB : 0] ctx2tcm_cur_pkseq;
   wire [PSEQARRAYMSB : 0] tcm2ctx_pkseq;
   wire tcm2ctx_lst_req;
   wire ctx2tcm_lst_gnt;
   wire [CLSTADDRMSB :0] ctx2tcm_nxlst_addr;   
   wire [CLSTADDRMSB :0] tcm2ctx_ctxlst_addr;
   wire tcm2ctx_clst_rw;
   wire [CLSTARRAYMSB : 0] tcm2ctx_lst;
   wire [CLSTARRAYMSB : 0] ctx2tcm_cur_lst;
   wire tcm2ctx_ret_req;
   wire [RETADDRMSB :0] tcm2ctx_ret_addr;
   
// Debug
   wire [`FIRE_DLC_CMU_DS_BITS] cr2cm_dbg_sel_a;	   // CMU debug select a
   wire [`FIRE_DLC_CMU_DS_BITS] cr2cm_dbg_sel_b;	   // CMU debug select b
   wire [`FIRE_DBG_DATA_BITS] cm2cr_dbg_a;     // CMU debug output a	
   wire [`FIRE_DBG_DATA_BITS] cm2cr_dbg_b;     // CMU debug output b

// RCM debug   
   wire [`FIRE_DLC_CMU_RCM_DS_BITS] dbg2rcm_dbg_sel_a;
   wire [`FIRE_DLC_CMU_RCM_DS_BITS] dbg2rcm_dbg_sel_b;
   wire [`FIRE_DBG_DATA_BITS] 		rcm2dbg_dbg_a;
   wire [`FIRE_DBG_DATA_BITS] 		rcm2dbg_dbg_b;

// TCM debug
   wire [`FIRE_DLC_CMU_TCM_DS_BITS] dbg2tcm_dbg_sel_a;
   wire [`FIRE_DLC_CMU_TCM_DS_BITS] dbg2tcm_dbg_sel_b;
   wire [`FIRE_DBG_DATA_BITS] 		tcm2dbg_dbg_a;
   wire [`FIRE_DBG_DATA_BITS] 		tcm2dbg_dbg_b;
   
// CTX debug
   wire [`FIRE_DLC_CMU_CTX_DS_BITS] dbg2ctx_dbg_sel_a;
   wire [`FIRE_DLC_CMU_CTX_DS_BITS] dbg2ctx_dbg_sel_b;
   wire [`FIRE_DBG_DATA_BITS] 		ctx2dbg_dbg_a;
   wire [`FIRE_DBG_DATA_BITS] 		ctx2dbg_dbg_b;
   
   
//************************************************
//				MODULES
//************************************************

dmu_cmu_rcm rcm (
		.clk (clk), 	
		.rst_l (rst_l),

//      // Debug
		.dbg2rcm_dbg_sel_a (dbg2rcm_dbg_sel_a),	
		.dbg2rcm_dbg_sel_b (dbg2rcm_dbg_sel_b),	
		.rcm2dbg_dbg_a (rcm2dbg_dbg_a), 
		.rcm2dbg_dbg_b (rcm2dbg_dbg_b), 

      // MMU
        .mm2cm_rcd_enq (mm2cm_rcd_enq),
        .mm2cm_rcd (mm2cm_rcd),
		.cm2mm_rcd_full (cm2mm_rcd_full),

      // PMU
        .cm2pm_rcd_enq (cm2pm_rcd_enq),
		.cm2pm_rcd (cm2pm_rcd),
		.pm2cm_rcd_full (pm2cm_rcd_full),

      // CTX
		.rcm2ctx_ctx_req(rcm2ctx_ctx_req),
		.ctx2rcm_ctx_gnt (ctx2rcm_ctx_gnt),
		.ctx2rcm_nxctx_addr (ctx2rcm_nxctx_addr),
		.rcm2ctx_ctx_addr (rcm2ctx_ctx_addr),
		.rcm2ctx_ctx_rw (rcm2ctx_ctx_rw),
		.ctx2rcm_cur_ctx (ctx2rcm_cur_ctx),
		.rcm2ctx_ctx (rcm2ctx_ctx),
		.rcm2ctx_seq_req (rcm2ctx_seq_req),
		.ctx2rcm_seq_gnt (ctx2rcm_seq_gnt),
		.ctx2rcm_nxseq_addr (ctx2rcm_nxseq_addr),
		.rcm2ctx_pkseq_addr (rcm2ctx_pkseq_addr),
		.rcm2ctx_pkseq_rw (rcm2ctx_pkseq_rw),
		.rcm2ctx_pkseq (rcm2ctx_pkseq),

      // ILU  
        .y2k_mps (y2k_mps)
		);

dmu_cmu_tcm tcm (
		.clk (clk), 	
		.rst_l (rst_l),

      // Debug
		.dbg2tcm_dbg_sel_a (dbg2tcm_dbg_sel_a),
		.dbg2tcm_dbg_sel_b (dbg2tcm_dbg_sel_b),
		.tcm2dbg_dbg_a (tcm2dbg_dbg_a),
		.tcm2dbg_dbg_b (tcm2dbg_dbg_b),
					  
      // CLU
        .cl2cm_rcd_enq (cl2cm_rcd_enq),
        .cl2cm_rcd (cl2cm_rcd),
		.cm2cl_rcd_full (cm2cl_rcd_full),

      // RMU
        .cm2rm_rcd_enq (cm2rm_rcd_enq),
		.cm2rm_rcd (cm2rm_rcd),
		.rm2cm_rcd_full (rm2cm_rcd_full),

      // CTX
		.tcm2ctx_ctx_addr (tcm2ctx_ctx_addr),
		.tcm2ctx_ctx_rw (tcm2ctx_ctx_rw),
		.ctx2tcm_cur_ctx (ctx2tcm_cur_ctx),
		.tcm2ctx_ctx (tcm2ctx_ctx),
		.tcm2ctx_pkseq_addr (tcm2ctx_pkseq_addr),
		.tcm2ctx_pkseq_rw (tcm2ctx_pkseq_rw),
		.ctx2tcm_cur_pkseq (ctx2tcm_cur_pkseq),
		.tcm2ctx_pkseq (tcm2ctx_pkseq),
		.tcm2ctx_lst_req (tcm2ctx_lst_req),
		.ctx2tcm_lst_gnt (ctx2tcm_lst_gnt),
		.ctx2tcm_nxlst_addr (ctx2tcm_nxlst_addr),
		.tcm2ctx_ctxlst_addr (tcm2ctx_ctxlst_addr),
		.tcm2ctx_clst_rw (tcm2ctx_clst_rw),
		.tcm2ctx_lst (tcm2ctx_lst),
		.ctx2tcm_cur_lst (ctx2tcm_cur_lst),	
		.tcm2ctx_ret_req (tcm2ctx_ret_req),
		.tcm2ctx_ret_addr (tcm2ctx_ret_addr)
		);
   
dmu_cmu_ctx ctx (
		.clk (clk), 	
		.rst_l (rst_l),

      // Debug
		.dbg2ctx_dbg_sel_a (dbg2ctx_dbg_sel_a),	
		.dbg2ctx_dbg_sel_b (dbg2ctx_dbg_sel_b),	
		.ctx2dbg_dbg_a (ctx2dbg_dbg_a), 
		.ctx2dbg_dbg_b (ctx2dbg_dbg_b),

      // RCM
		.rcm2ctx_ctx_req(rcm2ctx_ctx_req),
		.ctx2rcm_ctx_gnt (ctx2rcm_ctx_gnt),
		.ctx2rcm_nxctx_addr (ctx2rcm_nxctx_addr),
		.rcm2ctx_ctx_addr (rcm2ctx_ctx_addr),
		.rcm2ctx_ctx_rw (rcm2ctx_ctx_rw),
		.ctx2rcm_cur_ctx (ctx2rcm_cur_ctx),
		.rcm2ctx_ctx (rcm2ctx_ctx),
		.rcm2ctx_seq_req (rcm2ctx_seq_req),
		.ctx2rcm_seq_gnt (ctx2rcm_seq_gnt),
		.ctx2rcm_nxseq_addr (ctx2rcm_nxseq_addr),
		.rcm2ctx_pkseq_addr (rcm2ctx_pkseq_addr),
		.rcm2ctx_pkseq_rw (rcm2ctx_pkseq_rw),
		.rcm2ctx_pkseq (rcm2ctx_pkseq),

      // TCM
		.tcm2ctx_ctx_addr (tcm2ctx_ctx_addr),
		.tcm2ctx_ctx_rw (tcm2ctx_ctx_rw),
		.ctx2tcm_cur_ctx (ctx2tcm_cur_ctx),
		.tcm2ctx_ctx (tcm2ctx_ctx),
		.tcm2ctx_pkseq_addr (tcm2ctx_pkseq_addr),
		.tcm2ctx_pkseq_rw (tcm2ctx_pkseq_rw),
		.ctx2tcm_cur_pkseq (ctx2tcm_cur_pkseq),
		.tcm2ctx_pkseq (tcm2ctx_pkseq),
		.tcm2ctx_lst_req (tcm2ctx_lst_req),
		.ctx2tcm_lst_gnt (ctx2tcm_lst_gnt),
		.ctx2tcm_nxlst_addr (ctx2tcm_nxlst_addr),
		.tcm2ctx_ctxlst_addr (tcm2ctx_ctxlst_addr),
		.tcm2ctx_clst_rw (tcm2ctx_clst_rw),
		.tcm2ctx_lst (tcm2ctx_lst),
		.ctx2tcm_cur_lst (ctx2tcm_cur_lst),	
		.tcm2ctx_ret_req (tcm2ctx_ret_req),
		.tcm2ctx_ret_addr (tcm2ctx_ret_addr)
		);

dmu_cmu_dbg dbg(
		.clk (clk), 	
		.rst_l (rst_l),

      // CMU 					 
		.cr2cm_dbg_sel_a (cr2cm_dbg_sel_a),	    // CMU debug select a
		.cr2cm_dbg_sel_b (cr2cm_dbg_sel_b),	    // CMU debug select b
		.cm2cr_dbg_a (cm2cr_dbg_a),     // CMU debug output a
		.cm2cr_dbg_b (cm2cr_dbg_b),     // CMU debug output b

      // RCM
		.dbg2rcm_dbg_sel_a (dbg2rcm_dbg_sel_a),	// RCM debug select a
		.dbg2rcm_dbg_sel_b (dbg2rcm_dbg_sel_b),	// RCM debug select b
		.rcm2dbg_dbg_a (rcm2dbg_dbg_a), // RCM debug output a
		.rcm2dbg_dbg_b (rcm2dbg_dbg_b), // RCM debug output b

      // TCM
		.dbg2tcm_dbg_sel_a (dbg2tcm_dbg_sel_a),	// TCM debug select a
		.dbg2tcm_dbg_sel_b (dbg2tcm_dbg_sel_b),	// TCM debug select b
		.tcm2dbg_dbg_a (tcm2dbg_dbg_a), // TCM debug output a
		.tcm2dbg_dbg_b (tcm2dbg_dbg_b), // TCM debug output b

	  // CTX
		.dbg2ctx_dbg_sel_a (dbg2ctx_dbg_sel_a),	// CTX debug select a
		.dbg2ctx_dbg_sel_b (dbg2ctx_dbg_sel_b),	// CTX debug select b
		.ctx2dbg_dbg_a (ctx2dbg_dbg_a), // CTX debug output a
		.ctx2dbg_dbg_b (ctx2dbg_dbg_b)  // CTX debug output b
        );
   
endmodule 


