// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: dmu_mmu_qcb_qmc.v
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
module dmu_mmu_qcb_qmc 
  (
   clk,				// clock
   rst_l,			// reset
   csr2qcb_ds_a,		// csr debug select a
   csr2qcb_ds_b,		// csr debug select b
   irb2qcb_enq,			// irb srm enqueue
   orb2qcb_full,		// orb isr queue full
   tcb2qcb_hld,			// tcb hold
   tcb2qcb_vld,			// tcb valid bits
   qpc2qmc_vld,			// qpc valid bits
   qrc2qmc_vld,			// qrc valid bits
   qvc2qmc_vld,			// qvc valid bits
   qcb2csr_dbg_a,		// csr debug bus a
   qcb2csr_dbg_b,		// csr debug bus b
   qcb2csr_paq,			// csr physical address queue not empty
   qcb2csr_vaq,			// csr virtual address queue not empty
   qcb2irb_full,		// irb queue full
   qcb2orb_enq,			// orb srm enqueue
   qcb2tcb_hld,			// tcb hold
   qcb2tcb_vld,			// tcb valid
   qmc2qpc_enq,			// qpc enqueue
   qmc2qpc_deq,			// qpc dequeue
   qmc2qrc_enq,			// qrc enqueue
   qmc2qrc_deq,			// qrc dequeue
   qmc2qvc_enq,			// qvc enqueue
   qmc2qvc_deq			// qvc dequeue
   );

// ----------------------------------------------------------------------------
// Ports
// ----------------------------------------------------------------------------
  input					clk;
  input 				rst_l;

  input [`FIRE_DLC_MMU_CSR_DS_BITS]	csr2qcb_ds_a;
  input [`FIRE_DLC_MMU_CSR_DS_BITS]	csr2qcb_ds_b;
  input 				irb2qcb_enq;
  input 				orb2qcb_full;
  input 				tcb2qcb_hld;
  input [`FIRE_DLC_MMU_PLS_DPTH:1] 	tcb2qcb_vld;
  input [`FIRE_DLC_MMU_PAQ_DPTH-1:0] 	qpc2qmc_vld;
  input [`FIRE_DLC_MMU_RDQ_DPTH-1:0] 	qrc2qmc_vld;
  input [`FIRE_DLC_MMU_VAQ_DPTH-1:0] 	qvc2qmc_vld;

  output [`FIRE_DBG_DATA_BITS] 		qcb2csr_dbg_a;
  output [`FIRE_DBG_DATA_BITS] 		qcb2csr_dbg_b;
  output				qcb2csr_paq;
  output				qcb2csr_vaq;
  output				qcb2irb_full;
  output				qcb2orb_enq;
  output				qcb2tcb_hld;
  output				qcb2tcb_vld;
  output				qmc2qpc_enq;
  output				qmc2qpc_deq;
  output				qmc2qrc_enq;
  output				qmc2qrc_deq;
  output				qmc2qvc_enq;
  output				qmc2qvc_deq;

