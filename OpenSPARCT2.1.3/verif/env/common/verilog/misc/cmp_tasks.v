// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: cmp_tasks.v
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
`include "cmp.vri"

// CMP registers //

// RO. fuses in sets of 8, based on cores built into model.
reg [63:0] cmp_core_avail;

// RO. done is sets of 8. always has 0's where cores are not avail.
// Takes value of cmp_core_enable at deassertion of warm reset (after POR).
reg [63:0] cmp_core_enable_status; 

// R/W. must be done in sets of 8. only effective after warm reset/POR. 
// disable a core (make invisible). NOT PARKING. 
// Logic must not allow all threads to be disabled. No self disable.
reg [63:0] cmp_core_enable;

// R/W. will initially take the value of th_check_enable plusarg.
// After that, th_check_enable will follow the value of this reg *after* thread parks.
// Parks threads. Can not park self. No self parking. Any thread
// that is either not avail or is disabled, will also be forced parked.
// After sys reset, lowest enabled thread will always be unparked, others parked.
// This is done in Vera code.
reg [63:0] cmp_core_running_rw;
reg diag_change_core_running;
// Note: th_check_enable and cmp_core_running_rw are essentially the same.

// RW. which threads get XIR. Any thread
// that is either not avail or is disabled, will also be forced off.
// Takes value of cmp_core_enable at deassertion of warm reset (after POR).
// Writes are to be 'anded' with cmp_cone_enable ..
reg [63:0] cmp_xir_steering;

// RW. 
reg ncu_cmp_tick_enable;

// misc NCU registers imlemented in HW so they can drive the core
reg [63:0] asi_power_throttle;
reg asi_wmr_vec_mask; // preserve accross warm reset
reg asi_l2_idx_hash_en;
reg [63:0] asi_reset_stat;

// DUT will drive high as needed. We read this wire as a register.
wire [63:0] cmp_core_running_status;

// signal that an ASI was read (for Riesling)
reg asi_read_edge;
reg [25:0] asi_read_addr;
reg [63:0] asi_read_data;
reg [5:0] asi_read_tid;

	wire			cmp_gclk_c3_spc0;
	wire			cmp_gclk_c3_spc1;
	wire			cmp_gclk_c3_spc2;
	wire			cmp_gclk_c3_spc3;
	wire			cmp_gclk_c3_spc4;
	wire			cmp_gclk_c3_spc5;
	wire			cmp_gclk_c3_spc6;
	wire			cmp_gclk_c3_spc7;
	wire			gl_spc0_clk_stop;
	wire			gl_spc1_clk_stop;
	wire			gl_spc2_clk_stop;
	wire			gl_spc3_clk_stop;
	wire			gl_spc4_clk_stop;
	wire			gl_spc5_clk_stop;
	wire			gl_spc6_clk_stop;
	wire			gl_spc7_clk_stop;
	wire			cmp_gclk_c2_ccx_left;
	wire			cmp_gclk_c2_ccx_right;
	wire			gl_ccx_clk_stop_left;
	wire			gl_ccx_clk_stop_right;
	wire			cmp_gclk_c3_l2d0;
	wire			cmp_gclk_c3_l2d1;
	wire			cmp_gclk_c3_l2d2;
	wire			cmp_gclk_c3_l2d3;
	wire			cmp_gclk_c3_l2d4;
	wire			cmp_gclk_c3_l2d5;
	wire			cmp_gclk_c3_l2d6;
	wire			cmp_gclk_c3_l2d7;
	wire			gl_l2d0_clk_stop;
	wire			gl_l2d1_clk_stop;
	wire			gl_l2d2_clk_stop;
	wire			gl_l2d3_clk_stop;
	wire			gl_l2d4_clk_stop;
	wire			gl_l2d5_clk_stop;
	wire			gl_l2d6_clk_stop;
	wire			gl_l2d7_clk_stop;
	wire			cmp_gclk_c3_l2t0;
	wire			cmp_gclk_c3_l2t1;
	wire			cmp_gclk_c3_l2t2;
	wire			cmp_gclk_c3_l2t3;
	wire			cmp_gclk_c3_l2t4;
	wire			cmp_gclk_c3_l2t5;
	wire			cmp_gclk_c3_l2t6;
	wire			cmp_gclk_c3_l2t7;
	wire			gl_l2t0_clk_stop;
	wire			gl_l2t1_clk_stop;
	wire			gl_l2t2_clk_stop;
	wire			gl_l2t3_clk_stop;
	wire			gl_l2t4_clk_stop;
	wire			gl_l2t5_clk_stop;
	wire			gl_l2t6_clk_stop;
	wire			gl_l2t7_clk_stop;


//----------------------------------------------------------
// Initialize registers
initial
begin

  // do not init anything here that gets set by a +arg, do it in verif_args.v
  asi_wmr_vec_mask = 0; // preserve accross warm reset
  asi_l2_idx_hash_en = 0;
  ncu_cmp_tick_enable = 1;
  cmp_core_running_rw = 64'h0;
  diag_change_core_running = 0;
  cmp_core_avail          = 64'h0;
  cmp_core_enable         = 64'h0;
  asi_reset_stat = 4;

  `ifdef CORE_0
  cmp_core_avail = cmp_core_avail | 64'h00000000_000000ff;
  cmp_core_enable = cmp_core_enable | 64'h00000000_000000ff;
  `endif

  `ifdef CORE_1
      cmp_core_avail = cmp_core_avail | 64'h00000000_0000ff00;       
      cmp_core_enable = cmp_core_enable | 64'h00000000_0000ff00;     
  `endif

  `ifdef CORE_2
      cmp_core_avail = cmp_core_avail | 64'h00000000_00ff0000;       
      cmp_core_enable = cmp_core_enable | 64'h00000000_00ff0000;     
  `endif

  `ifdef CORE_3
      cmp_core_avail = cmp_core_avail | 64'h00000000_ff000000;       
      cmp_core_enable = cmp_core_enable | 64'h00000000_ff000000;     
  `endif

  `ifdef CORE_4
      cmp_core_avail = cmp_core_avail | 64'h000000ff_00000000;       
      cmp_core_enable = cmp_core_enable | 64'h000000ff_00000000;     
  `endif

  `ifdef CORE_5
      cmp_core_avail = cmp_core_avail | 64'h0000ff00_00000000;       
      cmp_core_enable = cmp_core_enable | 64'h0000ff00_00000000;     
  `endif

  `ifdef CORE_6
      cmp_core_avail = cmp_core_avail | 64'h00ff0000_00000000;       
      cmp_core_enable = cmp_core_enable | 64'h00ff0000_00000000;     
  `endif

  `ifdef CORE_7
      cmp_core_avail = cmp_core_avail | 64'hff000000_00000000;       
      cmp_core_enable = cmp_core_enable | 64'hff000000_00000000;     
  `endif

  // Takes value of cmp_core_enable at deassertion of warm reset (after POR).
  cmp_xir_steering = cmp_core_enable;
  cmp_core_enable_status = cmp_core_enable;

  asi_read_edge = 1'b0;
  asi_read_addr = 26'b0;
  asi_read_data = 64'b0;
  asi_read_tid = 6'b0;

  //--------------------
  // Time must pass so that there is not a race condition with +args
  @ (posedge `SYSTEMCLOCK);
  asi_l2_idx_hash_en = `PARGS.hash_on;

end // initial


//----------------------------------------------------------
// cmp_core_enable_status takes value of cmp_core_enable at 
// deassertion of warm reset (after POR). just do this for now.
always @(cmp_core_enable[63:0])
begin
  cmp_core_enable_status[63:0] = cmp_core_enable[63:0];
end


assign (weak0, weak1) `CPU.tcu_do_mode = 0;
assign (weak0, weak1) `CPU.tcu_ss_mode = 0;


// The reset source bits in this register are writable to allow software to
// clear them after the chip reset sequence is complete, in order for virtual
// core warm resets to be distinguished from chip resets. HW will copy the
// current reset status into a shadow status whenever a warm reset occurs.
// 
// Field Bit  Initial Value R/W Description 
// RSVD0 63:12 0 RO Reserved 
// FREQ_S 11   0 RO Shadow status of FREQ 
// POR_S 10    0 RO Shadow status of POR 
// WMR_S 9     0 RO Shadow status of WMR 
// RSVD1 8:5   0 RO Reserved 
// RSVD2 4     0 R/W Reserved 
// FREQ  3     0 R/W Set to one if the reset is a warm reset that changed frequency. 
// POR   2     1 R/W Set to one if the reset is from PWRON_RST_L pin. 
// WMR   1     0 R/W Set to one if the reset is from the WRM_RST pin.
always @(posedge `TOP.cpu.rst_wmr_protect) begin
  asi_reset_stat[11:9] = asi_reset_stat[3:1];
  asi_reset_stat[1] = 1;
