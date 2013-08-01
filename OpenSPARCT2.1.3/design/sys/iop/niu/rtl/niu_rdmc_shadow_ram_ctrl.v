// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: niu_rdmc_shadow_ram_ctrl.v
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
module niu_rdmc_shadow_ram_ctrl (
			clk,
			reset,
			shadw_wr_en,
			shadw_wr_even,
                        shadw_wr_ptr0,
                        shadw_wr_ptr1,
                        shadw_wr_ptr2,
                        shadw_wr_ptr3,
                        shadw_wr_ptr4,
                        shadw_wr_ptr5,
                        shadw_wr_ptr6,
                        shadw_wr_ptr7,
                        shadw_wr_ptr8,
                        shadw_wr_ptr9,
                        shadw_wr_ptr10,
                        shadw_wr_ptr11,
                        shadw_wr_ptr12,
                        shadw_wr_ptr13,
                        shadw_wr_ptr14,
                        shadw_wr_ptr15,
			shadw_rd_ptr0,
			shadw_rd_ptr1,
                        shadw_rd_ptr2,
                        shadw_rd_ptr3,
                        shadw_rd_ptr4,
                        shadw_rd_ptr5,
                        shadw_rd_ptr6,
                        shadw_rd_ptr7,
                        shadw_rd_ptr8,
                        shadw_rd_ptr9,
                        shadw_rd_ptr10,
                        shadw_rd_ptr11,
                        shadw_rd_ptr12,
                        shadw_rd_ptr13,
                        shadw_rd_ptr14,
                        shadw_rd_ptr15,
			muxed_data_err_r2,
			rdmc_meta0_wr_transfer_comp_int,
			rcr_wrbk_data,
			rcr_wrbk_sched,
			rdmc_rcr_req_accept,
			shadw_rd_strobe,

			data_err_event,
                        shadw_wr_strobe,
                        shadw_wr_addr,
			shadw_wr_data,
                        shadw_rd_addr

                        );



input           clk;
input           reset;
input[15:0]     shadw_wr_en;
input[15:0]	shadw_wr_even;
input[7:0]      shadw_wr_ptr0;
input[7:0]      shadw_wr_ptr1;
input[7:0]      shadw_wr_ptr2;
input[7:0]      shadw_wr_ptr3;
input[7:0]      shadw_wr_ptr4;
input[7:0]      shadw_wr_ptr5;
input[7:0]      shadw_wr_ptr6;
input[7:0]      shadw_wr_ptr7;
input[7:0]      shadw_wr_ptr8;
input[7:0]      shadw_wr_ptr9;
input[7:0]      shadw_wr_ptr10;
input[7:0]      shadw_wr_ptr11;
input[7:0]      shadw_wr_ptr12;
input[7:0]      shadw_wr_ptr13;
input[7:0]      shadw_wr_ptr14;
input[7:0]      shadw_wr_ptr15;
input[7:0]      shadw_rd_ptr0;
input[7:0]      shadw_rd_ptr1;
input[7:0]      shadw_rd_ptr2;
input[7:0]      shadw_rd_ptr3;
input[7:0]      shadw_rd_ptr4;
input[7:0]      shadw_rd_ptr5;
input[7:0]      shadw_rd_ptr6;
input[7:0]      shadw_rd_ptr7;
input[7:0]      shadw_rd_ptr8;
input[7:0]      shadw_rd_ptr9;
input[7:0]      shadw_rd_ptr10;
input[7:0]      shadw_rd_ptr11;
input[7:0]      shadw_rd_ptr12;
input[7:0]      shadw_rd_ptr13;
input[7:0]      shadw_rd_ptr14;
input[7:0]      shadw_rd_ptr15;
input		muxed_data_err_r2;
input		rdmc_meta0_wr_transfer_comp_int;
input[63:0]	rcr_wrbk_data;
input[15:0]	rcr_wrbk_sched;
input		rdmc_rcr_req_accept;
input		shadw_rd_strobe;

output		data_err_event;
output		shadw_wr_strobe;
output[7:0]	shadw_wr_addr;
output[147:0]	shadw_wr_data;
output[7:0]	shadw_rd_addr;

reg		shadw_wr_strobe;
reg[7:0]	shadw_wr_addr;
reg[147:0]	shadw_wr_data;
reg[7:0]	shadw_rd_addr;

reg		shadw_wr_even_r;

