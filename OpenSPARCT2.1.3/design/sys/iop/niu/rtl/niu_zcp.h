/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: niu_zcp.h
* Copyright (C) 1995-2007 Sun Microsystems, Inc. All Rights Reserved
* 4150 Network Circle, Santa Clara, California 95054, U.S.A.
*
* DO NOT ALTER OR REMOVE COPYRIGHT NOTICES OR THIS FILE HEADER. 
*
* This program is free software; you can redistribute it and/or modify
* it under the terms of the GNU General Public License as published by
* the Free Software Foundation; version 2 of the License.
*
* This program is distributed in the hope that it will be useful,
* but WITHOUT ANY WARRANTY; without even the implied warranty of
* MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
* GNU General Public License for more details.
*
* You should have received a copy of the GNU General Public License
* along with this program; if not, write to the Free Software
* Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
*
* For the avoidance of doubt, and except that if any non-GPL license 
* choice is available it will apply instead, Sun elects to use only 
* the General Public License version 2 (GPLv2) at this time for any 
* software where a choice of GPL license versions is made 
* available with the language indicating that GPLv2 or any later version 
* may be used, or where a choice of which version of the GPL is applied is 
* otherwise unspecified. 
*
* Please contact Sun Microsystems, Inc., 4150 Network Circle, Santa Clara, 
* CA 95054 USA or visit www.sun.com if you need additional information or 
* have any questions. 
*
* 
* ========== Copyright Header End ============================================
*/
/*%W%	%G%*/

/*****************************************************************
 *
 * File Name    : niu_zcp.h
 * Author Name  : John Lo
 * Description  : 
 * Parent Module: 
 * Child  Module: 
 * Interface Mod: 
 * Date Created : 4/29/04
 *
 * Copyright (c) 2020, Sun Microsystems, Inc. 
 * Sun Proprietary and Confidential    
 *
 * Modification :
 * 
 * Synthesis Notes: 
 * 
 ****************************************************************/

`define  RSP_CMD_ERR      4'hF
`define  RSP_DAT_ERR      2'b11
`define  CML_WO_DATA      3'b110


/* ----- start copy from xmac.h ----- */
`define  DBUG_W           32   
`define  DBUG_W_SUB1      `DBUG_W - 1
`define  DBUG_R           `DBUG_W_SUB1:0

/* ----- start copy from xmac.h ----- */
`define  BYTE             7:0 
`define  BYTE0            7:0 
`define  BYTE1           15:8
`define  BYTE2           23:16
`define  BYTE3           31:24
`define  BYTE4           39:32
`define  BYTE5           47:40
`define  BYTE6           55:48
`define  BYTE7           63:56
`define  BYTE8           71:64
`define  BYTE9           79:72
`define  BYTE10          87:80
`define  BYTE11          95:88
`define  BYTE12         103:96
`define  BYTE13         111:104
`define  BYTE14         119:112
`define  BYTE15         127:120
`define  BYTE16         135:128
`define  BYTE17         143:136
`define  BYTE18         151:144
`define  BYTE19         159:152
/* ----- end copy from xmac.h ----- */


`define  WORD0                     31:0
`define  WORD1                     63:32
`define  WORD2                     95:64
`define  WORD3                    127:96
`define  WORD4                    159:128
`define  WORD5                    191:160
`define  WORD6                    223:192
`define  WORD7                    255:224

`define  W32D0                     31:0  
`define  W32D1                     63:32  
`define  W32D2                     95:64  
`define  W32D3                     127:96  
`define  W32D4                     159:128  
`define  W32D5                     191:160  
`define  W32D6                     223:192  
`define  W32D7                     255:224  
`define  W32D8                     287:256  
`define  W32D9                     319:288  
`define  W32D10                     351:320  
`define  W32D11                     383:352  
`define  W32D12                     415:384  
`define  W32D13                     447:416  
`define  W32D14                     479:448  
`define  W32D15                     511:480  
`define  W32D16                     543:512  
`define  W32D17                     575:544  
`define  W32D18                     607:576  
`define  W32D19                     639:608  
`define  W32D20                     671:640  
`define  W32D21                     703:672  
`define  W32D22                     735:704  
`define  W32D23                     767:736  
`define  W32D24                     799:768  
`define  W32D25                     831:800  
`define  W32D26                     863:832  
`define  W32D27                     895:864  
`define  W32D28                     927:896  
`define  W32D29                     959:928  
`define  W32D30                     991:960  
`define  W32D31                     1023:992  
 
`define  W128D0                     127:0  
`define  W128D1                     255:128  
`define  W128D2                     383:256  
`define  W128D3                     511:384  
`define  W128D4                     639:512  
`define  W128D5                     767:640  
`define  W128D6                     895:768  
`define  W128D7                     1023:896  


/**********************************
 ********* Zero copy stuff ********
 **********************************/
`define  TCP_SEQ_SPACE           31:0
`define  TCP_SEQ_MSB             32
`define  XPAN_TCP_SEQ_SPACE      32:0
`define  PKT_LEN_W               16                 
`define  PKT_LEN_R               15:0                 

