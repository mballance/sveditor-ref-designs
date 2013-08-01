// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: mmu_mec_dp.v
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
module mmu_mec_dp (
  data_in, 
  parity_in, 
  parity_out, 
  parity_err);
wire [40:0] d;
wire p;
wire [41:0] check_bus;
wire check_4;
wire check_3;
wire check_2;
wire check_1;
wire check_0;



input	[40:0]	data_in;	// Used for generation and checking
input		parity_in;	// Used for checking only; tie to '0' for gen

output		parity_out;	// Used for generation only; unused for check
output		parity_err;	// Used for checking only; unused for gen



//////////////////////////////////////////////////////////////////////////////


assign d[40:0] = 
       data_in[40:0];
assign p =
       parity_in;



assign check_bus[41:0] = 
	{p, d[40:0]};

mmu_mec_dp_prty_macro__width_8 check_4_pty  (
	.din	(check_bus	[39:32]	),
	.dout	(check_4		)
);

mmu_mec_dp_prty_macro__width_8 check_3_pty  (
	.din	(check_bus	[31:24]	),
	.dout	(check_3		)
);

mmu_mec_dp_prty_macro__width_8 check_2_pty  (
	.din	(check_bus	[23:16]	),
	.dout	(check_2		)
);

mmu_mec_dp_prty_macro__width_8 check_1_pty  (
	.din	(check_bus	[15:8]	),
	.dout	(check_1		)
);

mmu_mec_dp_prty_macro__width_8 check_0_pty  (
	.din	(check_bus	[7:0]	),
	.dout	(check_0		)
);

mmu_mec_dp_prty_macro__width_8 check_pty  (
	.din	({1'b0		       ,
		  check_bus	[41:40],
		  check_4	       ,
		  check_3	       ,
		  check_2	       ,
		  check_1	       ,
		  check_0	       }),
	.dout	(parity_out		)
);


assign parity_err = parity_out;



supply0 vss; // <- port for ground
supply1 vdd; // <- port for power

endmodule



//
//   parity macro (even parity)
//
//





module mmu_mec_dp_prty_macro__width_8 (
  din, 
  dout);
  input [7:0] din;
  output dout;







prty #(8)  m0_0 (
.in(din[7:0]),
.out(dout)
);










endmodule




