// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: fflp_cam_srch_sm.v
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
/*module name:   fflp_cam_srch_sm                                     */
/*description:                                                        */
/*               Controls CAM accesses for both CPU commands and      */
/*               forward search                                       */
/*                                                                    */
/*parent module in:  fflp_cam_srch                                    */
/*child modules in:  none                                             */
/*interface modules:                                                  */
/*author name:       Jeanne Cai                                       */
/*date created:      03-10-04                                         */
/*                                                                    */
/*              Copyright (c) 2004, Sun Microsystems, Inc.            */
/*                   Sun Proprietary and Confidential                 */
/*                                                                    */
/*modifications:                                                      */
/*                                                                    */
/*                                                                    */
`include "fflp.h"
module fflp_cam_srch_sm     
		(
		cclk,
		reset,
		cam_srch_latency,
		do_srch_cycle,
		do_cpu_cycle,
		cpu_cmd,

		cam_compare_sm,
		cam_pio_wr_sm,
		cam_pio_sel_sm,
		data_inp_sel,
		data_inp_en,
		srch_wait_done,
		cpu_cmd_done_sm,
		kick_off_ram_srch_sm
		);

input		cclk;
input		reset;
input[3:0]	cam_srch_latency;
input		do_srch_cycle;
input		do_cpu_cycle;
input[2:0]	cpu_cmd;		

output		cam_compare_sm;
output		cam_pio_wr_sm;
output		cam_pio_sel_sm;
output[1:0]	data_inp_sel;
output		data_inp_en;
output		srch_wait_done;
output		cpu_cmd_done_sm;
output		kick_off_ram_srch_sm;

reg		cam_compare_sm;
reg		cam_pio_wr_sm;
reg		cam_pio_sel_sm;
reg[1:0]	data_inp_sel;
reg		data_inp_en;
reg		cpu_cmd_done_sm;
reg		kick_off_ram_srch_sm;
reg		inc_wait_cnt;
reg[2:0]	next_state;

wire[3:0]	srch_wait_cnt_in;
wire[3:0]	srch_wait_cnt;
wire[2:0]	state;	
wire		srch_wait_done;

assign srch_wait_done = (srch_wait_cnt == cam_srch_latency);

//state machine states
parameter
	READY			= 3'b000,
	SRCH_CYC_2		= 3'b001,
	SRCH_CYC_3		= 3'b010,
	CMD_WR_CYC_2		= 3'b011,
	CMD_WR_CYC_3		= 3'b100,
	CMD_WR_CYC_4		= 3'b101,
	CMD_COMP_CYC_2		= 3'b110,
	CMD_COMP_CYC_3		= 3'b111;

always @ (
	state or 
	cpu_cmd or 
	do_srch_cycle or 
	do_cpu_cycle or
	srch_wait_done
	)
            
begin

	cam_compare_sm		= 1'b0;
	cam_pio_wr_sm		= 1'b0;
	cam_pio_sel_sm		= 1'b0;
	data_inp_sel		= 2'b0;
	data_inp_en		= 1'b0;
	cpu_cmd_done_sm		= 1'b0;
	inc_wait_cnt		= 1'b0;
	kick_off_ram_srch_sm	= 1'b0;
	next_state		= READY;

case (state)    //synopsys parallel_case full_case
// 0in < case -full -parallel -message "0in ERROR: case check in fflp_cam_srch_sm:state"

READY:
begin
	if (do_srch_cycle)
        begin
			cam_compare_sm	= 1'b1;
			cam_pio_wr_sm	= 1'b0;
			cam_pio_sel_sm	= 1'b0;
			data_inp_sel	= 2'b00;
			data_inp_en	= 1'b1;
			cpu_cmd_done_sm = 1'b0;
			inc_wait_cnt	= 1'b1;	
			next_state	= SRCH_CYC_2;
	end
	else if (do_cpu_cycle)
	begin
		case (cpu_cmd)  //synopsys parallel_case full_case
		
		`NOP_CMD1, `NOP_CMD2, `NOP_CMD3:
			begin
			cam_compare_sm  = 1'b0;
			cam_pio_wr_sm   = 1'b0;
			cam_pio_sel_sm  = 1'b0;
			data_inp_sel    = 2'b00;
			data_inp_en	= 1'b0;
			cpu_cmd_done_sm = 1'b1;
			inc_wait_cnt	= 1'b0;
			next_state      = READY;
			end
	
		`WR_CAM_KEY:
			begin
			cam_compare_sm  = 1'b0;
			cam_pio_wr_sm   = 1'b1;
			cam_pio_sel_sm  = 1'b0;
			data_inp_sel	= 2'b10;
			data_inp_en	= 1'b1;
			cpu_cmd_done_sm = 1'b0;
			inc_wait_cnt	= 1'b0;
			next_state	= CMD_WR_CYC_2;
			end

		`COMP_SINGLE_KEY:
			begin
			cam_compare_sm  = 1'b1;
			cam_pio_wr_sm   = 1'b0;
			cam_pio_sel_sm  = 1'b0;
			data_inp_sel    = 2'b10;
			data_inp_en	= 1'b1;
			cpu_cmd_done_sm = 1'b0;
			inc_wait_cnt	= 1'b1;
			next_state	= CMD_COMP_CYC_2;
			end

		default:
			next_state	= state;

		endcase //cpu_cmd
	end
	else
			next_state      = state;
