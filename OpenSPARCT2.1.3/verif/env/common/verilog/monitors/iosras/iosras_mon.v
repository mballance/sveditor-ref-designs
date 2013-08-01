// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: iosras_mon.v
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
module socras_mon() ;

reg socras_mon_on; 

wire [63:0] soc_ejr;
wire [63:0] soc_esr;
wire [63:0] soc_per;
wire [63:0] soc_eie;
wire [63:0] soc_fee;
wire [63:0] soc_siisyn;
wire [63:0] soc_ncusyn;

wire dmu_ncu_ctag_ce, dmu_ncu_ctag_ue, dmu_ncu_d_pe, dmu_ncu_ie, dmu_ncu_ncucr_pe, dmu_ncu_siicr_pe;
wire niu_ncu_ctag_ce, niu_ncu_ctag_ue, niu_ncu_d_pe;
wire sii_ncu_dmua_pe, sii_ncu_dmuctag_ce, sii_ncu_dmuctag_ue, sii_ncu_dmud_pe, sii_ncu_niuctag_ce, sii_ncu_niuctag_ue, sii_ncu_niud_pe, sii_ncu_niua_pe;
wire sio_ncu_ctag_ce, sio_ncu_ctag_ue;
wire mcu0_ncu_ecc, mcu0_ncu_fbr, mcu1_ncu_ecc, mcu1_ncu_fbr, mcu2_ncu_ecc, mcu2_ncu_fbr, mcu3_ncu_ecc, mcu3_ncu_fbr;


initial
begin
socras_mon_on = 1; //Enabled by default
if($test$plusargs("socras_mon_off"))
        socras_mon_on = 0;
end



assign soc_ejr = tb_top.cpu.ncu.ncu_scd_ctl.ncu_c2iscd_ctl.ncu_ctrl_ctl.creg_ejr;
assign soc_esr = tb_top.cpu.ncu.ncu_scd_ctl.ncu_c2iscd_ctl.ncu_ctrl_ctl.creg_esr;
assign soc_per = tb_top.cpu.ncu.ncu_scd_ctl.ncu_c2iscd_ctl.ncu_ctrl_ctl.creg_per;
assign soc_eie = tb_top.cpu.ncu.ncu_scd_ctl.ncu_c2iscd_ctl.ncu_ctrl_ctl.creg_eie;
assign soc_fee = tb_top.cpu.ncu.ncu_scd_ctl.ncu_c2iscd_ctl.ncu_ctrl_ctl.creg_fee;
assign soc_siisyn = tb_top.cpu.ncu.ncu_scd_ctl.ncu_c2iscd_ctl.ncu_ctrl_ctl.creg_siisyn;
assign soc_ncusyn = tb_top.cpu.ncu.ncu_scd_ctl.ncu_c2iscd_ctl.ncu_ctrl_ctl.creg_ncusyn;

assign dmu_ncu_ctag_ce  = tb_top.cpu.dmu_ncu_ctag_ce;
assign dmu_ncu_ctag_ue  = tb_top.cpu.dmu_ncu_ctag_ue;
assign dmu_ncu_d_pe     = tb_top.cpu.dmu_ncu_d_pe;
assign dmu_ncu_ie       = tb_top.cpu.dmu_ncu_ie;
assign dmu_ncu_ncucr_pe = tb_top.cpu.dmu_ncu_ncucr_pe;
assign dmu_ncu_siicr_pe = tb_top.cpu.dmu_ncu_siicr_pe;
assign niu_ncu_ctag_ce  = tb_top.cpu.niu_ncu_ctag_ce;
assign niu_ncu_ctag_ue  = tb_top.cpu.niu_ncu_ctag_ue;
assign niu_ncu_d_pe     = tb_top.cpu.niu_ncu_d_pe;
assign sii_ncu_dmua_pe  = tb_top.cpu.sii_ncu_dmua_pe;
assign sii_ncu_dmuctag_ce  = tb_top.cpu.sii_ncu_dmuctag_ce;
assign sii_ncu_dmuctag_ue  = tb_top.cpu.sii_ncu_dmuctag_ue;
assign sii_ncu_dmud_pe     = tb_top.cpu.sii_ncu_dmud_pe;
assign sii_ncu_niuctag_ce  = tb_top.cpu.sii_ncu_niuctag_ce;
assign sii_ncu_niuctag_ue  = tb_top.cpu.sii_ncu_niuctag_ue;
assign sii_ncu_niud_pe     = tb_top.cpu.sii_ncu_niud_pe;
assign sii_ncu_niua_pe     = tb_top.cpu.sii_ncu_niua_pe;
assign sio_ncu_ctag_ce     = tb_top.cpu.sio_ncu_ctag_ce;
assign sio_ncu_ctag_ue     = tb_top.cpu.sio_ncu_ctag_ue;
assign mcu0_ncu_ecc  = tb_top.cpu.mcu0_ncu_ecc;
assign mcu0_ncu_fbr  = tb_top.cpu.mcu0_ncu_fbr;
assign mcu1_ncu_ecc  = tb_top.cpu.mcu1_ncu_ecc;
assign mcu1_ncu_fbr  = tb_top.cpu.mcu1_ncu_fbr;
assign mcu2_ncu_ecc  = tb_top.cpu.mcu2_ncu_ecc;
assign mcu2_ncu_fbr  = tb_top.cpu.mcu2_ncu_fbr;
assign mcu3_ncu_ecc  = tb_top.cpu.mcu3_ncu_ecc;
assign mcu3_ncu_fbr  = tb_top.cpu.mcu3_ncu_fbr;


