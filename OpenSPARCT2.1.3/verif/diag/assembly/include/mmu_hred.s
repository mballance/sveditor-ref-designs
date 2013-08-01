/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: mmu_hred.s
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
#define MAX_TRAP_COUNT                  80
#define HV_RED_TEXT_PA                  0x10000
#define HV_RED_DATA_PA                  0x20000
#define HPTRAP_TEXT_PA                  0x80000
#define HPTRAPS_EXT_TEXT_PA             0x90000
#define HPTRAPS_EXT_DATA_PA             0x98000
#define P_GOOD_TRAP                     0x0
#define P_BAD_TRAP                      0x1
#define HP_GOOD_TRAP                    0xa0
#define HP_BAD_TRAP                     0xa1
#define EXIT_GOOD                       ta P_GOOD_TRAP; nop
#define EXIT_BAD                        ta P_BAD_TRAP; nop
#define REALRANGE_LO_MASK               0x0000000007ffffff
#define REALRANGE_HI_MASK               0x003ffffff8000000
#define RANOTPA_MASK                    0x100
#define SUN4V_MASK                      0x080
#define TTE_RA_MASK                     0x000000ffffffe000
#define RETURN_FROM_SUPERVISOR0		rdpr	%pstate, %i6 ; \
					wrpr	%g0, %gl ;  \
					jmp	%i7 ; \
					wrpr	%i6, 4, %pstate	; 
#define RETURN_FROM_SUPERVISOR1		wrpr	%i7, %tnpc ; \
					done ; 
// Scratchpad Registers
#define MMU_ASI_HYP_SCRATCHPAD_REG			0x4f

// Real Range Registers
#define MMU_ASI_REAL_RANGE_REG				0x52
#define MMU_ASI_REAL_RANGE_0_ADDR			0x108
#define MMU_ASI_REAL_RANGE_1_ADDR			0x110
#define MMU_ASI_REAL_RANGE_2_ADDR			0x118
#define MMU_ASI_REAL_RANGE_3_ADDR			0x120

// Physical Offset Registers
#define MMU_ASI_PHY_OFFSET_REG				0x52
#define MMU_ASI_PHY_OFFSET_0_ADDR			0x208
#define MMU_ASI_PHY_OFFSET_1_ADDR			0x210
#define MMU_ASI_PHY_OFFSET_2_ADDR			0x218
#define MMU_ASI_PHY_OFFSET_3_ADDR			0x220
	
// ITLB Tag and Data Registers
#define MMU_ASI_ITLB_PROBE_REG				0x53
#define	MMU_ASI_ITSB_TAG_TARGET_REG			0x50
#define	MMU_ASI_I_TAG_ACCESS_REG			0x50
#define	MMU_ASI_I_TAG_ACCESS_ADDR			0x30
#define	MMU_ASI_I_DATA_IN_REG				0x54
#define	MMU_ASI_I_DATA_ACCESS_REG			0x55
#define	MMU_ASI_I_TAG_READ_REG				0x56

// Demaps
#define MMU_ASI_I_DEMAP					0x57
#define MMU_ASI_D_DEMAP					0x5f
	
// DTLB Tag and Data Registers
#define	MMU_ASI_DTSB_TAG_TARGET_REG			0x58
#define	MMU_ASI_D_TAG_ACCESS_REG			0x58
#define	MMU_ASI_D_TAG_ACCESS_ADDR			0x30
#define	MMU_ASI_D_DATA_IN_REG				0x5c
#define	MMU_ASI_D_DATA_ACCESS_REG			0x5d
#define	MMU_ASI_D_TAG_READ_REG				0x5e
	
// TSB Configs
#define MMU_ASI_TSB_CONFIG_REG				0x54
#define MMU_ASI_Z_CTX_TSB_CONFIG_0_ADDR			0x10
#define MMU_ASI_Z_CTX_TSB_CONFIG_1_ADDR			0x18
#define MMU_ASI_Z_CTX_TSB_CONFIG_2_ADDR			0x20
#define MMU_ASI_Z_CTX_TSB_CONFIG_3_ADDR			0x28
#define MMU_ASI_NZ_CTX_TSB_CONFIG_0_ADDR		0x30
#define MMU_ASI_NZ_CTX_TSB_CONFIG_1_ADDR		0x38
#define MMU_ASI_NZ_CTX_TSB_CONFIG_2_ADDR		0x40
#define MMU_ASI_NZ_CTX_TSB_CONFIG_3_ADDR		0x48

// TSB Pointers
#define	MMU_ASI_TSB_PTR_REG				0x54
#define MMU_ASI_ITSB_PTR_0_ADDR				0x50
#define MMU_ASI_ITSB_PTR_1_ADDR				0x58
#define MMU_ASI_ITSB_PTR_2_ADDR				0x60
#define MMU_ASI_ITSB_PTR_3_ADDR				0x68
#define MMU_ASI_DTSB_PTR_0_ADDR				0x70
#define MMU_ASI_DTSB_PTR_1_ADDR				0x78
#define MMU_ASI_DTSB_PTR_2_ADDR				0x80
#define MMU_ASI_DTSB_PTR_3_ADDR				0x88
	
// Contexts
#define MMU_ASI_CONTEXT_REG						0x21
#define MMU_ASI_PRIMARY_CONTEXT_0_ADDR					0x8
#define MMU_ASI_PRIMARY_CONTEXT_1_ADDR					0x108
#define MMU_ASI_SECONDARY_CONTEXT_0_ADDR				0x10
#define MMU_ASI_SECONDARY_CONTEXT_1_ADDR				0x110

// ASI Load/Store
#define MMU_ASI_AS_IF_USER_PRIMARY					0x10	
#define MMU_ASI_AS_IF_USER_SECONDARY					0x11	
#define MMU_ASI_REAL_MEM						0x14	
#define MMU_ASI_REAL_IO							0x15	
#define MMU_ASI_BLOCK_AS_IF_USER_PRIMARY				0x16	
#define MMU_ASI_BLOCK_AS_IF_USER_SECONDARY				0x17	
#define MMU_ASI_AS_IF_USER_PRIMARY_LITTLE				0x18	
#define MMU_ASI_AS_IF_USER_SECONDARY_LITTLE				0x19	
#define MMU_ASI_REAL_MEM_LITTLE						0x1C	
#define MMU_ASI_REAL_IO_LITTLE						0x1D	
#define MMU_ASI_BLOCK_AS_IF_USER_PRIMARY_LITTLE				0x1E	
#define MMU_ASI_BLOCK_AS_IF_USER_SECONDARY_LITTLE			0x1F	
#define MMU_ASI_AS_IF_USER_BLK_INIT_ST_QUAD_LDD_PRIMARY			0x22	
#define MMU_ASI_AS_IF_USER_BLK_INIT_ST_QUAD_LDD_SECONDARY		0x23	
#define MMU_ASI_QUAD_LDD						0x24	
#define MMU_ASI_QUAD_LDD_REAL						0x26	
#define MMU_ASI_NUCLEUS_BLK_INIT_ST_QUAD_LDD				0x27	
#define MMU_ASI_AS_IF_USER_BLK_INIT_ST_QUAD_LDD_PRIMARY_LITTLE		0x2A	
#define MMU_ASI_AS_IF_USER_BLK_INIT_ST_QUAD_LDD_SECONDARY_LITTLE	0x2B	
#define MMU_ASI_QUAD_LDD_LITTLE						0x2C	
#define MMU_ASI_QUAD_LDD_REAL_LITTLE					0x2E	
#define MMU_ASI_NUCLEUS_BLK_INIT_ST_QUAD_LDD_LITTLE			0x2F	
#define MMU_ASI_SECONDARY           					0x81	
#define MMU_ASI_PRIMARY_NO_FAULT  					0x82	
#define MMU_ASI_SECONDARY_NO_FAULT  					0x83	
#define MMU_ASI_PRIMARY_LITTLE      					0x88	
#define MMU_ASI_SECONDARY_LITTLE      					0x89	
#define MMU_ASI_PRIMARY_NO_FAULT_LITTLE					0x8A	
#define MMU_ASI_SECONDARY_NO_FAULT_LITTLE				0x8B	
#define MMU_ASI_BLK_COMMIT_P                				0xE0	
#define MMU_ASI_BLK_COMMIT_S                				0xE1	
#define MMU_ASI_BLK_INIT_ST_QUAD_LDD_PRIMARY				0xE2	
#define MMU_ASI_BLK_INIT_ST_QUAD_LDD_SECONDARY				0xE3	
#define MMU_ASI_BLK_INIT_ST_QUAD_LDD_PRIMARY_LITTLE			0xEA	
#define MMU_ASI_BLK_INIT_ST_QUAD_LDD_SECONDARY_LITTLE			0xEB	
#define MMU_ASI_BLK_P							0xF0	
#define MMU_ASI_BLK_S							0xF1	
#define MMU_ASI_BLK_PL							0xF8	
#define MMU_ASI_BLK_SL							0xF9	

// User level hooks	
#define IDEMAP_ALL		ta PTRAP_I_DEMAP_ALL
#define IDEMAP_PCTX		ta PTRAP_I_DEMAP_PCTX
#define IDEMAP_NCTX		ta PTRAP_I_DEMAP_NCTX
#define IDEMAP_PAGE		ta PTRAP_I_DEMAP_PAGE
#define IDEMAP_RPAGE		ta PTRAP_I_DEMAP_RPAGE

#define DDEMAP_ALL		ta PTRAP_D_DEMAP_ALL
#define DDEMAP_PCTX		ta PTRAP_D_DEMAP_PCTX
#define DDEMAP_SCTX		ta PTRAP_D_DEMAP_SCTX
#define DDEMAP_NCTX		ta PTRAP_D_DEMAP_NCTX
#define DDEMAP_PAGE		ta PTRAP_D_DEMAP_PAGE
#define DDEMAP_RPAGE		ta PTRAP_D_DEMAP_RPAGE