reg[15:0]	shadw_wr_en_dly;
reg[71:0]       rcr_wrbk_data_sav_array[0:15];

integer i;

wire[71:0]      rcr_wrbk_data_sav = {72{shadw_wr_en_dly[0]}} & rcr_wrbk_data_sav_array[0] |
                                    {72{shadw_wr_en_dly[1]}} & rcr_wrbk_data_sav_array[1] |
                                    {72{shadw_wr_en_dly[2]}} & rcr_wrbk_data_sav_array[2] |
                                    {72{shadw_wr_en_dly[3]}} & rcr_wrbk_data_sav_array[3] |
                                    {72{shadw_wr_en_dly[4]}} & rcr_wrbk_data_sav_array[4] |
                                    {72{shadw_wr_en_dly[5]}} & rcr_wrbk_data_sav_array[5] |
                                    {72{shadw_wr_en_dly[6]}} & rcr_wrbk_data_sav_array[6] |
                                    {72{shadw_wr_en_dly[7]}} & rcr_wrbk_data_sav_array[7] |
                                    {72{shadw_wr_en_dly[8]}} & rcr_wrbk_data_sav_array[8] |
                                    {72{shadw_wr_en_dly[9]}} & rcr_wrbk_data_sav_array[9] |
                                    {72{shadw_wr_en_dly[10]}} & rcr_wrbk_data_sav_array[10] |
                                    {72{shadw_wr_en_dly[11]}} & rcr_wrbk_data_sav_array[11] |
                                    {72{shadw_wr_en_dly[12]}} & rcr_wrbk_data_sav_array[12] |
                                    {72{shadw_wr_en_dly[13]}} & rcr_wrbk_data_sav_array[13] |
                                    {72{shadw_wr_en_dly[14]}} & rcr_wrbk_data_sav_array[14] |
                                    {72{shadw_wr_en_dly[15]}} & rcr_wrbk_data_sav_array[15];

wire[7:0]       shadw_wr_addr_tmp = {8{shadw_wr_en[0]}} & shadw_wr_ptr0 |
                                    {8{shadw_wr_en[1]}} & shadw_wr_ptr1 |
                                    {8{shadw_wr_en[2]}} & shadw_wr_ptr2 |
                                    {8{shadw_wr_en[3]}} & shadw_wr_ptr3 |
                                    {8{shadw_wr_en[4]}} & shadw_wr_ptr4 |
                                    {8{shadw_wr_en[5]}} & shadw_wr_ptr5 |
                                    {8{shadw_wr_en[6]}} & shadw_wr_ptr6 |
                                    {8{shadw_wr_en[7]}} & shadw_wr_ptr7 |
                                    {8{shadw_wr_en[8]}} & shadw_wr_ptr8 |
                                    {8{shadw_wr_en[9]}} & shadw_wr_ptr9 |
                                    {8{shadw_wr_en[10]}} & shadw_wr_ptr10 |
                                    {8{shadw_wr_en[11]}} & shadw_wr_ptr11 |
                                    {8{shadw_wr_en[12]}} & shadw_wr_ptr12 |
                                    {8{shadw_wr_en[13]}} & shadw_wr_ptr13 |
                                    {8{shadw_wr_en[14]}} & shadw_wr_ptr14 |
                                    {8{shadw_wr_en[15]}} & shadw_wr_ptr15;


wire[7:0]       shadw_rd_addr_tmp = {8{rcr_wrbk_sched[0]}} & shadw_rd_ptr0 |
                                    {8{rcr_wrbk_sched[1]}} & shadw_rd_ptr1 |
                                    {8{rcr_wrbk_sched[2]}} & shadw_rd_ptr2 |
                                    {8{rcr_wrbk_sched[3]}} & shadw_rd_ptr3 |
                                    {8{rcr_wrbk_sched[4]}} & shadw_rd_ptr4 |
                                    {8{rcr_wrbk_sched[5]}} & shadw_rd_ptr5 |
                                    {8{rcr_wrbk_sched[6]}} & shadw_rd_ptr6 |
                                    {8{rcr_wrbk_sched[7]}} & shadw_rd_ptr7 |
                                    {8{rcr_wrbk_sched[8]}} & shadw_rd_ptr8 |
                                    {8{rcr_wrbk_sched[9]}} & shadw_rd_ptr9 |
                                    {8{rcr_wrbk_sched[10]}} & shadw_rd_ptr10 |
                                    {8{rcr_wrbk_sched[11]}} & shadw_rd_ptr11 |
                                    {8{rcr_wrbk_sched[12]}} & shadw_rd_ptr12 |
                                    {8{rcr_wrbk_sched[13]}} & shadw_rd_ptr13 |
                                    {8{rcr_wrbk_sched[14]}} & shadw_rd_ptr14 |
                                    {8{rcr_wrbk_sched[15]}} & shadw_rd_ptr15;