// ----- zcp ififo -----------------------------------------
`define       IFIFO_W            216
`define       IFIFO_W_SUB1       `IFIFO_W - 1
`define       IFIFO_W_R          `IFIFO_W_SUB1:0
`define       IFIFO_A            2
`define       IFIFO_A_SUB1       `IFIFO_A - 1
`define       IFIFO_A_R          `IFIFO_A_SUB1:0
`define       IFIFO_PTR          `IFIFO_A:0
`define       IFIFO_A_ADD1       `IFIFO_A +1
`define       IFIFO_D            4
`define       IFIFO_D_SUB1       `IFIFO_D -1 
`define       IFIFO_D_R          `IFIFO_D_SUB1:0

// ----- start of REQ RSP FIFO area -------------------------
// --reqfifo address and depth--
`define       REQFIFO_W            72
`define       REQFIFO_W_SUB1       `REQFIFO_W - 1
`define       REQFIFO_W_R          `REQFIFO_W_SUB1:0
`define       REQFIFO_W_ECC        `REQFIFO_W +8
`define       REQFIFO_W_ECC_SUB1   `REQFIFO_W_ECC - 1
`define       REQFIFO_W_ECC_R      `REQFIFO_W_ECC_SUB1:0

// --rrfifo address and depth-- 
`define       RRFIFO_W             23
`define       RRFIFO_W_SUB1        `RRFIFO_W - 1
`define       RRFIFO_W_R           `RRFIFO_W_SUB1:0
`define       RRFIFO_W_ECC         `RRFIFO_W + 7
`define       RRFIFO_W_ECC_SUB1    `RRFIFO_W_ECC - 1
`define       RRFIFO_W_ECC_R       `RRFIFO_W_ECC_SUB1:0

// --rspfifo address and depth-- 
`define       RSPFIFO_W            1024
`define       RSPFIFO_W_SUB1       `RSPFIFO_W - 1
`define       RSPFIFO_W_R          `RSPFIFO_W_SUB1:0
`define       RSPFIFO_W_ECC        1152
`define       RSPFIFO_W_ECC_SUB1   `RSPFIFO_W_ECC - 1
`define       RSPFIFO_W_ECC_R      `RSPFIFO_W_ECC_SUB1:0

// --sftfifo address and depth-- 
`define       SFTFIFO_W            128
`define       SFTFIFO_W_SUB1       `SFTFIFO_W - 1
`define       SFTFIFO_W_R          `SFTFIFO_W_SUB1:0
`define       SFTFIFO_W_ECC        `SFTFIFO_W + 8
`define       SFTFIFO_W_ECC_SUB1   `SFTFIFO_W_ECC - 1
`define       SFTFIFO_W_ECC_R      `SFTFIFO_W_ECC_SUB1:0

// --va common section for all req and response fifo --
`define       VAFIFO_A            4
`define       VAFIFO_A_SUB1       `VAFIFO_A - 1
`define       VAFIFO_A_R          `VAFIFO_A_SUB1:0
`define       VAFIFO_A_PTR        `VAFIFO_A:0
`define       VAFIFO_A_ADD1       `VAFIFO_A +1
`define       VAFIFO_D            16
`define       VAFIFO_D_SUB1       `VAFIFO_D -1 
`define       VAFIFO_D_R          `VAFIFO_D_SUB1:0
// ----- end of REQ RSP FIFO area -------------------------

// ----- cfifo ---------------------------------------------
// --cfifo width--
`define       CFIFO_W            130
`define       CFIFO_W_SUB1       `CFIFO_W - 1
`define       CFIFO_W_SUB2       `CFIFO_W - 2
`define       CFIFO_W_R          `CFIFO_W_SUB1:0
`define       CFIFO_SOP          2'b01
`define       CFIFO_EOP          2'b10

// --cfifo with ECC width--
`define       CFIFO_W_ECC        `CFIFO_W + 16
`define       CFIFO_W_ECC_SUB1   `CFIFO_W_ECC - 1
`define       CFIFO_W_ECC_SUB2   `CFIFO_W_ECC - 2
`define       CFIFO_W_ECC_R      `CFIFO_W_ECC_SUB1:0

// --cfifo address and depth--
// 32KB
`define       CFIFO_A11          11
`define       CFIFO_A11_R        10:0
`define       CFIFO_D2K          12'd1664
`define       CFIFO_D2K_SUB1     `CFIFO_D2K - 12'd01
`define       CFIFO_A11_PTR      `CFIFO_A11:0
`define       CFIFO_A11_ADD1     `CFIFO_A11 +1
// 16KB
`define       CFIFO_A10          10
`define       CFIFO_A10_R        9:0
`define       CFIFO_D1K          11'd832
`define       CFIFO_D1K_SUB1     `CFIFO_D1K - 11'd01
`define       CFIFO_A10_PTR      `CFIFO_A10:0
`define       CFIFO_A10_ADD1     `CFIFO_A10 +1
`define       THRESHOLD_A10      10'd1000
// 8KB
`define       CFIFO_A9           9
`define       CFIFO_A9_R         8:0
`define       CFIFO_D512         10'd512
`define       CFIFO_A9_PTR       `CFIFO_A9:0
`define       CFIFO_A9_ADD1      `CFIFO_A9 +1

// ----- tt word ---------------------------------------------
`define       DWORD0              31:0
`define       DWORD1              63:32
`define       DWORD2              95:64
`define       DWORD3             127:96
`define       DWORD4             159:128
`define       DWORD5             191:160
`define       DWORD6             223:192
`define       DWORD7             255:224

// ----- va_ram ---------------------------------------------
 // 128 data bits/va_ram
`define       VA_W                 128
`define       VA_W_SUB1           `VA_W -1
`define       VA_R                `VA_W_SUB1:0
 // 16 parity bits/va_ram
