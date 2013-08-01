// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: jdia_checkers.v
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
module jdia_checkers;

`define jdia_top `CPU.dmu
//`define jdia_clk `jdia_top.iol2clk
`define jdia_clk `jdia_top.iol2clk
//`define jdia_rst ~`jdia_top.rst_wmr_
`define jdia_rst ~`jdia_top.wmr_


////////////////////////
// known/driven checkers
   
`ifdef X_GUARD

/* 0in known_driven -var `jdia_top.j2d_di_cmd_vld
   -clock `jdia_clk -reset `jdia_rst */
/* 0in known_driven -var `jdia_top.j2d_di_cmd
   -active `jdia_top.j2d_di_cmd_vld
   -clock `jdia_clk -reset `jdia_rst */
/* 0in known_driven -var `jdia_top.j2d_di_ctag
   -active `jdia_top.j2d_di_cmd_vld
   -clock `jdia_clk -reset `jdia_rst */

/* 0in known_driven -var `jdia_top.j2d_d_data_vld
   -clock `jdia_clk -reset `jdia_rst */
/* 0in known_driven -var `jdia_top.j2d_d_data
   -active `jdia_top.j2d_d_data_vld
   -clock `jdia_clk -reset `jdia_rst */
/* 0in known_driven -var `jdia_top.j2d_d_data_par
   -active `jdia_top.j2d_d_data_vld
   -clock `jdia_clk -reset `jdia_rst */
/* 0in known_driven -var `jdia_top.j2d_d_data_err
   -active `jdia_top.j2d_d_data_vld
   -clock `jdia_clk -reset `jdia_rst */

/* 0in known_driven -var `jdia_top.j2d_d_wrack_vld
   -clock `jdia_clk -reset `jdia_rst */
/* 0in known_driven -var `jdia_top.j2d_d_wrack_tag
   -active `jdia_top.j2d_d_wrack_vld
   -clock `jdia_clk -reset `jdia_rst */

/* 0in known_driven -var `jdia_top.j2d_p_cmd_vld
   -clock `jdia_clk -reset `jdia_rst */
/* 0in known_driven -var `jdia_top.j2d_p_cmd
   -active `jdia_top.j2d_p_cmd_vld
   -clock `jdia_clk -reset `jdia_rst */
/* 0in known_driven -var `jdia_top.j2d_p_addr
   -active `jdia_top.j2d_p_cmd_vld
   -clock `jdia_clk -reset `jdia_rst */
/* 0in known_driven -var `jdia_top.j2d_p_bmsk
   -active `jdia_top.j2d_p_cmd_vld
   -clock `jdia_clk -reset `jdia_rst */
/* 0in known_driven -var `jdia_top.j2d_p_ctag
   -active `jdia_top.j2d_p_cmd_vld
   -clock `jdia_clk -reset `jdia_rst */

/* 0in known_driven -var `jdia_top.d2j_cmd_vld
   -clock `jdia_clk -reset `jdia_rst */
/* 0in known_driven -var `jdia_top.d2j_cmd
   -active `jdia_top.d2j_cmd_vld
   -clock `jdia_clk -reset `jdia_rst */
/* 0in known_driven -var `jdia_top.d2j_addr
   -active `jdia_top.d2j_cmd_vld
   -clock `jdia_clk -reset `jdia_rst */
/* 0in known_driven -var `jdia_top.d2j_ctag
   -active `jdia_top.d2j_cmd_vld
   -clock `jdia_clk -reset `jdia_rst */

/* 0in known_driven -var `jdia_top.d2j_data_vld
   -clock `jdia_clk -reset `jdia_rst */
/* 0in known_driven -var `jdia_top.d2j_data
   -active `jdia_top.d2j_data_vld
   -clock `jdia_clk -reset `jdia_rst */
/* 0in known_driven -var `jdia_top.d2j_data_par
   -active `jdia_top.d2j_data_vld
   -clock `jdia_clk -reset `jdia_rst */
/* 0in known_driven -var `jdia_top.d2j_bmsk
   -active `jdia_top.d2j_data_vld
   -clock `jdia_clk -reset `jdia_rst */

/* 0in known_driven -var `jdia_top.d2j_p_wrack_vld
   -clock `jdia_clk -reset `jdia_rst */
/* 0in known_driven -var `jdia_top.d2j_p_wrack_tag
   -active `jdia_top.d2j_p_wrack_vld
   -clock `jdia_clk -reset `jdia_rst */

/* 0in known_driven -var `jdia_top.j2d_mmu_addr_vld
   -clock `jdia_clk -reset `jdia_rst */
