// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: dmu_diu_idm.v
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
module dmu_diu_idm 
  (
   // Control Signals
   clk,
   rst_l,
   
   // IMU's DMS - DIU's IDM  Interface
   im2di_wr,
   im2di_addr,
   im2di_data,
   im2di_bmask,
   im2di_dpar,
 

   // CLU's CTM - DIU's IDM Interface
     // CLU's CTM - PDR
   cl2idm_addr,
   
   // DIU's IDM - DIU's Mux 

   n_idm2mux_int_data_out
   );
  
 
  //////////////////////////////////////////////////////////////////////
  //*************************   Parameters   *************************
  //////////////////////////////////////////////////////////////////////
 
  parameter MEM_WIDTH   = `FIRE_DLC_IRD_DATA_WDTH+`FIRE_DLC_IRD_BMASK_WDTH+`FIRE_DLC_IRD_DPAR_WDTH;
  parameter INT_NUM     = 16;

  //////////////////////////////////////////////////////////////////////
  //*************************   Port Declarations   *******************
  //////////////////////////////////////////////////////////////////////
  
  // Control signals  
  input                                   clk; 
  input                                   rst_l; 

  // IMU's DMS - DIU's IDM Interface
  input 				  im2di_wr;
  input [`FIRE_DLC_IRD_ADDR_WDTH-1:0] 	  im2di_addr;  // Address width, to address 16 entries
  input [`FIRE_DLC_IRD_DATA_WDTH-1:0] 	  im2di_data;  // Data width, 16 bytes
  input [`FIRE_DLC_IRD_BMASK_WDTH-1:0] 	  im2di_bmask; // 16 bit bmask 
  input [`FIRE_DLC_IRD_DPAR_WDTH-1:0] 	  im2di_dpar;  // Parity width 32 bit parity (4bits) on data 1 bit for 16 bit bmask

  // CLU's CTM - DIU Interface
  // CLU's CTM - DIU 
  input [`FIRE_DLC_IRD_ADDR_WDTH-1:0] 	  cl2idm_addr;  // Address width, to access 16 entries INT
 
  // DIU's IDM - DIU's Mux
  output [MEM_WIDTH-1:0] n_idm2mux_int_data_out;

  //////////////////////////////////////////////////////////////////////
  //*************************    Wires and Regs   **********************
  //////////////////////////////////////////////////////////////////////  
  
  // registers that are flops
  
  reg [MEM_WIDTH-1:0] 			  int_data[0:INT_NUM-1];
      
  //////////////////////////////////////////////////////////////////////
  // ********  Combinational Logic  ************************************
  //////////////////////////////////////////////////////////////////////
  
  /* #0in memory_access -read_addr cl2idm_addr -read (!im2di_wr) -write_addr im2di_addr -write im2di_wr
    -single_write -read_data  idm2mux_int_data_out -write_data ({im2di_dpar, im2di_bmask, im2di_data}) */

  // Checks that any data written on waddr is read on raddr before it is overwritten. In
  // addition, it checks that the data read from the memory is correct. Also checks that
  // no location is read by raddr and written by waddr in the same cycle.

  assign n_idm2mux_int_data_out = int_data[cl2idm_addr];

  //////////////////////////////////////////////////////////////////////
  // ***********  Sequential Logic  ************************************
  //////////////////////////////////////////////////////////////////////
 
  always @ (posedge clk)
	if(~rst_l) begin : int_data_rst
		integer j;
	    for (j = 0; j < INT_NUM; j = j + 1) begin
	int_data[j] <= {MEM_WIDTH{1'b0}};
	end
	end
    else begin
      if(im2di_wr)
	int_data[im2di_addr] <= ({im2di_dpar, im2di_bmask, im2di_data});
    end

endmodule // dmu_diu_idm
