/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: apex_knobs.h
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
#ifndef GMMU_DS 
#define GMMU_EN 1     /* global IOMMU enable */             
#else
#define GMMU_EN 0 
#endif        

#ifndef MMUC_DS 
#define MMUC_EN 1     /* global iommu cache enable     */
#else
#define MMUC_EN 0 
#endif        

#ifndef GBYP_DS 
#define GBYP_EN 1     /* global bypass enable */                        
#else
#define GBYP_EN 0 
#endif        

#ifndef GINT_DS 
#define GINT_EN 1     /* global completion intx enable */        
#else
#define GINT_EN 0 
#endif        

#ifndef GMSI_DS 
#define GMSI_EN 0     /* global completion msi  enable */
#else
#define GMSI_EN 0 
#endif        

#ifndef GINTF_DS         
#define GINTF_EN 1    /* global interference enable     */
#else
#define GINTF_EN 0 
#endif        

#ifndef GLDST_DS  
#define GLDST_EN 1    /* load store interference enable */
#else
#define GLDST_EN 0 
#endif        

#ifndef GCASA_DS
#define GCASA_EN 0    /* CASA interference in data area enable   */
#else
#define GCASA_EN 1 
#endif        

#ifndef GCAS2_DS
#define GCAS2_EN 0    /* CASA interference adjacent to data area enable */
#else
#define GCAS2_EN 1 
#endif        

#ifndef GL2IF_DS
#define GL2IF_EN 1    /* L2 interference                       enable */
#else
#define GL2IF_EN 0 
#endif        

#ifndef GPIOI_DS
#define GPIOI_EN 1    /* global PIO interference enable   */        
#else
#define GPIOI_EN 0 
#endif        

#ifndef PIO00_DS
#define PIO00_EN 1    /* pio to ncx,ncu,piu csr space enable */
#else
#define PIO00_EN 0 
#endif        

#ifndef PIOCF_DS
#define PIOCF_EN 1    /* pio to IO space enable (config) */        
#else
#define PIOCF_EN 0 
#endif        

#ifndef PIO32_DS
#define PIO32_EN 0    /* pio to IO space enable (mem32) */        
#else
#define PIO32_EN 1 
#endif        

#ifndef PIO64_DS
#define PIO64_EN 1    /* pio to IO space enable (mem64) */        
#else
#define PIO64_EN 0 
#endif        

#ifndef E0IMU_DS     
#define E0IMU_EN 1    /* per engine IOMMU enable                       */
#else
#define E0IMU_EN 0 
#endif        

#ifndef E0PSZ_DS    
#define E0PSZ_EN 1    /* per engine IOMMU page size random selection enable */        
#else
#define E0IMU_EN 0 
#endif        

#ifndef E0BYP_DS            
#define E0BYP_EN 1    /* per engine bypass enable                      */        
#else
#define E0BYP_EN 0 
#endif        

#ifndef E0INT_DS          
#define E0INT_EN 1    /* per engine completion intx enable             */        
#else
#define E0INT_EN 0 
#endif        

#ifndef E0MSI_DS              
#define E0MSI_EN 0    /* per engine completion msi  enable             */        
#else
#define E0MSI_EN 0 
#endif        
             
#ifndef E0PLD_DS              
#define E0PLD_EN 1    /* per engine payload size floor enable          */        
#else
#define E0PLD_EN 0 
#endif        

#ifndef E0FPL_DS              
#define E0FPL_EN 0    /* per engine fixed payload size enable          */        
#else
#define E0FPL_EN 1 
#endif        

#ifndef E0BYC_DS         
#define E0BYC_EN 1    /* per engine byte count floor enable            */        
#else
#define E0BYC_EN 0 
#endif        

#ifndef E0FBC_DS         
#define E0FBC_EN 1    /* per engine fixed byte count enable            */
#else
#define E0FBC_EN 0 
#endif        

#ifndef E0ROF_DS             
#define E0ROF_EN 1    /* per engine random offset    enable            */
#else
#define E0ROF_EN 0 
#endif        


#ifndef E0DOMASK     
#define E0DOMASK 0x7fc /* per engine data offset mask              */
#endif

#ifndef E0RRD_DS 
#define E0RRD_EN 1     /* per engine PIO read return delay floor enable */        
#else
#define E0RRD_EN 0 
#endif        

#ifndef E0DMW_DS         
#define E0DMW_EN 1     /* per engine dma memory write enable            */
#else
#define E0DMW_EN 0 
#endif        

#ifndef E0DMR_DS         
#define E0DMR_EN 1     /* per engine dma memory read enable            */
#else
#define E0DMR_EN 0 
#endif        

#ifndef E0ROP_DS         
#define E0ROP_EN 1     /* per engine random operation selection        */
#else
#define E0ROP_EN 0 
#endif        

#ifndef E0FIT_DS         
#define E0FIT_EN 0     /* user specified fixed interrupt thread        */
#else
#define E0FIT_EN 1 
#endif        

#ifndef E0M64_DS     
#define E0M64_EN 1     /* mem64 memory block enable         */
#else
#define E0M64_EN 0 
#endif        

#ifndef E0M32_DS     
#define E0M32_EN 0     /* mem32 memory block enable         */
#else
#define E0M32_EN 1 
#endif        

#ifndef E0RIT_DS         
#define E0RIT_EN 1     /* per engine random interrupt thread selection        */
#else
#define E0RIT_EN 0 
#endif        

#ifndef TROE_DS         
#define TROE_EN 0      /* tte relaxed ordering enable                         */
#else
#define TROE_EN 1 
#endif        