always @(soc_esr or socras_mon_on)    
begin
`PR_ALWAYS("socras_mon",`ALWAYS,"SOC_ESR: NcuDmuCredit= %b", soc_esr[42]);
`PR_ALWAYS("socras_mon",`ALWAYS,"SOC_ESR: Mcu3Ecc= %b", soc_esr[41]);
`PR_ALWAYS("socras_mon",`ALWAYS,"SOC_ESR: Mcu3Fbr= %b", soc_esr[40]);
`PR_ALWAYS("socras_mon",`ALWAYS,"SOC_ESR: Spare3= %b", soc_esr[39]);
`PR_ALWAYS("socras_mon",`ALWAYS,"SOC_ESR: Mcu2Ecc= %b", soc_esr[38]);
`PR_ALWAYS("socras_mon",`ALWAYS,"SOC_ESR: Mcu2Fbr= %b", soc_esr[37]);
`PR_ALWAYS("socras_mon",`ALWAYS,"SOC_ESR: Spare2= %b", soc_esr[36]);
`PR_ALWAYS("socras_mon",`ALWAYS,"SOC_ESR: Mcu1Ecc= %b", soc_esr[35]);
`PR_ALWAYS("socras_mon",`ALWAYS,"SOC_ESR: Mcu1Fbr= %b", soc_esr[34]);
`PR_ALWAYS("socras_mon",`ALWAYS,"SOC_ESR: Spare1= %b", soc_esr[33]);
`PR_ALWAYS("socras_mon",`ALWAYS,"SOC_ESR: Mcu0Ecc= %b", soc_esr[32]);
`PR_ALWAYS("socras_mon",`ALWAYS,"SOC_ESR: Mcu0Fbr= %b", soc_esr[31]);
`PR_ALWAYS("socras_mon",`ALWAYS,"SOC_ESR: Spare0= %b", soc_esr[30]);
`PR_ALWAYS("socras_mon",`ALWAYS,"SOC_ESR: NiuDataParity= %b", soc_esr[29]);
`PR_ALWAYS("socras_mon",`ALWAYS,"SOC_ESR: NiuCtagUe= %b", soc_esr[28]);
`PR_ALWAYS("socras_mon",`ALWAYS,"SOC_ESR: NiuCtagCe= %b", soc_esr[27]);
`PR_ALWAYS("socras_mon",`ALWAYS,"SOC_ESR: SioCtagCe= %b", soc_esr[26]);
`PR_ALWAYS("socras_mon",`ALWAYS,"SOC_ESR: SioCtagUe= %b", soc_esr[25]);
`PR_ALWAYS("socras_mon",`ALWAYS,"SOC_ESR: TestMode= %b", soc_esr[24]);
`PR_ALWAYS("socras_mon",`ALWAYS,"SOC_ESR: NcuCtagCe= %b", soc_esr[23]);
`PR_ALWAYS("socras_mon",`ALWAYS,"SOC_ESR: NcuCtagUe= %b", soc_esr[22]);
`PR_ALWAYS("socras_mon",`ALWAYS,"SOC_ESR: NcuDmuUe= %b", soc_esr[21]);
`PR_ALWAYS("socras_mon",`ALWAYS,"SOC_ESR: NcuCpxUe= %b", soc_esr[20]);
`PR_ALWAYS("socras_mon",`ALWAYS,"SOC_ESR: NcuPcxUe= %b", soc_esr[19]);
`PR_ALWAYS("socras_mon",`ALWAYS,"SOC_ESR: NcuPcxData= %b", soc_esr[18]);
`PR_ALWAYS("socras_mon",`ALWAYS,"SOC_ESR: NcuIntTable= %b", soc_esr[17]);
`PR_ALWAYS("socras_mon",`ALWAYS,"SOC_ESR: NcuMondoFifo= %b", soc_esr[16]);
`PR_ALWAYS("socras_mon",`ALWAYS,"SOC_ESR: NcuMondoTable= %b", soc_esr[15]);
`PR_ALWAYS("socras_mon",`ALWAYS,"SOC_ESR: NcuDataParity= %b", soc_esr[14]);
`PR_ALWAYS("socras_mon",`ALWAYS,"SOC_ESR: DmuDataParity= %b", soc_esr[13]);
`PR_ALWAYS("socras_mon",`ALWAYS,"SOC_ESR: DmuSiiCredit= %b", soc_esr[12]);
`PR_ALWAYS("socras_mon",`ALWAYS,"SOC_ESR: DmuCtagUe= %b", soc_esr[11]);
`PR_ALWAYS("socras_mon",`ALWAYS,"SOC_ESR: DmuCtagCe= %b", soc_esr[10]);
`PR_ALWAYS("socras_mon",`ALWAYS,"SOC_ESR: DmuNcuCredit= %b", soc_esr[9]);
`PR_ALWAYS("socras_mon",`ALWAYS,"SOC_ESR: DmuInternal= %b", soc_esr[8]);
`PR_ALWAYS("socras_mon",`ALWAYS,"SOC_ESR: SiiDmuAParity= %b", soc_esr[7]);
`PR_ALWAYS("socras_mon",`ALWAYS,"SOC_ESR: SiiNiuDParity= %b", soc_esr[6]);
`PR_ALWAYS("socras_mon",`ALWAYS,"SOC_ESR: SiiDmuDParity= %b", soc_esr[5]);
`PR_ALWAYS("socras_mon",`ALWAYS,"SOC_ESR: SiiNiuAParity= %b", soc_esr[4]);
`PR_ALWAYS("socras_mon",`ALWAYS,"SOC_ESR: SiiDmuCtagCe= %b", soc_esr[3]);
`PR_ALWAYS("socras_mon",`ALWAYS,"SOC_ESR: SiiNiuCtagCe= %b", soc_esr[2]);
`PR_ALWAYS("socras_mon",`ALWAYS,"SOC_ESR: SiiDmuCtagUe= %b", soc_esr[1]);
`PR_ALWAYS("socras_mon",`ALWAYS,"SOC_ESR: SiiNiuCtagUe= %b", soc_esr[0]);
end


