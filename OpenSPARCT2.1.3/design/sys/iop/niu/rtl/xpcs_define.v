// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: xpcs_define.v
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
`define TICK 0

// Rx Codes for Decoding

`define XPCS_DEC_COM 10'h1BC   // K28.5
`define XPCS_DEC_281 10'h13C
`define XPCS_DEC_285 10'h1BC 
`define XPCS_DEC_287 10'h1FC
`define XPCS_DEC_ALG 10'h17C   // K28.3
`define XPCS_DEC_SEQ 10'h19C   // K28.4
`define XPCS_DEC_SDP 10'h1FB   // K27.7
`define XPCS_DEC_END 10'h1FD   // K29.7 Terminate
`define XPCS_DEC_ERR 10'h1FE   // K30.7 Error
`define XPCS_DEC_PAD 10'h1F7
`define XPCS_DEC_SKP 10'h11C   // K28.0

// Tx Special Codes for Encoding

`define XPCS_ENC_COM 8'hBC
`define XPCS_ENC_IDL 8'h07
`define XPCS_ENC_TTL 8'hFC  // K28.7 low freq test
`define XPCS_ENC_TTH 8'hB5  // D21.5 high freq test
`define XPCS_ENC_SDP 8'hFB
`define XPCS_ENC_ALG 8'h7C
`define XPCS_ENC_SEQ 8'h9C
`define XPCS_ENC_SLP 8'h5C
`define XPCS_ENC_EGP 8'hFD
`define XPCS_ENC_EBP 8'hFE
`define XPCS_ENC_PAD 8'hF7
`define XPCS_ENC_SKP 8'h1C
`define XPCS_ENC_D00 8'h00
`define XPCS_ENC_D10 8'h01
`define XPCS_ENC_D20 8'h02


// other 
`define SEL_xpcs_training_vector  4'hF
