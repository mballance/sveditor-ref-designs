// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: l2_siu_chkr.v
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
`define DMU  1'b1
`define NIU  1'b0
 
//Inbound
`define DMU_RDD_ord_npt 7'b0101001
`define DMU_WR8_ord_pst 7'b0111010
`define DMU_WRI_ord_pst 7'b0111100
`define NIU_RDD_ord_npt 7'b0100001
`define NIU_RDD_byp_npt 7'b0000001
`define NIU_WRI_ord_npt 7'b0100100
`define NIU_WRI_byp_npt 7'b0000100
`define NIU_WRI_ord_pst 7'b0110100
`define NIU_WRI_byp_pst 7'b0010100
`define TCU_WR		7'b1000001
`define TCU_RD		7'b1000010

`define SII_L2_WRI      3'b100
`define SII_L2_WR8      3'b010
`define SII_L2_RDD      3'b001

`define SII_L2_0_O   sii_l2t0_req[30]	
`define SII_L2_0_P   sii_l2t0_req[29]
`define SII_L2_0_S   sii_l2t0_req[27]

`define SII_L2_0_VLD sii_l2t0_req_vld

`define SII_L2_0_TT  sii_l2t0_req[26:24]	

`define SII_L2_0_CMD {sii_l2t0_req[31:29], sii_l2t0_req[27:24]}

`define PA_LOW6_0    sii_l2t0_req[5:0]
`define PA_LOW3_0    sii_l2t0_req[2:0]

`define BYTE_MASK_0  sii_l2t0_req[15:8]
`define SII_L2_1_O   sii_l2t1_req[30]	
`define SII_L2_1_P   sii_l2t1_req[29]
`define SII_L2_1_S   sii_l2t1_req[27]

`define SII_L2_1_VLD sii_l2t1_req_vld

`define SII_L2_1_TT  sii_l2t1_req[26:24]	

`define SII_L2_1_CMD {sii_l2t1_req[31:29], sii_l2t1_req[27:24]}

`define PA_LOW6_1    sii_l2t1_req[5:0]
`define PA_LOW3_1    sii_l2t1_req[2:0]

`define BYTE_MASK_1  sii_l2t1_req[15:8]
`define SII_L2_2_O   sii_l2t2_req[30]	
`define SII_L2_2_P   sii_l2t2_req[29]
`define SII_L2_2_S   sii_l2t2_req[27]

`define SII_L2_2_VLD sii_l2t2_req_vld

`define SII_L2_2_TT  sii_l2t2_req[26:24]	

`define SII_L2_2_CMD {sii_l2t2_req[31:29], sii_l2t2_req[27:24]}

`define PA_LOW6_2    sii_l2t2_req[5:0]
`define PA_LOW3_2    sii_l2t2_req[2:0]

`define BYTE_MASK_2  sii_l2t2_req[15:8]
`define SII_L2_3_O   sii_l2t3_req[30]	
`define SII_L2_3_P   sii_l2t3_req[29]
`define SII_L2_3_S   sii_l2t3_req[27]

`define SII_L2_3_VLD sii_l2t3_req_vld

`define SII_L2_3_TT  sii_l2t3_req[26:24]	

`define SII_L2_3_CMD {sii_l2t3_req[31:29], sii_l2t3_req[27:24]}

`define PA_LOW6_3    sii_l2t3_req[5:0]
`define PA_LOW3_3    sii_l2t3_req[2:0]

`define BYTE_MASK_3  sii_l2t3_req[15:8]
`define SII_L2_4_O   sii_l2t4_req[30]	
`define SII_L2_4_P   sii_l2t4_req[29]
`define SII_L2_4_S   sii_l2t4_req[27]

`define SII_L2_4_VLD sii_l2t4_req_vld

`define SII_L2_4_TT  sii_l2t4_req[26:24]	

`define SII_L2_4_CMD {sii_l2t4_req[31:29], sii_l2t4_req[27:24]}

`define PA_LOW6_4    sii_l2t4_req[5:0]
`define PA_LOW3_4    sii_l2t4_req[2:0]

`define BYTE_MASK_4  sii_l2t4_req[15:8]
`define SII_L2_5_O   sii_l2t5_req[30]	
`define SII_L2_5_P   sii_l2t5_req[29]
`define SII_L2_5_S   sii_l2t5_req[27]

`define SII_L2_5_VLD sii_l2t5_req_vld

`define SII_L2_5_TT  sii_l2t5_req[26:24]	

`define SII_L2_5_CMD {sii_l2t5_req[31:29], sii_l2t5_req[27:24]}

`define PA_LOW6_5    sii_l2t5_req[5:0]
`define PA_LOW3_5    sii_l2t5_req[2:0]

`define BYTE_MASK_5  sii_l2t5_req[15:8]
`define SII_L2_6_O   sii_l2t6_req[30]	
`define SII_L2_6_P   sii_l2t6_req[29]
`define SII_L2_6_S   sii_l2t6_req[27]

`define SII_L2_6_VLD sii_l2t6_req_vld

`define SII_L2_6_TT  sii_l2t6_req[26:24]	

`define SII_L2_6_CMD {sii_l2t6_req[31:29], sii_l2t6_req[27:24]}

`define PA_LOW6_6    sii_l2t6_req[5:0]
`define PA_LOW3_6    sii_l2t6_req[2:0]

`define BYTE_MASK_6  sii_l2t6_req[15:8]
`define SII_L2_7_O   sii_l2t7_req[30]	
`define SII_L2_7_P   sii_l2t7_req[29]
`define SII_L2_7_S   sii_l2t7_req[27]

`define SII_L2_7_VLD sii_l2t7_req_vld

`define SII_L2_7_TT  sii_l2t7_req[26:24]	

`define SII_L2_7_CMD {sii_l2t7_req[31:29], sii_l2t7_req[27:24]}

`define PA_LOW6_7    sii_l2t7_req[5:0]
`define PA_LOW3_7    sii_l2t7_req[2:0]

`define BYTE_MASK_7  sii_l2t7_req[15:8]



//Outbound
`define L2_DMU_RDD_ord_npt 7'b1010001
`define L2_DMU_WR8_ord_pst 7'b1110000
`define L2_DMU_WRI_pst_ord 7'b1110000

`define L2_NIU_RDD_ord_npt 7'b1000001
`define L2_NIU_RDD_byp_npt 7'b0000001
`define L2_NIU_WRI_ord_npt 7'b1000000
`define L2_NIU_WRI_byp_npt 7'b0000000
`define L2_NIU_WRI_ord_pst 7'b1100000
`define L2_NIU_WRI_byp_pst 7'b0100000


`define L2_SIO_RDD  1'b1
`define L2_SIO_WRI  1'b0

 
`define L2_0_SIO_O    l2b0_sio_data[23]
`define L2_0_SIO_P    l2b0_sio_data[22]
`define L2_0_SIO_S    l2b0_sio_data[20]

`define L2_0_SIO_VLD  l2b0_sio_ctag_vld
`define L2_0_SIO_TT   l2b0_sio_data[16] 

`define CBA_0         l2b0_sio_data[19:17]

`define L2_0_SIO_CMD  {l2b0_sio_data[23:22], l2b0_sio_data[20:16]}
`define L2_1_SIO_O    l2b1_sio_data[23]
`define L2_1_SIO_P    l2b1_sio_data[22]
`define L2_1_SIO_S    l2b1_sio_data[20]

`define L2_1_SIO_VLD  l2b1_sio_ctag_vld
`define L2_1_SIO_TT   l2b1_sio_data[16] 

`define CBA_1         l2b1_sio_data[19:17]

`define L2_1_SIO_CMD  {l2b1_sio_data[23:22], l2b1_sio_data[20:16]}
`define L2_2_SIO_O    l2b2_sio_data[23]
`define L2_2_SIO_P    l2b2_sio_data[22]
`define L2_2_SIO_S    l2b2_sio_data[20]

`define L2_2_SIO_VLD  l2b2_sio_ctag_vld
`define L2_2_SIO_TT   l2b2_sio_data[16] 

`define CBA_2         l2b2_sio_data[19:17]

`define L2_2_SIO_CMD  {l2b2_sio_data[23:22], l2b2_sio_data[20:16]}
`define L2_3_SIO_O    l2b3_sio_data[23]
`define L2_3_SIO_P    l2b3_sio_data[22]
`define L2_3_SIO_S    l2b3_sio_data[20]

`define L2_3_SIO_VLD  l2b3_sio_ctag_vld
`define L2_3_SIO_TT   l2b3_sio_data[16] 

`define CBA_3         l2b3_sio_data[19:17]

