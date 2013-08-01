/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: tso_n2_prod_cons_intr3.s
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
#define MAIN_PAGE_HV_ALSO
#define BUFFERSIZE                      64  /*in bytes*/
#define myIdReg                         %o0
#define phyCoreIdReg                    %o1
#define thrdIdReg                       %o2
#define ITERATIONS 	  		0x4
#define bufferSizeReg                   %g1
#define prodCntReg                      %g2
#define consCntReg                      %g3
#define ASI_SWVR_UDB_INTR_W             0x73
#define ASI_SWVR_UDB_INTR_R             0x74

#define H_HT0_Interrupt_0x60
#define My_HT0_Interrupt_0x60 \
	call My_interrupt_0x60_handler; \
	nop; \
	nop; \
	nop; 

#include "hboot.s"

.global main

main:  
       ta T_CHANGE_HPRIV ! change to hyper mode
       nop
       mov BUFFERSIZE,  %g1                !Bounded Buffer Size
       mov ITERATIONS,  prodCntReg       !no of iterations to produce
       mov ITERATIONS,  consCntReg       !no of iterations to produce
       setx boundedBufferSize, %g5, %g6
       mov  0x40, %g7
       st   %g7, [%g6]
       setx prodCnt, %g5, %g6
       mov  0x04, %g7
       st   %g7, [%g6]
       setx consCnt, %g5, %g6
       mov  0x04, %g7
       st   %g7, [%g6]
       setx consumedData, %g5, %g6
       mov  0x0, %g7
       st   %g7, [%g6]
       setx producedData, %g5, %g6
       mov  0x0, %g7
       st   %g7, [%g6]


th_fork(th_main,%l0)

! Some of the threads are producers, some are consumers
! A pair of producer and consumer has the same ID.
!=====================================================
th_main_0:
        add     %g0, 0x1, myIdReg			! this is my ID address
        add     %g0, 0x0, phyCoreIdReg
        add     %g0, 0x0, thrdIdReg
	ba	producer
	nop

th_main_1:
        add     %g0, 0x1, myIdReg
        add     %g0, 0x0, phyCoreIdReg
        add     %g0, 0x1, thrdIdReg
	ba	consumer
	nop

th_main_2:
        add     %g0, 0x3, myIdReg
        add     %g0, 0x0, phyCoreIdReg
        add     %g0, 0x2, thrdIdReg
!	ba	producer
!	nop
        call    goodEnd
        nop 

th_main_3:
        add     %g0, 0x2, myIdReg
        add     %g0, 0x0, phyCoreIdReg
        add     %g0, 0x3, thrdIdReg
!	ba	producer
!	nop
        call    goodEnd
        nop 

th_main_4:
        add     %g0, 0x0, myIdReg
        add     %g0, 0x0, phyCoreIdReg
        add     %g0, 0x4, thrdIdReg
!	ba	consumer
!	nop
        call    goodEnd
        nop 

th_main_5:
        add     %g0, 0x1, myIdReg
        add     %g0, 0x0, phyCoreIdReg
        add     %g0, 0x5, thrdIdReg
!	ba	producer
!	nop
        call    goodEnd
        nop 

th_main_6:
        add     %g0, 0x3, myIdReg
        add     %g0, 0x0, phyCoreIdReg
        add     %g0, 0x6, thrdIdReg
!	ba	consumer
!	nop
        call    goodEnd
        nop 

th_main_7:
        add     %g0, 0x2, myIdReg
        add     %g0, 0x0, phyCoreIdReg
        add     %g0, 0x7, thrdIdReg
!	ba	consumer
!	nop
        call    goodEnd
        nop 

goodEnd:
       ta T_GOOD_TRAP

!==============================================================
!Producer code
!==============================================================
producer:
nop
wakeProducer:
setx prodCnt , %l0, %l2
lduw [%l2], %l3
subcc %l3, 0x1, %l3
subcc %l3, %g0, %g0
bz    productionComplete
st    %l3, [%l2]

call  produceData     !will produce one set of data
nop

!dispatch interrupt
   setx	0x102, %g6, %g7			! send to thread 1 vector number 1
   stxa	%g7, [%g0]ASI_SWVR_UDB_INTR_W   ! no membar sync needed after this reg


