// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: ddr_io.v
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
`ifdef STINGRAY
`timescale 1ns/1ps
`endif // STINGRAY

module ddr_io ( 
`ifdef AXIS_FBDIMM_NO_FSR
`else
link_clk,           // link clock
`endif // AXIS_FBDIMM_NO_FSR
                dram_clk,           // dram clock
                dram_2x_clk,        // 2x dram clock
                clk_int,            //internal clock 
                command_in,         // 24bit command register
                command_rdy,        // command ready signal
                command_type,       // A. B or C
                data_in,            // dram data IN
                data_out,           // dram data OUT
                reset,              // reset
                dcalcsr,            // fbdimm register
                clear_dcalcsr31,    // to clear bit 31
                dcaladdr,           // fbdimm register
                drc,                // fbdimm register
                frm_boundary,       // frame boundary signal
                get_wbuffer_data,   // get write buffer data
                put_rbuffer_data,   // put read buffer data
                init,               // initialization signal
                cke_rank0,          // dram IO
                cke_rank1,          // dram IO
                bcs,                // dram IO
                bras,               // dram IO
                bcas,               // dram IO
                bwe,                // dram IO
                ba,                 // dram IO
                addr,               // dram IO
                dq,                 // dram IO
                dqs,                // dram IO
                bdqs,               // dram IO
                dm_rdqs,            // dram IO
                brdqs,              // dram IO
                odt,                // dram IO
                areset,             // dram IO
                term,               // dram IO
                rs,                 // dram IO
                dqs_in,             // dram IO
                ddrio_nbencode_rd,  
                drams_on_out,        // special signal
                sb_crc_error,
                ch_state
);
// parameters
parameter DS=0;

// dram interface 
output [18:0] cke_rank0,cke_rank1,bcs,bras,bcas,bwe,dqs,bdqs,dm_rdqs,brdqs,odt,areset,term;
output [2:0]  ba;
output [15:0] addr;
inout  [71:0] dq;
output        rs;
output        clear_dcalcsr31;
input         dqs_in;
input         clk_int;
input  [3:0]  ch_state;
input         sb_crc_error;

// Interface signals
input frm_boundary;
`ifdef AXIS_FBDIMM_NO_FSR
`else
input         link_clk;
`endif // AXIS_FBDIMM_NO_FSR
input         dram_clk;
input         dram_2x_clk;
input  [23:0] command_in;
input         command_rdy;
input  [1:0]  command_type;
input  [71:0] data_in;
output [71:0] data_out;
output        get_wbuffer_data;
output        put_rbuffer_data;
input         reset;
input         init;
inout [31:0]  dcalcsr,dcaladdr,drc;
output        drams_on_out;
output        ddrio_nbencode_rd;

// Internal registers/wires
reg         dram_cmd_vld;
wire [23:0] cmd_fifo_rd_data ;
wire [23:0] cmd_fifo_rd_data_bc ;
wire        cmd_fifo_full;
wire        cmd_fifo_full_bc;
wire        cmd_fifo_empty;
wire        cmd_fifo_empty_bc;
wire [23:0] command=cmd_fifo_rd_data;
wire [23:0] command_bc=cmd_fifo_rd_data_bc;
wire [23:0] write_cycle,read_cycle;
reg         write_cycle_start,read_cycle_start;
wire        dqs_cycle;
reg         dram_dqs_clk;
wire        dqs_driver =  get_wbuffer_data & dram_dqs_clk ;
reg         drams_on;
reg         stall_pipe;
reg [4:0]   debug_level;
reg         dcalcsr_complete;
reg  [18:0] cke_rank0_reg,cke_rank1_reg,bcs_reg,bdqs_reg,bras_reg,bcas_reg,bwe_reg,dqs_reg;
reg  [18:0] dm_rdqs_reg,brdqs_reg,odt_reg,term_reg,areset_reg;
reg  [2:0]  ba_reg;
reg  [15:0] addr_reg;
reg         RS,RS_pre;
reg	    first_dram_cmd;
reg         sng_channel;
reg [3:0] prev_ch_state;
reg [4:0] self_refresh_fsm_state;
reg issue_pre_all_cmd;
reg issue_auto_refresh_cmd;
reg issue_enter_self_refresh_cmd;
reg issue_exit_self_refresh_cmd;
reg [10:0] dram_clk_counter;
reg       dram_clk_counter_en;

wire [18:0]  bcs =  bcs_reg;
wire [18:0]  bras =  bras_reg;
wire [18:0]  bcas =  bcas_reg;
wire [18:0]  bwe =  bwe_reg;
wire [18:0]  dqs;
wire [18:0]  bdqs;
wire [18:0]  dm_rdqs =  dm_rdqs_reg ;
wire [18:0]  brdqs =  brdqs_reg;
wire [18:0]  odt =  odt_reg;
wire [18:0]  term =  term_reg;
wire [2:0]   ba = ba_reg;
wire [15:0]  addr = addr_reg;
wire [18:0]  areset= { 10 { init  } };
wire         dram_bl;
wire         cke_reg_1,cke_reg_delayed,dram_cmd_vld_1,dram_cmd_vld_delayed;
wire [18:0]  cke_rank0;
wire [18:0]  cke_rank1;
reg write_command;
wire write_cycle_shft;

 

// assignments

assign ddrio_nbencode_rd = read_cycle_start;
assign  cke_rank0 = cke_rank0_reg ;
assign    cke_rank1 =  cke_rank1_reg;
assign drams_on_out = drams_on;
assign dram_bl = drc[8];
assign rs = issue_pre_all_cmd | issue_auto_refresh_cmd | issue_enter_self_refresh_cmd | issue_exit_self_refresh_cmd ? RS_pre : RS ;

assign dqs[0]=  (dqs_cycle) ? dqs_driver: 1'bz;
assign dqs[1]=  (dqs_cycle) ? dqs_driver: 1'bz;
assign dqs[2]=  (dqs_cycle) ? dqs_driver: 1'bz;
assign dqs[3]=  (dqs_cycle) ? dqs_driver: 1'bz;
assign dqs[4]=  (dqs_cycle) ? dqs_driver: 1'bz;
assign dqs[5]=  (dqs_cycle) ? dqs_driver: 1'bz;
assign dqs[6]=  (dqs_cycle) ? dqs_driver: 1'bz;
assign dqs[7]=  (dqs_cycle) ? dqs_driver: 1'bz;
assign dqs[8]=  (dqs_cycle) ? dqs_driver: 1'bz;
assign dqs[9]=  (dqs_cycle) ? dqs_driver: 1'bz;
assign dqs[10]=  (dqs_cycle) ? dqs_driver: 1'bz;
assign dqs[11]=  (dqs_cycle) ? dqs_driver: 1'bz;
assign dqs[12]=  (dqs_cycle) ? dqs_driver: 1'bz;
assign dqs[13]=  (dqs_cycle) ? dqs_driver: 1'bz;
assign dqs[14]=  (dqs_cycle) ? dqs_driver: 1'bz;
assign dqs[15]=  (dqs_cycle) ? dqs_driver: 1'bz;
assign dqs[16]=  (dqs_cycle) ? dqs_driver: 1'bz;
assign dqs[17]=  (dqs_cycle) ? dqs_driver: 1'bz;
assign dqs[18]=  (dqs_cycle) ? dqs_driver: 1'bz;

assign bdqs[0] =  ( dqs_cycle ) ? ~dqs_driver : 1'bz;
assign bdqs[1] =  ( dqs_cycle ) ? ~dqs_driver : 1'bz;
assign bdqs[2] =  ( dqs_cycle ) ? ~dqs_driver : 1'bz;
assign bdqs[3] =  ( dqs_cycle ) ? ~dqs_driver : 1'bz;
assign bdqs[4] =  ( dqs_cycle ) ? ~dqs_driver : 1'bz;
assign bdqs[5] =  ( dqs_cycle ) ? ~dqs_driver : 1'bz;
assign bdqs[6] =  ( dqs_cycle ) ? ~dqs_driver : 1'bz;
assign bdqs[7] =  ( dqs_cycle ) ? ~dqs_driver : 1'bz;
assign bdqs[8] =  ( dqs_cycle ) ? ~dqs_driver : 1'bz;
assign bdqs[9] =  ( dqs_cycle ) ? ~dqs_driver : 1'bz;
assign bdqs[10] =  ( dqs_cycle ) ? ~dqs_driver : 1'bz;
assign bdqs[11] =  ( dqs_cycle ) ? ~dqs_driver : 1'bz;
assign bdqs[12] =  ( dqs_cycle ) ? ~dqs_driver : 1'bz;
assign bdqs[13] =  ( dqs_cycle ) ? ~dqs_driver : 1'bz;
assign bdqs[14] =  ( dqs_cycle ) ? ~dqs_driver : 1'bz;
assign bdqs[15] =  ( dqs_cycle ) ? ~dqs_driver : 1'bz;
assign bdqs[16] =  ( dqs_cycle ) ? ~dqs_driver : 1'bz;
assign bdqs[17] =  ( dqs_cycle ) ? ~dqs_driver : 1'bz;
assign bdqs[18] =  ( dqs_cycle ) ? ~dqs_driver : 1'bz;


assign clear_dcalcsr31 = dcalcsr_complete;


// Create a race free clock for driving dqs signals
always@(dram_clk)
begin
 if ( dram_clk )
   dram_dqs_clk <= #1 1;
  else
   dram_dqs_clk <= #1 0;
end

// Read/Write pipleline stages
dff_p #(2) wc1( .signal_in   ({write_cycle_start,read_cycle_start}),
                .signal_out  ({write_cycle[1],read_cycle[1]}),
                .clk         (dram_clk & drams_on ));
dff_p #(2) wc2( .signal_in   ({write_cycle[1],read_cycle[1]}),
                .signal_out  ({write_cycle[2],read_cycle[2]}),
                .clk         (dram_clk));
dff_p #(2) wc3( .signal_in   ({write_cycle[2],read_cycle[2]}),
                .signal_out  ({write_cycle[3],read_cycle[3]}),
                .clk         (dram_clk));
dff_p #(2) wc4( .signal_in   ({write_cycle[3],read_cycle[3]}),
                .signal_out  ({write_cycle[4],read_cycle[4]}),
                .clk         (dram_clk));
dff_p #(2) wc5( .signal_in   ({write_cycle[4],read_cycle[4]}),
                .signal_out  ({write_cycle[5],read_cycle[5]}),
                .clk         (dram_clk));
dff_p #(2) wc6( .signal_in   ({write_cycle[5],read_cycle[5]}),
                .signal_out  ({write_cycle[6],read_cycle[6]}),
                .clk         (dram_clk));
dff_p #(2) wc7( .signal_in   ({write_cycle[6],read_cycle[6]}),
                .signal_out  ({write_cycle[7],read_cycle[7]}),
                .clk         (dram_clk));
dff_p #(2) wc8( .signal_in   ({write_cycle[7],read_cycle[7]}),
                .signal_out  ({write_cycle[8],read_cycle[8]}),
                .clk         (dram_clk));
dff_p #(2) wc9( .signal_in   ({write_cycle[8],read_cycle[8]}),
                .signal_out  ({write_cycle[9],read_cycle[9]}),
                .clk         (dram_clk));
dff_p #(2) wc10( .signal_in   ({write_cycle[8],read_cycle[9]}),
                .signal_out  ({write_cycle[9],read_cycle[10]}),
                .clk         (dram_clk));
dff_p #(2) wc11( .signal_in   ({write_cycle[8],read_cycle[10]}),
                .signal_out  ({write_cycle[9],read_cycle[11]}),
                .clk         (dram_clk));
dff_p #(2) wc12( .signal_in   ({write_cycle[8],read_cycle[11]}),
                .signal_out  ({write_cycle[9],read_cycle[12]}),
                .clk         (dram_clk));
dff_p #(2) wc13( .signal_in   ({write_cycle[8],read_cycle[12]}),
                .signal_out  ({write_cycle[9],read_cycle[13]}),
                .clk         (dram_clk));
dff_p #(2) wc14( .signal_in   ({write_cycle[8],read_cycle[13]}),
                .signal_out  ({write_cycle[9],read_cycle[14]}),
                .clk         (dram_clk));
dff_p #(2) wc15( .signal_in   ({write_cycle[8],read_cycle[14]}),
                .signal_out  ({write_cycle[9],read_cycle[15]}),
                .clk         (dram_clk));
dff_p #(2) wc16( .signal_in   ({write_cycle[8],read_cycle[15]}),
                .signal_out  ({write_cycle[9],read_cycle[16]}),
                .clk         (dram_clk));

wire [9:0] delay_reg=((drc[7:4]+drc[3:0]))-10'h1;



wire write_cycle_pre = (delay_reg[7:0] == 7'h5 ) ? write_cycle[5] :
                    (delay_reg[7:0] == 7'h4 ) ? write_cycle[4] : 
                    (delay_reg[7:0] == 7'h3 ) ? write_cycle[3] : 
                    (delay_reg[7:0] == 7'h2 ) ? write_cycle[2] : 1'b0;

wire write_cycle0 = (delay_reg[7:0] == 7'h5 ) ? write_cycle[6] :
                    (delay_reg[7:0] == 7'h4 ) ? write_cycle[5] : 
                    (delay_reg[7:0] == 7'h3 ) ? write_cycle[4] : 
                    (delay_reg[7:0] == 7'h2 ) ? write_cycle[3] : 1'b0;

wire write_cycle1 = (delay_reg[7:0] == 7'h5 ) ? write_cycle[7] :
                    (delay_reg[7:0] == 7'h4 ) ? write_cycle[6] :
                    (delay_reg[7:0] == 7'h3 ) ? write_cycle[5] :
                    (delay_reg[7:0] == 7'h2 ) ? write_cycle[4] : 1'b0;

wire write_cycle2 = (delay_reg[7:0] == 7'h5 ) ? write_cycle[8] : 
                    (delay_reg[7:0] == 7'h4 ) ? write_cycle[7] :
                    (delay_reg[7:0] == 7'h3 ) ? write_cycle[6] :
                    (delay_reg[7:0] == 7'h2 ) ? write_cycle[5] : 1'b0;

wire write_cycle3 = (delay_reg[7:0] == 7'h5 ) ? write_cycle[9] : 
                    (delay_reg[7:0] == 7'h4 ) ? write_cycle[8] :
                    (delay_reg[7:0] == 7'h3 ) ? write_cycle[7] :
                    (delay_reg[7:0] == 7'h2 ) ? write_cycle[6] : 1'b0;

// Signal to get data from write fifo
assign get_wbuffer_data = ( write_cycle0 & dram_clk) |
                          ( write_cycle0 & ~dram_clk) |
                          ( write_cycle1 & dram_clk) |
                          ( write_cycle1 & ~dram_clk) | 
                          ( write_cycle2 & dram_clk  & ( sng_channel | dram_bl ) ) |
                          ( write_cycle2 & ~dram_clk & ( sng_channel | dram_bl ) ) | 
                          ( write_cycle3 & dram_clk  & ( sng_channel | dram_bl ) ) |
                          ( write_cycle3 & ~dram_clk & ( sng_channel | dram_bl ) ) ;


// Signal to put data into read fifo

reg dqs_in_shft;
reg prev_dqs_in;
reg curr_dqs_in;
reg [3:0] dqs_curr_state;
reg put_rbuffer_data_alt;
`ifdef AXIS_DDR2_MODEL
wire axis_ddr2_dram_model;
`else
reg put_rbuffer_data; // RALI
`endif // AXIS_DDR2_MODEL
reg [71:0] dq_shft;
reg dqs_prev_val;