/* 0in known_driven -var `jdia_top.j2d_mmu_addr
   -active `jdia_top.j2d_mmu_addr_vld
   -clock `jdia_clk -reset `jdia_rst */

`endif //  `ifdef X_GUARD
   
///////////////////////
// valid value checkers

/* 0in value -var `jdia_top.j2d_p_cmd
   -val 4'h4 4'h5 4'h6 4'h7 4'hc 4'hd 4'he 4'hf
   -active `jdia_top.j2d_p_cmd_vld
   -clock `jdia_clk -reset `jdia_rst */

/* 0in value -var `jdia_top.d2j_cmd
   -val 4'h0 4'h1 4'h2 4'h3 4'h4 4'h8 4'ha 4'hb
   -active `jdia_top.d2j_cmd_vld
   -clock `jdia_clk -reset `jdia_rst */

// d2j_ctag[15] = 0 for dma rd, 1 for dma rds, 0 for int


//////////////////
// parity checkers

/* 0in value -var `jdia_top.j2d_d_data_par[3]
   -val ~^(`jdia_top.j2d_d_data[127:96])
   -active `jdia_top.j2d_d_data_vld
   -clock `jdia_clk -reset `jdia_rst */
/* 0in value -var `jdia_top.j2d_d_data_par[2]
   -val ~^(`jdia_top.j2d_d_data[95:64])
   -active `jdia_top.j2d_d_data_vld
   -clock `jdia_clk -reset `jdia_rst */
/* 0in value -var `jdia_top.j2d_d_data_par[1]
   -val ~^(`jdia_top.j2d_d_data[63:32])
   -active `jdia_top.j2d_d_data_vld
   -clock `jdia_clk -reset `jdia_rst */
/* 0in value -var `jdia_top.j2d_d_data_par[0]
   -val ~^(`jdia_top.j2d_d_data[31:0])
   -active `jdia_top.j2d_d_data_vld
   -clock `jdia_clk -reset `jdia_rst */

/* 0in value -var `jdia_top.j2d_p_data_par[3]
   -val ~^(`jdia_top.j2d_p_data[127:96])
   -active `jdia_top.j2d_p_data_vld
   -clock `jdia_clk -reset `jdia_rst */
/* 0in value -var `jdia_top.j2d_p_data_par[2]
   -val ~^(`jdia_top.j2d_p_data[95:64])
   -active `jdia_top.j2d_p_data_vld
   -clock `jdia_clk -reset `jdia_rst */
/* 0in value -var `jdia_top.j2d_p_data_par[1]
   -val ~^(`jdia_top.j2d_p_data[63:32])
   -active `jdia_top.j2d_p_data_vld
   -clock `jdia_clk -reset `jdia_rst */
/* 0in value -var `jdia_top.j2d_p_data_par[0]
   -val ~^(`jdia_top.j2d_p_data[31:0])
   -active `jdia_top.j2d_p_data_vld
   -clock `jdia_clk -reset `jdia_rst */

/* 0in value -var `jdia_top.d2j_data_par[4]
   -val ~^(`jdia_top.d2j_data[127:96])
   -active `jdia_top.d2j_data_vld
   -clock `jdia_clk -reset `jdia_rst */
/* 0in value -var `jdia_top.d2j_data_par[3]
   -val ~^(`jdia_top.d2j_data[95:64])
   -active `jdia_top.d2j_data_vld
   -clock `jdia_clk -reset `jdia_rst */
/* 0in value -var `jdia_top.d2j_data_par[2]
   -val ~^(`jdia_top.d2j_data[63:32])
   -active `jdia_top.d2j_data_vld
   -clock `jdia_clk -reset `jdia_rst */
/* 0in value -var `jdia_top.d2j_data_par[1]
   -val ~^(`jdia_top.d2j_data[31:0])
   -active `jdia_top.d2j_data_vld
   -clock `jdia_clk -reset `jdia_rst */
/* 0in value -var `jdia_top.d2j_data_par[0]
   -val ~^(`jdia_top.d2j_bmsk)
   -active `jdia_top.d2j_data_vld
   -clock `jdia_clk -reset `jdia_rst */


////////////////////
// protocol checkers

wire [63:0] dma_wr_current_fifo_entries,
	    dma_rd_current_fifo_entries,
	    interrupt_current_fifo_entries ;
   
// dma full write / dma partial write
/* 0in fifo -depth 16
   -enq ( `jdia_top.d2j_cmd_vld & ( ( `jdia_top.d2j_cmd == 4'h0 )
                                  | ( `jdia_top.d2j_cmd == 4'h1 ) ) )
   -deq `jdia_top.j2d_d_wrack_vld
   -current_fifo_entries  dma_wr_current_fifo_entries
   -name  enq_deq_dmawr
   -clock `jdia_clk 
   -reset `jdia_rst 
 */

