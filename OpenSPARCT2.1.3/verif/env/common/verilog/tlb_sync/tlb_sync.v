// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: tlb_sync.v
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
module tlb_sync;

`include "nas.vh"
`include "tlb_sync.vh"

wire               [(`TLB_FIFO_WIDTH-1):0] itlb_pipe_d0_c0;
wire               [(`TLB_FIFO_WIDTH-1):0] itlb_pipe_d1_c0;
wire               [(`TLB_FIFO_WIDTH-1):0] itlb_pipe_d2_c0;
wire               [(`TLB_FIFO_WIDTH-1):0] itlb_pipe_d3_c0;
wire               [(`TLB_FIFO_WIDTH-1):0] itlb_pipe_d4_c0;
wire               [(`TLB_FIFO_WIDTH-1):0] itlb_pipe_d5_c0;
wire               [(`TLB_FIFO_WIDTH-1):0] itlb_pipe_d6_c0;
wire               [(`TLB_FIFO_WIDTH-1):0] itlb_pipe_d7_c0;
wire               [(`TLB_FIFO_WIDTH-1):0] itlb_pipe_d0_c1;
wire               [(`TLB_FIFO_WIDTH-1):0] itlb_pipe_d1_c1;
wire               [(`TLB_FIFO_WIDTH-1):0] itlb_pipe_d2_c1;
wire               [(`TLB_FIFO_WIDTH-1):0] itlb_pipe_d3_c1;
wire               [(`TLB_FIFO_WIDTH-1):0] itlb_pipe_d4_c1;
wire               [(`TLB_FIFO_WIDTH-1):0] itlb_pipe_d5_c1;
wire               [(`TLB_FIFO_WIDTH-1):0] itlb_pipe_d6_c1;
wire               [(`TLB_FIFO_WIDTH-1):0] itlb_pipe_d7_c1;
wire               [(`TLB_FIFO_WIDTH-1):0] itlb_pipe_d0_c2;
wire               [(`TLB_FIFO_WIDTH-1):0] itlb_pipe_d1_c2;
wire               [(`TLB_FIFO_WIDTH-1):0] itlb_pipe_d2_c2;
wire               [(`TLB_FIFO_WIDTH-1):0] itlb_pipe_d3_c2;
wire               [(`TLB_FIFO_WIDTH-1):0] itlb_pipe_d4_c2;
wire               [(`TLB_FIFO_WIDTH-1):0] itlb_pipe_d5_c2;
wire               [(`TLB_FIFO_WIDTH-1):0] itlb_pipe_d6_c2;
wire               [(`TLB_FIFO_WIDTH-1):0] itlb_pipe_d7_c2;
wire               [(`TLB_FIFO_WIDTH-1):0] itlb_pipe_d0_c3;
wire               [(`TLB_FIFO_WIDTH-1):0] itlb_pipe_d1_c3;
wire               [(`TLB_FIFO_WIDTH-1):0] itlb_pipe_d2_c3;
wire               [(`TLB_FIFO_WIDTH-1):0] itlb_pipe_d3_c3;
wire               [(`TLB_FIFO_WIDTH-1):0] itlb_pipe_d4_c3;
wire               [(`TLB_FIFO_WIDTH-1):0] itlb_pipe_d5_c3;
wire               [(`TLB_FIFO_WIDTH-1):0] itlb_pipe_d6_c3;
wire               [(`TLB_FIFO_WIDTH-1):0] itlb_pipe_d7_c3;
wire               [(`TLB_FIFO_WIDTH-1):0] itlb_pipe_d0_c4;
wire               [(`TLB_FIFO_WIDTH-1):0] itlb_pipe_d1_c4;
wire               [(`TLB_FIFO_WIDTH-1):0] itlb_pipe_d2_c4;
wire               [(`TLB_FIFO_WIDTH-1):0] itlb_pipe_d3_c4;
wire               [(`TLB_FIFO_WIDTH-1):0] itlb_pipe_d4_c4;
wire               [(`TLB_FIFO_WIDTH-1):0] itlb_pipe_d5_c4;
wire               [(`TLB_FIFO_WIDTH-1):0] itlb_pipe_d6_c4;
wire               [(`TLB_FIFO_WIDTH-1):0] itlb_pipe_d7_c4;
wire               [(`TLB_FIFO_WIDTH-1):0] itlb_pipe_d0_c5;
wire               [(`TLB_FIFO_WIDTH-1):0] itlb_pipe_d1_c5;
wire               [(`TLB_FIFO_WIDTH-1):0] itlb_pipe_d2_c5;
wire               [(`TLB_FIFO_WIDTH-1):0] itlb_pipe_d3_c5;
wire               [(`TLB_FIFO_WIDTH-1):0] itlb_pipe_d4_c5;
wire               [(`TLB_FIFO_WIDTH-1):0] itlb_pipe_d5_c5;
wire               [(`TLB_FIFO_WIDTH-1):0] itlb_pipe_d6_c5;
wire               [(`TLB_FIFO_WIDTH-1):0] itlb_pipe_d7_c5;
wire               [(`TLB_FIFO_WIDTH-1):0] itlb_pipe_d0_c6;
wire               [(`TLB_FIFO_WIDTH-1):0] itlb_pipe_d1_c6;
wire               [(`TLB_FIFO_WIDTH-1):0] itlb_pipe_d2_c6;
wire               [(`TLB_FIFO_WIDTH-1):0] itlb_pipe_d3_c6;
wire               [(`TLB_FIFO_WIDTH-1):0] itlb_pipe_d4_c6;
wire               [(`TLB_FIFO_WIDTH-1):0] itlb_pipe_d5_c6;
wire               [(`TLB_FIFO_WIDTH-1):0] itlb_pipe_d6_c6;
wire               [(`TLB_FIFO_WIDTH-1):0] itlb_pipe_d7_c6;
wire               [(`TLB_FIFO_WIDTH-1):0] itlb_pipe_d0_c7;
wire               [(`TLB_FIFO_WIDTH-1):0] itlb_pipe_d1_c7;
wire               [(`TLB_FIFO_WIDTH-1):0] itlb_pipe_d2_c7;
wire               [(`TLB_FIFO_WIDTH-1):0] itlb_pipe_d3_c7;
wire               [(`TLB_FIFO_WIDTH-1):0] itlb_pipe_d4_c7;
wire               [(`TLB_FIFO_WIDTH-1):0] itlb_pipe_d5_c7;
wire               [(`TLB_FIFO_WIDTH-1):0] itlb_pipe_d6_c7;
wire               [(`TLB_FIFO_WIDTH-1):0] itlb_pipe_d7_c7;


