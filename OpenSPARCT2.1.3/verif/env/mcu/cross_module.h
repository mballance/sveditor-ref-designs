/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: cross_module.h
* Copyright (C) 1995-2007 Sun Microsystems, Inc. All Rights Reserved
* 4150 Network Circle, Santa Clara, California 95054, U.S.A.
*
* DO NOT ALTER OR REMOVE COPYRIGHT NOTICES OR THIS FILE HEADER. 
*
* This program is free software; you can redistribute it and/or modify
* it under the terms of the GNU General Public License as published by
* the Free Software Foundation; version 2 of the License.
*
* This program is distributed in the hope that it will be useful,
* but WITHOUT ANY WARRANTY; without even the implied warranty of
* MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
* GNU General Public License for more details.
*
* You should have received a copy of the GNU General Public License
* along with this program; if not, write to the Free Software
* Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
*
* For the avoidance of doubt, and except that if any non-GPL license 
* choice is available it will apply instead, Sun elects to use only 
* the General Public License version 2 (GPLv2) at this time for any 
* software where a choice of GPL license versions is made 
* available with the language indicating that GPLv2 or any later version 
* may be used, or where a choice of which version of the GPL is applied is 
* otherwise unspecified. 
*
* Please contact Sun Microsystems, Inc., 4150 Network Circle, Santa Clara, 
* CA 95054 USA or visit www.sun.com if you need additional information or 
* have any questions. 
*
* 
* ========== Copyright Header End ============================================
*/
`define TOP_MOD      		tb_top
`define TOP_SHELL    		tb_top_shell
`define	CPU			`TOP_MOD.cpu
`define MCU0  			`CPU.mcu0
`define MCU1  			`CPU.mcu1
`define MCU2  			`CPU.mcu2
`define MCU3  			`CPU.mcu3
`define CCU  			`CPU.ccu

`define MCU0_DRIF_CTL  		`MCU0.drif
`define MCU0_UCB_CTL  		`MCU0.ucb
`define MCU0_RDATA_CTL  	`MCU0.rdata
`define MCU0_RDPCTL_CTL 	`MCU0.rdpctl
`define MCU0_ADDRDP_DP  	`MCU0.addrdp
`define MCU0_READDP_DP  	`MCU0.readdp
`define MCU0_WRDP_DP  		`MCU0.wrdp
`define MCU0_L2IF0_CTL		`MCU0.l2if0
`define MCU0_DRQ0_CTL		`MCU0_DRIF_CTL.reqq.drq0
`define MCU0_L2B0_ADR_Q 	`MCU0_ADDRDP_DP.l2b0_adr_queue
`define MCU0_L2B0_ADRGEN_DP 	`MCU0_ADDRDP_DP.l2b0_adrgen_dp
`define MCU0_L2IF1_CTL		`MCU0.l2if1
`define MCU0_DRQ1_CTL		`MCU0_DRIF_CTL.reqq.drq1
`define MCU0_L2B1_ADR_Q 	`MCU0_ADDRDP_DP.l2b1_adr_queue
`define MCU0_L2B1_ADRGEN_DP 	`MCU0_ADDRDP_DP.l2b1_adrgen_dp
`define MCU0_L2RDMX_DP	 	`MCU0.l2rdmx

`define MCU1_DRIF_CTL  		`MCU1.drif
`define MCU1_UCB_CTL  		`MCU1.ucb
`define MCU1_RDATA_CTL  	`MCU1.rdata
`define MCU1_RDPCTL_CTL 	`MCU1.rdpctl
`define MCU1_ADDRDP_DP  	`MCU1.addrdp
`define MCU1_READDP_DP  	`MCU1.readdp
`define MCU1_WRDP_DP  		`MCU1.wrdp
`define MCU1_L2IF0_CTL		`MCU1.l2if0
`define MCU1_DRQ0_CTL		`MCU1_DRIF_CTL.reqq.drq0
`define MCU1_L2B0_ADR_Q 	`MCU1_ADDRDP_DP.l2b0_adr_queue
`define MCU1_L2B0_ADRGEN_DP 	`MCU1_ADDRDP_DP.l2b0_adrgen_dp
`define MCU1_L2IF1_CTL		`MCU1.l2if1
`define MCU1_DRQ1_CTL		`MCU1_DRIF_CTL.reqq.drq1
`define MCU1_L2B1_ADR_Q 	`MCU1_ADDRDP_DP.l2b1_adr_queue
`define MCU1_L2B1_ADRGEN_DP 	`MCU1_ADDRDP_DP.l2b1_adrgen_dp
`define MCU1_L2RDMX_DP	 	`MCU1.l2rdmx

