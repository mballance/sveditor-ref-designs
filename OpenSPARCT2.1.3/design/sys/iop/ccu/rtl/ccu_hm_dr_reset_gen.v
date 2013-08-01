// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: ccu_hm_dr_reset_gen.v
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
module ccu_hm_dr_reset_gen (
	rst_out_n,
	clk,
	shift_amt,
	aligned,
    div_msb, 
	rst_n
);

output rst_out_n;
input clk;
input [4:0] shift_amt;
input aligned;
input div_msb; 
input rst_n;

wire rst_out_n;
wire clk;
wire [4:0] shift_amt;
wire aligned;
wire div_msb; 
wire [1:0] align_shift;
wire rst_n;

wire pulse_rst_n;
wire pulse_rst1_n;		// eco 1.1 - mh157021
wire pulse_rst2_n;		// eco 1.2 - mh157021
wire pulse_rst1_n_in;	// eco 1.3 - mh157021
wire rst;
reg  dr_rst_n;
wire dr_rst_n_q;



assign rst = ~rst_n;

assign rst_out_n = (div_msb) ? dr_rst_n : dr_rst_n_q ;

always @(posedge clk) begin  // later convert to async reset 
	if (!rst_n) 
		dr_rst_n <= 1'b0;
	else begin
		if (pulse_rst2_n) 	// eco 1.4 - mh157021 - wire change from pulse_rst_n
			dr_rst_n <= 1'b1;
		else 
			dr_rst_n <= dr_rst_n; 
	end
end	

my_msff_arst_4x	dr_rst_n_ff ( 
	.q(dr_rst_n_q), 
	.so(), 
	.d(dr_rst_n), 
	.l1clk(clk), 
	.si(1'b0), 
	.siclk(1'b0), 
	.soclk(1'b0), 
	.reset(rst) 
);


my_msff_arst_4x	pulse_wait ( // eco 1.5 - mh157021
	.q(pulse_rst1_n), 
	.so(), 
	.d(pulse_rst1_n_in), 
	.l1clk(clk), 
	.si(1'b0), 
	.siclk(1'b0), 
	.soclk(1'b0), 
	.reset(rst) 
);

assign pulse_rst1_n_in = pulse_rst1_n | pulse_rst_n;	// eco 1.6 - mh157021 - feedback
assign pulse_rst2_n    = pulse_rst1_n & pulse_rst_n;	// eco 1.7 - mh157021 - 2nd pulse goes thru 


// ***********************************************
// shift dr reset +4 cycle to reference edge 
// ***********************************************

ccu_hm_pulse_shift dr_reset_shift (
	.rst_n 		(rst_n),
	.clk 		(clk),
	.shift 		(shift_amt),	
 	.pulse_in 	(aligned),
	.pulse_out	(pulse_rst_n)
);

endmodule 

