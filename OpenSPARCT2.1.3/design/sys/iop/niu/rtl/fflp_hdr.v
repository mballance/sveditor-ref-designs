// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: fflp_hdr.v
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
/*module name:   fflp_hdr                                             */
/*description:   datapath for header buss and information decoded     */
/*               from them                                            */
/*                                                                    */
/*parent module in:  fflp.v                                           */
/*child modules in:  none                                             */
/*interface modules:                                                  */
/*author name:       Jeanne Cai                                       */
/*date created:      03-22_2004                                       */
/*                                                                    */
/*              Copyright (c) 2004, Sun Microsystems, Inc.            */
/*                   Sun Proprietary and Confidential                 */
/*                                                                    */
/*modifications:                                                      */
/**********************************************************************/

module fflp_hdr (
		cclk,
		reset,
		ipp_fflp_dvalid,
		ipp_fflp_data,
		ipp_fflp_mac_default,
		ipp_fflp_mac_port,
		snap_en,
		disable_chksum,
		class2_hdr_byte_value,
		class3_hdr_byte_value,
		class4_hdr_byte_value,
		class5_hdr_byte_value,
		class6_hdr_byte_value,
		class7_hdr_byte_value,
		class_action_reg4_dout,
		class_action_reg5_dout,
                class_action_reg6_dout,
                class_action_reg7_dout,
                class_action_reg8_dout,
                class_action_reg9_dout,
                class_action_reg10_dout,
                class_action_reg11_dout,
                class_action_reg12_dout,
                class_action_reg13_dout,
                class_action_reg14_dout,
                class_action_reg15_dout,
                f_key_class_action_reg4_dout,
                f_key_class_action_reg5_dout,
                f_key_class_action_reg6_dout,
                f_key_class_action_reg7_dout,
                f_key_class_action_reg8_dout,
                f_key_class_action_reg9_dout,
                f_key_class_action_reg10_dout,
                f_key_class_action_reg11_dout,
                f_key_class_action_reg12_dout,
                f_key_class_action_reg13_dout,
                f_key_class_action_reg14_dout,
                f_key_class_action_reg15_dout,
                hdr_ctrl_bit_mask_reg_dout,
                cpu_vlan_req,
                cpu_vlan_rd,
                cpu_vlan_wr,
                cpu_vlan_addr,
                vlan_tbl_rd_din,
		fwd_sched,
	
		fflp_ipp_ready,
		fflp_ipp_dvalid,
		fflp_ipp_data,
		fwd_req,
		key_bus,
		fwd_info_bus,
		vlan_tbl_cs,
                vlan_tbl_wr,
                vlan_tbl_addr,
                vlan_tbl_din_reg_dout,
		vlan_parity_err_log_en,
		vlan_tag_id,
                cpu_vlan_gnt_3

		);

input           cclk;
input           reset;
input		ipp_fflp_dvalid;
input[127:0]    ipp_fflp_data;
input[11:0]     ipp_fflp_mac_default;
input[1:0]      ipp_fflp_mac_port;
input           snap_en;
input		disable_chksum;
input[16:0]     class2_hdr_byte_value;
input[16:0]     class3_hdr_byte_value;
input[25:0]     class4_hdr_byte_value;
input[25:0]     class5_hdr_byte_value;
input[25:0]     class6_hdr_byte_value;
input[25:0]     class7_hdr_byte_value;
input[2:0]      class_action_reg4_dout;
input[2:0]      class_action_reg5_dout;
input[2:0]      class_action_reg6_dout;
input[2:0]      class_action_reg7_dout;
input[2:0]      class_action_reg8_dout;
input[2:0]      class_action_reg9_dout;
input[2:0]      class_action_reg10_dout;
input[2:0]      class_action_reg11_dout;
input[2:0]      class_action_reg12_dout;
input[2:0]      class_action_reg13_dout;
input[2:0]      class_action_reg14_dout;
input[2:0]      class_action_reg15_dout;
input[9:0]      f_key_class_action_reg4_dout;
input[9:0]      f_key_class_action_reg5_dout;
input[9:0]      f_key_class_action_reg6_dout;
input[9:0]      f_key_class_action_reg7_dout;
input[9:0]      f_key_class_action_reg8_dout;
input[9:0]      f_key_class_action_reg9_dout;
input[9:0]      f_key_class_action_reg10_dout;
input[9:0]      f_key_class_action_reg11_dout;
input[9:0]      f_key_class_action_reg12_dout;
input[9:0]      f_key_class_action_reg13_dout;
input[9:0]      f_key_class_action_reg14_dout;
input[9:0]      f_key_class_action_reg15_dout;
input[11:0]     hdr_ctrl_bit_mask_reg_dout;
input           cpu_vlan_req;
input           cpu_vlan_rd;
input           cpu_vlan_wr;
input[11:0]     cpu_vlan_addr;
input[17:0]     vlan_tbl_rd_din;
input		fwd_sched;

