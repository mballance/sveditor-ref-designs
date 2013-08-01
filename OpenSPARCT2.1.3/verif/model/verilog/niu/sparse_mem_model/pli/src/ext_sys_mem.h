/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: ext_sys_mem.h
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
 * $RCSfile: ext_sys_mem.h,v $
 *
 * $Revision: 1.1.1.1 $
 * $Date: 2007/02/13 22:21:46 $
 * $Author: drp $
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
#ifndef __EXT_SYS_MEM_DEFINED__
#define __EXT_SYS_MEM_DEFINED__

#include <assert.h>
#include <stdlib.h>
#include <string.h>
#include <ctype.h>
#include <stdio.h>
#include "uint64.h"

#define SYS_HTBL_SIZE  1024
#define SYS_CHUNK_SIZE  512
#define SYS_CHUNK_BITS  19 // = lg(SYS_CHUNK_SIZE)

typedef unsigned int    dword;
typedef unsigned int    uint;
typedef unsigned char   byte;

typedef struct HTABLE   HTABLE;
typedef struct MEMCHUNK MEMCHUNK;

struct PAGE_INFO {
  uint Present;
  uint Global;
  uint PageSize;
  uint Accessed;
  uint Dirty;
  uint Pcd;
  uint Pwt;
  uint User;
  uint Writeable;
  uint PhysTag; // PA[35:12]
  uint PF;
  uint GP;
};

// 512 byte chunk of data + chunk tag + next chunk pointers
struct MEMCHUNK {
  long long unsigned int   tag;                    // address bits 63:19
  MEMCHUNK               * left;                   // pointer to next (lesser) tag
  MEMCHUNK               * right;                  // pointer to next (greater) tag
  dword                    data[SYS_CHUNK_SIZE/4]; // 512 byte block of data
};

// hash table entry
struct HTABLE_ENTRY {
  byte                     valid;                  // hash table valid bit
  MEMCHUNK               * mraPtr;                 // pointer to most recently accessed MEMCHUNK
  MEMCHUNK               * headPtr;                // pointer to first MEMCHUNK in chunk binary tree
};

class SYS_MEM {
private:
  HTABLE_ENTRY htable[SYS_HTBL_SIZE];
  uint _ClrMemVal;
  int iUseRandom;
  int GetAddressFromString(char *InputBuffer, unsigned int *Addr);
  int PreCheckError(FILE *memfile, char *filename);

public:
  void *ReturnHTable(){return (void*)&htable;}
  SYS_MEM();
  void dump(char *FileName);
  void dumpMemTree(FILE *memfile, MEMCHUNK *K7Block, int Index);
  void load(FILE *memfile, char *Filename=NULL,
	    long long unsigned int addrLimitLow=0, long long unsigned int addrLimitHigh=0); 

  unsigned char read(dword addrh, dword addr);                                            // byte
  uint read(dword addrh, dword addr, dword *data);                                        // dWord
  void read(dword addrh, dword addr, dword *data1, dword *data0);                         // qWord
  long long unsigned int read(long long unsigned int addr, long long unsigned int *data); // qWord #2
  unsigned char * read(dword addrh, dword addr, uint Size);                               // defined Size
  uint readBit(dword addrh, dword addr, dword bitField);

  void write(dword addrh, dword addr, byte data);                                         // byte
  void write(dword addrh, dword addr, byte be, dword data);                               // dWord
  void write(dword addrh, dword addr, byte be, dword data1, dword data0);                 // qWord
  void write(long long unsigned int addr, byte be, long long unsigned int data);          // qWord #2
  void SetDefaultMemVal(uint val);
  void SetDefaultMemRandom();

  // unsigned long long versions
  unsigned char read(unsigned long long Ad) {return read((uint)(Ad>>32),(uint)Ad);}       // byte

  /*
  // uint64 versions
  unsigned char read(uint64 Ad) {return read(Ad[1],Ad[0]);}                               // byte
  void read(uint64 Ad, dword *data) {read(Ad[1],Ad[0],data);}                             // dWord
  void read(uint64 Ad, dword *data1, dword *data0) {read(Ad[1],Ad[0],data1,data0);}       // qWord
  unsigned char * read(uint64 Ad, uint Size) {return read(Ad[1],Ad[0],Size);}             // defined Size
  uint readBit(uint64 Ad, dword bitField) {return readBit(Ad[1],Ad[0],bitField);}
  void write(uint64 Ad, byte be, dword data1, dword data0) {write(Ad[1],Ad[0],be,data1,data0);}
  void write(uint64 Ad, byte be, dword data) {write(Ad[1],Ad[0],be, data);}

  */
  uint debug;
};

#endif
