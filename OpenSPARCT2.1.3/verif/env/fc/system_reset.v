// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: system_reset.v
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
module system_reset (
		Sysclk,
		Core_clk,
		Ssi_sync_l,
                Tck,
		Button_xir_l,
		Pb_rst_l,
		Pwr_on_rst_l,
		Trst_l,
		Tb_reset,
		Fbdimm_rst,
		niu_reset,
		flush_reset_complete
);

input	Sysclk;
input	Core_clk;
input  	Ssi_sync_l;
input   Tck;
output	Button_xir_l;
output 	Pb_rst_l;
output 	Pwr_on_rst_l;
output	Trst_l;
output	Tb_reset;
output	Fbdimm_rst;
output	niu_reset;
output	flush_reset_complete;


/*
 * stick to old names
 */
wire	sysclk_i     = Sysclk;
wire	core_clk_i   = Core_clk;
wire  	ssi_sync_l_i = Ssi_sync_l;

wire    POR_from_UserEvent; //// vera interface signal mono-shot NR0
wire    PB_RST_from_UserEvent;  // vera interface signal mono-shot NR0

// Note: gOutOfBoot starts out 0 at time 0, then each bit
//       becomes 1 as its thread executes the bootEnd user event.
//       It gets cleared when each thread executes bootStart,
//       NOT when POR/WMR gets asserted.
// NB: Not_in_Boot is monitored by fc_csr_cabinet.v
wire	Not_in_Boot	= (`TOP.gOutOfBoot == `PARGS.finish_mask);

wire    POR_pulse_mux;

reg	button_xir_l_o;
reg 	pb_rst_l_o;
reg 	pwr_on_rst_l_o;
reg	trst_l_o;
reg	tb_reset_o;
reg	fbdimm_rst_o;
reg	niu_reset_o;
reg	flush_reset_complete_o;

integer status;

/*
 * When we do not slam for vectors the complete control for
 * these signals is given to vera and all primary outputs are
 * driven to Z
 */
`ifdef NON_SLAM_VECTORS
    initial begin
	button_xir_l_o         = 1'bz;
 	pb_rst_l_o             = 1'bz;
 	pwr_on_rst_l_o         = 1'bz;
	trst_l_o               = 1'bz;
    end
`endif

/*
 *  A mux is used to turn on user event driven resets,
 *  after the intial POR is done then we can use the
 *  software based resets
 */
reg user_event_por, user_event_pb;
initial begin
if($test$plusargs("SW_RANDOM_PB_RST"))
   user_event_pb =  1;
else
   user_event_pb =  0;
end

initial begin
if($test$plusargs("SW_RANDOM_POR"))
   user_event_por =  1;
else
   user_event_por =  0;
end


/*
 * Flush reset complete is a test bench signal
 */
initial flush_reset_complete_o = 0;
always @(posedge core_clk_i) begin
  if (`CPU.rst_ncu_unpark_thread)
    flush_reset_complete_o=1;
  else if (`CPU.rst_wmr_protect == 1)
    flush_reset_complete_o= 0;
end
// core_clk_i stops during POR, so we cannot use the above loop
// to sample Pwr_on_rst_l (only a problem if there is a second POR)
always @(posedge sysclk_i) begin
  if (Pwr_on_rst_l === 1'b0) // Make sure it isn't X
    flush_reset_complete_o= 0;
end


/*
 * Mission mode & SLAM VECTORS model
 */
/****************************************************************************
 * Drive POR  -- POWER ON RESET
 ****************************************************************************/
integer delay_to_first_POR;
integer delay_between_POR;
integer max_num_injected_POR;
reg     POR_pulse;
reg     start_POR_delay;
event   end_POR_delay;
integer injected_POR_count;
reg     max_injected_POR_count_reached;
integer POR_pulse_width;
integer POR_delay;

// Set up the user-adjustable values for POR
initial begin
    // Set the duration of POR pulse width in SYSCLK cycles
    if (0 == $value$plusargs("POR_pulse_width=%d",POR_pulse_width))
      POR_pulse_width = 2;
    `PR_NORMAL("system_reset", `NORMAL, "PWRON_RST_L pulse width = %d SYSCLK cycles (+POR_pulse_width)", POR_pulse_width);
    // Set the delay in SYSCLK cycles from bootEnd to the first POR
    if (0 == $value$plusargs("delay_to_first_POR=%d", delay_to_first_POR))
      delay_to_first_POR = 200;
    `PR_NORMAL("system_reset", `NORMAL, "Delay to first injected PWRON_RST_L = %d SYSCLK cycles (+delay_to_first_POR)", delay_to_first_POR);
    POR_delay = delay_to_first_POR;
    // Set the delay between PORs in terms of SYSCLK cycles
    if (0 == $value$plusargs("delay_between_POR=%d", delay_between_POR))
      delay_between_POR = 1000;
    `PR_NORMAL("system_reset", `NORMAL, "Additional delay per injected PWRON_RST_L pulse = %d SYSCLK cycles (+delay_between_POR)", delay_between_POR);
    // Set the maximum number of injected PORs; 0=>just initial POR
    if (0 == $value$plusargs("max_num_injected_POR=%d", max_num_injected_POR))
      max_num_injected_POR = 0;
    `PR_NORMAL("system_reset", `NORMAL, "Maximum number of injected PWRON_RST_L pulse = %d (+max_num_injected_POR)", max_num_injected_POR);
    max_injected_POR_count_reached = (max_num_injected_POR == 0);
