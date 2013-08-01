// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: ldst_l2.v
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
`timescale 1 ps / 1 ps

module ldst_l2 ();
`ifndef GATESIM

// common defines
`include "defines.vh"
// PCX/CPX packet defines (see :/verif/env/common/vera/include)
`include "ccx.vri"

// Partial Bank Support
`ifdef RTL_NO_BNK01
  `define NO_L2_BNK0
  `define NO_L2_BNK1
`endif
`ifdef RTL_NO_BNK23
  `define NO_L2_BNK2
  `define NO_L2_BNK3
`endif
`ifdef RTL_NO_BNK45
  `define NO_L2_BNK4
  `define NO_L2_BNK5
`endif
`ifdef RTL_NO_BNK67
  `define NO_L2_BNK6
  `define NO_L2_BNK7
`endif

// SPC Bench only has Bank0
`ifdef SPC
  `define NO_L2_BNK1
  `define NO_L2_BNK2
  `define NO_L2_BNK3
  `define NO_L2_BNK4
  `define NO_L2_BNK5
  `define NO_L2_BNK6
  `define NO_L2_BNK7
  `define NO_L2_BNK8
`endif

//---------------------
// Misc Signals
wire                 [7:0] dsrc;
integer                    tstamp;
integer                    junk;
integer                    i;