end


/////////////////////////////////////////////////////////////////
// Make assigns weak so that other assigns (Vera) can over-ride
/////////////////////////////////////////////////////////////////


// not core specific
`ifdef EMUL_COSIM
  initial force `CPU.ncu_cmp_tick_enable = 1;
  initial force `CPU.ncu_spc0_core_enable_status = &cmp_core_enable_status[7:0];
  initial force `CPU.ncu_spc1_core_enable_status = &cmp_core_enable_status[15:8];
  initial force `CPU.ncu_spc2_core_enable_status = &cmp_core_enable_status[23:16];
  initial force `CPU.ncu_spc3_core_enable_status = &cmp_core_enable_status[31:24];
  initial force `CPU.ncu_spc4_core_enable_status = &cmp_core_enable_status[39:32];
  initial force `CPU.ncu_spc5_core_enable_status = &cmp_core_enable_status[47:40];
  initial force `CPU.ncu_spc6_core_enable_status = &cmp_core_enable_status[55:48];
  initial force `CPU.ncu_spc7_core_enable_status = &cmp_core_enable_status[63:56];
  initial force `CPU.mio_spc_pwr_throttle_0[2:0] = 0;
  initial force `CPU.mio_spc_pwr_throttle_1[2:0] = 0;
  initial force `CPU.ncu_spc_l2_idx_hash_en = 0;
  initial force `CPU.ncu_wmr_vec_mask = 0;
  initial force `CPU.tcu_do_mode[7:0] = 0;
  initial force `CPU.tcu_ss_mode[7:0] = 0;
