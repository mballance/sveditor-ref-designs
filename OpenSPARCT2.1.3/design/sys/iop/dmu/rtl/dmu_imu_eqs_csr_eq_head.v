// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: dmu_imu_eqs_csr_eq_head.v
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
module dmu_imu_eqs_csr_eq_head 
	(
	clk,
	rst_l,
	eq_head_w_ld_0,
	eq_head_w_ld_1,
	eq_head_w_ld_2,
	eq_head_w_ld_3,
	eq_head_w_ld_4,
	eq_head_w_ld_5,
	eq_head_w_ld_6,
	eq_head_w_ld_7,
	eq_head_w_ld_8,
	eq_head_w_ld_9,
	eq_head_w_ld_10,
	eq_head_w_ld_11,
	eq_head_w_ld_12,
	eq_head_w_ld_13,
	eq_head_w_ld_14,
	eq_head_w_ld_15,
	eq_head_w_ld_16,
	eq_head_w_ld_17,
	eq_head_w_ld_18,
	eq_head_w_ld_19,
	eq_head_w_ld_20,
	eq_head_w_ld_21,
	eq_head_w_ld_22,
	eq_head_w_ld_23,
	eq_head_w_ld_24,
	eq_head_w_ld_25,
	eq_head_w_ld_26,
	eq_head_w_ld_27,
	eq_head_w_ld_28,
	eq_head_w_ld_29,
	eq_head_w_ld_30,
	eq_head_w_ld_31,
	eq_head_w_ld_32,
	eq_head_w_ld_33,
	eq_head_w_ld_34,
	eq_head_w_ld_35,
	csrbus_wr_data,
	eq_head_csrbus_read_data_0,
	eq_head_csrbus_read_data_1,
	eq_head_csrbus_read_data_2,
	eq_head_csrbus_read_data_3,
	eq_head_csrbus_read_data_4,
	eq_head_csrbus_read_data_5,
	eq_head_csrbus_read_data_6,
	eq_head_csrbus_read_data_7,
	eq_head_csrbus_read_data_8,
	eq_head_csrbus_read_data_9,
	eq_head_csrbus_read_data_10,
	eq_head_csrbus_read_data_11,
	eq_head_csrbus_read_data_12,
	eq_head_csrbus_read_data_13,
	eq_head_csrbus_read_data_14,
	eq_head_csrbus_read_data_15,
	eq_head_csrbus_read_data_16,
	eq_head_csrbus_read_data_17,
	eq_head_csrbus_read_data_18,
	eq_head_csrbus_read_data_19,
	eq_head_csrbus_read_data_20,
	eq_head_csrbus_read_data_21,
	eq_head_csrbus_read_data_22,
	eq_head_csrbus_read_data_23,
	eq_head_csrbus_read_data_24,
	eq_head_csrbus_read_data_25,
	eq_head_csrbus_read_data_26,
	eq_head_csrbus_read_data_27,
	eq_head_csrbus_read_data_28,
	eq_head_csrbus_read_data_29,
	eq_head_csrbus_read_data_30,
	eq_head_csrbus_read_data_31,
	eq_head_csrbus_read_data_32,
	eq_head_csrbus_read_data_33,
	eq_head_csrbus_read_data_34,
	eq_head_csrbus_read_data_35,
	eq_head_head_hw_read_0,
	eq_head_head_hw_read_1,
	eq_head_head_hw_read_2,
	eq_head_head_hw_read_3,
	eq_head_head_hw_read_4,
	eq_head_head_hw_read_5,
	eq_head_head_hw_read_6,
	eq_head_head_hw_read_7,
	eq_head_head_hw_read_8,
	eq_head_head_hw_read_9,
	eq_head_head_hw_read_10,
	eq_head_head_hw_read_11,
	eq_head_head_hw_read_12,
	eq_head_head_hw_read_13,
	eq_head_head_hw_read_14,
	eq_head_head_hw_read_15,
	eq_head_head_hw_read_16,
	eq_head_head_hw_read_17,
	eq_head_head_hw_read_18,
	eq_head_head_hw_read_19,
	eq_head_head_hw_read_20,
	eq_head_head_hw_read_21,
	eq_head_head_hw_read_22,
	eq_head_head_hw_read_23,
	eq_head_head_hw_read_24,
	eq_head_head_hw_read_25,
	eq_head_head_hw_read_26,
	eq_head_head_hw_read_27,
	eq_head_head_hw_read_28,
	eq_head_head_hw_read_29,
	eq_head_head_hw_read_30,
	eq_head_head_hw_read_31,
	eq_head_head_hw_read_32,
	eq_head_head_hw_read_33,
	eq_head_head_hw_read_34,
	eq_head_head_hw_read_35
	);

//====================================================================
//     Polarity declarations
//====================================================================
input  clk;  // Clock
input  rst_l;  // Reset signal
input  eq_head_w_ld_0;  // SW load bus
input  eq_head_w_ld_1;  // SW load bus
input  eq_head_w_ld_2;  // SW load bus
input  eq_head_w_ld_3;  // SW load bus
input  eq_head_w_ld_4;  // SW load bus
input  eq_head_w_ld_5;  // SW load bus
input  eq_head_w_ld_6;  // SW load bus
input  eq_head_w_ld_7;  // SW load bus
input  eq_head_w_ld_8;  // SW load bus
input  eq_head_w_ld_9;  // SW load bus
input  eq_head_w_ld_10;  // SW load bus
input  eq_head_w_ld_11;  // SW load bus
input  eq_head_w_ld_12;  // SW load bus
input  eq_head_w_ld_13;  // SW load bus
input  eq_head_w_ld_14;  // SW load bus
input  eq_head_w_ld_15;  // SW load bus
input  eq_head_w_ld_16;  // SW load bus
input  eq_head_w_ld_17;  // SW load bus
input  eq_head_w_ld_18;  // SW load bus
input  eq_head_w_ld_19;  // SW load bus
input  eq_head_w_ld_20;  // SW load bus
input  eq_head_w_ld_21;  // SW load bus
input  eq_head_w_ld_22;  // SW load bus
input  eq_head_w_ld_23;  // SW load bus
input  eq_head_w_ld_24;  // SW load bus
input  eq_head_w_ld_25;  // SW load bus
input  eq_head_w_ld_26;  // SW load bus
input  eq_head_w_ld_27;  // SW load bus
input  eq_head_w_ld_28;  // SW load bus
input  eq_head_w_ld_29;  // SW load bus
input  eq_head_w_ld_30;  // SW load bus
input  eq_head_w_ld_31;  // SW load bus
input  eq_head_w_ld_32;  // SW load bus
input  eq_head_w_ld_33;  // SW load bus
input  eq_head_w_ld_34;  // SW load bus
input  eq_head_w_ld_35;  // SW load bus
input  [`FIRE_CSRBUS_DATA_WIDTH-1:0] csrbus_wr_data;  // SW write data
output [`FIRE_DLC_IMU_EQS_CSR_EQ_HEAD_WIDTH-1:0] eq_head_csrbus_read_data_0;
    // SW read data
output [`FIRE_DLC_IMU_EQS_CSR_EQ_HEAD_WIDTH-1:0] eq_head_csrbus_read_data_1;
    // SW read data
output [`FIRE_DLC_IMU_EQS_CSR_EQ_HEAD_WIDTH-1:0] eq_head_csrbus_read_data_2;
    // SW read data
output [`FIRE_DLC_IMU_EQS_CSR_EQ_HEAD_WIDTH-1:0] eq_head_csrbus_read_data_3;
    // SW read data
output [`FIRE_DLC_IMU_EQS_CSR_EQ_HEAD_WIDTH-1:0] eq_head_csrbus_read_data_4;
    // SW read data
output [`FIRE_DLC_IMU_EQS_CSR_EQ_HEAD_WIDTH-1:0] eq_head_csrbus_read_data_5;
    // SW read data
output [`FIRE_DLC_IMU_EQS_CSR_EQ_HEAD_WIDTH-1:0] eq_head_csrbus_read_data_6;
    // SW read data
output [`FIRE_DLC_IMU_EQS_CSR_EQ_HEAD_WIDTH-1:0] eq_head_csrbus_read_data_7;
    // SW read data
output [`FIRE_DLC_IMU_EQS_CSR_EQ_HEAD_WIDTH-1:0] eq_head_csrbus_read_data_8;
    // SW read data
output [`FIRE_DLC_IMU_EQS_CSR_EQ_HEAD_WIDTH-1:0] eq_head_csrbus_read_data_9;
    // SW read data
output [`FIRE_DLC_IMU_EQS_CSR_EQ_HEAD_WIDTH-1:0] eq_head_csrbus_read_data_10;
    // SW read data
output [`FIRE_DLC_IMU_EQS_CSR_EQ_HEAD_WIDTH-1:0] eq_head_csrbus_read_data_11;
    // SW read data
output [`FIRE_DLC_IMU_EQS_CSR_EQ_HEAD_WIDTH-1:0] eq_head_csrbus_read_data_12;
    // SW read data
output [`FIRE_DLC_IMU_EQS_CSR_EQ_HEAD_WIDTH-1:0] eq_head_csrbus_read_data_13;
    // SW read data
output [`FIRE_DLC_IMU_EQS_CSR_EQ_HEAD_WIDTH-1:0] eq_head_csrbus_read_data_14;
    // SW read data
output [`FIRE_DLC_IMU_EQS_CSR_EQ_HEAD_WIDTH-1:0] eq_head_csrbus_read_data_15;
    // SW read data
output [`FIRE_DLC_IMU_EQS_CSR_EQ_HEAD_WIDTH-1:0] eq_head_csrbus_read_data_16;
    // SW read data
