/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: dmu_rmu.h
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
`define FIRE_DLC_RMU_LRM_LRMTAG_LSB  	0								// Start of LRMTAG Field
`define FIRE_DLC_RMU_LRM_LRMTAG_WDTH  	8								// Width of LRMTAG Field
`define FIRE_DLC_RMU_LRM_LRMTAG_MSB  	`FIRE_DLC_RMU_LRM_LRMTAG_LSB + `FIRE_DLC_RMU_LRM_LRMTAG_WDTH -1	// MSB of LRMTAG Field
// ~~~~~ lrmtag field access ~~~~~
`define FIRE_DLC_RMU_LRM_LRMTAG		 `FIRE_DLC_RMU_LRM_LRMTAG_MSB:`FIRE_DLC_RMU_LRM_LRMTAG_LSB

`define FIRE_DLC_RMU_LRM_DPTR_LSB  	`FIRE_DLC_RMU_LRM_LRMTAG_LSB + `FIRE_DLC_RMU_LRM_LRMTAG_WDTH	// Start of DPTR Field
`define FIRE_DLC_RMU_LRM_DPTR_WDTH  	7								// Width of DPTR Field
`define FIRE_DLC_RMU_LRM_DPTR_MSB  	`FIRE_DLC_RMU_LRM_DPTR_LSB + `FIRE_DLC_RMU_LRM_DPTR_WDTH -1	// MSB of DPTR Field
// ~~~~~ dptr field access ~~~~~
`define FIRE_DLC_RMU_LRM_DPTR		 `FIRE_DLC_RMU_LRM_DPTR_MSB:`FIRE_DLC_RMU_LRM_DPTR_LSB

`define FIRE_DLC_RMU_LRM_ADDR_LSB 	`FIRE_DLC_RMU_LRM_DPTR_LSB + `FIRE_DLC_RMU_LRM_DPTR_WDTH	// Start of ADDR Field
`define FIRE_DLC_RMU_LRM_ADDR_WDTH  	62								// Width of ADDR Field
`define FIRE_DLC_RMU_LRM_ADDR_MSB  	`FIRE_DLC_RMU_LRM_ADDR_LSB + `FIRE_DLC_RMU_LRM_ADDR_WDTH -1	// MSB of ADDR Field
// ~~~~~ addr field access ~~~~~
`define FIRE_DLC_RMU_LRM_ADDR		 `FIRE_DLC_RMU_LRM_ADDR_MSB:`FIRE_DLC_RMU_LRM_ADDR_LSB

`define FIRE_DLC_RMU_LRM_FDWBE_LSB 	`FIRE_DLC_RMU_LRM_ADDR_LSB + `FIRE_DLC_RMU_LRM_ADDR_WDTH	
`define FIRE_DLC_RMU_LRM_FDWBE_WDTH  	4							
`define FIRE_DLC_RMU_LRM_FDWBE_MSB  	`FIRE_DLC_RMU_LRM_FDWBE_LSB + `FIRE_DLC_RMU_LRM_FDWBE_WDTH -1	
// ~~~~~ fdwbe field access ~~~~~
`define FIRE_DLC_RMU_LRM_FDWBE		 `FIRE_DLC_RMU_LRM_FDWBE_MSB:`FIRE_DLC_RMU_LRM_FDWBE_LSB

`define FIRE_DLC_RMU_LRM_LDWBE_LSB 	`FIRE_DLC_RMU_LRM_FDWBE_LSB + `FIRE_DLC_RMU_LRM_FDWBE_WDTH	// Start of Field
`define FIRE_DLC_RMU_LRM_LDWBE_WDTH  	4								// Width of Field
`define FIRE_DLC_RMU_LRM_LDWBE_MSB  	`FIRE_DLC_RMU_LRM_LDWBE_LSB + `FIRE_DLC_RMU_LRM_LDWBE_WDTH -1	// MSB of Field
// ~~~~~ ldwbe field access ~~~~~
`define FIRE_DLC_RMU_LRM_LDWBE		 `FIRE_DLC_RMU_LRM_LDWBE_MSB:`FIRE_DLC_RMU_LRM_LDWBE_LSB

`define FIRE_DLC_RMU_LRM_TAG_LSB 	`FIRE_DLC_RMU_LRM_LDWBE_LSB + `FIRE_DLC_RMU_LRM_LDWBE_WDTH	// Start of Field
`define FIRE_DLC_RMU_LRM_TAG_WDTH  	8								// Width of Field
`define FIRE_DLC_RMU_LRM_TAG_MSB  	`FIRE_DLC_RMU_LRM_TAG_LSB + `FIRE_DLC_RMU_LRM_TAG_WDTH -1	// MSB of Field
// ~~~~~ tlptag field access ~~~~~
`define FIRE_DLC_RMU_LRM_TAG		`FIRE_DLC_RMU_LRM_TAG_MSB:`FIRE_DLC_RMU_LRM_TAG_LSB

