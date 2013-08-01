// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: itlb_wr.v
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
`ifdef CORE_0

module itlb_wr_c0 ();
`ifndef GATESIM

`include "tlb_sync.vh"
`include "nas.vh"
parameter NUM_TLB=64;

wire                    [7:0] data_in;
wire                    [7:0] tlb_wr;
wire                          wr_en;
wire                    [7:0] entry;
wire                    [3:0] demap;
reg                     [3:0] demap_1;
wire                          demap_page;
wire                          demap_context;
wire                          demap_real;
wire                          demap_all;
wire                          skip_demap;
wire                          demap_active;
wire                          auto_demap;
wire                    [2:0] demap_tid;
reg                     [2:0] demap_tid_1;
reg                     [5:0] demap_tnum_1;
wire                    [7:0] asi_wr_itlb;
wire                    [7:0] asi_wr_itlb_demap;
wire                    [7:0] asi_wr_itlb_data_in;
wire                    [7:0] asi_wr_itlb_data_access;

reg         [(`TS_WIDTH-1):0] tstamp;
reg                     [7:0] data_in_ready;
reg                           hwtw;
reg         [(`TS_WIDTH-1):0] demap_tstamp;

reg                     [2:0] mytid;
reg                     [5:0] mytnum;
wire                    [2:0] mycid;
integer                       junk;
integer                       i;
reg                     [7:0] cnt;
wire                          ready;

assign   mycid = 0;

//----------------------------------------------------------
// Instantiate fifo - 1 entry per thread
fifo fifo ();
// Define fifo parameters
defparam fifo.ENTRY_BITS = 4;  // {hwtw,tid[2:0]}
defparam fifo.DEPTH      = 9;  // 1 extra entry for overflow detection
defparam fifo.PTR_BITS   = 4;

//----------------------------------------------------------
// DUT probes

assign   data_in = `SPC0.mmu.asi.htc_wr_itlb_data_in;
assign   tlb_wr = `PROBES0.itlb_wr;
assign   wr_en = `SPC0.ifu_ftu.ftu_itb_cust.tlb_wr_1_in_dout;

assign   entry = `SPC0.ifu_ftu.ftu_itb_cust.rw_index_1[5:0];

assign   demap_page = `SPC0.ifu_ftu.ftu_itc_ctl.itc_demap_page;
assign   demap_context = `SPC0.ifu_ftu.itc_demap_context;
assign   demap_real = `SPC0.ifu_ftu.itc_demap_real;
assign   demap_all = `SPC0.ifu_ftu.itc_demap_all;
assign   demap = {demap_all,demap_page,demap_context,demap_real};
assign   skip_demap = `SPC0.ifu_ftu.itc_wr_u_en;
assign   demap_tid = `SPC0.ifu_ftu.ftu_itd_dp.tte1[37:35];

// if (|demap_1 && skip_demap ), then Implicit demap so don't send to NAS
assign   demap_active = |demap_1 && !skip_demap;
assign   auto_demap   = |demap_1 && skip_demap;


// Signals that are early indication that TLBWRITE or TLBWRITE(demap) will happen.
// Once these signals assert, the write to the TLB cannot be cancelled.
// These signals assert before the MMU reorders the TLB writes.
// Use these to suppress SSTEP in nas_pipe.
// Best case, these signals assert 1 cycle after the previous SSTEP.
assign   asi_wr_itlb_demap             = `SPC0.mmu.asi_wr_immu_demap;
assign   asi_wr_itlb_data_in      = `SPC0.mmu.asi_wr_itlb_data_in;
assign   asi_wr_itlb_data_access  = {`SPC0.mmu.asd1.asi_wr_itlb_data_access,
                                     `SPC0.mmu.asd0.asi_wr_itlb_data_access};
assign   asi_wr_itlb = asi_wr_itlb_demap | asi_wr_itlb_data_in | asi_wr_itlb_data_access;

//---------------------
// Probes for debugging

// defines copied from :/libs/n2sram/tlbs/tlbs/n2_tlb_tl_64x59_cust_l/n2_tlb_tl_64x59_cust/rtl

// n2_tlb_tl_64x59_cam.sv

`define CNTX1_HI 65
`define CNTX1_LO 53
`define PID_HI   52
`define PID_LO   50
`define REAL_BIT 49
`define VA_47    48
`define VA_28    29
`define VA_27    28
`define VA_22    23
`define TTE_VALID 22 
`define VA_21    21
`define VA_16    16
`define VA_15    15 
`define VA_13    13
`define CNTX0_HI 12
`define CNTX0_LO  0

// n2_tlb_tl_64x59_ram.sv

`define DATA_PARITY         36
`define DATA_PA_39_28_HI    35
`define DATA_PA_39_28_LO    24
`define DATA_PA_27_22_HI    23
`define DATA_PA_27_22_LO    18
`define DATA_VA_27_22_V     17 
`define DATA_PA_21_16_HI    16
`define DATA_PA_21_16_LO    11
`define DATA_VA_21_16_V     10 
`define DATA_PA_15_13_HI     9
`define DATA_PA_15_13_LO     7
`define DATA_VA_15_13_V      6 
`define DATA_NFO             5 
`define DATA_IE              4 
`define DATA_CP              3 
`define DATA_X               2 
`define DATA_P               1 
`define DATA_W               0 

wire         [(NUM_TLB-1):0] tlb_valid;
wire         [(NUM_TLB-1):0] tlb_match;
wire                         tte_valid;
wire                  [47:0] tte_va;
wire                  [12:0] tte_context;
wire                         tte_real;
wire                   [2:0] tte_pid;
wire                   [2:0] tte_page_mask;
wire                  [39:0] tte_pa;
wire                         tte_nfo;
wire                         tte_ie;
wire                         tte_cp;
wire                         tte_e;
wire                         tte_p;
wire                         tte_w;
wire                         tte_ep;

assign  tlb_valid        = `SPC0.ifu_ftu.ftu_itb_cust.array.cam.valid;
assign  tlb_match        = `SPC0.ifu_ftu.ftu_itb_cust.array.cam.match;

assign  tte_va           =  {`SPC0.ifu_ftu.ftu_itb_cust.tte_tag_1_dout[`VA_47:`VA_28],
                             `SPC0.ifu_ftu.ftu_itb_cust.tte_tag_1_dout[`VA_27:`VA_22],
                             `SPC0.ifu_ftu.ftu_itb_cust.tte_tag_1_dout[`VA_21:`VA_16],
                             `SPC0.ifu_ftu.ftu_itb_cust.tte_tag_1_dout[`VA_15:`VA_13],
                             13'b0
                            };
assign  tte_context      = `SPC0.ifu_ftu.ftu_itb_cust.tte_tag_1_dout[`CNTX1_HI:`CNTX1_LO];
assign  tte_pid          = `SPC0.ifu_ftu.ftu_itb_cust.tte_tag_1_dout[`PID_HI:`PID_LO];
assign  tte_real         = `SPC0.ifu_ftu.ftu_itb_cust.tte_tag_1_dout[`REAL_BIT];
assign  tte_valid        = `SPC0.ifu_ftu.ftu_itb_cust.tte_tag_1_dout[`TTE_VALID];