output [`FIRE_DLC_IMU_EQS_CSR_EQ_HEAD_WIDTH-1:0] eq_head_csrbus_read_data_17;
    // SW read data
output [`FIRE_DLC_IMU_EQS_CSR_EQ_HEAD_WIDTH-1:0] eq_head_csrbus_read_data_18;
    // SW read data
output [`FIRE_DLC_IMU_EQS_CSR_EQ_HEAD_WIDTH-1:0] eq_head_csrbus_read_data_19;
    // SW read data
output [`FIRE_DLC_IMU_EQS_CSR_EQ_HEAD_WIDTH-1:0] eq_head_csrbus_read_data_20;
    // SW read data
output [`FIRE_DLC_IMU_EQS_CSR_EQ_HEAD_WIDTH-1:0] eq_head_csrbus_read_data_21;
    // SW read data
output [`FIRE_DLC_IMU_EQS_CSR_EQ_HEAD_WIDTH-1:0] eq_head_csrbus_read_data_22;
    // SW read data
output [`FIRE_DLC_IMU_EQS_CSR_EQ_HEAD_WIDTH-1:0] eq_head_csrbus_read_data_23;
    // SW read data
output [`FIRE_DLC_IMU_EQS_CSR_EQ_HEAD_WIDTH-1:0] eq_head_csrbus_read_data_24;
    // SW read data
output [`FIRE_DLC_IMU_EQS_CSR_EQ_HEAD_WIDTH-1:0] eq_head_csrbus_read_data_25;
    // SW read data
output [`FIRE_DLC_IMU_EQS_CSR_EQ_HEAD_WIDTH-1:0] eq_head_csrbus_read_data_26;
    // SW read data
output [`FIRE_DLC_IMU_EQS_CSR_EQ_HEAD_WIDTH-1:0] eq_head_csrbus_read_data_27;
    // SW read data
output [`FIRE_DLC_IMU_EQS_CSR_EQ_HEAD_WIDTH-1:0] eq_head_csrbus_read_data_28;
    // SW read data
output [`FIRE_DLC_IMU_EQS_CSR_EQ_HEAD_WIDTH-1:0] eq_head_csrbus_read_data_29;
    // SW read data
output [`FIRE_DLC_IMU_EQS_CSR_EQ_HEAD_WIDTH-1:0] eq_head_csrbus_read_data_30;
    // SW read data
output [`FIRE_DLC_IMU_EQS_CSR_EQ_HEAD_WIDTH-1:0] eq_head_csrbus_read_data_31;
    // SW read data
output [`FIRE_DLC_IMU_EQS_CSR_EQ_HEAD_WIDTH-1:0] eq_head_csrbus_read_data_32;
    // SW read data
output [`FIRE_DLC_IMU_EQS_CSR_EQ_HEAD_WIDTH-1:0] eq_head_csrbus_read_data_33;
    // SW read data
output [`FIRE_DLC_IMU_EQS_CSR_EQ_HEAD_WIDTH-1:0] eq_head_csrbus_read_data_34;
    // SW read data
output [`FIRE_DLC_IMU_EQS_CSR_EQ_HEAD_WIDTH-1:0] eq_head_csrbus_read_data_35;
    // SW read data
output [`FIRE_DLC_IMU_EQS_CSR_EQ_HEAD_HEAD_INT_SLC] eq_head_head_hw_read_0;
    // This signal provides the current value of eq_head_head.
output [`FIRE_DLC_IMU_EQS_CSR_EQ_HEAD_HEAD_INT_SLC] eq_head_head_hw_read_1;
    // This signal provides the current value of eq_head_head.
output [`FIRE_DLC_IMU_EQS_CSR_EQ_HEAD_HEAD_INT_SLC] eq_head_head_hw_read_2;
    // This signal provides the current value of eq_head_head.
output [`FIRE_DLC_IMU_EQS_CSR_EQ_HEAD_HEAD_INT_SLC] eq_head_head_hw_read_3;
    // This signal provides the current value of eq_head_head.
output [`FIRE_DLC_IMU_EQS_CSR_EQ_HEAD_HEAD_INT_SLC] eq_head_head_hw_read_4;
    // This signal provides the current value of eq_head_head.
output [`FIRE_DLC_IMU_EQS_CSR_EQ_HEAD_HEAD_INT_SLC] eq_head_head_hw_read_5;
    // This signal provides the current value of eq_head_head.
output [`FIRE_DLC_IMU_EQS_CSR_EQ_HEAD_HEAD_INT_SLC] eq_head_head_hw_read_6;
    // This signal provides the current value of eq_head_head.
output [`FIRE_DLC_IMU_EQS_CSR_EQ_HEAD_HEAD_INT_SLC] eq_head_head_hw_read_7;
    // This signal provides the current value of eq_head_head.
output [`FIRE_DLC_IMU_EQS_CSR_EQ_HEAD_HEAD_INT_SLC] eq_head_head_hw_read_8;
    // This signal provides the current value of eq_head_head.
output [`FIRE_DLC_IMU_EQS_CSR_EQ_HEAD_HEAD_INT_SLC] eq_head_head_hw_read_9;
    // This signal provides the current value of eq_head_head.
output [`FIRE_DLC_IMU_EQS_CSR_EQ_HEAD_HEAD_INT_SLC] eq_head_head_hw_read_10;
    // This signal provides the current value of eq_head_head.
output [`FIRE_DLC_IMU_EQS_CSR_EQ_HEAD_HEAD_INT_SLC] eq_head_head_hw_read_11;
    // This signal provides the current value of eq_head_head.
output [`FIRE_DLC_IMU_EQS_CSR_EQ_HEAD_HEAD_INT_SLC] eq_head_head_hw_read_12;
    // This signal provides the current value of eq_head_head.
output [`FIRE_DLC_IMU_EQS_CSR_EQ_HEAD_HEAD_INT_SLC] eq_head_head_hw_read_13;
    // This signal provides the current value of eq_head_head.
output [`FIRE_DLC_IMU_EQS_CSR_EQ_HEAD_HEAD_INT_SLC] eq_head_head_hw_read_14;
    // This signal provides the current value of eq_head_head.
output [`FIRE_DLC_IMU_EQS_CSR_EQ_HEAD_HEAD_INT_SLC] eq_head_head_hw_read_15;
    // This signal provides the current value of eq_head_head.
output [`FIRE_DLC_IMU_EQS_CSR_EQ_HEAD_HEAD_INT_SLC] eq_head_head_hw_read_16;
    // This signal provides the current value of eq_head_head.
output [`FIRE_DLC_IMU_EQS_CSR_EQ_HEAD_HEAD_INT_SLC] eq_head_head_hw_read_17;
    // This signal provides the current value of eq_head_head.
output [`FIRE_DLC_IMU_EQS_CSR_EQ_HEAD_HEAD_INT_SLC] eq_head_head_hw_read_18;
    // This signal provides the current value of eq_head_head.
output [`FIRE_DLC_IMU_EQS_CSR_EQ_HEAD_HEAD_INT_SLC] eq_head_head_hw_read_19;
    // This signal provides the current value of eq_head_head.
output [`FIRE_DLC_IMU_EQS_CSR_EQ_HEAD_HEAD_INT_SLC] eq_head_head_hw_read_20;
    // This signal provides the current value of eq_head_head.
output [`FIRE_DLC_IMU_EQS_CSR_EQ_HEAD_HEAD_INT_SLC] eq_head_head_hw_read_21;
    // This signal provides the current value of eq_head_head.
output [`FIRE_DLC_IMU_EQS_CSR_EQ_HEAD_HEAD_INT_SLC] eq_head_head_hw_read_22;
    // This signal provides the current value of eq_head_head.
output [`FIRE_DLC_IMU_EQS_CSR_EQ_HEAD_HEAD_INT_SLC] eq_head_head_hw_read_23;
    // This signal provides the current value of eq_head_head.
output [`FIRE_DLC_IMU_EQS_CSR_EQ_HEAD_HEAD_INT_SLC] eq_head_head_hw_read_24;
    // This signal provides the current value of eq_head_head.
output [`FIRE_DLC_IMU_EQS_CSR_EQ_HEAD_HEAD_INT_SLC] eq_head_head_hw_read_25;
    // This signal provides the current value of eq_head_head.
output [`FIRE_DLC_IMU_EQS_CSR_EQ_HEAD_HEAD_INT_SLC] eq_head_head_hw_read_26;
    // This signal provides the current value of eq_head_head.
output [`FIRE_DLC_IMU_EQS_CSR_EQ_HEAD_HEAD_INT_SLC] eq_head_head_hw_read_27;
    // This signal provides the current value of eq_head_head.
output [`FIRE_DLC_IMU_EQS_CSR_EQ_HEAD_HEAD_INT_SLC] eq_head_head_hw_read_28;
    // This signal provides the current value of eq_head_head.
output [`FIRE_DLC_IMU_EQS_CSR_EQ_HEAD_HEAD_INT_SLC] eq_head_head_hw_read_29;
    // This signal provides the current value of eq_head_head.
output [`FIRE_DLC_IMU_EQS_CSR_EQ_HEAD_HEAD_INT_SLC] eq_head_head_hw_read_30;
    // This signal provides the current value of eq_head_head.
output [`FIRE_DLC_IMU_EQS_CSR_EQ_HEAD_HEAD_INT_SLC] eq_head_head_hw_read_31;
    // This signal provides the current value of eq_head_head.
output [`FIRE_DLC_IMU_EQS_CSR_EQ_HEAD_HEAD_INT_SLC] eq_head_head_hw_read_32;
    // This signal provides the current value of eq_head_head.
