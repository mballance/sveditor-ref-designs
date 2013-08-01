// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: fflp_sync2fc_clk.v
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
/*module name:   fflp_sync2fc_clk                                     */
/*description:   syncronization between core clk and fcram clk        */
/*                                                                    */
/*parent module in:                                                   */
/*child modules in:                                                   */
/*                                                                    */
/*interface modules:                                                  */
/*author name:       Jeanne Cai                                       */
/*date created:      04-08-04                                         */
/*                                                                    */
/*              Copyright (c) 2004, Sun Microsystems, Inc.            */
/*                   Sun Proprietary and Confidential                 */
/*                                                                    */
/*modifications:                                                      */
/*                                                                    */
/*                                                                    */

module fflp_sync2fc_clk (
			cclk,		//fcram_clk
			reset,
			cpu_fcram_req,
			cpu_fio_req,
			fc_fifo_empty,
			fflp_config_reg_wen_pulse,

			reset_sync,
                        cpu_fcram_req_sync,
			cpu_fio_req_sync,
                        fc_fifo_empty_sync,
			fflp_config_reg_wen_pulse_sync

			);


input		cclk;
input		reset;
input		cpu_fcram_req;
input		cpu_fio_req;
input		fc_fifo_empty;
input		fflp_config_reg_wen_pulse;

output		reset_sync;
output          cpu_fcram_req_sync;
output		cpu_fio_req_sync;
output          fc_fifo_empty_sync;
output		fflp_config_reg_wen_pulse_sync;


wire		reset1;
wire            cpu_fcram_req1;
wire		cpu_fio_req1;
wire		fflp_config_reg_wen_pulse1;

wire		reset_sync;
wire            cpu_fcram_req_sync;
wire		cpu_fio_req_sync;
wire            fc_fifo_empty_sync;
wire		fflp_config_reg_wen_pulse_sync;

niu_dff #(1) reset1_reg		    (cclk, reset,		      	reset1);
niu_dff #(1) cpu_fcram_req1_reg	    (cclk, cpu_fcram_req,	      	cpu_fcram_req1);
niu_dff #(1) cpu_fio_req1_reg	    (cclk, cpu_fio_req,		      	cpu_fio_req1);
niu_dff #(1) config_reg_wen1_reg    (cclk, fflp_config_reg_wen_pulse, 	fflp_config_reg_wen_pulse1);

/*
Need to put it back if fcram_clk is different from niu_clk.
This is due to cutting fc fifo to two entries to save gates
for adding one pipeline for new fio read latency.

wire            fc_fifo_empty1;
niu_dff #(1) fc_fifo_empty1_reg     (cclk, fc_fifo_empty,               fc_fifo_empty1);
niu_dff #(1) fc_fifo_empty2_reg     (cclk, fc_fifo_empty1,              fc_fifo_empty_sync);
*/

assign	fc_fifo_empty_sync = fc_fifo_empty;


niu_dff #(1) reset2_reg		    (cclk, reset1,                    	reset_sync);
niu_dff #(1) cpu_fcram_req2_reg     (cclk, cpu_fcram_req1,            	cpu_fcram_req_sync);
niu_dff #(1) cpu_fio_req2_reg	    (cclk, cpu_fio_req1,	      	cpu_fio_req_sync);
niu_dff #(1) config_reg_wen2_reg    (cclk, fflp_config_reg_wen_pulse1,	fflp_config_reg_wen_pulse_sync);





endmodule
