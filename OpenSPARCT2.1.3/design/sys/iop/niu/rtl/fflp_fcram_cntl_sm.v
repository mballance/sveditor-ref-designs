// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: fflp_fcram_cntl_sm.v
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
/**********************************************************************/
/*project name:  N2                                                   */
/*module name:   fflp_fcram_cntl_sm                                   */
/*description:   FCRAM access protocol                                */
/*                                                                    */
/*parent module in:  fflp_fcram_cntl                                  */
/*child modules in:  none                                             */
/*interface modules:                                                  */
/*author name:       Jeanne Cai                                       */
/*date created:      04-08-04                                         */
/*                                                                    */
/*              Copyright (c) 2004, Sun Microsystems, Inc.            */
/*                   Sun Proprietary and Confidential                 */
/*                                                                    */
/*modifications:                                                      */
/*                                                                    */
/*                                                                    */

`include "fflp.h"
module fflp_fcram_cntl_sm
		(
		cclk,
		reset,
		fflp_init_done,
		fio_mstr_ready,
		fcram_refresh_timer_reg_dout,
		do_srch_cycle,
		do_cpu_cycle,
		cpu_cmd,
		cpu_bk0,
		cpu_bk1,
		
		fcram_cmd_sm,
		fcram_ba0_sm,
		fcram_ba1_sm,
		fcram_addr_sel,
		fcram_addr_en,
		fcram_ds_sm,
//		fcram_triz_en_sm,
		fflp_fcram_slv_update,
		power_on_wait_cnt_done_r,
//		fc_din_reg_en_sm,
		srch_burst_done_sm,
		cpu_burst_done_sm,
		fcram_sm_state
	
		);

input		cclk;
input		reset;
input		fflp_init_done;
input		fio_mstr_ready;
input[31:0]	fcram_refresh_timer_reg_dout;
input		do_srch_cycle;
input		do_cpu_cycle;
input		cpu_cmd;
input		cpu_bk0;
input		cpu_bk1;

output[1:0]	fcram_cmd_sm;
output		fcram_ba0_sm;
output		fcram_ba1_sm;
output[2:0]	fcram_addr_sel;
output		fcram_addr_en;
output		fcram_ds_sm;
//output	fcram_triz_en_sm;
output		fflp_fcram_slv_update;
output		power_on_wait_cnt_done_r;
//output	fc_din_reg_en_sm;
output		srch_burst_done_sm;
output		cpu_burst_done_sm;
output[4:0]	fcram_sm_state;

reg[1:0]	fcram_cmd_sm;
reg		fcram_ba0_sm;
reg		fcram_ba1_sm;
reg[2:0]	fcram_addr_sel;
reg		fcram_addr_en;
reg		fcram_ds_sm;
//reg		fcram_triz_en_sm;
//reg		fc_din_reg_en_sm;
reg		inc_wait_cnt;
reg		inc_init_ref_cnt;
reg		fcram_ref_done;
reg		fcram_ref_wait;
reg		srch_irc_time_en;
reg		cpu_irc_time_en;
reg		irc_time_reset;
reg		srch_burst_done_sm;
reg		cpu_burst_done_sm;
reg		wait_time_done_cyc;
reg		irefc_time_done_cyc;
reg		init_wait_done_cyc;
reg[4:0]	next_state;

wire[4:0]	state;
wire		wait_time_done;
wire		irefc_time_done;
wire		fcram_init_done;
wire		init_wait_done;
wire		init_wait_done_pre;
wire		do_refresh_min;
wire		do_refresh_max;
wire		wait_cnt_reset;
wire[8:0]	wait_cnt_in;
wire[8:0]	wait_cnt;

wire		irc_time_done;
wire		irc_time_cnt_en;
wire[2:0]	irc_time_cnt_in;
wire[2:0]	irc_time_cnt;
wire		srch_irc_wait_en;
wire		srch_irc_wait_in;
wire		srch_irc_wait;
wire		cpu_irc_wait_en;
wire		cpu_irc_wait_in;
wire		cpu_irc_wait;

wire		init_ref_cnt_done;
wire[1:0]	init_ref_cnt_in;
wire[1:0]	init_ref_cnt;
wire		ref_tmax_cnt_done;
wire[10:0]	ref_tmax_cnt_in;
wire[10:0]	ref_tmax_cnt;
wire		ref_tmin_cnt_done;
wire		do_refresh_min_en;
wire		do_refresh_max_en;
wire		do_refresh_in;

wire[1:0]	cpu_bk;
wire		cpu_same_bk0;
wire		cpu_same_bk1;
wire		cpu_same_bk2;
wire		cpu_same_bk3;
wire		do_srch_cycle_w;
wire		do_cpu_cycle_w;
wire		srch_rwd_wait;
wire		do_cpu_cycle_wr;

wire[10:0]	pio_refresh_cycle_min; 
wire[10:0]	pio_refresh_cycle_max;
wire[10:0]	refresh_cycle_min;
wire[10:0]	refresh_cycle_max;

wire[15:0]	power_on_wait_cnt_in;
wire[15:0]	power_on_wait_cnt;
wire		power_on_wait_cnt_done;
wire		power_on_wait_cnt_done_r;

wire		fio_slv_update_in;
wire		fflp_fcram_slv_update;

wire[4:0]	fcram_sm_state = state;

assign pio_refresh_cycle_min	= fcram_refresh_timer_reg_dout[10:0];
assign pio_refresh_cycle_max	= fcram_refresh_timer_reg_dout[26:16];
assign refresh_cycle_min	= (pio_refresh_cycle_min == 11'b0) ? 11'd136  : pio_refresh_cycle_min;
assign refresh_cycle_max	= (pio_refresh_cycle_max == 11'b0) ? 11'd1160 : pio_refresh_cycle_max;

assign cpu_bk		= {cpu_bk1, cpu_bk0};
assign cpu_same_bk0	= (cpu_bk == 2'b00);
assign cpu_same_bk1     = (cpu_bk == 2'b01);
assign cpu_same_bk2     = (cpu_bk == 2'b10);
assign cpu_same_bk3     = (cpu_bk == 2'b11);

assign do_srch_cycle_w	= do_srch_cycle & (cpu_same_bk2 & (irc_time_cnt == 3'd0) |
					   cpu_same_bk1 & !(&irc_time_cnt[1:0]) |
					   cpu_same_bk0) & cpu_irc_wait;

assign do_cpu_cycle_w	= do_cpu_cycle & (cpu_same_bk1 & (irc_time_cnt == 3'd0) |
					  cpu_same_bk2 & !(&irc_time_cnt[1:0])  | 
					  cpu_same_bk3) & srch_irc_wait; 

assign srch_rwd_wait	= srch_irc_wait & (irc_time_cnt[2:1] == 2'b00);
assign do_cpu_cycle_wr	= do_cpu_cycle & cpu_cmd & srch_rwd_wait;	//cpu writes bank0

//state machine states
parameter
	IDLE			= 5'd0,
	IPDA_WAIT1		= 5'd1,
	IPDA_WAIT2		= 5'd2,
	SET_MODE_REG		= 5'd3,
	SET_MODE_REG_CYC2	= 5'd4,
	IRSC_TIME_WAIT1		= 5'd5,
	IRSC_TIME_WAIT2		= 5'd6,
	SET_EMODE_REG		= 5'd7,
	SET_EMODE_REG_CYC2	= 5'd8,
	IRSC_TIME_WAIT3		= 5'd9,
	IRSC_TIME_WAIT4		= 5'd10,
	AUTO_REF		= 5'd11,
	AUTO_REF_CYC2		= 5'd12,
	IREFC_TIME_WAIT		= 5'd13,
	INIT_WAIT		= 5'd14,
	READY			= 5'd15,
	LOOKUP_CYC2		= 5'd16,
	LOOKUP_CYC3		= 5'd17,
	LOOKUP_CYC4		= 5'd18,
	LOOKUP_CYC5		= 5'd19,
	LOOKUP_CYC6		= 5'd20,
	LOOKUP_CYC7		= 5'd21,
	LOOKUP_CYC8		= 5'd22,
	IRC_TIME_WAIT		= 5'd23,
	CPU_CYC2		= 5'd24;


always @ (
	state or cpu_cmd or fflp_init_done or 
	do_srch_cycle or do_cpu_cycle or
	do_srch_cycle_w or do_cpu_cycle_w or
	do_cpu_cycle_wr or cpu_bk0 or cpu_bk1 or
	do_refresh_max or do_refresh_min or
	init_ref_cnt_done or fcram_init_done or
	fio_mstr_ready or power_on_wait_cnt_done_r or wait_cnt) 

begin
	fcram_cmd_sm		= `DESL;
	fcram_ba0_sm		= 1'b0;
	fcram_ba1_sm		= 1'b0;
	fcram_addr_sel		= 3'b000;
	fcram_addr_en		= 1'b0;
	fcram_ds_sm		= 1'b0;
