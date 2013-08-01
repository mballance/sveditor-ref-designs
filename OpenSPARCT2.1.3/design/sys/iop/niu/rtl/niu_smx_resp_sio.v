// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: niu_smx_resp_sio.v
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

module niu_smx_resp_sio(
/*AUTOARG*/
   // Outputs
   resp_cmdff_wr, resp_cmdff_wdata, resp_dataff_wr, 
   resp_dataff_wdata, niu_ncu_ctag_ue, niu_ncu_ctag_ce, niu_ncu_d_pe, 
   // Inputs
   clk, reset_l, sio_niu_hdr_vld, sio_niu_datareq, sio_niu_data, 
   sio_niu_parity, resp_cmdff_full, resp_dataff_full, 
   ncu_niu_ctag_uei, ncu_niu_ctag_cei, ncu_niu_d_pei, reg_ras_cfg
   );

input 		clk;
input		reset_l;

// sio if
input          sio_niu_hdr_vld;
input          sio_niu_datareq;
input [127:0]  sio_niu_data;
input [7:0]    sio_niu_parity;

// output         niu_sio_dq; // this one comes from niu_smx_resp_dmc

// resp_cmdff if
output 		resp_cmdff_wr;
output [21:0] 	resp_cmdff_wdata;
input 		resp_cmdff_full; // not use??

// resp_dataff if
output 		resp_dataff_wr;
output [143:0] 	resp_dataff_wdata;
input 		resp_dataff_full; // not use??

// ncu ras if
input           ncu_niu_ctag_uei;
input           ncu_niu_ctag_cei;
input           ncu_niu_d_pei;

output          niu_ncu_ctag_ue;
output          niu_ncu_ctag_ce;
output          niu_ncu_d_pe;

// pio if
input [1:0]	reg_ras_cfg; // [0] - disable(0)/enable(1) ras detect
			     // [1] - disable(0)/enable(1) ras inject 	


// xtb if -> this one in niu_smx_resp_dmc?

// just read and put in ff

	// register in
reg [127:0] sio_niu_data_r1;
reg [7:0] sio_niu_parity_r1;
reg [127:0] sio_niu_data_r2;
reg [7:0] sio_niu_parity_r2;
reg [127:0] sio_niu_data_r;
reg [7:0] sio_niu_parity_r;
reg sio_niu_hdr_vld_r1;
reg sio_niu_datareq_r1;
reg sio_niu_hdr_vld_r2;
reg sio_niu_datareq_r2;
reg sio_niu_hdr_vld_r;
reg sio_niu_datareq_r;
reg ncu_niu_ctag_uei_r;
reg ncu_niu_ctag_cei_r;
// reg  ncu_niu_d_pei_r;

reg [3:0] datawr_shift_r2; // one cycle after hdr
reg [3:0] datawr_shift; // one cycle after hdr

reg [127:0] hdr_data_r;
reg  	    hdr_datareq_r;
reg         hdr_err_r;

reg niu_ncu_data_parity;
reg niu_ncu_ctag_ue;
reg niu_ncu_ctag_ce;

wire niu_ncu_d_pe= niu_ncu_data_parity;

wire err_inject_enable= reg_ras_cfg[1];

wire [15:0] tid_r1= sio_niu_data_r1[`SMX_SICMD_POS_ID];
wire tid_r1_0= (err_inject_enable & (ncu_niu_ctag_cei_r | ncu_niu_ctag_uei_r))? 
				~tid_r1[0] : tid_r1[0];
wire tid_r1_1= (err_inject_enable & ncu_niu_ctag_uei_r)? ~tid_r1[1] : tid_r1[1];
wire [5:0] tidecc_checkbit= sio_niu_data_r1[`SMX_SICMD_POS_ID_ECC];
wire [5:0] genpar_checkbit;
wire 	genpar_cor_p5;

niu_smx_ecc16_genpar ecc_genpar(
		.data	({tid_r1[15:2],tid_r1_1, tid_r1_0}),
		.chkbit (tidecc_checkbit[4:0]),
		.parity	(genpar_checkbit[5:0]),
		.cor_parity_5 (genpar_cor_p5)
	);