`define L2_3_SIO_CMD  {l2b3_sio_data[23:22], l2b3_sio_data[20:16]}
`define L2_4_SIO_O    l2b4_sio_data[23]
`define L2_4_SIO_P    l2b4_sio_data[22]
`define L2_4_SIO_S    l2b4_sio_data[20]

`define L2_4_SIO_VLD  l2b4_sio_ctag_vld
`define L2_4_SIO_TT   l2b4_sio_data[16] 

`define CBA_4         l2b4_sio_data[19:17]

`define L2_4_SIO_CMD  {l2b4_sio_data[23:22], l2b4_sio_data[20:16]}
`define L2_5_SIO_O    l2b5_sio_data[23]
`define L2_5_SIO_P    l2b5_sio_data[22]
`define L2_5_SIO_S    l2b5_sio_data[20]

`define L2_5_SIO_VLD  l2b5_sio_ctag_vld
`define L2_5_SIO_TT   l2b5_sio_data[16] 

`define CBA_5         l2b5_sio_data[19:17]

`define L2_5_SIO_CMD  {l2b5_sio_data[23:22], l2b5_sio_data[20:16]}
`define L2_6_SIO_O    l2b6_sio_data[23]
`define L2_6_SIO_P    l2b6_sio_data[22]
`define L2_6_SIO_S    l2b6_sio_data[20]

`define L2_6_SIO_VLD  l2b6_sio_ctag_vld
`define L2_6_SIO_TT   l2b6_sio_data[16] 

`define CBA_6         l2b6_sio_data[19:17]

`define L2_6_SIO_CMD  {l2b6_sio_data[23:22], l2b6_sio_data[20:16]}
`define L2_7_SIO_O    l2b7_sio_data[23]
`define L2_7_SIO_P    l2b7_sio_data[22]
`define L2_7_SIO_S    l2b7_sio_data[20]

`define L2_7_SIO_VLD  l2b7_sio_ctag_vld
`define L2_7_SIO_TT   l2b7_sio_data[16] 

`define CBA_7         l2b7_sio_data[19:17]

`define L2_7_SIO_CMD  {l2b7_sio_data[23:22], l2b7_sio_data[20:16]}



module sii_l2_chkr();

 
`ifdef X_GUARD
`endif


reg no_iqdq_chk;
initial begin // {
`ifdef FC_BENCH
    @(posedge tb_top.cpu.sii.l2clk) ;
`else
    @(posedge siu_top.cpu.sii.l2clk) ;
`endif
    if ($test$plusargs("siul2_iqdq_chk_off"))
        no_iqdq_chk <= 1;
    else
        no_iqdq_chk <= 0;
end //}

//  0in disable_checker -name *req_assert* no_iqdq_chk


/* SII to L2 transactions */

    /* 0in value -var `SII_L2_0_CMD -casex 
     -val `DMU_RDD_ord_npt `DMU_WR8_ord_pst `DMU_WRI_ord_pst `NIU_RDD_ord_npt `NIU_RDD_byp_npt `NIU_WRI_ord_npt `NIU_WRI_byp_npt `NIU_WRI_ord_pst `NIU_WRI_byp_pst `TCU_RD `TCU_WR
     -active `SII_L2_0_VLD  
     -clock l2clk
     -module cpu  
     -name sii_l2_0_hdr_cmd_vld
     -message "Bad value for sii_l2_0 header"
    */
    /* 0in value -var `SII_L2_1_CMD -casex 
     -val `DMU_RDD_ord_npt `DMU_WR8_ord_pst `DMU_WRI_ord_pst `NIU_RDD_ord_npt `NIU_RDD_byp_npt `NIU_WRI_ord_npt `NIU_WRI_byp_npt `NIU_WRI_ord_pst `NIU_WRI_byp_pst `TCU_RD `TCU_WR
     -active `SII_L2_1_VLD  
     -clock l2clk
     -module cpu  
     -name sii_l2_1_hdr_cmd_vld
     -message "Bad value for sii_l2_1 header"
    */
    /* 0in value -var `SII_L2_2_CMD -casex 
     -val `DMU_RDD_ord_npt `DMU_WR8_ord_pst `DMU_WRI_ord_pst `NIU_RDD_ord_npt `NIU_RDD_byp_npt `NIU_WRI_ord_npt `NIU_WRI_byp_npt `NIU_WRI_ord_pst `NIU_WRI_byp_pst `TCU_RD `TCU_WR
     -active `SII_L2_2_VLD  
     -clock l2clk
     -module cpu  
     -name sii_l2_2_hdr_cmd_vld
     -message "Bad value for sii_l2_2 header"
    */
    /* 0in value -var `SII_L2_3_CMD -casex 
     -val `DMU_RDD_ord_npt `DMU_WR8_ord_pst `DMU_WRI_ord_pst `NIU_RDD_ord_npt `NIU_RDD_byp_npt `NIU_WRI_ord_npt `NIU_WRI_byp_npt `NIU_WRI_ord_pst `NIU_WRI_byp_pst `TCU_RD `TCU_WR
     -active `SII_L2_3_VLD  
     -clock l2clk
     -module cpu  
     -name sii_l2_3_hdr_cmd_vld
     -message "Bad value for sii_l2_3 header"
    */
    /* 0in value -var `SII_L2_4_CMD -casex 
     -val `DMU_RDD_ord_npt `DMU_WR8_ord_pst `DMU_WRI_ord_pst `NIU_RDD_ord_npt `NIU_RDD_byp_npt `NIU_WRI_ord_npt `NIU_WRI_byp_npt `NIU_WRI_ord_pst `NIU_WRI_byp_pst `TCU_RD `TCU_WR
     -active `SII_L2_4_VLD  
     -clock l2clk
     -module cpu  
     -name sii_l2_4_hdr_cmd_vld
     -message "Bad value for sii_l2_4 header"
    */
    /* 0in value -var `SII_L2_5_CMD -casex 
     -val `DMU_RDD_ord_npt `DMU_WR8_ord_pst `DMU_WRI_ord_pst `NIU_RDD_ord_npt `NIU_RDD_byp_npt `NIU_WRI_ord_npt `NIU_WRI_byp_npt `NIU_WRI_ord_pst `NIU_WRI_byp_pst `TCU_RD `TCU_WR
     -active `SII_L2_5_VLD  
     -clock l2clk
     -module cpu  
     -name sii_l2_5_hdr_cmd_vld
     -message "Bad value for sii_l2_5 header"
    */
    /* 0in value -var `SII_L2_6_CMD -casex 
     -val `DMU_RDD_ord_npt `DMU_WR8_ord_pst `DMU_WRI_ord_pst `NIU_RDD_ord_npt `NIU_RDD_byp_npt `NIU_WRI_ord_npt `NIU_WRI_byp_npt `NIU_WRI_ord_pst `NIU_WRI_byp_pst `TCU_RD `TCU_WR
     -active `SII_L2_6_VLD  
     -clock l2clk
     -module cpu  
     -name sii_l2_6_hdr_cmd_vld
     -message "Bad value for sii_l2_6 header"
    */
    /* 0in value -var `SII_L2_7_CMD -casex 
     -val `DMU_RDD_ord_npt `DMU_WR8_ord_pst `DMU_WRI_ord_pst `NIU_RDD_ord_npt `NIU_RDD_byp_npt `NIU_WRI_ord_npt `NIU_WRI_byp_npt `NIU_WRI_ord_pst `NIU_WRI_byp_pst `TCU_RD `TCU_WR
     -active `SII_L2_7_VLD  
     -clock l2clk
     -module cpu  
     -name sii_l2_7_hdr_cmd_vld
     -message "Bad value for sii_l2_7 header"
    */


  /***************************
   WRI
   1. If from DMU O=1; P=1
   2. PA[5:0] are zeros
   3. 
  ***************************/
