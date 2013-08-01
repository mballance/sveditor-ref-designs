// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: sii_ipcc_dp.v
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
module	sii_ipcc_dp (
  ipcc_data_all0, 
  ipcc_data_all1, 
  ipcc_data_all2, 
  ipcc_data_all3, 
  sii_mb1_read_data, 
  ipcc_dp_par_data, 
  curhdr, 
  data_sel, 
  gnt0_r_m, 
  hdr_data_sel, 
  new_c, 
  data_parity_err, 
  newhdr_l2, 
  newhdr_nc, 
  ipdohq0_dout, 
  ipdbhq0_dout, 
  ipdohq1_dout, 
  ipdbhq1_dout, 
  ipdodq0_dout, 
  ipdbdq0_dout, 
  ipdodq1_dout, 
  ipdbdq1_dout, 
  tcu_hdr, 
  tcu_data, 
  tcu_be_par, 
  scan_in, 
  scan_out, 
  l2clk, 
  tcu_muxtest, 
  tcu_dectest, 
  tcu_scan_en, 
  tcu_aclk, 
  tcu_bclk, 
  tcu_pce_ov, 
  tcu_clk_stop, 
  sii_mb0_wdata, 
  sii_mb0_run);
wire se;
wire siclk;
wire soclk;
wire pce_ov;
wire stop;
wire muxtst;
wire test;
wire [81:0] mbist0_wdata;
wire [7:0] sii_mb0_wdata_r;
wire [81:0] ipcc_data_func;
wire [13:0] newbe_par_rr;
wire [13:0] ipcc_ecc_r;
wire [71:0] ipcc_data_out_r;
wire [83:0] ipcc_data_out_m;
wire [16:0] new_be_r;
wire [13:0] newbe_par_r;
wire [63:0] newdata_r;
wire [1:0] ipcc_data_out_m_unused;
wire [89:0] ipcc_data_all;
wire ff_ipcc_data_out_scanin;
wire ff_ipcc_data_out_scanout;
wire [71:0] ipcc_data_out;
wire not_hdr_data_sel;
wire hdr_not_curhdr_58;
wire hdr_curhdr_58;
wire not_curhdr_58;
wire [71:0] curhdr_i;
wire [71:0] curhdr_l_buf;
wire ff_curhdri_scanin;
wire ff_curhdri_scanout;
wire [71:0] curhdr_l;
wire [4:0] gnt_pri;
wire [3:0] not_gnt0_r_m;
wire not_gnt0_2;
wire ff_newdata_scanin;
wire ff_newdata_scanout;
wire [63:0] newdata;
wire [63:0] newdata_tmp;
wire [13:0] be_par7;
wire [13:0] be_par6;
wire [13:0] be_par5;
wire [13:0] be_par4;
wire [13:0] be_par3;
wire [13:0] be_par2;
wire [13:0] be_par1;
wire [13:0] be_par0;
wire ff_newbe_par_scanin;
wire ff_newbe_par_scanout;
wire [13:0] newbe_par;
wire ff_newbe_par_rr_scanin;
wire ff_newbe_par_rr_scanout;
wire ff_mb0_wdata_scanin;
wire ff_mb0_wdata_scanout;
wire [7:0] sii_mb0_wdata_buf;
wire [13:0] ipcc_ecc;
wire [13:0] new_ecc;
wire [6:0] ecch;
wire [3:0] xor_ecc_h_l;
wire [6:0] eccl;
wire [31:0] eccd_h;
wire [31:0] eccd_l;
wire [8:0] eccd_h_0_l;
wire [8:0] eccd_h_0_r;
wire [8:0] eccd_h_0_l1;
wire [3:0] eccd_h_0_l2;
wire [1:0] eccd_h_0_l3;
wire [8:0] eccd_h_1_l;
wire [8:0] eccd_h_1_r;
wire [8:0] eccd_h_1_l1;
wire [3:0] eccd_h_1_l2;
wire [1:0] eccd_h_1_l3;
wire [8:0] eccd_h_2_l;
wire [8:0] eccd_h_2_r;
wire [8:0] eccd_h_2_l1;
wire [3:0] eccd_h_2_l2;
wire [1:0] eccd_h_2_l3;
wire [6:0] eccd_h_3_l;
wire [6:0] eccd_h_3_r;
wire [6:0] eccd_h_3_l1;
wire [3:0] eccd_h_3_l2;
wire [1:0] eccd_h_3_l3;
wire [6:0] eccd_h_4_l;
wire [6:0] eccd_h_4_r;
wire [6:0] eccd_h_4_l1;
wire [3:0] eccd_h_4_l2;
wire [1:0] eccd_h_4_l3;
wire [2:0] eccd_h_5_l1;
wire [8:0] eccd_h_6_l;
wire [8:0] eccd_h_6_r;
wire [8:0] eccd_h_6_l1;
wire [3:0] eccd_h_6_l2;
wire [1:0] eccd_h_6_l3;
wire [8:0] eccd_l_0_l;
wire [8:0] eccd_l_0_r;
wire [8:0] eccd_l_0_l1;
wire [3:0] eccd_l_0_l2;
wire [1:0] eccd_l_0_l3;
wire [8:0] eccd_l_1_l;
wire [8:0] eccd_l_1_r;
wire [8:0] eccd_l_1_l1;
wire [3:0] eccd_l_1_l2;
wire [1:0] eccd_l_1_l3;
wire [8:0] eccd_l_2_l;
wire [8:0] eccd_l_2_r;
wire [8:0] eccd_l_2_l1;
wire [3:0] eccd_l_2_l2;
wire [1:0] eccd_l_2_l3;
wire [6:0] eccd_l_3_l;
wire [6:0] eccd_l_3_r;
wire [6:0] eccd_l_3_l1;
wire [3:0] eccd_l_3_l2;
wire [1:0] eccd_l_3_l3;
wire [6:0] eccd_l_4_l;
wire [6:0] eccd_l_4_r;
wire [6:0] eccd_l_4_l1;
wire [3:0] eccd_l_4_l2;
wire [1:0] eccd_l_4_l3;
wire [2:0] eccd_l_5_l1;
wire [8:0] eccd_l_6_l;
wire [8:0] eccd_l_6_r;
wire [8:0] eccd_l_6_l1;
wire [3:0] eccd_l_6_l2;
wire [1:0] eccd_l_6_l3;
wire [13:0] newbe_par1;
wire ff_newbe_scanin;
wire ff_newbe_scanout;
wire [17:0] new_be;
wire new_be_unused;
wire ff_ipcc_ecc_scanin;
wire ff_ipcc_ecc_scanout;


output	[89:0]	ipcc_data_all0;
output	[89:0]	ipcc_data_all1;
output	[89:0]	ipcc_data_all2;
output	[89:0]	ipcc_data_all3;
output	[77:0]	sii_mb1_read_data;
output  [84:0]	ipcc_dp_par_data;
output	[71:0]	curhdr;

//------inter-submodule signals-------

input	[2:0] 	data_sel;
input	[4:0] 	gnt0_r_m;
input	 	hdr_data_sel;
input	[5:0]   new_c;
input		data_parity_err;

//-------from data path -----------
input 	[63:0]	newhdr_l2;		// header for l2 
input 	[63:0]	newhdr_nc;		// header for ncu
input   [71:0]  ipdohq0_dout;
input   [71:0]  ipdbhq0_dout;
input   [71:0]  ipdohq1_dout;
input   [71:0]  ipdbhq1_dout;
input   [152:0] ipdodq0_dout;
input   [152:0] ipdbdq0_dout;
input   [152:0] ipdodq1_dout;
input   [152:0] ipdbdq1_dout;
input   [71:0]  tcu_hdr;
input   [63:0]  tcu_data;
input   [11:0]  tcu_be_par;


input		scan_in;
output 		scan_out;

input		l2clk;
input   	tcu_muxtest;
input   	tcu_dectest;
input   	tcu_scan_en;
input   	tcu_aclk;
input   	tcu_bclk;
input   	tcu_pce_ov;
input   	tcu_clk_stop;
input	[7:0]	sii_mb0_wdata;
input		sii_mb0_run;

//************************************************************************
// SCAN CONNECTIONS
//************************************************************************
   assign 	 se = tcu_scan_en;
   assign 	 siclk = tcu_aclk;
   assign 	 soclk = tcu_bclk;
   assign 	 pce_ov = tcu_pce_ov;
   assign 	 stop = tcu_clk_stop;
   assign        muxtst = tcu_muxtest;
   assign        test   = tcu_dectest;

//************************************************************************
// MBIST SECTION 
//************************************************************************

assign mbist0_wdata[81:0] = {sii_mb0_wdata_r[1:0],sii_mb0_wdata_r[7:0], 
			     sii_mb0_wdata_r[7:0],sii_mb0_wdata_r[7:0], sii_mb0_wdata_r[7:0],
			     sii_mb0_wdata_r[7:0],sii_mb0_wdata_r[7:0], sii_mb0_wdata_r[7:0],
			     sii_mb0_wdata_r[7:0],sii_mb0_wdata_r[7:0], sii_mb0_wdata_r[7:0]};

