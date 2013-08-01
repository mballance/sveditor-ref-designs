// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: channel_mon.v
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
`ifdef AXIS_FBDIMM_HW
`else
module channel_mon ( ps , pn , ps_bar,
                     sb_cmd_rdy,sb_cmd_type,sb_cmd_encoding, 
                     sb_frm_rdy, ps0,ps1,ps2,ps3,ps4,ps5,ps6,ps7,ps8,ps9,ps10,ps11,ps12,
                     nb_frm_rdy, pn0,pn1,pn2,pn3,pn4,pn5,pn6,pn7,pn8,pn9,pn10,pn11,pn12,
                     nb_frm_type,
                      write_fifo_empty,
                     init_out, rst , sclk,dram_clk);

// Parameters
parameter SB_LINK = 10;
parameter NB_LINK = 14;

// Inputs/Outputs
input [SB_LINK-1:0]  ps,ps_bar; // primary southbound
input [NB_LINK-1:0]  pn; // primary northbound
output [SB_LINK-1:0] ps0,ps1,ps2,ps3,ps4,ps5,ps6,ps7,ps8,ps9,ps10,ps11,ps12;
output [NB_LINK-1:0] pn0,pn1,pn2,pn3,pn4,pn5,pn6,pn7,pn8,pn9,pn10,pn11,pn12;
input                sclk,dram_clk;
output               init_out;
input                rst;
input                write_fifo_empty;
output [2:0]         sb_cmd_rdy;
output [14:0]        sb_cmd_type;
output [71:0]        sb_cmd_encoding;
output               nb_frm_rdy;
output [1:0]         nb_frm_type;
output               sb_frm_rdy;

//internal registers
reg [SB_LINK-1:0] trans_3,trans_2,trans_1,trans_0;
reg [SB_LINK-1:0] sb_frame[11:0];
reg [23:0]        aC,bC,cC;
reg [3:0]         sb_config;
reg [3:0]         nb_config;
reg [2:0]         cmd_B[3:0];
reg [2:0]         cmd_C[3:0];
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
reg [13:0]        Test_aE,Test_FE,calc_aE_reg,Test1_FE,calc_aE;
reg [21:0]        calc_FE_latch_reg,calc_FE_reg;
reg [71:0]        Data_72;
reg [25:0]        Command_26;
reg [31:0]        cfg_data;
reg [11:0]        frmdata_0,frmdata_1,frmdata_2,frmdata_3,frmdata_4,frmdata_5;
reg [11:0]        frmdata_6,frmdata_7,frmdata_8,frmdata_9,frmdata_10;
reg [5:0]         nosync_framecount;
reg [8:0]         LOs_Timer,Recalibrate_Timer;
reg [3:0]         fsr_counter,lock_counter,lock_counter2,prev_counter;
reg [3:0]         fsr_counter2,prev_counter2;
reg [2:0]         sb_cmd_rdy_reg;
reg [14:0]        sb_cmd_type_reg;
reg [71:0]        sb_cmd_encoding_reg;
reg [8:0]         sb_cmd_ds_reg;
reg [15:0]        ts0_pattern;
reg [10:0]        calibrate_state_counter; 
reg [NB_LINK-1:0] nb_frame[11:0];
reg [1:0]         inbank_debug_count;
reg [23:0]        Command;
reg [SB_LINK-1:0] C1,C2,C3,C4;
reg [6:0]         config_reg_cmd_latency_count;
reg [4:0]         frame_cnt;
reg [7:0]         sync_interval_frm_count;
reg [7:0]         self_refresh_exit_counter;
reg [31:0]        register_memory[0:2048];  // register memory image same should be same as fbdimm model
reg [3:0]         init_curr_state;
reg [63:0]        link_clk_count;
reg [143:0]       ts0_reg0,ts0_reg1,ts0_reg2,ts0_reg3,ts0_reg4,ts0_reg5,ts0_reg6;
reg [143:0]       ts0_reg7,ts0_reg8,ts0_reg9;
reg [11:0]        SB_transfer_reg,NB_transfer_reg;
reg [10:0]        polling_counter;
reg [10:0]        channel_latency;
reg [47:0]        initialization_register_link0;
reg               frame_complete;
reg               pending_config_reg_cmd;
reg               F0,F1;
reg               frm_boundary_d1;
reg               event_self_refresh_exit,event_dram_write_cmd,event_dram_nonread_cmd;
reg               latency_calculated;
reg               training_sequence_start_reg;
reg               header_detected,enable_fsm;
reg               Curr_Command_A_is_Sync,Prev_Command_A_is_Sync;
reg               command_A_rdy,command_B_rdy,command_C_rdy;
reg               tmpWS,Write_Frame_Reg,invalidate_Write_FIFO_reg,sb_crc_error_reg,init_reg,init_reg_d1;
reg               cfg_rd,reset_sync,sync_cmd_data,sync_detected_reg,first_sync_detected_reg;
reg		  autoref_write_reg,detected_autorefresh_cmd,sync_cmd_rdy,Last_TID,failover_sb,enter_recalibrate,enter_los;
reg               nb_12,bypass_init,failover_nb_13,failover_nb_14,enter_calibrate_state;
reg nb_header_detected, sb_header_detected;
reg [3:0] nb_frm_counter;
reg [3:0] nb_lock_counter;
reg nb_frm_boundary_d1;
wire ts0_ready_2of3;
wire              sb_crc_error_reg_d;
wire link_clk     = sclk;
wire link_clk_en;
wire link_clk_int;
wire [13:0]          CRC14;
wire [21:0]          CRC22;
wire                 enter_disable_state;
wire                 first_sync_detected_reg_d1;
wire [9:0]           CRC10_cmd_failover,CRC10_data_failover;
wire [SB_LINK-1:0]    ps_map,ps_map_bar;
wire [SB_LINK-1:0] sb0 = sb_frame[0];
wire [SB_LINK-1:0] sb1 = sb_frame[1];
wire [SB_LINK-1:0] sb2 = sb_frame[2];
wire [SB_LINK-1:0] sb3 = sb_frame[3];
wire [SB_LINK-1:0] sb4 = sb_frame[4];
wire [SB_LINK-1:0] sb5 = sb_frame[5];
wire [SB_LINK-1:0] sb6 = sb_frame[6];
wire frm_begin,frm_boundary,nb_frm_boundary;
wire                pn_data,pn_data_d1;
wire                pn_status, pn_status_d1;
wire                pn_alert, pn_alert_d1;
wire [2:0] sb2nbmap;
wire soft_channel_reset = invalidate_Write_FIFO_reg;

assign init_out = init_reg;
assign sb_cmd_rdy = sb_cmd_rdy_reg;
assign sb_cmd_type=sb_cmd_type_reg;
assign  sb_cmd_encoding=sb_cmd_encoding_reg;
wire [NB_LINK-1:0] pn_reg;
wire alert_frame;
wire training_sequence_start=training_sequence_start_reg;

assign sb_frm_rdy = frm_boundary_d1 | header_detected ;

assign link_clk_en = (ps === ps_bar ) ?  1'b1 : 
                  ( ~init_reg ) ? 1'b0 :
                  1'b1; 
assign link_clk_int = link_clk & link_clk_en;



assign nb_frm_rdy = (nb_frm_boundary | nb_header_detected ) ? 1'b1 : 1'b0;
assign nb_frm_type = ( pn_data )    ? 2'h1:
                     ( pn_status )  ? 2'h2: 
                     ( alert_frame ) ? 2'h3: 
                     2'h0;


assign ps_map = ( sb_config == 4'b1111 ) ?  ps : // all lanes are good
                ( sb_config == 4'b1001 ) ? {1'b0,ps[8:0]} : // map out lane 9
                ( sb_config == 4'b1000 ) ? {ps[8]  ,1'b0,ps[7:0]} : // map out lane 8
                ( sb_config == 4'b0111 ) ? {ps[8:7],1'b0,ps[6:0]} : // map out lane 7
                ( sb_config == 4'b0110 ) ? {ps[8:6],1'b0,ps[5:0]} : // map out lane 6
                ( sb_config == 4'b0101 ) ? {ps[8:5],1'b0,ps[4:0]} : // map out lane 5
                ( sb_config == 4'b0100 ) ? {ps[8:4],1'b0,ps[3:0]} : // map out lane 4
                ( sb_config == 4'b0011 ) ? {ps[8:3],1'b0,ps[2:0]} : // map out lane 3
                ( sb_config == 4'b0010 ) ? {ps[8:2],1'b0,ps[1:0]} : // map out lane 2
                ( sb_config == 4'b0001 ) ? {ps[8:1],1'b0,ps[0]}   : // map out lane 1
                ( sb_config == 4'b0000 ) ? {ps[9:1]}            : ps ; // map out lane 0

assign ps_map_bar = ( sb_config == 4'b1111 ) ?  ps_bar : // all lanes are good
                    ( sb_config == 4'b1001 ) ? {1'b0,ps_bar[8:0]} : // map out lane 9
                    ( sb_config == 4'b1000 ) ? {ps_bar[8]  ,1'b0,ps_bar[7:0]} : // map out lane 8
                    ( sb_config == 4'b0111 ) ? {ps_bar[8:7],1'b0,ps_bar[6:0]} : // map out lane 7
                    ( sb_config == 4'b0110 ) ? {ps_bar[8:6],1'b0,ps_bar[5:0]} : // map out lane 6
                    ( sb_config == 4'b0101 ) ? {ps_bar[8:5],1'b0,ps_bar[4:0]} : // map out lane 5
                    ( sb_config == 4'b0100 ) ? {ps_bar[8:4],1'b0,ps_bar[3:0]} : // map out lane 4
                    ( sb_config == 4'b0011 ) ? {ps_bar[8:3],1'b0,ps_bar[2:0]} : // map out lane 3
                    ( sb_config == 4'b0010 ) ? {ps_bar[8:2],1'b0,ps_bar[1:0]} : // map out lane 2
                    ( sb_config == 4'b0001 ) ? {ps_bar[8:1],1'b0,ps_bar[0]}   : // map out lane 1
                    ( sb_config == 4'b0000 ) ? {ps_bar[9:1]}            : ps_bar ; // map out lane 0



// AMB registers
wire [31:0] sync_train_interval_reg = register_memory[{3'h1,8'h78}];
wire [31:0] fbdreg_dsreftc = register_memory[{3'h3,8'h74}]; // dram self refresh and timing control


wire [12:0]	  Write_Frame_Wire_d;
wire [23:0]	  command_select = (command_A_rdy) ? aC[23:0] :
                                   (command_B_rdy) ? bC[23:0] :
                                   (command_C_rdy) ? cC[23:0] : 24'h0;


reg [13:0] pn0_reg,pn1_reg,pn2_reg,pn3_reg;
reg [13:0] pn4_reg,pn5_reg,pn6_reg,pn7_reg;
reg [13:0] pn8_reg,pn9_reg,pn10_reg,pn11_reg;

assign pn0 = pn0_reg;
assign pn1 = pn1_reg;
assign pn2 = pn2_reg;
assign pn3 = pn3_reg;
assign pn4 = pn4_reg;
assign pn5 = pn5_reg;
assign pn6 = pn6_reg;
assign pn7 = pn7_reg;
assign pn8 = pn8_reg;
assign pn9 = pn9_reg;
assign pn10 = pn10_reg;
assign pn11 = pn11_reg;



always@(posedge link_clk)
  nb_frm_boundary_d1 <= nb_frm_boundary;


always@(negedge link_clk)
begin
  frm_boundary_d1 <= frm_boundary;
end


dff_p #(1) pn_data_delay1 (.signal_in  ( pn_data ),
            .signal_out (pn_data_d1),
            .clk        (link_clk));

dff_p #(1) pn_status_delay1(.signal_in  ( pn_status ),
            .signal_out (pn_status_d1),
            .clk        (link_clk));

dff_p #(1) pn_alert_delay1(.signal_in  ( pn_alert ),
            .signal_out (pn_alert_d1),
            .clk        (link_clk));

always@(negedge link_clk)
begin
  pn0_reg <= pn1_reg;
  pn1_reg <= pn2_reg;
  pn2_reg <= pn3_reg;
  pn3_reg <= pn4_reg;
  pn4_reg <= pn5_reg;
  pn5_reg <= pn6_reg;
  pn6_reg <= pn7_reg;
  pn7_reg <= pn8_reg;
  pn8_reg <= pn9_reg;
  pn9_reg <= pn10_reg;
  pn10_reg <= pn11_reg;
  pn11_reg <= pn;

end


always@(posedge link_clk) 
  init_reg_d1 <= init_reg;

always@(posedge link_clk) 
begin

// checks 

  if ( event_dram_write_cmd ||
       event_dram_nonread_cmd )
  begin
    if ( self_refresh_exit_counter >= fbdreg_dsreftc[15:8] )
      `PR_ALWAYS ("ch_mon",`DBG_0,"ERROR: DRAM self-refresh exit to non-read comman timing violation!");
    self_refresh_exit_counter = 0;
  end

// counter unpdates

 if ( event_self_refresh_exit )
  self_refresh_exit_counter =  self_refresh_exit_counter + 1;
 else
  self_refresh_exit_counter = 0;

