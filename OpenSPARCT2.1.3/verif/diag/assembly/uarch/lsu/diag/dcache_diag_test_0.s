/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: dcache_diag_test_0.s
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
#define MAIN_PAGE_NUCLEUS_ALSO

#include "hboot.s"

/************************************************************************
   Test case code start
 ************************************************************************/

.text
.global main

main:           /* test begin */

        ta      T_CHANGE_HPRIV

	set	1, %l0
	sllx	%l0, 13, %l0


!! addr = 1f40 (index=116, way=3)  tag = 1d4fbacc  d1 = ef037907cc8e3e22  d2 = e3fec4d26cd15bc
	setx	0x1f40, %i0, %g1
	setx	0x1d4fbacc, %i0, %g2
	stxa	%g2, [%g1] 0x47
	setx	0xef037907cc8e3e22, %i0, %g2
	stxa	%g2, [%g1] 0x46
	add	%g1, 8, %g1
	setx	0xe3fec4d26cd15bc, %i0, %g2
	stxa	%g2, [%g1] 0x46
!! addr = 1d50 (index=85, way=3)  tag = 84a2604  d1 = 22112909f6ee0ffc  d2 = eb2e2bb83d3ada45
	setx	0x1d50, %i0, %g1
	setx	0x84a2604, %i0, %g2
	stxa	%g2, [%g1] 0x47
	setx	0x22112909f6ee0ffc, %i0, %g2
	stxa	%g2, [%g1] 0x46
	add	%g1, 8, %g1
	setx	0xeb2e2bb83d3ada45, %i0, %g2
	stxa	%g2, [%g1] 0x46
!! addr = 1d50  tag = 84a2604  d1 = 22112909f6ee0ffc  d2 = eb2e2bb83d3ada45
	setx	0x1d50, %i0, %g1
	setx	0x84a2604, %i0, %g2
	ldxa	[%g1] 0x47, %l2
	setx	0x7fffffff, %i0, %i1
	and	%i1, %l2, %l2
	cmp	%g2, %l2
	bne	bad_end
	setx	0x22112909f6ee0ffc, %i0, %g3
	or	%g1, %l0, %g1
	ldxa	[%g1] 0x46, %l3
	cmp	%g3, %l3
	bne	bad_end
	add	%g1, 8, %g1
	setx	0xeb2e2bb83d3ada45, %i0, %g4
	ldxa	[%g1] 0x46, %l4
	cmp	%g4, %l4
	bne	bad_end

!! addr = 15d0 (index=93, way=2)  tag = 1c3c3b04  d1 = 65aeb14f11172b65  d2 = 60c82fa0ec040f7c
	setx	0x15d0, %i0, %g1
	setx	0x1c3c3b04, %i0, %g2
	stxa	%g2, [%g1] 0x47
	setx	0x65aeb14f11172b65, %i0, %g2
	stxa	%g2, [%g1] 0x46
	add	%g1, 8, %g1
	setx	0x60c82fa0ec040f7c, %i0, %g2
	stxa	%g2, [%g1] 0x46
!! addr = 6d0 (index=109, way=0)  tag = 415459e  d1 = bf4eff6eaeb6566e  d2 = b49baea772477520
	setx	0x6d0, %i0, %g1
	setx	0x415459e, %i0, %g2
	stxa	%g2, [%g1] 0x47
	setx	0xbf4eff6eaeb6566e, %i0, %g2
	stxa	%g2, [%g1] 0x46
	add	%g1, 8, %g1
	setx	0xb49baea772477520, %i0, %g2
	stxa	%g2, [%g1] 0x46
!! addr = 1d50  tag = 84a2604  d1 = 22112909f6ee0ffc  d2 = eb2e2bb83d3ada45
	setx	0x1d50, %i0, %g1
	setx	0x84a2604, %i0, %g2
	ldxa	[%g1] 0x47, %l2
	setx	0x7fffffff, %i0, %i1
	and	%i1, %l2, %l2
	cmp	%g2, %l2
	bne	bad_end
	setx	0x22112909f6ee0ffc, %i0, %g3
	or	%g1, %l0, %g1
	ldxa	[%g1] 0x46, %l3
	cmp	%g3, %l3
	bne	bad_end
	add	%g1, 8, %g1
	setx	0xeb2e2bb83d3ada45, %i0, %g4
	ldxa	[%g1] 0x46, %l4
	cmp	%g4, %l4
	bne	bad_end

!! addr = 7c0 (index=124, way=0)  tag = a5892ac  d1 = 8f966aaeb8617d10  d2 = 469af987bcd8d082
	setx	0x7c0, %i0, %g1
	setx	0xa5892ac, %i0, %g2
	stxa	%g2, [%g1] 0x47
	setx	0x8f966aaeb8617d10, %i0, %g2
	stxa	%g2, [%g1] 0x46
	add	%g1, 8, %g1
	setx	0x469af987bcd8d082, %i0, %g2
	stxa	%g2, [%g1] 0x46
!! addr = f0 (index=15, way=0)  tag = da19d38  d1 = c69856158cbfa3c8  d2 = 9526e2c632a2769a
	setx	0xf0, %i0, %g1
	setx	0xda19d38, %i0, %g2
	stxa	%g2, [%g1] 0x47
	setx	0xc69856158cbfa3c8, %i0, %g2
	stxa	%g2, [%g1] 0x46
	add	%g1, 8, %g1
	setx	0x9526e2c632a2769a, %i0, %g2
	stxa	%g2, [%g1] 0x46
!! addr = 15d0  tag = 1c3c3b04  d1 = 65aeb14f11172b65  d2 = 60c82fa0ec040f7c
	setx	0x15d0, %i0, %g1
	setx	0x1c3c3b04, %i0, %g2
	ldxa	[%g1] 0x47, %l2
	setx	0x7fffffff, %i0, %i1
	and	%i1, %l2, %l2
	cmp	%g2, %l2
	bne	bad_end
	setx	0x65aeb14f11172b65, %i0, %g3
	or	%g1, %l0, %g1
	ldxa	[%g1] 0x46, %l3
	cmp	%g3, %l3
	bne	bad_end
	add	%g1, 8, %g1
	setx	0x60c82fa0ec040f7c, %i0, %g4
	ldxa	[%g1] 0x46, %l4
	cmp	%g4, %l4
	bne	bad_end

!! addr = 1290 (index=41, way=2)  tag = 1b752fae  d1 = 59136a576c8f2f02  d2 = 63f3eda26bf24875
	setx	0x1290, %i0, %g1
	setx	0x1b752fae, %i0, %g2
	stxa	%g2, [%g1] 0x47
	setx	0x59136a576c8f2f02, %i0, %g2
	stxa	%g2, [%g1] 0x46
	add	%g1, 8, %g1
	setx	0x63f3eda26bf24875, %i0, %g2
	stxa	%g2, [%g1] 0x46
!! addr = 1e20 (index=98, way=3)  tag = 168da546  d1 = 2b4d51f41a09d25b  d2 = 40908291802393ec
	setx	0x1e20, %i0, %g1
	setx	0x168da546, %i0, %g2
	stxa	%g2, [%g1] 0x47
	setx	0x2b4d51f41a09d25b, %i0, %g2
	stxa	%g2, [%g1] 0x46
	add	%g1, 8, %g1
	setx	0x40908291802393ec, %i0, %g2
	stxa	%g2, [%g1] 0x46
!! addr = 15d0  tag = 1c3c3b04  d1 = 65aeb14f11172b65  d2 = 60c82fa0ec040f7c
	setx	0x15d0, %i0, %g1
	setx	0x1c3c3b04, %i0, %g2
	ldxa	[%g1] 0x47, %l2
	setx	0x7fffffff, %i0, %i1
	and	%i1, %l2, %l2
	cmp	%g2, %l2
	bne	bad_end
	setx	0x65aeb14f11172b65, %i0, %g3
	or	%g1, %l0, %g1
	ldxa	[%g1] 0x46, %l3
	cmp	%g3, %l3
	bne	bad_end
	add	%g1, 8, %g1
	setx	0x60c82fa0ec040f7c, %i0, %g4
	ldxa	[%g1] 0x46, %l4
	cmp	%g4, %l4
	bne	bad_end

!! addr = b50 (index=53, way=1)  tag = 2aa4fde  d1 = 306e23b8a45cee56  d2 = 876ccf495a569a38
	setx	0xb50, %i0, %g1
	setx	0x2aa4fde, %i0, %g2
	stxa	%g2, [%g1] 0x47
	setx	0x306e23b8a45cee56, %i0, %g2
	stxa	%g2, [%g1] 0x46
	add	%g1, 8, %g1
	setx	0x876ccf495a569a38, %i0, %g2
	stxa	%g2, [%g1] 0x46
!! addr = 1b10 (index=49, way=3)  tag = 16195dc6  d1 = 18253f3f6bf3f2b8  d2 = 3ce0e1c6ffce428f
	setx	0x1b10, %i0, %g1
	setx	0x16195dc6, %i0, %g2
	stxa	%g2, [%g1] 0x47
	setx	0x18253f3f6bf3f2b8, %i0, %g2
	stxa	%g2, [%g1] 0x46
	add	%g1, 8, %g1
	setx	0x3ce0e1c6ffce428f, %i0, %g2
	stxa	%g2, [%g1] 0x46
!! addr = 1f40  tag = 1d4fbacc  d1 = ef037907cc8e3e22  d2 = e3fec4d26cd15bc
	setx	0x1f40, %i0, %g1
	setx	0x1d4fbacc, %i0, %g2
	ldxa	[%g1] 0x47, %l2
	setx	0x7fffffff, %i0, %i1
	and	%i1, %l2, %l2
	cmp	%g2, %l2
	bne	bad_end
	setx	0xef037907cc8e3e22, %i0, %g3
	or	%g1, %l0, %g1
	ldxa	[%g1] 0x46, %l3
	cmp	%g3, %l3
	bne	bad_end
	add	%g1, 8, %g1
	setx	0xe3fec4d26cd15bc, %i0, %g4
	ldxa	[%g1] 0x46, %l4
	cmp	%g4, %l4
	bne	bad_end

!! addr = bd0 (index=61, way=1)  tag = 90bcaf4  d1 = 5626c8855030e96a  d2 = 3deaea15e69e6bf1
	setx	0xbd0, %i0, %g1
	setx	0x90bcaf4, %i0, %g2
	stxa	%g2, [%g1] 0x47
	setx	0x5626c8855030e96a, %i0, %g2
	stxa	%g2, [%g1] 0x46
	add	%g1, 8, %g1
	setx	0x3deaea15e69e6bf1, %i0, %g2
	stxa	%g2, [%g1] 0x46
!! addr = 1520 (index=82, way=2)  tag = 1e37403c  d1 = 3c46e16b8f765bb0  d2 = 7480bd613942483b
	setx	0x1520, %i0, %g1
	setx	0x1e37403c, %i0, %g2
	stxa	%g2, [%g1] 0x47
	setx	0x3c46e16b8f765bb0, %i0, %g2
	stxa	%g2, [%g1] 0x46
	add	%g1, 8, %g1
	setx	0x7480bd613942483b, %i0, %g2
	stxa	%g2, [%g1] 0x46
!! addr = 1290  tag = 1b752faf  d1 = 59136a576c8f2f02  d2 = 63f3eda26bf24875
	setx	0x1290, %i0, %g1
	setx	0x1b752faf, %i0, %g2
	ldxa	[%g1] 0x47, %l2
	setx	0x7fffffff, %i0, %i1
	and	%i1, %l2, %l2
	cmp	%g2, %l2
	bne	bad_end
	setx	0x59136a576c8f2f02, %i0, %g3
	or	%g1, %l0, %g1
	ldxa	[%g1] 0x46, %l3
	cmp	%g3, %l3
	bne	bad_end
	add	%g1, 8, %g1
	setx	0x63f3eda26bf24875, %i0, %g4
	ldxa	[%g1] 0x46, %l4
	cmp	%g4, %l4
	bne	bad_end

!! addr = 1830 (index=3, way=3)  tag = e35c96  d1 = f6158ad287d9fdb  d2 = b991a1e06f9c3706
	setx	0x1830, %i0, %g1
	setx	0xe35c96, %i0, %g2
	stxa	%g2, [%g1] 0x47
	setx	0xf6158ad287d9fdb, %i0, %g2
	stxa	%g2, [%g1] 0x46
	add	%g1, 8, %g1
	setx	0xb991a1e06f9c3706, %i0, %g2
	stxa	%g2, [%g1] 0x46
!! addr = c00 (index=64, way=1)  tag = 1ebdb1b6  d1 = cf14c32e7700ba54  d2 = c0260b9fd3704aea
	setx	0xc00, %i0, %g1
	setx	0x1ebdb1b6, %i0, %g2
	stxa	%g2, [%g1] 0x47
	setx	0xcf14c32e7700ba54, %i0, %g2
	stxa	%g2, [%g1] 0x46
	add	%g1, 8, %g1
	setx	0xc0260b9fd3704aea, %i0, %g2
	stxa	%g2, [%g1] 0x46
!! addr = 6d0  tag = 415459f  d1 = bf4eff6eaeb6566e  d2 = b49baea772477520
	setx	0x6d0, %i0, %g1
	setx	0x415459f, %i0, %g2
	ldxa	[%g1] 0x47, %l2
	setx	0x7fffffff, %i0, %i1
	and	%i1, %l2, %l2
	cmp	%g2, %l2
	bne	bad_end
	setx	0xbf4eff6eaeb6566e, %i0, %g3
	or	%g1, %l0, %g1
	ldxa	[%g1] 0x46, %l3
	cmp	%g3, %l3
	bne	bad_end
	add	%g1, 8, %g1
	setx	0xb49baea772477520, %i0, %g4
	ldxa	[%g1] 0x46, %l4
	cmp	%g4, %l4
	bne	bad_end

!! addr = 1550 (index=85, way=2)  tag = 4116e4c  d1 = 8b75b2629a78b286  d2 = 9a7902c28f77981a
	setx	0x1550, %i0, %g1
	setx	0x4116e4c, %i0, %g2
	stxa	%g2, [%g1] 0x47
	setx	0x8b75b2629a78b286, %i0, %g2
	stxa	%g2, [%g1] 0x46
	add	%g1, 8, %g1
	setx	0x9a7902c28f77981a, %i0, %g2
	stxa	%g2, [%g1] 0x46
!! addr = d70 (index=87, way=1)  tag = 1fd8f4ca  d1 = 5fad867b5bfc21f6  d2 = 594cbfda79260d5
	setx	0xd70, %i0, %g1
	setx	0x1fd8f4ca, %i0, %g2
	stxa	%g2, [%g1] 0x47
	setx	0x5fad867b5bfc21f6, %i0, %g2
	stxa	%g2, [%g1] 0x46
	add	%g1, 8, %g1
	setx	0x594cbfda79260d5, %i0, %g2
	stxa	%g2, [%g1] 0x46
!! addr = 1830  tag = e35c97  d1 = f6158ad287d9fdb  d2 = b991a1e06f9c3706
	setx	0x1830, %i0, %g1
	setx	0xe35c97, %i0, %g2
	ldxa	[%g1] 0x47, %l2
	setx	0x7fffffff, %i0, %i1
	and	%i1, %l2, %l2
	cmp	%g2, %l2
	bne	bad_end
	setx	0xf6158ad287d9fdb, %i0, %g3
	or	%g1, %l0, %g1
	ldxa	[%g1] 0x46, %l3
	cmp	%g3, %l3
	bne	bad_end
	add	%g1, 8, %g1
	setx	0xb991a1e06f9c3706, %i0, %g4
	ldxa	[%g1] 0x46, %l4
	cmp	%g4, %l4
	bne	bad_end

!! addr = 1b30 (index=51, way=3)  tag = 1434618a  d1 = 8da3a2149025b387  d2 = 92285114943c9f13
	setx	0x1b30, %i0, %g1
	setx	0x1434618a, %i0, %g2
	stxa	%g2, [%g1] 0x47
	setx	0x8da3a2149025b387, %i0, %g2
	stxa	%g2, [%g1] 0x46
	add	%g1, 8, %g1
	setx	0x92285114943c9f13, %i0, %g2
	stxa	%g2, [%g1] 0x46
!! addr = 1bf0 (index=63, way=3)  tag = 4dd9b92  d1 = c5203489c4f11c25  d2 = c833d739c368a074
	setx	0x1bf0, %i0, %g1
	setx	0x4dd9b92, %i0, %g2
	stxa	%g2, [%g1] 0x47
	setx	0xc5203489c4f11c25, %i0, %g2
	stxa	%g2, [%g1] 0x46
	add	%g1, 8, %g1
	setx	0xc833d739c368a074, %i0, %g2
	stxa	%g2, [%g1] 0x46
!! addr = 6d0  tag = 415459f  d1 = bf4eff6eaeb6566e  d2 = b49baea772477520
	setx	0x6d0, %i0, %g1
	setx	0x415459f, %i0, %g2
	ldxa	[%g1] 0x47, %l2
	setx	0x7fffffff, %i0, %i1
	and	%i1, %l2, %l2
	cmp	%g2, %l2
	bne	bad_end
	setx	0xbf4eff6eaeb6566e, %i0, %g3
	or	%g1, %l0, %g1
	ldxa	[%g1] 0x46, %l3
	cmp	%g3, %l3
	bne	bad_end
	add	%g1, 8, %g1
	setx	0xb49baea772477520, %i0, %g4
	ldxa	[%g1] 0x46, %l4
	cmp	%g4, %l4
	bne	bad_end

!! addr = 11d0 (index=29, way=2)  tag = 1b3659ac  d1 = 2beaf27590b4f63d  d2 = 1ad4996f7adf1f17
	setx	0x11d0, %i0, %g1
	setx	0x1b3659ac, %i0, %g2
	stxa	%g2, [%g1] 0x47
	setx	0x2beaf27590b4f63d, %i0, %g2
	stxa	%g2, [%g1] 0x46
	add	%g1, 8, %g1
	setx	0x1ad4996f7adf1f17, %i0, %g2
	stxa	%g2, [%g1] 0x46
!! addr = 1370 (index=55, way=2)  tag = 109b79b6  d1 = c4548dcca151b8b4  d2 = 4875af4fb3b9b082
	setx	0x1370, %i0, %g1
	setx	0x109b79b6, %i0, %g2
	stxa	%g2, [%g1] 0x47
	setx	0xc4548dcca151b8b4, %i0, %g2
	stxa	%g2, [%g1] 0x46
	add	%g1, 8, %g1
	setx	0x4875af4fb3b9b082, %i0, %g2
	stxa	%g2, [%g1] 0x46
!! addr = b50  tag = 2aa4fdf  d1 = 306e23b8a45cee56  d2 = 876ccf495a569a38
	setx	0xb50, %i0, %g1
	setx	0x2aa4fdf, %i0, %g2
	ldxa	[%g1] 0x47, %l2
	setx	0x7fffffff, %i0, %i1
	and	%i1, %l2, %l2
	cmp	%g2, %l2
	bne	bad_end
	setx	0x306e23b8a45cee56, %i0, %g3
	or	%g1, %l0, %g1
	ldxa	[%g1] 0x46, %l3
	cmp	%g3, %l3
	bne	bad_end
	add	%g1, 8, %g1
	setx	0x876ccf495a569a38, %i0, %g4
	ldxa	[%g1] 0x46, %l4
	cmp	%g4, %l4
	bne	bad_end

!! addr = 1ef0 (index=111, way=3)  tag = 12e185f2  d1 = 34077c76f6365f43  d2 = bb6340adf1b1fe89
	setx	0x1ef0, %i0, %g1
	setx	0x12e185f2, %i0, %g2
	stxa	%g2, [%g1] 0x47
	setx	0x34077c76f6365f43, %i0, %g2
	stxa	%g2, [%g1] 0x46
	add	%g1, 8, %g1
	setx	0xbb6340adf1b1fe89, %i0, %g2
	stxa	%g2, [%g1] 0x46
!! addr = 1970 (index=23, way=3)  tag = c511664  d1 = 40a759f92be79db3  d2 = 8f154f7db01757f6
	setx	0x1970, %i0, %g1
	setx	0xc511664, %i0, %g2
	stxa	%g2, [%g1] 0x47
	setx	0x40a759f92be79db3, %i0, %g2
	stxa	%g2, [%g1] 0x46
	add	%g1, 8, %g1
	setx	0x8f154f7db01757f6, %i0, %g2
	stxa	%g2, [%g1] 0x46
!! addr = d70  tag = 1fd8f4cb  d1 = 5fad867b5bfc21f6  d2 = 594cbfda79260d5
	setx	0xd70, %i0, %g1
	setx	0x1fd8f4cb, %i0, %g2
	ldxa	[%g1] 0x47, %l2
	setx	0x7fffffff, %i0, %i1
	and	%i1, %l2, %l2
	cmp	%g2, %l2
	bne	bad_end
	setx	0x5fad867b5bfc21f6, %i0, %g3
	or	%g1, %l0, %g1
	ldxa	[%g1] 0x46, %l3
	cmp	%g3, %l3
	bne	bad_end
	add	%g1, 8, %g1
	setx	0x594cbfda79260d5, %i0, %g4
	ldxa	[%g1] 0x46, %l4
	cmp	%g4, %l4
	bne	bad_end

!! addr = ea0 (index=106, way=1)  tag = 21aeb86  d1 = 791374735a03477  d2 = 913093e62752870f
	setx	0xea0, %i0, %g1
	setx	0x21aeb86, %i0, %g2
	stxa	%g2, [%g1] 0x47
	setx	0x791374735a03477, %i0, %g2
	stxa	%g2, [%g1] 0x46
	add	%g1, 8, %g1
	setx	0x913093e62752870f, %i0, %g2
	stxa	%g2, [%g1] 0x46
!! addr = 710 (index=113, way=0)  tag = 1a5f9e4e  d1 = c3ab80584e61773  d2 = 126fc3e80e70e0a
	setx	0x710, %i0, %g1
	setx	0x1a5f9e4e, %i0, %g2
	stxa	%g2, [%g1] 0x47
	setx	0xc3ab80584e61773, %i0, %g2
	stxa	%g2, [%g1] 0x46
	add	%g1, 8, %g1
	setx	0x126fc3e80e70e0a, %i0, %g2
	stxa	%g2, [%g1] 0x46
!! addr = 1830  tag = e35c97  d1 = f6158ad287d9fdb  d2 = b991a1e06f9c3706
	setx	0x1830, %i0, %g1
	setx	0xe35c97, %i0, %g2
	ldxa	[%g1] 0x47, %l2
	setx	0x7fffffff, %i0, %i1
	and	%i1, %l2, %l2
	cmp	%g2, %l2
	bne	bad_end
	setx	0xf6158ad287d9fdb, %i0, %g3
	or	%g1, %l0, %g1
	ldxa	[%g1] 0x46, %l3
	cmp	%g3, %l3
	bne	bad_end
	add	%g1, 8, %g1
	setx	0xb991a1e06f9c3706, %i0, %g4
	ldxa	[%g1] 0x46, %l4
	cmp	%g4, %l4
	bne	bad_end

!! addr = 1c0 (index=28, way=0)  tag = 663af7e  d1 = 40485a7629ecf6  d2 = 189a58736b07b58e
	setx	0x1c0, %i0, %g1
	setx	0x663af7e, %i0, %g2
	stxa	%g2, [%g1] 0x47
	setx	0x40485a7629ecf6, %i0, %g2
	stxa	%g2, [%g1] 0x46
	add	%g1, 8, %g1
	setx	0x189a58736b07b58e, %i0, %g2
	stxa	%g2, [%g1] 0x46
