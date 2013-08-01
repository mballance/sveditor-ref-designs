/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: aes_kat_ctr.s
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
#include "hboot.s"
#define NUM_MODE_PATTERNS 5
#define NUM_PATTERNS 3*NUM_MODE_PATTERNS
	
/************************************************************************
   Test case code start
 ************************************************************************/

.text
.global main

main:		/* test begin */
        !# Switch to hpriv mode
	ta T_CHANGE_HPRIV

	
	!# Execute Main Diag ..
	!# setup ASI register to point to SPU
        wr %g0, 0x40, %asi
	
	!# Make sure CWQ is currently disabled, not busy, not terminated, no protocol error; else fail
	ldxa [%g0 + ASI_SPU_CWQ_CSR] %asi, %l1
	and %l1, 0xf, %l2
	cmp %g0, %l2
	bne,pn %xcc, fail
	nop 

	!# allocate control word queue (e.g., setup head/tail/first/last registers)
	!# %l6  CWQ_BASE
	setx CWQ_BASE, %g1, %l6
		
	!# write base addr to first, head, and tail ptr
	!# first store to first
	stxa	%l6, [%g0 + ASI_SPU_CWQ_FIRST] %asi 
        ldxa	[%g0 + ASI_SPU_CWQ_FIRST] %asi, %l1
	!# Mask off upper 16 bits
	setx 0x0000ffffffffffff, %l5, %l0
	and %l0, %l6, %l2
	cmp	%l1, %l2
	bne,pn %xcc,	fail
	nop

	!# then to head
	stxa	%l6, [%g0 + ASI_SPU_CWQ_HEAD] %asi 
        ldxa	[%g0 + ASI_SPU_CWQ_HEAD] %asi, %l1
	cmp	%l1, %l2
	bne,pn %xcc,	fail
	nop
	
	!# then to tail
	stxa	%l6, [%g0 + ASI_SPU_CWQ_TAIL] %asi 
        ldxa	[%g0 + ASI_SPU_CWQ_TAIL] %asi, %l1
	cmp	%l1, %l2
	bne,pn %xcc,	fail
	nop
	
	!# then end of CWQ region to LAST
	setx CWQ_LAST, %g1, %l5
	stxa	%l5, [%g0 + ASI_SPU_CWQ_LAST] %asi 
        ldxa	[%g0 + ASI_SPU_CWQ_LAST] %asi, %l1

	!# Mask off upper 16 bits
	and	%l0, %l5, %l2
	cmp	%l1, %l2
	bne,pn %xcc,	fail
	nop

	setx	0x0080000000000000, %l1, %g4  !# Encrypt/Decrypt flag (bit in CWQ)
	setx plaintext_128, %g1, %l2
	setx plaintext_addr, %g1, %l1
	stx  %l2, [%l1]
	setx ciphertext_128, %g1, %l2
	setx ciphertext_addr, %g1, %l1
	stx  %l2, [%l1]

	mov  0, %g5 !# Encrypt/Decrypt counter
encrypt_decrypt_loop:			
	mov 0, %i4 !# Loop counter
	mov 0, %i5 !# For plaintext/cipher/iv offset
	mov 0, %i7 !# For key offset
	mov 0, %g3 !# index
	
kat_loop:			
	!# Build the first control word, for the first AES vector.
	!# First build up word 0
	!# For AES, set op = 64, Enc=1, SOB=EOB=1, SFAS=0, Int=CoreID=0, AuthType=0, EncType=13, status=0, Len=15
	setx	0x406000001300000f, %l1, %l2
	addcc   %i4, 0-NUM_MODE_PATTERNS, %g0
	addC	0, %g0, %g1	!# Add 1 on 192 bit keys => EncType=17
	addcc	%i4, 0-NUM_MODE_PATTERNS*2, %g0
	addC	0, %g1, %g1	!# Add 2 on 256 bit keys => EncType=1b
	sllx	%g1, 26, %g1
	or	%l2, %g1, %l2
	or	%l2, %g4, %l2

	!# %l6 points to CWQ_BASE
	!# Note:	All CWQ entry addresses must be physical!
	stx	%l2, [%l6 + 0x0]

		
	!# Write source address to next CW field
	setx plaintext_addr, %g1, %l2
	ldx	[%l2], %l2
	add     %i5, %l2, %l2
	stx	%l2, [%l6+0x8]

	!# Write 0's to the next 3 CW fields as they are not used
	stx	%g0, [%l6+0x10]
	stx	%g0, [%l6+0x18]
	stx	%g0, [%l6+0x20]

	!# Write address of Encryption key 
	setx aes_key_128, %g1, %o2
	add     %i7, %o2, %o2
	stx	%o2, [%l6 + 0x28] 

	!# Encryption IV
	setx	ctr_iv_128, %g1, %l2
	add	%i5, %l2, %l2
	stx	%l2, [%l6+0x30]

	!# Finally write destination address to last CW field
	setx result, %g1, %o3
	stx	%o3, [%l6 + 0x38] 

	!# Make sure all these stores get to memory before we start
	membar #Sync

	!# Now add 1 (actually 8*8B) to tail pointer 
        ldxa	[%g0 + ASI_SPU_CWQ_TAIL] %asi, %l2
	add	%l2, 0x40, %l2
	stxa	%l2, [%g0 + ASI_SPU_CWQ_TAIL] %asi 
        ldxa	[%g0 + ASI_SPU_CWQ_TAIL] %asi, %l1
	cmp	%l1, %l2
	bne,pn %xcc,	fail
	nop
	
	!# Kick off the CWQ operation by writing to the CWQ_CSR
	!# Set the enabled bit and reset the other bits 
	or	%g0, 0x1, %g1
	stxa	%g1,	[%g0 + ASI_SPU_CWQ_CSR] %asi

	!# Try CWQ_SYNC operation...
	ldxa    [%g0 + 0x30] %asi, %l1

	!# Check for protocol error - Riesling should only have busy bit set
	ldxa	[%g0 + ASI_SPU_CWQ_CSR] %asi,	%l1
	
	
	!# check the results...first check the data
       	!# Each AES block is only 16B long (divide by 8 anyway)	
	or %g0, 0x2, %i0
	!# set %l3 to be base address of result area, and
	!# %l4 to be base address of known ciphertext area
	setx	result, %g1, %l3
	setx	ciphertext_addr, %g1, %l4
	ldx	[%l4], %l4
	add	%l4, %i5, %l4
	or	%g0, %g0, %g3
		
