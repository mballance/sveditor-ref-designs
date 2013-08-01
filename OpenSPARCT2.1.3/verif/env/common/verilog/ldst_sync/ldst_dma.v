// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: ldst_dma.v
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
`ifndef GATESIM

// State Machine states
parameter STATE_C0  = 5'h0;
parameter STATE_C1  = 5'h1;
parameter STATE_C2  = 5'h2;
parameter STATE_C3  = 5'h3;
parameter STATE_C4  = 5'h4;
parameter STATE_C5  = 5'h5;
parameter STATE_C6  = 5'h6;
parameter STATE_C7  = 5'h7;
parameter STATE_C8  = 5'h8;
parameter STATE_C9  = 5'h9;
parameter STATE_C10 = 5'h10;
parameter STATE_C11 = 5'h11;
parameter STATE_C12 = 5'h12;
parameter STATE_C13 = 5'h13;
parameter STATE_C14 = 5'h14;
parameter STATE_C15 = 5'h15;
parameter STATE_C16 = 5'h16;
parameter STATE_C17 = 5'h17;
parameter STATE_C18 = 5'h18;

`ifdef NO_L2_BNK0
`else
  `ifdef NOL2RTL
  `else

//==========================================================
//==========================================================
// L2 RTL Probes

  //----------------------------------------------------------
  // Signals for L2 RTL Bank0

  //---------------------
  // SIU store

  wire                       b0_cam_hit_c5;
  reg                        b0_cam_hit_c52;
  reg                        b0_cam_hit_c6;
  reg                        b0_cam_hit_c7;
  reg                        b0_cam_hit_c8;
  wire                       b0_cam_hit;
  wire                       b0_inst_valid_c2;
  wire                       b0_wr8_inst_c2;
  wire                       b0_wr64_inst_c2;

  // If the cam hits, then there will be an eviction sent to the core(s)
  assign b0_cam_hit_c5       = |`CPU.l2t0.dc_cam_hit;
  assign b0_cam_hit          = b0_cam_hit_c8;
  assign b0_inst_valid_c2    = `CPU.l2t0.arb.arb_inst_vld_c2;
  assign b0_wr8_inst_c2      = `CPU.l2t0.arb.arb_decdp_wr8_inst_c2;
  assign b0_wr64_inst_c2     = `CPU.l2t0.arb.arb_decdp_wr64_inst_c2;

  //---------------------
  // WR8 signals
  wire                       b0_first_pass_c2;
  reg                        b0_first_pass_c3;
  reg                        b0_first_pass_c4;
  reg                        b0_first_pass_c5;
  reg                        b0_first_pass_c52;
  reg                        b0_first_pass_c6;
  reg                        b0_first_pass_c7;
  reg                        b0_first_pass_c8;
  wire                       b0_first_pass;
  wire                       b0_wr8_active_c2;
  reg                        b0_wr8_active_c3;
  reg                        b0_wr8_active_c4;
  reg                        b0_wr8_active_c5;
  reg                        b0_wr8_active_c52;
  reg                        b0_wr8_active_c6;
  reg                        b0_wr8_active_c7;
  reg                        b0_wr8_active_c8;
  wire                       b0_wr8_active;

  wire                [39:0] b0_siu_wr8_pa;
  wire                [63:0] b0_siu_wr8_data;
  wire                 [7:0] b0_siu_wr8_size;

  assign b0_wr8_active_c2       = `CPU.l2t0.arb_decdp_wr8_inst_c2;
  assign b0_wr8_active          = b0_wr8_active_c8;
  assign b0_first_pass_c2       = `CPU.l2t0.arbdec.arbdp_inst_c2[39]==0;
  assign b0_first_pass          = b0_first_pass_c8;
  assign b0_siu_wr8_pa          = `CPU.l2t0.arbadr.arbdp_addr_c8;
  assign b0_siu_wr8_data        = `CPU.l2t0.arbdat.arbdp_inst_data_c8;
  assign b0_siu_wr8_size        = `CPU.l2t0.arbdec.arbdec_arbdp_inst_size_c8;

  //---------------------
  // WRI signals
  reg                  [1:0] b0_pop_index;   // Index pointing to next entry to be read from IOWB
  reg                  [1:0] b0_push_index;  // Index pointing to next entry to be written from IOWB

  wire                       b0_wr64_active_c2;
  reg                        b0_wr64_active_c3;
  reg                        b0_wr64_active_c4;
  reg                        b0_wr64_active_c5;
  reg                        b0_wr64_active_c52;
  reg                        b0_wr64_active_c6;
  reg                        b0_wr64_active_c7;
  reg                        b0_wr64_active_c8;
  wire                       b0_wr64_active;

  wire                       b0_sii_l2t_req_vld;
  wire                [31:0] b0_sii_l2t_req_data;
  wire                       b0_rdma_wren;
  //wire               [1:0] b0_rdma_index;
  //wire               [3:0] b0_rdma_valid;

   reg                 [4:0] b0_state_capture;
   reg                [39:0] b0_siu_pa;
   reg                [31:0] b0_siu_d0;
   reg                [31:0] b0_siu_d1;
   reg                [31:0] b0_siu_d2;
   reg                [31:0] b0_siu_d3;
   reg                [31:0] b0_siu_d4;
   reg                [31:0] b0_siu_d5;
   reg                [31:0] b0_siu_d6;
   reg                [31:0] b0_siu_d7;
   reg                [31:0] b0_siu_d8;
   reg                [31:0] b0_siu_d9;
   reg                [31:0] b0_siu_d10;
   reg                [31:0] b0_siu_d11;
   reg                [31:0] b0_siu_d12;
   reg                [31:0] b0_siu_d13;
   reg                [31:0] b0_siu_d14;
   reg                [31:0] b0_siu_d15;

   // IOWB has 4 entries
   // Each entry has valid bit, pa, 64 Byte data
   reg                       b0_iowb0_valid;  // Indicates Bench has captured entire packet
   reg                       b0_iowb1_valid;
   reg                       b0_iowb2_valid;
   reg                       b0_iowb3_valid;
   reg                [39:0] b0_iowb0_pa;
   reg                [39:0] b0_iowb1_pa;
   reg                [39:0] b0_iowb2_pa;
   reg                [39:0] b0_iowb3_pa;
   reg                [31:0] b0_iowb0 [0:15];
   reg                [31:0] b0_iowb1 [0:15];
   reg                [31:0] b0_iowb2 [0:15];
   reg                [31:0] b0_iowb3 [0:15];

  assign b0_sii_l2t_req_vld     = `CPU.l2t0.sii_l2t_req_vld;
  assign b0_sii_l2t_req_data    = `CPU.l2t0.sii_l2t_req[31:0];

  assign b0_wr64_active_c2   = b0_inst_valid_c2 & b0_wr64_inst_c2;
  assign b0_wr64_active      = b0_wr64_active_c8;

  // Indicates when rdma_index is valid
  assign b0_rdma_wren           = `CPU.l2b0.evict_l2t_l2b_rdma_wren_s3_v1 | 
                                       `CPU.l2b0.evict_l2t_l2b_rdma_wren_s3_v2 | 
                                       `CPU.l2b0.evict_l2t_l2b_rdma_wren_s3_v3 | 
                                       `CPU.l2b0.evict_l2t_l2b_rdma_wren_s3_v4;

  
  // IOWB entry index = 0,1,2,3
  //assign b0_rdma_index          = `CPU.l2b0.evict_l2t_l2b_rdma_wrwl_s3_v1[1:0];
  // Indicates that any future transactions will see this entry's store data.
  // The bit that is asserted corresponds to the index in the IOWB.
  //assign b0_rdma_valid          = `CPU.l2t0.rdmat.rdma_valid[3:0];

//---------------------
initial
  begin
    b0_pop_index = 2'b0;
    b0_push_index = 2'b0;
    b0_state_capture = STATE_C0;   // Idle state
    b0_iowb0_valid = 1'h0;
    b0_iowb1_valid = 1'h0;
    b0_iowb2_valid = 1'h0;
    b0_iowb3_valid = 1'h0;
    b0_iowb0_pa = 40'h0;
    b0_iowb1_pa = 40'h0;
    b0_iowb2_pa = 40'h0;
    b0_iowb3_pa = 40'h0;
    b0_siu_pa = 40'h0;
    b0_siu_d0 = 32'b0;
    b0_siu_d1 = 32'b0;
    b0_siu_d2 = 32'b0;
    b0_siu_d3 = 32'b0;
    b0_siu_d4 = 32'b0;
    b0_siu_d5 = 32'b0;
    b0_siu_d6 = 32'b0;
    b0_siu_d7 = 32'b0;
    b0_siu_d8 = 32'b0;
    b0_siu_d9 = 32'b0;
    b0_siu_d10 = 32'b0;
    b0_siu_d11 = 32'b0;
    b0_siu_d12 = 32'b0;
    b0_siu_d13 = 32'b0;
    b0_siu_d14 = 32'b0;
    b0_siu_d15 = 32'b0;
  end

//==========================================================
//==========================================================