!! addr = 1e60 (index=102, way=3)  tag = 5df55b2  d1 = acfa6e2634a02885  d2 = 59fd135238ae8a37
	setx	0x1e60, %i0, %g1
	setx	0x5df55b2, %i0, %g2
	stxa	%g2, [%g1] 0x47
	setx	0xacfa6e2634a02885, %i0, %g2
	stxa	%g2, [%g1] 0x46
	add	%g1, 8, %g1
	setx	0x59fd135238ae8a37, %i0, %g2
	stxa	%g2, [%g1] 0x46
!! addr = 1c0  tag = 663af7f  d1 = 40485a7629ecf6  d2 = 189a58736b07b58e
	setx	0x1c0, %i0, %g1
	setx	0x663af7f, %i0, %g2
	ldxa	[%g1] 0x47, %l2
	setx	0x7fffffff, %i0, %i1
	and	%i1, %l2, %l2
	cmp	%g2, %l2
	bne	bad_end
	setx	0x40485a7629ecf6, %i0, %g3
	or	%g1, %l0, %g1
	ldxa	[%g1] 0x46, %l3
	cmp	%g3, %l3
	bne	bad_end
	add	%g1, 8, %g1
	setx	0x189a58736b07b58e, %i0, %g4
	ldxa	[%g1] 0x46, %l4
	cmp	%g4, %l4
	bne	bad_end

!! addr = 810 (index=1, way=1)  tag = 840e0d2  d1 = ad551360f4fb011c  d2 = 6d4e5beee3958a2b
	setx	0x810, %i0, %g1
	setx	0x840e0d2, %i0, %g2
	stxa	%g2, [%g1] 0x47
	setx	0xad551360f4fb011c, %i0, %g2
	stxa	%g2, [%g1] 0x46
	add	%g1, 8, %g1
	setx	0x6d4e5beee3958a2b, %i0, %g2
	stxa	%g2, [%g1] 0x46
!! addr = 15e0 (index=94, way=2)  tag = 8348a56  d1 = ab5439d07e299bb  d2 = 27e0dbb319a45435
	setx	0x15e0, %i0, %g1
	setx	0x8348a56, %i0, %g2
	stxa	%g2, [%g1] 0x47
	setx	0xab5439d07e299bb, %i0, %g2
	stxa	%g2, [%g1] 0x46
	add	%g1, 8, %g1
	setx	0x27e0dbb319a45435, %i0, %g2
	stxa	%g2, [%g1] 0x46
!! addr = 1830  tag = e35c97  d1 = f6158ad287d9fdb  d2 = b991a1e06f9c3706
	setx	0x1830, %i0, %g1
	setx	0xe35c97, %i0, %g2
	ldxa	[%g1] 0x47, %l2
	setx	0x7fffffff, %i0, %i1
	and	%i1, %l2, %l2
	cmp	%g2, %l2
	bne	bad_end
	setx	0xf6158ad287d9fdb, %i0, %g3
	or	%g1, %l0, %g1
	ldxa	[%g1] 0x46, %l3
	cmp	%g3, %l3
	bne	bad_end
	add	%g1, 8, %g1
	setx	0xb991a1e06f9c3706, %i0, %g4
	ldxa	[%g1] 0x46, %l4
	cmp	%g4, %l4
	bne	bad_end

!! addr = 1530 (index=83, way=2)  tag = 129c266  d1 = 7b244a49f22dba88  d2 = 7b5d042ee184584b
	setx	0x1530, %i0, %g1
	setx	0x129c266, %i0, %g2
	stxa	%g2, [%g1] 0x47
	setx	0x7b244a49f22dba88, %i0, %g2
	stxa	%g2, [%g1] 0x46
	add	%g1, 8, %g1
	setx	0x7b5d042ee184584b, %i0, %g2
	stxa	%g2, [%g1] 0x46
!! addr = 1f70 (index=119, way=3)  tag = 5c50588  d1 = 3fa41fb8f6f20a24  d2 = 289f55a0408453fe
	setx	0x1f70, %i0, %g1
	setx	0x5c50588, %i0, %g2
	stxa	%g2, [%g1] 0x47
	setx	0x3fa41fb8f6f20a24, %i0, %g2
	stxa	%g2, [%g1] 0x46
	add	%g1, 8, %g1
	setx	0x289f55a0408453fe, %i0, %g2
	stxa	%g2, [%g1] 0x46
!! addr = b50  tag = 2aa4fdf  d1 = 306e23b8a45cee56  d2 = 876ccf495a569a38
	setx	0xb50, %i0, %g1
	setx	0x2aa4fdf, %i0, %g2
	ldxa	[%g1] 0x47, %l2
	setx	0x7fffffff, %i0, %i1
	and	%i1, %l2, %l2
	cmp	%g2, %l2
	bne	bad_end
	setx	0x306e23b8a45cee56, %i0, %g3
	or	%g1, %l0, %g1
	ldxa	[%g1] 0x46, %l3
	cmp	%g3, %l3
	bne	bad_end
	add	%g1, 8, %g1
	setx	0x876ccf495a569a38, %i0, %g4
	ldxa	[%g1] 0x46, %l4
	cmp	%g4, %l4
	bne	bad_end

!! addr = 11b0 (index=27, way=2)  tag = 19c9504  d1 = 95c6fd4724260415  d2 = da0fdf4e91dc1693
	setx	0x11b0, %i0, %g1
	setx	0x19c9504, %i0, %g2
	stxa	%g2, [%g1] 0x47
	setx	0x95c6fd4724260415, %i0, %g2
	stxa	%g2, [%g1] 0x46
	add	%g1, 8, %g1
	setx	0xda0fdf4e91dc1693, %i0, %g2
	stxa	%g2, [%g1] 0x46
!! addr = 170 (index=23, way=0)  tag = aedfe1c  d1 = 7354bbd382cff13  d2 = 22ea0a95eda861cb
	setx	0x170, %i0, %g1
	setx	0xaedfe1c, %i0, %g2
	stxa	%g2, [%g1] 0x47
	setx	0x7354bbd382cff13, %i0, %g2
	stxa	%g2, [%g1] 0x46
	add	%g1, 8, %g1
	setx	0x22ea0a95eda861cb, %i0, %g2
	stxa	%g2, [%g1] 0x46
!! addr = 6d0  tag = 415459f  d1 = bf4eff6eaeb6566e  d2 = b49baea772477520
	setx	0x6d0, %i0, %g1
	setx	0x415459f, %i0, %g2
	ldxa	[%g1] 0x47, %l2
	setx	0x7fffffff, %i0, %i1
	and	%i1, %l2, %l2
	cmp	%g2, %l2
	bne	bad_end
	setx	0xbf4eff6eaeb6566e, %i0, %g3
	or	%g1, %l0, %g1
	ldxa	[%g1] 0x46, %l3
	cmp	%g3, %l3
	bne	bad_end
	add	%g1, 8, %g1
	setx	0xb49baea772477520, %i0, %g4
	ldxa	[%g1] 0x46, %l4
	cmp	%g4, %l4
	bne	bad_end

!! addr = 1c10 (index=65, way=3)  tag = df9e15e  d1 = 17eeaacbee3c39e1  d2 = 498433a71653aee8
	setx	0x1c10, %i0, %g1
	setx	0xdf9e15e, %i0, %g2
	stxa	%g2, [%g1] 0x47
	setx	0x17eeaacbee3c39e1, %i0, %g2
	stxa	%g2, [%g1] 0x46
	add	%g1, 8, %g1
	setx	0x498433a71653aee8, %i0, %g2
	stxa	%g2, [%g1] 0x46
!! addr = 300 (index=48, way=0)  tag = 1a5a8a6e  d1 = ab391565f51f417  d2 = 198bdd4f8564d615
	setx	0x300, %i0, %g1
	setx	0x1a5a8a6e, %i0, %g2
	stxa	%g2, [%g1] 0x47
	setx	0xab391565f51f417, %i0, %g2
	stxa	%g2, [%g1] 0x46
	add	%g1, 8, %g1
	setx	0x198bdd4f8564d615, %i0, %g2
	stxa	%g2, [%g1] 0x46
!! addr = 15d0  tag = 1c3c3b04  d1 = 65aeb14f11172b65  d2 = 60c82fa0ec040f7c
	setx	0x15d0, %i0, %g1
	setx	0x1c3c3b04, %i0, %g2
	ldxa	[%g1] 0x47, %l2
	setx	0x7fffffff, %i0, %i1
	and	%i1, %l2, %l2
	cmp	%g2, %l2
	bne	bad_end
	setx	0x65aeb14f11172b65, %i0, %g3
	or	%g1, %l0, %g1
	ldxa	[%g1] 0x46, %l3
	cmp	%g3, %l3
	bne	bad_end
	add	%g1, 8, %g1
	setx	0x60c82fa0ec040f7c, %i0, %g4
	ldxa	[%g1] 0x46, %l4
	cmp	%g4, %l4
	bne	bad_end

!! addr = 6c0 (index=108, way=0)  tag = 10c64210  d1 = d6dd4f85d7bbf949  d2 = c098fd047f44e6e
	setx	0x6c0, %i0, %g1
	setx	0x10c64210, %i0, %g2
	stxa	%g2, [%g1] 0x47
	setx	0xd6dd4f85d7bbf949, %i0, %g2
	stxa	%g2, [%g1] 0x46
	add	%g1, 8, %g1
	setx	0xc098fd047f44e6e, %i0, %g2
	stxa	%g2, [%g1] 0x46
!! addr = 1f10 (index=113, way=3)  tag = 5da9264  d1 = cc795ab7ea696b03  d2 = f571d9cca0a91995
	setx	0x1f10, %i0, %g1
	setx	0x5da9264, %i0, %g2
	stxa	%g2, [%g1] 0x47
	setx	0xcc795ab7ea696b03, %i0, %g2
	stxa	%g2, [%g1] 0x46
	add	%g1, 8, %g1
	setx	0xf571d9cca0a91995, %i0, %g2
	stxa	%g2, [%g1] 0x46
!! addr = 11b0  tag = 19c9504  d1 = 95c6fd4724260415  d2 = da0fdf4e91dc1693
	setx	0x11b0, %i0, %g1
	setx	0x19c9504, %i0, %g2
	ldxa	[%g1] 0x47, %l2
	setx	0x7fffffff, %i0, %i1
	and	%i1, %l2, %l2
	cmp	%g2, %l2
	bne	bad_end
	setx	0x95c6fd4724260415, %i0, %g3
	or	%g1, %l0, %g1
	ldxa	[%g1] 0x46, %l3
	cmp	%g3, %l3
	bne	bad_end
	add	%g1, 8, %g1
	setx	0xda0fdf4e91dc1693, %i0, %g4
	ldxa	[%g1] 0x46, %l4
	cmp	%g4, %l4
	bne	bad_end

!! addr = 1290 (index=41, way=2)  tag = 8f2ad9c  d1 = 5c81766736f0ea  d2 = 94445aa4a930b58c
	setx	0x1290, %i0, %g1
	setx	0x8f2ad9c, %i0, %g2
	stxa	%g2, [%g1] 0x47
	setx	0x5c81766736f0ea, %i0, %g2
	stxa	%g2, [%g1] 0x46
	add	%g1, 8, %g1
	setx	0x94445aa4a930b58c, %i0, %g2
	stxa	%g2, [%g1] 0x46
!! addr = 1a40 (index=36, way=3)  tag = 12da416c  d1 = fc0659aa5d53fbe7  d2 = 3880548c6e43543
	setx	0x1a40, %i0, %g1
	setx	0x12da416c, %i0, %g2
	stxa	%g2, [%g1] 0x47
	setx	0xfc0659aa5d53fbe7, %i0, %g2
	stxa	%g2, [%g1] 0x46
	add	%g1, 8, %g1
	setx	0x3880548c6e43543, %i0, %g2
	stxa	%g2, [%g1] 0x46
!! addr = 1d50  tag = 84a2604  d1 = 22112909f6ee0ffc  d2 = eb2e2bb83d3ada45
	setx	0x1d50, %i0, %g1
	setx	0x84a2604, %i0, %g2
	ldxa	[%g1] 0x47, %l2
	setx	0x7fffffff, %i0, %i1
	and	%i1, %l2, %l2
	cmp	%g2, %l2
	bne	bad_end
	setx	0x22112909f6ee0ffc, %i0, %g3
	or	%g1, %l0, %g1
	ldxa	[%g1] 0x46, %l3
	cmp	%g3, %l3
	bne	bad_end
	add	%g1, 8, %g1
	setx	0xeb2e2bb83d3ada45, %i0, %g4
	ldxa	[%g1] 0x46, %l4
	cmp	%g4, %l4
	bne	bad_end

!! addr = f10 (index=113, way=1)  tag = 2cb406c  d1 = e0b648a18e2bb0a1  d2 = 4114633b4c7087e6
	setx	0xf10, %i0, %g1
	setx	0x2cb406c, %i0, %g2
	stxa	%g2, [%g1] 0x47
	setx	0xe0b648a18e2bb0a1, %i0, %g2
	stxa	%g2, [%g1] 0x46
	add	%g1, 8, %g1
	setx	0x4114633b4c7087e6, %i0, %g2
	stxa	%g2, [%g1] 0x46
!! addr = 1bc0 (index=60, way=3)  tag = 1399f87a  d1 = 1b52a7246cfc6514  d2 = e36a2e41aa2d6259
	setx	0x1bc0, %i0, %g1
	setx	0x1399f87a, %i0, %g2
	stxa	%g2, [%g1] 0x47
	setx	0x1b52a7246cfc6514, %i0, %g2
	stxa	%g2, [%g1] 0x46
	add	%g1, 8, %g1
	setx	0xe36a2e41aa2d6259, %i0, %g2
	stxa	%g2, [%g1] 0x46
!! addr = b50  tag = 2aa4fdf  d1 = 306e23b8a45cee56  d2 = 876ccf495a569a38
	setx	0xb50, %i0, %g1
	setx	0x2aa4fdf, %i0, %g2
	ldxa	[%g1] 0x47, %l2
	setx	0x7fffffff, %i0, %i1
	and	%i1, %l2, %l2
	cmp	%g2, %l2
	bne	bad_end
	setx	0x306e23b8a45cee56, %i0, %g3
	or	%g1, %l0, %g1
	ldxa	[%g1] 0x46, %l3
	cmp	%g3, %l3
	bne	bad_end
	add	%g1, 8, %g1
	setx	0x876ccf495a569a38, %i0, %g4
	ldxa	[%g1] 0x46, %l4
	cmp	%g4, %l4
	bne	bad_end

!! addr = 460 (index=70, way=0)  tag = 122c86d4  d1 = 52a79da55500798a  d2 = 203f70eeb40f9c61
	setx	0x460, %i0, %g1
	setx	0x122c86d4, %i0, %g2
	stxa	%g2, [%g1] 0x47
	setx	0x52a79da55500798a, %i0, %g2
	stxa	%g2, [%g1] 0x46
	add	%g1, 8, %g1
	setx	0x203f70eeb40f9c61, %i0, %g2
	stxa	%g2, [%g1] 0x46
!! addr = 1150 (index=21, way=2)  tag = 646c00c  d1 = 4992835a7b2d9b1c  d2 = c3e8bc73feb09a50
	setx	0x1150, %i0, %g1
	setx	0x646c00c, %i0, %g2
	stxa	%g2, [%g1] 0x47
	setx	0x4992835a7b2d9b1c, %i0, %g2
	stxa	%g2, [%g1] 0x46
	add	%g1, 8, %g1
	setx	0xc3e8bc73feb09a50, %i0, %g2
	stxa	%g2, [%g1] 0x46
!! addr = ea0  tag = 21aeb87  d1 = 791374735a03477  d2 = 913093e62752870f
	setx	0xea0, %i0, %g1
	setx	0x21aeb87, %i0, %g2
	ldxa	[%g1] 0x47, %l2
	setx	0x7fffffff, %i0, %i1
	and	%i1, %l2, %l2
	cmp	%g2, %l2
	bne	bad_end
	setx	0x791374735a03477, %i0, %g3
	or	%g1, %l0, %g1
	ldxa	[%g1] 0x46, %l3
	cmp	%g3, %l3
	bne	bad_end
	add	%g1, 8, %g1
	setx	0x913093e62752870f, %i0, %g4
	ldxa	[%g1] 0x46, %l4
	cmp	%g4, %l4
	bne	bad_end

!! addr = b90 (index=57, way=1)  tag = c9f470e  d1 = c35a0b242f520e03  d2 = f0dfd357f0d14d21
	setx	0xb90, %i0, %g1
	setx	0xc9f470e, %i0, %g2
	stxa	%g2, [%g1] 0x47
	setx	0xc35a0b242f520e03, %i0, %g2
	stxa	%g2, [%g1] 0x46
	add	%g1, 8, %g1
	setx	0xf0dfd357f0d14d21, %i0, %g2
	stxa	%g2, [%g1] 0x46
!! addr = 1190 (index=25, way=2)  tag = 13133a26  d1 = d38ea5c1240cd8ce  d2 = a6180db465f26e0
	setx	0x1190, %i0, %g1
	setx	0x13133a26, %i0, %g2
	stxa	%g2, [%g1] 0x47
	setx	0xd38ea5c1240cd8ce, %i0, %g2
	stxa	%g2, [%g1] 0x46
	add	%g1, 8, %g1
	setx	0xa6180db465f26e0, %i0, %g2
	stxa	%g2, [%g1] 0x46
!! addr = f0  tag = da19d38  d1 = c69856158cbfa3c8  d2 = 9526e2c632a2769a
	setx	0xf0, %i0, %g1
	setx	0xda19d38, %i0, %g2
	ldxa	[%g1] 0x47, %l2
	setx	0x7fffffff, %i0, %i1
	and	%i1, %l2, %l2
	cmp	%g2, %l2
	bne	bad_end
	setx	0xc69856158cbfa3c8, %i0, %g3
	or	%g1, %l0, %g1
	ldxa	[%g1] 0x46, %l3
	cmp	%g3, %l3
	bne	bad_end
	add	%g1, 8, %g1
	setx	0x9526e2c632a2769a, %i0, %g4
	ldxa	[%g1] 0x46, %l4
	cmp	%g4, %l4
	bne	bad_end

!! addr = 1540 (index=84, way=2)  tag = 9facb3c  d1 = c256f50eca9681aa  d2 = de96f24e83c7c78d
	setx	0x1540, %i0, %g1
	setx	0x9facb3c, %i0, %g2
	stxa	%g2, [%g1] 0x47
	setx	0xc256f50eca9681aa, %i0, %g2
	stxa	%g2, [%g1] 0x46
	add	%g1, 8, %g1
	setx	0xde96f24e83c7c78d, %i0, %g2
	stxa	%g2, [%g1] 0x46
!! addr = 240 (index=36, way=0)  tag = a711456  d1 = cab08d0f5e37af3d  d2 = c1ec85b629e43204
	setx	0x240, %i0, %g1
	setx	0xa711456, %i0, %g2
	stxa	%g2, [%g1] 0x47
	setx	0xcab08d0f5e37af3d, %i0, %g2
	stxa	%g2, [%g1] 0x46
	add	%g1, 8, %g1
	setx	0xc1ec85b629e43204, %i0, %g2
	stxa	%g2, [%g1] 0x46
!! addr = 1970  tag = c511664  d1 = 40a759f92be79db3  d2 = 8f154f7db01757f6
	setx	0x1970, %i0, %g1
	setx	0xc511664, %i0, %g2
	ldxa	[%g1] 0x47, %l2
	setx	0x7fffffff, %i0, %i1
	and	%i1, %l2, %l2
	cmp	%g2, %l2
	bne	bad_end
	setx	0x40a759f92be79db3, %i0, %g3
	or	%g1, %l0, %g1
	ldxa	[%g1] 0x46, %l3
	cmp	%g3, %l3
	bne	bad_end
	add	%g1, 8, %g1
	setx	0x8f154f7db01757f6, %i0, %g4
	ldxa	[%g1] 0x46, %l4
	cmp	%g4, %l4
	bne	bad_end

!! addr = 1780 (index=120, way=2)  tag = 1a2dab6a  d1 = 7d7c9d95e114095a  d2 = ae83ddecc8af5c48
	setx	0x1780, %i0, %g1
	setx	0x1a2dab6a, %i0, %g2
	stxa	%g2, [%g1] 0x47
	setx	0x7d7c9d95e114095a, %i0, %g2
	stxa	%g2, [%g1] 0x46
	add	%g1, 8, %g1
	setx	0xae83ddecc8af5c48, %i0, %g2
	stxa	%g2, [%g1] 0x46
!! addr = 10d0 (index=13, way=2)  tag = c8af9b2  d1 = b7c2cf381e8615b8  d2 = 6f5cde8237dd55f3
	setx	0x10d0, %i0, %g1
	setx	0xc8af9b2, %i0, %g2
	stxa	%g2, [%g1] 0x47
	setx	0xb7c2cf381e8615b8, %i0, %g2
	stxa	%g2, [%g1] 0x46
	add	%g1, 8, %g1
	setx	0x6f5cde8237dd55f3, %i0, %g2
	stxa	%g2, [%g1] 0x46
!! addr = 1f40  tag = 1d4fbacc  d1 = ef037907cc8e3e22  d2 = e3fec4d26cd15bc
	setx	0x1f40, %i0, %g1
	setx	0x1d4fbacc, %i0, %g2
	ldxa	[%g1] 0x47, %l2
	setx	0x7fffffff, %i0, %i1
	and	%i1, %l2, %l2
	cmp	%g2, %l2
	bne	bad_end
	setx	0xef037907cc8e3e22, %i0, %g3
	or	%g1, %l0, %g1
	ldxa	[%g1] 0x46, %l3
	cmp	%g3, %l3
	bne	bad_end
	add	%g1, 8, %g1
	setx	0xe3fec4d26cd15bc, %i0, %g4
	ldxa	[%g1] 0x46, %l4
	cmp	%g4, %l4
	bne	bad_end

!! addr = 1730 (index=115, way=2)  tag = 6cd1788  d1 = b4f2352a1f2bcb30  d2 = 56fdde8aedbdcf39
	setx	0x1730, %i0, %g1
	setx	0x6cd1788, %i0, %g2
	stxa	%g2, [%g1] 0x47
	setx	0xb4f2352a1f2bcb30, %i0, %g2
	stxa	%g2, [%g1] 0x46
	add	%g1, 8, %g1
	setx	0x56fdde8aedbdcf39, %i0, %g2
	stxa	%g2, [%g1] 0x46
!! addr = 1690 (index=105, way=2)  tag = b1f04d4  d1 = be656971b07079d2  d2 = 271577fb23572d27
	setx	0x1690, %i0, %g1
	setx	0xb1f04d4, %i0, %g2
	stxa	%g2, [%g1] 0x47
	setx	0xbe656971b07079d2, %i0, %g2
	stxa	%g2, [%g1] 0x46
	add	%g1, 8, %g1
	setx	0x271577fb23572d27, %i0, %g2
	stxa	%g2, [%g1] 0x46
!! addr = 460  tag = 122c86d4  d1 = 52a79da55500798a  d2 = 203f70eeb40f9c61
	setx	0x460, %i0, %g1
	setx	0x122c86d4, %i0, %g2
	ldxa	[%g1] 0x47, %l2
	setx	0x7fffffff, %i0, %i1
	and	%i1, %l2, %l2
	cmp	%g2, %l2
	bne	bad_end
	setx	0x52a79da55500798a, %i0, %g3
	or	%g1, %l0, %g1
	ldxa	[%g1] 0x46, %l3
	cmp	%g3, %l3
	bne	bad_end
	add	%g1, 8, %g1
	setx	0x203f70eeb40f9c61, %i0, %g4
	ldxa	[%g1] 0x46, %l4
	cmp	%g4, %l4
	bne	bad_end

