/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: err_defines.h
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
#ifndef __ERR_DEFINES_H__
#define __ERR_DEFINES_H__

#ifndef ERR_INJ_IMDU

#define  ERR_INJ_IMDU            0
#endif

#ifndef ERR_INJ_IMTU
#define  ERR_INJ_IMTU            0
#endif

#ifndef ERR_INJ_DMDU
#define  ERR_INJ_DMDU            0
#endif

#ifndef ERR_INJ_DMTU
#define  ERR_INJ_DMTU            0
#endif

#ifndef ERR_INJ_IRFU
#define  ERR_INJ_IRFU            0
#endif

#ifndef ERR_INJ_FRFU
#define  ERR_INJ_FRFU            0
#endif

#ifndef ERR_INJ_SCAU
#define  ERR_INJ_SCAU            0
#endif

#ifndef ERR_INJ_TCCU
#define  ERR_INJ_TCCU            0
#endif

#ifndef ERR_INJ_TSAU
#define  ERR_INJ_TSAU            0
#endif

#ifndef ERR_INJ_MRAU
#define  ERR_INJ_MRAU            0
#endif

#ifndef ERR_INJ_STAU
#define  ERR_INJ_STAU            0
#endif

#ifndef ERR_INJ_STDU
#define  ERR_INJ_STDU            0
#endif

#ifndef ERR_INJ_ECCMASK
#define  ERR_INJ_ECCMASK           0x00
#endif

#ifndef ERR_INJ_ENB
#define ERR_INJ_ENB  (\
	ERR_INJ_STDU | ERR_INJ_STAU | ERR_INJ_MRAU | ERR_INJ_TSAU | ERR_INJ_TCCU |\
        ERR_INJ_SCAU | ERR_INJ_FRFU | ERR_INJ_IRFU |\
        ERR_INJ_DMTU | ERR_INJ_DMDU | ERR_INJ_IMTU | ERR_INJ_IMDU)

#endif

#ifndef ERR_INJ_REG_DATA
#define ERR_INJ_REG_DATA (\
	ERR_INJ_ECCMASK | (ERR_INJ_STDU << 17) | (ERR_INJ_STAU << 19) |\
       (ERR_INJ_MRAU << 20) | (ERR_INJ_TSAU << 21) | (ERR_INJ_TCCU << 22) |\
       (ERR_INJ_SCAU << 23) | (ERR_INJ_FRFU << 24) | (ERR_INJ_IRFU << 25) |\
       (ERR_INJ_DMTU << 26) | (ERR_INJ_DMDU << 27) | (ERR_INJ_IMTU << 28) |\
       (ERR_INJ_IMDU << 29) | (ERR_INJ_ENB << 31))
#endif

#ifndef CERER_CWQL2ND
#define  CERER_CWQL2ND		0
#endif

#ifndef CERER_CWQL2U
#define  CERER_CWQL2U           0
#endif

#ifndef CERER_CWQL2C
#define  CERER_CWQL2C           0
#endif

#ifndef CERER_MAL2ND
#define  CERER_MAL2ND           0
#endif

#ifndef CERER_MAL2U
#define  CERER_MAL2U		0 
#endif

#ifndef CERER_MAL2C
#define  CERER_MAL2C		0           
#endif

#ifndef CERER_TCCU
#define  CERER_TCCU			0           
#endif

#ifndef CERER_TCCD
#define  CERER_TCCD          		0 
#endif

#ifndef CERER_MAMU
#define  CERER_MAMU			0           
#endif

#ifndef CERER_SBDPU_SBDIOU
#define  CERER_SBDPU_SBDIOU           0
#endif

#ifndef CERER_SBDPC
#define  CERER_SBDPC			0          
#endif

#ifndef CERER_DCDP
#define  CERER_DCDP			0          
#endif

#ifndef CERER_DCTM
#define  CERER_DCTM			0          
#endif

#ifndef CERER_DCTP
#define  CERER_DCTP			0          
#endif

#ifndef CERER_DCVP
#define  CERER_DCVP			0          
#endif

