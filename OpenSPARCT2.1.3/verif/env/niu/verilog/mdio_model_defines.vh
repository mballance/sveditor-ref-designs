// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: mdio_model_defines.vh
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
`ifdef MDIO_MODELS_DEFINES_
`else
`define MDIO_MODELS_DEFINES_
// claus type
`define CLAUS_22 0
`define CLAUS_45 1

// access type
`define READ 0
`define WRITE 1

// read type
`define READ_ADDR 0
`define READ_ADDR_INC 1

// frame type
`define ADDR_FRAME 0
`define DATA_FRAME 1

`define MDIO_MMD_MODEL_PRT_ID 5'h11
`define MDIO_MMD_MODEL_PHY_ID 5'h12
`define MDIO_MMD_MODEL_DEV_ID 5'h13

`endif

