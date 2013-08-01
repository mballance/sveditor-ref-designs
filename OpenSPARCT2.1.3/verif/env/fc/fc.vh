// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: fc.vh
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
`ifdef     INC_FC_DEFINE

`else

`define     INC_FC_DEFINE

// common defines
`include "defines.vh"

`define BAD_END bad_end

`define    CORE_0

`define TOP_MOD tb_top
`define TOP     tb_top
`define CPU     `TOP.cpu

`define PROBES0       `TOP.intf0
`define PROBES1       `TOP.intf1
`define PROBES2       `TOP.intf2
`define PROBES3       `TOP.intf3
`define PROBES4       `TOP.intf4
`define PROBES5       `TOP.intf5
`define PROBES6       `TOP.intf6
`define PROBES7       `TOP.intf7

`define SPC0          `CPU.spc0
`define SPC1          `CPU.spc1
`define SPC2          `CPU.spc2
`define SPC3          `CPU.spc3
`define SPC4          `CPU.spc4
`define SPC5          `CPU.spc5
`define SPC6          `CPU.spc6
`define SPC7          `CPU.spc7
`define CCX           `CPU.ccx

`define MCU0    `CPU.mcu0
`define MCU1    `CPU.mcu1
`define MCU2    `CPU.mcu2
`define MCU3    `CPU.mcu3

`define DMU     `CPU.dmu
`define ILU     `DMU.ilu
`define PEU     `CPU.peu

`define NIU     `CPU.niu

`define NCU     `CPU.ncu    // Non-cacheable unit
`define SII     `CPU.sii    // sii unit
`define SIO     `CPU.sio    // sio unit

`define TCU     `CPU.tcu    // Test control unit
`define CCU     `CPU.ccu    // Clock control unit
`define RST     `CPU.rst    // Reset logic unit
`define EFU     `CPU.efu    // Electronic fuse unit

`define DBG0    `CPU.dbg0
`define DBG1    `CPU.dbg1

// PCI Express DMA Endpoint model for Axis simulation.
`define DMAEPT `TOP.ept

//----------------------------------------------------------

//dram
`define DRAMPATH0  `TOP.mcusat_dram.mem0
`define DRAMPATH1  `TOP.mcusat_dram.mem1
`define DRAMPATH2  `TOP.mcusat_dram.mem2
`define DRAMPATH3  `TOP.mcusat_dram.mem3

`define DRIF_PATH0 `CPU.mcu0.drif
`define DRIF_PATH1 `CPU.mcu1.drif
`define DRIF_PATH2 `CPU.mcu2.drif
`define DRIF_PATH3 `CPU.mcu3.drif

`define TOP_MEMORY `CPU	
`define TOP_DESIGN `CPU

//dram
`define FBD_CH_PATH0  `TOP.mcusat_fbdimm.fbdimm_mem0
`define FBD_CH_PATH1  `TOP.mcusat_fbdimm.fbdimm_mem1
`define FBD_CH_PATH2  `TOP.mcusat_fbdimm.fbdimm_mem2
`define FBD_CH_PATH3  `TOP.mcusat_fbdimm.fbdimm_mem3
`define FBD_CH_PATH4  `TOP.mcusat_fbdimm.fbdimm_mem4
`define FBD_CH_PATH5  `TOP.mcusat_fbdimm.fbdimm_mem5
`define FBD_CH_PATH6  `TOP.mcusat_fbdimm.fbdimm_mem6
`define FBD_CH_PATH7  `TOP.mcusat_fbdimm.fbdimm_mem7

`define DIMMPATH0  fbdimm0.fbdimm_DIMMx4
`define DIMMPATH1  fbdimm1.fbdimm_DIMMx4
`define DIMMPATH2  fbdimm2.fbdimm_DIMMx4
`define DIMMPATH3  fbdimm3.fbdimm_DIMMx4
`define DIMMPATH4  fbdimm4.fbdimm_DIMMx4
`define DIMMPATH5  fbdimm5.fbdimm_DIMMx4
`define DIMMPATH6  fbdimm6.fbdimm_DIMMx4
`define DIMMPATH7  fbdimm7.fbdimm_DIMMx4

`ifdef RANK_DIMM
`else
`define RANK_DIMMPATH0                  fbdimm0.fbdimm_DIMMx4_rank2
`define RANK_DIMMPATH1                  fbdimm1.fbdimm_DIMMx4_rank2
`define RANK_DIMMPATH2                  fbdimm2.fbdimm_DIMMx4_rank2
`define RANK_DIMMPATH3                  fbdimm3.fbdimm_DIMMx4_rank2
`define RANK_DIMMPATH4                  fbdimm4.fbdimm_DIMMx4_rank2
`define RANK_DIMMPATH5                  fbdimm5.fbdimm_DIMMx4_rank2
`define RANK_DIMMPATH6                  fbdimm6.fbdimm_DIMMx4_rank2
`define RANK_DIMMPATH7                  fbdimm7.fbdimm_DIMMx4_rank2
`endif

`define MONTCU  `TOP.tcu_mon    // Verilog DUT monitors
`define MONCCU  `TOP.ccu_mon    // Verilog DUT monitors
`define MONRST  `TOP.rst_mon    // Verilog DUT monitors


`define TCK_HALF_PERIOD    25_000    // ps., 20Mhz  == 50000ps
`define SYS_HALF_PERIOD     2_500    // ps., 200Mhz == 5000ps

`define IO_ASI_ADDR 8'h90