output [`FIRE_DLC_IMU_EQS_CSR_EQ_HEAD_HEAD_INT_SLC] eq_head_head_hw_read_33;
    // This signal provides the current value of eq_head_head.
output [`FIRE_DLC_IMU_EQS_CSR_EQ_HEAD_HEAD_INT_SLC] eq_head_head_hw_read_34;
    // This signal provides the current value of eq_head_head.
output [`FIRE_DLC_IMU_EQS_CSR_EQ_HEAD_HEAD_INT_SLC] eq_head_head_hw_read_35;
    // This signal provides the current value of eq_head_head.

//====================================================================
//     Type declarations
//====================================================================
wire clk;  // Clock
wire rst_l;  // Reset signal
wire eq_head_w_ld_0;  // SW load bus
wire eq_head_w_ld_1;  // SW load bus
wire eq_head_w_ld_2;  // SW load bus
wire eq_head_w_ld_3;  // SW load bus
wire eq_head_w_ld_4;  // SW load bus
wire eq_head_w_ld_5;  // SW load bus
wire eq_head_w_ld_6;  // SW load bus
wire eq_head_w_ld_7;  // SW load bus
wire eq_head_w_ld_8;  // SW load bus
wire eq_head_w_ld_9;  // SW load bus
wire eq_head_w_ld_10;  // SW load bus
wire eq_head_w_ld_11;  // SW load bus
wire eq_head_w_ld_12;  // SW load bus
wire eq_head_w_ld_13;  // SW load bus
wire eq_head_w_ld_14;  // SW load bus
wire eq_head_w_ld_15;  // SW load bus
wire eq_head_w_ld_16;  // SW load bus
wire eq_head_w_ld_17;  // SW load bus
wire eq_head_w_ld_18;  // SW load bus
wire eq_head_w_ld_19;  // SW load bus
wire eq_head_w_ld_20;  // SW load bus
wire eq_head_w_ld_21;  // SW load bus
wire eq_head_w_ld_22;  // SW load bus
wire eq_head_w_ld_23;  // SW load bus
wire eq_head_w_ld_24;  // SW load bus
wire eq_head_w_ld_25;  // SW load bus
wire eq_head_w_ld_26;  // SW load bus
wire eq_head_w_ld_27;  // SW load bus
wire eq_head_w_ld_28;  // SW load bus
wire eq_head_w_ld_29;  // SW load bus
wire eq_head_w_ld_30;  // SW load bus
wire eq_head_w_ld_31;  // SW load bus
wire eq_head_w_ld_32;  // SW load bus
wire eq_head_w_ld_33;  // SW load bus
wire eq_head_w_ld_34;  // SW load bus
wire eq_head_w_ld_35;  // SW load bus
wire [`FIRE_CSRBUS_DATA_WIDTH-1:0] csrbus_wr_data;  // SW write data
wire [`FIRE_DLC_IMU_EQS_CSR_EQ_HEAD_WIDTH-1:0] eq_head_csrbus_read_data_0;
    // SW read data
wire [`FIRE_DLC_IMU_EQS_CSR_EQ_HEAD_WIDTH-1:0] eq_head_csrbus_read_data_1;
    // SW read data
wire [`FIRE_DLC_IMU_EQS_CSR_EQ_HEAD_WIDTH-1:0] eq_head_csrbus_read_data_2;
    // SW read data
wire [`FIRE_DLC_IMU_EQS_CSR_EQ_HEAD_WIDTH-1:0] eq_head_csrbus_read_data_3;
    // SW read data
wire [`FIRE_DLC_IMU_EQS_CSR_EQ_HEAD_WIDTH-1:0] eq_head_csrbus_read_data_4;
    // SW read data
wire [`FIRE_DLC_IMU_EQS_CSR_EQ_HEAD_WIDTH-1:0] eq_head_csrbus_read_data_5;
    // SW read data
wire [`FIRE_DLC_IMU_EQS_CSR_EQ_HEAD_WIDTH-1:0] eq_head_csrbus_read_data_6;
    // SW read data
wire [`FIRE_DLC_IMU_EQS_CSR_EQ_HEAD_WIDTH-1:0] eq_head_csrbus_read_data_7;
    // SW read data
wire [`FIRE_DLC_IMU_EQS_CSR_EQ_HEAD_WIDTH-1:0] eq_head_csrbus_read_data_8;
    // SW read data
wire [`FIRE_DLC_IMU_EQS_CSR_EQ_HEAD_WIDTH-1:0] eq_head_csrbus_read_data_9;
    // SW read data
wire [`FIRE_DLC_IMU_EQS_CSR_EQ_HEAD_WIDTH-1:0] eq_head_csrbus_read_data_10;
    // SW read data
wire [`FIRE_DLC_IMU_EQS_CSR_EQ_HEAD_WIDTH-1:0] eq_head_csrbus_read_data_11;
    // SW read data
wire [`FIRE_DLC_IMU_EQS_CSR_EQ_HEAD_WIDTH-1:0] eq_head_csrbus_read_data_12;
    // SW read data
wire [`FIRE_DLC_IMU_EQS_CSR_EQ_HEAD_WIDTH-1:0] eq_head_csrbus_read_data_13;
    // SW read data
wire [`FIRE_DLC_IMU_EQS_CSR_EQ_HEAD_WIDTH-1:0] eq_head_csrbus_read_data_14;
    // SW read data
wire [`FIRE_DLC_IMU_EQS_CSR_EQ_HEAD_WIDTH-1:0] eq_head_csrbus_read_data_15;
    // SW read data
wire [`FIRE_DLC_IMU_EQS_CSR_EQ_HEAD_WIDTH-1:0] eq_head_csrbus_read_data_16;
    // SW read data
wire [`FIRE_DLC_IMU_EQS_CSR_EQ_HEAD_WIDTH-1:0] eq_head_csrbus_read_data_17;
    // SW read data
wire [`FIRE_DLC_IMU_EQS_CSR_EQ_HEAD_WIDTH-1:0] eq_head_csrbus_read_data_18;
    // SW read data
wire [`FIRE_DLC_IMU_EQS_CSR_EQ_HEAD_WIDTH-1:0] eq_head_csrbus_read_data_19;
    // SW read data
wire [`FIRE_DLC_IMU_EQS_CSR_EQ_HEAD_WIDTH-1:0] eq_head_csrbus_read_data_20;
    // SW read data
wire [`FIRE_DLC_IMU_EQS_CSR_EQ_HEAD_WIDTH-1:0] eq_head_csrbus_read_data_21;
    // SW read data
wire [`FIRE_DLC_IMU_EQS_CSR_EQ_HEAD_WIDTH-1:0] eq_head_csrbus_read_data_22;
    // SW read data
wire [`FIRE_DLC_IMU_EQS_CSR_EQ_HEAD_WIDTH-1:0] eq_head_csrbus_read_data_23;
    // SW read data
wire [`FIRE_DLC_IMU_EQS_CSR_EQ_HEAD_WIDTH-1:0] eq_head_csrbus_read_data_24;
    // SW read data
wire [`FIRE_DLC_IMU_EQS_CSR_EQ_HEAD_WIDTH-1:0] eq_head_csrbus_read_data_25;
    // SW read data
wire [`FIRE_DLC_IMU_EQS_CSR_EQ_HEAD_WIDTH-1:0] eq_head_csrbus_read_data_26;
    // SW read data
wire [`FIRE_DLC_IMU_EQS_CSR_EQ_HEAD_WIDTH-1:0] eq_head_csrbus_read_data_27;
    // SW read data
wire [`FIRE_DLC_IMU_EQS_CSR_EQ_HEAD_WIDTH-1:0] eq_head_csrbus_read_data_28;
    // SW read data
wire [`FIRE_DLC_IMU_EQS_CSR_EQ_HEAD_WIDTH-1:0] eq_head_csrbus_read_data_29;
    // SW read data
wire [`FIRE_DLC_IMU_EQS_CSR_EQ_HEAD_WIDTH-1:0] eq_head_csrbus_read_data_30;
    // SW read data
wire [`FIRE_DLC_IMU_EQS_CSR_EQ_HEAD_WIDTH-1:0] eq_head_csrbus_read_data_31;
    // SW read data
wire [`FIRE_DLC_IMU_EQS_CSR_EQ_HEAD_WIDTH-1:0] eq_head_csrbus_read_data_32;
    // SW read data
wire [`FIRE_DLC_IMU_EQS_CSR_EQ_HEAD_WIDTH-1:0] eq_head_csrbus_read_data_33;
    // SW read data
wire [`FIRE_DLC_IMU_EQS_CSR_EQ_HEAD_WIDTH-1:0] eq_head_csrbus_read_data_34;
    // SW read data
wire [`FIRE_DLC_IMU_EQS_CSR_EQ_HEAD_WIDTH-1:0] eq_head_csrbus_read_data_35;
    // SW read data
wire [`FIRE_DLC_IMU_EQS_CSR_EQ_HEAD_HEAD_INT_SLC] eq_head_head_hw_read_0;
    // This signal provides the current value of eq_head_head.
wire [`FIRE_DLC_IMU_EQS_CSR_EQ_HEAD_HEAD_INT_SLC] eq_head_head_hw_read_1;
    // This signal provides the current value of eq_head_head.