`ifdef CORE_0

wire [7:0] nas_pipe_enabled_core0 = {`NASTOP.c0.t7.nas_pipe_enable,
                               `NASTOP.c0.t6.nas_pipe_enable,
                               `NASTOP.c0.t5.nas_pipe_enable,
                               `NASTOP.c0.t4.nas_pipe_enable, 
                               `NASTOP.c0.t3.nas_pipe_enable,
                               `NASTOP.c0.t2.nas_pipe_enable,
                               `NASTOP.c0.t1.nas_pipe_enable,
                               `NASTOP.c0.t0.nas_pipe_enable};


//----------------------------------------------------------
// I/DTLB miscellaneous sync and followme (1 per core)
//----------------------------------------------------------

tlb_misc_c0 tlb_misc_c0 (); 

//----------------------------------------------------------
// ITLB write detection - HWTW and TLBWRITE (1 per core)
//----------------------------------------------------------

itlb_wr_c0 itlb_wr_c0 ();

//----------------------------------------------------------
// DTLB write detection - HWTW and TLBWRITE (1 per core)
//----------------------------------------------------------

dtlb_wr_c0 dtlb_wr_c0 ();

//----------------------------------------------------------
// ITLB read detection - pipeline (1 per thread group)
//----------------------------------------------------------
itlb_rd_c0 itlb_rd_c0tg0 (
  .mytg           (1'h0),
  .itlb_pipe_d0   (itlb_pipe_d0_c0),
  .itlb_pipe_d1   (itlb_pipe_d1_c0),
  .itlb_pipe_d2   (itlb_pipe_d2_c0),
  .itlb_pipe_d3   (itlb_pipe_d3_c0)
);
itlb_rd_c0 itlb_rd_c0tg1 (
  .mytg           (1'h1),
  .itlb_pipe_d0   (itlb_pipe_d4_c0),
  .itlb_pipe_d1   (itlb_pipe_d5_c0),
  .itlb_pipe_d2   (itlb_pipe_d6_c0),
  .itlb_pipe_d3   (itlb_pipe_d7_c0)
);

//----------------------------------------------------------
// DTLB read detection (1 per thread group)
//----------------------------------------------------------

dtlb_rd_c0 dtlb_rd_c0tg0 (
  .mytg           (1'h0)
);

dtlb_rd_c0 dtlb_rd_c0tg1 (
  .mytg           (1'h1)
);

//----------------------------------------------------------
//----------------------------------------------------------

//----------------------------------------------------------
// Shadow IFU Instruction Buffer (1 per thread)
//----------------------------------------------------------

tlb_fifo_c0 tlb_fifo_c0t0 (

  .mytid          (3'h0),
  .itlb_pipe_d    (itlb_pipe_d0_c0)
);

//----------------------------------------------------------

//----------------------------------------------------------
// Shadow IFU Instruction Buffer (1 per thread)
//----------------------------------------------------------

tlb_fifo_c0 tlb_fifo_c0t1 (

  .mytid          (3'h1),
  .itlb_pipe_d    (itlb_pipe_d1_c0)
);

//----------------------------------------------------------

//----------------------------------------------------------
// Shadow IFU Instruction Buffer (1 per thread)
//----------------------------------------------------------

tlb_fifo_c0 tlb_fifo_c0t2 (

  .mytid          (3'h2),
  .itlb_pipe_d    (itlb_pipe_d2_c0)
);

//----------------------------------------------------------

//----------------------------------------------------------
// Shadow IFU Instruction Buffer (1 per thread)
//----------------------------------------------------------

tlb_fifo_c0 tlb_fifo_c0t3 (

  .mytid          (3'h3),
  .itlb_pipe_d    (itlb_pipe_d3_c0)
);

//----------------------------------------------------------

//----------------------------------------------------------
// Shadow IFU Instruction Buffer (1 per thread)
//----------------------------------------------------------

tlb_fifo_c0 tlb_fifo_c0t4 (

  .mytid          (3'h4),
  .itlb_pipe_d    (itlb_pipe_d4_c0)
);

//----------------------------------------------------------

//----------------------------------------------------------
// Shadow IFU Instruction Buffer (1 per thread)
//----------------------------------------------------------

tlb_fifo_c0 tlb_fifo_c0t5 (

  .mytid          (3'h5),
  .itlb_pipe_d    (itlb_pipe_d5_c0)
);

//----------------------------------------------------------

//----------------------------------------------------------
// Shadow IFU Instruction Buffer (1 per thread)
//----------------------------------------------------------

tlb_fifo_c0 tlb_fifo_c0t6 (

  .mytid          (3'h6),
  .itlb_pipe_d    (itlb_pipe_d6_c0)
);

//----------------------------------------------------------

//----------------------------------------------------------
// Shadow IFU Instruction Buffer (1 per thread)
//----------------------------------------------------------

tlb_fifo_c0 tlb_fifo_c0t7 (

  .mytid          (3'h7),
  .itlb_pipe_d    (itlb_pipe_d7_c0)
);

`endif

