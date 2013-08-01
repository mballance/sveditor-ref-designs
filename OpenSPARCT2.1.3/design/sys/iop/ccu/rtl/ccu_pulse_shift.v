// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: ccu_pulse_shift.v
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
`timescale 1 ns / 1 ns

module ccu_pulse_shift (
	rst_n,
	clk,
	shift,
	pulse_in,
	pulse_out	
);

input	rst_n;
input	clk;
input	[4:0] shift;
input	pulse_in;
output	pulse_out;

wire	rst_n;
wire	clk;
wire	[4:0] shift;
wire	pulse_in;
wire 	pulse_out;

reg		[4:0] cnt;			// shift counter
reg 	pulse_event;		// sticky bit set hi once pulse is seen

assign	pulse_out = ((cnt[4:0] == shift[4:0]) && pulse_event)?1'b1:1'b0;
 
always @ (posedge clk) begin
	if (!rst_n) begin 
		cnt <= 5'h00;
		pulse_event <= 1'b0;
	end	else 
		if (pulse_in) begin
			pulse_event <= 1'b1;
			cnt <= 5'h00;
		end else begin
			pulse_event <= pulse_event; 
			cnt <= cnt + 1'b1;
		end	
end


endmodule 

