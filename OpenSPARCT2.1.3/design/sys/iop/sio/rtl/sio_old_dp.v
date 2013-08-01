// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: sio_old_dp.v
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
module sio_old_dp (
  l2clk, 
  din, 
  parity, 
  ue, 
  olc_oldue_check_clrerr, 
  olc_oldue_check_en, 
  olc_oldue_wr_en, 
  olc_oldue_rd_addr, 
  oldhq_dout_r_bit, 
  oldhq_dout_s_bit, 
  olddq0_dout, 
  olddq1_dout, 
  olc_old_selhdr, 
  olc_oldue_selfwd, 
  olc_oldue_pass_late_ue, 
  old_opd_data, 
  olc_oldhq_wr_en, 
  olc_oldhq_rd_addr, 
  oldhq_din, 
  ojc_old_jtagsr_en, 
  ojc_old_wr_en, 
  old_opcc_jtag, 
  sio_mbi_run, 
  sio_mbi_old_addr, 
  sio_mbi_old_wdata, 
  sio_mbi_oldx_wr_en, 
  sio_mbi_oldx_rd_en, 
  olc_old_olddqx0_wr_en, 
  olc_old_olddqx0_rd_en, 
  olc_old_olddqx0_waddr, 
  olc_old_olddqx0_raddr, 
  olc_old_olddqx1_wr_en, 
  olc_old_olddqx1_rd_en, 
  olc_old_olddqx1_waddr, 
  olc_old_olddqx1_raddr, 
  old_olddqx0_wr_en, 
  old_olddqx0_rd_en, 
  old_olddqx0_waddr, 
  old_olddqx0_raddr, 
  old_olddqx0_din, 
  old_olddqx1_wr_en, 
  old_olddqx1_rd_en, 
  old_olddqx1_waddr, 
  old_olddqx1_raddr, 
  old_olddqx1_din, 
  tcu_muxtest, 
  tcu_dectest, 
  tcu_scan_en, 
  scan_in, 
  tcu_aclk, 
  tcu_bclk, 
  tcu_pce_ov, 
  tcu_clk_stop, 
  scan_out);