`ifdef CORE_1

wire [7:0] nas_pipe_enabled_core1 = {`NASTOP.c1.t7.nas_pipe_enable,
                               `NASTOP.c1.t6.nas_pipe_enable,
                               `NASTOP.c1.t5.nas_pipe_enable,
                               `NASTOP.c1.t4.nas_pipe_enable, 
                               `NASTOP.c1.t3.nas_pipe_enable,
                               `NASTOP.c1.t2.nas_pipe_enable,
                               `NASTOP.c1.t1.nas_pipe_enable,
                               `NASTOP.c1.t0.nas_pipe_enable};


//----------------------------------------------------------
// I/DTLB miscellaneous sync and followme (1 per core)
//----------------------------------------------------------

tlb_misc_c1 tlb_misc_c1 (); 

//----------------------------------------------------------
// ITLB write detection - HWTW and TLBWRITE (1 per core)
//----------------------------------------------------------

itlb_wr_c1 itlb_wr_c1 ();

//----------------------------------------------------------
// DTLB write detection - HWTW and TLBWRITE (1 per core)
//----------------------------------------------------------

dtlb_wr_c1 dtlb_wr_c1 ();

//----------------------------------------------------------
// ITLB read detection - pipeline (1 per thread group)
//----------------------------------------------------------
itlb_rd_c1 itlb_rd_c1tg0 (
  .mytg           (1'h0),
  .itlb_pipe_d0   (itlb_pipe_d0_c1),
  .itlb_pipe_d1   (itlb_pipe_d1_c1),
  .itlb_pipe_d2   (itlb_pipe_d2_c1),
  .itlb_pipe_d3   (itlb_pipe_d3_c1)
);
itlb_rd_c1 itlb_rd_c1tg1 (
  .mytg           (1'h1),
  .itlb_pipe_d0   (itlb_pipe_d4_c1),
  .itlb_pipe_d1   (itlb_pipe_d5_c1),
  .itlb_pipe_d2   (itlb_pipe_d6_c1),
  .itlb_pipe_d3   (itlb_pipe_d7_c1)
);

//----------------------------------------------------------
// DTLB read detection (1 per thread group)
//----------------------------------------------------------

dtlb_rd_c1 dtlb_rd_c1tg0 (
  .mytg           (1'h0)
);

dtlb_rd_c1 dtlb_rd_c1tg1 (
  .mytg           (1'h1)
);

//----------------------------------------------------------
//----------------------------------------------------------

//----------------------------------------------------------
// Shadow IFU Instruction Buffer (1 per thread)
//----------------------------------------------------------

tlb_fifo_c1 tlb_fifo_c1t0 (

  .mytid          (3'h0),
  .itlb_pipe_d    (itlb_pipe_d0_c1)
);

//----------------------------------------------------------

//----------------------------------------------------------
// Shadow IFU Instruction Buffer (1 per thread)
//----------------------------------------------------------

tlb_fifo_c1 tlb_fifo_c1t1 (

  .mytid          (3'h1),
  .itlb_pipe_d    (itlb_pipe_d1_c1)
);

//----------------------------------------------------------

//----------------------------------------------------------
// Shadow IFU Instruction Buffer (1 per thread)
//----------------------------------------------------------

tlb_fifo_c1 tlb_fifo_c1t2 (

  .mytid          (3'h2),
  .itlb_pipe_d    (itlb_pipe_d2_c1)
);

//----------------------------------------------------------

//----------------------------------------------------------
// Shadow IFU Instruction Buffer (1 per thread)
//----------------------------------------------------------

tlb_fifo_c1 tlb_fifo_c1t3 (

  .mytid          (3'h3),
  .itlb_pipe_d    (itlb_pipe_d3_c1)
);

//----------------------------------------------------------

//----------------------------------------------------------
// Shadow IFU Instruction Buffer (1 per thread)
//----------------------------------------------------------

tlb_fifo_c1 tlb_fifo_c1t4 (

  .mytid          (3'h4),
  .itlb_pipe_d    (itlb_pipe_d4_c1)
);

//----------------------------------------------------------

//----------------------------------------------------------
// Shadow IFU Instruction Buffer (1 per thread)
//----------------------------------------------------------

tlb_fifo_c1 tlb_fifo_c1t5 (

  .mytid          (3'h5),
  .itlb_pipe_d    (itlb_pipe_d5_c1)
);

//----------------------------------------------------------

//----------------------------------------------------------
// Shadow IFU Instruction Buffer (1 per thread)
//----------------------------------------------------------

tlb_fifo_c1 tlb_fifo_c1t6 (

  .mytid          (3'h6),
  .itlb_pipe_d    (itlb_pipe_d6_c1)
);

//----------------------------------------------------------

//----------------------------------------------------------
// Shadow IFU Instruction Buffer (1 per thread)
//----------------------------------------------------------

tlb_fifo_c1 tlb_fifo_c1t7 (

  .mytid          (3'h7),
  .itlb_pipe_d    (itlb_pipe_d7_c1)
);

`endif