`define       VA_PW                16
`define       VA_PW_SUB1          `VA_PW -1
`define       VA_PR               `VA_PW_SUB1:0

// ----- dn_ram ---------------------------------------------
`define       DN_W                 136
`define       DN_W_SUB1           `DN_W -1
`define       DN_R                `DN_W_SUB1:0
`define       DN_PW                17
`define       DN_PW_SUB1          `DN_PW -1
`define       DN_PR               `DN_PW_SUB1:0

// ----- st_ram ---------------------------------------------
`define       ST_W                 112
`define       ST_W_SUB1           `ST_W -1
`define       ST_R                `ST_W_SUB1:0
`define       ST_PW                14
`define       ST_PW_SUB1          `ST_PW -1
`define       ST_PR               `ST_PW_SUB1:0
// ----- dmaw -----------------------------------------------
`define       DMA_W                 44
`define       DMA_W_SUB1           `DMA_W -1
`define       DMA_R                `DMA_W_SUB1:0

// ----- header field definition ---------------------------
// ----- Big Endian, byte definition -----------------
`define       BW                   216
`define       BMSB0                `BW      -1
`define       BMSB1                `BMSB0   -8
`define       BMSB2                `BMSB1   -8
`define       BMSB3                `BMSB2   -8
`define       BMSB4                `BMSB3   -8
`define       BMSB5                `BMSB4   -8
`define       BMSB6                `BMSB5   -8
`define       BMSB7                `BMSB6   -8
`define       BMSB8                `BMSB7   -8
`define       BMSB9                `BMSB8   -8
`define       BMSB10               `BMSB9   -8
`define       BMSB11               `BMSB10  -8
`define       BMSB12               `BMSB11  -8
`define       BMSB13               `BMSB12  -8
`define       BMSB14               `BMSB13  -8
`define       BMSB15               `BMSB14  -8
`define       BMSB16               `BMSB15  -8
`define       BMSB17               `BMSB16  -8
`define       BMSB18               `BMSB17  -8
`define       BMSB19               `BMSB18  -8
`define       BMSB20               `BMSB19  -8
`define       BMSB21               `BMSB20  -8
`define       BMSB22               `BMSB21  -8
`define       BMSB23               `BMSB22  -8
`define       BMSB24               `BMSB23  -8
`define       BMSB25               `BMSB24  -8
`define       BMSB26               `BMSB25  -8
`define       BMSB27               `BMSB26  -8
`define       BMSB28               `BMSB27  -8
`define       BMSB29               `BMSB28  -8
`define       BMSB30               `BMSB29  -8
`define       BMSB31               `BMSB30  -8
`define       BMSB32               `BMSB31  -8
`define       BMSB33               `BMSB32  -8
`define       BMSB34               `BMSB33  -8
`define       BMSB35               `BMSB34  -8
`define       BMSB36               `BMSB35  -8
`define       BMSB37               `BMSB36  -8
`define       BMSB38               `BMSB37  -8
`define       BMSB39               `BMSB38  -8
`define       BMSB40               `BMSB39  -8
`define       BMSB41               `BMSB40  -8
`define       BMSB42               `BMSB41  -8
`define       BMSB43               `BMSB42  -8
`define       BMSB44               `BMSB43  -8
`define       BMSB45               `BMSB44  -8
`define       BMSB46               `BMSB45  -8
`define       BMSB47               `BMSB46  -8
`define       BMSB48               `BMSB47  -8
`define       BMSB49               `BMSB48  -8
`define       BMSB50               `BMSB49  -8
`define       BMSB51               `BMSB50  -8
`define       BMSB52               `BMSB51  -8
`define       BMSB53               `BMSB52  -8
`define       BMSB54               `BMSB53  -8
`define       BMSB55               `BMSB54  -8
`define       BMSB56               `BMSB55  -8
`define       BMSB57               `BMSB56  -8
`define       BMSB58               `BMSB57  -8
`define       BMSB59               `BMSB58  -8
`define       BMSB60               `BMSB59  -8
`define       BMSB61               `BMSB60  -8
`define       BMSB62               `BMSB61  -8
`define       BMSB63               `BMSB62  -8

`define       BLSB0                `BMSB0   -7
`define       BLSB1                `BMSB1   -7
`define       BLSB2                `BMSB2   -7
`define       BLSB3                `BMSB3   -7
`define       BLSB4                `BMSB4   -7
`define       BLSB5                `BMSB5   -7
`define       BLSB6                `BMSB6   -7
`define       BLSB7                `BMSB7   -7
`define       BLSB8                `BMSB8   -7
`define       BLSB9                `BMSB9   -7
`define       BLSB10               `BMSB10  -7
`define       BLSB11               `BMSB11  -7
`define       BLSB12               `BMSB12  -7
`define       BLSB13               `BMSB13  -7
`define       BLSB14               `BMSB14  -7
`define       BLSB15               `BMSB15  -7
`define       BLSB16               `BMSB16  -7
`define       BLSB17               `BMSB17  -7
`define       BLSB18               `BMSB18  -7
`define       BLSB19               `BMSB19  -7
`define       BLSB20               `BMSB20  -7
`define       BLSB21               `BMSB21  -7
`define       BLSB22               `BMSB22  -7
`define       BLSB23               `BMSB23  -7
`define       BLSB24               `BMSB24  -7
`define       BLSB25               `BMSB25  -7
`define       BLSB26               `BMSB26  -7
`define       BLSB27               `BMSB27  -7
`define       BLSB28               `BMSB28  -7
`define       BLSB29               `BMSB29  -7
`define       BLSB30               `BMSB30  -7
`define       BLSB31               `BMSB31  -7
`define       BLSB32               `BMSB32  -7
`define       BLSB33               `BMSB33  -7
`define       BLSB34               `BMSB34  -7
`define       BLSB35               `BMSB35  -7
`define       BLSB36               `BMSB36  -7
`define       BLSB37               `BMSB37  -7
`define       BLSB38               `BMSB38  -7
`define       BLSB39               `BMSB39  -7
`define       BLSB40               `BMSB40  -7
`define       BLSB41               `BMSB41  -7
`define       BLSB42               `BMSB42  -7
`define       BLSB43               `BMSB43  -7
`define       BLSB44               `BMSB44  -7
`define       BLSB45               `BMSB45  -7
`define       BLSB46               `BMSB46  -7
`define       BLSB47               `BMSB47  -7
`define       BLSB48               `BMSB48  -7
`define       BLSB49               `BMSB49  -7
`define       BLSB50               `BMSB50  -7
`define       BLSB51               `BMSB51  -7
`define       BLSB52               `BMSB52  -7
`define       BLSB53               `BMSB53  -7
`define       BLSB54               `BMSB54  -7
`define       BLSB55               `BMSB55  -7
`define       BLSB56               `BMSB56  -7
`define       BLSB57               `BMSB57  -7
`define       BLSB58               `BMSB58  -7
`define       BLSB59               `BMSB59  -7
`define       BLSB60               `BMSB60  -7
`define       BLSB61               `BMSB61  -7
`define       BLSB62               `BMSB62  -7
`define       BLSB63               `BMSB63  -7

`define       BBYTE0               `BMSB0 : `BLSB0 
`define       BBYTE1               `BMSB1 : `BLSB1 
`define       BBYTE2               `BMSB2 : `BLSB2 
`define       BBYTE3               `BMSB3 : `BLSB3 
`define       BBYTE4               `BMSB4 : `BLSB4 
`define       BBYTE5               `BMSB5 : `BLSB5 
`define       BBYTE6               `BMSB6 : `BLSB6 
`define       BBYTE7               `BMSB7 : `BLSB7 
`define       BBYTE8               `BMSB8 : `BLSB8 
`define       BBYTE9               `BMSB9 : `BLSB9 
`define       BBYTE10              `BMSB10: `BLSB10
`define       BBYTE11              `BMSB11: `BLSB11
`define       BBYTE12              `BMSB12: `BLSB12
`define       BBYTE13              `BMSB13: `BLSB13
`define       BBYTE14              `BMSB14: `BLSB14
`define       BBYTE15              `BMSB15: `BLSB15
`define       BBYTE16              `BMSB16: `BLSB16
`define       BBYTE17              `BMSB17: `BLSB17
`define       BBYTE18              `BMSB18: `BLSB18
`define       BBYTE19              `BMSB19: `BLSB19
`define       BBYTE20              `BMSB20: `BLSB20
`define       BBYTE21              `BMSB21: `BLSB21
`define       BBYTE22              `BMSB22: `BLSB22
`define       BBYTE23              `BMSB23: `BLSB23
`define       BBYTE24              `BMSB24: `BLSB24
`define       BBYTE25              `BMSB25: `BLSB25
`define       BBYTE26              `BMSB26: `BLSB26
`define       BBYTE27              `BMSB27: `BLSB27
`define       BBYTE28              `BMSB28: `BLSB28
`define       BBYTE29              `BMSB29: `BLSB29
`define       BBYTE30              `BMSB30: `BLSB30
`define       BBYTE31              `BMSB31: `BLSB31

//////////////////////////////////////////////////////
// ----- page handle definition -- its a 20 bit bus --
// ----- little endian -------------------------------
`define       PW                   320
`define       PMS15                319
`define       PMS14               `PMS15  -20
`define       PMS13               `PMS14  -20
`define       PMS12               `PMS13  -20
`define       PMS11               `PMS12  -20
`define       PMS10               `PMS11  -20
`define       PMS9                `PMS10  -20
`define       PMS8                `PMS9   -20
`define       PMS7                `PMS8   -20
`define       PMS6                `PMS7   -20
`define       PMS5                `PMS6   -20
`define       PMS4                `PMS5   -20
`define       PMS3                `PMS4   -20
`define       PMS2                `PMS3   -20
`define       PMS1                `PMS2   -20
`define       PMS0                `PMS1   -20

`define       PLS0                `PMS0   -19
`define       PLS1                `PMS1   -19
`define       PLS2                `PMS2   -19
`define       PLS3                `PMS3   -19
`define       PLS4                `PMS4   -19
`define       PLS5                `PMS5   -19
`define       PLS6                `PMS6   -19
`define       PLS7                `PMS7   -19
`define       PLS8                `PMS8   -19
`define       PLS9                `PMS9   -19
`define       PLS10               `PMS10  -19
`define       PLS11               `PMS11  -19
`define       PLS12               `PMS12  -19
`define       PLS13               `PMS13  -19
`define       PLS14               `PMS14  -19
`define       PLS15               `PMS15  -19

// ----- Winfifo calculation definition --------------------
//  4 buffer WINFIFO
`define       WIN2_MSB                2
`define       WIN2_PTR            `WIN2_MSB : 0
`define       WIN2_MSB_SUB_1      `WIN2_MSB - 1   
`define       WIN2_A              `WIN2_MSB_SUB_1 : 0
`define       WIN2_D                3'd4             

//  8 buffer WINFIFO
`define       WIN3_MSB                3
`define       WIN3_PTR            `WIN3_MSB : 0
`define       WIN3_MSB_SUB_1      `WIN3_MSB - 1   
`define       WIN3_A              `WIN3_MSB_SUB_1 : 0
`define       WIN3_D                4'd8             

// 16 buffer WINFIFO
`define       WIN4_MSB                4
`define       WIN4_PTR            `WIN4_MSB : 0
`define       WIN4_MSB_SUB_1      `WIN4_MSB - 1   
`define       WIN4_A              `WIN4_MSB_SUB_1 : 0
`define       WIN4_D                5'd16             

// 32 buffer WINFIFO
`define       WIN5_MSB                5
`define       WIN5_PTR            `WIN5_MSB : 0
`define       WIN5_MSB_SUB_1      `WIN5_MSB - 1   
`define       WIN5_A              `WIN5_MSB_SUB_1 : 0
`define       WIN5_D                6'd32             

// ----- HoQ calculation definition ------------------------
//  8 buffer ring
`define       HOQ3_MSB                3
`define       HOQ3_PTR            `HOQ3_MSB : 0
`define       HOQ3_MSB_SUB_1      `HOQ3_MSB - 1   
`define       HOQ3_A              `HOQ3_MSB_SUB_1 : 0
`define       HOQ3_MSB_ADD_1      `HOQ3_MSB + 1   
`define       HOQ3_D                4'd8             
`define       HOQ3_DD              16'd8             
// 16 buffer ring
`define       HOQ4_MSB                4
`define       HOQ4_PTR            `HOQ4_MSB : 0
`define       HOQ4_MSB_SUB_1      `HOQ4_MSB - 1   
`define       HOQ4_A              `HOQ4_MSB_SUB_1 : 0
`define       HOQ4_MSB_ADD_1      `HOQ4_MSB + 1   
`define       HOQ4_D                5'd16             
`define       HOQ4_DD              16'd16             
// 32 buffer ring
`define       HOQ5_MSB                5
`define       HOQ5_PTR            `HOQ5_MSB : 0
`define       HOQ5_MSB_SUB_1      `HOQ5_MSB - 1   
`define       HOQ5_A              `HOQ5_MSB_SUB_1 : 0
`define       HOQ5_MSB_ADD_1      `HOQ5_MSB + 1   
`define       HOQ5_D                6'd32             
`define       HOQ5_DD              16'd32             
// 64 buffer ring
`define       HOQ6_MSB                6
`define       HOQ6_PTR            `HOQ6_MSB : 0
`define       HOQ6_MSB_SUB_1      `HOQ6_MSB - 1   
`define       HOQ6_A              `HOQ6_MSB_SUB_1 : 0
`define       HOQ6_MSB_ADD_1      `HOQ6_MSB + 1   
`define       HOQ6_D                7'd64             
`define       HOQ6_DD              16'd64             
//128 buffer ring
`define       HOQ7_MSB                7
`define       HOQ7_PTR            `HOQ7_MSB : 0
`define       HOQ7_MSB_SUB_1      `HOQ7_MSB - 1   
`define       HOQ7_A              `HOQ7_MSB_SUB_1 : 0
`define       HOQ7_MSB_ADD_1      `HOQ7_MSB + 1   
`define       HOQ7_D                8'd128             
`define       HOQ7_DD              16'd128             
//256 buffer ring
`define       HOQ8_MSB                8
`define       HOQ8_PTR            `HOQ8_MSB : 0
`define       HOQ8_MSB_SUB_1      `HOQ8_MSB - 1   
`define       HOQ8_A              `HOQ8_MSB_SUB_1 : 0
`define       HOQ8_MSB_ADD_1      `HOQ8_MSB + 1   
`define       HOQ8_D                9'd256             
`define       HOQ8_DD              16'd256             
//512 buffer ring
`define       HOQ9_MSB                9
`define       HOQ9_PTR            `HOQ9_MSB : 0
`define       HOQ9_MSB_SUB_1      `HOQ9_MSB - 1   
`define       HOQ9_A              `HOQ9_MSB_SUB_1 : 0
`define       HOQ9_MSB_ADD_1      `HOQ9_MSB + 1   
`define       HOQ9_D               10'd512             
`define       HOQ9_DD              16'd512             
// 1K buffer ring
`define       HOQ10_MSB                10
`define       HOQ10_PTR            `HOQ10_MSB : 0
`define       HOQ10_MSB_SUB_1      `HOQ10_MSB - 1   
`define       HOQ10_A              `HOQ10_MSB_SUB_1 : 0
`define       HOQ10_MSB_ADD_1      `HOQ10_MSB + 1   
`define       HOQ10_D               11'd1024                
`define       HOQ10_DD              16'd1024                
// ---------- crossing 4KB start from here ----------
    // HoQ
`define       HoQ_4KB_FLAG_BIT         10
`define       HoQ_4KB_FLAG_BIT_ADD_1  `HoQ_4KB_FLAG_BIT + 1
`define       HoQ_4KB_FLAG_BIT_SUB_1  `HoQ_4KB_FLAG_BIT - 1
`define       HoQ_4KB_A               `HoQ_4KB_FLAG_BIT_SUB_1 :0
// 2K buffer ring
`define       HOQ11_MSB                11
`define       HOQ11_PTR            `HOQ11_MSB : 0
`define       HOQ11_MSB_SUB_1      `HOQ11_MSB - 1   
`define       HOQ11_A              `HOQ11_MSB_SUB_1 : 0
`define       HOQ11_MSB_ADD_1      `HOQ11_MSB + 1   
`define       HOQ11_D               12'd2048             
`define       HOQ11_DD              16'd2048             
    //`define       HOQ11_BIT11_UP_A     `HOQ11_MSB_SUB_1 : `HoQ_4KB_FLAG_BIT_ADD_1
