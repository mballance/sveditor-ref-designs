// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: niu_ipp_hdr_fifo.v
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

    File name       : niu_ipp_hdr_fifo.v

    Module(s) name  : niu_ipp_hdr_fifo
    Original:       : ipp_fifo.v main/16 label: IPP_VERIF_1.79

    Parent modules  : niu_ipp.v

    Child modules   : niu_ipp.h, sram module

    Author's name   : George Chu 

    Date            : January 2004

    Description     : This file contains a 146 bit by 64 latch array used as
                      FIFO for receiving data from receive MAC.
                      This is a 1 read port and 1 write port register file.

    Synthesis Notes:

    Modification History:

    Date       Description
    ----       -----------

************************************************************
***********************************************************/

module niu_ipp_hdr_fifo(
`ifdef NEPTUNE
`else                    
                         iol2clk,
                         tcu_aclk,
                         tcu_bclk,
                         tcu_se_scancollar_in,
                         tcu_array_wr_inhibit,
                         scan_in,
                         scan_out,
                         mbi_wdata,
                         mbi_rd_adr,
                         mbi_wr_adr,
                         mbi_wr_en,
                         mbi_rd_en,
                         mbi_run,
`endif
                        ipp_hfifo_rden,
                        ipp_hfifo_rptr, 
                        ipp_hfifo_wptr,          ipp_hfifo_wten, 
                        ipp_hfifo_dinp,          inc_hfifo_dat_rptr_d,   // geo: Vega sim MUST have "fifo_rd_en"
                        ipp_ffl_dvalid_n,        clr_ipp_hfifo_par_err,
                        reset,                   clk,
                        ipp_hfifo_dout,          ipp_hfifo_par_err,
                        ipp_hfifo_par_addr
                       );

`ifdef NEPTUNE
`else
parameter DATA_WIDTH_MINUS1 = 145;
parameter ADDR_WIDTH_MINUS1 = 5;

input                          iol2clk;
input                          tcu_aclk;
input                          tcu_bclk;
input                          tcu_se_scancollar_in;
input                          tcu_array_wr_inhibit;
input                          scan_in;
output                         scan_out;

input    [DATA_WIDTH_MINUS1:0] mbi_wdata;
input    [ADDR_WIDTH_MINUS1:0] mbi_rd_adr;
input    [ADDR_WIDTH_MINUS1:0] mbi_wr_adr;
input                          mbi_wr_en;
input                          mbi_rd_en;
input                          mbi_run;
`endif

input           ipp_hfifo_rden;                 // from ipp_load module
input     [5:0] ipp_hfifo_rptr;                 // from ipp_load module
input     [5:0]	ipp_hfifo_wptr;       		// from load_sm module
input           ipp_hfifo_wten;        		// from load_sm module
input   [129:0]	ipp_hfifo_dinp;         	// from load_sm module
input           inc_hfifo_dat_rptr_d;
input           ipp_ffl_dvalid_n;		// from load_sm module
input           clr_ipp_hfifo_par_err;		// from post_ctrl module

input           reset;
input           clk;          			// clock

output  [145:0] ipp_hfifo_dout;		        // to unload module
output          ipp_hfifo_par_err;		// to ipp_post module
output    [5:0] ipp_hfifo_par_addr;

wire  	[145:0] ipp_hfifo_dout;		        // to unload module
reg             ipp_hfifo_par_err;
reg       [5:0] ipp_hfifo_par_addr;

reg       [5:0] ipp_hfifo_rptr_d1;
wire      [5:0] ipp_hfifo_par_addr_n;
wire            ipp_hfifo_check_parity = (ipp_ffl_dvalid_n || inc_hfifo_dat_rptr_d);
reg             ipp_hfifo_par_err_n_ram;
wire            ipp_hfifo_par_err_n;

reg      [15:0] header_parity;

wire     [15:0] parity_data_in = 
                              {^ipp_hfifo_dinp[007:000], ^ipp_hfifo_dinp[015:008],
                               ^ipp_hfifo_dinp[023:016], ^ipp_hfifo_dinp[031:024],
                               ^ipp_hfifo_dinp[039:032], ^ipp_hfifo_dinp[047:040],
                               ^ipp_hfifo_dinp[055:048], ^ipp_hfifo_dinp[063:056],
                               ^ipp_hfifo_dinp[071:064], ^ipp_hfifo_dinp[079:072],
                               ^ipp_hfifo_dinp[087:080], ^ipp_hfifo_dinp[095:088],
                               ^ipp_hfifo_dinp[103:096], ^ipp_hfifo_dinp[111:104],
                               ^ipp_hfifo_dinp[120:112], ^ipp_hfifo_dinp[129:121]};

//*********************************************************
//***** ipp_hfifo_mem (130+16)-bit x 64-entry  1K-byte data
//*********************************************************

  niu_ram_64_146 ram_64_146_0 (
`ifdef NEPTUNE
                                   .clk                     (clk),
`else
                                   .clk                     (iol2clk),
                                   .tcu_aclk                (tcu_aclk),
                                   .tcu_bclk                (tcu_bclk),
                                   .tcu_se_scancollar_in    (tcu_se_scancollar_in),
                                   .tcu_array_wr_inhibit    (tcu_array_wr_inhibit),
                                   .scan_in                 (scan_in),
                                   .scan_out                (scan_out),
                                   .mbi_wdata               (mbi_wdata),
                                   .mbi_rd_adr              (mbi_rd_adr),
                                   .mbi_wr_adr              (mbi_wr_adr),
                                   .mbi_wr_en               (mbi_wr_en),
                                   .mbi_rd_en               (mbi_rd_en),
                                   .mbi_run                 (mbi_run),
`endif                             .data_inp                ({parity_data_in[15:0],ipp_hfifo_dinp[129:0]}),
                                   .addr_rd                 (ipp_hfifo_rptr[5:0]),
                                   .addr_wt                 (ipp_hfifo_wptr[5:0]),
                                   .wt_enable               (ipp_hfifo_wten),
                                   .cs_rd                   (ipp_hfifo_rden /* geo 1'h1 */),
                                   .data_out                (ipp_hfifo_dout[145:0])
                                  );

//****** parity gen ******/
  always @(ipp_hfifo_dout) 
    begin
      header_parity = {^ipp_hfifo_dout[007:000], ^ipp_hfifo_dout[015:008],
                       ^ipp_hfifo_dout[023:016], ^ipp_hfifo_dout[031:024],
                       ^ipp_hfifo_dout[039:032], ^ipp_hfifo_dout[047:040],
                       ^ipp_hfifo_dout[055:048], ^ipp_hfifo_dout[063:056],
                       ^ipp_hfifo_dout[071:064], ^ipp_hfifo_dout[079:072],
                       ^ipp_hfifo_dout[087:080], ^ipp_hfifo_dout[095:088],
                       ^ipp_hfifo_dout[103:096], ^ipp_hfifo_dout[111:104],
                       ^ipp_hfifo_dout[120:112], ^ipp_hfifo_dout[129:121]};

      ipp_hfifo_par_err_n_ram = !(ipp_hfifo_dout[145:130] == header_parity[15:0]);
    end

  assign ipp_hfifo_par_err_n  = ipp_hfifo_check_parity && ipp_hfifo_par_err_n_ram || ipp_hfifo_par_err;

  assign ipp_hfifo_par_addr_n = ipp_hfifo_par_err_n && !ipp_hfifo_par_err ? ipp_hfifo_rptr_d1[5:0] :
                                                                            ipp_hfifo_par_addr[5:0];

  always @(posedge clk)
    if      (reset || clr_ipp_hfifo_par_err)
      begin
        ipp_hfifo_par_err  <= 1'h0;
        ipp_hfifo_rptr_d1  <= 6'h0;
        ipp_hfifo_par_addr <= 6'h0;
      end
    else
      begin
        ipp_hfifo_par_err  <= ipp_hfifo_par_err_n;
        ipp_hfifo_rptr_d1  <= ipp_hfifo_rptr[5:0];
        ipp_hfifo_par_addr <= ipp_hfifo_par_addr_n[5:0];
      end

endmodule