wire [`FIRE_DLC_IMU_EQS_CSR_EQ_HEAD_HEAD_INT_SLC] eq_head_head_hw_read_2;
    // This signal provides the current value of eq_head_head.
wire [`FIRE_DLC_IMU_EQS_CSR_EQ_HEAD_HEAD_INT_SLC] eq_head_head_hw_read_3;
    // This signal provides the current value of eq_head_head.
wire [`FIRE_DLC_IMU_EQS_CSR_EQ_HEAD_HEAD_INT_SLC] eq_head_head_hw_read_4;
    // This signal provides the current value of eq_head_head.
wire [`FIRE_DLC_IMU_EQS_CSR_EQ_HEAD_HEAD_INT_SLC] eq_head_head_hw_read_5;
    // This signal provides the current value of eq_head_head.
wire [`FIRE_DLC_IMU_EQS_CSR_EQ_HEAD_HEAD_INT_SLC] eq_head_head_hw_read_6;
    // This signal provides the current value of eq_head_head.
wire [`FIRE_DLC_IMU_EQS_CSR_EQ_HEAD_HEAD_INT_SLC] eq_head_head_hw_read_7;
    // This signal provides the current value of eq_head_head.
wire [`FIRE_DLC_IMU_EQS_CSR_EQ_HEAD_HEAD_INT_SLC] eq_head_head_hw_read_8;
    // This signal provides the current value of eq_head_head.
wire [`FIRE_DLC_IMU_EQS_CSR_EQ_HEAD_HEAD_INT_SLC] eq_head_head_hw_read_9;
    // This signal provides the current value of eq_head_head.
wire [`FIRE_DLC_IMU_EQS_CSR_EQ_HEAD_HEAD_INT_SLC] eq_head_head_hw_read_10;
    // This signal provides the current value of eq_head_head.
wire [`FIRE_DLC_IMU_EQS_CSR_EQ_HEAD_HEAD_INT_SLC] eq_head_head_hw_read_11;
    // This signal provides the current value of eq_head_head.
wire [`FIRE_DLC_IMU_EQS_CSR_EQ_HEAD_HEAD_INT_SLC] eq_head_head_hw_read_12;
    // This signal provides the current value of eq_head_head.
wire [`FIRE_DLC_IMU_EQS_CSR_EQ_HEAD_HEAD_INT_SLC] eq_head_head_hw_read_13;
    // This signal provides the current value of eq_head_head.
wire [`FIRE_DLC_IMU_EQS_CSR_EQ_HEAD_HEAD_INT_SLC] eq_head_head_hw_read_14;
    // This signal provides the current value of eq_head_head.
wire [`FIRE_DLC_IMU_EQS_CSR_EQ_HEAD_HEAD_INT_SLC] eq_head_head_hw_read_15;
    // This signal provides the current value of eq_head_head.
wire [`FIRE_DLC_IMU_EQS_CSR_EQ_HEAD_HEAD_INT_SLC] eq_head_head_hw_read_16;
    // This signal provides the current value of eq_head_head.
wire [`FIRE_DLC_IMU_EQS_CSR_EQ_HEAD_HEAD_INT_SLC] eq_head_head_hw_read_17;
    // This signal provides the current value of eq_head_head.
wire [`FIRE_DLC_IMU_EQS_CSR_EQ_HEAD_HEAD_INT_SLC] eq_head_head_hw_read_18;
    // This signal provides the current value of eq_head_head.
wire [`FIRE_DLC_IMU_EQS_CSR_EQ_HEAD_HEAD_INT_SLC] eq_head_head_hw_read_19;
    // This signal provides the current value of eq_head_head.
wire [`FIRE_DLC_IMU_EQS_CSR_EQ_HEAD_HEAD_INT_SLC] eq_head_head_hw_read_20;
    // This signal provides the current value of eq_head_head.
wire [`FIRE_DLC_IMU_EQS_CSR_EQ_HEAD_HEAD_INT_SLC] eq_head_head_hw_read_21;
    // This signal provides the current value of eq_head_head.
wire [`FIRE_DLC_IMU_EQS_CSR_EQ_HEAD_HEAD_INT_SLC] eq_head_head_hw_read_22;
    // This signal provides the current value of eq_head_head.
wire [`FIRE_DLC_IMU_EQS_CSR_EQ_HEAD_HEAD_INT_SLC] eq_head_head_hw_read_23;
    // This signal provides the current value of eq_head_head.
wire [`FIRE_DLC_IMU_EQS_CSR_EQ_HEAD_HEAD_INT_SLC] eq_head_head_hw_read_24;
    // This signal provides the current value of eq_head_head.
wire [`FIRE_DLC_IMU_EQS_CSR_EQ_HEAD_HEAD_INT_SLC] eq_head_head_hw_read_25;
    // This signal provides the current value of eq_head_head.
wire [`FIRE_DLC_IMU_EQS_CSR_EQ_HEAD_HEAD_INT_SLC] eq_head_head_hw_read_26;
    // This signal provides the current value of eq_head_head.
wire [`FIRE_DLC_IMU_EQS_CSR_EQ_HEAD_HEAD_INT_SLC] eq_head_head_hw_read_27;
    // This signal provides the current value of eq_head_head.
wire [`FIRE_DLC_IMU_EQS_CSR_EQ_HEAD_HEAD_INT_SLC] eq_head_head_hw_read_28;
    // This signal provides the current value of eq_head_head.
wire [`FIRE_DLC_IMU_EQS_CSR_EQ_HEAD_HEAD_INT_SLC] eq_head_head_hw_read_29;
    // This signal provides the current value of eq_head_head.
wire [`FIRE_DLC_IMU_EQS_CSR_EQ_HEAD_HEAD_INT_SLC] eq_head_head_hw_read_30;
    // This signal provides the current value of eq_head_head.
wire [`FIRE_DLC_IMU_EQS_CSR_EQ_HEAD_HEAD_INT_SLC] eq_head_head_hw_read_31;
    // This signal provides the current value of eq_head_head.
wire [`FIRE_DLC_IMU_EQS_CSR_EQ_HEAD_HEAD_INT_SLC] eq_head_head_hw_read_32;
    // This signal provides the current value of eq_head_head.
wire [`FIRE_DLC_IMU_EQS_CSR_EQ_HEAD_HEAD_INT_SLC] eq_head_head_hw_read_33;
    // This signal provides the current value of eq_head_head.
wire [`FIRE_DLC_IMU_EQS_CSR_EQ_HEAD_HEAD_INT_SLC] eq_head_head_hw_read_34;
    // This signal provides the current value of eq_head_head.
wire [`FIRE_DLC_IMU_EQS_CSR_EQ_HEAD_HEAD_INT_SLC] eq_head_head_hw_read_35;
    // This signal provides the current value of eq_head_head.

//====================================================================
//     Logic     
//====================================================================