//	fcram_triz_en_sm	= 1'b0;
//	fc_din_reg_en_sm	= 1'b0;
	inc_wait_cnt		= 1'b0;
	inc_init_ref_cnt	= 1'b0;
	fcram_ref_done		= 1'b0;
	fcram_ref_wait		= 1'b0;
	srch_irc_time_en	= 1'b0;
	cpu_irc_time_en 	= 1'b0;
	irc_time_reset		= 1'b0;
	srch_burst_done_sm	= 1'b0;
	cpu_burst_done_sm	= 1'b0;
	wait_time_done_cyc	= 1'b0;
	irefc_time_done_cyc	= 1'b0;
	init_wait_done_cyc	= 1'b0;
	next_state		= 5'b00000;

case (state)	//synopsys parallel_case full_case
// 0in < case -full -parallel -message "0in ERROR: case check in fflp_fcram_cntl_sm:state"

IDLE:
begin
	fcram_cmd_sm		= `DESL;
	fcram_ba0_sm		= 1'b0;
	fcram_ba1_sm		= 1'b0;
	fcram_addr_sel		= 3'b000;
	fcram_addr_en		= 1'b0;
	fcram_ds_sm		= 1'b0;
	if (fflp_init_done & fio_mstr_ready & power_on_wait_cnt_done_r)
		next_state	= IPDA_WAIT1;
	else
		next_state	= IDLE;
end

IPDA_WAIT1:
begin
	next_state		= IPDA_WAIT2;
end


IPDA_WAIT2:
begin
        next_state              = SET_MODE_REG;
end


SET_MODE_REG:
begin
	fcram_cmd_sm		= `RDA;
	fcram_ba0_sm		= 1'b0;
	fcram_ba1_sm		= 1'b0;
	fcram_addr_sel		= 3'b000;
	fcram_addr_en		= 1'b1;
	fcram_ds_sm		= 1'b0;
	next_state		= SET_MODE_REG_CYC2;
