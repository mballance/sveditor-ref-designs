// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: amb_top.v
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
module amb_top ( ps ,      // Primary Southbound 
                 ps_bar,   // Primary Southbound Complement
                 sn ,      // Secondary Northbound
                 sn_bar,   // Secondary Northbound Complement
                 pn,       // Primary Northbound
                 pn_bar,   // Primary Northbound Complement
                 ss ,      // Secondary Southbound
                 ss_bar ,  // Secondary Southbound Complement
                 link_clk,       // Link Clock 
                 link_clk_bar,   // Link clock complement
                 reset,          // Reset
                 frm_boundary,   // Frame Boundary Signal
                 command_in,
                 command_rdy,
                 command_type,
                 data_in,        // Dram data in
                 data_out,       // Dram data out
                 get_wbuffer_data, // Get write buffer data signal
                 put_rbuffer_data,  // Put read buffer data signal
                 dcalcsr,
                 dcaladdr,
                 clear_dcalcsr31,
                 drc,
                 dram_clk,
                 dram_2x_clk,
                 frm_start,
                 ref_2x_clk,
                 sclk,            // system clock
                 clk_int,         // Internal clock
                 dram_cmd_vld_delayed,
                 ddrio_nbencode_rd,
                 cke_reg_delayed,
                 sb_crc_error,
                 ch_state   
); // system interface

// Module parameters
parameter 	NB_LINK = 14;
parameter SB_LINK = 10;
parameter DS      = 0;

// Interface signals
output [NB_LINK-1:0] pn,pn_bar; // primary northbound
input  [NB_LINK-1:0] sn,sn_bar; // secondary southbound
output [SB_LINK-1:0] ss,ss_bar; // secondary southbound
input  [SB_LINK-1:0] ps,ps_bar; // primary southbound
output               sb_crc_error;

input                link_clk;
input                sclk;
input                link_clk_bar;
input                reset;
input                clear_dcalcsr31;
input                ref_2x_clk;
input                clk_int;
output [3:0]   ch_state;
output         frm_boundary;
output [23:0]  command_in;
output         command_rdy;
output [1:0]   command_type;
output [71:0]  data_in;
input  [71:0]  data_out;
input          get_wbuffer_data;
input          ddrio_nbencode_rd;
input          put_rbuffer_data;
inout [31:0]   dcalcsr,dcaladdr,drc;
input          dram_clk,dram_2x_clk;
input          dram_cmd_vld_delayed,cke_reg_delayed;    
output         frm_start;

//internal registers
real                 time1,time2,dram_clk_period;
real                 time1_2x,time2_2x,dram_2x_clk_period;
wire                 rbuf_rd,rbuf_empty;
wire [71:0]          rbuf_rdata;
wire                 init;
wire                 frm_boundary_nb;
wire [NB_LINK-1:0]   init_pn,init_pn_bar;
wire [NB_LINK-1:0]   pn_crc_err;
wire                 frm_begin;
wire                 frm_begin_nb;
wire                 sb_decode_clk;
wire                 dtm_enabled;
wire [NB_LINK-1:0]   nb_encode_pn,nb_encode_pn_bar,pn_fsr;
wire                 cfg_rd;
wire [31:0]          cfg_data;
wire                 send_status_frm;
wire [31:0]          l0sdur_reg;
wire [7:0]           fbdreg_mtr;
wire [31:0]          recalibdur_reg,fbdreg_dareftc,fbdreg_synctrainint;
wire [23:0]          sync_cmd;
wire                 disable_state;
wire                 init_seq_started;
wire [31:0]          dcalcsr,dcaladdr,drc;
wire [7:0]           fbds0,fbds1,fbds2,fbds3;
wire [7:0]           fbdreg_curr_cmd_to_data,fbdreg_curr_cmd_to_data_inc;
wire [7:0]           fbdreg_next_cmd_to_data,fbdreg_next_cmd_to_data_inc;
wire [3:0]           nb_config,sb_config;
wire [31:0]          fbdreg_emask,fbdreg_ferr,fbdreg_nerr;
wire                 write_fifo_empty;
wire                 enter_los,enter_recalibrate;
wire                 soft_channel_reset;
wire                 dtm_tr_complete;
wire                 nop_frame_detected;
wire [9:0]           ps0_out,ps1_out,ps2_out,ps3_out,ps4_out,ps5_out,ps6_out,ps7_out,ps8_out,ps9_out,ps10_out,ps11_out;
wire [9:0]           ps0_out_bar,ps1_out_bar,ps2_out_bar;
wire [13:0]          pn_out;
wire [13:0]          pn0_fsr,pn1_fsr,pn2_fsr,pn3_fsr,pn4_fsr,pn5_fsr,pn6_fsr,pn7_fsr,pn8_fsr,pn9_fsr;
wire [13:0]          pn0,pn1,pn2,pn3,pn4,pn5,pn6,pn7,pn8,pn9,pn10,pn11;
wire [13:0]          init_pn0,init_pn1,init_pn2,init_pn3,init_pn4,init_pn5,init_pn6,init_pn7,init_pn8,init_pn9,init_pn10,init_pn11;
wire                 serdes_data_rdy;


