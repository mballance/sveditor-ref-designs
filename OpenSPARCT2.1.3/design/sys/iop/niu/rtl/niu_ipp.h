/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: niu_ipp.h
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

    Project         : Vega

    File name       : niu_ipp.h

    Module(s) name  :               

    Parent modules  :        

    Child modules   :           

    Author's name   : George Chu

    Date            : Jan. 2004

    Description     : defines used by niu_ipp 

    Synthesis Notes:

    Modification History:
    Date       Description
    ----       -----------

************************************************************
***********************************************************/
// `define NEPTUNE                    1

`define NIU_IPP_PIO_SPACE_IPP0_N2  5'b1000_0
`define NIU_IPP_PIO_SPACE_IPP1_N2  5'b1000_1

`define NIU_IPP_PIO_SPACE_IPP0_NEP 6'b1000_00
`define NIU_IPP_PIO_SPACE_IPP2_NEP 6'b1000_01
`define NIU_IPP_PIO_SPACE_IPP1_NEP 6'b1000_10
`define NIU_IPP_PIO_SPACE_IPP3_NEP 6'b1000_11

//======== ipp_unload_ctl, state machine ========
`define IPP_UNLOAD_IDLE        5'b0_0000
`define IPP_GET_MAC_STAT       5'b0_0010
`define IPP_WAIT_CKSUM_DON     5'b0_0011
`define IPP_DFIFO_XFR_1ST      5'b0_0100
`define IPP_DFIFO_XFR_DAT      5'b0_0101

`define IPP_BKWT_1ST_WORD      5'b0_0111

`define IPP_WAIT_HFIFO_STA     5'b0_1010
`define IPP_WAIT_HFIFO_DAT     5'b0_1011
`define IPP_DFIFO_XFR_ERR      5'b1_0000

//======== ipp_dfifo_tag,  state machine ========
`define IPP_DFIFO_TAG_IDLE     2'b00
`define IPP_DFIFO_TAG_WAIT_EOP 2'b01
`define IPP_DFIFO_TAG_WAIT_SOP 2'b10