`define FIRE_DLC_RMU_LRM_REQID_LSB 	`FIRE_DLC_RMU_LRM_TAG_LSB + `FIRE_DLC_RMU_LRM_TAG_WDTH		// Start of Field
`define FIRE_DLC_RMU_LRM_REQID_WDTH  	16								// Width of Field
`define FIRE_DLC_RMU_LRM_REQID_MSB  	`FIRE_DLC_RMU_LRM_REQID_LSB + `FIRE_DLC_RMU_LRM_REQID_WDTH -1	// MSB of Field
// ~~~~~ reqid field access ~~~~~
`define FIRE_DLC_RMU_LRM_REQID		 `FIRE_DLC_RMU_LRM_REQID_MSB:`FIRE_DLC_RMU_LRM_REQID_LSB

`define FIRE_DLC_RMU_LRM_LEN_LSB 	`FIRE_DLC_RMU_LRM_REQID_LSB + `FIRE_DLC_RMU_LRM_REQID_WDTH	// Start of Field
`define FIRE_DLC_RMU_LRM_LEN_WDTH  	10								// Width of Field
`define FIRE_DLC_RMU_LRM_LEN_MSB  	`FIRE_DLC_RMU_LRM_LEN_LSB + `FIRE_DLC_RMU_LRM_LEN_WDTH -1	// MSB of Field
// ~~~~~ len  field access ~~~~~
`define FIRE_DLC_RMU_LRM_LEN		 `FIRE_DLC_RMU_LRM_LEN_MSB:`FIRE_DLC_RMU_LRM_LEN_LSB

`define FIRE_DLC_RMU_LRM_ATR_LSB 	`FIRE_DLC_RMU_LRM_LEN_LSB + `FIRE_DLC_RMU_LRM_LEN_WDTH		// Start of Field
`define FIRE_DLC_RMU_LRM_ATR_WDTH  	2								// Width of Field
`define FIRE_DLC_RMU_LRM_ATR_MSB  	`FIRE_DLC_RMU_LRM_ATR_LSB + `FIRE_DLC_RMU_LRM_ATR_WDTH -1	// MSB of Field
// ~~~~~ atr  field access ~~~~~
`define FIRE_DLC_RMU_LRM_ATR		 `FIRE_DLC_RMU_LRM_ATR_MSB:`FIRE_DLC_RMU_LRM_ATR_LSB

`define FIRE_DLC_RMU_LRM_TC_LSB 	`FIRE_DLC_RMU_LRM_ATR_LSB + `FIRE_DLC_RMU_LRM_ATR_WDTH		// Start of Field
`define FIRE_DLC_RMU_LRM_TC_WDTH  	3								// Width of Field
`define FIRE_DLC_RMU_LRM_TC_MSB  	`FIRE_DLC_RMU_LRM_TC_LSB + `FIRE_DLC_RMU_LRM_TC_WDTH -1 	// MSB of Field
// ~~~~~ tc  field access ~~~~~
`define FIRE_DLC_RMU_LRM_TC		 `FIRE_DLC_RMU_LRM_TC_MSB:`FIRE_DLC_RMU_LRM_TC_LSB

`define FIRE_DLC_RMU_LRM_TYPE_LSB 	`FIRE_DLC_RMU_LRM_TC_LSB + `FIRE_DLC_RMU_LRM_TC_WDTH		// Start of Field
`define FIRE_DLC_RMU_LRM_TYPE_WDTH  	7								// Width of Field
`define FIRE_DLC_RMU_LRM_TYPE_MSB  	`FIRE_DLC_RMU_LRM_TYPE_LSB + `FIRE_DLC_RMU_LRM_TYPE_WDTH -1	// MSB of Field
// ~~~~~ type field access ~~~~~
`define FIRE_DLC_RMU_LRM_TYPE		 `FIRE_DLC_RMU_LRM_TYPE_MSB:`FIRE_DLC_RMU_LRM_TYPE_LSB

`define FIRE_DLC_RMU_LRM_WDTH  		`FIRE_DLC_RMU_LRM_TYPE_LSB + `FIRE_DLC_RMU_LRM_TYPE_WDTH	// Complete Record With


//#############################
// PIO Credit Release from LRM 
// From LRM to RRM Sub-block
//#############################

`define FIRE_DLC_RMU_LRM_REL_LSB  	0								// Start of DPTR Field
`define FIRE_DLC_RMU_LRM_REL_WDTH  	4								// Width of DPTR Field
`define FIRE_DLC_RMU_LRM_REL_MSB  	`FIRE_DLC_RMU_LRM_REL_LSB + `FIRE_DLC_RMU_LRM_REL_WDTH -1	// MSB of DPTR Field