`else
  // from ncu_cmp_tick_enable register
  assign (weak0, weak1) `CPU.ncu_cmp_tick_enable = ncu_cmp_tick_enable;
  assign (weak0, weak1) `CPU.ncu_spc0_core_enable_status = &cmp_core_enable_status[7:0];
  assign (weak0, weak1) `CPU.ncu_spc1_core_enable_status = &cmp_core_enable_status[15:8];
  assign (weak0, weak1) `CPU.ncu_spc2_core_enable_status = &cmp_core_enable_status[23:16];
  assign (weak0, weak1) `CPU.ncu_spc3_core_enable_status = &cmp_core_enable_status[31:24];
  assign (weak0, weak1) `CPU.ncu_spc4_core_enable_status = &cmp_core_enable_status[39:32];
  assign (weak0, weak1) `CPU.ncu_spc5_core_enable_status = &cmp_core_enable_status[47:40];
  assign (weak0, weak1) `CPU.ncu_spc6_core_enable_status = &cmp_core_enable_status[55:48];
  assign (weak0, weak1) `CPU.ncu_spc7_core_enable_status = &cmp_core_enable_status[63:56];
  assign (weak0, weak1) `CPU.mio_spc_pwr_throttle_0[2:0] = asi_power_throttle[2:0];
  assign (weak0, weak1) `CPU.mio_spc_pwr_throttle_1[2:0] = asi_power_throttle[5:3];
  assign (weak0, weak1) `CPU.ncu_spc_l2_idx_hash_en = asi_l2_idx_hash_en;

// `ifdef CMP
// `ifdef NOL2RTL
//   assign (weak0, weak1) `CPU.ncu_spc_l2_idx_hash_en_t7lff = asi_l2_idx_hash_en;
// `endif
// `endif

  assign (weak0, weak1) `CPU.ncu_wmr_vec_mask = asi_wmr_vec_mask;
  assign (weak0, weak1)  cmp_core_running_status = 0;
`endif


