// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: fbdimm.v
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
`endif

`ifdef AXIS_DDR2_MODEL
module fbdimm (   ps , ps_bar, sn , sn_bar, pn, pn_bar, ss , ss_bar , // channel interface
                  sclk,dq,err_en,dram_clk,dram_2x_clk, link_clk,ref_2x_clk,clk_int,clk_int_2x);
wire         reset_n;
`else
module fbdimm (   ps , ps_bar, sn , sn_bar, pn, pn_bar, ss , ss_bar , // channel interface
                  sclk,reset_n,err_en, dram_clk,dram_2x_clk, link_clk,ref_2x_clk,clk_int,clk_int_2x);
input                 reset_n;
`endif

// Parameters
parameter NB_LINK = 14;
parameter SB_LINK = 10;
parameter DS = 0;

// Inputs/Outputs
output  [NB_LINK-1:0] pn,pn_bar; // primary northbound
input   [NB_LINK-1:0] sn,sn_bar; // secondary northbound
output  [SB_LINK-1:0] ss,ss_bar; // secondary southbound
input   [SB_LINK-1:0] ps,ps_bar; // primary southbound
input                 sclk;
input                 err_en;
input                 dram_clk,dram_2x_clk, link_clk,ref_2x_clk,clk_int,clk_int_2x;
`ifdef AXIS_DDR2_MODEL
inout [71:0]          dq;
`else
wire [71:0]           dq,dq0,dq1;
`endif

//internal registers
reg                   reset_r;
wire                  reset=reset_r;
wire                  clear_dcalcsr31;
wire [3:0]            ch_state;
wire [23:0]           command_in;
wire                  command_rdy;
wire [1:0]            command_type;
wire  [71:0]          data_in,data_out;
wire                  get_wbuffer_data,put_rbuffer_data;
wire [31:0]           dcalcsr,dcaladdr,drc;
wire                  dram_clk,dram_2x_clk,link_clk,ref_2x_clk,clk_int,clk_int_2x;
wire [18:0]           cke_rank0,cke_rank1,bcs,bras,bcas,bwe,dqs,bdqs,dm_rdqs,brdqs,odt,areset,term;
wire [2:0]            ba;
wire [15:0]           addr;
wire                  frm_start;
wire                  dram_cmd_vld_delayed,cke_reg_delayed;
wire                  rs;
wire                  ddrio_nbencode_rd;
wire                  sb_crc_error;

`ifdef STINGRAY
// Top module AMB logic
amb_top #(NB_LINK,SB_LINK,DS) amb( .ps                   ( ps ),
                                   .ps_bar               ( ps_bar),
                                   .sn                   ( sn ),
                                   .sn_bar               ( sn_bar),
                                   .pn                   ( pn ),
                                   .pn_bar               ( pn_bar),
                                   .ss                   ( ss ),
                                   .ss_bar               ( ss_bar),
                                   .link_clk             ( link_clk),
                                   .link_clk_bar         (~link_clk),
                                   .sclk                 ( sclk),
                                   .reset                (~reset_n),
                                   .ch_state             ( ch_state),
                                   .frm_boundary         ( frm_boundary),
                                   .command_in           ( command_in),
                                   .command_rdy          ( command_rdy),
                                   .command_type         ( command_type),
                                   .data_in              ( data_in),
                                   .data_out             ( data_out),
                                   .get_wbuffer_data     ( get_wbuffer_data),
                                   .put_rbuffer_data     ( put_rbuffer_data),
                                   .dcalcsr              ( dcalcsr),
                                   .dcaladdr             ( dcaladdr),
                                   .clear_dcalcsr31      ( clear_dcalcsr31 ),
                                   .drc                  ( drc),
                                   .dram_clk             ( dram_clk),
                                   .dram_2x_clk          ( dram_2x_clk),
                                   .frm_start            ( frm_start),
                                   .ref_2x_clk           ( ref_2x_clk),
                                   .clk_int              ( clk_int),
                                   .ddrio_nbencode_rd    ( ddrio_nbencode_rd ),
                                   .dram_cmd_vld_delayed ( dram_cmd_vld_delayed),
                                   .sb_crc_error         ( sb_crc_error),
                                   .cke_reg_delayed      ( cke_reg_delayed)