`ifdef CORE_2

wire [7:0] nas_pipe_enabled_core2 = {`NASTOP.c2.t7.nas_pipe_enable,
                               `NASTOP.c2.t6.nas_pipe_enable,
                               `NASTOP.c2.t5.nas_pipe_enable,
                               `NASTOP.c2.t4.nas_pipe_enable, 
                               `NASTOP.c2.t3.nas_pipe_enable,
                               `NASTOP.c2.t2.nas_pipe_enable,
                               `NASTOP.c2.t1.nas_pipe_enable,
                               `NASTOP.c2.t0.nas_pipe_enable};


//----------------------------------------------------------
// I/DTLB miscellaneous sync and followme (1 per core)
//----------------------------------------------------------

tlb_misc_c2 tlb_misc_c2 (); 

//----------------------------------------------------------
// ITLB write detection - HWTW and TLBWRITE (1 per core)
//----------------------------------------------------------

itlb_wr_c2 itlb_wr_c2 ();

//----------------------------------------------------------
// DTLB write detection - HWTW and TLBWRITE (1 per core)
//----------------------------------------------------------

dtlb_wr_c2 dtlb_wr_c2 ();

//----------------------------------------------------------
// ITLB read detection - pipeline (1 per thread group)
//----------------------------------------------------------
itlb_rd_c2 itlb_rd_c2tg0 (
  .mytg           (1'h0),
  .itlb_pipe_d0   (itlb_pipe_d0_c2),
  .itlb_pipe_d1   (itlb_pipe_d1_c2),
  .itlb_pipe_d2   (itlb_pipe_d2_c2),
  .itlb_pipe_d3   (itlb_pipe_d3_c2)
);
itlb_rd_c2 itlb_rd_c2tg1 (
  .mytg           (1'h1),
  .itlb_pipe_d0   (itlb_pipe_d4_c2),
  .itlb_pipe_d1   (itlb_pipe_d5_c2),
  .itlb_pipe_d2   (itlb_pipe_d6_c2),
  .itlb_pipe_d3   (itlb_pipe_d7_c2)
);

//----------------------------------------------------------
// DTLB read detection (1 per thread group)
//----------------------------------------------------------

dtlb_rd_c2 dtlb_rd_c2tg0 (
  .mytg           (1'h0)
);

dtlb_rd_c2 dtlb_rd_c2tg1 (
  .mytg           (1'h1)
);

//----------------------------------------------------------
//----------------------------------------------------------

//----------------------------------------------------------
// Shadow IFU Instruction Buffer (1 per thread)
//----------------------------------------------------------

tlb_fifo_c2 tlb_fifo_c2t0 (

  .mytid          (3'h0),
  .itlb_pipe_d    (itlb_pipe_d0_c2)
);

//----------------------------------------------------------

//----------------------------------------------------------
// Shadow IFU Instruction Buffer (1 per thread)
//----------------------------------------------------------

tlb_fifo_c2 tlb_fifo_c2t1 (

  .mytid          (3'h1),
  .itlb_pipe_d    (itlb_pipe_d1_c2)
);

//----------------------------------------------------------

//----------------------------------------------------------
// Shadow IFU Instruction Buffer (1 per thread)
//----------------------------------------------------------

tlb_fifo_c2 tlb_fifo_c2t2 (

  .mytid          (3'h2),
  .itlb_pipe_d    (itlb_pipe_d2_c2)
);

//----------------------------------------------------------

//----------------------------------------------------------
// Shadow IFU Instruction Buffer (1 per thread)
//----------------------------------------------------------

tlb_fifo_c2 tlb_fifo_c2t3 (

  .mytid          (3'h3),
  .itlb_pipe_d    (itlb_pipe_d3_c2)
);

//----------------------------------------------------------

//----------------------------------------------------------
// Shadow IFU Instruction Buffer (1 per thread)
//----------------------------------------------------------

tlb_fifo_c2 tlb_fifo_c2t4 (

  .mytid          (3'h4),
  .itlb_pipe_d    (itlb_pipe_d4_c2)
);

//----------------------------------------------------------

//----------------------------------------------------------
// Shadow IFU Instruction Buffer (1 per thread)
//----------------------------------------------------------

tlb_fifo_c2 tlb_fifo_c2t5 (

  .mytid          (3'h5),
  .itlb_pipe_d    (itlb_pipe_d5_c2)
);

//----------------------------------------------------------

//----------------------------------------------------------
// Shadow IFU Instruction Buffer (1 per thread)
//----------------------------------------------------------

tlb_fifo_c2 tlb_fifo_c2t6 (

  .mytid          (3'h6),
  .itlb_pipe_d    (itlb_pipe_d6_c2)
);

//----------------------------------------------------------

//----------------------------------------------------------
// Shadow IFU Instruction Buffer (1 per thread)
//----------------------------------------------------------

tlb_fifo_c2 tlb_fifo_c2t7 (

  .mytid          (3'h7),
  .itlb_pipe_d    (itlb_pipe_d7_c2)
);

`endif