!! addr = 1140 (index=20, way=2)  tag = 1f0aa172  d1 = d43fea7d30f8ae8b  d2 = 3b1304c2bde5a783
	setx	0x1140, %i0, %g1
	setx	0x1f0aa172, %i0, %g2
	stxa	%g2, [%g1] 0x47
	setx	0xd43fea7d30f8ae8b, %i0, %g2
	stxa	%g2, [%g1] 0x46
	add	%g1, 8, %g1
	setx	0x3b1304c2bde5a783, %i0, %g2
	stxa	%g2, [%g1] 0x46
!! addr = 1340 (index=52, way=2)  tag = 1ed9b1e4  d1 = c636102f3419cf5b  d2 = 1b1e81eda8de258
	setx	0x1340, %i0, %g1
	setx	0x1ed9b1e4, %i0, %g2
	stxa	%g2, [%g1] 0x47
	setx	0xc636102f3419cf5b, %i0, %g2
	stxa	%g2, [%g1] 0x46
	add	%g1, 8, %g1
	setx	0x1b1e81eda8de258, %i0, %g2
	stxa	%g2, [%g1] 0x46
!! addr = 7c0  tag = a5892ac  d1 = 8f966aaeb8617d10  d2 = 469af987bcd8d082
	setx	0x7c0, %i0, %g1
	setx	0xa5892ac, %i0, %g2
	ldxa	[%g1] 0x47, %l2
	setx	0x7fffffff, %i0, %i1
	and	%i1, %l2, %l2
	cmp	%g2, %l2
	bne	bad_end
	setx	0x8f966aaeb8617d10, %i0, %g3
	or	%g1, %l0, %g1
	ldxa	[%g1] 0x46, %l3
	cmp	%g3, %l3
	bne	bad_end
	add	%g1, 8, %g1
	setx	0x469af987bcd8d082, %i0, %g4
	ldxa	[%g1] 0x46, %l4
	cmp	%g4, %l4
	bne	bad_end

!! addr = bb0 (index=59, way=1)  tag = 14b086ee  d1 = c18afa80b5422c06  d2 = 82cab96cc28d7f8d
	setx	0xbb0, %i0, %g1
	setx	0x14b086ee, %i0, %g2
	stxa	%g2, [%g1] 0x47
	setx	0xc18afa80b5422c06, %i0, %g2
	stxa	%g2, [%g1] 0x46
	add	%g1, 8, %g1
	setx	0x82cab96cc28d7f8d, %i0, %g2
	stxa	%g2, [%g1] 0x46
!! addr = 1bc0 (index=60, way=3)  tag = 11515090  d1 = 7eac7f27f2fda064  d2 = 4c833e29ef1c081
	setx	0x1bc0, %i0, %g1
	setx	0x11515090, %i0, %g2
	stxa	%g2, [%g1] 0x47
	setx	0x7eac7f27f2fda064, %i0, %g2
	stxa	%g2, [%g1] 0x46
	add	%g1, 8, %g1
	setx	0x4c833e29ef1c081, %i0, %g2
	stxa	%g2, [%g1] 0x46
!! addr = 1f70  tag = 5c50588  d1 = 3fa41fb8f6f20a24  d2 = 289f55a0408453fe
	setx	0x1f70, %i0, %g1
	setx	0x5c50588, %i0, %g2
	ldxa	[%g1] 0x47, %l2
	setx	0x7fffffff, %i0, %i1
	and	%i1, %l2, %l2
	cmp	%g2, %l2
	bne	bad_end
	setx	0x3fa41fb8f6f20a24, %i0, %g3
	or	%g1, %l0, %g1
	ldxa	[%g1] 0x46, %l3
	cmp	%g3, %l3
	bne	bad_end
	add	%g1, 8, %g1
	setx	0x289f55a0408453fe, %i0, %g4
	ldxa	[%g1] 0x46, %l4
	cmp	%g4, %l4
	bne	bad_end

!! addr = 1800 (index=0, way=3)  tag = 18c47ba0  d1 = 33f5c06412c31d80  d2 = 492c4da181bb54fa
	setx	0x1800, %i0, %g1
	setx	0x18c47ba0, %i0, %g2
	stxa	%g2, [%g1] 0x47
	setx	0x33f5c06412c31d80, %i0, %g2
	stxa	%g2, [%g1] 0x46
	add	%g1, 8, %g1
	setx	0x492c4da181bb54fa, %i0, %g2
	stxa	%g2, [%g1] 0x46
!! addr = 1300 (index=48, way=2)  tag = 4c1f60a  d1 = 52aac94f7c421d3f  d2 = 12e0d29876fc2d9
	setx	0x1300, %i0, %g1
	setx	0x4c1f60a, %i0, %g2
	stxa	%g2, [%g1] 0x47
	setx	0x52aac94f7c421d3f, %i0, %g2
	stxa	%g2, [%g1] 0x46
	add	%g1, 8, %g1
	setx	0x12e0d29876fc2d9, %i0, %g2
	stxa	%g2, [%g1] 0x46
!! addr = 1520  tag = 1e37403c  d1 = 3c46e16b8f765bb0  d2 = 7480bd613942483b
	setx	0x1520, %i0, %g1
	setx	0x1e37403c, %i0, %g2
	ldxa	[%g1] 0x47, %l2
	setx	0x7fffffff, %i0, %i1
	and	%i1, %l2, %l2
	cmp	%g2, %l2
	bne	bad_end
	setx	0x3c46e16b8f765bb0, %i0, %g3
	or	%g1, %l0, %g1
	ldxa	[%g1] 0x46, %l3
	cmp	%g3, %l3
	bne	bad_end
	add	%g1, 8, %g1
	setx	0x7480bd613942483b, %i0, %g4
	ldxa	[%g1] 0x46, %l4
	cmp	%g4, %l4
	bne	bad_end

!! addr = a10 (index=33, way=1)  tag = e70f320  d1 = a223c5996cc48e14  d2 = 99098abaddb3d8b0
	setx	0xa10, %i0, %g1
	setx	0xe70f320, %i0, %g2
	stxa	%g2, [%g1] 0x47
	setx	0xa223c5996cc48e14, %i0, %g2
	stxa	%g2, [%g1] 0x46
	add	%g1, 8, %g1
	setx	0x99098abaddb3d8b0, %i0, %g2
	stxa	%g2, [%g1] 0x46
!! addr = 16a0 (index=106, way=2)  tag = aa9ef10  d1 = a0c1a8dbb9ae2c7b  d2 = dd4d1728d5fe24da
	setx	0x16a0, %i0, %g1
	setx	0xaa9ef10, %i0, %g2
	stxa	%g2, [%g1] 0x47
	setx	0xa0c1a8dbb9ae2c7b, %i0, %g2
	stxa	%g2, [%g1] 0x46
	add	%g1, 8, %g1
	setx	0xdd4d1728d5fe24da, %i0, %g2
	stxa	%g2, [%g1] 0x46
!! addr = 1290  tag = 8f2ad9c  d1 = 5c81766736f0ea  d2 = 94445aa4a930b58c
	setx	0x1290, %i0, %g1
	setx	0x8f2ad9c, %i0, %g2
	ldxa	[%g1] 0x47, %l2
	setx	0x7fffffff, %i0, %i1
	and	%i1, %l2, %l2
	cmp	%g2, %l2
	bne	bad_end
	setx	0x5c81766736f0ea, %i0, %g3
	or	%g1, %l0, %g1
	ldxa	[%g1] 0x46, %l3
	cmp	%g3, %l3
	bne	bad_end
	add	%g1, 8, %g1
	setx	0x94445aa4a930b58c, %i0, %g4
	ldxa	[%g1] 0x46, %l4
	cmp	%g4, %l4
	bne	bad_end

!! addr = 18f0 (index=15, way=3)  tag = 12d4eae8  d1 = 19e1d1d1340c8a20  d2 = 718d4251db0dbed5
	setx	0x18f0, %i0, %g1
	setx	0x12d4eae8, %i0, %g2
	stxa	%g2, [%g1] 0x47
	setx	0x19e1d1d1340c8a20, %i0, %g2
	stxa	%g2, [%g1] 0x46
	add	%g1, 8, %g1
	setx	0x718d4251db0dbed5, %i0, %g2
	stxa	%g2, [%g1] 0x46
!! addr = 12d0 (index=45, way=2)  tag = 266b1e8  d1 = cd28cf406e437aeb  d2 = c36e66d7496cf23d
	setx	0x12d0, %i0, %g1
	setx	0x266b1e8, %i0, %g2
	stxa	%g2, [%g1] 0x47
	setx	0xcd28cf406e437aeb, %i0, %g2
	stxa	%g2, [%g1] 0x46
	add	%g1, 8, %g1
	setx	0xc36e66d7496cf23d, %i0, %g2
	stxa	%g2, [%g1] 0x46
!! addr = 1bc0  tag = 11515090  d1 = 7eac7f27f2fda064  d2 = 4c833e29ef1c081
	setx	0x1bc0, %i0, %g1
	setx	0x11515090, %i0, %g2
	ldxa	[%g1] 0x47, %l2
	setx	0x7fffffff, %i0, %i1
	and	%i1, %l2, %l2
	cmp	%g2, %l2
	bne	bad_end
	setx	0x7eac7f27f2fda064, %i0, %g3
	or	%g1, %l0, %g1
	ldxa	[%g1] 0x46, %l3
	cmp	%g3, %l3
	bne	bad_end
	add	%g1, 8, %g1
	setx	0x4c833e29ef1c081, %i0, %g4
	ldxa	[%g1] 0x46, %l4
	cmp	%g4, %l4
	bne	bad_end

!! addr = 10e0 (index=14, way=2)  tag = 5a3458  d1 = 91f1fafc1120ef40  d2 = 4b8dde3e52390ecc
	setx	0x10e0, %i0, %g1
	setx	0x5a3458, %i0, %g2
	stxa	%g2, [%g1] 0x47
	setx	0x91f1fafc1120ef40, %i0, %g2
	stxa	%g2, [%g1] 0x46
	add	%g1, 8, %g1
	setx	0x4b8dde3e52390ecc, %i0, %g2
	stxa	%g2, [%g1] 0x46
!! addr = 1920 (index=18, way=3)  tag = f25060  d1 = 26b3533cf7c8b9e  d2 = 2ddbd5e1347a96fa
	setx	0x1920, %i0, %g1
	setx	0xf25060, %i0, %g2
	stxa	%g2, [%g1] 0x47
	setx	0x26b3533cf7c8b9e, %i0, %g2
	stxa	%g2, [%g1] 0x46
	add	%g1, 8, %g1
	setx	0x2ddbd5e1347a96fa, %i0, %g2
	stxa	%g2, [%g1] 0x46
!! addr = b50  tag = 2aa4fdf  d1 = 306e23b8a45cee56  d2 = 876ccf495a569a38
	setx	0xb50, %i0, %g1
	setx	0x2aa4fdf, %i0, %g2
	ldxa	[%g1] 0x47, %l2
	setx	0x7fffffff, %i0, %i1
	and	%i1, %l2, %l2
	cmp	%g2, %l2
	bne	bad_end
	setx	0x306e23b8a45cee56, %i0, %g3
	or	%g1, %l0, %g1
	ldxa	[%g1] 0x46, %l3
	cmp	%g3, %l3
	bne	bad_end
	add	%g1, 8, %g1
	setx	0x876ccf495a569a38, %i0, %g4
	ldxa	[%g1] 0x46, %l4
	cmp	%g4, %l4
	bne	bad_end

!! addr = 8c0 (index=12, way=1)  tag = 1c323ebc  d1 = 86fbb54d24de3c53  d2 = d8a3f09a517a733b
	setx	0x8c0, %i0, %g1
	setx	0x1c323ebc, %i0, %g2
	stxa	%g2, [%g1] 0x47
	setx	0x86fbb54d24de3c53, %i0, %g2
	stxa	%g2, [%g1] 0x46
	add	%g1, 8, %g1
	setx	0xd8a3f09a517a733b, %i0, %g2
	stxa	%g2, [%g1] 0x46
!! addr = 12f0 (index=47, way=2)  tag = ae169cc  d1 = b5c76aa92a2ec7e7  d2 = e4be01c4e32c6f4b
	setx	0x12f0, %i0, %g1
	setx	0xae169cc, %i0, %g2
	stxa	%g2, [%g1] 0x47
	setx	0xb5c76aa92a2ec7e7, %i0, %g2
	stxa	%g2, [%g1] 0x46
	add	%g1, 8, %g1
	setx	0xe4be01c4e32c6f4b, %i0, %g2
	stxa	%g2, [%g1] 0x46
!! addr = 6c0  tag = 10c64210  d1 = d6dd4f85d7bbf949  d2 = c098fd047f44e6e
	setx	0x6c0, %i0, %g1
	setx	0x10c64210, %i0, %g2
	ldxa	[%g1] 0x47, %l2
	setx	0x7fffffff, %i0, %i1
	and	%i1, %l2, %l2
	cmp	%g2, %l2
	bne	bad_end
	setx	0xd6dd4f85d7bbf949, %i0, %g3
	or	%g1, %l0, %g1
	ldxa	[%g1] 0x46, %l3
	cmp	%g3, %l3
	bne	bad_end
	add	%g1, 8, %g1
	setx	0xc098fd047f44e6e, %i0, %g4
	ldxa	[%g1] 0x46, %l4
	cmp	%g4, %l4
	bne	bad_end

!! addr = cc0 (index=76, way=1)  tag = 4996146  d1 = f49fe332dc626174  d2 = f504c3bf345a8a07
	setx	0xcc0, %i0, %g1
	setx	0x4996146, %i0, %g2
	stxa	%g2, [%g1] 0x47
	setx	0xf49fe332dc626174, %i0, %g2
	stxa	%g2, [%g1] 0x46
	add	%g1, 8, %g1
	setx	0xf504c3bf345a8a07, %i0, %g2
	stxa	%g2, [%g1] 0x46
!! addr = 1720 (index=114, way=2)  tag = 11c19d08  d1 = 4443e6d8c4108f56  d2 = 4843e13bd76b57a9
	setx	0x1720, %i0, %g1
	setx	0x11c19d08, %i0, %g2
	stxa	%g2, [%g1] 0x47
	setx	0x4443e6d8c4108f56, %i0, %g2
	stxa	%g2, [%g1] 0x46
	add	%g1, 8, %g1
	setx	0x4843e13bd76b57a9, %i0, %g2
	stxa	%g2, [%g1] 0x46
!! addr = 1780  tag = 1a2dab6b  d1 = 7d7c9d95e114095a  d2 = ae83ddecc8af5c48
	setx	0x1780, %i0, %g1
	setx	0x1a2dab6b, %i0, %g2
	ldxa	[%g1] 0x47, %l2
	setx	0x7fffffff, %i0, %i1
	and	%i1, %l2, %l2
	cmp	%g2, %l2
	bne	bad_end
	setx	0x7d7c9d95e114095a, %i0, %g3
	or	%g1, %l0, %g1
	ldxa	[%g1] 0x46, %l3
	cmp	%g3, %l3
	bne	bad_end
	add	%g1, 8, %g1
	setx	0xae83ddecc8af5c48, %i0, %g4
	ldxa	[%g1] 0x46, %l4
	cmp	%g4, %l4
	bne	bad_end

!! addr = 5a0 (index=90, way=0)  tag = 1e80a514  d1 = fbb0e55fd54b9002  d2 = 520ea45b5893455
	setx	0x5a0, %i0, %g1
	setx	0x1e80a514, %i0, %g2
	stxa	%g2, [%g1] 0x47
	setx	0xfbb0e55fd54b9002, %i0, %g2
	stxa	%g2, [%g1] 0x46
	add	%g1, 8, %g1
	setx	0x520ea45b5893455, %i0, %g2
	stxa	%g2, [%g1] 0x46
!! addr = 1ed0 (index=109, way=3)  tag = df87a7a  d1 = 3d7758346ae347bc  d2 = cfeb944525e43ccd
	setx	0x1ed0, %i0, %g1
	setx	0xdf87a7a, %i0, %g2
	stxa	%g2, [%g1] 0x47
	setx	0x3d7758346ae347bc, %i0, %g2
	stxa	%g2, [%g1] 0x46
	add	%g1, 8, %g1
	setx	0xcfeb944525e43ccd, %i0, %g2
	stxa	%g2, [%g1] 0x46
!! addr = 10d0  tag = c8af9b3  d1 = b7c2cf381e8615b8  d2 = 6f5cde8237dd55f3
	setx	0x10d0, %i0, %g1
	setx	0xc8af9b3, %i0, %g2
	ldxa	[%g1] 0x47, %l2
	setx	0x7fffffff, %i0, %i1
	and	%i1, %l2, %l2
	cmp	%g2, %l2
	bne	bad_end
	setx	0xb7c2cf381e8615b8, %i0, %g3
	or	%g1, %l0, %g1
	ldxa	[%g1] 0x46, %l3
	cmp	%g3, %l3
	bne	bad_end
	add	%g1, 8, %g1
	setx	0x6f5cde8237dd55f3, %i0, %g4
	ldxa	[%g1] 0x46, %l4
	cmp	%g4, %l4
	bne	bad_end

!! addr = 1210 (index=33, way=2)  tag = 93e0f24  d1 = c68eaac38f4b0a98  d2 = 3806cf058034e68a
	setx	0x1210, %i0, %g1
	setx	0x93e0f24, %i0, %g2
	stxa	%g2, [%g1] 0x47
	setx	0xc68eaac38f4b0a98, %i0, %g2
	stxa	%g2, [%g1] 0x46
	add	%g1, 8, %g1
	setx	0x3806cf058034e68a, %i0, %g2
	stxa	%g2, [%g1] 0x46
!! addr = 1e30 (index=99, way=3)  tag = 1642f610  d1 = 3104f47262416d2b  d2 = 2d9f341fc2cabb0
	setx	0x1e30, %i0, %g1
	setx	0x1642f610, %i0, %g2
	stxa	%g2, [%g1] 0x47
	setx	0x3104f47262416d2b, %i0, %g2
	stxa	%g2, [%g1] 0x46
	add	%g1, 8, %g1
	setx	0x2d9f341fc2cabb0, %i0, %g2
	stxa	%g2, [%g1] 0x46
!! addr = 5a0  tag = 1e80a514  d1 = fbb0e55fd54b9002  d2 = 520ea45b5893455
	setx	0x5a0, %i0, %g1
	setx	0x1e80a514, %i0, %g2
	ldxa	[%g1] 0x47, %l2
	setx	0x7fffffff, %i0, %i1
	and	%i1, %l2, %l2
	cmp	%g2, %l2
	bne	bad_end
	setx	0xfbb0e55fd54b9002, %i0, %g3
	or	%g1, %l0, %g1
	ldxa	[%g1] 0x46, %l3
	cmp	%g3, %l3
	bne	bad_end
	add	%g1, 8, %g1
	setx	0x520ea45b5893455, %i0, %g4
	ldxa	[%g1] 0x46, %l4
	cmp	%g4, %l4
	bne	bad_end

!! addr = d10 (index=81, way=1)  tag = 6e36a62  d1 = 7ca6c090e80bf514  d2 = 678945185d5f84b
	setx	0xd10, %i0, %g1
	setx	0x6e36a62, %i0, %g2
	stxa	%g2, [%g1] 0x47
	setx	0x7ca6c090e80bf514, %i0, %g2
	stxa	%g2, [%g1] 0x46
	add	%g1, 8, %g1
	setx	0x678945185d5f84b, %i0, %g2
	stxa	%g2, [%g1] 0x46
!! addr = 1fb0 (index=123, way=3)  tag = 1df5593e  d1 = 13ccc887a110a1f2  d2 = b1a5a344992b618a
	setx	0x1fb0, %i0, %g1
	setx	0x1df5593e, %i0, %g2
	stxa	%g2, [%g1] 0x47
	setx	0x13ccc887a110a1f2, %i0, %g2
	stxa	%g2, [%g1] 0x46
	add	%g1, 8, %g1
	setx	0xb1a5a344992b618a, %i0, %g2
	stxa	%g2, [%g1] 0x46
!! addr = 1800  tag = 18c47ba0  d1 = 33f5c06412c31d80  d2 = 492c4da181bb54fa
	setx	0x1800, %i0, %g1
	setx	0x18c47ba0, %i0, %g2
	ldxa	[%g1] 0x47, %l2
	setx	0x7fffffff, %i0, %i1
	and	%i1, %l2, %l2
	cmp	%g2, %l2
	bne	bad_end
	setx	0x33f5c06412c31d80, %i0, %g3
	or	%g1, %l0, %g1
	ldxa	[%g1] 0x46, %l3
	cmp	%g3, %l3
	bne	bad_end
	add	%g1, 8, %g1
	setx	0x492c4da181bb54fa, %i0, %g4
	ldxa	[%g1] 0x46, %l4
	cmp	%g4, %l4
	bne	bad_end

!! addr = c10 (index=65, way=1)  tag = fdb91a2  d1 = 561862369e6e2492  d2 = 8f2a17d79d6df47d
	setx	0xc10, %i0, %g1
	setx	0xfdb91a2, %i0, %g2
	stxa	%g2, [%g1] 0x47
	setx	0x561862369e6e2492, %i0, %g2
	stxa	%g2, [%g1] 0x46
	add	%g1, 8, %g1
	setx	0x8f2a17d79d6df47d, %i0, %g2
	stxa	%g2, [%g1] 0x46
!! addr = 1be0 (index=62, way=3)  tag = b1bb502  d1 = 91d008a98f97bea4  d2 = cc675d7380c4dbd5
	setx	0x1be0, %i0, %g1
	setx	0xb1bb502, %i0, %g2
	stxa	%g2, [%g1] 0x47
	setx	0x91d008a98f97bea4, %i0, %g2
	stxa	%g2, [%g1] 0x46
	add	%g1, 8, %g1
	setx	0xcc675d7380c4dbd5, %i0, %g2
	stxa	%g2, [%g1] 0x46
!! addr = 1e20  tag = 168da547  d1 = 2b4d51f41a09d25b  d2 = 40908291802393ec
	setx	0x1e20, %i0, %g1
	setx	0x168da547, %i0, %g2
	ldxa	[%g1] 0x47, %l2
	setx	0x7fffffff, %i0, %i1
	and	%i1, %l2, %l2
	cmp	%g2, %l2
	bne	bad_end
	setx	0x2b4d51f41a09d25b, %i0, %g3
	or	%g1, %l0, %g1
	ldxa	[%g1] 0x46, %l3
	cmp	%g3, %l3
	bne	bad_end
	add	%g1, 8, %g1
	setx	0x40908291802393ec, %i0, %g4
	ldxa	[%g1] 0x46, %l4
	cmp	%g4, %l4
	bne	bad_end

!! addr = 11e0 (index=30, way=2)  tag = 106e399e  d1 = 207c89675a14ef71  d2 = 12c89adc313ae945
	setx	0x11e0, %i0, %g1
	setx	0x106e399e, %i0, %g2
	stxa	%g2, [%g1] 0x47
	setx	0x207c89675a14ef71, %i0, %g2
	stxa	%g2, [%g1] 0x46
	add	%g1, 8, %g1
	setx	0x12c89adc313ae945, %i0, %g2
	stxa	%g2, [%g1] 0x46
!! addr = f90 (index=121, way=1)  tag = 1d9ad3e0  d1 = e1c9604bb738e210  d2 = cb0747a973cbe84a
	setx	0xf90, %i0, %g1
	setx	0x1d9ad3e0, %i0, %g2
	stxa	%g2, [%g1] 0x47
	setx	0xe1c9604bb738e210, %i0, %g2
	stxa	%g2, [%g1] 0x46
	add	%g1, 8, %g1
	setx	0xcb0747a973cbe84a, %i0, %g2
	stxa	%g2, [%g1] 0x46
