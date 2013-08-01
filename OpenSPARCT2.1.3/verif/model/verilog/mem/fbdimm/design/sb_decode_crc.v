// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: sb_decode_crc.v
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
module sb_decode_crc ( ps_in , ps_bar_in, ss , ss_bar , 
                       rbuffer_rd,rbuffer_rd_data,rbuffer_empty,
                       config_reg_rd,config_reg_data,
                       send_status_frm,sync_cmd,
                       fbdreg_dcalcsr,fbdreg_dcaladdr,fbdreg_drc,
                       fbdreg_dareftc,fbdreg_synctrainint,fbdreg_mtr,
                       fbdreg_curr_cmd_to_data,fbdreg_curr_cmd_to_data_inc,
                       fbdreg_next_cmd_to_data,fbdreg_next_cmd_to_data_inc,
                       fbds0,fbds1,fbds2,fbds3,
                       fbdreg_emask,fbdreg_ferr,fbdreg_nerr,
`ifdef AXIS_FBDIMM_NO_FSR
`else
                       link_clk, link_clk_bar,
`endif
                       dram_clk,dram_2x_clk,init, write_fifo_empty,
                       soft_channel_reset, sb_crc_error,ref_2x_clk,
                       sb_config, nop_frame_detected, 
                       command_in,command_type,command_rdy,data_in,data_out,reset,
                       get_wbuffer_data,put_rbuffer_data,
                       l0sdur_reg, recalibdur_reg,frm_begin,frm_boundary, clear_dcalcsr31,
                       dram_cmd_vld_delayed,cke_reg_delayed,
                       enter_recalibrate,enter_los,clk_int,
                       ps0_in,ps1_in,ps2_in,ps3_in,ps4_in,ps5_in,ps6_in,ps7_in,ps8_in,ps9_in,ps10_in,ps11_in
);
// Parameters
parameter SB_LINK = 10;
parameter DS = 0;

`define SB_IDLE 0
`define SB_STATE1 1
`define SB_STATE2 2
`define SB_STATE3 3


input  [SB_LINK-1:0] ps_in,ps_bar_in; // primary southbound
output [SB_LINK-1:0] ss,ss_bar; // secondary southbound
input  [SB_LINK-1:0]  ps0_in,ps1_in,ps2_in,ps3_in,ps4_in,ps5_in,ps6_in,ps7_in,ps8_in,ps9_in,ps10_in,ps11_in;
output [23:0]        command_in;
output [71:0]        data_in;
input  [71:0]        data_out;
inout  [31:0]        fbdreg_dcalcsr,fbdreg_dcaladdr,fbdreg_drc;
output [31:0]        fbdreg_emask,fbdreg_ferr,fbdreg_nerr;
output [31:0]        l0sdur_reg;
output [31:0]        recalibdur_reg;
output [31:0]        fbdreg_dareftc,fbdreg_synctrainint;
output [71:0]        rbuffer_rd_data;
output [31:0]        config_reg_data;
output [23:0]        sync_cmd;
output [7:0]         fbdreg_curr_cmd_to_data,fbdreg_curr_cmd_to_data_inc;
output [7:0]         fbdreg_next_cmd_to_data,fbdreg_next_cmd_to_data_inc;
input  [7:0]         fbds0,fbds1,fbds2,fbds3;
output [7:0]         fbdreg_mtr;
input [3:0]          sb_config;
input                nop_frame_detected;
output               write_fifo_empty; // = write_fifo.rempty;
output               enter_recalibrate,enter_los;
`ifdef AXIS_FBDIMM_NO_FSR
`else
input                link_clk,link_clk_bar;
`endif
input                dram_clk,dram_2x_clk;
input                rbuffer_rd;
input                dram_cmd_vld_delayed;
input                ref_2x_clk;
input                cke_reg_delayed;
output               rbuffer_empty;
input                init; // =1 if we are in initialization
output               config_reg_rd;
output               send_status_frm;
output               soft_channel_reset;
output               sb_crc_error;
output               command_rdy;
output [1:0]         command_type;
input                get_wbuffer_data;
input                put_rbuffer_data;
input                reset;
input                clk_int;
input                frm_begin;
input                frm_boundary;
input                clear_dcalcsr31;

wire [SB_LINK-1:0]   ps,ps_bar;
wire  [SB_LINK-1:0]  ps0,ps1,ps2,ps3,ps4,ps5,ps6,ps7,ps8,ps9,ps10,ps11;
wire [31:0]          fbdreg_reccfg_wire;
wire [15:0]          fbdreg_recfbd0_wire;
wire [15:0]          fbdreg_recfbd1_wire;
wire [15:0]          fbdreg_recfbd2_wire;
wire [15:0]          fbdreg_recfbd3_wire;
wire [15:0]          fbdreg_recfbd4_wire;
wire [15:0]          fbdreg_recfbd5_wire;
wire [15:0]          fbdreg_recfbd6_wire;
wire [15:0]          fbdreg_recfbd7_wire;
wire [15:0]          fbdreg_recfbd8_wire;
wire [15:0]          fbdreg_recfbd9_wire;
wire [13:0]          CRC14;
wire [21:0]          CRC22;
wire [9:0]           CRC10_cmd_failover,CRC10_data_failover;
wire [13:0]          Write_Frame_Wire_d;
wire [23:0]          command_select;
wire [71:0]          RDATA;
wire [71:0]          wdata;
wire [71:0]          wfifo_rd_data;
wire [71:0]          dram_io_data_out;
wire [71:0]          wbuffer_rd_data;
wire [71:0]          wbuffer_wr_data;
wire [21:0]          calc_FE;
wire [13:0]          calc_aE;
wire [31:0]          cmd2data_reg; 
wire [31:0]          fn3_off74_reg; 
wire [9:0]           sync_detected;
wire [31:0]          wcfg_data;
wire                 disable_state;
wire                 fewedges_wire;
wire                 wfifo_full;
wire                 wbuffer_full;
wire                 wbuffer_empty;
wire                 dram_io_put_rbuffer_data;
wire                 inv_wr,inv_rd;
wire                 Write_Config_reg_d1,Write_Config_reg_d2,Write_Config_reg_d3,Write_Config_reg_d4;


//internal registers
reg [SB_LINK-1:0] trans_3,trans_2,trans_1,trans_0;
reg [23:0]        aC,bC,cC;
reg [71:0]        aData;
reg [21:0]        FE;
reg [31:0]        D;
reg [71:0]        WDATA;
reg [4:0]         curr_state,next_state;
reg [2:0]         WS;
reg [3:0]         WS_tmp,BE;
reg [13:0]        FE_latch,aE;
reg [1:0]         Write_Frame_Count,F;
reg [12:0]        sync_counter_reg;
reg [13:0]        Test_aE,Test_FE,calc_aE_reg,Test1_FE;
reg [21:0]        calc_FE_latch_reg,calc_FE_reg;
reg [71:0]        Data_72;
reg [25:0]        Command_26;
reg [31:0]        cfg_data;
reg [11:0]        frmdata_0,frmdata_1,frmdata_2,frmdata_3,frmdata_4,frmdata_5;
reg [11:0]        frmdata_6,frmdata_7,frmdata_8,frmdata_9;
reg [10:0]        Write_Config_addr_reg;
reg               Curr_Command_A_is_Sync,Prev_Command_A_is_Sync;
reg               Curr_Command_A_is_SoftReset,Prev_Command_A_is_SoftReset;
reg               command_A_rdy,command_B_rdy,command_C_rdy;
reg               Write_Frame_Reg;
reg               invalidate_Write_FIFO_reg;
reg               sb_crc_error_reg,sb_crc_error_reg_d;
reg               cfg_rd,reset_sync;
reg [23:0]        sync_cmd_data;
reg [2:0]         cmd_B[3:0], cmd_C[3:0];
reg               sync_detected_reg;
reg               sync_cmd_rdy;
reg               Last_TID;
wire               failover_sb;
reg               bypass_init;
reg               sng_channel;
reg               Write_Config_reg;
reg               sb_fsm_start,sb_fsm_start_1;
reg [2:0]         sb_fsm_curr_state;
reg               data_crc_err,cmd_crc_err;
reg [3:0]         wf_counter;
reg               write_buffer_fifo_reg;

// integers
integer index;


`ifdef AXIS_FBDIMM_HW
wire [31:0] axis_rdata;
wire [31:0] axis_wdata= wcfg_data;
wire [10:0] axis_raddr= command_select[10:0];
wire [10:0] axis_waddr = Write_Config_addr_reg;
wire axis_wen = Write_Config_reg_d4;


`ifdef PALLADIUM
   reg [31:0] register_memory [0:2047]; 
   reg [31:0] axis_rdata_reg;

   assign axis_rdata = axis_rdata_reg;
   
   always @ (axis_raddr)
     begin
        axis_rdata_reg = register_memory[axis_raddr];
     end

   always @ (axis_wen or axis_wdata or axis_waddr)
     begin
        if(axis_wen)
          register_memory[axis_waddr] = axis_wdata;
     end

`else

axis_smem #(11,32,2,0) register_memory (  {axis_rdata,32'bz}, // output port
                                          {32'bz,axis_wdata},  // input port
                                          {axis_raddr,axis_waddr},  //address port
                                          {1'b0	,axis_wen}, // write enable
                                          {1'b1,1'b1},  // chip enable
                                          {1'bz,1'bz}, // clock
                                          {32'bz,32'bz});
`endif 

 
`else
 reg [31:0] register_memory[0:2048];
`endif


// Assignments


wire [71:0] dq_out;
wire [2:0] ws_fifo_data;
wire write_buffer_fifo = write_buffer_fifo_reg;


assign command_in = command_select;
assign command_rdy = ( command_A_rdy | command_B_rdy  | command_C_rdy) & ~sb_crc_error_reg;
assign command_type = ( command_A_rdy ) ? 2'h3: 
                      ( command_B_rdy ) ? 2'h1:
                      ( command_C_rdy ) ? 2'h2:  2'h0;

assign data_in = wfifo_rd_data;
assign dram_io_data_out = data_out;
assign dram_io_put_rbuffer_data = put_rbuffer_data;

assign failover_sb = ( sb_config !== 4'b1111 );

assign ps0 = ( sb_config == 4'b1111 ) ?  ps0_in : // all lanes are good
            ( sb_config == 4'b1001 ) ? {1'b0,ps0_in[8:0]} : // map out lane 9
            ( sb_config == 4'b1000 ) ? {1'b0,ps0_in[9],ps0_in[7:0]} : // map out lane 8
            ( sb_config == 4'b0111 ) ? {1'b0,ps0_in[9:8],ps0_in[6:0]} : // map out lane 7
            ( sb_config == 4'b0110 ) ? {1'b0,ps0_in[9:7],ps0_in[5:0]} : // map out lane 6
            ( sb_config == 4'b0101 ) ? {1'b0,ps0_in[9:6],ps0_in[4:0]} : // map out lane 5
            ( sb_config == 4'b0100 ) ? {1'b0,ps0_in[9:5],ps0_in[3:0]} : // map out lane 4
            ( sb_config == 4'b0011 ) ? {1'b0,ps0_in[9:4],ps0_in[2:0]} : // map out lane 3
            ( sb_config == 4'b0010 ) ? {1'b0,ps0_in[9:3],ps0_in[1:0]} : // map out lane 2
            ( sb_config == 4'b0001 ) ? {1'b0,ps0_in[9:2],ps0_in[0]}   : // map out lane 1
            ( sb_config == 4'b0000 ) ? {1'b0,ps0_in[9:1]}            : ps0_in ; // map out lane 0

assign ps1 = ( sb_config == 4'b1111 ) ?  ps1_in : // all lanes are good
            ( sb_config == 4'b1001 ) ? {1'b0,ps1_in[8:0]} : // map out lane 9
            ( sb_config == 4'b1000 ) ? {1'b0,ps1_in[9],ps1_in[7:0]} : // map out lane 8
            ( sb_config == 4'b0111 ) ? {1'b0,ps1_in[9:8],ps1_in[6:0]} : // map out lane 7
            ( sb_config == 4'b0110 ) ? {1'b0,ps1_in[9:7],ps1_in[5:0]} : // map out lane 6
            ( sb_config == 4'b0101 ) ? {1'b0,ps1_in[9:6],ps1_in[4:0]} : // map out lane 5
            ( sb_config == 4'b0100 ) ? {1'b0,ps1_in[9:5],ps1_in[3:0]} : // map out lane 4
            ( sb_config == 4'b0011 ) ? {1'b0,ps1_in[9:4],ps1_in[2:0]} : // map out lane 3
            ( sb_config == 4'b0010 ) ? {1'b0,ps1_in[9:3],ps1_in[1:0]} : // map out lane 2
            ( sb_config == 4'b0001 ) ? {1'b0,ps1_in[9:2],ps1_in[0]}   : // map out lane 1
            ( sb_config == 4'b0000 ) ? {1'b0,ps1_in[9:1]}            : ps1_in ; // map out lane 0
assign ps2 = ( sb_config == 4'b1111 ) ?  ps2_in : // all lanes are good
            ( sb_config == 4'b1001 ) ? {1'b0,ps2_in[8:0]} : // map out lane 9
            ( sb_config == 4'b1000 ) ? {1'b0,ps2_in[9],ps2_in[7:0]} : // map out lane 8
            ( sb_config == 4'b0111 ) ? {1'b0,ps2_in[9:8],ps2_in[6:0]} : // map out lane 7
            ( sb_config == 4'b0110 ) ? {1'b0,ps2_in[9:7],ps2_in[5:0]} : // map out lane 6
            ( sb_config == 4'b0101 ) ? {1'b0,ps2_in[9:6],ps2_in[4:0]} : // map out lane 5
            ( sb_config == 4'b0100 ) ? {1'b0,ps2_in[9:5],ps2_in[3:0]} : // map out lane 4
            ( sb_config == 4'b0011 ) ? {1'b0,ps2_in[9:4],ps2_in[2:0]} : // map out lane 3
            ( sb_config == 4'b0010 ) ? {1'b0,ps2_in[9:3],ps2_in[1:0]} : // map out lane 2
            ( sb_config == 4'b0001 ) ? {1'b0,ps2_in[9:2],ps2_in[0]}   : // map out lane 1
            ( sb_config == 4'b0000 ) ? {1'b0,ps2_in[9:1]}            : ps2_in ; // map out lane 0
assign ps3 = ( sb_config == 4'b1111 ) ?  ps3_in : // all lanes are good
            ( sb_config == 4'b1001 ) ? {1'b0,ps3_in[8:0]} : // map out lane 9
            ( sb_config == 4'b1000 ) ? {1'b0,ps3_in[9],ps3_in[7:0]} : // map out lane 8
            ( sb_config == 4'b0111 ) ? {1'b0,ps3_in[9:8],ps3_in[6:0]} : // map out lane 7
            ( sb_config == 4'b0110 ) ? {1'b0,ps3_in[9:7],ps3_in[5:0]} : // map out lane 6
            ( sb_config == 4'b0101 ) ? {1'b0,ps3_in[9:6],ps3_in[4:0]} : // map out lane 5
            ( sb_config == 4'b0100 ) ? {1'b0,ps3_in[9:5],ps3_in[3:0]} : // map out lane 4
            ( sb_config == 4'b0011 ) ? {1'b0,ps3_in[9:4],ps3_in[2:0]} : // map out lane 3
            ( sb_config == 4'b0010 ) ? {1'b0,ps3_in[9:3],ps3_in[1:0]} : // map out lane 2
            ( sb_config == 4'b0001 ) ? {1'b0,ps3_in[9:2],ps3_in[0]}   : // map out lane 1
            ( sb_config == 4'b0000 ) ? {1'b0,ps3_in[9:1]}            : ps3_in ; // map out lane 0
assign ps4 = ( sb_config == 4'b1111 ) ?  ps4_in : // all lanes are good
            ( sb_config == 4'b1001 ) ? {1'b0,ps4_in[8:0]} : // map out lane 9
            ( sb_config == 4'b1000 ) ? {1'b0,ps4_in[9],ps4_in[7:0]} : // map out lane 8
            ( sb_config == 4'b0111 ) ? {1'b0,ps4_in[9:8],ps4_in[6:0]} : // map out lane 7
            ( sb_config == 4'b0110 ) ? {1'b0,ps4_in[9:7],ps4_in[5:0]} : // map out lane 6
            ( sb_config == 4'b0101 ) ? {1'b0,ps4_in[9:6],ps4_in[4:0]} : // map out lane 5
            ( sb_config == 4'b0100 ) ? {1'b0,ps4_in[9:5],ps4_in[3:0]} : // map out lane 4
            ( sb_config == 4'b0011 ) ? {1'b0,ps4_in[9:4],ps4_in[2:0]} : // map out lane 3
            ( sb_config == 4'b0010 ) ? {1'b0,ps4_in[9:3],ps4_in[1:0]} : // map out lane 2
            ( sb_config == 4'b0001 ) ? {1'b0,ps4_in[9:2],ps4_in[0]}   : // map out lane 1
            ( sb_config == 4'b0000 ) ? {1'b0,ps4_in[9:1]}            : ps4_in ; // map out lane 0
assign ps5 = ( sb_config == 4'b1111 ) ?  ps5_in : // all lanes are good
            ( sb_config == 4'b1001 ) ? {1'b0,ps5_in[8:0]} : // map out lane 9
            ( sb_config == 4'b1000 ) ? {1'b0,ps5_in[9],ps5_in[7:0]} : // map out lane 8
            ( sb_config == 4'b0111 ) ? {1'b0,ps5_in[9:8],ps5_in[6:0]} : // map out lane 7
            ( sb_config == 4'b0110 ) ? {1'b0,ps5_in[9:7],ps5_in[5:0]} : // map out lane 6
            ( sb_config == 4'b0101 ) ? {1'b0,ps5_in[9:6],ps5_in[4:0]} : // map out lane 5
            ( sb_config == 4'b0100 ) ? {1'b0,ps5_in[9:5],ps5_in[3:0]} : // map out lane 4
            ( sb_config == 4'b0011 ) ? {1'b0,ps5_in[9:4],ps5_in[2:0]} : // map out lane 3
            ( sb_config == 4'b0010 ) ? {1'b0,ps5_in[9:3],ps5_in[1:0]} : // map out lane 2
            ( sb_config == 4'b0001 ) ? {1'b0,ps5_in[9:2],ps5_in[0]}   : // map out lane 1
            ( sb_config == 4'b0000 ) ? {1'b0,ps5_in[9:1]}            : ps5_in ; // map out lane 0
assign ps6 = ( sb_config == 4'b1111 ) ?  ps6_in : // all lanes are good
            ( sb_config == 4'b1001 ) ? {1'b0,ps6_in[8:0]} : // map out lane 9
            ( sb_config == 4'b1000 ) ? {1'b0,ps6_in[9],ps6_in[7:0]} : // map out lane 8
            ( sb_config == 4'b0111 ) ? {1'b0,ps6_in[9:8],ps6_in[6:0]} : // map out lane 7
            ( sb_config == 4'b0110 ) ? {1'b0,ps6_in[9:7],ps6_in[5:0]} : // map out lane 6
            ( sb_config == 4'b0101 ) ? {1'b0,ps6_in[9:6],ps6_in[4:0]} : // map out lane 5
            ( sb_config == 4'b0100 ) ? {1'b0,ps6_in[9:5],ps6_in[3:0]} : // map out lane 4
            ( sb_config == 4'b0011 ) ? {1'b0,ps6_in[9:4],ps6_in[2:0]} : // map out lane 3
            ( sb_config == 4'b0010 ) ? {1'b0,ps6_in[9:3],ps6_in[1:0]} : // map out lane 2
            ( sb_config == 4'b0001 ) ? {1'b0,ps6_in[9:2],ps6_in[0]}   : // map out lane 1
            ( sb_config == 4'b0000 ) ? {1'b0,ps6_in[9:1]}            : ps6_in ; // map out lane 0
assign ps7 = ( sb_config == 4'b1111 ) ?  ps7_in : // all lanes are good
            ( sb_config == 4'b1001 ) ? {1'b0,ps7_in[8:0]} : // map out lane 9
            ( sb_config == 4'b1000 ) ? {1'b0,ps7_in[9],ps7_in[7:0]} : // map out lane 8
            ( sb_config == 4'b0111 ) ? {1'b0,ps7_in[9:8],ps7_in[6:0]} : // map out lane 7
            ( sb_config == 4'b0110 ) ? {1'b0,ps7_in[9:7],ps7_in[5:0]} : // map out lane 6
            ( sb_config == 4'b0101 ) ? {1'b0,ps7_in[9:6],ps7_in[4:0]} : // map out lane 5
            ( sb_config == 4'b0100 ) ? {1'b0,ps7_in[9:5],ps7_in[3:0]} : // map out lane 4
            ( sb_config == 4'b0011 ) ? {1'b0,ps7_in[9:4],ps7_in[2:0]} : // map out lane 3
            ( sb_config == 4'b0010 ) ? {1'b0,ps7_in[9:3],ps7_in[1:0]} : // map out lane 2
            ( sb_config == 4'b0001 ) ? {1'b0,ps7_in[9:2],ps7_in[0]}   : // map out lane 1
            ( sb_config == 4'b0000 ) ? {1'b0,ps7_in[9:1]}            : ps7_in ; // map out lane 0
assign ps8 = ( sb_config == 4'b1111 ) ?  ps8_in : // all lanes are good
            ( sb_config == 4'b1001 ) ? {1'b0,ps8_in[8:0]} : // map out lane 9
            ( sb_config == 4'b1000 ) ? {1'b0,ps8_in[9],ps8_in[7:0]} : // map out lane 8
            ( sb_config == 4'b0111 ) ? {1'b0,ps8_in[9:8],ps8_in[6:0]} : // map out lane 7
            ( sb_config == 4'b0110 ) ? {1'b0,ps8_in[9:7],ps8_in[5:0]} : // map out lane 6
            ( sb_config == 4'b0101 ) ? {1'b0,ps8_in[9:6],ps8_in[4:0]} : // map out lane 5
            ( sb_config == 4'b0100 ) ? {1'b0,ps8_in[9:5],ps8_in[3:0]} : // map out lane 4
            ( sb_config == 4'b0011 ) ? {1'b0,ps8_in[9:4],ps8_in[2:0]} : // map out lane 3
            ( sb_config == 4'b0010 ) ? {1'b0,ps8_in[9:3],ps8_in[1:0]} : // map out lane 2
            ( sb_config == 4'b0001 ) ? {1'b0,ps8_in[9:2],ps8_in[0]}   : // map out lane 1
            ( sb_config == 4'b0000 ) ? {1'b0,ps8_in[9:1]}            : ps8_in ; // map out lane 0
assign ps9 = ( sb_config == 4'b1111 ) ?  ps9_in : // all lanes are good
            ( sb_config == 4'b1001 ) ? {1'b0,ps9_in[8:0]} : // map out lane 9
            ( sb_config == 4'b1000 ) ? {1'b0,ps9_in[9],ps9_in[7:0]} : // map out lane 8
            ( sb_config == 4'b0111 ) ? {1'b0,ps9_in[9:8],ps9_in[6:0]} : // map out lane 7
            ( sb_config == 4'b0110 ) ? {1'b0,ps9_in[9:7],ps9_in[5:0]} : // map out lane 6
            ( sb_config == 4'b0101 ) ? {1'b0,ps9_in[9:6],ps9_in[4:0]} : // map out lane 5
            ( sb_config == 4'b0100 ) ? {1'b0,ps9_in[9:5],ps9_in[3:0]} : // map out lane 4
            ( sb_config == 4'b0011 ) ? {1'b0,ps9_in[9:4],ps9_in[2:0]} : // map out lane 3
            ( sb_config == 4'b0010 ) ? {1'b0,ps9_in[9:3],ps9_in[1:0]} : // map out lane 2
            ( sb_config == 4'b0001 ) ? {1'b0,ps9_in[9:2],ps9_in[0]}   : // map out lane 1
            ( sb_config == 4'b0000 ) ? {1'b0,ps9_in[9:1]}            : ps9_in ; // map out lane 0
assign ps10 = ( sb_config == 4'b1111 ) ?  ps10_in : // all lanes are good
            ( sb_config == 4'b1001 ) ? {1'b0,ps10_in[8:0]} : // map out lane 9
            ( sb_config == 4'b1000 ) ? {1'b0,ps10_in[9],ps10_in[7:0]} : // map out lane 8
            ( sb_config == 4'b0111 ) ? {1'b0,ps10_in[9:8],ps10_in[6:0]} : // map out lane 7
            ( sb_config == 4'b0110 ) ? {1'b0,ps10_in[9:7],ps10_in[5:0]} : // map out lane 6
            ( sb_config == 4'b0101 ) ? {1'b0,ps10_in[9:6],ps10_in[4:0]} : // map out lane 5
            ( sb_config == 4'b0100 ) ? {1'b0,ps10_in[9:5],ps10_in[3:0]} : // map out lane 4
            ( sb_config == 4'b0011 ) ? {1'b0,ps10_in[9:4],ps10_in[2:0]} : // map out lane 3
            ( sb_config == 4'b0010 ) ? {1'b0,ps10_in[9:3],ps10_in[1:0]} : // map out lane 2
            ( sb_config == 4'b0001 ) ? {1'b0,ps10_in[9:2],ps10_in[0]}   : // map out lane 1
            ( sb_config == 4'b0000 ) ? {1'b0,ps10_in[9:1]}            : ps10_in ; // map out lane 0
assign ps11 = ( sb_config == 4'b1111 ) ?  ps11_in : // all lanes are good
            ( sb_config == 4'b1001 ) ? {1'b0,ps11_in[8:0]} : // map out lane 9
            ( sb_config == 4'b1000 ) ? {1'b0,ps11_in[9],ps11_in[7:0]} : // map out lane 8
            ( sb_config == 4'b0111 ) ? {1'b0,ps11_in[9:8],ps11_in[6:0]} : // map out lane 7
            ( sb_config == 4'b0110 ) ? {1'b0,ps11_in[9:7],ps11_in[5:0]} : // map out lane 6
            ( sb_config == 4'b0101 ) ? {1'b0,ps11_in[9:6],ps11_in[4:0]} : // map out lane 5
            ( sb_config == 4'b0100 ) ? {1'b0,ps11_in[9:5],ps11_in[3:0]} : // map out lane 4
            ( sb_config == 4'b0011 ) ? {1'b0,ps11_in[9:4],ps11_in[2:0]} : // map out lane 3
            ( sb_config == 4'b0010 ) ? {1'b0,ps11_in[9:3],ps11_in[1:0]} : // map out lane 2
            ( sb_config == 4'b0001 ) ? {1'b0,ps11_in[9:2],ps11_in[0]}   : // map out lane 1
            ( sb_config == 4'b0000 ) ? {1'b0,ps11_in[9:1]}            : ps11_in ; // map out lane 0



assign ps = ( sb_config == 4'b1111 ) ?  ps_in : // all lanes are good
            ( sb_config == 4'b1001 ) ? {1'b0,ps_in[8:0]} : // map out lane 9
            ( sb_config == 4'b1000 ) ? {1'b0,ps_in[9],ps_in[7:0]} : // map out lane 8
            ( sb_config == 4'b0111 ) ? {1'b0,ps_in[9:8],ps_in[6:0]} : // map out lane 7
            ( sb_config == 4'b0110 ) ? {1'b0,ps_in[9:7],ps_in[5:0]} : // map out lane 6
            ( sb_config == 4'b0101 ) ? {1'b0,ps_in[9:6],ps_in[4:0]} : // map out lane 5
            ( sb_config == 4'b0100 ) ? {1'b0,ps_in[9:5],ps_in[3:0]} : // map out lane 4
            ( sb_config == 4'b0011 ) ? {1'b0,ps_in[9:4],ps_in[2:0]} : // map out lane 3
            ( sb_config == 4'b0010 ) ? {1'b0,ps_in[9:3],ps_in[1:0]} : // map out lane 2
            ( sb_config == 4'b0001 ) ? {1'b0,ps_in[9:2],ps_in[0]}   : // map out lane 1
            ( sb_config == 4'b0000 ) ? {1'b0,ps_in[9:1]}            : ps_in ; // map out lane 0

assign ps_bar = ( sb_config == 4'b1111 ) ?  ps_bar_in : // all lanes are good
            ( sb_config == 4'b1001 ) ? {1'b0,ps_bar_in[8:0]} : // map out lane 9
            ( sb_config == 4'b1000 ) ? {1'b0,ps_bar_in[9],ps_bar_in[7:0]} : // map out lane 8
            ( sb_config == 4'b0111 ) ? {1'b0,ps_bar_in[9:8],ps_bar_in[6:0]} : // map out lane 7
            ( sb_config == 4'b0110 ) ? {1'b0,ps_bar_in[9:7],ps_bar_in[5:0]} : // map out lane 6
            ( sb_config == 4'b0101 ) ? {1'b0,ps_bar_in[9:6],ps_bar_in[4:0]} : // map out lane 5
            ( sb_config == 4'b0100 ) ? {1'b0,ps_bar_in[9:5],ps_bar_in[3:0]} : // map out lane 4
            ( sb_config == 4'b0011 ) ? {1'b0,ps_bar_in[9:4],ps_bar_in[2:0]} : // map out lane 3
            ( sb_config == 4'b0010 ) ? {1'b0,ps_bar_in[9:3],ps_bar_in[1:0]} : // map out lane 2
            ( sb_config == 4'b0001 ) ? {1'b0,ps_bar_in[9:2],ps_bar_in[0]}   : // map out lane 1
            ( sb_config == 4'b0000 ) ? {1'b0,ps_bar_in[9:1]}            : ps_bar_in ; // map out lane 



assign disable_state      = ( ps_in == ps_bar_in ) ? 1'b1 : 1'b0;
assign sync_detected[0]   = sync_detected_reg;
assign ss                 = ps_in;
assign ss_bar             = ps_bar_in;
assign config_reg_rd      = cfg_rd;
assign config_reg_data    = cfg_data;
assign send_status_frm    = sync_detected[1];
assign sync_cmd           = sync_cmd_data;
assign write_fifo_empty   = write_fifo.rempty;
assign soft_channel_reset = invalidate_Write_FIFO_reg;
assign sb_crc_error       = sb_crc_error_reg_d;
assign enter_recalibrate  = sync_detected_reg & aC[5];
assign enter_los          = sync_detected_reg & aC[4];
assign inv_wr             = invalidate_Write_FIFO_reg;
assign wdata              = WDATA;
assign wbuffer_wr_data    = {WDATA[71],WDATA[62],WDATA[53],WDATA[44],WDATA[35],WDATA[26],WDATA[17],WDATA[8],
                             WDATA[70],WDATA[61],WDATA[52],WDATA[43],WDATA[34],WDATA[25],WDATA[16],WDATA[7],
                             WDATA[69],WDATA[60],WDATA[51],WDATA[42],WDATA[33],WDATA[24],WDATA[15],WDATA[6],
                             WDATA[68],WDATA[59],WDATA[50],WDATA[41],WDATA[32],WDATA[23],WDATA[14],WDATA[5],
                             WDATA[67],WDATA[58],WDATA[49],WDATA[40],WDATA[31],WDATA[22],WDATA[13],WDATA[4],
                             WDATA[66],WDATA[57],WDATA[48],WDATA[39],WDATA[30],WDATA[21],WDATA[12],WDATA[3],
                             WDATA[65],WDATA[56],WDATA[47],WDATA[38],WDATA[29],WDATA[20],WDATA[11],WDATA[2],
                             WDATA[64],WDATA[55],WDATA[46],WDATA[37],WDATA[28],WDATA[19],WDATA[10],WDATA[1],
                             WDATA[63],WDATA[54],WDATA[45],WDATA[36],WDATA[27],WDATA[18],WDATA[9],WDATA[0]
                             };
`ifdef AXIS_FBDIMM_1AMB
assign command_select     = (command_A_rdy  ) ? aC[23:0] : 
                            (command_B_rdy  ) ? bC[23:0] :
                            (command_C_rdy  ) ? cC[23:0] : 24'h0;
`else
assign command_select     = (command_A_rdy && ( aC[23:21] == DS) ) ? aC[23:0] : 
                            (command_B_rdy && ( bC[23:21] == DS) ) ? bC[23:0] :
                            (command_C_rdy && ( cC[23:21] == DS) ) ? cC[23:0] : 24'h0;
`endif

`ifdef AXIS_FBDIMM_HW
assign fbdreg_dcalcsr              = 32'h0; 
assign fbdreg_dcaladdr             = 32'h0; 
//assign fbdreg_drc                  = 32'h33;
reg [31:0] fbdreg_drc_tmp;
`ifndef AL_DEFAULT
  `define AL_DEFAULT 3
`endif
`ifndef CL_DEFAULT
  `define CL_DEFAULT 3
`endif

initial fbdreg_drc_tmp <= { `AL_DEFAULT, `CL_DEFAULT };
assign fbdreg_drc = fbdreg_drc_tmp;
assign fbdreg_emask                = 32'h0;
assign fbdreg_ferr                 = 32'h0;
assign fbdreg_nerr                 = 32'h0;
assign fbdreg_reccfg_wire          = 32'h0;
assign fbdreg_recfbd0_wire         = 16'h0;
assign fbdreg_recfbd1_wire         = 16'h0;
assign fbdreg_recfbd2_wire         = 16'h0;
assign fbdreg_recfbd3_wire         = 16'h0;
assign fbdreg_recfbd4_wire         = 16'h0;
assign fbdreg_recfbd5_wire         = 16'h0;
assign fbdreg_recfbd6_wire         = 16'h0;
assign fbdreg_recfbd7_wire         = 16'h0;
assign fbdreg_recfbd8_wire         = 16'h0;
assign fbdreg_recfbd9_wire         = 16'h0;
assign fbdreg_next_cmd_to_data     = 8'h0;
assign fbdreg_curr_cmd_to_data     = 8'h0;
assign fbdreg_next_cmd_to_data_inc = 8'h0;
assign fbdreg_curr_cmd_to_data_inc = 8'h0;
assign fbdreg_mtr                  = 8'h0;
assign fbdreg_dareftc              = 32'h004ec30;
assign fbdreg_synctrainint         = 32'h0;
assign l0sdur_reg                  = 32'h043;
`else
assign fbdreg_dcalcsr              = register_memory[{3'b100,8'h40}]; // function 4, offset 40h pg 97
assign fbdreg_dcaladdr             = register_memory[{3'b100,8'h44}]; // function 4, offset 44h pg 97
assign fbdreg_drc                  = register_memory[{3'b011,8'h7c}]; // function 3, offset 7ch pg 97
assign fbdreg_emask                = register_memory[{3'b001,8'h8c}]; // function 1 , offset 8ch pg 86
assign fbdreg_ferr                 = register_memory[{3'b001,8'h90}]; // function 1 , offset 90h pg 86
assign fbdreg_nerr                 = register_memory[{3'b001,8'h94}]; // function 1 , offset 94h pg 87
assign fbdreg_reccfg_wire          = register_memory[{3'b001,8'h98}]; // function 1 , offset 98h pg 88
assign fbdreg_dareftc              = register_memory[{3'b011,8'h70}]; // function 3 , offset 70h pg 119
assign fbdreg_synctrainint         = register_memory[{3'b001,8'h78}]; // function 1 , offset 78h pg 103
assign cmd2data_reg                = register_memory[{3'b001,8'he8}]; // function 1, offset e8 pg 90
assign fbdreg_next_cmd_to_data     = cmd2data_reg[7:0];
assign fbdreg_curr_cmd_to_data     = cmd2data_reg[15:8];
assign fbdreg_next_cmd_to_data_inc = cmd2data_reg[23:16];
assign fbdreg_curr_cmd_to_data_inc = cmd2data_reg[31:24];
assign l0sdur_reg                  = register_memory[{3'b001,8'h74}];
assign recalibdur_reg              = register_memory[{3'b001,8'h70}];
assign fn3_off74_reg               = register_memory[{3'b011,8'h74}];
assign fbdreg_mtr                  = fn3_off74_reg[7:0];
assign fewedges_wire               = ( sync_counter_reg == 13'd1009 ) ? 1'b1 : 1'b0;

// First ERROR
always@(fewedges_wire or sb_crc_error)
 register_memory[{3'b001,8'h90}] <=  {26'h0,1'b0,1'b0,fewedges_wire,1'b0,1'b0,sb_crc_error};

// Next ERROR
always@(fewedges_wire or sb_crc_error)
 register_memory[{3'b001,8'h94}] <=  {26'h0,1'b0,1'b0,fewedges_wire,1'b0,1'b0,sb_crc_error};


`endif




// Initialization
// Note: For now, generate a dummy reset signal
initial begin

 sb_fsm_start = 0;
 sb_fsm_curr_state=`SB_IDLE;
 sb_crc_error_reg_d =0;
 Write_Frame_Reg = 0;
 wf_counter=1;
 Data_72=0;
 FE=0;

`ifdef AXIS_FBDIMM_HW
`else
 for(index=0; index <= 2047; index = index+1)
 begin
  register_memory[index]=32'h0;
 end

  `ifdef STINGRAY
  `else
    $readmemh("fbdimm_register.data",register_memory);
  `endif

 if ( $test$plusargs("fbdimm_dbg"))
    $ch_dispmon("sb_decode",`DBG_0,1);

  if ( $test$plusargs("fbdimm_dbg_1"))
    $ch_dispmon("sb_decode",`DBG_1,1);

  if ( $test$plusargs("fbdimm_dbg_2"))
    $ch_dispmon("sb_decode",`DBG_2,1);

  if ( $test$plusargs("fbdimm_dbg_3"))
    $ch_dispmon("sb_decode",`DBG_3,1);

  if ( $test$plusargs("fbdimm_dbg_4"))
    $ch_dispmon("sb_decode",`DBG_4,1);

`endif

  if ( $test$plusargs("bypass_init"))
   bypass_init = 1;
  else
   bypass_init = 0;

  if ( $test$plusargs("SNG_CHANNEL"))
   sng_channel = 1;
  else
   sng_channel = 0;

 invalidate_Write_FIFO_reg=1;
 curr_state = `TRANSFER_0;
 next_state = `TRANSFER_0;
 Write_Frame_Count =0;
 sync_detected_reg=0;
 sb_crc_error_reg=0;
 calc_aE_reg=0;
 calc_FE_reg=0;
 reset_sync=1'b1;
 WS=0;
 WS_tmp=0;
 Last_TID=0;


end


`ifdef AXIS_FBDIMM_NO_FSR
`else
  `ifdef AXIS_FBDIMM_HW
  `else
    always@(link_clk)
    begin
     register_memory[{3'b001,8'h40}]<= {24'h0,fbds0}; // fbds0 register from nb
     register_memory[{3'b001,8'h41}]<= {24'h0,fbds1}; // fbds1 register from nb
     register_memory[{3'b001,8'h42}]<= {24'h0,fbds2}; // fbds2 register from nb
     register_memory[{3'b001,8'h43}]<= {24'h0,fbds3}; // fbds3 register from nb
    end
  `endif // AXIS_FBDIMM_HW
`endif // AXIS_FBDIMM_NO_FSR

// Main state machine to sample data bus


always@(posedge frm_boundary )
   sb_crc_error_reg_d <= sb_crc_error_reg;



always@(negedge clk_int) 
  sb_fsm_start <= 1;

always@(posedge frm_begin) if ( sb_fsm_start )
  sb_fsm_start_1 <= 1;


// CRC checking mechanism to generate alert frames

always@(posedge clk_int) 
begin

 if ( soft_channel_reset | disable_state )
    sb_crc_error_reg<=0;

  if ( sb_fsm_curr_state ==  `SB_STATE1 )
  begin 
    if ( failover_sb )
      FE_latch <= {CRC10_data_failover[9:0],4'h0};
    else
     FE_latch <= CRC22[13:0];
  end


  if ( sb_fsm_curr_state ==  `SB_STATE2 )
  begin
   if (!failover_sb)
    begin
    if(Prev_Command_A_is_SoftReset && (aE !== 14'h0))
    begin
`ifdef AXIS_FBDIMM_NO_FSR
        sb_crc_error_reg<=1;
        cmd_crc_err = 1;
`else
      if ( {ps3[5],ps2[5],ps1[5]} == DS ) begin// if the frame was meant for this AMB\
        sb_crc_error_reg<=1;
        cmd_crc_err = 1;
      end
`endif
    end
    if ( !Prev_Command_A_is_Sync & !Prev_Command_A_is_SoftReset )
                     if ( ((FE_latch[13] ^ aE[13]) !== CRC14[13] ) ||
                          ((FE_latch[12] ^ aE[12]) !== CRC14[12] ) ||
                          ((FE_latch[11] ^ aE[11]) !== CRC14[11] ) ||
                          ((FE_latch[10] ^ aE[10]) !== CRC14[10] ) ||
                          ((FE_latch[09] ^ aE[09]) !== CRC14[09] ) ||
                          ((FE_latch[08] ^ aE[08]) !== CRC14[08] ) ||
                          ((FE_latch[07] ^ aE[07]) !== CRC14[07] ) ||
                          ((FE_latch[06] ^ aE[06]) !== CRC14[06] ) ||
                          ((FE_latch[05] ^ aE[05]) !== CRC14[05] ) ||
                          ((FE_latch[04] ^ aE[04]) !== CRC14[04] ) ||
                          ((FE_latch[03] ^ aE[03]) !== CRC14[03] ) ||
                          ((FE_latch[02] ^ aE[02]) !== CRC14[02] ) ||
                          ((FE_latch[01] ^ aE[01]) !== CRC14[01] ) ||
                           ((FE_latch[00] ^ aE[00]) !== CRC14[00] )
                         ) 
                      begin
`ifdef AXIS_FBDIMM_NO_FSR
                           sb_crc_error_reg<=1;
                           cmd_crc_err = 1;
`else
                         if ( {ps3[5],ps2[5],ps1[5]} == DS ) begin// if the frame was meant for this AMB
                           sb_crc_error_reg<=1;
                           cmd_crc_err = 1;
                         end
`endif
                      end
                       else if ( /*sync_detected_reg |*/ soft_channel_reset | disable_state )
                         sb_crc_error_reg<=0;

        end


            if (failover_sb)
             begin
              if(Prev_Command_A_is_SoftReset && aE[9:0] !== 10'h0)
               begin
`ifdef AXIS_FBDIMM_NO_FSR
		 sb_crc_error_reg<=1;
		 cmd_crc_err = 1;
`else
                 if ( {ps3[5],ps2[5],ps1[5]} == DS ) begin// if the frame was meant for this AMB\
		 sb_crc_error_reg<=1;
		 cmd_crc_err = 1;
  	       end	 
`endif
              end
              if ( !Prev_Command_A_is_Sync & !Prev_Command_A_is_SoftReset )
                 if ( ((FE_latch[13] ^ aE[09]) !== CRC10_cmd_failover[09] ) ||
                      ((FE_latch[12] ^ aE[08]) !== CRC10_cmd_failover[08] ) ||
                      ((FE_latch[11] ^ aE[07]) !== CRC10_cmd_failover[07] ) ||
                      ((FE_latch[10] ^ aE[06]) !== CRC10_cmd_failover[06] ) ||
                      ((FE_latch[09] ^ aE[05]) !== CRC10_cmd_failover[05] ) ||
                      ((FE_latch[08] ^ aE[04]) !== CRC10_cmd_failover[04] ) ||
                      ((FE_latch[07] ^ aE[03]) !== CRC10_cmd_failover[03] ) ||
                      ((FE_latch[06] ^ aE[02]) !== CRC10_cmd_failover[02] ) ||
                      ((FE_latch[05] ^ aE[01]) !== CRC10_cmd_failover[01] ) ||
                      ((FE_latch[04] ^ aE[00]) !== CRC10_cmd_failover[00] )
                    ) 
                  begin
`ifdef AXIS_FBDIMM_NO_FSR
                           sb_crc_error_reg<=1;
                     `PR_ALWAYS ("sb_decode",`DBG_1,"ERROR: Command has CRC mismatch => Test_aE %h  !=  aE %h \n",FE_latch[13:4] ^ aE[9:0], CRC10_cmd_failover[9:0]);
`else

                         if ( {ps3[5],ps2[5],ps1[5]} == DS ) // if the frame was meant for this AMB
                           sb_crc_error_reg<=1;
`endif

                    end
                   else if ( /*sync_detected_reg*/ | soft_channel_reset | disable_state)
                    sb_crc_error_reg<=0;

                end

  end

  if ( sb_fsm_curr_state ==  `SB_STATE3 )
  begin

  if ( failover_sb )
   Test1_FE[13:0] = {CRC10_cmd_failover[09] ^ aE[09],
                     CRC10_cmd_failover[08] ^ aE[08],
                     CRC10_cmd_failover[07] ^ aE[07],
                     CRC10_cmd_failover[06] ^ aE[06],
                     CRC10_cmd_failover[05] ^ aE[05],
                     CRC10_cmd_failover[04] ^ aE[04],
                     CRC10_cmd_failover[03] ^ aE[03],
                     CRC10_cmd_failover[02] ^ aE[02],
                     CRC10_cmd_failover[01] ^ aE[01],
                     CRC10_cmd_failover[00] ^ aE[00],
                     1'b0,
                     1'b0,
                     1'b0,
                     1'b0};
  else
   Test1_FE[13:0] = {CRC14[13] ^ aE[13],
                     CRC14[12] ^ aE[12],
                     CRC14[11] ^ aE[11],
                     CRC14[10] ^ aE[10],
                     CRC14[09] ^ aE[09],
                     CRC14[08] ^ aE[08],
                     CRC14[07] ^ aE[07],
                     CRC14[06] ^ aE[06],
                     CRC14[05] ^ aE[05],
                     CRC14[04] ^ aE[04],
                     CRC14[03] ^ aE[03],
                     CRC14[02] ^ aE[02],
                     CRC14[01] ^ aE[01],
                     CRC14[00] ^ aE[00]};


 if ( !failover_sb )
  if ( !Prev_Command_A_is_Sync & !Prev_Command_A_is_SoftReset )
   if ( ((CRC14[13] ^ aE[13]) !== FE_latch[13] ) ||
       ((CRC14[12] ^ aE[12]) !== FE_latch[12] ) ||
       ((CRC14[11] ^ aE[11]) !== FE_latch[11] ) ||
       ((CRC14[10] ^ aE[10]) !== FE_latch[10] ) ||
       ((CRC14[09] ^ aE[09]) !== FE_latch[09] ) ||
       ((CRC14[08] ^ aE[08]) !== FE_latch[08] ) ||
       ((CRC14[07] ^ aE[07]) !== FE_latch[07] ) ||
       ((CRC14[06] ^ aE[06]) !== FE_latch[06] ) ||
       ((CRC14[05] ^ aE[05]) !== FE_latch[05] ) ||
       ((CRC14[04] ^ aE[04]) !== FE_latch[04] ) ||
       ((CRC14[03] ^ aE[03]) !== FE_latch[03] ) ||
       ((CRC14[02] ^ aE[02]) !== FE_latch[02] ) ||
       ((CRC14[01] ^ aE[01]) !== FE_latch[01] ) ||
       ((CRC14[00] ^ aE[00]) !== FE_latch[00] ))
   begin
  `ifdef AXIS_FBDIMM_NO_FSR
                           sb_crc_error_reg<=1;
                     `PR_ALWAYS ("sb_decode",`DBG_1,"ERROR: Data has CRC mismatch Test1_FE = %h !=  FE = %h\n",Test1_FE,FE_latch);
  `else
                         if ( {ps3[5],ps2[5],ps1[5]} == DS ) // if the frame was meant for this AMB
                           sb_crc_error_reg<=1;
   `endif

   end
   else if ( /*sync_detected_reg |*/ soft_channel_reset | disable_state)
                     sb_crc_error_reg<=1'b0;



 if ( failover_sb )
  if ( !Prev_Command_A_is_Sync & !Prev_Command_A_is_SoftReset )
   if ( ((CRC10_cmd_failover[09] ^ aE[09]) !== FE_latch[13] ) ||
       ((CRC10_cmd_failover[08] ^ aE[08]) !== FE_latch[12] ) ||
       ((CRC10_cmd_failover[07] ^ aE[07]) !== FE_latch[11] ) ||
       ((CRC10_cmd_failover[06] ^ aE[06]) !== FE_latch[10] ) ||
       ((CRC10_cmd_failover[05] ^ aE[05]) !== FE_latch[09] ) ||
       ((CRC10_cmd_failover[04] ^ aE[04]) !== FE_latch[08] ) ||
       ((CRC10_cmd_failover[03] ^ aE[03]) !== FE_latch[07] ) ||
       ((CRC10_cmd_failover[02] ^ aE[02]) !== FE_latch[06] ) ||
       ((CRC10_cmd_failover[01] ^ aE[01]) !== FE_latch[05] ) ||
       ((CRC10_cmd_failover[00] ^ aE[00]) !== FE_latch[04] )) 
   begin
`ifdef AXIS_FBDIMM_NO_FSR
                           sb_crc_error_reg<=1'b1;
`else
                         if ( {ps3[5],ps2[5],ps1[5]} == DS ) // if the frame was meant for this AMB
                           sb_crc_error_reg<=1'b1;
`endif
   end
   else if ( /*sync_detected_reg |*/ soft_channel_reset | disable_state)
                     sb_crc_error_reg<=1'b0;

  end  // if sb_fsm_curr_state == sb_state3


  if ( sb_fsm_curr_state ==  `SB_STATE1 )
  begin

// 10th bit lane carries pattern info for sync frames so we will not do this check for sycn frames


 if ( !failover_sb )
  if ( !Curr_Command_A_is_Sync & !Curr_Command_A_is_SoftReset )
   if ( FE[21:14] !== CRC22[21:14] ) begin
`ifdef AXIS_FBDIMM_NO_FSR
                           sb_crc_error_reg<=1'b1;
                           data_crc_err = 1;
`else
`ifdef AXIS_FBDIMM_HW
`else
         `PR_ALWAYS ("sb_decode",`DBG_1,"ERROR: Data has CRC mismatch Test2_FE[21:14] =  %h !=   CRC[21:14]  = %h\n",FE[21:14], CRC22[21:14]);
`endif 
                        if ( {ps3[5],ps2[5],ps1[5]} == DS ) begin// if the frame was meant for this AMB
                           sb_crc_error_reg<=1'b1;
                           data_crc_err = 1;
                         end
`endif
   end
   else if ( /*sync_detected_reg |*/ soft_channel_reset | disable_state)
         sb_crc_error_reg<=1'b0;


  end  // if sb_fsm_curr_state == sb_state1

    
end

wire ts0_pattern_start;

voting_logic check_LSB3 (.a ( {ps0[0],ps1[0],ps2[0],ps3[0],ps4[0],ps5[0],ps6[0],ps7[0],ps8[0],ps9[0],ps10[0],ps11[0]} == 12'h7fd ),
                         .b ( {ps0[1],ps1[1],ps2[1],ps3[1],ps4[1],ps5[1],ps6[1],ps7[1],ps8[1],ps9[1],ps10[1],ps11[1]} == 12'h7fd ),
                         .c ( {ps0[2],ps1[2],ps2[2],ps3[2],ps4[2],ps5[2],ps6[2],ps7[2],ps8[2],ps9[2],ps10[2],ps11[2]} == 12'h7fd ),
                         .out ( ts0_pattern_start ) );


`ifdef DTM_ENABLED

reg init_d1;
always@(posedge frm_boundary)
    init_d1 <= ~nop_frame_detected ;

`else
wire init_d1;
assign init_d1 = init;
`endif

always@(negedge clk_int) 
begin
if ( ~init)
  reset_sync=0;

  case ( sb_fsm_curr_state )
   `SB_IDLE:  begin 
              if ( bypass_init && sb_fsm_start_1 )
                sb_fsm_curr_state <= `SB_STATE1;

             if ( ts0_pattern_start )
              sb_fsm_curr_state <= `SB_STATE1;
               end
     `SB_STATE1: if ( disable_state )  sb_fsm_curr_state <= `SB_IDLE;
                 else if ( ~init_d1 ) begin
                   // Latch FE
                   calc_FE_latch_reg <= FE;
                   Prev_Command_A_is_Sync <= Curr_Command_A_is_Sync;
                   Prev_Command_A_is_SoftReset <= Curr_Command_A_is_SoftReset;

                   if ( sb_config == 4'hf ) begin
                          {aE[0],aE[7],aE[08], F[00],aC[20],aC[16],aC[12],aC[08],aC[4],aC[0]} = ps0[9:0];
                          {aE[1],aE[6],aE[09], F[01],aC[21],aC[17],aC[13],aC[09],aC[5],aC[1]} = ps1[9:0];
                          {aE[2],aE[5],aE[10],aE[13],aC[22],aC[18],aC[14],aC[10],aC[6],aC[2]} = ps2[9:0];
                          {aE[3],aE[4],aE[11],aE[12],aC[23],aC[19],aC[15],aC[11],aC[7],aC[3]} = ps3[9:0];

                          {Command_26[20],Command_26[19],Command_26[12],Command_26[11],Command_26[4],Command_26[3]}=ps3[5:0];   
                          {Command_26[21],Command_26[18],Command_26[13],Command_26[10],Command_26[5],Command_26[2]}=ps2[5:0];   
                          {Command_26[25],Command_26[22],Command_26[17],Command_26[14],Command_26[09],Command_26[6],Command_26[1]}=ps1[6:0];   
                          {Command_26[24],Command_26[23],Command_26[16],Command_26[15],Command_26[08],Command_26[7],Command_26[0]}=ps0[6:0];   

                          {FE[0],FE[7],FE[8]}={ps0[9],ps0[8],ps0[7]};
                          {FE[1],FE[6],FE[9]}={ps1[9],ps1[8],ps1[7]};
                          {FE[2],FE[5],FE[10],FE[13]}={ps2[9],ps2[8],ps2[7],ps2[6]};
                          {FE[3],FE[4],FE[11],FE[12]}={ps3[9],ps3[8],ps3[7],ps3[6]};
      

                          if ( ( ps0  == 10'h0   ) && 
                               ( ps1  == 10'h0   ) &&
                               ( ps2  == 10'h0   ) &&
                               ( ps3  == 10'h8   ) &&
                               ( ps4  == 10'h2aa ) &&
                               ( ps5  == 10'h155 ) &&
                               ( ps6  == 10'h2aa ) &&
                               ( ps7  == 10'h155 ) &&
                               ( ps8  == 10'h2aa ) &&
                               ( ps9  == 10'h155 ) &&
                               ( ps10 == 10'h2aa ) &&
                               ( ps11 == 10'h155 ) )
                         begin
                             // Since soft channel reset is detected, invalidate all Write fifos 
                             invalidate_Write_FIFO_reg = 1'b1;
                         end 
                         else
                             invalidate_Write_FIFO_reg = 1'b0;
`ifdef AXIS_FBDIMM_1AMB
                            command_A_rdy <= 1;  
`else
                          if ( { ps3[5],ps2[5],ps1[5]} == DS  ) begin
                            command_A_rdy <= 1;  
                          end
`endif
                          if ( {ps0[5],ps3[4],ps2[4],ps1[4],ps0[4],ps3[3],ps2[3]} == 6'h1 /* aC[20:14] == 6'h1*/)
                          begin
`ifdef AXIS_FBDIMM_HW
`else
                            sync_detected_reg <= 1;
`endif
                            Curr_Command_A_is_Sync<=1;
                          end
                          else
                           Curr_Command_A_is_Sync<=0;

                          if ( {ps0[5],ps3[4],ps2[4],ps1[4],ps0[4],ps3[3],ps2[3]} == 6'h2 )
                          begin
                            Curr_Command_A_is_SoftReset <=1;
                         end 
                          else
                           Curr_Command_A_is_SoftReset <=0;

                           
                           sync_cmd_rdy<=1;


                            command_C_rdy <= 0;
                           if ( ps1[6] == 1 ) begin // if f1=1
                            WS_tmp[3:0] <= {ps0[6],WS_tmp[3:1]};
                            Write_Frame_Reg <= 1;
                            end 
                           else
                            Write_Frame_Reg <= 0;

                   end else begin // failover sb mode

                          {aE[03],aE[04], F[00],aC[20],aC[16],aC[12],aC[08],aC[4],aC[0]} = ps0[8:0];
                          {aE[02],aE[05], F[01],aC[21],aC[17],aC[13],aC[09],aC[5],aC[1]} = ps1[8:0];
                          {aE[01],aE[06],aE[09],aC[22],aC[18],aC[14],aC[10],aC[6],aC[2]} = ps2[8:0];
                          {aE[00],aE[07],aE[08],aC[23],aC[19],aC[15],aC[11],aC[7],aC[3]} = ps3[8:0];

                          {Command_26[24],Command_26[23],Command_26[16],Command_26[15],Command_26[08],Command_26[7],Command_26[0]}=ps0[6:0];   
                          {Command_26[25],Command_26[22],Command_26[17],Command_26[14],Command_26[09],Command_26[6],Command_26[1]}=ps1[6:0];   
                          {Command_26[21],Command_26[18],Command_26[13],Command_26[10],Command_26[5],Command_26[2]}=ps2[5:0];   
                          {Command_26[20],Command_26[19],Command_26[12],Command_26[11],Command_26[4],Command_26[3]}=ps3[5:0];   

                          {FE[3],FE[4]}={ps0[8],ps0[7]};
                          {FE[2],FE[5]}={ps1[8],ps1[7]};
                          {FE[1],FE[6],FE[9]}={ps2[8],ps2[7],ps2[6]};
                          {FE[0],FE[7],FE[8]}={ps3[8],ps3[7],ps3[6]};
      

                          if ( ( ps0  == 10'h0   ) && 
                               ( ps1  == 10'h0   ) &&
                               ( ps2  == 10'h0   ) &&
                               ( ps3  == 10'h8   ) &&
                               ( ps4  == 10'h2aa ) &&
                               ( ps5  == 10'h155 ) &&
                               ( ps6  == 10'h2aa ) &&
                               ( ps7  == 10'h155 ) &&
                               ( ps8  == 10'h2aa ) &&
                               ( ps9  == 10'h155 ) &&
                               ( ps10 == 10'h2aa ) &&
                               ( ps11 == 10'h155 ) )
                         begin
                             invalidate_Write_FIFO_reg = 1'b1;
                         end
                          else
                             invalidate_Write_FIFO_reg = 1'b0;
`ifdef AXIS_FBDIMM_1AMB
                            command_A_rdy <= 1;  
`else
                          if ( { ps3[5],ps2[5],ps1[5]} == DS  ) begin
                            command_A_rdy <= 1;  
                          end
`endif
                          if ( {ps0[5],ps3[4],ps2[4],ps1[4],ps0[4],ps3[3],ps2[3]} == 6'h1 /* aC[20:14] == 6'h1*/)
                            Curr_Command_A_is_Sync<=1;
                          else
                           Curr_Command_A_is_Sync<=0;

                          if ( {ps0[5],ps3[4],ps2[4],ps1[4],ps0[4],ps3[3],ps2[3]} == 6'h2 /* aC[20:14] == 6'h1*/)
                            Curr_Command_A_is_SoftReset<=1;
                          else
                           Curr_Command_A_is_SoftReset<=0;

                           sync_cmd_rdy<=1;

                            command_C_rdy <= 0;
                           if ( ps1[6] == 1 ) begin // if f1=1
                            WS_tmp[3:0] <= {ps0[6],WS_tmp[3:1]};
                            Write_Frame_Reg <= 1;
                            end 
                           else
                            Write_Frame_Reg <= 0;

                    end


                  sb_fsm_curr_state <= `SB_STATE2;
                 end
     `SB_STATE2: begin

                   if ( disable_state )  sb_fsm_curr_state <= `SB_IDLE;
                    else begin
                            Write_Frame_Reg <= 0;


                     if ( sb_config == 4'hf ) begin
                        FE[21]=ps4[9];
                        FE[20]=ps5[9];
                        FE[19]=ps6[9];
                        FE[18]=ps7[9];
                     end

                        {bC[20],bC[16],bC[12],bC[08],bC[4],bC[0]}=ps4[5:0];
                        {bC[21],bC[17],bC[13],bC[09],bC[5],bC[1]}=ps5[5:0];
                        {bC[22],bC[18],bC[14],bC[10],bC[6],bC[2]}=ps6[5:0];
                        {bC[23],bC[19],bC[15],bC[11],bC[7],bC[3]}=ps7[5:0];

                        WDATA[08:00]=ps4[8:0];
                        WDATA[17:09]=ps5[8:0];
                        WDATA[26:18]=ps6[8:0];
                        WDATA[35:27]=ps7[8:0];

                        Data_72[8:0]=ps4[8:0];
                        Data_72[17:9]={ps5[0],ps5[1],ps5[2],ps5[3],ps5[4],ps5[5],ps5[6],ps5[7],ps5[8]};
                        Data_72[26:18]=ps6[8:0];
                        Data_72[35:27]={ps7[0],ps7[1],ps7[2],ps7[3],ps7[4],ps7[5],ps7[6],ps7[7],ps7[8]};

                        command_A_rdy <= 0; 
                        sync_cmd_rdy<=0;  
                        calc_aE_reg<=calc_aE;


`ifdef AXIS_FBDIMM_1AMB
                        if ( (ps4[8:6] == 3'h0 ) && 
                             (ps5[8:6] == 3'h0 ) &&
                             (ps6[8:6] == 3'h0 ) &&
                             (ps7[8:6]  == 3'h0 ) && ({ps1[6],ps0[6]} == 2'h0 )) begin
                          command_B_rdy <= 1;   
                        end
`else
                        if ( (ps4[8:6] == 3'h0 ) && 
                             (ps5[8:6] == 3'h0 ) &&
                             (ps6[8:6] == 3'h0 ) &&
                             (ps7[8:6]  == 3'h0 ) && ({ps7[5],ps6[5],ps5[5]} == DS) && ({ps1[6],ps0[6]} == 2'h0 )) begin
                          command_B_rdy <= 1;   
                        end
`endif

                   sb_fsm_curr_state <= `SB_STATE3;
                  end // if ( disable_state ) 

                 end
     `SB_STATE3: begin

                    if ( disable_state )  sb_fsm_curr_state <= `SB_IDLE;
                    else begin

                     if  ( sb_config == 4'hf ) begin
                       FE[17]=ps8[9];
                       FE[16]=ps9[9];
                       FE[15]=ps10[9];
                       FE[14]=ps11[9];
                     end

                       command_B_rdy <= 0;   
                       {cC[20],cC[16],cC[12],cC[8],cC[4],cC[0]}=ps8[5:0];
                       {cC[21],cC[17],cC[13],cC[9],cC[5],cC[1]}=ps9[5:0];
                       {cC[22],cC[18],cC[14],cC[10],cC[6],cC[2]}=ps10[5:0];
                       {cC[23],cC[19],cC[15],cC[11],cC[7],cC[3]}=ps11[5:0];
  

                       {BE[0],D[28],D[24],D[20],D[16],D[12],D[8],D[4],D[0]}=ps8[8:0]; 
                       {BE[1],D[29],D[25],D[21],D[17],D[13],D[9],D[5],D[1]}=ps9[8:0]; 
                       {BE[2],D[30],D[26],D[22],D[18],D[14],D[10],D[6],D[2]}=ps10[8:0]; 
                       {BE[3],D[31],D[27],D[23],D[19],D[15],D[11],D[7],D[3]}=ps11[8:0];

                       cmd_C[0]=ps8[8:6];
                       cmd_C[1]=ps[8:6];
                       cmd_C[2]=ps[8:6];

                       WDATA[44:36]=ps8[8:0];
                       WDATA[53:45]=ps9[8:0];
                       WDATA[62:54]=ps10[8:0];
                       WDATA[71:63]=ps11[8:0];

                       Data_72[44:36]=ps8[8:0];
                       Data_72[53:45]={ps9[0],ps9[1],ps9[2],ps9[3],ps9[4],ps9[5],ps9[6],ps9[7],ps9[8]};
                       Data_72[62:54]=ps10[8:0];
                       Data_72[71:63]={ps11[0],ps11[1],ps11[2],ps11[3],ps11[4],ps11[5],ps11[6],ps11[7],ps11[8]};


                       Write_Frame_Reg <= 0;
   
`ifdef AXIS_FBDIMM_1AMB
                       if ( (ps8[8:6] == 3'h0 ) && 
                            (ps9[8:6] == 3'h0 ) &&
                            (ps10[8:6] == 3'h0 ) &&
                            (ps11[8:6]  == 3'h0 )  && ({ps0[6],ps1[6]} == 2'h0) ) begin
                        command_C_rdy <= 1;   
                       end
`else
                       if ( (ps8[8:6] == 3'h0 ) && 
                            (ps9[8:6] == 3'h0 ) &&
                            (ps10[8:6] == 3'h0 ) &&
                            (ps11[8:6]  == 3'h0 ) && ({ps11[5],ps10[5],ps9[5]} == DS) && ({ps0[6],ps1[6]} == 2'h0) ) begin
                        command_C_rdy <= 1;   
                       end
`endif
                       WS <=WS_tmp[2:0];
                       Write_Frame_Count[1:0] <= Write_Frame_Count[1:0] + 2'b1;

                   if ( ps == ps_bar )
                      sb_fsm_curr_state <= `SB_IDLE;
                   else
                      sb_fsm_curr_state <= `SB_STATE1;

                 end
       end // if ( disable_state)

    endcase

end


// Channel Commands

`ifdef AXIS_FBDIMM_NO_FSR
always@(posedge clk_int)
`else
always@(posedge link_clk)
`endif
begin
   // channel reset command


  // write config command
  if ( command_B_rdy && ( bC[20:14] == 7'b0000101 ) && ( bC[12] == ~Last_TID ) )
  begin
`ifdef AXIS_FBDIMM_HW
`else
    `PR_ALWAYS ("sb_decode",`DBG_0,"FBDIMM: Write config register received : Function number %h Register Address   %h",bC[10:8],bC[10:0]);
`endif

    Last_TID<=bC[12]; // update last tid
    Write_Config_reg<=1;
    Write_Config_addr_reg<=bC[10:0];
  end
  else
    Write_Config_reg<=0;


  // read config command
  if (  (command_A_rdy || command_B_rdy || command_C_rdy) && ( command_select[20:14] == 7'b0000100 ) )
  begin
`ifdef AXIS_FBDIMM_HW
    cfg_data <= axis_rdata;
`else
    `PR_ALWAYS ("sb_decode",`DBG_0,"FBDIMM: Read config register received : Function number %h Register Address %h Register data     %h",command_select[10:8],command_select[7:2],register_memory[command_select[10:0]]);
    cfg_data<=register_memory[command_select[10:0]];
`endif
    cfg_rd<=1;
  end
   else 
    cfg_rd<=0;

   // sync command
   if ( sync_cmd_rdy && ( aC[20:18] == 3'b000 ) && ( aC[17:14] == 4'b0001) )
   begin
`ifdef AXIS_FBDIMM_HW
`else
     `PR_ALWAYS ("sb_decode",`DBG_0,"FBDIMM: Sync detected. sd=%h ier=%b erc=%b el0s=%b  r1,r0=%h",aC[12:11],aC[6],aC[5],aC[4],aC[1:0]);
`endif
     sync_detected_reg<=1'b1;
     sync_cmd_data<=aC;
     sync_counter_reg <= 13'h0;
   end
   else begin
     sync_detected_reg<= 1'b0;
     sync_counter_reg <= sync_counter_reg + 13'h1;
   end

end

`ifdef AXIS_FBDIMM_HW
assign  wcfg_data  ={WDATA[70],WDATA[61],WDATA[52],WDATA[43],WDATA[69],WDATA[60],WDATA[51],WDATA[42],WDATA[68],WDATA[59],WDATA[50],WDATA[41],WDATA[67],WDATA[58],WDATA[49],WDATA[40],WDATA[66],WDATA[57],WDATA[48],WDATA[39],WDATA[65],WDATA[56],WDATA[47],WDATA[38],WDATA[64],WDATA[55],WDATA[46],WDATA[37],WDATA[63],WDATA[54],WDATA[45],WDATA[36]};
`else

assign  wcfg_data  ={WDATA[70],WDATA[61],WDATA[52],WDATA[43],WDATA[69],WDATA[60],WDATA[51],WDATA[42],WDATA[68],WDATA[59],WDATA[50],WDATA[41],WDATA[67],WDATA[58],WDATA[49],WDATA[40],WDATA[66],WDATA[57],WDATA[48],WDATA[39],WDATA[65],WDATA[56],WDATA[47],WDATA[38],WDATA[64],WDATA[55],WDATA[46],WDATA[37],WDATA[63],WDATA[54],WDATA[45],WDATA[36]};

wire [31:0] tmp_dcalcsr = register_memory[{3'b100,8'h40}];

`ifdef AXIS_FBDIMM_NO_FSR
always@(posedge clk_int)
`else
always@(posedge link_clk)
`endif
begin
 if ( clear_dcalcsr31 )
  register_memory[{3'b100,8'h40}] <= {1'b0,tmp_dcalcsr[30:0]};


 if ( Write_Config_reg_d4 )
 begin
    register_memory[Write_Config_addr_reg]<= wcfg_data;
    `PR_ALWAYS ("sb_decode",`DBG_0,"FBDIMM: Write config data: %h",  wcfg_data);
  end
 if(dram_cmd_vld_delayed)
  begin
    register_memory[{3'b011,8'h7c}]<={22'b0,cke_reg_delayed,9'b0} | register_memory[{3'b011,8'h7c}]; 
  end
end

`endif

// DDR2 DRAM I/O module



always@(posedge clk_int)
begin
 if ( init | soft_channel_reset ) 
  wf_counter<=1;
 else if ( Write_Frame_Wire_d[12] & ~init)
 begin
   if ( wf_counter == 4'h8 )
    wf_counter <= 1 ;
   else
    wf_counter <= wf_counter + 3'h1;
 end

end


reg first_write_vld;

always@(posedge clk_int)
begin
  if ( init || soft_channel_reset )
    first_write_vld <=0;
  else if ( Write_Frame_Reg)
   first_write_vld <=1;
end

wire enable_buffer_fifo0 = ( wf_counter == 3'h1 ) | ( wf_counter == 3'h2 ) | ( wf_counter == 3'h3 ) | (  wf_counter == 3'h4 );
wire enable_buffer_fifo1 = ( wf_counter == 3'h5 ) | ( wf_counter == 3'h6 ) | ( wf_counter == 3'h7 ) | (   wf_counter == 4'h8 );
 
wire wbuffer_full0,wbuffer_full1,wbuffer_empty0,wbuffer_empty1;
assign wbuffer_full =  wbuffer_full0 | wbuffer_full1;
assign wbuffer_empty = wbuffer_empty0 | wbuffer_empty1;
reg [2:0] fifo0_rd,fifo1_rd;

wire [71:0] wbuffer_rd_data0,wbuffer_rd_data1;

assign wbuffer_rd_data = ( (fifo0_rd == 3'h4 ) | (fifo0_rd == 2'h1 ) | (fifo0_rd == 2'h2) | (fifo0_rd == 2'h3) ) ?  wbuffer_rd_data0 : wbuffer_rd_data1;


always@(negedge clk_int)
begin
  if ( init  || soft_channel_reset) 
     fifo0_rd <=  2'b00;
  else if ( enable_buffer_fifo1 && ( fifo0_rd !== 3'b101))
     fifo0_rd <= fifo0_rd + 2'b1;
  else if ( enable_buffer_fifo0 )
     fifo0_rd <= 2'b00;


  if ( init  || soft_channel_reset) 
     fifo1_rd <=  3'b101;
  else if ( enable_buffer_fifo0 && ( fifo1_rd !== 3'b101))
     fifo1_rd <= fifo1_rd + 2'b1;
  else if ( enable_buffer_fifo1 )
     fifo1_rd <= 2'b00;


end

// Buffer to hold Write data before it is enqueud in Write Buffer
beh_fifo #(72,2) buffer_fifo0 (.rdata (wbuffer_rd_data0),
                         .wfull (wbuffer_full0),
                         .rempty (wbuffer_empty0),
                         .wdata  (wbuffer_wr_data),
                         .winc   (Write_Frame_Wire_d[11] & enable_buffer_fifo0 ),
                         .wclk (clk_int ),
                         .wrst_n (~reset),
                         .inv (inv_wr | disable_state),
                         .rinc ( ((fifo0_rd == 3'h4 ) | (fifo0_rd == 2'h1 ) | (fifo0_rd == 2'h2) | (fifo0_rd == 2'h3)) & first_write_vld ),
                         .rclk (clk_int ),
                         .rrst_n(~reset)
                         );

// Buffer to hold Write data before it is enqueud in Write Buffer
beh_fifo #(72,2) buffer_fifo1 (.rdata (wbuffer_rd_data1),
                         .wfull (wbuffer_full1),
                         .rempty (wbuffer_empty1),
                         .wdata  (wbuffer_wr_data),
                         .winc   (Write_Frame_Wire_d[11]  & enable_buffer_fifo1),
                         .wclk (clk_int ),
                         .wrst_n (~reset),
                         .inv (inv_wr | disable_state ),
                         .rinc ( ((fifo1_rd == 3'h4 ) | (fifo1_rd == 2'h1 ) | (fifo1_rd == 2'h2) | (fifo1_rd == 2'h3)) & first_write_vld ),
                         .rclk (clk_int ),
                         .rrst_n(~reset)
                         );



reg write_amb_ok;
reg [2:0] WS_d1,WS_d2;



`ifdef AXIS_FBDIMM_1AMB
assign write_fifo_winc =  ( fifo0_rd == 3'h4  ) ||  (fifo0_rd == 3'h2 ) || ( fifo0_rd == 3'h3) ||  (fifo0_rd == 3'h1) ||
                          ( fifo1_rd == 3'h4  ) || (fifo1_rd == 3'h2 ) ||  ( fifo1_rd == 3'h3) || (fifo1_rd == 3'h1 ) ;

`else

reg [2:0] WS_latch0,WS_latch1;

always@(negedge enable_buffer_fifo0)
  WS_latch0 <= WS;

always@(negedge enable_buffer_fifo1)
  WS_latch1 <= WS;


wire write_fifo_winc = (( ((fifo0_rd == 3'h4 ) | (fifo0_rd == 2'h1 ) | (fifo0_rd == 2'h2) | (fifo0_rd == 2'h3)  ) & (WS_latch0 == DS )) |
                       ( ((fifo1_rd == 3'h4 ) | (fifo1_rd == 2'h1 ) | (fifo1_rd == 2'h2) | (fifo1_rd == 2'h3)  ) & (WS_latch1 == DS))) & first_write_vld ;

`endif



// Write Buffer
beh_fifo #(72,6) write_fifo (.rdata (wfifo_rd_data),
                         .wfull (wfifo_full),
                         .rempty (wfifo_empty),
                         .wdata  (wbuffer_rd_data),
                         .winc   ( write_fifo_winc ),
                         .wclk (clk_int),
                         .wrst_n (~reset),
                         .rinc ( get_wbuffer_data ),
                         .rclk (dram_2x_clk),
                         .inv  (inv_wr | disable_state),
                         .rrst_n(~reset)
                         );



`ifdef FBDIMM_FAST_NB
// Read Buffer
beh_fifo #(72,6) read_fifo (.rdata (rbuffer_rd_data),
                         .wfull (),
                         .rempty ( rbuffer_empty ),
                         .wdata  (dram_io_data_out),
                         .winc   (dram_io_put_rbuffer_data),
                         .wclk   (dram_2x_clk),
                         .wrst_n (~reset),
`ifdef AXIS_FBDIMM_NO_FSR 
                         .rinc   ( rbuffer_rd ),
                         .rclk   ( dram_2x_clk  ),
`else
                         .rinc   ( rbuffer_rd  ),
                         .rclk   ( frm_begin ),
`endif
                         .inv (  disable_state ),
                         .rrst_n(~reset_sync)
                         );

`else
// Read Buffer
beh_fifo #(72,6) read_fifo (.rdata (rbuffer_rd_data),
                         .wfull (),
                         .rempty ( rbuffer_empty ),
                         .wdata  (dram_io_data_out),
                         .winc   (dram_io_put_rbuffer_data),
                         .wclk   (dram_2x_clk),
                         .wrst_n (~reset),
                         .rinc   ( rbuffer_rd  ),
                         .rclk   ( link_clk ),
                         .inv (  disable_state),
                         .rrst_n(~reset_sync)
                         );
`endif



// shifter logic


dff_n #(1) WF0( .signal_in   (Write_Frame_Reg),
              .signal_out  (Write_Frame_Wire_d[1]),
              .clk (clk_int)); 



dff_n #(1) WF1( .signal_in   (Write_Frame_Wire_d[1]),
              .signal_out  (Write_Frame_Wire_d[11]),
              .clk (clk_int));

dff_n #(1) WF2( .signal_in   (Write_Frame_Wire_d[11]),
              .signal_out  (Write_Frame_Wire_d[12]),
              .clk (clk_int));




`ifdef AXIS_FBDIMM_NO_FSR

dff_fbd #(1) WCR1( .signal_in   (Write_Config_reg),
              .signal_out  (Write_Config_reg_d1),
              .clk (clk_int));

dff_fbd #(1) WCR2( .signal_in   (Write_Config_reg_d1),
              .signal_out  (Write_Config_reg_d2),
              .clk (clk_int));

dff_fbd #(1) WCR3( .signal_in   (Write_Config_reg_d2),
              .signal_out  (Write_Config_reg_d3),
              .clk (clk_int));

dff_fbd #(1) WCR4( .signal_in   (Write_Config_reg_d3),
              .signal_out  (Write_Config_reg_d4),
              .clk (clk_int));



dff_fbd #(1) sync1( .signal_in   (sync_detected[0]),
              .signal_out  (sync_detected[1]),
              .clk (clk_int));

dff_fbd #(1) sync2( .signal_in   (sync_detected[1]),
              .signal_out  (sync_detected[2]),
              .clk (clk_int));

dff_fbd #(1) sync3( .signal_in   (sync_detected[2]),
              .signal_out  (sync_detected[3]),
              .clk (clk_int));

dff_fbd #(1) sync4( .signal_in   (sync_detected[3]),
              .signal_out  (sync_detected[4]),
              .clk (clk_int));

dff_fbd #(1) sync5( .signal_in   (sync_detected[4]),
              .signal_out  (sync_detected[5]),
              .clk (clk_int));

dff_fbd #(1) sync6( .signal_in   (sync_detected[5]),
              .signal_out  (sync_detected[6]),
              .clk (clk_int));

dff_fbd #(1) sync7( .signal_in   (sync_detected[6]),
              .signal_out  (sync_detected[7]),
              .clk (clk_int));

`else
dff_fbd #(1) WCR1( .signal_in   (Write_Config_reg),
              .signal_out  (Write_Config_reg_d1),
              .clk (link_clk));

dff_fbd #(1) WCR2( .signal_in   (Write_Config_reg_d1),
              .signal_out  (Write_Config_reg_d2),
              .clk (link_clk));

dff_fbd #(1) WCR3( .signal_in   (Write_Config_reg_d2),
              .signal_out  (Write_Config_reg_d3),
              .clk (link_clk));

dff_fbd #(1) WCR4( .signal_in   (Write_Config_reg_d3),
              .signal_out  (Write_Config_reg_d4),
              .clk (link_clk));



dff_fbd #(1) sync1( .signal_in   (sync_detected[0]),
              .signal_out  (sync_detected[1]),
              .clk (link_clk));

dff_fbd #(1) sync2( .signal_in   (sync_detected[1]),
              .signal_out  (sync_detected[2]),
              .clk (link_clk));

dff_fbd #(1) sync3( .signal_in   (sync_detected[2]),
              .signal_out  (sync_detected[3]),
              .clk (link_clk));

dff_fbd #(1) sync4( .signal_in   (sync_detected[3]),
              .signal_out  (sync_detected[4]),
              .clk (link_clk));

dff_fbd #(1) sync5( .signal_in   (sync_detected[4]),
              .signal_out  (sync_detected[5]),
              .clk (link_clk));

dff_fbd #(1) sync6( .signal_in   (sync_detected[5]),
              .signal_out  (sync_detected[6]),
              .clk (link_clk));

dff_fbd #(1) sync7( .signal_in   (sync_detected[6]),
              .signal_out  (sync_detected[7]),
              .clk (link_clk));

`endif


crc_FE data_crc(.B(Data_72) ,
                .E (CRC22));


crc_aE cmd_crc ( .B(Command_26),
                 .E (CRC14));

crc_FE_failover data_crc_failover (.B(Data_72) ,
                	           .E (CRC10_data_failover));

crc_aE_failover cmd_crc_failover ( .B(Command_26),
                                   .E (CRC10_cmd_failover));

endmodule