#define DO_BRANCH		or %g1, %g0, %i7 ;  ta PTRAP_REDIRECT
#define CHANGE_PID  		ta PTRAP_CHANGE_PID   
#define INCR_TSB_SIZE		ta PTRAP_INCR_TSB_SIZE
#define REAL_MEM_LD		ta PTRAP_REAL_MEM_LD
#define REAL_MEM_LD_LITTLE	ta PTRAP_REAL_MEM_LD_LITTLE
#define REAL_MEM_QUAD_LD	ta PTRAP_REAL_MEM_QUAD_LD
#define REAL_MEM_QUAD_LD_LITTLE	ta PTRAP_REAL_MEM_QUAD_LD_LITTLE
#define CLEAR_LSU_IMMU		ta PTRAP_CLEAR_LSU_IMMU
#define CLEAR_LSU_DMMU		ta PTRAP_CLEAR_LSU_DMMU
#define DELAY_LOOP		ta PTRAP_DELAY_LOOP
#define SEM_LOCK                ta PTRAP_SEM_LOCK
#define SEM_RELEASE             ta PTRAP_SEM_RELEASE
#define SEM_GET                 ta PTRAP_SEM_GET 
#define SEM_SET                 ta PTRAP_SEM_SET 
#define GOTO_SUPERVISOR0	ta PTRAP_GOTO_SUPERVISOR0
#define GOTO_SUPERVISOR1	ta PTRAP_GOTO_SUPERVISOR1
#define IDEMAP_ALL_PAGES	ta PTRAP_I_DEMAP_ALL_PAGES
#define IDEMAP_ALL_RPAGES	ta PTRAP_I_DEMAP_ALL_RPAGES
#define DDEMAP_ALL_PAGES	ta PTRAP_D_DEMAP_ALL_PAGES
#define DDEMAP_ALL_RPAGES	ta PTRAP_D_DEMAP_ALL_RPAGES
#define ACCESS_ITSB_PTR		ta PTRAP_ACCESS_ITSB_PTR
#define ACCESS_DTSB_PTR		ta PTRAP_ACCESS_DTSB_PTR
#define TOGGLE_LSU_IM           ta PTRAP_TOGGLE_LSU_IM
#define TOGGLE_LSU_DM           ta PTRAP_TOGGLE_LSU_DM
#define LOAD_IDATA_IN		ta PTRAP_LOAD_IDATA_IN
#define LOAD_DDATA_IN		ta PTRAP_LOAD_DDATA_IN
#define READ_IDATA_ACCESS	ta PTRAP_READ_IDATA_ACCESS
#define READ_DDATA_ACCESS	ta PTRAP_READ_DDATA_ACCESS
#define USER_TRAP		ta PTRAP_USER_TRAP
#define LOAD_IDATA_ACCESS	ta PTRAP_LOAD_IDATA_ACCESS
#define LOAD_DDATA_ACCESS	ta PTRAP_LOAD_DDATA_ACCESS
#define	ITLB_PROBE		ta PTRAP_ITLB_PROBE
#define TOGGLE_HWTW_DEMAP	ta PTRAP_TOGGLE_HWTW_DEMAP
#define ITLB_TAG_READ		ta PTRAP_ITLB_TAG_READ
#define DTLB_TAG_READ		ta PTRAP_DTLB_TAG_READ
		
#define PTRAP_I_DEMAP_ALL       0x10
#define PTRAP_I_DEMAP_PCTX	0x11
#define PTRAP_I_DEMAP_NCTX	0x13
#define PTRAP_I_DEMAP_PAGE	0x14
#define PTRAP_I_DEMAP_RPAGE	0x15
#define PTRAP_D_DEMAP_ALL       0x17
#define PTRAP_D_DEMAP_PCTX	0x18
#define PTRAP_D_DEMAP_SCTX	0x19
#define PTRAP_D_DEMAP_NCTX	0x1a
#define PTRAP_D_DEMAP_PAGE	0x1b
#define PTRAP_D_DEMAP_RPAGE	0x1c
#define PTRAP_REDIRECT		0x20
#define PTRAP_CHANGE_PID	0x21
#define PTRAP_INCR_TSB_SIZE     0x22
#define PTRAP_REAL_MEM_LD	0x23
#define PTRAP_REAL_MEM_LD_LITTLE	0x24
#define PTRAP_REAL_MEM_QUAD_LD	0x25
#define PTRAP_REAL_MEM_QUAD_LD_LITTLE	0x26
#define PTRAP_CLEAR_LSU_IMMU	0x27
#define PTRAP_CLEAR_LSU_DMMU	0x28
#define PTRAP_DELAY_LOOP	0x29
#define PTRAP_SEM_LOCK		0x2a
#define PTRAP_SEM_RELEASE	0x2b
#define PTRAP_SEM_GET 		0x2c
#define PTRAP_SEM_SET 		0x2d
#define PTRAP_GOTO_SUPERVISOR0	0x2e
#define PTRAP_GOTO_SUPERVISOR1	0x2f
#define PTRAP_I_DEMAP_ALL_PAGES  0x30
#define PTRAP_I_DEMAP_ALL_RPAGES 0x31
#define PTRAP_D_DEMAP_ALL_PAGES  0x32
#define PTRAP_D_DEMAP_ALL_RPAGES 0x33
#define PTRAP_ACCESS_ITSB_PTR    0x34
#define PTRAP_ACCESS_DTSB_PTR    0x35
#define PTRAP_TOGGLE_LSU_IM	0x36
#define PTRAP_TOGGLE_LSU_DM	0x37
#define PTRAP_LOAD_IDATA_IN	0x38
#define PTRAP_LOAD_DDATA_IN	0x39
#define PTRAP_READ_IDATA_ACCESS	0x3a
#define PTRAP_READ_DDATA_ACCESS	0x3b
#define PTRAP_USER_TRAP		0x3c
#define PTRAP_LOAD_IDATA_ACCESS	0x3d
#define PTRAP_LOAD_DDATA_ACCESS	0x3e
#define PTRAP_ITLB_PROBE	0x3f
#define PTRAP_TOGGLE_HWTW_DEMAP 0x40
#define PTRAP_ITLB_TAG_READ	0x41
#define PTRAP_DTLB_TAG_READ	0x42

// Supervisor level hooks
#define P_IDEMAP_ALL		ta HPTRAP_I_DEMAP_ALL
#define P_IDEMAP_PCTX		ta HPTRAP_I_DEMAP_PCTX
#define P_IDEMAP_NCTX		ta HPTRAP_I_DEMAP_NCTX
#define P_IDEMAP_PAGE		ta HPTRAP_I_DEMAP_PAGE
#define P_IDEMAP_RPAGE		ta HPTRAP_I_DEMAP_RPAGE
						
#define P_DDEMAP_ALL		ta HPTRAP_D_DEMAP_ALL
#define P_DDEMAP_PCTX		ta HPTRAP_D_DEMAP_PCTX
#define P_DDEMAP_SCTX		ta HPTRAP_D_DEMAP_SCTX
#define P_DDEMAP_NCTX		ta HPTRAP_D_DEMAP_NCTX
#define P_DDEMAP_PAGE		ta HPTRAP_D_DEMAP_PAGE
#define P_DDEMAP_RPAGE		ta HPTRAP_D_DEMAP_RPAGE

#define P_IDEMAP_ALL_PAGES	ta HPTRAP_I_DEMAP_ALL_PAGES
#define P_IDEMAP_ALL_RPAGES	ta HPTRAP_I_DEMAP_ALL_RPAGES
#define P_DDEMAP_ALL_PAGES	ta HPTRAP_D_DEMAP_ALL_PAGES
#define P_DDEMAP_ALL_RPAGES	ta HPTRAP_D_DEMAP_ALL_RPAGES
#define P_ACCESS_ITSB_PTR	ta HPTRAP_ACCESS_ITSB_PTR
#define P_ACCESS_DTSB_PTR	ta HPTRAP_ACCESS_DTSB_PTR
#define P_TOGGLE_LSU_IM         ta HPTRAP_TOGGLE_LSU_IM
#define P_TOGGLE_LSU_DM         ta HPTRAP_TOGGLE_LSU_DM
#define P_LOAD_IDATA_IN		ta HPTRAP_LOAD_IDATA_IN
#define P_LOAD_DDATA_IN		ta HPTRAP_LOAD_DDATA_IN
#define P_READ_IDATA_ACCESS	ta HPTRAP_READ_IDATA_ACCESS
#define P_READ_DDATA_ACCESS	ta HPTRAP_READ_DDATA_ACCESS
#define P_LOAD_IDATA_ACCESS	ta HPTRAP_LOAD_IDATA_ACCESS
#define P_LOAD_DDATA_ACCESS	ta HPTRAP_LOAD_DDATA_ACCESS
#define	P_ITLB_PROBE		ta HPTRAP_ITLB_PROBE
#define P_TOGGLE_HWTW_DEMAP	ta HPTRAP_TOGGLE_HWTW_DEMAP
#define P_ITLB_TAG_READ		ta HPTRAP_ITLB_TAG_READ
#define P_DTLB_TAG_READ		ta HPTRAP_DTLB_TAG_READ