!! addr = 1520  tag = 1e37403c  d1 = 3c46e16b8f765bb0  d2 = 7480bd613942483b
	setx	0x1520, %i0, %g1
	setx	0x1e37403c, %i0, %g2
	ldxa	[%g1] 0x47, %l2
	setx	0x7fffffff, %i0, %i1
	and	%i1, %l2, %l2
	cmp	%g2, %l2
	bne	bad_end
	setx	0x3c46e16b8f765bb0, %i0, %g3
	or	%g1, %l0, %g1
	ldxa	[%g1] 0x46, %l3
	cmp	%g3, %l3
	bne	bad_end
	add	%g1, 8, %g1
	setx	0x7480bd613942483b, %i0, %g4
	ldxa	[%g1] 0x46, %l4
	cmp	%g4, %l4
	bne	bad_end

!! addr = 1ed0 (index=109, way=3)  tag = 16ca3af8  d1 = c5d1fe14f449fd4c  d2 = 4e1439ffffdeb808
	setx	0x1ed0, %i0, %g1
	setx	0x16ca3af8, %i0, %g2
	stxa	%g2, [%g1] 0x47
	setx	0xc5d1fe14f449fd4c, %i0, %g2
	stxa	%g2, [%g1] 0x46
	add	%g1, 8, %g1
	setx	0x4e1439ffffdeb808, %i0, %g2
	stxa	%g2, [%g1] 0x46
!! addr = 6a0 (index=106, way=0)  tag = 871abe6  d1 = ef79422414cf8149  d2 = 2bcf8021953634e2
	setx	0x6a0, %i0, %g1
	setx	0x871abe6, %i0, %g2
	stxa	%g2, [%g1] 0x47
	setx	0xef79422414cf8149, %i0, %g2
	stxa	%g2, [%g1] 0x46
	add	%g1, 8, %g1
	setx	0x2bcf8021953634e2, %i0, %g2
	stxa	%g2, [%g1] 0x46
!! addr = b50  tag = 2aa4fdf  d1 = 306e23b8a45cee56  d2 = 876ccf495a569a38
	setx	0xb50, %i0, %g1
	setx	0x2aa4fdf, %i0, %g2
	ldxa	[%g1] 0x47, %l2
	setx	0x7fffffff, %i0, %i1
	and	%i1, %l2, %l2
	cmp	%g2, %l2
	bne	bad_end
	setx	0x306e23b8a45cee56, %i0, %g3
	or	%g1, %l0, %g1
	ldxa	[%g1] 0x46, %l3
	cmp	%g3, %l3
	bne	bad_end
	add	%g1, 8, %g1
	setx	0x876ccf495a569a38, %i0, %g4
	ldxa	[%g1] 0x46, %l4
	cmp	%g4, %l4
	bne	bad_end

!! addr = e60 (index=102, way=1)  tag = 365c3c  d1 = a68d666dff341701  d2 = 25c3095a35fa656a
	setx	0xe60, %i0, %g1
	setx	0x365c3c, %i0, %g2
	stxa	%g2, [%g1] 0x47
	setx	0xa68d666dff341701, %i0, %g2
	stxa	%g2, [%g1] 0x46
	add	%g1, 8, %g1
	setx	0x25c3095a35fa656a, %i0, %g2
	stxa	%g2, [%g1] 0x46
!! addr = 960 (index=22, way=1)  tag = 63b50aa  d1 = f1a63828feb2779f  d2 = 27722e5ae594dfd5
	setx	0x960, %i0, %g1
	setx	0x63b50aa, %i0, %g2
	stxa	%g2, [%g1] 0x47
	setx	0xf1a63828feb2779f, %i0, %g2
	stxa	%g2, [%g1] 0x46
	add	%g1, 8, %g1
	setx	0x27722e5ae594dfd5, %i0, %g2
	stxa	%g2, [%g1] 0x46
!! addr = f0  tag = da19d38  d1 = c69856158cbfa3c8  d2 = 9526e2c632a2769a
	setx	0xf0, %i0, %g1
	setx	0xda19d38, %i0, %g2
	ldxa	[%g1] 0x47, %l2
	setx	0x7fffffff, %i0, %i1
	and	%i1, %l2, %l2
	cmp	%g2, %l2
	bne	bad_end
	setx	0xc69856158cbfa3c8, %i0, %g3
	or	%g1, %l0, %g1
	ldxa	[%g1] 0x46, %l3
	cmp	%g3, %l3
	bne	bad_end
	add	%g1, 8, %g1
	setx	0x9526e2c632a2769a, %i0, %g4
	ldxa	[%g1] 0x46, %l4
	cmp	%g4, %l4
	bne	bad_end

!! addr = 6d0 (index=109, way=0)  tag = 1c089bdc  d1 = d7cd56e4c861f6ad  d2 = 938c5544653d6952
	setx	0x6d0, %i0, %g1
	setx	0x1c089bdc, %i0, %g2
	stxa	%g2, [%g1] 0x47
	setx	0xd7cd56e4c861f6ad, %i0, %g2
	stxa	%g2, [%g1] 0x46
	add	%g1, 8, %g1
	setx	0x938c5544653d6952, %i0, %g2
	stxa	%g2, [%g1] 0x46
!! addr = 1e20 (index=98, way=3)  tag = 1a116546  d1 = c0d1338ccf5a16a3  d2 = 4c1e5311bdd1079d
	setx	0x1e20, %i0, %g1
	setx	0x1a116546, %i0, %g2
	stxa	%g2, [%g1] 0x47
	setx	0xc0d1338ccf5a16a3, %i0, %g2
	stxa	%g2, [%g1] 0x46
	add	%g1, 8, %g1
	setx	0x4c1e5311bdd1079d, %i0, %g2
	stxa	%g2, [%g1] 0x46
!! addr = 8c0  tag = 1c323ebc  d1 = 86fbb54d24de3c53  d2 = d8a3f09a517a733b
	setx	0x8c0, %i0, %g1
	setx	0x1c323ebc, %i0, %g2
	ldxa	[%g1] 0x47, %l2
	setx	0x7fffffff, %i0, %i1
	and	%i1, %l2, %l2
	cmp	%g2, %l2
	bne	bad_end
	setx	0x86fbb54d24de3c53, %i0, %g3
	or	%g1, %l0, %g1
	ldxa	[%g1] 0x46, %l3
	cmp	%g3, %l3
	bne	bad_end
	add	%g1, 8, %g1
	setx	0xd8a3f09a517a733b, %i0, %g4
	ldxa	[%g1] 0x46, %l4
	cmp	%g4, %l4
	bne	bad_end

!! addr = 1700 (index=112, way=2)  tag = 303fa30  d1 = 96b2622953a917ad  d2 = 65e732581de8fee4
	setx	0x1700, %i0, %g1
	setx	0x303fa30, %i0, %g2
	stxa	%g2, [%g1] 0x47
	setx	0x96b2622953a917ad, %i0, %g2
	stxa	%g2, [%g1] 0x46
	add	%g1, 8, %g1
	setx	0x65e732581de8fee4, %i0, %g2
	stxa	%g2, [%g1] 0x46
!! addr = 11f0 (index=31, way=2)  tag = 15ef0e64  d1 = 839ddcc6c5aa3626  d2 = 47689841b22c5af3
	setx	0x11f0, %i0, %g1
	setx	0x15ef0e64, %i0, %g2
	stxa	%g2, [%g1] 0x47
	setx	0x839ddcc6c5aa3626, %i0, %g2
	stxa	%g2, [%g1] 0x46
	add	%g1, 8, %g1
	setx	0x47689841b22c5af3, %i0, %g2
	stxa	%g2, [%g1] 0x46
!! addr = 1830  tag = e35c97  d1 = f6158ad287d9fdb  d2 = b991a1e06f9c3706
	setx	0x1830, %i0, %g1
	setx	0xe35c97, %i0, %g2
	ldxa	[%g1] 0x47, %l2
	setx	0x7fffffff, %i0, %i1
	and	%i1, %l2, %l2
	cmp	%g2, %l2
	bne	bad_end
	setx	0xf6158ad287d9fdb, %i0, %g3
	or	%g1, %l0, %g1
	ldxa	[%g1] 0x46, %l3
	cmp	%g3, %l3
	bne	bad_end
	add	%g1, 8, %g1
	setx	0xb991a1e06f9c3706, %i0, %g4
	ldxa	[%g1] 0x46, %l4
	cmp	%g4, %l4
	bne	bad_end

!! addr = 1b10 (index=49, way=3)  tag = 9bcc380  d1 = 81db292fb58869e  d2 = ac8d0d6e2fc77485
	setx	0x1b10, %i0, %g1
	setx	0x9bcc380, %i0, %g2
	stxa	%g2, [%g1] 0x47
	setx	0x81db292fb58869e, %i0, %g2
	stxa	%g2, [%g1] 0x46
	add	%g1, 8, %g1
	setx	0xac8d0d6e2fc77485, %i0, %g2
	stxa	%g2, [%g1] 0x46
!! addr = 1d80 (index=88, way=3)  tag = 7b4642c  d1 = 85eee38acbe0443a  d2 = 3c0821297685a8d0
	setx	0x1d80, %i0, %g1
	setx	0x7b4642c, %i0, %g2
	stxa	%g2, [%g1] 0x47
	setx	0x85eee38acbe0443a, %i0, %g2
	stxa	%g2, [%g1] 0x46
	add	%g1, 8, %g1
	setx	0x3c0821297685a8d0, %i0, %g2
	stxa	%g2, [%g1] 0x46
!! addr = 1290  tag = 8f2ad9c  d1 = 5c81766736f0ea  d2 = 94445aa4a930b58c
	setx	0x1290, %i0, %g1
	setx	0x8f2ad9c, %i0, %g2
	ldxa	[%g1] 0x47, %l2
	setx	0x7fffffff, %i0, %i1
	and	%i1, %l2, %l2
	cmp	%g2, %l2
	bne	bad_end
	setx	0x5c81766736f0ea, %i0, %g3
	or	%g1, %l0, %g1
	ldxa	[%g1] 0x46, %l3
	cmp	%g3, %l3
	bne	bad_end
	add	%g1, 8, %g1
	setx	0x94445aa4a930b58c, %i0, %g4
	ldxa	[%g1] 0x46, %l4
	cmp	%g4, %l4
	bne	bad_end

!! addr = 1080 (index=8, way=2)  tag = 1ca359f2  d1 = 6a046b2422bfb15d  d2 = 8ac03ba057977bd9
	setx	0x1080, %i0, %g1
	setx	0x1ca359f2, %i0, %g2
	stxa	%g2, [%g1] 0x47
	setx	0x6a046b2422bfb15d, %i0, %g2
	stxa	%g2, [%g1] 0x46
	add	%g1, 8, %g1
	setx	0x8ac03ba057977bd9, %i0, %g2
	stxa	%g2, [%g1] 0x46
!! addr = 540 (index=84, way=0)  tag = 15ea6456  d1 = 4fb64ecc1625552e  d2 = 40675a469ce1706c
	setx	0x540, %i0, %g1
	setx	0x15ea6456, %i0, %g2
	stxa	%g2, [%g1] 0x47
	setx	0x4fb64ecc1625552e, %i0, %g2
	stxa	%g2, [%g1] 0x46
	add	%g1, 8, %g1
	setx	0x40675a469ce1706c, %i0, %g2
	stxa	%g2, [%g1] 0x46
!! addr = 1f70  tag = 5c50588  d1 = 3fa41fb8f6f20a24  d2 = 289f55a0408453fe
	setx	0x1f70, %i0, %g1
	setx	0x5c50588, %i0, %g2
	ldxa	[%g1] 0x47, %l2
	setx	0x7fffffff, %i0, %i1
	and	%i1, %l2, %l2
	cmp	%g2, %l2
	bne	bad_end
	setx	0x3fa41fb8f6f20a24, %i0, %g3
	or	%g1, %l0, %g1
	ldxa	[%g1] 0x46, %l3
	cmp	%g3, %l3
	bne	bad_end
	add	%g1, 8, %g1
	setx	0x289f55a0408453fe, %i0, %g4
	ldxa	[%g1] 0x46, %l4
	cmp	%g4, %l4
	bne	bad_end

!! addr = 1d10 (index=81, way=3)  tag = 1c557f9a  d1 = cacd157ce8093706  d2 = 68568a465deb79c7
	setx	0x1d10, %i0, %g1
	setx	0x1c557f9a, %i0, %g2
	stxa	%g2, [%g1] 0x47
	setx	0xcacd157ce8093706, %i0, %g2
	stxa	%g2, [%g1] 0x46
	add	%g1, 8, %g1
	setx	0x68568a465deb79c7, %i0, %g2
	stxa	%g2, [%g1] 0x46
!! addr = d50 (index=85, way=1)  tag = 1d676420  d1 = 5079ccc4c9c43395  d2 = e308c95347367141
	setx	0xd50, %i0, %g1
	setx	0x1d676420, %i0, %g2
	stxa	%g2, [%g1] 0x47
	setx	0x5079ccc4c9c43395, %i0, %g2
	stxa	%g2, [%g1] 0x46
	add	%g1, 8, %g1
	setx	0xe308c95347367141, %i0, %g2
	stxa	%g2, [%g1] 0x46
!! addr = 1bc0  tag = 11515090  d1 = 7eac7f27f2fda064  d2 = 4c833e29ef1c081
	setx	0x1bc0, %i0, %g1
	setx	0x11515090, %i0, %g2
	ldxa	[%g1] 0x47, %l2
	setx	0x7fffffff, %i0, %i1
	and	%i1, %l2, %l2
	cmp	%g2, %l2
	bne	bad_end
	setx	0x7eac7f27f2fda064, %i0, %g3
	or	%g1, %l0, %g1
	ldxa	[%g1] 0x46, %l3
	cmp	%g3, %l3
	bne	bad_end
	add	%g1, 8, %g1
	setx	0x4c833e29ef1c081, %i0, %g4
	ldxa	[%g1] 0x46, %l4
	cmp	%g4, %l4
	bne	bad_end

!! addr = ed0 (index=109, way=1)  tag = 18d62072  d1 = 3c9e53e68269b7f7  d2 = ba87cef8ec7cd672
	setx	0xed0, %i0, %g1
	setx	0x18d62072, %i0, %g2
	stxa	%g2, [%g1] 0x47
	setx	0x3c9e53e68269b7f7, %i0, %g2
	stxa	%g2, [%g1] 0x46
	add	%g1, 8, %g1
	setx	0xba87cef8ec7cd672, %i0, %g2
	stxa	%g2, [%g1] 0x46
!! addr = d30 (index=83, way=1)  tag = 8f4024c  d1 = b48b02e41e03703f  d2 = d1bfdd4f257e3b08
	setx	0xd30, %i0, %g1
	setx	0x8f4024c, %i0, %g2
	stxa	%g2, [%g1] 0x47
	setx	0xb48b02e41e03703f, %i0, %g2
	stxa	%g2, [%g1] 0x46
	add	%g1, 8, %g1
	setx	0xd1bfdd4f257e3b08, %i0, %g2
	stxa	%g2, [%g1] 0x46
!! addr = 1080  tag = 1ca359f3  d1 = 6a046b2422bfb15d  d2 = 8ac03ba057977bd9
	setx	0x1080, %i0, %g1
	setx	0x1ca359f3, %i0, %g2
	ldxa	[%g1] 0x47, %l2
	setx	0x7fffffff, %i0, %i1
	and	%i1, %l2, %l2
	cmp	%g2, %l2
	bne	bad_end
	setx	0x6a046b2422bfb15d, %i0, %g3
	or	%g1, %l0, %g1
	ldxa	[%g1] 0x46, %l3
	cmp	%g3, %l3
	bne	bad_end
	add	%g1, 8, %g1
	setx	0x8ac03ba057977bd9, %i0, %g4
	ldxa	[%g1] 0x46, %l4
	cmp	%g4, %l4
	bne	bad_end

!! addr = 1320 (index=50, way=2)  tag = 124b9c60  d1 = 70b7a054d9a2a5cd  d2 = dd8077929ef34d41
	setx	0x1320, %i0, %g1
	setx	0x124b9c60, %i0, %g2
	stxa	%g2, [%g1] 0x47
	setx	0x70b7a054d9a2a5cd, %i0, %g2
	stxa	%g2, [%g1] 0x46
	add	%g1, 8, %g1
	setx	0xdd8077929ef34d41, %i0, %g2
	stxa	%g2, [%g1] 0x46
!! addr = 760 (index=118, way=0)  tag = 4109928  d1 = 38f3dde2a7a3723d  d2 = bdbe765909bdba
	setx	0x760, %i0, %g1
	setx	0x4109928, %i0, %g2
	stxa	%g2, [%g1] 0x47
	setx	0x38f3dde2a7a3723d, %i0, %g2
	stxa	%g2, [%g1] 0x46
	add	%g1, 8, %g1
	setx	0xbdbe765909bdba, %i0, %g2
	stxa	%g2, [%g1] 0x46
!! addr = c10  tag = fdb91a3  d1 = 561862369e6e2492  d2 = 8f2a17d79d6df47d
	setx	0xc10, %i0, %g1
	setx	0xfdb91a3, %i0, %g2
	ldxa	[%g1] 0x47, %l2
	setx	0x7fffffff, %i0, %i1
	and	%i1, %l2, %l2
	cmp	%g2, %l2
	bne	bad_end
	setx	0x561862369e6e2492, %i0, %g3
	or	%g1, %l0, %g1
	ldxa	[%g1] 0x46, %l3
	cmp	%g3, %l3
	bne	bad_end
	add	%g1, 8, %g1
	setx	0x8f2a17d79d6df47d, %i0, %g4
	ldxa	[%g1] 0x46, %l4
	cmp	%g4, %l4
	bne	bad_end

!! addr = 7e0 (index=126, way=0)  tag = de4912a  d1 = 885ed2f6a3d91365  d2 = b7b81a2a14203cd7
	setx	0x7e0, %i0, %g1
	setx	0xde4912a, %i0, %g2
	stxa	%g2, [%g1] 0x47
	setx	0x885ed2f6a3d91365, %i0, %g2
	stxa	%g2, [%g1] 0x46
	add	%g1, 8, %g1
	setx	0xb7b81a2a14203cd7, %i0, %g2
	stxa	%g2, [%g1] 0x46
!! addr = 460 (index=70, way=0)  tag = 11fb308c  d1 = 1316e1b4c00086e0  d2 = ee721e461619d98f
	setx	0x460, %i0, %g1
	setx	0x11fb308c, %i0, %g2
	stxa	%g2, [%g1] 0x47
	setx	0x1316e1b4c00086e0, %i0, %g2
	stxa	%g2, [%g1] 0x46
	add	%g1, 8, %g1
	setx	0xee721e461619d98f, %i0, %g2
	stxa	%g2, [%g1] 0x46
!! addr = 6a0  tag = 871abe7  d1 = ef79422414cf8149  d2 = 2bcf8021953634e2
	setx	0x6a0, %i0, %g1
	setx	0x871abe7, %i0, %g2
	ldxa	[%g1] 0x47, %l2
	setx	0x7fffffff, %i0, %i1
	and	%i1, %l2, %l2
	cmp	%g2, %l2
	bne	bad_end
	setx	0xef79422414cf8149, %i0, %g3
	or	%g1, %l0, %g1
	ldxa	[%g1] 0x46, %l3
	cmp	%g3, %l3
	bne	bad_end
	add	%g1, 8, %g1
	setx	0x2bcf8021953634e2, %i0, %g4
	ldxa	[%g1] 0x46, %l4
	cmp	%g4, %l4
	bne	bad_end

!! addr = c0 (index=12, way=0)  tag = 15832486  d1 = d834323ed6c084dc  d2 = 200c051b4adf71a
	setx	0xc0, %i0, %g1
	setx	0x15832486, %i0, %g2
	stxa	%g2, [%g1] 0x47
	setx	0xd834323ed6c084dc, %i0, %g2
	stxa	%g2, [%g1] 0x46
	add	%g1, 8, %g1
	setx	0x200c051b4adf71a, %i0, %g2
	stxa	%g2, [%g1] 0x46
!! addr = 1210 (index=33, way=2)  tag = 1a15efd2  d1 = 4103798e38d8f1b9  d2 = e140077b1cbbef02
	setx	0x1210, %i0, %g1
	setx	0x1a15efd2, %i0, %g2
	stxa	%g2, [%g1] 0x47
	setx	0x4103798e38d8f1b9, %i0, %g2
	stxa	%g2, [%g1] 0x46
	add	%g1, 8, %g1
	setx	0xe140077b1cbbef02, %i0, %g2
	stxa	%g2, [%g1] 0x46
!! addr = 300  tag = 1a5a8a6f  d1 = ab391565f51f417  d2 = 198bdd4f8564d615
	setx	0x300, %i0, %g1
	setx	0x1a5a8a6f, %i0, %g2
	ldxa	[%g1] 0x47, %l2
	setx	0x7fffffff, %i0, %i1
	and	%i1, %l2, %l2
	cmp	%g2, %l2
	bne	bad_end
	setx	0xab391565f51f417, %i0, %g3
	or	%g1, %l0, %g1
	ldxa	[%g1] 0x46, %l3
	cmp	%g3, %l3
	bne	bad_end
	add	%g1, 8, %g1
	setx	0x198bdd4f8564d615, %i0, %g4
	ldxa	[%g1] 0x46, %l4
	cmp	%g4, %l4
	bne	bad_end

!! addr = 16c0 (index=108, way=2)  tag = cece0c  d1 = 68aa82ddf919bf8e  d2 = 3f9dcefda4431130
	setx	0x16c0, %i0, %g1
	setx	0xcece0c, %i0, %g2
	stxa	%g2, [%g1] 0x47
	setx	0x68aa82ddf919bf8e, %i0, %g2
	stxa	%g2, [%g1] 0x46
	add	%g1, 8, %g1
	setx	0x3f9dcefda4431130, %i0, %g2
	stxa	%g2, [%g1] 0x46
!! addr = 240 (index=36, way=0)  tag = 2ce0fe0  d1 = d77e47e5cdb6fc99  d2 = 3c06ae1261ea6eca
	setx	0x240, %i0, %g1
	setx	0x2ce0fe0, %i0, %g2
	stxa	%g2, [%g1] 0x47
	setx	0xd77e47e5cdb6fc99, %i0, %g2
	stxa	%g2, [%g1] 0x46
	add	%g1, 8, %g1
	setx	0x3c06ae1261ea6eca, %i0, %g2
	stxa	%g2, [%g1] 0x46
!! addr = c0  tag = 15832487  d1 = d834323ed6c084dc  d2 = 200c051b4adf71a
	setx	0xc0, %i0, %g1
	setx	0x15832487, %i0, %g2
	ldxa	[%g1] 0x47, %l2
	setx	0x7fffffff, %i0, %i1
	and	%i1, %l2, %l2
	cmp	%g2, %l2
	bne	bad_end
	setx	0xd834323ed6c084dc, %i0, %g3
	or	%g1, %l0, %g1
	ldxa	[%g1] 0x46, %l3
	cmp	%g3, %l3
	bne	bad_end
	add	%g1, 8, %g1
	setx	0x200c051b4adf71a, %i0, %g4
	ldxa	[%g1] 0x46, %l4
	cmp	%g4, %l4
	bne	bad_end

!! addr = 1160 (index=22, way=2)  tag = e4ca142  d1 = c4a317c311859a19  d2 = 6875e6a9d219b37c
	setx	0x1160, %i0, %g1
	setx	0xe4ca142, %i0, %g2
	stxa	%g2, [%g1] 0x47
	setx	0xc4a317c311859a19, %i0, %g2
	stxa	%g2, [%g1] 0x46
	add	%g1, 8, %g1
	setx	0x6875e6a9d219b37c, %i0, %g2
	stxa	%g2, [%g1] 0x46