end // initial begin

initial begin
    injected_POR_count = 0;
    POR_pulse = 0;
    @(negedge sysclk_i); // Wait for first system clock
    POR_pulse <= 1;
    // Wait for TRST_L to assert and deassert
    wait (Trst_l === 1'b0);
    wait (Trst_l === 1'b1);
    #1; // Eliminate any race between posedge Trst_l and negedge Tck
    // Per PRM section  13.9.1, we need to wait for 5 TCKs after TRST_L
    repeat(5) @(negedge Tck);
    #1; // Eliminate any race between negedge Tck and negedge sysclk_i
    repeat(POR_pulse_width) @(negedge sysclk_i); // Deassert on negedge
    POR_pulse <= 0;
    `PR_NORMAL("system_reset", `NORMAL, "Deasserting initial PWRON_RST_L");
    // Generate a POR pulse at end_POR_delay
    forever @(end_POR_delay) begin
        @(negedge sysclk_i); // Always assert on negedge: N2 samples on posedge
        `PR_NORMAL("system_reset", `NORMAL, "Asserting PWRON_RST_L");
        POR_pulse <= 1;
        // Wait for TRST_L to assert and deassert
        wait (Trst_l === 1'b0);
        wait (Trst_l === 1'b1);
        #1; // Eliminate any race between posedge Trst_l and negedge Tck
        // Per PRM section  13.9.1, we need to wait for 5 TCKs after TRST_L
        repeat(5) @(negedge Tck);
        #1; // Eliminate any race between negedge Tck and negedge sysclk_i
        repeat(POR_pulse_width) @(negedge sysclk_i); // Deassert on negedge
        `PR_NORMAL("system_reset", `NORMAL, "Deasserting PWRON_RST_L");
        POR_pulse <= 0;
        injected_POR_count = injected_POR_count + 1;
        if (injected_POR_count == max_num_injected_POR)
          max_injected_POR_count_reached = 1;
    end
end // initial begin


initial begin
    #1; // Wait for any glitches at time=0 to pass
    forever @(posedge start_POR_delay) begin
        repeat(POR_delay) @(posedge sysclk_i);
        -> end_POR_delay;
        // Increase the delay for the next time
        POR_delay = POR_delay + delay_between_POR;
    end
end

// Define the states for the reset injector state machines
parameter START_RESET_COUNTDOWN    = 0;
parameter WAIT_FOR_RESET_COUNTDOWN = 1;
parameter WAIT_FOR_BOOT_CODE_START = 2;
parameter WAIT_FOR_BOOT_CODE_END   = 3;
parameter NO_MORE_INJECTED_RESETS  = 4;

integer POR_state, next_POR_state;
initial begin
    start_POR_delay = 0;
    POR_state = WAIT_FOR_BOOT_CODE_START;
    next_POR_state = WAIT_FOR_BOOT_CODE_START;
end

always @(posedge sysclk_i) begin
   POR_state <= next_POR_state;
end

always @(POR_state or POR_pulse or Not_in_Boot or max_injected_POR_count_reached) begin
    case(POR_state)
        START_RESET_COUNTDOWN: begin
            next_POR_state = WAIT_FOR_RESET_COUNTDOWN;
            start_POR_delay = 1;
        end
        WAIT_FOR_RESET_COUNTDOWN: begin
            start_POR_delay = 0;
            if (POR_pulse)
                next_POR_state = WAIT_FOR_BOOT_CODE_START;
            else
                next_POR_state = WAIT_FOR_RESET_COUNTDOWN;
        end
        WAIT_FOR_BOOT_CODE_START: begin
            // On 2nd POR, Not_in_Boot will remain asserted until
            // the first instruction is executed ("bootStart" user event)
            if (Not_in_Boot)
                next_POR_state = WAIT_FOR_BOOT_CODE_START;
            else
                next_POR_state = WAIT_FOR_BOOT_CODE_END;
        end
        WAIT_FOR_BOOT_CODE_END: begin
            if (Not_in_Boot) begin
                if (max_injected_POR_count_reached) begin
                    next_POR_state = NO_MORE_INJECTED_RESETS;
                end
                else begin
                    next_POR_state = START_RESET_COUNTDOWN;
                end
            end else begin
                next_POR_state =  WAIT_FOR_BOOT_CODE_END;
            end
        end
        NO_MORE_INJECTED_RESETS: begin
           next_POR_state = NO_MORE_INJECTED_RESETS;
        end
    endcase
end

/*
 * TRST asserts on every PWRON, but does not stay asserted as long
 */
always begin
`ifndef USE_JTAG_DRIVER
    `PR_NORMAL("system_reset", `NORMAL, "Asserting TRST_L");
`endif
    trst_l_o <= 1'b0;
    // Wait for TCK to go thru one positive pulse (0->1->0)
    wait (Tck === 1'b0);
    @(negedge Tck);
    // Wait a little bit before deasserting TRST_L
    #1 @(negedge sysclk_i);
`ifndef USE_JTAG_DRIVER
    `PR_NORMAL("system_reset", `NORMAL, "Deasserting TRST_L");
`endif
    trst_l_o <= 1'b1;
    // Done with this cycle.
    // Wait for next POR
    @(negedge Pwr_on_rst_l);
end // always begin


initial
assign pwr_on_rst_l_o = ~POR_pulse;

/*
 * FBDIMM reset is a mono shot reset
 */
reg mono_PWRON_RST_L;
initial begin
   mono_PWRON_RST_L = 0;
   #1; // Wait for any glitches at time=0 to pass
   @(negedge POR_pulse); // Wait for end of first POR
   mono_PWRON_RST_L = 1;
end
assign Fbdimm_rst = mono_PWRON_RST_L;




/***************************************************************************
 * Drive PB reset
 ***************************************************************************/
integer delay_to_first_PB;
integer delay_between_PB;
integer max_num_injected_PB;
reg     PB_pulse;
reg     start_PB_delay;
event   end_PB_delay;
integer injected_PB_count;
reg     max_injected_PB_count_reached;
integer PB_pulse_width;
integer PB_delay;

// Set up the user-adjustable values for PB reset
initial begin
    // Set the duration of PB pulse width in SYSCLK cycles
    if (0 == $value$plusargs("PB_pulse_width=%d",PB_pulse_width))
      PB_pulse_width = 2;
    `PR_NORMAL("system_reset", `NORMAL, "PB_RST_L pulse width = %d SYSCLK cycles (+PB_pulse_width)", PB_pulse_width);
    // Set the delay in SYSCLK cycles from bootEnd to the first PB
    if (0 == $value$plusargs("delay_to_first_PB=%d", delay_to_first_PB))
      delay_to_first_PB = 200;
    `PR_NORMAL("system_reset", `NORMAL, "Delay to first injected PB_RST_L = %d SYSCLK cycles (+delay_to_first_PB)", delay_to_first_PB);
    PB_delay = delay_to_first_PB;
    // Set the delay between PBs in terms of SYSCLK cycles
    if (0 == $value$plusargs("delay_between_PB=%d", delay_between_PB))
      delay_between_PB = 1000;
    `PR_NORMAL("system_reset", `NORMAL, "Additional delay per injected PB_RST_L pulse = %d SYSCLK cycles (+delay_between_PB)", delay_between_PB);
    // Set the maximum number of injected PBs; 0=>no injected PBs
    if (0 == $value$plusargs("max_num_injected_PB=%d", max_num_injected_PB))
      max_num_injected_PB = 0;
    `PR_NORMAL("system_reset", `NORMAL, "Maximum number of injected PB_RST_L pulse = %d (+max_num_injected_PB)", max_num_injected_PB);
    max_injected_PB_count_reached = (max_num_injected_PB == 0);
