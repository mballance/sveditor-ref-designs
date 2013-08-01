/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: niu_rdmc.h
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
`define		CACHE_LEN	8'd8
`define		CACHE_LEN_SUB1	`CACHE_LEN - 8'd1
`define         CACHE_LEN_SUB4  `CACHE_LEN - 8'd4

`define         SHADW_LEN       8'd16
`define         SHADW_LEN_SUB1  `SHADW_LEN - 8'd1
`define         SHADW_LEN_SUB4  `SHADW_LEN - 8'd4


`define		CHNL0		5'd0
`define         CHNL1           5'd1
`define         CHNL2           5'd2
`define         CHNL3           5'd3
`define         CHNL4           5'd4
`define         CHNL5           5'd5
`define         CHNL6           5'd6
`define         CHNL7           5'd7
`define         CHNL8           5'd8
`define         CHNL9           5'd9
`define         CHNL10          5'd10
`define         CHNL11          5'd11
`define         CHNL12          5'd12
`define         CHNL13          5'd13
`define         CHNL14          5'd14
`define         CHNL15          5'd15

`define		CHNL0_CACHE_START_ADDR		8'h00
`define         CHNL1_CACHE_START_ADDR		8'h08
`define         CHNL2_CACHE_START_ADDR          8'h10
`define         CHNL3_CACHE_START_ADDR          8'h18
`define         CHNL4_CACHE_START_ADDR          8'h20
`define         CHNL5_CACHE_START_ADDR          8'h28
`define         CHNL6_CACHE_START_ADDR          8'h30
`define         CHNL7_CACHE_START_ADDR          8'h38
`define         CHNL8_CACHE_START_ADDR          8'h40
`define         CHNL9_CACHE_START_ADDR          8'h48
`define         CHNL10_CACHE_START_ADDR         8'h50
`define         CHNL11_CACHE_START_ADDR         8'h58
`define         CHNL12_CACHE_START_ADDR         8'h60
`define         CHNL13_CACHE_START_ADDR         8'h68
`define         CHNL14_CACHE_START_ADDR         8'h70
`define         CHNL15_CACHE_START_ADDR         8'h78

`define         CHNL0_CACHE_END_ADDR            `CHNL0_CACHE_START_ADDR + `CACHE_LEN_SUB1
`define         CHNL1_CACHE_END_ADDR            `CHNL1_CACHE_START_ADDR + `CACHE_LEN_SUB1
`define         CHNL2_CACHE_END_ADDR            `CHNL2_CACHE_START_ADDR + `CACHE_LEN_SUB1
`define         CHNL3_CACHE_END_ADDR            `CHNL3_CACHE_START_ADDR + `CACHE_LEN_SUB1
`define         CHNL4_CACHE_END_ADDR            `CHNL4_CACHE_START_ADDR + `CACHE_LEN_SUB1
`define         CHNL5_CACHE_END_ADDR            `CHNL5_CACHE_START_ADDR + `CACHE_LEN_SUB1
`define         CHNL6_CACHE_END_ADDR            `CHNL6_CACHE_START_ADDR + `CACHE_LEN_SUB1
`define         CHNL7_CACHE_END_ADDR            `CHNL7_CACHE_START_ADDR + `CACHE_LEN_SUB1
`define         CHNL8_CACHE_END_ADDR            `CHNL8_CACHE_START_ADDR + `CACHE_LEN_SUB1
`define         CHNL9_CACHE_END_ADDR            `CHNL9_CACHE_START_ADDR + `CACHE_LEN_SUB1
`define         CHNL10_CACHE_END_ADDR           `CHNL10_CACHE_START_ADDR + `CACHE_LEN_SUB1
`define         CHNL11_CACHE_END_ADDR           `CHNL11_CACHE_START_ADDR + `CACHE_LEN_SUB1
`define         CHNL12_CACHE_END_ADDR           `CHNL12_CACHE_START_ADDR + `CACHE_LEN_SUB1
`define         CHNL13_CACHE_END_ADDR           `CHNL13_CACHE_START_ADDR + `CACHE_LEN_SUB1
`define         CHNL14_CACHE_END_ADDR           `CHNL14_CACHE_START_ADDR + `CACHE_LEN_SUB1
`define         CHNL15_CACHE_END_ADDR           `CHNL15_CACHE_START_ADDR + `CACHE_LEN_SUB1