end

SET_MODE_REG_CYC2:
begin
	fcram_cmd_sm		= `MRS;
	fcram_ba0_sm		= 1'b0;		//select mode reg
	fcram_ba1_sm		= 1'b0;
	fcram_addr_sel		= 3'b000;
	fcram_addr_en		= 1'b1;
	fcram_ds_sm		= 1'b0;
	next_state		= IRSC_TIME_WAIT1;

end

IRSC_TIME_WAIT1:	//wait IRSC = 7cyc
begin
        fcram_cmd_sm    	= `DESL;
        fcram_ba0_sm    	= 1'b0;
        fcram_ba1_sm    	= 1'b0;
        fcram_addr_sel  	= 3'b000;
	fcram_addr_en		= 1'b0;
        fcram_ds_sm     	= 1'b0;
        next_state      	= IRSC_TIME_WAIT2;
end

IRSC_TIME_WAIT2:	
begin
	fcram_cmd_sm    	= `DESL;
	fcram_ba0_sm    	= 1'b0;	
	fcram_ba1_sm		= 1'b0;
	fcram_addr_sel		= 3'b000;
	fcram_addr_en		= 1'b0;
	fcram_ds_sm		= 1'b0;
	inc_wait_cnt		= 1'b1;
	wait_time_done_cyc	= 1'b1;
	if (wait_cnt[2])
		next_state	= SET_EMODE_REG;
	else
		next_state	= state;
end	

SET_EMODE_REG:
begin
	fcram_cmd_sm		= `RDA;
	fcram_ba0_sm		= 1'b1;
	fcram_ba1_sm		= 1'b0;
	fcram_addr_sel		= 3'b001;
	fcram_addr_en		= 1'b1;
	fcram_ds_sm		= 1'b0;
	next_state		= SET_EMODE_REG_CYC2;
end