`define MCU2_DRIF_CTL  		`MCU2.drif
`define MCU2_UCB_CTL  		`MCU2.ucb
`define MCU2_RDATA_CTL  	`MCU2.rdata
`define MCU2_RDPCTL_CTL 	`MCU2.rdpctl
`define MCU2_ADDRDP_DP  	`MCU2.addrdp
`define MCU2_READDP_DP  	`MCU2.readdp
`define MCU2_WRDP_DP  		`MCU2.wrdp
`define MCU2_L2IF0_CTL		`MCU2.l2if0
`define MCU2_DRQ0_CTL		`MCU2_DRIF_CTL.reqq.drq0
`define MCU2_L2B0_ADR_Q 	`MCU2_ADDRDP_DP.l2b0_adr_queue
`define MCU2_L2B0_ADRGEN_DP 	`MCU2_ADDRDP_DP.l2b0_adrgen_dp
`define MCU2_L2IF1_CTL		`MCU2.l2if1
`define MCU2_DRQ1_CTL		`MCU2_DRIF_CTL.reqq.drq1
`define MCU2_L2B1_ADR_Q 	`MCU2_ADDRDP_DP.l2b1_adr_queue
`define MCU2_L2B1_ADRGEN_DP 	`MCU2_ADDRDP_DP.l2b1_adrgen_dp
`define MCU2_L2RDMX_DP	 	`MCU2.l2rdmx

`define MCU3_DRIF_CTL  		`MCU3.drif
`define MCU3_UCB_CTL  		`MCU3.ucb
`define MCU3_RDATA_CTL  	`MCU3.rdata
`define MCU3_RDPCTL_CTL 	`MCU3.rdpctl
`define MCU3_ADDRDP_DP  	`MCU3.addrdp
`define MCU3_READDP_DP  	`MCU3.readdp
`define MCU3_WRDP_DP  		`MCU3.wrdp
`define MCU3_L2IF0_CTL		`MCU3.l2if0
`define MCU3_DRQ0_CTL		`MCU3_DRIF_CTL.reqq.drq0
`define MCU3_L2B0_ADR_Q 	`MCU3_ADDRDP_DP.l2b0_adr_queue
`define MCU3_L2B0_ADRGEN_DP 	`MCU3_ADDRDP_DP.l2b0_adrgen_dp
`define MCU3_L2IF1_CTL		`MCU3.l2if1
`define MCU3_DRQ1_CTL		`MCU3_DRIF_CTL.reqq.drq1
`define MCU3_L2B1_ADR_Q 	`MCU3_ADDRDP_DP.l2b1_adr_queue
`define MCU3_L2B1_ADRGEN_DP 	`MCU3_ADDRDP_DP.l2b1_adrgen_dp
`define MCU3_L2RDMX_DP	 	`MCU3.l2rdmx

`define FBD_CH_PATH0  		`TOP_MOD.mcusat_fbdimm.fbdimm_mem0
`define FBD_CH_PATH1  		`TOP_MOD.mcusat_fbdimm.fbdimm_mem1
`define FBD_CH_PATH2  		`TOP_MOD.mcusat_fbdimm.fbdimm_mem2
`define FBD_CH_PATH3  		`TOP_MOD.mcusat_fbdimm.fbdimm_mem3
`define FBD_CH_PATH4  		`TOP_MOD.mcusat_fbdimm.fbdimm_mem4
`define FBD_CH_PATH5  		`TOP_MOD.mcusat_fbdimm.fbdimm_mem5
`define FBD_CH_PATH6  		`TOP_MOD.mcusat_fbdimm.fbdimm_mem6
`define FBD_CH_PATH7  		`TOP_MOD.mcusat_fbdimm.fbdimm_mem7

