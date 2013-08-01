// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: amb_init.v
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
module amb_init(init,             // init singal going to other modules
                drc,              // drc register value
                rst,              // reset
                pn,               // primary northbound
                ps,               // primary soutbound
                ps_bar,           // primary soutbound complement
                ps_fsr,
                pn_bar,
                ps0_in,           // primary southbound link0
                ps0_in_bar,       // primary southbound link0 complement
                ps1_in,           // primary southbound link1
                ps1_in_bar,       // primary southbound link1
                ps2_in,           // primary southbound link2
                ps2_in_bar,       // primary southbound link2
                ps3_in,           // primary southbound link3
                ps4_in,           // primary southbound link4
                ps5_in,           // primary southbound link5
                ps6_in,           // primary southbound link6
                ps7_in,           // primary southbound link7
                ps8_in,           // primary southbound link8
                ps9_in,           // primary southbound link9
                ps10_in,          // primary southbound link10
                ps11_in,          // primary southbound link11
                pn0_out,           // primary northbound link0
                pn1_out,           // primary northbound link1
                pn2_out,           // primary northbound link2
                pn3_out,           // primary northbound link3
                pn4_out,           // primary northbound link4
                pn5_out,           // primary northbound link5
                pn6_out,           // primary northbound link6
                pn7_out,           // primary northbound link7
                pn8_out,           // primary northbound link8
                pn9_out,           // primary northbound link9
                pn10_out,          // primary northbound link10
                pn11_out,          // primary northbound link11
                pn12_out,          // primary northbound link11
                pn13_out,          // primary northbound link11
                enter_recalibrate,// enter recalibrate state signal 
                enter_los,        // enter L0S state signal
                l0sdur_reg,       
                recalibdur_reg,
                clk_int,          // internal clock
                frm_begin,        // signal that is asserted twice in a frame
                frm_begin_dtm,    // signal that is asserted twice in a frame
                frm_boundary,     // marking of frame boundaries
                frm_boundary_fast,     // marking of frame boundaries
                frm_boundary_dtm, // marking of frame boundaries
                sb_config,        // soutbound configuration
                nb_config,        // northbound configuration
                init_seq_started,
                disable_state,
                frm_start,
                link_clk,         // link clock
                dram_clk,         // dram clock
                dtm_tr_complete,
                ch_state,
                sclk);

parameter NB_LINK=14;
parameter SB_LINK=10;
parameter DS=0;

// Inputs / Outputs 

input  [SB_LINK-1:0] ps,ps_bar;
output [NB_LINK-1:0] pn,pn_bar;
input  [SB_LINK-1:0] ps0_in,ps1_in,ps2_in,ps3_in,ps4_in,ps5_in;
input  [SB_LINK-1:0] ps6_in,ps7_in,ps8_in,ps9_in,ps10_in,ps11_in;
output [NB_LINK-1:0] pn0_out,pn1_out,pn2_out,pn3_out,pn4_out,pn5_out;
output [NB_LINK-1:0] pn6_out,pn7_out,pn8_out,pn9_out,pn10_out,pn11_out,pn12_out,pn13_out;
input  [SB_LINK-1:0] ps0_in_bar,ps1_in_bar,ps2_in_bar;
input  [31:0]        drc,l0sdur_reg,recalibdur_reg;
input  [11:0]        ps_fsr;
output [3:0]         sb_config,nb_config;
input                link_clk,sclk,clk_int,dram_clk;
input                rst;
input                init_seq_started;
output               init;
output               frm_begin,frm_begin_dtm;
output               frm_boundary,frm_boundary_dtm;
output               disable_state;
input                frm_boundary_fast;
output               frm_start;
output [3:0]         ch_state;
input                enter_recalibrate, enter_los;
input                dtm_tr_complete;
 
// Internal registers
reg [143:0] ts0_reg0,ts0_reg1,ts0_reg2,ts0_reg3,ts0_reg4,ts0_reg5,ts0_reg6;
reg [143:0] ts0_reg7,ts0_reg8,ts0_reg9;
reg [47:0]  ireg_l0;
reg [47:0]  ireg_l1;
reg [47:0]  ireg_l2;
reg [47:0]  ireg_l3;
reg [47:0]  ireg_l4;
reg [47:0]  ireg_l5;
reg [47:0]  ireg_l6;
reg [47:0]  ireg_l7;
reg [47:0]  ireg_l8;
reg [47:0]  ireg_l9;
reg [11:0]  ts0_clk_training;
reg [11:0]  ts0_grp1;
reg [11:0]  ts0_grp2;
reg [11:0]  ts0_grp3;
reg [10:0]  test_header_reg;
reg [13:0]  ts2_start_reg,ts2_end_reg;
reg [13:0]  ts3_start_reg,ts3_end_reg;
reg [10:0]  calibrate_state_counter;
reg [13:0]  ts1_start_reg,ts1_end_reg;
reg [6:0]   nop_cnt;
reg [3:0]   curr_state;

reg [3:0]   next_state;
reg [3:0]   sb_config_reg;
reg [3:0]   nb_config_reg;
reg [7:0]   fsm_added_delay_reg;
reg [8:0]   LOs_Timer,Recalibrate_Timer;
reg [3:0]   fsr_counter,lock_counter,prev_counter;
reg [3:0]   fsr_counter2,lock_counter2,prev_counter2;
reg [3:0]   fsr_counter_dtm,lock_counter_dtm,prev_counter_dtm;
reg [3:0]   fsr_counter2_dtm,lock_counter2_dtm,prev_counter2_dtm;
reg [4:0]   training_counter;
reg [3:0]   LastAMB_ID;
reg [4:0]   nb_width_capability;
reg [3:0]   tsid;
reg         header_detected,enable_fsm,header_detected_dtm;
reg         dtm_enabled;
reg         fsm_reenable;
reg         init_reg;
reg         nb_tr_reg;
reg         training_sequence_start_reg;
reg         bypass_init;
reg         enter_calibrate_state;
reg         entered_LO; 
reg         dummy;
reg [3:0]   sb2nbmap_reg;
reg         testing_delimeter_end_detected;

wire [NB_LINK-1:0] pn0_out_tmp,pn1_out_tmp,pn2_out_tmp,pn3_out_tmp,pn4_out_tmp,pn5_out_tmp;
wire [NB_LINK-1:0] pn6_out_tmp,pn7_out_tmp,pn8_out_tmp,pn9_out_tmp,pn10_out_tmp,pn11_out_tmp,pn12_out_tmp,pn13_out_tmp;
wire [9:0]         delay_reg; 
wire [SB_LINK-1:0] ps_in;
wire [SB_LINK-1:0] ps_in_bar;
wire [NB_LINK-1:0] pn_reg;
wire [NB_LINK-1:0] pn_sb2nbmap;
wire [NB_LINK-1:0] pn_init;
wire [13:0]        ts0_ready;
wire [13:0]        tr_amb_id_ok,ts_amb_id_ok,cf_amb_id_ok,po_amb_id_ok;
wire [13:0]        frm_align,ts1_start,ts1_end,ts2_start,ts2_end,ts3_start,ts3_end;
wire [3:0]         amb_id0,amb_id1,amb_id2,amb_id3;
wire [3:0]         amb_id4,amb_id5,amb_id6,amb_id7;
wire [3:0]         amb_id8,amb_id9,amb_id10,amb_id11;
wire [3:0]         amb_id12,amb_id13;
wire [9:0]         mcu_sb_dummy;
wire [2:0]         dummy_sb2nbmap;
wire               training_sequence_start;
wire               nb_tr_en;
wire               link_clk_en;
wire               link_clk_int,dtm_link_clk_int;
wire               ts1_complete,ts2_complete,ts3_complete;
wire               tr_complete;
wire               dtm_rst;
wire               put_ts0_data;
wire               detect_test_hdr_2of3;
wire               detect_cfg_hdr_2of3;
wire               detect_poll_hdr_2of3;

// assignments

      assign delay_reg               =(drc[7:4]+drc[3:0])+fsm_added_delay_reg[7:0];


`ifdef AXIS_FBDIMM_NO_FSR
`else
assign link_clk_int            = link_clk & link_clk_en;
assign dtm_link_clk_int        = link_clk & nb_tr_en;
assign link_clk_en             = (ps_in === ps_in_bar ) | ( fsm_reenable ) ?  1'b1 : ( ~init_reg ) ? 1'b0 : 1'b1; 
`endif

assign nb_tr_en                = (ps_in === ps_in_bar ) | ( fsm_reenable ) ?  1'b1 : (  ~nb_tr_reg ) ? 1'b0:  1'b1;
assign put_ts0_data            = init_reg & ( ( tr_amb_id_ok == 14'h3fff ) | ( ts_amb_id_ok == 14'h3fff ) | ( cf_amb_id_ok ==  14'h3fff ) | ( po_amb_id_ok == 14'h3fff ));
assign mcu_sb_dummy            = ps;
assign training_sequence_start = training_sequence_start_reg;
assign ts2_start               = ts2_start_reg;
assign ts3_start               = ts3_start_reg;
assign ts1_start               = ts1_start_reg[11:0];
assign init                    = bypass_init ? rst : init_reg;
assign sb_config               = sb_config_reg;
assign nb_config               = nb_config_reg;
assign disable_state           = ( curr_state == `AMB_INIT_DISABLE );
assign ch_state = curr_state;

reg [7:0] fbd_poll_add_latency;

// Initialization

initial begin
  sb2nbmap_reg=0;
  tsid                              = 4'h0;
  nop_cnt                           = 0;
  curr_state                        = `AMB_INIT_DISABLE;
  fsr_counter                       = 4'h7;
  fsr_counter2                      = 4'hd;
  sb_config_reg                     = 4'hf;
  nb_config_reg                     = 4'hf;
  ts1_start_reg                     = 14'h0;
  entered_LO                        = 0;
  init_reg                          = 1;
  nb_tr_reg                         = 1;
  fsm_added_delay_reg               = 8'h0;
  calibrate_state_counter           = 0;

  `ifdef DTM_ENABLED
  dtm_enabled = 1;
  `else
  dtm_enabled = 0;
  `endif
 
`ifdef AXIS_FBDIMM_NO_FSR
    fbd_poll_add_latency = 8'h4;
`else
  if ( !$value$plusargs("fbd_poll_add_latency=%h", fbd_poll_add_latency))
    fbd_poll_add_latency = 8'h4;
`endif

   if ($test$plusargs("1_FBDIMM"))       LastAMB_ID=0;
   else if ($test$plusargs("2_FBDIMMS")) LastAMB_ID=1;
   else if ($test$plusargs("3_FBDIMMS")) LastAMB_ID=2;
   else if ($test$plusargs("4_FBDIMMS")) LastAMB_ID=3;
   else if ($test$plusargs("5_FBDIMMS")) LastAMB_ID=4;
   else if ($test$plusargs("6_FBDIMMS")) LastAMB_ID=5;
   else if ($test$plusargs("7_FBDIMMS")) LastAMB_ID=6;
   else if ($test$plusargs("8_FBDIMMS")) LastAMB_ID=7;
   else                                  LastAMB_ID=0;

   if ($test$plusargs("DTM_ENABLED")) dtm_enabled=1;
   else                               dtm_enabled=0;

   if ( $test$plusargs("bypass_init")) begin
     bypass_init      = 1; 
     lock_counter     = 4'h1;
     lock_counter_dtm = 4'h1;
     init_reg         = 0;
   end
   else begin
     bypass_init=0; 
   end

 nb_width_capability=5'h1f;

`ifdef AXIS_FBDIMM_HW
`else
 dummy=$value$plusargs("fbdimm_nb_witdh_capability=%h",nb_width_capability);

  if ( $test$plusargs("fbdimm_dbg"))   $ch_dispmon("amb_init",`DBG_0,1);
  if ( $test$plusargs("fbdimm_dbg_1")) $ch_dispmon("amb_init",`DBG_1,1);
  if ( $test$plusargs("fbdimm_dbg_2")) $ch_dispmon("amb_init",`DBG_2,1);
  if ( $test$plusargs("fbdimm_dbg_3")) $ch_dispmon("amb_init",`DBG_3,1);   
  if ( $test$plusargs("fbdimm_dbg_4")) $ch_dispmon("amb_init",`DBG_4,1);

  if ( $test$plusargs("mapout_sb9"))   sb_config_reg = 4'b1001;
  if ( $test$plusargs("mapout_sb8"))   sb_config_reg = 4'b1000;
  if ( $test$plusargs("mapout_sb7"))   sb_config_reg = 4'b0111;
  if ( $test$plusargs("mapout_sb6"))   sb_config_reg = 4'b0110;
  if ( $test$plusargs("mapout_sb5"))   sb_config_reg = 4'b0101;
  if ( $test$plusargs("mapout_sb4"))   sb_config_reg = 4'b0100;
  if ( $test$plusargs("mapout_sb3"))   sb_config_reg = 4'b0011;
  if ( $test$plusargs("mapout_sb2"))   sb_config_reg = 4'b0010;
  if ( $test$plusargs("mapout_sb1"))   sb_config_reg = 4'b0001;
  if ( $test$plusargs("mapout_sb0"))   sb_config_reg = 4'b0000;

  if ( $test$plusargs("mapout_nb13"))  nb_config_reg = 4'b1101;
  if ( $test$plusargs("mapout_nb12"))  nb_config_reg = 4'b1100;
  if ( $test$plusargs("mapout_nb11"))  nb_config_reg = 4'b1011;
  if ( $test$plusargs("mapout_nb10"))  nb_config_reg = 4'b1010;
  if ( $test$plusargs("mapout_nb9"))   nb_config_reg = 4'b1001;
  if ( $test$plusargs("mapout_nb8"))   nb_config_reg = 4'b1000;
  if ( $test$plusargs("mapout_nb7"))   nb_config_reg = 4'b0111;
  if ( $test$plusargs("mapout_nb6"))   nb_config_reg = 4'b0110;
  if ( $test$plusargs("mapout_nb5"))   nb_config_reg = 4'b0101;
  if ( $test$plusargs("mapout_nb4"))   nb_config_reg = 4'b0100;
  if ( $test$plusargs("mapout_nb3"))   nb_config_reg = 4'b0011;
  if ( $test$plusargs("mapout_nb2"))   nb_config_reg = 4'b0010;
  if ( $test$plusargs("mapout_nb1"))   nb_config_reg = 4'b0001;
  if ( $test$plusargs("mapout_nb0"))   nb_config_reg = 4'b0000;