// Hypervisor trap types
#define HPTRAP_I_DEMAP_ALL      0x80
#define HPTRAP_I_DEMAP_PCTX	0x81
#define HPTRAP_I_DEMAP_NCTX	0x83
#define HPTRAP_I_DEMAP_PAGE	0x84
#define HPTRAP_I_DEMAP_RPAGE	0x85
#define HPTRAP_D_DEMAP_ALL      0x87
#define HPTRAP_D_DEMAP_PCTX	0x88
#define HPTRAP_D_DEMAP_SCTX	0x89
#define HPTRAP_D_DEMAP_NCTX	0x8a
#define HPTRAP_D_DEMAP_PAGE	0x8b
#define HPTRAP_D_DEMAP_RPAGE	0x8c
#define HPTRAP_CHANGE_PID   	0x91
#define HPTRAP_INCR_TSB_SIZE    0x92
#define HPTRAP_CLEAR_LSU_IMMU	0x93
#define HPTRAP_CLEAR_LSU_DMMU	0x94
#define HPTRAP_DELAY_LOOP	0x95
#define HPTRAP_SEM_LOCK		0x96
#define HPTRAP_SEM_RELEASE	0x97
#define HPTRAP_SEM_GET 		0x98
#define HPTRAP_SEM_SET 		0x99
#define HPTRAP_GOTO_SUPERVISOR0	0x9a
#define HPTRAP_GOTO_SUPERVISOR1	0x9b
#define HPTRAP_I_DEMAP_ALL_PAGES  0x9c
#define HPTRAP_I_DEMAP_ALL_RPAGES 0x9d
#define HPTRAP_D_DEMAP_ALL_PAGES  0x9e
#define HPTRAP_D_DEMAP_ALL_RPAGES 0x9f
#define HPTRAP_ACCESS_ITSB_PTR    0xa2   /* a0=good_trap, a1=bad_trap */
#define HPTRAP_ACCESS_DTSB_PTR    0xa3
#define HPTRAP_TOGGLE_LSU_IM      0xa4
#define HPTRAP_TOGGLE_LSU_DM      0xa5
#define HPTRAP_LOAD_IDATA_IN		0xa6
#define HPTRAP_LOAD_DDATA_IN		0xa7
#define HPTRAP_READ_IDATA_ACCESS	0xa8
#define HPTRAP_READ_DDATA_ACCESS	0xa9
#define HPTRAP_USER_TRAP		0xaa
#define HPTRAP_LOAD_IDATA_ACCESS	0xab
#define HPTRAP_LOAD_DDATA_ACCESS	0xac
#define HPTRAP_ITLB_PROBE		0xad
#define HPTRAP_TOGGLE_HWTW_DEMAP	0xae
#define HPTRAP_ITLB_TAG_READ		0xaf
#define HPTRAP_DTLB_TAG_READ		0xb0
#define HPTRAP_PRIV_OPCODE		0xb1
				
#define MAX_OCCURENCE_CNT       10
#define NUM_IMPL_TRAPS          6	/* number of implemented traps */
#define TRAP_0x9_OFFSET         0
#define TRAP_0xB_OFFSET         4
#define TRAP_0x1B_OFFSET        8
#define TRAP_0x2E_OFFSET        0xc
#define TRAP_0x31_OFFSET        0x10
#define TRAP_0x6C_OFFSET        0x14

MIDAS_TSB       thr0_z_ctx_tsb_0        THR0_Z_CTX_TSB_CONFIG_0   ttefmt=sun4v
MIDAS_TSB       thr0_z_ctx_tsb_1        THR0_Z_CTX_TSB_CONFIG_1   ttefmt=sun4v
MIDAS_TSB       thr0_z_ctx_tsb_2        THR0_Z_CTX_TSB_CONFIG_2   ttefmt=sun4v 
MIDAS_TSB       thr0_z_ctx_tsb_3        THR0_Z_CTX_TSB_CONFIG_3   ttefmt=sun4v
MIDAS_TSB       thr0_nz_ctx_tsb_0       THR0_NZ_CTX_TSB_CONFIG_0  ttefmt=sun4v
MIDAS_TSB       thr0_nz_ctx_tsb_1       THR0_NZ_CTX_TSB_CONFIG_1  ttefmt=sun4v 
MIDAS_TSB       thr0_nz_ctx_tsb_2       THR0_NZ_CTX_TSB_CONFIG_2  ttefmt=sun4v
MIDAS_TSB       thr0_nz_ctx_tsb_3       THR0_NZ_CTX_TSB_CONFIG_3  ttefmt=sun4v

MIDAS_TSB       thr1_z_ctx_tsb_0        THR1_Z_CTX_TSB_CONFIG_0   ttefmt=sun4v
MIDAS_TSB       thr1_z_ctx_tsb_1        THR1_Z_CTX_TSB_CONFIG_1   ttefmt=sun4v
MIDAS_TSB       thr1_z_ctx_tsb_2        THR1_Z_CTX_TSB_CONFIG_2   ttefmt=sun4v
MIDAS_TSB       thr1_z_ctx_tsb_3        THR1_Z_CTX_TSB_CONFIG_3   ttefmt=sun4v
MIDAS_TSB       thr1_nz_ctx_tsb_0       THR1_NZ_CTX_TSB_CONFIG_0  ttefmt=sun4v
MIDAS_TSB       thr1_nz_ctx_tsb_1       THR1_NZ_CTX_TSB_CONFIG_1  ttefmt=sun4v
MIDAS_TSB       thr1_nz_ctx_tsb_2       THR1_NZ_CTX_TSB_CONFIG_2  ttefmt=sun4v
MIDAS_TSB       thr1_nz_ctx_tsb_3       THR1_NZ_CTX_TSB_CONFIG_3  ttefmt=sun4v

MIDAS_TSB       thr2_z_ctx_tsb_0        THR2_Z_CTX_TSB_CONFIG_0   ttefmt=sun4v
MIDAS_TSB       thr2_z_ctx_tsb_1        THR2_Z_CTX_TSB_CONFIG_1   ttefmt=sun4v
MIDAS_TSB       thr2_z_ctx_tsb_2        THR2_Z_CTX_TSB_CONFIG_2   ttefmt=sun4v
MIDAS_TSB       thr2_z_ctx_tsb_3        THR2_Z_CTX_TSB_CONFIG_3   ttefmt=sun4v
MIDAS_TSB       thr2_nz_ctx_tsb_0       THR2_NZ_CTX_TSB_CONFIG_0  ttefmt=sun4v
MIDAS_TSB       thr2_nz_ctx_tsb_1       THR2_NZ_CTX_TSB_CONFIG_1  ttefmt=sun4v
MIDAS_TSB       thr2_nz_ctx_tsb_2       THR2_NZ_CTX_TSB_CONFIG_2  ttefmt=sun4v
MIDAS_TSB       thr2_nz_ctx_tsb_3       THR2_NZ_CTX_TSB_CONFIG_3  ttefmt=sun4v

MIDAS_TSB       thr3_z_ctx_tsb_0        THR3_Z_CTX_TSB_CONFIG_0   ttefmt=sun4v
MIDAS_TSB       thr3_z_ctx_tsb_1        THR3_Z_CTX_TSB_CONFIG_1   ttefmt=sun4v
MIDAS_TSB       thr3_z_ctx_tsb_2        THR3_Z_CTX_TSB_CONFIG_2   ttefmt=sun4v
MIDAS_TSB       thr3_z_ctx_tsb_3        THR3_Z_CTX_TSB_CONFIG_3   ttefmt=sun4v
MIDAS_TSB       thr3_nz_ctx_tsb_0       THR3_NZ_CTX_TSB_CONFIG_0  ttefmt=sun4v
MIDAS_TSB       thr3_nz_ctx_tsb_1       THR3_NZ_CTX_TSB_CONFIG_1  ttefmt=sun4v
MIDAS_TSB       thr3_nz_ctx_tsb_2       THR3_NZ_CTX_TSB_CONFIG_2  ttefmt=sun4v
MIDAS_TSB       thr3_nz_ctx_tsb_3       THR3_NZ_CTX_TSB_CONFIG_3  ttefmt=sun4v

MIDAS_TSB       thr4_z_ctx_tsb_0        THR4_Z_CTX_TSB_CONFIG_0   ttefmt=sun4v
MIDAS_TSB       thr4_z_ctx_tsb_1        THR4_Z_CTX_TSB_CONFIG_1   ttefmt=sun4v
MIDAS_TSB       thr4_z_ctx_tsb_2        THR4_Z_CTX_TSB_CONFIG_2   ttefmt=sun4v
MIDAS_TSB       thr4_z_ctx_tsb_3        THR4_Z_CTX_TSB_CONFIG_3   ttefmt=sun4v
MIDAS_TSB       thr4_nz_ctx_tsb_0       THR4_NZ_CTX_TSB_CONFIG_0  ttefmt=sun4v
MIDAS_TSB       thr4_nz_ctx_tsb_1       THR4_NZ_CTX_TSB_CONFIG_1  ttefmt=sun4v
MIDAS_TSB       thr4_nz_ctx_tsb_2       THR4_NZ_CTX_TSB_CONFIG_2  ttefmt=sun4v
MIDAS_TSB       thr4_nz_ctx_tsb_3       THR4_NZ_CTX_TSB_CONFIG_3  ttefmt=sun4v

MIDAS_TSB       thr5_z_ctx_tsb_0        THR5_Z_CTX_TSB_CONFIG_0   ttefmt=sun4v
MIDAS_TSB       thr5_z_ctx_tsb_1        THR5_Z_CTX_TSB_CONFIG_1   ttefmt=sun4v
MIDAS_TSB       thr5_z_ctx_tsb_2        THR5_Z_CTX_TSB_CONFIG_2   ttefmt=sun4v
MIDAS_TSB       thr5_z_ctx_tsb_3        THR5_Z_CTX_TSB_CONFIG_3   ttefmt=sun4v
MIDAS_TSB       thr5_nz_ctx_tsb_0       THR5_NZ_CTX_TSB_CONFIG_0  ttefmt=sun4v
MIDAS_TSB       thr5_nz_ctx_tsb_1       THR5_NZ_CTX_TSB_CONFIG_1  ttefmt=sun4v
MIDAS_TSB       thr5_nz_ctx_tsb_2       THR5_NZ_CTX_TSB_CONFIG_2  ttefmt=sun4v
MIDAS_TSB       thr5_nz_ctx_tsb_3       THR5_NZ_CTX_TSB_CONFIG_3  ttefmt=sun4v

MIDAS_TSB       thr6_z_ctx_tsb_0        THR6_Z_CTX_TSB_CONFIG_0   ttefmt=sun4v
MIDAS_TSB       thr6_z_ctx_tsb_1        THR6_Z_CTX_TSB_CONFIG_1   ttefmt=sun4v
MIDAS_TSB       thr6_z_ctx_tsb_2        THR6_Z_CTX_TSB_CONFIG_2   ttefmt=sun4v
MIDAS_TSB       thr6_z_ctx_tsb_3        THR6_Z_CTX_TSB_CONFIG_3   ttefmt=sun4v
MIDAS_TSB       thr6_nz_ctx_tsb_0       THR6_NZ_CTX_TSB_CONFIG_0  ttefmt=sun4v
MIDAS_TSB       thr6_nz_ctx_tsb_1       THR6_NZ_CTX_TSB_CONFIG_1  ttefmt=sun4v
MIDAS_TSB       thr6_nz_ctx_tsb_2       THR6_NZ_CTX_TSB_CONFIG_2  ttefmt=sun4v
MIDAS_TSB       thr6_nz_ctx_tsb_3       THR6_NZ_CTX_TSB_CONFIG_3  ttefmt=sun4v