// 1. 
    /* 0in value -var ({`SII_L2_0_O,`SII_L2_0_P})
       -val 2'b11 
       -active (`SII_L2_0_VLD & (`SII_L2_0_TT==`SII_L2_WRI) & (`SII_L2_0_S==`DMU))
       -module cpu
       -clock l2clk
       -name sii_l2_0_WRI_P_O_chk
    */
    /* 0in value -var ({`SII_L2_1_O,`SII_L2_1_P})
       -val 2'b11 
       -active (`SII_L2_1_VLD & (`SII_L2_1_TT==`SII_L2_WRI) & (`SII_L2_1_S==`DMU))
       -module cpu
       -clock l2clk
       -name sii_l2_1_WRI_P_O_chk
    */
    /* 0in value -var ({`SII_L2_2_O,`SII_L2_2_P})
       -val 2'b11 
       -active (`SII_L2_2_VLD & (`SII_L2_2_TT==`SII_L2_WRI) & (`SII_L2_2_S==`DMU))
       -module cpu
       -clock l2clk
       -name sii_l2_2_WRI_P_O_chk
    */
    /* 0in value -var ({`SII_L2_3_O,`SII_L2_3_P})
       -val 2'b11 
       -active (`SII_L2_3_VLD & (`SII_L2_3_TT==`SII_L2_WRI) & (`SII_L2_3_S==`DMU))
       -module cpu
       -clock l2clk
       -name sii_l2_3_WRI_P_O_chk
    */
    /* 0in value -var ({`SII_L2_4_O,`SII_L2_4_P})
       -val 2'b11 
       -active (`SII_L2_4_VLD & (`SII_L2_4_TT==`SII_L2_WRI) & (`SII_L2_4_S==`DMU))
       -module cpu
       -clock l2clk
       -name sii_l2_4_WRI_P_O_chk
    */
    /* 0in value -var ({`SII_L2_5_O,`SII_L2_5_P})
       -val 2'b11 
       -active (`SII_L2_5_VLD & (`SII_L2_5_TT==`SII_L2_WRI) & (`SII_L2_5_S==`DMU))
       -module cpu
       -clock l2clk
       -name sii_l2_5_WRI_P_O_chk
    */
    /* 0in value -var ({`SII_L2_6_O,`SII_L2_6_P})
       -val 2'b11 
       -active (`SII_L2_6_VLD & (`SII_L2_6_TT==`SII_L2_WRI) & (`SII_L2_6_S==`DMU))
       -module cpu
       -clock l2clk
       -name sii_l2_6_WRI_P_O_chk
    */
    /* 0in value -var ({`SII_L2_7_O,`SII_L2_7_P})
       -val 2'b11 
       -active (`SII_L2_7_VLD & (`SII_L2_7_TT==`SII_L2_WRI) & (`SII_L2_7_S==`DMU))
       -module cpu
       -clock l2clk
       -name sii_l2_7_WRI_P_O_chk
    */

// 2.
    /* 0in value -var `PA_LOW6_0
       -val 6'b000000
       -active $0in_delay((`SII_L2_0_VLD & (`SII_L2_0_CMD==`SII_L2_WRI)), 1)
       -module cpu
       -clock l2clk
       -name sii_l2_0_WRI_PA_align_chk
    */
    /* 0in value -var `PA_LOW6_1
       -val 6'b000000
       -active $0in_delay((`SII_L2_1_VLD & (`SII_L2_1_CMD==`SII_L2_WRI)), 1)
       -module cpu
       -clock l2clk
       -name sii_l2_1_WRI_PA_align_chk
    */
    /* 0in value -var `PA_LOW6_2
       -val 6'b000000
       -active $0in_delay((`SII_L2_2_VLD & (`SII_L2_2_CMD==`SII_L2_WRI)), 1)
       -module cpu
       -clock l2clk
       -name sii_l2_2_WRI_PA_align_chk
    */
    /* 0in value -var `PA_LOW6_3
       -val 6'b000000
       -active $0in_delay((`SII_L2_3_VLD & (`SII_L2_3_CMD==`SII_L2_WRI)), 1)
       -module cpu
       -clock l2clk
       -name sii_l2_3_WRI_PA_align_chk
    */
    /* 0in value -var `PA_LOW6_4
       -val 6'b000000
       -active $0in_delay((`SII_L2_4_VLD & (`SII_L2_4_CMD==`SII_L2_WRI)), 1)
       -module cpu
       -clock l2clk
       -name sii_l2_4_WRI_PA_align_chk
    */
    /* 0in value -var `PA_LOW6_5
       -val 6'b000000
       -active $0in_delay((`SII_L2_5_VLD & (`SII_L2_5_CMD==`SII_L2_WRI)), 1)
       -module cpu
       -clock l2clk
       -name sii_l2_5_WRI_PA_align_chk
    */
    /* 0in value -var `PA_LOW6_6
       -val 6'b000000
       -active $0in_delay((`SII_L2_6_VLD & (`SII_L2_6_CMD==`SII_L2_WRI)), 1)
       -module cpu
       -clock l2clk
       -name sii_l2_6_WRI_PA_align_chk
    */
    /* 0in value -var `PA_LOW6_7
       -val 6'b000000
       -active $0in_delay((`SII_L2_7_VLD & (`SII_L2_7_CMD==`SII_L2_WRI)), 1)
       -module cpu
       -clock l2clk
       -name sii_l2_7_WRI_PA_align_chk
    */


  /*********************************
   WR8
   1. O=1; P=1; S=1
   2. PA[2:0] are zeros
   3. At least one Byte_mask = 1  
  **********************************/
// 1.
    /* 0in value -var ({`SII_L2_0_O,`SII_L2_0_P, `SII_L2_0_S})
       -val 3'b111
       -active (`SII_L2_0_VLD & (`SII_L2_0_CMD==`SII_L2_WR8))
       -module cpu
       -clock l2clk
       -name sii_l2_0_WR8_O_P_S_chk
    */
    /* 0in value -var ({`SII_L2_1_O,`SII_L2_1_P, `SII_L2_1_S})
       -val 3'b111
       -active (`SII_L2_1_VLD & (`SII_L2_1_CMD==`SII_L2_WR8))
       -module cpu
       -clock l2clk
       -name sii_l2_1_WR8_O_P_S_chk
    */
    /* 0in value -var ({`SII_L2_2_O,`SII_L2_2_P, `SII_L2_2_S})
       -val 3'b111
       -active (`SII_L2_2_VLD & (`SII_L2_2_CMD==`SII_L2_WR8))
       -module cpu
       -clock l2clk
       -name sii_l2_2_WR8_O_P_S_chk
    */
    /* 0in value -var ({`SII_L2_3_O,`SII_L2_3_P, `SII_L2_3_S})
       -val 3'b111
       -active (`SII_L2_3_VLD & (`SII_L2_3_CMD==`SII_L2_WR8))
       -module cpu
       -clock l2clk
       -name sii_l2_3_WR8_O_P_S_chk
    */
    /* 0in value -var ({`SII_L2_4_O,`SII_L2_4_P, `SII_L2_4_S})
       -val 3'b111
       -active (`SII_L2_4_VLD & (`SII_L2_4_CMD==`SII_L2_WR8))
       -module cpu
       -clock l2clk
       -name sii_l2_4_WR8_O_P_S_chk
    */
    /* 0in value -var ({`SII_L2_5_O,`SII_L2_5_P, `SII_L2_5_S})
       -val 3'b111
       -active (`SII_L2_5_VLD & (`SII_L2_5_CMD==`SII_L2_WR8))
       -module cpu
       -clock l2clk
       -name sii_l2_5_WR8_O_P_S_chk
    */
    /* 0in value -var ({`SII_L2_6_O,`SII_L2_6_P, `SII_L2_6_S})
       -val 3'b111
       -active (`SII_L2_6_VLD & (`SII_L2_6_CMD==`SII_L2_WR8))
       -module cpu
       -clock l2clk
       -name sii_l2_6_WR8_O_P_S_chk
    */
    /* 0in value -var ({`SII_L2_7_O,`SII_L2_7_P, `SII_L2_7_S})
       -val 3'b111
       -active (`SII_L2_7_VLD & (`SII_L2_7_CMD==`SII_L2_WR8))
       -module cpu
       -clock l2clk
       -name sii_l2_7_WR8_O_P_S_chk
    */


