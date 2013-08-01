// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: ncu_xir_chkr.v
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
module ncu_xir_chkr ();

/* 0in assert_follower
      -leader   ( $0in_falling_edge (`RST.rst_fsm_ctl.mio_rst_button_xir_sys_))
      -follower ( $0in_falling_edge (`RST.rst_fsm_ctl.rst_ncu_xir_sys_))
      -clock      `RST.rst_fsm_ctl.ref_clk
      -module rst
*/
/* 0in assert_follower
      -leader   ($0in_falling_edge (`CPU.rst_ncu_xir_))
      -follower ($0in_rising_edge  (`NCU.ncu_scd_ctl.ncu_c2iscd_ctl.ncu_ctrl_ctl.xir_trigger ))
      -clock     `NCU.iol2clk
      -module ncu
*/
reg        rst_ncu_xir_active;
reg        rst_ncu_xir_active_d1;
reg        rst_ncu_xir_active_d2;
reg	   rst_ncu_xir_active_pusle_d1;
reg        rst_ncu_xir_done_pulse_d1;
reg        valid_d1;

reg [63:0] xir_steering_save;
reg [2:0]  expected_cpuid;
reg [2:0]  expected_thrid;
reg [6:0]  expected_valid;
reg [6:0]  num_valid;
reg [6:0]  i;
reg [6:0]  j;


wire valid_in                 = `CPU.ncu_cpx_data_ca[145] & (`CPU.ncu_cpx_data_ca[144:141] == 4'b0111) & (`CPU.ncu_cpx_data_ca[15:14] == 2'b01) & (`CPU.ncu_cpx_data_ca[5:0] == 6'b000011);
wire rst_ncu_xir_active_pusle =  rst_ncu_xir_active & ~rst_ncu_xir_active_d1;
wire rst_ncu_xir_done_pulse   = ~rst_ncu_xir_active &  rst_ncu_xir_active_d1;
wire valid_pulse              =  valid_in & ~valid_d1;
wire valid_gone_pulse         = ~valid_in &  valid_d1;
wire thrd_on                  = |xir_steering_save[63:0];
wire rst_ncu_xir_done_por_    = rst_ncu_xir_done_pulse & ~`CPU.TESTMODE & ~`TCU.tcu_scan_en;

initial begin
   rst_ncu_xir_active = 1'b0;
   rst_ncu_xir_active_d1 = 1'b0;
   rst_ncu_xir_active_pusle_d1 = 1'b0;
   rst_ncu_xir_done_pulse_d1 = 1'b0;
   xir_steering_save[63:0] = 64'b0;
   valid_d1 = 1'b0;
   expected_cpuid = 3'b0;
   expected_thrid = 3'b0;
   expected_valid = 7'b0;
   num_valid      = 7'b0;
   j              = 7'b0;
   i              = 7'b0;
end

// 0in never -var (( `CPU.ncu_cpx_data_ca[136:134] != expected_thrid[2:0] ) | (`CPU.ncu_cpx_data_ca[13:11] != expected_cpuid[2:0]) | (`CPU.ncu_cpx_data_ca[10:8] != expected_thrid[2:0])) -active (valid_in & ~`CPU.TESTMODE & ~`TCU.tcu_scan_en) -clock `NCU.l2clk -message "TIMEOUT: the cpu and thread id's do not match the expected data"

//-0in never -var ( i != 6'b0 ) -active (rst_ncu_xir_done_pulse & `CPU.efu.rst_por_)

// 0in never -var ( (num_valid[6:0] != expected_valid[6:0]) ) -active ($0in_rising_edge(rst_ncu_xir_done_por_)) -clock `NCU.iol2clk -message "TIMEOUT: # of valid does not match expected #"

always @ (negedge `CPU.rst_ncu_xir_ ) begin
      i = 7'b0;
      j = 7'b0;
end

always @(posedge valid_pulse )
      begin
         while (!i[6] & thrd_on & !xir_steering_save[i])
            i = i + 7'b1;
        {expected_cpuid, expected_thrid} = i[5:0];
        i = i + 7'b1;
        num_valid[6:0] = num_valid[6:0] + 7'b1;
      end

always @(posedge `CPU.ncu.iol2clk)
   begin
      rst_ncu_xir_active <= ~`CPU.rst_ncu_xir_;
      rst_ncu_xir_active_d1 <= rst_ncu_xir_active;
      rst_ncu_xir_active_pusle_d1 <= rst_ncu_xir_active_pusle;

      rst_ncu_xir_done_pulse_d1 <= rst_ncu_xir_done_pulse;

      if (rst_ncu_xir_active_pusle)
            xir_steering_save  <= `CPU.ncu.ncu_scd_ctl.ncu_c2iscd_ctl.ncu_ctrl_ctl.xir_steering[63:0];

      if (rst_ncu_xir_done_pulse_d1)
         begin
            i <= 7'b0;
            j <= 7'b0;
            expected_valid[6:0] <= 7'b0;
            num_valid[6:0] <= 7'b0;
         end
   end

always @ (negedge rst_ncu_xir_active_pusle_d1)
   for (j = 7'b0 ; j < 7'b100_0000 ; j = j + 1)
      expected_valid[6:0] = expected_valid[6:0] + xir_steering_save[j];

always @ (posedge `CPU.ncu.l2clk)
   valid_d1 <= valid_in;

endmodule