`ifdef AXIS_DDR2_MODEL
 assign put_rbuffer_data = put_rbuffer_data_alt; // RALI
`endif // AXIS_DDR2_MODEL

initial begin
dqs_curr_state = 4'b0;
first_dram_cmd=1'b0;
`ifdef AXIS_DDR2_MODEL
`else
put_rbuffer_data=1'b0; //RALI
`endif // AXIS_DDR2_MODEL
end

always@(posedge dram_cmd_vld)
  first_dram_cmd<=1'b1;

`ifdef AXIS_DDR2_MODEL
always@(negedge dram_2x_clk) //RALI
`else
always@(posedge dram_2x_clk) //RALI
`endif // AXIS_DDR2_MODEL
begin
 dq_shft <= dq;
 case(dqs_curr_state) 
   4'h0: begin 
         dqs_prev_val<=dqs_in;
          if ( (dqs_in == 1 ) & !( get_wbuffer_data ) ) begin
            put_rbuffer_data_alt<=1;
            dqs_curr_state<=4'h1;
          end
          else
            put_rbuffer_data_alt<=0;
         end
   4'h1: begin 
           dqs_prev_val<=dqs_in;
           dqs_curr_state<=4'h2;
         end
   4'h2: begin
           dqs_curr_state<=4'h3; 
         end
   4'h3: begin
           dqs_curr_state<=4'h4; 
         end
   4'h4: begin
         if ( dqs_in == 1 )
          dqs_curr_state<=4'h1;
         else begin 
              put_rbuffer_data_alt<=0;
              dqs_curr_state<=4'h0;
          end
         end
   4'h5: begin
           dqs_curr_state<=4'h6; 
         end
   4'h6: begin
           dqs_curr_state<=4'h7; 
         end
   4'h7: begin
           dqs_curr_state<=4'h8; 
         end
   4'h8: begin
           put_rbuffer_data_alt<=0;
           dqs_curr_state<=4'h0; 
         end

 endcase

end

always@(negedge dram_2x_clk)
begin
 dqs_in_shft <= dqs_in;
end

assign dqs_cycle = ( write_cycle_pre & dram_clk ) |
                   ( write_cycle_pre & ~dram_clk ) |
                   ( write_cycle0 & dram_clk) |
                   ( write_cycle0 & ~dram_clk) |
                   ( write_cycle1 & dram_clk) |
                   ( write_cycle1 & ~dram_clk) |
                   ( write_cycle2 & dram_clk) | 
                   ( write_cycle2 & ~dram_clk  & ( sng_channel | dram_bl ) ) |
                   ( write_cycle3 & dram_clk   & ( sng_channel | dram_bl ) ) | 
                   ( write_cycle3 & ~dram_clk  & ( sng_channel | dram_bl ) );


wire [71:0]  dq = get_wbuffer_data ? data_in : 72'bz; 


reg [71:0] dq_shift_half_cycle;

initial begin
dq_shift_half_cycle = 72'h0; //RALI
if ( $test$plusargs("SNG_CHANNEL") )
  sng_channel=1;
else
  sng_channel=0;

end


`ifdef AXIS_DDR2_MODEL
assign data_out =  dq_shft; //RALI
`else
assign data_out = dq_shift_half_cycle; //RALI
`endif // AXIS_DDR2_MODEL


`ifdef AXIS_DDR2_MODEL
always@(posedge dram_2x_clk)  begin // RALI
 dq_shift_half_cycle <= dq_shft;
end
`else
       always@(negedge dram_2x_clk)  begin // RALI
        dq_shift_half_cycle <= dq_shft;
	put_rbuffer_data <= put_rbuffer_data_alt;
       end

`endif // AXIS_DDR2_MODEL

// drive DQS and strobes
always@(dram_clk or write_cycle0)
begin
  if ( write_cycle0 )
  begin
`ifdef X8
    dqs_reg[18:0] <= 19'h0;
    bdqs_reg[18:0] <= 19'h1ff;
`else
    dqs_reg[18:0] <= 19'h0;
    bdqs_reg[18:0] <= 19'h7ffff;
`endif

  end
  else begin
   if ( dram_clk ) begin
`ifdef X8
    dqs_reg[18:0] <= 19'h1ff;
    bdqs_reg[18:0] <= 19'h0;
`else
    dqs_reg[18:0] <= 19'h7ffff;
    bdqs_reg[18:0] <= 19'h0;
`endif

   end else begin
`ifdef X8
    dqs_reg[18:0] <= 19'h0;
    bdqs_reg[18:0] <= 19'h1ff;
`else
    dqs_reg[18:0] <= 19'h0;
    bdqs_reg[18:0] <= 19'h7ffff;
`endif
   end
  end 
end

// Command decoder


wire  enter_self_refresh_fsm = (( ch_state == `AMB_INIT_DISABLE ) | ( ch_state == `AMB_INIT_TRAIN )) ;

initial self_refresh_fsm_state = 1;

always@(posedge dram_clk) if ( dram_clk_counter_en )
  dram_clk_counter <= dram_clk_counter + 11'h1;
else
  dram_clk_counter <= 11'h0;

// taken from fbdimm spec oct 2004
always@(posedge dram_clk) if ( drams_on  )
begin
  case ( self_refresh_fsm_state )
   5'h1: begin
             issue_pre_all_cmd <=  1'b0;
             issue_auto_refresh_cmd <= 1'b0;
             issue_enter_self_refresh_cmd <= 1'b0;
             issue_exit_self_refresh_cmd <= 1'b0;
             if (enter_self_refresh_fsm )
               self_refresh_fsm_state <= 5'h2; 
             //if ( ch_state == `AMB_INIT_TRAIN )
             //  self_refresh_fsm_state <= 5'h2; 

             //`ifdef FBDIMM_ENABLE_SELF_REF_FSM
              `ifdef AXIS_FBDIMM_HW
              `else
              cke_rank0_reg[18:0]  <= 19'h7ffff;
              cke_rank1_reg[18:0]  <= 19'h7ffff;
              `endif
         end
   5'h2: begin self_refresh_fsm_state <= 5'h3; end
   5'h3: begin self_refresh_fsm_state <= 5'h4; end
   5'h4: begin self_refresh_fsm_state <= 5'h5; end
   5'h5: begin
              // self_refresh_fsm_state <= 5'h6; 

              dram_clk_counter_en <=1'b1;

               if ( dram_clk_counter == 11'd30 ) begin
                 self_refresh_fsm_state <= 5'h6; 
                 dram_clk_counter_en <= 1'b0;
                 `ifdef AXIS_FBDIMM_HW
                 `else
                 cke_rank0_reg[18:0]  <= 19'h7ffff;
                 cke_rank1_reg[18:0]  <= 19'h7ffff;
                 `endif
               end

              end
   5'h6: begin
              self_refresh_fsm_state <= 5'h7;
              issue_pre_all_cmd <= 1'b1;
              RS_pre<=0;
         end
   5'h7: begin
              self_refresh_fsm_state <= 5'h8;
              `ifdef STACK_DIMM
                 RS_pre<=1;
               `else
               issue_pre_all_cmd <= 1'b0;
               `endif
         end
   5'h8: begin
               self_refresh_fsm_state <= 5'h9;
               `ifdef STACK_DIMM
                  issue_pre_all_cmd <= 1'b0;
               `endif
         end
   5'h9: begin 
            RS_pre<=0;
            self_refresh_fsm_state <= 5'ha; 
         end
   5'ha: begin self_refresh_fsm_state <= 5'hb; end
   5'hb: begin 
             `ifdef FBDIMM_ENABLE_SELF_REF_FSM
               issue_auto_refresh_cmd <= 1'b1;
               self_refresh_fsm_state <= 5'hc; 
              `else
               self_refresh_fsm_state <= 5'h16; 
               `endif
         end
   5'hc: begin 

              `ifdef STACK_DIMM
                 RS_pre<=1;
               `else
                 issue_auto_refresh_cmd <= 1'b0;
               `endif
               self_refresh_fsm_state <= 5'hd; 

         end
   5'hd: begin 
              `ifdef STACK_DIMM
              issue_auto_refresh_cmd <= 1'b0;
              `endif
              RS_pre<=0;


              dram_clk_counter_en <=1'b1;

               if ( dram_clk_counter == 11'd30 ) begin
                 self_refresh_fsm_state <= 5'he; 
                 dram_clk_counter_en <= 1'b0;
               end

         end

   5'he: begin 
             `ifdef FBDIMM_ENABLE_SELF_REF_FSM
                issue_enter_self_refresh_cmd <= 1'b1;
             `endif
              self_refresh_fsm_state <= 5'hf; 
         end
   5'hf: begin 

              `ifdef STACK_DIMM
                 RS_pre<=1;
               `else
                 issue_enter_self_refresh_cmd <= 1'b0;
               `endif
                          
              self_refresh_fsm_state <= 5'h10; 
         end
   5'h10: begin 
              issue_enter_self_refresh_cmd <= 1'b0;
             self_refresh_fsm_state <= 5'h11; 
          end
   5'h11: begin 
             self_refresh_fsm_state <= 5'h12; 
          end
   5'h12: begin 
             self_refresh_fsm_state <= 5'h13; 
          end
   5'h13: begin 
               RS_pre<=1'b0;
              if ( ch_state == `AMB_INIT_TRAIN ) begin
             `ifdef FBDIMM_ENABLE_SELF_REF_FSM
                 issue_exit_self_refresh_cmd <= 1'b1;
             `endif
                 self_refresh_fsm_state <= 5'h14; 
              end
          end
   5'h14: begin 
               RS_pre<=1'b1;
               self_refresh_fsm_state <= 5'h15; 
          end
   5'h15: begin
               issue_exit_self_refresh_cmd <= 1'b0; 
               self_refresh_fsm_state <= 5'h16; 
          end
   5'h16: begin
             if ( ch_state == `AMB_INIT_LO )
                self_refresh_fsm_state <= 5'h1; 
         end
  endcase

