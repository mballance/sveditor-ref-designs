// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: axis_siu_mon.v
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
  module axis_siu_mon (
		       clk,
		       reset,

	               niu_sii_hdr_vld,
 	               niu_sii_reqbypass,
 	               niu_sii_datareq,
                       niu_sii_data,
 	               niu_sii_parity,
 	               sii_niu_oqdq,
	               sii_niu_bqdq,

                       niu_sio_dq,
	               sio_niu_hdr_vld,
 	               sio_niu_datareq,
                       sio_niu_data,
                       sio_niu_parity,

                       dmu_sii_hdr_vld,
 	               dmu_sii_reqbypass,
 	               dmu_sii_datareq,
 	               dmu_sii_datareq16,
                       dmu_sii_data,
 	               dmu_sii_parity,
  	               dmu_sii_be_parity,
                       dmu_sii_be,
                       sii_dmu_wrack_vld,
                       sii_dmu_wrack_tag,
	               sii_dmu_wrack_parity,

	               sio_dmu_hdr_vld,
                       sio_dmu_data,
                       sio_dmu_parity
		       );

   input              clk;
   input              reset;
              
   // ================== NIU  =================
   // SII
   input 	 niu_sii_hdr_vld;   // PINDEF:BOT  // Ethernet requesting to send packet to SII
   input 	 niu_sii_reqbypass; // PINDEF:BOT  // Ethernet requesting to send packet to bypass queue of SII
   input 	 niu_sii_datareq;   // PINDEF:BOT  // Ethernet requesting to send packet w/data to SII
   input [127:0] niu_sii_data;	    // PINDEF:BOT  // Packet from Ethernet to SII
   input [7:0] 	 niu_sii_parity;    // PINDEF:BOT  // Packet parity from Ethernet to SII
   input 	 sii_niu_oqdq;      // PINDEF:BOT  // Asserted when SII dqs an NIU entry from Ordered Queue
   input 	 sii_niu_bqdq;      // PINDEF:BOT  // Asserted when SII dqs an NIU entry from Bypass Queue 		

   // SIO
   input        niu_sio_dq;             //PINDEF:BOT  // flow control or credit return signal from NIU to SIO
   input 	sio_niu_hdr_vld;	//PINDEF:BOT  // SIO requesting to send packet to Ethernet
   input 	sio_niu_datareq;	//PINDEF:BOT  // Valid during header phase only - 1=current request is a read data return
   input [127:0] sio_niu_data;		//PINDEF:BOT  // Packet from SIO to Ethernet
   input [7:0]   sio_niu_parity;	//PINDEF:BOT  // Packet parity from SIO to Ethernet
   // ================== NIU  =================
 
   // ================== DMU  =================
   // SII
   input 	 dmu_sii_hdr_vld;   // PINDEF:BOT  // DMU requesting to send packet to SII
   input 	 dmu_sii_reqbypass; // PINDEF:BOT  // DMU requesting to send packet to bypass queue of SII
   input 	 dmu_sii_datareq;   // PINDEF:BOT  // DMU requesting to send packet w/data to SII
   input 	 dmu_sii_datareq16; // PINDEF:BOT  // DMU requesting to send packet w/16B only
   input [127:0] dmu_sii_data;	    // PINDEF:BOT  // Packet from DMU to SII
   input [7:0] 	 dmu_sii_parity;    // PINDEF:BOT  // Packet parity from DMU to SII
   input  	 dmu_sii_be_parity; // PINDEF:BOT  // Packet parity from DMU to SII
   input [15:0]  dmu_sii_be;	    // PINDEF:BOT  // Packet byte enables from DMU to SII
   input        sii_dmu_wrack_vld;
   input[3:0]   sii_dmu_wrack_tag;
   input	 sii_dmu_wrack_parity;


   // SIO
   input 	  sio_dmu_hdr_vld;	//PINDEF:BOT  // SIO requesting to send DMA/Fl/Int packet to DMU
   input [127:0] sio_dmu_data;		//PINDEF:BOT  // Packet from SIO to DMU
   input [7:0]   sio_dmu_parity;	//PINDEF:BOT  // Packet parity from SIO to DMU
   // ================== DMU  =================

   // ================== NIU  =================
   // SII
   reg         niu_sii_hdr_vld_r;   // PINDEF:BOT  // Ethernet requesting to send packet to SII
   reg         niu_sii_reqbypass_r; // PINDEF:BOT  // Ethernet requesting to send packet to bypass queue of SII
   reg         niu_sii_datareq_r;   // PINDEF:BOT  // Ethernet requesting to send packet w/data to SII
   reg [127:0] niu_sii_data_r;	    // PINDEF:BOT  // Packet from Ethernet to SII
   reg [7:0]   niu_sii_parity_r;    // PINDEF:BOT  // Packet parity from Ethernet to SII
   reg         sii_niu_oqdq_r;      // PINDEF:BOT  // Asserted when SII dqs an NIU entry from Ordered Queue
   reg         sii_niu_bqdq_r;      // PINDEF:BOT  // Asserted when SII dqs an NIU entry from Bypass Queue 		
   
   // SIO
   reg         niu_sio_dq_r;             //PINDEF:BOT  // flow control or credit return signal from NIU to SIO
   reg         sio_niu_hdr_vld_r;	//PINDEF:BOT  // SIO requesting to send packet to Ethernet
   reg         sio_niu_datareq_r;	//PINDEF:BOT  // Valid during header phase only - 1=current request is a read data return
   reg [127:0] sio_niu_data_r;		//PINDEF:BOT  // Packet from SIO to Ethernet
   reg [7:0]   sio_niu_parity_r;	//PINDEF:BOT  // Packet parity from SIO to Ethernet
   // ================== NIU  =================
 
   // ================== DMU  =================
   // SII
   reg         dmu_sii_hdr_vld_r;   // PINDEF:BOT  // DMU requesting to send packet to SII
   reg         dmu_sii_reqbypass_r; // PINDEF:BOT  // DMU requesting to send packet to bypass queue of SII
   reg         dmu_sii_datareq_r;   // PINDEF:BOT  // DMU requesting to send packet w/data to SII
   reg         dmu_sii_datareq16_r; // PINDEF:BOT  // DMU requesting to send packet w/16B only
   reg [127:0] dmu_sii_data_r;	    // PINDEF:BOT  // Packet from DMU to SII
   reg [7:0]   dmu_sii_parity_r;    // PINDEF:BOT  // Packet parity from DMU to SII
   reg         dmu_sii_be_parity_r; // PINDEF:BOT  // Packet parity from DMU to SII
   reg [15:0]  dmu_sii_be_r;	    // PINDEF:BOT  // Packet byte enables from DMU to SII
   reg         sii_dmu_wrack_vld_r;
   reg [3:0]   sii_dmu_wrack_tag_r;
   reg         sii_dmu_wrack_parity_r;
   
   // SIO
   reg         sio_dmu_hdr_vld_r;	//PINDEF:BOT  // SIO requesting to send DMA/Fl/Int packet to DMU
   reg [127:0] sio_dmu_data_r;		//PINDEF:BOT  // Packet from SIO to DMU
   reg [7:0]   sio_dmu_parity_r;	//PINDEF:BOT  // Packet parity from SIO to DMU
   // ================== DMU  =================

   // ================== TCU  =================
   // SII
   reg         tcu_sii_vld_r;
   // SIO
   reg         sio_tcu_vld_r;    // assert for jtag read return valid

   // Count data cycles on interface after header cycle
   reg [2:0]   dmu_sii_cntr_r;
   reg [2:0]   niu_sii_cntr_r;
   reg [2:0]   dmu_sio_cntr_r;
   reg [2:0]   niu_sio_cntr_r;
   reg [8:0]   tcu_sii_cntr_r;
   reg [8:0]   tcu_sio_cntr_r;

   wire [2:0]  dmu_sii_cntr;
   wire [2:0]  niu_sii_cntr;
   wire [2:0]  dmu_sio_cntr;
   wire [2:0]  niu_sio_cntr;
   wire [8:0]  tcu_sii_cntr;
   wire [8:0]  tcu_sio_cntr;
   
   // The SIU interfaces for the DMU & NIU are not identical so
   // the logic below is not quite symetrical.
   assign dmu_sii_cntr = (reset) ? 0 :  // Reset to 0
          (dmu_sii_hdr_vld_r && dmu_sii_datareq_r && dmu_sii_datareq16_r) ? 0 : // No data case?
          (dmu_sii_hdr_vld_r && dmu_sii_datareq16_r) ? 1 : // Single xfer cycle
          (dmu_sii_hdr_vld_r && dmu_sii_datareq_r) ? 4 : // Four xfer cycles
          (|dmu_sii_cntr_r) ? (dmu_sii_cntr_r - 1) : // Decrement counter when non-zero
          dmu_sii_cntr_r; // Hold otherwise

   assign niu_sii_cntr = (reset) ? 0 :  // Reset to 0
          (niu_sii_hdr_vld_r && niu_sii_datareq_r) ? 4 : // Four xfer cycle
          (|niu_sii_cntr_r) ? (niu_sii_cntr_r - 1) : // Decrement counter when non-zero
          niu_sii_cntr_r; // Hold otherwise

   assign tcu_sii_cntr = (reset) ? 0 :  // Reset to 0
          (tcu_sii_vld_r) ? 129 : // 128 cycles to shift, one to sample
          (|tcu_sii_cntr_r) ? (tcu_sii_cntr_r - 1) : // Decrement counter when non-zero
          tcu_sii_cntr_r; // Hold otherwise

   assign dmu_sio_cntr = (reset) ? 0 :  // Reset to 0
          (sio_dmu_hdr_vld_r) ? 4 : // Four xfer cycles
          (|dmu_sio_cntr_r) ? (dmu_sio_cntr_r - 1) : // Decrement counter when non-zero
          dmu_sio_cntr_r; // Hold otherwise

   assign niu_sio_cntr = (reset) ? 0 :  // Reset to 0
          (sio_niu_hdr_vld_r && sio_niu_datareq_r) ? 4 : // Four xfer cycle
          (|niu_sio_cntr_r) ? (niu_sio_cntr_r - 1) : // Decrement counter when non-zero
          niu_sio_cntr_r; // Hold otherwise

   assign tcu_sio_cntr = (reset) ? 0 :  // Reset to 0
          (sio_tcu_vld_r) ? 65  : // 64 cycles to assemble data, one to strobe out
          (|tcu_sio_cntr_r) ? (tcu_sio_cntr_r - 1) : // Decrement counter when non-zero
          tcu_sio_cntr_r; // Hold at 0 otherwise