// 2. 
    /* 0in value -var `PA_LOW3_0
       -val 3'b000
       -active (`SII_L2_0_VLD & (`SII_L2_0_CMD==`SII_L2_WR8))
       -module cpu
       -clock l2clk
       -name sii_l2_0_WR8_PA_align_chk
    */
    /* 0in value -var `PA_LOW3_1
       -val 3'b000
       -active (`SII_L2_1_VLD & (`SII_L2_1_CMD==`SII_L2_WR8))
       -module cpu
       -clock l2clk
       -name sii_l2_1_WR8_PA_align_chk
    */
    /* 0in value -var `PA_LOW3_2
       -val 3'b000
       -active (`SII_L2_2_VLD & (`SII_L2_2_CMD==`SII_L2_WR8))
       -module cpu
       -clock l2clk
       -name sii_l2_2_WR8_PA_align_chk
    */
    /* 0in value -var `PA_LOW3_3
       -val 3'b000
       -active (`SII_L2_3_VLD & (`SII_L2_3_CMD==`SII_L2_WR8))
       -module cpu
       -clock l2clk
       -name sii_l2_3_WR8_PA_align_chk
    */
    /* 0in value -var `PA_LOW3_4
       -val 3'b000
       -active (`SII_L2_4_VLD & (`SII_L2_4_CMD==`SII_L2_WR8))
       -module cpu
       -clock l2clk
       -name sii_l2_4_WR8_PA_align_chk
    */
    /* 0in value -var `PA_LOW3_5
       -val 3'b000
       -active (`SII_L2_5_VLD & (`SII_L2_5_CMD==`SII_L2_WR8))
       -module cpu
       -clock l2clk
       -name sii_l2_5_WR8_PA_align_chk
    */
    /* 0in value -var `PA_LOW3_6
       -val 3'b000
       -active (`SII_L2_6_VLD & (`SII_L2_6_CMD==`SII_L2_WR8))
       -module cpu
       -clock l2clk
       -name sii_l2_6_WR8_PA_align_chk
    */
    /* 0in value -var `PA_LOW3_7
       -val 3'b000
       -active (`SII_L2_7_VLD & (`SII_L2_7_CMD==`SII_L2_WR8))
       -module cpu
       -clock l2clk
       -name sii_l2_7_WR8_PA_align_chk
    */

// 3.
    /* 0in never 
       -var (`BYTE_MASK_0 == 8'b00000000)
       -active (`SII_L2_0_VLD & (`SII_L2_0_CMD==`SII_L2_WR8))
       -module cpu
       -clock l2clk
       -name sii_l2_0_WR8_Bytemask_chk
    */
    /* 0in never 
       -var (`BYTE_MASK_1 == 8'b00000000)
       -active (`SII_L2_1_VLD & (`SII_L2_1_CMD==`SII_L2_WR8))
       -module cpu
       -clock l2clk
       -name sii_l2_1_WR8_Bytemask_chk
    */
    /* 0in never 
       -var (`BYTE_MASK_2 == 8'b00000000)
       -active (`SII_L2_2_VLD & (`SII_L2_2_CMD==`SII_L2_WR8))
       -module cpu
       -clock l2clk
       -name sii_l2_2_WR8_Bytemask_chk
    */
    /* 0in never 
       -var (`BYTE_MASK_3 == 8'b00000000)
       -active (`SII_L2_3_VLD & (`SII_L2_3_CMD==`SII_L2_WR8))
       -module cpu
       -clock l2clk
       -name sii_l2_3_WR8_Bytemask_chk
    */
    /* 0in never 
       -var (`BYTE_MASK_4 == 8'b00000000)
       -active (`SII_L2_4_VLD & (`SII_L2_4_CMD==`SII_L2_WR8))
       -module cpu
       -clock l2clk
       -name sii_l2_4_WR8_Bytemask_chk
    */
    /* 0in never 
       -var (`BYTE_MASK_5 == 8'b00000000)
       -active (`SII_L2_5_VLD & (`SII_L2_5_CMD==`SII_L2_WR8))
       -module cpu
       -clock l2clk
       -name sii_l2_5_WR8_Bytemask_chk
    */
    /* 0in never 
       -var (`BYTE_MASK_6 == 8'b00000000)
       -active (`SII_L2_6_VLD & (`SII_L2_6_CMD==`SII_L2_WR8))
       -module cpu
       -clock l2clk
       -name sii_l2_6_WR8_Bytemask_chk
    */
    /* 0in never 
       -var (`BYTE_MASK_7 == 8'b00000000)
       -active (`SII_L2_7_VLD & (`SII_L2_7_CMD==`SII_L2_WR8))
       -module cpu
       -clock l2clk
       -name sii_l2_7_WR8_Bytemask_chk
    */

  /***************************
   RDD 
   1. P always 0
   2. If from DMU O=1
   3. PA[2:0] are zeros
   4. 
  ***************************/

// 1.
    /* 0in value -var `SII_L2_0_P
       -val 1'b0
       -active (`SII_L2_0_VLD & (`SII_L2_0_TT==`SII_L2_RDD))
       -module cpu
       -clock l2clk
       -name sii_l2_0_RDD_P_chk
    */
    /* 0in value -var `SII_L2_1_P
       -val 1'b0
       -active (`SII_L2_1_VLD & (`SII_L2_1_TT==`SII_L2_RDD))
       -module cpu
       -clock l2clk
       -name sii_l2_1_RDD_P_chk
    */
    /* 0in value -var `SII_L2_2_P
       -val 1'b0
       -active (`SII_L2_2_VLD & (`SII_L2_2_TT==`SII_L2_RDD))
       -module cpu
       -clock l2clk
       -name sii_l2_2_RDD_P_chk
    */
    /* 0in value -var `SII_L2_3_P
       -val 1'b0
       -active (`SII_L2_3_VLD & (`SII_L2_3_TT==`SII_L2_RDD))
       -module cpu
       -clock l2clk
       -name sii_l2_3_RDD_P_chk
    */
    /* 0in value -var `SII_L2_4_P
       -val 1'b0
       -active (`SII_L2_4_VLD & (`SII_L2_4_TT==`SII_L2_RDD))
       -module cpu
       -clock l2clk
       -name sii_l2_4_RDD_P_chk
    */
    /* 0in value -var `SII_L2_5_P
       -val 1'b0
       -active (`SII_L2_5_VLD & (`SII_L2_5_TT==`SII_L2_RDD))
       -module cpu
       -clock l2clk
       -name sii_l2_5_RDD_P_chk
    */
    /* 0in value -var `SII_L2_6_P
       -val 1'b0
       -active (`SII_L2_6_VLD & (`SII_L2_6_TT==`SII_L2_RDD))
       -module cpu
       -clock l2clk
       -name sii_l2_6_RDD_P_chk
    */
    /* 0in value -var `SII_L2_7_P
       -val 1'b0
       -active (`SII_L2_7_VLD & (`SII_L2_7_TT==`SII_L2_RDD))
       -module cpu
       -clock l2clk
       -name sii_l2_7_RDD_P_chk
    */


// 2.
    /* 0in value -var `SII_L2_0_O
       -val 1'b1
       -active (`SII_L2_0_VLD & (`SII_L2_0_TT==`SII_L2_RDD) & (`SII_L2_0_S==`DMU))
       -module cpu
       -clock l2clk
       -name sii_l2_0_RDD_O_chk
    */
    /* 0in value -var `SII_L2_1_O
       -val 1'b1
       -active (`SII_L2_1_VLD & (`SII_L2_1_TT==`SII_L2_RDD) & (`SII_L2_1_S==`DMU))
       -module cpu
       -clock l2clk
       -name sii_l2_1_RDD_O_chk
    */
    /* 0in value -var `SII_L2_2_O
       -val 1'b1
       -active (`SII_L2_2_VLD & (`SII_L2_2_TT==`SII_L2_RDD) & (`SII_L2_2_S==`DMU))
       -module cpu
       -clock l2clk
       -name sii_l2_2_RDD_O_chk
    */
    /* 0in value -var `SII_L2_3_O
       -val 1'b1
       -active (`SII_L2_3_VLD & (`SII_L2_3_TT==`SII_L2_RDD) & (`SII_L2_3_S==`DMU))
       -module cpu
       -clock l2clk
       -name sii_l2_3_RDD_O_chk
    */
    /* 0in value -var `SII_L2_4_O
       -val 1'b1
       -active (`SII_L2_4_VLD & (`SII_L2_4_TT==`SII_L2_RDD) & (`SII_L2_4_S==`DMU))
       -module cpu
       -clock l2clk
       -name sii_l2_4_RDD_O_chk
    */
    /* 0in value -var `SII_L2_5_O
       -val 1'b1
       -active (`SII_L2_5_VLD & (`SII_L2_5_TT==`SII_L2_RDD) & (`SII_L2_5_S==`DMU))
       -module cpu
       -clock l2clk
       -name sii_l2_5_RDD_O_chk
    */
    /* 0in value -var `SII_L2_6_O
       -val 1'b1
       -active (`SII_L2_6_VLD & (`SII_L2_6_TT==`SII_L2_RDD) & (`SII_L2_6_S==`DMU))
       -module cpu
       -clock l2clk
       -name sii_l2_6_RDD_O_chk
    */
    /* 0in value -var `SII_L2_7_O
       -val 1'b1
       -active (`SII_L2_7_VLD & (`SII_L2_7_TT==`SII_L2_RDD) & (`SII_L2_7_S==`DMU))
       -module cpu
       -clock l2clk
       -name sii_l2_7_RDD_O_chk
    */


