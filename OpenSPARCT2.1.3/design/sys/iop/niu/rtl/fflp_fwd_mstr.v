// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: fflp_fwd_mstr.v
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
/**********************************************************************/
/*project name:  NIU                                                  */
/*module name:   fflp_fwd_mstr                                        */
/*description:   FFLP forward decisions                               */
/*                                                                    */
/*author name:       Jeanne Cai                                       */
/*date created:      16-03-2004                                       */
/*                                                                    */
/*              Copyright (c) 2004, Sun Microsystems, Inc.            */
/*                   Sun Proprietary and Confidential                 */
/*                                                                    */
/*modifications:                                                      */
/*                                                                    */
/**********************************************************************/ 

module fflp_fwd_mstr
		(
		cclk,
		reset,
		fc_fifo_ren_sync,
		disable_chksum,
		ext_fc_valid,
		fwd_info_bus_2,
		key_ecc_data_2,
		kick_off_ram_srch_5,
		matchout_5,
		cam_haddr_reg1_dout,
		am_din_reg_dout,
		hash_v1,
		hash_v2,

		ecc_parity_status,
		fc_fifo_space_avail,
		fc_fifo_empty,
		fc_fifo_dout
		);


input		cclk;
input		reset;
input		fc_fifo_ren_sync;
input		disable_chksum;
input[7:0]	ext_fc_valid;
input[445:0]	fwd_info_bus_2;
input[103:0]	key_ecc_data_2;
input		kick_off_ram_srch_5;
input		matchout_5;
input[9:0]	cam_haddr_reg1_dout;
input[41:0]	am_din_reg_dout;
input[19:0]	hash_v1;
input[15:0]	hash_v2;

output[25:0]	ecc_parity_status;
output		fc_fifo_space_avail;
output		fc_fifo_empty;
output[512:0]	fc_fifo_dout;

reg		ext_valid;

wire		cam_match_r;
wire		drop_pkt_r;
wire[1:0]	valid_tres_r;
wire		valid_zcopy_r;
wire[2:0]	rdc_table_num_r;
wire[4:0]	rdc_table_offset_r;
wire		fc_lookup_r;
wire		err_all_r;
wire[9:0]	valid_cam_haddr_r;

wire		kick_off_ram_srch_6;

wire[361:0]	fwd_bus_flow_key;		
wire[83:0]	fwd_bus_fwd_info;
wire[2:0]	fwd_bus_l2_rdc_num;
wire		fwd_bus_class_action_tsel;
wire		fwd_bus_class_action_disc;
wire[1:0]	fwd_bus_ether_type;
wire[4:0]	fwd_bus_class;
wire		fwd_bus_vlan_parity_err;

wire[25:0]	am_din_reg_dout_tmp;
wire[129:0]	key_assoc_ecc_data;
wire		assoc_zcopy_valid;
wire[4:0]	assoc_offset;
wire[2:0]	assoc_rdc_num;
wire[1:0]	assoc_tres;
wire		assoc_discard;
wire		assoc_ecc_check;
wire[11:0]	assoc_zcopy_id;
wire[3:0]	assoc_parity_bits;
wire[15:0]	assoc_ecc_syndrome;

wire		cam_match;
wire		cam_match_valid;
wire		drop_pkt;
wire[1:0]	valid_tres;
wire		valid_zcopy;
wire[2:0]	rdc_table_num;
wire[4:0]	rdc_table_offset;
wire[9:0]	valid_cam_haddr;
wire		l2_class;
wire		fc_lookup;
wire[114:0]	new_bus;

wire[64:0]      key_assoc_ecc_data1;
wire[64:0]      key_assoc_ecc_data2;
wire[7:0]       assoc_ecc_syndrome1;
wire[7:0]       assoc_ecc_syndrome2;
wire[72:0]	ecc_check_din1;
wire[72:0]	ecc_check_din2;

wire[72:0]	ecc_check_dout1;
wire		ecc_check_no_err1;
wire		ecc_check_err1;
wire		ecc_check_corr_err1;
wire		ecc_check_uncorr_err1;