MIDAS_TSB       thr7_z_ctx_tsb_0        THR7_Z_CTX_TSB_CONFIG_0   ttefmt=sun4v
MIDAS_TSB       thr7_z_ctx_tsb_1        THR7_Z_CTX_TSB_CONFIG_1   ttefmt=sun4v
MIDAS_TSB       thr7_z_ctx_tsb_2        THR7_Z_CTX_TSB_CONFIG_2   ttefmt=sun4v
MIDAS_TSB       thr7_z_ctx_tsb_3        THR7_Z_CTX_TSB_CONFIG_3   ttefmt=sun4v
MIDAS_TSB       thr7_nz_ctx_tsb_0       THR7_NZ_CTX_TSB_CONFIG_0  ttefmt=sun4v
MIDAS_TSB       thr7_nz_ctx_tsb_1       THR7_NZ_CTX_TSB_CONFIG_1  ttefmt=sun4v
MIDAS_TSB       thr7_nz_ctx_tsb_2       THR7_NZ_CTX_TSB_CONFIG_2  ttefmt=sun4v
MIDAS_TSB       thr7_nz_ctx_tsb_3       THR7_NZ_CTX_TSB_CONFIG_3  ttefmt=sun4v

/*****************************************************************************************/
SECTION .RED_SEC TEXT_VA = 0xfffffffff0000000

attr_text {
	Name=.RED_SEC,
	hypervisor
}

.text
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop

	rdhpr	%hpstate, %l1 
	wrhpr	%l1, 0x820, %hpstate

	wrpr	0, %tl
	wrpr	0, %g0, %gl     

#ifdef ENABLE_ITTM_DTTM
thr0_enable_ittm_dttm:
	or	%g0, 0x10, %g2
	ldxa	[%g2] 0x4c, %g5
	or	%g0, 1, %g4
	sllx	%g4, 61, %g3
	or	%g5, %g3, %g5		! enable ITTM
	sllx	%g4, 47, %g3
	or	%g5, %g3, %g5		! enable DTTM
	stxa	%g5, [%g2] 0x4c
#endif
	
	! load partition id to %l7
	wr      %g0, ASI_CORE_ID, %asi
	ldxa    [ASI_CORE_ID_VA] %asi, %l7
	set     0x7, %g1
	and     %l7, %g1, %l7         ! %l7 has TID
	xor	%l0, %l0, %l0
	sub	%l7, %l0, %l1
	brnz	%l1, test_thr1
	nop
	setx	thr0_red_handler, %l0, %l2
	jmp	%l2
	nop
test_thr1:
	add	%l0, 1, %l0
	sub	%l7, %l0, %l1
	brnz	%l1, test_thr2
	nop
	setx	thr1_red_handler, %l0, %l2
	jmp	%l2
	nop
test_thr2:
	add	%l0, 1, %l0
	sub	%l7, %l0, %l1
	brnz	%l1, test_thr3
	nop
	setx	thr2_red_handler, %l0, %l2
	jmp	%l2
	nop
test_thr3:
	add	%l0, 1, %l0
	sub	%l7, %l0, %l1
	brnz	%l1, test_thr4
	nop
	setx	thr3_red_handler, %l0, %l2
	jmp	%l2
	nop
test_thr4:
	add	%l0, 1, %l0
	sub	%l7, %l0, %l1
	brnz	%l1, test_thr5
	nop
	setx	thr4_red_handler, %l0, %l2
	jmp	%l2
	nop
test_thr5:
	add	%l0, 1, %l0
	sub	%l7, %l0, %l1
	brnz	%l1, test_thr6
	nop
	setx	thr5_red_handler, %l0, %l2
	jmp	%l2
	nop
test_thr6:
	add	%l0, 1, %l0
	sub	%l7, %l0, %l1
	brnz	%l1, test_thr7
	nop
	setx	thr6_red_handler, %l0, %l2
	jmp	%l2
	nop
test_thr7:
	setx	thr7_red_handler, %l0, %l2
	jmp	%l2
	nop
	
	EXIT_BAD

/*****************************************************************************************/
SECTION .RED_EXT_SEC TEXT_VA = HV_RED_TEXT_PA, DATA_VA = HV_RED_DATA_PA

attr_text {
	Name=.RED_EXT_SEC,
	hypervisor
}

.text
.global	thr0_red_handler
thr0_red_handler:
	! set partition id
	set	THR_0_PARTID, %g2
	mov	ASI_PARTITION_ID_VAL, %g1
	stxa	%g2, [%g1] ASI_PARTITION_ID

	! set hyper trap base addr
	setx	HPTRAP_TEXT_PA, %l0, %l7
	wrhpr	%l7, %g0, %htba

thr0_hred_context_config:
	setx	ASI_PRIMARY_CONTEXT_REG, %l0, %g1
	wr	%g1, 0x0, %asi
	setx	THR0_PCONTEXT_0, %l0, %g1
	stxa	%g1, [ASI_PRIMARY_CONTEXT_0_REG_VAL] %asi
	setx	THR0_PCONTEXT_1, %l0, %g1
	stxa	%g1, [ASI_PRIMARY_CONTEXT_1_REG_VAL] %asi
	setx	THR0_SCONTEXT_0, %l0, %g1
	stxa	%g1, [ASI_SECONDARY_CONTEXT_0_REG_VAL] %asi
	setx	THR0_SCONTEXT_1, %l0, %g1
	stxa	%g1, [ASI_SECONDARY_CONTEXT_1_REG_VAL] %asi
	
#ifdef TSB_SEARCH_BURST
thr0_tsb_burst_mode:	
        setx    ASI_TSB_SEARCH_MODE_ADDR, %l1, %g1
        or      TSB_SEARCH_BURST, %g0, %g2
        stxa    %g2, [%g1] ASI_TSB_SEARCH_MODE_REG
#endif 
#ifdef TSB_SEARCH_PREDICTION
thr0_tsb_prediction_mode:	
        setx    ASI_TSB_SEARCH_MODE_ADDR, %l1, %g1
        or      TSB_SEARCH_PREDICTION, %g0, %g2
        stxa    %g2, [%g1] ASI_TSB_SEARCH_MODE_REG
#endif

thr0_hred_physical_offset:
	setx	ASI_MMU_PHYSICAL_OFFSET, %l0, %g1
	wr	%g1, 0x0, %asi

	setx	THR0_PHY_OFF_0, %l0, %l1
	stxa    %l1, [ASI_MMU_PHYSICAL_OFFSET_0] %asi
	setx	THR0_PHY_OFF_1, %l0, %l1
	stxa    %l1, [ASI_MMU_PHYSICAL_OFFSET_1] %asi
	setx	THR0_PHY_OFF_2, %l0, %l1
	stxa    %l1, [ASI_MMU_PHYSICAL_OFFSET_2] %asi
	setx	THR0_PHY_OFF_3, %l0, %l1
	stxa    %l1, [ASI_MMU_PHYSICAL_OFFSET_3] %asi

thr0_hred_real_range:
	setx	ASI_MMU_REAL_RANGE, %l1, %g1
	wr	%g1, 0x0, %asi

	setx	THR0_REAL_RANGE_0, %l0, %l1
	stxa	%l1, [ASI_MMU_REAL_RANGE_0] %asi
	setx	THR0_REAL_RANGE_1, %l0, %l1
	stxa	%l1, [ASI_MMU_REAL_RANGE_1] %asi
	setx	THR0_REAL_RANGE_2, %l0, %l1
	stxa	%l1, [ASI_MMU_REAL_RANGE_2] %asi
	setx	THR0_REAL_RANGE_3, %l0, %l1
	stxa	%l1, [ASI_MMU_REAL_RANGE_3] %asi

thr0_hred_tsb_config:
	mov	ASI_MMU_ZERO_CONTEXT_TSB_CONFIG, %g3
	wr	%g3, 0x0, %asi

thr0_hred_tsb_z_config_0:
	setx	THR0_Z_CTX_TSB_CONFIG_0, %g1, %g4
	stxa	%g4, [ASI_MMU_ZERO_CONTEXT_TSB_CONFIG_0] %asi
	setx	THR0_Z_CTX_TSB_CONFIG_1, %g1, %g4
	stxa	%g4, [ASI_MMU_ZERO_CONTEXT_TSB_CONFIG_1] %asi
	setx	THR0_Z_CTX_TSB_CONFIG_2, %g1, %g4
	stxa	%g4, [ASI_MMU_ZERO_CONTEXT_TSB_CONFIG_2] %asi
	setx	THR0_Z_CTX_TSB_CONFIG_3, %g1, %g4
	stxa	%g4, [ASI_MMU_ZERO_CONTEXT_TSB_CONFIG_3] %asi
	setx	THR0_NZ_CTX_TSB_CONFIG_0, %g1, %g4
	stxa	%g4, [ASI_MMU_NONZERO_CONTEXT_TSB_CONFIG_0] %asi
	setx	THR0_NZ_CTX_TSB_CONFIG_1, %g1, %g4
	stxa	%g4, [ASI_MMU_NONZERO_CONTEXT_TSB_CONFIG_1] %asi
	setx	THR0_NZ_CTX_TSB_CONFIG_2, %g1, %g4
	stxa	%g4, [ASI_MMU_NONZERO_CONTEXT_TSB_CONFIG_2] %asi
	setx	THR0_NZ_CTX_TSB_CONFIG_3, %g1, %g4
	stxa	%g4, [ASI_MMU_NONZERO_CONTEXT_TSB_CONFIG_3] %asi