SET_EMODE_REG_CYC2:
begin
	fcram_cmd_sm		= `MRS;
	fcram_ba0_sm		= 1'b1;		//select extended mode reg
	fcram_ba1_sm		= 1'b0;
	fcram_addr_sel		= 3'b001;
	fcram_addr_en		= 1'b1;
	fcram_ds_sm		= 1'b0;
	next_state		= IRSC_TIME_WAIT3;
end

IRSC_TIME_WAIT3:        //wait IRSC = 7cyc
begin
        fcram_cmd_sm    	= `DESL;
        fcram_ba0_sm    	= 1'b0;
        fcram_ba1_sm    	= 1'b0;
        fcram_addr_sel  	= 3'b000;
	fcram_addr_en		= 1'b0;
        fcram_ds_sm     	= 1'b0;
        next_state      	= IRSC_TIME_WAIT4;
end

IRSC_TIME_WAIT4:
begin
	fcram_cmd_sm		= `DESL;
	fcram_ba0_sm		= 1'b0;
	fcram_ba1_sm		= 1'b0;
	fcram_addr_sel		= 3'b000;
	fcram_addr_en		= 1'b0;
	fcram_ds_sm		= 1'b0;
	inc_wait_cnt		= 1'b1;
	wait_time_done_cyc	= 1'b1;
	if (wait_cnt[2])
		next_state	= AUTO_REF;
	else
		next_state	= state;
end

AUTO_REF:
begin
	fcram_cmd_sm		= `WRA;
	fcram_ba0_sm		= 1'b0;
	fcram_ba1_sm		= 1'b0;
	fcram_addr_sel		= 3'b000;
	fcram_addr_en		= 1'b0;
	fcram_ds_sm		= 1'b0;
	fcram_ref_done		= 1'b1;
	next_state		= AUTO_REF_CYC2;
end

AUTO_REF_CYC2:
begin
	fcram_cmd_sm		= `REF;
	fcram_ba0_sm		= 1'b0;
	fcram_ba1_sm		= 1'b0;
	fcram_addr_sel		= 3'b000;
	fcram_addr_en		= 1'b0;
	fcram_ds_sm		= 1'b0;
	inc_wait_cnt		= 1'b1;
	next_state		= IREFC_TIME_WAIT;
end

IREFC_TIME_WAIT:	//25cyc
begin
	fcram_cmd_sm		= `DESL;
	fcram_ba0_sm		= 1'b0;
	fcram_ba1_sm		= 1'b0;
	fcram_addr_sel		= 3'b000;
	fcram_ds_sm		= 1'b0;
	inc_wait_cnt		= 1'b1;
	fcram_ref_wait		= 1'b1;
	irefc_time_done_cyc	= 1'b1;
	if (fcram_init_done & (wait_cnt[4] & wait_cnt[3]))
		next_state	= READY;
	else if (init_ref_cnt_done & (wait_cnt[4] & wait_cnt[3]))
	begin
		inc_init_ref_cnt= 1'b1;
		next_state	= INIT_WAIT;
	end
	else if (wait_cnt[4] & wait_cnt[3])
	begin
		inc_init_ref_cnt= 1'b1;
		next_state	= AUTO_REF;
	end
	else
		next_state	= state;
end

