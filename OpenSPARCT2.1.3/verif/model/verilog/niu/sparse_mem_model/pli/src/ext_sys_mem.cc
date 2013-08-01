// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: ext_sys_mem.cc
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
 * $RCSfile: ext_sys_mem.cc,v $
 *
 * $Revision: 1.3 $
 * $Date: 2008/02/21 09:51:16 $
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
#include <iostream>
#include <stdlib.h>
#include <stdio.h>
#include "ext_sys_mem.h"
#include "vcsuser.h"

////////////////////////////////////////////////////////////////////////////////
//
//  System Memory Model
//
//  Author: Ron Herzer x52085
//
//  Function:
//  Implements a 64-Gig memory with 64-bit reads, and 64-bit writes that are
//  byte-wise granular.  Dynamically allocates memory in 512 byte chunks
//  as needed.
// 
//  Data structures:
//    Uses a 1024 entry hash table for first lookup step for quick access.
//    Uses binary tree for storing multiple hits to the same hash table index.
//    Keeps track of last tree node hit for each hash table index for
//    quick subsequent accesses to the same chunk.
//
////////////////////////////////////////////////////////////////////////////////

// Constructor clears all valid bits in hash table.
SYS_MEM::SYS_MEM () {
  int i;
  _ClrMemVal = 0xffffffff;
  iUseRandom = 0;
  for (i=0; i<SYS_HTBL_SIZE; i++) htable[i].valid=0;
  debug = 0;
}

void SYS_MEM::SetDefaultMemRandom() {
  iUseRandom = 1;
}

void SYS_MEM::SetDefaultMemVal(uint val) {
  iUseRandom = 0;
  val &= 0xff;
  io_printf("SYS_MEM::Setting default memory to 0x%02x\n", val);
  val = val <<  8 | val;
  val = val << 16 | val;
  _ClrMemVal = val;
}


void SYS_MEM::dump (char *FileName) {
MEMCHUNK     *CurK7Block;
HTABLE_ENTRY *K7MemTable;
HTABLE_ENTRY *NextTableEntry;
FILE *memfile;

  if (0==strcmp(FileName, "-")) {
    memfile = stdout;
  } else {
    memfile = fopen(FileName, "w");
  }

  if (!memfile) {
    io_printf("SYS_MEM::error - unable to open output file: %s", FileName);
  } else {
    io_printf("SYS_MEM::dump dumping memory to %s\n", FileName);
  }

  assert(memfile);
  K7MemTable = (HTABLE_ENTRY *) ReturnHTable();
  for (int idx = 0; idx < SYS_HTBL_SIZE; idx++) {
    NextTableEntry = (HTABLE_ENTRY*) ((int)(K7MemTable) + (idx*(sizeof(HTABLE_ENTRY))));
    if (NextTableEntry->valid) {
      CurK7Block = NextTableEntry->headPtr;
      dumpMemTree(memfile, CurK7Block, idx);
    }
  }
  fclose(memfile);
}


void SYS_MEM::dumpMemTree(FILE *memfile, MEMCHUNK *K7Block, int Index) {
  uint PrintNice;
  unsigned char K7Data;
  uint AddrHi, AddrLo;

  if (K7Block->right)
    dumpMemTree(memfile, K7Block->right, Index);
  if (K7Block->left)
    dumpMemTree(memfile, K7Block->left,  Index);

  AddrLo = uint(K7Block->tag & 0xffffffffllu) | ((Index & 0x3ff) << 9);
  AddrHi = uint(K7Block->tag >> 32);

  if (AddrHi)
    fprintf(memfile, "@%02x_%08x\n", AddrHi, AddrLo);
  else
    fprintf(memfile, "@%08x\n", AddrLo);

  for(int idx = 0; idx < SYS_CHUNK_SIZE; idx++) {
    PrintNice = (idx + 1) % 16;
    K7Data = read(AddrHi, AddrLo+idx);
    if (PrintNice && (idx < (SYS_CHUNK_SIZE - 1)))
      fprintf(memfile, "%02x ", (K7Data & 0xff));
    else
      fprintf(memfile, "%02x\n", (K7Data & 0xff));
  }
}