thr0_lsu_ctl_reg:	
	setx	0x1f, %l0, %l7
	stxa	%l7, [%g0] ASI_LSU_CONTROL

thr0_transfer_to_priv_code:	
	setx	Thr0_Priv_Sect_text_begin, %g1, %g2
	jmp	%g2
	wrhpr	%g0, 0x000, %hpstate
	nop
	
	EXIT_BAD

.global	thr1_red_handler
thr1_red_handler:
	! set partition id
	set	THR_1_PARTID, %g2
	mov	ASI_PARTITION_ID_VAL, %g1
	stxa	%g2, [%g1] ASI_PARTITION_ID

	! set hyper trap base addr
	setx	HPTRAP_TEXT_PA, %l0, %l7
	wrhpr	%l7, %g0, %htba

thr1_hred_context_config:
	setx	ASI_PRIMARY_CONTEXT_REG, %l0, %g1
	wr	%g1, 0x0, %asi
	setx	THR1_PCONTEXT_0, %l0, %g1
	stxa	%g1, [ASI_PRIMARY_CONTEXT_0_REG_VAL] %asi
	setx	THR1_PCONTEXT_1, %l0, %g1
	stxa	%g1, [ASI_PRIMARY_CONTEXT_1_REG_VAL] %asi
	setx	THR1_SCONTEXT_0, %l0, %g1
	stxa	%g1, [ASI_SECONDARY_CONTEXT_0_REG_VAL] %asi
	setx	THR1_SCONTEXT_1, %l0, %g1
	stxa	%g1, [ASI_SECONDARY_CONTEXT_1_REG_VAL] %asi
	
#ifdef TSB_SEARCH_BURST
thr1_tsb_burst_mode:	
        setx    ASI_TSB_SEARCH_MODE_ADDR, %l1, %g1
        or      TSB_SEARCH_BURST, %g0, %g2
        stxa    %g2, [%g1] ASI_TSB_SEARCH_MODE_REG
#endif 
#ifdef TSB_SEARCH_PREDICTION
thr1_tsb_prediction_mode:	
        setx    ASI_TSB_SEARCH_MODE_ADDR, %l1, %g1
        or      TSB_SEARCH_PREDICTION, %g0, %g2
        stxa    %g2, [%g1] ASI_TSB_SEARCH_MODE_REG
#endif

thr1_hred_physical_offset:
	setx	ASI_MMU_PHYSICAL_OFFSET, %l0, %g1
	wr	%g1, 0x0, %asi

	setx	THR1_PHY_OFF_0, %l0, %l1
	stxa    %l1, [ASI_MMU_PHYSICAL_OFFSET_0] %asi
	setx	THR1_PHY_OFF_1, %l0, %l1
	stxa    %l1, [ASI_MMU_PHYSICAL_OFFSET_1] %asi
	setx	THR1_PHY_OFF_2, %l0, %l1
	stxa    %l1, [ASI_MMU_PHYSICAL_OFFSET_2] %asi
	setx	THR1_PHY_OFF_3, %l0, %l1
	stxa    %l1, [ASI_MMU_PHYSICAL_OFFSET_3] %asi

thr1_hred_real_range:
	setx	ASI_MMU_REAL_RANGE, %l1, %g1
	wr	%g1, 0x0, %asi

	setx	THR1_REAL_RANGE_0, %l0, %l1
	stxa	%l1, [ASI_MMU_REAL_RANGE_0] %asi
	setx	THR1_REAL_RANGE_1, %l0, %l1
	stxa	%l1, [ASI_MMU_REAL_RANGE_1] %asi
	setx	THR1_REAL_RANGE_2, %l0, %l1
	stxa	%l1, [ASI_MMU_REAL_RANGE_2] %asi
	setx	THR1_REAL_RANGE_3, %l0, %l1
	stxa	%l1, [ASI_MMU_REAL_RANGE_3] %asi

thr1_hred_tsb_config:
	mov	ASI_MMU_ZERO_CONTEXT_TSB_CONFIG, %g3
	wr	%g3, 0x0, %asi

thr1_hred_tsb_z_config_0:
	setx	THR1_Z_CTX_TSB_CONFIG_0, %g1, %g4
	stxa	%g4, [ASI_MMU_ZERO_CONTEXT_TSB_CONFIG_0] %asi
	setx	THR1_Z_CTX_TSB_CONFIG_1, %g1, %g4
	stxa	%g4, [ASI_MMU_ZERO_CONTEXT_TSB_CONFIG_1] %asi
	setx	THR1_Z_CTX_TSB_CONFIG_2, %g1, %g4
	stxa	%g4, [ASI_MMU_ZERO_CONTEXT_TSB_CONFIG_2] %asi
	setx	THR1_Z_CTX_TSB_CONFIG_3, %g1, %g4
	stxa	%g4, [ASI_MMU_ZERO_CONTEXT_TSB_CONFIG_3] %asi
	setx	THR1_NZ_CTX_TSB_CONFIG_0, %g1, %g4
	stxa	%g4, [ASI_MMU_NONZERO_CONTEXT_TSB_CONFIG_0] %asi
	setx	THR1_NZ_CTX_TSB_CONFIG_1, %g1, %g4
	stxa	%g4, [ASI_MMU_NONZERO_CONTEXT_TSB_CONFIG_1] %asi
	setx	THR1_NZ_CTX_TSB_CONFIG_2, %g1, %g4
	stxa	%g4, [ASI_MMU_NONZERO_CONTEXT_TSB_CONFIG_2] %asi
	setx	THR1_NZ_CTX_TSB_CONFIG_3, %g1, %g4
	stxa	%g4, [ASI_MMU_NONZERO_CONTEXT_TSB_CONFIG_3] %asi
	
thr1_lsu_ctl_reg:	
	setx	0x1f, %l0, %l7
	stxa	%l7, [%g0] ASI_LSU_CONTROL

thr1_transfer_to_priv_code:	
	setx	Thr1_Priv_Sect_text_begin, %g1, %g2
	jmp	%g2
	wrhpr	%g0, 0x000, %hpstate
	nop
	
	EXIT_BAD

.global	thr2_red_handler
thr2_red_handler:
	! set partition id
	set	THR_2_PARTID, %g2
	mov	ASI_PARTITION_ID_VAL, %g1
	stxa	%g2, [%g1] ASI_PARTITION_ID

	! set hyper trap base addr
	setx	HPTRAP_TEXT_PA, %l0, %l7
	wrhpr	%l7, %g0, %htba

thr2_hred_context_config:
	setx	ASI_PRIMARY_CONTEXT_REG, %l0, %g1
	wr	%g1, 0x0, %asi
	setx	THR2_PCONTEXT_0, %l0, %g1
	stxa	%g1, [ASI_PRIMARY_CONTEXT_0_REG_VAL] %asi
	setx	THR2_PCONTEXT_1, %l0, %g1
	stxa	%g1, [ASI_PRIMARY_CONTEXT_1_REG_VAL] %asi
	setx	THR2_SCONTEXT_0, %l0, %g1
	stxa	%g1, [ASI_SECONDARY_CONTEXT_0_REG_VAL] %asi
	setx	THR2_SCONTEXT_1, %l0, %g1
	stxa	%g1, [ASI_SECONDARY_CONTEXT_1_REG_VAL] %asi
	
#ifdef TSB_SEARCH_BURST
thr2_tsb_burst_mode:	
        setx    ASI_TSB_SEARCH_MODE_ADDR, %l1, %g1
        or      TSB_SEARCH_BURST, %g0, %g2
        stxa    %g2, [%g1] ASI_TSB_SEARCH_MODE_REG
#endif 
#ifdef TSB_SEARCH_PREDICTION
thr2_tsb_prediction_mode:	
        setx    ASI_TSB_SEARCH_MODE_ADDR, %l1, %g1
        or      TSB_SEARCH_PREDICTION, %g0, %g2
        stxa    %g2, [%g1] ASI_TSB_SEARCH_MODE_REG
#endif

thr2_hred_physical_offset:
	setx	ASI_MMU_PHYSICAL_OFFSET, %l0, %g1
	wr	%g1, 0x0, %asi

	setx	THR2_PHY_OFF_0, %l0, %l1
	stxa    %l1, [ASI_MMU_PHYSICAL_OFFSET_0] %asi
	setx	THR2_PHY_OFF_1, %l0, %l1
	stxa    %l1, [ASI_MMU_PHYSICAL_OFFSET_1] %asi
	setx	THR2_PHY_OFF_2, %l0, %l1
	stxa    %l1, [ASI_MMU_PHYSICAL_OFFSET_2] %asi
	setx	THR2_PHY_OFF_3, %l0, %l1
	stxa    %l1, [ASI_MMU_PHYSICAL_OFFSET_3] %asi

thr2_hred_real_range:
	setx	ASI_MMU_REAL_RANGE, %l1, %g1
	wr	%g1, 0x0, %asi

	setx	THR2_REAL_RANGE_0, %l0, %l1
	stxa	%l1, [ASI_MMU_REAL_RANGE_0] %asi
	setx	THR2_REAL_RANGE_1, %l0, %l1
	stxa	%l1, [ASI_MMU_REAL_RANGE_1] %asi
	setx	THR2_REAL_RANGE_2, %l0, %l1
	stxa	%l1, [ASI_MMU_REAL_RANGE_2] %asi
	setx	THR2_REAL_RANGE_3, %l0, %l1
	stxa	%l1, [ASI_MMU_REAL_RANGE_3] %asi

thr2_hred_tsb_config:
	mov	ASI_MMU_ZERO_CONTEXT_TSB_CONFIG, %g3
	wr	%g3, 0x0, %asi