!! addr = 1e00 (index=96, way=3)  tag = 1c234d24  d1 = 22bd766e3ff0792  d2 = 467e3f4981f169e1
	setx	0x1e00, %i0, %g1
	setx	0x1c234d24, %i0, %g2
	stxa	%g2, [%g1] 0x47
	setx	0x22bd766e3ff0792, %i0, %g2
	stxa	%g2, [%g1] 0x46
	add	%g1, 8, %g1
	setx	0x467e3f4981f169e1, %i0, %g2
	stxa	%g2, [%g1] 0x46
!! addr = 18f0  tag = 12d4eae8  d1 = 19e1d1d1340c8a20  d2 = 718d4251db0dbed5
	setx	0x18f0, %i0, %g1
	setx	0x12d4eae8, %i0, %g2
	ldxa	[%g1] 0x47, %l2
	setx	0x7fffffff, %i0, %i1
	and	%i1, %l2, %l2
	cmp	%g2, %l2
	bne	bad_end
	setx	0x19e1d1d1340c8a20, %i0, %g3
	or	%g1, %l0, %g1
	ldxa	[%g1] 0x46, %l3
	cmp	%g3, %l3
	bne	bad_end
	add	%g1, 8, %g1
	setx	0x718d4251db0dbed5, %i0, %g4
	ldxa	[%g1] 0x46, %l4
	cmp	%g4, %l4
	bne	bad_end

!! addr = 290 (index=41, way=0)  tag = 1b1e178e  d1 = e72de2222fabcc5b  d2 = 19ea2339de0ae9a4
	setx	0x290, %i0, %g1
	setx	0x1b1e178e, %i0, %g2
	stxa	%g2, [%g1] 0x47
	setx	0xe72de2222fabcc5b, %i0, %g2
	stxa	%g2, [%g1] 0x46
	add	%g1, 8, %g1
	setx	0x19ea2339de0ae9a4, %i0, %g2
	stxa	%g2, [%g1] 0x46
!! addr = bc0 (index=60, way=1)  tag = 2efd992  d1 = aed9061f6aa198f4  d2 = 668b19cd517217f
	setx	0xbc0, %i0, %g1
	setx	0x2efd992, %i0, %g2
	stxa	%g2, [%g1] 0x47
	setx	0xaed9061f6aa198f4, %i0, %g2
	stxa	%g2, [%g1] 0x46
	add	%g1, 8, %g1
	setx	0x668b19cd517217f, %i0, %g2
	stxa	%g2, [%g1] 0x46
!! addr = 1f70  tag = 5c50588  d1 = 3fa41fb8f6f20a24  d2 = 289f55a0408453fe
	setx	0x1f70, %i0, %g1
	setx	0x5c50588, %i0, %g2
	ldxa	[%g1] 0x47, %l2
	setx	0x7fffffff, %i0, %i1
	and	%i1, %l2, %l2
	cmp	%g2, %l2
	bne	bad_end
	setx	0x3fa41fb8f6f20a24, %i0, %g3
	or	%g1, %l0, %g1
	ldxa	[%g1] 0x46, %l3
	cmp	%g3, %l3
	bne	bad_end
	add	%g1, 8, %g1
	setx	0x289f55a0408453fe, %i0, %g4
	ldxa	[%g1] 0x46, %l4
	cmp	%g4, %l4
	bne	bad_end

!! addr = 18f0 (index=15, way=3)  tag = 10065a46  d1 = 596d816bccb5bf6e  d2 = 2bc85405e70df28d
	setx	0x18f0, %i0, %g1
	setx	0x10065a46, %i0, %g2
	stxa	%g2, [%g1] 0x47
	setx	0x596d816bccb5bf6e, %i0, %g2
	stxa	%g2, [%g1] 0x46
	add	%g1, 8, %g1
	setx	0x2bc85405e70df28d, %i0, %g2
	stxa	%g2, [%g1] 0x46
!! addr = 12c0 (index=44, way=2)  tag = e10cea8  d1 = 8cef1f2b6a716d4f  d2 = 69694c83f88971e
	setx	0x12c0, %i0, %g1
	setx	0xe10cea8, %i0, %g2
	stxa	%g2, [%g1] 0x47
	setx	0x8cef1f2b6a716d4f, %i0, %g2
	stxa	%g2, [%g1] 0x46
	add	%g1, 8, %g1
	setx	0x69694c83f88971e, %i0, %g2
	stxa	%g2, [%g1] 0x46
!! addr = 1320  tag = 124b9c60  d1 = 70b7a054d9a2a5cd  d2 = dd8077929ef34d41
	setx	0x1320, %i0, %g1
	setx	0x124b9c60, %i0, %g2
	ldxa	[%g1] 0x47, %l2
	setx	0x7fffffff, %i0, %i1
	and	%i1, %l2, %l2
	cmp	%g2, %l2
	bne	bad_end
	setx	0x70b7a054d9a2a5cd, %i0, %g3
	or	%g1, %l0, %g1
	ldxa	[%g1] 0x46, %l3
	cmp	%g3, %l3
	bne	bad_end
	add	%g1, 8, %g1
	setx	0xdd8077929ef34d41, %i0, %g4
	ldxa	[%g1] 0x46, %l4
	cmp	%g4, %l4
	bne	bad_end

!! addr = de0 (index=94, way=1)  tag = 2560ca6  d1 = d19f534e801d5db2  d2 = 5944d0a6182b905d
	setx	0xde0, %i0, %g1
	setx	0x2560ca6, %i0, %g2
	stxa	%g2, [%g1] 0x47
	setx	0xd19f534e801d5db2, %i0, %g2
	stxa	%g2, [%g1] 0x46
	add	%g1, 8, %g1
	setx	0x5944d0a6182b905d, %i0, %g2
	stxa	%g2, [%g1] 0x46
!! addr = cf0 (index=79, way=1)  tag = 1e8f1f6c  d1 = 69fc6109181d8776  d2 = 28bfe1cb158a1c77
	setx	0xcf0, %i0, %g1
	setx	0x1e8f1f6c, %i0, %g2
	stxa	%g2, [%g1] 0x47
	setx	0x69fc6109181d8776, %i0, %g2
	stxa	%g2, [%g1] 0x46
	add	%g1, 8, %g1
	setx	0x28bfe1cb158a1c77, %i0, %g2
	stxa	%g2, [%g1] 0x46
!! addr = 460  tag = 11fb308c  d1 = 1316e1b4c00086e0  d2 = ee721e461619d98f
	setx	0x460, %i0, %g1
	setx	0x11fb308c, %i0, %g2
	ldxa	[%g1] 0x47, %l2
	setx	0x7fffffff, %i0, %i1
	and	%i1, %l2, %l2
	cmp	%g2, %l2
	bne	bad_end
	setx	0x1316e1b4c00086e0, %i0, %g3
	or	%g1, %l0, %g1
	ldxa	[%g1] 0x46, %l3
	cmp	%g3, %l3
	bne	bad_end
	add	%g1, 8, %g1
	setx	0xee721e461619d98f, %i0, %g4
	ldxa	[%g1] 0x46, %l4
	cmp	%g4, %l4
	bne	bad_end

!! addr = 6a0 (index=106, way=0)  tag = f5d95cc  d1 = e44783bdc5cfe2c3  d2 = a4ad08f548e55877
	setx	0x6a0, %i0, %g1
	setx	0xf5d95cc, %i0, %g2
	stxa	%g2, [%g1] 0x47
	setx	0xe44783bdc5cfe2c3, %i0, %g2
	stxa	%g2, [%g1] 0x46
	add	%g1, 8, %g1
	setx	0xa4ad08f548e55877, %i0, %g2
	stxa	%g2, [%g1] 0x46
!! addr = 640 (index=100, way=0)  tag = 13e90a68  d1 = 4c68326db8cf4079  d2 = df30cae1acebe383
	setx	0x640, %i0, %g1
	setx	0x13e90a68, %i0, %g2
	stxa	%g2, [%g1] 0x47
	setx	0x4c68326db8cf4079, %i0, %g2
	stxa	%g2, [%g1] 0x46
	add	%g1, 8, %g1
	setx	0xdf30cae1acebe383, %i0, %g2
	stxa	%g2, [%g1] 0x46
!! addr = ed0  tag = 18d62073  d1 = 3c9e53e68269b7f7  d2 = ba87cef8ec7cd672
	setx	0xed0, %i0, %g1
	setx	0x18d62073, %i0, %g2
	ldxa	[%g1] 0x47, %l2
	setx	0x7fffffff, %i0, %i1
	and	%i1, %l2, %l2
	cmp	%g2, %l2
	bne	bad_end
	setx	0x3c9e53e68269b7f7, %i0, %g3
	or	%g1, %l0, %g1
	ldxa	[%g1] 0x46, %l3
	cmp	%g3, %l3
	bne	bad_end
	add	%g1, 8, %g1
	setx	0xba87cef8ec7cd672, %i0, %g4
	ldxa	[%g1] 0x46, %l4
	cmp	%g4, %l4
	bne	bad_end

!! addr = 230 (index=35, way=0)  tag = 105eac6  d1 = 98811ce8d2a4ab7d  d2 = 4cde150cc6110381
	setx	0x230, %i0, %g1
	setx	0x105eac6, %i0, %g2
	stxa	%g2, [%g1] 0x47
	setx	0x98811ce8d2a4ab7d, %i0, %g2
	stxa	%g2, [%g1] 0x46
	add	%g1, 8, %g1
	setx	0x4cde150cc6110381, %i0, %g2
	stxa	%g2, [%g1] 0x46
!! addr = 1ef0 (index=111, way=3)  tag = d9c0bb2  d1 = d45114dea6c57aa  d2 = 6b4a8b8774c28e7b
	setx	0x1ef0, %i0, %g1
	setx	0xd9c0bb2, %i0, %g2
	stxa	%g2, [%g1] 0x47
	setx	0xd45114dea6c57aa, %i0, %g2
	stxa	%g2, [%g1] 0x46
	add	%g1, 8, %g1
	setx	0x6b4a8b8774c28e7b, %i0, %g2
	stxa	%g2, [%g1] 0x46
!! addr = 230  tag = 105eac7  d1 = 98811ce8d2a4ab7d  d2 = 4cde150cc6110381
	setx	0x230, %i0, %g1
	setx	0x105eac7, %i0, %g2
	ldxa	[%g1] 0x47, %l2
	setx	0x7fffffff, %i0, %i1
	and	%i1, %l2, %l2
	cmp	%g2, %l2
	bne	bad_end
	setx	0x98811ce8d2a4ab7d, %i0, %g3
	or	%g1, %l0, %g1
	ldxa	[%g1] 0x46, %l3
	cmp	%g3, %l3
	bne	bad_end
	add	%g1, 8, %g1
	setx	0x4cde150cc6110381, %i0, %g4
	ldxa	[%g1] 0x46, %l4
	cmp	%g4, %l4
	bne	bad_end

!! addr = 670 (index=103, way=0)  tag = 122fd886  d1 = f0721742b42805ff  d2 = 4d7f45424827bd60
	setx	0x670, %i0, %g1
	setx	0x122fd886, %i0, %g2
	stxa	%g2, [%g1] 0x47
	setx	0xf0721742b42805ff, %i0, %g2
	stxa	%g2, [%g1] 0x46
	add	%g1, 8, %g1
	setx	0x4d7f45424827bd60, %i0, %g2
	stxa	%g2, [%g1] 0x46
!! addr = 1ad0 (index=45, way=3)  tag = b0f4eea  d1 = e244e2dca07d0298  d2 = fdd8387aac63bfd7
	setx	0x1ad0, %i0, %g1
	setx	0xb0f4eea, %i0, %g2
	stxa	%g2, [%g1] 0x47
	setx	0xe244e2dca07d0298, %i0, %g2
	stxa	%g2, [%g1] 0x46
	add	%g1, 8, %g1
	setx	0xfdd8387aac63bfd7, %i0, %g2
	stxa	%g2, [%g1] 0x46
!! addr = 290  tag = 1b1e178f  d1 = e72de2222fabcc5b  d2 = 19ea2339de0ae9a4
	setx	0x290, %i0, %g1
	setx	0x1b1e178f, %i0, %g2
	ldxa	[%g1] 0x47, %l2
	setx	0x7fffffff, %i0, %i1
	and	%i1, %l2, %l2
	cmp	%g2, %l2
	bne	bad_end
	setx	0xe72de2222fabcc5b, %i0, %g3
	or	%g1, %l0, %g1
	ldxa	[%g1] 0x46, %l3
	cmp	%g3, %l3
	bne	bad_end
	add	%g1, 8, %g1
	setx	0x19ea2339de0ae9a4, %i0, %g4
	ldxa	[%g1] 0x46, %l4
	cmp	%g4, %l4
	bne	bad_end

!! addr = 13b0 (index=59, way=2)  tag = 1179cde6  d1 = b6e3697938ba01a4  d2 = a300b2335c097539
	setx	0x13b0, %i0, %g1
	setx	0x1179cde6, %i0, %g2
	stxa	%g2, [%g1] 0x47
	setx	0xb6e3697938ba01a4, %i0, %g2
	stxa	%g2, [%g1] 0x46
	add	%g1, 8, %g1
	setx	0xa300b2335c097539, %i0, %g2
	stxa	%g2, [%g1] 0x46
!! addr = 1f80 (index=120, way=3)  tag = 2fea132  d1 = 8d61439166b5fd16  d2 = d6378fb812a6aa51
	setx	0x1f80, %i0, %g1
	setx	0x2fea132, %i0, %g2
	stxa	%g2, [%g1] 0x47
	setx	0x8d61439166b5fd16, %i0, %g2
	stxa	%g2, [%g1] 0x46
	add	%g1, 8, %g1
	setx	0xd6378fb812a6aa51, %i0, %g2
	stxa	%g2, [%g1] 0x46
!! addr = 1690  tag = b1f04d4  d1 = be656971b07079d2  d2 = 271577fb23572d27
	setx	0x1690, %i0, %g1
	setx	0xb1f04d4, %i0, %g2
	ldxa	[%g1] 0x47, %l2
	setx	0x7fffffff, %i0, %i1
	and	%i1, %l2, %l2
	cmp	%g2, %l2
	bne	bad_end
	setx	0xbe656971b07079d2, %i0, %g3
	or	%g1, %l0, %g1
	ldxa	[%g1] 0x46, %l3
	cmp	%g3, %l3
	bne	bad_end
	add	%g1, 8, %g1
	setx	0x271577fb23572d27, %i0, %g4
	ldxa	[%g1] 0x46, %l4
	cmp	%g4, %l4
	bne	bad_end

!! addr = 1bd0 (index=61, way=3)  tag = 90c25a8  d1 = 22fd18815d013f0a  d2 = cb5dccb5c3342d71
	setx	0x1bd0, %i0, %g1
	setx	0x90c25a8, %i0, %g2
	stxa	%g2, [%g1] 0x47
	setx	0x22fd18815d013f0a, %i0, %g2
	stxa	%g2, [%g1] 0x46
	add	%g1, 8, %g1
	setx	0xcb5dccb5c3342d71, %i0, %g2
	stxa	%g2, [%g1] 0x46
!! addr = 830 (index=3, way=1)  tag = 1385e33a  d1 = 737d7209a269933  d2 = bd55c87e2668a0e2
	setx	0x830, %i0, %g1
	setx	0x1385e33a, %i0, %g2
	stxa	%g2, [%g1] 0x47
	setx	0x737d7209a269933, %i0, %g2
	stxa	%g2, [%g1] 0x46
	add	%g1, 8, %g1
	setx	0xbd55c87e2668a0e2, %i0, %g2
	stxa	%g2, [%g1] 0x46
!! addr = c0  tag = 15832487  d1 = d834323ed6c084dc  d2 = 200c051b4adf71a
	setx	0xc0, %i0, %g1
	setx	0x15832487, %i0, %g2
	ldxa	[%g1] 0x47, %l2
	setx	0x7fffffff, %i0, %i1
	and	%i1, %l2, %l2
	cmp	%g2, %l2
	bne	bad_end
	setx	0xd834323ed6c084dc, %i0, %g3
	or	%g1, %l0, %g1
	ldxa	[%g1] 0x46, %l3
	cmp	%g3, %l3
	bne	bad_end
	add	%g1, 8, %g1
	setx	0x200c051b4adf71a, %i0, %g4
	ldxa	[%g1] 0x46, %l4
	cmp	%g4, %l4
	bne	bad_end

!! addr = 8c0 (index=12, way=1)  tag = 1a0bf078  d1 = 232647893bb1c00d  d2 = 3ca3ede3906f4bac
	setx	0x8c0, %i0, %g1
	setx	0x1a0bf078, %i0, %g2
	stxa	%g2, [%g1] 0x47
	setx	0x232647893bb1c00d, %i0, %g2
	stxa	%g2, [%g1] 0x46
	add	%g1, 8, %g1
	setx	0x3ca3ede3906f4bac, %i0, %g2
	stxa	%g2, [%g1] 0x46
!! addr = 1c40 (index=68, way=3)  tag = 13ecfb34  d1 = b91a987e8a0acf42  d2 = 79806347d155a6c3
	setx	0x1c40, %i0, %g1
	setx	0x13ecfb34, %i0, %g2
	stxa	%g2, [%g1] 0x47
	setx	0xb91a987e8a0acf42, %i0, %g2
	stxa	%g2, [%g1] 0x46
	add	%g1, 8, %g1
	setx	0x79806347d155a6c3, %i0, %g2
	stxa	%g2, [%g1] 0x46
!! addr = 1370  tag = 109b79b7  d1 = c4548dcca151b8b4  d2 = 4875af4fb3b9b082
	setx	0x1370, %i0, %g1
	setx	0x109b79b7, %i0, %g2
	ldxa	[%g1] 0x47, %l2
	setx	0x7fffffff, %i0, %i1
	and	%i1, %l2, %l2
	cmp	%g2, %l2
	bne	bad_end
	setx	0xc4548dcca151b8b4, %i0, %g3
	or	%g1, %l0, %g1
	ldxa	[%g1] 0x46, %l3
	cmp	%g3, %l3
	bne	bad_end
	add	%g1, 8, %g1
	setx	0x4875af4fb3b9b082, %i0, %g4
	ldxa	[%g1] 0x46, %l4
	cmp	%g4, %l4
	bne	bad_end

!! addr = 1360 (index=54, way=2)  tag = 2543eea  d1 = 60094803bca7b7cc  d2 = ca3ce7155eae8d1
	setx	0x1360, %i0, %g1
	setx	0x2543eea, %i0, %g2
	stxa	%g2, [%g1] 0x47
	setx	0x60094803bca7b7cc, %i0, %g2
	stxa	%g2, [%g1] 0x46
	add	%g1, 8, %g1
	setx	0xca3ce7155eae8d1, %i0, %g2
	stxa	%g2, [%g1] 0x46
!! addr = 1b40 (index=52, way=3)  tag = 195446de  d1 = 9bd429e0b1414dd3  d2 = 1809f9d295f4ff6d
	setx	0x1b40, %i0, %g1
	setx	0x195446de, %i0, %g2
	stxa	%g2, [%g1] 0x47
	setx	0x9bd429e0b1414dd3, %i0, %g2
	stxa	%g2, [%g1] 0x46
	add	%g1, 8, %g1
	setx	0x1809f9d295f4ff6d, %i0, %g2
	stxa	%g2, [%g1] 0x46
!! addr = a10  tag = e70f320  d1 = a223c5996cc48e14  d2 = 99098abaddb3d8b0
	setx	0xa10, %i0, %g1
	setx	0xe70f320, %i0, %g2
	ldxa	[%g1] 0x47, %l2
	setx	0x7fffffff, %i0, %i1
	and	%i1, %l2, %l2
	cmp	%g2, %l2
	bne	bad_end
	setx	0xa223c5996cc48e14, %i0, %g3
	or	%g1, %l0, %g1
	ldxa	[%g1] 0x46, %l3
	cmp	%g3, %l3
	bne	bad_end
	add	%g1, 8, %g1
	setx	0x99098abaddb3d8b0, %i0, %g4
	ldxa	[%g1] 0x46, %l4
	cmp	%g4, %l4
	bne	bad_end

!! addr = 1a30 (index=35, way=3)  tag = b15eb74  d1 = 48bba99f80565aa3  d2 = 31fd91e479d32104
	setx	0x1a30, %i0, %g1
	setx	0xb15eb74, %i0, %g2
	stxa	%g2, [%g1] 0x47
	setx	0x48bba99f80565aa3, %i0, %g2
	stxa	%g2, [%g1] 0x46
	add	%g1, 8, %g1
	setx	0x31fd91e479d32104, %i0, %g2
	stxa	%g2, [%g1] 0x46
!! addr = 1ff0 (index=127, way=3)  tag = 7618d7e  d1 = d02024bc796589b7  d2 = 29c30f1b99f9be98
	setx	0x1ff0, %i0, %g1
	setx	0x7618d7e, %i0, %g2
	stxa	%g2, [%g1] 0x47
	setx	0xd02024bc796589b7, %i0, %g2
	stxa	%g2, [%g1] 0x46
	add	%g1, 8, %g1
	setx	0x29c30f1b99f9be98, %i0, %g2
	stxa	%g2, [%g1] 0x46
!! addr = 1080  tag = 1ca359f3  d1 = 6a046b2422bfb15d  d2 = 8ac03ba057977bd9
	setx	0x1080, %i0, %g1
	setx	0x1ca359f3, %i0, %g2
	ldxa	[%g1] 0x47, %l2
	setx	0x7fffffff, %i0, %i1
	and	%i1, %l2, %l2
	cmp	%g2, %l2
	bne	bad_end
	setx	0x6a046b2422bfb15d, %i0, %g3
	or	%g1, %l0, %g1
	ldxa	[%g1] 0x46, %l3
	cmp	%g3, %l3
	bne	bad_end
	add	%g1, 8, %g1
	setx	0x8ac03ba057977bd9, %i0, %g4
	ldxa	[%g1] 0x46, %l4
	cmp	%g4, %l4
	bne	bad_end

!! addr = 620 (index=98, way=0)  tag = 6fde47e  d1 = b90a4a4fc48aae2e  d2 = 49f86029c65763aa
	setx	0x620, %i0, %g1
	setx	0x6fde47e, %i0, %g2
	stxa	%g2, [%g1] 0x47
	setx	0xb90a4a4fc48aae2e, %i0, %g2
	stxa	%g2, [%g1] 0x46
	add	%g1, 8, %g1
	setx	0x49f86029c65763aa, %i0, %g2
	stxa	%g2, [%g1] 0x46
!! addr = 18a0 (index=10, way=3)  tag = e0d71e2  d1 = 85d769c6388dcdff  d2 = 4f46df6025d7583e
	setx	0x18a0, %i0, %g1
	setx	0xe0d71e2, %i0, %g2
	stxa	%g2, [%g1] 0x47
	setx	0x85d769c6388dcdff, %i0, %g2
	stxa	%g2, [%g1] 0x46
	add	%g1, 8, %g1
	setx	0x4f46df6025d7583e, %i0, %g2
	stxa	%g2, [%g1] 0x46
!! addr = c0  tag = 15832487  d1 = d834323ed6c084dc  d2 = 200c051b4adf71a
	setx	0xc0, %i0, %g1
	setx	0x15832487, %i0, %g2
	ldxa	[%g1] 0x47, %l2
	setx	0x7fffffff, %i0, %i1
	and	%i1, %l2, %l2
	cmp	%g2, %l2
	bne	bad_end
	setx	0xd834323ed6c084dc, %i0, %g3
	or	%g1, %l0, %g1
	ldxa	[%g1] 0x46, %l3
	cmp	%g3, %l3
	bne	bad_end
	add	%g1, 8, %g1
	setx	0x200c051b4adf71a, %i0, %g4
	ldxa	[%g1] 0x46, %l4
	cmp	%g4, %l4
	bne	bad_end