wire muxtst;
wire test;
wire se;
wire siclk;
wire soclk;
wire pce_ov;
wire stop;
wire [33:0] olddqx0_din;
wire [33:0] olddqx1_din;
wire dff_in_sol0_scanin;
wire dff_in_sol0_scanout;
wire ue_sol0;
wire parity1_sol0;
wire parity0_sol0;
wire [31:0] in_sol0;
wire paritygen1_sol0;
wire paritygen0_sol0;
wire perr1_sol0;
wire perr0_sol0;
wire passperr_sol0;
wire perr_sol1;
wire olderr_sol0;
wire setperr_sol0;
wire perr_sol0;
wire eff_perr_sol1_scanin;
wire eff_perr_sol1_scanout;
wire ue0_wren_sol1;
wire ue1_wren_sol1;
wire ue2_wren_sol1;
wire ue3_wren_sol1;
wire eff_ue0_sol2_scanin;
wire eff_ue0_sol2_scanout;
wire ue0_sol2;
wire eff_ue1_sol2_scanin;
wire eff_ue1_sol2_scanout;
wire ue1_sol2;
wire eff_ue2_sol2_scanin;
wire eff_ue2_sol2_scanout;
wire ue2_sol2;
wire eff_ue3_sol2_scanin;
wire eff_ue3_sol2_scanout;
wire ue3_sol2;
wire ue41_out;
wire ue_out;
wire ue_h_l;
wire [5:0] hqsyndromeout;
wire [5:0] hqctageccout;
wire hqraseout;
wire hqrout;
wire [15:0] hqtagout;
wire [25:0] oldhq_dout;
wire [24:0] mem0;
wire [24:0] mem1;
wire [24:0] mem2;
wire [24:0] mem3;
wire oldhq_dout_e_bit;
wire ff_hqout_scanin;
wire ff_hqout_scanout;
wire [5:0] ctag_syndrome;
wire hqwe0;
wire hqwe1;
wire hqwe2;
wire hqwe3;
wire ff_hqmem0_scanin;
wire ff_hqmem0_scanout;
wire mem0_unused;
wire ff_hqmem1_scanin;
wire ff_hqmem1_scanout;
wire mem1_unused;
wire ff_hqmem2_scanin;
wire ff_hqmem2_scanout;
wire mem2_unused;
wire ff_hqmem3_scanin;
wire ff_hqmem3_scanout;
wire mem3_unused;
wire eff_jtagsr_h_scanin;
wire eff_jtagsr_h_scanout;
wire [63:0] in_jtag;
wire [63:0] out_jtag;
wire eff_jtagsr_scanin;
wire eff_jtagsr_scanout;
wire [63:0] in_jtag_temp;
		           
				           
   input          l2clk;
   input [31:0]   din;		             // from l2b...goes to mbist muxes and flops for sol0 stage
   input [1:0] 	  parity;		           
   input 	  ue;		           
   input 	  olc_oldue_check_clrerr;    // start of parity checking -- clear out any prior error state
   input 	  olc_oldue_check_en;        // flop-enable for the parity error accumulator
   input [3:0]	  olc_oldue_wr_en;           // write enable for UE fifo
   
   input [1:0] 	  olc_oldue_rd_addr;         // read pointer for UE fifo
   output 	  oldhq_dout_r_bit;          // header out {read}
   output 	  oldhq_dout_s_bit;          // header out {source=dmu}
   input [33:0]   olddq0_dout;               // least significant bits of data cycle
   input [33:0]   olddq1_dout;               // most  significant bits of data cycle
   input 	  olc_old_selhdr;            // select header not data as outputs
   input 	  olc_oldue_selfwd;          // selects the accumulated ue instead of the set of 4 ue flops
   input 	  olc_oldue_pass_late_ue; // 
   output [64:0]  old_opd_data;	           


   input [3:0] 	  olc_oldhq_wr_en;	// write-enable
   input [ 1:0]  olc_oldhq_rd_addr;	// read-addr
   input [24:0]  oldhq_din;		// header datain - {ctagecc[5:0], ras_ue, read, dmu, id[15:0]}

   input 	  ojc_old_jtagsr_en;	// either store the jtag read data or
                                        // shift....
                                        // shift bits [n:1] into [n-1:0]
                                        // shift in a 0 to the tail [n]
   
   input [1:0] 	  ojc_old_wr_en;        // store the jtag read data, 
                                        // [1]=push 8Bytes to head(63:32), [0]=push 8Bytes to tail

   output 	  old_opcc_jtag;         // lsb of jtag shift register
   
   input 	  sio_mbi_run;
   input [4:0]	  sio_mbi_old_addr;
   input [7:0]	  sio_mbi_old_wdata;
   input 	  sio_mbi_oldx_wr_en;
   input 	  sio_mbi_oldx_rd_en;

   input 	  olc_old_olddqx0_wr_en;
   input 	  olc_old_olddqx0_rd_en;
   input [4:0] 	  olc_old_olddqx0_waddr;
   input [4:0] 	  olc_old_olddqx0_raddr;



   input 	  olc_old_olddqx1_wr_en;
   input 	  olc_old_olddqx1_rd_en;
   input [4:0] 	  olc_old_olddqx1_waddr;
   input [4:0] 	  olc_old_olddqx1_raddr;

   output 	  old_olddqx0_wr_en;
   output 	  old_olddqx0_rd_en;
   output [4:0]   old_olddqx0_waddr;
   output [4:0]   old_olddqx0_raddr;
   output [33:0]  old_olddqx0_din;

   output 	  old_olddqx1_wr_en;
   output 	  old_olddqx1_rd_en;
   output [4:0]   old_olddqx1_waddr;
   output [4:0]   old_olddqx1_raddr;
   output [33:0]  old_olddqx1_din;  

   input 	  tcu_muxtest;
   input 	  tcu_dectest;
   input 	  tcu_scan_en;
   
   input 	  scan_in;
   input 	  tcu_aclk;
   input 	  tcu_bclk; 
   input 	  tcu_pce_ov;
   input 	  tcu_clk_stop;
   output 	  scan_out;

   ///////////////////////////////////////
   // Scan chain connections            
   ///////////////////////////////////////
   // scan renames
   assign 	  muxtst = tcu_muxtest;
   assign 	  test   = tcu_dectest;
   assign 	  se     = tcu_scan_en;
   
   assign 	  siclk = tcu_aclk;
   assign 	  soclk = tcu_bclk;
   assign 	  pce_ov = tcu_pce_ov;
   assign 	  stop = tcu_clk_stop;
   // end scan

   assign 	 olddqx0_din[33:0] = {1'b0, ue, din[31:0]};
   assign 	 olddqx1_din[33:0] = {1'b0, ue, din[31:0]};

   ///////////////////////////////////////
   //
   // BEGIN MUXES for MBIST
   //
   ///////////////////////////////////////
   sio_old_dp_mux_macro__mux_aope__ports_2__stack_46r__width_46  mx21_mbi_olddqx0     (
        .dout ({old_olddqx0_wr_en,
		old_olddqx0_rd_en,
		old_olddqx0_waddr[4:0],
		old_olddqx0_raddr[4:0],
		old_olddqx0_din[33:0]}),

        .din0 ({sio_mbi_oldx_wr_en,      
	        sio_mbi_oldx_rd_en,      
	        sio_mbi_old_addr[4:0], 
	        sio_mbi_old_addr[4:0], 
	        {sio_mbi_old_wdata[1:0], {4{sio_mbi_old_wdata[7:0]}}}}),

        .din1 ({olc_old_olddqx0_wr_en,      
	        olc_old_olddqx0_rd_en,      
	        olc_old_olddqx0_waddr[4:0], 
	        olc_old_olddqx0_raddr[4:0], 
	        olddqx0_din[33:0]}),

        .sel0 (sio_mbi_run)
        );
   
   sio_old_dp_mux_macro__mux_aope__ports_2__stack_46r__width_46  mx21_mbi_olddqx1     (
        .dout ({old_olddqx1_wr_en,
		old_olddqx1_rd_en,
		old_olddqx1_waddr[4:0],
		old_olddqx1_raddr[4:0],
		old_olddqx1_din[33:0]}),

        .din0 ({sio_mbi_oldx_wr_en,      
	        sio_mbi_oldx_rd_en,      
	        sio_mbi_old_addr[4:0], 
	        sio_mbi_old_addr[4:0], 
	        {sio_mbi_old_wdata[1:0], {4{sio_mbi_old_wdata[7:0]}}}}),

        .din1 ({olc_old_olddqx1_wr_en,      
	        olc_old_olddqx1_rd_en,      
	        olc_old_olddqx1_waddr[4:0], 
	        olc_old_olddqx1_raddr[4:0], 
	        olddqx1_din[33:0]}),

        .sel0 (sio_mbi_run)
        );
   
   ///////////////////////////////////////
   //
   // END MUXES for MBIST
   //
   ///////////////////////////////////////   

   ///////////////////////////////////////
   //
   // CAPTURE FLOPS for parity, ue and din
   // -- sol0 cycle
   //
   ///////////////////////////////////////   


   sio_old_dp_msff_macro__stack_64c__width_35 dff_in_sol0   (
	.scan_in(dff_in_sol0_scanin),
	.scan_out(dff_in_sol0_scanout),
	.clk  (l2clk),
	.din  ({ue, parity[1:0],din[31:0]}),
	.dout ({ue_sol0,parity1_sol0, parity0_sol0,in_sol0[31:0]}),
        .en   (1'b1),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
	);

   
   ///////////////////////////////////////
   //
   // DATA PARITY GENERATION for checking
   //
   ///////////////////////////////////////   

   sio_old_dp_prty_macro__width_16 prty_pgen1_sol0  (
	.din  (in_sol0[31:16]),
	.dout (paritygen1_sol0)
        );
					     
   sio_old_dp_prty_macro__width_16 prty_pgen0_sol0  (
	.din  (in_sol0[15: 0]),
	.dout (paritygen0_sol0)
        );

   				           
   ///////////////////////////////////////
   //
   // DATA PARITY COMPARISON
   //
   ///////////////////////////////////////   


   sio_old_dp_xor_macro__left_1__stack_4r__width_1  xr2_perr1_sol0    (
	.din0  (paritygen1_sol0),
	.din1  (parity1_sol0),
	.dout  (perr1_sol0)
        );

   sio_old_dp_xor_macro__left_0__stack_4r__width_1  xr2_perr0_sol0    (
	.din0  (paritygen0_sol0),
	.din1  (parity0_sol0),
	.dout  (perr0_sol0)
        );


   
   ///////////////////////////////////////
   //
   // DATA Parity error logging CONTROL 
   //
   ///////////////////////////////////////   


   sio_old_dp_inv_macro__left_0__stack_4r__width_1  inv_passperr_sol0    (
	.din   (olc_oldue_check_clrerr),
	.dout  (passperr_sol0)
        );

   sio_old_dp_nand_macro__left_0__stack_4r__width_1 nd2_olderr_sol0    (
	.din0  (passperr_sol0),
	.din1  (perr_sol1),
	.dout  (olderr_sol0)
        );

   sio_old_dp_nor_macro__left_0__ports_3__stack_4r__width_1  nr3_setperr_sol0     (
	.din0  (perr1_sol0),
	.din1  (perr0_sol0),
	.din2  (ue_sol0),
	.dout  (setperr_sol0)
        );

   sio_old_dp_nand_macro__left_0__ports_2__stack_4r__width_1  nd2_perr_sol0     (
	.din0  (setperr_sol0),
	.din1  (olderr_sol0),
	.dout  (perr_sol0)
        );

   ///////////////////////////////////////
   //
   // DATA Parity error RESULT FLOP
   //
   ///////////////////////////////////////   



   sio_old_dp_msff_macro__left_0__stack_4r__width_1 eff_perr_sol1    (
	.scan_in(eff_perr_sol1_scanin),
	.scan_out(eff_perr_sol1_scanout),
	.clk  (l2clk),
	.din  (perr_sol0),
	.dout (perr_sol1),
	.en   (olc_oldue_check_en),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
	);



   ///////////////////////////////////////
   //
   // Uncorrectable Error (UE of datachunks) 
   //  FIFO MADE from FLOPS
   //
   ///////////////////////////////////////   

   assign 	 ue0_wren_sol1 = olc_oldue_wr_en[0];
   assign 	 ue1_wren_sol1 = olc_oldue_wr_en[1];
   assign 	 ue2_wren_sol1 = olc_oldue_wr_en[2];
   assign 	 ue3_wren_sol1 = olc_oldue_wr_en[3];   
   
   sio_old_dp_msff_macro__left_0__stack_2r__width_1 eff_ue0_sol2    (
	.scan_in(eff_ue0_sol2_scanin),
	.scan_out(eff_ue0_sol2_scanout),
	.clk  (l2clk),
	.din  (perr_sol1),
	.dout (ue0_sol2),
	.en   (ue0_wren_sol1),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
	);
   
   sio_old_dp_msff_macro__left_0__stack_2r__width_1 eff_ue1_sol2    (
	.scan_in(eff_ue1_sol2_scanin),
	.scan_out(eff_ue1_sol2_scanout),
	.clk  (l2clk),
	.din  (perr_sol1),
	.dout (ue1_sol2),
	.en   (ue1_wren_sol1),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
	);
   
   sio_old_dp_msff_macro__left_0__stack_2r__width_1 eff_ue2_sol2    (
	.scan_in(eff_ue2_sol2_scanin),
	.scan_out(eff_ue2_sol2_scanout),
	.clk  (l2clk),
	.din  (perr_sol1),
	.dout (ue2_sol2),
	.en   (ue2_wren_sol1),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
	);
   

   sio_old_dp_msff_macro__left_0__stack_2r__width_1 eff_ue3_sol2    (
	.scan_in(eff_ue3_sol2_scanin),
	.scan_out(eff_ue3_sol2_scanout),
	.clk  (l2clk),
	.din  (perr_sol1),
	.dout (ue3_sol2),
	.en   (ue3_wren_sol1),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
	);
   

   // 4:1 mux for reading out ue ff
   
   sio_old_dp_mux_macro__left_0__mux_pgdec__ports_4__stack_2r__width_1  mx41_ue41out      (
	.dout (ue41_out),
	.din0 (ue0_sol2),
	.din1 (ue1_sol2),
	.din2 (ue2_sol2),
	.din3 (ue3_sol2),
	.sel  (olc_oldue_rd_addr[1:0]),
  .muxtst(muxtst),
  .test(test)
	);

//   mux_macro  mx21_hdrueout (width=1, stack=2r, mux=pgpe, ports=2) (
//        .dout (ue_out),
//        .din0 (perr_sol1),
//        .din1 (ue41_out),
//        .sel0 (olc_oldue_selfwd)
//        );

assign	ue_out = olc_oldue_pass_late_ue;


   ///////////////////////////////////////
   //
   // OLD DP OUTPUT MUX for data to opd
   //
   ///////////////////////////////////////   
   //
   // output mux between header and payload
   //
   ///////////////////////////////////////   

   assign 	 old_opd_data[64:32] ={ue_h_l, olddq0_dout[31:0]};

   sio_old_dp_or_macro__stack_2l__width_1	or_ue      (
		.dout (ue_h_l),
		.din0 (olddq0_dout[32]),
		.din1 (olddq1_dout[32])
		);

   sio_old_dp_mux_macro__mux_pgpe__ports_2__stack_32l__width_32  mx21_old_opd_data     (
	.dout (old_opd_data[31:0]),
	.din0 ({hqsyndromeout[5:0], hqctageccout[5:0], hqraseout, 1'b0, hqrout, ue_out, hqtagout[15:0]}),
	.din1 ({olddq1_dout[31:0]}),
	.sel0 (olc_old_selhdr)
	);
								 


   ///////////////////////////////////////
   //
   // HEADER QUEUE  (HQ)
   //  FIFO MADE from FLOPS
   // with an output flop on fifo
   //
   // entry : msb:lsb = {ctagecc[5:0], ras_ue, 
   //                    read, src,  ctag[15:0]}
   ///////////////////////////////////////   

   //
   // read select of hq
   //
   sio_old_dp_mux_macro__mux_pgdec__ports_4__stack_26l__width_26  hqout     (
	.dout (oldhq_dout[25:0]),
	.din0 ({1'b0, mem0[24:0]}),
	.din1 ({1'b0, mem1[24:0]}),
	.din2 ({1'b0, mem2[24:0]}),
	.din3 ({1'b0, mem3[24:0]}),
	.sel  (olc_oldhq_rd_addr[1:0]),
  .muxtst(muxtst),
  .test(test)
	);

   assign 	 oldhq_dout_r_bit = oldhq_dout[17];          // header out {read}
   assign 	 oldhq_dout_s_bit = oldhq_dout[16];          // header out {source=dmu}
   assign 	 oldhq_dout_e_bit = oldhq_dout[18];          // header out {E bit = l2[21]}
   
   // FLOP THIS TO LINE UP THE HQ and PAYLOAD QUEUE READ PIPELINE
   // and so we can look ahead in the header generation logic
   
   sio_old_dp_msff_macro__stack_32l__width_30 ff_hqout   (
	.scan_in(ff_hqout_scanin),
	.scan_out(ff_hqout_scanout),
	.clk  (l2clk),
	.din  ({ctag_syndrome[5:0], oldhq_dout[24:19], oldhq_dout[18], oldhq_dout[17], oldhq_dout[15:0]}),
	.dout ({hqsyndromeout[5:0], hqctageccout[5:0], hqraseout, hqrout, hqtagout[15:0]}),
	.en   (1'b1),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
	);


   assign 	 hqwe0 = olc_oldhq_wr_en[0];
   assign 	 hqwe1 = olc_oldhq_wr_en[1];
   assign 	 hqwe2 = olc_oldhq_wr_en[2];
   assign 	 hqwe3 = olc_oldhq_wr_en[3];

   
   /////////////////////////////////////////////////////
   // Array Flops
   /////////////////////////////////////////////////////

   sio_old_dp_msff_macro__stack_26l__width_26 ff_hqmem0   (
	.scan_in(ff_hqmem0_scanin),
	.scan_out(ff_hqmem0_scanout),
	.clk  (l2clk),
	.din  ({1'b0, oldhq_din[24:0]}),
	.dout ({mem0_unused, mem0[24:0]}),
	.en   (hqwe0),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
	);

   sio_old_dp_msff_macro__stack_26l__width_26 ff_hqmem1   (
	.scan_in(ff_hqmem1_scanin),
	.scan_out(ff_hqmem1_scanout),
	.clk  (l2clk),
	.din  ({1'b0, oldhq_din[24:0]}),
	.dout ({mem1_unused, mem1[24:0]}),
	.en   (hqwe1),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
	);

   sio_old_dp_msff_macro__stack_26l__width_26 ff_hqmem2   (
	.scan_in(ff_hqmem2_scanin),
	.scan_out(ff_hqmem2_scanout),
	.clk  (l2clk),
	.din  ({1'b0, oldhq_din[24:0]}),
	.dout ({mem2_unused, mem2[24:0]}),
	.en   (hqwe2),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
	);

   sio_old_dp_msff_macro__stack_26l__width_26 ff_hqmem3   (
	.scan_in(ff_hqmem3_scanin),
	.scan_out(ff_hqmem3_scanout),
	.clk  (l2clk),
	.din  ({1'b0, oldhq_din[24:0]}),
	.dout ({mem3_unused, mem3[24:0]}),
	.en   (hqwe3),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
	);

   
   /////////////////////////////////////////////////////
   //
   // SHIFT REGISTERS for JTAG READ
   //
   /////////////////////////////////////////////////////

   sio_old_dp_msff_macro__stack_32l__width_32 eff_jtagsr_h   (
	.scan_in(eff_jtagsr_h_scanin),
	.scan_out(eff_jtagsr_h_scanout),
	.clk  (l2clk),
	.din  (in_jtag[63:32]),
	.dout (out_jtag[63:32]),
        .en   (ojc_old_jtagsr_en),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
	);

   sio_old_dp_msff_macro__stack_32l__width_32 eff_jtagsr_l   (
	.scan_in(eff_jtagsr_scanin),
	.scan_out(eff_jtagsr_scanout),
	.clk  (l2clk),
	.din  (in_jtag[31:0]),
	.dout (out_jtag[31:0]),
        .en   (ojc_old_jtagsr_en),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
	);

   // format we get from l2 for 1st 2 cycle are 
   // cycle 0 : in_sol0[31:0] = {B0[7:0], B1[7:0], B2[7:0], B3[7:0]}
   // cycle 1 : in_sol0[31:0] = {B4[7:0], B5[7:0], B6[7:0], B7[7:0]}

   // this gets loaded as
   // we[0] :   in_jtag[63:32] = in_sol0[31:0] = {B0[7:0], B1[7:0], B2[7:0], B3[7:0]}
   // we[1] :   in_jtag[31: 0] = in_sol0[31:0] = {B4[7:0], B5[7:0], B6[7:0], B7[7:0]}

   // during shift operation, the lsb is removed and everything from msb is shifted
   //  downward and the msb gets a 0
   //    in_jtag[63:0] <= {1'b0, out_jtag[63:1]} ; 

//   assign 	 in_jtag[31: 0] = ojc_old_wr_en[1] ? in_sol0[31:0] : (
//					out_jtag[32:1]);
//   assign 	 in_jtag[63:32] = ojc_old_wr_en[0] ? in_sol0[31:0] : (
//                                      ojc_old_wr_en[1] ? out_jtag[63:32] : {1'b0, outjtag[63:33]);
//   
   sio_old_dp_mux_macro__mux_aope__ports_2__stack_64c__width_64 mx21_in_jtag_temp     (
	.dout ({in_jtag[63:32],      in_jtag[31:0]}),
	.din0 ({in_sol0[31:0],          32'h00000000}),
	.din1 ({in_jtag_temp[63:32], in_jtag_temp[31:0]}),
 	.sel0 (ojc_old_wr_en[0])
     );
							     
   sio_old_dp_mux_macro__mux_aope__ports_2__stack_64c__width_64 mx21_in_jtag     (
	.dout ({in_jtag_temp[63:32],    in_jtag_temp[31:0]}),
	.din0 ({out_jtag[63:32], in_sol0[31:0]}),
	.din1 ({1'b0, out_jtag[63:33],  out_jtag[32:1]}),
 	.sel0 (ojc_old_wr_en[1])
     );
							     
   assign 	 old_opcc_jtag = out_jtag[0];
   
   /////////////////////////////////////////////////////
   //
   // CTAG ECC Generation (syndrome generation)
   //
   /////////////////////////////////////////////////////

   // original c bits generated
   // c0 =  [0] ^  [1] ^  [3] ^  [4] ^  [6] ^  [8] ^ [10] ^ [11] ^ [13] ^ [15]        
   // c1 =  [0] ^  [2] ^  [3] ^  [5] ^  [6] ^  [9] ^ [10] ^ [12] ^ [13]               
   // c2 =  [1] ^  [2] ^  [3] ^  [7] ^  [8] ^  [9] ^ [10] ^ [14] ^ [15]               
   // c3 =  [4] ^  [5] ^  [6] ^  [7] ^  [8] ^  [9] ^ [10]                             
   // c4 = [11] ^ [12] ^ [13] ^ [14] ^ [15]                                           
   // c5 =  [0] ^  [1] ^  [2] ^  [3] ^  c0 ^ c1 ^ c2


   // s0 =  [0] ^  [1] ^  [3] ^  [4] ^  [6] ^  [8] ^ [10] ^ [11] ^ [13] ^ [15]        ^ c[0]
   // s1 =  [0] ^  [2] ^  [3] ^  [5] ^  [6] ^  [9] ^ [10] ^ [12] ^ [13]               ^ c[1]
   // s2 =  [1] ^  [2] ^  [3] ^  [7] ^  [8] ^  [9] ^ [10] ^ [14] ^ [15]               ^ c[2]
   // s3 =  [4] ^  [5] ^  [6] ^  [7] ^  [8] ^  [9] ^ [10]                             ^ c[3]
   // s4 = [11] ^ [12] ^ [13] ^ [14] ^ [15]                                           ^ c[4]
   // s5*=  [0] ^  [1] ^  [2] ^  [3] ^  [4] ^  [5] ^  [6] ^  [7] ^  [8] ^  [9] ^
   //      [10] ^ [11] ^ [12] ^ [13] ^ [14] ^ [15] ^ c[0] ^ c[1] ^ c[2] ^ c[3] ^ c[4] ^ c[5]
   //
   // note that implementing s5* as (22 terms) would be expensive timing and area wise...
   // so if s5 = s3 ^ s4
   //          = [4] ^  [5] ^  [6] ^  [7] ^  [8] ^  [9] ^ [10] ^ [11] ^ [12] ^ [13] ^ [14] ^ [15] 
   //                              ^ c[3] ^ c[4]
   //
   //    or s5* = s3 ^ s4 ^ [0]  ^  [1] ^  [2] ^  [3] ^ [4] 
   //                     ^ c[0] ^ c[1] ^ c[2] ^ c[5]
   //
   // we could save some gates

   // really 11 wide
   sio_old_dp_prty_macro__width_16 ctag_syndrome0  (
	.din  ({5'b00000,
		oldhq_dout[0],   oldhq_dout[1] ,  oldhq_dout[3] ,  oldhq_dout[4] , 
		oldhq_dout[6] ,  oldhq_dout[8] , oldhq_dout[10] , oldhq_dout[11] , 
		oldhq_dout[13] , oldhq_dout[15] , oldhq_dout[19]}
	       ),
	.dout (ctag_syndrome[0])
        );
					     
   // really 10 wide
   sio_old_dp_prty_macro__width_16 ctag_syndrome1  (
	.din  ({6'b000000,
		oldhq_dout[0],   oldhq_dout[2] ,  oldhq_dout[3] ,  oldhq_dout[5] , 
		oldhq_dout[6] ,  oldhq_dout[9] , oldhq_dout[10] , oldhq_dout[12] , 
		oldhq_dout[13] , oldhq_dout[20]}
	       ),
	.dout (ctag_syndrome[1])
        );
   
   // really 10 wide
   sio_old_dp_prty_macro__width_16 ctag_syndrome2  (
	.din  ({6'b000000,
		oldhq_dout[1],   oldhq_dout[2] ,  oldhq_dout[3] ,  oldhq_dout[7] , 
		oldhq_dout[8] ,  oldhq_dout[9] , oldhq_dout[10] , oldhq_dout[14] , 
		oldhq_dout[15] , oldhq_dout[21]}
	       ),
	.dout (ctag_syndrome[2])
        );
   
   sio_old_dp_prty_macro__width_8 ctag_syndrome3  (
	.din  ({oldhq_dout[4],   oldhq_dout[5] ,  oldhq_dout[6] ,  oldhq_dout[7] , 
		oldhq_dout[8] ,  oldhq_dout[9] , oldhq_dout[10] , oldhq_dout[22]}
	       ),
	.dout (ctag_syndrome[3])
        );
   
   // really 6 wide
   sio_old_dp_prty_macro__width_8 ctag_syndrome4  (
	.din  ({2'b00,
		oldhq_dout[11],   oldhq_dout[12] ,  oldhq_dout[13] ,  oldhq_dout[14] , 
		oldhq_dout[15] ,  oldhq_dout[23]}
	       ),
	.dout (ctag_syndrome[4])
        );
   
   // really 11 wide
   sio_old_dp_prty_macro__width_16 ctag_syndrome5  (
	.din  ({5'b00000,
		oldhq_dout[0],   oldhq_dout[1] ,  oldhq_dout[2] ,  oldhq_dout[3] , 
		oldhq_dout[4] ,  oldhq_dout[24], oldhq_dout[21], oldhq_dout[20],
		oldhq_dout[19], ctag_syndrome[4], ctag_syndrome[3]}
	       ),
	.dout (ctag_syndrome[5])
        );

    
// fixscan start:
assign dff_in_sol0_scanin        = scan_in                  ;
assign eff_perr_sol1_scanin      = dff_in_sol0_scanout      ;
assign eff_ue0_sol2_scanin       = eff_perr_sol1_scanout    ;
assign eff_ue1_sol2_scanin       = eff_ue0_sol2_scanout     ;
assign eff_ue2_sol2_scanin       = eff_ue1_sol2_scanout     ;
assign eff_ue3_sol2_scanin       = eff_ue2_sol2_scanout     ;
assign ff_hqout_scanin           = eff_ue3_sol2_scanout     ;
assign ff_hqmem0_scanin          = ff_hqout_scanout         ;
assign ff_hqmem1_scanin          = ff_hqmem0_scanout        ;
assign ff_hqmem2_scanin          = ff_hqmem1_scanout        ;
assign ff_hqmem3_scanin          = ff_hqmem2_scanout        ;
assign eff_jtagsr_h_scanin       = ff_hqmem3_scanout        ;
assign eff_jtagsr_scanin         = eff_jtagsr_h_scanout     ;
assign scan_out                  = eff_jtagsr_scanout       ;
// fixscan end:
endmodule // sio_old_dp		           
				           
				           


// general mux macro for pass-gate and and-or muxes with/wout priority encoders
// also for pass-gate with decoder





// any PARAMS parms go into naming of macro

module sio_old_dp_mux_macro__mux_aope__ports_2__stack_46r__width_46 (
  din0, 
  din1, 
  sel0, 
  dout);
wire psel0;
wire psel1;

  input [45:0] din0;
  input [45:0] din1;
  input sel0;
  output [45:0] dout;





cl_dp1_penc2_8x  c0_0 (
 .sel0(sel0),
 .psel0(psel0),
 .psel1(psel1)
);

mux2s #(46)  d0_0 (
  .sel0(psel0),
  .sel1(psel1),
  .in0(din0[45:0]),
  .in1(din1[45:0]),
.dout(dout[45:0])
);









  



endmodule






// any PARAMS parms go into naming of macro

module sio_old_dp_msff_macro__stack_64c__width_35 (
  din, 
  clk, 
  en, 
  se, 
  scan_in, 
  siclk, 
  soclk, 
  pce_ov, 
  stop, 
  dout, 
  scan_out);
wire l1clk;
wire siclk_out;
wire soclk_out;
wire [33:0] so;

  input [34:0] din;


  input clk;
  input en;
  input se;
  input scan_in;
  input siclk;
  input soclk;
  input pce_ov;
  input stop;



  output [34:0] dout;


  output scan_out;




cl_dp1_l1hdr_8x c0_0 (
.l2clk(clk),
.pce(en),
.aclk(siclk),
.bclk(soclk),
.l1clk(l1clk),
  .se(se),
  .pce_ov(pce_ov),
  .stop(stop),
  .siclk_out(siclk_out),
  .soclk_out(soclk_out)
);
dff #(35)  d0_0 (
.l1clk(l1clk),
.siclk(siclk_out),
.soclk(soclk_out),
.d(din[34:0]),
.si({scan_in,so[33:0]}),
.so({so[33:0],scan_out}),
.q(dout[34:0])
);




















endmodule









//
//   parity macro (even parity)
//
//





module sio_old_dp_prty_macro__width_16 (
  din, 
  dout);
  input [15:0] din;
  output dout;







prty #(16)  m0_0 (
.in(din[15:0]),
.out(dout)
);










endmodule





//
//   xor macro for ports = 2,3
//
//





module sio_old_dp_xor_macro__left_1__stack_4r__width_1 (
  din0, 
  din1, 
  dout);
  input [0:0] din0;
  input [0:0] din1;
  output [0:0] dout;





xor2 #(1)  d0_0 (
.in0(din0[0:0]),
.in1(din1[0:0]),
.out(dout[0:0])
);








endmodule





//
//   xor macro for ports = 2,3
//
//





module sio_old_dp_xor_macro__left_0__stack_4r__width_1 (
  din0, 
  din1, 
  dout);
  input [0:0] din0;
  input [0:0] din1;
  output [0:0] dout;





xor2 #(1)  d0_0 (
.in0(din0[0:0]),
.in1(din1[0:0]),
.out(dout[0:0])
);








endmodule





//
//   invert macro
//
//





module sio_old_dp_inv_macro__left_0__stack_4r__width_1 (
  din, 
  dout);
  input [0:0] din;
  output [0:0] dout;






inv #(1)  d0_0 (
.in(din[0:0]),
.out(dout[0:0])
);









endmodule





//
//   nand macro for ports = 2,3,4
//
//





module sio_old_dp_nand_macro__left_0__stack_4r__width_1 (
  din0, 
  din1, 
  dout);
  input [0:0] din0;
  input [0:0] din1;
  output [0:0] dout;






nand2 #(1)  d0_0 (
.in0(din0[0:0]),
.in1(din1[0:0]),
.out(dout[0:0])
);









endmodule





//
//   nor macro for ports = 2,3
//
//





module sio_old_dp_nor_macro__left_0__ports_3__stack_4r__width_1 (
  din0, 
  din1, 
  din2, 
  dout);
  input [0:0] din0;
  input [0:0] din1;
  input [0:0] din2;
  output [0:0] dout;






nor3 #(1)  d0_0 (
.in0(din0[0:0]),
.in1(din1[0:0]),
.in2(din2[0:0]),
.out(dout[0:0])
);







endmodule





//
//   nand macro for ports = 2,3,4
//
//





module sio_old_dp_nand_macro__left_0__ports_2__stack_4r__width_1 (
  din0, 
  din1, 
  dout);
  input [0:0] din0;
  input [0:0] din1;
  output [0:0] dout;






nand2 #(1)  d0_0 (
.in0(din0[0:0]),
.in1(din1[0:0]),
.out(dout[0:0])
);









endmodule









// any PARAMS parms go into naming of macro

module sio_old_dp_msff_macro__left_0__stack_4r__width_1 (
  din, 
  clk, 
  en, 
  se, 
  scan_in, 
  siclk, 
  soclk, 
  pce_ov, 
  stop, 
  dout, 
  scan_out);
wire l1clk;
wire siclk_out;
wire soclk_out;

  input [0:0] din;


  input clk;
  input en;
  input se;
  input scan_in;
  input siclk;
  input soclk;
  input pce_ov;
  input stop;



  output [0:0] dout;


  output scan_out;




cl_dp1_l1hdr_8x c0_0 (
.l2clk(clk),
.pce(en),
.aclk(siclk),
.bclk(soclk),
.l1clk(l1clk),
  .se(se),
  .pce_ov(pce_ov),
  .stop(stop),
  .siclk_out(siclk_out),
  .soclk_out(soclk_out)
);
dff #(1)  d0_0 (
.l1clk(l1clk),
.siclk(siclk_out),
.soclk(soclk_out),
.d(din[0:0]),
.si(scan_in),
.so(scan_out),
.q(dout[0:0])
);




















endmodule













// any PARAMS parms go into naming of macro

module sio_old_dp_msff_macro__left_0__stack_2r__width_1 (
  din, 
  clk, 
  en, 
  se, 
  scan_in, 
  siclk, 
  soclk, 
  pce_ov, 
  stop, 
  dout, 
  scan_out);
wire l1clk;
wire siclk_out;
wire soclk_out;

  input [0:0] din;


  input clk;
  input en;
  input se;
  input scan_in;
  input siclk;
  input soclk;
  input pce_ov;
  input stop;



  output [0:0] dout;


  output scan_out;




cl_dp1_l1hdr_8x c0_0 (
.l2clk(clk),
.pce(en),
.aclk(siclk),
.bclk(soclk),
.l1clk(l1clk),
  .se(se),
  .pce_ov(pce_ov),
  .stop(stop),
  .siclk_out(siclk_out),
  .soclk_out(soclk_out)
);
dff #(1)  d0_0 (
.l1clk(l1clk),
.siclk(siclk_out),
.soclk(soclk_out),
.d(din[0:0]),
.si(scan_in),
.so(scan_out),
.q(dout[0:0])
);




















endmodule









// general mux macro for pass-gate and and-or muxes with/wout priority encoders
// also for pass-gate with decoder





// any PARAMS parms go into naming of macro

module sio_old_dp_mux_macro__left_0__mux_pgdec__ports_4__stack_2r__width_1 (
  din0, 
  din1, 
  din2, 
  din3, 
  sel, 
  muxtst, 
  test, 
  dout);
wire psel0;
wire psel1;
wire psel2;
wire psel3;

  input [0:0] din0;
  input [0:0] din1;
  input [0:0] din2;
  input [0:0] din3;
  input [1:0] sel;
  input muxtst;
  input test;
  output [0:0] dout;





cl_dp1_pdec4_8x  c0_0 (
 .sel0(sel[0]),
 .sel1(sel[1]),
 .psel0(psel0),
 .psel1(psel1),
 .psel2(psel2),
 .psel3(psel3),
  .test(test)
);

mux4 #(1)  d0_0 (
  .sel0(psel0),
  .sel1(psel1),
  .sel2(psel2),
  .sel3(psel3),
  .in0(din0[0:0]),
  .in1(din1[0:0]),
  .in2(din2[0:0]),
  .in3(din3[0:0]),
.dout(dout[0:0]),
  .muxtst(muxtst)
);









  



endmodule


//  
//   or macro for ports = 2,3
//
//





module sio_old_dp_or_macro__stack_2l__width_1 (
  din0, 
  din1, 
  dout);
  input [0:0] din0;
  input [0:0] din1;
  output [0:0] dout;






or2 #(1)  d0_0 (
.in0(din0[0:0]),
.in1(din1[0:0]),
.out(dout[0:0])
);









endmodule





// general mux macro for pass-gate and and-or muxes with/wout priority encoders
// also for pass-gate with decoder





// any PARAMS parms go into naming of macro

module sio_old_dp_mux_macro__mux_pgpe__ports_2__stack_32l__width_32 (
  din0, 
  din1, 
  sel0, 
  dout);
wire psel0_unused;
wire psel1;

  input [31:0] din0;
  input [31:0] din1;
  input sel0;
  output [31:0] dout;





cl_dp1_penc2_8x  c0_0 (
 .sel0(sel0),
 .psel0(psel0_unused),
 .psel1(psel1)
);

mux2e #(32)  d0_0 (
  .sel(psel1),
  .in0(din0[31:0]),
  .in1(din1[31:0]),
.dout(dout[31:0])
);









  



endmodule


// general mux macro for pass-gate and and-or muxes with/wout priority encoders
// also for pass-gate with decoder





// any PARAMS parms go into naming of macro

module sio_old_dp_mux_macro__mux_pgdec__ports_4__stack_26l__width_26 (
  din0, 
  din1, 
  din2, 
  din3, 
  sel, 
  muxtst, 
  test, 
  dout);
wire psel0;
wire psel1;
wire psel2;
wire psel3;

  input [25:0] din0;
  input [25:0] din1;
  input [25:0] din2;
  input [25:0] din3;
  input [1:0] sel;
  input muxtst;
  input test;
  output [25:0] dout;





cl_dp1_pdec4_8x  c0_0 (
 .sel0(sel[0]),
 .sel1(sel[1]),
 .psel0(psel0),
 .psel1(psel1),
 .psel2(psel2),
 .psel3(psel3),
  .test(test)
);

mux4 #(26)  d0_0 (
  .sel0(psel0),
  .sel1(psel1),
  .sel2(psel2),
  .sel3(psel3),
  .in0(din0[25:0]),
  .in1(din1[25:0]),
  .in2(din2[25:0]),
  .in3(din3[25:0]),
.dout(dout[25:0]),
  .muxtst(muxtst)
);









  



endmodule






// any PARAMS parms go into naming of macro

module sio_old_dp_msff_macro__stack_32l__width_30 (
  din, 
  clk, 
  en, 
  se, 
  scan_in, 
  siclk, 
  soclk, 
  pce_ov, 
  stop, 
  dout, 
  scan_out);
wire l1clk;
wire siclk_out;
wire soclk_out;
wire [28:0] so;

  input [29:0] din;


  input clk;
  input en;
  input se;
  input scan_in;
  input siclk;
  input soclk;
  input pce_ov;
  input stop;



  output [29:0] dout;


  output scan_out;




cl_dp1_l1hdr_8x c0_0 (
.l2clk(clk),
.pce(en),
.aclk(siclk),
.bclk(soclk),
.l1clk(l1clk),
  .se(se),
  .pce_ov(pce_ov),
  .stop(stop),
  .siclk_out(siclk_out),
  .soclk_out(soclk_out)
);
dff #(30)  d0_0 (
.l1clk(l1clk),
.siclk(siclk_out),
.soclk(soclk_out),
.d(din[29:0]),
.si({scan_in,so[28:0]}),
.so({so[28:0],scan_out}),
.q(dout[29:0])
);




















endmodule













// any PARAMS parms go into naming of macro

module sio_old_dp_msff_macro__stack_26l__width_26 (
  din, 
  clk, 
  en, 
  se, 
  scan_in, 
  siclk, 
  soclk, 
  pce_ov, 
  stop, 
  dout, 
  scan_out);
wire l1clk;
wire siclk_out;
wire soclk_out;
wire [24:0] so;

  input [25:0] din;


  input clk;
  input en;
  input se;
  input scan_in;
  input siclk;
  input soclk;
  input pce_ov;
  input stop;



  output [25:0] dout;


  output scan_out;




cl_dp1_l1hdr_8x c0_0 (
.l2clk(clk),
.pce(en),
.aclk(siclk),
.bclk(soclk),
.l1clk(l1clk),
  .se(se),
  .pce_ov(pce_ov),
  .stop(stop),
  .siclk_out(siclk_out),
  .soclk_out(soclk_out)
);
dff #(26)  d0_0 (
.l1clk(l1clk),
.siclk(siclk_out),
.soclk(soclk_out),
.d(din[25:0]),
.si({scan_in,so[24:0]}),
.so({so[24:0],scan_out}),
.q(dout[25:0])
);




















endmodule













// any PARAMS parms go into naming of macro

module sio_old_dp_msff_macro__stack_32l__width_32 (
  din, 
  clk, 
  en, 
  se, 
  scan_in, 
  siclk, 
  soclk, 
  pce_ov, 
  stop, 
  dout, 
  scan_out);
wire l1clk;
wire siclk_out;
wire soclk_out;
wire [30:0] so;

  input [31:0] din;


  input clk;
  input en;
  input se;
  input scan_in;
  input siclk;
  input soclk;
  input pce_ov;
  input stop;



  output [31:0] dout;


  output scan_out;




cl_dp1_l1hdr_8x c0_0 (
.l2clk(clk),
.pce(en),
.aclk(siclk),
.bclk(soclk),
.l1clk(l1clk),
  .se(se),
  .pce_ov(pce_ov),
  .stop(stop),
  .siclk_out(siclk_out),
  .soclk_out(soclk_out)
);
dff #(32)  d0_0 (
.l1clk(l1clk),
.siclk(siclk_out),
.soclk(soclk_out),
.d(din[31:0]),
.si({scan_in,so[30:0]}),
.so({so[30:0],scan_out}),
.q(dout[31:0])
);




















endmodule









// general mux macro for pass-gate and and-or muxes with/wout priority encoders
// also for pass-gate with decoder





// any PARAMS parms go into naming of macro

module sio_old_dp_mux_macro__mux_aope__ports_2__stack_64c__width_64 (
  din0, 
  din1, 
  sel0, 
  dout);
wire psel0;
wire psel1;

  input [63:0] din0;
  input [63:0] din1;
  input sel0;
  output [63:0] dout;





cl_dp1_penc2_8x  c0_0 (
 .sel0(sel0),
 .psel0(psel0),
 .psel1(psel1)
);

mux2s #(64)  d0_0 (
  .sel0(psel0),
  .sel1(psel1),
  .in0(din0[63:0]),
  .in1(din1[63:0]),
.dout(dout[63:0])
);









  



endmodule


//
//   parity macro (even parity)
//
//





module sio_old_dp_prty_macro__width_8 (
  din, 
  dout);
  input [7:0] din;
  output dout;







prty #(8)  m0_0 (
.in(din[7:0]),
.out(dout)
);










endmodule