end


wire read_cmd_rdy = ( command_A_rdy | command_B_rdy | command_C_rdy ) && (command_select[20:18] == 3'b010 );
wire [38:0] read_cmd_rdy_d,sync_cmd_rdy_d;
wire sync_cmd_rdy_d1;

assign pn_data =  (read_cmd_rdy_d[1]) | (read_cmd_rdy_d[2]);
assign pn_status = sync_cmd_rdy_d1;
assign pn_alert = sb_crc_error_reg_d;


initial begin
 channel_latency=0;
 init_reg = 1;
end

shifter_p #(1) alert_frm_dly ( .signal_in (sb_crc_error_reg),
                               .signal_out ( sb_crc_error_reg_d),
                               .delay_cycles ( 10'd24),
                               .clk (link_clk));

shifter_p #(1) read_cmd_delay_d1 ( .signal_in (read_cmd_rdy),
                            .signal_out (read_cmd_rdy_d[1]),
                            .delay_cycles ( channel_latency - 4 + 12 ),
                            .clk (link_clk));

shifter_p #(1) read_cmd_delay_d2 ( .signal_in (read_cmd_rdy_d[1]),
                                   .signal_out (read_cmd_rdy_d[2]),
                                   .delay_cycles (10'hc),
                                   .clk (link_clk));

shifter_p #(1) read_cmd_delay_d3 ( .signal_in (read_cmd_rdy_d[2]),
                                   .signal_out (read_cmd_rdy_d[3]),
                                   .delay_cycles (10'h1),
                                   .clk (link_clk));

// sync command ready

shifter_p #(1) sync_cmd_delay_d1 ( .signal_in (sync_cmd_rdy && ( aC[20:18] == 3'b000 ) && ( aC[17:14] == 4'b0001)),
                            .signal_out (sync_cmd_rdy_d1),
                            .delay_cycles ( channel_latency - 4 + 12 ),
                            .clk (link_clk));

shifter_p #(1) sync_cmd_delay_d2 ( .signal_in (sync_cmd_rdy_d[1]),
                                   .signal_out (sync_cmd_rdy_d[2]),
                                   .delay_cycles (10'h1),
                                   .clk (link_clk));


reg autoref = 1'b0;

