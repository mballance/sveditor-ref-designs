// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: niu_zcp_slv.v
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
/*%W%	%G%*/

/*****************************************************************
 *
 * File Name    : niu_zcp_slv.v
 * Author Name  : John Lo
 * Description  : It contains ZCP read/write decoder, registers, 
 *                
 * Parent Module: niu_zcp.v
 * Child  Module: 
 * Interface Mod: 
 * Date Created : 3/26/04
 *
 * Copyright (c) 2020, Sun Microsystems, Inc. 
 * Sun Proprietary and Confidential   
 *
 * Modification :
 * 
 ****************************************************************/


`include  "niu_zcp.h"


module niu_zcp_slv(/*AUTOARG*/
   // Outputs
   zcp_debug_sel, ecc_chk_bypass0, double_bit_err0, single_bit_err0, 
   last_line_err0, second_line_err0, first_line_err0, 
   ecc_chk_bypass1, double_bit_err1, single_bit_err1, last_line_err1, 
   second_line_err1, first_line_err1, ecc_chk_bypass2, 
   double_bit_err2, single_bit_err2, last_line_err2, 
   second_line_err2, first_line_err2, ecc_chk_bypass3, 
   double_bit_err3, single_bit_err3, last_line_err3, 
   second_line_err3, first_line_err3, zcp_pio_ack, zcp_pio_rdata, 
   zcp_pio_err, zcp_pio_intr, handle, fn, default_rdc, table_rdc, 
   zc_rdc, tt_en, zcp_32bit_mode, req_dis, rsp_dis, par_chk_dis, 
   ecc_chk_dis, dmaw_threshold, reset_cfifo0, reset_cfifo1, 
   reset_cfifo2, reset_cfifo3, training_vector, slv_request, 
   slv_tt_index, slv_ram_addr, slv_ram_wdata, slv_ram_be, 
   va_ram_rwen, va_ram_rwen0, va_ram_rwen1, va_ram_rwen2, 
   va_ram_rwen3, va_ram_rwen4, va_ram_rwen5, va_ram_rwen6, 
   va_ram_rwen7, va_ram_ren, va_ram_wen, va_ram_ren0, va_ram_wen0, 
   va_ram_ren1, va_ram_wen1, va_ram_ren2, va_ram_wen2, va_ram_ren3, 
   va_ram_wen3, va_ram_ren4, va_ram_wen4, va_ram_ren5, va_ram_wen5, 
   va_ram_ren6, va_ram_wen6, va_ram_ren7, va_ram_wen7, st_ram_ren, 
   st_ram_wen, dn_ram_ren, dn_ram_wen, cfifo_ren0, cfifo_wen0, 
   cfifo_ren1, cfifo_wen1, cfifo_ren2, cfifo_wen2, cfifo_ren3, 
   cfifo_wen3, tt_offset0, tt_index_start0, tt_index_end0, 
   tt_index_chk0, tt_offset1, tt_index_start1, tt_index_end1, 
   tt_index_chk1, tt_offset2, tt_index_start2, tt_index_end2, 
   tt_index_chk2, tt_offset3, tt_index_start3, tt_index_end3, 
   tt_index_chk3, ds_offset0, ds_offset1, ds_offset2, ds_offset3, 
   chk_bit_data, ram_access_state, 
   // Inputs
   clk, slv_reset, kickoff_tt_reg, ififo_state, tt_state, 
   req_load_state, req_unload_state, rsp_load_state, 
   rsp_unload_state, ififo_overrun, set_tt_program_err, 
   zcp_tt_index_err, slv_tt_index_err, rsp_tt_index_err, va_ram_perr, 
   dn_ram_perr, st_ram_perr, rrfifo_overrun, rrfifo_underrun, 
   rspfifo_uncorr_err, pio_clients_addr, pio_clients_rd, 
   pio_clients_wdata, pio_zcp_sel, zcp_dmc_dat_err0, 
   zcp_dmc_dat_err1, zcp_dmc_dat_err2, zcp_dmc_dat_err3, 
   decode_default_rdc, decode_table_rdc, decode_zc_rdc, tt_rdc_reg, 
   fflp_rdc, rdmc_zcp_func_num, page_handle, slv_accepted, 
   vram_slv_rdata, sram_slv_rdata, dram_slv_rdata, cfifo_slv_rdata0, 
   cfifo_slv_rdata1, cfifo_slv_rdata2, cfifo_slv_rdata3
   );
   
   input                      clk;
   input  [21:0]	      slv_reset;
                              // debug signals
   input 		      kickoff_tt_reg;
   input  [2:0] 	      ififo_state;
   input  [3:0]		      tt_state;
   input  [1:0] 	      req_load_state;
   input  [1:0] 	      req_unload_state;
   input  [3:0] 	      rsp_load_state;
   input  [3:0] 	      rsp_unload_state;
   output [7:0] 	      zcp_debug_sel;
                              // error handeling
   input 		      ififo_overrun;
   input 		      set_tt_program_err;
   input 		      zcp_tt_index_err;
   input 		      slv_tt_index_err;
   input 		      rsp_tt_index_err;
   input 		      va_ram_perr;
   input 		      dn_ram_perr;
   input 		      st_ram_perr;
   input 		      rrfifo_overrun;
   input 		      rrfifo_underrun;
   input 		      rspfifo_uncorr_err;
                              // ecc error control
   output	              ecc_chk_bypass0;     // per fifo ecc_chk disable
   output		      double_bit_err0;
   output		      single_bit_err0;
   output		      last_line_err0;
   output                     second_line_err0;
   output                     first_line_err0;
   output	              ecc_chk_bypass1;     // per fifo ecc_chk disable
   output		      double_bit_err1;
   output		      single_bit_err1;
   output		      last_line_err1;
   output                     second_line_err1;
   output                     first_line_err1;
   output	              ecc_chk_bypass2;     // per fifo ecc_chk disable
   output		      double_bit_err2;
   output		      single_bit_err2;
   output		      last_line_err2;
   output                     second_line_err2;
   output                     first_line_err2;
   output	              ecc_chk_bypass3;     // per fifo ecc_chk disable
   output		      double_bit_err3;
   output		      single_bit_err3;
   output		      last_line_err3;
   output                     second_line_err3;
   output                     first_line_err3;
                              // pio broadcast signals
// vlint flag_dangling_net_within_module off
// vlint flag_input_port_not_connected off
// vlint flag_net_has_no_load off
   input  [19:0] 	      pio_clients_addr;
// vlint flag_dangling_net_within_module on
// vlint flag_input_port_not_connected on
// vlint flag_net_has_no_load on
   input 		      pio_clients_rd;
   input  [31:0] 	      pio_clients_wdata;
   input 		      pio_zcp_sel;
   output 		      zcp_pio_ack;
   output [63:0] 	      zcp_pio_rdata;
   output 		      zcp_pio_err;
   output 		      zcp_pio_intr;
   input 		      zcp_dmc_dat_err0;
   input 		      zcp_dmc_dat_err1;
   input 		      zcp_dmc_dat_err2;
   input 		      zcp_dmc_dat_err3;
                              // rdc stuff
   input  		      decode_default_rdc;
   input  		      decode_table_rdc;
   input  		      decode_zc_rdc;
   input  [7:0] 	      tt_rdc_reg;
   input  [7:0] 	      fflp_rdc;
   input  [31:0]	      rdmc_zcp_func_num;
   input  [`PMS15:0] 	      page_handle;  // 20 bit per handle
   output [19:0] 	      handle;
   output [1:0] 	      fn;
   output [4:0]		      default_rdc;
   output [4:0]		      table_rdc;
   output [4:0]		      zc_rdc;
                              // config stuff
   output 		      tt_en;
   output 		      zcp_32bit_mode;
   output 		      req_dis;
   output 		      rsp_dis;
   output 		      par_chk_dis;
   output 		      ecc_chk_dis;
   output [10:0] 	      dmaw_threshold;
   output 		      reset_cfifo0;
   output 		      reset_cfifo1;
   output 		      reset_cfifo2;
   output 		      reset_cfifo3;
   output [31:0] 	      training_vector;
                              // slave read/write
   output 		      slv_request;
   input 		      slv_accepted;
   output [11:0] 	      slv_tt_index;
   output [10:0] 	      slv_ram_addr;
   output [`DN_R] 	      slv_ram_wdata;
   output [16:0] 	      slv_ram_be;
   input  [1023:0] 	      vram_slv_rdata;
                              //
   output 		      va_ram_rwen;
   output 		      va_ram_rwen0;
   output 		      va_ram_rwen1;
   output 		      va_ram_rwen2;
   output 		      va_ram_rwen3;
   output 		      va_ram_rwen4;
   output 		      va_ram_rwen5;
   output 		      va_ram_rwen6;
   output 		      va_ram_rwen7;
   output 		      va_ram_ren ;
   output 		      va_ram_wen ;
   output 		      va_ram_ren0;
   output 		      va_ram_wen0;
   output 		      va_ram_ren1;
   output 		      va_ram_wen1;
   output 		      va_ram_ren2;
   output 		      va_ram_wen2;
   output 		      va_ram_ren3;
   output 		      va_ram_wen3;
   output 		      va_ram_ren4;
   output 		      va_ram_wen4;
   output 		      va_ram_ren5;
   output 		      va_ram_wen5;
   output 		      va_ram_ren6;
   output 		      va_ram_wen6;
   output 		      va_ram_ren7;
   output 		      va_ram_wen7;
                              //
   output 		      st_ram_ren;
   output 		      st_ram_wen;
   input  [`ST_R] 	      sram_slv_rdata;
   output 		      dn_ram_ren;
   output 		      dn_ram_wen;
   input  [`DN_R] 	      dram_slv_rdata;
   output 		      cfifo_ren0;
   output 		      cfifo_wen0;
   input  [`CFIFO_W_R] 	      cfifo_slv_rdata0;
   output 		      cfifo_ren1;
   output 		      cfifo_wen1;
   input  [`CFIFO_W_R] 	      cfifo_slv_rdata1;
   output 		      cfifo_ren2;
   output 		      cfifo_wen2;
   input  [`CFIFO_W_R] 	      cfifo_slv_rdata2;
   output 		      cfifo_ren3;
   output 		      cfifo_wen3;
   input  [`CFIFO_W_R] 	      cfifo_slv_rdata3;
                              //
   output [7:0] 	      tt_offset0      ;
   output [9:0] 	      tt_index_start0 ;
   output [9:0] 	      tt_index_end0   ;
   output 		      tt_index_chk0   ;
   output [7:0] 	      tt_offset1      ;
   output [9:0] 	      tt_index_start1 ;
   output [9:0] 	      tt_index_end1   ;
   output 		      tt_index_chk1   ;
   output [7:0] 	      tt_offset2      ;
   output [9:0] 	      tt_index_start2 ;
   output [9:0] 	      tt_index_end2   ;
   output 		      tt_index_chk2   ;
   output [7:0] 	      tt_offset3      ;
   output [9:0] 	      tt_index_start3 ;
   output [9:0] 	      tt_index_end3   ;
   output 		      tt_index_chk3   ;
   output [9:0] 	      ds_offset0      ;
   output [9:0] 	      ds_offset1      ;
   output [9:0] 	      ds_offset2      ;
   output [9:0] 	      ds_offset3      ;
   output [16:0] 	      chk_bit_data    ;
   output [2:0]	              ram_access_state;	// From niu_zcp_ram_access_sm of niu_zcp_ram_access_sm.v
   

   /*AUTOWIRE*/
   // Beginning of automatic wires (for undeclared instantiated-module outputs)
   wire			ld_ram2reg;		// From niu_zcp_ram_access_sm of niu_zcp_ram_access_sm.v
   wire			ram_ren;		// From niu_zcp_ram_access_sm of niu_zcp_ram_access_sm.v
   wire			ram_wen;		// From niu_zcp_ram_access_sm of niu_zcp_ram_access_sm.v
   // End of automatics

   //
   wire  [21:0]		      reset   = slv_reset;
   wire 		      reset10 = reset[10];
   wire  	              ififo_overrun_stat;
   wire  [31:0] 	      ecc_err_ctl0;
   wire  [31:0] 	      ecc_err_ctl1;
   wire  [31:0] 	      ecc_err_ctl2;
   wire  [31:0] 	      ecc_err_ctl3;
   wire 	              ecc_chk_bypass0;     // per fifo ecc_chk disable
   wire 		      double_bit_err0;
   wire 		      single_bit_err0;
   wire 		      last_line_err0;
   wire                       second_line_err0;
   wire                       first_line_err0;
   wire 	              ecc_chk_bypass1;     // per fifo ecc_chk disable
   wire 		      double_bit_err1;
   wire 		      single_bit_err1;
   wire 		      last_line_err1;
   wire                       second_line_err1;
   wire                       first_line_err1;
   wire 	              ecc_chk_bypass2;     // per fifo ecc_chk disable
   wire 		      double_bit_err2;
   wire 		      single_bit_err2;
   wire 		      last_line_err2;
   wire                       second_line_err2;
   wire                       first_line_err2;
   wire 	              ecc_chk_bypass3;     // per fifo ecc_chk disable
   wire 		      double_bit_err3;
   wire 		      single_bit_err3;
   wire 		      last_line_err3;
   wire                       second_line_err3;
   wire                       first_line_err3;
                              // 
   wire 		      va_ram_perr;
   wire 		      dn_ram_perr;
   wire 		      st_ram_perr;
   wire 		      va_ram_perr_pls;
   wire 		      dn_ram_perr_pls;
   wire 		      st_ram_perr_pls;
   wire 		      va_ram_perr_stat;
   wire 		      dn_ram_perr_stat;
   wire 		      st_ram_perr_stat;
   wire 		      zcp_dmc_dat_err0;
   wire 		      zcp_dmc_dat_err1;
   wire 		      zcp_dmc_dat_err2;
   wire 		      zcp_dmc_dat_err3;
   reg 			      zcp_pio_intr;
   reg 			      rd_wr;
   reg 			      zcp_sel;
   // vlint flag_variable_assign_never_reference off
   // vlint flag_dangling_net_within_module off
   // vlint flag_net_has_no_load off
   reg  [19:0] 		      addr_reg;
   // vlint flag_net_has_no_load on
   // vlint flag_dangling_net_within_module on
   // vlint flag_variable_assign_never_reference on
   reg  [31:0] 		      wr_data;
   reg  [63:0] 		      zcp_pio_rdata;
   reg 			      zcp_sel_lead_d1;
   reg 			      zcp_sel_lead_d2;
   reg 			      ackgen;
   reg 			      zcp_pio_ack;
   reg 			      zcp_pio_err;
   
   wire 		      addr_err;
                              //
   reg 			      non_qualified_addr_err;
   reg  [31:0] 		      rd_data;
   reg 			      ld_config1         ;
   reg 			      ld_status          ;
   reg 			      w1c_status         ;
   reg 			      ld_mask            ;
   reg 			      ld_buf4_region_ctl ;
   reg 			      ld_buf8_region_ctl ;
   reg 			      ld_buf16_region_ctl;
   reg 			      ld_buf32_region_ctl;
   reg 			      ld_ds4_region_ctl  ;
   reg 			      ld_ds8_region_ctl  ;
   reg 			      ld_ds16_region_ctl ;
   reg 			      ld_ds32_region_ctl ;
   reg 			      ld_ram_data0       ;
   reg 			      ld_ram_data1       ;
   reg 			      ld_ram_data2       ;
   reg 			      ld_ram_data3       ;
   reg 			      ld_ram_data4       ;
   reg 			      ld_ram_be          ;
   reg 			      ld_ram_addr        ;
   reg 			      ld_chk_bit_data    ;
   reg 			      ld_reset_cfifo     ;
   reg 			      ld_ecc_err_ctl0;
   reg 			      ld_ecc_err_ctl1;
   reg 			      ld_ecc_err_ctl2;
   reg 			      ld_ecc_err_ctl3;
   reg 			      ld_training_vector;
                              // ram selection 
   reg [`DN_R] 		      ram_rdata      ; 
   reg 			      va_ram_rwen    ;
   reg 			      va_ram_rwen0   ;
   reg 			      va_ram_rwen1   ;
   reg 			      va_ram_rwen2   ;
   reg 			      va_ram_rwen3   ;
   reg 			      va_ram_rwen4   ;
   reg 			      va_ram_rwen5   ;
   reg 			      va_ram_rwen6   ;
   reg 			      va_ram_rwen7   ;
   reg 			      va_ram_ren     ;
   reg 			      va_ram_ren0    ;
   reg 			      va_ram_ren1    ;
   reg 			      va_ram_ren2    ;
   reg 			      va_ram_ren3    ;
   reg 			      va_ram_ren4    ;
   reg 			      va_ram_ren5    ;
   reg 			      va_ram_ren6    ;
   reg 			      va_ram_ren7    ;
   reg 			      st_ram_ren     ;
   reg 			      dn_ram_ren     ;
   reg 			      cfifo_ren0     ;
   reg 			      cfifo_ren1     ;
   reg 			      cfifo_ren2     ;
   reg 			      cfifo_ren3     ;
   reg 			      va_ram_wen     ;
   reg 			      va_ram_wen0    ;
   reg 			      va_ram_wen1    ;
   reg 			      va_ram_wen2    ;
   reg 			      va_ram_wen3    ;
   reg 			      va_ram_wen4    ;
   reg 			      va_ram_wen5    ;
   reg 			      va_ram_wen6    ;
   reg 			      va_ram_wen7    ;
   reg 			      st_ram_wen     ;
   reg 			      dn_ram_wen     ;
   reg 			      cfifo_wen0     ;
   reg 			      cfifo_wen1     ;
   reg 			      cfifo_wen2     ;
   reg 			      cfifo_wen3     ;
   wire [31:0] 		      config1;
   wire [31:0] 		      status_dout;
   wire [31:0] 		      mask;
   wire [31:0] 		      buf4_region_ctl;
   wire [31:0] 		      buf8_region_ctl;
   wire [31:0] 		      buf16_region_ctl;
   wire [31:0] 		      buf32_region_ctl;
   wire [31:0] 		      ds4_region_ctl;
   wire [31:0] 		      ds8_region_ctl;
   wire [31:0] 		      ds16_region_ctl;
   wire [31:0] 		      ds32_region_ctl;
   
   wire [`ST_R] 	      sram_slv_rdata;
   wire [`DN_R] 	      dram_slv_rdata;
   wire [`CFIFO_W_R] 	      cfifo_slv_rdata0;
   wire [`CFIFO_W_R] 	      cfifo_slv_rdata1;
   wire [`CFIFO_W_R] 	      cfifo_slv_rdata2;
   wire [`CFIFO_W_R] 	      cfifo_slv_rdata3;

   // vlint flag_dangling_net_within_module off
   // vlint flag_net_has_no_load off
   // vlint flag_undeclared_name_in_module off
   wire 		      ld_ram_addr_lead;
   wire [31:0] 		      ram_addr;
   // vlint flag_dangling_net_within_module on
   // vlint flag_net_has_no_load on
   // vlint flag_undeclared_name_in_module on

   wire [31:0] 		      ram_data0;
   wire [31:0] 		      ram_data1;
   wire [31:0] 		      ram_data2;
   wire [31:0] 		      ram_data3;
   wire [7:0] 		      ram_data4;
   wire [`DN_R] 	      ram_data;
   wire [16:0] 		      ram_be;
   wire [`DN_R] 	      slv_ram_wdata;
   wire [16:0] 	              slv_ram_be;
   wire 		      zcp_dmc_dat_err0_stat;
   wire 		      zcp_dmc_dat_err1_stat;
   wire 		      zcp_dmc_dat_err2_stat;
   wire 		      zcp_dmc_dat_err3_stat;
   wire [7:0] 		      tt_rdc_reg;
   wire [7:0] 		      fflp_rdc;
   wire [3:0]		      tt_state;
   wire [1:0] 		      req_load_state;
   wire [1:0] 		      req_unload_state;
   wire [3:0] 		      rsp_load_state;
   wire [3:0] 		      rsp_unload_state;
   wire 		      zcp_tt_index_err_stat;
   wire 		      slv_tt_index_err_stat;
   wire 		      rsp_tt_index_err_stat;
   wire 		      tt_program_err_stat;
   wire 		      rspfifo_uncorr_err_stat;
   wire 		      rrfifo_overrun_stat;
   wire 		      rrfifo_underrun_stat;
   wire 		      ld_ram_addr_trail;
   // rdc specific
   // vlint flag_dangling_net_within_module off
   // vlint flag_net_has_no_load off
   wire [7:0] 		      sel_rdc;
   // vlint flag_dangling_net_within_module on
   // vlint flag_net_has_no_load on
   reg  [3:0]		      rdc ;
   wire [3:0] 		      rdc0;
   wire [3:0] 		      rdc1;
   wire [3:0] 		      rdc2;
   wire [3:0] 		      rdc3;
   wire [3:0] 		      rdc4;
   wire [3:0] 		      rdc5;
   wire [3:0] 		      rdc6;
   wire [3:0] 		      rdc7;
   wire [3:0] 		      rdc8;
   wire [3:0] 		      rdc9;
   wire [3:0] 		      rdc10;
   wire [3:0] 		      rdc11;
   wire [3:0] 		      rdc12;
   wire [3:0] 		      rdc13;
   wire [3:0] 		      rdc14;
   wire [3:0] 		      rdc15;
   wire [3:0] 		      rdc16;
   wire [3:0] 		      rdc17;
   wire [3:0] 		      rdc18;
   wire [3:0] 		      rdc19;
   wire [3:0] 		      rdc20;
   wire [3:0] 		      rdc21;
   wire [3:0] 		      rdc22;
   wire [3:0] 		      rdc23;
   wire [3:0] 		      rdc24;
   wire [3:0] 		      rdc25;
   wire [3:0] 		      rdc26;
   wire [3:0] 		      rdc27;
   wire [3:0] 		      rdc28;
   wire [3:0] 		      rdc29;
   wire [3:0] 		      rdc30;
   wire [3:0] 		      rdc31;
   wire [3:0] 		      rdc32;
   wire [3:0] 		      rdc33;
   wire [3:0] 		      rdc34;
   wire [3:0] 		      rdc35;
   wire [3:0] 		      rdc36;
   wire [3:0] 		      rdc37;
   wire [3:0] 		      rdc38;
   wire [3:0] 		      rdc39;
   wire [3:0] 		      rdc40;
   wire [3:0] 		      rdc41;
   wire [3:0] 		      rdc42;
   wire [3:0] 		      rdc43;
   wire [3:0] 		      rdc44;
   wire [3:0] 		      rdc45;
   wire [3:0] 		      rdc46;
   wire [3:0] 		      rdc47;
   wire [3:0] 		      rdc48;
   wire [3:0] 		      rdc49;
   wire [3:0] 		      rdc50;
   wire [3:0] 		      rdc51;
   wire [3:0] 		      rdc52;
   wire [3:0] 		      rdc53;
   wire [3:0] 		      rdc54;
   wire [3:0] 		      rdc55;
   wire [3:0] 		      rdc56;
   wire [3:0] 		      rdc57;
   wire [3:0] 		      rdc58;
   wire [3:0] 		      rdc59;
   wire [3:0] 		      rdc60;
   wire [3:0] 		      rdc61;
   wire [3:0] 		      rdc62;
   wire [3:0] 		      rdc63;
   wire [3:0] 		      rdc64;
   wire [3:0] 		      rdc65;
   wire [3:0] 		      rdc66;
   wire [3:0] 		      rdc67;
   wire [3:0] 		      rdc68;
   wire [3:0] 		      rdc69;
   wire [3:0] 		      rdc70;
   wire [3:0] 		      rdc71;
   wire [3:0] 		      rdc72;
   wire [3:0] 		      rdc73;
   wire [3:0] 		      rdc74;
   wire [3:0] 		      rdc75;
   wire [3:0] 		      rdc76;
   wire [3:0] 		      rdc77;
   wire [3:0] 		      rdc78;
   wire [3:0] 		      rdc79;
   wire [3:0] 		      rdc80;
   wire [3:0] 		      rdc81;
   wire [3:0] 		      rdc82;
   wire [3:0] 		      rdc83;
   wire [3:0] 		      rdc84;
   wire [3:0] 		      rdc85;
   wire [3:0] 		      rdc86;
   wire [3:0] 		      rdc87;
   wire [3:0] 		      rdc88;
   wire [3:0] 		      rdc89;
   wire [3:0] 		      rdc90;
   wire [3:0] 		      rdc91;
   wire [3:0] 		      rdc92;
   wire [3:0] 		      rdc93;
   wire [3:0] 		      rdc94;
   wire [3:0] 		      rdc95;
   wire [3:0] 		      rdc96;
   wire [3:0] 		      rdc97;
   wire [3:0] 		      rdc98;
   wire [3:0] 		      rdc99;
   wire [3:0] 		      rdc100;
   wire [3:0] 		      rdc101;
   wire [3:0] 		      rdc102;
   wire [3:0] 		      rdc103;
   wire [3:0] 		      rdc104;
   wire [3:0] 		      rdc105;
   wire [3:0] 		      rdc106;
   wire [3:0] 		      rdc107;
   wire [3:0] 		      rdc108;
   wire [3:0] 		      rdc109;
   wire [3:0] 		      rdc110;
   wire [3:0] 		      rdc111;
   wire [3:0] 		      rdc112;
   wire [3:0] 		      rdc113;
   wire [3:0] 		      rdc114;
   wire [3:0] 		      rdc115;
   wire [3:0] 		      rdc116;
   wire [3:0] 		      rdc117;
   wire [3:0] 		      rdc118;
   wire [3:0] 		      rdc119;
   wire [3:0] 		      rdc120;
   wire [3:0] 		      rdc121;
   wire [3:0] 		      rdc122;
   wire [3:0] 		      rdc123;
   wire [3:0] 		      rdc124;
   wire [3:0] 		      rdc125;
   wire [3:0] 		      rdc126;
   wire [3:0] 		      rdc127;

   reg                        ld_rdc0;
   reg                        ld_rdc1;
   reg                        ld_rdc2;
   reg                        ld_rdc3;
   reg                        ld_rdc4;
   reg                        ld_rdc5;
   reg                        ld_rdc6;
   reg                        ld_rdc7;
   reg                        ld_rdc8;
   reg                        ld_rdc9;
   reg                        ld_rdc10;
   reg                        ld_rdc11;
   reg                        ld_rdc12;
   reg                        ld_rdc13;
   reg                        ld_rdc14;
   reg                        ld_rdc15;
   reg                        ld_rdc16;
   reg                        ld_rdc17;
   reg                        ld_rdc18;
   reg                        ld_rdc19;
   reg                        ld_rdc20;
   reg                        ld_rdc21;
   reg                        ld_rdc22;
   reg                        ld_rdc23;
   reg                        ld_rdc24;
   reg                        ld_rdc25;
   reg                        ld_rdc26;
   reg                        ld_rdc27;
   reg                        ld_rdc28;
   reg                        ld_rdc29;
   reg                        ld_rdc30;
   reg                        ld_rdc31;
   reg                        ld_rdc32;
   reg                        ld_rdc33;
   reg                        ld_rdc34;
   reg                        ld_rdc35;
   reg                        ld_rdc36;
   reg                        ld_rdc37;
   reg                        ld_rdc38;
   reg                        ld_rdc39;
   reg                        ld_rdc40;
   reg                        ld_rdc41;
   reg                        ld_rdc42;
   reg                        ld_rdc43;
   reg                        ld_rdc44;
   reg                        ld_rdc45;
   reg                        ld_rdc46;
   reg                        ld_rdc47;
   reg                        ld_rdc48;
   reg                        ld_rdc49;
   reg                        ld_rdc50;
   reg                        ld_rdc51;
   reg                        ld_rdc52;
   reg                        ld_rdc53;
   reg                        ld_rdc54;
   reg                        ld_rdc55;
   reg                        ld_rdc56;
   reg                        ld_rdc57;
   reg                        ld_rdc58;
   reg                        ld_rdc59;
   reg                        ld_rdc60;
   reg                        ld_rdc61;
   reg                        ld_rdc62;
   reg                        ld_rdc63;
   reg                        ld_rdc64;
   reg                        ld_rdc65;
   reg                        ld_rdc66;
   reg                        ld_rdc67;
   reg                        ld_rdc68;
   reg                        ld_rdc69;
   reg                        ld_rdc70;
   reg                        ld_rdc71;
   reg                        ld_rdc72;
   reg                        ld_rdc73;
   reg                        ld_rdc74;
   reg                        ld_rdc75;
   reg                        ld_rdc76;
   reg                        ld_rdc77;
   reg                        ld_rdc78;
   reg                        ld_rdc79;
   reg                        ld_rdc80;
   reg                        ld_rdc81;
   reg                        ld_rdc82;
   reg                        ld_rdc83;
   reg                        ld_rdc84;
   reg                        ld_rdc85;
   reg                        ld_rdc86;
   reg                        ld_rdc87;
   reg                        ld_rdc88;
   reg                        ld_rdc89;
   reg                        ld_rdc90;
   reg                        ld_rdc91;
   reg                        ld_rdc92;
   reg                        ld_rdc93;
   reg                        ld_rdc94;
   reg                        ld_rdc95;
   reg                        ld_rdc96;
   reg                        ld_rdc97;
   reg                        ld_rdc98;
   reg                        ld_rdc99;
   reg                        ld_rdc100;
   reg                        ld_rdc101;
   reg                        ld_rdc102;
   reg                        ld_rdc103;
   reg                        ld_rdc104;
   reg                        ld_rdc105;
   reg                        ld_rdc106;
   reg                        ld_rdc107;
   reg                        ld_rdc108;
   reg                        ld_rdc109;
   reg                        ld_rdc110;
   reg                        ld_rdc111;
   reg                        ld_rdc112;
   reg                        ld_rdc113;
   reg                        ld_rdc114;
   reg                        ld_rdc115;
   reg                        ld_rdc116;
   reg                        ld_rdc117;
   reg                        ld_rdc118;
   reg                        ld_rdc119;
   reg                        ld_rdc120;
   reg                        ld_rdc121;
   reg                        ld_rdc122;
   reg                        ld_rdc123;
   reg                        ld_rdc124;
   reg                        ld_rdc125;
   reg                        ld_rdc126;
   reg                        ld_rdc127;

   
 /* ----------- Read and Write logic ------------------------ */
   // regiser pio input signals
   always @ (posedge clk) begin rd_wr    <= pio_clients_rd; end
   always @ (posedge clk) begin zcp_sel  <= pio_zcp_sel; end
   always @ (posedge clk) begin addr_reg <= pio_clients_addr[19:0]; end
   always @ (posedge clk) begin wr_data  <= pio_clients_wdata[31:0]; end
   
   // vlint flag_dangling_net_within_module off
   // vlint flag_net_has_no_load off
   wire      zcp_sel_lead;
   wire      zcp_sel_trail;
   wire      rd_en   = zcp_sel       &   rd_wr;
   wire      rac_ok  = zcp_sel_lead  &   rd_wr;
   // vlint flag_dangling_net_within_module on
   // vlint flag_net_has_no_load on
   wire      wr_en   = zcp_sel_lead  & (~rd_wr) & (~addr_reg[2]); // prohibit illegal 32bit write

   zcp_pls_gen2 zcp_sel_pls_gen2(.sig_in(zcp_sel),
                         .clk(clk),
                         .lead(zcp_sel_lead),
                         .trail(zcp_sel_trail));

   // register pio output signals
   wire [31:0] rd_data_temp = addr_reg[2] ? 32'b0 : rd_data; // reserved field read. 
   
   always @ (posedge clk) begin zcp_pio_rdata  <= {32'b0,rd_data_temp[31:0]}; end
   always @ (posedge clk) 
      begin zcp_sel_lead_d1  <= zcp_sel_lead; 
            zcp_sel_lead_d2  <= zcp_sel_lead_d1;
            ackgen           <= zcp_sel_lead_d2;
            zcp_pio_ack      <= ackgen;
      end

   assign    addr_err = non_qualified_addr_err & ackgen;

   always @ (posedge clk) begin zcp_pio_err  <= addr_err; end

always @ (/*AUTOSENSE*/addr_reg or buf16_region_ctl
	  or buf32_region_ctl or buf4_region_ctl or buf8_region_ctl
	  or chk_bit_data or config1 or ds16_region_ctl
	  or ds32_region_ctl or ds4_region_ctl or ds8_region_ctl
	  or ecc_err_ctl0 or ecc_err_ctl1 or ecc_err_ctl2
	  or ecc_err_ctl3 or ififo_state or kickoff_tt_reg or mask
	  or ram_addr or ram_be or ram_data0 or ram_data1 or ram_data2
	  or ram_data3 or ram_data4 or rdc0 or rdc1 or rdc10 or rdc100
	  or rdc101 or rdc102 or rdc103 or rdc104 or rdc105 or rdc106
	  or rdc107 or rdc108 or rdc109 or rdc11 or rdc110 or rdc111
	  or rdc112 or rdc113 or rdc114 or rdc115 or rdc116 or rdc117
	  or rdc118 or rdc119 or rdc12 or rdc120 or rdc121 or rdc122
	  or rdc123 or rdc124 or rdc125 or rdc126 or rdc127 or rdc13
	  or rdc14 or rdc15 or rdc16 or rdc17 or rdc18 or rdc19
	  or rdc2 or rdc20 or rdc21 or rdc22 or rdc23 or rdc24
	  or rdc25 or rdc26 or rdc27 or rdc28 or rdc29 or rdc3
	  or rdc30 or rdc31 or rdc32 or rdc33 or rdc34 or rdc35
	  or rdc36 or rdc37 or rdc38 or rdc39 or rdc4 or rdc40
	  or rdc41 or rdc42 or rdc43 or rdc44 or rdc45 or rdc46
	  or rdc47 or rdc48 or rdc49 or rdc5 or rdc50 or rdc51
	  or rdc52 or rdc53 or rdc54 or rdc55 or rdc56 or rdc57
	  or rdc58 or rdc59 or rdc6 or rdc60 or rdc61 or rdc62
	  or rdc63 or rdc64 or rdc65 or rdc66 or rdc67 or rdc68
	  or rdc69 or rdc7 or rdc70 or rdc71 or rdc72 or rdc73
	  or rdc74 or rdc75 or rdc76 or rdc77 or rdc78 or rdc79
	  or rdc8 or rdc80 or rdc81 or rdc82 or rdc83 or rdc84
	  or rdc85 or rdc86 or rdc87 or rdc88 or rdc89 or rdc9
	  or rdc90 or rdc91 or rdc92 or rdc93 or rdc94 or rdc95
	  or rdc96 or rdc97 or rdc98 or rdc99 or req_load_state
	  or req_unload_state or reset_cfifo0 or reset_cfifo1
	  or reset_cfifo2 or reset_cfifo3 or rsp_load_state
	  or rsp_unload_state or status_dout or training_vector
	  or tt_state or wr_en)
  begin
            non_qualified_addr_err = 0;
            rd_data            = 32'hDEADBEEF;
            ld_config1         = 0;
            ld_status          = 0;
            w1c_status         = 0;
            ld_mask            = 0;
            ld_buf4_region_ctl = 0;
            ld_buf8_region_ctl = 0;
            ld_buf16_region_ctl= 0;
            ld_buf32_region_ctl= 0;
            ld_ds4_region_ctl  = 0;
            ld_ds8_region_ctl  = 0;
            ld_ds16_region_ctl = 0;
            ld_ds32_region_ctl = 0;
            ld_ram_data0       = 0;
            ld_ram_data1       = 0;
            ld_ram_data2       = 0;
            ld_ram_data3       = 0;
            ld_ram_data4       = 0;
            ld_ram_be          = 0;
            ld_ram_addr        = 0;
            ld_chk_bit_data    = 0;
            ld_reset_cfifo     = 0;
            ld_ecc_err_ctl0    = 0;
            ld_ecc_err_ctl1    = 0;
            ld_ecc_err_ctl2    = 0;
            ld_ecc_err_ctl3    = 0;
            ld_training_vector = 0;
            // ram selection 
            ld_rdc0           = 0;
            ld_rdc1           = 0;
            ld_rdc2           = 0;
            ld_rdc3           = 0;
            ld_rdc4           = 0;
            ld_rdc5           = 0;
            ld_rdc6           = 0;
            ld_rdc7           = 0;
            ld_rdc8           = 0;
            ld_rdc9           = 0;
            ld_rdc10          = 0;
            ld_rdc11          = 0;
            ld_rdc12          = 0;
            ld_rdc13          = 0;
            ld_rdc14          = 0;
            ld_rdc15          = 0;
            ld_rdc16          = 0;
            ld_rdc17          = 0;
            ld_rdc18          = 0;
            ld_rdc19          = 0;
            ld_rdc20          = 0;
            ld_rdc21          = 0;
            ld_rdc22          = 0;
            ld_rdc23          = 0;
            ld_rdc24          = 0;
            ld_rdc25          = 0;
            ld_rdc26          = 0;
            ld_rdc27          = 0;
            ld_rdc28          = 0;
            ld_rdc29          = 0;
            ld_rdc30          = 0;
            ld_rdc31          = 0;
            ld_rdc32          = 0;
            ld_rdc33          = 0;
            ld_rdc34          = 0;
            ld_rdc35          = 0;
            ld_rdc36          = 0;
            ld_rdc37          = 0;
            ld_rdc38          = 0;
            ld_rdc39          = 0;
            ld_rdc40          = 0;
            ld_rdc41          = 0;
            ld_rdc42          = 0;
            ld_rdc43          = 0;
            ld_rdc44          = 0;
            ld_rdc45          = 0;
            ld_rdc46          = 0;
            ld_rdc47          = 0;
            ld_rdc48          = 0;
            ld_rdc49          = 0;
            ld_rdc50          = 0;
            ld_rdc51          = 0;
            ld_rdc52          = 0;
            ld_rdc53          = 0;
            ld_rdc54          = 0;
            ld_rdc55          = 0;
            ld_rdc56          = 0;
            ld_rdc57          = 0;
            ld_rdc58          = 0;
            ld_rdc59          = 0;
            ld_rdc60          = 0;
            ld_rdc61          = 0;
            ld_rdc62          = 0;
            ld_rdc63          = 0;
            ld_rdc64          = 0;
            ld_rdc65          = 0;
            ld_rdc66          = 0;
            ld_rdc67          = 0;
            ld_rdc68          = 0;
            ld_rdc69          = 0;
            ld_rdc70          = 0;
            ld_rdc71          = 0;
            ld_rdc72          = 0;
            ld_rdc73          = 0;
            ld_rdc74          = 0;
            ld_rdc75          = 0;
            ld_rdc76          = 0;
            ld_rdc77          = 0;
            ld_rdc78          = 0;
            ld_rdc79          = 0;
            ld_rdc80          = 0;
            ld_rdc81          = 0;
            ld_rdc82          = 0;
            ld_rdc83          = 0;
            ld_rdc84          = 0;
            ld_rdc85          = 0;
            ld_rdc86          = 0;
            ld_rdc87          = 0;
            ld_rdc88          = 0;
            ld_rdc89          = 0;
            ld_rdc90          = 0;
            ld_rdc91          = 0;
            ld_rdc92          = 0;
            ld_rdc93          = 0;
            ld_rdc94          = 0;
            ld_rdc95          = 0;
            ld_rdc96          = 0;
            ld_rdc97          = 0;
            ld_rdc98          = 0;
            ld_rdc99          = 0;
            ld_rdc100          = 0;
            ld_rdc101          = 0;
            ld_rdc102          = 0;
            ld_rdc103          = 0;
            ld_rdc104          = 0;
            ld_rdc105          = 0;
            ld_rdc106          = 0;
            ld_rdc107          = 0;
            ld_rdc108          = 0;
            ld_rdc109          = 0;
            ld_rdc110          = 0;
            ld_rdc111          = 0;
            ld_rdc112          = 0;
            ld_rdc113          = 0;
            ld_rdc114          = 0;
            ld_rdc115          = 0;
            ld_rdc116          = 0;
            ld_rdc117          = 0;
            ld_rdc118          = 0;
            ld_rdc119          = 0;
            ld_rdc120          = 0;
            ld_rdc121          = 0;
            ld_rdc122          = 0;
            ld_rdc123          = 0;
            ld_rdc124          = 0;
            ld_rdc125          = 0;
            ld_rdc126          = 0;
            ld_rdc127          = 0;

/* ----------------------------------------------- */     
    if (~addr_reg[16]) 
      case ({addr_reg[11:3],3'b0}) // synopsys parallel_case full_case infer_mux
        12'h000:begin // Config1 Register 
                ld_config1         = wr_en;
                rd_data            = config1;
                end
 
 /* --- Functional status register w/ w1c ---- */
        12'h008:begin // Status Register
                w1c_status         = wr_en;
                rd_data            = status_dout;
                end
  
        12'h010:begin // Mask Register
                ld_mask            = wr_en;
                rd_data            = mask;
                end
       
 /* --- tt va_ram access control registers --- */
        12'h018:begin
                ld_buf4_region_ctl = wr_en;
                rd_data            = buf4_region_ctl;
                end
       
        12'h020:begin
                ld_buf8_region_ctl = wr_en;
                rd_data            = buf8_region_ctl;
                end
       
        12'h028:begin
                ld_buf16_region_ctl= wr_en;
                rd_data            = buf16_region_ctl;
                end
       
        12'h030:begin
                ld_buf32_region_ctl= wr_en;
                rd_data            = buf32_region_ctl;
                end
       
 /* --- dn&st ram access control registers --- */
        12'h038:begin
                ld_ds4_region_ctl = wr_en;
                rd_data            = ds4_region_ctl;
                end
       
        12'h040:begin
                ld_ds8_region_ctl = wr_en;
                rd_data            = ds8_region_ctl;
                end
       
        12'h048:begin
                ld_ds16_region_ctl= wr_en;
                rd_data            = ds16_region_ctl;
                end
       
        12'h050:begin
                ld_ds32_region_ctl= wr_en;
                rd_data            = ds32_region_ctl;
                end
       
 /* ------ zcp ram access data register ------ */
        12'h058:begin // 
                ld_ram_data0       = wr_en;
                rd_data            = ram_data0[31:0];
                end
       
        12'h060:begin // 
                ld_ram_data1       = wr_en;
                rd_data            = ram_data1[31:0];
                end
       
        12'h068:begin // 
                ld_ram_data2       = wr_en;
                rd_data            = ram_data2[31:0];
                end
       
        12'h070:begin // 
                ld_ram_data3       = wr_en;
                rd_data            = ram_data3[31:0];
                end
  
        12'h078:begin // 
                ld_ram_data4       = wr_en;
                rd_data            = {24'b0,ram_data4[7:0]};
                end

 /* ------ zcp ram access bit enable register ------ */
        12'h080:begin // 
                ld_ram_be          = wr_en;
                rd_data            = {15'b0,ram_be[16:0]};
                end
       
        12'h088:begin // 
                ld_ram_addr        = wr_en;
                rd_data            = ram_addr[31:0];
                end
  
 /* -------- par data register ------------------- */
        12'h090:begin // 
                ld_chk_bit_data    = wr_en;
                rd_data            = {15'b0,chk_bit_data};
                end

 /* -------- reset cfifo register ---------------- */
        12'h098:begin // 
                ld_reset_cfifo     = wr_en;
                rd_data            = {28'b0,reset_cfifo3,reset_cfifo2,reset_cfifo1,reset_cfifo0};
                end

 /* -------- ecc_err_ctl0 ------------------------ */
        12'h0a0:begin // 
                ld_ecc_err_ctl0    = wr_en;
                rd_data            = ecc_err_ctl0;
                end
 
 /* -------- ecc_err_ctl1 ------------------------ */
        12'h0a8:begin // 
                ld_ecc_err_ctl1    = wr_en;
                rd_data            = ecc_err_ctl1;
                end
 
 /* -------- ecc_err_ctl2 ------------------------ */
        12'h0b0:begin // 
                ld_ecc_err_ctl2    = wr_en;
                rd_data            = ecc_err_ctl2;
                end
 
 /* -------- ecc_err_ctl3 ------------------------ */
        12'h0b8:begin // 
                ld_ecc_err_ctl3    = wr_en;
                rd_data            = ecc_err_ctl3;
                end
 
 /* -------- debug_training_vector --------------- */
        12'h0c0:begin // 
                ld_training_vector = wr_en;
                rd_data            = training_vector;
                end
 
 /* -------- err log register -------------------- */
  
        12'h0c8:  rd_data          = {12'b0,
				     kickoff_tt_reg,
				     ififo_state[2:0],
                                     rsp_unload_state[3:0],  //  4b
                                     rsp_load_state[3:0],    //  4b
                                     req_unload_state[1:0],  //  2b
                                     req_load_state[1:0],    //  2b
                                     tt_state[3:0]};         //  4b


 /* --- Test status register w/o w1c ---- */
        12'h108:begin // Status Register
                ld_status          = wr_en;
                rd_data            = status_dout;
                end


        default:begin
                rd_data            = 32'hdead_beef;
                non_qualified_addr_err = 1;
	        end
      endcase

 /* -------- rdc registers ---------------------- */
    else if (addr_reg[16])  // rdc 
      case ({addr_reg[11:3],3'b0}) // synopsys parallel_case full_case infer_mux
        12'h0  :begin 
                ld_rdc0            = wr_en; 
                rd_data            = {28'b0,rdc0}; 
                end 
 
        12'h8  :begin 
                ld_rdc1            = wr_en; 
                rd_data            = {28'b0,rdc1}; 
                end 
 
        12'h10 :begin 
                ld_rdc2            = wr_en; 
                rd_data            = {28'b0,rdc2}; 
                end 
 
        12'h18 :begin 
                ld_rdc3            = wr_en; 
                rd_data            = {28'b0,rdc3}; 
                end 
 
        12'h20 :begin 
                ld_rdc4            = wr_en; 
                rd_data            = {28'b0,rdc4}; 
                end 
 
        12'h28 :begin 
                ld_rdc5            = wr_en; 
                rd_data            = {28'b0,rdc5}; 
                end 
 
        12'h30 :begin 
                ld_rdc6            = wr_en; 
                rd_data            = {28'b0,rdc6}; 
                end 
 
        12'h38 :begin 
                ld_rdc7            = wr_en; 
                rd_data            = {28'b0,rdc7}; 
                end 
 
        12'h40 :begin 
                ld_rdc8            = wr_en; 
                rd_data            = {28'b0,rdc8}; 
                end 
 
        12'h48 :begin 
                ld_rdc9            = wr_en; 
                rd_data            = {28'b0,rdc9}; 
                end 
 
        12'h50 :begin 
                ld_rdc10           = wr_en; 
                rd_data            = {28'b0,rdc10}; 
                end 
 
        12'h58 :begin 
                ld_rdc11           = wr_en; 
                rd_data            = {28'b0,rdc11}; 
                end 
 
        12'h60 :begin 
                ld_rdc12           = wr_en; 
                rd_data            = {28'b0,rdc12}; 
                end 
 
        12'h68 :begin 
                ld_rdc13           = wr_en; 
                rd_data            = {28'b0,rdc13}; 
                end 
 
        12'h70 :begin 
                ld_rdc14           = wr_en; 
                rd_data            = {28'b0,rdc14}; 
                end 
 
        12'h78 :begin 
                ld_rdc15           = wr_en; 
                rd_data            = {28'b0,rdc15}; 
                end 
 
        12'h80 :begin 
                ld_rdc16           = wr_en; 
                rd_data            = {28'b0,rdc16}; 
                end 
 
        12'h88 :begin 
                ld_rdc17           = wr_en; 
                rd_data            = {28'b0,rdc17}; 
                end 
 
        12'h90 :begin 
                ld_rdc18           = wr_en; 
                rd_data            = {28'b0,rdc18}; 
                end 
 
        12'h98 :begin 
                ld_rdc19           = wr_en; 
                rd_data            = {28'b0,rdc19}; 
                end 
 
        12'ha0 :begin 
                ld_rdc20           = wr_en; 
                rd_data            = {28'b0,rdc20}; 
                end 
 
        12'ha8 :begin 
                ld_rdc21           = wr_en; 
                rd_data            = {28'b0,rdc21}; 
                end 
 
        12'hb0 :begin 
                ld_rdc22           = wr_en; 
                rd_data            = {28'b0,rdc22}; 
                end 
 
        12'hb8 :begin 
                ld_rdc23           = wr_en; 
                rd_data            = {28'b0,rdc23}; 
                end 
 
        12'hc0 :begin 
                ld_rdc24           = wr_en; 
                rd_data            = {28'b0,rdc24}; 
                end 
 
        12'hc8 :begin 
                ld_rdc25           = wr_en; 
                rd_data            = {28'b0,rdc25}; 
                end 
 
        12'hd0 :begin 
                ld_rdc26           = wr_en; 
                rd_data            = {28'b0,rdc26}; 
                end 
 
        12'hd8 :begin 
                ld_rdc27           = wr_en; 
                rd_data            = {28'b0,rdc27}; 
                end 
 
        12'he0 :begin 
                ld_rdc28           = wr_en; 
                rd_data            = {28'b0,rdc28}; 
                end 
 
        12'he8 :begin 
                ld_rdc29           = wr_en; 
                rd_data            = {28'b0,rdc29}; 
                end 
 
        12'hf0 :begin 
                ld_rdc30           = wr_en; 
                rd_data            = {28'b0,rdc30}; 
                end 
 
        12'hf8 :begin 
                ld_rdc31           = wr_en; 
                rd_data            = {28'b0,rdc31}; 
                end 
 
        12'h100:begin 
                ld_rdc32           = wr_en; 
                rd_data            = {28'b0,rdc32}; 
                end 
 
        12'h108:begin 
                ld_rdc33           = wr_en; 
                rd_data            = {28'b0,rdc33}; 
                end 
 
        12'h110:begin 
                ld_rdc34           = wr_en; 
                rd_data            = {28'b0,rdc34}; 
                end 
 
        12'h118:begin 
                ld_rdc35           = wr_en; 
                rd_data            = {28'b0,rdc35}; 
                end 
 
        12'h120:begin 
                ld_rdc36           = wr_en; 
                rd_data            = {28'b0,rdc36}; 
                end 
 
        12'h128:begin 
                ld_rdc37           = wr_en; 
                rd_data            = {28'b0,rdc37}; 
                end 
 
        12'h130:begin 
                ld_rdc38           = wr_en; 
                rd_data            = {28'b0,rdc38}; 
                end 
 
        12'h138:begin 
                ld_rdc39           = wr_en; 
                rd_data            = {28'b0,rdc39}; 
                end 
 
        12'h140:begin 
                ld_rdc40           = wr_en; 
                rd_data            = {28'b0,rdc40}; 
                end 
 
        12'h148:begin 
                ld_rdc41           = wr_en; 
                rd_data            = {28'b0,rdc41}; 
                end 
 
        12'h150:begin 
                ld_rdc42           = wr_en; 
                rd_data            = {28'b0,rdc42}; 
                end 
 
        12'h158:begin 
                ld_rdc43           = wr_en; 
                rd_data            = {28'b0,rdc43}; 
                end 
 
        12'h160:begin 
                ld_rdc44           = wr_en; 
                rd_data            = {28'b0,rdc44}; 
                end 
 
        12'h168:begin 
                ld_rdc45           = wr_en; 
                rd_data            = {28'b0,rdc45}; 
                end 
 
        12'h170:begin 
                ld_rdc46           = wr_en; 
                rd_data            = {28'b0,rdc46}; 
                end 
 
        12'h178:begin 
                ld_rdc47           = wr_en; 
                rd_data            = {28'b0,rdc47}; 
                end 
 
        12'h180:begin 
                ld_rdc48           = wr_en; 
                rd_data            = {28'b0,rdc48}; 
                end 
 
        12'h188:begin 
                ld_rdc49           = wr_en; 
                rd_data            = {28'b0,rdc49}; 
                end 
 
        12'h190:begin 
                ld_rdc50           = wr_en; 
                rd_data            = {28'b0,rdc50}; 
                end 
 
        12'h198:begin 
                ld_rdc51           = wr_en; 
                rd_data            = {28'b0,rdc51}; 
                end 
 
        12'h1a0:begin 
                ld_rdc52           = wr_en; 
                rd_data            = {28'b0,rdc52}; 
                end 
 
        12'h1a8:begin 
                ld_rdc53           = wr_en; 
                rd_data            = {28'b0,rdc53}; 
                end 
 
        12'h1b0:begin 
                ld_rdc54           = wr_en; 
                rd_data            = {28'b0,rdc54}; 
                end 
 
        12'h1b8:begin 
                ld_rdc55           = wr_en; 
                rd_data            = {28'b0,rdc55}; 
                end 
 
        12'h1c0:begin 
                ld_rdc56           = wr_en; 
                rd_data            = {28'b0,rdc56}; 
                end 
 
        12'h1c8:begin 
                ld_rdc57           = wr_en; 
                rd_data            = {28'b0,rdc57}; 
                end 
 
        12'h1d0:begin 
                ld_rdc58           = wr_en; 
                rd_data            = {28'b0,rdc58}; 
                end 
 
        12'h1d8:begin 
                ld_rdc59           = wr_en; 
                rd_data            = {28'b0,rdc59}; 
                end 
 
        12'h1e0:begin 
                ld_rdc60           = wr_en; 
                rd_data            = {28'b0,rdc60}; 
                end 
 
        12'h1e8:begin 
                ld_rdc61           = wr_en; 
                rd_data            = {28'b0,rdc61}; 
                end 
 
        12'h1f0:begin 
                ld_rdc62           = wr_en; 
                rd_data            = {28'b0,rdc62}; 
                end 
 
        12'h1f8:begin 
                ld_rdc63           = wr_en; 
                rd_data            = {28'b0,rdc63}; 
                end 
 
        12'h200:begin 
                ld_rdc64           = wr_en; 
                rd_data            = {28'b0,rdc64}; 
                end 
 
        12'h208:begin 
                ld_rdc65           = wr_en; 
                rd_data            = {28'b0,rdc65}; 
                end 
 
        12'h210:begin 
                ld_rdc66           = wr_en; 
                rd_data            = {28'b0,rdc66}; 
                end 
 
        12'h218:begin 
                ld_rdc67           = wr_en; 
                rd_data            = {28'b0,rdc67}; 
                end 
 
        12'h220:begin 
                ld_rdc68           = wr_en; 
                rd_data            = {28'b0,rdc68}; 
                end 
 
        12'h228:begin 
                ld_rdc69           = wr_en; 
                rd_data            = {28'b0,rdc69}; 
                end 
 
        12'h230:begin 
                ld_rdc70           = wr_en; 
                rd_data            = {28'b0,rdc70}; 
                end 
 
        12'h238:begin 
                ld_rdc71           = wr_en; 
                rd_data            = {28'b0,rdc71}; 
                end 
 
        12'h240:begin 
                ld_rdc72           = wr_en; 
                rd_data            = {28'b0,rdc72}; 
                end 
 
        12'h248:begin 
                ld_rdc73           = wr_en; 
                rd_data            = {28'b0,rdc73}; 
                end 
 
        12'h250:begin 
                ld_rdc74           = wr_en; 
                rd_data            = {28'b0,rdc74}; 
                end 
 
        12'h258:begin 
                ld_rdc75           = wr_en; 
                rd_data            = {28'b0,rdc75}; 
                end 
 
        12'h260:begin 
                ld_rdc76           = wr_en; 
                rd_data            = {28'b0,rdc76}; 
                end 
 
        12'h268:begin 
                ld_rdc77           = wr_en; 
                rd_data            = {28'b0,rdc77}; 
                end 
 
        12'h270:begin 
                ld_rdc78           = wr_en; 
                rd_data            = {28'b0,rdc78}; 
                end 
 
        12'h278:begin 
                ld_rdc79           = wr_en; 
                rd_data            = {28'b0,rdc79}; 
                end 
 
        12'h280:begin 
                ld_rdc80           = wr_en; 
                rd_data            = {28'b0,rdc80}; 
                end 
 
        12'h288:begin 
                ld_rdc81           = wr_en; 
                rd_data            = {28'b0,rdc81}; 
                end 
 
        12'h290:begin 
                ld_rdc82           = wr_en; 
                rd_data            = {28'b0,rdc82}; 
                end 
 
        12'h298:begin 
                ld_rdc83           = wr_en; 
                rd_data            = {28'b0,rdc83}; 
                end 
 
        12'h2a0:begin 
                ld_rdc84           = wr_en; 
                rd_data            = {28'b0,rdc84}; 
                end 
 
        12'h2a8:begin 
                ld_rdc85           = wr_en; 
                rd_data            = {28'b0,rdc85}; 
                end 
 
        12'h2b0:begin 
                ld_rdc86           = wr_en; 
                rd_data            = {28'b0,rdc86}; 
                end 
 
        12'h2b8:begin 
                ld_rdc87           = wr_en; 
                rd_data            = {28'b0,rdc87}; 
                end 
 
        12'h2c0:begin 
                ld_rdc88           = wr_en; 
                rd_data            = {28'b0,rdc88}; 
                end 
 
        12'h2c8:begin 
                ld_rdc89           = wr_en; 
                rd_data            = {28'b0,rdc89}; 
                end 
 
        12'h2d0:begin 
                ld_rdc90           = wr_en; 
                rd_data            = {28'b0,rdc90}; 
                end 
 
        12'h2d8:begin 
                ld_rdc91           = wr_en; 
                rd_data            = {28'b0,rdc91}; 
                end 
 
        12'h2e0:begin 
                ld_rdc92           = wr_en; 
                rd_data            = {28'b0,rdc92}; 
                end 
 
        12'h2e8:begin 
                ld_rdc93           = wr_en; 
                rd_data            = {28'b0,rdc93}; 
                end 
 
        12'h2f0:begin 
                ld_rdc94           = wr_en; 
                rd_data            = {28'b0,rdc94}; 
                end 
 
        12'h2f8:begin 
                ld_rdc95           = wr_en; 
                rd_data            = {28'b0,rdc95}; 
                end 
 
        12'h300:begin 
                ld_rdc96           = wr_en; 
                rd_data            = {28'b0,rdc96}; 
                end 
 
        12'h308:begin 
                ld_rdc97           = wr_en; 
                rd_data            = {28'b0,rdc97}; 
                end 
 
        12'h310:begin 
                ld_rdc98           = wr_en; 
                rd_data            = {28'b0,rdc98}; 
                end 
 
        12'h318:begin 
                ld_rdc99           = wr_en; 
                rd_data            = {28'b0,rdc99}; 
                end 
 
        12'h320:begin 
                ld_rdc100          = wr_en; 
                rd_data            = {28'b0,rdc100}; 
                end 
 
        12'h328:begin 
                ld_rdc101          = wr_en; 
                rd_data            = {28'b0,rdc101}; 
                end 
 
        12'h330:begin 
                ld_rdc102          = wr_en; 
                rd_data            = {28'b0,rdc102}; 
                end 
 
        12'h338:begin 
                ld_rdc103          = wr_en; 
                rd_data            = {28'b0,rdc103}; 
                end 
 
        12'h340:begin 
                ld_rdc104          = wr_en; 
                rd_data            = {28'b0,rdc104}; 
                end 
 
        12'h348:begin 
                ld_rdc105          = wr_en; 
                rd_data            = {28'b0,rdc105}; 
                end 
 
        12'h350:begin 
                ld_rdc106          = wr_en; 
                rd_data            = {28'b0,rdc106}; 
                end 
 
        12'h358:begin 
                ld_rdc107          = wr_en; 
                rd_data            = {28'b0,rdc107}; 
                end 
 
        12'h360:begin 
                ld_rdc108          = wr_en; 
                rd_data            = {28'b0,rdc108}; 
                end 
 
        12'h368:begin 
                ld_rdc109          = wr_en; 
                rd_data            = {28'b0,rdc109}; 
                end 
 
        12'h370:begin 
                ld_rdc110          = wr_en; 
                rd_data            = {28'b0,rdc110}; 
                end 
 
        12'h378:begin 
                ld_rdc111          = wr_en; 
                rd_data            = {28'b0,rdc111}; 
                end 
 
        12'h380:begin 
                ld_rdc112          = wr_en; 
                rd_data            = {28'b0,rdc112}; 
                end 
 
        12'h388:begin 
                ld_rdc113          = wr_en; 
                rd_data            = {28'b0,rdc113}; 
                end 
 
        12'h390:begin 
                ld_rdc114          = wr_en; 
                rd_data            = {28'b0,rdc114}; 
                end 
 
        12'h398:begin 
                ld_rdc115          = wr_en; 
                rd_data            = {28'b0,rdc115}; 
                end 
 
        12'h3a0:begin 
                ld_rdc116          = wr_en; 
                rd_data            = {28'b0,rdc116}; 
                end 
 
        12'h3a8:begin 
                ld_rdc117          = wr_en; 
                rd_data            = {28'b0,rdc117}; 
                end 
 
        12'h3b0:begin 
                ld_rdc118          = wr_en; 
                rd_data            = {28'b0,rdc118}; 
                end 
 
        12'h3b8:begin 
                ld_rdc119          = wr_en; 
                rd_data            = {28'b0,rdc119}; 
                end 
 
        12'h3c0:begin 
                ld_rdc120          = wr_en; 
                rd_data            = {28'b0,rdc120}; 
                end 
 
        12'h3c8:begin 
                ld_rdc121          = wr_en; 
                rd_data            = {28'b0,rdc121}; 
                end 
 
        12'h3d0:begin 
                ld_rdc122          = wr_en; 
                rd_data            = {28'b0,rdc122}; 
                end 
 
        12'h3d8:begin 
                ld_rdc123          = wr_en; 
                rd_data            = {28'b0,rdc123}; 
                end 
 
        12'h3e0:begin 
                ld_rdc124          = wr_en; 
                rd_data            = {28'b0,rdc124}; 
                end 
 
        12'h3e8:begin 
                ld_rdc125          = wr_en; 
                rd_data            = {28'b0,rdc125}; 
                end 
 
        12'h3f0:begin 
                ld_rdc126          = wr_en; 
                rd_data            = {28'b0,rdc126}; 
                end 
 
        12'h3f8:begin 
                ld_rdc127          = wr_en; 
                rd_data            = {28'b0,rdc127}; 
                end 
 
        default:begin
                rd_data            = 32'hdead_beef;
                non_qualified_addr_err = 1;
	        end
      endcase

    else        begin
                rd_data            = 32'hdead_beef;
                non_qualified_addr_err = 1;
	        end
  end // always @ (...
   
   
 /* -------------------- config1 Register -------------------- */
   
zcp_xREG #(25) config1_xREG (.clk(clk), 
                    .reset(reset[0]), 
                    .en(ld_config1),
                    .din(wr_data[24:0]),
                    .qout(config1[24:0]));

   
   wire          tt_en            = config1[0];
   wire 	 req_dis          = config1[1];
   wire 	 rsp_dis          = config1[2];
   wire 	 par_chk_dis      = config1[3];    // disable parity check
   wire 	 ecc_chk_dis      = config1[4];
   wire [10:0]   dmaw_threshold   = config1[15:5];
   wire [7:0] 	 zcp_debug_sel    = config1[23:16];
   wire 	 zcp_32bit_mode   = config1[24];
   assign        config1[31:25]   = 0;
     
 /* --------------------- Status Register -------------------- */

zcp_w1c_ff stat0 (.clk(clk),.reset(reset[1]),.set(zcp_dmc_dat_err0),.ld(ld_status),.w1c(w1c_status),.w1c_data(wr_data[0]),.q(zcp_dmc_dat_err0_stat));
zcp_w1c_ff stat1 (.clk(clk),.reset(reset[1]),.set(zcp_dmc_dat_err1),.ld(ld_status),.w1c(w1c_status),.w1c_data(wr_data[1]),.q(zcp_dmc_dat_err1_stat));
zcp_w1c_ff stat2 (.clk(clk),.reset(reset[1]),.set(zcp_dmc_dat_err2),.ld(ld_status),.w1c(w1c_status),.w1c_data(wr_data[2]),.q(zcp_dmc_dat_err2_stat));
zcp_w1c_ff stat3 (.clk(clk),.reset(reset[1]),.set(zcp_dmc_dat_err3),.ld(ld_status),.w1c(w1c_status),.w1c_data(wr_data[3]),.q(zcp_dmc_dat_err3_stat));

zcp_w1c_ff stat4 (.clk(clk),.reset(reset[1]),.set(zcp_tt_index_err),.ld(ld_status),.w1c(w1c_status),.w1c_data(wr_data[4]),.q(zcp_tt_index_err_stat));
zcp_w1c_ff stat5 (.clk(clk),.reset(reset[1]),.set(slv_tt_index_err),.ld(ld_status),.w1c(w1c_status),.w1c_data(wr_data[5]),.q(slv_tt_index_err_stat));
zcp_w1c_ff stat6 (.clk(clk),.reset(reset[1]),.set(rsp_tt_index_err),.ld(ld_status),.w1c(w1c_status),.w1c_data(wr_data[6]),.q(rsp_tt_index_err_stat));

zcp_w1c_ff stat7 (.clk(clk),.reset(reset[1]),.set(set_tt_program_err),.ld(ld_status),.w1c(w1c_status),.w1c_data(wr_data[7]),.q(tt_program_err_stat));

// vlint flag_null_instance_port off
// vlint flag_unmatched_port_connect_in_inst off
zcp_pls_gen2_reg va_ram_perr_pls_gen2(.clk(clk),.sig_in(va_ram_perr),.lead(va_ram_perr_pls),.trail());
zcp_pls_gen2_reg dn_ram_perr_pls_gen2(.clk(clk),.sig_in(dn_ram_perr),.lead(dn_ram_perr_pls),.trail());
zcp_pls_gen2_reg st_ram_perr_pls_gen2(.clk(clk),.sig_in(st_ram_perr),.lead(st_ram_perr_pls),.trail());
// vlint flag_null_instance_port on
// vlint flag_unmatched_port_connect_in_inst on

zcp_w1c_ff stat8 (.clk(clk),.reset(reset[1]),.set(va_ram_perr_pls),.ld(ld_status),.w1c(w1c_status),.w1c_data(wr_data[8]), .q(va_ram_perr_stat));
zcp_w1c_ff stat9 (.clk(clk),.reset(reset[1]),.set(dn_ram_perr_pls),.ld(ld_status),.w1c(w1c_status),.w1c_data(wr_data[9]), .q(dn_ram_perr_stat));
zcp_w1c_ff stat10(.clk(clk),.reset(reset[1]),.set(st_ram_perr_pls),.ld(ld_status),.w1c(w1c_status),.w1c_data(wr_data[10]),.q(st_ram_perr_stat));

zcp_w1c_ff stat11(.clk(clk),.reset(reset[1]),.set(ififo_overrun),  .ld(ld_status),.w1c(w1c_status),.w1c_data(wr_data[11]),.q(ififo_overrun_stat));
zcp_w1c_ff stat12(.clk(clk),.reset(reset[1]),.set(rspfifo_uncorr_err),.ld(ld_status),.w1c(w1c_status),.w1c_data(wr_data[12]),.q(rspfifo_uncorr_err_stat));

zcp_w1c_ff stat14(.clk(clk),.reset(reset[1]),.set(rrfifo_overrun), .ld(ld_status),.w1c(w1c_status),.w1c_data(wr_data[14]),.q(rrfifo_overrun_stat));
zcp_w1c_ff stat15(.clk(clk),.reset(reset[1]),.set(rrfifo_underrun),.ld(ld_status),.w1c(w1c_status),.w1c_data(wr_data[15]),.q(rrfifo_underrun_stat));

   assign      status_dout[0]      = zcp_dmc_dat_err0_stat;
   assign      status_dout[1]      = zcp_dmc_dat_err1_stat;
   assign      status_dout[2]      = zcp_dmc_dat_err2_stat;
   assign      status_dout[3]      = zcp_dmc_dat_err3_stat;
   assign      status_dout[4]      = zcp_tt_index_err_stat;
   assign      status_dout[5]      = slv_tt_index_err_stat;
   assign      status_dout[6]      = rsp_tt_index_err_stat;
   assign      status_dout[7]      = tt_program_err_stat;
   assign      status_dout[8]      = va_ram_perr_stat;
   assign      status_dout[9]      = dn_ram_perr_stat;
   assign      status_dout[10]     = st_ram_perr_stat;
   assign      status_dout[11]     = ififo_overrun_stat;
   assign      status_dout[12]     = rspfifo_uncorr_err_stat;
   assign      status_dout[13]     = 0;
   assign      status_dout[14]     = rrfifo_overrun_stat;
   assign      status_dout[15]     = rrfifo_underrun_stat;
   assign      status_dout[31:16]  = 0;
   
 // Interrupt generation

   wire    pio_intr =         status_dout[0]  & mask[0]  |
                              status_dout[1]  & mask[1]  |
                              status_dout[2]  & mask[2]  |
                              status_dout[3]  & mask[3]  |
                              status_dout[4]  & mask[4]  |
                              status_dout[5]  & mask[5]  |
                              status_dout[6]  & mask[6]  |
                              status_dout[7]  & mask[7]  |
                              status_dout[8]  & mask[8]  |
                              status_dout[9]  & mask[9]  |
                              status_dout[10] & mask[10] |
                              status_dout[11] & mask[11] |
                              status_dout[12] & mask[12] |
                              status_dout[14] & mask[14] |
                              status_dout[15] & mask[15] ;
                   

   always @ (posedge clk) begin zcp_pio_intr <= pio_intr; end

   
 /* ---------------------- Mask Register --------------------- */
zcp_xREG2 #(16)  mask_xREG2(
.clk(clk),
.reset(reset[1]),
.reset_value({16{1'b1}}),
.load(ld_mask),
.din(wr_data[15:0]),
.qout(mask[15:0]));

assign mask[31:16] = 16'b0;
   
 /* ---------------------- 4 buffer region_ctl --------------- */
zcp_xREG #(32)  buf4_region_ctl_xREG(
.clk(clk),
.reset(reset[2]),
.en(ld_buf4_region_ctl),
.din(wr_data[31:0]),
.qout(buf4_region_ctl[31:0]));

wire  [7:0]   tt_offset0      = buf4_region_ctl[7:0];
wire  [9:0]   tt_index_start0 = buf4_region_ctl[19:10];
wire  [9:0]   tt_index_end0   = buf4_region_ctl[29:20];
wire          tt_index_chk0   = buf4_region_ctl[30];
// vlint flag_dangling_net_within_module off
// vlint flag_net_has_no_load off
wire          tt_index_rsv0   = buf4_region_ctl[31];
// vlint flag_net_has_no_load on
// vlint flag_dangling_net_within_module on

 /* ---------------------- 8 buffer region_ctl --------------- */
zcp_xREG #(32)  buf8_region_ctl_xREG(
.clk(clk),
.reset(reset[2]),
.en(ld_buf8_region_ctl),
.din(wr_data[31:0]),
.qout(buf8_region_ctl[31:0]));

wire  [7:0]   tt_offset1      = buf8_region_ctl[7:0];
wire  [9:0]   tt_index_start1 = buf8_region_ctl[19:10];
wire  [9:0]   tt_index_end1   = buf8_region_ctl[29:20];
wire          tt_index_chk1   = buf8_region_ctl[30];
// vlint flag_dangling_net_within_module off
// vlint flag_net_has_no_load off
wire          tt_index_rsv1   = buf8_region_ctl[31];
// vlint flag_net_has_no_load on
// vlint flag_dangling_net_within_module on

 /* --------------------- 16 buffer region_ctl --------------- */
zcp_xREG #(32)  buf16_region_ctl_xREG(
.clk(clk),
.reset(reset[3]),
.en(ld_buf16_region_ctl),
.din(wr_data[31:0]),
.qout(buf16_region_ctl[31:0]));

wire  [7:0]   tt_offset2      = buf16_region_ctl[7:0];
wire  [9:0]   tt_index_start2 = buf16_region_ctl[19:10];
wire  [9:0]   tt_index_end2   = buf16_region_ctl[29:20];
wire          tt_index_chk2   = buf16_region_ctl[30];
// vlint flag_dangling_net_within_module off
// vlint flag_net_has_no_load off
wire          tt_index_rsv2   = buf16_region_ctl[31];
// vlint flag_net_has_no_load on
// vlint flag_dangling_net_within_module on

 /* --------------------- 32 buffer region_ctl --------------- */
zcp_xREG #(32)  buf32_region_ctl_xREG(
.clk(clk),
.reset(reset[3]),
.en(ld_buf32_region_ctl),
.din(wr_data[31:0]),
.qout(buf32_region_ctl[31:0]));

wire  [7:0]   tt_offset3      = buf32_region_ctl[7:0];
wire  [9:0]   tt_index_start3 = buf32_region_ctl[19:10];
wire  [9:0]   tt_index_end3   = buf32_region_ctl[29:20];
wire          tt_index_chk3   = buf32_region_ctl[30];
// vlint flag_dangling_net_within_module off
// vlint flag_net_has_no_load off
wire          tt_index_rsv3   = buf32_region_ctl[31];
// vlint flag_net_has_no_load on
// vlint flag_dangling_net_within_module on

// ds stands for dynamic and static table ram.
 /* ------------------- ds 4 buffer region_ctl --------------- */
zcp_xREG #(10)  ds4_region_ctl_xREG(
.clk(clk),
.reset(reset[4]),
.en(ld_ds4_region_ctl),
.din(wr_data[9:0]),
.qout(ds4_region_ctl[9:0]));

wire    [9:0]   ds_offset0    = ds4_region_ctl[9:0];
assign  ds4_region_ctl[31:10] = 0;
      
 /* ------------------- ds8 buffer region_ctl --------------- */
zcp_xREG #(10)  ds8_region_ctl_xREG(
.clk(clk),
.reset(reset[4]),
.en(ld_ds8_region_ctl),
.din(wr_data[9:0]),
.qout(ds8_region_ctl[9:0]));

wire    [9:0]   ds_offset1    = ds8_region_ctl[9:0];
assign  ds8_region_ctl[31:10] = 0;
      
 /* ------------------- ds16 buffer region_ctl --------------- */
zcp_xREG #(10)  ds16_region_ctl_xREG(
.clk(clk),
.reset(reset[4]),
.en(ld_ds16_region_ctl),
.din(wr_data[9:0]),
.qout(ds16_region_ctl[9:0]));

wire    [9:0]   ds_offset2    = ds16_region_ctl[9:0];
assign  ds16_region_ctl[31:10]= 0;
      
 /* ------------------- ds32 buffer region_ctl --------------- */
zcp_xREG #(10)  ds32_region_ctl_xREG(
.clk(clk),
.reset(reset[4]),
.en(ld_ds32_region_ctl),
.din(wr_data[9:0]),
.qout(ds32_region_ctl[9:0]));

wire    [9:0]   ds_offset3    = ds32_region_ctl[9:0];
assign  ds32_region_ctl[31:10]= 0;
      
 /* ----- ram access data registers ------ */
   zcp_RegLd #(32) ram_data0_RegLd(
                .clk(clk),
                .reset(reset[5]),
                .ld(ld_ram2reg),
                .ld_value(ram_rdata[31:0]),
                .we(ld_ram_data0),
                .din(wr_data[31:0]),
                .qout(ram_data0));

   zcp_RegLd #(32) ram_data1_RegLd(
                .clk(clk),
                .reset(reset[5]),
                .ld(ld_ram2reg),
                .ld_value(ram_rdata[63:32]),
                .we(ld_ram_data1),
                .din(wr_data[31:0]),
                .qout(ram_data1));

   zcp_RegLd #(32) ram_data2_RegLd(
                .clk(clk),
                .reset(reset[6]),
                .ld(ld_ram2reg),
                .ld_value(ram_rdata[95:64]),
                .we(ld_ram_data2),
                .din(wr_data[31:0]),
                .qout(ram_data2));
   zcp_RegLd #(32) ram_data3_RegLd(
                .clk(clk),
                .reset(reset[6]),
                .ld(ld_ram2reg),
                .ld_value(ram_rdata[127:96]),
                .we(ld_ram_data3),
                .din(wr_data[31:0]),
                .qout(ram_data3));

   zcp_RegLd #(8) ram_data4_RegLd(
                .clk(clk),
                .reset(reset[7]),
                .ld(ld_ram2reg),
                .ld_value(ram_rdata[135:128]),
                .we(ld_ram_data4),
                .din(wr_data[7:0]),
                .qout(ram_data4));

   assign ram_data = {ram_data4,ram_data3,ram_data2,ram_data1,ram_data0};

 /* ------ ram access byte enable registers ------ */
   zcp_xREG #(17) ram_be_xREG(
                .din(wr_data[16:0]),
                .clk(clk),
                .en(ld_ram_be),
                .reset(reset[7]),
                .qout(ram_be[16:0]));
   
 /* -----  ram access address register ------ */
   zcp_xREG #(31) ram_addr_xREG(
                  .din(wr_data[30:0]),
                  .clk(clk),
                  .en(ld_ram_addr),
                  .reset(reset[7]),
                  .qout(ram_addr[30:0]));

   
zcp_pls_gen2_reg slv_ram_pls_gen2_reg(.clk(clk),.sig_in(ld_ram_addr),.lead(ld_ram_addr_lead),.trail(ld_ram_addr_trail));

   wire    [10:0]  slv_ram_addr   =  ram_addr[10:0];  // For accessing cfifo only.
   wire    [4:0]   ram_sel        =  ram_addr[16:12];
   wire    [11:0]  slv_tt_index   =  ram_addr[28:17]; // For accessing va_ram, st_ram, dn_ram.
   wire    rw                     =  ram_addr[30];

   assign  ram_addr[31]           = |ram_access_state; // ram busy 
   assign  slv_ram_wdata          =  ram_data;
   assign  slv_ram_be             =  ram_be;

 /* -------- par data register ------------------- */
   zcp_xREG #(17)  chk_bit_data_xREG(
                  .din(wr_data[16:0]),
                  .clk(clk),
                  .en(ld_chk_bit_data),
                  .reset(reset[8]),
                  .qout(chk_bit_data[16:0]));
   
 /* -------- reset cfifo register ---------------- */

   zcp_xREG #(4)  reset_cfifo_xREG(
                  .din(wr_data[3:0]),
                  .clk(clk),
                  .en(ld_reset_cfifo),
                  .reset(reset[8]),
                  .qout({reset_cfifo3,reset_cfifo2,reset_cfifo1,reset_cfifo0}));

 /* -------- ecc_err_ctl ------------------------- */
   wire [5:0] ecc_err_wd = {wr_data[31],wr_data[17:16],wr_data[2:0]}; // 6b

 zcp_xREG #(6) ecc_err_ctl0_xREG(.clk(clk),.reset(reset[8]),.en(ld_ecc_err_ctl0),.din(ecc_err_wd[5:0]),
                                 .qout({ecc_err_ctl0[31],ecc_err_ctl0[17:16],ecc_err_ctl0[2:0]}));

 zcp_xREG #(6) ecc_err_ctl1_xREG(.clk(clk),.reset(reset[8]),.en(ld_ecc_err_ctl1),.din(ecc_err_wd[5:0]),
                                 .qout({ecc_err_ctl1[31],ecc_err_ctl1[17:16],ecc_err_ctl1[2:0]}));

 zcp_xREG #(6) ecc_err_ctl2_xREG(.clk(clk),.reset(reset[8]),.en(ld_ecc_err_ctl2),.din(ecc_err_wd[5:0]),
                                 .qout({ecc_err_ctl2[31],ecc_err_ctl2[17:16],ecc_err_ctl2[2:0]}));

 zcp_xREG #(6) ecc_err_ctl3_xREG(.clk(clk),.reset(reset[8]),.en(ld_ecc_err_ctl3),.din(ecc_err_wd[5:0]),
                                 .qout({ecc_err_ctl3[31],ecc_err_ctl3[17:16],ecc_err_ctl3[2:0]}));

   assign   ecc_chk_bypass0  = ecc_err_ctl0[31];           // per fifo ecc_chk disable
   assign                      ecc_err_ctl0[30:18] = 0;
   assign   double_bit_err0  = ecc_err_ctl0[17];
   assign   single_bit_err0  = ecc_err_ctl0[16];
   assign                      ecc_err_ctl0[15:11] = 0;
   assign                      ecc_err_ctl0[10]    = 1'b1; // all packets
   assign                      ecc_err_ctl0[9:3]   = 0;
   assign   last_line_err0   = ecc_err_ctl0[2] ;
   assign   second_line_err0 = ecc_err_ctl0[1] ;
   assign   first_line_err0  = ecc_err_ctl0[0] ;
   
   assign                      ecc_err_ctl1[30:18] = 0;
   assign   ecc_chk_bypass1  = ecc_err_ctl1[31];           // per fifo ecc_chk disable
   assign   double_bit_err1  = ecc_err_ctl1[17];
   assign   single_bit_err1  = ecc_err_ctl1[16];
   assign                      ecc_err_ctl1[15:11] = 0;
   assign                      ecc_err_ctl1[10]    = 1'b1; // all packets
   assign                      ecc_err_ctl1[9:3]   = 0;
   assign   last_line_err1   = ecc_err_ctl1[2] ;
   assign   second_line_err1 = ecc_err_ctl1[1] ;
   assign   first_line_err1  = ecc_err_ctl1[0] ;
   
   assign                      ecc_err_ctl2[30:18] = 0;
   assign   ecc_chk_bypass2  = ecc_err_ctl2[31];           // per fifo ecc_chk disable
   assign   double_bit_err2  = ecc_err_ctl2[17];
   assign   single_bit_err2  = ecc_err_ctl2[16];
   assign                      ecc_err_ctl2[15:11] = 0;
   assign                      ecc_err_ctl2[10]    = 1'b1; // all packets
   assign                      ecc_err_ctl2[9:3]   = 0;
   assign   last_line_err2   = ecc_err_ctl2[2] ;
   assign   second_line_err2 = ecc_err_ctl2[1] ;
   assign   first_line_err2  = ecc_err_ctl2[0] ;
   
   assign                      ecc_err_ctl3[30:18] = 0;
   assign   ecc_chk_bypass3  = ecc_err_ctl3[31];           // per fifo ecc_chk disable
   assign   double_bit_err3  = ecc_err_ctl3[17];
   assign   single_bit_err3  = ecc_err_ctl3[16];
   assign                      ecc_err_ctl3[15:11] = 0;
   assign                      ecc_err_ctl3[10]    = 1'b1; // all packets
   assign                      ecc_err_ctl3[9:3]   = 0;
   assign   last_line_err3   = ecc_err_ctl3[2] ;
   assign   second_line_err3 = ecc_err_ctl3[1] ;
   assign   first_line_err3  = ecc_err_ctl3[0] ;
   
 /* -------- debug_training_vector --------------- */
 zcp_xREG #(32) training_vector_xREG(.clk(clk),.reset(reset[9]),.en(ld_training_vector),.din(wr_data[31:0]),.qout(training_vector));

   // vlint flag_empty_block off
   // RAM enable selection MUX
   always @ (posedge clk)
     begin
                    // va read or write enable
		    va_ram_rwen    <= 0;
		    va_ram_rwen0   <= 0;
		    va_ram_rwen1   <= 0;
		    va_ram_rwen2   <= 0;
		    va_ram_rwen3   <= 0;
		    va_ram_rwen4   <= 0;
		    va_ram_rwen5   <= 0;
		    va_ram_rwen6   <= 0;
		    va_ram_rwen7   <= 0;
                    // va read
		    va_ram_ren     <= 0;
		    va_ram_ren0    <= 0;
		    va_ram_ren1    <= 0;
		    va_ram_ren2    <= 0;
		    va_ram_ren3    <= 0;
		    va_ram_ren4    <= 0;
		    va_ram_ren5    <= 0;
		    va_ram_ren6    <= 0;
		    va_ram_ren7    <= 0;
                    // va write
		    va_ram_wen     <= 0;
		    va_ram_wen0    <= 0;
		    va_ram_wen1    <= 0;
		    va_ram_wen2    <= 0;
		    va_ram_wen3    <= 0;
		    va_ram_wen4    <= 0;
		    va_ram_wen5    <= 0;
		    va_ram_wen6    <= 0;
		    va_ram_wen7    <= 0;
	            // st ram
		    st_ram_ren     <= 0;
 		    st_ram_wen     <= 0;
                    // dn ram
		    dn_ram_ren     <= 0;
		    dn_ram_wen     <= 0;
                    // cfifo r/w
		    cfifo_ren0     <= 0;
		    cfifo_ren1     <= 0;
		    cfifo_ren2     <= 0;
		    cfifo_ren3     <= 0;
		    cfifo_wen0     <= 0;
		    cfifo_wen1     <= 0;
		    cfifo_wen2     <= 0;
		    cfifo_wen3     <= 0;

	casex (ram_sel[4:0])   // synopsys parallel_case full_case
	  // va_ram
          5'h00 : begin
		    va_ram_rwen    <= ram_ren | ram_wen;// r/w enable
		    va_ram_rwen0   <= ram_ren | ram_wen;// r/w enable
		    va_ram_ren0    <= ram_ren;// ram_ren is a pulse
		    va_ram_wen0    <= ram_wen;// ram_wen is a pulse
		    va_ram_ren     <= ram_ren;// ram_ren is a pulse
		    va_ram_wen     <= ram_wen;// ram_wen is a pulse
	          end
          5'h01 : begin
		    va_ram_rwen    <= ram_ren | ram_wen;// r/w enable
		    va_ram_rwen1   <= ram_ren | ram_wen;// r/w enable
		    va_ram_ren1    <= ram_ren;// ram_ren is a pulse
		    va_ram_wen1    <= ram_wen;// ram_wen is a pulse
		    va_ram_ren     <= ram_ren;// ram_ren is a pulse
		    va_ram_wen     <= ram_wen;// ram_wen is a pulse
	          end
          5'h02 : begin
		    va_ram_rwen    <= ram_ren | ram_wen;// r/w enable
		    va_ram_rwen2   <= ram_ren | ram_wen;// r/w enable
		    va_ram_ren2    <= ram_ren;// ram_ren is a pulse
		    va_ram_wen2    <= ram_wen;// ram_wen is a pulse
		    va_ram_ren     <= ram_ren;// ram_ren is a pulse
		    va_ram_wen     <= ram_wen;// ram_wen is a pulse
	          end
          5'h03 : begin
		    va_ram_rwen    <= ram_ren | ram_wen;// r/w enable
		    va_ram_rwen3   <= ram_ren | ram_wen;// r/w enable
		    va_ram_ren3    <= ram_ren;// ram_ren is a pulse
		    va_ram_wen3    <= ram_wen;// ram_wen is a pulse
		    va_ram_ren     <= ram_ren;// ram_ren is a pulse
		    va_ram_wen     <= ram_wen;// ram_wen is a pulse
	          end
          5'h04 : begin
		    va_ram_rwen    <= ram_ren | ram_wen;// r/w enable
		    va_ram_rwen4   <= ram_ren | ram_wen;// r/w enable
		    va_ram_ren4    <= ram_ren;// ram_ren is a pulse
		    va_ram_wen4    <= ram_wen;// ram_wen is a pulse
		    va_ram_ren     <= ram_ren;// ram_ren is a pulse
		    va_ram_wen     <= ram_wen;// ram_wen is a pulse
	          end
          5'h05 : begin
		    va_ram_rwen    <= ram_ren | ram_wen;// r/w enable
		    va_ram_rwen5   <= ram_ren | ram_wen;// r/w enable
		    va_ram_ren5    <= ram_ren;// ram_ren is a pulse
		    va_ram_wen5    <= ram_wen;// ram_wen is a pulse
		    va_ram_ren     <= ram_ren;// ram_ren is a pulse
		    va_ram_wen     <= ram_wen;// ram_wen is a pulse
	          end
          5'h06 : begin
		    va_ram_rwen    <= ram_ren | ram_wen;// r/w enable
		    va_ram_rwen6   <= ram_ren | ram_wen;// r/w enable
		    va_ram_ren6    <= ram_ren;// ram_ren is a pulse
		    va_ram_wen6    <= ram_wen;// ram_wen is a pulse
		    va_ram_ren     <= ram_ren;// ram_ren is a pulse
		    va_ram_wen     <= ram_wen;// ram_wen is a pulse
	          end
          5'h07 : begin
		    va_ram_rwen    <= ram_ren | ram_wen;// r/w enable
		    va_ram_rwen7   <= ram_ren | ram_wen;// r/w enable
		    va_ram_ren7    <= ram_ren;
		    va_ram_wen7    <= ram_wen;// ram_wen is a pulse
		    va_ram_ren     <= ram_ren;// ram_ren is a pulse
		    va_ram_wen     <= ram_wen;// ram_wen is a pulse
	          end
          5'h08 : begin // st ram
		    st_ram_ren     <= ram_ren;
		    st_ram_wen     <= ram_wen;// ram_wen is a pulse
	          end
          5'h09 : begin // dn ram
		    dn_ram_ren     <= ram_ren;
		    dn_ram_wen     <= ram_wen;// ram_wen is a pulse
	          end
          5'h10 : begin //cfifo0
		    cfifo_ren0     <= ram_ren;
		    cfifo_wen0     <= ram_wen;// ram_wen is a pulse
	          end
          5'h11 : begin //cfifo1
		    cfifo_ren1     <= ram_ren;
		    cfifo_wen1     <= ram_wen;// ram_wen is a pulse
	          end
          5'h12 : begin //cfifo2
		    cfifo_ren2     <= ram_ren;
		    cfifo_wen2     <= ram_wen;// ram_wen is a pulse
	          end
          5'h13 : begin //cfifo3
		    cfifo_ren3     <= ram_ren;
		    cfifo_wen3     <= ram_wen;// ram_wen is a pulse
	          end
          default:begin
	          end
	endcase // casex()
     end // always @ (...
   // vlint flag_empty_block on

   // ram_rdata selection mux
   always @ (   cfifo_slv_rdata0 or cfifo_slv_rdata1
	     or cfifo_slv_rdata2 or cfifo_slv_rdata3 or dram_slv_rdata
	     or ram_sel or sram_slv_rdata or vram_slv_rdata)
     begin
	            ram_rdata       = `DN_W'h0000_dead_beef;
	casex (ram_sel[4:0])   
	  // va_ram
          5'h00 :   ram_rdata       = {8'b0,vram_slv_rdata[`W128D0]};
          5'h01 :   ram_rdata       = {8'b0,vram_slv_rdata[`W128D1]};
          5'h02 :   ram_rdata       = {8'b0,vram_slv_rdata[`W128D2]};
          5'h03 :   ram_rdata       = {8'b0,vram_slv_rdata[`W128D3]};
          5'h04 :   ram_rdata       = {8'b0,vram_slv_rdata[`W128D4]};
          5'h05 :   ram_rdata       = {8'b0,vram_slv_rdata[`W128D5]};
          5'h06 :   ram_rdata       = {8'b0,vram_slv_rdata[`W128D6]};
          5'h07 :   ram_rdata       = {8'b0,vram_slv_rdata[`W128D7]};
          // st_ram
          5'h08 :   ram_rdata       = {24'b0,sram_slv_rdata};
          // dn_ram
          5'h09 :   ram_rdata       = dram_slv_rdata;
	  // cfifo
          5'h10 :   ram_rdata       = {6'b0,cfifo_slv_rdata0};
          5'h11 :   ram_rdata       = {6'b0,cfifo_slv_rdata1};
          5'h12 :   ram_rdata       = {6'b0,cfifo_slv_rdata2};
          5'h13 :   ram_rdata       = {6'b0,cfifo_slv_rdata3};
          default:  ram_rdata       = `DN_W'h0000_dead_beef;
	endcase // casex()
     end // always @ (...


niu_zcp_ram_access_sm  niu_zcp_ram_access_sm
  (/*AUTOINST*/
   // Outputs
   .ram_ren				(ram_ren),
   .ram_wen				(ram_wen),
   .slv_request				(slv_request),
   .ld_ram2reg				(ld_ram2reg),
   .ram_access_state			(ram_access_state[2:0]),
   // Inputs
   .clk					(clk),
   .reset10				(reset10),
   .ld_ram_addr_trail			(ld_ram_addr_trail),
   .slv_accepted			(slv_accepted),
   .rw					(rw));
   

////////////////////////////////////////////////////////////////
//  RDC table
////////////////////////////////////////////////////////////////

   
 /* -------- rdc Registers ---------------------- */   
 zcp_xREG #(4) rdc0_xREG( .clk(clk),.reset(reset[11]),.en(ld_rdc0),.din(wr_data[3:0]),.qout(rdc0));
 zcp_xREG #(4) rdc1_xREG( .clk(clk),.reset(reset[11]),.en(ld_rdc1),.din(wr_data[3:0]),.qout(rdc1));
 zcp_xREG #(4) rdc2_xREG( .clk(clk),.reset(reset[11]),.en(ld_rdc2),.din(wr_data[3:0]),.qout(rdc2));
 zcp_xREG #(4) rdc3_xREG( .clk(clk),.reset(reset[11]),.en(ld_rdc3),.din(wr_data[3:0]),.qout(rdc3));
 zcp_xREG #(4) rdc4_xREG( .clk(clk),.reset(reset[11]),.en(ld_rdc4),.din(wr_data[3:0]),.qout(rdc4));
 zcp_xREG #(4) rdc5_xREG( .clk(clk),.reset(reset[11]),.en(ld_rdc5),.din(wr_data[3:0]),.qout(rdc5));
 zcp_xREG #(4) rdc6_xREG( .clk(clk),.reset(reset[11]),.en(ld_rdc6),.din(wr_data[3:0]),.qout(rdc6));
 zcp_xREG #(4) rdc7_xREG( .clk(clk),.reset(reset[11]),.en(ld_rdc7),.din(wr_data[3:0]),.qout(rdc7));
 zcp_xREG #(4) rdc8_xREG( .clk(clk),.reset(reset[11]),.en(ld_rdc8),.din(wr_data[3:0]),.qout(rdc8));
 zcp_xREG #(4) rdc9_xREG( .clk(clk),.reset(reset[11]),.en(ld_rdc9),.din(wr_data[3:0]),.qout(rdc9));
 zcp_xREG #(4) rdc10_xREG(.clk(clk),.reset(reset[11]),.en(ld_rdc10),.din(wr_data[3:0]),.qout(rdc10));
 zcp_xREG #(4) rdc11_xREG(.clk(clk),.reset(reset[11]),.en(ld_rdc11),.din(wr_data[3:0]),.qout(rdc11));
 zcp_xREG #(4) rdc12_xREG(.clk(clk),.reset(reset[11]),.en(ld_rdc12),.din(wr_data[3:0]),.qout(rdc12));
 zcp_xREG #(4) rdc13_xREG(.clk(clk),.reset(reset[12]),.en(ld_rdc13),.din(wr_data[3:0]),.qout(rdc13));
 zcp_xREG #(4) rdc14_xREG(.clk(clk),.reset(reset[12]),.en(ld_rdc14),.din(wr_data[3:0]),.qout(rdc14));
 zcp_xREG #(4) rdc15_xREG(.clk(clk),.reset(reset[12]),.en(ld_rdc15),.din(wr_data[3:0]),.qout(rdc15));
 zcp_xREG #(4) rdc16_xREG(.clk(clk),.reset(reset[12]),.en(ld_rdc16),.din(wr_data[3:0]),.qout(rdc16));
 zcp_xREG #(4) rdc17_xREG(.clk(clk),.reset(reset[12]),.en(ld_rdc17),.din(wr_data[3:0]),.qout(rdc17));
 zcp_xREG #(4) rdc18_xREG(.clk(clk),.reset(reset[12]),.en(ld_rdc18),.din(wr_data[3:0]),.qout(rdc18));
 zcp_xREG #(4) rdc19_xREG(.clk(clk),.reset(reset[12]),.en(ld_rdc19),.din(wr_data[3:0]),.qout(rdc19));
 zcp_xREG #(4) rdc20_xREG(.clk(clk),.reset(reset[12]),.en(ld_rdc20),.din(wr_data[3:0]),.qout(rdc20));
 zcp_xREG #(4) rdc21_xREG(.clk(clk),.reset(reset[12]),.en(ld_rdc21),.din(wr_data[3:0]),.qout(rdc21));
 zcp_xREG #(4) rdc22_xREG(.clk(clk),.reset(reset[12]),.en(ld_rdc22),.din(wr_data[3:0]),.qout(rdc22));
 zcp_xREG #(4) rdc23_xREG(.clk(clk),.reset(reset[12]),.en(ld_rdc23),.din(wr_data[3:0]),.qout(rdc23));
 zcp_xREG #(4) rdc24_xREG(.clk(clk),.reset(reset[12]),.en(ld_rdc24),.din(wr_data[3:0]),.qout(rdc24));
 zcp_xREG #(4) rdc25_xREG(.clk(clk),.reset(reset[13]),.en(ld_rdc25),.din(wr_data[3:0]),.qout(rdc25));
 zcp_xREG #(4) rdc26_xREG(.clk(clk),.reset(reset[13]),.en(ld_rdc26),.din(wr_data[3:0]),.qout(rdc26));
 zcp_xREG #(4) rdc27_xREG(.clk(clk),.reset(reset[13]),.en(ld_rdc27),.din(wr_data[3:0]),.qout(rdc27));
 zcp_xREG #(4) rdc28_xREG(.clk(clk),.reset(reset[13]),.en(ld_rdc28),.din(wr_data[3:0]),.qout(rdc28));
 zcp_xREG #(4) rdc29_xREG(.clk(clk),.reset(reset[13]),.en(ld_rdc29),.din(wr_data[3:0]),.qout(rdc29));
 zcp_xREG #(4) rdc30_xREG(.clk(clk),.reset(reset[13]),.en(ld_rdc30),.din(wr_data[3:0]),.qout(rdc30));
 zcp_xREG #(4) rdc31_xREG(.clk(clk),.reset(reset[13]),.en(ld_rdc31),.din(wr_data[3:0]),.qout(rdc31));
 zcp_xREG #(4) rdc32_xREG(.clk(clk),.reset(reset[13]),.en(ld_rdc32),.din(wr_data[3:0]),.qout(rdc32));
 zcp_xREG #(4) rdc33_xREG(.clk(clk),.reset(reset[13]),.en(ld_rdc33),.din(wr_data[3:0]),.qout(rdc33));
 zcp_xREG #(4) rdc34_xREG(.clk(clk),.reset(reset[13]),.en(ld_rdc34),.din(wr_data[3:0]),.qout(rdc34));
 zcp_xREG #(4) rdc35_xREG(.clk(clk),.reset(reset[13]),.en(ld_rdc35),.din(wr_data[3:0]),.qout(rdc35));
 zcp_xREG #(4) rdc36_xREG(.clk(clk),.reset(reset[13]),.en(ld_rdc36),.din(wr_data[3:0]),.qout(rdc36));
 zcp_xREG #(4) rdc37_xREG(.clk(clk),.reset(reset[14]),.en(ld_rdc37),.din(wr_data[3:0]),.qout(rdc37));
 zcp_xREG #(4) rdc38_xREG(.clk(clk),.reset(reset[14]),.en(ld_rdc38),.din(wr_data[3:0]),.qout(rdc38));
 zcp_xREG #(4) rdc39_xREG(.clk(clk),.reset(reset[14]),.en(ld_rdc39),.din(wr_data[3:0]),.qout(rdc39));
 zcp_xREG #(4) rdc40_xREG(.clk(clk),.reset(reset[14]),.en(ld_rdc40),.din(wr_data[3:0]),.qout(rdc40));
 zcp_xREG #(4) rdc41_xREG(.clk(clk),.reset(reset[14]),.en(ld_rdc41),.din(wr_data[3:0]),.qout(rdc41));
 zcp_xREG #(4) rdc42_xREG(.clk(clk),.reset(reset[14]),.en(ld_rdc42),.din(wr_data[3:0]),.qout(rdc42));
 zcp_xREG #(4) rdc43_xREG(.clk(clk),.reset(reset[14]),.en(ld_rdc43),.din(wr_data[3:0]),.qout(rdc43));
 zcp_xREG #(4) rdc44_xREG(.clk(clk),.reset(reset[14]),.en(ld_rdc44),.din(wr_data[3:0]),.qout(rdc44));
 zcp_xREG #(4) rdc45_xREG(.clk(clk),.reset(reset[14]),.en(ld_rdc45),.din(wr_data[3:0]),.qout(rdc45));
 zcp_xREG #(4) rdc46_xREG(.clk(clk),.reset(reset[14]),.en(ld_rdc46),.din(wr_data[3:0]),.qout(rdc46));
 zcp_xREG #(4) rdc47_xREG(.clk(clk),.reset(reset[14]),.en(ld_rdc47),.din(wr_data[3:0]),.qout(rdc47));
 zcp_xREG #(4) rdc48_xREG(.clk(clk),.reset(reset[14]),.en(ld_rdc48),.din(wr_data[3:0]),.qout(rdc48));
 zcp_xREG #(4) rdc49_xREG(.clk(clk),.reset(reset[15]),.en(ld_rdc49),.din(wr_data[3:0]),.qout(rdc49));
 zcp_xREG #(4) rdc50_xREG(.clk(clk),.reset(reset[15]),.en(ld_rdc50),.din(wr_data[3:0]),.qout(rdc50));
 zcp_xREG #(4) rdc51_xREG(.clk(clk),.reset(reset[15]),.en(ld_rdc51),.din(wr_data[3:0]),.qout(rdc51));
 zcp_xREG #(4) rdc52_xREG(.clk(clk),.reset(reset[15]),.en(ld_rdc52),.din(wr_data[3:0]),.qout(rdc52));
 zcp_xREG #(4) rdc53_xREG(.clk(clk),.reset(reset[15]),.en(ld_rdc53),.din(wr_data[3:0]),.qout(rdc53));
 zcp_xREG #(4) rdc54_xREG(.clk(clk),.reset(reset[15]),.en(ld_rdc54),.din(wr_data[3:0]),.qout(rdc54));
 zcp_xREG #(4) rdc55_xREG(.clk(clk),.reset(reset[15]),.en(ld_rdc55),.din(wr_data[3:0]),.qout(rdc55));
 zcp_xREG #(4) rdc56_xREG(.clk(clk),.reset(reset[15]),.en(ld_rdc56),.din(wr_data[3:0]),.qout(rdc56));
 zcp_xREG #(4) rdc57_xREG(.clk(clk),.reset(reset[15]),.en(ld_rdc57),.din(wr_data[3:0]),.qout(rdc57));
 zcp_xREG #(4) rdc58_xREG(.clk(clk),.reset(reset[15]),.en(ld_rdc58),.din(wr_data[3:0]),.qout(rdc58));
 zcp_xREG #(4) rdc59_xREG(.clk(clk),.reset(reset[15]),.en(ld_rdc59),.din(wr_data[3:0]),.qout(rdc59));
 zcp_xREG #(4) rdc60_xREG(.clk(clk),.reset(reset[15]),.en(ld_rdc60),.din(wr_data[3:0]),.qout(rdc60));
 zcp_xREG #(4) rdc61_xREG(.clk(clk),.reset(reset[16]),.en(ld_rdc61),.din(wr_data[3:0]),.qout(rdc61));
 zcp_xREG #(4) rdc62_xREG(.clk(clk),.reset(reset[16]),.en(ld_rdc62),.din(wr_data[3:0]),.qout(rdc62));
 zcp_xREG #(4) rdc63_xREG(.clk(clk),.reset(reset[16]),.en(ld_rdc63),.din(wr_data[3:0]),.qout(rdc63));
 zcp_xREG #(4) rdc64_xREG(.clk(clk),.reset(reset[16]),.en(ld_rdc64),.din(wr_data[3:0]),.qout(rdc64));
 zcp_xREG #(4) rdc65_xREG(.clk(clk),.reset(reset[16]),.en(ld_rdc65),.din(wr_data[3:0]),.qout(rdc65));
 zcp_xREG #(4) rdc66_xREG(.clk(clk),.reset(reset[16]),.en(ld_rdc66),.din(wr_data[3:0]),.qout(rdc66));
 zcp_xREG #(4) rdc67_xREG(.clk(clk),.reset(reset[16]),.en(ld_rdc67),.din(wr_data[3:0]),.qout(rdc67));
 zcp_xREG #(4) rdc68_xREG(.clk(clk),.reset(reset[16]),.en(ld_rdc68),.din(wr_data[3:0]),.qout(rdc68));
 zcp_xREG #(4) rdc69_xREG(.clk(clk),.reset(reset[16]),.en(ld_rdc69),.din(wr_data[3:0]),.qout(rdc69));
 zcp_xREG #(4) rdc70_xREG(.clk(clk),.reset(reset[16]),.en(ld_rdc70),.din(wr_data[3:0]),.qout(rdc70));
 zcp_xREG #(4) rdc71_xREG(.clk(clk),.reset(reset[16]),.en(ld_rdc71),.din(wr_data[3:0]),.qout(rdc71));
 zcp_xREG #(4) rdc72_xREG(.clk(clk),.reset(reset[16]),.en(ld_rdc72),.din(wr_data[3:0]),.qout(rdc72));
 zcp_xREG #(4) rdc73_xREG(.clk(clk),.reset(reset[17]),.en(ld_rdc73),.din(wr_data[3:0]),.qout(rdc73));
 zcp_xREG #(4) rdc74_xREG(.clk(clk),.reset(reset[17]),.en(ld_rdc74),.din(wr_data[3:0]),.qout(rdc74));
 zcp_xREG #(4) rdc75_xREG(.clk(clk),.reset(reset[17]),.en(ld_rdc75),.din(wr_data[3:0]),.qout(rdc75));
 zcp_xREG #(4) rdc76_xREG(.clk(clk),.reset(reset[17]),.en(ld_rdc76),.din(wr_data[3:0]),.qout(rdc76));
 zcp_xREG #(4) rdc77_xREG(.clk(clk),.reset(reset[17]),.en(ld_rdc77),.din(wr_data[3:0]),.qout(rdc77));
 zcp_xREG #(4) rdc78_xREG(.clk(clk),.reset(reset[17]),.en(ld_rdc78),.din(wr_data[3:0]),.qout(rdc78));
 zcp_xREG #(4) rdc79_xREG(.clk(clk),.reset(reset[17]),.en(ld_rdc79),.din(wr_data[3:0]),.qout(rdc79));
 zcp_xREG #(4) rdc80_xREG(.clk(clk),.reset(reset[17]),.en(ld_rdc80),.din(wr_data[3:0]),.qout(rdc80));
 zcp_xREG #(4) rdc81_xREG(.clk(clk),.reset(reset[17]),.en(ld_rdc81),.din(wr_data[3:0]),.qout(rdc81));
 zcp_xREG #(4) rdc82_xREG(.clk(clk),.reset(reset[17]),.en(ld_rdc82),.din(wr_data[3:0]),.qout(rdc82));
 zcp_xREG #(4) rdc83_xREG(.clk(clk),.reset(reset[17]),.en(ld_rdc83),.din(wr_data[3:0]),.qout(rdc83));
 zcp_xREG #(4) rdc84_xREG(.clk(clk),.reset(reset[17]),.en(ld_rdc84),.din(wr_data[3:0]),.qout(rdc84));
 zcp_xREG #(4) rdc85_xREG(.clk(clk),.reset(reset[18]),.en(ld_rdc85),.din(wr_data[3:0]),.qout(rdc85));
 zcp_xREG #(4) rdc86_xREG(.clk(clk),.reset(reset[18]),.en(ld_rdc86),.din(wr_data[3:0]),.qout(rdc86));
 zcp_xREG #(4) rdc87_xREG(.clk(clk),.reset(reset[18]),.en(ld_rdc87),.din(wr_data[3:0]),.qout(rdc87));
 zcp_xREG #(4) rdc88_xREG(.clk(clk),.reset(reset[18]),.en(ld_rdc88),.din(wr_data[3:0]),.qout(rdc88));
 zcp_xREG #(4) rdc89_xREG(.clk(clk),.reset(reset[18]),.en(ld_rdc89),.din(wr_data[3:0]),.qout(rdc89));
 zcp_xREG #(4) rdc90_xREG(.clk(clk),.reset(reset[18]),.en(ld_rdc90),.din(wr_data[3:0]),.qout(rdc90));
 zcp_xREG #(4) rdc91_xREG(.clk(clk),.reset(reset[18]),.en(ld_rdc91),.din(wr_data[3:0]),.qout(rdc91));
 zcp_xREG #(4) rdc92_xREG(.clk(clk),.reset(reset[18]),.en(ld_rdc92),.din(wr_data[3:0]),.qout(rdc92));
 zcp_xREG #(4) rdc93_xREG(.clk(clk),.reset(reset[18]),.en(ld_rdc93),.din(wr_data[3:0]),.qout(rdc93));
 zcp_xREG #(4) rdc94_xREG(.clk(clk),.reset(reset[18]),.en(ld_rdc94),.din(wr_data[3:0]),.qout(rdc94));
 zcp_xREG #(4) rdc95_xREG(.clk(clk),.reset(reset[18]),.en(ld_rdc95),.din(wr_data[3:0]),.qout(rdc95));
 zcp_xREG #(4) rdc96_xREG(.clk(clk),.reset(reset[18]),.en(ld_rdc96),.din(wr_data[3:0]),.qout(rdc96));
 zcp_xREG #(4) rdc97_xREG(.clk(clk),.reset(reset[19]),.en(ld_rdc97),.din(wr_data[3:0]),.qout(rdc97));
 zcp_xREG #(4) rdc98_xREG(.clk(clk),.reset(reset[19]),.en(ld_rdc98),.din(wr_data[3:0]),.qout(rdc98));
 zcp_xREG #(4) rdc99_xREG(.clk(clk),.reset(reset[19]),.en(ld_rdc99),.din(wr_data[3:0]),.qout(rdc99));
 zcp_xREG #(4) rdc100_xREG(.clk(clk),.reset(reset[19]),.en(ld_rdc100),.din(wr_data[3:0]),.qout(rdc100));
 zcp_xREG #(4) rdc101_xREG(.clk(clk),.reset(reset[19]),.en(ld_rdc101),.din(wr_data[3:0]),.qout(rdc101));
 zcp_xREG #(4) rdc102_xREG(.clk(clk),.reset(reset[19]),.en(ld_rdc102),.din(wr_data[3:0]),.qout(rdc102));
 zcp_xREG #(4) rdc103_xREG(.clk(clk),.reset(reset[19]),.en(ld_rdc103),.din(wr_data[3:0]),.qout(rdc103));
 zcp_xREG #(4) rdc104_xREG(.clk(clk),.reset(reset[19]),.en(ld_rdc104),.din(wr_data[3:0]),.qout(rdc104));
 zcp_xREG #(4) rdc105_xREG(.clk(clk),.reset(reset[19]),.en(ld_rdc105),.din(wr_data[3:0]),.qout(rdc105));
 zcp_xREG #(4) rdc106_xREG(.clk(clk),.reset(reset[19]),.en(ld_rdc106),.din(wr_data[3:0]),.qout(rdc106));
 zcp_xREG #(4) rdc107_xREG(.clk(clk),.reset(reset[19]),.en(ld_rdc107),.din(wr_data[3:0]),.qout(rdc107));
 zcp_xREG #(4) rdc108_xREG(.clk(clk),.reset(reset[19]),.en(ld_rdc108),.din(wr_data[3:0]),.qout(rdc108));
 zcp_xREG #(4) rdc109_xREG(.clk(clk),.reset(reset[20]),.en(ld_rdc109),.din(wr_data[3:0]),.qout(rdc109));
 zcp_xREG #(4) rdc110_xREG(.clk(clk),.reset(reset[20]),.en(ld_rdc110),.din(wr_data[3:0]),.qout(rdc110));
 zcp_xREG #(4) rdc111_xREG(.clk(clk),.reset(reset[20]),.en(ld_rdc111),.din(wr_data[3:0]),.qout(rdc111));
 zcp_xREG #(4) rdc112_xREG(.clk(clk),.reset(reset[20]),.en(ld_rdc112),.din(wr_data[3:0]),.qout(rdc112));
 zcp_xREG #(4) rdc113_xREG(.clk(clk),.reset(reset[20]),.en(ld_rdc113),.din(wr_data[3:0]),.qout(rdc113));
 zcp_xREG #(4) rdc114_xREG(.clk(clk),.reset(reset[20]),.en(ld_rdc114),.din(wr_data[3:0]),.qout(rdc114));
 zcp_xREG #(4) rdc115_xREG(.clk(clk),.reset(reset[20]),.en(ld_rdc115),.din(wr_data[3:0]),.qout(rdc115));
 zcp_xREG #(4) rdc116_xREG(.clk(clk),.reset(reset[20]),.en(ld_rdc116),.din(wr_data[3:0]),.qout(rdc116));
 zcp_xREG #(4) rdc117_xREG(.clk(clk),.reset(reset[20]),.en(ld_rdc117),.din(wr_data[3:0]),.qout(rdc117));
 zcp_xREG #(4) rdc118_xREG(.clk(clk),.reset(reset[20]),.en(ld_rdc118),.din(wr_data[3:0]),.qout(rdc118));
 zcp_xREG #(4) rdc119_xREG(.clk(clk),.reset(reset[20]),.en(ld_rdc119),.din(wr_data[3:0]),.qout(rdc119));
 zcp_xREG #(4) rdc120_xREG(.clk(clk),.reset(reset[20]),.en(ld_rdc120),.din(wr_data[3:0]),.qout(rdc120));
 zcp_xREG #(4) rdc121_xREG(.clk(clk),.reset(reset[21]),.en(ld_rdc121),.din(wr_data[3:0]),.qout(rdc121));
 zcp_xREG #(4) rdc122_xREG(.clk(clk),.reset(reset[21]),.en(ld_rdc122),.din(wr_data[3:0]),.qout(rdc122));
 zcp_xREG #(4) rdc123_xREG(.clk(clk),.reset(reset[21]),.en(ld_rdc123),.din(wr_data[3:0]),.qout(rdc123));
 zcp_xREG #(4) rdc124_xREG(.clk(clk),.reset(reset[21]),.en(ld_rdc124),.din(wr_data[3:0]),.qout(rdc124));
 zcp_xREG #(4) rdc125_xREG(.clk(clk),.reset(reset[21]),.en(ld_rdc125),.din(wr_data[3:0]),.qout(rdc125));
 zcp_xREG #(4) rdc126_xREG(.clk(clk),.reset(reset[21]),.en(ld_rdc126),.din(wr_data[3:0]),.qout(rdc126));
 zcp_xREG #(4) rdc127_xREG(.clk(clk),.reset(reset[21]),.en(ld_rdc127),.din(wr_data[3:0]),.qout(rdc127));


/* --- rdc decoder -------------------------- */
 
 always @ (/*AUTOSENSE*/rdc0 or rdc1 or rdc10 or rdc100 or rdc101
	   or rdc102 or rdc103 or rdc104 or rdc105 or rdc106 or rdc107
	   or rdc108 or rdc109 or rdc11 or rdc110 or rdc111 or rdc112
	   or rdc113 or rdc114 or rdc115 or rdc116 or rdc117 or rdc118
	   or rdc119 or rdc12 or rdc120 or rdc121 or rdc122 or rdc123
	   or rdc124 or rdc125 or rdc126 or rdc127 or rdc13 or rdc14
	   or rdc15 or rdc16 or rdc17 or rdc18 or rdc19 or rdc2
	   or rdc20 or rdc21 or rdc22 or rdc23 or rdc24 or rdc25
	   or rdc26 or rdc27 or rdc28 or rdc29 or rdc3 or rdc30
	   or rdc31 or rdc32 or rdc33 or rdc34 or rdc35 or rdc36
	   or rdc37 or rdc38 or rdc39 or rdc4 or rdc40 or rdc41
	   or rdc42 or rdc43 or rdc44 or rdc45 or rdc46 or rdc47
	   or rdc48 or rdc49 or rdc5 or rdc50 or rdc51 or rdc52
	   or rdc53 or rdc54 or rdc55 or rdc56 or rdc57 or rdc58
	   or rdc59 or rdc6 or rdc60 or rdc61 or rdc62 or rdc63
	   or rdc64 or rdc65 or rdc66 or rdc67 or rdc68 or rdc69
	   or rdc7 or rdc70 or rdc71 or rdc72 or rdc73 or rdc74
	   or rdc75 or rdc76 or rdc77 or rdc78 or rdc79 or rdc8
	   or rdc80 or rdc81 or rdc82 or rdc83 or rdc84 or rdc85
	   or rdc86 or rdc87 or rdc88 or rdc89 or rdc9 or rdc90
	   or rdc91 or rdc92 or rdc93 or rdc94 or rdc95 or rdc96
	   or rdc97 or rdc98 or rdc99 or sel_rdc)   
   begin                    
             rdc         = rdc0; 
     casex ({sel_rdc[7:5],sel_rdc[3:0]})   // synopsys parallel_case full_case infer_mux
       7'd0: rdc         = rdc0; 
       7'd1: rdc         = rdc1; 
       7'd2: rdc         = rdc2; 
       7'd3: rdc         = rdc3; 
       7'd4: rdc         = rdc4; 
       7'd5: rdc         = rdc5; 
       7'd6: rdc         = rdc6; 
       7'd7: rdc         = rdc7; 
       7'd8: rdc         = rdc8; 
       7'd9: rdc         = rdc9; 
       7'd10: rdc         = rdc10; 
       7'd11: rdc         = rdc11; 
       7'd12: rdc         = rdc12; 
       7'd13: rdc         = rdc13; 
       7'd14: rdc         = rdc14; 
       7'd15: rdc         = rdc15; 
       7'd16: rdc         = rdc16; 
       7'd17: rdc         = rdc17; 
       7'd18: rdc         = rdc18; 
       7'd19: rdc         = rdc19; 
       7'd20: rdc         = rdc20; 
       7'd21: rdc         = rdc21; 
       7'd22: rdc         = rdc22; 
       7'd23: rdc         = rdc23; 
       7'd24: rdc         = rdc24; 
       7'd25: rdc         = rdc25; 
       7'd26: rdc         = rdc26; 
       7'd27: rdc         = rdc27; 
       7'd28: rdc         = rdc28; 
       7'd29: rdc         = rdc29; 
       7'd30: rdc         = rdc30; 
       7'd31: rdc         = rdc31; 
       7'd32: rdc         = rdc32; 
       7'd33: rdc         = rdc33; 
       7'd34: rdc         = rdc34; 
       7'd35: rdc         = rdc35; 
       7'd36: rdc         = rdc36; 
       7'd37: rdc         = rdc37; 
       7'd38: rdc         = rdc38; 
       7'd39: rdc         = rdc39; 
       7'd40: rdc         = rdc40; 
       7'd41: rdc         = rdc41; 
       7'd42: rdc         = rdc42; 
       7'd43: rdc         = rdc43; 
       7'd44: rdc         = rdc44; 
       7'd45: rdc         = rdc45; 
       7'd46: rdc         = rdc46; 
       7'd47: rdc         = rdc47; 
       7'd48: rdc         = rdc48; 
       7'd49: rdc         = rdc49; 
       7'd50: rdc         = rdc50; 
       7'd51: rdc         = rdc51; 
       7'd52: rdc         = rdc52; 
       7'd53: rdc         = rdc53; 
       7'd54: rdc         = rdc54; 
       7'd55: rdc         = rdc55; 
       7'd56: rdc         = rdc56; 
       7'd57: rdc         = rdc57; 
       7'd58: rdc         = rdc58; 
       7'd59: rdc         = rdc59; 
       7'd60: rdc         = rdc60; 
       7'd61: rdc         = rdc61; 
       7'd62: rdc         = rdc62; 
       7'd63: rdc         = rdc63; 
       7'd64: rdc         = rdc64; 
       7'd65: rdc         = rdc65; 
       7'd66: rdc         = rdc66; 
       7'd67: rdc         = rdc67; 
       7'd68: rdc         = rdc68; 
       7'd69: rdc         = rdc69; 
       7'd70: rdc         = rdc70; 
       7'd71: rdc         = rdc71; 
       7'd72: rdc         = rdc72; 
       7'd73: rdc         = rdc73; 
       7'd74: rdc         = rdc74; 
       7'd75: rdc         = rdc75; 
       7'd76: rdc         = rdc76; 
       7'd77: rdc         = rdc77; 
       7'd78: rdc         = rdc78; 
       7'd79: rdc         = rdc79; 
       7'd80: rdc         = rdc80; 
       7'd81: rdc         = rdc81; 
       7'd82: rdc         = rdc82; 
       7'd83: rdc         = rdc83; 
       7'd84: rdc         = rdc84; 
       7'd85: rdc         = rdc85; 
       7'd86: rdc         = rdc86; 
       7'd87: rdc         = rdc87; 
       7'd88: rdc         = rdc88; 
       7'd89: rdc         = rdc89; 
       7'd90: rdc         = rdc90; 
       7'd91: rdc         = rdc91; 
       7'd92: rdc         = rdc92; 
       7'd93: rdc         = rdc93; 
       7'd94: rdc         = rdc94; 
       7'd95: rdc         = rdc95; 
       7'd96: rdc         = rdc96; 
       7'd97: rdc         = rdc97; 
       7'd98: rdc         = rdc98; 
       7'd99: rdc         = rdc99; 
       7'd100: rdc         = rdc100; 
       7'd101: rdc         = rdc101; 
       7'd102: rdc         = rdc102; 
       7'd103: rdc         = rdc103; 
       7'd104: rdc         = rdc104; 
       7'd105: rdc         = rdc105; 
       7'd106: rdc         = rdc106; 
       7'd107: rdc         = rdc107; 
       7'd108: rdc         = rdc108; 
       7'd109: rdc         = rdc109; 
       7'd110: rdc         = rdc110; 
       7'd111: rdc         = rdc111; 
       7'd112: rdc         = rdc112; 
       7'd113: rdc         = rdc113; 
       7'd114: rdc         = rdc114; 
       7'd115: rdc         = rdc115; 
       7'd116: rdc         = rdc116; 
       7'd117: rdc         = rdc117; 
       7'd118: rdc         = rdc118; 
       7'd119: rdc         = rdc119; 
       7'd120: rdc         = rdc120; 
       7'd121: rdc         = rdc121; 
       7'd122: rdc         = rdc122; 
       7'd123: rdc         = rdc123; 
       7'd124: rdc         = rdc124; 
       7'd125: rdc         = rdc125; 
       7'd126: rdc         = rdc126; 
       7'd127: rdc         = rdc127; 
       default:rdc         = rdc0; 
     endcase 
   end // always @ (...
   

   assign sel_rdc[7:0] =  decode_zc_rdc      ? tt_rdc_reg[7:0] : 
                          decode_default_rdc ? fflp_rdc[7:0]   :
                                              {fflp_rdc[7:5],5'b0}; // table_rdc

 // default_rdc is abailable @ DLY1 state
 zcp_xREG #(5) default_rdc_xREG(.clk(clk),.reset(reset[21]),.en(decode_default_rdc),.din({1'b0,rdc}),.qout(default_rdc[4:0]));

 // table_rdc is abailable @ DLY2 state 
 zcp_xREG #(5) table_rdc_xREG  (.clk(clk),.reset(reset[21]),.en(decode_table_rdc),  .din({1'b0,rdc}),.qout(table_rdc[4:0]));

 // zc_rdc is available @ CAL2 state
 zcp_xREG #(5) zc_rdc_xREG     (.clk(clk),.reset(reset[21]),.en(decode_zc_rdc),     .din({1'b0,rdc}),.qout(zc_rdc[4:0]));    

niu_zcp_handle_decoder niu_zcp_handle_decoder
  (/*AUTOINST*/
   // Outputs
   .fn					(fn[1:0]),
   .handle				(handle[19:0]),
   // Inputs
   .zc_rdc				(zc_rdc[3:0]),
   .rdmc_zcp_func_num			(rdmc_zcp_func_num[31:0]),
   .page_handle				(page_handle[`PMS15:0]));

/* --------------- spare gates --------------- */
`ifdef NEPTUNE
wire      [3:0] do_nad;
wire      [3:0] do_nor;
wire      [3:0] do_inv;
wire      [3:0] do_mux;
wire      [3:0] do_q;
wire            so;

  zcp_spare_gates zcp_slv_spare_gates (
                             .di_nd3     ({1'h1, 1'h1, do_q[3]}),
                             .di_nd2     ({1'h1, 1'h1, do_q[2]}),
                             .di_nd1     ({1'h1, 1'h1, do_q[1]}),
                             .di_nd0     ({1'h1, 1'h1, do_q[0]}),
                             .di_nr3     ({1'h0, 1'h0}),
                             .di_nr2     ({1'h0, 1'h0}),
                             .di_nr1     ({1'h0, 1'h0}),
                             .di_nr0     ({1'h0, 1'h0}),
                             .di_inv     (do_nad[3:0]),
                             .di_mx3     ({1'h0, 1'h0}),
                             .di_mx2     ({1'h0, 1'h0}),
                             .di_mx1     ({1'h0, 1'h0}),
                             .di_mx0     ({1'h0, 1'h0}),
                             .mx_sel     (do_nor[3:0]),
                             .di_reg     (do_inv[3:0]),
                             .wt_ena     (do_mux[3:0]),
                             .rst        ({reset[0],reset[0],reset[0],reset[0]}),
                             .si         (1'h0),
                             .se         (1'h0),
                             .clk        (clk),
                             .do_nad     (do_nad[3:0]),
                             .do_nor     (do_nor[3:0]),
                             .do_inv     (do_inv[3:0]),
                             .do_mux     (do_mux[3:0]),
                             .do_q       (do_q[3:0]),
                             .so         (so)
                            );

`else
`endif
      
endmodule // niu_zcp_slv

