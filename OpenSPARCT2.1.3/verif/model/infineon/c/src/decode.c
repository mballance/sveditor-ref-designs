/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: decode.c
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
#include <stdlib.h>
#include "vcsuser.h"

#define	 BUFFER		1024
#define	 CHIPKILL	0x10000

#define DIMM_2G 0x3
#define DIMM_1G 0x2
#define DIMM_512 0x1
#define DIMM_256 0x0

#define DIMM_CONF_2 0x10
#define DIMM_CONF_4 0x20
#define DIMM_CONF_6 0x40
#define DIMM_CONF_8 0x80

#define DUAL_CHANNEL 0x100
#define SNG_CHANNEL  0x200
#define RANK_HIGH    0x400
#define RANK_LOW	0x800

#define STACK_DIMM 0x1000
#define RANK_DIMM 0x2000

#define PARTIAL_BANK_2BK 0x20000
#define PARTIAL_BANK_4BK 0x40000

#define HASH_PA 0x100000


int get_bank_set_mask(){
    char *bank_set_mask_val = 0;
    unsigned int bank_set_mask = 0;
    bank_set_mask_val=mc_scan_plusargs("bank_set_mask=");
    if (!bank_set_mask_val){
	bank_set_mask=0;
    }
    else
        bank_set_mask=strtoul(bank_set_mask_val, 0, 16);
    return(bank_set_mask);
}

long long pm_address_shift(long long addr, int shift)
{
    long long shifted_addr;
    int bank_set_mask = get_bank_set_mask();
    int pa6, pa7, pa8;

    if(shift > 0){
	pa6 = (addr >> 6) & 0x1;
	if(shift == 1){
            pa7 = (addr >> 7) & 0x1;
            pa8 = pa7;
	}
        else if(shift == 2){
            pa7 = 0;
            pa8 = 0;
	}
	switch(bank_set_mask) {
            case 2:
                pa7 = 1;
		break;
            case 3:
		pa8 = 0;
		break;
            case 4:
                pa8 = 1;
		break;
            case 5:
		pa7 = 0;
		break;
            case 6:
		pa7 = !pa7;
		break;
            case 8:
                pa7 = 1;
		pa8 = 1;
		break;
            case 9:
		break;
            case 0xa:
		pa7 = 1;
		break;
            case 0xc:
		pa8 = 1;
		break;
            default:
            break;
	}
        shifted_addr = addr << shift;
	shifted_addr = shifted_addr >> 9;
	shifted_addr = (shifted_addr << 1) | pa8;
	shifted_addr = (shifted_addr << 1) | pa7;
	shifted_addr = (shifted_addr << 1) | pa6;
	shifted_addr = (shifted_addr << 6) | (addr & 0x3f);
    }
    else
        shifted_addr = addr;

    return(shifted_addr);
}

int pm_bank_s(long long addr, int shift)
{
    int bank_s;
    addr = pm_address_shift(addr, shift);
    bank_s = (addr >> 7) & 0x3;
    return(bank_s);
}

long long fc_hash_pa(long long addr, int dimm_config)
{
    long long hashed_pa = addr;
    long long pa_32_28 = 0;
    long long pa_17_13 = 0;
    long long pa_19_18 = 0;
    long long pa_12_11 = 0;
    long long hashed_pa_17_11 = 0;

    if(dimm_config & HASH_PA)
    {
        if(addr & 0x8000000000) // if PA[39] = 1, return addr
            return addr;

        pa_32_28 = ((addr & 0x1f0000000) >> 28);
        pa_17_13 = ((addr & 0x3e000) >> 13);
        pa_19_18 = ((addr & (0x3 << 18)) >> 18);
        pa_12_11 = ((addr & (0x3 << 11)) >> 11);
        //io_printf((char *)" pa_32_28 = %llx, pa_17_13 = %llx, pa_19_18 = %llx, pa_12_11 = %llx \n", pa_32_28, pa_17_13, pa_19_18, pa_12_11);
        hashed_pa_17_11 = (pa_32_28 ^ pa_17_13);
        hashed_pa_17_11 = (hashed_pa_17_11 << 2) | (pa_19_18 ^ pa_12_11);
        hashed_pa = (hashed_pa & 0xfffffc07ff) | (hashed_pa_17_11 << 11);
        //io_printf((char *)" ADDR = %llx, HASHED_PA = %llx\n",addr, hashed_pa);
        return hashed_pa;
    }
    else
        return addr;
}