// ***************************************************************************
// Get upto a 64 bit address from the given string (Note: '_' are
// allowed as delimiters within the address field).
// ***************************************************************************
int SYS_MEM::GetAddressFromString(char *InputBuffer, unsigned int *Addr) {
  static char AddrBufferHi[128];      // May hold 64bit address + delimiters
  static char AddrBufferLo[8+1];      // Only ever hold 4GB of address
  bool retVal       = true;
  bool FoundNonZero = false;

  char *destptr = AddrBufferHi;       // strip out '_'s, strip off leading '0's
  for (char *srcptr = InputBuffer; srcptr && *srcptr; srcptr++) {
    switch (*srcptr) {
      case '_': continue;
      case '0': if (!FoundNonZero) continue; break;
      default:  FoundNonZero = true;         break;
    }
    if (!isxdigit(*srcptr)) retVal = false;
    *destptr = *srcptr;
    destptr++;
  }
  *destptr = '\0';
  assert(strlen(AddrBufferHi) <= 16);
  if (strlen(AddrBufferHi) <= 8) {    // defined AddrHi, AddrLo
    strcpy(AddrBufferLo, strlen(AddrBufferHi) ? AddrBufferHi : "0"); // Were only zeroes there?
    strcpy(AddrBufferHi, "0");
  } else {
    strcpy(AddrBufferLo, AddrBufferHi + (strlen(AddrBufferHi) - 8));
    *(AddrBufferHi + (strlen(AddrBufferHi) - 8)) = '\0';
  }
  // scan them in
  retVal &= (sscanf(AddrBufferHi, "%x", Addr + 1)) ? true : false;
  retVal &= (sscanf(AddrBufferLo, "%x", Addr    )) ? true : false;
  return retVal;
}


// Load memory from .vram or .sim file.
// Should only be called once at the beginning of simulation.
// There is no function to deallocate any existing chunks.