`ifdef CORE_3

wire [7:0] nas_pipe_enabled_core3 = {`NASTOP.c3.t7.nas_pipe_enable,
                               `NASTOP.c3.t6.nas_pipe_enable,
                               `NASTOP.c3.t5.nas_pipe_enable,
                               `NASTOP.c3.t4.nas_pipe_enable, 
                               `NASTOP.c3.t3.nas_pipe_enable,
                               `NASTOP.c3.t2.nas_pipe_enable,
                               `NASTOP.c3.t1.nas_pipe_enable,
                               `NASTOP.c3.t0.nas_pipe_enable};


//----------------------------------------------------------
// I/DTLB miscellaneous sync and followme (1 per core)
//----------------------------------------------------------

tlb_misc_c3 tlb_misc_c3 (); 

//----------------------------------------------------------
// ITLB write detection - HWTW and TLBWRITE (1 per core)
//----------------------------------------------------------

itlb_wr_c3 itlb_wr_c3 ();

//----------------------------------------------------------
// DTLB write detection - HWTW and TLBWRITE (1 per core)
//----------------------------------------------------------

dtlb_wr_c3 dtlb_wr_c3 ();

//----------------------------------------------------------
// ITLB read detection - pipeline (1 per thread group)
//----------------------------------------------------------
itlb_rd_c3 itlb_rd_c3tg0 (
  .mytg           (1'h0),
  .itlb_pipe_d0   (itlb_pipe_d0_c3),
  .itlb_pipe_d1   (itlb_pipe_d1_c3),
  .itlb_pipe_d2   (itlb_pipe_d2_c3),
  .itlb_pipe_d3   (itlb_pipe_d3_c3)
);
itlb_rd_c3 itlb_rd_c3tg1 (
  .mytg           (1'h1),
  .itlb_pipe_d0   (itlb_pipe_d4_c3),
  .itlb_pipe_d1   (itlb_pipe_d5_c3),
  .itlb_pipe_d2   (itlb_pipe_d6_c3),
  .itlb_pipe_d3   (itlb_pipe_d7_c3)
);

//----------------------------------------------------------
// DTLB read detection (1 per thread group)
//----------------------------------------------------------

dtlb_rd_c3 dtlb_rd_c3tg0 (
  .mytg           (1'h0)
);

dtlb_rd_c3 dtlb_rd_c3tg1 (
  .mytg           (1'h1)
);

//----------------------------------------------------------
//----------------------------------------------------------

//----------------------------------------------------------
// Shadow IFU Instruction Buffer (1 per thread)
//----------------------------------------------------------

tlb_fifo_c3 tlb_fifo_c3t0 (

  .mytid          (3'h0),
  .itlb_pipe_d    (itlb_pipe_d0_c3)
);

//----------------------------------------------------------

//----------------------------------------------------------
// Shadow IFU Instruction Buffer (1 per thread)
//----------------------------------------------------------

tlb_fifo_c3 tlb_fifo_c3t1 (

  .mytid          (3'h1),
  .itlb_pipe_d    (itlb_pipe_d1_c3)
);

//----------------------------------------------------------

//----------------------------------------------------------
// Shadow IFU Instruction Buffer (1 per thread)
//----------------------------------------------------------

tlb_fifo_c3 tlb_fifo_c3t2 (

  .mytid          (3'h2),
  .itlb_pipe_d    (itlb_pipe_d2_c3)
);

//----------------------------------------------------------

//----------------------------------------------------------
// Shadow IFU Instruction Buffer (1 per thread)
//----------------------------------------------------------

tlb_fifo_c3 tlb_fifo_c3t3 (

  .mytid          (3'h3),
  .itlb_pipe_d    (itlb_pipe_d3_c3)
);

//----------------------------------------------------------

//----------------------------------------------------------
// Shadow IFU Instruction Buffer (1 per thread)
//----------------------------------------------------------

tlb_fifo_c3 tlb_fifo_c3t4 (

  .mytid          (3'h4),
  .itlb_pipe_d    (itlb_pipe_d4_c3)
);

//----------------------------------------------------------

//----------------------------------------------------------
// Shadow IFU Instruction Buffer (1 per thread)
//----------------------------------------------------------

tlb_fifo_c3 tlb_fifo_c3t5 (

  .mytid          (3'h5),
  .itlb_pipe_d    (itlb_pipe_d5_c3)
);

//----------------------------------------------------------

//----------------------------------------------------------
// Shadow IFU Instruction Buffer (1 per thread)
//----------------------------------------------------------

tlb_fifo_c3 tlb_fifo_c3t6 (

  .mytid          (3'h6),
  .itlb_pipe_d    (itlb_pipe_d6_c3)
);

//----------------------------------------------------------

//----------------------------------------------------------
// Shadow IFU Instruction Buffer (1 per thread)
//----------------------------------------------------------

tlb_fifo_c3 tlb_fifo_c3t7 (

  .mytid          (3'h7),
  .itlb_pipe_d    (itlb_pipe_d7_c3)
);

`endif

`ifdef CORE_4

wire [7:0] nas_pipe_enabled_core4 = {`NASTOP.c4.t7.nas_pipe_enable,
                               `NASTOP.c4.t6.nas_pipe_enable,
                               `NASTOP.c4.t5.nas_pipe_enable,
                               `NASTOP.c4.t4.nas_pipe_enable, 
                               `NASTOP.c4.t3.nas_pipe_enable,
                               `NASTOP.c4.t2.nas_pipe_enable,
                               `NASTOP.c4.t1.nas_pipe_enable,
                               `NASTOP.c4.t0.nas_pipe_enable};


//----------------------------------------------------------
// I/DTLB miscellaneous sync and followme (1 per core)
//----------------------------------------------------------

tlb_misc_c4 tlb_misc_c4 (); 

//----------------------------------------------------------
// ITLB write detection - HWTW and TLBWRITE (1 per core)
//----------------------------------------------------------

itlb_wr_c4 itlb_wr_c4 ();

//----------------------------------------------------------
// DTLB write detection - HWTW and TLBWRITE (1 per core)
//----------------------------------------------------------

dtlb_wr_c4 dtlb_wr_c4 ();

//----------------------------------------------------------
// ITLB read detection - pipeline (1 per thread group)
//----------------------------------------------------------
itlb_rd_c4 itlb_rd_c4tg0 (
  .mytg           (1'h0),
  .itlb_pipe_d0   (itlb_pipe_d0_c4),
  .itlb_pipe_d1   (itlb_pipe_d1_c4),
  .itlb_pipe_d2   (itlb_pipe_d2_c4),
  .itlb_pipe_d3   (itlb_pipe_d3_c4)
);
itlb_rd_c4 itlb_rd_c4tg1 (
  .mytg           (1'h1),
  .itlb_pipe_d0   (itlb_pipe_d4_c4),
  .itlb_pipe_d1   (itlb_pipe_d5_c4),
  .itlb_pipe_d2   (itlb_pipe_d6_c4),
  .itlb_pipe_d3   (itlb_pipe_d7_c4)
);

//----------------------------------------------------------
// DTLB read detection (1 per thread group)
//----------------------------------------------------------

dtlb_rd_c4 dtlb_rd_c4tg0 (
  .mytg           (1'h0)
);

dtlb_rd_c4 dtlb_rd_c4tg1 (
  .mytg           (1'h1)
);

//----------------------------------------------------------
//----------------------------------------------------------

//----------------------------------------------------------
// Shadow IFU Instruction Buffer (1 per thread)
//----------------------------------------------------------

tlb_fifo_c4 tlb_fifo_c4t0 (

  .mytid          (3'h0),
  .itlb_pipe_d    (itlb_pipe_d0_c4)
);

//----------------------------------------------------------

//----------------------------------------------------------
// Shadow IFU Instruction Buffer (1 per thread)
//----------------------------------------------------------

tlb_fifo_c4 tlb_fifo_c4t1 (

  .mytid          (3'h1),
  .itlb_pipe_d    (itlb_pipe_d1_c4)
);

//----------------------------------------------------------

//----------------------------------------------------------
// Shadow IFU Instruction Buffer (1 per thread)
//----------------------------------------------------------

tlb_fifo_c4 tlb_fifo_c4t2 (

  .mytid          (3'h2),
  .itlb_pipe_d    (itlb_pipe_d2_c4)
);

//----------------------------------------------------------

//----------------------------------------------------------
// Shadow IFU Instruction Buffer (1 per thread)
//----------------------------------------------------------

tlb_fifo_c4 tlb_fifo_c4t3 (

  .mytid          (3'h3),
  .itlb_pipe_d    (itlb_pipe_d3_c4)
);

//----------------------------------------------------------

//----------------------------------------------------------
// Shadow IFU Instruction Buffer (1 per thread)
//----------------------------------------------------------

tlb_fifo_c4 tlb_fifo_c4t4 (

  .mytid          (3'h4),
  .itlb_pipe_d    (itlb_pipe_d4_c4)
);

//----------------------------------------------------------

//----------------------------------------------------------
// Shadow IFU Instruction Buffer (1 per thread)
//----------------------------------------------------------

tlb_fifo_c4 tlb_fifo_c4t5 (

  .mytid          (3'h5),
  .itlb_pipe_d    (itlb_pipe_d5_c4)
);

//----------------------------------------------------------

//----------------------------------------------------------
// Shadow IFU Instruction Buffer (1 per thread)
//----------------------------------------------------------

tlb_fifo_c4 tlb_fifo_c4t6 (

  .mytid          (3'h6),
  .itlb_pipe_d    (itlb_pipe_d6_c4)
);

//----------------------------------------------------------

//----------------------------------------------------------
// Shadow IFU Instruction Buffer (1 per thread)
//----------------------------------------------------------

tlb_fifo_c4 tlb_fifo_c4t7 (

  .mytid          (3'h7),
  .itlb_pipe_d    (itlb_pipe_d7_c4)
);

`endif

