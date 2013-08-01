// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: ncu_ucbmon.v
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

module ncu_ucbmon();


//****************** monitor  for IOS to NCU ***********************************8 
wire [14:0] ack_sel = `NCU.ncu_scd_ctl.ncu_i2cscd_ctl.ncu_i2csd_ctl.ack_sel[14:0];
wire [127:0] i2c_pkt = `NCU.ncu_scd_ctl.ncu_i2cscd_ctl.ncu_i2csd_ctl.ucb_ack_packet;

//--------------------------------------------------------------------------------------
// Enable/Disable support : MAQ
//--------------------------------------------------------------------------------------

wire flush_reset_complete = `TOP.flush_reset_complete;

reg enabled;  
initial
begin 
  enabled = 1'b1;
  if ($test$plusargs("ncu_ucbmon_disable"))
    enabled = 1'b0;
end

always @ (flush_reset_complete)
begin
  if (flush_reset_complete == 1'b0) 
    enabled = 1'b0;

  if ((flush_reset_complete == 1'b1) && (!($test$plusargs("ncu_ucbmon_disable"))))
    enabled = 1'b1;
end
//--------------------------------------------------------------------------------------


always @(posedge (`NCU.iol2clk & enabled))
begin
	case ( ack_sel[14:0] )
	15'b100_0000_0000_0000: 
                `PR_INFO("NCU_MON", `INFO," SII->NCU::   TYPE %0h; THR_ID %0h; PA = %0h; DATA = %0h;",  i2c_pkt[3:0], i2c_pkt[9:4], i2c_pkt[54:15], i2c_pkt[127:64] );
	15'b010_0000_0000_0000: 
                `PR_INFO("NCU_MON", `INFO," DMU->NCU::   TYPE %0h; THR_ID %0h; PA = %0h; DATA = %0h;",  i2c_pkt[3:0], i2c_pkt[9:4], i2c_pkt[54:15], i2c_pkt[127:64] );
	15'b001_0000_0000_0000: 
                `PR_INFO("NCU_MON", `INFO," CCU->NCU::   TYPE %0h; THR_ID %0h; PA = %0h; DATA = %0h;",  i2c_pkt[3:0], i2c_pkt[9:4], i2c_pkt[54:15], i2c_pkt[127:64] );
	15'b000_1000_0000_0000: 
                `PR_INFO("NCU_MON", `INFO," MCU0->NCU::   TYPE %0h; THR_ID %0h; PA = %0h; DATA = %0h;",  i2c_pkt[3:0], i2c_pkt[9:4], i2c_pkt[54:15], i2c_pkt[127:64] );
	15'b000_0100_0000_0000: 
                `PR_INFO("NCU_MON", `INFO," MCU1->NCU::   TYPE %0h; THR_ID %0h; PA = %0h; DATA = %0h;",  i2c_pkt[3:0], i2c_pkt[9:4], i2c_pkt[54:15], i2c_pkt[127:64] );
	15'b000_0010_0000_0000:
                `PR_INFO("NCU_MON", `INFO," MCU2->NCU::   TYPE %0h; THR_ID %0h; PA = %0h; DATA = %0h;",  i2c_pkt[3:0], i2c_pkt[9:4], i2c_pkt[54:15], i2c_pkt[127:64] );
	15'b000_0001_0000_0000: 
                `PR_INFO("NCU_MON", `INFO," MCU3->NCU::   TYPE %0h; THR_ID %0h; PA = %0h; DATA = %0h;",  i2c_pkt[3:0], i2c_pkt[9:4], i2c_pkt[54:15], i2c_pkt[127:64] );
	15'b000_0000_1000_0000:  
                `PR_INFO("NCU_MON", `INFO," SSI->NCU::   TYPE %0h; THR_ID %0h; PA = %0h; DATA = %0h;",  i2c_pkt[3:0], i2c_pkt[9:4], i2c_pkt[54:15], i2c_pkt[127:64] );
	15'b000_0000_0100_0000: 
                `PR_INFO("NCU_MON", `INFO," RST->NCU::   TYPE %0h; THR_ID %0h; PA = %0h; DATA = %0h;",  i2c_pkt[3:0], i2c_pkt[9:4], i2c_pkt[54:15], i2c_pkt[127:64] );
	15'b000_0000_0010_0000: 
                `PR_INFO("NCU_MON", `INFO," DBG1->NCU::   TYPE %0h; THR_ID %0h; PA = %0h; DATA = %0h;",  i2c_pkt[3:0], i2c_pkt[9:4], i2c_pkt[54:15], i2c_pkt[127:64] );
	15'b000_0000_0001_0000: 
                `PR_INFO("NCU_MON", `INFO," NIU->NCU::   TYPE %0h; THR_ID %0h; PA = %0h; DATA = %0h;",  i2c_pkt[3:0], i2c_pkt[9:4], i2c_pkt[54:15], i2c_pkt[127:64] );
	15'b000_0000_0000_1000: 
                `PR_INFO("NCU_MON", `INFO," NCU->REG;   TYPE %0h; THR_ID %0h; PA = %0h; DATA = %0h;",  i2c_pkt[3:0], i2c_pkt[9:4], i2c_pkt[54:15], i2c_pkt[127:64] );
	15'b000_0000_0000_0100: 
                `PR_INFO("NCU_MON", `INFO," INT->NCU::   TYPE %0h; THR_ID %0h; PA = %0h; DATA = %0h;",  i2c_pkt[3:0], i2c_pkt[9:4], i2c_pkt[54:15], i2c_pkt[127:64] );
	15'b000_0000_0000_0010: 
                `PR_INFO("NCU_MON", `INFO," UCB_BOUNCE;   TYPE %0h; THR_ID %0h; PA = %0h; DATA = %0h;",  i2c_pkt[3:0], i2c_pkt[9:4], i2c_pkt[54:15], i2c_pkt[127:64] );
	15'b000_0000_0000_0001: 
                `PR_INFO("NCU_MON", `INFO," UCB_RD_NACK;   TYPE %0h; THR_ID %0h; PA = %0h; DATA = %0h;",  i2c_pkt[3:0], i2c_pkt[9:4], i2c_pkt[54:15], i2c_pkt[127:64] );
	endcase
