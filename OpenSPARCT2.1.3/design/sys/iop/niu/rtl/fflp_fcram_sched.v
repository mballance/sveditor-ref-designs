// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: fflp_fcram_sched.v
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

module fflp_fcram_sched
		(
		cclk,
		reset,
		fcram_lookup_ratio,
		cpu_fcram_req_sync,
		fc_fifo_empty_sync,
		fc_fifo_fc_lookup,
		srch_burst_done,
		cpu_burst_done_sm,

		srch_no_fc_done,
		fwd_sched,
		do_srch_cycle,
		do_cpu_cycle,
		fc_fifo_ren
		);

input		cclk;
input		reset;
input[3:0]	fcram_lookup_ratio;
input		cpu_fcram_req_sync;
input		fc_fifo_empty_sync;
input		fc_fifo_fc_lookup;
input		srch_burst_done;
input		cpu_burst_done_sm;

output		srch_no_fc_done;
output		fwd_sched;
output		do_srch_cycle;
output		do_cpu_cycle;
output		fc_fifo_ren;


wire		fc_lookup_req;
wire		fwd_no_fc_sched_sm;
wire		srch_no_fc_done;
wire		fwd_sched;
wire		do_srch_cycle;
wire		do_cpu_cycle;



fflp_fcram_fwd_arb	fflp_fcram_fwd_arb_inst (
				.cclk			(cclk),
				.reset			(reset),
				.fc_fifo_empty_sync	(fc_fifo_empty_sync),
				.fc_fifo_fc_lookup	(fc_fifo_fc_lookup),
				.srch_burst_done	(srch_burst_done),

				.fc_lookup_req		(fc_lookup_req),
				.fwd_no_fc_sched_sm	(fwd_no_fc_sched_sm),
				.srch_no_fc_done	(srch_no_fc_done)

				);


fflp_fcram_arb		fflp_fcram_arb_inst (
				.cclk			(cclk),
				.reset			(reset),
				.fcram_lookup_ratio	(fcram_lookup_ratio),
				.fc_lookup_req		(fc_lookup_req),
				.fwd_no_fc_sched_sm	(fwd_no_fc_sched_sm),
				.cpu_fcram_req_sync	(cpu_fcram_req_sync),
				.srch_burst_done	(srch_burst_done),
				.cpu_burst_done_sm	(cpu_burst_done_sm),

				.fwd_sched		(fwd_sched),
				.do_srch_cycle		(do_srch_cycle),
				.do_cpu_cycle		(do_cpu_cycle),
				.fc_fifo_ren		(fc_fifo_ren)
				
				);


endmodule
