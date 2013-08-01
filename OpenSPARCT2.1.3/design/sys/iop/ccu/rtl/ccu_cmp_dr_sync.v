// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: ccu_cmp_dr_sync.v
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
`timescale 1 ns / 1ps

module ccu_cmp_dr_sync (
	align,
	align_shift,
	ccu_serdes_dtm,
	clk,
	ratio,	
	pulse,
	rst_n
);


input 	ccu_serdes_dtm;
input 	align;	
input   [1:0] align_shift;
input	clk;	
input 	rst_n;	
input 	[4:0] ratio;
output	pulse;	

wire 	ccu_serdes_dtm;
wire 	align;	
wire   [1:0] align_shift; 
wire	clk;	
wire 	rst_n;	
wire 	[4:0] ratio;
wire 	[4:0] func_ratio; 
wire 	[4:0] dtm_ratio; 
wire	pulse;	

reg		[4:0] cnt;	
reg		[3:0] agg_k; 	// aggregate for k=0,1,2,3
reg		[3:0] dtm_agg_k; 	// aggregate for k=0,1,2,3 for DTM

reg pulse_minus1;
reg pulse_nom;
reg pulse_plus1;


// only one set of ratios is active
assign func_ratio = ccu_serdes_dtm ? 5'b0  : ratio; 
assign  dtm_ratio = ccu_serdes_dtm ? ratio : 5'b0 ;

// this causes the aggregates of that set to be quiescent


assign 	pulse = (align_shift == 2'b10) ?  pulse_minus1 :  
					 (align_shift == 2'b01) ?  pulse_plus1 : pulse_nom ;


always @ (posedge clk) begin
	if (!rst_n) begin 
		 pulse_minus1 <= 1'b0; 
		 pulse_nom    <= 1'b0;
		 pulse_plus1  <= 1'b0;
	end else begin
		 pulse_minus1 <= (| (agg_k | dtm_agg_k)) ; // pulse is OR of any pulse @k
		 pulse_nom    <= pulse_minus1; 			// code ensures only one set of
		 pulse_plus1  <= pulse_nom; 			// pulses is active at any time
	end
end


// pulse counter starting from align
always @ (posedge clk) begin
	if (!rst_n) 
		cnt <= 5'h00;
	else begin 
		if (align == 1'b1) 
			cnt <= 5'h00;
		else 
			cnt <= cnt  + 1'b1;
	end	
end

// PULSE POSITIONS @ CCU BOUNDARY 
// ==============================
//
// FUNCTIONAL MODE
//
// cmp:dr	Binary	K -> slow clk cycles 		
// ratio	Div4	0	1	2	3
// -----------------------------------------
// 2.00		0100_0	7	1	3	5
// 2.25		0100_1	0	2	5	7
// 2.50		0101_0	1	4	6	9
// 2.75		0101_1	2	5	8	0
// 3.00		0110_0	3	6	9	0
// 3.25		0110_1	5	8	11	1
// 3.50		0111_0	6	9	13	2
// 3.75		0111_1	7	11	14	3
// 4.00		1000_0	8	12	0	4
// 4.25		1000_1	9	13	1	5
// 4.50		1001_0	10	15	1	6
// 4.75		1001_1	11	16	2	7
// 5.00		1010_0	12	17	2	7
// 5.25		1010_1	14	19	3	8
//
// DTM 
//
// cmp:dr	Binary	K -> slow clk cycles 		
// ratio	Div2	0	1	2	3
// -----------------------------------------
//  8.00	0111	2   2   2   2
// 11.00	1010	6   6   6   6
// 15.00	1110	12  12  12  12


// pulse gen from counter (combo logic)
// Functional mode 
always @ (cnt or func_ratio) begin
	case (func_ratio)
		5'b01000: 			// 010 00 => 2.00
			case (cnt) 
				5'd07: agg_k = 4'b0001;
				5'd01: agg_k = 4'b0010;
				5'd03: agg_k = 4'b0100;
				5'd05: agg_k = 4'b1000;
				default: agg_k = 4'h0;
			endcase
		5'b01001: 			// 010 01 => 2.25
			case (cnt) 
				5'd00: agg_k = 4'b0001;
				5'd02: agg_k = 4'b0010;
				5'd05: agg_k = 4'b0100;
				5'd07: agg_k = 4'b1000;
				default: agg_k = 4'h0;
			endcase
		5'b01010: 			// 010 10 => 2.50
			case (cnt) 
				5'd01: agg_k = 4'b0001;
				5'd04: agg_k = 4'b0010;
				5'd06: agg_k = 4'b0100;
				5'd09: agg_k = 4'b1000;
				default: agg_k = 4'h0;
			endcase
		5'b01011: 			// 010 11 => 2.75
			case (cnt) 
				5'd02: agg_k = 4'b0001;
				5'd05: agg_k = 4'b0010;
				5'd08: agg_k = 4'b0100;
				5'd00: agg_k = 4'b1000;
				default: agg_k = 4'h0;
			endcase
		5'b01100: 			// 011 00 => 3.00
			case (cnt) 
				5'd03: agg_k = 4'b0001;
				5'd06: agg_k = 4'b0010;
				5'd09: agg_k = 4'b0100;
				5'd00: agg_k = 4'b1000;
				default: agg_k = 4'h0;
			endcase
		5'b01101: 			// 011 01 => 3.25
			case (cnt) 
				5'd05: agg_k = 4'b0001;	
				5'd08: agg_k = 4'b0010;
				5'd11: agg_k = 4'b0100;
				5'd01: agg_k = 4'b1000;
				default: agg_k = 4'h0;
			endcase
		5'b01110: 			// 011 10 => 3.50
			case (cnt) 
				5'd06: agg_k = 4'b0001;
				5'd09: agg_k = 4'b0010;
				5'd13: agg_k = 4'b0100;
				5'd02: agg_k = 4'b1000;
				default: agg_k = 4'h0;
			endcase
		5'b01111: 			// 011 11 => 3.75
			case (cnt) 
				5'd07: agg_k = 4'b0001;
				5'd11: agg_k = 4'b0010;
				5'd14: agg_k = 4'b0100;
				5'd03: agg_k = 4'b1000;
				default: agg_k = 4'h0;
			endcase
		5'b10000: 			// 100 00 => 4.00
			case (cnt) 
				5'd08: agg_k = 4'b0001;
				5'd12: agg_k = 4'b0010;
				5'd00: agg_k = 4'b0100;
				5'd04: agg_k = 4'b1000;
				default: agg_k = 4'h0;
			endcase
		5'b10001: 			// 100 01 => 4.25
			case (cnt) 
				5'd09: agg_k = 4'b0001;
				5'd13: agg_k = 4'b0010;
				5'd01: agg_k = 4'b0100;
				5'd05: agg_k = 4'b1000;
				default: agg_k = 4'h0;
			endcase
		5'b10010: 			// 100 10 => 4.50
			case (cnt) 
				5'd10: agg_k = 4'b0001;
				5'd15: agg_k = 4'b0010;
				5'd01: agg_k = 4'b0100;
				5'd06: agg_k = 4'b1000;
				default: agg_k = 4'h0;
			endcase
		5'b10011: 			// 100 11 => 4.75
			case (cnt) 
				5'd11: agg_k = 4'b0001;
				5'd16: agg_k = 4'b0010;
				5'd02: agg_k = 4'b0100;
				5'd07: agg_k = 4'b1000;
				default: agg_k = 4'h0;
			endcase
		5'b10100: 			// 101 00 => 5.00
			case (cnt) 
				5'd12: agg_k = 4'b0001;
				5'd17: agg_k = 4'b0010;
				5'd02: agg_k = 4'b0100;
				5'd07: agg_k = 4'b1000;
				default: agg_k = 4'h0;
			endcase
		5'b10101: 			// 101 01 => 5.25
			case (cnt) 
				5'd14: agg_k = 4'b0001;
				5'd19: agg_k = 4'b0010;
				5'd03: agg_k = 4'b0100;
				5'd08: agg_k = 4'b1000;
				default: agg_k = 4'h0;
			endcase
		default: agg_k = 4'h0;		// no pulses 
	endcase
end



// pulse gen from counter (combo logic)
// DTM 
always @ (cnt or dtm_ratio) begin
	case (dtm_ratio)
		5'b00111: 			// 0_0111 => 8
			case (cnt) 
				5'd02: dtm_agg_k = 4'b0001;	 // same cnt applies to k=1,2,3
				default: dtm_agg_k = 4'h0;
			endcase
		5'b01010: 			// 0_1010 => 11 
			case (cnt) 
				5'd06: dtm_agg_k = 4'b0001;	 // same cnt applies to k=1,2,3
				default: dtm_agg_k = 4'h0;
			endcase
		5'b01110: 			// 0_1110 => 15 
			case (cnt) 
				5'd12: dtm_agg_k = 4'b0001;	 // same cnt applies to k=1,2,3
				default: dtm_agg_k = 4'h0;
			endcase
		default: dtm_agg_k = 4'h0;		// no pulses 

	endcase
end


endmodule