// 4K buffer ring
`define       HOQ12_MSB                12
`define       HOQ12_PTR            `HOQ12_MSB : 0
`define       HOQ12_MSB_SUB_1      `HOQ12_MSB - 1   
`define       HOQ12_A              `HOQ12_MSB_SUB_1 : 0
`define       HOQ12_MSB_ADD_1      `HOQ12_MSB + 1   
`define       HOQ12_D               13'd4096               
`define       HOQ12_DD              16'd4096               
`define       HOQ12_BIT11_UP_A     `HOQ12_MSB_SUB_1 : `HoQ_4KB_FLAG_BIT_ADD_1
// 8K buffer ring
`define       HOQ13_MSB                13
`define       HOQ13_PTR            `HOQ13_MSB : 0
`define       HOQ13_MSB_SUB_1      `HOQ13_MSB - 1   
`define       HOQ13_A              `HOQ13_MSB_SUB_1 : 0
`define       HOQ13_MSB_ADD_1      `HOQ13_MSB + 1   
`define       HOQ13_D               14'd8192                
`define       HOQ13_DD              16'd8192                
`define       HOQ13_BIT11_UP_A     `HOQ13_MSB_SUB_1 : `HoQ_4KB_FLAG_BIT_ADD_1
// 16K buffer ring
`define       HOQ14_MSB                14
`define       HOQ14_PTR            `HOQ14_MSB : 0
`define       HOQ14_MSB_SUB_1      `HOQ14_MSB - 1   
`define       HOQ14_A              `HOQ14_MSB_SUB_1 : 0
`define       HOQ14_MSB_ADD_1      `HOQ14_MSB + 1   
`define       HOQ14_D               15'd16384              
`define       HOQ14_DD              16'd16384              
`define       HOQ14_BIT11_UP_A     `HOQ14_MSB_SUB_1 : `HoQ_4KB_FLAG_BIT_ADD_1
// 32K buffer ring
`define       HOQ15_MSB                15
`define       HOQ15_PTR            `HOQ15_MSB : 0
`define       HOQ15_MSB_SUB_1      `HOQ15_MSB - 1   
`define       HOQ15_A              `HOQ15_MSB_SUB_1 : 0
`define       HOQ15_MSB_ADD_1      `HOQ15_MSB + 1   
`define       HOQ15_D               16'd32768             
`define       HOQ15_DD              16'd32768             
`define       HOQ15_BIT11_UP_A     `HOQ15_MSB_SUB_1 : `HoQ_4KB_FLAG_BIT_ADD_1

