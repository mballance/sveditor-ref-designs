// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: mempli.cc
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

#include <iostream>
#include <fstream>
#include <stdlib.h>
#include <string.h>
#include <ctype.h>
#include <stdio.h>
#include "ext_sys_mem.h"
#include "vcsuser.h"

// global variables
SYS_MEM SystemMem;
SYS_MEM SlaveMem;

/*==========================================================================*/
extern "C" int SysMem_SetRandom() {
/*==========================================================================*/
  SystemMem.SetDefaultMemRandom();
  SlaveMem.SetDefaultMemRandom();
return 0;
}

/*==========================================================================*/
extern "C" int SysRead_Data() {
/*==========================================================================*/

  unsigned int addrh;
  unsigned int addrl;
  unsigned int tempData;
  int iMemType;

  iMemType = tf_getp(1);
  addrh = tf_getp(2);
  addrl = tf_getp(3);
  addrl = addrl & (~0x3);

  if (iMemType == 1) {
    SystemMem.read(addrh,addrl,&tempData);  // host
    //io_printf(" System MEM read   addr %08x  data %08x\n",addrl,tempData); 
  } else {
    SlaveMem.read(addrh,addrl,&tempData);  // host
    //io_printf(" Slave MEM read   addr %08x  data %08x\n",addrl,tempData); 
  }

  tf_putp(4,tempData);
  return 0;
}

/*==========================================================================*/
extern "C" int SysWrite_Data() {
/*==========================================================================*/

  unsigned int addrh;
  unsigned int addrl;
  unsigned int be;
  unsigned int data;
  int iMemType;

  iMemType = tf_getp(1);
  addrh = tf_getp(2);
  addrl = tf_getp(3);
  data = tf_getp(4);
  be = tf_getp(5);

  addrl = addrl & (~0x3);
  be = (~(be & 0x0f)) & 0x0f;

  if (iMemType == 1) {
    SystemMem.write(addrh,addrl,be,data);
    //io_printf(" System MEM write  addr %08x  data %08x  be %08x\n",addrl,data,be); 
  } else {
    SlaveMem.write(addrh,addrl,be,data);
    //io_printf(" Slave MEM write  addr %08x  data %08x  be %08x\n",addrl,data,be); 
  }
  return 0;
}







