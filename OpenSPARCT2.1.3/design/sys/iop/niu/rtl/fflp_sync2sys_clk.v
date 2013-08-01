// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: fflp_sync2sys_clk.v
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
/*module name:   fflp_sync2sys_clk                                    */
/*description:   syncronization between fcram clk and core clk        */
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

module	fflp_sync2sys_clk (
				cclk,		//core clk
				cpu_fc_req_done,
				cpu_fio_req_done,
				fc_fifo_ren,
				zcp_wr,
		
				cpu_fc_req_done_sync,
				cpu_fio_req_done_sync,
				fc_fifo_ren_sync,
				fflp_zcp_wr_p,
				fflp_zcp_wr
			   );


input		cclk;
input		cpu_fc_req_done;
input		cpu_fio_req_done;
input		fc_fifo_ren;
input		zcp_wr;

output		cpu_fc_req_done_sync;
output		cpu_fio_req_done_sync;
output		fc_fifo_ren_sync;
output		fflp_zcp_wr_p;
output[4:0]	fflp_zcp_wr;


wire		cpu_fc_req_done1;
wire		cpu_fio_req_done1;
wire		zcp_wr1;

wire		cpu_fc_req_done_sync;
wire		cpu_fio_req_done_sync;
wire		fc_fifo_ren_sync;
wire		zcp_wr_sync;
wire		zcp_wr_sync_dly;

wire		fflp_zcp_wr_p;
wire[4:0]	fflp_zcp_wr_bits;
wire[4:0]	fflp_zcp_wr;

niu_dff #(1) cpu_fc_req_done1_reg	(cclk, cpu_fc_req_done,		cpu_fc_req_done1);
niu_dff #(1) cpu_fio_req_done1_reg	(cclk, cpu_fio_req_done,	cpu_fio_req_done1);
niu_dff #(1) zcp_wr1_reg		(cclk, zcp_wr,			zcp_wr1);

/*
Need to put it back if fcram_clk is different from niu_clk.
This is due to cutting fc fifo to two entries to save gates 
for adding one pipeline for new fio read latency.

wire            fc_fifo_ren1;
niu_dff #(1) fc_fifo_ren1_reg           (cclk, fc_fifo_ren,             fc_fifo_ren1);
niu_dff #(1) fc_fifo_ren2_reg           (cclk, fc_fifo_ren1,            fc_fifo_ren_sync);
*/

assign fc_fifo_ren_sync = fc_fifo_ren;

niu_dff #(1) cpu_fc_req_done2_reg   	(cclk, cpu_fc_req_done1,        cpu_fc_req_done_sync);
niu_dff #(1) cpu_fio_req_done2_reg	(cclk, cpu_fio_req_done1,	cpu_fio_req_done_sync);
niu_dff #(1) zcp_wr2_reg            	(cclk, zcp_wr1,                 zcp_wr_sync);

niu_dff #(1) zcp_wr3_reg		(cclk, zcp_wr_sync,		zcp_wr_sync_dly);

assign fflp_zcp_wr_p	= zcp_wr_sync & !zcp_wr_sync_dly;
assign fflp_zcp_wr_bits = {5{fflp_zcp_wr_p}};

niu_dff #(5) fflp_zcp_wr_reg		(cclk, fflp_zcp_wr_bits,	fflp_zcp_wr);


endmodule
				