`ifdef CORE_5

wire [7:0] nas_pipe_enabled_core5 = {`NASTOP.c5.t7.nas_pipe_enable,
                               `NASTOP.c5.t6.nas_pipe_enable,
                               `NASTOP.c5.t5.nas_pipe_enable,
                               `NASTOP.c5.t4.nas_pipe_enable, 
                               `NASTOP.c5.t3.nas_pipe_enable,
                               `NASTOP.c5.t2.nas_pipe_enable,
                               `NASTOP.c5.t1.nas_pipe_enable,
                               `NASTOP.c5.t0.nas_pipe_enable};


//----------------------------------------------------------
// I/DTLB miscellaneous sync and followme (1 per core)
//----------------------------------------------------------

tlb_misc_c5 tlb_misc_c5 (); 

//----------------------------------------------------------
// ITLB write detection - HWTW and TLBWRITE (1 per core)
//----------------------------------------------------------

itlb_wr_c5 itlb_wr_c5 ();

//----------------------------------------------------------
// DTLB write detection - HWTW and TLBWRITE (1 per core)
//----------------------------------------------------------

dtlb_wr_c5 dtlb_wr_c5 ();

//----------------------------------------------------------
// ITLB read detection - pipeline (1 per thread group)
//----------------------------------------------------------
itlb_rd_c5 itlb_rd_c5tg0 (
  .mytg           (1'h0),
  .itlb_pipe_d0   (itlb_pipe_d0_c5),
  .itlb_pipe_d1   (itlb_pipe_d1_c5),
  .itlb_pipe_d2   (itlb_pipe_d2_c5),
  .itlb_pipe_d3   (itlb_pipe_d3_c5)
);
itlb_rd_c5 itlb_rd_c5tg1 (
  .mytg           (1'h1),
  .itlb_pipe_d0   (itlb_pipe_d4_c5),
  .itlb_pipe_d1   (itlb_pipe_d5_c5),
  .itlb_pipe_d2   (itlb_pipe_d6_c5),
  .itlb_pipe_d3   (itlb_pipe_d7_c5)
);

//----------------------------------------------------------
// DTLB read detection (1 per thread group)
//----------------------------------------------------------

dtlb_rd_c5 dtlb_rd_c5tg0 (
  .mytg           (1'h0)
);

dtlb_rd_c5 dtlb_rd_c5tg1 (
  .mytg           (1'h1)
);

//----------------------------------------------------------
//----------------------------------------------------------

//----------------------------------------------------------
// Shadow IFU Instruction Buffer (1 per thread)
//----------------------------------------------------------

tlb_fifo_c5 tlb_fifo_c5t0 (

  .mytid          (3'h0),
  .itlb_pipe_d    (itlb_pipe_d0_c5)
);

//----------------------------------------------------------

//----------------------------------------------------------
// Shadow IFU Instruction Buffer (1 per thread)
//----------------------------------------------------------

tlb_fifo_c5 tlb_fifo_c5t1 (

  .mytid          (3'h1),
  .itlb_pipe_d    (itlb_pipe_d1_c5)
);

//----------------------------------------------------------

//----------------------------------------------------------
// Shadow IFU Instruction Buffer (1 per thread)
//----------------------------------------------------------

tlb_fifo_c5 tlb_fifo_c5t2 (

  .mytid          (3'h2),
  .itlb_pipe_d    (itlb_pipe_d2_c5)
);

//----------------------------------------------------------

//----------------------------------------------------------
// Shadow IFU Instruction Buffer (1 per thread)
//----------------------------------------------------------

tlb_fifo_c5 tlb_fifo_c5t3 (

  .mytid          (3'h3),
  .itlb_pipe_d    (itlb_pipe_d3_c5)
);

//----------------------------------------------------------

//----------------------------------------------------------
// Shadow IFU Instruction Buffer (1 per thread)
//----------------------------------------------------------

tlb_fifo_c5 tlb_fifo_c5t4 (

  .mytid          (3'h4),
  .itlb_pipe_d    (itlb_pipe_d4_c5)
);

//----------------------------------------------------------

//----------------------------------------------------------
// Shadow IFU Instruction Buffer (1 per thread)
//----------------------------------------------------------

tlb_fifo_c5 tlb_fifo_c5t5 (

  .mytid          (3'h5),
  .itlb_pipe_d    (itlb_pipe_d5_c5)
);

//----------------------------------------------------------

//----------------------------------------------------------
// Shadow IFU Instruction Buffer (1 per thread)
//----------------------------------------------------------

tlb_fifo_c5 tlb_fifo_c5t6 (

  .mytid          (3'h6),
  .itlb_pipe_d    (itlb_pipe_d6_c5)
);

//----------------------------------------------------------

//----------------------------------------------------------
// Shadow IFU Instruction Buffer (1 per thread)
//----------------------------------------------------------

tlb_fifo_c5 tlb_fifo_c5t7 (

  .mytid          (3'h7),
  .itlb_pipe_d    (itlb_pipe_d7_c5)
);

`endif