// dma read / dma read shared
/* 0in fifo -depth 16
   -enq ( `jdia_top.d2j_cmd_vld & ( ( `jdia_top.d2j_cmd == 4'h2 )
                                  | ( `jdia_top.d2j_cmd == 4'h3 ) ) )
   -deq ( `jdia_top.j2d_di_cmd_vld & ( ( `jdia_top.j2d_di_cmd == 2'h0 )
                                     | ( `jdia_top.j2d_di_cmd == 2'h1 ) ) )
   -current_fifo_entries  dma_rd_current_fifo_entries
   -name  enq_deq_dmard
   -clock `jdia_clk 
   -reset `jdia_rst
 */

// interrupt
/* 0in fifo -depth 4
   -enq ( `jdia_top.d2j_cmd_vld & ( `jdia_top.d2j_cmd == 4'b0100 ) )
   -deq ( `jdia_top.j2d_di_cmd_vld & ( ( `jdia_top.j2d_di_cmd == 2'h2 )
                                     | ( `jdia_top.j2d_di_cmd == 2'h3 ) ) )
   -current_fifo_entries  interrupt_current_fifo_entries
   -name  enq_deq_int
   -clock `jdia_clk 
   -reset `jdia_rst
 */

// sum of dma rd/wr and interrupt entries does not exceed 16
/* 0in max 16
    -var ( dma_wr_current_fifo_entries + 
           dma_rd_current_fifo_entries +
           interrupt_current_fifo_entries )
   -clock `jdia_clk 
   -reset `jdia_rst
 */

wire [63:0] pio_wr_current_fifo_entries,
	    pio_rd_current_fifo_entries ;

// pio read
/* 0in fifo -depth 16
   -enq ( `jdia_top.j2d_p_cmd_vld & ( ( `jdia_top.j2d_p_cmd == 4'hc )
                                    | ( `jdia_top.j2d_p_cmd == 4'hd )
                                    | ( `jdia_top.j2d_p_cmd == 4'he )
                                    | ( `jdia_top.j2d_p_cmd == 4'hf ) ) )
   -deq ( `jdia_top.d2j_cmd_vld & ( ( `jdia_top.d2j_cmd == 4'h8 )
                                  | ( `jdia_top.d2j_cmd == 4'ha )
                                  | ( `jdia_top.d2j_cmd == 4'hb ) ) )
   -current_fifo_entries  pio_rd_current_fifo_entries
   -clock `jdia_clk 
   -reset `jdia_rst
 */

// pio write
/* 0in fifo -depth 16
   -enq ( `jdia_top.j2d_p_cmd_vld & ( ( `jdia_top.j2d_p_cmd == 4'h4 )
                                    | ( `jdia_top.j2d_p_cmd == 4'h5 )
                                    | ( `jdia_top.j2d_p_cmd == 4'h6 )
                                    | ( `jdia_top.j2d_p_cmd == 4'h7 ) ) )
   -deq `jdia_top.d2j_p_wrack_vld
   -current_fifo_entries  pio_wr_current_fifo_entries
   -clock `jdia_clk 
   -reset `jdia_rst
 */


// sum of pio rd/wr  entries does not exceed 16
/* 0in max 16
    -var ( pio_rd_current_fifo_entries + 
           pio_wr_current_fifo_entries )
   -clock `jdia_clk 
   -reset `jdia_rst
 */

////////////////
// data checkers

// dma full write / dma partial write
/* 0in assert_follower
   -leader ( `jdia_top.d2j_cmd_vld & ( ( `jdia_top.d2j_cmd == 4'h0 )
                                     | ( `jdia_top.d2j_cmd == 4'h1 ) ) )
   -follower `jdia_top.d2j_data_vld
   -clock `jdia_clk -reset `jdia_rst */
/* 0in change_window
   -start ( `jdia_top.d2j_cmd_vld & ( ( `jdia_top.d2j_cmd == 4'h0 )
                                    | ( `jdia_top.d2j_cmd == 4'h1 ) ) )
   -stop_count 3
   -not_in `jdia_top.d2j_data_vld
   -clock `jdia_clk -reset `jdia_rst */


// dma read (no error)
/* 0in assert_follower
   -leader ( `jdia_top.j2d_di_cmd_vld & ( `jdia_top.j2d_di_cmd == 2'h0 ) )
   -follower `jdia_top.j2d_d_data_vld
   -clock `jdia_clk -reset `jdia_rst */
