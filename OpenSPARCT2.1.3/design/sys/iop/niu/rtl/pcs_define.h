/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: pcs_define.h
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
/* @(#)pcs_define.v	1.2G */
/**********************************************************************/
/* Project Name  :  CASSINI                                           */
/* Module Name   :  Definition of Constants for PCS		      */
/*								      */
/* Parent module :  none.	                                      */
/* Child modules :  none.                                             */
/* Author Name   : Linda Chen                                         */
/* Date Created  : 10/15/96                                           */
/*                                                                    */
/*              Copyright (c) 1994, Sun Microsystems, Inc.            */
/*                   Sun Proprietary and Confidential                 */
/*                                                                    */ 
/* Modifications : none                                               */
/* Synthesis Notes : none                                             */
/**********************************************************************/

/*
** PIO Defines
*/
`define PHY_PIO_MII_CONF	7'h00
`define PHY_PIO_MII_STAT	7'h01
`define PHY_PIO_MII_ADVER	7'h02
`define PHY_PIO_MII_PARTNER	7'h03
`define PHY_PIO_CONF_REG	7'h04
`define PHY_PIO_STATE		7'h05
`define PHY_PIO_INTERRUPT	7'h06

`define PHY_PIO_DPATH_MODE	7'h14
`define PHY_PIO_SER_CTRL	7'h15
`define PHY_PIO_SHARED		7'h16
`define PHY_PIO_SER_STATE	7'h17
`define PHY_PIO_PKT_CNT		7'h18

/*
** For use with Decoder to mark special characters with rx_8bdata
** Used in files pcs_rx_ctrl.v and file pcs_rx_dpath.v
*/
`define PCS_R_CHAR	0
`define PCS_S_CHAR	1
`define PCS_T_CHAR	2
`define PCS_H_CHAR	3
`define PCS_K285_CHAR	4

/*
** Rx Data Mux for GMII
*/
`define PCS_RXD_ZERO		3'h0
`define PCS_RXD_PREAMBLE	3'h1
`define PCS_RXD_FALSE_CARRIER   3'h2
`define PCS_RXD_CRS_EXT		3'h3
`define PCS_RXD_CRS_EXT_ER	3'h4
`define PCS_RXD_DECODER		3'h5

/*
** Tx Control Signals into Encoder
** Used by pcs_tx_ctrl.v and pcs_tx_dpath.v
*/
`define PCS_ENC_K285		4'h0	// tx_enc_ctrl_sel
`define PCS_ENC_IDLE2		4'h1
`define PCS_ENC_SOP		4'h2
`define PCS_ENC_DATA		4'h3
`define PCS_ENC_T_CHAR		4'h4
`define PCS_ENC_R_CHAR		4'h5
`define PCS_ENC_IDLE1		4'h6
`define PCS_ENC_H_CHAR		4'h7

`define PCS_ENC_LINK_CONFA 	4'h8	// specific to link config
`define PCS_ENC_LINK_CONFB 	4'h9

`define PCS_TX_GMII_DATA	2'h0  	// for txd_sel
`define PCS_TX_CONF_REG1	2'h1
`define PCS_TX_CONF_REG2	2'h2
`define PCS_TX_CONF_ZEROS	2'h3

/*******************************************************/