reg [5:0] tidecc_syn_r2;

// cc 061405 flipped order of bits
wire [5:0] tidecc_syn_n= {  // e=p^c  in ras
                        genpar_cor_p5 ^ tidecc_checkbit[5],
                        genpar_checkbit[4] ^ tidecc_checkbit[4],
                        genpar_checkbit[3] ^ tidecc_checkbit[3],
                        genpar_checkbit[2] ^ tidecc_checkbit[2],
                        genpar_checkbit[1] ^ tidecc_checkbit[1],
                        genpar_checkbit[0] ^ tidecc_checkbit[0]
			};

reg [15:0] ecc_corr_tid_r;
// reg ecc_ok_r;
// reg ecc_corr_r;
reg ecc_uncorr_r;
wire [15:0] ecc_corr_tid_n;
wire ecc_ok_n;
wire ecc_corr_n;
wire ecc_uncorr_n;

wire [15:0] tid_r2= sio_niu_data_r2[`SMX_SICMD_POS_ID];
wire tid_r2_0= (err_inject_enable & (ncu_niu_ctag_cei_r | ncu_niu_ctag_uei_r))? 
				~tid_r2[0] : tid_r2[0];
wire tid_r2_1= (err_inject_enable & ncu_niu_ctag_uei_r)? ~tid_r2[1] : tid_r2[1];

wire err_detect_enable= reg_ras_cfg[0]; 

niu_smx_ecc16_corr ecc_corr(
		.enable		(err_detect_enable),
		.data		({tid_r2[15:2],tid_r2_1, tid_r2_0}),
		.syn		(tidecc_syn_r2[5:0]),
		.corr_data 	(ecc_corr_tid_n[15:0]),	
		.good		(ecc_ok_n),
		.corr_error 	(ecc_corr_n),
		.uncorr_error 	(ecc_uncorr_n)
		);

wire [7:0] sio_niu_parity_n; // parity to go into dataff

	  // parity of incoming data for cmp purpose
reg [7:0] gen_data_parity_r2;
wire [7:0] gen_data_parity_n; 

wire data_r1_0= (err_inject_enable & ncu_niu_d_pei)? ~sio_niu_data_r1[0] : sio_niu_data_r1[0];
niu_smx_gen_siudp gen_siudp(	// gen parity per N2 ras   
		.data	({sio_niu_data_r1 [127:1], data_r1_0}),
		.parity (gen_data_parity_n [7:0])
	);

wire data_parity_err_n= |(sio_niu_parity_r2^gen_data_parity_r2);
reg  dp_err_r;
wire dp_err_n= dp_err_r | (data_parity_err_n & 
	      (|datawr_shift_r2)); // sample at data wr cycle

always @(posedge clk) begin
  if(!reset_l) begin
    dp_err_r<= `SMX_PD 1'b0;
    niu_ncu_data_parity<= `SMX_PD 1'b0;
  end
  else begin
    if(sio_niu_hdr_vld_r2) // reset at hdr
      dp_err_r<= `SMX_PD 1'b0;
    else 
      dp_err_r<= `SMX_PD  dp_err_n;
		// strobe
    if(datawr_shift_r2 == 4'b0001) 
      niu_ncu_data_parity<= `SMX_PD dp_err_n;
    else
      niu_ncu_data_parity<= `SMX_PD 1'b0;
  end
end

always @(posedge clk) begin
  if(!reset_l) 
    datawr_shift_r2<= `SMX_PD  4'h0;
  else begin
    if(sio_niu_datareq_r2 & sio_niu_hdr_vld_r2) // qualify with hdrvld
      datawr_shift_r2<= `SMX_PD  4'hf; // ld 4cy write
    else
      datawr_shift_r2<= `SMX_PD  (datawr_shift_r2>>1);
  end
end


always @(posedge clk) begin
  sio_niu_data_r1<= `SMX_PD  sio_niu_data;
  sio_niu_parity_r1<= `SMX_PD  sio_niu_parity;
		// gen ecc check bits

  sio_niu_data_r2<= `SMX_PD  sio_niu_data_r1;
  sio_niu_parity_r2<= `SMX_PD  sio_niu_parity_r1;
  gen_data_parity_r2<= `SMX_PD  gen_data_parity_n;
  tidecc_syn_r2<= `SMX_PD  tidecc_syn_n;
		// calc syndrome
		// syn= p^c (p=regen, c=siu's)

  sio_niu_data_r<= `SMX_PD  sio_niu_data_r2;
  sio_niu_parity_r<= `SMX_PD  sio_niu_parity_n; 
		// new generated parity to store in dataff
		// gen parity on lend_convered sio_niu_data_r2 

		// flop in hdr data 
		// keep until next hdr cycle 
  if(sio_niu_hdr_vld_r2) begin
    ecc_corr_tid_r<= `SMX_PD ecc_corr_tid_n; // corrected TID
    hdr_data_r<= `SMX_PD  sio_niu_data_r2;
    hdr_datareq_r<= `SMX_PD  sio_niu_datareq_r2;
  end
end

always @(posedge clk) begin
  if(!reset_l) begin
//    ecc_ok_r<= `SMX_PD 1'b0;
//    ecc_corr_r<= `SMX_PD 1'b0;
    ecc_uncorr_r<= `SMX_PD 1'b0;
    hdr_err_r<= 1'b0;
    niu_ncu_ctag_ue<= `SMX_PD 1'b0;
    niu_ncu_ctag_ce<= `SMX_PD 1'b0;
  end
  else begin
		// TID ecc status, siu_hdr_ueORde flop in	
		// remain until next hdr cycle 
    if(sio_niu_hdr_vld_r2) begin 
//      ecc_ok_r<= `SMX_PD ecc_ok_n;	
//      ecc_corr_r<= `SMX_PD ecc_corr_n;

      ecc_uncorr_r<= `SMX_PD ecc_uncorr_n;  
      hdr_err_r<= `SMX_PD |sio_niu_data_r2[`SMX_SICMD_POS_HERR];
    end
		// strobe
    if(sio_niu_hdr_vld_r2) begin
      niu_ncu_ctag_ue<= `SMX_PD ecc_uncorr_n & !(sio_niu_data_r2[81] | sio_niu_data_r2[80]); // cc 052005 ecc_corr_n;
                                                                    // cc 061305 no ecc_uncorr if SIO already reporting
      niu_ncu_ctag_ce<= `SMX_PD ecc_corr_n;   // cc 052005 ecc_uncorr_n;
    end
    else begin
      niu_ncu_ctag_ue<= `SMX_PD 1'b0;
      niu_ncu_ctag_ce<= `SMX_PD 1'b0;
    end
  end
end

always @(posedge clk) begin
  if(!reset_l) begin
    sio_niu_hdr_vld_r1<= `SMX_PD  1'b0;
    sio_niu_datareq_r1<= `SMX_PD  1'b0;
    sio_niu_hdr_vld_r2<= `SMX_PD  1'b0;
    sio_niu_datareq_r2<= `SMX_PD  1'b0;
    sio_niu_hdr_vld_r<= `SMX_PD  1'b0;
    sio_niu_datareq_r<= `SMX_PD  1'b0;
    ncu_niu_ctag_uei_r<= `SMX_PD 1'b0;
    ncu_niu_ctag_cei_r<= `SMX_PD 1'b0;
//    ncu_niu_d_pei_r<= `SMX_PD 1'b0;
  end 
  else begin
    sio_niu_hdr_vld_r1<= `SMX_PD  sio_niu_hdr_vld;
    sio_niu_datareq_r1<= `SMX_PD  sio_niu_datareq;
    sio_niu_hdr_vld_r2<= `SMX_PD  sio_niu_hdr_vld_r1;
    sio_niu_datareq_r2<= `SMX_PD  sio_niu_datareq_r1;
    sio_niu_hdr_vld_r<= `SMX_PD  sio_niu_hdr_vld_r2;
    sio_niu_datareq_r<= `SMX_PD  sio_niu_datareq_r2;
    ncu_niu_ctag_uei_r<= `SMX_PD ncu_niu_ctag_uei;
    ncu_niu_ctag_cei_r<= `SMX_PD ncu_niu_ctag_cei;
//    ncu_niu_d_pei_r<= `SMX_PD ncu_niu_d_pei;
  end 
end

always @(posedge clk) begin
  if(!reset_l) 
    datawr_shift<= `SMX_PD  4'h0;
  else begin
    if(sio_niu_datareq_r & sio_niu_hdr_vld_r) // qualify with hdrvld
      datawr_shift<= `SMX_PD  4'hf; // ld 4cy write
    else
      datawr_shift<= `SMX_PD  (datawr_shift>>1);
  end
end

reg resp_cmdff_wr;
wire resp_cmdff_wr_n= (sio_niu_hdr_vld_r2 & ~sio_niu_datareq_r2) | // no data cycle
			(datawr_shift_r2==4'b0001); // last data line	      
		 
	// resp cmdff wr
always @(posedge clk) begin
  if(!reset_l) resp_cmdff_wr<= `SMX_PD 1'b0;
  else  resp_cmdff_wr<=  `SMX_PD resp_cmdff_wr_n;
end


wire [21:0] resp_cmdff_wdata= {  // hdr cycle
			hdr_datareq_r, // in case rd w/o data (err case)
			hdr_data_r[`SMX_SICMD_POS_RESP],
			hdr_data_r[`SMX_SICMD_POS_RD],
//			sio_niu_data_r[`SMX_SICMD_POS_ERR],
			2'h0, ((ecc_uncorr_r | hdr_err_r | dp_err_r) & err_detect_enable),
			ecc_corr_tid_r
			};