long long address_decode(long long *addr, int dimm_config, int shift)
{
/*
  DUAL CHANNEL:
	dway = RAS[14:0], CAS[10:2], BA[2:0], CAS[1:0]
		  [28:14]    [13:5]    [4:2]	 [1:0]
  SINGLE CHANNEL:
	dway = RAS[14:0], CAS[10:3], BA[2:0], CAS[2:0]
		  [28:14]    [13:6]    [5:3]	 [2:0]
*/

    long long dway = 0;
    int dimm_adjust = 0;
    int lsb_mask = 0;
    int msb_cas_bits_count = 0;
    int msb_cas = 0;
    int bank_addr = 0;
    long long dimm_addr = 0;
    int dimm_addr_bits = 0;

    long long saddr = *addr;
//io_printf("-->before pm_address_shift, addr is %016llx\n",saddr);
    saddr = pm_address_shift(saddr, shift);
//io_printf("-->after pm_address_shift, addr is %016llx\n",saddr);
    saddr = fc_hash_pa(saddr, dimm_config);
//io_printf("-->after fc_hash_pa, addr is %016llx\n",saddr);

    //io_printf((char *)" entering address_decode. addr=%llx, dimm_config=%d\n",(saddr),dimm_config);
    if(dimm_config & DUAL_CHANNEL)
    {
        if(dimm_config & RANK_HIGH) // 2-ch Rank-high, Rank-dimm, Stack-dimm
        {
            if(dimm_config & DIMM_CONF_8)
                dimm_addr_bits = 3;
            else if(dimm_config & DIMM_CONF_6)
                dimm_addr_bits = 3;
            else if(dimm_config & DIMM_CONF_4)
                dimm_addr_bits = 2;
            else if(dimm_config & DIMM_CONF_2)
                dimm_addr_bits = 1;
            else dimm_addr_bits = 0;

            if (dimm_config & DIMM_1G) { // 1G
                if (dimm_config & DIMM_512) { // 2G
                    dimm_addr = (((saddr) & ((0xffffffffff) >> (5 - dimm_addr_bits))) >> 35);
                    dway = ((saddr) & ((0xffffffffff) >> 6)) >> 11; // RAS[14:0], CAS[10:3]
                    dway = (dway << 1) | (((saddr) >> 34) & 1); // CAS[2]

                    // last 5 bits are BA[2],BA[1],BA[0],PA[5],PA[4] 
                    // last 3 bits are common hence assigned in the end
                    dway = (dway << 2) | (((saddr) >> 9) & 3); // BA[2:1]
                }
                else { // 1G
                    dimm_addr = (((saddr) & ((0xffffffffff) >> (6 - dimm_addr_bits))) >> 34);
                    dway = ((saddr) & ((0xffffffffff) >> 7)) >> 11; // RAS[13:0], CAS[10:3]
                    dway = (dway << 1) | (((saddr) >> 33) & 1); // CAS[2]

                    // last 5 bits are BA[2],BA[1],BA[0],PA[5],PA[4] 
                    // last 3 bits are common hence assigned in the end
                    dway = (dway << 2) | (((saddr) >> 9) & 3); // BA[2:1]
                }
            }
            else { // 512 and 256
                dimm_addr = (((saddr) & ((0xffffffffff) >> (8 - (dimm_config & 0xf) - dimm_addr_bits))) >> (32 + (dimm_config & 0xf)));
                dway = ((saddr) & ((0xffffffffff) >> (8 - (dimm_config & 0xf)))) >> 10; // RAS[13,12:0], CAS[10:2]

                // last 5 bits are 0,BA[1],BA[0],PA[5],PA[4] 
                // last 3 bits are common hence assigned in the end
                dway = (dway << 1);
                dway = (dway << 1) | (((saddr) >> 9) & 1); // BA[1]
            }
            // restore bit  6
            dway = (dway << 1) | (((saddr) >> 6) & 1); // BA[1]
            // Restore bit 4 & 5
            dway = (dway << 2) | (((saddr) >> 4) & 3); // PA[5:4]
            //io_printf((char *)"dimm_addr = %x, dway = %llx\n",dimm_addr, dway);
            dway |= (dimm_addr << 29);
        }
        else if(dimm_config & RANK_LOW) // 2-ch rank-low
        {
            if(dimm_config & DIMM_CONF_8)
                dimm_addr_bits = 3;
            else if(dimm_config & DIMM_CONF_6)
                dimm_addr_bits = 3;
            else if(dimm_config & DIMM_CONF_4)
                dimm_addr_bits = 2;
            else if(dimm_config & DIMM_CONF_2)
                dimm_addr_bits = 1;
            else dimm_addr_bits = 0;

            if(dimm_config & RANK_DIMM)
            {
                if(dimm_config & DIMM_1G) { // 1G or 2G
                    if(dimm_config & DIMM_512) // 2G
                        dimm_adjust = 0;
                    else
                        dimm_adjust = 1;

                    lsb_mask = 0;
                    msb_cas_bits_count = 0;
                    msb_cas = 0;
                    bank_addr = 0;
                    if(dimm_config & DIMM_CONF_8) {
                        lsb_mask = 14;
                        msb_cas_bits_count = 4;
                        msb_cas = (((saddr) >> (34 - dimm_adjust)) & 0xf); // CAS[5:2]
                        dimm_addr = (((saddr) >> 11) & 0x7);
                    }
                    else if(dimm_config & DIMM_CONF_4) {
                        lsb_mask = 13;
                        msb_cas_bits_count = 3;
                        msb_cas = (((saddr) >> (34 - dimm_adjust)) & 0x7); // CAS[4:2]
                        dimm_addr = (((saddr) >> 11) & 0x3);
                    }
                    else if(dimm_config & DIMM_CONF_2) {
                        lsb_mask = 12;
                        msb_cas_bits_count = 2;
                        msb_cas = (((saddr) >> (34 - dimm_adjust)) & 0x3); // CAS[3:2]
                        dimm_addr = (((saddr) >> 11) & 0x1);
                    }
                    else {
                        lsb_mask = 11;
                        msb_cas_bits_count = 1;
                        msb_cas = (((saddr) >> (34 - dimm_adjust)) & 0x1); // CAS[2]
                        dimm_addr = 0;
                    }

                    dway = ((saddr) & (0xffffffffff >> (6 + dimm_adjust))) >> lsb_mask; // RAS[14,13:0], CAS[10:6,5,4,3]
                    dway = (dway << msb_cas_bits_count) | msb_cas;
                    bank_addr = (((saddr) >> 9) & 0x3); // BA[2:1]
                    dway = (dway << 2) | bank_addr;
                } // 1G or 2G
                else { // 512 or 256
                    if(dimm_config & DIMM_512)
                        dimm_adjust = 0;
                    else
                        dimm_adjust = 1;

                    lsb_mask = 0;
                    msb_cas_bits_count = 0;
                    msb_cas = 0;
                    bank_addr = 0;
                    if(dimm_config & DIMM_CONF_8) {
                        lsb_mask = 13;
                        msb_cas_bits_count = 3;
                        msb_cas = (((saddr) >> (33 - dimm_adjust)) & 0x7); // CAS[4:2]
                        dimm_addr = (((saddr) >> 10) & 0x7);
                    }
                    else if(dimm_config & DIMM_CONF_4) {
                        lsb_mask = 12;
                        msb_cas_bits_count = 2;
                        msb_cas = (((saddr) >> (33 - dimm_adjust)) & 0x3); // CAS[3:2]
                        dimm_addr = (((saddr) >> 10) & 0x3);
                    }
                    else if(dimm_config & DIMM_CONF_2) {
                        lsb_mask = 11;
                        msb_cas_bits_count = 1;
                        msb_cas = (((saddr) >> (33 - dimm_adjust)) & 0x1); // CAS[2]
                        dimm_addr = (((saddr) >> 10) & 0x1);
                    }
                    else {
                        lsb_mask = 10;
                        msb_cas_bits_count = 0;
                        msb_cas = 0;
                        dimm_addr = 0;
                    }
                    dway = ((saddr) & (0xffffffffff >> (7 + dimm_adjust))) >> lsb_mask; // RAS[13,12:0], CAS[10:5,4,3,2]
                    dway = (dway << msb_cas_bits_count) | msb_cas;
                    bank_addr = (((saddr) >> 9) & 0x1); // BA[1]
                    dway = (dway << 1); // 0 for BA[2]
                    dway = (dway << 1) | bank_addr;
                } // 512 or 256


                // restore bit 6
                dway = (dway << 1) | (((saddr) >> 6) & 1); // BA[0]
                // restore bit 5 & 4
                dway = (dway << 2) | (((saddr) >> 4) & 0x3); // PA[5:4]
                dway |= (dimm_addr << 29);
            } // RANK_DIMM
            else if(dimm_config & STACK_DIMM)
            {
                if(dimm_config & DIMM_1G) { // 1G and 2G
                    if(dimm_config & DIMM_512)
                        dimm_adjust = 0;
                    else
                        dimm_adjust = 1;

                    lsb_mask = 0;
                    msb_cas_bits_count = 0;
                    msb_cas = 0;
                    bank_addr = 0;
                    if(dimm_config & DIMM_CONF_8) {
                        lsb_mask = 15;
                        msb_cas_bits_count = 5;
                        msb_cas = (((saddr) >> (34 - dimm_adjust)) & 0x1f); // CAS[6:2]
                        dimm_addr = (((saddr) >> 11) & 0x7);
                    }
                    else if(dimm_config & DIMM_CONF_4) {
                        lsb_mask = 14;
                        msb_cas_bits_count = 4;
                        msb_cas = (((saddr) >> (34 - dimm_adjust)) & 0xf); // CAS[5:2]
                        dimm_addr = (((saddr) >> 11) & 0x3); 
                    }
                    else if(dimm_config & DIMM_CONF_2) {
                        lsb_mask = 13;
                        msb_cas_bits_count = 3;
                        msb_cas = (((saddr) >> (34 - dimm_adjust)) & 0x7); // CAS[4:2]
                        dimm_addr = (((saddr) >> 11) & 0x1);
                    }
                    else {
                        lsb_mask = 12;
                        msb_cas_bits_count = 2;
                        msb_cas = (((saddr) >> (34 - dimm_adjust)) & 0x3); // CAS[3:2]
                        dimm_addr = 0;
                    }

                    dway = ((saddr) & (0xffffffffff >> (6 + dimm_adjust))) >> lsb_mask; // RAS[14,13:0], CAS[10:7,6,5,4]
                    dway = (dway << msb_cas_bits_count) | msb_cas;
                    bank_addr = (((saddr) >> 9) & 0x3); // BA[2:1]
                    dway = (dway << 2) | bank_addr;
                }
                else { // 512 & 256
                    if(dimm_config & DIMM_512)
                        dimm_adjust = 0;
                    else
                        dimm_adjust = 1;

                    lsb_mask = 0;
                    msb_cas_bits_count = 0;
                    msb_cas = 0;
                    bank_addr = 0;
                    if(dimm_config & DIMM_CONF_8) {
                        lsb_mask = 14;
                        msb_cas_bits_count = 4;
                        msb_cas = (((saddr) >> (33 - dimm_adjust)) & 0xf); // CAS[5:2]
                        dimm_addr = (((saddr) >> 10) & 0x7);
                    }
                    else if(dimm_config & DIMM_CONF_4) {
                        lsb_mask = 13;
                        msb_cas_bits_count = 3;
                        msb_cas = (((saddr) >> (33 - dimm_adjust)) & 0x7); // CAS[4:2]
                        dimm_addr = (((saddr) >> 10) & 0x3);
                    }
                    else if(dimm_config & DIMM_CONF_2) {
                        lsb_mask = 12;
                        msb_cas_bits_count = 2;
                        msb_cas = (((saddr) >> (33 - dimm_adjust)) & 0x3); // CAS[3:2]
                        dimm_addr = (((saddr) >> 10) & 0x1);
                    }
                    else {
                        lsb_mask = 11;
                        msb_cas_bits_count = 1;
                        msb_cas = (((saddr) >> (33 - dimm_adjust)) & 0x1); // CAS[2]
                        dimm_addr = 0;
                    }
                    dway = ((saddr) & (0xffffffffff >> (7 + dimm_adjust))) >> lsb_mask; // RAS[13,12:0], CAS[10:6,5,4,3]
                    dway = (dway << msb_cas_bits_count) | msb_cas;
                    bank_addr = (((saddr) >> 9) & 0x1); // BA[1]
                    dway = (dway << 1); // 0 for BA[2]
                    dway = (dway << 1) | bank_addr;
                } // 512 & 256

                // restore bit 6
                dway = (dway << 1) | (((saddr) >> 6) & 1); // BA[0]
                // restore bit 5 & 4
                dway = (dway << 2) | (((saddr) >> 4) & 0x3); // PA[5:4]
                dway |= (dimm_addr << 29);
            } // STACK_DIMM
        } // 2-ch rk-low
    }
    else // SNG_CHANNEL
    {
        if(dimm_config & RANK_HIGH) // 1-ch Rank-high, rank-dimm, stack-dimm
        {
            if(dimm_config & DIMM_CONF_8)
                dimm_addr_bits = 3;
            else if(dimm_config & DIMM_CONF_6)
                dimm_addr_bits = 3;
            else if(dimm_config & DIMM_CONF_4)
                dimm_addr_bits = 2;
            else if(dimm_config & DIMM_CONF_2)
                dimm_addr_bits = 1;
            else dimm_addr_bits = 0;

            if (dimm_config & DIMM_1G) { // 1G & 2G
                if (dimm_config & DIMM_512)
                    dimm_adjust = 0;
                else
                    dimm_adjust = 1;

                dimm_addr = (((saddr) & ((0xffffffffff) >> (6 + dimm_adjust - dimm_addr_bits))) >> (34 - dimm_adjust));

                // RAS, CAS[10:4]
                dway = ((saddr) & ((0xffffffffff) >> (7 + dimm_adjust))) >> 11;
                // CAS[3]
                dway = (dway << 1) | (((saddr) >> (33 - dimm_adjust)) & 1);


                // last 6 bits are BA[2],BA[1],BA[0],CAS[2],CAS[1],CAS[0]
                dway = (dway << 2) | (((saddr) >> 9) & 3); // BA[2:1]
                dway = (dway << 1) | (((saddr) >> 6) & 1); // BA[0]
                dway = (dway << 2) | (((saddr) >> 4) & 0x3);  // CAS[2], CAS[1]
                dway = (dway << 1); // CAS[0]
            }
            else { // 512 & 256
                dimm_addr = (((saddr) & ((0xffffffffff) >> (9 - (dimm_config & 0xf) - dimm_addr_bits))) >> (31 + (dimm_config & 0xf)));
                // RAS, CAS[10:3]
                dway = ((saddr) & ((0xffffffffff) >> (9 - (dimm_config & 0xf)))) >> 10;


                // last 6 bits are BA[2],BA[1],BA[0],CAS[2],CAS[1],CAS[0]
                dway = (dway << 1); // BA[2]
                dway = (dway << 1) | (((saddr) >> 9) & 1); // BA[1]
                dway = (dway << 1) | (((saddr) >> 6) & 1); // BA[0]
                dway = (dway << 2) | (((saddr) >> 4) & 0x3);  // CAS[2], CAS[1]
                dway = (dway << 1); // CAS[0]
            }
            //io_printf((char *)"dimm_addr = %x, dway = %llx\n",dimm_addr, dway);
            dway |= (dimm_addr << 29);
        }
        else if(dimm_config & RANK_LOW) // 1-ch rank-low
        {
            if(dimm_config & DIMM_CONF_8)
                dimm_addr_bits = 3;
            else if(dimm_config & DIMM_CONF_6)
                dimm_addr_bits = 3;
            else if(dimm_config & DIMM_CONF_4)
                dimm_addr_bits = 2;
            else if(dimm_config & DIMM_CONF_2)
                dimm_addr_bits = 1;
            else dimm_addr_bits = 0;


            if(dimm_config & RANK_DIMM)
            {
                if(dimm_config & DIMM_1G) { // 1G & 2G
                    if(dimm_config & DIMM_512)
                        dimm_adjust = 0;
                    else
                        dimm_adjust = 1;

                    lsb_mask = 0;
                    msb_cas_bits_count = 0;
                    msb_cas = 0;
                    bank_addr = 0;
                    if(dimm_config & DIMM_CONF_8) {
                        lsb_mask = 14;
                        msb_cas_bits_count = 4;
                        msb_cas = (((saddr) >> (33 - dimm_adjust)) & 0xf);
                        dimm_addr = (((saddr) >> 11) & 0x7);
                    }
                    else if(dimm_config & DIMM_CONF_4) {
                        lsb_mask = 13;
                        msb_cas_bits_count = 3;
                        msb_cas = (((saddr) >> (33 - dimm_adjust)) & 0x7);
                        dimm_addr = (((saddr) >> 11) & 0x3);
                    }
                    else if(dimm_config & DIMM_CONF_2) {
                        lsb_mask = 12;
                        msb_cas_bits_count = 2;
                        msb_cas = (((saddr) >> (33 - dimm_adjust)) & 0x3);
                        dimm_addr = (((saddr) >> 11) & 0x1);
                    }
                    else {
                        lsb_mask = 11;
                        msb_cas_bits_count = 1;
                        msb_cas = (((saddr) >> (33 - dimm_adjust)) & 0x1);
                        dimm_addr = 0;
                    }

                    // RAS, CAS[10:7,6,5,4]
                    dway = ((saddr) & (0xffffffffff >> (7 + dimm_adjust))) >> lsb_mask;
                    dway = (dway << msb_cas_bits_count) | msb_cas;

                    // BA[2:0]
                    bank_addr = (((saddr) >> 9) & 0x3);
                    bank_addr = (bank_addr << 1) | (((saddr) >> 6) & 1);
                    dway = (dway << 3) | bank_addr;

                    // CAS[2],CAS[1],CAS[0]
                    dway = (dway << 2) | (((saddr) >> 4) & 0x3); // CAS[2], CAS[1]
                    dway = (dway << 1); // CAS[0]
                } // 1G & 2G
                else { // 512 & 256
                    if(dimm_config & DIMM_512)
                        dimm_adjust = 0;
                    else
                        dimm_adjust = 1;

                    lsb_mask = 0;
                    msb_cas_bits_count = 0;
                    msb_cas = 0;
                    bank_addr = 0;
                    if(dimm_config & DIMM_CONF_8) {
                        lsb_mask = 13;
                        msb_cas_bits_count = 3;
                        msb_cas = (((saddr) >> (32 - dimm_adjust)) & 0x7);
                        dimm_addr = (((saddr) >> 10) & 0x7);
                    }
                    else if(dimm_config & DIMM_CONF_4) {
                        lsb_mask = 12;
                        msb_cas_bits_count = 2;
                        msb_cas = (((saddr) >> (32 - dimm_adjust)) & 0x3);
                        dimm_addr = (((saddr) >> 10) & 0x3);
                    }
                    else if(dimm_config & DIMM_CONF_2) {
                        lsb_mask = 11;
                        msb_cas_bits_count = 1;
                        msb_cas = (((saddr) >> (32 - dimm_adjust)) & 0x1);
                        dimm_addr = (((saddr) >> 10) & 0x1);
                    }
                    else {
                        lsb_mask = 10; 
                        msb_cas_bits_count = 0;
                        msb_cas = 0;
                        dimm_addr = 0;
                    }
                    // RAS, CAS[10:6,5,4,3]
                    dway = ((saddr) & (0xffffffffff >> (8 + dimm_adjust))) >> lsb_mask;
                    dway = (dway << msb_cas_bits_count) | msb_cas;

                    // BA
                    bank_addr = (((saddr) >> 9) & 0x1);
                    bank_addr = (bank_addr << 1) | (((saddr) >> 6) & 1);
                    dway = (dway << 1); // BA[2]
                    dway = (dway << 2) | (bank_addr & 0x3);

                    // CAS[2],CAS[1],CAS[0]
                    dway = (dway << 2) | (((saddr) >> 4) & 0x3); // CAS[2], CAS[1]
                    dway = (dway << 1); // CAS[0]
                }
                dway |= (dimm_addr << 29);
            }
            else if(dimm_config & STACK_DIMM)
            {
                if(dimm_config & DIMM_1G) { // 1G and 2G
                    if(dimm_config & DIMM_512)
                        dimm_adjust = 0;
                    else
                        dimm_adjust = 1;

                    lsb_mask = 0;
                    msb_cas_bits_count = 0;
                    msb_cas = 0;
                    bank_addr = 0;
                    if(dimm_config & DIMM_CONF_8) {
                        lsb_mask = 15;
                        msb_cas_bits_count = 5;
                        msb_cas = (((saddr) >> (33 - dimm_adjust)) & 0x1f);
                        dimm_addr = (((saddr) >> 11) & 0x7);
                    }
                    else if(dimm_config & DIMM_CONF_4) {
                        lsb_mask = 14;
                        msb_cas_bits_count = 4;
                        msb_cas = (((saddr) >> (33 - dimm_adjust)) & 0xf);
                        dimm_addr = (((saddr) >> 11) & 0x3);
                    }
                    else if(dimm_config & DIMM_CONF_2) {
                        lsb_mask = 13;
                        msb_cas_bits_count = 3;
                        msb_cas = (((saddr) >> (33 - dimm_adjust)) & 0x7);
                        dimm_addr = (((saddr) >> 11) & 0x1);
                    }
                    else {
                        lsb_mask = 12;
                        msb_cas_bits_count = 2;
                        msb_cas = (((saddr) >> (33 - dimm_adjust)) & 0x3);
                        dimm_addr = 0;
                    }
                    // RAS, CAS[10:8,7,6,5]
                    dway = ((saddr) & (0xffffffffff >> (7 + dimm_adjust))) >> lsb_mask;
                    dway = (dway << msb_cas_bits_count) | msb_cas;

                    // BA
                    bank_addr = (((saddr) >> 9) & 0x3);
                    bank_addr = (bank_addr << 1) | (((saddr) >> 6) & 1);
                    dway = (dway << 3) | bank_addr;

                    // CAS[2],CAS[1],CAS[0]
                    dway = (dway << 2) | (((saddr) >> 4) & 0x3); // CAS[2], CAS[1]
                    dway = (dway << 1); // CAS[0]
                }
                else { // 512 & 256
                    if(dimm_config & DIMM_512)
                        dimm_adjust = 0;
                    else
                        dimm_adjust = 1;

                    lsb_mask = 0;
                    msb_cas_bits_count = 0;
                    msb_cas = 0;
                    bank_addr = 0;
                    if(dimm_config & DIMM_CONF_8) {
                        lsb_mask = 14;
                        msb_cas_bits_count = 4;
                        msb_cas = (((saddr) >> (32 - dimm_adjust)) & 0xf);
                        dimm_addr = (((saddr) >> 10) & 0x7);
                    }
                    else if(dimm_config & DIMM_CONF_4) {
                        lsb_mask = 13;
                        msb_cas_bits_count = 3;
                        msb_cas = (((saddr) >> (32 - dimm_adjust)) & 0x7);
                        dimm_addr = (((saddr) >> 10) & 0x3);
                    }
                    else if(dimm_config & DIMM_CONF_2) {
                        lsb_mask = 12;
                        msb_cas_bits_count = 2;
                        msb_cas = (((saddr) >> (32 - dimm_adjust)) & 0x3);
                        dimm_addr = (((saddr) >> 10) & 0x1);
                    }
                    else {
                        lsb_mask = 11;
                        msb_cas_bits_count = 1;
                        msb_cas = (((saddr) >> (32 - dimm_adjust)) & 0x1);
                        dimm_addr = 0;
                    }
                    // RAS, CAS[10:7,6,5,4]
                    dway = ((saddr) & (0xffffffffff >> (8 + dimm_adjust))) >> lsb_mask;
                    dway = (dway << msb_cas_bits_count) | msb_cas;

                    // BA
                    bank_addr = (((saddr) >> 9) & 0x1);
                    bank_addr = (bank_addr << 1) | (((saddr) >> 6) & 1);
                    dway = (dway << 1); // BA[2]
                    dway = (dway << 2) | (bank_addr & 0x3);

                    // CAS[2],CAS[1],CAS[0]
                    dway = (dway << 2) | (((saddr) >> 4) & 0x3); // CAS[2], CAS[1]
                    dway = (dway << 1); // CAS[0]
                }
                dway |= (dimm_addr << 29);
            }
        }

    }
    //io_printf((char *)" returning dway=%llx\n",dway);
    return dway;
}