INIT_WAIT:	//200 cyc
begin
	fcram_cmd_sm    	= `DESL;
	fcram_ba0_sm		= 1'b0;
	fcram_ba1_sm		= 1'b0;
	fcram_addr_sel		= 3'b000;
	fcram_ds_sm		= 1'b0;
	inc_wait_cnt		= 1'b1;
	init_wait_done_cyc	= 1'b1;
	if (wait_cnt[8])
		next_state	= READY;
	else
		next_state	= state;
end

READY:
begin
	if (do_srch_cycle_w | do_cpu_cycle_w | do_cpu_cycle_wr)
	begin
		fcram_cmd_sm		= `DESL;
		fcram_ba0_sm		= 1'b0;
		fcram_ba1_sm		= 1'b0;
		fcram_addr_sel		= 3'b000;
		fcram_addr_en		= 1'b0;
		fcram_ds_sm		= 1'b0;
		next_state		= state;
	end
	else if (do_srch_cycle) 
	begin
		fcram_cmd_sm		= `RDA;
		fcram_ba0_sm		= 1'b0;
		fcram_ba1_sm		= 1'b0;
		fcram_addr_sel		= 3'b100;
		fcram_addr_en		= 1'b1;
		fcram_ds_sm		= 1'b0;
//		fcram_triz_en_sm	= 1'b1;
//		fc_din_reg_en_sm	= 1'b1;
		irc_time_reset		= 1'b1;
		next_state		= LOOKUP_CYC2;
	end
        else if (do_cpu_cycle)
        begin
		if (cpu_cmd)
		begin
                	fcram_cmd_sm    	= `WRA;
               	 	fcram_ba0_sm    	= cpu_bk0;
                	fcram_ba1_sm    	= cpu_bk1;
               		fcram_addr_sel  	= 3'b110;
			fcram_addr_en		= 1'b1;
                	fcram_ds_sm     	= 1'b1;
			irc_time_reset		= 1'b1;
			cpu_burst_done_sm	= 1'b1;
                	next_state      	= CPU_CYC2;
		end
		else
		begin
			fcram_cmd_sm		= `RDA;
			fcram_ba0_sm		= cpu_bk0;
			fcram_ba1_sm		= cpu_bk1;
			fcram_addr_sel		= 3'b110;
			fcram_addr_en		= 1'b1;
			fcram_ds_sm		= 1'b0;
//			fcram_triz_en_sm	= 1'b1;
//			fc_din_reg_en_sm	= 1'b1;
			irc_time_reset		= 1'b1;
			cpu_burst_done_sm	= 1'b1;
			next_state		= CPU_CYC2;
		end
			
        end
	else if (do_refresh_min)
	begin
                fcram_cmd_sm    	= `DESL;
                fcram_ba0_sm    	= 1'b0;
                fcram_ba1_sm    	= 1'b0;
                fcram_addr_sel  	= 3'b000;
		fcram_addr_en		= 1'b0;
                fcram_ds_sm     	= 1'b0;
		irc_time_reset		= 1'b1;
                next_state      	= IRC_TIME_WAIT;
        end
	else
	begin
                fcram_cmd_sm    	= `DESL;
                fcram_ba0_sm    	= 1'b0;
                fcram_ba1_sm    	= 1'b0;
                fcram_addr_sel  	= 3'b000;
		fcram_addr_en		= 1'b0;
                fcram_ds_sm     	= 1'b0;
                next_state      	= state;
        end
end

LOOKUP_CYC2:
begin
	fcram_cmd_sm		= `LAL;
	fcram_ba0_sm		= 1'b0;
	fcram_ba1_sm		= 1'b0;
	fcram_addr_sel		= 3'b101;
	fcram_addr_en		= 1'b1;
	fcram_ds_sm		= 1'b0;
//	fcram_triz_en_sm	= 1'b1;
//	fc_din_reg_en_sm	= 1'b1;
	next_state		= LOOKUP_CYC3;
end

LOOKUP_CYC3:
begin
	fcram_cmd_sm		= `RDA;
	fcram_ba0_sm		= 1'b1;
	fcram_ba1_sm		= 1'b0;
	fcram_addr_sel		= 3'b100;
	fcram_addr_en		= 1'b1;
	fcram_ds_sm		= 1'b0;
//	fcram_triz_en_sm	= 1'b1;
//	fc_din_reg_en_sm	= 1'b1;
	next_state		= LOOKUP_CYC4;
end

LOOKUP_CYC4:
begin
        fcram_cmd_sm    	= `LAL;
        fcram_ba0_sm    	= 1'b1;
        fcram_ba1_sm    	= 1'b0;
        fcram_addr_sel  	= 3'b101;
	fcram_addr_en		= 1'b1;
        fcram_ds_sm     	= 1'b0;
//	fcram_triz_en_sm	= 1'b1;
//	fc_din_reg_en_sm	= 1'b1;
        next_state      	= LOOKUP_CYC5;
end

LOOKUP_CYC5:
begin
        fcram_cmd_sm    	= `RDA;
        fcram_ba0_sm    	= 1'b0;
        fcram_ba1_sm    	= 1'b1;
        fcram_addr_sel  	= 3'b100;
	fcram_addr_en		= 1'b1;
        fcram_ds_sm     	= 1'b0;
//	fcram_triz_en_sm	= 1'b1;
//	fc_din_reg_en_sm	= 1'b1;
	srch_burst_done_sm	= 1'b1;
        next_state      	= LOOKUP_CYC6;
end

LOOKUP_CYC6:
begin
        fcram_cmd_sm    	= `LAL;
        fcram_ba0_sm    	= 1'b0;
        fcram_ba1_sm    	= 1'b1;
        fcram_addr_sel  	= 3'b101;
	fcram_addr_en		= 1'b1;
        fcram_ds_sm     	= 1'b0;