`define NCU_C2ISC       `CPU.ncu.ncu_scd_ctl.ncu_c2iscd_ctl.ncu_c2isc_ctl
`define NCU_I2CSD       `CPU.ncu.ncu_scd_ctl.ncu_i2cscd_ctl.ncu_i2csd_ctl
`define NCU_I2CSC       `CPU.ncu.ncu_scd_ctl.ncu_i2cscd_ctl.ncu_i2csc_ctl
`define NCU_C2IFC       `CPU.ncu.ncu_fcd_ctl.ncu_c2ifcd_ctl.ncu_c2ifc_ctl
`define NCU_I2CFC       `CPU.ncu.ncu_fcd_ctl.ncu_i2cfcd_ctl.ncu_i2cfc_ctl

`ifdef NCU_GATE
`define FUSE_STAT_63 `NCU.ncu_scd_ctl__n40067
`define FUSE_STAT_62 `NCU.ncu_scd_ctl__n40066
`define FUSE_STAT_61 `NCU.ncu_scd_ctl__n40068
`define FUSE_STAT_60 `NCU.ncu_scd_ctl__n40069
`define FUSE_STAT_59 `NCU.ncu_scd_ctl__n40070
`define FUSE_STAT_58 `NCU.ncu_scd_ctl__n40072
`define FUSE_STAT_57 `NCU.ncu_scd_ctl__n40073
`define FUSE_STAT_56 `NCU.ncu_scd_ctl__n40074
`define FUSE_STAT_55 `NCU.ncu_scd_ctl__n40075
`define FUSE_STAT_54 `NCU.ncu_scd_ctl__n40076
`define FUSE_STAT_53 `NCU.ncu_scd_ctl__n40077
`define FUSE_STAT_52 `NCU.ncu_scd_ctl__n40078
`define FUSE_STAT_51 `NCU.ncu_scd_ctl__n40079
`define FUSE_STAT_50 `NCU.ncu_scd_ctl__n40080
`define FUSE_STAT_49 `NCU.ncu_scd_ctl__n40081
`define FUSE_STAT_48 `NCU.ncu_scd_ctl__n40083
`define FUSE_STAT_47 `NCU.ncu_scd_ctl__n40084
`define FUSE_STAT_46 `NCU.ncu_scd_ctl__n40085
`define FUSE_STAT_45 `NCU.ncu_scd_ctl__n40086
`define FUSE_STAT_44 `NCU.ncu_scd_ctl__n40087
`define FUSE_STAT_43 `NCU.ncu_scd_ctl__n40088
`define FUSE_STAT_42 `NCU.ncu_scd_ctl__n40089
`define FUSE_STAT_41 `NCU.ncu_scd_ctl__n40090
`define FUSE_STAT_40 `NCU.ncu_scd_ctl__n40091
`define FUSE_STAT_39 `NCU.ncu_scd_ctl__n40092
`define FUSE_STAT_38 `NCU.ncu_scd_ctl__n40094
`define FUSE_STAT_37 `NCU.ncu_scd_ctl__n40095
`define FUSE_STAT_36 `NCU.ncu_scd_ctl__n40096
`define FUSE_STAT_35 `NCU.ncu_scd_ctl__n40097
`define FUSE_STAT_34 `NCU.ncu_scd_ctl__n40098
`define FUSE_STAT_33 `NCU.ncu_scd_ctl__n40099
`define FUSE_STAT_32 `NCU.ncu_scd_ctl__n40100
`define FUSE_STAT_31 `NCU.ncu_scd_ctl__n40101
`define FUSE_STAT_30 `NCU.ncu_scd_ctl__n40102
`define FUSE_STAT_29 `NCU.ncu_scd_ctl__n40103
`define FUSE_STAT_28 `NCU.ncu_scd_ctl__n40105
`define FUSE_STAT_27 `NCU.ncu_scd_ctl__n40106
`define FUSE_STAT_26 `NCU.ncu_scd_ctl__n40107
`define FUSE_STAT_25 `NCU.ncu_scd_ctl__n40108
`define FUSE_STAT_24 `NCU.ncu_scd_ctl__n40109
`define FUSE_STAT_23 `NCU.ncu_scd_ctl__n40110
`define FUSE_STAT_22 `NCU.ncu_scd_ctl__n40111
`define FUSE_STAT_21 `NCU.ncu_scd_ctl__n40112
`define FUSE_STAT_20 `NCU.ncu_scd_ctl__n40113
`define FUSE_STAT_19 `NCU.ncu_scd_ctl__n40114
`define FUSE_STAT_18 `NCU.ncu_scd_ctl__n40116
`define FUSE_STAT_17 `NCU.ncu_scd_ctl__n40117
`define FUSE_STAT_16 `NCU.ncu_scd_ctl__n40118
`define FUSE_STAT_15 `NCU.ncu_scd_ctl__n40119
`define FUSE_STAT_14 `NCU.ncu_scd_ctl__n40120
`define FUSE_STAT_13 `NCU.ncu_scd_ctl__n40121
`define FUSE_STAT_12 `NCU.ncu_scd_ctl__n40122
`define FUSE_STAT_11 `NCU.ncu_scd_ctl__n40123
`define FUSE_STAT_10 `NCU.ncu_scd_ctl__n40124
`define FUSE_STAT_9  `NCU.ncu_scd_ctl__n40062
`define FUSE_STAT_8  `NCU.ncu_scd_ctl__n40061
`define FUSE_STAT_7  `NCU.ncu_scd_ctl__n40063
`define FUSE_STAT_6  `NCU.ncu_scd_ctl__n40064
`define FUSE_STAT_5  `NCU.ncu_scd_ctl__n40065
`define FUSE_STAT_4  `NCU.ncu_scd_ctl__n40071
`define FUSE_STAT_3  `NCU.ncu_scd_ctl__n40082
`define FUSE_STAT_2  `NCU.ncu_scd_ctl__n40093
`define FUSE_STAT_1  `NCU.ncu_scd_ctl__n40104
`define FUSE_STAT_0  `NCU.ncu_scd_ctl__n40115
`endif // NCU_GATE

