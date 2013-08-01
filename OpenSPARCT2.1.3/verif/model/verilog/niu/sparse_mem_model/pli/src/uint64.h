/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: uint64.h
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
// Copyright 2001 ADVANCED MICRO DEVICES, INC. All Rights Reserved.
// 
// This software and any related documentation (the "Materials") are the
// confidential proprietary information of AMD. Unless otherwise provided 
// in an agreement specifically licensing the Materials, the Materials are 
// provided in confidence and may not to be used, distributed, modified, or 
// reproduced in whole or in part by any means.
// 
// LIMITATION OF LIABILITY: THE MATERIALS ARE PROVIDED "AS IS" WITHOUT ANY
// EXPRESS OR IMPLIED WARRANTY OF ANY KIND, INCLUDING BUT NOT LIMITED TO 
// WARRANTIES OF MERCHANTABILITY, NONINFRINGEMENT, TITLE, FITNESS FOR ANY 
// PARTICULAR PURPOSE, OR WARRANTIES ARISING FORM CONDUCT, COURSE OF 
// DEALING, OR USAGE OF TRADE.  IN NO EVENT SHALL AMD OR ITS LICENSORS BE 
// LIABLE FOR ANY DAMAGES WHATSOEVER (INCLUDING, WITHOUT LIMITATION, 
// DAMAGES FOR LOSS OF PROFITS, BUSINESS INTERRUPTION, OR LOSS OF 
// INFORMATION) ARISING OUT OF THE USE OF OR INABILITY TO USE THE 
// MATERIALS, EVEN IF AMD HAS BEEN ADVISED OF THE POSSIBILITY OF SUCH 
// DAMAGES.  BECAUSE SOME JURISDICTIONS PROHIBIT THE EXCLUSION OR 
// LIMITATION OF LIABILITY FOR CONSEQUENTIAL OR INCIDENTAL DAMAGES, THE 
// ABOVE LIMITATION MAY NOT APPLY TO YOU.  
// 
// AMD does not assume any responsibility for any errors which may appear 
// in the Materials nor any responsibility to support or update the
// Materials.  AMD retains the right to modify the Materials at any time, 
// without notice, and is not obligated to provide such modified Materials 
// to you.
// 
// NO SUPPORT OBLIGATION: AMD is not obligated to furnish, support, or make
// any further information, software, technical information, know-how, or 
// show-how available to you.
// 
// U.S. GOVERNMENT RESTRICTED RIGHTS: The Materials are provided with
// "RESTRICTED RIGHTS." Use, duplication, or disclosure by the Government 
// is subject to the restrictions as set forth in FAR 52.227-14 and DFAR
// 252.227-7013, et seq., or its successor.  Use of the Materials by the
// Government constitutes acknowledgement of AMD's proprietary rights in 
// them.
// 
////////////////////////////////////////////////////////////////////////////////

/*****************************************************************************
 *
 * $RCSfile: uint64.h,v $
 *
 * $Revision: 1.3 $
 * $Date: 2008/02/21 09:51:26 $
 * $Author: nhussain $
 * $State: Exp $
 * $Locker:  $
 *
 * Copyright (c) 1997 by Advanced Micro Devices, Inc.
 *
 * This file is protected by Federal Copyright Law, with all rights
 * reserved. No part of this file may be reproduced, stored in a
 * retrieval system, translated, transcribed, or transmitted, in any
 * form, or by any means manual, electric, electronic, mechanical,
 * electro-magnetic, chemical, optical, or otherwise, without prior
 * explicit written permission from Advanced Micro Devices, Inc.
 *
 ****************************************************************************/
#ifndef __UINT64_DEFINED__
#define __UINT64_DEFINED__

#include <stdlib.h>
#include <stdio.h>
#include <fstream>
#include <iomanip>

typedef unsigned int uint;
typedef int BOOL; // bozo:  stupid XLC compiler

class uint64 { // 64-bit integer, use operator[] to directly access the individual 32-bit integers
public:
  uint64() { hi = lo = 0; }
  uint64(uint first, uint second) { hi = first; lo = second; }
  uint64(uint Ad32) { hi = 0; lo = Ad32; }
  uint& operator[](uint i) { if (i>1) index_error(i); return i?hi:lo; } // can be used as an l-value

private:
  uint hi, lo;