!! addr = f10 (index=113, way=1)  tag = e81f650  d1 = ae966443f82594b  d2 = 8813ebfea25c367
	setx	0xf10, %i0, %g1
	setx	0xe81f650, %i0, %g2
	stxa	%g2, [%g1] 0x47
	setx	0xae966443f82594b, %i0, %g2
	stxa	%g2, [%g1] 0x46
	add	%g1, 8, %g1
	setx	0x8813ebfea25c367, %i0, %g2
	stxa	%g2, [%g1] 0x46
!! addr = 1340 (index=52, way=2)  tag = 1db1645e  d1 = 46d070f35aad4bfc  d2 = b21c301d729a3097
	setx	0x1340, %i0, %g1
	setx	0x1db1645e, %i0, %g2
	stxa	%g2, [%g1] 0x47
	setx	0x46d070f35aad4bfc, %i0, %g2
	stxa	%g2, [%g1] 0x46
	add	%g1, 8, %g1
	setx	0xb21c301d729a3097, %i0, %g2
	stxa	%g2, [%g1] 0x46
!! addr = ea0  tag = 21aeb87  d1 = 791374735a03477  d2 = 913093e62752870f
	setx	0xea0, %i0, %g1
	setx	0x21aeb87, %i0, %g2
	ldxa	[%g1] 0x47, %l2
	setx	0x7fffffff, %i0, %i1
	and	%i1, %l2, %l2
	cmp	%g2, %l2
	bne	bad_end
	setx	0x791374735a03477, %i0, %g3
	or	%g1, %l0, %g1
	ldxa	[%g1] 0x46, %l3
	cmp	%g3, %l3
	bne	bad_end
	add	%g1, 8, %g1
	setx	0x913093e62752870f, %i0, %g4
	ldxa	[%g1] 0x46, %l4
	cmp	%g4, %l4
	bne	bad_end

!! addr = 1b80 (index=56, way=3)  tag = 10f4151a  d1 = a408a7ee2e567417  d2 = dc6587bbbe5a4622
	setx	0x1b80, %i0, %g1
	setx	0x10f4151a, %i0, %g2
	stxa	%g2, [%g1] 0x47
	setx	0xa408a7ee2e567417, %i0, %g2
	stxa	%g2, [%g1] 0x46
	add	%g1, 8, %g1
	setx	0xdc6587bbbe5a4622, %i0, %g2
	stxa	%g2, [%g1] 0x46
!! addr = 1dd0 (index=93, way=3)  tag = 27614ce  d1 = fa739978e79a2b40  d2 = 47aa200fdf042c1e
	setx	0x1dd0, %i0, %g1
	setx	0x27614ce, %i0, %g2
	stxa	%g2, [%g1] 0x47
	setx	0xfa739978e79a2b40, %i0, %g2
	stxa	%g2, [%g1] 0x46
	add	%g1, 8, %g1
	setx	0x47aa200fdf042c1e, %i0, %g2
	stxa	%g2, [%g1] 0x46
!! addr = 1290  tag = 8f2ad9c  d1 = 5c81766736f0ea  d2 = 94445aa4a930b58c
	setx	0x1290, %i0, %g1
	setx	0x8f2ad9c, %i0, %g2
	ldxa	[%g1] 0x47, %l2
	setx	0x7fffffff, %i0, %i1
	and	%i1, %l2, %l2
	cmp	%g2, %l2
	bne	bad_end
	setx	0x5c81766736f0ea, %i0, %g3
	or	%g1, %l0, %g1
	ldxa	[%g1] 0x46, %l3
	cmp	%g3, %l3
	bne	bad_end
	add	%g1, 8, %g1
	setx	0x94445aa4a930b58c, %i0, %g4
	ldxa	[%g1] 0x46, %l4
	cmp	%g4, %l4
	bne	bad_end

!! addr = 110 (index=17, way=0)  tag = 18fc26fc  d1 = 508b37ff13ba57ee  d2 = 174fcdf966e234fe
	setx	0x110, %i0, %g1
	setx	0x18fc26fc, %i0, %g2
	stxa	%g2, [%g1] 0x47
	setx	0x508b37ff13ba57ee, %i0, %g2
	stxa	%g2, [%g1] 0x46
	add	%g1, 8, %g1
	setx	0x174fcdf966e234fe, %i0, %g2
	stxa	%g2, [%g1] 0x46
!! addr = 1760 (index=118, way=2)  tag = 426498  d1 = 370379cad6b7999b  d2 = fb00f733e4ed3f8a
	setx	0x1760, %i0, %g1
	setx	0x426498, %i0, %g2
	stxa	%g2, [%g1] 0x47
	setx	0x370379cad6b7999b, %i0, %g2
	stxa	%g2, [%g1] 0x46
	add	%g1, 8, %g1
	setx	0xfb00f733e4ed3f8a, %i0, %g2
	stxa	%g2, [%g1] 0x46
!! addr = b50  tag = 2aa4fdf  d1 = 306e23b8a45cee56  d2 = 876ccf495a569a38
	setx	0xb50, %i0, %g1
	setx	0x2aa4fdf, %i0, %g2
	ldxa	[%g1] 0x47, %l2
	setx	0x7fffffff, %i0, %i1
	and	%i1, %l2, %l2
	cmp	%g2, %l2
	bne	bad_end
	setx	0x306e23b8a45cee56, %i0, %g3
	or	%g1, %l0, %g1
	ldxa	[%g1] 0x46, %l3
	cmp	%g3, %l3
	bne	bad_end
	add	%g1, 8, %g1
	setx	0x876ccf495a569a38, %i0, %g4
	ldxa	[%g1] 0x46, %l4
	cmp	%g4, %l4
	bne	bad_end

!! addr = cd0 (index=77, way=1)  tag = b184df6  d1 = fbe3cd67e40e6f6f  d2 = 5465319262536c62
	setx	0xcd0, %i0, %g1
	setx	0xb184df6, %i0, %g2
	stxa	%g2, [%g1] 0x47
	setx	0xfbe3cd67e40e6f6f, %i0, %g2
	stxa	%g2, [%g1] 0x46
	add	%g1, 8, %g1
	setx	0x5465319262536c62, %i0, %g2
	stxa	%g2, [%g1] 0x46
!! addr = 560 (index=86, way=0)  tag = 104ad8aa  d1 = b5992f9fe143db1d  d2 = 1a76f6c767e7ffd5
	setx	0x560, %i0, %g1
	setx	0x104ad8aa, %i0, %g2
	stxa	%g2, [%g1] 0x47
	setx	0xb5992f9fe143db1d, %i0, %g2
	stxa	%g2, [%g1] 0x46
	add	%g1, 8, %g1
	setx	0x1a76f6c767e7ffd5, %i0, %g2
	stxa	%g2, [%g1] 0x46
!! addr = 1080  tag = 1ca359f3  d1 = 6a046b2422bfb15d  d2 = 8ac03ba057977bd9
	setx	0x1080, %i0, %g1
	setx	0x1ca359f3, %i0, %g2
	ldxa	[%g1] 0x47, %l2
	setx	0x7fffffff, %i0, %i1
	and	%i1, %l2, %l2
	cmp	%g2, %l2
	bne	bad_end
	setx	0x6a046b2422bfb15d, %i0, %g3
	or	%g1, %l0, %g1
	ldxa	[%g1] 0x46, %l3
	cmp	%g3, %l3
	bne	bad_end
	add	%g1, 8, %g1
	setx	0x8ac03ba057977bd9, %i0, %g4
	ldxa	[%g1] 0x46, %l4
	cmp	%g4, %l4
	bne	bad_end

!! addr = 1d00 (index=80, way=3)  tag = cc3b1f0  d1 = 98d4bd599bc70675  d2 = 230e8d9e9e37abf1
	setx	0x1d00, %i0, %g1
	setx	0xcc3b1f0, %i0, %g2
	stxa	%g2, [%g1] 0x47
	setx	0x98d4bd599bc70675, %i0, %g2
	stxa	%g2, [%g1] 0x46
	add	%g1, 8, %g1
	setx	0x230e8d9e9e37abf1, %i0, %g2
	stxa	%g2, [%g1] 0x46
!! addr = 1cf0 (index=79, way=3)  tag = 9618b78  d1 = fdd4afeac44a5a19  d2 = a6192947362a3238
	setx	0x1cf0, %i0, %g1
	setx	0x9618b78, %i0, %g2
	stxa	%g2, [%g1] 0x47
	setx	0xfdd4afeac44a5a19, %i0, %g2
	stxa	%g2, [%g1] 0x46
	add	%g1, 8, %g1
	setx	0xa6192947362a3238, %i0, %g2
	stxa	%g2, [%g1] 0x46
!! addr = 1b80  tag = 10f4151b  d1 = a408a7ee2e567417  d2 = dc6587bbbe5a4622
	setx	0x1b80, %i0, %g1
	setx	0x10f4151b, %i0, %g2
	ldxa	[%g1] 0x47, %l2
	setx	0x7fffffff, %i0, %i1
	and	%i1, %l2, %l2
	cmp	%g2, %l2
	bne	bad_end
	setx	0xa408a7ee2e567417, %i0, %g3
	or	%g1, %l0, %g1
	ldxa	[%g1] 0x46, %l3
	cmp	%g3, %l3
	bne	bad_end
	add	%g1, 8, %g1
	setx	0xdc6587bbbe5a4622, %i0, %g4
	ldxa	[%g1] 0x46, %l4
	cmp	%g4, %l4
	bne	bad_end

!! addr = 17a0 (index=122, way=2)  tag = ae3cac2  d1 = 49940b437d271a1f  d2 = 65f5b57634cbe692
	setx	0x17a0, %i0, %g1
	setx	0xae3cac2, %i0, %g2
	stxa	%g2, [%g1] 0x47
	setx	0x49940b437d271a1f, %i0, %g2
	stxa	%g2, [%g1] 0x46
	add	%g1, 8, %g1
	setx	0x65f5b57634cbe692, %i0, %g2
	stxa	%g2, [%g1] 0x46
!! addr = 9b0 (index=27, way=1)  tag = 4269f00  d1 = 9e4116e22339b71f  d2 = 5bf03271d4b95c2c
	setx	0x9b0, %i0, %g1
	setx	0x4269f00, %i0, %g2
	stxa	%g2, [%g1] 0x47
	setx	0x9e4116e22339b71f, %i0, %g2
	stxa	%g2, [%g1] 0x46
	add	%g1, 8, %g1
	setx	0x5bf03271d4b95c2c, %i0, %g2
	stxa	%g2, [%g1] 0x46
!! addr = 300  tag = 1a5a8a6f  d1 = ab391565f51f417  d2 = 198bdd4f8564d615
	setx	0x300, %i0, %g1
	setx	0x1a5a8a6f, %i0, %g2
	ldxa	[%g1] 0x47, %l2
	setx	0x7fffffff, %i0, %i1
	and	%i1, %l2, %l2
	cmp	%g2, %l2
	bne	bad_end
	setx	0xab391565f51f417, %i0, %g3
	or	%g1, %l0, %g1
	ldxa	[%g1] 0x46, %l3
	cmp	%g3, %l3
	bne	bad_end
	add	%g1, 8, %g1
	setx	0x198bdd4f8564d615, %i0, %g4
	ldxa	[%g1] 0x46, %l4
	cmp	%g4, %l4
	bne	bad_end

!! addr = b30 (index=51, way=1)  tag = 1e1c2a22  d1 = 191378d9724f28c8  d2 = 223404b339339268
	setx	0xb30, %i0, %g1
	setx	0x1e1c2a22, %i0, %g2
	stxa	%g2, [%g1] 0x47
	setx	0x191378d9724f28c8, %i0, %g2
	stxa	%g2, [%g1] 0x46
	add	%g1, 8, %g1
	setx	0x223404b339339268, %i0, %g2
	stxa	%g2, [%g1] 0x46
!! addr = 1b90 (index=57, way=3)  tag = 14392ec6  d1 = 866cf7fb7c1dd901  d2 = 9f191f41efdb5369
	setx	0x1b90, %i0, %g1
	setx	0x14392ec6, %i0, %g2
	stxa	%g2, [%g1] 0x47
	setx	0x866cf7fb7c1dd901, %i0, %g2
	stxa	%g2, [%g1] 0x46
	add	%g1, 8, %g1
	setx	0x9f191f41efdb5369, %i0, %g2
	stxa	%g2, [%g1] 0x46
!! addr = 9b0  tag = 4269f00  d1 = 9e4116e22339b71f  d2 = 5bf03271d4b95c2c
	setx	0x9b0, %i0, %g1
	setx	0x4269f00, %i0, %g2
	ldxa	[%g1] 0x47, %l2
	setx	0x7fffffff, %i0, %i1
	and	%i1, %l2, %l2
	cmp	%g2, %l2
	bne	bad_end
	setx	0x9e4116e22339b71f, %i0, %g3
	or	%g1, %l0, %g1
	ldxa	[%g1] 0x46, %l3
	cmp	%g3, %l3
	bne	bad_end
	add	%g1, 8, %g1
	setx	0x5bf03271d4b95c2c, %i0, %g4
	ldxa	[%g1] 0x46, %l4
	cmp	%g4, %l4
	bne	bad_end

!! addr = 970 (index=23, way=1)  tag = 13a8c5b6  d1 = d66c960a50a0020e  d2 = b744ef2f371ff8da
	setx	0x970, %i0, %g1
	setx	0x13a8c5b6, %i0, %g2
	stxa	%g2, [%g1] 0x47
	setx	0xd66c960a50a0020e, %i0, %g2
	stxa	%g2, [%g1] 0x46
	add	%g1, 8, %g1
	setx	0xb744ef2f371ff8da, %i0, %g2
	stxa	%g2, [%g1] 0x46
!! addr = ac0 (index=44, way=1)  tag = 1788c1d8  d1 = 57b6adebde7dfcce  d2 = 96b235f48cacde9
	setx	0xac0, %i0, %g1
	setx	0x1788c1d8, %i0, %g2
	stxa	%g2, [%g1] 0x47
	setx	0x57b6adebde7dfcce, %i0, %g2
	stxa	%g2, [%g1] 0x46
	add	%g1, 8, %g1
	setx	0x96b235f48cacde9, %i0, %g2
	stxa	%g2, [%g1] 0x46
!! addr = cc0  tag = 4996147  d1 = f49fe332dc626174  d2 = f504c3bf345a8a07
	setx	0xcc0, %i0, %g1
	setx	0x4996147, %i0, %g2
	ldxa	[%g1] 0x47, %l2
	setx	0x7fffffff, %i0, %i1
	and	%i1, %l2, %l2
	cmp	%g2, %l2
	bne	bad_end
	setx	0xf49fe332dc626174, %i0, %g3
	or	%g1, %l0, %g1
	ldxa	[%g1] 0x46, %l3
	cmp	%g3, %l3
	bne	bad_end
	add	%g1, 8, %g1
	setx	0xf504c3bf345a8a07, %i0, %g4
	ldxa	[%g1] 0x46, %l4
	cmp	%g4, %l4
	bne	bad_end

!! addr = 1c60 (index=70, way=3)  tag = 95ec106  d1 = e370d108fa7196cd  d2 = 38bc91022aeb868b
	setx	0x1c60, %i0, %g1
	setx	0x95ec106, %i0, %g2
	stxa	%g2, [%g1] 0x47
	setx	0xe370d108fa7196cd, %i0, %g2
	stxa	%g2, [%g1] 0x46
	add	%g1, 8, %g1
	setx	0x38bc91022aeb868b, %i0, %g2
	stxa	%g2, [%g1] 0x46
!! addr = 1e90 (index=105, way=3)  tag = 4e73ccc  d1 = c1ccaaa555dec5d8  d2 = 219bc60739aff1e5
	setx	0x1e90, %i0, %g1
	setx	0x4e73ccc, %i0, %g2
	stxa	%g2, [%g1] 0x47
	setx	0xc1ccaaa555dec5d8, %i0, %g2
	stxa	%g2, [%g1] 0x46
	add	%g1, 8, %g1
	setx	0x219bc60739aff1e5, %i0, %g2
	stxa	%g2, [%g1] 0x46
!! addr = 170  tag = aedfe1c  d1 = 7354bbd382cff13  d2 = 22ea0a95eda861cb
	setx	0x170, %i0, %g1
	setx	0xaedfe1c, %i0, %g2
	ldxa	[%g1] 0x47, %l2
	setx	0x7fffffff, %i0, %i1
	and	%i1, %l2, %l2
	cmp	%g2, %l2
	bne	bad_end
	setx	0x7354bbd382cff13, %i0, %g3
	or	%g1, %l0, %g1
	ldxa	[%g1] 0x46, %l3
	cmp	%g3, %l3
	bne	bad_end
	add	%g1, 8, %g1
	setx	0x22ea0a95eda861cb, %i0, %g4
	ldxa	[%g1] 0x46, %l4
	cmp	%g4, %l4
	bne	bad_end

!! addr = 1a70 (index=39, way=3)  tag = 1373b786  d1 = 75d86439c1dc924  d2 = e2c23e85f7291b61
	setx	0x1a70, %i0, %g1
	setx	0x1373b786, %i0, %g2
	stxa	%g2, [%g1] 0x47
	setx	0x75d86439c1dc924, %i0, %g2
	stxa	%g2, [%g1] 0x46
	add	%g1, 8, %g1
	setx	0xe2c23e85f7291b61, %i0, %g2
	stxa	%g2, [%g1] 0x46
!! addr = 1270 (index=39, way=2)  tag = afb53be  d1 = 3fe1c76038e84db1  d2 = 7c0cf83828dce5d6
	setx	0x1270, %i0, %g1
	setx	0xafb53be, %i0, %g2
	stxa	%g2, [%g1] 0x47
	setx	0x3fe1c76038e84db1, %i0, %g2
	stxa	%g2, [%g1] 0x46
	add	%g1, 8, %g1
	setx	0x7c0cf83828dce5d6, %i0, %g2
	stxa	%g2, [%g1] 0x46
!! addr = f0  tag = da19d38  d1 = c69856158cbfa3c8  d2 = 9526e2c632a2769a
	setx	0xf0, %i0, %g1
	setx	0xda19d38, %i0, %g2
	ldxa	[%g1] 0x47, %l2
	setx	0x7fffffff, %i0, %i1
	and	%i1, %l2, %l2
	cmp	%g2, %l2
	bne	bad_end
	setx	0xc69856158cbfa3c8, %i0, %g3
	or	%g1, %l0, %g1
	ldxa	[%g1] 0x46, %l3
	cmp	%g3, %l3
	bne	bad_end
	add	%g1, 8, %g1
	setx	0x9526e2c632a2769a, %i0, %g4
	ldxa	[%g1] 0x46, %l4
	cmp	%g4, %l4
	bne	bad_end

!! addr = 1640 (index=100, way=2)  tag = aab8690  d1 = 96b4106d815f3c6e  d2 = e24f14519ca75a81
	setx	0x1640, %i0, %g1
	setx	0xaab8690, %i0, %g2
	stxa	%g2, [%g1] 0x47
	setx	0x96b4106d815f3c6e, %i0, %g2
	stxa	%g2, [%g1] 0x46
	add	%g1, 8, %g1
	setx	0xe24f14519ca75a81, %i0, %g2
	stxa	%g2, [%g1] 0x46
!! addr = a20 (index=34, way=1)  tag = 18b37c52  d1 = cb959490ce303429  d2 = b3fc9e83844e6074
	setx	0xa20, %i0, %g1
	setx	0x18b37c52, %i0, %g2
	stxa	%g2, [%g1] 0x47
	setx	0xcb959490ce303429, %i0, %g2
	stxa	%g2, [%g1] 0x46
	add	%g1, 8, %g1
	setx	0xb3fc9e83844e6074, %i0, %g2
	stxa	%g2, [%g1] 0x46
!! addr = b30  tag = 1e1c2a23  d1 = 191378d9724f28c8  d2 = 223404b339339268
	setx	0xb30, %i0, %g1
	setx	0x1e1c2a23, %i0, %g2
	ldxa	[%g1] 0x47, %l2
	setx	0x7fffffff, %i0, %i1
	and	%i1, %l2, %l2
	cmp	%g2, %l2
	bne	bad_end
	setx	0x191378d9724f28c8, %i0, %g3
	or	%g1, %l0, %g1
	ldxa	[%g1] 0x46, %l3
	cmp	%g3, %l3
	bne	bad_end
	add	%g1, 8, %g1
	setx	0x223404b339339268, %i0, %g4
	ldxa	[%g1] 0x46, %l4
	cmp	%g4, %l4
	bne	bad_end

!! addr = 1990 (index=25, way=3)  tag = 98c9768  d1 = 8135d87740042549  d2 = ea308740b9e7fa50
	setx	0x1990, %i0, %g1
	setx	0x98c9768, %i0, %g2
	stxa	%g2, [%g1] 0x47
	setx	0x8135d87740042549, %i0, %g2
	stxa	%g2, [%g1] 0x46
	add	%g1, 8, %g1
	setx	0xea308740b9e7fa50, %i0, %g2
	stxa	%g2, [%g1] 0x46
!! addr = bc0 (index=60, way=1)  tag = 10595fb6  d1 = 5a90a9eaf7a7af51  d2 = 495e04269e7038b9
	setx	0xbc0, %i0, %g1
	setx	0x10595fb6, %i0, %g2
	stxa	%g2, [%g1] 0x47
	setx	0x5a90a9eaf7a7af51, %i0, %g2
	stxa	%g2, [%g1] 0x46
	add	%g1, 8, %g1
	setx	0x495e04269e7038b9, %i0, %g2
	stxa	%g2, [%g1] 0x46
!! addr = 1140  tag = 1f0aa173  d1 = d43fea7d30f8ae8b  d2 = 3b1304c2bde5a783
	setx	0x1140, %i0, %g1
	setx	0x1f0aa173, %i0, %g2
	ldxa	[%g1] 0x47, %l2
	setx	0x7fffffff, %i0, %i1
	and	%i1, %l2, %l2
	cmp	%g2, %l2
	bne	bad_end
	setx	0xd43fea7d30f8ae8b, %i0, %g3
	or	%g1, %l0, %g1
	ldxa	[%g1] 0x46, %l3
	cmp	%g3, %l3
	bne	bad_end
	add	%g1, 8, %g1
	setx	0x3b1304c2bde5a783, %i0, %g4
	ldxa	[%g1] 0x46, %l4
	cmp	%g4, %l4
	bne	bad_end

!! addr = 14f0 (index=79, way=2)  tag = 73aa936  d1 = 1704659134f51992  d2 = 4dcef46a170b1474
	setx	0x14f0, %i0, %g1
	setx	0x73aa936, %i0, %g2
	stxa	%g2, [%g1] 0x47
	setx	0x1704659134f51992, %i0, %g2
	stxa	%g2, [%g1] 0x46
	add	%g1, 8, %g1
	setx	0x4dcef46a170b1474, %i0, %g2
	stxa	%g2, [%g1] 0x46
!! addr = 580 (index=88, way=0)  tag = e65cca0  d1 = 3bd4f664d5ad9b7a  d2 = 9731bd9d525f5de
	setx	0x580, %i0, %g1
	setx	0xe65cca0, %i0, %g2
	stxa	%g2, [%g1] 0x47
	setx	0x3bd4f664d5ad9b7a, %i0, %g2
	stxa	%g2, [%g1] 0x46
	add	%g1, 8, %g1
	setx	0x9731bd9d525f5de, %i0, %g2
	stxa	%g2, [%g1] 0x46
