// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: fflp_hash_func.v
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
/**********************************************************************/
/*project name:  N2                                                   */
/*module name:   fflp_hash_func                                       */
/*description:   Pipeline for hash algorithm CRC-32C and CRC-CCITT    */
/*               CRC-32C:					      */
/*               x^32+x^28+x^27+x^26+x^25+x^23+x^22+x^20+x^19+x^18+   */
/*		 x^14+x^13+x^11+x^10+x^9+x^8+x^6+1		      */
/*								      */
/*               CRC-CCITT:                                           */
/*               x^16+x^12+x^5+1				      */
/*                                                                    */
/*parent module in:                                                   */
/*child modules in:  fflp_CRC32_D64, fflp_CRC16_D64                   */
/*interface modules:                                                  */
/*author name:       Jeanne Cai                                       */
/*date created:      25-05-04                                         */
/*                                                                    */
/*              Copyright (c) 2004, Sun Microsystems, Inc.            */
/*                   Sun Proprietary and Confidential                 */
/*                                                                    */
/*modifications:                                                      */
/*                                                                    */
/**********************************************************************/

module fflp_hash_func
		(
		cclk,
		reset,
		fwd_info_hash_key,
		fwd_sched,
		kick_off_ram_srch_4,
		h1_init_value_reg_dout,
		h2_init_value_reg_dout,

		hash_v1,
		hash_v2

		);

input		cclk;
input		reset;
input[361:0]	fwd_info_hash_key;
input		fwd_sched;
input		kick_off_ram_srch_4;
input[31:0]	h1_init_value_reg_dout;
input[15:0]	h2_init_value_reg_dout;

output[19:0]	hash_v1;
output[15:0]	hash_v2;

wire		crc_cyc0;
wire		crc_cyc1;
wire		crc_cyc2;
wire		crc_cyc3;
wire		crc_cyc4;
wire		crc_cyc5;

wire[383:0]	hash_key;
wire[63:0]	hash_data0;
wire[63:0]	hash_data1;
wire[63:0]	hash_data2;
wire[63:0]	hash_data3;
wire[63:0]	hash_data4;
wire[63:0]	hash_data5;
wire[63:0]	hash_data5_r;

wire[31:0]	new1_crc0;
wire[31:0]	new1_crc1;
wire[31:0]	new1_crc2;
wire[31:0]	new1_crc3;
wire[31:0]	new1_crc4;
wire[31:0]	new1_crc5;

wire[31:0]	new1_crc0_r;
wire[31:0]	new1_crc1_r;
wire[31:0]	new1_crc2_r;
wire[31:0]	new1_crc3_r;
wire[31:0]	new1_crc4_r;
wire[31:0]	new1_crc5_r;
wire[19:0]	hash_v1;

wire[15:0]      new2_crc0;
wire[15:0]      new2_crc1;
wire[15:0]      new2_crc2;
wire[15:0]      new2_crc3;
wire[15:0]      new2_crc4;
wire[15:0]      new2_crc5;

wire[15:0]      new2_crc0_r;
wire[15:0]      new2_crc1_r;
wire[15:0]      new2_crc2_r;
wire[15:0]      new2_crc3_r;
wire[15:0]      new2_crc4_r;
wire[15:0]      new2_crc5_r;
wire[15:0]      hash_v2;

wire[31:0]	init_crc1;
wire[15:0]	init_crc2;

assign init_crc1	= h1_init_value_reg_dout;
assign init_crc2	= h2_init_value_reg_dout;

