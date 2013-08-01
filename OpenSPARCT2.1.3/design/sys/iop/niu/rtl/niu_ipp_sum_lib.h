/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: niu_ipp_sum_lib.h
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

/**********************************************************
***********************************************************

    Project         : Niu

    File name       : niu_ipp_sum_lib.h

    Module(s) name  : 
    Original:       : sum_lib.h main.1, label:               

    Parent modules  : niu_ipp_sum.v

    Child modules   : niu_ipp_sum_lib.v, 

    Author's name   : George Chu

    Date            : March. 2004

    Description     : Control logic od the checksum.

    Synthesis Notes:

    Modification History:

    Date       Description
    ----       -----------

************************************************************
***********************************************************/
// ------------- define parameters ----- (George Chu, rel.01, 12/12/01) -----

// ----- cksum state machine  --- 7654 3210 -----
`define    NIU_IPP_IDLE_CKSUM  9'b0_0000_0001
`define    NIU_IPP_CKSUM_D1    9'b0_0000_0010   // 
`define    NIU_IPP_CKSUM_D2    9'b0_0000_0100   // 
`define    NIU_IPP_CKSUM_DT    9'b0_0000_1000
`define    NIU_IPP_CKSUM_W0    9'b0_0100_0000
`define    NIU_IPP_CKSUM_W1    9'b0_0101_0000
`define    NIU_IPP_CKSUM_W2    9'b0_0110_0000
`define    NIU_IPP_CKSUM_W3    9'b0_0111_0000
`define    NIU_IPP_CKSUM_W4    9'b0_1000_0000
`define    NIU_IPP_CKSUM_UL    9'b1_0000_0000

// ----- crc32 state machine  --- 7654 3210 -----
`define    NIU_IPP_IDLE_CRC    8'b0000_0001
`define    NIU_IPP_CRC_D1      8'b0000_0010   //
`define    NIU_IPP_CRC_D2      8'b0000_0100   //
`define    NIU_IPP_CRC_DT      8'b0000_1000
`define    NIU_IPP_CRC_W0      8'b0100_0000
`define    NIU_IPP_CRC_W1      8'b0101_0000
`define    NIU_IPP_CRC_W2      8'b0110_0000
`define    NIU_IPP_CRC_W3      8'b0111_0000
`define    NIU_IPP_CRC_W4      8'b1000_0000