`ifdef CORE_6

wire [7:0] nas_pipe_enabled_core6 = {`NASTOP.c6.t7.nas_pipe_enable,
                               `NASTOP.c6.t6.nas_pipe_enable,
                               `NASTOP.c6.t5.nas_pipe_enable,
                               `NASTOP.c6.t4.nas_pipe_enable, 
                               `NASTOP.c6.t3.nas_pipe_enable,
                               `NASTOP.c6.t2.nas_pipe_enable,
                               `NASTOP.c6.t1.nas_pipe_enable,
                               `NASTOP.c6.t0.nas_pipe_enable};


//----------------------------------------------------------
// I/DTLB miscellaneous sync and followme (1 per core)
//----------------------------------------------------------

tlb_misc_c6 tlb_misc_c6 (); 

//----------------------------------------------------------
// ITLB write detection - HWTW and TLBWRITE (1 per core)
//----------------------------------------------------------

itlb_wr_c6 itlb_wr_c6 ();

//----------------------------------------------------------
// DTLB write detection - HWTW and TLBWRITE (1 per core)
//----------------------------------------------------------

dtlb_wr_c6 dtlb_wr_c6 ();

//----------------------------------------------------------
// ITLB read detection - pipeline (1 per thread group)
//----------------------------------------------------------
itlb_rd_c6 itlb_rd_c6tg0 (
  .mytg           (1'h0),
  .itlb_pipe_d0   (itlb_pipe_d0_c6),
  .itlb_pipe_d1   (itlb_pipe_d1_c6),
  .itlb_pipe_d2   (itlb_pipe_d2_c6),
  .itlb_pipe_d3   (itlb_pipe_d3_c6)
);
itlb_rd_c6 itlb_rd_c6tg1 (
  .mytg           (1'h1),
  .itlb_pipe_d0   (itlb_pipe_d4_c6),
  .itlb_pipe_d1   (itlb_pipe_d5_c6),
  .itlb_pipe_d2   (itlb_pipe_d6_c6),
  .itlb_pipe_d3   (itlb_pipe_d7_c6)
);

//----------------------------------------------------------
// DTLB read detection (1 per thread group)
//----------------------------------------------------------

dtlb_rd_c6 dtlb_rd_c6tg0 (
  .mytg           (1'h0)
);

dtlb_rd_c6 dtlb_rd_c6tg1 (
  .mytg           (1'h1)
);

//----------------------------------------------------------
//----------------------------------------------------------

//----------------------------------------------------------
// Shadow IFU Instruction Buffer (1 per thread)
//----------------------------------------------------------

tlb_fifo_c6 tlb_fifo_c6t0 (

  .mytid          (3'h0),
  .itlb_pipe_d    (itlb_pipe_d0_c6)
);

//----------------------------------------------------------

//----------------------------------------------------------
// Shadow IFU Instruction Buffer (1 per thread)
//----------------------------------------------------------

tlb_fifo_c6 tlb_fifo_c6t1 (

  .mytid          (3'h1),
  .itlb_pipe_d    (itlb_pipe_d1_c6)
);

//----------------------------------------------------------

//----------------------------------------------------------
// Shadow IFU Instruction Buffer (1 per thread)
//----------------------------------------------------------

tlb_fifo_c6 tlb_fifo_c6t2 (

  .mytid          (3'h2),
  .itlb_pipe_d    (itlb_pipe_d2_c6)
);

//----------------------------------------------------------

//----------------------------------------------------------
// Shadow IFU Instruction Buffer (1 per thread)
//----------------------------------------------------------

tlb_fifo_c6 tlb_fifo_c6t3 (

  .mytid          (3'h3),
  .itlb_pipe_d    (itlb_pipe_d3_c6)
);

//----------------------------------------------------------

//----------------------------------------------------------
// Shadow IFU Instruction Buffer (1 per thread)
//----------------------------------------------------------

tlb_fifo_c6 tlb_fifo_c6t4 (

  .mytid          (3'h4),
  .itlb_pipe_d    (itlb_pipe_d4_c6)
);

//----------------------------------------------------------

//----------------------------------------------------------
// Shadow IFU Instruction Buffer (1 per thread)
//----------------------------------------------------------

tlb_fifo_c6 tlb_fifo_c6t5 (

  .mytid          (3'h5),
  .itlb_pipe_d    (itlb_pipe_d5_c6)
);

//----------------------------------------------------------

//----------------------------------------------------------
// Shadow IFU Instruction Buffer (1 per thread)
//----------------------------------------------------------

tlb_fifo_c6 tlb_fifo_c6t6 (

  .mytid          (3'h6),
  .itlb_pipe_d    (itlb_pipe_d6_c6)
);

//----------------------------------------------------------

//----------------------------------------------------------
// Shadow IFU Instruction Buffer (1 per thread)
//----------------------------------------------------------

tlb_fifo_c6 tlb_fifo_c6t7 (

  .mytid          (3'h7),
  .itlb_pipe_d    (itlb_pipe_d7_c6)
);

`endif

