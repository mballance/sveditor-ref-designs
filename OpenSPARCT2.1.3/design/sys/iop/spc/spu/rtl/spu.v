// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: spu.v
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
module spu (
  scan_in, 
  scan_out, 
  l2clk,
  in_rngl_cdbus, 

  spu_mbi_mam_fail_, 
  spu_mbi_mam_fail2_, 
  spu_mbi_arf_fail_, 
  spu_mbi_rrf_fail_, 
  spu_rngl_cdbus, 
  spu_l15_valid, 
  spu_l15_addr, 
  spu_l15_cpkt, 
  spu_l15_data, 
  spu_mult_request, 
  spu_fgu_rs1_e, 
  spu_fgu_rs2_e, 
  spu_fgu_fpy_ctl_d, 
  spu_pmu_cwq_busy, 
  spu_pmu_cwq_tid, 
  spu_pmu_ma_busy, 
  spu_tlu_cwq_busy, 
  spu_tlu_cwq_int_req, 
  spu_tlu_ma_int_req, 
  spu_tlu_mamu_err_req, 
  spu_tlu_l2_error);

input 		scan_in;
output		scan_out;
input		l2clk;

input  [64:0]	in_rngl_cdbus;			// ASI Ring
						//   64:0, 65 bit control/data bus coming from the ring
						//   64    - ctl/data            
						//   63    - valid/hole          
						//   62    - ack            
						//   61:60 - 00-ASI, 01-ASR, 10-PR, 11-HPR          
						//   59    - rd/wrx              
						//   58:56 - Thread ID           
						//   55:48 - ASI field           
						//   47:0  - Virtual Address    

output		spu_mbi_mam_fail_; 		// MBIST MAM comparator output bits 63:0
output		spu_mbi_mam_fail2_; 		// MBIST MAM comparator output bits 71:64
output		spu_mbi_arf_fail_;		// MBIST ARF comparator
output		spu_mbi_rrf_fail_;		// MBIST RRF comparator

output [64:0]	spu_rngl_cdbus;			// ASI Ring

output		spu_l15_valid;			// To L1.5 : Valid Control/Data
output [38:3]	spu_l15_addr;			// To L1.5 : Address
output [12:0]	spu_l15_cpkt;			// To L1.5 : Control portion of PCX packet
output [63:0]	spu_l15_data;			// To L1.5 : Store data

output		spu_mult_request;		// To FGU  : Multiply Request
output [63:0]	spu_fgu_rs1_e;			// To FGU  : Multiply RS1
output [63:0]	spu_fgu_rs2_e;			// To FGU  : Multiply RS2
output [6:0]	spu_fgu_fpy_ctl_d;		// To FGU  : SPU control bus for crypto multiply ops

output [4:0]	spu_pmu_cwq_busy;		// To PMU  : CWQ busy {rc4,hash,des,crc,aes}
output [2:0]	spu_pmu_cwq_tid;		// To PMU  : CWQ tid
output [3:0]	spu_pmu_ma_busy;		// To PMU  : Ma  busy

output		spu_tlu_cwq_busy;		// To TLU  : Prevents core from parking
output [3:0]	spu_tlu_cwq_int_req;		// To TLU  : [3] == valid; [2:0] == TID;
output [4:0]	spu_tlu_ma_int_req;		// To TLU  : Int req when MA op completes {4 -  error; 3 - req valid; 2:0 - TID}
output [10:0]	spu_tlu_mamu_err_req;		// was: 14 - valid; 13:11 - TID; 10 - ma port; 9:8 - syndrome; 7:0 - MA index
						// now: share 14..11 with tlu_ma_int_req; bits 10:0 stay the same
output [5:0]	spu_tlu_l2_error;		// To TLU  : L2 Error reporting : {MAL2C,MAL2U,MAL2ND,CWQL2C,CWQL2U,CWQL2ND}


//----- this module is blackboxed.

   assign 	scan_out = scan_in;        // SCAN
   
   assign 	spu_mbi_arf_fail_=1'b1;    // MBIST
   assign 	spu_mbi_mam_fail2_=1'b1;   // MBIST
   assign 	spu_mbi_mam_fail_=1'b1;    // MBIST
   assign 	spu_mbi_rrf_fail_=1'b1;    // MBIST
   
   reg [64:0] 	in_rngl_cdbus_d1;          // ASI ring
   reg [64:0] 	in_rngl_cdbus_d2;          // ASI ring

//nasim
`ifdef OPENSPARC_CMP
   reg l2clk_nba;
   always @(l2clk) l2clk_nba <= l2clk;
   always @(l2clk_nba)
`else
   always @(l2clk)
`endif
     begin
	in_rngl_cdbus_d1=in_rngl_cdbus;
	in_rngl_cdbus_d2=in_rngl_cdbus_d1;
     end	

   assign spu_rngl_cdbus=in_rngl_cdbus_d2; // ASI ring

   assign spu_mult_request=1'b0;	// To FGU  : Multiply Request
   assign spu_fgu_rs1_e=64'b0;	 	// To FGU  : Multiply RS1
   assign spu_fgu_rs2_e=64'b0;	 	// To FGU  : Multiply RS2
   assign spu_fgu_fpy_ctl_d=7'b0;	// To FGU  : SPU control bus for crypto multiply ops

   assign spu_l15_valid=1'b0;		// To L1.5 : Valid Control/Data
   assign spu_l15_addr[38:3] =36'b0;		// To L1.5 : Address
   assign spu_l15_data=64'b0;		// To L1.5 : Store data
   assign spu_l15_cpkt=13'b0;		// To L1.5 : Control portion of PCX packet
   
   assign spu_pmu_cwq_tid=3'b0;		// To PMU  : CWQ tid
   assign spu_pmu_ma_busy=4'b0;		// To PMU  : Ma  busy
   assign spu_pmu_cwq_busy=5'b0;	// To PMU  : CWQ busy {rc4,hash,des,crc,aes}

   assign spu_tlu_cwq_busy=1'b0;	// To TLU  : Prevents core from parking
   assign spu_tlu_mamu_err_req=11'b0;	// was: 14 - valid; 13:11 - TID; 10 - ma port; 9:8 - syndrome; 7:0 - MA index
   assign spu_tlu_cwq_int_req=4'b0;	// To TLU  : [3] == valid; [2:0] == TID;
   assign spu_tlu_ma_int_req=5'b0;	// To TLU  : Int req when MA op completes {4 -  error; 3 - req valid; 2:0 - TID}
   assign spu_tlu_l2_error=6'b0;	// To TLU  : L2 Error reporting : {MAL2C,MAL2U,MAL2ND,CWQL2C,CWQL2U,CWQL2ND}
   
endmodule