end // initial begin

initial begin
    injected_PB_count = 0;
    PB_pulse = 0;
    @(negedge sysclk_i); // Wait for first system clock
    // Generate a PB pulse at end_PB_delay
    forever @(end_PB_delay) begin
        @(negedge sysclk_i); // Always assert on negedge: N2 samples on posedge
        `PR_NORMAL("system_reset", `NORMAL, "Asserting PB_RST_L");
        PB_pulse <= 1;
        repeat(PB_pulse_width) @(negedge sysclk_i);
        `PR_NORMAL("system_reset", `NORMAL, "Deasserting PB_RST_L");
        PB_pulse <= 0;
        injected_PB_count = injected_PB_count + 1;
        if (injected_PB_count == max_num_injected_PB)
          max_injected_PB_count_reached = 1;
    end
end // initial begin

initial begin
    #1; // Wait for any glitches at time=0 to pass
    forever @(posedge start_PB_delay) begin
        repeat(PB_delay) @(posedge sysclk_i);
        -> end_PB_delay;
        // Increase the delay for the next time
        PB_delay = PB_delay + delay_between_PB;
    end
end


integer PB_state, next_PB_state;
initial begin
    start_PB_delay = 0;
    PB_state = WAIT_FOR_BOOT_CODE_START;
    next_PB_state = WAIT_FOR_BOOT_CODE_START;