`ifdef CORE_7

wire [7:0] nas_pipe_enabled_core7 = {`NASTOP.c7.t7.nas_pipe_enable,
                               `NASTOP.c7.t6.nas_pipe_enable,
                               `NASTOP.c7.t5.nas_pipe_enable,
                               `NASTOP.c7.t4.nas_pipe_enable, 
                               `NASTOP.c7.t3.nas_pipe_enable,
                               `NASTOP.c7.t2.nas_pipe_enable,
                               `NASTOP.c7.t1.nas_pipe_enable,
                               `NASTOP.c7.t0.nas_pipe_enable};


//----------------------------------------------------------
// I/DTLB miscellaneous sync and followme (1 per core)
//----------------------------------------------------------

tlb_misc_c7 tlb_misc_c7 (); 

//----------------------------------------------------------
// ITLB write detection - HWTW and TLBWRITE (1 per core)
//----------------------------------------------------------

itlb_wr_c7 itlb_wr_c7 ();

//----------------------------------------------------------
// DTLB write detection - HWTW and TLBWRITE (1 per core)
//----------------------------------------------------------

dtlb_wr_c7 dtlb_wr_c7 ();

//----------------------------------------------------------
// ITLB read detection - pipeline (1 per thread group)
//----------------------------------------------------------
itlb_rd_c7 itlb_rd_c7tg0 (
  .mytg           (1'h0),
  .itlb_pipe_d0   (itlb_pipe_d0_c7),
  .itlb_pipe_d1   (itlb_pipe_d1_c7),
  .itlb_pipe_d2   (itlb_pipe_d2_c7),
  .itlb_pipe_d3   (itlb_pipe_d3_c7)
);
itlb_rd_c7 itlb_rd_c7tg1 (
  .mytg           (1'h1),
  .itlb_pipe_d0   (itlb_pipe_d4_c7),
  .itlb_pipe_d1   (itlb_pipe_d5_c7),
  .itlb_pipe_d2   (itlb_pipe_d6_c7),
  .itlb_pipe_d3   (itlb_pipe_d7_c7)
);

//----------------------------------------------------------
// DTLB read detection (1 per thread group)
//----------------------------------------------------------

dtlb_rd_c7 dtlb_rd_c7tg0 (
  .mytg           (1'h0)
);

dtlb_rd_c7 dtlb_rd_c7tg1 (
  .mytg           (1'h1)
);

//----------------------------------------------------------
//----------------------------------------------------------

//----------------------------------------------------------
// Shadow IFU Instruction Buffer (1 per thread)
//----------------------------------------------------------

tlb_fifo_c7 tlb_fifo_c7t0 (

  .mytid          (3'h0),
  .itlb_pipe_d    (itlb_pipe_d0_c7)
);

//----------------------------------------------------------

//----------------------------------------------------------
// Shadow IFU Instruction Buffer (1 per thread)
//----------------------------------------------------------

tlb_fifo_c7 tlb_fifo_c7t1 (

  .mytid          (3'h1),
  .itlb_pipe_d    (itlb_pipe_d1_c7)
);

//----------------------------------------------------------

//----------------------------------------------------------
// Shadow IFU Instruction Buffer (1 per thread)
//----------------------------------------------------------

tlb_fifo_c7 tlb_fifo_c7t2 (

  .mytid          (3'h2),
  .itlb_pipe_d    (itlb_pipe_d2_c7)
);

//----------------------------------------------------------

//----------------------------------------------------------
// Shadow IFU Instruction Buffer (1 per thread)
//----------------------------------------------------------

tlb_fifo_c7 tlb_fifo_c7t3 (

  .mytid          (3'h3),
  .itlb_pipe_d    (itlb_pipe_d3_c7)
);

//----------------------------------------------------------

//----------------------------------------------------------
// Shadow IFU Instruction Buffer (1 per thread)
//----------------------------------------------------------

tlb_fifo_c7 tlb_fifo_c7t4 (

  .mytid          (3'h4),
  .itlb_pipe_d    (itlb_pipe_d4_c7)
);

//----------------------------------------------------------

//----------------------------------------------------------
// Shadow IFU Instruction Buffer (1 per thread)
//----------------------------------------------------------

tlb_fifo_c7 tlb_fifo_c7t5 (

  .mytid          (3'h5),
  .itlb_pipe_d    (itlb_pipe_d5_c7)
);

//----------------------------------------------------------

//----------------------------------------------------------
// Shadow IFU Instruction Buffer (1 per thread)
//----------------------------------------------------------

tlb_fifo_c7 tlb_fifo_c7t6 (

  .mytid          (3'h6),
  .itlb_pipe_d    (itlb_pipe_d6_c7)
);

//----------------------------------------------------------

//----------------------------------------------------------
// Shadow IFU Instruction Buffer (1 per thread)
//----------------------------------------------------------

tlb_fifo_c7 tlb_fifo_c7t7 (

  .mytid          (3'h7),
  .itlb_pipe_d    (itlb_pipe_d7_c7)
);

`endif


endmodule
//----------------------------------------------------------
//----------------------------------------------------------