end
else begin
 self_refresh_fsm_state <=1;
 issue_pre_all_cmd <= 1'b0;
end

always@(negedge dram_clk)
begin


        // precharge all command
     if ( issue_pre_all_cmd )
     begin
          dram_cmd_vld  <= 1'b1;
          bcs_reg[18:0]  <= 19'h0;
          bcas_reg[18:0] <= 19'h7ffff;
          bwe_reg[18:0]  <= 19'h0;
          bras_reg[18:0] <= 19'h0;
          addr_reg[15:0] <= 16'h400;
          cke_rank0_reg[18:0]  <= 19'h7ffff;
          cke_rank1_reg[18:0]  <= 19'h7ffff;
     end
     else if ( issue_auto_refresh_cmd) begin
          dram_cmd_vld  <= 1'b1;   
          bcs_reg[18:0]  <= 19'h0;
          bcas_reg[18:0] <= 19'h0;
          bwe_reg[18:0]  <= 19'h7ffff;
          bras_reg[18:0] <= 19'h0;
          cke_rank0_reg[18:0]  <= 19'h7ffff;
          cke_rank1_reg[18:0]  <= 19'h7ffff;
     end
     else if ( issue_enter_self_refresh_cmd ) begin
          dram_cmd_vld  <= 1'b1;
          bcs_reg[18:0]  <= 19'h0;
          bcas_reg[18:0] <= 19'h0;
          bras_reg[18:0] <= 19'h0;
          bwe_reg[18:0]  <= 19'h7ffff;
     end
     else if ( issue_exit_self_refresh_cmd ) begin
          dram_cmd_vld  <= 1'b1;
          bcs_reg[18:0]  <= 19'h0;
          bcas_reg[18:0] <= 19'h7ffff;
          bras_reg[18:0] <= 19'h7ffff;
          bwe_reg[18:0]  <= 19'h7ffff;

     end
     else if ( drams_on ) begin
          bcs_reg[18:0]      <= 18'h0;
          bcas_reg[18:0]     <= 19'h7ffff;
          bwe_reg[18:0]      <= 19'h7ffff;
          bras_reg[18:0]     <= 19'h7ffff;
          odt_reg[18:0]      <= 18'h0;
          write_cycle_start <= 1'b0;
          read_cycle_start  <= 1'b0;
          dram_cmd_vld      <= 1'b0;
          write_command<=0;
     end