assign  tte_page_mask    = `SPC0.ifu_ftu.ftu_itb_cust.tte_page_size_mask_1;

assign  tte_pa           = {`SPC0.ifu_ftu.ftu_itb_cust.tte_data_1[`DATA_PA_39_28_HI:`DATA_PA_39_28_LO],
                            `SPC0.ifu_ftu.ftu_itb_cust.tte_data_1[`DATA_PA_27_22_HI:`DATA_PA_27_22_LO],
                            `SPC0.ifu_ftu.ftu_itb_cust.tte_data_1[`DATA_PA_21_16_HI:`DATA_PA_21_16_LO],
                            `SPC0.ifu_ftu.ftu_itb_cust.tte_data_1[`DATA_PA_15_13_HI:`DATA_PA_15_13_LO],
                            13'b0
                           };
assign  tte_nfo          = `SPC0.ifu_ftu.ftu_itb_cust.tte_data_1[`DATA_NFO];
assign  tte_ie           = `SPC0.ifu_ftu.ftu_itb_cust.tte_data_1[`DATA_IE];
assign  tte_cp           = `SPC0.ifu_ftu.ftu_itb_cust.tte_data_1[`DATA_CP];
assign  tte_e            = `SPC0.ifu_ftu.ftu_itb_cust.tte_data_1[`DATA_X];
assign  tte_p            = `SPC0.ifu_ftu.ftu_itb_cust.tte_data_1[`DATA_P];
assign  tte_w            = `SPC0.ifu_ftu.ftu_itb_cust.tte_data_1[`DATA_W];
assign  tte_ep           = 1'b1;  // not stored in array, but implied as 1

assign ready = `PARGS.tlb_sync_on & !`SPC0.tcu_spc_mbist_start;

//----------------------------------------------------------
initial  begin // {
  #1;
  hwtw = 1'b0;
  data_in_ready = 8'b0;
  @ (posedge `SPC0.l2clk);
end // }

//----------------------------------------------------------
// Must use negedge to avoid race condition
// tlb_replacement_index (aka entry) is created in always block using blocking assignments

always @ (negedge (`SPC0.l2clk & ready)) begin // {

  tstamp = `TOP.core_cycle_cnt;
  demap_tstamp = `TOP.core_cycle_cnt;

  // Delay by 1 cycle to align with skip_demap
  demap_tid_1  <= demap_tid;  // demap_tid is active when demap is asserted
  demap_tnum_1 <= (mycid * 8) + demap_tid;
  demap_1      <= demap;

  // Signal to nas_pipe to suppress SSTEP
  if (asi_wr_itlb!=8'b0) begin //
    for (i=0;i<=7;i=i+1) begin // {
      if (asi_wr_itlb[i])  begin //
        `PR_INFO ("pli_nas", `INFO, "   C%0d T%0d PLI_SSTEP     tid=%d ts=%0d                 (tlb_sync: suppress sstep. sstep_sent=1)",
                       mycid,i,((mycid * 6'h8) + i[2:0]),tstamp);
        `NASTOP.sstep_sent[(mycid * 8) + i] <= 1'b1;      // suppress SSTEP
      end // }
    end // }
  end // }
 
  //----------------------------------------------------------
  //  Send I/DTLBWRITE due to demap
  //

  if ((demap!=0) && (demap_1!=0)) begin // {
    `PR_ERROR ("tlb_sync", `ERROR, 
       "C%0d T%0d Illegal Back to Back ITLB demap",
        mycid,demap_tid_1);
  end // }

  if (demap_active) begin // {
    fifo.pop_fifo ({hwtw,mytid});
    if (`PARGS.nas_check_on && `PARGS.tlb_sync_on) begin // {
        `PR_INFO ("pli_tlb", `INFO, "   C%0d T%0d PLI_ITLBWRITE tid=%d ts=%0d entry=%h (demap)",
                   mycid,demap_tid_1,demap_tnum_1,demap_tstamp,8'hff);
        `PR_INFO ("pli_nas", `INFO, "   C%0d T%0d PLI_SSTEP     tid=%d ts=%0d                 (tlb_sync: send SSTEP)",
                   mycid,demap_tid_1,demap_tnum_1,tstamp);
        junk = $sim_send(`PLI_ITLBWRITE, demap_tnum_1,demap_tstamp,8'hff);
        junk = $sim_send(`PLI_SSTEP, demap_tnum_1);

        // Check to see if sstep was sent early
        if (`NASTOP.sstep_sent[demap_tnum_1]==1) begin // {
          `NASTOP.sstep_early[demap_tnum_1] <= 1'b1;  // SSTEP was sent before nas_pipe capture
        end //}
    end //}
  end //}

  //--------------------
  if (`PARGS.show_tlb_on & (|demap_1)) begin // {
    $write ("SHOW_TLB: ITLB_DEMAP C%0d T%0d ",mycid,demap_tid_1);

    if (demap_active) begin
      case (demap_1)
      4'b0001:  $write ("type=real ");
      4'b0010:  $write ("type=cntx ");
      4'b0100:  $write ("type=page ");
      4'b1000:  $write ("type=all  ");
      default:
          `PR_ERROR ("tlb_sync", `ERROR, 
            "Bench Problem - demap_1(%b) should be one-hot.",demap_1);
      endcase
    end
    else begin
     $write("type=autodemap ");
    end

    $display ("match=%h                               ts=%0d",
                tlb_match,demap_tstamp*`TOP.core_period);

    for (cnt=0; cnt<=NUM_TLB; cnt=cnt+1) begin // {
      if (tlb_match[cnt]==1'b1)  begin // {
        $display ("SHOW_TLB: ITLB_DEMAP C%0d T%0d entry=%h V=0                                                   ts=%0d",
                    mycid,demap_tid_1,cnt,demap_tstamp*`TOP.core_period);
      end // }
    end // }

  end // }

  //----------------------------------------------------------
  //  Send I/DHWTW     due to HWTW
  //  Send I/DTLBWRITE due to ASI write

  // There are 3 main signals to watch for TLBWRITE (data_in, tlb_wr, wr_en)
  // These signals will be interleaved between the threads.
  // Need to queue up the signals over time so they can be processed in order.
  // Each thread will only be doing 1 thing at a time.

  if ((tlb_wr!=8'b0) || (data_in!=8'b0)) begin // {

    for (i=0;i<=7;i=i+1) begin // {

      if ((data_in[i])&&(tlb_wr[i])) begin // {
          `PR_ERROR ("tlb_sync", `ERROR, 
            "Bad Inputs - iwr_data_in & iwr_tlb_wr should not be asserted at same time");
      end // }
      else begin  // {

        // data_in[tid] determines if the write is HWTW or TLBWRITE
        if (data_in[i]) begin // {
          data_in_ready[i] <= 1'b1;
        end // }

        // tlb_wr[tid] determines which thread will write next
        // Use fifo to save the tids of the tlb_wr signals in order
        if (tlb_wr[i]) begin // {
          if (data_in_ready[i]) begin // {
            fifo.push_fifo ({1'b1,i[2:0]}); //  {hwtw,tid[2:0]}
            data_in_ready[i] <= 1'b0;
          end // }
          else begin // {
            fifo.push_fifo ({1'b0,i[2:0]}); //  {!hwtw,tid[2:0]}
          end // }
        end // }

      end // if}
    end // for}

  end // if}

  //----------------------------------------------------------
  // wr_en means that the write is occurring
  if (wr_en) begin // {
    fifo.pop_fifo ({hwtw,mytid});
    mytnum = (mycid * 8) + mytid;

    if (hwtw) begin // { 
       if (`PARGS.nas_check_on && `PARGS.tlb_sync_on) begin // {
           `PR_INFO ("pli_tlb", `INFO, "   C%0d T%0d PLI_IHWTW     tid=%d ts=%0d va=%h entry=%h",
                      mycid,mytid,mytnum,tstamp,tte_va,entry);
            junk = $sim_send(`PLI_IHWTW, mytnum, tstamp,tte_va,entry);

       end //}
    end // }
    else begin // {
      if (`PARGS.nas_check_on && `PARGS.tlb_sync_on) begin // {
           `PR_INFO ("pli_tlb", `INFO, "   C%0d T%0d PLI_ITLBWRITE tid=%d ts=%0d entry=%h",
                      mycid,mytid,mytnum,tstamp,entry);
           `PR_INFO ("pli_nas", `INFO, "   C%0d T%0d PLI_SSTEP     tid=%d ts=%0d                 (tlb_sync: send SSTEP)",
                      mycid,mytid,mytnum,tstamp);
           junk = $sim_send(`PLI_ITLBWRITE, mytnum,tstamp,entry);
           junk = $sim_send(`PLI_SSTEP, mytnum);

           // Check to see if sstep was sent early
           if (`NASTOP.sstep_sent[mytnum]==1) begin // {
             `NASTOP.sstep_early[mytnum] <= 1'b1;  // SSTEP was sent before nas_pipe capture
           end //}
      end //}
    end // }

    //--------------------
    if (`PARGS.show_tlb_on) begin // {
      $write ("SHOW_TLB: ITLB_WRITE C%0d T%0d ",mycid,mytid);

      if (tte_real==0) $write ("entry=%h V=%b VA=%h ",entry,tte_valid,tte_va);
      else             $write ("entry=%h V=%b RA=%h ",entry,tte_valid,tte_va);

      case (tte_page_mask)
      3'b000: $write("R=%b CNTX=%h PID=%h sz=8k         ts=%0d",
                         tte_real,tte_context,tte_pid,tstamp*`TOP.core_period);
      3'b001: $write("R=%b CNTX=%h PID=%h sz=64k        ts=%0d",
                         tte_real,tte_context,tte_pid,tstamp*`TOP.core_period);
      3'b011: $write("R=%b CNTX=%h PID=%h sz=4MB        ts=%0d",
                         tte_real,tte_context,tte_pid,tstamp*`TOP.core_period);
      3'b111: $write("R=%b CNTX=%h PID=%h sz=256MB      ts=%0d",
                         tte_real,tte_context,tte_pid,tstamp*`TOP.core_period);
      endcase

      if (hwtw) $display ("  (hwtw)");
      else      $display ("");

      $write ("SHOW_TLB: ITLB_WRITE C%0d T%0d ",mycid,mytid);

      $display ("             PA=00%h P=%b IE=%b CP=%b NFO=%b E=%b EP=%b W=%b  ts=%0d",
                  tte_pa,tte_p,tte_ie,tte_cp,tte_nfo,tte_e,tte_ep,tte_w,tstamp*`TOP.core_period); 
    end // }
    //--------------------

  end // }

end // always}

//----------------------------------------------------------
`endif
endmodule

`endif
`ifdef CORE_1

module itlb_wr_c1 ();
`ifndef GATESIM

`include "tlb_sync.vh"
`include "nas.vh"
parameter NUM_TLB=64;

wire                    [7:0] data_in;
wire                    [7:0] tlb_wr;
wire                          wr_en;
wire                    [7:0] entry;
wire                    [3:0] demap;
reg                     [3:0] demap_1;
wire                          demap_page;
wire                          demap_context;
wire                          demap_real;
wire                          demap_all;
wire                          skip_demap;
wire                          demap_active;
wire                          auto_demap;
wire                    [2:0] demap_tid;
reg                     [2:0] demap_tid_1;
reg                     [5:0] demap_tnum_1;
wire                    [7:0] asi_wr_itlb;
wire                    [7:0] asi_wr_itlb_demap;
wire                    [7:0] asi_wr_itlb_data_in;
wire                    [7:0] asi_wr_itlb_data_access;

reg         [(`TS_WIDTH-1):0] tstamp;
reg                     [7:0] data_in_ready;
reg                           hwtw;
reg         [(`TS_WIDTH-1):0] demap_tstamp;

reg                     [2:0] mytid;
reg                     [5:0] mytnum;
wire                    [2:0] mycid;
integer                       junk;
integer                       i;
reg                     [7:0] cnt;
wire                          ready;

assign   mycid = 1;

//----------------------------------------------------------
// Instantiate fifo - 1 entry per thread
fifo fifo ();
// Define fifo parameters
defparam fifo.ENTRY_BITS = 4;  // {hwtw,tid[2:0]}
defparam fifo.DEPTH      = 9;  // 1 extra entry for overflow detection
defparam fifo.PTR_BITS   = 4;

//----------------------------------------------------------
// DUT probes

assign   data_in = `SPC1.mmu.asi.htc_wr_itlb_data_in;
assign   tlb_wr = `PROBES1.itlb_wr;
assign   wr_en = `SPC1.ifu_ftu.ftu_itb_cust.tlb_wr_1_in_dout;

assign   entry = `SPC1.ifu_ftu.ftu_itb_cust.rw_index_1[5:0];

assign   demap_page = `SPC1.ifu_ftu.ftu_itc_ctl.itc_demap_page;
assign   demap_context = `SPC1.ifu_ftu.itc_demap_context;
assign   demap_real = `SPC1.ifu_ftu.itc_demap_real;
assign   demap_all = `SPC1.ifu_ftu.itc_demap_all;
assign   demap = {demap_all,demap_page,demap_context,demap_real};
assign   skip_demap = `SPC1.ifu_ftu.itc_wr_u_en;
assign   demap_tid = `SPC1.ifu_ftu.ftu_itd_dp.tte1[37:35];

// if (|demap_1 && skip_demap ), then Implicit demap so don't send to NAS
assign   demap_active = |demap_1 && !skip_demap;
assign   auto_demap   = |demap_1 && skip_demap;


// Signals that are early indication that TLBWRITE or TLBWRITE(demap) will happen.
// Once these signals assert, the write to the TLB cannot be cancelled.
// These signals assert before the MMU reorders the TLB writes.
// Use these to suppress SSTEP in nas_pipe.
// Best case, these signals assert 1 cycle after the previous SSTEP.
assign   asi_wr_itlb_demap             = `SPC1.mmu.asi_wr_immu_demap;
assign   asi_wr_itlb_data_in      = `SPC1.mmu.asi_wr_itlb_data_in;
assign   asi_wr_itlb_data_access  = {`SPC1.mmu.asd1.asi_wr_itlb_data_access,
                                     `SPC1.mmu.asd0.asi_wr_itlb_data_access};
assign   asi_wr_itlb = asi_wr_itlb_demap | asi_wr_itlb_data_in | asi_wr_itlb_data_access;

//---------------------
// Probes for debugging

// defines copied from :/libs/n2sram/tlbs/tlbs/n2_tlb_tl_64x59_cust_l/n2_tlb_tl_64x59_cust/rtl

// n2_tlb_tl_64x59_cam.sv

`define CNTX1_HI 65
`define CNTX1_LO 53
`define PID_HI   52
`define PID_LO   50
`define REAL_BIT 49
`define VA_47    48
`define VA_28    29
`define VA_27    28
`define VA_22    23
`define TTE_VALID 22 
`define VA_21    21
`define VA_16    16
`define VA_15    15 
`define VA_13    13
`define CNTX0_HI 12
`define CNTX0_LO  0

// n2_tlb_tl_64x59_ram.sv

`define DATA_PARITY         36
`define DATA_PA_39_28_HI    35
`define DATA_PA_39_28_LO    24
`define DATA_PA_27_22_HI    23
`define DATA_PA_27_22_LO    18
`define DATA_VA_27_22_V     17 
`define DATA_PA_21_16_HI    16
`define DATA_PA_21_16_LO    11
`define DATA_VA_21_16_V     10 
`define DATA_PA_15_13_HI     9
`define DATA_PA_15_13_LO     7
`define DATA_VA_15_13_V      6 
`define DATA_NFO             5 
`define DATA_IE              4 
`define DATA_CP              3 
`define DATA_X               2 
`define DATA_P               1 
`define DATA_W               0 

wire         [(NUM_TLB-1):0] tlb_valid;
wire         [(NUM_TLB-1):0] tlb_match;
wire                         tte_valid;
wire                  [47:0] tte_va;
wire                  [12:0] tte_context;
wire                         tte_real;
wire                   [2:0] tte_pid;
wire                   [2:0] tte_page_mask;
wire                  [39:0] tte_pa;
wire                         tte_nfo;
wire                         tte_ie;
wire                         tte_cp;
wire                         tte_e;
wire                         tte_p;
wire                         tte_w;
wire                         tte_ep;

assign  tlb_valid        = `SPC1.ifu_ftu.ftu_itb_cust.array.cam.valid;
assign  tlb_match        = `SPC1.ifu_ftu.ftu_itb_cust.array.cam.match;

assign  tte_va           =  {`SPC1.ifu_ftu.ftu_itb_cust.tte_tag_1_dout[`VA_47:`VA_28],
                             `SPC1.ifu_ftu.ftu_itb_cust.tte_tag_1_dout[`VA_27:`VA_22],
                             `SPC1.ifu_ftu.ftu_itb_cust.tte_tag_1_dout[`VA_21:`VA_16],
                             `SPC1.ifu_ftu.ftu_itb_cust.tte_tag_1_dout[`VA_15:`VA_13],
                             13'b0
                            };
assign  tte_context      = `SPC1.ifu_ftu.ftu_itb_cust.tte_tag_1_dout[`CNTX1_HI:`CNTX1_LO];
assign  tte_pid          = `SPC1.ifu_ftu.ftu_itb_cust.tte_tag_1_dout[`PID_HI:`PID_LO];
assign  tte_real         = `SPC1.ifu_ftu.ftu_itb_cust.tte_tag_1_dout[`REAL_BIT];
assign  tte_valid        = `SPC1.ifu_ftu.ftu_itb_cust.tte_tag_1_dout[`TTE_VALID];

assign  tte_page_mask    = `SPC1.ifu_ftu.ftu_itb_cust.tte_page_size_mask_1;

assign  tte_pa           = {`SPC1.ifu_ftu.ftu_itb_cust.tte_data_1[`DATA_PA_39_28_HI:`DATA_PA_39_28_LO],
                            `SPC1.ifu_ftu.ftu_itb_cust.tte_data_1[`DATA_PA_27_22_HI:`DATA_PA_27_22_LO],
                            `SPC1.ifu_ftu.ftu_itb_cust.tte_data_1[`DATA_PA_21_16_HI:`DATA_PA_21_16_LO],
                            `SPC1.ifu_ftu.ftu_itb_cust.tte_data_1[`DATA_PA_15_13_HI:`DATA_PA_15_13_LO],
                            13'b0
                           };
assign  tte_nfo          = `SPC1.ifu_ftu.ftu_itb_cust.tte_data_1[`DATA_NFO];
assign  tte_ie           = `SPC1.ifu_ftu.ftu_itb_cust.tte_data_1[`DATA_IE];
assign  tte_cp           = `SPC1.ifu_ftu.ftu_itb_cust.tte_data_1[`DATA_CP];
assign  tte_e            = `SPC1.ifu_ftu.ftu_itb_cust.tte_data_1[`DATA_X];
assign  tte_p            = `SPC1.ifu_ftu.ftu_itb_cust.tte_data_1[`DATA_P];
assign  tte_w            = `SPC1.ifu_ftu.ftu_itb_cust.tte_data_1[`DATA_W];
assign  tte_ep           = 1'b1;  // not stored in array, but implied as 1

assign ready = `PARGS.tlb_sync_on & !`SPC1.tcu_spc_mbist_start;

//----------------------------------------------------------
initial  begin // {
  #1;
  hwtw = 1'b0;
  data_in_ready = 8'b0;
  @ (posedge `SPC1.l2clk);
end // }

//----------------------------------------------------------
// Must use negedge to avoid race condition
// tlb_replacement_index (aka entry) is created in always block using blocking assignments

always @ (negedge (`SPC1.l2clk & ready)) begin // {

  tstamp = `TOP.core_cycle_cnt;
  demap_tstamp = `TOP.core_cycle_cnt;

  // Delay by 1 cycle to align with skip_demap
  demap_tid_1  <= demap_tid;  // demap_tid is active when demap is asserted
  demap_tnum_1 <= (mycid * 8) + demap_tid;
  demap_1      <= demap;

  // Signal to nas_pipe to suppress SSTEP
  if (asi_wr_itlb!=8'b0) begin //
    for (i=0;i<=7;i=i+1) begin // {
      if (asi_wr_itlb[i])  begin //
        `PR_INFO ("pli_nas", `INFO, "   C%0d T%0d PLI_SSTEP     tid=%d ts=%0d                 (tlb_sync: suppress sstep. sstep_sent=1)",
                       mycid,i,((mycid * 6'h8) + i[2:0]),tstamp);
        `NASTOP.sstep_sent[(mycid * 8) + i] <= 1'b1;      // suppress SSTEP
      end // }
    end // }
  end // }
 
  //----------------------------------------------------------
  //  Send I/DTLBWRITE due to demap
  //

  if ((demap!=0) && (demap_1!=0)) begin // {
    `PR_ERROR ("tlb_sync", `ERROR, 
       "C%0d T%0d Illegal Back to Back ITLB demap",
        mycid,demap_tid_1);
  end // }

  if (demap_active) begin // {
    fifo.pop_fifo ({hwtw,mytid});
    if (`PARGS.nas_check_on && `PARGS.tlb_sync_on) begin // {
        `PR_INFO ("pli_tlb", `INFO, "   C%0d T%0d PLI_ITLBWRITE tid=%d ts=%0d entry=%h (demap)",
                   mycid,demap_tid_1,demap_tnum_1,demap_tstamp,8'hff);
        `PR_INFO ("pli_nas", `INFO, "   C%0d T%0d PLI_SSTEP     tid=%d ts=%0d                 (tlb_sync: send SSTEP)",
                   mycid,demap_tid_1,demap_tnum_1,tstamp);
        junk = $sim_send(`PLI_ITLBWRITE, demap_tnum_1,demap_tstamp,8'hff);
        junk = $sim_send(`PLI_SSTEP, demap_tnum_1);

        // Check to see if sstep was sent early
        if (`NASTOP.sstep_sent[demap_tnum_1]==1) begin // {
          `NASTOP.sstep_early[demap_tnum_1] <= 1'b1;  // SSTEP was sent before nas_pipe capture
        end //}
    end //}
  end //}

  //--------------------
  if (`PARGS.show_tlb_on & (|demap_1)) begin // {
    $write ("SHOW_TLB: ITLB_DEMAP C%0d T%0d ",mycid,demap_tid_1);

    if (demap_active) begin
      case (demap_1)
      4'b0001:  $write ("type=real ");
      4'b0010:  $write ("type=cntx ");
      4'b0100:  $write ("type=page ");
      4'b1000:  $write ("type=all  ");
      default:
          `PR_ERROR ("tlb_sync", `ERROR, 
            "Bench Problem - demap_1(%b) should be one-hot.",demap_1);
      endcase
    end
    else begin
     $write("type=autodemap ");
    end

    $display ("match=%h                               ts=%0d",
                tlb_match,demap_tstamp*`TOP.core_period);

    for (cnt=0; cnt<=NUM_TLB; cnt=cnt+1) begin // {
      if (tlb_match[cnt]==1'b1)  begin // {
        $display ("SHOW_TLB: ITLB_DEMAP C%0d T%0d entry=%h V=0                                                   ts=%0d",
                    mycid,demap_tid_1,cnt,demap_tstamp*`TOP.core_period);
      end // }
    end // }

  end // }

  //----------------------------------------------------------
  //  Send I/DHWTW     due to HWTW
  //  Send I/DTLBWRITE due to ASI write

  // There are 3 main signals to watch for TLBWRITE (data_in, tlb_wr, wr_en)
  // These signals will be interleaved between the threads.
  // Need to queue up the signals over time so they can be processed in order.
  // Each thread will only be doing 1 thing at a time.

  if ((tlb_wr!=8'b0) || (data_in!=8'b0)) begin // {

    for (i=0;i<=7;i=i+1) begin // {

      if ((data_in[i])&&(tlb_wr[i])) begin // {
          `PR_ERROR ("tlb_sync", `ERROR, 
            "Bad Inputs - iwr_data_in & iwr_tlb_wr should not be asserted at same time");
      end // }
      else begin  // {

        // data_in[tid] determines if the write is HWTW or TLBWRITE
        if (data_in[i]) begin // {
          data_in_ready[i] <= 1'b1;
        end // }

        // tlb_wr[tid] determines which thread will write next
        // Use fifo to save the tids of the tlb_wr signals in order
        if (tlb_wr[i]) begin // {
          if (data_in_ready[i]) begin // {
            fifo.push_fifo ({1'b1,i[2:0]}); //  {hwtw,tid[2:0]}
            data_in_ready[i] <= 1'b0;
          end // }
          else begin // {
            fifo.push_fifo ({1'b0,i[2:0]}); //  {!hwtw,tid[2:0]}
          end // }
        end // }

      end // if}
    end // for}

  end // if}

  //----------------------------------------------------------
  // wr_en means that the write is occurring
  if (wr_en) begin // {
    fifo.pop_fifo ({hwtw,mytid});
    mytnum = (mycid * 8) + mytid;

    if (hwtw) begin // { 
       if (`PARGS.nas_check_on && `PARGS.tlb_sync_on) begin // {
           `PR_INFO ("pli_tlb", `INFO, "   C%0d T%0d PLI_IHWTW     tid=%d ts=%0d va=%h entry=%h",
                      mycid,mytid,mytnum,tstamp,tte_va,entry);
            junk = $sim_send(`PLI_IHWTW, mytnum, tstamp,tte_va,entry);

       end //}
    end // }
    else begin // {
      if (`PARGS.nas_check_on && `PARGS.tlb_sync_on) begin // {
           `PR_INFO ("pli_tlb", `INFO, "   C%0d T%0d PLI_ITLBWRITE tid=%d ts=%0d entry=%h",
                      mycid,mytid,mytnum,tstamp,entry);
           `PR_INFO ("pli_nas", `INFO, "   C%0d T%0d PLI_SSTEP     tid=%d ts=%0d                 (tlb_sync: send SSTEP)",
                      mycid,mytid,mytnum,tstamp);
           junk = $sim_send(`PLI_ITLBWRITE, mytnum,tstamp,entry);
           junk = $sim_send(`PLI_SSTEP, mytnum);

           // Check to see if sstep was sent early
           if (`NASTOP.sstep_sent[mytnum]==1) begin // {
             `NASTOP.sstep_early[mytnum] <= 1'b1;  // SSTEP was sent before nas_pipe capture
           end //}
      end //}
    end // }

    //--------------------
    if (`PARGS.show_tlb_on) begin // {
      $write ("SHOW_TLB: ITLB_WRITE C%0d T%0d ",mycid,mytid);

      if (tte_real==0) $write ("entry=%h V=%b VA=%h ",entry,tte_valid,tte_va);
      else             $write ("entry=%h V=%b RA=%h ",entry,tte_valid,tte_va);

      case (tte_page_mask)
      3'b000: $write("R=%b CNTX=%h PID=%h sz=8k         ts=%0d",
                         tte_real,tte_context,tte_pid,tstamp*`TOP.core_period);
      3'b001: $write("R=%b CNTX=%h PID=%h sz=64k        ts=%0d",
                         tte_real,tte_context,tte_pid,tstamp*`TOP.core_period);
      3'b011: $write("R=%b CNTX=%h PID=%h sz=4MB        ts=%0d",
                         tte_real,tte_context,tte_pid,tstamp*`TOP.core_period);
      3'b111: $write("R=%b CNTX=%h PID=%h sz=256MB      ts=%0d",
                         tte_real,tte_context,tte_pid,tstamp*`TOP.core_period);
      endcase

      if (hwtw) $display ("  (hwtw)");
      else      $display ("");

      $write ("SHOW_TLB: ITLB_WRITE C%0d T%0d ",mycid,mytid);

      $display ("             PA=00%h P=%b IE=%b CP=%b NFO=%b E=%b EP=%b W=%b  ts=%0d",
                  tte_pa,tte_p,tte_ie,tte_cp,tte_nfo,tte_e,tte_ep,tte_w,tstamp*`TOP.core_period); 
    end // }
    //--------------------

  end // }

end // always}

//----------------------------------------------------------
`endif
endmodule

`endif
`ifdef CORE_2

module itlb_wr_c2 ();
`ifndef GATESIM

`include "tlb_sync.vh"
`include "nas.vh"
parameter NUM_TLB=64;

wire                    [7:0] data_in;
wire                    [7:0] tlb_wr;
wire                          wr_en;
wire                    [7:0] entry;
wire                    [3:0] demap;
reg                     [3:0] demap_1;
wire                          demap_page;
wire                          demap_context;
wire                          demap_real;
wire                          demap_all;
wire                          skip_demap;
wire                          demap_active;
wire                          auto_demap;
wire                    [2:0] demap_tid;
reg                     [2:0] demap_tid_1;
reg                     [5:0] demap_tnum_1;
wire                    [7:0] asi_wr_itlb;
wire                    [7:0] asi_wr_itlb_demap;
wire                    [7:0] asi_wr_itlb_data_in;
wire                    [7:0] asi_wr_itlb_data_access;

reg         [(`TS_WIDTH-1):0] tstamp;
reg                     [7:0] data_in_ready;
reg                           hwtw;
reg         [(`TS_WIDTH-1):0] demap_tstamp;

reg                     [2:0] mytid;
reg                     [5:0] mytnum;
wire                    [2:0] mycid;
integer                       junk;
integer                       i;
reg                     [7:0] cnt;
wire                          ready;

assign   mycid = 2;

//----------------------------------------------------------
// Instantiate fifo - 1 entry per thread
fifo fifo ();
// Define fifo parameters
defparam fifo.ENTRY_BITS = 4;  // {hwtw,tid[2:0]}
defparam fifo.DEPTH      = 9;  // 1 extra entry for overflow detection
defparam fifo.PTR_BITS   = 4;

//----------------------------------------------------------
// DUT probes

assign   data_in = `SPC2.mmu.asi.htc_wr_itlb_data_in;
assign   tlb_wr = `PROBES2.itlb_wr;
assign   wr_en = `SPC2.ifu_ftu.ftu_itb_cust.tlb_wr_1_in_dout;

assign   entry = `SPC2.ifu_ftu.ftu_itb_cust.rw_index_1[5:0];

assign   demap_page = `SPC2.ifu_ftu.ftu_itc_ctl.itc_demap_page;
assign   demap_context = `SPC2.ifu_ftu.itc_demap_context;
assign   demap_real = `SPC2.ifu_ftu.itc_demap_real;
assign   demap_all = `SPC2.ifu_ftu.itc_demap_all;
assign   demap = {demap_all,demap_page,demap_context,demap_real};
assign   skip_demap = `SPC2.ifu_ftu.itc_wr_u_en;
assign   demap_tid = `SPC2.ifu_ftu.ftu_itd_dp.tte1[37:35];

// if (|demap_1 && skip_demap ), then Implicit demap so don't send to NAS
assign   demap_active = |demap_1 && !skip_demap;
assign   auto_demap   = |demap_1 && skip_demap;


// Signals that are early indication that TLBWRITE or TLBWRITE(demap) will happen.
// Once these signals assert, the write to the TLB cannot be cancelled.
// These signals assert before the MMU reorders the TLB writes.
// Use these to suppress SSTEP in nas_pipe.
// Best case, these signals assert 1 cycle after the previous SSTEP.
assign   asi_wr_itlb_demap             = `SPC2.mmu.asi_wr_immu_demap;
assign   asi_wr_itlb_data_in      = `SPC2.mmu.asi_wr_itlb_data_in;
assign   asi_wr_itlb_data_access  = {`SPC2.mmu.asd1.asi_wr_itlb_data_access,
                                     `SPC2.mmu.asd0.asi_wr_itlb_data_access};
assign   asi_wr_itlb = asi_wr_itlb_demap | asi_wr_itlb_data_in | asi_wr_itlb_data_access;

//---------------------
// Probes for debugging

// defines copied from :/libs/n2sram/tlbs/tlbs/n2_tlb_tl_64x59_cust_l/n2_tlb_tl_64x59_cust/rtl

// n2_tlb_tl_64x59_cam.sv

`define CNTX1_HI 65
`define CNTX1_LO 53
`define PID_HI   52
`define PID_LO   50
`define REAL_BIT 49
`define VA_47    48
`define VA_28    29
`define VA_27    28
`define VA_22    23
`define TTE_VALID 22 
`define VA_21    21
`define VA_16    16
`define VA_15    15 
`define VA_13    13
`define CNTX0_HI 12
`define CNTX0_LO  0

// n2_tlb_tl_64x59_ram.sv

`define DATA_PARITY         36
`define DATA_PA_39_28_HI    35
`define DATA_PA_39_28_LO    24
`define DATA_PA_27_22_HI    23
`define DATA_PA_27_22_LO    18
`define DATA_VA_27_22_V     17 
`define DATA_PA_21_16_HI    16
`define DATA_PA_21_16_LO    11
`define DATA_VA_21_16_V     10 
`define DATA_PA_15_13_HI     9
`define DATA_PA_15_13_LO     7
`define DATA_VA_15_13_V      6 
`define DATA_NFO             5 
`define DATA_IE              4 
`define DATA_CP              3 
`define DATA_X               2 
`define DATA_P               1 
`define DATA_W               0 

wire         [(NUM_TLB-1):0] tlb_valid;
wire         [(NUM_TLB-1):0] tlb_match;
wire                         tte_valid;
wire                  [47:0] tte_va;
wire                  [12:0] tte_context;
wire                         tte_real;
wire                   [2:0] tte_pid;
wire                   [2:0] tte_page_mask;
wire                  [39:0] tte_pa;
wire                         tte_nfo;
wire                         tte_ie;
wire                         tte_cp;
wire                         tte_e;
wire                         tte_p;
wire                         tte_w;
wire                         tte_ep;

assign  tlb_valid        = `SPC2.ifu_ftu.ftu_itb_cust.array.cam.valid;
assign  tlb_match        = `SPC2.ifu_ftu.ftu_itb_cust.array.cam.match;

assign  tte_va           =  {`SPC2.ifu_ftu.ftu_itb_cust.tte_tag_1_dout[`VA_47:`VA_28],
                             `SPC2.ifu_ftu.ftu_itb_cust.tte_tag_1_dout[`VA_27:`VA_22],
                             `SPC2.ifu_ftu.ftu_itb_cust.tte_tag_1_dout[`VA_21:`VA_16],
                             `SPC2.ifu_ftu.ftu_itb_cust.tte_tag_1_dout[`VA_15:`VA_13],
                             13'b0
                            };
assign  tte_context      = `SPC2.ifu_ftu.ftu_itb_cust.tte_tag_1_dout[`CNTX1_HI:`CNTX1_LO];
assign  tte_pid          = `SPC2.ifu_ftu.ftu_itb_cust.tte_tag_1_dout[`PID_HI:`PID_LO];
assign  tte_real         = `SPC2.ifu_ftu.ftu_itb_cust.tte_tag_1_dout[`REAL_BIT];
assign  tte_valid        = `SPC2.ifu_ftu.ftu_itb_cust.tte_tag_1_dout[`TTE_VALID];

assign  tte_page_mask    = `SPC2.ifu_ftu.ftu_itb_cust.tte_page_size_mask_1;

assign  tte_pa           = {`SPC2.ifu_ftu.ftu_itb_cust.tte_data_1[`DATA_PA_39_28_HI:`DATA_PA_39_28_LO],
                            `SPC2.ifu_ftu.ftu_itb_cust.tte_data_1[`DATA_PA_27_22_HI:`DATA_PA_27_22_LO],
                            `SPC2.ifu_ftu.ftu_itb_cust.tte_data_1[`DATA_PA_21_16_HI:`DATA_PA_21_16_LO],
                            `SPC2.ifu_ftu.ftu_itb_cust.tte_data_1[`DATA_PA_15_13_HI:`DATA_PA_15_13_LO],
                            13'b0
                           };
assign  tte_nfo          = `SPC2.ifu_ftu.ftu_itb_cust.tte_data_1[`DATA_NFO];
assign  tte_ie           = `SPC2.ifu_ftu.ftu_itb_cust.tte_data_1[`DATA_IE];
assign  tte_cp           = `SPC2.ifu_ftu.ftu_itb_cust.tte_data_1[`DATA_CP];
assign  tte_e            = `SPC2.ifu_ftu.ftu_itb_cust.tte_data_1[`DATA_X];
assign  tte_p            = `SPC2.ifu_ftu.ftu_itb_cust.tte_data_1[`DATA_P];
assign  tte_w            = `SPC2.ifu_ftu.ftu_itb_cust.tte_data_1[`DATA_W];
assign  tte_ep           = 1'b1;  // not stored in array, but implied as 1

assign ready = `PARGS.tlb_sync_on & !`SPC2.tcu_spc_mbist_start;

//----------------------------------------------------------
initial  begin // {
  #1;
  hwtw = 1'b0;
  data_in_ready = 8'b0;
  @ (posedge `SPC2.l2clk);
end // }

//----------------------------------------------------------
// Must use negedge to avoid race condition
// tlb_replacement_index (aka entry) is created in always block using blocking assignments

always @ (negedge (`SPC2.l2clk & ready)) begin // {

  tstamp = `TOP.core_cycle_cnt;
  demap_tstamp = `TOP.core_cycle_cnt;

  // Delay by 1 cycle to align with skip_demap
  demap_tid_1  <= demap_tid;  // demap_tid is active when demap is asserted
  demap_tnum_1 <= (mycid * 8) + demap_tid;
  demap_1      <= demap;

  // Signal to nas_pipe to suppress SSTEP
  if (asi_wr_itlb!=8'b0) begin //
    for (i=0;i<=7;i=i+1) begin // {
      if (asi_wr_itlb[i])  begin //
        `PR_INFO ("pli_nas", `INFO, "   C%0d T%0d PLI_SSTEP     tid=%d ts=%0d                 (tlb_sync: suppress sstep. sstep_sent=1)",
                       mycid,i,((mycid * 6'h8) + i[2:0]),tstamp);
        `NASTOP.sstep_sent[(mycid * 8) + i] <= 1'b1;      // suppress SSTEP
      end // }
    end // }
  end // }
 
  //----------------------------------------------------------
  //  Send I/DTLBWRITE due to demap
  //

  if ((demap!=0) && (demap_1!=0)) begin // {
    `PR_ERROR ("tlb_sync", `ERROR, 
       "C%0d T%0d Illegal Back to Back ITLB demap",
        mycid,demap_tid_1);
  end // }

  if (demap_active) begin // {
    fifo.pop_fifo ({hwtw,mytid});
    if (`PARGS.nas_check_on && `PARGS.tlb_sync_on) begin // {
        `PR_INFO ("pli_tlb", `INFO, "   C%0d T%0d PLI_ITLBWRITE tid=%d ts=%0d entry=%h (demap)",
                   mycid,demap_tid_1,demap_tnum_1,demap_tstamp,8'hff);
        `PR_INFO ("pli_nas", `INFO, "   C%0d T%0d PLI_SSTEP     tid=%d ts=%0d                 (tlb_sync: send SSTEP)",
                   mycid,demap_tid_1,demap_tnum_1,tstamp);
        junk = $sim_send(`PLI_ITLBWRITE, demap_tnum_1,demap_tstamp,8'hff);
        junk = $sim_send(`PLI_SSTEP, demap_tnum_1);

        // Check to see if sstep was sent early
        if (`NASTOP.sstep_sent[demap_tnum_1]==1) begin // {
          `NASTOP.sstep_early[demap_tnum_1] <= 1'b1;  // SSTEP was sent before nas_pipe capture
        end //}
    end //}
  end //}

  //--------------------
  if (`PARGS.show_tlb_on & (|demap_1)) begin // {
    $write ("SHOW_TLB: ITLB_DEMAP C%0d T%0d ",mycid,demap_tid_1);

    if (demap_active) begin
      case (demap_1)
      4'b0001:  $write ("type=real ");
      4'b0010:  $write ("type=cntx ");
      4'b0100:  $write ("type=page ");
      4'b1000:  $write ("type=all  ");
      default:
          `PR_ERROR ("tlb_sync", `ERROR, 
            "Bench Problem - demap_1(%b) should be one-hot.",demap_1);
      endcase
    end
    else begin
     $write("type=autodemap ");
    end

    $display ("match=%h                               ts=%0d",
                tlb_match,demap_tstamp*`TOP.core_period);

    for (cnt=0; cnt<=NUM_TLB; cnt=cnt+1) begin // {
      if (tlb_match[cnt]==1'b1)  begin // {
        $display ("SHOW_TLB: ITLB_DEMAP C%0d T%0d entry=%h V=0                                                   ts=%0d",
                    mycid,demap_tid_1,cnt,demap_tstamp*`TOP.core_period);
      end // }
    end // }

  end // }

  //----------------------------------------------------------
  //  Send I/DHWTW     due to HWTW
  //  Send I/DTLBWRITE due to ASI write

  // There are 3 main signals to watch for TLBWRITE (data_in, tlb_wr, wr_en)
  // These signals will be interleaved between the threads.
  // Need to queue up the signals over time so they can be processed in order.
  // Each thread will only be doing 1 thing at a time.

  if ((tlb_wr!=8'b0) || (data_in!=8'b0)) begin // {

    for (i=0;i<=7;i=i+1) begin // {

      if ((data_in[i])&&(tlb_wr[i])) begin // {
          `PR_ERROR ("tlb_sync", `ERROR, 
            "Bad Inputs - iwr_data_in & iwr_tlb_wr should not be asserted at same time");
      end // }
      else begin  // {

        // data_in[tid] determines if the write is HWTW or TLBWRITE
        if (data_in[i]) begin // {
          data_in_ready[i] <= 1'b1;
        end // }

        // tlb_wr[tid] determines which thread will write next
        // Use fifo to save the tids of the tlb_wr signals in order
        if (tlb_wr[i]) begin // {
          if (data_in_ready[i]) begin // {
            fifo.push_fifo ({1'b1,i[2:0]}); //  {hwtw,tid[2:0]}
            data_in_ready[i] <= 1'b0;
          end // }
          else begin // {
            fifo.push_fifo ({1'b0,i[2:0]}); //  {!hwtw,tid[2:0]}
          end // }
        end // }

      end // if}
    end // for}

  end // if}

  //----------------------------------------------------------
  // wr_en means that the write is occurring
  if (wr_en) begin // {
    fifo.pop_fifo ({hwtw,mytid});
    mytnum = (mycid * 8) + mytid;

    if (hwtw) begin // { 
       if (`PARGS.nas_check_on && `PARGS.tlb_sync_on) begin // {
           `PR_INFO ("pli_tlb", `INFO, "   C%0d T%0d PLI_IHWTW     tid=%d ts=%0d va=%h entry=%h",
                      mycid,mytid,mytnum,tstamp,tte_va,entry);
            junk = $sim_send(`PLI_IHWTW, mytnum, tstamp,tte_va,entry);

       end //}
    end // }
    else begin // {
      if (`PARGS.nas_check_on && `PARGS.tlb_sync_on) begin // {
           `PR_INFO ("pli_tlb", `INFO, "   C%0d T%0d PLI_ITLBWRITE tid=%d ts=%0d entry=%h",
                      mycid,mytid,mytnum,tstamp,entry);
           `PR_INFO ("pli_nas", `INFO, "   C%0d T%0d PLI_SSTEP     tid=%d ts=%0d                 (tlb_sync: send SSTEP)",
                      mycid,mytid,mytnum,tstamp);
           junk = $sim_send(`PLI_ITLBWRITE, mytnum,tstamp,entry);
           junk = $sim_send(`PLI_SSTEP, mytnum);

           // Check to see if sstep was sent early
           if (`NASTOP.sstep_sent[mytnum]==1) begin // {
             `NASTOP.sstep_early[mytnum] <= 1'b1;  // SSTEP was sent before nas_pipe capture
           end //}
      end //}
    end // }

    //--------------------
    if (`PARGS.show_tlb_on) begin // {
      $write ("SHOW_TLB: ITLB_WRITE C%0d T%0d ",mycid,mytid);

      if (tte_real==0) $write ("entry=%h V=%b VA=%h ",entry,tte_valid,tte_va);
      else             $write ("entry=%h V=%b RA=%h ",entry,tte_valid,tte_va);

      case (tte_page_mask)
      3'b000: $write("R=%b CNTX=%h PID=%h sz=8k         ts=%0d",
                         tte_real,tte_context,tte_pid,tstamp*`TOP.core_period);
      3'b001: $write("R=%b CNTX=%h PID=%h sz=64k        ts=%0d",
                         tte_real,tte_context,tte_pid,tstamp*`TOP.core_period);
      3'b011: $write("R=%b CNTX=%h PID=%h sz=4MB        ts=%0d",
                         tte_real,tte_context,tte_pid,tstamp*`TOP.core_period);
      3'b111: $write("R=%b CNTX=%h PID=%h sz=256MB      ts=%0d",
                         tte_real,tte_context,tte_pid,tstamp*`TOP.core_period);
      endcase

      if (hwtw) $display ("  (hwtw)");
      else      $display ("");

      $write ("SHOW_TLB: ITLB_WRITE C%0d T%0d ",mycid,mytid);

      $display ("             PA=00%h P=%b IE=%b CP=%b NFO=%b E=%b EP=%b W=%b  ts=%0d",
                  tte_pa,tte_p,tte_ie,tte_cp,tte_nfo,tte_e,tte_ep,tte_w,tstamp*`TOP.core_period); 
    end // }
    //--------------------

  end // }

end // always}

//----------------------------------------------------------
`endif
endmodule

`endif
`ifdef CORE_3

module itlb_wr_c3 ();
`ifndef GATESIM

`include "tlb_sync.vh"
`include "nas.vh"
parameter NUM_TLB=64;

wire                    [7:0] data_in;
wire                    [7:0] tlb_wr;
wire                          wr_en;
wire                    [7:0] entry;
wire                    [3:0] demap;
reg                     [3:0] demap_1;
wire                          demap_page;
wire                          demap_context;
wire                          demap_real;
wire                          demap_all;
wire                          skip_demap;
wire                          demap_active;
wire                          auto_demap;
wire                    [2:0] demap_tid;
reg                     [2:0] demap_tid_1;
reg                     [5:0] demap_tnum_1;
wire                    [7:0] asi_wr_itlb;
wire                    [7:0] asi_wr_itlb_demap;
wire                    [7:0] asi_wr_itlb_data_in;
wire                    [7:0] asi_wr_itlb_data_access;

reg         [(`TS_WIDTH-1):0] tstamp;
reg                     [7:0] data_in_ready;
reg                           hwtw;
reg         [(`TS_WIDTH-1):0] demap_tstamp;

reg                     [2:0] mytid;
reg                     [5:0] mytnum;
wire                    [2:0] mycid;
integer                       junk;
integer                       i;
reg                     [7:0] cnt;
wire                          ready;

assign   mycid = 3;

//----------------------------------------------------------
// Instantiate fifo - 1 entry per thread
fifo fifo ();
// Define fifo parameters
defparam fifo.ENTRY_BITS = 4;  // {hwtw,tid[2:0]}
defparam fifo.DEPTH      = 9;  // 1 extra entry for overflow detection
defparam fifo.PTR_BITS   = 4;

//----------------------------------------------------------
// DUT probes

assign   data_in = `SPC3.mmu.asi.htc_wr_itlb_data_in;
assign   tlb_wr = `PROBES3.itlb_wr;
assign   wr_en = `SPC3.ifu_ftu.ftu_itb_cust.tlb_wr_1_in_dout;

assign   entry = `SPC3.ifu_ftu.ftu_itb_cust.rw_index_1[5:0];

assign   demap_page = `SPC3.ifu_ftu.ftu_itc_ctl.itc_demap_page;
assign   demap_context = `SPC3.ifu_ftu.itc_demap_context;
assign   demap_real = `SPC3.ifu_ftu.itc_demap_real;
assign   demap_all = `SPC3.ifu_ftu.itc_demap_all;
assign   demap = {demap_all,demap_page,demap_context,demap_real};
assign   skip_demap = `SPC3.ifu_ftu.itc_wr_u_en;
assign   demap_tid = `SPC3.ifu_ftu.ftu_itd_dp.tte1[37:35];

// if (|demap_1 && skip_demap ), then Implicit demap so don't send to NAS
assign   demap_active = |demap_1 && !skip_demap;
assign   auto_demap   = |demap_1 && skip_demap;


// Signals that are early indication that TLBWRITE or TLBWRITE(demap) will happen.
// Once these signals assert, the write to the TLB cannot be cancelled.
// These signals assert before the MMU reorders the TLB writes.
// Use these to suppress SSTEP in nas_pipe.
// Best case, these signals assert 1 cycle after the previous SSTEP.
assign   asi_wr_itlb_demap             = `SPC3.mmu.asi_wr_immu_demap;
assign   asi_wr_itlb_data_in      = `SPC3.mmu.asi_wr_itlb_data_in;
assign   asi_wr_itlb_data_access  = {`SPC3.mmu.asd1.asi_wr_itlb_data_access,
                                     `SPC3.mmu.asd0.asi_wr_itlb_data_access};
assign   asi_wr_itlb = asi_wr_itlb_demap | asi_wr_itlb_data_in | asi_wr_itlb_data_access;

//---------------------
// Probes for debugging

// defines copied from :/libs/n2sram/tlbs/tlbs/n2_tlb_tl_64x59_cust_l/n2_tlb_tl_64x59_cust/rtl

// n2_tlb_tl_64x59_cam.sv

`define CNTX1_HI 65
`define CNTX1_LO 53
`define PID_HI   52
`define PID_LO   50
`define REAL_BIT 49
`define VA_47    48
`define VA_28    29
`define VA_27    28
`define VA_22    23
`define TTE_VALID 22 
`define VA_21    21
`define VA_16    16
`define VA_15    15 
`define VA_13    13
`define CNTX0_HI 12
`define CNTX0_LO  0

// n2_tlb_tl_64x59_ram.sv

`define DATA_PARITY         36
`define DATA_PA_39_28_HI    35
`define DATA_PA_39_28_LO    24
`define DATA_PA_27_22_HI    23
`define DATA_PA_27_22_LO    18
`define DATA_VA_27_22_V     17 
`define DATA_PA_21_16_HI    16
`define DATA_PA_21_16_LO    11
`define DATA_VA_21_16_V     10 
`define DATA_PA_15_13_HI     9
`define DATA_PA_15_13_LO     7
`define DATA_VA_15_13_V      6 
`define DATA_NFO             5 
`define DATA_IE              4 
`define DATA_CP              3 
`define DATA_X               2 
`define DATA_P               1 
`define DATA_W               0 

wire         [(NUM_TLB-1):0] tlb_valid;
wire         [(NUM_TLB-1):0] tlb_match;
wire                         tte_valid;
wire                  [47:0] tte_va;
wire                  [12:0] tte_context;
wire                         tte_real;
wire                   [2:0] tte_pid;
wire                   [2:0] tte_page_mask;
wire                  [39:0] tte_pa;
wire                         tte_nfo;
wire                         tte_ie;
wire                         tte_cp;
wire                         tte_e;
wire                         tte_p;
wire                         tte_w;
wire                         tte_ep;

assign  tlb_valid        = `SPC3.ifu_ftu.ftu_itb_cust.array.cam.valid;
assign  tlb_match        = `SPC3.ifu_ftu.ftu_itb_cust.array.cam.match;

assign  tte_va           =  {`SPC3.ifu_ftu.ftu_itb_cust.tte_tag_1_dout[`VA_47:`VA_28],
                             `SPC3.ifu_ftu.ftu_itb_cust.tte_tag_1_dout[`VA_27:`VA_22],
                             `SPC3.ifu_ftu.ftu_itb_cust.tte_tag_1_dout[`VA_21:`VA_16],
                             `SPC3.ifu_ftu.ftu_itb_cust.tte_tag_1_dout[`VA_15:`VA_13],
                             13'b0
                            };
assign  tte_context      = `SPC3.ifu_ftu.ftu_itb_cust.tte_tag_1_dout[`CNTX1_HI:`CNTX1_LO];
assign  tte_pid          = `SPC3.ifu_ftu.ftu_itb_cust.tte_tag_1_dout[`PID_HI:`PID_LO];
assign  tte_real         = `SPC3.ifu_ftu.ftu_itb_cust.tte_tag_1_dout[`REAL_BIT];
assign  tte_valid        = `SPC3.ifu_ftu.ftu_itb_cust.tte_tag_1_dout[`TTE_VALID];

assign  tte_page_mask    = `SPC3.ifu_ftu.ftu_itb_cust.tte_page_size_mask_1;

assign  tte_pa           = {`SPC3.ifu_ftu.ftu_itb_cust.tte_data_1[`DATA_PA_39_28_HI:`DATA_PA_39_28_LO],
                            `SPC3.ifu_ftu.ftu_itb_cust.tte_data_1[`DATA_PA_27_22_HI:`DATA_PA_27_22_LO],
                            `SPC3.ifu_ftu.ftu_itb_cust.tte_data_1[`DATA_PA_21_16_HI:`DATA_PA_21_16_LO],
                            `SPC3.ifu_ftu.ftu_itb_cust.tte_data_1[`DATA_PA_15_13_HI:`DATA_PA_15_13_LO],
                            13'b0
                           };
assign  tte_nfo          = `SPC3.ifu_ftu.ftu_itb_cust.tte_data_1[`DATA_NFO];
assign  tte_ie           = `SPC3.ifu_ftu.ftu_itb_cust.tte_data_1[`DATA_IE];
assign  tte_cp           = `SPC3.ifu_ftu.ftu_itb_cust.tte_data_1[`DATA_CP];
assign  tte_e            = `SPC3.ifu_ftu.ftu_itb_cust.tte_data_1[`DATA_X];
assign  tte_p            = `SPC3.ifu_ftu.ftu_itb_cust.tte_data_1[`DATA_P];
assign  tte_w            = `SPC3.ifu_ftu.ftu_itb_cust.tte_data_1[`DATA_W];
assign  tte_ep           = 1'b1;  // not stored in array, but implied as 1

assign ready = `PARGS.tlb_sync_on & !`SPC3.tcu_spc_mbist_start;

//----------------------------------------------------------
initial  begin // {
  #1;
  hwtw = 1'b0;
  data_in_ready = 8'b0;
  @ (posedge `SPC3.l2clk);
end // }

//----------------------------------------------------------
// Must use negedge to avoid race condition
// tlb_replacement_index (aka entry) is created in always block using blocking assignments

always @ (negedge (`SPC3.l2clk & ready)) begin // {

  tstamp = `TOP.core_cycle_cnt;
  demap_tstamp = `TOP.core_cycle_cnt;

  // Delay by 1 cycle to align with skip_demap
  demap_tid_1  <= demap_tid;  // demap_tid is active when demap is asserted
  demap_tnum_1 <= (mycid * 8) + demap_tid;
  demap_1      <= demap;

  // Signal to nas_pipe to suppress SSTEP
  if (asi_wr_itlb!=8'b0) begin //
    for (i=0;i<=7;i=i+1) begin // {
      if (asi_wr_itlb[i])  begin //
        `PR_INFO ("pli_nas", `INFO, "   C%0d T%0d PLI_SSTEP     tid=%d ts=%0d                 (tlb_sync: suppress sstep. sstep_sent=1)",
                       mycid,i,((mycid * 6'h8) + i[2:0]),tstamp);
        `NASTOP.sstep_sent[(mycid * 8) + i] <= 1'b1;      // suppress SSTEP
      end // }
    end // }
  end // }
 
  //----------------------------------------------------------
  //  Send I/DTLBWRITE due to demap
  //

  if ((demap!=0) && (demap_1!=0)) begin // {
    `PR_ERROR ("tlb_sync", `ERROR, 
       "C%0d T%0d Illegal Back to Back ITLB demap",
        mycid,demap_tid_1);
  end // }

  if (demap_active) begin // {
    fifo.pop_fifo ({hwtw,mytid});
    if (`PARGS.nas_check_on && `PARGS.tlb_sync_on) begin // {
        `PR_INFO ("pli_tlb", `INFO, "   C%0d T%0d PLI_ITLBWRITE tid=%d ts=%0d entry=%h (demap)",
                   mycid,demap_tid_1,demap_tnum_1,demap_tstamp,8'hff);
        `PR_INFO ("pli_nas", `INFO, "   C%0d T%0d PLI_SSTEP     tid=%d ts=%0d                 (tlb_sync: send SSTEP)",
                   mycid,demap_tid_1,demap_tnum_1,tstamp);
        junk = $sim_send(`PLI_ITLBWRITE, demap_tnum_1,demap_tstamp,8'hff);
        junk = $sim_send(`PLI_SSTEP, demap_tnum_1);

        // Check to see if sstep was sent early
        if (`NASTOP.sstep_sent[demap_tnum_1]==1) begin // {
          `NASTOP.sstep_early[demap_tnum_1] <= 1'b1;  // SSTEP was sent before nas_pipe capture
        end //}
    end //}
  end //}

  //--------------------
  if (`PARGS.show_tlb_on & (|demap_1)) begin // {
    $write ("SHOW_TLB: ITLB_DEMAP C%0d T%0d ",mycid,demap_tid_1);

    if (demap_active) begin
      case (demap_1)
      4'b0001:  $write ("type=real ");
      4'b0010:  $write ("type=cntx ");
      4'b0100:  $write ("type=page ");
      4'b1000:  $write ("type=all  ");
      default:
          `PR_ERROR ("tlb_sync", `ERROR, 
            "Bench Problem - demap_1(%b) should be one-hot.",demap_1);
      endcase
    end
    else begin
     $write("type=autodemap ");
    end

    $display ("match=%h                               ts=%0d",
                tlb_match,demap_tstamp*`TOP.core_period);

    for (cnt=0; cnt<=NUM_TLB; cnt=cnt+1) begin // {
      if (tlb_match[cnt]==1'b1)  begin // {
        $display ("SHOW_TLB: ITLB_DEMAP C%0d T%0d entry=%h V=0                                                   ts=%0d",
                    mycid,demap_tid_1,cnt,demap_tstamp*`TOP.core_period);
      end // }
    end // }

  end // }

  //----------------------------------------------------------
  //  Send I/DHWTW     due to HWTW
  //  Send I/DTLBWRITE due to ASI write

  // There are 3 main signals to watch for TLBWRITE (data_in, tlb_wr, wr_en)
  // These signals will be interleaved between the threads.
  // Need to queue up the signals over time so they can be processed in order.
  // Each thread will only be doing 1 thing at a time.

  if ((tlb_wr!=8'b0) || (data_in!=8'b0)) begin // {

    for (i=0;i<=7;i=i+1) begin // {

      if ((data_in[i])&&(tlb_wr[i])) begin // {
          `PR_ERROR ("tlb_sync", `ERROR, 
            "Bad Inputs - iwr_data_in & iwr_tlb_wr should not be asserted at same time");
      end // }
      else begin  // {

        // data_in[tid] determines if the write is HWTW or TLBWRITE
        if (data_in[i]) begin // {
          data_in_ready[i] <= 1'b1;
        end // }

        // tlb_wr[tid] determines which thread will write next
        // Use fifo to save the tids of the tlb_wr signals in order
        if (tlb_wr[i]) begin // {
          if (data_in_ready[i]) begin // {
            fifo.push_fifo ({1'b1,i[2:0]}); //  {hwtw,tid[2:0]}
            data_in_ready[i] <= 1'b0;
          end // }
          else begin // {
            fifo.push_fifo ({1'b0,i[2:0]}); //  {!hwtw,tid[2:0]}
          end // }
        end // }

      end // if}
    end // for}

  end // if}

  //----------------------------------------------------------
  // wr_en means that the write is occurring
  if (wr_en) begin // {
    fifo.pop_fifo ({hwtw,mytid});
    mytnum = (mycid * 8) + mytid;

    if (hwtw) begin // { 
       if (`PARGS.nas_check_on && `PARGS.tlb_sync_on) begin // {
           `PR_INFO ("pli_tlb", `INFO, "   C%0d T%0d PLI_IHWTW     tid=%d ts=%0d va=%h entry=%h",
                      mycid,mytid,mytnum,tstamp,tte_va,entry);
            junk = $sim_send(`PLI_IHWTW, mytnum, tstamp,tte_va,entry);

       end //}
    end // }
    else begin // {
      if (`PARGS.nas_check_on && `PARGS.tlb_sync_on) begin // {
           `PR_INFO ("pli_tlb", `INFO, "   C%0d T%0d PLI_ITLBWRITE tid=%d ts=%0d entry=%h",
                      mycid,mytid,mytnum,tstamp,entry);
           `PR_INFO ("pli_nas", `INFO, "   C%0d T%0d PLI_SSTEP     tid=%d ts=%0d                 (tlb_sync: send SSTEP)",
                      mycid,mytid,mytnum,tstamp);
           junk = $sim_send(`PLI_ITLBWRITE, mytnum,tstamp,entry);
           junk = $sim_send(`PLI_SSTEP, mytnum);

           // Check to see if sstep was sent early
           if (`NASTOP.sstep_sent[mytnum]==1) begin // {
             `NASTOP.sstep_early[mytnum] <= 1'b1;  // SSTEP was sent before nas_pipe capture
           end //}
      end //}
    end // }

    //--------------------
    if (`PARGS.show_tlb_on) begin // {
      $write ("SHOW_TLB: ITLB_WRITE C%0d T%0d ",mycid,mytid);

      if (tte_real==0) $write ("entry=%h V=%b VA=%h ",entry,tte_valid,tte_va);
      else             $write ("entry=%h V=%b RA=%h ",entry,tte_valid,tte_va);

      case (tte_page_mask)
      3'b000: $write("R=%b CNTX=%h PID=%h sz=8k         ts=%0d",
                         tte_real,tte_context,tte_pid,tstamp*`TOP.core_period);
      3'b001: $write("R=%b CNTX=%h PID=%h sz=64k        ts=%0d",
                         tte_real,tte_context,tte_pid,tstamp*`TOP.core_period);
      3'b011: $write("R=%b CNTX=%h PID=%h sz=4MB        ts=%0d",
                         tte_real,tte_context,tte_pid,tstamp*`TOP.core_period);
      3'b111: $write("R=%b CNTX=%h PID=%h sz=256MB      ts=%0d",
                         tte_real,tte_context,tte_pid,tstamp*`TOP.core_period);
      endcase

      if (hwtw) $display ("  (hwtw)");
      else      $display ("");

      $write ("SHOW_TLB: ITLB_WRITE C%0d T%0d ",mycid,mytid);

      $display ("             PA=00%h P=%b IE=%b CP=%b NFO=%b E=%b EP=%b W=%b  ts=%0d",
                  tte_pa,tte_p,tte_ie,tte_cp,tte_nfo,tte_e,tte_ep,tte_w,tstamp*`TOP.core_period); 
    end // }
    //--------------------

  end // }

end // always}

//----------------------------------------------------------
`endif
endmodule

`endif
`ifdef CORE_4

module itlb_wr_c4 ();
`ifndef GATESIM

`include "tlb_sync.vh"
`include "nas.vh"
parameter NUM_TLB=64;

wire                    [7:0] data_in;
wire                    [7:0] tlb_wr;
wire                          wr_en;
wire                    [7:0] entry;
wire                    [3:0] demap;
reg                     [3:0] demap_1;
wire                          demap_page;
wire                          demap_context;
wire                          demap_real;
wire                          demap_all;
wire                          skip_demap;
wire                          demap_active;
wire                          auto_demap;
wire                    [2:0] demap_tid;
reg                     [2:0] demap_tid_1;
reg                     [5:0] demap_tnum_1;
wire                    [7:0] asi_wr_itlb;
wire                    [7:0] asi_wr_itlb_demap;
wire                    [7:0] asi_wr_itlb_data_in;
wire                    [7:0] asi_wr_itlb_data_access;

reg         [(`TS_WIDTH-1):0] tstamp;
reg                     [7:0] data_in_ready;
reg                           hwtw;
reg         [(`TS_WIDTH-1):0] demap_tstamp;

reg                     [2:0] mytid;
reg                     [5:0] mytnum;
wire                    [2:0] mycid;
integer                       junk;
integer                       i;
reg                     [7:0] cnt;
wire                          ready;

assign   mycid = 4;

//----------------------------------------------------------
// Instantiate fifo - 1 entry per thread
fifo fifo ();
// Define fifo parameters
defparam fifo.ENTRY_BITS = 4;  // {hwtw,tid[2:0]}
defparam fifo.DEPTH      = 9;  // 1 extra entry for overflow detection
defparam fifo.PTR_BITS   = 4;

//----------------------------------------------------------
// DUT probes

assign   data_in = `SPC4.mmu.asi.htc_wr_itlb_data_in;
assign   tlb_wr = `PROBES4.itlb_wr;
assign   wr_en = `SPC4.ifu_ftu.ftu_itb_cust.tlb_wr_1_in_dout;

assign   entry = `SPC4.ifu_ftu.ftu_itb_cust.rw_index_1[5:0];

assign   demap_page = `SPC4.ifu_ftu.ftu_itc_ctl.itc_demap_page;
assign   demap_context = `SPC4.ifu_ftu.itc_demap_context;
assign   demap_real = `SPC4.ifu_ftu.itc_demap_real;
assign   demap_all = `SPC4.ifu_ftu.itc_demap_all;
assign   demap = {demap_all,demap_page,demap_context,demap_real};
assign   skip_demap = `SPC4.ifu_ftu.itc_wr_u_en;
assign   demap_tid = `SPC4.ifu_ftu.ftu_itd_dp.tte1[37:35];

// if (|demap_1 && skip_demap ), then Implicit demap so don't send to NAS
assign   demap_active = |demap_1 && !skip_demap;
assign   auto_demap   = |demap_1 && skip_demap;


// Signals that are early indication that TLBWRITE or TLBWRITE(demap) will happen.
// Once these signals assert, the write to the TLB cannot be cancelled.
// These signals assert before the MMU reorders the TLB writes.
// Use these to suppress SSTEP in nas_pipe.
// Best case, these signals assert 1 cycle after the previous SSTEP.
assign   asi_wr_itlb_demap             = `SPC4.mmu.asi_wr_immu_demap;
assign   asi_wr_itlb_data_in      = `SPC4.mmu.asi_wr_itlb_data_in;
assign   asi_wr_itlb_data_access  = {`SPC4.mmu.asd1.asi_wr_itlb_data_access,
                                     `SPC4.mmu.asd0.asi_wr_itlb_data_access};
assign   asi_wr_itlb = asi_wr_itlb_demap | asi_wr_itlb_data_in | asi_wr_itlb_data_access;

//---------------------
// Probes for debugging

// defines copied from :/libs/n2sram/tlbs/tlbs/n2_tlb_tl_64x59_cust_l/n2_tlb_tl_64x59_cust/rtl

// n2_tlb_tl_64x59_cam.sv

`define CNTX1_HI 65
`define CNTX1_LO 53
`define PID_HI   52
`define PID_LO   50
`define REAL_BIT 49
`define VA_47    48
`define VA_28    29
`define VA_27    28
`define VA_22    23
`define TTE_VALID 22 
`define VA_21    21
`define VA_16    16
`define VA_15    15 
`define VA_13    13
`define CNTX0_HI 12
`define CNTX0_LO  0

// n2_tlb_tl_64x59_ram.sv

`define DATA_PARITY         36
`define DATA_PA_39_28_HI    35
`define DATA_PA_39_28_LO    24
`define DATA_PA_27_22_HI    23
`define DATA_PA_27_22_LO    18
`define DATA_VA_27_22_V     17 
`define DATA_PA_21_16_HI    16
`define DATA_PA_21_16_LO    11
`define DATA_VA_21_16_V     10 
`define DATA_PA_15_13_HI     9
`define DATA_PA_15_13_LO     7
`define DATA_VA_15_13_V      6 
`define DATA_NFO             5 
`define DATA_IE              4 
`define DATA_CP              3 
`define DATA_X               2 
`define DATA_P               1 
`define DATA_W               0 

wire         [(NUM_TLB-1):0] tlb_valid;
wire         [(NUM_TLB-1):0] tlb_match;
wire                         tte_valid;
wire                  [47:0] tte_va;
wire                  [12:0] tte_context;
wire                         tte_real;
wire                   [2:0] tte_pid;
wire                   [2:0] tte_page_mask;
wire                  [39:0] tte_pa;
wire                         tte_nfo;
wire                         tte_ie;
wire                         tte_cp;
wire                         tte_e;
wire                         tte_p;
wire                         tte_w;
wire                         tte_ep;

assign  tlb_valid        = `SPC4.ifu_ftu.ftu_itb_cust.array.cam.valid;
assign  tlb_match        = `SPC4.ifu_ftu.ftu_itb_cust.array.cam.match;

assign  tte_va           =  {`SPC4.ifu_ftu.ftu_itb_cust.tte_tag_1_dout[`VA_47:`VA_28],
                             `SPC4.ifu_ftu.ftu_itb_cust.tte_tag_1_dout[`VA_27:`VA_22],
                             `SPC4.ifu_ftu.ftu_itb_cust.tte_tag_1_dout[`VA_21:`VA_16],
                             `SPC4.ifu_ftu.ftu_itb_cust.tte_tag_1_dout[`VA_15:`VA_13],
                             13'b0
                            };
assign  tte_context      = `SPC4.ifu_ftu.ftu_itb_cust.tte_tag_1_dout[`CNTX1_HI:`CNTX1_LO];
assign  tte_pid          = `SPC4.ifu_ftu.ftu_itb_cust.tte_tag_1_dout[`PID_HI:`PID_LO];
assign  tte_real         = `SPC4.ifu_ftu.ftu_itb_cust.tte_tag_1_dout[`REAL_BIT];
assign  tte_valid        = `SPC4.ifu_ftu.ftu_itb_cust.tte_tag_1_dout[`TTE_VALID];

assign  tte_page_mask    = `SPC4.ifu_ftu.ftu_itb_cust.tte_page_size_mask_1;

assign  tte_pa           = {`SPC4.ifu_ftu.ftu_itb_cust.tte_data_1[`DATA_PA_39_28_HI:`DATA_PA_39_28_LO],
                            `SPC4.ifu_ftu.ftu_itb_cust.tte_data_1[`DATA_PA_27_22_HI:`DATA_PA_27_22_LO],
                            `SPC4.ifu_ftu.ftu_itb_cust.tte_data_1[`DATA_PA_21_16_HI:`DATA_PA_21_16_LO],
                            `SPC4.ifu_ftu.ftu_itb_cust.tte_data_1[`DATA_PA_15_13_HI:`DATA_PA_15_13_LO],
                            13'b0
                           };
assign  tte_nfo          = `SPC4.ifu_ftu.ftu_itb_cust.tte_data_1[`DATA_NFO];
assign  tte_ie           = `SPC4.ifu_ftu.ftu_itb_cust.tte_data_1[`DATA_IE];
assign  tte_cp           = `SPC4.ifu_ftu.ftu_itb_cust.tte_data_1[`DATA_CP];
assign  tte_e            = `SPC4.ifu_ftu.ftu_itb_cust.tte_data_1[`DATA_X];
assign  tte_p            = `SPC4.ifu_ftu.ftu_itb_cust.tte_data_1[`DATA_P];
assign  tte_w            = `SPC4.ifu_ftu.ftu_itb_cust.tte_data_1[`DATA_W];
assign  tte_ep           = 1'b1;  // not stored in array, but implied as 1

assign ready = `PARGS.tlb_sync_on & !`SPC4.tcu_spc_mbist_start;

//----------------------------------------------------------
initial  begin // {
  #1;
  hwtw = 1'b0;
  data_in_ready = 8'b0;
  @ (posedge `SPC4.l2clk);
end // }

//----------------------------------------------------------
// Must use negedge to avoid race condition
// tlb_replacement_index (aka entry) is created in always block using blocking assignments

always @ (negedge (`SPC4.l2clk & ready)) begin // {

  tstamp = `TOP.core_cycle_cnt;
  demap_tstamp = `TOP.core_cycle_cnt;

  // Delay by 1 cycle to align with skip_demap
  demap_tid_1  <= demap_tid;  // demap_tid is active when demap is asserted
  demap_tnum_1 <= (mycid * 8) + demap_tid;
  demap_1      <= demap;

  // Signal to nas_pipe to suppress SSTEP
  if (asi_wr_itlb!=8'b0) begin //
    for (i=0;i<=7;i=i+1) begin // {
      if (asi_wr_itlb[i])  begin //
        `PR_INFO ("pli_nas", `INFO, "   C%0d T%0d PLI_SSTEP     tid=%d ts=%0d                 (tlb_sync: suppress sstep. sstep_sent=1)",
                       mycid,i,((mycid * 6'h8) + i[2:0]),tstamp);
        `NASTOP.sstep_sent[(mycid * 8) + i] <= 1'b1;      // suppress SSTEP
      end // }
    end // }
  end // }
 
  //----------------------------------------------------------
  //  Send I/DTLBWRITE due to demap
  //

  if ((demap!=0) && (demap_1!=0)) begin // {
    `PR_ERROR ("tlb_sync", `ERROR, 
       "C%0d T%0d Illegal Back to Back ITLB demap",
        mycid,demap_tid_1);
  end // }

  if (demap_active) begin // {
    fifo.pop_fifo ({hwtw,mytid});
    if (`PARGS.nas_check_on && `PARGS.tlb_sync_on) begin // {
        `PR_INFO ("pli_tlb", `INFO, "   C%0d T%0d PLI_ITLBWRITE tid=%d ts=%0d entry=%h (demap)",
                   mycid,demap_tid_1,demap_tnum_1,demap_tstamp,8'hff);
        `PR_INFO ("pli_nas", `INFO, "   C%0d T%0d PLI_SSTEP     tid=%d ts=%0d                 (tlb_sync: send SSTEP)",
                   mycid,demap_tid_1,demap_tnum_1,tstamp);
        junk = $sim_send(`PLI_ITLBWRITE, demap_tnum_1,demap_tstamp,8'hff);
        junk = $sim_send(`PLI_SSTEP, demap_tnum_1);

        // Check to see if sstep was sent early
        if (`NASTOP.sstep_sent[demap_tnum_1]==1) begin // {
          `NASTOP.sstep_early[demap_tnum_1] <= 1'b1;  // SSTEP was sent before nas_pipe capture
        end //}
    end //}
  end //}

  //--------------------
  if (`PARGS.show_tlb_on & (|demap_1)) begin // {
    $write ("SHOW_TLB: ITLB_DEMAP C%0d T%0d ",mycid,demap_tid_1);

    if (demap_active) begin
      case (demap_1)
      4'b0001:  $write ("type=real ");
      4'b0010:  $write ("type=cntx ");
      4'b0100:  $write ("type=page ");
      4'b1000:  $write ("type=all  ");
      default:
          `PR_ERROR ("tlb_sync", `ERROR, 
            "Bench Problem - demap_1(%b) should be one-hot.",demap_1);
      endcase
    end
    else begin
     $write("type=autodemap ");
    end

    $display ("match=%h                               ts=%0d",
                tlb_match,demap_tstamp*`TOP.core_period);

    for (cnt=0; cnt<=NUM_TLB; cnt=cnt+1) begin // {
      if (tlb_match[cnt]==1'b1)  begin // {
        $display ("SHOW_TLB: ITLB_DEMAP C%0d T%0d entry=%h V=0                                                   ts=%0d",
                    mycid,demap_tid_1,cnt,demap_tstamp*`TOP.core_period);
      end // }
    end // }

  end // }

  //----------------------------------------------------------
  //  Send I/DHWTW     due to HWTW
  //  Send I/DTLBWRITE due to ASI write

  // There are 3 main signals to watch for TLBWRITE (data_in, tlb_wr, wr_en)
  // These signals will be interleaved between the threads.
  // Need to queue up the signals over time so they can be processed in order.
  // Each thread will only be doing 1 thing at a time.

  if ((tlb_wr!=8'b0) || (data_in!=8'b0)) begin // {

    for (i=0;i<=7;i=i+1) begin // {

      if ((data_in[i])&&(tlb_wr[i])) begin // {
          `PR_ERROR ("tlb_sync", `ERROR, 
            "Bad Inputs - iwr_data_in & iwr_tlb_wr should not be asserted at same time");
      end // }
      else begin  // {

        // data_in[tid] determines if the write is HWTW or TLBWRITE
        if (data_in[i]) begin // {
          data_in_ready[i] <= 1'b1;
        end // }

        // tlb_wr[tid] determines which thread will write next
        // Use fifo to save the tids of the tlb_wr signals in order
        if (tlb_wr[i]) begin // {
          if (data_in_ready[i]) begin // {
            fifo.push_fifo ({1'b1,i[2:0]}); //  {hwtw,tid[2:0]}
            data_in_ready[i] <= 1'b0;
          end // }
          else begin // {
            fifo.push_fifo ({1'b0,i[2:0]}); //  {!hwtw,tid[2:0]}
          end // }
        end // }

      end // if}
    end // for}

  end // if}

  //----------------------------------------------------------
  // wr_en means that the write is occurring
  if (wr_en) begin // {
    fifo.pop_fifo ({hwtw,mytid});
    mytnum = (mycid * 8) + mytid;

    if (hwtw) begin // { 
       if (`PARGS.nas_check_on && `PARGS.tlb_sync_on) begin // {
           `PR_INFO ("pli_tlb", `INFO, "   C%0d T%0d PLI_IHWTW     tid=%d ts=%0d va=%h entry=%h",
                      mycid,mytid,mytnum,tstamp,tte_va,entry);
            junk = $sim_send(`PLI_IHWTW, mytnum, tstamp,tte_va,entry);

       end //}
    end // }
    else begin // {
      if (`PARGS.nas_check_on && `PARGS.tlb_sync_on) begin // {
           `PR_INFO ("pli_tlb", `INFO, "   C%0d T%0d PLI_ITLBWRITE tid=%d ts=%0d entry=%h",
                      mycid,mytid,mytnum,tstamp,entry);
           `PR_INFO ("pli_nas", `INFO, "   C%0d T%0d PLI_SSTEP     tid=%d ts=%0d                 (tlb_sync: send SSTEP)",
                      mycid,mytid,mytnum,tstamp);
           junk = $sim_send(`PLI_ITLBWRITE, mytnum,tstamp,entry);
           junk = $sim_send(`PLI_SSTEP, mytnum);

           // Check to see if sstep was sent early
           if (`NASTOP.sstep_sent[mytnum]==1) begin // {
             `NASTOP.sstep_early[mytnum] <= 1'b1;  // SSTEP was sent before nas_pipe capture
           end //}
      end //}
    end // }

    //--------------------
    if (`PARGS.show_tlb_on) begin // {
      $write ("SHOW_TLB: ITLB_WRITE C%0d T%0d ",mycid,mytid);

      if (tte_real==0) $write ("entry=%h V=%b VA=%h ",entry,tte_valid,tte_va);
      else             $write ("entry=%h V=%b RA=%h ",entry,tte_valid,tte_va);

      case (tte_page_mask)
      3'b000: $write("R=%b CNTX=%h PID=%h sz=8k         ts=%0d",
                         tte_real,tte_context,tte_pid,tstamp*`TOP.core_period);
      3'b001: $write("R=%b CNTX=%h PID=%h sz=64k        ts=%0d",
                         tte_real,tte_context,tte_pid,tstamp*`TOP.core_period);
      3'b011: $write("R=%b CNTX=%h PID=%h sz=4MB        ts=%0d",
                         tte_real,tte_context,tte_pid,tstamp*`TOP.core_period);
      3'b111: $write("R=%b CNTX=%h PID=%h sz=256MB      ts=%0d",
                         tte_real,tte_context,tte_pid,tstamp*`TOP.core_period);
      endcase

      if (hwtw) $display ("  (hwtw)");
      else      $display ("");

      $write ("SHOW_TLB: ITLB_WRITE C%0d T%0d ",mycid,mytid);

      $display ("             PA=00%h P=%b IE=%b CP=%b NFO=%b E=%b EP=%b W=%b  ts=%0d",
                  tte_pa,tte_p,tte_ie,tte_cp,tte_nfo,tte_e,tte_ep,tte_w,tstamp*`TOP.core_period); 
    end // }
    //--------------------

  end // }

end // always}

//----------------------------------------------------------
`endif
endmodule

`endif
`ifdef CORE_5

module itlb_wr_c5 ();
`ifndef GATESIM

`include "tlb_sync.vh"
`include "nas.vh"
parameter NUM_TLB=64;

wire                    [7:0] data_in;
wire                    [7:0] tlb_wr;
wire                          wr_en;
wire                    [7:0] entry;
wire                    [3:0] demap;
reg                     [3:0] demap_1;
wire                          demap_page;
wire                          demap_context;
wire                          demap_real;
wire                          demap_all;
wire                          skip_demap;
wire                          demap_active;
wire                          auto_demap;
wire                    [2:0] demap_tid;
reg                     [2:0] demap_tid_1;
reg                     [5:0] demap_tnum_1;
wire                    [7:0] asi_wr_itlb;
wire                    [7:0] asi_wr_itlb_demap;
wire                    [7:0] asi_wr_itlb_data_in;
wire                    [7:0] asi_wr_itlb_data_access;

reg         [(`TS_WIDTH-1):0] tstamp;
reg                     [7:0] data_in_ready;
reg                           hwtw;
reg         [(`TS_WIDTH-1):0] demap_tstamp;

reg                     [2:0] mytid;
reg                     [5:0] mytnum;
wire                    [2:0] mycid;
integer                       junk;
integer                       i;
reg                     [7:0] cnt;
wire                          ready;

assign   mycid = 5;

//----------------------------------------------------------
// Instantiate fifo - 1 entry per thread
fifo fifo ();
// Define fifo parameters
defparam fifo.ENTRY_BITS = 4;  // {hwtw,tid[2:0]}
defparam fifo.DEPTH      = 9;  // 1 extra entry for overflow detection
defparam fifo.PTR_BITS   = 4;

//----------------------------------------------------------
// DUT probes

assign   data_in = `SPC5.mmu.asi.htc_wr_itlb_data_in;
assign   tlb_wr = `PROBES5.itlb_wr;
assign   wr_en = `SPC5.ifu_ftu.ftu_itb_cust.tlb_wr_1_in_dout;

assign   entry = `SPC5.ifu_ftu.ftu_itb_cust.rw_index_1[5:0];

assign   demap_page = `SPC5.ifu_ftu.ftu_itc_ctl.itc_demap_page;
assign   demap_context = `SPC5.ifu_ftu.itc_demap_context;
assign   demap_real = `SPC5.ifu_ftu.itc_demap_real;
assign   demap_all = `SPC5.ifu_ftu.itc_demap_all;
assign   demap = {demap_all,demap_page,demap_context,demap_real};
assign   skip_demap = `SPC5.ifu_ftu.itc_wr_u_en;
assign   demap_tid = `SPC5.ifu_ftu.ftu_itd_dp.tte1[37:35];

// if (|demap_1 && skip_demap ), then Implicit demap so don't send to NAS
assign   demap_active = |demap_1 && !skip_demap;
assign   auto_demap   = |demap_1 && skip_demap;


// Signals that are early indication that TLBWRITE or TLBWRITE(demap) will happen.
// Once these signals assert, the write to the TLB cannot be cancelled.
// These signals assert before the MMU reorders the TLB writes.
// Use these to suppress SSTEP in nas_pipe.
// Best case, these signals assert 1 cycle after the previous SSTEP.
assign   asi_wr_itlb_demap             = `SPC5.mmu.asi_wr_immu_demap;
assign   asi_wr_itlb_data_in      = `SPC5.mmu.asi_wr_itlb_data_in;
assign   asi_wr_itlb_data_access  = {`SPC5.mmu.asd1.asi_wr_itlb_data_access,
                                     `SPC5.mmu.asd0.asi_wr_itlb_data_access};
assign   asi_wr_itlb = asi_wr_itlb_demap | asi_wr_itlb_data_in | asi_wr_itlb_data_access;

//---------------------
// Probes for debugging

// defines copied from :/libs/n2sram/tlbs/tlbs/n2_tlb_tl_64x59_cust_l/n2_tlb_tl_64x59_cust/rtl

// n2_tlb_tl_64x59_cam.sv

`define CNTX1_HI 65
`define CNTX1_LO 53
`define PID_HI   52
`define PID_LO   50
`define REAL_BIT 49
`define VA_47    48
`define VA_28    29
`define VA_27    28
`define VA_22    23
`define TTE_VALID 22 
`define VA_21    21
`define VA_16    16
`define VA_15    15 
`define VA_13    13
`define CNTX0_HI 12
`define CNTX0_LO  0

// n2_tlb_tl_64x59_ram.sv

`define DATA_PARITY         36
`define DATA_PA_39_28_HI    35
`define DATA_PA_39_28_LO    24
`define DATA_PA_27_22_HI    23
`define DATA_PA_27_22_LO    18
`define DATA_VA_27_22_V     17 
`define DATA_PA_21_16_HI    16
`define DATA_PA_21_16_LO    11
`define DATA_VA_21_16_V     10 
`define DATA_PA_15_13_HI     9
`define DATA_PA_15_13_LO     7
`define DATA_VA_15_13_V      6 
`define DATA_NFO             5 
`define DATA_IE              4 
`define DATA_CP              3 
`define DATA_X               2 
`define DATA_P               1 
`define DATA_W               0 

wire         [(NUM_TLB-1):0] tlb_valid;
wire         [(NUM_TLB-1):0] tlb_match;
wire                         tte_valid;
wire                  [47:0] tte_va;
wire                  [12:0] tte_context;
wire                         tte_real;
wire                   [2:0] tte_pid;
wire                   [2:0] tte_page_mask;
wire                  [39:0] tte_pa;
wire                         tte_nfo;
wire                         tte_ie;
wire                         tte_cp;
wire                         tte_e;
wire                         tte_p;
wire                         tte_w;
wire                         tte_ep;

assign  tlb_valid        = `SPC5.ifu_ftu.ftu_itb_cust.array.cam.valid;
assign  tlb_match        = `SPC5.ifu_ftu.ftu_itb_cust.array.cam.match;

assign  tte_va           =  {`SPC5.ifu_ftu.ftu_itb_cust.tte_tag_1_dout[`VA_47:`VA_28],
                             `SPC5.ifu_ftu.ftu_itb_cust.tte_tag_1_dout[`VA_27:`VA_22],
                             `SPC5.ifu_ftu.ftu_itb_cust.tte_tag_1_dout[`VA_21:`VA_16],
                             `SPC5.ifu_ftu.ftu_itb_cust.tte_tag_1_dout[`VA_15:`VA_13],
                             13'b0
                            };
assign  tte_context      = `SPC5.ifu_ftu.ftu_itb_cust.tte_tag_1_dout[`CNTX1_HI:`CNTX1_LO];
assign  tte_pid          = `SPC5.ifu_ftu.ftu_itb_cust.tte_tag_1_dout[`PID_HI:`PID_LO];
assign  tte_real         = `SPC5.ifu_ftu.ftu_itb_cust.tte_tag_1_dout[`REAL_BIT];
assign  tte_valid        = `SPC5.ifu_ftu.ftu_itb_cust.tte_tag_1_dout[`TTE_VALID];

assign  tte_page_mask    = `SPC5.ifu_ftu.ftu_itb_cust.tte_page_size_mask_1;

assign  tte_pa           = {`SPC5.ifu_ftu.ftu_itb_cust.tte_data_1[`DATA_PA_39_28_HI:`DATA_PA_39_28_LO],
                            `SPC5.ifu_ftu.ftu_itb_cust.tte_data_1[`DATA_PA_27_22_HI:`DATA_PA_27_22_LO],
                            `SPC5.ifu_ftu.ftu_itb_cust.tte_data_1[`DATA_PA_21_16_HI:`DATA_PA_21_16_LO],
                            `SPC5.ifu_ftu.ftu_itb_cust.tte_data_1[`DATA_PA_15_13_HI:`DATA_PA_15_13_LO],
                            13'b0
                           };
assign  tte_nfo          = `SPC5.ifu_ftu.ftu_itb_cust.tte_data_1[`DATA_NFO];
assign  tte_ie           = `SPC5.ifu_ftu.ftu_itb_cust.tte_data_1[`DATA_IE];
assign  tte_cp           = `SPC5.ifu_ftu.ftu_itb_cust.tte_data_1[`DATA_CP];
assign  tte_e            = `SPC5.ifu_ftu.ftu_itb_cust.tte_data_1[`DATA_X];
assign  tte_p            = `SPC5.ifu_ftu.ftu_itb_cust.tte_data_1[`DATA_P];
assign  tte_w            = `SPC5.ifu_ftu.ftu_itb_cust.tte_data_1[`DATA_W];
assign  tte_ep           = 1'b1;  // not stored in array, but implied as 1

assign ready = `PARGS.tlb_sync_on & !`SPC5.tcu_spc_mbist_start;

//----------------------------------------------------------
initial  begin // {
  #1;
  hwtw = 1'b0;
  data_in_ready = 8'b0;
  @ (posedge `SPC5.l2clk);
end // }

//----------------------------------------------------------
// Must use negedge to avoid race condition
// tlb_replacement_index (aka entry) is created in always block using blocking assignments

always @ (negedge (`SPC5.l2clk & ready)) begin // {

  tstamp = `TOP.core_cycle_cnt;
  demap_tstamp = `TOP.core_cycle_cnt;

  // Delay by 1 cycle to align with skip_demap
  demap_tid_1  <= demap_tid;  // demap_tid is active when demap is asserted
  demap_tnum_1 <= (mycid * 8) + demap_tid;
  demap_1      <= demap;

  // Signal to nas_pipe to suppress SSTEP
  if (asi_wr_itlb!=8'b0) begin //
    for (i=0;i<=7;i=i+1) begin // {
      if (asi_wr_itlb[i])  begin //
        `PR_INFO ("pli_nas", `INFO, "   C%0d T%0d PLI_SSTEP     tid=%d ts=%0d                 (tlb_sync: suppress sstep. sstep_sent=1)",
                       mycid,i,((mycid * 6'h8) + i[2:0]),tstamp);
        `NASTOP.sstep_sent[(mycid * 8) + i] <= 1'b1;      // suppress SSTEP
      end // }
    end // }
  end // }
 
  //----------------------------------------------------------
  //  Send I/DTLBWRITE due to demap
  //

  if ((demap!=0) && (demap_1!=0)) begin // {
    `PR_ERROR ("tlb_sync", `ERROR, 
       "C%0d T%0d Illegal Back to Back ITLB demap",
        mycid,demap_tid_1);
  end // }

  if (demap_active) begin // {
    fifo.pop_fifo ({hwtw,mytid});
    if (`PARGS.nas_check_on && `PARGS.tlb_sync_on) begin // {
        `PR_INFO ("pli_tlb", `INFO, "   C%0d T%0d PLI_ITLBWRITE tid=%d ts=%0d entry=%h (demap)",
                   mycid,demap_tid_1,demap_tnum_1,demap_tstamp,8'hff);
        `PR_INFO ("pli_nas", `INFO, "   C%0d T%0d PLI_SSTEP     tid=%d ts=%0d                 (tlb_sync: send SSTEP)",
                   mycid,demap_tid_1,demap_tnum_1,tstamp);
        junk = $sim_send(`PLI_ITLBWRITE, demap_tnum_1,demap_tstamp,8'hff);
        junk = $sim_send(`PLI_SSTEP, demap_tnum_1);

        // Check to see if sstep was sent early
        if (`NASTOP.sstep_sent[demap_tnum_1]==1) begin // {
          `NASTOP.sstep_early[demap_tnum_1] <= 1'b1;  // SSTEP was sent before nas_pipe capture
        end //}
    end //}
  end //}

  //--------------------
  if (`PARGS.show_tlb_on & (|demap_1)) begin // {
    $write ("SHOW_TLB: ITLB_DEMAP C%0d T%0d ",mycid,demap_tid_1);

    if (demap_active) begin
      case (demap_1)
      4'b0001:  $write ("type=real ");
      4'b0010:  $write ("type=cntx ");
      4'b0100:  $write ("type=page ");
      4'b1000:  $write ("type=all  ");
      default:
          `PR_ERROR ("tlb_sync", `ERROR, 
            "Bench Problem - demap_1(%b) should be one-hot.",demap_1);
      endcase
    end
    else begin
     $write("type=autodemap ");
    end

    $display ("match=%h                               ts=%0d",
                tlb_match,demap_tstamp*`TOP.core_period);

    for (cnt=0; cnt<=NUM_TLB; cnt=cnt+1) begin // {
      if (tlb_match[cnt]==1'b1)  begin // {
        $display ("SHOW_TLB: ITLB_DEMAP C%0d T%0d entry=%h V=0                                                   ts=%0d",
                    mycid,demap_tid_1,cnt,demap_tstamp*`TOP.core_period);
      end // }
    end // }

  end // }

  //----------------------------------------------------------
  //  Send I/DHWTW     due to HWTW
  //  Send I/DTLBWRITE due to ASI write

  // There are 3 main signals to watch for TLBWRITE (data_in, tlb_wr, wr_en)
  // These signals will be interleaved between the threads.
  // Need to queue up the signals over time so they can be processed in order.
  // Each thread will only be doing 1 thing at a time.

  if ((tlb_wr!=8'b0) || (data_in!=8'b0)) begin // {

    for (i=0;i<=7;i=i+1) begin // {

      if ((data_in[i])&&(tlb_wr[i])) begin // {
          `PR_ERROR ("tlb_sync", `ERROR, 
            "Bad Inputs - iwr_data_in & iwr_tlb_wr should not be asserted at same time");
      end // }
      else begin  // {

        // data_in[tid] determines if the write is HWTW or TLBWRITE
        if (data_in[i]) begin // {
          data_in_ready[i] <= 1'b1;
        end // }

        // tlb_wr[tid] determines which thread will write next
        // Use fifo to save the tids of the tlb_wr signals in order
        if (tlb_wr[i]) begin // {
          if (data_in_ready[i]) begin // {
            fifo.push_fifo ({1'b1,i[2:0]}); //  {hwtw,tid[2:0]}
            data_in_ready[i] <= 1'b0;
          end // }
          else begin // {
            fifo.push_fifo ({1'b0,i[2:0]}); //  {!hwtw,tid[2:0]}
          end // }
        end // }

      end // if}
    end // for}

  end // if}

  //----------------------------------------------------------
  // wr_en means that the write is occurring
  if (wr_en) begin // {
    fifo.pop_fifo ({hwtw,mytid});
    mytnum = (mycid * 8) + mytid;

    if (hwtw) begin // { 
       if (`PARGS.nas_check_on && `PARGS.tlb_sync_on) begin // {
           `PR_INFO ("pli_tlb", `INFO, "   C%0d T%0d PLI_IHWTW     tid=%d ts=%0d va=%h entry=%h",
                      mycid,mytid,mytnum,tstamp,tte_va,entry);
            junk = $sim_send(`PLI_IHWTW, mytnum, tstamp,tte_va,entry);

       end //}
    end // }
    else begin // {
      if (`PARGS.nas_check_on && `PARGS.tlb_sync_on) begin // {
           `PR_INFO ("pli_tlb", `INFO, "   C%0d T%0d PLI_ITLBWRITE tid=%d ts=%0d entry=%h",
                      mycid,mytid,mytnum,tstamp,entry);
           `PR_INFO ("pli_nas", `INFO, "   C%0d T%0d PLI_SSTEP     tid=%d ts=%0d                 (tlb_sync: send SSTEP)",
                      mycid,mytid,mytnum,tstamp);
           junk = $sim_send(`PLI_ITLBWRITE, mytnum,tstamp,entry);
           junk = $sim_send(`PLI_SSTEP, mytnum);

           // Check to see if sstep was sent early
           if (`NASTOP.sstep_sent[mytnum]==1) begin // {
             `NASTOP.sstep_early[mytnum] <= 1'b1;  // SSTEP was sent before nas_pipe capture
           end //}
      end //}
    end // }

    //--------------------
    if (`PARGS.show_tlb_on) begin // {
      $write ("SHOW_TLB: ITLB_WRITE C%0d T%0d ",mycid,mytid);

      if (tte_real==0) $write ("entry=%h V=%b VA=%h ",entry,tte_valid,tte_va);
      else             $write ("entry=%h V=%b RA=%h ",entry,tte_valid,tte_va);

      case (tte_page_mask)
      3'b000: $write("R=%b CNTX=%h PID=%h sz=8k         ts=%0d",
                         tte_real,tte_context,tte_pid,tstamp*`TOP.core_period);
      3'b001: $write("R=%b CNTX=%h PID=%h sz=64k        ts=%0d",
                         tte_real,tte_context,tte_pid,tstamp*`TOP.core_period);
      3'b011: $write("R=%b CNTX=%h PID=%h sz=4MB        ts=%0d",
                         tte_real,tte_context,tte_pid,tstamp*`TOP.core_period);
      3'b111: $write("R=%b CNTX=%h PID=%h sz=256MB      ts=%0d",
                         tte_real,tte_context,tte_pid,tstamp*`TOP.core_period);
      endcase

      if (hwtw) $display ("  (hwtw)");
      else      $display ("");

      $write ("SHOW_TLB: ITLB_WRITE C%0d T%0d ",mycid,mytid);

      $display ("             PA=00%h P=%b IE=%b CP=%b NFO=%b E=%b EP=%b W=%b  ts=%0d",
                  tte_pa,tte_p,tte_ie,tte_cp,tte_nfo,tte_e,tte_ep,tte_w,tstamp*`TOP.core_period); 
    end // }
    //--------------------

  end // }

end // always}

//----------------------------------------------------------
`endif
endmodule

`endif
`ifdef CORE_6

module itlb_wr_c6 ();
`ifndef GATESIM

`include "tlb_sync.vh"
`include "nas.vh"
parameter NUM_TLB=64;

wire                    [7:0] data_in;
wire                    [7:0] tlb_wr;
wire                          wr_en;
wire                    [7:0] entry;
wire                    [3:0] demap;
reg                     [3:0] demap_1;
wire                          demap_page;
wire                          demap_context;
wire                          demap_real;
wire                          demap_all;
wire                          skip_demap;
wire                          demap_active;
wire                          auto_demap;
wire                    [2:0] demap_tid;
reg                     [2:0] demap_tid_1;
reg                     [5:0] demap_tnum_1;
wire                    [7:0] asi_wr_itlb;
wire                    [7:0] asi_wr_itlb_demap;
wire                    [7:0] asi_wr_itlb_data_in;
wire                    [7:0] asi_wr_itlb_data_access;

reg         [(`TS_WIDTH-1):0] tstamp;
reg                     [7:0] data_in_ready;
reg                           hwtw;
reg         [(`TS_WIDTH-1):0] demap_tstamp;

reg                     [2:0] mytid;
reg                     [5:0] mytnum;
wire                    [2:0] mycid;
integer                       junk;
integer                       i;
reg                     [7:0] cnt;
wire                          ready;

assign   mycid = 6;

//----------------------------------------------------------
// Instantiate fifo - 1 entry per thread
fifo fifo ();
// Define fifo parameters
defparam fifo.ENTRY_BITS = 4;  // {hwtw,tid[2:0]}
defparam fifo.DEPTH      = 9;  // 1 extra entry for overflow detection
defparam fifo.PTR_BITS   = 4;

//----------------------------------------------------------
// DUT probes

assign   data_in = `SPC6.mmu.asi.htc_wr_itlb_data_in;
assign   tlb_wr = `PROBES6.itlb_wr;
assign   wr_en = `SPC6.ifu_ftu.ftu_itb_cust.tlb_wr_1_in_dout;

assign   entry = `SPC6.ifu_ftu.ftu_itb_cust.rw_index_1[5:0];

assign   demap_page = `SPC6.ifu_ftu.ftu_itc_ctl.itc_demap_page;
assign   demap_context = `SPC6.ifu_ftu.itc_demap_context;
assign   demap_real = `SPC6.ifu_ftu.itc_demap_real;
assign   demap_all = `SPC6.ifu_ftu.itc_demap_all;
assign   demap = {demap_all,demap_page,demap_context,demap_real};
assign   skip_demap = `SPC6.ifu_ftu.itc_wr_u_en;
assign   demap_tid = `SPC6.ifu_ftu.ftu_itd_dp.tte1[37:35];

// if (|demap_1 && skip_demap ), then Implicit demap so don't send to NAS
assign   demap_active = |demap_1 && !skip_demap;
assign   auto_demap   = |demap_1 && skip_demap;


// Signals that are early indication that TLBWRITE or TLBWRITE(demap) will happen.
// Once these signals assert, the write to the TLB cannot be cancelled.
// These signals assert before the MMU reorders the TLB writes.
// Use these to suppress SSTEP in nas_pipe.
// Best case, these signals assert 1 cycle after the previous SSTEP.
assign   asi_wr_itlb_demap             = `SPC6.mmu.asi_wr_immu_demap;
assign   asi_wr_itlb_data_in      = `SPC6.mmu.asi_wr_itlb_data_in;
assign   asi_wr_itlb_data_access  = {`SPC6.mmu.asd1.asi_wr_itlb_data_access,
                                     `SPC6.mmu.asd0.asi_wr_itlb_data_access};
assign   asi_wr_itlb = asi_wr_itlb_demap | asi_wr_itlb_data_in | asi_wr_itlb_data_access;

//---------------------
// Probes for debugging

// defines copied from :/libs/n2sram/tlbs/tlbs/n2_tlb_tl_64x59_cust_l/n2_tlb_tl_64x59_cust/rtl

// n2_tlb_tl_64x59_cam.sv

`define CNTX1_HI 65
`define CNTX1_LO 53
`define PID_HI   52
`define PID_LO   50
`define REAL_BIT 49
`define VA_47    48
`define VA_28    29
`define VA_27    28
`define VA_22    23
`define TTE_VALID 22 
`define VA_21    21
`define VA_16    16
`define VA_15    15 
`define VA_13    13
`define CNTX0_HI 12
`define CNTX0_LO  0

// n2_tlb_tl_64x59_ram.sv

`define DATA_PARITY         36
`define DATA_PA_39_28_HI    35
`define DATA_PA_39_28_LO    24
`define DATA_PA_27_22_HI    23
`define DATA_PA_27_22_LO    18
`define DATA_VA_27_22_V     17 
`define DATA_PA_21_16_HI    16
`define DATA_PA_21_16_LO    11
`define DATA_VA_21_16_V     10 
`define DATA_PA_15_13_HI     9
`define DATA_PA_15_13_LO     7
`define DATA_VA_15_13_V      6 
`define DATA_NFO             5 
`define DATA_IE              4 
`define DATA_CP              3 
`define DATA_X               2 
`define DATA_P               1 
`define DATA_W               0 

wire         [(NUM_TLB-1):0] tlb_valid;
wire         [(NUM_TLB-1):0] tlb_match;
wire                         tte_valid;
wire                  [47:0] tte_va;
wire                  [12:0] tte_context;
wire                         tte_real;
wire                   [2:0] tte_pid;
wire                   [2:0] tte_page_mask;
wire                  [39:0] tte_pa;
wire                         tte_nfo;
wire                         tte_ie;
wire                         tte_cp;
wire                         tte_e;
wire                         tte_p;
wire                         tte_w;
wire                         tte_ep;

assign  tlb_valid        = `SPC6.ifu_ftu.ftu_itb_cust.array.cam.valid;
assign  tlb_match        = `SPC6.ifu_ftu.ftu_itb_cust.array.cam.match;

assign  tte_va           =  {`SPC6.ifu_ftu.ftu_itb_cust.tte_tag_1_dout[`VA_47:`VA_28],
                             `SPC6.ifu_ftu.ftu_itb_cust.tte_tag_1_dout[`VA_27:`VA_22],
                             `SPC6.ifu_ftu.ftu_itb_cust.tte_tag_1_dout[`VA_21:`VA_16],
                             `SPC6.ifu_ftu.ftu_itb_cust.tte_tag_1_dout[`VA_15:`VA_13],
                             13'b0
                            };
assign  tte_context      = `SPC6.ifu_ftu.ftu_itb_cust.tte_tag_1_dout[`CNTX1_HI:`CNTX1_LO];
assign  tte_pid          = `SPC6.ifu_ftu.ftu_itb_cust.tte_tag_1_dout[`PID_HI:`PID_LO];
assign  tte_real         = `SPC6.ifu_ftu.ftu_itb_cust.tte_tag_1_dout[`REAL_BIT];
assign  tte_valid        = `SPC6.ifu_ftu.ftu_itb_cust.tte_tag_1_dout[`TTE_VALID];

assign  tte_page_mask    = `SPC6.ifu_ftu.ftu_itb_cust.tte_page_size_mask_1;

assign  tte_pa           = {`SPC6.ifu_ftu.ftu_itb_cust.tte_data_1[`DATA_PA_39_28_HI:`DATA_PA_39_28_LO],
                            `SPC6.ifu_ftu.ftu_itb_cust.tte_data_1[`DATA_PA_27_22_HI:`DATA_PA_27_22_LO],
                            `SPC6.ifu_ftu.ftu_itb_cust.tte_data_1[`DATA_PA_21_16_HI:`DATA_PA_21_16_LO],
                            `SPC6.ifu_ftu.ftu_itb_cust.tte_data_1[`DATA_PA_15_13_HI:`DATA_PA_15_13_LO],
                            13'b0
                           };
assign  tte_nfo          = `SPC6.ifu_ftu.ftu_itb_cust.tte_data_1[`DATA_NFO];
assign  tte_ie           = `SPC6.ifu_ftu.ftu_itb_cust.tte_data_1[`DATA_IE];
assign  tte_cp           = `SPC6.ifu_ftu.ftu_itb_cust.tte_data_1[`DATA_CP];
assign  tte_e            = `SPC6.ifu_ftu.ftu_itb_cust.tte_data_1[`DATA_X];
assign  tte_p            = `SPC6.ifu_ftu.ftu_itb_cust.tte_data_1[`DATA_P];
assign  tte_w            = `SPC6.ifu_ftu.ftu_itb_cust.tte_data_1[`DATA_W];
assign  tte_ep           = 1'b1;  // not stored in array, but implied as 1

assign ready = `PARGS.tlb_sync_on & !`SPC6.tcu_spc_mbist_start;

//----------------------------------------------------------
initial  begin // {
  #1;
  hwtw = 1'b0;
  data_in_ready = 8'b0;
  @ (posedge `SPC6.l2clk);
end // }

//----------------------------------------------------------
// Must use negedge to avoid race condition
// tlb_replacement_index (aka entry) is created in always block using blocking assignments

always @ (negedge (`SPC6.l2clk & ready)) begin // {

  tstamp = `TOP.core_cycle_cnt;
  demap_tstamp = `TOP.core_cycle_cnt;

  // Delay by 1 cycle to align with skip_demap
  demap_tid_1  <= demap_tid;  // demap_tid is active when demap is asserted
  demap_tnum_1 <= (mycid * 8) + demap_tid;
  demap_1      <= demap;

  // Signal to nas_pipe to suppress SSTEP
  if (asi_wr_itlb!=8'b0) begin //
    for (i=0;i<=7;i=i+1) begin // {
      if (asi_wr_itlb[i])  begin //
        `PR_INFO ("pli_nas", `INFO, "   C%0d T%0d PLI_SSTEP     tid=%d ts=%0d                 (tlb_sync: suppress sstep. sstep_sent=1)",
                       mycid,i,((mycid * 6'h8) + i[2:0]),tstamp);
        `NASTOP.sstep_sent[(mycid * 8) + i] <= 1'b1;      // suppress SSTEP
      end // }
    end // }
  end // }
 
  //----------------------------------------------------------
  //  Send I/DTLBWRITE due to demap
  //

  if ((demap!=0) && (demap_1!=0)) begin // {
    `PR_ERROR ("tlb_sync", `ERROR, 
       "C%0d T%0d Illegal Back to Back ITLB demap",
        mycid,demap_tid_1);
  end // }

  if (demap_active) begin // {
    fifo.pop_fifo ({hwtw,mytid});
    if (`PARGS.nas_check_on && `PARGS.tlb_sync_on) begin // {
        `PR_INFO ("pli_tlb", `INFO, "   C%0d T%0d PLI_ITLBWRITE tid=%d ts=%0d entry=%h (demap)",
                   mycid,demap_tid_1,demap_tnum_1,demap_tstamp,8'hff);
        `PR_INFO ("pli_nas", `INFO, "   C%0d T%0d PLI_SSTEP     tid=%d ts=%0d                 (tlb_sync: send SSTEP)",
                   mycid,demap_tid_1,demap_tnum_1,tstamp);
        junk = $sim_send(`PLI_ITLBWRITE, demap_tnum_1,demap_tstamp,8'hff);
        junk = $sim_send(`PLI_SSTEP, demap_tnum_1);

        // Check to see if sstep was sent early
        if (`NASTOP.sstep_sent[demap_tnum_1]==1) begin // {
          `NASTOP.sstep_early[demap_tnum_1] <= 1'b1;  // SSTEP was sent before nas_pipe capture
        end //}
    end //}
  end //}

  //--------------------
  if (`PARGS.show_tlb_on & (|demap_1)) begin // {
    $write ("SHOW_TLB: ITLB_DEMAP C%0d T%0d ",mycid,demap_tid_1);

    if (demap_active) begin
      case (demap_1)
      4'b0001:  $write ("type=real ");
      4'b0010:  $write ("type=cntx ");
      4'b0100:  $write ("type=page ");
      4'b1000:  $write ("type=all  ");
      default:
          `PR_ERROR ("tlb_sync", `ERROR, 
            "Bench Problem - demap_1(%b) should be one-hot.",demap_1);
      endcase
    end
    else begin
     $write("type=autodemap ");
    end

    $display ("match=%h                               ts=%0d",
                tlb_match,demap_tstamp*`TOP.core_period);

    for (cnt=0; cnt<=NUM_TLB; cnt=cnt+1) begin // {
      if (tlb_match[cnt]==1'b1)  begin // {
        $display ("SHOW_TLB: ITLB_DEMAP C%0d T%0d entry=%h V=0                                                   ts=%0d",
                    mycid,demap_tid_1,cnt,demap_tstamp*`TOP.core_period);
      end // }
    end // }

  end // }

  //----------------------------------------------------------
  //  Send I/DHWTW     due to HWTW
  //  Send I/DTLBWRITE due to ASI write

  // There are 3 main signals to watch for TLBWRITE (data_in, tlb_wr, wr_en)
  // These signals will be interleaved between the threads.
  // Need to queue up the signals over time so they can be processed in order.
  // Each thread will only be doing 1 thing at a time.

  if ((tlb_wr!=8'b0) || (data_in!=8'b0)) begin // {

    for (i=0;i<=7;i=i+1) begin // {

      if ((data_in[i])&&(tlb_wr[i])) begin // {
          `PR_ERROR ("tlb_sync", `ERROR, 
            "Bad Inputs - iwr_data_in & iwr_tlb_wr should not be asserted at same time");
      end // }
      else begin  // {

        // data_in[tid] determines if the write is HWTW or TLBWRITE
        if (data_in[i]) begin // {
          data_in_ready[i] <= 1'b1;
        end // }

        // tlb_wr[tid] determines which thread will write next
        // Use fifo to save the tids of the tlb_wr signals in order
        if (tlb_wr[i]) begin // {
          if (data_in_ready[i]) begin // {
            fifo.push_fifo ({1'b1,i[2:0]}); //  {hwtw,tid[2:0]}
            data_in_ready[i] <= 1'b0;
          end // }
          else begin // {
            fifo.push_fifo ({1'b0,i[2:0]}); //  {!hwtw,tid[2:0]}
          end // }
        end // }

      end // if}
    end // for}

  end // if}

  //----------------------------------------------------------
  // wr_en means that the write is occurring
  if (wr_en) begin // {
    fifo.pop_fifo ({hwtw,mytid});
    mytnum = (mycid * 8) + mytid;

    if (hwtw) begin // { 
       if (`PARGS.nas_check_on && `PARGS.tlb_sync_on) begin // {
           `PR_INFO ("pli_tlb", `INFO, "   C%0d T%0d PLI_IHWTW     tid=%d ts=%0d va=%h entry=%h",
                      mycid,mytid,mytnum,tstamp,tte_va,entry);
            junk = $sim_send(`PLI_IHWTW, mytnum, tstamp,tte_va,entry);

       end //}
    end // }
    else begin // {
      if (`PARGS.nas_check_on && `PARGS.tlb_sync_on) begin // {
           `PR_INFO ("pli_tlb", `INFO, "   C%0d T%0d PLI_ITLBWRITE tid=%d ts=%0d entry=%h",
                      mycid,mytid,mytnum,tstamp,entry);
           `PR_INFO ("pli_nas", `INFO, "   C%0d T%0d PLI_SSTEP     tid=%d ts=%0d                 (tlb_sync: send SSTEP)",
                      mycid,mytid,mytnum,tstamp);
           junk = $sim_send(`PLI_ITLBWRITE, mytnum,tstamp,entry);
           junk = $sim_send(`PLI_SSTEP, mytnum);

           // Check to see if sstep was sent early
           if (`NASTOP.sstep_sent[mytnum]==1) begin // {
             `NASTOP.sstep_early[mytnum] <= 1'b1;  // SSTEP was sent before nas_pipe capture
           end //}
      end //}
    end // }

    //--------------------
    if (`PARGS.show_tlb_on) begin // {
      $write ("SHOW_TLB: ITLB_WRITE C%0d T%0d ",mycid,mytid);

      if (tte_real==0) $write ("entry=%h V=%b VA=%h ",entry,tte_valid,tte_va);
      else             $write ("entry=%h V=%b RA=%h ",entry,tte_valid,tte_va);

      case (tte_page_mask)
      3'b000: $write("R=%b CNTX=%h PID=%h sz=8k         ts=%0d",
                         tte_real,tte_context,tte_pid,tstamp*`TOP.core_period);
      3'b001: $write("R=%b CNTX=%h PID=%h sz=64k        ts=%0d",
                         tte_real,tte_context,tte_pid,tstamp*`TOP.core_period);
      3'b011: $write("R=%b CNTX=%h PID=%h sz=4MB        ts=%0d",
                         tte_real,tte_context,tte_pid,tstamp*`TOP.core_period);
      3'b111: $write("R=%b CNTX=%h PID=%h sz=256MB      ts=%0d",
                         tte_real,tte_context,tte_pid,tstamp*`TOP.core_period);
      endcase

      if (hwtw) $display ("  (hwtw)");
      else      $display ("");

      $write ("SHOW_TLB: ITLB_WRITE C%0d T%0d ",mycid,mytid);

      $display ("             PA=00%h P=%b IE=%b CP=%b NFO=%b E=%b EP=%b W=%b  ts=%0d",
                  tte_pa,tte_p,tte_ie,tte_cp,tte_nfo,tte_e,tte_ep,tte_w,tstamp*`TOP.core_period); 
    end // }
    //--------------------

  end // }

end // always}

//----------------------------------------------------------
`endif
endmodule

`endif
`ifdef CORE_7

module itlb_wr_c7 ();
`ifndef GATESIM

`include "tlb_sync.vh"
`include "nas.vh"
parameter NUM_TLB=64;

wire                    [7:0] data_in;
wire                    [7:0] tlb_wr;
wire                          wr_en;
wire                    [7:0] entry;
wire                    [3:0] demap;
reg                     [3:0] demap_1;
wire                          demap_page;
wire                          demap_context;
wire                          demap_real;
wire                          demap_all;
wire                          skip_demap;
wire                          demap_active;
wire                          auto_demap;
wire                    [2:0] demap_tid;
reg                     [2:0] demap_tid_1;
reg                     [5:0] demap_tnum_1;
wire                    [7:0] asi_wr_itlb;
wire                    [7:0] asi_wr_itlb_demap;
wire                    [7:0] asi_wr_itlb_data_in;
wire                    [7:0] asi_wr_itlb_data_access;

reg         [(`TS_WIDTH-1):0] tstamp;
reg                     [7:0] data_in_ready;
reg                           hwtw;
reg         [(`TS_WIDTH-1):0] demap_tstamp;

reg                     [2:0] mytid;
reg                     [5:0] mytnum;
wire                    [2:0] mycid;
integer                       junk;
integer                       i;
reg                     [7:0] cnt;
wire                          ready;

assign   mycid = 7;

//----------------------------------------------------------
// Instantiate fifo - 1 entry per thread
fifo fifo ();
// Define fifo parameters
defparam fifo.ENTRY_BITS = 4;  // {hwtw,tid[2:0]}
defparam fifo.DEPTH      = 9;  // 1 extra entry for overflow detection
defparam fifo.PTR_BITS   = 4;

//----------------------------------------------------------
// DUT probes

assign   data_in = `SPC7.mmu.asi.htc_wr_itlb_data_in;
assign   tlb_wr = `PROBES7.itlb_wr;
assign   wr_en = `SPC7.ifu_ftu.ftu_itb_cust.tlb_wr_1_in_dout;

assign   entry = `SPC7.ifu_ftu.ftu_itb_cust.rw_index_1[5:0];

assign   demap_page = `SPC7.ifu_ftu.ftu_itc_ctl.itc_demap_page;
assign   demap_context = `SPC7.ifu_ftu.itc_demap_context;
assign   demap_real = `SPC7.ifu_ftu.itc_demap_real;
assign   demap_all = `SPC7.ifu_ftu.itc_demap_all;
assign   demap = {demap_all,demap_page,demap_context,demap_real};
assign   skip_demap = `SPC7.ifu_ftu.itc_wr_u_en;
assign   demap_tid = `SPC7.ifu_ftu.ftu_itd_dp.tte1[37:35];

// if (|demap_1 && skip_demap ), then Implicit demap so don't send to NAS
assign   demap_active = |demap_1 && !skip_demap;
assign   auto_demap   = |demap_1 && skip_demap;


// Signals that are early indication that TLBWRITE or TLBWRITE(demap) will happen.
// Once these signals assert, the write to the TLB cannot be cancelled.
// These signals assert before the MMU reorders the TLB writes.
// Use these to suppress SSTEP in nas_pipe.
// Best case, these signals assert 1 cycle after the previous SSTEP.
assign   asi_wr_itlb_demap             = `SPC7.mmu.asi_wr_immu_demap;
assign   asi_wr_itlb_data_in      = `SPC7.mmu.asi_wr_itlb_data_in;
assign   asi_wr_itlb_data_access  = {`SPC7.mmu.asd1.asi_wr_itlb_data_access,
                                     `SPC7.mmu.asd0.asi_wr_itlb_data_access};
assign   asi_wr_itlb = asi_wr_itlb_demap | asi_wr_itlb_data_in | asi_wr_itlb_data_access;

//---------------------
// Probes for debugging

// defines copied from :/libs/n2sram/tlbs/tlbs/n2_tlb_tl_64x59_cust_l/n2_tlb_tl_64x59_cust/rtl

// n2_tlb_tl_64x59_cam.sv

`define CNTX1_HI 65
`define CNTX1_LO 53
`define PID_HI   52
`define PID_LO   50
`define REAL_BIT 49
`define VA_47    48
`define VA_28    29
`define VA_27    28
`define VA_22    23
`define TTE_VALID 22 
`define VA_21    21
`define VA_16    16
`define VA_15    15 
`define VA_13    13
`define CNTX0_HI 12
`define CNTX0_LO  0

// n2_tlb_tl_64x59_ram.sv

`define DATA_PARITY         36
`define DATA_PA_39_28_HI    35
`define DATA_PA_39_28_LO    24
`define DATA_PA_27_22_HI    23
`define DATA_PA_27_22_LO    18
`define DATA_VA_27_22_V     17 
`define DATA_PA_21_16_HI    16
`define DATA_PA_21_16_LO    11
`define DATA_VA_21_16_V     10 
`define DATA_PA_15_13_HI     9
`define DATA_PA_15_13_LO     7
`define DATA_VA_15_13_V      6 
`define DATA_NFO             5 
`define DATA_IE              4 
`define DATA_CP              3 
`define DATA_X               2 
`define DATA_P               1 
`define DATA_W               0 

wire         [(NUM_TLB-1):0] tlb_valid;
wire         [(NUM_TLB-1):0] tlb_match;
wire                         tte_valid;
wire                  [47:0] tte_va;
wire                  [12:0] tte_context;
wire                         tte_real;
wire                   [2:0] tte_pid;
wire                   [2:0] tte_page_mask;
wire                  [39:0] tte_pa;
wire                         tte_nfo;
wire                         tte_ie;
wire                         tte_cp;
wire                         tte_e;
wire                         tte_p;
wire                         tte_w;
wire                         tte_ep;

assign  tlb_valid        = `SPC7.ifu_ftu.ftu_itb_cust.array.cam.valid;
assign  tlb_match        = `SPC7.ifu_ftu.ftu_itb_cust.array.cam.match;

assign  tte_va           =  {`SPC7.ifu_ftu.ftu_itb_cust.tte_tag_1_dout[`VA_47:`VA_28],
                             `SPC7.ifu_ftu.ftu_itb_cust.tte_tag_1_dout[`VA_27:`VA_22],
                             `SPC7.ifu_ftu.ftu_itb_cust.tte_tag_1_dout[`VA_21:`VA_16],
                             `SPC7.ifu_ftu.ftu_itb_cust.tte_tag_1_dout[`VA_15:`VA_13],
                             13'b0
                            };
assign  tte_context      = `SPC7.ifu_ftu.ftu_itb_cust.tte_tag_1_dout[`CNTX1_HI:`CNTX1_LO];
assign  tte_pid          = `SPC7.ifu_ftu.ftu_itb_cust.tte_tag_1_dout[`PID_HI:`PID_LO];
assign  tte_real         = `SPC7.ifu_ftu.ftu_itb_cust.tte_tag_1_dout[`REAL_BIT];
assign  tte_valid        = `SPC7.ifu_ftu.ftu_itb_cust.tte_tag_1_dout[`TTE_VALID];

assign  tte_page_mask    = `SPC7.ifu_ftu.ftu_itb_cust.tte_page_size_mask_1;

assign  tte_pa           = {`SPC7.ifu_ftu.ftu_itb_cust.tte_data_1[`DATA_PA_39_28_HI:`DATA_PA_39_28_LO],
                            `SPC7.ifu_ftu.ftu_itb_cust.tte_data_1[`DATA_PA_27_22_HI:`DATA_PA_27_22_LO],
                            `SPC7.ifu_ftu.ftu_itb_cust.tte_data_1[`DATA_PA_21_16_HI:`DATA_PA_21_16_LO],
                            `SPC7.ifu_ftu.ftu_itb_cust.tte_data_1[`DATA_PA_15_13_HI:`DATA_PA_15_13_LO],
                            13'b0
                           };
assign  tte_nfo          = `SPC7.ifu_ftu.ftu_itb_cust.tte_data_1[`DATA_NFO];
assign  tte_ie           = `SPC7.ifu_ftu.ftu_itb_cust.tte_data_1[`DATA_IE];
assign  tte_cp           = `SPC7.ifu_ftu.ftu_itb_cust.tte_data_1[`DATA_CP];
assign  tte_e            = `SPC7.ifu_ftu.ftu_itb_cust.tte_data_1[`DATA_X];
assign  tte_p            = `SPC7.ifu_ftu.ftu_itb_cust.tte_data_1[`DATA_P];
assign  tte_w            = `SPC7.ifu_ftu.ftu_itb_cust.tte_data_1[`DATA_W];
assign  tte_ep           = 1'b1;  // not stored in array, but implied as 1

assign ready = `PARGS.tlb_sync_on & !`SPC7.tcu_spc_mbist_start;

//----------------------------------------------------------
initial  begin // {
  #1;
  hwtw = 1'b0;
  data_in_ready = 8'b0;
  @ (posedge `SPC7.l2clk);
end // }

//----------------------------------------------------------
// Must use negedge to avoid race condition
// tlb_replacement_index (aka entry) is created in always block using blocking assignments

always @ (negedge (`SPC7.l2clk & ready)) begin // {

  tstamp = `TOP.core_cycle_cnt;
  demap_tstamp = `TOP.core_cycle_cnt;

  // Delay by 1 cycle to align with skip_demap
  demap_tid_1  <= demap_tid;  // demap_tid is active when demap is asserted
  demap_tnum_1 <= (mycid * 8) + demap_tid;
  demap_1      <= demap;

  // Signal to nas_pipe to suppress SSTEP
  if (asi_wr_itlb!=8'b0) begin //
    for (i=0;i<=7;i=i+1) begin // {
      if (asi_wr_itlb[i])  begin //
        `PR_INFO ("pli_nas", `INFO, "   C%0d T%0d PLI_SSTEP     tid=%d ts=%0d                 (tlb_sync: suppress sstep. sstep_sent=1)",
                       mycid,i,((mycid * 6'h8) + i[2:0]),tstamp);
        `NASTOP.sstep_sent[(mycid * 8) + i] <= 1'b1;      // suppress SSTEP
      end // }
    end // }
  end // }
 
  //----------------------------------------------------------
  //  Send I/DTLBWRITE due to demap
  //

  if ((demap!=0) && (demap_1!=0)) begin // {
    `PR_ERROR ("tlb_sync", `ERROR, 
       "C%0d T%0d Illegal Back to Back ITLB demap",
        mycid,demap_tid_1);
  end // }

  if (demap_active) begin // {
    fifo.pop_fifo ({hwtw,mytid});
    if (`PARGS.nas_check_on && `PARGS.tlb_sync_on) begin // {
        `PR_INFO ("pli_tlb", `INFO, "   C%0d T%0d PLI_ITLBWRITE tid=%d ts=%0d entry=%h (demap)",
                   mycid,demap_tid_1,demap_tnum_1,demap_tstamp,8'hff);
        `PR_INFO ("pli_nas", `INFO, "   C%0d T%0d PLI_SSTEP     tid=%d ts=%0d                 (tlb_sync: send SSTEP)",
                   mycid,demap_tid_1,demap_tnum_1,tstamp);
        junk = $sim_send(`PLI_ITLBWRITE, demap_tnum_1,demap_tstamp,8'hff);
        junk = $sim_send(`PLI_SSTEP, demap_tnum_1);

        // Check to see if sstep was sent early
        if (`NASTOP.sstep_sent[demap_tnum_1]==1) begin // {
          `NASTOP.sstep_early[demap_tnum_1] <= 1'b1;  // SSTEP was sent before nas_pipe capture
        end //}
    end //}
  end //}

  //--------------------
  if (`PARGS.show_tlb_on & (|demap_1)) begin // {
    $write ("SHOW_TLB: ITLB_DEMAP C%0d T%0d ",mycid,demap_tid_1);

    if (demap_active) begin
      case (demap_1)
      4'b0001:  $write ("type=real ");
      4'b0010:  $write ("type=cntx ");
      4'b0100:  $write ("type=page ");
      4'b1000:  $write ("type=all  ");
      default:
          `PR_ERROR ("tlb_sync", `ERROR, 
            "Bench Problem - demap_1(%b) should be one-hot.",demap_1);
      endcase
    end
    else begin
     $write("type=autodemap ");
    end

    $display ("match=%h                               ts=%0d",
                tlb_match,demap_tstamp*`TOP.core_period);

    for (cnt=0; cnt<=NUM_TLB; cnt=cnt+1) begin // {
      if (tlb_match[cnt]==1'b1)  begin // {
        $display ("SHOW_TLB: ITLB_DEMAP C%0d T%0d entry=%h V=0                                                   ts=%0d",
                    mycid,demap_tid_1,cnt,demap_tstamp*`TOP.core_period);
      end // }
    end // }

  end // }

  //----------------------------------------------------------
  //  Send I/DHWTW     due to HWTW
  //  Send I/DTLBWRITE due to ASI write

  // There are 3 main signals to watch for TLBWRITE (data_in, tlb_wr, wr_en)
  // These signals will be interleaved between the threads.
  // Need to queue up the signals over time so they can be processed in order.
  // Each thread will only be doing 1 thing at a time.

  if ((tlb_wr!=8'b0) || (data_in!=8'b0)) begin // {

    for (i=0;i<=7;i=i+1) begin // {

      if ((data_in[i])&&(tlb_wr[i])) begin // {
          `PR_ERROR ("tlb_sync", `ERROR, 
            "Bad Inputs - iwr_data_in & iwr_tlb_wr should not be asserted at same time");
      end // }
      else begin  // {

        // data_in[tid] determines if the write is HWTW or TLBWRITE
        if (data_in[i]) begin // {
          data_in_ready[i] <= 1'b1;
        end // }

        // tlb_wr[tid] determines which thread will write next
        // Use fifo to save the tids of the tlb_wr signals in order
        if (tlb_wr[i]) begin // {
          if (data_in_ready[i]) begin // {
            fifo.push_fifo ({1'b1,i[2:0]}); //  {hwtw,tid[2:0]}
            data_in_ready[i] <= 1'b0;
          end // }
          else begin // {
            fifo.push_fifo ({1'b0,i[2:0]}); //  {!hwtw,tid[2:0]}
          end // }
        end // }

      end // if}
    end // for}

  end // if}

  //----------------------------------------------------------
  // wr_en means that the write is occurring
  if (wr_en) begin // {
    fifo.pop_fifo ({hwtw,mytid});
    mytnum = (mycid * 8) + mytid;

    if (hwtw) begin // { 
       if (`PARGS.nas_check_on && `PARGS.tlb_sync_on) begin // {
           `PR_INFO ("pli_tlb", `INFO, "   C%0d T%0d PLI_IHWTW     tid=%d ts=%0d va=%h entry=%h",
                      mycid,mytid,mytnum,tstamp,tte_va,entry);
            junk = $sim_send(`PLI_IHWTW, mytnum, tstamp,tte_va,entry);

       end //}
    end // }
    else begin // {
      if (`PARGS.nas_check_on && `PARGS.tlb_sync_on) begin // {
           `PR_INFO ("pli_tlb", `INFO, "   C%0d T%0d PLI_ITLBWRITE tid=%d ts=%0d entry=%h",
                      mycid,mytid,mytnum,tstamp,entry);
           `PR_INFO ("pli_nas", `INFO, "   C%0d T%0d PLI_SSTEP     tid=%d ts=%0d                 (tlb_sync: send SSTEP)",
                      mycid,mytid,mytnum,tstamp);
           junk = $sim_send(`PLI_ITLBWRITE, mytnum,tstamp,entry);
           junk = $sim_send(`PLI_SSTEP, mytnum);

           // Check to see if sstep was sent early
           if (`NASTOP.sstep_sent[mytnum]==1) begin // {
             `NASTOP.sstep_early[mytnum] <= 1'b1;  // SSTEP was sent before nas_pipe capture
           end //}
      end //}
    end // }

    //--------------------
    if (`PARGS.show_tlb_on) begin // {
      $write ("SHOW_TLB: ITLB_WRITE C%0d T%0d ",mycid,mytid);

      if (tte_real==0) $write ("entry=%h V=%b VA=%h ",entry,tte_valid,tte_va);
      else             $write ("entry=%h V=%b RA=%h ",entry,tte_valid,tte_va);

      case (tte_page_mask)
      3'b000: $write("R=%b CNTX=%h PID=%h sz=8k         ts=%0d",
                         tte_real,tte_context,tte_pid,tstamp*`TOP.core_period);
      3'b001: $write("R=%b CNTX=%h PID=%h sz=64k        ts=%0d",
                         tte_real,tte_context,tte_pid,tstamp*`TOP.core_period);
      3'b011: $write("R=%b CNTX=%h PID=%h sz=4MB        ts=%0d",
                         tte_real,tte_context,tte_pid,tstamp*`TOP.core_period);
      3'b111: $write("R=%b CNTX=%h PID=%h sz=256MB      ts=%0d",
                         tte_real,tte_context,tte_pid,tstamp*`TOP.core_period);
      endcase

      if (hwtw) $display ("  (hwtw)");
      else      $display ("");

      $write ("SHOW_TLB: ITLB_WRITE C%0d T%0d ",mycid,mytid);

      $display ("             PA=00%h P=%b IE=%b CP=%b NFO=%b E=%b EP=%b W=%b  ts=%0d",
                  tte_pa,tte_p,tte_ie,tte_cp,tte_nfo,tte_e,tte_ep,tte_w,tstamp*`TOP.core_period); 
    end // }
    //--------------------

  end // }

end // always}

//----------------------------------------------------------
`endif
endmodule

`endif

//----------------------------------------------------------
//----------------------------------------------------------