wire[63:0]	new_rcr_wrbk_data	= {rcr_wrbk_data[63:55], muxed_data_err_r2, rcr_wrbk_data[53:0]};
wire[7:0]	new_parity_bits	 	= {^new_rcr_wrbk_data[63:56],
				    	   ^new_rcr_wrbk_data[55:48],
				    	   ^new_rcr_wrbk_data[47:40],
				    	   ^new_rcr_wrbk_data[39:32],
				    	   ^new_rcr_wrbk_data[31:24],
                                    	   ^new_rcr_wrbk_data[23:16],
                                    	   ^new_rcr_wrbk_data[15:8],
                                    	   ^new_rcr_wrbk_data[7:0]};


wire[147:0]	rcr_wrbk_data_tmp1	= {new_parity_bits, rcr_wrbk_data_sav[71:64], 4'b0, new_rcr_wrbk_data, rcr_wrbk_data_sav[63:0]};
wire[147:0]	rcr_wrbk_data_tmp2	= {8'b0, new_parity_bits, 4'b0, 64'b0, new_rcr_wrbk_data[63:0]};
wire[147:0]	shadw_wr_data_in 	= shadw_wr_even_r ? rcr_wrbk_data_tmp1 : rcr_wrbk_data_tmp2; 

wire		shadw_wr_even_tmp	= |(shadw_wr_en & shadw_wr_even);
wire		shadw_wr_en_all	 	= |shadw_wr_en;
wire		shadw_wr_en_dly_all	= |shadw_wr_en_dly;


always @ (posedge clk)
if (reset)
	shadw_wr_strobe	     <= 1'b0;
else
	shadw_wr_strobe	     <= rdmc_meta0_wr_transfer_comp_int & shadw_wr_en_dly_all;

always @ (posedge clk)
if (reset)
	shadw_wr_even_r <= 1'b0;
else if (shadw_wr_en_all)
	shadw_wr_even_r <= shadw_wr_even_tmp;
else
	shadw_wr_even_r <= shadw_wr_even_r;

always @ (posedge clk)
if (reset)
        shadw_wr_addr <= 8'b0;
else if (shadw_wr_en_all)
        shadw_wr_addr <= shadw_wr_addr_tmp;
else
	shadw_wr_addr <= shadw_wr_addr;


always @ (posedge clk)
if (reset)
	shadw_wr_data <= 148'b0;
else if (rdmc_meta0_wr_transfer_comp_int)
	shadw_wr_data <= shadw_wr_data_in;
else
	shadw_wr_data <= shadw_wr_data;


always @ (posedge clk)
if (reset)
        shadw_rd_addr <= 8'b0;
else if (rdmc_rcr_req_accept)
	shadw_rd_addr <= shadw_rd_addr_tmp;
else if (shadw_rd_strobe)
	shadw_rd_addr <= shadw_rd_addr + 8'd1;
else 
        shadw_rd_addr <= shadw_rd_addr;


wire data_err_event = rdmc_meta0_wr_transfer_comp_int & muxed_data_err_r2;

always @ (posedge clk)
if (reset)
	shadw_wr_en_dly <= 16'b0;
else if (shadw_wr_en_all)
	shadw_wr_en_dly <= shadw_wr_en[15:0];
else if (rdmc_meta0_wr_transfer_comp_int)
	shadw_wr_en_dly <= 16'b0;
else
	shadw_wr_en_dly <= shadw_wr_en_dly;

always @ (posedge clk)
if (rdmc_meta0_wr_transfer_comp_int)
begin
	for (i=0; i<=15; i=i+1)
		if (shadw_wr_en_dly[i]) 
			rcr_wrbk_data_sav_array[i] <=  {new_parity_bits, new_rcr_wrbk_data}; 
		else
			rcr_wrbk_data_sav_array[i] <= rcr_wrbk_data_sav_array[i];
end

endmodule