end // always


//********************** monitor for NCU to IOS ******************************
wire [13:0] ucb_sel;
wire [127:0] c2i_pkt = `NCU.ncu_scd_ctl.ncu_c2iscd_ctl.c2i_packet;

assign ucb_sel[13] = `NCU.ncu_scd_ctl.ncu_c2iscd_ctl.dmupio_ucb_sel
                        && `NCU.ncu_scd_ctl.ncu_c2iscd_ctl.dmupio_ucb_buf_acpt
                        && `NCU.ncu_scd_ctl.ncu_c2iscd_ctl.c2i_packet_vld;

assign ucb_sel[12] = `NCU.ncu_scd_ctl.ncu_c2iscd_ctl.dmucsr_ucb_sel
                        && `NCU.ncu_scd_ctl.ncu_c2iscd_ctl.dmucsr_ucb_buf_acpt
                        && `NCU.ncu_scd_ctl.ncu_c2iscd_ctl.c2i_packet_vld;
assign ucb_sel[11] = `NCU.ncu_scd_ctl.ncu_c2iscd_ctl.ccu_ucb_sel
                        && `NCU.ncu_scd_ctl.ncu_c2iscd_ctl.ccu_ucb_buf_acpt
                        && `NCU.ncu_scd_ctl.ncu_c2iscd_ctl.c2i_packet_vld;
assign ucb_sel[10] = `NCU.ncu_scd_ctl.ncu_c2iscd_ctl.mcu0_ucb_sel
                        && `NCU.ncu_scd_ctl.ncu_c2iscd_ctl.mcu0_ucb_buf_acpt
                        && `NCU.ncu_scd_ctl.ncu_c2iscd_ctl.c2i_packet_vld;
assign ucb_sel[9]  = `NCU.ncu_scd_ctl.ncu_c2iscd_ctl.mcu1_ucb_sel
                        && `NCU.ncu_scd_ctl.ncu_c2iscd_ctl.mcu1_ucb_buf_acpt
                        && `NCU.ncu_scd_ctl.ncu_c2iscd_ctl.c2i_packet_vld;