always @(soc_per or socras_mon_on)
begin 
`PR_ALWAYS("socras_mon",`ALWAYS,"SOC_PER: NcuDmuCredit= %b", soc_per[42]);
`PR_ALWAYS("socras_mon",`ALWAYS,"SOC_PER: Mcu3Ecc= %b", soc_per[41]);
`PR_ALWAYS("socras_mon",`ALWAYS,"SOC_PER: Mcu3Fbr= %b", soc_per[40]);
`PR_ALWAYS("socras_mon",`ALWAYS,"SOC_PER: Spare3= %b", soc_per[39]);
`PR_ALWAYS("socras_mon",`ALWAYS,"SOC_PER: Mcu2Ecc %b", soc_per[38]);
`PR_ALWAYS("socras_mon",`ALWAYS,"SOC_PER: Mcu2Fbr %b", soc_per[37]);
`PR_ALWAYS("socras_mon",`ALWAYS,"SOC_PER: Spare2= %b", soc_per[36]);
`PR_ALWAYS("socras_mon",`ALWAYS,"SOC_PER: Mcu1Ecc= %b", soc_per[35]);
`PR_ALWAYS("socras_mon",`ALWAYS,"SOC_PER: Mcu1Fbr= %b", soc_per[34]);
`PR_ALWAYS("socras_mon",`ALWAYS,"SOC_PER: Spare1= %b", soc_per[33]);
`PR_ALWAYS("socras_mon",`ALWAYS,"SOC_PER: Mcu0Ecc= %b", soc_per[32]);
`PR_ALWAYS("socras_mon",`ALWAYS,"SOC_PER: Mcu0Fbr= %b", soc_per[31]);
`PR_ALWAYS("socras_mon",`ALWAYS,"SOC_PER: Spare0= %b", soc_per[30]);
`PR_ALWAYS("socras_mon",`ALWAYS,"SOC_PER: NiuDataParity= %b", soc_per[29]);
`PR_ALWAYS("socras_mon",`ALWAYS,"SOC_PER: NiuCtagUe= %b", soc_per[28]);
`PR_ALWAYS("socras_mon",`ALWAYS,"SOC_PER: NiuCtagCe= %b", soc_per[27]);
`PR_ALWAYS("socras_mon",`ALWAYS,"SOC_PER: SioCtagCe= %b", soc_per[26]);
`PR_ALWAYS("socras_mon",`ALWAYS,"SOC_PER: SioCtagUe= %b", soc_per[25]);
`PR_ALWAYS("socras_mon",`ALWAYS,"SOC_PER: TestMode= %b", soc_per[24]);
`PR_ALWAYS("socras_mon",`ALWAYS,"SOC_PER: NcuCtagCe= %b", soc_per[23]);
`PR_ALWAYS("socras_mon",`ALWAYS,"SOC_PER: NcuCtagUe= %b", soc_per[22]);
`PR_ALWAYS("socras_mon",`ALWAYS,"SOC_PER: NcuDmuUe= %b", soc_per[21]);
`PR_ALWAYS("socras_mon",`ALWAYS,"SOC_PER: NcuCpxUe= %b", soc_per[20]);
`PR_ALWAYS("socras_mon",`ALWAYS,"SOC_PER: NcuPcxUe= %b", soc_per[19]);
`PR_ALWAYS("socras_mon",`ALWAYS,"SOC_PER: NcuPcxData= %b", soc_per[18]);
`PR_ALWAYS("socras_mon",`ALWAYS,"SOC_PER: NcuIntTable= %b", soc_per[17]);
`PR_ALWAYS("socras_mon",`ALWAYS,"SOC_PER: NcuMondoFifo= %b", soc_per[16]);
`PR_ALWAYS("socras_mon",`ALWAYS,"SOC_PER: NcuMondoTable= %b", soc_per[15]);
`PR_ALWAYS("socras_mon",`ALWAYS,"SOC_PER: NcuDataParity= %b", soc_per[14]);
`PR_ALWAYS("socras_mon",`ALWAYS,"SOC_PER: DmuDataParity= %b", soc_per[13]);
`PR_ALWAYS("socras_mon",`ALWAYS,"SOC_PER: DmuSiiCredit= %b", soc_per[12]);
`PR_ALWAYS("socras_mon",`ALWAYS,"SOC_PER: DmuCtagUe= %b", soc_per[11]);
`PR_ALWAYS("socras_mon",`ALWAYS,"SOC_PER: DmuCtagCe= %b", soc_per[10]);
`PR_ALWAYS("socras_mon",`ALWAYS,"SOC_PER: DmuNcuCredit= %b", soc_per[9]);
`PR_ALWAYS("socras_mon",`ALWAYS,"SOC_PER: DmuInternal= %b", soc_per[8]);
`PR_ALWAYS("socras_mon",`ALWAYS,"SOC_PER: SiiDmuAParity= %b", soc_per[7]);
`PR_ALWAYS("socras_mon",`ALWAYS,"SOC_PER: SiiNiuDParity= %b", soc_per[6]);
`PR_ALWAYS("socras_mon",`ALWAYS,"SOC_PER: SiiDmuDParity= %b", soc_per[5]);
`PR_ALWAYS("socras_mon",`ALWAYS,"SOC_PER: SiiNiuAParity= %b", soc_per[4]);
`PR_ALWAYS("socras_mon",`ALWAYS,"SOC_PER: SiiDmuCtagCe= %b", soc_per[3]);
`PR_ALWAYS("socras_mon",`ALWAYS,"SOC_PER: SiiNiuCtagCe= %b", soc_per[2]);
`PR_ALWAYS("socras_mon",`ALWAYS,"SOC_PER: SiiDmuCtagUe= %b", soc_per[1]);
`PR_ALWAYS("socras_mon",`ALWAYS,"SOC_PER: SiiNiuCtagUe= %b", soc_per[0]);
end