// 3.
    /* 0in value -var `PA_LOW6_0
       -val 6'b000000
       -active $0in_delay((`SII_L2_0_VLD & (`SII_L2_0_CMD==`SII_L2_RDD)), 1)
       -module cpu
       -clock l2clk
       -name sii_l2_0_RDD_PA_align_chk
    */
    /* 0in value -var `PA_LOW6_1
       -val 6'b000000
       -active $0in_delay((`SII_L2_1_VLD & (`SII_L2_1_CMD==`SII_L2_RDD)), 1)
       -module cpu
       -clock l2clk
       -name sii_l2_1_RDD_PA_align_chk
    */
    /* 0in value -var `PA_LOW6_2
       -val 6'b000000
       -active $0in_delay((`SII_L2_2_VLD & (`SII_L2_2_CMD==`SII_L2_RDD)), 1)
       -module cpu
       -clock l2clk
       -name sii_l2_2_RDD_PA_align_chk
    */
    /* 0in value -var `PA_LOW6_3
       -val 6'b000000
       -active $0in_delay((`SII_L2_3_VLD & (`SII_L2_3_CMD==`SII_L2_RDD)), 1)
       -module cpu
       -clock l2clk
       -name sii_l2_3_RDD_PA_align_chk
    */
    /* 0in value -var `PA_LOW6_4
       -val 6'b000000
       -active $0in_delay((`SII_L2_4_VLD & (`SII_L2_4_CMD==`SII_L2_RDD)), 1)
       -module cpu
       -clock l2clk
       -name sii_l2_4_RDD_PA_align_chk
    */
    /* 0in value -var `PA_LOW6_5
       -val 6'b000000
       -active $0in_delay((`SII_L2_5_VLD & (`SII_L2_5_CMD==`SII_L2_RDD)), 1)
       -module cpu
       -clock l2clk
       -name sii_l2_5_RDD_PA_align_chk
    */
    /* 0in value -var `PA_LOW6_6
       -val 6'b000000
       -active $0in_delay((`SII_L2_6_VLD & (`SII_L2_6_CMD==`SII_L2_RDD)), 1)
       -module cpu
       -clock l2clk
       -name sii_l2_6_RDD_PA_align_chk
    */
    /* 0in value -var `PA_LOW6_7
       -val 6'b000000
       -active $0in_delay((`SII_L2_7_VLD & (`SII_L2_7_CMD==`SII_L2_RDD)), 1)
       -module cpu
       -clock l2clk
       -name sii_l2_7_RDD_PA_align_chk
    */




   // Outbound valid Transactions    

    /* 0in value -var `L2_0_SIO_CMD -casex
     -val `L2_DMU_RDD_ord_npt `L2_DMU_WR8_ord_pst `L2_DMU_WRI_pst_ord `L2_NIU_RDD_ord_npt `L2_NIU_RDD_byp_npt `L2_NIU_WRI_ord_npt `L2_NIU_WRI_byp_npt `L2_NIU_WRI_ord_pst `L2_NIU_WRI_byp_pst
     -active l2b0_sio_ctag_vld
     -clock l2clk
     -module cpu 
     -name l2_0_sio_hdr_cmd_vld
     -message "Bad value for l2_0_sio header"
    */
    /* 0in value -var `L2_1_SIO_CMD -casex
     -val `L2_DMU_RDD_ord_npt `L2_DMU_WR8_ord_pst `L2_DMU_WRI_pst_ord `L2_NIU_RDD_ord_npt `L2_NIU_RDD_byp_npt `L2_NIU_WRI_ord_npt `L2_NIU_WRI_byp_npt `L2_NIU_WRI_ord_pst `L2_NIU_WRI_byp_pst
     -active l2b1_sio_ctag_vld
     -clock l2clk
     -module cpu 
     -name l2_1_sio_hdr_cmd_vld
     -message "Bad value for l2_1_sio header"
    */
    /* 0in value -var `L2_2_SIO_CMD -casex
     -val `L2_DMU_RDD_ord_npt `L2_DMU_WR8_ord_pst `L2_DMU_WRI_pst_ord `L2_NIU_RDD_ord_npt `L2_NIU_RDD_byp_npt `L2_NIU_WRI_ord_npt `L2_NIU_WRI_byp_npt `L2_NIU_WRI_ord_pst `L2_NIU_WRI_byp_pst
     -active l2b2_sio_ctag_vld
     -clock l2clk
     -module cpu 
     -name l2_2_sio_hdr_cmd_vld
     -message "Bad value for l2_2_sio header"
    */
    /* 0in value -var `L2_3_SIO_CMD -casex
     -val `L2_DMU_RDD_ord_npt `L2_DMU_WR8_ord_pst `L2_DMU_WRI_pst_ord `L2_NIU_RDD_ord_npt `L2_NIU_RDD_byp_npt `L2_NIU_WRI_ord_npt `L2_NIU_WRI_byp_npt `L2_NIU_WRI_ord_pst `L2_NIU_WRI_byp_pst
     -active l2b3_sio_ctag_vld
     -clock l2clk
     -module cpu 
     -name l2_3_sio_hdr_cmd_vld
     -message "Bad value for l2_3_sio header"
    */
    /* 0in value -var `L2_4_SIO_CMD -casex
     -val `L2_DMU_RDD_ord_npt `L2_DMU_WR8_ord_pst `L2_DMU_WRI_pst_ord `L2_NIU_RDD_ord_npt `L2_NIU_RDD_byp_npt `L2_NIU_WRI_ord_npt `L2_NIU_WRI_byp_npt `L2_NIU_WRI_ord_pst `L2_NIU_WRI_byp_pst
     -active l2b4_sio_ctag_vld
     -clock l2clk
     -module cpu 
     -name l2_4_sio_hdr_cmd_vld
     -message "Bad value for l2_4_sio header"
    */
    /* 0in value -var `L2_5_SIO_CMD -casex
     -val `L2_DMU_RDD_ord_npt `L2_DMU_WR8_ord_pst `L2_DMU_WRI_pst_ord `L2_NIU_RDD_ord_npt `L2_NIU_RDD_byp_npt `L2_NIU_WRI_ord_npt `L2_NIU_WRI_byp_npt `L2_NIU_WRI_ord_pst `L2_NIU_WRI_byp_pst
     -active l2b5_sio_ctag_vld
     -clock l2clk
     -module cpu 
     -name l2_5_sio_hdr_cmd_vld
     -message "Bad value for l2_5_sio header"
    */
    /* 0in value -var `L2_6_SIO_CMD -casex
     -val `L2_DMU_RDD_ord_npt `L2_DMU_WR8_ord_pst `L2_DMU_WRI_pst_ord `L2_NIU_RDD_ord_npt `L2_NIU_RDD_byp_npt `L2_NIU_WRI_ord_npt `L2_NIU_WRI_byp_npt `L2_NIU_WRI_ord_pst `L2_NIU_WRI_byp_pst
     -active l2b6_sio_ctag_vld
     -clock l2clk
     -module cpu 
     -name l2_6_sio_hdr_cmd_vld
     -message "Bad value for l2_6_sio header"
    */
    /* 0in value -var `L2_7_SIO_CMD -casex
     -val `L2_DMU_RDD_ord_npt `L2_DMU_WR8_ord_pst `L2_DMU_WRI_pst_ord `L2_NIU_RDD_ord_npt `L2_NIU_RDD_byp_npt `L2_NIU_WRI_ord_npt `L2_NIU_WRI_byp_npt `L2_NIU_WRI_ord_pst `L2_NIU_WRI_byp_pst
     -active l2b7_sio_ctag_vld
     -clock l2clk
     -module cpu 
     -name l2_7_sio_hdr_cmd_vld
     -message "Bad value for l2_7_sio header"
    */


  /***************************
   Outbound RDD
   1. P always 0
   2. If from DMU O=1
   3. CBA[2:0] are zeros
   4.
  ***************************/