always @(posedge clk) begin
   // Register all inputs, even ones I don't use, may
   // want them some day.
   niu_sii_hdr_vld_r <= (reset) ? 0 : niu_sii_hdr_vld;
   niu_sii_reqbypass_r <= (reset) ? 0 : niu_sii_reqbypass;
   niu_sii_datareq_r <= (reset) ? 0 : niu_sii_datareq;
   niu_sii_data_r <= (reset) ? 0 : niu_sii_data;
   niu_sii_parity_r <= (reset) ? 0 : niu_sii_parity;
   sii_niu_oqdq_r <= (reset) ? 0 : sii_niu_oqdq;
   sii_niu_bqdq_r <= (reset) ? 0 : sii_niu_bqdq;

   niu_sio_dq_r <= (reset) ? 0 : niu_sio_dq;
   sio_niu_hdr_vld_r <= (reset) ? 0 : sio_niu_hdr_vld;
   sio_niu_datareq_r <= (reset) ? 0 : sio_niu_datareq;
   sio_niu_data_r <= (reset) ? 0 : sio_niu_data;
   sio_niu_parity_r <= (reset) ? 0 : sio_niu_parity;
   dmu_sii_hdr_vld_r <= (reset) ? 0 : dmu_sii_hdr_vld;
   dmu_sii_reqbypass_r <= (reset) ? 0 : dmu_sii_reqbypass;
   dmu_sii_datareq_r <= (reset) ? 0 : dmu_sii_datareq;
   dmu_sii_datareq16_r <= (reset) ? 0 : dmu_sii_datareq16;
   dmu_sii_data_r <= (reset) ? 0 : dmu_sii_data;
   dmu_sii_parity_r <= (reset) ? 0 : dmu_sii_parity;
   dmu_sii_be_parity_r <= (reset) ? 0 : dmu_sii_be_parity;
   dmu_sii_be_r <= (reset) ? 0 : dmu_sii_be;
   sii_dmu_wrack_vld_r <= (reset) ? 0 : sii_dmu_wrack_vld;
   sii_dmu_wrack_tag_r <= (reset) ? 0 : sii_dmu_wrack_tag;
   sii_dmu_wrack_parity_r <= (reset) ? 0 : sii_dmu_wrack_parity;
   
   sio_dmu_hdr_vld_r <= (reset) ? 0 : sio_dmu_hdr_vld;
   sio_dmu_data_r <= (reset) ? 0 : sio_dmu_data;
   sio_dmu_parity_r <= (reset) ? 0 : sio_dmu_parity;

   niu_sii_cntr_r <= niu_sii_cntr;
   dmu_sii_cntr_r <= dmu_sii_cntr;
   niu_sio_cntr_r <= niu_sio_cntr;
   dmu_sio_cntr_r <= dmu_sio_cntr;

   tcu_sii_vld_r <= `CPU.tcu_sii_vld;
   sio_tcu_vld_r <= `CPU.sio_tcu_vld;