always @(soc_ejr or socras_mon_on)
begin 
`PR_ALWAYS("socras_mon",`ALWAYS,"SOC_EJR: NcuDmuCredit= %b", soc_ejr[42]);
`PR_ALWAYS("socras_mon",`ALWAYS,"SOC_EJR: Mcu3Ecc= %b", soc_ejr[41]);
`PR_ALWAYS("socras_mon",`ALWAYS,"SOC_EJR: Mcu3Fbr= %b", soc_ejr[40]);
`PR_ALWAYS("socras_mon",`ALWAYS,"SOC_EJR: Spare3= %b", soc_ejr[39]);
`PR_ALWAYS("socras_mon",`ALWAYS,"SOC_EJR: Mcu2Ecc= %b", soc_ejr[38]);
`PR_ALWAYS("socras_mon",`ALWAYS,"SOC_EJR: Mcu2Fbr= %b", soc_ejr[37]);
`PR_ALWAYS("socras_mon",`ALWAYS,"SOC_EJR: Spare2= %b", soc_ejr[36]);
`PR_ALWAYS("socras_mon",`ALWAYS,"SOC_EJR: Mcu1Ecc= %b", soc_ejr[35]);
`PR_ALWAYS("socras_mon",`ALWAYS,"SOC_EJR: Mcu1Fbr= %b", soc_ejr[34]);
`PR_ALWAYS("socras_mon",`ALWAYS,"SOC_EJR: Spare1= %b", soc_ejr[33]);
`PR_ALWAYS("socras_mon",`ALWAYS,"SOC_EJR: Mcu0Ecc= %b", soc_ejr[32]);
`PR_ALWAYS("socras_mon",`ALWAYS,"SOC_EJR: Mcu0Fbr= %b", soc_ejr[31]);
`PR_ALWAYS("socras_mon",`ALWAYS,"SOC_EJR: Spare0= %b", soc_ejr[30]);
`PR_ALWAYS("socras_mon",`ALWAYS,"SOC_EJR: NiuDataParity= %b", soc_ejr[29]);
`PR_ALWAYS("socras_mon",`ALWAYS,"SOC_EJR: NiuCtagUe= %b", soc_ejr[28]);
`PR_ALWAYS("socras_mon",`ALWAYS,"SOC_EJR: NiuCtagCe= %b", soc_ejr[27]);
`PR_ALWAYS("socras_mon",`ALWAYS,"SOC_EJR: SioCtagCe= %b", soc_ejr[26]);
`PR_ALWAYS("socras_mon",`ALWAYS,"SOC_EJR: SioCtagUe= %b", soc_ejr[25]);
`PR_ALWAYS("socras_mon",`ALWAYS,"SOC_EJR: TestMode= %b", soc_ejr[24]);
`PR_ALWAYS("socras_mon",`ALWAYS,"SOC_EJR: NcuCtagCe= %b", soc_ejr[23]);
`PR_ALWAYS("socras_mon",`ALWAYS,"SOC_EJR: NcuCtagUe= %b", soc_ejr[22]);
`PR_ALWAYS("socras_mon",`ALWAYS,"SOC_EJR: NcuDmuUe= %b", soc_ejr[21]);
`PR_ALWAYS("socras_mon",`ALWAYS,"SOC_EJR: NcuCpxUe= %b", soc_ejr[20]);
`PR_ALWAYS("socras_mon",`ALWAYS,"SOC_EJR: NcuPcxUe= %b", soc_ejr[19]);
`PR_ALWAYS("socras_mon",`ALWAYS,"SOC_EJR: NcuPcxData= %b", soc_ejr[18]);
`PR_ALWAYS("socras_mon",`ALWAYS,"SOC_EJR: NcuIntTable= %b", soc_ejr[17]);
`PR_ALWAYS("socras_mon",`ALWAYS,"SOC_EJR: NcuMondoFifo= %b", soc_ejr[16]);
`PR_ALWAYS("socras_mon",`ALWAYS,"SOC_EJR: NcuMondoTable= %b", soc_ejr[15]);
`PR_ALWAYS("socras_mon",`ALWAYS,"SOC_EJR: NcuDataParity= %b", soc_ejr[14]);
`PR_ALWAYS("socras_mon",`ALWAYS,"SOC_EJR: DmuDataParity= %b", soc_ejr[13]);
`PR_ALWAYS("socras_mon",`ALWAYS,"SOC_EJR: DmuSiiCredit= %b", soc_ejr[12]);
`PR_ALWAYS("socras_mon",`ALWAYS,"SOC_EJR: DmuCtagUe= %b", soc_ejr[11]);
`PR_ALWAYS("socras_mon",`ALWAYS,"SOC_EJR: DmuCtagCe= %b", soc_ejr[10]);
`PR_ALWAYS("socras_mon",`ALWAYS,"SOC_EJR: DmuNcuCredit= %b", soc_ejr[9]);
`PR_ALWAYS("socras_mon",`ALWAYS,"SOC_EJR: DmuInternal= %b", soc_ejr[8]);
`PR_ALWAYS("socras_mon",`ALWAYS,"SOC_EJR: SiiDmuAParity= %b", soc_ejr[7]);
`PR_ALWAYS("socras_mon",`ALWAYS,"SOC_EJR: SiiNiuDParity= %b", soc_ejr[6]);
`PR_ALWAYS("socras_mon",`ALWAYS,"SOC_EJR: SiiDmuDParity= %b", soc_ejr[5]);
`PR_ALWAYS("socras_mon",`ALWAYS,"SOC_EJR: SiiNiuAParity= %b", soc_ejr[4]);
`PR_ALWAYS("socras_mon",`ALWAYS,"SOC_EJR: SiiDmuCtagCe= %b", soc_ejr[3]);
`PR_ALWAYS("socras_mon",`ALWAYS,"SOC_EJR: SiiNiuCtagCe= %b", soc_ejr[2]);
`PR_ALWAYS("socras_mon",`ALWAYS,"SOC_EJR: SiiDmuCtagUe= %b", soc_ejr[1]);
`PR_ALWAYS("socras_mon",`ALWAYS,"SOC_EJR: SiiNiuCtagUe= %b", soc_ejr[0]);
end


