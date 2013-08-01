// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: nb_encode_crc.v
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
module nb_encode_crc ( pn_shft_map_out , pn_bar_map_out ,
                       sn_in , sn_bar_in , 
                       rbuffer_rd_out , rbuffer_rd_data_in ,rbuffer_empty,
                       config_reg_rd,config_reg_data,
                       send_status_frm,sync_cmd, 
                       chmon_pn_data,chmon_pn_status,
                       disable_state, frm_begin,frm_boundary,frm_boundary_sb,
                       nb_config, clk_int,
                       drc, fbds0,fbds1,fbds2,fbds3,fbdreg_mtr,
                       soft_channel_reset, send_alert_frame_in,
                       fbdreg_curr_cmd_to_data,fbdreg_curr_cmd_to_data_inc,
                       fbdreg_next_cmd_to_data,fbdreg_next_cmd_to_data_inc,
                       reset,dram_clk, ddrio_nbencode_rd,
`ifdef AXIS_FBDIMM_NO_FSR
`else
                       link_clk, link_clk_bar,
`endif
                       init,dram_2x_clk,ref_clk,
                       pn0_out,pn1_out,pn2_out,pn3_out,pn4_out,pn5_out,pn6_out,
                       pn7_out,pn8_out,pn9_out,pn10_out,pn11_out,
                       serdes_data_rdy,sb_crc_error,electrical_idle);
// Parameters
parameter NB_LINK = 14;
parameter DS = 0;


// Inputs/Outputs
output [NB_LINK-1:0] pn_shft_map_out,pn_bar_map_out; // primary southbound
output [NB_LINK-1:0] pn0_out,pn1_out,pn2_out,pn3_out,pn4_out,pn5_out,pn6_out;
output [NB_LINK-1:0] pn7_out,pn8_out,pn9_out,pn10_out,pn11_out;
input  [NB_LINK-1:0] sn_in,sn_bar_in; // secondary southbound
input  [71:0]        rbuffer_rd_data_in;
input  [31:0]        config_reg_data;
input  [23:0]        sync_cmd;
input  [31:0]        drc;
input                dram_2x_clk;
input                electrical_idle;
output [7:0]         fbds0,fbds1,fbds2,fbds3;
input  [7:0]         fbdreg_mtr;
input  [3:0]         nb_config;
input  [7:0]         fbdreg_curr_cmd_to_data,fbdreg_curr_cmd_to_data_inc;
input  [7:0]         fbdreg_next_cmd_to_data,fbdreg_next_cmd_to_data_inc;
input                soft_channel_reset;
input                frm_begin,frm_boundary,frm_boundary_sb;
input                ddrio_nbencode_rd;
`ifdef AXIS_FBDIMM_NO_FSR
`else
input                link_clk,link_clk_bar;
`endif
input                dram_clk;

output               rbuffer_rd_out;
output               chmon_pn_data,chmon_pn_status;
output               serdes_data_rdy;
input                rbuffer_empty;
input                reset;
input                clk_int;
input                init; // =1 if initializing
input                config_reg_rd;
input                send_status_frm;
input                disable_state;
input                send_alert_frame_in;
input                ref_clk;
input                sb_crc_error;

//internal registers
wire [NB_LINK-1:0]   pn0_idle_frame,pn1_idle_frame,pn2_idle_frame,pn3_idle_frame,pn4_idle_frame;
wire [NB_LINK-1:0]   pn5_idle_frame,pn6_idle_frame,pn7_idle_frame,pn9_idle_frame,pn8_idle_frame;
wire [NB_LINK-1:0]   pn10_idle_frame,pn11_idle_frame;
wire [NB_LINK-1:0]   pn_idle_frame,pn,pn_alert_frame;
wire [NB_LINK-1:0]   pn_shft_out;
reg  [NB_LINK-1:0]   pn_data_reg;
wire [NB_LINK-1:0]   pn_read_data=pn_data_reg;
wire [NB_LINK-1:0]   pn_read_data_shft;
reg  [NB_LINK-1:0]   pn0,pn1,pn2,pn3,pn4,pn5,pn6,pn7,pn8,pn9,pn10,pn11;
reg  [NB_LINK-1:0]   pn_bus_read_data,pn_bus_status_data;
wire [NB_LINK-1:0]   pn_bus_alert_frame;
wire [NB_LINK-1:0]   pn_bus_alert_frame0,pn_bus_alert_frame1,pn_bus_alert_frame2,pn_bus_alert_frame3;
wire [NB_LINK-1:0]   pn_bus_alert_frame4,pn_bus_alert_frame5,pn_bus_alert_frame6,pn_bus_alert_frame7;
wire [NB_LINK-1:0]   pn_bus_alert_frame8,pn_bus_alert_frame9,pn_bus_alert_frame10,pn_bus_alert_frame11;
reg  [71:0]          data_package [3:0]; 
reg  [71:0]          Data1,Data2;
reg [11:0]          DataCRC1,DataCRC2;
wire [71:0]          B,B1;
wire [11:0]          E,E1;
reg  [11:0]          E_d,E1_d;
reg  [71:0]          CD,D;
reg  [13:0]          pn0_reg,pn1_reg,pn2_reg,pn3_reg,pn4_reg,pn5_reg;
reg  [13:0]          pn6_reg,pn7_reg,pn8_reg,pn9_reg,pn10_reg,pn11_reg;
reg  [13:0]          pn0_reg_l,pn1_reg_l,pn2_reg_l,pn3_reg_l,pn4_reg_l,pn5_reg_l;
reg  [13:0]          pn6_reg_l,pn7_reg_l,pn8_reg_l,pn9_reg_l,pn10_reg_l,pn11_reg_l;

reg  [13:0]          pn0_reg_l_b,pn1_reg_l_b,pn2_reg_l_b,pn3_reg_l_b,pn4_reg_l_b,pn5_reg_l_b;
reg  [13:0]          pn6_reg_l_b,pn7_reg_l_b,pn8_reg_l_b,pn9_reg_l_b,pn10_reg_l_b,pn11_reg_l_b;

reg  [13:0]          pn0_dreg,pn1_dreg,pn2_dreg,pn3_dreg,pn4_dreg,pn5_dreg;
reg  [13:0]          pn6_dreg,pn7_dreg,pn8_dreg,pn9_dreg,pn10_dreg,pn11_dreg;

reg  [13:0]          pn0_d2reg,pn1_d2reg,pn2_d2reg,pn3_d2reg,pn4_d2reg,pn5_d2reg;
reg  [13:0]          pn6_d2reg,pn7_d2reg,pn8_d2reg,pn9_d2reg,pn10_d2reg,pn11_d2reg;

reg  [13:0]          pn0_dreg_d,pn1_dreg_d,pn2_dreg_d,pn3_dreg_d,pn4_dreg_d,pn5_dreg_d;
reg  [13:0]          pn6_dreg_d,pn7_dreg_d,pn8_dreg_d,pn9_dreg_d,pn10_dreg_d,pn11_dreg_d;
reg  [4:0]           status_reg0;
reg  [4:0]           status_reg1;
reg  [4:0]           status_reg2;
reg  [4:0]           status_reg3;
reg  [4:0]           status_reg4;
reg  [4:0]           status_reg5;
reg  [4:0]           status_reg6;
reg  [4:0]           status_reg7;
reg  [7:0]           fbds0_reg,fbds1_reg,fbds2_reg,fbds3_reg;
reg  [1:0]           rbuffer_rd_cnt;
reg  [1:0]           curr_state;
reg  [3:0]           pn_curr_state,pn_next_state;
wire                 config_reg_rd_shft_data;
wire                 send_status_frm_shft;
reg                  rbuffer_rd_reg;
reg                  get_rfifo_data;
reg                  send_reg_data;
wire                 config_reg_rd_shft;
reg                  send_status_frm_reg;
reg                  data1_rdy, data2_rdy, data3_rdy;
reg                  fbdimm0_set_status_alert_bit_always;
reg                  fbdimm0_set_status_parity_bit_always;
reg                  fbdimm1_set_status_alert_bit_always;
reg                  fbdimm1_set_status_parity_bit_always;
reg                  fbdimm2_set_status_alert_bit_always;
reg                  fbdimm2_set_status_parity_bit_always;
reg                  fbdimm3_set_status_alert_bit_always;
reg                  fbdimm3_set_status_parity_bit_always;
reg                  fbdimm4_set_status_alert_bit_always;
reg                  fbdimm4_set_status_parity_bit_always;
reg                  fbdimm5_set_status_alert_bit_always;
reg                  fbdimm5_set_status_parity_bit_always;
reg                  fbdimm6_set_status_alert_bit_always;
reg                  fbdimm6_set_status_parity_bit_always;
reg                  fbdimm7_set_status_alert_bit_always;
reg                  fbdimm7_set_status_parity_bit_always;
reg [1:0]            fbdimm0_set_thermal_trip;
reg [1:0]            fbdimm1_set_thermal_trip;
reg [1:0]            fbdimm2_set_thermal_trip;
reg [1:0]            fbdimm3_set_thermal_trip;
reg [1:0]            fbdimm4_set_thermal_trip;
reg [1:0]            fbdimm5_set_thermal_trip;
reg [1:0]            fbdimm6_set_thermal_trip;
reg [1:0]            fbdimm7_set_thermal_trip;
reg [9:0]            fbdimm0_set_status_alert_bit,fbdimm0_set_status_parity_bit;
reg [9:0]	     fbdimm1_set_status_alert_bit,fbdimm1_set_status_parity_bit;
reg [9:0]	     fbdimm2_set_status_alert_bit,fbdimm2_set_status_parity_bit;
reg [9:0] 	     fbdimm3_set_status_alert_bit,fbdimm3_set_status_parity_bit;
reg [9:0]	     fbdimm4_set_status_alert_bit,fbdimm4_set_status_parity_bit;
reg [9:0]	     fbdimm5_set_status_alert_bit,fbdimm5_set_status_parity_bit;
reg [9:0]	     fbdimm6_set_status_alert_bit,fbdimm6_set_status_parity_bit;
reg [9:0] 	     fbdimm7_set_status_alert_bit,fbdimm7_set_status_parity_bit;
reg                  nb_12, failover_nb_13, failover_nb_14; //, nb_data_rdy;
reg                  send_alert_frame_in_d,dummy;
wire                 nb_data_rdy;
reg                  pn_bus_alert, pn_bus_reg, pn_bus_read, pn_bus_status;
wire [13:0]          send_status_frm_d;
reg                  status1_rdy,status2_rdy;
wire                 fbdimm_fast_nb;
wire                 nb_status_rdy = status1_rdy; //   | status2_rdy ; 


`ifdef AXIS_FBDIMM_HW
reg [7:0]            LastAMB_ID;
wire [7:0]           Last_FBDimm_ID_REG = LastAMB_ID;
`else
reg  [7:0]           config_mem[0:24];
wire [7:0]           Last_FBDimm_ID_REG = config_mem[0];
`endif



// Assignments
assign nb_data_rdy     = data1_rdy | data2_rdy;
assign chmon_pn_status = send_status_frm_reg;
assign chmon_pn_data   = rbuffer_rd_reg;
assign fbds0           = fbds0_reg;
assign fbds1           = fbds1_reg;
assign fbds2           = fbds2_reg;
assign fbds3           = fbds3_reg;
assign serdes_data_rdy = nb_data_rdy | nb_status_rdy ;
assign pn_bar_map_out  =  disable_state ? pn_shft_map_out : ~pn_shft_map_out;
assign pn_shft_map_out = (( nb_config == 4'b1111 ) & ( DS==0))  ? pn_shft_out : // All lanes are good
                         (( nb_config == 4'b1101 ) & ( DS==0))  ? {1'b0,pn_shft_out[12:0]}                    : // map nb13 
                         (( nb_config == 4'b1100 ) & ( DS==0))  ? {pn_shft_out[12]   ,1'b0,pn_shft_out[11:0]} : // map nb12
                         (( nb_config == 4'b1011 ) & ( DS==0))  ? {pn_shft_out[12:11],1'b0,pn_shft_out[10:0]} : // map nb11
                         (( nb_config == 4'b1010 ) & ( DS==0))  ? {pn_shft_out[12:10],1'b0,pn_shft_out[09:0]} : // map nb10
                         (( nb_config == 4'b1001 ) & ( DS==0))  ? {pn_shft_out[12:09],1'b0,pn_shft_out[08:0]} : // map nb9
                         (( nb_config == 4'b1000 ) & ( DS==0))  ? {pn_shft_out[12:08],1'b0,pn_shft_out[07:0]} : // map nb8
                         (( nb_config == 4'b0111 ) & ( DS==0))  ? {pn_shft_out[12:07],1'b0,pn_shft_out[06:0]} : // map nb7
                         (( nb_config == 4'b0110 ) & ( DS==0))  ? {pn_shft_out[12:06],1'b0,pn_shft_out[05:0]} : // map nb6
                         (( nb_config == 4'b0101 ) & ( DS==0))  ? {pn_shft_out[12:05],1'b0,pn_shft_out[04:0]} : // map nb5
                         (( nb_config == 4'b0100 ) & ( DS==0))  ? {pn_shft_out[12:04],1'b0,pn_shft_out[03:0]} : // map nb4
                         (( nb_config == 4'b0011 ) & ( DS==0))  ? {pn_shft_out[12:03],1'b0,pn_shft_out[02:0]} : // map nb3
                         (( nb_config == 4'b0010 ) & ( DS==0))  ? {pn_shft_out[12:02],1'b0,pn_shft_out[01:0]} : // map nb2
                         (( nb_config == 4'b0001 ) & ( DS==0))  ? {pn_shft_out[12:01],1'b0,pn_shft_out[0]   } : // map nb1
                         (( nb_config == 4'b0000 ) & ( DS==0))  ? {pn_shft_out[12:00],1'b0}                        : pn_shft_out; // map nb0



assign pn[13]      =   ( pn_bus_alert )                                              ? pn_bus_alert_frame[13]: 
                       ( pn_bus_read | pn_bus_reg )                                  ? pn_bus_read_data[13]: 
                       ( pn_bus_status & ( DS == 0 ) & ( Last_FBDimm_ID_REG == 0 ) ) ? pn_bus_status_data[13]:
                       ( pn_bus_status & ( DS==Last_FBDimm_ID_REG) & (DS != 13))     ? 1'b0:
                       ( pn_bus_status   )                                           ? pn_bus_status_data[13] : 
                       ( DS==Last_FBDimm_ID_REG)                                     ? pn_idle_frame[13]:
                                                                                       sn_in[13];

assign pn[12]      =   ( pn_bus_alert )                                              ? pn_bus_alert_frame[12]: 
                       ( pn_bus_read | pn_bus_reg )                                  ? pn_bus_read_data[12]: 
                       ( pn_bus_status & ( DS == 0 ) & ( Last_FBDimm_ID_REG == 0 ) ) ? pn_bus_status_data[12]:
                       ( pn_bus_status & ( DS==Last_FBDimm_ID_REG) & (DS != 12))     ? 1'b0:
                       ( pn_bus_status )                                             ? pn_bus_status_data[12] : 
                       ( DS==Last_FBDimm_ID_REG)                                     ? pn_idle_frame[12]: 
                                                                                       sn_in[12];

assign pn[11]      =   ( pn_bus_alert )                                              ? pn_bus_alert_frame[11]:
                       ( pn_bus_read | pn_bus_reg )                                  ? pn_bus_read_data[11]: 
                       ( pn_bus_status & ( DS == 0 ) & ( Last_FBDimm_ID_REG == 0 ) ) ? pn_bus_status_data[11]:
                       ( pn_bus_status & ( DS==Last_FBDimm_ID_REG) & (DS != 11))     ? 1'b0:
                       ( pn_bus_status )                                             ? pn_bus_status_data[11]: 
                       ( DS==Last_FBDimm_ID_REG)                                     ? pn_idle_frame[11]: 
                                                                                       sn_in[11];

assign pn[10]      =   ( pn_bus_alert )                                              ? pn_bus_alert_frame[10]: 
                       ( pn_bus_read | pn_bus_reg )                                  ? pn_bus_read_data[10]: 
                       ( pn_bus_status & ( DS == 0 ) & ( Last_FBDimm_ID_REG == 0 ) ) ? pn_bus_status_data[10]:
                       ( pn_bus_status & ( DS==Last_FBDimm_ID_REG) & (DS != 10))     ? 1'b0:
                       ( pn_bus_status )                                             ? pn_bus_status_data[10]: 
                       ( DS==Last_FBDimm_ID_REG)                                     ? pn_idle_frame[10]: 
                                                                                       sn_in[10];

assign pn[09]      =   ( pn_bus_alert             )                                  ? pn_bus_alert_frame[09]:
                       ( pn_bus_read | pn_bus_reg )                                  ? pn_bus_read_data[09]: 
                       ( pn_bus_status & ( DS == 0 ) & ( Last_FBDimm_ID_REG == 0 ) ) ? pn_bus_status_data[09]:
                       ( pn_bus_status & ( DS==Last_FBDimm_ID_REG) & (DS != 9))      ? 1'b0:
                       ( pn_bus_status   )                                           ? pn_bus_status_data[09]: 
                       ( DS==Last_FBDimm_ID_REG)                                     ? pn_idle_frame[09]: 
                                                                                       sn_in[09];

assign pn[08]      =   ( pn_bus_alert )                                              ? pn_bus_alert_frame[08]:
                       ( pn_bus_read | pn_bus_reg )                                  ? pn_bus_read_data[08]: 
                       ( pn_bus_status & ( DS == 0 ) & ( Last_FBDimm_ID_REG == 0 ) ) ? pn_bus_status_data[08]:
                       ( pn_bus_status & ( DS==Last_FBDimm_ID_REG) & (DS != 8))      ? 1'b0:
                       ( pn_bus_status   )                                           ? pn_bus_status_data[08]: 
                       ( DS==Last_FBDimm_ID_REG)                                     ? pn_idle_frame[08]: 
                                                                                       sn_in[08];

assign pn[07]      =   ( pn_bus_alert )                                              ? pn_bus_alert_frame[07]:
                       ( pn_bus_read | pn_bus_reg )                                  ? pn_bus_read_data[07]: 
                       ( pn_bus_status & ( DS == 0 ) & ( Last_FBDimm_ID_REG == 0 ) ) ? pn_bus_status_data[07]:
                       ( pn_bus_status & ( DS==Last_FBDimm_ID_REG) & (DS != 7))      ? 1'b0:
                       ( pn_bus_status )                                             ? pn_bus_status_data[07]: 
                       ( DS==Last_FBDimm_ID_REG)                                     ? pn_idle_frame[07]: 
                                                                                       sn_in[07];

assign pn[06]      =   ( pn_bus_alert )                                              ? pn_bus_alert_frame[06]:
                       ( pn_bus_read | pn_bus_reg )                                  ? pn_bus_read_data[06]:
                       ( pn_bus_status & ( DS == 0 ) & ( Last_FBDimm_ID_REG == 0 ) ) ? pn_bus_status_data[06]:
                       ( pn_bus_status & ( DS==Last_FBDimm_ID_REG) & (DS != 6))      ? 1'b0:
                       ( pn_bus_status  )                                            ? pn_bus_status_data[06] : 
                       ( DS==Last_FBDimm_ID_REG)                                     ? pn_idle_frame[06]: 
                                                                                       sn_in[06];

assign pn[05]      =   ( pn_bus_alert )                                              ? pn_bus_alert_frame[05]:
                       ( pn_bus_read | pn_bus_reg )                                  ? pn_bus_read_data[05]: 
                       ( pn_bus_status & ( DS == 0 ) & ( Last_FBDimm_ID_REG == 0 ) ) ? pn_bus_status_data[05]:
                       ( pn_bus_status & ( DS==Last_FBDimm_ID_REG) & (DS != 5))      ? 1'b0:
                       ( pn_bus_status )                                             ? pn_bus_status_data[05] : 
                       ( DS==Last_FBDimm_ID_REG)                                     ? pn_idle_frame[05]: 
                                                                                       sn_in[05];


assign pn[04]      =   ( pn_bus_alert )                                              ? pn_bus_alert_frame[04]:
                       ( pn_bus_read | pn_bus_reg )                                  ? pn_bus_read_data[04]: 
                       ( pn_bus_status & ( DS == 0 ) & ( Last_FBDimm_ID_REG == 0 ) ) ? pn_bus_status_data[04]:
                       ( pn_bus_status & ( DS==Last_FBDimm_ID_REG) & (DS != 4))      ? 1'b0:
                       ( pn_bus_status  )                                            ? pn_bus_status_data[04] : 
                       ( DS==Last_FBDimm_ID_REG)                                     ? pn_idle_frame[04]: 
                                                                                       sn_in[04];


assign pn[03]      =   ( pn_bus_alert )                                              ? pn_bus_alert_frame[03]:
                       ( pn_bus_read | pn_bus_reg )                                  ? pn_bus_read_data[03]:
                       ( pn_bus_status & ( DS == 0 ) & ( Last_FBDimm_ID_REG == 0 ) ) ? pn_bus_status_data[03]:
                       ( pn_bus_status & ( DS==Last_FBDimm_ID_REG) & (DS != 3))      ? 1'b0:
                       ( pn_bus_status  )                                            ? pn_bus_status_data[03] : 
                       ( DS==Last_FBDimm_ID_REG)                                     ? pn_idle_frame[03]: 
                                                                                       sn_in[03];


assign pn[02]      =   ( pn_bus_alert )                                              ? pn_bus_alert_frame[02]:
                       ( pn_bus_read | pn_bus_reg )                                  ? pn_bus_read_data[02]: 
                       ( pn_bus_status & ( DS == 0 ) & ( Last_FBDimm_ID_REG == 0 ) ) ? pn_bus_status_data[02]:
                       ( pn_bus_status & ( DS==Last_FBDimm_ID_REG) & (DS != 2))      ? 1'b0:
                       ( pn_bus_status  )                                            ? pn_bus_status_data[02] : 
                       ( DS==Last_FBDimm_ID_REG)                                     ? pn_idle_frame[02]: 
                                                                                       sn_in[02];

assign pn[01]      =   ( pn_bus_alert )                                              ? pn_bus_alert_frame[01]:
                       ( pn_bus_read | pn_bus_reg )                                  ? pn_bus_read_data[01]:
                       ( pn_bus_status & ( DS == 0 ) & ( Last_FBDimm_ID_REG == 0 ) ) ? pn_bus_status_data[01]:
                       ( pn_bus_status & ( DS==Last_FBDimm_ID_REG) & (DS != 1))      ? 1'b0:
                       ( pn_bus_status  )                                            ? pn_bus_status_data[01] : 
                       ( DS==Last_FBDimm_ID_REG)                                     ? pn_idle_frame[01]: 
                                                                                       sn_in[01];


assign pn[00]      =   ( pn_bus_alert )                                              ? pn_bus_alert_frame[00]:
                       ( pn_bus_read | pn_bus_reg )                                  ? pn_bus_read_data[00]: 
                       ( pn_bus_status & ( DS == 0 ) & ( Last_FBDimm_ID_REG == 0 ) ) ? pn_bus_status_data[00]:
                       ( pn_bus_status & ( DS==Last_FBDimm_ID_REG) & (DS != 0))      ? 1'b0:
                       ( pn_bus_status  )                                            ? pn_bus_status_data[00] : 
                       ( DS==Last_FBDimm_ID_REG)                                     ? pn_idle_frame[00]: 
                                                                                       sn_in[00];









assign rbuffer_rd_out  = get_rfifo_data;

`ifdef FBDIMM_FAST_NB
// cem
assign B1[11:0]     = {rbuffer_rd_data_in[66],rbuffer_rd_data_in[60],rbuffer_rd_data_in[54],rbuffer_rd_data_in[48],rbuffer_rd_data_in[42],rbuffer_rd_data_in[36],rbuffer_rd_data_in[30],rbuffer_rd_data_in[24],rbuffer_rd_data_in[18],rbuffer_rd_data_in[12],rbuffer_rd_data_in[06],rbuffer_rd_data_in[00]};  
assign B1[23:12]    = {rbuffer_rd_data_in[01],rbuffer_rd_data_in[07],rbuffer_rd_data_in[13],rbuffer_rd_data_in[19],rbuffer_rd_data_in[25],rbuffer_rd_data_in[31],rbuffer_rd_data_in[37],rbuffer_rd_data_in[43],rbuffer_rd_data_in[49],rbuffer_rd_data_in[55],rbuffer_rd_data_in[61],rbuffer_rd_data_in[67]};
assign B1[35:24]    = {rbuffer_rd_data_in[68],rbuffer_rd_data_in[62],rbuffer_rd_data_in[56],rbuffer_rd_data_in[50],rbuffer_rd_data_in[44],rbuffer_rd_data_in[38],rbuffer_rd_data_in[32],rbuffer_rd_data_in[26],rbuffer_rd_data_in[20],rbuffer_rd_data_in[14],rbuffer_rd_data_in[08],rbuffer_rd_data_in[02]};
assign B1[47:36]    = {rbuffer_rd_data_in[03],rbuffer_rd_data_in[09],rbuffer_rd_data_in[15],rbuffer_rd_data_in[21],rbuffer_rd_data_in[27],rbuffer_rd_data_in[33],rbuffer_rd_data_in[39],rbuffer_rd_data_in[45],rbuffer_rd_data_in[51],rbuffer_rd_data_in[57],rbuffer_rd_data_in[63],rbuffer_rd_data_in[69]};
assign B1[59:48]    = {rbuffer_rd_data_in[70],rbuffer_rd_data_in[64],rbuffer_rd_data_in[58],rbuffer_rd_data_in[52],rbuffer_rd_data_in[46],rbuffer_rd_data_in[40],rbuffer_rd_data_in[34],rbuffer_rd_data_in[28],rbuffer_rd_data_in[22],rbuffer_rd_data_in[16],rbuffer_rd_data_in[10],rbuffer_rd_data_in[04]};
assign B1[71:60]    = {rbuffer_rd_data_in[05],rbuffer_rd_data_in[11],rbuffer_rd_data_in[17],rbuffer_rd_data_in[23],rbuffer_rd_data_in[29],rbuffer_rd_data_in[35],rbuffer_rd_data_in[41],rbuffer_rd_data_in[47],rbuffer_rd_data_in[53],rbuffer_rd_data_in[59],rbuffer_rd_data_in[65],rbuffer_rd_data_in[71]};

`endif

assign B[11:0]     = {D[66],D[60],D[54],D[48],D[42],D[36],D[30],D[24],D[18],D[12],D[06],D[00]};  
assign B[23:12]    = {D[01],D[07],D[13],D[19],D[25],D[31],D[37],D[43],D[49],D[55],D[61],D[67]};
assign B[35:24]    = {D[68],D[62],D[56],D[50],D[44],D[38],D[32],D[26],D[20],D[14],D[08],D[02]};
assign B[47:36]    = {D[03],D[09],D[15],D[21],D[27],D[33],D[39],D[45],D[51],D[57],D[63],D[69]};
assign B[59:48]    = {D[70],D[64],D[58],D[52],D[46],D[40],D[34],D[28],D[22],D[16],D[10],D[04]};
assign B[71:60]    = {D[05],D[11],D[17],D[23],D[29],D[35],D[41],D[47],D[53],D[59],D[65],D[71]};



always@(posedge frm_boundary_sb)
  send_alert_frame_in_d<=send_alert_frame_in;

`ifdef AXIS_FBDIMM_NO_FSR

initial begin
  pn_bus_alert = 0;
  pn_bus_status_data = 0;
  pn_bus_reg = 0;
end

`else
always@(posedge link_clk)
begin

  pn_bus_read <= rbuffer_rd_reg;
  pn_bus_read_data <= pn_read_data;
  pn_bus_status <= send_status_frm_reg;
  pn_bus_alert <= send_alert_frame_in_d;
  pn_bus_status_data <= pn_read_data;
  pn_bus_reg <= send_reg_data;

end
`endif


// Initialization
initial begin
`ifdef AXIS_FBDIMM_HW
 if ($test$plusargs("1_FBDIMM"))
   LastAMB_ID=0;
 else if ($test$plusargs("2_FBDIMMS"))
   LastAMB_ID=1;
 else if ($test$plusargs("3_FBDIMMS"))
   LastAMB_ID=2;
 else if ($test$plusargs("4_FBDIMMS"))
   LastAMB_ID=3;
 else if ($test$plusargs("5_FBDIMMS"))
   LastAMB_ID=4;
 else if ($test$plusargs("6_FBDIMMS"))
   LastAMB_ID=5;
 else if ($test$plusargs("7_FBDIMMS"))
   LastAMB_ID=6;
 else if ($test$plusargs("8_FBDIMMS"))
   LastAMB_ID=7;
 else
   LastAMB_ID=0;

`endif

`ifdef AXIS_FBDIMM_HW
`else
  if ( $test$plusargs("fbdimm_dbg"))
    $ch_dispmon("nb_enc",`DBG_0,1);

  if ( $test$plusargs("fbdimm_dbg_1"))
    $ch_dispmon("nb_enc",`DBG_1,1);

  if ( $test$plusargs("fbdimm_dbg_2"))
    $ch_dispmon("nb_enc",`DBG_2,1);

  if ( $test$plusargs("fbdimm_dbg_3"))
    $ch_dispmon("nb_enc",`DBG_3,1);

  if ( $test$plusargs("fbdimm_dbg_4"))
    $ch_dispmon("nb_enc",`DBG_4,1);

`endif
   curr_state    = `NB_ST_1;
   pn_next_state = `NB_ST_1;
   pn_data_reg=0;
   CD=0;
   get_rfifo_data=0;

// thermal trip arguments
fbdimm0_set_thermal_trip = 2'h0;
fbdimm1_set_thermal_trip = 2'h0;
fbdimm2_set_thermal_trip = 2'h0;
fbdimm3_set_thermal_trip = 2'h0;
fbdimm4_set_thermal_trip = 2'h0;
fbdimm5_set_thermal_trip = 2'h0;
fbdimm6_set_thermal_trip = 2'h0;
fbdimm7_set_thermal_trip = 2'h0;

// Plusargs for AMB0
fbdimm0_set_status_alert_bit = 0;
fbdimm0_set_status_parity_bit = 0;
fbdimm1_set_status_alert_bit = 0;
fbdimm1_set_status_parity_bit = 0;
fbdimm2_set_status_alert_bit = 0;
fbdimm2_set_status_parity_bit = 0;
fbdimm3_set_status_alert_bit = 0;
fbdimm3_set_status_parity_bit = 0;
fbdimm4_set_status_alert_bit = 0;
fbdimm4_set_status_parity_bit = 0;
fbdimm5_set_status_alert_bit = 0;
fbdimm5_set_status_parity_bit = 0;
fbdimm6_set_status_alert_bit = 0;
fbdimm6_set_status_parity_bit = 0;
fbdimm7_set_status_alert_bit = 0;
fbdimm7_set_status_parity_bit = 0;

`ifdef AXIS_FBDIMM_HW
`else

  // default is 1 AMB device
  config_mem[0]=0;
 

if ($test$plusargs("1_FBDIMM"))
   config_mem[0]=0;
else if ($test$plusargs("2_FBDIMMS"))
   config_mem[0]=1;
else if ($test$plusargs("3_FBDIMMS"))
   config_mem[0]=2;
else if ($test$plusargs("4_FBDIMMS"))
   config_mem[0]=3;
else if ($test$plusargs("5_FBDIMMS"))
   config_mem[0]=4;
else if ($test$plusargs("6_FBDIMMS"))
   config_mem[0]=5;
else if ($test$plusargs("7_FBDIMMS"))
   config_mem[0]=6;
else if ($test$plusargs("8_FBDIMMS"))
   config_mem[0]=7;
else
   config_mem[0]=0;


dummy=$value$plusargs("fbdimm0_set_thermal_trip=%h",fbdimm0_set_thermal_trip);
dummy=$value$plusargs("fbdimm1_set_thermal_trip=%h",fbdimm1_set_thermal_trip);
dummy=$value$plusargs("fbdimm2_set_thermal_trip=%h",fbdimm2_set_thermal_trip);
dummy=$value$plusargs("fbdimm3_set_thermal_trip=%h",fbdimm3_set_thermal_trip);
dummy=$value$plusargs("fbdimm4_set_thermal_trip=%h",fbdimm4_set_thermal_trip);
dummy=$value$plusargs("fbdimm5_set_thermal_trip=%h",fbdimm5_set_thermal_trip);
dummy=$value$plusargs("fbdimm6_set_thermal_trip=%h",fbdimm6_set_thermal_trip);
dummy=$value$plusargs("fbdimm7_set_thermal_trip=%h",fbdimm7_set_thermal_trip);


dummy=$value$plusargs("fbdimm0_set_status_alert_bit=%h",fbdimm0_set_status_alert_bit);
dummy=$value$plusargs("fbdimm0_set_status_parity_bit=%h",fbdimm0_set_status_parity_bit);
dummy=$value$plusargs("fbdimm1_set_status_alert_bit=%h",fbdimm1_set_status_alert_bit);
dummy=$value$plusargs("fbdimm1_set_status_parity_bit=%h",fbdimm1_set_status_parity_bit);
dummy=$value$plusargs("fbdimm2_set_status_alert_bit=%h",fbdimm2_set_status_alert_bit);
dummy=$value$plusargs("fbdimm2_set_status_parity_bit=%h",fbdimm2_set_status_parity_bit);
dummy=$value$plusargs("fbdimm3_set_status_alert_bit=%h",fbdimm3_set_status_alert_bit);
dummy=$value$plusargs("fbdimm3_set_status_parity_bit=%h",fbdimm3_set_status_parity_bit);
dummy=$value$plusargs("fbdimm4_set_status_alert_bit=%h",fbdimm4_set_status_alert_bit);
dummy=$value$plusargs("fbdimm4_set_status_parity_bit=%h",fbdimm4_set_status_parity_bit);
dummy=$value$plusargs("fbdimm5_set_status_alert_bit=%h",fbdimm5_set_status_alert_bit);
dummy=$value$plusargs("fbdimm5_set_status_parity_bit=%h",fbdimm5_set_status_parity_bit);
dummy=$value$plusargs("fbdimm6_set_status_alert_bit=%h",fbdimm6_set_status_alert_bit);
dummy=$value$plusargs("fbdimm6_set_status_parity_bit=%h",fbdimm6_set_status_parity_bit);
dummy=$value$plusargs("fbdimm7_set_status_alert_bit=%h",fbdimm7_set_status_alert_bit);
dummy=$value$plusargs("fbdimm7_set_status_parity_bit=%h",fbdimm7_set_status_parity_bit);

// amb0
if ($test$plusargs("fbdimm0_set_status_alert_bit_always"))
 fbdimm0_set_status_alert_bit_always = 1'b1;
else
   fbdimm0_set_status_alert_bit_always = 1'b0;

if ($test$plusargs("fbdimm0_set_status_parity_bit_always"))
   fbdimm0_set_status_parity_bit_always = 1'b1;
else
   fbdimm0_set_status_parity_bit_always = 1'b0;

//amb1
if ($test$plusargs("fbdimm1_set_status_alert_bit_always"))
 fbdimm1_set_status_alert_bit_always = 1'b1;
else
   fbdimm1_set_status_alert_bit_always = 1'b0;

if ($test$plusargs("fbdimm1_set_status_parity_bit_always"))
   fbdimm1_set_status_parity_bit_always = 1'b1;
else
   fbdimm1_set_status_parity_bit_always = 1'b0;

//amb2
if ($test$plusargs("fbdimm2_set_status_alert_bit_always"))
 fbdimm2_set_status_alert_bit_always = 1'b1;
else
   fbdimm2_set_status_alert_bit_always = 1'b0;

if ($test$plusargs("fbdimm2_set_status_parity_bit_always"))
   fbdimm2_set_status_parity_bit_always = 1'b1;
else
   fbdimm2_set_status_parity_bit_always = 1'b0;

//amb3
if ($test$plusargs("fbdimm3_set_status_alert_bit_always"))
 fbdimm3_set_status_alert_bit_always = 1'b1;
else
   fbdimm3_set_status_alert_bit_always = 1'b0;

if ($test$plusargs("fbdimm3_set_status_parity_bit_always"))
   fbdimm3_set_status_parity_bit_always = 1'b1;
else
   fbdimm3_set_status_parity_bit_always = 1'b0;

//amb4
if ($test$plusargs("fbdimm4_set_status_alert_bit_always"))
 fbdimm4_set_status_alert_bit_always = 1'b1;
else
   fbdimm4_set_status_alert_bit_always = 1'b0;

if ($test$plusargs("fbdimm4_set_status_parity_bit_always"))
   fbdimm4_set_status_parity_bit_always = 1'b1;
else
   fbdimm4_set_status_parity_bit_always = 1'b0;

//amb5
if ($test$plusargs("fbdimm5_set_status_alert_bit_always"))
 fbdimm5_set_status_alert_bit_always = 1'b1;
else
   fbdimm5_set_status_alert_bit_always = 1'b0;

if ($test$plusargs("fbdimm5_set_status_parity_bit_always"))
   fbdimm5_set_status_parity_bit_always = 1'b1;
else
   fbdimm5_set_status_parity_bit_always = 1'b0;

//amb6
if ($test$plusargs("fbdimm6_set_status_alert_bit_always"))
 fbdimm6_set_status_alert_bit_always = 1'b1;
else
   fbdimm6_set_status_alert_bit_always = 1'b0;

if ($test$plusargs("fbdimm6_set_status_parity_bit_always"))
   fbdimm6_set_status_parity_bit_always = 1'b1;
else
   fbdimm6_set_status_parity_bit_always = 1'b0;

//amb7
if ($test$plusargs("fbdimm7_set_status_alert_bit_always"))
 fbdimm7_set_status_alert_bit_always = 1'b1;
else
   fbdimm7_set_status_alert_bit_always = 1'b0;

if ($test$plusargs("fbdimm7_set_status_parity_bit_always"))
   fbdimm7_set_status_parity_bit_always = 1'b1;
else
   fbdimm7_set_status_parity_bit_always = 1'b0;



`endif

// dont read the file any more  $readmemb("fbdimm.config",config_mem);

if($test$plusargs("fbdimm_nb_failover_14bit"))
 failover_nb_14=1;
else
 failover_nb_14=0;

if($test$plusargs("fbdimm_nb_failover_13bit"))
 failover_nb_13=1;
else
 failover_nb_13=0;


if($test$plusargs("fbdimm_nb_12bit"))
 nb_12=1;
else
 nb_12=0;

pn_bus_read = 0; 
pn_bus_read_data = 0;
pn_bus_status=0;
send_status_frm_reg=0;
pn0_reg=0;
pn1_reg=0;
pn2_reg=0;
pn3_reg=0;
pn4_reg=0;
pn5_reg=0;
pn6_reg=0;
pn7_reg=0;
pn8_reg=0;
pn9_reg=0;
pn10_reg=0;
pn11_reg=0;

end

// nb bus display
`ifdef AXIS_FBDIMM_NO_FSR
always@(posedge clk_int)
`else 
always@(posedge link_clk) 
`endif
begin
`ifdef AXIS_FBDIMM_HW
`else
 if ( rbuffer_rd_reg ) 
  `PR_ALWAYS ("nb_enc",`DBG_0,"%d: FBDIMM: NB_BUS DATA %h nb_bus %h -> E=%h\n",$time,CD, pn_read_data,E);
`endif

if (  send_status_frm) begin
`ifdef AXIS_FBDIMM_HW
`else
  `PR_ALWAYS ("nb_enc",`DBG_0,"%d: FBDIMM: NB_BUS SYNC %h\n",$time,sync_cmd);
`endif
   case (sync_cmd[1:0])
    2'b00: fbds0_reg=status_reg0;
    2'b01: fbds1_reg=status_reg0;
    2'b10: fbds2_reg=status_reg0;
    2'b11: fbds3_reg=status_reg0;
   endcase

  end
`ifdef AXIS_FBDIMM_HW
`else
if ( send_status_frm_reg )
  `PR_ALWAYS ("nb_enc",`DBG_0,"%d: FBDIMM: NB_BUS STATUS FRAME %h\n",$time,pn);
`endif

end


wire capture_data = frm_begin; //~(rbuffer_rd_out |  rbuffer_empty ) | ;


initial begin
data1_rdy=0;
data2_rdy=0;
status1_rdy=0;
status2_rdy=0;
end


`ifdef FBDIMM_FAST_NB

reg ddrio_nbencode_rd_d1;
reg ddrio_nbencode_rd_d2;
reg ddrio_nbencode_rd_d3;
reg ddrio_nbencode_rd_d4;
reg ddrio_nbencode_rd_d5;
reg ddrio_nbencode_rd_d6;
reg ddrio_nbencode_rd_d7;
reg ddrio_nbencode_rd_d8;
reg ddrio_nbencode_rd_d9;
reg ddrio_nbencode_rd_d10;
reg ddrio_nbencode_rd_d11;
reg ddrio_nbencode_rd_d12;
reg ddrio_nbencode_rd_d13;
wire ddrio_nbencode_rd_d18;
reg ddrio_nbencode_rd_d19;
reg ddrio_nbencode_rd_d20;
reg ddrio_nbencode_rd_d21;
reg ddrio_nbencode_rd_d22;

shifter_p #(1) delay_ddrio ( .signal_in ( ddrio_nbencode_rd ),
                             .signal_out ( ddrio_nbencode_rd_d18 ),
                             .delay_cycles ( 10'd18 ),
                             .clk ( dram_2x_clk));


always@(posedge dram_2x_clk )
begin
   ddrio_nbencode_rd_d19 <= ddrio_nbencode_rd_d18;
   ddrio_nbencode_rd_d20 <= ddrio_nbencode_rd_d19;
   ddrio_nbencode_rd_d21 <= ddrio_nbencode_rd_d20;
   ddrio_nbencode_rd_d22 <= ddrio_nbencode_rd_d21;

end

reg ddrio_nbencode_rd_a;

always@(posedge frm_boundary_sb )
begin

 ddrio_nbencode_rd_d1 <= ddrio_nbencode_rd;

 ddrio_nbencode_rd_a <= ddrio_nbencode_rd_d1;
 ddrio_nbencode_rd_d2 <= ddrio_nbencode_rd_a;

 ddrio_nbencode_rd_d3 <= ddrio_nbencode_rd_d2;
 ddrio_nbencode_rd_d4 <= ddrio_nbencode_rd_d3;
 ddrio_nbencode_rd_d5 <= ddrio_nbencode_rd_d4;
 ddrio_nbencode_rd_d6 <= ddrio_nbencode_rd_d5;
 ddrio_nbencode_rd_d7 <= ddrio_nbencode_rd_d6;
 ddrio_nbencode_rd_d8 <= ddrio_nbencode_rd_d7;
 ddrio_nbencode_rd_d9 <= ddrio_nbencode_rd_d8;
 ddrio_nbencode_rd_d10 <= ddrio_nbencode_rd_d9;
 ddrio_nbencode_rd_d11 <= ddrio_nbencode_rd_d10;
 ddrio_nbencode_rd_d12 <= ddrio_nbencode_rd_d11;
 ddrio_nbencode_rd_d13 <= ddrio_nbencode_rd_d12;

end

always@(negedge capture_data)
 if ( nb_12 ) // we need to get rid off, ECC from DRAMs
  D <= { 8'h0, rbuffer_rd_data_in[63:0] };
 else if ( config_reg_rd_shft_data )
  D <= config_reg_data;
 else
  D <= rbuffer_rd_data_in;


/*
always@(posedge frm_boundary )
begin
end
*/

always@(negedge frm_begin )
begin
  E1_d <= E1;
  E_d <= E;
end

//assign DataCRC1 = E1;
//assign DataCRC2 = E1;

initial pn_curr_state=1;

always@(negedge dram_2x_clk )
begin

   case( pn_curr_state )
   `NB_ST_1: begin 

     pn0_reg[13:0] <= 6'h0;

     // Set ALERT bit all the time
      pn1_reg[13:0]  <= {6'h0,fbdimm7_set_thermal_trip[0],fbdimm6_set_thermal_trip[0],fbdimm5_set_thermal_trip[0],fbdimm4_set_thermal_trip[0],fbdimm3_set_thermal_trip[0],fbdimm2_set_thermal_trip[0],fbdimm1_set_thermal_trip[0],fbdimm0_set_thermal_trip[0]};
      pn2_reg[13:0]  <= {6'h0,fbdimm7_set_thermal_trip[1],fbdimm6_set_thermal_trip[1],fbdimm5_set_thermal_trip[1],fbdimm4_set_thermal_trip[1],fbdimm3_set_thermal_trip[1],fbdimm2_set_thermal_trip[1],fbdimm1_set_thermal_trip[1],fbdimm0_set_thermal_trip[1]};
      pn3_reg[13:0]  <= 14'h0;
      pn4_reg[13:0] <= 14'h3fff;


     // Set STATUS bit all the time
      pn5_reg[13:0]  <= 14'h1555;
      pn6_reg[13:0]  <= 14'h2aaa;
      pn7_reg[13:0]  <= 14'h1555;
      pn8_reg[13:0]  <= 14'h2aaa;
      pn9_reg[13:0]  <= 14'h1555;
      pn10_reg[13:0] <= 14'h2aaa;
      pn11_reg[13:0] <= 14'h1555;


              if (  ~rbuffer_empty ) begin
                get_rfifo_data <=1'b1;
                Data1          <= rbuffer_rd_data_in;
                DataCRC1 <= E1;
               pn_curr_state <= `NB_ST_2;
              end else begin
                data1_rdy <= 0;
                data2_rdy <= 0;
              end

             end
   `NB_ST_2: begin
          pn0_reg[13:0] <= {DataCRC1[0],DataCRC1[11],Data1[66],Data1[60],Data1[54],Data1[48],Data1[42],Data1[36],Data1[30],Data1[24],Data1[18],Data1[12],Data1[6],Data1[0]};
          pn1_reg[13:0] <= {DataCRC1[1],DataCRC1[10],Data1[67],Data1[61],Data1[55],Data1[49],Data1[43],Data1[37],Data1[31],Data1[25],Data1[19],Data1[13],Data1[7],Data1[1]};
          pn2_reg[13:0] <= {DataCRC1[2],DataCRC1[9],Data1[68],Data1[62],Data1[56],Data1[50],Data1[44],Data1[38],Data1[32],Data1[26],Data1[20],Data1[14],Data1[8],Data1[2]};
          pn3_reg[13:0] <= {DataCRC1[3],DataCRC1[8],Data1[69],Data1[63],Data1[57],Data1[51],Data1[45],Data1[39],Data1[33],Data1[27],Data1[21],Data1[15],Data1[9],Data1[3]};
          pn4_reg[13:0] <= {DataCRC1[4],DataCRC1[7],Data1[70],Data1[64],Data1[58],Data1[52],Data1[46],Data1[40],Data1[34],Data1[28],Data1[22],Data1[16],Data1[10],Data1[4]};
          pn5_reg[13:0] <= {DataCRC1[5],DataCRC1[6],Data1[71],Data1[65],Data1[59],Data1[53],Data1[47],Data1[41],Data1[35],Data1[29],Data1[23],Data1[17],Data1[11],Data1[5]};
          //data1_rdy <= 1;
          Data2 <= rbuffer_rd_data_in;
                DataCRC2 <= E1;
               pn_curr_state <= `NB_ST_3;
             end
   `NB_ST_3: begin  
          pn6_reg[13:0] <= {DataCRC2[0],DataCRC2[11],Data2[66],Data2[60],Data2[54],Data2[48],Data2[42],Data2[36],Data2[30],Data2[24],Data2[18],Data2[12],Data2[6],Data2[0]};
          pn7_reg[13:0] <= {DataCRC2[1],DataCRC2[10],Data2[67],Data2[61],Data2[55],Data2[49],Data2[43],Data2[37],Data2[31],Data2[25],Data2[19],Data2[13],Data2[7],Data2[1]};
          pn8_reg[13:0] <= {DataCRC2[2],DataCRC2[9],Data2[68],Data2[62],Data2[56],Data2[50],Data2[44],Data2[38],Data2[32],Data2[26],Data2[20],Data2[14],Data2[8],Data2[2]};
          pn9_reg[13:0] <= {DataCRC2[3],DataCRC2[8],Data2[69],Data2[63],Data2[57],Data2[51],Data2[45],Data2[39],Data2[33],Data2[27],Data2[21],Data2[15],Data2[9],Data2[3]};
          pn10_reg[13:0] <= {DataCRC2[4],DataCRC2[7],Data2[70],Data2[64],Data2[58],Data2[52],Data2[46],Data2[40],Data2[34],Data2[28],Data2[22],Data2[16],Data2[10],Data2[4]};
          pn11_reg[13:0] <= {DataCRC2[5],DataCRC2[6],Data2[71],Data2[65],Data2[59],Data2[53],Data2[47],Data2[41],Data2[35],Data2[29],Data2[23],Data2[17],Data2[11],Data2[5]};


              if (  ~rbuffer_empty ) begin
                get_rfifo_data <=1'b1;
                Data1          <= rbuffer_rd_data_in;
                DataCRC1 <= E1;
               pn_curr_state <= `NB_ST_2;
               data1_rdy <= 1;
              end else begin
                 pn_curr_state <= `NB_ST_4;
               data1_rdy <= 1;
               get_rfifo_data <=1'b0;
              end

             end
   `NB_ST_4: begin  

               pn_curr_state <= `NB_ST_1;
               data1_rdy <= 0;

     end


    endcase

end




always@(posedge frm_boundary_sb )
begin
  if  ( (send_status_frm_shft & (DS==0)) & !status1_rdy )
  begin
   status1_rdy <= 1;
   status2_rdy <= 0;
  end
  else if ( status1_rdy )
  begin
   status1_rdy <= 0;
   status2_rdy <= 1;
  end
  else begin
   status1_rdy <= 0;
   status2_rdy <= 0;
  end
   

end


reg data_rdy;
reg nb_data_rdy_d ;


always@(posedge frm_boundary_sb )
begin
    nb_data_rdy_d <= data1_rdy;
    pn0_reg_l  <= pn0_reg;
    pn1_reg_l  <= pn1_reg;
    pn2_reg_l  <= pn2_reg;
    pn3_reg_l  <= pn3_reg;
    pn4_reg_l  <= pn4_reg;
    pn5_reg_l  <= pn5_reg;
    pn6_reg_l  <= pn6_reg;
    pn7_reg_l  <= pn7_reg;
    pn8_reg_l  <= pn8_reg;
    pn9_reg_l  <= pn9_reg;
    pn10_reg_l <= pn10_reg;
    pn11_reg_l <= pn11_reg;

end




//wire  nb_status_rdy_d = nb_status_rdy;
reg nb_status_rdy_d;

always@(posedge frm_boundary_sb)
  nb_status_rdy_d<= nb_status_rdy;

assign pn0_out = ( nb_data_rdy_d  |   nb_status_rdy_d  ) ? pn0_reg_l : 
                 ( pn_bus_alert                ) ? ~pn0_idle_frame:
                 //( DS==Last_FBDimm_ID_REG      ) ? pn0_idle_frame : 
                 ( DS==0      ) ? pn0_idle_frame : 
                   sn_in;
assign pn1_out = 
                 ( nb_data_rdy_d  |   nb_status_rdy_d ) ? pn1_reg_l : 
                 ( pn_bus_alert                ) ? ~pn1_idle_frame:
                 //( DS==Last_FBDimm_ID_REG      ) ? pn1_idle_frame : 
                 ( DS==0      ) ? pn1_idle_frame : 
                   sn_in;
assign pn2_out = 
                 ( nb_data_rdy_d   |   nb_status_rdy_d ) ? pn2_reg_l :
                 ( pn_bus_alert                ) ? ~pn2_idle_frame:
                 //( DS==Last_FBDimm_ID_REG      ) ? pn2_idle_frame : 
                 ( DS==0      ) ? pn2_idle_frame : 
                   sn_in;
assign pn3_out = 
                 ( nb_data_rdy_d |   nb_status_rdy_d  ) ? pn3_reg_l :
                 ( pn_bus_alert                ) ? ~pn3_idle_frame:
                 //( DS==Last_FBDimm_ID_REG      ) ? pn3_idle_frame : 
                 ( DS==0      ) ? pn3_idle_frame : 
                    sn_in;
assign pn4_out = 
                 ( nb_data_rdy_d  |   nb_status_rdy_d ) ? pn4_reg_l : 
                 ( pn_bus_alert                ) ? ~pn4_idle_frame:
                 //( DS==Last_FBDimm_ID_REG      ) ? pn4_idle_frame : 
                 ( DS==0      ) ? pn4_idle_frame : 
                   sn_in;
assign pn5_out = 
                 ( nb_data_rdy_d   |   nb_status_rdy_d ) ? pn5_reg_l :
                 ( pn_bus_alert                ) ? ~pn5_idle_frame:
                  //( DS==Last_FBDimm_ID_REG) ? pn5_idle_frame : 
                  ( DS==0) ? pn5_idle_frame : 
                   sn_in;
assign pn6_out = 
                 ( nb_data_rdy_d  |   nb_status_rdy_d ) ? pn6_reg_l :
                 ( pn_bus_alert                ) ? ~pn6_idle_frame:
                  //( DS==Last_FBDimm_ID_REG) ? pn6_idle_frame : 
                  ( DS==0) ? pn6_idle_frame : 
                   sn_in;
assign pn7_out = 
                 ( nb_data_rdy_d   |   nb_status_rdy_d ) ? pn7_reg_l :
                 ( pn_bus_alert                ) ? ~pn7_idle_frame:
                  //( DS==Last_FBDimm_ID_REG     ) ? pn7_idle_frame : 
                  ( DS==0     ) ? pn7_idle_frame : 
                   sn_in; 
assign pn8_out = 
                 ( nb_data_rdy_d   |   nb_status_rdy_d ) ? pn8_reg_l :
                 ( pn_bus_alert                ) ? ~pn8_idle_frame:
                  //( DS==Last_FBDimm_ID_REG) ? pn8_idle_frame :
                  ( DS==0) ? pn8_idle_frame :
                   sn_in;
assign pn9_out = 
                 ( nb_data_rdy_d   |   nb_status_rdy_d )? pn9_reg_l : 
                 ( pn_bus_alert                ) ? ~pn9_idle_frame:
                 //( DS==Last_FBDimm_ID_REG) ? pn9_idle_frame : 
                 ( DS==0) ? pn9_idle_frame : 
                   sn_in;
assign pn10_out =
                 ( nb_data_rdy_d   |   nb_status_rdy_d ) ? pn10_reg_l :
                 ( pn_bus_alert                ) ? ~pn10_idle_frame:
                  //( DS==Last_FBDimm_ID_REG) ? pn10_idle_frame : 
                  ( DS==0) ? pn10_idle_frame : 
                   sn_in;
assign pn11_out = 
                 ( nb_data_rdy_d   |   nb_status_rdy_d ) ? pn11_reg_l :
                 ( pn_bus_alert                ) ? ~pn11_idle_frame:
                  //( DS==Last_FBDimm_ID_REG) ? pn11_idle_frame : 
                  ( DS==0) ? pn11_idle_frame : 
                   sn_in;

`else

assign pn0_out = 14'h0;
assign pn1_out = 14'h0;
assign pn2_out = 14'h0;
assign pn3_out = 14'h0;
assign pn4_out = 14'h0;
assign pn5_out = 14'h0;
assign pn6_out = 14'h0;
assign pn7_out = 14'h0;
assign pn8_out = 14'h0;
assign pn9_out = 14'h0;
assign pn10_out = 14'h0;
assign pn11_out = 14'h0;

always@(posedge link_clk)
  pn_curr_state <= pn_next_state;

always@(posedge capture_data)
 if ( nb_12 ) // we need to get rid off, ECC from DRAMs
  D <= { 8'h0, rbuffer_rd_data_in[63:0] };
 else if ( config_reg_rd_shft_data )
  D <= config_reg_data;
 else
  D <= rbuffer_rd_data_in;


// Main FSM
always@(negedge link_clk) // pn_curr_state or send_status_frm_shft or config_reg_rd or rbuffer_empty 
begin
  case(pn_curr_state)
   `NB_ST_1: begin 
             if ( frm_begin ) begin
               if ( send_status_frm_shft ) begin
                 CD = 0;  // for now
                 pn_data_reg = 0;

                 status_reg0[3:0]=4'h0;
                 status_reg1[3:0]=4'h0;
                 status_reg2[3:0]=4'h0;
                 status_reg3[3:0]=4'h0;
                 status_reg4[3:0]=4'h0;
                 status_reg5[3:0]=4'h0;
                 status_reg6[3:0]=4'h0;
                 status_reg7[3:0]=4'h0;


                 if ( fbdimm0_set_status_alert_bit_always ) begin
                   status_reg0[0]=4'h1;
                 end
                 else if ( fbdimm0_set_status_alert_bit > 0) begin
                   status_reg0[0]=4'h1;
                   fbdimm0_set_status_alert_bit = fbdimm0_set_status_alert_bit - 1;
                 end

		 if( fbdimm1_set_status_alert_bit_always ) begin
                   status_reg1[0] = 4'h1;
		 end
		 else if(fbdimm1_set_status_alert_bit > 0) begin
		   status_reg1[0] = 4'h1;
		   fbdimm1_set_status_alert_bit = fbdimm1_set_status_alert_bit - 1;
		 end 

		 if( fbdimm2_set_status_alert_bit_always ) begin
                   status_reg2[0] = 4'h1;
		 end
                 else if(fbdimm2_set_status_alert_bit > 0) begin
                   status_reg2[0] = 4'h1;
		   fbdimm2_set_status_alert_bit = fbdimm2_set_status_alert_bit - 1;
                 end 

		 if( fbdimm3_set_status_alert_bit_always ) begin
                   status_reg3[0] = 4'h1;
		 end
                 else if(fbdimm3_set_status_alert_bit > 0) begin
                   status_reg3[0] = 4'h1;
                   fbdimm3_set_status_alert_bit = fbdimm3_set_status_alert_bit - 1;
                 end 

		 if( fbdimm4_set_status_alert_bit_always ) begin
                   status_reg4[0] = 4'h1;
		 end
                 else if(fbdimm4_set_status_alert_bit > 0) begin
                   status_reg4[0] = 4'h1;
                   fbdimm4_set_status_alert_bit = fbdimm4_set_status_alert_bit - 1;
                 end 

                 if( fbdimm5_set_status_alert_bit_always ) begin
                   status_reg5[0] = 4'h1;
		 end
                 else if(fbdimm5_set_status_alert_bit > 0) begin
                   status_reg5[0] = 4'h1;
                   fbdimm5_set_status_alert_bit = fbdimm5_set_status_alert_bit - 1;
                 end 

                 if( fbdimm6_set_status_alert_bit_always ) begin
                   status_reg6[0] = 4'h1;
		 end
                 else if(fbdimm6_set_status_alert_bit > 0) begin
                   status_reg6[0] = 4'h1;
                   fbdimm6_set_status_alert_bit = fbdimm6_set_status_alert_bit - 1;
                 end 

		 if( fbdimm7_set_status_alert_bit_always ) begin
                   status_reg7[0] = 4'h1;
		 end
		 else if(fbdimm7_set_status_alert_bit > 0) begin
                   status_reg7[0] = 4'h1;
                   fbdimm7_set_status_alert_bit = fbdimm7_set_status_alert_bit - 1;
		 end

                 status_reg0[1] = fbdimm0_set_thermal_trip[0];
                 status_reg1[1] = fbdimm1_set_thermal_trip[0];
                 status_reg2[1] = fbdimm2_set_thermal_trip[0];
                 status_reg3[1] = fbdimm3_set_thermal_trip[0];
                 status_reg4[1] = fbdimm4_set_thermal_trip[0];
                 status_reg5[1] = fbdimm5_set_thermal_trip[0];
                 status_reg6[1] = fbdimm6_set_thermal_trip[0];
                 status_reg7[1] = fbdimm7_set_thermal_trip[0];

                 status_reg0[2] = fbdimm0_set_thermal_trip[1];
                 status_reg1[2] = fbdimm1_set_thermal_trip[1];
                 status_reg2[2] = fbdimm2_set_thermal_trip[1];
                 status_reg3[2] = fbdimm3_set_thermal_trip[1];
                 status_reg4[2] = fbdimm4_set_thermal_trip[1];
                 status_reg5[2] = fbdimm5_set_thermal_trip[1];
                 status_reg6[2] = fbdimm6_set_thermal_trip[1];
                 status_reg7[2] = fbdimm7_set_thermal_trip[1];

                if ( fbdimm0_set_status_parity_bit_always ) 
                   status_reg0[4]=(status_reg0[3] ^ status_reg0[2] ^ status_reg0[1] ^ status_reg0[0]); // even parity
                else if ( fbdimm0_set_status_parity_bit > 0) begin
                   status_reg0[4]=(status_reg0[3] ^ status_reg0[2] ^ status_reg0[1] ^ status_reg0[0]); // even parity
                   fbdimm0_set_status_parity_bit = fbdimm0_set_status_parity_bit - 1;
                end
                else
                   status_reg0[4]=~(status_reg0[3] ^ status_reg0[2] ^ status_reg0[1] ^ status_reg0[0]); // odd parity
                
                if ( fbdimm1_set_status_parity_bit_always ) 
                   status_reg1[4]=(status_reg1[3] ^ status_reg1[2] ^ status_reg1[1] ^ status_reg1[0]); // even parity
                else if ( fbdimm1_set_status_parity_bit > 0) begin
                   status_reg1[4]=(status_reg1[3] ^ status_reg1[2] ^ status_reg1[1] ^ status_reg1[0]); // even parity
                   fbdimm1_set_status_parity_bit = fbdimm1_set_status_parity_bit - 1;
                end
                else
                   status_reg1[4]=~(status_reg1[3] ^ status_reg1[2] ^ status_reg1[1] ^ status_reg1[0]); // odd parity

                if ( fbdimm2_set_status_parity_bit_always ) 
                   status_reg2[4]=(status_reg2[3] ^ status_reg2[2] ^ status_reg2[1] ^ status_reg2[0]); // even parity
                else if ( fbdimm2_set_status_parity_bit > 0) begin
                   status_reg2[4]=(status_reg2[3] ^ status_reg2[2] ^ status_reg2[1] ^ status_reg2[0]); // even parity
                   fbdimm2_set_status_parity_bit = fbdimm2_set_status_parity_bit - 1;
                end
                else
                   status_reg2[4]=~(status_reg2[3] ^ status_reg2[2] ^ status_reg2[1] ^ status_reg2[0]); // odd parity

                if ( fbdimm3_set_status_parity_bit_always ) 
                   status_reg3[4]=(status_reg3[3] ^ status_reg3[2] ^ status_reg3[1] ^ status_reg3[0]); // even parity
                else if ( fbdimm3_set_status_parity_bit > 0) begin
                   status_reg3[4]=(status_reg3[3] ^ status_reg3[2] ^ status_reg3[1] ^ status_reg3[0]); // even parity
                   fbdimm3_set_status_parity_bit = fbdimm3_set_status_parity_bit - 1;
                end
                else
                   status_reg3[4]=~(status_reg3[3] ^ status_reg3[2] ^ status_reg3[1] ^ status_reg3[0]); // odd parity

                if ( fbdimm4_set_status_parity_bit_always ) 
                   status_reg4[4]=(status_reg4[3] ^ status_reg4[2] ^ status_reg4[1] ^ status_reg4[0]); // even parity
                else if ( fbdimm4_set_status_parity_bit > 0) begin
                   status_reg4[4]=(status_reg4[3] ^ status_reg4[2] ^ status_reg4[1] ^ status_reg4[0]); // even parity
                   fbdimm4_set_status_parity_bit = fbdimm4_set_status_parity_bit - 1;
                end
                else
                   status_reg4[4]=~(status_reg4[3] ^ status_reg4[2] ^ status_reg4[1] ^ status_reg4[0]); // odd parity

                if ( fbdimm5_set_status_parity_bit_always ) 
                   status_reg5[4]=(status_reg5[3] ^ status_reg5[2] ^ status_reg5[1] ^ status_reg5[0]); // even parity
                else if ( fbdimm5_set_status_parity_bit > 0) begin
                   status_reg5[4]=(status_reg5[3] ^ status_reg5[2] ^ status_reg5[1] ^ status_reg5[0]); // even parity
                   fbdimm5_set_status_parity_bit = fbdimm5_set_status_parity_bit - 1;
                end
                else
                   status_reg5[4]=~(status_reg5[3] ^ status_reg5[2] ^ status_reg5[1] ^ status_reg5[0]); // odd parity

                if ( fbdimm6_set_status_parity_bit_always ) 
                   status_reg6[4]=(status_reg6[3] ^ status_reg6[2] ^ status_reg6[1] ^ status_reg6[0]); // even parity
                else if ( fbdimm6_set_status_parity_bit > 0) begin
                   status_reg6[4]=(status_reg6[3] ^ status_reg6[2] ^ status_reg6[1] ^ status_reg6[0]); // even parity
                   fbdimm6_set_status_parity_bit = fbdimm6_set_status_parity_bit - 1;
                end
                else
                   status_reg6[4]=~(status_reg6[3] ^ status_reg6[2] ^ status_reg6[1] ^ status_reg6[0]); // odd parity

                if ( fbdimm7_set_status_parity_bit_always ) 
                   status_reg7[4]=(status_reg7[3] ^ status_reg7[2] ^ status_reg7[1] ^ status_reg7[0]); // even parity
                else if ( fbdimm7_set_status_parity_bit ) begin
                   status_reg7[4]=(status_reg7[3] ^ status_reg7[2] ^ status_reg7[1] ^ status_reg7[0]); // even parity
                   fbdimm7_set_status_parity_bit = fbdimm7_set_status_parity_bit - 1;
                end
                else
                   status_reg7[4]=~(status_reg7[3] ^ status_reg7[2] ^ status_reg7[1] ^ status_reg7[0]); // odd parity

//`ifdef STINGRAY_FBDIMM_STATUS
                  if (Last_FBDimm_ID_REG == 0 ) // 1 fbdimm
                  begin
                    status_reg7[4]=0; 
                    status_reg6[4]=0; 
                    status_reg5[4]=0; 
                    status_reg4[4]=0; 
                    status_reg3[4]=0; 
                    status_reg2[4]=0; 
                    status_reg1[4]=0;
                  end
                  if (Last_FBDimm_ID_REG == 1 ) // 2 fbdimm
                  begin
                    status_reg7[4]=0; status_reg6[4]=0; status_reg5[4]=0; status_reg4[4]=0; status_reg3[4]=0; status_reg2[4]=0;
                  end
                  if (Last_FBDimm_ID_REG == 2 ) // 3 fbdimm
                  begin
                    status_reg7[4]=0; status_reg6[4]=0; status_reg5[4]=0; status_reg4[4]=0; status_reg3[4]=0; 
                  end
                  if (Last_FBDimm_ID_REG == 3 ) // 4 fbdimm
                  begin
                    status_reg7[4]=0; status_reg6[4]=0; status_reg5[4]=0; status_reg4[4]=0;  
                  end
                  if (Last_FBDimm_ID_REG == 4 ) // 5 fbdimm
                  begin
                    status_reg7[4]=0; status_reg6[4]=0; status_reg5[4]=0;   
                  end
                  if (Last_FBDimm_ID_REG == 5 ) // 6 fbdimm
                  begin
                    status_reg7[4]=0; status_reg6[4]=0;
                  end
                  if (Last_FBDimm_ID_REG == 6 ) // 7 fbdimm
                  begin
                    status_reg7[4]=0; 
                  end
//`endif

                 send_status_frm_reg = 1;
                 rbuffer_rd_reg =1'b0;
                 pn_next_state= `NB_ST_2;
                 pn_data_reg = {6'h0,status_reg7[0],status_reg6[0],status_reg5[0],status_reg4[0],status_reg3[0],status_reg2[0],status_reg1[0],status_reg0[0]};

               end
              else if ( ~rbuffer_empty )
               begin
                 get_rfifo_data =1'b1;
                 CD = rbuffer_rd_data_in;
                 pn_next_state= `NB_ST_2;
                 rbuffer_rd_reg =1'b1;
                 send_status_frm_reg = 0;
                //if ( fbdreg_mtr[6] == 0 ) begin
                  if ( failover_nb_14)
                   pn_data_reg[13:0] =   {1'b0,E[0],CD[66],CD[60],CD[54],CD[48],CD[42],CD[36],CD[30],CD[24],CD[18],CD[12],CD[6],CD[0]};
                  else if (failover_nb_13)
                   pn_data_reg[13:0] = {1'b0,1'b0,CD[66],CD[60],CD[54],CD[48],CD[42],CD[36],CD[30],CD[24],CD[18],CD[12],CD[6],CD[0]};
                  else if (nb_12)
                   pn_data_reg[13:0] = {1'b0,1'b0,E[0],CD[60],CD[54],CD[48],CD[42],CD[36],CD[30],CD[24],CD[18],CD[12],CD[6],CD[0]};
                  else
                   pn_data_reg[13:0] =   {E[0],E[11],CD[66],CD[60],CD[54],CD[48],CD[42],CD[36],CD[30],CD[24],CD[18],CD[12],CD[6],CD[0]};
               // end else begin
               //   if ( failover_nb_14)
               //    pn_data_reg[13:0] =  {1'b0,E[0],CD[26],CD[43],CD[60],CD[6],CD[23],CD[40],CD[57],CD[3],CD[20],CD[37],CD[54],CD[0]};
               //   else if ( failover_nb_13)
               //    pn_data_reg[13:0] =  {1'b0,1'b0,CD[26],CD[43],CD[60],CD[6],CD[23],CD[40],CD[57],CD[3],CD[20],CD[37],CD[54],CD[0]};
               //   else if ( nb_12)
                //   pn_data_reg[13:0] = {1'b0,1'b0,E[0],CD[43],CD[60],CD[6],CD[23],CD[40],CD[57],CD[3],CD[20],CD[37],CD[54],CD[0]};
                //  else
                //   pn_data_reg[13:0] =   {E[0],E[11],CD[26],CD[43],CD[60],CD[6],CD[23],CD[40],CD[57],CD[3],CD[20],CD[37],CD[54],CD[0]};
               //  end
               end
               else if ( config_reg_rd_shft ) begin
                 CD = config_reg_data;
                 send_reg_data=1;
                 send_status_frm_reg = 0;
                 pn_next_state= `NB_ST_2;
                if (failover_nb_14)
                 pn_data_reg[13:0] =  {1'b0,E[0],1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,CD[30],CD[24],CD[18],CD[12],CD[6],CD[0]};
                else if (failover_nb_13)
                 pn_data_reg[13:0] =  {1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,CD[30],CD[24],CD[18],CD[12],CD[6],CD[0]};
                else if (nb_12)
                 pn_data_reg[13:0] =  {1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,CD[30],CD[24],CD[18],CD[12],CD[6],CD[0]};
                else
                 pn_data_reg[13:0] =   {E[0],E[11],1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,CD[30],CD[24],CD[18],CD[12],CD[6],CD[0]};

               end
               else begin
                 rbuffer_rd_reg =1'b0;
                 send_reg_data=0;
                 send_status_frm_reg=0;
               end
              end // if frm_begin

            pn0 = pn_data_reg;
            end
   `NB_ST_2: begin
            //  rbuffer_rd_reg =1'b1;
              get_rfifo_data =1'b0;
              pn_next_state= `NB_ST_3;
              if ( rbuffer_rd_reg )
               if (failover_nb_14)
                pn_data_reg[13:0] = {1'b0,E[1],CD[67],CD[61],CD[55],CD[49],CD[43],CD[37],CD[31],CD[25],CD[19],CD[13],CD[7],CD[1]};
               else if (failover_nb_13)
                pn_data_reg[13:0] = {1'b0,1'b0,CD[67],CD[61],CD[55],CD[49],CD[43],CD[37],CD[31],CD[25],CD[19],CD[13],CD[7],CD[1]};
               else if (nb_12)
                pn_data_reg[13:0] = {1'b0,1'b0,E[1],CD[61],CD[55],CD[49],CD[43],CD[37],CD[31],CD[25],CD[19],CD[13],CD[7],CD[1]};
               else
                pn_data_reg[13:0] = {E[1],E[10],CD[67],CD[61],CD[55],CD[49],CD[43],CD[37],CD[31],CD[25],CD[19],CD[13],CD[7],CD[1]};
              else if ( send_reg_data )begin
              if ( failover_nb_14 )
               pn_data_reg[13:0] = {1'b0,E[1],1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,CD[31],CD[25],CD[19],CD[13],CD[7],CD[1]};
              else if ( failover_nb_13 )
               pn_data_reg[13:0] = {1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,CD[31],CD[25],CD[19],CD[13],CD[7],CD[1]};
              else if ( nb_12 )
               pn_data_reg[13:0] = {1'b0,1'b0,E[0],1'b0,1'b0,1'b0,1'b0,1'b0,CD[31],CD[25],CD[19],CD[13],CD[7],CD[1]};
              else
               pn_data_reg[13:0] = {E[1],E[10],1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,CD[31],CD[25],CD[19],CD[13],CD[7],CD[1]};

              end
              else if ( send_status_frm_reg )
              begin
                 pn_data_reg = {6'h0,status_reg7[1],status_reg6[1],status_reg5[1],status_reg4[1],status_reg3[1],status_reg2[1],status_reg1[1],status_reg0[1]};
              end

            pn1 = pn_data_reg;

            end
   `NB_ST_3: begin 
             if ( rbuffer_rd_reg )
                if (failover_nb_14 )
                 pn_data_reg[13:0] = {1'b0,E[2],CD[68],CD[62],CD[56],CD[50],CD[44],CD[38],CD[32],CD[26],CD[20],CD[14],CD[8],CD[2]};
                else if (failover_nb_13 )
                 pn_data_reg[13:0] = {1'b0,1'b0,CD[68],CD[62],CD[56],CD[50],CD[44],CD[38],CD[32],CD[26],CD[20],CD[14],CD[8],CD[2]};
                else if (nb_12 )
                 pn_data_reg[13:0] = {1'b0,1'b0,E[2],CD[62],CD[56],CD[50],CD[44],CD[38],CD[32],CD[26],CD[20],CD[14],CD[8],CD[2]};
                else
                 pn_data_reg[13:0] = {E[2],E[9],CD[68],CD[62],CD[56],CD[50],CD[44],CD[38],CD[32],CD[26],CD[20],CD[14],CD[8],CD[2]};
             else if ( send_reg_data ) begin
               if(failover_nb_14)
                 pn_data_reg[13:0] =  {1'b0,E[2],1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,CD[26],CD[20],CD[14],CD[8],CD[2]};
               else if(failover_nb_13)
                 pn_data_reg[13:0] =  {1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,CD[26],CD[20],CD[14],CD[8],CD[2]};
               else if(nb_12)
                 pn_data_reg[13:0] =  {1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,CD[26],CD[20],CD[14],CD[8],CD[2]};
               else 
                pn_data_reg[13:0] =   {E[2],E[9],1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,CD[26],CD[20],CD[14],CD[8],CD[2]};

             end
              else if ( send_status_frm_reg )
              begin
                 pn_data_reg = {6'h0,status_reg7[2],status_reg6[2],status_reg5[2],status_reg4[2],status_reg3[2],status_reg2[2],status_reg1[2],status_reg0[2]};
              end


            pn_next_state= `NB_ST_4;
            pn2 = pn_data_reg;
            end
   `NB_ST_4: begin 
              pn_next_state=`NB_ST_5;

             if (rbuffer_rd_reg )
              if (failover_nb_14 )
                pn_data_reg[13:0] = {1'b0,E[3],CD[69],CD[63],CD[57],CD[51],CD[45],CD[39],CD[33],CD[27],CD[21],CD[15],CD[9],CD[3]};
              else if (failover_nb_13 )
                pn_data_reg[13:0] = {1'b0,1'b0,CD[69],CD[63],CD[57],CD[51],CD[45],CD[39],CD[33],CD[27],CD[21],CD[15],CD[9],CD[3]};
              else if (nb_12 )
                pn_data_reg[13:0] = {1'b0,1'b0,E[3],CD[63],CD[57],CD[51],CD[45],CD[39],CD[33],CD[27],CD[21],CD[15],CD[9],CD[3]};
              else
                pn_data_reg[13:0] = {E[3],E[8],CD[69],CD[63],CD[57],CD[51],CD[45],CD[39],CD[33],CD[27],CD[21],CD[15],CD[9],CD[3]};
             else if ( send_reg_data ) begin
              if(failover_nb_14)
               pn_data_reg[13:0] =   {1'b0,E[3],1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,CD[27],CD[21],CD[15],CD[9],CD[3]};
              else if(failover_nb_13)
               pn_data_reg[13:0] =   {1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,CD[27],CD[21],CD[15],CD[9],CD[3]};
              else if(nb_12)
               pn_data_reg[13:0] =   {1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,CD[27],CD[21],CD[15],CD[9],CD[3]};
              else
               pn_data_reg[13:0] =   {E[3],E[8],1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,CD[27],CD[21],CD[15],CD[9],CD[3]};

             end
              else if ( send_status_frm_reg )
              begin
                 pn_data_reg = {6'h0,status_reg7[3],status_reg6[3],status_reg5[3],status_reg4[3],status_reg3[3],status_reg2[3],status_reg1[3],status_reg0[3]};

              end

            pn3 = pn_data_reg;
           end
   `NB_ST_5: begin
              pn_next_state= `NB_ST_6;
             if ( rbuffer_rd_reg )
               if(failover_nb_14)
                pn_data_reg[13:0] = {1'b0,E[4],CD[70],CD[64],CD[58],CD[52],CD[46],CD[40],CD[34],CD[28],CD[22],CD[16],CD[10],CD[4]};
               else if(failover_nb_13)
                pn_data_reg[13:0] = {1'b0,1'b0,CD[70],CD[64],CD[58],CD[52],CD[46],CD[40],CD[34],CD[28],CD[22],CD[16],CD[10],CD[4]};
               else if(nb_12)
                pn_data_reg[13:0] = {1'b0,1'b0,E[4],1'b0,CD[58],CD[52],CD[46],CD[40],CD[34],CD[28],CD[22],CD[16],CD[10],CD[4]};
               else
                pn_data_reg[13:0] = {E[4],E[7],CD[70],CD[64],CD[58],CD[52],CD[46],CD[40],CD[34],CD[28],CD[22],CD[16],CD[10],CD[4]};
             else if ( send_reg_data ) begin
               if(failover_nb_14)
                pn_data_reg[13:0] =   {1'b0,E[4],1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,CD[28],CD[22],CD[16],CD[10],CD[4]};
               else if(failover_nb_13)
                pn_data_reg[13:0] =   {1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,CD[28],CD[22],CD[16],CD[10],CD[4]};
               else if(nb_12)
                pn_data_reg[13:0] =   {1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,CD[28],CD[22],CD[16],CD[10],CD[4]};
               else
                pn_data_reg[13:0] =   {E[4],E[7],1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,CD[28],CD[22],CD[16],CD[10],CD[4]};

             end
              else if ( send_status_frm_reg )
              begin
//`ifdef STINGRAY_FBDIMM_STATUS
                  pn_data_reg[11:0] =  {4'b0000,status_reg7[4],status_reg6[4],status_reg5[4],status_reg4[4],status_reg3[4],status_reg2[4],status_reg1[4],status_reg0[4]};
//`else
//                  pn_data_reg[11:0] =  {4'b1111,status_reg7[4],status_reg6[4],status_reg5[4],status_reg4[4],status_reg3[4],status_reg2[4],status_reg1[4],status_reg0[4]};
//`endif
              end 

            pn4 = pn_data_reg;

            end
   `NB_ST_6: begin
              pn_next_state=`NB_ST_7;
             if ( rbuffer_rd_reg ) begin
              pn_next_state=`NB_ST_1;
                if(failover_nb_14)
                 pn_data_reg[13:0] = {1'b0,E[5],CD[71],CD[65],CD[59],CD[53],CD[47],CD[41],CD[35],CD[29],CD[23],CD[17],CD[11],CD[5]};
                else if(failover_nb_13)
                 pn_data_reg[13:0] = {1'b0,1'b0,CD[71],CD[65],CD[59],CD[53],CD[47],CD[41],CD[35],CD[29],CD[23],CD[17],CD[11],CD[5]};
                else if(nb_12)
                 pn_data_reg[13:0] = {1'b0,1'b0,E[5],1'b0,CD[59],CD[53],CD[47],CD[41],CD[35],CD[29],CD[23],CD[17],CD[11],CD[5]};
                else
                 pn_data_reg[13:0] =  {E[5],E[6],CD[71],CD[65],CD[59],CD[53],CD[47],CD[41],CD[35],CD[29],CD[23],CD[17],CD[11],CD[5]};
             end
             else if ( send_reg_data ) begin
               if(failover_nb_14)     
                 pn_data_reg[13:0] =   {1'b0,E[5],1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,CD[29],CD[23],CD[17],CD[11],CD[5]};
               else if(failover_nb_13)     
                 pn_data_reg[13:0] =   {1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,CD[29],CD[23],CD[17],CD[11],CD[5]};
               else if(nb_12)     
                 pn_data_reg[13:0] =   {1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,CD[29],CD[23],CD[17],CD[11],CD[5]};
               else
                 pn_data_reg[13:0] =   {E[5],E[6],1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,CD[29],CD[23],CD[17],CD[11],CD[5]};
               //pn_next_state=`NB_ST_1;
 
             end
             else if ( send_status_frm_reg )
              begin
                pn_data_reg[13:0]=14'b01010101010101;
               
              end

            pn5 = pn_data_reg;

            end
   `NB_ST_7: begin

             if ( send_reg_data ) begin

               if(failover_nb_14)     
                 pn_data_reg[13:0] =  14'h0;
               else if(failover_nb_13)     
                 pn_data_reg[13:0] =  14'h0;
               else if(nb_12)     
                 pn_data_reg[13:0] =  14'h0;
               else
                 pn_data_reg[13:0] =  14'h0;

             pn_next_state=`NB_ST_9;

             end
             else if ( send_status_frm_reg ) begin
                pn_next_state=`NB_ST_9;
                pn_data_reg[13:0]=14'b10101010101010;

             end
             else if ( send_reg_data ) begin
                pn_next_state=`NB_ST_9;
                pn_data_reg[13:0]=14'h0;
             end

            pn6 = pn_data_reg;
            end
   `NB_ST_9: begin

             if ( send_reg_data ) begin

               if(failover_nb_14)     
                 pn_data_reg[13:0] =  14'h0;
               else if(failover_nb_13)     
                 pn_data_reg[13:0] =  14'h0;
               else if(nb_12)     
                 pn_data_reg[13:0] =  14'h0;
               else
                 pn_data_reg[13:0] =  14'h0;

             end
             else begin
              pn_data_reg[13:0]=14'b01010101010101;
             end
              pn7 = pn_data_reg;
              pn_next_state=`NB_ST_10;

             end
   `NB_ST_10: begin

             if ( send_reg_data ) begin

               if(failover_nb_14)     
                 pn_data_reg[13:0] =  14'h0;
               else if(failover_nb_13)     
                 pn_data_reg[13:0] =  14'h0;
               else if(nb_12)     
                 pn_data_reg[13:0] =  14'h0;
               else
                 pn_data_reg[13:0] =  14'h0;

             end
             else
               pn_data_reg[13:0]=14'b10101010101010;

               pn_next_state=`NB_ST_11;
               pn8 = pn_data_reg;
             end
   `NB_ST_11: begin

             if ( send_reg_data ) begin

               if(failover_nb_14)     
                 pn_data_reg[13:0] =  14'h0;
               else if(failover_nb_13)     
                 pn_data_reg[13:0] =  14'h0;
               else if(nb_12)     
                 pn_data_reg[13:0] =  14'h0;
               else
                 pn_data_reg[13:0] =  14'h0;

             end
             else
               pn_data_reg[13:0]=14'b01010101010101;

               pn_next_state=`NB_ST_12;
               pn9 = pn_data_reg;
             end
   `NB_ST_12: begin

             if ( send_reg_data ) begin

               if(failover_nb_14)     
                 pn_data_reg[13:0] =  14'h0;
               else if(failover_nb_13)     
                 pn_data_reg[13:0] =  14'h0;
               else if(nb_12)     
                 pn_data_reg[13:0] =  14'h0;
               else
                 pn_data_reg[13:0] =  14'h0;

             end
             else
               pn_data_reg[13:0]=14'b10101010101010;

               pn_next_state=`NB_ST_13;
               pn10 = pn_data_reg;
             end
   `NB_ST_13: begin
             if ( send_reg_data ) begin

               if(failover_nb_14)     
                 pn_data_reg[13:0] =  14'h0;
               else if(failover_nb_13)     
                 pn_data_reg[13:0] =  14'h0;
               else if(nb_12)     
                 pn_data_reg[13:0] =  14'h0;
               else
                 pn_data_reg[13:0] =  14'h0;

             end
             else
               pn_data_reg[13:0]=14'b01010101010101;

               pn_next_state=`NB_ST_1;
               pn11 = pn_data_reg;
             end

  endcase
end

`endif // FBDIMM_FAST

`ifdef FBDIMM_FAST_IDLE

idle_lfsr idle_frame_generator( .reset (send_status_frm ),
                                .pn0_out (pn0_idle_frame),
                                .pn1_out (pn1_idle_frame),
                                .pn2_out (pn2_idle_frame),
                                .pn3_out (pn3_idle_frame),
                                .pn4_out (pn4_idle_frame),
                                .pn5_out (pn5_idle_frame),
                                .pn6_out (pn6_idle_frame),
                                .pn7_out (pn7_idle_frame),
                                .pn8_out (pn8_idle_frame),
                                .pn9_out (pn9_idle_frame),
                                .pn10_out (pn10_idle_frame),
                                .pn11_out (pn11_idle_frame),
                                .frm_begin ( frm_begin),
                                .frm_boundary ( frm_boundary_sb),
                                .drc (drc),
                                .clk (clk_int));

assign pn_bus_alert_frame0 = (pn0_idle_frame !== 14'h0) ? ~pn0_idle_frame : 14'h0;
assign pn_bus_alert_frame1 = (pn1_idle_frame !== 14'h0) ? ~pn1_idle_frame :  14'h0;
assign pn_bus_alert_frame2 = (pn2_idle_frame !== 14'h0) ? ~pn2_idle_frame : 14'h0;
assign pn_bus_alert_frame3 = (pn3_idle_frame !== 14'h0) ? ~pn3_idle_frame : 14'h0;
assign pn_bus_alert_frame4 = (pn4_idle_frame !== 14'h0) ? ~pn4_idle_frame : 14'h0;
assign pn_bus_alert_frame5 = (pn5_idle_frame !== 14'h0) ? ~pn5_idle_frame : 14'h0;
assign pn_bus_alert_frame6 = (pn6_idle_frame !== 14'h0) ? ~pn6_idle_frame : 14'h0;
assign pn_bus_alert_frame7 = (pn7_idle_frame !== 14'h0) ? ~pn7_idle_frame : 14'h0;
assign pn_bus_alert_frame8 = (pn8_idle_frame !== 14'h0) ? ~pn8_idle_frame : 14'h0;
assign pn_bus_alert_frame9 = (pn9_idle_frame !== 14'h0) ? ~pn9_idle_frame : 14'h0;
assign pn_bus_alert_frame10 = (pn10_idle_frame !== 14'h0) ? ~pn10_idle_frame : 14'h0;
assign pn_bus_alert_frame11 = (pn11_idle_frame !== 14'h0) ? ~pn11_idle_frame : 14'h0;

 
`else
assign pn_bus_alert_frame = (pn_idle_frame !== 14'h0) ? ~pn_idle_frame : 14'h0;



// Idle frame generator module
idle_lfsr idle_frame_generator ( .reset (send_status_frm ),
                                 .dtm_reset ( send_status_frm_shft),
                                .lfsr_output (pn_idle_frame), 
                                .frm_boundary ( frm_boundary_sb ),
                                .frm_begin ( frm_begin ),
                                .electrical_idle (electrical_idle),   
                                .clk (link_clk));

`endif


`ifdef FBDIMM_FAST_NB
// CRC calculator for data
crc nb_crc_gen2( .b (B1 ),
                .E_out (E1) ,
                .failover ( nb_config !== 4'hf) );

`endif

// CRC calculator for data
crc nb_crc_gen( .b (B ),
                .E_out (E),
                .failover ( nb_config !== 4'hf) );

wire [7:0] status_delay = 8'h84;




`ifdef AXIS_FBDIMM_NO_FSR
`else
dff_fbd #(1) ff1( .signal_in   (send_status_frm),
                  .signal_out  (send_status_frm_d[1]),
                  .clk (link_clk));
dff_fbd #(1) ff2( .signal_in   (send_status_frm_d[1]),
                  .signal_out  (send_status_frm_d[2]),
                  .clk (link_clk));
dff_fbd #(1) ff3( .signal_in   (send_status_frm_d[2]),
                  .signal_out  (send_status_frm_d[3]),
                  .clk (link_clk));
dff_fbd #(1) ff4( .signal_in   (send_status_frm_d[3]),
                  .signal_out  (send_status_frm_d[4]),
                  .clk (link_clk));
dff_fbd #(1) ff5( .signal_in   (send_status_frm_d[4]),
                  .signal_out  (send_status_frm_d[5]),
                  .clk (link_clk));
dff_fbd #(1) ff6( .signal_in   (send_status_frm_d[5]),
                  .signal_out  (send_status_frm_d[6]),
                  .clk (link_clk));
dff_fbd #(1) ff7( .signal_in   (send_status_frm_d[6]),
                  .signal_out  (send_status_frm_d[7]),
                  .clk (link_clk));
dff_fbd #(1) ff8( .signal_in   (send_status_frm_d[7]),
                  .signal_out  (send_status_frm_d[8]),
                  .clk (link_clk));
dff_fbd #(1) ff9( .signal_in   (send_status_frm_d[8]),
                  .signal_out  (send_status_frm_d[9]),
                  .clk (link_clk));
dff_fbd #(1) ff10( .signal_in   (send_status_frm_d[9]),
                  .signal_out  (send_status_frm_d[10]),
                  .clk (link_clk));
dff_fbd #(1) ff11( .signal_in   (send_status_frm_d[10]),
                  .signal_out  (send_status_frm_d[11]),
                  .clk (link_clk));
dff_fbd #(1) ff12( .signal_in   (send_status_frm_d[11]),
                  .signal_out  (send_status_frm_d[12]),
                  .clk (link_clk));
dff_fbd #(1) ff13( .signal_in   (send_status_frm_d[12]),
                  .signal_out  (send_status_frm_d[13]),
                  .clk (link_clk));

`endif // AXIS_FBDIMM_HW

wire [NB_LINK-1:0] pn_shft_wire;
reg [7:0] fbdreg_local_cmd_to_data,fbdreg_local_cmd_to_data_inc;

initial begin
fbdreg_local_cmd_to_data =0;
fbdreg_local_cmd_to_data_inc=0;
end

wire [9:0] delay_reg= (send_status_frm_reg || (DS!==0) ) ? 10'h0 :  (  ((fbdreg_local_cmd_to_data * 10'hc ) +  fbdreg_local_cmd_to_data_inc ) )  ;


`ifdef FBDIMM_FAST_NB
`else
always@(posedge link_clk) begin
if ( init )
 begin
  fbdreg_local_cmd_to_data <= fbdreg_next_cmd_to_data;
  fbdreg_local_cmd_to_data_inc <= fbdreg_next_cmd_to_data_inc;
 end
 else begin
  fbdreg_local_cmd_to_data <= fbdreg_curr_cmd_to_data;
  fbdreg_local_cmd_to_data_inc <= fbdreg_curr_cmd_to_data_inc;
 end
end
`endif

wire [9:0] delay_cfg_reg = delay_reg + 10'd136;

`ifdef AXIS_FBDIMM_NO_FSR
wire [9:0] sync_delay_reg = delay_reg + ( sync_cmd[12:11] * 3) + 10'd36 ;

shifter #(NB_LINK) sync_data_shift ( .signal_in ( pn_read_data ),
                                     .signal_out ( pn_read_data_shft),
                                     .delay_cycles (sync_delay_reg),
                                     .clk ( clk_int ));


shifter #(1)       sync_ctrl_shift ( .signal_in ( send_status_frm ),
                                     .signal_out ( send_status_frm_shft ),
                                     .delay_cycles ( sync_delay_reg),
                                     .clk ( clk_int));

`else

reg [3:0] sb_nb_diff_reg;
reg start_counter;
wire  diff_detected = (sb_nb_diff_reg !== 1);
reg diff_complete;

`ifdef STINGRAY
shifter_p #(1) config_rd_ctrl_shft ( .signal_in (config_reg_rd ),
`else
shifter_UI_p #(1) config_rd_ctrl_shft ( .signal_in (config_reg_rd ),
`endif
                                   .signal_out (config_reg_rd_shft),
                                   .delay_cycles(delay_cfg_reg),
                                   .clk (link_clk));

shifter #(1) config_rd_ctrl_shft_data ( .signal_in (config_reg_rd ),
                                        .signal_out (config_reg_rd_shft_data),
                                        .delay_cycles(delay_cfg_reg),
                                        .clk (link_clk));

`ifdef DTM_ENABLED
shifter_p #(NB_LINK) shft (.signal_in ( pn),
                    .signal_out       (pn_shft_out),
                    .delay_cycles     ( (DS == 0 ) ? delay_reg + sb_nb_diff_reg - 1 : 0 ),
                    .clk              (link_clk)); 
`else
`ifdef STINGRAY
shifter_p #(NB_LINK) shft (.signal_in ( pn),
`else
shifter_UI_p #(NB_LINK) shft (.signal_in ( pn),
`endif
                    .signal_out       (pn_shft_out),
                    .delay_cycles     (delay_reg ),
                    .clk              (link_clk)); 
`endif


initial diff_complete =0;

`ifdef FBDIMM_FAST_NB
wire [9:0] sync_delay_reg = ((drc[7:4]+drc[3:0]) * 12 ) + ( sync_cmd[12:11] * 10'd12 ) + 10'd55 + 10'd36 ;
`else
wire [9:0] sync_delay_reg = ((drc[7:4]+drc[3:0]) * 12 ) + ( sync_cmd[12:11] * 10'd12 ) + 10'd55 ;
`endif

`ifdef DTM_ENABLED

always@(negedge link_clk ) if ( ~init & !diff_complete )
begin
  if ( (frm_boundary) && (frm_boundary_sb == frm_boundary ) ) begin
    start_counter <=0;
    diff_complete <=1;
  end
  else if ( frm_boundary_sb )
    start_counter <=1;
  else if ( start_counter & frm_boundary ) begin
    start_counter <=0;
    diff_complete <=1;
  end

end
else start_counter <= 0;

always@(negedge link_clk ) if ( ~init )
begin
  if ( start_counter )
   sb_nb_diff_reg <= sb_nb_diff_reg + 1;
end
else
  sb_nb_diff_reg <= 1;

`endif

 
shifter #(NB_LINK) sync_data_shift ( .signal_in ( pn_read_data ),
                                     .signal_out ( pn_read_data_shft),
                                     .delay_cycles (sync_delay_reg),
                                     .clk ( link_clk));


shifter_UI_p #(1)       sync_ctrl_shift ( .signal_in ( send_status_frm /*_reg */ ),
                                     .signal_out ( send_status_frm_shft ),
                                     .delay_cycles ( sync_delay_reg),
                                     .clk ( link_clk));

`endif //AXIS_FBDIMM_NO_FSR

always@(negedge frm_boundary_sb )
begin
  failover_nb_14 <= (nb_config != 4'hf );
end


endmodule