// ***************************************************************************
void SYS_MEM::load (FILE *memfile, char *Filename,
		    long long unsigned int addrLimitLow, long long unsigned int addrLimitHigh) {
  const uint bufferSize = 0x100;
  char  line[bufferSize << 1]; // buffer is 2x since worst case bufferSize chars could be sneaked
  char  word[bufferSize];
  char  *lptr, *wptr;
  char  *chkptr;
  char  *filename = const_cast<char *>(Filename ? Filename : "<RAM FILE>");
  char  overFlow = '\n';
  uint  SkipOverFlow = 0;
  uint  overFlowCount;
  uint  CommentActive = 0x0;  // Needed for comments that exceed the bufferSize
                              // 0x0 - Not active
                              // 0x1 - Starting this line
                              // 0x2 - Continuing
                              // 0x4 - Ending this line
  dword address[2] = {0,0};   // assumes address starts at 0 if first @address not specified.
  dword data1,data0, dat;
  static uint ErrorCnt  = 0;  // Retain the knowledge that were already dead if multiple images are loaded
  uint ErrorCntLimit    = 0xffffffff;
  uint Done             = ErrorCnt;
  uint LineNum          = 0;
  byte  be;
  uint linechkDone      = 0, linechkErr;
  uint FoundAddr        = ErrorCnt; // Only flag first instance (if there's another error)...
  uint FoundData        = ErrorCnt; // Only flag first instance (if there's another error)...

  rewind (memfile); // Rewind the file in case this was previously loaded

  // load data in vram or sim file. - memfile should always be valid
  if (!memfile) {
    io_printf("SYS_MEM load error! Could not open memory file, %s, for reading.\n", filename);
  }

  // specifically check for NULL characters since some sim files
  // (randomly generated) have been noted to have NULL in file
  for (char prechk = fgetc(memfile); (prechk != EOF) && !Done; prechk = fgetc(memfile)) {
    if (prechk == 0) {
      io_printf("SYS_MEM::error - .sim load error: Found Null character in memory file, %s, at position: %u\n",
                filename, ftell(memfile));
      //Rc->Finish();
      ErrorCnt++;
      if (ErrorCnt >= ErrorCntLimit)
        Done++;
    }
  }
  rewind(memfile);  // Reset the file pointer

  while ((fgets(line, bufferSize, memfile)) && !Done) {
    if (SkipOverFlow && (CommentActive & 0x1))
      CommentActive = 0; // This was a comment that started and ended on the same line...

    SkipOverFlow = 0;
    linechkDone = 0;

    lptr = line; // pointer to line

    // Initialize here so overFlow is done once per buffer read...
    overFlowCount = 0;
    for (chkptr = line; chkptr && *chkptr; chkptr++) {
      overFlowCount++;
      overFlow = *chkptr;
    }
    overFlowCount--;
    if (chkptr && (overFlow == '\n'))
      SkipOverFlow = 1;

    if (CommentActive & 0x4)
      CommentActive = 0; // Continued comment ended last line

    if (overFlow == '\n') {
      if (CommentActive & 0x3)
        CommentActive = 0x4; // Continuing comment ending this line
      else
        CommentActive = 0;
      LineNum++;
    }
    else if (CommentActive & 0x3)
      CommentActive = 0x2; // Comment continuing

    if (!(CommentActive & 0x6)) {
      for (chkptr = line; chkptr && *chkptr && !linechkDone; chkptr++) {
        linechkErr = 0;
        if (*chkptr == '/') {
          if      (!(*(chkptr + 1)))      linechkErr  = 1;  // not quite a Comment
          else if (*(chkptr + 1) == '/') {
            linechkDone   = 1; // Comment for rest of line...
            CommentActive = 0x1;
          }
        } else {
          // In general, overFlowCount should never get larger than one since a byte will typically be
          // split -- don't forget about the possibility of a split address.
          if (!SkipOverFlow) {
            while (*line && (overFlowCount < ((bufferSize << 1)-1)) && (!isspace(line[overFlowCount]))) {
              overFlow = fgetc(memfile);
              //io_printf("Found line[%u] '%c', Line %4u sneaking char '%c' from stream",
              //            overFlowCount, line[overFlowCount], LineNum, overFlow);
              if (overFlow == EOF)
                overFlow = '\n';
              else if (overFlow == '\n') {
                ungetc(overFlow, memfile);
                LineNum++;
              }
              ++overFlowCount;
              line[overFlowCount] = overFlow;
              if (!overFlow) // Null terminates string and overflow search...
                overFlowCount = (bufferSize << 1);
            }
            assert(overFlowCount < (bufferSize << 1));
            line[overFlowCount+1] = '\0';
          }
  
          if (!(  isxdigit(*chkptr)
              ||  isspace(*chkptr)
              ||  (*chkptr == '_') // Allow '_' delimiters in addresses...
              ||  (*chkptr == '@')
          )) linechkErr = 1;
  
        }

        if (linechkErr) {
          io_printf("SYS_MEM::error - .sim load error: found illegal character '%c' in non-commented fields on line %u.\n",*chkptr, LineNum);
          //Rc->Finish();
          ErrorCnt++;
          if (ErrorCnt >= ErrorCntLimit)
            linechkDone  = 1;  // already exceeded error limit
        }
      }
    }

#ifdef DEBUG_COMMENTS
    if (CommentActive & 0x4)
      io_printf("Line %4u is a ending     comment -%s-\n", LineNum-1, line);
    else if (CommentActive & 0x2)
      io_printf("Line %4u is a continuing comment -%s-\n", LineNum, line);
    else if (CommentActive & 0x1)
      io_printf("Line %4u is a new        comment -%s-\n", LineNum, line);
    else
      io_printf("Line %4u is not a        comment -%s-\n", LineNum, line);
#endif

    while ((lptr && *lptr && (*lptr != '\n') && (sscanf(lptr,"%s",word)==1)) && !Done)
    {  // get the next word on the line
      if (ErrorCnt >= ErrorCntLimit) {
        io_printf("SYS_MEM::Error Limit exceeded: run with --assertions_warnings_only if a complete list is needed\n");
        Done++;
      }

      wptr = word;
      // skip comment lines (or comments at end of line) -- Note: already checked that '/' equates to '//'
      if (!(CommentActive & 0x6) && (*wptr != '/')) {
        if (*wptr=='@') { // found new address
          FoundAddr++;
          ++wptr;
          if (!GetAddressFromString(wptr, address)) {
            io_printf("SYS_MEM::Error while reading .sim file, %s:%u, unable to determine address from %s\n",
                      filename, LineNum, wptr);
            //Rc->Finish();
            ErrorCnt++;
          }
        } else { // write byte
          if (!sscanf(wptr,"%x",&dat)) {
            io_printf("SYS_MEM:: .sim load error: At %x%08x, Data '%s' is not a hex number at %s:%u\n",
              address[1], address[0], wptr, filename, LineNum);
            //Rc->Finish();
            ErrorCnt++;
          } else if (dat > 0xff) {
            io_printf("SYS_MEM:: .sim load error: Detected byte data '0x%02x' at %s:%u\n",
                      dat, filename, LineNum);
            //Rc->Finish();
            ErrorCnt++;
          }
          FoundData++;
          data1 = dat<<8*3&0xff000000 | dat<<8*2&0xff0000 | dat<<8*1&0xff00 | dat&0xff;
          data0 = data1;
          // decode byte enables & write byte to memory
          be=0x1<<((address[0])&0x7);

	  long long unsigned int addressLong = ((long long unsigned int)(address[1]) << 32) | (long long unsigned int)address[0];
	  if (!(addrLimitLow || addrLimitHigh) ||  // Limits not enabled
	      ((addrLimitLow <= addressLong) && (addressLong <= addrLimitHigh))) {
	    // DEBUG PRINT
	    // printf("load %s:  Addr: %02x_%08x (%02x) %02x\n", filename, address[1], address[0], (be & 0x000000ff), data0);
	    write(address[1],address[0],be,data1,data0);
	  }

          address[0]++;
          if (!address[0]) address[1]++; // increment addr[63:32] on wrap around of addr[31:0].
        }
      }
      else lptr=NULL;  // forget everything after comment
      // look for next space
      while(lptr && (*lptr != '\0') && isspace(*lptr)) lptr++; // skip whitespace within string
      // lptr=strstr(lptr," "); // note: returns null if not found
      while(lptr && (*lptr != '\0') && !isspace(*lptr)) lptr++; // skip whitespace
    }
  }
  if (!FoundAddr)
    io_printf("SYS_MEM::No address specifier in .sim file, %s.  The assembler/user must know exactly what's going on...\n", filename);
  if (!FoundData) {
    io_printf("SYS_MEM:: No data bytes found in .sim file, %s\n", filename);
    //Rc->Finish(); // Stop (this will be at the beginning of time...
  }
}


