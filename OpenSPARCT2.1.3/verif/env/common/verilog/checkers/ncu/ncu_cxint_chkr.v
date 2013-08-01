// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: ncu_cxint_chkr.v
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
module ncu_cxint_chkr ;

reg ncu_cxint_check_off;
reg ncu_cxint_core_only;
initial begin // {
    @(posedge `SYSTEMCLOCK) ;
    if ($test$plusargs("ncu_cxint_check_off")) begin // {
        ncu_cxint_check_off <= 1;
        `PR_ALWAYS("ncu_cxint", `ALWAYS, "NCU Cross-thread interrupt Checker is OFF");
    end // }
    else begin // {
        ncu_cxint_check_off <= 0;

        if ($test$plusargs("ncu_cxint_core_only")) begin // {
            ncu_cxint_core_only <= 1;
            `PR_ALWAYS("ncu_cxint", `ALWAYS, "Checking for CORE-ONLY interrupts. IO interrupts will F a i l");
        end // }
        else begin // {
            ncu_cxint_core_only <= 0;
            `PR_ALWAYS("ncu_cxint", `ALWAYS, "Checker allowing for IO interrupts. Spurious interrupts may be undetected");
        end // }
    end // }
end //}

// Keep core-only values in bit vector
// If ncu_cxint_core_only is set, check ALL vectors,
// otherwise check only if return vector is set


    /* 0in create_wire -module cpu -var cxiint_resetpulse -width 1*/
    /* 0in create_assign -module cpu -var_out cxiint_resetpulse
        -var $0in_rising_edge(`TOP.flush_reset_complete, `CPU.ncu.l2clk)
     */

    /* 0in create_wire -module cpu -var cxiint_intreq -width 1*/
    /* 0in create_assign -module cpu -var_out cxiint_intreq
        -var ($0in_delay(pcx_ncu_data_rdy_px1,1, `CPU.ncu.l2clk) &
              (pcx_ncu_data_px2[129:124] == 'b100001) &
              (pcx_ncu_data_px2[103:96] == 8'h90) &
              (pcx_ncu_data_px2[89:64] == {8'h73,18'h0}))
     */

    /* 0in create_wire -module cpu -var cxiint_intret -width 1*/
    /* 0in create_assign -module cpu -var_out cxiint_intret
        -var ($0in_delay(|ncu_cpx_req_cq,1,`CPU.ncu.l2clk) & 
              (ncu_cpx_data_ca[145:141]== 'b10111) &
              (ncu_cpx_data_ca[15:14] == 2'b0) &
              ((cxiint_coreval[ncu_cpx_data_ca[5:0]] == 1'b1) | 
                ncu_cxint_chkr.ncu_cxint_core_only))
     */
    /* 0in create_wire -module cpu -var cxiint_coreval -width 64*/
    /* 0in create_assign -module cpu -var_out cxiint_coreval
        -var ($0in_delay(((`TOP.in_reset) ? 64'b0 :  
                          (cxiint_intreq ? 
                                (cxiint_coreval|(1'b1<<pcx_ncu_data_px2[5:0]))
                                         : cxiint_coreval)),1,
                           (`CPU.ncu.l2clk&(cxiint_intreq|`TOP.in_reset))))
     */

    /* 0in create_wire -module cpu -var cxiint_reqcnt -width 10*/
    /* 0in create_assign -module cpu -var_out cxiint_reqcnt
        -var ($0in_delay(((`TOP.in_reset) ? 10'b0 :
                          (cxiint_intreq ? cxiint_reqcnt+1 : cxiint_reqcnt)),1,
                           (`CPU.ncu.l2clk&(cxiint_intreq|`TOP.in_reset))))

     */
    /* 0in create_wire -module cpu -var cxiint_retcnt -width 10*/
    /* 0in create_assign -module cpu -var_out cxiint_retcnt
        -var ($0in_delay(((`TOP.in_reset) ? 10'b0 :
                          (cxiint_intret ? cxiint_retcnt+1 : cxiint_retcnt)),1,
                           (`CPU.ncu.l2clk&(cxiint_intret|`TOP.in_reset))))

     */

/* 0in custom -module cpu -name ncu_cxint_final 
    -fire (cxiint_reqcnt !== cxiint_retcnt)
    -active $0in_rising_edge(`TOP.sim_status[`ASM_PASS]& ~ncu_cxint_chkr.ncu_cxint_check_off)
    -message ("End of Asm Diag there are pending cross-core interrupts from NCU (Req %d, Ret %d)",cxiint_reqcnt, cxiint_retcnt)
 */
// Make sure that all cross-thread interrupts sent to NCU are
// reflected back from NCU
// Checker should allow non cross-thread interrupts through
// without checking ..
//
//  0in disable_checker -name ncu_cxint* ncu_cxint_check_off

    /* 0in fifo  -module cpu -name ncu_cxint 
        -enq (cxiint_intreq)
        -enq_data (pcx_ncu_data_px2[17:0]&16'h3f3f)
        -deq (cxiint_intret)
        -deq_data (ncu_cpx_data_ca[17:0])
        -clock `CPU.ncu.l2clk
        -depth 66
        -active (~ncu_cxint_chkr.ncu_cxint_check_off)
        -message ("Mismatch in cross-thread interrupts sent/returned from NCU. CPU vectors are 0x%h", cxiint_coreval)
     */

endmodule