thr2_hred_tsb_z_config_0:
	setx	THR2_Z_CTX_TSB_CONFIG_0, %g1, %g4
	stxa	%g4, [ASI_MMU_ZERO_CONTEXT_TSB_CONFIG_0] %asi
	setx	THR2_Z_CTX_TSB_CONFIG_1, %g1, %g4
	stxa	%g4, [ASI_MMU_ZERO_CONTEXT_TSB_CONFIG_1] %asi
	setx	THR2_Z_CTX_TSB_CONFIG_2, %g1, %g4
	stxa	%g4, [ASI_MMU_ZERO_CONTEXT_TSB_CONFIG_2] %asi
	setx	THR2_Z_CTX_TSB_CONFIG_3, %g1, %g4
	stxa	%g4, [ASI_MMU_ZERO_CONTEXT_TSB_CONFIG_3] %asi
	setx	THR2_NZ_CTX_TSB_CONFIG_0, %g1, %g4
	stxa	%g4, [ASI_MMU_NONZERO_CONTEXT_TSB_CONFIG_0] %asi
	setx	THR2_NZ_CTX_TSB_CONFIG_1, %g1, %g4
	stxa	%g4, [ASI_MMU_NONZERO_CONTEXT_TSB_CONFIG_1] %asi
	setx	THR2_NZ_CTX_TSB_CONFIG_2, %g1, %g4
	stxa	%g4, [ASI_MMU_NONZERO_CONTEXT_TSB_CONFIG_2] %asi
	setx	THR2_NZ_CTX_TSB_CONFIG_3, %g1, %g4
	stxa	%g4, [ASI_MMU_NONZERO_CONTEXT_TSB_CONFIG_3] %asi
	
thr2_lsu_ctl_reg:	
	setx	0x1f, %l0, %l7
	stxa	%l7, [%g0] ASI_LSU_CONTROL

thr2_transfer_to_priv_code:	
	setx	Thr2_Priv_Sect_text_begin, %g1, %g2
	jmp	%g2
	wrhpr	%g0, 0x000, %hpstate
	nop
	
	EXIT_BAD

.global	thr3_red_handler
thr3_red_handler:
	! set partition id
	set	THR_3_PARTID, %g2
	mov	ASI_PARTITION_ID_VAL, %g1
	stxa	%g2, [%g1] ASI_PARTITION_ID

	! set hyper trap base addr
	setx	HPTRAP_TEXT_PA, %l0, %l7
	wrhpr	%l7, %g0, %htba

thr3_hred_context_config:
	setx	ASI_PRIMARY_CONTEXT_REG, %l0, %g1
	wr	%g1, 0x0, %asi
	setx	THR3_PCONTEXT_0, %l0, %g1
	stxa	%g1, [ASI_PRIMARY_CONTEXT_0_REG_VAL] %asi
	setx	THR3_PCONTEXT_1, %l0, %g1
	stxa	%g1, [ASI_PRIMARY_CONTEXT_1_REG_VAL] %asi
	setx	THR3_SCONTEXT_0, %l0, %g1
	stxa	%g1, [ASI_SECONDARY_CONTEXT_0_REG_VAL] %asi
	setx	THR3_SCONTEXT_1, %l0, %g1
	stxa	%g1, [ASI_SECONDARY_CONTEXT_1_REG_VAL] %asi
	
#ifdef TSB_SEARCH_BURST
thr3_tsb_burst_mode:	
        setx    ASI_TSB_SEARCH_MODE_ADDR, %l1, %g1
        or      TSB_SEARCH_BURST, %g0, %g2
        stxa    %g2, [%g1] ASI_TSB_SEARCH_MODE_REG
#endif 
#ifdef TSB_SEARCH_PREDICTION
thr3_tsb_prediction_mode:	
        setx    ASI_TSB_SEARCH_MODE_ADDR, %l1, %g1
        or      TSB_SEARCH_PREDICTION, %g0, %g2
        stxa    %g2, [%g1] ASI_TSB_SEARCH_MODE_REG
#endif

thr3_hred_physical_offset:
	setx	ASI_MMU_PHYSICAL_OFFSET, %l0, %g1
	wr	%g1, 0x0, %asi

	setx	THR3_PHY_OFF_0, %l0, %l1
	stxa    %l1, [ASI_MMU_PHYSICAL_OFFSET_0] %asi
	setx	THR3_PHY_OFF_1, %l0, %l1
	stxa    %l1, [ASI_MMU_PHYSICAL_OFFSET_1] %asi
	setx	THR3_PHY_OFF_2, %l0, %l1
	stxa    %l1, [ASI_MMU_PHYSICAL_OFFSET_2] %asi
	setx	THR3_PHY_OFF_3, %l0, %l1
	stxa    %l1, [ASI_MMU_PHYSICAL_OFFSET_3] %asi

thr3_hred_real_range:
	setx	ASI_MMU_REAL_RANGE, %l1, %g1
	wr	%g1, 0x0, %asi

	setx	THR3_REAL_RANGE_0, %l0, %l1
	stxa	%l1, [ASI_MMU_REAL_RANGE_0] %asi
	setx	THR3_REAL_RANGE_1, %l0, %l1
	stxa	%l1, [ASI_MMU_REAL_RANGE_1] %asi
	setx	THR3_REAL_RANGE_2, %l0, %l1
	stxa	%l1, [ASI_MMU_REAL_RANGE_2] %asi
	setx	THR3_REAL_RANGE_3, %l0, %l1
	stxa	%l1, [ASI_MMU_REAL_RANGE_3] %asi

thr3_hred_tsb_config:
	mov	ASI_MMU_ZERO_CONTEXT_TSB_CONFIG, %g3
	wr	%g3, 0x0, %asi

thr3_hred_tsb_z_config_0:
	setx	THR3_Z_CTX_TSB_CONFIG_0, %g1, %g4
	stxa	%g4, [ASI_MMU_ZERO_CONTEXT_TSB_CONFIG_0] %asi
	setx	THR3_Z_CTX_TSB_CONFIG_1, %g1, %g4
	stxa	%g4, [ASI_MMU_ZERO_CONTEXT_TSB_CONFIG_1] %asi
	setx	THR3_Z_CTX_TSB_CONFIG_2, %g1, %g4
	stxa	%g4, [ASI_MMU_ZERO_CONTEXT_TSB_CONFIG_2] %asi
	setx	THR3_Z_CTX_TSB_CONFIG_3, %g1, %g4
	stxa	%g4, [ASI_MMU_ZERO_CONTEXT_TSB_CONFIG_3] %asi
	setx	THR3_NZ_CTX_TSB_CONFIG_0, %g1, %g4
	stxa	%g4, [ASI_MMU_NONZERO_CONTEXT_TSB_CONFIG_0] %asi
	setx	THR3_NZ_CTX_TSB_CONFIG_1, %g1, %g4
	stxa	%g4, [ASI_MMU_NONZERO_CONTEXT_TSB_CONFIG_1] %asi
	setx	THR3_NZ_CTX_TSB_CONFIG_2, %g1, %g4
	stxa	%g4, [ASI_MMU_NONZERO_CONTEXT_TSB_CONFIG_2] %asi
	setx	THR3_NZ_CTX_TSB_CONFIG_3, %g1, %g4
	stxa	%g4, [ASI_MMU_NONZERO_CONTEXT_TSB_CONFIG_3] %asi
	
thr3_lsu_ctl_reg:	
	setx	0x1f, %l0, %l7
	stxa	%l7, [%g0] ASI_LSU_CONTROL

thr3_transfer_to_priv_code:	
	setx	Thr3_Priv_Sect_text_begin, %g1, %g2
	jmp	%g2
	wrhpr	%g0, 0x000, %hpstate
	nop
	
	EXIT_BAD

.global	thr4_red_handler
thr4_red_handler:
	! set partition id
	set	THR_4_PARTID, %g2
	mov	ASI_PARTITION_ID_VAL, %g1
	stxa	%g2, [%g1] ASI_PARTITION_ID

	! set hyper trap base addr
	setx	HPTRAP_TEXT_PA, %l0, %l7
	wrhpr	%l7, %g0, %htba

thr4_hred_context_config:
	setx	ASI_PRIMARY_CONTEXT_REG, %l0, %g1
	wr	%g1, 0x0, %asi
	setx	THR4_PCONTEXT_0, %l0, %g1
	stxa	%g1, [ASI_PRIMARY_CONTEXT_0_REG_VAL] %asi
	setx	THR4_PCONTEXT_1, %l0, %g1
	stxa	%g1, [ASI_PRIMARY_CONTEXT_1_REG_VAL] %asi
	setx	THR4_SCONTEXT_0, %l0, %g1
	stxa	%g1, [ASI_SECONDARY_CONTEXT_0_REG_VAL] %asi
	setx	THR4_SCONTEXT_1, %l0, %g1
	stxa	%g1, [ASI_SECONDARY_CONTEXT_1_REG_VAL] %asi
	
#ifdef TSB_SEARCH_BURST
thr4_tsb_burst_mode:	
        setx    ASI_TSB_SEARCH_MODE_ADDR, %l1, %g1
        or      TSB_SEARCH_BURST, %g0, %g2
        stxa    %g2, [%g1] ASI_TSB_SEARCH_MODE_REG
#endif 
#ifdef TSB_SEARCH_PREDICTION
thr4_tsb_prediction_mode:	
        setx    ASI_TSB_SEARCH_MODE_ADDR, %l1, %g1
        or      TSB_SEARCH_PREDICTION, %g0, %g2
        stxa    %g2, [%g1] ASI_TSB_SEARCH_MODE_REG
#endif

thr4_hred_physical_offset:
	setx	ASI_MMU_PHYSICAL_OFFSET, %l0, %g1
	wr	%g1, 0x0, %asi

	setx	THR4_PHY_OFF_0, %l0, %l1
	stxa    %l1, [ASI_MMU_PHYSICAL_OFFSET_0] %asi
	setx	THR4_PHY_OFF_1, %l0, %l1
	stxa    %l1, [ASI_MMU_PHYSICAL_OFFSET_1] %asi
	setx	THR4_PHY_OFF_2, %l0, %l1
	stxa    %l1, [ASI_MMU_PHYSICAL_OFFSET_2] %asi
	setx	THR4_PHY_OFF_3, %l0, %l1
	stxa    %l1, [ASI_MMU_PHYSICAL_OFFSET_3] %asi