`endif

end // initialization


`ifdef FBDIMM_BUG_107438
 always@(posedge link_clk)
  dtm_enabled <= tb_top.start_mcu_dtm_training;
`endif


// MAIN AMB INIT FSM

always@(negedge clk_int)
begin
 if ( !enter_calibrate_state )
 begin

    if (( ps0_in[1]  !== ps0_in[0]  ) && ( ps0_in[1]  == ps0_in[2]) ||
        ( ps1_in[1]  !== ps1_in[0]  ) && ( ps1_in[1]  == ps1_in[2]) ||
        ( ps2_in[1]  !== ps2_in[0]  ) && ( ps2_in[1]  == ps2_in[2]) ||
        ( ps3_in[1]  !== ps3_in[0]  ) && ( ps3_in[1]  == ps3_in[2]) ||
        ( ps4_in[1]  !== ps4_in[0]  ) && ( ps4_in[1]  == ps4_in[2]) ||
        ( ps5_in[1]  !== ps5_in[0]  ) && ( ps5_in[1]  == ps5_in[2]) ||
        ( ps6_in[1]  !== ps6_in[0]  ) && ( ps6_in[1]  == ps6_in[2]) ||
        ( ps7_in[1]  !== ps7_in[0]  ) && ( ps7_in[1]  == ps7_in[2]) ||
        ( ps8_in[1]  !== ps8_in[0]  ) && ( ps8_in[1]  == ps8_in[2]) ||
        ( ps9_in[1]  !== ps9_in[0]  ) && ( ps9_in[1]  == ps9_in[2]) ||
        ( ps10_in[1] !== ps10_in[0] ) && ( ps10_in[1] == ps10_in[2]) ||
        ( ps11_in[1] !== ps11_in[0] ) && ( ps11_in[1] == ps11_in[2]) 
        ) // failed lane is 0
       begin
         if ( {ps0_in[1],ps1_in[1],ps2_in[1],ps3_in[1],ps4_in[1],ps5_in[1],ps6_in[1],ps7_in[1],ps8_in[1],ps9_in[1]} == 10'h3ff )
           calibrate_state_counter <= calibrate_state_counter +1 ;
         else
           calibrate_state_counter <= 0;

       end else begin
         if ( {ps0_in[0],ps1_in[0],ps2_in[0],ps3_in[0],ps4_in[0],ps5_in[0],ps6_in[0],ps7_in[0],ps8_in[0],ps9_in[0]} == 10'h3ff )
           calibrate_state_counter <= calibrate_state_counter +1 ;
         else
           calibrate_state_counter <= 0;


       end

 end
 else
    calibrate_state_counter <= calibrate_state_counter +1 ;

 if ( !disable_state )
 begin
  if ( (calibrate_state_counter > (`tClkTrain * 2 * 3 )) && (( curr_state == `AMB_INIT_TRAIN) || ( curr_state == `AMB_INIT_CALIB) ) )
    enter_calibrate_state <= 1;
  else
    enter_calibrate_state <= 0;
 end
 else
    enter_calibrate_state <= 0;


end

