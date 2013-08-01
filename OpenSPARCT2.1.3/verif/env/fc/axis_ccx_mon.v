// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: axis_ccx_mon.v
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
  module axis_cmp_mon (
		      clk,
		      reset96,
		      spc_pcx_req_pq,
		      pcx_spc_grant_px,
		      spc_pcx_atom_pq,
		      spc_pcx_data_pa,
		      cpx_spc_data_cx2,

		      CLK_CNT, 
		      core_mask,
		      core_id,
		      en_status,
		      pcx_cpx_en,
		      pcx_cpx_short,
		      pcx_cpx_io,
		      watch_dog_finish 
		 );


   input              clk;
   input              reset96;
   input  [  8:0]     spc_pcx_req_pq;
   input  [  8:0]     pcx_spc_grant_px;
   input  [  8:0]     spc_pcx_atom_pq;
   input  [129:0]     spc_pcx_data_pa;
   input  [145:0]     cpx_spc_data_cx2;
   input  [ 39:0]     CLK_CNT;
   input  [  7:0]     core_mask;
   input  [  2:0]     core_id;
   input              en_status;
   input              pcx_cpx_en;
   input              pcx_cpx_short;  
   input	      pcx_cpx_io;

   output             watch_dog_finish;



reg  [15:0] WDOG0, WDOG1, WDOG2, WDOG3, WDOG4,WDOG5,WDOG6,WDOG7;
reg         WDOG_IDLE0, WDOG_IDLE1, WDOG_IDLE2, WDOG_IDLE3 , WDOG_IDLE4, WDOG_IDLE5, WDOG_IDLE6, WDOG_IDLE7;

reg         REQ_CY;
reg         ERROR_BANK;
reg [1:0]   REQ_OUTSTANDING0;
reg [1:0]   REQ_OUTSTANDING1;
reg [1:0]   REQ_OUTSTANDING2;
reg [1:0]   REQ_OUTSTANDING3;
reg [1:0]   REQ_OUTSTANDING4;
reg [1:0]   REQ_OUTSTANDING5;
reg [1:0]   REQ_OUTSTANDING6;
reg [1:0]   REQ_OUTSTANDING7;
reg [1:0]   REQ_OUTSTANDING8;
reg [63:0]   CONSOLE_DATA;

reg [3:0] HYP_WATCH_CNT;
reg [1:0] HYP_WATCH_ITER;

reg [2:0]   core_id_r;
reg [8:0]   tlu_early_ttype_g_r;
reg [1:0]   true_trap_tid_g_r;
reg [2:0]   trp_lvl_r;
reg [ 48:0] tlu_restore_pc_w1_r;
reg [129:0] spc_pcx_data_pa_r;
reg [145:0] cpx_spc_data_cx2_r;