!! addr = 1970  tag = c511664  d1 = 40a759f92be79db3  d2 = 8f154f7db01757f6
	setx	0x1970, %i0, %g1
	setx	0xc511664, %i0, %g2
	ldxa	[%g1] 0x47, %l2
	setx	0x7fffffff, %i0, %i1
	and	%i1, %l2, %l2
	cmp	%g2, %l2
	bne	bad_end
	setx	0x40a759f92be79db3, %i0, %g3
	or	%g1, %l0, %g1
	ldxa	[%g1] 0x46, %l3
	cmp	%g3, %l3
	bne	bad_end
	add	%g1, 8, %g1
	setx	0x8f154f7db01757f6, %i0, %g4
	ldxa	[%g1] 0x46, %l4
	cmp	%g4, %l4
	bne	bad_end

!! addr = 1770 (index=119, way=2)  tag = 6981b10  d1 = 95e56d2d908fe066  d2 = 9ab83128432e75d0
	setx	0x1770, %i0, %g1
	setx	0x6981b10, %i0, %g2
	stxa	%g2, [%g1] 0x47
	setx	0x95e56d2d908fe066, %i0, %g2
	stxa	%g2, [%g1] 0x46
	add	%g1, 8, %g1
	setx	0x9ab83128432e75d0, %i0, %g2
	stxa	%g2, [%g1] 0x46
!! addr = 18e0 (index=14, way=3)  tag = 1535294e  d1 = a9c2103192c48b35  d2 = e26a78a52c175f5c
	setx	0x18e0, %i0, %g1
	setx	0x1535294e, %i0, %g2
	stxa	%g2, [%g1] 0x47
	setx	0xa9c2103192c48b35, %i0, %g2
	stxa	%g2, [%g1] 0x46
	add	%g1, 8, %g1
	setx	0xe26a78a52c175f5c, %i0, %g2
	stxa	%g2, [%g1] 0x46
!! addr = 1340  tag = 1db1645f  d1 = 46d070f35aad4bfc  d2 = b21c301d729a3097
	setx	0x1340, %i0, %g1
	setx	0x1db1645f, %i0, %g2
	ldxa	[%g1] 0x47, %l2
	setx	0x7fffffff, %i0, %i1
	and	%i1, %l2, %l2
	cmp	%g2, %l2
	bne	bad_end
	setx	0x46d070f35aad4bfc, %i0, %g3
	or	%g1, %l0, %g1
	ldxa	[%g1] 0x46, %l3
	cmp	%g3, %l3
	bne	bad_end
	add	%g1, 8, %g1
	setx	0xb21c301d729a3097, %i0, %g4
	ldxa	[%g1] 0x46, %l4
	cmp	%g4, %l4
	bne	bad_end

!! addr = bf0 (index=63, way=1)  tag = 184db5ee  d1 = cfaae2fc6f564222  d2 = e9ee1b138840ee8a
	setx	0xbf0, %i0, %g1
	setx	0x184db5ee, %i0, %g2
	stxa	%g2, [%g1] 0x47
	setx	0xcfaae2fc6f564222, %i0, %g2
	stxa	%g2, [%g1] 0x46
	add	%g1, 8, %g1
	setx	0xe9ee1b138840ee8a, %i0, %g2
	stxa	%g2, [%g1] 0x46
!! addr = 15e0 (index=94, way=2)  tag = 16bc6582  d1 = 25cd84c8c8ecd753  d2 = 2ba5cc3b83410ceb
	setx	0x15e0, %i0, %g1
	setx	0x16bc6582, %i0, %g2
	stxa	%g2, [%g1] 0x47
	setx	0x25cd84c8c8ecd753, %i0, %g2
	stxa	%g2, [%g1] 0x46
	add	%g1, 8, %g1
	setx	0x2ba5cc3b83410ceb, %i0, %g2
	stxa	%g2, [%g1] 0x46
!! addr = 580  tag = e65cca0  d1 = 3bd4f664d5ad9b7a  d2 = 9731bd9d525f5de
	setx	0x580, %i0, %g1
	setx	0xe65cca0, %i0, %g2
	ldxa	[%g1] 0x47, %l2
	setx	0x7fffffff, %i0, %i1
	and	%i1, %l2, %l2
	cmp	%g2, %l2
	bne	bad_end
	setx	0x3bd4f664d5ad9b7a, %i0, %g3
	or	%g1, %l0, %g1
	ldxa	[%g1] 0x46, %l3
	cmp	%g3, %l3
	bne	bad_end
	add	%g1, 8, %g1
	setx	0x9731bd9d525f5de, %i0, %g4
	ldxa	[%g1] 0x46, %l4
	cmp	%g4, %l4
	bne	bad_end

!! addr = 2f0 (index=47, way=0)  tag = 1658f6b2  d1 = 7abf08eebbf0d862  d2 = 61f92805ba49a207
	setx	0x2f0, %i0, %g1
	setx	0x1658f6b2, %i0, %g2
	stxa	%g2, [%g1] 0x47
	setx	0x7abf08eebbf0d862, %i0, %g2
	stxa	%g2, [%g1] 0x46
	add	%g1, 8, %g1
	setx	0x61f92805ba49a207, %i0, %g2
	stxa	%g2, [%g1] 0x46
!! addr = 1bd0 (index=61, way=3)  tag = 1d5e6c8c  d1 = 72ef28dd31a2aee6  d2 = 20b9089d92c8f686
	setx	0x1bd0, %i0, %g1
	setx	0x1d5e6c8c, %i0, %g2
	stxa	%g2, [%g1] 0x47
	setx	0x72ef28dd31a2aee6, %i0, %g2
	stxa	%g2, [%g1] 0x46
	add	%g1, 8, %g1
	setx	0x20b9089d92c8f686, %i0, %g2
	stxa	%g2, [%g1] 0x46
!! addr = 540  tag = 15ea6457  d1 = 4fb64ecc1625552e  d2 = 40675a469ce1706c
	setx	0x540, %i0, %g1
	setx	0x15ea6457, %i0, %g2
	ldxa	[%g1] 0x47, %l2
	setx	0x7fffffff, %i0, %i1
	and	%i1, %l2, %l2
	cmp	%g2, %l2
	bne	bad_end
	setx	0x4fb64ecc1625552e, %i0, %g3
	or	%g1, %l0, %g1
	ldxa	[%g1] 0x46, %l3
	cmp	%g3, %l3
	bne	bad_end
	add	%g1, 8, %g1
	setx	0x40675a469ce1706c, %i0, %g4
	ldxa	[%g1] 0x46, %l4
	cmp	%g4, %l4
	bne	bad_end

!! addr = b60 (index=54, way=1)  tag = 7c0d82a  d1 = fdd47f35d785de05  d2 = a2bef616a72356ec
	setx	0xb60, %i0, %g1
	setx	0x7c0d82a, %i0, %g2
	stxa	%g2, [%g1] 0x47
	setx	0xfdd47f35d785de05, %i0, %g2
	stxa	%g2, [%g1] 0x46
	add	%g1, 8, %g1
	setx	0xa2bef616a72356ec, %i0, %g2
	stxa	%g2, [%g1] 0x46
!! addr = 1df0 (index=95, way=3)  tag = 1d02173e  d1 = 43c168659180273d  d2 = cb120747f5170464
	setx	0x1df0, %i0, %g1
	setx	0x1d02173e, %i0, %g2
	stxa	%g2, [%g1] 0x47
	setx	0x43c168659180273d, %i0, %g2
	stxa	%g2, [%g1] 0x46
	add	%g1, 8, %g1
	setx	0xcb120747f5170464, %i0, %g2
	stxa	%g2, [%g1] 0x46
!! addr = 1f40  tag = 1d4fbacc  d1 = ef037907cc8e3e22  d2 = e3fec4d26cd15bc
	setx	0x1f40, %i0, %g1
	setx	0x1d4fbacc, %i0, %g2
	ldxa	[%g1] 0x47, %l2
	setx	0x7fffffff, %i0, %i1
	and	%i1, %l2, %l2
	cmp	%g2, %l2
	bne	bad_end
	setx	0xef037907cc8e3e22, %i0, %g3
	or	%g1, %l0, %g1
	ldxa	[%g1] 0x46, %l3
	cmp	%g3, %l3
	bne	bad_end
	add	%g1, 8, %g1
	setx	0xe3fec4d26cd15bc, %i0, %g4
	ldxa	[%g1] 0x46, %l4
	cmp	%g4, %l4
	bne	bad_end

!! addr = c20 (index=66, way=1)  tag = 3111d06  d1 = c7ba54424563ff26  d2 = 141cdb9f2babc71d
	setx	0xc20, %i0, %g1
	setx	0x3111d06, %i0, %g2
	stxa	%g2, [%g1] 0x47
	setx	0xc7ba54424563ff26, %i0, %g2
	stxa	%g2, [%g1] 0x46
	add	%g1, 8, %g1
	setx	0x141cdb9f2babc71d, %i0, %g2
	stxa	%g2, [%g1] 0x46
!! addr = 1e00 (index=96, way=3)  tag = 1d889dfa  d1 = f155969510834beb  d2 = d7ebfaf748319efe
	setx	0x1e00, %i0, %g1
	setx	0x1d889dfa, %i0, %g2
	stxa	%g2, [%g1] 0x47
	setx	0xf155969510834beb, %i0, %g2
	stxa	%g2, [%g1] 0x46
	add	%g1, 8, %g1
	setx	0xd7ebfaf748319efe, %i0, %g2
	stxa	%g2, [%g1] 0x46
!! addr = de0  tag = 2560ca7  d1 = d19f534e801d5db2  d2 = 5944d0a6182b905d
	setx	0xde0, %i0, %g1
	setx	0x2560ca7, %i0, %g2
	ldxa	[%g1] 0x47, %l2
	setx	0x7fffffff, %i0, %i1
	and	%i1, %l2, %l2
	cmp	%g2, %l2
	bne	bad_end
	setx	0xd19f534e801d5db2, %i0, %g3
	or	%g1, %l0, %g1
	ldxa	[%g1] 0x46, %l3
	cmp	%g3, %l3
	bne	bad_end
	add	%g1, 8, %g1
	setx	0x5944d0a6182b905d, %i0, %g4
	ldxa	[%g1] 0x46, %l4
	cmp	%g4, %l4
	bne	bad_end

!! addr = 1db0 (index=91, way=3)  tag = e3c19e2  d1 = 845414c5d7012923  d2 = 5046773a3366efc1
	setx	0x1db0, %i0, %g1
	setx	0xe3c19e2, %i0, %g2
	stxa	%g2, [%g1] 0x47
	setx	0x845414c5d7012923, %i0, %g2
	stxa	%g2, [%g1] 0x46
	add	%g1, 8, %g1
	setx	0x5046773a3366efc1, %i0, %g2
	stxa	%g2, [%g1] 0x46
!! addr = e70 (index=103, way=1)  tag = 17c48aa0  d1 = cfbc3de36ff82ec0  d2 = 97583fa86f5e3f0f
	setx	0xe70, %i0, %g1
	setx	0x17c48aa0, %i0, %g2
	stxa	%g2, [%g1] 0x47
	setx	0xcfbc3de36ff82ec0, %i0, %g2
	stxa	%g2, [%g1] 0x46
	add	%g1, 8, %g1
	setx	0x97583fa86f5e3f0f, %i0, %g2
	stxa	%g2, [%g1] 0x46
!! addr = 1800  tag = 18c47ba0  d1 = 33f5c06412c31d80  d2 = 492c4da181bb54fa
	setx	0x1800, %i0, %g1
	setx	0x18c47ba0, %i0, %g2
	ldxa	[%g1] 0x47, %l2
	setx	0x7fffffff, %i0, %i1
	and	%i1, %l2, %l2
	cmp	%g2, %l2
	bne	bad_end
	setx	0x33f5c06412c31d80, %i0, %g3
	or	%g1, %l0, %g1
	ldxa	[%g1] 0x46, %l3
	cmp	%g3, %l3
	bne	bad_end
	add	%g1, 8, %g1
	setx	0x492c4da181bb54fa, %i0, %g4
	ldxa	[%g1] 0x46, %l4
	cmp	%g4, %l4
	bne	bad_end

!! addr = 1960 (index=22, way=3)  tag = 282ff40  d1 = bfb5dbb0154d5a99  d2 = 22e83fbf2796613c
	setx	0x1960, %i0, %g1
	setx	0x282ff40, %i0, %g2
	stxa	%g2, [%g1] 0x47
	setx	0xbfb5dbb0154d5a99, %i0, %g2
	stxa	%g2, [%g1] 0x46
	add	%g1, 8, %g1
	setx	0x22e83fbf2796613c, %i0, %g2
	stxa	%g2, [%g1] 0x46
!! addr = ab0 (index=43, way=1)  tag = 6112aa0  d1 = f5417003cf06f7cd  d2 = f1b2a9abe05fd8e
	setx	0xab0, %i0, %g1
	setx	0x6112aa0, %i0, %g2
	stxa	%g2, [%g1] 0x47
	setx	0xf5417003cf06f7cd, %i0, %g2
	stxa	%g2, [%g1] 0x46
	add	%g1, 8, %g1
	setx	0xf1b2a9abe05fd8e, %i0, %g2
	stxa	%g2, [%g1] 0x46
!! addr = 540  tag = 15ea6457  d1 = 4fb64ecc1625552e  d2 = 40675a469ce1706c
	setx	0x540, %i0, %g1
	setx	0x15ea6457, %i0, %g2
	ldxa	[%g1] 0x47, %l2
	setx	0x7fffffff, %i0, %i1
	and	%i1, %l2, %l2
	cmp	%g2, %l2
	bne	bad_end
	setx	0x4fb64ecc1625552e, %i0, %g3
	or	%g1, %l0, %g1
	ldxa	[%g1] 0x46, %l3
	cmp	%g3, %l3
	bne	bad_end
	add	%g1, 8, %g1
	setx	0x40675a469ce1706c, %i0, %g4
	ldxa	[%g1] 0x46, %l4
	cmp	%g4, %l4
	bne	bad_end

!! addr = 1940 (index=20, way=3)  tag = 304a38a  d1 = c8646233e4597364  d2 = d60e144792c48f33
	setx	0x1940, %i0, %g1
	setx	0x304a38a, %i0, %g2
	stxa	%g2, [%g1] 0x47
	setx	0xc8646233e4597364, %i0, %g2
	stxa	%g2, [%g1] 0x46
	add	%g1, 8, %g1
	setx	0xd60e144792c48f33, %i0, %g2
	stxa	%g2, [%g1] 0x46
!! addr = b40 (index=52, way=1)  tag = 11aa80ee  d1 = 895d15eaeee5f563  d2 = be5cda47e4de23b5
	setx	0xb40, %i0, %g1
	setx	0x11aa80ee, %i0, %g2
	stxa	%g2, [%g1] 0x47
	setx	0x895d15eaeee5f563, %i0, %g2
	stxa	%g2, [%g1] 0x46
	add	%g1, 8, %g1
	setx	0xbe5cda47e4de23b5, %i0, %g2
	stxa	%g2, [%g1] 0x46
!! addr = 620  tag = 6fde47f  d1 = b90a4a4fc48aae2e  d2 = 49f86029c65763aa
	setx	0x620, %i0, %g1
	setx	0x6fde47f, %i0, %g2
	ldxa	[%g1] 0x47, %l2
	setx	0x7fffffff, %i0, %i1
	and	%i1, %l2, %l2
	cmp	%g2, %l2
	bne	bad_end
	setx	0xb90a4a4fc48aae2e, %i0, %g3
	or	%g1, %l0, %g1
	ldxa	[%g1] 0x46, %l3
	cmp	%g3, %l3
	bne	bad_end
	add	%g1, 8, %g1
	setx	0x49f86029c65763aa, %i0, %g4
	ldxa	[%g1] 0x46, %l4
	cmp	%g4, %l4
	bne	bad_end

!! addr = 1aa0 (index=42, way=3)  tag = 1c92cd14  d1 = e1b90fc09e5204a3  d2 = c5cdcc2bfdc4208a
	setx	0x1aa0, %i0, %g1
	setx	0x1c92cd14, %i0, %g2
	stxa	%g2, [%g1] 0x47
	setx	0xe1b90fc09e5204a3, %i0, %g2
	stxa	%g2, [%g1] 0x46
	add	%g1, 8, %g1
	setx	0xc5cdcc2bfdc4208a, %i0, %g2
	stxa	%g2, [%g1] 0x46
!! addr = fd0 (index=125, way=1)  tag = de5b808  d1 = f0573fcd27afac13  d2 = ef2e066eba54bafd
	setx	0xfd0, %i0, %g1
	setx	0xde5b808, %i0, %g2
	stxa	%g2, [%g1] 0x47
	setx	0xf0573fcd27afac13, %i0, %g2
	stxa	%g2, [%g1] 0x46
	add	%g1, 8, %g1
	setx	0xef2e066eba54bafd, %i0, %g2
	stxa	%g2, [%g1] 0x46
!! addr = c0  tag = 15832487  d1 = d834323ed6c084dc  d2 = 200c051b4adf71a
	setx	0xc0, %i0, %g1
	setx	0x15832487, %i0, %g2
	ldxa	[%g1] 0x47, %l2
	setx	0x7fffffff, %i0, %i1
	and	%i1, %l2, %l2
	cmp	%g2, %l2
	bne	bad_end
	setx	0xd834323ed6c084dc, %i0, %g3
	or	%g1, %l0, %g1
	ldxa	[%g1] 0x46, %l3
	cmp	%g3, %l3
	bne	bad_end
	add	%g1, 8, %g1
	setx	0x200c051b4adf71a, %i0, %g4
	ldxa	[%g1] 0x46, %l4
	cmp	%g4, %l4
	bne	bad_end

!! addr = 1a10 (index=33, way=3)  tag = d6dfc16  d1 = 176a0a0822ce20b1  d2 = 73b5c7044b233f68
	setx	0x1a10, %i0, %g1
	setx	0xd6dfc16, %i0, %g2
	stxa	%g2, [%g1] 0x47
	setx	0x176a0a0822ce20b1, %i0, %g2
	stxa	%g2, [%g1] 0x46
	add	%g1, 8, %g1
	setx	0x73b5c7044b233f68, %i0, %g2
	stxa	%g2, [%g1] 0x46
!! addr = 1970 (index=23, way=3)  tag = 1a6a13f2  d1 = 68a075217edce6af  d2 = b2e0d00b37411d1f
	setx	0x1970, %i0, %g1
	setx	0x1a6a13f2, %i0, %g2
	stxa	%g2, [%g1] 0x47
	setx	0x68a075217edce6af, %i0, %g2
	stxa	%g2, [%g1] 0x46
	add	%g1, 8, %g1
	setx	0xb2e0d00b37411d1f, %i0, %g2
	stxa	%g2, [%g1] 0x46
!! addr = f0  tag = da19d38  d1 = c69856158cbfa3c8  d2 = 9526e2c632a2769a
	setx	0xf0, %i0, %g1
	setx	0xda19d38, %i0, %g2
	ldxa	[%g1] 0x47, %l2
	setx	0x7fffffff, %i0, %i1
	and	%i1, %l2, %l2
	cmp	%g2, %l2
	bne	bad_end
	setx	0xc69856158cbfa3c8, %i0, %g3
	or	%g1, %l0, %g1
	ldxa	[%g1] 0x46, %l3
	cmp	%g3, %l3
	bne	bad_end
	add	%g1, 8, %g1
	setx	0x9526e2c632a2769a, %i0, %g4
	ldxa	[%g1] 0x46, %l4
	cmp	%g4, %l4
	bne	bad_end

!! addr = 16b0 (index=107, way=2)  tag = 1b87b4b6  d1 = 433644fb97722b2c  d2 = 92ff7cac1612e931
	setx	0x16b0, %i0, %g1
	setx	0x1b87b4b6, %i0, %g2
	stxa	%g2, [%g1] 0x47
	setx	0x433644fb97722b2c, %i0, %g2
	stxa	%g2, [%g1] 0x46
	add	%g1, 8, %g1
	setx	0x92ff7cac1612e931, %i0, %g2
	stxa	%g2, [%g1] 0x46
!! addr = a50 (index=37, way=1)  tag = d8a643a  d1 = eede049c9062c646  d2 = e635915b40d88413
	setx	0xa50, %i0, %g1
	setx	0xd8a643a, %i0, %g2
	stxa	%g2, [%g1] 0x47
	setx	0xeede049c9062c646, %i0, %g2
	stxa	%g2, [%g1] 0x46
	add	%g1, 8, %g1
	setx	0xe635915b40d88413, %i0, %g2
	stxa	%g2, [%g1] 0x46
!! addr = 1e60  tag = 5df55b3  d1 = acfa6e2634a02885  d2 = 59fd135238ae8a37
	setx	0x1e60, %i0, %g1
	setx	0x5df55b3, %i0, %g2
	ldxa	[%g1] 0x47, %l2
	setx	0x7fffffff, %i0, %i1
	and	%i1, %l2, %l2
	cmp	%g2, %l2
	bne	bad_end
	setx	0xacfa6e2634a02885, %i0, %g3
	or	%g1, %l0, %g1
	ldxa	[%g1] 0x46, %l3
	cmp	%g3, %l3
	bne	bad_end
	add	%g1, 8, %g1
	setx	0x59fd135238ae8a37, %i0, %g4
	ldxa	[%g1] 0x46, %l4
	cmp	%g4, %l4
	bne	bad_end

!! addr = 7e0 (index=126, way=0)  tag = 7eb48fc  d1 = 15b592cbd6e6a8f1  d2 = c6860d3bd9c23e89
	setx	0x7e0, %i0, %g1
	setx	0x7eb48fc, %i0, %g2
	stxa	%g2, [%g1] 0x47
	setx	0x15b592cbd6e6a8f1, %i0, %g2
	stxa	%g2, [%g1] 0x46
	add	%g1, 8, %g1
	setx	0xc6860d3bd9c23e89, %i0, %g2
	stxa	%g2, [%g1] 0x46
!! addr = a30 (index=35, way=1)  tag = fdef5f6  d1 = 7daa54323b74d22b  d2 = da5baddc18e69a13
	setx	0xa30, %i0, %g1
	setx	0xfdef5f6, %i0, %g2
	stxa	%g2, [%g1] 0x47
	setx	0x7daa54323b74d22b, %i0, %g2
	stxa	%g2, [%g1] 0x46
	add	%g1, 8, %g1
	setx	0xda5baddc18e69a13, %i0, %g2
	stxa	%g2, [%g1] 0x46
!! addr = b90  tag = c9f470f  d1 = c35a0b242f520e03  d2 = f0dfd357f0d14d21
	setx	0xb90, %i0, %g1
	setx	0xc9f470f, %i0, %g2
	ldxa	[%g1] 0x47, %l2
	setx	0x7fffffff, %i0, %i1
	and	%i1, %l2, %l2
	cmp	%g2, %l2
	bne	bad_end
	setx	0xc35a0b242f520e03, %i0, %g3
	or	%g1, %l0, %g1
	ldxa	[%g1] 0x46, %l3
	cmp	%g3, %l3
	bne	bad_end
	add	%g1, 8, %g1
	setx	0xf0dfd357f0d14d21, %i0, %g4
	ldxa	[%g1] 0x46, %l4
	cmp	%g4, %l4
	bne	bad_end

!! addr = 16f0 (index=111, way=2)  tag = 15ed22dc  d1 = 334cb3e9cb23101d  d2 = 980d10be62dd357
	setx	0x16f0, %i0, %g1
	setx	0x15ed22dc, %i0, %g2
	stxa	%g2, [%g1] 0x47
	setx	0x334cb3e9cb23101d, %i0, %g2
	stxa	%g2, [%g1] 0x46
	add	%g1, 8, %g1
	setx	0x980d10be62dd357, %i0, %g2
	stxa	%g2, [%g1] 0x46