output		fflp_ipp_ready;
output[3:0]	fflp_ipp_dvalid;
output[15:0]	fflp_ipp_data;
output		fwd_req;
output[199:0]	key_bus;
output[445:0]	fwd_info_bus;
output          vlan_tbl_cs;
output          vlan_tbl_wr;
output[11:0]    vlan_tbl_addr;
output[17:0]    vlan_tbl_din_reg_dout;
output		vlan_parity_err_log_en;
output[11:0]	vlan_tag_id;
output          cpu_vlan_gnt_3;

wire		fflp_ipp_ready;
wire[3:0]	fflp_ipp_dvalid;
wire[15:0]	fflp_ipp_data;
wire		fwd_req;
wire[199:0]	key_bus;
wire[445:0]	fwd_info_bus;
wire		vlan_tbl_cs;
wire            vlan_tbl_wr;
wire[11:0]      vlan_tbl_addr;
wire[17:0]      vlan_tbl_din_reg_dout;
wire		vlan_parity_err_log_en;
wire[11:0]	vlan_tag_id;
wire            cpu_vlan_gnt_3;

wire		hdr_fifo_space_avail;
wire		hdr_fifo_full;

wire		shft0_reg_en;
wire		shft1_reg_en;
wire		shft2_reg_en;
wire		shft3_reg_en;
wire		shft4_reg_en;
wire		shft5_reg_en;
wire		shft6_reg_en;
wire		shft7_reg_en;
wire		hdr_shft_done;


