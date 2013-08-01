// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: n2_niu_tc_128x200s_cust.v
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
`define NIU_SCAM_IDL           3'b000
`define NIU_SCAM_CMP1          3'b001
`define NIU_SCAM_CMP2          3'b010
`define NIU_SCAM_CMP3          3'b100

`define NIU_SCAM_PIO_W_IDL     2'b00
`define NIU_SCAM_PIO_W1        2'b01
`define NIU_SCAM_PIO_W2        2'b10

`define NIU_SCAM_PIO_R_IDL     2'b00
`define NIU_SCAM_PIO_R1        2'b01
`define NIU_SCAM_PIO_R2        2'b10
 
module n2_niu_tc_128x200s_cust (
                 data_inp,    
		 cam_compare,
                 pio_wt,      
		 pio_rd,     
		 pio_sel, 
		 cam_index, 
                 reset,       
		 clk, 
		 tcu_se_scancollar_in,
		 tcu_se_scancollar_out,
		 tcu_array_wr_inhibit,
		 tcu_aclk,
		 tcu_bclk,
	 	 tcu_pce_ov,
		 pce,
		 scan_in,
		 scan_out,
                 cam_valid,   
		 cam_hit,    
		 cam_haddr, 
                 pio_rd_vld,
                 msk_dat_out);  
		 
		  

input  [199:0] data_inp;      // compare_data/pio_data_input 
input          cam_compare;   // initiate compare operation 
input          pio_wt;        // if 1, pio writes to  cam's data or mask or valid planes. 
input          pio_rd;        // if 1, pio reads from cam's data or mask or valid planes. 
input          pio_sel;       // pio access cam's mask<=1, data<=0 plane 
input    [6:0] cam_index;     // pio access address,             N2: {1'b0,cam_index[6:0]} 
input          reset;
input          clk;

input	       tcu_se_scancollar_in;   // dft - se for input flops	       default=0
input	       tcu_se_scancollar_out;  // dft - se for output flops	       default=0
input	       tcu_array_wr_inhibit;   // dft - write inhibit during scan      default=0
input	       tcu_aclk;	       // dft - scan clock a		       default=0
input	       tcu_bclk;	       // dft - scan clock b		       default=0
input	       scan_in; 	       // dft - scan in    default= previous flop output
 
input	       tcu_pce_ov;
input	       pce;


output	       scan_out;	       // dft - scan out

output         cam_valid;     // if 1, cam is ready to accept a new comparison  
output         cam_hit;       // if 1, there is a cam match/hit
output   [6:0] cam_haddr;     // index of a cam match/hit entry, N2: {1'b0,haddr[6:0]} 
output         pio_rd_vld;    // pio_read_out_data valid for the core_clk domain
output [199:0] msk_dat_out;   // pio data read out of cam's mask  or data plane  

wire           cam_valid; 
wire           cam_hit; 
wire     [6:0] cam_haddr;
wire           pio_rd_vld;
wire   [199:0] msk_dat_out;
wire           scan_out;

// ----------- wire definition --------------------

wire   [199:0] saout;
wire   [199:0] din;
wire           hit;
wire     [6:0] haddr;
wire           cp3;
wire           sel_msk;
wire     [6:0] index;
wire           r_en_b;
wire           w_en_b;
wire           k_en_b;
wire   [127:0] ml_sout;


wire     [6:0] so_haddr;
wire           siclk;
wire           soclk;
wire   [199:0] so_in;
wire   [199:0] so_out;
wire     [6:0] haddr_in;
wire     [6:0] so_index;
wire           hit_in;
wire           pio_sel_in;
wire           l1clk;
wire           rw1;
/*--------------------------------------------------------*/
wire [2:0]     c_scam_st;
wire [1:0]     c_pio_w_st;
wire [1:0]     c_pio_r_st;

wire [2:0]     n_scam_st_in;
wire [1:0]     n_pio_w_st_in;
wire [1:0]     n_pio_r_st_in;

reg [2:0]      n_scam_st;
reg [1:0]      n_pio_w_st;
reg [1:0]      n_pio_r_st;

wire	       compare_d;  
wire	       write_d;
wire	       read_d;
wire	       compare_in;
wire	       pio_rd_in;
wire	       pio_wt_in;
wire	       cam_compare_sm;
wire	       pio_wt_sm;
wire	       pio_rd_sm;

wire           rd_vld;
wire           cam_vld;
wire           l1clk_out;

wire           so_camvld;
wire           so_rdvld;
wire           so_comp;
wire           so_wrt;
wire           so_read;
wire [1:0]     so_rst; 
wire [2:0]     so_cst; 
wire  [1:0]    so_wst;


integer j;
// input flops
  assign pio_sel_in = (rw1 && sel_msk) || (!rw1 && pio_sel); 
  assign compare_in = cam_compare && !reset;
  assign pio_rd_in = pio_rd && !reset;
  assign pio_wt_in = pio_wt && !reset;
  assign n_scam_st_in = n_scam_st[2:0] & ({3{!reset}});
  assign n_pio_r_st_in = n_pio_r_st[1:0] & ({2{!reset}});
  assign n_pio_w_st_in = n_pio_w_st[1:0] & ({2{!reset}});

// output flops
  assign cam_vld = c_scam_st[2] && !reset; 
  assign rd_vld = c_pio_r_st[1] && !reset;
  assign hit_in = cp3 & !reset & hit;
  assign haddr_in[6:0] =  {7{cp3}} & {7{hit}} & {7{!reset}} & haddr[6:0];
  
  assign scan_out = so_out[0];  
  
/**********************************************************/

/**********************************************************/
  assign w_en_b = !(!(c_scam_st[0]  || c_scam_st[1]   || c_scam_st[2]) && 
                      c_pio_w_st[0])  || 
		      tcu_array_wr_inhibit;

  assign r_en_b = !(( (c_pio_r_st[0]  && !c_scam_st[0])  ||
                      (c_pio_r_st[1]  && c_scam_st[1]) ) &&
		     !( c_pio_w_st[0]  || c_pio_w_st[1]) )
		     || tcu_array_wr_inhibit;  
  
  assign k_en_b = !c_scam_st[0] || tcu_array_wr_inhibit;
  assign cp3 = c_scam_st[2];
  assign rw1 = c_pio_r_st[0] || c_pio_w_st[0];

  assign cam_compare_sm = !tcu_se_scancollar_in && cam_compare;
  assign pio_wt_sm = !tcu_se_scancollar_in && pio_wt;
  assign pio_rd_sm = !tcu_se_scancollar_in && pio_rd;
