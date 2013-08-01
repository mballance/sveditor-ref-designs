// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: pcie_dcm_daemon.v
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
module pcie_dcm_daemon 
       (
         daemon_csrbus_valid,
         daemon_csrbus_mapped,
         daemon_csrbus_wr_data,
         daemon_csrbus_done,
         daemon_csrbus_addr,
         daemon_csrbus_wr,
         daemon_transaction_in_progress,
// synopsys translate_off
           rst_l,
           clk,
           csrbus_read_data,
// synopsys translate_on
         csrbus_valid,
         csrbus_mapped,
         csrbus_wr_data,
         csrbus_done,
         csrbus_addr,
         csrbus_wr
       );

parameter ADDR_WIDTH = 27;
parameter DATA_WIDTH = 64;

// synopsys translate_off
  parameter DAEMON_STATE_IDLE    = 3'd0;
  parameter DAEMON_STATE_RD      = 3'd4; // bit 2 is mux select
  parameter DAEMON_STATE_WR      = 3'd5;
  parameter DAEMON_STATE_WAIT_RD = 3'd6;
  parameter DAEMON_STATE_WAIT_WR = 3'd7;
// synopsys translate_on

output                  daemon_csrbus_valid;
output [DATA_WIDTH-1:0] daemon_csrbus_wr_data;
output [ADDR_WIDTH-1:0] daemon_csrbus_addr;
output                  daemon_csrbus_wr;
output                  daemon_transaction_in_progress;

output                  csrbus_mapped;
output                  csrbus_done;

input                   daemon_csrbus_mapped;
input                   daemon_csrbus_done;

// synopsys translate_off
  input                   rst_l;
  input                   clk;
  input [DATA_WIDTH-1:0]  csrbus_read_data; // needed to return back to daemon task
// synopsys translate_on

input                   csrbus_valid;
input [DATA_WIDTH-1:0]  csrbus_wr_data;
input [ADDR_WIDTH-1:0]  csrbus_addr;
input                   csrbus_wr;


reg                     daemon_csrbus_valid;
reg [ADDR_WIDTH-1:0]    daemon_csrbus_addr;
reg [DATA_WIDTH-1:0]    daemon_csrbus_wr_data;
reg                     daemon_csrbus_wr;

wire                    daemon_transaction_in_progress;
reg                     csrbus_done;
reg                     csrbus_mapped;

// synopsys translate_off

  // inputs/outputs from task
  reg daemon_wr;
  reg daemon_rd;
  reg [ADDR_WIDTH-1:0] daemon_addr;
  reg [DATA_WIDTH-1:0] daemon_wr_data;

  // vlint flag_dangling_net_within_module off
  // vlint flag_net_has_no_load off
    wire [DATA_WIDTH-1:0] daemon_rd_data;
  // vlint flag_net_has_no_load on
  // vlint flag_dangling_net_within_module on

  // registered versions
  reg                   daemon_wr_reg;
  reg                   daemon_rd_reg;
  reg [ADDR_WIDTH-1:0]  daemon_addr_reg;
  reg [DATA_WIDTH-1:0]  daemon_wr_data_reg;
  reg                   daemon_csrbus_done_reg;

  // done signals back to verif

  // vlint flag_dangling_net_within_module off
  // vlint flag_net_has_no_load off
  // vlint flag_variable_assign_never_reference off
  reg                   daemon_rd_done;
  reg                   daemon_wr_done;
  // vlint flag_variable_assign_never_reference on
  // vlint flag_net_has_no_load on
  // vlint flag_dangling_net_within_module on

  // internal wires
  wire                  daemon_starting_transaction;
  wire                  daemon_ok_to_start_transaction;
  wire                  daemon_rd_done_a1;
  wire                  daemon_wr_done_a1;
  reg [2:0]             daemon_state;

  reg                   csrbus_valid_d;

  // vlint flag_dangling_net_within_module off
  // vlint flag_net_has_no_load off
  // vlint flag_variable_assign_never_reference off
  reg [DATA_WIDTH-1:0]  csrbus_read_data_reg;
  // vlint flag_variable_assign_never_reference on
  // vlint flag_net_has_no_load on
  // vlint flag_dangling_net_within_module on

  // vlint flag_unsynthesizable_initial off
    initial
      begin
        daemon_state = DAEMON_STATE_IDLE;