// 1.
    /* 0in value -var `L2_0_SIO_P
       -val 1'b0
       -active (`L2_0_SIO_VLD & (`L2_0_SIO_TT==`L2_SIO_RDD))
       -module cpu
       -clock l2clk
       -name l2_0_sii_RDD_P_chk
    */
    /* 0in value -var `L2_1_SIO_P
       -val 1'b0
       -active (`L2_1_SIO_VLD & (`L2_1_SIO_TT==`L2_SIO_RDD))
       -module cpu
       -clock l2clk
       -name l2_1_sii_RDD_P_chk
    */
    /* 0in value -var `L2_2_SIO_P
       -val 1'b0
       -active (`L2_2_SIO_VLD & (`L2_2_SIO_TT==`L2_SIO_RDD))
       -module cpu
       -clock l2clk
       -name l2_2_sii_RDD_P_chk
    */
    /* 0in value -var `L2_3_SIO_P
       -val 1'b0
       -active (`L2_3_SIO_VLD & (`L2_3_SIO_TT==`L2_SIO_RDD))
       -module cpu
       -clock l2clk
       -name l2_3_sii_RDD_P_chk
    */
    /* 0in value -var `L2_4_SIO_P
       -val 1'b0
       -active (`L2_4_SIO_VLD & (`L2_4_SIO_TT==`L2_SIO_RDD))
       -module cpu
       -clock l2clk
       -name l2_4_sii_RDD_P_chk
    */
    /* 0in value -var `L2_5_SIO_P
       -val 1'b0
       -active (`L2_5_SIO_VLD & (`L2_5_SIO_TT==`L2_SIO_RDD))
       -module cpu
       -clock l2clk
       -name l2_5_sii_RDD_P_chk
    */
    /* 0in value -var `L2_6_SIO_P
       -val 1'b0
       -active (`L2_6_SIO_VLD & (`L2_6_SIO_TT==`L2_SIO_RDD))
       -module cpu
       -clock l2clk
       -name l2_6_sii_RDD_P_chk
    */
    /* 0in value -var `L2_7_SIO_P
       -val 1'b0
       -active (`L2_7_SIO_VLD & (`L2_7_SIO_TT==`L2_SIO_RDD))
       -module cpu
       -clock l2clk
       -name l2_7_sii_RDD_P_chk
    */


// 2.
    /* 0in value -var `L2_0_SIO_O
       -val 1'b1
       -active (`L2_0_SIO_VLD & (`L2_0_SIO_TT==`L2_SIO_RDD) & (`L2_0_SIO_S==`DMU))
       -module cpu
       -clock l2clk
       -name l2_0_sii_RDD_O_chk
    */
    /* 0in value -var `L2_1_SIO_O
       -val 1'b1
       -active (`L2_1_SIO_VLD & (`L2_1_SIO_TT==`L2_SIO_RDD) & (`L2_1_SIO_S==`DMU))
       -module cpu
       -clock l2clk
       -name l2_1_sii_RDD_O_chk
    */
    /* 0in value -var `L2_2_SIO_O
       -val 1'b1
       -active (`L2_2_SIO_VLD & (`L2_2_SIO_TT==`L2_SIO_RDD) & (`L2_2_SIO_S==`DMU))
       -module cpu
       -clock l2clk
       -name l2_2_sii_RDD_O_chk
    */
    /* 0in value -var `L2_3_SIO_O
       -val 1'b1
       -active (`L2_3_SIO_VLD & (`L2_3_SIO_TT==`L2_SIO_RDD) & (`L2_3_SIO_S==`DMU))
       -module cpu
       -clock l2clk
       -name l2_3_sii_RDD_O_chk
    */
    /* 0in value -var `L2_4_SIO_O
       -val 1'b1
       -active (`L2_4_SIO_VLD & (`L2_4_SIO_TT==`L2_SIO_RDD) & (`L2_4_SIO_S==`DMU))
       -module cpu
       -clock l2clk
       -name l2_4_sii_RDD_O_chk
    */
    /* 0in value -var `L2_5_SIO_O
       -val 1'b1
       -active (`L2_5_SIO_VLD & (`L2_5_SIO_TT==`L2_SIO_RDD) & (`L2_5_SIO_S==`DMU))
       -module cpu
       -clock l2clk
       -name l2_5_sii_RDD_O_chk
    */
    /* 0in value -var `L2_6_SIO_O
       -val 1'b1
       -active (`L2_6_SIO_VLD & (`L2_6_SIO_TT==`L2_SIO_RDD) & (`L2_6_SIO_S==`DMU))
       -module cpu
       -clock l2clk
       -name l2_6_sii_RDD_O_chk
    */
    /* 0in value -var `L2_7_SIO_O
       -val 1'b1
       -active (`L2_7_SIO_VLD & (`L2_7_SIO_TT==`L2_SIO_RDD) & (`L2_7_SIO_S==`DMU))
       -module cpu
       -clock l2clk
       -name l2_7_sii_RDD_O_chk
    */


// 3.
    /* 0in value -var `CBA_0
       -val 3'b000
       -active (`L2_0_SIO_VLD & (`L2_0_SIO_CMD==`L2_SIO_RDD))
       -module cpu
       -clock l2clk
       -name sii_l2_0_RDD_CBA_chk
    */
    /* 0in value -var `CBA_1
       -val 3'b000
       -active (`L2_1_SIO_VLD & (`L2_1_SIO_CMD==`L2_SIO_RDD))
       -module cpu
       -clock l2clk
       -name sii_l2_1_RDD_CBA_chk
    */
    /* 0in value -var `CBA_2
       -val 3'b000
       -active (`L2_2_SIO_VLD & (`L2_2_SIO_CMD==`L2_SIO_RDD))
       -module cpu
       -clock l2clk
       -name sii_l2_2_RDD_CBA_chk
    */
    /* 0in value -var `CBA_3
       -val 3'b000
       -active (`L2_3_SIO_VLD & (`L2_3_SIO_CMD==`L2_SIO_RDD))
       -module cpu
       -clock l2clk
       -name sii_l2_3_RDD_CBA_chk
    */
    /* 0in value -var `CBA_4
       -val 3'b000
       -active (`L2_4_SIO_VLD & (`L2_4_SIO_CMD==`L2_SIO_RDD))
       -module cpu
       -clock l2clk
       -name sii_l2_4_RDD_CBA_chk
    */
    /* 0in value -var `CBA_5
       -val 3'b000
       -active (`L2_5_SIO_VLD & (`L2_5_SIO_CMD==`L2_SIO_RDD))
       -module cpu
       -clock l2clk
       -name sii_l2_5_RDD_CBA_chk
    */
    /* 0in value -var `CBA_6
       -val 3'b000
       -active (`L2_6_SIO_VLD & (`L2_6_SIO_CMD==`L2_SIO_RDD))
       -module cpu
       -clock l2clk
       -name sii_l2_6_RDD_CBA_chk
    */
    /* 0in value -var `CBA_7
       -val 3'b000
       -active (`L2_7_SIO_VLD & (`L2_7_SIO_CMD==`L2_SIO_RDD))
       -module cpu
       -clock l2clk
       -name sii_l2_7_RDD_CBA_chk
    */


  /***************************
   Outbound WRI 
   1. P is 1 if from DMU 
   2. If from DMU O=1
   3. CBA[2:0] are zeros
   4.
  ***************************/

