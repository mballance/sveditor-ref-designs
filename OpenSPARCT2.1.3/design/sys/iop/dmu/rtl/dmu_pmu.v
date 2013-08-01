// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: dmu_pmu.v
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
module dmu_pmu (
		clk, 	
		rst_l,

        // Debug Ports
        cr2pm_dbg_sel_a,		// PMU debug select a
        pm2cr_dbg_a,      // PMU debug output a	
        cr2pm_dbg_sel_b,		// PMU debug select b
        pm2cr_dbg_b,      // PMU debug output b
					 
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
   
//   parameter CM2PM_WDTH    = `FIRE_DLC_IPR_REC_WDTH,    //92
//             PM2CL_WDTH    = `FIRE_DLC_ICR_REC_WDTH,    //59

   parameter PM2PS_RCDWDTH   = 41,
             PSCMDTYPE_WDTH  = 4,
             PSITRN_WDTH     = 5,
//BP n2 5-24-04
//			 PSRDWDTH        = 6,
			 PSRDWDTH        = 7,
			 PSCMDTRN_WDTH   = 5;

   parameter IPRMSB          = `FIRE_DLC_IPR_MSB,         // CM2PM_WDTH -1,
             ICRMSB          = `FIRE_DLC_ICR_MSB,         // PM2CL_WDTH -1,
             PSRCDMSB        = PM2PS_RCDWDTH -1,
             PSCMDTYPMSB     = PSCMDTYPE_WDTH -1,
			 PSITRNMSB       = PSITRN_WDTH -1,
			 PSRDMSB         = PSRDWDTH  -1,
             PSCMDTRNMSB     = PSCMDTRN_WDTH -1;   
   
   
//************************************************
//				PORTS
//************************************************

   input clk;                                      // The input clock
   input rst_l;                                    // The fifo rst_l

   input cm2pm_rcd_enq;                            // enqueue to packet record queue
   input [IPRMSB :0] cm2pm_rcd;                     // packet record in
   output pm2cm_rcd_full;                          // packet record full flag

   output pm2cl_rcd_enq;                           // enqueue to output command record
   output [ICRMSB :0] pm2cl_rcd;                    // command record out
   input cl2pm_rcd_full;                           // CLU record fifo full
   
   output [PSITRNMSB :0] pm2ps_i_trn;
   
   output pm2ps_i_req;                             // PSB request
   input  ps2pm_i_gnt;                             // PSB grant to request
   input [PSCMDTRNMSB : 0] ps2pm_i_n_trn;          // returned transaction number
   output [PSCMDTYPMSB : 0] pm2ps_i_cmd_type;      // command for PSB to run
   input  ps2pm_i_full;                            // PSB is full
   output [PSRCDMSB :0] pm2ps_i_wr_data;           // data put on PSB

   input [PSRDMSB :0] 	ps2pm_i_rd_data;   

// Debug Ports   
   input [`FIRE_DLC_PMU_DS_BITS] cr2pm_dbg_sel_a;  // PMU debug select a
   input [`FIRE_DLC_PMU_DS_BITS] cr2pm_dbg_sel_b;  // PMU debug select b

   output [`FIRE_DBG_DATA_BITS] pm2cr_dbg_a;       // PMU debug output a	
   output [`FIRE_DBG_DATA_BITS] pm2cr_dbg_b;       // PMU debug output b   

//************************************************
//				SIGNALS
//************************************************
 
   wire clk;
   wire rst_l;
   wire pm2cm_rcd_full;
   wire cl2pm_rcd_full;
   wire cm2pm_rcd_enq;
   wire pm2cl_rcd_enq;

   wire pm2ps_i_req;
   wire ps2pm_i_gnt;
   wire [PSITRNMSB :0] pm2ps_i_trn;
   wire [PSCMDTRNMSB : 0] ps2pm_i_n_trn;
   wire [PSCMDTYPMSB : 0] pm2ps_i_cmd_type;
   wire ps2pm_i_full;
   wire [PSRCDMSB : 0] pm2ps_i_wr_data;
   wire [PSRDMSB :0]   ps2pm_i_rd_data;
   
// Debug
   wire [`FIRE_DLC_PMU_DS_BITS] cr2pm_dbg_sel_a;   // PMU debug select a
   wire [`FIRE_DLC_PMU_DS_BITS] cr2pm_dbg_sel_b;   // PMU debug select b
   wire [`FIRE_DBG_DATA_BITS] pm2cr_dbg_a;         // PMU debug output a	
   wire [`FIRE_DBG_DATA_BITS] pm2cr_dbg_b;         // PMU debug output b
    
//************************************************
//				MODULES
//************************************************

dmu_pmu_prm prm (
		.clk (clk), 	
		.rst_l (rst_l),

//      // Debug
		.cr2pm_dbg_sel_a (cr2pm_dbg_sel_a),	
		.cr2pm_dbg_sel_b (cr2pm_dbg_sel_b),	
		.pm2cr_dbg_a (pm2cr_dbg_a), 
		.pm2cr_dbg_b (pm2cr_dbg_b), 

        .cm2pm_rcd_enq (cm2pm_rcd_enq),
		.cm2pm_rcd(cm2pm_rcd),
		.pm2cm_rcd_full (pm2cm_rcd_full),
        .pm2cl_rcd_enq (pm2cl_rcd_enq),
        .pm2cl_rcd (pm2cl_rcd),
        .cl2pm_rcd_full (cl2pm_rcd_full),
        .pm2ps_i_req(pm2ps_i_req),
        .ps2pm_i_gnt(ps2pm_i_gnt),
	    .pm2ps_i_trn(pm2ps_i_trn),
        .ps2pm_i_n_trn(ps2pm_i_n_trn),
        .pm2ps_i_cmd_type(pm2ps_i_cmd_type),
		.ps2pm_i_full(ps2pm_i_full),
		.pm2ps_i_wr_data(pm2ps_i_wr_data),
		.ps2pm_i_rd_data(ps2pm_i_rd_data)
		);

endmodule 