more1:
	ldx	[%l3 + %g3], %l1
	ldx	[%l4 + %g3], %l2
	cmp	%l1, %l2
	bne,pn	%xcc, fail
	add	%g3, 0x8, %g3	!# i++
	addcc	%i0, -1, %i0
	bgt	more1
	nop

	add	%l6, 0x40, %l6   !# next CWQ
	add     %i5, 0x10, %i5   !# next pattern
	add	%i4, 1, %i4	 !# loop counter
	
	cmp	%i4, NUM_MODE_PATTERNS
	ble     kat_loop
	add	%i7, 0x10, %i7   !# add offset for 128bit keys in branch delay
	
	add	%i7, 0x10, %i7   !# add offset for 192/256 bit keys (keep them aligned!)
	
	cmp	%i4, NUM_PATTERNS
	bl      kat_loop
	nop

	!# Swap plain/cipher address
	setx plaintext_addr, %g1, %l1
	setx ciphertext_addr, %g1, %l2
	ldx	[%l1], %g1
	ldx	[%l2], %g2
	stx	%g2, [%l1]
	stx	%g1, [%l2]

	setx	0x0080000000000000, %l1, %g1  !# Encrypt/Decrypt flag (bit in CWQ)
	xor	%g1, %g4, %g4
	inc	%g5
	cmp	%g5, 2
	bl	encrypt_decrypt_loop 
	nop	
		
	EXIT_GOOD

fail:
	EXIT_BAD

	
/************************************************************************
   Test case data start
 ************************************************************************/
.data
user_data_start:
scratch_area:

!# temporary area for storing expected result
.align 16
result:	
.xword 0xDEADBEEFDEADBEEF, 0xDEADBEEFDEADBEEF			


	
!# CWQ data area, set aside 512 CW's worth
!# 512*8*8 = 32KB
.align 32*1024
CWQ_BASE:		
.xword 0xAAAAAAAAAAAAAAA
.xword 0xAAAAAAAAAAAAAAA
.xword 0xAAAAAAAAAAAAAAA
.xword 0xAAAAAAAAAAAAAAA
.xword 0xAAAAAAAAAAAAAAA
.xword 0xAAAAAAAAAAAAAAA
.xword 0xAAAAAAAAAAAAAAA
.xword 0xAAAAAAAAAAAAAAA
.align 32*1024
CWQ_LAST:	

.align 16
ciphertext_addr:
.xword 0,0
	
plaintext_addr:	
.xword 0,0		
		
.align 16
plaintext_128:
.xword 0x53696E676C652062, 0x6C6F636B206D7367
.xword 0x0001020304050607, 0x08090A0B0C0D0E0F	
.xword 0x1011121314151617, 0x18191A1B1C1D1E1F
.xword 0x0001020304050607, 0x08090A0B0C0D0E0F
.xword 0x1011121314151617, 0x18191A1B1C1D1E1F
		
plaintext_192:
.xword 0x53696E676C652062, 0x6C6F636B206D7367
.xword 0x0001020304050607, 0x08090A0B0C0D0E0F
.xword 0x1011121314151617, 0x18191A1B1C1D1E1F
.xword 0x0001020304050607, 0x08090A0B0C0D0E0F
.xword 0x1011121314151617, 0x18191A1B1C1D1E1F