always @(soc_eie or socras_mon_on)
begin 
`PR_ALWAYS("socras_mon",`ALWAYS,"SOC_EIE: NcuDmuCredit= %b", soc_eie[42]);
`PR_ALWAYS("socras_mon",`ALWAYS,"SOC_EIE: Mcu3Ecc= %b", soc_eie[41]);
`PR_ALWAYS("socras_mon",`ALWAYS,"SOC_EIE: Mcu3Fbr= %b", soc_eie[40]);
`PR_ALWAYS("socras_mon",`ALWAYS,"SOC_EIE: Spare3= %b", soc_eie[39]);
`PR_ALWAYS("socras_mon",`ALWAYS,"SOC_EIE: Mcu2Ecc= %b", soc_eie[38]);
`PR_ALWAYS("socras_mon",`ALWAYS,"SOC_EIE: Mcu2Fbr= %b", soc_eie[37]);
`PR_ALWAYS("socras_mon",`ALWAYS,"SOC_EIE: Spare2= %b", soc_eie[36]);
`PR_ALWAYS("socras_mon",`ALWAYS,"SOC_EIE: Mcu1Ecc= %b", soc_eie[35]);
`PR_ALWAYS("socras_mon",`ALWAYS,"SOC_EIE: Mcu1Fbr= %b", soc_eie[34]);
`PR_ALWAYS("socras_mon",`ALWAYS,"SOC_EIE: Spare1= %b", soc_eie[33]);
`PR_ALWAYS("socras_mon",`ALWAYS,"SOC_EIE: Mcu0Ecc= %b", soc_eie[32]);
`PR_ALWAYS("socras_mon",`ALWAYS,"SOC_EIE: Mcu0Fbr= %b", soc_eie[31]);
`PR_ALWAYS("socras_mon",`ALWAYS,"SOC_EIE: Spare0= %b", soc_eie[30]);
`PR_ALWAYS("socras_mon",`ALWAYS,"SOC_EIE: NiuDataParity= %b", soc_eie[29]);
`PR_ALWAYS("socras_mon",`ALWAYS,"SOC_EIE: NiuCtagUe= %b", soc_eie[28]);
`PR_ALWAYS("socras_mon",`ALWAYS,"SOC_EIE: NiuCtagCe= %b", soc_eie[27]);
`PR_ALWAYS("socras_mon",`ALWAYS,"SOC_EIE: SioCtagCe= %b", soc_eie[26]);
`PR_ALWAYS("socras_mon",`ALWAYS,"SOC_EIE: SioCtagUe= %b", soc_eie[25]);
`PR_ALWAYS("socras_mon",`ALWAYS,"SOC_EIE: TestMode= %b", soc_eie[24]);
`PR_ALWAYS("socras_mon",`ALWAYS,"SOC_EIE: NcuCtagCe= %b", soc_eie[23]);
`PR_ALWAYS("socras_mon",`ALWAYS,"SOC_EIE: NcuCtagUe= %b", soc_eie[22]);
`PR_ALWAYS("socras_mon",`ALWAYS,"SOC_EIE: NcuDmuUe= %b", soc_eie[21]);
`PR_ALWAYS("socras_mon",`ALWAYS,"SOC_EIE: NcuCpxUe= %b", soc_eie[20]);
`PR_ALWAYS("socras_mon",`ALWAYS,"SOC_EIE: NcuPcxUe= %b", soc_eie[19]);
`PR_ALWAYS("socras_mon",`ALWAYS,"SOC_EIE: NcuPcxData= %b", soc_eie[18]);
`PR_ALWAYS("socras_mon",`ALWAYS,"SOC_EIE: NcuIntTable= %b", soc_eie[17]);
`PR_ALWAYS("socras_mon",`ALWAYS,"SOC_EIE: NcuMondoFifo= %b", soc_eie[16]);
`PR_ALWAYS("socras_mon",`ALWAYS,"SOC_EIE: NcuMondoTable= %b", soc_eie[15]);
`PR_ALWAYS("socras_mon",`ALWAYS,"SOC_EIE: NcuDataParity= %b", soc_eie[14]);
`PR_ALWAYS("socras_mon",`ALWAYS,"SOC_EIE: DmuDataParity= %b", soc_eie[13]);
`PR_ALWAYS("socras_mon",`ALWAYS,"SOC_EIE: DmuSiiCredit= %b", soc_eie[12]);
`PR_ALWAYS("socras_mon",`ALWAYS,"SOC_EIE: DmuCtagUe= %b", soc_eie[11]);
`PR_ALWAYS("socras_mon",`ALWAYS,"SOC_EIE: DmuCtagCe= %b", soc_eie[10]);
`PR_ALWAYS("socras_mon",`ALWAYS,"SOC_EIE: DmuNcuCredit= %b", soc_eie[9]);
`PR_ALWAYS("socras_mon",`ALWAYS,"SOC_EIE: DmuInternal= %b", soc_eie[8]);
`PR_ALWAYS("socras_mon",`ALWAYS,"SOC_EIE: SiiDmuAParity= %b", soc_eie[7]);
`PR_ALWAYS("socras_mon",`ALWAYS,"SOC_EIE: SiiNiuDParity= %b", soc_eie[6]);
`PR_ALWAYS("socras_mon",`ALWAYS,"SOC_EIE: SiiDmuDParity= %b", soc_eie[5]);
`PR_ALWAYS("socras_mon",`ALWAYS,"SOC_EIE: SiiNiuAParity= %b", soc_eie[4]);
`PR_ALWAYS("socras_mon",`ALWAYS,"SOC_EIE: SiiDmuCtagCe= %b", soc_eie[3]);
`PR_ALWAYS("socras_mon",`ALWAYS,"SOC_EIE: SiiNiuCtagCe= %b", soc_eie[2]);
`PR_ALWAYS("socras_mon",`ALWAYS,"SOC_EIE: SiiDmuCtagUe= %b", soc_eie[1]);
`PR_ALWAYS("socras_mon",`ALWAYS,"SOC_EIE: SiiNiuCtagUe= %b", soc_eie[0]);
end

