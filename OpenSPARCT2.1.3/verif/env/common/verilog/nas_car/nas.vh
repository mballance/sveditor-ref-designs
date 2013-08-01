// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: nas.vh
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
`ifdef     INC_NAS_DEFINE

`else

`define     INC_NAS_DEFINE

//----------------------------------------------------------
// Paths and variables
`define    NASTOP       `TOP.nas_top
`define    EXP_QUEUE    `NASTOP.exp_queue
`define    ACT_QUEUE    `NASTOP.act_queue
`define    EXP_STATUS   `NASTOP.exp_status
`define    ACT_STATUS   `NASTOP.act_status

`define    FRF0_EVEN     `SPC0.fgu.frf.frf_array_e.data_array
`define    FRF0_ODD      `SPC0.fgu.frf.frf_array_o.data_array
`define    IRF0_EXU0     `SPC0.exu0.irf.irf_array.active_window
`define    IRF0_EXU1     `SPC0.exu1.irf.irf_array.active_window

`define    FRF1_EVEN     `SPC1.fgu.frf.frf_array_e.data_array
`define    FRF1_ODD      `SPC1.fgu.frf.frf_array_o.data_array
`define    IRF1_EXU0     `SPC1.exu0.irf.irf_array.active_window
`define    IRF1_EXU1     `SPC1.exu1.irf.irf_array.active_window

`define    FRF2_EVEN     `SPC2.fgu.frf.frf_array_e.data_array
`define    FRF2_ODD      `SPC2.fgu.frf.frf_array_o.data_array
`define    IRF2_EXU0     `SPC2.exu0.irf.irf_array.active_window
`define    IRF2_EXU1     `SPC2.exu1.irf.irf_array.active_window

`define    FRF3_EVEN     `SPC3.fgu.frf.frf_array_e.data_array
`define    FRF3_ODD      `SPC3.fgu.frf.frf_array_o.data_array
`define    IRF3_EXU0     `SPC3.exu0.irf.irf_array.active_window
`define    IRF3_EXU1     `SPC3.exu1.irf.irf_array.active_window

`define    FRF4_EVEN     `SPC4.fgu.frf.frf_array_e.data_array
`define    FRF4_ODD      `SPC4.fgu.frf.frf_array_o.data_array
`define    IRF4_EXU0     `SPC4.exu0.irf.irf_array.active_window
`define    IRF4_EXU1     `SPC4.exu1.irf.irf_array.active_window

`define    FRF5_EVEN     `SPC5.fgu.frf.frf_array_e.data_array
`define    FRF5_ODD      `SPC5.fgu.frf.frf_array_o.data_array
`define    IRF5_EXU0     `SPC5.exu0.irf.irf_array.active_window
`define    IRF5_EXU1     `SPC5.exu1.irf.irf_array.active_window

`define    FRF6_EVEN     `SPC6.fgu.frf.frf_array_e.data_array
`define    FRF6_ODD      `SPC6.fgu.frf.frf_array_o.data_array
`define    IRF6_EXU0     `SPC6.exu0.irf.irf_array.active_window
`define    IRF6_EXU1     `SPC6.exu1.irf.irf_array.active_window

`define    FRF7_EVEN     `SPC7.fgu.frf.frf_array_e.data_array
`define    FRF7_ODD      `SPC7.fgu.frf.frf_array_o.data_array
`define    IRF7_EXU0     `SPC7.exu0.irf.irf_array.active_window
`define    IRF7_EXU1     `SPC7.exu1.irf.irf_array.active_window


//----------------------------------------------------------
`define    EXU_INDEX    0
`define    FP_INDEX     1
`define    LSU_INDEX    2
`define    IMUL_INDEX   3
`define    IDIV_INDEX   4
`define    FDIV_INDEX   5
`define    TLU_INDEX    6
`define    ASI_INDEX    7

`define    MAX_FP_REG      4
`define    FEVN_INDEX      0
`define    FODD_INDEX      1
`define    MSK_EVN_INDEX   2
`define    MSK_ODD_INDEX   3
`define    FNUM_INDEX      4

//----------------------------------------------------------
`define    INIT_Q       0
`define    PUSH_Q       1
`define    POP_Q        2
`define    STATUS_Q     3
`define    PR_INSTR_Q   4
`define    FLUSH_TH_Q   5


// Number of registers in delta_Q
`define     NEXT_INDEX         0
`define     TIME_INDEX         1
`define     PC_INDEX           2
`define     GL_INDEX           3
`define     CWP_INDEX          4
`define     OPCODE_INDEX       5
`define     FIRST_INDEX        6
`define     MAX_INDEX          `FIRST_INDEX+32

`define     G_TYPE      0
`define     W_TYPE      1
`define     F_TYPE      2
`define     C_TYPE      3