assign hash_key		= {fwd_info_hash_key, 22'b0};
assign hash_data0	= hash_key[63:0];
assign hash_data1	= hash_key[127:64];
assign hash_data2	= hash_key[191:128];
assign hash_data3	= hash_key[255:192];
assign hash_data4	= hash_key[319:256];
assign hash_data5	= hash_key[383:320];

fflp_CRC32_D64	hash1_stage0 (.Data (hash_data0),   .CRC (init_crc1),   .NewCRC (new1_crc0));
fflp_CRC32_D64	hash1_stage1 (.Data (hash_data1),   .CRC (new1_crc0_r), .NewCRC (new1_crc1));
fflp_CRC32_D64	hash1_stage2 (.Data (hash_data2),   .CRC (new1_crc1_r), .NewCRC (new1_crc2));
fflp_CRC32_D64	hash1_stage3 (.Data (hash_data3),   .CRC (new1_crc2_r), .NewCRC (new1_crc3));
fflp_CRC32_D64	hash1_stage4 (.Data (hash_data4),   .CRC (new1_crc3_r), .NewCRC (new1_crc4));
fflp_CRC32_D64	hash1_stage5 (.Data (hash_data5_r), .CRC (new1_crc4_r), .NewCRC (new1_crc5));

fflp_CRC16_D64  hash2_stage0 (.Data (hash_data0),   .CRC (init_crc2),   .NewCRC (new2_crc0));
fflp_CRC16_D64  hash2_stage1 (.Data (hash_data1),   .CRC (new2_crc0_r), .NewCRC (new2_crc1));
fflp_CRC16_D64  hash2_stage2 (.Data (hash_data2),   .CRC (new2_crc1_r), .NewCRC (new2_crc2));
fflp_CRC16_D64  hash2_stage3 (.Data (hash_data3),   .CRC (new2_crc2_r), .NewCRC (new2_crc3));
fflp_CRC16_D64  hash2_stage4 (.Data (hash_data4),   .CRC (new2_crc3_r), .NewCRC (new2_crc4));
fflp_CRC16_D64  hash2_stage5 (.Data (hash_data5_r), .CRC (new2_crc4_r), .NewCRC (new2_crc5));


dffre #(64) hash_data5_reg	(cclk, reset, crc_cyc4, hash_data5, hash_data5_r);

dffr #(1) crc_cyc0_reg		(cclk, reset, fwd_sched, crc_cyc0);
dffr #(1) crc_cyc1_reg          (cclk, reset, crc_cyc0,  crc_cyc1);
dffr #(1) crc_cyc2_reg          (cclk, reset, crc_cyc1,  crc_cyc2);
dffr #(1) crc_cyc3_reg          (cclk, reset, crc_cyc2,  crc_cyc3);
dffr #(1) crc_cyc4_reg          (cclk, reset, crc_cyc3,  crc_cyc4);
dffr #(1) crc_cyc5_reg          (cclk, reset, crc_cyc4,  crc_cyc5);

dffre #(32) new1_crc0_reg	(cclk, reset, crc_cyc0, new1_crc0, new1_crc0_r);
dffre #(32) new1_crc1_reg       (cclk, reset, crc_cyc1, new1_crc1, new1_crc1_r);
dffre #(32) new1_crc2_reg       (cclk, reset, crc_cyc2, new1_crc2, new1_crc2_r);
dffre #(32) new1_crc3_reg       (cclk, reset, crc_cyc3, new1_crc3, new1_crc3_r);
dffre #(32) new1_crc4_reg       (cclk, reset, crc_cyc4, new1_crc4, new1_crc4_r);
dffre #(32) new1_crc5_reg       (cclk, reset, crc_cyc5, new1_crc5, new1_crc5_r);

dffre #(16) new2_crc0_reg       (cclk, reset, crc_cyc0, new2_crc0, new2_crc0_r);
dffre #(16) new2_crc1_reg       (cclk, reset, crc_cyc1, new2_crc1, new2_crc1_r);
dffre #(16) new2_crc2_reg       (cclk, reset, crc_cyc2, new2_crc2, new2_crc2_r);
dffre #(16) new2_crc3_reg       (cclk, reset, crc_cyc3, new2_crc3, new2_crc3_r);
dffre #(16) new2_crc4_reg       (cclk, reset, crc_cyc4, new2_crc4, new2_crc4_r);
dffre #(16) new2_crc5_reg       (cclk, reset, crc_cyc5, new2_crc5, new2_crc5_r);

dffre #(20) hash_v1_reg		(cclk, reset, kick_off_ram_srch_4, new1_crc5_r[19:0], hash_v1);
dffre #(16) hash_v2_reg		(cclk, reset, kick_off_ram_srch_4, new2_crc5_r, hash_v2);



endmodule