// 1.
    /* 0in value -var `L2_0_SIO_P
       -val 1'b1
       -active (`L2_0_SIO_VLD & (`L2_0_SIO_TT==`L2_SIO_WRI) & (`L2_0_SIO_S==`DMU))
       -module cpu
       -clock l2clk
       -name l2_0_sii_WRI_P_chk
    */
    /* 0in value -var `L2_1_SIO_P
       -val 1'b1
       -active (`L2_1_SIO_VLD & (`L2_1_SIO_TT==`L2_SIO_WRI) & (`L2_1_SIO_S==`DMU))
       -module cpu
       -clock l2clk
       -name l2_1_sii_WRI_P_chk
    */
    /* 0in value -var `L2_2_SIO_P
       -val 1'b1
       -active (`L2_2_SIO_VLD & (`L2_2_SIO_TT==`L2_SIO_WRI) & (`L2_2_SIO_S==`DMU))
       -module cpu
       -clock l2clk
       -name l2_2_sii_WRI_P_chk
    */
    /* 0in value -var `L2_3_SIO_P
       -val 1'b1
       -active (`L2_3_SIO_VLD & (`L2_3_SIO_TT==`L2_SIO_WRI) & (`L2_3_SIO_S==`DMU))
       -module cpu
       -clock l2clk
       -name l2_3_sii_WRI_P_chk
    */
    /* 0in value -var `L2_4_SIO_P
       -val 1'b1
       -active (`L2_4_SIO_VLD & (`L2_4_SIO_TT==`L2_SIO_WRI) & (`L2_4_SIO_S==`DMU))
       -module cpu
       -clock l2clk
       -name l2_4_sii_WRI_P_chk
    */
    /* 0in value -var `L2_5_SIO_P
       -val 1'b1
       -active (`L2_5_SIO_VLD & (`L2_5_SIO_TT==`L2_SIO_WRI) & (`L2_5_SIO_S==`DMU))
       -module cpu
       -clock l2clk
       -name l2_5_sii_WRI_P_chk
    */
    /* 0in value -var `L2_6_SIO_P
       -val 1'b1
       -active (`L2_6_SIO_VLD & (`L2_6_SIO_TT==`L2_SIO_WRI) & (`L2_6_SIO_S==`DMU))
       -module cpu
       -clock l2clk
       -name l2_6_sii_WRI_P_chk
    */
    /* 0in value -var `L2_7_SIO_P
       -val 1'b1
       -active (`L2_7_SIO_VLD & (`L2_7_SIO_TT==`L2_SIO_WRI) & (`L2_7_SIO_S==`DMU))
       -module cpu
       -clock l2clk
       -name l2_7_sii_WRI_P_chk
    */


// 2.
    /* 0in value -var `L2_0_SIO_O
       -val 1'b1
       -active (`L2_0_SIO_VLD & (`L2_0_SIO_TT==`L2_SIO_WRI) & (`L2_0_SIO_S==`DMU))
       -module cpu
       -clock l2clk
       -name l2_0_sii_WRI_O_chk
    */
    /* 0in value -var `L2_1_SIO_O
       -val 1'b1
       -active (`L2_1_SIO_VLD & (`L2_1_SIO_TT==`L2_SIO_WRI) & (`L2_1_SIO_S==`DMU))
       -module cpu
       -clock l2clk
       -name l2_1_sii_WRI_O_chk
    */
    /* 0in value -var `L2_2_SIO_O
       -val 1'b1
       -active (`L2_2_SIO_VLD & (`L2_2_SIO_TT==`L2_SIO_WRI) & (`L2_2_SIO_S==`DMU))
       -module cpu
       -clock l2clk
       -name l2_2_sii_WRI_O_chk
    */
    /* 0in value -var `L2_3_SIO_O
       -val 1'b1
       -active (`L2_3_SIO_VLD & (`L2_3_SIO_TT==`L2_SIO_WRI) & (`L2_3_SIO_S==`DMU))
       -module cpu
       -clock l2clk
       -name l2_3_sii_WRI_O_chk
    */
    /* 0in value -var `L2_4_SIO_O
       -val 1'b1
       -active (`L2_4_SIO_VLD & (`L2_4_SIO_TT==`L2_SIO_WRI) & (`L2_4_SIO_S==`DMU))
       -module cpu
       -clock l2clk
       -name l2_4_sii_WRI_O_chk
    */
    /* 0in value -var `L2_5_SIO_O
       -val 1'b1
       -active (`L2_5_SIO_VLD & (`L2_5_SIO_TT==`L2_SIO_WRI) & (`L2_5_SIO_S==`DMU))
       -module cpu
       -clock l2clk
       -name l2_5_sii_WRI_O_chk
    */
    /* 0in value -var `L2_6_SIO_O
       -val 1'b1
       -active (`L2_6_SIO_VLD & (`L2_6_SIO_TT==`L2_SIO_WRI) & (`L2_6_SIO_S==`DMU))
       -module cpu
       -clock l2clk
       -name l2_6_sii_WRI_O_chk
    */
    /* 0in value -var `L2_7_SIO_O
       -val 1'b1
       -active (`L2_7_SIO_VLD & (`L2_7_SIO_TT==`L2_SIO_WRI) & (`L2_7_SIO_S==`DMU))
       -module cpu
       -clock l2clk
       -name l2_7_sii_WRI_O_chk
    */