plaintext_256:	
.xword 0x53696E676C652062, 0x6C6F636B206D7367
.xword 0x0001020304050607, 0x08090A0B0C0D0E0F
.xword 0x1011121314151617, 0x18191A1B1C1D1E1F
.xword 0x0001020304050607, 0x08090A0B0C0D0E0F
.xword 0x1011121314151617, 0x18191A1B1C1D1E1F
	
.align 16
aes_key_128:
.xword 0xAE6852F8121067CC, 0x4BF7A5765577F39E
.xword 0x7E24067817FAE0D7, 0x43D6CE1F32539163
.xword 0x7E24067817FAE0D7, 0x43D6CE1F32539163
.xword 0x7691BE035E5020A8, 0xAC6E618529F9A0DC
.xword 0x7691BE035E5020A8, 0xAC6E618529F9A0DC
	
aes_key_192:
.xword 0x16AF5B145FC9F579, 0xC175F93E3BFB0EED, 0x863D06CCFDB78515, 0x0
.xword 0x7C5CB2401B3DC33C, 0x19E7340819E0F69C, 0x678C3DB8E6F6A91A, 0x0
.xword 0x7C5CB2401B3DC33C, 0x19E7340819E0F69C, 0x678C3DB8E6F6A91A, 0x0
.xword 0x02BF391EE8ECB159, 0xB959617B0965279B, 0xF59B60A786D3E0FE, 0x0
.xword 0x02BF391EE8ECB159, 0xB959617B0965279B, 0xF59B60A786D3E0FE, 0x0

aes_key_256:
.xword 0x776BEFF2851DB06F, 0x4C8A0542C8696F6C, 0x6A81AF1EEC96B4D3, 0x7FC1D689E6C1C104
.xword 0xF6D66D6BD52D59BB, 0x0796365879EFF886, 0xC66DD51A5B6A9974, 0x4B50590C87A23884
.xword 0xF6D66D6BD52D59BB, 0x0796365879EFF886, 0xC66DD51A5B6A9974, 0x4B50590C87A23884
.xword 0xFF7A617CE69148E4, 0xF1726E2F43581DE2, 0xAA62D9F805532EDF, 0xF1EED687FB54153D
.xword 0xFF7A617CE69148E4, 0xF1726E2F43581DE2, 0xAA62D9F805532EDF, 0xF1EED687FB54153D

.align 16
ciphertext_128:
.xword 0xE4095D4FB7A7B379, 0x2D6175A3261311B8
.xword 0x5104A106168A72D9, 0x790D41EE8EDAD388
.xword 0xEB2E1EFC46DA57C8, 0xFCE630DF9141BE28
.xword 0xC1CF48A89F2FFDD9, 0xCF4652E9EFDB72D7
.xword 0x4540A42BDE6D7836, 0xD59A5CEAAEF31053
	
ciphertext_192:
.xword 0x4B55384FE259C9C8, 0x4E7935A003CBE928
.xword 0x453243FC609B2332, 0x7EDFAAFA7131CD9F
.xword 0x8490701C5AD4A79C, 0xFC1FE0FF42F4FB00
.xword 0x96893FC55E5C722F, 0x540B7DD1DDF7E758
.xword 0xD288BC95C6916588, 0x4536C811662F2188

ciphertext_256:
.xword 0x145AD01DBF824EC7, 0x560863DC71E3E0C0
.xword 0xF05E231B3894612C, 0x49EE000B804EB2A9
.xword 0xB8306B508F839D6A, 0x5530831D9344AF1C
.xword 0xEB6C52821D0BBBF7, 0xCE7594462ACA4FAA
.xword 0xB407DF866569FD07, 0xF48CC0B583D6071F
	
.align 16
ctr_iv_128:
.xword 0x0000003000000000, 0x0000000000000001
.xword 0x006CB6DBC0543B59, 0xDA48D90B00000001
.xword 0x006CB6DBC0543B59, 0xDA48D90B00000002
.xword 0x00E0017B27777F3F, 0x4A1786F000000001
.xword 0x00E0017B27777F3F, 0x4A1786F000000002
		
ctr_iv_192:	
.xword 0x0000004836733C14, 0x7D6D93CB00000001
.xword 0x0096B03B020C6EAD, 0xC2CB500D00000001
.xword 0x0096B03B020C6EAD, 0xC2CB500D00000002
.xword 0x0007BDFD5CBD6027, 0x8DCC091200000001
.xword 0x0007BDFD5CBD6027, 0x8DCC091200000002
	
ctr_iv_256:	
.xword 0x00000060DB5672C9, 0x7AA8F0B200000001
.xword 0x00FAAC24C1585EF1, 0x5A43D87500000001
.xword 0x00FAAC24C1585EF1, 0x5A43D87500000002
.xword 0x001CC5B751A51D70, 0xA1C1114800000001
.xword 0x001CC5B751A51D70, 0xA1C1114800000002	
	
.end
