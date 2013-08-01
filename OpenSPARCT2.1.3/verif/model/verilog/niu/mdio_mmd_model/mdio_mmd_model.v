// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: mdio_mmd_model.v
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
`include "mdio_model_defines.vh"
module mdio_mmd_model (reset, mdc, mdio_in, mdio_out, mdio_en);
input		reset;
input		mdc;
input		mdio_in;
output		mdio_out;
output		mdio_en;

wire		mdio_en_id_match_pre;
wire		mdio_en_id_match_post;
wire		mdio_en = mdio_en_id_match_post;
wire		mdio_out;
reg		mdio_d;

integer		bit_cnt;
integer		bit_cnt_preamble;
integer		bit_cnt_read;
reg	[3:0]	state;
reg	[3:0]	next_state;

reg	[1:0]	st;
reg	[1:0]	op;
reg	[4:0]	prtad;
reg	[4:0]	phyad;
reg	[4:0]	devad;
reg	[4:0]	regad;
reg	[15:0]	addr;
reg	[1:0]	ta;
reg	[15:0]	data;
reg		write_en_22;
reg		write_en_45;
reg	[15:0]	read_data;

// storage
reg	[15:0]	memory	[65535:0]; // supports upto 64K registers
// debug
wire	[15:0]	memory0 = memory[0];
wire	[15:0]	memory1 = memory[1];
wire	[15:0]	memory2 = memory[2];
wire	[15:0]	memory3 = memory[3];
wire	[15:0]	memory4 = memory[4];
wire	[15:0]	memory5 = memory[5];
wire	[15:0]	memory6 = memory[6];
wire	[15:0]	memory7 = memory[7];
wire	[15:0]	memory8 = memory[8];
wire	[15:0]	memory9 = memory[9];
wire	[15:0]	memory100 = memory[100];
wire	[15:0]	memory200 = memory[200];

parameter	MY_PRT_ID = `MDIO_MMD_MODEL_PRT_ID;
parameter	MY_PHY_ID = `MDIO_MMD_MODEL_PHY_ID;
parameter	MY_DEV_ID = `MDIO_MMD_MODEL_DEV_ID;

parameter
		IDLE 	= 0,
		PREAMBLE= 1,
		ST	= 2,
		OP	= 3,
		PRTAD	= 4,
		PHYAD	= 5,
		DEVAD	= 6,
		REGAD	= 7,
		TA	= 8,
		ADDR	= 9,
		DATA_RD	= 10,
		DATA_RDP= 11,
		DATA_WR	= 12;

