// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: niu_ram_640_146.v
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

    File name       : niu_ram_640_146.v

    Module(s) name  : niu_ram_640_146

    Parent modules  :            

    Child modules   :           

    Author's name   : George Chu

    Date            : April. 2004

    Description     :

    Synthesis Notes:

    Modification History:
    Date       Description
    ----       -----------

************************************************************
***********************************************************/

`timescale 1ns/10ps

module niu_ram_640_146 (
                        data_inp,
                        addr_rd,
                        addr_wt,
                        wt_enable,
                        cs_rd,
                        clk,
                        data_out 
                      );

input  [145:0] data_inp;      // data_input,               via port_B
input    [9:0] addr_rd;       //  read_address,            via port_A
input    [9:0] addr_wt;       // write_address,            via port_B
input          wt_enable;     // write_enable,             via port_B
input          cs_rd;         // chip_selet_rd_port,     i.e., port_A
input          clk;           // clock 
output [145:0] data_out;      // data read out, via port_A

/** temperarily forcing *** TI_scan ******************************************/
// inputs of TI_scan
wire           scan_in      = 1'h0;
wire           se           = 1'h0;
wire           tcu_pce_ov   = 1'h0;
wire           tcu_clk_stop = 1'h0;
wire           tcu_aclk     = clk;
wire           tcu_bclk     = clk;

wire   [145:0] data_out;
wire           scan_out;

  n2_niu_dp_640x146s_cust ram_640_146_0 (
                                           .wr_adr         (addr_wt[9:0]),
                                           .wr_en          (wt_enable),
                                           .rd_adr         (addr_rd[9:0]),
                                           .rd_en          (cs_rd),
                                           .din            (data_inp[145:0]),
                                           .dout           (data_out[145:0]),
                                           .rdclk          (clk),
                                           .wrclk          (clk),
                                           .scan_in        (scan_in),
                                           .se             (se),
                                           .tcu_pce_ov     (tcu_pce_ov),
                                           .tcu_clk_stop   (tcu_aclk),
                                           .tcu_aclk       (tcu_bclk),
                                           .tcu_bclk       (tcu_bclk),
                                           .scan_out       (scan_out)
                                          );

endmodule