end //end READY

SRCH_CYC_2:
begin
			cam_compare_sm  = 1'b1;
                        cam_pio_wr_sm   = 1'b0;
                        cam_pio_sel_sm  = 1'b0;
                        data_inp_sel    = 2'b00;
			data_inp_en	= 1'b0;
                        cpu_cmd_done_sm = 1'b0;
			inc_wait_cnt	= 1'b1;
                        next_state      = SRCH_CYC_3;
end

SRCH_CYC_3:
begin
			cam_compare_sm  = 1'b0;
                        cam_pio_wr_sm   = 1'b0;
                        cam_pio_sel_sm  = 1'b0;
                        data_inp_sel    = 2'b00;
			data_inp_en	= 1'b0;
                        cpu_cmd_done_sm = 1'b0;
			if (srch_wait_done)
			begin
				inc_wait_cnt	     = 1'b0;
				kick_off_ram_srch_sm = 1'b1;
				next_state	     = READY;
			end
			else
			begin
				inc_wait_cnt	     = 1'b1;
				kick_off_ram_srch_sm = 1'b0;
				next_state	     = state;
			end
end

CMD_WR_CYC_2:
begin
			cam_compare_sm  = 1'b0;
                        cam_pio_wr_sm   = 1'b1;
                        cam_pio_sel_sm  = 1'b0;
                        data_inp_sel    = 2'b10;
			data_inp_en	= 1'b0;
                        cpu_cmd_done_sm = 1'b0;
                        inc_wait_cnt    = 1'b0;
                        next_state      = CMD_WR_CYC_3;
end

CMD_WR_CYC_3:
begin
                        cam_compare_sm  = 1'b0;
                        cam_pio_wr_sm   = 1'b1;
                        cam_pio_sel_sm  = 1'b1;
                        data_inp_sel    = 2'b11;
                        data_inp_en     = 1'b1;
                        cpu_cmd_done_sm = 1'b0;
                        inc_wait_cnt    = 1'b0;
                        next_state      = CMD_WR_CYC_4;
end

CMD_WR_CYC_4:
begin
                        cam_compare_sm  = 1'b0;
                        cam_pio_wr_sm   = 1'b1;
                        cam_pio_sel_sm  = 1'b1;
                        data_inp_sel    = 2'b11;
                        data_inp_en     = 1'b0;
                        cpu_cmd_done_sm = 1'b1;
                        inc_wait_cnt    = 1'b0;
                        next_state      = READY;
end

CMD_COMP_CYC_2:
begin
                        cam_compare_sm  = 1'b1;
                        cam_pio_wr_sm   = 1'b0;
                        cam_pio_sel_sm  = 1'b0;
                        data_inp_sel    = 2'b10;
			data_inp_en	= 1'b0;
                        cpu_cmd_done_sm = 1'b0;
                        inc_wait_cnt    = 1'b1;
                        next_state      = CMD_COMP_CYC_3;
end

CMD_COMP_CYC_3:
begin
                        cam_compare_sm  = 1'b0;
                        cam_pio_wr_sm   = 1'b0;
                        cam_pio_sel_sm  = 1'b0;
                        data_inp_sel    = 2'b00;
			data_inp_en	= 1'b0;
                        if (srch_wait_done)
			begin
				inc_wait_cnt	= 1'b0;
				cpu_cmd_done_sm	= 1'b1;
                                next_state      = READY;
			end
                        else
			begin
				inc_wait_cnt    = 1'b1;
				cpu_cmd_done_sm = 1'b0;
                                next_state      = state;
			end
end

default:
                	next_state      =  READY;

endcase
end


dffr #(3) state_reg 		(cclk, reset, next_state,       state);
dffr #(4) srch_wait_cnt_reg 	(cclk, reset, srch_wait_cnt_in, srch_wait_cnt);

assign srch_wait_cnt_in	= {4{inc_wait_cnt}} & (srch_wait_cnt + 4'd1);


endmodule