// ----- Ring Base calculation definition --------------------
`define       HOQ3_BAR              38:0 
`define       HOQ4_BAR              38:1 
`define       HOQ5_BAR              38:2 
`define       HOQ6_BAR              38:3 
`define       HOQ7_BAR              38:4 
`define       HOQ8_BAR              38:5 
`define       HOQ9_BAR              38:6 
`define       HOQ10_BAR             38:7 
`define       HOQ11_BAR             38:8 
`define       HOQ12_BAR             38:9 
`define       HOQ13_BAR             38:10
`define       HOQ14_BAR             38:11
`define       HOQ15_BAR             38:12

// ----- buffer order definition -----------------------------
// ----- Little Endian -- 32 bit word definition ------- 
`define       VW                   1024

`define       VMSW0                          31
`define       VMSW1                `VMSW0   +32
`define       VMSW2                `VMSW1   +32
`define       VMSW3                `VMSW2   +32
`define       VMSW4                `VMSW3   +32
`define       VMSW5                `VMSW4   +32
`define       VMSW6                `VMSW5   +32
`define       VMSW7                `VMSW6   +32
`define       VMSW8                `VMSW7   +32
`define       VMSW9                `VMSW8   +32
`define       VMSW10               `VMSW9   +32
`define       VMSW11               `VMSW10  +32
`define       VMSW12               `VMSW11  +32
`define       VMSW13               `VMSW12  +32
`define       VMSW14               `VMSW13  +32
`define       VMSW15               `VMSW14  +32
`define       VMSW16               `VMSW15  +32
`define       VMSW17               `VMSW16  +32
`define       VMSW18               `VMSW17  +32
`define       VMSW19               `VMSW18  +32
`define       VMSW20               `VMSW19  +32
`define       VMSW21               `VMSW20  +32
`define       VMSW22               `VMSW21  +32
`define       VMSW23               `VMSW22  +32
`define       VMSW24               `VMSW23  +32
`define       VMSW25               `VMSW24  +32
`define       VMSW26               `VMSW25  +32
`define       VMSW27               `VMSW26  +32
`define       VMSW28               `VMSW27  +32
`define       VMSW29               `VMSW28  +32
`define       VMSW30               `VMSW29  +32
`define       VMSW31               `VMSW30  +32


`define       VLSW0                `VMSW0   -31
`define       VLSW1                `VMSW1   -31
`define       VLSW2                `VMSW2   -31
`define       VLSW3                `VMSW3   -31
`define       VLSW4                `VMSW4   -31
`define       VLSW5                `VMSW5   -31
`define       VLSW6                `VMSW6   -31
`define       VLSW7                `VMSW7   -31
`define       VLSW8                `VMSW8   -31
`define       VLSW9                `VMSW9   -31
`define       VLSW10               `VMSW10  -31
`define       VLSW11               `VMSW11  -31
`define       VLSW12               `VMSW12  -31
`define       VLSW13               `VMSW13  -31
`define       VLSW14               `VMSW14  -31
`define       VLSW15               `VMSW15  -31
`define       VLSW16               `VMSW16  -31
`define       VLSW17               `VMSW17  -31
`define       VLSW18               `VMSW18  -31
`define       VLSW19               `VMSW19  -31
`define       VLSW20               `VMSW20  -31
`define       VLSW21               `VMSW21  -31
`define       VLSW22               `VMSW22  -31
`define       VLSW23               `VMSW23  -31
`define       VLSW24               `VMSW24  -31
`define       VLSW25               `VMSW25  -31
`define       VLSW26               `VMSW26  -31
`define       VLSW27               `VMSW27  -31
`define       VLSW28               `VMSW28  -31
`define       VLSW29               `VMSW29  -31
`define       VLSW30               `VMSW30  -31
`define       VLSW31               `VMSW31  -31

`define       BUFF0               `VMSW0 : `VLSW0 
`define       BUFF1               `VMSW1 : `VLSW1 
`define       BUFF2               `VMSW2 : `VLSW2 
`define       BUFF3               `VMSW3 : `VLSW3 
`define       BUFF4               `VMSW4 : `VLSW4 
`define       BUFF5               `VMSW5 : `VLSW5 
`define       BUFF6               `VMSW6 : `VLSW6 
`define       BUFF7               `VMSW7 : `VLSW7 
`define       BUFF8               `VMSW8 : `VLSW8 
`define       BUFF9               `VMSW9 : `VLSW9 
`define       BUFF10              `VMSW10: `VLSW10
`define       BUFF11              `VMSW11: `VLSW11
`define       BUFF12              `VMSW12: `VLSW12
`define       BUFF13              `VMSW13: `VLSW13
`define       BUFF14              `VMSW14: `VLSW14
`define       BUFF15              `VMSW15: `VLSW15
`define       BUFF16              `VMSW16: `VLSW16
`define       BUFF17              `VMSW17: `VLSW17
`define       BUFF18              `VMSW18: `VLSW18
`define       BUFF19              `VMSW19: `VLSW19
`define       BUFF20              `VMSW20: `VLSW20
`define       BUFF21              `VMSW21: `VLSW21
`define       BUFF22              `VMSW22: `VLSW22
`define       BUFF23              `VMSW23: `VLSW23
`define       BUFF24              `VMSW24: `VLSW24
`define       BUFF25              `VMSW25: `VLSW25
`define       BUFF26              `VMSW26: `VLSW26
`define       BUFF27              `VMSW27: `VLSW27
`define       BUFF28              `VMSW28: `VLSW28
`define       BUFF29              `VMSW29: `VLSW29
`define       BUFF30              `VMSW30: `VLSW30
`define       BUFF31              `VMSW31: `VLSW31


// ----- Little Endian --------- 
// Ram w/o ECC Msb Lsb, Word 0~15
`define       RW                   1024

