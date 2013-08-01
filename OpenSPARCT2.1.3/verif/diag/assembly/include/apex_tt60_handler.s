/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: apex_tt60_handler.s
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
#define MONDO_DATA0_OFF 0x00
#define MONDO_DATA1_OFF 0x08
        
#define IMAP_REG_OFF    0x10
#define ICLR_REG_OFF    0x18        

#define INT_THREAD_OFF  0x20        
#define INT_TICK_OFF    0x28        
        
#define INT_COUNT_OFF   0x30        
#define DEV_STATUS_OFF  0x38        
#define INT_ACK_OFF     0x3C        
        
#define INT_DATA_OFF    0x800       
#define INT_DATA_SIZE   0x40        

/* Misc defines ... */        
#define TT60_CNT_OFF    0x00       

#define N2TH_MASK       0x3f       

#define PEP_INO_MASK    0x03     
#define INT_INO_MASK    0x3f     
        
#define PEP_CSR_BASE    0xc800000100        
#define PEP_CSR_SIZE    0x100        
#define PEP_INTx_ACK    0x08                    

#define BOBO_INT_BASE   0x07000                 
#define BOBO_ENG_BASE   0x10000                  
#define BOBO_ENG_SIZE   0x2000                
#define BOBO_INTx_ACK   0x01                    
                        
#define PIU_MEM64_ADR   0x0000008000002010 
#define PIU_MEM64_MSK   0x0000000fff000000

#define PIU_CSR_BASE    0x0000008800000000         
#define PIU_IMU_ELOG    0x0000000000631010         
#define PIU_MMU_ELOG    0x0000000000641010         
#define PIU_ILU_ELOG    0x0000000000651010         
#define PIU_PEU_OLOG    0x0000000000681010         
#define PIU_PEU_ELOG    0x0000000000691010         
#define PIU_INT_STAT    0x000000000060b000         
        
#define PEP_INT_ACK_OFF 0x24             
#define PEP_STAT_OFF    0x14                    

#define BOBO_INT_ACK_OFF 0x00             
#define BOBO_STAT_OFF    0x70                    

        
SECTION .HTRAPS
.text
.global apex_tt60
/*
   g1 = vector 
   g2 = tick     
*/        
apex_tt60:

apex_decode_vector:                     
        cmp     %g1, 21                     ! IO_MONDO
        be      apex_int_vector
        cmp     %g1, 62                     ! ERR_MONDO
        be      apex_err_vector
        nop           
        ba      apex_bad_vector
        nop       
                
apex_int_vector:          
#ifdef NCX_ALIAS_BUG
        ldxa    [%g0] ASI_INTR_ID, %g7          ! Get the thread number in %g7
        sllx    %g7, 3, %g7
        best_set_reg(MONDO_INT_DATA1, %g4, %g3)
        add     %g7, %g3, %g3        
        ldx     [%g3], %g6
        best_set_reg(MONDO_INT_DATA0, %g4, %g3)
        add     %g7, %g3, %g3     
        ldx     [%g3], %g7
#else        
        best_set_reg(MONDO_INT_ADATA1, %g4, %g3)
        ldx     [%g3], %g6
        best_set_reg(MONDO_INT_ADATA0, %g4, %g3)
        ldx     [%g3], %g7
#endif
        and     %g7, INT_INO_MASK, %g4                                           
        cmp     %g4, 24
        bl      apex_tt60_intx                  ! 20, 21, 22, 23 are INTA, B, C, D
        
        sllx    %g4, 3, %g4                     ! s/b int_play2 interrupt, just clear it.
        setx    0x8800601400, %g3, %g2        
        add     %g2, %g4, %g2              
        stx     %g0, [%g2]                      ! clr bridge int state machine
        b       apex_tt60_clr_busy
        nop
        
apex_tt60_intx:                 
        setx    (pep_ctl_base + INT_DATA_OFF), %g4, %g3     
        and     %g7, PEP_INO_MASK, %g4          ! Low order bits of INO are engine #

/* The following code gets the node ID and adds it to the   */
/* index of the interrupt control structure (INO).             */        
/* We assume a max of 4 interrupt control structures per node. */  
#if (NODE_COUNT > 1)
#ifdef  NCX_SYS_MODE_BUG      
        mov     0xa9, %g1
        sllx    %g1, 32, %g1    
        ldx     [%g1], %g1     
        srlx    %g1, 21, %g1         
        and     %g1, 0x0c, %g1                 
        add     %g4, %g1, %g4      
#else        
        mov     0x81, %g1
        sllx    %g1, 32, %g1            
        add     %g1, 8, %g1 
        ldx     [%g1], %g1
        srlx    %g1, 2, %g1     
        and     %g1, 0x0c, %g1           
        add     %g4, %g1, %g4      
#endif        
#endif        
        
        mulx    %g4, INT_DATA_SIZE, %g4        
        add     %g4, %g3, %g3                   ! %g3 is base of interrupt control struct (ic).
        
        stx     %g7, [%g3+MONDO_DATA0_OFF]
        stx     %g6, [%g3+MONDO_DATA1_OFF]
        stx     %g2, [%g3+INT_TICK_OFF]           
         
        ldxa    [%g0] ASI_INTR_ID, %g1          ! Get the thread number in %g1
        stx     %g1, [%g3+INT_THREAD_OFF]        

        best_set_reg(PIU_MEM64_ADR, %g4, %g2)   
        ldx     [%g2], %g2              
        sllx    %g2, 28, %g2
        srlx    %g2, 60, %g2
        or      %g2, 0xc0, %g2
        sllx    %g2, 32, %g2                    ! %g2 has regbase now
        ldx     [%g3+MONDO_DATA0_OFF], %g4
        and     %g4, PEP_INO_MASK, %g4          ! Low order bits of INO are engine #        
        