end // always @ (posedge clk)
   
always @(posedge clk) begin
   // Input, AKA DMA Writes
   if(`TOP.info && dmu_sii_hdr_vld) begin // axis tbcall_region
      $display("%d dmu_sii_hdr  %08x-%08x-%08x-%08x  Byp %x",
               $time,
               dmu_sii_data_r[127:96],dmu_sii_data_r[95:64],
               dmu_sii_data_r[63:32],dmu_sii_data_r[31:0], dmu_sii_reqbypass_r);
   end
   if(`TOP.info && |dmu_sii_cntr) begin // axis tbcall_region
      $display("%d dmu_sii_data %08x-%08x-%08x-%08x  BE %02x",
               $time,
               dmu_sii_data_r[127:96],dmu_sii_data_r[95:64],
               dmu_sii_data_r[63:32],dmu_sii_data_r[31:0], dmu_sii_be_r);
   end

   if(`TOP.info && niu_sii_hdr_vld) begin // axis tbcall_region
      $display("%d niu_sii_hdr  %08x-%08x-%08x-%08x  Byp %x",
               $time,
               niu_sii_data_r[127:96],niu_sii_data_r[95:64],
               niu_sii_data_r[63:32],niu_sii_data_r[31:0], niu_sii_reqbypass_r);
   end
   if(`TOP.info && |niu_sii_cntr) begin // axis tbcall_region
      $display("%d niu_sii_data %08x-%08x-%08x-%08x",
               $time,
               niu_sii_data_r[127:96],niu_sii_data_r[95:64],
               niu_sii_data_r[63:32],niu_sii_data_r[31:0]);
   end
   if(`TOP.info && (tcu_sii_cntr == 1)) begin // axis tbcall_region
      $display("%d tcu_sii_data %08x-%08x-%08x-%08x",
               $time,
               `TOP.cpu.sii.ipcc.tcu_serial_data_l[127:96],
               `TOP.cpu.sii.ipcc.tcu_serial_data_l[95:64],
               `TOP.cpu.sii.ipcc.tcu_serial_data_l[63:32],
               `TOP.cpu.sii.ipcc.tcu_serial_data_l[31:0]);
   end

   // Output, AKA DMA Reads
   if(`TOP.info && sio_dmu_hdr_vld) begin // axis tbcall_region
      $display("%d sio_dmu_hdr  %08x-%08x-%08x-%08x",
               $time,
               sio_dmu_data_r[127:96],sio_dmu_data_r[95:64],
               sio_dmu_data_r[63:32],sio_dmu_data_r[31:0]);
   end
   if(`TOP.info && |dmu_sio_cntr) begin // axis tbcall_region
      $display("%d sio_dmu_data %08x-%08x-%08x-%08x",
               $time,
               sio_dmu_data_r[127:96],sio_dmu_data_r[95:64],
               sio_dmu_data_r[63:32],sio_dmu_data_r[31:0]);
   end

   if(`TOP.info && sio_niu_hdr_vld) begin // axis tbcall_region
      $display("%d sio_niu_hdr  %08x-%08x-%08x-%08x",
               $time,
               sio_niu_data_r[127:96],sio_niu_data_r[95:64],
               sio_niu_data_r[63:32],sio_niu_data_r[31:0]);
   end
   if(`TOP.info && |niu_sio_cntr) begin // axis tbcall_region
      $display("%d sio_niu_data %08x-%08x-%08x-%08x",
               $time,
               sio_niu_data_r[127:96],sio_niu_data_r[95:64],
               sio_niu_data_r[63:32],sio_niu_data_r[31:0]);
   end
   if(`TOP.info && (tcu_sio_cntr == 1)) begin // axis tbcall_region
      $display("%d sio_tcu_data %08x-%08x",
               $time,
               `TOP.cpu.tcu.regs_ctl.next_l2data_reg[63:32],
               `TOP.cpu.tcu.regs_ctl.next_l2data_reg[31:0]);
   end
   
end // always @ (posedge clk)

endmodule // axis_siu_mon