assign ipcc_data_func[81:0]  = {newbe_par_rr[3:0], ipcc_ecc_r[13:0], ipcc_data_out_r[63:0]}; 

sii_ipcc_dpmux_macro__mux_pgpe__ports_2__stack_64c__width_64 mux_ipcc_data_63_0       
			(
			.dout(ipcc_data_out_m[63:0]),
			.din0(mbist0_wdata[63:0]),
			.din1(ipcc_data_func[63:0]),
			.sel0(sii_mb0_run)
			);

sii_ipcc_dpmux_macro__mux_pgpe__ports_2__stack_20c__width_20 mux_ipcc_data_81_64        
			(
			.dout(ipcc_data_out_m[83:64]),
			.din0({2'b00, mbist0_wdata[81:64]}),
			.din1({2'b00,ipcc_data_func[81:64]}),
			.sel0(sii_mb0_run)
			);

assign sii_mb1_read_data[77:0] = {newbe_par_rr[13:0],ipcc_data_out_r[63:0]}; 
assign ipcc_dp_par_data[84:0]  = {new_be_r[16:0], newbe_par_r[3:0], newdata_r[63:0]};
assign ipcc_data_out_m_unused[1:0] = ipcc_data_out_m[83:82];

//************************************************************************
// MUXES SECTION 
//************************************************************************
assign ipcc_data_all[89:0] = {newbe_par_rr[11:4], ipcc_data_out_m[81:0]};

sii_ipcc_dpbuff_macro__dbuff_48x__stack_46c__width_46 buff_ipcc_data_all0_45_0  
        (
        .dout   (ipcc_data_all0[45:0]),
        .din    (ipcc_data_all[45:0])
        );

sii_ipcc_dpbuff_macro__dbuff_48x__stack_44c__width_44 buff_ipcc_data_all0_89_46  
        (
        .dout   (ipcc_data_all0[89:46]),
        .din    (ipcc_data_all[89:46])
        );

sii_ipcc_dpbuff_macro__dbuff_48x__stack_46c__width_46 buff_ipcc_data_all1_45_0  
        (
        .dout   (ipcc_data_all1[45:0]),
        .din    (ipcc_data_all[45:0])
        );

sii_ipcc_dpbuff_macro__dbuff_48x__stack_44c__width_44 buff_ipcc_data_all1_89_46  
        (
        .dout   (ipcc_data_all1[89:46]),
        .din    (ipcc_data_all[89:46])
        );


sii_ipcc_dpbuff_macro__dbuff_48x__stack_46c__width_46 buff_ipcc_data_all2_45_0  
        (
        .dout   (ipcc_data_all2[45:0]),
        .din    (ipcc_data_all[45:0])
        );

sii_ipcc_dpbuff_macro__dbuff_48x__stack_44c__width_44 buff_ipcc_data_all2_89_46  
        (
        .dout   (ipcc_data_all2[89:46]),
        .din    (ipcc_data_all[89:46])
        );

sii_ipcc_dpbuff_macro__dbuff_48x__stack_46c__width_46 buff_ipcc_data_all3_45_0  
        (
        .dout   (ipcc_data_all3[45:0]),
        .din    (ipcc_data_all[45:0])
        );

sii_ipcc_dpbuff_macro__dbuff_48x__stack_44c__width_44 buff_ipcc_data_all3_89_46  
        (
        .dout   (ipcc_data_all3[89:46]),
        .din    (ipcc_data_all[89:46])
        );


sii_ipcc_dpmsff_macro__stack_72c__width_72 ff_ipcc_data_out 
                        (
                        .scan_in(ff_ipcc_data_out_scanin),
                        .scan_out(ff_ipcc_data_out_scanout),
                        .din    (ipcc_data_out[71:0]),
                        .clk    (l2clk),
			.en	(1'b1),
                        .dout   (ipcc_data_out_r[71:0]),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
                        ) ;
//
//In order to combine the mux_ipcc_data_out and mux_newhdr, it need
// to be split to 2 muxes because of the width are different.

sii_ipcc_dpmux_macro__mux_pgpe__ports_2__stack_8c__width_8 mux_ipcc_data_out_71_64    
             		(
		        .dout   (ipcc_data_out[71:64]) ,
                        .din1   (newbe_par_r[7:0]),
                        .din0   (curhdr[71:64]),
                        .sel0   (hdr_data_sel)
			) ;

sii_ipcc_dpmux_macro__mux_pgnpe__ports_3__stack_64c__width_64 mux_ipcc_data_out_63_0    
             		(
		        .dout   (ipcc_data_out[63:0]) ,
                        .din2   (newdata_r[63:0]),
                        .din1   (newhdr_nc[63:0]),
                        .din0   (newhdr_l2[63:0]),
                        .sel2   (not_hdr_data_sel),
                        .sel1   (hdr_not_curhdr_58),
                        .sel0   (hdr_curhdr_58),
  .muxtst(muxtst)
			) ;

//inv_macro inv_curhdr_58 (width = 1, stack=1r)
//			(
//			.din (curhdr[58]),
//			.dout (not_curhdr_58)
//			);

sii_ipcc_dpinv_macro__stack_2r__width_2 inv_hdr_data_sel_curhdr58    
			(
			.din ({hdr_data_sel, curhdr[58]}),
			.dout ({not_hdr_data_sel,not_curhdr_58})
			);


sii_ipcc_dpand_macro__left_0__ports_2__stack_2r__width_2 and_hdr_sel      
			(
			.din0 ({hdr_data_sel, hdr_data_sel}),
			.din1 ({curhdr[58], not_curhdr_58}),
			.dout ({hdr_curhdr_58, hdr_not_curhdr_58} )
			);


//mux_macro mux_ipcc_data_out (width=72, ports=2, mux=pgpe, stack=72c)
//             		(
//		        .dout   (ipcc_data_out[71:0]) ,
//                        .din1   ({newbe_par_r[7:0], newdata_r[63:0]}),
//                        .din0   ({curhdr[71:64], newhdr[63:0]}),
//                        .sel0   (hdr_data_sel)
//			) ;

//mux_macro mux_newhdr (width=64, ports=2, mux=pgpe, stack=64c)
//             		(
//		        .dout   (newhdr[63:0]) ,
//                        .din1   (newhdr_nc[63:0]),
//                        .din0   (newhdr_l2[63:0]),
//                        .sel0   (curhdr[58])
//			) ;

sii_ipcc_dpinv_macro__stack_72r__width_72 inv_curhdr  
			(
			.din (curhdr_i[71:0]),
			.dout (curhdr[71:0])
			);

sii_ipcc_dpmsffi_macro__stack_72c__width_72 ff_curhdri 
                        (
                        .din    (curhdr_l_buf[71:0]),
                        .scan_in(ff_curhdri_scanin),
                        .scan_out(ff_curhdri_scanout),
                        .clk    (l2clk),
			.en	(1'b1),
                        .dout_l (curhdr_i[71:0]),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
                        ) ;

sii_ipcc_dpbuff_macro__minbuff_1__width_8  buf_curhdr_72_64  
			(
			.din (curhdr_l[71:64]),
			.dout (curhdr_l_buf[71:64])
			);

sii_ipcc_dpbuff_macro__minbuff_1__width_64  buf_curhdr_63_0  
			(
			.din (curhdr_l[63:0]),
			.dout (curhdr_l_buf[63:0])
			);

// Put priority encoder before pass gate mux for dft purpose
assign gnt_pri[0] = gnt0_r_m[0];
sii_ipcc_dpinv_macro__left_0__stack_4r__width_4 inv_gnt0_r_m    
			(
			.din (gnt0_r_m[3:0]),
			.dout (not_gnt0_r_m[3:0])
			);

sii_ipcc_dpnor_macro__left_0__ports_3__stack_2r__width_1 nor_gnt0_2      
			(
			.din0 (gnt0_r_m[0]),
			.din1 (gnt0_r_m[1]),
			.din2 (gnt0_r_m[2]),
			.dout (not_gnt0_2)

			);


sii_ipcc_dpand_macro__left_0__ports_2__stack_4r__width_1 and_gnt1      
			(
			.din0 (not_gnt0_r_m[0]),
			.din1 (gnt0_r_m[1]),
			.dout (gnt_pri[1])
			);

sii_ipcc_dpand_macro__left_0__ports_3__stack_4r__width_1 and_gnt2      
			(
			.din0 (not_gnt0_r_m[0]),
			.din1 (not_gnt0_r_m[1]),
			.din2 (gnt0_r_m[2]),
			.dout (gnt_pri[2])
			);

sii_ipcc_dpand_macro__left_0__ports_4__stack_4r__width_1 and_gnt3      
			(
			.din0 (not_gnt0_r_m[0]),
			.din1 (not_gnt0_r_m[1]),
			.din2 (not_gnt0_r_m[2]),
			.din3 (gnt0_r_m[3]),
			.dout (gnt_pri[3])
			);

sii_ipcc_dpand_macro__left_0__ports_3__stack_4r__width_1 and_gnt4      
			(
			.din0 (not_gnt0_2),
			.din1 (not_gnt0_r_m[3]),
// N2- Bug 111258, AT: 			.din2 (gnt0_r_m[4]),
			.din2 (1'b1),			// N2+ Bug 111258, AT
			.dout (gnt_pri[4])
			);

sii_ipcc_dpmux_macro__mux_pgnpe__ports_5__stack_72c__width_72 mux_curhdr    
             		(
		        .dout   (curhdr_l[71:0]) ,
                        .din4   (tcu_hdr[71:0]),
                        .din3   (ipdohq0_dout[71:0]),
                        .din2   (ipdbhq0_dout[71:0]),
                        .din1   (ipdohq1_dout[71:0]),
                        .din0   (ipdbhq1_dout[71:0]),
                        .sel4   (gnt_pri[4]),
                        .sel3   (gnt_pri[3]),
                        .sel2   (gnt_pri[2]),
                        .sel1   (gnt_pri[1]),
                        .sel0   (gnt_pri[0]),
  .muxtst(muxtst)
              		) ;

sii_ipcc_dpmsff_macro__stack_64c__width_64 ff_newdata 
                        (
                        .scan_in(ff_newdata_scanin),
                        .scan_out(ff_newdata_scanout),
                        .din    (newdata[63:0]),
                        .clk    (l2clk),
			.en	(1'b1),
                        .dout   (newdata_r[63:0]),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
                        ) ;

sii_ipcc_dpmux_macro__mux_pgpe__ports_2__stack_64c__width_64 mux_newdata    
             		(
		        .dout   (newdata[63:0]) ,
                        .din1   (newdata_tmp[63:0]),
                        .din0   (tcu_data[63:0]),
                        .sel0   (gnt0_r_m[4])
              		) ;

sii_ipcc_dpmux_macro__mux_pgdec__ports_8__stack_64c__width_64 mux_newdata_tmp    
             		(
		        .dout   (newdata_tmp[63:0]) ,
                        .din7   (ipdodq0_dout[127:64]),
                        .din6   (ipdodq0_dout[63:0]),
                        .din5   (ipdbdq0_dout[127:64]),
                        .din4   (ipdbdq0_dout[63:0]),
                        .din3   (ipdodq1_dout[127:64]),
                        .din2   (ipdodq1_dout[63:0]),
                        .din1   (ipdbdq1_dout[127:64]),
                        .din0   (ipdbdq1_dout[63:0]),
                        .sel    (data_sel[2:0]),
  .muxtst(muxtst),
  .test(test)
              		) ;

assign be_par7[13:0]	= {1'b0, ipdodq0_dout[152], ipdodq0_dout[143:136],ipdodq0_dout[151:148]};
assign be_par6[13:0]	= {2'b0, ipdodq0_dout[135:128],ipdodq0_dout[147:144]}; 
assign be_par5[13:0]	= {1'b0, ipdbdq0_dout[152], ipdbdq0_dout[143:136],ipdbdq0_dout[151:148]};
assign be_par4[13:0]	= {2'b0, ipdbdq0_dout[135:128],ipdbdq0_dout[147:144]}; 
assign be_par3[13:0]	= {1'b0, ipdodq1_dout[152], ipdodq1_dout[143:136],ipdodq1_dout[151:148]};
assign be_par2[13:0]	= {2'b0, ipdodq1_dout[135:128],ipdodq1_dout[147:144]}; 
assign be_par1[13:0]	= {1'b0, ipdbdq1_dout[152], ipdbdq1_dout[143:136],ipdbdq1_dout[151:148]};
assign be_par0[13:0]	= {2'b0, ipdbdq1_dout[135:128],ipdbdq1_dout[147:144]}; 


sii_ipcc_dpmsff_macro__stack_14c__width_14 ff_newbe_par 
                        (
                        .scan_in(ff_newbe_par_scanin),
                        .scan_out(ff_newbe_par_scanout),
                        .din    (newbe_par[13:0]),
                        .clk    (l2clk),
                        .dout   (newbe_par_r[13:0]),
			.en (1'b1),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
                        ) ;

sii_ipcc_dpmsff_macro__stack_14c__width_14 ff_newbe_par_rr 
                        (
                        .scan_in(ff_newbe_par_rr_scanin),
                        .scan_out(ff_newbe_par_rr_scanout),
                        .din    ({newbe_par_r[13:8], ipcc_data_out[71:64]}),
                        .clk    (l2clk),
                        .dout   (newbe_par_rr[13:0]),
			.en (1'b1),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
                        ) ;

sii_ipcc_dpmsff_macro__stack_8c__width_8 ff_mb0_wdata 
                        (
                        .scan_in(ff_mb0_wdata_scanin),
                        .scan_out(ff_mb0_wdata_scanout),
                        .din    (sii_mb0_wdata_buf[7:0]),
                        .clk    (l2clk),
                        .dout   (sii_mb0_wdata_r[7:0]),
			.en (1'b1),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
                        ) ;

sii_ipcc_dpbuff_macro__minbuff_1__stack_8r__width_8  buf_sii_mb0_wdata   
			(
			.din (sii_mb0_wdata[7:0]),
			.dout (sii_mb0_wdata_buf[7:0])
			);


//---------------------------------------------------------------------
//				MUX SELECT ECC
//---------------------------------------------------------------------
sii_ipcc_dpmux_macro__mux_pgpe__ports_2__stack_14c__width_14 mux_ipcc_ecc     
                        (
                        .dout   (ipcc_ecc[13:0]) ,
                        .din1   (new_ecc[13:0]),
                        .din0   ({8'b0, new_c[5:0]}),
                        .sel0   (hdr_data_sel)
                        ) ;

assign new_ecc[13:0] = {ecch[6:2], xor_ecc_h_l[3:2], eccl[6:2], xor_ecc_h_l[1:0]};
sii_ipcc_dpxor_macro__ports_2__stack_4r__width_4 xor_ecc     
			(
			.din0 ({ecch[1:0], eccl[1:0]}),
			.din1 ({data_parity_err, data_parity_err, data_parity_err, data_parity_err}),
			.dout (xor_ecc_h_l[3:0])
			);

//---------------------------------------------------------------------
//				DATA ECC GENERATION LOGIC    				
//---------------------------------------------------------------------
assign eccd_h[31:0] = ipcc_dp_par_data[63:32];
assign eccd_l[31:0] = ipcc_dp_par_data[31:0];

assign eccd_h_0_l = {eccd_h[0], eccd_h[3], eccd_h[6], eccd_h[10], eccd_h[13],
		     eccd_h[17], eccd_h[21], eccd_h[25], eccd_h[28]};

assign eccd_h_0_r = {eccd_h[1], eccd_h[4], eccd_h[8], eccd_h[11], eccd_h[15],
		     eccd_h[19], eccd_h[23], eccd_h[26], eccd_h[30]};

   sii_ipcc_dpxor_macro__ports_2__stack_10r__width_9 xor_ecch_0_l1    (
        .din0  (eccd_h_0_l[8:0]),
	.din1  (eccd_h_0_r[8:0]),
        .dout (eccd_h_0_l1[8:0])
        );

   sii_ipcc_dpxor_macro__ports_2__stack_4r__width_4 xor_ecch_0_l2    (
        .din0  (eccd_h_0_l1[3:0]),
	.din1  (eccd_h_0_l1[7:4]),
        .dout (eccd_h_0_l2[3:0])
        );
    
   sii_ipcc_dpxor_macro__ports_2__stack_2r__width_2 xor_ecch_0_l3    (
        .din0  (eccd_h_0_l2[1:0]),
	.din1  (eccd_h_0_l2[3:2]),
        .dout (eccd_h_0_l3[1:0])
        );
    
   sii_ipcc_dpxor_macro__ports_3__stack_2r__width_1 xor_ecch_0_l4    (
        .din0  (eccd_h_0_l3[0]),
	.din1  (eccd_h_0_l3[1]),
	.din2  (eccd_h_0_l1[8]),
        .dout (ecch[0])
        );
    
assign eccd_h_1_l = {eccd_h[0], eccd_h[3], eccd_h[6], eccd_h[10], eccd_h[13],
		     eccd_h[17], eccd_h[21], eccd_h[25], eccd_h[28]};

assign eccd_h_1_r = {eccd_h[2], eccd_h[5], eccd_h[9], eccd_h[12], eccd_h[16],
		     eccd_h[20], eccd_h[24], eccd_h[27], eccd_h[31]};

   sii_ipcc_dpxor_macro__ports_2__stack_10r__width_9 xor_ecch_1_l1    (
        .din0  (eccd_h_1_l[8:0]),
	.din1  (eccd_h_1_r[8:0]),
        .dout (eccd_h_1_l1[8:0])
        );

   sii_ipcc_dpxor_macro__ports_2__stack_4r__width_4 xor_ecch_1_l2    (
        .din0  (eccd_h_1_l1[3:0]),
	.din1  (eccd_h_1_l1[7:4]),
        .dout (eccd_h_1_l2[3:0])
        );
    
   sii_ipcc_dpxor_macro__ports_2__stack_2r__width_2 xor_ecch_1_l3    (
        .din0  (eccd_h_1_l2[1:0]),
	.din1  (eccd_h_1_l2[3:2]),
        .dout (eccd_h_1_l3[1:0])
        );
    
   sii_ipcc_dpxor_macro__ports_3__stack_2r__width_1 xor_ecch_1_l4    (
        .din0  (eccd_h_1_l3[0]),
	.din1  (eccd_h_1_l3[1]),
	.din2  (eccd_h_1_l1[8]),
        .dout (ecch[1])
        );
    
assign eccd_h_2_l = {eccd_h[1], eccd_h[3], eccd_h[8], eccd_h[10], eccd_h[15],
		     eccd_h[17], eccd_h[23], eccd_h[25], eccd_h[30]};

assign eccd_h_2_r = {eccd_h[2], eccd_h[7], eccd_h[9], eccd_h[14], eccd_h[16],
		     eccd_h[22], eccd_h[24], eccd_h[29], eccd_h[31]};

   sii_ipcc_dpxor_macro__ports_2__stack_10r__width_9 xor_ecch_2_l1    (
        .din0  (eccd_h_2_l[8:0]),
	.din1  (eccd_h_2_r[8:0]),
        .dout (eccd_h_2_l1[8:0])
        );

   sii_ipcc_dpxor_macro__ports_2__stack_4r__width_4 xor_ecch_2_l2    (
        .din0  (eccd_h_2_l1[3:0]),
	.din1  (eccd_h_2_l1[7:4]),
        .dout (eccd_h_2_l2[3:0])
        );
    
   sii_ipcc_dpxor_macro__ports_2__stack_2r__width_2 xor_ecch_2_l3    (
        .din0  (eccd_h_2_l2[1:0]),
	.din1  (eccd_h_2_l2[3:2]),
        .dout (eccd_h_2_l3[1:0])
        );
    
   sii_ipcc_dpxor_macro__ports_3__stack_2r__width_1 xor_ecch_2_l4    (
        .din0  (eccd_h_2_l3[0]),
	.din1  (eccd_h_2_l3[1]),
	.din2  (eccd_h_2_l1[8]),
        .dout (ecch[2])
        );
    
assign eccd_h_3_l = {eccd_h[4], eccd_h[6], eccd_h[8], eccd_h[10], eccd_h[19],
		     eccd_h[21], eccd_h[23]};

assign eccd_h_3_r = {eccd_h[5], eccd_h[7], eccd_h[9], eccd_h[18], eccd_h[20],
		     eccd_h[22], eccd_h[24]};

   sii_ipcc_dpxor_macro__ports_2__stack_8r__width_7 xor_ecch_3_l1    (
        .din0  (eccd_h_3_l[6:0]),
	.din1  (eccd_h_3_r[6:0]),
        .dout (eccd_h_3_l1[6:0])
        );

   sii_ipcc_dpxor_macro__ports_2__stack_4r__width_4 xor_ecch_3_l2    (
        .din0  (eccd_h_3_l1[3:0]),
	.din1  ({eccd_h_3_l1[6:4],eccd_h[25]}),
        .dout (eccd_h_3_l2[3:0])
        );
    
   sii_ipcc_dpxor_macro__ports_2__stack_2r__width_2 xor_ecch_3_l3    (
        .din0  (eccd_h_3_l2[1:0]),
	.din1  (eccd_h_3_l2[3:2]),
        .dout (eccd_h_3_l3[1:0])
        );
    
   sii_ipcc_dpxor_macro__ports_2__stack_2r__width_1 xor_ecch_3_l4    (
        .din0  (eccd_h_3_l3[0]),
	.din1  (eccd_h_3_l3[1]),
        .dout (ecch[3])
        );

 
assign eccd_h_4_l = {eccd_h[11], eccd_h[13], eccd_h[15], eccd_h[17], eccd_h[19],
                     eccd_h[21], eccd_h[23]};

assign eccd_h_4_r = {eccd_h[12], eccd_h[14], eccd_h[16], eccd_h[18], eccd_h[20],
                     eccd_h[22], eccd_h[24]};

   sii_ipcc_dpxor_macro__ports_2__stack_8r__width_7 xor_ecch_4_l1    (
        .din0  (eccd_h_4_l[6:0]),
        .din1  (eccd_h_4_r[6:0]),
        .dout (eccd_h_4_l1[6:0])
        );

   sii_ipcc_dpxor_macro__ports_2__stack_4r__width_4 xor_ecch_4_l2    (
        .din0  (eccd_h_4_l1[3:0]),
        .din1  ({eccd_h_4_l1[6:4],eccd_h[25]}),
        .dout (eccd_h_4_l2[3:0])
        );
   
   sii_ipcc_dpxor_macro__ports_2__stack_2r__width_2 xor_ecch_4_l3    (
        .din0  (eccd_h_4_l2[1:0]),
        .din1  (eccd_h_4_l2[3:2]),
        .dout (eccd_h_4_l3[1:0])
        );
   
   sii_ipcc_dpxor_macro__ports_2__stack_2r__width_1 xor_ecch_4_l4    (
        .din0  (eccd_h_4_l3[0]),
        .din1  (eccd_h_4_l3[1]),
        .dout (ecch[4])
        );
    
   sii_ipcc_dpxor_macro__ports_2__stack_4r__width_3 xor_ecch_5_l1    (
        .din0  ({eccd_h[26], eccd_h[28], eccd_h[30]}),
        .din1  ({eccd_h[27], eccd_h[29], eccd_h[31]}),
        .dout (eccd_h_5_l1[2:0])
        );

   sii_ipcc_dpxor_macro__ports_3__stack_2r__width_1 xor_ecch_5_l4    (
        .din0  (eccd_h_5_l1[0]),
        .din1  (eccd_h_5_l1[1]),
        .din2  (eccd_h_5_l1[2]),
        .dout (ecch[5])
        );

assign eccd_h_6_l = {eccd_h[0], eccd_h[1], eccd_h[2], eccd_h[4], eccd_h[5],
                     eccd_h[7], eccd_h[10], eccd_h[11], eccd_h[12]};

assign eccd_h_6_r = {eccd_h[14], eccd_h[17], eccd_h[18], eccd_h[21], eccd_h[23],
                     eccd_h[24], eccd_h[26], eccd_h[27], eccd_h[29]};

   sii_ipcc_dpxor_macro__ports_2__stack_10r__width_9 xor_ecch_6_l1    (
        .din0  (eccd_h_6_l[8:0]),
        .din1  (eccd_h_6_r[8:0]),
        .dout (eccd_h_6_l1[8:0])
        );

   sii_ipcc_dpxor_macro__ports_2__stack_4r__width_4 xor_ecch_6_l2    (
        .din0  (eccd_h_6_l1[3:0]),
        .din1  (eccd_h_6_l1[7:4]),
        .dout (eccd_h_6_l2[3:0])
        );

   sii_ipcc_dpxor_macro__ports_2__stack_2r__width_2 xor_ecch_6_l3    (
        .din0  (eccd_h_6_l2[1:0]),
        .din1  (eccd_h_6_l2[3:2]),
        .dout (eccd_h_6_l3[1:0])
        );

   sii_ipcc_dpxor_macro__ports_3__stack_2r__width_1 xor_ecch_6_l4    (
        .din0  (eccd_h_6_l3[0]),
        .din1  (eccd_h_6_l3[1]),
        .din2  (eccd_h_6_l1[8]),
        .dout (ecch[6])
        );

//---------------------------------------------------------------------

assign eccd_l_0_l = {eccd_l[0], eccd_l[3], eccd_l[6], eccd_l[10], eccd_l[13],
		     eccd_l[17], eccd_l[21], eccd_l[25], eccd_l[28]};

assign eccd_l_0_r = {eccd_l[1], eccd_l[4], eccd_l[8], eccd_l[11], eccd_l[15],
		     eccd_l[19], eccd_l[23], eccd_l[26], eccd_l[30]};

   sii_ipcc_dpxor_macro__ports_2__stack_10r__width_9 xor_eccl_0_l1    (
        .din0  (eccd_l_0_l[8:0]),
	.din1  (eccd_l_0_r[8:0]),
        .dout (eccd_l_0_l1[8:0])
        );

   sii_ipcc_dpxor_macro__ports_2__stack_4r__width_4 xor_eccl_0_l2    (
        .din0  (eccd_l_0_l1[3:0]),
	.din1  (eccd_l_0_l1[7:4]),
        .dout (eccd_l_0_l2[3:0])
        );
    
   sii_ipcc_dpxor_macro__ports_2__stack_2r__width_2 xor_eccl_0_l3    (
        .din0  (eccd_l_0_l2[1:0]),
	.din1  (eccd_l_0_l2[3:2]),
        .dout (eccd_l_0_l3[1:0])
        );
    
   sii_ipcc_dpxor_macro__ports_3__stack_2r__width_1 xor_eccl_0_l4    (
        .din0  (eccd_l_0_l3[0]),
	.din1  (eccd_l_0_l3[1]),
	.din2  (eccd_l_0_l1[8]),
        .dout (eccl[0])
        );
    
assign eccd_l_1_l = {eccd_l[0], eccd_l[3], eccd_l[6], eccd_l[10], eccd_l[13],
		     eccd_l[17], eccd_l[21], eccd_l[25], eccd_l[28]};

assign eccd_l_1_r = {eccd_l[2], eccd_l[5], eccd_l[9], eccd_l[12], eccd_l[16],
		     eccd_l[20], eccd_l[24], eccd_l[27], eccd_l[31]};

   sii_ipcc_dpxor_macro__ports_2__stack_10r__width_9 xor_eccl_1_l1    (
        .din0  (eccd_l_1_l[8:0]),
	.din1  (eccd_l_1_r[8:0]),
        .dout (eccd_l_1_l1[8:0])
        );

   sii_ipcc_dpxor_macro__ports_2__stack_8r__width_4 xor_eccl_1_l2    (
        .din0  (eccd_l_1_l1[3:0]),
	.din1  (eccd_l_1_l1[7:4]),
        .dout (eccd_l_1_l2[3:0])
        );
    
   sii_ipcc_dpxor_macro__ports_2__stack_4r__width_2 xor_eccl_1_l3    (
        .din0  (eccd_l_1_l2[1:0]),
	.din1  (eccd_l_1_l2[3:2]),
        .dout (eccd_l_1_l3[1:0])
        );
    
   sii_ipcc_dpxor_macro__ports_3__stack_2r__width_1 xor_eccl_1_l4    (
        .din0  (eccd_l_1_l3[0]),
	.din1  (eccd_l_1_l3[1]),
	.din2  (eccd_l_1_l1[8]),
        .dout (eccl[1])
        );
    
assign eccd_l_2_l = {eccd_l[1], eccd_l[3], eccd_l[8], eccd_l[10], eccd_l[15],
		     eccd_l[17], eccd_l[23], eccd_l[25], eccd_l[30]};

assign eccd_l_2_r = {eccd_l[2], eccd_l[7], eccd_l[9], eccd_l[14], eccd_l[16],
		     eccd_l[22], eccd_l[24], eccd_l[29], eccd_l[31]};

   sii_ipcc_dpxor_macro__ports_2__stack_10r__width_9 xor_eccl_2_l1    (
        .din0  (eccd_l_2_l[8:0]),
	.din1  (eccd_l_2_r[8:0]),
        .dout (eccd_l_2_l1[8:0])
        );

   sii_ipcc_dpxor_macro__ports_2__stack_4r__width_4 xor_eccl_2_l2    (
        .din0  (eccd_l_2_l1[3:0]),
	.din1  (eccd_l_2_l1[7:4]),
        .dout (eccd_l_2_l2[3:0])
        );
    
   sii_ipcc_dpxor_macro__ports_2__stack_2r__width_2 xor_eccl_2_l3    (
        .din0  (eccd_l_2_l2[1:0]),
	.din1  (eccd_l_2_l2[3:2]),
        .dout (eccd_l_2_l3[1:0])
        );
    
   sii_ipcc_dpxor_macro__ports_3__stack_2r__width_1 xor_eccl_2_l4    (
        .din0  (eccd_l_2_l3[0]),
	.din1  (eccd_l_2_l3[1]),
	.din2  (eccd_l_2_l1[8]),
        .dout (eccl[2])
        );
    
assign eccd_l_3_l = {eccd_l[4], eccd_l[6], eccd_l[8], eccd_l[10], eccd_l[19],
		     eccd_l[21], eccd_l[23]};

assign eccd_l_3_r = {eccd_l[5], eccd_l[7], eccd_l[9], eccd_l[18], eccd_l[20],
		     eccd_l[22], eccd_l[24]};

   sii_ipcc_dpxor_macro__ports_2__stack_8r__width_7 xor_eccl_3_l1    (
        .din0  (eccd_l_3_l[6:0]),
	.din1  (eccd_l_3_r[6:0]),
        .dout (eccd_l_3_l1[6:0])
        );

   sii_ipcc_dpxor_macro__ports_2__stack_4r__width_4 xor_eccl_3_l2    (
        .din0  (eccd_l_3_l1[3:0]),
	.din1  ({eccd_l_3_l1[6:4],eccd_l[25]}),
        .dout (eccd_l_3_l2[3:0])
        );
    
   sii_ipcc_dpxor_macro__ports_2__stack_2r__width_2 xor_eccl_3_l3    (
        .din0  (eccd_l_3_l2[1:0]),
	.din1  (eccd_l_3_l2[3:2]),
        .dout (eccd_l_3_l3[1:0])
        );
    
   sii_ipcc_dpxor_macro__ports_2__stack_2r__width_1 xor_eccl_3_l4    (
        .din0  (eccd_l_3_l3[0]),
	.din1  (eccd_l_3_l3[1]),
        .dout (eccl[3])
        );

 
assign eccd_l_4_l = {eccd_l[11], eccd_l[13], eccd_l[15], eccd_l[17], eccd_l[19],
                     eccd_l[21], eccd_l[23]};

assign eccd_l_4_r = {eccd_l[12], eccd_l[14], eccd_l[16], eccd_l[18], eccd_l[20],
                     eccd_l[22], eccd_l[24]};

   sii_ipcc_dpxor_macro__ports_2__stack_8r__width_7 xor_eccl_4_l1    (
        .din0  (eccd_l_4_l[6:0]),
        .din1  (eccd_l_4_r[6:0]),
        .dout (eccd_l_4_l1[6:0])
        );

   sii_ipcc_dpxor_macro__ports_2__stack_4r__width_4 xor_eccl_4_l2    (
        .din0  (eccd_l_4_l1[3:0]),
        .din1  ({eccd_l_4_l1[6:4],eccd_l[25]}),
        .dout (eccd_l_4_l2[3:0])
        );
   
   sii_ipcc_dpxor_macro__ports_2__stack_2r__width_2 xor_eccl_4_l3    (
        .din0  (eccd_l_4_l2[1:0]),
        .din1  (eccd_l_4_l2[3:2]),
        .dout (eccd_l_4_l3[1:0])
        );
   
   sii_ipcc_dpxor_macro__ports_2__stack_2r__width_1 xor_eccl_4_l4    (
        .din0  (eccd_l_4_l3[0]),
        .din1  (eccd_l_4_l3[1]),
        .dout (eccl[4])
        );
    
   sii_ipcc_dpxor_macro__ports_2__stack_4r__width_3 xor_eccl_5_l1    (
        .din0  ({eccd_l[26], eccd_l[28], eccd_l[30]}),
        .din1  ({eccd_l[27], eccd_l[29], eccd_l[31]}),
        .dout (eccd_l_5_l1[2:0])
        );

   sii_ipcc_dpxor_macro__ports_3__stack_2r__width_1 xor_eccl_5_l4    (
        .din0  (eccd_l_5_l1[0]),
        .din1  (eccd_l_5_l1[1]),
        .din2  (eccd_l_5_l1[2]),
        .dout (eccl[5])
        );

assign eccd_l_6_l = {eccd_l[0], eccd_l[1], eccd_l[2], eccd_l[4], eccd_l[5],
                     eccd_l[7], eccd_l[10], eccd_l[11], eccd_l[12]};

assign eccd_l_6_r = {eccd_l[14], eccd_l[17], eccd_l[18], eccd_l[21], eccd_l[23],
                     eccd_l[24], eccd_l[26], eccd_l[27], eccd_l[29]};

   sii_ipcc_dpxor_macro__ports_2__stack_10r__width_9 xor_eccl_6_l1    (
        .din0  (eccd_l_6_l[8:0]),
        .din1  (eccd_l_6_r[8:0]),
        .dout (eccd_l_6_l1[8:0])
        );

   sii_ipcc_dpxor_macro__ports_2__stack_4r__width_4 xor_eccl_6_l2    (
        .din0  (eccd_l_6_l1[3:0]),
        .din1  (eccd_l_6_l1[7:4]),
        .dout (eccd_l_6_l2[3:0])
        );

   sii_ipcc_dpxor_macro__ports_2__stack_2r__width_2 xor_eccl_6_l3    (
        .din0  (eccd_l_6_l2[1:0]),
        .din1  (eccd_l_6_l2[3:2]),
        .dout (eccd_l_6_l3[1:0])
        );

   sii_ipcc_dpxor_macro__ports_3__stack_2r__width_1 xor_eccl_6_l4    (
        .din0  (eccd_l_6_l3[0]),
        .din1  (eccd_l_6_l3[1]),
        .din2  (eccd_l_6_l1[8]),
        .dout (eccl[6])
        );


//---------------------------------------------------------------------
//	DATA PARITY GENERATION LOGIC
//---------------------------------------------------------------------

sii_ipcc_dpmux_macro__mux_pgpe__ports_2__stack_14c__width_14 mux_newbe_par     
                        (
                        .dout   (newbe_par[13:0]) ,
                        .din1   (newbe_par1[13:0]),
                        .din0   ({2'b0, tcu_be_par[11:0]}),
                        .sel0   (gnt0_r_m[4])
                        ) ;

sii_ipcc_dpmux_macro__mux_pgdec__ports_8__stack_14c__width_14 mux_newbe_par1    
             		(
		        .dout   (newbe_par1[13:0]) ,
                        .din7   (be_par7[13:0]),
                        .din6   (be_par6[13:0]),
                        .din5   (be_par5[13:0]),
                        .din4   (be_par4[13:0]),
                        .din3   (be_par3[13:0]),
                        .din2   (be_par2[13:0]),
                        .din1   (be_par1[13:0]),
                        .din0   (be_par0[13:0]),
                        .sel    (data_sel[2:0]),
  .muxtst(muxtst),
  .test(test)
              		) ;

sii_ipcc_dpmsff_macro__stack_18c__width_18 ff_newbe 
                        (
                        .scan_in(ff_newbe_scanin),
                        .scan_out(ff_newbe_scanout),
                        .din    (new_be[17:0]),
                        .clk    (l2clk),
			.en 	(1'b1),
                        .dout   ({new_be_unused, new_be_r[16:0]}),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
                        ) ;

sii_ipcc_dpmux_macro__mux_pgdec__ports_4__stack_18c__width_18 mux_newbe    
             		(
		        .dout   (new_be[17:0]) ,
                        .din3   ({1'b0, ipdodq0_dout[152], be_par7[11:4], be_par6[11:4]}),
                        .din2   ({1'b0, ipdbdq0_dout[152], be_par5[11:4], be_par4[11:4]}),
                        .din1   ({1'b0, ipdodq1_dout[152], be_par3[11:4], be_par2[11:4]}),
                        .din0   ({1'b0, ipdbdq1_dout[152], be_par1[11:4], be_par0[11:4]}),
                        .sel    (data_sel[2:1]),
  .muxtst(muxtst),
  .test(test)
              		) ;

sii_ipcc_dpmsff_macro__stack_14c__width_14 ff_ipcc_ecc 
                        (
                        .scan_in(ff_ipcc_ecc_scanin),
                        .scan_out(ff_ipcc_ecc_scanout),
                        .din    (ipcc_ecc[13:0]),
                        .clk    (l2clk),
			.en 	(1'b1),
                        .dout   (ipcc_ecc_r[13:0]),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
                        ) ;

// fixscan start:
assign ff_ipcc_data_out_scanin   = scan_in                  ;
assign ff_curhdri_scanin         = ff_ipcc_data_out_scanout ;
assign ff_newdata_scanin         = ff_curhdri_scanout       ;
assign ff_newbe_par_scanin       = ff_newdata_scanout       ;
assign ff_newbe_par_rr_scanin    = ff_newbe_par_scanout     ;
assign ff_mb0_wdata_scanin       = ff_newbe_par_rr_scanout  ;
assign ff_newbe_scanin           = ff_mb0_wdata_scanout     ;
assign ff_ipcc_ecc_scanin        = ff_newbe_scanout         ;
assign scan_out                  = ff_ipcc_ecc_scanout      ;
// fixscan end:
endmodule


// general mux macro for pass-gate and and-or muxes with/wout priority encoders
// also for pass-gate with decoder





// any PARAMS parms go into naming of macro

module sii_ipcc_dpmux_macro__mux_pgpe__ports_2__stack_64c__width_64 (
  din0, 
  din1, 
  sel0, 
  dout);
wire psel0_unused;
wire psel1;

  input [63:0] din0;
  input [63:0] din1;
  input sel0;
  output [63:0] dout;





cl_dp1_penc2_8x  c0_0 (
 .sel0(sel0),
 .psel0(psel0_unused),
 .psel1(psel1)
);

mux2e #(64)  d0_0 (
  .sel(psel1),
  .in0(din0[63:0]),
  .in1(din1[63:0]),
.dout(dout[63:0])
);









  



endmodule


// general mux macro for pass-gate and and-or muxes with/wout priority encoders
// also for pass-gate with decoder





// any PARAMS parms go into naming of macro

module sii_ipcc_dpmux_macro__mux_pgpe__ports_2__stack_20c__width_20 (
  din0, 
  din1, 
  sel0, 
  dout);
wire psel0_unused;
wire psel1;

  input [19:0] din0;
  input [19:0] din1;
  input sel0;
  output [19:0] dout;





cl_dp1_penc2_8x  c0_0 (
 .sel0(sel0),
 .psel0(psel0_unused),
 .psel1(psel1)
);

mux2e #(20)  d0_0 (
  .sel(psel1),
  .in0(din0[19:0]),
  .in1(din1[19:0]),
.dout(dout[19:0])
);









  



endmodule


//
//   buff macro
//
//





module sii_ipcc_dpbuff_macro__dbuff_48x__stack_46c__width_46 (
  din, 
  dout);
  input [45:0] din;
  output [45:0] dout;






buff #(46)  d0_0 (
.in(din[45:0]),
.out(dout[45:0])
);








endmodule





//
//   buff macro
//
//





module sii_ipcc_dpbuff_macro__dbuff_48x__stack_44c__width_44 (
  din, 
  dout);
  input [43:0] din;
  output [43:0] dout;






buff #(44)  d0_0 (
.in(din[43:0]),
.out(dout[43:0])
);








endmodule









// any PARAMS parms go into naming of macro

module sii_ipcc_dpmsff_macro__stack_72c__width_72 (
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
wire [70:0] so;

  input [71:0] din;


  input clk;
  input en;
  input se;
  input scan_in;
  input siclk;
  input soclk;
  input pce_ov;
  input stop;



  output [71:0] dout;


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
dff #(72)  d0_0 (
.l1clk(l1clk),
.siclk(siclk_out),
.soclk(soclk_out),
.d(din[71:0]),
.si({scan_in,so[70:0]}),
.so({so[70:0],scan_out}),
.q(dout[71:0])
);




















endmodule









// general mux macro for pass-gate and and-or muxes with/wout priority encoders
// also for pass-gate with decoder





// any PARAMS parms go into naming of macro

module sii_ipcc_dpmux_macro__mux_pgpe__ports_2__stack_8c__width_8 (
  din0, 
  din1, 
  sel0, 
  dout);
wire psel0_unused;
wire psel1;

  input [7:0] din0;
  input [7:0] din1;
  input sel0;
  output [7:0] dout;





cl_dp1_penc2_8x  c0_0 (
 .sel0(sel0),
 .psel0(psel0_unused),
 .psel1(psel1)
);

mux2e #(8)  d0_0 (
  .sel(psel1),
  .in0(din0[7:0]),
  .in1(din1[7:0]),
.dout(dout[7:0])
);









  



endmodule


// general mux macro for pass-gate and and-or muxes with/wout priority encoders
// also for pass-gate with decoder





// any PARAMS parms go into naming of macro

module sii_ipcc_dpmux_macro__mux_pgnpe__ports_3__stack_64c__width_64 (
  din0, 
  sel0, 
  din1, 
  sel1, 
  din2, 
  sel2, 
  muxtst, 
  dout);
wire buffout0;
wire buffout1;
wire buffout2;

  input [63:0] din0;
  input sel0;
  input [63:0] din1;
  input sel1;
  input [63:0] din2;
  input sel2;
  input muxtst;
  output [63:0] dout;





cl_dp1_muxbuff3_8x  c0_0 (
 .in0(sel0),
 .in1(sel1),
 .in2(sel2),
 .out0(buffout0),
 .out1(buffout1),
 .out2(buffout2)
);
mux3 #(64)  d0_0 (
  .sel0(buffout0),
  .sel1(buffout1),
  .sel2(buffout2),
  .in0(din0[63:0]),
  .in1(din1[63:0]),
  .in2(din2[63:0]),
.dout(dout[63:0]),
  .muxtst(muxtst)
);









  



endmodule


//
//   invert macro
//
//





module sii_ipcc_dpinv_macro__stack_2r__width_2 (
  din, 
  dout);
  input [1:0] din;
  output [1:0] dout;






inv #(2)  d0_0 (
.in(din[1:0]),
.out(dout[1:0])
);









endmodule





//  
//   and macro for ports = 2,3,4
//
//





module sii_ipcc_dpand_macro__left_0__ports_2__stack_2r__width_2 (
  din0, 
  din1, 
  dout);
  input [1:0] din0;
  input [1:0] din1;
  output [1:0] dout;






and2 #(2)  d0_0 (
.in0(din0[1:0]),
.in1(din1[1:0]),
.out(dout[1:0])
);









endmodule





//
//   invert macro
//
//





module sii_ipcc_dpinv_macro__stack_72r__width_72 (
  din, 
  dout);
  input [71:0] din;
  output [71:0] dout;






inv #(72)  d0_0 (
.in(din[71:0]),
.out(dout[71:0])
);









endmodule









// any PARAMS parms go into naming of macro

module sii_ipcc_dpmsffi_macro__stack_72c__width_72 (
  din, 
  clk, 
  en, 
  se, 
  scan_in, 
  siclk, 
  soclk, 
  pce_ov, 
  stop, 
  dout_l, 
  scan_out);
wire l1clk;
wire siclk_out;
wire soclk_out;
wire [70:0] so;

  input [71:0] din;


  input clk;
  input en;
  input se;
  input scan_in;
  input siclk;
  input soclk;
  input pce_ov;
  input stop;



  output [71:0] dout_l;


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
msffi_dp #(72)  d0_0 (
.l1clk(l1clk),
.siclk(siclk_out),
.soclk(soclk_out),
.d(din[71:0]),
.si({scan_in,so[70:0]}),
.so({so[70:0],scan_out}),
.q_l(dout_l[71:0])
);



















endmodule









//
//   buff macro
//
//





module sii_ipcc_dpbuff_macro__minbuff_1__width_8 (
  din, 
  dout);
  input [7:0] din;
  output [7:0] dout;






buff #(8)  d0_0 (
.in(din[7:0]),
.out(dout[7:0])
);








endmodule





//
//   buff macro
//
//





module sii_ipcc_dpbuff_macro__minbuff_1__width_64 (
  din, 
  dout);
  input [63:0] din;
  output [63:0] dout;






buff #(64)  d0_0 (
.in(din[63:0]),
.out(dout[63:0])
);








endmodule





//
//   invert macro
//
//





module sii_ipcc_dpinv_macro__left_0__stack_4r__width_4 (
  din, 
  dout);
  input [3:0] din;
  output [3:0] dout;






inv #(4)  d0_0 (
.in(din[3:0]),
.out(dout[3:0])
);









endmodule





//
//   nor macro for ports = 2,3
//
//





module sii_ipcc_dpnor_macro__left_0__ports_3__stack_2r__width_1 (
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
//   and macro for ports = 2,3,4
//
//





module sii_ipcc_dpand_macro__left_0__ports_2__stack_4r__width_1 (
  din0, 
  din1, 
  dout);
  input [0:0] din0;
  input [0:0] din1;
  output [0:0] dout;






and2 #(1)  d0_0 (
.in0(din0[0:0]),
.in1(din1[0:0]),
.out(dout[0:0])
);









endmodule





//  
//   and macro for ports = 2,3,4
//
//





module sii_ipcc_dpand_macro__left_0__ports_3__stack_4r__width_1 (
  din0, 
  din1, 
  din2, 
  dout);
  input [0:0] din0;
  input [0:0] din1;
  input [0:0] din2;
  output [0:0] dout;






and3 #(1)  d0_0 (
.in0(din0[0:0]),
.in1(din1[0:0]),
.in2(din2[0:0]),
.out(dout[0:0])
);









endmodule





//  
//   and macro for ports = 2,3,4
//
//





module sii_ipcc_dpand_macro__left_0__ports_4__stack_4r__width_1 (
  din0, 
  din1, 
  din2, 
  din3, 
  dout);
  input [0:0] din0;
  input [0:0] din1;
  input [0:0] din2;
  input [0:0] din3;
  output [0:0] dout;






and4 #(1)  d0_0 (
.in0(din0[0:0]),
.in1(din1[0:0]),
.in2(din2[0:0]),
.in3(din3[0:0]),
.out(dout[0:0])
);









endmodule





// general mux macro for pass-gate and and-or muxes with/wout priority encoders
// also for pass-gate with decoder





// any PARAMS parms go into naming of macro

module sii_ipcc_dpmux_macro__mux_pgnpe__ports_5__stack_72c__width_72 (
  din0, 
  sel0, 
  din1, 
  sel1, 
  din2, 
  sel2, 
  din3, 
  sel3, 
  din4, 
  sel4, 
  muxtst, 
  dout);
wire buffout0;
wire buffout1;
wire buffout2;
wire buffout3;
wire buffout4;

  input [71:0] din0;
  input sel0;
  input [71:0] din1;
  input sel1;
  input [71:0] din2;
  input sel2;
  input [71:0] din3;
  input sel3;
  input [71:0] din4;
  input sel4;
  input muxtst;
  output [71:0] dout;





cl_dp1_muxbuff5_8x  c0_0 (
 .in0(sel0),
 .in1(sel1),
 .in2(sel2),
 .in3(sel3),
 .in4(sel4),
 .out0(buffout0),
 .out1(buffout1),
 .out2(buffout2),
 .out3(buffout3),
 .out4(buffout4)
);
mux5 #(72)  d0_0 (
  .sel0(buffout0),
  .sel1(buffout1),
  .sel2(buffout2),
  .sel3(buffout3),
  .sel4(buffout4),
  .in0(din0[71:0]),
  .in1(din1[71:0]),
  .in2(din2[71:0]),
  .in3(din3[71:0]),
  .in4(din4[71:0]),
.dout(dout[71:0]),
  .muxtst(muxtst)
);









  



endmodule






// any PARAMS parms go into naming of macro

module sii_ipcc_dpmsff_macro__stack_64c__width_64 (
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
wire [62:0] so;

  input [63:0] din;


  input clk;
  input en;
  input se;
  input scan_in;
  input siclk;
  input soclk;
  input pce_ov;
  input stop;



  output [63:0] dout;


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
dff #(64)  d0_0 (
.l1clk(l1clk),
.siclk(siclk_out),
.soclk(soclk_out),
.d(din[63:0]),
.si({scan_in,so[62:0]}),
.so({so[62:0],scan_out}),
.q(dout[63:0])
);




















endmodule









// general mux macro for pass-gate and and-or muxes with/wout priority encoders
// also for pass-gate with decoder





// any PARAMS parms go into naming of macro

module sii_ipcc_dpmux_macro__mux_pgdec__ports_8__stack_64c__width_64 (
  din0, 
  din1, 
  din2, 
  din3, 
  din4, 
  din5, 
  din6, 
  din7, 
  sel, 
  muxtst, 
  test, 
  dout);
wire psel0;
wire psel1;
wire psel2;
wire psel3;
wire psel4;
wire psel5;
wire psel6;
wire psel7;

  input [63:0] din0;
  input [63:0] din1;
  input [63:0] din2;
  input [63:0] din3;
  input [63:0] din4;
  input [63:0] din5;
  input [63:0] din6;
  input [63:0] din7;
  input [2:0] sel;
  input muxtst;
  input test;
  output [63:0] dout;





cl_dp1_pdec8_8x  c0_0 (
 .sel0(sel[0]),
 .sel1(sel[1]),
 .sel2(sel[2]),
 .psel0(psel0),
 .psel1(psel1),
 .psel2(psel2),
 .psel3(psel3),
 .psel4(psel4),
 .psel5(psel5),
 .psel6(psel6),
 .psel7(psel7),
  .test(test)
);

mux8 #(64)  d0_0 (
  .sel0(psel0),
  .sel1(psel1),
  .sel2(psel2),
  .sel3(psel3),
  .sel4(psel4),
  .sel5(psel5),
  .sel6(psel6),
  .sel7(psel7),
  .in0(din0[63:0]),
  .in1(din1[63:0]),
  .in2(din2[63:0]),
  .in3(din3[63:0]),
  .in4(din4[63:0]),
  .in5(din5[63:0]),
  .in6(din6[63:0]),
  .in7(din7[63:0]),
.dout(dout[63:0]),
  .muxtst(muxtst)
);









  



endmodule






// any PARAMS parms go into naming of macro

module sii_ipcc_dpmsff_macro__stack_14c__width_14 (
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
wire [12:0] so;

  input [13:0] din;


  input clk;
  input en;
  input se;
  input scan_in;
  input siclk;
  input soclk;
  input pce_ov;
  input stop;



  output [13:0] dout;


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
dff #(14)  d0_0 (
.l1clk(l1clk),
.siclk(siclk_out),
.soclk(soclk_out),
.d(din[13:0]),
.si({scan_in,so[12:0]}),
.so({so[12:0],scan_out}),
.q(dout[13:0])
);




















endmodule













// any PARAMS parms go into naming of macro

module sii_ipcc_dpmsff_macro__stack_8c__width_8 (
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
wire [6:0] so;

  input [7:0] din;


  input clk;
  input en;
  input se;
  input scan_in;
  input siclk;
  input soclk;
  input pce_ov;
  input stop;



  output [7:0] dout;


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
dff #(8)  d0_0 (
.l1clk(l1clk),
.siclk(siclk_out),
.soclk(soclk_out),
.d(din[7:0]),
.si({scan_in,so[6:0]}),
.so({so[6:0],scan_out}),
.q(dout[7:0])
);




















endmodule









//
//   buff macro
//
//





module sii_ipcc_dpbuff_macro__minbuff_1__stack_8r__width_8 (
  din, 
  dout);
  input [7:0] din;
  output [7:0] dout;






buff #(8)  d0_0 (
.in(din[7:0]),
.out(dout[7:0])
);








endmodule





// general mux macro for pass-gate and and-or muxes with/wout priority encoders
// also for pass-gate with decoder





// any PARAMS parms go into naming of macro

module sii_ipcc_dpmux_macro__mux_pgpe__ports_2__stack_14c__width_14 (
  din0, 
  din1, 
  sel0, 
  dout);
wire psel0_unused;
wire psel1;

  input [13:0] din0;
  input [13:0] din1;
  input sel0;
  output [13:0] dout;





cl_dp1_penc2_8x  c0_0 (
 .sel0(sel0),
 .psel0(psel0_unused),
 .psel1(psel1)
);

mux2e #(14)  d0_0 (
  .sel(psel1),
  .in0(din0[13:0]),
  .in1(din1[13:0]),
.dout(dout[13:0])
);









  



endmodule


//
//   xor macro for ports = 2,3
//
//





module sii_ipcc_dpxor_macro__ports_2__stack_4r__width_4 (
  din0, 
  din1, 
  dout);
  input [3:0] din0;
  input [3:0] din1;
  output [3:0] dout;





xor2 #(4)  d0_0 (
.in0(din0[3:0]),
.in1(din1[3:0]),
.out(dout[3:0])
);








endmodule





//
//   xor macro for ports = 2,3
//
//





module sii_ipcc_dpxor_macro__ports_2__stack_10r__width_9 (
  din0, 
  din1, 
  dout);
  input [8:0] din0;
  input [8:0] din1;
  output [8:0] dout;





xor2 #(9)  d0_0 (
.in0(din0[8:0]),
.in1(din1[8:0]),
.out(dout[8:0])
);








endmodule





//
//   xor macro for ports = 2,3
//
//





module sii_ipcc_dpxor_macro__ports_2__stack_2r__width_2 (
  din0, 
  din1, 
  dout);
  input [1:0] din0;
  input [1:0] din1;
  output [1:0] dout;





xor2 #(2)  d0_0 (
.in0(din0[1:0]),
.in1(din1[1:0]),
.out(dout[1:0])
);








endmodule





//
//   xor macro for ports = 2,3
//
//





module sii_ipcc_dpxor_macro__ports_3__stack_2r__width_1 (
  din0, 
  din1, 
  din2, 
  dout);
  input [0:0] din0;
  input [0:0] din1;
  input [0:0] din2;
  output [0:0] dout;





xor3 #(1)  d0_0 (
.in0(din0[0:0]),
.in1(din1[0:0]),
.in2(din2[0:0]),
.out(dout[0:0])
);








endmodule





//
//   xor macro for ports = 2,3
//
//





module sii_ipcc_dpxor_macro__ports_2__stack_8r__width_7 (
  din0, 
  din1, 
  dout);
  input [6:0] din0;
  input [6:0] din1;
  output [6:0] dout;





xor2 #(7)  d0_0 (
.in0(din0[6:0]),
.in1(din1[6:0]),
.out(dout[6:0])
);








endmodule





//
//   xor macro for ports = 2,3
//
//





module sii_ipcc_dpxor_macro__ports_2__stack_2r__width_1 (
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





module sii_ipcc_dpxor_macro__ports_2__stack_4r__width_3 (
  din0, 
  din1, 
  dout);
  input [2:0] din0;
  input [2:0] din1;
  output [2:0] dout;





xor2 #(3)  d0_0 (
.in0(din0[2:0]),
.in1(din1[2:0]),
.out(dout[2:0])
);








endmodule





//
//   xor macro for ports = 2,3
//
//





module sii_ipcc_dpxor_macro__ports_2__stack_8r__width_4 (
  din0, 
  din1, 
  dout);
  input [3:0] din0;
  input [3:0] din1;
  output [3:0] dout;





xor2 #(4)  d0_0 (
.in0(din0[3:0]),
.in1(din1[3:0]),
.out(dout[3:0])
);








endmodule





//
//   xor macro for ports = 2,3
//
//





module sii_ipcc_dpxor_macro__ports_2__stack_4r__width_2 (
  din0, 
  din1, 
  dout);
  input [1:0] din0;
  input [1:0] din1;
  output [1:0] dout;





xor2 #(2)  d0_0 (
.in0(din0[1:0]),
.in1(din1[1:0]),
.out(dout[1:0])
);








endmodule





// general mux macro for pass-gate and and-or muxes with/wout priority encoders
// also for pass-gate with decoder





// any PARAMS parms go into naming of macro

module sii_ipcc_dpmux_macro__mux_pgdec__ports_8__stack_14c__width_14 (
  din0, 
  din1, 
  din2, 
  din3, 
  din4, 
  din5, 
  din6, 
  din7, 
  sel, 
  muxtst, 
  test, 
  dout);
wire psel0;
wire psel1;
wire psel2;
wire psel3;
wire psel4;
wire psel5;
wire psel6;
wire psel7;

  input [13:0] din0;
  input [13:0] din1;
  input [13:0] din2;
  input [13:0] din3;
  input [13:0] din4;
  input [13:0] din5;
  input [13:0] din6;
  input [13:0] din7;
  input [2:0] sel;
  input muxtst;
  input test;
  output [13:0] dout;





cl_dp1_pdec8_8x  c0_0 (
 .sel0(sel[0]),
 .sel1(sel[1]),
 .sel2(sel[2]),
 .psel0(psel0),
 .psel1(psel1),
 .psel2(psel2),
 .psel3(psel3),
 .psel4(psel4),
 .psel5(psel5),
 .psel6(psel6),
 .psel7(psel7),
  .test(test)
);

mux8 #(14)  d0_0 (
  .sel0(psel0),
  .sel1(psel1),
  .sel2(psel2),
  .sel3(psel3),
  .sel4(psel4),
  .sel5(psel5),
  .sel6(psel6),
  .sel7(psel7),
  .in0(din0[13:0]),
  .in1(din1[13:0]),
  .in2(din2[13:0]),
  .in3(din3[13:0]),
  .in4(din4[13:0]),
  .in5(din5[13:0]),
  .in6(din6[13:0]),
  .in7(din7[13:0]),
.dout(dout[13:0]),
  .muxtst(muxtst)
);









  



endmodule






// any PARAMS parms go into naming of macro

module sii_ipcc_dpmsff_macro__stack_18c__width_18 (
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
wire [16:0] so;

  input [17:0] din;


  input clk;
  input en;
  input se;
  input scan_in;
  input siclk;
  input soclk;
  input pce_ov;
  input stop;



  output [17:0] dout;


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
dff #(18)  d0_0 (
.l1clk(l1clk),
.siclk(siclk_out),
.soclk(soclk_out),
.d(din[17:0]),
.si({scan_in,so[16:0]}),
.so({so[16:0],scan_out}),
.q(dout[17:0])
);




















endmodule









// general mux macro for pass-gate and and-or muxes with/wout priority encoders
// also for pass-gate with decoder





// any PARAMS parms go into naming of macro

module sii_ipcc_dpmux_macro__mux_pgdec__ports_4__stack_18c__width_18 (
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

  input [17:0] din0;
  input [17:0] din1;
  input [17:0] din2;
  input [17:0] din3;
  input [1:0] sel;
  input muxtst;
  input test;
  output [17:0] dout;





cl_dp1_pdec4_8x  c0_0 (
 .sel0(sel[0]),
 .sel1(sel[1]),
 .psel0(psel0),
 .psel1(psel1),
 .psel2(psel2),
 .psel3(psel3),
  .test(test)
);

mux4 #(18)  d0_0 (
  .sel0(psel0),
  .sel1(psel1),
  .sel2(psel2),
  .sel3(psel3),
  .in0(din0[17:0]),
  .in1(din1[17:0]),
  .in2(din2[17:0]),
  .in3(din3[17:0]),
.dout(dout[17:0]),
  .muxtst(muxtst)
);









  



endmodule

