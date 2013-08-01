// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: defines.vh
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
`ifdef INC_COM_DEFINE

`else

`define INC_COM_DEFINE

`ifdef AXIS
`include "dispmonDefines.vh"
`endif

`define    SYSTEMCLOCK   tb_top.SystemClock

`define    TOP         tb_top
`define    CPU	       tb_top.cpu
`define    PARGS       tb_top.verif_args
`define    LDST_NCU    tb_top.ldst_sync.ldst_ncu
`define    LDST_L2     tb_top.ldst_sync.ldst_l2

`define    PC_MASK      64'h0000_00ff_ffff_ffff
`define    MASK_48      64'h0000_ffff_ffff_ffff
`define    BAD_PC       64'hffff_ffff_ffff_ffff


`ifdef AXIS
`define    TIMEOUT      500000
`else
`define    TIMEOUT      300
`endif

// Defines number of bits in scan_in & scan_out pins (spc.sv)
`define    SCAN_WIDTH   2

`define    TS_WIDTH     32

//----------------------------------------------------------
// Defines for NAS PLI commands

// basic PLI commands, 8'h00 - 8'h0f
`define     PLI_QUIT               8'h01
`define     PLI_SSTEP              8'h02
`define     PLI_READ_TH_REG        8'h03
`define     PLI_READ_TH_CTL_REG    8'h04
`define     PLI_READ_TH_FP_REG_I   8'h05
`define     PLI_READ_TH_FP_REG_X   8'h06
`define     PLI_RTL_DATA           8'h07
`define     PLI_RTL_CYCLE          8'h08
`define     PLI_WRITE_TH_XCC_REG   8'h09
`define     PLI_WRITE_TH_REG_HI    8'h0a
`define     PLI_WRITE_TH_REG       8'h0b
`define     PLI_WRITE_TH_CTL_REG   8'h0c
`define     PLI_WRITE_TH_FP_REG_I  8'h0d
`define     PLI_WRITE_TH_FP_REG_X  8'h0e
`define     PLI_FORCE_TRAP_TYPE    8'h0f

// TLB & HWTW commands, 8'h10 - 8'h1f
`define     PLI_RESET_TLB_ENTRY    8'h10
`define     PLI_IHWTW              8'h11
`define     PLI_DHWTW              8'h12
`define     PLI_ITLBREAD           8'h13
`define     PLI_DTLBREAD           8'h14
`define     PLI_ITLBWRITE          8'h15
`define     PLI_DTLBWRITE          8'h16
`define     PLI_TLBLOOKUP          8'h17
`define     PLI_DTLBREAD_POP       8'h18

// memory model commands, 8'h20 - 8'h3f
`define     PLI_MEM_ST_ISSUE       8'h20
`define     PLI_MEM_ST_L2_COMMIT   8'h21
`define     PLI_MEM_ST_INV         8'h22
`define     PLI_MEM_ST_UPDATE      8'h23
`define     PLI_MEM_ST_ACK         8'h24
`define     PLI_MEM_LD_ISSUE       8'h25
`define     PLI_MEM_LD_DATA        8'h26
`define     PLI_MEM_LD_FILL        8'h27
`define     PLI_MEM_EVICT          8'h28
`define     PLI_MEM_EVICT_INV      8'h29
`define     PLI_MEM_SLAM           8'h30
`define     PLI_MEM_LD_POP         8'h31
`define     PLI_MEM_ST_POP         8'h32
`define     PLI_MEM_CHECK          8'h33
`define     PLI_MEM_DMA_ST         8'h34

// INT Sync commands, 8'h40 - 8'h4f
`define     PLI_INT_INTP           8'h40
`define     PLI_ASR_WRITE          8'h41
`define     PLI_ASI_WRITE          8'h42
`define     PLI_ASI_READ           8'h43
`define     PLI_CMP_WRITE          8'h44
`define     PLI_ASR_READ           8'h45
`define	    PLI_CSR_WRITE          8'h46
`define     PLI_CSR_READ           8'h47

/* %1=pa(8),%2=value(8),%3=littleEndian(1),%4=size(1) */
`define     PLI_PIO_READ           8'h49
   
// memory model commands, 8'h70 - 8'h7f
`define     PLI_MEM_IFETCH             8'h70
`define     PLI_MEM_IFETCH_FILL        8'h71
`define     PLI_MEM_IFETCH_POP_TOP     8'h72
`define     PLI_MEM_IFETCH_POP_NEW     8'h73
`define     PLI_MEM_IFETCH_POP_ONE     8'h74

// constants used by memory model commands
// instr type
`define     ITYPE_NO            0
`define     ITYPE_LOAD          1
`define     ITYPE_BLOCK_LOAD    2
`define     ITYPE_DOUBLE_LOAD   3
`define     ITYPE_QUAD_LOAD     4
`define     ITYPE_PREFETCH      5 
`define     ITYPE_STORE         6
`define     ITYPE_BLOCK_STORE   7
`define     ITYPE_ATOMIC        8
`define     ITYPE_BLK_INIT_ST   9

// load data source
`define     DSRC_NO             0
`define     DSRC_STB            1
`define     DSRC_L1             2
`define     DSRC_L2_MEMORY      3

//----------------------------------------------------------
// POR Values for Control Registers
`define    POR_PC       48'hfffff0000020
`define    POR_GL       3'h3

//----------------------------------------------------------
// CMP Registers
`define    ASI_CMP_CORE                                 8'h41
`define    ASI_CMP_CORE_AVAIL                           18'h000
`define    ASI_CMP_CORE_ENABLED                         18'h010
`define    ASI_CMP_CORE_ENABLE_STATUS                   18'h010
`define    ASI_CMP_CORE_ENABLE                          18'h020
`define    ASI_CMP_XIR_STEERING                         18'h030
`define    ASI_CMP_ERROR_STEERING                       18'h040
`define    ASI_CMP_CORE_RUNNING_RW                      18'h050
`define    ASI_CMP_CORE_RUNNING_STATUS                  18'h058
`define    ASI_CMP_CORE_RUNNING_W1S                     18'h060
`define    ASI_CMP_CORE_RUNNING_W1C                     18'h068

// SIM_STATUS bit positions
`define    ASM_PASS     0   
`define    ASM_ERR      1

// Defines for TRAP address extraction
`define MAX_TRAP_ADDRS 64
`define TRAP_ADDR_WIDTH 40
`define TRAP_ADDR_CHARS `TRAP_ADDR_WIDTH/4


`endif
//----------------------------------------------------------
// END OF FILE
//----------------------------------------------------------