// gen parity for dataff at r2 stage;
// use little endian to gen sio_niu_parity_r

			// big endian -> little endian
wire [127:0] lend_data_r2_n= { 	sio_niu_data_r2[`SMX_BE_B15],
				sio_niu_data_r2[`SMX_BE_B14],
				sio_niu_data_r2[`SMX_BE_B13],
				sio_niu_data_r2[`SMX_BE_B12],
				sio_niu_data_r2[`SMX_BE_B11],
				sio_niu_data_r2[`SMX_BE_B10],
				sio_niu_data_r2[`SMX_BE_B9],
				sio_niu_data_r2[`SMX_BE_B8],
				sio_niu_data_r2[`SMX_BE_B7],
				sio_niu_data_r2[`SMX_BE_B6],
				sio_niu_data_r2[`SMX_BE_B5],
				sio_niu_data_r2[`SMX_BE_B4],
				sio_niu_data_r2[`SMX_BE_B3],
				sio_niu_data_r2[`SMX_BE_B2],
				sio_niu_data_r2[`SMX_BE_B1],
				sio_niu_data_r2[`SMX_BE_B0]
			  	};

niu_smx_gen_siudp genpar(
	.data	(lend_data_r2_n [127 :0]),
	.parity (sio_niu_parity_n[7:0])
	);


	// resp dataff wr
wire resp_dataff_wr= datawr_shift[0];


			// big endian -> little endian
wire [127:0] lend_data_n= { 	sio_niu_data_r[`SMX_BE_B15],
				sio_niu_data_r[`SMX_BE_B14],
				sio_niu_data_r[`SMX_BE_B13],
				sio_niu_data_r[`SMX_BE_B12],
				sio_niu_data_r[`SMX_BE_B11],
				sio_niu_data_r[`SMX_BE_B10],
				sio_niu_data_r[`SMX_BE_B9],
				sio_niu_data_r[`SMX_BE_B8],
				sio_niu_data_r[`SMX_BE_B7],
				sio_niu_data_r[`SMX_BE_B6],
				sio_niu_data_r[`SMX_BE_B5],
				sio_niu_data_r[`SMX_BE_B4],
				sio_niu_data_r[`SMX_BE_B3],
				sio_niu_data_r[`SMX_BE_B2],
				sio_niu_data_r[`SMX_BE_B1],
				sio_niu_data_r[`SMX_BE_B0]
			  	};
// wire resp_dataff_err= dp_err_r;   
wire [143:0] resp_dataff_wdata= {8'h0, sio_niu_parity_r, lend_data_n};
  
endmodule