`define     CWP_DECR    0
`define     CWP_INCR    1

`define     FP_OFFSET   32
`define     CTL_OFFSET  100

// Number of bits in delta reg arrays
//   2 bits for type
//   3 bits for window
//   8 bits for regnum
//  64 bits for value
`define     DELTA_WIDTH       (2+3+8+64)-1

//----------------------------------------------------------
// Note: register indexes must be the same as simics

// here's the order of regs in prev_reg
//  [0:7]     - G   [0-7]
//  [8-23]    - W,  [8-23]
//  [24-31]   - W-1 [8-15]
//  [32-95]   - F   [0-63]
//  [132-224] - C   [32-124]
`define     MAX_ID                     224  // for prev_reg index

`define     PC                         32
`define     NPC                        33
`define     Y                          34
`define     CCR                        35
`define     FPRS                       36
`define     FSR                        37
`define     ASI                        38
`define     TICK                       39
`define     GSR                        40
`define     TICK_CMPR                  41
`define     STICK                      42
`define     STICK_CMPR                 43
`define     PSTATE                     44
`define     TL                         45
`define     PIL                        46

`define     TPC1                       47
`define     TPC2                       48
`define     TPC3                       49
`define     TPC4                       50
`define     TPC5                       51 
`define     TPC6                       52

`define     TNPC1                      57  
`define     TNPC2                      58
`define     TNPC3                      59
`define     TNPC4                      60
`define     TNPC5                      61
`define     TNPC6                      62

`define     TSTATE1                    67
`define     TSTATE2                    68
`define     TSTATE3                    69
`define     TSTATE4                    70
`define     TSTATE5                    71
`define     TSTATE6                    72

`define     TT1                        77
`define     TT2                        78
`define     TT3                        79
`define     TT4                        80
`define     TT5                        81
`define     TT6                        82
`define     TBA                        87
`define     VER                        88
`define     CWP                        89
`define     CANSAVE                    90
`define     CANRESTORE                 91
`define     OTHERWIN                   92
`define     WSTATE                     93
`define     CLEANWIN                   94
`define     SOFTINT                    95
`define     ECACHE_ERROR_ENABLE        96
`define     ASYNCHRONOUS_FAULT_STATUS  97
`define     ASYNCHRONOUS_FAULT_ADDRESS 98
`define     OUT_INTR_DATA0             99
`define     OUT_INTR_DATA1             100
`define     OUT_INTR_DATA2             101
`define     INTR_DISPATCH_STATUS       102
`define     IN_INTR_DATA0              103
`define     IN_INTR_DATA1              104
`define     IN_INTR_DATA2              105
`define     INTR_RECEIVE               106
`define     GL                         107
`define     HPSTATE                    108
`define     HTSTATE1                   109
`define     HTSTATE2                   110
`define     HTSTATE3                   111
`define     HTSTATE4                   112
`define     HTSTATE5                   113
`define     HTSTATE6                   114
`define     HTSTATE7                   115
`define     HTSTATE8                   116
`define     HTSTATE9                   117
`define     HTSTATE10                  118
`define     HTBA                       119
`define     HINTP                      120
`define     HSTICK_CMPR                121
`define     MID                        122
`define     ISFSR                      123
`define     DSFSR                      124
`define     DSFAR                      125
`define     CTXT_PRIM_0                126   // 21/8
`define     CTXT_SEC_0                 127   // 21/10
`define     CTXT_PRIM_1                128   // 21/108
`define     CTXT_SEC_1                 129   // 21/110
`define     LSU_CONTROL                130   // 45/0
`define     I_TAG_ACC                  131   // 50/30
`define     CTXT_Z_TSB_CFG0            132   // 54/10
`define     CTXT_Z_TSB_CFG1            133   // 54/18
`define     CTXT_Z_TSB_CFG2            134   // 54/20
`define     CTXT_Z_TSB_CFG3            135   // 54/28
`define     CTXT_NZ_TSB_CFG0           136   // 54/30
`define     CTXT_NZ_TSB_CFG1           137   // 54/38
`define     CTXT_NZ_TSB_CFG2           138   // 54/40
`define     CTXT_NZ_TSB_CFG3           139   // 54/48
`define     I_DATA_IN                  140   // 54
`define     D_TAG_ACC                  141   // 58/30
`define     WATCHPOINT_ADDR            142   // 58/38
`define     D_DATA_IN                  143   // 5c

// Can't create control register at 155 because it will collide
// with OPCODE at 255 since we add 100 to all control register IDs
`define     NAS_PIPE_RESERVED            155

`define     OPCODE                     255
`define     END_INSTR                  999
//----------------------------------------------------------

`endif
//----------------------------------------------------------
// END OF FILE
//----------------------------------------------------------