// ***************************************************************************
// Specific check for NULL characters since some sim files (randomly generated
// ones) have been noted to have NULL characters in the file.
// ***************************************************************************
int SYS_MEM::PreCheckError(FILE *memfile, char *filename) {
  bool Done = false;
  rewind (memfile); // Rewind the file in case this was previously loaded
  for (char prechk = fgetc(memfile); (prechk != EOF) && !Done; prechk = fgetc(memfile)) {
    if (prechk == '\0') {
      io_printf("SYS_MEM:: .sim load error: Found Null character in memory file, %s, at position: %u\n",
                filename, ftell(memfile));
      //Rc->Finish();
      Done |= true;
    }
  }
  rewind(memfile);  // Reset the file pointer
  return (Done);
}


// ***************************************************************************
// Memory Read QW
// Maximum address size = 64 bits.  Aligned to QW boundary. (A[2:0] not used)
// Always returns a QW in {data1,data0}.

void SYS_MEM::read (dword addrh, dword addrl, dword *data1, dword *data0)
{
  long long unsigned int addr;
  long long unsigned int tag;
  uint idx;
  uint offset;
  MEMCHUNK* current;
  uint randh;
  uint randl;
  uint _RandomClrMemVal1;
  uint _RandomClrMemVal0;

  addr = (((long long unsigned int)addrh)<<32) | addrl;
  tag  = addr & ~0x7ffffllu; // tag = addr[63:SYS_CHUNK_BITS]

  // extract hash table index addr[18:9], and chunk offset addr[8:3]:
  idx    = addrl>>9 & 0x3ff;
  offset = addrl>>2 & 0x7e;  // note: zero out bit 2

  // see if valid entry exists in hash table:
  if (htable[idx].valid) {
  
    // look for tag match (first check most recent access):
    if (htable[idx].mraPtr->tag==tag) { // most common case!
      *data1=htable[idx].mraPtr->data[offset+1];
      *data0=htable[idx].mraPtr->data[offset];

    } else { // find chunk in tree
      current = htable[idx].headPtr;
      while (current && current->tag!=tag) {
        if (tag > current->tag) { 
          current = current->right; 
        } else { 
          current = current->left; 
        }
      }
      if (current) {
        *data1=current->data[offset+1];
        *data0=current->data[offset];
        htable[idx].mraPtr=current;
      } else { // not in chunk tree
        if (iUseRandom) {
          randh = rand();
          randl = rand();
          randh = randh << 16;
          _RandomClrMemVal1 = randh | randl;
          *data1 = _RandomClrMemVal1; 
          randh = rand();
          randl = rand();
          randh = randh << 16;
          _RandomClrMemVal0 = randh | randl;
          *data0 = _RandomClrMemVal0;
          // create memory location with this random data
          write(addrh,addrl,0xff,_RandomClrMemVal1,_RandomClrMemVal0);
        } else {
          *data1=_ClrMemVal; 
          *data0=_ClrMemVal;
        }
      }
    }

  } else { // hash table entry not valid
    if (iUseRandom) {
      randh = rand();
      randl = rand();
      randh = randh << 16;
      _RandomClrMemVal1 = randh | randl;
      *data1 = _RandomClrMemVal1; 
      randh = rand();
      randl = rand();
      randh = randh << 16;
      _RandomClrMemVal0 = randh | randl;
      *data0 = _RandomClrMemVal0; 
      // create memory location with this random data
      write(addrh,addrl,0xff,_RandomClrMemVal1,_RandomClrMemVal0);
    } else {
      *data1=_ClrMemVal; 
      *data0=_ClrMemVal;
    }
  }
}


