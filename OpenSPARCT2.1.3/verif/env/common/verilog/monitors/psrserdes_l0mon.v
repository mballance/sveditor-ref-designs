// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: psrserdes_l0mon.v
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
`timescale 1ps/1ps

module psrserdes_l0mon ();

reg enabled;
reg enable;
reg serdes_mon;
reg psr_l2_d;
initial
begin
  enabled = 1'b1;
  serdes_mon = 1'b1;
  if ($test$plusargs("psrserdes_l0mon_disable")) begin
    serdes_mon = 1'b0;
    enabled = 1'b0;
  end
end

wire flush_reset_complete = `TOP.flush_reset_complete;

always @ (flush_reset_complete)
begin
  if (flush_reset_complete == 1'b0)
    enabled = 1'b0;

  if ((flush_reset_complete == 1'b1) && serdes_mon)
    enabled = 1'b1;
end
//--------------------------------------------------------------------------------------

// added this ifndef
`ifdef PEU_SYSTEMC_T2
`else
`ifndef FC_NO_PEU_T2
wire psr_l2_low2high =  `CPU.peu.l2t_etp_link & ~psr_l2_d;
wire psr_l2_high2low = ~`CPU.peu.l2t_etp_link & psr_l2_d;

always @(`CPU.peu.t2l_rst or `CPU.peu.t2l_por)
   enable = 1'b1;

always @(posedge (`CPU.peu.pcl1clk & enabled & enable))
begin
   psr_l2_d <= `CPU.peu.l2t_etp_link;

   if (psr_l2_low2high) begin
      `PR_NORMAL("psrserdes_l0mon", `NORMAL, "PSR L0 LINK is up" );
   end

   if (psr_l2_high2low) 
      `PR_INFO("psrserdes_l0mon", `INFO, "PSR L0 LINK HAS LOSS SYNC");
end
`endif
`endif // !`ifdef PEU_SYSTEMC_T2

//if (`TOP.info===1'b1) $dispmon("NCU_MON", `INFO," NIU->NCU::	 TYPE %0h; THR_ID %0h; PA = %0h; DATA = %0h;",	i2c_pkt[3:0], i2c_pkt[9:4], i2c_pkt[54:15], i2c_pkt[127:64] );
//`CPU.peu.l2t_etp_link

endmodule