`ifdef CORE_0
  `ifdef EMUL_COSIM
    initial force `CPU.ncu_spc0_core_running[7:0] = cmp_core_running_rw[7:0];
  `else
    assign `CPU.ncu_spc0_core_running[7:0] = cmp_core_running_rw[7:0];
  `endif
  assign cmp_core_running_status[7:0] = `CPU.spc0_ncu_core_running_status[7:0];
`else 
  assign cmp_core_running_status[7:0] = 8'h0;
`endif


`ifdef CORE_1
  `ifdef EMUL_COSIM
    initial force `CPU.ncu_spc1_core_running[7:0] = cmp_core_running_rw[15:8];
  `else
    assign `CPU.ncu_spc1_core_running[7:0] = cmp_core_running_rw[15:8];
  `endif
  assign cmp_core_running_status[15:8] = `CPU.spc1_ncu_core_running_status[7:0];
`else 
  assign cmp_core_running_status[15:8] = 8'h0;
`endif


`ifdef CORE_2
  `ifdef EMUL_COSIM
    initial force `CPU.ncu_spc2_core_running[7:0] = cmp_core_running_rw[23:16];
  `else
    assign `CPU.ncu_spc2_core_running[7:0] = cmp_core_running_rw[23:16];
  `endif
  assign cmp_core_running_status[23:16] = `CPU.spc2_ncu_core_running_status[7:0];
`else 
  assign cmp_core_running_status[23:16] = 8'h0;
`endif


`ifdef CORE_3
  `ifdef EMUL_COSIM
    initial force `CPU.ncu_spc3_core_running[7:0] = cmp_core_running_rw[31:24];
  `else
    assign `CPU.ncu_spc3_core_running[7:0] = cmp_core_running_rw[31:24];
  `endif
  assign cmp_core_running_status[31:24] = `CPU.spc3_ncu_core_running_status[7:0];
`else 
  assign cmp_core_running_status[31:24] = 8'h0;
`endif


`ifdef CORE_4
  `ifdef EMUL_COSIM
    initial force `CPU.ncu_spc4_core_running[7:0] = cmp_core_running_rw[39:32];
  `else
    assign `CPU.ncu_spc4_core_running[7:0] = cmp_core_running_rw[39:32];
  `endif
  assign cmp_core_running_status[39:32] = `CPU.spc4_ncu_core_running_status[7:0];
`else 
  assign cmp_core_running_status[39:32] = 8'h0;
`endif


`ifdef CORE_5
  `ifdef EMUL_COSIM
    initial force `CPU.ncu_spc5_core_running[7:0] = cmp_core_running_rw[47:40];
  `else
    assign `CPU.ncu_spc5_core_running[7:0] = cmp_core_running_rw[47:40];
  `endif
  assign cmp_core_running_status[47:40] = `CPU.spc5_ncu_core_running_status[7:0];
`else 
  assign cmp_core_running_status[47:40] = 8'h0;
`endif


`ifdef CORE_6
  `ifdef EMUL_COSIM
    initial force `CPU.ncu_spc6_core_running[7:0] = cmp_core_running_rw[55:48];
  `else
    assign `CPU.ncu_spc6_core_running[7:0] = cmp_core_running_rw[55:48];
  `endif
  assign cmp_core_running_status[55:48] = `CPU.spc6_ncu_core_running_status[7:0];
`else 
  assign cmp_core_running_status[55:48] = 8'h0;
`endif


`ifdef CORE_7
  `ifdef EMUL_COSIM
    initial force `CPU.ncu_spc7_core_running[7:0] = cmp_core_running_rw[63:56];
  `else
    assign `CPU.ncu_spc7_core_running[7:0] = cmp_core_running_rw[63:56];
  `endif
  assign cmp_core_running_status[63:56] = `CPU.spc7_ncu_core_running_status[7:0];