always @(soc_fee or socras_mon_on)
begin
`PR_ALWAYS("socras_mon",`ALWAYS,"SOC_FEE: NcuDmuCredit= %b", soc_fee[42]);
`PR_ALWAYS("socras_mon",`ALWAYS,"SOC_FEE: Mcu3Ecc= %b", soc_fee[41]);
`PR_ALWAYS("socras_mon",`ALWAYS,"SOC_FEE: Mcu3Fbr= %b", soc_fee[40]);
`PR_ALWAYS("socras_mon",`ALWAYS,"SOC_FEE: Spare3= %b", soc_fee[39]);
`PR_ALWAYS("socras_mon",`ALWAYS,"SOC_FEE: Mcu2Ecc= %b", soc_fee[38]);
`PR_ALWAYS("socras_mon",`ALWAYS,"SOC_FEE: Mcu2Fbr= %b", soc_fee[37]);
`PR_ALWAYS("socras_mon",`ALWAYS,"SOC_FEE: Spare2= %b", soc_fee[36]);
`PR_ALWAYS("socras_mon",`ALWAYS,"SOC_FEE: Mcu1Ecc= %b", soc_fee[35]);
`PR_ALWAYS("socras_mon",`ALWAYS,"SOC_FEE: Mcu1Fbr= %b", soc_fee[34]);
`PR_ALWAYS("socras_mon",`ALWAYS,"SOC_FEE: Spare1= %b", soc_fee[33]);
`PR_ALWAYS("socras_mon",`ALWAYS,"SOC_FEE: Mcu0Ecc= %b", soc_fee[32]);
`PR_ALWAYS("socras_mon",`ALWAYS,"SOC_FEE: Mcu0Fbr= %b", soc_fee[31]);
`PR_ALWAYS("socras_mon",`ALWAYS,"SOC_FEE: Spare0= %b", soc_fee[30]);
`PR_ALWAYS("socras_mon",`ALWAYS,"SOC_FEE: NiuDataParity= %b", soc_fee[29]);
`PR_ALWAYS("socras_mon",`ALWAYS,"SOC_FEE: NiuCtagUe= %b", soc_fee[28]);
`PR_ALWAYS("socras_mon",`ALWAYS,"SOC_FEE: NiuCtagCe= %b", soc_fee[27]);
`PR_ALWAYS("socras_mon",`ALWAYS,"SOC_FEE: SioCtagCe= %b", soc_fee[26]);
`PR_ALWAYS("socras_mon",`ALWAYS,"SOC_FEE: SioCtagUe= %b", soc_fee[25]);
`PR_ALWAYS("socras_mon",`ALWAYS,"SOC_FEE: TestMode= %b", soc_fee[24]);
`PR_ALWAYS("socras_mon",`ALWAYS,"SOC_FEE: NcuCtagCe= %b", soc_fee[23]);
`PR_ALWAYS("socras_mon",`ALWAYS,"SOC_FEE: NcuCtagUe= %b", soc_fee[22]);
`PR_ALWAYS("socras_mon",`ALWAYS,"SOC_FEE: NcuDmuUe= %b", soc_fee[21]);
`PR_ALWAYS("socras_mon",`ALWAYS,"SOC_FEE: NcuCpxUe= %b", soc_fee[20]);
`PR_ALWAYS("socras_mon",`ALWAYS,"SOC_FEE: NcuPcxUe= %b", soc_fee[19]);
`PR_ALWAYS("socras_mon",`ALWAYS,"SOC_FEE: NcuPcxData= %b", soc_fee[18]);
`PR_ALWAYS("socras_mon",`ALWAYS,"SOC_FEE: NcuIntTable= %b", soc_fee[17]);
`PR_ALWAYS("socras_mon",`ALWAYS,"SOC_FEE: NcuMondoFifo= %b", soc_fee[16]);
`PR_ALWAYS("socras_mon",`ALWAYS,"SOC_FEE: NcuMondoTable= %b", soc_fee[15]);
`PR_ALWAYS("socras_mon",`ALWAYS,"SOC_FEE: NcuDataParity= %b", soc_fee[14]);
`PR_ALWAYS("socras_mon",`ALWAYS,"SOC_FEE: DmuDataParity= %b", soc_fee[13]);
`PR_ALWAYS("socras_mon",`ALWAYS,"SOC_FEE: DmuSiiCredit= %b", soc_fee[12]);
`PR_ALWAYS("socras_mon",`ALWAYS,"SOC_FEE: DmuCtagUe= %b", soc_fee[11]);
`PR_ALWAYS("socras_mon",`ALWAYS,"SOC_FEE: DmuCtagCe= %b", soc_fee[10]);
`PR_ALWAYS("socras_mon",`ALWAYS,"SOC_FEE: DmuNcuCredit= %b", soc_fee[9]);
`PR_ALWAYS("socras_mon",`ALWAYS,"SOC_FEE: DmuInternal= %b", soc_fee[8]);
`PR_ALWAYS("socras_mon",`ALWAYS,"SOC_FEE: SiiDmuAParity= %b", soc_fee[7]);
`PR_ALWAYS("socras_mon",`ALWAYS,"SOC_FEE: SiiNiuDParity= %b", soc_fee[6]);
`PR_ALWAYS("socras_mon",`ALWAYS,"SOC_FEE: SiiDmuDParity= %b", soc_fee[5]);
`PR_ALWAYS("socras_mon",`ALWAYS,"SOC_FEE: SiiNiuAParity= %b", soc_fee[4]);
`PR_ALWAYS("socras_mon",`ALWAYS,"SOC_FEE: SiiDmuCtagCe= %b", soc_fee[3]);
`PR_ALWAYS("socras_mon",`ALWAYS,"SOC_FEE: SiiNiuCtagCe= %b", soc_fee[2]);
`PR_ALWAYS("socras_mon",`ALWAYS,"SOC_FEE: SiiDmuCtagUe= %b", soc_fee[1]);
`PR_ALWAYS("socras_mon",`ALWAYS,"SOC_FEE: SiiNiuCtagUe= %b", soc_fee[0]);
end