//	fcram_triz_en_sm	= 1'b1;
//	fc_din_reg_en_sm	= 1'b1;
        next_state      	= LOOKUP_CYC7;
end
 
LOOKUP_CYC7:
begin
        fcram_cmd_sm    	= `RDA;
        fcram_ba0_sm    	= 1'b1;
        fcram_ba1_sm    	= 1'b1;
        fcram_addr_sel  	= 3'b100;
	fcram_addr_en		= 1'b1;
        fcram_ds_sm     	= 1'b0;
//	fcram_triz_en_sm	= 1'b1;
//	fc_din_reg_en_sm	= 1'b1;
        next_state      	= LOOKUP_CYC8;
end

LOOKUP_CYC8:
begin
        fcram_cmd_sm    	= `LAL;
        fcram_ba0_sm    	= 1'b1;
        fcram_ba1_sm    	= 1'b1;
        fcram_addr_sel  	= 3'b101;
	fcram_addr_en		= 1'b1;
        fcram_ds_sm     	= 1'b0;
//	fcram_triz_en_sm	= 1'b1;
//	fc_din_reg_en_sm	= 1'b1;
	if (do_refresh_max)
	begin
		srch_irc_time_en	= 1'b0;
		next_state		= IRC_TIME_WAIT; 
	end
	else
	begin
		srch_irc_time_en	= 1'b1;
        	next_state      	= READY;
	end
end

IRC_TIME_WAIT:	//7 cyc
begin
	fcram_cmd_sm		= `DESL;
	fcram_ba0_sm		= 1'b0;
	fcram_ba1_sm		= 1'b0;
	fcram_addr_sel		= 3'b000;
	fcram_addr_en		= 1'b0;
	fcram_ds_sm		= 1'b0;
	inc_wait_cnt		= 1'b1;
	wait_time_done_cyc	= 1'b1;
	if (wait_cnt[2])
		next_state	= AUTO_REF;
	else
		next_state	= state;
end

CPU_CYC2:
begin
	fcram_cmd_sm		= `LAL;
	fcram_ba0_sm		= cpu_bk0;
	fcram_ba0_sm		= cpu_bk1;
	fcram_addr_sel		= 3'b111;
	fcram_addr_en		= 1'b1;
	if (cpu_cmd)
	begin
		fcram_ds_sm	= 1'b1;
//		fcram_triz_en_sm= 1'b0;
	end
	else
	begin
		fcram_ds_sm	= 1'b0;
//		fcram_triz_en_sm= 1'b1;
	end

	if (do_refresh_max)
	begin
		cpu_irc_time_en	= 1'b0;
		next_state	= IRC_TIME_WAIT;
	end
	else
	begin
		cpu_irc_time_en = 1'b1;
		next_state	= READY;
	end
end