#ifndef CERER_ICDP
#define  CERER_ICDP			0          
#endif

#ifndef CERER_ICTM
#define  CERER_ICTM			0          
#endif

#ifndef CERER_ICTP
#define  CERER_ICTP			0          
#endif

#ifndef CERER_ICVP
#define  CERER_ICVP			0          
#endif

#ifndef CERER_L2ND
#define  CERER_L2ND			0          
#endif

#ifndef CERER_L2U
#define  CERER_L2U			0          
#endif

#ifndef CERER_L2C
#define  CERER_L2C			0          
#endif

#ifndef CERER_SBAPP
#define  CERER_SBAPP			0          
#endif

#ifndef CERER_TCUP
#define  CERER_TCUP			0          
#endif

#ifndef CERER_TCCP
#define  CERER_TCCP			0          
#endif

#ifndef CERER_SCAU
#define  CERER_SCAU			0          
#endif

#ifndef CERER_SCAC
#define  CERER_SCAC			0          
#endif

#ifndef CERER_TSAU
#define  CERER_TSAU			0          
#endif

#ifndef CERER_TSAC
#define  CERER_TSAC			0          
#endif

#ifndef CERER_MRAU
#define  CERER_MRAU			0          
#endif

#ifndef CERER_SBDLU
#define  CERER_SBDLU			0          
#endif

#ifndef CERER_SBDLC
#define  CERER_SBDLC			0          
#endif

#ifndef CERER_DCL2ND
#define  CERER_DCL2ND		0
#endif

#ifndef CERER_DCL2U
#define  CERER_DCL2U           0
#endif

#ifndef CERER_DCL2C
#define  CERER_DCL2C           0
#endif

#ifndef CERER_DTDP
#define  CERER_DTDP           0
#endif

#ifndef CERER_DTTM
#define  CERER_DTTM           0
#endif

#ifndef CERER_DTTP
#define  CERER_DTTP           0
#endif

#ifndef CERER_FRF
#define  CERER_FRF           0
#endif

#ifndef CERER_IRF
#define  CERER_IRF           0
#endif

#ifndef CERER_ICL2ND
#define  CERER_ICL2ND		0
#endif

#ifndef CERER_ICL2U
#define  CERER_ICL2U           0
#endif

#ifndef CERER_ICL2C
#define  CERER_ICL2C           0
#endif

#ifndef CERER_HWTWL2
#define  CERER_HWTWL2           0
#endif

#ifndef CERER_HWTWMU
#define  CERER_HWTWMU           0
#endif

#ifndef CERER_ITTM
#define  CERER_ITTM           0
#endif

#ifndef CERER_ITDP
#define  CERER_ITDP           0
#endif

#ifndef CERER_ITTP
#define  CERER_ITTP           0
#endif

#define CERER_ENB (\
	CERER_CWQL2ND | CERER_CWQL2U | CERER_CWQL2C  |\
       CERER_MAL2ND  | CERER_MAL2U  | CERER_MAL2C |\
       CERER_TCCU  | CERER_TCCD | CERER_MAMU |\
       CERER_SBDPU_SBDIOU  | CERER_SBDPC | CERER_DCDP |\
       CERER_DCTM | CERER_DCTP  | CERER_DCVP  |\
       CERER_ICDP | CERER_ICTM  | CERER_ICTP  |\
       CERER_ICVP | CERER_L2ND  | CERER_L2U  |\
       CERER_L2C  | CERER_SBAPP  | CERER_TCUP |\
       CERER_TCCP | CERER_SCAU  | CERER_SCAC |\
       CERER_TSAU | CERER_TSAC  | CERER_MRAU |\
       CERER_SBDLU | CERER_SBDLC | CERER_DCL2ND |\
       CERER_DCL2U | CERER_DCL2C | CERER_DTDP  |\
       CERER_DTTM  | CERER_DTTP  | CERER_FRF  |\
       CERER_IRF  | CERER_ICL2ND  | CERER_ICL2U  |\
       CERER_ICL2C | CERER_HWTWL2 | CERER_HWTWMU |\
       CERER_ITTM  | CERER_ITDP  | CERER_ITTP)

