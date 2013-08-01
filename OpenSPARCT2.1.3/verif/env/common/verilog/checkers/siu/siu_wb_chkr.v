// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: siu_wb_chkr.v
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
`ifdef IOS
`define TB_TOP tb_top
`define TB_RST tb_top.reset
`else
`ifdef FC_BENCH
`define TB_TOP tb_top
`define TB_RST tb_top.reset
`else
`define TB_TOP siu_top
`define TB_RST siu_top.reset
`endif
`endif

module siu_wb_chkr();

// set this to -constraint to constrain input signals to SIU
`define SIU_CONSTRAINT
// set this to -constraint to constrain input signals to NIU
`define NIU_CONSTRAINT
   
   // 0in set_clock  -default   iol2clk   -module sii
   // 0in set_clock  -default   iol2clk   -module sio
   

///////////////////////////////////////////////////////////////////////////////
// These signals can be used to disable certain 0-In checkers at runtime,
// so that testcases forcing interface errors don't die with checker firings.
///////////////////////////////////////////////////////////////////////////////
reg disable_siu_checks;

initial begin
    @(posedge `TB_TOP.cpu.sii.iol2clk) ;
    if ($test$plusargs("siu_0in_wb_chk_off"))
        disable_siu_checks <= 1;
    else
        disable_siu_checks <= 0;
end

//  0in disable_checker -name *sii* disable_siu_checks
//  0in disable_checker -name *sio* disable_siu_checks

   
wire niu_req;
reg  niu_req_d, niu_req_dd, niu_req_ddd, niu_req_dddd;

assign niu_req = `TB_TOP.cpu.niu_sii_hdr_vld;
always @(posedge `TB_TOP.cpu.sii.iol2clk) begin
  niu_req_d    <= #2 niu_req;
  niu_req_dd   <= #2 niu_req_d; 
  niu_req_ddd  <= #2 niu_req_dd; 
  niu_req_dddd <= #2 niu_req_ddd; 

end 

reg ipdodq0_h_wr_en_d1,ipdodq0_l_wr_en_d1,ipdbdq0_h_wr_en_d1,ipdbdq0_l_wr_en_d1;
reg ipdodq1_h_wr_en_d1,ipdodq1_l_wr_en_d1,ipdbdq1_h_wr_en_d1,ipdbdq1_l_wr_en_d1;
reg ipdodq0_h_rd_en_d1,ipdodq0_l_rd_en_d1,ipdbdq0_h_rd_en_d1,ipdbdq0_l_rd_en_d1;
reg ipdodq1_h_rd_en_d1,ipdodq1_l_rd_en_d1,ipdbdq1_h_rd_en_d1,ipdbdq1_l_rd_en_d1;
reg [`SII_IPD_DATA_RF_ADDRWIDTH-1:0] ipdodq0_h_wr_adr_d1,ipdodq0_l_wr_adr_d1,ipdbdq0_h_wr_adr_d1,ipdbdq0_l_wr_adr_d1;
reg [`SII_IPD_DATA_RF_ADDRWIDTH-1:0] ipdodq1_h_wr_adr_d1,ipdodq1_l_wr_adr_d1,ipdbdq1_h_wr_adr_d1,ipdbdq1_l_wr_adr_d1; 
reg [`SII_IPD_DATA_RF_ADDRWIDTH-1:0] ipdodq0_h_rd_adr_d1,ipdodq0_l_rd_adr_d1,ipdbdq0_h_rd_adr_d1,ipdbdq0_l_rd_adr_d1; 
reg [`SII_IPD_DATA_RF_ADDRWIDTH-1:0] ipdodq1_h_rd_adr_d1,ipdodq1_l_rd_adr_d1,ipdbdq1_h_rd_adr_d1,ipdbdq1_l_rd_adr_d1;

reg ipdohq0_wr_en_d1,ipdbhq0_wr_en_d1,ipdohq1_wr_en_d1,ipdbhq1_wr_en_d1;
reg ipdohq0_rd_en_d1,ipdbhq0_rd_en_d1,ipdohq1_rd_en_d1,ipdbhq1_rd_en_d1;  

reg [`SII_IPD_HDR_RF_ADDRWIDTH-1:0] ipdohq0_wr_adr_d1,ipdbhq0_wr_adr_d1,ipdohq1_wr_adr_d1,ipdbhq1_wr_adr_d1;
reg [`SII_IPD_HDR_RF_ADDRWIDTH-1:0] ipdohq0_rd_adr_d1,ipdbhq0_rd_adr_d1,ipdohq1_rd_adr_d1,ipdbhq1_rd_adr_d1;



always @(posedge `TB_TOP.cpu.sii.iol2clk) begin
     ipdodq0_h_wr_en_d1 <= #2 `TB_TOP.cpu.sii.ipcs_ipdodq0_wr_en;
     ipdodq0_h_wr_adr_d1 <= #2 `TB_TOP.cpu.sii.ipcs_ipdodq0_wr_addr[`SII_IPD_DATA_RF_ADDRWIDTH-1:0];
     ipdodq0_l_wr_en_d1 <= #2 `TB_TOP.cpu.sii.ipcs_ipdodq0_wr_en;
     ipdodq0_l_wr_adr_d1 <= #2 `TB_TOP.cpu.sii.ipcs_ipdodq0_wr_addr[`SII_IPD_DATA_RF_ADDRWIDTH-1:0];
     ipdbdq0_h_wr_en_d1 <= #2 `TB_TOP.cpu.sii.ipcs_ipdbdq0_wr_en;
     ipdbdq0_h_wr_adr_d1 <= #2 `TB_TOP.cpu.sii.ipcs_ipdbdq0_wr_addr[`SII_IPD_DATA_RF_ADDRWIDTH-1:0];
     ipdbdq0_l_wr_en_d1 <= #2 `TB_TOP.cpu.sii.ipcs_ipdbdq0_wr_en;
     ipdbdq0_l_wr_adr_d1 <= #2 `TB_TOP.cpu.sii.ipcs_ipdbdq0_wr_addr[`SII_IPD_DATA_RF_ADDRWIDTH-1:0];

     ipdodq1_h_wr_en_d1 <= #2 `TB_TOP.cpu.sii.ipcs_ipdodq1_wr_en;
     ipdodq1_h_wr_adr_d1 <= #2 `TB_TOP.cpu.sii.ipcs_ipdodq1_wr_addr[`SII_IPD_DATA_RF_ADDRWIDTH-1:0];
     ipdodq1_l_wr_en_d1 <= #2 `TB_TOP.cpu.sii.ipcs_ipdodq1_wr_en;
     ipdodq1_l_wr_adr_d1 <= #2 `TB_TOP.cpu.sii.ipcs_ipdodq1_wr_addr[`SII_IPD_DATA_RF_ADDRWIDTH-1:0];
     ipdbdq1_h_wr_en_d1 <= #2 `TB_TOP.cpu.sii.ipcs_ipdbdq1_wr_en;
     ipdbdq1_h_wr_adr_d1 <= #2 `TB_TOP.cpu.sii.ipcs_ipdbdq1_wr_addr[`SII_IPD_DATA_RF_ADDRWIDTH-1:0];
     ipdbdq1_l_wr_en_d1 <= #2 `TB_TOP.cpu.sii.ipcs_ipdbdq1_wr_en;
     ipdbdq1_l_wr_adr_d1 <= #2 `TB_TOP.cpu.sii.ipcs_ipdbdq1_wr_addr[`SII_IPD_DATA_RF_ADDRWIDTH-1:0];

     ipdohq0_wr_en_d1 <= #2 `TB_TOP.cpu.sii.ipcs_ipdohq0_wr_en;
     ipdohq0_wr_adr_d1 <= #2 `TB_TOP.cpu.sii.ipcs_ipdohq0_wr_addr[`SII_IPD_HDR_RF_ADDRWIDTH-1:0];
     ipdbhq0_wr_en_d1 <= #2 `TB_TOP.cpu.sii.ipcs_ipdbhq0_wr_en;
     ipdbhq0_wr_adr_d1 <= #2 `TB_TOP.cpu.sii.ipcs_ipdbhq0_wr_addr[`SII_IPD_HDR_RF_ADDRWIDTH-1:0];
     
     ipdohq1_wr_en_d1 <= #2 `TB_TOP.cpu.sii.ipcs_ipdohq1_wr_en; 
     ipdohq1_wr_adr_d1 <= #2 `TB_TOP.cpu.sii.ipcs_ipdohq1_wr_addr[`SII_IPD_HDR_RF_ADDRWIDTH-1:0];
     ipdbhq1_wr_en_d1 <= #2 `TB_TOP.cpu.sii.ipcs_ipdbhq1_wr_en;
     ipdbhq1_wr_adr_d1 <= #2 `TB_TOP.cpu.sii.ipcs_ipdbhq1_wr_addr[`SII_IPD_HDR_RF_ADDRWIDTH-1:0];
 
 end


always @(posedge `TB_TOP.cpu.sii.l2clk) begin
     ipdodq0_h_rd_en_d1 <= #2 `TB_TOP.cpu.sii.ipcc_ipdodq0_rd_en_m;
     ipdodq0_h_rd_adr_d1 <= #2 `TB_TOP.cpu.sii.ipcc_ipdodq0_rd_addr_m[`SII_IPD_DATA_RF_ADDRWIDTH-1:0];
     ipdodq0_l_rd_en_d1 <= #2 `TB_TOP.cpu.sii.ipcc_ipdodq0_rd_en_m;
     ipdodq0_l_rd_adr_d1 <= #2 `TB_TOP.cpu.sii.ipcc_ipdodq0_rd_addr_m[`SII_IPD_DATA_RF_ADDRWIDTH-1:0];
     ipdbdq0_h_rd_en_d1 <= #2 `TB_TOP.cpu.sii.ipcc_ipdbdq0_rd_en_m;
     ipdbdq0_h_rd_adr_d1 <= #2 `TB_TOP.cpu.sii.ipcc_ipdbdq0_rd_addr_m[`SII_IPD_DATA_RF_ADDRWIDTH-1:0];
     ipdbdq0_l_rd_en_d1 <= #2 `TB_TOP.cpu.sii.ipcc_ipdbdq0_rd_en_m;
     ipdbdq0_l_rd_adr_d1 <= #2 `TB_TOP.cpu.sii.ipcc_ipdbdq0_rd_addr_m[`SII_IPD_DATA_RF_ADDRWIDTH-1:0];

     ipdodq1_h_rd_en_d1 <= #2 `TB_TOP.cpu.sii.ipcc_ipdodq1_rd_en_m;
     ipdodq1_h_rd_adr_d1 <= #2 `TB_TOP.cpu.sii.ipcc_ipdodq1_rd_addr_m[`SII_IPD_DATA_RF_ADDRWIDTH-1:0];
     ipdodq1_l_rd_en_d1 <= #2 `TB_TOP.cpu.sii.ipcc_ipdodq1_rd_en_m;
     ipdodq1_l_rd_adr_d1 <= #2 `TB_TOP.cpu.sii.ipcc_ipdodq1_rd_addr_m[`SII_IPD_DATA_RF_ADDRWIDTH-1:0];
     ipdbdq1_h_rd_en_d1 <= #2 `TB_TOP.cpu.sii.ipcc_ipdbdq1_rd_en_m;
     ipdbdq1_h_rd_adr_d1 <= #2 `TB_TOP.cpu.sii.ipcc_ipdbdq1_rd_addr_m[`SII_IPD_DATA_RF_ADDRWIDTH-1:0];
     ipdbdq1_l_rd_en_d1 <= #2 `TB_TOP.cpu.sii.ipcc_ipdbdq1_rd_en_m;
     ipdbdq1_l_rd_adr_d1 <= #2 `TB_TOP.cpu.sii.ipcc_ipdbdq1_rd_addr_m[`SII_IPD_DATA_RF_ADDRWIDTH-1:0];


     ipdohq0_rd_en_d1 <= #2 `TB_TOP.cpu.sii.ipcc_ipdohq0_rd_en_m; 
     ipdohq0_rd_adr_d1 <= #2 `TB_TOP.cpu.sii.ipcc_ipdohq0_rd_addr_m[`SII_IPD_HDR_RF_ADDRWIDTH-1:0];
     ipdbhq0_rd_en_d1 <= #2 `TB_TOP.cpu.sii.ipcc_ipdbhq0_rd_en_m;
     ipdbhq0_rd_adr_d1 <= #2 `TB_TOP.cpu.sii.ipcc_ipdbhq0_rd_addr_m[`SII_IPD_HDR_RF_ADDRWIDTH-1:0];
     
     ipdohq1_rd_en_d1 <= #2 `TB_TOP.cpu.sii.ipcc_ipdohq1_rd_en_m; 
     ipdohq1_rd_adr_d1 <= #2 `TB_TOP.cpu.sii.ipcc_ipdohq1_rd_addr_m[`SII_IPD_HDR_RF_ADDRWIDTH-1:0];
     ipdbhq1_rd_en_d1 <= #2 `TB_TOP.cpu.sii.ipcc_ipdbhq1_rd_en_m;
     ipdbhq1_rd_adr_d1 <= #2 `TB_TOP.cpu.sii.ipcc_ipdbhq1_rd_addr_m[`SII_IPD_HDR_RF_ADDRWIDTH-1:0];
end

   /* 0in custom
      -fire (ipdodq0_h_rd_en_d1 && ipdodq0_h_wr_en_d1 && (ipdodq0_h_rd_adr_d1 === ipdodq0_h_wr_adr_d1))
      -message "ipdodq0_h FIFO overrun: rd and wr pointer valid on same addr"
      -clock `TB_TOP.cpu.sii.l2clk 
      -name sii_ipdodq0_h_ptr_overrun
    */


   /* 0in custom
      -fire (ipdodq0_l_rd_en_d1 && ipdodq0_l_wr_en_d1 && (ipdodq0_l_rd_adr_d1 === ipdodq0_l_wr_adr_d1))
      -message "ipdodq0_l FIFO overrun: rd and wr pointer valid on same addr"
      -clock `TB_TOP.cpu.sii.l2clk 
      -name sii_ipdodq0_l_ptr_overrun
    */

   /* 0in custom
      -fire (ipdbdq0_h_rd_en_d1 && ipdbdq0_h_wr_en_d1 && (ipdbdq0_h_rd_adr_d1 === ipdbdq0_h_wr_adr_d1))
      -message "ipdbdq0_h FIFO overrun: rd and wr pointer valid on same addr"
      -clock `TB_TOP.cpu.sii.l2clk 
      -name sii_ipdbdq0_h_ptr_overrun
    */


   /* 0in custom
      -fire (ipdbdq0_l_rd_en_d1 && ipdbdq0_l_wr_en_d1 && (ipdbdq0_l_rd_adr_d1 === ipdbdq0_l_wr_adr_d1))
      -message "ipdbdq0_l FIFO overrun: rd and wr pointer valid on same addr"
      -clock `TB_TOP.cpu.sii.l2clk 
      -name sii_ipdbdq0_l_ptr_overrun
    */


  /* 0in custom
      -fire (ipdodq1_h_rd_en_d1 && ipdodq1_h_wr_en_d1 && (ipdodq1_h_rd_adr_d1 === ipdodq1_h_wr_adr_d1))
      -message "ipdodq1_h FIFO overrun: rd and wr pointer valid on same addr"
      -clock `TB_TOP.cpu.sii.l2clk
      -name sii_ipdodq1_h_ptr_overrun
    */


   /* 0in custom
      -fire (ipdodq1_l_rd_en_d1 && ipdodq1_l_wr_en_d1 && (ipdodq1_l_rd_adr_d1 === ipdodq1_l_wr_adr_d1))
      -message "ipdodq1_l FIFO overrun: rd and wr pointer valid on same addr"
      -clock `TB_TOP.cpu.sii.l2clk
      -name sii_ipdodq1_l_ptr_overrun
    */

   /* 0in custom
      -fire (ipdbdq1_h_rd_en_d1 && ipdbdq1_h_wr_en_d1 && (ipdbdq1_h_rd_adr_d1 === ipdbdq1_h_wr_adr_d1))
      -message "ipdbdq1_h FIFO overrun: rd and wr pointer valid on same addr"
      -clock `TB_TOP.cpu.sii.l2clk
      -name sii_ipdbdq1_h_ptr_overrun
    */


   /* 0in custom
      -fire (ipdbdq1_l_rd_en_d1 && ipdbdq1_l_wr_en_d1 && (ipdbdq1_l_rd_adr_d1 === ipdbdq1_l_wr_adr_d1))
      -message "ipdbdq1_l FIFO overrun: rd and wr pointer valid on same addr"
      -clock `TB_TOP.cpu.sii.l2clk
      -name sii_ipdbdq1_l_ptr_overrun
    */


   /* 0in custom
      -fire (ipdohq0_rd_en_d1 && ipdohq0_wr_en_d1 && (ipdohq0_rd_adr_d1 === ipdohq0_wr_adr_d1))
      -message "ipdohq0 FIFO overrun: rd and wr pointer valid on same addr"
      -clock `TB_TOP.cpu.sii.l2clk
      -name sii_ipdohq0_ptr_overrun
    */


   /* 0in custom
      -fire (ipdohq1_rd_en_d1 && ipdohq1_wr_en_d1 && (ipdohq1_rd_adr_d1 === ipdohq1_wr_adr_d1))
      -message "ipdohq1 FIFO overrun: rd and wr pointer valid on same addr"
      -clock `TB_TOP.cpu.sii.l2clk
      -name sii_ipdohq1_ptr_overrun
    */


   /* 0in custom
      -fire (ipdbhq0_rd_en_d1 && ipdbhq0_wr_en_d1 && (ipdbhq0_rd_adr_d1 === ipdbhq0_wr_adr_d1))
      -message "ipdbhq0 FIFO overrun: rd and wr pointer valid on same addr"
      -clock `TB_TOP.cpu.sii.l2clk
      -name sii_ipdbhq0_ptr_overrun
    */


   /* 0in custom
      -fire (ipdbhq1_rd_en_d1 && ipdbhq1_wr_en_d1 && (ipdbhq1_rd_adr_d1 === ipdbhq1_wr_adr_d1))
      -message "ipdbhq1 FIFO overrun: rd and wr pointer valid on same addr"
      -clock `TB_TOP.cpu.sii.l2clk
      -name sii_ipdbhq1_ptr_overrun
    */





wire dmu_req;
assign dmu_req = `TB_TOP.cpu.dmu_sii_hdr_vld;

   /* x0in
      sequence -var cstate[6:0] -val 7'b0000100 7'b0001000 7'b0010000 7'b0100000 7'b1000000
      -start ~ext_sii_datareq16_r 
      -match_by_cycle
      -module sii_ipcs_ctl  -name sii_niu_ipcs_fsm_wri
   */

   /* x0in
      sequence -var cstate[6:0] -val 7'b0010000 7'b0100000 7'b1000000
      -match_by_cycle
      -module sii_ipcs_ctl  -name sii_ipcs_fsm_wri
   */



   /* x0in
      state -var cstate[6:0] -val 7'b0000001  -next 7'b0000001 7'b0000010 7'b0000100  
      -match_by_cycle
      -module sii_ipcs_ctl
      -name sii_ipcs_fsm_start
   */

   /* x0in
      state -var cstate[6:0] -val 7'b0000001 -next 7'b0000100
      -match_by_cycle
      -cond (ext_sii_hdr_vld & ext_sii_datareq) 
      -module sii_ipcs_ctl
      -name sii_ipcs_fsm_start_hdr_payld
   */

   /* x0in
      state -var cstate[6:0] 
      -val 7'b0000010
      -next 7'b0000001 7'b0000010 7'b0000100 
      -match_by_cycle
      -module sii_ipcs_ctl
      -name sii_ipcs_fsm_hdr
   */

   /* x0in
      state -var cstate[6:0] 
      -val 7'b0000100
      -next 7'b0000001 7'b0001000
      -match_by_cycle
      -module sii_ipcs_ctl
      -name sii_ipcs_fsm_hdrpld
   */

   /* x0in
      state -var cstate[6:0] 
      -val 7'b0001000
      -next 7'b0000001 7'b0000010 7'b0000100 7'b0010000  
      -match_by_cycle
      -module sii_ipcs_ctl
      -name sii_ipcs_fsm_data1
   */


   /* x0in
      state -var cstate[6:0] 
      -val 7'b0010000
      -next 7'b0000001 7'b0100000  
      -match_by_cycle
      -module sii_ipcs_ctl
      -name sii_ipcs_fsm_data2
   */

   /* x0in
      state -var cstate[6:0]
      -val 7'b0100000
      -next 7'b0000001 7'b1000000
      -match_by_cycle
      -module sii_ipcs_ctl
      -name sii_ipcs_fsm_data3
   */

   /* x0in
      state -var cstate[6:0]
      -val 7'b1000000
      -next 7'b0000001 7'b0000010 7'b0000100
      -match_by_cycle
      -module sii_ipcs_ctl
      -name sii_ipcs_fsm_data4
   */


 
   /* x0in
      state -var cstate[6:0] -is_not -val 7'b0000001 -next 7'b0000100
      -cond (ext_sii_hdr_vld & ~ext_sii_datareq)
      -module sii_ipcs_ctl  
      -name sii_ipcs_fsm_read_not_start_hdrpld
   */


   /* x0in
      state -var cstate[6:0] -is_not -val 7'b0000001 -next 7'b0000010
      -cond (ext_sii_hdr_vld & ext_sii_datareq)
      -module sii_ipcs_ctl  
      -name sii_ipcs_fsm_write_not_start_hdr
   */


   /* x0in
      one_hot -var cstate
      -module sii_ipcs_ctl  
      -name sii_ipcs_fsm_one_hot
   */


   /* 0in
      bits_on -var nstate -max 2
      -module sii_ipcs_ctl  
      -reset `TB_RST
      -name sii_ipcs_nstate
   */

   /* 0in
      bits_on -var {arc_start_hdr, arc_start_hdrpayld, arc_hdr_hdrpayld, arc_hdr_hdr, arc_hdrpayld_data1, arc_data1_hdrpayld, arc_data1_hdr, arc_data1_data2, arc_data2_data3, arc_data3_data4, arc_data4_hdr, arc_data4_hdrpayld}
      -max 1
      -module sii_ipcs_ctl  
      -reset `TB_RST
      -name sii_ipcs_arcs
   */

   /* 0in decoder
     -in ipcc_ipcs_or_raddr  
     -out {or_clr_v15, or_clr_v14, or_clr_v13, or_clr_v12,
           or_clr_v11, or_clr_v10, or_clr_v9, or_clr_v8,
	   or_clr_v7, or_clr_v6, or_clr_v5, or_clr_v4,
           or_clr_v3, or_clr_v2, or_clr_v1, or_clr_v0}
     -active ipcc_ipcs_or_go
     -module sii_ipcs_ctl
     -reset `TB_RST
     -name sii_ipcs_ctl_decoder_ord
   */

   /* 0in decoder
      -in ipcc_ipcs_by_raddr  
      -out {by_clr_v15, by_clr_v14, by_clr_v13, by_clr_v12,
           by_clr_v11, by_clr_v10, by_clr_v9, by_clr_v8,
           by_clr_v7, by_clr_v6, by_clr_v5, by_clr_v4,
           by_clr_v3, by_clr_v2, by_clr_v1, by_clr_v0}
      -active ipcc_ipcs_by_go
      -module sii_ipcs_ctl
      -reset `TB_RST
      -name sii_ipcs_ctl_decoder_byp
   */  

   /* 0in timeout 
      -var cstate[6:0] 
      -val 50
      -active ((cstate !== 7'b0000001) && (cstate !== 7'b0000010))
      -module sii_ipcs_ctl
      -clock iol2clk
      -reset `TB_RST
      -name sii_ipcs_ctl_fsm_to
   */

   /* x0in mux 
      -in ipcs_ipdohq_wr_addr last_or_wr_r
      -out last_or_wr_l[3:0]
      -select (ipcs_ipdohq_wr_en && w_r)
      -binary
      -module sii_ipcs_ctl
      -name sii_ipcs_ctl_mux1
   */

   /* x0in mux
      -in gt_wrptr[3:0] lt_wrptr[3:0] 
      -out youngest_match[3:0] 
      -select lt_wrptr[4] 
      -binary
      -module sii_ipcs_ctl
      -name sii_ipcs_ctl_mux2
   */

/*************************************************************************
*
*  sii_ild_dp.sv
*
**************************************************************************/

   /* 0in increment
      -var ipcc_ipdohq1_rd_addr
      -module sii_ipcc_ctl
      -reset `TB_RST
      -name sii_ipcc_inc
   */
 
    
   /* 0in arbiter
      -req niu_or_go niu_by_go
      -gnt gnt_r[1] gnt_r[0]
      -round_robin
      -no_simultaneous_req_gnt
      -clock l2clk
      -reset `TB_RST
      -module sii_ipcc_ctl
      -name sii_ipcc_arb1
   */

   /* 0in arbiter 
      -req dmu_or_go dmu_by_go
      -gnt gnt_r[3] gnt_r[2] 
      -round_robin
      -clock l2clk
      -reset `TB_RST
      -module sii_ipcc_ctl
      -name sii_ipcc_arb2
   */

   /* 0in arbiter
      -req (dmu_or_go | dmu_by_go) (niu_or_go | niu_by_go)
      -gnt ((gnt_r[3]== 1'b1) | (gnt_r[2]== 1'b1)) ((gnt_r[1]== 1'b1) | (gnt_r[0]== 1'b1))
      -no_simultaneous_req_gnt
      -clock l2clk
      -reset `TB_RST
      -round_robin
      -module sii_ipcc_ctl
      -name sii_ipcc_arb3
   */
 

/*************************************************************************
*
*  sii_ipcc   -  STATE_TRANSITION
*
**************************************************************************/

`define         START_ST                14'b00000000000001
`define         DEC_ST                  14'b00000000000010
`define         ARB_ST                  14'b00000000000100
`define         HDR_ST                  14'b00000000001000
`define         HDRDLY_ST               14'b00000000010000
`define         DATA1_ST                14'b00000000100000
`define         DATA2_ST                14'b00000001000000
`define         DATA3_ST                14'b00000010000000
`define         DATA4_ST                14'b00000100000000
`define         DATA5_ST                14'b00001000000000
`define         DATA6_ST                14'b00010000000000
`define         DATA7_ST                14'b00100000000000
`define         DATA8_ST                14'b01000000000000
`define         RDDW_ST                 14'b10000000000000

`define         START                   0
`define         DEC                     1
`define         ARB                     2
`define         HDR                     3
`define         HDRDLY                  4
`define         DATA1                   5
`define         DATA2                   6
`define         DATA3                   7
`define         DATA4                   8
`define         DATA5                   9
`define         DATA6                   10
`define         DATA7                   11
`define         DATA8                   12
`define         RDDW                    13


/* 0in state_transition -var cstate -val `START_ST -next `DEC_ST -clock l2clk -reset `TB_RST -module sii_ipcc_ctl  -name  sii_start */

/* 0in state_transition -var cstate -val `DEC_ST -next `ARB_ST `START_ST -clock l2clk -reset `TB_RST  -match_by_cycle -module sii_ipcc_ctl  -name  sii_dec  */

/* 0in state_transition -var cstate -val `ARB_ST -next `HDR_ST `START_ST `ARB_ST -clock l2clk  -reset `TB_RST  -match_by_cycle -module sii_ipcc_ctl  -name  sii_arb  */

/* 0in state_transition -var cstate -val `HDR_ST -next `HDRDLY_ST -clock l2clk  -reset `TB_RST  -module sii_ipcc_ctl  -name  sii_hdr  */

/* 0in state_transition -var cstate -val `HDRDLY_ST -next `DATA1_ST `RDDW_ST `START_ST -clock l2clk  -reset `TB_RST -match_by_cycle -module sii_ipcc_ctl  -name  sii_hdrdly  */
 
/* 0in state_transition -var cstate -val `RDDW_ST -next `START_ST  -clock l2clk  -reset `TB_RST -module sii_ipcc_ctl  -name  sii_rddw  */

/* 0in state_transition -var cstate -val `DATA1_ST -next `DATA2_ST `START_ST -clock l2clk  -reset `TB_RST -match_by_cycle -module sii_ipcc_ctl  -name  sii_data1  */

/* 0in state_transition -var cstate -val `DATA2_ST -next `DATA3_ST `START_ST -clock l2clk  -reset `TB_RST -match_by_cycle -module sii_ipcc_ctl  -name  sii_data2  */

/* 0in state_transition -var cstate -val `DATA3_ST -next `DATA4_ST  -clock l2clk  -reset `TB_RST -module sii_ipcc_ctl  -name  sii_data3 */

/* 0in state_transition -var cstate -val `DATA4_ST -next `DATA5_ST  -clock l2clk  -reset `TB_RST -module sii_ipcc_ctl  -name  sii_data4 */

/* 0in state_transition -var cstate -val `DATA5_ST -next `DATA6_ST  -clock l2clk  -reset `TB_RST -module sii_ipcc_ctl  -name  sii_data5 */

/* 0in state_transition -var cstate -val `DATA6_ST -next `DATA7_ST  -clock l2clk  -reset `TB_RST  -module sii_ipcc_ctl  -name  sii_data6 */

/* 0in state_transition -var cstate -val `DATA7_ST -next `DATA8_ST  -clock l2clk  -reset `TB_RST  -module sii_ipcc_ctl  -name  sii_data7 */

/* 0in state_transition -var cstate -val `DATA8_ST -next `START_ST  -clock l2clk   -reset `TB_RST -module sii_ipcc_ctl  -name  sii_data8 */


/*************************************************************************
*
*  sii_ipcc   -  ipcc to ipcs pointers
*
**************************************************************************/


/*  0in custom
     -fire (($0in_rising_edge(ipcc_ipcs_dmu_or_ptr[0])) && ($0in_rising_edge(ipcc_ipcs_dmu_by_ptr[0])))
     -clock l2clk
     -reset `TB_RST
     -message "ipcc to ipcs pointers: dmu_or[0] and dmu_by[0] pointer asserted at same time"
     -module sii_ipcc_ctl
     -name sii_update_dmu0
*/

/*  0in custom
     -fire (($0in_rising_edge(ipcc_ipcs_dmu_or_ptr[1])) && ($0in_rising_edge(ipcc_ipcs_dmu_by_ptr[1])))
     -clock l2clk
     -reset `TB_RST
     -message "ipcc to ipcs pointers: dmu_or[1] and dmu_by[1] pointer asserted at same time"
     -module sii_ipcc_ctl
     -name sii_update_dmu1
*/

/*  0in custom
     -fire (($0in_rising_edge(ipcc_ipcs_dmu_or_ptr[2])) && ($0in_rising_edge(ipcc_ipcs_dmu_by_ptr[2])))
     -clock l2clk
     -reset `TB_RST
     -message "ipcc to ipcs pointers: dmu_or[2] and dmu_by[2] pointer asserted at same time"
     -module sii_ipcc_ctl
     -name sii_update_dmu2
*/

/*  0in custom
     -fire (($0in_rising_edge(ipcc_ipcs_dmu_or_ptr[3])) && ($0in_rising_edge(ipcc_ipcs_dmu_by_ptr[3])))
     -clock l2clk
     -reset `TB_RST
     -message "ipcc to ipcs pointers: dmu_or[3] and dmu_by[3] pointer asserted at same time"
     -module sii_ipcc_ctl
     -name sii_update_dmu3
*/

/*  0in custom
     -fire (($0in_rising_edge(ipcc_ipcs_niu_or_ptr[0])) && ($0in_rising_edge(ipcc_ipcs_niu_by_ptr[0])))
     -clock l2clk
     -reset `TB_RST
     -message "ipcc to ipcs pointers: niu_or[0] and niu_by[0] pointer asserted at same time"
     -module sii_ipcc_ctl
     -name sii_update_niu0
*/

/*  0in custom
     -fire (($0in_rising_edge(ipcc_ipcs_niu_or_ptr[1])) && ($0in_rising_edge(ipcc_ipcs_niu_by_ptr[1])))
     -clock l2clk
     -reset `TB_RST
     -message "ipcc to ipcs pointers: niu_or[1] and niu_by[1] pointer asserted at same time"
     -module sii_ipcc_ctl
     -name sii_update_niu1
*/

/*  0in custom
     -fire (($0in_rising_edge(ipcc_ipcs_niu_or_ptr[2])) && ($0in_rising_edge(ipcc_ipcs_niu_by_ptr[2])))
     -clock l2clk
     -reset `TB_RST
     -message "ipcc to ipcs pointers: niu_or[2] and niu_by[2] pointer asserted at same time"
     -module sii_ipcc_ctl
     -name sii_update_niu2
*/

/*  0in custom
     -fire (($0in_rising_edge(ipcc_ipcs_niu_or_ptr[3])) && ($0in_rising_edge(ipcc_ipcs_niu_by_ptr[3])))
     -clock l2clk
     -reset `TB_RST
     -message "ipcc to ipcs pointers: niu_or[3] and niu_by[3] pointer asserted at same time"
     -module sii_ipcc_ctl
     -name sii_update_niu3
*/


/*************************************************************************
*
*  sii_ipcc   -  WRM counter 
*
**************************************************************************/

/* 0in overflow
        -var dmu_wrm_cnt_r[3:0]
        -max 8
        -clock l2clk
        -reset `TB_RST
        -module sii_ipcc_ctl
        -name sii_ipcc_dmu_wrm_counter 
*/


/* 0in overflow
        -var dmu_or_cnt_r[4:0]
        -min 0
        -max 16
        -clock l2clk
        -reset `TB_RST
        -module sii_ipcc_ctl
        -name sii_ipcc_dmu_or_counter
*/

/* 0in overflow
        -var dmu_by_cnt_r[4:0]
        -min 0
        -max 16
        -clock l2clk
        -reset `TB_RST
        -module sii_ipcc_ctl
        -name sii_ipcc_dmu_by_counter
*/

/* 0in overflow
        -var niu_or_cnt_r[4:0]
        -min 0
        -max 16
        -clock l2clk
        -reset `TB_RST
        -module sii_ipcc_ctl
        -name sii_ipcc_niu_or_counter
*/

/* 0in overflow
        -var niu_by_cnt_r[4:0]
        -min 0
        -max 16
        -clock l2clk
        -reset `TB_RST
        -module sii_ipcc_ctl
        -name sii_ipcc_niu_by_counter
*/


/*************************************************************************
*  
*  sii_ild_dp.sv 
* 
**************************************************************************/
   // these should be checked in ilc module
   /* 0in one_hot
      -var ilc_ild_de_sel 
      -module sii_ild_dp
      -clock l2clk
      -reset `TB_RST
      -name sii_ild_dp_onehot1
   */

/*************************************************************************
*
*  sii_ilc_ctl.sv
*
**************************************************************************/
   /* 0in mux
      -in full_be0 full_be1 full_be2 full_be3
      -out cur_be
      -select hdr_rd_ptr_l 
      -binary
      -module sii_ilc_ctl
      -reset `TB_RST
      -name sii_ilc_ctl_mux1
   */

/* 0in underflow
        -var wrm_cnt_r[2:0]
        -min 0
        -clock l2clk
        -module sii_ilc_ctl
        -reset `TB_RST
        -name sii_ilc_wrm_under_counter
*/

/* 0in arithmetic_overflow
        -var wrm_cnt_l[2:0]
        -val ((& wrm_cnt_r[2:0] && arc_data2_start ) ? 3'b000 : (wrm && cstate[`DATA2] && make_request) ? (wrm_cnt_r[2:0] + 3'b001) : wrm_cnt_r[2:0]) 
        -clock l2clk
        -reset `TB_RST
        -module sii_ilc_ctl
        -name sii_ilc_wrm_over_counter
*/


/* 0in underflow
        -var sio_cnt_r[2:0]
        -min 0
        -clock l2clk
        -reset `TB_RST
        -module sii_ilc_ctl
        -name sii_ilc_buffer_under_counter
*/

/* 0in arithmetic_overflow
        -var sio_cnt_l[2:0]
        -val ((sii_l2t_req_vld && ~posted && ~jtag && ~sio_sii_olc_ilc_dequeue_r )? (sio_cnt_r[2:0]+3'b001) : (sio_sii_olc_ilc_dequeue_r && ~(sii_l2t_req_vld && ~posted))? (sio_cnt_r[2:0] - 3'b001): sio_cnt_r[2:0])
        -clock l2clk
        -reset `TB_RST
        -module sii_ilc_ctl
        -name sii_ilc_buffer_over_counter
*/


/*************************************************************************
*
*  sii ipd hdr and data fifo
*
**************************************************************************/
/* NIU & DMU, bypass & order HEADER queue */
   /* 0in multi_clock_fifo
      -enq wr_en
      -deq (rd_adr !== $0in_delay(rd_adr, 1, rdclk))
      -depth 16
      -enq_data din
      -deq_data dout
      -enq_clock wrclk
      -deq_clock rdclk
      -module n2_com_dp_16x72_cust 
      -name sii_ipd_hdr_fifo
    */

   /* x0in custom
      -fire ($0in_delay(rd_en, 1, rdclk) && wr_en_d1 && ($0in_delay(rd_adr, 1, rdclk) === wr_adr_d1))
      -message "ipd hdr FIFO overrun: rd and wr pointer valid on same addr"
      -module n2_com_dp_16x72_cust
      -clock rdclk
      -name sii_ipd_hdr_ptr_overrun
    */

/* 0in assert_timer
      -var (wr_en && (wr_adr == $0in_delay(wr_adr, 1,wrclk))) 
      -max 1
      -clock wrclk
      -reset `TB_RST
      -module n2_com_dp_16x72_cust 
      -name sii_ipd_hdr_wr_en
*/


/* NIU & DMU, bypass & order DATA queue */
   /* 0in multi_clock_fifo
      -enq wr_en
      -deq (rd_adr !== $0in_delay(rd_adr, 1, rdclk))
      -depth 64
      -enq_data din
      -deq_data dout
      -enq_clock wrclk
      -deq_clock rdclk
      -module n2_com_dp_64x80_cust 
      -name sii_ipd_data_fifo
    */

   /* x0in custom
      -fire ($0in_delay(rd_en, 1, rdclk) && wr_en_d1 && (rd_adr_d1 === wr_adr_d1))
      -message "ipd data FIFO overrun: rd and wr pointer valid on same addr"
      -clock rdclk
      -module n2_com_dp_64x80_cust 
      -name sii_ipd_data_ptr_overrun
   */

/* 0in assert_timer
      -var (wr_en && (wr_adr == $0in_delay(wr_adr, 1,wrclk))) 
      -max 1
      -clock wrclk
      -reset `TB_RST
      -module n2_com_dp_64x80_cust
      -name sii_ipd_data_wr_en
*/


/*************************************************************************
*
*  sio opd hdr and data fifo
*
**************************************************************************/
/* x0in multi_clock_fifo
      -enq wr_en
      -deq (rd_adr !== $0in_delay(rd_adr, 1, rdclk))
      -depth 16
      -enq_data din
      -deq_data dout
      -enq_clock wrclk
      -deq_clock rdclk
      -reset `TB_RST
      -module n2_com_dp_16x32s_cust 
      -name sio_opd_hdr_fifo
*/

/* x0in custom
      -fire ((rd_en && (rd_adr !== $0in_delay(rd_adr, 1, rdclk))) && wr_en && (rd_adr === wr_adr))
      -message "opd hdr FIFO overrun: rd and wr pointer valid on same addr"
      -module n2_com_dp_16x32s_cust
      -name sio_op_hdr_ptr_overrun
*/

/* 0in assert_timer
      -var (wr_en && (wr_adr == $0in_delay(wr_adr, 1,wrclk)))
      -max 1
      -clock wrclk
      -reset `TB_RST
      -module n2_com_dp_16x32s_cust
      -name sio_op_hdr_wr_en
*/

/*  0in multi_clock_fifo
      -enq (wr_en && (wr_adr !== $0in_delay(wr_adr, 1)))
      -deq (rd_en && (rd_adr !== $0in_delay(rd_adr, 1)))
      -depth 64
      -enq_data din
      -deq_data dout
      -enq_clock wrclk
      -deq_clock rdclk
      -module n2_com_dp_64x72s_cust
      -name sio_op_data_fifo
*/

/* 0in custom
      -fire ((rd_en && (rd_adr !== $0in_delay(rd_adr, 1, rdclk))) && wr_en && (rd_adr === wr_adr))
      -message "opd data FIFO overrun: rd and wr pointer valid on same addr"
      -reset `TB_RST
      -module n2_com_dp_64x72s_cust
      -name sio_op_data_ptr_overrun
*/

/* 0in assert_timer
      -var wr_en  
      -max 1
      -clock wrclk
      -reset `TB_RST
      -module n2_com_dp_64x72s_cust
      -name sio_op_data_wr_en
*/

/* 0in assert_follower
      -leader opddq00.wr_en
      -follower opddq01.wr_en
      -min 1
      -max 1
      -clock l2clk
      -reset `TB_RST
      -module sio
      -name sio_op_data_opddq00
*/


/* 0in assert_follower
      -leader opddq10.wr_en
      -follower opddq11.wr_en
      -min 1
      -max 1
      -clock l2clk
      -reset `TB_RST
      -module sio
      -name sio_op_data_opddq10
*/


/*************************************************************************
*
*  sio_opcc - arbitration
*
**************************************************************************/

/* 0in arbiter
      -req (olc0_opcc_req && (queuecredit[0] == 1)) (olc1_opcc_req && (queuecredit[1] == 1)) (olc2_opcc_req && (queuecredit[2] == 1)) (olc3_opcc_req && (queuecredit[3] == 1)) (olc4_opcc_req && (queuecredit[4] == 1)) (olc5_opcc_req && (queuecredit[5] == 1)) (olc6_opcc_req && (queuecredit[6] == 1)) (olc7_opcc_req && (queuecredit[7] == 1))
      -gnt opcc_olc0_gnt opcc_olc1_gnt opcc_olc2_gnt opcc_olc3_gnt opcc_olc4_gnt opcc_olc5_gnt opcc_olc6_gnt opcc_olc7_gnt
      -round_robin
      -max_grant 1
      -no_simultaneous_req_gnt
      -clock l2clk
      -reset `TB_RST
      -module sio_opcc_ctl
      -name sio_opcc_arb1
*/



/*************************************************************************
*
*  sii ild fifo
*
**************************************************************************/
/* SII to L2 queues */
   /* 0in fifo
      -enq wr_en
      -deq (rd_adr !== $0in_delay(rd_adr, 1))
      -depth 32
      -enq_data din
      -deq_data dout
      -clock rdclk
      -reset `TB_RST
      -module n2_com_dp_32x82_cust 
      -name sii_ild_fifo
   */

   /* 0in custom
      -fire ((rd_en && (rd_adr !== $0in_delay(rd_adr, 1))) && wr_en && (rd_adr === wr_adr))
      -message "ild FIFO overrun: rd and wr pointer valid on same addr"
      -module n2_com_dp_32x82_cust 
      -clock rdclk
      -reset `TB_RST
      -name sii_ild_ptr_overrun
    */

/*************************************************************************
*
*  sii ind fifo
*
**************************************************************************/
/* SII to NCU queues */
   /* 0in fifo
      -enq indq.wr_en
      -deq (indq.rd_adr !== $0in_delay(indq.rd_adr, 1))
      -depth 48
      -enq_data indq.din
      -deq_data indq.dout
      -clock indq.rdclk
      -reset `TB_RST
      -module sii 
      -name sii_ind_fifo
   */

   /* 0in custom
      -fire ((indq.rd_en && (indq.rd_adr !== $0in_delay(indq.rd_adr, 1))) && indq.wr_en && (indq.rd_adr === indq.wr_adr))
      -message "ind FIFO overrun: rd and wr pointer valid on same addr"
      -clock indq.rdclk
      -reset `TB_RST
      -module sii 
      -name sii_ind_ptr_overrun
    */

/*************************************************************************
*
*  sio old fifo
*
**************************************************************************/
/* L2 to SIO queues */
   /* Fu: disabled
    * 8/4 rd_en for olddq00 is not reliable, on for multiple cycles but no address changes 
    * 9/22 32x32 is using by ncu, and the usage is different, so I have to disable it
    */
   /* x0in fifo
      -enq wr_en
      -deq (rd_adr !== $0in_delay(rd_adr, 1)) 
      -depth 32 
      -enq_data din
      -deq_data local_dout
      -reset `TB_RST
      -module n2_com_dp_32x32_cust 
      -name sio_old_fifo
   */

   /* 0in custom
      -fire (olc_olddq0_rd_en && olc_olddq0_wr_en && (olc_olddq0_rd_addr === olc_olddq0_wr_addr))
      -message "olddq0 FIFO overrun: rd and wr pointer valid on same addr"
      -module sio_olc_ctl 
      -clock l2clk
      -reset `TB_RST
      -name sio_olddq0_ptr_overrun
    */
   /* 0in custom
      -fire (olc_olddq1_rd_en && olc_olddq1_wr_en && (olc_olddq1_rd_addr === olc_olddq1_wr_addr))
      -message "olddq1 FIFO overrun: rd and wr pointer valid on same addr"
      -module sio_olc_ctl 
      -clock l2clk
      -reset `TB_RST
      -name sio_olddq1_ptr_overrun
    */

/*************************************************************************
*
*  TCU -> SII interface
*  SIO -> TCU interface
*
**************************************************************************/

/* Fu: 2/1/06 turn off, checkers not correct, */
/* x0in assert_follower
      -leader tcu_sii_vld
      -follower tcu_sii_vld
      -min 64
      -max 3000
      -clock l2clk
      -reset `TB_RST
      -module sii_ipcc_ctl
      -name tcu_sii_hdr_vld
*/

/* x0in assert_follower
      -leader sio_tcu_vld
      -follower sio_tcu_vld
      -min 64
      -max 3000
      -clock l2clk
      -module sio_opcc_ctl
      -name sio_tcu_hdr_vld
*/

endmodule // siu_wb_chkr
