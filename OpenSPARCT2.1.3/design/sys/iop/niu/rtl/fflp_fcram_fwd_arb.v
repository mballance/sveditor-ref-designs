// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: fflp_fcram_fwd_arb.v
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
/*module name:   fflp_fcram_fwd_arb                                   */
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

module fflp_fcram_fwd_arb 
		(
		cclk,
		reset,
		fc_fifo_empty_sync,
		fc_fifo_fc_lookup,
		srch_burst_done,
		
		fc_lookup_req,	
		fwd_no_fc_sched_sm,
		srch_no_fc_done
		
		);


input		cclk;
input		reset;
input		fc_fifo_empty_sync;
input		fc_fifo_fc_lookup;
input		srch_burst_done;

output		fc_lookup_req;
output		fwd_no_fc_sched_sm;
output		srch_no_fc_done;

reg		fc_lookup_req;
reg		inc_wait_cnt;
reg		fwd_no_fc_sched_sm;
reg		srch_no_fc_done;
reg[1:0]	next_state;

wire[1:0]	state;
wire[2:0]	wait_cnt;
wire[2:0]	wait_cnt_in;
wire		wait_cnt_done;

wire		fwd_req;


//state machine states
parameter
        IDLE         = 2'b00,
        IDLE_WAIT    = 2'b01,
        FC_ACC_WAIT  = 2'b10;

always @ (state or fwd_req or fc_fifo_fc_lookup or
          srch_burst_done or wait_cnt_done)

begin

	fc_lookup_req		= 1'b0;
	inc_wait_cnt		= 1'b0;
	fwd_no_fc_sched_sm	= 1'b0;
	srch_no_fc_done		= 1'b0;

case (state) //synopsys parallel_case full_case
// 0in < case -full -parallel -message "0in ERROR: case check in fflp_fcram_fwd_arb"

IDLE:
begin
	if (fwd_req & fc_fifo_fc_lookup)
	begin
		fc_lookup_req   	= 1'b1;
		fwd_no_fc_sched_sm	= 1'b0;
		next_state		= FC_ACC_WAIT;
	end
	else if (fwd_req)
	begin
		fc_lookup_req		= 1'b0;
		fwd_no_fc_sched_sm	= 1'b1;
		next_state		= IDLE_WAIT;
	end
	else
	begin
		fc_lookup_req   = 1'b0;
		next_state	= state;
	end
end

IDLE_WAIT:
begin
	inc_wait_cnt	= 1'b1;
	if (wait_cnt_done)
	begin
		srch_no_fc_done	= 1'b1;
		next_state	= IDLE;
	end
	else
	begin
		srch_no_fc_done	= 1'b0;
		next_state	= state;
	end
end

FC_ACC_WAIT:
begin
	fc_lookup_req	= 1'b1;
	if (srch_burst_done)
		next_state	= IDLE;
	else
		next_state	= state;
end

default:
	next_state		= IDLE;

endcase

end


dffr #(2) state_reg	(cclk, reset, next_state,      state);


assign wait_cnt_in	= wait_cnt_done ? 3'b000 : (wait_cnt + 3'd1);
assign wait_cnt_done	= (wait_cnt == 3'b110);

dffre #(3) wait_cnt_reg	(cclk, reset, inc_wait_cnt, wait_cnt_in, wait_cnt);

assign fwd_req	= !fc_fifo_empty_sync;


endmodule
