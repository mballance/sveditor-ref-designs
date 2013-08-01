/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: fflp.h
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
/**********************************************************************/
/*project name:  NIU                                                  */
/*module name:                                                        */
/*description:                                                        */
/*               include file for fflp.v                              */
/*                                                                    */
/*parent module in:  n.a.                                             */
/*child modules in:  n.a.                                             */
/*interface modules:                                                  */
/*author name:       Jeanne Cai                                       */
/*date created:      03-18-04                                         */
/*                                                                    */
/*              Copyright (c) 2204, Sun Microsystems, Inc.            */
/*                   Sun Proprietary and Confidential                 */
/*                                                                    */
/**********************************************************************/

//pkt_type

`define		TYPE_IPV4		16'h0800 
`define		TYPE_IPV6		16'h86dd
`define		TYPE_ARP		16'h0806
`define		TYPE_RARP 		16'h8035

`define		TCP		8'b0000_0110	//d'6
`define		UDP		8'b0001_0001	//d'17
`define		AH		8'b0011_0011	//d'51
`define		ESP		8'b0011_0010	//d'50
`define		SCTP		8'b1000_0100	//d'132


//cpu cmd

`define		WR_CAM_KEY		3'b000
`define		RD_CAM_KEY		3'b001
`define		COMP_SINGLE_KEY		3'b010
`define		NOP_CMD3		3'b011
`define		WR_ASSOC_D		3'b100
`define		RD_ASSOC_D		3'b101
`define		NOP_CMD1		3'b110
`define		NOP_CMD2		3'b111

//ram commands

`define		RAM_R			2'b00
`define		RAM_W			2'b01
`define		RAM_RMW			2'b10

//FCRAM commands

`define		DESL		2'b10
`define		RDA		2'b01
`define		WRA		2'b00
`define		LAL		2'b10
`define		REF		2'b00
`define		MRS		2'b00