`define       RMSW0                          63
`define       RMSW1                `RMSW0   +64
`define       RMSW2                `RMSW1   +64
`define       RMSW3                `RMSW2   +64
`define       RMSW4                `RMSW3   +64
`define       RMSW5                `RMSW4   +64
`define       RMSW6                `RMSW5   +64
`define       RMSW7                `RMSW6   +64
`define       RMSW8                `RMSW7   +64
`define       RMSW9                `RMSW8   +64
`define       RMSW10               `RMSW9   +64
`define       RMSW11               `RMSW10  +64
`define       RMSW12               `RMSW11  +64
`define       RMSW13               `RMSW12  +64
`define       RMSW14               `RMSW13  +64
`define       RMSW15               `RMSW14  +64

`define       RLSW0                `RMSW0   -63
`define       RLSW1                `RMSW1   -63
`define       RLSW2                `RMSW2   -63
`define       RLSW3                `RMSW3   -63
`define       RLSW4                `RMSW4   -63
`define       RLSW5                `RMSW5   -63
`define       RLSW6                `RMSW6   -63
`define       RLSW7                `RMSW7   -63
`define       RLSW8                `RMSW8   -63
`define       RLSW9                `RMSW9   -63
`define       RLSW10               `RMSW10  -63
`define       RLSW11               `RMSW11  -63
`define       RLSW12               `RMSW12  -63
`define       RLSW13               `RMSW13  -63
`define       RLSW14               `RMSW14  -63
`define       RLSW15               `RMSW15  -63

// Ram Data
`define       RDA0                 `RMSW0 : `RLSW0 
`define       RDA1                 `RMSW1 : `RLSW1 
`define       RDA2                 `RMSW2 : `RLSW2 
`define       RDA3                 `RMSW3 : `RLSW3 
`define       RDA4                 `RMSW4 : `RLSW4 
`define       RDA5                 `RMSW5 : `RLSW5 
`define       RDA6                 `RMSW6 : `RLSW6 
`define       RDA7                 `RMSW7 : `RLSW7 
`define       RDA8                 `RMSW8 : `RLSW8 
`define       RDA9                 `RMSW9 : `RLSW9 
`define       RDA10                `RMSW10: `RLSW10
`define       RDA11                `RMSW11: `RLSW11
`define       RDA12                `RMSW12: `RLSW12
`define       RDA13                `RMSW13: `RLSW13
`define       RDA14                `RMSW14: `RLSW14
`define       RDA15                `RMSW15: `RLSW15


// ----- Little Endian (for resfifo ----- 
// SRam w ECC Msb Lsb, Word0~15
`define       SW                   1152

