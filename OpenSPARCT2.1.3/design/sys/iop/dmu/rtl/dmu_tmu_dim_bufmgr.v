// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: dmu_tmu_dim_bufmgr.v
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
module dmu_tmu_dim_bufmgr (
				clk,
				rst_l,
				
				// CLU buf rel, DIU pointer interface
				cl2tm_dma_rptr,
				cl2tm_int_rptr,
				tm2cl_dma_wptr,
				tm2cl_pio_wptr,
				
				// talk to xfrfsm.v
				diu_dma_full,
				diu_int_full,
				int_cl_req,
				rcd_deq,
				
				// talk to datafsm.v
				dma_cl_req,
				dma_cl_inc,
				pio_cl_inc,
				diu_pio_cl_wptr,
				diu_dma_cl_wptr,

				d_ptr_out );
  
  //synopsys sync_set_reset "rst_l"

  // >>>>>>>>>>>>>>>>>>>>>>>>> Port Declarations <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<  

  //------------------------------------------------------------------------
  //  Clock and Reset Signals
  //------------------------------------------------------------------------
  input		  clk;		    
  input		  rst_l;

  //------------------------------------------------------------------------
  //   CLU - TMU interface
  //------------------------------------------------------------------------
  input [`FIRE_DLC_DMA_RPTR_WDTH-1:0]  cl2tm_dma_rptr;
  input [`FIRE_DLC_INT_RPTR_WDTH-1:0]  cl2tm_int_rptr;    
  output [`FIRE_DLC_DMA_WPTR_WDTH-1:0] tm2cl_dma_wptr;
  output [`FIRE_DLC_PIO_WPTR_WDTH-1:0] tm2cl_pio_wptr;
				      
  //------------------------------------------------------------------------
  //   talk to xfrfsm.v
  //------------------------------------------------------------------------
  output 			      diu_dma_full;   //   to xfrfsm.v & datafsm.v
  output 			      diu_int_full; 
  input 			      int_cl_req;
  input 			      rcd_deq;

  //------------------------------------------------------------------------
  //   talk to datafsm.v
  //------------------------------------------------------------------------
  input 			      dma_cl_req;           
  input 			      dma_cl_inc;           
  input 			      pio_cl_inc;           
  output [`FIRE_DLC_DMA_WPTR_WDTH-2:0] diu_dma_cl_wptr;     
  output [`FIRE_DLC_PIO_WPTR_WDTH-2:0] diu_pio_cl_wptr;
     
  //------------------------------------------------------------------------
  //   talk to rcdbldr.v
  //------------------------------------------------------------------------
  output [`FIRE_DLC_DIM_DPTR_WDTH-1:0] d_ptr_out;    

  // >>>>>>>>>>>>>>>>>>>>>>>>> Data Type Declarations <<<<<<<<<<<<<<<<<<<<<<<<<

  // ~~~~~~~~~~~~~~~~~~~~~~~~~ REGISTER - FLOPS ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  reg [`FIRE_DLC_DMA_WPTR_WDTH-1:0]   dma_wptr; // MSB is rollover bit
  reg [`FIRE_DLC_DMA_WPTR_WDTH-1:0]   dma_sd_wptr;  // for buffer fullness
  reg [`FIRE_DLC_PIO_WPTR_WDTH-1:0]   pio_wptr;     // MSB is rollover bit
  reg [`FIRE_DLC_INT_RPTR_WDTH-1:0]   int_wptr;      

  reg [`FIRE_DLC_DIM_DPTR_WDTH-1:0]   tran_id;      

  // ~~~~~~~~~~~~~~~~~~~~~~~~~ REGISTER - NON-FLOPS ~~~~~~~~~~~~~~~~~~~~~~~~~~

  // ~~~~~~~~~~~~~~~~~~~~~~~~~ NETS ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  wire [`FIRE_DLC_DIM_DPTR_WDTH-1:0]  d_ptr_out;
  
  // >>>>>>>>>>>>>>>>>>>>>>>>> Zero In Checkers <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<

  // 0in max -var int_wptr[`FIRE_DLC_INT_RPTR_WDTH-2:0] -val 4'b1011
  

  // >>>>>>>>>>>>>>>>>>>>>>>>> RTL/Behavioral Model <<<<<<<<<<<<<<<<<<<<<<<<<<<

  //---------------------------------------------------------------------
  // buffer credit management - *_cl_req will not be asserted 
  //                            if there is no corresponding credit
  //---------------------------------------------------------------------

  // ~~~~~~~ increment dma_sd_wptr ~~~~~~~~
  always @(posedge clk)
    if (~rst_l)
      dma_sd_wptr <= {`FIRE_DLC_DMA_WPTR_WDTH{1'b0}};
    else if (dma_cl_req)
      dma_sd_wptr <= dma_sd_wptr + 1'b1;

  // ~~~~~~~ dma buffer fullness ~~~~~~~~
  assign diu_dma_full = (cl2tm_dma_rptr[4:0] == dma_sd_wptr[4:0]) &
			  (cl2tm_dma_rptr[5] ^ dma_sd_wptr[5]);
  
  // ~~~~~~~ int buffer fullness ~~~~~~~~
  assign diu_int_full = (cl2tm_int_rptr[3:0] == int_wptr[3:0]) &
			  (cl2tm_int_rptr[4] ^ int_wptr[4]);

  //---------------------------------------------------------------------
  // buffer write pointer management
  //---------------------------------------------------------------------

  // ~~~~~~~ increment dma_wptr ~~~~~~~~
  always @(posedge clk)
    if (~rst_l)
      dma_wptr <= {`FIRE_DLC_DMA_WPTR_WDTH{1'b0}};
    else if (dma_cl_inc)
      dma_wptr <= dma_wptr + 1'b1;

  
  // ~~~~~~~ increment pio_wptr ~~~~~~~~
  always @(posedge clk)
    if (~rst_l)
      pio_wptr <= {`FIRE_DLC_PIO_WPTR_WDTH{1'b0}};
    else if (pio_cl_inc)
      pio_wptr <= pio_wptr + 1'b1;

  // ~~~~~~~ increment int_wptr ~~~~~~~~
  // there are 16 cache lines in DIU INT buf, 0000->1011 for EQ writes
  // 1100->1111 for Mondo
  always @(posedge clk)
    if (~rst_l)
      int_wptr <= {`FIRE_DLC_INT_RPTR_WDTH{1'b0}};
    else if (int_cl_req)
      begin
	if (int_wptr[`FIRE_DLC_INT_RPTR_WDTH-2:0] == 4'b1011)
	  begin
	    int_wptr[`FIRE_DLC_INT_RPTR_WDTH-2:0] <= 4'b0;
	    int_wptr[`FIRE_DLC_INT_RPTR_WDTH-1] <= ~int_wptr[`FIRE_DLC_INT_RPTR_WDTH-1];
	  end
	else
	  begin
	    int_wptr[`FIRE_DLC_INT_RPTR_WDTH-2:0] <= int_wptr[`FIRE_DLC_INT_RPTR_WDTH-2:0] + 1'b1;
	  end
      end

  // ~~~~~~~ increment tran_id ~~~~~~~~
    always @(posedge clk)
    if (~rst_l)
      tran_id <= {`FIRE_DLC_DIM_DPTR_WDTH{1'b0}};
    else if (rcd_deq)
      tran_id <= tran_id + 1'b1;

  // ~~~~~~~ output d_ptr_out ~~~~~~~~
  assign d_ptr_out = tran_id;
  
  // ~~~~~~~ output cacheline addr ~~~~~~~~
  assign diu_dma_cl_wptr = dma_wptr[`FIRE_DLC_DMA_WPTR_WDTH-2:0];
  assign diu_pio_cl_wptr = pio_wptr[`FIRE_DLC_PIO_WPTR_WDTH-2:0];


  // ~~~~~~~ output tm2cl_dma_wptr & tm2cl_pio_wptr ~~~~~~~~
  assign tm2cl_dma_wptr = dma_wptr;
  assign tm2cl_pio_wptr = pio_wptr;

endmodule // dmu_tmu_dim_bufmgr