  void index_error(uint bad_index);
};

inline uint uint_max(uint i, uint j) { return (i>j)?i:j; }

inline BOOL operator==(uint64 i, uint64 j) { return (i[1] == j[1]) && (i[0] == j[0]); }
inline BOOL operator<(uint64 i, uint64 j)  { return (i[1] == j[1]) ? (i[0] < j[0]) : (i[1] < j[1]); }

inline BOOL operator!=(uint64 i, uint64 j) { return  !(i == j); }
inline BOOL operator>=(uint64 i, uint64 j) { return  !(i <  j); }

inline BOOL operator<=(uint64 i, uint64 j) { return  ((i <  j) || (i == j)); }
inline BOOL operator>(uint64 i, uint64 j)  { return !((i <  j) || (i == j)); }

inline uint64 operator|(uint64 i, uint64 j) { return uint64(i[1] | j[1], i[0] | j[0]); }
inline uint64 operator&(uint64 i, uint64 j) { return uint64(i[1] & j[1], i[0] & j[0]); }
inline uint64 operator^(uint64 i, uint64 j) { return uint64(i[1] ^ j[1], i[0] ^ j[0]); }
inline uint64 operator~(uint64 i)           { return uint64(~i[1],~i[0]); }
uint64 operator<<(uint64 i, uint shift);
uint64 operator>>(uint64 i, uint shift);
inline uint64 operator+(uint64 i, uint64 j) { return uint64( i[1]+j[1] + ((i[0]+j[0]<uint_max(i[0],j[0]))?1:0), i[0]+j[0] ); }
inline uint64 operator-(uint64 i, uint64 j) { return uint64( i[1]-j[1] - ((i[0]<j[0])?1:0), i[0]-j[0] ); }

inline uint64 operator|=(uint64 &i, uint64 j) { i = i | j; return i; }
inline uint64 operator&=(uint64 &i, uint64 j) { i = i & j; return i; }
inline uint64 operator^=(uint64 &i, uint64 j) { i = i ^ j; return i; }
inline uint64 operator+=(uint64 &i, uint64 j) { i = i + j; return i; }
inline uint64 operator-=(uint64 &i, uint64 j) { i = i - j; return i; }
inline uint64 operator<<=(uint64 &i, uint shift) { i = i << shift; return i; }
inline uint64 operator>>=(uint64 &i, uint shift) { i = i >> shift; return i; }

std::ostream& operator<<(std::ostream& os, uint64 Ad);

// just a little routine demonstrating how to use the uint64 class
void test_uint64();


// convert "uint64" to "unsigned long long"
inline unsigned long long Uint64ToLonglong(uint64 i) 
{
     return( (((unsigned long long)i[1]) << 32) | i[0] );
}

// convert "unsigned long long" to "uint64"
inline uint64 LonglongToUint64(unsigned long long j)
{
     return (uint64( (uint (j>>32)), (uint (0x00000000ffffffffll & j)) ) );
}

// return the high order 32 bits of an unsigned long long
inline uint LonglongToIntHi(unsigned long long j) { return (uint (j>>32)); };

// return the low order 32 bits of an unsigned long long
inline uint LonglongToIntLo(unsigned long long j) 
{ 
     return (uint (0x00000000ffffffffll & j));
};

inline unsigned long long IntToLonglong(unsigned int hi, unsigned int lo) 
{
     return( (((unsigned long long) hi) << 32) | lo );
}


// return a mask to zero out the upper bits above "hi"
inline unsigned long long ZeroUpper(unsigned int hi, unsigned int lo) 
{
     return(  ~(0xffffffffffffffffLL << (hi - lo + 1)) );
}


// this function takes two integers (hi_half and lo_half), 
// extracts the field [hi:lo]
// base specifies the address value of bit 0

inline unsigned long long ExtractField(unsigned int hi_half, unsigned int lo_half, unsigned int hi, unsigned int lo, unsigned int base=0) 
{
     unsigned long long data = IntToLonglong(hi_half, lo_half);
     unsigned long long mask = ZeroUpper(hi, lo);
               
     data = data >> (lo - base);            // shift the field to bit 0
     return ( data & mask ); // mask out the upper bits
}

#endif





