// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: l2err_scrbrd.v
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
module l2err_scrbrd(cpx_pckt,desr_cnt,err_cnt);

input [23:0]cpx_pckt,desr_cnt,err_cnt;

`define SIM_END_TRAP tb_top.cpu.spc0.tlu.trl0_trap_type[8:0] 
reg scrbd_on,err_fwd_on;

initial
begin
scrbd_on = 0;
err_fwd_on = 0;
if($test$plusargs("L2DA_BIT_STUCK_TO0"))
	scrbd_on = 1;
else if ($test$plusargs("L2DA_BIT_STUCK_TO1"))
	scrbd_on = 1;
//else if ($test$plusargs("L2DA_ERR_ENABLE_FWD"))
else if ($test$plusargs("L2DA_ERR_ENABLE") || $test$plusargs("L2DA_INJECT_UE_ALLBANKS"))
   begin
        err_fwd_on = 1;
	scrbd_on = 1;
   end
/*else if ($test$plusargs("L2DA_ERR_ENABLE"))
	scrbd_on = 1;
else if ($test$plusargs("L2DA_RAND_ERR_ENABLE"))
	scrbd_on = 1; */
end


always @(`SIM_END_TRAP or err_cnt or cpx_pckt or err_fwd_on)
begin
if(err_fwd_on == 1) 
begin
        if(`SIM_END_TRAP == 12'h1a0 || `SIM_END_TRAP == 12'h100)
        begin
                if(err_cnt == cpx_pckt)
                        `PR_ALWAYS("l2err_mon",`ALWAYS,"L2t.cpx_packet = L2.InjectedError");
                else  
                  `PR_ALWAYS("l2err_mon",`ALWAYS,"L2t.cpx_packet != L2.InjectedError, MISMATCH !!");
//  `PR_ERROR("l2err_mon",`ERROR,"L2t.cpx_packet != L2.InjectedError, MISMATCH !!");
        end
end
end




always @(`SIM_END_TRAP or err_cnt or cpx_pckt or  scrbd_on)
begin
if(scrbd_on == 1)
begin
   if(`SIM_END_TRAP == 12'h1a0 || `SIM_END_TRAP == 12'h100 || `SIM_END_TRAP == 12'h101 || `SIM_END_TRAP == 12'h1a1)
        begin
                        `PR_ALWAYS("l2err_mon",`ALWAYS,"Errs INJECTED IN L2 DATA ARRAY = %0d",err_cnt);
                        `PR_ALWAYS("l2err_mon",`ALWAYS," L2t.CPX_PACKETS SENT = %d",cpx_pckt);
        end
end
end



task SetTrapCount;
input [8:0] count;
reg [8:0] count;
begin

     if(count == cpx_pckt)
     `PR_ALWAYS("l2err_mon",`ALWAYS,"L2t.CPX_PACKETS = L2.TRAPS_TAKEN_BY_CORE");
     else    `PR_ALWAYS("l2err_mon",`ALWAYS,"L2t.CPX_PACKETS != L2.TRAPS_TAKEN_BY_CORE, MISMATCH !!");
     //else    `PR_ERROR("l2err_mon",`ERROR,"L2t.CPX_PACKETS != L2.TRAPS_TAKEN_BY_CORE, MISMATCH !!");


end
endtask

	



endmodule