/**********************************************************/

  always @( cam_compare_sm or compare_d or c_scam_st
          ) begin

    n_scam_st      = `NIU_SCAM_IDL;


    case (c_scam_st)                 //synopsys parallel_case
      (`NIU_SCAM_IDL):
        begin
          if (compare_d || cam_compare_sm) begin
            n_scam_st    = `NIU_SCAM_CMP1;
          end
          else begin
            n_scam_st    = `NIU_SCAM_IDL;
          end
        end
      (`NIU_SCAM_CMP1):
        begin
            n_scam_st    = `NIU_SCAM_CMP2;
          end
      (`NIU_SCAM_CMP2):
        begin
            n_scam_st    = `NIU_SCAM_CMP3;
          end
      (`NIU_SCAM_CMP3):
        begin
            n_scam_st    = `NIU_SCAM_IDL;
          end
     default:
        begin
            n_scam_st    = `NIU_SCAM_IDL;
        end
    endcase
  end

/**********************************************************/

 always @(pio_wt_sm or write_d  or c_pio_w_st
         ) begin

   n_pio_w_st      = `NIU_SCAM_PIO_W_IDL;

   case (c_pio_w_st)                 //synopsys parallel_case
     (`NIU_SCAM_PIO_W_IDL):
       begin
         if (pio_wt_sm || write_d) begin
           n_pio_w_st      = `NIU_SCAM_PIO_W1;
         end
         else begin
           n_pio_w_st      = `NIU_SCAM_PIO_W_IDL;
         end
       end
     (`NIU_SCAM_PIO_W1):
       begin
           n_pio_w_st      = `NIU_SCAM_PIO_W2;
       end
     (`NIU_SCAM_PIO_W2):
       begin
         if (pio_wt_sm) begin
           n_pio_w_st      = `NIU_SCAM_PIO_W1;
         end
         else begin
           n_pio_w_st      = `NIU_SCAM_PIO_W_IDL;
         end
        end
     default:
       begin
           n_pio_w_st      = `NIU_SCAM_PIO_W_IDL;
       end
   endcase
 end


/**********************************************************/

 always @(pio_rd_sm or read_d or c_pio_r_st
         ) begin

   n_pio_r_st      = `NIU_SCAM_PIO_R_IDL;

   case (c_pio_r_st)                 //synopsys parallel_case
     (`NIU_SCAM_PIO_R_IDL):
       begin
         if (pio_rd_sm|| read_d) begin
           n_pio_r_st      = `NIU_SCAM_PIO_R1;
         end
         else begin
           n_pio_r_st      = `NIU_SCAM_PIO_R_IDL;
         end
       end
     (`NIU_SCAM_PIO_R1):
       begin
           n_pio_r_st      = `NIU_SCAM_PIO_R2;
       end
     (`NIU_SCAM_PIO_R2):
       begin
         if (pio_rd_sm) 
           n_pio_r_st      = `NIU_SCAM_PIO_R1;
         else  
           n_pio_r_st      = `NIU_SCAM_PIO_R_IDL;
       end
     default:
       begin
           n_pio_r_st      = `NIU_SCAM_PIO_R_IDL;
       end
   endcase
 end

 
 // ---------------------- CAM's data pre_registered -------------------------  

// ---------------------------------- CAM's arrays -----------------------------  
  n2_tcam_array niu_tcam_ary0 (
                              .din            (din),   
                              .r_en_b         (r_en_b),
                              .w_en_b         (w_en_b),
                              .k_en_b         (k_en_b),
                              .sel_msk        (sel_msk),
                              .index          (index), 
                              .l1clk          (l1clk_out), 
                              .saout          (saout), 
                              .ml_sout        (ml_sout)
                             );

// ---------------------------------- CAM's priority encoder -----------------------------  
  n2_tcam_enc niu_tcam_enc0 (
                              .ml_sout        (ml_sout),
                              .hit            (hit), 
                              .haddr          (haddr)
                             );

// ---------------------------------- CAM's control -----------------------------  
 
//------------------------------  
//---- clock headers   ---------
//------------------------------  

assign siclk = tcu_aclk;
assign soclk = tcu_bclk;

  cl_sc1_l1hdr_12x clk_in(
    .l2clk(clk),
    .pce(pce),
    .l1clk(l1clk_in),
    .se(tcu_se_scancollar_in),
    .pce_ov(tcu_pce_ov),
    .stop(1'b0) 
   );

  cl_sc1_l1hdr_12x clk_out(
    .l2clk(clk),
    .pce(pce),
    .l1clk(l1clk_out),
    .se(tcu_se_scancollar_out),
    .pce_ov(tcu_pce_ov),
    .stop(1'b0) 
   );

//------------------------------  
//---- din flops - left---------
//------------------------------  
cl_sc1_msff_8x	din_l_0  ( .si(scan_in   ), .so(so_in[0]  ), .l1clk(l1clk_in), .siclk(siclk), .soclk(soclk), .d(data_inp[0]  ), .q(din[0] ) );
cl_sc1_msff_8x	din_l_1  ( .si(so_in[0]  ), .so(so_in[1]  ), .l1clk(l1clk_in), .siclk(siclk), .soclk(soclk), .d(data_inp[1]  ), .q(din[1] ) );
cl_sc1_msff_8x	din_l_2  ( .si(so_in[1]  ), .so(so_in[2]  ), .l1clk(l1clk_in), .siclk(siclk), .soclk(soclk), .d(data_inp[2]  ), .q(din[2] ) );
cl_sc1_msff_8x	din_l_3  ( .si(so_in[2]  ), .so(so_in[3]  ), .l1clk(l1clk_in), .siclk(siclk), .soclk(soclk), .d(data_inp[3]  ), .q(din[3] ) );
cl_sc1_msff_8x	din_l_4  ( .si(so_in[3]  ), .so(so_in[4]  ), .l1clk(l1clk_in), .siclk(siclk), .soclk(soclk), .d(data_inp[4]  ), .q(din[4] ) );
cl_sc1_msff_8x	din_l_5  ( .si(so_in[4]  ), .so(so_in[5]  ), .l1clk(l1clk_in), .siclk(siclk), .soclk(soclk), .d(data_inp[5]  ), .q(din[5] ) );
cl_sc1_msff_8x	din_l_6  ( .si(so_in[5]  ), .so(so_in[6]  ), .l1clk(l1clk_in), .siclk(siclk), .soclk(soclk), .d(data_inp[6]  ), .q(din[6] ) );
cl_sc1_msff_8x	din_l_7  ( .si(so_in[6]  ), .so(so_in[7]  ), .l1clk(l1clk_in), .siclk(siclk), .soclk(soclk), .d(data_inp[7]  ), .q(din[7] ) );
cl_sc1_msff_8x	din_l_8  ( .si(so_in[7]  ), .so(so_in[8]  ), .l1clk(l1clk_in), .siclk(siclk), .soclk(soclk), .d(data_inp[8]  ), .q(din[8] ) );
cl_sc1_msff_8x	din_l_9  ( .si(so_in[8]  ), .so(so_in[9]  ), .l1clk(l1clk_in), .siclk(siclk), .soclk(soclk), .d(data_inp[9]  ), .q(din[9] ) );

cl_sc1_msff_8x	din_l_10 ( .si(so_in[9]  ), .so(so_in[10] ), .l1clk(l1clk_in), .siclk(siclk), .soclk(soclk), .d(data_inp[10] ), .q(din[10]) );
cl_sc1_msff_8x	din_l_11 ( .si(so_in[10] ), .so(so_in[11] ), .l1clk(l1clk_in), .siclk(siclk), .soclk(soclk), .d(data_inp[11] ), .q(din[11]) );
cl_sc1_msff_8x	din_l_12 ( .si(so_in[11] ), .so(so_in[12] ), .l1clk(l1clk_in), .siclk(siclk), .soclk(soclk), .d(data_inp[12] ), .q(din[12]) );
cl_sc1_msff_8x	din_l_13 ( .si(so_in[12] ), .so(so_in[13] ), .l1clk(l1clk_in), .siclk(siclk), .soclk(soclk), .d(data_inp[13] ), .q(din[13]) );
cl_sc1_msff_8x	din_l_14 ( .si(so_in[13] ), .so(so_in[14] ), .l1clk(l1clk_in), .siclk(siclk), .soclk(soclk), .d(data_inp[14] ), .q(din[14]) );
cl_sc1_msff_8x	din_l_15 ( .si(so_in[14] ), .so(so_in[15] ), .l1clk(l1clk_in), .siclk(siclk), .soclk(soclk), .d(data_inp[15] ), .q(din[15]) );
cl_sc1_msff_8x	din_l_16 ( .si(so_in[15] ), .so(so_in[16] ), .l1clk(l1clk_in), .siclk(siclk), .soclk(soclk), .d(data_inp[16] ), .q(din[16]) );
cl_sc1_msff_8x	din_l_17 ( .si(so_in[16] ), .so(so_in[17] ), .l1clk(l1clk_in), .siclk(siclk), .soclk(soclk), .d(data_inp[17] ), .q(din[17]) );
cl_sc1_msff_8x	din_l_18 ( .si(so_in[17] ), .so(so_in[18] ), .l1clk(l1clk_in), .siclk(siclk), .soclk(soclk), .d(data_inp[18] ), .q(din[18]) );
cl_sc1_msff_8x	din_l_19 ( .si(so_in[18] ), .so(so_in[19] ), .l1clk(l1clk_in), .siclk(siclk), .soclk(soclk), .d(data_inp[19] ), .q(din[19]) );

cl_sc1_msff_8x	din_l_20 ( .si(so_in[19] ), .so(so_in[20] ), .l1clk(l1clk_in), .siclk(siclk), .soclk(soclk), .d(data_inp[20] ), .q(din[20]) );
cl_sc1_msff_8x	din_l_21 ( .si(so_in[20] ), .so(so_in[21] ), .l1clk(l1clk_in), .siclk(siclk), .soclk(soclk), .d(data_inp[21] ), .q(din[21]) );
cl_sc1_msff_8x	din_l_22 ( .si(so_in[21] ), .so(so_in[22] ), .l1clk(l1clk_in), .siclk(siclk), .soclk(soclk), .d(data_inp[22] ), .q(din[22]) );
cl_sc1_msff_8x	din_l_23 ( .si(so_in[22] ), .so(so_in[23] ), .l1clk(l1clk_in), .siclk(siclk), .soclk(soclk), .d(data_inp[23] ), .q(din[23]) );
cl_sc1_msff_8x	din_l_24 ( .si(so_in[23] ), .so(so_in[24] ), .l1clk(l1clk_in), .siclk(siclk), .soclk(soclk), .d(data_inp[24] ), .q(din[24]) );
cl_sc1_msff_8x	din_l_25 ( .si(so_in[24] ), .so(so_in[25] ), .l1clk(l1clk_in), .siclk(siclk), .soclk(soclk), .d(data_inp[25] ), .q(din[25]) );
cl_sc1_msff_8x	din_l_26 ( .si(so_in[25] ), .so(so_in[26] ), .l1clk(l1clk_in), .siclk(siclk), .soclk(soclk), .d(data_inp[26] ), .q(din[26]) );
cl_sc1_msff_8x	din_l_27 ( .si(so_in[26] ), .so(so_in[27] ), .l1clk(l1clk_in), .siclk(siclk), .soclk(soclk), .d(data_inp[27] ), .q(din[27]) );
cl_sc1_msff_8x	din_l_28 ( .si(so_in[27] ), .so(so_in[28] ), .l1clk(l1clk_in), .siclk(siclk), .soclk(soclk), .d(data_inp[28] ), .q(din[28]) );
cl_sc1_msff_8x	din_l_29 ( .si(so_in[28] ), .so(so_in[29] ), .l1clk(l1clk_in), .siclk(siclk), .soclk(soclk), .d(data_inp[29] ), .q(din[29]) );

cl_sc1_msff_8x	din_l_30 ( .si(so_in[29] ), .so(so_in[30] ), .l1clk(l1clk_in), .siclk(siclk), .soclk(soclk), .d(data_inp[30] ), .q(din[30]) );
cl_sc1_msff_8x	din_l_31 ( .si(so_in[30] ), .so(so_in[31] ), .l1clk(l1clk_in), .siclk(siclk), .soclk(soclk), .d(data_inp[31] ), .q(din[31]) );
cl_sc1_msff_8x	din_l_32 ( .si(so_in[31] ), .so(so_in[32] ), .l1clk(l1clk_in), .siclk(siclk), .soclk(soclk), .d(data_inp[32] ), .q(din[32]) );
cl_sc1_msff_8x	din_l_33 ( .si(so_in[32] ), .so(so_in[33] ), .l1clk(l1clk_in), .siclk(siclk), .soclk(soclk), .d(data_inp[33] ), .q(din[33]) );
cl_sc1_msff_8x	din_l_34 ( .si(so_in[33] ), .so(so_in[34] ), .l1clk(l1clk_in), .siclk(siclk), .soclk(soclk), .d(data_inp[34] ), .q(din[34]) );
cl_sc1_msff_8x	din_l_35 ( .si(so_in[34] ), .so(so_in[35] ), .l1clk(l1clk_in), .siclk(siclk), .soclk(soclk), .d(data_inp[35] ), .q(din[35]) );
cl_sc1_msff_8x	din_l_36 ( .si(so_in[35] ), .so(so_in[36] ), .l1clk(l1clk_in), .siclk(siclk), .soclk(soclk), .d(data_inp[36] ), .q(din[36]) );
cl_sc1_msff_8x	din_l_37 ( .si(so_in[36] ), .so(so_in[37] ), .l1clk(l1clk_in), .siclk(siclk), .soclk(soclk), .d(data_inp[37] ), .q(din[37]) );
cl_sc1_msff_8x	din_l_38 ( .si(so_in[37] ), .so(so_in[38] ), .l1clk(l1clk_in), .siclk(siclk), .soclk(soclk), .d(data_inp[38] ), .q(din[38]) );
cl_sc1_msff_8x	din_l_39 ( .si(so_in[38] ), .so(so_in[39] ), .l1clk(l1clk_in), .siclk(siclk), .soclk(soclk), .d(data_inp[39] ), .q(din[39]) );

cl_sc1_msff_8x	din_l_40 ( .si(so_in[39] ), .so(so_in[40] ), .l1clk(l1clk_in), .siclk(siclk), .soclk(soclk), .d(data_inp[40] ), .q(din[40]) );
cl_sc1_msff_8x	din_l_41 ( .si(so_in[40] ), .so(so_in[41] ), .l1clk(l1clk_in), .siclk(siclk), .soclk(soclk), .d(data_inp[41] ), .q(din[41]) );
cl_sc1_msff_8x	din_l_42 ( .si(so_in[41] ), .so(so_in[42] ), .l1clk(l1clk_in), .siclk(siclk), .soclk(soclk), .d(data_inp[42] ), .q(din[42]) );
cl_sc1_msff_8x	din_l_43 ( .si(so_in[42] ), .so(so_in[43] ), .l1clk(l1clk_in), .siclk(siclk), .soclk(soclk), .d(data_inp[43] ), .q(din[43]) );
cl_sc1_msff_8x	din_l_44 ( .si(so_in[43] ), .so(so_in[44] ), .l1clk(l1clk_in), .siclk(siclk), .soclk(soclk), .d(data_inp[44] ), .q(din[44]) );
cl_sc1_msff_8x	din_l_45 ( .si(so_in[44] ), .so(so_in[45] ), .l1clk(l1clk_in), .siclk(siclk), .soclk(soclk), .d(data_inp[45] ), .q(din[45]) );
cl_sc1_msff_8x	din_l_46 ( .si(so_in[45] ), .so(so_in[46] ), .l1clk(l1clk_in), .siclk(siclk), .soclk(soclk), .d(data_inp[46] ), .q(din[46]) );
cl_sc1_msff_8x	din_l_47 ( .si(so_in[46] ), .so(so_in[47] ), .l1clk(l1clk_in), .siclk(siclk), .soclk(soclk), .d(data_inp[47] ), .q(din[47]) );
cl_sc1_msff_8x	din_l_48 ( .si(so_in[47] ), .so(so_in[48] ), .l1clk(l1clk_in), .siclk(siclk), .soclk(soclk), .d(data_inp[48] ), .q(din[48]) );
cl_sc1_msff_8x	din_l_49 ( .si(so_in[48] ), .so(so_in[49] ), .l1clk(l1clk_in), .siclk(siclk), .soclk(soclk), .d(data_inp[49] ), .q(din[49]) );

cl_sc1_msff_8x	din_l_50 ( .si(so_in[49] ), .so(so_in[50] ), .l1clk(l1clk_in), .siclk(siclk), .soclk(soclk), .d(data_inp[50] ), .q(din[50]) );
cl_sc1_msff_8x	din_l_51 ( .si(so_in[50] ), .so(so_in[51] ), .l1clk(l1clk_in), .siclk(siclk), .soclk(soclk), .d(data_inp[51] ), .q(din[51]) );
cl_sc1_msff_8x	din_l_52 ( .si(so_in[51] ), .so(so_in[52] ), .l1clk(l1clk_in), .siclk(siclk), .soclk(soclk), .d(data_inp[52] ), .q(din[52]) );
cl_sc1_msff_8x	din_l_53 ( .si(so_in[52] ), .so(so_in[53] ), .l1clk(l1clk_in), .siclk(siclk), .soclk(soclk), .d(data_inp[53] ), .q(din[53]) );
cl_sc1_msff_8x	din_l_54 ( .si(so_in[53] ), .so(so_in[54] ), .l1clk(l1clk_in), .siclk(siclk), .soclk(soclk), .d(data_inp[54] ), .q(din[54]) );
cl_sc1_msff_8x	din_l_55 ( .si(so_in[54] ), .so(so_in[55] ), .l1clk(l1clk_in), .siclk(siclk), .soclk(soclk), .d(data_inp[55] ), .q(din[55]) );
cl_sc1_msff_8x	din_l_56 ( .si(so_in[55] ), .so(so_in[56] ), .l1clk(l1clk_in), .siclk(siclk), .soclk(soclk), .d(data_inp[56] ), .q(din[56]) );
cl_sc1_msff_8x	din_l_57 ( .si(so_in[56] ), .so(so_in[57] ), .l1clk(l1clk_in), .siclk(siclk), .soclk(soclk), .d(data_inp[57] ), .q(din[57]) );
cl_sc1_msff_8x	din_l_58 ( .si(so_in[57] ), .so(so_in[58] ), .l1clk(l1clk_in), .siclk(siclk), .soclk(soclk), .d(data_inp[58] ), .q(din[58]) );
cl_sc1_msff_8x	din_l_59 ( .si(so_in[58] ), .so(so_in[59] ), .l1clk(l1clk_in), .siclk(siclk), .soclk(soclk), .d(data_inp[59] ), .q(din[59]) );

cl_sc1_msff_8x	din_l_60 ( .si(so_in[59] ), .so(so_in[60] ), .l1clk(l1clk_in), .siclk(siclk), .soclk(soclk), .d(data_inp[60] ), .q(din[60]) );
cl_sc1_msff_8x	din_l_61 ( .si(so_in[60] ), .so(so_in[61] ), .l1clk(l1clk_in), .siclk(siclk), .soclk(soclk), .d(data_inp[61] ), .q(din[61]) );
cl_sc1_msff_8x	din_l_62 ( .si(so_in[61] ), .so(so_in[62] ), .l1clk(l1clk_in), .siclk(siclk), .soclk(soclk), .d(data_inp[62] ), .q(din[62]) );
cl_sc1_msff_8x	din_l_63 ( .si(so_in[62] ), .so(so_in[63] ), .l1clk(l1clk_in), .siclk(siclk), .soclk(soclk), .d(data_inp[63] ), .q(din[63]) );
cl_sc1_msff_8x	din_l_64 ( .si(so_in[63] ), .so(so_in[64] ), .l1clk(l1clk_in), .siclk(siclk), .soclk(soclk), .d(data_inp[64] ), .q(din[64]) );
cl_sc1_msff_8x	din_l_65 ( .si(so_in[64] ), .so(so_in[65] ), .l1clk(l1clk_in), .siclk(siclk), .soclk(soclk), .d(data_inp[65] ), .q(din[65]) );
cl_sc1_msff_8x	din_l_66 ( .si(so_in[65] ), .so(so_in[66] ), .l1clk(l1clk_in), .siclk(siclk), .soclk(soclk), .d(data_inp[66] ), .q(din[66]) );
cl_sc1_msff_8x	din_l_67 ( .si(so_in[66] ), .so(so_in[67] ), .l1clk(l1clk_in), .siclk(siclk), .soclk(soclk), .d(data_inp[67] ), .q(din[67]) );
cl_sc1_msff_8x	din_l_68 ( .si(so_in[67] ), .so(so_in[68] ), .l1clk(l1clk_in), .siclk(siclk), .soclk(soclk), .d(data_inp[68] ), .q(din[68]) );
cl_sc1_msff_8x	din_l_69 ( .si(so_in[68] ), .so(so_in[69] ), .l1clk(l1clk_in), .siclk(siclk), .soclk(soclk), .d(data_inp[69] ), .q(din[69]) );

cl_sc1_msff_8x	din_l_70 ( .si(so_in[69] ), .so(so_in[70] ), .l1clk(l1clk_in), .siclk(siclk), .soclk(soclk), .d(data_inp[70] ), .q(din[70]) );
cl_sc1_msff_8x	din_l_71 ( .si(so_in[70] ), .so(so_in[71] ), .l1clk(l1clk_in), .siclk(siclk), .soclk(soclk), .d(data_inp[71] ), .q(din[71]) );
cl_sc1_msff_8x	din_l_72 ( .si(so_in[71] ), .so(so_in[72] ), .l1clk(l1clk_in), .siclk(siclk), .soclk(soclk), .d(data_inp[72] ), .q(din[72]) );
cl_sc1_msff_8x	din_l_73 ( .si(so_in[72] ), .so(so_in[73] ), .l1clk(l1clk_in), .siclk(siclk), .soclk(soclk), .d(data_inp[73] ), .q(din[73]) );
cl_sc1_msff_8x	din_l_74 ( .si(so_in[73] ), .so(so_in[74] ), .l1clk(l1clk_in), .siclk(siclk), .soclk(soclk), .d(data_inp[74] ), .q(din[74]) );
cl_sc1_msff_8x	din_l_75 ( .si(so_in[74] ), .so(so_in[75] ), .l1clk(l1clk_in), .siclk(siclk), .soclk(soclk), .d(data_inp[75] ), .q(din[75]) );
cl_sc1_msff_8x	din_l_76 ( .si(so_in[75] ), .so(so_in[76] ), .l1clk(l1clk_in), .siclk(siclk), .soclk(soclk), .d(data_inp[76] ), .q(din[76]) );
cl_sc1_msff_8x	din_l_77 ( .si(so_in[76] ), .so(so_in[77] ), .l1clk(l1clk_in), .siclk(siclk), .soclk(soclk), .d(data_inp[77] ), .q(din[77]) );
cl_sc1_msff_8x	din_l_78 ( .si(so_in[77] ), .so(so_in[78] ), .l1clk(l1clk_in), .siclk(siclk), .soclk(soclk), .d(data_inp[78] ), .q(din[78]) );
cl_sc1_msff_8x	din_l_79 ( .si(so_in[78] ), .so(so_in[79] ), .l1clk(l1clk_in), .siclk(siclk), .soclk(soclk), .d(data_inp[79] ), .q(din[79]) );

cl_sc1_msff_8x	din_l_80 ( .si(so_in[79] ), .so(so_in[80] ), .l1clk(l1clk_in), .siclk(siclk), .soclk(soclk), .d(data_inp[80] ), .q(din[80]) );
cl_sc1_msff_8x	din_l_81 ( .si(so_in[80] ), .so(so_in[81] ), .l1clk(l1clk_in), .siclk(siclk), .soclk(soclk), .d(data_inp[81] ), .q(din[81]) );
cl_sc1_msff_8x	din_l_82 ( .si(so_in[81] ), .so(so_in[82] ), .l1clk(l1clk_in), .siclk(siclk), .soclk(soclk), .d(data_inp[82] ), .q(din[82]) );
cl_sc1_msff_8x	din_l_83 ( .si(so_in[82] ), .so(so_in[83] ), .l1clk(l1clk_in), .siclk(siclk), .soclk(soclk), .d(data_inp[83] ), .q(din[83]) );
cl_sc1_msff_8x	din_l_84 ( .si(so_in[83] ), .so(so_in[84] ), .l1clk(l1clk_in), .siclk(siclk), .soclk(soclk), .d(data_inp[84] ), .q(din[84]) );
cl_sc1_msff_8x	din_l_85 ( .si(so_in[84] ), .so(so_in[85] ), .l1clk(l1clk_in), .siclk(siclk), .soclk(soclk), .d(data_inp[85] ), .q(din[85]) );
cl_sc1_msff_8x	din_l_86 ( .si(so_in[85] ), .so(so_in[86] ), .l1clk(l1clk_in), .siclk(siclk), .soclk(soclk), .d(data_inp[86] ), .q(din[86]) );
cl_sc1_msff_8x	din_l_87 ( .si(so_in[86] ), .so(so_in[87] ), .l1clk(l1clk_in), .siclk(siclk), .soclk(soclk), .d(data_inp[87] ), .q(din[87]) );
cl_sc1_msff_8x	din_l_88 ( .si(so_in[87] ), .so(so_in[88] ), .l1clk(l1clk_in), .siclk(siclk), .soclk(soclk), .d(data_inp[88] ), .q(din[88]) );
cl_sc1_msff_8x	din_l_89 ( .si(so_in[88] ), .so(so_in[89] ), .l1clk(l1clk_in), .siclk(siclk), .soclk(soclk), .d(data_inp[89] ), .q(din[89]) );

cl_sc1_msff_8x	din_l_90 ( .si(so_in[89] ), .so(so_in[90] ), .l1clk(l1clk_in), .siclk(siclk), .soclk(soclk), .d(data_inp[90] ), .q(din[90]) );
cl_sc1_msff_8x	din_l_91 ( .si(so_in[90] ), .so(so_in[91] ), .l1clk(l1clk_in), .siclk(siclk), .soclk(soclk), .d(data_inp[91] ), .q(din[91]) );
cl_sc1_msff_8x	din_l_92 ( .si(so_in[91] ), .so(so_in[92] ), .l1clk(l1clk_in), .siclk(siclk), .soclk(soclk), .d(data_inp[92] ), .q(din[92]) );
cl_sc1_msff_8x	din_l_93 ( .si(so_in[92] ), .so(so_in[93] ), .l1clk(l1clk_in), .siclk(siclk), .soclk(soclk), .d(data_inp[93] ), .q(din[93]) );
cl_sc1_msff_8x	din_l_94 ( .si(so_in[93] ), .so(so_in[94] ), .l1clk(l1clk_in), .siclk(siclk), .soclk(soclk), .d(data_inp[94] ), .q(din[94]) );
cl_sc1_msff_8x	din_l_95 ( .si(so_in[94] ), .so(so_in[95] ), .l1clk(l1clk_in), .siclk(siclk), .soclk(soclk), .d(data_inp[95] ), .q(din[95]) );
cl_sc1_msff_8x	din_l_96 ( .si(so_in[95] ), .so(so_in[96] ), .l1clk(l1clk_in), .siclk(siclk), .soclk(soclk), .d(data_inp[96] ), .q(din[96]) );
cl_sc1_msff_8x	din_l_97 ( .si(so_in[96] ), .so(so_in[97] ), .l1clk(l1clk_in), .siclk(siclk), .soclk(soclk), .d(data_inp[97] ), .q(din[97]) );
cl_sc1_msff_8x	din_l_98 ( .si(so_in[97] ), .so(so_in[98] ), .l1clk(l1clk_in), .siclk(siclk), .soclk(soclk), .d(data_inp[98] ), .q(din[98]) );
cl_sc1_msff_8x	din_l_99 ( .si(so_in[98] ), .so(so_in[99] ), .l1clk(l1clk_in), .siclk(siclk), .soclk(soclk), .d(data_inp[99] ), .q(din[99]) );

/*
  dff #(100) din_l (
    .l1clk(l1clk_in),
    .siclk(siclk),
    .soclk(soclk),
    .d(data_inp[99:0]),
    .si({so_in[98:0],scan_in}),
    .so(so_in[99:0]),
    .q(din[99:0])
  );

*/


//------------------------------  
//---- control input flops------
//------------------------------  

cl_sc1_msff_8x	dindex_0 ( .si(so_in[99]  ), .so(so_index[0] ), .l1clk(l1clk_in), .siclk(siclk), .soclk(soclk), .d(cam_index[0] ), .q(index[0]) );
cl_sc1_msff_8x	dindex_1 ( .si(so_index[0]), .so(so_index[1] ), .l1clk(l1clk_in), .siclk(siclk), .soclk(soclk), .d(cam_index[1] ), .q(index[1]) );
cl_sc1_msff_8x	dindex_2 ( .si(so_index[1]), .so(so_index[2] ), .l1clk(l1clk_in), .siclk(siclk), .soclk(soclk), .d(cam_index[2] ), .q(index[2]) );
cl_sc1_msff_8x	dindex_3 ( .si(so_index[2]), .so(so_index[3] ), .l1clk(l1clk_in), .siclk(siclk), .soclk(soclk), .d(cam_index[3] ), .q(index[3]) );
cl_sc1_msff_8x	dindex_4 ( .si(so_index[3]), .so(so_index[4] ), .l1clk(l1clk_in), .siclk(siclk), .soclk(soclk), .d(cam_index[4] ), .q(index[4]) );
cl_sc1_msff_8x	dindex_5 ( .si(so_index[4]), .so(so_index[5] ), .l1clk(l1clk_in), .siclk(siclk), .soclk(soclk), .d(cam_index[5] ), .q(index[5]) );
cl_sc1_msff_8x	dindex_6 ( .si(so_index[5]), .so(so_index[6] ), .l1clk(l1clk_in), .siclk(siclk), .soclk(soclk), .d(cam_index[6] ), .q(index[6]) );

cl_sc1_msff_8x	dsel     ( .si(so_index[6]), .so(so_sel      ), .l1clk(l1clk_in), .siclk(siclk), .soclk(soclk), .d(pio_sel_in	), .q(sel_msk  ) );
cl_sc1_msff_8x	dwrt     ( .si(so_sel     ), .so(so_wrt      ), .l1clk(l1clk_in), .siclk(siclk), .soclk(soclk), .d(pio_wt_in	), .q(write_d  ) );
cl_sc1_msff_8x	dread    ( .si(so_wrt     ), .so(so_read     ), .l1clk(l1clk_in), .siclk(siclk), .soclk(soclk), .d(pio_rd_in	), .q(read_d   ) );
cl_sc1_msff_8x	dcomp    ( .si(so_read    ), .so(so_comp     ), .l1clk(l1clk_in), .siclk(siclk), .soclk(soclk), .d(compare_in	), .q(compare_d) );

				      
/*

  dff #(7) dindex (
    .l1clk(l1clk_in),
    .siclk(siclk),
    .soclk(soclk),
    .d(cam_index[6:0]),
    .si({so_index[5:0],so_in[99]}),
    .so(so_index[6:0]),
    .q(index[6:0])
  );
 
  dff #(1) dsel (
    .l1clk(l1clk_in),
    .siclk(siclk),
    .soclk(soclk),
    .d(pio_sel_in),
    .si(so_index[6]),
    .so(so_sel),
    .q(sel_msk)
  );


  dff #(1) dwrt (
    .l1clk(l1clk_in),
    .siclk(siclk),
    .soclk(soclk),
    .d(pio_wt_in),
    .si(so_sel),
    .so(so_wrt),
    .q(write_d)
  );


  dff #(1) dread (
    .l1clk(l1clk_in),
    .siclk(siclk),
    .soclk(soclk),
    .d(pio_rd_in),
    .si(so_wrt),
    .so(so_read),
    .q(read_d)
  );


  dff #(1) dcomp (
    .l1clk(l1clk_in),
    .siclk(siclk),
    .soclk(soclk),
    .d(compare_in),
    .si(so_read),
    .so(so_comp),
    .q(compare_d)
  );

*/
//------------------------------  
//---- din flops - right--------
//------------------------------  

cl_sc1_msff_8x	din_r_100 ( .si(so_comp   ), .so(so_in[100]), .l1clk(l1clk_in), .siclk(siclk), .soclk(soclk), .d(data_inp[100]), .q(din[100]) );
cl_sc1_msff_8x	din_r_101 ( .si(so_in[100]), .so(so_in[101]), .l1clk(l1clk_in), .siclk(siclk), .soclk(soclk), .d(data_inp[101]), .q(din[101]) );
cl_sc1_msff_8x	din_r_102 ( .si(so_in[101]), .so(so_in[102]), .l1clk(l1clk_in), .siclk(siclk), .soclk(soclk), .d(data_inp[102]), .q(din[102]) );
cl_sc1_msff_8x	din_r_103 ( .si(so_in[102]), .so(so_in[103]), .l1clk(l1clk_in), .siclk(siclk), .soclk(soclk), .d(data_inp[103]), .q(din[103]) );
cl_sc1_msff_8x	din_r_104 ( .si(so_in[103]), .so(so_in[104]), .l1clk(l1clk_in), .siclk(siclk), .soclk(soclk), .d(data_inp[104]), .q(din[104]) );
cl_sc1_msff_8x	din_r_105 ( .si(so_in[104]), .so(so_in[105]), .l1clk(l1clk_in), .siclk(siclk), .soclk(soclk), .d(data_inp[105]), .q(din[105]) );
cl_sc1_msff_8x	din_r_106 ( .si(so_in[105]), .so(so_in[106]), .l1clk(l1clk_in), .siclk(siclk), .soclk(soclk), .d(data_inp[106]), .q(din[106]) );
cl_sc1_msff_8x	din_r_107 ( .si(so_in[106]), .so(so_in[107]), .l1clk(l1clk_in), .siclk(siclk), .soclk(soclk), .d(data_inp[107]), .q(din[107]) );
cl_sc1_msff_8x	din_r_108 ( .si(so_in[107]), .so(so_in[108]), .l1clk(l1clk_in), .siclk(siclk), .soclk(soclk), .d(data_inp[108]), .q(din[108]) );
cl_sc1_msff_8x	din_r_109 ( .si(so_in[108]), .so(so_in[109]), .l1clk(l1clk_in), .siclk(siclk), .soclk(soclk), .d(data_inp[109]), .q(din[109]) );

cl_sc1_msff_8x	din_r_110 ( .si(so_in[109]), .so(so_in[110]), .l1clk(l1clk_in), .siclk(siclk), .soclk(soclk), .d(data_inp[110]), .q(din[110]) );
cl_sc1_msff_8x	din_r_111 ( .si(so_in[110]), .so(so_in[111]), .l1clk(l1clk_in), .siclk(siclk), .soclk(soclk), .d(data_inp[111]), .q(din[111]) );
cl_sc1_msff_8x	din_r_112 ( .si(so_in[111]), .so(so_in[112]), .l1clk(l1clk_in), .siclk(siclk), .soclk(soclk), .d(data_inp[112]), .q(din[112]) );
cl_sc1_msff_8x	din_r_113 ( .si(so_in[112]), .so(so_in[113]), .l1clk(l1clk_in), .siclk(siclk), .soclk(soclk), .d(data_inp[113]), .q(din[113]) );
cl_sc1_msff_8x	din_r_114 ( .si(so_in[113]), .so(so_in[114]), .l1clk(l1clk_in), .siclk(siclk), .soclk(soclk), .d(data_inp[114]), .q(din[114]) );
cl_sc1_msff_8x	din_r_115 ( .si(so_in[114]), .so(so_in[115]), .l1clk(l1clk_in), .siclk(siclk), .soclk(soclk), .d(data_inp[115]), .q(din[115]) );
cl_sc1_msff_8x	din_r_116 ( .si(so_in[115]), .so(so_in[116]), .l1clk(l1clk_in), .siclk(siclk), .soclk(soclk), .d(data_inp[116]), .q(din[116]) );
cl_sc1_msff_8x	din_r_117 ( .si(so_in[116]), .so(so_in[117]), .l1clk(l1clk_in), .siclk(siclk), .soclk(soclk), .d(data_inp[117]), .q(din[117]) );
cl_sc1_msff_8x	din_r_118 ( .si(so_in[117]), .so(so_in[118]), .l1clk(l1clk_in), .siclk(siclk), .soclk(soclk), .d(data_inp[118]), .q(din[118]) );
cl_sc1_msff_8x	din_r_119 ( .si(so_in[118]), .so(so_in[119]), .l1clk(l1clk_in), .siclk(siclk), .soclk(soclk), .d(data_inp[119]), .q(din[119]) );
				     
cl_sc1_msff_8x	din_r_120 ( .si(so_in[119]), .so(so_in[120]), .l1clk(l1clk_in), .siclk(siclk), .soclk(soclk), .d(data_inp[120]), .q(din[120]) );
cl_sc1_msff_8x	din_r_121 ( .si(so_in[120]), .so(so_in[121]), .l1clk(l1clk_in), .siclk(siclk), .soclk(soclk), .d(data_inp[121]), .q(din[121]) );
cl_sc1_msff_8x	din_r_122 ( .si(so_in[121]), .so(so_in[122]), .l1clk(l1clk_in), .siclk(siclk), .soclk(soclk), .d(data_inp[122]), .q(din[122]) );
cl_sc1_msff_8x	din_r_123 ( .si(so_in[122]), .so(so_in[123]), .l1clk(l1clk_in), .siclk(siclk), .soclk(soclk), .d(data_inp[123]), .q(din[123]) );
cl_sc1_msff_8x	din_r_124 ( .si(so_in[123]), .so(so_in[124]), .l1clk(l1clk_in), .siclk(siclk), .soclk(soclk), .d(data_inp[124]), .q(din[124]) );
cl_sc1_msff_8x	din_r_125 ( .si(so_in[124]), .so(so_in[125]), .l1clk(l1clk_in), .siclk(siclk), .soclk(soclk), .d(data_inp[125]), .q(din[125]) );
cl_sc1_msff_8x	din_r_126 ( .si(so_in[125]), .so(so_in[126]), .l1clk(l1clk_in), .siclk(siclk), .soclk(soclk), .d(data_inp[126]), .q(din[126]) );
cl_sc1_msff_8x	din_r_127 ( .si(so_in[126]), .so(so_in[127]), .l1clk(l1clk_in), .siclk(siclk), .soclk(soclk), .d(data_inp[127]), .q(din[127]) );
cl_sc1_msff_8x	din_r_128 ( .si(so_in[127]), .so(so_in[128]), .l1clk(l1clk_in), .siclk(siclk), .soclk(soclk), .d(data_inp[128]), .q(din[128]) );
cl_sc1_msff_8x	din_r_129 ( .si(so_in[128]), .so(so_in[129]), .l1clk(l1clk_in), .siclk(siclk), .soclk(soclk), .d(data_inp[129]), .q(din[129]) );

cl_sc1_msff_8x	din_r_130 ( .si(so_in[129]), .so(so_in[130]), .l1clk(l1clk_in), .siclk(siclk), .soclk(soclk), .d(data_inp[130]), .q(din[130]) );
cl_sc1_msff_8x	din_r_131 ( .si(so_in[130]), .so(so_in[131]), .l1clk(l1clk_in), .siclk(siclk), .soclk(soclk), .d(data_inp[131]), .q(din[131]) );
cl_sc1_msff_8x	din_r_132 ( .si(so_in[131]), .so(so_in[132]), .l1clk(l1clk_in), .siclk(siclk), .soclk(soclk), .d(data_inp[132]), .q(din[132]) );
cl_sc1_msff_8x	din_r_133 ( .si(so_in[132]), .so(so_in[133]), .l1clk(l1clk_in), .siclk(siclk), .soclk(soclk), .d(data_inp[133]), .q(din[133]) );
cl_sc1_msff_8x	din_r_134 ( .si(so_in[133]), .so(so_in[134]), .l1clk(l1clk_in), .siclk(siclk), .soclk(soclk), .d(data_inp[134]), .q(din[134]) );
cl_sc1_msff_8x	din_r_135 ( .si(so_in[134]), .so(so_in[135]), .l1clk(l1clk_in), .siclk(siclk), .soclk(soclk), .d(data_inp[135]), .q(din[135]) );
cl_sc1_msff_8x	din_r_136 ( .si(so_in[135]), .so(so_in[136]), .l1clk(l1clk_in), .siclk(siclk), .soclk(soclk), .d(data_inp[136]), .q(din[136]) );
cl_sc1_msff_8x	din_r_137 ( .si(so_in[136]), .so(so_in[137]), .l1clk(l1clk_in), .siclk(siclk), .soclk(soclk), .d(data_inp[137]), .q(din[137]) );
cl_sc1_msff_8x	din_r_138 ( .si(so_in[137]), .so(so_in[138]), .l1clk(l1clk_in), .siclk(siclk), .soclk(soclk), .d(data_inp[138]), .q(din[138]) );
cl_sc1_msff_8x	din_r_139 ( .si(so_in[138]), .so(so_in[139]), .l1clk(l1clk_in), .siclk(siclk), .soclk(soclk), .d(data_inp[139]), .q(din[139]) );

cl_sc1_msff_8x	din_r_140 ( .si(so_in[139]), .so(so_in[140]), .l1clk(l1clk_in), .siclk(siclk), .soclk(soclk), .d(data_inp[140]), .q(din[140]) );
cl_sc1_msff_8x	din_r_141 ( .si(so_in[140]), .so(so_in[141]), .l1clk(l1clk_in), .siclk(siclk), .soclk(soclk), .d(data_inp[141]), .q(din[141]) );
cl_sc1_msff_8x	din_r_142 ( .si(so_in[141]), .so(so_in[142]), .l1clk(l1clk_in), .siclk(siclk), .soclk(soclk), .d(data_inp[142]), .q(din[142]) );
cl_sc1_msff_8x	din_r_143 ( .si(so_in[142]), .so(so_in[143]), .l1clk(l1clk_in), .siclk(siclk), .soclk(soclk), .d(data_inp[143]), .q(din[143]) );
cl_sc1_msff_8x	din_r_144 ( .si(so_in[143]), .so(so_in[144]), .l1clk(l1clk_in), .siclk(siclk), .soclk(soclk), .d(data_inp[144]), .q(din[144]) );
cl_sc1_msff_8x	din_r_145 ( .si(so_in[144]), .so(so_in[145]), .l1clk(l1clk_in), .siclk(siclk), .soclk(soclk), .d(data_inp[145]), .q(din[145]) );
cl_sc1_msff_8x	din_r_146 ( .si(so_in[145]), .so(so_in[146]), .l1clk(l1clk_in), .siclk(siclk), .soclk(soclk), .d(data_inp[146]), .q(din[146]) );
cl_sc1_msff_8x	din_r_147 ( .si(so_in[146]), .so(so_in[147]), .l1clk(l1clk_in), .siclk(siclk), .soclk(soclk), .d(data_inp[147]), .q(din[147]) );
cl_sc1_msff_8x	din_r_148 ( .si(so_in[147]), .so(so_in[148]), .l1clk(l1clk_in), .siclk(siclk), .soclk(soclk), .d(data_inp[148]), .q(din[148]) );
cl_sc1_msff_8x	din_r_149 ( .si(so_in[148]), .so(so_in[149]), .l1clk(l1clk_in), .siclk(siclk), .soclk(soclk), .d(data_inp[149]), .q(din[149]) );

cl_sc1_msff_8x	din_r_150 ( .si(so_in[149]), .so(so_in[150]), .l1clk(l1clk_in), .siclk(siclk), .soclk(soclk), .d(data_inp[150]), .q(din[150]) );
cl_sc1_msff_8x	din_r_151 ( .si(so_in[150]), .so(so_in[151]), .l1clk(l1clk_in), .siclk(siclk), .soclk(soclk), .d(data_inp[151]), .q(din[151]) );
cl_sc1_msff_8x	din_r_152 ( .si(so_in[151]), .so(so_in[152]), .l1clk(l1clk_in), .siclk(siclk), .soclk(soclk), .d(data_inp[152]), .q(din[152]) );
cl_sc1_msff_8x	din_r_153 ( .si(so_in[152]), .so(so_in[153]), .l1clk(l1clk_in), .siclk(siclk), .soclk(soclk), .d(data_inp[153]), .q(din[153]) );
cl_sc1_msff_8x	din_r_154 ( .si(so_in[153]), .so(so_in[154]), .l1clk(l1clk_in), .siclk(siclk), .soclk(soclk), .d(data_inp[154]), .q(din[154]) );
cl_sc1_msff_8x	din_r_155 ( .si(so_in[154]), .so(so_in[155]), .l1clk(l1clk_in), .siclk(siclk), .soclk(soclk), .d(data_inp[155]), .q(din[155]) );
cl_sc1_msff_8x	din_r_156 ( .si(so_in[155]), .so(so_in[156]), .l1clk(l1clk_in), .siclk(siclk), .soclk(soclk), .d(data_inp[156]), .q(din[156]) );
cl_sc1_msff_8x	din_r_157 ( .si(so_in[156]), .so(so_in[157]), .l1clk(l1clk_in), .siclk(siclk), .soclk(soclk), .d(data_inp[157]), .q(din[157]) );
cl_sc1_msff_8x	din_r_158 ( .si(so_in[157]), .so(so_in[158]), .l1clk(l1clk_in), .siclk(siclk), .soclk(soclk), .d(data_inp[158]), .q(din[158]) );
cl_sc1_msff_8x	din_r_159 ( .si(so_in[158]), .so(so_in[159]), .l1clk(l1clk_in), .siclk(siclk), .soclk(soclk), .d(data_inp[159]), .q(din[159]) );

cl_sc1_msff_8x	din_r_160 ( .si(so_in[159]), .so(so_in[160]), .l1clk(l1clk_in), .siclk(siclk), .soclk(soclk), .d(data_inp[160]), .q(din[160]) );
cl_sc1_msff_8x	din_r_161 ( .si(so_in[160]), .so(so_in[161]), .l1clk(l1clk_in), .siclk(siclk), .soclk(soclk), .d(data_inp[161]), .q(din[161]) );
cl_sc1_msff_8x	din_r_162 ( .si(so_in[161]), .so(so_in[162]), .l1clk(l1clk_in), .siclk(siclk), .soclk(soclk), .d(data_inp[162]), .q(din[162]) );
cl_sc1_msff_8x	din_r_163 ( .si(so_in[162]), .so(so_in[163]), .l1clk(l1clk_in), .siclk(siclk), .soclk(soclk), .d(data_inp[163]), .q(din[163]) );
cl_sc1_msff_8x	din_r_164 ( .si(so_in[163]), .so(so_in[164]), .l1clk(l1clk_in), .siclk(siclk), .soclk(soclk), .d(data_inp[164]), .q(din[164]) );
cl_sc1_msff_8x	din_r_165 ( .si(so_in[164]), .so(so_in[165]), .l1clk(l1clk_in), .siclk(siclk), .soclk(soclk), .d(data_inp[165]), .q(din[165]) );
cl_sc1_msff_8x	din_r_166 ( .si(so_in[165]), .so(so_in[166]), .l1clk(l1clk_in), .siclk(siclk), .soclk(soclk), .d(data_inp[166]), .q(din[166]) );
cl_sc1_msff_8x	din_r_167 ( .si(so_in[166]), .so(so_in[167]), .l1clk(l1clk_in), .siclk(siclk), .soclk(soclk), .d(data_inp[167]), .q(din[167]) );
cl_sc1_msff_8x	din_r_168 ( .si(so_in[167]), .so(so_in[168]), .l1clk(l1clk_in), .siclk(siclk), .soclk(soclk), .d(data_inp[168]), .q(din[168]) );
cl_sc1_msff_8x	din_r_169 ( .si(so_in[168]), .so(so_in[169]), .l1clk(l1clk_in), .siclk(siclk), .soclk(soclk), .d(data_inp[169]), .q(din[169]) );

cl_sc1_msff_8x	din_r_170 ( .si(so_in[169]), .so(so_in[170]), .l1clk(l1clk_in), .siclk(siclk), .soclk(soclk), .d(data_inp[170]), .q(din[170]) );
cl_sc1_msff_8x	din_r_171 ( .si(so_in[170]), .so(so_in[171]), .l1clk(l1clk_in), .siclk(siclk), .soclk(soclk), .d(data_inp[171]), .q(din[171]) );
cl_sc1_msff_8x	din_r_172 ( .si(so_in[171]), .so(so_in[172]), .l1clk(l1clk_in), .siclk(siclk), .soclk(soclk), .d(data_inp[172]), .q(din[172]) );
cl_sc1_msff_8x	din_r_173 ( .si(so_in[172]), .so(so_in[173]), .l1clk(l1clk_in), .siclk(siclk), .soclk(soclk), .d(data_inp[173]), .q(din[173]) );
cl_sc1_msff_8x	din_r_174 ( .si(so_in[173]), .so(so_in[174]), .l1clk(l1clk_in), .siclk(siclk), .soclk(soclk), .d(data_inp[174]), .q(din[174]) );
cl_sc1_msff_8x	din_r_175 ( .si(so_in[174]), .so(so_in[175]), .l1clk(l1clk_in), .siclk(siclk), .soclk(soclk), .d(data_inp[175]), .q(din[175]) );
cl_sc1_msff_8x	din_r_176 ( .si(so_in[175]), .so(so_in[176]), .l1clk(l1clk_in), .siclk(siclk), .soclk(soclk), .d(data_inp[176]), .q(din[176]) );
cl_sc1_msff_8x	din_r_177 ( .si(so_in[176]), .so(so_in[177]), .l1clk(l1clk_in), .siclk(siclk), .soclk(soclk), .d(data_inp[177]), .q(din[177]) );
cl_sc1_msff_8x	din_r_178 ( .si(so_in[177]), .so(so_in[178]), .l1clk(l1clk_in), .siclk(siclk), .soclk(soclk), .d(data_inp[178]), .q(din[178]) );
cl_sc1_msff_8x	din_r_179 ( .si(so_in[178]), .so(so_in[179]), .l1clk(l1clk_in), .siclk(siclk), .soclk(soclk), .d(data_inp[179]), .q(din[179]) );

cl_sc1_msff_8x	din_r_180 ( .si(so_in[179]), .so(so_in[180]), .l1clk(l1clk_in), .siclk(siclk), .soclk(soclk), .d(data_inp[180]), .q(din[180]) );
cl_sc1_msff_8x	din_r_181 ( .si(so_in[180]), .so(so_in[181]), .l1clk(l1clk_in), .siclk(siclk), .soclk(soclk), .d(data_inp[181]), .q(din[181]) );
cl_sc1_msff_8x	din_r_182 ( .si(so_in[181]), .so(so_in[182]), .l1clk(l1clk_in), .siclk(siclk), .soclk(soclk), .d(data_inp[182]), .q(din[182]) );
cl_sc1_msff_8x	din_r_183 ( .si(so_in[182]), .so(so_in[183]), .l1clk(l1clk_in), .siclk(siclk), .soclk(soclk), .d(data_inp[183]), .q(din[183]) );
cl_sc1_msff_8x	din_r_184 ( .si(so_in[183]), .so(so_in[184]), .l1clk(l1clk_in), .siclk(siclk), .soclk(soclk), .d(data_inp[184]), .q(din[184]) );
cl_sc1_msff_8x	din_r_185 ( .si(so_in[184]), .so(so_in[185]), .l1clk(l1clk_in), .siclk(siclk), .soclk(soclk), .d(data_inp[185]), .q(din[185]) );
cl_sc1_msff_8x	din_r_186 ( .si(so_in[185]), .so(so_in[186]), .l1clk(l1clk_in), .siclk(siclk), .soclk(soclk), .d(data_inp[186]), .q(din[186]) );
cl_sc1_msff_8x	din_r_187 ( .si(so_in[186]), .so(so_in[187]), .l1clk(l1clk_in), .siclk(siclk), .soclk(soclk), .d(data_inp[187]), .q(din[187]) );
cl_sc1_msff_8x	din_r_188 ( .si(so_in[187]), .so(so_in[188]), .l1clk(l1clk_in), .siclk(siclk), .soclk(soclk), .d(data_inp[188]), .q(din[188]) );
cl_sc1_msff_8x	din_r_189 ( .si(so_in[188]), .so(so_in[189]), .l1clk(l1clk_in), .siclk(siclk), .soclk(soclk), .d(data_inp[189]), .q(din[189]) );

cl_sc1_msff_8x	din_r_190 ( .si(so_in[189]), .so(so_in[190]), .l1clk(l1clk_in), .siclk(siclk), .soclk(soclk), .d(data_inp[190]), .q(din[190]) );
cl_sc1_msff_8x	din_r_191 ( .si(so_in[190]), .so(so_in[191]), .l1clk(l1clk_in), .siclk(siclk), .soclk(soclk), .d(data_inp[191]), .q(din[191]) );
cl_sc1_msff_8x	din_r_192 ( .si(so_in[191]), .so(so_in[192]), .l1clk(l1clk_in), .siclk(siclk), .soclk(soclk), .d(data_inp[192]), .q(din[192]) );
cl_sc1_msff_8x	din_r_193 ( .si(so_in[192]), .so(so_in[193]), .l1clk(l1clk_in), .siclk(siclk), .soclk(soclk), .d(data_inp[193]), .q(din[193]) );
cl_sc1_msff_8x	din_r_194 ( .si(so_in[193]), .so(so_in[194]), .l1clk(l1clk_in), .siclk(siclk), .soclk(soclk), .d(data_inp[194]), .q(din[194]) );
cl_sc1_msff_8x	din_r_195 ( .si(so_in[194]), .so(so_in[195]), .l1clk(l1clk_in), .siclk(siclk), .soclk(soclk), .d(data_inp[195]), .q(din[195]) );
cl_sc1_msff_8x	din_r_196 ( .si(so_in[195]), .so(so_in[196]), .l1clk(l1clk_in), .siclk(siclk), .soclk(soclk), .d(data_inp[196]), .q(din[196]) );
cl_sc1_msff_8x	din_r_197 ( .si(so_in[196]), .so(so_in[197]), .l1clk(l1clk_in), .siclk(siclk), .soclk(soclk), .d(data_inp[197]), .q(din[197]) );
cl_sc1_msff_8x	din_r_198 ( .si(so_in[197]), .so(so_in[198]), .l1clk(l1clk_in), .siclk(siclk), .soclk(soclk), .d(data_inp[198]), .q(din[198]) );
cl_sc1_msff_8x	din_r_199 ( .si(so_in[198]), .so(so_in[199]), .l1clk(l1clk_in), .siclk(siclk), .soclk(soclk), .d(data_inp[199]), .q(din[199]) );

/*
  dff #(100) din_r (
    .l1clk(l1clk_in),
    .siclk(siclk),
    .soclk(soclk),
    .d(data_inp[199:100]),
    .si({so_in[198:100],so_comp}),
    .so(so_in[199:100]),
    .q(din[199:100])
  );
*/

//------------------------------  
//---- dout flops - right-------
//------------------------------  

cl_sc1_msff_8x dout_r_199 ( .si(so_in[199] ), .so(so_out[199]), .l1clk(l1clk_out), .siclk(siclk), .soclk(soclk), .d(saout[199]), .q(msk_dat_out[199]) );
cl_sc1_msff_8x dout_r_198 ( .si(so_out[199]), .so(so_out[198]), .l1clk(l1clk_out), .siclk(siclk), .soclk(soclk), .d(saout[198]), .q(msk_dat_out[198]) );
cl_sc1_msff_8x dout_r_197 ( .si(so_out[198]), .so(so_out[197]), .l1clk(l1clk_out), .siclk(siclk), .soclk(soclk), .d(saout[197]), .q(msk_dat_out[197]) );
cl_sc1_msff_8x dout_r_196 ( .si(so_out[197]), .so(so_out[196]), .l1clk(l1clk_out), .siclk(siclk), .soclk(soclk), .d(saout[196]), .q(msk_dat_out[196]) );
cl_sc1_msff_8x dout_r_195 ( .si(so_out[196]), .so(so_out[195]), .l1clk(l1clk_out), .siclk(siclk), .soclk(soclk), .d(saout[195]), .q(msk_dat_out[195]) );
cl_sc1_msff_8x dout_r_194 ( .si(so_out[195]), .so(so_out[194]), .l1clk(l1clk_out), .siclk(siclk), .soclk(soclk), .d(saout[194]), .q(msk_dat_out[194]) );
cl_sc1_msff_8x dout_r_193 ( .si(so_out[194]), .so(so_out[193]), .l1clk(l1clk_out), .siclk(siclk), .soclk(soclk), .d(saout[193]), .q(msk_dat_out[193]) );
cl_sc1_msff_8x dout_r_192 ( .si(so_out[193]), .so(so_out[192]), .l1clk(l1clk_out), .siclk(siclk), .soclk(soclk), .d(saout[192]), .q(msk_dat_out[192]) );
cl_sc1_msff_8x dout_r_191 ( .si(so_out[192]), .so(so_out[191]), .l1clk(l1clk_out), .siclk(siclk), .soclk(soclk), .d(saout[191]), .q(msk_dat_out[191]) );
cl_sc1_msff_8x dout_r_190 ( .si(so_out[191]), .so(so_out[190]), .l1clk(l1clk_out), .siclk(siclk), .soclk(soclk), .d(saout[190]), .q(msk_dat_out[190]) );

cl_sc1_msff_8x dout_r_189 ( .si(so_out[190]), .so(so_out[189]), .l1clk(l1clk_out), .siclk(siclk), .soclk(soclk), .d(saout[189]), .q(msk_dat_out[189]) );
cl_sc1_msff_8x dout_r_188 ( .si(so_out[189]), .so(so_out[188]), .l1clk(l1clk_out), .siclk(siclk), .soclk(soclk), .d(saout[188]), .q(msk_dat_out[188]) );
cl_sc1_msff_8x dout_r_187 ( .si(so_out[188]), .so(so_out[187]), .l1clk(l1clk_out), .siclk(siclk), .soclk(soclk), .d(saout[187]), .q(msk_dat_out[187]) );
cl_sc1_msff_8x dout_r_186 ( .si(so_out[187]), .so(so_out[186]), .l1clk(l1clk_out), .siclk(siclk), .soclk(soclk), .d(saout[186]), .q(msk_dat_out[186]) );
cl_sc1_msff_8x dout_r_185 ( .si(so_out[186]), .so(so_out[185]), .l1clk(l1clk_out), .siclk(siclk), .soclk(soclk), .d(saout[185]), .q(msk_dat_out[185]) );
cl_sc1_msff_8x dout_r_184 ( .si(so_out[185]), .so(so_out[184]), .l1clk(l1clk_out), .siclk(siclk), .soclk(soclk), .d(saout[184]), .q(msk_dat_out[184]) );
cl_sc1_msff_8x dout_r_183 ( .si(so_out[184]), .so(so_out[183]), .l1clk(l1clk_out), .siclk(siclk), .soclk(soclk), .d(saout[183]), .q(msk_dat_out[183]) );
cl_sc1_msff_8x dout_r_182 ( .si(so_out[183]), .so(so_out[182]), .l1clk(l1clk_out), .siclk(siclk), .soclk(soclk), .d(saout[182]), .q(msk_dat_out[182]) );
cl_sc1_msff_8x dout_r_181 ( .si(so_out[182]), .so(so_out[181]), .l1clk(l1clk_out), .siclk(siclk), .soclk(soclk), .d(saout[181]), .q(msk_dat_out[181]) );
cl_sc1_msff_8x dout_r_180 ( .si(so_out[181]), .so(so_out[180]), .l1clk(l1clk_out), .siclk(siclk), .soclk(soclk), .d(saout[180]), .q(msk_dat_out[180]) );

cl_sc1_msff_8x dout_r_179 ( .si(so_out[180]), .so(so_out[179]), .l1clk(l1clk_out), .siclk(siclk), .soclk(soclk), .d(saout[179]), .q(msk_dat_out[179]) );
cl_sc1_msff_8x dout_r_178 ( .si(so_out[179]), .so(so_out[178]), .l1clk(l1clk_out), .siclk(siclk), .soclk(soclk), .d(saout[178]), .q(msk_dat_out[178]) );
cl_sc1_msff_8x dout_r_177 ( .si(so_out[178]), .so(so_out[177]), .l1clk(l1clk_out), .siclk(siclk), .soclk(soclk), .d(saout[177]), .q(msk_dat_out[177]) );
cl_sc1_msff_8x dout_r_176 ( .si(so_out[177]), .so(so_out[176]), .l1clk(l1clk_out), .siclk(siclk), .soclk(soclk), .d(saout[176]), .q(msk_dat_out[176]) );
cl_sc1_msff_8x dout_r_175 ( .si(so_out[176]), .so(so_out[175]), .l1clk(l1clk_out), .siclk(siclk), .soclk(soclk), .d(saout[175]), .q(msk_dat_out[175]) );
cl_sc1_msff_8x dout_r_174 ( .si(so_out[175]), .so(so_out[174]), .l1clk(l1clk_out), .siclk(siclk), .soclk(soclk), .d(saout[174]), .q(msk_dat_out[174]) );
cl_sc1_msff_8x dout_r_173 ( .si(so_out[174]), .so(so_out[173]), .l1clk(l1clk_out), .siclk(siclk), .soclk(soclk), .d(saout[173]), .q(msk_dat_out[173]) );
cl_sc1_msff_8x dout_r_172 ( .si(so_out[173]), .so(so_out[172]), .l1clk(l1clk_out), .siclk(siclk), .soclk(soclk), .d(saout[172]), .q(msk_dat_out[172]) );
cl_sc1_msff_8x dout_r_171 ( .si(so_out[172]), .so(so_out[171]), .l1clk(l1clk_out), .siclk(siclk), .soclk(soclk), .d(saout[171]), .q(msk_dat_out[171]) );
cl_sc1_msff_8x dout_r_170 ( .si(so_out[171]), .so(so_out[170]), .l1clk(l1clk_out), .siclk(siclk), .soclk(soclk), .d(saout[170]), .q(msk_dat_out[170]) );

cl_sc1_msff_8x dout_r_169 ( .si(so_out[170]), .so(so_out[169]), .l1clk(l1clk_out), .siclk(siclk), .soclk(soclk), .d(saout[169]), .q(msk_dat_out[169]) );
cl_sc1_msff_8x dout_r_168 ( .si(so_out[169]), .so(so_out[168]), .l1clk(l1clk_out), .siclk(siclk), .soclk(soclk), .d(saout[168]), .q(msk_dat_out[168]) );
cl_sc1_msff_8x dout_r_167 ( .si(so_out[168]), .so(so_out[167]), .l1clk(l1clk_out), .siclk(siclk), .soclk(soclk), .d(saout[167]), .q(msk_dat_out[167]) );
cl_sc1_msff_8x dout_r_166 ( .si(so_out[167]), .so(so_out[166]), .l1clk(l1clk_out), .siclk(siclk), .soclk(soclk), .d(saout[166]), .q(msk_dat_out[166]) );
cl_sc1_msff_8x dout_r_165 ( .si(so_out[166]), .so(so_out[165]), .l1clk(l1clk_out), .siclk(siclk), .soclk(soclk), .d(saout[165]), .q(msk_dat_out[165]) );
cl_sc1_msff_8x dout_r_164 ( .si(so_out[165]), .so(so_out[164]), .l1clk(l1clk_out), .siclk(siclk), .soclk(soclk), .d(saout[164]), .q(msk_dat_out[164]) );
cl_sc1_msff_8x dout_r_163 ( .si(so_out[164]), .so(so_out[163]), .l1clk(l1clk_out), .siclk(siclk), .soclk(soclk), .d(saout[163]), .q(msk_dat_out[163]) );
cl_sc1_msff_8x dout_r_162 ( .si(so_out[163]), .so(so_out[162]), .l1clk(l1clk_out), .siclk(siclk), .soclk(soclk), .d(saout[162]), .q(msk_dat_out[162]) );
cl_sc1_msff_8x dout_r_161 ( .si(so_out[162]), .so(so_out[161]), .l1clk(l1clk_out), .siclk(siclk), .soclk(soclk), .d(saout[161]), .q(msk_dat_out[161]) );
cl_sc1_msff_8x dout_r_160 ( .si(so_out[161]), .so(so_out[160]), .l1clk(l1clk_out), .siclk(siclk), .soclk(soclk), .d(saout[160]), .q(msk_dat_out[160]) );

cl_sc1_msff_8x dout_r_159 ( .si(so_out[160]), .so(so_out[159]), .l1clk(l1clk_out), .siclk(siclk), .soclk(soclk), .d(saout[159]), .q(msk_dat_out[159]) );
cl_sc1_msff_8x dout_r_158 ( .si(so_out[159]), .so(so_out[158]), .l1clk(l1clk_out), .siclk(siclk), .soclk(soclk), .d(saout[158]), .q(msk_dat_out[158]) );
cl_sc1_msff_8x dout_r_157 ( .si(so_out[158]), .so(so_out[157]), .l1clk(l1clk_out), .siclk(siclk), .soclk(soclk), .d(saout[157]), .q(msk_dat_out[157]) );
cl_sc1_msff_8x dout_r_156 ( .si(so_out[157]), .so(so_out[156]), .l1clk(l1clk_out), .siclk(siclk), .soclk(soclk), .d(saout[156]), .q(msk_dat_out[156]) );
cl_sc1_msff_8x dout_r_155 ( .si(so_out[156]), .so(so_out[155]), .l1clk(l1clk_out), .siclk(siclk), .soclk(soclk), .d(saout[155]), .q(msk_dat_out[155]) );
cl_sc1_msff_8x dout_r_154 ( .si(so_out[155]), .so(so_out[154]), .l1clk(l1clk_out), .siclk(siclk), .soclk(soclk), .d(saout[154]), .q(msk_dat_out[154]) );
cl_sc1_msff_8x dout_r_153 ( .si(so_out[154]), .so(so_out[153]), .l1clk(l1clk_out), .siclk(siclk), .soclk(soclk), .d(saout[153]), .q(msk_dat_out[153]) );
cl_sc1_msff_8x dout_r_152 ( .si(so_out[153]), .so(so_out[152]), .l1clk(l1clk_out), .siclk(siclk), .soclk(soclk), .d(saout[152]), .q(msk_dat_out[152]) );
cl_sc1_msff_8x dout_r_151 ( .si(so_out[152]), .so(so_out[151]), .l1clk(l1clk_out), .siclk(siclk), .soclk(soclk), .d(saout[151]), .q(msk_dat_out[151]) );
cl_sc1_msff_8x dout_r_150 ( .si(so_out[151]), .so(so_out[150]), .l1clk(l1clk_out), .siclk(siclk), .soclk(soclk), .d(saout[150]), .q(msk_dat_out[150]) );

cl_sc1_msff_8x dout_r_149 ( .si(so_out[150]), .so(so_out[149]), .l1clk(l1clk_out), .siclk(siclk), .soclk(soclk), .d(saout[149]), .q(msk_dat_out[149]) );
cl_sc1_msff_8x dout_r_148 ( .si(so_out[149]), .so(so_out[148]), .l1clk(l1clk_out), .siclk(siclk), .soclk(soclk), .d(saout[148]), .q(msk_dat_out[148]) );
cl_sc1_msff_8x dout_r_147 ( .si(so_out[148]), .so(so_out[147]), .l1clk(l1clk_out), .siclk(siclk), .soclk(soclk), .d(saout[147]), .q(msk_dat_out[147]) );
cl_sc1_msff_8x dout_r_146 ( .si(so_out[147]), .so(so_out[146]), .l1clk(l1clk_out), .siclk(siclk), .soclk(soclk), .d(saout[146]), .q(msk_dat_out[146]) );
cl_sc1_msff_8x dout_r_145 ( .si(so_out[146]), .so(so_out[145]), .l1clk(l1clk_out), .siclk(siclk), .soclk(soclk), .d(saout[145]), .q(msk_dat_out[145]) );
cl_sc1_msff_8x dout_r_144 ( .si(so_out[145]), .so(so_out[144]), .l1clk(l1clk_out), .siclk(siclk), .soclk(soclk), .d(saout[144]), .q(msk_dat_out[144]) );
cl_sc1_msff_8x dout_r_143 ( .si(so_out[144]), .so(so_out[143]), .l1clk(l1clk_out), .siclk(siclk), .soclk(soclk), .d(saout[143]), .q(msk_dat_out[143]) );
cl_sc1_msff_8x dout_r_142 ( .si(so_out[143]), .so(so_out[142]), .l1clk(l1clk_out), .siclk(siclk), .soclk(soclk), .d(saout[142]), .q(msk_dat_out[142]) );
cl_sc1_msff_8x dout_r_141 ( .si(so_out[142]), .so(so_out[141]), .l1clk(l1clk_out), .siclk(siclk), .soclk(soclk), .d(saout[141]), .q(msk_dat_out[141]) );
cl_sc1_msff_8x dout_r_140 ( .si(so_out[141]), .so(so_out[140]), .l1clk(l1clk_out), .siclk(siclk), .soclk(soclk), .d(saout[140]), .q(msk_dat_out[140]) );

cl_sc1_msff_8x dout_r_139 ( .si(so_out[140]), .so(so_out[139]), .l1clk(l1clk_out), .siclk(siclk), .soclk(soclk), .d(saout[139]), .q(msk_dat_out[139]) );
cl_sc1_msff_8x dout_r_138 ( .si(so_out[139]), .so(so_out[138]), .l1clk(l1clk_out), .siclk(siclk), .soclk(soclk), .d(saout[138]), .q(msk_dat_out[138]) );
cl_sc1_msff_8x dout_r_137 ( .si(so_out[138]), .so(so_out[137]), .l1clk(l1clk_out), .siclk(siclk), .soclk(soclk), .d(saout[137]), .q(msk_dat_out[137]) );
cl_sc1_msff_8x dout_r_136 ( .si(so_out[137]), .so(so_out[136]), .l1clk(l1clk_out), .siclk(siclk), .soclk(soclk), .d(saout[136]), .q(msk_dat_out[136]) );
cl_sc1_msff_8x dout_r_135 ( .si(so_out[136]), .so(so_out[135]), .l1clk(l1clk_out), .siclk(siclk), .soclk(soclk), .d(saout[135]), .q(msk_dat_out[135]) );
cl_sc1_msff_8x dout_r_134 ( .si(so_out[135]), .so(so_out[134]), .l1clk(l1clk_out), .siclk(siclk), .soclk(soclk), .d(saout[134]), .q(msk_dat_out[134]) );
cl_sc1_msff_8x dout_r_133 ( .si(so_out[134]), .so(so_out[133]), .l1clk(l1clk_out), .siclk(siclk), .soclk(soclk), .d(saout[133]), .q(msk_dat_out[133]) );
cl_sc1_msff_8x dout_r_132 ( .si(so_out[133]), .so(so_out[132]), .l1clk(l1clk_out), .siclk(siclk), .soclk(soclk), .d(saout[132]), .q(msk_dat_out[132]) );
cl_sc1_msff_8x dout_r_131 ( .si(so_out[132]), .so(so_out[131]), .l1clk(l1clk_out), .siclk(siclk), .soclk(soclk), .d(saout[131]), .q(msk_dat_out[131]) );
cl_sc1_msff_8x dout_r_130 ( .si(so_out[131]), .so(so_out[130]), .l1clk(l1clk_out), .siclk(siclk), .soclk(soclk), .d(saout[130]), .q(msk_dat_out[130]) );

cl_sc1_msff_8x dout_r_129 ( .si(so_out[130]), .so(so_out[129]), .l1clk(l1clk_out), .siclk(siclk), .soclk(soclk), .d(saout[129]), .q(msk_dat_out[129]) );
cl_sc1_msff_8x dout_r_128 ( .si(so_out[129]), .so(so_out[128]), .l1clk(l1clk_out), .siclk(siclk), .soclk(soclk), .d(saout[128]), .q(msk_dat_out[128]) );
cl_sc1_msff_8x dout_r_127 ( .si(so_out[128]), .so(so_out[127]), .l1clk(l1clk_out), .siclk(siclk), .soclk(soclk), .d(saout[127]), .q(msk_dat_out[127]) );
cl_sc1_msff_8x dout_r_126 ( .si(so_out[127]), .so(so_out[126]), .l1clk(l1clk_out), .siclk(siclk), .soclk(soclk), .d(saout[126]), .q(msk_dat_out[126]) );
cl_sc1_msff_8x dout_r_125 ( .si(so_out[126]), .so(so_out[125]), .l1clk(l1clk_out), .siclk(siclk), .soclk(soclk), .d(saout[125]), .q(msk_dat_out[125]) );
cl_sc1_msff_8x dout_r_124 ( .si(so_out[125]), .so(so_out[124]), .l1clk(l1clk_out), .siclk(siclk), .soclk(soclk), .d(saout[124]), .q(msk_dat_out[124]) );
cl_sc1_msff_8x dout_r_123 ( .si(so_out[124]), .so(so_out[123]), .l1clk(l1clk_out), .siclk(siclk), .soclk(soclk), .d(saout[123]), .q(msk_dat_out[123]) );
cl_sc1_msff_8x dout_r_122 ( .si(so_out[123]), .so(so_out[122]), .l1clk(l1clk_out), .siclk(siclk), .soclk(soclk), .d(saout[122]), .q(msk_dat_out[122]) );
cl_sc1_msff_8x dout_r_121 ( .si(so_out[122]), .so(so_out[121]), .l1clk(l1clk_out), .siclk(siclk), .soclk(soclk), .d(saout[121]), .q(msk_dat_out[121]) );
cl_sc1_msff_8x dout_r_120 ( .si(so_out[121]), .so(so_out[120]), .l1clk(l1clk_out), .siclk(siclk), .soclk(soclk), .d(saout[120]), .q(msk_dat_out[120]) );

cl_sc1_msff_8x dout_r_119 ( .si(so_out[120]), .so(so_out[119]), .l1clk(l1clk_out), .siclk(siclk), .soclk(soclk), .d(saout[119]), .q(msk_dat_out[119]) );
cl_sc1_msff_8x dout_r_118 ( .si(so_out[119]), .so(so_out[118]), .l1clk(l1clk_out), .siclk(siclk), .soclk(soclk), .d(saout[118]), .q(msk_dat_out[118]) );
cl_sc1_msff_8x dout_r_117 ( .si(so_out[118]), .so(so_out[117]), .l1clk(l1clk_out), .siclk(siclk), .soclk(soclk), .d(saout[117]), .q(msk_dat_out[117]) );
cl_sc1_msff_8x dout_r_116 ( .si(so_out[117]), .so(so_out[116]), .l1clk(l1clk_out), .siclk(siclk), .soclk(soclk), .d(saout[116]), .q(msk_dat_out[116]) );
cl_sc1_msff_8x dout_r_115 ( .si(so_out[116]), .so(so_out[115]), .l1clk(l1clk_out), .siclk(siclk), .soclk(soclk), .d(saout[115]), .q(msk_dat_out[115]) );
cl_sc1_msff_8x dout_r_114 ( .si(so_out[115]), .so(so_out[114]), .l1clk(l1clk_out), .siclk(siclk), .soclk(soclk), .d(saout[114]), .q(msk_dat_out[114]) );
cl_sc1_msff_8x dout_r_113 ( .si(so_out[114]), .so(so_out[113]), .l1clk(l1clk_out), .siclk(siclk), .soclk(soclk), .d(saout[113]), .q(msk_dat_out[113]) );
cl_sc1_msff_8x dout_r_112 ( .si(so_out[113]), .so(so_out[112]), .l1clk(l1clk_out), .siclk(siclk), .soclk(soclk), .d(saout[112]), .q(msk_dat_out[112]) );
cl_sc1_msff_8x dout_r_111 ( .si(so_out[112]), .so(so_out[111]), .l1clk(l1clk_out), .siclk(siclk), .soclk(soclk), .d(saout[111]), .q(msk_dat_out[111]) );
cl_sc1_msff_8x dout_r_110 ( .si(so_out[111]), .so(so_out[110]), .l1clk(l1clk_out), .siclk(siclk), .soclk(soclk), .d(saout[110]), .q(msk_dat_out[110]) );

cl_sc1_msff_8x dout_r_109 ( .si(so_out[110]), .so(so_out[109]), .l1clk(l1clk_out), .siclk(siclk), .soclk(soclk), .d(saout[109]), .q(msk_dat_out[109]) );
cl_sc1_msff_8x dout_r_108 ( .si(so_out[109]), .so(so_out[108]), .l1clk(l1clk_out), .siclk(siclk), .soclk(soclk), .d(saout[108]), .q(msk_dat_out[108]) );
cl_sc1_msff_8x dout_r_107 ( .si(so_out[108]), .so(so_out[107]), .l1clk(l1clk_out), .siclk(siclk), .soclk(soclk), .d(saout[107]), .q(msk_dat_out[107]) );
cl_sc1_msff_8x dout_r_106 ( .si(so_out[107]), .so(so_out[106]), .l1clk(l1clk_out), .siclk(siclk), .soclk(soclk), .d(saout[106]), .q(msk_dat_out[106]) );
cl_sc1_msff_8x dout_r_105 ( .si(so_out[106]), .so(so_out[105]), .l1clk(l1clk_out), .siclk(siclk), .soclk(soclk), .d(saout[105]), .q(msk_dat_out[105]) );
cl_sc1_msff_8x dout_r_104 ( .si(so_out[105]), .so(so_out[104]), .l1clk(l1clk_out), .siclk(siclk), .soclk(soclk), .d(saout[104]), .q(msk_dat_out[104]) );
cl_sc1_msff_8x dout_r_103 ( .si(so_out[104]), .so(so_out[103]), .l1clk(l1clk_out), .siclk(siclk), .soclk(soclk), .d(saout[103]), .q(msk_dat_out[103]) );
cl_sc1_msff_8x dout_r_102 ( .si(so_out[103]), .so(so_out[102]), .l1clk(l1clk_out), .siclk(siclk), .soclk(soclk), .d(saout[102]), .q(msk_dat_out[102]) );
cl_sc1_msff_8x dout_r_101 ( .si(so_out[102]), .so(so_out[101]), .l1clk(l1clk_out), .siclk(siclk), .soclk(soclk), .d(saout[101]), .q(msk_dat_out[101]) );
cl_sc1_msff_8x dout_r_100 ( .si(so_out[101]), .so(so_out[100]), .l1clk(l1clk_out), .siclk(siclk), .soclk(soclk), .d(saout[100]), .q(msk_dat_out[100]) );

/*
  dff #(100) dout_r (
    .l1clk(l1clk_out),
    .siclk(siclk),
    .soclk(soclk),
    .d(saout[199:100]),
    .si({so_in[199],so_out[199:101]}),
    .so(so_out[199:100]),
    .q(msk_dat_out[199:100])
  );
*/

//------------------------------  
//---- control output flops----- 
//------------------------------  

cl_sc1_msff_8x dhit     ( .si(so_out[100]), .so(so_hit),      .l1clk(l1clk_out), .siclk(siclk), .soclk(soclk), .d(hit_in),      .q(cam_hit)      );

cl_sc1_msff_8x dhaddr_0 ( .si(so_hit),      .so(so_haddr[0]), .l1clk(l1clk_out), .siclk(siclk), .soclk(soclk), .d(haddr_in[0]), .q(cam_haddr[0]) );
cl_sc1_msff_8x dhaddr_1 ( .si(so_haddr[0]), .so(so_haddr[1]), .l1clk(l1clk_out), .siclk(siclk), .soclk(soclk), .d(haddr_in[1]), .q(cam_haddr[1]) );
cl_sc1_msff_8x dhaddr_2 ( .si(so_haddr[1]), .so(so_haddr[2]), .l1clk(l1clk_out), .siclk(siclk), .soclk(soclk), .d(haddr_in[2]), .q(cam_haddr[2]) );
cl_sc1_msff_8x dhaddr_3 ( .si(so_haddr[2]), .so(so_haddr[3]), .l1clk(l1clk_out), .siclk(siclk), .soclk(soclk), .d(haddr_in[3]), .q(cam_haddr[3]) );
cl_sc1_msff_8x dhaddr_4 ( .si(so_haddr[3]), .so(so_haddr[4]), .l1clk(l1clk_out), .siclk(siclk), .soclk(soclk), .d(haddr_in[4]), .q(cam_haddr[4]) );
cl_sc1_msff_8x dhaddr_5 ( .si(so_haddr[4]), .so(so_haddr[5]), .l1clk(l1clk_out), .siclk(siclk), .soclk(soclk), .d(haddr_in[5]), .q(cam_haddr[5]) );
cl_sc1_msff_8x dhaddr_6 ( .si(so_haddr[5]), .so(so_haddr[6]), .l1clk(l1clk_out), .siclk(siclk), .soclk(soclk), .d(haddr_in[6]), .q(cam_haddr[6]) );
																		  
/*																		 
																		 
  dff #(1) dhit (
    .l1clk(l1clk_out),
    .siclk(siclk),
    .soclk(soclk),
    .d(hit_in),
    .si(so_out[100]),
    .so(so_hit),
    .q(cam_hit)
  );

  dff #(7) dhaddr (
    .l1clk(l1clk_out),
    .siclk(siclk),
    .soclk(soclk),
    .d(haddr_in[6:0]),
    .si({so_haddr[5:0],so_hit}),
    .so(so_haddr[6:0]),
    .q(cam_haddr[6:0])
  );
*/

//------------------------------  
//---- state machine flops ----- 
//------------------------------  

cl_sc1_msff_8x dcamvld ( .si(so_haddr[6]), .so(so_camvld), .l1clk(l1clk_out), .siclk(siclk), .soclk(soclk), .d(cam_vld),          .q(cam_valid)    );
cl_sc1_msff_8x drdvld ( .si(so_camvld),   .so(so_rdvld),  .l1clk(l1clk_out), .siclk(siclk), .soclk(soclk), .d(rd_vld),           .q(pio_rd_vld)   );

cl_sc1_msff_8x dc_st_0 ( .si(so_rdvld),    .so(so_cst[0]), .l1clk(l1clk_out), .siclk(siclk), .soclk(soclk), .d(n_scam_st_in[0]),  .q(c_scam_st[0]) );
cl_sc1_msff_8x dc_st_1 ( .si(so_cst[0]),   .so(so_cst[1]), .l1clk(l1clk_out), .siclk(siclk), .soclk(soclk), .d(n_scam_st_in[1]),  .q(c_scam_st[1]) );
cl_sc1_msff_8x dc_st_2 ( .si(so_cst[1]),   .so(so_cst[2]), .l1clk(l1clk_out), .siclk(siclk), .soclk(soclk), .d(n_scam_st_in[2]),  .q(c_scam_st[2]) );

cl_sc1_msff_8x dr_st_0 ( .si(so_cst[2]),   .so(so_rst[0]), .l1clk(l1clk_out), .siclk(siclk), .soclk(soclk), .d(n_pio_r_st_in[0]), .q(c_pio_r_st[0]) );
cl_sc1_msff_8x dr_st_1 ( .si(so_rst[0]),   .so(so_rst[1]), .l1clk(l1clk_out), .siclk(siclk), .soclk(soclk), .d(n_pio_r_st_in[1]), .q(c_pio_r_st[1]) );

cl_sc1_msff_8x dw_st_0 ( .si(so_rst[1]),   .so(so_wst[0]), .l1clk(l1clk_out), .siclk(siclk), .soclk(soclk), .d(n_pio_w_st_in[0]), .q(c_pio_w_st[0]) );
cl_sc1_msff_8x dw_st_1 ( .si(so_wst[0]),   .so(so_wst[1]), .l1clk(l1clk_out), .siclk(siclk), .soclk(soclk), .d(n_pio_w_st_in[1]), .q(c_pio_w_st[1]) );

/*
  dff #(1) dcamvld (
    .l1clk(l1clk_out),
    .siclk(siclk),
    .soclk(soclk),
    .d(cam_vld),
    .si(so_haddr[6]),
    .so(so_camvld),
    .q(cam_valid)
  );

  
  dff #(1) drdvld (
    .l1clk(l1clk_out),
    .siclk(siclk),
    .soclk(soclk),
    .d(rd_vld),
    .si(so_camvld),
    .so(so_rdvld),
    .q(pio_rd_vld)
  );


  dff #(3) dc_st (
    .l1clk(l1clk_out),
    .siclk(siclk),
    .soclk(soclk),
    .d(n_scam_st_in[2:0]),
    .si({so_cst[1:0],so_rdvld}),
    .so(so_cst[2:0]),
    .q(c_scam_st[2:0])
  );


  dff #(2) dr_st (
    .l1clk(l1clk_out),
    .siclk(siclk),
    .soclk(soclk),
    .d(n_pio_r_st_in[1:0]),
    .si({so_rst[0],so_cst[2]}),
    .so(so_rst[1:0]),
    .q(c_pio_r_st[1:0])
  );


  dff #(2) dw_st (
    .l1clk(l1clk_out),
    .siclk(siclk),
    .soclk(soclk),
    .d(n_pio_w_st_in[1:0]),
    .si({so_wst[0],so_rst[1]}),
    .so(so_wst[1:0]),
    .q(c_pio_w_st[1:0])
  );
*/

//------------------------------  
//---- dout flops - left -------
//------------------------------  

cl_sc1_msff_8x dout_l_99 ( .si(so_wst[1] ), .so(so_out[99]), .l1clk(l1clk_out), .siclk(siclk), .soclk(soclk), .d(saout[99]), .q(msk_dat_out[99]) );
cl_sc1_msff_8x dout_l_98 ( .si(so_out[99]), .so(so_out[98]), .l1clk(l1clk_out), .siclk(siclk), .soclk(soclk), .d(saout[98]), .q(msk_dat_out[98]) );
cl_sc1_msff_8x dout_l_97 ( .si(so_out[98]), .so(so_out[97]), .l1clk(l1clk_out), .siclk(siclk), .soclk(soclk), .d(saout[97]), .q(msk_dat_out[97]) );
cl_sc1_msff_8x dout_l_96 ( .si(so_out[97]), .so(so_out[96]), .l1clk(l1clk_out), .siclk(siclk), .soclk(soclk), .d(saout[96]), .q(msk_dat_out[96]) );
cl_sc1_msff_8x dout_l_95 ( .si(so_out[96]), .so(so_out[95]), .l1clk(l1clk_out), .siclk(siclk), .soclk(soclk), .d(saout[95]), .q(msk_dat_out[95]) );
cl_sc1_msff_8x dout_l_94 ( .si(so_out[95]), .so(so_out[94]), .l1clk(l1clk_out), .siclk(siclk), .soclk(soclk), .d(saout[94]), .q(msk_dat_out[94]) );
cl_sc1_msff_8x dout_l_93 ( .si(so_out[94]), .so(so_out[93]), .l1clk(l1clk_out), .siclk(siclk), .soclk(soclk), .d(saout[93]), .q(msk_dat_out[93]) );
cl_sc1_msff_8x dout_l_92 ( .si(so_out[93]), .so(so_out[92]), .l1clk(l1clk_out), .siclk(siclk), .soclk(soclk), .d(saout[92]), .q(msk_dat_out[92]) );
cl_sc1_msff_8x dout_l_91 ( .si(so_out[92]), .so(so_out[91]), .l1clk(l1clk_out), .siclk(siclk), .soclk(soclk), .d(saout[91]), .q(msk_dat_out[91]) );
cl_sc1_msff_8x dout_l_90 ( .si(so_out[91]), .so(so_out[90]), .l1clk(l1clk_out), .siclk(siclk), .soclk(soclk), .d(saout[90]), .q(msk_dat_out[90]) );

cl_sc1_msff_8x dout_l_89 ( .si(so_out[90]), .so(so_out[89]), .l1clk(l1clk_out), .siclk(siclk), .soclk(soclk), .d(saout[89]), .q(msk_dat_out[89]) );
cl_sc1_msff_8x dout_l_88 ( .si(so_out[89]), .so(so_out[88]), .l1clk(l1clk_out), .siclk(siclk), .soclk(soclk), .d(saout[88]), .q(msk_dat_out[88]) );
cl_sc1_msff_8x dout_l_87 ( .si(so_out[88]), .so(so_out[87]), .l1clk(l1clk_out), .siclk(siclk), .soclk(soclk), .d(saout[87]), .q(msk_dat_out[87]) );
cl_sc1_msff_8x dout_l_86 ( .si(so_out[87]), .so(so_out[86]), .l1clk(l1clk_out), .siclk(siclk), .soclk(soclk), .d(saout[86]), .q(msk_dat_out[86]) );
cl_sc1_msff_8x dout_l_85 ( .si(so_out[86]), .so(so_out[85]), .l1clk(l1clk_out), .siclk(siclk), .soclk(soclk), .d(saout[85]), .q(msk_dat_out[85]) );
cl_sc1_msff_8x dout_l_84 ( .si(so_out[85]), .so(so_out[84]), .l1clk(l1clk_out), .siclk(siclk), .soclk(soclk), .d(saout[84]), .q(msk_dat_out[84]) );
cl_sc1_msff_8x dout_l_83 ( .si(so_out[84]), .so(so_out[83]), .l1clk(l1clk_out), .siclk(siclk), .soclk(soclk), .d(saout[83]), .q(msk_dat_out[83]) );
cl_sc1_msff_8x dout_l_82 ( .si(so_out[83]), .so(so_out[82]), .l1clk(l1clk_out), .siclk(siclk), .soclk(soclk), .d(saout[82]), .q(msk_dat_out[82]) );
cl_sc1_msff_8x dout_l_81 ( .si(so_out[82]), .so(so_out[81]), .l1clk(l1clk_out), .siclk(siclk), .soclk(soclk), .d(saout[81]), .q(msk_dat_out[81]) );
cl_sc1_msff_8x dout_l_80 ( .si(so_out[81]), .so(so_out[80]), .l1clk(l1clk_out), .siclk(siclk), .soclk(soclk), .d(saout[80]), .q(msk_dat_out[80]) );

cl_sc1_msff_8x dout_l_79 ( .si(so_out[80]), .so(so_out[79]), .l1clk(l1clk_out), .siclk(siclk), .soclk(soclk), .d(saout[79]), .q(msk_dat_out[79]) );
cl_sc1_msff_8x dout_l_78 ( .si(so_out[79]), .so(so_out[78]), .l1clk(l1clk_out), .siclk(siclk), .soclk(soclk), .d(saout[78]), .q(msk_dat_out[78]) );
cl_sc1_msff_8x dout_l_77 ( .si(so_out[78]), .so(so_out[77]), .l1clk(l1clk_out), .siclk(siclk), .soclk(soclk), .d(saout[77]), .q(msk_dat_out[77]) );
cl_sc1_msff_8x dout_l_76 ( .si(so_out[77]), .so(so_out[76]), .l1clk(l1clk_out), .siclk(siclk), .soclk(soclk), .d(saout[76]), .q(msk_dat_out[76]) );
cl_sc1_msff_8x dout_l_75 ( .si(so_out[76]), .so(so_out[75]), .l1clk(l1clk_out), .siclk(siclk), .soclk(soclk), .d(saout[75]), .q(msk_dat_out[75]) );
cl_sc1_msff_8x dout_l_74 ( .si(so_out[75]), .so(so_out[74]), .l1clk(l1clk_out), .siclk(siclk), .soclk(soclk), .d(saout[74]), .q(msk_dat_out[74]) );
cl_sc1_msff_8x dout_l_73 ( .si(so_out[74]), .so(so_out[73]), .l1clk(l1clk_out), .siclk(siclk), .soclk(soclk), .d(saout[73]), .q(msk_dat_out[73]) );
cl_sc1_msff_8x dout_l_72 ( .si(so_out[73]), .so(so_out[72]), .l1clk(l1clk_out), .siclk(siclk), .soclk(soclk), .d(saout[72]), .q(msk_dat_out[72]) );
cl_sc1_msff_8x dout_l_71 ( .si(so_out[72]), .so(so_out[71]), .l1clk(l1clk_out), .siclk(siclk), .soclk(soclk), .d(saout[71]), .q(msk_dat_out[71]) );
cl_sc1_msff_8x dout_l_70 ( .si(so_out[71]), .so(so_out[70]), .l1clk(l1clk_out), .siclk(siclk), .soclk(soclk), .d(saout[70]), .q(msk_dat_out[70]) );

cl_sc1_msff_8x dout_l_69 ( .si(so_out[70]), .so(so_out[69]), .l1clk(l1clk_out), .siclk(siclk), .soclk(soclk), .d(saout[69]), .q(msk_dat_out[69]) );
cl_sc1_msff_8x dout_l_68 ( .si(so_out[69]), .so(so_out[68]), .l1clk(l1clk_out), .siclk(siclk), .soclk(soclk), .d(saout[68]), .q(msk_dat_out[68]) );
cl_sc1_msff_8x dout_l_67 ( .si(so_out[68]), .so(so_out[67]), .l1clk(l1clk_out), .siclk(siclk), .soclk(soclk), .d(saout[67]), .q(msk_dat_out[67]) );
cl_sc1_msff_8x dout_l_66 ( .si(so_out[67]), .so(so_out[66]), .l1clk(l1clk_out), .siclk(siclk), .soclk(soclk), .d(saout[66]), .q(msk_dat_out[66]) );
cl_sc1_msff_8x dout_l_65 ( .si(so_out[66]), .so(so_out[65]), .l1clk(l1clk_out), .siclk(siclk), .soclk(soclk), .d(saout[65]), .q(msk_dat_out[65]) );
cl_sc1_msff_8x dout_l_64 ( .si(so_out[65]), .so(so_out[64]), .l1clk(l1clk_out), .siclk(siclk), .soclk(soclk), .d(saout[64]), .q(msk_dat_out[64]) );
cl_sc1_msff_8x dout_l_63 ( .si(so_out[64]), .so(so_out[63]), .l1clk(l1clk_out), .siclk(siclk), .soclk(soclk), .d(saout[63]), .q(msk_dat_out[63]) );
cl_sc1_msff_8x dout_l_62 ( .si(so_out[63]), .so(so_out[62]), .l1clk(l1clk_out), .siclk(siclk), .soclk(soclk), .d(saout[62]), .q(msk_dat_out[62]) );
cl_sc1_msff_8x dout_l_61 ( .si(so_out[62]), .so(so_out[61]), .l1clk(l1clk_out), .siclk(siclk), .soclk(soclk), .d(saout[61]), .q(msk_dat_out[61]) );
cl_sc1_msff_8x dout_l_60 ( .si(so_out[61]), .so(so_out[60]), .l1clk(l1clk_out), .siclk(siclk), .soclk(soclk), .d(saout[60]), .q(msk_dat_out[60]) );

cl_sc1_msff_8x dout_l_59 ( .si(so_out[60]), .so(so_out[59]), .l1clk(l1clk_out), .siclk(siclk), .soclk(soclk), .d(saout[59]), .q(msk_dat_out[59]) );
cl_sc1_msff_8x dout_l_58 ( .si(so_out[59]), .so(so_out[58]), .l1clk(l1clk_out), .siclk(siclk), .soclk(soclk), .d(saout[58]), .q(msk_dat_out[58]) );
cl_sc1_msff_8x dout_l_57 ( .si(so_out[58]), .so(so_out[57]), .l1clk(l1clk_out), .siclk(siclk), .soclk(soclk), .d(saout[57]), .q(msk_dat_out[57]) );
cl_sc1_msff_8x dout_l_56 ( .si(so_out[57]), .so(so_out[56]), .l1clk(l1clk_out), .siclk(siclk), .soclk(soclk), .d(saout[56]), .q(msk_dat_out[56]) );
cl_sc1_msff_8x dout_l_55 ( .si(so_out[56]), .so(so_out[55]), .l1clk(l1clk_out), .siclk(siclk), .soclk(soclk), .d(saout[55]), .q(msk_dat_out[55]) );
cl_sc1_msff_8x dout_l_54 ( .si(so_out[55]), .so(so_out[54]), .l1clk(l1clk_out), .siclk(siclk), .soclk(soclk), .d(saout[54]), .q(msk_dat_out[54]) );
cl_sc1_msff_8x dout_l_53 ( .si(so_out[54]), .so(so_out[53]), .l1clk(l1clk_out), .siclk(siclk), .soclk(soclk), .d(saout[53]), .q(msk_dat_out[53]) );
cl_sc1_msff_8x dout_l_52 ( .si(so_out[53]), .so(so_out[52]), .l1clk(l1clk_out), .siclk(siclk), .soclk(soclk), .d(saout[52]), .q(msk_dat_out[52]) );
cl_sc1_msff_8x dout_l_51 ( .si(so_out[52]), .so(so_out[51]), .l1clk(l1clk_out), .siclk(siclk), .soclk(soclk), .d(saout[51]), .q(msk_dat_out[51]) );
cl_sc1_msff_8x dout_l_50 ( .si(so_out[51]), .so(so_out[50]), .l1clk(l1clk_out), .siclk(siclk), .soclk(soclk), .d(saout[50]), .q(msk_dat_out[50]) );

cl_sc1_msff_8x dout_l_49 ( .si(so_out[50]), .so(so_out[49]), .l1clk(l1clk_out), .siclk(siclk), .soclk(soclk), .d(saout[49]), .q(msk_dat_out[49]) );
cl_sc1_msff_8x dout_l_48 ( .si(so_out[49]), .so(so_out[48]), .l1clk(l1clk_out), .siclk(siclk), .soclk(soclk), .d(saout[48]), .q(msk_dat_out[48]) );
cl_sc1_msff_8x dout_l_47 ( .si(so_out[48]), .so(so_out[47]), .l1clk(l1clk_out), .siclk(siclk), .soclk(soclk), .d(saout[47]), .q(msk_dat_out[47]) );
cl_sc1_msff_8x dout_l_46 ( .si(so_out[47]), .so(so_out[46]), .l1clk(l1clk_out), .siclk(siclk), .soclk(soclk), .d(saout[46]), .q(msk_dat_out[46]) );
cl_sc1_msff_8x dout_l_45 ( .si(so_out[46]), .so(so_out[45]), .l1clk(l1clk_out), .siclk(siclk), .soclk(soclk), .d(saout[45]), .q(msk_dat_out[45]) );
cl_sc1_msff_8x dout_l_44 ( .si(so_out[45]), .so(so_out[44]), .l1clk(l1clk_out), .siclk(siclk), .soclk(soclk), .d(saout[44]), .q(msk_dat_out[44]) );
cl_sc1_msff_8x dout_l_43 ( .si(so_out[44]), .so(so_out[43]), .l1clk(l1clk_out), .siclk(siclk), .soclk(soclk), .d(saout[43]), .q(msk_dat_out[43]) );
cl_sc1_msff_8x dout_l_42 ( .si(so_out[43]), .so(so_out[42]), .l1clk(l1clk_out), .siclk(siclk), .soclk(soclk), .d(saout[42]), .q(msk_dat_out[42]) );
cl_sc1_msff_8x dout_l_41 ( .si(so_out[42]), .so(so_out[41]), .l1clk(l1clk_out), .siclk(siclk), .soclk(soclk), .d(saout[41]), .q(msk_dat_out[41]) );
cl_sc1_msff_8x dout_l_40 ( .si(so_out[41]), .so(so_out[40]), .l1clk(l1clk_out), .siclk(siclk), .soclk(soclk), .d(saout[40]), .q(msk_dat_out[40]) );

cl_sc1_msff_8x dout_l_39 ( .si(so_out[40]), .so(so_out[39]), .l1clk(l1clk_out), .siclk(siclk), .soclk(soclk), .d(saout[39]), .q(msk_dat_out[39]) );
cl_sc1_msff_8x dout_l_38 ( .si(so_out[39]), .so(so_out[38]), .l1clk(l1clk_out), .siclk(siclk), .soclk(soclk), .d(saout[38]), .q(msk_dat_out[38]) );
cl_sc1_msff_8x dout_l_37 ( .si(so_out[38]), .so(so_out[37]), .l1clk(l1clk_out), .siclk(siclk), .soclk(soclk), .d(saout[37]), .q(msk_dat_out[37]) );
cl_sc1_msff_8x dout_l_36 ( .si(so_out[37]), .so(so_out[36]), .l1clk(l1clk_out), .siclk(siclk), .soclk(soclk), .d(saout[36]), .q(msk_dat_out[36]) );
cl_sc1_msff_8x dout_l_35 ( .si(so_out[36]), .so(so_out[35]), .l1clk(l1clk_out), .siclk(siclk), .soclk(soclk), .d(saout[35]), .q(msk_dat_out[35]) );
cl_sc1_msff_8x dout_l_34 ( .si(so_out[35]), .so(so_out[34]), .l1clk(l1clk_out), .siclk(siclk), .soclk(soclk), .d(saout[34]), .q(msk_dat_out[34]) );
cl_sc1_msff_8x dout_l_33 ( .si(so_out[34]), .so(so_out[33]), .l1clk(l1clk_out), .siclk(siclk), .soclk(soclk), .d(saout[33]), .q(msk_dat_out[33]) );
cl_sc1_msff_8x dout_l_32 ( .si(so_out[33]), .so(so_out[32]), .l1clk(l1clk_out), .siclk(siclk), .soclk(soclk), .d(saout[32]), .q(msk_dat_out[32]) );
cl_sc1_msff_8x dout_l_31 ( .si(so_out[32]), .so(so_out[31]), .l1clk(l1clk_out), .siclk(siclk), .soclk(soclk), .d(saout[31]), .q(msk_dat_out[31]) );
cl_sc1_msff_8x dout_l_30 ( .si(so_out[31]), .so(so_out[30]), .l1clk(l1clk_out), .siclk(siclk), .soclk(soclk), .d(saout[30]), .q(msk_dat_out[30]) );

cl_sc1_msff_8x dout_l_29 ( .si(so_out[30]), .so(so_out[29]), .l1clk(l1clk_out), .siclk(siclk), .soclk(soclk), .d(saout[29]), .q(msk_dat_out[29]) );
cl_sc1_msff_8x dout_l_28 ( .si(so_out[29]), .so(so_out[28]), .l1clk(l1clk_out), .siclk(siclk), .soclk(soclk), .d(saout[28]), .q(msk_dat_out[28]) );
cl_sc1_msff_8x dout_l_27 ( .si(so_out[28]), .so(so_out[27]), .l1clk(l1clk_out), .siclk(siclk), .soclk(soclk), .d(saout[27]), .q(msk_dat_out[27]) );
cl_sc1_msff_8x dout_l_26 ( .si(so_out[27]), .so(so_out[26]), .l1clk(l1clk_out), .siclk(siclk), .soclk(soclk), .d(saout[26]), .q(msk_dat_out[26]) );
cl_sc1_msff_8x dout_l_25 ( .si(so_out[26]), .so(so_out[25]), .l1clk(l1clk_out), .siclk(siclk), .soclk(soclk), .d(saout[25]), .q(msk_dat_out[25]) );
cl_sc1_msff_8x dout_l_24 ( .si(so_out[25]), .so(so_out[24]), .l1clk(l1clk_out), .siclk(siclk), .soclk(soclk), .d(saout[24]), .q(msk_dat_out[24]) );
cl_sc1_msff_8x dout_l_23 ( .si(so_out[24]), .so(so_out[23]), .l1clk(l1clk_out), .siclk(siclk), .soclk(soclk), .d(saout[23]), .q(msk_dat_out[23]) );
cl_sc1_msff_8x dout_l_22 ( .si(so_out[23]), .so(so_out[22]), .l1clk(l1clk_out), .siclk(siclk), .soclk(soclk), .d(saout[22]), .q(msk_dat_out[22]) );
cl_sc1_msff_8x dout_l_21 ( .si(so_out[22]), .so(so_out[21]), .l1clk(l1clk_out), .siclk(siclk), .soclk(soclk), .d(saout[21]), .q(msk_dat_out[21]) );
cl_sc1_msff_8x dout_l_20 ( .si(so_out[21]), .so(so_out[20]), .l1clk(l1clk_out), .siclk(siclk), .soclk(soclk), .d(saout[20]), .q(msk_dat_out[20]) );

cl_sc1_msff_8x dout_l_19 ( .si(so_out[20]), .so(so_out[19]), .l1clk(l1clk_out), .siclk(siclk), .soclk(soclk), .d(saout[19]), .q(msk_dat_out[19]) );
cl_sc1_msff_8x dout_l_18 ( .si(so_out[19]), .so(so_out[18]), .l1clk(l1clk_out), .siclk(siclk), .soclk(soclk), .d(saout[18]), .q(msk_dat_out[18]) );
cl_sc1_msff_8x dout_l_17 ( .si(so_out[18]), .so(so_out[17]), .l1clk(l1clk_out), .siclk(siclk), .soclk(soclk), .d(saout[17]), .q(msk_dat_out[17]) );
cl_sc1_msff_8x dout_l_16 ( .si(so_out[17]), .so(so_out[16]), .l1clk(l1clk_out), .siclk(siclk), .soclk(soclk), .d(saout[16]), .q(msk_dat_out[16]) );
cl_sc1_msff_8x dout_l_15 ( .si(so_out[16]), .so(so_out[15]), .l1clk(l1clk_out), .siclk(siclk), .soclk(soclk), .d(saout[15]), .q(msk_dat_out[15]) );
cl_sc1_msff_8x dout_l_14 ( .si(so_out[15]), .so(so_out[14]), .l1clk(l1clk_out), .siclk(siclk), .soclk(soclk), .d(saout[14]), .q(msk_dat_out[14]) );
cl_sc1_msff_8x dout_l_13 ( .si(so_out[14]), .so(so_out[13]), .l1clk(l1clk_out), .siclk(siclk), .soclk(soclk), .d(saout[13]), .q(msk_dat_out[13]) );
cl_sc1_msff_8x dout_l_12 ( .si(so_out[13]), .so(so_out[12]), .l1clk(l1clk_out), .siclk(siclk), .soclk(soclk), .d(saout[12]), .q(msk_dat_out[12]) );
cl_sc1_msff_8x dout_l_11 ( .si(so_out[12]), .so(so_out[11]), .l1clk(l1clk_out), .siclk(siclk), .soclk(soclk), .d(saout[11]), .q(msk_dat_out[11]) );
cl_sc1_msff_8x dout_l_10 ( .si(so_out[11]), .so(so_out[10]), .l1clk(l1clk_out), .siclk(siclk), .soclk(soclk), .d(saout[10]), .q(msk_dat_out[10]) );

cl_sc1_msff_8x dout_l_09 ( .si(so_out[10]), .so(so_out[9]),  .l1clk(l1clk_out), .siclk(siclk), .soclk(soclk), .d(saout[9]),  .q(msk_dat_out[9]) );
cl_sc1_msff_8x dout_l_08 ( .si(so_out[9]),  .so(so_out[8]),  .l1clk(l1clk_out), .siclk(siclk), .soclk(soclk), .d(saout[8]),  .q(msk_dat_out[8]) );
cl_sc1_msff_8x dout_l_07 ( .si(so_out[8]),  .so(so_out[7]),  .l1clk(l1clk_out), .siclk(siclk), .soclk(soclk), .d(saout[7]),  .q(msk_dat_out[7]) );
cl_sc1_msff_8x dout_l_06 ( .si(so_out[7]),  .so(so_out[6]),  .l1clk(l1clk_out), .siclk(siclk), .soclk(soclk), .d(saout[6]),  .q(msk_dat_out[6]) );
cl_sc1_msff_8x dout_l_05 ( .si(so_out[6]),  .so(so_out[5]),  .l1clk(l1clk_out), .siclk(siclk), .soclk(soclk), .d(saout[5]),  .q(msk_dat_out[5]) );
cl_sc1_msff_8x dout_l_04 ( .si(so_out[5]),  .so(so_out[4]),  .l1clk(l1clk_out), .siclk(siclk), .soclk(soclk), .d(saout[4]),  .q(msk_dat_out[4]) );
cl_sc1_msff_8x dout_l_03 ( .si(so_out[4]),  .so(so_out[3]),  .l1clk(l1clk_out), .siclk(siclk), .soclk(soclk), .d(saout[3]),  .q(msk_dat_out[3]) );
cl_sc1_msff_8x dout_l_02 ( .si(so_out[3]),  .so(so_out[2]),  .l1clk(l1clk_out), .siclk(siclk), .soclk(soclk), .d(saout[2]),  .q(msk_dat_out[2]) );
cl_sc1_msff_8x dout_l_01 ( .si(so_out[2]),  .so(so_out[1]),  .l1clk(l1clk_out), .siclk(siclk), .soclk(soclk), .d(saout[1]),  .q(msk_dat_out[1]) );
cl_sc1_msff_8x dout_l_00 ( .si(so_out[1]),  .so(so_out[0]),  .l1clk(l1clk_out), .siclk(siclk), .soclk(soclk), .d(saout[0]),  .q(msk_dat_out[0]) );

/*
  dff #(100) dout_l (
    .l1clk(l1clk_out),
    .siclk(siclk),
    .soclk(soclk),
    .d(saout[99:0]),
    .si({so_wst[1], so_out[99:1]}),
    .so(so_out[99:0]),
    .q(msk_dat_out[99:0])
  );
*/

endmodule



/**********************************************************
***********************************************************

    Project         : Niu

    File name       : niu_scam_enc.v

    Module(s) name  : niu_scam_enc

    Parent modules  : niu_scam.v

    Child modules   : niu_scam_hit 


    Date            : Jan. 2004

    Description     : 

    Synthesis Notes:

    Modification History:
    Date       Description
    ----       -----------

************************************************************
***********************************************************/

module n2_tcam_enc (
                     ml_sout,
                     hit,
                     haddr);

input  [127:0] ml_sout;   // matched entries
output         hit;       // cam has a match/hit
output   [6:0] haddr;     // cam's match/hit address


wire           hit; 
reg      [6:0] haddr; 
reg            pe_flag;
integer  i;
        
  assign hit = |(ml_sout[127:0]);

        always @(ml_sout)
	begin
  	  pe_flag=1'b0;
      	  haddr = 7'h3f;
  	  // Priority is given to entry0
   	  for (i=0;i<128;i=i+1) begin
 
           if(~pe_flag) begin
    	    if(ml_sout[i])
    	     begin
      	      haddr = i ;
      	      pe_flag=1'b1; 
    	     end
	    else if(~ml_sout[i])
    	     begin
      	        pe_flag=1'b0; 
    	     end
	    else  
    	     begin
      	       pe_flag=1'b1; 
      	       haddr = 7'bXXX_XXXX;
    	     end
	   end 
  	  end
	  
  	  if(~pe_flag) begin
      	     haddr = 7'h7f;
 	  end
	end
	
endmodule

/**********************************************************
***********************************************************

    Project         : Niu

    File name       : niu_scam_ary.v

    Module(s) name  : niu_scam_ary

    Parent modules  : niu_scam.v

    Child modules   :           


    Date            : April. 2004

    Description     :

    Synthesis Notes:

    Modification History:
    Date       Description
    ----       -----------
    8/20/04    Updated the array to match the schematic behavior   nmoon 
************************************************************
***********************************************************/

module n2_tcam_array (
                    din,
		    index,
		    r_en_b,
		    w_en_b,
		    k_en_b,
		    sel_msk,
		    l1clk,
                    saout, 
                    ml_sout);

 
input  [199:0] din;           // compare_data/pio_data_input, registered
input          r_en_b;        // if 1, pio read to  cam's  mask or data plane.
input          w_en_b;        // if 1, pio write to  cam's  mask or data plane.
input          k_en_b;        // if 1, compare to  cam's data.
input          sel_msk;       // pio access mask plane
input    [6:0] index;         // pio access address, registered
input          l1clk;         // tcam internal clock 
output [199:0] saout;         // pio data read out of cam's mask  or data plane
output [127:0] ml_sout;       // matched entries 

wire  [199:0] din;        
wire          r_en_b;     
wire          w_en_b;     
wire	      k_en_b;	  
wire	[6:0] index;	  
wire	      l1clk;	  

reg [199:0] mem_data[127:0];
reg [199:0] mem_mask[127:0];
reg [199:0] saout;

reg   [7:0] entry;
reg [127:0] match_entry;
reg [127:0] ml_sout;

/*************** memory ***********************************/
   always @(w_en_b)
     if (!w_en_b & !sel_msk & l1clk)
      mem_data[index] <= din[199:0];	// 2nd cycle?
/*--------------------------------------------------------*/
   always @(w_en_b)
     if (!w_en_b & sel_msk & l1clk)
      mem_mask[index] <=  din[199:0];

/*************** read out *********************************/
  always @(negedge l1clk) begin
    if (!r_en_b & !sel_msk)
      saout   <= mem_data[index];
    else if (!r_en_b & sel_msk) 
      saout   <= mem_mask[index];
    end

/*************** compare **********************************/
/*
   always @(l1clk or k_en_b or din)
   begin              
    if (!k_en_b && l1clk)           //latch
    begin
     entry       =   8'h0;
     match_entry = 128'h0;

     begin
       while (entry < 8'h80) begin
         match_entry[entry] = ((din &  mem_mask[entry])==(mem_data[entry] &  mem_mask[entry]));
         entry = entry[7:0] + 8'h1;
       end
       ml_sout <= match_entry[127:0];
     end
    end
  end
*/

  always @(negedge l1clk)  
   begin	      
    if (!k_en_b)	    //latch
    begin
     entry	 =   8'h0;
     match_entry = 128'h0;
 
     begin

`ifdef PALLADIUM
	for(entry=8'h0;entry<8'h80;entry=entry+1)
	  begin
             match_entry[entry] = ((din &  mem_mask[entry])==(mem_data[entry] &  mem_mask[entry]));
	  end
`else
       while (entry < 8'h80) begin
         match_entry[entry] = ((din &  mem_mask[entry])==(mem_data[entry] &  mem_mask[entry]));
         entry = entry[7:0] + 8'h1;
       end
`endif
       ml_sout <= match_entry[127:0];
     end
    end
  end

endmodule