assign		mdio_out = ((next_state == DATA_RD | next_state == DATA_RDP) && 
                            (bit_cnt_read == 17) && (op[1] == 1'b1)) ?
                             1'bz : ((next_state == DATA_RD | next_state == DATA_RDP) && 
		                     (bit_cnt_read == 16) && (op[1] == 1'b1)) ?
		                     1'b0 : ((next_state == DATA_RD | next_state == DATA_RDP | 
		                             state == DATA_RD | state == DATA_RDP) && 
					     (op[1] == 1'b1)) ?
		                             read_data[bit_cnt_read] : 1'bz;

assign	mdio_en_id_match_pre = ((next_state == DATA_RD | next_state == DATA_RDP) && 
                            (bit_cnt_read == 17) && (op[1] == 1'b1)) ?
                             1'b1 : ((next_state == DATA_RD | next_state == DATA_RDP) && 
		                     (bit_cnt_read == 16) && (op[1] == 1'b1)) ?
		                     1'b1 : ((next_state == DATA_RD | next_state == DATA_RDP | 
		                             state == DATA_RD | state == DATA_RDP) && 
					     (op[1] == 1'b1)) ?
		                             1'b1 : 1'b0;

assign mdio_en_id_match_post = ((st == 2'b01) && (phyad[4:0] == MY_PHY_ID)) ? // Claus22
                                 mdio_en_id_match_pre :
				 ((st == 2'b00) && (prtad[4:0] == MY_PRT_ID) && (devad[4:0] == MY_DEV_ID)) ?
				 mdio_en_id_match_pre : 1'b0;
// combinational logic
always @(reset or state or mdio_in or bit_cnt or st or op or bit_cnt_read or bit_cnt_preamble)
begin
   case (state)
	IDLE :	
		if(reset)
		   next_state	= IDLE;
		else if(mdio_in === 1'b1)
		   next_state	= PREAMBLE;
		else
		   next_state	= IDLE;
	PREAMBLE :
		if((mdio_in === 1'b0) && (bit_cnt_preamble < 31))
		   next_state	= IDLE;
		else if((mdio_in == 1'b0) && (bit_cnt_preamble >= 31))
		   next_state 	= ST;
		else
		   next_state	= PREAMBLE;
	ST :
		if((bit_cnt == 0) && ((st == 2'b11) | (st == 2'b10))) begin
		   $display("<%0d> MDIO_DEBUG: ERROR: Invalid MDIO transaction st:%h , state:%h, next_state:%h %m",
		   	$time, st, state, next_state);
		   next_state	= IDLE;
		end
		else if(bit_cnt == 0)
		   next_state	= OP;
		else
		   next_state	= ST;
	OP :
		if((bit_cnt == 0) && (st == 2'b01))
		   next_state	= PHYAD;
		else if((bit_cnt == 0) && (st == 2'b00))
		   next_state	= PRTAD;
		else
		   next_state	= OP;
	PHYAD : // Claus22 Specific
		if(bit_cnt == 0)
		   next_state	= REGAD;
		else
		   next_state	= PHYAD;
	PRTAD : // Claus45 specific
		if(bit_cnt == 0)
		   next_state	= DEVAD;
		else
		   next_state	= PRTAD;
	DEVAD : // Claus45 specific
		if((bit_cnt == 0) && (op == 2'b00))
		   next_state	= TA;
		else if((bit_cnt == 0) && (op == 2'b01))
		   next_state	= TA;
		else if((bit_cnt == 0) && (op == 2'b11)) 
		   next_state	= DATA_RD;
		else if((bit_cnt == 0) && (op == 2'b10) && (st == 2'b01)) // Claus22 specific 
		   next_state	= DATA_RD;
		else if((bit_cnt == 0) && (op == 2'b10) && (st == 2'b00)) // Claus45 specific 
		   next_state	= DATA_RDP;
		else
		   next_state	= DEVAD;
	REGAD :
		if((bit_cnt == 0) && (op == 2'b00))
		   next_state	= TA;
		else if((bit_cnt == 0) && (op == 2'b01))
		   next_state	= TA;
		else if((bit_cnt == 0) && (op == 2'b11)) 
		   next_state	= DATA_RD;
		else if((bit_cnt == 0) && (op == 2'b10) && (st == 2'b01)) // Claus22 specific 
		   next_state	= DATA_RD;
		else if((bit_cnt == 0) && (op == 2'b10) && (st == 2'b00)) // Claus45 specific 
		   next_state	= DATA_RDP;
		else
		   next_state	= REGAD;
	TA :
		if((bit_cnt == 0) && (op == 2'b00))
		   next_state	= ADDR;
		else if((bit_cnt == 0) && (op == 2'b01))
		   next_state	= DATA_WR;
		else
		   next_state	= TA;
	ADDR :
		if(bit_cnt == 0)
		   next_state	= IDLE;
		else
		   next_state	= ADDR;
	DATA_WR :
		if(bit_cnt == 0)
		   next_state	= IDLE;
		else
		   next_state	= DATA_WR;
	DATA_RD :
		if(bit_cnt_read == 0)
		   next_state	= IDLE;
		else
		   next_state	= DATA_RD;
	DATA_RDP :
		if(bit_cnt_read == 0)
		   next_state	= IDLE;
		else
		   next_state	= DATA_RDP;
	default :
		   next_state	= IDLE;
   endcase
end

always @(posedge mdc)
begin
	if(reset) begin
	   state	<= #1 4'h0;
	   bit_cnt	<= #1 7'd31;
	   mdio_d	<= #1 1'bz;
	   write_en_22	<= #1 1'b0;
	   write_en_45	<= #1 1'b0;
	   bit_cnt_read	<= #1 7'd0;
	end
	else begin
	   state	<= #1 next_state;
	   mdio_d	<= #1 mdio_in;
	end

	// default
	write_en_22	<= #1 1'b0;
	write_en_45	<= #1 1'b0;
	bit_cnt_read	<= #1 bit_cnt_read - 1;

	// bit_cnt update
	if(state == IDLE) begin
	   bit_cnt	<= #1 31;
	   bit_cnt_preamble	<= #1 0;
	end
	else if(state == PREAMBLE) begin
	   bit_cnt_preamble	<= #1 bit_cnt_preamble + 1;
	   bit_cnt	<= #1 1;
	end
	else if((state == ST) && (bit_cnt == 0))
	   bit_cnt	<= #1 1;
	else if((state == OP) && (bit_cnt == 0))
	   bit_cnt	<= #1 4;
	else if((state == PHYAD) && (bit_cnt == 0))
	   bit_cnt	<= #1 4;
	else if((state == PRTAD) && (bit_cnt == 0))
	   bit_cnt	<= #1 4;
	else if((state == DEVAD) && (bit_cnt == 0))
	   bit_cnt	<= #1 1;
	else if((state == REGAD) && (bit_cnt == 0))
	   bit_cnt	<= #1 1;
	else if((state == TA) && (bit_cnt == 0))
	   bit_cnt	<= #1 15;
	else if((state == ADDR) && (bit_cnt == 0))
	   bit_cnt	<= #1 31;
	else if((state == DATA_WR) && (bit_cnt == 0))
	   bit_cnt	<= #1 31;
	else if((state == DATA_RD) && (bit_cnt == 0))
	   bit_cnt	<= #1 31;
	else if((state == DATA_RDP) && (bit_cnt == 0))
	   bit_cnt	<= #1 31;
	else
	   bit_cnt	<= #1 bit_cnt - 1;
	
	// bit_cnt_read
	if((state == DEVAD) && (bit_cnt == 1))
	   bit_cnt_read	<= #1 17;
	if((state == REGAD) && (bit_cnt == 1))
	   bit_cnt_read	<= #1 17;

	// st
	if(state == IDLE)
	   st		<= #1 0;
	else if(state == ST)
	   st[bit_cnt]	<= #1 mdio_d;
	
	// op
	if(state == IDLE)
	   op		<= #1 0;
	else if(state == OP)
	   op[bit_cnt]	<= #1 mdio_d;
	
	// prtad
	if(state == IDLE)
	   prtad	<= #1 0;
	else if(state == PRTAD)
	   prtad[bit_cnt]<= #1 mdio_d;
	
	// phyad
	if(state == IDLE)
	   phyad	<= #1 0;
	else if(state == PHYAD)
	   phyad[bit_cnt]<= #1 mdio_d;
	
	// devad
	if(state == IDLE)
	   devad	<= #1 0;
	else if(state == DEVAD) begin
	   devad[bit_cnt]<= #1 mdio_d;
	   read_data	<= #1 memory[addr];
	end
	
	// regad
	if(state == IDLE)
	   regad	<= #1 0;
	else if(state == REGAD) begin
	   regad[bit_cnt]<= #1 mdio_d;
	   read_data	<= #1 memory[{regad[4:1], mdio_d}];
	end
	
	// ta
	if(state == IDLE)
	   ta		<= #1 0;
	else if(state == TA)
	   ta[bit_cnt]	<= #1 mdio_d;
	
	// addr
	if(state == ADDR)
	   addr[bit_cnt]	<= #1 mdio_d;
	
	// data
	if(state == IDLE)
	   data		<= #1 0;
	if(state == DATA_WR)
	   data[bit_cnt]	<= #1 mdio_d;
	

	// Write
	if((state == DATA_WR) && (st == 2'b01) && (bit_cnt == 0)) // Claus22
	   if(phyad[4:0] == MY_PHY_ID)
	      write_en_22 <= #1 1'b1;

	// Write
	if((state == DATA_WR) && (st == 2'b00) && (bit_cnt == 0)) // Claus45
	   if((prtad[4:0] == MY_PRT_ID) && (devad[4:0] == MY_DEV_ID)) begin
	       write_en_45 <= #1 1'b1;
	       regad	<= #1 addr;
	   end

	if(write_en_22 == 1'b1) begin
	   memory[regad] <= #1 data;
	   $display("<%0d> MDIO_DEBUG: Write addr:%h data:%h Claus22 %m", $time, regad, data);
	end

	if(write_en_45 == 1'b1) begin
	   memory[addr] <= #1 data;
	   $display("<%0d> MDIO_DEBUG: Write addr:%h data:%h Claus45 %m", $time, addr, data);
	end

	// Read
        if((state == DATA_RD) && (st == 2'b01)) begin // Claus22
	   if(phyad[4:0] == MY_PHY_ID) begin
	      if(bit_cnt == 0)
	         $display("<%0d> MDIO_DEBUG: Read  addr:%h data:%h Claus22 %m", $time, regad, memory[regad]);
	   end
	end

	// Read
        if((state == DATA_RD) && (st == 2'b00)) begin // Claus45
	   if((prtad[4:0] == MY_PRT_ID) && (devad[4:0] == MY_DEV_ID)) begin
	      if(bit_cnt == 0)
	         $display("<%0d> MDIO_DEBUG: Read addr:%h data:%h Claus45 %m", $time, addr, memory[addr]);
	   end
	end

	// Read post-read-increment-address
        if((state == DATA_RDP) && (st == 2'b00)) begin // Claus45
	   if((prtad[4:0] == MY_PRT_ID) && (devad[4:0] == MY_DEV_ID)) begin
	      addr	<= #1 addr + 1;
	      if(bit_cnt == 0)
	         $display("<%0d> MDIO_DEBUG: Read addr:%h data:%h %m", $time, addr, memory[addr]);
	   end
	end
end // always


`ifdef AXIS
`else // AXIS
// logic to test poll mode in MIF 
// Provides facilities to modify mmd memory content
reg	[15:0] modify_mmd_memory_address;
reg	[15:0] modify_mmd_memory_data;
reg	[15:0] modify_mmd_memory_time;
reg	       modify_mmd_memory_enable;
integer	       ret_code;
initial
begin
	modify_mmd_memory_address = 16'hFFFF;
	modify_mmd_memory_data = 16'h0;
	modify_mmd_memory_time = 16'h0;
	modify_mmd_memory_enable = 1'b0;

        if ($test$plusargs("MODIFY_MMD_MEMORY_ADDRESS="))
	    modify_mmd_memory_enable = 1'b1;

        if ($test$plusargs("MODIFY_MMD_MEMORY_ADDRESS="))
            ret_code = $value$plusargs("MODIFY_MMD_MEMORY_ADDRESS=%h", modify_mmd_memory_address);
        if ($test$plusargs("MODIFY_MMD_MEMORY_DATA="))
            ret_code = $value$plusargs("MODIFY_MMD_MEMORY_DATA=%h", modify_mmd_memory_data);
        if ($test$plusargs("MODIFY_MMD_MEMORY_TIME="))
            ret_code = $value$plusargs("MODIFY_MMD_MEMORY_TIME=%d", modify_mmd_memory_time);

	// corrupt
	if(modify_mmd_memory_enable) begin
	   $display("<%0d> MDIO_DEBUG: modify mmd memory at time:%0d mdc cycles addr:%h data:%h %m",
	   	$time, modify_mmd_memory_time, modify_mmd_memory_address, modify_mmd_memory_data);
	   repeat(modify_mmd_memory_time) @(posedge mdc);
	   $display("<%0d> MDIO_DEBUG: modify mmd memory now time:%0d mdc cycles addr:%h data:%h %m",
	   	$time, modify_mmd_memory_time, modify_mmd_memory_address, modify_mmd_memory_data);
	   memory[modify_mmd_memory_address] = modify_mmd_memory_data;
	end

end

reg	       force_mmd_mdio_bus_enable;
reg	       force_mmd_mdio_bus_value;
reg [31:0]     force_mmd_mdio_bus_time;

initial
begin
        if ($test$plusargs("FORCE_MMD_MDIO_BUS_ENABLE"))
	    force_mmd_mdio_bus_enable = 1'b1;
	else
	    force_mmd_mdio_bus_enable = 1'b0;

        if ($test$plusargs("FORCE_MMD_MDIO_BUS_VALUE="))
            ret_code = $value$plusargs("FORCE_MMD_MDIO_BUS_VALUE=%d", force_mmd_mdio_bus_value);

        if ($test$plusargs("FORCE_MMD_MDIO_BUS_TIME="))
            ret_code = $value$plusargs("FORCE_MMD_MDIO_BUS_TIME=%d", force_mmd_mdio_bus_time);

	if(force_mmd_mdio_bus_enable) begin
	   $display("<%0d> MDIO_DEBUG: force mmd mdio at time:%0d mdc cycles %m",
	   	$time, force_mmd_mdio_bus_time);
	   repeat(force_mmd_mdio_bus_time) @(posedge mdc);
	   force mdio_out = force_mmd_mdio_bus_value;
	   force mdio_en = force_mmd_mdio_bus_value;
	   force mdio_in = force_mmd_mdio_bus_value;
	   $display("<%0d> MDIO_DEBUG: force mmd mdio now time:%0d mdc cycles %m",
	   	$time, force_mmd_mdio_bus_time);
	end
end
`endif // AXIS

endmodule