// ----------------------------------------------------------------------------
// Variables
// ----------------------------------------------------------------------------
  wire [`FIRE_DBG_DATA_BITS]		qcb2csr_dbg_a, qcb2csr_dbg_b;

  reg					qcb2orb_enq;
  reg					qcb2tcb_hld;
  reg					deq, nxt_deq;

  reg  [`FIRE_DLC_MMU_CSR_DS_BITS]	dbg_sel [0:1];
  reg  [`FIRE_DBG_DATA_BITS]		dbg_bus [0:1];

  integer i;

// ----------------------------------------------------------------------------
// Combinational
// ----------------------------------------------------------------------------
  wire 	 qcb2csr_paq = qpc2qmc_vld[0];
  wire 	 qcb2csr_vaq = qvc2qmc_vld[0];

  wire 	 vaq_full = qvc2qmc_vld[`FIRE_DLC_MMU_VAQ_DPTH-2];
  wire 	 rdq_full = qrc2qmc_vld[`FIRE_DLC_MMU_RDQ_DPTH-2];

  wire	 qcb2irb_full = vaq_full | rdq_full;

  wire	 enq = tcb2qcb_vld[`FIRE_DLC_MMU_PLS_DPTH];

  always @ (orb2qcb_full or qpc2qmc_vld or enq or deq) begin
    case ({enq, deq}) // synopsys parallel_case
      2'b00 : nxt_deq = qpc2qmc_vld[0] & ~orb2qcb_full;
      2'b01 : nxt_deq = qpc2qmc_vld[1] & ~orb2qcb_full;
      2'b10 : nxt_deq = ~orb2qcb_full;
      2'b11 : nxt_deq = ~orb2qcb_full;
    endcase
  end

  always @ (orb2qcb_full or tcb2qcb_vld or qpc2qmc_vld ) begin
    if (!orb2qcb_full) begin
      qcb2tcb_hld = 1'b0;
    end
    else begin
      case (tcb2qcb_vld) // synopsys parallel_case
	3'b000 : qcb2tcb_hld = 1'b0;
	3'b001 : qcb2tcb_hld = qpc2qmc_vld[3];
	3'b010 : qcb2tcb_hld = qpc2qmc_vld[3];
	3'b011 : qcb2tcb_hld = qpc2qmc_vld[2];
	3'b100 : qcb2tcb_hld = qpc2qmc_vld[3];
	3'b101 : qcb2tcb_hld = qpc2qmc_vld[2];
	3'b110 : qcb2tcb_hld = qpc2qmc_vld[2];
	3'b111 : qcb2tcb_hld = qpc2qmc_vld[1];
      endcase
    end
  end

  wire	 qcb2tcb_vld = qvc2qmc_vld[0];

  wire	 qmc2qpc_enq = enq;

  wire	 qmc2qrc_enq = irb2qcb_enq;
  wire	 qmc2qvc_enq = irb2qcb_enq;

  wire	 qmc2qpc_deq = deq;
  wire	 qmc2qrc_deq = deq;

  wire	 qmc2qvc_deq = qvc2qmc_vld[0] & ~tcb2qcb_hld;

// ----------------------------------------------------------------------------
// Debug
// ----------------------------------------------------------------------------
  always @ (csr2qcb_ds_a or csr2qcb_ds_b) begin
    dbg_sel[0] = csr2qcb_ds_a;
    dbg_sel[1] = csr2qcb_ds_b;
  end

  assign qcb2csr_dbg_a = dbg_bus[0];
  assign qcb2csr_dbg_b = dbg_bus[1];

// ----------------------------------------------------------------------------
// Sequential
// ----------------------------------------------------------------------------
  always @ (posedge clk) begin
    if (!rst_l) begin
      qcb2orb_enq <= 0;
      deq         <= 0;
    end
    else begin
      qcb2orb_enq <= nxt_deq;
      deq         <= nxt_deq;
    end
  end

  always @ (posedge clk) 
	if(~rst_l) begin : dbg_rst
	   integer j;
    for (j = 0; j < 2; j = j + 1) begin
	dbg_bus[j] <= 8'h00;
	end
      end
	else begin
    for (i = 0; i < 2; i = i + 1) begin
      case (dbg_sel[i]) // synopsys infer_mux
	3'b000: dbg_bus[i] <= { qpc2qmc_vld, qvc2qmc_vld };
	3'b001: dbg_bus[i] <= qrc2qmc_vld;
	3'b010: dbg_bus[i] <= 8'h00;
	3'b011: dbg_bus[i] <= 8'h00;
	3'b100: dbg_bus[i] <= 8'h00;
	3'b101: dbg_bus[i] <= 8'h00;
	3'b110: dbg_bus[i] <= 8'h00;
	3'b111: dbg_bus[i] <= 8'h00;
      endcase
    end
  end

endmodule // dmu_mmu_qcb_qmc