always@(posedge clk_int)
begin
  if ( enter_los | enter_recalibrate )
    fsm_reenable <= 1;
  else if ( curr_state == `AMB_INIT_LO )
    fsm_reenable <=0;

end

reg [2:0] testing_delimeter_end_detect_state;
reg       ts1_in_progress;

initial begin
ts1_in_progress=0;
testing_delimeter_end_detect_state=0;
end

always@(negedge frm_boundary) 
begin
   case ( testing_delimeter_end_detect_state)
    3'h0: begin
           testing_delimeter_end_detected<=0;
          // if (( ps0_in[1] !== ps0_in[0] ) && ( ps0_in[1] == ps0_in[2]) ) // failed lane is 0
    if (( ps0_in[1]  !== ps0_in[0]  ) && ( ps0_in[1]  == ps0_in[2]) ||
        ( ps1_in[1]  !== ps1_in[0]  ) && ( ps1_in[1]  == ps1_in[2]) ||
        ( ps2_in[1]  !== ps2_in[0]  ) && ( ps2_in[1]  == ps2_in[2]) ||
        ( ps3_in[1]  !== ps3_in[0]  ) && ( ps3_in[1]  == ps3_in[2]) ||
        ( ps4_in[1]  !== ps4_in[0]  ) && ( ps4_in[1]  == ps4_in[2]) ||
        ( ps5_in[1]  !== ps5_in[0]  ) && ( ps5_in[1]  == ps5_in[2]) ||
        ( ps6_in[1]  !== ps6_in[0]  ) && ( ps6_in[1]  == ps6_in[2]) ||
        ( ps7_in[1]  !== ps7_in[0]  ) && ( ps7_in[1]  == ps7_in[2]) ||
        ( ps8_in[1]  !== ps8_in[0]  ) && ( ps8_in[1]  == ps8_in[2]) ||
        ( ps9_in[1]  !== ps9_in[0]  ) && ( ps9_in[1]  == ps9_in[2]) ||
        ( ps10_in[1] !== ps10_in[0] ) && ( ps10_in[1] == ps10_in[2]) ||
        ( ps11_in[1] !== ps11_in[0] ) && ( ps11_in[1] == ps11_in[2]) 
        ) // failed lane is 0

           begin
             if ( ({ps11_in[1],ps10_in[1],ps9_in[1],ps8_in[1],ps7_in[1],ps6_in[1],ps5_in[1],ps4_in[1],ps3_in[1],ps2_in[1],ps1_in[1],ps0_in[1]}  == 12'hffe)  ) 
             ts1_in_progress <= 1'b1;
           end else begin
             if ( ({ps11_in[0],ps10_in[0],ps9_in[0],ps8_in[0],ps7_in[0],ps6_in[0],ps5_in[0],ps4_in[0],ps3_in[0],ps2_in[0],ps1_in[0],ps0_in[0]}  == 12'hffe)  ) 
             ts1_in_progress <= 1'b1;
           end
 
    if (( ps0_in[1]  !== ps0_in[0]  ) && ( ps0_in[1]  == ps0_in[2]) ||
        ( ps1_in[1]  !== ps1_in[0]  ) && ( ps1_in[1]  == ps1_in[2]) ||
        ( ps2_in[1]  !== ps2_in[0]  ) && ( ps2_in[1]  == ps2_in[2]) ||
        ( ps3_in[1]  !== ps3_in[0]  ) && ( ps3_in[1]  == ps3_in[2]) ||
        ( ps4_in[1]  !== ps4_in[0]  ) && ( ps4_in[1]  == ps4_in[2]) ||
        ( ps5_in[1]  !== ps5_in[0]  ) && ( ps5_in[1]  == ps5_in[2]) ||
        ( ps6_in[1]  !== ps6_in[0]  ) && ( ps6_in[1]  == ps6_in[2]) ||
        ( ps7_in[1]  !== ps7_in[0]  ) && ( ps7_in[1]  == ps7_in[2]) ||
        ( ps8_in[1]  !== ps8_in[0]  ) && ( ps8_in[1]  == ps8_in[2]) ||
        ( ps9_in[1]  !== ps9_in[0]  ) && ( ps9_in[1]  == ps9_in[2]) ||
        ( ps10_in[1] !== ps10_in[0] ) && ( ps10_in[1] == ps10_in[2]) ||
        ( ps11_in[1] !== ps11_in[0] ) && ( ps11_in[1] == ps11_in[2])
        ) // failed lane is 0
          // if (( ps0_in[1] !== ps0_in[0] ) && ( ps0_in[1] == ps0_in[2]) ) // failed lane is 0
           begin
           if ( ({ps11_in[1],ps10_in[1],ps9_in[1],ps8_in[1],ps7_in[1],ps6_in[1],ps5_in[1],ps4_in[1],ps3_in[1],ps2_in[1],ps1_in[1],ps0_in[1]}  == 12'h678)  ) 
               testing_delimeter_end_detect_state <= 3'h1;
           end else begin
           if ( ({ps11_in[0],ps10_in[0],ps9_in[0],ps8_in[0],ps7_in[0],ps6_in[0],ps5_in[0],ps4_in[0],ps3_in[0],ps2_in[0],ps1_in[0],ps0_in[0]}  == 12'h678)  ) 
               testing_delimeter_end_detect_state <= 3'h1;
           end

          end
    3'h1: begin
    if (( ps0_in[1]  !== ps0_in[0]  ) && ( ps0_in[1]  == ps0_in[2]) ||
        ( ps1_in[1]  !== ps1_in[0]  ) && ( ps1_in[1]  == ps1_in[2]) ||
        ( ps2_in[1]  !== ps2_in[0]  ) && ( ps2_in[1]  == ps2_in[2]) ||
        ( ps3_in[1]  !== ps3_in[0]  ) && ( ps3_in[1]  == ps3_in[2]) ||
        ( ps4_in[1]  !== ps4_in[0]  ) && ( ps4_in[1]  == ps4_in[2]) ||
        ( ps5_in[1]  !== ps5_in[0]  ) && ( ps5_in[1]  == ps5_in[2]) ||
        ( ps6_in[1]  !== ps6_in[0]  ) && ( ps6_in[1]  == ps6_in[2]) ||
        ( ps7_in[1]  !== ps7_in[0]  ) && ( ps7_in[1]  == ps7_in[2]) ||
        ( ps8_in[1]  !== ps8_in[0]  ) && ( ps8_in[1]  == ps8_in[2]) ||
        ( ps9_in[1]  !== ps9_in[0]  ) && ( ps9_in[1]  == ps9_in[2]) ||
        ( ps10_in[1] !== ps10_in[0] ) && ( ps10_in[1] == ps10_in[2]) ||
        ( ps11_in[1] !== ps11_in[0] ) && ( ps11_in[1] == ps11_in[2]) 
        ) // failed lane is 0
           //if (( ps0_in[1] !== ps0_in[0] ) && ( ps0_in[1] == ps0_in[2]) ) // failed lane is 0
           begin

           if ( ({ps11_in[1],ps10_in[1],ps9_in[1],ps8_in[1],ps7_in[1],ps6_in[1],ps5_in[1],ps4_in[1],ps3_in[1],ps2_in[1],ps1_in[1],ps0_in[1]}  == 12'h345)  ) 
               testing_delimeter_end_detect_state <= 3'h2;
           else  if ( ({ps11_in[1],ps10_in[1],ps9_in[1],ps8_in[1],ps7_in[1],ps6_in[1],ps5_in[1],ps4_in[1],ps3_in[1],ps2_in[1],ps1_in[1],ps0_in[1]}  !== 12'h678)  ) 
               testing_delimeter_end_detect_state <= 3'h0;

           end else begin
           if ( ({ps11_in[0],ps10_in[0],ps9_in[0],ps8_in[0],ps7_in[0],ps6_in[0],ps5_in[0],ps4_in[0],ps3_in[0],ps2_in[0],ps1_in[0],ps0_in[0]}  == 12'h345)  ) 
               testing_delimeter_end_detect_state <= 3'h2;
           else if ( ({ps11_in[0],ps10_in[0],ps9_in[0],ps8_in[0],ps7_in[0],ps6_in[0],ps5_in[0],ps4_in[0],ps3_in[0],ps2_in[0],ps1_in[0],ps0_in[0]}  !== 12'h678)  ) 
               testing_delimeter_end_detect_state <= 3'h0;
           end

          end
    3'h2: begin
           //if (( ps0_in[1] !== ps0_in[0] ) && ( ps0_in[1] == ps0_in[2]) ) // failed lane is 0
    if (( ps0_in[1]  !== ps0_in[0]  ) && ( ps0_in[1]  == ps0_in[2]) ||
        ( ps1_in[1]  !== ps1_in[0]  ) && ( ps1_in[1]  == ps1_in[2]) ||
        ( ps2_in[1]  !== ps2_in[0]  ) && ( ps2_in[1]  == ps2_in[2]) ||
        ( ps3_in[1]  !== ps3_in[0]  ) && ( ps3_in[1]  == ps3_in[2]) ||
        ( ps4_in[1]  !== ps4_in[0]  ) && ( ps4_in[1]  == ps4_in[2]) ||
        ( ps5_in[1]  !== ps5_in[0]  ) && ( ps5_in[1]  == ps5_in[2]) ||
        ( ps6_in[1]  !== ps6_in[0]  ) && ( ps6_in[1]  == ps6_in[2]) ||
        ( ps7_in[1]  !== ps7_in[0]  ) && ( ps7_in[1]  == ps7_in[2]) ||
        ( ps8_in[1]  !== ps8_in[0]  ) && ( ps8_in[1]  == ps8_in[2]) ||
        ( ps9_in[1]  !== ps9_in[0]  ) && ( ps9_in[1]  == ps9_in[2]) ||
        ( ps10_in[1] !== ps10_in[0] ) && ( ps10_in[1] == ps10_in[2]) ||
        ( ps11_in[1] !== ps11_in[0] ) && ( ps11_in[1] == ps11_in[2])
        ) // failed lane is 0
           begin
           if ( ({ps11_in[1],ps10_in[1],ps9_in[1],ps8_in[1],ps7_in[1],ps6_in[1],ps5_in[1],ps4_in[1],ps3_in[1],ps2_in[1],ps1_in[1],ps0_in[1]}  == 12'h678) ) 
               testing_delimeter_end_detect_state <= 3'h3;
           else
               testing_delimeter_end_detect_state <= 3'h0;
           end else begin
           if ( ({ps11_in[0],ps10_in[0],ps9_in[0],ps8_in[0],ps7_in[0],ps6_in[0],ps5_in[0],ps4_in[0],ps3_in[0],ps2_in[0],ps1_in[0],ps0_in[0]}  == 12'h678)  ) 
               testing_delimeter_end_detect_state <= 3'h3;
           else
               testing_delimeter_end_detect_state <= 3'h0;
           end

          end
    3'h3: begin

           //if (( ps0_in[1] !== ps0_in[0] ) && ( ps0_in[1] == ps0_in[2]) ) // failed lane is 0
    if (( ps0_in[1]  !== ps0_in[0]  ) && ( ps0_in[1]  == ps0_in[2]) ||
        ( ps1_in[1]  !== ps1_in[0]  ) && ( ps1_in[1]  == ps1_in[2]) ||
        ( ps2_in[1]  !== ps2_in[0]  ) && ( ps2_in[1]  == ps2_in[2]) ||
        ( ps3_in[1]  !== ps3_in[0]  ) && ( ps3_in[1]  == ps3_in[2]) ||
        ( ps4_in[1]  !== ps4_in[0]  ) && ( ps4_in[1]  == ps4_in[2]) ||
        ( ps5_in[1]  !== ps5_in[0]  ) && ( ps5_in[1]  == ps5_in[2]) ||
        ( ps6_in[1]  !== ps6_in[0]  ) && ( ps6_in[1]  == ps6_in[2]) ||
        ( ps7_in[1]  !== ps7_in[0]  ) && ( ps7_in[1]  == ps7_in[2]) ||
        ( ps8_in[1]  !== ps8_in[0]  ) && ( ps8_in[1]  == ps8_in[2]) ||
        ( ps9_in[1]  !== ps9_in[0]  ) && ( ps9_in[1]  == ps9_in[2]) ||
        ( ps10_in[1] !== ps10_in[0] ) && ( ps10_in[1] == ps10_in[2]) ||
        ( ps11_in[1] !== ps11_in[0] ) && ( ps11_in[1] == ps11_in[2]) 
        ) // failed lane is 0
           begin
           if ( ({ps11_in[1],ps10_in[1],ps9_in[1],ps8_in[1],ps7_in[1],ps6_in[1],ps5_in[1],ps4_in[1],ps3_in[1],ps2_in[1],ps1_in[1],ps0_in[1]}  == 12'h345)  ) 
               testing_delimeter_end_detected<=1;
           else
               testing_delimeter_end_detect_state <= 3'h0;
           end else begin
           if ( ({ps11_in[0],ps10_in[0],ps9_in[0],ps8_in[0],ps7_in[0],ps6_in[0],ps5_in[0],ps4_in[0],ps3_in[0],ps2_in[0],ps1_in[0],ps0_in[0]}  == 12'h345)  ) 
               testing_delimeter_end_detected<=1;
           else
               testing_delimeter_end_detect_state <= 3'h0;
           end
         
           testing_delimeter_end_detect_state <= 3'h0;
           ts1_in_progress <= 1'b0;

          end

   endcase


end

wire detected_2of3_exit_ei;
wire detected_2of3_enter_ei;

voting_logic test_exit_disable (.a ( ps0_in[0] != ps0_in_bar[0] ),
                           .b ( ps0_in[1] != ps0_in_bar[1] ),
                           .c ( ps0_in[2] != ps0_in_bar[2] ),
                           .out (detected_2of3_exit_ei ));

voting_logic test_enter_disable (.a ( ps0_in[0] == ps0_in_bar[0] ),
                           .b ( ps0_in[1] == ps0_in_bar[1] ),
                           .c ( ps0_in[2] == ps0_in_bar[2] ),
                           .out (detected_2of3_enter_ei ));


wire detected_2of3_ts2_hdr;

voting_logic test_ts2_header(.a (({ps11_in[0],ps10_in[0],ps9_in[0],ps8_in[0],ps7_in[0],ps6_in[0],ps5_in[0],ps4_in[0],ps3_in[0],ps2_in[0],ps1_in[0],ps0_in[0]} == 12'hffe)),
                             .b (({ps11_in[1],ps10_in[1],ps9_in[1],ps8_in[1],ps7_in[1],ps6_in[1],ps5_in[1],ps4_in[1],ps3_in[1],ps2_in[1],ps1_in[1],ps0_in[1]} == 12'hffe)),
                             .c (({ps11_in[2],ps10_in[2],ps9_in[2],ps8_in[2],ps7_in[2],ps6_in[2],ps5_in[2],ps4_in[2],ps3_in[2],ps2_in[2],ps1_in[2],ps0_in[2]} == 12'hffe)),
                             .out ( detected_2of3_ts2_hdr ));

always@(negedge clk_int) if ( ~bypass_init) begin

   if ( rst ) begin
     curr_state = `AMB_INIT_DISABLE;
     init_reg=1;
  end
  else
   case(curr_state)
     `AMB_INIT_DISABLE: begin
                         nop_cnt=0;
                         init_reg=1;
                         if ( detected_2of3_exit_ei )                 
                         begin
                           curr_state=`AMB_INIT_TRAIN;
                           entered_LO = 0;
                           //init_reg=1;
                           training_sequence_start_reg=1;
                         end
                         else begin
                           //init_reg=0;
                           training_sequence_start_reg=0;
                         end
                        end
     `AMB_INIT_TRAIN  : begin

                        if ( enter_calibrate_state ) begin
                            training_sequence_start_reg=0;
                            curr_state=`AMB_INIT_CALIB;
                         end

                         if ( detected_2of3_enter_ei ) begin                
                            training_sequence_start_reg=0;
                           curr_state=`AMB_INIT_DISABLE;
                        end

                        if ( (detected_2of3_ts2_hdr && dtm_enabled == 0 ) 
                             ||
                             (dtm_tr_complete &&  dtm_enabled == 1))
                        begin
                        training_counter = training_counter + 1;
                        training_sequence_start_reg=0;
			  if(dtm_enabled == 1 )
                              begin
                              curr_state = `AMB_INIT_LO;
                              entered_LO = 1;
                              end
			  else if(dtm_enabled == 0)
                              begin
                              curr_state=`AMB_INIT_TEST;
                              entered_LO = 0;
                              end
                         end
                        else begin
                        ts0_reg0[143:0] = {ts0_reg0[142:0],ps_in[0]};
                        ts0_reg1[143:0] = {ts0_reg1[142:0],ps_in[1]};
                        ts0_reg2[143:0] = {ts0_reg2[142:0],ps_in[2]};
                        ts0_reg3[143:0] = {ts0_reg3[142:0],ps_in[3]};
                        ts0_reg4[143:0] = {ts0_reg4[142:0],ps_in[4]};
                        ts0_reg5[143:0] = {ts0_reg5[142:0],ps_in[5]};
                        ts0_reg6[143:0] = {ts0_reg6[142:0],ps_in[6]};
                        ts0_reg7[143:0] = {ts0_reg7[142:0],ps_in[7]};
                        ts0_reg8[143:0] = {ts0_reg8[142:0],ps_in[8]};
                        ts0_reg9[143:0] = {ts0_reg9[142:0],ps_in[9]};

                        end
                        end 

     `AMB_INIT_CALIB  : begin

                         if ( detected_2of3_enter_ei )
                           curr_state=`AMB_INIT_DISABLE;

                        end

     `AMB_INIT_TEST   : begin
                         ts1_start_reg[11:0]=12'hfff; // start testing sequence
                         test_header_reg[10:0] = {ps_in[0], test_header_reg[10:1]};  



                       //if (( ps0_in[1] !== ps0_in[0] ) && ( ps0_in[1] == ps0_in[2]) ) // failed lane is 0
    if (( ps0_in[1]  !== ps0_in[0]  ) && ( ps0_in[1]  == ps0_in[2]) ||
        ( ps1_in[1]  !== ps1_in[0]  ) && ( ps1_in[1]  == ps1_in[2]) ||
        ( ps2_in[1]  !== ps2_in[0]  ) && ( ps2_in[1]  == ps2_in[2]) ||
        ( ps3_in[1]  !== ps3_in[0]  ) && ( ps3_in[1]  == ps3_in[2]) ||
        ( ps4_in[1]  !== ps4_in[0]  ) && ( ps4_in[1]  == ps4_in[2]) ||
        ( ps5_in[1]  !== ps5_in[0]  ) && ( ps5_in[1]  == ps5_in[2]) ||
        ( ps6_in[1]  !== ps6_in[0]  ) && ( ps6_in[1]  == ps6_in[2]) ||
        ( ps7_in[1]  !== ps7_in[0]  ) && ( ps7_in[1]  == ps7_in[2]) ||
        ( ps8_in[1]  !== ps8_in[0]  ) && ( ps8_in[1]  == ps8_in[2]) ||
        ( ps9_in[1]  !== ps9_in[0]  ) && ( ps9_in[1]  == ps9_in[2]) ||
        ( ps10_in[1] !== ps10_in[0] ) && ( ps10_in[1] == ps10_in[2]) ||
        ( ps11_in[1] !== ps11_in[0] ) && ( ps11_in[1] == ps11_in[2]) 
        ) // failed lane is 0
                       begin
                        if ( ({ps11_in[1],ps10_in[1],ps9_in[1],ps8_in[1],ps7_in[1],ps6_in[1],ps5_in[1],ps4_in[1],ps3_in[1],ps2_in[1],ps1_in[1],ps0_in[1]}   == 12'h7fe) & !ts1_in_progress ) begin 
                            curr_state=`AMB_INIT_POLL;
                            ts1_start_reg[11:0]=12'h0;
                         end
                       end else begin
                        if ( ({ps11_in[0],ps10_in[0],ps9_in[0],ps8_in[0],ps7_in[0],ps6_in[0],ps5_in[0],ps4_in[0],ps3_in[0],ps2_in[0],ps1_in[0],ps0_in[0]}   == 12'h7fe) & !ts1_in_progress ) begin 
                            curr_state=`AMB_INIT_POLL;
                            ts1_start_reg[11:0]=12'h0;
                         end
 
                       end

                         if ( ps_in == ps_in_bar )                 
                           curr_state=`AMB_INIT_DISABLE;
                

                        end 

     `AMB_INIT_POLL   : begin

                         if ( detected_2of3_enter_ei )                 
                           curr_state=`AMB_INIT_DISABLE;

                         ts2_start_reg=12'hfff; // start testing sequence
     `ifdef AXIS_FBDIMM_1AMB
                        fsm_added_delay_reg= fbd_poll_add_latency; //8'h4;  // add 6.5 dram cycles workth of delay
      `else
            `ifdef FBDIMM_FAST_NB
                        fsm_added_delay_reg= fbd_poll_add_latency;  // add 6.5 dram cycles workth of delay
            `else
                        fsm_added_delay_reg=8'h2;  // add 6.5 dram cycles workth of delay
            `endif
     `endif



                       //if (( ps0_in[1] !== ps0_in[0] ) && ( ps0_in[1] == ps0_in[2]) ) // failed lane is 0
    if (( ps0_in[1]  !== ps0_in[0]  ) && ( ps0_in[1]  == ps0_in[2]) ||
        ( ps1_in[1]  !== ps1_in[0]  ) && ( ps1_in[1]  == ps1_in[2]) ||
        ( ps2_in[1]  !== ps2_in[0]  ) && ( ps2_in[1]  == ps2_in[2]) ||
        ( ps3_in[1]  !== ps3_in[0]  ) && ( ps3_in[1]  == ps3_in[2]) ||
        ( ps4_in[1]  !== ps4_in[0]  ) && ( ps4_in[1]  == ps4_in[2]) ||
        ( ps5_in[1]  !== ps5_in[0]  ) && ( ps5_in[1]  == ps5_in[2]) ||
        ( ps6_in[1]  !== ps6_in[0]  ) && ( ps6_in[1]  == ps6_in[2]) ||
        ( ps7_in[1]  !== ps7_in[0]  ) && ( ps7_in[1]  == ps7_in[2]) ||
        ( ps8_in[1]  !== ps8_in[0]  ) && ( ps8_in[1]  == ps8_in[2]) ||
        ( ps9_in[1]  !== ps9_in[0]  ) && ( ps9_in[1]  == ps9_in[2]) ||
        ( ps10_in[1] !== ps10_in[0] ) && ( ps10_in[1] == ps10_in[2]) ||
        ( ps11_in[1] !== ps11_in[0] ) && ( ps11_in[1] == ps11_in[2]) 
        ) // failed lane is 0
                       begin
                        if ( ({ps11_in[1],ps10_in[1],ps9_in[1],ps8_in[1],ps7_in[1],ps6_in[1],ps5_in[1],ps4_in[1],ps3_in[1],ps2_in[1],ps1_in[1],ps0_in[1]}   == 12'h3fe) ) 
                            curr_state=`AMB_INIT_CONFIG;
                       end else begin
                        if ( ({ps11_in[0],ps10_in[0],ps9_in[0],ps8_in[0],ps7_in[0],ps6_in[0],ps5_in[0],ps4_in[0],ps3_in[0],ps2_in[0],ps1_in[0],ps0_in[0]}   == 12'h3fe) ) 
                            curr_state=`AMB_INIT_CONFIG;
                       end

                
                        end 
     `AMB_INIT_CONFIG : begin

                         if ( detected_2of3_enter_ei )                 
                           curr_state=`AMB_INIT_DISABLE;

                        ts3_start_reg=12'hfff; // start testing sequence

                        if ( ps0_in | ps1_in | ps2_in | ps3_in | ps4_in | ps5_in | ps6_in | ps7_in | ps8_in | ps9_in | ps10_in | ps11_in  )
                           nop_cnt = 0;
                        else
                           nop_cnt=nop_cnt+1;

                        if ( nop_cnt > 10 ) 
                          curr_state=`AMB_INIT_LO;


                        end 
     `AMB_INIT_LO     : begin

                         if ( detected_2of3_enter_ei )                 
                           curr_state=`AMB_INIT_DISABLE;

                         if ( enter_recalibrate ) begin 
                            curr_state=`AMB_INIT_RECALIB;
                            Recalibrate_Timer =  9'h0;
                         end
                         if ( enter_los ) begin
                            curr_state=`AMB_INIT_LOS;
                            LOs_Timer=9'h0;
                         end

		   	begin
			 init_reg = 0;
			 fsm_added_delay_reg=8'h0 ;
			 end

                        end 
      `AMB_INIT_RECALIB: begin

                         if ( detected_2of3_enter_ei )                 
                           curr_state=`AMB_INIT_DISABLE;

`ifdef AXIS_FBDIMM_HW
`else
                          `PR_ALWAYS ("amb_init",`DBG_0,"Entering AMB Recalibrate State!");
`endif
                          init_reg=1;
                          if ( Recalibrate_Timer == (recalibdur_reg[6:1]*12) ) // 32 frames
                            curr_state=`AMB_INIT_LO; 
                          else
                            Recalibrate_Timer= Recalibrate_Timer + 9'h1;
                          
                        end
      `AMB_INIT_LOS        : begin

                         if ( detected_2of3_enter_ei )                 
                           curr_state=`AMB_INIT_DISABLE;

`ifdef AXIS_FBDIMM_HW
`else
                          `PR_ALWAYS ("amb_init",`DBG_0,"Entering AMB LOs State!");
`endif

                          if ( LOs_Timer == (l0sdur_reg[6:1]*12) ) // 32 frames
                            curr_state=`AMB_INIT_LO; 
                          else
                            LOs_Timer= LOs_Timer + 9'h1;

                        end
   endcase

end

               


assign pn_sb2nbmap = ( sb2nbmap_reg == 3'h0 ) ? {ps_in[3:0],ps_in[4:0],ps_in[4:0]} :
                     ( sb2nbmap_reg == 3'h1 ) ? {ps_in[8:5],ps_in[9:5],ps_in[9:5]} : ps_in ;





`ifdef AXIS_FBDIMM_NO_FSR
always@(posedge clk_int)
`else
// Need to leave this one on so that frm_boundary could be sent to other blocks
always@(posedge link_clk)
`endif
begin
  if ( fsr_counter == 4'h1 )
   fsr_counter = 4'h6;
  else
   fsr_counter = fsr_counter - 1;

  if ( fsr_counter2 == 4'h1 )
   fsr_counter2 = 4'hc;
  else
   fsr_counter2 = fsr_counter2 - 1;

`ifdef DTM_ENABLED

  if ( fsr_counter_dtm == 4'h1 )
   fsr_counter_dtm = 4'h6;
  else
   fsr_counter_dtm = fsr_counter_dtm - 1;

  if ( fsr_counter2_dtm == 4'h1 )
   fsr_counter2_dtm = 4'hc;
  else
   fsr_counter2_dtm = fsr_counter2_dtm - 1;

`endif

end

assign frm_begin = (dtm_enabled && entered_LO ) ? frm_begin_dtm : ( fsr_counter == lock_counter   ) ?  1'b1 : 1'b0 ;
assign frm_boundary = (bypass_init) ? ((fsr_counter2) ==  (lock_counter+6)) : (fsr_counter2 == lock_counter2) ;

`ifdef DTM_ENABLED
assign frm_begin_dtm = (fsr_counter_dtm == lock_counter_dtm ) ? 1'b1: 1'b0;
assign frm_boundary_dtm = (bypass_init) ? ((fsr_counter2_dtm) ==  (lock_counter_dtm+6)) : (fsr_counter2_dtm == lock_counter2_dtm) ;
`endif

`ifdef AXIS_FBDIMM_NO_FSR
always@(negedge clk_int) if ( ~bypass_init )
`else
always@(negedge link_clk_int) if ( ~bypass_init )
`endif // AXIS_FBDIMM_NO_FSR
begin
  if (header_detected )
  begin
   lock_counter <= prev_counter;
   lock_counter2 <=  prev_counter2;
  end
  else begin
   prev_counter <= fsr_counter;
   prev_counter2 <= fsr_counter2;
  end
end  

`ifdef DTM_ENABLED

always@(negedge dtm_link_clk_int) if ( ~bypass_init ) 
begin 

  if ( rst || ( dtm_enabled && dtm_rst))
  lock_counter2_dtm <= 0;

  if (header_detected_dtm )
  begin
   lock_counter_dtm <= prev_counter_dtm;
   lock_counter2_dtm <=  prev_counter2_dtm;
  end
  else begin
   prev_counter_dtm <= fsr_counter_dtm;
   prev_counter2_dtm <= fsr_counter2_dtm;
  end
end  

`endif


`ifdef AXIS_FBDIMM_NO_FSR
always@(negedge clk_int) if ( ~bypass_init  && ( curr_state == `AMB_INIT_TRAIN ))
`else
always@(posedge link_clk_int) if ( ~bypass_init && ( curr_state == `AMB_INIT_TRAIN ))
`endif
begin
 if ( ireg_l0[47:36] == 12'hbfe )
   header_detected<=1;
 else
  header_detected<=0;
end
else
  header_detected<=0;

`ifdef DTM_ENABLED

always@(posedge dtm_link_clk_int) if ( ~bypass_init)
begin
 if ( ireg_l0[47:36] == 12'hbfe )
   header_detected_dtm<=1;
 else
  header_detected_dtm<=0;
end

`endif

always@(posedge dram_clk)
begin
 if (header_detected )
   enable_fsm=1;
end


reg [13:0] pn_shift_reg;
reg overwrite;




initial begin
  ireg_l0     = 48'h000000000; 
  ireg_l1     = 48'h000000000;
  ireg_l2     = 48'h00000000;
  ireg_l3     = 48'h00000000;
  ireg_l4     = 48'h00000000;
  ireg_l5     = 48'h00000000;
  ireg_l6     = 48'h00000000;
  ireg_l7     = 48'h000000000;
  ireg_l8     = 48'h000000000;
  ireg_l9     = 48'h000000000;

end

reg ow;
reg ts1_ow_en;
reg [2:0] ts3_pattern_state;
reg [11:0] ts3_pattern;
reg [47:0] ts3_ireg;
reg ts3_ow;

initial ts1_ow_en=0;

always@(negedge frm_boundary_fast ) 
begin
if ( init_seq_started ) begin //init_seq_started ) begin

    if ( ( curr_state == `AMB_INIT_TRAIN )) 
       tsid <= 0;

    if (( ps0_in[1]  !== ps0_in[0]  ) && ( ps0_in[1]  == ps0_in[2]) ||
        ( ps1_in[1]  !== ps1_in[0]  ) && ( ps1_in[1]  == ps1_in[2]) ||
        ( ps2_in[1]  !== ps2_in[0]  ) && ( ps2_in[1]  == ps2_in[2]) ||
        ( ps3_in[1]  !== ps3_in[0]  ) && ( ps3_in[1]  == ps3_in[2]) ||
        ( ps4_in[1]  !== ps4_in[0]  ) && ( ps4_in[1]  == ps4_in[2]) ||
        ( ps5_in[1]  !== ps5_in[0]  ) && ( ps5_in[1]  == ps5_in[2]) ||
        ( ps6_in[1]  !== ps6_in[0]  ) && ( ps6_in[1]  == ps6_in[2]) ||
        ( ps7_in[1]  !== ps7_in[0]  ) && ( ps7_in[1]  == ps7_in[2]) ||
        ( ps8_in[1]  !== ps8_in[0]  ) && ( ps8_in[1]  == ps8_in[2]) ||
        ( ps9_in[1]  !== ps9_in[0]  ) && ( ps9_in[1]  == ps9_in[2]) ||
        ( ps10_in[1] !== ps10_in[0] ) && ( ps10_in[1] == ps10_in[2]) ||
        ( ps11_in[1] !== ps11_in[0] ) && ( ps11_in[1] == ps11_in[2]) 
        ) // failed lane is 0
     begin
      if ( ireg_l1[47:0] == 48'h345678345678 )
       ts1_ow_en=0;
     end else begin
      if ( ireg_l0[47:0] == 48'h345678345678 )
       ts1_ow_en=0;
     end


if ( ( detect_test_hdr_2of3  ) && ( curr_state == `AMB_INIT_TEST ) && !ts1_ow_en ) begin
    ow=1;
     ts1_ow_en=1;
     //if (( ps0_in[0] !== ps0_in[1] ) && ( ps0_in[1] == ps0_in[2]) ) // failed lane is 0 
    if (( ps0_in[1]  !== ps0_in[0]  ) && ( ps0_in[1]  == ps0_in[2]) ||
        ( ps1_in[1]  !== ps1_in[0]  ) && ( ps1_in[1]  == ps1_in[2]) ||
        ( ps2_in[1]  !== ps2_in[0]  ) && ( ps2_in[1]  == ps2_in[2]) ||
        ( ps3_in[1]  !== ps3_in[0]  ) && ( ps3_in[1]  == ps3_in[2]) ||
        ( ps4_in[1]  !== ps4_in[0]  ) && ( ps4_in[1]  == ps4_in[2]) ||
        ( ps5_in[1]  !== ps5_in[0]  ) && ( ps5_in[1]  == ps5_in[2]) ||
        ( ps6_in[1]  !== ps6_in[0]  ) && ( ps6_in[1]  == ps6_in[2]) ||
        ( ps7_in[1]  !== ps7_in[0]  ) && ( ps7_in[1]  == ps7_in[2]) ||
        ( ps8_in[1]  !== ps8_in[0]  ) && ( ps8_in[1]  == ps8_in[2]) ||
        ( ps9_in[1]  !== ps9_in[0]  ) && ( ps9_in[1]  == ps9_in[2]) ||
        ( ps10_in[1] !== ps10_in[0] ) && ( ps10_in[1] == ps10_in[2]) ||
        ( ps11_in[1] !== ps11_in[0] ) && ( ps11_in[1] == ps11_in[2]) 
        ) // failed lane is 0
      sb2nbmap_reg = ireg_l1[31:28];
     else
      sb2nbmap_reg = ireg_l0[31:28];

    ireg_l0[47:0] <= { ps11_in[0], ps10_in[0], ps9_in[0],  ps8_in[0], ps7_in[0],  ps6_in[0],ps5_in[0],ps4_in[0],  ps3_in[0],  ps2_in[0],  ps1_in[0],  ps0_in[0],  ireg_l0[47:28],LastAMB_ID,ireg_l0[23:12]};  
    ireg_l1[47:0] <= { ps11_in[1], ps10_in[1], ps9_in[1],  ps8_in[1], ps7_in[1],  ps6_in[1], ps5_in[1],  ps4_in[1],  ps3_in[1],  ps2_in[1],  ps1_in[1],  ps0_in[1],  ireg_l1[47:28],LastAMB_ID,ireg_l1[23:12]};  
    ireg_l2[47:0] <= { ps11_in[2], ps10_in[2], ps9_in[2],  ps8_in[2], ps7_in[2],  ps6_in[2],  ps5_in[2],  ps4_in[2],  ps3_in[2],  ps2_in[2],  ps1_in[2],  ps0_in[2],  ireg_l2[47:28],LastAMB_ID,ireg_l2[23:12]};  
    ireg_l3[47:0] <= { ps11_in[3], ps10_in[3], ps9_in[3],  ps8_in[3], ps7_in[3],  ps6_in[3],  ps5_in[3],  ps4_in[3],  ps3_in[3],  ps2_in[3],  ps1_in[3],  ps0_in[3],  ireg_l3[47:28],LastAMB_ID,ireg_l3[23:12]};  
    ireg_l4[47:0] <= { ps11_in[4], ps10_in[4], ps9_in[4],  ps8_in[4], ps7_in[4],  ps6_in[4],  ps5_in[4],  ps4_in[4],  ps3_in[4],  ps2_in[4],  ps1_in[4],  ps0_in[4],  ireg_l4[47:28],LastAMB_ID,ireg_l4[23:12]};  
    ireg_l5[47:0] <= { ps11_in[5], ps10_in[5], ps9_in[5],  ps8_in[5], ps7_in[5],  ps6_in[5],  ps5_in[5],  ps4_in[5],  ps3_in[5],  ps2_in[5],  ps1_in[5],  ps0_in[5],  ireg_l5[47:28],LastAMB_ID,ireg_l5[23:12]};  
    ireg_l6[47:0] <= { ps11_in[6], ps10_in[6], ps9_in[6],  ps8_in[6], ps7_in[6],  ps6_in[6],  ps5_in[6],  ps4_in[6],  ps3_in[6],  ps2_in[6],  ps1_in[6],  ps0_in[6],  ireg_l6[47:28],LastAMB_ID,ireg_l6[23:12]};  
    ireg_l7[47:0] <= { ps11_in[7], ps10_in[7], ps9_in[7],  ps8_in[7], ps7_in[7],  ps6_in[7],  ps5_in[7],  ps4_in[7],  ps3_in[7],  ps2_in[7],  ps1_in[7],  ps0_in[7],  ireg_l7[47:28],LastAMB_ID,ireg_l7[23:12]};  
    ireg_l8[47:0] <= { ps11_in[8], ps10_in[8], ps9_in[8],  ps8_in[8], ps7_in[8],  ps6_in[8],  ps5_in[8],  ps4_in[8],  ps3_in[8],  ps2_in[8],  ps1_in[8],  ps0_in[8],  ireg_l8[47:28],LastAMB_ID,ireg_l8[23:12]};  
    ireg_l9[47:0] <= { ps11_in[9], ps10_in[9], ps9_in[9],  ps8_in[9], ps7_in[9],  ps6_in[9],  ps5_in[9],  ps4_in[9],  ps3_in[9],  ps2_in[9],  ps1_in[9],  ps0_in[9],  ireg_l9[47:28],LastAMB_ID,ireg_l9[23:12]};  

   end
   else if (( detect_cfg_hdr_2of3  & ~frm_boundary_fast)  && ( curr_state == `AMB_INIT_CONFIG ) ) begin
   //ow=1;
   // if (( ps0_in[1] !== ps0_in[0] ) && ( ps0_in[1] == ps0_in[2]) ) // failed lane is 0
    if (( ps0_in[1]  !== ps0_in[0]  ) && ( ps0_in[1]  == ps0_in[2]) ||
        ( ps1_in[1]  !== ps1_in[0]  ) && ( ps1_in[1]  == ps1_in[2]) ||
        ( ps2_in[1]  !== ps2_in[0]  ) && ( ps2_in[1]  == ps2_in[2]) ||
        ( ps3_in[1]  !== ps3_in[0]  ) && ( ps3_in[1]  == ps3_in[2]) ||
        ( ps4_in[1]  !== ps4_in[0]  ) && ( ps4_in[1]  == ps4_in[2]) ||
        ( ps5_in[1]  !== ps5_in[0]  ) && ( ps5_in[1]  == ps5_in[2]) ||
        ( ps6_in[1]  !== ps6_in[0]  ) && ( ps6_in[1]  == ps6_in[2]) ||
        ( ps7_in[1]  !== ps7_in[0]  ) && ( ps7_in[1]  == ps7_in[2]) ||
        ( ps8_in[1]  !== ps8_in[0]  ) && ( ps8_in[1]  == ps8_in[2]) ||
        ( ps9_in[1]  !== ps9_in[0]  ) && ( ps9_in[1]  == ps9_in[2]) ||
        ( ps10_in[1] !== ps10_in[0] ) && ( ps10_in[1] == ps10_in[2]) ||
        ( ps11_in[1] !== ps11_in[0] ) && ( ps11_in[1] == ps11_in[2]) 
        ) // failed lane is 0
    begin
       nb_config_reg <= ireg_l1[45:42];
       sb_config_reg <= ireg_l1[39:36];

    ireg_l0[47:0] <= { ps11_in[1], ps10_in[1], ps9_in[1],  ps8_in[1], ps7_in[1],  ps6_in[1],ps5_in[1],ps4_in[1],  ps3_in[1],  ps2_in[1], ps1_in[1],  ps0_in[1],  ireg_l0[47:36],8'h0,LastAMB_ID, ireg_l0[23:12]};  
    ireg_l1[47:0] <= { ps11_in[1], ps10_in[1], ps9_in[1],  ps8_in[1], ps7_in[1],  ps6_in[1],ps5_in[1],ps4_in[1],  ps3_in[1],  ps2_in[1], ps1_in[1],  ps0_in[1],  ireg_l1[47:36],8'h0,LastAMB_ID, ireg_l1[23:12]};  
    ireg_l2[47:0] <= { ps11_in[1], ps10_in[1], ps9_in[1],  ps8_in[1], ps7_in[1],  ps6_in[1],ps5_in[1],ps4_in[1],  ps3_in[1],  ps2_in[1], ps1_in[1],  ps0_in[1],  ireg_l2[47:36],8'h0,LastAMB_ID, ireg_l2[23:12]};  
    ireg_l3[47:0] <= { ps11_in[1], ps10_in[1], ps9_in[1],  ps8_in[1], ps7_in[1],  ps6_in[1],ps5_in[1],ps4_in[1],  ps3_in[1],  ps2_in[1], ps1_in[1],  ps0_in[1],  ireg_l3[47:36],8'h0,LastAMB_ID, ireg_l3[23:12]};  
    ireg_l4[47:0] <= { ps11_in[1], ps10_in[1], ps9_in[1],  ps8_in[1], ps7_in[1],  ps6_in[1],ps5_in[1],ps4_in[1],  ps3_in[1],  ps2_in[1], ps1_in[1],  ps0_in[1],  ireg_l4[47:36],8'h0,LastAMB_ID, ireg_l4[23:12]};  
    ireg_l5[47:0] <= { ps11_in[1], ps10_in[1], ps9_in[1],  ps8_in[1], ps7_in[1],  ps6_in[1],ps5_in[1],ps4_in[1],  ps3_in[1],  ps2_in[1], ps1_in[1],  ps0_in[1],  ireg_l5[47:36],8'h0,LastAMB_ID, ireg_l5[23:12]};  
    ireg_l6[47:0] <= { ps11_in[1], ps10_in[1], ps9_in[1],  ps8_in[1], ps7_in[1],  ps6_in[1],ps5_in[1],ps4_in[1],  ps3_in[1],  ps2_in[1], ps1_in[1],  ps0_in[1],  ireg_l6[47:36],8'h0,LastAMB_ID, ireg_l6[23:12]};  
    ireg_l7[47:0] <= { ps11_in[1], ps10_in[1], ps9_in[1],  ps8_in[1], ps7_in[1],  ps6_in[1],ps5_in[1],ps4_in[1],  ps3_in[1],  ps2_in[1], ps1_in[1],  ps0_in[1],  ireg_l7[47:36],8'h0,LastAMB_ID, ireg_l7[23:12]};  
    ireg_l8[47:0] <= { ps11_in[1], ps10_in[1], ps9_in[1],  ps8_in[1], ps7_in[1],  ps6_in[1],ps5_in[1],ps4_in[1],  ps3_in[1],  ps2_in[1], ps1_in[1],  ps0_in[1],  ireg_l8[47:36],8'h0,LastAMB_ID, ireg_l8[23:12]};  
    ireg_l9[47:0] <= { ps11_in[1], ps10_in[1], ps9_in[1],  ps8_in[1], ps7_in[1],  ps6_in[1],ps5_in[1],ps4_in[1],  ps3_in[1],  ps2_in[1], ps1_in[1],  ps0_in[1], ireg_l9[47:36],8'h0,LastAMB_ID,ireg_l9[23:12]};  
    end
    else 
    begin
       nb_config_reg <= ireg_l0[45:42];
       sb_config_reg <= ireg_l0[39:36];

    ireg_l0[47:0] <= { ps11_in[0], ps10_in[0], ps9_in[0],  ps8_in[0], ps7_in[0],  ps6_in[0],ps5_in[0],ps4_in[0],  ps3_in[0],  ps2_in[0], ps1_in[0],  ps0_in[0],  ireg_l0[47:36],8'h0,LastAMB_ID, ireg_l0[23:12]};  
    ireg_l1[47:0] <= { ps11_in[0], ps10_in[0], ps9_in[0],  ps8_in[0], ps7_in[0],  ps6_in[0],ps5_in[0],ps4_in[0],  ps3_in[0],  ps2_in[0], ps1_in[0],  ps0_in[0],  ireg_l1[47:36],8'h0,LastAMB_ID, ireg_l1[23:12]};  
    ireg_l2[47:0] <= { ps11_in[0], ps10_in[0], ps9_in[0],  ps8_in[0], ps7_in[0],  ps6_in[0],ps5_in[0],ps4_in[0],  ps3_in[0],  ps2_in[0], ps1_in[0],  ps0_in[0],  ireg_l2[47:36],8'h0,LastAMB_ID, ireg_l2[23:12]};  
    ireg_l3[47:0] <= { ps11_in[0], ps10_in[0], ps9_in[0],  ps8_in[0], ps7_in[0],  ps6_in[0],ps5_in[0],ps4_in[0],  ps3_in[0],  ps2_in[0], ps1_in[0],  ps0_in[0],  ireg_l3[47:36],8'h0,LastAMB_ID, ireg_l3[23:12]};  
    ireg_l4[47:0] <= { ps11_in[0], ps10_in[0], ps9_in[0],  ps8_in[0], ps7_in[0],  ps6_in[0],ps5_in[0],ps4_in[0],  ps3_in[0],  ps2_in[0], ps1_in[0],  ps0_in[0],  ireg_l4[47:36],8'h0,LastAMB_ID, ireg_l4[23:12]};  
    ireg_l5[47:0] <= { ps11_in[0], ps10_in[0], ps9_in[0],  ps8_in[0], ps7_in[0],  ps6_in[0],ps5_in[0],ps4_in[0],  ps3_in[0],  ps2_in[0], ps1_in[0],  ps0_in[0],  ireg_l5[47:36],8'h0,LastAMB_ID, ireg_l5[23:12]};  
    ireg_l6[47:0] <= { ps11_in[0], ps10_in[0], ps9_in[0],  ps8_in[0], ps7_in[0],  ps6_in[0],ps5_in[0],ps4_in[0],  ps3_in[0],  ps2_in[0], ps1_in[0],  ps0_in[0],  ireg_l6[47:36],8'h0,LastAMB_ID, ireg_l6[23:12]};  
    ireg_l7[47:0] <= { ps11_in[0], ps10_in[0], ps9_in[0],  ps8_in[0], ps7_in[0],  ps6_in[0],ps5_in[0],ps4_in[0],  ps3_in[0],  ps2_in[0], ps1_in[0],  ps0_in[0],  ireg_l7[47:36],8'h0,LastAMB_ID, ireg_l7[23:12]};  
    ireg_l8[47:0] <= { ps11_in[0], ps10_in[0], ps9_in[0],  ps8_in[0], ps7_in[0],  ps6_in[0],ps5_in[0],ps4_in[0],  ps3_in[0],  ps2_in[0], ps1_in[0],  ps0_in[0],  ireg_l8[47:36],8'h0,LastAMB_ID, ireg_l8[23:12]};  
    ireg_l9[47:0] <= { ps11_in[0], ps10_in[0], ps9_in[0],  ps8_in[0], ps7_in[0],  ps6_in[0],ps5_in[0],ps4_in[0],  ps3_in[0],  ps2_in[0], ps1_in[0],  ps0_in[0], ireg_l9[47:36],8'h0,LastAMB_ID,ireg_l9[23:12]};  
    end


   end
   else if ( ( detect_poll_hdr_2of3) && ( curr_state == `AMB_INIT_POLL ) ) begin
   ow=1;
   tsid <= tsid + 4'h1;

   // if (( ps0_in[1] !== ps0_in[0] ) && ( ps0_in[1] == ps0_in[2]) ) // failed lane is 0
    if (( ps0_in[1]  !== ps0_in[0]  ) && ( ps0_in[1]  == ps0_in[2]) ||
        ( ps1_in[1]  !== ps1_in[0]  ) && ( ps1_in[1]  == ps1_in[2]) ||
        ( ps2_in[1]  !== ps2_in[0]  ) && ( ps2_in[1]  == ps2_in[2]) ||
        ( ps3_in[1]  !== ps3_in[0]  ) && ( ps3_in[1]  == ps3_in[2]) ||
        ( ps4_in[1]  !== ps4_in[0]  ) && ( ps4_in[1]  == ps4_in[2]) ||
        ( ps5_in[1]  !== ps5_in[0]  ) && ( ps5_in[1]  == ps5_in[2]) ||
        ( ps6_in[1]  !== ps6_in[0]  ) && ( ps6_in[1]  == ps6_in[2]) ||
        ( ps7_in[1]  !== ps7_in[0]  ) && ( ps7_in[1]  == ps7_in[2]) ||
        ( ps8_in[1]  !== ps8_in[0]  ) && ( ps8_in[1]  == ps8_in[2]) ||
        ( ps9_in[1]  !== ps9_in[0]  ) && ( ps9_in[1]  == ps9_in[2]) ||
        ( ps10_in[1] !== ps10_in[0] ) && ( ps10_in[1] == ps10_in[2]) ||
        ( ps11_in[1] !== ps11_in[0] ) && ( ps11_in[1] == ps11_in[2]) 
        ) // failed lane is 0
    begin
    ireg_l0[47:0] <= { ps11_in[1], ps10_in[1], ps9_in[1],  ps8_in[1], ps7_in[1], ps6_in[1],ps5_in[1],ps4_in[1],ps3_in[1],ps2_in[1],ps1_in[1],ps0_in[1],  2'h0, nb_width_capability,1'h0,tsid, ireg_l0[35:12]};  
    ireg_l1[47:0] <= { ps11_in[1], ps10_in[1], ps9_in[1],  ps8_in[1], ps7_in[1], ps6_in[1],ps5_in[1],ps4_in[1],ps3_in[1],ps2_in[1],ps1_in[1],ps0_in[1],  2'h0, nb_width_capability,1'h0,tsid ,ireg_l1[35:12]};  
    ireg_l2[47:0] <= { ps11_in[1], ps10_in[1], ps9_in[1],  ps8_in[1], ps7_in[1], ps6_in[1],ps5_in[1],ps4_in[1],ps3_in[1],ps2_in[1],ps1_in[1],ps0_in[1],  2'h0, nb_width_capability,1'h0,tsid, ireg_l2[35:12]};  
    ireg_l3[47:0] <= { ps11_in[1], ps10_in[1], ps9_in[1],  ps8_in[1], ps7_in[1], ps6_in[1],ps5_in[1],ps4_in[1],ps3_in[1],ps2_in[1],ps1_in[1],ps0_in[1],  2'h0, nb_width_capability,1'h0,tsid, ireg_l3[35:12]};  
    ireg_l4[47:0] <= { ps11_in[1], ps10_in[1], ps9_in[1],  ps8_in[1], ps7_in[1], ps6_in[1],ps5_in[1],ps4_in[1],ps3_in[1],ps2_in[1],ps1_in[1],ps0_in[1],  2'h0, nb_width_capability,1'h0,tsid, ireg_l4[35:12]};  
    ireg_l5[47:0] <= { ps11_in[1], ps10_in[1], ps9_in[1],  ps8_in[1], ps7_in[1], ps6_in[1],ps5_in[1],ps4_in[1],ps3_in[1],ps2_in[1],ps1_in[1],ps0_in[1],  2'h0, nb_width_capability,1'h0 ,tsid, ireg_l5[35:12]};  
    ireg_l6[47:0] <= { ps11_in[1], ps10_in[1], ps9_in[1],  ps8_in[1], ps7_in[1], ps6_in[1],ps5_in[1],ps4_in[1],ps3_in[1],ps2_in[1],ps1_in[1],ps0_in[1],  2'h0, nb_width_capability,1'h0,tsid, ireg_l6[35:12]};  
    ireg_l7[47:0] <= { ps11_in[1], ps10_in[1], ps9_in[1],  ps8_in[1], ps7_in[1], ps6_in[1],ps5_in[1],ps4_in[1],ps3_in[1],ps2_in[1],ps1_in[1],ps0_in[1],  2'h0, nb_width_capability,1'h0 ,tsid, ireg_l7[35:12]};  
    ireg_l8[47:0] <= { ps11_in[1], ps10_in[1], ps9_in[1],  ps8_in[1], ps7_in[1], ps6_in[1],ps5_in[1],ps4_in[1],ps3_in[1],ps2_in[1],ps1_in[1],ps0_in[1],  2'h0, nb_width_capability,1'h0,tsid, ireg_l8[35:12]};  
    ireg_l9[47:0] <= { ps11_in[1], ps10_in[1],ps9_in[1],ps8_in[1],ps7_in[1],ps6_in[1],ps5_in[1],ps4_in[1],ps3_in[1],ps2_in[1],ps1_in[1],ps0_in[9],2'h0, nb_width_capability,1'h0 ,tsid, ireg_l9[35:12]};  
   end else begin
    ireg_l0[47:0] <= { ps11_in[0], ps10_in[0], ps9_in[0],  ps8_in[0], ps7_in[0], ps6_in[0],ps5_in[0],ps4_in[0],ps3_in[0],ps2_in[0],ps1_in[0],ps0_in[0],  2'h0, nb_width_capability,1'h0,tsid, ireg_l0[35:12]};  
    ireg_l1[47:0] <= { ps11_in[0], ps10_in[0], ps9_in[0],  ps8_in[0], ps7_in[0], ps6_in[0],ps5_in[0],ps4_in[0],ps3_in[0],ps2_in[0],ps1_in[0],ps0_in[0],  2'h0, nb_width_capability,1'h0,tsid ,ireg_l1[35:12]};  
    ireg_l2[47:0] <= { ps11_in[0], ps10_in[0], ps9_in[0],  ps8_in[0], ps7_in[0], ps6_in[0],ps5_in[0],ps4_in[0],ps3_in[0],ps2_in[0],ps1_in[0],ps0_in[0],  2'h0, nb_width_capability,1'h0,tsid, ireg_l2[35:12]};  
    ireg_l3[47:0] <= { ps11_in[0], ps10_in[0], ps9_in[0],  ps8_in[0], ps7_in[0], ps6_in[0],ps5_in[0],ps4_in[0],ps3_in[0],ps2_in[0],ps1_in[0],ps0_in[0],  2'h0, nb_width_capability,1'h0,tsid, ireg_l3[35:12]};  
    ireg_l4[47:0] <= { ps11_in[0], ps10_in[0], ps9_in[0],  ps8_in[0], ps7_in[0], ps6_in[0],ps5_in[0],ps4_in[0],ps3_in[0],ps2_in[0],ps1_in[0],ps0_in[0],  2'h0, nb_width_capability,1'h0,tsid, ireg_l4[35:12]};  
    ireg_l5[47:0] <= { ps11_in[0], ps10_in[0], ps9_in[0],  ps8_in[0], ps7_in[0], ps6_in[0],ps5_in[0],ps4_in[0],ps3_in[0],ps2_in[0],ps1_in[0],ps0_in[0],  2'h0, nb_width_capability,1'h0 ,tsid, ireg_l5[35:12]};  
    ireg_l6[47:0] <= { ps11_in[0], ps10_in[0], ps9_in[0],  ps8_in[0], ps7_in[0], ps6_in[0],ps5_in[0],ps4_in[0],ps3_in[0],ps2_in[0],ps1_in[0],ps0_in[0],  2'h0, nb_width_capability,1'h0,tsid, ireg_l6[35:12]};  
    ireg_l7[47:0] <= { ps11_in[0], ps10_in[0], ps9_in[0],  ps8_in[0], ps7_in[0], ps6_in[0],ps5_in[0],ps4_in[0],ps3_in[0],ps2_in[0],ps1_in[0],ps0_in[0],  2'h0, nb_width_capability,1'h0 ,tsid, ireg_l7[35:12]};  
    ireg_l8[47:0] <= { ps11_in[0], ps10_in[0], ps9_in[0],  ps8_in[0], ps7_in[0], ps6_in[0],ps5_in[0],ps4_in[0],ps3_in[0],ps2_in[0],ps1_in[0],ps0_in[0],  2'h0, nb_width_capability,1'h0,tsid, ireg_l8[35:12]};  
    ireg_l9[47:0] <= { ps11_in[0], ps10_in[0],ps9_in[0],ps8_in[0],ps7_in[0],ps6_in[0],ps5_in[0],ps4_in[0],ps3_in[0],ps2_in[0],ps1_in[0],ps0_in[9],2'h0, nb_width_capability,1'h0 ,tsid, ireg_l9[35:12]};  
   end

   end
   else if ( curr_state == `AMB_INIT_CONFIG ) 
   begin
    ts3_ow =1;
   // if (( ps0_in[1] !== ps0_in[0] ) && ( ps0_in[1] == ps0_in[2]) ) // failed lane is 0
    if (( ps0_in[1]  !== ps0_in[0]  ) && ( ps0_in[1]  == ps0_in[2]) ||
        ( ps1_in[1]  !== ps1_in[0]  ) && ( ps1_in[1]  == ps1_in[2]) ||
        ( ps2_in[1]  !== ps2_in[0]  ) && ( ps2_in[1]  == ps2_in[2]) ||
        ( ps3_in[1]  !== ps3_in[0]  ) && ( ps3_in[1]  == ps3_in[2]) ||
        ( ps4_in[1]  !== ps4_in[0]  ) && ( ps4_in[1]  == ps4_in[2]) ||
        ( ps5_in[1]  !== ps5_in[0]  ) && ( ps5_in[1]  == ps5_in[2]) ||
        ( ps6_in[1]  !== ps6_in[0]  ) && ( ps6_in[1]  == ps6_in[2]) ||
        ( ps7_in[1]  !== ps7_in[0]  ) && ( ps7_in[1]  == ps7_in[2]) ||
        ( ps8_in[1]  !== ps8_in[0]  ) && ( ps8_in[1]  == ps8_in[2]) ||
        ( ps9_in[1]  !== ps9_in[0]  ) && ( ps9_in[1]  == ps9_in[2]) ||
        ( ps10_in[1] !== ps10_in[0] ) && ( ps10_in[1] == ps10_in[2]) ||
        ( ps11_in[1] !== ps11_in[0] ) && ( ps11_in[1] == ps11_in[2]) 
        ) // failed lane is 0
    begin
    ireg_l0[47:0] <= { ps11_in[1],ps10_in[1],ps9_in[1],ps8_in[1],ps7_in[1],ps6_in[1],ps5_in[1],ps4_in[1],ps3_in[1],ps2_in[1],ps1_in[1],ps0_in[1],ireg_l0[47:12]};  
    ireg_l1[47:0] <= { ps11_in[1],ps10_in[1],ps9_in[1],ps8_in[1],ps7_in[1],ps6_in[1],ps5_in[1],ps4_in[1],ps3_in[1],ps2_in[1],ps1_in[1],ps0_in[1],ireg_l1[47:12]};  
    ireg_l2[47:0] <= { ps11_in[1],ps10_in[1],ps9_in[1],ps8_in[1],ps7_in[1],ps6_in[1],ps5_in[1],ps4_in[1],ps3_in[1],ps2_in[1],ps1_in[1],ps0_in[1],ireg_l2[47:12]};  
    ireg_l3[47:0] <= { ps11_in[1],ps10_in[1],ps9_in[1],ps8_in[1],ps7_in[1],ps6_in[1],ps5_in[1],ps4_in[1],ps3_in[1],ps2_in[1],ps1_in[1],ps0_in[1],ireg_l3[47:12]};  
    ireg_l4[47:0] <= { ps11_in[1],ps10_in[1],ps9_in[1],ps8_in[1],ps7_in[1],ps6_in[1],ps5_in[1],ps4_in[1],ps3_in[1],ps2_in[1],ps1_in[1],ps0_in[1],ireg_l4[47:12]};  
    ireg_l5[47:0] <= { ps11_in[1],ps10_in[1],ps9_in[1],ps8_in[1],ps7_in[1],ps6_in[1],ps5_in[1],ps4_in[1],ps3_in[1],ps2_in[1],ps1_in[1],ps0_in[1],ireg_l5[47:12]};  
    ireg_l6[47:0] <= { ps11_in[1],ps10_in[1],ps9_in[1],ps8_in[1],ps7_in[1],ps6_in[1],ps5_in[1],ps4_in[1],ps3_in[1],ps2_in[1],ps1_in[1],ps0_in[1],ireg_l6[47:12]};  
    ireg_l7[47:0] <= { ps11_in[1],ps10_in[1],ps9_in[1],ps8_in[1],ps7_in[1],ps6_in[1],ps5_in[1],ps4_in[1],ps3_in[1],ps2_in[1],ps1_in[1],ps0_in[1],ireg_l7[47:12]};  
    ireg_l8[47:0] <= { ps11_in[1],ps10_in[1],ps9_in[1],ps8_in[1],ps7_in[1],ps6_in[1],ps5_in[1],ps4_in[1],ps3_in[1],ps2_in[1],ps1_in[1],ps0_in[1],ireg_l8[47:12]};  
    ireg_l9[47:0] <= { ps11_in[1],ps10_in[1],ps9_in[1],ps8_in[1],ps7_in[1],ps6_in[1],ps5_in[1],ps4_in[1],ps3_in[1],ps2_in[1],ps1_in[1],ps0_in[1],ireg_l9[47:12]};  
    end
    else
    begin

    ireg_l0[47:0] <= { ps11_in[0],ps10_in[0],ps9_in[0],ps8_in[0],ps7_in[0],ps6_in[0],ps5_in[0],ps4_in[0],ps3_in[0],ps2_in[0],ps1_in[0],ps0_in[0],ireg_l0[47:12]};  
    ireg_l1[47:0] <= { ps11_in[0],ps10_in[0],ps9_in[0],ps8_in[0],ps7_in[0],ps6_in[0],ps5_in[0],ps4_in[0],ps3_in[0],ps2_in[0],ps1_in[0],ps0_in[0],ireg_l1[47:12]};  
    ireg_l2[47:0] <= { ps11_in[0],ps10_in[0],ps9_in[0],ps8_in[0],ps7_in[0],ps6_in[0],ps5_in[0],ps4_in[0],ps3_in[0],ps2_in[0],ps1_in[0],ps0_in[0],ireg_l2[47:12]};  
    ireg_l3[47:0] <= { ps11_in[0],ps10_in[0],ps9_in[0],ps8_in[0],ps7_in[0],ps6_in[0],ps5_in[0],ps4_in[0],ps3_in[0],ps2_in[0],ps1_in[0],ps0_in[0],ireg_l3[47:12]};  
    ireg_l4[47:0] <= { ps11_in[0],ps10_in[0],ps9_in[0],ps8_in[0],ps7_in[0],ps6_in[0],ps5_in[0],ps4_in[0],ps3_in[0],ps2_in[0],ps1_in[0],ps0_in[0],ireg_l4[47:12]};  
    ireg_l5[47:0] <= { ps11_in[0],ps10_in[0],ps9_in[0],ps8_in[0],ps7_in[0],ps6_in[0],ps5_in[0],ps4_in[0],ps3_in[0],ps2_in[0],ps1_in[0],ps0_in[0],ireg_l5[47:12]};  
    ireg_l6[47:0] <= { ps11_in[0],ps10_in[0],ps9_in[0],ps8_in[0],ps7_in[0],ps6_in[0],ps5_in[0],ps4_in[0],ps3_in[0],ps2_in[0],ps1_in[0],ps0_in[0],ireg_l6[47:12]};  
    ireg_l7[47:0] <= { ps11_in[0],ps10_in[0],ps9_in[0],ps8_in[0],ps7_in[0],ps6_in[0],ps5_in[0],ps4_in[0],ps3_in[0],ps2_in[0],ps1_in[0],ps0_in[0],ireg_l7[47:12]};  
    ireg_l8[47:0] <= { ps11_in[0],ps10_in[0],ps9_in[0],ps8_in[0],ps7_in[0],ps6_in[0],ps5_in[0],ps4_in[0],ps3_in[0],ps2_in[0],ps1_in[0],ps0_in[0],ireg_l8[47:12]};  
    ireg_l9[47:0] <= { ps11_in[0],ps10_in[0],ps9_in[0],ps8_in[0],ps7_in[0],ps6_in[0],ps5_in[0],ps4_in[0],ps3_in[0],ps2_in[0],ps1_in[0],ps0_in[0],ireg_l9[47:12]};  
    end

   end
   else if ( curr_state == `AMB_INIT_TEST  ) begin

    ts3_ow=0;
   ow=0;
    ireg_l0[47:0] <= { ps11_in[0], ps10_in[0], ps9_in[0],  ps8_in[0], ps7_in[0],  ps6_in[0],ps5_in[0],ps4_in[0],  ps3_in[0],  ps2_in[0],  ps1_in[0],  ps0_in[0],  ireg_l0[47:12]};  
    ireg_l1[47:0] <= { ps11_in[1], ps10_in[1], ps9_in[1],  ps8_in[1], ps7_in[1],  ps6_in[1], ps5_in[1],  ps4_in[1],  ps3_in[1],  ps2_in[1],  ps1_in[1],  ps0_in[1],  ireg_l1[47:12]};  
    ireg_l2[47:0] <= { ps11_in[2], ps10_in[2], ps9_in[2],  ps8_in[2], ps7_in[2],  ps6_in[2],  ps5_in[2],  ps4_in[2],  ps3_in[2],  ps2_in[2],  ps1_in[2],  ps0_in[2],  ireg_l2[47:12]};  
    ireg_l3[47:0] <= { ps11_in[3], ps10_in[3], ps9_in[3],  ps8_in[3], ps7_in[3],  ps6_in[3],  ps5_in[3],  ps4_in[3],  ps3_in[3],  ps2_in[3],  ps1_in[3],  ps0_in[3],  ireg_l3[47:12]};  
    ireg_l4[47:0] <= { ps11_in[4], ps10_in[4], ps9_in[4],  ps8_in[4], ps7_in[4],  ps6_in[4],  ps5_in[4],  ps4_in[4],  ps3_in[4],  ps2_in[4],  ps1_in[4],  ps0_in[4],  ireg_l4[47:12]};  
    ireg_l5[47:0] <= { ps11_in[5], ps10_in[5], ps9_in[5],  ps8_in[5], ps7_in[5],  ps6_in[5],  ps5_in[5],  ps4_in[5],  ps3_in[5],  ps2_in[5],  ps1_in[5],  ps0_in[5],  ireg_l5[47:12]};  
    ireg_l6[47:0] <= { ps11_in[6], ps10_in[6], ps9_in[6],  ps8_in[6], ps7_in[6],  ps6_in[6],  ps5_in[6],  ps4_in[6],  ps3_in[6],  ps2_in[6],  ps1_in[6],  ps0_in[6],  ireg_l6[47:12]};  
    ireg_l7[47:0] <= { ps11_in[7], ps10_in[7], ps9_in[7],  ps8_in[7], ps7_in[7],  ps6_in[7],  ps5_in[7],  ps4_in[7],  ps3_in[7],  ps2_in[7],  ps1_in[7],  ps0_in[7],  ireg_l7[47:12]};  
    ireg_l8[47:0] <= { ps11_in[8], ps10_in[8], ps9_in[8],  ps8_in[8], ps7_in[8],  ps6_in[8],  ps5_in[8],  ps4_in[8],  ps3_in[8],  ps2_in[8],  ps1_in[8],  ps0_in[8],  ireg_l8[47:12]};  
    ireg_l9[47:0] <= { ps11_in[9], ps10_in[9], ps9_in[9],  ps8_in[9], ps7_in[9],  ps6_in[9],  ps5_in[9],  ps4_in[9],  ps3_in[9],  ps2_in[9],  ps1_in[9],  ps0_in[9],  ireg_l9[47:12]};  

   end else begin

    ts3_ow=0;
    ow=0;

    if (( ps0_in[1]  !== ps0_in[0]  ) && ( ps0_in[1]  == ps0_in[2]) ||
        ( ps1_in[1]  !== ps1_in[0]  ) && ( ps1_in[1]  == ps1_in[2]) ||
        ( ps2_in[1]  !== ps2_in[0]  ) && ( ps2_in[1]  == ps2_in[2]) ||
        ( ps3_in[1]  !== ps3_in[0]  ) && ( ps3_in[1]  == ps3_in[2]) ||
        ( ps4_in[1]  !== ps4_in[0]  ) && ( ps4_in[1]  == ps4_in[2]) ||
        ( ps5_in[1]  !== ps5_in[0]  ) && ( ps5_in[1]  == ps5_in[2]) ||
        ( ps6_in[1]  !== ps6_in[0]  ) && ( ps6_in[1]  == ps6_in[2]) ||
        ( ps7_in[1]  !== ps7_in[0]  ) && ( ps7_in[1]  == ps7_in[2]) ||
        ( ps8_in[1]  !== ps8_in[0]  ) && ( ps8_in[1]  == ps8_in[2]) ||
        ( ps9_in[1]  !== ps9_in[0]  ) && ( ps9_in[1]  == ps9_in[2]) ||
        ( ps10_in[1] !== ps10_in[0] ) && ( ps10_in[1] == ps10_in[2]) ||
        ( ps11_in[1] !== ps11_in[0] ) && ( ps11_in[1] == ps11_in[2]) 
        ) // failed lane is 0
    begin
    ireg_l0[47:0] <= { ps11_in[1],ps10_in[1],ps9_in[1],ps8_in[1],ps7_in[1],ps6_in[1],ps5_in[1],ps4_in[1],ps3_in[1],ps2_in[1],ps1_in[1],ps0_in[1],ireg_l0[47:12]};  
    ireg_l1[47:0] <= { ps11_in[1],ps10_in[1],ps9_in[1],ps8_in[1],ps7_in[1],ps6_in[1],ps5_in[1],ps4_in[1],ps3_in[1],ps2_in[1],ps1_in[1],ps0_in[1],ireg_l1[47:12]};  
    ireg_l2[47:0] <= { ps11_in[1],ps10_in[1],ps9_in[1],ps8_in[1],ps7_in[1],ps6_in[1],ps5_in[1],ps4_in[1],ps3_in[1],ps2_in[1],ps1_in[1],ps0_in[1],ireg_l2[47:12]};  
    ireg_l3[47:0] <= { ps11_in[1],ps10_in[1],ps9_in[1],ps8_in[1],ps7_in[1],ps6_in[1],ps5_in[1],ps4_in[1],ps3_in[1],ps2_in[1],ps1_in[1],ps0_in[1],ireg_l3[47:12]};  
    ireg_l4[47:0] <= { ps11_in[1],ps10_in[1],ps9_in[1],ps8_in[1],ps7_in[1],ps6_in[1],ps5_in[1],ps4_in[1],ps3_in[1],ps2_in[1],ps1_in[1],ps0_in[1],ireg_l4[47:12]};  
    ireg_l5[47:0] <= { ps11_in[1],ps10_in[1],ps9_in[1],ps8_in[1],ps7_in[1],ps6_in[1],ps5_in[1],ps4_in[1],ps3_in[1],ps2_in[1],ps1_in[1],ps0_in[1],ireg_l5[47:12]};  
    ireg_l6[47:0] <= { ps11_in[1],ps10_in[1],ps9_in[1],ps8_in[1],ps7_in[1],ps6_in[1],ps5_in[1],ps4_in[1],ps3_in[1],ps2_in[1],ps1_in[1],ps0_in[1],ireg_l6[47:12]};  
    ireg_l7[47:0] <= { ps11_in[1],ps10_in[1],ps9_in[1],ps8_in[1],ps7_in[1],ps6_in[1],ps5_in[1],ps4_in[1],ps3_in[1],ps2_in[1],ps1_in[1],ps0_in[1],ireg_l7[47:12]};  
    ireg_l8[47:0] <= { ps11_in[1],ps10_in[1],ps9_in[1],ps8_in[1],ps7_in[1],ps6_in[1],ps5_in[1],ps4_in[1],ps3_in[1],ps2_in[1],ps1_in[1],ps0_in[1],ireg_l8[47:12]};  
    ireg_l9[47:0] <= { ps11_in[1],ps10_in[1],ps9_in[1],ps8_in[1],ps7_in[1],ps6_in[1],ps5_in[1],ps4_in[1],ps3_in[1],ps2_in[1],ps1_in[1],ps0_in[1],ireg_l9[47:12]};  
    end
    else
    begin
    ireg_l0[47:0] <= { ps11_in[0],ps10_in[0],ps9_in[0],ps8_in[0],ps7_in[0],ps6_in[0],ps5_in[0],ps4_in[0],ps3_in[0],ps2_in[0],ps1_in[0],ps0_in[0],ireg_l0[47:12]};  
    ireg_l1[47:0] <= { ps11_in[0],ps10_in[0],ps9_in[0],ps8_in[0],ps7_in[0],ps6_in[0],ps5_in[0],ps4_in[0],ps3_in[0],ps2_in[0],ps1_in[0],ps0_in[0],ireg_l1[47:12]};  
    ireg_l2[47:0] <= { ps11_in[0],ps10_in[0],ps9_in[0],ps8_in[0],ps7_in[0],ps6_in[0],ps5_in[0],ps4_in[0],ps3_in[0],ps2_in[0],ps1_in[0],ps0_in[0],ireg_l2[47:12]};  
    ireg_l3[47:0] <= { ps11_in[0],ps10_in[0],ps9_in[0],ps8_in[0],ps7_in[0],ps6_in[0],ps5_in[0],ps4_in[0],ps3_in[0],ps2_in[0],ps1_in[0],ps0_in[0],ireg_l3[47:12]};  
    ireg_l4[47:0] <= { ps11_in[0],ps10_in[0],ps9_in[0],ps8_in[0],ps7_in[0],ps6_in[0],ps5_in[0],ps4_in[0],ps3_in[0],ps2_in[0],ps1_in[0],ps0_in[0],ireg_l4[47:12]};  
    ireg_l5[47:0] <= { ps11_in[0],ps10_in[0],ps9_in[0],ps8_in[0],ps7_in[0],ps6_in[0],ps5_in[0],ps4_in[0],ps3_in[0],ps2_in[0],ps1_in[0],ps0_in[0],ireg_l5[47:12]};  
    ireg_l6[47:0] <= { ps11_in[0],ps10_in[0],ps9_in[0],ps8_in[0],ps7_in[0],ps6_in[0],ps5_in[0],ps4_in[0],ps3_in[0],ps2_in[0],ps1_in[0],ps0_in[0],ireg_l6[47:12]};  
    ireg_l7[47:0] <= { ps11_in[0],ps10_in[0],ps9_in[0],ps8_in[0],ps7_in[0],ps6_in[0],ps5_in[0],ps4_in[0],ps3_in[0],ps2_in[0],ps1_in[0],ps0_in[0],ireg_l7[47:12]};  
    ireg_l8[47:0] <= { ps11_in[0],ps10_in[0],ps9_in[0],ps8_in[0],ps7_in[0],ps6_in[0],ps5_in[0],ps4_in[0],ps3_in[0],ps2_in[0],ps1_in[0],ps0_in[0],ireg_l8[47:12]};  
    ireg_l9[47:0] <= { ps11_in[0],ps10_in[0],ps9_in[0],ps8_in[0],ps7_in[0],ps6_in[0],ps5_in[0],ps4_in[0],ps3_in[0],ps2_in[0],ps1_in[0],ps0_in[0],ireg_l9[47:12]};  
    end

   end


end

end


initial begin
ts3_ireg = {12'h3fe,36'h0};
ts3_pattern_state=0;
ts3_pattern = 12'h3fe;
end

always@(negedge frm_boundary_fast ) if ( curr_state == `AMB_INIT_CONFIG ) 
begin
 case ( ts3_pattern_state )
  3'h0: begin
          ts3_pattern <= {8'h0,LastAMB_ID};
          ts3_pattern_state <= 3'h1;
        end
  3'h1: begin
          ts3_pattern_state <= 3'h2;
        end
  3'h2: begin
          ts3_pattern <= {2'b01, ps3_in[1], ps2_in[1],ps1_in[1],ps0_in[1],  ps6_in[0],2'b00,ps9_in[1], ps8_in[1],ps7_in[1],ps6_in[1]};
          ts3_pattern_state <= 3'h3;
        end
  3'h3: begin
          ts3_pattern <= 12'haaa;
          ts3_pattern_state <= 3'h4;
        end
  3'h4: begin
          ts3_pattern <= 12'haaa;
          ts3_pattern_state <= 3'h5;
        end
  3'h5: begin
          ts3_pattern <= 12'haaa;
          ts3_pattern_state <= 3'h6;
        end
  3'h6: begin
          ts3_pattern <= 12'h3fe;
          ts3_pattern_state <= 3'h0;
        end
 endcase

end




assign pn0_out_tmp = (enter_calibrate_state ) ? 14'h3fff :
                     ( sb2nbmap_reg == 3'h0 ) ? {ireg_l3[0],ireg_l2[0],ireg_l1[0],ireg_l0[0],ireg_l4[0],ireg_l3[0],ireg_l2[0],ireg_l1[0],  ireg_l0[0], ireg_l4[0],ireg_l3[0],ireg_l2[0],ireg_l1[0],ireg_l0[0]} :
                  ( sb2nbmap_reg == 3'h1 ) ? {ireg_l8[0],ireg_l7[0],ireg_l6[0],ireg_l5[0],ireg_l9[0],ireg_l8[0],ireg_l7[0],ireg_l6[0], ireg_l5[0], ireg_l9[0],ireg_l8[0],ireg_l7[0],ireg_l6[0],ireg_l5[0]}  :
                                         {ireg_l3[0],ireg_l2[0],ireg_l1[0],ireg_l0[0],ireg_l4[0],ireg_l3[0],ireg_l2[0],ireg_l1[0],  ireg_l0[0],  ireg_l4[0],ireg_l3[0],ireg_l2[0],ireg_l1[0],ireg_l0[0]};

assign pn1_out_tmp = (enter_calibrate_state ) ? 14'h3fff :
                    ( sb2nbmap_reg == 3'h0 ) ? {ireg_l3[1],ireg_l2[1],ireg_l1[1],ireg_l0[1],ireg_l4[1],ireg_l3[1],ireg_l2[1],ireg_l1[1],  ireg_l0[1],  ireg_l4[1],ireg_l3[1],ireg_l2[1],ireg_l1[1],ireg_l0[1]} :
                  ( sb2nbmap_reg == 3'h1 ) ? {ireg_l8[1],ireg_l7[1],ireg_l6[1],ireg_l5[1],ireg_l9[1],ireg_l8[1],ireg_l7[1],ireg_l6[1], ireg_l5[1], ireg_l9[1],ireg_l8[1],ireg_l7[1],ireg_l6[1],ireg_l5[1]}  :
                                         {ireg_l3[1],ireg_l2[1],ireg_l1[1],ireg_l0[1],ireg_l4[1],ireg_l3[1],ireg_l2[1],ireg_l1[1],  ireg_l0[1],  ireg_l4[1],ireg_l3[1],ireg_l2[1],ireg_l1[1],ireg_l0[1]};

assign pn2_out_tmp = (enter_calibrate_state ) ? 14'h3fff :
                    ( sb2nbmap_reg == 3'h0 ) ? {ireg_l3[2],ireg_l2[2],ireg_l1[2],ireg_l0[2],ireg_l4[2],ireg_l3[2],ireg_l2[2],ireg_l1[2],  ireg_l0[2],  ireg_l4[2],ireg_l3[2],ireg_l2[2],ireg_l1[2],ireg_l0[2]} :
                  ( sb2nbmap_reg == 3'h1 ) ? {ireg_l8[2],ireg_l7[2],ireg_l6[2],ireg_l5[2],ireg_l9[2],ireg_l8[2],ireg_l7[2],ireg_l6[2], ireg_l5[2], ireg_l9[2],ireg_l8[2],ireg_l7[2],ireg_l6[2],ireg_l5[2]}  :
                                         {ireg_l3[2],ireg_l2[2],ireg_l1[2],ireg_l0[2],ireg_l4[2],ireg_l3[2],ireg_l2[2],ireg_l1[2],  ireg_l0[2],  ireg_l4[2],ireg_l3[2],ireg_l2[2],ireg_l1[2],ireg_l0[2]};

assign pn3_out_tmp = (enter_calibrate_state ) ? 14'h3fff :
                     ( sb2nbmap_reg == 3'h0 ) ? {ireg_l3[3],ireg_l2[3],ireg_l1[3],ireg_l0[3],ireg_l4[3],ireg_l3[3],ireg_l2[3],ireg_l1[3],  ireg_l0[3],  ireg_l4[3],ireg_l3[3],ireg_l2[3],ireg_l1[3],ireg_l0[3]} :
                  ( sb2nbmap_reg == 3'h1 ) ? {ireg_l8[3],ireg_l7[3],ireg_l6[3],ireg_l5[3],ireg_l9[3],ireg_l8[3],ireg_l7[3],ireg_l6[3], ireg_l5[3], ireg_l9[3],ireg_l8[3],ireg_l7[3],ireg_l6[3],ireg_l5[3]}  :
                                         {ireg_l3[3],ireg_l2[3],ireg_l1[3],ireg_l0[3],ireg_l4[3],ireg_l3[3],ireg_l2[3],ireg_l1[3],  ireg_l0[3],  ireg_l4[3],ireg_l3[3],ireg_l2[3],ireg_l1[3],ireg_l0[3]};

assign pn4_out_tmp =  (enter_calibrate_state ) ? 14'h3fff :
                    ( sb2nbmap_reg == 3'h0 ) ? {ireg_l3[4],ireg_l2[4],ireg_l1[4],ireg_l0[4],ireg_l4[4],ireg_l3[4],ireg_l2[4],ireg_l1[4],  ireg_l0[4],  ireg_l4[4],ireg_l3[4],ireg_l2[4],ireg_l1[4],ireg_l0[4]} :
                  ( sb2nbmap_reg == 3'h1 ) ? {ireg_l8[4],ireg_l7[4],ireg_l6[4],ireg_l5[4],ireg_l9[4],ireg_l8[4],ireg_l7[4],ireg_l6[4], ireg_l5[4], ireg_l9[4],ireg_l8[4],ireg_l7[4],ireg_l6[4],ireg_l5[4]}  :
                                         {ireg_l3[4],ireg_l2[4],ireg_l1[4],ireg_l0[4],ireg_l4[4],ireg_l3[4],ireg_l2[4],ireg_l1[4],  ireg_l0[4],  ireg_l4[4],ireg_l3[4],ireg_l2[4],ireg_l1[4],ireg_l0[4]};

assign pn5_out_tmp = (enter_calibrate_state ) ? 14'h3fff :
                      ( sb2nbmap_reg == 3'h0 ) ? {ireg_l3[5],ireg_l2[5],ireg_l1[5],ireg_l0[5],ireg_l4[5],ireg_l3[5],ireg_l2[5],ireg_l1[5],  ireg_l0[5],  ireg_l4[5],ireg_l3[5],ireg_l2[5],ireg_l1[5],ireg_l0[5]} :
                  ( sb2nbmap_reg == 3'h1 ) ? {ireg_l8[5],ireg_l7[5],ireg_l6[5],ireg_l5[5],ireg_l9[5],ireg_l8[5],ireg_l7[5],ireg_l6[5], ireg_l5[5], ireg_l9[5],ireg_l8[5],ireg_l7[5],ireg_l6[5],ireg_l5[5]}  :
                                         {ireg_l3[5],ireg_l2[5],ireg_l1[5],ireg_l0[5],ireg_l4[5],ireg_l3[5],ireg_l2[5],ireg_l1[5],  ireg_l0[5],  ireg_l4[5],ireg_l3[5],ireg_l2[5],ireg_l1[5],ireg_l0[5]};

assign pn6_out_tmp = (enter_calibrate_state ) ? 14'h3fff :
                     ( sb2nbmap_reg == 3'h0 ) ? {ireg_l3[6],ireg_l2[6],ireg_l1[6],ireg_l0[6],ireg_l4[6],ireg_l3[6],ireg_l2[6],ireg_l1[6],  ireg_l0[6],  ireg_l4[6],ireg_l3[6],ireg_l2[6],ireg_l1[6],ireg_l0[6]} :
                  ( sb2nbmap_reg == 3'h1 ) ? {ireg_l8[6],ireg_l7[6],ireg_l6[6],ireg_l5[6],ireg_l9[6],ireg_l8[6],ireg_l7[6],ireg_l6[6], ireg_l5[6], ireg_l9[6],ireg_l8[6],ireg_l7[6],ireg_l6[6],ireg_l5[6]}  :
                                         {ireg_l3[6],ireg_l2[6],ireg_l1[6],ireg_l0[6],ireg_l4[6],ireg_l3[6],ireg_l2[6],ireg_l1[6],  ireg_l0[6],  ireg_l4[6],ireg_l3[6],ireg_l2[6],ireg_l1[6],ireg_l0[6]};

assign pn7_out_tmp =  (enter_calibrate_state ) ? 14'h3fff :
                      ( sb2nbmap_reg == 3'h0 ) ? {ireg_l3[7],ireg_l2[7],ireg_l1[7],ireg_l0[7],ireg_l4[7],ireg_l3[7],ireg_l2[7],ireg_l1[7],  ireg_l0[7],  ireg_l4[7],ireg_l3[7],ireg_l2[7],ireg_l1[7],ireg_l0[7]} :
                  ( sb2nbmap_reg == 3'h1 ) ? {ireg_l8[7],ireg_l7[7],ireg_l6[7],ireg_l5[7],ireg_l9[7],ireg_l8[7],ireg_l7[7],ireg_l6[7], ireg_l5[7], ireg_l9[7],ireg_l8[7],ireg_l7[7],ireg_l6[7],ireg_l5[7]}  :
                                         {ireg_l3[7],ireg_l2[7],ireg_l1[7],ireg_l0[7],ireg_l4[7],ireg_l3[7],ireg_l2[7],ireg_l1[7],  ireg_l0[7],  ireg_l4[7],ireg_l3[7],ireg_l2[7],ireg_l1[7],ireg_l0[7]};

assign pn8_out_tmp = (enter_calibrate_state ) ? 14'h3fff :
                     ( sb2nbmap_reg == 3'h0 ) ? {ireg_l3[8],ireg_l2[8],ireg_l1[8],ireg_l0[8],ireg_l4[8],ireg_l3[8],ireg_l2[8],ireg_l1[8],  ireg_l0[8],  ireg_l4[8],ireg_l3[8],ireg_l2[8],ireg_l1[8],ireg_l0[8]} :
                  ( sb2nbmap_reg == 3'h1 ) ? {ireg_l8[8],ireg_l7[8],ireg_l6[8],ireg_l5[8],ireg_l9[8],ireg_l8[8],ireg_l7[8],ireg_l6[8], ireg_l5[8], ireg_l9[8],ireg_l8[8],ireg_l7[8],ireg_l6[8],ireg_l5[8]}  :
                                         {ireg_l3[8],ireg_l2[8],ireg_l1[8],ireg_l0[8],ireg_l4[8],ireg_l3[8],ireg_l2[8],ireg_l1[8],  ireg_l0[8],  ireg_l4[8],ireg_l3[8],ireg_l2[8],ireg_l1[8],ireg_l0[8]};

assign pn9_out_tmp =  (enter_calibrate_state ) ? 14'h3fff :
                      ( sb2nbmap_reg == 3'h0 ) ? {ireg_l3[9],ireg_l2[9],ireg_l1[9],ireg_l0[9],ireg_l4[9],ireg_l3[9],ireg_l2[9],ireg_l1[9],  ireg_l0[9],  ireg_l4[9],ireg_l3[9],ireg_l2[9],ireg_l1[9],ireg_l0[9]} :
                  ( sb2nbmap_reg == 3'h1 ) ? {ireg_l8[9],ireg_l7[9],ireg_l6[9],ireg_l5[9],ireg_l9[9],ireg_l8[9],ireg_l7[9],ireg_l6[9], ireg_l5[9], ireg_l9[9],ireg_l8[9],ireg_l7[9],ireg_l6[9],ireg_l5[9]}  :
                                         {ireg_l3[9],ireg_l2[9],ireg_l1[9],ireg_l0[9],ireg_l4[9],ireg_l3[9],ireg_l2[9],ireg_l1[9],  ireg_l0[9],  ireg_l4[9],ireg_l3[9],ireg_l2[9],ireg_l1[9],ireg_l0[9]};

assign pn10_out_tmp = (enter_calibrate_state ) ? 14'h3fff :
                      ( sb2nbmap_reg == 3'h0 ) ? {ireg_l3[10],ireg_l2[10],ireg_l1[10],ireg_l0[10],ireg_l4[10],ireg_l3[10],ireg_l2[10],ireg_l1[10],  ireg_l0[10],  ireg_l4[10],ireg_l3[10],ireg_l2[10],ireg_l1[10],ireg_l0[10]} :
                  ( sb2nbmap_reg == 3'h1 ) ? {ireg_l8[10],ireg_l7[10],ireg_l6[10],ireg_l5[10],ireg_l9[10],ireg_l8[10],ireg_l7[10],ireg_l6[10], ireg_l5[10], ireg_l9[10],ireg_l8[10],ireg_l7[10],ireg_l6[10],ireg_l5[10]}  :
                                         {ireg_l3[10],ireg_l2[10],ireg_l1[10],ireg_l0[10],ireg_l4[10],ireg_l3[10],ireg_l2[10],ireg_l1[10],  ireg_l0[10],  ireg_l4[10],ireg_l3[10],ireg_l2[10],ireg_l1[10],ireg_l0[10]};

assign pn11_out_tmp = (enter_calibrate_state ) ? 14'h3fff :  
                     ( sb2nbmap_reg == 3'h0 ) ? {ireg_l3[11],ireg_l2[11],ireg_l1[11],ireg_l0[11],ireg_l4[11],ireg_l3[11],ireg_l2[11],ireg_l1[11],  ireg_l0[11],  ireg_l4[11],ireg_l3[11],ireg_l2[11],ireg_l1[11],ireg_l0[11]} :
                  ( sb2nbmap_reg == 3'h1 ) ? {ireg_l8[11],ireg_l7[11],ireg_l6[11],ireg_l5[11],ireg_l9[11],ireg_l8[11],ireg_l7[11],ireg_l6[11], ireg_l5[11], ireg_l9[11],ireg_l8[11],ireg_l7[11],ireg_l6[11],ireg_l5[11]}  :
                                         {ireg_l3[11],ireg_l2[11],ireg_l1[11],ireg_l0[11],ireg_l4[11],ireg_l3[11],ireg_l2[11],ireg_l1[11],  ireg_l0[11],  ireg_l4[11],ireg_l3[11],ireg_l2[11],ireg_l1[11],ireg_l0[11]};



shifter_p #(NB_LINK) shft0 (.signal_in ( pn0_out_tmp),
                           .signal_out (pn0_out),
                           .delay_cycles (delay_reg),
                           .clk ( frm_boundary_fast));
shifter_p #(NB_LINK) shft1 (.signal_in ( pn1_out_tmp),
                           .signal_out (pn1_out),
                           .delay_cycles (delay_reg),
                           .clk ( frm_boundary_fast));
shifter_p #(NB_LINK) shft2 (.signal_in ( pn2_out_tmp),
                           .signal_out (pn2_out),
                           .delay_cycles (delay_reg),
                           .clk (frm_boundary_fast));
shifter_p #(NB_LINK) shft3 (.signal_in ( pn3_out_tmp),
                           .signal_out (pn3_out),
                           .delay_cycles (delay_reg),
                           .clk (frm_boundary_fast));
shifter_p #(NB_LINK) shft4 (.signal_in ( pn4_out_tmp),
                           .signal_out (pn4_out),
                           .delay_cycles (delay_reg),
                           .clk ( frm_boundary_fast));
shifter_p #(NB_LINK) shft5 (.signal_in ( pn5_out_tmp),
                           .signal_out (pn5_out),
                           .delay_cycles (delay_reg),
                           .clk ( frm_boundary_fast));
shifter_p #(NB_LINK) shft6 (.signal_in ( pn6_out_tmp),
                           .signal_out (pn6_out),
                           .delay_cycles (delay_reg),
                           .clk ( frm_boundary_fast));
shifter_p #(NB_LINK) shft7 (.signal_in ( pn7_out_tmp),
                           .signal_out (pn7_out),
                           .delay_cycles (delay_reg),
                           .clk ( frm_boundary_fast));
shifter_p #(NB_LINK) shft8 (.signal_in ( pn8_out_tmp),
                           .signal_out (pn8_out),
                           .delay_cycles (delay_reg),
                           .clk ( frm_boundary_fast));
shifter_p #(NB_LINK) shft9 (.signal_in ( pn9_out_tmp),
                           .signal_out (pn9_out),
                           .delay_cycles (delay_reg),
                           .clk ( frm_boundary_fast));
shifter_p #(NB_LINK) shft10 (.signal_in ( pn10_out_tmp),
                           .signal_out (pn10_out),
                           .delay_cycles (delay_reg),
                           .clk ( frm_boundary_fast));
shifter_p #(NB_LINK) shft11 (.signal_in ( pn11_out_tmp),
                           .signal_out (pn11_out),
                           .delay_cycles (delay_reg),
                           .clk ( frm_boundary_fast));





initial begin
enter_calibrate_state = 0;
end

assign pn = ( enter_calibrate_state ) ? 14'h3fff : pn_init ; 
assign pn_bar = ( curr_state == `AMB_INIT_DISABLE ) ? pn : ~pn;


assign frm_start= frm_boundary; //|frm_align[13:0];

assign ps_in = ps;
assign ps_in_bar = ps_bar;



voting_logic mod_detect_test_hdr_2of3(.a ( (ireg_l0[23:12] == 12'hffe ) ),
                                 .b ( (ireg_l1[23:12] == 12'hffe ) ),
                                 .c ( (ireg_l2[23:12] == 12'hffe ) ),
                                 .out ( detect_test_hdr_2of3 ));

voting_logic mod_detect_cfg_hdr_2of3(.a ( (ireg_l0[23:12] == 12'h3fe ) ),
                                  .b ( (ireg_l1[23:12] == 12'h3fe ) ),
                                  .c ( (ireg_l2[23:12] == 12'h3fe ) ),
                                  .out ( detect_cfg_hdr_2of3 ));

voting_logic mod_detect_poll_hdr_2of3(.a ( (ireg_l0[23:12] == 12'h7fe ) ),
                                  .b ( (ireg_l1[23:12] == 12'h7fe ) ),
                                  .c ( (ireg_l2[23:12] == 12'h7fe ) ),
                                  .out ( detect_poll_hdr_2of3 ));


endmodule