`define		SHADW_MAX_ADDR_CNT		8'd32

`define         CHNL0_SHADW_START_ADDR          8'h00
`define         CHNL1_SHADW_START_ADDR          8'h10
`define         CHNL2_SHADW_START_ADDR          8'h20
`define         CHNL3_SHADW_START_ADDR          8'h30
`define         CHNL4_SHADW_START_ADDR          8'h40
`define         CHNL5_SHADW_START_ADDR          8'h50
`define         CHNL6_SHADW_START_ADDR          8'h60
`define         CHNL7_SHADW_START_ADDR          8'h70
`define         CHNL8_SHADW_START_ADDR          8'h80
`define         CHNL9_SHADW_START_ADDR          8'h90
`define         CHNL10_SHADW_START_ADDR         8'ha0
`define         CHNL11_SHADW_START_ADDR         8'hb0
`define         CHNL12_SHADW_START_ADDR         8'hc0
`define         CHNL13_SHADW_START_ADDR         8'hd0
`define         CHNL14_SHADW_START_ADDR         8'he0
`define         CHNL15_SHADW_START_ADDR         8'hf0

`define         CHNL0_SHADW_WR_END_ADDR         `CHNL0_SHADW_START_ADDR + `SHADW_LEN_SUB1
`define         CHNL1_SHADW_WR_END_ADDR         `CHNL1_SHADW_START_ADDR + `SHADW_LEN_SUB1
`define         CHNL2_SHADW_WR_END_ADDR         `CHNL2_SHADW_START_ADDR + `SHADW_LEN_SUB1
`define         CHNL3_SHADW_WR_END_ADDR         `CHNL3_SHADW_START_ADDR + `SHADW_LEN_SUB1
`define         CHNL4_SHADW_WR_END_ADDR         `CHNL4_SHADW_START_ADDR + `SHADW_LEN_SUB1
`define         CHNL5_SHADW_WR_END_ADDR         `CHNL5_SHADW_START_ADDR + `SHADW_LEN_SUB1
`define         CHNL6_SHADW_WR_END_ADDR         `CHNL6_SHADW_START_ADDR + `SHADW_LEN_SUB1
`define         CHNL7_SHADW_WR_END_ADDR         `CHNL7_SHADW_START_ADDR + `SHADW_LEN_SUB1
`define         CHNL8_SHADW_WR_END_ADDR         `CHNL8_SHADW_START_ADDR + `SHADW_LEN_SUB1
`define         CHNL9_SHADW_WR_END_ADDR         `CHNL9_SHADW_START_ADDR + `SHADW_LEN_SUB1
`define         CHNL10_SHADW_WR_END_ADDR        `CHNL10_SHADW_START_ADDR + `SHADW_LEN_SUB1
`define         CHNL11_SHADW_WR_END_ADDR        `CHNL11_SHADW_START_ADDR + `SHADW_LEN_SUB1
`define         CHNL12_SHADW_WR_END_ADDR        `CHNL12_SHADW_START_ADDR + `SHADW_LEN_SUB1
`define         CHNL13_SHADW_WR_END_ADDR        `CHNL13_SHADW_START_ADDR + `SHADW_LEN_SUB1
`define         CHNL14_SHADW_WR_END_ADDR        `CHNL14_SHADW_START_ADDR + `SHADW_LEN_SUB1
`define         CHNL15_SHADW_WR_END_ADDR        `CHNL15_SHADW_START_ADDR + `SHADW_LEN_SUB1

`define         CHNL0_SHADW_RD_END_ADDR         `CHNL0_SHADW_START_ADDR + `SHADW_LEN_SUB4
`define         CHNL1_SHADW_RD_END_ADDR         `CHNL1_SHADW_START_ADDR + `SHADW_LEN_SUB4
`define         CHNL2_SHADW_RD_END_ADDR         `CHNL2_SHADW_START_ADDR + `SHADW_LEN_SUB4
`define         CHNL3_SHADW_RD_END_ADDR         `CHNL3_SHADW_START_ADDR + `SHADW_LEN_SUB4
`define         CHNL4_SHADW_RD_END_ADDR         `CHNL4_SHADW_START_ADDR + `SHADW_LEN_SUB4
`define         CHNL5_SHADW_RD_END_ADDR         `CHNL5_SHADW_START_ADDR + `SHADW_LEN_SUB4
`define         CHNL6_SHADW_RD_END_ADDR         `CHNL6_SHADW_START_ADDR + `SHADW_LEN_SUB4
`define         CHNL7_SHADW_RD_END_ADDR         `CHNL7_SHADW_START_ADDR + `SHADW_LEN_SUB4
`define         CHNL8_SHADW_RD_END_ADDR         `CHNL8_SHADW_START_ADDR + `SHADW_LEN_SUB4
`define         CHNL9_SHADW_RD_END_ADDR         `CHNL9_SHADW_START_ADDR + `SHADW_LEN_SUB4
`define         CHNL10_SHADW_RD_END_ADDR        `CHNL10_SHADW_START_ADDR + `SHADW_LEN_SUB4
`define         CHNL11_SHADW_RD_END_ADDR        `CHNL11_SHADW_START_ADDR + `SHADW_LEN_SUB4
`define         CHNL12_SHADW_RD_END_ADDR        `CHNL12_SHADW_START_ADDR + `SHADW_LEN_SUB4
`define         CHNL13_SHADW_RD_END_ADDR        `CHNL13_SHADW_START_ADDR + `SHADW_LEN_SUB4
`define         CHNL14_SHADW_RD_END_ADDR        `CHNL14_SHADW_START_ADDR + `SHADW_LEN_SUB4
`define         CHNL15_SHADW_RD_END_ADDR        `CHNL15_SHADW_START_ADDR + `SHADW_LEN_SUB4



