thr4_hred_real_range:
	setx	ASI_MMU_REAL_RANGE, %l1, %g1
	wr	%g1, 0x0, %asi

	setx	THR4_REAL_RANGE_0, %l0, %l1
	stxa	%l1, [ASI_MMU_REAL_RANGE_0] %asi
	setx	THR4_REAL_RANGE_1, %l0, %l1
	stxa	%l1, [ASI_MMU_REAL_RANGE_1] %asi
	setx	THR4_REAL_RANGE_2, %l0, %l1
	stxa	%l1, [ASI_MMU_REAL_RANGE_2] %asi
	setx	THR4_REAL_RANGE_3, %l0, %l1
	stxa	%l1, [ASI_MMU_REAL_RANGE_3] %asi

thr4_hred_tsb_config:
	mov	ASI_MMU_ZERO_CONTEXT_TSB_CONFIG, %g3
	wr	%g3, 0x0, %asi

thr4_hred_tsb_z_config_0:
	setx	THR4_Z_CTX_TSB_CONFIG_0, %g1, %g4
	stxa	%g4, [ASI_MMU_ZERO_CONTEXT_TSB_CONFIG_0] %asi
	setx	THR4_Z_CTX_TSB_CONFIG_1, %g1, %g4
	stxa	%g4, [ASI_MMU_ZERO_CONTEXT_TSB_CONFIG_1] %asi
	setx	THR4_Z_CTX_TSB_CONFIG_2, %g1, %g4
	stxa	%g4, [ASI_MMU_ZERO_CONTEXT_TSB_CONFIG_2] %asi
	setx	THR4_Z_CTX_TSB_CONFIG_3, %g1, %g4
	stxa	%g4, [ASI_MMU_ZERO_CONTEXT_TSB_CONFIG_3] %asi
	setx	THR4_NZ_CTX_TSB_CONFIG_0, %g1, %g4
	stxa	%g4, [ASI_MMU_NONZERO_CONTEXT_TSB_CONFIG_0] %asi
	setx	THR4_NZ_CTX_TSB_CONFIG_1, %g1, %g4
	stxa	%g4, [ASI_MMU_NONZERO_CONTEXT_TSB_CONFIG_1] %asi
	setx	THR4_NZ_CTX_TSB_CONFIG_2, %g1, %g4
	stxa	%g4, [ASI_MMU_NONZERO_CONTEXT_TSB_CONFIG_2] %asi
	setx	THR4_NZ_CTX_TSB_CONFIG_3, %g1, %g4
	stxa	%g4, [ASI_MMU_NONZERO_CONTEXT_TSB_CONFIG_3] %asi
	
thr4_lsu_ctl_reg:	
	setx	0x1f, %l0, %l7
	stxa	%l7, [%g0] ASI_LSU_CONTROL

thr4_transfer_to_priv_code:	
	setx	Thr4_Priv_Sect_text_begin, %g1, %g2
	jmp	%g2
	wrhpr	%g0, 0x000, %hpstate
	nop
	
	EXIT_BAD

.global	thr5_red_handler
thr5_red_handler:
	! set partition id
	set	THR_5_PARTID, %g2
	mov	ASI_PARTITION_ID_VAL, %g1
	stxa	%g2, [%g1] ASI_PARTITION_ID

	! set hyper trap base addr
	setx	HPTRAP_TEXT_PA, %l0, %l7
	wrhpr	%l7, %g0, %htba

thr5_hred_context_config:
	setx	ASI_PRIMARY_CONTEXT_REG, %l0, %g1
	wr	%g1, 0x0, %asi
	setx	THR5_PCONTEXT_0, %l0, %g1
	stxa	%g1, [ASI_PRIMARY_CONTEXT_0_REG_VAL] %asi
	setx	THR5_PCONTEXT_1, %l0, %g1
	stxa	%g1, [ASI_PRIMARY_CONTEXT_1_REG_VAL] %asi
	setx	THR5_SCONTEXT_0, %l0, %g1
	stxa	%g1, [ASI_SECONDARY_CONTEXT_0_REG_VAL] %asi
	setx	THR5_SCONTEXT_1, %l0, %g1
	stxa	%g1, [ASI_SECONDARY_CONTEXT_1_REG_VAL] %asi
	
#ifdef TSB_SEARCH_BURST
thr5_tsb_burst_mode:	
        setx    ASI_TSB_SEARCH_MODE_ADDR, %l1, %g1
        or      TSB_SEARCH_BURST, %g0, %g2
        stxa    %g2, [%g1] ASI_TSB_SEARCH_MODE_REG
#endif 
#ifdef TSB_SEARCH_PREDICTION
thr5_tsb_prediction_mode:	
        setx    ASI_TSB_SEARCH_MODE_ADDR, %l1, %g1
        or      TSB_SEARCH_PREDICTION, %g0, %g2
        stxa    %g2, [%g1] ASI_TSB_SEARCH_MODE_REG
#endif

thr5_hred_physical_offset:
	setx	ASI_MMU_PHYSICAL_OFFSET, %l0, %g1
	wr	%g1, 0x0, %asi

	setx	THR5_PHY_OFF_0, %l0, %l1
	stxa    %l1, [ASI_MMU_PHYSICAL_OFFSET_0] %asi
	setx	THR5_PHY_OFF_1, %l0, %l1
	stxa    %l1, [ASI_MMU_PHYSICAL_OFFSET_1] %asi
	setx	THR5_PHY_OFF_2, %l0, %l1
	stxa    %l1, [ASI_MMU_PHYSICAL_OFFSET_2] %asi
	setx	THR5_PHY_OFF_3, %l0, %l1
	stxa    %l1, [ASI_MMU_PHYSICAL_OFFSET_3] %asi

thr5_hred_real_range:
	setx	ASI_MMU_REAL_RANGE, %l1, %g1
	wr	%g1, 0x0, %asi

	setx	THR5_REAL_RANGE_0, %l0, %l1
	stxa	%l1, [ASI_MMU_REAL_RANGE_0] %asi
	setx	THR5_REAL_RANGE_1, %l0, %l1
	stxa	%l1, [ASI_MMU_REAL_RANGE_1] %asi
	setx	THR5_REAL_RANGE_2, %l0, %l1
	stxa	%l1, [ASI_MMU_REAL_RANGE_2] %asi
	setx	THR5_REAL_RANGE_3, %l0, %l1
	stxa	%l1, [ASI_MMU_REAL_RANGE_3] %asi

thr5_hred_tsb_config:
	mov	ASI_MMU_ZERO_CONTEXT_TSB_CONFIG, %g3
	wr	%g3, 0x0, %asi

thr5_hred_tsb_z_config_0:
	setx	THR5_Z_CTX_TSB_CONFIG_0, %g1, %g4
	stxa	%g4, [ASI_MMU_ZERO_CONTEXT_TSB_CONFIG_0] %asi
	setx	THR5_Z_CTX_TSB_CONFIG_1, %g1, %g4
	stxa	%g4, [ASI_MMU_ZERO_CONTEXT_TSB_CONFIG_1] %asi
	setx	THR5_Z_CTX_TSB_CONFIG_2, %g1, %g4
	stxa	%g4, [ASI_MMU_ZERO_CONTEXT_TSB_CONFIG_2] %asi
	setx	THR5_Z_CTX_TSB_CONFIG_3, %g1, %g4
	stxa	%g4, [ASI_MMU_ZERO_CONTEXT_TSB_CONFIG_3] %asi
	setx	THR5_NZ_CTX_TSB_CONFIG_0, %g1, %g4
	stxa	%g4, [ASI_MMU_NONZERO_CONTEXT_TSB_CONFIG_0] %asi
	setx	THR5_NZ_CTX_TSB_CONFIG_1, %g1, %g4
	stxa	%g4, [ASI_MMU_NONZERO_CONTEXT_TSB_CONFIG_1] %asi
	setx	THR5_NZ_CTX_TSB_CONFIG_2, %g1, %g4
	stxa	%g4, [ASI_MMU_NONZERO_CONTEXT_TSB_CONFIG_2] %asi
	setx	THR5_NZ_CTX_TSB_CONFIG_3, %g1, %g4
	stxa	%g4, [ASI_MMU_NONZERO_CONTEXT_TSB_CONFIG_3] %asi
	
thr5_lsu_ctl_reg:	
	setx	0x1f, %l0, %l7
	stxa	%l7, [%g0] ASI_LSU_CONTROL

thr5_transfer_to_priv_code:	
	setx	Thr5_Priv_Sect_text_begin, %g1, %g2
	jmp	%g2
	wrhpr	%g0, 0x000, %hpstate
	nop
	
	EXIT_BAD

.global	thr6_red_handler
thr6_red_handler:
	! set partition id
	set	THR_6_PARTID, %g2
	mov	ASI_PARTITION_ID_VAL, %g1
	stxa	%g2, [%g1] ASI_PARTITION_ID

	! set hyper trap base addr
	setx	HPTRAP_TEXT_PA, %l0, %l7
	wrhpr	%l7, %g0, %htba

thr6_hred_context_config:
	setx	ASI_PRIMARY_CONTEXT_REG, %l0, %g1
	wr	%g1, 0x0, %asi
	setx	THR6_PCONTEXT_0, %l0, %g1
	stxa	%g1, [ASI_PRIMARY_CONTEXT_0_REG_VAL] %asi
	setx	THR6_PCONTEXT_1, %l0, %g1
	stxa	%g1, [ASI_PRIMARY_CONTEXT_1_REG_VAL] %asi
	setx	THR6_SCONTEXT_0, %l0, %g1
	stxa	%g1, [ASI_SECONDARY_CONTEXT_0_REG_VAL] %asi
	setx	THR6_SCONTEXT_1, %l0, %g1
	stxa	%g1, [ASI_SECONDARY_CONTEXT_1_REG_VAL] %asi
	
#ifdef TSB_SEARCH_BURST
thr6_tsb_burst_mode:	
        setx    ASI_TSB_SEARCH_MODE_ADDR, %l1, %g1
        or      TSB_SEARCH_BURST, %g0, %g2
        stxa    %g2, [%g1] ASI_TSB_SEARCH_MODE_REG