end

always @(posedge sysclk_i) begin
   PB_state <= next_PB_state;
end

always @(PB_state or PB_pulse or Not_in_Boot or max_injected_PB_count_reached) begin
    case(PB_state)
        START_RESET_COUNTDOWN: begin
            next_PB_state = WAIT_FOR_RESET_COUNTDOWN;
            start_PB_delay = 1;
        end
        WAIT_FOR_RESET_COUNTDOWN: begin
            start_PB_delay = 0;
            if (PB_pulse)
                next_PB_state = WAIT_FOR_BOOT_CODE_START;
            else
                next_PB_state = WAIT_FOR_RESET_COUNTDOWN;
        end
        WAIT_FOR_BOOT_CODE_START: begin
            // On 2nd POR, Not_in_Boot will remain asserted until
            // the first instruction is executed ("bootStart" user event)
            if (Not_in_Boot)
                next_PB_state = WAIT_FOR_BOOT_CODE_START;
            else
                next_PB_state = WAIT_FOR_BOOT_CODE_END;
        end
        WAIT_FOR_BOOT_CODE_END: begin
            if (Not_in_Boot) begin
                if (max_injected_PB_count_reached) begin
                    next_PB_state = NO_MORE_INJECTED_RESETS;
                end
                else begin
                    next_PB_state = START_RESET_COUNTDOWN;
                end
            end else begin
                next_PB_state =  WAIT_FOR_BOOT_CODE_END;
            end
        end
        NO_MORE_INJECTED_RESETS: begin
           next_PB_state = NO_MORE_INJECTED_RESETS;
        end
    endcase
end



/***************************************************************************
 * Drive XIR
 ***************************************************************************/
integer delay_to_first_XIR;
integer delay_between_XIR;
integer max_num_injected_XIR;
reg     XIR_pulse;
reg     start_XIR_delay;
event   end_XIR_delay;
integer injected_XIR_count;
reg     max_injected_XIR_count_reached;
integer XIR_pulse_width;
integer XIR_delay;

// Set up the user-adjustable values for XIR reset
initial begin
    // Set the duration of XIR pulse width in SYSCLK cycles
    if (0 == $value$plusargs("XIR_pulse_width=%d",XIR_pulse_width))
      XIR_pulse_width = 2;
    `PR_NORMAL("system_reset", `NORMAL, "BUTTON_XIR_L pulse width = %d SYSCLK cycles (+XIR_pulse_width)", XIR_pulse_width);
    // Set the delay in SYSCLK cycles from bootEnd to the first XIR
    if (0 == $value$plusargs("delay_to_first_XIR=%d", delay_to_first_XIR))
      delay_to_first_XIR = 200;
    `PR_NORMAL("system_reset", `NORMAL, "Delay to first injected BUTTON_XIR_L = %d SYSCLK cycles (+delay_to_first_XIR)", delay_to_first_XIR);
    XIR_delay = delay_to_first_XIR;
    // Set the delay between XIRs in terms of SYSCLK cycles
    if (0 == $value$plusargs("delay_between_XIR=%d", delay_between_XIR))
      delay_between_XIR = 1000;
    `PR_NORMAL("system_reset", `NORMAL, "Additional delay per injected BUTTON_XIR_L pulse = %d SYSCLK cycles (+delay_between_XIR)", delay_between_XIR);
    // Set the maximum number of injected XIRs; 0=>no injected XIRs
    if (0 == $value$plusargs("max_num_injected_XIR=%d", max_num_injected_XIR))
      max_num_injected_XIR = 0;
    `PR_NORMAL("system_reset", `NORMAL, "Maximum number of injected BUTTON_XIR_L pulse = %d (+max_num_injected_XIR)", max_num_injected_XIR);
    max_injected_XIR_count_reached = (max_num_injected_XIR == 0);