#if (CERER_ENB == 0x0)
#define CERER_DATA 0xecf5c1f3f8bfffff
#else
#define CERER_DATA (\
	CERER_CWQL2ND | (CERER_CWQL2U << 1) | (CERER_CWQL2C << 2) |\
       (CERER_MAL2ND << 3) | (CERER_MAL2U << 4) | (CERER_MAL2C << 5) |\
       (CERER_TCCU << 6) | (CERER_TCCD << 7) | (CERER_MAMU << 8) |\
       (CERER_SBDPU_SBDIOU << 9) | (CERER_SBDPC << 10) | (CERER_DCDP << 11) |\
       (CERER_DCTM << 12) | (CERER_DCTP << 13) | (CERER_DCVP << 14) |\
       (CERER_ICDP << 15) | (CERER_ICTM << 16) | (CERER_ICTP << 17) |\
       (CERER_ICVP << 18) | (CERER_L2ND << 19) | (CERER_L2U << 20) |\
       (CERER_L2C << 21) | (CERER_SBAPP << 23) | (CERER_TCUP << 27) |\
       (CERER_TCCP << 28) | (CERER_SCAU << 29) | (CERER_SCAC << 30) |\
       (CERER_TSAU << 31) | (CERER_TSAC << 32) | (CERER_MRAU << 33) |\
       (CERER_SBDLU << 36) | (CERER_SBDLC << 37) | (CERER_DCL2ND << 38) |\
       (CERER_DCL2U << 39) | (CERER_DCL2C << 40) | (CERER_DTDP << 46) |\
       (CERER_DTTM << 47) | (CERER_DTTP << 48) | (CERER_FRF << 50) |\
       (CERER_IRF << 52) | (CERER_ICL2ND << 53) | (CERER_ICL2U << 54) |\
       (CERER_ICL2C << 55) | (CERER_HWTWL2 << 58) | (CERER_HWTWMU << 59) |\
       (CERER_ITTM << 61) | (CERER_ITDP << 62) | (CERER_ITTP << 63))
#endif



#ifndef CETER_PSCCE
#define  CETER_PSCCE           1
#endif

#ifndef CETER_DE
#define  CETER_DE	       1	
#endif

#ifndef CETER_DHCCE
#define  CETER_DHCCE           1
#endif

#ifndef CETER_DATA
#define CETER_DATA (\
	CETER_DHCCE | (CETER_DE << 1) | (CETER_PSCCE << 2)) 
#endif

#ifdef INC_SOC_ERR_TRAPS
#define H_HT0_Sw_Recoverable_Error_0x40  Soc_Recoverable_Sw_error_trap
#define H_HT0_Hw_Corrected_Error_0x63    Soc_Corrected_Hw_error_trap
#define H_HT0_Data_access_error_0x32     Soc_Precise_data_access_error_trap
#endif


#ifdef INC_ERR_TRAPS
#define H_HT0_Instruction_Access_MMU_Error_0x71 inst_access_mmu_error_handler
#define H_HT0_Instruction_access_error_0x0a inst_access_error_handler
#ifndef H_HT0_Internal_Processor_Error_0x29
#define H_HT0_Internal_Processor_Error_0x29 int_proc_err_handler
#endif
#define H_HT0_Data_Access_MMU_Error_0x72 data_access_mmu_error_handler
#define H_HT0_Data_access_error_0x32 data_access_error_handler
#define H_HT0_Hw_Corrected_Error_0x63 hw_corrected_error_handler
#define H_HT0_Sw_Recoverable_Error_0x40 sw_recoverable_error_handler
#define H_HT0_Store_Error_0x07 store_error_handler
#endif