// ***************************************************************************
// Memory Read QW - long long version
// Maximum address size = 64 bits.  Aligned to DW boundary. (A[1:0] not used)
// Always returns a QW in {data}.
long long unsigned int SYS_MEM::read (long long unsigned int addr, long long unsigned int *data) {
  uint data1, data0;
  uint addr1 = uint(addr >> 32);
  uint addr0 = uint(addr & 0xffffffff);

  read (addr1, addr0, &data1, &data0);
  *data = ((long long unsigned int)(data1) << 32) | (long long unsigned int)data0;
  return *data;
}


// ***************************************************************************
// Memory Read DW
// Maximum address size = 64 bits.  Aligned to DW boundary. (A[1:0] not used)
// Always returns a DW in {data}.
uint SYS_MEM::read (dword addrh, dword addr, dword *data) {
  uint data1, data0;

  read (addrh, addr, &data1, &data0);
  if (addr & 0x4) *data = data1;
  else            *data = data0;
  return *data;
}


// ***************************************************************************
// Memory Read Byte
// Maximum address size = 64 bits.
unsigned char SYS_MEM::read (dword addrh, dword addr)
{
  uint data;

  read (addrh, addr, &data);
  data = (data >> ((addr & 0x3)*8)) & 0xff;
  return ((unsigned char) (data));
}


// ***************************************************************************
// Memory Read - arbitrary Size
unsigned char * SYS_MEM::read (dword addrh, dword addr, uint Size) {
  unsigned char * retVal = NULL;
  if (!Size)
    io_printf("Error: Zero size passed to SYS_MEM::read(...)\n");
  else {
    retVal = new unsigned char [Size];
    for (unsigned int idx = 0; idx < Size; idx++)
                  retVal[idx] = '\0';
    for (uint idx = 0; idx < Size; idx++) {
      retVal[idx] = read(addrh, addr);
      if (addr == ~uint(0x0))  // Generate carry for upper address
        addrh++;
      addr++;
    }
  }
  return (retVal);
}


// ***************************************************************************
// Memory Read (one Bit)
// Maximum address size = 64 bits.  Aligned to DW boundary. (A[1:0] not used)
// returns a bit
uint SYS_MEM::readBit (dword addrh, dword addr, dword bitField) {
  uint retVal;

  //if (!bitField) Rc->Assertion(bitField, "bitField must be defined in readBit()\n");
  read (addrh, addr, &retVal);
  return (retVal & bitField);
}


// ***************************************************************************
// Memory Write Byte
void SYS_MEM::write (dword addrh, dword addr, byte data) {
  byte be = 0x1 << (addr & 0x3);
  write(addrh, (addr & ~0x3), be, dword(data));
}


// ***************************************************************************
// Memory Write QW - long long version
// Aligned to QW boundary. (A[2:0] not used).  Always uses a QW in {data}.
void SYS_MEM::write (long long unsigned int addr, byte be, long long unsigned int data) {
  uint addr1 = uint(addr >> 32);
  uint addr0 = uint(addr & 0xffffffff);
  uint data1 = uint(data >> 32);
  uint data0 = uint(data & 0xffffffff);
  write (addr1, addr0, be, data1, data0);
}


