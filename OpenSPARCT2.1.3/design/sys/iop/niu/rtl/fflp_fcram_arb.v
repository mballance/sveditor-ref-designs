// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: fflp_fcram_arb.v
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
/*module name:   fflp_fcram_arb                                       */
/*description:   Aabitration between CPU access and flow              */
/*               classification                                       */
/*                                                                    */
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


module fflp_fcram_arb
		(
		cclk,
		reset,
		fcram_lookup_ratio,
		fc_lookup_req,
		fwd_no_fc_sched_sm,
		cpu_fcram_req_sync,
		srch_burst_done,
		cpu_burst_done_sm,

		fwd_sched,
		do_srch_cycle,
		do_cpu_cycle,
		fc_fifo_ren
		);

input		cclk;
input		reset;
input[3:0]	fcram_lookup_ratio;
input		fc_lookup_req;
input		fwd_no_fc_sched_sm;
input		cpu_fcram_req_sync;
input		srch_burst_done;
input		cpu_burst_done_sm;

output		fwd_sched;
output		do_srch_cycle;
output		do_cpu_cycle;
output		fc_fifo_ren;

reg		fwd_fc_sched_sm;
reg		cpu_sched_sm;
reg[1:0]	next_state;

wire		fwd_sched_in;
wire		fwd_sched;
wire		fwd_fc_sched;
wire		cpu_sched;
wire		fwd_sched_cnt_en;
wire[3:0]	fwd_sched_cnt_in;
wire[3:0]	fwd_sched_cnt;
wire		fwd_reqs_served;
wire[1:0]	state;

wire		cpu_fcram_req_sync_d;
wire		cpu_req_pulse;
wire		is_cpu_req_en;
wire		is_cpu_req_in;
wire		is_cpu_req;

wire		do_srch_cycle_en;
wire		do_srch_cycle_in;
wire		do_srch_cycle;
wire		do_cpu_cycle_en;
wire		do_cpu_cycle_in;
wire		do_cpu_cycle;

wire		fwd_sched_1;
wire		fwd_sched_2;
wire		fc_fifo_ren_in;
wire		fc_fifo_ren;

//state machine states
parameter
	FWD_ARB		= 2'b00,
	FWD_IDLE	= 2'b01,
	CPU_ARB		= 2'b10,
	CPU_IDLE	= 2'b11;

always @ (state or fc_lookup_req or is_cpu_req or 
	  srch_burst_done or cpu_burst_done_sm or 
	  do_cpu_cycle or fwd_reqs_served)

begin

fwd_fc_sched_sm	= 1'b0;
cpu_sched_sm	= 1'b0;
next_state	= 2'b0;

case (state) //synopsys parallel_case full_case
// 0in < case -full -parallel -message "0in ERROR: case check in fflp_fcram_arb:state"

FWD_ARB:
begin
	if (do_cpu_cycle & !cpu_burst_done_sm)
	begin
		fwd_fc_sched_sm	= 1'b0;
		cpu_sched_sm	= 1'b0;
		next_state	= state;
	end
	else if (fc_lookup_req)
	begin
		fwd_fc_sched_sm	= 1'b1;
		next_state	= FWD_IDLE;
	end
	else if (is_cpu_req)
	begin
		cpu_sched_sm	= 1'b1;
		next_state	= CPU_IDLE;
	end
	else
		next_state	= state;

end

FWD_IDLE:
begin
	if (srch_burst_done & fwd_reqs_served)
		next_state	= CPU_ARB;
	else if (srch_burst_done)
		next_state	= FWD_ARB;
	else
		next_state	= state;
end

CPU_ARB:
begin
	if (is_cpu_req)
	begin
                cpu_sched_sm    = 1'b1;
                next_state      = CPU_IDLE;
        end
	else if (fc_lookup_req)
        begin
                fwd_fc_sched_sm = 1'b1;
                next_state      = FWD_IDLE;
        end
	else
		next_state	= FWD_ARB;
end

CPU_IDLE:
begin
		next_state	= FWD_ARB;
end

default:	next_state	= FWD_ARB;

endcase

end

assign fwd_sched_in	= fwd_fc_sched_sm | fwd_no_fc_sched_sm;

dffr #(2) state_reg	   (cclk, reset, next_state,      state);
dffr #(1) fwd_sched_reg	   (cclk, reset, fwd_sched_in,    fwd_sched);
dffr #(1) fwd_fc_sched_reg (cclk, reset, fwd_fc_sched_sm, fwd_fc_sched);
dffr #(1) cpu_sched_reg    (cclk, reset, cpu_sched_sm,    cpu_sched);

dffr #(1) fwd_sched_1_reg  (cclk, reset, fwd_sched,	  fwd_sched_1);
dffr #(1) fwd_sched_2_reg  (cclk, reset, fwd_sched_1,     fwd_sched_2);
dffr #(1) fc_fifo_ren_reg  (cclk, reset, fc_fifo_ren_in,  fc_fifo_ren);

assign fc_fifo_ren_in	= fwd_sched | fwd_sched_1 | fwd_sched_2;


/*********************************************************************/
//allocate load balance, cpu bandwidth
/*********************************************************************/
assign fwd_reqs_served = (fwd_sched_cnt == fcram_lookup_ratio);
assign fwd_sched_cnt_en	= fwd_fc_sched_sm | cpu_sched_sm;
assign fwd_sched_cnt_in	= (cpu_sched_sm | fwd_reqs_served & fwd_fc_sched_sm) ? 4'b0000 : (fwd_sched_cnt + 4'd1);

dffre #(4) fwd_sched_cnt_reg (cclk, reset, fwd_sched_cnt_en, fwd_sched_cnt_in, fwd_sched_cnt);


/**********************/
//CPU Request
/**********************/
assign cpu_req_pulse	= cpu_fcram_req_sync & !cpu_fcram_req_sync_d;
assign is_cpu_req_en	= cpu_req_pulse | cpu_sched;
assign is_cpu_req_in	= cpu_req_pulse ? 1'b1 : 1'b0;

dffr  #(1) cpu_req_dly_reg (cclk, reset,                cpu_fcram_req_sync, cpu_fcram_req_sync_d);
dffre #(1) is_cpu_req_reg  (cclk, reset, is_cpu_req_en, is_cpu_req_in, 	    is_cpu_req);

assign do_srch_cycle_en = fwd_fc_sched | srch_burst_done;
assign do_srch_cycle_in = fwd_fc_sched ? 1'b1 : 1'b0; 
assign do_cpu_cycle_en  = cpu_sched | cpu_burst_done_sm;
assign do_cpu_cycle_in  = cpu_sched ? 1'b1 : 1'b0;

dffre #(1) do_srch_cycle_reg (cclk, reset, do_srch_cycle_en, do_srch_cycle_in, do_srch_cycle);
dffre #(1) do_cpu_cycle_reg  (cclk, reset, do_cpu_cycle_en,  do_cpu_cycle_in,  do_cpu_cycle);



endmodule