#define	ISFSR_ITTM	0x1
#define	ISFSR_ITTP	0x2
#define	ISFSR_ITDP	0x3
#define	ISFSR_ITMU	0x4
#define	ISFSR_ITL2U	0x5
#define	ISFSR_ITL2ND	0x6
#define	ISFSR_ICL2U	0x1
#define	ISFSR_ICL2ND	0x2

#define	DSFSR_IRFU	0x1
#define	DSFSR_IRFC	0x2
#define	DSFSR_FRFU	0x3
#define	DSFSR_FRFC	0x4
#define	DSFSR_SBDLC	0x5
#define	DSFSR_SBDLU	0x6
#define	DSFSR_MRAU	0x7
#define	DSFSR_TSAC	0x8
#define	DSFSR_TSAU	0x9
#define	DSFSR_SCAC	0x10
#define	DSFSR_SCAU	0x11
#define	DSFSR_TCCP	0x12
#define	DSFSR_TCCU	0x13
#define	DSFSR_DTTM	0x1
#define	DSFSR_DTTP	0x2
#define	DSFSR_DTDP	0x3
#define	DSFSR_DTMU	0x4
#define	DSFSR_DTL2U	0x5
#define	DSFSR_DTL2ND	0x6
#define	DSFSR_DCL2U	0x1
#define	DSFSR_DCL2ND	0x2
#define	DSFSR_SOCC	0x3
#define	DSFSR_SOCU	0x4

#define	DESR_ICVP	0x1
#define	DESR_ICTP	0x2
#define	DESR_ICTM	0x3
#define	DESR_ICDP	0x4
#define	DESR_DCVP	0x5
#define	DESR_DCTP	0x6
#define	DESR_DCTM	0x7
#define	DESR_DCDP	0x8
#define	DESR_HCE_L2C	0x9
#define	DESR_SBDPC	0xa
#define	DESR_SBDPU	0x6
#define	DESR_TCCD	0xd
#define	DESR_TCCU	0xe
#define	DESR_MAMU	0x7
#define	DESR_MAL2C	0x8
#define	DESR_MAL2U	0x9
#define	DESR_MAL2ND	0xa
#define	DESR_CWQL2C	0xb
#define	DESR_CWQL2U	0xc
#define	DESR_CWQL2ND	0xd
#define	DESR_L2U	0x10
#define	DESR_L2ND	0x11
#define	DESR_ITL2C	0x1
#define	DESR_ICL2C	0x2
#define	DESR_DTL2C	0x3
#define	DESR_DCL2C	0x4
#define	DESR_SOCC	0x12
#define	DESR_SOCU	0x13
#define	DESR_SRE_L2C	0x14

#define	DFESR_USER_PRIV	0x00
#define	DFESR_SUP_PRIV	0x1
#define	DFESR_HP_PRIV	0x2

#define  ASI_NUCLEUS_QUAD_LDD   0x24
#define  ASI_SEI                0x43
#define  ASI_LSU_CONTROL        0x45
#define  ASI_DCACHE_DATA        0x46
#define  ASI_DCACHE_TAG         0x47
#define  ASI_SEE                0x4B
#define  ASI_SES                0x4C
#define  ASI_SEA                0x4D
#define  ASI_ITLB_DATA_ACCESS   0x55
#define  ASI_ITLB_TAG_READ      0x56
#define  ASI_DMMU               0x58
#define  ASI_DTLB_DATA_ACCESS   0x5D
#define  ASI_DTLB_TAG_READ      0x5E
#define  ASI_ICACHE_INSTR       0x66
#define  ASI_ICACHE_TAG         0x67
#define  ASI_PRIMARY            0x80

#define  VA_ASI_ITLB_TAG_ACCESS 0x30
#define  VA_ASI_DTLB_TAG_ACCESS 0x30

#define  SEI_EN                 31
#define  SEI_SSHOT              30
#define  SEI_IMD                29
#define  SEI_IMT                28
#define  SEI_DMD                27
#define  SEI_DMT                26
#define  SEI_IRF                25
#define  SEI_FRF                24