always@(posedge link_clk) if ( ~init_reg & (  command_A_rdy | command_B_rdy | command_C_rdy ) ) 
begin

  event_dram_write_cmd = 1'b0;
  event_dram_nonread_cmd = 1'b0;

 
  if ( command_select[20] && ( ( !F0 && !F1) || F1 ) ) 
    `PR_ALWAYS ("ch_mon",`DBG_0,"FBDIMM: Command A: ACTIVATE");
  else
   case (command_select[20:18])
    3'b000: begin
               if ( command_select[17:14] == 4'h0 ) begin
                // case ( {command_A_rdy,command_B_rdy,command_C_rdy} )
                //   3'b100: begin `PR_ALWAYS ("ch_mon",`DBG_4,"FBDIMM: Command A: NOP"); end
                //   3'b010: begin `PR_ALWAYS ("ch_mon",`DBG_4,"FBDIMM: Command B: NOP"); end
                //   3'b001: begin `PR_ALWAYS ("ch_mon",`DBG_4,"FBDIMM: Command C: NOP"); end
                // endcase
               end
               else if ( command_select[17:14] == 4'h1 ) begin
                 case ( {command_A_rdy,command_B_rdy,command_C_rdy} )
                   3'b100: begin `PR_ALWAYS ("ch_mon",`DBG_4,"FBDIMM: Command A: SYNC"); end
                   3'b010: begin `PR_ALWAYS ("ch_mon",`DBG_4,"FBDIMM: Command B: SYNC"); end
                   3'b001: begin `PR_ALWAYS ("ch_mon",`DBG_4,"FBDIMM: Command C: SYNC"); end
                 endcase
               end
               else if ( command_select[17:14] == 4'h2 ) begin
                 case ( {command_A_rdy,command_B_rdy,command_C_rdy} )
                   3'b100: begin `PR_ALWAYS ("ch_mon",`DBG_4,"FBDIMM: Command A: Soft channel Reset"); end
                   3'b010: begin `PR_ALWAYS ("ch_mon",`DBG_4,"FBDIMM: Command B: Soft channel Reset"); end
                   3'b001: begin `PR_ALWAYS ("ch_mon",`DBG_4,"FBDIMM: Command C: Soft channel Reset"); end
                 endcase
               end
               else if ( command_select[17:14] == 4'h4 ) begin
                 case ( {command_A_rdy,command_B_rdy,command_C_rdy} )
                   3'b100: begin `PR_ALWAYS ("ch_mon",`DBG_4,"FBDIMM: Command A: Read Config"); end
                   3'b010: begin `PR_ALWAYS ("ch_mon",`DBG_4,"FBDIMM: Command B: Read Config"); end
                   3'b001: begin `PR_ALWAYS ("ch_mon",`DBG_4,"FBDIMM: Command C: Read Config"); end
                 endcase
               end
               else if ( command_select[17:14] == 4'h5 ) begin
                 case ( {command_A_rdy,command_B_rdy,command_C_rdy} )
                   3'b100: begin `PR_ALWAYS ("ch_mon",`DBG_4,"FBDIMM: Command A: Write Config"); autoref_write_reg = 1; end
                   3'b010: begin `PR_ALWAYS ("ch_mon",`DBG_4,"FBDIMM: Command B: Write Config"); autoref_write_reg = 1;  end
                   3'b001: begin `PR_ALWAYS ("ch_mon",`DBG_4,"FBDIMM: Command C: Write Config"); autoref_write_reg = 1; end
                 endcase
               end
               else if ( command_select[17:14] == 4'h6 ) begin
                 case ( {command_A_rdy,command_B_rdy,command_C_rdy} )
                   3'b100: begin `PR_ALWAYS ("ch_mon",`DBG_4,"FBDIMM: Command A: Dram cke rank"); end
                   3'b010: begin `PR_ALWAYS ("ch_mon",`DBG_4,"FBDIMM: Command B: Dram cke rank"); end
                   3'b001: begin `PR_ALWAYS ("ch_mon",`DBG_4,"FBDIMM: Command C: Dram cke rank"); end
                 endcase
               end
               else if ( command_select[17:14] == 4'h7 ) begin
                 case ( {command_A_rdy,command_B_rdy,command_C_rdy} )
                   3'b100: begin `PR_ALWAYS ("ch_mon",`DBG_4,"FBDIMM: Command A: Dram cke dimm"); end
                   3'b010: begin `PR_ALWAYS ("ch_mon",`DBG_4,"FBDIMM: Command B: Dram cke dimm"); end
                   3'b001: begin `PR_ALWAYS ("ch_mon",`DBG_4,"FBDIMM: Command C: Dram cke dimm"); end
                 endcase
               end
               else begin
                 case ( {command_A_rdy,command_B_rdy,command_C_rdy} )
                   3'b100: begin `PR_ALWAYS ("ch_mon",`DBG_4,"FBDIMM: ERROR: Command A: undefined"); end
                   3'b010: begin `PR_ALWAYS ("ch_mon",`DBG_4,"FBDIMM: ERROR: Command B: undefined"); end
                   3'b001: begin `PR_ALWAYS ("ch_mon",`DBG_4,"FBDIMM: ERROR: Command C: undefined"); end
                 endcase
               end
            end
    3'b011: begin  
                event_dram_write_cmd = 1;
                 case ( {command_A_rdy,command_B_rdy,command_C_rdy} )
                   3'b100: begin `PR_ALWAYS ("ch_mon",`DBG_4,"FBDIMM: Command A: Write"); end
                   3'b010: begin `PR_ALWAYS ("ch_mon",`DBG_4,"FBDIMM: Command B: Write"); end
                   3'b001: begin `PR_ALWAYS ("ch_mon",`DBG_4,"FBDIMM: Command C: Write"); end
                 endcase
            end
    3'b010: begin  
                 case ( {command_A_rdy,command_B_rdy,command_C_rdy} )
                   3'b100: begin `PR_ALWAYS ("ch_mon",`DBG_4,"FBDIMM: Command A: Read"); end
                   3'b010: begin `PR_ALWAYS ("ch_mon",`DBG_4,"FBDIMM: Command B: Read"); end
                   3'b001: begin `PR_ALWAYS ("ch_mon",`DBG_4,"FBDIMM: Command C: Read"); end
                 endcase
             end
    3'b001: begin
               event_dram_nonread_cmd = 1;
               case (command_select[12:10]) 
                3'b111: begin 
                         case ( {command_A_rdy,command_B_rdy,command_C_rdy} )
                           3'b100: begin `PR_ALWAYS ("ch_mon",`DBG_4,"FBDIMM: Command A: Precharge All"); end
                           3'b010: begin `PR_ALWAYS ("ch_mon",`DBG_4,"FBDIMM: Command B: Precharge All"); end
                           3'b001: begin `PR_ALWAYS ("ch_mon",`DBG_4,"FBDIMM: Command C: Precharge All"); end
                         endcase
                        end
                3'b110: begin
                         case ( {command_A_rdy,command_B_rdy,command_C_rdy} )
                           3'b100: begin `PR_ALWAYS ("ch_mon",`DBG_4,"FBDIMM: Command A: Precharge Single"); end
                           3'b010: begin `PR_ALWAYS ("ch_mon",`DBG_4,"FBDIMM: Command B: Precharge Single"); end
                           3'b001: begin `PR_ALWAYS ("ch_mon",`DBG_4,"FBDIMM: Command C: Precharge Single"); end
                         endcase
                        end
                3'b101: begin
                         case ( {command_A_rdy,command_B_rdy,command_C_rdy} )
                           3'b100: begin `PR_ALWAYS ("ch_mon",`DBG_4,"FBDIMM: Command A: Auto Refresh"); detected_autorefresh_cmd = 1; end
                           3'b010: begin `PR_ALWAYS ("ch_mon",`DBG_4,"FBDIMM: Command B: Auto Refresh"); detected_autorefresh_cmd = 1; end
                           3'b001: begin `PR_ALWAYS ("ch_mon",`DBG_4,"FBDIMM: Command C: Auto Refresh"); detected_autorefresh_cmd = 1; end
                         endcase
                        end
                3'b100: begin
                         case ( {command_A_rdy,command_B_rdy,command_C_rdy} )
                           3'b100: begin `PR_ALWAYS ("ch_mon",`DBG_4,"FBDIMM: Command A: Enter Self Refresh"); end
                           3'b010: begin `PR_ALWAYS ("ch_mon",`DBG_4,"FBDIMM: Command B: Enter Self Refresh"); end
                           3'b001: begin `PR_ALWAYS ("ch_mon",`DBG_4,"FBDIMM: Command C: Enter Self Refresh"); end
                         endcase
                        end
                3'b011: begin
                         case ( {command_A_rdy,command_B_rdy,command_C_rdy} )
                           3'b100: begin `PR_ALWAYS ("ch_mon",`DBG_4,"FBDIMM: Command A: Exit Self Refresh/Exit Power Down"); end
                           3'b010: begin `PR_ALWAYS ("ch_mon",`DBG_4,"FBDIMM: Command B: Exit Self Refresh/Exit Power Down"); end
                           3'b001: begin `PR_ALWAYS ("ch_mon",`DBG_4,"FBDIMM: Command C: Exit Self Refresh/Exit Power Down"); end
                         endcase
                         event_self_refresh_exit = 1;
                        end
                3'b010: begin
                         case ( {command_A_rdy,command_B_rdy,command_C_rdy} )
                           3'b100: begin `PR_ALWAYS ("ch_mon",`DBG_4,"FBDIMM: Command A: Enter Power Down"); end
                           3'b010: begin `PR_ALWAYS ("ch_mon",`DBG_4,"FBDIMM: Command B: Enter Power Down"); end
                           3'b001: begin `PR_ALWAYS ("ch_mon",`DBG_4,"FBDIMM: Command C: Enter Power Down"); end
                         endcase
                        end
               endcase
            end
     default:  begin 
                         case ( {command_A_rdy,command_B_rdy,command_C_rdy} )
                           3'b100: begin `PR_ALWAYS ("ch_mon",`DBG_4,"FBDIMM: Command A: Undefined"); end
                           3'b010: begin `PR_ALWAYS ("ch_mon",`DBG_4,"FBDIMM: Command B: Undefined"); end
                           3'b001: begin `PR_ALWAYS ("ch_mon",`DBG_4,"FBDIMM: Command C: Undefined"); end
                         endcase
              end

   endcase


end

/************************* SB DECODER LOGIC *******************/

always@(posedge link_clk) if ( ~init_reg_d1)
  curr_state <= next_state;

always@(negedge link_clk) if ( ~init_reg_d1)
begin
 reset_sync=0;
  //curr_state = next_state;
  case(curr_state)
    `TRANSFER_0: begin
                 calc_FE_latch_reg= FE;
                 Prev_Command_A_is_Sync = Curr_Command_A_is_Sync;

                 if ( ps_map[6] == 0 ) begin // if f0=0
                    next_state = `TRANSFER_1;
                 end
                 if ( Write_Frame_Count[1:0] != 2'b0 ) // Means in the middle of 4 consecutive wr fr
                    next_state = `TRANSFER_1;

                  if ( ps_map[6] == 1 ) 
                    next_state = `TRANSFER_1;

                   {aE[0],aE[7],aE[8],F[0],aC[20],aC[16],aC[12],aC[8],aC[4],aC[0]} = ps_map[9:0];
                    tmpWS=ps_map[6]; // get F0
                    command_C_rdy = 0;
                 {Command_26[24],Command_26[23],Command_26[16],Command_26[15],Command_26[8],Command_26[7],Command_26[0]}=ps_map[6:0];   

                 if ( failover_sb )
                  {FE[3],FE[4]}={ps_map[8],ps_map[7]};
                 else
                  {FE[0],FE[7],FE[8]}={ps_map[9],ps_map[8],ps_map[7]};

                 { frmdata_4[11], frmdata_3[11],  frmdata_2[11], frmdata_1[11], frmdata_0[11]}  = ps_map[4:0];
                 { frmdata_9[11], frmdata_8[11],  frmdata_7[11], frmdata_6[11], frmdata_5[11]}  = ps_map[9:5];

                end
    `TRANSFER_1: begin
                     next_state = `TRANSFER_2;
                    {aE[1],aE[6],aE[9],F[1],aC[21],aC[17],aC[13],aC[9],aC[5],aC[1]} = ps_map[9:0];

                    if ( failover_sb ) 
                     {FE[2],FE[5]}={ps_map[8],ps_map[7]};
                    else  
                    {FE[1],FE[6],FE[9]}={ps_map[9],ps_map[8],ps_map[7]};

                 {Command_26[25],Command_26[22],Command_26[17],Command_26[14],Command_26[9],Command_26[6],Command_26[1]}=ps_map[6:0];   

                   if ( ps_map[6] == 0 ) begin // if f1=0 , then command frame
                    end
                  if ( ps_map[6] == 1 ) begin // if f1=1
                   WS_tmp[3:0] = {tmpWS,WS_tmp[3:1]};
                   Write_Frame_Reg = 1;
                 end 


                 { frmdata_4[10], frmdata_3[10],  frmdata_2[10], frmdata_1[10], frmdata_0[10]}  = ps_map[4:0];
                 { frmdata_9[10], frmdata_8[10],  frmdata_7[10], frmdata_6[10], frmdata_5[10]}  = ps_map[9:5];

                 end
    `TRANSFER_2: begin
                     Write_Frame_Reg = 0;
                     next_state = `TRANSFER_3;
                 {Command_26[21],Command_26[18],Command_26[13],Command_26[10],Command_26[5],Command_26[2]}=ps_map[5:0];   

                    {aE[2],aE[5],aE[10],aE[13],aC[22],aC[18],aC[14],aC[10],aC[6],aC[2]} = ps_map[9:0];

                 if ( failover_sb )
                   {FE[1],FE[6],FE[9]}={ps_map[8],ps_map[7],ps_map[6]};
                 else
                   {FE[2],FE[5],FE[10],FE[13]}={ps_map[9],ps_map[8],ps_map[7],ps_map[6]};

                 { frmdata_4[9], frmdata_3[9],  frmdata_2[9], frmdata_1[9], frmdata_0[9]}  = ps_map[4:0];
                 { frmdata_9[9], frmdata_8[9],  frmdata_7[9], frmdata_6[9], frmdata_5[9]}  = ps_map[9:5];

                 end
    `TRANSFER_3: begin
                     next_state = `TRANSFER_4;
                    {aE[3],aE[4],aE[11],aE[12],aC[23],aC[19],aC[15],aC[11],aC[7],aC[3]} = ps_map[9:0];
                 {Command_26[20],Command_26[19],Command_26[12],Command_26[11],Command_26[4],Command_26[3]}=ps_map[5:0];   

                 if ( failover_sb )
                   {FE[0],FE[7],FE[8]}={ps_map[8],ps_map[7],ps_map[6]};
                 else
                  {FE[3],FE[4],FE[11],FE[12]}={ps_map[9],ps_map[8],ps_map[7],ps_map[6]};
                       command_A_rdy = 1;  
                  if ( aC[20:14] == 6'h1)
                    Curr_Command_A_is_Sync=1;
                  else
                    Curr_Command_A_is_Sync=0;


                    sync_cmd_rdy=1;
                 { frmdata_4[8], frmdata_3[8],  frmdata_2[8], frmdata_1[8], frmdata_0[8]}  = ps_map[4:0];
                 { frmdata_9[8], frmdata_8[8],  frmdata_7[8], frmdata_6[8], frmdata_5[8]}  = ps_map[9:5];

                 end
     `TRANSFER_4: begin
                    next_state = `TRANSFER_5;
                    FE[21]=ps_map[9];
                    {bC[20],bC[16],bC[12],bC[8],bC[4],bC[0]}=ps_map[5:0];
                    WDATA[8:0]=ps_map[8:0];
                    cmd_B[0] = ps_map[8:6];
                    command_A_rdy = 0; 
                    sync_cmd_rdy=0;  
                    Data_72[8:0]=ps_map[8:0];
                    calc_aE_reg=calc_aE;
                 { frmdata_4[3], frmdata_3[3],  frmdata_2[3], frmdata_1[3], frmdata_0[3]}  = ps_map[4:0];
                 { frmdata_9[3], frmdata_8[3],  frmdata_7[3], frmdata_6[3], frmdata_5[3]}  = ps_map[9:5];

                  end
     `TRANSFER_5: begin
                    next_state = `TRANSFER_6;
                    FE[20]=ps_map[9];
                    {bC[21],bC[17],bC[13],bC[9],bC[5],bC[1]}=ps_map[5:0];
                    cmd_B[1] = ps_map[8:6];
                    WDATA[17:9]=ps_map[8:0];
                    Data_72[17:9]={ps_map[0],ps_map[1],ps_map[2],ps_map[3],ps_map[4],ps_map[5],ps_map[6],ps_map[7],ps_map[8]};
                 { frmdata_4[2], frmdata_3[2],  frmdata_2[2], frmdata_1[2], frmdata_0[2]}  = ps_map[4:0];
                 { frmdata_9[2], frmdata_8[2],  frmdata_7[2], frmdata_6[2], frmdata_5[2]}  = ps_map[9:5];
                  end
     `TRANSFER_6: begin
                    next_state = `TRANSFER_7;
                    FE[19]=ps_map[9];
                    {bC[22],bC[18],bC[14],bC[10],bC[6],bC[2]}=ps_map[5:0];
                    WDATA[26:18]=ps_map[8:0];
                    cmd_B[2] = ps_map[8:6];
                    Data_72[26:18]=ps_map[8:0];
                 { frmdata_4[1], frmdata_3[1],  frmdata_2[1], frmdata_1[1], frmdata_0[1]}  = ps_map[4:0];
                 { frmdata_9[1], frmdata_8[1],  frmdata_7[1], frmdata_6[1], frmdata_5[1]}  = ps_map[9:5];

                  end
     `TRANSFER_7: begin
                    next_state = `TRANSFER_8;
                    FE[18]=ps_map[9];
                    {bC[23],bC[19],bC[15],bC[11],bC[7],bC[3]}=ps_map[5:0];
                    if ( (cmd_B[0] == 3'h0 ) && 
                         (cmd_B[1] == 3'h0 ) &&
                         (cmd_B[2] == 3'h0 ) &&
                         (ps_map[8:6]  == 3'h0 ) &&  (F[1:0] == 2'h0 )) begin
                      command_B_rdy = 1;   
                    end
                
                    Data_72[35:27]={ps_map[0],ps_map[1],ps_map[2],ps_map[3],ps_map[4],ps_map[5],ps_map[6],ps_map[7],ps_map[8]};
                    WDATA[35:27]=ps_map[8:0];
                 { frmdata_4[0], frmdata_3[0],  frmdata_2[0], frmdata_1[0], frmdata_0[0]}  = ps_map[4:0];
                 { frmdata_9[0], frmdata_8[0],  frmdata_7[0], frmdata_6[0], frmdata_5[0]}  = ps_map[9:5];

                  end
     `TRANSFER_8: begin
                    next_state = `TRANSFER_9;
                    FE[17]=ps_map[9];
                    command_B_rdy = 0;   
                    {cC[20],cC[16],cC[12],cC[8],cC[4],cC[0]}=ps_map[5:0];
                    {BE[0],D[28],D[24],D[20],D[16],D[12],D[8],D[4],D[0]}=ps_map[8:0]; 
                    cmd_C[0]=ps_map[8:6];
                    WDATA[44:36]=ps_map[8:0];
                    Data_72[44:36]=ps_map[8:0];
                 { frmdata_4[7], frmdata_3[7],  frmdata_2[7], frmdata_1[7], frmdata_0[7]}  = ps_map[4:0];
                 { frmdata_9[7], frmdata_8[7],  frmdata_7[7], frmdata_6[7], frmdata_5[7]}  = ps_map[9:5];

                  end
     `TRANSFER_9: begin
                    next_state = `TRANSFER_10;
                    FE[16]=ps_map[9];
                    {cC[21],cC[17],cC[13],cC[9],cC[5],cC[1]}=ps_map[5:0];
                    {BE[1],D[29],D[25],D[21],D[17],D[13],D[9],D[5],D[1]}=ps_map[8:0]; 
                    WDATA[53:45]=ps_map[8:0];
                    cmd_C[1]=ps_map[8:6];
                    Data_72[53:45]={ps_map[0],ps_map[1],ps_map[2],ps_map[3],ps_map[4],ps_map[5],ps_map[6],ps_map[7],ps_map[8]};
                 { frmdata_4[6], frmdata_3[6],  frmdata_2[6], frmdata_1[6], frmdata_0[6]}  = ps_map[4:0];
                 { frmdata_9[6], frmdata_8[6],  frmdata_7[6], frmdata_6[6], frmdata_5[6]}  = ps_map[9:5];

                    end
     `TRANSFER_10: begin
                    next_state = `TRANSFER_11;
                    FE[15]=ps_map[9];
                    {cC[22],cC[18],cC[14],cC[10],cC[6],cC[2]}=ps_map[5:0];
                    {BE[2],D[30],D[26],D[22],D[18],D[14],D[10],D[6],D[2]}=ps_map[8:0]; 
                    WDATA[62:54]=ps_map[8:0];
                    cmd_C[2]=ps_map[8:6];
                    Data_72[62:54]=ps_map[8:0];

                 { frmdata_4[5], frmdata_3[5],  frmdata_2[5], frmdata_1[5], frmdata_0[5]}  = ps_map[4:0];
                 { frmdata_9[5], frmdata_8[5],  frmdata_7[5], frmdata_6[5], frmdata_5[5]}  = ps_map[9:5];

                  end
     `TRANSFER_11: begin
                    next_state = `TRANSFER_0;
                    FE[14]=ps_map[9];
                    {cC[23],cC[19],cC[15],cC[11],cC[7],cC[3]}=ps_map[5:0];
                    {BE[3],D[31],D[27],D[23],D[19],D[15],D[11],D[7],D[3]}=ps_map[8:0];
                    WDATA[71:63]=ps_map[8:0];
                    Write_Frame_Reg = 0;
                    if ( (cmd_C[0] == 3'h0 ) && 
                         (cmd_C[1] == 3'h0 ) &&
                         (cmd_C[2] == 3'h0 ) &&
                         (ps_map[8:6]  == 3'h0 ) &&  (F[1:0] == 2'h0) ) begin
                    command_C_rdy = 1;   
                    end
                   WS=WS_tmp[2:0];

                   Write_Frame_Count[1:0] = Write_Frame_Count[1:0] + 2'b1;
                   Data_72[71:63]={ps_map[0],ps_map[1],ps_map[2],ps_map[3],ps_map[4],ps_map[5],ps_map[6],ps_map[7],ps_map[8]};

                 { frmdata_4[4], frmdata_3[4],  frmdata_2[4], frmdata_1[4], frmdata_0[4]}  = ps_map[4:0];
                 { frmdata_9[4], frmdata_8[4],  frmdata_7[4], frmdata_6[4], frmdata_5[4]}  = ps_map[9:5];

                 `ifdef AXIS_FBDIMM_HW
                 `else
                 /*  if ( !sb_crc_error ) begin
                    register_memory[{3'b001,8'hae}]=frmdata_0;
                    register_memory[{3'b001,8'hac}]=frmdata_1;
                    register_memory[{3'b001,8'haa}]=frmdata_2;
                    register_memory[{3'b001,8'ha8}]=frmdata_3;
                    register_memory[{3'b001,8'ha6}]=frmdata_4;
                    register_memory[{3'b001,8'ha4}]=frmdata_5;
                    register_memory[{3'b001,8'ha2}]=frmdata_6;
                    register_memory[{3'b001,8'ha0}]=frmdata_7;
                    register_memory[{3'b001,8'h9e}]=frmdata_8;
                    register_memory[{3'b001,8'h9c}]=frmdata_9;
                    register_memory[{3'b001,8'hae}]=frmdata_10;
                   end
                  */
                  `endif



                  end
    default: $display("unknown state");
  endcase


end else begin
             command_A_rdy = 1'b0;
             command_B_rdy = 1'b0;
             command_C_rdy = 1'b0;
	     curr_state = `TRANSFER_0;
	     next_state = `TRANSFER_0;
         end


always@(posedge link_clk) if (( curr_state == `TRANSFER_11 ) && ~init_reg_d1 )
begin

                   // CRC checks
                   // if TestaE[n] !== aE[n]

                  Test_aE[13:0] = {FE_latch[13] ^ aE[13],
                                   FE_latch[12] ^ aE[12],
                                   FE_latch[11] ^ aE[11],
                                   FE_latch[10] ^ aE[10],
                                   FE_latch[09] ^ aE[09],
                                   FE_latch[08] ^ aE[08],
                                   FE_latch[07] ^ aE[07],
                                   FE_latch[06] ^ aE[06],
                                   FE_latch[05] ^ aE[05],
                                   FE_latch[04] ^ aE[04],
                                   FE_latch[03] ^ aE[03],
                                   FE_latch[02] ^ aE[02],
                                   FE_latch[01] ^ aE[01],
                                   FE_latch[00] ^ aE[00]};

            if (!failover_sb)
              if ( !Prev_Command_A_is_Sync )
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
`ifdef AXIS_FBDIMM_HW
`else
                     `PR_ALWAYS ("ch_mon",`DBG_1,"ERROR: Command has CRC mismatch => Test_aE %h  !=  aE %h \n",Test_aE,CRC14);
`endif
                    sb_crc_error_reg=1;
                    end
                   else if ( sync_detected_reg  || soft_channel_reset )
                    sb_crc_error_reg=0;


            if (failover_sb)
              if ( !Prev_Command_A_is_Sync )
                 if ( ((FE_latch[13] ^ aE[13]) !== CRC10_cmd_failover[09] ) ||
                      ((FE_latch[12] ^ aE[12]) !== CRC10_cmd_failover[08] ) ||
                      ((FE_latch[11] ^ aE[11]) !== CRC10_cmd_failover[07] ) ||
                      ((FE_latch[10] ^ aE[10]) !== CRC10_cmd_failover[06] ) ||
                      ((FE_latch[09] ^ aE[09]) !== CRC10_cmd_failover[05] ) ||
                      ((FE_latch[08] ^ aE[08]) !== CRC10_cmd_failover[04] ) ||
                      ((FE_latch[07] ^ aE[07]) !== CRC10_cmd_failover[03] ) ||
                      ((FE_latch[06] ^ aE[06]) !== CRC10_cmd_failover[02] ) ||
                      ((FE_latch[05] ^ aE[05]) !== CRC10_cmd_failover[01] ) ||
                      ((FE_latch[04] ^ aE[04]) !== CRC10_cmd_failover[00] ) 
                    ) 
                  begin
`ifdef AXIS_FBDIMM_HW
`else
                     `PR_ALWAYS ("ch_mon",`DBG_1,"ERROR: Failover mode: Command has CRC mismatch => FE_Latch %h ^ aE %h  !=   CRC10_cmd_failover =  %h \n",FE_latch[13:4],aE[13:4],CRC10_cmd_failover);
`endif
                    sb_crc_error_reg=1;
                    end
                   else if ( sync_detected_reg || soft_channel_reset )
                    sb_crc_error_reg=0;

  if ( failover_sb )
   Test1_FE[13:0] = {CRC10_cmd_failover[09] ^ aE[13],
                     CRC10_cmd_failover[08] ^ aE[12],
                     CRC10_cmd_failover[07] ^ aE[11],
                     CRC10_cmd_failover[06] ^ aE[10],
                     CRC10_cmd_failover[05] ^ aE[09],
                     CRC10_cmd_failover[04] ^ aE[08],
                     CRC10_cmd_failover[03] ^ aE[07],
                     CRC10_cmd_failover[02] ^ aE[06],
                     CRC10_cmd_failover[01] ^ aE[05],
                     CRC10_cmd_failover[00] ^ aE[04],
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
  if ( !Prev_Command_A_is_Sync )
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
       ((CRC14[00] ^ aE[00]) !== FE_latch[00] ) )
   begin
                     `PR_ALWAYS ("ch_mon",`DBG_1,"ERROR: Data has CRC mismatch Test1_FE = %h !=  FE = %h\n",Test1_FE,FE_latch);
                     sb_crc_error_reg=1;
   end
   else if ( sync_detected_reg || soft_channel_reset )
                     sb_crc_error_reg=0;


 if ( failover_sb )
  if ( !Prev_Command_A_is_Sync )
   if ( ((CRC10_cmd_failover[09] ^ aE[13]) !== FE_latch[13] ) ||
       ((CRC10_cmd_failover[08] ^ aE[12]) !== FE_latch[12] ) ||
       ((CRC10_cmd_failover[07] ^ aE[11]) !== FE_latch[11] ) ||
       ((CRC10_cmd_failover[06] ^ aE[10]) !== FE_latch[10] ) ||
       ((CRC10_cmd_failover[05] ^ aE[09]) !== FE_latch[09] ) ||
       ((CRC10_cmd_failover[04] ^ aE[08]) !== FE_latch[08] ) ||
       ((CRC10_cmd_failover[03] ^ aE[07]) !== FE_latch[07] ) ||
       ((CRC10_cmd_failover[02] ^ aE[06]) !== FE_latch[06] ) ||
       ((CRC10_cmd_failover[01] ^ aE[05]) !== FE_latch[05] ) ||
       ((CRC10_cmd_failover[00] ^ aE[04]) !== FE_latch[04] ) )
   begin
                     `PR_ALWAYS ("ch_mon",`DBG_1,"ERROR: Failover mode: Data has CRC mismatch Test1_FE = %h !=   FE =  %h\n",Test1_FE,FE_latch);
                     sb_crc_error_reg=1;
   end
   else if ( sync_detected_reg || soft_channel_reset )
                     sb_crc_error_reg=0;

// 10th bit lane carries pattern info for sync frames so we will not do this check for sycn frames

 if ( !failover_sb )
  if ( !Curr_Command_A_is_Sync )
   if ( FE[21:14] !== CRC22[21:14] ) begin
         `PR_ALWAYS ("ch_mon",`DBG_1,"ERROR: Data has CRC mismatch Test2_FE[21:14] =  %h !=   CRC[21:14]  = %h\n",FE[21:14],  CRC22[21:14]);
         sb_crc_error_reg=1;
   end
   else if ( sync_detected_reg || soft_channel_reset )
         sb_crc_error_reg=0;
  @(negedge link_clk);
  if ( failover_sb )
   FE_latch = {CRC10_data_failover[9:0],4'h0};
  else
   FE_latch = CRC22[13:0];

end
else
   sb_crc_error_reg=0;


// Channel Commands

reg Write_Config_reg;
wire Write_Config_reg_d1,Write_Config_reg_d2,Write_Config_reg_d3,Write_Config_reg_d4;
reg [10:0] Write_Config_addr_reg;

always@(posedge link_clk)
begin

   // channel reset command
   if ( command_A_rdy && ( aC[20:18] == 3'b000 ) && ( aC[17:14] == 4'b0010) )
   begin
`ifdef AXIS_FBDIMM_HW
`else
    `PR_ALWAYS ("ch_mon",`DBG_0,"Soft Channel Reset detected. Invalidating all write FIFOs");
`endif
    invalidate_Write_FIFO_reg=1;
   end
   else 
    invalidate_Write_FIFO_reg=0;

  // write config command
  if ( command_B_rdy && ( bC[20:14] == 7'b0000101 ) && ( bC[12] == ~Last_TID ) )
  begin
`ifdef AXIS_FBDIMM_HW
`else
    `PR_ALWAYS ("ch_mon",`DBG_0,"Write config register received : Function number %h Register Address  %h",bC[10:8],bC[10:0]);
`endif

    Last_TID=bC[12]; // update last tid
    Write_Config_reg=1;
    Write_Config_addr_reg=bC[10:0];
  end
  else
    Write_Config_reg=0;


  // read config command
  if (  (command_A_rdy || command_B_rdy || command_C_rdy) && ( command_select[20:14] == 7'b0000100 ) )
  begin
`ifdef AXIS_FBDIMM_HW
`else
    `PR_ALWAYS ("ch_mon",`DBG_0,"Read config register received : Function number %h Register Address %h Register data     %h",command_select[10:8],command_select[7:2],register_memory[command_select[10:0]]);
    cfg_data=register_memory[command_select[10:0]];
`endif
    cfg_rd=1;
  end
   else 
    cfg_rd=0;

   // sync command
   if ( sync_cmd_rdy && ( aC[20:18] == 3'b000 ) && ( aC[17:14] == 4'b0001) )
   begin
`ifdef AXIS_FBDIMM_HW
`else
     `PR_ALWAYS ("ch_mon",`DBG_0,"Sync detected. sd=%h ier=%b erc=%b el0s=%b r1,r0=%h",aC[12:11],aC[6],aC[5],aC[4],aC[1:0]);
`endif
     sync_detected_reg=1;
     first_sync_detected_reg <= 1;
     sync_cmd_data=aC;
     sync_counter_reg = 0;


   end
   else begin
     sync_detected_reg=0;
     sync_counter_reg = sync_counter_reg + 1;
   end

end

dff_p #(1) sync_delay1 (.signal_in ( first_sync_detected_reg ),
                        .signal_out ( first_sync_detected_reg_d1),
                        .clk (link_clk));

always@(negedge link_clk) 
begin
   if ( sync_detected_reg && first_sync_detected_reg_d1 /* && ( sync_interval_frm_count !== 0 ) */ ) begin
     if ( sync_interval_frm_count < (sync_train_interval_reg * 12 ) ) begin
       `PR_ALWAYS ("ch_mon",`DBG_0,"ERROR: Sync Train interval reg %d >  sync_interval_frm_count %d \n",sync_train_interval_reg,sync_interval_frm_count);
     end
     sync_interval_frm_count = 0;
   end
   else if ( first_sync_detected_reg  )
    sync_interval_frm_count = sync_interval_frm_count + 1;

end

wire [31:0] wcfg_data  ={WDATA[70],WDATA[61],WDATA[52],WDATA[43],WDATA[69],WDATA[60],WDATA[51],WDATA[42],WDATA[68],WDATA[59],WDATA[50],WDATA[41],WDATA[67],WDATA[58],WDATA[49],WDATA[40],WDATA[66],WDATA[57],WDATA[48],WDATA[39],WDATA[65],WDATA[56],WDATA[47],WDATA[38],WDATA[64],WDATA[55],WDATA[46],WDATA[37],WDATA[63],WDATA[54],WDATA[45],WDATA[36]};
// wire [31:0] wcfg_data;

always@(posedge link_clk)
begin
 if ( Write_Config_reg_d4 )
 begin
`ifdef AXIS_FBDIMM_HW
`else
    register_memory[Write_Config_addr_reg]={WDATA[71:63],WDATA[62:54],WDATA[53:45],WDATA[44:36]};
      
register_memory[Write_Config_addr_reg]= wcfg_data;
    `PR_ALWAYS ("ch_mon",`DBG_0,"Write config data: %h",  wcfg_data);

`endif
 end

end


/**************************************************************/


 

always@(negedge link_clk) if ( ~init_reg_d1)
begin
 sb_frame[0] = /*frame_complete ? {SB_LINK { 1'bz}} :*/  sb_frame[1];
 sb_frame[1] = sb_frame[2];
 sb_frame[2] = sb_frame[3];
 sb_frame[3] = sb_frame[4];
 sb_frame[4] = sb_frame[5];
 sb_frame[5] = sb_frame[6];
 sb_frame[6] = sb_frame[7];
 sb_frame[7] = sb_frame[8];
 sb_frame[8] = sb_frame[9];
 sb_frame[9] = sb_frame[10];
 sb_frame[10] = sb_frame[11];
 sb_frame[11] = ps_map;


end

reg [9:0] ps0_reg,ps1_reg,ps2_reg,ps3_reg,ps4_reg,ps5_reg,ps6_reg,ps7_reg,ps8_reg,ps9_reg,ps10_reg,ps11_reg;

assign ps0  = ps0_reg;
assign ps1  = ps1_reg;
assign ps2  = ps2_reg;
assign ps3  = ps3_reg;
assign ps4  = ps4_reg;
assign ps5  = ps5_reg;
assign ps6  = ps6_reg;
assign ps7  = ps7_reg;
assign ps8  = ps8_reg;
assign ps9  = ps9_reg;
assign ps10  = ps10_reg;
assign ps11  = ps11_reg;

always@(negedge link_clk)
begin
 ps0_reg <= ps1_reg;
 ps1_reg <= ps2_reg;
 ps2_reg <= ps3_reg;
 ps3_reg <= ps4_reg;
 ps4_reg <= ps5_reg;
 ps5_reg <= ps6_reg;
 ps6_reg <= ps7_reg;
 ps7_reg <= ps8_reg;
 ps8_reg <= ps9_reg;
 ps9_reg <= ps10_reg;
 ps10_reg <= ps11_reg;
 ps11_reg <= ps_map;

end

initial begin
Last_TID=0;
sb_config = 4'hf;
nb_config = 4'hf;
first_sync_detected_reg = 0;
sync_cmd_rdy = 0;
sb_crc_error_reg=0;

`ifdef STINGRAY
frame_cnt=5'hb;
`else
frame_cnt=0;
`endif

 nosync_framecount=0;
 curr_state = `TRANSFER_0;
 next_state = `TRANSFER_0;

`ifdef STINGRAY
`else
 $readmemh("fbdimm_register.data",register_memory);
`endif
  if ( $test$plusargs("mapout_sb9") ||
       $test$plusargs("mapout_sb8") ||
       $test$plusargs("mapout_sb7") ||
       $test$plusargs("mapout_sb6") ||
       $test$plusargs("mapout_sb5") ||
       $test$plusargs("mapout_sb4") ||
       $test$plusargs("mapout_sb3") ||
       $test$plusargs("mapout_sb2") ||
       $test$plusargs("mapout_sb1") ||
       $test$plusargs("mapout_sb0") 
      )
    failover_sb = 1;
  else
    failover_sb = 0;

  if ( $test$plusargs("bypass_init"))
    lock_counter = 4'h1;
  else
    lock_counter= 4'h2;

  lock_counter2=4'h1;
  nb_lock_counter = 4'h1;

  if ( $test$plusargs("mapout_sb9"))
    sb_config = 4'b1001;
  if ( $test$plusargs("mapout_sb8"))
    sb_config = 4'b1000;
  if ( $test$plusargs("mapout_sb7"))
    sb_config = 4'b0111;
  if ( $test$plusargs("mapout_sb6"))
    sb_config = 4'b0110;
  if ( $test$plusargs("mapout_sb5"))
    sb_config = 4'b0101;
  if ( $test$plusargs("mapout_sb4"))
    sb_config = 4'b0100;
  if ( $test$plusargs("mapout_sb3"))
    sb_config = 4'b0011;
  if ( $test$plusargs("mapout_sb2"))
    sb_config = 4'b0010;
  if ( $test$plusargs("mapout_sb1"))
    sb_config = 4'b0001;
  if ( $test$plusargs("mapout_sb0"))
    sb_config = 4'b0000;

  if ( $test$plusargs("fbdimm_dbg_0")) // || $test$plusargs("fbdimm_dbg") )
    $ch_dispmon("ch_mon",`DBG_0,1);

  if ( $test$plusargs("fbdimm_dbg_1"))
    $ch_dispmon("ch_mon",`DBG_1,1);

  if ( $test$plusargs("fbdimm_dbg_2"))
    $ch_dispmon("ch_mon",`DBG_2,1);

  if ( $test$plusargs("fbdimm_dbg_3"))
    $ch_dispmon("ch_mon",`DBG_3,1);

  if ( $test$plusargs("fbdimm_dbg_4"))
    $ch_dispmon("ch_mon",`DBG_4,1);



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

  if ( $test$plusargs("bypass_init") ) begin
    init_reg = 0;
    bypass_init=1;
  end
  else
   bypass_init=0;

end

always@(posedge link_clk) if ( ~init_reg_d1)
begin
  if ( (ps_map ==  { SB_LINK { 1'bx} } ) ||
     ( ps_map == { SB_LINK { 1'bz} } ) )
  begin
    frame_cnt=0;
  end
   else if ( frame_cnt == 5'hb ) begin
    frame_cnt=0;
    frame_complete=1; end
   else begin
    frame_cnt=frame_cnt+1;
      frame_complete=0; end

end


always@(posedge link_clk) if ( ~init_reg_d1) begin
 

if ( (sb_cmd_rdy_reg[2] && (sb_cmd_type_reg[14:10] == `CMD_RCFG )) ||
     (sb_cmd_rdy_reg[2] && (sb_cmd_type_reg[14:10] == `CMD_WCFG )) )
begin
  if ( config_reg_cmd_latency_count <= 24 ) // 2 frames
    `PR_ALWAYS ("ch_mon",`DBG_0,"ERROR: Multiple rd=wr config commands present!");
  pending_config_reg_cmd=1;
  config_reg_cmd_latency_count = 0 ;
end
else if ( (sb_cmd_rdy_reg[1] && (sb_cmd_type_reg[9:5] == `CMD_RCFG )) ||
     (sb_cmd_rdy_reg[1] && (sb_cmd_type_reg[9:5] == `CMD_WCFG )) )
begin
  if ( config_reg_cmd_latency_count <= 24 ) // 2 frames
    `PR_ALWAYS ("ch_mon",`DBG_0,"ERROR: Multiple rd=wr config commands present!");
  pending_config_reg_cmd=1;
  config_reg_cmd_latency_count = 0 ;
end
else if ( (sb_cmd_rdy_reg[0] && (sb_cmd_type_reg[4:0] == `CMD_RCFG )) ||
     (sb_cmd_rdy_reg[0] && (sb_cmd_type_reg[4:0] == `CMD_WCFG )) )
begin
  if ( config_reg_cmd_latency_count <= 24 ) // 2 frames
    `PR_ALWAYS ("ch_mon",`DBG_0,"ERROR: Multiple rd=wr config commands present!");
  pending_config_reg_cmd=1;
  config_reg_cmd_latency_count = 0 ;
end
else
  config_reg_cmd_latency_count = config_reg_cmd_latency_count + 1;

end

// AMB registers

//----ADDED BY SWATI---
// Auto-refresh assertion.
reg	detected_sync_cmd=0;
reg	auto_refresh_bit_in_fsm=0;
reg [15:0]  dram_autorefresh_count=0;
wire [31:0]  fbdreg_dareftc  = register_memory[{3'b011,8'h70}]; // function 3, offset 70h pg 119
wire [31:0]  fbdreg_synctrainint  = register_memory[{3'b001,8'h78}]; // function 1, offset 78h pg 103
wire [7:0]   autorefresh_period	    =fbdreg_dareftc[23:16];
wire [14:0]  autorefresh_interval    =fbdreg_dareftc[14:0];
reg [8:0] autoref_reg_write = 0; 
// The moment the autorefresh reg is written the autorefresh_count should be set to 0
//reg [14:0] autorefresh_interval	=3120;
//reg [7:0]  autorefresh_period	   =78;

always@(posedge dram_clk)
begin
  dram_autorefresh_count=dram_autorefresh_count+1;
  //$display("\ndram_autorefresh_count = %d\n",dram_autorefresh_count);
  //$display("\nautorefresh_interval = %d\n",autorefresh_interval);
  if ( detected_autorefresh_cmd == 1 || autoref_write_reg == 1) 
  begin
    dram_autorefresh_count=0;
    autoref_write_reg = 0;
    detected_autorefresh_cmd = 0;
  end
  else if( (dram_autorefresh_count == autorefresh_period) )
  begin
    `PR_ALWAYS ("ch_mon",`DBG_0,"WARNING:	Auto Refresh Cmd has not been sent for auto-refresh period\n");
  end
  else if( (dram_autorefresh_count > autorefresh_interval ) ) // The plus 1 is because
  // The commands are known only in the next dram clock cycle
  begin
    if(!auto_refresh_bit_in_fsm)
    begin
      `PR_ALWAYS ("ch_mon",`DBG_0,"ERROR:	Auto Refresh Cmd has not been sent for auto-refresh interval.\n");
      dram_autorefresh_count=0;
    end
  end
end
//----ADDED BY SWATI---



always@(posedge frame_complete) if ( ~init_reg_d1)
begin

 if ( ( sb_frame[0] !== { SB_LINK { 1'bz} } ) ) 
  if ( ( sb_frame[0] | sb_frame[1] | sb_frame[2] | sb_frame[3] | 
          sb_frame[4] | sb_frame[5] | sb_frame[6] | sb_frame[7] |
          sb_frame[8] | sb_frame[9] | sb_frame[10] | sb_frame[11] ))
  begin


   `PR_ALWAYS ("ch_mon",`DBG_4,"----------SB PACKET----------");
   inbank_debug_count=0;
   C1 = sb_frame[0];
   C2 = sb_frame[1];
   C3 = sb_frame[2];
   C4 = sb_frame[3];
   F0 = C1[6];
   F1 = C2[6];
   Command[23:0] = { C4[5],C3[5],C2[5],C1[5],
                     C4[4],C3[4],C2[4],C1[4],
                     C4[3],C3[3],C2[3],C1[3],
                     C4[2],C3[2],C2[2],C1[2],
                     C4[1],C3[1],C2[1],C1[1],
                     C4[0],C3[0],C2[0],C1[0]};
  sb_cmd_rdy_reg[2] = 1;
  sb_cmd_encoding_reg[71:48]=Command[23:0];
  sb_cmd_ds_reg[8:6]= Command[23:21];
   
  if (( Command[17:13] == 5'h1f ) && !F1 )begin
     inbank_debug_count=inbank_debug_count+1;
  end

  if ( Command[20] && ( ( !F0 && !F1) || F1 ) ) begin 
       `PR_ALWAYS ("ch_mon",`DBG_0,"Command A: ACTIVATE");
        sb_cmd_type_reg[14:10] = `CMD_ACT;
  end
  else begin
    `PR_ALWAYS ("ch_mon",`DBG_4,"Transfer[0] = %h\n",sb_frame[0]);
    `PR_ALWAYS ("ch_mon",`DBG_4,"Transfer[1] = %h\n",sb_frame[1]);
    `PR_ALWAYS ("ch_mon",`DBG_4,"Transfer[2] = %h\n",sb_frame[2]);
    `PR_ALWAYS ("ch_mon",`DBG_4,"Transfer[3] = %h\n",sb_frame[3]);
  end

    sb_cmd_rdy_reg[1] = 1;
    sb_cmd_encoding_reg[47:24]=Command[23:0];
    sb_cmd_ds_reg[5:3]= Command[23:21];
    if ( F1 & !F0) begin
       `PR_ALWAYS ("ch_mon",`DBG_0,"Command B: DATA");
       `PR_ALWAYS ("ch_mon",`DBG_0,"Command C: DATA");
     end
     else begin
        C1 = sb_frame[4];
        C2 = sb_frame[5];
        C3 = sb_frame[6];
        C4 = sb_frame[7];
        Command[23:0] = { C4[5],C3[5],C2[5],C1[5],
                          C4[4],C3[4],C2[4],C1[4],
                          C4[3],C3[3],C2[3],C1[3],
                          C4[2],C3[2],C2[2],C1[2],
                          C4[1],C3[1],C2[1],C1[1],
                          C4[0],C3[0],C2[0],C1[0]};
        if (( Command[17:13] == 5'h1f ) && !F1) begin
            if ( inbank_debug_count !== 0 )
            `PR_ALWAYS ("ch_mon",`DBG_0,"ERROR: Only one in-bank debug command allowed per dram clk");
            inbank_debug_count=inbank_debug_count+1;
        end

        if ( Command[20] && ( !F0 && !F1) ) begin
           `PR_ALWAYS ("ch_mon",`DBG_0,"Command B: ACTIVATE");
            sb_cmd_type_reg[9:5] = `CMD_ACT;
        end
        else begin
          `PR_ALWAYS ("ch_mon",`DBG_4,"Transfer[4] = %h\n",sb_frame[4]);
          `PR_ALWAYS ("ch_mon",`DBG_4,"Transfer[5] = %h\n",sb_frame[5]);
          `PR_ALWAYS ("ch_mon",`DBG_4,"Transfer[6] = %h\n",sb_frame[6]);
          `PR_ALWAYS ("ch_mon",`DBG_4,"Transfer[7] = %h\n",sb_frame[7]);
        end

          C1 = sb_frame[8];
          C2 = sb_frame[9];
          C3 = sb_frame[10];
          C4 = sb_frame[11];
          Command[23:0] = { C4[5],C3[5],C2[5],C1[5],
                            C4[4],C3[4],C2[4],C1[4],
                            C4[3],C3[3],C2[3],C1[3],
                            C4[2],C3[2],C2[2],C1[2],
                            C4[1],C3[1],C2[1],C1[1],
                            C4[0],C3[0],C2[0],C1[0]};
          sb_cmd_rdy_reg[0] = 1;
          sb_cmd_encoding_reg[24:0]=Command[23:0];
          sb_cmd_ds_reg[2:0]= Command[23:21];
          if (( Command[17:13] == 5'h1f ) && !F1 ) begin
               if ( inbank_debug_count !== 0 )
                 `PR_ALWAYS ("ch_mon",`DBG_0,"ERROR: Only one in-bank debug command allowed per dram clk");
                  inbank_debug_count=inbank_debug_count+1;
               end

          if ( Command[20] && ( !F0 && !F1) ) begin
             `PR_ALWAYS ("ch_mon",`DBG_0,"Command C: ACTIVATE");
              sb_cmd_type_reg[4:0] = `CMD_ACT;
          end 
          else begin
           `PR_ALWAYS ("ch_mon",`DBG_4,"Transfer[8] = %h\n",sb_frame[8]);
           `PR_ALWAYS ("ch_mon",`DBG_4,"Transfer[9] = %h\n",sb_frame[9]);
           `PR_ALWAYS ("ch_mon",`DBG_4,"Transfer[10] = %h\n",sb_frame[10]);
           `PR_ALWAYS ("ch_mon",`DBG_4,"Transfer[11] = %h\n",sb_frame[11]);
           end


 // DRAM addr/data Collision checks

  // if cmdA and cmdB are to the same DIMM
  if ( sb_cmd_ds_reg[8:6] == sb_cmd_ds_reg[5:3] )
  begin
    if ( ( ( sb_cmd_type_reg[14:10] == `CMD_ACT ) ||
           ( sb_cmd_type_reg[14:10] == `CMD_RD)  ||
           ( sb_cmd_type_reg[14:10] == `CMD_WR)  ||
           ( sb_cmd_type_reg[14:10] == `CMD_PSNG)  ||
           ( sb_cmd_type_reg[14:10] == `CMD_PALL)  ||
           ( sb_cmd_type_reg[14:10] == `CMD_WR)  ||
           ( sb_cmd_type_reg[14:10] == `CMD_WR)  ||
           ( sb_cmd_type_reg[14:10] == `CMD_EnSR)  ||
           ( sb_cmd_type_reg[14:10] == `CMD_ARF) 

         ) && (
           ( sb_cmd_type_reg[9:5] == `CMD_ACT) ||
           ( sb_cmd_type_reg[9:5] == `CMD_RD)  ||
           ( sb_cmd_type_reg[9:5] == `CMD_WR)  ||
           ( sb_cmd_type_reg[9:5] == `CMD_PSNG)  ||
           ( sb_cmd_type_reg[9:5] == `CMD_PALL)  ||
           ( sb_cmd_type_reg[9:5] == `CMD_WR)  ||
           ( sb_cmd_type_reg[9:5] == `CMD_WR)  ||
           ( sb_cmd_type_reg[9:5] == `CMD_EnSR)  ||
           ( sb_cmd_type_reg[9:5] == `CMD_ARF) )
        ) // if  
    begin
     `PR_ALWAYS ("ch_mon",`DBG_0,"ERROR: DRAM cmd/addr pin collision between CMDA and CMDB\n"); 
    end


  end


  if ( sb_cmd_ds_reg[8:6] == sb_cmd_ds_reg[2:0] )
  begin
    if ( ( ( sb_cmd_type_reg[14:10] == `CMD_ACT ) ||
           ( sb_cmd_type_reg[14:10] == `CMD_RD)  ||
           ( sb_cmd_type_reg[14:10] == `CMD_WR)  ||
           ( sb_cmd_type_reg[14:10] == `CMD_PSNG)  ||
           ( sb_cmd_type_reg[14:10] == `CMD_PALL)  ||
           ( sb_cmd_type_reg[14:10] == `CMD_WR)  ||
           ( sb_cmd_type_reg[14:10] == `CMD_WR)  ||
           ( sb_cmd_type_reg[14:10] == `CMD_EnSR)  ||
           ( sb_cmd_type_reg[14:10] == `CMD_ARF) 

         ) && (
           ( sb_cmd_type_reg[4:0] == `CMD_ACT) ||
           ( sb_cmd_type_reg[4:0] == `CMD_RD)  ||
           ( sb_cmd_type_reg[4:0] == `CMD_WR)  ||
           ( sb_cmd_type_reg[4:0] == `CMD_PSNG)  ||
           ( sb_cmd_type_reg[4:0] == `CMD_PALL)  ||
           ( sb_cmd_type_reg[4:0] == `CMD_WR)  ||
           ( sb_cmd_type_reg[4:0] == `CMD_WR)  ||
           ( sb_cmd_type_reg[4:0] == `CMD_EnSR)  ||
           ( sb_cmd_type_reg[4:0] == `CMD_ARF) )
        ) // if  
    begin
     `PR_ALWAYS ("ch_mon",`DBG_0,"ERROR: DRAM cmd/addr pin collision between CMDA and CMDC\n"); 
    end
  end // if 

  if ( sb_cmd_ds_reg[2:0] == sb_cmd_ds_reg[5:3] )
  begin
    if ( ( ( sb_cmd_type_reg[4:0] == `CMD_ACT ) ||
           ( sb_cmd_type_reg[4:0] == `CMD_RD)  ||
           ( sb_cmd_type_reg[4:0] == `CMD_WR)  ||
           ( sb_cmd_type_reg[4:0] == `CMD_PSNG)  ||
           ( sb_cmd_type_reg[4:0] == `CMD_PALL)  ||
           ( sb_cmd_type_reg[4:0] == `CMD_WR)  ||
           ( sb_cmd_type_reg[4:0] == `CMD_WR)  ||
           ( sb_cmd_type_reg[4:0] == `CMD_EnSR)  ||
           ( sb_cmd_type_reg[4:0] == `CMD_ARF) 

         ) && (
           ( sb_cmd_type_reg[9:5] == `CMD_ACT) ||
           ( sb_cmd_type_reg[9:5] == `CMD_RD)  ||
           ( sb_cmd_type_reg[9:5] == `CMD_WR)  ||
           ( sb_cmd_type_reg[9:5] == `CMD_PSNG)  ||
           ( sb_cmd_type_reg[9:5] == `CMD_PALL)  ||
           ( sb_cmd_type_reg[9:5] == `CMD_WR)  ||
           ( sb_cmd_type_reg[9:5] == `CMD_WR)  ||
           ( sb_cmd_type_reg[9:5] == `CMD_EnSR)  ||
           ( sb_cmd_type_reg[9:5] == `CMD_ARF) )
        ) // if  
    begin
      `PR_ALWAYS ("ch_mon",`DBG_0,"ERROR: DRAM cmd/addr pin collision between CMDB and CMDC\n"); 
    end
  end // if

// dram CKE pin collision

  if ( sb_cmd_ds_reg[8:6] == sb_cmd_ds_reg[5:3] )
  begin
    if ( ( ( sb_cmd_type_reg[14:10] == `CMD_EnSR ) ||
           ( sb_cmd_type_reg[14:10] == `CMD_ExSR)  ||
           ( sb_cmd_type_reg[14:10] == `CMD_EnPD)  ||
           ( sb_cmd_type_reg[14:10] == `CMD_DRAM_CKE_DIMM)  ||
           ( sb_cmd_type_reg[14:10] == `CMD_DRAM_CKE_RANK) 

         ) && (
           ( sb_cmd_type_reg[9:5] == `CMD_EnSR) ||
           ( sb_cmd_type_reg[9:5] == `CMD_ExSR)  ||
           ( sb_cmd_type_reg[9:5] == `CMD_EnPD)  ||
           ( sb_cmd_type_reg[9:5] == `CMD_DRAM_CKE_DIMM)  ||
           ( sb_cmd_type_reg[9:5] == `CMD_DRAM_CKE_RANK) )
        ) // if  
    begin
     `PR_ALWAYS ("ch_mon",`DBG_0,"ERROR: DRAM CKE pin collision between CMDA and CMDB\n"); 
    end
  end

  if ( sb_cmd_ds_reg[8:6] == sb_cmd_ds_reg[2:0] )
  begin
    if ( ( ( sb_cmd_type_reg[14:10] == `CMD_EnSR ) ||
           ( sb_cmd_type_reg[14:10] == `CMD_ExSR)  ||
           ( sb_cmd_type_reg[14:10] == `CMD_EnPD)  ||
           ( sb_cmd_type_reg[14:10] == `CMD_DRAM_CKE_DIMM)  ||
           ( sb_cmd_type_reg[14:10] == `CMD_DRAM_CKE_RANK) 

         ) && (
           ( sb_cmd_type_reg[4:0] == `CMD_EnSR) ||
           ( sb_cmd_type_reg[4:0] == `CMD_ExSR)  ||
           ( sb_cmd_type_reg[4:0] == `CMD_EnPD)  ||
           ( sb_cmd_type_reg[4:0] == `CMD_DRAM_CKE_DIMM)  ||
           ( sb_cmd_type_reg[4:0] == `CMD_DRAM_CKE_RANK) )
        ) // if  
    begin
     `PR_ALWAYS ("ch_mon",`DBG_0,"ERROR: DRAM CKE pin collision between CMDA and CMDC\n"); 
    end
  end


  if ( sb_cmd_ds_reg[2:0] == sb_cmd_ds_reg[5:3] )
  begin
    if ( ( ( sb_cmd_type_reg[4:0] == `CMD_EnSR ) ||
           ( sb_cmd_type_reg[4:0] == `CMD_ExSR)  ||
           ( sb_cmd_type_reg[4:0] == `CMD_EnPD)  ||
           ( sb_cmd_type_reg[4:0] == `CMD_DRAM_CKE_DIMM)  ||
           ( sb_cmd_type_reg[4:0] == `CMD_DRAM_CKE_RANK) 

         ) && (
           ( sb_cmd_type_reg[9:5] == `CMD_EnSR) ||
           ( sb_cmd_type_reg[9:5] == `CMD_ExSR)  ||
           ( sb_cmd_type_reg[9:5] == `CMD_EnPD)  ||
           ( sb_cmd_type_reg[9:5] == `CMD_DRAM_CKE_DIMM)  ||
           ( sb_cmd_type_reg[9:5] == `CMD_DRAM_CKE_RANK) )
        ) // if  
    begin
     `PR_ALWAYS ("ch_mon",`DBG_0,"ERROR: DRAM CKE pin collision between CMDA and CMDB\n"); 
    end
  end

  end // f1 & !f0

  end
  else begin
   sb_cmd_rdy_reg[2:0] = 3'b0;
   sb_cmd_encoding_reg[71:0] = 72'h0;
   sb_cmd_type_reg[14:0]= 15'h0;
  end

//------- ADDED BY SWATI
`ifdef SYNC_PKT_RTL_PRESENT

  if(nosync_framecount[5:0] == 6'd42)
  begin
    nosync_framecount[5:0] = 0;
    `PR_ALWAYS ("ch_mon",`DBG_0,"ERROR: Sync Frame was not sent since last 42 Frames\n");
  end
  else if( (nosync_framecount[5:0] <= 6'd42) && (nosync_framecount[5:0] >= fbdreg_synctrainint) )
  begin
    if(detected_sync_cmd)
    begin
      nosync_framecount[5:0] = 0;
    end
    else if(!detected_sync_cmd)
    begin
      nosync_framecount[5:0] = nosync_framecount[5:0] + 1;
    end
  end
  else if(nosync_framecount[5:0] <= fbdreg_synctrainint)
  begin
    if(detected_sync_cmd)
    begin
      nosync_framecount[5:0] = 0;
	`PR_ALWAYS ("ch_mon",`DBG_0,"ERROR: Sync Frame was not sent before the programmed no of Frames\n");
    end
	else if(!detected_sync_cmd)
    begin
	nosync_framecount[5:0] = nosync_framecount[5:0] + 1;
    end
  end

`endif
//------- ADDED BY SWATI

end

integer round_trip_delay;
reg stop_count;
reg count_enable;
reg [47:0] initialization_register_link1;

assign nb_frm_boundary = (nb_frm_counter == nb_lock_counter );

always @(posedge link_clk_int)
begin
   if (~rst)
    begin
     round_trip_delay <= 0;
     count_enable <= 1'b0;
     stop_count <= 1'b0;
    end
   else if(init_curr_state ==  `AMB_INIT_POLL)
    begin
        if (nb_header_detected)
         begin
             count_enable <= 1'b0;
             stop_count <= 1'b1;
         end
        else if (((sb_header_detected) || count_enable) & (!stop_count))
         begin
          count_enable <= 1'b1;
          round_trip_delay <= round_trip_delay + 1;
         end
    end
end

always @(posedge link_clk)
begin
 if (~rst)
    nb_frm_counter <= 4'h0;
 else 
   begin
    if (nb_frm_counter[3:0] == 4'hb)
      nb_frm_counter <= 4'h0;
    else 
      nb_frm_counter <= nb_frm_counter + 4'h1;

     if (nb_header_detected)
      nb_lock_counter <= nb_frm_counter;

   end
end
 
always @(link_clk_int)
begin
  if ( ~link_clk_int )  
    initialization_register_link1[47:0] <= { pn[0],  initialization_register_link1[47:1]};
end

always@(posedge link_clk_int) if ( ~bypass_init )
begin
 if ( initialization_register_link1[47:36] == 12'h7fc )
  nb_header_detected<=1;
 else
  nb_header_detected<=0;

end

always@(posedge link_clk_int) if ( ~bypass_init )
begin
 if ( initialization_register_link0[47:36] == 12'h7fe )
   sb_header_detected<=1;
 else
   sb_header_detected<=0;
end


// initialization checks

reg [15:0] amb_init_disable_count;
reg [15:0] amb_init_train_count;
reg [15:0] amb_init_test_count;
reg [15:0] amb_init_poll_count;
reg [15:0] amb_init_config_count;
reg [15:0] amb_init_lo_count;
reg [15:0] amb_init_recalib_count;
reg [15:0] amb_init_los_count;
reg        fast_reset_enabled;

wire [3:0] amb_id0,amb_id1,amb_id2,amb_id3;
wire [3:0] amb_id4,amb_id5,amb_id6,amb_id7;
wire [3:0] amb_id8,amb_id9,amb_id10,amb_id11;
wire [3:0] amb_id12,amb_id13;

wire [13:0] ts0_ready;
reg [13:0] ts1_start_reg,ts1_end_reg;
wire [13:0] tr_amb_id_ok,ts_amb_id_ok,cf_amb_id_ok,po_amb_id_ok;
wire [13:0] frm_align;
wire [13:0] ts1_start=ts1_start_reg[11:0];
wire [13:0] ts1_end; //=ts1_end_reg[11:0];
reg [7:0] fsm_added_delay_reg;

reg [13:0] ts2_start_reg,ts2_end_reg;
wire [13:0] ts2_start=ts2_start_reg;
wire [13:0] ts2_end; //=ts2_end_reg;
wire enter_config_state;
wire enter_polling_state;

reg [13:0] ts3_start_reg,ts3_end_reg;
wire [13:0] ts3_start=ts3_start_reg;
wire [13:0] ts3_end;
reg do_init_check;

reg [6:0] nop_cnt;
reg [20:0] calibration_count;
reg [9:0]  clocktrain_count;
reg [9:0]  disable_count;
reg [9:0]  enddisable_count;




initial begin
 sync_interval_frm_count = 0;
 fsr_counter=4'h7;
 fsr_counter2=4'hd;
end

always@(link_clk_int)
begin
 if ( ~link_clk_int )  begin
   initialization_register_link0[47:0] <= { ps[0],  initialization_register_link0[47:1]};
  end
end


always@(posedge link_clk)
begin
  if ( fsr_counter == 4'h1 )
   fsr_counter = 4'h6;
  else
   fsr_counter = fsr_counter - 1;

  if ( fsr_counter2 == 4'h1 )
   fsr_counter2 = 4'hc;
  else
   fsr_counter2 = fsr_counter2 - 1;

end

assign frm_begin = ( fsr_counter == lock_counter );
assign frm_boundary = (fsr_counter2 == lock_counter2);

always@(negedge link_clk_int) if ( ~bypass_init )
begin
   if(header_detected)
   begin
   lock_counter <= prev_counter;
   lock_counter2 <=  prev_counter2;
  end
  else begin
   prev_counter <= fsr_counter;
   prev_counter2 <= fsr_counter2;
  end

end  


always@(posedge link_clk_int) if ( ~bypass_init )
begin
 if (( initialization_register_link0[47:36] == 12'hbfe) && ( init_curr_state == `AMB_INIT_TRAIN ) )
   header_detected<=1;
 else
  header_detected<=0;

end

always@(posedge dram_clk)
begin
 if (header_detected )
   enable_fsm=1;
end


 
initial calibrate_state_counter=0;

always@(negedge link_clk_int)
begin
 if ( !enter_calibrate_state )
 begin
  if ( ps[0] ) 
    calibrate_state_counter <= calibrate_state_counter +1 ;
  else
    calibrate_state_counter <= 0;
 end
 else
    calibrate_state_counter <= calibrate_state_counter +1 ;

 if ( ps !== ps_bar )
 begin
  if ( calibrate_state_counter > (`tClkTrain * 2 * 12 ) )
    enter_calibrate_state <= 1;
  else
    enter_calibrate_state <= 0;
 end
 else
    enter_calibrate_state <= 0;


end
 
reg link_clk_int_shft;

always@(link_clk_int) begin
  if ( link_clk_int ) 
   link_clk_int_shft <= #1 1'b1 ;
  else
   link_clk_int_shft <= #1 1'b0 ;
end

wire exit_disable_state;

voting_logic chk_dis_ready ( .a ( ps_map[0] !== ps_map_bar[0]),
                             .b ( ps_map[1] !== ps_map_bar[1]),
                             .c ( ps_map[2] !== ps_map_bar[2]),
                             .out ( exit_disable_state));


always@(posedge link_clk_int_shft) 
begin
   if ( ~rst ) begin
     init_curr_state = `AMB_INIT_DISABLE;
     init_reg=1;
     calibration_count=0;
     clocktrain_count=0;
     disable_count=0;
     do_init_check=1;
     enddisable_count=0;
     amb_init_disable_count=0;
     amb_init_train_count=0;
     amb_init_test_count=0;
     amb_init_poll_count=0;
     amb_init_config_count=0;
     amb_init_lo_count=0;
     amb_init_recalib_count=0;
     amb_init_los_count=0;
  end
  else begin
   if ( init_curr_state !== `AMB_INIT_DISABLE )
    calibration_count=calibration_count+1;

   case(init_curr_state)
     `AMB_INIT_DISABLE: begin


                         disable_count = disable_count + 1;
                         enddisable_count = enddisable_count+1;
                         amb_init_disable_count = amb_init_disable_count + 1;
                         init_reg=1;
                         if ( exit_disable_state )                 
                         begin
                           if ( enddisable_count < `tEDisable )
                             `PR_ALWAYS ("ch_mon",`DBG_4,"ERROR: enddisable_count(%h) <  `tEDisable(%h)",enddisable_count,  `tEDisable);
                          else
                             `PR_ALWAYS ("ch_mon",`DBG_4,"tEDisable timing=%d met!",`tEDisable);
                           init_curr_state=`AMB_INIT_TRAIN;
                           training_sequence_start_reg=1;
                           ts0_pattern=0;
                           amb_init_disable_count=0;
                           amb_init_train_count=0;
                           amb_init_test_count=0;
                           amb_init_poll_count=0;
                           amb_init_config_count=0;
                           amb_init_lo_count=0;
                           amb_init_recalib_count=0;
                           amb_init_los_count=0;
                           `PR_ALWAYS ("ch_mon",`DBG_0,"AMB exiting DISABLE state");
                         end
                          else
                           training_sequence_start_reg=0;

                        end
     `AMB_INIT_TRAIN  : begin


                        if ( enter_calibrate_state ) begin
                            training_sequence_start_reg=0;
                            init_curr_state=`AMB_INIT_CALIB;
                        end

                         if ( enter_disable_state ) begin
                            training_sequence_start_reg=0;
                            init_curr_state = `AMB_INIT_DISABLE;
                            disable_count=0;
                            enddisable_count=0;
                         end

                        clocktrain_count = clocktrain_count+1;
                        amb_init_train_count = amb_init_train_count + 1;

                        if ( ts0_ready_2of3    )
                        begin
                          `PR_ALWAYS ("ch_mon",`DBG_0,"AMB Training Sequence 0 complete!");
                          init_curr_state=`AMB_INIT_TEST;
                          training_sequence_start_reg=0;

                         end
                        else begin
                        ts0_pattern = ts0_pattern + 1;
                        ts0_reg0[143:0] = {ts0_reg0[142:0],ps_map[0]};
                        ts0_reg1[143:0] = {ts0_reg1[142:0],ps_map[1]};
                        ts0_reg2[143:0] = {ts0_reg2[142:0],ps_map[2]};
                        ts0_reg3[143:0] = {ts0_reg3[142:0],ps_map[3]};
                        ts0_reg4[143:0] = {ts0_reg4[142:0],ps_map[4]};
                        ts0_reg5[143:0] = {ts0_reg5[142:0],ps_map[5]};
                        ts0_reg6[143:0] = {ts0_reg6[142:0],ps_map[6]};
                        ts0_reg7[143:0] = {ts0_reg7[142:0],ps_map[7]};
                        ts0_reg8[143:0] = {ts0_reg8[142:0],ps_map[8]};
                        ts0_reg9[143:0] = {ts0_reg9[142:0],ps_map[9]};

                        end
                        end 

    `AMB_INIT_CALIB  : begin
                          if ( enter_disable_state )
                             init_curr_state=`AMB_INIT_DISABLE;
                       end 
    `AMB_INIT_TEST   : begin
                         if ( enter_disable_state ) begin
                            init_curr_state = `AMB_INIT_DISABLE;
                            disable_count=0;
                            enddisable_count=0;
                         end                        
                          
                          ts1_start_reg[11:0]=12'hfff; // start testing sequence
                         amb_init_test_count = amb_init_test_count + 1;                           
 
                     
                         if ( enter_polling_state ) begin
                            init_curr_state=`AMB_INIT_POLL;
                            ts1_start_reg[11:0]=12'h0;
                            `PR_ALWAYS ("ch_mon",`DBG_0,"AMB Testing sequence complete!");
                         end
                

                        end 
     `AMB_INIT_POLL   : begin
                         if ( enter_disable_state ) begin
                            init_curr_state = `AMB_INIT_DISABLE;
                            disable_count=0;
                            enddisable_count=0;
                         end

                         amb_init_poll_count = amb_init_poll_count + 1;
                         ts2_start_reg=12'hfff; // start testing sequence
                         fsm_added_delay_reg=8'h48; // add 6 dram cycles worth of delay
                         if ( enter_config_state ) begin
                            init_curr_state=`AMB_INIT_CONFIG;
                            `PR_ALWAYS ("ch_mon",`DBG_0,"AMB Polling sequence complete!");
                         end

                
                        end 
     `AMB_INIT_CONFIG : begin
                         if ( enter_disable_state ) begin
                            init_curr_state = `AMB_INIT_DISABLE;
                            disable_count=0;
                            enddisable_count=0;
                         end

                        ts3_start_reg=12'hfff; // start testing sequence
                        amb_init_config_count = amb_init_config_count + 1;

                        if ( (ps_map == 0 ) )
                           nop_cnt=nop_cnt+1;
                        else
                           nop_cnt = 0;

                        if ( nop_cnt > 46 )
                          init_curr_state=`AMB_INIT_LO;


                         if ( (ts3_end[0] ) && ( nop_cnt !== 0 )) begin
                           `PR_ALWAYS ("ch_mon",`DBG_0,"AMB Config sequence complete!");

                          // Host sent a command which was not a NOP before 4 NOP frames are complete
                           if ( (nop_cnt < 46 ) && ( ps_map != 0 ) )
                             `PR_ALWAYS ("ch_mon",`DBG_4,"ERROR: Host needs to send at least 4 NOP frames before entering  LOs");
                         end

                        end 
     `AMB_INIT_LO     : begin
                         if ( enter_disable_state ) begin
                            init_curr_state = `AMB_INIT_DISABLE;
                            disable_count=0;
                            enddisable_count=0;
                         end

                         fsm_added_delay_reg=8'h00; // add 0 dram cycles workth of delay
                         amb_init_lo_count = amb_init_lo_count + 1;

                        if ( do_init_check ) begin
                            init_reg=0;
                            `PR_ALWAYS ("ch_mon",`DBG_0,"AMB LO state entered");

                         if ( calibration_count < `tCalibrate )
                             `PR_ALWAYS ("ch_mon",`DBG_4,"ERROR: calibration_count(%h) > `tCalibrate(%h)" ,  calibration_count,`tCalibrate);
                         else
                             `PR_ALWAYS ("ch_mon",`DBG_4,"tCalibrate timing %d met!",`tCalibrate);


                         if ( clocktrain_count < `tClkTrain )
                             `PR_ALWAYS ("ch_mon",`DBG_4,"ERROR: clocktrain_count(%h) > `tClktrain(%h)",clocktrain_count,`tClkTrain);
                         else
                             `PR_ALWAYS ("ch_mon",`DBG_4,"tClktrain %d timing met!",`tCalibrate);


                          if ( disable_count < `tDisable )
                             `PR_ALWAYS ("ch_mon",`DBG_4,"ERROR: disable_count(%h) <  `tDisable(%h)",disable_count, `tDisable);
                          else
                             `PR_ALWAYS ("ch_mon",`DBG_4,"tDisable timing %d met!",`tDisable);

                          if ( ts0_pattern < (`TS0_FRAMES * 12 ) )
                               `PR_ALWAYS ("ch_mon",`DBG_4,"ERROR: ts0 patterns received (%h) < ts0 patterns expected (%h)  (divide by 12 to get actual # of frames)\n",ts0_pattern,`TS0_FRAMES);

                        do_init_check=0;
                        end
 /*
                         if ( fast_reset_enabled )
                         begin
                           if ( (amb_init_disable_count  < 1572 ) || // 131 frm * 12
                                (amb_init_train_count    < 39600) || // 3300 frm * 12                 
                                (amb_init_test_count     < 756  ) || // 63 frm *12
                                (amb_init_poll_count     < 468  ) || // 39 frm *12
                                (amb_init_config_count   < 468  ) || // 39 frm *12
                                (amb_init_lo_count       < 276  ))  // 23 frm *12
                            begin
                             `PR_ALWAYS ("ch_mon",`DBG_4,"ERROR: Fast reset duration timing  violated!\n");
                            end

                         end
*/

                          if ( enter_disable_state ) 
                          begin
                           if ( write_fifo_empty /* amb.ch_monr.write_fifo.rempty */ == 0 )
                             `PR_ALWAYS ("ch_mon",`DBG_4,"ERROR: Host has sent electrical idle before writes  are done!");
                             init_curr_state = `AMB_INIT_DISABLE;
                             disable_count=0;
                             enddisable_count=0;
                             fast_reset_enabled =1;
                          end

                         if ( enter_recalibrate ) begin 
                            init_curr_state=`AMB_INIT_RECALIB;
                            Recalibrate_Timer =  9'h0;
                         end
                         if ( enter_los ) begin
                            init_curr_state=`AMB_INIT_LOS;
                            LOs_Timer=9'h0;
                         end

                      
                         init_reg=0;

                        end 
      `AMB_INIT_RECALIB: begin
                         if ( enter_disable_state ) begin
                            init_curr_state = `AMB_INIT_DISABLE;
                            disable_count=0;
                            enddisable_count=0;
                         end

                          `PR_ALWAYS ("amb_init",`DBG_0,"Entering AMB Recalibrate State!");
                          amb_init_recalib_count = amb_init_recalib_count + 1;
 
                         init_reg=1;
                          if ( LOs_Timer == 9'h180 ) // 32 frames
                            init_curr_state=`AMB_INIT_LO; 
                          else
                            LOs_Timer= LOs_Timer + 9'h1;
                          
                        end
      `AMB_INIT_LOS        : begin
                         if ( enter_disable_state ) begin
                            init_curr_state = `AMB_INIT_DISABLE;
                             disable_count=0;
                             enddisable_count=0;
                         end

                          `PR_ALWAYS ("amb_init",`DBG_0,"Entering AMB LOs State!");
                         amb_init_los_count = amb_init_los_count + 1;
                         init_reg=1;
                          if ( Recalibrate_Timer == 9'h180 ) // 32 frames
                            init_curr_state=`AMB_INIT_LO; 
                          else
                            Recalibrate_Timer= Recalibrate_Timer + 9'h1;

                        end
   endcase
  end

end


training_sequence_fsm #(0) tr_ps0 (.ps_bit (ps_map[0]),
                                   .ps_bit_bar ( ps_map_bar[0] ),
                                   .link_clk (link_clk_int),
                                   .amb_id (amb_id0),
                                   .frm_align (frm_align[0]),
                                   .training_sequence_start ( training_sequence_start),
                                   .training_sequence_end (ts0_ready[0]),
                                   .amb_id_ok             (tr_amb_id_ok[0]));

training_sequence_fsm #(0) tr_ps1 (.ps_bit (ps_map[1]),
                                   .ps_bit_bar ( ps_map_bar[1] ),
                                   .link_clk (link_clk_int),
                                   .amb_id (amb_id0),
                                   .frm_align (frm_align[1]),
                                   .training_sequence_start ( training_sequence_start),
                                   .training_sequence_end (ts0_ready[1]),
                                   .amb_id_ok             (tr_amb_id_ok[1]));

training_sequence_fsm #(0) tr_ps2 (.ps_bit (ps_map[2]),
                                   .ps_bit_bar ( ps_map_bar[2] ),
                                   .link_clk (link_clk_int),
                                   .amb_id (amb_id0),
                                   .frm_align (frm_align[2]),
                                   .training_sequence_start ( training_sequence_start),
                                   .training_sequence_end (ts0_ready[2]),
                                   .amb_id_ok             (tr_amb_id_ok[2]));

voting_logic chk_ts0_ready ( .a ( ts0_ready[0]),
                             .b ( ts0_ready[1]),
                             .c ( ts0_ready[2]),
                             .out ( ts0_ready_2of3));

voting_logic chk_enter_disable ( .a ( ps_map[0] == ps_map_bar[0] ),
                                 .b ( ps_map[1] == ps_map_bar[1] ),
                                 .c ( ps_map[2] == ps_map_bar[2] ),
                                 .out ( enter_disable_state));

training_sequence_fsm_chk #(0) tr_ps0_chk (.ps_bit (ps_map[0]),
                                           .ps_bit_bar ( ps_map_bar[0]),
                                           .link_clk (link_clk_int),
                                           .training_sequence_start ( training_sequence_start));


/****************/

testing_state_fsm #(0) ts_ps0  (.ps_bit (ps_map[0]),
                           .link_clk (link_clk_int),
                           .amb_id (amb_id0),
                           .testing_state_start (ts1_start[0]),
                           .testing_state_end (ts1_end[0]),
                           .amb_id_ok             (ts_amb_id_ok[0]),
                           .sb2nbmap  (sb2nbmap)
                           );

testing_state_fsm #(0) ts_ps1  (.ps_bit (ps_map[1]),
                           .link_clk (link_clk_int),
                           .amb_id (amb_id0),
                           .testing_state_start (ts1_start[1]),
                           .testing_state_end (ts1_end[1]),
                           .amb_id_ok             (ts_amb_id_ok[1]),
                           .sb2nbmap  (sb2nbmap)
                           );

testing_state_fsm #(0) ts_ps2  (.ps_bit (ps_map[2]),
                           .link_clk (link_clk_int),
                           .amb_id (amb_id0),
                           .testing_state_start (ts1_start[2]),
                           .testing_state_end (ts1_end[2]),
                           .amb_id_ok             (ts_amb_id_ok[2]),
                           .sb2nbmap  (sb2nbmap)
                           );

voting_logic chk_enter_polling_state (.a ( ts1_end[0]),
                                      .b ( ts1_end[1]),
                                      .c ( ts1_end[2]),
                                      .out ( enter_polling_state));


testing_state_fsm_chk #(0) ts_ps0_chk  (.ps_bit (ps_map[0]),
                           .link_clk (link_clk_int),
                           .testing_state_start (ts1_start[0])
                           );

/****************/

polling_state_fsm #(0) po_ps0 (.ps_bit (ps_map[0]),
                           .link_clk (link_clk_int),
                           .amb_id (amb_id0),
                           .polling_state_start (ts2_start[0]),
                           .amb_id_ok             (po_amb_id_ok[0]),
                           .polling_state_end (ts2_end[0])
                           );
polling_state_fsm #(0) po_ps1 (.ps_bit (ps_map[1]),
                           .link_clk (link_clk_int),
                           .amb_id (amb_id0),
                           .polling_state_start (ts2_start[1]),
                           .amb_id_ok             (po_amb_id_ok[1]),
                           .polling_state_end (ts2_end[1])
                           );
polling_state_fsm #(0) po_ps2 (.ps_bit (ps_map[2]),
                           .link_clk (link_clk_int),
                           .amb_id (amb_id0),
                           .polling_state_start (ts2_start[2]),
                           .amb_id_ok             (po_amb_id_ok[2]),
                           .polling_state_end (ts2_end[2])
                           );

polling_state_fsm_chk #(0) po_ps0_chk (.ps_bit (ps_map[0]),
                           .link_clk (link_clk_int),
                           .polling_state_start (ts2_start[0])
                           );

voting_logic chk_enter_config_state (.a ( ts2_end[0]),
                                      .b ( ts2_end[1]),
                                      .c ( ts2_end[2]),
                                      .out ( enter_config_state));

/****************/

config_state_fsm #(0) cfg_ps0 (.ps_bit (ps_map[0]),
                           .link_clk (link_clk_int),
                           .amb_id (amb_id0),
                           .config_state_start (ts3_start[0]),
                           .config_state_end (ts3_end[0]),
                           .amb_id_ok             (cf_amb_id_ok[0])
                           );
config_state_fsm #(0) cfg_ps1 (.ps_bit (ps_map[1]),
                           .link_clk (link_clk_int),
                           .amb_id (amb_id0),
                           .config_state_start (ts3_start[1]),
                           .config_state_end (ts3_end[1]),
                           .amb_id_ok             (cf_amb_id_ok[1])
                           );
config_state_fsm #(0) cfg_ps2 (.ps_bit (ps_map[2]),
                           .link_clk (link_clk_int),
                           .amb_id (amb_id0),
                           .config_state_start (ts3_start[2]),
                           .config_state_end (ts3_end[2]),
                           .amb_id_ok             (cf_amb_id_ok[2])
                           );

config_state_fsm_chk #(0) cfg_ps0_chk (.ps_bit (ps_map[0]),
                           .link_clk (link_clk_int),
                           .config_state_start (ts3_start[0])
                           );


reg [SB_LINK-1:0] frm_mem[0:11];

/* Calculate Channel latency */


initial begin
latency_calculated = 1'b0;
polling_counter = 11'h0;
end

always@(negedge link_clk )
begin
  SB_transfer_reg[11:0] = { ps[0], SB_transfer_reg[11:1]};  
 // NB_transfer_reg[11:0] = { pn[0], NB_transfer_reg[11:1]};  
end

always@(negedge nb_frm_rdy)
begin
   NB_transfer_reg[11:0] = {pn11[0],pn10[0],pn9[0],pn8[0],pn7[0],pn6[0],pn5[0],pn4[0],pn3[0],pn2[0],pn1[0],pn0[0]};
end

reg start_counter;
initial start_counter = 0;

always@(posedge link_clk )
begin
  if (( SB_transfer_reg == 12'h7fe ) & !latency_calculated & (init_curr_state == `AMB_INIT_POLL) & !start_counter)
  begin
   start_counter = 1;
   polling_counter=0;
  end
  if (( NB_transfer_reg == 12'h7fe ) & !latency_calculated & (init_curr_state == `AMB_INIT_POLL))
  begin
   latency_calculated = 1'b1;
   channel_latency = polling_counter;
   start_counter = 0;
  end
  if ( start_counter )
    polling_counter = polling_counter + 12'h1;

end


/****** DELAY LOGIC ******/
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

crc_FE data_crc(.B(Data_72) ,
		.E (CRC22));

crc_FE_failover data_crc_failover (.B(Data_72) ,
	          	 .E (CRC10_data_failover));


crc_aE cmd_crc ( .B(Command_26),
		 .E (CRC14));

crc_aE_failover cmd_crc_failover ( .B(Command_26),
                                   .E (CRC10_cmd_failover));


reg [13:0] pn_prev1,pn_prev2;


wire is_idle = ( pn0 == pn1 ) & (pn0 == pn2) & (pn0 == pn3) & (pn0 == pn4 ) & (pn0 == pn5 ) & 
               ( pn6 == pn7 ) & (pn6 == pn8) & (pn6 == pn9) & (pn6 == pn10) & (pn6 == pn11 ) & 
               ( pn0 !== 14'h0 ) & 
               ( pn1 !== 14'h0 ) & 
               ( pn2 !== 14'h0 ) & 
               ( pn3 !== 14'h0 ) & 
               ( pn4 !== 14'h0 ) & 
               ( pn5 !== 14'h0 ) & 
               ( pn6 !== 14'h0 ) & 
               ( pn7 !== 14'h0 ) & 
               ( pn8 !== 14'h0 ) & 
               ( pn9 !== 14'h0 ) & 
               ( pn10 !== 14'h0 ) & 
               ( pn11 !== 14'h0 ) ;


always@(negedge nb_frm_rdy) if ( is_idle )
begin
  pn_prev1 <= pn0;
  pn_prev2 <= pn_prev1;
end
else begin
  pn_prev1 <= 0;
  pn_prev2 <= 0;
end

reg [13:0] pn_prev1_d;

always@(posedge link_clk)
 pn_prev1_d <= pn_prev1;

reg [47:0]  ireg_l0;
reg [47:0]  ireg_l1;
reg [47:0]  ireg_l2;

               
wire detect_2of3_cfg_hdr;

voting_logic dtct_cfg_hdr (.a (  ireg_l0[23:12] == 12'h3fe),
                           .b (  ireg_l1[23:12] == 12'h3fe), 
                           .c (  ireg_l2[23:12] == 12'h3fe), 
                           .out ( detect_2of3_cfg_hdr ));

always@(negedge frm_boundary ) 
begin
if ( detect_2of3_cfg_hdr ) begin
    if (( ps0[1] !== ps0[0] ) && ( ps0[1] == ps0[2]) ) // failed lane is 0
    begin
       nb_config <= ireg_l1[45:42];
       sb_config <= ireg_l1[39:36];
    end
    else 
    begin
       nb_config <= ireg_l0[45:42];
       sb_config <= ireg_l0[39:36];
    end
end // if ( detect_2of3_cfg_hdr

    ireg_l0[47:0] <= { ps11[0], ps10[0], ps9[0],ps8[0],ps7[0],ps6[0],ps5[0],ps4[0],ps3[0],ps2[0],ps1[0],ps0[0],ireg_l0[47:12]};  
    ireg_l1[47:0] <= { ps11[1], ps10[1], ps9[1],ps8[1],ps7[1],ps6[1],ps5[1],ps4[1],ps3[1],ps2[1],ps1[1],ps0[1],ireg_l1[47:12]};
    ireg_l2[47:0] <= { ps11[2], ps10[2], ps9[2],ps8[2],ps7[2],ps6[2],ps5[2],ps4[2],ps3[2],ps2[2],ps1[2],ps0[2],ireg_l2[47:12]};


end
               
`ifdef STINGRAY
chmon_idle_lfsr idle_frame_generator( .reset (init_reg ), //sync_cmd_rdy_d1 ),
                                      .pn_prev_in ( pn_prev1_d ),
                                      .pn_curr_in ( pn0 ),
                                      .is_idle ( is_idle ),
                                      .alert_frame ( alert_frame),
                                      .frm_begin ( frm_begin),
                                      .frm_boundary ( nb_frm_rdy),
                                      .nb_config ( nb_config),
                                      .clk (link_clk));

`endif // STINGRAY

endmodule

`endif