always @(soc_siisyn or socras_mon_on)
begin
`PR_ALWAYS("socras_mon",`ALWAYS,"SOC_SIISYN:  0x%h", soc_siisyn);
end

always @(soc_ncusyn or socras_mon_on)
begin
`PR_ALWAYS("socras_mon",`ALWAYS,"SOC_NCUSYN:  0x%h", soc_ncusyn);
end


always @(dmu_ncu_ctag_ce | dmu_ncu_ctag_ue | dmu_ncu_d_pe | dmu_ncu_ie | dmu_ncu_ncucr_pe | dmu_ncu_siicr_pe | niu_ncu_ctag_ce | niu_ncu_ctag_ue | niu_ncu_d_pe | sii_ncu_dmua_pe | sii_ncu_dmuctag_ce | sii_ncu_dmuctag_ue | sii_ncu_dmud_pe | sii_ncu_niuctag_ce | sii_ncu_niuctag_ue | sii_ncu_niud_pe | sii_ncu_niua_pe | sio_ncu_ctag_ce | sio_ncu_ctag_ue | mcu0_ncu_ecc | mcu0_ncu_fbr | mcu1_ncu_ecc | mcu1_ncu_fbr | mcu2_ncu_ecc | mcu2_ncu_fbr | mcu3_ncu_ecc | mcu3_ncu_fbr)
begin
`PR_ALWAYS("socras_mon",`ALWAYS,"SOC_RAS_INTF_SIGNAL: dmu_ncu_ctag_ce %b", dmu_ncu_ctag_ce);
`PR_ALWAYS("socras_mon",`ALWAYS,"SOC_RAS_INTF_SIGNAL: dmu_ncu_ctag_ue %b", dmu_ncu_ctag_ue);
`PR_ALWAYS("socras_mon",`ALWAYS,"SOC_RAS_INTF_SIGNAL: dmu_ncu_d_pe %b", dmu_ncu_d_pe);
`PR_ALWAYS("socras_mon",`ALWAYS,"SOC_RAS_INTF_SIGNAL: dmu_ncu_ie %b", dmu_ncu_ie);
`PR_ALWAYS("socras_mon",`ALWAYS,"SOC_RAS_INTF_SIGNAL: dmu_ncu_ncucr_pe %b", dmu_ncu_ncucr_pe);
`PR_ALWAYS("socras_mon",`ALWAYS,"SOC_RAS_INTF_SIGNAL: dmu_ncu_siicr_pe %b", dmu_ncu_siicr_pe);
`PR_ALWAYS("socras_mon",`ALWAYS,"SOC_RAS_INTF_SIGNAL: niu_ncu_d_pe %b", niu_ncu_d_pe);
`PR_ALWAYS("socras_mon",`ALWAYS,"SOC_RAS_INTF_SIGNAL: niu_ncu_ctag_ue %b", niu_ncu_ctag_ue);
`PR_ALWAYS("socras_mon",`ALWAYS,"SOC_RAS_INTF_SIGNAL: niu_ncu_ctag_ce %b", niu_ncu_ctag_ce);
`PR_ALWAYS("socras_mon",`ALWAYS,"SOC_RAS_INTF_SIGNAL: sii_ncu_dmua_pe %b", sii_ncu_dmua_pe);
`PR_ALWAYS("socras_mon",`ALWAYS,"SOC_RAS_INTF_SIGNAL: sii_ncu_dmuctag_ce %b", sii_ncu_dmuctag_ce);
`PR_ALWAYS("socras_mon",`ALWAYS,"SOC_RAS_INTF_SIGNAL: sii_ncu_dmuctag_ue %b", sii_ncu_dmuctag_ue);
`PR_ALWAYS("socras_mon",`ALWAYS,"SOC_RAS_INTF_SIGNAL: sii_ncu_dmud_pe %b", sii_ncu_dmud_pe);
`PR_ALWAYS("socras_mon",`ALWAYS,"SOC_RAS_INTF_SIGNAL: sii_ncu_niuctag_ce %b", sii_ncu_niuctag_ce);
`PR_ALWAYS("socras_mon",`ALWAYS,"SOC_RAS_INTF_SIGNAL: sii_ncu_niuctag_ue %b", sii_ncu_niuctag_ue);
`PR_ALWAYS("socras_mon",`ALWAYS,"SOC_RAS_INTF_SIGNAL: sii_ncu_niud_pe %b", sii_ncu_niud_pe);
`PR_ALWAYS("socras_mon",`ALWAYS,"SOC_RAS_INTF_SIGNAL: sii_ncu_niua_pe %b", sii_ncu_niua_pe);
`PR_ALWAYS("socras_mon",`ALWAYS,"SOC_RAS_INTF_SIGNAL: sio_ncu_ctag_ue %b", sio_ncu_ctag_ue);
`PR_ALWAYS("socras_mon",`ALWAYS,"SOC_RAS_INTF_SIGNAL: mcu0_ncu_ecc %b", mcu0_ncu_ecc);
`PR_ALWAYS("socras_mon",`ALWAYS,"SOC_RAS_INTF_SIGNAL: mcu0_ncu_fbr %b", mcu0_ncu_fbr);
`PR_ALWAYS("socras_mon",`ALWAYS,"SOC_RAS_INTF_SIGNAL: mcu1_ncu_ecc %b", mcu1_ncu_ecc);
`PR_ALWAYS("socras_mon",`ALWAYS,"SOC_RAS_INTF_SIGNAL: mcu1_ncu_fbr %b", mcu1_ncu_fbr);
`PR_ALWAYS("socras_mon",`ALWAYS,"SOC_RAS_INTF_SIGNAL: mcu2_ncu_ecc %b", mcu2_ncu_ecc);
`PR_ALWAYS("socras_mon",`ALWAYS,"SOC_RAS_INTF_SIGNAL: mcu2_ncu_fbr %b", mcu2_ncu_fbr);
`PR_ALWAYS("socras_mon",`ALWAYS,"SOC_RAS_INTF_SIGNAL: mcu3_ncu_ecc %b", mcu3_ncu_ecc);
`PR_ALWAYS("socras_mon",`ALWAYS,"SOC_RAS_INTF_SIGNAL: mcu3_ncu_fbr %b", mcu3_ncu_fbr);
end

endmodule
