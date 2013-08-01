// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: dtlb_wr.v
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

module dtlb_wr_c0 ();
`ifndef GATESIM

`include "tlb_sync.vh"
`include "nas.vh"
parameter NUM_TLB=128;

wire                    [7:0] data_in;
wire                    [7:0] tlb_wr;
wire                          wr_en;
wire                    [7:0] entry;
wire                    [7:0] asi_num;
wire                          asi_enable0;  // 1 per thread group
wire                          asi_enable1;
wire                    [7:0] store_asi;  // 1 per thread
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

reg         [(`TS_WIDTH-1):0] tstamp;
reg                           hwtw;
reg                     [7:0] my_asi [0:7];  // 1 asi number stored per thread
reg         [(`TS_WIDTH-1):0] demap_tstamp;

reg                     [2:0] mytid;
reg                     [5:0] mytnum;
wire                    [2:0] mycid;
integer                       junk;
integer                       i;
reg                     [7:0] cnt;
wire                          ready;

assign   mycid = 0;

`ifdef DEBUG_TLB
  wire [7:0] my_asi0 = my_asi[0];
  wire [7:0] my_asi1 = my_asi[1];
  wire [7:0] my_asi2 = my_asi[2];
  wire [7:0] my_asi3 = my_asi[3];
  wire [7:0] my_asi4 = my_asi[4];
  wire [7:0] my_asi5 = my_asi[5];
  wire [7:0] my_asi6 = my_asi[6];
  wire [7:0] my_asi7 = my_asi[7];
`endif

//----------------------------------------------------------
// Instantiate fifo - 1 entry per thread
fifo fifo ();
// Define fifo parameters
defparam fifo.ENTRY_BITS = 4;  // {hwtw,tid[2:0]}
defparam fifo.DEPTH      = 9;  // 1 extra entry for overflow detection
defparam fifo.PTR_BITS   = 4;

//----------------------------------------------------------
// DUT probes

assign   data_in = `SPC0.mmu.asi.wrote_dtlb;
assign   tlb_wr = `SPC0.mmu_reload_done;
assign   wr_en = `SPC0.lsu.tlb.tlb_wr_1_in_dout;

assign   entry = `SPC0.lsu.tlb.rw_index_1[6:0];

assign   asi_num = `PROBES0.asi_num;
assign   asi_enable0 =  `PROBES0.tlb_rd_vld_b & 
                        !`PROBES0.tlb_bypass_b &
                        `SPC0.tlu.fls0.lsu_inst_b;
assign   asi_enable1 =  `PROBES0.tlb_rd_vld_b & 
                        !`PROBES0.tlb_bypass_b &
                        `SPC0.tlu.fls1.lsu_inst_b;

assign   store_asi[3:0] = asi_enable0 ? `PROBES0.select_pc_b[3:0] : 4'b0;
assign   store_asi[7:4] = asi_enable1 ? `PROBES0.select_pc_b[7:4] : 4'b0;

assign   demap_page = `SPC0.lsu.tlc_demap & ~(demap_context | demap_real | demap_all);
assign   demap_context = `SPC0.lsu.tlc_demap_context;
assign   demap_real = `SPC0.lsu.tlc_demap_real;
assign   demap_all = `SPC0.lsu.tlc_demap_all;
assign   demap = {demap_all,demap_page,demap_context,demap_real};
assign   skip_demap =`SPC0.lsu.tlc_wr_u_en; 
assign   demap_tid = `SPC0.lsu.tld.tte1[37:35];

// if (|demap_1 && skip_demap ), then Implicit demap so don't send to NAS
assign   demap_active = |demap_1 && !skip_demap;
assign   auto_demap   = |demap_1 && skip_demap;

//---------------------
// Probes for debugging

// defines copied from :/libs/n2sram/tlbs/tlbs/n2_tlb_tl_128x59_cust_l/n2_tlb_tl_128x59_cust/rtl

// n2_tlb_tl_128x59_cam.sv

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

// n2_tlb_tl_128x59_ram.sv

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


assign  tlb_valid        = `SPC0.lsu.tlb.array.cam.valid;
assign  tlb_match        = `SPC0.lsu.tlb.array.cam.match;

assign  tte_va           =  {`SPC0.lsu.tlb.tte_tag_1_dout[`VA_47:`VA_28],
                             `SPC0.lsu.tlb.tte_tag_1_dout[`VA_27:`VA_22],
                             `SPC0.lsu.tlb.tte_tag_1_dout[`VA_21:`VA_16],
                             `SPC0.lsu.tlb.tte_tag_1_dout[`VA_15:`VA_13],
                             13'b0
                            };
assign  tte_context      = `SPC0.lsu.tlb.tte_tag_1_dout[`CNTX1_HI:`CNTX1_LO];
assign  tte_pid          = `SPC0.lsu.tlb.tte_tag_1_dout[`PID_HI:`PID_LO];
assign  tte_real         = `SPC0.lsu.tlb.tte_tag_1_dout[`REAL_BIT];
assign  tte_valid        = `SPC0.lsu.tlb.tte_tag_1_dout[`TTE_VALID];