`ifdef FBDIMM_FAST_NB
assign pn     = pn_fsr ;
assign pn_bar = ~pn_fsr;
`else

 assign pn     = init ? pn_fsr : nb_encode_pn ;
 assign pn_bar = (init & (disable_state ) & !dtm_enabled) ? pn_fsr  :
                 (init & (!disable_state) & !dtm_enabled ) ? ~pn_fsr :
                 (init & !dtm_tr_complete & dtm_enabled ) ? ~pn_fsr :
                  nb_encode_pn_bar;
`endif

// SouthBound Decoder and CRC checker
sb_decode_crc #(SB_LINK,DS)  sb_decoder  ( .ps_in                        (ps) ,
                                           .ps_bar_in                    (ps_bar), 
                                           .ss                           (ss), 
                                           .ss_bar                       (ss_bar),
                                           .rbuffer_rd_data              (rbuf_rdata),
                                           .rbuffer_rd                   (rbuf_rd),
                                           .rbuffer_empty                (rbuf_empty),
                                           .config_reg_rd                (cfg_rd),
                                           .config_reg_data              (cfg_data),
                                           .send_status_frm              (send_status_frm),
                                           .sync_cmd                     (sync_cmd),
                                           .fbdreg_dcalcsr               (dcalcsr),
                                           .clear_dcalcsr31              (clear_dcalcsr31),
                                           .fbdreg_dcaladdr              (dcaladdr),
                                           .fbdreg_drc                   (drc),
                                           .fbdreg_dareftc               (fbdreg_dareftc),
                                           .fbdreg_synctrainint          (fbdreg_synctrainint),
                                           .fbdreg_mtr                   (fbdreg_mtr),
                                           .fbdreg_curr_cmd_to_data      (fbdreg_curr_cmd_to_data),
                                           .fbdreg_curr_cmd_to_data_inc  (fbdreg_curr_cmd_to_data_inc),
                                           .fbdreg_next_cmd_to_data      (fbdreg_next_cmd_to_data),
                                           .fbdreg_next_cmd_to_data_inc  (fbdreg_next_cmd_to_data_inc),
                                           .fbds0                        (fbds0),
                                           .fbds1                        (fbds1),
                                           .fbds2                        (fbds2),
                                           .fbds3                        (fbds3),
                                           .fbdreg_emask                 (fbdreg_emask),
                                           .fbdreg_ferr                  (fbdreg_ferr),
                                           .fbdreg_nerr                  (fbdreg_nerr),
`ifdef AXIS_FBDIMM_NO_FSR
`else
                                           .link_clk                     (link_clk ), 
                                           .link_clk_bar                 (link_clk_bar),
`endif
                                           .dram_clk                     (dram_clk),
                                           .dram_2x_clk                  (dram_2x_clk),
                                           .write_fifo_empty             (write_fifo_empty),
                                           .soft_channel_reset           (soft_channel_reset),
                                           .sb_crc_error                 (sb_crc_error ),
                                           .nop_frame_detected           ( nop_frame_detected ),
                                           .ref_2x_clk                   (ref_2x_clk),
                                           .sb_config                    (sb_config),
                                           .command_in                   (command_in),
                                           .command_rdy                  (command_rdy),
                                           .command_type                 (command_type),
					   .frm_boundary                 (frm_boundary), 
                                           .data_in                      (data_in),
                                           .data_out                     (data_out),
                                           .reset                        (reset),
                                           .get_wbuffer_data             (get_wbuffer_data),
                                           .put_rbuffer_data             (put_rbuffer_data),
                                           .init                         (init),
                                           .l0sdur_reg                   (l0sdur_reg),
                                           .recalibdur_reg               (recalibdur_reg),
                                           .dram_cmd_vld_delayed         (dram_cmd_vld_delayed),
                                           .cke_reg_delayed              (cke_reg_delayed),
                                           .enter_recalibrate            (enter_recalibrate),
                                           .enter_los                    (enter_los),
                                           .clk_int                      (sb_decode_clk),
                                           .frm_begin                    (frm_begin),
                                           .ps0_in                       (ps0_out),
                                           .ps1_in                       (ps1_out),
                                           .ps2_in                       (ps2_out),
                                           .ps3_in                       (ps3_out),
                                           .ps4_in                       (ps4_out),
                                           .ps5_in                       (ps5_out),
                                           .ps6_in                       (ps6_out),
                                           .ps7_in                       (ps7_out),
                                           .ps8_in                       (ps8_out),
                                           .ps9_in                       (ps9_out),
                                           .ps10_in                      (ps10_out),
                                           .ps11_in                      (ps11_out)

);