wire[72:0]	ecc_check_dout2;
wire		ecc_check_no_err2;
wire		ecc_check_err2;
wire		ecc_check_corr_err2;
wire		ecc_check_uncorr_err2;

wire[3:0]	am_parity_bits;
wire		parity_err;

wire		do_ecc_check;
wire		ecc_check_err;
//wire		am_parity_err;
wire		ecc_parity_err;
wire		ecc_parity_err_r;
wire		ecc_parity_err_p;
wire		err_all;
wire		ecc_check_err1_r;
wire		ecc_check_err2_r;
wire		parity_err_r;
wire[7:0]	ecc_syndrome1;
wire[7:0]	ecc_syndrome2;
wire[25:0]	ecc_parity_status;

wire[512:0]	fc_fifo_din;
wire		fc_fifo_wen;
wire		fc_fifo_rd_sync_r;
wire		fc_fifo_ren;
wire[512:0]	fc_fifo_dout;
wire		fc_fifo_full;
wire		fc_fifo_empty;	

wire		fc_fifo_space_avail;
wire[2:0]	fc_fifo_cnt_in;
wire		fc_fifo_cnt_en;
wire[2:0]	fc_fifo_cnt;

assign fwd_bus_flow_key		= fwd_info_bus_2[361:0]; 
assign fwd_bus_fwd_info		= fwd_info_bus_2[445:362];

assign fwd_bus_l2_rdc_num	= fwd_bus_fwd_info[2:0];
assign fwd_bus_class_action_tsel= fwd_bus_fwd_info[3];
assign fwd_bus_class_action_disc= fwd_bus_fwd_info[4];
assign fwd_bus_ether_type	= fwd_bus_fwd_info[6:5];
assign fwd_bus_class		= fwd_bus_fwd_info[17:13];
assign fwd_bus_vlan_parity_err	= fwd_bus_fwd_info[83];