// ***************************************************************************
// Memory Write DW
// Aligned to DW boundary. (A[1:0] not used).  Always uses a DW in {data}.
void SYS_MEM::write (dword addrh, dword addr, byte be, dword data) {
  if (be > 0xf)
    printf("SYS_MEM::write(dWord), inappropriate byte enables (%u) sent\n", be);
  be &= 0xf;
  if (addr & 0x4)
    be = be << 4;
  write (addrh, addr, be, data, data);
}


// ***************************************************************************
// Memory Write
// Maximum address size = 64 bits.  Aligned to QW boundary. (A[2:0] not used)
// Uses the QW in {data1,data0} and updates bytes whose byte enable (be[7:0]) is set.

void SYS_MEM::write (dword addrh, dword addrl, byte be, dword data1, dword data0)
{
  long long unsigned int addr;
  long long unsigned int tag;
  uint idx;
  uint offset;
  MEMCHUNK* current;
  dword temp1, temp0;
  byte byte7,byte6,byte5,byte4,byte3,byte2,byte1,byte0;
  int cont;
  int i;
  int added_chunk;
  uint randh;
  uint randl;
  uint _RandomClrMemVal;

  addr = (((long long unsigned int)addrh)<<32) | addrl;
  tag  = addr & ~0x7ffffllu; // tag = addr[63:SYS_CHUNK_BITS]
  cont = 1;
  added_chunk = 0;

  // extract hash table index addr[18:9], and chunk offset addr[8:3]:
  idx    = addrl>>9 & 0x3ff;
  offset = addrl>>2 & 0x7e;  // note: zero out bit 2

  // see if valid entry exists in hash table:
  if (htable[idx].valid) {
    // look for tag match (first check most recent access):
    if (htable[idx].mraPtr->tag==tag) { // most common case!
      current=htable[idx].mraPtr;
    }
    else { // find chunk in tree
      current = htable[idx].headPtr;
      while(current && current->tag!=tag && cont) {
        if (tag>current->tag && current->right) { current = current->right; }
        else if (tag<=current->tag && current->left) { current = current->left; }
        else { cont=0; }
      }
      if (current && current->tag!=tag) { // not in chunk tree
        // add entry to chunk tree
        if (tag>current->tag) {
          current->right= (MEMCHUNK *) malloc(sizeof(MEMCHUNK));
          if (current) { current=current->right; added_chunk=1;}
        }
        else {
          current->left= (MEMCHUNK *) malloc(sizeof(MEMCHUNK));
          if (current) { current=current->left; added_chunk=1;}
        }
      }
    }
  }
  else { // hash table entry not valid
    // add entry into hash table
    htable[idx].headPtr= (MEMCHUNK *) malloc(sizeof(MEMCHUNK));
    htable[idx].valid=1;
    current=htable[idx].headPtr;
    added_chunk=1;
  }

  if (current) { // write data
    if (added_chunk) {
      current->right=NULL;
      current->left=NULL;
      current->tag=tag;
      for (i=0; i<SYS_CHUNK_SIZE/4; i++) {
        if (iUseRandom) {
          randh = rand();
          randl = rand();
          randh = randh << 16;
          _RandomClrMemVal = randh | randl;
          current->data[i] = _RandomClrMemVal;
        } else {
          current->data[i] = _ClrMemVal;
        }
      }
    }
    temp1=current->data[offset+1];
    temp0=current->data[offset]; 
    byte7= (be&0x80) ? (data1>>3*8) : (temp1>>3*8);
    byte6= (be&0x40) ? (data1>>2*8) : (temp1>>2*8);
    byte5= (be&0x20) ? (data1>>1*8) : (temp1>>1*8);
    byte4= (be&0x10) ? (data1)      : (temp1);
    byte3= (be&0x08) ? (data0>>3*8) : (temp0>>3*8);
    byte2= (be&0x04) ? (data0>>2*8) : (temp0>>2*8);
    byte1= (be&0x02) ? (data0>>1*8) : (temp0>>1*8);
    byte0= (be&0x01) ? (data0)      : (temp0);
    current->data[offset+1]= byte7<<3*8&0xff000000 | byte6<<2*8&0xff0000 | byte5<<1*8&0xff00 | byte4&0xff;
    current->data[offset]  = byte3<<3*8&0xff000000 | byte2<<2*8&0xff0000 | byte1<<1*8&0xff00 | byte0&0xff;
    htable[idx].mraPtr=current;
  }
  else io_printf("SYS_MEM write error!  Could not allocate memory...\n");
}