default:
begin
        fcram_cmd_sm    	= `DESL;
        fcram_ba0_sm    	= 1'b0;
        fcram_ba0_sm    	= 1'b0;
        fcram_addr_sel  	= 3'b000;
	fcram_addr_en		= 1'b0;
        fcram_ds_sm     	= 1'b0;
        next_state      	= READY;
end

endcase

end

assign wait_cnt_reset		= (wait_time_done | irefc_time_done | init_wait_done);
assign wait_cnt_in		= wait_cnt_reset ? 9'b0 : (wait_cnt + 9'd1); 
assign wait_time_done		= wait_time_done_cyc & wait_cnt[2];
assign irefc_time_done		= irefc_time_done_cyc & (wait_cnt[4] & wait_cnt[3]);
assign init_wait_done		= init_wait_done_cyc & wait_cnt[8];
assign init_wait_done_pre	= init_wait_done_cyc & (&wait_cnt[7:0]);

assign irc_time_done		= irc_time_cnt[2];
assign irc_time_cnt_en		= (srch_irc_wait | cpu_irc_wait);
assign irc_time_cnt_in		= (irc_time_reset | irc_time_done) ? 3'b000 : (irc_time_cnt + 3'd1);
assign srch_irc_wait_en		= srch_irc_time_en  | irc_time_reset | irc_time_done; 
assign srch_irc_wait_in		= srch_irc_time_en ? 1'b1 : 1'b0;
assign cpu_irc_wait_en		= cpu_irc_time_en | irc_time_reset | irc_time_done;
assign cpu_irc_wait_in		= cpu_irc_time_en ? 1'b1 : 1'b0;

assign init_ref_cnt_done	= (init_ref_cnt[1:0] == 2'b10);
assign init_ref_cnt_in		= init_ref_cnt_done ? 2'b00 : (init_ref_cnt + 2'd1);

//refresh max time 3.9us. When calculating number of cycles, need to have margin of
//7(IRC) + 8(rd burst) + 7(IRC, between rd/wr -> ref) == 22 cycles, at least.

//assign ref_tmin_cnt_done	= ref_tmax_cnt[7] & ref_tmax_cnt[3];		        //136x3=408ns
//assign ref_tmax_cnt_done	= ref_tmax_cnt[10] & ref_tmax_cnt[7] & ref_tmax_cnt[3];	//1160x3=3480ns

assign ref_tmin_cnt_done	= (ref_tmax_cnt == refresh_cycle_min);
assign ref_tmax_cnt_done	= (ref_tmax_cnt == refresh_cycle_max);
assign ref_tmax_cnt_in  	= fcram_ref_done    ? 11'b0 : 
                          	  ref_tmax_cnt_done ? ref_tmax_cnt :
                                                      (ref_tmax_cnt + 11'd1);

assign do_refresh_min_en	= ref_tmin_cnt_done | fcram_ref_done;
assign do_refresh_max_en	= ref_tmax_cnt_done | fcram_ref_done;
assign do_refresh_in		= fcram_ref_done ? 1'b0 : 1'b1;

assign fio_slv_update_in	= fcram_ref_wait & ((wait_cnt[4:0] == 5'd15) | (wait_cnt[4:0] == 5'd14)) | 
			   	  init_wait_done | init_wait_done_pre; //almost end of refresh, make two cyc for fio fifo reset

dffr  #(5)  state_reg		(cclk, reset, 			 next_state, 		state);
dffre #(9)  wait_cnt_reg	(cclk, reset, inc_wait_cnt, 	 wait_cnt_in, 		wait_cnt);
dffre #(2)  init_ref_cnt_reg	(cclk, reset, inc_init_ref_cnt,  init_ref_cnt_in,	init_ref_cnt);
dffre #(1)  fcram_init_done_reg (cclk, reset, init_wait_done, 	 init_wait_done, 	fcram_init_done);

dffre #(3)  irc_time_cnt_reg	(cclk, reset, irc_time_cnt_en,   irc_time_cnt_in,	irc_time_cnt);
dffre #(1)  srch_irc_wait_reg	(cclk, reset, srch_irc_wait_en,	 srch_irc_wait_in,	srch_irc_wait);
dffre #(1)  cpu_irc_wait_reg	(cclk, reset, cpu_irc_wait_en,	 cpu_irc_wait_in,	cpu_irc_wait);
 
dffre #(11) ref_tmax_cnt_reg	(cclk, reset, fcram_init_done,	 ref_tmax_cnt_in,	ref_tmax_cnt);
dffre #(1)  do_refresh_min_reg	(cclk, reset, do_refresh_min_en, do_refresh_in, 	do_refresh_min);
dffre #(1)  do_refresh_max_reg	(cclk, reset, do_refresh_max_en, do_refresh_in, 	do_refresh_max);

dffr  #(1)  fio_slv_update_reg	(cclk, reset,			 fio_slv_update_in,	fflp_fcram_slv_update);

/********************************/
//Long wait after power on, 200us
/********************************/

assign power_on_wait_cnt_in	= power_on_wait_cnt_done_r ? 16'b0 : (power_on_wait_cnt + 16'd1);
assign power_on_wait_cnt_done	= (&power_on_wait_cnt[15:0] | power_on_wait_cnt_done_r);

dffr  #(16) power_on_wait_reg	(cclk, reset, 			power_on_wait_cnt_in,	power_on_wait_cnt); 
dffr  #(1)  power_on_wait_done	(cclk, reset, 			power_on_wait_cnt_done,	power_on_wait_cnt_done_r);

endmodule



		

	



	


	
	
	