/*******************************************************************************************************************
*    This logic makes sure threads are not inactive for more than 8K cycles.
*******************************************************************************************************************/
wire   wdog_fwdv  = (spc_pcx_data_pa[122:119] == 4'h6);

`ifdef CMP_IOBDG
wire   wdog_clk = (CLK_CNT > 190000); 
`else 
wire   wdog_clk = (CLK_CNT > 20000);
`endif

wire   wdog_reqv0 = spc_pcx_data_pa[129] & (spc_pcx_data_pa[119:117] == 3'b000) & ~wdog_fwdv & wdog_clk & core_mask[0];
wire   wdog_reqv1 = spc_pcx_data_pa[129] & (spc_pcx_data_pa[119:117] == 3'b001) & ~wdog_fwdv & wdog_clk & core_mask[1];
wire   wdog_reqv2 = spc_pcx_data_pa[129] & (spc_pcx_data_pa[119:117] == 3'b010) & ~wdog_fwdv & wdog_clk & core_mask[2];
wire   wdog_reqv3 = spc_pcx_data_pa[129] & (spc_pcx_data_pa[119:117] == 3'b011) & ~wdog_fwdv & wdog_clk & core_mask[3];
wire   wdog_reqv4 = spc_pcx_data_pa[129] & (spc_pcx_data_pa[119:117] == 3'b100) & ~wdog_fwdv & wdog_clk & core_mask[4];
wire   wdog_reqv5 = spc_pcx_data_pa[129] & (spc_pcx_data_pa[119:117] == 3'b101) & ~wdog_fwdv & wdog_clk & core_mask[5];
wire   wdog_reqv6 = spc_pcx_data_pa[129] & (spc_pcx_data_pa[119:117] == 3'b110) & ~wdog_fwdv & wdog_clk & core_mask[6];
wire   wdog_reqv7 = spc_pcx_data_pa[129] & (spc_pcx_data_pa[119:117] == 3'b111) & ~wdog_fwdv & wdog_clk & core_mask[7];

wire   wdog_intv0 = (cpx_spc_data_cx2[145:141] == 5'h17) & ~cpx_spc_data_cx2[137] & (cpx_spc_data_cx2[9:8] == 2'b00) & core_mask[0];
wire   wdog_intv1 = (cpx_spc_data_cx2[145:141] == 5'h17) & ~cpx_spc_data_cx2[137] & (cpx_spc_data_cx2[9:8] == 2'b01) & core_mask[1];
wire   wdog_intv2 = (cpx_spc_data_cx2[145:141] == 5'h17) & ~cpx_spc_data_cx2[137] & (cpx_spc_data_cx2[9:8] == 2'b10) & core_mask[2];
wire   wdog_intv3 = (cpx_spc_data_cx2[145:141] == 5'h17) & ~cpx_spc_data_cx2[137] & (cpx_spc_data_cx2[9:8] == 2'b11) & core_mask[3];
wire   wdog_intv4 = (cpx_spc_data_cx2[145:141] == 5'h17) & ~cpx_spc_data_cx2[137] & (cpx_spc_data_cx2[9:8] == 2'b11) & core_mask[4];
wire   wdog_intv5 = (cpx_spc_data_cx2[145:141] == 5'h17) & ~cpx_spc_data_cx2[137] & (cpx_spc_data_cx2[9:8] == 2'b11) & core_mask[5];
wire   wdog_intv6 = (cpx_spc_data_cx2[145:141] == 5'h17) & ~cpx_spc_data_cx2[137] & (cpx_spc_data_cx2[9:8] == 2'b11) & core_mask[6];
wire   wdog_intv7 = (cpx_spc_data_cx2[145:141] == 5'h17) & ~cpx_spc_data_cx2[137] & (cpx_spc_data_cx2[9:8] == 2'b11) & core_mask[7];

wire [15:0]   wdog0p = wdog_reqv0         ? 16'hFFFF :
		      (WDOG0 == 16'h0000) ? 16'h0000 :
		       WDOG_IDLE0         ? WDOG0    : ((WDOG0 - 1'b1) & 16'hFFFF);
wire [15:0]   wdog1p = wdog_reqv1         ? 16'hFFFF :
		      (WDOG1 == 16'h0000) ? 16'h0000 :
		       WDOG_IDLE1         ? WDOG1    : ((WDOG1 - 1'b1) & 16'hFFFF);
wire [15:0]   wdog2p = wdog_reqv2         ? 16'hFFFF :
		      (WDOG2 == 16'h0000) ? 16'h0000 :
		       WDOG_IDLE2         ? WDOG2    : ((WDOG2 - 1'b1) & 16'hFFFF);
wire [15:0]   wdog3p = wdog_reqv3         ? 16'hFFFF :
		      (WDOG3 == 16'h0000) ? 16'h0000 :
		       WDOG_IDLE3         ? WDOG3    : ((WDOG3 - 1'b1) & 16'hFFFF);
wire [15:0]   wdog4p = wdog_reqv4         ? 16'hFFFF :
		      (WDOG4 == 16'h0000) ? 16'h0000 :
		       WDOG_IDLE4         ? WDOG4    : ((WDOG4 - 1'b1) & 16'hFFFF);
wire [15:0]   wdog5p = wdog_reqv5         ? 16'hFFFF :
		      (WDOG5 == 16'h0000) ? 16'h0000 :
		       WDOG_IDLE5         ? WDOG5    : ((WDOG5 - 1'b1) & 16'hFFFF);
wire [15:0]   wdog6p = wdog_reqv6         ? 16'hFFFF :
		      (WDOG6 == 16'h0000) ? 16'h0000 :
		       WDOG_IDLE6         ? WDOG6    : ((WDOG6 - 1'b1) & 16'hFFFF);
wire [15:0]   wdog7p = wdog_reqv7         ? 16'hFFFF :
		      (WDOG7 == 16'h0000) ? 16'h0000 :
		       WDOG_IDLE7         ? WDOG7    : ((WDOG7 - 1'b1) & 16'hFFFF);

wire          wdog_idle0p =  wdog_intv0 ? (cpx_spc_data_cx2[17:16] == 2'b10) : WDOG_IDLE0;
wire          wdog_idle1p =  wdog_intv1 ? (cpx_spc_data_cx2[17:16] == 2'b10) : WDOG_IDLE1;
wire          wdog_idle2p =  wdog_intv2 ? (cpx_spc_data_cx2[17:16] == 2'b10) : WDOG_IDLE2;
wire          wdog_idle3p =  wdog_intv3 ? (cpx_spc_data_cx2[17:16] == 2'b10) : WDOG_IDLE3;
wire          wdog_idle4p =  wdog_intv4 ? (cpx_spc_data_cx2[17:16] == 2'b10) : WDOG_IDLE4;
wire          wdog_idle5p =  wdog_intv5 ? (cpx_spc_data_cx2[17:16] == 2'b10) : WDOG_IDLE4;
wire          wdog_idle6p =  wdog_intv6 ? (cpx_spc_data_cx2[17:16] == 2'b10) : WDOG_IDLE5;
wire          wdog_idle7p =  wdog_intv7 ? (cpx_spc_data_cx2[17:16] == 2'b10) : WDOG_IDLE7;

/*******************************************************************************************************************
*    This logic checks that each core has at most two request outstanding to each bank at the same time.
*******************************************************************************************************************/
wire           req_cyP   =(
			   (spc_pcx_req_pq[8] & ~((REQ_OUTSTANDING8 == 2'b10) & ~pcx_spc_grant_px[8])) |
			   (spc_pcx_req_pq[7] & ~((REQ_OUTSTANDING7 == 2'b10) & ~pcx_spc_grant_px[7])) |
			   (spc_pcx_req_pq[6] & ~((REQ_OUTSTANDING6 == 2'b10) & ~pcx_spc_grant_px[6])) |
			   (spc_pcx_req_pq[5] & ~((REQ_OUTSTANDING5 == 2'b10) & ~pcx_spc_grant_px[5])) |
			   (spc_pcx_req_pq[4] & ~((REQ_OUTSTANDING4 == 2'b10) & ~pcx_spc_grant_px[4])) |
			   (spc_pcx_req_pq[3] & ~((REQ_OUTSTANDING3 == 2'b10) & ~pcx_spc_grant_px[3])) |
			   (spc_pcx_req_pq[2] & ~((REQ_OUTSTANDING2 == 2'b10) & ~pcx_spc_grant_px[2])) |
			   (spc_pcx_req_pq[1] & ~((REQ_OUTSTANDING1 == 2'b10) & ~pcx_spc_grant_px[1])) |
			   (spc_pcx_req_pq[0] & ~((REQ_OUTSTANDING0 == 2'b10) & ~pcx_spc_grant_px[0])));

wire [1:0] req_outstanding0p =  (spc_pcx_atom_pq[0] &      spc_pcx_req_pq[0]) ? 2'b10 :
			       ~(pcx_spc_grant_px[0] ^ (spc_pcx_req_pq[0] & req_cyP)) ? REQ_OUTSTANDING0[1:0] :
				 pcx_spc_grant_px[0] ? (REQ_OUTSTANDING0[1:0] - 2'h1) :
						       (REQ_OUTSTANDING0[1:0] + 2'h1);
wire [1:0] req_outstanding1p =  (spc_pcx_atom_pq[1] &      spc_pcx_req_pq[1]) ? 2'b10 :
			       ~(pcx_spc_grant_px[1] ^ (spc_pcx_req_pq[1] & req_cyP)) ? REQ_OUTSTANDING1[1:0] :
				 pcx_spc_grant_px[1] ? (REQ_OUTSTANDING1[1:0] - 2'h1) :
						       (REQ_OUTSTANDING1[1:0] + 2'h1);
wire [1:0] req_outstanding2p =  (spc_pcx_atom_pq[2] &      spc_pcx_req_pq[2]) ? 2'b10 :
			       ~(pcx_spc_grant_px[2] ^ (spc_pcx_req_pq[2] & req_cyP)) ? REQ_OUTSTANDING2[1:0] :
				 pcx_spc_grant_px[2] ? (REQ_OUTSTANDING2[1:0] - 2'h1) :
						       (REQ_OUTSTANDING2[1:0] + 2'h1);
wire [1:0] req_outstanding3p =  (spc_pcx_atom_pq[3] &      spc_pcx_req_pq[3]) ? 2'b10 :
			       ~(pcx_spc_grant_px[3] ^ (spc_pcx_req_pq[3] & req_cyP)) ? REQ_OUTSTANDING3[1:0] :
				 pcx_spc_grant_px[3] ? (REQ_OUTSTANDING3[1:0] - 2'h1) :
						       (REQ_OUTSTANDING3[1:0] + 2'h1);
/*{{{  */
wire [1:0] req_outstanding4p =  (spc_pcx_atom_pq[4] &      spc_pcx_req_pq[4]) ? 2'b10 :
			       ~(pcx_spc_grant_px[4] ^ (spc_pcx_req_pq[4] & req_cyP)) ? REQ_OUTSTANDING4[1:0] :
				 pcx_spc_grant_px[4] ? (REQ_OUTSTANDING4[1:0] - 2'h1) :
						       (REQ_OUTSTANDING4[1:0] + 2'h1);
/*}}}  */
/*{{{  */
wire [1:0] req_outstanding5p =  (spc_pcx_atom_pq[5] &      spc_pcx_req_pq[5]) ? 2'b10 :
			       ~(pcx_spc_grant_px[5] ^ (spc_pcx_req_pq[5] & req_cyP)) ? REQ_OUTSTANDING5[1:0] :
				 pcx_spc_grant_px[5] ? (REQ_OUTSTANDING5[1:0] - 2'h1) :
						       (REQ_OUTSTANDING5[1:0] + 2'h1);
/*}}}  */
/*{{{  */
wire [1:0] req_outstanding6p =  (spc_pcx_atom_pq[6] &      spc_pcx_req_pq[6]) ? 2'b10 :
			       ~(pcx_spc_grant_px[6] ^ (spc_pcx_req_pq[6] & req_cyP)) ? REQ_OUTSTANDING6[1:0] :
				 pcx_spc_grant_px[6] ? (REQ_OUTSTANDING6[1:0] - 2'h1) :
						       (REQ_OUTSTANDING6[1:0] + 2'h1);
/*}}}  */
/*{{{  */
wire [1:0] req_outstanding7p =  (spc_pcx_atom_pq[7] &      spc_pcx_req_pq[7]) ? 2'b10 :
			       ~(pcx_spc_grant_px[7] ^ (spc_pcx_req_pq[7] & req_cyP)) ? REQ_OUTSTANDING7[1:0] :
				 pcx_spc_grant_px[7] ? (REQ_OUTSTANDING7[1:0] - 2'h1) :
						       (REQ_OUTSTANDING7[1:0] + 2'h1);
/*}}}  */
/*{{{  */
wire [1:0] req_outstanding8p =  (spc_pcx_atom_pq[8] &      spc_pcx_req_pq[8]) ? 2'b10 :
			       ~(pcx_spc_grant_px[8] ^ (spc_pcx_req_pq[8] & req_cyP)) ? REQ_OUTSTANDING8[1:0] :
				 pcx_spc_grant_px[8] ? (REQ_OUTSTANDING8[1:0] - 2'h1) :
						       (REQ_OUTSTANDING8[1:0] + 2'h1);
/*}}}  */

wire  error_bankP = ((&REQ_OUTSTANDING0)|(&REQ_OUTSTANDING1)|
		     (&REQ_OUTSTANDING2)|(&REQ_OUTSTANDING3)|
		     (&REQ_OUTSTANDING4)|(&REQ_OUTSTANDING5)|
		     (&REQ_OUTSTANDING6)|(&REQ_OUTSTANDING7)|
		     (&REQ_OUTSTANDING8)); // 0in val -val 0


/*******************************************************************************************************************
*    This is the bus display logic
*******************************************************************************************************************/
wire istor_req = REQ_CY & (spc_pcx_data_pa[129:124] == 6'b100001);
wire ifill_req = REQ_CY & (spc_pcx_data_pa[129:124] == 6'b110000);
wire ifprl_req = REQ_CY & (spc_pcx_data_pa[129:124] == 6'b101010);
wire iload_req = REQ_CY & (spc_pcx_data_pa[129:124] == 6'b100000) & ~spc_pcx_data_pa[115];
wire ilstm_req = REQ_CY & (spc_pcx_data_pa[129:124] == 6'b100000) &  spc_pcx_data_pa[115];
wire icasa1_req = REQ_CY & (spc_pcx_data_pa[129:124] == 6'b100010);
wire icasa2_req = REQ_CY & (spc_pcx_data_pa[129:124] == 6'b100011);
wire iswap_req = REQ_CY & (spc_pcx_data_pa[129:124] == 6'b100111);

wire error_ack = (cpx_spc_data_cx2[145:141] == 5'b11100);
wire load_ack  = (cpx_spc_data_cx2[145:141] == 5'b10000);
wire fill_ack  = (cpx_spc_data_cx2[145:141] == 5'b10001);
wire stor_ack  = (cpx_spc_data_cx2[145:141] == 5'b10100);
wire evict     = (cpx_spc_data_cx2[145:141] == 5'b10011);

wire hyperv_console =  ((istor_req) & ((spc_pcx_data_pa[103:64] == 40'h1f00000000) |
				       (spc_pcx_data_pa[103:64] == 40'hfff0c2c000)));

wire guest0_console =  ((istor_req) & (spc_pcx_data_pa[103:64] == 40'h1f10002000));
wire guest1_console =  ((istor_req) & (spc_pcx_data_pa[103:64] == 40'h1f10004000));
wire guest2_console =  ((istor_req) & (spc_pcx_data_pa[103:64] == 40'h1f10006000));
wire guest3_console =  ((istor_req) & (spc_pcx_data_pa[103:64] == 40'h1f10008000));

wire [3:0] hyp_watch_cntP = ~hyperv_console ? HYP_WATCH_CNT :
			    (HYP_WATCH_CNT == 0) ? ((spc_pcx_data_pa[7:0] == 8'h57) ? 8'h01 : 8'h0) :
			    (HYP_WATCH_CNT == 1) ? ((spc_pcx_data_pa[7:0] == 8'h41) ? 8'h02 : 8'h0) :
			    (HYP_WATCH_CNT == 2) ? ((spc_pcx_data_pa[7:0] == 8'h54) ? 8'h03 : 8'h0) :
			    (HYP_WATCH_CNT == 3) ? ((spc_pcx_data_pa[7:0] == 8'h43) ? 8'h04 : 8'h0) :
			    (HYP_WATCH_CNT == 4) ? ((spc_pcx_data_pa[7:0] == 8'h48) ? 8'h05 : 8'h0) :
			    (HYP_WATCH_CNT == 5) ? ((spc_pcx_data_pa[7:0] == 8'h44) ? 8'h06 : 8'h0) :
			    (HYP_WATCH_CNT == 6) ? ((spc_pcx_data_pa[7:0] == 8'h4F) ? 8'h07 : 8'h0) :
			    (HYP_WATCH_CNT == 7) ? ((spc_pcx_data_pa[7:0] == 8'h47) ? 8'hff : 8'h0) : 8'h00;

wire [1:0] hyp_watch_iterP = (hyperv_console & (HYP_WATCH_CNT == 8'hff)) ? (HYP_WATCH_ITER + 1) : HYP_WATCH_ITER;

assign watch_dog_finish = (HYP_WATCH_ITER == 2'b11);

always @(posedge clk) begin

  WDOG0 <= (reset96) ? 16'h0 : wdog0p;
  WDOG1 <= (reset96) ? 16'h0 : wdog1p;
  WDOG2 <= (reset96) ? 16'h0 : wdog2p;
  WDOG3 <= (reset96) ? 16'h0 : wdog3p;
  WDOG4 <= (reset96) ? 16'h0 : wdog3p;
  WDOG5 <= (reset96) ? 16'h0 : wdog3p;
  WDOG6 <= (reset96) ? 16'h0 : wdog3p;
  WDOG7 <= (reset96) ? 16'h0 : wdog3p;

  WDOG_IDLE0 <= (reset96) ? 1'b0 : wdog_idle0p;
  WDOG_IDLE1 <= (reset96) ? 1'b0 : wdog_idle1p;
  WDOG_IDLE2 <= (reset96) ? 1'b0 : wdog_idle2p;
  WDOG_IDLE3 <= (reset96) ? 1'b0 : wdog_idle3p;
  WDOG_IDLE4 <= (reset96) ? 1'b0 : wdog_idle4p;
  WDOG_IDLE5 <= (reset96) ? 1'b0 : wdog_idle5p;
  WDOG_IDLE6 <= (reset96) ? 1'b0 : wdog_idle6p;
  WDOG_IDLE7 <= (reset96) ? 1'b0 : wdog_idle7p;

  HYP_WATCH_CNT <= (reset96) ? 4'h0 : hyp_watch_cntP;
  HYP_WATCH_ITER <= (reset96) ? 2'b0 : hyp_watch_iterP;

`ifdef AXIS
  begin
    if ((WDOG0 == 16'b1)) begin // axis tbcall_region
     $display(" WATCH_DOG%h_0 %d",core_id_r, $time);
    end
    if ((WDOG1 == 16'b1)) begin // axis tbcall_region
     $display(" WATCH_DOG%h_1 %d",core_id_r, $time);
    end
    if ((WDOG2 == 16'b1)) begin // axis tbcall_region
     $display(" WATCH_DOG%h_2 %d",core_id_r, $time);
    end
    if ((WDOG3 == 16'b1)) begin // axis tbcall_region
     $display(" WATCH_DOG%h_3 %d",core_id_r, $time);
    end
    if ((WDOG4 == 16'b1)) begin // axis tbcall_region
     $display(" WATCH_DOG%h_4 %d",core_id_r, $time);
    end
    if ((WDOG5 == 16'b1)) begin // axis tbcall_region
     $display(" WATCH_DOG%h_5 %d",core_id_r, $time);
    end
    if ((WDOG6 == 16'b1)) begin // axis tbcall_region
     $display(" WATCH_DOG%h_6 %d",core_id_r, $time);
    end
    if ((WDOG7 == 16'b1)) begin // axis tbcall_region
     $display(" WATCH_DOG%h_7 %d",core_id_r, $time);
    end
  end
`else
  begin
    if ((wdog0p == 16'b1)) begin
     $display(" WATCH_DOG%h_0 %d",core_id, CLK_CNT);
    end
    if ((wdog1p == 16'b1)) begin
     $display(" WATCH_DOG%h_1 %d",core_id, CLK_CNT);
    end
    if ((wdog2p == 16'b1)) begin
     $display(" WATCH_DOG%h_2 %d",core_id, CLK_CNT);
    end
    if ((wdog3p == 16'b1)) begin
     $display(" WATCH_DOG%h_3 %d",core_id, CLK_CNT);
    end
  end
`endif

  begin
    if (wdog_intv0) begin 
     $display(" RESUME%h_0 %h %d",core_id, cpx_spc_data_cx2[17:16], CLK_CNT);
    end
    if (wdog_intv1) begin 
     $display(" RESUME%h_1 %h %d",core_id, cpx_spc_data_cx2[17:16], CLK_CNT);
    end
    if (wdog_intv2) begin 
     $display(" RESUME%h_2 %h %d",core_id, cpx_spc_data_cx2[17:16], CLK_CNT);
    end
    if (wdog_intv3) begin 
     $display(" RESUME%h_3 %h %d",core_id, cpx_spc_data_cx2[17:16], CLK_CNT);
    end
  end

  REQ_CY <= (reset96) ? 1'b0 : req_cyP;

  REQ_OUTSTANDING0 <= (reset96) ? 2'b00 : req_outstanding0p[1:0];
  REQ_OUTSTANDING1 <= (reset96) ? 2'b00 : req_outstanding1p[1:0];
  REQ_OUTSTANDING2 <= (reset96) ? 2'b00 : req_outstanding2p[1:0];
  REQ_OUTSTANDING3 <= (reset96) ? 2'b00 : req_outstanding3p[1:0];
  REQ_OUTSTANDING4 <= (reset96) ? 2'b00 : req_outstanding4p[1:0];
  REQ_OUTSTANDING5 <= (reset96) ? 2'b00 : req_outstanding5p[1:0];
  REQ_OUTSTANDING6 <= (reset96) ? 2'b00 : req_outstanding6p[1:0];
  REQ_OUTSTANDING7 <= (reset96) ? 2'b00 : req_outstanding7p[1:0];
  REQ_OUTSTANDING8 <= (reset96) ? 2'b00 : req_outstanding8p[1:0];

  ERROR_BANK       <= (reset96) ? 1'b0 : error_bankP;

  core_id_r           <= core_id;
  spc_pcx_data_pa_r   <= spc_pcx_data_pa;
  cpx_spc_data_cx2_r  <= cpx_spc_data_cx2;

  begin
    if (ERROR_BANK)
    begin // axis tbcall_region
     $display(" ERROR%h: MORE THAN TWO REQUESTS FROM A CORE TO A BANK ON CYCLE %d",core_id_r, $time);
    end
  end

`ifdef AXIS
  if (istor_req & pcx_cpx_en) 
    begin // axis tbcall_region
$display(" STOR%h_%h  %d       %h_%h_%h", core_id_r, spc_pcx_data_pa_r[119:117],
		       $time, spc_pcx_data_pa_r[129:104], spc_pcx_data_pa_r[103:64], spc_pcx_data_pa_r[63:0]);
    end
  if (ifill_req & pcx_cpx_en) 
    begin // axis tbcall_region
$display(" FILL%h_%h  %d       %h_%h_%h", core_id_r, spc_pcx_data_pa_r[119:117],
		       $time, spc_pcx_data_pa_r[129:104], spc_pcx_data_pa_r[103:64], spc_pcx_data_pa_r[63:0]);
    end
  if (iload_req & pcx_cpx_en) 
    begin // axis tbcall_region
$display(" LOAD%h_%h  %d       %h_%h_%h", core_id_r, spc_pcx_data_pa_r[119:117],
		       $time, spc_pcx_data_pa_r[129:104], spc_pcx_data_pa_r[103:64], spc_pcx_data_pa_r[63:0]);
    end
  if (ilstm_req & pcx_cpx_en) 
    begin // axis tbcall_region
$display(" LSTM%h_%h  %d       %h_%h_%h", core_id_r, spc_pcx_data_pa_r[119:117],
		       $time, spc_pcx_data_pa_r[129:104], spc_pcx_data_pa_r[103:64], spc_pcx_data_pa_r[63:0]);
    end
  if (ifprl_req & pcx_cpx_en) 
    begin // axis tbcall_region
$display(" FP  %h_%h  %d       %h_%h_%h", core_id_r, spc_pcx_data_pa_r[119:117],
		       $time, spc_pcx_data_pa_r[129:104], spc_pcx_data_pa_r[103:64], spc_pcx_data_pa_r[63:0]);
    end
  if (icasa1_req & pcx_cpx_en) 
    begin // axis tbcall_region
$display(" CAS1  %h_%h  %d       %h_%h_%h", core_id_r, spc_pcx_data_pa_r[119:117],
		       $time, spc_pcx_data_pa_r[129:104], spc_pcx_data_pa_r[103:64], spc_pcx_data_pa_r[63:0]);
    end
  if (icasa2_req & pcx_cpx_en) 
    begin // axis tbcall_region
$display(" CAS2  %h_%h  %d       %h_%h_%h", core_id_r, spc_pcx_data_pa_r[119:117],
		       $time, spc_pcx_data_pa_r[129:104], spc_pcx_data_pa_r[103:64], spc_pcx_data_pa_r[63:0]);
    end
  if (load_ack & pcx_cpx_en)  
    begin // axis tbcall_region
$display(" LACK%h_%h  %d                                       %h_%h_%h", core_id_r, cpx_spc_data_cx2_r[136:134],
		       $time, cpx_spc_data_cx2_r[145:128], cpx_spc_data_cx2_r[127:64],cpx_spc_data_cx2_r[63:0]);
    end
  if (fill_ack & pcx_cpx_en)  
    begin // axis tbcall_region
$display(" FACK%h_%h  %d                                       %h_%h_%h", core_id_r, cpx_spc_data_cx2_r[136:134],
		       $time, cpx_spc_data_cx2_r[145:128], cpx_spc_data_cx2_r[127:64],cpx_spc_data_cx2_r[63:0]);
    end
  if (stor_ack & pcx_cpx_en)  
    begin // axis tbcall_region
$display(" SACK%h_%h  %d                                       %h_%h_%h", core_id_r, cpx_spc_data_cx2_r[136:134],
		       $time, cpx_spc_data_cx2_r[145:128], cpx_spc_data_cx2_r[127:64],cpx_spc_data_cx2_r[63:0]);
    end
  if (evict & pcx_cpx_en)  
    begin // axis tbcall_region
$display(" EVICT%h_0 %h_1 %h_2 %h_3  %d                        %h_%h_%h", core_id_r,
										     core_id_r,
										     core_id_r,
										     core_id_r,
		       $time, cpx_spc_data_cx2_r[145:128], cpx_spc_data_cx2_r[127:64],cpx_spc_data_cx2_r[63:0]);
    end
  if (error_ack & pcx_cpx_en) 
    begin // axis tbcall_region
$display(" EACK%h  %d", core_id_r, $time);
    end

`else
  if (istor_req) $display(" STOR%h_%h  %d       %h", core_id, spc_pcx_data_pa[119:117], CLK_CNT, spc_pcx_data_pa[123:0]);
  if (ifill_req) $display(" FILL%h_%h  %d       %h", core_id, spc_pcx_data_pa[119:117], CLK_CNT, spc_pcx_data_pa[123:0]);
  if (iload_req) $display(" LOAD%h_%h  %d       %h", core_id, spc_pcx_data_pa[119:117], CLK_CNT, spc_pcx_data_pa[123:0]);
  if (ilstm_req) $display(" LSTM%h_%h  %d       %h", core_id, spc_pcx_data_pa[119:117], CLK_CNT, spc_pcx_data_pa[123:0]);
  if (ifprl_req) $display(" FP  %h_%h  %d       %h", core_id, spc_pcx_data_pa[119:117], CLK_CNT, spc_pcx_data_pa[123:0]);

  if (load_ack)  $display(" LACK%h_%h  %d                                       %h", core_id, cpx_spc_data_cx2[136:134],
										CLK_CNT,      cpx_spc_data_cx2[145:0]);
  if (fill_ack)  $display(" FACK%h_%h  %d                                       %h", core_id, cpx_spc_data_cx2[136:134],
										CLK_CNT,      cpx_spc_data_cx2[145:0]);
  if (stor_ack)  $display(" SACK%h_%h  %d                                       %h", core_id, cpx_spc_data_cx2[136:134],
										CLK_CNT,      cpx_spc_data_cx2[145:0]);

  if (evict   )  $display(" EVICT%h_0 %h_1 %h_2 %h_3  %d                        %h", core_id, 
										     core_id,
										     core_id,
										     core_id,
										CLK_CNT, cpx_spc_data_cx2[145:0]);

  if (error_ack) $display(" EACK%h  %d", core_id, CLK_CNT);
`endif

`ifdef AXIS
//  if (REQ_CY & pcx_cpx_short) 
  if (REQ_CY & pcx_cpx_short || (REQ_CY & spc_pcx_data_pa[103] & pcx_cpx_io)) 
    begin // axis tbcall_region
$display("PCX%h_%h %d %h_%h_%h", core_id_r, spc_pcx_data_pa_r[119:117], $time, spc_pcx_data_pa_r[129:104],
						  spc_pcx_data_pa_r[103:64],spc_pcx_data_pa_r[63:0]);
    end

  if (cpx_spc_data_cx2[145] & pcx_cpx_short)
    begin // axis tbcall_region
$display("CPX%h_%h %d %h_%h_%h", core_id_r, cpx_spc_data_cx2_r[136:134], $time, cpx_spc_data_cx2_r[145:128],
						  cpx_spc_data_cx2_r[127:64],cpx_spc_data_cx2_r[63:0]);
    end
`else
  if (REQ_CY & pcx_cpx_short) 
    begin // axis tbcall_region
$display("PCX%h_%h %d %h_%h_%h", core_id, spc_pcx_data_pa_r[119:117], CLK_CNT, spc_pcx_data_pa[129:104],
						spc_pcx_data_pa[103:64],spc_pcx_data_pa[63:0]);
    end

  if (cpx_spc_data_cx2[145] & pcx_cpx_short)
    begin // axis tbcall_region
$display("CPX%h_%h %d %h_%h_%h", core_id, cpx_spc_data_cx2_r[136:134], CLK_CNT, cpx_spc_data_cx2[145:128],
						cpx_spc_data_cx2[127:64],cpx_spc_data_cx2[63:0]);
    end
`endif


`ifdef AXIS
  begin
    CONSOLE_DATA <= spc_pcx_data_pa[63:0];

    if (hyperv_console)
    begin // axis tbcall_region
     $display("%h HYPERVISOR CONSOLE%h_%h %h",CLK_CNT, core_id_r, 
				    spc_pcx_data_pa_r[119:117], CONSOLE_DATA[7:0]);
    end
    if (guest0_console)
    begin // axis tbcall_region
     $display("%h GUEST0     CONSOLE%h_%h %h",CLK_CNT,core_id_r,
				    spc_pcx_data_pa_r[119:117], CONSOLE_DATA[7:0]);
    end
    if (guest1_console)
    begin // axis tbcall_region
     $display("%h GUEST1     CONSOLE%h_%h %h",CLK_CNT,core_id_r,
				    spc_pcx_data_pa_r[119:117], CONSOLE_DATA[7:0]);
    end
    if (guest2_console)
    begin // axis tbcall_region
     $display("%h GUEST2     CONSOLE%h_%h %h",CLK_CNT,core_id_r,
				    spc_pcx_data_pa_r[119:117], CONSOLE_DATA[7:0]);
    end
    if (guest3_console)
    begin // axis tbcall_region
     $display("%h GUEST3     CONSOLE%h_%h %h",CLK_CNT,core_id_r,
				    spc_pcx_data_pa_r[119:117], CONSOLE_DATA[7:0]);
    end
  end
`else
  begin
    if (hyperv_console)
    begin // axis tbcall_region
     $display("%h HYPERVISOR CONSOLE%h_0 %h",CLK_CNT,core_id, spc_pcx_data_pa[7:0]);
    end
  end
`endif

end


  endmodule 

 module axis_io_mon (
                      clk,
                      reset96,
                      io_cpx_data_ca,
		      io_cpx_req_cq,
		      io_pcx_stall_pq,
		      cpx_io_grant_cx,

                      CLK_CNT,
                      core_mask,
                      core_id,
                      en_status,
                      pcx_cpx_en,
                      pcx_cpx_short,
                      pcx_cpx_io,
                      watch_dog_finish
                 );


   input              clk;
   input              reset96;
   input  [145:0]	io_cpx_data_ca;
   input  [7:0]		io_cpx_req_cq;
   input                io_pcx_stall_pq;
   input  [7:0] 	cpx_io_grant_cx;
   input  [ 39:0]     CLK_CNT;
   input  [  7:0]     core_mask;
   input  [  2:0]     core_id;
   input              en_status;
   input              pcx_cpx_en;
   input              pcx_cpx_short;
   input              pcx_cpx_io;

   output             watch_dog_finish;

reg [7:0] io_cpx_req_cq_r;
reg [145:0] io_cpx_data_ca_r;
reg [7:0] io_cpx_req_cq_r1;
reg [145:0] io_cpx_data_ca_r1;

always @(posedge clk) begin
  io_cpx_req_cq_r <= io_cpx_req_cq;
  io_cpx_data_ca_r <= io_cpx_data_ca;

 if (|io_cpx_req_cq_r1 & pcx_cpx_io) 
    begin // axis tbcall_region
 $display("IOX%h_%h %d %h_%h_%h", io_cpx_req_cq_r,io_cpx_data_ca_r[136:134], $time, io_cpx_data_ca_r[145:128],
                                                  io_cpx_data_ca_r[127:64],io_cpx_data_ca_r[63:0]);
   end
end
always @(negedge clk) begin
  io_cpx_req_cq_r1 <= io_cpx_req_cq_r;
end
endmodule