`else 
  assign cmp_core_running_status[63:56] = 8'h0;
`endif

`ifdef CMP_BENCH
`ifndef CORE_0 initial force `CPU.ncu_spc0_core_running[7:0] = 0; `endif
`ifndef CORE_1 initial force `CPU.ncu_spc1_core_running[7:0] = 0; `endif
`ifndef CORE_2 initial force `CPU.ncu_spc2_core_running[7:0] = 0; `endif
`ifndef CORE_3 initial force `CPU.ncu_spc3_core_running[7:0] = 0; `endif
`ifndef CORE_4 initial force `CPU.ncu_spc4_core_running[7:0] = 0; `endif
`ifndef CORE_5 initial force `CPU.ncu_spc5_core_running[7:0] = 0; `endif
`ifndef CORE_6 initial force `CPU.ncu_spc6_core_running[7:0] = 0; `endif
`ifndef CORE_7 initial force `CPU.ncu_spc7_core_running[7:0] = 0; `endif
`endif

//----------------------------------------------------------
// Read CMP (or any NCU) registers (task called by Vera)
  task read_cmp_reg;
  input  [31:0] addr;
  inout  [63:0] data;
  input  [5:0] tid;

  reg read_error;

  begin // {

    read_error = 0;
    data = 0;

    if (addr[`IO_ASI_ADDR_REG] == `ASI_CMP_CORE) begin // { 
      case (addr[`IO_ASI_ADDR_VA]) // {
        `ASI_CMP_CORE_AVAIL:
          begin // {
            // RO. fuses in sets of 8, based on cores built into model.
            data = cmp_core_avail;
          end // }
        `ASI_CMP_CORE_ENABLE_STATUS:
          begin // {
            // RO. done is sets of 8. always has 0's where cores are not avail.
            // Takes value of cmp_core_enable at deassertion of warm reset (after POR).
            data = cmp_core_enable_status;
          end // }
        `ASI_CMP_CORE_ENABLE:
          begin // {
            // R/W. must be done in sets of 8. only effective after warm reset/POR. 
            // disable a core (make invisible). NOT PARKING. 
            // Logic must not allow all threads to be disabled. No self disable.
            data = cmp_core_enable;
          end // }
        `ASI_CMP_XIR_STEERING:
          begin // {
            data = cmp_xir_steering;
          end // }
        `ASI_CMP_CORE_RUNNING_RW:
          begin // {
            // R/W. will initially take the value of th_check_enable plusarg.
            // After that, th_check_enable will follow the value of this reg *after* thread parks.
            // Parks threads. Can not park self. No self parking. Any thread
            // that is either not avail or is disabled, will also be forced parked on RD.
            // After sys reset, lowest enabled thread will always be unparked, others parked.
            data = cmp_core_running_rw;
          end // }
        `ASI_CMP_CORE_RUNNING_STATUS:
          begin // {
            // DUT will drive high as needed. We read this wire as a register.
            data = cmp_core_running_status;
          end // }
        `ASI_CMP_CORE_RUNNING_W1C:
          begin // {
            data = 64'h0;
           `PR_NORMAL ("top", `NORMAL, "LD to WRITE-only register.  Returning 0's");
          end // }
        `ASI_CMP_CORE_RUNNING_W1S:
          begin // {
            data = 64'h0;
           `PR_NORMAL ("top", `NORMAL, "LD to WRITE-only register.  Returning 0's");
          end // }
        `ASI_CMP_TICK_ENABLE:
          begin // {
            data = `CPU.ncu_cmp_tick_enable;           
          end // }
        default:
          begin // {
           `PR_ERROR ("top", `ERROR, "Attempt to LD to invalid VA (%h) for CMP register",addr[`IO_ASI_ADDR_VA]);
           read_error = 1;
          end // }
      endcase // }
    end // }

    // not a cmp reg
    else begin
      case (addr[`IO_ASI_ADDR_ADR]) // {
        `ASI_POWER_THROTTLE_ADR: 
          begin
            data = asi_power_throttle;
          end

        `ASI_WMR_VEC_MASK_ADR: 
          begin
            data = asi_wmr_vec_mask;
          end

        `ASI_L2_IDX_HASH_EN_ADR:
          begin
            data[0] = asi_l2_idx_hash_en;
          end

        (`ASI_RESET_STAT & 32'hffffffff):
          begin
            data = asi_reset_stat;
          end

        default:
          begin // {
           `PR_ERROR ("top", `ERROR, "Attempt to LD to invalid tb_top I/O register (%h)",addr);
           read_error = 1;
          end // }

      endcase
    end



    `PR_INFO ("top", `INFO, "LD CMP Reg.  asi=%h  VA=%h  reg_value=%h",
              addr[`IO_ASI_ADDR_REG],addr[`IO_ASI_ADDR_VA],data);

    if (!read_error) begin
      // signal that the reg was read
      asi_read_edge = ~asi_read_edge;    // for @(asi_read_edge)
      asi_read_addr = addr[`IO_ASI_ADDR_ADR]; // addr[25:0] (addr[39:32] will always be 8'h90)
      asi_read_data = data;              // data[63:0]
      asi_read_tid = tid;
    end
  end // }
endtask

//----------------------------------------------------------
// Write CMP (or any NCU) registers (task called by Vera)
task write_cmp_reg;
  input [31:0] addr;
  input [63:0] data;
  input [6:0] tid;

  reg   [63:0] reg_data;
  integer i;
  reg debugMode; // use to force a thread to park self

  begin // {

    // if requesting thread is 1ff then set debugMode. this
    // is a special 'back door' case to allow the SPC bench to park
    // all threads for debug logic testing.
    if (tid == 7'h7f) debugMode = 1;
    else debugMode = 0;

    if (addr[`IO_ASI_ADDR_REG] == `ASI_CMP_CORE) begin // {
      case (addr[`IO_ASI_ADDR_VA]) // {
        `ASI_CMP_CORE_AVAIL:
          begin // {
           // RO. fuses in sets of 8, based on cores built into model.
           reg_data = cmp_core_avail;
           `PR_NORMAL ("top", `NORMAL, "ST to READ-only register.  Value will not change");
          end // }
        `ASI_CMP_CORE_ENABLE_STATUS:
          begin // {
           // RO. done is sets of 8. always has 0's where cores are not avail.
           // Takes value of cmp_core_enable at deassertion of warm reset (after POR).
           reg_data = cmp_core_enable_status;
           `PR_NORMAL ("top", `NORMAL, "ST to READ-only register.  Value will not change");
          end // }
        `ASI_CMP_CORE_ENABLE:
          begin // {
            reg_data[63:0] = 0;

            // R/W. must be done in sets of 8. only effective after warm reset/POR. 
            // disable a core (make invisible). NOT PARKING. 
            // Logic must not allow all threads to be disabled. No self disable.

            // make into sets of 8 and only if core exists
            if (cmp_core_avail[63:54] & data[63:54]) reg_data[63:54] = 8'hff;
            if (cmp_core_avail[53:48] & data[53:48]) reg_data[53:48] = 8'hff;
            if (cmp_core_avail[47:40] & data[47:40]) reg_data[47:40] = 8'hff;
            if (cmp_core_avail[39:32] & data[39:32]) reg_data[39:32] = 8'hff;
            if (cmp_core_avail[31:24] & data[31:24]) reg_data[31:24] = 8'hff;
            if (cmp_core_avail[23:16] & data[23:16]) reg_data[23:16] = 8'hff;
            if (cmp_core_avail[15:8] & data[15:8]) reg_data[15:8] = 8'hff;
            if (cmp_core_avail[7:0] & data[7:0]) reg_data[7:0] = 8'hff;

            // the core that called this stays on unless core 0 is on?
            //if (!cmp_core_enable[7:0]) reg_data[63:0] = reg_data[63:0] | (64'hff << tid[5:3]);
            // the core that called this always stays on if data=0.
            if (reg_data[63:0] == 64'h0) reg_data[63:0] = reg_data[63:0] | (64'hff << tid[5:3]);
            cmp_core_enable[63:0] = reg_data[63:0];
            if (!debugMode) diag_change_core_running = ~diag_change_core_running;
          end // }
        `ASI_CMP_XIR_STEERING:
          begin // {
            cmp_xir_steering = data & cmp_core_enable;
            //reg_data = data;
          end // }
        `ASI_CMP_CORE_RUNNING_RW:
          begin // {

              // R/W. will initially take the value of th_check_enable plusarg.
              // After that, th_check_enable will follow the value of reg *after* thread parks.
              // Parks threads. Can not park self if that is only thread running. Any thread
              // that is either not avail or is disabled, will also appear parked on RD/WR.
              // After sys reset, lowest enabled thread will normaly be unparked.
              reg_data = data;

              // the thread that called this ALWAYS stays on if no others would be left on.
              // Can not have all threads parked via software.
              if ((reg_data & cmp_core_enable & cmp_core_avail) == 0 && debugMode !== 1'b1)
                reg_data[tid] = 1;

              // Any thread that is either not avail or is disabled, will also be forced parked.
              reg_data = reg_data & cmp_core_enable & cmp_core_avail;

              cmp_core_running_rw = reg_data;
              if (!debugMode) diag_change_core_running = ~diag_change_core_running;
          end // }
        `ASI_CMP_CORE_RUNNING_STATUS:
          begin // {
            //reg_data = cmp_core_running_status;
           `PR_NORMAL ("top", `NORMAL, "ST to READ-only register.  Value will not change");
          end // }
        `ASI_CMP_CORE_RUNNING_W1S:
          begin // {
            // Any thread that is either not avail or is disabled, will also be forced parked.
            reg_data = data & cmp_core_enable & cmp_core_avail;
            reg_data = cmp_core_running_rw | reg_data;
            cmp_core_running_rw = reg_data;
            if (!debugMode) diag_change_core_running = ~diag_change_core_running;
          end // }
        `ASI_CMP_CORE_RUNNING_W1C:
          begin // {
            reg_data = cmp_core_running_rw & ~data;
            // the thread that called this ALWAYS stays on if all threads would be parked.
            // Can not park self if parking all.
            if (reg_data[63:0] == 64'h0 && debugMode !== 1'b1) reg_data[tid] = 1;
            cmp_core_running_rw = reg_data;
            if (!debugMode) diag_change_core_running = ~diag_change_core_running;
          end // }
        `ASI_CMP_TICK_ENABLE:
          begin // {
            ncu_cmp_tick_enable = data[0];
          end // }
        default:
          begin // {
           `PR_ERROR ("top", `ERROR, "Attempt to ST to invalid VA (%h) for CMP register",addr[`IO_ASI_ADDR_VA]);
          end // }
      endcase // }
    end // }

    // not a cmp reg
    else begin
      case (addr[`IO_ASI_ADDR_ADR]) // {
        `ASI_POWER_THROTTLE_ADR: 
          begin
            asi_power_throttle = data;
          end

        `ASI_WMR_VEC_MASK_ADR: 
          begin
            asi_wmr_vec_mask = data[0];
          end

        `ASI_L2_IDX_HASH_EN_ADR:
          begin
            asi_l2_idx_hash_en = data[0];
          end

        (`ASI_RESET_STAT & 32'hffffffff):
          begin
            asi_reset_stat = data & 64'he;
          end

        default:
          begin // {
           `PR_ERROR ("top", `ERROR, "Attempt to ST to invalid tb_top I/O register (%h)",addr);
          end // }

      endcase
    end


    `PR_INFO ("top", `INFO, "ST CMP Reg.  asi=%h  VA=%h  reg_value=%h",addr[`IO_ASI_ADDR_REG],addr[`IO_ASI_ADDR_VA],reg_data);
  end // }
endtask

