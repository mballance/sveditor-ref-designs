// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: fflp_cam_sched.v
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
/*module name:   fflp_cam_sched                                       */
/*description:   Aabitration between CPU access and packet            */
/*               classification                                       */
/*                                                                    */
/*parent module in:  none                                             */
/*child modules in:  none                                             */
/*interface modules:                                                  */
/*author name:       Jeanne Cai                                       */
/*date created:      16-03-2004                                       */
/*                                                                    */
/*              Copyright (c) 2004, Sun Microsystems, Inc.            */
/*                   Sun Proprietary and Confidential                 */
/*                                                                    */
/*modifications:                                                      */
/**********************************************************************/


module fflp_cam_sched
		(
		cclk,
		reset,
		cam_srch_latency,
		cam_srch_ratio,
		fwd_req,
		cpu_req_cam_acc,
		fc_fifo_space_avail,

		fwd_sched,
		cpu_sched
		);

input		cclk;
input		reset;
input[3:0]	cam_srch_latency;
input[3:0]	cam_srch_ratio;
input		fwd_req;
input		cpu_req_cam_acc;
input		fc_fifo_space_avail;

output		fwd_sched;
output		cpu_sched;

reg		fwd_sched_sm;
reg		cpu_sched_sm;
reg		inc_fwd_wait_cnt;
reg		reset_fwd_cnt;
reg[1:0]	next_state;

wire		fwd_sched;
wire		cpu_sched;
wire[3:0]	fwd_wait_cnt_in;
wire[3:0]	fwd_wait_cnt;
wire		fwd_sched_cnt_en;
wire[3:0]	fwd_sched_cnt_in;
wire[3:0]	fwd_sched_cnt;
wire[1:0]	state;

wire		fwd_wait_done;
wire		fwd_reqs_served;

//state machine states
parameter
	FWD_ARB		= 2'b00,
	FWD_IDLE	= 2'b01,
	CPU_ARB		= 2'b10,
	CPU_IDLE	= 2'b11;

always @ (state or fwd_req or cpu_req_cam_acc or fc_fifo_space_avail or
	  fwd_wait_done or fwd_reqs_served)

begin

fwd_sched_sm	= 1'b0;
cpu_sched_sm	= 1'b0;
inc_fwd_wait_cnt= 1'b0;
reset_fwd_cnt	= 1'b0;
next_state	= 2'b0;

case (state) //synopsys parallel_case full_case
// 0in < case -full -parallel -message "0in ERROR: case check in fflp_cam_sched:state"

FWD_ARB:
begin
	if (fwd_req & fc_fifo_space_avail)
	begin
		fwd_sched_sm	= 1'b1;
		inc_fwd_wait_cnt= 1'b1;
		next_state	= FWD_IDLE;
	end
	else if (cpu_req_cam_acc)
	begin
		cpu_sched_sm	= 1'b1;
		inc_fwd_wait_cnt= 1'b1;
		next_state	= CPU_IDLE;
	end
	else
		next_state	= state;

end

FWD_IDLE:
begin
	if (fwd_wait_done & fwd_reqs_served)
	begin
		inc_fwd_wait_cnt= 1'b0;
		reset_fwd_cnt	= 1'b1;
		next_state	= CPU_ARB;
	end
	else if (fwd_wait_done)
	begin
		inc_fwd_wait_cnt= 1'b0;
		next_state	= FWD_ARB;
	end
	else 
	begin
		inc_fwd_wait_cnt= 1'b1;
		next_state	= state;
	end
end

CPU_ARB:
begin
	if (cpu_req_cam_acc)
	begin
                cpu_sched_sm    = 1'b1;
		inc_fwd_wait_cnt= 1'b1;
                next_state      = CPU_IDLE;
        end
	else if (fwd_req & fc_fifo_space_avail)
        begin
                fwd_sched_sm    = 1'b1;
		inc_fwd_wait_cnt= 1'b1;
                next_state      = FWD_IDLE;
        end
	else
		next_state	= FWD_ARB;
end

CPU_IDLE:
begin
		if (fwd_wait_done)	//use same counter is fine here since 
					//cpu_srch and cam pio_wr_cost pretty much the same cycles
		begin
			inc_fwd_wait_cnt= 1'b0;
			next_state	= FWD_ARB;
		end
		else
		begin
			inc_fwd_wait_cnt= 1'b1;
			next_state	= state;
		end
end

default:	next_state	= FWD_ARB;

endcase

end


dffr #(2) state_reg	   (cclk, reset, next_state,      state);
dffr #(1) fwd_sched_reg	   (cclk, reset, fwd_sched_sm,    fwd_sched);
dffr #(1) cpu_sched_reg    (cclk, reset, cpu_sched_sm,    cpu_sched);
dffr #(4) fwd_wait_cnt_reg (cclk, reset, fwd_wait_cnt_in, fwd_wait_cnt);

assign fwd_wait_cnt_in	= {4{inc_fwd_wait_cnt}} & (fwd_wait_cnt[3:0] + 4'd1);
assign fwd_wait_done 	= (fwd_wait_cnt == cam_srch_latency);


/*********************************************************************/
//allocate load balance, cpu bandwidth
/*********************************************************************/
assign fwd_reqs_served = (fwd_sched_cnt == cam_srch_ratio);
assign fwd_sched_cnt_en	= fwd_sched_sm | cpu_sched_sm;
assign fwd_sched_cnt_in	= (cpu_sched_sm | reset_fwd_cnt) ? 4'b0000 : (fwd_sched_cnt + 1);

dffre #(4) fwd_sched_cnt_reg (cclk, reset, fwd_sched_cnt_en, fwd_sched_cnt_in, fwd_sched_cnt);


endmodule
