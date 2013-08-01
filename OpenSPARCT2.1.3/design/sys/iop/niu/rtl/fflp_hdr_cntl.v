// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: fflp_hdr_cntl.v
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
/*project name:  NIU                                                  */
/*module name:   fflp_hdr_cntl                                        */
/*description:   Controls the hdr_shft portion of the hdr_dp          */
/*                                                                    */
/*parent module in:  fflp_hdr.v                                       */
/*child modules in:  none                                             */
/*interface modules:                                                  */
/*author name:       Jeanne Cai                                       */
/*date created:      03-18-04                                         */
/*                                                                    */
/*              Copyright (c) 2004, Sun Microsystems, Inc.            */
/*                   Sun Proprietary and Confidential                 */
/*                                                                    */
/**********************************************************************/

module fflp_hdr_cntl 
		(
		cclk,
               	reset,
		ipp_fflp_dvalid,
		hdr_fifo_space_avail,
		hdr_fifo_full,
				
		fflp_ipp_ready,
		shft0_reg_en,
		shft1_reg_en,
		shft2_reg_en,
		shft3_reg_en,
		shft4_reg_en,
		shft5_reg_en,
		shft6_reg_en,
		shft7_reg_en,
		hdr_shft_done
 		);

input		cclk;
input		reset;	
input		ipp_fflp_dvalid;
input		hdr_fifo_space_avail;
input		hdr_fifo_full;

output		fflp_ipp_ready;
output		shft0_reg_en;
output		shft1_reg_en;
output		shft2_reg_en;
output		shft3_reg_en;
output		shft4_reg_en;
output		shft5_reg_en;
output		shft6_reg_en;
output		shft7_reg_en;
output		hdr_shft_done;

reg		fflp_ready;
reg		shft0_reg_en;
reg		shft1_reg_en;
reg		shft2_reg_en;
reg		shft3_reg_en;
reg		shft4_reg_en;
reg		shft5_reg_en;
reg		shft6_reg_en;
reg		shft7_reg_en;
reg[2:0]	next_state;

wire		hdr_shft_done;
wire[2:0]	state;
wire		hdr_dvalid;
wire		fflp_ipp_ready_in;
wire		fflp_ipp_ready_en;
wire		fflp_ipp_ready;


//state machine states
parameter
        IDLE            = 3'b000,
        HDR_DATA_CYC1   = 3'b001,
        HDR_DATA_CYC2	= 3'b010,
        HDR_DATA_CYC3   = 3'b011,
        HDR_DATA_CYC4   = 3'b100,
        HDR_DATA_CYC5   = 3'b101,
	HDR_DATA_CYC6	= 3'b110,
	HDR_DATA_CYC7	= 3'b111;


always @ (
	state or 
	hdr_dvalid or 
	hdr_fifo_space_avail or 
	hdr_fifo_full or
	hdr_shft_done or
	fflp_ipp_ready) 
begin
        shft0_reg_en	= 1'b0;
        shft1_reg_en	= 1'b0;
        shft2_reg_en	= 1'b0;
        shft3_reg_en	= 1'b0;
	shft4_reg_en	= 1'b0;
	shft5_reg_en	= 1'b0;
	shft6_reg_en	= 1'b0;
	shft7_reg_en	= 1'b0;
	fflp_ready	= 1'b0;
        next_state      = IDLE;

case (state) //synopsys parallel_case full_case
// 0in < case -full -parallel -message "0in ERROR: case check in fflp_hdr_cntl"
        IDLE:
        begin
                if (hdr_dvalid)
		begin
			shft0_reg_en	= 1'b1;
                	next_state      = HDR_DATA_CYC1;
		end
		else
		begin
			shft0_reg_en    = 1'b0;
			next_state	= state;
		end

		if (!fflp_ipp_ready & (hdr_fifo_space_avail | !hdr_shft_done & !hdr_fifo_full))
                        fflp_ready = 1'b1;
                else
                        fflp_ready = 1'b0;
        end

	HDR_DATA_CYC1:
	begin
		shft1_reg_en	= 1'b1;
		next_state	= HDR_DATA_CYC2;
	end

	HDR_DATA_CYC2:
        begin   
                shft2_reg_en    = 1'b1;
                next_state      = HDR_DATA_CYC3;
        end

	HDR_DATA_CYC3:
        begin   
                shft3_reg_en	= 1'b1;
                next_state      = HDR_DATA_CYC4;
        end

	HDR_DATA_CYC4:
        begin   
                shft4_reg_en   	= 1'b1;
                next_state      = HDR_DATA_CYC5;
        end

	HDR_DATA_CYC5:
        begin   
                shft5_reg_en	= 1'b1;
                next_state      = HDR_DATA_CYC6;
        end

	HDR_DATA_CYC6:
        begin  
                shft6_reg_en    = 1'b1;
                next_state      = HDR_DATA_CYC7;
                if (hdr_fifo_space_avail)
                        fflp_ready = 1'b1;
                else
                        fflp_ready = 1'b0;
        end

	HDR_DATA_CYC7:
        begin  
                shft7_reg_en    = 1'b1;
                next_state      = IDLE;
                if (!fflp_ipp_ready & hdr_fifo_space_avail | fflp_ipp_ready)
                        fflp_ready = 1'b1;
                else
                        fflp_ready = 1'b0;
        end


	default:
		next_state	= IDLE;

endcase

end

dffr #(3) state_reg 		(cclk, reset, next_state, state);
dffr #(1) hdr_shft_done_reg	(cclk, reset, shft7_reg_en, hdr_shft_done);

/*****************************************/
//fflp-ipp interface signals
/*****************************************/
/*
always @ (posedge cclk)
if (reset)
        hdr_dvalid <= 1'b0;
else
        hdr_dvalid <= ipp_fflp_dvalid;
*/

assign hdr_dvalid 		= ipp_fflp_dvalid;

assign fflp_ipp_ready_in	= fflp_ready ? 1'b1 : 1'b0;
assign fflp_ipp_ready_en	= fflp_ready | hdr_dvalid;

dffre #(1) fflp_ipp_ready_reg	(cclk, reset, fflp_ipp_ready_en, fflp_ipp_ready_in, fflp_ipp_ready);

endmodule