long long decode_cs(long long *addr, int dimm_config, int shift)
{
    long long cs = 0;
    int channel_adjust = 0, bit_adjust = 0;

    long long saddr = *addr;
    saddr = pm_address_shift(saddr, shift);
    saddr = fc_hash_pa(saddr, dimm_config);

    //io_printf((char *)" cs_decode, addr=%llx, dimm_config=%d\n",saddr,dimm_config);
    if(dimm_config & RANK_DIMM)
    {
        cs = 0;
    }
    else
    {
        if(dimm_config & RANK_HIGH)
        {
            if(dimm_config & DUAL_CHANNEL)
                channel_adjust = 0;
            else
                channel_adjust = 1;

            if(dimm_config & DIMM_1G)
            {
                if(dimm_config & DIMM_512)
                    bit_adjust = 0;
                else
                    bit_adjust = 1;
            }
            else if(dimm_config & DIMM_512)
                bit_adjust = 2;
            else
                bit_adjust = 3;
            
            if(dimm_config & DIMM_CONF_8)
                cs = ((saddr) >> (38 - channel_adjust - bit_adjust)) & 0x1;
            else if(dimm_config & DIMM_CONF_4)
                cs = ((saddr) >> (37 - channel_adjust - bit_adjust)) & 0x1;
            else if(dimm_config & DIMM_CONF_2)
                cs = ((saddr) >> (36 - channel_adjust - bit_adjust)) & 0x1;
            else 
                cs = ((saddr) >> (35 - channel_adjust - bit_adjust)) & 0x1;
        }
        else
        {

            if(dimm_config & DIMM_1G) // 1G or 2G
                bit_adjust = 0;
            else // 512 or 256
                bit_adjust = 1;

            if(dimm_config & DIMM_CONF_8)
                cs = ((saddr) >> (14 - bit_adjust)) & 0x1;
            else if(dimm_config & DIMM_CONF_6)
                cs = ((saddr) >> (12 - bit_adjust)) & 0x1;
            else if(dimm_config & DIMM_CONF_4)
                cs = ((saddr) >> (13 - bit_adjust)) & 0x1;
            else if(dimm_config & DIMM_CONF_2)
                cs = ((saddr) >> (12 - bit_adjust)) & 0x1;
            else
                cs = ((saddr) >> (11 - bit_adjust)) & 0x1;
        }
    }

    //io_printf((char *)" cs=%d\n",cs);
    return cs;
}