#ifndef TROR_DS         
#define TROR_EN 1      /* tte relaxed ordering randomize                      */
#else
#define TROR_EN 0 
#endif        

#ifndef E0RRS_DS         
#define E0RRS_EN 0     /* bobo random request size enable                     */
#else
#define E0RRS_EN 1 
#endif        

#ifndef E0RRC_DS         
#define E0RRC_EN 0     /* bobo random request count enable                    */
#else
#define E0RRC_EN 1 
#endif        

#ifndef RREQD_DS         
#define RREQD_EN 0     /* bobo random request delay enable                    */
#else
#define RREQD_EN 1 
#endif        

#ifndef DROE_DS         
#define DROE_EN 0      /* dev relaxed ordering enable                         */
#else
#define DROE_EN 1 
#endif        

#ifndef DROR_DS         
#define DROR_EN 1      /* dev relaxed ordering randomize                      */
#else
#define DROR_EN 0 
#endif        

#ifndef TTEP2_DS     
#define TTEP2_EN  0   /* enable random tte flush           */  
#else
#define TTEP2_EN  1  
#endif        

#ifndef TSBP2_DS     
#define TSBP2_EN  0   /* enable random tte cas             */  
#else
#define TSBP2_EN  1  
#endif        

#ifndef INTP2_DS     
#define INTP2_EN  0   /* enable random io mondos           */  
#else
#define INTP2_EN  1  
#endif        

#ifndef IGNERR_DS     
#define IGNERR_EN  0  /* ignore errors                     */  
#else
#define IGNERR_EN  1  
#endif        

#ifndef E0DCP_DS     
#define E0DCP_EN   0  /* enable dma copy operation         */  
#else
#define E0DCP_EN   1  
#endif        

#ifndef HALT_DS     
#define HALT_EN   0   /* enable halt instruction           */  
#else
#define HALT_EN   1  
#endif        

#ifndef BLKLS_DS     
#define BLKLS_EN   0  /* enable block load store           */  
#else
#define BLKLS_EN   1  
#endif        

#ifndef SU4V_DS     
#define SU4V_EN   1   /* enable sun4v mode iommu           */  
#else
#define SU4V_EN   0  
#endif        

#ifndef MPS0_DS     
#define MPS0_EN   1   /* IOMMU TTE page size 0 (8K)   enable */  
#else
#define MPS0_EN   0  
#endif        

#ifndef MPS1_DS     
#define MPS1_EN   1   /* IOMMU TTE page size 1 (64K)   enable */  
#else
#define MPS1_EN   0  
#endif        

#ifndef MPS3_DS     
#define MPS3_EN   1   /* IOMMU TTE page size 3 (4M)   enable */  
#else
#define MPS3_EN   0  
#endif        

#ifndef MPS5_DS     
#define MPS5_EN   1   /* IOMMU TTE page size 5 (256M) enable */  
#else
#define MPS5_EN   0  
#endif        

#ifndef PIODW_DS     
#define PIODW_EN   0  /* PIO double word read/write enable */  
#else
#define PIODW_EN   1  
#endif        

#ifndef PIOWD_DS     
#define PIOWD_EN   1  /* PIO        word read/write enable */  
#else
#define PIOWD_EN   0  
#endif        

#ifndef PIOHW_DS     
#define PIOHW_EN   0  /* PIO  half  word read/write enable */  
#else
#define PIOHW_EN   1  
#endif        

#ifndef PIOBY_DS     
#define PIOBY_EN   0  /* PIO  byte       read/write enable */  
#else
#define PIOBY_EN   1  
#endif        

#ifndef PSHR_DS     
#define PSHR_EN   0   /* Pseudo share interference enable  */  
#else
#define PSHR_EN   1  
#endif        




#ifndef PIORRD 
#define PIORRD 0x0f
#endif

/* 
   Maximum data xfer length must be word aligned & < (0x80000 - (0x2000 + 8)).
   7dff8 or less should work.
*/                
#ifndef LNGTH_MASK
#define LNGTH_MASK 0x3fc
#elif (LNGTH_MASK > 0x3fffc)
#undef LNGTH_MASK
#define LNGTH_MASK  0x3fffc
#endif

#ifndef LNGTH_MIN
#define LNGTH_MIN 0x0800
#elif (LNGTH_MIN < 4)
#undef LNGTH_MIN
#define LNGTH_MIN 4 
#elif (LNGTH_MIN > 0x40000)
#undef LNGTH_MIN
#define LNGTH_MIN 0x40000 
#endif

#ifndef PAYLD_MIN
#define PAYLD_MIN 0x40
#endif

#ifndef DOS_MSK
#define DOS_MSK 0x1ffc
#endif

#ifndef FIX_OFFSET
#define FIX_OFFSET 0x800
#endif

#ifndef FIX_BCNT
#define FIX_BCNT 0x40
#endif

#ifndef SWCHK_DISABLE       
#define SW_CHK_EN 1
#else
#define SW_CHK_EN 0         
#endif

#ifndef CAN_SEL        
#define CAN_SEL 0 
#endif

#ifndef INT_TH         
#define INT_TH 0 
#endif

#ifndef MASK0         
#define MASK0 0 
#endif

#ifndef MASK1         
#define MASK1 0 
#endif

#ifndef REQ_DLY_REG       
#define REQ_DLY_REG 0x000f0000 
#endif

#ifndef PAYLD_MAX
#define PAYLD_MAX 0x80
#endif

#ifndef PAYLD_MSK
#define PAYLD_MSK 0x7f
#endif

#ifndef NU0D         
#define NU0D 0 
#endif

#ifndef NU0E         
#define NU0E 0 
#endif

#ifndef NU0F         
#define NU0F 0 
#endif
