#define  SES_INIT_VALUE         0x10000000
#define  SES_MEU                31
#define  SES_MEC                30
#define  SES_IMDU               25
#define  SES_IMTU               24
#define  SES_DMDU               23
#define  SES_DMTU               22
#define  SES_IDC                21
#define  SES_ITC                20
#define  SES_DDC                19
#define  SES_DTC                18
#define  SES_IRC                17
#define  SES_IRU                16
#define  SES_FRC                15
#define  SES_FRU                14
#define  SES_LDAU               13
#define  SES_NCU                12
#define  SES_DMSU               11
#define  SES_MAU                 9

#define  TT_Instruction_Access_Error    0xa
#define  TT_FP_Exception_Other          0x22
#define  TT_Internal_Processor_Error    0x29
#define  TT_Data_Access_Error           0x32
#define  TT_Corrected_ECC               0x63
#define  TT_Sw_Correctable_ECC          0x40
#define  TT_Fast_IMMU_Miss              0x64
#define  TT_MA_Interrupt                0x74
#define  TT_Data_Error                  0x78

#define  EXECUTED               0xeeced

#define  L2CS_PA0               0xA900000000
#define  L2CS_PA1               0xB900000000

#define  L2EE_PA0               0xAA00000000
#define  L2EE_PA1               0xBA00000000
#define  L2ES_PA0               0xAB00000000
#define  L2ES_PA1               0xBB00000000
#define  L2EA_PA0               0xAC00000000
#define  L2EA_PA1               0xBC00000000
#define  L2EI_PA0               0xAD00000000
#define  L2EI_PA1               0xBD00000000

#define  L2ES_MEU               63
#define  L2ES_MEC               62
#define  L2ES_RW                61
#define  L2ES_MODA              60
#define  L2ES_VCID              54
#define  L2ES_TID               L2ES_VCID
#define  L2ES_LDAC              53
#define  L2ES_LDAU              52
#define  L2ES_LDWC              51
#define  L2ES_LDWU              50
#define  L2ES_LDRC              49
#define  L2ES_LDRU              48
#define  L2ES_LDSC              47
#define  L2ES_LDSU              46
#define  L2ES_LTC               45
#define  L2ES_LRF               44
#define  L2ES_LRU               L2ES_LRF
#define  L2ES_LVF               43
#define  L2ES_LVU               L2ES_LVF
#define  L2ES_DAC               42
#define  L2ES_DAU               41
#define  L2ES_DRC               40
#define  L2ES_DRU               39
#define  L2ES_DSC               38
#define  L2ES_DSU               37
#define  L2ES_VEC               36
#define  L2ES_VEU               35
#define  L2ES_LVC               34

#define  DRAM_CSR_STEP          4096
#define  DRAM_ES_PA             0x8400000280
#define  DRAM_EI_PA             0x8400000290

#define  DRAM_EI_ENB            31
#define  DRAM_EI_SSHOT          30

#define  DRAM_ES_MEU            63
#define  DRAM_ES_MEC            62
#define  DRAM_ES_DAC            61
#define  DRAM_ES_DAU            60
#define  DRAM_ES_DSC            59
#define  DRAM_ES_DSU            58
#define  DRAM_ES_DBU            57

#define  DRAM_ES_MEB            56
#define  DRAM_ES_FBU            55
#define  DRAM_ES_FBR            54


#define  JBI_ERR_INJECT         0x8000004800
#define  JBI_ERR_CONFIG         0x8000010000
#define  JBI_ERROR_LOG          0x8000010020
#define  JBI_ERROR_OVF          0x8000010028
#define  JBI_LOG_ENB            0x8000010030
#define  JBI_SIG_ENB            0x8000010038
#define  JBI_TRANS_TIMEOUT      0x8000010090

#define  IOB_INT_MAN_ERR        0x9800000008
#define  IOB_INT_CTL_ERR        0x9800000408
#define  IOB_RESET_STATUS       0x9800000810

#define  JBI_ERR_APAR           28
#define  JBI_ERR_DPAR_WR        15
#define  JBI_ERR_DPAR_RD        14
#define  JBI_ERR_REP_UE         12
#define  JBI_ERR_NONEX_RD       8
#define  JBI_ERR_READ_TO        5