!! addr = 1850 (index=5, way=3)  tag = 1a4005c2  d1 = fe09311843eb07ee  d2 = 7fc6624a8d4a0998
	setx	0x1850, %i0, %g1
	setx	0x1a4005c2, %i0, %g2
	stxa	%g2, [%g1] 0x47
	setx	0xfe09311843eb07ee, %i0, %g2
	stxa	%g2, [%g1] 0x46
	add	%g1, 8, %g1
	setx	0x7fc6624a8d4a0998, %i0, %g2
	stxa	%g2, [%g1] 0x46
!! addr = 1690  tag = b1f04d4  d1 = be656971b07079d2  d2 = 271577fb23572d27
	setx	0x1690, %i0, %g1
	setx	0xb1f04d4, %i0, %g2
	ldxa	[%g1] 0x47, %l2
	setx	0x7fffffff, %i0, %i1
	and	%i1, %l2, %l2
	cmp	%g2, %l2
	bne	bad_end
	setx	0xbe656971b07079d2, %i0, %g3
	or	%g1, %l0, %g1
	ldxa	[%g1] 0x46, %l3
	cmp	%g3, %l3
	bne	bad_end
	add	%g1, 8, %g1
	setx	0x271577fb23572d27, %i0, %g4
	ldxa	[%g1] 0x46, %l4
	cmp	%g4, %l4
	bne	bad_end

!! addr = c30 (index=67, way=1)  tag = 4c08e32  d1 = b6456705300c980d  d2 = fc01e8b36762febe
	setx	0xc30, %i0, %g1
	setx	0x4c08e32, %i0, %g2
	stxa	%g2, [%g1] 0x47
	setx	0xb6456705300c980d, %i0, %g2
	stxa	%g2, [%g1] 0x46
	add	%g1, 8, %g1
	setx	0xfc01e8b36762febe, %i0, %g2
	stxa	%g2, [%g1] 0x46
!! addr = 1610 (index=97, way=2)  tag = f40b1c2  d1 = 7d901fc3594beb60  d2 = 2fd594a23fb50d5b
	setx	0x1610, %i0, %g1
	setx	0xf40b1c2, %i0, %g2
	stxa	%g2, [%g1] 0x47
	setx	0x7d901fc3594beb60, %i0, %g2
	stxa	%g2, [%g1] 0x46
	add	%g1, 8, %g1
	setx	0x2fd594a23fb50d5b, %i0, %g2
	stxa	%g2, [%g1] 0x46
!! addr = b60  tag = 7c0d82b  d1 = fdd47f35d785de05  d2 = a2bef616a72356ec
	setx	0xb60, %i0, %g1
	setx	0x7c0d82b, %i0, %g2
	ldxa	[%g1] 0x47, %l2
	setx	0x7fffffff, %i0, %i1
	and	%i1, %l2, %l2
	cmp	%g2, %l2
	bne	bad_end
	setx	0xfdd47f35d785de05, %i0, %g3
	or	%g1, %l0, %g1
	ldxa	[%g1] 0x46, %l3
	cmp	%g3, %l3
	bne	bad_end
	add	%g1, 8, %g1
	setx	0xa2bef616a72356ec, %i0, %g4
	ldxa	[%g1] 0x46, %l4
	cmp	%g4, %l4
	bne	bad_end

!! addr = 1cd0 (index=77, way=3)  tag = 21402be  d1 = a70a79117b69095d  d2 = 8c38cd0e4372b24
	setx	0x1cd0, %i0, %g1
	setx	0x21402be, %i0, %g2
	stxa	%g2, [%g1] 0x47
	setx	0xa70a79117b69095d, %i0, %g2
	stxa	%g2, [%g1] 0x46
	add	%g1, 8, %g1
	setx	0x8c38cd0e4372b24, %i0, %g2
	stxa	%g2, [%g1] 0x46
!! addr = 6e0 (index=110, way=0)  tag = 114a6ba4  d1 = 7f42abe8347a9692  d2 = 7252a4229eb20054
	setx	0x6e0, %i0, %g1
	setx	0x114a6ba4, %i0, %g2
	stxa	%g2, [%g1] 0x47
	setx	0x7f42abe8347a9692, %i0, %g2
	stxa	%g2, [%g1] 0x46
	add	%g1, 8, %g1
	setx	0x7252a4229eb20054, %i0, %g2
	stxa	%g2, [%g1] 0x46
!! addr = 460  tag = 11fb308c  d1 = 1316e1b4c00086e0  d2 = ee721e461619d98f
	setx	0x460, %i0, %g1
	setx	0x11fb308c, %i0, %g2
	ldxa	[%g1] 0x47, %l2
	setx	0x7fffffff, %i0, %i1
	and	%i1, %l2, %l2
	cmp	%g2, %l2
	bne	bad_end
	setx	0x1316e1b4c00086e0, %i0, %g3
	or	%g1, %l0, %g1
	ldxa	[%g1] 0x46, %l3
	cmp	%g3, %l3
	bne	bad_end
	add	%g1, 8, %g1
	setx	0xee721e461619d98f, %i0, %g4
	ldxa	[%g1] 0x46, %l4
	cmp	%g4, %l4
	bne	bad_end

!! addr = 1ca0 (index=74, way=3)  tag = 453ee2a  d1 = 3b87d53ee7258deb  d2 = b578df35d973262f
	setx	0x1ca0, %i0, %g1
	setx	0x453ee2a, %i0, %g2
	stxa	%g2, [%g1] 0x47
	setx	0x3b87d53ee7258deb, %i0, %g2
	stxa	%g2, [%g1] 0x46
	add	%g1, 8, %g1
	setx	0xb578df35d973262f, %i0, %g2
	stxa	%g2, [%g1] 0x46
!! addr = 1d80 (index=88, way=3)  tag = 1e78ea9e  d1 = 7c22b87dbd08c9d5  d2 = 5bc1394668ebedbd
	setx	0x1d80, %i0, %g1
	setx	0x1e78ea9e, %i0, %g2
	stxa	%g2, [%g1] 0x47
	setx	0x7c22b87dbd08c9d5, %i0, %g2
	stxa	%g2, [%g1] 0x46
	add	%g1, 8, %g1
	setx	0x5bc1394668ebedbd, %i0, %g2
	stxa	%g2, [%g1] 0x46
!! addr = cf0  tag = 1e8f1f6c  d1 = 69fc6109181d8776  d2 = 28bfe1cb158a1c77
	setx	0xcf0, %i0, %g1
	setx	0x1e8f1f6c, %i0, %g2
	ldxa	[%g1] 0x47, %l2
	setx	0x7fffffff, %i0, %i1
	and	%i1, %l2, %l2
	cmp	%g2, %l2
	bne	bad_end
	setx	0x69fc6109181d8776, %i0, %g3
	or	%g1, %l0, %g1
	ldxa	[%g1] 0x46, %l3
	cmp	%g3, %l3
	bne	bad_end
	add	%g1, 8, %g1
	setx	0x28bfe1cb158a1c77, %i0, %g4
	ldxa	[%g1] 0x46, %l4
	cmp	%g4, %l4
	bne	bad_end

!! addr = de0 (index=94, way=1)  tag = 333fe0c  d1 = eeae94fcdaf180d4  d2 = 4e03f87fd67270c2
	setx	0xde0, %i0, %g1
	setx	0x333fe0c, %i0, %g2
	stxa	%g2, [%g1] 0x47
	setx	0xeeae94fcdaf180d4, %i0, %g2
	stxa	%g2, [%g1] 0x46
	add	%g1, 8, %g1
	setx	0x4e03f87fd67270c2, %i0, %g2
	stxa	%g2, [%g1] 0x46
!! addr = 620 (index=98, way=0)  tag = 3569d6e  d1 = e874cfb6672cfbbb  d2 = 618415ccd3bb210f
	setx	0x620, %i0, %g1
	setx	0x3569d6e, %i0, %g2
	stxa	%g2, [%g1] 0x47
	setx	0xe874cfb6672cfbbb, %i0, %g2
	stxa	%g2, [%g1] 0x46
	add	%g1, 8, %g1
	setx	0x618415ccd3bb210f, %i0, %g2
	stxa	%g2, [%g1] 0x46
!! addr = 12f0  tag = ae169cc  d1 = b5c76aa92a2ec7e7  d2 = e4be01c4e32c6f4b
	setx	0x12f0, %i0, %g1
	setx	0xae169cc, %i0, %g2
	ldxa	[%g1] 0x47, %l2
	setx	0x7fffffff, %i0, %i1
	and	%i1, %l2, %l2
	cmp	%g2, %l2
	bne	bad_end
	setx	0xb5c76aa92a2ec7e7, %i0, %g3
	or	%g1, %l0, %g1
	ldxa	[%g1] 0x46, %l3
	cmp	%g3, %l3
	bne	bad_end
	add	%g1, 8, %g1
	setx	0xe4be01c4e32c6f4b, %i0, %g4
	ldxa	[%g1] 0x46, %l4
	cmp	%g4, %l4
	bne	bad_end

!! addr = 1d50 (index=85, way=3)  tag = d1ee9dc  d1 = c11d0ffd322d3e75  d2 = 1c98fa87c0368f03
	setx	0x1d50, %i0, %g1
	setx	0xd1ee9dc, %i0, %g2
	stxa	%g2, [%g1] 0x47
	setx	0xc11d0ffd322d3e75, %i0, %g2
	stxa	%g2, [%g1] 0x46
	add	%g1, 8, %g1
	setx	0x1c98fa87c0368f03, %i0, %g2
	stxa	%g2, [%g1] 0x46
!! addr = 1210 (index=33, way=2)  tag = 1d999c56  d1 = 52b873083b5c6913  d2 = c0d5e4afadf5b603
	setx	0x1210, %i0, %g1
	setx	0x1d999c56, %i0, %g2
	stxa	%g2, [%g1] 0x47
	setx	0x52b873083b5c6913, %i0, %g2
	stxa	%g2, [%g1] 0x46
	add	%g1, 8, %g1
	setx	0xc0d5e4afadf5b603, %i0, %g2
	stxa	%g2, [%g1] 0x46
!! addr = 1140  tag = 1f0aa173  d1 = d43fea7d30f8ae8b  d2 = 3b1304c2bde5a783
	setx	0x1140, %i0, %g1
	setx	0x1f0aa173, %i0, %g2
	ldxa	[%g1] 0x47, %l2
	setx	0x7fffffff, %i0, %i1
	and	%i1, %l2, %l2
	cmp	%g2, %l2
	bne	bad_end
	setx	0xd43fea7d30f8ae8b, %i0, %g3
	or	%g1, %l0, %g1
	ldxa	[%g1] 0x46, %l3
	cmp	%g3, %l3
	bne	bad_end
	add	%g1, 8, %g1
	setx	0x3b1304c2bde5a783, %i0, %g4
	ldxa	[%g1] 0x46, %l4
	cmp	%g4, %l4
	bne	bad_end

!! addr = 19a0 (index=26, way=3)  tag = 2cbcfe  d1 = 33eaec311b2cf46b  d2 = aec65f255fee5858
	setx	0x19a0, %i0, %g1
	setx	0x2cbcfe, %i0, %g2
	stxa	%g2, [%g1] 0x47
	setx	0x33eaec311b2cf46b, %i0, %g2
	stxa	%g2, [%g1] 0x46
	add	%g1, 8, %g1
	setx	0xaec65f255fee5858, %i0, %g2
	stxa	%g2, [%g1] 0x46
!! addr = 60 (index=6, way=0)  tag = 10011b26  d1 = 71546b28388924f0  d2 = d5960a2e18042891
	setx	0x60, %i0, %g1
	setx	0x10011b26, %i0, %g2
	stxa	%g2, [%g1] 0x47
	setx	0x71546b28388924f0, %i0, %g2
	stxa	%g2, [%g1] 0x46
	add	%g1, 8, %g1
	setx	0xd5960a2e18042891, %i0, %g2
	stxa	%g2, [%g1] 0x46
!! addr = ed0  tag = 18d62073  d1 = 3c9e53e68269b7f7  d2 = ba87cef8ec7cd672
	setx	0xed0, %i0, %g1
	setx	0x18d62073, %i0, %g2
	ldxa	[%g1] 0x47, %l2
	setx	0x7fffffff, %i0, %i1
	and	%i1, %l2, %l2
	cmp	%g2, %l2
	bne	bad_end
	setx	0x3c9e53e68269b7f7, %i0, %g3
	or	%g1, %l0, %g1
	ldxa	[%g1] 0x46, %l3
	cmp	%g3, %l3
	bne	bad_end
	add	%g1, 8, %g1
	setx	0xba87cef8ec7cd672, %i0, %g4
	ldxa	[%g1] 0x46, %l4
	cmp	%g4, %l4
	bne	bad_end

!! addr = 1f80 (index=120, way=3)  tag = 153fa0bc  d1 = ce992dcb8ccf7193  d2 = a900c872a1f14764
	setx	0x1f80, %i0, %g1
	setx	0x153fa0bc, %i0, %g2
	stxa	%g2, [%g1] 0x47
	setx	0xce992dcb8ccf7193, %i0, %g2
	stxa	%g2, [%g1] 0x46
	add	%g1, 8, %g1
	setx	0xa900c872a1f14764, %i0, %g2
	stxa	%g2, [%g1] 0x46
!! addr = 420 (index=66, way=0)  tag = 10735b32  d1 = 33f7180c20428a2  d2 = fde973c6aa39e4f4
	setx	0x420, %i0, %g1
	setx	0x10735b32, %i0, %g2
	stxa	%g2, [%g1] 0x47
	setx	0x33f7180c20428a2, %i0, %g2
	stxa	%g2, [%g1] 0x46
	add	%g1, 8, %g1
	setx	0xfde973c6aa39e4f4, %i0, %g2
	stxa	%g2, [%g1] 0x46
!! addr = 420  tag = 10735b33  d1 = 33f7180c20428a2  d2 = fde973c6aa39e4f4
	setx	0x420, %i0, %g1
	setx	0x10735b33, %i0, %g2
	ldxa	[%g1] 0x47, %l2
	setx	0x7fffffff, %i0, %i1
	and	%i1, %l2, %l2
	cmp	%g2, %l2
	bne	bad_end
	setx	0x33f7180c20428a2, %i0, %g3
	or	%g1, %l0, %g1
	ldxa	[%g1] 0x46, %l3
	cmp	%g3, %l3
	bne	bad_end
	add	%g1, 8, %g1
	setx	0xfde973c6aa39e4f4, %i0, %g4
	ldxa	[%g1] 0x46, %l4
	cmp	%g4, %l4
	bne	bad_end

!! addr = 5f0 (index=95, way=0)  tag = 13e72648  d1 = 412647398f68f609  d2 = 897d90c7aa2eca0d
	setx	0x5f0, %i0, %g1
	setx	0x13e72648, %i0, %g2
	stxa	%g2, [%g1] 0x47
	setx	0x412647398f68f609, %i0, %g2
	stxa	%g2, [%g1] 0x46
	add	%g1, 8, %g1
	setx	0x897d90c7aa2eca0d, %i0, %g2
	stxa	%g2, [%g1] 0x46
!! addr = 1fc0 (index=124, way=3)  tag = 17c1d56  d1 = 2daac0e7a0363ba  d2 = e7af68322271d7a3
	setx	0x1fc0, %i0, %g1
	setx	0x17c1d56, %i0, %g2
	stxa	%g2, [%g1] 0x47
	setx	0x2daac0e7a0363ba, %i0, %g2
	stxa	%g2, [%g1] 0x46
	add	%g1, 8, %g1
	setx	0xe7af68322271d7a3, %i0, %g2
	stxa	%g2, [%g1] 0x46
!! addr = 420  tag = 10735b33  d1 = 33f7180c20428a2  d2 = fde973c6aa39e4f4
	setx	0x420, %i0, %g1
	setx	0x10735b33, %i0, %g2
	ldxa	[%g1] 0x47, %l2
	setx	0x7fffffff, %i0, %i1
	and	%i1, %l2, %l2
	cmp	%g2, %l2
	bne	bad_end
	setx	0x33f7180c20428a2, %i0, %g3
	or	%g1, %l0, %g1
	ldxa	[%g1] 0x46, %l3
	cmp	%g3, %l3
	bne	bad_end
	add	%g1, 8, %g1
	setx	0xfde973c6aa39e4f4, %i0, %g4
	ldxa	[%g1] 0x46, %l4
	cmp	%g4, %l4
	bne	bad_end

!! addr = 840 (index=4, way=1)  tag = daa10be  d1 = 7346292fd602032b  d2 = 16d15abe23119178
	setx	0x840, %i0, %g1
	setx	0xdaa10be, %i0, %g2
	stxa	%g2, [%g1] 0x47
	setx	0x7346292fd602032b, %i0, %g2
	stxa	%g2, [%g1] 0x46
	add	%g1, 8, %g1
	setx	0x16d15abe23119178, %i0, %g2
	stxa	%g2, [%g1] 0x46
!! addr = 19b0 (index=27, way=3)  tag = 104b93f8  d1 = ec9de430a9cbcc09  d2 = 64ca5771f1eefd57
	setx	0x19b0, %i0, %g1
	setx	0x104b93f8, %i0, %g2
	stxa	%g2, [%g1] 0x47
	setx	0xec9de430a9cbcc09, %i0, %g2
	stxa	%g2, [%g1] 0x46
	add	%g1, 8, %g1
	setx	0x64ca5771f1eefd57, %i0, %g2
	stxa	%g2, [%g1] 0x46
!! addr = d10  tag = 6e36a63  d1 = 7ca6c090e80bf514  d2 = 678945185d5f84b
	setx	0xd10, %i0, %g1
	setx	0x6e36a63, %i0, %g2
	ldxa	[%g1] 0x47, %l2
	setx	0x7fffffff, %i0, %i1
	and	%i1, %l2, %l2
	cmp	%g2, %l2
	bne	bad_end
	setx	0x7ca6c090e80bf514, %i0, %g3
	or	%g1, %l0, %g1
	ldxa	[%g1] 0x46, %l3
	cmp	%g3, %l3
	bne	bad_end
	add	%g1, 8, %g1
	setx	0x678945185d5f84b, %i0, %g4
	ldxa	[%g1] 0x46, %l4
	cmp	%g4, %l4
	bne	bad_end

!! addr = d10 (index=81, way=1)  tag = 7569f20  d1 = 11be529c64ea2b96  d2 = f352a12f4bd6e20a
	setx	0xd10, %i0, %g1
	setx	0x7569f20, %i0, %g2
	stxa	%g2, [%g1] 0x47
	setx	0x11be529c64ea2b96, %i0, %g2
	stxa	%g2, [%g1] 0x46
	add	%g1, 8, %g1
	setx	0xf352a12f4bd6e20a, %i0, %g2
	stxa	%g2, [%g1] 0x46
!! addr = ed0 (index=109, way=1)  tag = 1855d506  d1 = 149f879bd87f6da0  d2 = 233caac04480f30b
	setx	0xed0, %i0, %g1
	setx	0x1855d506, %i0, %g2
	stxa	%g2, [%g1] 0x47
	setx	0x149f879bd87f6da0, %i0, %g2
	stxa	%g2, [%g1] 0x46
	add	%g1, 8, %g1
	setx	0x233caac04480f30b, %i0, %g2
	stxa	%g2, [%g1] 0x46
!! addr = 1ed0  tag = 16ca3af8  d1 = c5d1fe14f449fd4c  d2 = 4e1439ffffdeb808
	setx	0x1ed0, %i0, %g1
	setx	0x16ca3af8, %i0, %g2
	ldxa	[%g1] 0x47, %l2
	setx	0x7fffffff, %i0, %i1
	and	%i1, %l2, %l2
	cmp	%g2, %l2
	bne	bad_end
	setx	0xc5d1fe14f449fd4c, %i0, %g3
	or	%g1, %l0, %g1
	ldxa	[%g1] 0x46, %l3
	cmp	%g3, %l3
	bne	bad_end
	add	%g1, 8, %g1
	setx	0x4e1439ffffdeb808, %i0, %g4
	ldxa	[%g1] 0x46, %l4
	cmp	%g4, %l4
	bne	bad_end

!! addr = 380 (index=56, way=0)  tag = 1ef9565a  d1 = 6ae5e0b2429ee327  d2 = e4047338b59e368
	setx	0x380, %i0, %g1
	setx	0x1ef9565a, %i0, %g2
	stxa	%g2, [%g1] 0x47
	setx	0x6ae5e0b2429ee327, %i0, %g2
	stxa	%g2, [%g1] 0x46
	add	%g1, 8, %g1
	setx	0xe4047338b59e368, %i0, %g2
	stxa	%g2, [%g1] 0x46
!! addr = 11c0 (index=28, way=2)  tag = 15b2cbf4  d1 = 514f881d718f7ad1  d2 = e619949a59ec85f6
	setx	0x11c0, %i0, %g1
	setx	0x15b2cbf4, %i0, %g2
	stxa	%g2, [%g1] 0x47
	setx	0x514f881d718f7ad1, %i0, %g2
	stxa	%g2, [%g1] 0x46
	add	%g1, 8, %g1
	setx	0xe619949a59ec85f6, %i0, %g2
	stxa	%g2, [%g1] 0x46
!! addr = d10  tag = 7569f20  d1 = 11be529c64ea2b96  d2 = f352a12f4bd6e20a
	setx	0xd10, %i0, %g1
	setx	0x7569f20, %i0, %g2
	ldxa	[%g1] 0x47, %l2
	setx	0x7fffffff, %i0, %i1
	and	%i1, %l2, %l2
	cmp	%g2, %l2
	bne	bad_end
	setx	0x11be529c64ea2b96, %i0, %g3
	or	%g1, %l0, %g1
	ldxa	[%g1] 0x46, %l3
	cmp	%g3, %l3
	bne	bad_end
	add	%g1, 8, %g1
	setx	0xf352a12f4bd6e20a, %i0, %g4
	ldxa	[%g1] 0x46, %l4
	cmp	%g4, %l4
	bne	bad_end


        nop
        EXIT_GOOD
        nop
        nop

bad_end:
	EXIT_BAD
        nop
        nop
/************************************************************************
   Test case data start
 ************************************************************************/
.data

user_data_start:
.xword 0x0001020304050607
.xword 0x08090a0b0c0d0e0f
.xword 0x1011121314151617
.xword 0x18191a1b1c1d1e1f
.xword 0x2021222324252627
.xword 0x28292a2b2c2d2e2f
.xword 0x3031323334353637
.xword 0x38393a3b3c3d3e3f
.xword 0x4041424344454647
.xword 0x48494a4b4c4d4e4f
.xword 0x5051525354555657
.xword 0x58595a5b5c5d5e5f
.xword 0x6061626364656667
.xword 0x68696a6b6c6d6e6f
.xword 0x7071727374757677
.xword 0x78797a7b7c7d7e7f
.xword 0x8081828384858687
.xword 0x88898a8b8c8d8e8f
.xword 0x9091929394959697
.xword 0x98999a9b9c9d9e9f
.xword 0xa0a1a2a3a4a5a6a7
.xword 0xa8a9aaabacadaeaf
.xword 0xb0b1b2b3b4b5b6b7
.xword 0xb8b9babbbcbdbebf
.xword 0xc0c1c2c3c4c5c6c7
.xword 0xc8c9cacbcccdcecf
.xword 0xd0d1d2d3d4d5d6d7
.xword 0xd8d9dadbdcdddedf
.xword 0xe0e1e2e3e4e5e6e7
.xword 0xe8e9eaebecedeeef
.xword 0xf0f1f2f3f4f5f6f7
.xword 0xf8f9fafbfcfdfeff
.end