`else
// Top module AMB logic
amb_top #(NB_LINK,SB_LINK,DS) amb( .ps                   ( ps ),
                                   .ps_bar               ( ps_bar),
                                   .sn                   ( sn ),
                                   .sn_bar               ( sn_bar),
                                   .pn                   ( pn ),
                                   .pn_bar               ( pn_bar),
                                   .ss                   ( ss ),
                                   .ss_bar               ( ss_bar),
                                   .link_clk             ( link_clk),
                                   .link_clk_bar         (~link_clk),
                                   .sclk                 ( sclk),
                                   .reset                ( reset),
                                   .frm_boundary         ( frm_boundary),
                                   .ch_state             ( ch_state),
                                   .command_in           ( command_in),
                                   .command_type         ( command_type),
                                   .command_rdy          ( command_rdy),
                                   .data_in              ( data_in),
                                   .data_out             ( data_out),
                                   .get_wbuffer_data     ( get_wbuffer_data),
                                   .put_rbuffer_data     ( put_rbuffer_data),
                                   .dcalcsr              ( dcalcsr),
                                   .dcaladdr             ( dcaladdr),
                                   .clear_dcalcsr31      ( clear_dcalcsr31 ),
                                   .ddrio_nbencode_rd    ( ddrio_nbencode_rd ),
                                   .drc                  ( drc),
                                   .frm_start            ( frm_start),
                                   .dram_clk             ( dram_clk),
                                   .ref_2x_clk           ( ref_2x_clk),
                                   .dram_cmd_vld_delayed ( dram_cmd_vld_delayed),
                                   .clk_int              ( clk_int),
                                   .sb_crc_error         ( sb_crc_error),
                                   .cke_reg_delayed      ( cke_reg_delayed),
                                   .dram_2x_clk          ( dram_2x_clk)
`endif

);

`ifdef FBDIMM_EXTERNAL_CLK_GEN
`else
fbdimm_clk_gen fbdimm_clk_gen (.sclk            ( sclk),
                               .frm_start       ( frm_start),
                               .dram_clk        ( dram_clk),
                               .reset_n         ( reset_n),
                               .frm_boundary_sb ( frm_boundary),  
                               .link_clk        ( link_clk),
                               .dram_2x_clk     ( dram_2x_clk),
                               .clk_int         ( clk_int),
                               .clk_int_2x      ( clk_int_2x),
                               .ref_2x_clk      ( ref_2x_clk));                          

`endif

wire drams_on;

`ifdef STINGRAY
ddr_io #(DS) dram_io (
`ifdef AXIS_FBDIMM_NO_FSR
`else
.link_clk (link_clk),
`endif
                      .dram_clk          ( dram_clk),
                      .dram_2x_clk       ( dram_2x_clk),
                      .command_in        ( command_in),
                      .command_type      ( command_type),
                      .ddrio_nbencode_rd ( ddrio_nbencode_rd ),
                      .command_rdy       ( command_rdy ),
                      .data_in           ( data_in),
                      .data_out          ( data_out),
                      .get_wbuffer_data  ( get_wbuffer_data),
                      .put_rbuffer_data  ( put_rbuffer_data),
                      .dcalcsr           ( dcalcsr),
                      .frm_boundary      ( frm_boundary),
                      .dcaladdr          ( dcaladdr),
                      .ch_state          ( ch_state),
                      .drc               ( drc),
                      .reset             (~reset_n),
                      .init              ( amb.init),
                      .cke_rank0         ( cke_rank0),
                      .cke_rank1         ( cke_rank1),
                      .bcs               ( bcs),
                      .bras              ( bras),
                      .bcas              ( bcas),
                      .bwe               ( bwe),
                      .ba                ( ba),
                      .addr              ( addr),
                      .clear_dcalcsr31   ( clear_dcalcsr31),
                      .dq                ( dq),
                      .dqs               ( dqs),
                      .bdqs              ( bdqs), 
                      .dm_rdqs           ( dm_rdqs),
                      .brdqs             ( brdqs),
                      .dqs_in            ( dqs[1]),
                      .odt               ( odt),
                      .areset            ( areset),
                      .term              ( term),
                      .drams_on_out      ( drams_on),
                      .sb_crc_error      ( sb_crc_error),
                      .clk_int           ( clk_int),
                      .rs                ( rs)
`else
ddr_io #(DS) dram_io (
`ifdef AXIS_FBDIMM_NO_FSR
`else
                      .link_clk          ( link_clk),