snoozeProducer:
   setx consumedData, %l0, %l2
   lduw [%l2], %l4
   subcc %l4, 1, %l4
   bz,a    wakeProducer
   st   %g0, [%l2]
   ba   snoozeProducer
   nop 

productionComplete:
   ta T_GOOD_TRAP

!produce data function
produceData:
   save
!find the buffer size
   setx dataBufferBase, %l0, %l1
   setx boundedBufferSize    , %l0, %l2
   lduw [%l2]       , %l0      !has buffer size
   mov  %g0, %l4
!pair id available in global myIdReg
   umul %i0, %l0, %l3
   add  %l3, %l1, %l1            !has the base addr for this pair 

dataProduction:
   mov  %i0, %l5                 !after save o0 becomes i0
   sllx %l5, 16, %l5
   or   %l5, %l4, %l5
   stx  %l5, [%l1 + %l4]
   subcc %l4, %l0, %g0
   add   %l4, 8, %l4
   bnz,a   dataProduction 
   ldx  [%l1 + %l4], %g0
dataProductionDone:
   restore
   retl
   nop


!==============================================================
!ConsumerCode:
!==============================================================
consumer:
nop
snoozeConsumer:
   setx producedData, %l0, %l2
   lduw [%l2], %l4
   subcc %l4, 1, %l4
   bz,a    wakeConsumer
   st   %g0, [%l2]
   ba   snoozeConsumer
   nop 
  
wakeConsumer:
   setx consCnt , %l0, %l2
   lduw [%l2], %l3
   subcc %l3, 0x1, %l3
   subcc %l3, 0x1, %g0
   bz    consumeComplete
   st    %l3, [%l2]
       
   call  consumeData
   nop

!dispacth interrrupt to producer
   mov	0x001, %g7			! send to thread 0 vector number 1
   stxa	%g7, [%g0]ASI_SWVR_UDB_INTR_W   ! no membar sync needed after this reg

   ba    snoozeConsumer
   nop
consumeComplete:
   mov	0x001, %g7			! send to thread 0 vector number 1
   stxa	%g7, [%g0]ASI_SWVR_UDB_INTR_W   ! no membar sync needed after this reg
   ta    T_GOOD_TRAP

!consume data function
consumeData:
   save
!find the buffer size
   setx dataBufferBase, %l0, %l1
   setx boundedBufferSize    , %l0, %l2
   lduw [%l2]       , %l0      !has buffer size
   mov  %g0, %l4
!pair id available in global myIdReg
   umul %i0, %l0, %l3
   add  %l3, %l1, %l1            !has the base addr for this pair 

consumingData:
   mov  %i0, %l5
   sllx %l5, 16, %l5
   or   %l5, %l4, %l5
   ldx  [%l1 + %l4], %l6
   subcc %l6, %l5, %l6
   bnz   badDataConsumed
   nop
   subcc %l4, %l0, %g0
   add   %l4, 0x8, %l4
   bnz,a   consumingData 
   ldx  [%l1 + %l4], %g0
consumeDone:
   restore
   retl
   nop

badDataConsumed:
   ta T_BAD_TRAP


!==============================================================
!interrupt handler
!==============================================================
.global My_interrupt_0x60_handler
My_interrupt_0x60_handler:
!First figure out wether the consumer interrupting producer
!or Producer interrupting Consumer
!if the vector is 1 then consumer interrupting producer
!if the vector is 2 then producer interrupting consumer
!In interrupts Interrupt Globals are used IG

!read the ASI_SWVR_UDB_INTR_R ASI=0x74 VA=0x0
      ldxa [%g0]0x74, %g1
      subcc %g1, 0x1, %g0
      bz    consumerToProducer
      nop
      subcc %g1, 0x2, %g0
      bz    producerToConsumer
consumerToProducer:
      setx consumedData, %l0, %g2
      mov  0x1, %g3
      st   %g3, [%g2]
      ba   returnToSnooze
      nop

producerToConsumer:
      setx producedData, %l0, %g2
      mov  0x1, %g3
      st   %g3, [%g2]
      ba   returnToSnooze
      nop

returnToSnooze:
      retry
      nop