#define  SSI_TIMEOUT            0xff00010088
#define  SSI_LOG                0xff00000018

#define SOC_ESR_REG      0x8000003000
#define SOC_ELE_REG      0x8000003008
#define SOC_EIE_REG      0x8000003010
#define SOC_EJR_REG      0x8000003018
#define SOC_FEE_REG      0x8000003020
#define SOC_PER_REG      0x8000003028
#define SOC_SII_SYN_REG  0x8000003030
#define SOC_NCU_SYN_REG  0x8000003038

#define	SiiNiuCtagUe	0
#define SiiDmuCtagUe	1
#define SiiNiuCtagCe    2
#define SiiDmuCtagCe    3
#define SiiNiuAParity	4
#define SiiDmuDParity	5
#define SiiNiuDParity	6
#define SiiDmuAParity	7
#define DmuInternal	8
#define DmuNcuCredit	9
#define DmuCtagCe	10
#define DmuCtagUe	11
#define DmuSiiCredit	12
#define DmuDataParity	13
#define	NcuDataParity	14
#define	NcuMondoTable	15
#define NcuMondoFifo	16
#define NcuIntTable	17
#define NcuPcxData	18
#define NcuPcxUe	19
#define NcuCpxUe	20
#define NcuDmuUe	21
#define NcuCtagUe	22
#define NcuCtagCe	23
#define TestMode	24
#define SioCtagUe	25
#define SioCtagCe	26
#define NiuCtagCe	27
#define NiuCtagUe       28
#define NiuDataParity	29
#define Mcu0Fbu         30
#define Mcu0Fbr		31
#define Mcu0Ecc         32
#define Mcu1Fbu         33
#define Mcu1Fbr         34
#define Mcu1Ecc         35
#define Mcu2Fbu         36
#define Mcu2Fbr         37
#define Mcu2Ecc         38
#define Mcu3Fbu         39
#define Mcu3Fbr         40
#define Mcu3Ecc         41
#define NcuDmuCredit	42

#define SOC_SII_ERR_SYND_REG		0x8000003030
#define SOC_NCU_ERR_SYND_REG            0x8000003038



#define DRAM_ERR_ADDR_REG_PA_0    0x8400000288
#define DRAM_ERR_ADDR_REG_PA_1    0x8400001288
#define DRAM_ERR_ADDR_REG_PA_2    0x8400002288
#define DRAM_ERR_ADDR_REG_PA_3    0x8400003288

#define DRAM_ERR_CNT_REG_PA_0     0x8400000298
#define DRAM_ERR_CNT_REG_PA_1     0x8400001298   
#define DRAM_ERR_CNT_REG_PA_2     0x8400002298   
#define DRAM_ERR_CNT_REG_PA_3     0x8400003298   

#define DRAM_FBR_CNT_REG_PA_0	0x8400000c10
#define DRAM_FBR_CNT_REG_PA_1   0x8400001c10   
#define DRAM_FBR_CNT_REG_PA_2   0x8400002c10   
#define DRAM_FBR_CNT_REG_PA_3   0x8400003c10   

#define DRAM_FBD_ERR_SYND_REG_PA_0	0x8400000c00
#define DRAM_FBD_ERR_SYND_REG_PA_1	0x8400001c00
#define DRAM_FBD_ERR_SYND_REG_PA_2	0x8400002c00
#define DRAM_FBD_ERR_SYND_REG_PA_3	0x8400003c00
	

#define DRAM_FBD_INJ_ERR_SRC_REG_PA_0   0x8400000c08
#define DRAM_FBD_INJ_ERR_SRC_REG_PA_1   0x8400001c08 
#define DRAM_FBD_INJ_ERR_SRC_REG_PA_2   0x8400002c08 
#define DRAM_FBD_INJ_ERR_SRC_REG_PA_3   0x8400003c08 

#endif /* __ERR_DEFINES_H__ */