`ifdef X8
  `define DIMMPATH0  		fbdimm0.fbdimm_DIMMx8
  `define DIMMPATH1  		fbdimm1.fbdimm_DIMMx8
  `define DIMMPATH2  		fbdimm2.fbdimm_DIMMx8
  `define DIMMPATH3  		fbdimm3.fbdimm_DIMMx8
  `define DIMMPATH4  		fbdimm4.fbdimm_DIMMx8
  `define DIMMPATH5  		fbdimm5.fbdimm_DIMMx8
  `define DIMMPATH6  		fbdimm6.fbdimm_DIMMx8
  `define DIMMPATH7  		fbdimm7.fbdimm_DIMMx8
`else
  `define DIMMPATH0  		fbdimm0.fbdimm_DIMMx4
  `define DIMMPATH1  		fbdimm1.fbdimm_DIMMx4
  `define DIMMPATH2  		fbdimm2.fbdimm_DIMMx4
  `define DIMMPATH3  		fbdimm3.fbdimm_DIMMx4
  `define DIMMPATH4  		fbdimm4.fbdimm_DIMMx4
  `define DIMMPATH5  		fbdimm5.fbdimm_DIMMx4
  `define DIMMPATH6  		fbdimm6.fbdimm_DIMMx4
  `define DIMMPATH7  		fbdimm7.fbdimm_DIMMx4
`endif

`define ERR_INJ_DIMM0      fbdimm0.amb_dram_err_inj
`define ERR_INJ_DIMM1      fbdimm1.amb_dram_err_inj
`define ERR_INJ_DIMM2      fbdimm2.amb_dram_err_inj
`define ERR_INJ_DIMM3      fbdimm3.amb_dram_err_inj
`define ERR_INJ_DIMM4      fbdimm4.amb_dram_err_inj
`define ERR_INJ_DIMM5      fbdimm5.amb_dram_err_inj
`define ERR_INJ_DIMM6      fbdimm6.amb_dram_err_inj
`define ERR_INJ_DIMM7      fbdimm7.amb_dram_err_inj

`ifdef RANK_DIMM
`else
  `ifdef X8
    `define RANK_DIMMPATH0  		fbdimm0.fbdimm_DIMMx8_rank2
    `define RANK_DIMMPATH1  		fbdimm1.fbdimm_DIMMx8_rank2
    `define RANK_DIMMPATH2  		fbdimm2.fbdimm_DIMMx8_rank2
    `define RANK_DIMMPATH3  		fbdimm3.fbdimm_DIMMx8_rank2
    `define RANK_DIMMPATH4  		fbdimm4.fbdimm_DIMMx8_rank2
    `define RANK_DIMMPATH5  		fbdimm5.fbdimm_DIMMx8_rank2
    `define RANK_DIMMPATH6  		fbdimm6.fbdimm_DIMMx8_rank2
    `define RANK_DIMMPATH7  		fbdimm7.fbdimm_DIMMx8_rank2
  `else
    `define RANK_DIMMPATH0  		fbdimm0.fbdimm_DIMMx4_rank2
    `define RANK_DIMMPATH1  		fbdimm1.fbdimm_DIMMx4_rank2
    `define RANK_DIMMPATH2  		fbdimm2.fbdimm_DIMMx4_rank2
    `define RANK_DIMMPATH3  		fbdimm3.fbdimm_DIMMx4_rank2
    `define RANK_DIMMPATH4  		fbdimm4.fbdimm_DIMMx4_rank2
    `define RANK_DIMMPATH5  		fbdimm5.fbdimm_DIMMx4_rank2
    `define RANK_DIMMPATH6  		fbdimm6.fbdimm_DIMMx4_rank2
    `define RANK_DIMMPATH7  		fbdimm7.fbdimm_DIMMx4_rank2
  `endif