#endif 
#ifdef TSB_SEARCH_PREDICTION
thr6_tsb_prediction_mode:	
        setx    ASI_TSB_SEARCH_MODE_ADDR, %l1, %g1
        or      TSB_SEARCH_PREDICTION, %g0, %g2
        stxa    %g2, [%g1] ASI_TSB_SEARCH_MODE_REG
#endif

thr6_hred_physical_offset:
	setx	ASI_MMU_PHYSICAL_OFFSET, %l0, %g1
	wr	%g1, 0x0, %asi

	setx	THR6_PHY_OFF_0, %l0, %l1
	stxa    %l1, [ASI_MMU_PHYSICAL_OFFSET_0] %asi
	setx	THR6_PHY_OFF_1, %l0, %l1
	stxa    %l1, [ASI_MMU_PHYSICAL_OFFSET_1] %asi
	setx	THR6_PHY_OFF_2, %l0, %l1
	stxa    %l1, [ASI_MMU_PHYSICAL_OFFSET_2] %asi
	setx	THR6_PHY_OFF_3, %l0, %l1
	stxa    %l1, [ASI_MMU_PHYSICAL_OFFSET_3] %asi

thr6_hred_real_range:
	setx	ASI_MMU_REAL_RANGE, %l1, %g1
	wr	%g1, 0x0, %asi

	setx	THR6_REAL_RANGE_0, %l0, %l1
	stxa	%l1, [ASI_MMU_REAL_RANGE_0] %asi
	setx	THR6_REAL_RANGE_1, %l0, %l1
	stxa	%l1, [ASI_MMU_REAL_RANGE_1] %asi
	setx	THR6_REAL_RANGE_2, %l0, %l1
	stxa	%l1, [ASI_MMU_REAL_RANGE_2] %asi
	setx	THR6_REAL_RANGE_3, %l0, %l1
	stxa	%l1, [ASI_MMU_REAL_RANGE_3] %asi

thr6_hred_tsb_config:
	mov	ASI_MMU_ZERO_CONTEXT_TSB_CONFIG, %g3
	wr	%g3, 0x0, %asi

thr6_hred_tsb_z_config_0:
	setx	THR6_Z_CTX_TSB_CONFIG_0, %g1, %g4
	stxa	%g4, [ASI_MMU_ZERO_CONTEXT_TSB_CONFIG_0] %asi
	setx	THR6_Z_CTX_TSB_CONFIG_1, %g1, %g4
	stxa	%g4, [ASI_MMU_ZERO_CONTEXT_TSB_CONFIG_1] %asi
	setx	THR6_Z_CTX_TSB_CONFIG_2, %g1, %g4
	stxa	%g4, [ASI_MMU_ZERO_CONTEXT_TSB_CONFIG_2] %asi
	setx	THR6_Z_CTX_TSB_CONFIG_3, %g1, %g4
	stxa	%g4, [ASI_MMU_ZERO_CONTEXT_TSB_CONFIG_3] %asi
	setx	THR6_NZ_CTX_TSB_CONFIG_0, %g1, %g4
	stxa	%g4, [ASI_MMU_NONZERO_CONTEXT_TSB_CONFIG_0] %asi
	setx	THR6_NZ_CTX_TSB_CONFIG_1, %g1, %g4
	stxa	%g4, [ASI_MMU_NONZERO_CONTEXT_TSB_CONFIG_1] %asi
	setx	THR6_NZ_CTX_TSB_CONFIG_2, %g1, %g4
	stxa	%g4, [ASI_MMU_NONZERO_CONTEXT_TSB_CONFIG_2] %asi
	setx	THR6_NZ_CTX_TSB_CONFIG_3, %g1, %g4
	stxa	%g4, [ASI_MMU_NONZERO_CONTEXT_TSB_CONFIG_3] %asi
	
thr6_lsu_ctl_reg:	
	setx	0x1f, %l0, %l7
	stxa	%l7, [%g0] ASI_LSU_CONTROL

thr6_transfer_to_priv_code:	
	setx	Thr6_Priv_Sect_text_begin, %g1, %g2
	jmp	%g2
	wrhpr	%g0, 0x000, %hpstate
	nop
	
	EXIT_BAD

.global	thr7_red_handler
thr7_red_handler:
	! set partition id
	set	THR_7_PARTID, %g2
	mov	ASI_PARTITION_ID_VAL, %g1
	stxa	%g2, [%g1] ASI_PARTITION_ID

	! set hyper trap base addr
	setx	HPTRAP_TEXT_PA, %l0, %l7
	wrhpr	%l7, %g0, %htba

thr7_hred_context_config:
	setx	ASI_PRIMARY_CONTEXT_REG, %l0, %g1
	wr	%g1, 0x0, %asi
	setx	THR7_PCONTEXT_0, %l0, %g1
	stxa	%g1, [ASI_PRIMARY_CONTEXT_0_REG_VAL] %asi
	setx	THR7_PCONTEXT_1, %l0, %g1
	stxa	%g1, [ASI_PRIMARY_CONTEXT_1_REG_VAL] %asi
	setx	THR7_SCONTEXT_0, %l0, %g1
	stxa	%g1, [ASI_SECONDARY_CONTEXT_0_REG_VAL] %asi
	setx	THR7_SCONTEXT_1, %l0, %g1
	stxa	%g1, [ASI_SECONDARY_CONTEXT_1_REG_VAL] %asi
	
#ifdef TSB_SEARCH_BURST
thr7_tsb_burst_mode:	
        setx    ASI_TSB_SEARCH_MODE_ADDR, %l1, %g1
        or      TSB_SEARCH_BURST, %g0, %g2
        stxa    %g2, [%g1] ASI_TSB_SEARCH_MODE_REG
#endif 
#ifdef TSB_SEARCH_PREDICTION
thr7_tsb_prediction_mode:	
        setx    ASI_TSB_SEARCH_MODE_ADDR, %l1, %g1
        or      TSB_SEARCH_PREDICTION, %g0, %g2
        stxa    %g2, [%g1] ASI_TSB_SEARCH_MODE_REG
#endif

thr7_hred_physical_offset:
	setx	ASI_MMU_PHYSICAL_OFFSET, %l0, %g1
	wr	%g1, 0x0, %asi

	setx	THR7_PHY_OFF_0, %l0, %l1
	stxa    %l1, [ASI_MMU_PHYSICAL_OFFSET_0] %asi
	setx	THR7_PHY_OFF_1, %l0, %l1
	stxa    %l1, [ASI_MMU_PHYSICAL_OFFSET_1] %asi
	setx	THR7_PHY_OFF_2, %l0, %l1
	stxa    %l1, [ASI_MMU_PHYSICAL_OFFSET_2] %asi
	setx	THR7_PHY_OFF_3, %l0, %l1
	stxa    %l1, [ASI_MMU_PHYSICAL_OFFSET_3] %asi

thr7_hred_real_range:
	setx	ASI_MMU_REAL_RANGE, %l1, %g1
	wr	%g1, 0x0, %asi

	setx	THR7_REAL_RANGE_0, %l0, %l1
	stxa	%l1, [ASI_MMU_REAL_RANGE_0] %asi
	setx	THR7_REAL_RANGE_1, %l0, %l1
	stxa	%l1, [ASI_MMU_REAL_RANGE_1] %asi
	setx	THR7_REAL_RANGE_2, %l0, %l1
	stxa	%l1, [ASI_MMU_REAL_RANGE_2] %asi
	setx	THR7_REAL_RANGE_3, %l0, %l1
	stxa	%l1, [ASI_MMU_REAL_RANGE_3] %asi

thr7_hred_tsb_config:
	mov	ASI_MMU_ZERO_CONTEXT_TSB_CONFIG, %g3
	wr	%g3, 0x0, %asi

thr7_hred_tsb_z_config_0:
	setx	THR7_Z_CTX_TSB_CONFIG_0, %g1, %g4
	stxa	%g4, [ASI_MMU_ZERO_CONTEXT_TSB_CONFIG_0] %asi
	setx	THR7_Z_CTX_TSB_CONFIG_1, %g1, %g4
	stxa	%g4, [ASI_MMU_ZERO_CONTEXT_TSB_CONFIG_1] %asi
	setx	THR7_Z_CTX_TSB_CONFIG_2, %g1, %g4
	stxa	%g4, [ASI_MMU_ZERO_CONTEXT_TSB_CONFIG_2] %asi
	setx	THR7_Z_CTX_TSB_CONFIG_3, %g1, %g4
	stxa	%g4, [ASI_MMU_ZERO_CONTEXT_TSB_CONFIG_3] %asi
	setx	THR7_NZ_CTX_TSB_CONFIG_0, %g1, %g4
	stxa	%g4, [ASI_MMU_NONZERO_CONTEXT_TSB_CONFIG_0] %asi
	setx	THR7_NZ_CTX_TSB_CONFIG_1, %g1, %g4
	stxa	%g4, [ASI_MMU_NONZERO_CONTEXT_TSB_CONFIG_1] %asi
	setx	THR7_NZ_CTX_TSB_CONFIG_2, %g1, %g4
	stxa	%g4, [ASI_MMU_NONZERO_CONTEXT_TSB_CONFIG_2] %asi
	setx	THR7_NZ_CTX_TSB_CONFIG_3, %g1, %g4
	stxa	%g4, [ASI_MMU_NONZERO_CONTEXT_TSB_CONFIG_3] %asi
	
thr7_lsu_ctl_reg:	
	setx	0x1f, %l0, %l7
	stxa	%l7, [%g0] ASI_LSU_CONTROL

thr7_transfer_to_priv_code:	
	setx	Thr7_Priv_Sect_text_begin, %g1, %g2
	jmp	%g2
	wrhpr	%g0, 0x000, %hpstate
	nop
	
	EXIT_BAD

attr_data {
	Name=.RED_EXT_SEC,
	hypervisor
}

.data
part_id_list:
	.xword	THR_0_PARTID, THR_1_PARTID, THR_2_PARTID, THR_3_PARTID
	.xword	THR_4_PARTID, THR_5_PARTID, THR_6_PARTID, THR_7_PARTID