assign am_din_reg_dout_tmp      = {am_din_reg_dout[25:1], 1'b0};
assign key_assoc_ecc_data	= {am_din_reg_dout_tmp[25:0], key_ecc_data_2[103:0]};

assign assoc_zcopy_valid	= am_din_reg_dout[1];
assign assoc_offset		= am_din_reg_dout[6:2];
assign assoc_rdc_num		= am_din_reg_dout[9:7];
assign assoc_tres		= am_din_reg_dout[11:10];
assign assoc_discard		= am_din_reg_dout[12];
assign assoc_ecc_check		= am_din_reg_dout[13];
assign assoc_zcopy_id		= am_din_reg_dout[25:14];
assign assoc_parity_bits	= am_din_reg_dout[29:26];
assign assoc_ecc_syndrome	= am_din_reg_dout[41:26];

assign cam_match	= !(fwd_bus_class == 5'b0) & fwd_bus_class_action_tsel & !fwd_bus_vlan_parity_err & matchout_5;
assign cam_match_valid	= cam_match_r & !ecc_parity_err;
assign drop_pkt		= cam_match_valid & assoc_discard | fwd_bus_class_action_disc;
assign valid_tres	= cam_match_valid ? assoc_tres : 2'b00;

`ifdef NEPTUNE
assign valid_zcopy	= (valid_tres == 2'b11) & assoc_zcopy_valid;
`else
assign valid_zcopy	= 1'b0;
`endif

assign rdc_table_num	= valid_tres[1] ? assoc_rdc_num : fwd_bus_l2_rdc_num;
assign rdc_table_offset	= valid_tres[0] ? assoc_offset : 5'b0;
assign valid_cam_haddr	= cam_match ? cam_haddr_reg1_dout : 10'b0;

assign l2_class		= (fwd_bus_class[4:2] == 3'b000) | fwd_bus_class[4]; 
assign fc_lookup	= !(valid_tres[0] | l2_class) & ext_valid & !err_all;

always @(rdc_table_num or
	ext_fc_valid)
begin
	case (rdc_table_num)
	// 0in < case -full -parallel -message "0in ERROR: case check in fflp_fwd_mstr:ext_valid_1"
	3'b000:	ext_valid = ext_fc_valid[0];
	3'b001: ext_valid = ext_fc_valid[1];
	3'b010: ext_valid = ext_fc_valid[2];
	3'b011: ext_valid = ext_fc_valid[3];
	3'b100: ext_valid = ext_fc_valid[4];
	3'b101: ext_valid = ext_fc_valid[5];
	3'b110: ext_valid = ext_fc_valid[6];
	3'b111: ext_valid = ext_fc_valid[7];
	default:ext_valid = 1'b0;
	endcase
end

dffr  #(1) kick_off_ram_srch_6_reg(cclk, reset, kick_off_ram_srch_5,      		kick_off_ram_srch_6);
dffre #(1) cam_match_r_reg	  (cclk, reset, kick_off_ram_srch_5, cam_match,		cam_match_r);
dffre #(10) valid_cam_haddr_reg	  (cclk, reset, kick_off_ram_srch_5, valid_cam_haddr,   valid_cam_haddr_r);
dffre #(1) drop_pkt_r_reg	  (cclk, reset, kick_off_ram_srch_6, drop_pkt,		drop_pkt_r);
dffre #(2) valid_tres_r_reg	  (cclk, reset, kick_off_ram_srch_6, valid_tres,	valid_tres_r);
dffre #(1) valid_zcopy_r_reg	  (cclk, reset, kick_off_ram_srch_6, valid_zcopy,	valid_zcopy_r);
dffre #(3) rdc_table_num_r_reg	  (cclk, reset, kick_off_ram_srch_6, rdc_table_num,	rdc_table_num_r);
dffre #(5) rdc_table_offset_r_reg (cclk, reset, kick_off_ram_srch_6, rdc_table_offset,	rdc_table_offset_r);
dffre #(1) fc_lookup_r_reg	  (cclk, reset, kick_off_ram_srch_6, fc_lookup,		fc_lookup_r);
dffre #(1) err_all_r_reg	  (cclk, reset, kick_off_ram_srch_6, err_all,           err_all_r);


/******************************/
//ECC/Parity Error
/******************************/
assign key_assoc_ecc_data1	= key_assoc_ecc_data[64:0];
assign key_assoc_ecc_data2	= key_assoc_ecc_data[129:65];
assign assoc_ecc_syndrome1	= assoc_ecc_syndrome[7:0];
assign assoc_ecc_syndrome2	= assoc_ecc_syndrome[15:8];
assign ecc_check_din1		= {key_assoc_ecc_data1, assoc_ecc_syndrome1};
assign ecc_check_din2		= {key_assoc_ecc_data2, assoc_ecc_syndrome2};

niu_65data_ecc_check	niu_65data_ecc_check_inst1 (
				.din		(ecc_check_din1),
				.dout		(ecc_check_dout1),
				.no_error	(ecc_check_no_err1),
				.error		(ecc_check_err1),
				.corr_error	(ecc_check_corr_err1),
				.uncorr_error	(ecc_check_uncorr_err1)
				);

niu_65data_ecc_check    niu_65data_ecc_check_inst2 (
                                .din            (ecc_check_din2),
                                .dout           (ecc_check_dout2),
                                .no_error       (ecc_check_no_err2),
                                .error          (ecc_check_err2),
                                .corr_error     (ecc_check_corr_err2),
                                .uncorr_error   (ecc_check_uncorr_err2)
                                );


assign am_parity_bits   = {^am_din_reg_dout_tmp[25:24], ^am_din_reg_dout_tmp[23:16],
			   ^am_din_reg_dout_tmp[15:8], ^am_din_reg_dout_tmp[7:0]};
assign parity_err    	= !(am_parity_bits == assoc_parity_bits);

assign do_ecc_check	= assoc_ecc_check & fwd_bus_ether_type[0];
assign ecc_check_err	= (ecc_check_err1_r | ecc_check_err2_r) & cam_match_r & !disable_chksum & do_ecc_check;  
//assign am_parity_err	= parity_err_r & cam_match_r & !disable_chksum & !do_ecc_check;
assign ecc_parity_err	= ((ecc_check_err1_r | ecc_check_err2_r) & do_ecc_check | (parity_err_r & !do_ecc_check)) &
				cam_match_r & !disable_chksum & kick_off_ram_srch_6;

assign ecc_parity_err_p = ecc_parity_err & !ecc_parity_err_r;

assign ecc_parity_status= {ecc_parity_err_p, ecc_check_err, valid_cam_haddr_r[7:0], ecc_syndrome2, ecc_syndrome1};	//26bits

assign err_all		= ecc_parity_err | fwd_bus_vlan_parity_err;

dffre #(1) ecc_check_err1_r_reg	(cclk, reset, kick_off_ram_srch_5, ecc_check_err1,         	ecc_check_err1_r);
dffre #(1) ecc_check_err2_r_reg	(cclk, reset, kick_off_ram_srch_5, ecc_check_err2,         	ecc_check_err2_r);
dffre #(1) parity_err_r_reg	(cclk, reset, kick_off_ram_srch_5, parity_err,             	parity_err_r);
dffre #(8) ecc_syndrome2_reg	(cclk, reset, kick_off_ram_srch_5, assoc_ecc_syndrome2[7:0],	ecc_syndrome2);
dffre #(8) ecc_syndrome1_reg    (cclk, reset, kick_off_ram_srch_5, assoc_ecc_syndrome1[7:0],    ecc_syndrome1);

dffr #(1)  ecc_parity_err_r_reg	(cclk, reset,			   ecc_parity_err,		ecc_parity_err_r);

/******************************/
//FC FIFO DATA
/******************************/
assign new_bus[2:0]		= rdc_table_num_r;
assign new_bus[3]		= cam_match_r;
assign new_bus[4]		= drop_pkt_r;
assign new_bus[80:5]		= fwd_bus_fwd_info[80:5];
assign new_bus[85:81]		= rdc_table_offset_r;
assign new_bus[87:86]		= valid_tres_r[1:0];
assign new_bus[88]		= valid_zcopy_r;
assign new_bus[98:89]		= valid_cam_haddr_r[9:0];
assign new_bus[99]		= err_all_r;
assign new_bus[100]		= fc_lookup_r;
assign new_bus[102:101]		= fwd_bus_fwd_info[82:81];
assign new_bus[114:103]		= assoc_zcopy_valid ? assoc_zcopy_id : 12'b0;

assign fc_fifo_din		= {new_bus[114:0], fwd_bus_flow_key[361:0], hash_v2, hash_v1[19:0]}; //115+362+36=513
assign fc_fifo_ren		= fc_fifo_ren_sync & !fc_fifo_rd_sync_r;

dffr #(1) fc_fifo_wen_reg 	(cclk, reset, kick_off_ram_srch_6, 	fc_fifo_wen);
dffr #(1) fc_fifo_ren_r_reg	(cclk, reset, fc_fifo_ren_sync,		fc_fifo_rd_sync_r);


assign fc_fifo_space_avail	= (fc_fifo_cnt < 3'b011);

assign fc_fifo_cnt_in		= fc_fifo_wen & fc_fifo_ren ? fc_fifo_cnt :
                          	  fc_fifo_wen               ? fc_fifo_cnt + 3'd1 :
                          	  fc_fifo_ren               ? fc_fifo_cnt - 3'd1 :
                                                              fc_fifo_cnt;
assign fc_fifo_cnt_en  		= fc_fifo_wen | fc_fifo_ren;

dffre #(3) fc_fifo_cnt_reg 	(cclk, reset, fc_fifo_cnt_en, fc_fifo_cnt_in, fc_fifo_cnt);


/* 0in fifo
   -enq fc_fifo_wen
   -deq fc_fifo_ren
   -depth 4
   -enq_data fc_fifo_din
   -deq_data fc_fifo_dout
   -clock cclk
   -reset reset
   -message "ASSERTION : fifo : fflp_fwd_mstr: fc_fifo failed"
*/


fflp_flow_fifo #(513) fc_fifo_inst (
		.clk		(cclk),
                .reset		(reset),
                .dout		(fc_fifo_dout),
                .hdr_fifo_empty	(fc_fifo_empty),
                .hdr_fifo_full	(fc_fifo_full),
                .din		(fc_fifo_din),
                .wen		(fc_fifo_wen),
                .ren		(fc_fifo_ren)
                );


endmodule