`endif

`ifdef MCU_GATE
`define DRIF_PATH0 		`MCU0
`define DRIF_PATH1 		`MCU1
`define DRIF_PATH2 		`MCU2
`define DRIF_PATH3 		`MCU3
`define FBDIC_PATH0 		`MCU0
`define FBDIC_PATH1 		`MCU1
`define FBDIC_PATH2 		`MCU2
`define FBDIC_PATH3 		`MCU3
`else
`define DRIF_PATH0 		`MCU0.drif
`define DRIF_PATH1 		`MCU1.drif
`define DRIF_PATH2 		`MCU2.drif
`define DRIF_PATH3 		`MCU3.drif
`define FBDIC_PATH0 		`MCU0.fbdic
`define FBDIC_PATH1 		`MCU1.fbdic
`define FBDIC_PATH2 		`MCU2.fbdic
`define FBDIC_PATH3 		`MCU3.fbdic
`endif


`define DRAM_L2IF0 		`MCU0.l2if0
`define DRAM_L2IF1 		`MCU0.l2if1
`define DRAM_L2IF2 		`MCU1.l2if0
`define DRAM_L2IF3 		`MCU1.l2if1
`define DRAM_L2IF4 		`MCU2.l2if0
`define DRAM_L2IF5 		`MCU2.l2if1
`define DRAM_L2IF6 		`MCU3.l2if0
`define DRAM_L2IF7 		`MCU3.l2if1

`define REGISTERED_DIMMS
`define MONITOR_SIGNAL 		129
`define REG_WRITE_BACK		126

`define PLI_QUIT                1    /* None */
`define PLI_SSTEP               2    /* %1 th id */
`define PLI_READ_TH_REG         3    /* %1 th id, %2 win num, %3 reg num */
`define PLI_READ_TH_CTL_REG     4    /* %1 th id, %2 reg num */
`define PLI_READ_TH_FP_REG_I    5    /* %1 th id, %2 reg num */
`define PLI_READ_TH_FP_REG_X    6    /* %1 th id, %2 reg num */
`define PLI_RTL_DATA            7
`define PLI_RTL_CYCLE           8  
`define PLI_WRITE_TH_XCC_REG    9
`define PLI_RETRY               15
`define PLI_WRITE_TH_REG_HI     10
`define PLI_WRITE_TH_CTL_REG    12    /* %1 th id, %2 reg num, %3-%10 value */
`define CMD_BUFSIZE 		10240

`define MONITOR_PATH 		`TOP_MOD.monitor
`define MONITOR      		`TOP_MOD.monitor
`define PC_CMP       		`TOP_MOD.monitor.pc_cmp
`define SAS_SEND     		`TOP_MOD.sas_tasks.send_cmd
`define SAS_DEF      		`TOP_MOD.sas_tasks.sas_def
`define SAS_TASKS    		`TOP_MOD.sas_tasks

`define SCPATH0      		`CPU.sctag0
`define SCPATH1      		`CPU.sctag1
`define SCPATH2      		`CPU.sctag2
`define SCPATH3      		`CPU.sctag3
`define SCPATH4      		`CPU.sctag4
`define SCPATH5      		`CPU.sctag5
`define SCPATH6      		`CPU.sctag6
`define SCPATH7      		`CPU.sctag7

`define SCDPATH0      		`CPU.scdata0
`define SCDPATH1      		`CPU.scdata1
`define SCDPATH2      		`CPU.scdata2
`define SCDPATH3      		`CPU.scdata3

`define DDR2_0IN_SIM_MON

`ifdef DDR2_533
  `define SYS_HALF_PERIOD	    3750    // ps., 133Mhz == 7500ps
`else 
  `define SYS_HALF_PERIOD	    3000    // ps., 166Mhz == 6000ps
`endif

`ifdef DTM_ENABLED
  `define SYS_HALF_PERIOD           4800    // ps., 104.57Mhz == 9600ps
`endif