`endif
                      .dram_clk          ( dram_clk),
                      .dram_2x_clk       ( dram_2x_clk),
                      .command_in        ( command_in),
                      .command_type      ( command_type ),
                      .command_rdy       ( command_rdy ),
                      .data_in           ( data_in),
                      .data_out          ( data_out),
                      .get_wbuffer_data  ( get_wbuffer_data),
                      .put_rbuffer_data  ( put_rbuffer_data),
                      .ch_state          ( ch_state),
                      .dcalcsr           ( dcalcsr),
                      .dcaladdr          ( dcaladdr),
                      .frm_boundary      ( frm_boundary),
                      .clear_dcalcsr31   ( clear_dcalcsr31),
                      .ddrio_nbencode_rd ( ddrio_nbencode_rd ),
                      .drc               ( drc),
                      .reset             ( reset),
                      .init              ( amb.init),
                      .cke_rank0         ( cke_rank0),
                      .cke_rank1         ( cke_rank1),
                      .bcs               ( bcs),
                      .bras              ( bras),
                      .bcas              ( bcas),
                      .bwe               ( bwe),
                      .ba                ( ba),
                      .addr              ( addr),
                      .dq                ( dq),
                      .dqs               ( dqs),
                      .bdqs              ( bdqs), 
                      .dm_rdqs           ( dm_rdqs),
                      .brdqs             ( brdqs),
                      .dqs_in            ( dqs[1]),
                      .odt               ( odt),
                      .drams_on_out      ( drams_on),
                      .areset            ( areset),
                      .term              ( term),
                      .sb_crc_error      ( sb_crc_error),
                      .clk_int           ( clk_int),
                      .rs                (rs)
`endif

);



// DRAM CODE

// Dram devices for X4 configuration
//`ifdef X4

`ifdef ZEROIN_DDR2_DRAM_MONITOR_X

zi_cw_ddr2_sdram_2_0_monitor #( 1,  /* Constraints mode */
                                0,  /* CONTROLLER SIDE */
                                15, /* ROW_ADDRESS_WIDTH */
                                4, /* DATA_BUS_WITDH */
                                1,  /* DLL_TRACKING_ENABLE */
                                6,  /* TRAS */   
                                2,  /* TRCD */   
                                1,  /* TRP */   
                                2,  /* TRRD */   
                                2,  /* TCCD */   
                                4,  /* TRTW */   
                                1,  /* TWTR */   
                                2,  /* TWR */   
                                9,  /* TRFC */   
                                10,  /* TXSNR */   
                                200, /* TXSRD */   
                                2, /* TMRD */   
                                12, /* AUTOPRECHARGE_ENABLE_ADDRESS_BIT */   
                                1, /* READ_BEFORE_WRITE_CHECK_ENABLE */   
                                2, /* TXP */   
                                2, /* TXARD */   
                                3, /* BANK_ADDRESS_WITDH */   
                                1, /* ENABLE_PRECHARGE_TO_IDLE_BANK  */ 
                                0 /* BYPASS_INIT */  )  
                                ZeroIn_DDR2_MON ( .ck            (dram_clk),
                                               .ck_n             (~dram_clk),
                                               .reset            (~reset_n),
                                               .areset           (~reset_n),
                                               .cke              (cke_rank0[1]),
                                               .cs_n             (bcs[1]),
                                               .ras_n            (bras[1]),
                                               .cas_n            (bcas[1]),
                                               .we_n             (bwe[1]),
                                               .ba               (ba),
                                               .a                (addr),
                                               .dq               (dq[7:0]),
                                               .dqs              (dqs),
                                               .ldqs             (),
                                               .ldm              (),
                                               .udqs             (),
                                               .udm              (),
                                               .mode_register_in ());

`endif

`ifdef AXIS_DDR2_MODEL
`else

`ifdef DRAM_SAT
wire[7:0] cs_sel;
reg [7:0] cs_sel_reg;
assign cs_sel = cs_sel_reg;

initial begin
if ( $test$plusargs("fbdimm0_disable")  && ( DS == 0 ) )
 cs_sel_reg = 8'b11111110;
if ( $test$plusargs("fbdimm1_disable")  && ( DS == 1 ) )
 cs_sel_reg = 8'b11111101;
if ( $test$plusargs("fbdimm2_disable")  && ( DS == 2 ) )
 cs_sel_reg = 8'b11111011;
if ( $test$plusargs("fbdimm3_disable")  && ( DS == 3 ) )
 cs_sel_reg = 8'b11110111;
if ( $test$plusargs("fbdimm4_disable")  && ( DS == 4 ) )
 cs_sel_reg = 8'b11101111;
if ( $test$plusargs("fbdimm5_disable")  && ( DS == 5 ) )
 cs_sel_reg = 8'b11011111;
if ( $test$plusargs("fbdimm6_disable")  && ( DS == 6 ) )
 cs_sel_reg = 8'b10111111;
if ( $test$plusargs("fbdimm7_disable")  && ( DS == 7 ) )
 cs_sel_reg = 8'b01111111;
else
 cs_sel_reg = 8'b00000000;

end

`ifdef X8
fbdimm_DIMMx8   fbdimm_DIMMx8 
`else
fbdimm_DIMMx4   fbdimm_DIMMx4 
`endif
                               (.CK (dram_clk),
                               .bCK      (~dram_clk),
                               .CKE      ( cke_rank0[18:1]),
                               .bCS      (bcs[18:1] | (!drams_on ? bcs[18:1] : {18{rs}}) ),
                               .bRAS     (bras[18:1]),
                               .bCAS     (bcas[18:1]),
                               .bWE      (bwe[18:1]),
                               .BA       (ba),
                               .DQ       (dq[63:0]),
                               .CB       (dq[71:64]),
                               .DQS      (dqs[8:0]),
                               .bDQS     (bdqs[8:0]),
                               .DM_RDQS  (dqs[17:9]),
                               .bRDQS    (bdqs[8:0]),
                               .Addr     (addr),
                               .ODT      (odt[18:1]),
                               .term     (term[18:1]),
                               .CS_SEL   (cs_sel[7:0]));


