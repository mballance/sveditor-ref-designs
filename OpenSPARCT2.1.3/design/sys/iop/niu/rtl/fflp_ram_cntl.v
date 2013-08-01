// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: fflp_ram_cntl.v
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
/*project name:  NIU                                                  */
/*module name:   fflp_ram_cntl                                        */
/*description:                                                        */
/*               Controls SRAM accesses for both CPU commands and     */
/*               packet classification                                */
/*                                                                    */
/*child modules in:  none                                             */
/*author name:       Jeanne Cai                                       */
/*date created:      03-16-04                                         */
/*                                                                    */
/*              Copyright (c) 2004, Sun Microsystems, Inc.            */
/*                   Sun Proprietary and Confidential                 */
/*                                                                    */
/*modifications:                                                      */
/*                                                                    */
/**********************************************************************/
`include "fflp.h"
module fflp_ram_cntl
		(cclk,
		reset,
		ram_acc_type,
		kick_off_ram_ctrl,
		cam_index,
		cam_haddr_reg1_dout,
		cam_key_reg1_dout,
		am_din,
		
		am_rd,
		am_wr,
		am_addr,
		am_dout,
		am_din_reg_dout
		);

input		cclk;
input		reset;
input[1:0]	ram_acc_type;
input		kick_off_ram_ctrl;
input[9:0]	cam_index;
input[9:0]	cam_haddr_reg1_dout;
input[41:0]	cam_key_reg1_dout;
input[41:0]	am_din;

output		am_rd;
output		am_wr;
output[9:0]	am_addr;
output[41:0]	am_dout;
output[41:0]	am_din_reg_dout;

reg		am_din_reg_en_sm;
reg		am_addr_sel_sm;
reg		am_rd_sm;
reg		am_wr_sm;
reg		am_dout_reg_sel_sm;
reg[1:0]	next_state;

wire		am_din_reg_en;
wire		am_din_reg_en_1;
//wire		am_din_reg_en_2;
wire		am_rd;
wire		am_wr;
wire[9:0]	am_addr;
wire[41:0]	am_dout;
wire[41:0]	am_din_reg_dout;

wire[1:0]	state;

wire[9:0]	am_addr_in;
wire[41:0]	am_dout_in;


//state machine states
parameter
	IDLE		= 2'b00,
	RAM_RMW_CYC_2	= 2'b01,
	RAM_RMW_CYC_3	= 2'b10,
	RAM_RMW_CYC_4	= 2'b11;

always @ (state or kick_off_ram_ctrl or ram_acc_type)
begin

am_din_reg_en_sm	= 1'b0;
am_addr_sel_sm		= 1'b0;	
am_rd_sm		= 1'b0;
am_wr_sm		= 1'b0;
am_dout_reg_sel_sm	= 1'b0;
next_state		= 2'b00;

case (state)	//synopsys parallel_case full_case
// 0in < case -full -parallel -message "0in ERROR: case check in fflp_ram_cntl:state"

IDLE:
begin
	if (kick_off_ram_ctrl)
	begin
		case (ram_acc_type)	//synopsys parallel_case full_case
		`RAM_R:	//RD_ASSOC_D
			begin
			am_din_reg_en_sm	= 1'b1;
			am_addr_sel_sm		= 1'b1;
			am_rd_sm		= 1'b1;
			am_wr_sm		= 1'b0;
			am_dout_reg_sel_sm	= 1'b0;
			next_state		= IDLE;
			end

		`RAM_W: //WR_ASSOC_D
			begin
			am_din_reg_en_sm	= 1'b0;
			am_addr_sel_sm		= 1'b1;
                        am_rd_sm                = 1'b0;
                        am_wr_sm                = 1'b1;
                        am_dout_reg_sel_sm      = 1'b1;
                        next_state              = IDLE;
                        end

		`RAM_RMW: 
                        begin
                        am_din_reg_en_sm        = 1'b1;
                        am_addr_sel_sm          = 1'b0;
                        am_rd_sm                = 1'b1;
                        am_wr_sm                = 1'b0;
                        am_dout_reg_sel_sm      = 1'b0;
                        next_state              = RAM_RMW_CYC_2;
                        end

		default:
			begin
                        am_din_reg_en_sm        = 1'b0;
                        am_addr_sel_sm          = 1'b0;
                        am_rd_sm                = 1'b0;
                        am_wr_sm                = 1'b0;
                        am_dout_reg_sel_sm      = 1'b0;
                        next_state              = IDLE;
                        end

		endcase
	end
	else
			next_state		= state;
end //IDLE

RAM_RMW_CYC_2:
begin
			am_din_reg_en_sm        = 1'b0;
                        am_addr_sel_sm          = 1'b0;
                        am_rd_sm                = 1'b0;
                        am_wr_sm                = 1'b0;
                        am_dout_reg_sel_sm      = 1'b0;
			next_state		= RAM_RMW_CYC_3;
end

RAM_RMW_CYC_3:
begin
			am_din_reg_en_sm        = 1'b0;
                        am_addr_sel_sm          = 1'b0;
                        am_rd_sm                = 1'b0;
                        am_wr_sm                = 1'b0;
                        am_dout_reg_sel_sm      = 1'b0;
                        next_state              = RAM_RMW_CYC_4;
end

RAM_RMW_CYC_4:
begin
                        am_din_reg_en_sm        = 1'b0;
                        am_addr_sel_sm          = 1'b0;
                        am_rd_sm                = 1'b0;
                        am_wr_sm                = 1'b1;
                        am_dout_reg_sel_sm      = 1'b0;
                        next_state              = IDLE;
end


default:		next_state		= IDLE;

endcase

end


assign am_addr_in 	= am_addr_sel_sm ? cam_index : cam_haddr_reg1_dout;
assign am_dout_in	= am_dout_reg_sel_sm ? cam_key_reg1_dout[41:0] : {am_din_reg_dout[41:1], 1'b0};   

dffr #(2) state_reg		(cclk, reset, next_state,	state);
dffr #(1) am_din_reg_en_reg	(cclk, reset, am_din_reg_en_sm, am_din_reg_en);
dffr #(1) am_din_reg_en_1_reg	(cclk, reset, am_din_reg_en,	am_din_reg_en_1);
//dffr #(1) am_din_reg_en_2_reg	(cclk, reset, am_din_reg_en_1,	am_din_reg_en_2);
dffr #(1) am_rd_reg		(cclk, reset, am_rd_sm,		am_rd);
dffr #(1) am_wr_reg		(cclk, reset, am_wr_sm,		am_wr);
dffr #(10) am_addr_reg		(cclk, reset, am_addr_in,	am_addr);
dffr #(42) am_dout_reg		(cclk, reset, am_dout_in,	am_dout);

dffre #(42) am_din_reg		(cclk, reset, am_din_reg_en_1, am_din, am_din_reg_dout);


//use am_din_reg_en_2 to log the parity error, am_addr is the address

endmodule