// N2- AT:         daemon_rd = 1'b0;
// N2- AT:         daemon_wr = 1'b0;
        daemon_wr_data = {DATA_WIDTH{1'b0}};
        daemon_addr = {ADDR_WIDTH{1'b0}};
      end // initial begin
  // vlint flag_unsynthesizable_initial on

  always @(posedge clk)
    begin
     if (~rst_l) begin
      daemon_rd_reg 		<= 1'b0;
      daemon_wr_reg 		<= 1'b0;
      daemon_wr_data_reg 	<= {DATA_WIDTH{1'b0}};
      daemon_addr_reg 		<= {ADDR_WIDTH{1'b0}};
      daemon_rd_done 		<= 1'b0;
      daemon_wr_done 		<= 1'b0;
      daemon_csrbus_done_reg 	<= 1'b0;
      daemon_wr 		<= 1'b0;
      daemon_rd 		<= 1'b0;
     end
     else  begin
      daemon_rd_reg 		<= daemon_rd;
      daemon_wr_reg 		<= daemon_wr;
      daemon_wr_data_reg 	<= daemon_wr_data;
      daemon_addr_reg 		<= daemon_addr;
      daemon_rd_done 		<= daemon_rd_done_a1;
      daemon_wr_done 		<= daemon_wr_done_a1;
      daemon_csrbus_done_reg 	<= daemon_csrbus_done;
     end
    end // always @ (posedge clk)

  always @(posedge clk)
    begin
     if (~rst_l )  begin
      csrbus_valid_d <= 1'b0;
      csrbus_read_data_reg <= {DATA_WIDTH{1'b0}};
     end
     else  begin
      csrbus_valid_d <= csrbus_valid;
      csrbus_read_data_reg <= csrbus_read_data;
    end
    end

  always @(posedge clk)
    begin
    if (~rst_l) 
      daemon_state <= DAEMON_STATE_IDLE;
    else  begin
      case (daemon_state)

        DAEMON_STATE_IDLE:
          begin
            if (daemon_rd_reg & daemon_ok_to_start_transaction) // do daemon read
              begin
                if (daemon_csrbus_done_reg)
                  daemon_state <= DAEMON_STATE_WAIT_RD; // zero cycles
                else
                  daemon_state <= DAEMON_STATE_RD; // takes more than zero cycles
              end // if (daemon_rd)

            else if (daemon_wr_reg & daemon_ok_to_start_transaction)
              begin
                if (daemon_csrbus_done_reg)
                  daemon_state <= DAEMON_STATE_WAIT_WR; // less than one cycle
                else
                  daemon_state <= DAEMON_STATE_WR; // slow
              end // if (daemon_wr_reg)

            else
              begin
                daemon_state <= DAEMON_STATE_IDLE; // nothing to do
              end // else: !if(daemon_wr_reg)

           end // case: DAEMON_STATE_IDLE

        DAEMON_STATE_WR: // holds a write until finished
          begin
            if (daemon_csrbus_done_reg) // done or timeout
              begin
                daemon_state <= DAEMON_STATE_WAIT_WR;
              end

            else if (~daemon_wr_reg) // timeout
              begin
                daemon_state <= DAEMON_STATE_WAIT_WR;
              end

            else
              begin
                daemon_state <= DAEMON_STATE_WR; // wait
              end // else: !if(~daemon_wr_reg)

            end

       DAEMON_STATE_RD:
         begin
           if (daemon_csrbus_done_reg) // done
             begin
               daemon_state <= DAEMON_STATE_WAIT_RD;
             end

           else if (~daemon_rd_reg)
             begin
               daemon_state <= DAEMON_STATE_WAIT_RD;
             end

           else
             begin
               daemon_state <= DAEMON_STATE_RD; // wait
             end

          end // case: DAEMON_STATE_RD

        DAEMON_STATE_WAIT_RD:
          begin
            if (daemon_wr_reg & daemon_ok_to_start_transaction)
              begin
                daemon_state <= DAEMON_STATE_WR; // more than one cycle
              end

            else if (daemon_rd_reg & daemon_ok_to_start_transaction)
              begin
                daemon_state <= DAEMON_STATE_RD; // read
              end

            else
              begin
                daemon_state <= DAEMON_STATE_IDLE; // nothing to do, go back to idle
              end

          end // case: DAEMON_STATE_WAIT_RD

        DAEMON_STATE_WAIT_WR:
          begin
            if (daemon_rd_reg & daemon_ok_to_start_transaction) // new rd?
              begin
                daemon_state <= DAEMON_STATE_RD;
              end

            else if (daemon_wr_reg & daemon_ok_to_start_transaction) // new write?
              begin
                daemon_state <= DAEMON_STATE_WR;
              end

            else
              begin
                daemon_state <= DAEMON_STATE_IDLE; // nothing to do, go back to idle
              end

          end // case: DAEMON_STATE_WAIT_WR

        default:
          begin
            daemon_state <= daemon_state;
          end

      endcase // case(daemon_state)
    end
    end // always @ (posedge clk)

    assign daemon_rd_done_a1 =
             (
               (daemon_state == DAEMON_STATE_IDLE) &
               daemon_csrbus_done &
               daemon_rd_reg &
               daemon_ok_to_start_transaction
             )
           |
             (
               (daemon_state == DAEMON_STATE_RD) &
               daemon_csrbus_done
             );

    assign daemon_wr_done_a1 =
             (
               (daemon_state == DAEMON_STATE_IDLE) &
               daemon_csrbus_done &
               daemon_wr_reg &
               ~daemon_rd_reg &
               daemon_ok_to_start_transaction
             )
           |
             (
               (daemon_state == DAEMON_STATE_WR) &
               daemon_csrbus_done
             );



  assign daemon_rd_data = csrbus_read_data_reg;

  assign daemon_ok_to_start_transaction = ~csrbus_valid_d;

  wire   good_starting_state = (daemon_state == DAEMON_STATE_IDLE);

  assign daemon_starting_transaction = good_starting_state &
                                       (daemon_rd_reg | daemon_wr_reg) &
                                       daemon_ok_to_start_transaction;

// synopsys translate_on

// phaser split_component_by_output
always @(csrbus_valid or csrbus_wr or csrbus_wr_data or csrbus_addr or
         daemon_csrbus_done or daemon_csrbus_mapped
// synopsys translate_off
         or
         daemon_state or
         daemon_addr_reg or
         daemon_wr_reg or
         daemon_wr_data_reg or
         daemon_rd_reg or
         daemon_transaction_in_progress
// synopsys translate_on
        )
  begin
// synopsys translate_off
    if (daemon_transaction_in_progress)
      begin
        daemon_csrbus_addr = daemon_addr_reg;
        daemon_csrbus_wr = (daemon_state == DAEMON_STATE_WR) |
                           (
                             (daemon_state == DAEMON_STATE_IDLE) &
                             daemon_wr_reg &
                             ~ daemon_rd_reg
                           );

        daemon_csrbus_wr_data = daemon_wr_data_reg;
        daemon_csrbus_valid = (
                               (daemon_state == DAEMON_STATE_IDLE) &
                          (daemon_rd_reg | daemon_wr_reg)
                         ) |
                              (daemon_state == DAEMON_STATE_WR) |
                              (daemon_state == DAEMON_STATE_RD);
        csrbus_done = 1'b0;
        csrbus_mapped = 1'b0;
      end // if (daemon_state != DAEMON_STATE_IDLE)

    else // normal operation
// synopsys translate_on
      begin
        daemon_csrbus_wr = csrbus_wr;
        daemon_csrbus_wr_data = csrbus_wr_data;
        daemon_csrbus_addr = csrbus_addr;
        daemon_csrbus_valid = csrbus_valid;
        csrbus_done = daemon_csrbus_done;
        csrbus_mapped = daemon_csrbus_mapped;
     end // else: !if(daemon_state != DAEMON_STATE_IDLE)
end // always @ (csrbus_wr...

assign daemon_transaction_in_progress =
         // synopsys translate_off
         ((daemon_state != DAEMON_STATE_IDLE) | daemon_starting_transaction ) ? 1'b1 : 
         // synopsys translate_on
         1'b0;  

endmodule
