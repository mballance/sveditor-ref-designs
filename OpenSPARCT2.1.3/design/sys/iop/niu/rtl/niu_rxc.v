// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: niu_rxc.v
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
/**********************************************************
***********************************************************

    Project         : Niu

    File name       : niu_rxc.v

    Module(s) name  : niu_rxc

    Parent modules  : none

    Child modules   : niu_ipp_top.v, niu_zcp.v, fflp.v

    Author's name   : George Chu

    Date            : March 9, 2004

    Description     : Top level of the RXC. 

    Synthesis Notes:

    Modification History:

    Date       Description
    ----       -----------

************************************************************
***********************************************************/

module niu_rxc (
`ifdef NEPTUNE
`else
                    tcu_mbist_user_mode,
                    tcu_scan_en,
                    tcu_mbist_bisi_en,
                    tcu_rtx_rxc_ipp0_mbist_start,
                    tcu_rtx_rxc_ipp1_mbist_start,
                    tcu_rtx_rxc_mb5_mbist_start,
                    tcu_rtx_rxc_mb6_mbist_start,
                    tcu_rtx_rxc_zcp0_mbist_start,
                    tcu_rtx_rxc_zcp1_mbist_start,
                    rtx_rxc_ipp0_tcu_mbist_fail,
                    rtx_rxc_ipp1_tcu_mbist_fail,
                    rtx_rxc_mb5_tcu_mbist_fail,
                    rtx_rxc_mb6_tcu_mbist_fail,
                    rtx_rxc_zcp0_tcu_mbist_fail,
                    rtx_rxc_zcp1_tcu_mbist_fail,
                    rtx_rxc_ipp0_tcu_mbist_done,
                    rtx_rxc_ipp1_tcu_mbist_done,
                    rtx_rxc_mb5_tcu_mbist_done,
                    rtx_rxc_mb6_tcu_mbist_done,
                    rtx_rxc_zcp0_tcu_mbist_done,
                    rtx_rxc_zcp1_tcu_mbist_done,
                    niu_mb3_prebuf_header_scan_in,
                    niu_mb3_prebuf_header_scan_out,
                    niu_mb3_rx_data_fifo_scan_in,
                    niu_mb3_rx_data_fifo_scan_out,
                    rtx_rxc_ipp0_mb3_mbist_scan_in,
                    rtx_rxc_ipp0_mb3_mbist_scan_out,
                    rtx_rxc_ipp0_mb3_dmo_dout,
                    niu_mb4_prebuf_header_scan_in,
                    niu_mb4_prebuf_header_scan_out,
                    niu_mb4_rx_data_fifo_scan_in,
                    niu_mb4_rx_data_fifo_scan_out,
                    rtx_rxc_ipp1_mb3_mbist_scan_in,
                    rtx_rxc_ipp1_mb3_mbist_scan_out,
                    rtx_rxc_ipp1_mb3_dmo_dout,
                    niu_mb5_tcam_cntrl_scan_in,
                    niu_mb5_tcam_cntrl_scan_out,
                    rtx_rxc_tcam_cntrl_mbist_scan_in,
                    rtx_rxc_tcam_cntrl_mbist_scan_out,
                    niu_mb6_tcam_array_scan_in,
                    niu_mb6_tcam_array_scan_out,
                    niu_mb6_vlan_scan_in,
                    niu_mb6_vlan_scan_out,
                    rtx_rxc_tcam_vlan_mbist_scan_in,
                    rtx_rxc_tcam_vlan_mbist_scan_out,
                    rtx_rxc_vlan_mb6_dmo_dout,
                    niu_mb7_cntrl_fifo_zcp_scan_in,
                    niu_mb7_cntrl_fifo_zcp_scan_out,
                    rtx_rxc_zcp0_mb7_mbist_scan_in,
                    rtx_rxc_zcp0_mb7_mbist_scan_out,
                    rtx_rxc_zcp0_mb7_dmo_dout,
                    niu_mb8_cntrl_fifo_zcp_scan_in,
                    niu_mb8_cntrl_fifo_zcp_scan_out,
                    rtx_rxc_zcp1_mb7_mbist_scan_in,
                    rtx_rxc_zcp1_mb7_mbist_scan_out,
                    rtx_rxc_zcp1_mb7_dmo_dout,

                    hdr_sram_rvalue_ipp0,
                    hdr_sram_rid_ipp0,
                    hdr_sram_wr_en_ipp0,
                    hdr_sram_red_clr_ipp0,
                    sram_hdr_read_data_ipp0,
                    hdr_sram_rvalue_ipp1,
                    hdr_sram_rid_ipp1,
                    hdr_sram_wr_en_ipp1,
                    hdr_sram_red_clr_ipp1,
                    sram_hdr_read_data_ipp1,

                    hdr_sram_rvalue_zcp0,
                    hdr_sram_rid_zcp0,
                    hdr_sram_wr_en_zcp0,
                    hdr_sram_red_clr_zcp0,
                    sram_hdr_read_data_zcp0,
                    hdr_sram_rvalue_zcp1,
                    hdr_sram_rid_zcp1,
                    hdr_sram_wr_en_zcp1,
                    hdr_sram_red_clr_zcp1,
                    sram_hdr_read_data_zcp1,

                    hdr_sram_rvalue_vlan,
                    hdr_sram_rid_vlan,
                    hdr_sram_wr_en_vlan,
                    hdr_sram_red_clr_vlan,
                    sram_hdr_read_data_vlan,

                    tcu_aclk,
                    tcu_bclk,
                    tcu_se_scancollar_in,
                    tcu_se_scancollar_out,
                    tcu_array_wr_inhibit,

                    iol2clk,
                    iol2clk_2x,
`endif
		pio_ipp_sel,        // input from cpu
                pio_zcp_sel,
                pio_fflp_sel,
		pio_clients_addr,
`ifdef NEPTUNE
                pio_client_32b,
`endif
                pio_clients_rd,
		pio_clients_wdata,

                niu_reset_l,
		niu_clk,

                ipp_pio_ack,        // output to  cpu
                ipp_pio_rdata, 
                ipp_pio_err, 
                ipp_pio_intr, 
                ipp_debug_port, 

                zcp_pio_ack,
                zcp_pio_rdata,
                zcp_pio_err,
                zcp_pio_intr,
                zcp_debug_port,

                fflp_pio_rdata,
                fflp_pio_ack,
                fflp_pio_err,
                fflp_pio_intr,
                fflp_debug_port,

// ipp0
                mac_rxc_ack0,       // input from xmac
                mac_rxc_tag0,
                mac_rxc_data0,
                mac_rxc_ctrl0,
                mac_rxc_stat0,
                dmc_ipp_dat_req0,   // input from dmc  

                rxc_mac_req0,       // output to xmac 
                ipp_dmc_dat_ack0,   // output to  dmc
                ipp_dmc_data0,
                ipp_dmc_ful_pkt0,
                ipp_dmc_dat_err0,
// ipp1
                mac_rxc_ack1,       // input from xmac 
                mac_rxc_tag1,
                mac_rxc_data1,
                mac_rxc_ctrl1,
                mac_rxc_stat1,
                dmc_ipp_dat_req1,   // input from dmc  

                rxc_mac_req1,       // output to xmac 
                ipp_dmc_dat_ack1,   // output to  dmc
                ipp_dmc_data1,
                ipp_dmc_ful_pkt1,
                ipp_dmc_dat_err1,

`ifdef NEPTUNE
// ipp2
                mac_rxc_req2,       // input from bmac 
                mac_rxc_tag2,
                mac_rxc_data2,
                mac_rxc_ctrl2,
                mac_rxc_stat2,
                dmc_ipp_dat_req2,   // input from dmc  

                rxc_mac_ack2,       // output to bmac 
                ipp_dmc_dat_ack2,   // output to  dmc
                ipp_dmc_data2,
                ipp_dmc_ful_pkt2,
                ipp_dmc_dat_err2,
// ipp3
                mac_rxc_req3,       // input from bmac 
                mac_rxc_tag3,
                mac_rxc_data3,
                mac_rxc_ctrl3,
                mac_rxc_stat3,
                dmc_ipp_dat_req3,   // input from dmc  

                rxc_mac_ack3,       // output to bmac 
                ipp_dmc_dat_ack3,   // output to  dmc
                ipp_dmc_data3,
                ipp_dmc_ful_pkt3,
                ipp_dmc_dat_err3,
`endif

`ifdef NEPTUNE
// fcram
                fcram_clk,          // input from fcram
              	fcram_fflp_mstrready,
                fcram_fflp_fatal_err,
		fcram_fflp_data_ready,
                fcram_fflp_even_din,
                fcram_fflp_odd_din,
                fcram_fflp_cfg_datrd,
                fcram_fflp_cfg_done,
                fcram_fflp_cfg_err,

                fflp_fcram_cfg_rst,	
                fflp_fcram_cfg_sel,
                fflp_fcram_cfg_rd,
                fflp_fcram_cfg_addr,
                fflp_fcram_cfg_datwr,
                fflp_fcram_slv_update,
                fflp_fcram_rd_en,
                fflp_fcram_cs_l,    // output to fcram
                fflp_fcram_fn,
                fflp_fcram_pd_l,
                fflp_fcram_ba0,
                fflp_fcram_ba1,
                fflp_fcram_addr,
                fflp_fcram_ds,
                fflp_fcram_triz_en_l,
                fflp_fcram_even_dout,
                fflp_fcram_odd_dout,

                page_handle,        // input from rdmc
                rdmc_zcp_func_num,

                arb1_zcp_req_accept,      // input from arb1
                zcp_arb1_req,             // output to  arb1
                zcp_arb1_req_cmd,
                zcp_arb1_req_address,
                zcp_arb1_req_length,
                zcp_arb1_req_port_num,
                zcp_arb1_req_dma_num,
                zcp_arb1_req_func_num,

                meta_zcp_resp_length,
                meta_zcp_resp_dma_num,
                meta_zcp_resp_complete,
                meta_zcp_resp_transfer_cmpl,
                meta_zcp_resp_ready,
                meta_zcp_resp_cmd,
                meta_zcp_resp_cmd_status,
                meta_zcp_resp_client,
                zcp_meta_resp_accept,     // output to  meta RESPONSE control

                meta_zcp_data_valid,      // input from meta RESPONSE data
                meta_zcp_data,
                meta_zcp_resp_byteenable,
                meta_zcp_data_status,

// zcp.port3
                dmc_zcp_req3,       // input from dmc
                zcp_dmc_ack3,       // output to dmc
                zcp_dmc_dat3,
                zcp_dmc_dat_err3,
                zcp_dmc_ful_pkt3,
// zcp.port2
                dmc_zcp_req2,       // input from dmc
                zcp_dmc_ack2,       // output to dmc
                zcp_dmc_dat2,
                zcp_dmc_dat_err2,
                zcp_dmc_ful_pkt2,
`endif

// zcp.port1
                dmc_zcp_req1,       // input from dmc
                zcp_dmc_ack1,       // output to dmc
                zcp_dmc_dat1,
                zcp_dmc_dat_err1,
                zcp_dmc_ful_pkt1, 
// zcp.port0
                dmc_zcp_req0,       // input from dmc
                zcp_dmc_ack0,       // output to dmc
                zcp_dmc_dat0,
                zcp_dmc_dat_err0,
                zcp_dmc_ful_pkt0
               );                   // end of niu_rxc_top pin definition

`ifdef NEPTUNE
`else
input                          tcu_mbist_user_mode;
input                          tcu_scan_en;
input                          tcu_mbist_bisi_en;
input                          tcu_rtx_rxc_ipp0_mbist_start;
input                          tcu_rtx_rxc_ipp1_mbist_start;
input                          tcu_rtx_rxc_mb5_mbist_start;
input                          tcu_rtx_rxc_mb6_mbist_start;
input                          tcu_rtx_rxc_zcp0_mbist_start;
input                          tcu_rtx_rxc_zcp1_mbist_start;
output                         rtx_rxc_ipp0_tcu_mbist_fail;
output                         rtx_rxc_ipp1_tcu_mbist_fail;
output                         rtx_rxc_mb5_tcu_mbist_fail;
output                         rtx_rxc_mb6_tcu_mbist_fail;
output                         rtx_rxc_zcp0_tcu_mbist_fail;
output                         rtx_rxc_zcp1_tcu_mbist_fail;
output                         rtx_rxc_ipp0_tcu_mbist_done;
output                         rtx_rxc_ipp1_tcu_mbist_done;
output                         rtx_rxc_mb5_tcu_mbist_done;
output                         rtx_rxc_mb6_tcu_mbist_done;
output                         rtx_rxc_zcp0_tcu_mbist_done;
output                         rtx_rxc_zcp1_tcu_mbist_done;
input                          niu_mb3_prebuf_header_scan_in;
output                         niu_mb3_prebuf_header_scan_out;
input                          niu_mb3_rx_data_fifo_scan_in;
output                         niu_mb3_rx_data_fifo_scan_out;
input                          rtx_rxc_ipp0_mb3_mbist_scan_in;
output                         rtx_rxc_ipp0_mb3_mbist_scan_out;
output                  [39:0] rtx_rxc_ipp0_mb3_dmo_dout;
input                          niu_mb4_prebuf_header_scan_in;
output                         niu_mb4_prebuf_header_scan_out;
input                          niu_mb4_rx_data_fifo_scan_in;
output                         niu_mb4_rx_data_fifo_scan_out;
input                          rtx_rxc_ipp1_mb3_mbist_scan_in;
output                         rtx_rxc_ipp1_mb3_mbist_scan_out;
output                  [39:0] rtx_rxc_ipp1_mb3_dmo_dout;
input                          niu_mb5_tcam_cntrl_scan_in;
output                         niu_mb5_tcam_cntrl_scan_out;
input                          rtx_rxc_tcam_cntrl_mbist_scan_in;
output                         rtx_rxc_tcam_cntrl_mbist_scan_out;
input                          niu_mb6_tcam_array_scan_in;
output                         niu_mb6_tcam_array_scan_out;
input                          niu_mb6_vlan_scan_in;
output                         niu_mb6_vlan_scan_out;
input                          rtx_rxc_tcam_vlan_mbist_scan_in;
output                         rtx_rxc_tcam_vlan_mbist_scan_out;
output                  [39:0] rtx_rxc_vlan_mb6_dmo_dout;

input                          niu_mb7_cntrl_fifo_zcp_scan_in;
output                         niu_mb7_cntrl_fifo_zcp_scan_out;
input                          rtx_rxc_zcp0_mb7_mbist_scan_in;
output                         rtx_rxc_zcp0_mb7_mbist_scan_out;
output                  [39:0] rtx_rxc_zcp0_mb7_dmo_dout;
input                          niu_mb8_cntrl_fifo_zcp_scan_in;
output                         niu_mb8_cntrl_fifo_zcp_scan_out;
input                          rtx_rxc_zcp1_mb7_mbist_scan_in;
output                         rtx_rxc_zcp1_mb7_mbist_scan_out;
output                  [39:0] rtx_rxc_zcp1_mb7_dmo_dout;

input                    [6:0] hdr_sram_rvalue_ipp0;
input                    [2:0] hdr_sram_rid_ipp0;
input                          hdr_sram_wr_en_ipp0;
input                          hdr_sram_red_clr_ipp0;
output                   [6:0] sram_hdr_read_data_ipp0;
input                    [6:0] hdr_sram_rvalue_ipp1;
input                    [2:0] hdr_sram_rid_ipp1;
input                          hdr_sram_wr_en_ipp1;
input                          hdr_sram_red_clr_ipp1;
output                   [6:0] sram_hdr_read_data_ipp1;

input                    [6:0] hdr_sram_rvalue_zcp0;
input                    [1:0] hdr_sram_rid_zcp0;
input                          hdr_sram_wr_en_zcp0;
input                          hdr_sram_red_clr_zcp0;
output                   [6:0] sram_hdr_read_data_zcp0;
input                    [6:0] hdr_sram_rvalue_zcp1;
input                    [1:0] hdr_sram_rid_zcp1;
input                          hdr_sram_wr_en_zcp1;
input                          hdr_sram_red_clr_zcp1;
output                   [6:0] sram_hdr_read_data_zcp1;

input                    [5:0] hdr_sram_rvalue_vlan;
input                          hdr_sram_rid_vlan;
input                          hdr_sram_wr_en_vlan;
input                          hdr_sram_red_clr_vlan;
output                   [5:0] sram_hdr_read_data_vlan;

input                          tcu_aclk;
input                          tcu_bclk;
input                          tcu_se_scancollar_in;
input                          tcu_se_scancollar_out;
input                          tcu_array_wr_inhibit;

input                          iol2clk;
input                          iol2clk_2x;
`endif

// input from cpu
input           pio_ipp_sel;		// select ipp's    
input           pio_zcp_sel;		// select zcp's    
input           pio_fflp_sel;		// select fflp's    
input    [19:0] pio_clients_addr;
`ifdef NEPTUNE
input           pio_client_32b;
`endif
input           pio_clients_rd;		// rd_wr
input    [63:0] pio_clients_wdata;

// input from global
input           niu_reset_l;
input           niu_clk;

// output to cpu
output          ipp_pio_ack;            // output to  cpu
output   [63:0] ipp_pio_rdata;
output          ipp_pio_err;
output          ipp_pio_intr;
output   [31:0] ipp_debug_port;

output 	        zcp_pio_ack;
output   [63:0] zcp_pio_rdata;
output 	        zcp_pio_err;
output 	        zcp_pio_intr;
output   [31:0] zcp_debug_port;

output   [63:0] fflp_pio_rdata;
output          fflp_pio_ack;
output          fflp_pio_err;
output          fflp_pio_intr;
output   [31:0] fflp_debug_port;

// input to ipp0
input           mac_rxc_ack0;		// xmac sends the ack to ipp
input           mac_rxc_tag0;		// xmac identifies the last part packet
input    [63:0] mac_rxc_data0;		// xmac writing the data to ipp
input           mac_rxc_ctrl0;		// active high for control information
input    [22:0] mac_rxc_stat0;		// xmac writing the status to ipp
input           dmc_ipp_dat_req0;       // dmc request data from rxc_data_fifo_0

// output of ipp0
output		rxc_mac_req0;		// req(as rdy) from ipp to xmac
output          ipp_dmc_dat_ack0;       // rxc_data_fifo_0 is sending data to dmc
output  [129:0] ipp_dmc_data0;          // rxc_data_fifo_0's data to dmc
output          ipp_dmc_ful_pkt0;       // rxc_data_fifo_0 has at least 1 full packet
output          ipp_dmc_dat_err0;       // rxc_data_fifo_0 data has error

// input to ipp1
input           mac_rxc_ack1;   	// xmac sends the ack to ipp
input           mac_rxc_tag1;   	// bmac identifies the last part packet
input    [63:0] mac_rxc_data1;  	// bmac writing the data to ipp         
input           mac_rxc_ctrl1;		// active high for control information
input    [22:0] mac_rxc_stat1;  	// bmac writing the status to ipp
input           dmc_ipp_dat_req1;       // dmc request data from rxc_data_fifo_1

// output of ipp1
output		rxc_mac_req1;		// ack from ipp to bmac
output          ipp_dmc_dat_ack1;       // rxc_data_fifo_1 is sending data to dmc
output  [129:0] ipp_dmc_data1;          // rxc_data_fifo_1's data to dmc
output          ipp_dmc_ful_pkt1;       // rxc_data_fifo_1 has at least 1 full packet
output          ipp_dmc_dat_err1;       // rxc_data_fifo_1 data has ewrror

`ifdef NEPTUNE
// input to ipp2
input           mac_rxc_req2;   	// bmac sends the request to ipp
input           mac_rxc_tag2;   	// bmac identifies the last part packet
input    [63:0] mac_rxc_data2;  	// bmac writing the data to ipp         
input           mac_rxc_ctrl2;		// active high for control information
input    [22:0] mac_rxc_stat2;  	// bmac writing the status to ipp
input           dmc_ipp_dat_req2;       // dmc request data from rxc_data_fifo_2

// output of ipp2
output		rxc_mac_ack2;		// ack from ipp to bmac
output          ipp_dmc_dat_ack2;       // rxc_data_fifo_2 is sending data to dmc
output  [129:0] ipp_dmc_data2;          // rxc_data_fifo_2's data to dmc
output          ipp_dmc_ful_pkt2;       // rxc_data_fifo_2 has at least 1 full packet
output          ipp_dmc_dat_err2;       // rxc_data_fifo_2 data has error

// input to ipp3
input           mac_rxc_req3;   	// bmac sends the request to ipp
input           mac_rxc_tag3;   	// bmac identifies the last part packet
input    [63:0] mac_rxc_data3;  	// bmac writing the data to ipp         
input           mac_rxc_ctrl3;		// active high for control information
input    [22:0] mac_rxc_stat3; 		// bmac writing the status to ipp
input           dmc_ipp_dat_req3;       // dmc request data from rxc_data_fifo_3

// output of ipp3
output		rxc_mac_ack3;		// ack from ipp to bmac
output          ipp_dmc_dat_ack3;       // rxc_data_fifo_3 is sending data to dmc
output  [129:0] ipp_dmc_data3;          // rxc_data_fifo_3's data to dmc
output          ipp_dmc_ful_pkt3;       // rxc_data_fifo_3 has at least 1 full packet
output          ipp_dmc_dat_err3;       // rxc_data_fifo_3 data has error
`endif

// inputs to zcp.port0
input               dmc_zcp_req0;

// output of zcp.port0
output 	            zcp_dmc_ack0;
output      [129:0] zcp_dmc_dat0;
output              zcp_dmc_dat_err0;
output 	            zcp_dmc_ful_pkt0;

// inputs to zcp.port1
input               dmc_zcp_req1;

// output of zcp.port1
output              zcp_dmc_ack1;
output [129:0] zcp_dmc_dat1;
output              zcp_dmc_dat_err1;
output              zcp_dmc_ful_pkt1;

`ifdef NEPTUNE
// inputs of zcp fr rdmc
input     [319:0]   page_handle;
input      [31:0]   rdmc_zcp_func_num;

// inputs to zcp.port2
input               dmc_zcp_req2;

// output of zcp.port2
output              zcp_dmc_ack2;
output      [129:0] zcp_dmc_dat2;
output              zcp_dmc_dat_err2;
output              zcp_dmc_ful_pkt2;

// inputs to zcp.port3
input               dmc_zcp_req3;

// output of zcp.port3
output              zcp_dmc_ack3;
output      [129:0] zcp_dmc_dat3;
output              zcp_dmc_dat_err3;
output              zcp_dmc_ful_pkt3;

// inputs of zcp fr arb1
input               arb1_zcp_req_accept;

// output of zcp to arb1
output              zcp_arb1_req;
output        [7:0] zcp_arb1_req_cmd;
output       [63:0] zcp_arb1_req_address;
output       [13:0] zcp_arb1_req_length;
output        [1:0] zcp_arb1_req_port_num;
output        [4:0] zcp_arb1_req_dma_num;
output        [1:0] zcp_arb1_req_func_num;

// inputs of zcp fr meta RESPONSE control info
input        [13:0] meta_zcp_resp_length;       // Packet Length
input         [4:0] meta_zcp_resp_dma_num;      // Channel Number
input               meta_zcp_resp_complete;     // bitwise ZCP_CLIENT[0]
input               meta_zcp_resp_transfer_cmpl;// bitwise ZCP_CLIENT[0]
input               meta_zcp_resp_ready;        // Resp Command Request
input         [7:0] meta_zcp_resp_cmd;          // cmd
input         [3:0] meta_zcp_resp_cmd_status;   // cmd status
input               meta_zcp_resp_client;       // bit 0

// output of zcp to meta RESPONSE control info
output              zcp_meta_resp_accept;       // bitwise client accept

// inputs of zcp fr meta RESPONSE data
input               meta_zcp_data_valid;        // Transfer Data Ack
input       [127:0] meta_zcp_data;              // Transfer Data
input        [15:0] meta_zcp_resp_byteenable;   // First/Last BE
input         [3:0] meta_zcp_data_status;       // Transfer Data Status
`endif

// input to fcram
`ifdef NEPTUNE
input		fcram_clk;
input		fcram_fflp_mstrready;
input		fcram_fflp_fatal_err;
input[3:0]	fcram_fflp_data_ready;
input[35:0]	fcram_fflp_even_din;
input[35:0]	fcram_fflp_odd_din;
input[15:0]	fcram_fflp_cfg_datrd;
input		fcram_fflp_cfg_done;
input		fcram_fflp_cfg_err;

// output to fcram
output          fflp_fcram_cfg_rst;
output          fflp_fcram_cfg_sel;
output          fflp_fcram_cfg_rd;
output[7:0]     fflp_fcram_cfg_addr;
output[15:0]    fflp_fcram_cfg_datwr;
output		fflp_fcram_slv_update;
output[1:0]     fflp_fcram_rd_en;
output		fflp_fcram_cs_l;
output		fflp_fcram_fn;
output		fflp_fcram_pd_l;
output		fflp_fcram_ba0;
output		fflp_fcram_ba1;
output[14:0]	fflp_fcram_addr;
output[1:0]	fflp_fcram_ds;
output[1:0]	fflp_fcram_triz_en_l;
output[35:0]	fflp_fcram_even_dout;
output[35:0]	fflp_fcram_odd_dout;
`endif

/************************** ipp **********************************************/
// output to ffl
wire            ipp_fflp_dvalid;
wire   	[1:0]  	ipp_fflp_port;
wire   	[127:0] ipp_fflp_data;
wire   	[11:0]  ipp_fflp_mac_default;

// output to cpu
wire            ipp_pio_ack;
wire     [63:0] ipp_pio_rdata;
wire            ipp_pio_err;
wire            ipp_pio_intr;
wire     [31:0] ipp_debug_port;

// output of ipp0
wire  		rxc_mac_req0;
wire            ipp_dmc_dat_ack0;
wire    [129:0] ipp_dmc_data0;
wire            ipp_dmc_ful_pkt0;
wire            ipp_dmc_dat_err0;

// output of ipp1
wire  		rxc_mac_req1;
wire            ipp_dmc_dat_ack1;
wire    [129:0] ipp_dmc_data1;
wire            ipp_dmc_ful_pkt1;
wire            ipp_dmc_dat_err1;

`ifdef NEPTUNE
// output of ipp2
wire  		rxc_mac_ack2;
wire            ipp_dmc_dat_ack2;
wire    [129:0] ipp_dmc_data2;
wire            ipp_dmc_ful_pkt2;
wire            ipp_dmc_dat_err2;

// output of ipp3
wire  		rxc_mac_ack3;
wire            ipp_dmc_dat_ack3;
wire    [129:0] ipp_dmc_data3;
wire            ipp_dmc_ful_pkt3;
wire            ipp_dmc_dat_err3;
`endif

/************************** zcp **********************************************/
wire   	            zcp_pio_ack;
wire         [63:0] zcp_pio_rdata;
wire   	            zcp_pio_err;
wire   	            zcp_pio_intr;
wire         [31:0] zcp_debug_port;

// output of zcp.port0
wire   		    zcp_dmc_ack0;
wire        [129:0] zcp_dmc_dat0;
wire   		    zcp_dmc_dat_err0;
wire   		    zcp_dmc_ful_pkt0;

// output of zcp.port1
wire   	            zcp_dmc_ack1;
wire        [129:0] zcp_dmc_dat1;
wire   	            zcp_dmc_dat_err1;
wire   	            zcp_dmc_ful_pkt1;

`ifdef NEPTUNE
// output of zcp.port2
wire                zcp_dmc_ack2;
wire        [129:0] zcp_dmc_dat2;
wire                zcp_dmc_dat_err2;
wire                zcp_dmc_ful_pkt2;

wire                zcp_dmc_ack3;
wire        [129:0] zcp_dmc_dat3;
wire                zcp_dmc_dat_err3;
wire                zcp_dmc_ful_pkt3;

// output of zcp to arb1
wire                zcp_arb1_req;
wire          [7:0] zcp_arb1_req_cmd;
wire         [63:0] zcp_arb1_req_address;
wire         [13:0] zcp_arb1_req_length;
wire          [1:0] zcp_arb1_req_port_num;
wire          [4:0] zcp_arb1_req_dma_num;
wire          [1:0] zcp_arb1_req_func_num;

// output of zcp to meta RESPONSE control info
wire                zcp_meta_resp_accept;
`endif

/************************** fflp *********************************************/
`ifdef NEPTUNE
// output to fcram
wire            fflp_fcram_cfg_rst;
wire  		fflp_fcram_cfg_sel;
wire            fflp_fcram_cfg_rd;
wire      [7:0] fflp_fcram_cfg_addr;
wire     [15:0] fflp_fcram_cfg_datwr;
wire            fflp_fcram_slv_update;
wire      [1:0] fflp_fcram_rd_en;
wire            fflp_fcram_cs_l;
wire            fflp_fcram_fn;
wire            fflp_fcram_pd_l;
wire            fflp_fcram_ba0;
wire            fflp_fcram_ba1;
wire     [14:0] fflp_fcram_addr;
wire      [1:0] fflp_fcram_ds;
wire      [1:0] fflp_fcram_triz_en_l;
wire     [35:0] fflp_fcram_even_dout;
wire     [35:0] fflp_fcram_odd_dout;
`endif

// output of fflp
wire            fflp_ipp_ready;         // ready to accept data from ipp
wire      [3:0] fflp_ipp_dvalid;        // which port's parsed data is valid
wire     [15:0] fflp_ipp_data;          // parsed packet header information

wire      [4:0] fflp_zcp_wr;
wire    [215:0] fflp_zcp_data;

wire    [199:0] cam_data_inp;
wire            cam_compare;
wire            cam_pio_wr;
wire            cam_pio_rd;
wire            cam_pio_sel;
wire      [9:0] cam_index;            // pio access address, 

wire            am_rd;
wire            am_wr;
wire      [9:0] am_addr;
wire     [41:0] am_dout;

wire     [63:0] fflp_pio_rdata;
wire            fflp_pio_ack;
wire            fflp_pio_err;
wire            fflp_pio_intr;
wire     [31:0] fflp_debug_port;

wire            vlan_tbl_cs;
wire            vlan_tbl_wr;
wire     [11:0] vlan_tbl_addr;
wire     [17:0] vlan_tbl_wr_dout;

/************************** tcam *********************************************/
// output of tcam
wire            cam_valid;     // if 1, cam is ready to accept a new comparison
wire            cam_hit;       // if 1, there is a cam match/hit
`ifdef NEPTUNE
wire      [7:0] cam_haddr;     // index of a cam match/hit entry, N2: {1'b0,haddr[6:0]}
`else
wire      [6:0] cam_haddr;
wire            reset_core_tcam;
`endif
wire            reset_core_fflp_l; 
wire            pio_rd_vld;    // pio_read_out_data valid for the core_clk domain
wire    [201:0] msk_dat_out;   // pio data read out of cam's mask  or data plane

/************************** associated ram ***********************************/
// output of associated ram
wire     [41:0] am_din;

/************************** vlan_table ***************************************/
// output of vlan_table
wire     [17:0] vlan_tbl_rd_din;

`ifdef NEPTUNE
`else
/******************************* N2 mode memory scan and mbist staff *********/
// ----- niu_rxc global bist -----
wire                           rtx_rxc_ipp0_tcu_mbist_fail;
wire                           rtx_rxc_ipp1_tcu_mbist_fail;
wire                           rtx_rxc_mb5_tcu_mbist_fail;
wire                           rtx_rxc_mb6_tcu_mbist_fail;
wire                           rtx_rxc_zcp0_tcu_mbist_fail;
wire                           rtx_rxc_zcp1_tcu_mbist_fail;

wire                           rtx_rxc_ipp0_tcu_mbist_done;
wire                           rtx_rxc_ipp1_tcu_mbist_done;
wire                           rtx_rxc_mb5_tcu_mbist_done;
wire                           rtx_rxc_mb6_tcu_mbist_done;
wire                           rtx_rxc_zcp0_tcu_mbist_done;
wire                           rtx_rxc_zcp1_tcu_mbist_done;

// ----- ipp  mem_bist -----
wire                           niu_mb3_prebuf_header_scan_out;
wire                           niu_mb3_rx_data_fifo_scan_out;
wire                           rtx_rxc_ipp0_mb3_mbist_scan_out;
wire                    [39:0] rtx_rxc_ipp0_mb3_dmo_dout;
wire                           niu_mb4_prebuf_header_scan_out;
wire                           niu_mb4_rx_data_fifo_scan_out;
wire                           rtx_rxc_ipp1_mb3_mbist_scan_out;
wire                    [39:0] rtx_rxc_ipp1_mb3_dmo_dout;

// ----- zcp  mem_bist -----
wire                           niu_mb7_cntrl_fifo_zcp_scan_out;
wire                           rtx_rxc_zcp0_mb7_mbist_scan_out;
wire                    [39:0] rtx_rxc_zcp0_mb7_dmo_dout;
wire                           niu_mb8_cntrl_fifo_zcp_scan_out;
wire                           rtx_rxc_zcp1_mb7_mbist_scan_out;
wire                    [39:0] rtx_rxc_zcp1_mb7_dmo_dout;

// ----- tcam mem_bist -----
wire                           niu_mb5_tcam_cntrl_scan_out;
wire                           rtx_rxc_tcam_cntrl_mbist_scan_out;

wire                     [6:0] niu_mb5_addr;
wire                           niu_mb5_tcam_cntrl_rd_en;
wire                           niu_mb5_tcam_cntrl_wr_en;
wire                           niu_mb5_run;
wire                   [199:0] niu_mb5_data_inp;
wire                           niu_mb5_pio_sel;
wire                           niu_mb5_cam_compare;

// ----- vlan mem_bist -----
wire                           niu_mb6_tcam_array_scan_out;
wire                           niu_mb6_vlan_scan_out;
wire                           rtx_rxc_tcam_vlan_mbist_scan_out;
wire                    [39:0] rtx_rxc_vlan_mb6_dmo_dout;

wire                     [7:0] niu_mb6_wdata;
wire                    [11:0] niu_mb6_addr;
wire                           niu_mb6_run;
wire                           niu_mb6_tcam_array_wr_en;
wire                           niu_mb6_tcam_array_rd_en;
wire                     [6:0] niu_mb6_tcam_array_rd_addr  = niu_mb6_addr[6:0];
wire                     [6:0] niu_mb6_tcam_array_wr_addr  = niu_mb6_addr[6:0];
wire                           niu_mb6_tcam_array_run      = niu_mb6_run;
wire                    [41:0] niu_mb6_tcam_array_wdata_42 = {niu_mb6_wdata[1:0],{5{niu_mb6_wdata}}};
wire                    [41:0] niu_mb6_tcam_array_data_out = am_din[41:0];

wire                    [11:0] niu_mb6_vlan_rw_addr        = niu_mb6_addr[11:0];
wire                           niu_mb6_vlan_wr_en;
wire                           niu_mb6_vlan_rd_en;
wire                           niu_mb6_vlan_run            = niu_mb6_run;
wire                     [8:0] niu_mb6_vlan_wdata_9        = {niu_mb6_wdata[0],niu_mb6_wdata};
wire                     [8:0] niu_mb6_vlan_data_out       = vlan_tbl_rd_din[8:0];

/******************************* N2 mode repairable SRAM headers *************/
wire                     [6:0] sram_hdr_read_data_ipp0;
wire                     [6:0] sram_hdr_read_data_ipp1;

wire                     [6:0] sram_hdr_read_data_zcp0;
wire                     [6:0] sram_hdr_read_data_zcp1;

wire                     [5:0] sram_hdr_read_data_vlan;

`endif

/******************************* Instantiation niu_ipp ***********************/

  niu_ipp_top ipp_top_0 (
`ifdef NEPTUNE
`else
                   .tcu_mbist_user_mode             (tcu_mbist_user_mode),
                   .tcu_scan_en                     (tcu_scan_en),
                   .tcu_mbist_bisi_en               (tcu_mbist_bisi_en),
                   .tcu_rtx_rxc_ipp0_mbist_start    (tcu_rtx_rxc_ipp0_mbist_start),
                   .tcu_rtx_rxc_ipp1_mbist_start    (tcu_rtx_rxc_ipp1_mbist_start),
                   .rtx_rxc_ipp0_tcu_mbist_fail     (rtx_rxc_ipp0_tcu_mbist_fail),
                   .rtx_rxc_ipp0_tcu_mbist_done     (rtx_rxc_ipp0_tcu_mbist_done),
                   .rtx_rxc_ipp1_tcu_mbist_fail     (rtx_rxc_ipp1_tcu_mbist_fail),
                   .rtx_rxc_ipp1_tcu_mbist_done     (rtx_rxc_ipp1_tcu_mbist_done),
                   .niu_mb3_prebuf_header_scan_in   (niu_mb3_prebuf_header_scan_in),
                   .niu_mb3_prebuf_header_scan_out  (niu_mb3_prebuf_header_scan_out),
                   .niu_mb3_rx_data_fifo_scan_in    (niu_mb3_rx_data_fifo_scan_in),
                   .niu_mb3_rx_data_fifo_scan_out   (niu_mb3_rx_data_fifo_scan_out),
                   .rtx_rxc_ipp0_mb3_mbist_scan_in  (rtx_rxc_ipp0_mb3_mbist_scan_in),
                   .rtx_rxc_ipp0_mb3_mbist_scan_out (rtx_rxc_ipp0_mb3_mbist_scan_out),
                   .rtx_rxc_ipp0_mb3_dmo_dout       (rtx_rxc_ipp0_mb3_dmo_dout),
                   .niu_mb4_prebuf_header_scan_in   (niu_mb4_prebuf_header_scan_in),
                   .niu_mb4_prebuf_header_scan_out  (niu_mb4_prebuf_header_scan_out),
                   .niu_mb4_rx_data_fifo_scan_in    (niu_mb4_rx_data_fifo_scan_in),
                   .niu_mb4_rx_data_fifo_scan_out   (niu_mb4_rx_data_fifo_scan_out),
                   .rtx_rxc_ipp1_mb3_mbist_scan_in  (rtx_rxc_ipp1_mb3_mbist_scan_in),
                   .rtx_rxc_ipp1_mb3_mbist_scan_out (rtx_rxc_ipp1_mb3_mbist_scan_out),
                   .rtx_rxc_ipp1_mb3_dmo_dout       (rtx_rxc_ipp1_mb3_dmo_dout),

                   .hdr_sram_rvalue_ipp0            (hdr_sram_rvalue_ipp0),
                   .hdr_sram_rid_ipp0               (hdr_sram_rid_ipp0),
                   .hdr_sram_wr_en_ipp0             (hdr_sram_wr_en_ipp0),
                   .hdr_sram_red_clr_ipp0           (hdr_sram_red_clr_ipp0),
                   .sram_hdr_read_data_ipp0         (sram_hdr_read_data_ipp0),

                   .hdr_sram_rvalue_ipp1            (hdr_sram_rvalue_ipp1),
                   .hdr_sram_rid_ipp1               (hdr_sram_rid_ipp1),
                   .hdr_sram_wr_en_ipp1             (hdr_sram_wr_en_ipp1),
                   .hdr_sram_red_clr_ipp1           (hdr_sram_red_clr_ipp1),
                   .sram_hdr_read_data_ipp1         (sram_hdr_read_data_ipp1),

                   .tcu_aclk                (tcu_aclk),
                   .tcu_bclk                (tcu_bclk),
                   .tcu_se_scancollar_in    (tcu_se_scancollar_in),
                   .tcu_se_scancollar_out   (tcu_se_scancollar_out),
                   .tcu_array_wr_inhibit    (tcu_array_wr_inhibit),

                   .iol2clk                 (iol2clk),
                   .l2clk_2x                (iol2clk_2x),
`endif
                         .fflp_ipp_ready        (fflp_ipp_ready),         // input from fflp
`ifdef NEPTUNE
                         .fflp_ipp_dvalid       (fflp_ipp_dvalid[3:0]),
`else
                         .fflp_ipp_dvalid       (fflp_ipp_dvalid[1:0]),
`endif
                         .fflp_ipp_sum          (fflp_ipp_data[13:0]),

                         .pio_clients_sel_ipp   (pio_ipp_sel),            // input from cpu
                         .pio_clients_addr      (pio_clients_addr[19:0]),
                         .pio_clients_rd        (pio_clients_rd),
                         .pio_clients_wdata     (pio_clients_wdata[31:0]),

                         .reset_l               (niu_reset_l),
                         .clk                   (niu_clk),

                         .ipp_fflp_dvalid       (ipp_fflp_dvalid),        // output to  fflp
                         .ipp_fflp_port         (ipp_fflp_port[1:0]),
                         .ipp_fflp_data         (ipp_fflp_data[127:0]),
                         .ipp_fflp_mac_default  (ipp_fflp_mac_default[11:0]),

                         .ipp_pio_ack           (ipp_pio_ack),            // output to  cpu
                         .ipp_pio_rdata         (ipp_pio_rdata[63:0]), 
                         .ipp_pio_err           (ipp_pio_err), 
                         .ipp_pio_intr          (ipp_pio_intr), 
                         .ipp_debug_port        (ipp_debug_port[31:0]), 
`ifdef NEPTUNE
// ipp3
                         .mac_rxc_req3          (mac_rxc_req3),           // input from bmac 
                         .mac_rxc_tag3          (mac_rxc_tag3),
                         .mac_rxc_data3         (mac_rxc_data3[63:0]),
                         .mac_rxc_ctrl3         (mac_rxc_ctrl3),
                         .mac_rxc_stat3         (mac_rxc_stat3[22:0]),
                         .dmc_ipp_dat_req3      (dmc_ipp_dat_req3),       // input from dmc  

                         .rxc_mac_ack3          (rxc_mac_ack3),           // output to bmac 
                         .ipp_dmc_dat_ack3      (ipp_dmc_dat_ack3),       // output to  dmc
                         .ipp_dmc_data3         (ipp_dmc_data3[129:0]),
                         .ipp_dmc_ful_pkt3      (ipp_dmc_ful_pkt3),
                         .ipp_dmc_dat_err3      (ipp_dmc_dat_err3),
// ipp2
                         .mac_rxc_req2          (mac_rxc_req2),           // input from bmac 
                         .mac_rxc_tag2          (mac_rxc_tag2),
                         .mac_rxc_data2         (mac_rxc_data2[63:0]),
                         .mac_rxc_ctrl2         (mac_rxc_ctrl2),
                         .mac_rxc_stat2         (mac_rxc_stat2[22:0]),
                         .dmc_ipp_dat_req2      (dmc_ipp_dat_req2),       // input from dmc  

                         .rxc_mac_ack2          (rxc_mac_ack2),           // output to bmac 
                         .ipp_dmc_dat_ack2      (ipp_dmc_dat_ack2),       // output to  dmc
                         .ipp_dmc_data2         (ipp_dmc_data2[129:0]),
                         .ipp_dmc_ful_pkt2      (ipp_dmc_ful_pkt2),
                         .ipp_dmc_dat_err2      (ipp_dmc_dat_err2),
`endif
// ipp1
                         .mac_rxc_ack1          (mac_rxc_ack1),           // input from xmac 
                         .mac_rxc_tag1          (mac_rxc_tag1),
                         .mac_rxc_data1         (mac_rxc_data1[63:0]),
                         .mac_rxc_ctrl1         (mac_rxc_ctrl1),
                         .mac_rxc_stat1         (mac_rxc_stat1[22:0]),
                         .dmc_ipp_dat_req1      (dmc_ipp_dat_req1),       // input from dmc  

                         .rxc_mac_req1          (rxc_mac_req1),           // output to xmac 
                         .ipp_dmc_dat_ack1      (ipp_dmc_dat_ack1),       // output to  dmc
                         .ipp_dmc_data1         (ipp_dmc_data1[129:0]),
                         .ipp_dmc_ful_pkt1      (ipp_dmc_ful_pkt1),
                         .ipp_dmc_dat_err1      (ipp_dmc_dat_err1),
// ipp0
                         .mac_rxc_ack0          (mac_rxc_ack0),           // input from xmac
                         .mac_rxc_tag0          (mac_rxc_tag0),
                         .mac_rxc_data0         (mac_rxc_data0[63:0]),
                         .mac_rxc_ctrl0         (mac_rxc_ctrl0),
                         .mac_rxc_stat0         (mac_rxc_stat0[22:0]),
                         .dmc_ipp_dat_req0      (dmc_ipp_dat_req0),       // input from dmc  

                         .rxc_mac_req0          (rxc_mac_req0),           // output to xmac 
                         .ipp_dmc_dat_ack0      (ipp_dmc_dat_ack0),       // output to  dmc
                         .ipp_dmc_data0         (ipp_dmc_data0[129:0]),
                         .ipp_dmc_ful_pkt0      (ipp_dmc_ful_pkt0),
                         .ipp_dmc_dat_err0      (ipp_dmc_dat_err0) 
                        );    // end of niu_ipp_top pin definition

/******************************* Instantiation niu_zcp ***********************/
  niu_zcp   niu_zcp_0   (
                         .zcp_pio_ack                      (zcp_pio_ack),
                         .zcp_pio_rdata                    (zcp_pio_rdata[63:0]),
                         .zcp_pio_err                      (zcp_pio_err),
                         .zcp_pio_intr                     (zcp_pio_intr),
                         .zcp_debug_port                   (zcp_debug_port),
                         .zcp_dmc_ack0                     (zcp_dmc_ack0),
                         .zcp_dmc_dat0                     (zcp_dmc_dat0[129:0]),
                         .zcp_dmc_dat_err0                 (zcp_dmc_dat_err0),
                         .zcp_dmc_ful_pkt0                 (zcp_dmc_ful_pkt0),
                         .zcp_dmc_ack1                     (zcp_dmc_ack1),
                         .zcp_dmc_dat1                     (zcp_dmc_dat1[129:0]),
                         .zcp_dmc_dat_err1                 (zcp_dmc_dat_err1),
                         .zcp_dmc_ful_pkt1                 (zcp_dmc_ful_pkt1),
`ifdef NEPTUNE           .zcp_dmc_ack2                     (zcp_dmc_ack2),
                         .zcp_dmc_dat2                     (zcp_dmc_dat2[129:0]),
                         .zcp_dmc_dat_err2                 (zcp_dmc_dat_err2),
                         .zcp_dmc_ful_pkt2                 (zcp_dmc_ful_pkt2),
                         .zcp_dmc_ack3                     (zcp_dmc_ack3),
                         .zcp_dmc_dat3                     (zcp_dmc_dat3[129:0]),
                         .zcp_dmc_dat_err3                 (zcp_dmc_dat_err3),
                         .zcp_dmc_ful_pkt3                 (zcp_dmc_ful_pkt3),
                         .zcp_arb1_req                     (zcp_arb1_req),
                         .zcp_arb1_req_cmd                 (zcp_arb1_req_cmd[7:0]),
                         .zcp_arb1_req_address             (zcp_arb1_req_address[63:0]),
                         .zcp_arb1_req_length              (zcp_arb1_req_length[13:0]),
                         .zcp_arb1_req_port_num            (zcp_arb1_req_port_num[1:0]),
                         .zcp_arb1_req_dma_num             (zcp_arb1_req_dma_num[4:0]),
                         .zcp_arb1_req_func_num            (zcp_arb1_req_func_num[1:0]),
                         .zcp_meta_resp_accept             (zcp_meta_resp_accept),
`endif
                         .clk                              (niu_clk),
                         .reset_l                          (niu_reset_l),
                         .pio_clients_addr                 (pio_clients_addr[19:0]),
                         .pio_clients_rd                   (pio_clients_rd),
                         .pio_clients_wdata                (pio_clients_wdata[31:0]),
                         .pio_zcp_sel                      (pio_zcp_sel),
                         .fflp_zcp_wr                      (fflp_zcp_wr),
                         .fflp_zcp_data                    (fflp_zcp_data[215:0]),
`ifdef NEPTUNE
                         .page_handle                      (page_handle),
                         .rdmc_zcp_func_num                (rdmc_zcp_func_num),
                         .dmc_zcp_req3                     (dmc_zcp_req3),
                         .dmc_zcp_req2                     (dmc_zcp_req2),
                         .arb1_zcp_req_accept              (arb1_zcp_req_accept),
                         .meta_zcp_resp_length             (meta_zcp_resp_length[13:0]),
                         .meta_zcp_resp_dma_num            (meta_zcp_resp_dma_num[4:0]),
                         .meta_zcp_resp_complete           (meta_zcp_resp_complete),
                         .meta_zcp_resp_transfer_cmpl      (meta_zcp_resp_transfer_cmpl),
                         .meta_zcp_resp_ready              (meta_zcp_resp_ready),
                         .meta_zcp_resp_cmd                (meta_zcp_resp_cmd[7:0]),
                         .meta_zcp_resp_cmd_status         (meta_zcp_resp_cmd_status[3:0]),
                         .meta_zcp_resp_client             (meta_zcp_resp_client),
                         .meta_zcp_data_valid              (meta_zcp_data_valid),
                         .meta_zcp_data                    (meta_zcp_data[127:0]),
                         .meta_zcp_resp_byteenable         (meta_zcp_resp_byteenable[15:0]),
                         .meta_zcp_data_status             (meta_zcp_data_status[3:0]),
`endif
                         .dmc_zcp_req1                     (dmc_zcp_req1),
`ifdef NEPTUNE
                         .dmc_zcp_req0                     (dmc_zcp_req0)
                        );
`else
                         .dmc_zcp_req0                     (dmc_zcp_req0),
                         .iol2clk                          (iol2clk),
                         .tcu_mbist_user_mode              (tcu_mbist_user_mode),
                         .tcu_aclk                         (tcu_aclk),
                         .tcu_bclk                         (tcu_bclk),
                         .tcu_se_scancollar_in             (tcu_se_scancollar_in),
                         .tcu_se_scancollar_out            (tcu_se_scancollar_out),
                         .tcu_array_wr_inhibit             (tcu_array_wr_inhibit),
                         .niu_mb7_cntrl_fifo_zcp_scan_in   (niu_mb7_cntrl_fifo_zcp_scan_in),
                         .niu_mb7_cntrl_fifo_zcp_scan_out  (niu_mb7_cntrl_fifo_zcp_scan_out),
                         .l2clk_2x                         (iol2clk_2x),
                         .hdr_sram_rvalue_zcp0             (hdr_sram_rvalue_zcp0),
                         .hdr_sram_rid_zcp0                (hdr_sram_rid_zcp0),
                         .hdr_sram_wr_en_zcp0              (hdr_sram_wr_en_zcp0),
                         .hdr_sram_red_clr_zcp0            (hdr_sram_red_clr_zcp0),
                         .sram_hdr_read_data_zcp0          (sram_hdr_read_data_zcp0),
                         .rtx_rxc_zcp0_mb7_dmo_dout        (rtx_rxc_zcp0_mb7_dmo_dout),
                         .hdr_sram_rvalue_zcp1             (hdr_sram_rvalue_zcp1),
                         .hdr_sram_rid_zcp1                (hdr_sram_rid_zcp1),
                         .hdr_sram_wr_en_zcp1              (hdr_sram_wr_en_zcp1),
                         .hdr_sram_red_clr_zcp1            (hdr_sram_red_clr_zcp1),
                         .sram_hdr_read_data_zcp1          (sram_hdr_read_data_zcp1),
                         .rtx_rxc_zcp1_mb7_dmo_dout        (rtx_rxc_zcp1_mb7_dmo_dout),
                         .niu_tcu_mbist_fail_7             (rtx_rxc_zcp0_tcu_mbist_fail),
                         .niu_tcu_mbist_done_7             (rtx_rxc_zcp0_tcu_mbist_done),
                         .mb7_scan_in                      (rtx_rxc_zcp0_mb7_mbist_scan_in),
                         .mb7_scan_out                     (rtx_rxc_zcp0_mb7_mbist_scan_out),
                         .tcu_niu_mbist_start_7            (tcu_rtx_rxc_zcp0_mbist_start),
                         .tcu_mbist_bisi_en                (tcu_mbist_bisi_en),
                         .tcu_scan_en                      (tcu_scan_en),
                         .niu_mb8_cntrl_fifo_zcp_scan_in   (niu_mb8_cntrl_fifo_zcp_scan_in),
                         .niu_mb8_cntrl_fifo_zcp_scan_out  (niu_mb8_cntrl_fifo_zcp_scan_out),
                         .niu_tcu_mbist_fail_8             (rtx_rxc_zcp1_tcu_mbist_fail),
                         .niu_tcu_mbist_done_8             (rtx_rxc_zcp1_tcu_mbist_done),
                         .mb8_scan_in                      (rtx_rxc_zcp1_mb7_mbist_scan_in),
                         .mb8_scan_out                     (rtx_rxc_zcp1_mb7_mbist_scan_out),
                         .tcu_niu_mbist_start_8            (tcu_rtx_rxc_zcp1_mbist_start)
                        );
`endif

/******************************* Instantiation niu_fflp **********************/
  fflp fflp_0 (
               .cclk                   (niu_clk),
               .reset_l                (reset_core_fflp_l),
//ipp if
               .ipp_fflp_dvalid        (ipp_fflp_dvalid),
               .ipp_fflp_data          (ipp_fflp_data[127:0]),
               .ipp_fflp_mac_default   (ipp_fflp_mac_default[11:0]),
               .ipp_fflp_mac_port      (ipp_fflp_port[1:0]),

               .fflp_ipp_ready         (fflp_ipp_ready),
               .fflp_ipp_dvalid        (fflp_ipp_dvalid[3:0]),
               .fflp_ipp_data          (fflp_ipp_data[15:0]),
//cam if
               .cam_hit                (cam_hit),
               .cam_valid              (cam_valid),
`ifdef NEPTUNE
               .cam_haddr              ({2'h0,cam_haddr[7:0]}),
`else
               .cam_haddr              ({3'h0,cam_haddr[6:0]}),
`endif
               .pio_rd_vld             (pio_rd_vld),
               .cam_msk_dat_out        (msk_dat_out[199:0]), // geo: change it with new release

               .cam_data_inp           (cam_data_inp[199:0]),
               .cam_compare            (cam_compare),
               .cam_pio_wr             (cam_pio_wr),
               .cam_pio_rd             (cam_pio_rd),
               .cam_pio_sel            (cam_pio_sel),
               .cam_index              (cam_index[9:0]),
//ram if
               .am_din                 (am_din[41:0]),

               .am_rd                  (am_rd),
               .am_wr                  (am_wr),
               .am_addr                (am_addr[9:0]),
               .am_dout                (am_dout[41:0]),
//zcp if
               .fflp_zcp_wr            (fflp_zcp_wr),
               .fflp_zcp_data          (fflp_zcp_data[215:0]),
//pio if
               .pio_fflp_wdata         (pio_clients_wdata[63:0]),
               .pio_fflp_rd            (pio_clients_rd),
               .pio_fflp_sel           (pio_fflp_sel),
               .pio_fflp_addr          (pio_clients_addr[19:0]),
`ifdef NEPTUNE
               .pio_client_32b         (pio_client_32b),
`endif
               .fflp_pio_rdata         (fflp_pio_rdata[63:0]),
               .fflp_pio_ack           (fflp_pio_ack),
               .fflp_pio_err           (fflp_pio_err),
               .fflp_pio_intr          (fflp_pio_intr),
//vlan table
               .vlan_tbl_rd_din        (vlan_tbl_rd_din[17:0]),
               .vlan_tbl_cs            (vlan_tbl_cs),
               .vlan_tbl_wr            (vlan_tbl_wr),
               .vlan_tbl_addr          (vlan_tbl_addr[11:0]),
               .vlan_tbl_wr_dout       (vlan_tbl_wr_dout[17:0]),
`ifdef NEPTUNE
//fcram if
               .fcram_clk              (fcram_clk),
               .fcram_fflp_mstrready   (fcram_fflp_mstrready),
               .fcram_fflp_fatal_err   (fcram_fflp_fatal_err),
               .fcram_fflp_data_ready  (fcram_fflp_data_ready[3:0]),
               .fcram_fflp_even_din    (fcram_fflp_even_din[35:0]),
               .fcram_fflp_odd_din     (fcram_fflp_odd_din[35:0]),
               .fcram_fflp_cfg_datrd   (fcram_fflp_cfg_datrd[15:0]),
               .fcram_fflp_cfg_done    (fcram_fflp_cfg_done),
               .fcram_fflp_cfg_err     (fcram_fflp_cfg_err),

               .fflp_fcram_cfg_rst     (fflp_fcram_cfg_rst),
               .fflp_fcram_cfg_sel     (fflp_fcram_cfg_sel),
               .fflp_fcram_cfg_rd      (fflp_fcram_cfg_rd),
               .fflp_fcram_cfg_addr    (fflp_fcram_cfg_addr[7:0]),
               .fflp_fcram_cfg_datwr   (fflp_fcram_cfg_datwr[15:0]),
               .fflp_fcram_slv_update  (fflp_fcram_slv_update),
               .fflp_fcram_rd_en       (fflp_fcram_rd_en[1:0]),
               .fflp_fcram_cs_l        (fflp_fcram_cs_l),
               .fflp_fcram_fn          (fflp_fcram_fn),
               .fflp_fcram_pd_l        (fflp_fcram_pd_l),
               .fflp_fcram_ba0         (fflp_fcram_ba0),
               .fflp_fcram_ba1         (fflp_fcram_ba1),
               .fflp_fcram_addr        (fflp_fcram_addr[14:0]),
               .fflp_fcram_ds          (fflp_fcram_ds[1:0]),
               .fflp_fcram_triz_en_l   (fflp_fcram_triz_en_l[1:0]),
               .fflp_fcram_even_dout   (fflp_fcram_even_dout[35:0]),
               .fflp_fcram_odd_dout    (fflp_fcram_odd_dout[35:0]),
`endif
               .fflp_debug_port        (fflp_debug_port[31:0])
              );

/******************************* Instantiation niu_tcam **********************/
  niu_tcam niu_tcam_0 (
                       .data_inp               (cam_data_inp[199:0]),
                       .cam_compare            (cam_compare),
                       .pio_wt                 (cam_pio_wr),
                       .pio_rd                 (cam_pio_rd),
                       .pio_sel                (cam_pio_sel),
`ifdef NEPTUNE
                       .cam_index              (cam_index[7:0]),
`else
                       .cam_index              (cam_index[6:0]),
                       .tcu_se_scancollar_in   (tcu_se_scancollar_in),
                       .tcu_se_scancollar_out  (tcu_se_scancollar_out),
                       .tcu_array_wr_inhibit   (tcu_array_wr_inhibit),
                       .tcu_aclk               (tcu_aclk),
                       .tcu_bclk               (tcu_bclk),
                       .iol2clk                (iol2clk),
                       .scan_in                (niu_mb5_tcam_cntrl_scan_in),
                       .scan_out               (niu_mb5_tcam_cntrl_scan_out),
                       .reset_core_tcam        (reset_core_tcam),
                       .mbi_wdata              (niu_mb5_data_inp[199:0]),
                       .mbi_rw_adr             (niu_mb5_addr[6:0]),
                       .mbi_pio_sel            (niu_mb5_pio_sel),
                       .mbi_wr_en              (niu_mb5_tcam_cntrl_wr_en),
                       .mbi_rd_en              (niu_mb5_tcam_cntrl_rd_en),
                       .mbi_compare            (niu_mb5_cam_compare),
                       .mbi_run                (niu_mb5_run),
`endif
                       .reset_l                (niu_reset_l),
                       .clk                    (niu_clk),
                       .cam_valid              (cam_valid),
                       .cam_hit                (cam_hit),
`ifdef NEPTUNE
                       .cam_haddr              (cam_haddr[7:0]),
`else
                       .cam_haddr              (cam_haddr[6:0]),
`endif
                       .reset_core_fflp_l      (reset_core_fflp_l),
                       .pio_rd_vld             (pio_rd_vld),
                       .msk_dat_out            (msk_dat_out[201:0])
                      );

/******************************* Instantiation fflp's RAMs *******************/
`ifdef NEPTUNE
  niu_ram_s_4096_18 niu_ram_4096_18_0 (
                                     .data_inp                (vlan_tbl_wr_dout[17:0]),
                                     .addr_rw                 (vlan_tbl_addr[11:0]),
                                     .wt_enable               (vlan_tbl_wr),
                                     .cs                      (vlan_tbl_cs),
                                     .clk                     (niu_clk),
                                     .data_out                (vlan_tbl_rd_din[17:0])
                                    );

  niu_ram_256_42  niu_ram_256_42_0  (
                                     .rd                      (am_rd),
                                     .rd_addr                 (am_addr[7:0]),
                                     .rd_dout                 (am_din[41:0]),
                                     .wr                      (am_wr),
                                     .wr_addr                 (am_addr[7:0]),
                                     .wr_din                  (am_dout[41:0]),
                                     .clk                     (niu_clk)
                                    );

`else
  niu_ram_s_4096x9  niu_ram_4096x9_0  (
                                     .reset                   (reset_core_tcam),
                                     .tcu_aclk                (tcu_aclk),
                                     .tcu_bclk                (tcu_bclk),
                                     .tcu_scan_en             (tcu_scan_en),
                                     .tcu_se_scancollar_in    (tcu_se_scancollar_in),
                                     .tcu_se_scancollar_out   (tcu_se_scancollar_out),
                                     .tcu_array_wr_inhibit    (tcu_array_wr_inhibit),
                                     .scan_in                 (niu_mb6_vlan_scan_in),
                                     .scan_out                (niu_mb6_vlan_scan_out),
                                     .hdr_sram_rvalue         (hdr_sram_rvalue_vlan),
                                     .hdr_sram_rid            (hdr_sram_rid_vlan),
                                     .hdr_sram_wr_en          (hdr_sram_wr_en_vlan),
                                     .hdr_sram_red_clr        (hdr_sram_red_clr_vlan),
                                     .sram_hdr_read_data      (sram_hdr_read_data_vlan),
                                     .mbi_wdata               (niu_mb6_vlan_wdata_9[8:0]),
                                     .mbi_rw_adr              (niu_mb6_vlan_rw_addr),
                                     .mbi_wr_en               (niu_mb6_vlan_wr_en),
                                     .mbi_rd_en               (niu_mb6_vlan_rd_en),
                                     .mbi_run                 (niu_mb6_vlan_run),
                                     .data_inp                (vlan_tbl_wr_dout[8:0]),
                                     .addr_rw                 (vlan_tbl_addr[11:0]),
                                     .wt_enable               (vlan_tbl_wr),
                                     .cs_rd                   (vlan_tbl_cs),
                                     .clk                     (iol2clk),
                                     .data_out                (vlan_tbl_rd_din[8:0])
                                    );
  assign vlan_tbl_rd_din[17:9] = 9'h0;

  niu_ram_128_42  niu_ram_128_42_0  (
                                     .tcu_aclk                (tcu_aclk),
                                     .tcu_bclk                (tcu_bclk),
                                     .tcu_se_scancollar_in    (tcu_se_scancollar_in),
                                     .tcu_array_wr_inhibit    (tcu_array_wr_inhibit),
                                     .scan_in                 (niu_mb6_tcam_array_scan_in),
                                     .scan_out                (niu_mb6_tcam_array_scan_out),
                                     .mbi_wdata               (niu_mb6_tcam_array_wdata_42[41:0]),
                                     .mbi_rd_adr              (niu_mb6_tcam_array_rd_addr[6:0]),
                                     .mbi_wr_adr              (niu_mb6_tcam_array_wr_addr[6:0]),
                                     .mbi_wr_en               (niu_mb6_tcam_array_wr_en),
                                     .mbi_rd_en               (niu_mb6_tcam_array_rd_en),
                                     .mbi_run                 (niu_mb6_tcam_array_run),
                                     .data_inp                (am_dout[41:0]),
                                     .addr_rd                 (am_addr[6:0]),
                                     .addr_wt                 (am_addr[6:0]),
                                     .wt_enable               (am_wr),
                                     .cs_rd                   (am_rd),
                                     .clk                     (iol2clk),
                                     .data_out                (am_din[41:0]) 
                                    );

  niu_mb5 niu_mb5_tcam_ctrl_0       (
                                     .rst                           (reset_core_tcam),
                                     .niu_mb5_tcam_cntrl_rd_en      (niu_mb5_tcam_cntrl_rd_en),
                                     .niu_mb5_tcam_cntrl_wr_en      (niu_mb5_tcam_cntrl_wr_en),
                                     .niu_mb5_addr                  (niu_mb5_addr[6:0]),
                                     .niu_mb5_run                   (niu_mb5_run),
                                     .niu_tcu_mbist_fail_5          (rtx_rxc_mb5_tcu_mbist_fail),
                                     .niu_tcu_mbist_done_5          (rtx_rxc_mb5_tcu_mbist_done),
                                     .mb5_scan_out                  (rtx_rxc_tcam_cntrl_mbist_scan_out),
                                     .niu_mb5_data_inp              (niu_mb5_data_inp[199:0]),
                                     .niu_mb5_pio_sel               (niu_mb5_pio_sel),
                                     .niu_mb5_cam_compare           (niu_mb5_cam_compare),
                                     .l1clk                         (niu_clk),
                                     .mb5_scan_in                   (rtx_rxc_tcam_cntrl_mbist_scan_in),
                                     .tcu_aclk                      (tcu_aclk),
                                     .tcu_bclk                      (tcu_bclk),
                                     .tcu_niu_mbist_start_5         (tcu_rtx_rxc_mb5_mbist_start),
                                     .niu_mb5_msk_dat_out           (msk_dat_out[199:0]),
                                     .tcu_mbist_bisi_en             (tcu_mbist_bisi_en),
                                     .niu_mb5_cam_haddr             (cam_haddr[6:0]),
                                     .niu_mb5_cam_valid             (cam_valid),
                                     .niu_mb5_rd_vld                (pio_rd_vld),
                                     .niu_mb5_cam_hit               (cam_hit),
                                     .tcu_mbist_user_mode           (tcu_mbist_user_mode)
                                    );


  niu_mb6 niu_mb6_tcam_vlan_0       (
                                     .rst                           (reset_core_tcam),
                                     .niu_mb6_tcam_array_rd_en      (niu_mb6_tcam_array_rd_en),
                                     .niu_mb6_tcam_array_wr_en      (niu_mb6_tcam_array_wr_en),
                                     .niu_mb6_vlan_rd_en            (niu_mb6_vlan_rd_en),
                                     .niu_mb6_vlan_wr_en            (niu_mb6_vlan_wr_en),
                                     .niu_mb6_addr                  (niu_mb6_addr[11:0]),
                                     .niu_mb6_wdata                 (niu_mb6_wdata),
                                     .niu_mb6_run                   (niu_mb6_run),
                                     .niu_mb6_tcam_array_data_out   (niu_mb6_tcam_array_data_out),
                                     .niu_mb6_vlan_data_out         (niu_mb6_vlan_data_out),
                                     .tcu_mbist_bisi_en             (tcu_mbist_bisi_en),
                                     .tcu_niu_mbist_start_6         (tcu_rtx_rxc_mb6_mbist_start),
                                     .niu_tcu_mbist_fail_6          (rtx_rxc_mb6_tcu_mbist_fail),
                                     .niu_tcu_mbist_done_6          (rtx_rxc_mb6_tcu_mbist_done),
                                     .l1clk                         (niu_clk),
                                     .mb6_scan_out                  (rtx_rxc_tcam_vlan_mbist_scan_out),
                                     .mb6_scan_in                   (rtx_rxc_tcam_vlan_mbist_scan_in),
                                     .mb6_dmo_dout                  (rtx_rxc_vlan_mb6_dmo_dout),
                                     .tcu_aclk                      (tcu_aclk),
                                     .tcu_bclk                      (tcu_bclk),
                                     .tcu_mbist_user_mode           (tcu_mbist_user_mode)
                                    );


`endif

endmodule