#if UBOBO
        setx    BOBO_ENG_BASE, %g1, %g6    
        add     %g2, %g6, %g7                   ! %g7 is bobo engine base       
        setx    BOBO_ENG_SIZE, %g1, %g6        
        mulx    %g4, %g6, %g6        
        add     %g7, %g6, %g7                   ! %g7 is bobo csr base for this engine          
        add     %g7, BOBO_STAT_OFF, %g1
#else        
        inc     %g4                             ! Pep 0 csr is at 0x100
        mulx    %g4, PEP_CSR_SIZE, %g6        
        add     %g6, %g2, %g7                   ! %g7 is pep csr base for this engine
        add     %g7, PEP_STAT_OFF, %g1
#endif        

        lduwa   [%g1] 0x0c, %g4                 ! get status (ASI_NL)     
        stw     %g4, [%g3+DEV_STATUS_OFF]                

        ldx     [%g3+MONDO_DATA0_OFF], %g4
        and     %g4, PEP_INO_MASK, %g4          ! Low order bits of INO are engine            

#if UBOBO 
        setx    BOBO_INT_BASE, %g1, %g6    
        add     %g2, %g6, %g7                   ! %g7 is bobo int array base        
        mov     BOBO_INTx_ACK, %g5
        sllx    %g5, %g4, %g5          
        add     %g7, BOBO_INT_ACK_OFF, %g1
        stwa    %g5, [%g1] 0x0c                 ! write pep intx ack (ASI_NL)     
        mov     PEP_INTx_ACK, %g5
        srlx    %g5, %g4, %g5                   ! INTx ack based on INO/Eng              
#else                        
        mov     PEP_INTx_ACK, %g5
        srlx    %g5, %g4, %g5                   ! INTx ack based on INO/Eng        
        add     %g7, PEP_INT_ACK_OFF, %g1
        stwa    %g5, [%g1] 0x0c                 ! write pep intx ack (ASI_NL)     
#endif
        
        setx    (PIU_CSR_BASE + PIU_INT_STAT), %g4, %g6                    
        ldx     [%g6], %g4      
deassert_loop:          
        andcc   %g5, %g4, %g0
        bnz     deassert_loop        
        ldx     [%g6], %g4              
        
        ldx     [%g3+ICLR_REG_OFF], %g2
        stx     %g0, [%g2]                      ! clr bridge int state machine
                        
apex_tt60exit:  
        ldx     [%g3+INT_COUNT_OFF], %g2
        add     %g2, 1, %g2
        stx     %g2, [%g3+INT_COUNT_OFF]        ! This causes pep to be unlocked.

apex_tt60_clr_busy:             
#ifdef NCX_ALIAS_BUG        
        best_set_reg(MONDO_INT_BUSY, %g4, %g3) 
        ldxa    [%g0] ASI_INTR_ID, %g7          ! Get the thread number in %g7
        sllx    %g7, 3, %g7
        add     %g7, %g3, %g3
#else                
        best_set_reg(MONDO_INT_ABUSY, %g4, %g3) 
#endif
        stx     %g0, [%g3]                      ! clr mondo busy
        retry    

#if 0
MMU_ERR_RW1C_ALIAS                                 (8800641018) == 00000000-00000000
IMU_ICS_IMU_LOGGED_ERROR_STATUS_REG_RW1C_ALIAS     (8800631018) == 00000000-00000000
ILU_CIB_ILU_LOG_ERR_RW1C_ALIAS                     (8800651018) == 00000000-00000000
ILU_CIB_PEC_EN_ERR                                 (8800651808) == 00000000-00000000
TLU_CTB_TLR_OE_ERR_RW1C_ALIAS                      (8800681018) == 00000000-00000000
TLU_CTB_TLR_UE_ERR_RW1C_ALIAS                      (8800691018) == 00000000-00000000
TLU_CTB_TLR_CE_ERR_RW1C_ALIAS                      (88006a1018) == 00000000-00000000
TLU_CTB_TLR_EVENT_ERR_STS_CLR_RW1C_ALIAS           (88006e2120) == 00000000-07014001
#endif
        
apex_err_vector:              
        setx    PIU_CSR_BASE, %g4, %g3         
        
        setx    PIU_IMU_ELOG, %g4, %g2
        ldx     [%g3+%g2], %g4

        setx    PIU_MMU_ELOG, %g4, %g2
        ldx     [%g3+%g2], %g4

        setx    PIU_ILU_ELOG, %g4, %g2
        ldx     [%g3+%g2], %g4

        setx    PIU_PEU_OLOG, %g4, %g2
        ldx     [%g3+%g2], %g4

        setx    PIU_PEU_ELOG, %g4, %g2
        ldx     [%g3+%g2], %g4
                
        ta      T_BAD_TRAP
        nop
                
apex_bad_vector:        
        ta      T_BAD_TRAP
        nop
        