assign  tte_page_mask    = `SPC0.lsu.tlb.tte_page_size_mask_1;

assign  tte_pa           = {`SPC0.lsu.tlb.tte_data_1[`DATA_PA_39_28_HI:`DATA_PA_39_28_LO],
                            `SPC0.lsu.tlb.tte_data_1[`DATA_PA_27_22_HI:`DATA_PA_27_22_LO],
                            `SPC0.lsu.tlb.tte_data_1[`DATA_PA_21_16_HI:`DATA_PA_21_16_LO],
                            `SPC0.lsu.tlb.tte_data_1[`DATA_PA_15_13_HI:`DATA_PA_15_13_LO],
                            13'b0
                           };
assign  tte_nfo          = `SPC0.lsu.tlb.tte_data_1[`DATA_NFO];
assign  tte_ie           = `SPC0.lsu.tlb.tte_data_1[`DATA_IE];
assign  tte_cp           = `SPC0.lsu.tlb.tte_data_1[`DATA_CP];
assign  tte_e            = `SPC0.lsu.tlb.tte_data_1[`DATA_X];
assign  tte_p            = `SPC0.lsu.tlb.tte_data_1[`DATA_P];
assign  tte_w            = `SPC0.lsu.tlb.tte_data_1[`DATA_W];
assign  tte_ep           = 1'bx;  // Does not apply for DTLB

assign ready = `PARGS.tlb_sync_on & !`SPC0.tcu_spc_mbist_start;

//----------------------------------------------------------
// Initialize state machine to idle state
initial  begin // {
  #1;
  hwtw = 1'b0;
  for (i=0; i<=7; i=i+1) begin
    my_asi[i] = 8'b0;
  end
  @ (posedge `SPC0.l2clk);

end // }

//----------------------------------------------------------
// Must use negedge to avoid race condition
// tlb_entry_replace (aka entry) is created in always block using blocking assignments

always @ (negedge (`SPC0.l2clk & ready)) begin // {

  tstamp = `TOP.core_cycle_cnt;
  demap_tstamp = `TOP.core_cycle_cnt;

  // Delay by 1 cycle to align with skip_demap
  demap_tid_1  <= demap_tid;  // demap_tid is active when demap is asserted
  demap_tnum_1 <= (mycid * 8) + demap_tid;
  demap_1      <= demap;

  //----------------------------------------------------------
  //  Send I/DTLBWRITE due to demap
  //

  if ((demap!=0) && (demap_1!=0)) begin // {
    `PR_ERROR ("tlb_sync", `ERROR, 
       "C%0d T%0d Illegal Back to Back DTLB demap",
        mycid,demap_tid_1);
  end // }

  if (demap_active) begin // {
    fifo.pop_fifo ({hwtw,mytid});
    if (`PARGS.nas_check_on && `PARGS.tlb_sync_on) begin // {
        `PR_INFO ("pli_tlb", `INFO, "   C%0d T%0d PLI_DTLBWRITE tid=%d ts=%0d entry=%h (demap)",
                   mycid,demap_tid_1,demap_tnum_1,demap_tstamp,8'hff);
        `PR_INFO ("pli_nas", `INFO, "   C%0d T%0d PLI_SSTEP     tid=%d ts=%0d                 (tlb_sync: send SSTEP)",
                   mycid,demap_tid_1,demap_tnum_1,demap_tstamp);
        junk = $sim_send(`PLI_DTLBWRITE, demap_tnum_1,demap_tstamp,8'hff);
        junk = $sim_send(`PLI_SSTEP, demap_tnum_1);

        // sstep_sent is asserted when data_in is asserted
        // Check to see if sstep was sent early
        if (`NASTOP.sstep_sent[demap_tnum_1]==1) begin // {
          `NASTOP.sstep_early[demap_tnum_1] <= 1'b1;  // SSTEP was sent before nas_pipe capture
        end //}

    end //}
  end //}

  //--------------------
  if (`PARGS.show_tlb_on & (|demap_1)) begin // {
    $write ("SHOW_TLB: DTLB_DEMAP C%0d T%0d ",mycid,demap_tid_1);

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
      $write ("type=autodemap ");
    end

    $display ("match=%h                ts=%0d",
                tlb_match,demap_tstamp*`TOP.core_period);

    for (cnt=0; cnt<=NUM_TLB; cnt=cnt+1) begin // {
      if (tlb_match[cnt]==1'b1)  begin // {
        $display ("SHOW_TLB: DTLB_DEMAP C%0d T%0d entry=%h V=0                                                   ts=%0d",
                   mycid,demap_tid_1,cnt,demap_tstamp*`TOP.core_period);
      end // }
    end // }
    //--------------------
  end // }

  //----------------------------------------------------------
  //  Send I/DHWTW     due to HWTW
  //  Send I/DTLBWRITE due to ASI write

  // Save asi num when DTLBREAD happens.
  // Otherwise, hold state.
  // Send asi num later with DHWTW
  for (i=0;i<=7;i=i+1) begin // {
    my_asi[i] = (store_asi[i]) ? asi_num : my_asi[i];
  end // }

  // There are 3 main signals to watch for TLBWRITE (data_in, tlb_wr, wr_en)
  // These signals will be interleaved between the threads.
  // Need to queue up the signals over time so they can be processed in order.
  // Each thread will only be doing 1 thing at a time.

  for (i=0;i<=7;i=i+1) begin // {

    // tlb_wr[tid] determines if the write is HWTW or TLBWRITE

    // data_in[tid] determines which thread will write next
    // Use fifo to save the tids of the data_in signals in order

    if (data_in[i]) begin // {
      if (tlb_wr[i]) begin // {
        fifo.push_fifo ({1'b1,i[2:0]}); //  {hwtw,tid[2:0]}
      end // }
      else begin // {
        fifo.push_fifo ({1'b0,i[2:0]}); //  {!hwtw,tid[2:0]}

        // Signal to nas_pipe to suppress SSTEP as soon we know a tlb write or demap is coming (data_in=1)
        //   Cannot wait for wr_en because it is possible to miss an SSTEP.
        `PR_INFO ("pli_nas", `INFO, "   C%0d T%0d PLI_SSTEP     tid=%d ts=%0d                 (tlb_sync: suppress sstep. sstep_sent=1)",
                       mycid,i,((mycid * 6'h8) + i[2:0]),tstamp);
        `NASTOP.sstep_sent[(mycid * 6'h8) + i[2:0]] <= 1'b1;      // suppress SSTEP
      end // }
    end // }

  end // }

  //----------------------------------------------------------
  // wr_en means that the write is occurring
  if (wr_en) begin // {
    fifo.pop_fifo ({hwtw,mytid});
    mytnum = (mycid * 8) + mytid;

    if (hwtw) begin // { 
       if (`PARGS.nas_check_on && `PARGS.tlb_sync_on) begin // {
           `PR_INFO ("pli_tlb", `INFO, "   C%0d T%0d PLI_DHWTW     tid=%d ts=%0d va=%h asi=%h entry=%h",
                      mycid,mytid,mytnum,tstamp,tte_va,my_asi[mytid],entry);
           junk = $sim_send(`PLI_DHWTW, mytnum,tstamp,tte_va,my_asi[mytid],entry);

       end //}
    end // }
    else begin // {
      if (`PARGS.nas_check_on && `PARGS.tlb_sync_on) begin // {
            `PR_INFO ("pli_tlb", `INFO, "   C%0d T%0d PLI_DTLBWRITE tid=%d ts=%0d entry=%h",
                       mycid,mytid,mytnum,tstamp,entry);
            `PR_INFO ("pli_nas", `INFO, "   C%0d T%0d PLI_SSTEP     tid=%d ts=%0d                 (tlb_sync: send SSTEP)",
                       mycid,mytid,mytnum,tstamp);
            junk = $sim_send(`PLI_DTLBWRITE, mytnum,tstamp,entry);
            junk = $sim_send(`PLI_SSTEP, mytnum);

            // Check to see if sstep was sent early
            if (`NASTOP.sstep_sent[mytnum]==1) begin // {
              `NASTOP.sstep_early[mytnum] <= 1'b1;  // SSTEP was sent before nas_pipe capture
            end //}

      end //}
    end // }

    //--------------------
    if (`PARGS.show_tlb_on) begin // {
      $write ("SHOW_TLB: DTLB_WRITE C%0d T%0d ",mycid,mytid);

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

      $write ("SHOW_TLB: DTLB_WRITE C%0d T%0d ",mycid,mytid);

      $display ("             PA=00%h P=%b IE=%b CP=%b NFO=%b E=%b EP=X W=%b  ts=%0d",
                  tte_pa,tte_p,tte_ie,tte_cp,tte_nfo,tte_e,tte_w,tstamp*`TOP.core_period); 
    end // }
    //--------------------

  end // }

end // always}

//----------------------------------------------------------
`endif
endmodule

`endif
`ifdef CORE_1

module dtlb_wr_c1 ();
`ifndef GATESIM

`include "tlb_sync.vh"
`include "nas.vh"
parameter NUM_TLB=128;

wire                    [7:0] data_in;
wire                    [7:0] tlb_wr;
wire                          wr_en;
wire                    [7:0] entry;
wire                    [7:0] asi_num;
wire                          asi_enable0;  // 1 per thread group
wire                          asi_enable1;
wire                    [7:0] store_asi;  // 1 per thread
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

reg         [(`TS_WIDTH-1):0] tstamp;
reg                           hwtw;
reg                     [7:0] my_asi [0:7];  // 1 asi number stored per thread
reg         [(`TS_WIDTH-1):0] demap_tstamp;

reg                     [2:0] mytid;
reg                     [5:0] mytnum;
wire                    [2:0] mycid;
integer                       junk;
integer                       i;
reg                     [7:0] cnt;
wire                          ready;

assign   mycid = 1;

`ifdef DEBUG_TLB
  wire [7:0] my_asi0 = my_asi[0];
  wire [7:0] my_asi1 = my_asi[1];
  wire [7:0] my_asi2 = my_asi[2];
  wire [7:0] my_asi3 = my_asi[3];
  wire [7:0] my_asi4 = my_asi[4];
  wire [7:0] my_asi5 = my_asi[5];
  wire [7:0] my_asi6 = my_asi[6];
  wire [7:0] my_asi7 = my_asi[7];
`endif

//----------------------------------------------------------
// Instantiate fifo - 1 entry per thread
fifo fifo ();
// Define fifo parameters
defparam fifo.ENTRY_BITS = 4;  // {hwtw,tid[2:0]}
defparam fifo.DEPTH      = 9;  // 1 extra entry for overflow detection
defparam fifo.PTR_BITS   = 4;

//----------------------------------------------------------
// DUT probes

assign   data_in = `SPC1.mmu.asi.wrote_dtlb;
assign   tlb_wr = `SPC1.mmu_reload_done;
assign   wr_en = `SPC1.lsu.tlb.tlb_wr_1_in_dout;

assign   entry = `SPC1.lsu.tlb.rw_index_1[6:0];

assign   asi_num = `PROBES1.asi_num;
assign   asi_enable0 =  `PROBES1.tlb_rd_vld_b & 
                        !`PROBES1.tlb_bypass_b &
                        `SPC1.tlu.fls0.lsu_inst_b;
assign   asi_enable1 =  `PROBES1.tlb_rd_vld_b & 
                        !`PROBES1.tlb_bypass_b &
                        `SPC1.tlu.fls1.lsu_inst_b;

assign   store_asi[3:0] = asi_enable0 ? `PROBES1.select_pc_b[3:0] : 4'b0;
assign   store_asi[7:4] = asi_enable1 ? `PROBES1.select_pc_b[7:4] : 4'b0;

assign   demap_page = `SPC1.lsu.tlc_demap & ~(demap_context | demap_real | demap_all);
assign   demap_context = `SPC1.lsu.tlc_demap_context;
assign   demap_real = `SPC1.lsu.tlc_demap_real;
assign   demap_all = `SPC1.lsu.tlc_demap_all;
assign   demap = {demap_all,demap_page,demap_context,demap_real};
assign   skip_demap =`SPC1.lsu.tlc_wr_u_en; 
assign   demap_tid = `SPC1.lsu.tld.tte1[37:35];

// if (|demap_1 && skip_demap ), then Implicit demap so don't send to NAS
assign   demap_active = |demap_1 && !skip_demap;
assign   auto_demap   = |demap_1 && skip_demap;

//---------------------
// Probes for debugging

// defines copied from :/libs/n2sram/tlbs/tlbs/n2_tlb_tl_128x59_cust_l/n2_tlb_tl_128x59_cust/rtl

// n2_tlb_tl_128x59_cam.sv

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

// n2_tlb_tl_128x59_ram.sv

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


assign  tlb_valid        = `SPC1.lsu.tlb.array.cam.valid;
assign  tlb_match        = `SPC1.lsu.tlb.array.cam.match;

assign  tte_va           =  {`SPC1.lsu.tlb.tte_tag_1_dout[`VA_47:`VA_28],
                             `SPC1.lsu.tlb.tte_tag_1_dout[`VA_27:`VA_22],
                             `SPC1.lsu.tlb.tte_tag_1_dout[`VA_21:`VA_16],
                             `SPC1.lsu.tlb.tte_tag_1_dout[`VA_15:`VA_13],
                             13'b0
                            };
assign  tte_context      = `SPC1.lsu.tlb.tte_tag_1_dout[`CNTX1_HI:`CNTX1_LO];
assign  tte_pid          = `SPC1.lsu.tlb.tte_tag_1_dout[`PID_HI:`PID_LO];
assign  tte_real         = `SPC1.lsu.tlb.tte_tag_1_dout[`REAL_BIT];
assign  tte_valid        = `SPC1.lsu.tlb.tte_tag_1_dout[`TTE_VALID];

assign  tte_page_mask    = `SPC1.lsu.tlb.tte_page_size_mask_1;

assign  tte_pa           = {`SPC1.lsu.tlb.tte_data_1[`DATA_PA_39_28_HI:`DATA_PA_39_28_LO],
                            `SPC1.lsu.tlb.tte_data_1[`DATA_PA_27_22_HI:`DATA_PA_27_22_LO],
                            `SPC1.lsu.tlb.tte_data_1[`DATA_PA_21_16_HI:`DATA_PA_21_16_LO],
                            `SPC1.lsu.tlb.tte_data_1[`DATA_PA_15_13_HI:`DATA_PA_15_13_LO],
                            13'b0
                           };
assign  tte_nfo          = `SPC1.lsu.tlb.tte_data_1[`DATA_NFO];
assign  tte_ie           = `SPC1.lsu.tlb.tte_data_1[`DATA_IE];
assign  tte_cp           = `SPC1.lsu.tlb.tte_data_1[`DATA_CP];
assign  tte_e            = `SPC1.lsu.tlb.tte_data_1[`DATA_X];
assign  tte_p            = `SPC1.lsu.tlb.tte_data_1[`DATA_P];
assign  tte_w            = `SPC1.lsu.tlb.tte_data_1[`DATA_W];
assign  tte_ep           = 1'bx;  // Does not apply for DTLB

assign ready = `PARGS.tlb_sync_on & !`SPC1.tcu_spc_mbist_start;

//----------------------------------------------------------
// Initialize state machine to idle state
initial  begin // {
  #1;
  hwtw = 1'b0;
  for (i=0; i<=7; i=i+1) begin
    my_asi[i] = 8'b0;
  end
  @ (posedge `SPC1.l2clk);

end // }

//----------------------------------------------------------
// Must use negedge to avoid race condition
// tlb_entry_replace (aka entry) is created in always block using blocking assignments

always @ (negedge (`SPC1.l2clk & ready)) begin // {

  tstamp = `TOP.core_cycle_cnt;
  demap_tstamp = `TOP.core_cycle_cnt;

  // Delay by 1 cycle to align with skip_demap
  demap_tid_1  <= demap_tid;  // demap_tid is active when demap is asserted
  demap_tnum_1 <= (mycid * 8) + demap_tid;
  demap_1      <= demap;

  //----------------------------------------------------------
  //  Send I/DTLBWRITE due to demap
  //

  if ((demap!=0) && (demap_1!=0)) begin // {
    `PR_ERROR ("tlb_sync", `ERROR, 
       "C%0d T%0d Illegal Back to Back DTLB demap",
        mycid,demap_tid_1);
  end // }

  if (demap_active) begin // {
    fifo.pop_fifo ({hwtw,mytid});
    if (`PARGS.nas_check_on && `PARGS.tlb_sync_on) begin // {
        `PR_INFO ("pli_tlb", `INFO, "   C%0d T%0d PLI_DTLBWRITE tid=%d ts=%0d entry=%h (demap)",
                   mycid,demap_tid_1,demap_tnum_1,demap_tstamp,8'hff);
        `PR_INFO ("pli_nas", `INFO, "   C%0d T%0d PLI_SSTEP     tid=%d ts=%0d                 (tlb_sync: send SSTEP)",
                   mycid,demap_tid_1,demap_tnum_1,demap_tstamp);
        junk = $sim_send(`PLI_DTLBWRITE, demap_tnum_1,demap_tstamp,8'hff);
        junk = $sim_send(`PLI_SSTEP, demap_tnum_1);

        // sstep_sent is asserted when data_in is asserted
        // Check to see if sstep was sent early
        if (`NASTOP.sstep_sent[demap_tnum_1]==1) begin // {
          `NASTOP.sstep_early[demap_tnum_1] <= 1'b1;  // SSTEP was sent before nas_pipe capture
        end //}

    end //}
  end //}

  //--------------------
  if (`PARGS.show_tlb_on & (|demap_1)) begin // {
    $write ("SHOW_TLB: DTLB_DEMAP C%0d T%0d ",mycid,demap_tid_1);

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
      $write ("type=autodemap ");
    end

    $display ("match=%h                ts=%0d",
                tlb_match,demap_tstamp*`TOP.core_period);

    for (cnt=0; cnt<=NUM_TLB; cnt=cnt+1) begin // {
      if (tlb_match[cnt]==1'b1)  begin // {
        $display ("SHOW_TLB: DTLB_DEMAP C%0d T%0d entry=%h V=0                                                   ts=%0d",
                   mycid,demap_tid_1,cnt,demap_tstamp*`TOP.core_period);
      end // }
    end // }
    //--------------------
  end // }

  //----------------------------------------------------------
  //  Send I/DHWTW     due to HWTW
  //  Send I/DTLBWRITE due to ASI write

  // Save asi num when DTLBREAD happens.
  // Otherwise, hold state.
  // Send asi num later with DHWTW
  for (i=0;i<=7;i=i+1) begin // {
    my_asi[i] = (store_asi[i]) ? asi_num : my_asi[i];
  end // }

  // There are 3 main signals to watch for TLBWRITE (data_in, tlb_wr, wr_en)
  // These signals will be interleaved between the threads.
  // Need to queue up the signals over time so they can be processed in order.
  // Each thread will only be doing 1 thing at a time.

  for (i=0;i<=7;i=i+1) begin // {

    // tlb_wr[tid] determines if the write is HWTW or TLBWRITE

    // data_in[tid] determines which thread will write next
    // Use fifo to save the tids of the data_in signals in order

    if (data_in[i]) begin // {
      if (tlb_wr[i]) begin // {
        fifo.push_fifo ({1'b1,i[2:0]}); //  {hwtw,tid[2:0]}
      end // }
      else begin // {
        fifo.push_fifo ({1'b0,i[2:0]}); //  {!hwtw,tid[2:0]}

        // Signal to nas_pipe to suppress SSTEP as soon we know a tlb write or demap is coming (data_in=1)
        //   Cannot wait for wr_en because it is possible to miss an SSTEP.
        `PR_INFO ("pli_nas", `INFO, "   C%0d T%0d PLI_SSTEP     tid=%d ts=%0d                 (tlb_sync: suppress sstep. sstep_sent=1)",
                       mycid,i,((mycid * 6'h8) + i[2:0]),tstamp);
        `NASTOP.sstep_sent[(mycid * 6'h8) + i[2:0]] <= 1'b1;      // suppress SSTEP
      end // }
    end // }

  end // }

  //----------------------------------------------------------
  // wr_en means that the write is occurring
  if (wr_en) begin // {
    fifo.pop_fifo ({hwtw,mytid});
    mytnum = (mycid * 8) + mytid;

    if (hwtw) begin // { 
       if (`PARGS.nas_check_on && `PARGS.tlb_sync_on) begin // {
           `PR_INFO ("pli_tlb", `INFO, "   C%0d T%0d PLI_DHWTW     tid=%d ts=%0d va=%h asi=%h entry=%h",
                      mycid,mytid,mytnum,tstamp,tte_va,my_asi[mytid],entry);
           junk = $sim_send(`PLI_DHWTW, mytnum,tstamp,tte_va,my_asi[mytid],entry);

       end //}
    end // }
    else begin // {
      if (`PARGS.nas_check_on && `PARGS.tlb_sync_on) begin // {
            `PR_INFO ("pli_tlb", `INFO, "   C%0d T%0d PLI_DTLBWRITE tid=%d ts=%0d entry=%h",
                       mycid,mytid,mytnum,tstamp,entry);
            `PR_INFO ("pli_nas", `INFO, "   C%0d T%0d PLI_SSTEP     tid=%d ts=%0d                 (tlb_sync: send SSTEP)",
                       mycid,mytid,mytnum,tstamp);
            junk = $sim_send(`PLI_DTLBWRITE, mytnum,tstamp,entry);
            junk = $sim_send(`PLI_SSTEP, mytnum);

            // Check to see if sstep was sent early
            if (`NASTOP.sstep_sent[mytnum]==1) begin // {
              `NASTOP.sstep_early[mytnum] <= 1'b1;  // SSTEP was sent before nas_pipe capture
            end //}

      end //}
    end // }

    //--------------------
    if (`PARGS.show_tlb_on) begin // {
      $write ("SHOW_TLB: DTLB_WRITE C%0d T%0d ",mycid,mytid);

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

      $write ("SHOW_TLB: DTLB_WRITE C%0d T%0d ",mycid,mytid);

      $display ("             PA=00%h P=%b IE=%b CP=%b NFO=%b E=%b EP=X W=%b  ts=%0d",
                  tte_pa,tte_p,tte_ie,tte_cp,tte_nfo,tte_e,tte_w,tstamp*`TOP.core_period); 
    end // }
    //--------------------

  end // }

end // always}

//----------------------------------------------------------
`endif
endmodule

`endif
`ifdef CORE_2

module dtlb_wr_c2 ();
`ifndef GATESIM

`include "tlb_sync.vh"
`include "nas.vh"
parameter NUM_TLB=128;

wire                    [7:0] data_in;
wire                    [7:0] tlb_wr;
wire                          wr_en;
wire                    [7:0] entry;
wire                    [7:0] asi_num;
wire                          asi_enable0;  // 1 per thread group
wire                          asi_enable1;
wire                    [7:0] store_asi;  // 1 per thread
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

reg         [(`TS_WIDTH-1):0] tstamp;
reg                           hwtw;
reg                     [7:0] my_asi [0:7];  // 1 asi number stored per thread
reg         [(`TS_WIDTH-1):0] demap_tstamp;

reg                     [2:0] mytid;
reg                     [5:0] mytnum;
wire                    [2:0] mycid;
integer                       junk;
integer                       i;
reg                     [7:0] cnt;
wire                          ready;

assign   mycid = 2;

`ifdef DEBUG_TLB
  wire [7:0] my_asi0 = my_asi[0];
  wire [7:0] my_asi1 = my_asi[1];
  wire [7:0] my_asi2 = my_asi[2];
  wire [7:0] my_asi3 = my_asi[3];
  wire [7:0] my_asi4 = my_asi[4];
  wire [7:0] my_asi5 = my_asi[5];
  wire [7:0] my_asi6 = my_asi[6];
  wire [7:0] my_asi7 = my_asi[7];
`endif

//----------------------------------------------------------
// Instantiate fifo - 1 entry per thread
fifo fifo ();
// Define fifo parameters
defparam fifo.ENTRY_BITS = 4;  // {hwtw,tid[2:0]}
defparam fifo.DEPTH      = 9;  // 1 extra entry for overflow detection
defparam fifo.PTR_BITS   = 4;

//----------------------------------------------------------
// DUT probes

assign   data_in = `SPC2.mmu.asi.wrote_dtlb;
assign   tlb_wr = `SPC2.mmu_reload_done;
assign   wr_en = `SPC2.lsu.tlb.tlb_wr_1_in_dout;

assign   entry = `SPC2.lsu.tlb.rw_index_1[6:0];

assign   asi_num = `PROBES2.asi_num;
assign   asi_enable0 =  `PROBES2.tlb_rd_vld_b & 
                        !`PROBES2.tlb_bypass_b &
                        `SPC2.tlu.fls0.lsu_inst_b;
assign   asi_enable1 =  `PROBES2.tlb_rd_vld_b & 
                        !`PROBES2.tlb_bypass_b &
                        `SPC2.tlu.fls1.lsu_inst_b;

assign   store_asi[3:0] = asi_enable0 ? `PROBES2.select_pc_b[3:0] : 4'b0;
assign   store_asi[7:4] = asi_enable1 ? `PROBES2.select_pc_b[7:4] : 4'b0;

assign   demap_page = `SPC2.lsu.tlc_demap & ~(demap_context | demap_real | demap_all);
assign   demap_context = `SPC2.lsu.tlc_demap_context;
assign   demap_real = `SPC2.lsu.tlc_demap_real;
assign   demap_all = `SPC2.lsu.tlc_demap_all;
assign   demap = {demap_all,demap_page,demap_context,demap_real};
assign   skip_demap =`SPC2.lsu.tlc_wr_u_en; 
assign   demap_tid = `SPC2.lsu.tld.tte1[37:35];

// if (|demap_1 && skip_demap ), then Implicit demap so don't send to NAS
assign   demap_active = |demap_1 && !skip_demap;
assign   auto_demap   = |demap_1 && skip_demap;

//---------------------
// Probes for debugging

// defines copied from :/libs/n2sram/tlbs/tlbs/n2_tlb_tl_128x59_cust_l/n2_tlb_tl_128x59_cust/rtl

// n2_tlb_tl_128x59_cam.sv

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

// n2_tlb_tl_128x59_ram.sv

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


assign  tlb_valid        = `SPC2.lsu.tlb.array.cam.valid;
assign  tlb_match        = `SPC2.lsu.tlb.array.cam.match;

assign  tte_va           =  {`SPC2.lsu.tlb.tte_tag_1_dout[`VA_47:`VA_28],
                             `SPC2.lsu.tlb.tte_tag_1_dout[`VA_27:`VA_22],
                             `SPC2.lsu.tlb.tte_tag_1_dout[`VA_21:`VA_16],
                             `SPC2.lsu.tlb.tte_tag_1_dout[`VA_15:`VA_13],
                             13'b0
                            };
assign  tte_context      = `SPC2.lsu.tlb.tte_tag_1_dout[`CNTX1_HI:`CNTX1_LO];
assign  tte_pid          = `SPC2.lsu.tlb.tte_tag_1_dout[`PID_HI:`PID_LO];
assign  tte_real         = `SPC2.lsu.tlb.tte_tag_1_dout[`REAL_BIT];
assign  tte_valid        = `SPC2.lsu.tlb.tte_tag_1_dout[`TTE_VALID];

assign  tte_page_mask    = `SPC2.lsu.tlb.tte_page_size_mask_1;

assign  tte_pa           = {`SPC2.lsu.tlb.tte_data_1[`DATA_PA_39_28_HI:`DATA_PA_39_28_LO],
                            `SPC2.lsu.tlb.tte_data_1[`DATA_PA_27_22_HI:`DATA_PA_27_22_LO],
                            `SPC2.lsu.tlb.tte_data_1[`DATA_PA_21_16_HI:`DATA_PA_21_16_LO],
                            `SPC2.lsu.tlb.tte_data_1[`DATA_PA_15_13_HI:`DATA_PA_15_13_LO],
                            13'b0
                           };
assign  tte_nfo          = `SPC2.lsu.tlb.tte_data_1[`DATA_NFO];
assign  tte_ie           = `SPC2.lsu.tlb.tte_data_1[`DATA_IE];
assign  tte_cp           = `SPC2.lsu.tlb.tte_data_1[`DATA_CP];
assign  tte_e            = `SPC2.lsu.tlb.tte_data_1[`DATA_X];
assign  tte_p            = `SPC2.lsu.tlb.tte_data_1[`DATA_P];
assign  tte_w            = `SPC2.lsu.tlb.tte_data_1[`DATA_W];
assign  tte_ep           = 1'bx;  // Does not apply for DTLB

assign ready = `PARGS.tlb_sync_on & !`SPC2.tcu_spc_mbist_start;

//----------------------------------------------------------
// Initialize state machine to idle state
initial  begin // {
  #1;
  hwtw = 1'b0;
  for (i=0; i<=7; i=i+1) begin
    my_asi[i] = 8'b0;
  end
  @ (posedge `SPC2.l2clk);

end // }

//----------------------------------------------------------
// Must use negedge to avoid race condition
// tlb_entry_replace (aka entry) is created in always block using blocking assignments

always @ (negedge (`SPC2.l2clk & ready)) begin // {

  tstamp = `TOP.core_cycle_cnt;
  demap_tstamp = `TOP.core_cycle_cnt;

  // Delay by 1 cycle to align with skip_demap
  demap_tid_1  <= demap_tid;  // demap_tid is active when demap is asserted
  demap_tnum_1 <= (mycid * 8) + demap_tid;
  demap_1      <= demap;

  //----------------------------------------------------------
  //  Send I/DTLBWRITE due to demap
  //

  if ((demap!=0) && (demap_1!=0)) begin // {
    `PR_ERROR ("tlb_sync", `ERROR, 
       "C%0d T%0d Illegal Back to Back DTLB demap",
        mycid,demap_tid_1);
  end // }

  if (demap_active) begin // {
    fifo.pop_fifo ({hwtw,mytid});
    if (`PARGS.nas_check_on && `PARGS.tlb_sync_on) begin // {
        `PR_INFO ("pli_tlb", `INFO, "   C%0d T%0d PLI_DTLBWRITE tid=%d ts=%0d entry=%h (demap)",
                   mycid,demap_tid_1,demap_tnum_1,demap_tstamp,8'hff);
        `PR_INFO ("pli_nas", `INFO, "   C%0d T%0d PLI_SSTEP     tid=%d ts=%0d                 (tlb_sync: send SSTEP)",
                   mycid,demap_tid_1,demap_tnum_1,demap_tstamp);
        junk = $sim_send(`PLI_DTLBWRITE, demap_tnum_1,demap_tstamp,8'hff);
        junk = $sim_send(`PLI_SSTEP, demap_tnum_1);

        // sstep_sent is asserted when data_in is asserted
        // Check to see if sstep was sent early
        if (`NASTOP.sstep_sent[demap_tnum_1]==1) begin // {
          `NASTOP.sstep_early[demap_tnum_1] <= 1'b1;  // SSTEP was sent before nas_pipe capture
        end //}

    end //}
  end //}

  //--------------------
  if (`PARGS.show_tlb_on & (|demap_1)) begin // {
    $write ("SHOW_TLB: DTLB_DEMAP C%0d T%0d ",mycid,demap_tid_1);

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
      $write ("type=autodemap ");
    end

    $display ("match=%h                ts=%0d",
                tlb_match,demap_tstamp*`TOP.core_period);

    for (cnt=0; cnt<=NUM_TLB; cnt=cnt+1) begin // {
      if (tlb_match[cnt]==1'b1)  begin // {
        $display ("SHOW_TLB: DTLB_DEMAP C%0d T%0d entry=%h V=0                                                   ts=%0d",
                   mycid,demap_tid_1,cnt,demap_tstamp*`TOP.core_period);
      end // }
    end // }
    //--------------------
  end // }

  //----------------------------------------------------------
  //  Send I/DHWTW     due to HWTW
  //  Send I/DTLBWRITE due to ASI write

  // Save asi num when DTLBREAD happens.
  // Otherwise, hold state.
  // Send asi num later with DHWTW
  for (i=0;i<=7;i=i+1) begin // {
    my_asi[i] = (store_asi[i]) ? asi_num : my_asi[i];
  end // }

  // There are 3 main signals to watch for TLBWRITE (data_in, tlb_wr, wr_en)
  // These signals will be interleaved between the threads.
  // Need to queue up the signals over time so they can be processed in order.
  // Each thread will only be doing 1 thing at a time.

  for (i=0;i<=7;i=i+1) begin // {

    // tlb_wr[tid] determines if the write is HWTW or TLBWRITE

    // data_in[tid] determines which thread will write next
    // Use fifo to save the tids of the data_in signals in order

    if (data_in[i]) begin // {
      if (tlb_wr[i]) begin // {
        fifo.push_fifo ({1'b1,i[2:0]}); //  {hwtw,tid[2:0]}
      end // }
      else begin // {
        fifo.push_fifo ({1'b0,i[2:0]}); //  {!hwtw,tid[2:0]}

        // Signal to nas_pipe to suppress SSTEP as soon we know a tlb write or demap is coming (data_in=1)
        //   Cannot wait for wr_en because it is possible to miss an SSTEP.
        `PR_INFO ("pli_nas", `INFO, "   C%0d T%0d PLI_SSTEP     tid=%d ts=%0d                 (tlb_sync: suppress sstep. sstep_sent=1)",
                       mycid,i,((mycid * 6'h8) + i[2:0]),tstamp);
        `NASTOP.sstep_sent[(mycid * 6'h8) + i[2:0]] <= 1'b1;      // suppress SSTEP
      end // }
    end // }

  end // }

  //----------------------------------------------------------
  // wr_en means that the write is occurring
  if (wr_en) begin // {
    fifo.pop_fifo ({hwtw,mytid});
    mytnum = (mycid * 8) + mytid;

    if (hwtw) begin // { 
       if (`PARGS.nas_check_on && `PARGS.tlb_sync_on) begin // {
           `PR_INFO ("pli_tlb", `INFO, "   C%0d T%0d PLI_DHWTW     tid=%d ts=%0d va=%h asi=%h entry=%h",
                      mycid,mytid,mytnum,tstamp,tte_va,my_asi[mytid],entry);
           junk = $sim_send(`PLI_DHWTW, mytnum,tstamp,tte_va,my_asi[mytid],entry);

       end //}
    end // }
    else begin // {
      if (`PARGS.nas_check_on && `PARGS.tlb_sync_on) begin // {
            `PR_INFO ("pli_tlb", `INFO, "   C%0d T%0d PLI_DTLBWRITE tid=%d ts=%0d entry=%h",
                       mycid,mytid,mytnum,tstamp,entry);
            `PR_INFO ("pli_nas", `INFO, "   C%0d T%0d PLI_SSTEP     tid=%d ts=%0d                 (tlb_sync: send SSTEP)",
                       mycid,mytid,mytnum,tstamp);
            junk = $sim_send(`PLI_DTLBWRITE, mytnum,tstamp,entry);
            junk = $sim_send(`PLI_SSTEP, mytnum);

            // Check to see if sstep was sent early
            if (`NASTOP.sstep_sent[mytnum]==1) begin // {
              `NASTOP.sstep_early[mytnum] <= 1'b1;  // SSTEP was sent before nas_pipe capture
            end //}

      end //}
    end // }

    //--------------------
    if (`PARGS.show_tlb_on) begin // {
      $write ("SHOW_TLB: DTLB_WRITE C%0d T%0d ",mycid,mytid);

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

      $write ("SHOW_TLB: DTLB_WRITE C%0d T%0d ",mycid,mytid);

      $display ("             PA=00%h P=%b IE=%b CP=%b NFO=%b E=%b EP=X W=%b  ts=%0d",
                  tte_pa,tte_p,tte_ie,tte_cp,tte_nfo,tte_e,tte_w,tstamp*`TOP.core_period); 
    end // }
    //--------------------

  end // }

end // always}

//----------------------------------------------------------
`endif
endmodule

`endif
`ifdef CORE_3

module dtlb_wr_c3 ();
`ifndef GATESIM

`include "tlb_sync.vh"
`include "nas.vh"
parameter NUM_TLB=128;

wire                    [7:0] data_in;
wire                    [7:0] tlb_wr;
wire                          wr_en;
wire                    [7:0] entry;
wire                    [7:0] asi_num;
wire                          asi_enable0;  // 1 per thread group
wire                          asi_enable1;
wire                    [7:0] store_asi;  // 1 per thread
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

reg         [(`TS_WIDTH-1):0] tstamp;
reg                           hwtw;
reg                     [7:0] my_asi [0:7];  // 1 asi number stored per thread
reg         [(`TS_WIDTH-1):0] demap_tstamp;

reg                     [2:0] mytid;
reg                     [5:0] mytnum;
wire                    [2:0] mycid;
integer                       junk;
integer                       i;
reg                     [7:0] cnt;
wire                          ready;

assign   mycid = 3;

`ifdef DEBUG_TLB
  wire [7:0] my_asi0 = my_asi[0];
  wire [7:0] my_asi1 = my_asi[1];
  wire [7:0] my_asi2 = my_asi[2];
  wire [7:0] my_asi3 = my_asi[3];
  wire [7:0] my_asi4 = my_asi[4];
  wire [7:0] my_asi5 = my_asi[5];
  wire [7:0] my_asi6 = my_asi[6];
  wire [7:0] my_asi7 = my_asi[7];
`endif

//----------------------------------------------------------
// Instantiate fifo - 1 entry per thread
fifo fifo ();
// Define fifo parameters
defparam fifo.ENTRY_BITS = 4;  // {hwtw,tid[2:0]}
defparam fifo.DEPTH      = 9;  // 1 extra entry for overflow detection
defparam fifo.PTR_BITS   = 4;

//----------------------------------------------------------
// DUT probes

assign   data_in = `SPC3.mmu.asi.wrote_dtlb;
assign   tlb_wr = `SPC3.mmu_reload_done;
assign   wr_en = `SPC3.lsu.tlb.tlb_wr_1_in_dout;

assign   entry = `SPC3.lsu.tlb.rw_index_1[6:0];

assign   asi_num = `PROBES3.asi_num;
assign   asi_enable0 =  `PROBES3.tlb_rd_vld_b & 
                        !`PROBES3.tlb_bypass_b &
                        `SPC3.tlu.fls0.lsu_inst_b;
assign   asi_enable1 =  `PROBES3.tlb_rd_vld_b & 
                        !`PROBES3.tlb_bypass_b &
                        `SPC3.tlu.fls1.lsu_inst_b;

assign   store_asi[3:0] = asi_enable0 ? `PROBES3.select_pc_b[3:0] : 4'b0;
assign   store_asi[7:4] = asi_enable1 ? `PROBES3.select_pc_b[7:4] : 4'b0;

assign   demap_page = `SPC3.lsu.tlc_demap & ~(demap_context | demap_real | demap_all);
assign   demap_context = `SPC3.lsu.tlc_demap_context;
assign   demap_real = `SPC3.lsu.tlc_demap_real;
assign   demap_all = `SPC3.lsu.tlc_demap_all;
assign   demap = {demap_all,demap_page,demap_context,demap_real};
assign   skip_demap =`SPC3.lsu.tlc_wr_u_en; 
assign   demap_tid = `SPC3.lsu.tld.tte1[37:35];

// if (|demap_1 && skip_demap ), then Implicit demap so don't send to NAS
assign   demap_active = |demap_1 && !skip_demap;
assign   auto_demap   = |demap_1 && skip_demap;

//---------------------
// Probes for debugging

// defines copied from :/libs/n2sram/tlbs/tlbs/n2_tlb_tl_128x59_cust_l/n2_tlb_tl_128x59_cust/rtl

// n2_tlb_tl_128x59_cam.sv

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

// n2_tlb_tl_128x59_ram.sv

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


assign  tlb_valid        = `SPC3.lsu.tlb.array.cam.valid;
assign  tlb_match        = `SPC3.lsu.tlb.array.cam.match;

assign  tte_va           =  {`SPC3.lsu.tlb.tte_tag_1_dout[`VA_47:`VA_28],
                             `SPC3.lsu.tlb.tte_tag_1_dout[`VA_27:`VA_22],
                             `SPC3.lsu.tlb.tte_tag_1_dout[`VA_21:`VA_16],
                             `SPC3.lsu.tlb.tte_tag_1_dout[`VA_15:`VA_13],
                             13'b0
                            };
assign  tte_context      = `SPC3.lsu.tlb.tte_tag_1_dout[`CNTX1_HI:`CNTX1_LO];
assign  tte_pid          = `SPC3.lsu.tlb.tte_tag_1_dout[`PID_HI:`PID_LO];
assign  tte_real         = `SPC3.lsu.tlb.tte_tag_1_dout[`REAL_BIT];
assign  tte_valid        = `SPC3.lsu.tlb.tte_tag_1_dout[`TTE_VALID];

assign  tte_page_mask    = `SPC3.lsu.tlb.tte_page_size_mask_1;

assign  tte_pa           = {`SPC3.lsu.tlb.tte_data_1[`DATA_PA_39_28_HI:`DATA_PA_39_28_LO],
                            `SPC3.lsu.tlb.tte_data_1[`DATA_PA_27_22_HI:`DATA_PA_27_22_LO],
                            `SPC3.lsu.tlb.tte_data_1[`DATA_PA_21_16_HI:`DATA_PA_21_16_LO],
                            `SPC3.lsu.tlb.tte_data_1[`DATA_PA_15_13_HI:`DATA_PA_15_13_LO],
                            13'b0
                           };
assign  tte_nfo          = `SPC3.lsu.tlb.tte_data_1[`DATA_NFO];
assign  tte_ie           = `SPC3.lsu.tlb.tte_data_1[`DATA_IE];
assign  tte_cp           = `SPC3.lsu.tlb.tte_data_1[`DATA_CP];
assign  tte_e            = `SPC3.lsu.tlb.tte_data_1[`DATA_X];
assign  tte_p            = `SPC3.lsu.tlb.tte_data_1[`DATA_P];
assign  tte_w            = `SPC3.lsu.tlb.tte_data_1[`DATA_W];
assign  tte_ep           = 1'bx;  // Does not apply for DTLB

assign ready = `PARGS.tlb_sync_on & !`SPC3.tcu_spc_mbist_start;

//----------------------------------------------------------
// Initialize state machine to idle state
initial  begin // {
  #1;
  hwtw = 1'b0;
  for (i=0; i<=7; i=i+1) begin
    my_asi[i] = 8'b0;
  end
  @ (posedge `SPC3.l2clk);

end // }

//----------------------------------------------------------
// Must use negedge to avoid race condition
// tlb_entry_replace (aka entry) is created in always block using blocking assignments

always @ (negedge (`SPC3.l2clk & ready)) begin // {

  tstamp = `TOP.core_cycle_cnt;
  demap_tstamp = `TOP.core_cycle_cnt;

  // Delay by 1 cycle to align with skip_demap
  demap_tid_1  <= demap_tid;  // demap_tid is active when demap is asserted
  demap_tnum_1 <= (mycid * 8) + demap_tid;
  demap_1      <= demap;

  //----------------------------------------------------------
  //  Send I/DTLBWRITE due to demap
  //

  if ((demap!=0) && (demap_1!=0)) begin // {
    `PR_ERROR ("tlb_sync", `ERROR, 
       "C%0d T%0d Illegal Back to Back DTLB demap",
        mycid,demap_tid_1);
  end // }

  if (demap_active) begin // {
    fifo.pop_fifo ({hwtw,mytid});
    if (`PARGS.nas_check_on && `PARGS.tlb_sync_on) begin // {
        `PR_INFO ("pli_tlb", `INFO, "   C%0d T%0d PLI_DTLBWRITE tid=%d ts=%0d entry=%h (demap)",
                   mycid,demap_tid_1,demap_tnum_1,demap_tstamp,8'hff);
        `PR_INFO ("pli_nas", `INFO, "   C%0d T%0d PLI_SSTEP     tid=%d ts=%0d                 (tlb_sync: send SSTEP)",
                   mycid,demap_tid_1,demap_tnum_1,demap_tstamp);
        junk = $sim_send(`PLI_DTLBWRITE, demap_tnum_1,demap_tstamp,8'hff);
        junk = $sim_send(`PLI_SSTEP, demap_tnum_1);

        // sstep_sent is asserted when data_in is asserted
        // Check to see if sstep was sent early
        if (`NASTOP.sstep_sent[demap_tnum_1]==1) begin // {
          `NASTOP.sstep_early[demap_tnum_1] <= 1'b1;  // SSTEP was sent before nas_pipe capture
        end //}

    end //}
  end //}

  //--------------------
  if (`PARGS.show_tlb_on & (|demap_1)) begin // {
    $write ("SHOW_TLB: DTLB_DEMAP C%0d T%0d ",mycid,demap_tid_1);

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
      $write ("type=autodemap ");
    end

    $display ("match=%h                ts=%0d",
                tlb_match,demap_tstamp*`TOP.core_period);

    for (cnt=0; cnt<=NUM_TLB; cnt=cnt+1) begin // {
      if (tlb_match[cnt]==1'b1)  begin // {
        $display ("SHOW_TLB: DTLB_DEMAP C%0d T%0d entry=%h V=0                                                   ts=%0d",
                   mycid,demap_tid_1,cnt,demap_tstamp*`TOP.core_period);
      end // }
    end // }
    //--------------------
  end // }

  //----------------------------------------------------------
  //  Send I/DHWTW     due to HWTW
  //  Send I/DTLBWRITE due to ASI write

  // Save asi num when DTLBREAD happens.
  // Otherwise, hold state.
  // Send asi num later with DHWTW
  for (i=0;i<=7;i=i+1) begin // {
    my_asi[i] = (store_asi[i]) ? asi_num : my_asi[i];
  end // }

  // There are 3 main signals to watch for TLBWRITE (data_in, tlb_wr, wr_en)
  // These signals will be interleaved between the threads.
  // Need to queue up the signals over time so they can be processed in order.
  // Each thread will only be doing 1 thing at a time.

  for (i=0;i<=7;i=i+1) begin // {

    // tlb_wr[tid] determines if the write is HWTW or TLBWRITE

    // data_in[tid] determines which thread will write next
    // Use fifo to save the tids of the data_in signals in order

    if (data_in[i]) begin // {
      if (tlb_wr[i]) begin // {
        fifo.push_fifo ({1'b1,i[2:0]}); //  {hwtw,tid[2:0]}
      end // }
      else begin // {
        fifo.push_fifo ({1'b0,i[2:0]}); //  {!hwtw,tid[2:0]}

        // Signal to nas_pipe to suppress SSTEP as soon we know a tlb write or demap is coming (data_in=1)
        //   Cannot wait for wr_en because it is possible to miss an SSTEP.
        `PR_INFO ("pli_nas", `INFO, "   C%0d T%0d PLI_SSTEP     tid=%d ts=%0d                 (tlb_sync: suppress sstep. sstep_sent=1)",
                       mycid,i,((mycid * 6'h8) + i[2:0]),tstamp);
        `NASTOP.sstep_sent[(mycid * 6'h8) + i[2:0]] <= 1'b1;      // suppress SSTEP
      end // }
    end // }

  end // }

  //----------------------------------------------------------
  // wr_en means that the write is occurring
  if (wr_en) begin // {
    fifo.pop_fifo ({hwtw,mytid});
    mytnum = (mycid * 8) + mytid;

    if (hwtw) begin // { 
       if (`PARGS.nas_check_on && `PARGS.tlb_sync_on) begin // {
           `PR_INFO ("pli_tlb", `INFO, "   C%0d T%0d PLI_DHWTW     tid=%d ts=%0d va=%h asi=%h entry=%h",
                      mycid,mytid,mytnum,tstamp,tte_va,my_asi[mytid],entry);
           junk = $sim_send(`PLI_DHWTW, mytnum,tstamp,tte_va,my_asi[mytid],entry);

       end //}
    end // }
    else begin // {
      if (`PARGS.nas_check_on && `PARGS.tlb_sync_on) begin // {
            `PR_INFO ("pli_tlb", `INFO, "   C%0d T%0d PLI_DTLBWRITE tid=%d ts=%0d entry=%h",
                       mycid,mytid,mytnum,tstamp,entry);
            `PR_INFO ("pli_nas", `INFO, "   C%0d T%0d PLI_SSTEP     tid=%d ts=%0d                 (tlb_sync: send SSTEP)",
                       mycid,mytid,mytnum,tstamp);
            junk = $sim_send(`PLI_DTLBWRITE, mytnum,tstamp,entry);
            junk = $sim_send(`PLI_SSTEP, mytnum);

            // Check to see if sstep was sent early
            if (`NASTOP.sstep_sent[mytnum]==1) begin // {
              `NASTOP.sstep_early[mytnum] <= 1'b1;  // SSTEP was sent before nas_pipe capture
            end //}

      end //}
    end // }

    //--------------------
    if (`PARGS.show_tlb_on) begin // {
      $write ("SHOW_TLB: DTLB_WRITE C%0d T%0d ",mycid,mytid);

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

      $write ("SHOW_TLB: DTLB_WRITE C%0d T%0d ",mycid,mytid);

      $display ("             PA=00%h P=%b IE=%b CP=%b NFO=%b E=%b EP=X W=%b  ts=%0d",
                  tte_pa,tte_p,tte_ie,tte_cp,tte_nfo,tte_e,tte_w,tstamp*`TOP.core_period); 
    end // }
    //--------------------

  end // }

end // always}

//----------------------------------------------------------
`endif
endmodule

`endif
`ifdef CORE_4

module dtlb_wr_c4 ();
`ifndef GATESIM

`include "tlb_sync.vh"
`include "nas.vh"
parameter NUM_TLB=128;

wire                    [7:0] data_in;
wire                    [7:0] tlb_wr;
wire                          wr_en;
wire                    [7:0] entry;
wire                    [7:0] asi_num;
wire                          asi_enable0;  // 1 per thread group
wire                          asi_enable1;
wire                    [7:0] store_asi;  // 1 per thread
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

reg         [(`TS_WIDTH-1):0] tstamp;
reg                           hwtw;
reg                     [7:0] my_asi [0:7];  // 1 asi number stored per thread
reg         [(`TS_WIDTH-1):0] demap_tstamp;

reg                     [2:0] mytid;
reg                     [5:0] mytnum;
wire                    [2:0] mycid;
integer                       junk;
integer                       i;
reg                     [7:0] cnt;
wire                          ready;

assign   mycid = 4;

`ifdef DEBUG_TLB
  wire [7:0] my_asi0 = my_asi[0];
  wire [7:0] my_asi1 = my_asi[1];
  wire [7:0] my_asi2 = my_asi[2];
  wire [7:0] my_asi3 = my_asi[3];
  wire [7:0] my_asi4 = my_asi[4];
  wire [7:0] my_asi5 = my_asi[5];
  wire [7:0] my_asi6 = my_asi[6];
  wire [7:0] my_asi7 = my_asi[7];
`endif

//----------------------------------------------------------
// Instantiate fifo - 1 entry per thread
fifo fifo ();
// Define fifo parameters
defparam fifo.ENTRY_BITS = 4;  // {hwtw,tid[2:0]}
defparam fifo.DEPTH      = 9;  // 1 extra entry for overflow detection
defparam fifo.PTR_BITS   = 4;

//----------------------------------------------------------
// DUT probes

assign   data_in = `SPC4.mmu.asi.wrote_dtlb;
assign   tlb_wr = `SPC4.mmu_reload_done;
assign   wr_en = `SPC4.lsu.tlb.tlb_wr_1_in_dout;

assign   entry = `SPC4.lsu.tlb.rw_index_1[6:0];

assign   asi_num = `PROBES4.asi_num;
assign   asi_enable0 =  `PROBES4.tlb_rd_vld_b & 
                        !`PROBES4.tlb_bypass_b &
                        `SPC4.tlu.fls0.lsu_inst_b;
assign   asi_enable1 =  `PROBES4.tlb_rd_vld_b & 
                        !`PROBES4.tlb_bypass_b &
                        `SPC4.tlu.fls1.lsu_inst_b;

assign   store_asi[3:0] = asi_enable0 ? `PROBES4.select_pc_b[3:0] : 4'b0;
assign   store_asi[7:4] = asi_enable1 ? `PROBES4.select_pc_b[7:4] : 4'b0;

assign   demap_page = `SPC4.lsu.tlc_demap & ~(demap_context | demap_real | demap_all);
assign   demap_context = `SPC4.lsu.tlc_demap_context;
assign   demap_real = `SPC4.lsu.tlc_demap_real;
assign   demap_all = `SPC4.lsu.tlc_demap_all;
assign   demap = {demap_all,demap_page,demap_context,demap_real};
assign   skip_demap =`SPC4.lsu.tlc_wr_u_en; 
assign   demap_tid = `SPC4.lsu.tld.tte1[37:35];

// if (|demap_1 && skip_demap ), then Implicit demap so don't send to NAS
assign   demap_active = |demap_1 && !skip_demap;
assign   auto_demap   = |demap_1 && skip_demap;

//---------------------
// Probes for debugging

// defines copied from :/libs/n2sram/tlbs/tlbs/n2_tlb_tl_128x59_cust_l/n2_tlb_tl_128x59_cust/rtl

// n2_tlb_tl_128x59_cam.sv

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

// n2_tlb_tl_128x59_ram.sv

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


assign  tlb_valid        = `SPC4.lsu.tlb.array.cam.valid;
assign  tlb_match        = `SPC4.lsu.tlb.array.cam.match;

assign  tte_va           =  {`SPC4.lsu.tlb.tte_tag_1_dout[`VA_47:`VA_28],
                             `SPC4.lsu.tlb.tte_tag_1_dout[`VA_27:`VA_22],
                             `SPC4.lsu.tlb.tte_tag_1_dout[`VA_21:`VA_16],
                             `SPC4.lsu.tlb.tte_tag_1_dout[`VA_15:`VA_13],
                             13'b0
                            };
assign  tte_context      = `SPC4.lsu.tlb.tte_tag_1_dout[`CNTX1_HI:`CNTX1_LO];
assign  tte_pid          = `SPC4.lsu.tlb.tte_tag_1_dout[`PID_HI:`PID_LO];
assign  tte_real         = `SPC4.lsu.tlb.tte_tag_1_dout[`REAL_BIT];
assign  tte_valid        = `SPC4.lsu.tlb.tte_tag_1_dout[`TTE_VALID];

assign  tte_page_mask    = `SPC4.lsu.tlb.tte_page_size_mask_1;

assign  tte_pa           = {`SPC4.lsu.tlb.tte_data_1[`DATA_PA_39_28_HI:`DATA_PA_39_28_LO],
                            `SPC4.lsu.tlb.tte_data_1[`DATA_PA_27_22_HI:`DATA_PA_27_22_LO],
                            `SPC4.lsu.tlb.tte_data_1[`DATA_PA_21_16_HI:`DATA_PA_21_16_LO],
                            `SPC4.lsu.tlb.tte_data_1[`DATA_PA_15_13_HI:`DATA_PA_15_13_LO],
                            13'b0
                           };
assign  tte_nfo          = `SPC4.lsu.tlb.tte_data_1[`DATA_NFO];
assign  tte_ie           = `SPC4.lsu.tlb.tte_data_1[`DATA_IE];
assign  tte_cp           = `SPC4.lsu.tlb.tte_data_1[`DATA_CP];
assign  tte_e            = `SPC4.lsu.tlb.tte_data_1[`DATA_X];
assign  tte_p            = `SPC4.lsu.tlb.tte_data_1[`DATA_P];
assign  tte_w            = `SPC4.lsu.tlb.tte_data_1[`DATA_W];
assign  tte_ep           = 1'bx;  // Does not apply for DTLB

assign ready = `PARGS.tlb_sync_on & !`SPC4.tcu_spc_mbist_start;

//----------------------------------------------------------
// Initialize state machine to idle state
initial  begin // {
  #1;
  hwtw = 1'b0;
  for (i=0; i<=7; i=i+1) begin
    my_asi[i] = 8'b0;
  end
  @ (posedge `SPC4.l2clk);

end // }

//----------------------------------------------------------
// Must use negedge to avoid race condition
// tlb_entry_replace (aka entry) is created in always block using blocking assignments

always @ (negedge (`SPC4.l2clk & ready)) begin // {

  tstamp = `TOP.core_cycle_cnt;
  demap_tstamp = `TOP.core_cycle_cnt;

  // Delay by 1 cycle to align with skip_demap
  demap_tid_1  <= demap_tid;  // demap_tid is active when demap is asserted
  demap_tnum_1 <= (mycid * 8) + demap_tid;
  demap_1      <= demap;

  //----------------------------------------------------------
  //  Send I/DTLBWRITE due to demap
  //

  if ((demap!=0) && (demap_1!=0)) begin // {
    `PR_ERROR ("tlb_sync", `ERROR, 
       "C%0d T%0d Illegal Back to Back DTLB demap",
        mycid,demap_tid_1);
  end // }

  if (demap_active) begin // {
    fifo.pop_fifo ({hwtw,mytid});
    if (`PARGS.nas_check_on && `PARGS.tlb_sync_on) begin // {
        `PR_INFO ("pli_tlb", `INFO, "   C%0d T%0d PLI_DTLBWRITE tid=%d ts=%0d entry=%h (demap)",
                   mycid,demap_tid_1,demap_tnum_1,demap_tstamp,8'hff);
        `PR_INFO ("pli_nas", `INFO, "   C%0d T%0d PLI_SSTEP     tid=%d ts=%0d                 (tlb_sync: send SSTEP)",
                   mycid,demap_tid_1,demap_tnum_1,demap_tstamp);
        junk = $sim_send(`PLI_DTLBWRITE, demap_tnum_1,demap_tstamp,8'hff);
        junk = $sim_send(`PLI_SSTEP, demap_tnum_1);

        // sstep_sent is asserted when data_in is asserted
        // Check to see if sstep was sent early
        if (`NASTOP.sstep_sent[demap_tnum_1]==1) begin // {
          `NASTOP.sstep_early[demap_tnum_1] <= 1'b1;  // SSTEP was sent before nas_pipe capture
        end //}

    end //}
  end //}

  //--------------------
  if (`PARGS.show_tlb_on & (|demap_1)) begin // {
    $write ("SHOW_TLB: DTLB_DEMAP C%0d T%0d ",mycid,demap_tid_1);

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
      $write ("type=autodemap ");
    end

    $display ("match=%h                ts=%0d",
                tlb_match,demap_tstamp*`TOP.core_period);

    for (cnt=0; cnt<=NUM_TLB; cnt=cnt+1) begin // {
      if (tlb_match[cnt]==1'b1)  begin // {
        $display ("SHOW_TLB: DTLB_DEMAP C%0d T%0d entry=%h V=0                                                   ts=%0d",
                   mycid,demap_tid_1,cnt,demap_tstamp*`TOP.core_period);
      end // }
    end // }
    //--------------------
  end // }

  //----------------------------------------------------------
  //  Send I/DHWTW     due to HWTW
  //  Send I/DTLBWRITE due to ASI write

  // Save asi num when DTLBREAD happens.
  // Otherwise, hold state.
  // Send asi num later with DHWTW
  for (i=0;i<=7;i=i+1) begin // {
    my_asi[i] = (store_asi[i]) ? asi_num : my_asi[i];
  end // }

  // There are 3 main signals to watch for TLBWRITE (data_in, tlb_wr, wr_en)
  // These signals will be interleaved between the threads.
  // Need to queue up the signals over time so they can be processed in order.
  // Each thread will only be doing 1 thing at a time.

  for (i=0;i<=7;i=i+1) begin // {

    // tlb_wr[tid] determines if the write is HWTW or TLBWRITE

    // data_in[tid] determines which thread will write next
    // Use fifo to save the tids of the data_in signals in order

    if (data_in[i]) begin // {
      if (tlb_wr[i]) begin // {
        fifo.push_fifo ({1'b1,i[2:0]}); //  {hwtw,tid[2:0]}
      end // }
      else begin // {
        fifo.push_fifo ({1'b0,i[2:0]}); //  {!hwtw,tid[2:0]}

        // Signal to nas_pipe to suppress SSTEP as soon we know a tlb write or demap is coming (data_in=1)
        //   Cannot wait for wr_en because it is possible to miss an SSTEP.
        `PR_INFO ("pli_nas", `INFO, "   C%0d T%0d PLI_SSTEP     tid=%d ts=%0d                 (tlb_sync: suppress sstep. sstep_sent=1)",
                       mycid,i,((mycid * 6'h8) + i[2:0]),tstamp);
        `NASTOP.sstep_sent[(mycid * 6'h8) + i[2:0]] <= 1'b1;      // suppress SSTEP
      end // }
    end // }

  end // }

  //----------------------------------------------------------
  // wr_en means that the write is occurring
  if (wr_en) begin // {
    fifo.pop_fifo ({hwtw,mytid});
    mytnum = (mycid * 8) + mytid;

    if (hwtw) begin // { 
       if (`PARGS.nas_check_on && `PARGS.tlb_sync_on) begin // {
           `PR_INFO ("pli_tlb", `INFO, "   C%0d T%0d PLI_DHWTW     tid=%d ts=%0d va=%h asi=%h entry=%h",
                      mycid,mytid,mytnum,tstamp,tte_va,my_asi[mytid],entry);
           junk = $sim_send(`PLI_DHWTW, mytnum,tstamp,tte_va,my_asi[mytid],entry);

       end //}
    end // }
    else begin // {
      if (`PARGS.nas_check_on && `PARGS.tlb_sync_on) begin // {
            `PR_INFO ("pli_tlb", `INFO, "   C%0d T%0d PLI_DTLBWRITE tid=%d ts=%0d entry=%h",
                       mycid,mytid,mytnum,tstamp,entry);
            `PR_INFO ("pli_nas", `INFO, "   C%0d T%0d PLI_SSTEP     tid=%d ts=%0d                 (tlb_sync: send SSTEP)",
                       mycid,mytid,mytnum,tstamp);
            junk = $sim_send(`PLI_DTLBWRITE, mytnum,tstamp,entry);
            junk = $sim_send(`PLI_SSTEP, mytnum);

            // Check to see if sstep was sent early
            if (`NASTOP.sstep_sent[mytnum]==1) begin // {
              `NASTOP.sstep_early[mytnum] <= 1'b1;  // SSTEP was sent before nas_pipe capture
            end //}

      end //}
    end // }

    //--------------------
    if (`PARGS.show_tlb_on) begin // {
      $write ("SHOW_TLB: DTLB_WRITE C%0d T%0d ",mycid,mytid);

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

      $write ("SHOW_TLB: DTLB_WRITE C%0d T%0d ",mycid,mytid);

      $display ("             PA=00%h P=%b IE=%b CP=%b NFO=%b E=%b EP=X W=%b  ts=%0d",
                  tte_pa,tte_p,tte_ie,tte_cp,tte_nfo,tte_e,tte_w,tstamp*`TOP.core_period); 
    end // }
    //--------------------

  end // }

end // always}

//----------------------------------------------------------
`endif
endmodule

`endif
`ifdef CORE_5

module dtlb_wr_c5 ();
`ifndef GATESIM

`include "tlb_sync.vh"
`include "nas.vh"
parameter NUM_TLB=128;

wire                    [7:0] data_in;
wire                    [7:0] tlb_wr;
wire                          wr_en;
wire                    [7:0] entry;
wire                    [7:0] asi_num;
wire                          asi_enable0;  // 1 per thread group
wire                          asi_enable1;
wire                    [7:0] store_asi;  // 1 per thread
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

reg         [(`TS_WIDTH-1):0] tstamp;
reg                           hwtw;
reg                     [7:0] my_asi [0:7];  // 1 asi number stored per thread
reg         [(`TS_WIDTH-1):0] demap_tstamp;

reg                     [2:0] mytid;
reg                     [5:0] mytnum;
wire                    [2:0] mycid;
integer                       junk;
integer                       i;
reg                     [7:0] cnt;
wire                          ready;

assign   mycid = 5;

`ifdef DEBUG_TLB
  wire [7:0] my_asi0 = my_asi[0];
  wire [7:0] my_asi1 = my_asi[1];
  wire [7:0] my_asi2 = my_asi[2];
  wire [7:0] my_asi3 = my_asi[3];
  wire [7:0] my_asi4 = my_asi[4];
  wire [7:0] my_asi5 = my_asi[5];
  wire [7:0] my_asi6 = my_asi[6];
  wire [7:0] my_asi7 = my_asi[7];
`endif

//----------------------------------------------------------
// Instantiate fifo - 1 entry per thread
fifo fifo ();
// Define fifo parameters
defparam fifo.ENTRY_BITS = 4;  // {hwtw,tid[2:0]}
defparam fifo.DEPTH      = 9;  // 1 extra entry for overflow detection
defparam fifo.PTR_BITS   = 4;

//----------------------------------------------------------
// DUT probes

assign   data_in = `SPC5.mmu.asi.wrote_dtlb;
assign   tlb_wr = `SPC5.mmu_reload_done;
assign   wr_en = `SPC5.lsu.tlb.tlb_wr_1_in_dout;

assign   entry = `SPC5.lsu.tlb.rw_index_1[6:0];

assign   asi_num = `PROBES5.asi_num;
assign   asi_enable0 =  `PROBES5.tlb_rd_vld_b & 
                        !`PROBES5.tlb_bypass_b &
                        `SPC5.tlu.fls0.lsu_inst_b;
assign   asi_enable1 =  `PROBES5.tlb_rd_vld_b & 
                        !`PROBES5.tlb_bypass_b &
                        `SPC5.tlu.fls1.lsu_inst_b;

assign   store_asi[3:0] = asi_enable0 ? `PROBES5.select_pc_b[3:0] : 4'b0;
assign   store_asi[7:4] = asi_enable1 ? `PROBES5.select_pc_b[7:4] : 4'b0;

assign   demap_page = `SPC5.lsu.tlc_demap & ~(demap_context | demap_real | demap_all);
assign   demap_context = `SPC5.lsu.tlc_demap_context;
assign   demap_real = `SPC5.lsu.tlc_demap_real;
assign   demap_all = `SPC5.lsu.tlc_demap_all;
assign   demap = {demap_all,demap_page,demap_context,demap_real};
assign   skip_demap =`SPC5.lsu.tlc_wr_u_en; 
assign   demap_tid = `SPC5.lsu.tld.tte1[37:35];

// if (|demap_1 && skip_demap ), then Implicit demap so don't send to NAS
assign   demap_active = |demap_1 && !skip_demap;
assign   auto_demap   = |demap_1 && skip_demap;

//---------------------
// Probes for debugging

// defines copied from :/libs/n2sram/tlbs/tlbs/n2_tlb_tl_128x59_cust_l/n2_tlb_tl_128x59_cust/rtl

// n2_tlb_tl_128x59_cam.sv

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

// n2_tlb_tl_128x59_ram.sv

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


assign  tlb_valid        = `SPC5.lsu.tlb.array.cam.valid;
assign  tlb_match        = `SPC5.lsu.tlb.array.cam.match;

assign  tte_va           =  {`SPC5.lsu.tlb.tte_tag_1_dout[`VA_47:`VA_28],
                             `SPC5.lsu.tlb.tte_tag_1_dout[`VA_27:`VA_22],
                             `SPC5.lsu.tlb.tte_tag_1_dout[`VA_21:`VA_16],
                             `SPC5.lsu.tlb.tte_tag_1_dout[`VA_15:`VA_13],
                             13'b0
                            };
assign  tte_context      = `SPC5.lsu.tlb.tte_tag_1_dout[`CNTX1_HI:`CNTX1_LO];
assign  tte_pid          = `SPC5.lsu.tlb.tte_tag_1_dout[`PID_HI:`PID_LO];
assign  tte_real         = `SPC5.lsu.tlb.tte_tag_1_dout[`REAL_BIT];
assign  tte_valid        = `SPC5.lsu.tlb.tte_tag_1_dout[`TTE_VALID];

assign  tte_page_mask    = `SPC5.lsu.tlb.tte_page_size_mask_1;

assign  tte_pa           = {`SPC5.lsu.tlb.tte_data_1[`DATA_PA_39_28_HI:`DATA_PA_39_28_LO],
                            `SPC5.lsu.tlb.tte_data_1[`DATA_PA_27_22_HI:`DATA_PA_27_22_LO],
                            `SPC5.lsu.tlb.tte_data_1[`DATA_PA_21_16_HI:`DATA_PA_21_16_LO],
                            `SPC5.lsu.tlb.tte_data_1[`DATA_PA_15_13_HI:`DATA_PA_15_13_LO],
                            13'b0
                           };
assign  tte_nfo          = `SPC5.lsu.tlb.tte_data_1[`DATA_NFO];
assign  tte_ie           = `SPC5.lsu.tlb.tte_data_1[`DATA_IE];
assign  tte_cp           = `SPC5.lsu.tlb.tte_data_1[`DATA_CP];
assign  tte_e            = `SPC5.lsu.tlb.tte_data_1[`DATA_X];
assign  tte_p            = `SPC5.lsu.tlb.tte_data_1[`DATA_P];
assign  tte_w            = `SPC5.lsu.tlb.tte_data_1[`DATA_W];
assign  tte_ep           = 1'bx;  // Does not apply for DTLB

assign ready = `PARGS.tlb_sync_on & !`SPC5.tcu_spc_mbist_start;

//----------------------------------------------------------
// Initialize state machine to idle state
initial  begin // {
  #1;
  hwtw = 1'b0;
  for (i=0; i<=7; i=i+1) begin
    my_asi[i] = 8'b0;
  end
  @ (posedge `SPC5.l2clk);

end // }

//----------------------------------------------------------
// Must use negedge to avoid race condition
// tlb_entry_replace (aka entry) is created in always block using blocking assignments

always @ (negedge (`SPC5.l2clk & ready)) begin // {

  tstamp = `TOP.core_cycle_cnt;
  demap_tstamp = `TOP.core_cycle_cnt;

  // Delay by 1 cycle to align with skip_demap
  demap_tid_1  <= demap_tid;  // demap_tid is active when demap is asserted
  demap_tnum_1 <= (mycid * 8) + demap_tid;
  demap_1      <= demap;

  //----------------------------------------------------------
  //  Send I/DTLBWRITE due to demap
  //

  if ((demap!=0) && (demap_1!=0)) begin // {
    `PR_ERROR ("tlb_sync", `ERROR, 
       "C%0d T%0d Illegal Back to Back DTLB demap",
        mycid,demap_tid_1);
  end // }

  if (demap_active) begin // {
    fifo.pop_fifo ({hwtw,mytid});
    if (`PARGS.nas_check_on && `PARGS.tlb_sync_on) begin // {
        `PR_INFO ("pli_tlb", `INFO, "   C%0d T%0d PLI_DTLBWRITE tid=%d ts=%0d entry=%h (demap)",
                   mycid,demap_tid_1,demap_tnum_1,demap_tstamp,8'hff);
        `PR_INFO ("pli_nas", `INFO, "   C%0d T%0d PLI_SSTEP     tid=%d ts=%0d                 (tlb_sync: send SSTEP)",
                   mycid,demap_tid_1,demap_tnum_1,demap_tstamp);
        junk = $sim_send(`PLI_DTLBWRITE, demap_tnum_1,demap_tstamp,8'hff);
        junk = $sim_send(`PLI_SSTEP, demap_tnum_1);

        // sstep_sent is asserted when data_in is asserted
        // Check to see if sstep was sent early
        if (`NASTOP.sstep_sent[demap_tnum_1]==1) begin // {
          `NASTOP.sstep_early[demap_tnum_1] <= 1'b1;  // SSTEP was sent before nas_pipe capture
        end //}

    end //}
  end //}

  //--------------------
  if (`PARGS.show_tlb_on & (|demap_1)) begin // {
    $write ("SHOW_TLB: DTLB_DEMAP C%0d T%0d ",mycid,demap_tid_1);

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
      $write ("type=autodemap ");
    end

    $display ("match=%h                ts=%0d",
                tlb_match,demap_tstamp*`TOP.core_period);

    for (cnt=0; cnt<=NUM_TLB; cnt=cnt+1) begin // {
      if (tlb_match[cnt]==1'b1)  begin // {
        $display ("SHOW_TLB: DTLB_DEMAP C%0d T%0d entry=%h V=0                                                   ts=%0d",
                   mycid,demap_tid_1,cnt,demap_tstamp*`TOP.core_period);
      end // }
    end // }
    //--------------------
  end // }

  //----------------------------------------------------------
  //  Send I/DHWTW     due to HWTW
  //  Send I/DTLBWRITE due to ASI write

  // Save asi num when DTLBREAD happens.
  // Otherwise, hold state.
  // Send asi num later with DHWTW
  for (i=0;i<=7;i=i+1) begin // {
    my_asi[i] = (store_asi[i]) ? asi_num : my_asi[i];
  end // }

  // There are 3 main signals to watch for TLBWRITE (data_in, tlb_wr, wr_en)
  // These signals will be interleaved between the threads.
  // Need to queue up the signals over time so they can be processed in order.
  // Each thread will only be doing 1 thing at a time.

  for (i=0;i<=7;i=i+1) begin // {

    // tlb_wr[tid] determines if the write is HWTW or TLBWRITE

    // data_in[tid] determines which thread will write next
    // Use fifo to save the tids of the data_in signals in order

    if (data_in[i]) begin // {
      if (tlb_wr[i]) begin // {
        fifo.push_fifo ({1'b1,i[2:0]}); //  {hwtw,tid[2:0]}
      end // }
      else begin // {
        fifo.push_fifo ({1'b0,i[2:0]}); //  {!hwtw,tid[2:0]}

        // Signal to nas_pipe to suppress SSTEP as soon we know a tlb write or demap is coming (data_in=1)
        //   Cannot wait for wr_en because it is possible to miss an SSTEP.
        `PR_INFO ("pli_nas", `INFO, "   C%0d T%0d PLI_SSTEP     tid=%d ts=%0d                 (tlb_sync: suppress sstep. sstep_sent=1)",
                       mycid,i,((mycid * 6'h8) + i[2:0]),tstamp);
        `NASTOP.sstep_sent[(mycid * 6'h8) + i[2:0]] <= 1'b1;      // suppress SSTEP
      end // }
    end // }

  end // }

  //----------------------------------------------------------
  // wr_en means that the write is occurring
  if (wr_en) begin // {
    fifo.pop_fifo ({hwtw,mytid});
    mytnum = (mycid * 8) + mytid;

    if (hwtw) begin // { 
       if (`PARGS.nas_check_on && `PARGS.tlb_sync_on) begin // {
           `PR_INFO ("pli_tlb", `INFO, "   C%0d T%0d PLI_DHWTW     tid=%d ts=%0d va=%h asi=%h entry=%h",
                      mycid,mytid,mytnum,tstamp,tte_va,my_asi[mytid],entry);
           junk = $sim_send(`PLI_DHWTW, mytnum,tstamp,tte_va,my_asi[mytid],entry);

       end //}
    end // }
    else begin // {
      if (`PARGS.nas_check_on && `PARGS.tlb_sync_on) begin // {
            `PR_INFO ("pli_tlb", `INFO, "   C%0d T%0d PLI_DTLBWRITE tid=%d ts=%0d entry=%h",
                       mycid,mytid,mytnum,tstamp,entry);
            `PR_INFO ("pli_nas", `INFO, "   C%0d T%0d PLI_SSTEP     tid=%d ts=%0d                 (tlb_sync: send SSTEP)",
                       mycid,mytid,mytnum,tstamp);
            junk = $sim_send(`PLI_DTLBWRITE, mytnum,tstamp,entry);
            junk = $sim_send(`PLI_SSTEP, mytnum);

            // Check to see if sstep was sent early
            if (`NASTOP.sstep_sent[mytnum]==1) begin // {
              `NASTOP.sstep_early[mytnum] <= 1'b1;  // SSTEP was sent before nas_pipe capture
            end //}

      end //}
    end // }

    //--------------------
    if (`PARGS.show_tlb_on) begin // {
      $write ("SHOW_TLB: DTLB_WRITE C%0d T%0d ",mycid,mytid);

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

      $write ("SHOW_TLB: DTLB_WRITE C%0d T%0d ",mycid,mytid);

      $display ("             PA=00%h P=%b IE=%b CP=%b NFO=%b E=%b EP=X W=%b  ts=%0d",
                  tte_pa,tte_p,tte_ie,tte_cp,tte_nfo,tte_e,tte_w,tstamp*`TOP.core_period); 
    end // }
    //--------------------

  end // }

end // always}

//----------------------------------------------------------
`endif
endmodule

`endif
`ifdef CORE_6

module dtlb_wr_c6 ();
`ifndef GATESIM

`include "tlb_sync.vh"
`include "nas.vh"
parameter NUM_TLB=128;

wire                    [7:0] data_in;
wire                    [7:0] tlb_wr;
wire                          wr_en;
wire                    [7:0] entry;
wire                    [7:0] asi_num;
wire                          asi_enable0;  // 1 per thread group
wire                          asi_enable1;
wire                    [7:0] store_asi;  // 1 per thread
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

reg         [(`TS_WIDTH-1):0] tstamp;
reg                           hwtw;
reg                     [7:0] my_asi [0:7];  // 1 asi number stored per thread
reg         [(`TS_WIDTH-1):0] demap_tstamp;

reg                     [2:0] mytid;
reg                     [5:0] mytnum;
wire                    [2:0] mycid;
integer                       junk;
integer                       i;
reg                     [7:0] cnt;
wire                          ready;

assign   mycid = 6;

`ifdef DEBUG_TLB
  wire [7:0] my_asi0 = my_asi[0];
  wire [7:0] my_asi1 = my_asi[1];
  wire [7:0] my_asi2 = my_asi[2];
  wire [7:0] my_asi3 = my_asi[3];
  wire [7:0] my_asi4 = my_asi[4];
  wire [7:0] my_asi5 = my_asi[5];
  wire [7:0] my_asi6 = my_asi[6];
  wire [7:0] my_asi7 = my_asi[7];
`endif

//----------------------------------------------------------
// Instantiate fifo - 1 entry per thread
fifo fifo ();
// Define fifo parameters
defparam fifo.ENTRY_BITS = 4;  // {hwtw,tid[2:0]}
defparam fifo.DEPTH      = 9;  // 1 extra entry for overflow detection
defparam fifo.PTR_BITS   = 4;

//----------------------------------------------------------
// DUT probes

assign   data_in = `SPC6.mmu.asi.wrote_dtlb;
assign   tlb_wr = `SPC6.mmu_reload_done;
assign   wr_en = `SPC6.lsu.tlb.tlb_wr_1_in_dout;

assign   entry = `SPC6.lsu.tlb.rw_index_1[6:0];

assign   asi_num = `PROBES6.asi_num;
assign   asi_enable0 =  `PROBES6.tlb_rd_vld_b & 
                        !`PROBES6.tlb_bypass_b &
                        `SPC6.tlu.fls0.lsu_inst_b;
assign   asi_enable1 =  `PROBES6.tlb_rd_vld_b & 
                        !`PROBES6.tlb_bypass_b &
                        `SPC6.tlu.fls1.lsu_inst_b;

assign   store_asi[3:0] = asi_enable0 ? `PROBES6.select_pc_b[3:0] : 4'b0;
assign   store_asi[7:4] = asi_enable1 ? `PROBES6.select_pc_b[7:4] : 4'b0;

assign   demap_page = `SPC6.lsu.tlc_demap & ~(demap_context | demap_real | demap_all);
assign   demap_context = `SPC6.lsu.tlc_demap_context;
assign   demap_real = `SPC6.lsu.tlc_demap_real;
assign   demap_all = `SPC6.lsu.tlc_demap_all;
assign   demap = {demap_all,demap_page,demap_context,demap_real};
assign   skip_demap =`SPC6.lsu.tlc_wr_u_en; 
assign   demap_tid = `SPC6.lsu.tld.tte1[37:35];

// if (|demap_1 && skip_demap ), then Implicit demap so don't send to NAS
assign   demap_active = |demap_1 && !skip_demap;
assign   auto_demap   = |demap_1 && skip_demap;

//---------------------
// Probes for debugging

// defines copied from :/libs/n2sram/tlbs/tlbs/n2_tlb_tl_128x59_cust_l/n2_tlb_tl_128x59_cust/rtl

// n2_tlb_tl_128x59_cam.sv

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

// n2_tlb_tl_128x59_ram.sv

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


assign  tlb_valid        = `SPC6.lsu.tlb.array.cam.valid;
assign  tlb_match        = `SPC6.lsu.tlb.array.cam.match;

assign  tte_va           =  {`SPC6.lsu.tlb.tte_tag_1_dout[`VA_47:`VA_28],
                             `SPC6.lsu.tlb.tte_tag_1_dout[`VA_27:`VA_22],
                             `SPC6.lsu.tlb.tte_tag_1_dout[`VA_21:`VA_16],
                             `SPC6.lsu.tlb.tte_tag_1_dout[`VA_15:`VA_13],
                             13'b0
                            };
assign  tte_context      = `SPC6.lsu.tlb.tte_tag_1_dout[`CNTX1_HI:`CNTX1_LO];
assign  tte_pid          = `SPC6.lsu.tlb.tte_tag_1_dout[`PID_HI:`PID_LO];
assign  tte_real         = `SPC6.lsu.tlb.tte_tag_1_dout[`REAL_BIT];
assign  tte_valid        = `SPC6.lsu.tlb.tte_tag_1_dout[`TTE_VALID];

assign  tte_page_mask    = `SPC6.lsu.tlb.tte_page_size_mask_1;

assign  tte_pa           = {`SPC6.lsu.tlb.tte_data_1[`DATA_PA_39_28_HI:`DATA_PA_39_28_LO],
                            `SPC6.lsu.tlb.tte_data_1[`DATA_PA_27_22_HI:`DATA_PA_27_22_LO],
                            `SPC6.lsu.tlb.tte_data_1[`DATA_PA_21_16_HI:`DATA_PA_21_16_LO],
                            `SPC6.lsu.tlb.tte_data_1[`DATA_PA_15_13_HI:`DATA_PA_15_13_LO],
                            13'b0
                           };
assign  tte_nfo          = `SPC6.lsu.tlb.tte_data_1[`DATA_NFO];
assign  tte_ie           = `SPC6.lsu.tlb.tte_data_1[`DATA_IE];
assign  tte_cp           = `SPC6.lsu.tlb.tte_data_1[`DATA_CP];
assign  tte_e            = `SPC6.lsu.tlb.tte_data_1[`DATA_X];
assign  tte_p            = `SPC6.lsu.tlb.tte_data_1[`DATA_P];
assign  tte_w            = `SPC6.lsu.tlb.tte_data_1[`DATA_W];
assign  tte_ep           = 1'bx;  // Does not apply for DTLB

assign ready = `PARGS.tlb_sync_on & !`SPC6.tcu_spc_mbist_start;

//----------------------------------------------------------
// Initialize state machine to idle state
initial  begin // {
  #1;
  hwtw = 1'b0;
  for (i=0; i<=7; i=i+1) begin
    my_asi[i] = 8'b0;
  end
  @ (posedge `SPC6.l2clk);

end // }

//----------------------------------------------------------
// Must use negedge to avoid race condition
// tlb_entry_replace (aka entry) is created in always block using blocking assignments

always @ (negedge (`SPC6.l2clk & ready)) begin // {

  tstamp = `TOP.core_cycle_cnt;
  demap_tstamp = `TOP.core_cycle_cnt;

  // Delay by 1 cycle to align with skip_demap
  demap_tid_1  <= demap_tid;  // demap_tid is active when demap is asserted
  demap_tnum_1 <= (mycid * 8) + demap_tid;
  demap_1      <= demap;

  //----------------------------------------------------------
  //  Send I/DTLBWRITE due to demap
  //

  if ((demap!=0) && (demap_1!=0)) begin // {
    `PR_ERROR ("tlb_sync", `ERROR, 
       "C%0d T%0d Illegal Back to Back DTLB demap",
        mycid,demap_tid_1);
  end // }

  if (demap_active) begin // {
    fifo.pop_fifo ({hwtw,mytid});
    if (`PARGS.nas_check_on && `PARGS.tlb_sync_on) begin // {
        `PR_INFO ("pli_tlb", `INFO, "   C%0d T%0d PLI_DTLBWRITE tid=%d ts=%0d entry=%h (demap)",
                   mycid,demap_tid_1,demap_tnum_1,demap_tstamp,8'hff);
        `PR_INFO ("pli_nas", `INFO, "   C%0d T%0d PLI_SSTEP     tid=%d ts=%0d                 (tlb_sync: send SSTEP)",
                   mycid,demap_tid_1,demap_tnum_1,demap_tstamp);
        junk = $sim_send(`PLI_DTLBWRITE, demap_tnum_1,demap_tstamp,8'hff);
        junk = $sim_send(`PLI_SSTEP, demap_tnum_1);

        // sstep_sent is asserted when data_in is asserted
        // Check to see if sstep was sent early
        if (`NASTOP.sstep_sent[demap_tnum_1]==1) begin // {
          `NASTOP.sstep_early[demap_tnum_1] <= 1'b1;  // SSTEP was sent before nas_pipe capture
        end //}

    end //}
  end //}

  //--------------------
  if (`PARGS.show_tlb_on & (|demap_1)) begin // {
    $write ("SHOW_TLB: DTLB_DEMAP C%0d T%0d ",mycid,demap_tid_1);

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
      $write ("type=autodemap ");
    end

    $display ("match=%h                ts=%0d",
                tlb_match,demap_tstamp*`TOP.core_period);

    for (cnt=0; cnt<=NUM_TLB; cnt=cnt+1) begin // {
      if (tlb_match[cnt]==1'b1)  begin // {
        $display ("SHOW_TLB: DTLB_DEMAP C%0d T%0d entry=%h V=0                                                   ts=%0d",
                   mycid,demap_tid_1,cnt,demap_tstamp*`TOP.core_period);
      end // }
    end // }
    //--------------------
  end // }

  //----------------------------------------------------------
  //  Send I/DHWTW     due to HWTW
  //  Send I/DTLBWRITE due to ASI write

  // Save asi num when DTLBREAD happens.
  // Otherwise, hold state.
  // Send asi num later with DHWTW
  for (i=0;i<=7;i=i+1) begin // {
    my_asi[i] = (store_asi[i]) ? asi_num : my_asi[i];
  end // }

  // There are 3 main signals to watch for TLBWRITE (data_in, tlb_wr, wr_en)
  // These signals will be interleaved between the threads.
  // Need to queue up the signals over time so they can be processed in order.
  // Each thread will only be doing 1 thing at a time.

  for (i=0;i<=7;i=i+1) begin // {

    // tlb_wr[tid] determines if the write is HWTW or TLBWRITE

    // data_in[tid] determines which thread will write next
    // Use fifo to save the tids of the data_in signals in order

    if (data_in[i]) begin // {
      if (tlb_wr[i]) begin // {
        fifo.push_fifo ({1'b1,i[2:0]}); //  {hwtw,tid[2:0]}
      end // }
      else begin // {
        fifo.push_fifo ({1'b0,i[2:0]}); //  {!hwtw,tid[2:0]}

        // Signal to nas_pipe to suppress SSTEP as soon we know a tlb write or demap is coming (data_in=1)
        //   Cannot wait for wr_en because it is possible to miss an SSTEP.
        `PR_INFO ("pli_nas", `INFO, "   C%0d T%0d PLI_SSTEP     tid=%d ts=%0d                 (tlb_sync: suppress sstep. sstep_sent=1)",
                       mycid,i,((mycid * 6'h8) + i[2:0]),tstamp);
        `NASTOP.sstep_sent[(mycid * 6'h8) + i[2:0]] <= 1'b1;      // suppress SSTEP
      end // }
    end // }

  end // }

  //----------------------------------------------------------
  // wr_en means that the write is occurring
  if (wr_en) begin // {
    fifo.pop_fifo ({hwtw,mytid});
    mytnum = (mycid * 8) + mytid;

    if (hwtw) begin // { 
       if (`PARGS.nas_check_on && `PARGS.tlb_sync_on) begin // {
           `PR_INFO ("pli_tlb", `INFO, "   C%0d T%0d PLI_DHWTW     tid=%d ts=%0d va=%h asi=%h entry=%h",
                      mycid,mytid,mytnum,tstamp,tte_va,my_asi[mytid],entry);
           junk = $sim_send(`PLI_DHWTW, mytnum,tstamp,tte_va,my_asi[mytid],entry);

       end //}
    end // }
    else begin // {
      if (`PARGS.nas_check_on && `PARGS.tlb_sync_on) begin // {
            `PR_INFO ("pli_tlb", `INFO, "   C%0d T%0d PLI_DTLBWRITE tid=%d ts=%0d entry=%h",
                       mycid,mytid,mytnum,tstamp,entry);
            `PR_INFO ("pli_nas", `INFO, "   C%0d T%0d PLI_SSTEP     tid=%d ts=%0d                 (tlb_sync: send SSTEP)",
                       mycid,mytid,mytnum,tstamp);
            junk = $sim_send(`PLI_DTLBWRITE, mytnum,tstamp,entry);
            junk = $sim_send(`PLI_SSTEP, mytnum);

            // Check to see if sstep was sent early
            if (`NASTOP.sstep_sent[mytnum]==1) begin // {
              `NASTOP.sstep_early[mytnum] <= 1'b1;  // SSTEP was sent before nas_pipe capture
            end //}

      end //}
    end // }

    //--------------------
    if (`PARGS.show_tlb_on) begin // {
      $write ("SHOW_TLB: DTLB_WRITE C%0d T%0d ",mycid,mytid);

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

      $write ("SHOW_TLB: DTLB_WRITE C%0d T%0d ",mycid,mytid);

      $display ("             PA=00%h P=%b IE=%b CP=%b NFO=%b E=%b EP=X W=%b  ts=%0d",
                  tte_pa,tte_p,tte_ie,tte_cp,tte_nfo,tte_e,tte_w,tstamp*`TOP.core_period); 
    end // }
    //--------------------

  end // }

end // always}

//----------------------------------------------------------
`endif
endmodule

`endif
`ifdef CORE_7

module dtlb_wr_c7 ();
`ifndef GATESIM

`include "tlb_sync.vh"
`include "nas.vh"
parameter NUM_TLB=128;

wire                    [7:0] data_in;
wire                    [7:0] tlb_wr;
wire                          wr_en;
wire                    [7:0] entry;
wire                    [7:0] asi_num;
wire                          asi_enable0;  // 1 per thread group
wire                          asi_enable1;
wire                    [7:0] store_asi;  // 1 per thread
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

reg         [(`TS_WIDTH-1):0] tstamp;
reg                           hwtw;
reg                     [7:0] my_asi [0:7];  // 1 asi number stored per thread
reg         [(`TS_WIDTH-1):0] demap_tstamp;

reg                     [2:0] mytid;
reg                     [5:0] mytnum;
wire                    [2:0] mycid;
integer                       junk;
integer                       i;
reg                     [7:0] cnt;
wire                          ready;

assign   mycid = 7;

`ifdef DEBUG_TLB
  wire [7:0] my_asi0 = my_asi[0];
  wire [7:0] my_asi1 = my_asi[1];
  wire [7:0] my_asi2 = my_asi[2];
  wire [7:0] my_asi3 = my_asi[3];
  wire [7:0] my_asi4 = my_asi[4];
  wire [7:0] my_asi5 = my_asi[5];
  wire [7:0] my_asi6 = my_asi[6];
  wire [7:0] my_asi7 = my_asi[7];
`endif

//----------------------------------------------------------
// Instantiate fifo - 1 entry per thread
fifo fifo ();
// Define fifo parameters
defparam fifo.ENTRY_BITS = 4;  // {hwtw,tid[2:0]}
defparam fifo.DEPTH      = 9;  // 1 extra entry for overflow detection
defparam fifo.PTR_BITS   = 4;

//----------------------------------------------------------
// DUT probes

assign   data_in = `SPC7.mmu.asi.wrote_dtlb;
assign   tlb_wr = `SPC7.mmu_reload_done;
assign   wr_en = `SPC7.lsu.tlb.tlb_wr_1_in_dout;

assign   entry = `SPC7.lsu.tlb.rw_index_1[6:0];

assign   asi_num = `PROBES7.asi_num;
assign   asi_enable0 =  `PROBES7.tlb_rd_vld_b & 
                        !`PROBES7.tlb_bypass_b &
                        `SPC7.tlu.fls0.lsu_inst_b;
assign   asi_enable1 =  `PROBES7.tlb_rd_vld_b & 
                        !`PROBES7.tlb_bypass_b &
                        `SPC7.tlu.fls1.lsu_inst_b;

assign   store_asi[3:0] = asi_enable0 ? `PROBES7.select_pc_b[3:0] : 4'b0;
assign   store_asi[7:4] = asi_enable1 ? `PROBES7.select_pc_b[7:4] : 4'b0;

assign   demap_page = `SPC7.lsu.tlc_demap & ~(demap_context | demap_real | demap_all);
assign   demap_context = `SPC7.lsu.tlc_demap_context;
assign   demap_real = `SPC7.lsu.tlc_demap_real;
assign   demap_all = `SPC7.lsu.tlc_demap_all;
assign   demap = {demap_all,demap_page,demap_context,demap_real};
assign   skip_demap =`SPC7.lsu.tlc_wr_u_en; 
assign   demap_tid = `SPC7.lsu.tld.tte1[37:35];

// if (|demap_1 && skip_demap ), then Implicit demap so don't send to NAS
assign   demap_active = |demap_1 && !skip_demap;
assign   auto_demap   = |demap_1 && skip_demap;

//---------------------
// Probes for debugging

// defines copied from :/libs/n2sram/tlbs/tlbs/n2_tlb_tl_128x59_cust_l/n2_tlb_tl_128x59_cust/rtl

// n2_tlb_tl_128x59_cam.sv

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

// n2_tlb_tl_128x59_ram.sv

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


assign  tlb_valid        = `SPC7.lsu.tlb.array.cam.valid;
assign  tlb_match        = `SPC7.lsu.tlb.array.cam.match;

assign  tte_va           =  {`SPC7.lsu.tlb.tte_tag_1_dout[`VA_47:`VA_28],
                             `SPC7.lsu.tlb.tte_tag_1_dout[`VA_27:`VA_22],
                             `SPC7.lsu.tlb.tte_tag_1_dout[`VA_21:`VA_16],
                             `SPC7.lsu.tlb.tte_tag_1_dout[`VA_15:`VA_13],
                             13'b0
                            };
assign  tte_context      = `SPC7.lsu.tlb.tte_tag_1_dout[`CNTX1_HI:`CNTX1_LO];
assign  tte_pid          = `SPC7.lsu.tlb.tte_tag_1_dout[`PID_HI:`PID_LO];
assign  tte_real         = `SPC7.lsu.tlb.tte_tag_1_dout[`REAL_BIT];
assign  tte_valid        = `SPC7.lsu.tlb.tte_tag_1_dout[`TTE_VALID];

assign  tte_page_mask    = `SPC7.lsu.tlb.tte_page_size_mask_1;

assign  tte_pa           = {`SPC7.lsu.tlb.tte_data_1[`DATA_PA_39_28_HI:`DATA_PA_39_28_LO],
                            `SPC7.lsu.tlb.tte_data_1[`DATA_PA_27_22_HI:`DATA_PA_27_22_LO],
                            `SPC7.lsu.tlb.tte_data_1[`DATA_PA_21_16_HI:`DATA_PA_21_16_LO],
                            `SPC7.lsu.tlb.tte_data_1[`DATA_PA_15_13_HI:`DATA_PA_15_13_LO],
                            13'b0
                           };
assign  tte_nfo          = `SPC7.lsu.tlb.tte_data_1[`DATA_NFO];
assign  tte_ie           = `SPC7.lsu.tlb.tte_data_1[`DATA_IE];
assign  tte_cp           = `SPC7.lsu.tlb.tte_data_1[`DATA_CP];
assign  tte_e            = `SPC7.lsu.tlb.tte_data_1[`DATA_X];
assign  tte_p            = `SPC7.lsu.tlb.tte_data_1[`DATA_P];
assign  tte_w            = `SPC7.lsu.tlb.tte_data_1[`DATA_W];
assign  tte_ep           = 1'bx;  // Does not apply for DTLB

assign ready = `PARGS.tlb_sync_on & !`SPC7.tcu_spc_mbist_start;

//----------------------------------------------------------
// Initialize state machine to idle state
initial  begin // {
  #1;
  hwtw = 1'b0;
  for (i=0; i<=7; i=i+1) begin
    my_asi[i] = 8'b0;
  end
  @ (posedge `SPC7.l2clk);

end // }

//----------------------------------------------------------
// Must use negedge to avoid race condition
// tlb_entry_replace (aka entry) is created in always block using blocking assignments

always @ (negedge (`SPC7.l2clk & ready)) begin // {

  tstamp = `TOP.core_cycle_cnt;
  demap_tstamp = `TOP.core_cycle_cnt;

  // Delay by 1 cycle to align with skip_demap
  demap_tid_1  <= demap_tid;  // demap_tid is active when demap is asserted
  demap_tnum_1 <= (mycid * 8) + demap_tid;
  demap_1      <= demap;

  //----------------------------------------------------------
  //  Send I/DTLBWRITE due to demap
  //

  if ((demap!=0) && (demap_1!=0)) begin // {
    `PR_ERROR ("tlb_sync", `ERROR, 
       "C%0d T%0d Illegal Back to Back DTLB demap",
        mycid,demap_tid_1);
  end // }

  if (demap_active) begin // {
    fifo.pop_fifo ({hwtw,mytid});
    if (`PARGS.nas_check_on && `PARGS.tlb_sync_on) begin // {
        `PR_INFO ("pli_tlb", `INFO, "   C%0d T%0d PLI_DTLBWRITE tid=%d ts=%0d entry=%h (demap)",
                   mycid,demap_tid_1,demap_tnum_1,demap_tstamp,8'hff);
        `PR_INFO ("pli_nas", `INFO, "   C%0d T%0d PLI_SSTEP     tid=%d ts=%0d                 (tlb_sync: send SSTEP)",
                   mycid,demap_tid_1,demap_tnum_1,demap_tstamp);
        junk = $sim_send(`PLI_DTLBWRITE, demap_tnum_1,demap_tstamp,8'hff);
        junk = $sim_send(`PLI_SSTEP, demap_tnum_1);

        // sstep_sent is asserted when data_in is asserted
        // Check to see if sstep was sent early
        if (`NASTOP.sstep_sent[demap_tnum_1]==1) begin // {
          `NASTOP.sstep_early[demap_tnum_1] <= 1'b1;  // SSTEP was sent before nas_pipe capture
        end //}

    end //}
  end //}

  //--------------------
  if (`PARGS.show_tlb_on & (|demap_1)) begin // {
    $write ("SHOW_TLB: DTLB_DEMAP C%0d T%0d ",mycid,demap_tid_1);

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
      $write ("type=autodemap ");
    end

    $display ("match=%h                ts=%0d",
                tlb_match,demap_tstamp*`TOP.core_period);

    for (cnt=0; cnt<=NUM_TLB; cnt=cnt+1) begin // {
      if (tlb_match[cnt]==1'b1)  begin // {
        $display ("SHOW_TLB: DTLB_DEMAP C%0d T%0d entry=%h V=0                                                   ts=%0d",
                   mycid,demap_tid_1,cnt,demap_tstamp*`TOP.core_period);
      end // }
    end // }
    //--------------------
  end // }

  //----------------------------------------------------------
  //  Send I/DHWTW     due to HWTW
  //  Send I/DTLBWRITE due to ASI write

  // Save asi num when DTLBREAD happens.
  // Otherwise, hold state.
  // Send asi num later with DHWTW
  for (i=0;i<=7;i=i+1) begin // {
    my_asi[i] = (store_asi[i]) ? asi_num : my_asi[i];
  end // }

  // There are 3 main signals to watch for TLBWRITE (data_in, tlb_wr, wr_en)
  // These signals will be interleaved between the threads.
  // Need to queue up the signals over time so they can be processed in order.
  // Each thread will only be doing 1 thing at a time.

  for (i=0;i<=7;i=i+1) begin // {

    // tlb_wr[tid] determines if the write is HWTW or TLBWRITE

    // data_in[tid] determines which thread will write next
    // Use fifo to save the tids of the data_in signals in order

    if (data_in[i]) begin // {
      if (tlb_wr[i]) begin // {
        fifo.push_fifo ({1'b1,i[2:0]}); //  {hwtw,tid[2:0]}
      end // }
      else begin // {
        fifo.push_fifo ({1'b0,i[2:0]}); //  {!hwtw,tid[2:0]}

        // Signal to nas_pipe to suppress SSTEP as soon we know a tlb write or demap is coming (data_in=1)
        //   Cannot wait for wr_en because it is possible to miss an SSTEP.
        `PR_INFO ("pli_nas", `INFO, "   C%0d T%0d PLI_SSTEP     tid=%d ts=%0d                 (tlb_sync: suppress sstep. sstep_sent=1)",
                       mycid,i,((mycid * 6'h8) + i[2:0]),tstamp);
        `NASTOP.sstep_sent[(mycid * 6'h8) + i[2:0]] <= 1'b1;      // suppress SSTEP
      end // }
    end // }

  end // }

  //----------------------------------------------------------
  // wr_en means that the write is occurring
  if (wr_en) begin // {
    fifo.pop_fifo ({hwtw,mytid});
    mytnum = (mycid * 8) + mytid;

    if (hwtw) begin // { 
       if (`PARGS.nas_check_on && `PARGS.tlb_sync_on) begin // {
           `PR_INFO ("pli_tlb", `INFO, "   C%0d T%0d PLI_DHWTW     tid=%d ts=%0d va=%h asi=%h entry=%h",
                      mycid,mytid,mytnum,tstamp,tte_va,my_asi[mytid],entry);
           junk = $sim_send(`PLI_DHWTW, mytnum,tstamp,tte_va,my_asi[mytid],entry);

       end //}
    end // }
    else begin // {
      if (`PARGS.nas_check_on && `PARGS.tlb_sync_on) begin // {
            `PR_INFO ("pli_tlb", `INFO, "   C%0d T%0d PLI_DTLBWRITE tid=%d ts=%0d entry=%h",
                       mycid,mytid,mytnum,tstamp,entry);
            `PR_INFO ("pli_nas", `INFO, "   C%0d T%0d PLI_SSTEP     tid=%d ts=%0d                 (tlb_sync: send SSTEP)",
                       mycid,mytid,mytnum,tstamp);
            junk = $sim_send(`PLI_DTLBWRITE, mytnum,tstamp,entry);
            junk = $sim_send(`PLI_SSTEP, mytnum);

            // Check to see if sstep was sent early
            if (`NASTOP.sstep_sent[mytnum]==1) begin // {
              `NASTOP.sstep_early[mytnum] <= 1'b1;  // SSTEP was sent before nas_pipe capture
            end //}

      end //}
    end // }

    //--------------------
    if (`PARGS.show_tlb_on) begin // {
      $write ("SHOW_TLB: DTLB_WRITE C%0d T%0d ",mycid,mytid);

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

      $write ("SHOW_TLB: DTLB_WRITE C%0d T%0d ",mycid,mytid);

      $display ("             PA=00%h P=%b IE=%b CP=%b NFO=%b E=%b EP=X W=%b  ts=%0d",
                  tte_pa,tte_p,tte_ie,tte_cp,tte_nfo,tte_e,tte_w,tstamp*`TOP.core_period); 
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
