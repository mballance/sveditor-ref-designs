// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: dmu_int_relocation_cov_mon.v
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
module mondo_reloc_cov_fsm (  clk,
                              rst_l,
                              im2rm_mdo_enq,
                              current_thread_id,
                              current_intctl_id,
                              current_mondo_intq_id,
                              int_ctl_id,
                              my_mondo_id,
                              map_thread_id,
                              seq_covered
           );

input       clk;
input       rst_l;
input       im2rm_mdo_enq;
input [5:0] current_thread_id;
input [1:0] current_intctl_id;
input [5:0] current_mondo_intq_id;
input [1:0] int_ctl_id;
input [5:0] map_thread_id;
input [5:0] my_mondo_id;
output      seq_covered;

parameter IDLE          = 2'b00;
parameter INT_1         = 2'b01;
parameter THD_CHANGE    = 2'b10;

reg [1:0] state;
reg [5:0] last_map_thread_id;
reg       seq_covered;

always @(posedge clk)
begin
   if(rst_l == 1'b0)
   begin
     state = IDLE;
     last_map_thread_id = map_thread_id;
     seq_covered        = 1'b0;
   end
   else
   begin
   case(state)
   IDLE :
         begin
          if ((current_thread_id == map_thread_id)  & (current_intctl_id == int_ctl_id) &
               (current_mondo_intq_id == my_mondo_id) & (im2rm_mdo_enq == 1'b1))
              begin
                state = INT_1;
                last_map_thread_id = map_thread_id;
              end
              seq_covered        = 1'b0;
         end

    INT_1 : 
         begin
          seq_covered        = 1'b0;
          if(last_map_thread_id != map_thread_id)
           begin
              state = THD_CHANGE;
            end
         end

    THD_CHANGE :
         begin
          if(last_map_thread_id == map_thread_id)
          begin
            state = INT_1;
          end
          else if ((current_thread_id == map_thread_id)  & (current_intctl_id == int_ctl_id) &
                   (current_mondo_intq_id == my_mondo_id) & (im2rm_mdo_enq == 1'b1))
           begin
             state = INT_1;
             last_map_thread_id = map_thread_id;
             seq_covered        = 1'b1;
          end
        end
      endcase
    end
end

endmodule
///////////////////////////////////////////////////////////////////////////////////////////////
module intctl (  clk,
                 rst_l,
                 im2rm_mdo_enq,
                 current_thread_id,
                 current_intctl_id,
                 current_mondo_intq_id,
                 my_id,
                 seq_covered_status 
           );

input       clk;
input       rst_l;
input       im2rm_mdo_enq;
input [5:0] current_thread_id;
input [1:0] current_intctl_id;
input [5:0] current_mondo_intq_id;
input [1:0] my_id;
output [41:0] seq_covered_status;
 
wire [5:0] thread_id_mondo_20  =  tb_top.cpu.dmu.dmc.imu.iss.csr.dmu_imu_iss_default_grp.interrupt_mapping_20.interrupt_mapping_20_t_id_hw_read;
wire [5:0] thread_id_mondo_21  =  tb_top.cpu.dmu.dmc.imu.iss.csr.dmu_imu_iss_default_grp.interrupt_mapping_21.interrupt_mapping_21_t_id_hw_read;
wire [5:0] thread_id_mondo_22  =  tb_top.cpu.dmu.dmc.imu.iss.csr.dmu_imu_iss_default_grp.interrupt_mapping_22.interrupt_mapping_22_t_id_hw_read;
wire [5:0] thread_id_mondo_23  =  tb_top.cpu.dmu.dmc.imu.iss.csr.dmu_imu_iss_default_grp.interrupt_mapping_23.interrupt_mapping_23_t_id_hw_read;
wire [5:0] thread_id_mondo_24  =  tb_top.cpu.dmu.dmc.imu.iss.csr.dmu_imu_iss_default_grp.interrupt_mapping_24.interrupt_mapping_24_t_id_hw_read;
wire [5:0] thread_id_mondo_25  =  tb_top.cpu.dmu.dmc.imu.iss.csr.dmu_imu_iss_default_grp.interrupt_mapping_25.interrupt_mapping_25_t_id_hw_read;
wire [5:0] thread_id_mondo_26  =  tb_top.cpu.dmu.dmc.imu.iss.csr.dmu_imu_iss_default_grp.interrupt_mapping_26.interrupt_mapping_26_t_id_hw_read;
wire [5:0] thread_id_mondo_27  =  tb_top.cpu.dmu.dmc.imu.iss.csr.dmu_imu_iss_default_grp.interrupt_mapping_27.interrupt_mapping_27_t_id_hw_read;
wire [5:0] thread_id_mondo_28  =  tb_top.cpu.dmu.dmc.imu.iss.csr.dmu_imu_iss_default_grp.interrupt_mapping_28.interrupt_mapping_28_t_id_hw_read;
wire [5:0] thread_id_mondo_29  =  tb_top.cpu.dmu.dmc.imu.iss.csr.dmu_imu_iss_default_grp.interrupt_mapping_29.interrupt_mapping_29_t_id_hw_read;

wire [5:0] thread_id_mondo_30  =  tb_top.cpu.dmu.dmc.imu.iss.csr.dmu_imu_iss_default_grp.interrupt_mapping_30.interrupt_mapping_30_t_id_hw_read;
wire [5:0] thread_id_mondo_31  =  tb_top.cpu.dmu.dmc.imu.iss.csr.dmu_imu_iss_default_grp.interrupt_mapping_31.interrupt_mapping_31_t_id_hw_read;
wire [5:0] thread_id_mondo_32  =  tb_top.cpu.dmu.dmc.imu.iss.csr.dmu_imu_iss_default_grp.interrupt_mapping_32.interrupt_mapping_32_t_id_hw_read;
wire [5:0] thread_id_mondo_33  =  tb_top.cpu.dmu.dmc.imu.iss.csr.dmu_imu_iss_default_grp.interrupt_mapping_33.interrupt_mapping_33_t_id_hw_read;
wire [5:0] thread_id_mondo_34  =  tb_top.cpu.dmu.dmc.imu.iss.csr.dmu_imu_iss_default_grp.interrupt_mapping_34.interrupt_mapping_34_t_id_hw_read;
wire [5:0] thread_id_mondo_35  =  tb_top.cpu.dmu.dmc.imu.iss.csr.dmu_imu_iss_default_grp.interrupt_mapping_35.interrupt_mapping_35_t_id_hw_read;
wire [5:0] thread_id_mondo_36  =  tb_top.cpu.dmu.dmc.imu.iss.csr.dmu_imu_iss_default_grp.interrupt_mapping_36.interrupt_mapping_36_t_id_hw_read;
wire [5:0] thread_id_mondo_37  =  tb_top.cpu.dmu.dmc.imu.iss.csr.dmu_imu_iss_default_grp.interrupt_mapping_37.interrupt_mapping_37_t_id_hw_read;
wire [5:0] thread_id_mondo_38  =  tb_top.cpu.dmu.dmc.imu.iss.csr.dmu_imu_iss_default_grp.interrupt_mapping_38.interrupt_mapping_38_t_id_hw_read;
wire [5:0] thread_id_mondo_39  =  tb_top.cpu.dmu.dmc.imu.iss.csr.dmu_imu_iss_default_grp.interrupt_mapping_39.interrupt_mapping_39_t_id_hw_read;

wire [5:0] thread_id_mondo_40  =  tb_top.cpu.dmu.dmc.imu.iss.csr.dmu_imu_iss_default_grp.interrupt_mapping_40.interrupt_mapping_40_t_id_hw_read;
wire [5:0] thread_id_mondo_41  =  tb_top.cpu.dmu.dmc.imu.iss.csr.dmu_imu_iss_default_grp.interrupt_mapping_41.interrupt_mapping_41_t_id_hw_read;
wire [5:0] thread_id_mondo_42  =  tb_top.cpu.dmu.dmc.imu.iss.csr.dmu_imu_iss_default_grp.interrupt_mapping_42.interrupt_mapping_42_t_id_hw_read;
wire [5:0] thread_id_mondo_43  =  tb_top.cpu.dmu.dmc.imu.iss.csr.dmu_imu_iss_default_grp.interrupt_mapping_43.interrupt_mapping_43_t_id_hw_read;
wire [5:0] thread_id_mondo_44  =  tb_top.cpu.dmu.dmc.imu.iss.csr.dmu_imu_iss_default_grp.interrupt_mapping_44.interrupt_mapping_44_t_id_hw_read;
wire [5:0] thread_id_mondo_45  =  tb_top.cpu.dmu.dmc.imu.iss.csr.dmu_imu_iss_default_grp.interrupt_mapping_45.interrupt_mapping_45_t_id_hw_read;
wire [5:0] thread_id_mondo_46  =  tb_top.cpu.dmu.dmc.imu.iss.csr.dmu_imu_iss_default_grp.interrupt_mapping_46.interrupt_mapping_46_t_id_hw_read;
wire [5:0] thread_id_mondo_47  =  tb_top.cpu.dmu.dmc.imu.iss.csr.dmu_imu_iss_default_grp.interrupt_mapping_47.interrupt_mapping_47_t_id_hw_read;
wire [5:0] thread_id_mondo_48  =  tb_top.cpu.dmu.dmc.imu.iss.csr.dmu_imu_iss_default_grp.interrupt_mapping_48.interrupt_mapping_48_t_id_hw_read;
wire [5:0] thread_id_mondo_49  =  tb_top.cpu.dmu.dmc.imu.iss.csr.dmu_imu_iss_default_grp.interrupt_mapping_49.interrupt_mapping_49_t_id_hw_read;

wire [5:0] thread_id_mondo_50  =  tb_top.cpu.dmu.dmc.imu.iss.csr.dmu_imu_iss_default_grp.interrupt_mapping_50.interrupt_mapping_50_t_id_hw_read;
wire [5:0] thread_id_mondo_51  =  tb_top.cpu.dmu.dmc.imu.iss.csr.dmu_imu_iss_default_grp.interrupt_mapping_51.interrupt_mapping_51_t_id_hw_read;
wire [5:0] thread_id_mondo_52  =  tb_top.cpu.dmu.dmc.imu.iss.csr.dmu_imu_iss_default_grp.interrupt_mapping_52.interrupt_mapping_52_t_id_hw_read;
wire [5:0] thread_id_mondo_53  =  tb_top.cpu.dmu.dmc.imu.iss.csr.dmu_imu_iss_default_grp.interrupt_mapping_53.interrupt_mapping_53_t_id_hw_read;
wire [5:0] thread_id_mondo_54  =  tb_top.cpu.dmu.dmc.imu.iss.csr.dmu_imu_iss_default_grp.interrupt_mapping_54.interrupt_mapping_54_t_id_hw_read;
wire [5:0] thread_id_mondo_55  =  tb_top.cpu.dmu.dmc.imu.iss.csr.dmu_imu_iss_default_grp.interrupt_mapping_55.interrupt_mapping_55_t_id_hw_read;
wire [5:0] thread_id_mondo_56  =  tb_top.cpu.dmu.dmc.imu.iss.csr.dmu_imu_iss_default_grp.interrupt_mapping_56.interrupt_mapping_56_t_id_hw_read;
wire [5:0] thread_id_mondo_57  =  tb_top.cpu.dmu.dmc.imu.iss.csr.dmu_imu_iss_default_grp.interrupt_mapping_57.interrupt_mapping_57_t_id_hw_read;
wire [5:0] thread_id_mondo_58  =  tb_top.cpu.dmu.dmc.imu.iss.csr.dmu_imu_iss_default_grp.interrupt_mapping_58.interrupt_mapping_58_t_id_hw_read;
wire [5:0] thread_id_mondo_59  =  tb_top.cpu.dmu.dmc.imu.iss.csr.dmu_imu_iss_default_grp.interrupt_mapping_59.interrupt_mapping_59_t_id_hw_read;

wire [5:0] thread_id_mondo_62  =  tb_top.cpu.dmu.dmc.imu.iss.csr.dmu_imu_iss_default_grp.interrupt_mapping_62.interrupt_mapping_62_t_id_hw_read;
wire [5:0] thread_id_mondo_63  =  tb_top.cpu.dmu.dmc.imu.iss.csr.dmu_imu_iss_default_grp.interrupt_mapping_63.interrupt_mapping_63_t_id_hw_read;

wire  [41:0] seq_covered_status;


mondo_reloc_cov_fsm cov_mondo_20
                               (
                                 .clk                     (clk),
                                 .rst_l                   (rst_l),
                                 .im2rm_mdo_enq           (im2rm_mdo_enq),
                                 .current_thread_id       (current_thread_id),
                                 .current_intctl_id       (current_intctl_id),
                                 .current_mondo_intq_id   (current_mondo_intq_id),
                                 .int_ctl_id              (my_id),
                                 .my_mondo_id             (6'h14),
                                 .map_thread_id           (thread_id_mondo_20),
                                 .seq_covered             (seq_covered_status[0]) 
                               );

mondo_reloc_cov_fsm cov_mondo_21
                               (
                                 .clk                     (clk),
                                 .rst_l                   (rst_l),
                                 .im2rm_mdo_enq           (im2rm_mdo_enq),
                                 .current_thread_id       (current_thread_id),
                                 .current_intctl_id       (current_intctl_id),
                                 .current_mondo_intq_id   (current_mondo_intq_id),
                                 .int_ctl_id              (my_id),
                                 .my_mondo_id             (6'h15),
                                 .map_thread_id           (thread_id_mondo_21),
                                 .seq_covered             (seq_covered_status[1]) 
                               );

mondo_reloc_cov_fsm cov_mondo_22
                               (
                                 .clk                     (clk),
                                 .rst_l                   (rst_l),
                                 .im2rm_mdo_enq           (im2rm_mdo_enq),
                                 .current_thread_id       (current_thread_id),
                                 .current_intctl_id       (current_intctl_id),
                                 .current_mondo_intq_id   (current_mondo_intq_id),
                                 .int_ctl_id              (my_id),
                                 .my_mondo_id             (6'h16),
                                 .map_thread_id           (thread_id_mondo_22),
                                 .seq_covered             (seq_covered_status[2]) 
                               );

mondo_reloc_cov_fsm cov_mondo_23
                               (
                                 .clk                     (clk),
                                 .rst_l                   (rst_l),
                                 .im2rm_mdo_enq           (im2rm_mdo_enq),
                                 .current_thread_id       (current_thread_id),
                                 .current_intctl_id       (current_intctl_id),
                                 .current_mondo_intq_id   (current_mondo_intq_id),
                                 .int_ctl_id              (my_id),
                                 .my_mondo_id             (6'h17),
                                 .map_thread_id           (thread_id_mondo_23),
                                 .seq_covered             (seq_covered_status[3]) 
                               );

mondo_reloc_cov_fsm cov_mondo_24
                               (
                                 .clk                     (clk),
                                 .rst_l                   (rst_l),
                                 .im2rm_mdo_enq           (im2rm_mdo_enq),
                                 .current_thread_id       (current_thread_id),
                                 .current_intctl_id       (current_intctl_id),
                                 .current_mondo_intq_id   (current_mondo_intq_id),
                                 .int_ctl_id              (my_id),
                                 .my_mondo_id             (6'h18),
                                 .map_thread_id           (thread_id_mondo_24),
                                 .seq_covered             (seq_covered_status[4]) 
                               );

mondo_reloc_cov_fsm cov_mondo_25
                               (
                                 .clk                     (clk),
                                 .rst_l                   (rst_l),
                                 .im2rm_mdo_enq           (im2rm_mdo_enq),
                                 .current_thread_id       (current_thread_id),
                                 .current_intctl_id       (current_intctl_id),
                                 .current_mondo_intq_id   (current_mondo_intq_id),
                                 .int_ctl_id              (my_id),
                                 .my_mondo_id             (6'h19),
                                 .map_thread_id           (thread_id_mondo_25),
                                 .seq_covered             (seq_covered_status[5]) 
                               );

mondo_reloc_cov_fsm cov_mondo_26
                               (
                                 .clk                     (clk),
                                 .rst_l                   (rst_l),
                                 .im2rm_mdo_enq           (im2rm_mdo_enq),
                                 .current_thread_id       (current_thread_id),
                                 .current_intctl_id       (current_intctl_id),
                                 .current_mondo_intq_id   (current_mondo_intq_id),
                                 .int_ctl_id              (my_id),
                                 .my_mondo_id             (6'h1a),
                                 .map_thread_id           (thread_id_mondo_26),
                                 .seq_covered             (seq_covered_status[6]) 
                               );

mondo_reloc_cov_fsm cov_mondo_27
                               (
                                 .clk                     (clk),
                                 .rst_l                   (rst_l),
                                 .im2rm_mdo_enq           (im2rm_mdo_enq),
                                 .current_thread_id       (current_thread_id),
                                 .current_intctl_id       (current_intctl_id),
                                 .current_mondo_intq_id   (current_mondo_intq_id),
                                 .int_ctl_id              (my_id),
                                 .my_mondo_id             (6'h1b),
                                 .map_thread_id           (thread_id_mondo_27),
                                 .seq_covered             (seq_covered_status[7]) 
                               );

mondo_reloc_cov_fsm cov_mondo_28
                               (
                                 .clk                     (clk),
                                 .rst_l                   (rst_l),
                                 .im2rm_mdo_enq           (im2rm_mdo_enq),
                                 .current_thread_id       (current_thread_id),
                                 .current_intctl_id       (current_intctl_id),
                                 .current_mondo_intq_id   (current_mondo_intq_id),
                                 .int_ctl_id              (my_id),
                                 .my_mondo_id             (6'h1c),
                                 .map_thread_id           (thread_id_mondo_28),
                                 .seq_covered             (seq_covered_status[8]) 
                               );

mondo_reloc_cov_fsm cov_mondo_29
                               (
                                 .clk                     (clk),
                                 .rst_l                   (rst_l),
                                 .im2rm_mdo_enq           (im2rm_mdo_enq),
                                 .current_thread_id       (current_thread_id),
                                 .current_intctl_id       (current_intctl_id),
                                 .current_mondo_intq_id   (current_mondo_intq_id),
                                 .int_ctl_id              (my_id),
                                 .my_mondo_id             (6'h1d),
                                 .map_thread_id           (thread_id_mondo_29),
                                 .seq_covered             (seq_covered_status[9]) 
                               );

mondo_reloc_cov_fsm cov_mondo_30
                               (
                                 .clk                     (clk),
                                 .rst_l                   (rst_l),
                                 .im2rm_mdo_enq           (im2rm_mdo_enq),
                                 .current_thread_id       (current_thread_id),
                                 .current_intctl_id       (current_intctl_id),
                                 .current_mondo_intq_id   (current_mondo_intq_id),
                                 .int_ctl_id              (my_id),
                                 .my_mondo_id             (6'h1e),
                                 .map_thread_id           (thread_id_mondo_30),
                                 .seq_covered             (seq_covered_status[10]) 
                               );

mondo_reloc_cov_fsm cov_mondo_31
                               (
                                 .clk                     (clk),
                                 .rst_l                   (rst_l),
                                 .im2rm_mdo_enq           (im2rm_mdo_enq),
                                 .current_thread_id       (current_thread_id),
                                 .current_intctl_id       (current_intctl_id),
                                 .current_mondo_intq_id   (current_mondo_intq_id),
                                 .int_ctl_id              (my_id),
                                 .my_mondo_id             (6'h1f),
                                 .map_thread_id           (thread_id_mondo_31),
                                 .seq_covered             (seq_covered_status[11]) 
                               );

mondo_reloc_cov_fsm cov_mondo_32
                               (
                                 .clk                     (clk),
                                 .rst_l                   (rst_l),
                                 .im2rm_mdo_enq           (im2rm_mdo_enq),
                                 .current_thread_id       (current_thread_id),
                                 .current_intctl_id       (current_intctl_id),
                                 .current_mondo_intq_id   (current_mondo_intq_id),
                                 .int_ctl_id              (my_id),
                                 .my_mondo_id             (6'h20),
                                 .map_thread_id           (thread_id_mondo_32),
                                 .seq_covered             (seq_covered_status[12]) 
                               );

mondo_reloc_cov_fsm cov_mondo_33
                               (
                                 .clk                     (clk),
                                 .rst_l                   (rst_l),
                                 .im2rm_mdo_enq           (im2rm_mdo_enq),
                                 .current_thread_id       (current_thread_id),
                                 .current_intctl_id       (current_intctl_id),
                                 .current_mondo_intq_id   (current_mondo_intq_id),
                                 .int_ctl_id              (my_id),
                                 .my_mondo_id             (6'h21),
                                 .map_thread_id           (thread_id_mondo_33),
                                 .seq_covered             (seq_covered_status[13]) 
                               );

mondo_reloc_cov_fsm cov_mondo_34
                               (
                                 .clk                     (clk),
                                 .rst_l                   (rst_l),
                                 .im2rm_mdo_enq           (im2rm_mdo_enq),
                                 .current_thread_id       (current_thread_id),
                                 .current_intctl_id       (current_intctl_id),
                                 .current_mondo_intq_id   (current_mondo_intq_id),
                                 .int_ctl_id              (my_id),
                                 .my_mondo_id             (6'h22),
                                 .map_thread_id           (thread_id_mondo_34),
                                 .seq_covered             (seq_covered_status[14]) 
                               );

mondo_reloc_cov_fsm cov_mondo_35
                               (
                                 .clk                     (clk),
                                 .rst_l                   (rst_l),
                                 .im2rm_mdo_enq           (im2rm_mdo_enq),
                                 .current_thread_id       (current_thread_id),
                                 .current_intctl_id       (current_intctl_id),
                                 .current_mondo_intq_id   (current_mondo_intq_id),
                                 .int_ctl_id              (my_id),
                                 .my_mondo_id             (6'h23),
                                 .map_thread_id           (thread_id_mondo_35),
                                 .seq_covered             (seq_covered_status[15]) 
                               );

mondo_reloc_cov_fsm cov_mondo_36
                               (
                                 .clk                     (clk),
                                 .rst_l                   (rst_l),
                                 .im2rm_mdo_enq           (im2rm_mdo_enq),
                                 .current_thread_id       (current_thread_id),
                                 .current_intctl_id       (current_intctl_id),
                                 .current_mondo_intq_id   (current_mondo_intq_id),
                                 .int_ctl_id              (my_id),
                                 .my_mondo_id             (6'h24),
                                 .map_thread_id           (thread_id_mondo_36),
                                 .seq_covered             (seq_covered_status[16]) 
                               );

mondo_reloc_cov_fsm cov_mondo_37
                               (
                                 .clk                     (clk),
                                 .rst_l                   (rst_l),
                                 .im2rm_mdo_enq           (im2rm_mdo_enq),
                                 .current_thread_id       (current_thread_id),
                                 .current_intctl_id       (current_intctl_id),
                                 .current_mondo_intq_id   (current_mondo_intq_id),
                                 .int_ctl_id              (my_id),
                                 .my_mondo_id             (6'h25),
                                 .map_thread_id           (thread_id_mondo_37),
                                 .seq_covered             (seq_covered_status[17]) 
                               );

mondo_reloc_cov_fsm cov_mondo_38
                               (
                                 .clk                     (clk),
                                 .rst_l                   (rst_l),
                                 .im2rm_mdo_enq           (im2rm_mdo_enq),
                                 .current_thread_id       (current_thread_id),
                                 .current_intctl_id       (current_intctl_id),
                                 .current_mondo_intq_id   (current_mondo_intq_id),
                                 .int_ctl_id              (my_id),
                                 .my_mondo_id             (6'h26),
                                 .map_thread_id           (thread_id_mondo_38),
                                 .seq_covered             (seq_covered_status[18]) 
                               );

mondo_reloc_cov_fsm cov_mondo_39
                               (
                                 .clk                     (clk),
                                 .rst_l                   (rst_l),
                                 .im2rm_mdo_enq           (im2rm_mdo_enq),
                                 .current_thread_id       (current_thread_id),
                                 .current_intctl_id       (current_intctl_id),
                                 .current_mondo_intq_id   (current_mondo_intq_id),
                                 .int_ctl_id              (my_id),
                                 .my_mondo_id             (6'h27),
                                 .map_thread_id           (thread_id_mondo_39),
                                 .seq_covered             (seq_covered_status[19]) 
                              );

mondo_reloc_cov_fsm cov_mondo_40
                               (
                                 .clk                     (clk),
                                 .rst_l                   (rst_l),
                                 .im2rm_mdo_enq           (im2rm_mdo_enq),
                                 .current_thread_id       (current_thread_id),
                                 .current_intctl_id       (current_intctl_id),
                                 .current_mondo_intq_id   (current_mondo_intq_id),
                                 .int_ctl_id              (my_id),
                                 .my_mondo_id             (6'h28),
                                 .map_thread_id           (thread_id_mondo_40),
                                 .seq_covered             (seq_covered_status[20]) 
                               );

mondo_reloc_cov_fsm cov_mondo_41
                               (
                                 .clk                     (clk),
                                 .rst_l                   (rst_l),
                                 .im2rm_mdo_enq           (im2rm_mdo_enq),
                                 .current_thread_id       (current_thread_id),
                                 .current_intctl_id       (current_intctl_id),
                                 .current_mondo_intq_id   (current_mondo_intq_id),
                                 .int_ctl_id              (my_id),
                                 .my_mondo_id             (6'h29),
                                 .map_thread_id           (thread_id_mondo_41),
                                 .seq_covered             (seq_covered_status[21]) 
                               );

mondo_reloc_cov_fsm cov_mondo_42
                               (
                                 .clk                     (clk),
                                 .rst_l                   (rst_l),
                                 .im2rm_mdo_enq           (im2rm_mdo_enq),
                                 .current_thread_id       (current_thread_id),
                                 .current_intctl_id       (current_intctl_id),
                                 .current_mondo_intq_id   (current_mondo_intq_id),
                                 .int_ctl_id              (my_id),
                                 .my_mondo_id             (6'h2a),
                                 .map_thread_id           (thread_id_mondo_42),
                                 .seq_covered             (seq_covered_status[22]) 
                               );

mondo_reloc_cov_fsm cov_mondo_43
                               (
                                 .clk                     (clk),
                                 .rst_l                   (rst_l),
                                 .im2rm_mdo_enq           (im2rm_mdo_enq),
                                 .current_thread_id       (current_thread_id),
                                 .current_intctl_id       (current_intctl_id),
                                 .current_mondo_intq_id   (current_mondo_intq_id),
                                 .int_ctl_id              (my_id),
                                 .my_mondo_id             (6'h2b),
                                 .map_thread_id           (thread_id_mondo_43),
                                 .seq_covered             (seq_covered_status[23]) 
                               );

mondo_reloc_cov_fsm cov_mondo_44
                               (
                                 .clk                     (clk),
                                 .rst_l                   (rst_l),
                                 .im2rm_mdo_enq           (im2rm_mdo_enq),
                                 .current_thread_id       (current_thread_id),
                                 .current_intctl_id       (current_intctl_id),
                                 .current_mondo_intq_id   (current_mondo_intq_id),
                                 .int_ctl_id              (my_id),
                                 .my_mondo_id             (6'h2c),
                                 .map_thread_id           (thread_id_mondo_44),
                                 .seq_covered             (seq_covered_status[24]) 
                               );

mondo_reloc_cov_fsm cov_mondo_45
                               (
                                 .clk                     (clk),
                                 .rst_l                   (rst_l),
                                 .im2rm_mdo_enq           (im2rm_mdo_enq),
                                 .current_thread_id       (current_thread_id),
                                 .current_intctl_id       (current_intctl_id),
                                 .current_mondo_intq_id   (current_mondo_intq_id),
                                 .int_ctl_id              (my_id),
                                 .my_mondo_id             (6'h2d),
                                 .map_thread_id           (thread_id_mondo_45),
                                 .seq_covered             (seq_covered_status[25]) 
                               );

mondo_reloc_cov_fsm cov_mondo_46
                               (
                                 .clk                     (clk),
                                 .rst_l                   (rst_l),
                                 .im2rm_mdo_enq           (im2rm_mdo_enq),
                                 .current_thread_id       (current_thread_id),
                                 .current_intctl_id       (current_intctl_id),
                                 .current_mondo_intq_id   (current_mondo_intq_id),
                                 .int_ctl_id              (my_id),
                                 .my_mondo_id             (6'h2e),
                                 .map_thread_id           (thread_id_mondo_46),
                                 .seq_covered             (seq_covered_status[26]) 
                               );

mondo_reloc_cov_fsm cov_mondo_47
                               (
                                 .clk                     (clk),
                                 .rst_l                   (rst_l),
                                 .im2rm_mdo_enq           (im2rm_mdo_enq),
                                 .current_thread_id       (current_thread_id),
                                 .current_intctl_id       (current_intctl_id),
                                 .current_mondo_intq_id   (current_mondo_intq_id),
                                 .int_ctl_id              (my_id),
                                 .my_mondo_id             (6'h2f),
                                 .map_thread_id           (thread_id_mondo_47),
                                 .seq_covered             (seq_covered_status[27]) 
                               );

mondo_reloc_cov_fsm cov_mondo_48
                               (
                                 .clk                     (clk),
                                 .rst_l                   (rst_l),
                                 .im2rm_mdo_enq           (im2rm_mdo_enq),
                                 .current_thread_id       (current_thread_id),
                                 .current_intctl_id       (current_intctl_id),
                                 .current_mondo_intq_id   (current_mondo_intq_id),
                                 .int_ctl_id              (my_id),
                                 .my_mondo_id             (6'h30),
                                 .map_thread_id           (thread_id_mondo_48),
                                 .seq_covered             (seq_covered_status[28]) 
                               );

mondo_reloc_cov_fsm cov_mondo_49
                               (
                                 .clk                     (clk),
                                 .rst_l                   (rst_l),
                                 .im2rm_mdo_enq           (im2rm_mdo_enq),
                                 .current_thread_id       (current_thread_id),
                                 .current_intctl_id       (current_intctl_id),
                                 .current_mondo_intq_id   (current_mondo_intq_id),
                                 .int_ctl_id              (my_id),
                                 .my_mondo_id             (6'h31),
                                 .map_thread_id           (thread_id_mondo_49),
                                 .seq_covered             (seq_covered_status[29]) 
                              );

mondo_reloc_cov_fsm cov_mondo_50
                               (
                                 .clk                     (clk),
                                 .rst_l                   (rst_l),
                                 .im2rm_mdo_enq           (im2rm_mdo_enq),
                                 .current_thread_id       (current_thread_id),
                                 .current_intctl_id       (current_intctl_id),
                                 .current_mondo_intq_id   (current_mondo_intq_id),
                                 .int_ctl_id              (my_id),
                                 .my_mondo_id             (6'h32),
                                 .map_thread_id           (thread_id_mondo_50),
                                 .seq_covered             (seq_covered_status[30]) 
                               );

mondo_reloc_cov_fsm cov_mondo_51
                               (
                                 .clk                     (clk),
                                 .rst_l                   (rst_l),
                                 .im2rm_mdo_enq           (im2rm_mdo_enq),
                                 .current_thread_id       (current_thread_id),
                                 .current_intctl_id       (current_intctl_id),
                                 .current_mondo_intq_id   (current_mondo_intq_id),
                                 .int_ctl_id              (my_id),
                                 .my_mondo_id             (6'h33),
                                 .map_thread_id           (thread_id_mondo_51),
                                 .seq_covered             (seq_covered_status[31]) 
                               );

mondo_reloc_cov_fsm cov_mondo_52
                               (
                                 .clk                     (clk),
                                 .rst_l                   (rst_l),
                                 .im2rm_mdo_enq           (im2rm_mdo_enq),
                                 .current_thread_id       (current_thread_id),
                                 .current_intctl_id       (current_intctl_id),
                                 .current_mondo_intq_id   (current_mondo_intq_id),
                                 .int_ctl_id              (my_id),
                                 .my_mondo_id             (6'h34),
                                 .map_thread_id           (thread_id_mondo_52),
                                 .seq_covered             (seq_covered_status[32]) 
                               );

mondo_reloc_cov_fsm cov_mondo_53
                               (
                                 .clk                     (clk),
                                 .rst_l                   (rst_l),
                                 .im2rm_mdo_enq           (im2rm_mdo_enq),
                                 .current_thread_id       (current_thread_id),
                                 .current_intctl_id       (current_intctl_id),
                                 .current_mondo_intq_id   (current_mondo_intq_id),
                                 .int_ctl_id              (my_id),
                                 .my_mondo_id             (6'h35),
                                 .map_thread_id           (thread_id_mondo_53),
                                 .seq_covered             (seq_covered_status[33]) 
                               );

mondo_reloc_cov_fsm cov_mondo_54
                               (
                                 .clk                     (clk),
                                 .rst_l                   (rst_l),
                                 .im2rm_mdo_enq           (im2rm_mdo_enq),
                                 .current_thread_id       (current_thread_id),
                                 .current_intctl_id       (current_intctl_id),
                                 .current_mondo_intq_id   (current_mondo_intq_id),
                                 .int_ctl_id              (my_id),
                                 .my_mondo_id             (6'h36),
                                 .map_thread_id           (thread_id_mondo_54),
                                 .seq_covered             (seq_covered_status[34]) 
                               );

mondo_reloc_cov_fsm cov_mondo_55
                               (
                                 .clk                     (clk),
                                 .rst_l                   (rst_l),
                                 .im2rm_mdo_enq           (im2rm_mdo_enq),
                                 .current_thread_id       (current_thread_id),
                                 .current_intctl_id       (current_intctl_id),
                                 .current_mondo_intq_id   (current_mondo_intq_id),
                                 .int_ctl_id              (my_id),
                                 .my_mondo_id             (6'h37),
                                 .map_thread_id           (thread_id_mondo_55),
                                 .seq_covered             (seq_covered_status[35]) 
                               );

mondo_reloc_cov_fsm cov_mondo_56
                               (
                                 .clk                     (clk),
                                 .rst_l                   (rst_l),
                                 .im2rm_mdo_enq           (im2rm_mdo_enq),
                                 .current_thread_id       (current_thread_id),
                                 .current_intctl_id       (current_intctl_id),
                                 .current_mondo_intq_id   (current_mondo_intq_id),
                                 .int_ctl_id              (my_id),
                                 .my_mondo_id             (6'h38),
                                 .map_thread_id           (thread_id_mondo_56),
                                 .seq_covered             (seq_covered_status[36]) 
                               );

mondo_reloc_cov_fsm cov_mondo_57
                               (
                                 .clk                     (clk),
                                 .rst_l                   (rst_l),
                                 .im2rm_mdo_enq           (im2rm_mdo_enq),
                                 .current_thread_id       (current_thread_id),
                                 .current_intctl_id       (current_intctl_id),
                                 .current_mondo_intq_id   (current_mondo_intq_id),
                                 .int_ctl_id              (my_id),
                                 .my_mondo_id             (6'h39),
                                 .map_thread_id           (thread_id_mondo_57),
                                 .seq_covered             (seq_covered_status[37]) 
                               );

mondo_reloc_cov_fsm cov_mondo_58
                               (
                                 .clk                     (clk),
                                 .rst_l                   (rst_l),
                                 .im2rm_mdo_enq           (im2rm_mdo_enq),
                                 .current_thread_id       (current_thread_id),
                                 .current_intctl_id       (current_intctl_id),
                                 .current_mondo_intq_id   (current_mondo_intq_id),
                                 .int_ctl_id              (my_id),
                                 .my_mondo_id             (6'h3a),
                                 .map_thread_id           (thread_id_mondo_58),
                                 .seq_covered             (seq_covered_status[38]) 
                               );

mondo_reloc_cov_fsm cov_mondo_59
                               (
                                 .clk                     (clk),
                                 .rst_l                   (rst_l),
                                 .im2rm_mdo_enq           (im2rm_mdo_enq),
                                 .current_thread_id       (current_thread_id),
                                 .current_intctl_id       (current_intctl_id),
                                 .current_mondo_intq_id   (current_mondo_intq_id),
                                 .int_ctl_id              (my_id),
                                 .my_mondo_id             (6'h3b),
                                 .map_thread_id           (thread_id_mondo_59),
                                 .seq_covered             (seq_covered_status[39]) 
                              );

mondo_reloc_cov_fsm cov_mondo_62
                               (
                                 .clk                     (clk),
                                 .rst_l                   (rst_l),
                                 .im2rm_mdo_enq           (im2rm_mdo_enq),
                                 .current_thread_id       (current_thread_id),
                                 .current_intctl_id       (current_intctl_id),
                                 .current_mondo_intq_id   (current_mondo_intq_id),
                                 .int_ctl_id              (my_id),
                                 .my_mondo_id             (6'h3e),
                                 .map_thread_id           (thread_id_mondo_62),
                                 .seq_covered             (seq_covered_status[40]) 
                               );

mondo_reloc_cov_fsm cov_mondo_63
                               (
                                 .clk                     (clk),
                                 .rst_l                   (rst_l),
                                 .im2rm_mdo_enq           (im2rm_mdo_enq),
                                 .current_thread_id       (current_thread_id),
                                 .current_intctl_id       (current_intctl_id),
                                 .current_mondo_intq_id   (current_mondo_intq_id),
                                 .int_ctl_id              (my_id),
                                 .my_mondo_id             (6'h3e),
                                 .map_thread_id           (thread_id_mondo_63),
                                 .seq_covered             (seq_covered_status[41]) 
                               );
endmodule

//////////////////////////////////////////////////////////////////////////////////
module dmu_int_relocation_cov_mon();

wire       clk;
wire       rst_l;
wire       im2rm_mdo_enq;
wire [5:0] current_thread_id;
wire [1:0] current_intctl_id;
wire [5:0] current_mondo_intq_id;

assign clk                    =  tb_top.cpu.dmu.dmc.imu.gcs.csm.clk; 
assign rst_l                  =  tb_top.cpu.dmu.dmc.imu.gcs.csm.rst_l; 
assign im2rm_mdo_enq          =  tb_top.cpu.dmu.dmc.imu.gcs.csm.im2rm_mdo_enq;
assign current_thread_id      =  tb_top.cpu.dmu.dmc.imu.gcs.csm.iss2gcs_tid;
assign current_intctl_id      =  tb_top.cpu.dmu.dmc.imu.gcs.csm.current_id;
assign current_mondo_intq_id  =  tb_top.cpu.dmu.dmc.imu.gcs.csm.current_ino;

wire [41:0]  seq_covered_status_0, seq_covered_status_1, seq_covered_status_2, seq_covered_status_3;
wire [41:0]  seq_covered_status;
assign       seq_covered_status = (seq_covered_status_0 | seq_covered_status_1 | seq_covered_status_2 | seq_covered_status_3);

intctl intctl0 (
                 .clk                     (clk),
                 .rst_l                   (rst_l),
                 .im2rm_mdo_enq           (im2rm_mdo_enq),
                 .current_thread_id       (current_thread_id),
                 .current_intctl_id       (current_intctl_id),
                 .current_mondo_intq_id   (current_mondo_intq_id),
                 .my_id                   (2'b00),
                 .seq_covered_status      (seq_covered_status_0)
              );

intctl intctl1 (
                 .clk                     (clk),
                 .rst_l                   (rst_l),
                 .im2rm_mdo_enq           (im2rm_mdo_enq),
                 .current_thread_id       (current_thread_id),
                 .current_intctl_id       (current_intctl_id),
                 .current_mondo_intq_id   (current_mondo_intq_id),
                 .my_id                   (2'b01),
                 .seq_covered_status      (seq_covered_status_1)
              );


intctl intctl2 (
                 .clk                     (clk),
                 .rst_l                   (rst_l),
                 .im2rm_mdo_enq           (im2rm_mdo_enq),
                 .current_thread_id       (current_thread_id),
                 .current_intctl_id       (current_intctl_id),
                 .current_mondo_intq_id   (current_mondo_intq_id),
                 .my_id                   (2'b10),
                 .seq_covered_status      (seq_covered_status_2)
              );


intctl intctl3 (
                 .clk                     (clk),
                 .rst_l                   (rst_l),
                 .im2rm_mdo_enq           (im2rm_mdo_enq),
                 .current_thread_id       (current_thread_id),
                 .current_intctl_id       (current_intctl_id),
                 .current_mondo_intq_id   (current_mondo_intq_id),
                 .my_id                   (2'b11),
                 .seq_covered_status      (seq_covered_status_3)
              );

endmodule