`ifdef EFU_GATE
`define SHFT_DATA_0 `EFU.u_efa_stdc__tck_shft_data_ff_0_
`define SHFT_DATA_1 `EFU.u_efa_stdc__tck_shft_data_ff_1_
`define SHFT_DATA_2 `EFU.u_efa_stdc__tck_shft_data_ff_2_
`define SHFT_DATA_3 `EFU.u_efa_stdc__tck_shft_data_ff_3_
`define SHFT_DATA_4 `EFU.u_efa_stdc__tck_shft_data_ff_4_
`define SHFT_DATA_5 `EFU.u_efa_stdc__tck_shft_data_ff_5_
`define SHFT_DATA_6 `EFU.u_efa_stdc__tck_shft_data_ff_6_
`define SHFT_DATA_7 `EFU.u_efa_stdc__tck_shft_data_ff_7_
`define SHFT_DATA_8 `EFU.u_efa_stdc__tck_shft_data_ff_8_
`define SHFT_DATA_9 `EFU.u_efa_stdc__tck_shft_data_ff_9_
`define SHFT_DATA_10 `EFU.u_efa_stdc__tck_shft_data_ff_10_
`define SHFT_DATA_11 `EFU.u_efa_stdc__tck_shft_data_ff_11_
`define SHFT_DATA_12 `EFU.u_efa_stdc__tck_shft_data_ff_12_
`define SHFT_DATA_13 `EFU.u_efa_stdc__tck_shft_data_ff_13_
`define SHFT_DATA_14 `EFU.u_efa_stdc__tck_shft_data_ff_14_
`define SHFT_DATA_15 `EFU.u_efa_stdc__tck_shft_data_ff_15_
`define SHFT_DATA_16 `EFU.u_efa_stdc__tck_shft_data_ff_16_
`define SHFT_DATA_17 `EFU.u_efa_stdc__tck_shft_data_ff_17_
`define SHFT_DATA_18 `EFU.u_efa_stdc__tck_shft_data_ff_18_
`define SHFT_DATA_19 `EFU.u_efa_stdc__tck_shft_data_ff_19_
`define SHFT_DATA_20 `EFU.u_efa_stdc__tck_shft_data_ff_20_
`define SHFT_DATA_21 `EFU.u_efa_stdc__tck_shft_data_ff_21_
`define SHFT_DATA_22 `EFU.u_efa_stdc__tck_shft_data_ff_22_
`define SHFT_DATA_23 `EFU.u_efa_stdc__tck_shft_data_ff_23_
`define SHFT_DATA_24 `EFU.u_efa_stdc__tck_shft_data_ff_24_
`define SHFT_DATA_25 `EFU.u_efa_stdc__tck_shft_data_ff_25_
`define SHFT_DATA_26 `EFU.u_efa_stdc__tck_shft_data_ff_26_
`define SHFT_DATA_27 `EFU.u_efa_stdc__tck_shft_data_ff_27_
`define SHFT_DATA_28 `EFU.u_efa_stdc__tck_shft_data_ff_28_
`define SHFT_DATA_29 `EFU.u_efa_stdc__tck_shft_data_ff_29_
`define SHFT_DATA_30 `EFU.u_efa_stdc__tck_shft_data_ff_30_
`endif // EFU_GATE
//
//---------------------------
//


//----------------------------------------------------------
// END OF FILE
//----------------------------------------------------------
//
`endif // !`ifdef INC_FC_DEFINE