// NorthBound Encoder and CRC generator
nb_encode_crc #(NB_LINK,DS) nb_encoder ( .pn_shft_map_out              (nb_encode_pn) ,
                                         .pn_bar_map_out               (nb_encode_pn_bar),
                                         .sn_in                        (sn),
                                         .sn_bar_in                    (sn_bar),
                                         .rbuffer_rd_data_in           (rbuf_rdata),
                                         .rbuffer_rd_out               (rbuf_rd),
                                         .config_reg_rd                (cfg_rd),
                                         .config_reg_data              (cfg_data),
                                         .send_status_frm              (send_status_frm),
                                         .sync_cmd                     (sync_cmd),
                                         .frm_begin                    (frm_begin ),
                                         .frm_boundary                 (frm_boundary_nb),
                                         .frm_boundary_sb              (frm_boundary),
                                         .drc                          (drc),
                                         .fbds0                        (fbds0),
                                         .fbds1                        (fbds1),
                                         .fbds2                        (fbds2),
                                         .fbds3                        (fbds3),
                                         .rbuffer_empty                (rbuf_empty),
                                         .fbdreg_mtr                   (fbdreg_mtr),
                                         .reset                        (reset),
                                         .disable_state                (disable_state),
                                         .dram_clk                     (dram_clk),
                                         .dram_2x_clk                  (dram_2x_clk),
                                         .ddrio_nbencode_rd            (ddrio_nbencode_rd ),
                                         .clk_int                      (sb_decode_clk),
`ifdef AXIS_FBDIMM_NO_FSR
`else
                                         .link_clk                     (link_clk),
                                         .link_clk_bar                 (link_clk_bar),
`endif
                                         .fbdreg_curr_cmd_to_data      (fbdreg_curr_cmd_to_data),
                                         .fbdreg_curr_cmd_to_data_inc  (fbdreg_curr_cmd_to_data_inc),
                                         .fbdreg_next_cmd_to_data      (fbdreg_next_cmd_to_data),
                                         .fbdreg_next_cmd_to_data_inc  (fbdreg_next_cmd_to_data_inc),
                                         .soft_channel_reset           ( soft_channel_reset),
                                         .send_alert_frame_in          ( sb_crc_error ),
                                         .nb_config                    (nb_config),
                                         .init                         (init),
                                         .ref_clk                      (sclk),
                                         .pn0_out                      (pn0),
                                         .pn1_out                      (pn1),
                                         .pn2_out                      (pn2),
                                         .pn3_out                      (pn3),
                                         .pn4_out                      (pn4),
                                         .pn5_out                      (pn5),
                                         .pn6_out                      (pn6),
                                         .pn7_out                      (pn7),
                                         .pn8_out                      (pn8),
                                         .pn9_out                      (pn9),
                                         .pn10_out                     (pn10),
                                         .pn11_out                     (pn11),
                                         .electrical_idle              ( ps == ps_bar),
                                         .serdes_data_rdy              (serdes_data_rdy),
                                         .sb_crc_error                 (sb_crc_error) 
                                         );


reg sequence_start;
`ifdef DTM_ENABLED
initial sequence_start=1'b1;
`else
initial sequence_start=1'b0;

always@(posedge frm_boundary)
  sequence_start <= 1'b1;
 
`endif