/* 0in change_window
   -start ( `jdia_top.j2d_di_cmd_vld & ( `jdia_top.j2d_di_cmd == 2'h0 ) )
   -stop_count 3
   -not_in `jdia_top.j2d_d_data_vld
   -clock `jdia_clk -reset `jdia_rst */

// pio write
/* 0in assert_follower
   -leader ( `jdia_top.j2d_p_cmd_vld & ( ( `jdia_top.j2d_p_cmd == 4'h4 )
                                       | ( `jdia_top.j2d_p_cmd == 4'h5 )
                                       | ( `jdia_top.j2d_p_cmd == 4'h6 )
                                       | ( `jdia_top.j2d_p_cmd == 4'h7 ) ) )
   -follower `jdia_top.j2d_p_data_vld
   -clock `jdia_clk -reset `jdia_rst */

// pio read
/* 0in assert_follower
   -leader ( `jdia_top.d2j_cmd_vld & ( `jdia_top.d2j_cmd == 4'h8 ) )
   -follower `jdia_top.d2j_data_vld
   -clock `jdia_clk -reset `jdia_rst */


//////////////////////////
// transaction id checkers

// dma full write / dma partial write
/* 0in bus_id
   -req ( `jdia_top.d2j_cmd_vld & ( ( `jdia_top.d2j_cmd == 4'h0 )
                                  | ( `jdia_top.d2j_cmd == 4'h1 ) ) )
   -req_id `jdia_top.d2j_ctag[14:11]
   -ret `jdia_top.j2d_d_wrack_vld
   -ret_id `jdia_top.j2d_d_wrack_tag
   -clock `jdia_clk -reset `jdia_rst */

// dma read / dma read shared
/* 0in bus_id
   -req ( `jdia_top.d2j_cmd_vld & ( ( `jdia_top.d2j_cmd == 4'h2 )
                                  | ( `jdia_top.d2j_cmd == 4'h3 ) ) )
   -req_id `jdia_top.d2j_ctag[14:11]
   -ret ( `jdia_top.j2d_di_cmd_vld & ( ( `jdia_top.j2d_di_cmd == 2'h0 )
                                     | ( `jdia_top.j2d_di_cmd == 2'h1 ) ) )
   -ret_id `jdia_top.j2d_di_ctag[14:11]
   -clock `jdia_clk -reset `jdia_rst */

// pio read
/* 0in bus_id
   -req ( `jdia_top.j2d_p_cmd_vld & ( ( `jdia_top.j2d_p_cmd == 4'hc )
                                    | ( `jdia_top.j2d_p_cmd == 4'hd )
                                    | ( `jdia_top.j2d_p_cmd == 4'he )
                                    | ( `jdia_top.j2d_p_cmd == 4'hf ) ) )
   -req_id `jdia_top.j2d_p_ctag[10:7]
   -ret ( `jdia_top.d2j_cmd_vld & ( ( `jdia_top.d2j_cmd == 4'h8 )
                                  | ( `jdia_top.d2j_cmd == 4'ha )
                                  | ( `jdia_top.d2j_cmd == 4'hb ) ) )
   -ret_id `jdia_top.d2j_ctag[11:8]
   -clock  `jdia_clk -reset `jdia_rst */

// pio write
/* 0in bus_id
   -req ( `jdia_top.j2d_p_cmd_vld & ( ( `jdia_top.j2d_p_cmd == 4'h4 )
                                    | ( `jdia_top.j2d_p_cmd == 4'h5 )
                                    | ( `jdia_top.j2d_p_cmd == 4'h6 )
                                    | ( `jdia_top.j2d_p_cmd == 4'h7 ) ) )
   -req_id `jdia_top.j2d_p_ctag[10:7]
   -ret    `jdia_top.d2j_p_wrack_vld
   -ret_id `jdia_top.d2j_p_wrack_tag
   -clock  `jdia_clk -reset `jdia_rst */

// interrupt
///* x0in bus_id
//   -req ( `jdia_top.d2j_cmd_vld & ( `jdia_top.d2j_cmd == 4'b0100 ) )
//   -req_id `jdia_top.d2j_ctag[14:11]
//   -ret ( `jdia_top.j2d_di_cmd_vld & ( ( `jdia_top.j2d_di_cmd == 2'h2 )
                             //        | ( `jdia_top.j2d_di_cmd == 2'h3 ) ) )
//   -ret_id `jdia_top.j2d_di_ctag[14:11]
//   -clock `jdia_clk -reset `jdia_rst */


endmodule // jdia_checkers