//----------------------------------------------------------
//----------------------------------------------------------
// DUT probes

  assign dsrc = `DSRC_L2_MEMORY;

//==========================================================
//==========================================================
// L2 Stub Probes

`ifdef NO_L2_BNK0
`else
  `ifdef NOL2RTL

  //----------------------------------------------------------
  // Signals for L2 Stub Bank0

  wire             [145:0] b0_cpx_pkt;
  wire              [39:0] b0_cpx_pa;
  wire               [2:0] b0_cpx_cid;
  wire               [2:0] b0_cpx_tid;
  wire               [5:0] b0_cpx_tnum;
  wire                     b0_cpx_ctrue;
  wire                     b0_cpx_swap;
  wire                     b0_cpx_valid;

  // b0_cpx_swap is required for the L2 Stub to work properly on Swap/Ldstub.
  // Swap/Ldstub have 1 PCX but 2 CPX packets.
  // The L2 Stub processes the 2 CPX packets in 0 time when it accesses memory.
  // When probing L2 stub, ldst_sync must know to send out a LDDATA and STCOMMIT message
  //     for the StAck of a Swap/Ldstub.
  // If StAck & cpx_swap==1, then send LDDATA & STCOMMIT.

  assign  b0_cpx_pkt   = `TOP.b0_cpx_pkt;
  assign  b0_cpx_pa    = `TOP.b0_cpx_pa;
  assign  b0_cpx_cid   = `TOP.b0_cpx_cid;
  assign  b0_cpx_tid   = b0_cpx_pkt[`CPX_TID];
  assign  b0_cpx_tnum  = {b0_cpx_cid,b0_cpx_tid};
  assign  b0_cpx_ctrue = `TOP.b0_cpx_ctrue;     // ctrue = compare true for CAS
  assign  b0_cpx_swap  = `TOP.b0_cpx_swap;      // swap = St Ack is from a Swap
  assign  b0_cpx_valid = b0_cpx_pkt[`CPX_VALID];

  //---------------------
  // Evict

  reg               [31:0] b0_ev_vect0;
  reg               [23:0] b0_ev_vect1;
  reg               [31:0] b0_ev_vect2;
  reg               [23:0] b0_ev_vect3;
  reg                [1:0] b0_pa54;
  reg               [31:0] b0_inv_vect [0:3];
  reg               [39:0] b0_evict_pa;
  wire              [39:0] b0_ev_pa;
  reg               [31:0] b0_evict_inv_vect;

  wire                     b0_evict;
  wire             [111:0] b0_ev_invvect;

  assign b0_evict         =  b0_cpx_valid & 
                                 (b0_cpx_pkt[`CPX_RTNTYP]== `CCX_RESP_EVICT);
  assign b0_ev_invvect    =  b0_cpx_pkt[`CPX_VINV_VECT];
  assign b0_ev_pa         = b0_cpx_pa;

  //---------------------
  // Load Data (miss only) (See ldst_lsu.v for Load Data - hit)

  wire                     b0_load_data_miss;
  wire                     b0_ldd_suppress;

  // Special case for L2 Stub - if StAck & swap, then send LDDATA

  assign b0_load_data_miss =  b0_cpx_valid & 
                                    ((((b0_cpx_pkt[`CPX_RTNTYP]== `CCX_RESP_LD)||
                                      (b0_cpx_pkt[`CPX_RTNTYP]== `CCX_RESP_NCU_LD)) & 
                                      (b0_cpx_pkt[`CPX_PF]==1'b0)) ||
                                     ((b0_cpx_pkt[`CPX_RTNTYP]== `CCX_RESP_ST) &
                                      (b0_cpx_swap==1'b1)));

  assign b0_ldd_suppress = (b0_cpx_pa[39:32]==`IO_ASI_ADDR);

  //---------------------
  // Store L2 Commit

  wire                       b0_store_commit;
  wire                 [7:0] b0_stc_size;
  wire                [31:0] b0_stc_inv_vect;
  reg                 [31:0] b0_stc_vect;
  wire                       b0_stc_l2hit;
  wire                       b0_stc_suppress;

    // rtntyp covers ST, CAS, SWAP since same decode
    //    but not Dcache Inval Ack (same rtntyp as ST Ack)
  assign b0_store_commit =  b0_cpx_valid & 
                                (b0_cpx_pkt[`CPX_RTNTYP]== `CCX_RESP_ST) &
                                (b0_cpx_pkt[`CPX_VACK_INVAL]==2'b0);
  // Set size=0 if CAS store didn't happen
  assign b0_stc_size     = (b0_cpx_pkt[`CPX_ATOMIC] & !b0_cpx_ctrue) ?
                                     8'b0 : b0_cpx_pkt[`CPX_VACK_BMASK];

  assign b0_stc_inv_vect = b0_cpx_pkt[`CPX_VACK_VECT];
  assign b0_stc_suppress = (b0_cpx_pa[39:32]==`IO_ASI_ADDR);

  // SPC bench - all L2 accesses are hits because this is used to 
  //   determine whether Block Init St will initialize cache line or not
  //   if l2hit, then memory model doesn't initialize cache line
  //   in SPC bench, cache line is never initialized by CCX stub.
  assign b0_stc_l2hit    = 1'b1;
         
  `endif
`endif

`ifdef NO_L2_BNK1
`else
  `ifdef NOL2RTL

  //----------------------------------------------------------
  // Signals for L2 Stub Bank1

  wire             [145:0] b1_cpx_pkt;
  wire              [39:0] b1_cpx_pa;
  wire               [2:0] b1_cpx_cid;
  wire               [2:0] b1_cpx_tid;
  wire               [5:0] b1_cpx_tnum;
  wire                     b1_cpx_ctrue;
  wire                     b1_cpx_swap;
  wire                     b1_cpx_valid;

  // b1_cpx_swap is required for the L2 Stub to work properly on Swap/Ldstub.
  // Swap/Ldstub have 1 PCX but 2 CPX packets.
  // The L2 Stub processes the 2 CPX packets in 0 time when it accesses memory.
  // When probing L2 stub, ldst_sync must know to send out a LDDATA and STCOMMIT message
  //     for the StAck of a Swap/Ldstub.
  // If StAck & cpx_swap==1, then send LDDATA & STCOMMIT.

  assign  b1_cpx_pkt   = `TOP.b1_cpx_pkt;
  assign  b1_cpx_pa    = `TOP.b1_cpx_pa;
  assign  b1_cpx_cid   = `TOP.b1_cpx_cid;
  assign  b1_cpx_tid   = b1_cpx_pkt[`CPX_TID];
  assign  b1_cpx_tnum  = {b1_cpx_cid,b1_cpx_tid};
  assign  b1_cpx_ctrue = `TOP.b1_cpx_ctrue;     // ctrue = compare true for CAS
  assign  b1_cpx_swap  = `TOP.b1_cpx_swap;      // swap = St Ack is from a Swap
  assign  b1_cpx_valid = b1_cpx_pkt[`CPX_VALID];

  //---------------------
  // Evict

  reg               [31:0] b1_ev_vect0;
  reg               [23:0] b1_ev_vect1;
  reg               [31:0] b1_ev_vect2;
  reg               [23:0] b1_ev_vect3;
  reg                [1:0] b1_pa54;
  reg               [31:0] b1_inv_vect [0:3];
  reg               [39:0] b1_evict_pa;
  wire              [39:0] b1_ev_pa;
  reg               [31:0] b1_evict_inv_vect;

  wire                     b1_evict;
  wire             [111:0] b1_ev_invvect;

  assign b1_evict         =  b1_cpx_valid & 
                                 (b1_cpx_pkt[`CPX_RTNTYP]== `CCX_RESP_EVICT);
  assign b1_ev_invvect    =  b1_cpx_pkt[`CPX_VINV_VECT];
  assign b1_ev_pa         = b1_cpx_pa;

  //---------------------
  // Load Data (miss only) (See ldst_lsu.v for Load Data - hit)

  wire                     b1_load_data_miss;
  wire                     b1_ldd_suppress;

  // Special case for L2 Stub - if StAck & swap, then send LDDATA

  assign b1_load_data_miss =  b1_cpx_valid & 
                                    ((((b1_cpx_pkt[`CPX_RTNTYP]== `CCX_RESP_LD)||
                                      (b1_cpx_pkt[`CPX_RTNTYP]== `CCX_RESP_NCU_LD)) & 
                                      (b1_cpx_pkt[`CPX_PF]==1'b0)) ||
                                     ((b1_cpx_pkt[`CPX_RTNTYP]== `CCX_RESP_ST) &
                                      (b1_cpx_swap==1'b1)));

  assign b1_ldd_suppress = (b1_cpx_pa[39:32]==`IO_ASI_ADDR);

  //---------------------
  // Store L2 Commit

  wire                       b1_store_commit;
  wire                 [7:0] b1_stc_size;
  wire                [31:0] b1_stc_inv_vect;
  reg                 [31:0] b1_stc_vect;
  wire                       b1_stc_l2hit;
  wire                       b1_stc_suppress;

    // rtntyp covers ST, CAS, SWAP since same decode
    //    but not Dcache Inval Ack (same rtntyp as ST Ack)
  assign b1_store_commit =  b1_cpx_valid & 
                                (b1_cpx_pkt[`CPX_RTNTYP]== `CCX_RESP_ST) &
                                (b1_cpx_pkt[`CPX_VACK_INVAL]==2'b0);
  // Set size=0 if CAS store didn't happen
  assign b1_stc_size     = (b1_cpx_pkt[`CPX_ATOMIC] & !b1_cpx_ctrue) ?
                                     8'b0 : b1_cpx_pkt[`CPX_VACK_BMASK];

  assign b1_stc_inv_vect = b1_cpx_pkt[`CPX_VACK_VECT];
  assign b1_stc_suppress = (b1_cpx_pa[39:32]==`IO_ASI_ADDR);

  // SPC bench - all L2 accesses are hits because this is used to 
  //   determine whether Block Init St will initialize cache line or not
  //   if l2hit, then memory model doesn't initialize cache line
  //   in SPC bench, cache line is never initialized by CCX stub.
  assign b1_stc_l2hit    = 1'b1;
         
  `endif
`endif

`ifdef NO_L2_BNK2
`else
  `ifdef NOL2RTL

  //----------------------------------------------------------
  // Signals for L2 Stub Bank2

  wire             [145:0] b2_cpx_pkt;
  wire              [39:0] b2_cpx_pa;
  wire               [2:0] b2_cpx_cid;
  wire               [2:0] b2_cpx_tid;
  wire               [5:0] b2_cpx_tnum;
  wire                     b2_cpx_ctrue;
  wire                     b2_cpx_swap;
  wire                     b2_cpx_valid;

  // b2_cpx_swap is required for the L2 Stub to work properly on Swap/Ldstub.
  // Swap/Ldstub have 1 PCX but 2 CPX packets.
  // The L2 Stub processes the 2 CPX packets in 0 time when it accesses memory.
  // When probing L2 stub, ldst_sync must know to send out a LDDATA and STCOMMIT message
  //     for the StAck of a Swap/Ldstub.
  // If StAck & cpx_swap==1, then send LDDATA & STCOMMIT.

  assign  b2_cpx_pkt   = `TOP.b2_cpx_pkt;
  assign  b2_cpx_pa    = `TOP.b2_cpx_pa;
  assign  b2_cpx_cid   = `TOP.b2_cpx_cid;
  assign  b2_cpx_tid   = b2_cpx_pkt[`CPX_TID];
  assign  b2_cpx_tnum  = {b2_cpx_cid,b2_cpx_tid};
  assign  b2_cpx_ctrue = `TOP.b2_cpx_ctrue;     // ctrue = compare true for CAS
  assign  b2_cpx_swap  = `TOP.b2_cpx_swap;      // swap = St Ack is from a Swap
  assign  b2_cpx_valid = b2_cpx_pkt[`CPX_VALID];

  //---------------------
  // Evict

  reg               [31:0] b2_ev_vect0;
  reg               [23:0] b2_ev_vect1;
  reg               [31:0] b2_ev_vect2;
  reg               [23:0] b2_ev_vect3;
  reg                [1:0] b2_pa54;
  reg               [31:0] b2_inv_vect [0:3];
  reg               [39:0] b2_evict_pa;
  wire              [39:0] b2_ev_pa;
  reg               [31:0] b2_evict_inv_vect;

  wire                     b2_evict;
  wire             [111:0] b2_ev_invvect;

  assign b2_evict         =  b2_cpx_valid & 
                                 (b2_cpx_pkt[`CPX_RTNTYP]== `CCX_RESP_EVICT);
  assign b2_ev_invvect    =  b2_cpx_pkt[`CPX_VINV_VECT];
  assign b2_ev_pa         = b2_cpx_pa;

  //---------------------
  // Load Data (miss only) (See ldst_lsu.v for Load Data - hit)

  wire                     b2_load_data_miss;
  wire                     b2_ldd_suppress;

  // Special case for L2 Stub - if StAck & swap, then send LDDATA

  assign b2_load_data_miss =  b2_cpx_valid & 
                                    ((((b2_cpx_pkt[`CPX_RTNTYP]== `CCX_RESP_LD)||
                                      (b2_cpx_pkt[`CPX_RTNTYP]== `CCX_RESP_NCU_LD)) & 
                                      (b2_cpx_pkt[`CPX_PF]==1'b0)) ||
                                     ((b2_cpx_pkt[`CPX_RTNTYP]== `CCX_RESP_ST) &
                                      (b2_cpx_swap==1'b1)));

  assign b2_ldd_suppress = (b2_cpx_pa[39:32]==`IO_ASI_ADDR);

  //---------------------
  // Store L2 Commit

  wire                       b2_store_commit;
  wire                 [7:0] b2_stc_size;
  wire                [31:0] b2_stc_inv_vect;
  reg                 [31:0] b2_stc_vect;
  wire                       b2_stc_l2hit;
  wire                       b2_stc_suppress;

    // rtntyp covers ST, CAS, SWAP since same decode
    //    but not Dcache Inval Ack (same rtntyp as ST Ack)
  assign b2_store_commit =  b2_cpx_valid & 
                                (b2_cpx_pkt[`CPX_RTNTYP]== `CCX_RESP_ST) &
                                (b2_cpx_pkt[`CPX_VACK_INVAL]==2'b0);
  // Set size=0 if CAS store didn't happen
  assign b2_stc_size     = (b2_cpx_pkt[`CPX_ATOMIC] & !b2_cpx_ctrue) ?
                                     8'b0 : b2_cpx_pkt[`CPX_VACK_BMASK];

  assign b2_stc_inv_vect = b2_cpx_pkt[`CPX_VACK_VECT];
  assign b2_stc_suppress = (b2_cpx_pa[39:32]==`IO_ASI_ADDR);

  // SPC bench - all L2 accesses are hits because this is used to 
  //   determine whether Block Init St will initialize cache line or not
  //   if l2hit, then memory model doesn't initialize cache line
  //   in SPC bench, cache line is never initialized by CCX stub.
  assign b2_stc_l2hit    = 1'b1;
         
  `endif
`endif

`ifdef NO_L2_BNK3
`else
  `ifdef NOL2RTL

  //----------------------------------------------------------
  // Signals for L2 Stub Bank3

  wire             [145:0] b3_cpx_pkt;
  wire              [39:0] b3_cpx_pa;
  wire               [2:0] b3_cpx_cid;
  wire               [2:0] b3_cpx_tid;
  wire               [5:0] b3_cpx_tnum;
  wire                     b3_cpx_ctrue;
  wire                     b3_cpx_swap;
  wire                     b3_cpx_valid;

  // b3_cpx_swap is required for the L2 Stub to work properly on Swap/Ldstub.
  // Swap/Ldstub have 1 PCX but 2 CPX packets.
  // The L2 Stub processes the 2 CPX packets in 0 time when it accesses memory.
  // When probing L2 stub, ldst_sync must know to send out a LDDATA and STCOMMIT message
  //     for the StAck of a Swap/Ldstub.
  // If StAck & cpx_swap==1, then send LDDATA & STCOMMIT.

  assign  b3_cpx_pkt   = `TOP.b3_cpx_pkt;
  assign  b3_cpx_pa    = `TOP.b3_cpx_pa;
  assign  b3_cpx_cid   = `TOP.b3_cpx_cid;
  assign  b3_cpx_tid   = b3_cpx_pkt[`CPX_TID];
  assign  b3_cpx_tnum  = {b3_cpx_cid,b3_cpx_tid};
  assign  b3_cpx_ctrue = `TOP.b3_cpx_ctrue;     // ctrue = compare true for CAS
  assign  b3_cpx_swap  = `TOP.b3_cpx_swap;      // swap = St Ack is from a Swap
  assign  b3_cpx_valid = b3_cpx_pkt[`CPX_VALID];

  //---------------------
  // Evict

  reg               [31:0] b3_ev_vect0;
  reg               [23:0] b3_ev_vect1;
  reg               [31:0] b3_ev_vect2;
  reg               [23:0] b3_ev_vect3;
  reg                [1:0] b3_pa54;
  reg               [31:0] b3_inv_vect [0:3];
  reg               [39:0] b3_evict_pa;
  wire              [39:0] b3_ev_pa;
  reg               [31:0] b3_evict_inv_vect;

  wire                     b3_evict;
  wire             [111:0] b3_ev_invvect;

  assign b3_evict         =  b3_cpx_valid & 
                                 (b3_cpx_pkt[`CPX_RTNTYP]== `CCX_RESP_EVICT);
  assign b3_ev_invvect    =  b3_cpx_pkt[`CPX_VINV_VECT];
  assign b3_ev_pa         = b3_cpx_pa;

  //---------------------
  // Load Data (miss only) (See ldst_lsu.v for Load Data - hit)

  wire                     b3_load_data_miss;
  wire                     b3_ldd_suppress;

  // Special case for L2 Stub - if StAck & swap, then send LDDATA

  assign b3_load_data_miss =  b3_cpx_valid & 
                                    ((((b3_cpx_pkt[`CPX_RTNTYP]== `CCX_RESP_LD)||
                                      (b3_cpx_pkt[`CPX_RTNTYP]== `CCX_RESP_NCU_LD)) & 
                                      (b3_cpx_pkt[`CPX_PF]==1'b0)) ||
                                     ((b3_cpx_pkt[`CPX_RTNTYP]== `CCX_RESP_ST) &
                                      (b3_cpx_swap==1'b1)));

  assign b3_ldd_suppress = (b3_cpx_pa[39:32]==`IO_ASI_ADDR);

  //---------------------
  // Store L2 Commit

  wire                       b3_store_commit;
  wire                 [7:0] b3_stc_size;
  wire                [31:0] b3_stc_inv_vect;
  reg                 [31:0] b3_stc_vect;
  wire                       b3_stc_l2hit;
  wire                       b3_stc_suppress;

    // rtntyp covers ST, CAS, SWAP since same decode
    //    but not Dcache Inval Ack (same rtntyp as ST Ack)
  assign b3_store_commit =  b3_cpx_valid & 
                                (b3_cpx_pkt[`CPX_RTNTYP]== `CCX_RESP_ST) &
                                (b3_cpx_pkt[`CPX_VACK_INVAL]==2'b0);
  // Set size=0 if CAS store didn't happen
  assign b3_stc_size     = (b3_cpx_pkt[`CPX_ATOMIC] & !b3_cpx_ctrue) ?
                                     8'b0 : b3_cpx_pkt[`CPX_VACK_BMASK];

  assign b3_stc_inv_vect = b3_cpx_pkt[`CPX_VACK_VECT];
  assign b3_stc_suppress = (b3_cpx_pa[39:32]==`IO_ASI_ADDR);

  // SPC bench - all L2 accesses are hits because this is used to 
  //   determine whether Block Init St will initialize cache line or not
  //   if l2hit, then memory model doesn't initialize cache line
  //   in SPC bench, cache line is never initialized by CCX stub.
  assign b3_stc_l2hit    = 1'b1;
         
  `endif
`endif

`ifdef NO_L2_BNK4
`else
  `ifdef NOL2RTL

  //----------------------------------------------------------
  // Signals for L2 Stub Bank4

  wire             [145:0] b4_cpx_pkt;
  wire              [39:0] b4_cpx_pa;
  wire               [2:0] b4_cpx_cid;
  wire               [2:0] b4_cpx_tid;
  wire               [5:0] b4_cpx_tnum;
  wire                     b4_cpx_ctrue;
  wire                     b4_cpx_swap;
  wire                     b4_cpx_valid;

  // b4_cpx_swap is required for the L2 Stub to work properly on Swap/Ldstub.
  // Swap/Ldstub have 1 PCX but 2 CPX packets.
  // The L2 Stub processes the 2 CPX packets in 0 time when it accesses memory.
  // When probing L2 stub, ldst_sync must know to send out a LDDATA and STCOMMIT message
  //     for the StAck of a Swap/Ldstub.
  // If StAck & cpx_swap==1, then send LDDATA & STCOMMIT.

  assign  b4_cpx_pkt   = `TOP.b4_cpx_pkt;
  assign  b4_cpx_pa    = `TOP.b4_cpx_pa;
  assign  b4_cpx_cid   = `TOP.b4_cpx_cid;
  assign  b4_cpx_tid   = b4_cpx_pkt[`CPX_TID];
  assign  b4_cpx_tnum  = {b4_cpx_cid,b4_cpx_tid};
  assign  b4_cpx_ctrue = `TOP.b4_cpx_ctrue;     // ctrue = compare true for CAS
  assign  b4_cpx_swap  = `TOP.b4_cpx_swap;      // swap = St Ack is from a Swap
  assign  b4_cpx_valid = b4_cpx_pkt[`CPX_VALID];

  //---------------------
  // Evict

  reg               [31:0] b4_ev_vect0;
  reg               [23:0] b4_ev_vect1;
  reg               [31:0] b4_ev_vect2;
  reg               [23:0] b4_ev_vect3;
  reg                [1:0] b4_pa54;
  reg               [31:0] b4_inv_vect [0:3];
  reg               [39:0] b4_evict_pa;
  wire              [39:0] b4_ev_pa;
  reg               [31:0] b4_evict_inv_vect;

  wire                     b4_evict;
  wire             [111:0] b4_ev_invvect;

  assign b4_evict         =  b4_cpx_valid & 
                                 (b4_cpx_pkt[`CPX_RTNTYP]== `CCX_RESP_EVICT);
  assign b4_ev_invvect    =  b4_cpx_pkt[`CPX_VINV_VECT];
  assign b4_ev_pa         = b4_cpx_pa;

  //---------------------
  // Load Data (miss only) (See ldst_lsu.v for Load Data - hit)

  wire                     b4_load_data_miss;
  wire                     b4_ldd_suppress;

  // Special case for L2 Stub - if StAck & swap, then send LDDATA

  assign b4_load_data_miss =  b4_cpx_valid & 
                                    ((((b4_cpx_pkt[`CPX_RTNTYP]== `CCX_RESP_LD)||
                                      (b4_cpx_pkt[`CPX_RTNTYP]== `CCX_RESP_NCU_LD)) & 
                                      (b4_cpx_pkt[`CPX_PF]==1'b0)) ||
                                     ((b4_cpx_pkt[`CPX_RTNTYP]== `CCX_RESP_ST) &
                                      (b4_cpx_swap==1'b1)));

  assign b4_ldd_suppress = (b4_cpx_pa[39:32]==`IO_ASI_ADDR);

  //---------------------
  // Store L2 Commit

  wire                       b4_store_commit;
  wire                 [7:0] b4_stc_size;
  wire                [31:0] b4_stc_inv_vect;
  reg                 [31:0] b4_stc_vect;
  wire                       b4_stc_l2hit;
  wire                       b4_stc_suppress;

    // rtntyp covers ST, CAS, SWAP since same decode
    //    but not Dcache Inval Ack (same rtntyp as ST Ack)
  assign b4_store_commit =  b4_cpx_valid & 
                                (b4_cpx_pkt[`CPX_RTNTYP]== `CCX_RESP_ST) &
                                (b4_cpx_pkt[`CPX_VACK_INVAL]==2'b0);
  // Set size=0 if CAS store didn't happen
  assign b4_stc_size     = (b4_cpx_pkt[`CPX_ATOMIC] & !b4_cpx_ctrue) ?
                                     8'b0 : b4_cpx_pkt[`CPX_VACK_BMASK];

  assign b4_stc_inv_vect = b4_cpx_pkt[`CPX_VACK_VECT];
  assign b4_stc_suppress = (b4_cpx_pa[39:32]==`IO_ASI_ADDR);

  // SPC bench - all L2 accesses are hits because this is used to 
  //   determine whether Block Init St will initialize cache line or not
  //   if l2hit, then memory model doesn't initialize cache line
  //   in SPC bench, cache line is never initialized by CCX stub.
  assign b4_stc_l2hit    = 1'b1;
         
  `endif
`endif

`ifdef NO_L2_BNK5
`else
  `ifdef NOL2RTL

  //----------------------------------------------------------
  // Signals for L2 Stub Bank5

  wire             [145:0] b5_cpx_pkt;
  wire              [39:0] b5_cpx_pa;
  wire               [2:0] b5_cpx_cid;
  wire               [2:0] b5_cpx_tid;
  wire               [5:0] b5_cpx_tnum;
  wire                     b5_cpx_ctrue;
  wire                     b5_cpx_swap;
  wire                     b5_cpx_valid;

  // b5_cpx_swap is required for the L2 Stub to work properly on Swap/Ldstub.
  // Swap/Ldstub have 1 PCX but 2 CPX packets.
  // The L2 Stub processes the 2 CPX packets in 0 time when it accesses memory.
  // When probing L2 stub, ldst_sync must know to send out a LDDATA and STCOMMIT message
  //     for the StAck of a Swap/Ldstub.
  // If StAck & cpx_swap==1, then send LDDATA & STCOMMIT.

  assign  b5_cpx_pkt   = `TOP.b5_cpx_pkt;
  assign  b5_cpx_pa    = `TOP.b5_cpx_pa;
  assign  b5_cpx_cid   = `TOP.b5_cpx_cid;
  assign  b5_cpx_tid   = b5_cpx_pkt[`CPX_TID];
  assign  b5_cpx_tnum  = {b5_cpx_cid,b5_cpx_tid};
  assign  b5_cpx_ctrue = `TOP.b5_cpx_ctrue;     // ctrue = compare true for CAS
  assign  b5_cpx_swap  = `TOP.b5_cpx_swap;      // swap = St Ack is from a Swap
  assign  b5_cpx_valid = b5_cpx_pkt[`CPX_VALID];

  //---------------------
  // Evict

  reg               [31:0] b5_ev_vect0;
  reg               [23:0] b5_ev_vect1;
  reg               [31:0] b5_ev_vect2;
  reg               [23:0] b5_ev_vect3;
  reg                [1:0] b5_pa54;
  reg               [31:0] b5_inv_vect [0:3];
  reg               [39:0] b5_evict_pa;
  wire              [39:0] b5_ev_pa;
  reg               [31:0] b5_evict_inv_vect;

  wire                     b5_evict;
  wire             [111:0] b5_ev_invvect;

  assign b5_evict         =  b5_cpx_valid & 
                                 (b5_cpx_pkt[`CPX_RTNTYP]== `CCX_RESP_EVICT);
  assign b5_ev_invvect    =  b5_cpx_pkt[`CPX_VINV_VECT];
  assign b5_ev_pa         = b5_cpx_pa;

  //---------------------
  // Load Data (miss only) (See ldst_lsu.v for Load Data - hit)

  wire                     b5_load_data_miss;
  wire                     b5_ldd_suppress;

  // Special case for L2 Stub - if StAck & swap, then send LDDATA

  assign b5_load_data_miss =  b5_cpx_valid & 
                                    ((((b5_cpx_pkt[`CPX_RTNTYP]== `CCX_RESP_LD)||
                                      (b5_cpx_pkt[`CPX_RTNTYP]== `CCX_RESP_NCU_LD)) & 
                                      (b5_cpx_pkt[`CPX_PF]==1'b0)) ||
                                     ((b5_cpx_pkt[`CPX_RTNTYP]== `CCX_RESP_ST) &
                                      (b5_cpx_swap==1'b1)));

  assign b5_ldd_suppress = (b5_cpx_pa[39:32]==`IO_ASI_ADDR);

  //---------------------
  // Store L2 Commit

  wire                       b5_store_commit;
  wire                 [7:0] b5_stc_size;
  wire                [31:0] b5_stc_inv_vect;
  reg                 [31:0] b5_stc_vect;
  wire                       b5_stc_l2hit;
  wire                       b5_stc_suppress;

    // rtntyp covers ST, CAS, SWAP since same decode
    //    but not Dcache Inval Ack (same rtntyp as ST Ack)
  assign b5_store_commit =  b5_cpx_valid & 
                                (b5_cpx_pkt[`CPX_RTNTYP]== `CCX_RESP_ST) &
                                (b5_cpx_pkt[`CPX_VACK_INVAL]==2'b0);
  // Set size=0 if CAS store didn't happen
  assign b5_stc_size     = (b5_cpx_pkt[`CPX_ATOMIC] & !b5_cpx_ctrue) ?
                                     8'b0 : b5_cpx_pkt[`CPX_VACK_BMASK];

  assign b5_stc_inv_vect = b5_cpx_pkt[`CPX_VACK_VECT];
  assign b5_stc_suppress = (b5_cpx_pa[39:32]==`IO_ASI_ADDR);

  // SPC bench - all L2 accesses are hits because this is used to 
  //   determine whether Block Init St will initialize cache line or not
  //   if l2hit, then memory model doesn't initialize cache line
  //   in SPC bench, cache line is never initialized by CCX stub.
  assign b5_stc_l2hit    = 1'b1;
         
  `endif
`endif

`ifdef NO_L2_BNK6
`else
  `ifdef NOL2RTL

  //----------------------------------------------------------
  // Signals for L2 Stub Bank6

  wire             [145:0] b6_cpx_pkt;
  wire              [39:0] b6_cpx_pa;
  wire               [2:0] b6_cpx_cid;
  wire               [2:0] b6_cpx_tid;
  wire               [5:0] b6_cpx_tnum;
  wire                     b6_cpx_ctrue;
  wire                     b6_cpx_swap;
  wire                     b6_cpx_valid;

  // b6_cpx_swap is required for the L2 Stub to work properly on Swap/Ldstub.
  // Swap/Ldstub have 1 PCX but 2 CPX packets.
  // The L2 Stub processes the 2 CPX packets in 0 time when it accesses memory.
  // When probing L2 stub, ldst_sync must know to send out a LDDATA and STCOMMIT message
  //     for the StAck of a Swap/Ldstub.
  // If StAck & cpx_swap==1, then send LDDATA & STCOMMIT.

  assign  b6_cpx_pkt   = `TOP.b6_cpx_pkt;
  assign  b6_cpx_pa    = `TOP.b6_cpx_pa;
  assign  b6_cpx_cid   = `TOP.b6_cpx_cid;
  assign  b6_cpx_tid   = b6_cpx_pkt[`CPX_TID];
  assign  b6_cpx_tnum  = {b6_cpx_cid,b6_cpx_tid};
  assign  b6_cpx_ctrue = `TOP.b6_cpx_ctrue;     // ctrue = compare true for CAS
  assign  b6_cpx_swap  = `TOP.b6_cpx_swap;      // swap = St Ack is from a Swap
  assign  b6_cpx_valid = b6_cpx_pkt[`CPX_VALID];

  //---------------------
  // Evict

  reg               [31:0] b6_ev_vect0;
  reg               [23:0] b6_ev_vect1;
  reg               [31:0] b6_ev_vect2;
  reg               [23:0] b6_ev_vect3;
  reg                [1:0] b6_pa54;
  reg               [31:0] b6_inv_vect [0:3];
  reg               [39:0] b6_evict_pa;
  wire              [39:0] b6_ev_pa;
  reg               [31:0] b6_evict_inv_vect;

  wire                     b6_evict;
  wire             [111:0] b6_ev_invvect;

  assign b6_evict         =  b6_cpx_valid & 
                                 (b6_cpx_pkt[`CPX_RTNTYP]== `CCX_RESP_EVICT);
  assign b6_ev_invvect    =  b6_cpx_pkt[`CPX_VINV_VECT];
  assign b6_ev_pa         = b6_cpx_pa;

  //---------------------
  // Load Data (miss only) (See ldst_lsu.v for Load Data - hit)

  wire                     b6_load_data_miss;
  wire                     b6_ldd_suppress;

  // Special case for L2 Stub - if StAck & swap, then send LDDATA

  assign b6_load_data_miss =  b6_cpx_valid & 
                                    ((((b6_cpx_pkt[`CPX_RTNTYP]== `CCX_RESP_LD)||
                                      (b6_cpx_pkt[`CPX_RTNTYP]== `CCX_RESP_NCU_LD)) & 
                                      (b6_cpx_pkt[`CPX_PF]==1'b0)) ||
                                     ((b6_cpx_pkt[`CPX_RTNTYP]== `CCX_RESP_ST) &
                                      (b6_cpx_swap==1'b1)));

  assign b6_ldd_suppress = (b6_cpx_pa[39:32]==`IO_ASI_ADDR);

  //---------------------
  // Store L2 Commit

  wire                       b6_store_commit;
  wire                 [7:0] b6_stc_size;
  wire                [31:0] b6_stc_inv_vect;
  reg                 [31:0] b6_stc_vect;
  wire                       b6_stc_l2hit;
  wire                       b6_stc_suppress;

    // rtntyp covers ST, CAS, SWAP since same decode
    //    but not Dcache Inval Ack (same rtntyp as ST Ack)
  assign b6_store_commit =  b6_cpx_valid & 
                                (b6_cpx_pkt[`CPX_RTNTYP]== `CCX_RESP_ST) &
                                (b6_cpx_pkt[`CPX_VACK_INVAL]==2'b0);
  // Set size=0 if CAS store didn't happen
  assign b6_stc_size     = (b6_cpx_pkt[`CPX_ATOMIC] & !b6_cpx_ctrue) ?
                                     8'b0 : b6_cpx_pkt[`CPX_VACK_BMASK];

  assign b6_stc_inv_vect = b6_cpx_pkt[`CPX_VACK_VECT];
  assign b6_stc_suppress = (b6_cpx_pa[39:32]==`IO_ASI_ADDR);

  // SPC bench - all L2 accesses are hits because this is used to 
  //   determine whether Block Init St will initialize cache line or not
  //   if l2hit, then memory model doesn't initialize cache line
  //   in SPC bench, cache line is never initialized by CCX stub.
  assign b6_stc_l2hit    = 1'b1;
         
  `endif
`endif

`ifdef NO_L2_BNK7
`else
  `ifdef NOL2RTL

  //----------------------------------------------------------
  // Signals for L2 Stub Bank7

  wire             [145:0] b7_cpx_pkt;
  wire              [39:0] b7_cpx_pa;
  wire               [2:0] b7_cpx_cid;
  wire               [2:0] b7_cpx_tid;
  wire               [5:0] b7_cpx_tnum;
  wire                     b7_cpx_ctrue;
  wire                     b7_cpx_swap;
  wire                     b7_cpx_valid;

  // b7_cpx_swap is required for the L2 Stub to work properly on Swap/Ldstub.
  // Swap/Ldstub have 1 PCX but 2 CPX packets.
  // The L2 Stub processes the 2 CPX packets in 0 time when it accesses memory.
  // When probing L2 stub, ldst_sync must know to send out a LDDATA and STCOMMIT message
  //     for the StAck of a Swap/Ldstub.
  // If StAck & cpx_swap==1, then send LDDATA & STCOMMIT.

  assign  b7_cpx_pkt   = `TOP.b7_cpx_pkt;
  assign  b7_cpx_pa    = `TOP.b7_cpx_pa;
  assign  b7_cpx_cid   = `TOP.b7_cpx_cid;
  assign  b7_cpx_tid   = b7_cpx_pkt[`CPX_TID];
  assign  b7_cpx_tnum  = {b7_cpx_cid,b7_cpx_tid};
  assign  b7_cpx_ctrue = `TOP.b7_cpx_ctrue;     // ctrue = compare true for CAS
  assign  b7_cpx_swap  = `TOP.b7_cpx_swap;      // swap = St Ack is from a Swap
  assign  b7_cpx_valid = b7_cpx_pkt[`CPX_VALID];

  //---------------------
  // Evict

  reg               [31:0] b7_ev_vect0;
  reg               [23:0] b7_ev_vect1;
  reg               [31:0] b7_ev_vect2;
  reg               [23:0] b7_ev_vect3;
  reg                [1:0] b7_pa54;
  reg               [31:0] b7_inv_vect [0:3];
  reg               [39:0] b7_evict_pa;
  wire              [39:0] b7_ev_pa;
  reg               [31:0] b7_evict_inv_vect;

  wire                     b7_evict;
  wire             [111:0] b7_ev_invvect;

  assign b7_evict         =  b7_cpx_valid & 
                                 (b7_cpx_pkt[`CPX_RTNTYP]== `CCX_RESP_EVICT);
  assign b7_ev_invvect    =  b7_cpx_pkt[`CPX_VINV_VECT];
  assign b7_ev_pa         = b7_cpx_pa;

  //---------------------
  // Load Data (miss only) (See ldst_lsu.v for Load Data - hit)

  wire                     b7_load_data_miss;
  wire                     b7_ldd_suppress;

  // Special case for L2 Stub - if StAck & swap, then send LDDATA

  assign b7_load_data_miss =  b7_cpx_valid & 
                                    ((((b7_cpx_pkt[`CPX_RTNTYP]== `CCX_RESP_LD)||
                                      (b7_cpx_pkt[`CPX_RTNTYP]== `CCX_RESP_NCU_LD)) & 
                                      (b7_cpx_pkt[`CPX_PF]==1'b0)) ||
                                     ((b7_cpx_pkt[`CPX_RTNTYP]== `CCX_RESP_ST) &
                                      (b7_cpx_swap==1'b1)));

  assign b7_ldd_suppress = (b7_cpx_pa[39:32]==`IO_ASI_ADDR);

  //---------------------
  // Store L2 Commit

  wire                       b7_store_commit;
  wire                 [7:0] b7_stc_size;
  wire                [31:0] b7_stc_inv_vect;
  reg                 [31:0] b7_stc_vect;
  wire                       b7_stc_l2hit;
  wire                       b7_stc_suppress;

    // rtntyp covers ST, CAS, SWAP since same decode
    //    but not Dcache Inval Ack (same rtntyp as ST Ack)
  assign b7_store_commit =  b7_cpx_valid & 
                                (b7_cpx_pkt[`CPX_RTNTYP]== `CCX_RESP_ST) &
                                (b7_cpx_pkt[`CPX_VACK_INVAL]==2'b0);
  // Set size=0 if CAS store didn't happen
  assign b7_stc_size     = (b7_cpx_pkt[`CPX_ATOMIC] & !b7_cpx_ctrue) ?
                                     8'b0 : b7_cpx_pkt[`CPX_VACK_BMASK];

  assign b7_stc_inv_vect = b7_cpx_pkt[`CPX_VACK_VECT];
  assign b7_stc_suppress = (b7_cpx_pa[39:32]==`IO_ASI_ADDR);

  // SPC bench - all L2 accesses are hits because this is used to 
  //   determine whether Block Init St will initialize cache line or not
  //   if l2hit, then memory model doesn't initialize cache line
  //   in SPC bench, cache line is never initialized by CCX stub.
  assign b7_stc_l2hit    = 1'b1;
         
  `endif
`endif

`ifdef NO_L2_BNK8
`else
  `ifdef NCURTL
    //----------------------------------------------------------
    // Signals for NCU RTL Bank8

  //wire             [145:0] b8_cpx_pkt;  // Unused for NCU since ldst_ncu probes the packets
  wire              [39:0] b8_cpx_pa;
  wire               [2:0] b8_cpx_cid;
  wire               [2:0] b8_cpx_tid;
  wire               [5:0] b8_cpx_tnum;
  wire                     b8_cpx_ctrue;
  wire                     b8_cpx_swap;
  wire                     b8_cpx_valid;

  assign  b8_cpx_pa    = `LDST_NCU.ncu_cpx_pa;
  assign  b8_cpx_cid   = `LDST_NCU.ncu_cpx_cid;
  assign  b8_cpx_tid   = `LDST_NCU.ncu_cpx_tid;
  assign  b8_cpx_tnum  = {b8_cpx_cid,b8_cpx_tid};
  assign  b8_cpx_ctrue = 1'b0;            // CAS,SWAP never sent to NCU
  assign  b8_cpx_swap  = 1'b0;            // CAS,SWAP never sent to NCU
  assign  b8_cpx_valid = `LDST_NCU.ncu_cpx_valid;

  //---------------------
  // Evict

  reg               [31:0] b8_ev_vect0;
  reg               [23:0] b8_ev_vect1;
  reg               [31:0] b8_ev_vect2;
  reg               [23:0] b8_ev_vect3;
  reg                [1:0] b8_pa54;
  reg               [31:0] b8_inv_vect [0:3];
  reg               [39:0] b8_evict_pa;
  wire              [39:0] b8_ev_pa;
  reg               [31:0] b8_evict_inv_vect;

  wire                     b8_evict;
  wire             [111:0] b8_ev_invvect;

  // Note: NCU cannot send evictions

  assign b8_evict         = 0;
  assign b8_ev_invvect    = 0;
  assign b8_ev_pa         = 0;

  //---------------------
  // Load Data (miss only) (See ldst_lsu.v for Load Data - hit)

  wire                     b8_load_data_miss;
  wire                     b8_ldd_suppress;

  // Note: CAS,SWAP never sent to NCU
  // Note: all LD/ST have nc=1

  assign b8_load_data_miss =  `LDST_NCU.ncu_cpx_valid & 
                                    (`LDST_NCU.ncu_cpx_typ==`CCX_REQ_LD);  // Warning - must use PCX/REQ define!

  assign b8_ldd_suppress = (`LDST_NCU.ncu_cpx_pa[39:32]==`IO_ASI_ADDR);

  //---------------------
  // Store L2 Commit

  wire                       b8_store_commit;
  wire                 [7:0] b8_stc_size;
  wire                [31:0] b8_stc_inv_vect;
  reg                 [31:0] b8_stc_vect;  // 32 bits to support 32 cores (for future chips)
  wire                       b8_stc_l2hit;
  wire                       b8_stc_suppress;

  // Note: CAS,SWAP never sent to NCU
  // Note: all LD/ST have nc=1

  assign b8_store_commit = `LDST_NCU.ncu_cpx_valid & 
                                (`LDST_NCU.ncu_cpx_typ==`CCX_REQ_ST);  // Warning - must use PCX/REQ define!

  assign b8_stc_size     = `LDST_NCU.ncu_cpx_bmask;

  assign b8_stc_inv_vect = 0;
  assign b8_stc_suppress = (`LDST_NCU.ncu_cpx_pa[39:32]==`IO_ASI_ADDR);

  // SPC bench - all L2 accesses are hits because this is used to 
  //   determine whether Block Init St will initialize cache line or not
  //   if l2hit, then memory model doesn't initialize cache line
  //   in SPC bench, cache line is never initialized by CCX stub.
  assign b8_stc_l2hit    = 1'b1;

  `else

  //----------------------------------------------------------
  // Signals for NCU Stub Bank8

  //----------------------------------------------------------
  // Signals for L2 Stub Bank8

  wire             [145:0] b8_cpx_pkt;
  wire              [39:0] b8_cpx_pa;
  wire               [2:0] b8_cpx_cid;
  wire               [2:0] b8_cpx_tid;
  wire               [5:0] b8_cpx_tnum;
  wire                     b8_cpx_ctrue;
  wire                     b8_cpx_swap;
  wire                     b8_cpx_valid;

  // b8_cpx_swap is required for the L2 Stub to work properly on Swap/Ldstub.
  // Swap/Ldstub have 1 PCX but 2 CPX packets.
  // The L2 Stub processes the 2 CPX packets in 0 time when it accesses memory.
  // When probing L2 stub, ldst_sync must know to send out a LDDATA and STCOMMIT message
  //     for the StAck of a Swap/Ldstub.
  // If StAck & cpx_swap==1, then send LDDATA & STCOMMIT.

  assign  b8_cpx_pkt   = `TOP.b8_cpx_pkt;
  assign  b8_cpx_pa    = `TOP.b8_cpx_pa;
  assign  b8_cpx_cid   = `TOP.b8_cpx_cid;
  assign  b8_cpx_tid   = b8_cpx_pkt[`CPX_TID];
  assign  b8_cpx_tnum  = {b8_cpx_cid,b8_cpx_tid};
  assign  b8_cpx_ctrue = `TOP.b8_cpx_ctrue;     // ctrue = compare true for CAS
  assign  b8_cpx_swap  = `TOP.b8_cpx_swap;      // swap = St Ack is from a Swap
  assign  b8_cpx_valid = b8_cpx_pkt[`CPX_VALID];

  //---------------------
  // Evict

  reg               [31:0] b8_ev_vect0;
  reg               [23:0] b8_ev_vect1;
  reg               [31:0] b8_ev_vect2;
  reg               [23:0] b8_ev_vect3;
  reg                [1:0] b8_pa54;
  reg               [31:0] b8_inv_vect [0:3];
  reg               [39:0] b8_evict_pa;
  wire              [39:0] b8_ev_pa;
  reg               [31:0] b8_evict_inv_vect;

  wire                     b8_evict;
  wire             [111:0] b8_ev_invvect;

  assign b8_evict         =  b8_cpx_valid & 
                                 (b8_cpx_pkt[`CPX_RTNTYP]== `CCX_RESP_EVICT);
  assign b8_ev_invvect    =  b8_cpx_pkt[`CPX_VINV_VECT];
  assign b8_ev_pa         = b8_cpx_pa;

  //---------------------
  // Load Data (miss only) (See ldst_lsu.v for Load Data - hit)

  wire                     b8_load_data_miss;
  wire                     b8_ldd_suppress;

  // Special case for L2 Stub - if StAck & swap, then send LDDATA

  assign b8_load_data_miss =  b8_cpx_valid & 
                                    ((((b8_cpx_pkt[`CPX_RTNTYP]== `CCX_RESP_LD)||
                                      (b8_cpx_pkt[`CPX_RTNTYP]== `CCX_RESP_NCU_LD)) & 
                                      (b8_cpx_pkt[`CPX_PF]==1'b0)) ||
                                     ((b8_cpx_pkt[`CPX_RTNTYP]== `CCX_RESP_ST) &
                                      (b8_cpx_swap==1'b1)));

  assign b8_ldd_suppress = (b8_cpx_pa[39:32]==`IO_ASI_ADDR);

  //---------------------
  // Store L2 Commit

  wire                       b8_store_commit;
  wire                 [7:0] b8_stc_size;
  wire                [31:0] b8_stc_inv_vect;
  reg                 [31:0] b8_stc_vect;
  wire                       b8_stc_l2hit;
  wire                       b8_stc_suppress;

    // rtntyp covers ST, CAS, SWAP since same decode
    //    but not Dcache Inval Ack (same rtntyp as ST Ack)
  assign b8_store_commit =  b8_cpx_valid & 
                                (b8_cpx_pkt[`CPX_RTNTYP]== `CCX_RESP_ST) &
                                (b8_cpx_pkt[`CPX_VACK_INVAL]==2'b0);
  // Set size=0 if CAS store didn't happen
  assign b8_stc_size     = (b8_cpx_pkt[`CPX_ATOMIC] & !b8_cpx_ctrue) ?
                                     8'b0 : b8_cpx_pkt[`CPX_VACK_BMASK];

  assign b8_stc_inv_vect = b8_cpx_pkt[`CPX_VACK_VECT];
  assign b8_stc_suppress = (b8_cpx_pa[39:32]==`IO_ASI_ADDR);

  // SPC bench - all L2 accesses are hits because this is used to 
  //   determine whether Block Init St will initialize cache line or not
  //   if l2hit, then memory model doesn't initialize cache line
  //   in SPC bench, cache line is never initialized by CCX stub.
  assign b8_stc_l2hit    = 1'b1;
         
  `endif
`endif

//==========================================================
//==========================================================
// L2 RTL Probes

`ifdef NO_L2_BNK0
`else
  `ifdef NOL2RTL
  `else

  //----------------------------------------------------------
  // Signals for L2 RTL Bank0

  wire                 [2:0] b0_cpx_cid_c8;
  reg                  [2:0] b0_cpx_cid_c9;
  wire                 [2:0] b0_cpx_cid;
  wire               [145:0] b0_cpx_pkt_c8;
  wire                [39:0] b0_pa_c8;
  reg                 [39:0] b0_pa_c9;
  wire                [39:0] b0_cpx_pa;
  wire                [39:0] b0_ev_pa_c4;
  reg                 [39:0] b0_ev_pa_c5;
  reg                 [39:0] b0_ev_pa_c52;
  reg                 [39:0] b0_ev_pa_c6;
  reg                 [39:0] b0_ev_pa_c7;
  reg                 [39:0] b0_ev_pa_c8;
  wire                [39:0] b0_ev_pa;
  wire                       b0_req_c6;
  reg                        b0_req_c7;
  reg                        b0_req_c8;
  wire                       b0_cpx_valid;
  wire                       b0_cpx_pf;
  wire                 [3:0] b0_cpx_rtntyp;
  wire                 [2:0] b0_cpx_tid;
  wire                 [5:0] b0_cpx_tnum;
  wire                [39:0] b0_stall_c1;
  reg                 [39:0] b0_stall_c2;
  reg                 [39:0] b0_stall_c3;
  reg                 [39:0] b0_stall_c4;
  reg                 [39:0] b0_stall_c5;
  reg                 [39:0] b0_stall_c52;
  reg                 [39:0] b0_stall_c6;
  reg                 [39:0] b0_stall_c7;
  reg                 [39:0] b0_stall_c8;
  reg                 [39:0] b0_stall_c9;

  assign b0_cpx_cid_c8 = `CPU.l2t0.oque.inst_cpuid_c8;
  // When pipeline stalls, pa must be stalled, too.
  assign b0_cpx_cid    =  (b0_stall_c9) ? b0_cpx_cid_c9 : b0_cpx_cid_c8;
  assign b0_cpx_pkt_c8 = `CPU.l2t0.oque.oque_oq_array_data_in;
  assign b0_pa_c8      = `CPU.l2t0.arbadr.arbdp_addr_c8;
  // When pipeline stalls, pa must be stalled, too.
  assign b0_cpx_pa     =  (b0_stall_c9) ? b0_pa_c9 : b0_pa_c8;
  assign b0_ev_pa_c4   = `CPU.l2t0.evctag.evctag_wb_write_addr;
  assign b0_ev_pa      = b0_ev_pa_c8;
  assign b0_req_c6     = |(`CPU.l2t0.oqu.req_out_c6);
  assign b0_cpx_tnum   = {b0_cpx_cid,b0_cpx_tid};
  assign b0_cpx_tid    = b0_cpx_pkt_c8[`CPX_TID];
  assign b0_cpx_valid  = b0_cpx_pkt_c8[`CPX_VALID];
  assign b0_cpx_pf     = b0_cpx_pkt_c8[`CPX_PF];
  assign b0_cpx_rtntyp = b0_cpx_pkt_c8[`CPX_RTNTYP];
  // arb_inst_diag_c1 is asserted for LD/ST to L2 CSR registers which causes pipeline stall
  assign b0_stall_c1   = `CPU.l2t0.arb.arb_inst_diag_c1;

  //---------------------
  // Load Data

  wire                       b0_load_data_miss;
  wire                       b0_ldd_suppress;

  assign b0_load_data_miss = b0_req_c8 && 
                                  (b0_cpx_valid==1'b1) && 
                                  ((b0_cpx_rtntyp==`CCX_RESP_LD)||
                                   (b0_cpx_rtntyp==`CCX_RESP_NCU_LD)) && 
                                  (b0_cpx_pf==1'b0);
  assign b0_ldd_suppress = (b0_cpx_pa[39:32]==`IO_ASI_ADDR);

  //---------------------
  // Store L2 Commit

  wire                       b0_store_commit;
  wire                       b0_stc_suppress;
  wire                 [7:0] b0_stc_size;
  wire                [31:0] b0_stc_inv_vect;
  reg                 [31:0] b0_stc_vect;
  wire                       b0_stc_atomic;
  wire                       b0_l2_ctrue_c3; 
  reg                        b0_l2_ctrue_c4; 
  reg                        b0_l2_ctrue_c5; 
  reg                        b0_l2_ctrue_c52; 
  reg                        b0_l2_ctrue_c6; 
  reg                        b0_l2_ctrue_c7; 
  reg                        b0_l2_ctrue_c8; 
  wire                       b0_stc_l2hit;
  wire                       b0_stc_l2hit_c3;
  reg                        b0_stc_l2hit_c4;
  reg                        b0_stc_l2hit_c5;
  reg                        b0_stc_l2hit_c52;
  reg                        b0_stc_l2hit_c6;
  reg                        b0_stc_l2hit_c7;
  reg                        b0_stc_l2hit_c8;
  wire                       b0_cam_pa_match_c1;
  wire                       b0_csr_l2_bypass_mode_on;
  reg                        b0_cam_pa_match_c2;
  reg                        b0_cam_pa_match_c3;

    // rtntyp covers ST, CAS, SWAP since same decode
    //    but not Dcache Inval Ack (same rtntyp as ST Ack)
  assign b0_store_commit = b0_req_c8 && 
                                (b0_cpx_valid==1'b1) && 
                                (b0_cpx_rtntyp==`CCX_RESP_ST) &
                                (b0_cpx_pkt_c8[`CPX_VACK_INVAL]==2'b0);
  assign b0_stc_suppress = (b0_cpx_pa[39:32]==`IO_ASI_ADDR);
  assign b0_stc_inv_vect = b0_cpx_pkt_c8[`CPX_VACK_VECT];
  assign b0_stc_atomic   = b0_cpx_pkt_c8[`CPX_ATOMIC];

  assign b0_stc_size     = (b0_stc_atomic & !b0_l2_ctrue_c8) ?    // ctrue = compare true for CAS
                                    8'b0 : b0_cpx_pkt_c8[`CPX_VACK_BMASK];
  assign b0_l2_ctrue_c3  = `CPU.l2t0.arbdec.arbdp_inst_c3[37];  // `L2_CTRUE = 37
  assign b0_csr_l2_bypass_mode_on  = `CPU.l2t0.csr_l2_bypass_mode_on;  // l2 off mode
  assign b0_cam_pa_match_c1 = (|(`CPU.l2t0.misbuf.mb_cam_match | {32{`CPU.l2t0.misbuf.arbadr_arbdp_addr_c1c3comp_c1}} 
                                                                         | {32{`CPU.l2t0.misbuf.arbadr_arbdp_addr_c1c2comp_c1}}));
  assign b0_stc_l2hit_c3 =	 {32{`CPU.l2t0.misbuf.l2_dir_map_on_d1}} ?   // if l2 directmap on 
                                 ((`CPU.l2t0.tagctl.tag_hit_l2orfb_c3 & !(b0_csr_l2_bypass_mode_on)) ||      // select the equaltion with cam_pa_match_c3
                                 (`CPU.l2t0.misbuf.misbuf_hit_c3 & b0_cam_pa_match_c3 & !(b0_csr_l2_bypass_mode_on)))
								 :
								 ((`CPU.l2t0.tagctl.tag_hit_l2orfb_c3 & !(b0_csr_l2_bypass_mode_on))||     // else select the equaltion witout cam_pa_match_c3
								 (`CPU.l2t0.misbuf.misbuf_hit_c3 & !(b0_csr_l2_bypass_mode_on)))
								 ;
  assign b0_stc_l2hit    = b0_stc_l2hit_c8;

  //---------------------
  // Evict

  reg               [31:0] b0_ev_vect0;
  reg               [23:0] b0_ev_vect1;
  reg               [31:0] b0_ev_vect2;
  reg               [23:0] b0_ev_vect3;
  reg                [1:0] b0_pa54;
  reg               [31:0] b0_inv_vect [0:3];
  reg               [39:0] b0_evict_pa;
  reg               [31:0] b0_evict_inv_vect;

  wire                     b0_evict;
  wire             [111:0] b0_ev_invvect;

  assign b0_evict       = b0_req_c8 && 
                               (b0_cpx_valid==1'b1) && 
                               (b0_cpx_rtntyp==`CCX_RESP_EVICT);
  assign b0_ev_invvect  = b0_cpx_pkt_c8[`CPX_VINV_VECT];

  `endif
`endif

`ifdef NO_L2_BNK1
`else
  `ifdef NOL2RTL
  `else

  //----------------------------------------------------------
  // Signals for L2 RTL Bank1

  wire                 [2:0] b1_cpx_cid_c8;
  reg                  [2:0] b1_cpx_cid_c9;
  wire                 [2:0] b1_cpx_cid;
  wire               [145:0] b1_cpx_pkt_c8;
  wire                [39:0] b1_pa_c8;
  reg                 [39:0] b1_pa_c9;
  wire                [39:0] b1_cpx_pa;
  wire                [39:0] b1_ev_pa_c4;
  reg                 [39:0] b1_ev_pa_c5;
  reg                 [39:0] b1_ev_pa_c52;
  reg                 [39:0] b1_ev_pa_c6;
  reg                 [39:0] b1_ev_pa_c7;
  reg                 [39:0] b1_ev_pa_c8;
  wire                [39:0] b1_ev_pa;
  wire                       b1_req_c6;
  reg                        b1_req_c7;
  reg                        b1_req_c8;
  wire                       b1_cpx_valid;
  wire                       b1_cpx_pf;
  wire                 [3:0] b1_cpx_rtntyp;
  wire                 [2:0] b1_cpx_tid;
  wire                 [5:0] b1_cpx_tnum;
  wire                [39:0] b1_stall_c1;
  reg                 [39:0] b1_stall_c2;
  reg                 [39:0] b1_stall_c3;
  reg                 [39:0] b1_stall_c4;
  reg                 [39:0] b1_stall_c5;
  reg                 [39:0] b1_stall_c52;
  reg                 [39:0] b1_stall_c6;
  reg                 [39:0] b1_stall_c7;
  reg                 [39:0] b1_stall_c8;
  reg                 [39:0] b1_stall_c9;

  assign b1_cpx_cid_c8 = `CPU.l2t1.oque.inst_cpuid_c8;
  // When pipeline stalls, pa must be stalled, too.
  assign b1_cpx_cid    =  (b1_stall_c9) ? b1_cpx_cid_c9 : b1_cpx_cid_c8;
  assign b1_cpx_pkt_c8 = `CPU.l2t1.oque.oque_oq_array_data_in;
  assign b1_pa_c8      = `CPU.l2t1.arbadr.arbdp_addr_c8;
  // When pipeline stalls, pa must be stalled, too.
  assign b1_cpx_pa     =  (b1_stall_c9) ? b1_pa_c9 : b1_pa_c8;
  assign b1_ev_pa_c4   = `CPU.l2t1.evctag.evctag_wb_write_addr;
  assign b1_ev_pa      = b1_ev_pa_c8;
  assign b1_req_c6     = |(`CPU.l2t1.oqu.req_out_c6);
  assign b1_cpx_tnum   = {b1_cpx_cid,b1_cpx_tid};
  assign b1_cpx_tid    = b1_cpx_pkt_c8[`CPX_TID];
  assign b1_cpx_valid  = b1_cpx_pkt_c8[`CPX_VALID];
  assign b1_cpx_pf     = b1_cpx_pkt_c8[`CPX_PF];
  assign b1_cpx_rtntyp = b1_cpx_pkt_c8[`CPX_RTNTYP];
  // arb_inst_diag_c1 is asserted for LD/ST to L2 CSR registers which causes pipeline stall
  assign b1_stall_c1   = `CPU.l2t1.arb.arb_inst_diag_c1;

  //---------------------
  // Load Data

  wire                       b1_load_data_miss;
  wire                       b1_ldd_suppress;

  assign b1_load_data_miss = b1_req_c8 && 
                                  (b1_cpx_valid==1'b1) && 
                                  ((b1_cpx_rtntyp==`CCX_RESP_LD)||
                                   (b1_cpx_rtntyp==`CCX_RESP_NCU_LD)) && 
                                  (b1_cpx_pf==1'b0);
  assign b1_ldd_suppress = (b1_cpx_pa[39:32]==`IO_ASI_ADDR);

  //---------------------
  // Store L2 Commit

  wire                       b1_store_commit;
  wire                       b1_stc_suppress;
  wire                 [7:0] b1_stc_size;
  wire                [31:0] b1_stc_inv_vect;
  reg                 [31:0] b1_stc_vect;
  wire                       b1_stc_atomic;
  wire                       b1_l2_ctrue_c3; 
  reg                        b1_l2_ctrue_c4; 
  reg                        b1_l2_ctrue_c5; 
  reg                        b1_l2_ctrue_c52; 
  reg                        b1_l2_ctrue_c6; 
  reg                        b1_l2_ctrue_c7; 
  reg                        b1_l2_ctrue_c8; 
  wire                       b1_stc_l2hit;
  wire                       b1_stc_l2hit_c3;
  reg                        b1_stc_l2hit_c4;
  reg                        b1_stc_l2hit_c5;
  reg                        b1_stc_l2hit_c52;
  reg                        b1_stc_l2hit_c6;
  reg                        b1_stc_l2hit_c7;
  reg                        b1_stc_l2hit_c8;
  wire                       b1_cam_pa_match_c1;
  wire                       b1_csr_l2_bypass_mode_on;
  reg                        b1_cam_pa_match_c2;
  reg                        b1_cam_pa_match_c3;

    // rtntyp covers ST, CAS, SWAP since same decode
    //    but not Dcache Inval Ack (same rtntyp as ST Ack)
  assign b1_store_commit = b1_req_c8 && 
                                (b1_cpx_valid==1'b1) && 
                                (b1_cpx_rtntyp==`CCX_RESP_ST) &
                                (b1_cpx_pkt_c8[`CPX_VACK_INVAL]==2'b0);
  assign b1_stc_suppress = (b1_cpx_pa[39:32]==`IO_ASI_ADDR);
  assign b1_stc_inv_vect = b1_cpx_pkt_c8[`CPX_VACK_VECT];
  assign b1_stc_atomic   = b1_cpx_pkt_c8[`CPX_ATOMIC];

  assign b1_stc_size     = (b1_stc_atomic & !b1_l2_ctrue_c8) ?    // ctrue = compare true for CAS
                                    8'b0 : b1_cpx_pkt_c8[`CPX_VACK_BMASK];
  assign b1_l2_ctrue_c3  = `CPU.l2t1.arbdec.arbdp_inst_c3[37];  // `L2_CTRUE = 37
  assign b1_csr_l2_bypass_mode_on  = `CPU.l2t1.csr_l2_bypass_mode_on;  // l2 off mode
  assign b1_cam_pa_match_c1 = (|(`CPU.l2t1.misbuf.mb_cam_match | {32{`CPU.l2t1.misbuf.arbadr_arbdp_addr_c1c3comp_c1}} 
                                                                         | {32{`CPU.l2t1.misbuf.arbadr_arbdp_addr_c1c2comp_c1}}));
  assign b1_stc_l2hit_c3 =	 {32{`CPU.l2t1.misbuf.l2_dir_map_on_d1}} ?   // if l2 directmap on 
                                 ((`CPU.l2t1.tagctl.tag_hit_l2orfb_c3 & !(b1_csr_l2_bypass_mode_on)) ||      // select the equaltion with cam_pa_match_c3
                                 (`CPU.l2t1.misbuf.misbuf_hit_c3 & b1_cam_pa_match_c3 & !(b1_csr_l2_bypass_mode_on)))
								 :
								 ((`CPU.l2t1.tagctl.tag_hit_l2orfb_c3 & !(b1_csr_l2_bypass_mode_on))||     // else select the equaltion witout cam_pa_match_c3
								 (`CPU.l2t1.misbuf.misbuf_hit_c3 & !(b1_csr_l2_bypass_mode_on)))
								 ;
  assign b1_stc_l2hit    = b1_stc_l2hit_c8;

  //---------------------
  // Evict

  reg               [31:0] b1_ev_vect0;
  reg               [23:0] b1_ev_vect1;
  reg               [31:0] b1_ev_vect2;
  reg               [23:0] b1_ev_vect3;
  reg                [1:0] b1_pa54;
  reg               [31:0] b1_inv_vect [0:3];
  reg               [39:0] b1_evict_pa;
  reg               [31:0] b1_evict_inv_vect;

  wire                     b1_evict;
  wire             [111:0] b1_ev_invvect;

  assign b1_evict       = b1_req_c8 && 
                               (b1_cpx_valid==1'b1) && 
                               (b1_cpx_rtntyp==`CCX_RESP_EVICT);
  assign b1_ev_invvect  = b1_cpx_pkt_c8[`CPX_VINV_VECT];

  `endif
`endif

`ifdef NO_L2_BNK2
`else
  `ifdef NOL2RTL
  `else

  //----------------------------------------------------------
  // Signals for L2 RTL Bank2

  wire                 [2:0] b2_cpx_cid_c8;
  reg                  [2:0] b2_cpx_cid_c9;
  wire                 [2:0] b2_cpx_cid;
  wire               [145:0] b2_cpx_pkt_c8;
  wire                [39:0] b2_pa_c8;
  reg                 [39:0] b2_pa_c9;
  wire                [39:0] b2_cpx_pa;
  wire                [39:0] b2_ev_pa_c4;
  reg                 [39:0] b2_ev_pa_c5;
  reg                 [39:0] b2_ev_pa_c52;
  reg                 [39:0] b2_ev_pa_c6;
  reg                 [39:0] b2_ev_pa_c7;
  reg                 [39:0] b2_ev_pa_c8;
  wire                [39:0] b2_ev_pa;
  wire                       b2_req_c6;
  reg                        b2_req_c7;
  reg                        b2_req_c8;
  wire                       b2_cpx_valid;
  wire                       b2_cpx_pf;
  wire                 [3:0] b2_cpx_rtntyp;
  wire                 [2:0] b2_cpx_tid;
  wire                 [5:0] b2_cpx_tnum;
  wire                [39:0] b2_stall_c1;
  reg                 [39:0] b2_stall_c2;
  reg                 [39:0] b2_stall_c3;
  reg                 [39:0] b2_stall_c4;
  reg                 [39:0] b2_stall_c5;
  reg                 [39:0] b2_stall_c52;
  reg                 [39:0] b2_stall_c6;
  reg                 [39:0] b2_stall_c7;
  reg                 [39:0] b2_stall_c8;
  reg                 [39:0] b2_stall_c9;

  assign b2_cpx_cid_c8 = `CPU.l2t2.oque.inst_cpuid_c8;
  // When pipeline stalls, pa must be stalled, too.
  assign b2_cpx_cid    =  (b2_stall_c9) ? b2_cpx_cid_c9 : b2_cpx_cid_c8;
  assign b2_cpx_pkt_c8 = `CPU.l2t2.oque.oque_oq_array_data_in;
  assign b2_pa_c8      = `CPU.l2t2.arbadr.arbdp_addr_c8;
  // When pipeline stalls, pa must be stalled, too.
  assign b2_cpx_pa     =  (b2_stall_c9) ? b2_pa_c9 : b2_pa_c8;
  assign b2_ev_pa_c4   = `CPU.l2t2.evctag.evctag_wb_write_addr;
  assign b2_ev_pa      = b2_ev_pa_c8;
  assign b2_req_c6     = |(`CPU.l2t2.oqu.req_out_c6);
  assign b2_cpx_tnum   = {b2_cpx_cid,b2_cpx_tid};
  assign b2_cpx_tid    = b2_cpx_pkt_c8[`CPX_TID];
  assign b2_cpx_valid  = b2_cpx_pkt_c8[`CPX_VALID];
  assign b2_cpx_pf     = b2_cpx_pkt_c8[`CPX_PF];
  assign b2_cpx_rtntyp = b2_cpx_pkt_c8[`CPX_RTNTYP];
  // arb_inst_diag_c1 is asserted for LD/ST to L2 CSR registers which causes pipeline stall
  assign b2_stall_c1   = `CPU.l2t2.arb.arb_inst_diag_c1;

  //---------------------
  // Load Data

  wire                       b2_load_data_miss;
  wire                       b2_ldd_suppress;

  assign b2_load_data_miss = b2_req_c8 && 
                                  (b2_cpx_valid==1'b1) && 
                                  ((b2_cpx_rtntyp==`CCX_RESP_LD)||
                                   (b2_cpx_rtntyp==`CCX_RESP_NCU_LD)) && 
                                  (b2_cpx_pf==1'b0);
  assign b2_ldd_suppress = (b2_cpx_pa[39:32]==`IO_ASI_ADDR);

  //---------------------
  // Store L2 Commit

  wire                       b2_store_commit;
  wire                       b2_stc_suppress;
  wire                 [7:0] b2_stc_size;
  wire                [31:0] b2_stc_inv_vect;
  reg                 [31:0] b2_stc_vect;
  wire                       b2_stc_atomic;
  wire                       b2_l2_ctrue_c3; 
  reg                        b2_l2_ctrue_c4; 
  reg                        b2_l2_ctrue_c5; 
  reg                        b2_l2_ctrue_c52; 
  reg                        b2_l2_ctrue_c6; 
  reg                        b2_l2_ctrue_c7; 
  reg                        b2_l2_ctrue_c8; 
  wire                       b2_stc_l2hit;
  wire                       b2_stc_l2hit_c3;
  reg                        b2_stc_l2hit_c4;
  reg                        b2_stc_l2hit_c5;
  reg                        b2_stc_l2hit_c52;
  reg                        b2_stc_l2hit_c6;
  reg                        b2_stc_l2hit_c7;
  reg                        b2_stc_l2hit_c8;
  wire                       b2_cam_pa_match_c1;
  wire                       b2_csr_l2_bypass_mode_on;
  reg                        b2_cam_pa_match_c2;
  reg                        b2_cam_pa_match_c3;

    // rtntyp covers ST, CAS, SWAP since same decode
    //    but not Dcache Inval Ack (same rtntyp as ST Ack)
  assign b2_store_commit = b2_req_c8 && 
                                (b2_cpx_valid==1'b1) && 
                                (b2_cpx_rtntyp==`CCX_RESP_ST) &
                                (b2_cpx_pkt_c8[`CPX_VACK_INVAL]==2'b0);
  assign b2_stc_suppress = (b2_cpx_pa[39:32]==`IO_ASI_ADDR);
  assign b2_stc_inv_vect = b2_cpx_pkt_c8[`CPX_VACK_VECT];
  assign b2_stc_atomic   = b2_cpx_pkt_c8[`CPX_ATOMIC];

  assign b2_stc_size     = (b2_stc_atomic & !b2_l2_ctrue_c8) ?    // ctrue = compare true for CAS
                                    8'b0 : b2_cpx_pkt_c8[`CPX_VACK_BMASK];
  assign b2_l2_ctrue_c3  = `CPU.l2t2.arbdec.arbdp_inst_c3[37];  // `L2_CTRUE = 37
  assign b2_csr_l2_bypass_mode_on  = `CPU.l2t2.csr_l2_bypass_mode_on;  // l2 off mode
  assign b2_cam_pa_match_c1 = (|(`CPU.l2t2.misbuf.mb_cam_match | {32{`CPU.l2t2.misbuf.arbadr_arbdp_addr_c1c3comp_c1}} 
                                                                         | {32{`CPU.l2t2.misbuf.arbadr_arbdp_addr_c1c2comp_c1}}));
  assign b2_stc_l2hit_c3 =	 {32{`CPU.l2t2.misbuf.l2_dir_map_on_d1}} ?   // if l2 directmap on 
                                 ((`CPU.l2t2.tagctl.tag_hit_l2orfb_c3 & !(b2_csr_l2_bypass_mode_on)) ||      // select the equaltion with cam_pa_match_c3
                                 (`CPU.l2t2.misbuf.misbuf_hit_c3 & b2_cam_pa_match_c3 & !(b2_csr_l2_bypass_mode_on)))
								 :
								 ((`CPU.l2t2.tagctl.tag_hit_l2orfb_c3 & !(b2_csr_l2_bypass_mode_on))||     // else select the equaltion witout cam_pa_match_c3
								 (`CPU.l2t2.misbuf.misbuf_hit_c3 & !(b2_csr_l2_bypass_mode_on)))
								 ;
  assign b2_stc_l2hit    = b2_stc_l2hit_c8;

  //---------------------
  // Evict

  reg               [31:0] b2_ev_vect0;
  reg               [23:0] b2_ev_vect1;
  reg               [31:0] b2_ev_vect2;
  reg               [23:0] b2_ev_vect3;
  reg                [1:0] b2_pa54;
  reg               [31:0] b2_inv_vect [0:3];
  reg               [39:0] b2_evict_pa;
  reg               [31:0] b2_evict_inv_vect;

  wire                     b2_evict;
  wire             [111:0] b2_ev_invvect;

  assign b2_evict       = b2_req_c8 && 
                               (b2_cpx_valid==1'b1) && 
                               (b2_cpx_rtntyp==`CCX_RESP_EVICT);
  assign b2_ev_invvect  = b2_cpx_pkt_c8[`CPX_VINV_VECT];

  `endif
`endif

`ifdef NO_L2_BNK3
`else
  `ifdef NOL2RTL
  `else

  //----------------------------------------------------------
  // Signals for L2 RTL Bank3

  wire                 [2:0] b3_cpx_cid_c8;
  reg                  [2:0] b3_cpx_cid_c9;
  wire                 [2:0] b3_cpx_cid;
  wire               [145:0] b3_cpx_pkt_c8;
  wire                [39:0] b3_pa_c8;
  reg                 [39:0] b3_pa_c9;
  wire                [39:0] b3_cpx_pa;
  wire                [39:0] b3_ev_pa_c4;
  reg                 [39:0] b3_ev_pa_c5;
  reg                 [39:0] b3_ev_pa_c52;
  reg                 [39:0] b3_ev_pa_c6;
  reg                 [39:0] b3_ev_pa_c7;
  reg                 [39:0] b3_ev_pa_c8;
  wire                [39:0] b3_ev_pa;
  wire                       b3_req_c6;
  reg                        b3_req_c7;
  reg                        b3_req_c8;
  wire                       b3_cpx_valid;
  wire                       b3_cpx_pf;
  wire                 [3:0] b3_cpx_rtntyp;
  wire                 [2:0] b3_cpx_tid;
  wire                 [5:0] b3_cpx_tnum;
  wire                [39:0] b3_stall_c1;
  reg                 [39:0] b3_stall_c2;
  reg                 [39:0] b3_stall_c3;
  reg                 [39:0] b3_stall_c4;
  reg                 [39:0] b3_stall_c5;
  reg                 [39:0] b3_stall_c52;
  reg                 [39:0] b3_stall_c6;
  reg                 [39:0] b3_stall_c7;
  reg                 [39:0] b3_stall_c8;
  reg                 [39:0] b3_stall_c9;

  assign b3_cpx_cid_c8 = `CPU.l2t3.oque.inst_cpuid_c8;
  // When pipeline stalls, pa must be stalled, too.
  assign b3_cpx_cid    =  (b3_stall_c9) ? b3_cpx_cid_c9 : b3_cpx_cid_c8;
  assign b3_cpx_pkt_c8 = `CPU.l2t3.oque.oque_oq_array_data_in;
  assign b3_pa_c8      = `CPU.l2t3.arbadr.arbdp_addr_c8;
  // When pipeline stalls, pa must be stalled, too.
  assign b3_cpx_pa     =  (b3_stall_c9) ? b3_pa_c9 : b3_pa_c8;
  assign b3_ev_pa_c4   = `CPU.l2t3.evctag.evctag_wb_write_addr;
  assign b3_ev_pa      = b3_ev_pa_c8;
  assign b3_req_c6     = |(`CPU.l2t3.oqu.req_out_c6);
  assign b3_cpx_tnum   = {b3_cpx_cid,b3_cpx_tid};
  assign b3_cpx_tid    = b3_cpx_pkt_c8[`CPX_TID];
  assign b3_cpx_valid  = b3_cpx_pkt_c8[`CPX_VALID];
  assign b3_cpx_pf     = b3_cpx_pkt_c8[`CPX_PF];
  assign b3_cpx_rtntyp = b3_cpx_pkt_c8[`CPX_RTNTYP];
  // arb_inst_diag_c1 is asserted for LD/ST to L2 CSR registers which causes pipeline stall
  assign b3_stall_c1   = `CPU.l2t3.arb.arb_inst_diag_c1;

  //---------------------
  // Load Data

  wire                       b3_load_data_miss;
  wire                       b3_ldd_suppress;

  assign b3_load_data_miss = b3_req_c8 && 
                                  (b3_cpx_valid==1'b1) && 
                                  ((b3_cpx_rtntyp==`CCX_RESP_LD)||
                                   (b3_cpx_rtntyp==`CCX_RESP_NCU_LD)) && 
                                  (b3_cpx_pf==1'b0);
  assign b3_ldd_suppress = (b3_cpx_pa[39:32]==`IO_ASI_ADDR);

  //---------------------
  // Store L2 Commit

  wire                       b3_store_commit;
  wire                       b3_stc_suppress;
  wire                 [7:0] b3_stc_size;
  wire                [31:0] b3_stc_inv_vect;
  reg                 [31:0] b3_stc_vect;
  wire                       b3_stc_atomic;
  wire                       b3_l2_ctrue_c3; 
  reg                        b3_l2_ctrue_c4; 
  reg                        b3_l2_ctrue_c5; 
  reg                        b3_l2_ctrue_c52; 
  reg                        b3_l2_ctrue_c6; 
  reg                        b3_l2_ctrue_c7; 
  reg                        b3_l2_ctrue_c8; 
  wire                       b3_stc_l2hit;
  wire                       b3_stc_l2hit_c3;
  reg                        b3_stc_l2hit_c4;
  reg                        b3_stc_l2hit_c5;
  reg                        b3_stc_l2hit_c52;
  reg                        b3_stc_l2hit_c6;
  reg                        b3_stc_l2hit_c7;
  reg                        b3_stc_l2hit_c8;
  wire                       b3_cam_pa_match_c1;
  wire                       b3_csr_l2_bypass_mode_on;
  reg                        b3_cam_pa_match_c2;
  reg                        b3_cam_pa_match_c3;

    // rtntyp covers ST, CAS, SWAP since same decode
    //    but not Dcache Inval Ack (same rtntyp as ST Ack)
  assign b3_store_commit = b3_req_c8 && 
                                (b3_cpx_valid==1'b1) && 
                                (b3_cpx_rtntyp==`CCX_RESP_ST) &
                                (b3_cpx_pkt_c8[`CPX_VACK_INVAL]==2'b0);
  assign b3_stc_suppress = (b3_cpx_pa[39:32]==`IO_ASI_ADDR);
  assign b3_stc_inv_vect = b3_cpx_pkt_c8[`CPX_VACK_VECT];
  assign b3_stc_atomic   = b3_cpx_pkt_c8[`CPX_ATOMIC];

  assign b3_stc_size     = (b3_stc_atomic & !b3_l2_ctrue_c8) ?    // ctrue = compare true for CAS
                                    8'b0 : b3_cpx_pkt_c8[`CPX_VACK_BMASK];
  assign b3_l2_ctrue_c3  = `CPU.l2t3.arbdec.arbdp_inst_c3[37];  // `L2_CTRUE = 37
  assign b3_csr_l2_bypass_mode_on  = `CPU.l2t3.csr_l2_bypass_mode_on;  // l2 off mode
  assign b3_cam_pa_match_c1 = (|(`CPU.l2t3.misbuf.mb_cam_match | {32{`CPU.l2t3.misbuf.arbadr_arbdp_addr_c1c3comp_c1}} 
                                                                         | {32{`CPU.l2t3.misbuf.arbadr_arbdp_addr_c1c2comp_c1}}));
  assign b3_stc_l2hit_c3 =	 {32{`CPU.l2t3.misbuf.l2_dir_map_on_d1}} ?   // if l2 directmap on 
                                 ((`CPU.l2t3.tagctl.tag_hit_l2orfb_c3 & !(b3_csr_l2_bypass_mode_on)) ||      // select the equaltion with cam_pa_match_c3
                                 (`CPU.l2t3.misbuf.misbuf_hit_c3 & b3_cam_pa_match_c3 & !(b3_csr_l2_bypass_mode_on)))
								 :
								 ((`CPU.l2t3.tagctl.tag_hit_l2orfb_c3 & !(b3_csr_l2_bypass_mode_on))||     // else select the equaltion witout cam_pa_match_c3
								 (`CPU.l2t3.misbuf.misbuf_hit_c3 & !(b3_csr_l2_bypass_mode_on)))
								 ;
  assign b3_stc_l2hit    = b3_stc_l2hit_c8;

  //---------------------
  // Evict

  reg               [31:0] b3_ev_vect0;
  reg               [23:0] b3_ev_vect1;
  reg               [31:0] b3_ev_vect2;
  reg               [23:0] b3_ev_vect3;
  reg                [1:0] b3_pa54;
  reg               [31:0] b3_inv_vect [0:3];
  reg               [39:0] b3_evict_pa;
  reg               [31:0] b3_evict_inv_vect;

  wire                     b3_evict;
  wire             [111:0] b3_ev_invvect;

  assign b3_evict       = b3_req_c8 && 
                               (b3_cpx_valid==1'b1) && 
                               (b3_cpx_rtntyp==`CCX_RESP_EVICT);
  assign b3_ev_invvect  = b3_cpx_pkt_c8[`CPX_VINV_VECT];

  `endif
`endif

`ifdef NO_L2_BNK4
`else
  `ifdef NOL2RTL
  `else

  //----------------------------------------------------------
  // Signals for L2 RTL Bank4

  wire                 [2:0] b4_cpx_cid_c8;
  reg                  [2:0] b4_cpx_cid_c9;
  wire                 [2:0] b4_cpx_cid;
  wire               [145:0] b4_cpx_pkt_c8;
  wire                [39:0] b4_pa_c8;
  reg                 [39:0] b4_pa_c9;
  wire                [39:0] b4_cpx_pa;
  wire                [39:0] b4_ev_pa_c4;
  reg                 [39:0] b4_ev_pa_c5;
  reg                 [39:0] b4_ev_pa_c52;
  reg                 [39:0] b4_ev_pa_c6;
  reg                 [39:0] b4_ev_pa_c7;
  reg                 [39:0] b4_ev_pa_c8;
  wire                [39:0] b4_ev_pa;
  wire                       b4_req_c6;
  reg                        b4_req_c7;
  reg                        b4_req_c8;
  wire                       b4_cpx_valid;
  wire                       b4_cpx_pf;
  wire                 [3:0] b4_cpx_rtntyp;
  wire                 [2:0] b4_cpx_tid;
  wire                 [5:0] b4_cpx_tnum;
  wire                [39:0] b4_stall_c1;
  reg                 [39:0] b4_stall_c2;
  reg                 [39:0] b4_stall_c3;
  reg                 [39:0] b4_stall_c4;
  reg                 [39:0] b4_stall_c5;
  reg                 [39:0] b4_stall_c52;
  reg                 [39:0] b4_stall_c6;
  reg                 [39:0] b4_stall_c7;
  reg                 [39:0] b4_stall_c8;
  reg                 [39:0] b4_stall_c9;

  assign b4_cpx_cid_c8 = `CPU.l2t4.oque.inst_cpuid_c8;
  // When pipeline stalls, pa must be stalled, too.
  assign b4_cpx_cid    =  (b4_stall_c9) ? b4_cpx_cid_c9 : b4_cpx_cid_c8;
  assign b4_cpx_pkt_c8 = `CPU.l2t4.oque.oque_oq_array_data_in;
  assign b4_pa_c8      = `CPU.l2t4.arbadr.arbdp_addr_c8;
  // When pipeline stalls, pa must be stalled, too.
  assign b4_cpx_pa     =  (b4_stall_c9) ? b4_pa_c9 : b4_pa_c8;
  assign b4_ev_pa_c4   = `CPU.l2t4.evctag.evctag_wb_write_addr;
  assign b4_ev_pa      = b4_ev_pa_c8;
  assign b4_req_c6     = |(`CPU.l2t4.oqu.req_out_c6);
  assign b4_cpx_tnum   = {b4_cpx_cid,b4_cpx_tid};
  assign b4_cpx_tid    = b4_cpx_pkt_c8[`CPX_TID];
  assign b4_cpx_valid  = b4_cpx_pkt_c8[`CPX_VALID];
  assign b4_cpx_pf     = b4_cpx_pkt_c8[`CPX_PF];
  assign b4_cpx_rtntyp = b4_cpx_pkt_c8[`CPX_RTNTYP];
  // arb_inst_diag_c1 is asserted for LD/ST to L2 CSR registers which causes pipeline stall
  assign b4_stall_c1   = `CPU.l2t4.arb.arb_inst_diag_c1;

  //---------------------
  // Load Data

  wire                       b4_load_data_miss;
  wire                       b4_ldd_suppress;

  assign b4_load_data_miss = b4_req_c8 && 
                                  (b4_cpx_valid==1'b1) && 
                                  ((b4_cpx_rtntyp==`CCX_RESP_LD)||
                                   (b4_cpx_rtntyp==`CCX_RESP_NCU_LD)) && 
                                  (b4_cpx_pf==1'b0);
  assign b4_ldd_suppress = (b4_cpx_pa[39:32]==`IO_ASI_ADDR);

  //---------------------
  // Store L2 Commit

  wire                       b4_store_commit;
  wire                       b4_stc_suppress;
  wire                 [7:0] b4_stc_size;
  wire                [31:0] b4_stc_inv_vect;
  reg                 [31:0] b4_stc_vect;
  wire                       b4_stc_atomic;
  wire                       b4_l2_ctrue_c3; 
  reg                        b4_l2_ctrue_c4; 
  reg                        b4_l2_ctrue_c5; 
  reg                        b4_l2_ctrue_c52; 
  reg                        b4_l2_ctrue_c6; 
  reg                        b4_l2_ctrue_c7; 
  reg                        b4_l2_ctrue_c8; 
  wire                       b4_stc_l2hit;
  wire                       b4_stc_l2hit_c3;
  reg                        b4_stc_l2hit_c4;
  reg                        b4_stc_l2hit_c5;
  reg                        b4_stc_l2hit_c52;
  reg                        b4_stc_l2hit_c6;
  reg                        b4_stc_l2hit_c7;
  reg                        b4_stc_l2hit_c8;
  wire                       b4_cam_pa_match_c1;
  wire                       b4_csr_l2_bypass_mode_on;
  reg                        b4_cam_pa_match_c2;
  reg                        b4_cam_pa_match_c3;

    // rtntyp covers ST, CAS, SWAP since same decode
    //    but not Dcache Inval Ack (same rtntyp as ST Ack)
  assign b4_store_commit = b4_req_c8 && 
                                (b4_cpx_valid==1'b1) && 
                                (b4_cpx_rtntyp==`CCX_RESP_ST) &
                                (b4_cpx_pkt_c8[`CPX_VACK_INVAL]==2'b0);
  assign b4_stc_suppress = (b4_cpx_pa[39:32]==`IO_ASI_ADDR);
  assign b4_stc_inv_vect = b4_cpx_pkt_c8[`CPX_VACK_VECT];
  assign b4_stc_atomic   = b4_cpx_pkt_c8[`CPX_ATOMIC];

  assign b4_stc_size     = (b4_stc_atomic & !b4_l2_ctrue_c8) ?    // ctrue = compare true for CAS
                                    8'b0 : b4_cpx_pkt_c8[`CPX_VACK_BMASK];
  assign b4_l2_ctrue_c3  = `CPU.l2t4.arbdec.arbdp_inst_c3[37];  // `L2_CTRUE = 37
  assign b4_csr_l2_bypass_mode_on  = `CPU.l2t4.csr_l2_bypass_mode_on;  // l2 off mode
  assign b4_cam_pa_match_c1 = (|(`CPU.l2t4.misbuf.mb_cam_match | {32{`CPU.l2t4.misbuf.arbadr_arbdp_addr_c1c3comp_c1}} 
                                                                         | {32{`CPU.l2t4.misbuf.arbadr_arbdp_addr_c1c2comp_c1}}));
  assign b4_stc_l2hit_c3 =	 {32{`CPU.l2t4.misbuf.l2_dir_map_on_d1}} ?   // if l2 directmap on 
                                 ((`CPU.l2t4.tagctl.tag_hit_l2orfb_c3 & !(b4_csr_l2_bypass_mode_on)) ||      // select the equaltion with cam_pa_match_c3
                                 (`CPU.l2t4.misbuf.misbuf_hit_c3 & b4_cam_pa_match_c3 & !(b4_csr_l2_bypass_mode_on)))
								 :
								 ((`CPU.l2t4.tagctl.tag_hit_l2orfb_c3 & !(b4_csr_l2_bypass_mode_on))||     // else select the equaltion witout cam_pa_match_c3
								 (`CPU.l2t4.misbuf.misbuf_hit_c3 & !(b4_csr_l2_bypass_mode_on)))
								 ;
  assign b4_stc_l2hit    = b4_stc_l2hit_c8;

  //---------------------
  // Evict

  reg               [31:0] b4_ev_vect0;
  reg               [23:0] b4_ev_vect1;
  reg               [31:0] b4_ev_vect2;
  reg               [23:0] b4_ev_vect3;
  reg                [1:0] b4_pa54;
  reg               [31:0] b4_inv_vect [0:3];
  reg               [39:0] b4_evict_pa;
  reg               [31:0] b4_evict_inv_vect;

  wire                     b4_evict;
  wire             [111:0] b4_ev_invvect;

  assign b4_evict       = b4_req_c8 && 
                               (b4_cpx_valid==1'b1) && 
                               (b4_cpx_rtntyp==`CCX_RESP_EVICT);
  assign b4_ev_invvect  = b4_cpx_pkt_c8[`CPX_VINV_VECT];

  `endif
`endif

`ifdef NO_L2_BNK5
`else
  `ifdef NOL2RTL
  `else

  //----------------------------------------------------------
  // Signals for L2 RTL Bank5

  wire                 [2:0] b5_cpx_cid_c8;
  reg                  [2:0] b5_cpx_cid_c9;
  wire                 [2:0] b5_cpx_cid;
  wire               [145:0] b5_cpx_pkt_c8;
  wire                [39:0] b5_pa_c8;
  reg                 [39:0] b5_pa_c9;
  wire                [39:0] b5_cpx_pa;
  wire                [39:0] b5_ev_pa_c4;
  reg                 [39:0] b5_ev_pa_c5;
  reg                 [39:0] b5_ev_pa_c52;
  reg                 [39:0] b5_ev_pa_c6;
  reg                 [39:0] b5_ev_pa_c7;
  reg                 [39:0] b5_ev_pa_c8;
  wire                [39:0] b5_ev_pa;
  wire                       b5_req_c6;
  reg                        b5_req_c7;
  reg                        b5_req_c8;
  wire                       b5_cpx_valid;
  wire                       b5_cpx_pf;
  wire                 [3:0] b5_cpx_rtntyp;
  wire                 [2:0] b5_cpx_tid;
  wire                 [5:0] b5_cpx_tnum;
  wire                [39:0] b5_stall_c1;
  reg                 [39:0] b5_stall_c2;
  reg                 [39:0] b5_stall_c3;
  reg                 [39:0] b5_stall_c4;
  reg                 [39:0] b5_stall_c5;
  reg                 [39:0] b5_stall_c52;
  reg                 [39:0] b5_stall_c6;
  reg                 [39:0] b5_stall_c7;
  reg                 [39:0] b5_stall_c8;
  reg                 [39:0] b5_stall_c9;

  assign b5_cpx_cid_c8 = `CPU.l2t5.oque.inst_cpuid_c8;
  // When pipeline stalls, pa must be stalled, too.
  assign b5_cpx_cid    =  (b5_stall_c9) ? b5_cpx_cid_c9 : b5_cpx_cid_c8;
  assign b5_cpx_pkt_c8 = `CPU.l2t5.oque.oque_oq_array_data_in;
  assign b5_pa_c8      = `CPU.l2t5.arbadr.arbdp_addr_c8;
  // When pipeline stalls, pa must be stalled, too.
  assign b5_cpx_pa     =  (b5_stall_c9) ? b5_pa_c9 : b5_pa_c8;
  assign b5_ev_pa_c4   = `CPU.l2t5.evctag.evctag_wb_write_addr;
  assign b5_ev_pa      = b5_ev_pa_c8;
  assign b5_req_c6     = |(`CPU.l2t5.oqu.req_out_c6);
  assign b5_cpx_tnum   = {b5_cpx_cid,b5_cpx_tid};
  assign b5_cpx_tid    = b5_cpx_pkt_c8[`CPX_TID];
  assign b5_cpx_valid  = b5_cpx_pkt_c8[`CPX_VALID];
  assign b5_cpx_pf     = b5_cpx_pkt_c8[`CPX_PF];
  assign b5_cpx_rtntyp = b5_cpx_pkt_c8[`CPX_RTNTYP];
  // arb_inst_diag_c1 is asserted for LD/ST to L2 CSR registers which causes pipeline stall
  assign b5_stall_c1   = `CPU.l2t5.arb.arb_inst_diag_c1;

  //---------------------
  // Load Data

  wire                       b5_load_data_miss;
  wire                       b5_ldd_suppress;

  assign b5_load_data_miss = b5_req_c8 && 
                                  (b5_cpx_valid==1'b1) && 
                                  ((b5_cpx_rtntyp==`CCX_RESP_LD)||
                                   (b5_cpx_rtntyp==`CCX_RESP_NCU_LD)) && 
                                  (b5_cpx_pf==1'b0);
  assign b5_ldd_suppress = (b5_cpx_pa[39:32]==`IO_ASI_ADDR);

  //---------------------
  // Store L2 Commit

  wire                       b5_store_commit;
  wire                       b5_stc_suppress;
  wire                 [7:0] b5_stc_size;
  wire                [31:0] b5_stc_inv_vect;
  reg                 [31:0] b5_stc_vect;
  wire                       b5_stc_atomic;
  wire                       b5_l2_ctrue_c3; 
  reg                        b5_l2_ctrue_c4; 
  reg                        b5_l2_ctrue_c5; 
  reg                        b5_l2_ctrue_c52; 
  reg                        b5_l2_ctrue_c6; 
  reg                        b5_l2_ctrue_c7; 
  reg                        b5_l2_ctrue_c8; 
  wire                       b5_stc_l2hit;
  wire                       b5_stc_l2hit_c3;
  reg                        b5_stc_l2hit_c4;
  reg                        b5_stc_l2hit_c5;
  reg                        b5_stc_l2hit_c52;
  reg                        b5_stc_l2hit_c6;
  reg                        b5_stc_l2hit_c7;
  reg                        b5_stc_l2hit_c8;
  wire                       b5_cam_pa_match_c1;
  wire                       b5_csr_l2_bypass_mode_on;
  reg                        b5_cam_pa_match_c2;
  reg                        b5_cam_pa_match_c3;

    // rtntyp covers ST, CAS, SWAP since same decode
    //    but not Dcache Inval Ack (same rtntyp as ST Ack)
  assign b5_store_commit = b5_req_c8 && 
                                (b5_cpx_valid==1'b1) && 
                                (b5_cpx_rtntyp==`CCX_RESP_ST) &
                                (b5_cpx_pkt_c8[`CPX_VACK_INVAL]==2'b0);
  assign b5_stc_suppress = (b5_cpx_pa[39:32]==`IO_ASI_ADDR);
  assign b5_stc_inv_vect = b5_cpx_pkt_c8[`CPX_VACK_VECT];
  assign b5_stc_atomic   = b5_cpx_pkt_c8[`CPX_ATOMIC];

  assign b5_stc_size     = (b5_stc_atomic & !b5_l2_ctrue_c8) ?    // ctrue = compare true for CAS
                                    8'b0 : b5_cpx_pkt_c8[`CPX_VACK_BMASK];
  assign b5_l2_ctrue_c3  = `CPU.l2t5.arbdec.arbdp_inst_c3[37];  // `L2_CTRUE = 37
  assign b5_csr_l2_bypass_mode_on  = `CPU.l2t5.csr_l2_bypass_mode_on;  // l2 off mode
  assign b5_cam_pa_match_c1 = (|(`CPU.l2t5.misbuf.mb_cam_match | {32{`CPU.l2t5.misbuf.arbadr_arbdp_addr_c1c3comp_c1}} 
                                                                         | {32{`CPU.l2t5.misbuf.arbadr_arbdp_addr_c1c2comp_c1}}));
  assign b5_stc_l2hit_c3 =	 {32{`CPU.l2t5.misbuf.l2_dir_map_on_d1}} ?   // if l2 directmap on 
                                 ((`CPU.l2t5.tagctl.tag_hit_l2orfb_c3 & !(b5_csr_l2_bypass_mode_on)) ||      // select the equaltion with cam_pa_match_c3
                                 (`CPU.l2t5.misbuf.misbuf_hit_c3 & b5_cam_pa_match_c3 & !(b5_csr_l2_bypass_mode_on)))
								 :
								 ((`CPU.l2t5.tagctl.tag_hit_l2orfb_c3 & !(b5_csr_l2_bypass_mode_on))||     // else select the equaltion witout cam_pa_match_c3
								 (`CPU.l2t5.misbuf.misbuf_hit_c3 & !(b5_csr_l2_bypass_mode_on)))
								 ;
  assign b5_stc_l2hit    = b5_stc_l2hit_c8;

  //---------------------
  // Evict

  reg               [31:0] b5_ev_vect0;
  reg               [23:0] b5_ev_vect1;
  reg               [31:0] b5_ev_vect2;
  reg               [23:0] b5_ev_vect3;
  reg                [1:0] b5_pa54;
  reg               [31:0] b5_inv_vect [0:3];
  reg               [39:0] b5_evict_pa;
  reg               [31:0] b5_evict_inv_vect;

  wire                     b5_evict;
  wire             [111:0] b5_ev_invvect;

  assign b5_evict       = b5_req_c8 && 
                               (b5_cpx_valid==1'b1) && 
                               (b5_cpx_rtntyp==`CCX_RESP_EVICT);
  assign b5_ev_invvect  = b5_cpx_pkt_c8[`CPX_VINV_VECT];

  `endif
`endif

`ifdef NO_L2_BNK6
`else
  `ifdef NOL2RTL
  `else

  //----------------------------------------------------------
  // Signals for L2 RTL Bank6

  wire                 [2:0] b6_cpx_cid_c8;
  reg                  [2:0] b6_cpx_cid_c9;
  wire                 [2:0] b6_cpx_cid;
  wire               [145:0] b6_cpx_pkt_c8;
  wire                [39:0] b6_pa_c8;
  reg                 [39:0] b6_pa_c9;
  wire                [39:0] b6_cpx_pa;
  wire                [39:0] b6_ev_pa_c4;
  reg                 [39:0] b6_ev_pa_c5;
  reg                 [39:0] b6_ev_pa_c52;
  reg                 [39:0] b6_ev_pa_c6;
  reg                 [39:0] b6_ev_pa_c7;
  reg                 [39:0] b6_ev_pa_c8;
  wire                [39:0] b6_ev_pa;
  wire                       b6_req_c6;
  reg                        b6_req_c7;
  reg                        b6_req_c8;
  wire                       b6_cpx_valid;
  wire                       b6_cpx_pf;
  wire                 [3:0] b6_cpx_rtntyp;
  wire                 [2:0] b6_cpx_tid;
  wire                 [5:0] b6_cpx_tnum;
  wire                [39:0] b6_stall_c1;
  reg                 [39:0] b6_stall_c2;
  reg                 [39:0] b6_stall_c3;
  reg                 [39:0] b6_stall_c4;
  reg                 [39:0] b6_stall_c5;
  reg                 [39:0] b6_stall_c52;
  reg                 [39:0] b6_stall_c6;
  reg                 [39:0] b6_stall_c7;
  reg                 [39:0] b6_stall_c8;
  reg                 [39:0] b6_stall_c9;

  assign b6_cpx_cid_c8 = `CPU.l2t6.oque.inst_cpuid_c8;
  // When pipeline stalls, pa must be stalled, too.
  assign b6_cpx_cid    =  (b6_stall_c9) ? b6_cpx_cid_c9 : b6_cpx_cid_c8;
  assign b6_cpx_pkt_c8 = `CPU.l2t6.oque.oque_oq_array_data_in;
  assign b6_pa_c8      = `CPU.l2t6.arbadr.arbdp_addr_c8;
  // When pipeline stalls, pa must be stalled, too.
  assign b6_cpx_pa     =  (b6_stall_c9) ? b6_pa_c9 : b6_pa_c8;
  assign b6_ev_pa_c4   = `CPU.l2t6.evctag.evctag_wb_write_addr;
  assign b6_ev_pa      = b6_ev_pa_c8;
  assign b6_req_c6     = |(`CPU.l2t6.oqu.req_out_c6);
  assign b6_cpx_tnum   = {b6_cpx_cid,b6_cpx_tid};
  assign b6_cpx_tid    = b6_cpx_pkt_c8[`CPX_TID];
  assign b6_cpx_valid  = b6_cpx_pkt_c8[`CPX_VALID];
  assign b6_cpx_pf     = b6_cpx_pkt_c8[`CPX_PF];
  assign b6_cpx_rtntyp = b6_cpx_pkt_c8[`CPX_RTNTYP];
  // arb_inst_diag_c1 is asserted for LD/ST to L2 CSR registers which causes pipeline stall
  assign b6_stall_c1   = `CPU.l2t6.arb.arb_inst_diag_c1;

  //---------------------
  // Load Data

  wire                       b6_load_data_miss;
  wire                       b6_ldd_suppress;

  assign b6_load_data_miss = b6_req_c8 && 
                                  (b6_cpx_valid==1'b1) && 
                                  ((b6_cpx_rtntyp==`CCX_RESP_LD)||
                                   (b6_cpx_rtntyp==`CCX_RESP_NCU_LD)) && 
                                  (b6_cpx_pf==1'b0);
  assign b6_ldd_suppress = (b6_cpx_pa[39:32]==`IO_ASI_ADDR);

  //---------------------
  // Store L2 Commit

  wire                       b6_store_commit;
  wire                       b6_stc_suppress;
  wire                 [7:0] b6_stc_size;
  wire                [31:0] b6_stc_inv_vect;
  reg                 [31:0] b6_stc_vect;
  wire                       b6_stc_atomic;
  wire                       b6_l2_ctrue_c3; 
  reg                        b6_l2_ctrue_c4; 
  reg                        b6_l2_ctrue_c5; 
  reg                        b6_l2_ctrue_c52; 
  reg                        b6_l2_ctrue_c6; 
  reg                        b6_l2_ctrue_c7; 
  reg                        b6_l2_ctrue_c8; 
  wire                       b6_stc_l2hit;
  wire                       b6_stc_l2hit_c3;
  reg                        b6_stc_l2hit_c4;
  reg                        b6_stc_l2hit_c5;
  reg                        b6_stc_l2hit_c52;
  reg                        b6_stc_l2hit_c6;
  reg                        b6_stc_l2hit_c7;
  reg                        b6_stc_l2hit_c8;
  wire                       b6_cam_pa_match_c1;
  wire                       b6_csr_l2_bypass_mode_on;
  reg                        b6_cam_pa_match_c2;
  reg                        b6_cam_pa_match_c3;

    // rtntyp covers ST, CAS, SWAP since same decode
    //    but not Dcache Inval Ack (same rtntyp as ST Ack)
  assign b6_store_commit = b6_req_c8 && 
                                (b6_cpx_valid==1'b1) && 
                                (b6_cpx_rtntyp==`CCX_RESP_ST) &
                                (b6_cpx_pkt_c8[`CPX_VACK_INVAL]==2'b0);
  assign b6_stc_suppress = (b6_cpx_pa[39:32]==`IO_ASI_ADDR);
  assign b6_stc_inv_vect = b6_cpx_pkt_c8[`CPX_VACK_VECT];
  assign b6_stc_atomic   = b6_cpx_pkt_c8[`CPX_ATOMIC];

  assign b6_stc_size     = (b6_stc_atomic & !b6_l2_ctrue_c8) ?    // ctrue = compare true for CAS
                                    8'b0 : b6_cpx_pkt_c8[`CPX_VACK_BMASK];
  assign b6_l2_ctrue_c3  = `CPU.l2t6.arbdec.arbdp_inst_c3[37];  // `L2_CTRUE = 37
  assign b6_csr_l2_bypass_mode_on  = `CPU.l2t6.csr_l2_bypass_mode_on;  // l2 off mode
  assign b6_cam_pa_match_c1 = (|(`CPU.l2t6.misbuf.mb_cam_match | {32{`CPU.l2t6.misbuf.arbadr_arbdp_addr_c1c3comp_c1}} 
                                                                         | {32{`CPU.l2t6.misbuf.arbadr_arbdp_addr_c1c2comp_c1}}));
  assign b6_stc_l2hit_c3 =	 {32{`CPU.l2t6.misbuf.l2_dir_map_on_d1}} ?   // if l2 directmap on 
                                 ((`CPU.l2t6.tagctl.tag_hit_l2orfb_c3 & !(b6_csr_l2_bypass_mode_on)) ||      // select the equaltion with cam_pa_match_c3
                                 (`CPU.l2t6.misbuf.misbuf_hit_c3 & b6_cam_pa_match_c3 & !(b6_csr_l2_bypass_mode_on)))
								 :
								 ((`CPU.l2t6.tagctl.tag_hit_l2orfb_c3 & !(b6_csr_l2_bypass_mode_on))||     // else select the equaltion witout cam_pa_match_c3
								 (`CPU.l2t6.misbuf.misbuf_hit_c3 & !(b6_csr_l2_bypass_mode_on)))
								 ;
  assign b6_stc_l2hit    = b6_stc_l2hit_c8;

  //---------------------
  // Evict

  reg               [31:0] b6_ev_vect0;
  reg               [23:0] b6_ev_vect1;
  reg               [31:0] b6_ev_vect2;
  reg               [23:0] b6_ev_vect3;
  reg                [1:0] b6_pa54;
  reg               [31:0] b6_inv_vect [0:3];
  reg               [39:0] b6_evict_pa;
  reg               [31:0] b6_evict_inv_vect;

  wire                     b6_evict;
  wire             [111:0] b6_ev_invvect;

  assign b6_evict       = b6_req_c8 && 
                               (b6_cpx_valid==1'b1) && 
                               (b6_cpx_rtntyp==`CCX_RESP_EVICT);
  assign b6_ev_invvect  = b6_cpx_pkt_c8[`CPX_VINV_VECT];

  `endif
`endif

`ifdef NO_L2_BNK7
`else
  `ifdef NOL2RTL
  `else

  //----------------------------------------------------------
  // Signals for L2 RTL Bank7

  wire                 [2:0] b7_cpx_cid_c8;
  reg                  [2:0] b7_cpx_cid_c9;
  wire                 [2:0] b7_cpx_cid;
  wire               [145:0] b7_cpx_pkt_c8;
  wire                [39:0] b7_pa_c8;
  reg                 [39:0] b7_pa_c9;
  wire                [39:0] b7_cpx_pa;
  wire                [39:0] b7_ev_pa_c4;
  reg                 [39:0] b7_ev_pa_c5;
  reg                 [39:0] b7_ev_pa_c52;
  reg                 [39:0] b7_ev_pa_c6;
  reg                 [39:0] b7_ev_pa_c7;
  reg                 [39:0] b7_ev_pa_c8;
  wire                [39:0] b7_ev_pa;
  wire                       b7_req_c6;
  reg                        b7_req_c7;
  reg                        b7_req_c8;
  wire                       b7_cpx_valid;
  wire                       b7_cpx_pf;
  wire                 [3:0] b7_cpx_rtntyp;
  wire                 [2:0] b7_cpx_tid;
  wire                 [5:0] b7_cpx_tnum;
  wire                [39:0] b7_stall_c1;
  reg                 [39:0] b7_stall_c2;
  reg                 [39:0] b7_stall_c3;
  reg                 [39:0] b7_stall_c4;
  reg                 [39:0] b7_stall_c5;
  reg                 [39:0] b7_stall_c52;
  reg                 [39:0] b7_stall_c6;
  reg                 [39:0] b7_stall_c7;
  reg                 [39:0] b7_stall_c8;
  reg                 [39:0] b7_stall_c9;

  assign b7_cpx_cid_c8 = `CPU.l2t7.oque.inst_cpuid_c8;
  // When pipeline stalls, pa must be stalled, too.
  assign b7_cpx_cid    =  (b7_stall_c9) ? b7_cpx_cid_c9 : b7_cpx_cid_c8;
  assign b7_cpx_pkt_c8 = `CPU.l2t7.oque.oque_oq_array_data_in;
  assign b7_pa_c8      = `CPU.l2t7.arbadr.arbdp_addr_c8;
  // When pipeline stalls, pa must be stalled, too.
  assign b7_cpx_pa     =  (b7_stall_c9) ? b7_pa_c9 : b7_pa_c8;
  assign b7_ev_pa_c4   = `CPU.l2t7.evctag.evctag_wb_write_addr;
  assign b7_ev_pa      = b7_ev_pa_c8;
  assign b7_req_c6     = |(`CPU.l2t7.oqu.req_out_c6);
  assign b7_cpx_tnum   = {b7_cpx_cid,b7_cpx_tid};
  assign b7_cpx_tid    = b7_cpx_pkt_c8[`CPX_TID];
  assign b7_cpx_valid  = b7_cpx_pkt_c8[`CPX_VALID];
  assign b7_cpx_pf     = b7_cpx_pkt_c8[`CPX_PF];
  assign b7_cpx_rtntyp = b7_cpx_pkt_c8[`CPX_RTNTYP];
  // arb_inst_diag_c1 is asserted for LD/ST to L2 CSR registers which causes pipeline stall
  assign b7_stall_c1   = `CPU.l2t7.arb.arb_inst_diag_c1;

  //---------------------
  // Load Data

  wire                       b7_load_data_miss;
  wire                       b7_ldd_suppress;

  assign b7_load_data_miss = b7_req_c8 && 
                                  (b7_cpx_valid==1'b1) && 
                                  ((b7_cpx_rtntyp==`CCX_RESP_LD)||
                                   (b7_cpx_rtntyp==`CCX_RESP_NCU_LD)) && 
                                  (b7_cpx_pf==1'b0);
  assign b7_ldd_suppress = (b7_cpx_pa[39:32]==`IO_ASI_ADDR);

  //---------------------
  // Store L2 Commit

  wire                       b7_store_commit;
  wire                       b7_stc_suppress;
  wire                 [7:0] b7_stc_size;
  wire                [31:0] b7_stc_inv_vect;
  reg                 [31:0] b7_stc_vect;
  wire                       b7_stc_atomic;
  wire                       b7_l2_ctrue_c3; 
  reg                        b7_l2_ctrue_c4; 
  reg                        b7_l2_ctrue_c5; 
  reg                        b7_l2_ctrue_c52; 
  reg                        b7_l2_ctrue_c6; 
  reg                        b7_l2_ctrue_c7; 
  reg                        b7_l2_ctrue_c8; 
  wire                       b7_stc_l2hit;
  wire                       b7_stc_l2hit_c3;
  reg                        b7_stc_l2hit_c4;
  reg                        b7_stc_l2hit_c5;
  reg                        b7_stc_l2hit_c52;
  reg                        b7_stc_l2hit_c6;
  reg                        b7_stc_l2hit_c7;
  reg                        b7_stc_l2hit_c8;
  wire                       b7_cam_pa_match_c1;
  wire                       b7_csr_l2_bypass_mode_on;
  reg                        b7_cam_pa_match_c2;
  reg                        b7_cam_pa_match_c3;

    // rtntyp covers ST, CAS, SWAP since same decode
    //    but not Dcache Inval Ack (same rtntyp as ST Ack)
  assign b7_store_commit = b7_req_c8 && 
                                (b7_cpx_valid==1'b1) && 
                                (b7_cpx_rtntyp==`CCX_RESP_ST) &
                                (b7_cpx_pkt_c8[`CPX_VACK_INVAL]==2'b0);
  assign b7_stc_suppress = (b7_cpx_pa[39:32]==`IO_ASI_ADDR);
  assign b7_stc_inv_vect = b7_cpx_pkt_c8[`CPX_VACK_VECT];
  assign b7_stc_atomic   = b7_cpx_pkt_c8[`CPX_ATOMIC];

  assign b7_stc_size     = (b7_stc_atomic & !b7_l2_ctrue_c8) ?    // ctrue = compare true for CAS
                                    8'b0 : b7_cpx_pkt_c8[`CPX_VACK_BMASK];
  assign b7_l2_ctrue_c3  = `CPU.l2t7.arbdec.arbdp_inst_c3[37];  // `L2_CTRUE = 37
  assign b7_csr_l2_bypass_mode_on  = `CPU.l2t7.csr_l2_bypass_mode_on;  // l2 off mode
  assign b7_cam_pa_match_c1 = (|(`CPU.l2t7.misbuf.mb_cam_match | {32{`CPU.l2t7.misbuf.arbadr_arbdp_addr_c1c3comp_c1}} 
                                                                         | {32{`CPU.l2t7.misbuf.arbadr_arbdp_addr_c1c2comp_c1}}));
  assign b7_stc_l2hit_c3 =	 {32{`CPU.l2t7.misbuf.l2_dir_map_on_d1}} ?   // if l2 directmap on 
                                 ((`CPU.l2t7.tagctl.tag_hit_l2orfb_c3 & !(b7_csr_l2_bypass_mode_on)) ||      // select the equaltion with cam_pa_match_c3
                                 (`CPU.l2t7.misbuf.misbuf_hit_c3 & b7_cam_pa_match_c3 & !(b7_csr_l2_bypass_mode_on)))
								 :
								 ((`CPU.l2t7.tagctl.tag_hit_l2orfb_c3 & !(b7_csr_l2_bypass_mode_on))||     // else select the equaltion witout cam_pa_match_c3
								 (`CPU.l2t7.misbuf.misbuf_hit_c3 & !(b7_csr_l2_bypass_mode_on)))
								 ;
  assign b7_stc_l2hit    = b7_stc_l2hit_c8;

  //---------------------
  // Evict

  reg               [31:0] b7_ev_vect0;
  reg               [23:0] b7_ev_vect1;
  reg               [31:0] b7_ev_vect2;
  reg               [23:0] b7_ev_vect3;
  reg                [1:0] b7_pa54;
  reg               [31:0] b7_inv_vect [0:3];
  reg               [39:0] b7_evict_pa;
  reg               [31:0] b7_evict_inv_vect;

  wire                     b7_evict;
  wire             [111:0] b7_ev_invvect;

  assign b7_evict       = b7_req_c8 && 
                               (b7_cpx_valid==1'b1) && 
                               (b7_cpx_rtntyp==`CCX_RESP_EVICT);
  assign b7_ev_invvect  = b7_cpx_pkt_c8[`CPX_VINV_VECT];

  `endif
`endif


// Must include ldst_dma.v before send of socket messages
// but after wire declarations
// because ldst_dma reuses some wires declared above and
// because DMA_STORE socket msg must come before related EVICT
`include "ldst_dma.v"

//==========================================================
//==========================================================


//==========================================================
// Bank0

always @ (posedge `BENCH_L2T0_GCLK) begin // {

  tstamp = `TOP.core_cycle_cnt - 1;

  //------------------------------
  //  Pipeline signals

`ifdef NO_L2_BNK0
`else
  `ifdef NOL2RTL
  `else

  //------------------------------
  //  L2 RTL Bank0

  b0_pa_c9  <= b0_pa_c8;
  b0_cpx_cid_c9 <= b0_cpx_cid_c8;
  b0_req_c7    <= b0_req_c6;
  b0_req_c8    <= b0_req_c7;

  b0_cam_pa_match_c2  <= b0_cam_pa_match_c1;
  b0_cam_pa_match_c3  <= b0_cam_pa_match_c2;

  b0_stall_c2  <= b0_stall_c1;
  b0_stall_c3  <= b0_stall_c2;
  b0_stall_c4  <= b0_stall_c3;
  b0_stall_c5  <= b0_stall_c4;
  b0_stall_c52 <= b0_stall_c5;
  b0_stall_c6  <= b0_stall_c52;
  b0_stall_c7  <= b0_stall_c6;
  b0_stall_c8  <= b0_stall_c7;
  b0_stall_c9  <= b0_stall_c8;

  b0_ev_pa_c5  <= b0_ev_pa_c4;
  b0_ev_pa_c52 <= b0_ev_pa_c5;
  b0_ev_pa_c6  <= b0_ev_pa_c52;
  b0_ev_pa_c7  <= b0_ev_pa_c6;
  b0_ev_pa_c8  <= b0_ev_pa_c7;

  b0_stc_l2hit_c4  <= b0_stc_l2hit_c3;
  b0_stc_l2hit_c5  <= b0_stc_l2hit_c4;
  b0_stc_l2hit_c52 <= b0_stc_l2hit_c5;
  b0_stc_l2hit_c6  <= b0_stc_l2hit_c52;
  b0_stc_l2hit_c7  <= b0_stc_l2hit_c6;
  b0_stc_l2hit_c8  <= b0_stc_l2hit_c7;

  b0_l2_ctrue_c4  <= b0_l2_ctrue_c3;
  b0_l2_ctrue_c5  <= b0_l2_ctrue_c4;
  b0_l2_ctrue_c52 <= b0_l2_ctrue_c5;
  b0_l2_ctrue_c6  <= b0_l2_ctrue_c52;
  b0_l2_ctrue_c7  <= b0_l2_ctrue_c6;
  b0_l2_ctrue_c8  <= b0_l2_ctrue_c7;

  `endif
`endif

  //----------------------------------------------------------
  //----------------------------------------------------------
  //  Load Data (miss only) (See ldst_lsu.v for Load Data - hit)

`ifdef NO_L2_BNK0
`else

  //------------------------------
  //  L2 Stub or L2 RTL Bank0

  if (b0_load_data_miss && !b0_ldd_suppress) begin // {

    if (`PARGS.nas_check_on && `PARGS.ldst_sync_on && `PARGS.th_check_enable[b0_cpx_tnum]) begin // {
      if (`PARGS.hash_on && (b0_cpx_pa[39]==1'b0)) begin // {
        `PR_INFO ("pli_ldst", `INFO, 
          "C%0d T%0d PLI_MEM_LDDATA tid=%d pa=%h dsrc=%0h                            ts=%0d",
           b0_cpx_cid,b0_cpx_tid,b0_cpx_tnum,`TOP.hashpa(b0_cpx_pa),dsrc,tstamp);
        junk = $sim_send(`PLI_MEM_LD_DATA,b0_cpx_tnum,`TOP.hashpa(b0_cpx_pa),dsrc,tstamp);
      end // }
      else begin //{
        `PR_INFO ("pli_ldst", `INFO, 
          "C%0d T%0d PLI_MEM_LDDATA tid=%d pa=%h dsrc=%0h                            ts=%0d",
           b0_cpx_cid,b0_cpx_tid,b0_cpx_tnum,b0_cpx_pa,dsrc,tstamp);
        junk = $sim_send(`PLI_MEM_LD_DATA,b0_cpx_tnum,b0_cpx_pa,dsrc,tstamp);
      end // }
    end // }
  end // }
  else if (b0_load_data_miss && b0_ldd_suppress) begin // {
    `PR_INFO ("pli_ldst", `INFO, 
              "C%0d T%0d PLI_MEM_LDDATA tid=%d pa=%h  Suppress for IO ASI",b0_cpx_cid,b0_cpx_tid,b0_cpx_tnum,b0_cpx_pa);

  end // }

  //----------------------------------------------------------
  //----------------------------------------------------------
  // Store L2 Commit

  //------------------------------
  //  L2 Stub or L2 RTL Bank0

  if (b0_store_commit && !b0_stc_suppress) begin // {

  b0_stc_vect = get_vect (b0_stc_inv_vect);        

    if (`PARGS.nas_check_on && `PARGS.ldst_sync_on && `PARGS.th_check_enable[b0_cpx_tnum]) begin // {
      if (`PARGS.hash_on && (b0_cpx_pa[39]==1'b0)) begin // {
        `PR_INFO ("pli_ldst", `INFO, 
          "C%0d T%0d PLI_MEM_STCOM  tid=%d pa=%h sz=%h ivect=%h l2hit=%0d      ts=%0d",
           b0_cpx_cid,b0_cpx_tid,b0_cpx_tnum,`TOP.hashpa(b0_cpx_pa),
           b0_stc_size,b0_stc_vect,b0_stc_l2hit,tstamp);
        junk = $sim_send(`PLI_MEM_ST_L2_COMMIT,b0_cpx_tnum,`TOP.hashpa(b0_cpx_pa),
           b0_stc_size,b0_stc_vect,b0_stc_l2hit,tstamp);
      end // }
      else begin //{
        `PR_INFO ("pli_ldst", `INFO, 
          "C%0d T%0d PLI_MEM_STCOM  tid=%d pa=%h sz=%h ivect=%h l2hit=%0d      ts=%0d",
           b0_cpx_cid,b0_cpx_tid,b0_cpx_tnum,b0_cpx_pa,
           b0_stc_size,b0_stc_vect,b0_stc_l2hit,tstamp);
        junk = $sim_send(`PLI_MEM_ST_L2_COMMIT,b0_cpx_tnum,b0_cpx_pa,
           b0_stc_size,b0_stc_vect,b0_stc_l2hit,tstamp);
      end // }
    end // }

  end // }
  else if (b0_store_commit && b0_stc_suppress) begin // {
    `PR_INFO ("pli_ldst", `INFO, 
              "C%0d T%0d PLI_MEM_STCOM  tid=%d pa=%h  Suppress for IO ASI",b0_cpx_cid,b0_cpx_tid,b0_cpx_tnum,b0_cpx_pa);

  end // }

  //----------------------------------------------------------
  //----------------------------------------------------------
  // Evict
  // Note - NCU (bnk8 cannot send evictions)

  //------------------------------
  //  L2 Stub or L2 RTL Bank0

  if (b0_evict) begin // {

    b0_ev_vect0 = b0_ev_invvect[31:0];
    b0_ev_vect1 = b0_ev_invvect[55:32];
    b0_ev_vect2 = b0_ev_invvect[87:56];
    b0_ev_vect3 = b0_ev_invvect[111:88];

    b0_inv_vect[0] = get_vect(b0_ev_vect0);
    b0_inv_vect[1] = get_vect31(b0_ev_vect1);  // different function for odd inval vector
    b0_inv_vect[2] = get_vect(b0_ev_vect2);
    b0_inv_vect[3] = get_vect31(b0_ev_vect3);  // different function for odd inval vector

    for (i=0; i<=3; i=i+1) begin // {

      b0_pa54 = i;
      b0_evict_pa = {b0_ev_pa[39:6],b0_pa54,4'b0};
      b0_evict_inv_vect = b0_inv_vect[i];

      if (b0_inv_vect[i]!=0) begin // {

        if (`PARGS.nas_check_on && `PARGS.ldst_sync_on) begin // {
          if (`PARGS.hash_on && (b0_evict_pa[39]==1'b0)) begin // {
            `PR_INFO ("pli_ldst", `INFO, 
              "      PLI_MEM_EVICT        pa=%h ivect=%h                    ts=%0d",
                                  `TOP.hashpa(b0_evict_pa),b0_evict_inv_vect,tstamp);
            junk = $sim_send(`PLI_MEM_EVICT,`TOP.hashpa(b0_evict_pa),b0_evict_inv_vect,tstamp);
          end // }
          else begin //{
            `PR_INFO ("pli_ldst", `INFO, 
              "      PLI_MEM_EVICT        pa=%h ivect=%h                    ts=%0d",
                                  b0_evict_pa,b0_evict_inv_vect,tstamp);
            junk = $sim_send(`PLI_MEM_EVICT,b0_evict_pa,b0_evict_inv_vect,tstamp);
          end // if}
        end // if}

        if (`PARGS.show_memop_on) begin // {
          if (`PARGS.hash_on && (b0_evict_pa[39]==1'b0)) begin // {
            `PR_NORMAL ("pli_ldst", `NORMAL, 
              "       MEMOP_EVICT       pa=%h  ts=%0d  (L2  - c8 stage)",
                     `TOP.hashpa(b0_evict_pa),tstamp);
          end // }
          else begin //{
            `PR_NORMAL ("pli_ldst", `NORMAL, 
              "      MEMOP_EVICT        pa=%h  ts=%0d  (L2  - c8 stage)",
                     b0_evict_pa,tstamp);
          end // }
        end // }

      end // if}
    end // for}

  end // }


`endif

end // always}

//==========================================================
// Bank1

always @ (posedge `BENCH_L2T1_GCLK) begin // {

  tstamp = `TOP.core_cycle_cnt - 1;

  //------------------------------
  //  Pipeline signals

`ifdef NO_L2_BNK1
`else
  `ifdef NOL2RTL
  `else

  //------------------------------
  //  L2 RTL Bank1

  b1_pa_c9  <= b1_pa_c8;
  b1_cpx_cid_c9 <= b1_cpx_cid_c8;
  b1_req_c7    <= b1_req_c6;
  b1_req_c8    <= b1_req_c7;

  b1_cam_pa_match_c2  <= b1_cam_pa_match_c1;
  b1_cam_pa_match_c3  <= b1_cam_pa_match_c2;

  b1_stall_c2  <= b1_stall_c1;
  b1_stall_c3  <= b1_stall_c2;
  b1_stall_c4  <= b1_stall_c3;
  b1_stall_c5  <= b1_stall_c4;
  b1_stall_c52 <= b1_stall_c5;
  b1_stall_c6  <= b1_stall_c52;
  b1_stall_c7  <= b1_stall_c6;
  b1_stall_c8  <= b1_stall_c7;
  b1_stall_c9  <= b1_stall_c8;

  b1_ev_pa_c5  <= b1_ev_pa_c4;
  b1_ev_pa_c52 <= b1_ev_pa_c5;
  b1_ev_pa_c6  <= b1_ev_pa_c52;
  b1_ev_pa_c7  <= b1_ev_pa_c6;
  b1_ev_pa_c8  <= b1_ev_pa_c7;

  b1_stc_l2hit_c4  <= b1_stc_l2hit_c3;
  b1_stc_l2hit_c5  <= b1_stc_l2hit_c4;
  b1_stc_l2hit_c52 <= b1_stc_l2hit_c5;
  b1_stc_l2hit_c6  <= b1_stc_l2hit_c52;
  b1_stc_l2hit_c7  <= b1_stc_l2hit_c6;
  b1_stc_l2hit_c8  <= b1_stc_l2hit_c7;

  b1_l2_ctrue_c4  <= b1_l2_ctrue_c3;
  b1_l2_ctrue_c5  <= b1_l2_ctrue_c4;
  b1_l2_ctrue_c52 <= b1_l2_ctrue_c5;
  b1_l2_ctrue_c6  <= b1_l2_ctrue_c52;
  b1_l2_ctrue_c7  <= b1_l2_ctrue_c6;
  b1_l2_ctrue_c8  <= b1_l2_ctrue_c7;

  `endif
`endif

  //----------------------------------------------------------
  //----------------------------------------------------------
  //  Load Data (miss only) (See ldst_lsu.v for Load Data - hit)

`ifdef NO_L2_BNK1
`else

  //------------------------------
  //  L2 Stub or L2 RTL Bank1

  if (b1_load_data_miss && !b1_ldd_suppress) begin // {

    if (`PARGS.nas_check_on && `PARGS.ldst_sync_on && `PARGS.th_check_enable[b1_cpx_tnum]) begin // {
      if (`PARGS.hash_on && (b1_cpx_pa[39]==1'b0)) begin // {
        `PR_INFO ("pli_ldst", `INFO, 
          "C%0d T%0d PLI_MEM_LDDATA tid=%d pa=%h dsrc=%0h                            ts=%0d",
           b1_cpx_cid,b1_cpx_tid,b1_cpx_tnum,`TOP.hashpa(b1_cpx_pa),dsrc,tstamp);
        junk = $sim_send(`PLI_MEM_LD_DATA,b1_cpx_tnum,`TOP.hashpa(b1_cpx_pa),dsrc,tstamp);
      end // }
      else begin //{
        `PR_INFO ("pli_ldst", `INFO, 
          "C%0d T%0d PLI_MEM_LDDATA tid=%d pa=%h dsrc=%0h                            ts=%0d",
           b1_cpx_cid,b1_cpx_tid,b1_cpx_tnum,b1_cpx_pa,dsrc,tstamp);
        junk = $sim_send(`PLI_MEM_LD_DATA,b1_cpx_tnum,b1_cpx_pa,dsrc,tstamp);
      end // }
    end // }
  end // }
  else if (b1_load_data_miss && b1_ldd_suppress) begin // {
    `PR_INFO ("pli_ldst", `INFO, 
              "C%0d T%0d PLI_MEM_LDDATA tid=%d pa=%h  Suppress for IO ASI",b1_cpx_cid,b1_cpx_tid,b1_cpx_tnum,b1_cpx_pa);

  end // }

  //----------------------------------------------------------
  //----------------------------------------------------------
  // Store L2 Commit

  //------------------------------
  //  L2 Stub or L2 RTL Bank1

  if (b1_store_commit && !b1_stc_suppress) begin // {

  b1_stc_vect = get_vect (b1_stc_inv_vect);        

    if (`PARGS.nas_check_on && `PARGS.ldst_sync_on && `PARGS.th_check_enable[b1_cpx_tnum]) begin // {
      if (`PARGS.hash_on && (b1_cpx_pa[39]==1'b0)) begin // {
        `PR_INFO ("pli_ldst", `INFO, 
          "C%0d T%0d PLI_MEM_STCOM  tid=%d pa=%h sz=%h ivect=%h l2hit=%0d      ts=%0d",
           b1_cpx_cid,b1_cpx_tid,b1_cpx_tnum,`TOP.hashpa(b1_cpx_pa),
           b1_stc_size,b1_stc_vect,b1_stc_l2hit,tstamp);
        junk = $sim_send(`PLI_MEM_ST_L2_COMMIT,b1_cpx_tnum,`TOP.hashpa(b1_cpx_pa),
           b1_stc_size,b1_stc_vect,b1_stc_l2hit,tstamp);
      end // }
      else begin //{
        `PR_INFO ("pli_ldst", `INFO, 
          "C%0d T%0d PLI_MEM_STCOM  tid=%d pa=%h sz=%h ivect=%h l2hit=%0d      ts=%0d",
           b1_cpx_cid,b1_cpx_tid,b1_cpx_tnum,b1_cpx_pa,
           b1_stc_size,b1_stc_vect,b1_stc_l2hit,tstamp);
        junk = $sim_send(`PLI_MEM_ST_L2_COMMIT,b1_cpx_tnum,b1_cpx_pa,
           b1_stc_size,b1_stc_vect,b1_stc_l2hit,tstamp);
      end // }
    end // }

  end // }
  else if (b1_store_commit && b1_stc_suppress) begin // {
    `PR_INFO ("pli_ldst", `INFO, 
              "C%0d T%0d PLI_MEM_STCOM  tid=%d pa=%h  Suppress for IO ASI",b1_cpx_cid,b1_cpx_tid,b1_cpx_tnum,b1_cpx_pa);

  end // }

  //----------------------------------------------------------
  //----------------------------------------------------------
  // Evict
  // Note - NCU (bnk8 cannot send evictions)

  //------------------------------
  //  L2 Stub or L2 RTL Bank1

  if (b1_evict) begin // {

    b1_ev_vect0 = b1_ev_invvect[31:0];
    b1_ev_vect1 = b1_ev_invvect[55:32];
    b1_ev_vect2 = b1_ev_invvect[87:56];
    b1_ev_vect3 = b1_ev_invvect[111:88];

    b1_inv_vect[0] = get_vect(b1_ev_vect0);
    b1_inv_vect[1] = get_vect31(b1_ev_vect1);  // different function for odd inval vector
    b1_inv_vect[2] = get_vect(b1_ev_vect2);
    b1_inv_vect[3] = get_vect31(b1_ev_vect3);  // different function for odd inval vector

    for (i=0; i<=3; i=i+1) begin // {

      b1_pa54 = i;
      b1_evict_pa = {b1_ev_pa[39:6],b1_pa54,4'b0};
      b1_evict_inv_vect = b1_inv_vect[i];

      if (b1_inv_vect[i]!=0) begin // {

        if (`PARGS.nas_check_on && `PARGS.ldst_sync_on) begin // {
          if (`PARGS.hash_on && (b1_evict_pa[39]==1'b0)) begin // {
            `PR_INFO ("pli_ldst", `INFO, 
              "      PLI_MEM_EVICT        pa=%h ivect=%h                    ts=%0d",
                                  `TOP.hashpa(b1_evict_pa),b1_evict_inv_vect,tstamp);
            junk = $sim_send(`PLI_MEM_EVICT,`TOP.hashpa(b1_evict_pa),b1_evict_inv_vect,tstamp);
          end // }
          else begin //{
            `PR_INFO ("pli_ldst", `INFO, 
              "      PLI_MEM_EVICT        pa=%h ivect=%h                    ts=%0d",
                                  b1_evict_pa,b1_evict_inv_vect,tstamp);
            junk = $sim_send(`PLI_MEM_EVICT,b1_evict_pa,b1_evict_inv_vect,tstamp);
          end // if}
        end // if}

        if (`PARGS.show_memop_on) begin // {
          if (`PARGS.hash_on && (b1_evict_pa[39]==1'b0)) begin // {
            `PR_NORMAL ("pli_ldst", `NORMAL, 
              "       MEMOP_EVICT       pa=%h  ts=%0d  (L2  - c8 stage)",
                     `TOP.hashpa(b1_evict_pa),tstamp);
          end // }
          else begin //{
            `PR_NORMAL ("pli_ldst", `NORMAL, 
              "      MEMOP_EVICT        pa=%h  ts=%0d  (L2  - c8 stage)",
                     b1_evict_pa,tstamp);
          end // }
        end // }

      end // if}
    end // for}

  end // }


`endif

end // always}

//==========================================================
// Bank2

always @ (posedge `BENCH_L2T2_GCLK) begin // {

  tstamp = `TOP.core_cycle_cnt - 1;

  //------------------------------
  //  Pipeline signals

`ifdef NO_L2_BNK2
`else
  `ifdef NOL2RTL
  `else

  //------------------------------
  //  L2 RTL Bank2

  b2_pa_c9  <= b2_pa_c8;
  b2_cpx_cid_c9 <= b2_cpx_cid_c8;
  b2_req_c7    <= b2_req_c6;
  b2_req_c8    <= b2_req_c7;

  b2_cam_pa_match_c2  <= b2_cam_pa_match_c1;
  b2_cam_pa_match_c3  <= b2_cam_pa_match_c2;

  b2_stall_c2  <= b2_stall_c1;
  b2_stall_c3  <= b2_stall_c2;
  b2_stall_c4  <= b2_stall_c3;
  b2_stall_c5  <= b2_stall_c4;
  b2_stall_c52 <= b2_stall_c5;
  b2_stall_c6  <= b2_stall_c52;
  b2_stall_c7  <= b2_stall_c6;
  b2_stall_c8  <= b2_stall_c7;
  b2_stall_c9  <= b2_stall_c8;

  b2_ev_pa_c5  <= b2_ev_pa_c4;
  b2_ev_pa_c52 <= b2_ev_pa_c5;
  b2_ev_pa_c6  <= b2_ev_pa_c52;
  b2_ev_pa_c7  <= b2_ev_pa_c6;
  b2_ev_pa_c8  <= b2_ev_pa_c7;

  b2_stc_l2hit_c4  <= b2_stc_l2hit_c3;
  b2_stc_l2hit_c5  <= b2_stc_l2hit_c4;
  b2_stc_l2hit_c52 <= b2_stc_l2hit_c5;
  b2_stc_l2hit_c6  <= b2_stc_l2hit_c52;
  b2_stc_l2hit_c7  <= b2_stc_l2hit_c6;
  b2_stc_l2hit_c8  <= b2_stc_l2hit_c7;

  b2_l2_ctrue_c4  <= b2_l2_ctrue_c3;
  b2_l2_ctrue_c5  <= b2_l2_ctrue_c4;
  b2_l2_ctrue_c52 <= b2_l2_ctrue_c5;
  b2_l2_ctrue_c6  <= b2_l2_ctrue_c52;
  b2_l2_ctrue_c7  <= b2_l2_ctrue_c6;
  b2_l2_ctrue_c8  <= b2_l2_ctrue_c7;

  `endif
`endif

  //----------------------------------------------------------
  //----------------------------------------------------------
  //  Load Data (miss only) (See ldst_lsu.v for Load Data - hit)

`ifdef NO_L2_BNK2
`else

  //------------------------------
  //  L2 Stub or L2 RTL Bank2

  if (b2_load_data_miss && !b2_ldd_suppress) begin // {

    if (`PARGS.nas_check_on && `PARGS.ldst_sync_on && `PARGS.th_check_enable[b2_cpx_tnum]) begin // {
      if (`PARGS.hash_on && (b2_cpx_pa[39]==1'b0)) begin // {
        `PR_INFO ("pli_ldst", `INFO, 
          "C%0d T%0d PLI_MEM_LDDATA tid=%d pa=%h dsrc=%0h                            ts=%0d",
           b2_cpx_cid,b2_cpx_tid,b2_cpx_tnum,`TOP.hashpa(b2_cpx_pa),dsrc,tstamp);
        junk = $sim_send(`PLI_MEM_LD_DATA,b2_cpx_tnum,`TOP.hashpa(b2_cpx_pa),dsrc,tstamp);
      end // }
      else begin //{
        `PR_INFO ("pli_ldst", `INFO, 
          "C%0d T%0d PLI_MEM_LDDATA tid=%d pa=%h dsrc=%0h                            ts=%0d",
           b2_cpx_cid,b2_cpx_tid,b2_cpx_tnum,b2_cpx_pa,dsrc,tstamp);
        junk = $sim_send(`PLI_MEM_LD_DATA,b2_cpx_tnum,b2_cpx_pa,dsrc,tstamp);
      end // }
    end // }
  end // }
  else if (b2_load_data_miss && b2_ldd_suppress) begin // {
    `PR_INFO ("pli_ldst", `INFO, 
              "C%0d T%0d PLI_MEM_LDDATA tid=%d pa=%h  Suppress for IO ASI",b2_cpx_cid,b2_cpx_tid,b2_cpx_tnum,b2_cpx_pa);

  end // }

  //----------------------------------------------------------
  //----------------------------------------------------------
  // Store L2 Commit

  //------------------------------
  //  L2 Stub or L2 RTL Bank2

  if (b2_store_commit && !b2_stc_suppress) begin // {

  b2_stc_vect = get_vect (b2_stc_inv_vect);        

    if (`PARGS.nas_check_on && `PARGS.ldst_sync_on && `PARGS.th_check_enable[b2_cpx_tnum]) begin // {
      if (`PARGS.hash_on && (b2_cpx_pa[39]==1'b0)) begin // {
        `PR_INFO ("pli_ldst", `INFO, 
          "C%0d T%0d PLI_MEM_STCOM  tid=%d pa=%h sz=%h ivect=%h l2hit=%0d      ts=%0d",
           b2_cpx_cid,b2_cpx_tid,b2_cpx_tnum,`TOP.hashpa(b2_cpx_pa),
           b2_stc_size,b2_stc_vect,b2_stc_l2hit,tstamp);
        junk = $sim_send(`PLI_MEM_ST_L2_COMMIT,b2_cpx_tnum,`TOP.hashpa(b2_cpx_pa),
           b2_stc_size,b2_stc_vect,b2_stc_l2hit,tstamp);
      end // }
      else begin //{
        `PR_INFO ("pli_ldst", `INFO, 
          "C%0d T%0d PLI_MEM_STCOM  tid=%d pa=%h sz=%h ivect=%h l2hit=%0d      ts=%0d",
           b2_cpx_cid,b2_cpx_tid,b2_cpx_tnum,b2_cpx_pa,
           b2_stc_size,b2_stc_vect,b2_stc_l2hit,tstamp);
        junk = $sim_send(`PLI_MEM_ST_L2_COMMIT,b2_cpx_tnum,b2_cpx_pa,
           b2_stc_size,b2_stc_vect,b2_stc_l2hit,tstamp);
      end // }
    end // }

  end // }
  else if (b2_store_commit && b2_stc_suppress) begin // {
    `PR_INFO ("pli_ldst", `INFO, 
              "C%0d T%0d PLI_MEM_STCOM  tid=%d pa=%h  Suppress for IO ASI",b2_cpx_cid,b2_cpx_tid,b2_cpx_tnum,b2_cpx_pa);

  end // }

  //----------------------------------------------------------
  //----------------------------------------------------------
  // Evict
  // Note - NCU (bnk8 cannot send evictions)

  //------------------------------
  //  L2 Stub or L2 RTL Bank2

  if (b2_evict) begin // {

    b2_ev_vect0 = b2_ev_invvect[31:0];
    b2_ev_vect1 = b2_ev_invvect[55:32];
    b2_ev_vect2 = b2_ev_invvect[87:56];
    b2_ev_vect3 = b2_ev_invvect[111:88];

    b2_inv_vect[0] = get_vect(b2_ev_vect0);
    b2_inv_vect[1] = get_vect31(b2_ev_vect1);  // different function for odd inval vector
    b2_inv_vect[2] = get_vect(b2_ev_vect2);
    b2_inv_vect[3] = get_vect31(b2_ev_vect3);  // different function for odd inval vector

    for (i=0; i<=3; i=i+1) begin // {

      b2_pa54 = i;
      b2_evict_pa = {b2_ev_pa[39:6],b2_pa54,4'b0};
      b2_evict_inv_vect = b2_inv_vect[i];

      if (b2_inv_vect[i]!=0) begin // {

        if (`PARGS.nas_check_on && `PARGS.ldst_sync_on) begin // {
          if (`PARGS.hash_on && (b2_evict_pa[39]==1'b0)) begin // {
            `PR_INFO ("pli_ldst", `INFO, 
              "      PLI_MEM_EVICT        pa=%h ivect=%h                    ts=%0d",
                                  `TOP.hashpa(b2_evict_pa),b2_evict_inv_vect,tstamp);
            junk = $sim_send(`PLI_MEM_EVICT,`TOP.hashpa(b2_evict_pa),b2_evict_inv_vect,tstamp);
          end // }
          else begin //{
            `PR_INFO ("pli_ldst", `INFO, 
              "      PLI_MEM_EVICT        pa=%h ivect=%h                    ts=%0d",
                                  b2_evict_pa,b2_evict_inv_vect,tstamp);
            junk = $sim_send(`PLI_MEM_EVICT,b2_evict_pa,b2_evict_inv_vect,tstamp);
          end // if}
        end // if}

        if (`PARGS.show_memop_on) begin // {
          if (`PARGS.hash_on && (b2_evict_pa[39]==1'b0)) begin // {
            `PR_NORMAL ("pli_ldst", `NORMAL, 
              "       MEMOP_EVICT       pa=%h  ts=%0d  (L2  - c8 stage)",
                     `TOP.hashpa(b2_evict_pa),tstamp);
          end // }
          else begin //{
            `PR_NORMAL ("pli_ldst", `NORMAL, 
              "      MEMOP_EVICT        pa=%h  ts=%0d  (L2  - c8 stage)",
                     b2_evict_pa,tstamp);
          end // }
        end // }

      end // if}
    end // for}

  end // }


`endif

end // always}

//==========================================================
// Bank3

always @ (posedge `BENCH_L2T3_GCLK) begin // {

  tstamp = `TOP.core_cycle_cnt - 1;

  //------------------------------
  //  Pipeline signals

`ifdef NO_L2_BNK3
`else
  `ifdef NOL2RTL
  `else

  //------------------------------
  //  L2 RTL Bank3

  b3_pa_c9  <= b3_pa_c8;
  b3_cpx_cid_c9 <= b3_cpx_cid_c8;
  b3_req_c7    <= b3_req_c6;
  b3_req_c8    <= b3_req_c7;

  b3_cam_pa_match_c2  <= b3_cam_pa_match_c1;
  b3_cam_pa_match_c3  <= b3_cam_pa_match_c2;

  b3_stall_c2  <= b3_stall_c1;
  b3_stall_c3  <= b3_stall_c2;
  b3_stall_c4  <= b3_stall_c3;
  b3_stall_c5  <= b3_stall_c4;
  b3_stall_c52 <= b3_stall_c5;
  b3_stall_c6  <= b3_stall_c52;
  b3_stall_c7  <= b3_stall_c6;
  b3_stall_c8  <= b3_stall_c7;
  b3_stall_c9  <= b3_stall_c8;

  b3_ev_pa_c5  <= b3_ev_pa_c4;
  b3_ev_pa_c52 <= b3_ev_pa_c5;
  b3_ev_pa_c6  <= b3_ev_pa_c52;
  b3_ev_pa_c7  <= b3_ev_pa_c6;
  b3_ev_pa_c8  <= b3_ev_pa_c7;

  b3_stc_l2hit_c4  <= b3_stc_l2hit_c3;
  b3_stc_l2hit_c5  <= b3_stc_l2hit_c4;
  b3_stc_l2hit_c52 <= b3_stc_l2hit_c5;
  b3_stc_l2hit_c6  <= b3_stc_l2hit_c52;
  b3_stc_l2hit_c7  <= b3_stc_l2hit_c6;
  b3_stc_l2hit_c8  <= b3_stc_l2hit_c7;

  b3_l2_ctrue_c4  <= b3_l2_ctrue_c3;
  b3_l2_ctrue_c5  <= b3_l2_ctrue_c4;
  b3_l2_ctrue_c52 <= b3_l2_ctrue_c5;
  b3_l2_ctrue_c6  <= b3_l2_ctrue_c52;
  b3_l2_ctrue_c7  <= b3_l2_ctrue_c6;
  b3_l2_ctrue_c8  <= b3_l2_ctrue_c7;

  `endif
`endif

  //----------------------------------------------------------
  //----------------------------------------------------------
  //  Load Data (miss only) (See ldst_lsu.v for Load Data - hit)

`ifdef NO_L2_BNK3
`else

  //------------------------------
  //  L2 Stub or L2 RTL Bank3

  if (b3_load_data_miss && !b3_ldd_suppress) begin // {

    if (`PARGS.nas_check_on && `PARGS.ldst_sync_on && `PARGS.th_check_enable[b3_cpx_tnum]) begin // {
      if (`PARGS.hash_on && (b3_cpx_pa[39]==1'b0)) begin // {
        `PR_INFO ("pli_ldst", `INFO, 
          "C%0d T%0d PLI_MEM_LDDATA tid=%d pa=%h dsrc=%0h                            ts=%0d",
           b3_cpx_cid,b3_cpx_tid,b3_cpx_tnum,`TOP.hashpa(b3_cpx_pa),dsrc,tstamp);
        junk = $sim_send(`PLI_MEM_LD_DATA,b3_cpx_tnum,`TOP.hashpa(b3_cpx_pa),dsrc,tstamp);
      end // }
      else begin //{
        `PR_INFO ("pli_ldst", `INFO, 
          "C%0d T%0d PLI_MEM_LDDATA tid=%d pa=%h dsrc=%0h                            ts=%0d",
           b3_cpx_cid,b3_cpx_tid,b3_cpx_tnum,b3_cpx_pa,dsrc,tstamp);
        junk = $sim_send(`PLI_MEM_LD_DATA,b3_cpx_tnum,b3_cpx_pa,dsrc,tstamp);
      end // }
    end // }
  end // }
  else if (b3_load_data_miss && b3_ldd_suppress) begin // {
    `PR_INFO ("pli_ldst", `INFO, 
              "C%0d T%0d PLI_MEM_LDDATA tid=%d pa=%h  Suppress for IO ASI",b3_cpx_cid,b3_cpx_tid,b3_cpx_tnum,b3_cpx_pa);

  end // }

  //----------------------------------------------------------
  //----------------------------------------------------------
  // Store L2 Commit

  //------------------------------
  //  L2 Stub or L2 RTL Bank3

  if (b3_store_commit && !b3_stc_suppress) begin // {

  b3_stc_vect = get_vect (b3_stc_inv_vect);        

    if (`PARGS.nas_check_on && `PARGS.ldst_sync_on && `PARGS.th_check_enable[b3_cpx_tnum]) begin // {
      if (`PARGS.hash_on && (b3_cpx_pa[39]==1'b0)) begin // {
        `PR_INFO ("pli_ldst", `INFO, 
          "C%0d T%0d PLI_MEM_STCOM  tid=%d pa=%h sz=%h ivect=%h l2hit=%0d      ts=%0d",
           b3_cpx_cid,b3_cpx_tid,b3_cpx_tnum,`TOP.hashpa(b3_cpx_pa),
           b3_stc_size,b3_stc_vect,b3_stc_l2hit,tstamp);
        junk = $sim_send(`PLI_MEM_ST_L2_COMMIT,b3_cpx_tnum,`TOP.hashpa(b3_cpx_pa),
           b3_stc_size,b3_stc_vect,b3_stc_l2hit,tstamp);
      end // }
      else begin //{
        `PR_INFO ("pli_ldst", `INFO, 
          "C%0d T%0d PLI_MEM_STCOM  tid=%d pa=%h sz=%h ivect=%h l2hit=%0d      ts=%0d",
           b3_cpx_cid,b3_cpx_tid,b3_cpx_tnum,b3_cpx_pa,
           b3_stc_size,b3_stc_vect,b3_stc_l2hit,tstamp);
        junk = $sim_send(`PLI_MEM_ST_L2_COMMIT,b3_cpx_tnum,b3_cpx_pa,
           b3_stc_size,b3_stc_vect,b3_stc_l2hit,tstamp);
      end // }
    end // }

  end // }
  else if (b3_store_commit && b3_stc_suppress) begin // {
    `PR_INFO ("pli_ldst", `INFO, 
              "C%0d T%0d PLI_MEM_STCOM  tid=%d pa=%h  Suppress for IO ASI",b3_cpx_cid,b3_cpx_tid,b3_cpx_tnum,b3_cpx_pa);

  end // }

  //----------------------------------------------------------
  //----------------------------------------------------------
  // Evict
  // Note - NCU (bnk8 cannot send evictions)

  //------------------------------
  //  L2 Stub or L2 RTL Bank3

  if (b3_evict) begin // {

    b3_ev_vect0 = b3_ev_invvect[31:0];
    b3_ev_vect1 = b3_ev_invvect[55:32];
    b3_ev_vect2 = b3_ev_invvect[87:56];
    b3_ev_vect3 = b3_ev_invvect[111:88];

    b3_inv_vect[0] = get_vect(b3_ev_vect0);
    b3_inv_vect[1] = get_vect31(b3_ev_vect1);  // different function for odd inval vector
    b3_inv_vect[2] = get_vect(b3_ev_vect2);
    b3_inv_vect[3] = get_vect31(b3_ev_vect3);  // different function for odd inval vector

    for (i=0; i<=3; i=i+1) begin // {

      b3_pa54 = i;
      b3_evict_pa = {b3_ev_pa[39:6],b3_pa54,4'b0};
      b3_evict_inv_vect = b3_inv_vect[i];

      if (b3_inv_vect[i]!=0) begin // {

        if (`PARGS.nas_check_on && `PARGS.ldst_sync_on) begin // {
          if (`PARGS.hash_on && (b3_evict_pa[39]==1'b0)) begin // {
            `PR_INFO ("pli_ldst", `INFO, 
              "      PLI_MEM_EVICT        pa=%h ivect=%h                    ts=%0d",
                                  `TOP.hashpa(b3_evict_pa),b3_evict_inv_vect,tstamp);
            junk = $sim_send(`PLI_MEM_EVICT,`TOP.hashpa(b3_evict_pa),b3_evict_inv_vect,tstamp);
          end // }
          else begin //{
            `PR_INFO ("pli_ldst", `INFO, 
              "      PLI_MEM_EVICT        pa=%h ivect=%h                    ts=%0d",
                                  b3_evict_pa,b3_evict_inv_vect,tstamp);
            junk = $sim_send(`PLI_MEM_EVICT,b3_evict_pa,b3_evict_inv_vect,tstamp);
          end // if}
        end // if}

        if (`PARGS.show_memop_on) begin // {
          if (`PARGS.hash_on && (b3_evict_pa[39]==1'b0)) begin // {
            `PR_NORMAL ("pli_ldst", `NORMAL, 
              "       MEMOP_EVICT       pa=%h  ts=%0d  (L2  - c8 stage)",
                     `TOP.hashpa(b3_evict_pa),tstamp);
          end // }
          else begin //{
            `PR_NORMAL ("pli_ldst", `NORMAL, 
              "      MEMOP_EVICT        pa=%h  ts=%0d  (L2  - c8 stage)",
                     b3_evict_pa,tstamp);
          end // }
        end // }

      end // if}
    end // for}

  end // }


`endif

end // always}

//==========================================================
// Bank4

always @ (posedge `BENCH_L2T4_GCLK) begin // {

  tstamp = `TOP.core_cycle_cnt - 1;

  //------------------------------
  //  Pipeline signals

`ifdef NO_L2_BNK4
`else
  `ifdef NOL2RTL
  `else

  //------------------------------
  //  L2 RTL Bank4

  b4_pa_c9  <= b4_pa_c8;
  b4_cpx_cid_c9 <= b4_cpx_cid_c8;
  b4_req_c7    <= b4_req_c6;
  b4_req_c8    <= b4_req_c7;

  b4_cam_pa_match_c2  <= b4_cam_pa_match_c1;
  b4_cam_pa_match_c3  <= b4_cam_pa_match_c2;

  b4_stall_c2  <= b4_stall_c1;
  b4_stall_c3  <= b4_stall_c2;
  b4_stall_c4  <= b4_stall_c3;
  b4_stall_c5  <= b4_stall_c4;
  b4_stall_c52 <= b4_stall_c5;
  b4_stall_c6  <= b4_stall_c52;
  b4_stall_c7  <= b4_stall_c6;
  b4_stall_c8  <= b4_stall_c7;
  b4_stall_c9  <= b4_stall_c8;

  b4_ev_pa_c5  <= b4_ev_pa_c4;
  b4_ev_pa_c52 <= b4_ev_pa_c5;
  b4_ev_pa_c6  <= b4_ev_pa_c52;
  b4_ev_pa_c7  <= b4_ev_pa_c6;
  b4_ev_pa_c8  <= b4_ev_pa_c7;

  b4_stc_l2hit_c4  <= b4_stc_l2hit_c3;
  b4_stc_l2hit_c5  <= b4_stc_l2hit_c4;
  b4_stc_l2hit_c52 <= b4_stc_l2hit_c5;
  b4_stc_l2hit_c6  <= b4_stc_l2hit_c52;
  b4_stc_l2hit_c7  <= b4_stc_l2hit_c6;
  b4_stc_l2hit_c8  <= b4_stc_l2hit_c7;

  b4_l2_ctrue_c4  <= b4_l2_ctrue_c3;
  b4_l2_ctrue_c5  <= b4_l2_ctrue_c4;
  b4_l2_ctrue_c52 <= b4_l2_ctrue_c5;
  b4_l2_ctrue_c6  <= b4_l2_ctrue_c52;
  b4_l2_ctrue_c7  <= b4_l2_ctrue_c6;
  b4_l2_ctrue_c8  <= b4_l2_ctrue_c7;

  `endif
`endif

  //----------------------------------------------------------
  //----------------------------------------------------------
  //  Load Data (miss only) (See ldst_lsu.v for Load Data - hit)

`ifdef NO_L2_BNK4
`else

  //------------------------------
  //  L2 Stub or L2 RTL Bank4

  if (b4_load_data_miss && !b4_ldd_suppress) begin // {

    if (`PARGS.nas_check_on && `PARGS.ldst_sync_on && `PARGS.th_check_enable[b4_cpx_tnum]) begin // {
      if (`PARGS.hash_on && (b4_cpx_pa[39]==1'b0)) begin // {
        `PR_INFO ("pli_ldst", `INFO, 
          "C%0d T%0d PLI_MEM_LDDATA tid=%d pa=%h dsrc=%0h                            ts=%0d",
           b4_cpx_cid,b4_cpx_tid,b4_cpx_tnum,`TOP.hashpa(b4_cpx_pa),dsrc,tstamp);
        junk = $sim_send(`PLI_MEM_LD_DATA,b4_cpx_tnum,`TOP.hashpa(b4_cpx_pa),dsrc,tstamp);
      end // }
      else begin //{
        `PR_INFO ("pli_ldst", `INFO, 
          "C%0d T%0d PLI_MEM_LDDATA tid=%d pa=%h dsrc=%0h                            ts=%0d",
           b4_cpx_cid,b4_cpx_tid,b4_cpx_tnum,b4_cpx_pa,dsrc,tstamp);
        junk = $sim_send(`PLI_MEM_LD_DATA,b4_cpx_tnum,b4_cpx_pa,dsrc,tstamp);
      end // }
    end // }
  end // }
  else if (b4_load_data_miss && b4_ldd_suppress) begin // {
    `PR_INFO ("pli_ldst", `INFO, 
              "C%0d T%0d PLI_MEM_LDDATA tid=%d pa=%h  Suppress for IO ASI",b4_cpx_cid,b4_cpx_tid,b4_cpx_tnum,b4_cpx_pa);

  end // }

  //----------------------------------------------------------
  //----------------------------------------------------------
  // Store L2 Commit

  //------------------------------
  //  L2 Stub or L2 RTL Bank4

  if (b4_store_commit && !b4_stc_suppress) begin // {

  b4_stc_vect = get_vect (b4_stc_inv_vect);        

    if (`PARGS.nas_check_on && `PARGS.ldst_sync_on && `PARGS.th_check_enable[b4_cpx_tnum]) begin // {
      if (`PARGS.hash_on && (b4_cpx_pa[39]==1'b0)) begin // {
        `PR_INFO ("pli_ldst", `INFO, 
          "C%0d T%0d PLI_MEM_STCOM  tid=%d pa=%h sz=%h ivect=%h l2hit=%0d      ts=%0d",
           b4_cpx_cid,b4_cpx_tid,b4_cpx_tnum,`TOP.hashpa(b4_cpx_pa),
           b4_stc_size,b4_stc_vect,b4_stc_l2hit,tstamp);
        junk = $sim_send(`PLI_MEM_ST_L2_COMMIT,b4_cpx_tnum,`TOP.hashpa(b4_cpx_pa),
           b4_stc_size,b4_stc_vect,b4_stc_l2hit,tstamp);
      end // }
      else begin //{
        `PR_INFO ("pli_ldst", `INFO, 
          "C%0d T%0d PLI_MEM_STCOM  tid=%d pa=%h sz=%h ivect=%h l2hit=%0d      ts=%0d",
           b4_cpx_cid,b4_cpx_tid,b4_cpx_tnum,b4_cpx_pa,
           b4_stc_size,b4_stc_vect,b4_stc_l2hit,tstamp);
        junk = $sim_send(`PLI_MEM_ST_L2_COMMIT,b4_cpx_tnum,b4_cpx_pa,
           b4_stc_size,b4_stc_vect,b4_stc_l2hit,tstamp);
      end // }
    end // }

  end // }
  else if (b4_store_commit && b4_stc_suppress) begin // {
    `PR_INFO ("pli_ldst", `INFO, 
              "C%0d T%0d PLI_MEM_STCOM  tid=%d pa=%h  Suppress for IO ASI",b4_cpx_cid,b4_cpx_tid,b4_cpx_tnum,b4_cpx_pa);

  end // }

  //----------------------------------------------------------
  //----------------------------------------------------------
  // Evict
  // Note - NCU (bnk8 cannot send evictions)

  //------------------------------
  //  L2 Stub or L2 RTL Bank4

  if (b4_evict) begin // {

    b4_ev_vect0 = b4_ev_invvect[31:0];
    b4_ev_vect1 = b4_ev_invvect[55:32];
    b4_ev_vect2 = b4_ev_invvect[87:56];
    b4_ev_vect3 = b4_ev_invvect[111:88];

    b4_inv_vect[0] = get_vect(b4_ev_vect0);
    b4_inv_vect[1] = get_vect31(b4_ev_vect1);  // different function for odd inval vector
    b4_inv_vect[2] = get_vect(b4_ev_vect2);
    b4_inv_vect[3] = get_vect31(b4_ev_vect3);  // different function for odd inval vector

    for (i=0; i<=3; i=i+1) begin // {

      b4_pa54 = i;
      b4_evict_pa = {b4_ev_pa[39:6],b4_pa54,4'b0};
      b4_evict_inv_vect = b4_inv_vect[i];

      if (b4_inv_vect[i]!=0) begin // {

        if (`PARGS.nas_check_on && `PARGS.ldst_sync_on) begin // {
          if (`PARGS.hash_on && (b4_evict_pa[39]==1'b0)) begin // {
            `PR_INFO ("pli_ldst", `INFO, 
              "      PLI_MEM_EVICT        pa=%h ivect=%h                    ts=%0d",
                                  `TOP.hashpa(b4_evict_pa),b4_evict_inv_vect,tstamp);
            junk = $sim_send(`PLI_MEM_EVICT,`TOP.hashpa(b4_evict_pa),b4_evict_inv_vect,tstamp);
          end // }
          else begin //{
            `PR_INFO ("pli_ldst", `INFO, 
              "      PLI_MEM_EVICT        pa=%h ivect=%h                    ts=%0d",
                                  b4_evict_pa,b4_evict_inv_vect,tstamp);
            junk = $sim_send(`PLI_MEM_EVICT,b4_evict_pa,b4_evict_inv_vect,tstamp);
          end // if}
        end // if}

        if (`PARGS.show_memop_on) begin // {
          if (`PARGS.hash_on && (b4_evict_pa[39]==1'b0)) begin // {
            `PR_NORMAL ("pli_ldst", `NORMAL, 
              "       MEMOP_EVICT       pa=%h  ts=%0d  (L2  - c8 stage)",
                     `TOP.hashpa(b4_evict_pa),tstamp);
          end // }
          else begin //{
            `PR_NORMAL ("pli_ldst", `NORMAL, 
              "      MEMOP_EVICT        pa=%h  ts=%0d  (L2  - c8 stage)",
                     b4_evict_pa,tstamp);
          end // }
        end // }

      end // if}
    end // for}

  end // }


`endif

end // always}

//==========================================================
// Bank5

always @ (posedge `BENCH_L2T5_GCLK) begin // {

  tstamp = `TOP.core_cycle_cnt - 1;

  //------------------------------
  //  Pipeline signals

`ifdef NO_L2_BNK5
`else
  `ifdef NOL2RTL
  `else

  //------------------------------
  //  L2 RTL Bank5

  b5_pa_c9  <= b5_pa_c8;
  b5_cpx_cid_c9 <= b5_cpx_cid_c8;
  b5_req_c7    <= b5_req_c6;
  b5_req_c8    <= b5_req_c7;

  b5_cam_pa_match_c2  <= b5_cam_pa_match_c1;
  b5_cam_pa_match_c3  <= b5_cam_pa_match_c2;

  b5_stall_c2  <= b5_stall_c1;
  b5_stall_c3  <= b5_stall_c2;
  b5_stall_c4  <= b5_stall_c3;
  b5_stall_c5  <= b5_stall_c4;
  b5_stall_c52 <= b5_stall_c5;
  b5_stall_c6  <= b5_stall_c52;
  b5_stall_c7  <= b5_stall_c6;
  b5_stall_c8  <= b5_stall_c7;
  b5_stall_c9  <= b5_stall_c8;

  b5_ev_pa_c5  <= b5_ev_pa_c4;
  b5_ev_pa_c52 <= b5_ev_pa_c5;
  b5_ev_pa_c6  <= b5_ev_pa_c52;
  b5_ev_pa_c7  <= b5_ev_pa_c6;
  b5_ev_pa_c8  <= b5_ev_pa_c7;

  b5_stc_l2hit_c4  <= b5_stc_l2hit_c3;
  b5_stc_l2hit_c5  <= b5_stc_l2hit_c4;
  b5_stc_l2hit_c52 <= b5_stc_l2hit_c5;
  b5_stc_l2hit_c6  <= b5_stc_l2hit_c52;
  b5_stc_l2hit_c7  <= b5_stc_l2hit_c6;
  b5_stc_l2hit_c8  <= b5_stc_l2hit_c7;

  b5_l2_ctrue_c4  <= b5_l2_ctrue_c3;
  b5_l2_ctrue_c5  <= b5_l2_ctrue_c4;
  b5_l2_ctrue_c52 <= b5_l2_ctrue_c5;
  b5_l2_ctrue_c6  <= b5_l2_ctrue_c52;
  b5_l2_ctrue_c7  <= b5_l2_ctrue_c6;
  b5_l2_ctrue_c8  <= b5_l2_ctrue_c7;

  `endif
`endif

  //----------------------------------------------------------
  //----------------------------------------------------------
  //  Load Data (miss only) (See ldst_lsu.v for Load Data - hit)

`ifdef NO_L2_BNK5
`else

  //------------------------------
  //  L2 Stub or L2 RTL Bank5

  if (b5_load_data_miss && !b5_ldd_suppress) begin // {

    if (`PARGS.nas_check_on && `PARGS.ldst_sync_on && `PARGS.th_check_enable[b5_cpx_tnum]) begin // {
      if (`PARGS.hash_on && (b5_cpx_pa[39]==1'b0)) begin // {
        `PR_INFO ("pli_ldst", `INFO, 
          "C%0d T%0d PLI_MEM_LDDATA tid=%d pa=%h dsrc=%0h                            ts=%0d",
           b5_cpx_cid,b5_cpx_tid,b5_cpx_tnum,`TOP.hashpa(b5_cpx_pa),dsrc,tstamp);
        junk = $sim_send(`PLI_MEM_LD_DATA,b5_cpx_tnum,`TOP.hashpa(b5_cpx_pa),dsrc,tstamp);
      end // }
      else begin //{
        `PR_INFO ("pli_ldst", `INFO, 
          "C%0d T%0d PLI_MEM_LDDATA tid=%d pa=%h dsrc=%0h                            ts=%0d",
           b5_cpx_cid,b5_cpx_tid,b5_cpx_tnum,b5_cpx_pa,dsrc,tstamp);
        junk = $sim_send(`PLI_MEM_LD_DATA,b5_cpx_tnum,b5_cpx_pa,dsrc,tstamp);
      end // }
    end // }
  end // }
  else if (b5_load_data_miss && b5_ldd_suppress) begin // {
    `PR_INFO ("pli_ldst", `INFO, 
              "C%0d T%0d PLI_MEM_LDDATA tid=%d pa=%h  Suppress for IO ASI",b5_cpx_cid,b5_cpx_tid,b5_cpx_tnum,b5_cpx_pa);

  end // }

  //----------------------------------------------------------
  //----------------------------------------------------------
  // Store L2 Commit

  //------------------------------
  //  L2 Stub or L2 RTL Bank5

  if (b5_store_commit && !b5_stc_suppress) begin // {

  b5_stc_vect = get_vect (b5_stc_inv_vect);        

    if (`PARGS.nas_check_on && `PARGS.ldst_sync_on && `PARGS.th_check_enable[b5_cpx_tnum]) begin // {
      if (`PARGS.hash_on && (b5_cpx_pa[39]==1'b0)) begin // {
        `PR_INFO ("pli_ldst", `INFO, 
          "C%0d T%0d PLI_MEM_STCOM  tid=%d pa=%h sz=%h ivect=%h l2hit=%0d      ts=%0d",
           b5_cpx_cid,b5_cpx_tid,b5_cpx_tnum,`TOP.hashpa(b5_cpx_pa),
           b5_stc_size,b5_stc_vect,b5_stc_l2hit,tstamp);
        junk = $sim_send(`PLI_MEM_ST_L2_COMMIT,b5_cpx_tnum,`TOP.hashpa(b5_cpx_pa),
           b5_stc_size,b5_stc_vect,b5_stc_l2hit,tstamp);
      end // }
      else begin //{
        `PR_INFO ("pli_ldst", `INFO, 
          "C%0d T%0d PLI_MEM_STCOM  tid=%d pa=%h sz=%h ivect=%h l2hit=%0d      ts=%0d",
           b5_cpx_cid,b5_cpx_tid,b5_cpx_tnum,b5_cpx_pa,
           b5_stc_size,b5_stc_vect,b5_stc_l2hit,tstamp);
        junk = $sim_send(`PLI_MEM_ST_L2_COMMIT,b5_cpx_tnum,b5_cpx_pa,
           b5_stc_size,b5_stc_vect,b5_stc_l2hit,tstamp);
      end // }
    end // }

  end // }
  else if (b5_store_commit && b5_stc_suppress) begin // {
    `PR_INFO ("pli_ldst", `INFO, 
              "C%0d T%0d PLI_MEM_STCOM  tid=%d pa=%h  Suppress for IO ASI",b5_cpx_cid,b5_cpx_tid,b5_cpx_tnum,b5_cpx_pa);

  end // }

  //----------------------------------------------------------
  //----------------------------------------------------------
  // Evict
  // Note - NCU (bnk8 cannot send evictions)

  //------------------------------
  //  L2 Stub or L2 RTL Bank5

  if (b5_evict) begin // {

    b5_ev_vect0 = b5_ev_invvect[31:0];
    b5_ev_vect1 = b5_ev_invvect[55:32];
    b5_ev_vect2 = b5_ev_invvect[87:56];
    b5_ev_vect3 = b5_ev_invvect[111:88];

    b5_inv_vect[0] = get_vect(b5_ev_vect0);
    b5_inv_vect[1] = get_vect31(b5_ev_vect1);  // different function for odd inval vector
    b5_inv_vect[2] = get_vect(b5_ev_vect2);
    b5_inv_vect[3] = get_vect31(b5_ev_vect3);  // different function for odd inval vector

    for (i=0; i<=3; i=i+1) begin // {

      b5_pa54 = i;
      b5_evict_pa = {b5_ev_pa[39:6],b5_pa54,4'b0};
      b5_evict_inv_vect = b5_inv_vect[i];

      if (b5_inv_vect[i]!=0) begin // {

        if (`PARGS.nas_check_on && `PARGS.ldst_sync_on) begin // {
          if (`PARGS.hash_on && (b5_evict_pa[39]==1'b0)) begin // {
            `PR_INFO ("pli_ldst", `INFO, 
              "      PLI_MEM_EVICT        pa=%h ivect=%h                    ts=%0d",
                                  `TOP.hashpa(b5_evict_pa),b5_evict_inv_vect,tstamp);
            junk = $sim_send(`PLI_MEM_EVICT,`TOP.hashpa(b5_evict_pa),b5_evict_inv_vect,tstamp);
          end // }
          else begin //{
            `PR_INFO ("pli_ldst", `INFO, 
              "      PLI_MEM_EVICT        pa=%h ivect=%h                    ts=%0d",
                                  b5_evict_pa,b5_evict_inv_vect,tstamp);
            junk = $sim_send(`PLI_MEM_EVICT,b5_evict_pa,b5_evict_inv_vect,tstamp);
          end // if}
        end // if}

        if (`PARGS.show_memop_on) begin // {
          if (`PARGS.hash_on && (b5_evict_pa[39]==1'b0)) begin // {
            `PR_NORMAL ("pli_ldst", `NORMAL, 
              "       MEMOP_EVICT       pa=%h  ts=%0d  (L2  - c8 stage)",
                     `TOP.hashpa(b5_evict_pa),tstamp);
          end // }
          else begin //{
            `PR_NORMAL ("pli_ldst", `NORMAL, 
              "      MEMOP_EVICT        pa=%h  ts=%0d  (L2  - c8 stage)",
                     b5_evict_pa,tstamp);
          end // }
        end // }

      end // if}
    end // for}

  end // }


`endif

end // always}

//==========================================================
// Bank6

always @ (posedge `BENCH_L2T6_GCLK) begin // {

  tstamp = `TOP.core_cycle_cnt - 1;

  //------------------------------
  //  Pipeline signals

`ifdef NO_L2_BNK6
`else
  `ifdef NOL2RTL
  `else

  //------------------------------
  //  L2 RTL Bank6

  b6_pa_c9  <= b6_pa_c8;
  b6_cpx_cid_c9 <= b6_cpx_cid_c8;
  b6_req_c7    <= b6_req_c6;
  b6_req_c8    <= b6_req_c7;

  b6_cam_pa_match_c2  <= b6_cam_pa_match_c1;
  b6_cam_pa_match_c3  <= b6_cam_pa_match_c2;

  b6_stall_c2  <= b6_stall_c1;
  b6_stall_c3  <= b6_stall_c2;
  b6_stall_c4  <= b6_stall_c3;
  b6_stall_c5  <= b6_stall_c4;
  b6_stall_c52 <= b6_stall_c5;
  b6_stall_c6  <= b6_stall_c52;
  b6_stall_c7  <= b6_stall_c6;
  b6_stall_c8  <= b6_stall_c7;
  b6_stall_c9  <= b6_stall_c8;

  b6_ev_pa_c5  <= b6_ev_pa_c4;
  b6_ev_pa_c52 <= b6_ev_pa_c5;
  b6_ev_pa_c6  <= b6_ev_pa_c52;
  b6_ev_pa_c7  <= b6_ev_pa_c6;
  b6_ev_pa_c8  <= b6_ev_pa_c7;

  b6_stc_l2hit_c4  <= b6_stc_l2hit_c3;
  b6_stc_l2hit_c5  <= b6_stc_l2hit_c4;
  b6_stc_l2hit_c52 <= b6_stc_l2hit_c5;
  b6_stc_l2hit_c6  <= b6_stc_l2hit_c52;
  b6_stc_l2hit_c7  <= b6_stc_l2hit_c6;
  b6_stc_l2hit_c8  <= b6_stc_l2hit_c7;

  b6_l2_ctrue_c4  <= b6_l2_ctrue_c3;
  b6_l2_ctrue_c5  <= b6_l2_ctrue_c4;
  b6_l2_ctrue_c52 <= b6_l2_ctrue_c5;
  b6_l2_ctrue_c6  <= b6_l2_ctrue_c52;
  b6_l2_ctrue_c7  <= b6_l2_ctrue_c6;
  b6_l2_ctrue_c8  <= b6_l2_ctrue_c7;

  `endif
`endif

  //----------------------------------------------------------
  //----------------------------------------------------------
  //  Load Data (miss only) (See ldst_lsu.v for Load Data - hit)

`ifdef NO_L2_BNK6
`else

  //------------------------------
  //  L2 Stub or L2 RTL Bank6

  if (b6_load_data_miss && !b6_ldd_suppress) begin // {

    if (`PARGS.nas_check_on && `PARGS.ldst_sync_on && `PARGS.th_check_enable[b6_cpx_tnum]) begin // {
      if (`PARGS.hash_on && (b6_cpx_pa[39]==1'b0)) begin // {
        `PR_INFO ("pli_ldst", `INFO, 
          "C%0d T%0d PLI_MEM_LDDATA tid=%d pa=%h dsrc=%0h                            ts=%0d",
           b6_cpx_cid,b6_cpx_tid,b6_cpx_tnum,`TOP.hashpa(b6_cpx_pa),dsrc,tstamp);
        junk = $sim_send(`PLI_MEM_LD_DATA,b6_cpx_tnum,`TOP.hashpa(b6_cpx_pa),dsrc,tstamp);
      end // }
      else begin //{
        `PR_INFO ("pli_ldst", `INFO, 
          "C%0d T%0d PLI_MEM_LDDATA tid=%d pa=%h dsrc=%0h                            ts=%0d",
           b6_cpx_cid,b6_cpx_tid,b6_cpx_tnum,b6_cpx_pa,dsrc,tstamp);
        junk = $sim_send(`PLI_MEM_LD_DATA,b6_cpx_tnum,b6_cpx_pa,dsrc,tstamp);
      end // }
    end // }
  end // }
  else if (b6_load_data_miss && b6_ldd_suppress) begin // {
    `PR_INFO ("pli_ldst", `INFO, 
              "C%0d T%0d PLI_MEM_LDDATA tid=%d pa=%h  Suppress for IO ASI",b6_cpx_cid,b6_cpx_tid,b6_cpx_tnum,b6_cpx_pa);

  end // }

  //----------------------------------------------------------
  //----------------------------------------------------------
  // Store L2 Commit

  //------------------------------
  //  L2 Stub or L2 RTL Bank6

  if (b6_store_commit && !b6_stc_suppress) begin // {

  b6_stc_vect = get_vect (b6_stc_inv_vect);        

    if (`PARGS.nas_check_on && `PARGS.ldst_sync_on && `PARGS.th_check_enable[b6_cpx_tnum]) begin // {
      if (`PARGS.hash_on && (b6_cpx_pa[39]==1'b0)) begin // {
        `PR_INFO ("pli_ldst", `INFO, 
          "C%0d T%0d PLI_MEM_STCOM  tid=%d pa=%h sz=%h ivect=%h l2hit=%0d      ts=%0d",
           b6_cpx_cid,b6_cpx_tid,b6_cpx_tnum,`TOP.hashpa(b6_cpx_pa),
           b6_stc_size,b6_stc_vect,b6_stc_l2hit,tstamp);
        junk = $sim_send(`PLI_MEM_ST_L2_COMMIT,b6_cpx_tnum,`TOP.hashpa(b6_cpx_pa),
           b6_stc_size,b6_stc_vect,b6_stc_l2hit,tstamp);
      end // }
      else begin //{
        `PR_INFO ("pli_ldst", `INFO, 
          "C%0d T%0d PLI_MEM_STCOM  tid=%d pa=%h sz=%h ivect=%h l2hit=%0d      ts=%0d",
           b6_cpx_cid,b6_cpx_tid,b6_cpx_tnum,b6_cpx_pa,
           b6_stc_size,b6_stc_vect,b6_stc_l2hit,tstamp);
        junk = $sim_send(`PLI_MEM_ST_L2_COMMIT,b6_cpx_tnum,b6_cpx_pa,
           b6_stc_size,b6_stc_vect,b6_stc_l2hit,tstamp);
      end // }
    end // }

  end // }
  else if (b6_store_commit && b6_stc_suppress) begin // {
    `PR_INFO ("pli_ldst", `INFO, 
              "C%0d T%0d PLI_MEM_STCOM  tid=%d pa=%h  Suppress for IO ASI",b6_cpx_cid,b6_cpx_tid,b6_cpx_tnum,b6_cpx_pa);

  end // }

  //----------------------------------------------------------
  //----------------------------------------------------------
  // Evict
  // Note - NCU (bnk8 cannot send evictions)

  //------------------------------
  //  L2 Stub or L2 RTL Bank6

  if (b6_evict) begin // {

    b6_ev_vect0 = b6_ev_invvect[31:0];
    b6_ev_vect1 = b6_ev_invvect[55:32];
    b6_ev_vect2 = b6_ev_invvect[87:56];
    b6_ev_vect3 = b6_ev_invvect[111:88];

    b6_inv_vect[0] = get_vect(b6_ev_vect0);
    b6_inv_vect[1] = get_vect31(b6_ev_vect1);  // different function for odd inval vector
    b6_inv_vect[2] = get_vect(b6_ev_vect2);
    b6_inv_vect[3] = get_vect31(b6_ev_vect3);  // different function for odd inval vector

    for (i=0; i<=3; i=i+1) begin // {

      b6_pa54 = i;
      b6_evict_pa = {b6_ev_pa[39:6],b6_pa54,4'b0};
      b6_evict_inv_vect = b6_inv_vect[i];

      if (b6_inv_vect[i]!=0) begin // {

        if (`PARGS.nas_check_on && `PARGS.ldst_sync_on) begin // {
          if (`PARGS.hash_on && (b6_evict_pa[39]==1'b0)) begin // {
            `PR_INFO ("pli_ldst", `INFO, 
              "      PLI_MEM_EVICT        pa=%h ivect=%h                    ts=%0d",
                                  `TOP.hashpa(b6_evict_pa),b6_evict_inv_vect,tstamp);
            junk = $sim_send(`PLI_MEM_EVICT,`TOP.hashpa(b6_evict_pa),b6_evict_inv_vect,tstamp);
          end // }
          else begin //{
            `PR_INFO ("pli_ldst", `INFO, 
              "      PLI_MEM_EVICT        pa=%h ivect=%h                    ts=%0d",
                                  b6_evict_pa,b6_evict_inv_vect,tstamp);
            junk = $sim_send(`PLI_MEM_EVICT,b6_evict_pa,b6_evict_inv_vect,tstamp);
          end // if}
        end // if}

        if (`PARGS.show_memop_on) begin // {
          if (`PARGS.hash_on && (b6_evict_pa[39]==1'b0)) begin // {
            `PR_NORMAL ("pli_ldst", `NORMAL, 
              "       MEMOP_EVICT       pa=%h  ts=%0d  (L2  - c8 stage)",
                     `TOP.hashpa(b6_evict_pa),tstamp);
          end // }
          else begin //{
            `PR_NORMAL ("pli_ldst", `NORMAL, 
              "      MEMOP_EVICT        pa=%h  ts=%0d  (L2  - c8 stage)",
                     b6_evict_pa,tstamp);
          end // }
        end // }

      end // if}
    end // for}

  end // }


`endif

end // always}

//==========================================================
// Bank7

always @ (posedge `BENCH_L2T7_GCLK) begin // {

  tstamp = `TOP.core_cycle_cnt - 1;

  //------------------------------
  //  Pipeline signals

`ifdef NO_L2_BNK7
`else
  `ifdef NOL2RTL
  `else

  //------------------------------
  //  L2 RTL Bank7

  b7_pa_c9  <= b7_pa_c8;
  b7_cpx_cid_c9 <= b7_cpx_cid_c8;
  b7_req_c7    <= b7_req_c6;
  b7_req_c8    <= b7_req_c7;

  b7_cam_pa_match_c2  <= b7_cam_pa_match_c1;
  b7_cam_pa_match_c3  <= b7_cam_pa_match_c2;

  b7_stall_c2  <= b7_stall_c1;
  b7_stall_c3  <= b7_stall_c2;
  b7_stall_c4  <= b7_stall_c3;
  b7_stall_c5  <= b7_stall_c4;
  b7_stall_c52 <= b7_stall_c5;
  b7_stall_c6  <= b7_stall_c52;
  b7_stall_c7  <= b7_stall_c6;
  b7_stall_c8  <= b7_stall_c7;
  b7_stall_c9  <= b7_stall_c8;

  b7_ev_pa_c5  <= b7_ev_pa_c4;
  b7_ev_pa_c52 <= b7_ev_pa_c5;
  b7_ev_pa_c6  <= b7_ev_pa_c52;
  b7_ev_pa_c7  <= b7_ev_pa_c6;
  b7_ev_pa_c8  <= b7_ev_pa_c7;

  b7_stc_l2hit_c4  <= b7_stc_l2hit_c3;
  b7_stc_l2hit_c5  <= b7_stc_l2hit_c4;
  b7_stc_l2hit_c52 <= b7_stc_l2hit_c5;
  b7_stc_l2hit_c6  <= b7_stc_l2hit_c52;
  b7_stc_l2hit_c7  <= b7_stc_l2hit_c6;
  b7_stc_l2hit_c8  <= b7_stc_l2hit_c7;

  b7_l2_ctrue_c4  <= b7_l2_ctrue_c3;
  b7_l2_ctrue_c5  <= b7_l2_ctrue_c4;
  b7_l2_ctrue_c52 <= b7_l2_ctrue_c5;
  b7_l2_ctrue_c6  <= b7_l2_ctrue_c52;
  b7_l2_ctrue_c7  <= b7_l2_ctrue_c6;
  b7_l2_ctrue_c8  <= b7_l2_ctrue_c7;

  `endif
`endif

  //----------------------------------------------------------
  //----------------------------------------------------------
  //  Load Data (miss only) (See ldst_lsu.v for Load Data - hit)

`ifdef NO_L2_BNK7
`else

  //------------------------------
  //  L2 Stub or L2 RTL Bank7

  if (b7_load_data_miss && !b7_ldd_suppress) begin // {

    if (`PARGS.nas_check_on && `PARGS.ldst_sync_on && `PARGS.th_check_enable[b7_cpx_tnum]) begin // {
      if (`PARGS.hash_on && (b7_cpx_pa[39]==1'b0)) begin // {
        `PR_INFO ("pli_ldst", `INFO, 
          "C%0d T%0d PLI_MEM_LDDATA tid=%d pa=%h dsrc=%0h                            ts=%0d",
           b7_cpx_cid,b7_cpx_tid,b7_cpx_tnum,`TOP.hashpa(b7_cpx_pa),dsrc,tstamp);
        junk = $sim_send(`PLI_MEM_LD_DATA,b7_cpx_tnum,`TOP.hashpa(b7_cpx_pa),dsrc,tstamp);
      end // }
      else begin //{
        `PR_INFO ("pli_ldst", `INFO, 
          "C%0d T%0d PLI_MEM_LDDATA tid=%d pa=%h dsrc=%0h                            ts=%0d",
           b7_cpx_cid,b7_cpx_tid,b7_cpx_tnum,b7_cpx_pa,dsrc,tstamp);
        junk = $sim_send(`PLI_MEM_LD_DATA,b7_cpx_tnum,b7_cpx_pa,dsrc,tstamp);
      end // }
    end // }
  end // }
  else if (b7_load_data_miss && b7_ldd_suppress) begin // {
    `PR_INFO ("pli_ldst", `INFO, 
              "C%0d T%0d PLI_MEM_LDDATA tid=%d pa=%h  Suppress for IO ASI",b7_cpx_cid,b7_cpx_tid,b7_cpx_tnum,b7_cpx_pa);

  end // }

  //----------------------------------------------------------
  //----------------------------------------------------------
  // Store L2 Commit

  //------------------------------
  //  L2 Stub or L2 RTL Bank7

  if (b7_store_commit && !b7_stc_suppress) begin // {

  b7_stc_vect = get_vect (b7_stc_inv_vect);        

    if (`PARGS.nas_check_on && `PARGS.ldst_sync_on && `PARGS.th_check_enable[b7_cpx_tnum]) begin // {
      if (`PARGS.hash_on && (b7_cpx_pa[39]==1'b0)) begin // {
        `PR_INFO ("pli_ldst", `INFO, 
          "C%0d T%0d PLI_MEM_STCOM  tid=%d pa=%h sz=%h ivect=%h l2hit=%0d      ts=%0d",
           b7_cpx_cid,b7_cpx_tid,b7_cpx_tnum,`TOP.hashpa(b7_cpx_pa),
           b7_stc_size,b7_stc_vect,b7_stc_l2hit,tstamp);
        junk = $sim_send(`PLI_MEM_ST_L2_COMMIT,b7_cpx_tnum,`TOP.hashpa(b7_cpx_pa),
           b7_stc_size,b7_stc_vect,b7_stc_l2hit,tstamp);
      end // }
      else begin //{
        `PR_INFO ("pli_ldst", `INFO, 
          "C%0d T%0d PLI_MEM_STCOM  tid=%d pa=%h sz=%h ivect=%h l2hit=%0d      ts=%0d",
           b7_cpx_cid,b7_cpx_tid,b7_cpx_tnum,b7_cpx_pa,
           b7_stc_size,b7_stc_vect,b7_stc_l2hit,tstamp);
        junk = $sim_send(`PLI_MEM_ST_L2_COMMIT,b7_cpx_tnum,b7_cpx_pa,
           b7_stc_size,b7_stc_vect,b7_stc_l2hit,tstamp);
      end // }
    end // }

  end // }
  else if (b7_store_commit && b7_stc_suppress) begin // {
    `PR_INFO ("pli_ldst", `INFO, 
              "C%0d T%0d PLI_MEM_STCOM  tid=%d pa=%h  Suppress for IO ASI",b7_cpx_cid,b7_cpx_tid,b7_cpx_tnum,b7_cpx_pa);

  end // }

  //----------------------------------------------------------
  //----------------------------------------------------------
  // Evict
  // Note - NCU (bnk8 cannot send evictions)

  //------------------------------
  //  L2 Stub or L2 RTL Bank7

  if (b7_evict) begin // {

    b7_ev_vect0 = b7_ev_invvect[31:0];
    b7_ev_vect1 = b7_ev_invvect[55:32];
    b7_ev_vect2 = b7_ev_invvect[87:56];
    b7_ev_vect3 = b7_ev_invvect[111:88];

    b7_inv_vect[0] = get_vect(b7_ev_vect0);
    b7_inv_vect[1] = get_vect31(b7_ev_vect1);  // different function for odd inval vector
    b7_inv_vect[2] = get_vect(b7_ev_vect2);
    b7_inv_vect[3] = get_vect31(b7_ev_vect3);  // different function for odd inval vector

    for (i=0; i<=3; i=i+1) begin // {

      b7_pa54 = i;
      b7_evict_pa = {b7_ev_pa[39:6],b7_pa54,4'b0};
      b7_evict_inv_vect = b7_inv_vect[i];

      if (b7_inv_vect[i]!=0) begin // {

        if (`PARGS.nas_check_on && `PARGS.ldst_sync_on) begin // {
          if (`PARGS.hash_on && (b7_evict_pa[39]==1'b0)) begin // {
            `PR_INFO ("pli_ldst", `INFO, 
              "      PLI_MEM_EVICT        pa=%h ivect=%h                    ts=%0d",
                                  `TOP.hashpa(b7_evict_pa),b7_evict_inv_vect,tstamp);
            junk = $sim_send(`PLI_MEM_EVICT,`TOP.hashpa(b7_evict_pa),b7_evict_inv_vect,tstamp);
          end // }
          else begin //{
            `PR_INFO ("pli_ldst", `INFO, 
              "      PLI_MEM_EVICT        pa=%h ivect=%h                    ts=%0d",
                                  b7_evict_pa,b7_evict_inv_vect,tstamp);
            junk = $sim_send(`PLI_MEM_EVICT,b7_evict_pa,b7_evict_inv_vect,tstamp);
          end // if}
        end // if}

        if (`PARGS.show_memop_on) begin // {
          if (`PARGS.hash_on && (b7_evict_pa[39]==1'b0)) begin // {
            `PR_NORMAL ("pli_ldst", `NORMAL, 
              "       MEMOP_EVICT       pa=%h  ts=%0d  (L2  - c8 stage)",
                     `TOP.hashpa(b7_evict_pa),tstamp);
          end // }
          else begin //{
            `PR_NORMAL ("pli_ldst", `NORMAL, 
              "      MEMOP_EVICT        pa=%h  ts=%0d  (L2  - c8 stage)",
                     b7_evict_pa,tstamp);
          end // }
        end // }

      end // if}
    end // for}

  end // }


`endif

end // always}

//==========================================================
// Bank8

always @ (posedge `BENCH_NCU_GCLK) begin // {

  tstamp = `TOP.core_cycle_cnt - 1;

  //----------------------------------------------------------
  //----------------------------------------------------------
  //  Load Data (miss only) (See ldst_lsu.v for Load Data - hit)

`ifdef NO_L2_BNK8
`else

  //------------------------------
  //  L2 Stub or L2 RTL Bank8

  if (b8_load_data_miss && !b8_ldd_suppress) begin // {

    if (`PARGS.nas_check_on && `PARGS.ldst_sync_on && `PARGS.th_check_enable[b8_cpx_tnum]) begin // {
      if (`PARGS.hash_on && (b8_cpx_pa[39]==1'b0)) begin // {
        `PR_INFO ("pli_ldst", `INFO, 
          "C%0d T%0d PLI_MEM_LDDATA tid=%d pa=%h dsrc=%0h                            ts=%0d",
           b8_cpx_cid,b8_cpx_tid,b8_cpx_tnum,`TOP.hashpa(b8_cpx_pa),dsrc,tstamp);
        junk = $sim_send(`PLI_MEM_LD_DATA,b8_cpx_tnum,`TOP.hashpa(b8_cpx_pa),dsrc,tstamp);
      end // }
      else begin //{
        `PR_INFO ("pli_ldst", `INFO, 
          "C%0d T%0d PLI_MEM_LDDATA tid=%d pa=%h dsrc=%0h                            ts=%0d",
           b8_cpx_cid,b8_cpx_tid,b8_cpx_tnum,b8_cpx_pa,dsrc,tstamp);
        junk = $sim_send(`PLI_MEM_LD_DATA,b8_cpx_tnum,b8_cpx_pa,dsrc,tstamp);
      end // }
    end // }
  end // }
  else if (b8_load_data_miss && b8_ldd_suppress) begin // {
    `PR_INFO ("pli_ldst", `INFO, 
              "C%0d T%0d PLI_MEM_LDDATA tid=%d pa=%h  Suppress for IO ASI",b8_cpx_cid,b8_cpx_tid,b8_cpx_tnum,b8_cpx_pa);

  end // }

  //----------------------------------------------------------
  //----------------------------------------------------------
  // Store L2 Commit

  //------------------------------
  //  L2 Stub or L2 RTL Bank8

  if (b8_store_commit && !b8_stc_suppress) begin // {

  b8_stc_vect = get_vect (b8_stc_inv_vect);        

    if (`PARGS.nas_check_on && `PARGS.ldst_sync_on && `PARGS.th_check_enable[b8_cpx_tnum]) begin // {
      if (`PARGS.hash_on && (b8_cpx_pa[39]==1'b0)) begin // {
        `PR_INFO ("pli_ldst", `INFO, 
          "C%0d T%0d PLI_MEM_STCOM  tid=%d pa=%h sz=%h ivect=%h l2hit=%0d      ts=%0d",
           b8_cpx_cid,b8_cpx_tid,b8_cpx_tnum,`TOP.hashpa(b8_cpx_pa),
           b8_stc_size,b8_stc_vect,b8_stc_l2hit,tstamp);
        junk = $sim_send(`PLI_MEM_ST_L2_COMMIT,b8_cpx_tnum,`TOP.hashpa(b8_cpx_pa),
           b8_stc_size,b8_stc_vect,b8_stc_l2hit,tstamp);
      end // }
      else begin //{
        `PR_INFO ("pli_ldst", `INFO, 
          "C%0d T%0d PLI_MEM_STCOM  tid=%d pa=%h sz=%h ivect=%h l2hit=%0d      ts=%0d",
           b8_cpx_cid,b8_cpx_tid,b8_cpx_tnum,b8_cpx_pa,
           b8_stc_size,b8_stc_vect,b8_stc_l2hit,tstamp);
        junk = $sim_send(`PLI_MEM_ST_L2_COMMIT,b8_cpx_tnum,b8_cpx_pa,
           b8_stc_size,b8_stc_vect,b8_stc_l2hit,tstamp);
      end // }
    end // }

  end // }
  else if (b8_store_commit && b8_stc_suppress) begin // {
    `PR_INFO ("pli_ldst", `INFO, 
              "C%0d T%0d PLI_MEM_STCOM  tid=%d pa=%h  Suppress for IO ASI",b8_cpx_cid,b8_cpx_tid,b8_cpx_tnum,b8_cpx_pa);

  end // }

  //----------------------------------------------------------
  //----------------------------------------------------------
  // Evict
  // Note - NCU (bnk8 cannot send evictions)

  //------------------------------
  //  L2 Stub or L2 RTL Bank8

  if (b8_evict) begin // {

    b8_ev_vect0 = b8_ev_invvect[31:0];
    b8_ev_vect1 = b8_ev_invvect[55:32];
    b8_ev_vect2 = b8_ev_invvect[87:56];
    b8_ev_vect3 = b8_ev_invvect[111:88];

    b8_inv_vect[0] = get_vect(b8_ev_vect0);
    b8_inv_vect[1] = get_vect31(b8_ev_vect1);  // different function for odd inval vector
    b8_inv_vect[2] = get_vect(b8_ev_vect2);
    b8_inv_vect[3] = get_vect31(b8_ev_vect3);  // different function for odd inval vector

    for (i=0; i<=3; i=i+1) begin // {

      b8_pa54 = i;
      b8_evict_pa = {b8_ev_pa[39:6],b8_pa54,4'b0};
      b8_evict_inv_vect = b8_inv_vect[i];

      if (b8_inv_vect[i]!=0) begin // {

        if (`PARGS.nas_check_on && `PARGS.ldst_sync_on) begin // {
          if (`PARGS.hash_on && (b8_evict_pa[39]==1'b0)) begin // {
            `PR_INFO ("pli_ldst", `INFO, 
              "      PLI_MEM_EVICT        pa=%h ivect=%h                    ts=%0d",
                                  `TOP.hashpa(b8_evict_pa),b8_evict_inv_vect,tstamp);
            junk = $sim_send(`PLI_MEM_EVICT,`TOP.hashpa(b8_evict_pa),b8_evict_inv_vect,tstamp);
          end // }
          else begin //{
            `PR_INFO ("pli_ldst", `INFO, 
              "      PLI_MEM_EVICT        pa=%h ivect=%h                    ts=%0d",
                                  b8_evict_pa,b8_evict_inv_vect,tstamp);
            junk = $sim_send(`PLI_MEM_EVICT,b8_evict_pa,b8_evict_inv_vect,tstamp);
          end // if}
        end // if}

        if (`PARGS.show_memop_on) begin // {
          if (`PARGS.hash_on && (b8_evict_pa[39]==1'b0)) begin // {
            `PR_NORMAL ("pli_ldst", `NORMAL, 
              "       MEMOP_EVICT       pa=%h  ts=%0d  (L2  - c8 stage)",
                     `TOP.hashpa(b8_evict_pa),tstamp);
          end // }
          else begin //{
            `PR_NORMAL ("pli_ldst", `NORMAL, 
              "      MEMOP_EVICT        pa=%h  ts=%0d  (L2  - c8 stage)",
                     b8_evict_pa,tstamp);
          end // }
        end // }

      end // if}
    end // for}

  end // }


`endif

end // always}

//----------------------------------------------------------
// Return inv_vector (argument for PLI msg) from inval.vector in CPX response pkt
function [31:0] get_vect;
  input [31:0] inv_vect;
  begin
  // Vector is 32 bits to support 32 cores (for future chips).  N2 only has 8 cores.
  get_vect     = {24'b0,
                  (inv_vect[`CPX_D_INV7]==2'b10),
                  (inv_vect[`CPX_D_INV6]==2'b10),
                  (inv_vect[`CPX_D_INV5]==2'b10),
                  (inv_vect[`CPX_D_INV4]==2'b10),
                  (inv_vect[`CPX_D_INV3]==2'b10),
                  (inv_vect[`CPX_D_INV2]==2'b10),
                  (inv_vect[`CPX_D_INV1]==2'b10),
                  (inv_vect[`CPX_D_INV0]==2'b10)
                 };
  end
endfunction

//----------------------------------------------------------
// Return inv_vector (argument for PLI msg) from inval.vector in CPX response pkt
// Note: inval.vector addr[5:4]=3|1 from eviction invalidation pkt has different
//  format than addr[5:4]=2|0.
function [31:0] get_vect31;
  input [23:0] inv_vect;
  begin
  // Vector is 32 bits to support 32 cores (for future chips).  N2 only has 8 cores.
  get_vect31   = {24'b0,
                  (inv_vect[`CPX_D_INV7_ALT]==1'b1),
                  (inv_vect[`CPX_D_INV6_ALT]==1'b1),
                  (inv_vect[`CPX_D_INV5_ALT]==1'b1),
                  (inv_vect[`CPX_D_INV4_ALT]==1'b1),
                  (inv_vect[`CPX_D_INV3_ALT]==1'b1),
                  (inv_vect[`CPX_D_INV2_ALT]==1'b1),
                  (inv_vect[`CPX_D_INV1_ALT]==1'b1),
                  (inv_vect[`CPX_D_INV0_ALT]==1'b1)
                 };
  end
endfunction


//----------------------------------------------------------
`endif
endmodule

//----------------------------------------------------------
//----------------------------------------------------------