always @ (posedge `BENCH_L2T0_GCLK) begin // {

  //------------------------------
  //  Pipeline signals

  //------------------------------
  //  L2 RTL Bank0  (not needed for L2 Stub)

  b0_cam_hit_c52 <= b0_cam_hit_c5;
  b0_cam_hit_c6  <= b0_cam_hit_c52;
  b0_cam_hit_c7  <= b0_cam_hit_c6;
  b0_cam_hit_c8  <= b0_cam_hit_c7;

  b0_first_pass_c3  <= b0_first_pass_c2;
  b0_first_pass_c4  <= b0_first_pass_c3;
  b0_first_pass_c5  <= b0_first_pass_c4;
  b0_first_pass_c52 <= b0_first_pass_c5;
  b0_first_pass_c6  <= b0_first_pass_c52;
  b0_first_pass_c7  <= b0_first_pass_c6;
  b0_first_pass_c8  <= b0_first_pass_c7;

  b0_wr8_active_c3  <= b0_wr8_active_c2;
  b0_wr8_active_c4  <= b0_wr8_active_c3;
  b0_wr8_active_c5  <= b0_wr8_active_c4;
  b0_wr8_active_c52 <= b0_wr8_active_c5;
  b0_wr8_active_c6  <= b0_wr8_active_c52;
  b0_wr8_active_c7  <= b0_wr8_active_c6;
  b0_wr8_active_c8  <= b0_wr8_active_c7;

  b0_wr64_active_c3  <= b0_wr64_active_c2;
  b0_wr64_active_c4  <= b0_wr64_active_c3;
  b0_wr64_active_c5  <= b0_wr64_active_c4;
  b0_wr64_active_c52 <= b0_wr64_active_c5;
  b0_wr64_active_c6  <= b0_wr64_active_c52;
  b0_wr64_active_c7  <= b0_wr64_active_c6;
  b0_wr64_active_c8  <= b0_wr64_active_c7;

  //----------------------------------------------------------
  //----------------------------------------------------------
  // SIU Store - WR8

  
  //       only do this if the transfers don't match up in c8.

  if (b0_wr8_active && b0_first_pass) begin // {
    // Send msgs to Riesling
    dma_store (b0_siu_wr8_pa,b0_siu_wr8_data,b0_siu_wr8_size,b0_cam_hit,8'd8,"B0 WR8");
  end // }

  //----------------------------------------------------------
  //----------------------------------------------------------
  // SIU Store - WRI

  //------------------------------
  // Send MemorySlam message after SIU transaction is complete
  // Read IOWB data and Send msgs to Riesling

  if (b0_wr64_active && b0_first_pass) begin // {

    // Determine which of the 8 DMA_STOREs will be evicted.
    // WRI is 64 Bytes.
    // Eviction is 16 Bytes at a time.
    // So, there can be 1-4 Evictions for a single WRI.
    b0_ev_vect0 = b0_ev_invvect[31:0];
    b0_ev_vect1 = b0_ev_invvect[55:32];
    b0_ev_vect2 = b0_ev_invvect[87:56];
    b0_ev_vect3 = b0_ev_invvect[111:88];

    b0_inv_vect[0] = get_vect(b0_ev_vect0);
    b0_inv_vect[1] = get_vect31(b0_ev_vect1);  // different function for odd inval vector
    b0_inv_vect[2] = get_vect(b0_ev_vect2);
    b0_inv_vect[3] = get_vect31(b0_ev_vect3);  // different function for odd inval vector

    //Get entry from IOWB and send message
    b0_chk_valid_entry(b0_pop_index);
    b0_read_iowb(b0_pop_index,
                        {|b0_inv_vect[3],|b0_inv_vect[2],|b0_inv_vect[1],|b0_inv_vect[0]});
    b0_pop_index = b0_pop_index + 1;
  end // }

  //------------------------------
  // Capture state machine
  // Capture pa and data (64 Bytes) off SIU to L2 interface.
  // See SIU MAS (about page 49) for WRI packet format.
  // Put packet in IOWB which had 4 entries.
  // This IOWB in the Bench is not exactly the same as the IOWB in RTL.
  // Bench IOWB is a FIFO and RTL IOWB is not a FIFO.

  case (b0_state_capture)

    // Capture pa (part 1)
    STATE_C0: begin  // {
                // WRI pkt if req_data[26:24]==3'b100
                if ((b0_sii_l2t_req_vld)&&(b0_sii_l2t_req_data[26:24]==3'b100)) begin // {
                  b0_siu_pa[39:32] <= b0_sii_l2t_req_data[7:0];
                  b0_state_capture <= STATE_C1;
                end // }
              end // }

    // Capture pa (part 2)
    STATE_C1: begin  // {
                  b0_siu_pa[31:0] <= b0_sii_l2t_req_data[31:0];
                  b0_state_capture <= STATE_C2;
              end // }

    // Capture 4 data bytes
    STATE_C2: begin  // {
                  b0_siu_d0 <= b0_sii_l2t_req_data[31:0];
                  b0_state_capture <= STATE_C3;
              end // }

    // Capture 4 data bytes
    STATE_C3: begin  // {
                  b0_siu_d1 <= b0_sii_l2t_req_data[31:0];
                  b0_state_capture <= STATE_C4;
              end // }

    // Capture 4 data bytes
    STATE_C4: begin  // {
                  b0_siu_d2 <= b0_sii_l2t_req_data[31:0];
                  b0_state_capture <= STATE_C5;
              end // }

    // Capture 4 data bytes
    STATE_C5: begin  // {
                  b0_siu_d3 <= b0_sii_l2t_req_data[31:0];
                  b0_state_capture <= STATE_C6;
              end // }

    // Capture 4 data bytes
    STATE_C6: begin  // {
                  b0_siu_d4 <= b0_sii_l2t_req_data[31:0];
                  b0_state_capture <= STATE_C7;
              end // }

    // Capture 4 data bytes
    STATE_C7: begin  // {
                  b0_siu_d5 <= b0_sii_l2t_req_data[31:0];
                  b0_state_capture <= STATE_C8;
              end // }

    // Capture 4 data bytes
    STATE_C8: begin  // {
                  b0_siu_d6 <= b0_sii_l2t_req_data[31:0];
                  b0_state_capture <= STATE_C9;
              end // }

    // Capture 4 data bytes
    STATE_C9: begin  // {
                  b0_siu_d7 <= b0_sii_l2t_req_data[31:0];
                  b0_state_capture <= STATE_C10;
              end // }

    // Capture 4 data bytes
    STATE_C10: begin  // {
                  b0_siu_d8 <= b0_sii_l2t_req_data[31:0];
                  b0_state_capture <= STATE_C11;
              end // }

    // Capture 4 data bytes
    STATE_C11: begin  // {
                  b0_siu_d9 <= b0_sii_l2t_req_data[31:0];
                  b0_state_capture <= STATE_C12;
              end // }

    // Capture 4 data bytes
    STATE_C12: begin  // {
                  b0_siu_d10 <= b0_sii_l2t_req_data[31:0];
                  b0_state_capture <= STATE_C13;
              end // }

    // Capture 4 data bytes
    STATE_C13: begin  // {
                  b0_siu_d11 <= b0_sii_l2t_req_data[31:0];
                  b0_state_capture <= STATE_C14;
              end // }

    // Capture 4 data bytes
    STATE_C14: begin  // {
                  b0_siu_d12 <= b0_sii_l2t_req_data[31:0];
                  b0_state_capture <= STATE_C15;
              end // }

    // Capture 4 data bytes
    STATE_C15: begin  // {
                  b0_siu_d13 <= b0_sii_l2t_req_data[31:0];
                  b0_state_capture <= STATE_C16;
              end // }

    // Capture 4 data bytes
    STATE_C16: begin  // {
                  b0_siu_d14 <= b0_sii_l2t_req_data[31:0];
                  b0_state_capture <= STATE_C17;
              end // }

    // Capture 4 data bytes
    STATE_C17: begin  // {
                  b0_siu_d15 <= b0_sii_l2t_req_data[31:0];
                  b0_state_capture <= STATE_C18;
              end // }

    // Save WRI packet (pa and data)x to IOWB
    STATE_C18: begin  // {
                  // Extra check to make sure that RTL is writing to its IOWB, too.
                  if (!b0_rdma_wren) begin // {
                    `PR_ERROR("pli_ldst",`ERROR,"Bench ERROR - Capture State Machine - b0_rdma_wren is not asserted when it is expected to be asserted.");
                  end // }
                  else begin // {
                    b0_write_iowb (b0_push_index);
                    b0_push_index = b0_push_index + 1;
                  end // }
                  b0_state_capture <= STATE_C0;
              end // }

    default:  begin  // {
                `PR_ERROR("pli_ldst",`ERROR,"Bench ERROR - ldst_dma Capture State Machine 0 should not hit default state");
              end // }

  endcase

end // always}

//----------------------------------------------------------
// Task to save data captured on SIU -> L2 interface into IOWB
task b0_write_iowb;

input [1:0] index;

  begin
    `PR_INFO("ldst_dma",`INFO,"Push to B0 IOWB. index=%d pa=%h D0=%h",
                              index,b0_siu_pa,b0_siu_d0);
    case (index)
      2'h0: begin
              if (b0_iowb0_valid) begin
                `PR_ERROR("pli_ldst",`ERROR,"Bench ERROR - b0_iowb0 Overflow.");
              end
              else begin
                b0_iowb0_valid <= 1'b1;
              end

              b0_iowb0_pa  <= b0_siu_pa;
              b0_iowb0[0]  <= b0_siu_d0;
              b0_iowb0[1]  <= b0_siu_d1;
              b0_iowb0[2]  <= b0_siu_d2;
              b0_iowb0[3]  <= b0_siu_d3;
              b0_iowb0[4]  <= b0_siu_d4;
              b0_iowb0[5]  <= b0_siu_d5;
              b0_iowb0[6]  <= b0_siu_d6;
              b0_iowb0[7]  <= b0_siu_d7;
              b0_iowb0[8]  <= b0_siu_d8;
              b0_iowb0[9]  <= b0_siu_d9;
              b0_iowb0[10] <= b0_siu_d10;
              b0_iowb0[11] <= b0_siu_d11;
              b0_iowb0[12] <= b0_siu_d12;
              b0_iowb0[13] <= b0_siu_d13;
              b0_iowb0[14] <= b0_siu_d14;
              b0_iowb0[15] <= b0_siu_d15;
            end
      2'h1: begin
              if (b0_iowb1_valid) begin
                `PR_ERROR("pli_ldst",`ERROR,"Bench ERROR - b0_iowb1 Overflow.");
              end
              else begin
                b0_iowb1_valid <= 1'b1;
              end

              b0_iowb1_pa  <= b0_siu_pa;
              b0_iowb1[0]  <= b0_siu_d0;
              b0_iowb1[1]  <= b0_siu_d1;
              b0_iowb1[2]  <= b0_siu_d2;
              b0_iowb1[3]  <= b0_siu_d3;
              b0_iowb1[4]  <= b0_siu_d4;
              b0_iowb1[5]  <= b0_siu_d5;
              b0_iowb1[6]  <= b0_siu_d6;
              b0_iowb1[7]  <= b0_siu_d7;
              b0_iowb1[8]  <= b0_siu_d8;
              b0_iowb1[9]  <= b0_siu_d9;
              b0_iowb1[10] <= b0_siu_d10;
              b0_iowb1[11] <= b0_siu_d11;
              b0_iowb1[12] <= b0_siu_d12;
              b0_iowb1[13] <= b0_siu_d13;
              b0_iowb1[14] <= b0_siu_d14;
              b0_iowb1[15] <= b0_siu_d15;
            end
      2'h2: begin
              if (b0_iowb2_valid) begin
                `PR_ERROR("pli_ldst",`ERROR,"Bench ERROR - b0_iowb2 Overflow.");
              end
              else begin
                b0_iowb2_valid <= 1'b1;
              end

              b0_iowb2_pa  <= b0_siu_pa;
              b0_iowb2[0]  <= b0_siu_d0;
              b0_iowb2[1]  <= b0_siu_d1;
              b0_iowb2[2]  <= b0_siu_d2;
              b0_iowb2[3]  <= b0_siu_d3;
              b0_iowb2[4]  <= b0_siu_d4;
              b0_iowb2[5]  <= b0_siu_d5;
              b0_iowb2[6]  <= b0_siu_d6;
              b0_iowb2[7]  <= b0_siu_d7;
              b0_iowb2[8]  <= b0_siu_d8;
              b0_iowb2[9]  <= b0_siu_d9;
              b0_iowb2[10] <= b0_siu_d10;
              b0_iowb2[11] <= b0_siu_d11;
              b0_iowb2[12] <= b0_siu_d12;
              b0_iowb2[13] <= b0_siu_d13;
              b0_iowb2[14] <= b0_siu_d14;
              b0_iowb2[15] <= b0_siu_d15;
            end
      2'h3: begin
              if (b0_iowb3_valid) begin
                `PR_ERROR("pli_ldst",`ERROR,"Bench ERROR - b0_iowb3 Overflow.");
              end
              else begin
                b0_iowb3_valid <= 1'b1;
              end

              b0_iowb3_pa  <= b0_siu_pa;
              b0_iowb3[0]  <= b0_siu_d0;
              b0_iowb3[1]  <= b0_siu_d1;
              b0_iowb3[2]  <= b0_siu_d2;
              b0_iowb3[3]  <= b0_siu_d3;
              b0_iowb3[4]  <= b0_siu_d4;
              b0_iowb3[5]  <= b0_siu_d5;
              b0_iowb3[6]  <= b0_siu_d6;
              b0_iowb3[7]  <= b0_siu_d7;
              b0_iowb3[8]  <= b0_siu_d8;
              b0_iowb3[9]  <= b0_siu_d9;
              b0_iowb3[10] <= b0_siu_d10;
              b0_iowb3[11] <= b0_siu_d11;
              b0_iowb3[12] <= b0_siu_d12;
              b0_iowb3[13] <= b0_siu_d13;
              b0_iowb3[14] <= b0_siu_d14;
              b0_iowb3[15] <= b0_siu_d15;
            end
      default: begin
                `PR_ERROR("pli_ldst",`ERROR,"Bench ERROR - task write_iowb should not hit default state");
               end
    endcase    

  end
endtask

//----------------------------------------------------------
// Task to read data from IOWB and send to Riesling
task b0_read_iowb;

input [1:0] index;
input [3:0] tmp_evict;

  begin
    case (index)
      2'h0: 
          begin
            if (!b0_iowb0_valid) begin
              `PR_ERROR("pli_ldst",`ERROR,"Bench ERROR - b0_iowb0 Underflow.");
            end
            else begin
              b0_iowb0_valid <= 1'b0;
            end

           `PR_INFO("ldst_dma",`INFO,"Pop from B0 IOWB. index=%d pa=%h D0=%h",
                              index,b0_iowb0_pa,b0_iowb0[0]);

            // Call task to send NAS message
            // Send 8 Bytes at a time
            dma_store (b0_iowb0_pa,   {b0_iowb0[0], b0_iowb0[1]}, 8'hff,tmp_evict[0],8'd64,"B0 WRI 1");
            dma_store (b0_iowb0_pa+8, {b0_iowb0[2], b0_iowb0[3]}, 8'hff,tmp_evict[0],8'd64,"B0 WRI 2");
            dma_store (b0_iowb0_pa+16,{b0_iowb0[4], b0_iowb0[5]}, 8'hff,tmp_evict[1],8'd64,"B0 WRI 3");
            dma_store (b0_iowb0_pa+24,{b0_iowb0[6], b0_iowb0[7]}, 8'hff,tmp_evict[1],8'd64,"B0 WRI 4");
            dma_store (b0_iowb0_pa+32,{b0_iowb0[8], b0_iowb0[9]}, 8'hff,tmp_evict[2],8'd64,"B0 WRI 5");
            dma_store (b0_iowb0_pa+40,{b0_iowb0[10],b0_iowb0[11]},8'hff,tmp_evict[2],8'd64,"B0 WRI 6");
            dma_store (b0_iowb0_pa+48,{b0_iowb0[12],b0_iowb0[13]},8'hff,tmp_evict[3],8'd64,"B0 WRI 7");
            dma_store (b0_iowb0_pa+56,{b0_iowb0[14],b0_iowb0[15]},8'hff,tmp_evict[3],8'd64,"B0 WRI 8");
          end
      2'h1: 
          begin
            if (!b0_iowb1_valid) begin
              `PR_ERROR("pli_ldst",`ERROR,"Bench ERROR - b0_iowb1 Underflow.");
            end
            else begin
              b0_iowb1_valid <= 1'b0;
            end

           `PR_INFO("ldst_dma",`INFO,"Pop from B0 IOWB. index=%d pa=%h D0=%h",
                              index,b0_iowb1_pa,b0_iowb1[0]);

            // Call task to send NAS message
            // Send 8 Bytes at a time
            dma_store (b0_iowb1_pa,   {b0_iowb1[0], b0_iowb1[1]}, 8'hff,tmp_evict[0],8'd64,"B0 WRI 1");
            dma_store (b0_iowb1_pa+8, {b0_iowb1[2], b0_iowb1[3]}, 8'hff,tmp_evict[0],8'd64,"B0 WRI 2");
            dma_store (b0_iowb1_pa+16,{b0_iowb1[4], b0_iowb1[5]}, 8'hff,tmp_evict[1],8'd64,"B0 WRI 3");
            dma_store (b0_iowb1_pa+24,{b0_iowb1[6], b0_iowb1[7]}, 8'hff,tmp_evict[1],8'd64,"B0 WRI 4");
            dma_store (b0_iowb1_pa+32,{b0_iowb1[8], b0_iowb1[9]}, 8'hff,tmp_evict[2],8'd64,"B0 WRI 5");
            dma_store (b0_iowb1_pa+40,{b0_iowb1[10],b0_iowb1[11]},8'hff,tmp_evict[2],8'd64,"B0 WRI 6");
            dma_store (b0_iowb1_pa+48,{b0_iowb1[12],b0_iowb1[13]},8'hff,tmp_evict[3],8'd64,"B0 WRI 7");
            dma_store (b0_iowb1_pa+56,{b0_iowb1[14],b0_iowb1[15]},8'hff,tmp_evict[3],8'd64,"B0 WRI 8");
          end
      2'h2: 
          begin
            if (!b0_iowb2_valid) begin
              `PR_ERROR("pli_ldst",`ERROR,"Bench ERROR - b0_iowb2 Underflow.");
            end
            else begin
              b0_iowb2_valid <= 1'b0;
            end

           `PR_INFO("ldst_dma",`INFO,"Pop from B0 IOWB. index=%d pa=%h D0=%h",
                              index,b0_iowb2_pa,b0_iowb2[0]);

            // Call task to send NAS message
            // Send 8 Bytes at a time
            dma_store (b0_iowb2_pa,   {b0_iowb2[0], b0_iowb2[1]}, 8'hff,tmp_evict[0],8'd64,"B0 WRI 1");
            dma_store (b0_iowb2_pa+8, {b0_iowb2[2], b0_iowb2[3]}, 8'hff,tmp_evict[0],8'd64,"B0 WRI 2");
            dma_store (b0_iowb2_pa+16,{b0_iowb2[4], b0_iowb2[5]}, 8'hff,tmp_evict[1],8'd64,"B0 WRI 3");
            dma_store (b0_iowb2_pa+24,{b0_iowb2[6], b0_iowb2[7]}, 8'hff,tmp_evict[1],8'd64,"B0 WRI 4");
            dma_store (b0_iowb2_pa+32,{b0_iowb2[8], b0_iowb2[9]}, 8'hff,tmp_evict[2],8'd64,"B0 WRI 5");
            dma_store (b0_iowb2_pa+40,{b0_iowb2[10],b0_iowb2[11]},8'hff,tmp_evict[2],8'd64,"B0 WRI 6");
            dma_store (b0_iowb2_pa+48,{b0_iowb2[12],b0_iowb2[13]},8'hff,tmp_evict[3],8'd64,"B0 WRI 7");
            dma_store (b0_iowb2_pa+56,{b0_iowb2[14],b0_iowb2[15]},8'hff,tmp_evict[3],8'd64,"B0 WRI 8");
          end
      2'h3: 
          begin
            if (!b0_iowb3_valid) begin
              `PR_ERROR("pli_ldst",`ERROR,"Bench ERROR - b0_iowb3 Underflow.");
            end
            else begin
              b0_iowb3_valid <= 1'b0;
            end

           `PR_INFO("ldst_dma",`INFO,"Pop from B0 IOWB. index=%d pa=%h D0=%h",
                              index,b0_iowb3_pa,b0_iowb3[0]);

            // Call task to send NAS message
            // Send 8 Bytes at a time
            dma_store (b0_iowb3_pa,   {b0_iowb3[0], b0_iowb3[1]}, 8'hff,tmp_evict[0],8'd64,"B0 WRI 1");
            dma_store (b0_iowb3_pa+8, {b0_iowb3[2], b0_iowb3[3]}, 8'hff,tmp_evict[0],8'd64,"B0 WRI 2");
            dma_store (b0_iowb3_pa+16,{b0_iowb3[4], b0_iowb3[5]}, 8'hff,tmp_evict[1],8'd64,"B0 WRI 3");
            dma_store (b0_iowb3_pa+24,{b0_iowb3[6], b0_iowb3[7]}, 8'hff,tmp_evict[1],8'd64,"B0 WRI 4");
            dma_store (b0_iowb3_pa+32,{b0_iowb3[8], b0_iowb3[9]}, 8'hff,tmp_evict[2],8'd64,"B0 WRI 5");
            dma_store (b0_iowb3_pa+40,{b0_iowb3[10],b0_iowb3[11]},8'hff,tmp_evict[2],8'd64,"B0 WRI 6");
            dma_store (b0_iowb3_pa+48,{b0_iowb3[12],b0_iowb3[13]},8'hff,tmp_evict[3],8'd64,"B0 WRI 7");
            dma_store (b0_iowb3_pa+56,{b0_iowb3[14],b0_iowb3[15]},8'hff,tmp_evict[3],8'd64,"B0 WRI 8");
          end
      default: 
          begin
            `PR_ERROR("pli_ldst",`ERROR,"Bench ERROR - task read_iowb should not hit default state");
          end
    endcase    

  end
endtask

//----------------------------------------------------------
// Task to make sure the entry at the location pointed to by index is valid before we try to pop it.
task b0_chk_valid_entry;

input [1:0] index;

  begin
    case (index)
      2'h0: 
          begin
            if (b0_iowb0_valid != 1'b1) begin
              `PR_ERROR("pli_ldst",`ERROR,"Bench ERROR - the entry in IOWB at index=0 is not valid (b0_iowb0_valid!=1'b1)");
            end
          end
      2'h1: 
          begin
            if (b0_iowb1_valid != 1'b1) begin
              `PR_ERROR("pli_ldst",`ERROR,"Bench ERROR - the entry in IOWB at index=1 is not valid (b0_iowb1_valid!=1'b1)");
            end
          end
      2'h2: 
          begin
            if (b0_iowb2_valid != 1'b1) begin
              `PR_ERROR("pli_ldst",`ERROR,"Bench ERROR - the entry in IOWB at index=2 is not valid (b0_iowb2_valid!=1'b1)");
            end
          end
      2'h3: 
          begin
            if (b0_iowb3_valid != 1'b1) begin
              `PR_ERROR("pli_ldst",`ERROR,"Bench ERROR - the entry in IOWB at index=3 is not valid (b0_iowb3_valid!=1'b1)");
            end
          end
      default: 
          begin
            `PR_ERROR("pli_ldst",`ERROR,"Bench ERROR - task chk_valid_entry should not hit default state");
          end
    endcase
  end
endtask

  `endif // `ifdef NOL2RTL
`endif   // `ifdef NO_L2_BNK0

`ifdef NO_L2_BNK1
`else
  `ifdef NOL2RTL
  `else

//==========================================================
//==========================================================
// L2 RTL Probes

  //----------------------------------------------------------
  // Signals for L2 RTL Bank1

  //---------------------
  // SIU store

  wire                       b1_cam_hit_c5;
  reg                        b1_cam_hit_c52;
  reg                        b1_cam_hit_c6;
  reg                        b1_cam_hit_c7;
  reg                        b1_cam_hit_c8;
  wire                       b1_cam_hit;
  wire                       b1_inst_valid_c2;
  wire                       b1_wr8_inst_c2;
  wire                       b1_wr64_inst_c2;

  // If the cam hits, then there will be an eviction sent to the core(s)
  assign b1_cam_hit_c5       = |`CPU.l2t1.dc_cam_hit;
  assign b1_cam_hit          = b1_cam_hit_c8;
  assign b1_inst_valid_c2    = `CPU.l2t1.arb.arb_inst_vld_c2;
  assign b1_wr8_inst_c2      = `CPU.l2t1.arb.arb_decdp_wr8_inst_c2;
  assign b1_wr64_inst_c2     = `CPU.l2t1.arb.arb_decdp_wr64_inst_c2;

  //---------------------
  // WR8 signals
  wire                       b1_first_pass_c2;
  reg                        b1_first_pass_c3;
  reg                        b1_first_pass_c4;
  reg                        b1_first_pass_c5;
  reg                        b1_first_pass_c52;
  reg                        b1_first_pass_c6;
  reg                        b1_first_pass_c7;
  reg                        b1_first_pass_c8;
  wire                       b1_first_pass;
  wire                       b1_wr8_active_c2;
  reg                        b1_wr8_active_c3;
  reg                        b1_wr8_active_c4;
  reg                        b1_wr8_active_c5;
  reg                        b1_wr8_active_c52;
  reg                        b1_wr8_active_c6;
  reg                        b1_wr8_active_c7;
  reg                        b1_wr8_active_c8;
  wire                       b1_wr8_active;

  wire                [39:0] b1_siu_wr8_pa;
  wire                [63:0] b1_siu_wr8_data;
  wire                 [7:0] b1_siu_wr8_size;

  assign b1_wr8_active_c2       = `CPU.l2t1.arb_decdp_wr8_inst_c2;
  assign b1_wr8_active          = b1_wr8_active_c8;
  assign b1_first_pass_c2       = `CPU.l2t1.arbdec.arbdp_inst_c2[39]==0;
  assign b1_first_pass          = b1_first_pass_c8;
  assign b1_siu_wr8_pa          = `CPU.l2t1.arbadr.arbdp_addr_c8;
  assign b1_siu_wr8_data        = `CPU.l2t1.arbdat.arbdp_inst_data_c8;
  assign b1_siu_wr8_size        = `CPU.l2t1.arbdec.arbdec_arbdp_inst_size_c8;

  //---------------------
  // WRI signals
  reg                  [1:0] b1_pop_index;   // Index pointing to next entry to be read from IOWB
  reg                  [1:0] b1_push_index;  // Index pointing to next entry to be written from IOWB

  wire                       b1_wr64_active_c2;
  reg                        b1_wr64_active_c3;
  reg                        b1_wr64_active_c4;
  reg                        b1_wr64_active_c5;
  reg                        b1_wr64_active_c52;
  reg                        b1_wr64_active_c6;
  reg                        b1_wr64_active_c7;
  reg                        b1_wr64_active_c8;
  wire                       b1_wr64_active;

  wire                       b1_sii_l2t_req_vld;
  wire                [31:0] b1_sii_l2t_req_data;
  wire                       b1_rdma_wren;
  //wire               [1:0] b1_rdma_index;
  //wire               [3:0] b1_rdma_valid;

   reg                 [4:0] b1_state_capture;
   reg                [39:0] b1_siu_pa;
   reg                [31:0] b1_siu_d0;
   reg                [31:0] b1_siu_d1;
   reg                [31:0] b1_siu_d2;
   reg                [31:0] b1_siu_d3;
   reg                [31:0] b1_siu_d4;
   reg                [31:0] b1_siu_d5;
   reg                [31:0] b1_siu_d6;
   reg                [31:0] b1_siu_d7;
   reg                [31:0] b1_siu_d8;
   reg                [31:0] b1_siu_d9;
   reg                [31:0] b1_siu_d10;
   reg                [31:0] b1_siu_d11;
   reg                [31:0] b1_siu_d12;
   reg                [31:0] b1_siu_d13;
   reg                [31:0] b1_siu_d14;
   reg                [31:0] b1_siu_d15;

   // IOWB has 4 entries
   // Each entry has valid bit, pa, 64 Byte data
   reg                       b1_iowb0_valid;  // Indicates Bench has captured entire packet
   reg                       b1_iowb1_valid;
   reg                       b1_iowb2_valid;
   reg                       b1_iowb3_valid;
   reg                [39:0] b1_iowb0_pa;
   reg                [39:0] b1_iowb1_pa;
   reg                [39:0] b1_iowb2_pa;
   reg                [39:0] b1_iowb3_pa;
   reg                [31:0] b1_iowb0 [0:15];
   reg                [31:0] b1_iowb1 [0:15];
   reg                [31:0] b1_iowb2 [0:15];
   reg                [31:0] b1_iowb3 [0:15];

  assign b1_sii_l2t_req_vld     = `CPU.l2t1.sii_l2t_req_vld;
  assign b1_sii_l2t_req_data    = `CPU.l2t1.sii_l2t_req[31:0];

  assign b1_wr64_active_c2   = b1_inst_valid_c2 & b1_wr64_inst_c2;
  assign b1_wr64_active      = b1_wr64_active_c8;

  // Indicates when rdma_index is valid
  assign b1_rdma_wren           = `CPU.l2b1.evict_l2t_l2b_rdma_wren_s3_v1 | 
                                       `CPU.l2b1.evict_l2t_l2b_rdma_wren_s3_v2 | 
                                       `CPU.l2b1.evict_l2t_l2b_rdma_wren_s3_v3 | 
                                       `CPU.l2b1.evict_l2t_l2b_rdma_wren_s3_v4;

  
  // IOWB entry index = 0,1,2,3
  //assign b1_rdma_index          = `CPU.l2b1.evict_l2t_l2b_rdma_wrwl_s3_v1[1:0];
  // Indicates that any future transactions will see this entry's store data.
  // The bit that is asserted corresponds to the index in the IOWB.
  //assign b1_rdma_valid          = `CPU.l2t1.rdmat.rdma_valid[3:0];

//---------------------
initial
  begin
    b1_pop_index = 2'b0;
    b1_push_index = 2'b0;
    b1_state_capture = STATE_C0;   // Idle state
    b1_iowb0_valid = 1'h0;
    b1_iowb1_valid = 1'h0;
    b1_iowb2_valid = 1'h0;
    b1_iowb3_valid = 1'h0;
    b1_iowb0_pa = 40'h0;
    b1_iowb1_pa = 40'h0;
    b1_iowb2_pa = 40'h0;
    b1_iowb3_pa = 40'h0;
    b1_siu_pa = 40'h0;
    b1_siu_d0 = 32'b0;
    b1_siu_d1 = 32'b0;
    b1_siu_d2 = 32'b0;
    b1_siu_d3 = 32'b0;
    b1_siu_d4 = 32'b0;
    b1_siu_d5 = 32'b0;
    b1_siu_d6 = 32'b0;
    b1_siu_d7 = 32'b0;
    b1_siu_d8 = 32'b0;
    b1_siu_d9 = 32'b0;
    b1_siu_d10 = 32'b0;
    b1_siu_d11 = 32'b0;
    b1_siu_d12 = 32'b0;
    b1_siu_d13 = 32'b0;
    b1_siu_d14 = 32'b0;
    b1_siu_d15 = 32'b0;
  end

//==========================================================
//==========================================================

always @ (posedge `BENCH_L2T1_GCLK) begin // {

  //------------------------------
  //  Pipeline signals

  //------------------------------
  //  L2 RTL Bank1  (not needed for L2 Stub)

  b1_cam_hit_c52 <= b1_cam_hit_c5;
  b1_cam_hit_c6  <= b1_cam_hit_c52;
  b1_cam_hit_c7  <= b1_cam_hit_c6;
  b1_cam_hit_c8  <= b1_cam_hit_c7;

  b1_first_pass_c3  <= b1_first_pass_c2;
  b1_first_pass_c4  <= b1_first_pass_c3;
  b1_first_pass_c5  <= b1_first_pass_c4;
  b1_first_pass_c52 <= b1_first_pass_c5;
  b1_first_pass_c6  <= b1_first_pass_c52;
  b1_first_pass_c7  <= b1_first_pass_c6;
  b1_first_pass_c8  <= b1_first_pass_c7;

  b1_wr8_active_c3  <= b1_wr8_active_c2;
  b1_wr8_active_c4  <= b1_wr8_active_c3;
  b1_wr8_active_c5  <= b1_wr8_active_c4;
  b1_wr8_active_c52 <= b1_wr8_active_c5;
  b1_wr8_active_c6  <= b1_wr8_active_c52;
  b1_wr8_active_c7  <= b1_wr8_active_c6;
  b1_wr8_active_c8  <= b1_wr8_active_c7;

  b1_wr64_active_c3  <= b1_wr64_active_c2;
  b1_wr64_active_c4  <= b1_wr64_active_c3;
  b1_wr64_active_c5  <= b1_wr64_active_c4;
  b1_wr64_active_c52 <= b1_wr64_active_c5;
  b1_wr64_active_c6  <= b1_wr64_active_c52;
  b1_wr64_active_c7  <= b1_wr64_active_c6;
  b1_wr64_active_c8  <= b1_wr64_active_c7;

  //----------------------------------------------------------
  //----------------------------------------------------------
  // SIU Store - WR8

  
  //       only do this if the transfers don't match up in c8.

  if (b1_wr8_active && b1_first_pass) begin // {
    // Send msgs to Riesling
    dma_store (b1_siu_wr8_pa,b1_siu_wr8_data,b1_siu_wr8_size,b1_cam_hit,8'd8,"B1 WR8");
  end // }

  //----------------------------------------------------------
  //----------------------------------------------------------
  // SIU Store - WRI

  //------------------------------
  // Send MemorySlam message after SIU transaction is complete
  // Read IOWB data and Send msgs to Riesling

  if (b1_wr64_active && b1_first_pass) begin // {

    // Determine which of the 8 DMA_STOREs will be evicted.
    // WRI is 64 Bytes.
    // Eviction is 16 Bytes at a time.
    // So, there can be 1-4 Evictions for a single WRI.
    b1_ev_vect0 = b1_ev_invvect[31:0];
    b1_ev_vect1 = b1_ev_invvect[55:32];
    b1_ev_vect2 = b1_ev_invvect[87:56];
    b1_ev_vect3 = b1_ev_invvect[111:88];

    b1_inv_vect[0] = get_vect(b1_ev_vect0);
    b1_inv_vect[1] = get_vect31(b1_ev_vect1);  // different function for odd inval vector
    b1_inv_vect[2] = get_vect(b1_ev_vect2);
    b1_inv_vect[3] = get_vect31(b1_ev_vect3);  // different function for odd inval vector

    //Get entry from IOWB and send message
    b1_chk_valid_entry(b1_pop_index);
    b1_read_iowb(b1_pop_index,
                        {|b1_inv_vect[3],|b1_inv_vect[2],|b1_inv_vect[1],|b1_inv_vect[0]});
    b1_pop_index = b1_pop_index + 1;
  end // }

  //------------------------------
  // Capture state machine
  // Capture pa and data (64 Bytes) off SIU to L2 interface.
  // See SIU MAS (about page 49) for WRI packet format.
  // Put packet in IOWB which had 4 entries.
  // This IOWB in the Bench is not exactly the same as the IOWB in RTL.
  // Bench IOWB is a FIFO and RTL IOWB is not a FIFO.

  case (b1_state_capture)

    // Capture pa (part 1)
    STATE_C0: begin  // {
                // WRI pkt if req_data[26:24]==3'b100
                if ((b1_sii_l2t_req_vld)&&(b1_sii_l2t_req_data[26:24]==3'b100)) begin // {
                  b1_siu_pa[39:32] <= b1_sii_l2t_req_data[7:0];
                  b1_state_capture <= STATE_C1;
                end // }
              end // }

    // Capture pa (part 2)
    STATE_C1: begin  // {
                  b1_siu_pa[31:0] <= b1_sii_l2t_req_data[31:0];
                  b1_state_capture <= STATE_C2;
              end // }

    // Capture 4 data bytes
    STATE_C2: begin  // {
                  b1_siu_d0 <= b1_sii_l2t_req_data[31:0];
                  b1_state_capture <= STATE_C3;
              end // }

    // Capture 4 data bytes
    STATE_C3: begin  // {
                  b1_siu_d1 <= b1_sii_l2t_req_data[31:0];
                  b1_state_capture <= STATE_C4;
              end // }

    // Capture 4 data bytes
    STATE_C4: begin  // {
                  b1_siu_d2 <= b1_sii_l2t_req_data[31:0];
                  b1_state_capture <= STATE_C5;
              end // }

    // Capture 4 data bytes
    STATE_C5: begin  // {
                  b1_siu_d3 <= b1_sii_l2t_req_data[31:0];
                  b1_state_capture <= STATE_C6;
              end // }

    // Capture 4 data bytes
    STATE_C6: begin  // {
                  b1_siu_d4 <= b1_sii_l2t_req_data[31:0];
                  b1_state_capture <= STATE_C7;
              end // }

    // Capture 4 data bytes
    STATE_C7: begin  // {
                  b1_siu_d5 <= b1_sii_l2t_req_data[31:0];
                  b1_state_capture <= STATE_C8;
              end // }

    // Capture 4 data bytes
    STATE_C8: begin  // {
                  b1_siu_d6 <= b1_sii_l2t_req_data[31:0];
                  b1_state_capture <= STATE_C9;
              end // }

    // Capture 4 data bytes
    STATE_C9: begin  // {
                  b1_siu_d7 <= b1_sii_l2t_req_data[31:0];
                  b1_state_capture <= STATE_C10;
              end // }

    // Capture 4 data bytes
    STATE_C10: begin  // {
                  b1_siu_d8 <= b1_sii_l2t_req_data[31:0];
                  b1_state_capture <= STATE_C11;
              end // }

    // Capture 4 data bytes
    STATE_C11: begin  // {
                  b1_siu_d9 <= b1_sii_l2t_req_data[31:0];
                  b1_state_capture <= STATE_C12;
              end // }

    // Capture 4 data bytes
    STATE_C12: begin  // {
                  b1_siu_d10 <= b1_sii_l2t_req_data[31:0];
                  b1_state_capture <= STATE_C13;
              end // }

    // Capture 4 data bytes
    STATE_C13: begin  // {
                  b1_siu_d11 <= b1_sii_l2t_req_data[31:0];
                  b1_state_capture <= STATE_C14;
              end // }

    // Capture 4 data bytes
    STATE_C14: begin  // {
                  b1_siu_d12 <= b1_sii_l2t_req_data[31:0];
                  b1_state_capture <= STATE_C15;
              end // }

    // Capture 4 data bytes
    STATE_C15: begin  // {
                  b1_siu_d13 <= b1_sii_l2t_req_data[31:0];
                  b1_state_capture <= STATE_C16;
              end // }

    // Capture 4 data bytes
    STATE_C16: begin  // {
                  b1_siu_d14 <= b1_sii_l2t_req_data[31:0];
                  b1_state_capture <= STATE_C17;
              end // }

    // Capture 4 data bytes
    STATE_C17: begin  // {
                  b1_siu_d15 <= b1_sii_l2t_req_data[31:0];
                  b1_state_capture <= STATE_C18;
              end // }

    // Save WRI packet (pa and data)x to IOWB
    STATE_C18: begin  // {
                  // Extra check to make sure that RTL is writing to its IOWB, too.
                  if (!b1_rdma_wren) begin // {
                    `PR_ERROR("pli_ldst",`ERROR,"Bench ERROR - Capture State Machine - b1_rdma_wren is not asserted when it is expected to be asserted.");
                  end // }
                  else begin // {
                    b1_write_iowb (b1_push_index);
                    b1_push_index = b1_push_index + 1;
                  end // }
                  b1_state_capture <= STATE_C0;
              end // }

    default:  begin  // {
                `PR_ERROR("pli_ldst",`ERROR,"Bench ERROR - ldst_dma Capture State Machine 1 should not hit default state");
              end // }

  endcase

end // always}

//----------------------------------------------------------
// Task to save data captured on SIU -> L2 interface into IOWB
task b1_write_iowb;

input [1:0] index;

  begin
    `PR_INFO("ldst_dma",`INFO,"Push to B1 IOWB. index=%d pa=%h D0=%h",
                              index,b1_siu_pa,b1_siu_d0);
    case (index)
      2'h0: begin
              if (b1_iowb0_valid) begin
                `PR_ERROR("pli_ldst",`ERROR,"Bench ERROR - b1_iowb0 Overflow.");
              end
              else begin
                b1_iowb0_valid <= 1'b1;
              end

              b1_iowb0_pa  <= b1_siu_pa;
              b1_iowb0[0]  <= b1_siu_d0;
              b1_iowb0[1]  <= b1_siu_d1;
              b1_iowb0[2]  <= b1_siu_d2;
              b1_iowb0[3]  <= b1_siu_d3;
              b1_iowb0[4]  <= b1_siu_d4;
              b1_iowb0[5]  <= b1_siu_d5;
              b1_iowb0[6]  <= b1_siu_d6;
              b1_iowb0[7]  <= b1_siu_d7;
              b1_iowb0[8]  <= b1_siu_d8;
              b1_iowb0[9]  <= b1_siu_d9;
              b1_iowb0[10] <= b1_siu_d10;
              b1_iowb0[11] <= b1_siu_d11;
              b1_iowb0[12] <= b1_siu_d12;
              b1_iowb0[13] <= b1_siu_d13;
              b1_iowb0[14] <= b1_siu_d14;
              b1_iowb0[15] <= b1_siu_d15;
            end
      2'h1: begin
              if (b1_iowb1_valid) begin
                `PR_ERROR("pli_ldst",`ERROR,"Bench ERROR - b1_iowb1 Overflow.");
              end
              else begin
                b1_iowb1_valid <= 1'b1;
              end

              b1_iowb1_pa  <= b1_siu_pa;
              b1_iowb1[0]  <= b1_siu_d0;
              b1_iowb1[1]  <= b1_siu_d1;
              b1_iowb1[2]  <= b1_siu_d2;
              b1_iowb1[3]  <= b1_siu_d3;
              b1_iowb1[4]  <= b1_siu_d4;
              b1_iowb1[5]  <= b1_siu_d5;
              b1_iowb1[6]  <= b1_siu_d6;
              b1_iowb1[7]  <= b1_siu_d7;
              b1_iowb1[8]  <= b1_siu_d8;
              b1_iowb1[9]  <= b1_siu_d9;
              b1_iowb1[10] <= b1_siu_d10;
              b1_iowb1[11] <= b1_siu_d11;
              b1_iowb1[12] <= b1_siu_d12;
              b1_iowb1[13] <= b1_siu_d13;
              b1_iowb1[14] <= b1_siu_d14;
              b1_iowb1[15] <= b1_siu_d15;
            end
      2'h2: begin
              if (b1_iowb2_valid) begin
                `PR_ERROR("pli_ldst",`ERROR,"Bench ERROR - b1_iowb2 Overflow.");
              end
              else begin
                b1_iowb2_valid <= 1'b1;
              end

              b1_iowb2_pa  <= b1_siu_pa;
              b1_iowb2[0]  <= b1_siu_d0;
              b1_iowb2[1]  <= b1_siu_d1;
              b1_iowb2[2]  <= b1_siu_d2;
              b1_iowb2[3]  <= b1_siu_d3;
              b1_iowb2[4]  <= b1_siu_d4;
              b1_iowb2[5]  <= b1_siu_d5;
              b1_iowb2[6]  <= b1_siu_d6;
              b1_iowb2[7]  <= b1_siu_d7;
              b1_iowb2[8]  <= b1_siu_d8;
              b1_iowb2[9]  <= b1_siu_d9;
              b1_iowb2[10] <= b1_siu_d10;
              b1_iowb2[11] <= b1_siu_d11;
              b1_iowb2[12] <= b1_siu_d12;
              b1_iowb2[13] <= b1_siu_d13;
              b1_iowb2[14] <= b1_siu_d14;
              b1_iowb2[15] <= b1_siu_d15;
            end
      2'h3: begin
              if (b1_iowb3_valid) begin
                `PR_ERROR("pli_ldst",`ERROR,"Bench ERROR - b1_iowb3 Overflow.");
              end
              else begin
                b1_iowb3_valid <= 1'b1;
              end

              b1_iowb3_pa  <= b1_siu_pa;
              b1_iowb3[0]  <= b1_siu_d0;
              b1_iowb3[1]  <= b1_siu_d1;
              b1_iowb3[2]  <= b1_siu_d2;
              b1_iowb3[3]  <= b1_siu_d3;
              b1_iowb3[4]  <= b1_siu_d4;
              b1_iowb3[5]  <= b1_siu_d5;
              b1_iowb3[6]  <= b1_siu_d6;
              b1_iowb3[7]  <= b1_siu_d7;
              b1_iowb3[8]  <= b1_siu_d8;
              b1_iowb3[9]  <= b1_siu_d9;
              b1_iowb3[10] <= b1_siu_d10;
              b1_iowb3[11] <= b1_siu_d11;
              b1_iowb3[12] <= b1_siu_d12;
              b1_iowb3[13] <= b1_siu_d13;
              b1_iowb3[14] <= b1_siu_d14;
              b1_iowb3[15] <= b1_siu_d15;
            end
      default: begin
                `PR_ERROR("pli_ldst",`ERROR,"Bench ERROR - task write_iowb should not hit default state");
               end
    endcase    

  end
endtask

//----------------------------------------------------------
// Task to read data from IOWB and send to Riesling
task b1_read_iowb;

input [1:0] index;
input [3:0] tmp_evict;

  begin
    case (index)
      2'h0: 
          begin
            if (!b1_iowb0_valid) begin
              `PR_ERROR("pli_ldst",`ERROR,"Bench ERROR - b1_iowb0 Underflow.");
            end
            else begin
              b1_iowb0_valid <= 1'b0;
            end

           `PR_INFO("ldst_dma",`INFO,"Pop from B1 IOWB. index=%d pa=%h D0=%h",
                              index,b1_iowb0_pa,b1_iowb0[0]);

            // Call task to send NAS message
            // Send 8 Bytes at a time
            dma_store (b1_iowb0_pa,   {b1_iowb0[0], b1_iowb0[1]}, 8'hff,tmp_evict[0],8'd64,"B1 WRI 1");
            dma_store (b1_iowb0_pa+8, {b1_iowb0[2], b1_iowb0[3]}, 8'hff,tmp_evict[0],8'd64,"B1 WRI 2");
            dma_store (b1_iowb0_pa+16,{b1_iowb0[4], b1_iowb0[5]}, 8'hff,tmp_evict[1],8'd64,"B1 WRI 3");
            dma_store (b1_iowb0_pa+24,{b1_iowb0[6], b1_iowb0[7]}, 8'hff,tmp_evict[1],8'd64,"B1 WRI 4");
            dma_store (b1_iowb0_pa+32,{b1_iowb0[8], b1_iowb0[9]}, 8'hff,tmp_evict[2],8'd64,"B1 WRI 5");
            dma_store (b1_iowb0_pa+40,{b1_iowb0[10],b1_iowb0[11]},8'hff,tmp_evict[2],8'd64,"B1 WRI 6");
            dma_store (b1_iowb0_pa+48,{b1_iowb0[12],b1_iowb0[13]},8'hff,tmp_evict[3],8'd64,"B1 WRI 7");
            dma_store (b1_iowb0_pa+56,{b1_iowb0[14],b1_iowb0[15]},8'hff,tmp_evict[3],8'd64,"B1 WRI 8");
          end
      2'h1: 
          begin
            if (!b1_iowb1_valid) begin
              `PR_ERROR("pli_ldst",`ERROR,"Bench ERROR - b1_iowb1 Underflow.");
            end
            else begin
              b1_iowb1_valid <= 1'b0;
            end

           `PR_INFO("ldst_dma",`INFO,"Pop from B1 IOWB. index=%d pa=%h D0=%h",
                              index,b1_iowb1_pa,b1_iowb1[0]);

            // Call task to send NAS message
            // Send 8 Bytes at a time
            dma_store (b1_iowb1_pa,   {b1_iowb1[0], b1_iowb1[1]}, 8'hff,tmp_evict[0],8'd64,"B1 WRI 1");
            dma_store (b1_iowb1_pa+8, {b1_iowb1[2], b1_iowb1[3]}, 8'hff,tmp_evict[0],8'd64,"B1 WRI 2");
            dma_store (b1_iowb1_pa+16,{b1_iowb1[4], b1_iowb1[5]}, 8'hff,tmp_evict[1],8'd64,"B1 WRI 3");
            dma_store (b1_iowb1_pa+24,{b1_iowb1[6], b1_iowb1[7]}, 8'hff,tmp_evict[1],8'd64,"B1 WRI 4");
            dma_store (b1_iowb1_pa+32,{b1_iowb1[8], b1_iowb1[9]}, 8'hff,tmp_evict[2],8'd64,"B1 WRI 5");
            dma_store (b1_iowb1_pa+40,{b1_iowb1[10],b1_iowb1[11]},8'hff,tmp_evict[2],8'd64,"B1 WRI 6");
            dma_store (b1_iowb1_pa+48,{b1_iowb1[12],b1_iowb1[13]},8'hff,tmp_evict[3],8'd64,"B1 WRI 7");
            dma_store (b1_iowb1_pa+56,{b1_iowb1[14],b1_iowb1[15]},8'hff,tmp_evict[3],8'd64,"B1 WRI 8");
          end
      2'h2: 
          begin
            if (!b1_iowb2_valid) begin
              `PR_ERROR("pli_ldst",`ERROR,"Bench ERROR - b1_iowb2 Underflow.");
            end
            else begin
              b1_iowb2_valid <= 1'b0;
            end

           `PR_INFO("ldst_dma",`INFO,"Pop from B1 IOWB. index=%d pa=%h D0=%h",
                              index,b1_iowb2_pa,b1_iowb2[0]);

            // Call task to send NAS message
            // Send 8 Bytes at a time
            dma_store (b1_iowb2_pa,   {b1_iowb2[0], b1_iowb2[1]}, 8'hff,tmp_evict[0],8'd64,"B1 WRI 1");
            dma_store (b1_iowb2_pa+8, {b1_iowb2[2], b1_iowb2[3]}, 8'hff,tmp_evict[0],8'd64,"B1 WRI 2");
            dma_store (b1_iowb2_pa+16,{b1_iowb2[4], b1_iowb2[5]}, 8'hff,tmp_evict[1],8'd64,"B1 WRI 3");
            dma_store (b1_iowb2_pa+24,{b1_iowb2[6], b1_iowb2[7]}, 8'hff,tmp_evict[1],8'd64,"B1 WRI 4");
            dma_store (b1_iowb2_pa+32,{b1_iowb2[8], b1_iowb2[9]}, 8'hff,tmp_evict[2],8'd64,"B1 WRI 5");
            dma_store (b1_iowb2_pa+40,{b1_iowb2[10],b1_iowb2[11]},8'hff,tmp_evict[2],8'd64,"B1 WRI 6");
            dma_store (b1_iowb2_pa+48,{b1_iowb2[12],b1_iowb2[13]},8'hff,tmp_evict[3],8'd64,"B1 WRI 7");
            dma_store (b1_iowb2_pa+56,{b1_iowb2[14],b1_iowb2[15]},8'hff,tmp_evict[3],8'd64,"B1 WRI 8");
          end
      2'h3: 
          begin
            if (!b1_iowb3_valid) begin
              `PR_ERROR("pli_ldst",`ERROR,"Bench ERROR - b1_iowb3 Underflow.");
            end
            else begin
              b1_iowb3_valid <= 1'b0;
            end

           `PR_INFO("ldst_dma",`INFO,"Pop from B1 IOWB. index=%d pa=%h D0=%h",
                              index,b1_iowb3_pa,b1_iowb3[0]);

            // Call task to send NAS message
            // Send 8 Bytes at a time
            dma_store (b1_iowb3_pa,   {b1_iowb3[0], b1_iowb3[1]}, 8'hff,tmp_evict[0],8'd64,"B1 WRI 1");
            dma_store (b1_iowb3_pa+8, {b1_iowb3[2], b1_iowb3[3]}, 8'hff,tmp_evict[0],8'd64,"B1 WRI 2");
            dma_store (b1_iowb3_pa+16,{b1_iowb3[4], b1_iowb3[5]}, 8'hff,tmp_evict[1],8'd64,"B1 WRI 3");
            dma_store (b1_iowb3_pa+24,{b1_iowb3[6], b1_iowb3[7]}, 8'hff,tmp_evict[1],8'd64,"B1 WRI 4");
            dma_store (b1_iowb3_pa+32,{b1_iowb3[8], b1_iowb3[9]}, 8'hff,tmp_evict[2],8'd64,"B1 WRI 5");
            dma_store (b1_iowb3_pa+40,{b1_iowb3[10],b1_iowb3[11]},8'hff,tmp_evict[2],8'd64,"B1 WRI 6");
            dma_store (b1_iowb3_pa+48,{b1_iowb3[12],b1_iowb3[13]},8'hff,tmp_evict[3],8'd64,"B1 WRI 7");
            dma_store (b1_iowb3_pa+56,{b1_iowb3[14],b1_iowb3[15]},8'hff,tmp_evict[3],8'd64,"B1 WRI 8");
          end
      default: 
          begin
            `PR_ERROR("pli_ldst",`ERROR,"Bench ERROR - task read_iowb should not hit default state");
          end
    endcase    

  end
endtask

//----------------------------------------------------------
// Task to make sure the entry at the location pointed to by index is valid before we try to pop it.
task b1_chk_valid_entry;

input [1:0] index;

  begin
    case (index)
      2'h0: 
          begin
            if (b1_iowb0_valid != 1'b1) begin
              `PR_ERROR("pli_ldst",`ERROR,"Bench ERROR - the entry in IOWB at index=0 is not valid (b1_iowb0_valid!=1'b1)");
            end
          end
      2'h1: 
          begin
            if (b1_iowb1_valid != 1'b1) begin
              `PR_ERROR("pli_ldst",`ERROR,"Bench ERROR - the entry in IOWB at index=1 is not valid (b1_iowb1_valid!=1'b1)");
            end
          end
      2'h2: 
          begin
            if (b1_iowb2_valid != 1'b1) begin
              `PR_ERROR("pli_ldst",`ERROR,"Bench ERROR - the entry in IOWB at index=2 is not valid (b1_iowb2_valid!=1'b1)");
            end
          end
      2'h3: 
          begin
            if (b1_iowb3_valid != 1'b1) begin
              `PR_ERROR("pli_ldst",`ERROR,"Bench ERROR - the entry in IOWB at index=3 is not valid (b1_iowb3_valid!=1'b1)");
            end
          end
      default: 
          begin
            `PR_ERROR("pli_ldst",`ERROR,"Bench ERROR - task chk_valid_entry should not hit default state");
          end
    endcase
  end
endtask

  `endif // `ifdef NOL2RTL
`endif   // `ifdef NO_L2_BNK1

`ifdef NO_L2_BNK2
`else
  `ifdef NOL2RTL
  `else

//==========================================================
//==========================================================
// L2 RTL Probes

  //----------------------------------------------------------
  // Signals for L2 RTL Bank2

  //---------------------
  // SIU store

  wire                       b2_cam_hit_c5;
  reg                        b2_cam_hit_c52;
  reg                        b2_cam_hit_c6;
  reg                        b2_cam_hit_c7;
  reg                        b2_cam_hit_c8;
  wire                       b2_cam_hit;
  wire                       b2_inst_valid_c2;
  wire                       b2_wr8_inst_c2;
  wire                       b2_wr64_inst_c2;

  // If the cam hits, then there will be an eviction sent to the core(s)
  assign b2_cam_hit_c5       = |`CPU.l2t2.dc_cam_hit;
  assign b2_cam_hit          = b2_cam_hit_c8;
  assign b2_inst_valid_c2    = `CPU.l2t2.arb.arb_inst_vld_c2;
  assign b2_wr8_inst_c2      = `CPU.l2t2.arb.arb_decdp_wr8_inst_c2;
  assign b2_wr64_inst_c2     = `CPU.l2t2.arb.arb_decdp_wr64_inst_c2;

  //---------------------
  // WR8 signals
  wire                       b2_first_pass_c2;
  reg                        b2_first_pass_c3;
  reg                        b2_first_pass_c4;
  reg                        b2_first_pass_c5;
  reg                        b2_first_pass_c52;
  reg                        b2_first_pass_c6;
  reg                        b2_first_pass_c7;
  reg                        b2_first_pass_c8;
  wire                       b2_first_pass;
  wire                       b2_wr8_active_c2;
  reg                        b2_wr8_active_c3;
  reg                        b2_wr8_active_c4;
  reg                        b2_wr8_active_c5;
  reg                        b2_wr8_active_c52;
  reg                        b2_wr8_active_c6;
  reg                        b2_wr8_active_c7;
  reg                        b2_wr8_active_c8;
  wire                       b2_wr8_active;

  wire                [39:0] b2_siu_wr8_pa;
  wire                [63:0] b2_siu_wr8_data;
  wire                 [7:0] b2_siu_wr8_size;

  assign b2_wr8_active_c2       = `CPU.l2t2.arb_decdp_wr8_inst_c2;
  assign b2_wr8_active          = b2_wr8_active_c8;
  assign b2_first_pass_c2       = `CPU.l2t2.arbdec.arbdp_inst_c2[39]==0;
  assign b2_first_pass          = b2_first_pass_c8;
  assign b2_siu_wr8_pa          = `CPU.l2t2.arbadr.arbdp_addr_c8;
  assign b2_siu_wr8_data        = `CPU.l2t2.arbdat.arbdp_inst_data_c8;
  assign b2_siu_wr8_size        = `CPU.l2t2.arbdec.arbdec_arbdp_inst_size_c8;

  //---------------------
  // WRI signals
  reg                  [1:0] b2_pop_index;   // Index pointing to next entry to be read from IOWB
  reg                  [1:0] b2_push_index;  // Index pointing to next entry to be written from IOWB

  wire                       b2_wr64_active_c2;
  reg                        b2_wr64_active_c3;
  reg                        b2_wr64_active_c4;
  reg                        b2_wr64_active_c5;
  reg                        b2_wr64_active_c52;
  reg                        b2_wr64_active_c6;
  reg                        b2_wr64_active_c7;
  reg                        b2_wr64_active_c8;
  wire                       b2_wr64_active;

  wire                       b2_sii_l2t_req_vld;
  wire                [31:0] b2_sii_l2t_req_data;
  wire                       b2_rdma_wren;
  //wire               [1:0] b2_rdma_index;
  //wire               [3:0] b2_rdma_valid;

   reg                 [4:0] b2_state_capture;
   reg                [39:0] b2_siu_pa;
   reg                [31:0] b2_siu_d0;
   reg                [31:0] b2_siu_d1;
   reg                [31:0] b2_siu_d2;
   reg                [31:0] b2_siu_d3;
   reg                [31:0] b2_siu_d4;
   reg                [31:0] b2_siu_d5;
   reg                [31:0] b2_siu_d6;
   reg                [31:0] b2_siu_d7;
   reg                [31:0] b2_siu_d8;
   reg                [31:0] b2_siu_d9;
   reg                [31:0] b2_siu_d10;
   reg                [31:0] b2_siu_d11;
   reg                [31:0] b2_siu_d12;
   reg                [31:0] b2_siu_d13;
   reg                [31:0] b2_siu_d14;
   reg                [31:0] b2_siu_d15;

   // IOWB has 4 entries
   // Each entry has valid bit, pa, 64 Byte data
   reg                       b2_iowb0_valid;  // Indicates Bench has captured entire packet
   reg                       b2_iowb1_valid;
   reg                       b2_iowb2_valid;
   reg                       b2_iowb3_valid;
   reg                [39:0] b2_iowb0_pa;
   reg                [39:0] b2_iowb1_pa;
   reg                [39:0] b2_iowb2_pa;
   reg                [39:0] b2_iowb3_pa;
   reg                [31:0] b2_iowb0 [0:15];
   reg                [31:0] b2_iowb1 [0:15];
   reg                [31:0] b2_iowb2 [0:15];
   reg                [31:0] b2_iowb3 [0:15];

  assign b2_sii_l2t_req_vld     = `CPU.l2t2.sii_l2t_req_vld;
  assign b2_sii_l2t_req_data    = `CPU.l2t2.sii_l2t_req[31:0];

  assign b2_wr64_active_c2   = b2_inst_valid_c2 & b2_wr64_inst_c2;
  assign b2_wr64_active      = b2_wr64_active_c8;

  // Indicates when rdma_index is valid
  assign b2_rdma_wren           = `CPU.l2b2.evict_l2t_l2b_rdma_wren_s3_v1 | 
                                       `CPU.l2b2.evict_l2t_l2b_rdma_wren_s3_v2 | 
                                       `CPU.l2b2.evict_l2t_l2b_rdma_wren_s3_v3 | 
                                       `CPU.l2b2.evict_l2t_l2b_rdma_wren_s3_v4;

  
  // IOWB entry index = 0,1,2,3
  //assign b2_rdma_index          = `CPU.l2b2.evict_l2t_l2b_rdma_wrwl_s3_v1[1:0];
  // Indicates that any future transactions will see this entry's store data.
  // The bit that is asserted corresponds to the index in the IOWB.
  //assign b2_rdma_valid          = `CPU.l2t2.rdmat.rdma_valid[3:0];

//---------------------
initial
  begin
    b2_pop_index = 2'b0;
    b2_push_index = 2'b0;
    b2_state_capture = STATE_C0;   // Idle state
    b2_iowb0_valid = 1'h0;
    b2_iowb1_valid = 1'h0;
    b2_iowb2_valid = 1'h0;
    b2_iowb3_valid = 1'h0;
    b2_iowb0_pa = 40'h0;
    b2_iowb1_pa = 40'h0;
    b2_iowb2_pa = 40'h0;
    b2_iowb3_pa = 40'h0;
    b2_siu_pa = 40'h0;
    b2_siu_d0 = 32'b0;
    b2_siu_d1 = 32'b0;
    b2_siu_d2 = 32'b0;
    b2_siu_d3 = 32'b0;
    b2_siu_d4 = 32'b0;
    b2_siu_d5 = 32'b0;
    b2_siu_d6 = 32'b0;
    b2_siu_d7 = 32'b0;
    b2_siu_d8 = 32'b0;
    b2_siu_d9 = 32'b0;
    b2_siu_d10 = 32'b0;
    b2_siu_d11 = 32'b0;
    b2_siu_d12 = 32'b0;
    b2_siu_d13 = 32'b0;
    b2_siu_d14 = 32'b0;
    b2_siu_d15 = 32'b0;
  end

//==========================================================
//==========================================================

always @ (posedge `BENCH_L2T2_GCLK) begin // {

  //------------------------------
  //  Pipeline signals

  //------------------------------
  //  L2 RTL Bank2  (not needed for L2 Stub)

  b2_cam_hit_c52 <= b2_cam_hit_c5;
  b2_cam_hit_c6  <= b2_cam_hit_c52;
  b2_cam_hit_c7  <= b2_cam_hit_c6;
  b2_cam_hit_c8  <= b2_cam_hit_c7;

  b2_first_pass_c3  <= b2_first_pass_c2;
  b2_first_pass_c4  <= b2_first_pass_c3;
  b2_first_pass_c5  <= b2_first_pass_c4;
  b2_first_pass_c52 <= b2_first_pass_c5;
  b2_first_pass_c6  <= b2_first_pass_c52;
  b2_first_pass_c7  <= b2_first_pass_c6;
  b2_first_pass_c8  <= b2_first_pass_c7;

  b2_wr8_active_c3  <= b2_wr8_active_c2;
  b2_wr8_active_c4  <= b2_wr8_active_c3;
  b2_wr8_active_c5  <= b2_wr8_active_c4;
  b2_wr8_active_c52 <= b2_wr8_active_c5;
  b2_wr8_active_c6  <= b2_wr8_active_c52;
  b2_wr8_active_c7  <= b2_wr8_active_c6;
  b2_wr8_active_c8  <= b2_wr8_active_c7;

  b2_wr64_active_c3  <= b2_wr64_active_c2;
  b2_wr64_active_c4  <= b2_wr64_active_c3;
  b2_wr64_active_c5  <= b2_wr64_active_c4;
  b2_wr64_active_c52 <= b2_wr64_active_c5;
  b2_wr64_active_c6  <= b2_wr64_active_c52;
  b2_wr64_active_c7  <= b2_wr64_active_c6;
  b2_wr64_active_c8  <= b2_wr64_active_c7;

  //----------------------------------------------------------
  //----------------------------------------------------------
  // SIU Store - WR8

  
  //       only do this if the transfers don't match up in c8.

  if (b2_wr8_active && b2_first_pass) begin // {
    // Send msgs to Riesling
    dma_store (b2_siu_wr8_pa,b2_siu_wr8_data,b2_siu_wr8_size,b2_cam_hit,8'd8,"B2 WR8");
  end // }

  //----------------------------------------------------------
  //----------------------------------------------------------
  // SIU Store - WRI

  //------------------------------
  // Send MemorySlam message after SIU transaction is complete
  // Read IOWB data and Send msgs to Riesling

  if (b2_wr64_active && b2_first_pass) begin // {

    // Determine which of the 8 DMA_STOREs will be evicted.
    // WRI is 64 Bytes.
    // Eviction is 16 Bytes at a time.
    // So, there can be 1-4 Evictions for a single WRI.
    b2_ev_vect0 = b2_ev_invvect[31:0];
    b2_ev_vect1 = b2_ev_invvect[55:32];
    b2_ev_vect2 = b2_ev_invvect[87:56];
    b2_ev_vect3 = b2_ev_invvect[111:88];

    b2_inv_vect[0] = get_vect(b2_ev_vect0);
    b2_inv_vect[1] = get_vect31(b2_ev_vect1);  // different function for odd inval vector
    b2_inv_vect[2] = get_vect(b2_ev_vect2);
    b2_inv_vect[3] = get_vect31(b2_ev_vect3);  // different function for odd inval vector

    //Get entry from IOWB and send message
    b2_chk_valid_entry(b2_pop_index);
    b2_read_iowb(b2_pop_index,
                        {|b2_inv_vect[3],|b2_inv_vect[2],|b2_inv_vect[1],|b2_inv_vect[0]});
    b2_pop_index = b2_pop_index + 1;
  end // }

  //------------------------------
  // Capture state machine
  // Capture pa and data (64 Bytes) off SIU to L2 interface.
  // See SIU MAS (about page 49) for WRI packet format.
  // Put packet in IOWB which had 4 entries.
  // This IOWB in the Bench is not exactly the same as the IOWB in RTL.
  // Bench IOWB is a FIFO and RTL IOWB is not a FIFO.

  case (b2_state_capture)

    // Capture pa (part 1)
    STATE_C0: begin  // {
                // WRI pkt if req_data[26:24]==3'b100
                if ((b2_sii_l2t_req_vld)&&(b2_sii_l2t_req_data[26:24]==3'b100)) begin // {
                  b2_siu_pa[39:32] <= b2_sii_l2t_req_data[7:0];
                  b2_state_capture <= STATE_C1;
                end // }
              end // }

    // Capture pa (part 2)
    STATE_C1: begin  // {
                  b2_siu_pa[31:0] <= b2_sii_l2t_req_data[31:0];
                  b2_state_capture <= STATE_C2;
              end // }

    // Capture 4 data bytes
    STATE_C2: begin  // {
                  b2_siu_d0 <= b2_sii_l2t_req_data[31:0];
                  b2_state_capture <= STATE_C3;
              end // }

    // Capture 4 data bytes
    STATE_C3: begin  // {
                  b2_siu_d1 <= b2_sii_l2t_req_data[31:0];
                  b2_state_capture <= STATE_C4;
              end // }

    // Capture 4 data bytes
    STATE_C4: begin  // {
                  b2_siu_d2 <= b2_sii_l2t_req_data[31:0];
                  b2_state_capture <= STATE_C5;
              end // }

    // Capture 4 data bytes
    STATE_C5: begin  // {
                  b2_siu_d3 <= b2_sii_l2t_req_data[31:0];
                  b2_state_capture <= STATE_C6;
              end // }

    // Capture 4 data bytes
    STATE_C6: begin  // {
                  b2_siu_d4 <= b2_sii_l2t_req_data[31:0];
                  b2_state_capture <= STATE_C7;
              end // }

    // Capture 4 data bytes
    STATE_C7: begin  // {
                  b2_siu_d5 <= b2_sii_l2t_req_data[31:0];
                  b2_state_capture <= STATE_C8;
              end // }

    // Capture 4 data bytes
    STATE_C8: begin  // {
                  b2_siu_d6 <= b2_sii_l2t_req_data[31:0];
                  b2_state_capture <= STATE_C9;
              end // }

    // Capture 4 data bytes
    STATE_C9: begin  // {
                  b2_siu_d7 <= b2_sii_l2t_req_data[31:0];
                  b2_state_capture <= STATE_C10;
              end // }

    // Capture 4 data bytes
    STATE_C10: begin  // {
                  b2_siu_d8 <= b2_sii_l2t_req_data[31:0];
                  b2_state_capture <= STATE_C11;
              end // }

    // Capture 4 data bytes
    STATE_C11: begin  // {
                  b2_siu_d9 <= b2_sii_l2t_req_data[31:0];
                  b2_state_capture <= STATE_C12;
              end // }

    // Capture 4 data bytes
    STATE_C12: begin  // {
                  b2_siu_d10 <= b2_sii_l2t_req_data[31:0];
                  b2_state_capture <= STATE_C13;
              end // }

    // Capture 4 data bytes
    STATE_C13: begin  // {
                  b2_siu_d11 <= b2_sii_l2t_req_data[31:0];
                  b2_state_capture <= STATE_C14;
              end // }

    // Capture 4 data bytes
    STATE_C14: begin  // {
                  b2_siu_d12 <= b2_sii_l2t_req_data[31:0];
                  b2_state_capture <= STATE_C15;
              end // }

    // Capture 4 data bytes
    STATE_C15: begin  // {
                  b2_siu_d13 <= b2_sii_l2t_req_data[31:0];
                  b2_state_capture <= STATE_C16;
              end // }

    // Capture 4 data bytes
    STATE_C16: begin  // {
                  b2_siu_d14 <= b2_sii_l2t_req_data[31:0];
                  b2_state_capture <= STATE_C17;
              end // }

    // Capture 4 data bytes
    STATE_C17: begin  // {
                  b2_siu_d15 <= b2_sii_l2t_req_data[31:0];
                  b2_state_capture <= STATE_C18;
              end // }

    // Save WRI packet (pa and data)x to IOWB
    STATE_C18: begin  // {
                  // Extra check to make sure that RTL is writing to its IOWB, too.
                  if (!b2_rdma_wren) begin // {
                    `PR_ERROR("pli_ldst",`ERROR,"Bench ERROR - Capture State Machine - b2_rdma_wren is not asserted when it is expected to be asserted.");
                  end // }
                  else begin // {
                    b2_write_iowb (b2_push_index);
                    b2_push_index = b2_push_index + 1;
                  end // }
                  b2_state_capture <= STATE_C0;
              end // }

    default:  begin  // {
                `PR_ERROR("pli_ldst",`ERROR,"Bench ERROR - ldst_dma Capture State Machine 2 should not hit default state");
              end // }

  endcase

end // always}

//----------------------------------------------------------
// Task to save data captured on SIU -> L2 interface into IOWB
task b2_write_iowb;

input [1:0] index;

  begin
    `PR_INFO("ldst_dma",`INFO,"Push to B2 IOWB. index=%d pa=%h D0=%h",
                              index,b2_siu_pa,b2_siu_d0);
    case (index)
      2'h0: begin
              if (b2_iowb0_valid) begin
                `PR_ERROR("pli_ldst",`ERROR,"Bench ERROR - b2_iowb0 Overflow.");
              end
              else begin
                b2_iowb0_valid <= 1'b1;
              end

              b2_iowb0_pa  <= b2_siu_pa;
              b2_iowb0[0]  <= b2_siu_d0;
              b2_iowb0[1]  <= b2_siu_d1;
              b2_iowb0[2]  <= b2_siu_d2;
              b2_iowb0[3]  <= b2_siu_d3;
              b2_iowb0[4]  <= b2_siu_d4;
              b2_iowb0[5]  <= b2_siu_d5;
              b2_iowb0[6]  <= b2_siu_d6;
              b2_iowb0[7]  <= b2_siu_d7;
              b2_iowb0[8]  <= b2_siu_d8;
              b2_iowb0[9]  <= b2_siu_d9;
              b2_iowb0[10] <= b2_siu_d10;
              b2_iowb0[11] <= b2_siu_d11;
              b2_iowb0[12] <= b2_siu_d12;
              b2_iowb0[13] <= b2_siu_d13;
              b2_iowb0[14] <= b2_siu_d14;
              b2_iowb0[15] <= b2_siu_d15;
            end
      2'h1: begin
              if (b2_iowb1_valid) begin
                `PR_ERROR("pli_ldst",`ERROR,"Bench ERROR - b2_iowb1 Overflow.");
              end
              else begin
                b2_iowb1_valid <= 1'b1;
              end

              b2_iowb1_pa  <= b2_siu_pa;
              b2_iowb1[0]  <= b2_siu_d0;
              b2_iowb1[1]  <= b2_siu_d1;
              b2_iowb1[2]  <= b2_siu_d2;
              b2_iowb1[3]  <= b2_siu_d3;
              b2_iowb1[4]  <= b2_siu_d4;
              b2_iowb1[5]  <= b2_siu_d5;
              b2_iowb1[6]  <= b2_siu_d6;
              b2_iowb1[7]  <= b2_siu_d7;
              b2_iowb1[8]  <= b2_siu_d8;
              b2_iowb1[9]  <= b2_siu_d9;
              b2_iowb1[10] <= b2_siu_d10;
              b2_iowb1[11] <= b2_siu_d11;
              b2_iowb1[12] <= b2_siu_d12;
              b2_iowb1[13] <= b2_siu_d13;
              b2_iowb1[14] <= b2_siu_d14;
              b2_iowb1[15] <= b2_siu_d15;
            end
      2'h2: begin
              if (b2_iowb2_valid) begin
                `PR_ERROR("pli_ldst",`ERROR,"Bench ERROR - b2_iowb2 Overflow.");
              end
              else begin
                b2_iowb2_valid <= 1'b1;
              end

              b2_iowb2_pa  <= b2_siu_pa;
              b2_iowb2[0]  <= b2_siu_d0;
              b2_iowb2[1]  <= b2_siu_d1;
              b2_iowb2[2]  <= b2_siu_d2;
              b2_iowb2[3]  <= b2_siu_d3;
              b2_iowb2[4]  <= b2_siu_d4;
              b2_iowb2[5]  <= b2_siu_d5;
              b2_iowb2[6]  <= b2_siu_d6;
              b2_iowb2[7]  <= b2_siu_d7;
              b2_iowb2[8]  <= b2_siu_d8;
              b2_iowb2[9]  <= b2_siu_d9;
              b2_iowb2[10] <= b2_siu_d10;
              b2_iowb2[11] <= b2_siu_d11;
              b2_iowb2[12] <= b2_siu_d12;
              b2_iowb2[13] <= b2_siu_d13;
              b2_iowb2[14] <= b2_siu_d14;
              b2_iowb2[15] <= b2_siu_d15;
            end
      2'h3: begin
              if (b2_iowb3_valid) begin
                `PR_ERROR("pli_ldst",`ERROR,"Bench ERROR - b2_iowb3 Overflow.");
              end
              else begin
                b2_iowb3_valid <= 1'b1;
              end

              b2_iowb3_pa  <= b2_siu_pa;
              b2_iowb3[0]  <= b2_siu_d0;
              b2_iowb3[1]  <= b2_siu_d1;
              b2_iowb3[2]  <= b2_siu_d2;
              b2_iowb3[3]  <= b2_siu_d3;
              b2_iowb3[4]  <= b2_siu_d4;
              b2_iowb3[5]  <= b2_siu_d5;
              b2_iowb3[6]  <= b2_siu_d6;
              b2_iowb3[7]  <= b2_siu_d7;
              b2_iowb3[8]  <= b2_siu_d8;
              b2_iowb3[9]  <= b2_siu_d9;
              b2_iowb3[10] <= b2_siu_d10;
              b2_iowb3[11] <= b2_siu_d11;
              b2_iowb3[12] <= b2_siu_d12;
              b2_iowb3[13] <= b2_siu_d13;
              b2_iowb3[14] <= b2_siu_d14;
              b2_iowb3[15] <= b2_siu_d15;
            end
      default: begin
                `PR_ERROR("pli_ldst",`ERROR,"Bench ERROR - task write_iowb should not hit default state");
               end
    endcase    

  end
endtask

//----------------------------------------------------------
// Task to read data from IOWB and send to Riesling
task b2_read_iowb;

input [1:0] index;
input [3:0] tmp_evict;

  begin
    case (index)
      2'h0: 
          begin
            if (!b2_iowb0_valid) begin
              `PR_ERROR("pli_ldst",`ERROR,"Bench ERROR - b2_iowb0 Underflow.");
            end
            else begin
              b2_iowb0_valid <= 1'b0;
            end

           `PR_INFO("ldst_dma",`INFO,"Pop from B2 IOWB. index=%d pa=%h D0=%h",
                              index,b2_iowb0_pa,b2_iowb0[0]);

            // Call task to send NAS message
            // Send 8 Bytes at a time
            dma_store (b2_iowb0_pa,   {b2_iowb0[0], b2_iowb0[1]}, 8'hff,tmp_evict[0],8'd64,"B2 WRI 1");
            dma_store (b2_iowb0_pa+8, {b2_iowb0[2], b2_iowb0[3]}, 8'hff,tmp_evict[0],8'd64,"B2 WRI 2");
            dma_store (b2_iowb0_pa+16,{b2_iowb0[4], b2_iowb0[5]}, 8'hff,tmp_evict[1],8'd64,"B2 WRI 3");
            dma_store (b2_iowb0_pa+24,{b2_iowb0[6], b2_iowb0[7]}, 8'hff,tmp_evict[1],8'd64,"B2 WRI 4");
            dma_store (b2_iowb0_pa+32,{b2_iowb0[8], b2_iowb0[9]}, 8'hff,tmp_evict[2],8'd64,"B2 WRI 5");
            dma_store (b2_iowb0_pa+40,{b2_iowb0[10],b2_iowb0[11]},8'hff,tmp_evict[2],8'd64,"B2 WRI 6");
            dma_store (b2_iowb0_pa+48,{b2_iowb0[12],b2_iowb0[13]},8'hff,tmp_evict[3],8'd64,"B2 WRI 7");
            dma_store (b2_iowb0_pa+56,{b2_iowb0[14],b2_iowb0[15]},8'hff,tmp_evict[3],8'd64,"B2 WRI 8");
          end
      2'h1: 
          begin
            if (!b2_iowb1_valid) begin
              `PR_ERROR("pli_ldst",`ERROR,"Bench ERROR - b2_iowb1 Underflow.");
            end
            else begin
              b2_iowb1_valid <= 1'b0;
            end

           `PR_INFO("ldst_dma",`INFO,"Pop from B2 IOWB. index=%d pa=%h D0=%h",
                              index,b2_iowb1_pa,b2_iowb1[0]);

            // Call task to send NAS message
            // Send 8 Bytes at a time
            dma_store (b2_iowb1_pa,   {b2_iowb1[0], b2_iowb1[1]}, 8'hff,tmp_evict[0],8'd64,"B2 WRI 1");
            dma_store (b2_iowb1_pa+8, {b2_iowb1[2], b2_iowb1[3]}, 8'hff,tmp_evict[0],8'd64,"B2 WRI 2");
            dma_store (b2_iowb1_pa+16,{b2_iowb1[4], b2_iowb1[5]}, 8'hff,tmp_evict[1],8'd64,"B2 WRI 3");
            dma_store (b2_iowb1_pa+24,{b2_iowb1[6], b2_iowb1[7]}, 8'hff,tmp_evict[1],8'd64,"B2 WRI 4");
            dma_store (b2_iowb1_pa+32,{b2_iowb1[8], b2_iowb1[9]}, 8'hff,tmp_evict[2],8'd64,"B2 WRI 5");
            dma_store (b2_iowb1_pa+40,{b2_iowb1[10],b2_iowb1[11]},8'hff,tmp_evict[2],8'd64,"B2 WRI 6");
            dma_store (b2_iowb1_pa+48,{b2_iowb1[12],b2_iowb1[13]},8'hff,tmp_evict[3],8'd64,"B2 WRI 7");
            dma_store (b2_iowb1_pa+56,{b2_iowb1[14],b2_iowb1[15]},8'hff,tmp_evict[3],8'd64,"B2 WRI 8");
          end
      2'h2: 
          begin
            if (!b2_iowb2_valid) begin
              `PR_ERROR("pli_ldst",`ERROR,"Bench ERROR - b2_iowb2 Underflow.");
            end
            else begin
              b2_iowb2_valid <= 1'b0;
            end

           `PR_INFO("ldst_dma",`INFO,"Pop from B2 IOWB. index=%d pa=%h D0=%h",
                              index,b2_iowb2_pa,b2_iowb2[0]);

            // Call task to send NAS message
            // Send 8 Bytes at a time
            dma_store (b2_iowb2_pa,   {b2_iowb2[0], b2_iowb2[1]}, 8'hff,tmp_evict[0],8'd64,"B2 WRI 1");
            dma_store (b2_iowb2_pa+8, {b2_iowb2[2], b2_iowb2[3]}, 8'hff,tmp_evict[0],8'd64,"B2 WRI 2");
            dma_store (b2_iowb2_pa+16,{b2_iowb2[4], b2_iowb2[5]}, 8'hff,tmp_evict[1],8'd64,"B2 WRI 3");
            dma_store (b2_iowb2_pa+24,{b2_iowb2[6], b2_iowb2[7]}, 8'hff,tmp_evict[1],8'd64,"B2 WRI 4");
            dma_store (b2_iowb2_pa+32,{b2_iowb2[8], b2_iowb2[9]}, 8'hff,tmp_evict[2],8'd64,"B2 WRI 5");
            dma_store (b2_iowb2_pa+40,{b2_iowb2[10],b2_iowb2[11]},8'hff,tmp_evict[2],8'd64,"B2 WRI 6");
            dma_store (b2_iowb2_pa+48,{b2_iowb2[12],b2_iowb2[13]},8'hff,tmp_evict[3],8'd64,"B2 WRI 7");
            dma_store (b2_iowb2_pa+56,{b2_iowb2[14],b2_iowb2[15]},8'hff,tmp_evict[3],8'd64,"B2 WRI 8");
          end
      2'h3: 
          begin
            if (!b2_iowb3_valid) begin
              `PR_ERROR("pli_ldst",`ERROR,"Bench ERROR - b2_iowb3 Underflow.");
            end
            else begin
              b2_iowb3_valid <= 1'b0;
            end

           `PR_INFO("ldst_dma",`INFO,"Pop from B2 IOWB. index=%d pa=%h D0=%h",
                              index,b2_iowb3_pa,b2_iowb3[0]);

            // Call task to send NAS message
            // Send 8 Bytes at a time
            dma_store (b2_iowb3_pa,   {b2_iowb3[0], b2_iowb3[1]}, 8'hff,tmp_evict[0],8'd64,"B2 WRI 1");
            dma_store (b2_iowb3_pa+8, {b2_iowb3[2], b2_iowb3[3]}, 8'hff,tmp_evict[0],8'd64,"B2 WRI 2");
            dma_store (b2_iowb3_pa+16,{b2_iowb3[4], b2_iowb3[5]}, 8'hff,tmp_evict[1],8'd64,"B2 WRI 3");
            dma_store (b2_iowb3_pa+24,{b2_iowb3[6], b2_iowb3[7]}, 8'hff,tmp_evict[1],8'd64,"B2 WRI 4");
            dma_store (b2_iowb3_pa+32,{b2_iowb3[8], b2_iowb3[9]}, 8'hff,tmp_evict[2],8'd64,"B2 WRI 5");
            dma_store (b2_iowb3_pa+40,{b2_iowb3[10],b2_iowb3[11]},8'hff,tmp_evict[2],8'd64,"B2 WRI 6");
            dma_store (b2_iowb3_pa+48,{b2_iowb3[12],b2_iowb3[13]},8'hff,tmp_evict[3],8'd64,"B2 WRI 7");
            dma_store (b2_iowb3_pa+56,{b2_iowb3[14],b2_iowb3[15]},8'hff,tmp_evict[3],8'd64,"B2 WRI 8");
          end
      default: 
          begin
            `PR_ERROR("pli_ldst",`ERROR,"Bench ERROR - task read_iowb should not hit default state");
          end
    endcase    

  end
endtask

//----------------------------------------------------------
// Task to make sure the entry at the location pointed to by index is valid before we try to pop it.
task b2_chk_valid_entry;

input [1:0] index;

  begin
    case (index)
      2'h0: 
          begin
            if (b2_iowb0_valid != 1'b1) begin
              `PR_ERROR("pli_ldst",`ERROR,"Bench ERROR - the entry in IOWB at index=0 is not valid (b2_iowb0_valid!=1'b1)");
            end
          end
      2'h1: 
          begin
            if (b2_iowb1_valid != 1'b1) begin
              `PR_ERROR("pli_ldst",`ERROR,"Bench ERROR - the entry in IOWB at index=1 is not valid (b2_iowb1_valid!=1'b1)");
            end
          end
      2'h2: 
          begin
            if (b2_iowb2_valid != 1'b1) begin
              `PR_ERROR("pli_ldst",`ERROR,"Bench ERROR - the entry in IOWB at index=2 is not valid (b2_iowb2_valid!=1'b1)");
            end
          end
      2'h3: 
          begin
            if (b2_iowb3_valid != 1'b1) begin
              `PR_ERROR("pli_ldst",`ERROR,"Bench ERROR - the entry in IOWB at index=3 is not valid (b2_iowb3_valid!=1'b1)");
            end
          end
      default: 
          begin
            `PR_ERROR("pli_ldst",`ERROR,"Bench ERROR - task chk_valid_entry should not hit default state");
          end
    endcase
  end
endtask

  `endif // `ifdef NOL2RTL
`endif   // `ifdef NO_L2_BNK2

`ifdef NO_L2_BNK3
`else
  `ifdef NOL2RTL
  `else

//==========================================================
//==========================================================
// L2 RTL Probes

  //----------------------------------------------------------
  // Signals for L2 RTL Bank3

  //---------------------
  // SIU store

  wire                       b3_cam_hit_c5;
  reg                        b3_cam_hit_c52;
  reg                        b3_cam_hit_c6;
  reg                        b3_cam_hit_c7;
  reg                        b3_cam_hit_c8;
  wire                       b3_cam_hit;
  wire                       b3_inst_valid_c2;
  wire                       b3_wr8_inst_c2;
  wire                       b3_wr64_inst_c2;

  // If the cam hits, then there will be an eviction sent to the core(s)
  assign b3_cam_hit_c5       = |`CPU.l2t3.dc_cam_hit;
  assign b3_cam_hit          = b3_cam_hit_c8;
  assign b3_inst_valid_c2    = `CPU.l2t3.arb.arb_inst_vld_c2;
  assign b3_wr8_inst_c2      = `CPU.l2t3.arb.arb_decdp_wr8_inst_c2;
  assign b3_wr64_inst_c2     = `CPU.l2t3.arb.arb_decdp_wr64_inst_c2;

  //---------------------
  // WR8 signals
  wire                       b3_first_pass_c2;
  reg                        b3_first_pass_c3;
  reg                        b3_first_pass_c4;
  reg                        b3_first_pass_c5;
  reg                        b3_first_pass_c52;
  reg                        b3_first_pass_c6;
  reg                        b3_first_pass_c7;
  reg                        b3_first_pass_c8;
  wire                       b3_first_pass;
  wire                       b3_wr8_active_c2;
  reg                        b3_wr8_active_c3;
  reg                        b3_wr8_active_c4;
  reg                        b3_wr8_active_c5;
  reg                        b3_wr8_active_c52;
  reg                        b3_wr8_active_c6;
  reg                        b3_wr8_active_c7;
  reg                        b3_wr8_active_c8;
  wire                       b3_wr8_active;

  wire                [39:0] b3_siu_wr8_pa;
  wire                [63:0] b3_siu_wr8_data;
  wire                 [7:0] b3_siu_wr8_size;

  assign b3_wr8_active_c2       = `CPU.l2t3.arb_decdp_wr8_inst_c2;
  assign b3_wr8_active          = b3_wr8_active_c8;
  assign b3_first_pass_c2       = `CPU.l2t3.arbdec.arbdp_inst_c2[39]==0;
  assign b3_first_pass          = b3_first_pass_c8;
  assign b3_siu_wr8_pa          = `CPU.l2t3.arbadr.arbdp_addr_c8;
  assign b3_siu_wr8_data        = `CPU.l2t3.arbdat.arbdp_inst_data_c8;
  assign b3_siu_wr8_size        = `CPU.l2t3.arbdec.arbdec_arbdp_inst_size_c8;

  //---------------------
  // WRI signals
  reg                  [1:0] b3_pop_index;   // Index pointing to next entry to be read from IOWB
  reg                  [1:0] b3_push_index;  // Index pointing to next entry to be written from IOWB

  wire                       b3_wr64_active_c2;
  reg                        b3_wr64_active_c3;
  reg                        b3_wr64_active_c4;
  reg                        b3_wr64_active_c5;
  reg                        b3_wr64_active_c52;
  reg                        b3_wr64_active_c6;
  reg                        b3_wr64_active_c7;
  reg                        b3_wr64_active_c8;
  wire                       b3_wr64_active;

  wire                       b3_sii_l2t_req_vld;
  wire                [31:0] b3_sii_l2t_req_data;
  wire                       b3_rdma_wren;
  //wire               [1:0] b3_rdma_index;
  //wire               [3:0] b3_rdma_valid;

   reg                 [4:0] b3_state_capture;
   reg                [39:0] b3_siu_pa;
   reg                [31:0] b3_siu_d0;
   reg                [31:0] b3_siu_d1;
   reg                [31:0] b3_siu_d2;
   reg                [31:0] b3_siu_d3;
   reg                [31:0] b3_siu_d4;
   reg                [31:0] b3_siu_d5;
   reg                [31:0] b3_siu_d6;
   reg                [31:0] b3_siu_d7;
   reg                [31:0] b3_siu_d8;
   reg                [31:0] b3_siu_d9;
   reg                [31:0] b3_siu_d10;
   reg                [31:0] b3_siu_d11;
   reg                [31:0] b3_siu_d12;
   reg                [31:0] b3_siu_d13;
   reg                [31:0] b3_siu_d14;
   reg                [31:0] b3_siu_d15;

   // IOWB has 4 entries
   // Each entry has valid bit, pa, 64 Byte data
   reg                       b3_iowb0_valid;  // Indicates Bench has captured entire packet
   reg                       b3_iowb1_valid;
   reg                       b3_iowb2_valid;
   reg                       b3_iowb3_valid;
   reg                [39:0] b3_iowb0_pa;
   reg                [39:0] b3_iowb1_pa;
   reg                [39:0] b3_iowb2_pa;
   reg                [39:0] b3_iowb3_pa;
   reg                [31:0] b3_iowb0 [0:15];
   reg                [31:0] b3_iowb1 [0:15];
   reg                [31:0] b3_iowb2 [0:15];
   reg                [31:0] b3_iowb3 [0:15];

  assign b3_sii_l2t_req_vld     = `CPU.l2t3.sii_l2t_req_vld;
  assign b3_sii_l2t_req_data    = `CPU.l2t3.sii_l2t_req[31:0];

  assign b3_wr64_active_c2   = b3_inst_valid_c2 & b3_wr64_inst_c2;
  assign b3_wr64_active      = b3_wr64_active_c8;

  // Indicates when rdma_index is valid
  assign b3_rdma_wren           = `CPU.l2b3.evict_l2t_l2b_rdma_wren_s3_v1 | 
                                       `CPU.l2b3.evict_l2t_l2b_rdma_wren_s3_v2 | 
                                       `CPU.l2b3.evict_l2t_l2b_rdma_wren_s3_v3 | 
                                       `CPU.l2b3.evict_l2t_l2b_rdma_wren_s3_v4;

  
  // IOWB entry index = 0,1,2,3
  //assign b3_rdma_index          = `CPU.l2b3.evict_l2t_l2b_rdma_wrwl_s3_v1[1:0];
  // Indicates that any future transactions will see this entry's store data.
  // The bit that is asserted corresponds to the index in the IOWB.
  //assign b3_rdma_valid          = `CPU.l2t3.rdmat.rdma_valid[3:0];

//---------------------
initial
  begin
    b3_pop_index = 2'b0;
    b3_push_index = 2'b0;
    b3_state_capture = STATE_C0;   // Idle state
    b3_iowb0_valid = 1'h0;
    b3_iowb1_valid = 1'h0;
    b3_iowb2_valid = 1'h0;
    b3_iowb3_valid = 1'h0;
    b3_iowb0_pa = 40'h0;
    b3_iowb1_pa = 40'h0;
    b3_iowb2_pa = 40'h0;
    b3_iowb3_pa = 40'h0;
    b3_siu_pa = 40'h0;
    b3_siu_d0 = 32'b0;
    b3_siu_d1 = 32'b0;
    b3_siu_d2 = 32'b0;
    b3_siu_d3 = 32'b0;
    b3_siu_d4 = 32'b0;
    b3_siu_d5 = 32'b0;
    b3_siu_d6 = 32'b0;
    b3_siu_d7 = 32'b0;
    b3_siu_d8 = 32'b0;
    b3_siu_d9 = 32'b0;
    b3_siu_d10 = 32'b0;
    b3_siu_d11 = 32'b0;
    b3_siu_d12 = 32'b0;
    b3_siu_d13 = 32'b0;
    b3_siu_d14 = 32'b0;
    b3_siu_d15 = 32'b0;
  end

//==========================================================
//==========================================================

always @ (posedge `BENCH_L2T3_GCLK) begin // {

  //------------------------------
  //  Pipeline signals

  //------------------------------
  //  L2 RTL Bank3  (not needed for L2 Stub)

  b3_cam_hit_c52 <= b3_cam_hit_c5;
  b3_cam_hit_c6  <= b3_cam_hit_c52;
  b3_cam_hit_c7  <= b3_cam_hit_c6;
  b3_cam_hit_c8  <= b3_cam_hit_c7;

  b3_first_pass_c3  <= b3_first_pass_c2;
  b3_first_pass_c4  <= b3_first_pass_c3;
  b3_first_pass_c5  <= b3_first_pass_c4;
  b3_first_pass_c52 <= b3_first_pass_c5;
  b3_first_pass_c6  <= b3_first_pass_c52;
  b3_first_pass_c7  <= b3_first_pass_c6;
  b3_first_pass_c8  <= b3_first_pass_c7;

  b3_wr8_active_c3  <= b3_wr8_active_c2;
  b3_wr8_active_c4  <= b3_wr8_active_c3;
  b3_wr8_active_c5  <= b3_wr8_active_c4;
  b3_wr8_active_c52 <= b3_wr8_active_c5;
  b3_wr8_active_c6  <= b3_wr8_active_c52;
  b3_wr8_active_c7  <= b3_wr8_active_c6;
  b3_wr8_active_c8  <= b3_wr8_active_c7;

  b3_wr64_active_c3  <= b3_wr64_active_c2;
  b3_wr64_active_c4  <= b3_wr64_active_c3;
  b3_wr64_active_c5  <= b3_wr64_active_c4;
  b3_wr64_active_c52 <= b3_wr64_active_c5;
  b3_wr64_active_c6  <= b3_wr64_active_c52;
  b3_wr64_active_c7  <= b3_wr64_active_c6;
  b3_wr64_active_c8  <= b3_wr64_active_c7;

  //----------------------------------------------------------
  //----------------------------------------------------------
  // SIU Store - WR8

  
  //       only do this if the transfers don't match up in c8.

  if (b3_wr8_active && b3_first_pass) begin // {
    // Send msgs to Riesling
    dma_store (b3_siu_wr8_pa,b3_siu_wr8_data,b3_siu_wr8_size,b3_cam_hit,8'd8,"B3 WR8");
  end // }

  //----------------------------------------------------------
  //----------------------------------------------------------
  // SIU Store - WRI

  //------------------------------
  // Send MemorySlam message after SIU transaction is complete
  // Read IOWB data and Send msgs to Riesling

  if (b3_wr64_active && b3_first_pass) begin // {

    // Determine which of the 8 DMA_STOREs will be evicted.
    // WRI is 64 Bytes.
    // Eviction is 16 Bytes at a time.
    // So, there can be 1-4 Evictions for a single WRI.
    b3_ev_vect0 = b3_ev_invvect[31:0];
    b3_ev_vect1 = b3_ev_invvect[55:32];
    b3_ev_vect2 = b3_ev_invvect[87:56];
    b3_ev_vect3 = b3_ev_invvect[111:88];

    b3_inv_vect[0] = get_vect(b3_ev_vect0);
    b3_inv_vect[1] = get_vect31(b3_ev_vect1);  // different function for odd inval vector
    b3_inv_vect[2] = get_vect(b3_ev_vect2);
    b3_inv_vect[3] = get_vect31(b3_ev_vect3);  // different function for odd inval vector

    //Get entry from IOWB and send message
    b3_chk_valid_entry(b3_pop_index);
    b3_read_iowb(b3_pop_index,
                        {|b3_inv_vect[3],|b3_inv_vect[2],|b3_inv_vect[1],|b3_inv_vect[0]});
    b3_pop_index = b3_pop_index + 1;
  end // }

  //------------------------------
  // Capture state machine
  // Capture pa and data (64 Bytes) off SIU to L2 interface.
  // See SIU MAS (about page 49) for WRI packet format.
  // Put packet in IOWB which had 4 entries.
  // This IOWB in the Bench is not exactly the same as the IOWB in RTL.
  // Bench IOWB is a FIFO and RTL IOWB is not a FIFO.

  case (b3_state_capture)

    // Capture pa (part 1)
    STATE_C0: begin  // {
                // WRI pkt if req_data[26:24]==3'b100
                if ((b3_sii_l2t_req_vld)&&(b3_sii_l2t_req_data[26:24]==3'b100)) begin // {
                  b3_siu_pa[39:32] <= b3_sii_l2t_req_data[7:0];
                  b3_state_capture <= STATE_C1;
                end // }
              end // }

    // Capture pa (part 2)
    STATE_C1: begin  // {
                  b3_siu_pa[31:0] <= b3_sii_l2t_req_data[31:0];
                  b3_state_capture <= STATE_C2;
              end // }

    // Capture 4 data bytes
    STATE_C2: begin  // {
                  b3_siu_d0 <= b3_sii_l2t_req_data[31:0];
                  b3_state_capture <= STATE_C3;
              end // }

    // Capture 4 data bytes
    STATE_C3: begin  // {
                  b3_siu_d1 <= b3_sii_l2t_req_data[31:0];
                  b3_state_capture <= STATE_C4;
              end // }

    // Capture 4 data bytes
    STATE_C4: begin  // {
                  b3_siu_d2 <= b3_sii_l2t_req_data[31:0];
                  b3_state_capture <= STATE_C5;
              end // }

    // Capture 4 data bytes
    STATE_C5: begin  // {
                  b3_siu_d3 <= b3_sii_l2t_req_data[31:0];
                  b3_state_capture <= STATE_C6;
              end // }

    // Capture 4 data bytes
    STATE_C6: begin  // {
                  b3_siu_d4 <= b3_sii_l2t_req_data[31:0];
                  b3_state_capture <= STATE_C7;
              end // }

    // Capture 4 data bytes
    STATE_C7: begin  // {
                  b3_siu_d5 <= b3_sii_l2t_req_data[31:0];
                  b3_state_capture <= STATE_C8;
              end // }

    // Capture 4 data bytes
    STATE_C8: begin  // {
                  b3_siu_d6 <= b3_sii_l2t_req_data[31:0];
                  b3_state_capture <= STATE_C9;
              end // }

    // Capture 4 data bytes
    STATE_C9: begin  // {
                  b3_siu_d7 <= b3_sii_l2t_req_data[31:0];
                  b3_state_capture <= STATE_C10;
              end // }

    // Capture 4 data bytes
    STATE_C10: begin  // {
                  b3_siu_d8 <= b3_sii_l2t_req_data[31:0];
                  b3_state_capture <= STATE_C11;
              end // }

    // Capture 4 data bytes
    STATE_C11: begin  // {
                  b3_siu_d9 <= b3_sii_l2t_req_data[31:0];
                  b3_state_capture <= STATE_C12;
              end // }

    // Capture 4 data bytes
    STATE_C12: begin  // {
                  b3_siu_d10 <= b3_sii_l2t_req_data[31:0];
                  b3_state_capture <= STATE_C13;
              end // }

    // Capture 4 data bytes
    STATE_C13: begin  // {
                  b3_siu_d11 <= b3_sii_l2t_req_data[31:0];
                  b3_state_capture <= STATE_C14;
              end // }

    // Capture 4 data bytes
    STATE_C14: begin  // {
                  b3_siu_d12 <= b3_sii_l2t_req_data[31:0];
                  b3_state_capture <= STATE_C15;
              end // }

    // Capture 4 data bytes
    STATE_C15: begin  // {
                  b3_siu_d13 <= b3_sii_l2t_req_data[31:0];
                  b3_state_capture <= STATE_C16;
              end // }

    // Capture 4 data bytes
    STATE_C16: begin  // {
                  b3_siu_d14 <= b3_sii_l2t_req_data[31:0];
                  b3_state_capture <= STATE_C17;
              end // }

    // Capture 4 data bytes
    STATE_C17: begin  // {
                  b3_siu_d15 <= b3_sii_l2t_req_data[31:0];
                  b3_state_capture <= STATE_C18;
              end // }

    // Save WRI packet (pa and data)x to IOWB
    STATE_C18: begin  // {
                  // Extra check to make sure that RTL is writing to its IOWB, too.
                  if (!b3_rdma_wren) begin // {
                    `PR_ERROR("pli_ldst",`ERROR,"Bench ERROR - Capture State Machine - b3_rdma_wren is not asserted when it is expected to be asserted.");
                  end // }
                  else begin // {
                    b3_write_iowb (b3_push_index);
                    b3_push_index = b3_push_index + 1;
                  end // }
                  b3_state_capture <= STATE_C0;
              end // }

    default:  begin  // {
                `PR_ERROR("pli_ldst",`ERROR,"Bench ERROR - ldst_dma Capture State Machine 3 should not hit default state");
              end // }

  endcase

end // always}

//----------------------------------------------------------
// Task to save data captured on SIU -> L2 interface into IOWB
task b3_write_iowb;

input [1:0] index;

  begin
    `PR_INFO("ldst_dma",`INFO,"Push to B3 IOWB. index=%d pa=%h D0=%h",
                              index,b3_siu_pa,b3_siu_d0);
    case (index)
      2'h0: begin
              if (b3_iowb0_valid) begin
                `PR_ERROR("pli_ldst",`ERROR,"Bench ERROR - b3_iowb0 Overflow.");
              end
              else begin
                b3_iowb0_valid <= 1'b1;
              end

              b3_iowb0_pa  <= b3_siu_pa;
              b3_iowb0[0]  <= b3_siu_d0;
              b3_iowb0[1]  <= b3_siu_d1;
              b3_iowb0[2]  <= b3_siu_d2;
              b3_iowb0[3]  <= b3_siu_d3;
              b3_iowb0[4]  <= b3_siu_d4;
              b3_iowb0[5]  <= b3_siu_d5;
              b3_iowb0[6]  <= b3_siu_d6;
              b3_iowb0[7]  <= b3_siu_d7;
              b3_iowb0[8]  <= b3_siu_d8;
              b3_iowb0[9]  <= b3_siu_d9;
              b3_iowb0[10] <= b3_siu_d10;
              b3_iowb0[11] <= b3_siu_d11;
              b3_iowb0[12] <= b3_siu_d12;
              b3_iowb0[13] <= b3_siu_d13;
              b3_iowb0[14] <= b3_siu_d14;
              b3_iowb0[15] <= b3_siu_d15;
            end
      2'h1: begin
              if (b3_iowb1_valid) begin
                `PR_ERROR("pli_ldst",`ERROR,"Bench ERROR - b3_iowb1 Overflow.");
              end
              else begin
                b3_iowb1_valid <= 1'b1;
              end

              b3_iowb1_pa  <= b3_siu_pa;
              b3_iowb1[0]  <= b3_siu_d0;
              b3_iowb1[1]  <= b3_siu_d1;
              b3_iowb1[2]  <= b3_siu_d2;
              b3_iowb1[3]  <= b3_siu_d3;
              b3_iowb1[4]  <= b3_siu_d4;
              b3_iowb1[5]  <= b3_siu_d5;
              b3_iowb1[6]  <= b3_siu_d6;
              b3_iowb1[7]  <= b3_siu_d7;
              b3_iowb1[8]  <= b3_siu_d8;
              b3_iowb1[9]  <= b3_siu_d9;
              b3_iowb1[10] <= b3_siu_d10;
              b3_iowb1[11] <= b3_siu_d11;
              b3_iowb1[12] <= b3_siu_d12;
              b3_iowb1[13] <= b3_siu_d13;
              b3_iowb1[14] <= b3_siu_d14;
              b3_iowb1[15] <= b3_siu_d15;
            end
      2'h2: begin
              if (b3_iowb2_valid) begin
                `PR_ERROR("pli_ldst",`ERROR,"Bench ERROR - b3_iowb2 Overflow.");
              end
              else begin
                b3_iowb2_valid <= 1'b1;
              end

              b3_iowb2_pa  <= b3_siu_pa;
              b3_iowb2[0]  <= b3_siu_d0;
              b3_iowb2[1]  <= b3_siu_d1;
              b3_iowb2[2]  <= b3_siu_d2;
              b3_iowb2[3]  <= b3_siu_d3;
              b3_iowb2[4]  <= b3_siu_d4;
              b3_iowb2[5]  <= b3_siu_d5;
              b3_iowb2[6]  <= b3_siu_d6;
              b3_iowb2[7]  <= b3_siu_d7;
              b3_iowb2[8]  <= b3_siu_d8;
              b3_iowb2[9]  <= b3_siu_d9;
              b3_iowb2[10] <= b3_siu_d10;
              b3_iowb2[11] <= b3_siu_d11;
              b3_iowb2[12] <= b3_siu_d12;
              b3_iowb2[13] <= b3_siu_d13;
              b3_iowb2[14] <= b3_siu_d14;
              b3_iowb2[15] <= b3_siu_d15;
            end
      2'h3: begin
              if (b3_iowb3_valid) begin
                `PR_ERROR("pli_ldst",`ERROR,"Bench ERROR - b3_iowb3 Overflow.");
              end
              else begin
                b3_iowb3_valid <= 1'b1;
              end

              b3_iowb3_pa  <= b3_siu_pa;
              b3_iowb3[0]  <= b3_siu_d0;
              b3_iowb3[1]  <= b3_siu_d1;
              b3_iowb3[2]  <= b3_siu_d2;
              b3_iowb3[3]  <= b3_siu_d3;
              b3_iowb3[4]  <= b3_siu_d4;
              b3_iowb3[5]  <= b3_siu_d5;
              b3_iowb3[6]  <= b3_siu_d6;
              b3_iowb3[7]  <= b3_siu_d7;
              b3_iowb3[8]  <= b3_siu_d8;
              b3_iowb3[9]  <= b3_siu_d9;
              b3_iowb3[10] <= b3_siu_d10;
              b3_iowb3[11] <= b3_siu_d11;
              b3_iowb3[12] <= b3_siu_d12;
              b3_iowb3[13] <= b3_siu_d13;
              b3_iowb3[14] <= b3_siu_d14;
              b3_iowb3[15] <= b3_siu_d15;
            end
      default: begin
                `PR_ERROR("pli_ldst",`ERROR,"Bench ERROR - task write_iowb should not hit default state");
               end
    endcase    

  end
endtask

//----------------------------------------------------------
// Task to read data from IOWB and send to Riesling
task b3_read_iowb;

input [1:0] index;
input [3:0] tmp_evict;

  begin
    case (index)
      2'h0: 
          begin
            if (!b3_iowb0_valid) begin
              `PR_ERROR("pli_ldst",`ERROR,"Bench ERROR - b3_iowb0 Underflow.");
            end
            else begin
              b3_iowb0_valid <= 1'b0;
            end

           `PR_INFO("ldst_dma",`INFO,"Pop from B3 IOWB. index=%d pa=%h D0=%h",
                              index,b3_iowb0_pa,b3_iowb0[0]);

            // Call task to send NAS message
            // Send 8 Bytes at a time
            dma_store (b3_iowb0_pa,   {b3_iowb0[0], b3_iowb0[1]}, 8'hff,tmp_evict[0],8'd64,"B3 WRI 1");
            dma_store (b3_iowb0_pa+8, {b3_iowb0[2], b3_iowb0[3]}, 8'hff,tmp_evict[0],8'd64,"B3 WRI 2");
            dma_store (b3_iowb0_pa+16,{b3_iowb0[4], b3_iowb0[5]}, 8'hff,tmp_evict[1],8'd64,"B3 WRI 3");
            dma_store (b3_iowb0_pa+24,{b3_iowb0[6], b3_iowb0[7]}, 8'hff,tmp_evict[1],8'd64,"B3 WRI 4");
            dma_store (b3_iowb0_pa+32,{b3_iowb0[8], b3_iowb0[9]}, 8'hff,tmp_evict[2],8'd64,"B3 WRI 5");
            dma_store (b3_iowb0_pa+40,{b3_iowb0[10],b3_iowb0[11]},8'hff,tmp_evict[2],8'd64,"B3 WRI 6");
            dma_store (b3_iowb0_pa+48,{b3_iowb0[12],b3_iowb0[13]},8'hff,tmp_evict[3],8'd64,"B3 WRI 7");
            dma_store (b3_iowb0_pa+56,{b3_iowb0[14],b3_iowb0[15]},8'hff,tmp_evict[3],8'd64,"B3 WRI 8");
          end
      2'h1: 
          begin
            if (!b3_iowb1_valid) begin
              `PR_ERROR("pli_ldst",`ERROR,"Bench ERROR - b3_iowb1 Underflow.");
            end
            else begin
              b3_iowb1_valid <= 1'b0;
            end

           `PR_INFO("ldst_dma",`INFO,"Pop from B3 IOWB. index=%d pa=%h D0=%h",
                              index,b3_iowb1_pa,b3_iowb1[0]);

            // Call task to send NAS message
            // Send 8 Bytes at a time
            dma_store (b3_iowb1_pa,   {b3_iowb1[0], b3_iowb1[1]}, 8'hff,tmp_evict[0],8'd64,"B3 WRI 1");
            dma_store (b3_iowb1_pa+8, {b3_iowb1[2], b3_iowb1[3]}, 8'hff,tmp_evict[0],8'd64,"B3 WRI 2");
            dma_store (b3_iowb1_pa+16,{b3_iowb1[4], b3_iowb1[5]}, 8'hff,tmp_evict[1],8'd64,"B3 WRI 3");
            dma_store (b3_iowb1_pa+24,{b3_iowb1[6], b3_iowb1[7]}, 8'hff,tmp_evict[1],8'd64,"B3 WRI 4");
            dma_store (b3_iowb1_pa+32,{b3_iowb1[8], b3_iowb1[9]}, 8'hff,tmp_evict[2],8'd64,"B3 WRI 5");
            dma_store (b3_iowb1_pa+40,{b3_iowb1[10],b3_iowb1[11]},8'hff,tmp_evict[2],8'd64,"B3 WRI 6");
            dma_store (b3_iowb1_pa+48,{b3_iowb1[12],b3_iowb1[13]},8'hff,tmp_evict[3],8'd64,"B3 WRI 7");
            dma_store (b3_iowb1_pa+56,{b3_iowb1[14],b3_iowb1[15]},8'hff,tmp_evict[3],8'd64,"B3 WRI 8");
          end
      2'h2: 
          begin
            if (!b3_iowb2_valid) begin
              `PR_ERROR("pli_ldst",`ERROR,"Bench ERROR - b3_iowb2 Underflow.");
            end
            else begin
              b3_iowb2_valid <= 1'b0;
            end

           `PR_INFO("ldst_dma",`INFO,"Pop from B3 IOWB. index=%d pa=%h D0=%h",
                              index,b3_iowb2_pa,b3_iowb2[0]);

            // Call task to send NAS message
            // Send 8 Bytes at a time
            dma_store (b3_iowb2_pa,   {b3_iowb2[0], b3_iowb2[1]}, 8'hff,tmp_evict[0],8'd64,"B3 WRI 1");
            dma_store (b3_iowb2_pa+8, {b3_iowb2[2], b3_iowb2[3]}, 8'hff,tmp_evict[0],8'd64,"B3 WRI 2");
            dma_store (b3_iowb2_pa+16,{b3_iowb2[4], b3_iowb2[5]}, 8'hff,tmp_evict[1],8'd64,"B3 WRI 3");
            dma_store (b3_iowb2_pa+24,{b3_iowb2[6], b3_iowb2[7]}, 8'hff,tmp_evict[1],8'd64,"B3 WRI 4");
            dma_store (b3_iowb2_pa+32,{b3_iowb2[8], b3_iowb2[9]}, 8'hff,tmp_evict[2],8'd64,"B3 WRI 5");
            dma_store (b3_iowb2_pa+40,{b3_iowb2[10],b3_iowb2[11]},8'hff,tmp_evict[2],8'd64,"B3 WRI 6");
            dma_store (b3_iowb2_pa+48,{b3_iowb2[12],b3_iowb2[13]},8'hff,tmp_evict[3],8'd64,"B3 WRI 7");
            dma_store (b3_iowb2_pa+56,{b3_iowb2[14],b3_iowb2[15]},8'hff,tmp_evict[3],8'd64,"B3 WRI 8");
          end
      2'h3: 
          begin
            if (!b3_iowb3_valid) begin
              `PR_ERROR("pli_ldst",`ERROR,"Bench ERROR - b3_iowb3 Underflow.");
            end
            else begin
              b3_iowb3_valid <= 1'b0;
            end

           `PR_INFO("ldst_dma",`INFO,"Pop from B3 IOWB. index=%d pa=%h D0=%h",
                              index,b3_iowb3_pa,b3_iowb3[0]);

            // Call task to send NAS message
            // Send 8 Bytes at a time
            dma_store (b3_iowb3_pa,   {b3_iowb3[0], b3_iowb3[1]}, 8'hff,tmp_evict[0],8'd64,"B3 WRI 1");
            dma_store (b3_iowb3_pa+8, {b3_iowb3[2], b3_iowb3[3]}, 8'hff,tmp_evict[0],8'd64,"B3 WRI 2");
            dma_store (b3_iowb3_pa+16,{b3_iowb3[4], b3_iowb3[5]}, 8'hff,tmp_evict[1],8'd64,"B3 WRI 3");
            dma_store (b3_iowb3_pa+24,{b3_iowb3[6], b3_iowb3[7]}, 8'hff,tmp_evict[1],8'd64,"B3 WRI 4");
            dma_store (b3_iowb3_pa+32,{b3_iowb3[8], b3_iowb3[9]}, 8'hff,tmp_evict[2],8'd64,"B3 WRI 5");
            dma_store (b3_iowb3_pa+40,{b3_iowb3[10],b3_iowb3[11]},8'hff,tmp_evict[2],8'd64,"B3 WRI 6");
            dma_store (b3_iowb3_pa+48,{b3_iowb3[12],b3_iowb3[13]},8'hff,tmp_evict[3],8'd64,"B3 WRI 7");
            dma_store (b3_iowb3_pa+56,{b3_iowb3[14],b3_iowb3[15]},8'hff,tmp_evict[3],8'd64,"B3 WRI 8");
          end
      default: 
          begin
            `PR_ERROR("pli_ldst",`ERROR,"Bench ERROR - task read_iowb should not hit default state");
          end
    endcase    

  end
endtask

//----------------------------------------------------------
// Task to make sure the entry at the location pointed to by index is valid before we try to pop it.
task b3_chk_valid_entry;

input [1:0] index;

  begin
    case (index)
      2'h0: 
          begin
            if (b3_iowb0_valid != 1'b1) begin
              `PR_ERROR("pli_ldst",`ERROR,"Bench ERROR - the entry in IOWB at index=0 is not valid (b3_iowb0_valid!=1'b1)");
            end
          end
      2'h1: 
          begin
            if (b3_iowb1_valid != 1'b1) begin
              `PR_ERROR("pli_ldst",`ERROR,"Bench ERROR - the entry in IOWB at index=1 is not valid (b3_iowb1_valid!=1'b1)");
            end
          end
      2'h2: 
          begin
            if (b3_iowb2_valid != 1'b1) begin
              `PR_ERROR("pli_ldst",`ERROR,"Bench ERROR - the entry in IOWB at index=2 is not valid (b3_iowb2_valid!=1'b1)");
            end
          end
      2'h3: 
          begin
            if (b3_iowb3_valid != 1'b1) begin
              `PR_ERROR("pli_ldst",`ERROR,"Bench ERROR - the entry in IOWB at index=3 is not valid (b3_iowb3_valid!=1'b1)");
            end
          end
      default: 
          begin
            `PR_ERROR("pli_ldst",`ERROR,"Bench ERROR - task chk_valid_entry should not hit default state");
          end
    endcase
  end
endtask

  `endif // `ifdef NOL2RTL
`endif   // `ifdef NO_L2_BNK3

`ifdef NO_L2_BNK4
`else
  `ifdef NOL2RTL
  `else

//==========================================================
//==========================================================
// L2 RTL Probes

  //----------------------------------------------------------
  // Signals for L2 RTL Bank4

  //---------------------
  // SIU store

  wire                       b4_cam_hit_c5;
  reg                        b4_cam_hit_c52;
  reg                        b4_cam_hit_c6;
  reg                        b4_cam_hit_c7;
  reg                        b4_cam_hit_c8;
  wire                       b4_cam_hit;
  wire                       b4_inst_valid_c2;
  wire                       b4_wr8_inst_c2;
  wire                       b4_wr64_inst_c2;

  // If the cam hits, then there will be an eviction sent to the core(s)
  assign b4_cam_hit_c5       = |`CPU.l2t4.dc_cam_hit;
  assign b4_cam_hit          = b4_cam_hit_c8;
  assign b4_inst_valid_c2    = `CPU.l2t4.arb.arb_inst_vld_c2;
  assign b4_wr8_inst_c2      = `CPU.l2t4.arb.arb_decdp_wr8_inst_c2;
  assign b4_wr64_inst_c2     = `CPU.l2t4.arb.arb_decdp_wr64_inst_c2;

  //---------------------
  // WR8 signals
  wire                       b4_first_pass_c2;
  reg                        b4_first_pass_c3;
  reg                        b4_first_pass_c4;
  reg                        b4_first_pass_c5;
  reg                        b4_first_pass_c52;
  reg                        b4_first_pass_c6;
  reg                        b4_first_pass_c7;
  reg                        b4_first_pass_c8;
  wire                       b4_first_pass;
  wire                       b4_wr8_active_c2;
  reg                        b4_wr8_active_c3;
  reg                        b4_wr8_active_c4;
  reg                        b4_wr8_active_c5;
  reg                        b4_wr8_active_c52;
  reg                        b4_wr8_active_c6;
  reg                        b4_wr8_active_c7;
  reg                        b4_wr8_active_c8;
  wire                       b4_wr8_active;

  wire                [39:0] b4_siu_wr8_pa;
  wire                [63:0] b4_siu_wr8_data;
  wire                 [7:0] b4_siu_wr8_size;

  assign b4_wr8_active_c2       = `CPU.l2t4.arb_decdp_wr8_inst_c2;
  assign b4_wr8_active          = b4_wr8_active_c8;
  assign b4_first_pass_c2       = `CPU.l2t4.arbdec.arbdp_inst_c2[39]==0;
  assign b4_first_pass          = b4_first_pass_c8;
  assign b4_siu_wr8_pa          = `CPU.l2t4.arbadr.arbdp_addr_c8;
  assign b4_siu_wr8_data        = `CPU.l2t4.arbdat.arbdp_inst_data_c8;
  assign b4_siu_wr8_size        = `CPU.l2t4.arbdec.arbdec_arbdp_inst_size_c8;

  //---------------------
  // WRI signals
  reg                  [1:0] b4_pop_index;   // Index pointing to next entry to be read from IOWB
  reg                  [1:0] b4_push_index;  // Index pointing to next entry to be written from IOWB

  wire                       b4_wr64_active_c2;
  reg                        b4_wr64_active_c3;
  reg                        b4_wr64_active_c4;
  reg                        b4_wr64_active_c5;
  reg                        b4_wr64_active_c52;
  reg                        b4_wr64_active_c6;
  reg                        b4_wr64_active_c7;
  reg                        b4_wr64_active_c8;
  wire                       b4_wr64_active;

  wire                       b4_sii_l2t_req_vld;
  wire                [31:0] b4_sii_l2t_req_data;
  wire                       b4_rdma_wren;
  //wire               [1:0] b4_rdma_index;
  //wire               [3:0] b4_rdma_valid;

   reg                 [4:0] b4_state_capture;
   reg                [39:0] b4_siu_pa;
   reg                [31:0] b4_siu_d0;
   reg                [31:0] b4_siu_d1;
   reg                [31:0] b4_siu_d2;
   reg                [31:0] b4_siu_d3;
   reg                [31:0] b4_siu_d4;
   reg                [31:0] b4_siu_d5;
   reg                [31:0] b4_siu_d6;
   reg                [31:0] b4_siu_d7;
   reg                [31:0] b4_siu_d8;
   reg                [31:0] b4_siu_d9;
   reg                [31:0] b4_siu_d10;
   reg                [31:0] b4_siu_d11;
   reg                [31:0] b4_siu_d12;
   reg                [31:0] b4_siu_d13;
   reg                [31:0] b4_siu_d14;
   reg                [31:0] b4_siu_d15;

   // IOWB has 4 entries
   // Each entry has valid bit, pa, 64 Byte data
   reg                       b4_iowb0_valid;  // Indicates Bench has captured entire packet
   reg                       b4_iowb1_valid;
   reg                       b4_iowb2_valid;
   reg                       b4_iowb3_valid;
   reg                [39:0] b4_iowb0_pa;
   reg                [39:0] b4_iowb1_pa;
   reg                [39:0] b4_iowb2_pa;
   reg                [39:0] b4_iowb3_pa;
   reg                [31:0] b4_iowb0 [0:15];
   reg                [31:0] b4_iowb1 [0:15];
   reg                [31:0] b4_iowb2 [0:15];
   reg                [31:0] b4_iowb3 [0:15];

  assign b4_sii_l2t_req_vld     = `CPU.l2t4.sii_l2t_req_vld;
  assign b4_sii_l2t_req_data    = `CPU.l2t4.sii_l2t_req[31:0];

  assign b4_wr64_active_c2   = b4_inst_valid_c2 & b4_wr64_inst_c2;
  assign b4_wr64_active      = b4_wr64_active_c8;

  // Indicates when rdma_index is valid
  assign b4_rdma_wren           = `CPU.l2b4.evict_l2t_l2b_rdma_wren_s3_v1 | 
                                       `CPU.l2b4.evict_l2t_l2b_rdma_wren_s3_v2 | 
                                       `CPU.l2b4.evict_l2t_l2b_rdma_wren_s3_v3 | 
                                       `CPU.l2b4.evict_l2t_l2b_rdma_wren_s3_v4;

  
  // IOWB entry index = 0,1,2,3
  //assign b4_rdma_index          = `CPU.l2b4.evict_l2t_l2b_rdma_wrwl_s3_v1[1:0];
  // Indicates that any future transactions will see this entry's store data.
  // The bit that is asserted corresponds to the index in the IOWB.
  //assign b4_rdma_valid          = `CPU.l2t4.rdmat.rdma_valid[3:0];

//---------------------
initial
  begin
    b4_pop_index = 2'b0;
    b4_push_index = 2'b0;
    b4_state_capture = STATE_C0;   // Idle state
    b4_iowb0_valid = 1'h0;
    b4_iowb1_valid = 1'h0;
    b4_iowb2_valid = 1'h0;
    b4_iowb3_valid = 1'h0;
    b4_iowb0_pa = 40'h0;
    b4_iowb1_pa = 40'h0;
    b4_iowb2_pa = 40'h0;
    b4_iowb3_pa = 40'h0;
    b4_siu_pa = 40'h0;
    b4_siu_d0 = 32'b0;
    b4_siu_d1 = 32'b0;
    b4_siu_d2 = 32'b0;
    b4_siu_d3 = 32'b0;
    b4_siu_d4 = 32'b0;
    b4_siu_d5 = 32'b0;
    b4_siu_d6 = 32'b0;
    b4_siu_d7 = 32'b0;
    b4_siu_d8 = 32'b0;
    b4_siu_d9 = 32'b0;
    b4_siu_d10 = 32'b0;
    b4_siu_d11 = 32'b0;
    b4_siu_d12 = 32'b0;
    b4_siu_d13 = 32'b0;
    b4_siu_d14 = 32'b0;
    b4_siu_d15 = 32'b0;
  end

//==========================================================
//==========================================================

always @ (posedge `BENCH_L2T4_GCLK) begin // {

  //------------------------------
  //  Pipeline signals

  //------------------------------
  //  L2 RTL Bank4  (not needed for L2 Stub)

  b4_cam_hit_c52 <= b4_cam_hit_c5;
  b4_cam_hit_c6  <= b4_cam_hit_c52;
  b4_cam_hit_c7  <= b4_cam_hit_c6;
  b4_cam_hit_c8  <= b4_cam_hit_c7;

  b4_first_pass_c3  <= b4_first_pass_c2;
  b4_first_pass_c4  <= b4_first_pass_c3;
  b4_first_pass_c5  <= b4_first_pass_c4;
  b4_first_pass_c52 <= b4_first_pass_c5;
  b4_first_pass_c6  <= b4_first_pass_c52;
  b4_first_pass_c7  <= b4_first_pass_c6;
  b4_first_pass_c8  <= b4_first_pass_c7;

  b4_wr8_active_c3  <= b4_wr8_active_c2;
  b4_wr8_active_c4  <= b4_wr8_active_c3;
  b4_wr8_active_c5  <= b4_wr8_active_c4;
  b4_wr8_active_c52 <= b4_wr8_active_c5;
  b4_wr8_active_c6  <= b4_wr8_active_c52;
  b4_wr8_active_c7  <= b4_wr8_active_c6;
  b4_wr8_active_c8  <= b4_wr8_active_c7;

  b4_wr64_active_c3  <= b4_wr64_active_c2;
  b4_wr64_active_c4  <= b4_wr64_active_c3;
  b4_wr64_active_c5  <= b4_wr64_active_c4;
  b4_wr64_active_c52 <= b4_wr64_active_c5;
  b4_wr64_active_c6  <= b4_wr64_active_c52;
  b4_wr64_active_c7  <= b4_wr64_active_c6;
  b4_wr64_active_c8  <= b4_wr64_active_c7;

  //----------------------------------------------------------
  //----------------------------------------------------------
  // SIU Store - WR8

  
  //       only do this if the transfers don't match up in c8.

  if (b4_wr8_active && b4_first_pass) begin // {
    // Send msgs to Riesling
    dma_store (b4_siu_wr8_pa,b4_siu_wr8_data,b4_siu_wr8_size,b4_cam_hit,8'd8,"B4 WR8");
  end // }

  //----------------------------------------------------------
  //----------------------------------------------------------
  // SIU Store - WRI

  //------------------------------
  // Send MemorySlam message after SIU transaction is complete
  // Read IOWB data and Send msgs to Riesling

  if (b4_wr64_active && b4_first_pass) begin // {

    // Determine which of the 8 DMA_STOREs will be evicted.
    // WRI is 64 Bytes.
    // Eviction is 16 Bytes at a time.
    // So, there can be 1-4 Evictions for a single WRI.
    b4_ev_vect0 = b4_ev_invvect[31:0];
    b4_ev_vect1 = b4_ev_invvect[55:32];
    b4_ev_vect2 = b4_ev_invvect[87:56];
    b4_ev_vect3 = b4_ev_invvect[111:88];

    b4_inv_vect[0] = get_vect(b4_ev_vect0);
    b4_inv_vect[1] = get_vect31(b4_ev_vect1);  // different function for odd inval vector
    b4_inv_vect[2] = get_vect(b4_ev_vect2);
    b4_inv_vect[3] = get_vect31(b4_ev_vect3);  // different function for odd inval vector

    //Get entry from IOWB and send message
    b4_chk_valid_entry(b4_pop_index);
    b4_read_iowb(b4_pop_index,
                        {|b4_inv_vect[3],|b4_inv_vect[2],|b4_inv_vect[1],|b4_inv_vect[0]});
    b4_pop_index = b4_pop_index + 1;
  end // }

  //------------------------------
  // Capture state machine
  // Capture pa and data (64 Bytes) off SIU to L2 interface.
  // See SIU MAS (about page 49) for WRI packet format.
  // Put packet in IOWB which had 4 entries.
  // This IOWB in the Bench is not exactly the same as the IOWB in RTL.
  // Bench IOWB is a FIFO and RTL IOWB is not a FIFO.

  case (b4_state_capture)

    // Capture pa (part 1)
    STATE_C0: begin  // {
                // WRI pkt if req_data[26:24]==3'b100
                if ((b4_sii_l2t_req_vld)&&(b4_sii_l2t_req_data[26:24]==3'b100)) begin // {
                  b4_siu_pa[39:32] <= b4_sii_l2t_req_data[7:0];
                  b4_state_capture <= STATE_C1;
                end // }
              end // }

    // Capture pa (part 2)
    STATE_C1: begin  // {
                  b4_siu_pa[31:0] <= b4_sii_l2t_req_data[31:0];
                  b4_state_capture <= STATE_C2;
              end // }

    // Capture 4 data bytes
    STATE_C2: begin  // {
                  b4_siu_d0 <= b4_sii_l2t_req_data[31:0];
                  b4_state_capture <= STATE_C3;
              end // }

    // Capture 4 data bytes
    STATE_C3: begin  // {
                  b4_siu_d1 <= b4_sii_l2t_req_data[31:0];
                  b4_state_capture <= STATE_C4;
              end // }

    // Capture 4 data bytes
    STATE_C4: begin  // {
                  b4_siu_d2 <= b4_sii_l2t_req_data[31:0];
                  b4_state_capture <= STATE_C5;
              end // }

    // Capture 4 data bytes
    STATE_C5: begin  // {
                  b4_siu_d3 <= b4_sii_l2t_req_data[31:0];
                  b4_state_capture <= STATE_C6;
              end // }

    // Capture 4 data bytes
    STATE_C6: begin  // {
                  b4_siu_d4 <= b4_sii_l2t_req_data[31:0];
                  b4_state_capture <= STATE_C7;
              end // }

    // Capture 4 data bytes
    STATE_C7: begin  // {
                  b4_siu_d5 <= b4_sii_l2t_req_data[31:0];
                  b4_state_capture <= STATE_C8;
              end // }

    // Capture 4 data bytes
    STATE_C8: begin  // {
                  b4_siu_d6 <= b4_sii_l2t_req_data[31:0];
                  b4_state_capture <= STATE_C9;
              end // }

    // Capture 4 data bytes
    STATE_C9: begin  // {
                  b4_siu_d7 <= b4_sii_l2t_req_data[31:0];
                  b4_state_capture <= STATE_C10;
              end // }

    // Capture 4 data bytes
    STATE_C10: begin  // {
                  b4_siu_d8 <= b4_sii_l2t_req_data[31:0];
                  b4_state_capture <= STATE_C11;
              end // }

    // Capture 4 data bytes
    STATE_C11: begin  // {
                  b4_siu_d9 <= b4_sii_l2t_req_data[31:0];
                  b4_state_capture <= STATE_C12;
              end // }

    // Capture 4 data bytes
    STATE_C12: begin  // {
                  b4_siu_d10 <= b4_sii_l2t_req_data[31:0];
                  b4_state_capture <= STATE_C13;
              end // }

    // Capture 4 data bytes
    STATE_C13: begin  // {
                  b4_siu_d11 <= b4_sii_l2t_req_data[31:0];
                  b4_state_capture <= STATE_C14;
              end // }

    // Capture 4 data bytes
    STATE_C14: begin  // {
                  b4_siu_d12 <= b4_sii_l2t_req_data[31:0];
                  b4_state_capture <= STATE_C15;
              end // }

    // Capture 4 data bytes
    STATE_C15: begin  // {
                  b4_siu_d13 <= b4_sii_l2t_req_data[31:0];
                  b4_state_capture <= STATE_C16;
              end // }

    // Capture 4 data bytes
    STATE_C16: begin  // {
                  b4_siu_d14 <= b4_sii_l2t_req_data[31:0];
                  b4_state_capture <= STATE_C17;
              end // }

    // Capture 4 data bytes
    STATE_C17: begin  // {
                  b4_siu_d15 <= b4_sii_l2t_req_data[31:0];
                  b4_state_capture <= STATE_C18;
              end // }

    // Save WRI packet (pa and data)x to IOWB
    STATE_C18: begin  // {
                  // Extra check to make sure that RTL is writing to its IOWB, too.
                  if (!b4_rdma_wren) begin // {
                    `PR_ERROR("pli_ldst",`ERROR,"Bench ERROR - Capture State Machine - b4_rdma_wren is not asserted when it is expected to be asserted.");
                  end // }
                  else begin // {
                    b4_write_iowb (b4_push_index);
                    b4_push_index = b4_push_index + 1;
                  end // }
                  b4_state_capture <= STATE_C0;
              end // }

    default:  begin  // {
                `PR_ERROR("pli_ldst",`ERROR,"Bench ERROR - ldst_dma Capture State Machine 4 should not hit default state");
              end // }

  endcase

end // always}

//----------------------------------------------------------
// Task to save data captured on SIU -> L2 interface into IOWB
task b4_write_iowb;

input [1:0] index;

  begin
    `PR_INFO("ldst_dma",`INFO,"Push to B4 IOWB. index=%d pa=%h D0=%h",
                              index,b4_siu_pa,b4_siu_d0);
    case (index)
      2'h0: begin
              if (b4_iowb0_valid) begin
                `PR_ERROR("pli_ldst",`ERROR,"Bench ERROR - b4_iowb0 Overflow.");
              end
              else begin
                b4_iowb0_valid <= 1'b1;
              end

              b4_iowb0_pa  <= b4_siu_pa;
              b4_iowb0[0]  <= b4_siu_d0;
              b4_iowb0[1]  <= b4_siu_d1;
              b4_iowb0[2]  <= b4_siu_d2;
              b4_iowb0[3]  <= b4_siu_d3;
              b4_iowb0[4]  <= b4_siu_d4;
              b4_iowb0[5]  <= b4_siu_d5;
              b4_iowb0[6]  <= b4_siu_d6;
              b4_iowb0[7]  <= b4_siu_d7;
              b4_iowb0[8]  <= b4_siu_d8;
              b4_iowb0[9]  <= b4_siu_d9;
              b4_iowb0[10] <= b4_siu_d10;
              b4_iowb0[11] <= b4_siu_d11;
              b4_iowb0[12] <= b4_siu_d12;
              b4_iowb0[13] <= b4_siu_d13;
              b4_iowb0[14] <= b4_siu_d14;
              b4_iowb0[15] <= b4_siu_d15;
            end
      2'h1: begin
              if (b4_iowb1_valid) begin
                `PR_ERROR("pli_ldst",`ERROR,"Bench ERROR - b4_iowb1 Overflow.");
              end
              else begin
                b4_iowb1_valid <= 1'b1;
              end

              b4_iowb1_pa  <= b4_siu_pa;
              b4_iowb1[0]  <= b4_siu_d0;
              b4_iowb1[1]  <= b4_siu_d1;
              b4_iowb1[2]  <= b4_siu_d2;
              b4_iowb1[3]  <= b4_siu_d3;
              b4_iowb1[4]  <= b4_siu_d4;
              b4_iowb1[5]  <= b4_siu_d5;
              b4_iowb1[6]  <= b4_siu_d6;
              b4_iowb1[7]  <= b4_siu_d7;
              b4_iowb1[8]  <= b4_siu_d8;
              b4_iowb1[9]  <= b4_siu_d9;
              b4_iowb1[10] <= b4_siu_d10;
              b4_iowb1[11] <= b4_siu_d11;
              b4_iowb1[12] <= b4_siu_d12;
              b4_iowb1[13] <= b4_siu_d13;
              b4_iowb1[14] <= b4_siu_d14;
              b4_iowb1[15] <= b4_siu_d15;
            end
      2'h2: begin
              if (b4_iowb2_valid) begin
                `PR_ERROR("pli_ldst",`ERROR,"Bench ERROR - b4_iowb2 Overflow.");
              end
              else begin
                b4_iowb2_valid <= 1'b1;
              end

              b4_iowb2_pa  <= b4_siu_pa;
              b4_iowb2[0]  <= b4_siu_d0;
              b4_iowb2[1]  <= b4_siu_d1;
              b4_iowb2[2]  <= b4_siu_d2;
              b4_iowb2[3]  <= b4_siu_d3;
              b4_iowb2[4]  <= b4_siu_d4;
              b4_iowb2[5]  <= b4_siu_d5;
              b4_iowb2[6]  <= b4_siu_d6;
              b4_iowb2[7]  <= b4_siu_d7;
              b4_iowb2[8]  <= b4_siu_d8;
              b4_iowb2[9]  <= b4_siu_d9;
              b4_iowb2[10] <= b4_siu_d10;
              b4_iowb2[11] <= b4_siu_d11;
              b4_iowb2[12] <= b4_siu_d12;
              b4_iowb2[13] <= b4_siu_d13;
              b4_iowb2[14] <= b4_siu_d14;
              b4_iowb2[15] <= b4_siu_d15;
            end
      2'h3: begin
              if (b4_iowb3_valid) begin
                `PR_ERROR("pli_ldst",`ERROR,"Bench ERROR - b4_iowb3 Overflow.");
              end
              else begin
                b4_iowb3_valid <= 1'b1;
              end

              b4_iowb3_pa  <= b4_siu_pa;
              b4_iowb3[0]  <= b4_siu_d0;
              b4_iowb3[1]  <= b4_siu_d1;
              b4_iowb3[2]  <= b4_siu_d2;
              b4_iowb3[3]  <= b4_siu_d3;
              b4_iowb3[4]  <= b4_siu_d4;
              b4_iowb3[5]  <= b4_siu_d5;
              b4_iowb3[6]  <= b4_siu_d6;
              b4_iowb3[7]  <= b4_siu_d7;
              b4_iowb3[8]  <= b4_siu_d8;
              b4_iowb3[9]  <= b4_siu_d9;
              b4_iowb3[10] <= b4_siu_d10;
              b4_iowb3[11] <= b4_siu_d11;
              b4_iowb3[12] <= b4_siu_d12;
              b4_iowb3[13] <= b4_siu_d13;
              b4_iowb3[14] <= b4_siu_d14;
              b4_iowb3[15] <= b4_siu_d15;
            end
      default: begin
                `PR_ERROR("pli_ldst",`ERROR,"Bench ERROR - task write_iowb should not hit default state");
               end
    endcase    

  end
endtask

//----------------------------------------------------------
// Task to read data from IOWB and send to Riesling
task b4_read_iowb;

input [1:0] index;
input [3:0] tmp_evict;

  begin
    case (index)
      2'h0: 
          begin
            if (!b4_iowb0_valid) begin
              `PR_ERROR("pli_ldst",`ERROR,"Bench ERROR - b4_iowb0 Underflow.");
            end
            else begin
              b4_iowb0_valid <= 1'b0;
            end

           `PR_INFO("ldst_dma",`INFO,"Pop from B4 IOWB. index=%d pa=%h D0=%h",
                              index,b4_iowb0_pa,b4_iowb0[0]);

            // Call task to send NAS message
            // Send 8 Bytes at a time
            dma_store (b4_iowb0_pa,   {b4_iowb0[0], b4_iowb0[1]}, 8'hff,tmp_evict[0],8'd64,"B4 WRI 1");
            dma_store (b4_iowb0_pa+8, {b4_iowb0[2], b4_iowb0[3]}, 8'hff,tmp_evict[0],8'd64,"B4 WRI 2");
            dma_store (b4_iowb0_pa+16,{b4_iowb0[4], b4_iowb0[5]}, 8'hff,tmp_evict[1],8'd64,"B4 WRI 3");
            dma_store (b4_iowb0_pa+24,{b4_iowb0[6], b4_iowb0[7]}, 8'hff,tmp_evict[1],8'd64,"B4 WRI 4");
            dma_store (b4_iowb0_pa+32,{b4_iowb0[8], b4_iowb0[9]}, 8'hff,tmp_evict[2],8'd64,"B4 WRI 5");
            dma_store (b4_iowb0_pa+40,{b4_iowb0[10],b4_iowb0[11]},8'hff,tmp_evict[2],8'd64,"B4 WRI 6");
            dma_store (b4_iowb0_pa+48,{b4_iowb0[12],b4_iowb0[13]},8'hff,tmp_evict[3],8'd64,"B4 WRI 7");
            dma_store (b4_iowb0_pa+56,{b4_iowb0[14],b4_iowb0[15]},8'hff,tmp_evict[3],8'd64,"B4 WRI 8");
          end
      2'h1: 
          begin
            if (!b4_iowb1_valid) begin
              `PR_ERROR("pli_ldst",`ERROR,"Bench ERROR - b4_iowb1 Underflow.");
            end
            else begin
              b4_iowb1_valid <= 1'b0;
            end

           `PR_INFO("ldst_dma",`INFO,"Pop from B4 IOWB. index=%d pa=%h D0=%h",
                              index,b4_iowb1_pa,b4_iowb1[0]);

            // Call task to send NAS message
            // Send 8 Bytes at a time
            dma_store (b4_iowb1_pa,   {b4_iowb1[0], b4_iowb1[1]}, 8'hff,tmp_evict[0],8'd64,"B4 WRI 1");
            dma_store (b4_iowb1_pa+8, {b4_iowb1[2], b4_iowb1[3]}, 8'hff,tmp_evict[0],8'd64,"B4 WRI 2");
            dma_store (b4_iowb1_pa+16,{b4_iowb1[4], b4_iowb1[5]}, 8'hff,tmp_evict[1],8'd64,"B4 WRI 3");
            dma_store (b4_iowb1_pa+24,{b4_iowb1[6], b4_iowb1[7]}, 8'hff,tmp_evict[1],8'd64,"B4 WRI 4");
            dma_store (b4_iowb1_pa+32,{b4_iowb1[8], b4_iowb1[9]}, 8'hff,tmp_evict[2],8'd64,"B4 WRI 5");
            dma_store (b4_iowb1_pa+40,{b4_iowb1[10],b4_iowb1[11]},8'hff,tmp_evict[2],8'd64,"B4 WRI 6");
            dma_store (b4_iowb1_pa+48,{b4_iowb1[12],b4_iowb1[13]},8'hff,tmp_evict[3],8'd64,"B4 WRI 7");
            dma_store (b4_iowb1_pa+56,{b4_iowb1[14],b4_iowb1[15]},8'hff,tmp_evict[3],8'd64,"B4 WRI 8");
          end
      2'h2: 
          begin
            if (!b4_iowb2_valid) begin
              `PR_ERROR("pli_ldst",`ERROR,"Bench ERROR - b4_iowb2 Underflow.");
            end
            else begin
              b4_iowb2_valid <= 1'b0;
            end

           `PR_INFO("ldst_dma",`INFO,"Pop from B4 IOWB. index=%d pa=%h D0=%h",
                              index,b4_iowb2_pa,b4_iowb2[0]);

            // Call task to send NAS message
            // Send 8 Bytes at a time
            dma_store (b4_iowb2_pa,   {b4_iowb2[0], b4_iowb2[1]}, 8'hff,tmp_evict[0],8'd64,"B4 WRI 1");
            dma_store (b4_iowb2_pa+8, {b4_iowb2[2], b4_iowb2[3]}, 8'hff,tmp_evict[0],8'd64,"B4 WRI 2");
            dma_store (b4_iowb2_pa+16,{b4_iowb2[4], b4_iowb2[5]}, 8'hff,tmp_evict[1],8'd64,"B4 WRI 3");
            dma_store (b4_iowb2_pa+24,{b4_iowb2[6], b4_iowb2[7]}, 8'hff,tmp_evict[1],8'd64,"B4 WRI 4");
            dma_store (b4_iowb2_pa+32,{b4_iowb2[8], b4_iowb2[9]}, 8'hff,tmp_evict[2],8'd64,"B4 WRI 5");
            dma_store (b4_iowb2_pa+40,{b4_iowb2[10],b4_iowb2[11]},8'hff,tmp_evict[2],8'd64,"B4 WRI 6");
            dma_store (b4_iowb2_pa+48,{b4_iowb2[12],b4_iowb2[13]},8'hff,tmp_evict[3],8'd64,"B4 WRI 7");
            dma_store (b4_iowb2_pa+56,{b4_iowb2[14],b4_iowb2[15]},8'hff,tmp_evict[3],8'd64,"B4 WRI 8");
          end
      2'h3: 
          begin
            if (!b4_iowb3_valid) begin
              `PR_ERROR("pli_ldst",`ERROR,"Bench ERROR - b4_iowb3 Underflow.");
            end
            else begin
              b4_iowb3_valid <= 1'b0;
            end

           `PR_INFO("ldst_dma",`INFO,"Pop from B4 IOWB. index=%d pa=%h D0=%h",
                              index,b4_iowb3_pa,b4_iowb3[0]);

            // Call task to send NAS message
            // Send 8 Bytes at a time
            dma_store (b4_iowb3_pa,   {b4_iowb3[0], b4_iowb3[1]}, 8'hff,tmp_evict[0],8'd64,"B4 WRI 1");
            dma_store (b4_iowb3_pa+8, {b4_iowb3[2], b4_iowb3[3]}, 8'hff,tmp_evict[0],8'd64,"B4 WRI 2");
            dma_store (b4_iowb3_pa+16,{b4_iowb3[4], b4_iowb3[5]}, 8'hff,tmp_evict[1],8'd64,"B4 WRI 3");
            dma_store (b4_iowb3_pa+24,{b4_iowb3[6], b4_iowb3[7]}, 8'hff,tmp_evict[1],8'd64,"B4 WRI 4");
            dma_store (b4_iowb3_pa+32,{b4_iowb3[8], b4_iowb3[9]}, 8'hff,tmp_evict[2],8'd64,"B4 WRI 5");
            dma_store (b4_iowb3_pa+40,{b4_iowb3[10],b4_iowb3[11]},8'hff,tmp_evict[2],8'd64,"B4 WRI 6");
            dma_store (b4_iowb3_pa+48,{b4_iowb3[12],b4_iowb3[13]},8'hff,tmp_evict[3],8'd64,"B4 WRI 7");
            dma_store (b4_iowb3_pa+56,{b4_iowb3[14],b4_iowb3[15]},8'hff,tmp_evict[3],8'd64,"B4 WRI 8");
          end
      default: 
          begin
            `PR_ERROR("pli_ldst",`ERROR,"Bench ERROR - task read_iowb should not hit default state");
          end
    endcase    

  end
endtask

//----------------------------------------------------------
// Task to make sure the entry at the location pointed to by index is valid before we try to pop it.
task b4_chk_valid_entry;

input [1:0] index;

  begin
    case (index)
      2'h0: 
          begin
            if (b4_iowb0_valid != 1'b1) begin
              `PR_ERROR("pli_ldst",`ERROR,"Bench ERROR - the entry in IOWB at index=0 is not valid (b4_iowb0_valid!=1'b1)");
            end
          end
      2'h1: 
          begin
            if (b4_iowb1_valid != 1'b1) begin
              `PR_ERROR("pli_ldst",`ERROR,"Bench ERROR - the entry in IOWB at index=1 is not valid (b4_iowb1_valid!=1'b1)");
            end
          end
      2'h2: 
          begin
            if (b4_iowb2_valid != 1'b1) begin
              `PR_ERROR("pli_ldst",`ERROR,"Bench ERROR - the entry in IOWB at index=2 is not valid (b4_iowb2_valid!=1'b1)");
            end
          end
      2'h3: 
          begin
            if (b4_iowb3_valid != 1'b1) begin
              `PR_ERROR("pli_ldst",`ERROR,"Bench ERROR - the entry in IOWB at index=3 is not valid (b4_iowb3_valid!=1'b1)");
            end
          end
      default: 
          begin
            `PR_ERROR("pli_ldst",`ERROR,"Bench ERROR - task chk_valid_entry should not hit default state");
          end
    endcase
  end
endtask

  `endif // `ifdef NOL2RTL
`endif   // `ifdef NO_L2_BNK4

`ifdef NO_L2_BNK5
`else
  `ifdef NOL2RTL
  `else

//==========================================================
//==========================================================
// L2 RTL Probes

  //----------------------------------------------------------
  // Signals for L2 RTL Bank5

  //---------------------
  // SIU store

  wire                       b5_cam_hit_c5;
  reg                        b5_cam_hit_c52;
  reg                        b5_cam_hit_c6;
  reg                        b5_cam_hit_c7;
  reg                        b5_cam_hit_c8;
  wire                       b5_cam_hit;
  wire                       b5_inst_valid_c2;
  wire                       b5_wr8_inst_c2;
  wire                       b5_wr64_inst_c2;

  // If the cam hits, then there will be an eviction sent to the core(s)
  assign b5_cam_hit_c5       = |`CPU.l2t5.dc_cam_hit;
  assign b5_cam_hit          = b5_cam_hit_c8;
  assign b5_inst_valid_c2    = `CPU.l2t5.arb.arb_inst_vld_c2;
  assign b5_wr8_inst_c2      = `CPU.l2t5.arb.arb_decdp_wr8_inst_c2;
  assign b5_wr64_inst_c2     = `CPU.l2t5.arb.arb_decdp_wr64_inst_c2;

  //---------------------
  // WR8 signals
  wire                       b5_first_pass_c2;
  reg                        b5_first_pass_c3;
  reg                        b5_first_pass_c4;
  reg                        b5_first_pass_c5;
  reg                        b5_first_pass_c52;
  reg                        b5_first_pass_c6;
  reg                        b5_first_pass_c7;
  reg                        b5_first_pass_c8;
  wire                       b5_first_pass;
  wire                       b5_wr8_active_c2;
  reg                        b5_wr8_active_c3;
  reg                        b5_wr8_active_c4;
  reg                        b5_wr8_active_c5;
  reg                        b5_wr8_active_c52;
  reg                        b5_wr8_active_c6;
  reg                        b5_wr8_active_c7;
  reg                        b5_wr8_active_c8;
  wire                       b5_wr8_active;

  wire                [39:0] b5_siu_wr8_pa;
  wire                [63:0] b5_siu_wr8_data;
  wire                 [7:0] b5_siu_wr8_size;

  assign b5_wr8_active_c2       = `CPU.l2t5.arb_decdp_wr8_inst_c2;
  assign b5_wr8_active          = b5_wr8_active_c8;
  assign b5_first_pass_c2       = `CPU.l2t5.arbdec.arbdp_inst_c2[39]==0;
  assign b5_first_pass          = b5_first_pass_c8;
  assign b5_siu_wr8_pa          = `CPU.l2t5.arbadr.arbdp_addr_c8;
  assign b5_siu_wr8_data        = `CPU.l2t5.arbdat.arbdp_inst_data_c8;
  assign b5_siu_wr8_size        = `CPU.l2t5.arbdec.arbdec_arbdp_inst_size_c8;

  //---------------------
  // WRI signals
  reg                  [1:0] b5_pop_index;   // Index pointing to next entry to be read from IOWB
  reg                  [1:0] b5_push_index;  // Index pointing to next entry to be written from IOWB

  wire                       b5_wr64_active_c2;
  reg                        b5_wr64_active_c3;
  reg                        b5_wr64_active_c4;
  reg                        b5_wr64_active_c5;
  reg                        b5_wr64_active_c52;
  reg                        b5_wr64_active_c6;
  reg                        b5_wr64_active_c7;
  reg                        b5_wr64_active_c8;
  wire                       b5_wr64_active;

  wire                       b5_sii_l2t_req_vld;
  wire                [31:0] b5_sii_l2t_req_data;
  wire                       b5_rdma_wren;
  //wire               [1:0] b5_rdma_index;
  //wire               [3:0] b5_rdma_valid;

   reg                 [4:0] b5_state_capture;
   reg                [39:0] b5_siu_pa;
   reg                [31:0] b5_siu_d0;
   reg                [31:0] b5_siu_d1;
   reg                [31:0] b5_siu_d2;
   reg                [31:0] b5_siu_d3;
   reg                [31:0] b5_siu_d4;
   reg                [31:0] b5_siu_d5;
   reg                [31:0] b5_siu_d6;
   reg                [31:0] b5_siu_d7;
   reg                [31:0] b5_siu_d8;
   reg                [31:0] b5_siu_d9;
   reg                [31:0] b5_siu_d10;
   reg                [31:0] b5_siu_d11;
   reg                [31:0] b5_siu_d12;
   reg                [31:0] b5_siu_d13;
   reg                [31:0] b5_siu_d14;
   reg                [31:0] b5_siu_d15;

   // IOWB has 4 entries
   // Each entry has valid bit, pa, 64 Byte data
   reg                       b5_iowb0_valid;  // Indicates Bench has captured entire packet
   reg                       b5_iowb1_valid;
   reg                       b5_iowb2_valid;
   reg                       b5_iowb3_valid;
   reg                [39:0] b5_iowb0_pa;
   reg                [39:0] b5_iowb1_pa;
   reg                [39:0] b5_iowb2_pa;
   reg                [39:0] b5_iowb3_pa;
   reg                [31:0] b5_iowb0 [0:15];
   reg                [31:0] b5_iowb1 [0:15];
   reg                [31:0] b5_iowb2 [0:15];
   reg                [31:0] b5_iowb3 [0:15];

  assign b5_sii_l2t_req_vld     = `CPU.l2t5.sii_l2t_req_vld;
  assign b5_sii_l2t_req_data    = `CPU.l2t5.sii_l2t_req[31:0];

  assign b5_wr64_active_c2   = b5_inst_valid_c2 & b5_wr64_inst_c2;
  assign b5_wr64_active      = b5_wr64_active_c8;

  // Indicates when rdma_index is valid
  assign b5_rdma_wren           = `CPU.l2b5.evict_l2t_l2b_rdma_wren_s3_v1 | 
                                       `CPU.l2b5.evict_l2t_l2b_rdma_wren_s3_v2 | 
                                       `CPU.l2b5.evict_l2t_l2b_rdma_wren_s3_v3 | 
                                       `CPU.l2b5.evict_l2t_l2b_rdma_wren_s3_v4;

  
  // IOWB entry index = 0,1,2,3
  //assign b5_rdma_index          = `CPU.l2b5.evict_l2t_l2b_rdma_wrwl_s3_v1[1:0];
  // Indicates that any future transactions will see this entry's store data.
  // The bit that is asserted corresponds to the index in the IOWB.
  //assign b5_rdma_valid          = `CPU.l2t5.rdmat.rdma_valid[3:0];

//---------------------
initial
  begin
    b5_pop_index = 2'b0;
    b5_push_index = 2'b0;
    b5_state_capture = STATE_C0;   // Idle state
    b5_iowb0_valid = 1'h0;
    b5_iowb1_valid = 1'h0;
    b5_iowb2_valid = 1'h0;
    b5_iowb3_valid = 1'h0;
    b5_iowb0_pa = 40'h0;
    b5_iowb1_pa = 40'h0;
    b5_iowb2_pa = 40'h0;
    b5_iowb3_pa = 40'h0;
    b5_siu_pa = 40'h0;
    b5_siu_d0 = 32'b0;
    b5_siu_d1 = 32'b0;
    b5_siu_d2 = 32'b0;
    b5_siu_d3 = 32'b0;
    b5_siu_d4 = 32'b0;
    b5_siu_d5 = 32'b0;
    b5_siu_d6 = 32'b0;
    b5_siu_d7 = 32'b0;
    b5_siu_d8 = 32'b0;
    b5_siu_d9 = 32'b0;
    b5_siu_d10 = 32'b0;
    b5_siu_d11 = 32'b0;
    b5_siu_d12 = 32'b0;
    b5_siu_d13 = 32'b0;
    b5_siu_d14 = 32'b0;
    b5_siu_d15 = 32'b0;
  end

//==========================================================
//==========================================================

always @ (posedge `BENCH_L2T5_GCLK) begin // {

  //------------------------------
  //  Pipeline signals

  //------------------------------
  //  L2 RTL Bank5  (not needed for L2 Stub)

  b5_cam_hit_c52 <= b5_cam_hit_c5;
  b5_cam_hit_c6  <= b5_cam_hit_c52;
  b5_cam_hit_c7  <= b5_cam_hit_c6;
  b5_cam_hit_c8  <= b5_cam_hit_c7;

  b5_first_pass_c3  <= b5_first_pass_c2;
  b5_first_pass_c4  <= b5_first_pass_c3;
  b5_first_pass_c5  <= b5_first_pass_c4;
  b5_first_pass_c52 <= b5_first_pass_c5;
  b5_first_pass_c6  <= b5_first_pass_c52;
  b5_first_pass_c7  <= b5_first_pass_c6;
  b5_first_pass_c8  <= b5_first_pass_c7;

  b5_wr8_active_c3  <= b5_wr8_active_c2;
  b5_wr8_active_c4  <= b5_wr8_active_c3;
  b5_wr8_active_c5  <= b5_wr8_active_c4;
  b5_wr8_active_c52 <= b5_wr8_active_c5;
  b5_wr8_active_c6  <= b5_wr8_active_c52;
  b5_wr8_active_c7  <= b5_wr8_active_c6;
  b5_wr8_active_c8  <= b5_wr8_active_c7;

  b5_wr64_active_c3  <= b5_wr64_active_c2;
  b5_wr64_active_c4  <= b5_wr64_active_c3;
  b5_wr64_active_c5  <= b5_wr64_active_c4;
  b5_wr64_active_c52 <= b5_wr64_active_c5;
  b5_wr64_active_c6  <= b5_wr64_active_c52;
  b5_wr64_active_c7  <= b5_wr64_active_c6;
  b5_wr64_active_c8  <= b5_wr64_active_c7;

  //----------------------------------------------------------
  //----------------------------------------------------------
  // SIU Store - WR8

  
  //       only do this if the transfers don't match up in c8.

  if (b5_wr8_active && b5_first_pass) begin // {
    // Send msgs to Riesling
    dma_store (b5_siu_wr8_pa,b5_siu_wr8_data,b5_siu_wr8_size,b5_cam_hit,8'd8,"B5 WR8");
  end // }

  //----------------------------------------------------------
  //----------------------------------------------------------
  // SIU Store - WRI

  //------------------------------
  // Send MemorySlam message after SIU transaction is complete
  // Read IOWB data and Send msgs to Riesling

  if (b5_wr64_active && b5_first_pass) begin // {

    // Determine which of the 8 DMA_STOREs will be evicted.
    // WRI is 64 Bytes.
    // Eviction is 16 Bytes at a time.
    // So, there can be 1-4 Evictions for a single WRI.
    b5_ev_vect0 = b5_ev_invvect[31:0];
    b5_ev_vect1 = b5_ev_invvect[55:32];
    b5_ev_vect2 = b5_ev_invvect[87:56];
    b5_ev_vect3 = b5_ev_invvect[111:88];

    b5_inv_vect[0] = get_vect(b5_ev_vect0);
    b5_inv_vect[1] = get_vect31(b5_ev_vect1);  // different function for odd inval vector
    b5_inv_vect[2] = get_vect(b5_ev_vect2);
    b5_inv_vect[3] = get_vect31(b5_ev_vect3);  // different function for odd inval vector

    //Get entry from IOWB and send message
    b5_chk_valid_entry(b5_pop_index);
    b5_read_iowb(b5_pop_index,
                        {|b5_inv_vect[3],|b5_inv_vect[2],|b5_inv_vect[1],|b5_inv_vect[0]});
    b5_pop_index = b5_pop_index + 1;
  end // }

  //------------------------------
  // Capture state machine
  // Capture pa and data (64 Bytes) off SIU to L2 interface.
  // See SIU MAS (about page 49) for WRI packet format.
  // Put packet in IOWB which had 4 entries.
  // This IOWB in the Bench is not exactly the same as the IOWB in RTL.
  // Bench IOWB is a FIFO and RTL IOWB is not a FIFO.

  case (b5_state_capture)

    // Capture pa (part 1)
    STATE_C0: begin  // {
                // WRI pkt if req_data[26:24]==3'b100
                if ((b5_sii_l2t_req_vld)&&(b5_sii_l2t_req_data[26:24]==3'b100)) begin // {
                  b5_siu_pa[39:32] <= b5_sii_l2t_req_data[7:0];
                  b5_state_capture <= STATE_C1;
                end // }
              end // }

    // Capture pa (part 2)
    STATE_C1: begin  // {
                  b5_siu_pa[31:0] <= b5_sii_l2t_req_data[31:0];
                  b5_state_capture <= STATE_C2;
              end // }

    // Capture 4 data bytes
    STATE_C2: begin  // {
                  b5_siu_d0 <= b5_sii_l2t_req_data[31:0];
                  b5_state_capture <= STATE_C3;
              end // }

    // Capture 4 data bytes
    STATE_C3: begin  // {
                  b5_siu_d1 <= b5_sii_l2t_req_data[31:0];
                  b5_state_capture <= STATE_C4;
              end // }

    // Capture 4 data bytes
    STATE_C4: begin  // {
                  b5_siu_d2 <= b5_sii_l2t_req_data[31:0];
                  b5_state_capture <= STATE_C5;
              end // }

    // Capture 4 data bytes
    STATE_C5: begin  // {
                  b5_siu_d3 <= b5_sii_l2t_req_data[31:0];
                  b5_state_capture <= STATE_C6;
              end // }

    // Capture 4 data bytes
    STATE_C6: begin  // {
                  b5_siu_d4 <= b5_sii_l2t_req_data[31:0];
                  b5_state_capture <= STATE_C7;
              end // }

    // Capture 4 data bytes
    STATE_C7: begin  // {
                  b5_siu_d5 <= b5_sii_l2t_req_data[31:0];
                  b5_state_capture <= STATE_C8;
              end // }

    // Capture 4 data bytes
    STATE_C8: begin  // {
                  b5_siu_d6 <= b5_sii_l2t_req_data[31:0];
                  b5_state_capture <= STATE_C9;
              end // }

    // Capture 4 data bytes
    STATE_C9: begin  // {
                  b5_siu_d7 <= b5_sii_l2t_req_data[31:0];
                  b5_state_capture <= STATE_C10;
              end // }

    // Capture 4 data bytes
    STATE_C10: begin  // {
                  b5_siu_d8 <= b5_sii_l2t_req_data[31:0];
                  b5_state_capture <= STATE_C11;
              end // }

    // Capture 4 data bytes
    STATE_C11: begin  // {
                  b5_siu_d9 <= b5_sii_l2t_req_data[31:0];
                  b5_state_capture <= STATE_C12;
              end // }

    // Capture 4 data bytes
    STATE_C12: begin  // {
                  b5_siu_d10 <= b5_sii_l2t_req_data[31:0];
                  b5_state_capture <= STATE_C13;
              end // }

    // Capture 4 data bytes
    STATE_C13: begin  // {
                  b5_siu_d11 <= b5_sii_l2t_req_data[31:0];
                  b5_state_capture <= STATE_C14;
              end // }

    // Capture 4 data bytes
    STATE_C14: begin  // {
                  b5_siu_d12 <= b5_sii_l2t_req_data[31:0];
                  b5_state_capture <= STATE_C15;
              end // }

    // Capture 4 data bytes
    STATE_C15: begin  // {
                  b5_siu_d13 <= b5_sii_l2t_req_data[31:0];
                  b5_state_capture <= STATE_C16;
              end // }

    // Capture 4 data bytes
    STATE_C16: begin  // {
                  b5_siu_d14 <= b5_sii_l2t_req_data[31:0];
                  b5_state_capture <= STATE_C17;
              end // }

    // Capture 4 data bytes
    STATE_C17: begin  // {
                  b5_siu_d15 <= b5_sii_l2t_req_data[31:0];
                  b5_state_capture <= STATE_C18;
              end // }

    // Save WRI packet (pa and data)x to IOWB
    STATE_C18: begin  // {
                  // Extra check to make sure that RTL is writing to its IOWB, too.
                  if (!b5_rdma_wren) begin // {
                    `PR_ERROR("pli_ldst",`ERROR,"Bench ERROR - Capture State Machine - b5_rdma_wren is not asserted when it is expected to be asserted.");
                  end // }
                  else begin // {
                    b5_write_iowb (b5_push_index);
                    b5_push_index = b5_push_index + 1;
                  end // }
                  b5_state_capture <= STATE_C0;
              end // }

    default:  begin  // {
                `PR_ERROR("pli_ldst",`ERROR,"Bench ERROR - ldst_dma Capture State Machine 5 should not hit default state");
              end // }

  endcase

end // always}

//----------------------------------------------------------
// Task to save data captured on SIU -> L2 interface into IOWB
task b5_write_iowb;

input [1:0] index;

  begin
    `PR_INFO("ldst_dma",`INFO,"Push to B5 IOWB. index=%d pa=%h D0=%h",
                              index,b5_siu_pa,b5_siu_d0);
    case (index)
      2'h0: begin
              if (b5_iowb0_valid) begin
                `PR_ERROR("pli_ldst",`ERROR,"Bench ERROR - b5_iowb0 Overflow.");
              end
              else begin
                b5_iowb0_valid <= 1'b1;
              end

              b5_iowb0_pa  <= b5_siu_pa;
              b5_iowb0[0]  <= b5_siu_d0;
              b5_iowb0[1]  <= b5_siu_d1;
              b5_iowb0[2]  <= b5_siu_d2;
              b5_iowb0[3]  <= b5_siu_d3;
              b5_iowb0[4]  <= b5_siu_d4;
              b5_iowb0[5]  <= b5_siu_d5;
              b5_iowb0[6]  <= b5_siu_d6;
              b5_iowb0[7]  <= b5_siu_d7;
              b5_iowb0[8]  <= b5_siu_d8;
              b5_iowb0[9]  <= b5_siu_d9;
              b5_iowb0[10] <= b5_siu_d10;
              b5_iowb0[11] <= b5_siu_d11;
              b5_iowb0[12] <= b5_siu_d12;
              b5_iowb0[13] <= b5_siu_d13;
              b5_iowb0[14] <= b5_siu_d14;
              b5_iowb0[15] <= b5_siu_d15;
            end
      2'h1: begin
              if (b5_iowb1_valid) begin
                `PR_ERROR("pli_ldst",`ERROR,"Bench ERROR - b5_iowb1 Overflow.");
              end
              else begin
                b5_iowb1_valid <= 1'b1;
              end

              b5_iowb1_pa  <= b5_siu_pa;
              b5_iowb1[0]  <= b5_siu_d0;
              b5_iowb1[1]  <= b5_siu_d1;
              b5_iowb1[2]  <= b5_siu_d2;
              b5_iowb1[3]  <= b5_siu_d3;
              b5_iowb1[4]  <= b5_siu_d4;
              b5_iowb1[5]  <= b5_siu_d5;
              b5_iowb1[6]  <= b5_siu_d6;
              b5_iowb1[7]  <= b5_siu_d7;
              b5_iowb1[8]  <= b5_siu_d8;
              b5_iowb1[9]  <= b5_siu_d9;
              b5_iowb1[10] <= b5_siu_d10;
              b5_iowb1[11] <= b5_siu_d11;
              b5_iowb1[12] <= b5_siu_d12;
              b5_iowb1[13] <= b5_siu_d13;
              b5_iowb1[14] <= b5_siu_d14;
              b5_iowb1[15] <= b5_siu_d15;
            end
      2'h2: begin
              if (b5_iowb2_valid) begin
                `PR_ERROR("pli_ldst",`ERROR,"Bench ERROR - b5_iowb2 Overflow.");
              end
              else begin
                b5_iowb2_valid <= 1'b1;
              end

              b5_iowb2_pa  <= b5_siu_pa;
              b5_iowb2[0]  <= b5_siu_d0;
              b5_iowb2[1]  <= b5_siu_d1;
              b5_iowb2[2]  <= b5_siu_d2;
              b5_iowb2[3]  <= b5_siu_d3;
              b5_iowb2[4]  <= b5_siu_d4;
              b5_iowb2[5]  <= b5_siu_d5;
              b5_iowb2[6]  <= b5_siu_d6;
              b5_iowb2[7]  <= b5_siu_d7;
              b5_iowb2[8]  <= b5_siu_d8;
              b5_iowb2[9]  <= b5_siu_d9;
              b5_iowb2[10] <= b5_siu_d10;
              b5_iowb2[11] <= b5_siu_d11;
              b5_iowb2[12] <= b5_siu_d12;
              b5_iowb2[13] <= b5_siu_d13;
              b5_iowb2[14] <= b5_siu_d14;
              b5_iowb2[15] <= b5_siu_d15;
            end
      2'h3: begin
              if (b5_iowb3_valid) begin
                `PR_ERROR("pli_ldst",`ERROR,"Bench ERROR - b5_iowb3 Overflow.");
              end
              else begin
                b5_iowb3_valid <= 1'b1;
              end

              b5_iowb3_pa  <= b5_siu_pa;
              b5_iowb3[0]  <= b5_siu_d0;
              b5_iowb3[1]  <= b5_siu_d1;
              b5_iowb3[2]  <= b5_siu_d2;
              b5_iowb3[3]  <= b5_siu_d3;
              b5_iowb3[4]  <= b5_siu_d4;
              b5_iowb3[5]  <= b5_siu_d5;
              b5_iowb3[6]  <= b5_siu_d6;
              b5_iowb3[7]  <= b5_siu_d7;
              b5_iowb3[8]  <= b5_siu_d8;
              b5_iowb3[9]  <= b5_siu_d9;
              b5_iowb3[10] <= b5_siu_d10;
              b5_iowb3[11] <= b5_siu_d11;
              b5_iowb3[12] <= b5_siu_d12;
              b5_iowb3[13] <= b5_siu_d13;
              b5_iowb3[14] <= b5_siu_d14;
              b5_iowb3[15] <= b5_siu_d15;
            end
      default: begin
                `PR_ERROR("pli_ldst",`ERROR,"Bench ERROR - task write_iowb should not hit default state");
               end
    endcase    

  end
endtask

//----------------------------------------------------------
// Task to read data from IOWB and send to Riesling
task b5_read_iowb;

input [1:0] index;
input [3:0] tmp_evict;

  begin
    case (index)
      2'h0: 
          begin
            if (!b5_iowb0_valid) begin
              `PR_ERROR("pli_ldst",`ERROR,"Bench ERROR - b5_iowb0 Underflow.");
            end
            else begin
              b5_iowb0_valid <= 1'b0;
            end

           `PR_INFO("ldst_dma",`INFO,"Pop from B5 IOWB. index=%d pa=%h D0=%h",
                              index,b5_iowb0_pa,b5_iowb0[0]);

            // Call task to send NAS message
            // Send 8 Bytes at a time
            dma_store (b5_iowb0_pa,   {b5_iowb0[0], b5_iowb0[1]}, 8'hff,tmp_evict[0],8'd64,"B5 WRI 1");
            dma_store (b5_iowb0_pa+8, {b5_iowb0[2], b5_iowb0[3]}, 8'hff,tmp_evict[0],8'd64,"B5 WRI 2");
            dma_store (b5_iowb0_pa+16,{b5_iowb0[4], b5_iowb0[5]}, 8'hff,tmp_evict[1],8'd64,"B5 WRI 3");
            dma_store (b5_iowb0_pa+24,{b5_iowb0[6], b5_iowb0[7]}, 8'hff,tmp_evict[1],8'd64,"B5 WRI 4");
            dma_store (b5_iowb0_pa+32,{b5_iowb0[8], b5_iowb0[9]}, 8'hff,tmp_evict[2],8'd64,"B5 WRI 5");
            dma_store (b5_iowb0_pa+40,{b5_iowb0[10],b5_iowb0[11]},8'hff,tmp_evict[2],8'd64,"B5 WRI 6");
            dma_store (b5_iowb0_pa+48,{b5_iowb0[12],b5_iowb0[13]},8'hff,tmp_evict[3],8'd64,"B5 WRI 7");
            dma_store (b5_iowb0_pa+56,{b5_iowb0[14],b5_iowb0[15]},8'hff,tmp_evict[3],8'd64,"B5 WRI 8");
          end
      2'h1: 
          begin
            if (!b5_iowb1_valid) begin
              `PR_ERROR("pli_ldst",`ERROR,"Bench ERROR - b5_iowb1 Underflow.");
            end
            else begin
              b5_iowb1_valid <= 1'b0;
            end

           `PR_INFO("ldst_dma",`INFO,"Pop from B5 IOWB. index=%d pa=%h D0=%h",
                              index,b5_iowb1_pa,b5_iowb1[0]);

            // Call task to send NAS message
            // Send 8 Bytes at a time
            dma_store (b5_iowb1_pa,   {b5_iowb1[0], b5_iowb1[1]}, 8'hff,tmp_evict[0],8'd64,"B5 WRI 1");
            dma_store (b5_iowb1_pa+8, {b5_iowb1[2], b5_iowb1[3]}, 8'hff,tmp_evict[0],8'd64,"B5 WRI 2");
            dma_store (b5_iowb1_pa+16,{b5_iowb1[4], b5_iowb1[5]}, 8'hff,tmp_evict[1],8'd64,"B5 WRI 3");
            dma_store (b5_iowb1_pa+24,{b5_iowb1[6], b5_iowb1[7]}, 8'hff,tmp_evict[1],8'd64,"B5 WRI 4");
            dma_store (b5_iowb1_pa+32,{b5_iowb1[8], b5_iowb1[9]}, 8'hff,tmp_evict[2],8'd64,"B5 WRI 5");
            dma_store (b5_iowb1_pa+40,{b5_iowb1[10],b5_iowb1[11]},8'hff,tmp_evict[2],8'd64,"B5 WRI 6");
            dma_store (b5_iowb1_pa+48,{b5_iowb1[12],b5_iowb1[13]},8'hff,tmp_evict[3],8'd64,"B5 WRI 7");
            dma_store (b5_iowb1_pa+56,{b5_iowb1[14],b5_iowb1[15]},8'hff,tmp_evict[3],8'd64,"B5 WRI 8");
          end
      2'h2: 
          begin
            if (!b5_iowb2_valid) begin
              `PR_ERROR("pli_ldst",`ERROR,"Bench ERROR - b5_iowb2 Underflow.");
            end
            else begin
              b5_iowb2_valid <= 1'b0;
            end

           `PR_INFO("ldst_dma",`INFO,"Pop from B5 IOWB. index=%d pa=%h D0=%h",
                              index,b5_iowb2_pa,b5_iowb2[0]);

            // Call task to send NAS message
            // Send 8 Bytes at a time
            dma_store (b5_iowb2_pa,   {b5_iowb2[0], b5_iowb2[1]}, 8'hff,tmp_evict[0],8'd64,"B5 WRI 1");
            dma_store (b5_iowb2_pa+8, {b5_iowb2[2], b5_iowb2[3]}, 8'hff,tmp_evict[0],8'd64,"B5 WRI 2");
            dma_store (b5_iowb2_pa+16,{b5_iowb2[4], b5_iowb2[5]}, 8'hff,tmp_evict[1],8'd64,"B5 WRI 3");
            dma_store (b5_iowb2_pa+24,{b5_iowb2[6], b5_iowb2[7]}, 8'hff,tmp_evict[1],8'd64,"B5 WRI 4");
            dma_store (b5_iowb2_pa+32,{b5_iowb2[8], b5_iowb2[9]}, 8'hff,tmp_evict[2],8'd64,"B5 WRI 5");
            dma_store (b5_iowb2_pa+40,{b5_iowb2[10],b5_iowb2[11]},8'hff,tmp_evict[2],8'd64,"B5 WRI 6");
            dma_store (b5_iowb2_pa+48,{b5_iowb2[12],b5_iowb2[13]},8'hff,tmp_evict[3],8'd64,"B5 WRI 7");
            dma_store (b5_iowb2_pa+56,{b5_iowb2[14],b5_iowb2[15]},8'hff,tmp_evict[3],8'd64,"B5 WRI 8");
          end
      2'h3: 
          begin
            if (!b5_iowb3_valid) begin
              `PR_ERROR("pli_ldst",`ERROR,"Bench ERROR - b5_iowb3 Underflow.");
            end
            else begin
              b5_iowb3_valid <= 1'b0;
            end

           `PR_INFO("ldst_dma",`INFO,"Pop from B5 IOWB. index=%d pa=%h D0=%h",
                              index,b5_iowb3_pa,b5_iowb3[0]);

            // Call task to send NAS message
            // Send 8 Bytes at a time
            dma_store (b5_iowb3_pa,   {b5_iowb3[0], b5_iowb3[1]}, 8'hff,tmp_evict[0],8'd64,"B5 WRI 1");
            dma_store (b5_iowb3_pa+8, {b5_iowb3[2], b5_iowb3[3]}, 8'hff,tmp_evict[0],8'd64,"B5 WRI 2");
            dma_store (b5_iowb3_pa+16,{b5_iowb3[4], b5_iowb3[5]}, 8'hff,tmp_evict[1],8'd64,"B5 WRI 3");
            dma_store (b5_iowb3_pa+24,{b5_iowb3[6], b5_iowb3[7]}, 8'hff,tmp_evict[1],8'd64,"B5 WRI 4");
            dma_store (b5_iowb3_pa+32,{b5_iowb3[8], b5_iowb3[9]}, 8'hff,tmp_evict[2],8'd64,"B5 WRI 5");
            dma_store (b5_iowb3_pa+40,{b5_iowb3[10],b5_iowb3[11]},8'hff,tmp_evict[2],8'd64,"B5 WRI 6");
            dma_store (b5_iowb3_pa+48,{b5_iowb3[12],b5_iowb3[13]},8'hff,tmp_evict[3],8'd64,"B5 WRI 7");
            dma_store (b5_iowb3_pa+56,{b5_iowb3[14],b5_iowb3[15]},8'hff,tmp_evict[3],8'd64,"B5 WRI 8");
          end
      default: 
          begin
            `PR_ERROR("pli_ldst",`ERROR,"Bench ERROR - task read_iowb should not hit default state");
          end
    endcase    

  end
endtask

//----------------------------------------------------------
// Task to make sure the entry at the location pointed to by index is valid before we try to pop it.
task b5_chk_valid_entry;

input [1:0] index;

  begin
    case (index)
      2'h0: 
          begin
            if (b5_iowb0_valid != 1'b1) begin
              `PR_ERROR("pli_ldst",`ERROR,"Bench ERROR - the entry in IOWB at index=0 is not valid (b5_iowb0_valid!=1'b1)");
            end
          end
      2'h1: 
          begin
            if (b5_iowb1_valid != 1'b1) begin
              `PR_ERROR("pli_ldst",`ERROR,"Bench ERROR - the entry in IOWB at index=1 is not valid (b5_iowb1_valid!=1'b1)");
            end
          end
      2'h2: 
          begin
            if (b5_iowb2_valid != 1'b1) begin
              `PR_ERROR("pli_ldst",`ERROR,"Bench ERROR - the entry in IOWB at index=2 is not valid (b5_iowb2_valid!=1'b1)");
            end
          end
      2'h3: 
          begin
            if (b5_iowb3_valid != 1'b1) begin
              `PR_ERROR("pli_ldst",`ERROR,"Bench ERROR - the entry in IOWB at index=3 is not valid (b5_iowb3_valid!=1'b1)");
            end
          end
      default: 
          begin
            `PR_ERROR("pli_ldst",`ERROR,"Bench ERROR - task chk_valid_entry should not hit default state");
          end
    endcase
  end
endtask

  `endif // `ifdef NOL2RTL
`endif   // `ifdef NO_L2_BNK5

`ifdef NO_L2_BNK6
`else
  `ifdef NOL2RTL
  `else

//==========================================================
//==========================================================
// L2 RTL Probes

  //----------------------------------------------------------
  // Signals for L2 RTL Bank6

  //---------------------
  // SIU store

  wire                       b6_cam_hit_c5;
  reg                        b6_cam_hit_c52;
  reg                        b6_cam_hit_c6;
  reg                        b6_cam_hit_c7;
  reg                        b6_cam_hit_c8;
  wire                       b6_cam_hit;
  wire                       b6_inst_valid_c2;
  wire                       b6_wr8_inst_c2;
  wire                       b6_wr64_inst_c2;

  // If the cam hits, then there will be an eviction sent to the core(s)
  assign b6_cam_hit_c5       = |`CPU.l2t6.dc_cam_hit;
  assign b6_cam_hit          = b6_cam_hit_c8;
  assign b6_inst_valid_c2    = `CPU.l2t6.arb.arb_inst_vld_c2;
  assign b6_wr8_inst_c2      = `CPU.l2t6.arb.arb_decdp_wr8_inst_c2;
  assign b6_wr64_inst_c2     = `CPU.l2t6.arb.arb_decdp_wr64_inst_c2;

  //---------------------
  // WR8 signals
  wire                       b6_first_pass_c2;
  reg                        b6_first_pass_c3;
  reg                        b6_first_pass_c4;
  reg                        b6_first_pass_c5;
  reg                        b6_first_pass_c52;
  reg                        b6_first_pass_c6;
  reg                        b6_first_pass_c7;
  reg                        b6_first_pass_c8;
  wire                       b6_first_pass;
  wire                       b6_wr8_active_c2;
  reg                        b6_wr8_active_c3;
  reg                        b6_wr8_active_c4;
  reg                        b6_wr8_active_c5;
  reg                        b6_wr8_active_c52;
  reg                        b6_wr8_active_c6;
  reg                        b6_wr8_active_c7;
  reg                        b6_wr8_active_c8;
  wire                       b6_wr8_active;

  wire                [39:0] b6_siu_wr8_pa;
  wire                [63:0] b6_siu_wr8_data;
  wire                 [7:0] b6_siu_wr8_size;

  assign b6_wr8_active_c2       = `CPU.l2t6.arb_decdp_wr8_inst_c2;
  assign b6_wr8_active          = b6_wr8_active_c8;
  assign b6_first_pass_c2       = `CPU.l2t6.arbdec.arbdp_inst_c2[39]==0;
  assign b6_first_pass          = b6_first_pass_c8;
  assign b6_siu_wr8_pa          = `CPU.l2t6.arbadr.arbdp_addr_c8;
  assign b6_siu_wr8_data        = `CPU.l2t6.arbdat.arbdp_inst_data_c8;
  assign b6_siu_wr8_size        = `CPU.l2t6.arbdec.arbdec_arbdp_inst_size_c8;

  //---------------------
  // WRI signals
  reg                  [1:0] b6_pop_index;   // Index pointing to next entry to be read from IOWB
  reg                  [1:0] b6_push_index;  // Index pointing to next entry to be written from IOWB

  wire                       b6_wr64_active_c2;
  reg                        b6_wr64_active_c3;
  reg                        b6_wr64_active_c4;
  reg                        b6_wr64_active_c5;
  reg                        b6_wr64_active_c52;
  reg                        b6_wr64_active_c6;
  reg                        b6_wr64_active_c7;
  reg                        b6_wr64_active_c8;
  wire                       b6_wr64_active;

  wire                       b6_sii_l2t_req_vld;
  wire                [31:0] b6_sii_l2t_req_data;
  wire                       b6_rdma_wren;
  //wire               [1:0] b6_rdma_index;
  //wire               [3:0] b6_rdma_valid;

   reg                 [4:0] b6_state_capture;
   reg                [39:0] b6_siu_pa;
   reg                [31:0] b6_siu_d0;
   reg                [31:0] b6_siu_d1;
   reg                [31:0] b6_siu_d2;
   reg                [31:0] b6_siu_d3;
   reg                [31:0] b6_siu_d4;
   reg                [31:0] b6_siu_d5;
   reg                [31:0] b6_siu_d6;
   reg                [31:0] b6_siu_d7;
   reg                [31:0] b6_siu_d8;
   reg                [31:0] b6_siu_d9;
   reg                [31:0] b6_siu_d10;
   reg                [31:0] b6_siu_d11;
   reg                [31:0] b6_siu_d12;
   reg                [31:0] b6_siu_d13;
   reg                [31:0] b6_siu_d14;
   reg                [31:0] b6_siu_d15;

   // IOWB has 4 entries
   // Each entry has valid bit, pa, 64 Byte data
   reg                       b6_iowb0_valid;  // Indicates Bench has captured entire packet
   reg                       b6_iowb1_valid;
   reg                       b6_iowb2_valid;
   reg                       b6_iowb3_valid;
   reg                [39:0] b6_iowb0_pa;
   reg                [39:0] b6_iowb1_pa;
   reg                [39:0] b6_iowb2_pa;
   reg                [39:0] b6_iowb3_pa;
   reg                [31:0] b6_iowb0 [0:15];
   reg                [31:0] b6_iowb1 [0:15];
   reg                [31:0] b6_iowb2 [0:15];
   reg                [31:0] b6_iowb3 [0:15];

  assign b6_sii_l2t_req_vld     = `CPU.l2t6.sii_l2t_req_vld;
  assign b6_sii_l2t_req_data    = `CPU.l2t6.sii_l2t_req[31:0];

  assign b6_wr64_active_c2   = b6_inst_valid_c2 & b6_wr64_inst_c2;
  assign b6_wr64_active      = b6_wr64_active_c8;

  // Indicates when rdma_index is valid
  assign b6_rdma_wren           = `CPU.l2b6.evict_l2t_l2b_rdma_wren_s3_v1 | 
                                       `CPU.l2b6.evict_l2t_l2b_rdma_wren_s3_v2 | 
                                       `CPU.l2b6.evict_l2t_l2b_rdma_wren_s3_v3 | 
                                       `CPU.l2b6.evict_l2t_l2b_rdma_wren_s3_v4;

  
  // IOWB entry index = 0,1,2,3
  //assign b6_rdma_index          = `CPU.l2b6.evict_l2t_l2b_rdma_wrwl_s3_v1[1:0];
  // Indicates that any future transactions will see this entry's store data.
  // The bit that is asserted corresponds to the index in the IOWB.
  //assign b6_rdma_valid          = `CPU.l2t6.rdmat.rdma_valid[3:0];

//---------------------
initial
  begin
    b6_pop_index = 2'b0;
    b6_push_index = 2'b0;
    b6_state_capture = STATE_C0;   // Idle state
    b6_iowb0_valid = 1'h0;
    b6_iowb1_valid = 1'h0;
    b6_iowb2_valid = 1'h0;
    b6_iowb3_valid = 1'h0;
    b6_iowb0_pa = 40'h0;
    b6_iowb1_pa = 40'h0;
    b6_iowb2_pa = 40'h0;
    b6_iowb3_pa = 40'h0;
    b6_siu_pa = 40'h0;
    b6_siu_d0 = 32'b0;
    b6_siu_d1 = 32'b0;
    b6_siu_d2 = 32'b0;
    b6_siu_d3 = 32'b0;
    b6_siu_d4 = 32'b0;
    b6_siu_d5 = 32'b0;
    b6_siu_d6 = 32'b0;
    b6_siu_d7 = 32'b0;
    b6_siu_d8 = 32'b0;
    b6_siu_d9 = 32'b0;
    b6_siu_d10 = 32'b0;
    b6_siu_d11 = 32'b0;
    b6_siu_d12 = 32'b0;
    b6_siu_d13 = 32'b0;
    b6_siu_d14 = 32'b0;
    b6_siu_d15 = 32'b0;
  end

//==========================================================
//==========================================================

always @ (posedge `BENCH_L2T6_GCLK) begin // {

  //------------------------------
  //  Pipeline signals

  //------------------------------
  //  L2 RTL Bank6  (not needed for L2 Stub)

  b6_cam_hit_c52 <= b6_cam_hit_c5;
  b6_cam_hit_c6  <= b6_cam_hit_c52;
  b6_cam_hit_c7  <= b6_cam_hit_c6;
  b6_cam_hit_c8  <= b6_cam_hit_c7;

  b6_first_pass_c3  <= b6_first_pass_c2;
  b6_first_pass_c4  <= b6_first_pass_c3;
  b6_first_pass_c5  <= b6_first_pass_c4;
  b6_first_pass_c52 <= b6_first_pass_c5;
  b6_first_pass_c6  <= b6_first_pass_c52;
  b6_first_pass_c7  <= b6_first_pass_c6;
  b6_first_pass_c8  <= b6_first_pass_c7;

  b6_wr8_active_c3  <= b6_wr8_active_c2;
  b6_wr8_active_c4  <= b6_wr8_active_c3;
  b6_wr8_active_c5  <= b6_wr8_active_c4;
  b6_wr8_active_c52 <= b6_wr8_active_c5;
  b6_wr8_active_c6  <= b6_wr8_active_c52;
  b6_wr8_active_c7  <= b6_wr8_active_c6;
  b6_wr8_active_c8  <= b6_wr8_active_c7;

  b6_wr64_active_c3  <= b6_wr64_active_c2;
  b6_wr64_active_c4  <= b6_wr64_active_c3;
  b6_wr64_active_c5  <= b6_wr64_active_c4;
  b6_wr64_active_c52 <= b6_wr64_active_c5;
  b6_wr64_active_c6  <= b6_wr64_active_c52;
  b6_wr64_active_c7  <= b6_wr64_active_c6;
  b6_wr64_active_c8  <= b6_wr64_active_c7;

  //----------------------------------------------------------
  //----------------------------------------------------------
  // SIU Store - WR8

  
  //       only do this if the transfers don't match up in c8.

  if (b6_wr8_active && b6_first_pass) begin // {
    // Send msgs to Riesling
    dma_store (b6_siu_wr8_pa,b6_siu_wr8_data,b6_siu_wr8_size,b6_cam_hit,8'd8,"B6 WR8");
  end // }

  //----------------------------------------------------------
  //----------------------------------------------------------
  // SIU Store - WRI

  //------------------------------
  // Send MemorySlam message after SIU transaction is complete
  // Read IOWB data and Send msgs to Riesling

  if (b6_wr64_active && b6_first_pass) begin // {

    // Determine which of the 8 DMA_STOREs will be evicted.
    // WRI is 64 Bytes.
    // Eviction is 16 Bytes at a time.
    // So, there can be 1-4 Evictions for a single WRI.
    b6_ev_vect0 = b6_ev_invvect[31:0];
    b6_ev_vect1 = b6_ev_invvect[55:32];
    b6_ev_vect2 = b6_ev_invvect[87:56];
    b6_ev_vect3 = b6_ev_invvect[111:88];

    b6_inv_vect[0] = get_vect(b6_ev_vect0);
    b6_inv_vect[1] = get_vect31(b6_ev_vect1);  // different function for odd inval vector
    b6_inv_vect[2] = get_vect(b6_ev_vect2);
    b6_inv_vect[3] = get_vect31(b6_ev_vect3);  // different function for odd inval vector

    //Get entry from IOWB and send message
    b6_chk_valid_entry(b6_pop_index);
    b6_read_iowb(b6_pop_index,
                        {|b6_inv_vect[3],|b6_inv_vect[2],|b6_inv_vect[1],|b6_inv_vect[0]});
    b6_pop_index = b6_pop_index + 1;
  end // }

  //------------------------------
  // Capture state machine
  // Capture pa and data (64 Bytes) off SIU to L2 interface.
  // See SIU MAS (about page 49) for WRI packet format.
  // Put packet in IOWB which had 4 entries.
  // This IOWB in the Bench is not exactly the same as the IOWB in RTL.
  // Bench IOWB is a FIFO and RTL IOWB is not a FIFO.

  case (b6_state_capture)

    // Capture pa (part 1)
    STATE_C0: begin  // {
                // WRI pkt if req_data[26:24]==3'b100
                if ((b6_sii_l2t_req_vld)&&(b6_sii_l2t_req_data[26:24]==3'b100)) begin // {
                  b6_siu_pa[39:32] <= b6_sii_l2t_req_data[7:0];
                  b6_state_capture <= STATE_C1;
                end // }
              end // }

    // Capture pa (part 2)
    STATE_C1: begin  // {
                  b6_siu_pa[31:0] <= b6_sii_l2t_req_data[31:0];
                  b6_state_capture <= STATE_C2;
              end // }

    // Capture 4 data bytes
    STATE_C2: begin  // {
                  b6_siu_d0 <= b6_sii_l2t_req_data[31:0];
                  b6_state_capture <= STATE_C3;
              end // }

    // Capture 4 data bytes
    STATE_C3: begin  // {
                  b6_siu_d1 <= b6_sii_l2t_req_data[31:0];
                  b6_state_capture <= STATE_C4;
              end // }

    // Capture 4 data bytes
    STATE_C4: begin  // {
                  b6_siu_d2 <= b6_sii_l2t_req_data[31:0];
                  b6_state_capture <= STATE_C5;
              end // }

    // Capture 4 data bytes
    STATE_C5: begin  // {
                  b6_siu_d3 <= b6_sii_l2t_req_data[31:0];
                  b6_state_capture <= STATE_C6;
              end // }

    // Capture 4 data bytes
    STATE_C6: begin  // {
                  b6_siu_d4 <= b6_sii_l2t_req_data[31:0];
                  b6_state_capture <= STATE_C7;
              end // }

    // Capture 4 data bytes
    STATE_C7: begin  // {
                  b6_siu_d5 <= b6_sii_l2t_req_data[31:0];
                  b6_state_capture <= STATE_C8;
              end // }

    // Capture 4 data bytes
    STATE_C8: begin  // {
                  b6_siu_d6 <= b6_sii_l2t_req_data[31:0];
                  b6_state_capture <= STATE_C9;
              end // }

    // Capture 4 data bytes
    STATE_C9: begin  // {
                  b6_siu_d7 <= b6_sii_l2t_req_data[31:0];
                  b6_state_capture <= STATE_C10;
              end // }

    // Capture 4 data bytes
    STATE_C10: begin  // {
                  b6_siu_d8 <= b6_sii_l2t_req_data[31:0];
                  b6_state_capture <= STATE_C11;
              end // }

    // Capture 4 data bytes
    STATE_C11: begin  // {
                  b6_siu_d9 <= b6_sii_l2t_req_data[31:0];
                  b6_state_capture <= STATE_C12;
              end // }

    // Capture 4 data bytes
    STATE_C12: begin  // {
                  b6_siu_d10 <= b6_sii_l2t_req_data[31:0];
                  b6_state_capture <= STATE_C13;
              end // }

    // Capture 4 data bytes
    STATE_C13: begin  // {
                  b6_siu_d11 <= b6_sii_l2t_req_data[31:0];
                  b6_state_capture <= STATE_C14;
              end // }

    // Capture 4 data bytes
    STATE_C14: begin  // {
                  b6_siu_d12 <= b6_sii_l2t_req_data[31:0];
                  b6_state_capture <= STATE_C15;
              end // }

    // Capture 4 data bytes
    STATE_C15: begin  // {
                  b6_siu_d13 <= b6_sii_l2t_req_data[31:0];
                  b6_state_capture <= STATE_C16;
              end // }

    // Capture 4 data bytes
    STATE_C16: begin  // {
                  b6_siu_d14 <= b6_sii_l2t_req_data[31:0];
                  b6_state_capture <= STATE_C17;
              end // }

    // Capture 4 data bytes
    STATE_C17: begin  // {
                  b6_siu_d15 <= b6_sii_l2t_req_data[31:0];
                  b6_state_capture <= STATE_C18;
              end // }

    // Save WRI packet (pa and data)x to IOWB
    STATE_C18: begin  // {
                  // Extra check to make sure that RTL is writing to its IOWB, too.
                  if (!b6_rdma_wren) begin // {
                    `PR_ERROR("pli_ldst",`ERROR,"Bench ERROR - Capture State Machine - b6_rdma_wren is not asserted when it is expected to be asserted.");
                  end // }
                  else begin // {
                    b6_write_iowb (b6_push_index);
                    b6_push_index = b6_push_index + 1;
                  end // }
                  b6_state_capture <= STATE_C0;
              end // }

    default:  begin  // {
                `PR_ERROR("pli_ldst",`ERROR,"Bench ERROR - ldst_dma Capture State Machine 6 should not hit default state");
              end // }

  endcase

end // always}

//----------------------------------------------------------
// Task to save data captured on SIU -> L2 interface into IOWB
task b6_write_iowb;

input [1:0] index;

  begin
    `PR_INFO("ldst_dma",`INFO,"Push to B6 IOWB. index=%d pa=%h D0=%h",
                              index,b6_siu_pa,b6_siu_d0);
    case (index)
      2'h0: begin
              if (b6_iowb0_valid) begin
                `PR_ERROR("pli_ldst",`ERROR,"Bench ERROR - b6_iowb0 Overflow.");
              end
              else begin
                b6_iowb0_valid <= 1'b1;
              end

              b6_iowb0_pa  <= b6_siu_pa;
              b6_iowb0[0]  <= b6_siu_d0;
              b6_iowb0[1]  <= b6_siu_d1;
              b6_iowb0[2]  <= b6_siu_d2;
              b6_iowb0[3]  <= b6_siu_d3;
              b6_iowb0[4]  <= b6_siu_d4;
              b6_iowb0[5]  <= b6_siu_d5;
              b6_iowb0[6]  <= b6_siu_d6;
              b6_iowb0[7]  <= b6_siu_d7;
              b6_iowb0[8]  <= b6_siu_d8;
              b6_iowb0[9]  <= b6_siu_d9;
              b6_iowb0[10] <= b6_siu_d10;
              b6_iowb0[11] <= b6_siu_d11;
              b6_iowb0[12] <= b6_siu_d12;
              b6_iowb0[13] <= b6_siu_d13;
              b6_iowb0[14] <= b6_siu_d14;
              b6_iowb0[15] <= b6_siu_d15;
            end
      2'h1: begin
              if (b6_iowb1_valid) begin
                `PR_ERROR("pli_ldst",`ERROR,"Bench ERROR - b6_iowb1 Overflow.");
              end
              else begin
                b6_iowb1_valid <= 1'b1;
              end

              b6_iowb1_pa  <= b6_siu_pa;
              b6_iowb1[0]  <= b6_siu_d0;
              b6_iowb1[1]  <= b6_siu_d1;
              b6_iowb1[2]  <= b6_siu_d2;
              b6_iowb1[3]  <= b6_siu_d3;
              b6_iowb1[4]  <= b6_siu_d4;
              b6_iowb1[5]  <= b6_siu_d5;
              b6_iowb1[6]  <= b6_siu_d6;
              b6_iowb1[7]  <= b6_siu_d7;
              b6_iowb1[8]  <= b6_siu_d8;
              b6_iowb1[9]  <= b6_siu_d9;
              b6_iowb1[10] <= b6_siu_d10;
              b6_iowb1[11] <= b6_siu_d11;
              b6_iowb1[12] <= b6_siu_d12;
              b6_iowb1[13] <= b6_siu_d13;
              b6_iowb1[14] <= b6_siu_d14;
              b6_iowb1[15] <= b6_siu_d15;
            end
      2'h2: begin
              if (b6_iowb2_valid) begin
                `PR_ERROR("pli_ldst",`ERROR,"Bench ERROR - b6_iowb2 Overflow.");
              end
              else begin
                b6_iowb2_valid <= 1'b1;
              end

              b6_iowb2_pa  <= b6_siu_pa;
              b6_iowb2[0]  <= b6_siu_d0;
              b6_iowb2[1]  <= b6_siu_d1;
              b6_iowb2[2]  <= b6_siu_d2;
              b6_iowb2[3]  <= b6_siu_d3;
              b6_iowb2[4]  <= b6_siu_d4;
              b6_iowb2[5]  <= b6_siu_d5;
              b6_iowb2[6]  <= b6_siu_d6;
              b6_iowb2[7]  <= b6_siu_d7;
              b6_iowb2[8]  <= b6_siu_d8;
              b6_iowb2[9]  <= b6_siu_d9;
              b6_iowb2[10] <= b6_siu_d10;
              b6_iowb2[11] <= b6_siu_d11;
              b6_iowb2[12] <= b6_siu_d12;
              b6_iowb2[13] <= b6_siu_d13;
              b6_iowb2[14] <= b6_siu_d14;
              b6_iowb2[15] <= b6_siu_d15;
            end
      2'h3: begin
              if (b6_iowb3_valid) begin
                `PR_ERROR("pli_ldst",`ERROR,"Bench ERROR - b6_iowb3 Overflow.");
              end
              else begin
                b6_iowb3_valid <= 1'b1;
              end

              b6_iowb3_pa  <= b6_siu_pa;
              b6_iowb3[0]  <= b6_siu_d0;
              b6_iowb3[1]  <= b6_siu_d1;
              b6_iowb3[2]  <= b6_siu_d2;
              b6_iowb3[3]  <= b6_siu_d3;
              b6_iowb3[4]  <= b6_siu_d4;
              b6_iowb3[5]  <= b6_siu_d5;
              b6_iowb3[6]  <= b6_siu_d6;
              b6_iowb3[7]  <= b6_siu_d7;
              b6_iowb3[8]  <= b6_siu_d8;
              b6_iowb3[9]  <= b6_siu_d9;
              b6_iowb3[10] <= b6_siu_d10;
              b6_iowb3[11] <= b6_siu_d11;
              b6_iowb3[12] <= b6_siu_d12;
              b6_iowb3[13] <= b6_siu_d13;
              b6_iowb3[14] <= b6_siu_d14;
              b6_iowb3[15] <= b6_siu_d15;
            end
      default: begin
                `PR_ERROR("pli_ldst",`ERROR,"Bench ERROR - task write_iowb should not hit default state");
               end
    endcase    

  end
endtask

//----------------------------------------------------------
// Task to read data from IOWB and send to Riesling
task b6_read_iowb;

input [1:0] index;
input [3:0] tmp_evict;

  begin
    case (index)
      2'h0: 
          begin
            if (!b6_iowb0_valid) begin
              `PR_ERROR("pli_ldst",`ERROR,"Bench ERROR - b6_iowb0 Underflow.");
            end
            else begin
              b6_iowb0_valid <= 1'b0;
            end

           `PR_INFO("ldst_dma",`INFO,"Pop from B6 IOWB. index=%d pa=%h D0=%h",
                              index,b6_iowb0_pa,b6_iowb0[0]);

            // Call task to send NAS message
            // Send 8 Bytes at a time
            dma_store (b6_iowb0_pa,   {b6_iowb0[0], b6_iowb0[1]}, 8'hff,tmp_evict[0],8'd64,"B6 WRI 1");
            dma_store (b6_iowb0_pa+8, {b6_iowb0[2], b6_iowb0[3]}, 8'hff,tmp_evict[0],8'd64,"B6 WRI 2");
            dma_store (b6_iowb0_pa+16,{b6_iowb0[4], b6_iowb0[5]}, 8'hff,tmp_evict[1],8'd64,"B6 WRI 3");
            dma_store (b6_iowb0_pa+24,{b6_iowb0[6], b6_iowb0[7]}, 8'hff,tmp_evict[1],8'd64,"B6 WRI 4");
            dma_store (b6_iowb0_pa+32,{b6_iowb0[8], b6_iowb0[9]}, 8'hff,tmp_evict[2],8'd64,"B6 WRI 5");
            dma_store (b6_iowb0_pa+40,{b6_iowb0[10],b6_iowb0[11]},8'hff,tmp_evict[2],8'd64,"B6 WRI 6");
            dma_store (b6_iowb0_pa+48,{b6_iowb0[12],b6_iowb0[13]},8'hff,tmp_evict[3],8'd64,"B6 WRI 7");
            dma_store (b6_iowb0_pa+56,{b6_iowb0[14],b6_iowb0[15]},8'hff,tmp_evict[3],8'd64,"B6 WRI 8");
          end
      2'h1: 
          begin
            if (!b6_iowb1_valid) begin
              `PR_ERROR("pli_ldst",`ERROR,"Bench ERROR - b6_iowb1 Underflow.");
            end
            else begin
              b6_iowb1_valid <= 1'b0;
            end

           `PR_INFO("ldst_dma",`INFO,"Pop from B6 IOWB. index=%d pa=%h D0=%h",
                              index,b6_iowb1_pa,b6_iowb1[0]);

            // Call task to send NAS message
            // Send 8 Bytes at a time
            dma_store (b6_iowb1_pa,   {b6_iowb1[0], b6_iowb1[1]}, 8'hff,tmp_evict[0],8'd64,"B6 WRI 1");
            dma_store (b6_iowb1_pa+8, {b6_iowb1[2], b6_iowb1[3]}, 8'hff,tmp_evict[0],8'd64,"B6 WRI 2");
            dma_store (b6_iowb1_pa+16,{b6_iowb1[4], b6_iowb1[5]}, 8'hff,tmp_evict[1],8'd64,"B6 WRI 3");
            dma_store (b6_iowb1_pa+24,{b6_iowb1[6], b6_iowb1[7]}, 8'hff,tmp_evict[1],8'd64,"B6 WRI 4");
            dma_store (b6_iowb1_pa+32,{b6_iowb1[8], b6_iowb1[9]}, 8'hff,tmp_evict[2],8'd64,"B6 WRI 5");
            dma_store (b6_iowb1_pa+40,{b6_iowb1[10],b6_iowb1[11]},8'hff,tmp_evict[2],8'd64,"B6 WRI 6");
            dma_store (b6_iowb1_pa+48,{b6_iowb1[12],b6_iowb1[13]},8'hff,tmp_evict[3],8'd64,"B6 WRI 7");
            dma_store (b6_iowb1_pa+56,{b6_iowb1[14],b6_iowb1[15]},8'hff,tmp_evict[3],8'd64,"B6 WRI 8");
          end
      2'h2: 
          begin
            if (!b6_iowb2_valid) begin
              `PR_ERROR("pli_ldst",`ERROR,"Bench ERROR - b6_iowb2 Underflow.");
            end
            else begin
              b6_iowb2_valid <= 1'b0;
            end

           `PR_INFO("ldst_dma",`INFO,"Pop from B6 IOWB. index=%d pa=%h D0=%h",
                              index,b6_iowb2_pa,b6_iowb2[0]);

            // Call task to send NAS message
            // Send 8 Bytes at a time
            dma_store (b6_iowb2_pa,   {b6_iowb2[0], b6_iowb2[1]}, 8'hff,tmp_evict[0],8'd64,"B6 WRI 1");
            dma_store (b6_iowb2_pa+8, {b6_iowb2[2], b6_iowb2[3]}, 8'hff,tmp_evict[0],8'd64,"B6 WRI 2");
            dma_store (b6_iowb2_pa+16,{b6_iowb2[4], b6_iowb2[5]}, 8'hff,tmp_evict[1],8'd64,"B6 WRI 3");
            dma_store (b6_iowb2_pa+24,{b6_iowb2[6], b6_iowb2[7]}, 8'hff,tmp_evict[1],8'd64,"B6 WRI 4");
            dma_store (b6_iowb2_pa+32,{b6_iowb2[8], b6_iowb2[9]}, 8'hff,tmp_evict[2],8'd64,"B6 WRI 5");
            dma_store (b6_iowb2_pa+40,{b6_iowb2[10],b6_iowb2[11]},8'hff,tmp_evict[2],8'd64,"B6 WRI 6");
            dma_store (b6_iowb2_pa+48,{b6_iowb2[12],b6_iowb2[13]},8'hff,tmp_evict[3],8'd64,"B6 WRI 7");
            dma_store (b6_iowb2_pa+56,{b6_iowb2[14],b6_iowb2[15]},8'hff,tmp_evict[3],8'd64,"B6 WRI 8");
          end
      2'h3: 
          begin
            if (!b6_iowb3_valid) begin
              `PR_ERROR("pli_ldst",`ERROR,"Bench ERROR - b6_iowb3 Underflow.");
            end
            else begin
              b6_iowb3_valid <= 1'b0;
            end

           `PR_INFO("ldst_dma",`INFO,"Pop from B6 IOWB. index=%d pa=%h D0=%h",
                              index,b6_iowb3_pa,b6_iowb3[0]);

            // Call task to send NAS message
            // Send 8 Bytes at a time
            dma_store (b6_iowb3_pa,   {b6_iowb3[0], b6_iowb3[1]}, 8'hff,tmp_evict[0],8'd64,"B6 WRI 1");
            dma_store (b6_iowb3_pa+8, {b6_iowb3[2], b6_iowb3[3]}, 8'hff,tmp_evict[0],8'd64,"B6 WRI 2");
            dma_store (b6_iowb3_pa+16,{b6_iowb3[4], b6_iowb3[5]}, 8'hff,tmp_evict[1],8'd64,"B6 WRI 3");
            dma_store (b6_iowb3_pa+24,{b6_iowb3[6], b6_iowb3[7]}, 8'hff,tmp_evict[1],8'd64,"B6 WRI 4");
            dma_store (b6_iowb3_pa+32,{b6_iowb3[8], b6_iowb3[9]}, 8'hff,tmp_evict[2],8'd64,"B6 WRI 5");
            dma_store (b6_iowb3_pa+40,{b6_iowb3[10],b6_iowb3[11]},8'hff,tmp_evict[2],8'd64,"B6 WRI 6");
            dma_store (b6_iowb3_pa+48,{b6_iowb3[12],b6_iowb3[13]},8'hff,tmp_evict[3],8'd64,"B6 WRI 7");
            dma_store (b6_iowb3_pa+56,{b6_iowb3[14],b6_iowb3[15]},8'hff,tmp_evict[3],8'd64,"B6 WRI 8");
          end
      default: 
          begin
            `PR_ERROR("pli_ldst",`ERROR,"Bench ERROR - task read_iowb should not hit default state");
          end
    endcase    

  end
endtask

//----------------------------------------------------------
// Task to make sure the entry at the location pointed to by index is valid before we try to pop it.
task b6_chk_valid_entry;

input [1:0] index;

  begin
    case (index)
      2'h0: 
          begin
            if (b6_iowb0_valid != 1'b1) begin
              `PR_ERROR("pli_ldst",`ERROR,"Bench ERROR - the entry in IOWB at index=0 is not valid (b6_iowb0_valid!=1'b1)");
            end
          end
      2'h1: 
          begin
            if (b6_iowb1_valid != 1'b1) begin
              `PR_ERROR("pli_ldst",`ERROR,"Bench ERROR - the entry in IOWB at index=1 is not valid (b6_iowb1_valid!=1'b1)");
            end
          end
      2'h2: 
          begin
            if (b6_iowb2_valid != 1'b1) begin
              `PR_ERROR("pli_ldst",`ERROR,"Bench ERROR - the entry in IOWB at index=2 is not valid (b6_iowb2_valid!=1'b1)");
            end
          end
      2'h3: 
          begin
            if (b6_iowb3_valid != 1'b1) begin
              `PR_ERROR("pli_ldst",`ERROR,"Bench ERROR - the entry in IOWB at index=3 is not valid (b6_iowb3_valid!=1'b1)");
            end
          end
      default: 
          begin
            `PR_ERROR("pli_ldst",`ERROR,"Bench ERROR - task chk_valid_entry should not hit default state");
          end
    endcase
  end
endtask

  `endif // `ifdef NOL2RTL
`endif   // `ifdef NO_L2_BNK6

`ifdef NO_L2_BNK7
`else
  `ifdef NOL2RTL
  `else

//==========================================================
//==========================================================
// L2 RTL Probes

  //----------------------------------------------------------
  // Signals for L2 RTL Bank7

  //---------------------
  // SIU store

  wire                       b7_cam_hit_c5;
  reg                        b7_cam_hit_c52;
  reg                        b7_cam_hit_c6;
  reg                        b7_cam_hit_c7;
  reg                        b7_cam_hit_c8;
  wire                       b7_cam_hit;
  wire                       b7_inst_valid_c2;
  wire                       b7_wr8_inst_c2;
  wire                       b7_wr64_inst_c2;

  // If the cam hits, then there will be an eviction sent to the core(s)
  assign b7_cam_hit_c5       = |`CPU.l2t7.dc_cam_hit;
  assign b7_cam_hit          = b7_cam_hit_c8;
  assign b7_inst_valid_c2    = `CPU.l2t7.arb.arb_inst_vld_c2;
  assign b7_wr8_inst_c2      = `CPU.l2t7.arb.arb_decdp_wr8_inst_c2;
  assign b7_wr64_inst_c2     = `CPU.l2t7.arb.arb_decdp_wr64_inst_c2;

  //---------------------
  // WR8 signals
  wire                       b7_first_pass_c2;
  reg                        b7_first_pass_c3;
  reg                        b7_first_pass_c4;
  reg                        b7_first_pass_c5;
  reg                        b7_first_pass_c52;
  reg                        b7_first_pass_c6;
  reg                        b7_first_pass_c7;
  reg                        b7_first_pass_c8;
  wire                       b7_first_pass;
  wire                       b7_wr8_active_c2;
  reg                        b7_wr8_active_c3;
  reg                        b7_wr8_active_c4;
  reg                        b7_wr8_active_c5;
  reg                        b7_wr8_active_c52;
  reg                        b7_wr8_active_c6;
  reg                        b7_wr8_active_c7;
  reg                        b7_wr8_active_c8;
  wire                       b7_wr8_active;

  wire                [39:0] b7_siu_wr8_pa;
  wire                [63:0] b7_siu_wr8_data;
  wire                 [7:0] b7_siu_wr8_size;

  assign b7_wr8_active_c2       = `CPU.l2t7.arb_decdp_wr8_inst_c2;
  assign b7_wr8_active          = b7_wr8_active_c8;
  assign b7_first_pass_c2       = `CPU.l2t7.arbdec.arbdp_inst_c2[39]==0;
  assign b7_first_pass          = b7_first_pass_c8;
  assign b7_siu_wr8_pa          = `CPU.l2t7.arbadr.arbdp_addr_c8;
  assign b7_siu_wr8_data        = `CPU.l2t7.arbdat.arbdp_inst_data_c8;
  assign b7_siu_wr8_size        = `CPU.l2t7.arbdec.arbdec_arbdp_inst_size_c8;

  //---------------------
  // WRI signals
  reg                  [1:0] b7_pop_index;   // Index pointing to next entry to be read from IOWB
  reg                  [1:0] b7_push_index;  // Index pointing to next entry to be written from IOWB

  wire                       b7_wr64_active_c2;
  reg                        b7_wr64_active_c3;
  reg                        b7_wr64_active_c4;
  reg                        b7_wr64_active_c5;
  reg                        b7_wr64_active_c52;
  reg                        b7_wr64_active_c6;
  reg                        b7_wr64_active_c7;
  reg                        b7_wr64_active_c8;
  wire                       b7_wr64_active;

  wire                       b7_sii_l2t_req_vld;
  wire                [31:0] b7_sii_l2t_req_data;
  wire                       b7_rdma_wren;
  //wire               [1:0] b7_rdma_index;
  //wire               [3:0] b7_rdma_valid;

   reg                 [4:0] b7_state_capture;
   reg                [39:0] b7_siu_pa;
   reg                [31:0] b7_siu_d0;
   reg                [31:0] b7_siu_d1;
   reg                [31:0] b7_siu_d2;
   reg                [31:0] b7_siu_d3;
   reg                [31:0] b7_siu_d4;
   reg                [31:0] b7_siu_d5;
   reg                [31:0] b7_siu_d6;
   reg                [31:0] b7_siu_d7;
   reg                [31:0] b7_siu_d8;
   reg                [31:0] b7_siu_d9;
   reg                [31:0] b7_siu_d10;
   reg                [31:0] b7_siu_d11;
   reg                [31:0] b7_siu_d12;
   reg                [31:0] b7_siu_d13;
   reg                [31:0] b7_siu_d14;
   reg                [31:0] b7_siu_d15;

   // IOWB has 4 entries
   // Each entry has valid bit, pa, 64 Byte data
   reg                       b7_iowb0_valid;  // Indicates Bench has captured entire packet
   reg                       b7_iowb1_valid;
   reg                       b7_iowb2_valid;
   reg                       b7_iowb3_valid;
   reg                [39:0] b7_iowb0_pa;
   reg                [39:0] b7_iowb1_pa;
   reg                [39:0] b7_iowb2_pa;
   reg                [39:0] b7_iowb3_pa;
   reg                [31:0] b7_iowb0 [0:15];
   reg                [31:0] b7_iowb1 [0:15];
   reg                [31:0] b7_iowb2 [0:15];
   reg                [31:0] b7_iowb3 [0:15];

  assign b7_sii_l2t_req_vld     = `CPU.l2t7.sii_l2t_req_vld;
  assign b7_sii_l2t_req_data    = `CPU.l2t7.sii_l2t_req[31:0];

  assign b7_wr64_active_c2   = b7_inst_valid_c2 & b7_wr64_inst_c2;
  assign b7_wr64_active      = b7_wr64_active_c8;

  // Indicates when rdma_index is valid
  assign b7_rdma_wren           = `CPU.l2b7.evict_l2t_l2b_rdma_wren_s3_v1 | 
                                       `CPU.l2b7.evict_l2t_l2b_rdma_wren_s3_v2 | 
                                       `CPU.l2b7.evict_l2t_l2b_rdma_wren_s3_v3 | 
                                       `CPU.l2b7.evict_l2t_l2b_rdma_wren_s3_v4;

  
  // IOWB entry index = 0,1,2,3
  //assign b7_rdma_index          = `CPU.l2b7.evict_l2t_l2b_rdma_wrwl_s3_v1[1:0];
  // Indicates that any future transactions will see this entry's store data.
  // The bit that is asserted corresponds to the index in the IOWB.
  //assign b7_rdma_valid          = `CPU.l2t7.rdmat.rdma_valid[3:0];

//---------------------
initial
  begin
    b7_pop_index = 2'b0;
    b7_push_index = 2'b0;
    b7_state_capture = STATE_C0;   // Idle state
    b7_iowb0_valid = 1'h0;
    b7_iowb1_valid = 1'h0;
    b7_iowb2_valid = 1'h0;
    b7_iowb3_valid = 1'h0;
    b7_iowb0_pa = 40'h0;
    b7_iowb1_pa = 40'h0;
    b7_iowb2_pa = 40'h0;
    b7_iowb3_pa = 40'h0;
    b7_siu_pa = 40'h0;
    b7_siu_d0 = 32'b0;
    b7_siu_d1 = 32'b0;
    b7_siu_d2 = 32'b0;
    b7_siu_d3 = 32'b0;
    b7_siu_d4 = 32'b0;
    b7_siu_d5 = 32'b0;
    b7_siu_d6 = 32'b0;
    b7_siu_d7 = 32'b0;
    b7_siu_d8 = 32'b0;
    b7_siu_d9 = 32'b0;
    b7_siu_d10 = 32'b0;
    b7_siu_d11 = 32'b0;
    b7_siu_d12 = 32'b0;
    b7_siu_d13 = 32'b0;
    b7_siu_d14 = 32'b0;
    b7_siu_d15 = 32'b0;
  end

//==========================================================
//==========================================================

always @ (posedge `BENCH_L2T7_GCLK) begin // {

  //------------------------------
  //  Pipeline signals

  //------------------------------
  //  L2 RTL Bank7  (not needed for L2 Stub)

  b7_cam_hit_c52 <= b7_cam_hit_c5;
  b7_cam_hit_c6  <= b7_cam_hit_c52;
  b7_cam_hit_c7  <= b7_cam_hit_c6;
  b7_cam_hit_c8  <= b7_cam_hit_c7;

  b7_first_pass_c3  <= b7_first_pass_c2;
  b7_first_pass_c4  <= b7_first_pass_c3;
  b7_first_pass_c5  <= b7_first_pass_c4;
  b7_first_pass_c52 <= b7_first_pass_c5;
  b7_first_pass_c6  <= b7_first_pass_c52;
  b7_first_pass_c7  <= b7_first_pass_c6;
  b7_first_pass_c8  <= b7_first_pass_c7;

  b7_wr8_active_c3  <= b7_wr8_active_c2;
  b7_wr8_active_c4  <= b7_wr8_active_c3;
  b7_wr8_active_c5  <= b7_wr8_active_c4;
  b7_wr8_active_c52 <= b7_wr8_active_c5;
  b7_wr8_active_c6  <= b7_wr8_active_c52;
  b7_wr8_active_c7  <= b7_wr8_active_c6;
  b7_wr8_active_c8  <= b7_wr8_active_c7;

  b7_wr64_active_c3  <= b7_wr64_active_c2;
  b7_wr64_active_c4  <= b7_wr64_active_c3;
  b7_wr64_active_c5  <= b7_wr64_active_c4;
  b7_wr64_active_c52 <= b7_wr64_active_c5;
  b7_wr64_active_c6  <= b7_wr64_active_c52;
  b7_wr64_active_c7  <= b7_wr64_active_c6;
  b7_wr64_active_c8  <= b7_wr64_active_c7;

  //----------------------------------------------------------
  //----------------------------------------------------------
  // SIU Store - WR8

  
  //       only do this if the transfers don't match up in c8.

  if (b7_wr8_active && b7_first_pass) begin // {
    // Send msgs to Riesling
    dma_store (b7_siu_wr8_pa,b7_siu_wr8_data,b7_siu_wr8_size,b7_cam_hit,8'd8,"B7 WR8");
  end // }

  //----------------------------------------------------------
  //----------------------------------------------------------
  // SIU Store - WRI

  //------------------------------
  // Send MemorySlam message after SIU transaction is complete
  // Read IOWB data and Send msgs to Riesling

  if (b7_wr64_active && b7_first_pass) begin // {

    // Determine which of the 8 DMA_STOREs will be evicted.
    // WRI is 64 Bytes.
    // Eviction is 16 Bytes at a time.
    // So, there can be 1-4 Evictions for a single WRI.
    b7_ev_vect0 = b7_ev_invvect[31:0];
    b7_ev_vect1 = b7_ev_invvect[55:32];
    b7_ev_vect2 = b7_ev_invvect[87:56];
    b7_ev_vect3 = b7_ev_invvect[111:88];

    b7_inv_vect[0] = get_vect(b7_ev_vect0);
    b7_inv_vect[1] = get_vect31(b7_ev_vect1);  // different function for odd inval vector
    b7_inv_vect[2] = get_vect(b7_ev_vect2);
    b7_inv_vect[3] = get_vect31(b7_ev_vect3);  // different function for odd inval vector

    //Get entry from IOWB and send message
    b7_chk_valid_entry(b7_pop_index);
    b7_read_iowb(b7_pop_index,
                        {|b7_inv_vect[3],|b7_inv_vect[2],|b7_inv_vect[1],|b7_inv_vect[0]});
    b7_pop_index = b7_pop_index + 1;
  end // }

  //------------------------------
  // Capture state machine
  // Capture pa and data (64 Bytes) off SIU to L2 interface.
  // See SIU MAS (about page 49) for WRI packet format.
  // Put packet in IOWB which had 4 entries.
  // This IOWB in the Bench is not exactly the same as the IOWB in RTL.
  // Bench IOWB is a FIFO and RTL IOWB is not a FIFO.

  case (b7_state_capture)

    // Capture pa (part 1)
    STATE_C0: begin  // {
                // WRI pkt if req_data[26:24]==3'b100
                if ((b7_sii_l2t_req_vld)&&(b7_sii_l2t_req_data[26:24]==3'b100)) begin // {
                  b7_siu_pa[39:32] <= b7_sii_l2t_req_data[7:0];
                  b7_state_capture <= STATE_C1;
                end // }
              end // }

    // Capture pa (part 2)
    STATE_C1: begin  // {
                  b7_siu_pa[31:0] <= b7_sii_l2t_req_data[31:0];
                  b7_state_capture <= STATE_C2;
              end // }

    // Capture 4 data bytes
    STATE_C2: begin  // {
                  b7_siu_d0 <= b7_sii_l2t_req_data[31:0];
                  b7_state_capture <= STATE_C3;
              end // }

    // Capture 4 data bytes
    STATE_C3: begin  // {
                  b7_siu_d1 <= b7_sii_l2t_req_data[31:0];
                  b7_state_capture <= STATE_C4;
              end // }

    // Capture 4 data bytes
    STATE_C4: begin  // {
                  b7_siu_d2 <= b7_sii_l2t_req_data[31:0];
                  b7_state_capture <= STATE_C5;
              end // }

    // Capture 4 data bytes
    STATE_C5: begin  // {
                  b7_siu_d3 <= b7_sii_l2t_req_data[31:0];
                  b7_state_capture <= STATE_C6;
              end // }

    // Capture 4 data bytes
    STATE_C6: begin  // {
                  b7_siu_d4 <= b7_sii_l2t_req_data[31:0];
                  b7_state_capture <= STATE_C7;
              end // }

    // Capture 4 data bytes
    STATE_C7: begin  // {
                  b7_siu_d5 <= b7_sii_l2t_req_data[31:0];
                  b7_state_capture <= STATE_C8;
              end // }

    // Capture 4 data bytes
    STATE_C8: begin  // {
                  b7_siu_d6 <= b7_sii_l2t_req_data[31:0];
                  b7_state_capture <= STATE_C9;
              end // }

    // Capture 4 data bytes
    STATE_C9: begin  // {
                  b7_siu_d7 <= b7_sii_l2t_req_data[31:0];
                  b7_state_capture <= STATE_C10;
              end // }

    // Capture 4 data bytes
    STATE_C10: begin  // {
                  b7_siu_d8 <= b7_sii_l2t_req_data[31:0];
                  b7_state_capture <= STATE_C11;
              end // }

    // Capture 4 data bytes
    STATE_C11: begin  // {
                  b7_siu_d9 <= b7_sii_l2t_req_data[31:0];
                  b7_state_capture <= STATE_C12;
              end // }

    // Capture 4 data bytes
    STATE_C12: begin  // {
                  b7_siu_d10 <= b7_sii_l2t_req_data[31:0];
                  b7_state_capture <= STATE_C13;
              end // }

    // Capture 4 data bytes
    STATE_C13: begin  // {
                  b7_siu_d11 <= b7_sii_l2t_req_data[31:0];
                  b7_state_capture <= STATE_C14;
              end // }

    // Capture 4 data bytes
    STATE_C14: begin  // {
                  b7_siu_d12 <= b7_sii_l2t_req_data[31:0];
                  b7_state_capture <= STATE_C15;
              end // }

    // Capture 4 data bytes
    STATE_C15: begin  // {
                  b7_siu_d13 <= b7_sii_l2t_req_data[31:0];
                  b7_state_capture <= STATE_C16;
              end // }

    // Capture 4 data bytes
    STATE_C16: begin  // {
                  b7_siu_d14 <= b7_sii_l2t_req_data[31:0];
                  b7_state_capture <= STATE_C17;
              end // }

    // Capture 4 data bytes
    STATE_C17: begin  // {
                  b7_siu_d15 <= b7_sii_l2t_req_data[31:0];
                  b7_state_capture <= STATE_C18;
              end // }

    // Save WRI packet (pa and data)x to IOWB
    STATE_C18: begin  // {
                  // Extra check to make sure that RTL is writing to its IOWB, too.
                  if (!b7_rdma_wren) begin // {
                    `PR_ERROR("pli_ldst",`ERROR,"Bench ERROR - Capture State Machine - b7_rdma_wren is not asserted when it is expected to be asserted.");
                  end // }
                  else begin // {
                    b7_write_iowb (b7_push_index);
                    b7_push_index = b7_push_index + 1;
                  end // }
                  b7_state_capture <= STATE_C0;
              end // }

    default:  begin  // {
                `PR_ERROR("pli_ldst",`ERROR,"Bench ERROR - ldst_dma Capture State Machine 7 should not hit default state");
              end // }

  endcase

end // always}

//----------------------------------------------------------
// Task to save data captured on SIU -> L2 interface into IOWB
task b7_write_iowb;

input [1:0] index;

  begin
    `PR_INFO("ldst_dma",`INFO,"Push to B7 IOWB. index=%d pa=%h D0=%h",
                              index,b7_siu_pa,b7_siu_d0);
    case (index)
      2'h0: begin
              if (b7_iowb0_valid) begin
                `PR_ERROR("pli_ldst",`ERROR,"Bench ERROR - b7_iowb0 Overflow.");
              end
              else begin
                b7_iowb0_valid <= 1'b1;
              end

              b7_iowb0_pa  <= b7_siu_pa;
              b7_iowb0[0]  <= b7_siu_d0;
              b7_iowb0[1]  <= b7_siu_d1;
              b7_iowb0[2]  <= b7_siu_d2;
              b7_iowb0[3]  <= b7_siu_d3;
              b7_iowb0[4]  <= b7_siu_d4;
              b7_iowb0[5]  <= b7_siu_d5;
              b7_iowb0[6]  <= b7_siu_d6;
              b7_iowb0[7]  <= b7_siu_d7;
              b7_iowb0[8]  <= b7_siu_d8;
              b7_iowb0[9]  <= b7_siu_d9;
              b7_iowb0[10] <= b7_siu_d10;
              b7_iowb0[11] <= b7_siu_d11;
              b7_iowb0[12] <= b7_siu_d12;
              b7_iowb0[13] <= b7_siu_d13;
              b7_iowb0[14] <= b7_siu_d14;
              b7_iowb0[15] <= b7_siu_d15;
            end
      2'h1: begin
              if (b7_iowb1_valid) begin
                `PR_ERROR("pli_ldst",`ERROR,"Bench ERROR - b7_iowb1 Overflow.");
              end
              else begin
                b7_iowb1_valid <= 1'b1;
              end

              b7_iowb1_pa  <= b7_siu_pa;
              b7_iowb1[0]  <= b7_siu_d0;
              b7_iowb1[1]  <= b7_siu_d1;
              b7_iowb1[2]  <= b7_siu_d2;
              b7_iowb1[3]  <= b7_siu_d3;
              b7_iowb1[4]  <= b7_siu_d4;
              b7_iowb1[5]  <= b7_siu_d5;
              b7_iowb1[6]  <= b7_siu_d6;
              b7_iowb1[7]  <= b7_siu_d7;
              b7_iowb1[8]  <= b7_siu_d8;
              b7_iowb1[9]  <= b7_siu_d9;
              b7_iowb1[10] <= b7_siu_d10;
              b7_iowb1[11] <= b7_siu_d11;
              b7_iowb1[12] <= b7_siu_d12;
              b7_iowb1[13] <= b7_siu_d13;
              b7_iowb1[14] <= b7_siu_d14;
              b7_iowb1[15] <= b7_siu_d15;
            end
      2'h2: begin
              if (b7_iowb2_valid) begin
                `PR_ERROR("pli_ldst",`ERROR,"Bench ERROR - b7_iowb2 Overflow.");
              end
              else begin
                b7_iowb2_valid <= 1'b1;
              end

              b7_iowb2_pa  <= b7_siu_pa;
              b7_iowb2[0]  <= b7_siu_d0;
              b7_iowb2[1]  <= b7_siu_d1;
              b7_iowb2[2]  <= b7_siu_d2;
              b7_iowb2[3]  <= b7_siu_d3;
              b7_iowb2[4]  <= b7_siu_d4;
              b7_iowb2[5]  <= b7_siu_d5;
              b7_iowb2[6]  <= b7_siu_d6;
              b7_iowb2[7]  <= b7_siu_d7;
              b7_iowb2[8]  <= b7_siu_d8;
              b7_iowb2[9]  <= b7_siu_d9;
              b7_iowb2[10] <= b7_siu_d10;
              b7_iowb2[11] <= b7_siu_d11;
              b7_iowb2[12] <= b7_siu_d12;
              b7_iowb2[13] <= b7_siu_d13;
              b7_iowb2[14] <= b7_siu_d14;
              b7_iowb2[15] <= b7_siu_d15;
            end
      2'h3: begin
              if (b7_iowb3_valid) begin
                `PR_ERROR("pli_ldst",`ERROR,"Bench ERROR - b7_iowb3 Overflow.");
              end
              else begin
                b7_iowb3_valid <= 1'b1;
              end

              b7_iowb3_pa  <= b7_siu_pa;
              b7_iowb3[0]  <= b7_siu_d0;
              b7_iowb3[1]  <= b7_siu_d1;
              b7_iowb3[2]  <= b7_siu_d2;
              b7_iowb3[3]  <= b7_siu_d3;
              b7_iowb3[4]  <= b7_siu_d4;
              b7_iowb3[5]  <= b7_siu_d5;
              b7_iowb3[6]  <= b7_siu_d6;
              b7_iowb3[7]  <= b7_siu_d7;
              b7_iowb3[8]  <= b7_siu_d8;
              b7_iowb3[9]  <= b7_siu_d9;
              b7_iowb3[10] <= b7_siu_d10;
              b7_iowb3[11] <= b7_siu_d11;
              b7_iowb3[12] <= b7_siu_d12;
              b7_iowb3[13] <= b7_siu_d13;
              b7_iowb3[14] <= b7_siu_d14;
              b7_iowb3[15] <= b7_siu_d15;
            end
      default: begin
                `PR_ERROR("pli_ldst",`ERROR,"Bench ERROR - task write_iowb should not hit default state");
               end
    endcase    

  end
endtask

//----------------------------------------------------------
// Task to read data from IOWB and send to Riesling
task b7_read_iowb;

input [1:0] index;
input [3:0] tmp_evict;

  begin
    case (index)
      2'h0: 
          begin
            if (!b7_iowb0_valid) begin
              `PR_ERROR("pli_ldst",`ERROR,"Bench ERROR - b7_iowb0 Underflow.");
            end
            else begin
              b7_iowb0_valid <= 1'b0;
            end

           `PR_INFO("ldst_dma",`INFO,"Pop from B7 IOWB. index=%d pa=%h D0=%h",
                              index,b7_iowb0_pa,b7_iowb0[0]);

            // Call task to send NAS message
            // Send 8 Bytes at a time
            dma_store (b7_iowb0_pa,   {b7_iowb0[0], b7_iowb0[1]}, 8'hff,tmp_evict[0],8'd64,"B7 WRI 1");
            dma_store (b7_iowb0_pa+8, {b7_iowb0[2], b7_iowb0[3]}, 8'hff,tmp_evict[0],8'd64,"B7 WRI 2");
            dma_store (b7_iowb0_pa+16,{b7_iowb0[4], b7_iowb0[5]}, 8'hff,tmp_evict[1],8'd64,"B7 WRI 3");
            dma_store (b7_iowb0_pa+24,{b7_iowb0[6], b7_iowb0[7]}, 8'hff,tmp_evict[1],8'd64,"B7 WRI 4");
            dma_store (b7_iowb0_pa+32,{b7_iowb0[8], b7_iowb0[9]}, 8'hff,tmp_evict[2],8'd64,"B7 WRI 5");
            dma_store (b7_iowb0_pa+40,{b7_iowb0[10],b7_iowb0[11]},8'hff,tmp_evict[2],8'd64,"B7 WRI 6");
            dma_store (b7_iowb0_pa+48,{b7_iowb0[12],b7_iowb0[13]},8'hff,tmp_evict[3],8'd64,"B7 WRI 7");
            dma_store (b7_iowb0_pa+56,{b7_iowb0[14],b7_iowb0[15]},8'hff,tmp_evict[3],8'd64,"B7 WRI 8");
          end
      2'h1: 
          begin
            if (!b7_iowb1_valid) begin
              `PR_ERROR("pli_ldst",`ERROR,"Bench ERROR - b7_iowb1 Underflow.");
            end
            else begin
              b7_iowb1_valid <= 1'b0;
            end

           `PR_INFO("ldst_dma",`INFO,"Pop from B7 IOWB. index=%d pa=%h D0=%h",
                              index,b7_iowb1_pa,b7_iowb1[0]);

            // Call task to send NAS message
            // Send 8 Bytes at a time
            dma_store (b7_iowb1_pa,   {b7_iowb1[0], b7_iowb1[1]}, 8'hff,tmp_evict[0],8'd64,"B7 WRI 1");
            dma_store (b7_iowb1_pa+8, {b7_iowb1[2], b7_iowb1[3]}, 8'hff,tmp_evict[0],8'd64,"B7 WRI 2");
            dma_store (b7_iowb1_pa+16,{b7_iowb1[4], b7_iowb1[5]}, 8'hff,tmp_evict[1],8'd64,"B7 WRI 3");
            dma_store (b7_iowb1_pa+24,{b7_iowb1[6], b7_iowb1[7]}, 8'hff,tmp_evict[1],8'd64,"B7 WRI 4");
            dma_store (b7_iowb1_pa+32,{b7_iowb1[8], b7_iowb1[9]}, 8'hff,tmp_evict[2],8'd64,"B7 WRI 5");
            dma_store (b7_iowb1_pa+40,{b7_iowb1[10],b7_iowb1[11]},8'hff,tmp_evict[2],8'd64,"B7 WRI 6");
            dma_store (b7_iowb1_pa+48,{b7_iowb1[12],b7_iowb1[13]},8'hff,tmp_evict[3],8'd64,"B7 WRI 7");
            dma_store (b7_iowb1_pa+56,{b7_iowb1[14],b7_iowb1[15]},8'hff,tmp_evict[3],8'd64,"B7 WRI 8");
          end
      2'h2: 
          begin
            if (!b7_iowb2_valid) begin
              `PR_ERROR("pli_ldst",`ERROR,"Bench ERROR - b7_iowb2 Underflow.");
            end
            else begin
              b7_iowb2_valid <= 1'b0;
            end

           `PR_INFO("ldst_dma",`INFO,"Pop from B7 IOWB. index=%d pa=%h D0=%h",
                              index,b7_iowb2_pa,b7_iowb2[0]);

            // Call task to send NAS message
            // Send 8 Bytes at a time
            dma_store (b7_iowb2_pa,   {b7_iowb2[0], b7_iowb2[1]}, 8'hff,tmp_evict[0],8'd64,"B7 WRI 1");
            dma_store (b7_iowb2_pa+8, {b7_iowb2[2], b7_iowb2[3]}, 8'hff,tmp_evict[0],8'd64,"B7 WRI 2");
            dma_store (b7_iowb2_pa+16,{b7_iowb2[4], b7_iowb2[5]}, 8'hff,tmp_evict[1],8'd64,"B7 WRI 3");
            dma_store (b7_iowb2_pa+24,{b7_iowb2[6], b7_iowb2[7]}, 8'hff,tmp_evict[1],8'd64,"B7 WRI 4");
            dma_store (b7_iowb2_pa+32,{b7_iowb2[8], b7_iowb2[9]}, 8'hff,tmp_evict[2],8'd64,"B7 WRI 5");
            dma_store (b7_iowb2_pa+40,{b7_iowb2[10],b7_iowb2[11]},8'hff,tmp_evict[2],8'd64,"B7 WRI 6");
            dma_store (b7_iowb2_pa+48,{b7_iowb2[12],b7_iowb2[13]},8'hff,tmp_evict[3],8'd64,"B7 WRI 7");
            dma_store (b7_iowb2_pa+56,{b7_iowb2[14],b7_iowb2[15]},8'hff,tmp_evict[3],8'd64,"B7 WRI 8");
          end
      2'h3: 
          begin
            if (!b7_iowb3_valid) begin
              `PR_ERROR("pli_ldst",`ERROR,"Bench ERROR - b7_iowb3 Underflow.");
            end
            else begin
              b7_iowb3_valid <= 1'b0;
            end

           `PR_INFO("ldst_dma",`INFO,"Pop from B7 IOWB. index=%d pa=%h D0=%h",
                              index,b7_iowb3_pa,b7_iowb3[0]);

            // Call task to send NAS message
            // Send 8 Bytes at a time
            dma_store (b7_iowb3_pa,   {b7_iowb3[0], b7_iowb3[1]}, 8'hff,tmp_evict[0],8'd64,"B7 WRI 1");
            dma_store (b7_iowb3_pa+8, {b7_iowb3[2], b7_iowb3[3]}, 8'hff,tmp_evict[0],8'd64,"B7 WRI 2");
            dma_store (b7_iowb3_pa+16,{b7_iowb3[4], b7_iowb3[5]}, 8'hff,tmp_evict[1],8'd64,"B7 WRI 3");
            dma_store (b7_iowb3_pa+24,{b7_iowb3[6], b7_iowb3[7]}, 8'hff,tmp_evict[1],8'd64,"B7 WRI 4");
            dma_store (b7_iowb3_pa+32,{b7_iowb3[8], b7_iowb3[9]}, 8'hff,tmp_evict[2],8'd64,"B7 WRI 5");
            dma_store (b7_iowb3_pa+40,{b7_iowb3[10],b7_iowb3[11]},8'hff,tmp_evict[2],8'd64,"B7 WRI 6");
            dma_store (b7_iowb3_pa+48,{b7_iowb3[12],b7_iowb3[13]},8'hff,tmp_evict[3],8'd64,"B7 WRI 7");
            dma_store (b7_iowb3_pa+56,{b7_iowb3[14],b7_iowb3[15]},8'hff,tmp_evict[3],8'd64,"B7 WRI 8");
          end
      default: 
          begin
            `PR_ERROR("pli_ldst",`ERROR,"Bench ERROR - task read_iowb should not hit default state");
          end
    endcase    

  end
endtask

//----------------------------------------------------------
// Task to make sure the entry at the location pointed to by index is valid before we try to pop it.
task b7_chk_valid_entry;

input [1:0] index;

  begin
    case (index)
      2'h0: 
          begin
            if (b7_iowb0_valid != 1'b1) begin
              `PR_ERROR("pli_ldst",`ERROR,"Bench ERROR - the entry in IOWB at index=0 is not valid (b7_iowb0_valid!=1'b1)");
            end
          end
      2'h1: 
          begin
            if (b7_iowb1_valid != 1'b1) begin
              `PR_ERROR("pli_ldst",`ERROR,"Bench ERROR - the entry in IOWB at index=1 is not valid (b7_iowb1_valid!=1'b1)");
            end
          end
      2'h2: 
          begin
            if (b7_iowb2_valid != 1'b1) begin
              `PR_ERROR("pli_ldst",`ERROR,"Bench ERROR - the entry in IOWB at index=2 is not valid (b7_iowb2_valid!=1'b1)");
            end
          end
      2'h3: 
          begin
            if (b7_iowb3_valid != 1'b1) begin
              `PR_ERROR("pli_ldst",`ERROR,"Bench ERROR - the entry in IOWB at index=3 is not valid (b7_iowb3_valid!=1'b1)");
            end
          end
      default: 
          begin
            `PR_ERROR("pli_ldst",`ERROR,"Bench ERROR - task chk_valid_entry should not hit default state");
          end
    endcase
  end
endtask

  `endif // `ifdef NOL2RTL
`endif   // `ifdef NO_L2_BNK7


`endif  // `ifdef GATESI7M

//----------------------------------------------------------
// Task to send message to NAS
// Can be called by this module or Vera code (ENET Tx backdoor memory access) 
task mem_slam;

input [39:0] tmp_pa;
input [63:0] tmp_data;
input  [7:0] tmp_size;
input [(8*8)-1:0] tmp_str;  // 8 character string - source of this mem_slam

integer junk;

  begin
    // Hash PA before sending to Riesling
    if (`PARGS.hash_on && (tmp_pa[39]==1'b0)) begin // {
      tmp_pa = `TOP.hashpa(tmp_pa);
    end // }

    if (`PARGS.nas_check_on && `PARGS.ldst_sync_on) begin // {
      `PR_INFO ("pli_ldst", `INFO, 
          "     PLI_MEM_SLAM         pa=%h data=%h sz=%h       ts=%0d (MEM_SLAM from %s)",
                                      tmp_pa,tmp_data,tmp_size,`TOP.core_cycle_cnt-1,tmp_str);
      junk = $sim_send(`PLI_MEM_SLAM,tmp_pa,tmp_data,tmp_size,`TOP.core_cycle_cnt-1);
    end // }

    if (`PARGS.show_memop_on) begin // {
      `PR_NORMAL ("pli_ldst", `NORMAL, 
          "     MEMOP_STORE       pa=%h  data=%h sz=%h ts=%0d (MEM_SLAM from %s)",
                     tmp_pa,tmp_data,tmp_size,`TOP.core_cycle_cnt-1,tmp_str);
    end // }
  end
endtask

//----------------------------------------------------------
// Task to send message to NAS
// Note: DMA_STORE must come before the associated EVICT.
//       This is required for Riesling to associate the 2 msgs properly.
task dma_store;

input [39:0] tmp_pa;
input [63:0] tmp_data;
input  [7:0] tmp_size;
input        tmp_evict;
input  [7:0] tmp_total_size;
input [(8*8)-1:0] tmp_str;  // 8 character string - source of this dma_store

integer junk;

  begin
    // Hash PA before sending to Riesling
    if (`PARGS.hash_on && (tmp_pa[39]==1'b0)) begin // {
      tmp_pa = `TOP.hashpa(tmp_pa);
    end // }

    if (`PARGS.nas_check_on && `PARGS.ldst_sync_on) begin // {
      `PR_INFO ("pli_ldst", `INFO, 
          "      PLI_MEM_DMAST        pa=%h data=%h sz=%h inv=%b ts=%0d (%s)",
                                  tmp_pa,tmp_data,tmp_size,tmp_evict,`TOP.core_cycle_cnt-1,tmp_str);
      junk = $sim_send(`PLI_MEM_DMA_ST,tmp_pa,tmp_data,tmp_size,tmp_evict,tmp_total_size,`TOP.core_cycle_cnt-1);
    end // }

    if (`PARGS.show_memop_on) begin // {
      `PR_NORMAL ("pli_ldst", `NORMAL, 
          "      MEMOP_STORE       pa=%h  data=%h sz=%h ts=%0d  (DMA %s)",
                               tmp_pa,tmp_data,tmp_size,`TOP.core_cycle_cnt-1,tmp_str);
    end // }
  end
endtask

//----------------------------------------------------------
// Task to send message to NAS
// Can be called by this module or Vera code (ENET Tx backdoor memory access) 
task mem_check;

input [39:0]         tmp_pa;
input [((64*8)-1):0] tmp_data;  // 64 bytes

integer junk;

  begin
    if (`PARGS.nas_check_on && !`PARGS.dma_memchk_off) begin // {
      `PR_INFO ("pli_ldst", `INFO, 
          "     PLI_MEM_CHECK         pa=%h data=%0h ts=%0d",
                                      tmp_pa,tmp_data,`TOP.core_cycle_cnt-1);
      // note: socket.c can only handle 8 Bytes max in each sim_send argument.
      //       So, send 8 Bytes at a time.  Riesling still sees 64 Byte stream.
      junk = $sim_send(`PLI_MEM_CHECK,tmp_pa,
                            tmp_data[511:448],tmp_data[447:384],
                            tmp_data[383:320],tmp_data[319:256],
                            tmp_data[255:192],tmp_data[191:128],
                            tmp_data[127:64],tmp_data[63:0]);
    end // }

    if (`PARGS.show_memop_on) begin // {
      `PR_NORMAL ("pli_ldst", `NORMAL, 
          "     MEMOP_MEM_CHECK       pa=%h data=%h ts=%0d",
                     tmp_pa,tmp_data,`TOP.core_cycle_cnt-1);
    end // }
  end
endtask

//----------------------------------------------------------
//----------------------------------------------------------