if ( drams_on  ) begin


    if ( !cmd_fifo_empty & !sb_crc_error ) begin

      if ( command[23:0] == 24'h0 ) // NOP
      begin
         bcs_reg[18:0]  <= 19'h0;
         bcas_reg[18:0] <= 19'h7ffff;
         bwe_reg[18:0]  <= 19'h7ffff;
         bras_reg[18:0] <= 19'h7ffff;
      end
 
      if ( command[23:0] != 24'h0 ) // command is not a NOP
      begin
         // all commands have the Rank Select bit at the same position
         RS<=command[17];

         // write command
`ifdef AXIS_FBDIMM_1AMB
         if (( command[20:18] == 3'b011 )  )
`else
         if (( command[20:18] == 3'b011 ) && ( command[23:21] == DS ) )
`endif // AXIS_FBDIMM_1AMB
         begin
             stall_pipe        <= 1'b0;
             dram_cmd_vld      <= 1'b1;
             bcs_reg[18:0]      <= 19'h0;
             bcas_reg[18:0]     <= 19'h0;
             bwe_reg[18:0]      <= 19'h0;
             bras_reg[18:0]     <= 19'h7ffff;
             dm_rdqs_reg[18:0]  <= 0;
             ba_reg[2:0]        <= command[15:13];
             // For read/write, in 2GB(512MB X 4) config:
             // we use a11-a0
             addr_reg[15:0] <= {4'h0,command[11:0]};
             //addr_reg[15:0] <= {4'h0,command[11],command[9:0]};

             write_cycle_start <= 1'b1;
`ifdef AXIS_FBDIMM_HW
`else
             `PR_ALWAYS ("dram",`DBG_0,"FBDIMM: Write command sent to DRAM - Address = %h BA=%h DS=%h  RS=%h\n",addr_reg,ba_reg,command[23:21],RS);
`endif // AXIS_FBDIMM_HW

        end // write command

        // Read command
`ifdef AXIS_FBDIMM_1AMB
        if (( command[20:18] == 3'b010 )  )
`else
        if (( command[20:18] == 3'b010 ) && ( command[23:21] == DS ) )
`endif // AXIS_FBDIMM_1AMB
        begin
          read_cycle_start <= 1'b1;
          dram_cmd_vld     <= 1'b1;
          bcs_reg[18:0]     <= 19'h0;
          bcas_reg[18:0]    <= 19'h0;
          bwe_reg[18:0]     <= 19'h7ffff;
          bras_reg[18:0]    <= 19'h7ffff;
          ba_reg[2:0] <= command[15:13];

             // For read/write, in 2GB(512MB X 4) config:
             // we use a11-a0
             addr_reg[15:0] <= {4'h0,command[11:0]};

        end
        // Read command

        // precharge all command
`ifdef AXIS_FBDIMM_1AMB
        if (( ( command[20:18] == 3'b001) && ( command[12:10] == 3'b111) ) || issue_pre_all_cmd )
`else
        if (( ( command[20:18] == 3'b001) && ( command[12:10] == 3'b111) && ( command[23:21] == DS )) || issue_pre_all_cmd )
`endif // AXIS_FBDIMM_1AMB
        begin
`ifdef AXIS_FBDIMM_HW
`else
`PR_ALWAYS ("dram",`DBG_0,"FBDIMM: Precharge All command sent to DRAM\n");
`endif // AXIS_FBDIMM_HW
          dram_cmd_vld  <= 1'b1;
          bcs_reg[18:0]  <= 19'h0;
          bcas_reg[18:0] <= 19'h7ffff;
          bwe_reg[18:0]  <= 19'h0;
          bras_reg[18:0] <= 19'h0;
          addr_reg[10]  <= 1'b1;
        end
        // precharge all command

        // precharge single command
`ifdef AXIS_FBDIMM_1AMB
        if ( ( command[20:18] == 3'b001) && ( command[12:10] == 3'b110))
`else
        if ( ( command[20:18] == 3'b001) && ( command[12:10] == 3'b110) && ( command[23:21] == DS ))
`endif // AXIS_FBDIMM_1AMB
        begin
`ifdef AXIS_FBDIMM_HW
`else
	  `PR_ALWAYS ("dram",`DBG_0,"FBDIMM: Precharge Single command sent to DRAM bank = %h\n",command[16:13]);
`endif // AXIS_FBDIMM_HW
          dram_cmd_vld  <= 1'b1;
          bcs_reg[18:0]  <= 19'h0;
          bcas_reg[18:0] <= 19'h7fff;
          bwe_reg[18:0]  <= 19'h0;
          bras_reg[18:0] <= 19'h0;
          addr_reg[10]  <= 1'b0;
          ba_reg[2:0]   <= command[16:13];
        end
        // precharge signle command

        // Auto refresh command
`ifdef AXIS_FBDIMM_1AMB
        if ( ( command[20:18] == 3'b001) && ( command[12:10] == 3'b101) )
`else 
       if ( ( command[20:18] == 3'b001) && ( command[12:10] == 3'b101) && ( command[23:21] == DS ))
`endif // AXIS_FBDIMM_1AMB
        begin
`ifdef AXIS_FBDIMM_HW
`else
	  `PR_ALWAYS ("dram",`DBG_0,"FBDIMM: AutoRefresh command sent to DRAM\n");
`endif // AXIS_FBDIMM_HW
          dram_cmd_vld  <= 1'b1;
          bcs_reg[18:0]  <= 19'h0;
          bcas_reg[18:0] <= 19'h0;
          bwe_reg[18:0]  <= 19'h7ffff;
          bras_reg[18:0] <= 19'h0;
        end
        // Auto Refresh command

        // Self refresh entry command
`ifdef AXIS_FBDIMM_1AMB
        if ( ( command[20:18] == 3'b001) && ( command[12:10] == 3'b100))
`else
        if ( ( command[20:18] == 3'b001) && ( command[12:10] == 3'b100) && ( command[23:21] == DS ))
`endif // AXIS_FBDIMM_1AMB
        begin
`ifdef AXIS_FBDIMM_HW
`else
	  `PR_ALWAYS ("dram",`DBG_0,"FBDIMM: Self Refresh Entry command sent to DRAM\n");
`endif // AXIS_FBDIMM_HW
          dram_cmd_vld  <= 1'b1;
          if ( command[17] )
            cke_rank1_reg[18:0]  <= 19'h0;
          else
            cke_rank0_reg[18:0]  <= 19'h0;

          bcs_reg[18:0]  <= 19'h0;
          bcas_reg[18:0] <= 19'h0;
          bras_reg[18:0] <= 19'h0;
          bwe_reg[18:0]  <= 19'h7ffff;
        end
        // Self refresh entry command

        // Power Down entry command
`ifdef AXIS_FBDIMM_1AMB
        if ( ( command[20:18] == 3'b001) && ( command[12:10] == 3'b0-10) )
`else
        if ( ( command[20:18] == 3'b001) && ( command[12:10] == 3'b0-10) && ( command[23:21] == DS ))
`endif // AXIS_FBDIMM_1AMB
        begin
`ifdef AXIS_FBDIMM_HW
`else
	  `PR_ALWAYS ("dram",`DBG_0,"FBDIMM: Power Down Entry command sent to DRAM\n");
`endif // AXIS_FBDIMM_HW
          dram_cmd_vld  <= 1'b1;
          if ( command[17] )
            cke_rank1_reg[18:0]  <= 19'h0;
          else
            cke_rank0_reg[18:0]  <= 19'h0;


          bcs_reg[18:0]  <= 19'h0;
          bcas_reg[18:0] <= 19'h7ffff;
          bras_reg[18:0] <= 19'h7ffff;
          bwe_reg[18:0]  <= 19'h7ffff;
        end
        // Power Down entry command

        // Self refresh exit / power down exit command
`ifdef AXIS_FBDIMM_1AMB
        if ( ( command[20:18] == 3'b001) && ( command[12:10] == 3'b011) )
`else
        if ( ( command[20:18] == 3'b001) && ( command[12:10] == 3'b011) && ( command[23:21] == DS ))
`endif // AXIS_FBDIMM_1AMB
        begin
`ifdef AXIS_FBDIMM_HW
`else
	  `PR_ALWAYS ("dram",`DBG_0,"FBDIMM: Self Refresh/Power Down Exit command sent to DRAM\n");
`endif // AXIS_FBDIMM_HW
          dram_cmd_vld  <= 1'b1;

          if ( command[17] ) 
            cke_rank1_reg[18:0]  <= 19'h7ffff;
          else
            cke_rank0_reg[18:0]  <= 19'h7ffff;

          bcs_reg[18:0]  <= 19'h0;
          bcas_reg[18:0] <= 19'h7ffff;
          bras_reg[18:0] <= 19'h7ffff;
          bwe_reg[18:0]  <= 19'h7ffff;
        end
        // Self refres hexit  / power down exit command


       // Activate command
`ifdef AXIS_FBDIMM_1AMB
       if ( ( command[20] == 1'b1) )
`else
       if ( ( command[20] == 1'b1) && ( command[23:21] == DS ))
`endif
       begin
         dram_cmd_vld<=1;
         bcs_reg[18:0]  <= 18'h0;
         bcas_reg[18:0] <= 19'h7ffff;
         bwe_reg[18:0]  <= 19'h7ffff;
         bras_reg[18:0] <= 19'h0;
         ba_reg[2:0] <= command[15:13];

          // For activate, in 2GB(512MB X 4) config:
          // we use a14-a0
 

          addr_reg[15:0] <= {command[19],command[18],command[16],command[12:0]};
`ifdef AXIS_FBDIMM_HW
`else
	 `PR_ALWAYS ("dram",`DBG_0,"FBDIMM: Activate command sent to DRAM -  Address = %h BA =%h DS=%h   RS=%h\n",addr_reg,command[15:13],command[23:21],RS);
`endif
       end
       // Activate command



       // DRAM CKE per DIMM command
       if ( ( command[20:14] == 7'b0000111) )
       begin
`ifdef AXIS_FBDIMM_HW
`else
         `PR_ALWAYS ("dram",`DBG_0,"FBDIMM: DRAM CKE per DIMM command detected\n");
`endif
         dram_cmd_vld<=1;

         if ( command[13] == 0 ) // bcst = 0
         begin
`ifdef AXIS_FBDIMM_1AMB
`else
            case(command[23:21])
              3'b000: begin 
                       cke_rank1_reg[18:0] <= {19{command[0]}};
                       cke_rank0_reg[18:0] <= {19{command[0]}};
                      end
              3'b001: begin 
                        cke_rank1_reg[18:0] <= {19{command[1]}};
                        cke_rank0_reg[18:0] <= {19{command[1]}};
                      end
              3'b010: begin
                        cke_rank1_reg[18:0] <= {19{command[2]}};
                        cke_rank0_reg[18:0] <= {19{command[2]}};
                      end
              3'b011: begin
                        cke_rank1_reg[18:0] <= {19{command[3]}};
                        cke_rank0_reg[18:0] <= {19{command[3]}};
                      end
              3'b100: begin
                        cke_rank1_reg[18:0] <= {19{command[4]}};
                        cke_rank0_reg[18:0] <= {19{command[4]}};
                      end
              3'b101: begin
                        cke_rank1_reg[18:0] <= {19{command[5]}};
                        cke_rank0_reg[18:0] <= {19{command[5]}};
                      end
              3'b110: begin
                        cke_rank1_reg[18:0] <= {19{command[6]}};
                        cke_rank0_reg[18:0] <= {19{command[6]}};
                      end
              3'b111: begin
                        cke_rank1_reg[18:0] <= {19{command[7]}};
                        cke_rank0_reg[18:0] <= {19{command[7]}};
                      end
            endcase

`endif
         end

         if ( command[13] == 1 ) // bcst = 1
         begin
`ifdef AXIS_FBDIMM_1AMB

`else
            case(DS)
              3'b000: begin 
                       cke_rank1_reg[18:0] <= {19{command[0]}};
                       cke_rank0_reg[18:0] <= {19{command[0]}};
                      end
              3'b001: begin 
                        cke_rank1_reg[18:0] <= {19{command[1]}};
                        cke_rank0_reg[18:0] <= {19{command[1]}};
                      end
              3'b010: begin
                        cke_rank1_reg[18:0] <= {19{command[2]}};
                        cke_rank0_reg[18:0] <= {19{command[2]}};
                      end
              3'b011: begin
                        cke_rank1_reg[18:0] <= {19{command[3]}};
                        cke_rank0_reg[18:0] <= {19{command[3]}};
                      end
              3'b100: begin
                        cke_rank1_reg[18:0] <= {19{command[4]}};
                        cke_rank0_reg[18:0] <= {19{command[4]}};
                      end
              3'b101: begin
                        cke_rank1_reg[18:0] <= {19{command[5]}};
                        cke_rank0_reg[18:0] <= {19{command[5]}};
                      end
              3'b110: begin
                        cke_rank1_reg[18:0] <= {19{command[6]}};
                        cke_rank0_reg[18:0] <= {19{command[6]}};
                      end
              3'b111: begin
                        cke_rank1_reg[18:0] <= {19{command[7]}};
                        cke_rank0_reg[18:0] <= {19{command[7]}};
                      end
            endcase

`endif
        end

       end
       // DRAM CKE per DIMM command



       // DRAM CKE per Rank command
       
       if ( ( command[20:14] == 7'b0000110) )
       begin
`ifdef AXIS_FBDIMM_HW
`else
         `PR_ALWAYS ("dram",`DBG_0,"FBDIMM: DRAM CKE per Rank command detected\n");
`endif
         dram_cmd_vld<=1;


         if ( command[13] == 0 ) // bcst = 0
         begin
`ifdef AXIS_FBDIMM_1AMB
          if ( command[17] ) begin
            case(command[23:21])
              3'b000: cke_rank1_reg[18:0] <= {19{command[0]}};
              3'b001: cke_rank1_reg[18:0] <= {19{command[1]}};
              3'b010: cke_rank1_reg[18:0] <= {19{command[2]}};
              3'b011: cke_rank1_reg[18:0] <= {19{command[3]}};
              3'b100: cke_rank1_reg[18:0] <= {19{command[4]}};
              3'b101: cke_rank1_reg[18:0] <= {19{command[5]}};
              3'b110: cke_rank1_reg[18:0] <= {19{command[6]}};
              3'b111: cke_rank1_reg[18:0] <= {19{command[7]}};
            endcase
          end else begin
            case(command[23:21])
              3'b000: cke_rank0_reg[18:0] <= {19{command[0]}};
              3'b001: cke_rank0_reg[18:0] <= {19{command[1]}};
              3'b010: cke_rank0_reg[18:0] <= {19{command[2]}};
              3'b011: cke_rank0_reg[18:0] <= {19{command[3]}};
              3'b100: cke_rank0_reg[18:0] <= {19{command[4]}};
              3'b101: cke_rank0_reg[18:0] <= {19{command[5]}};
              3'b110: cke_rank0_reg[18:0] <= {19{command[6]}};
              3'b111: cke_rank0_reg[18:0] <= {19{command[7]}};
            endcase

          end

`else
          if  ( command[23:21] == DS )
          begin
           if ( command[17] ) begin
            case(command[23:21])
              3'b000: cke_rank1_reg[18:0] <= {19{command[0]}};
              3'b001: cke_rank1_reg[18:0] <= {19{command[1]}};
              3'b010: cke_rank1_reg[18:0] <= {19{command[2]}};
              3'b011: cke_rank1_reg[18:0] <= {19{command[3]}};
              3'b100: cke_rank1_reg[18:0] <= {19{command[4]}};
              3'b101: cke_rank1_reg[18:0] <= {19{command[5]}};
              3'b110: cke_rank1_reg[18:0] <= {19{command[6]}};
              3'b111: cke_rank1_reg[18:0] <= {19{command[7]}};
            endcase
          end else begin
            case(command[23:21])
              3'b000: cke_rank0_reg[18:0] <= {19{command[0]}};
              3'b001: cke_rank0_reg[18:0] <= {19{command[1]}};
              3'b010: cke_rank0_reg[18:0] <= {19{command[2]}};
              3'b011: cke_rank0_reg[18:0] <= {19{command[3]}};
              3'b100: cke_rank0_reg[18:0] <= {19{command[4]}};
              3'b101: cke_rank0_reg[18:0] <= {19{command[5]}};
              3'b110: cke_rank0_reg[18:0] <= {19{command[6]}};
              3'b111: cke_rank0_reg[18:0] <= {19{command[7]}};
            endcase
          end

    
          end
`endif
         end

         if ( command[13] == 1 ) // bcst = 1
         begin
           if ( command[17] ) begin
            case(DS)
              3'b000: cke_rank1_reg[18:0] <= {19{command[0]}};
              3'b001: cke_rank1_reg[18:0] <= {19{command[1]}};
              3'b010: cke_rank1_reg[18:0] <= {19{command[2]}};
              3'b011: cke_rank1_reg[18:0] <= {19{command[3]}};
              3'b100: cke_rank1_reg[18:0] <= {19{command[4]}};
              3'b101: cke_rank1_reg[18:0] <= {19{command[5]}};
              3'b110: cke_rank1_reg[18:0] <= {19{command[6]}};
              3'b111: cke_rank1_reg[18:0] <= {19{command[7]}};
            endcase
           end else begin
            case(DS)
              3'b000: cke_rank0_reg[18:0] <= {19{command[0]}};
              3'b001: cke_rank0_reg[18:0] <= {19{command[1]}};
              3'b010: cke_rank0_reg[18:0] <= {19{command[2]}};
              3'b011: cke_rank0_reg[18:0] <= {19{command[3]}};
              3'b100: cke_rank0_reg[18:0] <= {19{command[4]}};
              3'b101: cke_rank0_reg[18:0] <= {19{command[5]}};
              3'b110: cke_rank0_reg[18:0] <= {19{command[6]}};
              3'b111: cke_rank0_reg[18:0] <= {19{command[7]}};
            endcase
           end

         end



       end
       // DRAM CKE per Rank command


      end // if (command[23:0] != 24'h0 )
   end // if ( !cmd_fifo_empty)



 if ( !cmd_fifo_empty_bc & !sb_crc_error ) begin

 
      if ( command_bc[23:0] != 24'h0 ) // command is not a NOP
      begin
         // all commands have the Rank Select bit at the same position
         RS<=command_bc[17];

         // write command
`ifdef AXIS_FBDIMM_1AMB
         if (( command_bc[20:18] == 3'b011 )  )
`else
         if (( command_bc[20:18] == 3'b011 ) && ( command_bc[23:21] == DS ) )
`endif // AXIS_FBDIMM_1AMB
         begin
             stall_pipe        <= 1'b0;
             dram_cmd_vld      <= 1'b1;
             bcs_reg[18:0]      <= 19'h0;
             bcas_reg[18:0]     <= 19'h0;
             bwe_reg[18:0]      <= 19'h0;
             bras_reg[18:0]     <= 19'h7ffff;
             dm_rdqs_reg[18:0]  <= 0;
             ba_reg[2:0] <= command_bc[15:13];
             // For read/write, in 2GB(512MB X 4) config:
             // we use a11-a0
             addr_reg[15:0] <= {4'h0,command_bc[11:0]};

             write_cycle_start <= 1'b1;
`ifdef AXIS_FBDIMM_HW
`else
             `PR_ALWAYS ("dram",`DBG_0,"FBDIMM: Write command sent to DRAM - Address = %h BA=%h DS=%h  RS=%h\n",addr_reg,ba_reg,command[23:21],RS);
`endif // AXIS_FBDIMM_HW

        end // write command

        // Read command
`ifdef AXIS_FBDIMM_1AMB
        if (( command_bc[20:18] == 3'b010 )  )
`else
        if (( command_bc[20:18] == 3'b010 ) && ( command_bc[23:21] == DS ) )
`endif // AXIS_FBDIMM_1AMB
        begin
          read_cycle_start <= 1'b1;
          dram_cmd_vld     <= 1'b1;
          bcs_reg[18:0]     <= 19'h0;
          bcas_reg[18:0]    <= 19'h0;
          bwe_reg[18:0]     <= 19'h7ffff;
          bras_reg[18:0]    <= 19'h7ffff;
          ba_reg[2:0] <= command_bc[15:13];

             // For read/write, in 2GB(512MB X 4) config:
             // we use a11-a0
             addr_reg[15:0] <= {4'h0,command_bc[11:0]};

`ifdef AXIS_FBDIMM_HW
`else
          `PR_ALWAYS ("dram",`DBG_0,"FBDIMM: Read command sent to DRAM - Address = %h BA = %h  DS=%h  RS=%h\n",addr_reg,  ba_reg,command[23:21],RS);
`endif // AXIS_FBDIMM_HW
        end
        // Read command

        // precharge all command
`ifdef AXIS_FBDIMM_1AMB
        if (( ( command_bc[20:18] == 3'b001) && ( command_bc[12:10] == 3'b111)) || issue_pre_all_cmd )
`else
        if (( ( command_bc[20:18] == 3'b001) && ( command_bc[12:10] == 3'b111) && ( command_bc[23:21] == DS )) || issue_pre_all_cmd )
`endif // AXIS_FBDIMM_1AMB
        begin
`ifdef AXIS_FBDIMM_HW
`else
`PR_ALWAYS ("dram",`DBG_0,"FBDIMM: Precharge All command sent to DRAM\n");
`endif // AXIS_FBDIMM_HW
          dram_cmd_vld  <= 1'b1;
          bcs_reg[18:0]  <= 19'h0;
          bcas_reg[18:0] <= 19'h7ffff;
          bwe_reg[18:0]  <= 19'h0;
          bras_reg[18:0] <= 19'h0;
          addr_reg[10]  <= 1'b1;
        end
        // precharge all command

        // precharge single command
`ifdef AXIS_FBDIMM_1AMB
        if ( ( command_bc[20:18] == 3'b001) && ( command_bc[12:10] == 3'b110))
`else
        if ( ( command_bc[20:18] == 3'b001) && ( command_bc[12:10] == 3'b110) && ( command_bc[23:21] == DS ))
`endif // AXIS_FBDIMM_1AMB
        begin
`ifdef AXIS_FBDIMM_HW
`else
	  `PR_ALWAYS ("dram",`DBG_0,"FBDIMM: Precharge Single command sent to DRAM bank = %h\n",command[16:13]);
`endif // AXIS_FBDIMM_HW
          dram_cmd_vld  <= 1'b1;
          bcs_reg[18:0]  <= 19'h0;
          bcas_reg[18:0] <= 19'h7fff;
          bwe_reg[18:0]  <= 19'h0;
          bras_reg[18:0] <= 19'h0;
          addr_reg[10]  <= 1'b0;
          ba_reg[2:0]   <= command_bc[16:13];
        end
        // precharge signle command

        // Auto refresh command
`ifdef AXIS_FBDIMM_1AMB
        if ( ( command_bc[20:18] == 3'b001) && ( command_bc[12:10] == 3'b101) )
`else 
       if ( ( command_bc[20:18] == 3'b001) && ( command_bc[12:10] == 3'b101) && ( command_bc[23:21] == DS ))
`endif // AXIS_FBDIMM_1AMB
        begin
`ifdef AXIS_FBDIMM_HW
`else
	  `PR_ALWAYS ("dram",`DBG_0,"FBDIMM: AutoRefresh command sent to DRAM\n");
`endif // AXIS_FBDIMM_HW
          dram_cmd_vld  <= 1'b1;
          bcs_reg[18:0]  <= 19'h0;
          bcas_reg[18:0] <= 19'h0;
          bwe_reg[18:0]  <= 19'h7ffff;
          bras_reg[18:0] <= 19'h0;
        end
        // Auto Refresh command

        // Self refresh entry command
`ifdef AXIS_FBDIMM_1AMB
        if ( ( command_bc[20:18] == 3'b001) && ( command_bc[12:10] == 3'b100))
`else
        if ( ( command_bc[20:18] == 3'b001) && ( command_bc[12:10] == 3'b100) && ( command_bc[23:21] == DS ))
`endif // AXIS_FBDIMM_1AMB
        begin
`ifdef AXIS_FBDIMM_HW
`else
	  `PR_ALWAYS ("dram",`DBG_0,"FBDIMM: Self Refresh Entry command sent to DRAM\n");
`endif // AXIS_FBDIMM_HW
          dram_cmd_vld  <= 1'b1;
          if ( command_bc[17] )
            cke_rank1_reg[18:0]  <= 19'h0;
          else
            cke_rank0_reg[18:0]  <= 19'h0;

          bcs_reg[18:0]  <= 19'h0;
          bcas_reg[18:0] <= 19'h0;
          bras_reg[18:0] <= 19'h0;
          bwe_reg[18:0]  <= 19'h7ffff;
        end
        // Self refresh entry command

        // Power Down entry command
`ifdef AXIS_FBDIMM_1AMB
        if ( ( command_bc[20:18] == 3'b001) && ( command_bc[12:10] == 3'b010) )
`else
        if ( ( command_bc[20:18] == 3'b001) && ( command_bc[12:10] == 3'b010) && ( command_bc[23:21] == DS ))
`endif // AXIS_FBDIMM_1AMB
        begin
`ifdef AXIS_FBDIMM_HW
`else
	  `PR_ALWAYS ("dram",`DBG_0,"FBDIMM: Power Down Entry command sent to DRAM\n");
`endif // AXIS_FBDIMM_HW
          dram_cmd_vld  <= 1'b1;
          if ( command_bc[17] )
            cke_rank1_reg[18:0]  <= 19'h0;
          else
            cke_rank0_reg[18:0]  <= 19'h0;

          bcs_reg[18:0]  <= 19'h0;
          bcas_reg[18:0] <= 19'h7ffff;
          bras_reg[18:0] <= 19'h7ffff;
          bwe_reg[18:0]  <= 19'h7ffff;
        end
        // Power Down entry command

        // Self refresh exit / power down exit command
`ifdef AXIS_FBDIMM_1AMB
        if ( ( command_bc[20:18] == 3'b001) && ( command_bc[12:10] == 3'b011) )
`else
        if ( ( command_bc[20:18] == 3'b001) && ( command_bc[12:10] == 3'b011) && ( command_bc[23:21] == DS ))
`endif // AXIS_FBDIMM_1AMB
        begin
`ifdef AXIS_FBDIMM_HW
`else
	  `PR_ALWAYS ("dram",`DBG_0,"FBDIMM: Self Refresh/Power Down Exit command sent to DRAM\n");
`endif // AXIS_FBDIMM_HW
          dram_cmd_vld  <= 1'b1;
          if ( command_bc[17] )
            cke_rank1_reg[18:0]  <= 19'h7ffff;
          else
            cke_rank0_reg[18:0]  <= 19'h7ffff;

          bcs_reg[18:0]  <= 19'h0;
          bcas_reg[18:0] <= 19'h7ffff;
          bras_reg[18:0] <= 19'h7ffff;
          bwe_reg[18:0]  <= 19'h7ffff;
        end
        // Self refres hexit  / power down exit command


       // Activate command
`ifdef AXIS_FBDIMM_1AMB
       if ( ( command_bc[20] == 1'b1) )
`else
       if ( ( command_bc[20] == 1'b1) && ( command_bc[23:21] == DS ))
`endif
       begin
         dram_cmd_vld<=1;
         bcs_reg[18:0]  <= 18'h0;
         bcas_reg[18:0] <= 19'h7ffff;
         bwe_reg[18:0]  <= 19'h7ffff;
         bras_reg[18:0] <= 19'h0;
         ba_reg[2:0] <= command_bc[15:13];

          // For activate, in 2GB(512MB X 4) config:
          // we use a14-a0
 

          addr_reg[15:0] <= {command_bc[19],command_bc[18],command_bc[16],command_bc[12:0]};
`ifdef AXIS_FBDIMM_HW
`else
	 `PR_ALWAYS ("dram",`DBG_0,"FBDIMM: Activate command sent to DRAM -  Address = %h BA =%h DS=%h   RS=%h\n",addr_reg,command[15:13],command[23:21],RS);
`endif
       end
       // Activate command


       // DRAM CKE per DIMM command
       if ( ( command_bc[20:14] == 7'b0000111) )
       begin
`ifdef AXIS_FBDIMM_HW
`else
         `PR_ALWAYS ("dram",`DBG_0,"FBDIMM: DRAM CKE per DIMM command detected\n");
`endif
         dram_cmd_vld<=1;

         if ( command_bc[13] == 0 ) // bcst = 0
         begin
`ifdef AXIS_FBDIMM_1AMB
`else
            case(command_bc[23:21])
              3'b000: begin 
                       cke_rank1_reg[18:0] <= {19{command_bc[0]}};
                       cke_rank0_reg[18:0] <= {19{command_bc[0]}};
                      end
              3'b001: begin 
                        cke_rank1_reg[18:0] <= {19{command_bc[1]}};
                        cke_rank0_reg[18:0] <= {19{command_bc[1]}};
                      end
              3'b010: begin
                        cke_rank1_reg[18:0] <= {19{command_bc[2]}};
                        cke_rank0_reg[18:0] <= {19{command_bc[2]}};
                      end
              3'b011: begin
                        cke_rank1_reg[18:0] <= {19{command_bc[3]}};
                        cke_rank0_reg[18:0] <= {19{command_bc[3]}};
                      end
              3'b100: begin
                        cke_rank1_reg[18:0] <= {19{command_bc[4]}};
                        cke_rank0_reg[18:0] <= {19{command_bc[4]}};
                      end
              3'b101: begin
                        cke_rank1_reg[18:0] <= {19{command_bc[5]}};
                        cke_rank0_reg[18:0] <= {19{command_bc[5]}};
                      end
              3'b110: begin
                        cke_rank1_reg[18:0] <= {19{command_bc[6]}};
                        cke_rank0_reg[18:0] <= {19{command_bc[6]}};
                      end
              3'b111: begin
                        cke_rank1_reg[18:0] <= {19{command_bc[7]}};
                        cke_rank0_reg[18:0] <= {19{command_bc[7]}};
                      end
            endcase

`endif
         end

         if ( command_bc[13] == 1 ) // bcst = 1
         begin
`ifdef AXIS_FBDIMM_1AMB

`else
            case(DS)
              3'b000: begin 
                       cke_rank1_reg[18:0] <= {19{command_bc[0]}};
                       cke_rank0_reg[18:0] <= {19{command_bc[0]}};
                      end
              3'b001: begin 
                        cke_rank1_reg[18:0] <= {19{command_bc[1]}};
                        cke_rank0_reg[18:0] <= {19{command_bc[1]}};
                      end
              3'b010: begin
                        cke_rank1_reg[18:0] <= {19{command_bc[2]}};
                        cke_rank0_reg[18:0] <= {19{command_bc[2]}};
                      end
              3'b011: begin
                        cke_rank1_reg[18:0] <= {19{command_bc[3]}};
                        cke_rank0_reg[18:0] <= {19{command_bc[3]}};
                      end
              3'b100: begin
                        cke_rank1_reg[18:0] <= {19{command_bc[4]}};
                        cke_rank0_reg[18:0] <= {19{command_bc[4]}};
                      end
              3'b101: begin
                        cke_rank1_reg[18:0] <= {19{command_bc[5]}};
                        cke_rank0_reg[18:0] <= {19{command_bc[5]}};
                      end
              3'b110: begin
                        cke_rank1_reg[18:0] <= {19{command_bc[6]}};
                        cke_rank0_reg[18:0] <= {19{command_bc[6]}};
                      end
              3'b111: begin
                        cke_rank1_reg[18:0] <= {19{command_bc[7]}};
                        cke_rank0_reg[18:0] <= {19{command_bc[7]}};
                      end
            endcase

`endif
        end

       end
       // DRAM CKE per DIMM command


       // DRAM CKE per Rank command
       
       if ( ( command_bc[20:14] == 7'b0000110) )
       begin
`ifdef AXIS_FBDIMM_HW
`else
         `PR_ALWAYS ("dram",`DBG_0,"FBDIMM: DRAM CKE per Rank command detected\n");
`endif
         dram_cmd_vld<=1;

         if ( command_bc[13] == 0 ) // bcst = 0
         begin
`ifdef AXIS_FBDIMM_1AMB
          if ( command_bc[17]) begin
            case(command_bc[23:21])
              3'b000: cke_rank1_reg[18:0] <= {19{command_bc[0]}};
              3'b001: cke_rank1_reg[18:0] <= {19{command_bc[1]}};
              3'b010: cke_rank1_reg[18:0] <= {19{command_bc[2]}};
              3'b011: cke_rank1_reg[18:0] <= {19{command_bc[3]}};
              3'b100: cke_rank1_reg[18:0] <= {19{command_bc[4]}};
              3'b101: cke_rank1_reg[18:0] <= {19{command_bc[5]}};
              3'b110: cke_rank1_reg[18:0] <= {19{command_bc[6]}};
              3'b111: cke_rank1_reg[18:0] <= {19{command_bc[7]}};
            endcase
          end else begin
            case(command_bc[23:21])
              3'b000: cke_rank0_reg[18:0] <= {19{command_bc[0]}};
              3'b001: cke_rank0_reg[18:0] <= {19{command_bc[1]}};
              3'b010: cke_rank0_reg[18:0] <= {19{command_bc[2]}};
              3'b011: cke_rank0_reg[18:0] <= {19{command_bc[3]}};
              3'b100: cke_rank0_reg[18:0] <= {19{command_bc[4]}};
              3'b101: cke_rank0_reg[18:0] <= {19{command_bc[5]}};
              3'b110: cke_rank0_reg[18:0] <= {19{command_bc[6]}};
              3'b111: cke_rank0_reg[18:0] <= {19{command_bc[7]}};
            endcase
          end
 
`else
          if  ( command_bc[23:21] == DS )
          begin
           if ( command_bc[17]) begin
            case(command_bc[23:21])
              3'b000: cke_rank1_reg[18:0] <= {19{command_bc[0]}};
              3'b001: cke_rank1_reg[18:0] <= {19{command_bc[1]}};
              3'b010: cke_rank1_reg[18:0] <= {19{command_bc[2]}};
              3'b011: cke_rank1_reg[18:0] <= {19{command_bc[3]}};
              3'b100: cke_rank1_reg[18:0] <= {19{command_bc[4]}};
              3'b101: cke_rank1_reg[18:0] <= {19{command_bc[5]}};
              3'b110: cke_rank1_reg[18:0] <= {19{command_bc[6]}};
              3'b111: cke_rank1_reg[18:0] <= {19{command_bc[7]}};
            endcase
          end else begin
            case(command_bc[23:21])
              3'b000: cke_rank0_reg[18:0] <= {19{command_bc[0]}};
              3'b001: cke_rank0_reg[18:0] <= {19{command_bc[1]}};
              3'b010: cke_rank0_reg[18:0] <= {19{command_bc[2]}};
              3'b011: cke_rank0_reg[18:0] <= {19{command_bc[3]}};
              3'b100: cke_rank0_reg[18:0] <= {19{command_bc[4]}};
              3'b101: cke_rank0_reg[18:0] <= {19{command_bc[5]}};
              3'b110: cke_rank0_reg[18:0] <= {19{command_bc[6]}};
              3'b111: cke_rank0_reg[18:0] <= {19{command_bc[7]}};
            endcase
          end

          end
`endif
         end

         if ( command_bc[13] == 1 ) // bcst = 1
         begin
          if ( command_bc[17]) begin
            case(DS)
              3'b000: cke_rank1_reg[18:0] <= {19{command_bc[0]}};
              3'b001: cke_rank1_reg[18:0] <= {19{command_bc[1]}};
              3'b010: cke_rank1_reg[18:0] <= {19{command_bc[2]}};
              3'b011: cke_rank1_reg[18:0] <= {19{command_bc[3]}};
              3'b100: cke_rank1_reg[18:0] <= {19{command_bc[4]}};
              3'b101: cke_rank1_reg[18:0] <= {19{command_bc[5]}};
              3'b110: cke_rank1_reg[18:0] <= {19{command_bc[6]}};
              3'b111: cke_rank1_reg[18:0] <= {19{command_bc[7]}};
            endcase
          end else begin
          if ( command_bc[17]) begin
            case(DS)
              3'b000: cke_rank0_reg[18:0] <= {19{command_bc[0]}};
              3'b001: cke_rank0_reg[18:0] <= {19{command_bc[1]}};
              3'b010: cke_rank0_reg[18:0] <= {19{command_bc[2]}};
              3'b011: cke_rank0_reg[18:0] <= {19{command_bc[3]}};
              3'b100: cke_rank0_reg[18:0] <= {19{command_bc[4]}};
              3'b101: cke_rank0_reg[18:0] <= {19{command_bc[5]}};
              3'b110: cke_rank0_reg[18:0] <= {19{command_bc[6]}};
              3'b111: cke_rank0_reg[18:0] <= {19{command_bc[7]}};
            endcase
          end
          end

         end



       end
       // DRAM CKE per Rank command



      end // if (command_bc[23:0] != 24'h0 )
   end // if ( !cmd_fifo_empty_bc)


end // drams_on

  // DCAL CSR register needs to send a command to drams
  if ( dcalcsr[31] )
  begin
   dcalcsr_complete <= 1;
    bcs_reg[18:0]<=0;
    bcas_reg[18:0]<=0;
    bras_reg[18:0]<=0;
    bwe_reg[18:0]<=0;
    ba_reg<=dcaladdr[2:0];
    addr_reg<=dcaladdr[31:16];
  end
   else
     dcalcsr_complete <= 0;
 




/**** Command BC ******/


end // command decoder




wire write_cmd = command_rdy & ( command_in[23:0] != 24'h0);

// This fifo gets commands from sb decoder and sends to drams

beh_fifo #(24,9) cmd_fifo_A (.rdata  (cmd_fifo_rd_data),
                             .wfull  (cmd_fifo_full),
                             .rempty (cmd_fifo_empty),
                             .wdata  (command_in[23:0]),
                             .winc   (write_cmd & ( command_type[1:0] == 2'b11) ),
                             .wclk   (clk_int),
                             .wrst_n (~reset),
                             .rinc   ( 1'b1 ),
                             .rclk   ( frm_boundary ), // dram_clk),
                             .rrst_n (~reset),
                             .inv    ( sb_crc_error ));

wire [23:0] command_in_bc = (  command_type[1:0] == 2'b11 ) ? 24'h0 : command_in;

beh_fifo #(24,9) cmd_fifo_BC (.rdata  (cmd_fifo_rd_data_bc),
                              .wfull  (cmd_fifo_full_bc),
                              .rempty (cmd_fifo_empty_bc),
                              .wdata  ( command_in_bc),
                              .winc   ( write_cmd ) ,
                              .wclk   (clk_int),
                              .wrst_n (~reset),
                              .rinc   ( 1'b1 ),
                              .rclk   ( frm_boundary ), // dram_clk),
                              .rrst_n (~reset),
                              .inv    ( sb_crc_error ));


`ifdef CAD_DDR2_DRAM

// Dram devices for X8 configuration

`ifdef X8

  ddr2_dram dram_1 ( .CK       (dram_clk),
                     .bCK      (~dram_clk),
                     .CKE      (cke[1]),
                     .bCS      (bcs[1]),
                     .bRAS     (bras[1]),
                     .bCAS     (bcas[1]),
                     .bWE      (bwe[1]),
                     .BA       (ba),
                     .Addr     (addr),
                     .DQ       (dq[7:0]),
                     .DQS      (dqs[1]),
                     .bDQS     (bdqs[1]),
                     .DM_RDQS  (dm_rdqs[1]),
                     .bRDQS    (brdqs[1]),
                     .ODT      (odt[1]),
                     .areset      (areset[1]),
                     .term     (term[1]));

  ddr2_dram dram_2 ( .CK       (dram_clk),
                     .bCK      (~dram_clk),
                     .CKE      (cke[2]),
                     .bCS      (bcs[2]),
                     .bRAS     (bras[2]),
                     .bCAS     (bcas[2]),
                     .bWE      (bwe[2]),
                     .BA       (ba),
                     .Addr     (addr),
                     .DQ       (dq[15:8]),
                     .DQS      (dqs[2]),
                     .bDQS     (bdqs[2]),
                     .DM_RDQS  (dm_rdqs[2]),
                     .bRDQS    (brdqs[2]),
                     .ODT      (odt[2]),
                     .areset   (areset[2]),
                     .term     (term[2]));

  ddr2_dram dram_3 ( .CK       (dram_clk),
                     .bCK      (~dram_clk),
                     .CKE      (cke[3]),
                     .bCS      (bcs[3]),
                     .bRAS     (bras[3]),
                     .bCAS     (bcas[3]),
                     .bWE      (bwe[3]),
                     .BA       (ba),
                     .Addr     (addr),
                     .DQ       (dq[23:16]),
                     .DQS      (dqs[3]),
                     .bDQS     (bdqs[3]),
                     .DM_RDQS  (dm_rdqs[3]),
                     .bRDQS    (brdqs[3]),
                     .areset   (areset[3]),
                     .ODT      (odt[3]),
                     .term     (term[3]));

  ddr2_dram dram_4 ( .CK       (dram_clk),
                     .bCK      (~dram_clk),
                     .CKE      (cke[4]),
                     .bCS      (bcs[4]),
                     .bRAS     (bras[4]),
                     .bCAS     (bcas[4]),
                     .bWE      (bwe[4]),
                     .BA       (ba),
                     .Addr     (addr),
                     .DQ       (dq[31:24]),
                     .DQS      (dqs[4]),
                     .bDQS     (bdqs[4]),
                     .DM_RDQS  (dm_rdqs[4]),
                     .bRDQS    (brdqs[4]),
                     .ODT      (odt[4]),
                     .areset   (areset[4]),
                     .term     (term[4]));

  ddr2_dram dram_5 ( .CK       (dram_clk),
                     .bCK      (~dram_clk),
                     .CKE      (cke[5]),
                     .bCS      (bcs[5]),
                     .bRAS     (bras[5]),
                     .bCAS     (bcas[5]),
                     .bWE      (bwe[5]),
                     .BA       (ba),
                     .Addr     (addr),
                     .DQ       (dq[39:32]),
                     .DQS      (dqs[5]),
                     .bDQS     (bdqs[5]),
                     .DM_RDQS  (dm_rdqs[5]),
                     .bRDQS    (brdqs[5]),
                     .areset   (areset[5]),
                     .ODT      (odt[5]),
                     .term     (term[5]));

  ddr2_dram dram_6 ( .CK       (dram_clk),
                     .bCK      (~dram_clk),
                     .CKE      (cke[6]),
                     .bCS      (bcs[6]),
                     .bRAS     (bras[6]),
                     .bCAS     (bcas[6]),
                     .bWE      (bwe[6]),
                     .BA       (ba),
                     .Addr     (addr),
                     .DQ       (dq[47:40]),
                     .DQS      (dqs[6]),
                     .bDQS     (bdqs[6]),
                     .DM_RDQS  (dm_rdqs[6]),
                     .bRDQS    (brdqs[6]),
                     .ODT      (odt[6]),
                     .areset   (areset[6]),
                     .term     (term[6]));

  ddr2_dram dram_7 ( .CK       (dram_clk),
                     .bCK      (~dram_clk),
                     .CKE      (cke[7]),
                     .bCS      (bcs[7]),
                     .bRAS     (bras[7]),
                     .bCAS     (bcas[7]),
                     .bWE      (bwe[7]),
                     .BA       (ba),
                     .Addr     (addr),
                     .DQ       (dq[55:48]),
                     .DQS      (dqs[7]),
                     .bDQS     (bdqs[7]),
                     .DM_RDQS  (dm_rdqs[7]),
                     .bRDQS    (brdqs[7]),
                     .ODT      (odt[7]),
                     .areset   (areset[7]),
                     .term     (term[7]));

  ddr2_dram dram_8 ( .CK       (dram_clk),
                     .bCK      (~dram_clk),
                     .CKE      (cke[8]),
                     .bCS      (bcs[8]),
                     .bRAS     (bras[8]),
                     .bCAS     (bcas[8]),
                     .bWE      (bwe[8]),
                     .BA       (ba),
                     .Addr     (addr),
                     .DQ       (dq[63:56]),
                     .DQS      (dqs[8]),
                     .bDQS     (bdqs[8]),
                     .DM_RDQS  (dm_rdqs[8]),
                     .bRDQS    (brdqs[8]),
                     .ODT      (odt[8]),
                     .areset   (areset[8]),
                     .term     (term[8]));


  ddr2_dram dram_9 ( .CK       (dram_clk),
                     .bCK      (~dram_clk),
                     .CKE      (cke[9]),
                     .bCS      (bcs[9]),
                     .bRAS     (bras[9]),
                     .bCAS     (bcas[9]),
                     .bWE      (bwe[9]),
                     .BA       (ba),
                     .Addr     (addr),
                     .DQ       (dq[71:64]),
                     .DQS      (dqs[9]),
                     .bDQS     (bdqs[9]),
                     .DM_RDQS  (dm_rdqs[9]),
                     .bRDQS    (brdqs[9]),
                     .ODT      (odt[9]),
                     .areset   (areset[9]),
                     .term     (term[9]));

`endif // X8

// Dram devices for X4 configuration

`ifdef X4



`ifdef DRAM_SAT
`else 

  ddr2_dram dram_1 ( .CK       (dram_clk),
                     .bCK      (~dram_clk),
                     .CKE      (cke[1]),
                     .bCS      (bcs[1]),
                     .bRAS     (bras[1]),
                     .bCAS     (bcas[1]),
                     .bWE      (bwe[1]),
                     .BA       (ba),
                     .Addr     (addr),
                     .DQ       (dq[3:0]),
                     .DQS      (dqs[1]),
                     .bDQS     (bdqs[1]),
                     .ODT      (odt[1]),
                     .areset   (areset[1]),
                     .term     (term[1]));

  ddr2_dram dram_2 ( .CK       (dram_clk),
                     .bCK      (~dram_clk),
                     .CKE      (cke[2]),
                     .bCS      (bcs[2]),
                     .bRAS     (bras[2]),
                     .bCAS     (bcas[2]),
                     .bWE      (bwe[2]),
                     .BA       (ba),
                     .Addr     (addr),
                     .DQ       (dq[7:4]),
                     .DQS      (dqs[2]),
                     .bDQS     (bdqs[2]),
                     .ODT      (odt[2]),
                     .areset   (areset[2]),
                     .term     (term[2]));

  ddr2_dram dram_3 ( .CK       (dram_clk),
                     .bCK      (~dram_clk),
                     .CKE      (cke[3]),
                     .bCS      (bcs[3]),
                     .bRAS     (bras[3]),
                     .bCAS     (bcas[3]),
                     .bWE      (bwe[3]),
                     .BA       (ba),
                     .Addr     (addr),
                     .DQ       (dq[11:8]),
                     .DQS      (dqs[3]),
                     .bDQS     (bdqs[3]),
                     .areset   (areset[3]),
                     .ODT      (odt[3]),
                     .term     (term[3]));

  ddr2_dram dram_4 ( .CK       (dram_clk),
                     .bCK      (~dram_clk),
                     .CKE      (cke[4]),
                     .bCS      (bcs[4]),
                     .bRAS     (bras[4]),
                     .bCAS     (bcas[4]),
                     .bWE      (bwe[4]),
                     .BA       (ba),
                     .Addr     (addr),
                     .DQ       (dq[15:12]),
                     .DQS      (dqs[4]),
                     .bDQS     (bdqs[4]),
                     .ODT      (odt[4]),
                     .areset   (areset[4]),
                     .term     (term[4]));

  ddr2_dram dram_5 ( .CK       (dram_clk),
                     .bCK      (~dram_clk),
                     .CKE      (cke[5]),
                     .bCS      (bcs[5]),
                     .bRAS     (bras[5]),
                     .bCAS     (bcas[5]),
                     .bWE      (bwe[5]),
                     .BA       (ba),
                     .Addr     (addr),
                     .DQ       (dq[19:16]),
                     .DQS      (dqs[5]),
                     .bDQS     (bdqs[5]),
                     .areset   (areset[5]),
                     .ODT      (odt[5]),
                     .term     (term[5]));

  ddr2_dram dram_6 ( .CK       (dram_clk),
                     .bCK      (~dram_clk),
                     .CKE      (cke[6]),
                     .bCS      (bcs[6]),
                     .bRAS     (bras[6]),
                     .bCAS     (bcas[6]),
                     .bWE      (bwe[6]),
                     .BA       (ba),
                     .Addr     (addr),
                     .DQ       (dq[23:20]),
                     .DQS      (dqs[6]),
                     .bDQS     (bdqs[6]),
                     .ODT      (odt[6]),
                     .areset   (areset[6]),
                     .term     (term[6]));

  ddr2_dram dram_7 ( .CK       (dram_clk),
                     .bCK      (~dram_clk),
                     .CKE      (cke[7]),
                     .bCS      (bcs[7]),
                     .bRAS     (bras[7]),
                     .bCAS     (bcas[7]),
                     .bWE      (bwe[7]),
                     .BA       (ba),
                     .Addr     (addr),
                     .DQ       (dq[27:24]),
                     .DQS      (dqs[7]),
                     .bDQS     (bdqs[7]),
                     .ODT      (odt[7]),
                     .areset   (areset[7]),
                     .term     (term[7]));

  ddr2_dram dram_8 ( .CK       (dram_clk),
                     .bCK      (~dram_clk),
                     .CKE      (cke[8]),
                     .bCS      (bcs[8]),
                     .bRAS     (bras[8]),
                     .bCAS     (bcas[8]),
                     .bWE      (bwe[8]),
                     .BA       (ba),
                     .Addr     (addr),
                     .DQ       (dq[31:28]),
                     .DQS      (dqs[8]),
                     .bDQS     (bdqs[8]),
                     .ODT      (odt[8]),
                     .areset   (areset[8]),
                     .term     (term[8]));


  ddr2_dram dram_9 ( .CK       (dram_clk),
                     .bCK      (~dram_clk),
                     .CKE      (cke[9]),
                     .bCS      (bcs[9]),
                     .bRAS     (bras[9]),
                     .bCAS     (bcas[9]),
                     .bWE      (bwe[9]),
                     .BA       (ba),
                     .Addr     (addr),
                     .DQ       (dq[35:32]),
                     .DQS      (dqs[9]),
                     .bDQS     (bdqs[9]),
                     .ODT      (odt[9]),
                     .areset   (areset[9]),
                     .term     (term[9]));

  ddr2_dram dram_10 ( .CK       (dram_clk),
                     .bCK      (~dram_clk),
                     .CKE      (cke[10]),
                     .bCS      (bcs[10]),
                     .bRAS     (bras[10]),
                     .bCAS     (bcas[10]),
                     .bWE      (bwe[10]),
                     .BA       (ba),
                     .Addr     (addr),
                     .DQ       (dq[39:36]),
                     .DQS      (dqs[10]),
                     .bDQS     (bdqs[10]),
                     .ODT      (odt[10]),
                     .areset   (areset[10]),
                     .term     (term[10]));

  ddr2_dram dram_11 ( .CK       (dram_clk),
                     .bCK      (~dram_clk),
                     .CKE      (cke[11]),
                     .bCS      (bcs[11]),
                     .bRAS     (bras[11]),
                     .bCAS     (bcas[11]),
                     .bWE      (bwe[11]),
                     .BA       (ba),
                     .Addr     (addr),
                     .DQ       (dq[43:40]),
                     .DQS      (dqs[11]),
                     .bDQS     (bdqs[11]),
                     .ODT      (odt[11]),
                     .areset   (areset[11]),
                     .term     (term[11]));

  ddr2_dram dram_12 ( .CK       (dram_clk),
                     .bCK      (~dram_clk),
                     .CKE      (cke[12]),
                     .bCS      (bcs[12]),
                     .bRAS     (bras[12]),
                     .bCAS     (bcas[12]),
                     .bWE      (bwe[12]),
                     .BA       (ba),
                     .Addr     (addr),
                     .DQ       (dq[47:44]),
                     .DQS      (dqs[12]),
                     .bDQS     (bdqs[12]),
                     .areset   (areset[12]),
                     .ODT      (odt[12]),
                     .term     (term[12]));

  ddr2_dram dram_13 ( .CK       (dram_clk),
                     .bCK      (~dram_clk),
                     .CKE      (cke[13]),
                     .bCS      (bcs[13]),
                     .bRAS     (bras[13]),
                     .bCAS     (bcas[13]),
                     .bWE      (bwe[13]),
                     .BA       (ba),
                     .Addr     (addr),
                     .DQ       (dq[51:48]),
                     .DQS      (dqs[13]),
                     .bDQS     (bdqs[13]),
                     .ODT      (odt[13]),
                     .areset   (areset[13]),
                     .term     (term[13]));

  ddr2_dram dram_14 ( .CK       (dram_clk),
                     .bCK      (~dram_clk),
                     .CKE      (cke[14]),
                     .bCS      (bcs[14]),
                     .bRAS     (bras[14]),
                     .bCAS     (bcas[14]),
                     .bWE      (bwe[14]),
                     .BA       (ba),
                     .Addr     (addr),
                     .DQ       (dq[55:52]),
                     .DQS      (dqs[14]),
                     .bDQS     (bdqs[14]),
                     .areset   (areset[14]),
                     .ODT      (odt[14]),
                     .term     (term[14]));

  ddr2_dram dram_15 ( .CK       (dram_clk),
                     .bCK      (~dram_clk),
                     .CKE      (cke[15]),
                     .bCS      (bcs[15]),
                     .bRAS     (bras[15]),
                     .bCAS     (bcas[15]),
                     .bWE      (bwe[15]),
                     .BA       (ba),
                     .Addr     (addr),
                     .DQ       (dq[59:56]),
                     .DQS      (dqs[15]),
                     .bDQS     (bdqs[15]),
                     .ODT      (odt[15]),
                     .areset   (areset[15]),
                     .term     (term[15]));

  ddr2_dram dram_16 ( .CK       (dram_clk),
                     .bCK      (~dram_clk),
                     .CKE      (cke[16]),
                     .bCS      (bcs[16]),
                     .bRAS     (bras[16]),
                     .bCAS     (bcas[16]),
                     .bWE      (bwe[16]),
                     .BA       (ba),
                     .Addr     (addr),
                     .DQ       (dq[63:60]),
                     .DQS      (dqs[16]),
                     .bDQS     (bdqs[16]),
                     .ODT      (odt[16]),
                     .areset   (areset[16]),
                     .term     (term[16]));

  ddr2_dram dram_17 ( .CK       (dram_clk),
                     .bCK      (~dram_clk),
                     .CKE      (cke[17]),
                     .bCS      (bcs[17]),
                     .bRAS     (bras[17]),
                     .bCAS     (bcas[17]),
                     .bWE      (bwe[17]),
                     .BA       (ba),
                     .Addr     (addr),
                     .DQ       (dq[67:64]),
                     .DQS      (dqs[17]),
                     .bDQS     (bdqs[17]),
                     .ODT      (odt[17]),
                     .areset   (areset[17]),
                     .term     (term[17]));


  ddr2_dram dram_18 ( .CK       (dram_clk),
                     .bCK      (~dram_clk),
                     .CKE      (cke[18]),
                     .bCS      (bcs[18]),
                     .bRAS     (bras[18]),
                     .bCAS     (bcas[18]),
                     .bWE      (bwe[18]),
                     .BA       (ba),
                     .Addr     (addr),
                     .DQ       (dq[71:68]),
                     .DQS      (dqs[18]),
                     .bDQS     (bdqs[18]),
                     .ODT      (odt[18]),
                     .areset   (areset[18]),
                     .term     (term[18]));

`endif	//  DRAM_SAT
`endif  // x4
`endif // CAD_DDR2_DRAM

// !!!!! If we run on AXIS HW, we will not need tasks to initialize the DDR2 dram


`ifdef AXIS_DDR2_MODEL
`else

task update_cke;
input value;

begin
cke_rank0_reg[18:1]={18{value}};
cke_rank1_reg[18:1]={18{value}};
end

endtask

// nop command emulation
task nop;
input dummy;
begin
bcs_reg[18:0]=19'h0;
bcas_reg[18:0]=19'h7ffff;
bras_reg[18:0]=19'h7ffff;
bwe_reg[18:0]=19'h7ffff;
end
endtask

// refresh command emulation
task refresh;
input dummy;
begin

bcs_reg[18:0]=19'h0;
bcas_reg[18:0]=19'b0;
bras_reg[18:0]=19'b0;
bwe_reg[18:0]=19'h7ffff;
end
endtask


// precharge command emulation

task precharge;

input a10;
input [2:0] ba_in;

begin
bcs_reg[18:0]=19'h0;
bcas_reg[18:0]=19'h7ffff;
bras_reg[18:0]=19'b0;
bwe_reg[18:0]=19'b0;
ba_reg=ba_in;

addr_reg[10]=a10;
end
endtask

// simulation of delay cycles
task delays;

input [9:0] cycle;
integer index;

begin
for(index=1; index<=cycle; index=index+1)
 begin
 @(posedge dram_clk);
 end

end
endtask


// Self Refresh Entry by AMB
task Self_Refresh_Entry;
begin
`ifdef AXIS_FBDIMM_HW
`else
`PR_ALWAYS ("dram_init",`DBG_0,"FBDIMM: Self Refresh Entry Started\n");
`endif

// Step:1  Wait tCKE then take all CKE signals high
delays(3);
cke_rank0_reg[18:0]=19'h7ffff; // keep CKE high
cke_rank1_reg[18:0]=19'h7ffff; // keep CKE high

// Step: 2 Wait tXSNR(tRFC + 10ns for ddr2)
delays(3);
delays(10);

// Note: OD must be low during the previous two steps

// Step:3 Issue precharge all to all ranks
precharge(1,0);

// step:4 Wait tRFC
delays(1); // tRP
nop(0);
delays(1);

// Step: 5 Assure ODT signals are low
odt_reg[18:1] = 0;

// Step: 6 Issue enter self refresh
refresh(0);
delays(1);

// step:7 Disable clocks
cke_rank0_reg[18:1]= 0;
cke_rank1_reg[18:1]= 0;

`ifdef AXIS_FBDIMM_HW
`else
`PR_ALWAYS ("dram_init",`DBG_0,"FBDIMM: DRAMs in self refresh mode\n");
`endif
end

endtask


// MRS comand emulation
task mrs_command;

input [2:0] ba_in;
input [15:0] address_in;

begin


bcs_reg[18:1]=0;
bcas_reg[18:1]=0;
bras_reg[18:1]=0;
bwe_reg[18:1]=0;

ba_reg=ba_in;
addr_reg=address_in;
end
endtask
`endif //ifdef AXIS_DDR2_MODEL
 

`ifdef STINGRAY

`ifdef AXIS_DDR2_MODEL
`else
// Initialization task for DRAMs
task init_dram;
input dummy;
begin
`ifdef AXIS_FBDIMM_HW
`else
`PR_ALWAYS ("dram_init",`DBG_4,"FBDIMM: DRAM Init started\n");
`endif
// Step:1

`ifdef AXIS_FBDIMM_HW
`else
`PR_ALWAYS ("dram_init",`DBG_4,"FBDIMM: DRAM Init : CKE & ODT Driven Low\n");
`endif
bcs_reg[18:1]=0; // disable the chip
odt_reg[18:1]=0; // kep ODT low
cke_rank0_reg[18:1]=0; // keep CKE low
cke_rank1_reg[18:1]=0; // keep CKE low
@(posedge dram_clk);


// Step: 2
bcs_reg[18:0]=19'h7ffff;
bcas_reg[18:0]=19'h7ffff;
bras_reg[18:0]= 19'h7ffff;
bwe_reg[18:0]=19'h7ffff;
ba_reg[2:0]=0;
addr_reg=0;
dqs_reg[9:0]=10'h0;
// Step:3
`ifdef AXIS_FBDIMM_HW
`else
`PR_ALWAYS ("dram_init",`DBG_4,"FBDIMM: DRAM Init : NOP Driven on DRAM Control Signals\n");
`endif
nop(0);

delays(21);

`ifdef AXIS_FBDIMM_HW
`else
`PR_ALWAYS ("dram_init",`DBG_4,"FBDIMM: DRAM Init : CKE Driven High\n");
`endif
cke_rank0_reg[18:0]= 19'h7ffff;
cke_rank1_reg[18:0]= 19'h7ffff;

`ifdef AXIS_FBDIMM_HW
`else
`PR_ALWAYS ("dram_init",`DBG_4,"FBDIMM: DRAM Init : Waiting  for Delay 1 to End\n");
`endif
delays(45); // wait 400ns


// Step: 4
`ifdef AXIS_FBDIMM_HW
`else
`PR_ALWAYS ("dram_init",`DBG_4,"FBDIMM: DRAM Init : Precharge All\n");
`endif
precharge(1,0);
delays(1); // tRP
nop(0);
delays(7); // changed for ST

// Step: 5
`ifdef AXIS_FBDIMM_HW
`else
`PR_ALWAYS ("dram_init",`DBG_4,"FBDIMM: DRAM Init : Issue EMRS(2)\n");
`endif
mrs_command(3'b010, 0); // issue mrs2
delays(1);
nop(0);
delays(1); // tMRD


// Step: 6
`ifdef AXIS_FBDIMM_HW
`else
`PR_ALWAYS ("dram_init",`DBG_4,"FBDIMM: DRAM Init : Issue EMRS(3)\n");
`endif
mrs_command(3'b011, 0); // issue mrs3
delays(1);
nop(0);
delays(1); // tMRD


// Step: 7
`ifdef AXIS_FBDIMM_HW
`else
`PR_ALWAYS ("dram_init",`DBG_4,"FBDIMM: DRAM Init : EMRS(1) to enable DLL\n");
`endif
mrs_command(3'b001,{drc[6:4],1'b0,1'b0,1'b0}); // emrs to enable dll
delays(1);
nop(0);
delays(1); // tMRD

// Step: 8
`ifdef AXIS_FBDIMM_HW
`else
`PR_ALWAYS ("dram_init",`DBG_4,"FBDIMM: DRAM Init : MRS for DLL Reset\n");
`endif

mrs_command(3'b000, {3'b101,1'b1,1'b0,drc[2:0],1'b0,2'b01,drc[8]});
delays(1);
nop(0);
delays(1); // tMRD


// Step: 9
`ifdef AXIS_FBDIMM_HW
`else
`PR_ALWAYS ("dram_init",`DBG_4,"FBDIMM: DRAM Init : Precharge all\n");
`endif
precharge(1,0);
delays(1); // tRP
nop(0);
delays(3);

// step: 10
`ifdef AXIS_FBDIMM_HW
`else
`PR_ALWAYS ("dram_init",`DBG_4,"FBDIMM: DRAM Init : Refresh\n");
`endif
refresh(0);
delays(1);
nop(0);
delays(42); // tRFC changed for ST
refresh(0);
delays(1);
nop(0);
delays(42); // tRFC changed for ST
refresh(0);
delays(1);
nop(0);
delays(42); // tRFC changed for ST

// step: 11
`ifdef AXIS_FBDIMM_HW
`else
`PR_ALWAYS ("dram_init",`DBG_4,"FBDIMM: DRAM Init : MRS to set A8 low to initialize device operation\n");
`endif

mrs_command(3'b000, {3'b101,1'b0,1'b0,drc[2:0],1'b0,2'b01,drc[8]});
delays(1); // tMRD
nop(0);

delays(200); // make sure 200 cycles are consumed


// Step:12
`ifdef AXIS_FBDIMM_HW
`else
`PR_ALWAYS ("dram_init",`DBG_4,"FBDIMM: DRAM Init : EMRS1 for OCD default comand\n");
`endif
mrs_command(3'b001, {3'b111,1'b0,drc[6:4],3'b000});
delays(1);
nop(0);
delays(1);
`ifdef AXIS_FBDIMM_HW
`else
`PR_ALWAYS ("dram_init",`DBG_4,"FBDIMM: DRAM Init : EMRS1 to OCD Calibration Mode Exit\n");
`endif
mrs_command(3'b001, {3'b000,1'b0,drc[6:4], 3'b000}); // OCD exit
delays(1);
nop(0);
`ifdef AXIS_FBDIMM_HW
`else
`PR_ALWAYS ("dram_init",`DBG_4,"FBDIMM: DRAM Init ended\n");
`endif
end

endtask
`endif //AXIS_DDR2_MODEL

`else

 `ifdef AXIS_DDR2_MODEL
 `else
// Initialization task for DRAMs
task init_dram;
input dummy;
begin
 `ifdef AXIS_FBDIMM_HW
 `else
 `PR_ALWAYS ("dram_init",`DBG_4,"FBDIMM: DRAM Init started\n");
 `endif // AXIS_FBDIMM_HW
// Step:1
`ifdef AXIS_FBDIMM_HW
`else
`PR_ALWAYS ("dram_init",`DBG_4,"FBDIMM: DRAM Init : St1: CKE & ODT Driven Low\n");
`endif
bcs_reg[18:1]=0; // disable the chip
odt_reg[18:1]=0; // kep ODT low
cke_rank0_reg[18:1]=0; // keep CKE low
cke_rank1_reg[18:1]=0; // keep CKE low
@(posedge dram_clk);


// Step: 2
`ifdef AXIS_FBDIMM_HW
`else
`PR_ALWAYS ("dram_init",`DBG_4,"FBDIMM: DRAM Init : St2: Everything high on dram interface\n");
`endif
bcs_reg[18:0]=19'h7ffff;
bcas_reg[18:0]=19'h7ffff;
bras_reg[18:0]= 19'h7ffff;
bwe_reg[18:0]=19'h7ffff;
ba_reg[2:0]=0;
addr_reg=0;
dqs_reg[9:0]=10'h0;


// Step:3
`ifdef AXIS_FBDIMM_HW
`else
`PR_ALWAYS ("dram_init",`DBG_4,"FBDIMM: DRAM Init : St3: NOP Driven on DRAM Control Signals\n");
`endif
nop(0);

delays(21);

cke_rank0_reg[18:0]= 19'h7ffff;
cke_rank1_reg[18:0]= 19'h7ffff;

delays(45); // wait 400ns


// Step: 4
`ifdef AXIS_FBDIMM_HW
`else
`PR_ALWAYS ("dram_init",`DBG_4,"FBDIMM: DRAM Init: St4: Precharge\n");
`endif
precharge(1,0);
delays(1); // tRP
nop(0);
delays(3);

// Step: 5
`ifdef AXIS_FBDIMM_HW
`else
`PR_ALWAYS ("dram_init",`DBG_4,"FBDIMM: DRAM Init : St5: Mrs2\n");
`endif
mrs_command(3'b010, 0); // issue mrs2
delays(1);
nop(0);
delays(2); // tMRD


// Step: 6
`ifdef AXIS_FBDIMM_HW
`else
`PR_ALWAYS ("dram_init",`DBG_4,"FBDIMM: DRAM Init : St6: mrs3\n");
`endif
mrs_command(3'b011, 0); // issue mrs3
delays(1);
nop(0);
delays(2); // tMRD


// Step: 7
`ifdef AXIS_FBDIMM_HW
`else
`PR_ALWAYS ("dram_init",`DBG_4,"FBDIMM: DRAM Init : St7: Emrs1\n");
`endif
mrs_command(3'b001,{drc[6:4],1'b0,1'b0,1'b0}); // emrs to enable dll
delays(1);
nop(0);
delays(2); // tMRD

// Step: 8
`ifdef AXIS_FBDIMM_HW
`else
`PR_ALWAYS ("dram_init",`DBG_4,"FBDIMM: DRAM Init : St8: Mrs\n");
`endif
if ( sng_channel )
 mrs_command(3'b000, {3'b001,1'b1,1'b0,drc[2:0],1'b0,3'b011}); // BL  = 8 
else
 mrs_command(3'b000, {3'b001,1'b1,1'b0,drc[2:0],1'b0,2'b01,drc[8]});

delays(1);
nop(0);
delays(2); // tMRD


// Step: 9
`ifdef AXIS_FBDIMM_HW
`else
`PR_ALWAYS ("dram_init",`DBG_4,"FBDIMM: DRAM Init : St9: Precharge\n");
`endif
precharge(1,0);
delays(1); // tRP
nop(0);
delays(3);

// step: 10
refresh(0);
delays(1);
nop(0);
delays(31); // tRFC
refresh(0);
delays(1);
nop(0);
delays(31); // tRFC
refresh(0);
delays(1);
nop(0);
delays(31); // tRFC

// step: 11

if ( sng_channel )
 mrs_command(3'b000, {3'b001,1'b0,1'b0,drc[2:0],1'b0,3'b011}); // BL = 8 
else
 mrs_command(3'b000, {3'b001,1'b0,1'b0,3'b011,1'b0,2'b01,drc[8]});
delays(1); // tMRD
nop(0);

delays(200); // make sure 200 cycles are consumed


// Step:12
mrs_command(3'b001, {3'b111,7'b11000});
delays(1);
nop(0);
delays(2);
mrs_command(3'b001, {3'b000,7'b11000}); // OCD exit
delays(1);
nop(0);
`ifdef AXIS_FBDIMM_HW
`else
`PR_ALWAYS ("dram_init",`DBG_4,"FBDIMM: DRAM Init ended\n");
`endif
end

endtask
 `endif // AXIS_DDR2_MODEL

`endif // STINGRAY

reg start_init_dram;

// Initialization
initial begin

`ifdef AXIS_FBDIMM_HW
`else
  if ( $test$plusargs("fbdimm_dbg_4"))
    $ch_dispmon("dram_init",`DBG_4,1);

  if ( $test$plusargs("fbdimm_dbg"))
    $ch_dispmon("dram",`DBG_0,1);
`endif // AXIS_FBDIMM_HW

         bcs_reg[18:0]  = 19'h0;
         bcas_reg[18:0] = 19'h7ffff;
         bwe_reg[18:0]  = 19'h7ffff;
         bras_reg[18:0] = 19'h7ffff;

  start_init_dram=0;
  drams_on=0;
  write_command=0;
  cke_rank0_reg=0;
  cke_rank1_reg=0;
  odt_reg = 0;

  RS=0;
`ifdef STINGRAY
  @(posedge reset)
   stall_pipe=0;
 `else

  `ifdef PALLADIUM
  `else
   #50;
  `endif

  cke_rank0_reg=1;
  cke_rank1_reg=1;
  //@(negedge init);


  @(posedge frm_boundary);
  stall_pipe=0;

  start_init_dram=1;
 `endif // STINGRAY

end

always@(posedge start_init_dram)
begin

`ifdef AXIS_FBDIMM_HW
    `ifdef AXIS_DDR2_MODEL
    `else
      init_dram(0);
    `endif //  AXIS_DDR2_MODEL
    drams_on=1;

`else
  if ( !$test$plusargs("AMB_DRAM_INIT"))
  begin
    RS=0; // initialize rank 0 first
   `ifdef AXIS_DDR2_MODEL
   `else
     init_dram(0);
   `endif // ifdef AXIS_DDR2_MODEL
  end
  drams_on=1;
`endif //AXIS_FBDIMM_HW

end



endmodule