`define       SMSW0                          71
`define       SMSW1                `SMSW0   +72
`define       SMSW2                `SMSW1   +72
`define       SMSW3                `SMSW2   +72
`define       SMSW4                `SMSW3   +72
`define       SMSW5                `SMSW4   +72
`define       SMSW6                `SMSW5   +72
`define       SMSW7                `SMSW6   +72
`define       SMSW8                `SMSW7   +72
`define       SMSW9                `SMSW8   +72
`define       SMSW10               `SMSW9   +72
`define       SMSW11               `SMSW10  +72
`define       SMSW12               `SMSW11  +72
`define       SMSW13               `SMSW12  +72
`define       SMSW14               `SMSW13  +72
`define       SMSW15               `SMSW14  +72

`define       SLSW0                `SMSW0   -71
`define       SLSW1                `SMSW1   -71
`define       SLSW2                `SMSW2   -71
`define       SLSW3                `SMSW3   -71
`define       SLSW4                `SMSW4   -71
`define       SLSW5                `SMSW5   -71
`define       SLSW6                `SMSW6   -71
`define       SLSW7                `SMSW7   -71
`define       SLSW8                `SMSW8   -71
`define       SLSW9                `SMSW9   -71
`define       SLSW10               `SMSW10  -71
`define       SLSW11               `SMSW11  -71
`define       SLSW12               `SMSW12  -71
`define       SLSW13               `SMSW13  -71
`define       SLSW14               `SMSW14  -71
`define       SLSW15               `SMSW15  -71

// Sram Data+ECC
`define       SDE0                 `SMSW0 : `SLSW0 
`define       SDE1                 `SMSW1 : `SLSW1 
`define       SDE2                 `SMSW2 : `SLSW2 
`define       SDE3                 `SMSW3 : `SLSW3 
`define       SDE4                 `SMSW4 : `SLSW4 
`define       SDE5                 `SMSW5 : `SLSW5 
`define       SDE6                 `SMSW6 : `SLSW6 
`define       SDE7                 `SMSW7 : `SLSW7 
`define       SDE8                 `SMSW8 : `SLSW8 
`define       SDE9                 `SMSW9 : `SLSW9 
`define       SDE10                `SMSW10: `SLSW10
`define       SDE11                `SMSW11: `SLSW11
`define       SDE12                `SMSW12: `SLSW12
`define       SDE13                `SMSW13: `SLSW13
`define       SDE14                `SMSW14: `SLSW14
`define       SDE15                `SMSW15: `SLSW15

`define      ZCP_TRAINING_SET      SELECT_VALUE_OF_DEBUG_MUX
`define      ZCP_TRAINING_LOAD     SELECT_VALUE_OF_DEBUG_MUX

////////////////////////////////////////////////////////////////
`define      PIM_24Buffers         16'd24

////////////////////////////////////////////////////////////////
`define       RTL_SIM               1