`ifdef DDR2_MONITOR_ON

reg dram_areset;
wire dram_mon_areset = dram_areset;

initial dram_areset=1;

always@(posedge dram_clk)
  dram_areset <= reset;

ddr2_monitor  #( 2,   /* tMRD */
                15,  /* tRFC */
                200, /* tXSRD */
                10,  /* tXSNR */
                9,   /* tRAS */
                3,   /* tCAS */
                3,   /* tRCD */
                2,   /* tCCD */
                12,  /* tRC */
                2,   /* tRRD */
                2,   /* tWTR */
                4,   /* tRTW */
                3,   /* tWR */
                2,   /* tXP */
                2,   /* tXARD */
                3,   /* tRP */
                9,  /* tFAW */
                16,  /* ROW_WIDTH */
                64,  /* DATA WIDTH */
                1,  /* DATA_MASK_WIDTH */
                1,  /* DLL_TRACK_EN */
                1,  /* BURST_TYPE_SEQ */
                4,  /* BURST_LENGTH */
                0,  /* ADDITIVE LATENCY */
                2   /* DATA_STROBE_NUM */ )
 custom_ddr2_monitor(
                .addr    (addr),
                .ba      (ba),
                .cas_bar ( bcas[1]),
                .cke     (cke_rank0[1]),
                .ck      (dram_clk),
                .ck_bar  (~dram_clk),
                .ras_bar (bras[1]),
                .we_bar  (bwe[1]),
                .dqs     (dqs[8:0]),
                .dq      (dq[63:0]),
                .odt     (odt[1]),
                .areset  (dram_mon_areset),
                .cs_bar  (cs_sel | {8{rs}} ),
                .dqs_bar (bdqs)
); 
`endif

`ifdef DRAM_SAT // to be removed later

amb_dram_err_inject  amb_dram_err_inj  (.clk		(dram_clk),
                                        .int_clk	(~dram_clk),
                                        .DRAM_RST_L	(reset),
                                        .DRAM_CS_L	(cs_sel[7:0]),
                                        .DRAM_BA	(ba),
                                        .DRAM_RAS_L	(bras[1]),
                                        .DRAM_CAS_L	(bcas[1]),
                                        .DRAM_WE_L	(bwe[1]),
                                        .DRAM_DQ	(dq[63:0]),
                                        .DRAM_DQS       (dqs[8:0]),
                                        .CHNL_ERR_ENABLE (err_en),
                                        .DRAM_CB	(dq[71:64]),
                			.AMB_L0_STATE	(~amb.init));


`endif

`ifdef STACK_DIMM

`ifdef X8
fbdimm_DIMMx8   fbdimm_DIMMx8_rank2 
`else
fbdimm_DIMMx4   fbdimm_DIMMx4_rank2 
`endif
                               (.CK (dram_clk),
                               .bCK      (~dram_clk),
                               .CKE      (cke_rank1[18:1]),
                               .bCS      (bcs[18:1] | (!drams_on ? bcs[18:1] : {18{~rs}}) ),
                               .bRAS     (bras[18:1]),
                               .bCAS     (bcas[18:1]),
                               .bWE      (bwe[18:1]),
                               .BA       (ba),
                               .DQ       (dq[63:0]),
                               .CB       (dq[71:64]),
                               .DQS      (dqs[8:0]),
                               .bDQS     (bdqs[8:0]),
                               .DM_RDQS  (dqs[17:9]),
                               .bRDQS    (bdqs[8:0]),
                               .Addr     (addr),
                               .ODT      (odt[18:1]),
                               .term     (term[18:1]),
                               .CS_SEL   (cs_sel[7:0]));

`endif // STACK DIMM


//`endif // X4
`endif // DRAM_SAT
`endif // AXIS_DDR2_MODEL



`ifdef STINGRAY 
fbdimm_tasks fbdimm_tasks();
`endif




`ifdef AXIS_FBDIMM_HW
`else
 `ifdef STINGRAY
 `else
 // Initialization and reset sequence
 initial begin
  reset_r = 1'b1;
  #100;
  reset_r = 1'b0;
 end
 `endif //ST
`endif // !AXIS_FBDIMM_HW

endmodule