int check_if_valid_PA(long long addr, int dimm_config, int shift)
{
    int dimm_adjust = 0;
    int rank_adjust = 0;
    int channel_adjust = 0;
    int side_adjust = 0;
    int size_adjust = 0;
    long long pa_mask_l = 0;

    if(dimm_config & DIMM_CONF_8)
        dimm_adjust = 0;
    else if(dimm_config & DIMM_CONF_4)
        dimm_adjust = 1;
    else if(dimm_config & DIMM_CONF_2)
        dimm_adjust = 2;
    else
        dimm_adjust = 3;

    
    //if(dimm_config & RANK_LOW)
    //   rank_adjust = 1;
    //else
        rank_adjust = 0;

    if(dimm_config &  STACK_DIMM)
        side_adjust = 0;
    else 
        side_adjust = 1;

    if(dimm_config & SNG_CHANNEL)
        channel_adjust = 1;
    else 
        channel_adjust = 0;
    
    if(dimm_config & DIMM_1G)
        if(dimm_config & DIMM_512)
            size_adjust = 0;
        else
            size_adjust = 1;
    else if(dimm_config & DIMM_512)
        size_adjust = 2;
    else 
        size_adjust = 3;

    pa_mask_l = (0xffffffffff >> (1 + channel_adjust + side_adjust + size_adjust + rank_adjust + dimm_adjust));

    if(shift > 0)
        addr = addr << shift;

    if(addr & (~pa_mask_l)) {
        io_printf((char *)"Warning: Out-of-bound address detected. Address is %llx\n",addr);
        return -1;
    }
    return 1;
}
