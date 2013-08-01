// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: axis_tlb_mon.v
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

module itlb_wr_c0 (dbg_in);
`ifndef GATESIM

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
input 			dbg_in;

reg         [(`TS_WIDTH-1):0] tstamp;
reg                     [7:0] data_in_ready;
reg                           hwtw;
reg         [(`TS_WIDTH-1):0] demap_tstamp;
reg 			dbg_en;

reg                     [2:0] mytid;
reg                     [5:0] mytnum;
wire                    [2:0] mycid;
integer                       junk;
integer                       i;
reg                     [7:0] cnt;

assign   mycid = 0;

//----------------------------------------------------------
// Instantiate fifo - 1 entry per thread
//fifo fifo ();
// Define fifo parameters
`ifndef PALLADIUM
defparam fifo.ENTRY_BITS = 4;  // {hwtw,tid[2:0]}
defparam fifo.DEPTH      = 9;  // 1 extra entry for overflow detection
defparam fifo.PTR_BITS   = 4;
`endif

//----------------------------------------------------------
// DUT probes

assign   data_in = `SPC0.mmu.asi.htc_wr_itlb_data_in;
assign   wr_en = `SPC0.ifu_ftu.ftu_itb_cust.tlb_wr_1_in_dout;

assign    entry = `SPC0.ifu_ftu.ftu_itb_cust.rw_index_1[5:0];

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
wire [7:0] itlb_wr = {(`SPC0.tlu.trl1.take_itw & `SPC0.tlu.trl1.trap[3]),
                      (`SPC0.tlu.trl1.take_itw & `SPC0.tlu.trl1.trap[2]),
                      (`SPC0.tlu.trl1.take_itw & `SPC0.tlu.trl1.trap[1]),
                      (`SPC0.tlu.trl1.take_itw & `SPC0.tlu.trl1.trap[0]),
                      (`SPC0.tlu.trl0.take_itw & `SPC0.tlu.trl0.trap[3]),
                      (`SPC0.tlu.trl0.take_itw & `SPC0.tlu.trl0.trap[2]),
                      (`SPC0.tlu.trl0.take_itw & `SPC0.tlu.trl0.trap[1]),
                      (`SPC0.tlu.trl0.take_itw & `SPC0.tlu.trl0.trap[0])
                     };

 assign   tlb_wr = itlb_wr;

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

//----------------------------------------------------------
initial  begin // {
`ifndef PALLADIUM
  #1;
`endif
  hwtw = 1'b0;
  data_in_ready = 8'b0;  
end // }

//----------------------------------------------------------
// Must use negedge to avoid race condition
// tlb_replacement_index (aka entry) is created in always block using blocking assignments

always @ (negedge `CPU.l2clk) begin // {

  tstamp = `TOP.cycle;
  demap_tstamp = `TOP.cycle;

  // Delay by 1 cycle to align with skip_demap
  demap_tid_1  <= demap_tid;  // demap_tid is active when demap is asserted
  demap_tnum_1 <= (mycid * 8) + demap_tid;
  demap_1      <= demap;


  //----------------------------------------------------------
  //  Send I/DTLBWRITE due to demap
  //

  if ((demap!=0) && (demap_1!=0)) begin // {
    $display("tlb_sync", `ERROR,
       "C%0d T%0d Illegal Back to Back ITLB demap",
        mycid,demap_tid_1);
  end // }

  //if (demap_active) begin // {
   // fifo.pop_fifo ({hwtw,mytid});
  //end
  //--------------------
  if (dbg_in & (|demap_1)) begin // {
    begin // axis tbcall_region
    $write ("SHOW_TLB: ITLB_DEMAP C%0d T%0d ",mycid,demap_tid_1);
    end

    if (demap_active) begin
    begin // axis tbcall_region
      case (demap_1)
      4'b0001:  $write ("type=real ");
      4'b0010:  $write ("type=cntx ");
      4'b0100:  $write ("type=page ");
      4'b1000:  $write ("type=all  ");
      default:
          $display ("tlb_sync", `ERROR,
            "Bench Problem - demap_1() should be one-hot.");
         //   "Bench Problem - demap_1(%b) should be one-hot.",demap_1);
      endcase
    end
    end
    else begin
    begin // axis tbcall_region
     $write("type=autodemap ");
    end
    end

    begin // axis tbcall_region
    $display ("match=%h                               ts=%0d",
                tlb_match,demap_tstamp*`TOP.core_period);
    end
    for (cnt=0; cnt<=NUM_TLB; cnt=cnt+1) begin // {
      if (tlb_match[cnt]==1'b1)  begin // {
    begin // axis tbcall_region
        $display ("SHOW_TLB: ITLB_DEMAP C%0d T%0d entry=%h V=0 ts=%0d",
                    mycid,demap_tid_1,cnt,demap_tstamp*`TOP.core_period);
    end
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
          $display ("tlb_sync", `ERROR,
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
	    hwtw <= 1'b1;
	    mytid[2:0] <= i[2:0];
            //fifo.push_fifo ({1'b1,i[2:0]}); //  {hwtw,tid[2:0]}
            data_in_ready[i] <= 1'b0;
          end // }
          else begin // {
	    hwtw <= 1'b0;
            //fifo.push_fifo ({1'b0,i[2:0]}); //  {!hwtw,tid[2:0]}
	    mytid[2:0] <= i[2:0];
          end // }
        end // }

      end // if}
    end // for}

  end // if}

  //----------------------------------------------------------
  // wr_en means that the write is occurring
  if (wr_en) begin // {
    //fifo.pop_fifo ({hwtw,mytid});
    mytnum = (mycid * 8) + mytid;

    //--------------------
    if (dbg_in) begin // {
    begin // axis tbcall_region
      $write ("SHOW_TLB: ITLB_WRITE C%0d T%0d ",mycid,mytid);
    end

    begin // axis tbcall_region
      if (tte_real==0) $write ("entry=%h V=%b VA=%h ",entry,tte_valid,tte_va);
      else             $write ("entry=%h V=%b RA=%h ",entry,tte_valid,tte_va);
    end

    begin // axis tbcall_region
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
    end
    end // }
    //--------------------

  end // }

end // always}

`endif
//----------------------------------------------------------
endmodule

module dtlb_wr_c0 (dbg_in);
`ifndef GATESIM

parameter NUM_TLB=128;

wire                    [7:0] data_in;
wire                    [7:0] tlb_wr;
wire                          wr_en;
wire                    [7:0] entry;
wire                    [7:0] asi_num;
wire                          asi_enable0;  // 1 per thread group
wire                          asi_enable1;
// wire                    [7:0] store_asi;  // 1 per thread
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
input			dbg_in;

reg         [(`TS_WIDTH-1):0] tstamp;
reg                           hwtw;
// reg                     [7:0] my_asi [0:7];  // 1 asi number stored per thread
reg         [(`TS_WIDTH-1):0] demap_tstamp;

reg                     [2:0] mytid;
reg                     [5:0] mytnum;
wire                    [2:0] mycid;
integer                       junk;
integer                       i;
reg                     [7:0] cnt;

assign   mycid = 0;

//----------------------------------------------------------
// Instantiate fifo - 1 entry per thread
//fifo fifo ();
// Define fifo parameters
`ifndef PALLADIUM
defparam fifo.ENTRY_BITS = 4;  // {hwtw,tid[2:0]}
defparam fifo.DEPTH      = 9;  // 1 extra entry for overflow detection
defparam fifo.PTR_BITS   = 4;
`endif

//----------------------------------------------------------
// DUT probes

assign   data_in = `SPC0.mmu.asi.wrote_dtlb;
assign   tlb_wr = `SPC0.mmu_reload_done;
assign   wr_en = `SPC0.lsu.tlb.tlb_wr_1_in_dout;

assign   entry = `SPC0.lsu.tlb.rw_index_1[6:0];

// assign   asi_num = `PROBES0.asi_num;
// assign   asi_enable0 =  `PROBES0.tlb_rd_vld_b &
//                        !`PROBES0.tlb_bypass_b &
//                        `SPC0.tlu.fls0.lsu_inst_b;
//assign   asi_enable1 =  `PROBES0.tlb_rd_vld_b &
//                        !`PROBES0.tlb_bypass_b &
//                        `SPC0.tlu.fls1.lsu_inst_b;

// assign   store_asi[3:0] = asi_enable0 ? `PROBES0.select_pc_b[3:0] : 4'b0;
// assign   store_asi[7:4] = asi_enable1 ? `PROBES0.select_pc_b[7:4] : 4'b0;


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
assign  tte_ep           = 1'b1;  // Does not apply for DTLB

//----------------------------------------------------------
// Initialize state machine to idle state
initial  begin // {
`ifndef PALLADIUM
  #1;
`endif
  hwtw = 1'b0;
  //for (i=0; i<=7; i=i+1) begin
  // my_asi[i] = 8'b0;
  //end

end // }

//----------------------------------------------------------
// Must use negedge to avoid race condition
// tlb_entry_replace (aka entry) is created in always block using blocking assignments

always @ (negedge `CPU.l2clk) begin // {

  tstamp = `TOP.cycle;
  demap_tstamp = `TOP.cycle;

  // Delay by 1 cycle to align with skip_demap
  demap_tid_1  <= demap_tid;  // demap_tid is active when demap is asserted
  demap_tnum_1 <= (mycid * 8) + demap_tid;
  demap_1      <= demap;

  //----------------------------------------------------------
  //  Send I/DTLBWRITE due to demap
  //

  if ((demap!=0) && (demap_1!=0)) begin // {
    $display("tlb_sync", `ERROR,
       "C%0d T%0d Illegal Back to Back DTLB demap",
        mycid,demap_tid_1);
  end // }

  //if (demap_active) begin // {
   // fifo.pop_fifo ({hwtw,mytid});
  //end //}

  //--------------------
  if (dbg_in & (|demap_1)) begin // {
    begin // axis tbcall_region
      $write ("SHOW_TLB: DTLB_DEMAP C%0d T%0d ",mycid,demap_tid_1);
    end

    if (demap_active) begin
    begin // axis tbcall_region
      case (demap_1)
      4'b0001:  $write ("type=real ");
      4'b0010:  $write ("type=cntx ");
      4'b0100:  $write ("type=page ");
      4'b1000:  $write ("type=all  ");
      default:
          $display ("tlb_sync", `ERROR,
            "Bench Problem - demap_1 should be one-hot.");
       //     "Bench Problem - demap_1(%b) should be one-hot.",demap_1);
      endcase
    end
    end
    else begin
    begin // axis tbcall_region
      $write ("type=autodemap ");
    end
    end

    begin // axis tbcall_region
    $display ("match=%h                ts=%0d",
                tlb_match,demap_tstamp*`TOP.core_period);
    end

    for (cnt=0; cnt<=NUM_TLB; cnt=cnt+1) begin // {
      if (tlb_match[cnt]==1'b1)  begin // {
    begin // axis tbcall_region
        $display ("SHOW_TLB: DTLB_DEMAP C%0d T%0d entry=%h V=0 ts=%0d",
                   mycid,demap_tid_1,cnt,demap_tstamp*`TOP.core_period);
    end
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
 // for (i=0;i<=7;i=i+1) begin // {
 //   my_asi[i] = (store_asi[i]) ? asi_num : my_asi[i];
 // end // }

  // There are 3 main signals to watch for TLBWRITE (data_in, tlb_wr, wr_en)
  // These signals will be interleaved between the threads.
  // Need to queue up the signals over time so they can be processed in order.
  // Each thread will only be doing 1 thing at a time.

  for (i=0;i<=7;i=i+1) begin // {

    // tlb_wr[tid] determines if the write is HWTW or TLBWRITE

    // data_in[tid] determines which thread will write next
    // Use fifo to save the tids of the data_in signals in order

    if (data_in[i]) begin // {
      mytid[2:0] <= i[2:0];
      if (tlb_wr[i]) begin // {
	hwtw <= 1'b1;
        //fifo.push_fifo ({1'b1,i[2:0]}); //  {hwtw,tid[2:0]}
      end // }
      else begin // {
	hwtw <= 1'b0;
        //fifo.push_fifo ({1'b0,i[2:0]}); //  {!hwtw,tid[2:0]}
      end // }
    end // }

  end // }

  //----------------------------------------------------------
  // wr_en means that the write is occurring
  if (wr_en) begin // {
    //fifo.pop_fifo ({hwtw,mytid});
    mytnum = (mycid * 8) + mytid;

    //--------------------
    if (dbg_in) begin // {
    begin // axis tbcall_region
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
  end // }

end // always}

//----------------------------------------------------------
`endif

endmodule
`endif

//----------------------------------------------------------
//----------------------------------------------------------


`ifdef CORE_1

module itlb_wr_c1 (dbg_in);
`ifndef GATESIM

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
input 			dbg_in;

reg         [(`TS_WIDTH-1):0] tstamp;
reg                     [7:0] data_in_ready;
reg                           hwtw;
reg         [(`TS_WIDTH-1):0] demap_tstamp;
reg 			dbg_en;

reg                     [2:0] mytid;
reg                     [5:0] mytnum;
wire                    [2:0] mycid;
integer                       junk;
integer                       i;
reg                     [7:0] cnt;

assign   mycid = 1;

//----------------------------------------------------------
// Instantiate fifo - 1 entry per thread
//fifo fifo ();
// Define fifo parameters
`ifndef PALLADIUM
defparam fifo.ENTRY_BITS = 4;  // {hwtw,tid[2:0]}
defparam fifo.DEPTH      = 9;  // 1 extra entry for overflow detection
defparam fifo.PTR_BITS   = 4;
`endif

//----------------------------------------------------------
// DUT probes

assign   data_in = `SPC1.mmu.asi.htc_wr_itlb_data_in;
assign   wr_en = `SPC1.ifu_ftu.ftu_itb_cust.tlb_wr_1_in_dout;

assign    entry = `SPC1.ifu_ftu.ftu_itb_cust.rw_index_1[5:0];

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
wire [7:0] itlb_wr = {(`SPC1.tlu.trl1.take_itw & `SPC1.tlu.trl1.trap[3]),
                      (`SPC1.tlu.trl1.take_itw & `SPC1.tlu.trl1.trap[2]),
                      (`SPC1.tlu.trl1.take_itw & `SPC1.tlu.trl1.trap[1]),
                      (`SPC1.tlu.trl1.take_itw & `SPC1.tlu.trl1.trap[0]),
                      (`SPC1.tlu.trl0.take_itw & `SPC1.tlu.trl0.trap[3]),
                      (`SPC1.tlu.trl0.take_itw & `SPC1.tlu.trl0.trap[2]),
                      (`SPC1.tlu.trl0.take_itw & `SPC1.tlu.trl0.trap[1]),
                      (`SPC1.tlu.trl0.take_itw & `SPC1.tlu.trl0.trap[0])
                     };

 assign   tlb_wr = itlb_wr;

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

//----------------------------------------------------------
initial  begin // {
`ifndef PALLADIUM
  #1;
`endif
  hwtw = 1'b0;
  data_in_ready = 8'b0;  
end // }

//----------------------------------------------------------
// Must use negedge to avoid race condition
// tlb_replacement_index (aka entry) is created in always block using blocking assignments

always @ (negedge `CPU.l2clk) begin // {

  tstamp = `TOP.cycle;
  demap_tstamp = `TOP.cycle;

  // Delay by 1 cycle to align with skip_demap
  demap_tid_1  <= demap_tid;  // demap_tid is active when demap is asserted
  demap_tnum_1 <= (mycid * 8) + demap_tid;
  demap_1      <= demap;


  //----------------------------------------------------------
  //  Send I/DTLBWRITE due to demap
  //

  if ((demap!=0) && (demap_1!=0)) begin // {
    $display("tlb_sync", `ERROR,
       "C%0d T%0d Illegal Back to Back ITLB demap",
        mycid,demap_tid_1);
  end // }

  //if (demap_active) begin // {
   // fifo.pop_fifo ({hwtw,mytid});
  //end
  //--------------------
  if (dbg_in & (|demap_1)) begin // {
    begin // axis tbcall_region
    $write ("SHOW_TLB: ITLB_DEMAP C%0d T%0d ",mycid,demap_tid_1);
    end

    if (demap_active) begin
    begin // axis tbcall_region
      case (demap_1)
      4'b0001:  $write ("type=real ");
      4'b0010:  $write ("type=cntx ");
      4'b0100:  $write ("type=page ");
      4'b1000:  $write ("type=all  ");
      default:
          $display ("tlb_sync", `ERROR,
            "Bench Problem - demap_1() should be one-hot.");
         //   "Bench Problem - demap_1(%b) should be one-hot.",demap_1);
      endcase
    end
    end
    else begin
    begin // axis tbcall_region
     $write("type=autodemap ");
    end
    end

    begin // axis tbcall_region
    $display ("match=%h                               ts=%0d",
                tlb_match,demap_tstamp*`TOP.core_period);
    end
    for (cnt=0; cnt<=NUM_TLB; cnt=cnt+1) begin // {
      if (tlb_match[cnt]==1'b1)  begin // {
    begin // axis tbcall_region
        $display ("SHOW_TLB: ITLB_DEMAP C%0d T%0d entry=%h V=0 ts=%0d",
                    mycid,demap_tid_1,cnt,demap_tstamp*`TOP.core_period);
    end
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
          $display ("tlb_sync", `ERROR,
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
	    hwtw <= 1'b1;
	    mytid[2:0] <= i[2:0];
            //fifo.push_fifo ({1'b1,i[2:0]}); //  {hwtw,tid[2:0]}
            data_in_ready[i] <= 1'b0;
          end // }
          else begin // {
	    hwtw <= 1'b0;
            //fifo.push_fifo ({1'b0,i[2:0]}); //  {!hwtw,tid[2:0]}
	    mytid[2:0] <= i[2:0];
          end // }
        end // }

      end // if}
    end // for}

  end // if}

  //----------------------------------------------------------
  // wr_en means that the write is occurring
  if (wr_en) begin // {
    //fifo.pop_fifo ({hwtw,mytid});
    mytnum = (mycid * 8) + mytid;

    //--------------------
    if (dbg_in) begin // {
    begin // axis tbcall_region
      $write ("SHOW_TLB: ITLB_WRITE C%0d T%0d ",mycid,mytid);
    end

    begin // axis tbcall_region
      if (tte_real==0) $write ("entry=%h V=%b VA=%h ",entry,tte_valid,tte_va);
      else             $write ("entry=%h V=%b RA=%h ",entry,tte_valid,tte_va);
    end

    begin // axis tbcall_region
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
    end
    end // }
    //--------------------

  end // }

end // always}

`endif
//----------------------------------------------------------
endmodule

module dtlb_wr_c1 (dbg_in);
`ifndef GATESIM

parameter NUM_TLB=128;

wire                    [7:0] data_in;
wire                    [7:0] tlb_wr;
wire                          wr_en;
wire                    [7:0] entry;
wire                    [7:0] asi_num;
wire                          asi_enable0;  // 1 per thread group
wire                          asi_enable1;
// wire                    [7:0] store_asi;  // 1 per thread
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
input			dbg_in;

reg         [(`TS_WIDTH-1):0] tstamp;
reg                           hwtw;
// reg                     [7:0] my_asi [0:7];  // 1 asi number stored per thread
reg         [(`TS_WIDTH-1):0] demap_tstamp;

reg                     [2:0] mytid;
reg                     [5:0] mytnum;
wire                    [2:0] mycid;
integer                       junk;
integer                       i;
reg                     [7:0] cnt;

assign   mycid = 1;

//----------------------------------------------------------
// Instantiate fifo - 1 entry per thread
//fifo fifo ();
// Define fifo parameters
`ifndef PALLADIUM
defparam fifo.ENTRY_BITS = 4;  // {hwtw,tid[2:0]}
defparam fifo.DEPTH      = 9;  // 1 extra entry for overflow detection
defparam fifo.PTR_BITS   = 4;
`endif

//----------------------------------------------------------
// DUT probes

assign   data_in = `SPC1.mmu.asi.wrote_dtlb;
assign   tlb_wr = `SPC1.mmu_reload_done;
assign   wr_en = `SPC1.lsu.tlb.tlb_wr_1_in_dout;

assign   entry = `SPC1.lsu.tlb.rw_index_1[6:0];

// assign   asi_num = `PROBES0.asi_num;
// assign   asi_enable0 =  `PROBES0.tlb_rd_vld_b &
//                        !`PROBES0.tlb_bypass_b &
//                        `SPC0.tlu.fls0.lsu_inst_b;
//assign   asi_enable1 =  `PROBES0.tlb_rd_vld_b &
//                        !`PROBES0.tlb_bypass_b &
//                        `SPC0.tlu.fls1.lsu_inst_b;

// assign   store_asi[3:0] = asi_enable0 ? `PROBES0.select_pc_b[3:0] : 4'b0;
// assign   store_asi[7:4] = asi_enable1 ? `PROBES0.select_pc_b[7:4] : 4'b0;


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
assign  tte_ep           = 1'b1;  // Does not apply for DTLB

//----------------------------------------------------------
// Initialize state machine to idle state
initial  begin // {
`ifndef PALLADIUM
  #1;
`endif
  hwtw = 1'b0;
  //for (i=0; i<=7; i=i+1) begin
  // my_asi[i] = 8'b0;
  //end

end // }

//----------------------------------------------------------
// Must use negedge to avoid race condition
// tlb_entry_replace (aka entry) is created in always block using blocking assignments

always @ (negedge `CPU.l2clk) begin // {

  tstamp = `TOP.cycle;
  demap_tstamp = `TOP.cycle;

  // Delay by 1 cycle to align with skip_demap
  demap_tid_1  <= demap_tid;  // demap_tid is active when demap is asserted
  demap_tnum_1 <= (mycid * 8) + demap_tid;
  demap_1      <= demap;

  //----------------------------------------------------------
  //  Send I/DTLBWRITE due to demap
  //

  if ((demap!=0) && (demap_1!=0)) begin // {
    $display("tlb_sync", `ERROR,
       "C%0d T%0d Illegal Back to Back DTLB demap",
        mycid,demap_tid_1);
  end // }

  //if (demap_active) begin // {
   // fifo.pop_fifo ({hwtw,mytid});
  //end //}

  //--------------------
  if (dbg_in & (|demap_1)) begin // {
    begin // axis tbcall_region
      $write ("SHOW_TLB: DTLB_DEMAP C%0d T%0d ",mycid,demap_tid_1);
    end

    if (demap_active) begin
    begin // axis tbcall_region
      case (demap_1)
      4'b0001:  $write ("type=real ");
      4'b0010:  $write ("type=cntx ");
      4'b0100:  $write ("type=page ");
      4'b1000:  $write ("type=all  ");
      default:
          $display ("tlb_sync", `ERROR,
            "Bench Problem - demap_1 should be one-hot.");
       //     "Bench Problem - demap_1(%b) should be one-hot.",demap_1);
      endcase
    end
    end
    else begin
    begin // axis tbcall_region
      $write ("type=autodemap ");
    end
    end

    begin // axis tbcall_region
    $display ("match=%h                ts=%0d",
                tlb_match,demap_tstamp*`TOP.core_period);
    end

    for (cnt=0; cnt<=NUM_TLB; cnt=cnt+1) begin // {
      if (tlb_match[cnt]==1'b1)  begin // {
    begin // axis tbcall_region
        $display ("SHOW_TLB: DTLB_DEMAP C%0d T%0d entry=%h V=0 ts=%0d",
                   mycid,demap_tid_1,cnt,demap_tstamp*`TOP.core_period);
    end
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
 // for (i=0;i<=7;i=i+1) begin // {
 //   my_asi[i] = (store_asi[i]) ? asi_num : my_asi[i];
 // end // }

  // There are 3 main signals to watch for TLBWRITE (data_in, tlb_wr, wr_en)
  // These signals will be interleaved between the threads.
  // Need to queue up the signals over time so they can be processed in order.
  // Each thread will only be doing 1 thing at a time.

  for (i=0;i<=7;i=i+1) begin // {

    // tlb_wr[tid] determines if the write is HWTW or TLBWRITE

    // data_in[tid] determines which thread will write next
    // Use fifo to save the tids of the data_in signals in order

    if (data_in[i]) begin // {
      mytid[2:0] <= i[2:0];
      if (tlb_wr[i]) begin // {
	hwtw <= 1'b1;
        //fifo.push_fifo ({1'b1,i[2:0]}); //  {hwtw,tid[2:0]}
      end // }
      else begin // {
	hwtw <= 1'b0;
        //fifo.push_fifo ({1'b0,i[2:0]}); //  {!hwtw,tid[2:0]}
      end // }
    end // }

  end // }

  //----------------------------------------------------------
  // wr_en means that the write is occurring
  if (wr_en) begin // {
    //fifo.pop_fifo ({hwtw,mytid});
    mytnum = (mycid * 8) + mytid;

    //--------------------
    if (dbg_in) begin // {
    begin // axis tbcall_region
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
  end // }

end // always}

//----------------------------------------------------------
`endif

endmodule
`endif

//----------------------------------------------------------
//----------------------------------------------------------


`ifdef CORE_2

module itlb_wr_c2 (dbg_in);
`ifndef GATESIM

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
input 			dbg_in;

reg         [(`TS_WIDTH-1):0] tstamp;
reg                     [7:0] data_in_ready;
reg                           hwtw;
reg         [(`TS_WIDTH-1):0] demap_tstamp;
reg 			dbg_en;

reg                     [2:0] mytid;
reg                     [5:0] mytnum;
wire                    [2:0] mycid;
integer                       junk;
integer                       i;
reg                     [7:0] cnt;

assign   mycid = 2;

//----------------------------------------------------------
// Instantiate fifo - 1 entry per thread
//fifo fifo ();
// Define fifo parameters
`ifndef PALLADIUM
defparam fifo.ENTRY_BITS = 4;  // {hwtw,tid[2:0]}
defparam fifo.DEPTH      = 9;  // 1 extra entry for overflow detection
defparam fifo.PTR_BITS   = 4;
`endif

//----------------------------------------------------------
// DUT probes

assign   data_in = `SPC2.mmu.asi.htc_wr_itlb_data_in;
assign   wr_en = `SPC2.ifu_ftu.ftu_itb_cust.tlb_wr_1_in_dout;

assign    entry = `SPC2.ifu_ftu.ftu_itb_cust.rw_index_1[5:0];

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
wire [7:0] itlb_wr = {(`SPC2.tlu.trl1.take_itw & `SPC2.tlu.trl1.trap[3]),
                      (`SPC2.tlu.trl1.take_itw & `SPC2.tlu.trl1.trap[2]),
                      (`SPC2.tlu.trl1.take_itw & `SPC2.tlu.trl1.trap[1]),
                      (`SPC2.tlu.trl1.take_itw & `SPC2.tlu.trl1.trap[0]),
                      (`SPC2.tlu.trl0.take_itw & `SPC2.tlu.trl0.trap[3]),
                      (`SPC2.tlu.trl0.take_itw & `SPC2.tlu.trl0.trap[2]),
                      (`SPC2.tlu.trl0.take_itw & `SPC2.tlu.trl0.trap[1]),
                      (`SPC2.tlu.trl0.take_itw & `SPC2.tlu.trl0.trap[0])
                     };

 assign   tlb_wr = itlb_wr;

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

//----------------------------------------------------------
initial  begin // {
`ifndef PALLADIUM
  #1;
`endif
  hwtw = 1'b0;
  data_in_ready = 8'b0;  
end // }

//----------------------------------------------------------
// Must use negedge to avoid race condition
// tlb_replacement_index (aka entry) is created in always block using blocking assignments

always @ (negedge `CPU.l2clk) begin // {

  tstamp = `TOP.cycle;
  demap_tstamp = `TOP.cycle;

  // Delay by 1 cycle to align with skip_demap
  demap_tid_1  <= demap_tid;  // demap_tid is active when demap is asserted
  demap_tnum_1 <= (mycid * 8) + demap_tid;
  demap_1      <= demap;


  //----------------------------------------------------------
  //  Send I/DTLBWRITE due to demap
  //

  if ((demap!=0) && (demap_1!=0)) begin // {
    $display("tlb_sync", `ERROR,
       "C%0d T%0d Illegal Back to Back ITLB demap",
        mycid,demap_tid_1);
  end // }

  //if (demap_active) begin // {
   // fifo.pop_fifo ({hwtw,mytid});
  //end
  //--------------------
  if (dbg_in & (|demap_1)) begin // {
    begin // axis tbcall_region
    $write ("SHOW_TLB: ITLB_DEMAP C%0d T%0d ",mycid,demap_tid_1);
    end

    if (demap_active) begin
    begin // axis tbcall_region
      case (demap_1)
      4'b0001:  $write ("type=real ");
      4'b0010:  $write ("type=cntx ");
      4'b0100:  $write ("type=page ");
      4'b1000:  $write ("type=all  ");
      default:
          $display ("tlb_sync", `ERROR,
            "Bench Problem - demap_1() should be one-hot.");
         //   "Bench Problem - demap_1(%b) should be one-hot.",demap_1);
      endcase
    end
    end
    else begin
    begin // axis tbcall_region
     $write("type=autodemap ");
    end
    end

    begin // axis tbcall_region
    $display ("match=%h                               ts=%0d",
                tlb_match,demap_tstamp*`TOP.core_period);
    end
    for (cnt=0; cnt<=NUM_TLB; cnt=cnt+1) begin // {
      if (tlb_match[cnt]==1'b1)  begin // {
    begin // axis tbcall_region
        $display ("SHOW_TLB: ITLB_DEMAP C%0d T%0d entry=%h V=0 ts=%0d",
                    mycid,demap_tid_1,cnt,demap_tstamp*`TOP.core_period);
    end
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
          $display ("tlb_sync", `ERROR,
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
	    hwtw <= 1'b1;
	    mytid[2:0] <= i[2:0];
            //fifo.push_fifo ({1'b1,i[2:0]}); //  {hwtw,tid[2:0]}
            data_in_ready[i] <= 1'b0;
          end // }
          else begin // {
	    hwtw <= 1'b0;
            //fifo.push_fifo ({1'b0,i[2:0]}); //  {!hwtw,tid[2:0]}
	    mytid[2:0] <= i[2:0];
          end // }
        end // }

      end // if}
    end // for}

  end // if}

  //----------------------------------------------------------
  // wr_en means that the write is occurring
  if (wr_en) begin // {
    //fifo.pop_fifo ({hwtw,mytid});
    mytnum = (mycid * 8) + mytid;

    //--------------------
    if (dbg_in) begin // {
    begin // axis tbcall_region
      $write ("SHOW_TLB: ITLB_WRITE C%0d T%0d ",mycid,mytid);
    end

    begin // axis tbcall_region
      if (tte_real==0) $write ("entry=%h V=%b VA=%h ",entry,tte_valid,tte_va);
      else             $write ("entry=%h V=%b RA=%h ",entry,tte_valid,tte_va);
    end

    begin // axis tbcall_region
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
    end
    end // }
    //--------------------

  end // }

end // always}

`endif
//----------------------------------------------------------
endmodule

module dtlb_wr_c2 (dbg_in);
`ifndef GATESIM

parameter NUM_TLB=128;

wire                    [7:0] data_in;
wire                    [7:0] tlb_wr;
wire                          wr_en;
wire                    [7:0] entry;
wire                    [7:0] asi_num;
wire                          asi_enable0;  // 1 per thread group
wire                          asi_enable1;
// wire                    [7:0] store_asi;  // 1 per thread
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
input			dbg_in;

reg         [(`TS_WIDTH-1):0] tstamp;
reg                           hwtw;
// reg                     [7:0] my_asi [0:7];  // 1 asi number stored per thread
reg         [(`TS_WIDTH-1):0] demap_tstamp;

reg                     [2:0] mytid;
reg                     [5:0] mytnum;
wire                    [2:0] mycid;
integer                       junk;
integer                       i;
reg                     [7:0] cnt;

assign   mycid = 2;

//----------------------------------------------------------
// Instantiate fifo - 1 entry per thread
//fifo fifo ();
// Define fifo parameters
`ifndef PALLADIUM
defparam fifo.ENTRY_BITS = 4;  // {hwtw,tid[2:0]}
defparam fifo.DEPTH      = 9;  // 1 extra entry for overflow detection
defparam fifo.PTR_BITS   = 4;
`endif

//----------------------------------------------------------
// DUT probes

assign   data_in = `SPC2.mmu.asi.wrote_dtlb;
assign   tlb_wr = `SPC2.mmu_reload_done;
assign   wr_en = `SPC2.lsu.tlb.tlb_wr_1_in_dout;

assign   entry = `SPC2.lsu.tlb.rw_index_1[6:0];

// assign   asi_num = `PROBES0.asi_num;
// assign   asi_enable0 =  `PROBES0.tlb_rd_vld_b &
//                        !`PROBES0.tlb_bypass_b &
//                        `SPC0.tlu.fls0.lsu_inst_b;
//assign   asi_enable1 =  `PROBES0.tlb_rd_vld_b &
//                        !`PROBES0.tlb_bypass_b &
//                        `SPC0.tlu.fls1.lsu_inst_b;

// assign   store_asi[3:0] = asi_enable0 ? `PROBES0.select_pc_b[3:0] : 4'b0;
// assign   store_asi[7:4] = asi_enable1 ? `PROBES0.select_pc_b[7:4] : 4'b0;


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
assign  tte_ep           = 1'b1;  // Does not apply for DTLB

//----------------------------------------------------------
// Initialize state machine to idle state
initial  begin // {
`ifndef PALLADIUM
  #1;
`endif
  hwtw = 1'b0;
  //for (i=0; i<=7; i=i+1) begin
  // my_asi[i] = 8'b0;
  //end

end // }

//----------------------------------------------------------
// Must use negedge to avoid race condition
// tlb_entry_replace (aka entry) is created in always block using blocking assignments

always @ (negedge `CPU.l2clk) begin // {

  tstamp = `TOP.cycle;
  demap_tstamp = `TOP.cycle;

  // Delay by 1 cycle to align with skip_demap
  demap_tid_1  <= demap_tid;  // demap_tid is active when demap is asserted
  demap_tnum_1 <= (mycid * 8) + demap_tid;
  demap_1      <= demap;

  //----------------------------------------------------------
  //  Send I/DTLBWRITE due to demap
  //

  if ((demap!=0) && (demap_1!=0)) begin // {
    $display("tlb_sync", `ERROR,
       "C%0d T%0d Illegal Back to Back DTLB demap",
        mycid,demap_tid_1);
  end // }

  //if (demap_active) begin // {
   // fifo.pop_fifo ({hwtw,mytid});
  //end //}

  //--------------------
  if (dbg_in & (|demap_1)) begin // {
    begin // axis tbcall_region
      $write ("SHOW_TLB: DTLB_DEMAP C%0d T%0d ",mycid,demap_tid_1);
    end

    if (demap_active) begin
    begin // axis tbcall_region
      case (demap_1)
      4'b0001:  $write ("type=real ");
      4'b0010:  $write ("type=cntx ");
      4'b0100:  $write ("type=page ");
      4'b1000:  $write ("type=all  ");
      default:
          $display ("tlb_sync", `ERROR,
            "Bench Problem - demap_1 should be one-hot.");
       //     "Bench Problem - demap_1(%b) should be one-hot.",demap_1);
      endcase
    end
    end
    else begin
    begin // axis tbcall_region
      $write ("type=autodemap ");
    end
    end

    begin // axis tbcall_region
    $display ("match=%h                ts=%0d",
                tlb_match,demap_tstamp*`TOP.core_period);
    end

    for (cnt=0; cnt<=NUM_TLB; cnt=cnt+1) begin // {
      if (tlb_match[cnt]==1'b1)  begin // {
    begin // axis tbcall_region
        $display ("SHOW_TLB: DTLB_DEMAP C%0d T%0d entry=%h V=0 ts=%0d",
                   mycid,demap_tid_1,cnt,demap_tstamp*`TOP.core_period);
    end
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
 // for (i=0;i<=7;i=i+1) begin // {
 //   my_asi[i] = (store_asi[i]) ? asi_num : my_asi[i];
 // end // }

  // There are 3 main signals to watch for TLBWRITE (data_in, tlb_wr, wr_en)
  // These signals will be interleaved between the threads.
  // Need to queue up the signals over time so they can be processed in order.
  // Each thread will only be doing 1 thing at a time.

  for (i=0;i<=7;i=i+1) begin // {

    // tlb_wr[tid] determines if the write is HWTW or TLBWRITE

    // data_in[tid] determines which thread will write next
    // Use fifo to save the tids of the data_in signals in order

    if (data_in[i]) begin // {
      mytid[2:0] <= i[2:0];
      if (tlb_wr[i]) begin // {
	hwtw <= 1'b1;
        //fifo.push_fifo ({1'b1,i[2:0]}); //  {hwtw,tid[2:0]}
      end // }
      else begin // {
	hwtw <= 1'b0;
        //fifo.push_fifo ({1'b0,i[2:0]}); //  {!hwtw,tid[2:0]}
      end // }
    end // }

  end // }

  //----------------------------------------------------------
  // wr_en means that the write is occurring
  if (wr_en) begin // {
    //fifo.pop_fifo ({hwtw,mytid});
    mytnum = (mycid * 8) + mytid;

    //--------------------
    if (dbg_in) begin // {
    begin // axis tbcall_region
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
  end // }

end // always}

//----------------------------------------------------------
`endif

endmodule
`endif

//----------------------------------------------------------
//----------------------------------------------------------


`ifdef CORE_3

module itlb_wr_c3 (dbg_in);
`ifndef GATESIM

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
input 			dbg_in;

reg         [(`TS_WIDTH-1):0] tstamp;
reg                     [7:0] data_in_ready;
reg                           hwtw;
reg         [(`TS_WIDTH-1):0] demap_tstamp;
reg 			dbg_en;

reg                     [2:0] mytid;
reg                     [5:0] mytnum;
wire                    [2:0] mycid;
integer                       junk;
integer                       i;
reg                     [7:0] cnt;

assign   mycid = 3;

//----------------------------------------------------------
// Instantiate fifo - 1 entry per thread
//fifo fifo ();
// Define fifo parameters
`ifndef PALLADIUM
defparam fifo.ENTRY_BITS = 4;  // {hwtw,tid[2:0]}
defparam fifo.DEPTH      = 9;  // 1 extra entry for overflow detection
defparam fifo.PTR_BITS   = 4;
`endif

//----------------------------------------------------------
// DUT probes

assign   data_in = `SPC3.mmu.asi.htc_wr_itlb_data_in;
assign   wr_en = `SPC3.ifu_ftu.ftu_itb_cust.tlb_wr_1_in_dout;

assign    entry = `SPC3.ifu_ftu.ftu_itb_cust.rw_index_1[5:0];

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
wire [7:0] itlb_wr = {(`SPC3.tlu.trl1.take_itw & `SPC3.tlu.trl1.trap[3]),
                      (`SPC3.tlu.trl1.take_itw & `SPC3.tlu.trl1.trap[2]),
                      (`SPC3.tlu.trl1.take_itw & `SPC3.tlu.trl1.trap[1]),
                      (`SPC3.tlu.trl1.take_itw & `SPC3.tlu.trl1.trap[0]),
                      (`SPC3.tlu.trl0.take_itw & `SPC3.tlu.trl0.trap[3]),
                      (`SPC3.tlu.trl0.take_itw & `SPC3.tlu.trl0.trap[2]),
                      (`SPC3.tlu.trl0.take_itw & `SPC3.tlu.trl0.trap[1]),
                      (`SPC3.tlu.trl0.take_itw & `SPC3.tlu.trl0.trap[0])
                     };

 assign   tlb_wr = itlb_wr;

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

//----------------------------------------------------------
initial  begin // {
`ifndef PALLADIUM
  #1;
`endif
  hwtw = 1'b0;
  data_in_ready = 8'b0;  
end // }

//----------------------------------------------------------
// Must use negedge to avoid race condition
// tlb_replacement_index (aka entry) is created in always block using blocking assignments

always @ (negedge `CPU.l2clk) begin // {

  tstamp = `TOP.cycle;
  demap_tstamp = `TOP.cycle;

  // Delay by 1 cycle to align with skip_demap
  demap_tid_1  <= demap_tid;  // demap_tid is active when demap is asserted
  demap_tnum_1 <= (mycid * 8) + demap_tid;
  demap_1      <= demap;


  //----------------------------------------------------------
  //  Send I/DTLBWRITE due to demap
  //

  if ((demap!=0) && (demap_1!=0)) begin // {
    $display("tlb_sync", `ERROR,
       "C%0d T%0d Illegal Back to Back ITLB demap",
        mycid,demap_tid_1);
  end // }

  //if (demap_active) begin // {
   // fifo.pop_fifo ({hwtw,mytid});
  //end
  //--------------------
  if (dbg_in & (|demap_1)) begin // {
    begin // axis tbcall_region
    $write ("SHOW_TLB: ITLB_DEMAP C%0d T%0d ",mycid,demap_tid_1);
    end

    if (demap_active) begin
    begin // axis tbcall_region
      case (demap_1)
      4'b0001:  $write ("type=real ");
      4'b0010:  $write ("type=cntx ");
      4'b0100:  $write ("type=page ");
      4'b1000:  $write ("type=all  ");
      default:
          $display ("tlb_sync", `ERROR,
            "Bench Problem - demap_1() should be one-hot.");
         //   "Bench Problem - demap_1(%b) should be one-hot.",demap_1);
      endcase
    end
    end
    else begin
    begin // axis tbcall_region
     $write("type=autodemap ");
    end
    end

    begin // axis tbcall_region
    $display ("match=%h                               ts=%0d",
                tlb_match,demap_tstamp*`TOP.core_period);
    end
    for (cnt=0; cnt<=NUM_TLB; cnt=cnt+1) begin // {
      if (tlb_match[cnt]==1'b1)  begin // {
    begin // axis tbcall_region
        $display ("SHOW_TLB: ITLB_DEMAP C%0d T%0d entry=%h V=0 ts=%0d",
                    mycid,demap_tid_1,cnt,demap_tstamp*`TOP.core_period);
    end
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
          $display ("tlb_sync", `ERROR,
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
	    hwtw <= 1'b1;
	    mytid[2:0] <= i[2:0];
            //fifo.push_fifo ({1'b1,i[2:0]}); //  {hwtw,tid[2:0]}
            data_in_ready[i] <= 1'b0;
          end // }
          else begin // {
	    hwtw <= 1'b0;
            //fifo.push_fifo ({1'b0,i[2:0]}); //  {!hwtw,tid[2:0]}
	    mytid[2:0] <= i[2:0];
          end // }
        end // }

      end // if}
    end // for}

  end // if}

  //----------------------------------------------------------
  // wr_en means that the write is occurring
  if (wr_en) begin // {
    //fifo.pop_fifo ({hwtw,mytid});
    mytnum = (mycid * 8) + mytid;

    //--------------------
    if (dbg_in) begin // {
    begin // axis tbcall_region
      $write ("SHOW_TLB: ITLB_WRITE C%0d T%0d ",mycid,mytid);
    end

    begin // axis tbcall_region
      if (tte_real==0) $write ("entry=%h V=%b VA=%h ",entry,tte_valid,tte_va);
      else             $write ("entry=%h V=%b RA=%h ",entry,tte_valid,tte_va);
    end

    begin // axis tbcall_region
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
    end
    end // }
    //--------------------

  end // }

end // always}

`endif
//----------------------------------------------------------
endmodule

module dtlb_wr_c3 (dbg_in);
`ifndef GATESIM

parameter NUM_TLB=128;

wire                    [7:0] data_in;
wire                    [7:0] tlb_wr;
wire                          wr_en;
wire                    [7:0] entry;
wire                    [7:0] asi_num;
wire                          asi_enable0;  // 1 per thread group
wire                          asi_enable1;
// wire                    [7:0] store_asi;  // 1 per thread
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
input			dbg_in;

reg         [(`TS_WIDTH-1):0] tstamp;
reg                           hwtw;
// reg                     [7:0] my_asi [0:7];  // 1 asi number stored per thread
reg         [(`TS_WIDTH-1):0] demap_tstamp;

reg                     [2:0] mytid;
reg                     [5:0] mytnum;
wire                    [2:0] mycid;
integer                       junk;
integer                       i;
reg                     [7:0] cnt;

assign   mycid = 3;

//----------------------------------------------------------
// Instantiate fifo - 1 entry per thread
//fifo fifo ();
// Define fifo parameters
`ifndef PALLADIUM
defparam fifo.ENTRY_BITS = 4;  // {hwtw,tid[2:0]}
defparam fifo.DEPTH      = 9;  // 1 extra entry for overflow detection
defparam fifo.PTR_BITS   = 4;
`endif

//----------------------------------------------------------
// DUT probes

assign   data_in = `SPC3.mmu.asi.wrote_dtlb;
assign   tlb_wr = `SPC3.mmu_reload_done;
assign   wr_en = `SPC3.lsu.tlb.tlb_wr_1_in_dout;

assign   entry = `SPC3.lsu.tlb.rw_index_1[6:0];

// assign   asi_num = `PROBES0.asi_num;
// assign   asi_enable0 =  `PROBES0.tlb_rd_vld_b &
//                        !`PROBES0.tlb_bypass_b &
//                        `SPC0.tlu.fls0.lsu_inst_b;
//assign   asi_enable1 =  `PROBES0.tlb_rd_vld_b &
//                        !`PROBES0.tlb_bypass_b &
//                        `SPC0.tlu.fls1.lsu_inst_b;

// assign   store_asi[3:0] = asi_enable0 ? `PROBES0.select_pc_b[3:0] : 4'b0;
// assign   store_asi[7:4] = asi_enable1 ? `PROBES0.select_pc_b[7:4] : 4'b0;


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
assign  tte_ep           = 1'b1;  // Does not apply for DTLB

//----------------------------------------------------------
// Initialize state machine to idle state
initial  begin // {
`ifndef PALLADIUM
  #1;
`endif
  hwtw = 1'b0;
  //for (i=0; i<=7; i=i+1) begin
  // my_asi[i] = 8'b0;
  //end

end // }

//----------------------------------------------------------
// Must use negedge to avoid race condition
// tlb_entry_replace (aka entry) is created in always block using blocking assignments

always @ (negedge `CPU.l2clk) begin // {

  tstamp = `TOP.cycle;
  demap_tstamp = `TOP.cycle;

  // Delay by 1 cycle to align with skip_demap
  demap_tid_1  <= demap_tid;  // demap_tid is active when demap is asserted
  demap_tnum_1 <= (mycid * 8) + demap_tid;
  demap_1      <= demap;

  //----------------------------------------------------------
  //  Send I/DTLBWRITE due to demap
  //

  if ((demap!=0) && (demap_1!=0)) begin // {
    $display("tlb_sync", `ERROR,
       "C%0d T%0d Illegal Back to Back DTLB demap",
        mycid,demap_tid_1);
  end // }

  //if (demap_active) begin // {
   // fifo.pop_fifo ({hwtw,mytid});
  //end //}

  //--------------------
  if (dbg_in & (|demap_1)) begin // {
    begin // axis tbcall_region
      $write ("SHOW_TLB: DTLB_DEMAP C%0d T%0d ",mycid,demap_tid_1);
    end

    if (demap_active) begin
    begin // axis tbcall_region
      case (demap_1)
      4'b0001:  $write ("type=real ");
      4'b0010:  $write ("type=cntx ");
      4'b0100:  $write ("type=page ");
      4'b1000:  $write ("type=all  ");
      default:
          $display ("tlb_sync", `ERROR,
            "Bench Problem - demap_1 should be one-hot.");
       //     "Bench Problem - demap_1(%b) should be one-hot.",demap_1);
      endcase
    end
    end
    else begin
    begin // axis tbcall_region
      $write ("type=autodemap ");
    end
    end

    begin // axis tbcall_region
    $display ("match=%h                ts=%0d",
                tlb_match,demap_tstamp*`TOP.core_period);
    end

    for (cnt=0; cnt<=NUM_TLB; cnt=cnt+1) begin // {
      if (tlb_match[cnt]==1'b1)  begin // {
    begin // axis tbcall_region
        $display ("SHOW_TLB: DTLB_DEMAP C%0d T%0d entry=%h V=0 ts=%0d",
                   mycid,demap_tid_1,cnt,demap_tstamp*`TOP.core_period);
    end
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
 // for (i=0;i<=7;i=i+1) begin // {
 //   my_asi[i] = (store_asi[i]) ? asi_num : my_asi[i];
 // end // }

  // There are 3 main signals to watch for TLBWRITE (data_in, tlb_wr, wr_en)
  // These signals will be interleaved between the threads.
  // Need to queue up the signals over time so they can be processed in order.
  // Each thread will only be doing 1 thing at a time.

  for (i=0;i<=7;i=i+1) begin // {

    // tlb_wr[tid] determines if the write is HWTW or TLBWRITE

    // data_in[tid] determines which thread will write next
    // Use fifo to save the tids of the data_in signals in order

    if (data_in[i]) begin // {
      mytid[2:0] <= i[2:0];
      if (tlb_wr[i]) begin // {
	hwtw <= 1'b1;
        //fifo.push_fifo ({1'b1,i[2:0]}); //  {hwtw,tid[2:0]}
      end // }
      else begin // {
	hwtw <= 1'b0;
        //fifo.push_fifo ({1'b0,i[2:0]}); //  {!hwtw,tid[2:0]}
      end // }
    end // }

  end // }

  //----------------------------------------------------------
  // wr_en means that the write is occurring
  if (wr_en) begin // {
    //fifo.pop_fifo ({hwtw,mytid});
    mytnum = (mycid * 8) + mytid;

    //--------------------
    if (dbg_in) begin // {
    begin // axis tbcall_region
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
  end // }

end // always}

//----------------------------------------------------------
`endif

endmodule
`endif

//----------------------------------------------------------
//----------------------------------------------------------


`ifdef CORE_4

module itlb_wr_c4 (dbg_in);
`ifndef GATESIM

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
input 			dbg_in;

reg         [(`TS_WIDTH-1):0] tstamp;
reg                     [7:0] data_in_ready;
reg                           hwtw;
reg         [(`TS_WIDTH-1):0] demap_tstamp;
reg 			dbg_en;

reg                     [2:0] mytid;
reg                     [5:0] mytnum;
wire                    [2:0] mycid;
integer                       junk;
integer                       i;
reg                     [7:0] cnt;

assign   mycid = 4;

//----------------------------------------------------------
// Instantiate fifo - 1 entry per thread
//fifo fifo ();
// Define fifo parameters
`ifndef PALLADIUM
defparam fifo.ENTRY_BITS = 4;  // {hwtw,tid[2:0]}
defparam fifo.DEPTH      = 9;  // 1 extra entry for overflow detection
defparam fifo.PTR_BITS   = 4;
`endif

//----------------------------------------------------------
// DUT probes

assign   data_in = `SPC4.mmu.asi.htc_wr_itlb_data_in;
assign   wr_en = `SPC4.ifu_ftu.ftu_itb_cust.tlb_wr_1_in_dout;

assign    entry = `SPC4.ifu_ftu.ftu_itb_cust.rw_index_1[5:0];

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
wire [7:0] itlb_wr = {(`SPC4.tlu.trl1.take_itw & `SPC4.tlu.trl1.trap[3]),
                      (`SPC4.tlu.trl1.take_itw & `SPC4.tlu.trl1.trap[2]),
                      (`SPC4.tlu.trl1.take_itw & `SPC4.tlu.trl1.trap[1]),
                      (`SPC4.tlu.trl1.take_itw & `SPC4.tlu.trl1.trap[0]),
                      (`SPC4.tlu.trl0.take_itw & `SPC4.tlu.trl0.trap[3]),
                      (`SPC4.tlu.trl0.take_itw & `SPC4.tlu.trl0.trap[2]),
                      (`SPC4.tlu.trl0.take_itw & `SPC4.tlu.trl0.trap[1]),
                      (`SPC4.tlu.trl0.take_itw & `SPC4.tlu.trl0.trap[0])
                     };

 assign   tlb_wr = itlb_wr;

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

//----------------------------------------------------------
initial  begin // {
`ifndef PALLADIUM
  #1;
`endif
  hwtw = 1'b0;
  data_in_ready = 8'b0;  
end // }

//----------------------------------------------------------
// Must use negedge to avoid race condition
// tlb_replacement_index (aka entry) is created in always block using blocking assignments

always @ (negedge `CPU.l2clk) begin // {

  tstamp = `TOP.cycle;
  demap_tstamp = `TOP.cycle;

  // Delay by 1 cycle to align with skip_demap
  demap_tid_1  <= demap_tid;  // demap_tid is active when demap is asserted
  demap_tnum_1 <= (mycid * 8) + demap_tid;
  demap_1      <= demap;


  //----------------------------------------------------------
  //  Send I/DTLBWRITE due to demap
  //

  if ((demap!=0) && (demap_1!=0)) begin // {
    $display("tlb_sync", `ERROR,
       "C%0d T%0d Illegal Back to Back ITLB demap",
        mycid,demap_tid_1);
  end // }

  //if (demap_active) begin // {
   // fifo.pop_fifo ({hwtw,mytid});
  //end
  //--------------------
  if (dbg_in & (|demap_1)) begin // {
    begin // axis tbcall_region
    $write ("SHOW_TLB: ITLB_DEMAP C%0d T%0d ",mycid,demap_tid_1);
    end

    if (demap_active) begin
    begin // axis tbcall_region
      case (demap_1)
      4'b0001:  $write ("type=real ");
      4'b0010:  $write ("type=cntx ");
      4'b0100:  $write ("type=page ");
      4'b1000:  $write ("type=all  ");
      default:
          $display ("tlb_sync", `ERROR,
            "Bench Problem - demap_1() should be one-hot.");
         //   "Bench Problem - demap_1(%b) should be one-hot.",demap_1);
      endcase
    end
    end
    else begin
    begin // axis tbcall_region
     $write("type=autodemap ");
    end
    end

    begin // axis tbcall_region
    $display ("match=%h                               ts=%0d",
                tlb_match,demap_tstamp*`TOP.core_period);
    end
    for (cnt=0; cnt<=NUM_TLB; cnt=cnt+1) begin // {
      if (tlb_match[cnt]==1'b1)  begin // {
    begin // axis tbcall_region
        $display ("SHOW_TLB: ITLB_DEMAP C%0d T%0d entry=%h V=0 ts=%0d",
                    mycid,demap_tid_1,cnt,demap_tstamp*`TOP.core_period);
    end
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
          $display ("tlb_sync", `ERROR,
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
	    hwtw <= 1'b1;
	    mytid[2:0] <= i[2:0];
            //fifo.push_fifo ({1'b1,i[2:0]}); //  {hwtw,tid[2:0]}
            data_in_ready[i] <= 1'b0;
          end // }
          else begin // {
	    hwtw <= 1'b0;
            //fifo.push_fifo ({1'b0,i[2:0]}); //  {!hwtw,tid[2:0]}
	    mytid[2:0] <= i[2:0];
          end // }
        end // }

      end // if}
    end // for}

  end // if}

  //----------------------------------------------------------
  // wr_en means that the write is occurring
  if (wr_en) begin // {
    //fifo.pop_fifo ({hwtw,mytid});
    mytnum = (mycid * 8) + mytid;

    //--------------------
    if (dbg_in) begin // {
    begin // axis tbcall_region
      $write ("SHOW_TLB: ITLB_WRITE C%0d T%0d ",mycid,mytid);
    end

    begin // axis tbcall_region
      if (tte_real==0) $write ("entry=%h V=%b VA=%h ",entry,tte_valid,tte_va);
      else             $write ("entry=%h V=%b RA=%h ",entry,tte_valid,tte_va);
    end

    begin // axis tbcall_region
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
    end
    end // }
    //--------------------

  end // }

end // always}

`endif
//----------------------------------------------------------
endmodule

module dtlb_wr_c4 (dbg_in);
`ifndef GATESIM

parameter NUM_TLB=128;

wire                    [7:0] data_in;
wire                    [7:0] tlb_wr;
wire                          wr_en;
wire                    [7:0] entry;
wire                    [7:0] asi_num;
wire                          asi_enable0;  // 1 per thread group
wire                          asi_enable1;
// wire                    [7:0] store_asi;  // 1 per thread
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
input			dbg_in;

reg         [(`TS_WIDTH-1):0] tstamp;
reg                           hwtw;
// reg                     [7:0] my_asi [0:7];  // 1 asi number stored per thread
reg         [(`TS_WIDTH-1):0] demap_tstamp;

reg                     [2:0] mytid;
reg                     [5:0] mytnum;
wire                    [2:0] mycid;
integer                       junk;
integer                       i;
reg                     [7:0] cnt;

assign   mycid = 4;

//----------------------------------------------------------
// Instantiate fifo - 1 entry per thread
//fifo fifo ();
// Define fifo parameters
`ifndef PALLADIUM
defparam fifo.ENTRY_BITS = 4;  // {hwtw,tid[2:0]}
defparam fifo.DEPTH      = 9;  // 1 extra entry for overflow detection
defparam fifo.PTR_BITS   = 4;
`endif

//----------------------------------------------------------
// DUT probes

assign   data_in = `SPC4.mmu.asi.wrote_dtlb;
assign   tlb_wr = `SPC4.mmu_reload_done;
assign   wr_en = `SPC4.lsu.tlb.tlb_wr_1_in_dout;

assign   entry = `SPC4.lsu.tlb.rw_index_1[6:0];

// assign   asi_num = `PROBES0.asi_num;
// assign   asi_enable0 =  `PROBES0.tlb_rd_vld_b &
//                        !`PROBES0.tlb_bypass_b &
//                        `SPC0.tlu.fls0.lsu_inst_b;
//assign   asi_enable1 =  `PROBES0.tlb_rd_vld_b &
//                        !`PROBES0.tlb_bypass_b &
//                        `SPC0.tlu.fls1.lsu_inst_b;

// assign   store_asi[3:0] = asi_enable0 ? `PROBES0.select_pc_b[3:0] : 4'b0;
// assign   store_asi[7:4] = asi_enable1 ? `PROBES0.select_pc_b[7:4] : 4'b0;


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
assign  tte_ep           = 1'b1;  // Does not apply for DTLB

//----------------------------------------------------------
// Initialize state machine to idle state
initial  begin // {
`ifndef PALLADIUM
  #1;
`endif
  hwtw = 1'b0;
  //for (i=0; i<=7; i=i+1) begin
  // my_asi[i] = 8'b0;
  //end

end // }

//----------------------------------------------------------
// Must use negedge to avoid race condition
// tlb_entry_replace (aka entry) is created in always block using blocking assignments

always @ (negedge `CPU.l2clk) begin // {

  tstamp = `TOP.cycle;
  demap_tstamp = `TOP.cycle;

  // Delay by 1 cycle to align with skip_demap
  demap_tid_1  <= demap_tid;  // demap_tid is active when demap is asserted
  demap_tnum_1 <= (mycid * 8) + demap_tid;
  demap_1      <= demap;

  //----------------------------------------------------------
  //  Send I/DTLBWRITE due to demap
  //

  if ((demap!=0) && (demap_1!=0)) begin // {
    $display("tlb_sync", `ERROR,
       "C%0d T%0d Illegal Back to Back DTLB demap",
        mycid,demap_tid_1);
  end // }

  //if (demap_active) begin // {
   // fifo.pop_fifo ({hwtw,mytid});
  //end //}

  //--------------------
  if (dbg_in & (|demap_1)) begin // {
    begin // axis tbcall_region
      $write ("SHOW_TLB: DTLB_DEMAP C%0d T%0d ",mycid,demap_tid_1);
    end

    if (demap_active) begin
    begin // axis tbcall_region
      case (demap_1)
      4'b0001:  $write ("type=real ");
      4'b0010:  $write ("type=cntx ");
      4'b0100:  $write ("type=page ");
      4'b1000:  $write ("type=all  ");
      default:
          $display ("tlb_sync", `ERROR,
            "Bench Problem - demap_1 should be one-hot.");
       //     "Bench Problem - demap_1(%b) should be one-hot.",demap_1);
      endcase
    end
    end
    else begin
    begin // axis tbcall_region
      $write ("type=autodemap ");
    end
    end

    begin // axis tbcall_region
    $display ("match=%h                ts=%0d",
                tlb_match,demap_tstamp*`TOP.core_period);
    end

    for (cnt=0; cnt<=NUM_TLB; cnt=cnt+1) begin // {
      if (tlb_match[cnt]==1'b1)  begin // {
    begin // axis tbcall_region
        $display ("SHOW_TLB: DTLB_DEMAP C%0d T%0d entry=%h V=0 ts=%0d",
                   mycid,demap_tid_1,cnt,demap_tstamp*`TOP.core_period);
    end
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
 // for (i=0;i<=7;i=i+1) begin // {
 //   my_asi[i] = (store_asi[i]) ? asi_num : my_asi[i];
 // end // }

  // There are 3 main signals to watch for TLBWRITE (data_in, tlb_wr, wr_en)
  // These signals will be interleaved between the threads.
  // Need to queue up the signals over time so they can be processed in order.
  // Each thread will only be doing 1 thing at a time.

  for (i=0;i<=7;i=i+1) begin // {

    // tlb_wr[tid] determines if the write is HWTW or TLBWRITE

    // data_in[tid] determines which thread will write next
    // Use fifo to save the tids of the data_in signals in order

    if (data_in[i]) begin // {
      mytid[2:0] <= i[2:0];
      if (tlb_wr[i]) begin // {
	hwtw <= 1'b1;
        //fifo.push_fifo ({1'b1,i[2:0]}); //  {hwtw,tid[2:0]}
      end // }
      else begin // {
	hwtw <= 1'b0;
        //fifo.push_fifo ({1'b0,i[2:0]}); //  {!hwtw,tid[2:0]}
      end // }
    end // }

  end // }

  //----------------------------------------------------------
  // wr_en means that the write is occurring
  if (wr_en) begin // {
    //fifo.pop_fifo ({hwtw,mytid});
    mytnum = (mycid * 8) + mytid;

    //--------------------
    if (dbg_in) begin // {
    begin // axis tbcall_region
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
  end // }

end // always}

//----------------------------------------------------------
`endif

endmodule
`endif

//----------------------------------------------------------
//----------------------------------------------------------


`ifdef CORE_5

module itlb_wr_c5 (dbg_in);
`ifndef GATESIM

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
input 			dbg_in;

reg         [(`TS_WIDTH-1):0] tstamp;
reg                     [7:0] data_in_ready;
reg                           hwtw;
reg         [(`TS_WIDTH-1):0] demap_tstamp;
reg 			dbg_en;

reg                     [2:0] mytid;
reg                     [5:0] mytnum;
wire                    [2:0] mycid;
integer                       junk;
integer                       i;
reg                     [7:0] cnt;

assign   mycid = 5;

//----------------------------------------------------------
// Instantiate fifo - 1 entry per thread
//fifo fifo ();
// Define fifo parameters
`ifndef PALLADIUM
defparam fifo.ENTRY_BITS = 4;  // {hwtw,tid[2:0]}
defparam fifo.DEPTH      = 9;  // 1 extra entry for overflow detection
defparam fifo.PTR_BITS   = 4;
`endif

//----------------------------------------------------------
// DUT probes

assign   data_in = `SPC5.mmu.asi.htc_wr_itlb_data_in;
assign   wr_en = `SPC5.ifu_ftu.ftu_itb_cust.tlb_wr_1_in_dout;

assign    entry = `SPC5.ifu_ftu.ftu_itb_cust.rw_index_1[5:0];

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
wire [7:0] itlb_wr = {(`SPC5.tlu.trl1.take_itw & `SPC5.tlu.trl1.trap[3]),
                      (`SPC5.tlu.trl1.take_itw & `SPC5.tlu.trl1.trap[2]),
                      (`SPC5.tlu.trl1.take_itw & `SPC5.tlu.trl1.trap[1]),
                      (`SPC5.tlu.trl1.take_itw & `SPC5.tlu.trl1.trap[0]),
                      (`SPC5.tlu.trl0.take_itw & `SPC5.tlu.trl0.trap[3]),
                      (`SPC5.tlu.trl0.take_itw & `SPC5.tlu.trl0.trap[2]),
                      (`SPC5.tlu.trl0.take_itw & `SPC5.tlu.trl0.trap[1]),
                      (`SPC5.tlu.trl0.take_itw & `SPC5.tlu.trl0.trap[0])
                     };

 assign   tlb_wr = itlb_wr;

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

//----------------------------------------------------------
initial  begin // {
`ifndef PALLADIUM
  #1;
`endif
  hwtw = 1'b0;
  data_in_ready = 8'b0;  
end // }

//----------------------------------------------------------
// Must use negedge to avoid race condition
// tlb_replacement_index (aka entry) is created in always block using blocking assignments

always @ (negedge `CPU.l2clk) begin // {

  tstamp = `TOP.cycle;
  demap_tstamp = `TOP.cycle;

  // Delay by 1 cycle to align with skip_demap
  demap_tid_1  <= demap_tid;  // demap_tid is active when demap is asserted
  demap_tnum_1 <= (mycid * 8) + demap_tid;
  demap_1      <= demap;


  //----------------------------------------------------------
  //  Send I/DTLBWRITE due to demap
  //

  if ((demap!=0) && (demap_1!=0)) begin // {
    $display("tlb_sync", `ERROR,
       "C%0d T%0d Illegal Back to Back ITLB demap",
        mycid,demap_tid_1);
  end // }

  //if (demap_active) begin // {
   // fifo.pop_fifo ({hwtw,mytid});
  //end
  //--------------------
  if (dbg_in & (|demap_1)) begin // {
    begin // axis tbcall_region
    $write ("SHOW_TLB: ITLB_DEMAP C%0d T%0d ",mycid,demap_tid_1);
    end

    if (demap_active) begin
    begin // axis tbcall_region
      case (demap_1)
      4'b0001:  $write ("type=real ");
      4'b0010:  $write ("type=cntx ");
      4'b0100:  $write ("type=page ");
      4'b1000:  $write ("type=all  ");
      default:
          $display ("tlb_sync", `ERROR,
            "Bench Problem - demap_1() should be one-hot.");
         //   "Bench Problem - demap_1(%b) should be one-hot.",demap_1);
      endcase
    end
    end
    else begin
    begin // axis tbcall_region
     $write("type=autodemap ");
    end
    end

    begin // axis tbcall_region
    $display ("match=%h                               ts=%0d",
                tlb_match,demap_tstamp*`TOP.core_period);
    end
    for (cnt=0; cnt<=NUM_TLB; cnt=cnt+1) begin // {
      if (tlb_match[cnt]==1'b1)  begin // {
    begin // axis tbcall_region
        $display ("SHOW_TLB: ITLB_DEMAP C%0d T%0d entry=%h V=0 ts=%0d",
                    mycid,demap_tid_1,cnt,demap_tstamp*`TOP.core_period);
    end
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
          $display ("tlb_sync", `ERROR,
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
	    hwtw <= 1'b1;
	    mytid[2:0] <= i[2:0];
            //fifo.push_fifo ({1'b1,i[2:0]}); //  {hwtw,tid[2:0]}
            data_in_ready[i] <= 1'b0;
          end // }
          else begin // {
	    hwtw <= 1'b0;
            //fifo.push_fifo ({1'b0,i[2:0]}); //  {!hwtw,tid[2:0]}
	    mytid[2:0] <= i[2:0];
          end // }
        end // }

      end // if}
    end // for}

  end // if}

  //----------------------------------------------------------
  // wr_en means that the write is occurring
  if (wr_en) begin // {
    //fifo.pop_fifo ({hwtw,mytid});
    mytnum = (mycid * 8) + mytid;

    //--------------------
    if (dbg_in) begin // {
    begin // axis tbcall_region
      $write ("SHOW_TLB: ITLB_WRITE C%0d T%0d ",mycid,mytid);
    end

    begin // axis tbcall_region
      if (tte_real==0) $write ("entry=%h V=%b VA=%h ",entry,tte_valid,tte_va);
      else             $write ("entry=%h V=%b RA=%h ",entry,tte_valid,tte_va);
    end

    begin // axis tbcall_region
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
    end
    end // }
    //--------------------

  end // }

end // always}

`endif
//----------------------------------------------------------
endmodule

module dtlb_wr_c5 (dbg_in);
`ifndef GATESIM

parameter NUM_TLB=128;

wire                    [7:0] data_in;
wire                    [7:0] tlb_wr;
wire                          wr_en;
wire                    [7:0] entry;
wire                    [7:0] asi_num;
wire                          asi_enable0;  // 1 per thread group
wire                          asi_enable1;
// wire                    [7:0] store_asi;  // 1 per thread
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
input			dbg_in;

reg         [(`TS_WIDTH-1):0] tstamp;
reg                           hwtw;
// reg                     [7:0] my_asi [0:7];  // 1 asi number stored per thread
reg         [(`TS_WIDTH-1):0] demap_tstamp;

reg                     [2:0] mytid;
reg                     [5:0] mytnum;
wire                    [2:0] mycid;
integer                       junk;
integer                       i;
reg                     [7:0] cnt;

assign   mycid = 5;

//----------------------------------------------------------
// Instantiate fifo - 1 entry per thread
//fifo fifo ();
// Define fifo parameters
`ifndef PALLADIUM
defparam fifo.ENTRY_BITS = 4;  // {hwtw,tid[2:0]}
defparam fifo.DEPTH      = 9;  // 1 extra entry for overflow detection
defparam fifo.PTR_BITS   = 4;
`endif

//----------------------------------------------------------
// DUT probes

assign   data_in = `SPC5.mmu.asi.wrote_dtlb;
assign   tlb_wr = `SPC5.mmu_reload_done;
assign   wr_en = `SPC5.lsu.tlb.tlb_wr_1_in_dout;

assign   entry = `SPC5.lsu.tlb.rw_index_1[6:0];

// assign   asi_num = `PROBES0.asi_num;
// assign   asi_enable0 =  `PROBES0.tlb_rd_vld_b &
//                        !`PROBES0.tlb_bypass_b &
//                        `SPC0.tlu.fls0.lsu_inst_b;
//assign   asi_enable1 =  `PROBES0.tlb_rd_vld_b &
//                        !`PROBES0.tlb_bypass_b &
//                        `SPC0.tlu.fls1.lsu_inst_b;

// assign   store_asi[3:0] = asi_enable0 ? `PROBES0.select_pc_b[3:0] : 4'b0;
// assign   store_asi[7:4] = asi_enable1 ? `PROBES0.select_pc_b[7:4] : 4'b0;


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
assign  tte_ep           = 1'b1;  // Does not apply for DTLB

//----------------------------------------------------------
// Initialize state machine to idle state
initial  begin // {
`ifndef PALLADIUM
  #1;
`endif
  hwtw = 1'b0;
  //for (i=0; i<=7; i=i+1) begin
  // my_asi[i] = 8'b0;
  //end

end // }

//----------------------------------------------------------
// Must use negedge to avoid race condition
// tlb_entry_replace (aka entry) is created in always block using blocking assignments

always @ (negedge `CPU.l2clk) begin // {

  tstamp = `TOP.cycle;
  demap_tstamp = `TOP.cycle;

  // Delay by 1 cycle to align with skip_demap
  demap_tid_1  <= demap_tid;  // demap_tid is active when demap is asserted
  demap_tnum_1 <= (mycid * 8) + demap_tid;
  demap_1      <= demap;

  //----------------------------------------------------------
  //  Send I/DTLBWRITE due to demap
  //

  if ((demap!=0) && (demap_1!=0)) begin // {
    $display("tlb_sync", `ERROR,
       "C%0d T%0d Illegal Back to Back DTLB demap",
        mycid,demap_tid_1);
  end // }

  //if (demap_active) begin // {
   // fifo.pop_fifo ({hwtw,mytid});
  //end //}

  //--------------------
  if (dbg_in & (|demap_1)) begin // {
    begin // axis tbcall_region
      $write ("SHOW_TLB: DTLB_DEMAP C%0d T%0d ",mycid,demap_tid_1);
    end

    if (demap_active) begin
    begin // axis tbcall_region
      case (demap_1)
      4'b0001:  $write ("type=real ");
      4'b0010:  $write ("type=cntx ");
      4'b0100:  $write ("type=page ");
      4'b1000:  $write ("type=all  ");
      default:
          $display ("tlb_sync", `ERROR,
            "Bench Problem - demap_1 should be one-hot.");
       //     "Bench Problem - demap_1(%b) should be one-hot.",demap_1);
      endcase
    end
    end
    else begin
    begin // axis tbcall_region
      $write ("type=autodemap ");
    end
    end

    begin // axis tbcall_region
    $display ("match=%h                ts=%0d",
                tlb_match,demap_tstamp*`TOP.core_period);
    end

    for (cnt=0; cnt<=NUM_TLB; cnt=cnt+1) begin // {
      if (tlb_match[cnt]==1'b1)  begin // {
    begin // axis tbcall_region
        $display ("SHOW_TLB: DTLB_DEMAP C%0d T%0d entry=%h V=0 ts=%0d",
                   mycid,demap_tid_1,cnt,demap_tstamp*`TOP.core_period);
    end
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
 // for (i=0;i<=7;i=i+1) begin // {
 //   my_asi[i] = (store_asi[i]) ? asi_num : my_asi[i];
 // end // }

  // There are 3 main signals to watch for TLBWRITE (data_in, tlb_wr, wr_en)
  // These signals will be interleaved between the threads.
  // Need to queue up the signals over time so they can be processed in order.
  // Each thread will only be doing 1 thing at a time.

  for (i=0;i<=7;i=i+1) begin // {

    // tlb_wr[tid] determines if the write is HWTW or TLBWRITE

    // data_in[tid] determines which thread will write next
    // Use fifo to save the tids of the data_in signals in order

    if (data_in[i]) begin // {
      mytid[2:0] <= i[2:0];
      if (tlb_wr[i]) begin // {
	hwtw <= 1'b1;
        //fifo.push_fifo ({1'b1,i[2:0]}); //  {hwtw,tid[2:0]}
      end // }
      else begin // {
	hwtw <= 1'b0;
        //fifo.push_fifo ({1'b0,i[2:0]}); //  {!hwtw,tid[2:0]}
      end // }
    end // }

  end // }

  //----------------------------------------------------------
  // wr_en means that the write is occurring
  if (wr_en) begin // {
    //fifo.pop_fifo ({hwtw,mytid});
    mytnum = (mycid * 8) + mytid;

    //--------------------
    if (dbg_in) begin // {
    begin // axis tbcall_region
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
  end // }

end // always}

//----------------------------------------------------------
`endif

endmodule
`endif

//----------------------------------------------------------
//----------------------------------------------------------


`ifdef CORE_6

module itlb_wr_c6 (dbg_in);
`ifndef GATESIM

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
input 			dbg_in;

reg         [(`TS_WIDTH-1):0] tstamp;
reg                     [7:0] data_in_ready;
reg                           hwtw;
reg         [(`TS_WIDTH-1):0] demap_tstamp;
reg 			dbg_en;

reg                     [2:0] mytid;
reg                     [5:0] mytnum;
wire                    [2:0] mycid;
integer                       junk;
integer                       i;
reg                     [7:0] cnt;

assign   mycid = 6;

//----------------------------------------------------------
// Instantiate fifo - 1 entry per thread
//fifo fifo ();
// Define fifo parameters
`ifndef PALLADIUM
defparam fifo.ENTRY_BITS = 4;  // {hwtw,tid[2:0]}
defparam fifo.DEPTH      = 9;  // 1 extra entry for overflow detection
defparam fifo.PTR_BITS   = 4;
`endif

//----------------------------------------------------------
// DUT probes

assign   data_in = `SPC6.mmu.asi.htc_wr_itlb_data_in;
assign   wr_en = `SPC6.ifu_ftu.ftu_itb_cust.tlb_wr_1_in_dout;

assign    entry = `SPC6.ifu_ftu.ftu_itb_cust.rw_index_1[5:0];

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
wire [7:0] itlb_wr = {(`SPC6.tlu.trl1.take_itw & `SPC6.tlu.trl1.trap[3]),
                      (`SPC6.tlu.trl1.take_itw & `SPC6.tlu.trl1.trap[2]),
                      (`SPC6.tlu.trl1.take_itw & `SPC6.tlu.trl1.trap[1]),
                      (`SPC6.tlu.trl1.take_itw & `SPC6.tlu.trl1.trap[0]),
                      (`SPC6.tlu.trl0.take_itw & `SPC6.tlu.trl0.trap[3]),
                      (`SPC6.tlu.trl0.take_itw & `SPC6.tlu.trl0.trap[2]),
                      (`SPC6.tlu.trl0.take_itw & `SPC6.tlu.trl0.trap[1]),
                      (`SPC6.tlu.trl0.take_itw & `SPC6.tlu.trl0.trap[0])
                     };

 assign   tlb_wr = itlb_wr;

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

//----------------------------------------------------------
initial  begin // {
`ifndef PALLADIUM
  #1;
`endif
  hwtw = 1'b0;
  data_in_ready = 8'b0;  
end // }

//----------------------------------------------------------
// Must use negedge to avoid race condition
// tlb_replacement_index (aka entry) is created in always block using blocking assignments

always @ (negedge `CPU.l2clk) begin // {

  tstamp = `TOP.cycle;
  demap_tstamp = `TOP.cycle;

  // Delay by 1 cycle to align with skip_demap
  demap_tid_1  <= demap_tid;  // demap_tid is active when demap is asserted
  demap_tnum_1 <= (mycid * 8) + demap_tid;
  demap_1      <= demap;


  //----------------------------------------------------------
  //  Send I/DTLBWRITE due to demap
  //

  if ((demap!=0) && (demap_1!=0)) begin // {
    $display("tlb_sync", `ERROR,
       "C%0d T%0d Illegal Back to Back ITLB demap",
        mycid,demap_tid_1);
  end // }

  //if (demap_active) begin // {
   // fifo.pop_fifo ({hwtw,mytid});
  //end
  //--------------------
  if (dbg_in & (|demap_1)) begin // {
    begin // axis tbcall_region
    $write ("SHOW_TLB: ITLB_DEMAP C%0d T%0d ",mycid,demap_tid_1);
    end

    if (demap_active) begin
    begin // axis tbcall_region
      case (demap_1)
      4'b0001:  $write ("type=real ");
      4'b0010:  $write ("type=cntx ");
      4'b0100:  $write ("type=page ");
      4'b1000:  $write ("type=all  ");
      default:
          $display ("tlb_sync", `ERROR,
            "Bench Problem - demap_1() should be one-hot.");
         //   "Bench Problem - demap_1(%b) should be one-hot.",demap_1);
      endcase
    end
    end
    else begin
    begin // axis tbcall_region
     $write("type=autodemap ");
    end
    end

    begin // axis tbcall_region
    $display ("match=%h                               ts=%0d",
                tlb_match,demap_tstamp*`TOP.core_period);
    end
    for (cnt=0; cnt<=NUM_TLB; cnt=cnt+1) begin // {
      if (tlb_match[cnt]==1'b1)  begin // {
    begin // axis tbcall_region
        $display ("SHOW_TLB: ITLB_DEMAP C%0d T%0d entry=%h V=0 ts=%0d",
                    mycid,demap_tid_1,cnt,demap_tstamp*`TOP.core_period);
    end
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
          $display ("tlb_sync", `ERROR,
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
	    hwtw <= 1'b1;
	    mytid[2:0] <= i[2:0];
            //fifo.push_fifo ({1'b1,i[2:0]}); //  {hwtw,tid[2:0]}
            data_in_ready[i] <= 1'b0;
          end // }
          else begin // {
	    hwtw <= 1'b0;
            //fifo.push_fifo ({1'b0,i[2:0]}); //  {!hwtw,tid[2:0]}
	    mytid[2:0] <= i[2:0];
          end // }
        end // }

      end // if}
    end // for}

  end // if}

  //----------------------------------------------------------
  // wr_en means that the write is occurring
  if (wr_en) begin // {
    //fifo.pop_fifo ({hwtw,mytid});
    mytnum = (mycid * 8) + mytid;

    //--------------------
    if (dbg_in) begin // {
    begin // axis tbcall_region
      $write ("SHOW_TLB: ITLB_WRITE C%0d T%0d ",mycid,mytid);
    end

    begin // axis tbcall_region
      if (tte_real==0) $write ("entry=%h V=%b VA=%h ",entry,tte_valid,tte_va);
      else             $write ("entry=%h V=%b RA=%h ",entry,tte_valid,tte_va);
    end

    begin // axis tbcall_region
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
    end
    end // }
    //--------------------

  end // }

end // always}

`endif
//----------------------------------------------------------
endmodule

module dtlb_wr_c6 (dbg_in);
`ifndef GATESIM

parameter NUM_TLB=128;

wire                    [7:0] data_in;
wire                    [7:0] tlb_wr;
wire                          wr_en;
wire                    [7:0] entry;
wire                    [7:0] asi_num;
wire                          asi_enable0;  // 1 per thread group
wire                          asi_enable1;
// wire                    [7:0] store_asi;  // 1 per thread
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
input			dbg_in;

reg         [(`TS_WIDTH-1):0] tstamp;
reg                           hwtw;
// reg                     [7:0] my_asi [0:7];  // 1 asi number stored per thread
reg         [(`TS_WIDTH-1):0] demap_tstamp;

reg                     [2:0] mytid;
reg                     [5:0] mytnum;
wire                    [2:0] mycid;
integer                       junk;
integer                       i;
reg                     [7:0] cnt;

assign   mycid = 6;

//----------------------------------------------------------
// Instantiate fifo - 1 entry per thread
//fifo fifo ();
// Define fifo parameters
`ifndef PALLADIUM
defparam fifo.ENTRY_BITS = 4;  // {hwtw,tid[2:0]}
defparam fifo.DEPTH      = 9;  // 1 extra entry for overflow detection
defparam fifo.PTR_BITS   = 4;
`endif

//----------------------------------------------------------
// DUT probes

assign   data_in = `SPC6.mmu.asi.wrote_dtlb;
assign   tlb_wr = `SPC6.mmu_reload_done;
assign   wr_en = `SPC6.lsu.tlb.tlb_wr_1_in_dout;

assign   entry = `SPC6.lsu.tlb.rw_index_1[6:0];

// assign   asi_num = `PROBES0.asi_num;
// assign   asi_enable0 =  `PROBES0.tlb_rd_vld_b &
//                        !`PROBES0.tlb_bypass_b &
//                        `SPC0.tlu.fls0.lsu_inst_b;
//assign   asi_enable1 =  `PROBES0.tlb_rd_vld_b &
//                        !`PROBES0.tlb_bypass_b &
//                        `SPC0.tlu.fls1.lsu_inst_b;

// assign   store_asi[3:0] = asi_enable0 ? `PROBES0.select_pc_b[3:0] : 4'b0;
// assign   store_asi[7:4] = asi_enable1 ? `PROBES0.select_pc_b[7:4] : 4'b0;


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
assign  tte_ep           = 1'b1;  // Does not apply for DTLB

//----------------------------------------------------------
// Initialize state machine to idle state
initial  begin // {
`ifndef PALLADIUM
  #1;
`endif
  hwtw = 1'b0;
  //for (i=0; i<=7; i=i+1) begin
  // my_asi[i] = 8'b0;
  //end

end // }

//----------------------------------------------------------
// Must use negedge to avoid race condition
// tlb_entry_replace (aka entry) is created in always block using blocking assignments

always @ (negedge `CPU.l2clk) begin // {

  tstamp = `TOP.cycle;
  demap_tstamp = `TOP.cycle;

  // Delay by 1 cycle to align with skip_demap
  demap_tid_1  <= demap_tid;  // demap_tid is active when demap is asserted
  demap_tnum_1 <= (mycid * 8) + demap_tid;
  demap_1      <= demap;

  //----------------------------------------------------------
  //  Send I/DTLBWRITE due to demap
  //

  if ((demap!=0) && (demap_1!=0)) begin // {
    $display("tlb_sync", `ERROR,
       "C%0d T%0d Illegal Back to Back DTLB demap",
        mycid,demap_tid_1);
  end // }

  //if (demap_active) begin // {
   // fifo.pop_fifo ({hwtw,mytid});
  //end //}

  //--------------------
  if (dbg_in & (|demap_1)) begin // {
    begin // axis tbcall_region
      $write ("SHOW_TLB: DTLB_DEMAP C%0d T%0d ",mycid,demap_tid_1);
    end

    if (demap_active) begin
    begin // axis tbcall_region
      case (demap_1)
      4'b0001:  $write ("type=real ");
      4'b0010:  $write ("type=cntx ");
      4'b0100:  $write ("type=page ");
      4'b1000:  $write ("type=all  ");
      default:
          $display ("tlb_sync", `ERROR,
            "Bench Problem - demap_1 should be one-hot.");
       //     "Bench Problem - demap_1(%b) should be one-hot.",demap_1);
      endcase
    end
    end
    else begin
    begin // axis tbcall_region
      $write ("type=autodemap ");
    end
    end

    begin // axis tbcall_region
    $display ("match=%h                ts=%0d",
                tlb_match,demap_tstamp*`TOP.core_period);
    end

    for (cnt=0; cnt<=NUM_TLB; cnt=cnt+1) begin // {
      if (tlb_match[cnt]==1'b1)  begin // {
    begin // axis tbcall_region
        $display ("SHOW_TLB: DTLB_DEMAP C%0d T%0d entry=%h V=0 ts=%0d",
                   mycid,demap_tid_1,cnt,demap_tstamp*`TOP.core_period);
    end
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
 // for (i=0;i<=7;i=i+1) begin // {
 //   my_asi[i] = (store_asi[i]) ? asi_num : my_asi[i];
 // end // }

  // There are 3 main signals to watch for TLBWRITE (data_in, tlb_wr, wr_en)
  // These signals will be interleaved between the threads.
  // Need to queue up the signals over time so they can be processed in order.
  // Each thread will only be doing 1 thing at a time.

  for (i=0;i<=7;i=i+1) begin // {

    // tlb_wr[tid] determines if the write is HWTW or TLBWRITE

    // data_in[tid] determines which thread will write next
    // Use fifo to save the tids of the data_in signals in order

    if (data_in[i]) begin // {
      mytid[2:0] <= i[2:0];
      if (tlb_wr[i]) begin // {
	hwtw <= 1'b1;
        //fifo.push_fifo ({1'b1,i[2:0]}); //  {hwtw,tid[2:0]}
      end // }
      else begin // {
	hwtw <= 1'b0;
        //fifo.push_fifo ({1'b0,i[2:0]}); //  {!hwtw,tid[2:0]}
      end // }
    end // }

  end // }

  //----------------------------------------------------------
  // wr_en means that the write is occurring
  if (wr_en) begin // {
    //fifo.pop_fifo ({hwtw,mytid});
    mytnum = (mycid * 8) + mytid;

    //--------------------
    if (dbg_in) begin // {
    begin // axis tbcall_region
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
  end // }

end // always}

//----------------------------------------------------------
`endif

endmodule
`endif

//----------------------------------------------------------
//----------------------------------------------------------


`ifdef CORE_7

module itlb_wr_c7 (dbg_in);
`ifndef GATESIM

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
input 			dbg_in;

reg         [(`TS_WIDTH-1):0] tstamp;
reg                     [7:0] data_in_ready;
reg                           hwtw;
reg         [(`TS_WIDTH-1):0] demap_tstamp;
reg 			dbg_en;

reg                     [2:0] mytid;
reg                     [5:0] mytnum;
wire                    [2:0] mycid;
integer                       junk;
integer                       i;
reg                     [7:0] cnt;

assign   mycid = 7;

//----------------------------------------------------------
// Instantiate fifo - 1 entry per thread
//fifo fifo ();
// Define fifo parameters
`ifndef PALLADIUM
defparam fifo.ENTRY_BITS = 4;  // {hwtw,tid[2:0]}
defparam fifo.DEPTH      = 9;  // 1 extra entry for overflow detection
defparam fifo.PTR_BITS   = 4;
`endif

//----------------------------------------------------------
// DUT probes

assign   data_in = `SPC7.mmu.asi.htc_wr_itlb_data_in;
assign   wr_en = `SPC7.ifu_ftu.ftu_itb_cust.tlb_wr_1_in_dout;

assign    entry = `SPC7.ifu_ftu.ftu_itb_cust.rw_index_1[5:0];

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
wire [7:0] itlb_wr = {(`SPC7.tlu.trl1.take_itw & `SPC7.tlu.trl1.trap[3]),
                      (`SPC7.tlu.trl1.take_itw & `SPC7.tlu.trl1.trap[2]),
                      (`SPC7.tlu.trl1.take_itw & `SPC7.tlu.trl1.trap[1]),
                      (`SPC7.tlu.trl1.take_itw & `SPC7.tlu.trl1.trap[0]),
                      (`SPC7.tlu.trl0.take_itw & `SPC7.tlu.trl0.trap[3]),
                      (`SPC7.tlu.trl0.take_itw & `SPC7.tlu.trl0.trap[2]),
                      (`SPC7.tlu.trl0.take_itw & `SPC7.tlu.trl0.trap[1]),
                      (`SPC7.tlu.trl0.take_itw & `SPC7.tlu.trl0.trap[0])
                     };

 assign   tlb_wr = itlb_wr;

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

//----------------------------------------------------------
initial  begin // {
`ifndef PALLADIUM
  #1;
`endif
  hwtw = 1'b0;
  data_in_ready = 8'b0;  
end // }

//----------------------------------------------------------
// Must use negedge to avoid race condition
// tlb_replacement_index (aka entry) is created in always block using blocking assignments

always @ (negedge `CPU.l2clk) begin // {

  tstamp = `TOP.cycle;
  demap_tstamp = `TOP.cycle;

  // Delay by 1 cycle to align with skip_demap
  demap_tid_1  <= demap_tid;  // demap_tid is active when demap is asserted
  demap_tnum_1 <= (mycid * 8) + demap_tid;
  demap_1      <= demap;


  //----------------------------------------------------------
  //  Send I/DTLBWRITE due to demap
  //

  if ((demap!=0) && (demap_1!=0)) begin // {
    $display("tlb_sync", `ERROR,
       "C%0d T%0d Illegal Back to Back ITLB demap",
        mycid,demap_tid_1);
  end // }

  //if (demap_active) begin // {
   // fifo.pop_fifo ({hwtw,mytid});
  //end
  //--------------------
  if (dbg_in & (|demap_1)) begin // {
    begin // axis tbcall_region
    $write ("SHOW_TLB: ITLB_DEMAP C%0d T%0d ",mycid,demap_tid_1);
    end

    if (demap_active) begin
    begin // axis tbcall_region
      case (demap_1)
      4'b0001:  $write ("type=real ");
      4'b0010:  $write ("type=cntx ");
      4'b0100:  $write ("type=page ");
      4'b1000:  $write ("type=all  ");
      default:
          $display ("tlb_sync", `ERROR,
            "Bench Problem - demap_1() should be one-hot.");
         //   "Bench Problem - demap_1(%b) should be one-hot.",demap_1);
      endcase
    end
    end
    else begin
    begin // axis tbcall_region
     $write("type=autodemap ");
    end
    end

    begin // axis tbcall_region
    $display ("match=%h                               ts=%0d",
                tlb_match,demap_tstamp*`TOP.core_period);
    end
    for (cnt=0; cnt<=NUM_TLB; cnt=cnt+1) begin // {
      if (tlb_match[cnt]==1'b1)  begin // {
    begin // axis tbcall_region
        $display ("SHOW_TLB: ITLB_DEMAP C%0d T%0d entry=%h V=0 ts=%0d",
                    mycid,demap_tid_1,cnt,demap_tstamp*`TOP.core_period);
    end
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
          $display ("tlb_sync", `ERROR,
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
	    hwtw <= 1'b1;
	    mytid[2:0] <= i[2:0];
            //fifo.push_fifo ({1'b1,i[2:0]}); //  {hwtw,tid[2:0]}
            data_in_ready[i] <= 1'b0;
          end // }
          else begin // {
	    hwtw <= 1'b0;
            //fifo.push_fifo ({1'b0,i[2:0]}); //  {!hwtw,tid[2:0]}
	    mytid[2:0] <= i[2:0];
          end // }
        end // }

      end // if}
    end // for}

  end // if}

  //----------------------------------------------------------
  // wr_en means that the write is occurring
  if (wr_en) begin // {
    //fifo.pop_fifo ({hwtw,mytid});
    mytnum = (mycid * 8) + mytid;

    //--------------------
    if (dbg_in) begin // {
    begin // axis tbcall_region
      $write ("SHOW_TLB: ITLB_WRITE C%0d T%0d ",mycid,mytid);
    end

    begin // axis tbcall_region
      if (tte_real==0) $write ("entry=%h V=%b VA=%h ",entry,tte_valid,tte_va);
      else             $write ("entry=%h V=%b RA=%h ",entry,tte_valid,tte_va);
    end

    begin // axis tbcall_region
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
    end
    end // }
    //--------------------

  end // }

end // always}

`endif
//----------------------------------------------------------
endmodule

module dtlb_wr_c7 (dbg_in);
`ifndef GATESIM

parameter NUM_TLB=128;

wire                    [7:0] data_in;
wire                    [7:0] tlb_wr;
wire                          wr_en;
wire                    [7:0] entry;
wire                    [7:0] asi_num;
wire                          asi_enable0;  // 1 per thread group
wire                          asi_enable1;
// wire                    [7:0] store_asi;  // 1 per thread
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
input			dbg_in;

reg         [(`TS_WIDTH-1):0] tstamp;
reg                           hwtw;
// reg                     [7:0] my_asi [0:7];  // 1 asi number stored per thread
reg         [(`TS_WIDTH-1):0] demap_tstamp;

reg                     [2:0] mytid;
reg                     [5:0] mytnum;
wire                    [2:0] mycid;
integer                       junk;
integer                       i;
reg                     [7:0] cnt;

assign   mycid = 7;

//----------------------------------------------------------
// Instantiate fifo - 1 entry per thread
//fifo fifo ();
// Define fifo parameters
`ifndef PALLADIUM
defparam fifo.ENTRY_BITS = 4;  // {hwtw,tid[2:0]}
defparam fifo.DEPTH      = 9;  // 1 extra entry for overflow detection
defparam fifo.PTR_BITS   = 4;
`endif

//----------------------------------------------------------
// DUT probes

assign   data_in = `SPC7.mmu.asi.wrote_dtlb;
assign   tlb_wr = `SPC7.mmu_reload_done;
assign   wr_en = `SPC7.lsu.tlb.tlb_wr_1_in_dout;

assign   entry = `SPC7.lsu.tlb.rw_index_1[6:0];

// assign   asi_num = `PROBES0.asi_num;
// assign   asi_enable0 =  `PROBES0.tlb_rd_vld_b &
//                        !`PROBES0.tlb_bypass_b &
//                        `SPC0.tlu.fls0.lsu_inst_b;
//assign   asi_enable1 =  `PROBES0.tlb_rd_vld_b &
//                        !`PROBES0.tlb_bypass_b &
//                        `SPC0.tlu.fls1.lsu_inst_b;

// assign   store_asi[3:0] = asi_enable0 ? `PROBES0.select_pc_b[3:0] : 4'b0;
// assign   store_asi[7:4] = asi_enable1 ? `PROBES0.select_pc_b[7:4] : 4'b0;


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
assign  tte_ep           = 1'b1;  // Does not apply for DTLB

//----------------------------------------------------------
// Initialize state machine to idle state
initial  begin // {
`ifndef PALLADIUM
  #1;
`endif
  hwtw = 1'b0;
  //for (i=0; i<=7; i=i+1) begin
  // my_asi[i] = 8'b0;
  //end

end // }

//----------------------------------------------------------
// Must use negedge to avoid race condition
// tlb_entry_replace (aka entry) is created in always block using blocking assignments

always @ (negedge `CPU.l2clk) begin // {

  tstamp = `TOP.cycle;
  demap_tstamp = `TOP.cycle;

  // Delay by 1 cycle to align with skip_demap
  demap_tid_1  <= demap_tid;  // demap_tid is active when demap is asserted
  demap_tnum_1 <= (mycid * 8) + demap_tid;
  demap_1      <= demap;

  //----------------------------------------------------------
  //  Send I/DTLBWRITE due to demap
  //

  if ((demap!=0) && (demap_1!=0)) begin // {
    $display("tlb_sync", `ERROR,
       "C%0d T%0d Illegal Back to Back DTLB demap",
        mycid,demap_tid_1);
  end // }

  //if (demap_active) begin // {
   // fifo.pop_fifo ({hwtw,mytid});
  //end //}

  //--------------------
  if (dbg_in & (|demap_1)) begin // {
    begin // axis tbcall_region
      $write ("SHOW_TLB: DTLB_DEMAP C%0d T%0d ",mycid,demap_tid_1);
    end

    if (demap_active) begin
    begin // axis tbcall_region
      case (demap_1)
      4'b0001:  $write ("type=real ");
      4'b0010:  $write ("type=cntx ");
      4'b0100:  $write ("type=page ");
      4'b1000:  $write ("type=all  ");
      default:
          $display ("tlb_sync", `ERROR,
            "Bench Problem - demap_1 should be one-hot.");
       //     "Bench Problem - demap_1(%b) should be one-hot.",demap_1);
      endcase
    end
    end
    else begin
    begin // axis tbcall_region
      $write ("type=autodemap ");
    end
    end

    begin // axis tbcall_region
    $display ("match=%h                ts=%0d",
                tlb_match,demap_tstamp*`TOP.core_period);
    end

    for (cnt=0; cnt<=NUM_TLB; cnt=cnt+1) begin // {
      if (tlb_match[cnt]==1'b1)  begin // {
    begin // axis tbcall_region
        $display ("SHOW_TLB: DTLB_DEMAP C%0d T%0d entry=%h V=0 ts=%0d",
                   mycid,demap_tid_1,cnt,demap_tstamp*`TOP.core_period);
    end
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
 // for (i=0;i<=7;i=i+1) begin // {
 //   my_asi[i] = (store_asi[i]) ? asi_num : my_asi[i];
 // end // }

  // There are 3 main signals to watch for TLBWRITE (data_in, tlb_wr, wr_en)
  // These signals will be interleaved between the threads.
  // Need to queue up the signals over time so they can be processed in order.
  // Each thread will only be doing 1 thing at a time.

  for (i=0;i<=7;i=i+1) begin // {

    // tlb_wr[tid] determines if the write is HWTW or TLBWRITE

    // data_in[tid] determines which thread will write next
    // Use fifo to save the tids of the data_in signals in order

    if (data_in[i]) begin // {
      mytid[2:0] <= i[2:0];
      if (tlb_wr[i]) begin // {
	hwtw <= 1'b1;
        //fifo.push_fifo ({1'b1,i[2:0]}); //  {hwtw,tid[2:0]}
      end // }
      else begin // {
	hwtw <= 1'b0;
        //fifo.push_fifo ({1'b0,i[2:0]}); //  {!hwtw,tid[2:0]}
      end // }
    end // }

  end // }

  //----------------------------------------------------------
  // wr_en means that the write is occurring
  if (wr_en) begin // {
    //fifo.pop_fifo ({hwtw,mytid});
    mytnum = (mycid * 8) + mytid;

    //--------------------
    if (dbg_in) begin // {
    begin // axis tbcall_region
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
  end // }

end // always}

//----------------------------------------------------------
`endif

endmodule
`endif

//----------------------------------------------------------
//----------------------------------------------------------