amb_init #(NB_LINK,SB_LINK,DS) ambinit (.init               ( init),
                                        .ps                 ( ps),
                                        .ps0_in             ( ps0_out),
                                        .ps0_in_bar         ( ps0_out_bar),
                                        .ps1_in             ( ps1_out),
                                        .ps2_in             ( ps2_out),
                                        .ps3_in             ( ps3_out),
                                        .ps4_in             ( ps4_out),
                                        .ps5_in             ( ps5_out),
                                        .ps6_in             ( ps6_out),
                                        .ps7_in             ( ps7_out),
                                        .ps8_in             ( ps8_out),
                                        .ps9_in             ( ps9_out),
                                        .ps10_in            ( ps10_out),
                                        .ps11_in            ( ps11_out),
                                        .pn0_out            ( init_pn0),
                                        .pn1_out            ( init_pn1),
                                        .pn2_out            ( init_pn2),
                                        .pn3_out            ( init_pn3),
                                        .pn4_out            ( init_pn4),
                                        .pn5_out            ( init_pn5),
                                        .pn6_out            ( init_pn6),
                                        .pn7_out            ( init_pn7),
                                        .pn8_out            ( init_pn8),
                                        .pn9_out            ( init_pn9),
                                        .pn10_out           ( init_pn10),
                                        .pn11_out           ( init_pn11),
                                        `ifdef DTM_ENABLED
                                        .clk_int            ( !sequence_start ? clk_int: sb_decode_clk ),
                                        `else
                                        .clk_int            ( !init_seq_started ? clk_int: sb_decode_clk ),
                                        `endif
                                        .ps_bar             ( ps_bar),
                                        .pn                 ( init_pn),
                                        .pn_bar             ( init_pn_bar),
                                        .drc                ( drc),
                                        .frm_start          ( frm_start),
                                        .link_clk           ( link_clk),
                                        .sclk               ( sclk),
                                        .dram_clk           ( dram_clk),
                                        .ch_state           ( ch_state),
                                        .disable_state      ( disable_state),
                                        .enter_recalibrate  ( enter_recalibrate),
                                        .enter_los          ( enter_los),
                                        .dtm_tr_complete    ( dtm_tr_complete),
                                        .frm_boundary_fast  ( frm_boundary ), //& init_seq_started),
                                        .init_seq_started   ( init_seq_started),
                                        .l0sdur_reg         ( l0sdur_reg),
                                        .sb_config          ( sb_config),
                                        .nb_config          ( nb_config),
                                        .recalibdur_reg     ( recalibdur_reg),
                                        .rst                ( reset));
  
// SERDES BEHAVIORAL MODELS for FBDIMM

fbdimm_sb_fsr fbdimm_sb_fsr(.ps_in (ps),
                            .ps_in_bar (ps_bar),
                            .frm_begin (frm_begin),
                            .frm_begin_nb (frm_begin_nb),
                            .reset (reset),
                            .init_seq_started (init_seq_started),
                             .ps0_out_bar ( ps0_out_bar),
                             .ps0_out ( ps0_out),
                             .ps1_out ( ps1_out),
                             .ps1_out_bar ( ps1_out_bar),
                             .ps2_out ( ps2_out),
                             .ps2_out_bar ( ps2_out_bar),
                             .ps3_out ( ps3_out),
                             .ps4_out ( ps4_out),
                             .ps5_out ( ps5_out),
                             .ps6_out ( ps6_out),
                             .ps7_out            ( ps7_out),
                             .ps8_out            ( ps8_out),
                             .ps9_out            ( ps9_out),
                             .ps10_out           ( ps10_out),
                             .ps11_out           ( ps11_out),
                             .link_clk           ( link_clk),
                             .dtm_tr_complete    ( dtm_tr_complete),
                             .dtm_enabled_out    ( dtm_enabled),
                             .nop_frame_detected ( nop_frame_detected ),
                             .ref_clk            ( frm_boundary),
                             .frm_boundary_nb    ( frm_boundary_nb),
                             .sb_decode_clk      ( sb_decode_clk));
 


fbdimm_nb_fsr #(DS) fbdimm_nb_fsr( .reset (reset),
                             .pn0_in ( !init ? pn0 : init_pn0 ),
                             .pn1_in ( !init ? pn1 : init_pn1),
                             .pn2_in ( !init ? pn2 : init_pn2),
                             .pn3_in ( !init ? pn3 : init_pn3),
                             .pn4_in ( !init ? pn4 : init_pn4),
                             .pn5_in ( !init ? pn5 : init_pn5),
                             .pn6_in ( !init ? pn6 : init_pn6),
                             .pn7_in ( !init ? pn7 : init_pn7),
                             .pn8_in ( !init ? pn8 : init_pn8),
                             .pn9_in ( !init ? pn9 : init_pn9),
                             .pn10_in ( !init ? pn10 : init_pn10),
                             .pn11_in ( !init ? pn11 : init_pn11),
                             .pn_out ( pn_fsr),
                             .link_clk (link_clk),
                             .serdes_data_rdy (serdes_data_rdy),
                             .ref_clk (frm_boundary));



endmodule