assign ucb_sel[8]  = `NCU.ncu_scd_ctl.ncu_c2iscd_ctl.mcu2_ucb_sel
                        && `NCU.ncu_scd_ctl.ncu_c2iscd_ctl.mcu2_ucb_buf_acpt
                        && `NCU.ncu_scd_ctl.ncu_c2iscd_ctl.c2i_packet_vld;
assign ucb_sel[7]  = `NCU.ncu_scd_ctl.ncu_c2iscd_ctl.mcu3_ucb_sel
                        && `NCU.ncu_scd_ctl.ncu_c2iscd_ctl.mcu3_ucb_buf_acpt
                        && `NCU.ncu_scd_ctl.ncu_c2iscd_ctl.c2i_packet_vld;
assign ucb_sel[6]  = `NCU.ncu_scd_ctl.ncu_c2iscd_ctl.ssi_ucb_sel
                        && `NCU.ncu_scd_ctl.ncu_c2iscd_ctl.ssi_ucb_buf_acpt
                        && `NCU.ncu_scd_ctl.ncu_c2iscd_ctl.c2i_packet_vld;
assign ucb_sel[5]  = `NCU.ncu_scd_ctl.ncu_c2iscd_ctl.rcu_ucb_sel
                        && `NCU.ncu_scd_ctl.ncu_c2iscd_ctl.rcu_ucb_buf_acpt
                        && `NCU.ncu_scd_ctl.ncu_c2iscd_ctl.c2i_packet_vld;
assign ucb_sel[4]  = `NCU.ncu_scd_ctl.ncu_c2iscd_ctl.dbg1_ucb_sel
                        && `NCU.ncu_scd_ctl.ncu_c2iscd_ctl.dbg1_ucb_buf_acpt
                        && `NCU.ncu_scd_ctl.ncu_c2iscd_ctl.c2i_packet_vld;
assign ucb_sel[3]  = `NCU.ncu_scd_ctl.ncu_c2iscd_ctl.niu_ucb_sel
                        && `NCU.ncu_scd_ctl.ncu_c2iscd_ctl.niu_ucb_buf_acpt
                        && `NCU.ncu_scd_ctl.ncu_c2iscd_ctl.c2i_packet_vld;
assign ucb_sel[2]  = `NCU.ncu_scd_ctl.ncu_c2iscd_ctl.ncu_man_ucb_sel
                        && `NCU.ncu_scd_ctl.ncu_c2iscd_ctl.ncu_man_ucb_buf_acpt
                        && `NCU.ncu_scd_ctl.ncu_c2iscd_ctl.c2i_packet_vld;
assign ucb_sel[1]  = `NCU.ncu_scd_ctl.ncu_c2iscd_ctl.bounce_ucb_sel
                        && `NCU.ncu_scd_ctl.ncu_c2iscd_ctl.bounce_ucb_buf_acpt
                        && `NCU.ncu_scd_ctl.ncu_c2iscd_ctl.c2i_packet_vld;