!===============================================================
SECTION .MY_DATA0  TEXT_VA=0xf0100000, DATA_VA=0xd0100000
attr_data {
        Name = .MY_DATA0,
        VA= 0x0d0100000
        RA= 0x1d0100000
        PA= ra2pa(0x1d0100000,0),
        part_0_ctx_nonzero_tsb_config_0,
        TTE_G=1, TTE_Context=0x44, TTE_V=1, TTE_Size=0, TTE_NFO=0,
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
        TTE_L=0, TTE_CP=1, TTE_CV=1, TTE_E=0, TTE_P=0, TTE_W=1
        }

attr_text {
        Name = .MY_DATA0,
        VA= 0x0f0100000
        RA= 0x1f0100000
        PA= ra2pa(0x1f0100000,0),
        part_0_ctx_nonzero_tsb_config_0,
        TTE_G=1, TTE_Context=0x44, TTE_V=1, TTE_Size=0, TTE_NFO=0,
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
        TTE_L=0, TTE_CP=1, TTE_CV=1, TTE_E=0, TTE_P=0, TTE_W=1
        }


	.data
.global parameters
parameters:
	.word 0x0
.global boundedBufferSize
boundedBufferSize:
	.word 0x40
.global prodCnt
prodCnt:
	.word 0x4
.global consCnt 
consCnt: 
	.word 0x4
.global consumedData 
consumedData:
        .word 0x0
.global producedData
producedData:
        .word 0x0
strnId0:
	.word 0x1
strnId1:
	.word 0x1
strnId2:
	.word 0x0
strnId3:
	.word 0x0
strnId4:
	.word 0x0
strnId5:
	.word 0x0
strnId6:
	.word 0x0
strnId7:
	.word 0x0
	.word 0x0
	.word 0x0
	.word 0x0
	.word 0x0
	.word 0x0
	.word 0x0
	.word 0x0
	.word 0x0
	.word 0x0
	.word 0x0
	.word 0x0
	.word 0x0
	.word 0x0
	.word 0x0
	.word 0x0
	.word 0x0
	.word 0x0
	.word 0x0
	.word 0x0
	.word 0x0
	.word 0x0
	.word 0x0
	.word 0x0
	.word 0x0
	.word 0x0
	.word 0x0
	.word 0x0
	.word 0x0
	.word 0x0
	.word 0x0
	.word 0x0
	.word 0x0
	.word 0x0
	.word 0x0
	.word 0x0
	.word 0x0
	.word 0x0
	.word 0x0
	.word 0x0
	.word 0x0
	.word 0x0
	.word 0x0
	.word 0x0
	.word 0x0
	.word 0x0
	.word 0x0
	.word 0x0
	.word 0x0
	.word 0x0
	.word 0x0
	.word 0x0
	.word 0x0
	.word 0x0
	.word 0x0
	.word 0x0
	.word 0x0
	.word 0x0
	.word 0x0
	.word 0x0
	.word 0x0
	.word 0x0
	.word 0x0
	.word 0x0
	.word 0x0
	.word 0x0
	.word 0x0
	.word 0x0
	.word 0x0
	.word 0x0
	.word 0x0
	.word 0x0

SECTION .MY_DATA1  TEXT_VA=0xf1110000, DATA_VA=0xd1110000
attr_data {
        Name = .MY_DATA1,
        VA= 0x0d1110000,
        RA= 0x1d1110000,
        PA= ra2pa(0x1d1110000,0),
        part_0_ctx_nonzero_tsb_config_0,
        TTE_G=1, TTE_Context=0x44, TTE_V=1, TTE_Size=0, TTE_NFO=0,
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
        TTE_L=0, TTE_CP=1, TTE_CV=1, TTE_E=0, TTE_P=0, TTE_W=1
        }

attr_text {
        Name = .MY_DATA1,
        VA= 0x0f1110000,
        RA= 0x1f1110000,
        PA= ra2pa(0x1f1110000,0),
        part_0_ctx_nonzero_tsb_config_0,
        TTE_G=1, TTE_Context=0x44, TTE_V=1, TTE_Size=0, TTE_NFO=0,
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
        TTE_L=0, TTE_CP=1, TTE_CV=1, TTE_E=0, TTE_P=0, TTE_W=1
        }


	.data
.global dataBufferBase
dataBufferBase:
	.word	0xbeef
	.skip 0x1000
	.word	0xbeef
.end