fflp_hdr_dp	fflp_hdr_dp_inst (
				.cclk				(cclk),
				.reset				(reset),
				.ipp_fflp_data			(ipp_fflp_data),
				.ipp_fflp_mac_default		(ipp_fflp_mac_default),
				.ipp_fflp_mac_port		(ipp_fflp_mac_port),
				.shft0_reg_en			(shft0_reg_en),
				.shft1_reg_en			(shft1_reg_en),
				.shft2_reg_en			(shft2_reg_en),
				.shft3_reg_en			(shft3_reg_en),
				.shft4_reg_en			(shft4_reg_en),
				.shft5_reg_en			(shft5_reg_en),
				.shft6_reg_en			(shft6_reg_en),
				.shft7_reg_en			(shft7_reg_en),
				.hdr_shft_done			(hdr_shft_done),
				.fwd_sched			(fwd_sched),
				.snap_en			(snap_en),
				.disable_chksum			(disable_chksum),
				.class2_hdr_byte_value		(class2_hdr_byte_value),
				.class3_hdr_byte_value		(class3_hdr_byte_value),
				.class4_hdr_byte_value		(class4_hdr_byte_value),
				.class5_hdr_byte_value		(class5_hdr_byte_value),
				.class6_hdr_byte_value		(class6_hdr_byte_value),			
				.class7_hdr_byte_value		(class7_hdr_byte_value),
				.class_action_reg4_dout		(class_action_reg4_dout),
				.class_action_reg5_dout		(class_action_reg5_dout),
				.class_action_reg6_dout		(class_action_reg6_dout),
				.class_action_reg7_dout		(class_action_reg7_dout),
				.class_action_reg8_dout		(class_action_reg8_dout),
				.class_action_reg9_dout		(class_action_reg9_dout),
				.class_action_reg10_dout	(class_action_reg10_dout),
				.class_action_reg11_dout	(class_action_reg11_dout),
				.class_action_reg12_dout	(class_action_reg12_dout),
				.class_action_reg13_dout	(class_action_reg13_dout),
				.class_action_reg14_dout	(class_action_reg14_dout),
				.class_action_reg15_dout	(class_action_reg15_dout),
				.f_key_class_action_reg4_dout   (f_key_class_action_reg4_dout),
                                .f_key_class_action_reg5_dout   (f_key_class_action_reg5_dout),
                                .f_key_class_action_reg6_dout   (f_key_class_action_reg6_dout),
                                .f_key_class_action_reg7_dout   (f_key_class_action_reg7_dout),
                                .f_key_class_action_reg8_dout   (f_key_class_action_reg8_dout),
                                .f_key_class_action_reg9_dout   (f_key_class_action_reg9_dout),
                                .f_key_class_action_reg10_dout	(f_key_class_action_reg10_dout),
                                .f_key_class_action_reg11_dout  (f_key_class_action_reg11_dout),
                                .f_key_class_action_reg12_dout  (f_key_class_action_reg12_dout),
                                .f_key_class_action_reg13_dout  (f_key_class_action_reg13_dout),
                                .f_key_class_action_reg14_dout  (f_key_class_action_reg14_dout),
                                .f_key_class_action_reg15_dout  (f_key_class_action_reg15_dout),
				.hdr_ctrl_bit_mask_reg_dout	(hdr_ctrl_bit_mask_reg_dout),
				.cpu_vlan_req			(cpu_vlan_req),
				.cpu_vlan_rd			(cpu_vlan_rd),
				.cpu_vlan_wr                    (cpu_vlan_wr),
				.cpu_vlan_addr			(cpu_vlan_addr),
				.vlan_tbl_rd_din                (vlan_tbl_rd_din),

				.fwd_req			(fwd_req),
				.key_bus			(key_bus),
				.fwd_info_bus			(fwd_info_bus),
				.hdr_fifo_space_avail		(hdr_fifo_space_avail),
				.hdr_fifo_full			(hdr_fifo_full),
				.fflp_ipp_dvalid		(fflp_ipp_dvalid),
				.fflp_ipp_data			(fflp_ipp_data),
				.vlan_tbl_cs			(vlan_tbl_cs),
				.vlan_tbl_wr                    (vlan_tbl_wr),
				.vlan_tbl_addr			(vlan_tbl_addr),
				.vlan_tbl_din_reg_dout		(vlan_tbl_din_reg_dout),
				.vlan_parity_err_log_en		(vlan_parity_err_log_en),
				.vlan_tag_id			(vlan_tag_id),
				.cpu_vlan_gnt_3			(cpu_vlan_gnt_3)

				);

		

fflp_hdr_cntl	fflp_hdr_cntl_inst (
				.cclk                           (cclk),
                                .reset                          (reset),
				.ipp_fflp_dvalid		(ipp_fflp_dvalid),
				.hdr_fifo_space_avail           (hdr_fifo_space_avail),
                                .hdr_fifo_full                  (hdr_fifo_full),

				.fflp_ipp_ready			(fflp_ipp_ready),
				.shft0_reg_en                   (shft0_reg_en),
                                .shft1_reg_en                   (shft1_reg_en),
                                .shft2_reg_en                   (shft2_reg_en),
                                .shft3_reg_en                   (shft3_reg_en),
                                .shft4_reg_en                   (shft4_reg_en),
                                .shft5_reg_en                   (shft5_reg_en),
                                .shft6_reg_en                   (shft6_reg_en),
                                .shft7_reg_en                   (shft7_reg_en),
                                .hdr_shft_done                  (hdr_shft_done)

				);

endmodule