// synopsys translate_off
// verilint 123 off
// verilint 498 off
reg omni_ld_0;
reg [`FIRE_DLC_IMU_EQS_CSR_EQ_HEAD_WIDTH-1:0] omni_data_0;

// vlint flag_unsynthesizable_initial off
initial
  begin
     omni_ld_0         = 1'b0;
     omni_data_0       = `FIRE_DLC_IMU_EQS_CSR_EQ_HEAD_WIDTH'b0;
  end// vlint flag_unsynthesizable_initial on

reg omni_ld_1;
reg [`FIRE_DLC_IMU_EQS_CSR_EQ_HEAD_WIDTH-1:0] omni_data_1;

// vlint flag_unsynthesizable_initial off
initial
  begin
     omni_ld_1         = 1'b0;
     omni_data_1       = `FIRE_DLC_IMU_EQS_CSR_EQ_HEAD_WIDTH'b0;
  end// vlint flag_unsynthesizable_initial on

reg omni_ld_2;
reg [`FIRE_DLC_IMU_EQS_CSR_EQ_HEAD_WIDTH-1:0] omni_data_2;

// vlint flag_unsynthesizable_initial off
initial
  begin
     omni_ld_2         = 1'b0;
     omni_data_2       = `FIRE_DLC_IMU_EQS_CSR_EQ_HEAD_WIDTH'b0;
  end// vlint flag_unsynthesizable_initial on

reg omni_ld_3;
reg [`FIRE_DLC_IMU_EQS_CSR_EQ_HEAD_WIDTH-1:0] omni_data_3;

// vlint flag_unsynthesizable_initial off
initial
  begin
     omni_ld_3         = 1'b0;
     omni_data_3       = `FIRE_DLC_IMU_EQS_CSR_EQ_HEAD_WIDTH'b0;
  end// vlint flag_unsynthesizable_initial on

reg omni_ld_4;
reg [`FIRE_DLC_IMU_EQS_CSR_EQ_HEAD_WIDTH-1:0] omni_data_4;

// vlint flag_unsynthesizable_initial off
initial
  begin
     omni_ld_4         = 1'b0;
     omni_data_4       = `FIRE_DLC_IMU_EQS_CSR_EQ_HEAD_WIDTH'b0;
  end// vlint flag_unsynthesizable_initial on

reg omni_ld_5;
reg [`FIRE_DLC_IMU_EQS_CSR_EQ_HEAD_WIDTH-1:0] omni_data_5;

// vlint flag_unsynthesizable_initial off
initial
  begin
     omni_ld_5         = 1'b0;
     omni_data_5       = `FIRE_DLC_IMU_EQS_CSR_EQ_HEAD_WIDTH'b0;
  end// vlint flag_unsynthesizable_initial on

reg omni_ld_6;
reg [`FIRE_DLC_IMU_EQS_CSR_EQ_HEAD_WIDTH-1:0] omni_data_6;

// vlint flag_unsynthesizable_initial off
initial
  begin
     omni_ld_6         = 1'b0;
     omni_data_6       = `FIRE_DLC_IMU_EQS_CSR_EQ_HEAD_WIDTH'b0;
  end// vlint flag_unsynthesizable_initial on

reg omni_ld_7;
reg [`FIRE_DLC_IMU_EQS_CSR_EQ_HEAD_WIDTH-1:0] omni_data_7;

// vlint flag_unsynthesizable_initial off
initial
  begin
     omni_ld_7         = 1'b0;
     omni_data_7       = `FIRE_DLC_IMU_EQS_CSR_EQ_HEAD_WIDTH'b0;
  end// vlint flag_unsynthesizable_initial on

reg omni_ld_8;
reg [`FIRE_DLC_IMU_EQS_CSR_EQ_HEAD_WIDTH-1:0] omni_data_8;

// vlint flag_unsynthesizable_initial off
initial
  begin
     omni_ld_8         = 1'b0;
     omni_data_8       = `FIRE_DLC_IMU_EQS_CSR_EQ_HEAD_WIDTH'b0;
  end// vlint flag_unsynthesizable_initial on

reg omni_ld_9;
reg [`FIRE_DLC_IMU_EQS_CSR_EQ_HEAD_WIDTH-1:0] omni_data_9;

// vlint flag_unsynthesizable_initial off
initial
  begin
     omni_ld_9         = 1'b0;
     omni_data_9       = `FIRE_DLC_IMU_EQS_CSR_EQ_HEAD_WIDTH'b0;
  end// vlint flag_unsynthesizable_initial on

reg omni_ld_10;
reg [`FIRE_DLC_IMU_EQS_CSR_EQ_HEAD_WIDTH-1:0] omni_data_10;

// vlint flag_unsynthesizable_initial off
initial
  begin
     omni_ld_10         = 1'b0;
     omni_data_10       = `FIRE_DLC_IMU_EQS_CSR_EQ_HEAD_WIDTH'b0;
  end// vlint flag_unsynthesizable_initial on

reg omni_ld_11;
reg [`FIRE_DLC_IMU_EQS_CSR_EQ_HEAD_WIDTH-1:0] omni_data_11;

// vlint flag_unsynthesizable_initial off
initial
  begin
     omni_ld_11         = 1'b0;
     omni_data_11       = `FIRE_DLC_IMU_EQS_CSR_EQ_HEAD_WIDTH'b0;
  end// vlint flag_unsynthesizable_initial on

reg omni_ld_12;
reg [`FIRE_DLC_IMU_EQS_CSR_EQ_HEAD_WIDTH-1:0] omni_data_12;

// vlint flag_unsynthesizable_initial off
initial
  begin
     omni_ld_12         = 1'b0;
     omni_data_12       = `FIRE_DLC_IMU_EQS_CSR_EQ_HEAD_WIDTH'b0;
  end// vlint flag_unsynthesizable_initial on

reg omni_ld_13;
reg [`FIRE_DLC_IMU_EQS_CSR_EQ_HEAD_WIDTH-1:0] omni_data_13;

// vlint flag_unsynthesizable_initial off
initial
  begin
     omni_ld_13         = 1'b0;
     omni_data_13       = `FIRE_DLC_IMU_EQS_CSR_EQ_HEAD_WIDTH'b0;
  end// vlint flag_unsynthesizable_initial on

reg omni_ld_14;
reg [`FIRE_DLC_IMU_EQS_CSR_EQ_HEAD_WIDTH-1:0] omni_data_14;

// vlint flag_unsynthesizable_initial off
initial
  begin
     omni_ld_14         = 1'b0;
     omni_data_14       = `FIRE_DLC_IMU_EQS_CSR_EQ_HEAD_WIDTH'b0;
  end// vlint flag_unsynthesizable_initial on

reg omni_ld_15;
reg [`FIRE_DLC_IMU_EQS_CSR_EQ_HEAD_WIDTH-1:0] omni_data_15;

// vlint flag_unsynthesizable_initial off
initial
  begin
     omni_ld_15         = 1'b0;
     omni_data_15       = `FIRE_DLC_IMU_EQS_CSR_EQ_HEAD_WIDTH'b0;
  end// vlint flag_unsynthesizable_initial on

reg omni_ld_16;
reg [`FIRE_DLC_IMU_EQS_CSR_EQ_HEAD_WIDTH-1:0] omni_data_16;

// vlint flag_unsynthesizable_initial off
initial
  begin
     omni_ld_16         = 1'b0;
     omni_data_16       = `FIRE_DLC_IMU_EQS_CSR_EQ_HEAD_WIDTH'b0;
  end// vlint flag_unsynthesizable_initial on

reg omni_ld_17;
reg [`FIRE_DLC_IMU_EQS_CSR_EQ_HEAD_WIDTH-1:0] omni_data_17;

// vlint flag_unsynthesizable_initial off
initial
  begin
     omni_ld_17         = 1'b0;
     omni_data_17       = `FIRE_DLC_IMU_EQS_CSR_EQ_HEAD_WIDTH'b0;
  end// vlint flag_unsynthesizable_initial on

reg omni_ld_18;
reg [`FIRE_DLC_IMU_EQS_CSR_EQ_HEAD_WIDTH-1:0] omni_data_18;

// vlint flag_unsynthesizable_initial off
initial
  begin
     omni_ld_18         = 1'b0;
     omni_data_18       = `FIRE_DLC_IMU_EQS_CSR_EQ_HEAD_WIDTH'b0;
  end// vlint flag_unsynthesizable_initial on

reg omni_ld_19;
reg [`FIRE_DLC_IMU_EQS_CSR_EQ_HEAD_WIDTH-1:0] omni_data_19;

// vlint flag_unsynthesizable_initial off
initial
  begin
     omni_ld_19         = 1'b0;
     omni_data_19       = `FIRE_DLC_IMU_EQS_CSR_EQ_HEAD_WIDTH'b0;
  end// vlint flag_unsynthesizable_initial on

reg omni_ld_20;
reg [`FIRE_DLC_IMU_EQS_CSR_EQ_HEAD_WIDTH-1:0] omni_data_20;

// vlint flag_unsynthesizable_initial off
initial
  begin
     omni_ld_20         = 1'b0;
     omni_data_20       = `FIRE_DLC_IMU_EQS_CSR_EQ_HEAD_WIDTH'b0;
  end// vlint flag_unsynthesizable_initial on

reg omni_ld_21;
reg [`FIRE_DLC_IMU_EQS_CSR_EQ_HEAD_WIDTH-1:0] omni_data_21;

// vlint flag_unsynthesizable_initial off
initial
  begin
     omni_ld_21         = 1'b0;
     omni_data_21       = `FIRE_DLC_IMU_EQS_CSR_EQ_HEAD_WIDTH'b0;
  end// vlint flag_unsynthesizable_initial on

reg omni_ld_22;
reg [`FIRE_DLC_IMU_EQS_CSR_EQ_HEAD_WIDTH-1:0] omni_data_22;

// vlint flag_unsynthesizable_initial off
initial
  begin
     omni_ld_22         = 1'b0;
     omni_data_22       = `FIRE_DLC_IMU_EQS_CSR_EQ_HEAD_WIDTH'b0;
  end// vlint flag_unsynthesizable_initial on

reg omni_ld_23;
reg [`FIRE_DLC_IMU_EQS_CSR_EQ_HEAD_WIDTH-1:0] omni_data_23;

// vlint flag_unsynthesizable_initial off
initial
  begin
     omni_ld_23         = 1'b0;
     omni_data_23       = `FIRE_DLC_IMU_EQS_CSR_EQ_HEAD_WIDTH'b0;
  end// vlint flag_unsynthesizable_initial on

reg omni_ld_24;
reg [`FIRE_DLC_IMU_EQS_CSR_EQ_HEAD_WIDTH-1:0] omni_data_24;

// vlint flag_unsynthesizable_initial off
initial
  begin
     omni_ld_24         = 1'b0;
     omni_data_24       = `FIRE_DLC_IMU_EQS_CSR_EQ_HEAD_WIDTH'b0;
  end// vlint flag_unsynthesizable_initial on

reg omni_ld_25;
reg [`FIRE_DLC_IMU_EQS_CSR_EQ_HEAD_WIDTH-1:0] omni_data_25;

// vlint flag_unsynthesizable_initial off
initial
  begin
     omni_ld_25         = 1'b0;
     omni_data_25       = `FIRE_DLC_IMU_EQS_CSR_EQ_HEAD_WIDTH'b0;
  end// vlint flag_unsynthesizable_initial on

reg omni_ld_26;
reg [`FIRE_DLC_IMU_EQS_CSR_EQ_HEAD_WIDTH-1:0] omni_data_26;

// vlint flag_unsynthesizable_initial off
initial
  begin
     omni_ld_26         = 1'b0;
     omni_data_26       = `FIRE_DLC_IMU_EQS_CSR_EQ_HEAD_WIDTH'b0;
  end// vlint flag_unsynthesizable_initial on

reg omni_ld_27;
reg [`FIRE_DLC_IMU_EQS_CSR_EQ_HEAD_WIDTH-1:0] omni_data_27;

// vlint flag_unsynthesizable_initial off
initial
  begin
     omni_ld_27         = 1'b0;
     omni_data_27       = `FIRE_DLC_IMU_EQS_CSR_EQ_HEAD_WIDTH'b0;
  end// vlint flag_unsynthesizable_initial on

reg omni_ld_28;
reg [`FIRE_DLC_IMU_EQS_CSR_EQ_HEAD_WIDTH-1:0] omni_data_28;

// vlint flag_unsynthesizable_initial off
initial
  begin
     omni_ld_28         = 1'b0;
     omni_data_28       = `FIRE_DLC_IMU_EQS_CSR_EQ_HEAD_WIDTH'b0;
  end// vlint flag_unsynthesizable_initial on

reg omni_ld_29;
reg [`FIRE_DLC_IMU_EQS_CSR_EQ_HEAD_WIDTH-1:0] omni_data_29;

// vlint flag_unsynthesizable_initial off
initial
  begin
     omni_ld_29         = 1'b0;
     omni_data_29       = `FIRE_DLC_IMU_EQS_CSR_EQ_HEAD_WIDTH'b0;
  end// vlint flag_unsynthesizable_initial on

reg omni_ld_30;
reg [`FIRE_DLC_IMU_EQS_CSR_EQ_HEAD_WIDTH-1:0] omni_data_30;

// vlint flag_unsynthesizable_initial off
initial
  begin
     omni_ld_30         = 1'b0;
     omni_data_30       = `FIRE_DLC_IMU_EQS_CSR_EQ_HEAD_WIDTH'b0;
  end// vlint flag_unsynthesizable_initial on

reg omni_ld_31;
reg [`FIRE_DLC_IMU_EQS_CSR_EQ_HEAD_WIDTH-1:0] omni_data_31;

// vlint flag_unsynthesizable_initial off
initial
  begin
     omni_ld_31         = 1'b0;
     omni_data_31       = `FIRE_DLC_IMU_EQS_CSR_EQ_HEAD_WIDTH'b0;
  end// vlint flag_unsynthesizable_initial on

reg omni_ld_32;
reg [`FIRE_DLC_IMU_EQS_CSR_EQ_HEAD_WIDTH-1:0] omni_data_32;

// vlint flag_unsynthesizable_initial off
initial
  begin
     omni_ld_32         = 1'b0;
     omni_data_32       = `FIRE_DLC_IMU_EQS_CSR_EQ_HEAD_WIDTH'b0;
  end// vlint flag_unsynthesizable_initial on

reg omni_ld_33;
reg [`FIRE_DLC_IMU_EQS_CSR_EQ_HEAD_WIDTH-1:0] omni_data_33;

// vlint flag_unsynthesizable_initial off
initial
  begin
     omni_ld_33         = 1'b0;
     omni_data_33       = `FIRE_DLC_IMU_EQS_CSR_EQ_HEAD_WIDTH'b0;
  end// vlint flag_unsynthesizable_initial on

reg omni_ld_34;
reg [`FIRE_DLC_IMU_EQS_CSR_EQ_HEAD_WIDTH-1:0] omni_data_34;

// vlint flag_unsynthesizable_initial off
initial
  begin
     omni_ld_34         = 1'b0;
     omni_data_34       = `FIRE_DLC_IMU_EQS_CSR_EQ_HEAD_WIDTH'b0;
  end// vlint flag_unsynthesizable_initial on

reg omni_ld_35;
reg [`FIRE_DLC_IMU_EQS_CSR_EQ_HEAD_WIDTH-1:0] omni_data_35;

// vlint flag_unsynthesizable_initial off
initial
  begin
     omni_ld_35         = 1'b0;
     omni_data_35       = `FIRE_DLC_IMU_EQS_CSR_EQ_HEAD_WIDTH'b0;
  end// vlint flag_unsynthesizable_initial on

// verilint 123 on
// verilint 498 on
// synopsys translate_on

//----- Hardware Data Out Mux Assignments
assign eq_head_head_hw_read_0=
           eq_head_csrbus_read_data_0
               [`FIRE_DLC_IMU_EQS_CSR_EQ_HEAD_HEAD_SLC];
assign eq_head_head_hw_read_1=
           eq_head_csrbus_read_data_1
               [`FIRE_DLC_IMU_EQS_CSR_EQ_HEAD_HEAD_SLC];
assign eq_head_head_hw_read_2=
           eq_head_csrbus_read_data_2
               [`FIRE_DLC_IMU_EQS_CSR_EQ_HEAD_HEAD_SLC];
assign eq_head_head_hw_read_3=
           eq_head_csrbus_read_data_3
               [`FIRE_DLC_IMU_EQS_CSR_EQ_HEAD_HEAD_SLC];
assign eq_head_head_hw_read_4=
           eq_head_csrbus_read_data_4
               [`FIRE_DLC_IMU_EQS_CSR_EQ_HEAD_HEAD_SLC];
assign eq_head_head_hw_read_5=
           eq_head_csrbus_read_data_5
               [`FIRE_DLC_IMU_EQS_CSR_EQ_HEAD_HEAD_SLC];
assign eq_head_head_hw_read_6=
           eq_head_csrbus_read_data_6
               [`FIRE_DLC_IMU_EQS_CSR_EQ_HEAD_HEAD_SLC];
assign eq_head_head_hw_read_7=
           eq_head_csrbus_read_data_7
               [`FIRE_DLC_IMU_EQS_CSR_EQ_HEAD_HEAD_SLC];
assign eq_head_head_hw_read_8=
           eq_head_csrbus_read_data_8
               [`FIRE_DLC_IMU_EQS_CSR_EQ_HEAD_HEAD_SLC];
assign eq_head_head_hw_read_9=
           eq_head_csrbus_read_data_9
               [`FIRE_DLC_IMU_EQS_CSR_EQ_HEAD_HEAD_SLC];
assign eq_head_head_hw_read_10=
           eq_head_csrbus_read_data_10
               [`FIRE_DLC_IMU_EQS_CSR_EQ_HEAD_HEAD_SLC];
assign eq_head_head_hw_read_11=
           eq_head_csrbus_read_data_11
               [`FIRE_DLC_IMU_EQS_CSR_EQ_HEAD_HEAD_SLC];
assign eq_head_head_hw_read_12=
           eq_head_csrbus_read_data_12
               [`FIRE_DLC_IMU_EQS_CSR_EQ_HEAD_HEAD_SLC];
assign eq_head_head_hw_read_13=
           eq_head_csrbus_read_data_13
               [`FIRE_DLC_IMU_EQS_CSR_EQ_HEAD_HEAD_SLC];
assign eq_head_head_hw_read_14=
           eq_head_csrbus_read_data_14
               [`FIRE_DLC_IMU_EQS_CSR_EQ_HEAD_HEAD_SLC];
assign eq_head_head_hw_read_15=
           eq_head_csrbus_read_data_15
               [`FIRE_DLC_IMU_EQS_CSR_EQ_HEAD_HEAD_SLC];
assign eq_head_head_hw_read_16=
           eq_head_csrbus_read_data_16
               [`FIRE_DLC_IMU_EQS_CSR_EQ_HEAD_HEAD_SLC];
assign eq_head_head_hw_read_17=
           eq_head_csrbus_read_data_17
               [`FIRE_DLC_IMU_EQS_CSR_EQ_HEAD_HEAD_SLC];
assign eq_head_head_hw_read_18=
           eq_head_csrbus_read_data_18
               [`FIRE_DLC_IMU_EQS_CSR_EQ_HEAD_HEAD_SLC];
assign eq_head_head_hw_read_19=
           eq_head_csrbus_read_data_19
               [`FIRE_DLC_IMU_EQS_CSR_EQ_HEAD_HEAD_SLC];
assign eq_head_head_hw_read_20=
           eq_head_csrbus_read_data_20
               [`FIRE_DLC_IMU_EQS_CSR_EQ_HEAD_HEAD_SLC];
assign eq_head_head_hw_read_21=
           eq_head_csrbus_read_data_21
               [`FIRE_DLC_IMU_EQS_CSR_EQ_HEAD_HEAD_SLC];
assign eq_head_head_hw_read_22=
           eq_head_csrbus_read_data_22
               [`FIRE_DLC_IMU_EQS_CSR_EQ_HEAD_HEAD_SLC];
assign eq_head_head_hw_read_23=
           eq_head_csrbus_read_data_23
               [`FIRE_DLC_IMU_EQS_CSR_EQ_HEAD_HEAD_SLC];
assign eq_head_head_hw_read_24=
           eq_head_csrbus_read_data_24
               [`FIRE_DLC_IMU_EQS_CSR_EQ_HEAD_HEAD_SLC];
assign eq_head_head_hw_read_25=
           eq_head_csrbus_read_data_25
               [`FIRE_DLC_IMU_EQS_CSR_EQ_HEAD_HEAD_SLC];
assign eq_head_head_hw_read_26=
           eq_head_csrbus_read_data_26
               [`FIRE_DLC_IMU_EQS_CSR_EQ_HEAD_HEAD_SLC];
assign eq_head_head_hw_read_27=
           eq_head_csrbus_read_data_27
               [`FIRE_DLC_IMU_EQS_CSR_EQ_HEAD_HEAD_SLC];
assign eq_head_head_hw_read_28=
           eq_head_csrbus_read_data_28
               [`FIRE_DLC_IMU_EQS_CSR_EQ_HEAD_HEAD_SLC];
assign eq_head_head_hw_read_29=
           eq_head_csrbus_read_data_29
               [`FIRE_DLC_IMU_EQS_CSR_EQ_HEAD_HEAD_SLC];
assign eq_head_head_hw_read_30=
           eq_head_csrbus_read_data_30
               [`FIRE_DLC_IMU_EQS_CSR_EQ_HEAD_HEAD_SLC];
assign eq_head_head_hw_read_31=
           eq_head_csrbus_read_data_31
               [`FIRE_DLC_IMU_EQS_CSR_EQ_HEAD_HEAD_SLC];
assign eq_head_head_hw_read_32=
           eq_head_csrbus_read_data_32
               [`FIRE_DLC_IMU_EQS_CSR_EQ_HEAD_HEAD_SLC];
assign eq_head_head_hw_read_33=
           eq_head_csrbus_read_data_33
               [`FIRE_DLC_IMU_EQS_CSR_EQ_HEAD_HEAD_SLC];
assign eq_head_head_hw_read_34=
           eq_head_csrbus_read_data_34
               [`FIRE_DLC_IMU_EQS_CSR_EQ_HEAD_HEAD_SLC];
assign eq_head_head_hw_read_35=
           eq_head_csrbus_read_data_35
               [`FIRE_DLC_IMU_EQS_CSR_EQ_HEAD_HEAD_SLC];

//====================================================================
//     Instantiation of entries
//====================================================================

//----- Entry 0
dmu_imu_eqs_csr_eq_head_entry eq_head_0
	(
	// synopsys translate_off
	  .omni_ld	(omni_ld_0),
	  .omni_data	(omni_data_0),
	// synopsys translate_on
	.clk	(clk),
	.rst_l	(rst_l),
	.w_ld	(eq_head_w_ld_0),
	.csrbus_wr_data	(csrbus_wr_data),
	.eq_head_csrbus_read_data	(eq_head_csrbus_read_data_0)
	);

//----- Entry 1
dmu_imu_eqs_csr_eq_head_entry eq_head_1
	(
	// synopsys translate_off
	  .omni_ld	(omni_ld_1),
	  .omni_data	(omni_data_1),
	// synopsys translate_on
	.clk	(clk),
	.rst_l	(rst_l),
	.w_ld	(eq_head_w_ld_1),
	.csrbus_wr_data	(csrbus_wr_data),
	.eq_head_csrbus_read_data	(eq_head_csrbus_read_data_1)
	);

//----- Entry 2
dmu_imu_eqs_csr_eq_head_entry eq_head_2
	(
	// synopsys translate_off
	  .omni_ld	(omni_ld_2),
	  .omni_data	(omni_data_2),
	// synopsys translate_on
	.clk	(clk),
	.rst_l	(rst_l),
	.w_ld	(eq_head_w_ld_2),
	.csrbus_wr_data	(csrbus_wr_data),
	.eq_head_csrbus_read_data	(eq_head_csrbus_read_data_2)
	);

//----- Entry 3
dmu_imu_eqs_csr_eq_head_entry eq_head_3
	(
	// synopsys translate_off
	  .omni_ld	(omni_ld_3),
	  .omni_data	(omni_data_3),
	// synopsys translate_on
	.clk	(clk),
	.rst_l	(rst_l),
	.w_ld	(eq_head_w_ld_3),
	.csrbus_wr_data	(csrbus_wr_data),
	.eq_head_csrbus_read_data	(eq_head_csrbus_read_data_3)
	);

//----- Entry 4
dmu_imu_eqs_csr_eq_head_entry eq_head_4
	(
	// synopsys translate_off
	  .omni_ld	(omni_ld_4),
	  .omni_data	(omni_data_4),
	// synopsys translate_on
	.clk	(clk),
	.rst_l	(rst_l),
	.w_ld	(eq_head_w_ld_4),
	.csrbus_wr_data	(csrbus_wr_data),
	.eq_head_csrbus_read_data	(eq_head_csrbus_read_data_4)
	);

//----- Entry 5
dmu_imu_eqs_csr_eq_head_entry eq_head_5
	(
	// synopsys translate_off
	  .omni_ld	(omni_ld_5),
	  .omni_data	(omni_data_5),
	// synopsys translate_on
	.clk	(clk),
	.rst_l	(rst_l),
	.w_ld	(eq_head_w_ld_5),
	.csrbus_wr_data	(csrbus_wr_data),
	.eq_head_csrbus_read_data	(eq_head_csrbus_read_data_5)
	);

//----- Entry 6
dmu_imu_eqs_csr_eq_head_entry eq_head_6
	(
	// synopsys translate_off
	  .omni_ld	(omni_ld_6),
	  .omni_data	(omni_data_6),
	// synopsys translate_on
	.clk	(clk),
	.rst_l	(rst_l),
	.w_ld	(eq_head_w_ld_6),
	.csrbus_wr_data	(csrbus_wr_data),
	.eq_head_csrbus_read_data	(eq_head_csrbus_read_data_6)
	);

//----- Entry 7
dmu_imu_eqs_csr_eq_head_entry eq_head_7
	(
	// synopsys translate_off
	  .omni_ld	(omni_ld_7),
	  .omni_data	(omni_data_7),
	// synopsys translate_on
	.clk	(clk),
	.rst_l	(rst_l),
	.w_ld	(eq_head_w_ld_7),
	.csrbus_wr_data	(csrbus_wr_data),
	.eq_head_csrbus_read_data	(eq_head_csrbus_read_data_7)
	);

//----- Entry 8
dmu_imu_eqs_csr_eq_head_entry eq_head_8
	(
	// synopsys translate_off
	  .omni_ld	(omni_ld_8),
	  .omni_data	(omni_data_8),
	// synopsys translate_on
	.clk	(clk),
	.rst_l	(rst_l),
	.w_ld	(eq_head_w_ld_8),
	.csrbus_wr_data	(csrbus_wr_data),
	.eq_head_csrbus_read_data	(eq_head_csrbus_read_data_8)
	);

//----- Entry 9
dmu_imu_eqs_csr_eq_head_entry eq_head_9
	(
	// synopsys translate_off
	  .omni_ld	(omni_ld_9),
	  .omni_data	(omni_data_9),
	// synopsys translate_on
	.clk	(clk),
	.rst_l	(rst_l),
	.w_ld	(eq_head_w_ld_9),
	.csrbus_wr_data	(csrbus_wr_data),
	.eq_head_csrbus_read_data	(eq_head_csrbus_read_data_9)
	);

//----- Entry 10
dmu_imu_eqs_csr_eq_head_entry eq_head_10
	(
	// synopsys translate_off
	  .omni_ld	(omni_ld_10),
	  .omni_data	(omni_data_10),
	// synopsys translate_on
	.clk	(clk),
	.rst_l	(rst_l),
	.w_ld	(eq_head_w_ld_10),
	.csrbus_wr_data	(csrbus_wr_data),
	.eq_head_csrbus_read_data	(eq_head_csrbus_read_data_10)
	);

//----- Entry 11
dmu_imu_eqs_csr_eq_head_entry eq_head_11
	(
	// synopsys translate_off
	  .omni_ld	(omni_ld_11),
	  .omni_data	(omni_data_11),
	// synopsys translate_on
	.clk	(clk),
	.rst_l	(rst_l),
	.w_ld	(eq_head_w_ld_11),
	.csrbus_wr_data	(csrbus_wr_data),
	.eq_head_csrbus_read_data	(eq_head_csrbus_read_data_11)
	);

//----- Entry 12
dmu_imu_eqs_csr_eq_head_entry eq_head_12
	(
	// synopsys translate_off
	  .omni_ld	(omni_ld_12),
	  .omni_data	(omni_data_12),
	// synopsys translate_on
	.clk	(clk),
	.rst_l	(rst_l),
	.w_ld	(eq_head_w_ld_12),
	.csrbus_wr_data	(csrbus_wr_data),
	.eq_head_csrbus_read_data	(eq_head_csrbus_read_data_12)
	);

//----- Entry 13
dmu_imu_eqs_csr_eq_head_entry eq_head_13
	(
	// synopsys translate_off
	  .omni_ld	(omni_ld_13),
	  .omni_data	(omni_data_13),
	// synopsys translate_on
	.clk	(clk),
	.rst_l	(rst_l),
	.w_ld	(eq_head_w_ld_13),
	.csrbus_wr_data	(csrbus_wr_data),
	.eq_head_csrbus_read_data	(eq_head_csrbus_read_data_13)
	);

//----- Entry 14
dmu_imu_eqs_csr_eq_head_entry eq_head_14
	(
	// synopsys translate_off
	  .omni_ld	(omni_ld_14),
	  .omni_data	(omni_data_14),
	// synopsys translate_on
	.clk	(clk),
	.rst_l	(rst_l),
	.w_ld	(eq_head_w_ld_14),
	.csrbus_wr_data	(csrbus_wr_data),
	.eq_head_csrbus_read_data	(eq_head_csrbus_read_data_14)
	);

//----- Entry 15
dmu_imu_eqs_csr_eq_head_entry eq_head_15
	(
	// synopsys translate_off
	  .omni_ld	(omni_ld_15),
	  .omni_data	(omni_data_15),
	// synopsys translate_on
	.clk	(clk),
	.rst_l	(rst_l),
	.w_ld	(eq_head_w_ld_15),
	.csrbus_wr_data	(csrbus_wr_data),
	.eq_head_csrbus_read_data	(eq_head_csrbus_read_data_15)
	);

//----- Entry 16
dmu_imu_eqs_csr_eq_head_entry eq_head_16
	(
	// synopsys translate_off
	  .omni_ld	(omni_ld_16),
	  .omni_data	(omni_data_16),
	// synopsys translate_on
	.clk	(clk),
	.rst_l	(rst_l),
	.w_ld	(eq_head_w_ld_16),
	.csrbus_wr_data	(csrbus_wr_data),
	.eq_head_csrbus_read_data	(eq_head_csrbus_read_data_16)
	);

//----- Entry 17
dmu_imu_eqs_csr_eq_head_entry eq_head_17
	(
	// synopsys translate_off
	  .omni_ld	(omni_ld_17),
	  .omni_data	(omni_data_17),
	// synopsys translate_on
	.clk	(clk),
	.rst_l	(rst_l),
	.w_ld	(eq_head_w_ld_17),
	.csrbus_wr_data	(csrbus_wr_data),
	.eq_head_csrbus_read_data	(eq_head_csrbus_read_data_17)
	);

//----- Entry 18
dmu_imu_eqs_csr_eq_head_entry eq_head_18
	(
	// synopsys translate_off
	  .omni_ld	(omni_ld_18),
	  .omni_data	(omni_data_18),
	// synopsys translate_on
	.clk	(clk),
	.rst_l	(rst_l),
	.w_ld	(eq_head_w_ld_18),
	.csrbus_wr_data	(csrbus_wr_data),
	.eq_head_csrbus_read_data	(eq_head_csrbus_read_data_18)
	);

//----- Entry 19
dmu_imu_eqs_csr_eq_head_entry eq_head_19
	(
	// synopsys translate_off
	  .omni_ld	(omni_ld_19),
	  .omni_data	(omni_data_19),
	// synopsys translate_on
	.clk	(clk),
	.rst_l	(rst_l),
	.w_ld	(eq_head_w_ld_19),
	.csrbus_wr_data	(csrbus_wr_data),
	.eq_head_csrbus_read_data	(eq_head_csrbus_read_data_19)
	);

//----- Entry 20
dmu_imu_eqs_csr_eq_head_entry eq_head_20
	(
	// synopsys translate_off
	  .omni_ld	(omni_ld_20),
	  .omni_data	(omni_data_20),
	// synopsys translate_on
	.clk	(clk),
	.rst_l	(rst_l),
	.w_ld	(eq_head_w_ld_20),
	.csrbus_wr_data	(csrbus_wr_data),
	.eq_head_csrbus_read_data	(eq_head_csrbus_read_data_20)
	);

//----- Entry 21
dmu_imu_eqs_csr_eq_head_entry eq_head_21
	(
	// synopsys translate_off
	  .omni_ld	(omni_ld_21),
	  .omni_data	(omni_data_21),
	// synopsys translate_on
	.clk	(clk),
	.rst_l	(rst_l),
	.w_ld	(eq_head_w_ld_21),
	.csrbus_wr_data	(csrbus_wr_data),
	.eq_head_csrbus_read_data	(eq_head_csrbus_read_data_21)
	);

//----- Entry 22
dmu_imu_eqs_csr_eq_head_entry eq_head_22
	(
	// synopsys translate_off
	  .omni_ld	(omni_ld_22),
	  .omni_data	(omni_data_22),
	// synopsys translate_on
	.clk	(clk),
	.rst_l	(rst_l),
	.w_ld	(eq_head_w_ld_22),
	.csrbus_wr_data	(csrbus_wr_data),
	.eq_head_csrbus_read_data	(eq_head_csrbus_read_data_22)
	);

//----- Entry 23
dmu_imu_eqs_csr_eq_head_entry eq_head_23
	(
	// synopsys translate_off
	  .omni_ld	(omni_ld_23),
	  .omni_data	(omni_data_23),
	// synopsys translate_on
	.clk	(clk),
	.rst_l	(rst_l),
	.w_ld	(eq_head_w_ld_23),
	.csrbus_wr_data	(csrbus_wr_data),
	.eq_head_csrbus_read_data	(eq_head_csrbus_read_data_23)
	);

//----- Entry 24
dmu_imu_eqs_csr_eq_head_entry eq_head_24
	(
	// synopsys translate_off
	  .omni_ld	(omni_ld_24),
	  .omni_data	(omni_data_24),
	// synopsys translate_on
	.clk	(clk),
	.rst_l	(rst_l),
	.w_ld	(eq_head_w_ld_24),
	.csrbus_wr_data	(csrbus_wr_data),
	.eq_head_csrbus_read_data	(eq_head_csrbus_read_data_24)
	);

//----- Entry 25
dmu_imu_eqs_csr_eq_head_entry eq_head_25
	(
	// synopsys translate_off
	  .omni_ld	(omni_ld_25),
	  .omni_data	(omni_data_25),
	// synopsys translate_on
	.clk	(clk),
	.rst_l	(rst_l),
	.w_ld	(eq_head_w_ld_25),
	.csrbus_wr_data	(csrbus_wr_data),
	.eq_head_csrbus_read_data	(eq_head_csrbus_read_data_25)
	);

//----- Entry 26
dmu_imu_eqs_csr_eq_head_entry eq_head_26
	(
	// synopsys translate_off
	  .omni_ld	(omni_ld_26),
	  .omni_data	(omni_data_26),
	// synopsys translate_on
	.clk	(clk),
	.rst_l	(rst_l),
	.w_ld	(eq_head_w_ld_26),
	.csrbus_wr_data	(csrbus_wr_data),
	.eq_head_csrbus_read_data	(eq_head_csrbus_read_data_26)
	);

//----- Entry 27
dmu_imu_eqs_csr_eq_head_entry eq_head_27
	(
	// synopsys translate_off
	  .omni_ld	(omni_ld_27),
	  .omni_data	(omni_data_27),
	// synopsys translate_on
	.clk	(clk),
	.rst_l	(rst_l),
	.w_ld	(eq_head_w_ld_27),
	.csrbus_wr_data	(csrbus_wr_data),
	.eq_head_csrbus_read_data	(eq_head_csrbus_read_data_27)
	);

//----- Entry 28
dmu_imu_eqs_csr_eq_head_entry eq_head_28
	(
	// synopsys translate_off
	  .omni_ld	(omni_ld_28),
	  .omni_data	(omni_data_28),
	// synopsys translate_on
	.clk	(clk),
	.rst_l	(rst_l),
	.w_ld	(eq_head_w_ld_28),
	.csrbus_wr_data	(csrbus_wr_data),
	.eq_head_csrbus_read_data	(eq_head_csrbus_read_data_28)
	);

//----- Entry 29
dmu_imu_eqs_csr_eq_head_entry eq_head_29
	(
	// synopsys translate_off
	  .omni_ld	(omni_ld_29),
	  .omni_data	(omni_data_29),
	// synopsys translate_on
	.clk	(clk),
	.rst_l	(rst_l),
	.w_ld	(eq_head_w_ld_29),
	.csrbus_wr_data	(csrbus_wr_data),
	.eq_head_csrbus_read_data	(eq_head_csrbus_read_data_29)
	);

//----- Entry 30
dmu_imu_eqs_csr_eq_head_entry eq_head_30
	(
	// synopsys translate_off
	  .omni_ld	(omni_ld_30),
	  .omni_data	(omni_data_30),
	// synopsys translate_on
	.clk	(clk),
	.rst_l	(rst_l),
	.w_ld	(eq_head_w_ld_30),
	.csrbus_wr_data	(csrbus_wr_data),
	.eq_head_csrbus_read_data	(eq_head_csrbus_read_data_30)
	);

//----- Entry 31
dmu_imu_eqs_csr_eq_head_entry eq_head_31
	(
	// synopsys translate_off
	  .omni_ld	(omni_ld_31),
	  .omni_data	(omni_data_31),
	// synopsys translate_on
	.clk	(clk),
	.rst_l	(rst_l),
	.w_ld	(eq_head_w_ld_31),
	.csrbus_wr_data	(csrbus_wr_data),
	.eq_head_csrbus_read_data	(eq_head_csrbus_read_data_31)
	);

//----- Entry 32
dmu_imu_eqs_csr_eq_head_entry eq_head_32
	(
	// synopsys translate_off
	  .omni_ld	(omni_ld_32),
	  .omni_data	(omni_data_32),
	// synopsys translate_on
	.clk	(clk),
	.rst_l	(rst_l),
	.w_ld	(eq_head_w_ld_32),
	.csrbus_wr_data	(csrbus_wr_data),
	.eq_head_csrbus_read_data	(eq_head_csrbus_read_data_32)
	);

//----- Entry 33
dmu_imu_eqs_csr_eq_head_entry eq_head_33
	(
	// synopsys translate_off
	  .omni_ld	(omni_ld_33),
	  .omni_data	(omni_data_33),
	// synopsys translate_on
	.clk	(clk),
	.rst_l	(rst_l),
	.w_ld	(eq_head_w_ld_33),
	.csrbus_wr_data	(csrbus_wr_data),
	.eq_head_csrbus_read_data	(eq_head_csrbus_read_data_33)
	);

//----- Entry 34
dmu_imu_eqs_csr_eq_head_entry eq_head_34
	(
	// synopsys translate_off
	  .omni_ld	(omni_ld_34),
	  .omni_data	(omni_data_34),
	// synopsys translate_on
	.clk	(clk),
	.rst_l	(rst_l),
	.w_ld	(eq_head_w_ld_34),
	.csrbus_wr_data	(csrbus_wr_data),
	.eq_head_csrbus_read_data	(eq_head_csrbus_read_data_34)
	);

//----- Entry 35
dmu_imu_eqs_csr_eq_head_entry eq_head_35
	(
	// synopsys translate_off
	  .omni_ld	(omni_ld_35),
	  .omni_data	(omni_data_35),
	// synopsys translate_on
	.clk	(clk),
	.rst_l	(rst_l),
	.w_ld	(eq_head_w_ld_35),
	.csrbus_wr_data	(csrbus_wr_data),
	.eq_head_csrbus_read_data	(eq_head_csrbus_read_data_35)
	);

endmodule // dmu_imu_eqs_csr_eq_head
