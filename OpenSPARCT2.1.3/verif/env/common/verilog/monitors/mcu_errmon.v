// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: mcu_errmon.v
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
`timescale 1ps/1ps

`ifdef MCUSAT
  `include "mcu_dispmonDefines.vh"
`else
  `include "defines.vh"
  `include "dispmonDefines.vh"
`endif

module mcu_errmon(
      mcu_num,
      l2clk,
      drl2clk,
      rst_wmr_protect,
      l2t0_mcu_rd_req,
      l2t1_mcu_rd_req,
      l2t0_mcu_rd_dummy_req,
      l2t1_mcu_rd_dummy_req,
      mcu_l2t0_rd_ack,
      mcu_l2t1_rd_ack,
      l2t0_mcu_addr_39to7,
      l2t1_mcu_addr_39to7,
      drif_crc_rd_picked,
      drif_err_rd_picked,
      drif_rd_picked,
      drif_scrub_picked,
      drif0_rd_picked,
      drif0_raw_hazard,
      drif1_rd_picked,
      drif1_raw_hazard,
      drif_addr_err,
      fbdic_rddata_vld,
      fbdic_err_recov,
      fbdic_err_unrecov,
      readdp0_syndrome,
      readdp1_syndrome,
      ecc_multi_err0,
      ecc_multi_err1,
      ecc_single_err0,
      ecc_single_err1,
      ncu_mcu_ecci,
      ncu_mcu_fbri,
      ncu_mcu_fbui,
      fbdic_crc_error,
      rdpctl_crc_recov_err,
      rdpctl_crc_unrecov_err,
      drif_err_sts_reg_ld,
      drif_ucb_addr,
      drif_ucb_data,
      flush_reset_complete,
      rdpctl_err_retry_reg,
      rdpctl_err_sts_reg,
      rdpctl_fbr_error_in,
      rdpctl_fbu_error_in,
      rdpctl_dac_error_in,
      rdpctl_dau_error_in,
      rdpctl_dsc_error_in,
      rdpctl_dsu_error_in,
      rdpctl_dbu_error_in,
      rdpctl_meb_error_in,
      rdpctl_mec_error_in,
      rdpctl_meu_error_in
);

// mcu variables {{{
// mcu module
input [1:0] mcu_num;
input l2clk;
input drl2clk;
input rst_wmr_protect;

input l2t0_mcu_rd_req;
input l2t1_mcu_rd_req;
input l2t0_mcu_rd_dummy_req;
input l2t1_mcu_rd_dummy_req;
input mcu_l2t0_rd_ack;
input mcu_l2t1_rd_ack;
input [39:7] l2t0_mcu_addr_39to7;
input [39:7] l2t1_mcu_addr_39to7;

input drif_crc_rd_picked;
input drif_err_rd_picked;
input drif_rd_picked;
input drif_scrub_picked;
input drif0_rd_picked;
input drif0_raw_hazard;
input drif1_rd_picked;
input drif1_raw_hazard;
input drif_addr_err;

input fbdic_rddata_vld;
input fbdic_err_recov;
input fbdic_err_unrecov;
input [15:0] readdp0_syndrome;
input [15:0] readdp1_syndrome;
input ecc_multi_err0;
input ecc_multi_err1;
input ecc_single_err0;
input ecc_single_err1;

input ncu_mcu_ecci;
input ncu_mcu_fbri;
input ncu_mcu_fbui;
input fbdic_crc_error;
input rdpctl_crc_recov_err;
input rdpctl_crc_unrecov_err;
input drif_err_sts_reg_ld;
input [12:0] drif_ucb_addr;
input [63:0] drif_ucb_data;

input flush_reset_complete;

input [36:0] rdpctl_err_retry_reg;
input [25:0] rdpctl_err_sts_reg;


   input rdpctl_fbr_error_in;
   input rdpctl_fbu_error_in;
   input rdpctl_dac_error_in;
   input rdpctl_dau_error_in;
   input rdpctl_dsc_error_in;
   input rdpctl_dsu_error_in;
   input rdpctl_dbu_error_in;
   input rdpctl_meb_error_in;
   input rdpctl_mec_error_in;
   input rdpctl_meu_error_in;


// }}}


// Local variables {{{
reg [63:0] mcu_err_status_reg;
reg [63:0] mcu_err_retry_reg;
reg [4:0] tmp_rd_picked;
reg [4:0] rd_picked_fifo[7:0];
reg [2:0] rd_picked_fifo_enq;
reg [2:0] rd_picked_fifo_deq;
reg rd_pa_err_fifo[15:0];
reg [3:0] rd_pa_err_fifo_enq;
reg [3:0] rd_pa_err_fifo_deq;
reg [12:0] rd_err_fifo[15:0];
reg [3:0] rd_err_fifo_enq;
reg [3:0] rd_err_fifo_deq;
reg enabled;
integer i;

initial
begin
    if ($test$plusargs("mcu_errmon_disable"))
      enabled = 1'b0;
end

initial begin
    mcu_err_status_reg = 64'b0;
    mcu_err_retry_reg = 64'b0;
    tmp_rd_picked = 4'b0;
    for(i = 0; i < 8; i = i + 1)
        rd_picked_fifo[i] = 5'b0;

    for(i = 0; i < 16; i = i + 1)
        rd_pa_err_fifo[i] = 1'b0;

    for(i = 0; i < 16; i = i + 1)
        rd_err_fifo[i] = 13'b0;

    rd_err_fifo_enq = 4'b0;
    rd_err_fifo_deq = 4'b0;
    rd_picked_fifo_enq = 3'b0;
    rd_picked_fifo_deq = 3'b0;
    rd_pa_err_fifo_enq = 4'b0;
    rd_pa_err_fifo_deq = 4'b0;
end
//}}}

reg [39:0] pa_mask_l;
reg [1:0]  dimm_adjust;
//reg        rank_adjust;
reg        channel_adjust;
reg        side_adjust;
reg [1:0]  size_adjust;
reg [4:0] dont_check_error_reg;
reg       halt_on_oob_error,halt_on_mcu_err;
reg       pb_mode;
reg [1:0] pb_shift;
reg [3:0] pb;

initial
begin
    dont_check_error_reg = 5'hf;

    if     ($test$plusargs("2_FBDIMMS")) dimm_adjust = 2'h2;
    else if($test$plusargs("4_FBDIMMS")) dimm_adjust = 2'h1;
    else if($test$plusargs("8_FBDIMMS")) dimm_adjust = 2'h0;
    else                                 dimm_adjust = 2'h3; // default 1_FBDIMM

    if($test$plusargs("SNG_CHANNEL")) channel_adjust = 1'h1;
    else                              channel_adjust = 1'h0; // default DUAL_CHANNEL

    if($test$plusargs("STACK_DIMM")) side_adjust = 1'h0;
    else                             side_adjust = 1'h1; // default RANK_DIMM

    if     ($test$plusargs("DIMM_SIZE_256")) size_adjust = 2'h3;
    else if($test$plusargs("DIMM_SIZE_512")) size_adjust = 2'h2;
    else if($test$plusargs("DIMM_SIZE_1G"))  size_adjust = 2'h1;
    else                                     size_adjust = 2'h0; // default DIMM_SIZE_2G

    if($value$plusargs("bank_set_mask=%d", pb)) 
    begin
        case(pb)
        4'b0001, 4'b0010, 4'b0100, 4'b1000: begin
            pb_mode = 1'b1;
            pb_shift = 2'b10;
        end
        4'b0011, 4'b0101, 4'b0110, 4'b1001, 4'b1010, 4'b1100: begin
            pb_mode = 1'b1;
            pb_shift = 2'b1;
        end
        default: pb_mode = 1'b0;
        endcase
    end
    else
        pb_mode = 1'b0;
    

    pa_mask_l = (40'hffffffffff >> (1 + channel_adjust + side_adjust + size_adjust + dimm_adjust));

    if($test$plusargs("DISABLE_OOB_CHECK")) halt_on_oob_error = 1'b1;
    else halt_on_oob_error = 1'b0;
    if($test$plusargs("DISABLE_MCU_ESR_CHECK")) halt_on_mcu_err = 1'b1;
    else halt_on_mcu_err = 1'b0;


end

always @(negedge (l2clk && enabled))
begin
    if(l2t0_mcu_rd_req)
    begin
        if((|(l2t0_mcu_addr_39to7[39:7] & (~pa_mask_l[39:7]))) || (pb_mode && ((l2t0_mcu_addr_39to7 << pb_shift) & (~pa_mask_l[39:7]))))
        begin
            `ifdef MCUSAT
                `PR_DEBUG("mcu_errmon", `DEBUG, "INFO: Out-of-bound read address err detected on l2t0 MCU[%d] read. PA[39:7] = %x",mcu_num, l2t0_mcu_addr_39to7);
            `else
                if(~halt_on_oob_error)
                    `PR_ERROR("mcu_errmon", `ERROR, "Out-of-bound read addr on l2t0 MCU[%d] Read: Address outside of Current Memory Configuration is being Accessed !!!, PA[39:7] = %x",mcu_num, l2t0_mcu_addr_39to7);
            `endif
            if(~l2t0_mcu_rd_dummy_req) 
            begin
                rd_pa_err_fifo[rd_pa_err_fifo_enq] = 1'b1;
                rd_pa_err_fifo_enq = rd_pa_err_fifo_enq + 1'b1;
            end
            else
            begin
                @(posedge mcu_l2t0_rd_ack);
                if(dont_check_error_reg <= 5'h15)
                    dont_check_error_reg = dont_check_error_reg + 3;
                if(mcu_err_status_reg[57] == 1'b0)
                    mcu_err_status_reg[57] = 1'b1;
                else
                    mcu_err_status_reg[56] = 1'b1;
            end
        end
    end
end

always @(negedge (l2clk && enabled))
begin
    if(l2t1_mcu_rd_req)
    begin
        if((|(l2t1_mcu_addr_39to7[39:7] & (~pa_mask_l[39:7]))) || (pb_mode && ((l2t1_mcu_addr_39to7 << pb_shift) & (~pa_mask_l[39:7]))))
        begin
            `ifdef MCUSAT
                `PR_DEBUG("mcu_errmon", `DEBUG, "INFO: Out-of-bound read address err detected on l2t1 MCU[%d] read, PA[39:7] = %x",mcu_num, l2t1_mcu_addr_39to7);
            `else
                if(~halt_on_oob_error)
                    `PR_ERROR("mcu_errmon", `ERROR, "Out-of-bound read addr on l2t1 MCU[%d] Read: Address outside of Current Memory Configuration is being Accessed !!!, PA[39:7] = %x",mcu_num, l2t1_mcu_addr_39to7);
            `endif
            if(~l2t1_mcu_rd_dummy_req)
            begin
                rd_pa_err_fifo[rd_pa_err_fifo_enq] = 1'b1;
                rd_pa_err_fifo_enq = rd_pa_err_fifo_enq + 1'b1;
            end
            else
            begin
                @(posedge mcu_l2t1_rd_ack);
                if(dont_check_error_reg <= 5'h15)
                    dont_check_error_reg = dont_check_error_reg + 3;
                if(mcu_err_status_reg[57] == 1'b0)
                    mcu_err_status_reg[57] = 1'b1;
                else
                    mcu_err_status_reg[56] = 1'b1;
            end
        end
    end
end

always @(posedge (drl2clk && enabled))
begin
    case({drif_addr_err, drif_crc_rd_picked, drif_err_rd_picked, drif_rd_picked, drif_scrub_picked})
        5'b00000: tmp_rd_picked = 5'b00000;
        5'b00001: tmp_rd_picked = 5'b00001;
        5'b00010: begin
                    if((drif0_rd_picked && drif0_raw_hazard) || (drif1_rd_picked && drif1_raw_hazard))
                        tmp_rd_picked = 5'b00000;
                    else
                        tmp_rd_picked = 5'b00010;
                 end
        5'b00100: tmp_rd_picked = 5'b00100;
        5'b01100: tmp_rd_picked = 5'b01100;
        5'b10010: begin
                    if((drif0_rd_picked && drif0_raw_hazard) || (drif1_rd_picked && drif1_raw_hazard))
                    begin
                        tmp_rd_picked = 5'b00000;
                    end
                    else
                    begin
                        if(~rd_pa_err_fifo[rd_pa_err_fifo_deq])
                            `PR_ERROR("mcu_errmon", `ERROR, "Out-of-bound address err wrongly detected in mcu"); 
                        rd_pa_err_fifo[rd_pa_err_fifo_deq] = 1'b0;
                        rd_pa_err_fifo_deq = rd_pa_err_fifo_deq + 1;
                        tmp_rd_picked = 5'b10010;
                    end
                 end
        default: 
        begin
            tmp_rd_picked = 5'b00000;
            `PR_DEBUG("mcu_errmon", `DEBUG, "Warning: Unrecognized read combination detected in MCU[%d].",mcu_num);
        end
    endcase
    
    if(tmp_rd_picked != 5'b0)
    begin
        rd_err_fifo[rd_err_fifo_enq] = {tmp_rd_picked, 8'h0};
        rd_err_fifo_enq = rd_err_fifo_enq + 1;
    end
end

reg [15:0] tmp_err_detected_code;
reg [31:0] err_detected_code;
reg set_err_reg;
reg [15:0] last_synd;
reg [1:0] first_vld;
reg skip_initial_clks;
reg is_single_channel;
reg mcu_ecc_multi_err0_d1;
reg mcu_ecc_multi_err1_d1;
reg mcu_ecc_single_err0_d1;
reg mcu_ecc_single_err1_d1;
reg mcu_ecc_multi_err0_d2;
reg mcu_ecc_multi_err1_d2;
reg mcu_ecc_single_err0_d2;
reg mcu_ecc_single_err1_d2;
reg mcu_fbdic_rddata_vld_d1;
reg mcu_fbdic_crc_error_d1;

initial begin
    tmp_err_detected_code = 16'b0;
    err_detected_code = 32'b0;
    last_synd = 16'b0;
    set_err_reg = 1'b0;
    first_vld = 2'b0;
    skip_initial_clks = 1'b1;
    if($test$plusargs("SNG_CHANNEL"))
        is_single_channel = 1'b1;
    else
        is_single_channel = 1'b0;
end

always @(posedge (set_err_reg && enabled))
begin
    @(posedge drl2clk);
    set_err_reg = 1'b0;
end

always @(posedge (drl2clk && enabled))
begin
    mcu_ecc_multi_err0_d1 <= ecc_multi_err0;
    mcu_ecc_multi_err1_d1 <= ecc_multi_err1;
    mcu_ecc_single_err0_d1 <= ecc_single_err0;
    mcu_ecc_single_err1_d1 <= ecc_single_err1;

    mcu_ecc_multi_err0_d2 <= mcu_ecc_multi_err0_d1;
    mcu_ecc_multi_err1_d2 <= mcu_ecc_multi_err1_d1;
    mcu_ecc_single_err0_d2 <= mcu_ecc_single_err0_d1;
    mcu_ecc_single_err1_d2 <= mcu_ecc_single_err1_d1;

    mcu_fbdic_rddata_vld_d1 <= fbdic_rddata_vld;
    mcu_fbdic_crc_error_d1 <= fbdic_crc_error;
end

always @(posedge (drl2clk && enabled))
begin
    if(dont_check_error_reg > 0)
        dont_check_error_reg = dont_check_error_reg - 1'b1;

end

always @(negedge (drl2clk && enabled))
begin
    `ifdef SNG_CHANNEL
        if(mcu_fbdic_rddata_vld_d1 == 1'b1 && first_vld == 2'b0)
        begin
            if(dont_check_error_reg <= 5'h15)
                dont_check_error_reg = dont_check_error_reg + 6;
            first_vld = first_vld + 1'b1;
            tmp_err_detected_code = 16'b0;
            last_synd = 16'b0;

            if(ecc_single_err0)
            begin
                last_synd = readdp0_syndrome;
                tmp_err_detected_code[3] = 1'b1;
            end
            else if(ecc_single_err1 && ~mcu_ecc_single_err1_d1)
            begin
                last_synd = readdp1_syndrome;
                tmp_err_detected_code[3] = 1'b1;
            end

            if(ecc_single_err0 && ecc_single_err1)
                tmp_err_detected_code[15] = 1'b1;

            if(ecc_multi_err0)
            begin
                last_synd = readdp0_syndrome;
                tmp_err_detected_code[2] = 1'b1;
            end
            else if(ecc_multi_err1 && ~mcu_ecc_multi_err1_d1)
            begin
                last_synd = readdp1_syndrome;
                tmp_err_detected_code[2] = 1'b1;
            end

            if(ecc_multi_err0 && ecc_multi_err1)
                tmp_err_detected_code[0] = 1'b1;

            if(mcu_fbdic_crc_error_d1)
                tmp_err_detected_code[5] = 1'b1;

        end
        else if(mcu_fbdic_rddata_vld_d1 == 1'b1 && first_vld == 2'b1)
        begin
            first_vld = first_vld + 1'b1;

            if(ecc_single_err0 && ~mcu_ecc_single_err0_d1)
            begin
                if(tmp_err_detected_code[3:2] == 2'b0)
                    last_synd = readdp0_syndrome;
                tmp_err_detected_code[3] = 1'b1;
            end
            else if(ecc_single_err1 && ~mcu_ecc_single_err1_d1)
            begin
                if(tmp_err_detected_code[3:2] == 2'b0)
                    last_synd = readdp1_syndrome;
                tmp_err_detected_code[3] = 1'b1;
            end

            if(ecc_single_err0 && ecc_single_err1)
                tmp_err_detected_code[15] = 1'b1;

            if(ecc_multi_err0 && ~mcu_ecc_multi_err0_d1)
            begin
                if(tmp_err_detected_code[2] == 1'b0)
                    last_synd = readdp0_syndrome;
                tmp_err_detected_code[2] = 1'b1;
            end
            else if(ecc_multi_err1 && ~mcu_ecc_multi_err1_d1)
            begin
                if(tmp_err_detected_code[2] == 1'b0)
                    last_synd = readdp1_syndrome;
                tmp_err_detected_code[2] = 1'b1;
            end

            if(ecc_multi_err0 && ecc_multi_err1)
                tmp_err_detected_code[14] = 1'b1;

            if(mcu_fbdic_crc_error_d1)
                tmp_err_detected_code[5] = 1'b1;

            if(rdpctl_crc_recov_err == 1'b1)
                tmp_err_detected_code[7] = 1'b1;

            if(rdpctl_crc_unrecov_err == 1'b1)
                tmp_err_detected_code[9] = 1'b1;

        end
        else if(mcu_fbdic_rddata_vld_d1 == 1'b1 && first_vld == 2'h2)
        begin
            first_vld = first_vld + 1'b1;

            if(ecc_single_err0)
            begin
                if(tmp_err_detected_code[3:2] == 2'b0)
                    last_synd = readdp0_syndrome;
                tmp_err_detected_code[1] = 1'b1;
            end
            else if(ecc_single_err1 && ~mcu_ecc_single_err1_d1)
            begin
                if(tmp_err_detected_code[3:2] == 2'b0)
                    last_synd = readdp1_syndrome;
                tmp_err_detected_code[1] = 1'b1;
            end

            if(ecc_single_err0 && ecc_single_err1)
                tmp_err_detected_code[13] = 1'b1;

            if(ecc_multi_err0)
            begin
                if(tmp_err_detected_code[2] == 1'b0)
                    last_synd = readdp0_syndrome;
                tmp_err_detected_code[0] = 1'b1;
            end
            else if(ecc_multi_err1 && ~mcu_ecc_multi_err1_d1)
            begin
                if(tmp_err_detected_code[2] == 1'b0)
                    last_synd = readdp1_syndrome;
                tmp_err_detected_code[0] = 1'b1;
            end

            if(ecc_multi_err0 && ecc_multi_err1)
                tmp_err_detected_code[12] = 1'b1;

            if(mcu_fbdic_crc_error_d1)
                tmp_err_detected_code[5] = 1'b1;

            if(rdpctl_crc_recov_err == 1'b1)
                tmp_err_detected_code[7] = 1'b1;

            if(rdpctl_crc_unrecov_err == 1'b1)
                tmp_err_detected_code[9] = 1'b1;

        end
        else if(mcu_fbdic_rddata_vld_d1 == 1'b1 && first_vld == 2'h3)
        begin

            if(ecc_single_err0 && ~mcu_ecc_single_err0_d1)
            begin
                if(tmp_err_detected_code[3:0] == 4'b0)
                    last_synd = readdp0_syndrome;
                tmp_err_detected_code[1] = 1'b1;
            end
            else if(ecc_single_err1)
            begin
                if(tmp_err_detected_code[3:0] == 4'b0)
                    last_synd = readdp1_syndrome;
                tmp_err_detected_code[1] = 1'b1;
            end

            if(ecc_single_err0 && ecc_single_err1)
                tmp_err_detected_code[13] = 1'b1;

            if(ecc_multi_err0 && ~mcu_ecc_multi_err0_d1)
            begin
                if({tmp_err_detected_code[2],tmp_err_detected_code[0]} == 2'b0)
                    last_synd = readdp0_syndrome;
                tmp_err_detected_code[0] = 1'b1;
            end
            else if(ecc_multi_err1)
            begin
                if({tmp_err_detected_code[2],tmp_err_detected_code[0]} == 2'b0)
                    last_synd = readdp1_syndrome;
                tmp_err_detected_code[0] = 1'b1;
            end

            if(ecc_multi_err0 && ecc_multi_err1)
                tmp_err_detected_code[12] = 1'b1;

            if(mcu_fbdic_crc_error_d1)
                tmp_err_detected_code[5] = 1'b1;

            if(rdpctl_crc_recov_err == 1'b1)
                tmp_err_detected_code[7] = 1'b1;

            if(rdpctl_crc_unrecov_err == 1'b1)
                tmp_err_detected_code[9] = 1'b1;

            err_detected_code = {last_synd, tmp_err_detected_code};
            set_err_reg = 1'b1;
            first_vld = 2'b0;
        end

    `else

        if(mcu_fbdic_rddata_vld_d1 == 1'b1 && first_vld == 2'b0)
        begin
            if(dont_check_error_reg <= 5'h15)
                dont_check_error_reg = dont_check_error_reg + 6;
            first_vld = first_vld + 1'b1;
            tmp_err_detected_code = 16'b0;
            last_synd = 16'b0;

            if(ecc_single_err0)
            begin
                last_synd = readdp0_syndrome;
                tmp_err_detected_code[3] = 1'b1;
            end
            else if(ecc_single_err1)
            begin
                last_synd = readdp1_syndrome;
                tmp_err_detected_code[3] = 1'b1;
            end

            if(ecc_single_err0 && ecc_single_err1)
                tmp_err_detected_code[15] = 1'b1;

            if(ecc_multi_err0)
            begin
                last_synd = readdp0_syndrome;
                tmp_err_detected_code[2] = 1'b1;
            end
            else if(ecc_multi_err1)
            begin
                last_synd = readdp1_syndrome;
                tmp_err_detected_code[2] = 1'b1;
            end

            if(ecc_multi_err0 && ecc_multi_err1)
                tmp_err_detected_code[14] = 1'b1;

            if(mcu_fbdic_crc_error_d1)
                tmp_err_detected_code[5] = 1'b1;

        end
        else if(mcu_fbdic_rddata_vld_d1 == 1'b1 && first_vld == 2'b1)
        begin
            first_vld = first_vld + 1'b1;

            if(ecc_single_err0)
            begin
                if(tmp_err_detected_code[3:2] == 2'b0)
                    last_synd = readdp0_syndrome;
                tmp_err_detected_code[1] = 1'b1;
            end
            else if(ecc_single_err1)
            begin
                if(tmp_err_detected_code[3:2] == 2'b0)
                    last_synd = readdp1_syndrome;
                tmp_err_detected_code[1] = 1'b1;
            end

            if(ecc_single_err0 && ecc_single_err1)
                tmp_err_detected_code[13] = 1'b1;

            if(ecc_multi_err0)
            begin
                if(tmp_err_detected_code[2] == 1'b0)
                    last_synd = readdp0_syndrome;
                tmp_err_detected_code[0] = 1'b1;
            end
            else if(ecc_multi_err1)
            begin
                if(tmp_err_detected_code[2] == 1'b0)
                    last_synd = readdp1_syndrome;
                tmp_err_detected_code[0] = 1'b1;
            end

            if(ecc_multi_err0 && ecc_multi_err1)
                tmp_err_detected_code[12] = 1'b1;

            if(mcu_fbdic_crc_error_d1)
                tmp_err_detected_code[5] = 1'b1;

            if(rdpctl_crc_recov_err == 1'b1)
                tmp_err_detected_code[7] = 1'b1;

            if(rdpctl_crc_unrecov_err == 1'b1)
                tmp_err_detected_code[9] = 1'b1;

            err_detected_code = {last_synd, tmp_err_detected_code};
            set_err_reg = 1'b1;
            first_vld = 2'b0;
        end
    `endif
end


//-----------------------------------
// Check for FBU/FBR errors
//-----------------------------------

reg set_err_reg_fbur;
initial set_err_reg_fbur = 1'b0;

always @(posedge (drl2clk && enabled))
begin
    if(fbdic_err_recov && ~mcu_fbdic_rddata_vld_d1)
    begin
        if(dont_check_error_reg <= 5'h15)
            dont_check_error_reg <= dont_check_error_reg + 5;
        err_detected_code = {16'b0, 16'h80};
        set_err_reg_fbur = 1'b1;
    end

    if(fbdic_err_unrecov && ~mcu_fbdic_rddata_vld_d1)
    begin
        if(dont_check_error_reg <= 5'h15)
            dont_check_error_reg <= dont_check_error_reg + 5;

        if(set_err_reg_fbur)
            err_detected_code[15:0] = err_detected_code[15:0] | 16'h200;
        else
            err_detected_code = {16'b0, 16'h200};
        set_err_reg_fbur = 1'b1;
    end

    if(~fbdic_err_recov && ~fbdic_err_unrecov)
        set_err_reg_fbur <= 1'b0;
end


reg [31:0] err_code;
reg [12:0] tmp_rd_err_fifo;
integer tmp_cnt_s;
integer tmp_cnt_m;

initial begin
    err_code = 28'b0;
    tmp_rd_err_fifo = 13'b0;
    tmp_cnt_s = 0;
    tmp_cnt_m = 0;
end

always @(posedge (set_err_reg && enabled) or posedge (set_err_reg_fbur && enabled))
begin
    err_code = err_detected_code;
    tmp_rd_err_fifo = 13'b0;
    if(~set_err_reg_fbur)
    begin
        tmp_rd_err_fifo = rd_err_fifo[rd_err_fifo_deq];
        rd_err_fifo_deq = rd_err_fifo_deq + 1'b1;
    end

    if(tmp_rd_err_fifo[12])
        err_code[11] = 1'b1;

// assign rdpctl_err_retry_reg[36:0] = {rdpctl_retry_reg_valid, rdpctl_err_retry2_reg[17:0],rdpctl_err_retry1_reg[17:0]};

    if(tmp_rd_err_fifo[12:8] == 5'b00100) // retry rd
    begin
        if(mcu_err_retry_reg[63] != 1'b1)
        begin
            if(mcu_err_retry_reg[1:0] == 2'b0)
            begin
                if(err_code[2] || err_code[0] || err_code[14] || err_code[12])
                begin
                    mcu_err_retry_reg[1:0] = 2'b11; //ue
                    mcu_err_retry_reg[17:2] = err_code[31:16];
                    mcu_err_retry_reg[63] = 1'b1;
                end
                else if(err_code[3] || err_code[1] || err_code[15] || err_code[13])
                begin
                    mcu_err_retry_reg[1:0] = 2'b10; //ce
                    mcu_err_retry_reg[17:2] = err_code[31:16];
                    mcu_err_retry_reg[63] = 1'b1;
                end
                else
                    mcu_err_retry_reg[1:0] = 2'b01; //no error
            end
            else if(mcu_err_retry_reg[33:32] == 2'b0)
            begin
                if(err_code[2] || err_code[0] || err_code[14] || err_code[12])
                begin
                    mcu_err_retry_reg[33:32] = 2'b11; //ue
                    mcu_err_retry_reg[49:34] = err_code[31:16];
                    mcu_err_retry_reg[63] = 1'b1;
                end
                else if(err_code[3] || err_code[1] || err_code[15] || err_code[13])
                begin
                    mcu_err_retry_reg[33:32] = 2'b10; //ce
                    mcu_err_retry_reg[49:34] = err_code[31:16];
                    mcu_err_retry_reg[63] = 1'b1;
                end
                else
                    mcu_err_retry_reg[33:32] = 2'b01;  //no error
            end
        end
    end // retry rd
    else 
    begin // update ESR
        if(err_code[5] && ({err_code[9], err_code[7]} == 2'b0))
        begin
            if(tmp_rd_err_fifo[12:8] == 5'b00001) // scrub rd
            begin
                `PR_DEBUG("mcu_errmon", `DEBUG, "MCU[%d] *** N2 T.O 1.0 BUG 113430 ***",mcu_num);
            end
        end
        if(~(err_code[5] && ({err_code[9], err_code[7]} == 2'b0)))
        begin
            if(mcu_err_status_reg[15:0] == 16'b0)
            begin
                if(err_code[11])
                begin
                    if(mcu_err_status_reg[57] == 1'b0)
                        #0 mcu_err_status_reg[57] = 1'b1;
                    else
                        #0 mcu_err_status_reg[56] = 1'b1;
                end

                if(err_code[9]) begin
                    if(mcu_err_status_reg[55] == 1'b1)
                        #0 mcu_err_status_reg[63] = 1'b1;
                    else
                        #0 mcu_err_status_reg[55] = 1'b1;
                end

                if(err_code[7]) begin
                    if(mcu_err_status_reg[54] == 1'b1) 
                        #0 mcu_err_status_reg[62] = 1'b1;
                    else
                        #0 mcu_err_status_reg[54] = 1'b1;
                end

                if(tmp_rd_err_fifo[12:8] == 5'b00001) // scrub rd
                begin
                    if(err_code[3] || err_code[1] || err_code[15] || err_code[13])
                        #0 mcu_err_status_reg[59] = 1'b1;

                    if(err_code[2] || err_code[0] || err_code[14] || err_code[12])
                        #0 mcu_err_status_reg[58] = 1'b1;

                    if((err_code[3] || err_code[1] || err_code[15] || err_code[13]) && (err_code[2] || err_code[0] || err_code[14] || err_code[12]))
                    begin
                        // CE & UE in same cycle
                        if((err_code[3] && err_code[2]) || (err_code[1] && err_code[0])) 
                            #0 mcu_err_status_reg[62] = 1'b1;

                        // UE followed by CE
                        if(err_code[2] && err_code[1]) 
                            #0 mcu_err_status_reg[62] = 1'b1;
                    end

                    tmp_cnt_s = 0;
                    tmp_cnt_s = err_code[3] + err_code[1] + err_code[15] + err_code[13];
                    if(tmp_cnt_s > 1)
                        #0 mcu_err_status_reg[62] = 1'b1;

                    tmp_cnt_m = 0;
                    tmp_cnt_m = err_code[2] + err_code[0] + err_code[14] + err_code[12];
                    if(tmp_cnt_m > 1)
                        #0 mcu_err_status_reg[63] = 1'b1;
                
                    #0 mcu_err_status_reg[15:0] = err_code[31:16];
                end

                if(tmp_rd_err_fifo[12:8] == 5'b00010 || tmp_rd_err_fifo[12:8] == 5'b01100) // normal read
                begin
                    if(err_code[3] || err_code[1] || err_code[15] || err_code[13])
                        #0 mcu_err_status_reg[61] = 1'b1;

                    if(err_code[2] || err_code[0] || err_code[14] || err_code[12])
                        #0 mcu_err_status_reg[60] = 1'b1;

                    if((err_code[3] || err_code[1] || err_code[15] || err_code[13]) && (err_code[2] || err_code[0] || err_code[14] || err_code[12]))
                    begin
                        // UE and CE in same cycle
                        if((err_code[3] && err_code[2]) || (err_code[1] && err_code[0])) 
                            #0 mcu_err_status_reg[62] = 1'b1;

                        // UE followed by CE
                        if(err_code[2] && err_code[1]) 
                            #0 mcu_err_status_reg[62] = 1'b1;
                    end

                    tmp_cnt_s = 0;
                    tmp_cnt_s = err_code[3] + err_code[1] + err_code[15] + err_code[13];
                    if(tmp_cnt_s > 1)
                        #0 mcu_err_status_reg[62] = 1'b1;

                    tmp_cnt_m = 0;
                    tmp_cnt_m = err_code[2] + err_code[0] + err_code[14] + err_code[12];
                    if(tmp_cnt_m > 1)
                        #0 mcu_err_status_reg[63] = 1'b1;
                
                    #0 mcu_err_status_reg[15:0] = err_code[31:16];
                end
            end
            else // if(status_reg[15:0] != 0)
            begin
                if(err_code[11])
                begin
                    if(mcu_err_status_reg[57] == 1'b1)
                        #0 mcu_err_status_reg[56] = 1'b1;
                    else
                        #0 mcu_err_status_reg[57] = 1'b1;

                    if(((|({mcu_err_status_reg[58],mcu_err_status_reg[60],mcu_err_status_reg[55]})) == 1'b1) && (mcu_err_status_reg[57] != 1'b1))
                    begin
                        #0 mcu_err_status_reg[57] = 1'b1;
                        //mcu_err_status_reg[15:0] = err_code[31:16]; syndrome not captured on oob errors
                    end

                    if(((|({mcu_err_status_reg[59],mcu_err_status_reg[61],mcu_err_status_reg[54]})) == 1'b1) && (mcu_err_status_reg[57] != 1'b1))
                    begin
                        #0 mcu_err_status_reg[57] = 1'b1;
                        #0 mcu_err_status_reg[15:0] = err_code[31:16];
                    end

                    #0 mcu_err_status_reg[57] = 1'b1;
                end

                if(err_code[9])
                begin
                    if((|({mcu_err_status_reg[58],mcu_err_status_reg[60],mcu_err_status_reg[55]})) == 1'b1)
                        #0 mcu_err_status_reg[63] = 1'b1;

                    if(mcu_err_status_reg[57] && mcu_err_status_reg[55] != 1'b1)
                        #0 mcu_err_status_reg[15:0] = err_code[31:16];

                    if(((|({mcu_err_status_reg[59],mcu_err_status_reg[61],mcu_err_status_reg[54]})) == 1'b1) && (mcu_err_status_reg[55] != 1'b1))
                        #0 mcu_err_status_reg[15:0] = err_code[31:16];

                    #0 mcu_err_status_reg[55] = 1'b1;
                end

                if(err_code[7])
                begin
                    if(((|({mcu_err_status_reg[58],mcu_err_status_reg[60],mcu_err_status_reg[55]})) == 1'b1) && (mcu_err_status_reg[54] != 1'b1))
                        #0 mcu_err_status_reg[62] = 1'b1;

                    if(mcu_err_status_reg[57] == 1'b1 && mcu_err_status_reg[54] != 1'b0)
                        #0 mcu_err_status_reg[15:0] = err_code[31:16];

                    if((|({mcu_err_status_reg[59],mcu_err_status_reg[61],mcu_err_status_reg[54]})) == 1'b1)
                        #0 mcu_err_status_reg[62] = 1'b1;

                    #0 mcu_err_status_reg[54] = 1'b1;
                end

                if(tmp_rd_err_fifo[12:8] == 5'b00001) // scrub read
                begin
                    if(err_code[3] || err_code[1] || err_code[15] || err_code[13])
                    begin
                        if(((|({mcu_err_status_reg[58],mcu_err_status_reg[60],mcu_err_status_reg[55]})) == 1'b1) && mcu_err_status_reg[59] != 1'b1)
                            #0 mcu_err_status_reg[62] = 1'b1;

                        if(mcu_err_status_reg[57] == 1'b1 && (|({mcu_err_status_reg[59],mcu_err_status_reg[60],mcu_err_status_reg[58]}) != 1'b1))
                            #0 mcu_err_status_reg[15:0] = err_code[31:16];

                        if((|({mcu_err_status_reg[59],mcu_err_status_reg[61],mcu_err_status_reg[54]})) == 1'b1)
                            #0 mcu_err_status_reg[62] = 1'b1;

                        #0 mcu_err_status_reg[59] = 1'b1;

                        tmp_cnt_s = 0;
                        tmp_cnt_s = err_code[3] + err_code[1] + err_code[15] + err_code[13];
                        if(tmp_cnt_s > 1)
                            #0 mcu_err_status_reg[62] = 1'b1;

                    end

                    if(err_code[2] || err_code[0] || err_code[14] || err_code[12])
                    begin
                        if((|({mcu_err_status_reg[58],mcu_err_status_reg[60],mcu_err_status_reg[55]})) == 1'b1)
                            #0 mcu_err_status_reg[63] = 1'b1;

                        if(mcu_err_status_reg[57] == 1'b1 && (mcu_err_status_reg[58] != 1'b1))
                            #0 mcu_err_status_reg[15:0] = err_code[31:16];

                        if(((|({mcu_err_status_reg[59],mcu_err_status_reg[61],mcu_err_status_reg[54]})) == 1'b1) && (|({mcu_err_status_reg[58],mcu_err_status_reg[60]}) != 1'b1))
                            #0 mcu_err_status_reg[15:0] = err_code[31:16];

                        #0 mcu_err_status_reg[58] = 1'b1;

                        tmp_cnt_m = 0;
                        tmp_cnt_m = err_code[2] + err_code[0] + err_code[14] + err_code[12];
                        if(tmp_cnt_m > 1)
                            #0 mcu_err_status_reg[63] = 1'b1;
 
                    end

                    if((err_code[3] || err_code[1] || err_code[15] || err_code[13]) && (err_code[2] || err_code[0] || err_code[14] || err_code[12]))
                        #0 mcu_err_status_reg[62] = 1'b1;
                end

                if(tmp_rd_err_fifo[12:8] == 5'b00010 || tmp_rd_err_fifo[12:8] == 5'b01100) // normal read
                begin
                    if(err_code[3] || err_code[1] || err_code[15] || err_code[13])
                    begin
                        if(((|({mcu_err_status_reg[58],mcu_err_status_reg[60],mcu_err_status_reg[55]})) == 1'b1) && mcu_err_status_reg[61] != 1'b1)
                            #0 mcu_err_status_reg[62] = 1'b1;

                        if(mcu_err_status_reg[57] == 1'b1 && (|({mcu_err_status_reg[61],mcu_err_status_reg[60],mcu_err_status_reg[58]}) != 1'b1))
                            #0 mcu_err_status_reg[15:0] = err_code[31:16];

                        if((|({mcu_err_status_reg[59],mcu_err_status_reg[61],mcu_err_status_reg[54]})) == 1'b1)
                            #0 mcu_err_status_reg[62] = 1'b1;

                        #0 mcu_err_status_reg[61] = 1'b1;

                        tmp_cnt_s = 0;
                        tmp_cnt_s = err_code[3] + err_code[1] + err_code[15] + err_code[13];
                        if(tmp_cnt_s > 1)
                            #0 mcu_err_status_reg[62] = 1'b1;

                    end

                    if(err_code[2] || err_code[0] || err_code[14] || err_code[12])
                    begin
                        if((|({mcu_err_status_reg[58],mcu_err_status_reg[60],mcu_err_status_reg[55]})) == 1'b1)
                            #0 mcu_err_status_reg[63] = 1'b1;

                        if(mcu_err_status_reg[57] == 1'b1 && (|({mcu_err_status_reg[60],mcu_err_status_reg[58]}) != 1'b1))
                            #0 mcu_err_status_reg[15:0] = err_code[31:16];

                        if(((|({mcu_err_status_reg[59],mcu_err_status_reg[61],mcu_err_status_reg[54]})) == 1'b1) && (|({mcu_err_status_reg[60],mcu_err_status_reg[58]}) != 1'b1))
                            #0 mcu_err_status_reg[15:0] = err_code[31:16];

                        #0 mcu_err_status_reg[60] = 1'b1;

                        tmp_cnt_m = 0;
                        tmp_cnt_m = err_code[2] + err_code[0] + err_code[14] + err_code[12];
                        if(tmp_cnt_m > 1)
                            #0 mcu_err_status_reg[63] = 1'b1;
 
                    end

                    if((err_code[3] || err_code[1] || err_code[15] || err_code[13]) && (err_code[2] || err_code[0] || err_code[14] || err_code[12]))
                        #0 mcu_err_status_reg[62] = 1'b1;
                end
            end
        end
    end
end

//-----------------------------------
// Clear ESR on ucb_writes
//-----------------------------------
always @ (posedge (drl2clk && enabled))
begin

    if ( ( rdpctl_fbr_error_in == 0 && rdpctl_fbu_error_in == 0 && rdpctl_dac_error_in == 0 && rdpctl_dau_error_in == 0 &&
        rdpctl_dsc_error_in == 0 &&  rdpctl_dsu_error_in == 0 && rdpctl_dbu_error_in == 0 && rdpctl_meb_error_in == 0 &&
        rdpctl_mec_error_in == 0 && rdpctl_meu_error_in == 0 ) && ( drif_err_sts_reg_ld == 1 && drif_ucb_addr[12:0] == 13'h280 ) )
    begin
        if(dont_check_error_reg < 5'h15)
            dont_check_error_reg = dont_check_error_reg + 2;

        mcu_err_status_reg[15:0] = drif_ucb_data[15:0];
        mcu_err_status_reg[63:54] = (mcu_err_status_reg[63:54] & (~drif_ucb_data[63:54]));
    end

end

//-------------------------------------------------------
// Check ESR and ERR
//-------------------------------------------------------
always @ (posedge (drl2clk && enabled))
begin
    if(dont_check_error_reg == 5'b0) begin
        if({mcu_err_status_reg[63:54], mcu_err_status_reg[15:0]} !== rdpctl_err_sts_reg)
            `PR_WARN("mcu_errmon", `WARN, "Inconsistent state of MCU[%d] ESR\n\tExpected ESR data is %x, Actual ESR data received from drif is %x",mcu_num, {mcu_err_status_reg[63:54], mcu_err_status_reg[15:0]}, rdpctl_err_sts_reg);     
    end
end

always @ (posedge (drl2clk && enabled))
begin
    if(dont_check_error_reg == 5'b0) begin
        if({mcu_err_retry_reg[63], mcu_err_retry_reg[49:32], mcu_err_retry_reg[17:0]} !== rdpctl_err_retry_reg[36:0]) begin
            `PR_WARN("mcu_errmon", `WARN, "MISMATCH: ERR not getting updated correctly in MCU[%d]\n\tExpected ERR data is %x, Actual ERR data received from drif is %x",mcu_num, {mcu_err_retry_reg[63],mcu_num, mcu_err_retry_reg[49:32], mcu_err_retry_reg[17:0]}, rdpctl_err_retry_reg);
        end
    end
end

//-------------------------------------------------------
// Warning Messages
//-------------------------------------------------------
always @ (rdpctl_err_sts_reg)
if (enabled)
begin
`ifdef MCUSAT
    if(rdpctl_err_sts_reg[25] == 1'b1)
        `PR_DEBUG("mcu_errmon", `DEBUG, "INFO: Multiple Uncorrectable err detected in MCU[%d] ESR",mcu_num);
    if(rdpctl_err_sts_reg[24] == 1'b1)
        `PR_DEBUG("mcu_errmon", `DEBUG, "INFO: Multiple Correctable err detected in MCU[%d] ESR",mcu_num);
    if(rdpctl_err_sts_reg[23] == 1'b1)
        `PR_DEBUG("mcu_errmon", `DEBUG, "INFO: Correctable err detected in MCU[%d] ESR",mcu_num);
    if(rdpctl_err_sts_reg[22] == 1'b1)
        `PR_DEBUG("mcu_errmon", `DEBUG, "INFO: Uncorrectable err detected in MCU[%d] ESR",mcu_num);
    if(rdpctl_err_sts_reg[21] == 1'b1)
        `PR_DEBUG("mcu_errmon", `DEBUG, "INFO: Scrub correctable err detected in MCU[%d] ESR",mcu_num);
    if(rdpctl_err_sts_reg[20] == 1'b1)
        `PR_DEBUG("mcu_errmon", `DEBUG, "INFO: Scrub uncorrectable err detected in MCU[%d] ESR",mcu_num);
    if(rdpctl_err_sts_reg[19] == 1'b1)
        `PR_DEBUG("mcu_errmon", `DEBUG, "INFO: Out-of-bound address err detected in MCU[%d] ESR",mcu_num);
    if(rdpctl_err_sts_reg[18] == 1'b1)
        `PR_DEBUG("mcu_errmon", `DEBUG, "INFO: Multiple Out-of-bound address err detected in MCU[%d] ESR",mcu_num);
    if(rdpctl_err_sts_reg[17] == 1'b1)
        `PR_DEBUG("mcu_errmon", `DEBUG, "INFO: FBDIMM UnRecoverable err detected in MCU[%d] ESR",mcu_num);
    if(rdpctl_err_sts_reg[16] == 1'b1)
        `PR_DEBUG("mcu_errmon", `DEBUG, "INFO: FBDIMM Recoverable err detected in MCU[%d] ESR",mcu_num);
`else 
	if(halt_on_mcu_err == 0)
	begin
    if(rdpctl_err_sts_reg[25] == 1'b1)
        `PR_DEBUG("mcu_errmon", `DEBUG, "INFO: Multiple Uncorrectable err detected in MCU[%d] ESR",mcu_num);
    if(rdpctl_err_sts_reg[24] == 1'b1)
        `PR_DEBUG("mcu_errmon", `DEBUG, "INFO: Multiple Correctable err detected in MCU[%d] ESR",mcu_num);
    if(rdpctl_err_sts_reg[23] == 1'b1)
        `PR_DEBUG("mcu_errmon", `DEBUG, "INFO: Correctable err detected in MCU[%d] ESR",mcu_num);
    if(rdpctl_err_sts_reg[22] == 1'b1)
        `PR_DEBUG("mcu_errmon", `DEBUG, "INFO: Uncorrectable err detected in MCU[%d] ESR",mcu_num);
    if(rdpctl_err_sts_reg[21] == 1'b1)
        `PR_DEBUG("mcu_errmon", `DEBUG, "INFO: Scrub correctable err detected in MCU[%d] ESR",mcu_num);
    if(rdpctl_err_sts_reg[20] == 1'b1)
        `PR_DEBUG("mcu_errmon", `DEBUG, "INFO: Scrub uncorrectable err detected in MCU[%d] ESR",mcu_num);
    if(rdpctl_err_sts_reg[19] == 1'b1)
        `PR_DEBUG("mcu_errmon", `DEBUG, "INFO: Out-of-bound address err detected in MCU[%d] ESR",mcu_num);
    if(rdpctl_err_sts_reg[18] == 1'b1)
        `PR_DEBUG("mcu_errmon", `DEBUG, "INFO: Multiple Out-of-bound address err detected in MCU[%d] ESR",mcu_num);
    if(rdpctl_err_sts_reg[17] == 1'b1)
        `PR_DEBUG("mcu_errmon", `DEBUG, "INFO: FBDIMM UnRecoverable err detected in MCU[%d] ESR",mcu_num);
    if(rdpctl_err_sts_reg[16] == 1'b1)
        `PR_DEBUG("mcu_errmon", `DEBUG, "INFO: FBDIMM Recoverable err detected in MCU[%d] ESR",mcu_num);
	end
	else
	begin
    if(rdpctl_err_sts_reg[25] == 1'b1)
        `PR_ERROR("mcu_errmon", `ERROR, "INFO: Multiple Uncorrectable err detected in MCU[%d] ESR",mcu_num);
    if(rdpctl_err_sts_reg[24] == 1'b1)
        `PR_ERROR("mcu_errmon", `ERROR, "INFO: Multiple Correctable err detected in MCU[%d] ESR",mcu_num);
    if(rdpctl_err_sts_reg[23] == 1'b1)
        `PR_ERROR("mcu_errmon", `ERROR, "INFO: Correctable err detected in MCU[%d] ESR",mcu_num);
    if(rdpctl_err_sts_reg[22] == 1'b1)
        `PR_ERROR("mcu_errmon", `ERROR, "INFO: Uncorrectable err detected in MCU[%d] ESR",mcu_num);
    if(rdpctl_err_sts_reg[21] == 1'b1)
        `PR_ERROR("mcu_errmon", `ERROR, "INFO: Scrub correctable err detected in MCU[%d] ESR",mcu_num);
    if(rdpctl_err_sts_reg[20] == 1'b1)
        `PR_ERROR("mcu_errmon", `ERROR, "INFO: Scrub uncorrectable err detected in MCU[%d] ESR",mcu_num);
    if(rdpctl_err_sts_reg[19] == 1'b1)
        `PR_ERROR("mcu_errmon", `ERROR, "INFO: Out-of-bound address err detected in MCU[%d] ESR",mcu_num);
    if(rdpctl_err_sts_reg[18] == 1'b1)
        `PR_ERROR("mcu_errmon", `ERROR, "INFO: Multiple Out-of-bound address err detected in MCU[%d] ESR",mcu_num);
    if(rdpctl_err_sts_reg[17] == 1'b1)
        `PR_ERROR("mcu_errmon", `ERROR, "INFO: FBDIMM UnRecoverable err detected in MCU[%d] ESR",mcu_num);
    if(rdpctl_err_sts_reg[16] == 1'b1)
        `PR_ERROR("mcu_errmon", `ERROR, "INFO: FBDIMM Recoverable err detected in MCU[%d] ESR",mcu_num);
	end
`endif

end

always @ (rdpctl_err_retry_reg)
if (enabled)
begin
    if(rdpctl_err_retry_reg[1:0] == 2'b01)
        `PR_DEBUG("mcu_errmon", `DEBUG, "INFO: No err detected on 1st retry read in MCU[%d].",mcu_num);
    if(rdpctl_err_retry_reg[1:0] == 2'b10)
        `PR_DEBUG("mcu_errmon", `DEBUG, "INFO: Correctable err detected on 1st retry read in MCU[%d].",mcu_num);
    if(rdpctl_err_retry_reg[1:0] == 2'b11)
        `PR_DEBUG("mcu_errmon", `DEBUG, "INFO: Un-Correctable err detected on 1st retry read in MCU[%d].",mcu_num);
    if(rdpctl_err_retry_reg[33:32] == 2'b01)
        `PR_DEBUG("mcu_errmon", `DEBUG, "INFO: No err detected on 2st retry read in MCU[%d].",mcu_num);
    if(rdpctl_err_retry_reg[33:32] == 2'b10)
        `PR_DEBUG("mcu_errmon", `DEBUG, "INFO: Correctable err detected on 2st retry read in MCU[%d].",mcu_num);
    if(rdpctl_err_retry_reg[33:32] == 2'b11)
        `PR_DEBUG("mcu_errmon", `DEBUG, "INFO: Un-Correctable err detected on 2st retry read in MCU[%d].",mcu_num);
end


//-----------------------------------
// Disable mcu_errmon during Warm Reset
//-----------------------------------
`ifdef MCUSAT
always @ (posedge rst_wmr_protect)
begin
  if (!($test$plusargs("mcu_errmon_disable")))
    enabled = 1'b0;
end

always @ (negedge rst_wmr_protect)
begin
  if (!($test$plusargs("mcu_errmon_disable")))
    enabled = 1'b1;
end
`else
always @ (flush_reset_complete)
begin
  if (flush_reset_complete == 1'b0) begin
   if (!($test$plusargs("mcu_errmon_disable"))) begin
    enabled = 1'b0;
    end
  end

    mcu_err_status_reg = 64'h0;
    mcu_err_retry_reg = 64'h0;

  if (flush_reset_complete == 1'b1) 
   if (!($test$plusargs("mcu_errmon_disable")))
    enabled = 1'b1;
end
`endif

/*

// BEGIN

// quadword is an integer that tells simulator to insert error on one of the 4 quad words when in dual channel mode
// note: all 4 MCUs see the same quadword 'runtime argument'

integer quadword;
always @(tb_top.mcusat_fbdimm.fbdimm_mem0.fbdimm0.amb_dram_err_inj.quadword)
    quadword = tb_top.mcusat_fbdimm.fbdimm_mem0.fbdimm0.amb_dram_err_inj.quadword ;


// MCU0
reg mcu0_sshot=0;
always @( posedge `MCU0.drif.drif_sshot_err_reg) mcu0_sshot=1;
// check DSC / DSU 
always @( posedge `MCU0.rdpctl.rdpctl_dsc_error  or  posedge `MCU0.rdpctl.rdpctl_dsu_error  )
   begin
     if (!($test$plusargs("SNG_CHANNEL")))
    begin // in dual channel mode
         if    ( ( ( quadword==1 || mcu0_sshot  ) && (`MCU0.rdpctl_err_addr_reg[1:0]==2'b01 ) ) ||
                 ( ( quadword==2                ) && (`MCU0.rdpctl_err_addr_reg[1:0]==2'b00 ) ) ||
                 ( ( quadword==3                ) && (`MCU0.rdpctl_err_addr_reg[1:0]==2'b11 ) ) ||
                 ( ( quadword==4                ) && (`MCU0.rdpctl_err_addr_reg[1:0]==2'b10 ) ) )
             begin
            `PR_DEBUG ("mcu_errmon", `DEBUG, "MCU0: err address register @ UCB 13\'h0288 incorrectly logs error address for scrub (quadword logging is reversed) *** N2 TO 2.0 BUG 120427 ***");
             mcu0_sshot=0;
             end
         else
            `PR_ERROR ("mcu_errmon", `ERROR, "MCU0: err address register @ UCB 13\'h0288  did *NOT* log error address for scrub correctly!");
     end
   end


// MCU1
reg mcu1_sshot=0;
always @( posedge `MCU1.drif.drif_sshot_err_reg) mcu1_sshot=1;
// check DSC / DSU 
always @( posedge `MCU1.rdpctl.rdpctl_dsc_error  or  posedge `MCU1.rdpctl.rdpctl_dsu_error  )
   begin
     if (!($test$plusargs("SNG_CHANNEL")))
    begin // in dual channel mode
         if    ( ( ( quadword==1 || mcu1_sshot  ) && (`MCU1.rdpctl_err_addr_reg[1:0]==2'b01 ) ) ||
                 ( ( quadword==2                ) && (`MCU1.rdpctl_err_addr_reg[1:0]==2'b00 ) ) ||
                 ( ( quadword==3                ) && (`MCU1.rdpctl_err_addr_reg[1:0]==2'b11 ) ) ||
                 ( ( quadword==4                ) && (`MCU1.rdpctl_err_addr_reg[1:0]==2'b10 ) ) )
             begin
            `PR_DEBUG ("mcu_errmon", `DEBUG, "MCU1: err address register @ UCB 13\'h0288 incorrectly logs error address for scrub (quadword logging is reversed) *** N2 TO 2.0 BUG 120427 ***");
             mcu1_sshot=0;
             end
         else
            `PR_ERROR ("mcu_errmon", `ERROR, "MCU1: err address register @ UCB 13\'h0288  did *NOT* log error address for scrub correctly!");
     end
   end


// MCU2
reg mcu2_sshot=0;
always @( posedge `MCU2.drif.drif_sshot_err_reg) mcu2_sshot=1;
// check DSC / DSU 
always @( posedge `MCU2.rdpctl.rdpctl_dsc_error  or  posedge `MCU2.rdpctl.rdpctl_dsu_error  )
   begin
     if (!($test$plusargs("SNG_CHANNEL")))
    begin // in dual channel mode
         if    ( ( ( quadword==1 || mcu2_sshot  ) && (`MCU2.rdpctl_err_addr_reg[1:0]==2'b01 ) ) ||
                 ( ( quadword==2                ) && (`MCU2.rdpctl_err_addr_reg[1:0]==2'b00 ) ) ||
                 ( ( quadword==3                ) && (`MCU2.rdpctl_err_addr_reg[1:0]==2'b11 ) ) ||
                 ( ( quadword==4                ) && (`MCU2.rdpctl_err_addr_reg[1:0]==2'b10 ) ) )
             begin
            `PR_DEBUG ("mcu_errmon", `DEBUG, "MCU2: err address register @ UCB 13\'h0288 incorrectly logs error address for scrub (quadword logging is reversed) *** N2 TO 2.0 BUG 120427 ***");
             mcu2_sshot=0;
             end
         else
            `PR_ERROR ("mcu_errmon", `ERROR, "MCU2: err address register @ UCB 13\'h0288  did *NOT* log error address for scrub correctly!");
     end
   end


// MCU3
reg mcu3_sshot=0;
always @( posedge `MCU3.drif.drif_sshot_err_reg) mcu3_sshot=1;
// check DSC / DSU 
always @( posedge `MCU3.rdpctl.rdpctl_dsc_error  or  posedge `MCU3.rdpctl.rdpctl_dsu_error  )
   begin
     if (!($test$plusargs("SNG_CHANNEL")))
    begin // in dual channel mode
         if    ( ( ( quadword==1 || mcu3_sshot  ) && (`MCU3.rdpctl_err_addr_reg[1:0]==2'b01 ) ) ||
                 ( ( quadword==2                ) && (`MCU3.rdpctl_err_addr_reg[1:0]==2'b00 ) ) ||
                 ( ( quadword==3                ) && (`MCU3.rdpctl_err_addr_reg[1:0]==2'b11 ) ) ||
                 ( ( quadword==4                ) && (`MCU3.rdpctl_err_addr_reg[1:0]==2'b10 ) ) )
             begin
            `PR_DEBUG ("mcu_errmon", `DEBUG, "MCU3: err address register @ UCB 13\'h0288 incorrectly logs error address for scrub (quadword logging is reversed) *** N2 TO 2.0 BUG 120427 ***");
             mcu3_sshot=0;
             end
         else
            `PR_ERROR ("mcu_errmon", `ERROR, "MCU3: err address register @ UCB 13\'h0288  did *NOT* log error address for scrub correctly!");
     end
   end



// END 

*/

// added

wire mcu0_esr_dac = `MCU0.rdpctl.rdpctl_dac_error_in & `MCU0.rdpctl.rdpctl_dac_error_en;
wire mcu1_esr_dac = `MCU1.rdpctl.rdpctl_dac_error_in & `MCU1.rdpctl.rdpctl_dac_error_en;
wire mcu2_esr_dac = `MCU2.rdpctl.rdpctl_dac_error_in & `MCU2.rdpctl.rdpctl_dac_error_en;
wire mcu3_esr_dac = `MCU3.rdpctl.rdpctl_dac_error_in & `MCU3.rdpctl.rdpctl_dac_error_en;

wire mcu0_esr_dau = `MCU0.rdpctl.rdpctl_dau_error_in & `MCU0.rdpctl.rdpctl_dau_error_en;
wire mcu1_esr_dau = `MCU1.rdpctl.rdpctl_dau_error_in & `MCU1.rdpctl.rdpctl_dau_error_en;
wire mcu2_esr_dau = `MCU2.rdpctl.rdpctl_dau_error_in & `MCU2.rdpctl.rdpctl_dau_error_en;
wire mcu3_esr_dau = `MCU3.rdpctl.rdpctl_dau_error_in & `MCU3.rdpctl.rdpctl_dau_error_en;

wire mcu0_esr_dsc = `MCU0.rdpctl.rdpctl_dsc_error_in & `MCU0.rdpctl.rdpctl_dsc_error_en;
wire mcu1_esr_dsc = `MCU1.rdpctl.rdpctl_dsc_error_in & `MCU1.rdpctl.rdpctl_dsc_error_en;
wire mcu2_esr_dsc = `MCU2.rdpctl.rdpctl_dsc_error_in & `MCU2.rdpctl.rdpctl_dsc_error_en;
wire mcu3_esr_dsc = `MCU3.rdpctl.rdpctl_dsc_error_in & `MCU3.rdpctl.rdpctl_dsc_error_en;

wire mcu0_esr_dsu = `MCU0.rdpctl.rdpctl_dsu_error_in & `MCU0.rdpctl.rdpctl_dsu_error_en;
wire mcu1_esr_dsu = `MCU1.rdpctl.rdpctl_dsu_error_in & `MCU1.rdpctl.rdpctl_dsu_error_en;
wire mcu2_esr_dsu = `MCU2.rdpctl.rdpctl_dsu_error_in & `MCU2.rdpctl.rdpctl_dsu_error_en;
wire mcu3_esr_dsu = `MCU3.rdpctl.rdpctl_dsu_error_in & `MCU3.rdpctl.rdpctl_dsu_error_en;


reg mcu0_l2t0_data_vld_r0_delay;
reg mcu0_l2t1_data_vld_r0_delay;
reg mcu1_l2t0_data_vld_r0_delay;
reg mcu1_l2t1_data_vld_r0_delay;
reg mcu2_l2t0_data_vld_r0_delay;
reg mcu2_l2t1_data_vld_r0_delay;
reg mcu3_l2t0_data_vld_r0_delay;
reg mcu3_l2t1_data_vld_r0_delay;

`define DELAY 3
initial mcu0_l2t0_data_vld_r0_delay = repeat(`DELAY) @(posedge l2clk) `MCU0.mcu_l2t0_data_vld_r0;
initial mcu0_l2t1_data_vld_r0_delay = repeat(`DELAY) @(posedge l2clk) `MCU0.mcu_l2t1_data_vld_r0;
initial mcu1_l2t0_data_vld_r0_delay = repeat(`DELAY) @(posedge l2clk) `MCU1.mcu_l2t0_data_vld_r0;
initial mcu1_l2t1_data_vld_r0_delay = repeat(`DELAY) @(posedge l2clk) `MCU1.mcu_l2t1_data_vld_r0;
initial mcu2_l2t0_data_vld_r0_delay = repeat(`DELAY) @(posedge l2clk) `MCU2.mcu_l2t0_data_vld_r0;
initial mcu2_l2t1_data_vld_r0_delay = repeat(`DELAY) @(posedge l2clk) `MCU2.mcu_l2t1_data_vld_r0;
initial mcu3_l2t0_data_vld_r0_delay = repeat(`DELAY) @(posedge l2clk) `MCU3.mcu_l2t0_data_vld_r0;
initial mcu3_l2t1_data_vld_r0_delay = repeat(`DELAY) @(posedge l2clk) `MCU3.mcu_l2t1_data_vld_r0;

`define MAX_CYCLE_CNT 12
reg mask_t0=0;
reg mask_t1=0;

//######     #     #####
//#     #   # #   #     #
//#     #  #   #  #
//#     # #     # #
//#     # ####### #
//#     # #     # #     #
//######  #     #  #####


always @(posedge mcu0_esr_dac) begin
if (enabled && mcu_num==2'b00) begin

    if (mcu0_l2t0_data_vld_r0_delay && !mask_t0) begin
        mask_t0=1;

    for (i=1; i<=`MAX_CYCLE_CNT; i=i+1) begin
        if (mask_t0) begin
            @(negedge l2clk);
           if (`MCU0.mcu_l2t0_secc_err_r3) 
               begin
               `PR_DEBUG("mcu_errmon", `DEBUG, "MCU0: mcu_l2t0_secc_err_r3 is asserted when MCU esr DAC is logged (after %d cycles)",i);
               mask_t0=0;
               end
           else if (i==`MAX_CYCLE_CNT)
               `PR_ERROR("mcu_errmon", `ERROR, "MCU0: mcu_l2t0_secc_err_r3 is NOT asserted when MCU esr DAC is logged (after %d cycles)",i);
        end
    end //for

    end

    if (mcu0_l2t1_data_vld_r0_delay && !mask_t1) begin
        mask_t1=1;

    for (i=1; i<=`MAX_CYCLE_CNT; i=i+1) begin
        if (mask_t1) begin
            @(negedge l2clk);
           if (`MCU0.mcu_l2t1_secc_err_r3) 
               begin
               `PR_DEBUG("mcu_errmon", `DEBUG, "MCU0: mcu_l2t1_secc_err_r3 is asserted when MCU esr DAC is logged (after %d cycles)",i);
               mask_t1=0;
               end
           else if (i==`MAX_CYCLE_CNT)
               `PR_ERROR("mcu_errmon", `ERROR, "MCU0: mcu_l2t1_secc_err_r3 is NOT asserted when MCU esr DAC is logged (after %d cycles)",i);
        end
    end //for

    end

end
end //always


always @(posedge mcu1_esr_dac) begin
if (enabled && mcu_num==2'b01) begin

    if (mcu1_l2t0_data_vld_r0_delay && !mask_t0) begin
        mask_t0=1;

    for (i=1; i<=`MAX_CYCLE_CNT; i=i+1) begin
        if (mask_t0) begin
            @(negedge l2clk);
           if (`MCU1.mcu_l2t0_secc_err_r3) 
               begin
               `PR_DEBUG("mcu_errmon", `DEBUG, "MCU1: mcu_l2t0_secc_err_r3 is asserted when MCU esr DAC is logged (after %d cycles)",i);
               mask_t0=0;
               end
           else if (i==`MAX_CYCLE_CNT)
               `PR_ERROR("mcu_errmon", `ERROR, "MCU1: mcu_l2t0_secc_err_r3 is NOT asserted when MCU esr DAC is logged (after %d cycles)",i);
        end
    end //for

    end

    if (mcu1_l2t1_data_vld_r0_delay && !mask_t1) begin
        mask_t1=1;

    for (i=1; i<=`MAX_CYCLE_CNT; i=i+1) begin
        if (mask_t1) begin
            @(negedge l2clk);
           if (`MCU1.mcu_l2t1_secc_err_r3) 
               begin
               `PR_DEBUG("mcu_errmon", `DEBUG, "MCU1: mcu_l2t1_secc_err_r3 is asserted when MCU esr DAC is logged (after %d cycles)",i);
               mask_t1=0;
               end
           else if (i==`MAX_CYCLE_CNT)
               `PR_ERROR("mcu_errmon", `ERROR, "MCU1: mcu_l2t1_secc_err_r3 is NOT asserted when MCU esr DAC is logged (after %d cycles)",i);
        end
    end //for

    end

end
end //always

always @(posedge mcu2_esr_dac) begin
if (enabled && mcu_num==2'b10) begin

    if (mcu2_l2t0_data_vld_r0_delay && !mask_t0) begin
        mask_t0=1;

    for (i=1; i<=`MAX_CYCLE_CNT; i=i+1) begin
        if (mask_t0) begin
            @(negedge l2clk);
           if (`MCU2.mcu_l2t0_secc_err_r3) 
               begin
               `PR_DEBUG("mcu_errmon", `DEBUG, "MCU2: mcu_l2t0_secc_err_r3 is asserted when MCU esr DAC is logged (after %d cycles)",i);
               mask_t0=0;
               end
           else if (i==`MAX_CYCLE_CNT)
               `PR_ERROR("mcu_errmon", `ERROR, "MCU2: mcu_l2t0_secc_err_r3 is NOT asserted when MCU esr DAC is logged (after %d cycles)",i);
        end
    end //for

    end

    if (mcu2_l2t1_data_vld_r0_delay && !mask_t1) begin
        mask_t1=1;

    for (i=1; i<=`MAX_CYCLE_CNT; i=i+1) begin
        if (mask_t1) begin
            @(negedge l2clk);
           if (`MCU2.mcu_l2t1_secc_err_r3) 
               begin
               `PR_DEBUG("mcu_errmon", `DEBUG, "MCU2: mcu_l2t1_secc_err_r3 is asserted when MCU esr DAC is logged (after %d cycles)",i);
               mask_t1=0;
               end
           else if (i==`MAX_CYCLE_CNT)
               `PR_ERROR("mcu_errmon", `ERROR, "MCU2: mcu_l2t1_secc_err_r3 is NOT asserted when MCU esr DAC is logged (after %d cycles)",i);
        end
    end //for

    end

end
end //always

always @(posedge mcu3_esr_dac) begin
if (enabled && mcu_num==2'b11) begin

    if (mcu3_l2t0_data_vld_r0_delay && !mask_t0) begin
        mask_t0=1;

    for (i=1; i<=`MAX_CYCLE_CNT; i=i+1) begin
        if (mask_t0) begin
            @(negedge l2clk);
           if (`MCU3.mcu_l2t0_secc_err_r3) 
               begin
               `PR_DEBUG("mcu_errmon", `DEBUG, "MCU3: mcu_l2t0_secc_err_r3 is asserted when MCU esr DAC is logged (after %d cycles)",i);
               mask_t0=0;
               end
           else if (i==`MAX_CYCLE_CNT)
               `PR_ERROR("mcu_errmon", `ERROR, "MCU3: mcu_l2t0_secc_err_r3 is NOT asserted when MCU esr DAC is logged (after %d cycles)",i);
        end
    end //for

    end

    if (mcu3_l2t1_data_vld_r0_delay && !mask_t1) begin
        mask_t1=1;

    for (i=1; i<=`MAX_CYCLE_CNT; i=i+1) begin
        if (mask_t1) begin
            @(negedge l2clk);
           if (`MCU3.mcu_l2t1_secc_err_r3) 
               begin
               `PR_DEBUG("mcu_errmon", `DEBUG, "MCU3: mcu_l2t1_secc_err_r3 is asserted when MCU esr DAC is logged (after %d cycles)",i);
               mask_t1=0;
               end
           else if (i==`MAX_CYCLE_CNT)
               `PR_ERROR("mcu_errmon", `ERROR, "MCU3: mcu_l2t1_secc_err_r3 is NOT asserted when MCU esr DAC is logged (after %d cycles)",i);
        end
    end //for

    end

end
end //always


//######     #    #     #
//#     #   # #   #     #
//#     #  #   #  #     #
//#     # #     # #     #
//#     # ####### #     #
//#     # #     # #     #
//######  #     #  #####


always @(posedge mcu0_esr_dau) begin
if (enabled && mcu_num==2'b00) begin

    if (mcu0_l2t0_data_vld_r0_delay && !mask_t0) begin
        mask_t0=1;

    for (i=1; i<=`MAX_CYCLE_CNT; i=i+1) begin
        if (mask_t0) begin
            @(negedge l2clk);
           if (`MCU0.mcu_l2t0_mecc_err_r3) 
               begin
               `PR_DEBUG("mcu_errmon", `DEBUG, "MCU0: mcu_l2t0_mecc_err_r3 is asserted when MCU esr DAU is logged (after %d cycles)",i);
               mask_t0=0;
               end
           else if (i==`MAX_CYCLE_CNT)
               `PR_ERROR("mcu_errmon", `ERROR, "MCU0: mcu_l2t0_mecc_err_r3 is NOT asserted when MCU esr DAU is logged (after %d cycles)",i);
        end
    end //for

    end

    if (mcu0_l2t1_data_vld_r0_delay && !mask_t1) begin
        mask_t1=1;

    for (i=1; i<=`MAX_CYCLE_CNT; i=i+1) begin
        if (mask_t1) begin
            @(negedge l2clk);
           if (`MCU0.mcu_l2t1_mecc_err_r3) 
               begin
               `PR_DEBUG("mcu_errmon", `DEBUG, "MCU0: mcu_l2t1_mecc_err_r3 is asserted when MCU esr DAU is logged (after %d cycles)",i);
               mask_t1=0;
               end
           else if (i==`MAX_CYCLE_CNT)
               `PR_ERROR("mcu_errmon", `ERROR, "MCU0: mcu_l2t1_mecc_err_r3 is NOT asserted when MCU esr DAU is logged (after %d cycles)",i);
        end
    end //for

    end

end
end //always


always @(posedge mcu1_esr_dau) begin
if (enabled && mcu_num==2'b01) begin

    if (mcu1_l2t0_data_vld_r0_delay && !mask_t0) begin
        mask_t0=1;

    for (i=1; i<=`MAX_CYCLE_CNT; i=i+1) begin
        if (mask_t0) begin
            @(negedge l2clk);
           if (`MCU1.mcu_l2t0_mecc_err_r3) 
               begin
               `PR_DEBUG("mcu_errmon", `DEBUG, "MCU1: mcu_l2t0_mecc_err_r3 is asserted when MCU esr DAU is logged (after %d cycles)",i);
               mask_t0=0;
               end
           else if (i==`MAX_CYCLE_CNT)
               `PR_ERROR("mcu_errmon", `ERROR, "MCU1: mcu_l2t0_mecc_err_r3 is NOT asserted when MCU esr DAU is logged (after %d cycles)",i);
        end
    end //for

    end

    if (mcu1_l2t1_data_vld_r0_delay && !mask_t1) begin
        mask_t1=1;

    for (i=1; i<=`MAX_CYCLE_CNT; i=i+1) begin
        if (mask_t1) begin
            @(negedge l2clk);
           if (`MCU1.mcu_l2t1_mecc_err_r3) 
               begin
               `PR_DEBUG("mcu_errmon", `DEBUG, "MCU1: mcu_l2t1_mecc_err_r3 is asserted when MCU esr DAU is logged (after %d cycles)",i);
               mask_t1=0;
               end
           else if (i==`MAX_CYCLE_CNT)
               `PR_ERROR("mcu_errmon", `ERROR, "MCU1: mcu_l2t1_mecc_err_r3 is NOT asserted when MCU esr DAU is logged (after %d cycles)",i);
        end
    end //for

    end

end
end //always

always @(posedge mcu2_esr_dau) begin
if (enabled && mcu_num==2'b10) begin

    if (mcu2_l2t0_data_vld_r0_delay && !mask_t0) begin
        mask_t0=1;

    for (i=1; i<=`MAX_CYCLE_CNT; i=i+1) begin
        if (mask_t0) begin
            @(negedge l2clk);
           if (`MCU2.mcu_l2t0_mecc_err_r3) 
               begin
               `PR_DEBUG("mcu_errmon", `DEBUG, "MCU2: mcu_l2t0_mecc_err_r3 is asserted when MCU esr DAU is logged (after %d cycles)",i);
               mask_t0=0;
               end
           else if (i==`MAX_CYCLE_CNT)
               `PR_ERROR("mcu_errmon", `ERROR, "MCU2: mcu_l2t0_mecc_err_r3 is NOT asserted when MCU esr DAU is logged (after %d cycles)",i);
        end
    end //for

    end

    if (mcu2_l2t1_data_vld_r0_delay && !mask_t1) begin
        mask_t1=1;

    for (i=1; i<=`MAX_CYCLE_CNT; i=i+1) begin
        if (mask_t1) begin
            @(negedge l2clk);
           if (`MCU2.mcu_l2t1_mecc_err_r3) 
               begin
               `PR_DEBUG("mcu_errmon", `DEBUG, "MCU2: mcu_l2t1_mecc_err_r3 is asserted when MCU esr DAU is logged (after %d cycles)",i);
               mask_t1=0;
               end
           else if (i==`MAX_CYCLE_CNT)
               `PR_ERROR("mcu_errmon", `ERROR, "MCU2: mcu_l2t1_mecc_err_r3 is NOT asserted when MCU esr DAU is logged (after %d cycles)",i);
        end
    end //for

    end

end
end //always

always @(posedge mcu3_esr_dau) begin
if (enabled && mcu_num==2'b11) begin

    if (mcu3_l2t0_data_vld_r0_delay && !mask_t0) begin
        mask_t0=1;

    for (i=1; i<=`MAX_CYCLE_CNT; i=i+1) begin
        if (mask_t0) begin
            @(negedge l2clk);
           if (`MCU3.mcu_l2t0_mecc_err_r3) 
               begin
               `PR_DEBUG("mcu_errmon", `DEBUG, "MCU3: mcu_l2t0_mecc_err_r3 is asserted when MCU esr DAU is logged (after %d cycles)",i);
               mask_t0=0;
               end
           else if (i==`MAX_CYCLE_CNT)
               `PR_ERROR("mcu_errmon", `ERROR, "MCU3: mcu_l2t0_mecc_err_r3 is NOT asserted when MCU esr DAU is logged (after %d cycles)",i);
        end
    end //for

    end

    if (mcu3_l2t1_data_vld_r0_delay && !mask_t1) begin
        mask_t1=1;

    for (i=1; i<=`MAX_CYCLE_CNT; i=i+1) begin
        if (mask_t1) begin
            @(negedge l2clk);
           if (`MCU3.mcu_l2t1_mecc_err_r3) 
               begin
               `PR_DEBUG("mcu_errmon", `DEBUG, "MCU3: mcu_l2t1_mecc_err_r3 is asserted when MCU esr DAU is logged (after %d cycles)",i);
               mask_t1=0;
               end
           else if (i==`MAX_CYCLE_CNT)
               `PR_ERROR("mcu_errmon", `ERROR, "MCU3: mcu_l2t1_mecc_err_r3 is NOT asserted when MCU esr DAU is logged (after %d cycles)",i);
        end
    end //for

    end

end
end //always


/*----------------------------------------------------------------------------*/

//MCU0

   reg mcu0_rdata_scrb0_err_valid_d1, mcu0_rdata_scrb1_err_valid_d1;

    always @(posedge l2clk) begin
       mcu0_rdata_scrb0_err_valid_d1 <= tb_top.cpu.mcu0.rdata.rdata_scrb0_err_valid;
       mcu0_rdata_scrb1_err_valid_d1 <= tb_top.cpu.mcu0.rdata.rdata_scrb1_err_valid;
    end

wire mcu0_scrb0_secc_missed = tb_top.cpu.mcu0.rdata.readdp_l2_secc_err_dly1 &
         mcu0_rdata_scrb0_err_valid_d1 &
         tb_top.cpu.mcu0.rdata.rdata_ddr_cmp_sync_en_d12 &
         ~tb_top.cpu.mcu0.rdata.rdata_scrb0_err_valid;

wire mcu0_scrb0_mecc_missed = tb_top.cpu.mcu0.rdata.readdp_l2_mecc_err_dly1 &
         mcu0_rdata_scrb0_err_valid_d1 &
         tb_top.cpu.mcu0.rdata.rdata_ddr_cmp_sync_en_d12 &
         ~tb_top.cpu.mcu0.rdata.rdata_scrb0_err_valid;

wire mcu0_scrb1_secc_missed = tb_top.cpu.mcu0.rdata.readdp_l2_secc_err_dly1 &
         mcu0_rdata_scrb1_err_valid_d1 &
         tb_top.cpu.mcu0.rdata.rdata_ddr_cmp_sync_en_d12 &
         ~tb_top.cpu.mcu0.rdata.rdata_scrb1_err_valid;

wire mcu0_scrb1_mecc_missed = tb_top.cpu.mcu0.rdata.readdp_l2_mecc_err_dly1 &
         mcu0_rdata_scrb1_err_valid_d1 &
         tb_top.cpu.mcu0.rdata.rdata_ddr_cmp_sync_en_d12 &
         ~tb_top.cpu.mcu0.rdata.rdata_scrb1_err_valid;
/*----------------------------------------------------------------------------*/

//MCU1

   reg mcu1_rdata_scrb0_err_valid_d1, mcu1_rdata_scrb1_err_valid_d1;

    always @(posedge l2clk) begin
       mcu1_rdata_scrb0_err_valid_d1 <= tb_top.cpu.mcu1.rdata.rdata_scrb0_err_valid;
       mcu1_rdata_scrb1_err_valid_d1 <= tb_top.cpu.mcu1.rdata.rdata_scrb1_err_valid;
    end

wire mcu1_scrb0_secc_missed = tb_top.cpu.mcu1.rdata.readdp_l2_secc_err_dly1 &
         mcu1_rdata_scrb0_err_valid_d1 &
         tb_top.cpu.mcu1.rdata.rdata_ddr_cmp_sync_en_d12 &
         ~tb_top.cpu.mcu1.rdata.rdata_scrb0_err_valid;

wire mcu1_scrb0_mecc_missed = tb_top.cpu.mcu1.rdata.readdp_l2_mecc_err_dly1 &
         mcu1_rdata_scrb0_err_valid_d1 &
         tb_top.cpu.mcu1.rdata.rdata_ddr_cmp_sync_en_d12 &
         ~tb_top.cpu.mcu1.rdata.rdata_scrb0_err_valid;

wire mcu1_scrb1_secc_missed = tb_top.cpu.mcu1.rdata.readdp_l2_secc_err_dly1 &
         mcu1_rdata_scrb1_err_valid_d1 &
         tb_top.cpu.mcu1.rdata.rdata_ddr_cmp_sync_en_d12 &
         ~tb_top.cpu.mcu1.rdata.rdata_scrb1_err_valid;

wire mcu1_scrb1_mecc_missed = tb_top.cpu.mcu1.rdata.readdp_l2_mecc_err_dly1 &
         mcu1_rdata_scrb1_err_valid_d1 &
         tb_top.cpu.mcu1.rdata.rdata_ddr_cmp_sync_en_d12 &
         ~tb_top.cpu.mcu1.rdata.rdata_scrb1_err_valid;
/*----------------------------------------------------------------------------*/

//MCU2

   reg mcu2_rdata_scrb0_err_valid_d1, mcu2_rdata_scrb1_err_valid_d1;

    always @(posedge l2clk) begin
       mcu2_rdata_scrb0_err_valid_d1 <= tb_top.cpu.mcu2.rdata.rdata_scrb0_err_valid;
       mcu2_rdata_scrb1_err_valid_d1 <= tb_top.cpu.mcu2.rdata.rdata_scrb1_err_valid;
    end

wire mcu2_scrb0_secc_missed = tb_top.cpu.mcu2.rdata.readdp_l2_secc_err_dly1 &
         mcu2_rdata_scrb0_err_valid_d1 &
         tb_top.cpu.mcu2.rdata.rdata_ddr_cmp_sync_en_d12 &
         ~tb_top.cpu.mcu2.rdata.rdata_scrb0_err_valid;

wire mcu2_scrb0_mecc_missed = tb_top.cpu.mcu2.rdata.readdp_l2_mecc_err_dly1 &
         mcu2_rdata_scrb0_err_valid_d1 &
         tb_top.cpu.mcu2.rdata.rdata_ddr_cmp_sync_en_d12 &
         ~tb_top.cpu.mcu2.rdata.rdata_scrb0_err_valid;

wire mcu2_scrb1_secc_missed = tb_top.cpu.mcu2.rdata.readdp_l2_secc_err_dly1 &
         mcu2_rdata_scrb1_err_valid_d1 &
         tb_top.cpu.mcu2.rdata.rdata_ddr_cmp_sync_en_d12 &
         ~tb_top.cpu.mcu2.rdata.rdata_scrb1_err_valid;

wire mcu2_scrb1_mecc_missed = tb_top.cpu.mcu2.rdata.readdp_l2_mecc_err_dly1 &
         mcu2_rdata_scrb1_err_valid_d1 &
         tb_top.cpu.mcu2.rdata.rdata_ddr_cmp_sync_en_d12 &
         ~tb_top.cpu.mcu2.rdata.rdata_scrb1_err_valid;
/*----------------------------------------------------------------------------*/

//MCU3

   reg mcu3_rdata_scrb0_err_valid_d1, mcu3_rdata_scrb1_err_valid_d1;

    always @(posedge l2clk) begin
       mcu3_rdata_scrb0_err_valid_d1 <= tb_top.cpu.mcu3.rdata.rdata_scrb0_err_valid;
       mcu3_rdata_scrb1_err_valid_d1 <= tb_top.cpu.mcu3.rdata.rdata_scrb1_err_valid;
    end

wire mcu3_scrb0_secc_missed = tb_top.cpu.mcu3.rdata.readdp_l2_secc_err_dly1 &
         mcu3_rdata_scrb0_err_valid_d1 &
         tb_top.cpu.mcu3.rdata.rdata_ddr_cmp_sync_en_d12 &
         ~tb_top.cpu.mcu3.rdata.rdata_scrb0_err_valid;

wire mcu3_scrb0_mecc_missed = tb_top.cpu.mcu3.rdata.readdp_l2_mecc_err_dly1 &
         mcu3_rdata_scrb0_err_valid_d1 &
         tb_top.cpu.mcu3.rdata.rdata_ddr_cmp_sync_en_d12 &
         ~tb_top.cpu.mcu3.rdata.rdata_scrb0_err_valid;

wire mcu3_scrb1_secc_missed = tb_top.cpu.mcu3.rdata.readdp_l2_secc_err_dly1 &
         mcu3_rdata_scrb1_err_valid_d1 &
         tb_top.cpu.mcu3.rdata.rdata_ddr_cmp_sync_en_d12 &
         ~tb_top.cpu.mcu3.rdata.rdata_scrb1_err_valid;

wire mcu3_scrb1_mecc_missed = tb_top.cpu.mcu3.rdata.readdp_l2_mecc_err_dly1 &
         mcu3_rdata_scrb1_err_valid_d1 &
         tb_top.cpu.mcu3.rdata.rdata_ddr_cmp_sync_en_d12 &
         ~tb_top.cpu.mcu3.rdata.rdata_scrb1_err_valid;
/*----------------------------------------------------------------------------*/



//######   #####   #####
//#     # #     # #     #
//#     # #       #
//#     #  #####  #
//#     #       # #
//#     # #     # #     #
//######   #####   #####


always @(posedge mcu0_esr_dsc) begin
if (enabled && mcu_num==2'b00) begin

    if (!mask_t0 && `MCU0.drif.drif_scrub_bank_adr[0]==0) begin
        mask_t0=1;

    for (i=1; i<=`MAX_CYCLE_CNT; i=i+1) begin
        if (mask_t0) begin
            @(negedge l2clk);
           if (`MCU0.mcu_l2t0_scb_secc_err) 
               begin
               `PR_DEBUG("mcu_errmon", `DEBUG, "MCU0: mcu_l2t0_scb_secc_err is asserted when MCU esr DSC is logged (after %d cycles)",i);
               mask_t0=0;
               end
           else if (mcu0_scrb0_secc_missed==1)
               begin
               `PR_DEBUG("mcu_errmon", `DEBUG, "MCU0: mcu_l2t0_scb_secc_err is NOT asserted when MCU esr DSC is logged (after %d cycles) *** N2 TO 2.0 BUG 120330 *** ",i);
               mask_t0=0;
               end
           else if (i==`MAX_CYCLE_CNT)
               `PR_ERROR("mcu_errmon", `ERROR, "MCU0: mcu_l2t0_scb_secc_err is NOT asserted when MCU esr DSC is logged (after %d cycles)",i);
        end
    end //for

    end

    if (!mask_t1 && `MCU0.drif.drif_scrub_bank_adr[0]==1) begin
        mask_t1=1;

    for (i=1; i<=`MAX_CYCLE_CNT; i=i+1) begin
        if (mask_t1) begin
            @(negedge l2clk);
           if (`MCU0.mcu_l2t1_scb_secc_err) 
               begin
               `PR_DEBUG("mcu_errmon", `DEBUG, "MCU0: mcu_l2t1_scb_secc_err is asserted when MCU esr DSC is logged (after %d cycles)",i);
               mask_t1=0;
               end
           else if (mcu0_scrb1_secc_missed==1)
               begin
               `PR_DEBUG("mcu_errmon", `DEBUG, "MCU0: mcu_l2t1_scb_secc_err is NOT asserted when MCU esr DSC is logged (after %d cycles) *** N2 TO 2.0 BUG 120330 *** ",i);
               mask_t1=0;
               end
           else if (i==`MAX_CYCLE_CNT)
               `PR_ERROR("mcu_errmon", `ERROR, "MCU0: mcu_l2t1_scb_secc_err is NOT asserted when MCU esr DSC is logged (after %d cycles)",i);
        end
    end //for

    end

end
end //always


always @(posedge mcu1_esr_dsc) begin
if (enabled && mcu_num==2'b01) begin

    if (!mask_t0 && `MCU1.drif.drif_scrub_bank_adr[0]==0) begin
        mask_t0=1;

    for (i=1; i<=`MAX_CYCLE_CNT; i=i+1) begin
        if (mask_t0) begin
            @(negedge l2clk);
           if (`MCU1.mcu_l2t0_scb_secc_err) 
               begin
               `PR_DEBUG("mcu_errmon", `DEBUG, "MCU1: mcu_l2t0_scb_secc_err is asserted when MCU esr DSC is logged (after %d cycles)",i);
               mask_t0=0;
               end
           else if (mcu1_scrb0_secc_missed==1)
               begin
               `PR_DEBUG("mcu_errmon", `DEBUG, "MCU1: mcu_l2t0_scb_secc_err is NOT asserted when MCU esr DSC is logged (after %d cycles) *** N2 TO 2.0 BUG 120330 *** ",i);
               mask_t0=0;
               end
           else if (i==`MAX_CYCLE_CNT)
               `PR_ERROR("mcu_errmon", `ERROR, "MCU1: mcu_l2t0_scb_secc_err is NOT asserted when MCU esr DSC is logged (after %d cycles)",i);
        end
    end //for

    end

    if (!mask_t1 && `MCU1.drif.drif_scrub_bank_adr[0]==1) begin
        mask_t1=1;

    for (i=1; i<=`MAX_CYCLE_CNT; i=i+1) begin
        if (mask_t1) begin
            @(negedge l2clk);
           if (`MCU1.mcu_l2t1_scb_secc_err) 
               begin
               `PR_DEBUG("mcu_errmon", `DEBUG, "MCU1: mcu_l2t1_scb_secc_err is asserted when MCU esr DSC is logged (after %d cycles)",i);
               mask_t1=0;
               end
           else if (mcu1_scrb1_secc_missed==1)
               begin
               `PR_DEBUG("mcu_errmon", `DEBUG, "MCU1: mcu_l2t1_scb_secc_err is NOT asserted when MCU esr DSC is logged (after %d cycles) *** N2 TO 2.0 BUG 120330 *** ",i);
               mask_t1=0;
               end
           else if (i==`MAX_CYCLE_CNT)
               `PR_ERROR("mcu_errmon", `ERROR, "MCU1: mcu_l2t1_scb_secc_err is NOT asserted when MCU esr DSC is logged (after %d cycles)",i);
        end
    end //for

    end

end
end //always

always @(posedge mcu2_esr_dsc) begin
if (enabled && mcu_num==2'b10) begin

    if (!mask_t0 && `MCU2.drif.drif_scrub_bank_adr[0]==0) begin
        mask_t0=1;

    for (i=1; i<=`MAX_CYCLE_CNT; i=i+1) begin
        if (mask_t0) begin
            @(negedge l2clk);
           if (`MCU2.mcu_l2t0_scb_secc_err) 
               begin
               `PR_DEBUG("mcu_errmon", `DEBUG, "MCU2: mcu_l2t0_scb_secc_err is asserted when MCU esr DSC is logged (after %d cycles)",i);
               mask_t0=0;
               end
           else if (mcu2_scrb0_secc_missed==1)
               begin
               `PR_DEBUG("mcu_errmon", `DEBUG, "MCU2: mcu_l2t0_scb_secc_err is NOT asserted when MCU esr DSC is logged (after %d cycles) *** N2 TO 2.0 BUG 120330 *** ",i);
               mask_t0=0;
               end
           else if (i==`MAX_CYCLE_CNT)
               `PR_ERROR("mcu_errmon", `ERROR, "MCU2: mcu_l2t0_scb_secc_err is NOT asserted when MCU esr DSC is logged (after %d cycles)",i);
        end
    end //for

    end

    if (!mask_t1 && `MCU2.drif.drif_scrub_bank_adr[0]==1) begin
        mask_t1=1;

    for (i=1; i<=`MAX_CYCLE_CNT; i=i+1) begin
        if (mask_t1) begin
            @(negedge l2clk);
           if (`MCU2.mcu_l2t1_scb_secc_err) 
               begin
               `PR_DEBUG("mcu_errmon", `DEBUG, "MCU2: mcu_l2t1_scb_secc_err is asserted when MCU esr DSC is logged (after %d cycles)",i);
               mask_t1=0;
               end
           else if (mcu2_scrb1_secc_missed==1)
               begin
               `PR_DEBUG("mcu_errmon", `DEBUG, "MCU2: mcu_l2t1_scb_secc_err is NOT asserted when MCU esr DSC is logged (after %d cycles) *** N2 TO 2.0 BUG 120330 *** ",i);
               mask_t1=0;
               end
           else if (i==`MAX_CYCLE_CNT)
               `PR_ERROR("mcu_errmon", `ERROR, "MCU2: mcu_l2t1_scb_secc_err is NOT asserted when MCU esr DSC is logged (after %d cycles)",i);
        end
    end //for

    end

end
end //always

always @(posedge mcu3_esr_dsc) begin
if (enabled && mcu_num==2'b11) begin

    if (!mask_t0 && `MCU3.drif.drif_scrub_bank_adr[0]==0) begin
        mask_t0=1;

    for (i=1; i<=`MAX_CYCLE_CNT; i=i+1) begin
        if (mask_t0) begin
            @(negedge l2clk);
           if (`MCU3.mcu_l2t0_scb_secc_err) 
               begin
               `PR_DEBUG("mcu_errmon", `DEBUG, "MCU3: mcu_l2t0_scb_secc_err is asserted when MCU esr DSC is logged (after %d cycles)",i);
               mask_t0=0;
               end
           else if (mcu3_scrb0_secc_missed==1)
               begin
               `PR_DEBUG("mcu_errmon", `DEBUG, "MCU3: mcu_l2t0_scb_secc_err is NOT asserted when MCU esr DSC is logged (after %d cycles) *** N2 TO 2.0 BUG 120330 *** ",i);
               mask_t0=0;
               end
           else if (i==`MAX_CYCLE_CNT)
               `PR_ERROR("mcu_errmon", `ERROR, "MCU3: mcu_l2t0_scb_secc_err is NOT asserted when MCU esr DSC is logged (after %d cycles)",i);
        end
    end //for

    end

    if (!mask_t1 && `MCU3.drif.drif_scrub_bank_adr[0]==1) begin
        mask_t1=1;

    for (i=1; i<=`MAX_CYCLE_CNT; i=i+1) begin
        if (mask_t1) begin
            @(negedge l2clk);
           if (`MCU3.mcu_l2t1_scb_secc_err) 
               begin
               `PR_DEBUG("mcu_errmon", `DEBUG, "MCU3: mcu_l2t1_scb_secc_err is asserted when MCU esr DSC is logged (after %d cycles)",i);
               mask_t1=0;
               end
           else if (mcu3_scrb1_secc_missed==1)
               begin
               `PR_DEBUG("mcu_errmon", `DEBUG, "MCU3: mcu_l2t1_scb_secc_err is NOT asserted when MCU esr DSC is logged (after %d cycles) *** N2 TO 2.0 BUG 120330 *** ",i);
               mask_t1=0;
               end
           else if (i==`MAX_CYCLE_CNT)
               `PR_ERROR("mcu_errmon", `ERROR, "MCU3: mcu_l2t1_scb_secc_err is NOT asserted when MCU esr DSC is logged (after %d cycles)",i);
        end
    end //for

    end

end
end //always



//######   #####  #     #
//#     # #     # #     #
//#     # #       #     #
//#     #  #####  #     #
//#     #       # #     #
//#     # #     # #     #
//######   #####   #####


always @(posedge mcu0_esr_dsu) begin
if (enabled && mcu_num==2'b00) begin

    if (!mask_t0 && `MCU0.drif.drif_scrub_bank_adr[0]==0) begin
        mask_t0=1;

    for (i=1; i<=`MAX_CYCLE_CNT; i=i+1) begin
        if (mask_t0) begin
            @(negedge l2clk);
           if (`MCU0.mcu_l2t0_scb_mecc_err) 
               begin
               `PR_DEBUG("mcu_errmon", `DEBUG, "MCU0: mcu_l2t0_scb_mecc_err is asserted when MCU esr DSU is logged (after %d cycles)",i);
               mask_t0=0;
               end
           else if (mcu0_scrb0_mecc_missed==1)
               begin
               `PR_DEBUG("mcu_errmon", `DEBUG, "MCU0: mcu_l2t0_scb_mecc_err is NOT asserted when MCU esr DSU is logged (after %d cycles) *** N2 TO 2.0 BUG 120330 *** ",i);
               mask_t0=0;
               end
           else if (i==`MAX_CYCLE_CNT)
               `PR_ERROR("mcu_errmon", `ERROR, "MCU0: mcu_l2t0_scb_mecc_err is NOT asserted when MCU esr DSU is logged (after %d cycles)",i);
        end
    end //for

    end

    if (!mask_t1 && `MCU0.drif.drif_scrub_bank_adr[0]==1) begin
        mask_t1=1;

    for (i=1; i<=`MAX_CYCLE_CNT; i=i+1) begin
        if (mask_t1) begin
            @(negedge l2clk);
           if (`MCU0.mcu_l2t1_scb_mecc_err) 
               begin
               `PR_DEBUG("mcu_errmon", `DEBUG, "MCU0: mcu_l2t1_scb_mecc_err is asserted when MCU esr DSU is logged (after %d cycles)",i);
               mask_t1=0;
               end
           else if (mcu0_scrb1_mecc_missed==1)
               begin
               `PR_DEBUG("mcu_errmon", `DEBUG, "MCU0: mcu_l2t1_scb_mecc_err is NOT asserted when MCU esr DSU is logged (after %d cycles) *** N2 TO 2.0 BUG 120330 *** ",i);
               mask_t1=0;
               end
           else if (i==`MAX_CYCLE_CNT)
               `PR_ERROR("mcu_errmon", `ERROR, "MCU0: mcu_l2t1_scb_mecc_err is NOT asserted when MCU esr DSU is logged (after %d cycles)",i);
        end
    end //for

    end

end
end //always


always @(posedge mcu1_esr_dsu) begin
if (enabled && mcu_num==2'b01) begin

    if (!mask_t0 && `MCU1.drif.drif_scrub_bank_adr[0]==0) begin
        mask_t0=1;

    for (i=1; i<=`MAX_CYCLE_CNT; i=i+1) begin
        if (mask_t0) begin
            @(negedge l2clk);
           if (`MCU1.mcu_l2t0_scb_mecc_err) 
               begin
               `PR_DEBUG("mcu_errmon", `DEBUG, "MCU1: mcu_l2t0_scb_mecc_err is asserted when MCU esr DSU is logged (after %d cycles)",i);
               mask_t0=0;
               end
           else if (mcu1_scrb0_mecc_missed==1)
               begin
               `PR_DEBUG("mcu_errmon", `DEBUG, "MCU1: mcu_l2t0_scb_mecc_err is NOT asserted when MCU esr DSU is logged (after %d cycles) *** N2 TO 2.0 BUG 120330 *** ",i);
               mask_t0=0;
               end
           else if (i==`MAX_CYCLE_CNT)
               `PR_ERROR("mcu_errmon", `ERROR, "MCU1: mcu_l2t0_scb_mecc_err is NOT asserted when MCU esr DSU is logged (after %d cycles)",i);
        end
    end //for

    end

    if (!mask_t1 && `MCU1.drif.drif_scrub_bank_adr[0]==1) begin
        mask_t1=1;

    for (i=1; i<=`MAX_CYCLE_CNT; i=i+1) begin
        if (mask_t1) begin
            @(negedge l2clk);
           if (`MCU1.mcu_l2t1_scb_mecc_err) 
               begin
               `PR_DEBUG("mcu_errmon", `DEBUG, "MCU1: mcu_l2t1_scb_mecc_err is asserted when MCU esr DSU is logged (after %d cycles)",i);
               mask_t1=0;
               end
           else if (mcu1_scrb1_mecc_missed==1)
               begin
               `PR_DEBUG("mcu_errmon", `DEBUG, "MCU1: mcu_l2t1_scb_mecc_err is NOT asserted when MCU esr DSU is logged (after %d cycles) *** N2 TO 2.0 BUG 120330 *** ",i);
               mask_t1=0;
               end
           else if (i==`MAX_CYCLE_CNT)
               `PR_ERROR("mcu_errmon", `ERROR, "MCU1: mcu_l2t1_scb_mecc_err is NOT asserted when MCU esr DSU is logged (after %d cycles)",i);
        end
    end //for

    end

end
end //always

always @(posedge mcu2_esr_dsu) begin
if (enabled && mcu_num==2'b10) begin

    if (!mask_t0 && `MCU2.drif.drif_scrub_bank_adr[0]==0) begin
        mask_t0=1;

    for (i=1; i<=`MAX_CYCLE_CNT; i=i+1) begin
        if (mask_t0) begin
            @(negedge l2clk);
           if (`MCU2.mcu_l2t0_scb_mecc_err) 
               begin
               `PR_DEBUG("mcu_errmon", `DEBUG, "MCU2: mcu_l2t0_scb_mecc_err is asserted when MCU esr DSU is logged (after %d cycles)",i);
               mask_t0=0;
               end
           else if (mcu2_scrb0_mecc_missed==1)
               begin
               `PR_DEBUG("mcu_errmon", `DEBUG, "MCU2: mcu_l2t0_scb_mecc_err is NOT asserted when MCU esr DSU is logged (after %d cycles) *** N2 TO 2.0 BUG 120330 *** ",i);
               mask_t0=0;
               end
           else if (i==`MAX_CYCLE_CNT)
               `PR_ERROR("mcu_errmon", `ERROR, "MCU2: mcu_l2t0_scb_mecc_err is NOT asserted when MCU esr DSU is logged (after %d cycles)",i);
        end
    end //for

    end

    if (!mask_t1 && `MCU2.drif.drif_scrub_bank_adr[0]==1) begin
        mask_t1=1;

    for (i=1; i<=`MAX_CYCLE_CNT; i=i+1) begin
        if (mask_t1) begin
            @(negedge l2clk);
           if (`MCU2.mcu_l2t1_scb_mecc_err) 
               begin
               `PR_DEBUG("mcu_errmon", `DEBUG, "MCU2: mcu_l2t1_scb_mecc_err is asserted when MCU esr DSU is logged (after %d cycles)",i);
               mask_t1=0;
               end
           else if (mcu2_scrb1_mecc_missed==1)
               begin
               `PR_DEBUG("mcu_errmon", `DEBUG, "MCU2: mcu_l2t1_scb_mecc_err is NOT asserted when MCU esr DSU is logged (after %d cycles) *** N2 TO 2.0 BUG 120330 *** ",i);
               mask_t1=0;
               end
           else if (i==`MAX_CYCLE_CNT)
               `PR_ERROR("mcu_errmon", `ERROR, "MCU2: mcu_l2t1_scb_mecc_err is NOT asserted when MCU esr DSU is logged (after %d cycles)",i);
        end
    end //for

    end

end
end //always

always @(posedge mcu3_esr_dsu) begin
if (enabled && mcu_num==2'b11) begin

    if (!mask_t0 && `MCU3.drif.drif_scrub_bank_adr[0]==0) begin
        mask_t0=1;

    for (i=1; i<=`MAX_CYCLE_CNT; i=i+1) begin
        if (mask_t0) begin
            @(negedge l2clk);
           if (`MCU3.mcu_l2t0_scb_mecc_err) 
               begin
               `PR_DEBUG("mcu_errmon", `DEBUG, "MCU3: mcu_l2t0_scb_mecc_err is asserted when MCU esr DSU is logged (after %d cycles)",i);
               mask_t0=0;
               end
           else if (mcu3_scrb0_mecc_missed==1)
               begin
               `PR_DEBUG("mcu_errmon", `DEBUG, "MCU3: mcu_l2t0_scb_mecc_err is NOT asserted when MCU esr DSU is logged (after %d cycles) *** N2 TO 2.0 BUG 120330 *** ",i);
               mask_t0=0;
               end
           else if (i==`MAX_CYCLE_CNT)
               `PR_ERROR("mcu_errmon", `ERROR, "MCU3: mcu_l2t0_scb_mecc_err is NOT asserted when MCU esr DSU is logged (after %d cycles)",i);
        end
    end //for

    end

    if (!mask_t1 && `MCU3.drif.drif_scrub_bank_adr[0]==1) begin
        mask_t1=1;

    for (i=1; i<=`MAX_CYCLE_CNT; i=i+1) begin
        if (mask_t1) begin
            @(negedge l2clk);
           if (`MCU3.mcu_l2t1_scb_mecc_err) 
               begin
               `PR_DEBUG("mcu_errmon", `DEBUG, "MCU3: mcu_l2t1_scb_mecc_err is asserted when MCU esr DSU is logged (after %d cycles)",i);
               mask_t1=0;
               end
           else if (mcu3_scrb1_mecc_missed==1)
               begin
               `PR_DEBUG("mcu_errmon", `DEBUG, "MCU3: mcu_l2t1_scb_mecc_err is NOT asserted when MCU esr DSU is logged (after %d cycles) *** N2 TO 2.0 BUG 120330 *** ",i);
               mask_t1=0;
               end
           else if (i==`MAX_CYCLE_CNT)
               `PR_ERROR("mcu_errmon", `ERROR, "MCU3: mcu_l2t1_scb_mecc_err is NOT asserted when MCU esr DSU is logged (after %d cycles)",i);
        end
    end //for

    end

end
end //always


`ifndef MCUSAT

// added this code for " -vcs_run_args=+MCU_BUG_111726 "

`define CYCLE_CNT_111726 10

reg mask_t0_111726=0;
reg mask_t1_111726=0;

// mcu0
always @( tb_top.cpu.mcu0.rdpctl_err_sts_reg[25:16] ) begin

if ( $test$plusargs("MCU_BUG_111726") && mcu_num==2'b00 ) begin

if (!mask_t0_111726) 
	mask_t0_111726=1;
for (i=1; i<=`CYCLE_CNT_111726; i=i+1) begin
    if (mask_t0_111726) 
    begin
    @(negedge l2clk);
        if ( tb_top.cpu.mcu0.mcu_l2t0_secc_err_r3==1 && tb_top.cpu.mcu0.mcu_l2t0_mecc_err_r3==1 ) begin
            `PR_DEBUG("mcu_errmon", `DEBUG, "MCU0: *BOTH* mcu_l2t0_secc_err_r3 and mcu_l2t0_mecc_err_r3 are asserted at the same time !! (after %d cycles) *** N2 T.O.2.0 BUG 111726 *** ",i);
            mask_t0_111726=0;
        end
    end
end

if (!mask_t1_111726) 
	mask_t1_111726=1;
for (i=1; i<=`CYCLE_CNT_111726; i=i+1) begin
    if (mask_t1_111726) 
    begin
    @(negedge l2clk);
        if ( tb_top.cpu.mcu0.mcu_l2t1_secc_err_r3==1 && tb_top.cpu.mcu0.mcu_l2t1_mecc_err_r3==1 ) begin
            `PR_DEBUG("mcu_errmon", `DEBUG, "MCU0: *BOTH* mcu_l2t1_secc_err_r3 and mcu_l2t1_mecc_err_r3 are asserted at the same time !! (after %d cycles) *** N2 T.O.2.0 BUG 111726 *** ",i);
            mask_t1_111726=0;
            end
    end
end


end
end

`endif


endmodule