assign ucb_sel[0]  = `NCU.ncu_scd_ctl.ncu_c2iscd_ctl.rd_nack_ucb_sel
                        && `NCU.ncu_scd_ctl.ncu_c2iscd_ctl.rd_nack_ucb_buf_acpt
                        && `NCU.ncu_scd_ctl.ncu_c2iscd_ctl.c2i_packet_vld;



always @( posedge (`NCU.iol2clk & enabled))
begin
        case ( ucb_sel)
        14'b100_0000_0000_00: 
                `PR_INFO("NCU_MON", `INFO," NCU->PIO:   TYPE %0h; THR_ID %0h; PA = %0h; DATA = %0h;",  c2i_pkt[3:0], c2i_pkt[9:4], c2i_pkt[54:15], c2i_pkt[127:64] );
        14'b10_0000_0000_000: 
                `PR_INFO("NCU_MON", `INFO," NCU->DMU:   TYPE %0h; THR_ID %0h; PA = %0h DATA = %0h",  c2i_pkt[3:0], c2i_pkt[9:4], c2i_pkt[54:15], c2i_pkt[127:64] );
        14'b01_0000_0000_000: 
                `PR_INFO("NCU_MON", `INFO," NCU->CCU:   TYPE %0h; THR_ID %0h; PA = %0h DATA = %0h",  c2i_pkt[3:0], c2i_pkt[9:4], c2i_pkt[54:15], c2i_pkt[127:64] );
        14'b00_1000_0000_000: 
                `PR_INFO("NCU_MON", `INFO," NCU->MCU0:  TYPE %0h; THR_ID %0h; PA = %0h DATA = %0h",  c2i_pkt[3:0], c2i_pkt[9:4], c2i_pkt[54:15], c2i_pkt[127:64] );
        14'b00_0100_0000_000: 
                `PR_INFO("NCU_MON", `INFO," NCU->MCU1:  TYPE %0h; THR_ID %0h; PA = %0h DATA = %0h",  c2i_pkt[3:0], c2i_pkt[9:4], c2i_pkt[54:15], c2i_pkt[127:64] );
        14'b00_0010_0000_000:
                `PR_INFO("NCU_MON", `INFO," NCU->MCU2:  TYPE %0h; THR_ID %0h; PA = %0h DATA = %0h",  c2i_pkt[3:0], c2i_pkt[9:4], c2i_pkt[54:15], c2i_pkt[127:64] );
        14'b00_0001_0000_000: 
                `PR_INFO("NCU_MON", `INFO," NCU->MCU3:  TYPE %0h; THR_ID %0h; PA = %0h DATA = %0h",  c2i_pkt[3:0], c2i_pkt[9:4], c2i_pkt[54:15], c2i_pkt[127:64] );
        14'b00_0000_1000_000:  
                `PR_INFO("NCU_MON", `INFO," NCU->SSI:   TYPE %0h; THR_ID %0h; PA = %0h DATA = %0h",  c2i_pkt[3:0], c2i_pkt[9:4], c2i_pkt[54:15], c2i_pkt[127:64] );
        14'b00_0000_0100_000: 
                `PR_INFO("NCU_MON", `INFO," NCU->RST:   TYPE %0h; THR_ID %0h; PA = %0h DATA = %0h",  c2i_pkt[3:0], c2i_pkt[9:4], c2i_pkt[54:15], c2i_pkt[127:64] );
        14'b00_0000_0010_000: 
                `PR_INFO("NCU_MON", `INFO," NCU->DBG1:  TYPE %0h; THR_ID %0h; PA = %0h DATA = %0h",  c2i_pkt[3:0], c2i_pkt[9:4], c2i_pkt[54:15], c2i_pkt[127:64] );
        14'b00_0000_0001_000: 
                `PR_INFO("NCU_MON", `INFO," NCU->NIU:   TYPE %0h; THR_ID %0h; PA = %0h DATA = %0h",  c2i_pkt[3:0], c2i_pkt[9:4], c2i_pkt[54:15], c2i_pkt[127:64] );
        14'b00_0000_0000_100: 
                `PR_INFO("NCU_MON", `INFO," NCU REG:    TYPE %0h; THR_ID %0h; PA = %0h DATA = %0h",  c2i_pkt[3:0], c2i_pkt[9:4], c2i_pkt[54:15], c2i_pkt[127:64] );
        14'b00_0000_0000_010: 
                `PR_INFO("NCU_MON", `INFO," NCU->ucb_bounce:  TYPE %0h; THR_ID %0h; PA = %0h DATA = %0h",  c2i_pkt[3:0], c2i_pkt[9:4], c2i_pkt[54:15], c2i_pkt[127:64] );
        14'b00_0000_0000_001: 
                `PR_INFO("NCU_MON", `INFO," NCU->UCB_RD_NACK: TYPE %0h; THR_ID %0h; PA = %0h DATA = %0h",  c2i_pkt[3:0], c2i_pkt[9:4], c2i_pkt[54:15], c2i_pkt[127:64] );
        endcase
end // always


endmodule