// 3.
    /* 0in value -var `CBA_0
       -val 3'b000
       -active (`L2_0_SIO_VLD & (`L2_0_SIO_CMD==`L2_SIO_WRI))
       -module cpu
       -clock l2clk
       -name sii_l2_0_WRI_CBA_chk
    */
    /* 0in value -var `CBA_1
       -val 3'b000
       -active (`L2_1_SIO_VLD & (`L2_1_SIO_CMD==`L2_SIO_WRI))
       -module cpu
       -clock l2clk
       -name sii_l2_1_WRI_CBA_chk
    */
    /* 0in value -var `CBA_2
       -val 3'b000
       -active (`L2_2_SIO_VLD & (`L2_2_SIO_CMD==`L2_SIO_WRI))
       -module cpu
       -clock l2clk
       -name sii_l2_2_WRI_CBA_chk
    */
    /* 0in value -var `CBA_3
       -val 3'b000
       -active (`L2_3_SIO_VLD & (`L2_3_SIO_CMD==`L2_SIO_WRI))
       -module cpu
       -clock l2clk
       -name sii_l2_3_WRI_CBA_chk
    */
    /* 0in value -var `CBA_4
       -val 3'b000
       -active (`L2_4_SIO_VLD & (`L2_4_SIO_CMD==`L2_SIO_WRI))
       -module cpu
       -clock l2clk
       -name sii_l2_4_WRI_CBA_chk
    */
    /* 0in value -var `CBA_5
       -val 3'b000
       -active (`L2_5_SIO_VLD & (`L2_5_SIO_CMD==`L2_SIO_WRI))
       -module cpu
       -clock l2clk
       -name sii_l2_5_WRI_CBA_chk
    */
    /* 0in value -var `CBA_6
       -val 3'b000
       -active (`L2_6_SIO_VLD & (`L2_6_SIO_CMD==`L2_SIO_WRI))
       -module cpu
       -clock l2clk
       -name sii_l2_6_WRI_CBA_chk
    */
    /* 0in value -var `CBA_7
       -val 3'b000
       -active (`L2_7_SIO_VLD & (`L2_7_SIO_CMD==`L2_SIO_WRI))
       -module cpu
       -clock l2clk
       -name sii_l2_7_WRI_CBA_chk
    */


  /********************************************
     16 cycle gap between 2 l2t_sii_iq_dequeue 
  ********************************************/


  /**********************************************************************
     Minumum 4 (2nd hdr, 2 data/dummy, 1 turn-around) cycles 
     gap after an RDD or WR8
  **********************************************************************/
    /* 0in assert_window
     -start (`SII_L2_0_VLD & ((`SII_L2_0_TT==`SII_L2_RDD) | (`SII_L2_0_TT==`SII_L2_WR8)))
     -start_count 0 -stop_count 4
     -not_in `SII_L2_0_VLD 
     -clock l2clk
     -module cpu 
     -name sii_l2_0_min_gap_WR8_RDD
    */
    /* 0in assert_window
     -start (`SII_L2_1_VLD & ((`SII_L2_1_TT==`SII_L2_RDD) | (`SII_L2_1_TT==`SII_L2_WR8)))
     -start_count 0 -stop_count 4
     -not_in `SII_L2_1_VLD 
     -clock l2clk
     -module cpu 
     -name sii_l2_1_min_gap_WR8_RDD
    */
    /* 0in assert_window
     -start (`SII_L2_2_VLD & ((`SII_L2_2_TT==`SII_L2_RDD) | (`SII_L2_2_TT==`SII_L2_WR8)))
     -start_count 0 -stop_count 4
     -not_in `SII_L2_2_VLD 
     -clock l2clk
     -module cpu 
     -name sii_l2_2_min_gap_WR8_RDD
    */
    /* 0in assert_window
     -start (`SII_L2_3_VLD & ((`SII_L2_3_TT==`SII_L2_RDD) | (`SII_L2_3_TT==`SII_L2_WR8)))
     -start_count 0 -stop_count 4
     -not_in `SII_L2_3_VLD 
     -clock l2clk
     -module cpu 
     -name sii_l2_3_min_gap_WR8_RDD
    */
    /* 0in assert_window
     -start (`SII_L2_4_VLD & ((`SII_L2_4_TT==`SII_L2_RDD) | (`SII_L2_4_TT==`SII_L2_WR8)))
     -start_count 0 -stop_count 4
     -not_in `SII_L2_4_VLD 
     -clock l2clk
     -module cpu 
     -name sii_l2_4_min_gap_WR8_RDD
    */
    /* 0in assert_window
     -start (`SII_L2_5_VLD & ((`SII_L2_5_TT==`SII_L2_RDD) | (`SII_L2_5_TT==`SII_L2_WR8)))
     -start_count 0 -stop_count 4
     -not_in `SII_L2_5_VLD 
     -clock l2clk
     -module cpu 
     -name sii_l2_5_min_gap_WR8_RDD
    */
    /* 0in assert_window
     -start (`SII_L2_6_VLD & ((`SII_L2_6_TT==`SII_L2_RDD) | (`SII_L2_6_TT==`SII_L2_WR8)))
     -start_count 0 -stop_count 4
     -not_in `SII_L2_6_VLD 
     -clock l2clk
     -module cpu 
     -name sii_l2_6_min_gap_WR8_RDD
    */
    /* 0in assert_window
     -start (`SII_L2_7_VLD & ((`SII_L2_7_TT==`SII_L2_RDD) | (`SII_L2_7_TT==`SII_L2_WR8)))
     -start_count 0 -stop_count 4
     -not_in `SII_L2_7_VLD 
     -clock l2clk
     -module cpu 
     -name sii_l2_7_min_gap_WR8_RDD
    */

  /*********************************************************************
     Minumum 18 (2nd hdr, 16 data, 1 turn-around) cycles
     gap after a WRI
  **********************************************************************/
    /* 0in assert_window
     -start (`SII_L2_0_VLD & (`SII_L2_0_TT==`SII_L2_WRI))
     -start_count 0 -stop_count 18
     -not_in `SII_L2_0_VLD 
     -clock l2clk
     -module cpu 
     -name sii_l2_0_min_gap_WRI 
   */
    /* 0in assert_window
     -start (`SII_L2_1_VLD & (`SII_L2_1_TT==`SII_L2_WRI))
     -start_count 0 -stop_count 18
     -not_in `SII_L2_1_VLD 
     -clock l2clk
     -module cpu 
     -name sii_l2_1_min_gap_WRI 
   */
    /* 0in assert_window
     -start (`SII_L2_2_VLD & (`SII_L2_2_TT==`SII_L2_WRI))
     -start_count 0 -stop_count 18
     -not_in `SII_L2_2_VLD 
     -clock l2clk
     -module cpu 
     -name sii_l2_2_min_gap_WRI 
   */
    /* 0in assert_window
     -start (`SII_L2_3_VLD & (`SII_L2_3_TT==`SII_L2_WRI))
     -start_count 0 -stop_count 18
     -not_in `SII_L2_3_VLD 
     -clock l2clk
     -module cpu 
     -name sii_l2_3_min_gap_WRI 
   */
    /* 0in assert_window
     -start (`SII_L2_4_VLD & (`SII_L2_4_TT==`SII_L2_WRI))
     -start_count 0 -stop_count 18
     -not_in `SII_L2_4_VLD 
     -clock l2clk
     -module cpu 
     -name sii_l2_4_min_gap_WRI 
   */
    /* 0in assert_window
     -start (`SII_L2_5_VLD & (`SII_L2_5_TT==`SII_L2_WRI))
     -start_count 0 -stop_count 18
     -not_in `SII_L2_5_VLD 
     -clock l2clk
     -module cpu 
     -name sii_l2_5_min_gap_WRI 
   */
    /* 0in assert_window
     -start (`SII_L2_6_VLD & (`SII_L2_6_TT==`SII_L2_WRI))
     -start_count 0 -stop_count 18
     -not_in `SII_L2_6_VLD 
     -clock l2clk
     -module cpu 
     -name sii_l2_6_min_gap_WRI 
   */
    /* 0in assert_window
     -start (`SII_L2_7_VLD & (`SII_L2_7_TT==`SII_L2_WRI))
     -start_count 0 -stop_count 18
     -not_in `SII_L2_7_VLD 
     -clock l2clk
     -module cpu 
     -name sii_l2_7_min_gap_WRI 
   */




  /* req and ack */

   /* 0in assert_follower
    -leader `SII_L2_0_VLD
    -follower l2t0_sii_iq_dequeue
    -min 5
    -max 8000
    -max_leader 2
    -module cpu
    -clock l2clk
    -name sii_l2_0_req_assert_follower
   */

   /* 0in assert_leader
    -leader `SII_L2_0_VLD
    -follower l2t0_sii_iq_dequeue
    -min 5
    -max 8000
    -max_leader 2
    -clock l2clk
    -module cpu
    -name sii_l2_0_req_assert_leader
   */
   /* 0in assert_follower
    -leader `SII_L2_1_VLD
    -follower l2t1_sii_iq_dequeue
    -min 5
    -max 8000
    -max_leader 2
    -module cpu
    -clock l2clk
    -name sii_l2_1_req_assert_follower
   */

   /* 0in assert_leader
    -leader `SII_L2_1_VLD
    -follower l2t1_sii_iq_dequeue
    -min 5
    -max 8000
    -max_leader 2
    -clock l2clk
    -module cpu
    -name sii_l2_1_req_assert_leader
   */
   /* 0in assert_follower
    -leader `SII_L2_2_VLD
    -follower l2t2_sii_iq_dequeue
    -min 5
    -max 8000
    -max_leader 2
    -module cpu
    -clock l2clk
    -name sii_l2_2_req_assert_follower
   */

   /* 0in assert_leader
    -leader `SII_L2_2_VLD
    -follower l2t2_sii_iq_dequeue
    -min 5
    -max 8000
    -max_leader 2
    -clock l2clk
    -module cpu
    -name sii_l2_2_req_assert_leader
   */
   /* 0in assert_follower
    -leader `SII_L2_3_VLD
    -follower l2t3_sii_iq_dequeue
    -min 5
    -max 8000
    -max_leader 2
    -module cpu
    -clock l2clk
    -name sii_l2_3_req_assert_follower
   */

   /* 0in assert_leader
    -leader `SII_L2_3_VLD
    -follower l2t3_sii_iq_dequeue
    -min 5
    -max 8000
    -max_leader 2
    -clock l2clk
    -module cpu
    -name sii_l2_3_req_assert_leader
   */
   /* 0in assert_follower
    -leader `SII_L2_4_VLD
    -follower l2t4_sii_iq_dequeue
    -min 5
    -max 8000
    -max_leader 2
    -module cpu
    -clock l2clk
    -name sii_l2_4_req_assert_follower
   */

   /* 0in assert_leader
    -leader `SII_L2_4_VLD
    -follower l2t4_sii_iq_dequeue
    -min 5
    -max 8000
    -max_leader 2
    -clock l2clk
    -module cpu
    -name sii_l2_4_req_assert_leader
   */
   /* 0in assert_follower
    -leader `SII_L2_5_VLD
    -follower l2t5_sii_iq_dequeue
    -min 5
    -max 8000
    -max_leader 2
    -module cpu
    -clock l2clk
    -name sii_l2_5_req_assert_follower
   */

   /* 0in assert_leader
    -leader `SII_L2_5_VLD
    -follower l2t5_sii_iq_dequeue
    -min 5
    -max 8000
    -max_leader 2
    -clock l2clk
    -module cpu
    -name sii_l2_5_req_assert_leader
   */
   /* 0in assert_follower
    -leader `SII_L2_6_VLD
    -follower l2t6_sii_iq_dequeue
    -min 5
    -max 8000
    -max_leader 2
    -module cpu
    -clock l2clk
    -name sii_l2_6_req_assert_follower
   */

   /* 0in assert_leader
    -leader `SII_L2_6_VLD
    -follower l2t6_sii_iq_dequeue
    -min 5
    -max 8000
    -max_leader 2
    -clock l2clk
    -module cpu
    -name sii_l2_6_req_assert_leader
   */
   /* 0in assert_follower
    -leader `SII_L2_7_VLD
    -follower l2t7_sii_iq_dequeue
    -min 5
    -max 8000
    -max_leader 2
    -module cpu
    -clock l2clk
    -name sii_l2_7_req_assert_follower
   */

   /* 0in assert_leader
    -leader `SII_L2_7_VLD
    -follower l2t7_sii_iq_dequeue
    -min 5
    -max 8000
    -max_leader 2
    -clock l2clk
    -module cpu
    -name sii_l2_7_req_assert_leader
   */




// Put some bus_id

// Transactions from the same bank should be in-order;
// so use fifo chkr

endmodule // sii_l2_chkr
