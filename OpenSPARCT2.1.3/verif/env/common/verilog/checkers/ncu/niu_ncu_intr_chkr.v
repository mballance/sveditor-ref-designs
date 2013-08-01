// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: niu_ncu_intr_chkr.v
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
module niu_ncu_intr_chkr ();

// assemble interrupt back to CPU
//assign	 int_iopkt[152:0] =
//		    {// 1'b1,					    //valid		    [145]
//			int_iopkt_rt[3:0],		//return type	[144:141]
//			1'b0,				//un-used	[140]
//			err_type[1:0],			//err field	[139:138], ue=10, ce=01
//			1'b0,				//un-used	[137]
//			int_packet_cputhr_d2[2:0],	//thr_id	[136:134]
//			6'b0,				//un-used	[133:128]
//			64'b0,				//un-used	[127:64]
//			48'b0,				//un-used	[63:16]
//			tt_d2[1:0],			//tt		[15:14]
//			int_iopkt_bit_13_8[5:0],	//cputhr ID	[13:8]
//			2'b0,   			//un-used	[7:6]
//		        int_packet_vec_d2[5:0] };	//int vector	[5:0]
//n2_com_dp_128x16s_cust ncu_intman_rf_cust ( /*autoinst*/
//                                            // Outputs
//                                            .dout(intman_tbl_dout[15:0]), // Templated
//                                            // Inputs
//                                            .scan_in(ncu_intman_rf_cust_scanin),
//                                            .scan_out(ncu_intman_rf_cust_scanout),
//                                            .wrclk(iol2clk),	 // Templated
//                                            .rdclk(iol2clk),	 // Templated
//                                            .wr_en(intman_tbl_wr), // Templated
//                                            .rd_en(intman_tbl_rden), // Templated
//                                            .wr_adr(intman_tbl_waddr[6:0]), // Templated
//                                            .rd_adr(intman_tbl_raddr[6:0]), // Templated
//                                            .din(intman_tbl_din[15:0]), // Templated
//                                            .tcu_se_scancollar_in(tcu_se_scancollar_in),
//                                            .tcu_se_scancollar_out(tcu_se_scancollar_out),
//                                            .tcu_array_wr_inhibit(array_wr_inhibit_io),
//                                            .tcu_aclk(aclk_io),
//                                            .tcu_bclk(bclk_io),
//                                            .tcu_pce_ov(pce_ov),
//                                            .bist_clk_mux_sel(1'b0),
//                                            .rd_pce(1'b1),
//                                            .wr_pce(1'b1));

reg		niu_ncu_vld_d;
reg             niu_ncu_int_vld_d1;
reg		niu_ncu_int_vld_d2;
reg  [6:0]  	device_id_q;
reg  [15:0]     intmem_tbl [127:0];
reg  [15:0]	tbl_dout;
reg  [5:0]      expected_intr_vec;
reg  [5:0]      expected_cputhread;
reg  [7:0]      c;

wire	   niu_ncu_vld_pulse = `NCU.niu_ncu_vld & ~niu_ncu_vld_d;

wire       niu_ncu_int_vld = (niu_ncu_vld_pulse & (`NCU.niu_ncu_data[3:0] == 4'h8));

wire       ncu_cpx_vld     = `CPU.ncu_cpx_data_ca[145] & (`CPU.ncu_cpx_data_ca[144:141] == 4'b0111) & (`CPU.ncu_cpx_data_ca[15:14] == 2'b00);

wire [6:0] device_id_din   = niu_ncu_vld_pulse ? `NCU.niu_ncu_data[16:10] : device_id_q;

wire       equal_compare   = (`CPU.ncu_cpx_data_ca[136:134] == expected_cputhread[2:0]) & (`CPU.ncu_cpx_data_ca[13:8] == expected_cputhread[5:0]) & (`CPU.ncu_cpx_data_ca[7:6] == 2'b00) & (`CPU.ncu_cpx_data_ca[5:0] == expected_intr_vec[5:0]) & ncu_cpx_vld;

/* 0in assert_follower
	-leader	  ( $0in_rising_edge (niu_ncu_int_vld) )
	-follower ( $0in_rising_edge (equal_compare) )
        -max 1024
	-clock `NCU.l2clk
        -message "ERROR: mismatch cpu and thread id after niu_intr_vld packet"
*/


initial begin
   niu_ncu_vld_d           =  1'b0;
   niu_ncu_int_vld_d1      =  1'b0;
   niu_ncu_int_vld_d2      =  1'b0;
   device_id_q             =  7'b0;
   for ( c=0; c<128; c=c+1)
      intmem_tbl[c] = 16'b0;
   tbl_dout[15:0]          = 16'b0;
   expected_intr_vec[5:0]  =  6'b0;
   expected_cputhread[5:0] =  6'b0;
end

always @ (posedge `NCU.iol2clk)
   begin
      niu_ncu_vld_d <= `NCU.niu_ncu_vld;

      niu_ncu_int_vld_d1 <= niu_ncu_int_vld;

      niu_ncu_int_vld_d2 <= niu_ncu_int_vld_d1;

      device_id_q <= device_id_din[6:0];

      if ( `NCU.intman_tbl_wr )
         intmem_tbl[`NCU.intman_tbl_waddr[6:0]] <= `NCU.intman_tbl_din[15:0];

      tbl_dout[15:0] <= intmem_tbl[device_id_q[6:0]];

      expected_cputhread[5:0] <= niu_ncu_int_vld_d2 ? tbl_dout[11:6] : expected_cputhread[5:0];

      expected_intr_vec[5:0]  <= niu_ncu_int_vld_d2 ? tbl_dout[5:0]  : expected_intr_vec[5:0];
   end
endmodule