end // initial begin

initial begin
    injected_XIR_count = 0;
    XIR_pulse = 0;
    @(negedge sysclk_i); // Wait for first system clock
    // Generate a XIR pulse at end_XIR_delay
    forever @(end_XIR_delay) begin
        @(negedge sysclk_i); // Always assert on negedge: N2 samples on posedge
        `PR_NORMAL("system_reset", `NORMAL, "Asserting BUTTON_XIR_L");
        XIR_pulse <= 1;
        repeat(XIR_pulse_width) @(negedge sysclk_i);
        `PR_NORMAL("system_reset", `NORMAL, "Deasserting BUTTON_XIR_L");
        XIR_pulse <= 0;
        injected_XIR_count = injected_XIR_count + 1;
        if (injected_XIR_count == max_num_injected_XIR)
          max_injected_XIR_count_reached = 1;
    end
end // initial begin

initial begin
    #1; // Wait for any glitches at time=0 to pass
    forever @(posedge start_XIR_delay) begin
        repeat(XIR_delay) @(posedge sysclk_i);
        -> end_XIR_delay;
        // Increase the delay for the next time
        XIR_delay = XIR_delay + delay_between_XIR;
    end
end

integer XIR_state, next_XIR_state;
initial begin
    start_XIR_delay = 0;
    XIR_state = WAIT_FOR_BOOT_CODE_START;
    next_XIR_state = WAIT_FOR_BOOT_CODE_START;
end

always @(posedge sysclk_i) begin
   XIR_state <= next_XIR_state;
end

always @(XIR_state or XIR_pulse or Not_in_Boot or max_injected_XIR_count_reached) begin
    case(XIR_state)
        START_RESET_COUNTDOWN: begin
            next_XIR_state = WAIT_FOR_RESET_COUNTDOWN;
            start_XIR_delay = 1;
        end
        WAIT_FOR_RESET_COUNTDOWN: begin
            start_XIR_delay = 0;
            if (XIR_pulse)
                next_XIR_state = WAIT_FOR_BOOT_CODE_START;
            else
                next_XIR_state = WAIT_FOR_RESET_COUNTDOWN;
        end
        WAIT_FOR_BOOT_CODE_START: begin
            // On 2nd POR, Not_in_Boot will remain asserted until
            // the first instruction is executed ("bootStart" user event)
            if (Not_in_Boot)
                next_XIR_state = WAIT_FOR_BOOT_CODE_START;
            else
                next_XIR_state = WAIT_FOR_BOOT_CODE_END;
        end
        WAIT_FOR_BOOT_CODE_END: begin
            if (Not_in_Boot) begin
                if (max_injected_XIR_count_reached) begin
                    next_XIR_state = NO_MORE_INJECTED_RESETS;
                end
                else begin
                    next_XIR_state = START_RESET_COUNTDOWN;
                end
            end else begin
                next_XIR_state =  WAIT_FOR_BOOT_CODE_END;
            end
        end
        NO_MORE_INJECTED_RESETS: begin
           next_XIR_state = NO_MORE_INJECTED_RESETS;
        end
    endcase
end


/*
 * niu reset   ?? why is it hard coded
 */
initial
begin
                 niu_reset_o = 1'b1;
        #1331844 niu_reset_o = 1'b0;
        #332800  niu_reset_o = 1'b1;
        #665600  niu_reset_o = 1'b0;
end



`ifndef NON_SLAM_VECTORS
assign Button_xir_l  = ~XIR_pulse;
assign Pb_rst_l      = (~PB_pulse) & (~PB_RST_from_UserEvent);
assign Pwr_on_rst_l  = ~POR_pulse_mux;
assign Trst_l        = trst_l_o;
`endif
assign Tb_reset      = ~POR_pulse_mux;
assign niu_reset     = niu_reset_o;
assign flush_reset_complete = flush_reset_complete_o;
/*
 * hold POR pulse low till we get to first POR
 */
assign POR_pulse_mux = mono_PWRON_RST_L ?  POR_pulse:1'b1;


/*
 * Monitor for expected number of resets and if it has not happened then
 * print error messages
 *
 **** CODE REMOVED AT system_reset.v 1.20 ****
 */


endmodule
