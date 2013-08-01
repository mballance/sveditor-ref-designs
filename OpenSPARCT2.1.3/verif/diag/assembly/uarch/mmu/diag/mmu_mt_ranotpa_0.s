/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: mmu_mt_ranotpa_0.s
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
#define PORTABLE_CORE
		
#define THREAD_COUNT	8
#define THREAD_STRIDE	1

#define MY_HP_TEXT_PA     0x1050000000
#define MY_HP_DATA_PA     0x1050001000

#define ASI_PRIMARY_CONTEXT_0   0x21
#define ASI_ITLB_DATA_IN_REG    0x54
#define ASI_DMMU_TAG_ACCESS     0x58
#define ASI_DTLB_DATA_IN_REG    0x5c
#define ASI_DMMU_SFAR           0x58

#define PART0_NZ_RANOTPA_2      0
			
#define MY_USER_TEXT_VA000      0x7a000000
#define MY_USER_TEXT_RA000      0x7b000000
#define MY_USER_TEXT_PA000      0x107b000000
#define MY_USER_TEXT_VA001      0x7a010000
#define MY_USER_TEXT_RA001      0x7b010000
#define MY_USER_TEXT_PA001      0x107b010000
#define MY_USER_TEXT_VA002      0x7a020000
#define MY_USER_TEXT_RA002      0x7b020000
#define MY_USER_TEXT_PA002      0x107b020000
#define MY_USER_TEXT_VA003      0x7a030000
#define MY_USER_TEXT_RA003      0x7b030000
#define MY_USER_TEXT_PA003      0x107b030000
#define MY_USER_TEXT_VA004      0x7a040000
#define MY_USER_TEXT_RA004      0x7b040000
#define MY_USER_TEXT_PA004      0x107b040000
#define MY_USER_TEXT_VA005      0x7a050000
#define MY_USER_TEXT_RA005      0x7b050000
#define MY_USER_TEXT_PA005      0x107b050000
#define MY_USER_TEXT_VA006      0x7a060000
#define MY_USER_TEXT_RA006      0x7b060000
#define MY_USER_TEXT_PA006      0x107b060000
#define MY_USER_TEXT_VA007      0x7a070000
#define MY_USER_TEXT_RA007      0x7b070000
#define MY_USER_TEXT_PA007      0x107b070000
#define MY_USER_TEXT_VA008      0x7a080000
#define MY_USER_TEXT_RA008      0x7b080000
#define MY_USER_TEXT_PA008      0x107b080000
#define MY_USER_TEXT_VA009      0x7a090000
#define MY_USER_TEXT_RA009      0x7b090000
#define MY_USER_TEXT_PA009      0x107b090000
#define MY_USER_TEXT_VA010      0x7a0a0000
#define MY_USER_TEXT_RA010      0x7b0a0000
#define MY_USER_TEXT_PA010      0x107b0a0000
#define MY_USER_TEXT_VA011      0x7a0b0000
#define MY_USER_TEXT_RA011      0x7b0b0000
#define MY_USER_TEXT_PA011      0x107b0b0000
#define MY_USER_TEXT_VA012      0x7a0c0000
#define MY_USER_TEXT_RA012      0x7b0c0000
#define MY_USER_TEXT_PA012      0x107b0c0000
#define MY_USER_TEXT_VA013      0x7a0d0000
#define MY_USER_TEXT_RA013      0x7b0d0000
#define MY_USER_TEXT_PA013      0x107b0d0000
#define MY_USER_TEXT_VA014      0x7a0e0000
#define MY_USER_TEXT_RA014      0x7b0e0000
#define MY_USER_TEXT_PA014      0x107b0e0000
#define MY_USER_TEXT_VA015      0x7a0f0000
#define MY_USER_TEXT_RA015      0x7b0f0000
#define MY_USER_TEXT_PA015      0x107b0f0000
#define MY_USER_TEXT_VA016      0x7a100000
#define MY_USER_TEXT_RA016      0x7b100000
#define MY_USER_TEXT_PA016      0x107b100000
#define MY_USER_TEXT_VA017      0x7a110000
#define MY_USER_TEXT_RA017      0x7b110000
#define MY_USER_TEXT_PA017      0x107b110000
#define MY_USER_TEXT_VA018      0x7a120000
#define MY_USER_TEXT_RA018      0x7b120000
#define MY_USER_TEXT_PA018      0x107b120000
#define MY_USER_TEXT_VA019      0x7a130000
#define MY_USER_TEXT_RA019      0x7b130000
#define MY_USER_TEXT_PA019      0x107b130000
#define MY_USER_TEXT_VA020      0x7a140000
#define MY_USER_TEXT_RA020      0x7b140000
#define MY_USER_TEXT_PA020      0x107b140000
#define MY_USER_TEXT_VA021      0x7a150000
#define MY_USER_TEXT_RA021      0x7b150000
#define MY_USER_TEXT_PA021      0x107b150000
#define MY_USER_TEXT_VA022      0x7a160000
#define MY_USER_TEXT_RA022      0x7b160000
#define MY_USER_TEXT_PA022      0x107b160000
#define MY_USER_TEXT_VA023      0x7a170000
#define MY_USER_TEXT_RA023      0x7b170000
#define MY_USER_TEXT_PA023      0x107b170000
#define MY_USER_TEXT_VA024      0x7a180000
#define MY_USER_TEXT_RA024      0x7b180000
#define MY_USER_TEXT_PA024      0x107b180000
#define MY_USER_TEXT_VA025      0x7a190000
#define MY_USER_TEXT_RA025      0x7b190000
#define MY_USER_TEXT_PA025      0x107b190000
#define MY_USER_TEXT_VA026      0x7a1a0000
#define MY_USER_TEXT_RA026      0x7b1a0000
#define MY_USER_TEXT_PA026      0x107b1a0000
#define MY_USER_TEXT_VA027      0x7a1b0000
#define MY_USER_TEXT_RA027      0x7b1b0000
#define MY_USER_TEXT_PA027      0x107b1b0000
#define MY_USER_TEXT_VA028      0x7a1c0000
#define MY_USER_TEXT_RA028      0x7b1c0000
#define MY_USER_TEXT_PA028      0x107b1c0000
#define MY_USER_TEXT_VA029      0x7a1d0000
#define MY_USER_TEXT_RA029      0x7b1d0000
#define MY_USER_TEXT_PA029      0x107b1d0000
#define MY_USER_TEXT_VA030      0x7a1e0000
#define MY_USER_TEXT_RA030      0x7b1e0000
#define MY_USER_TEXT_PA030      0x107b1e0000
#define MY_USER_TEXT_VA031      0x7a1f0000
#define MY_USER_TEXT_RA031      0x7b1f0000
#define MY_USER_TEXT_PA031      0x107b1f0000
#define MY_USER_TEXT_VA032      0x7a200000
#define MY_USER_TEXT_RA032      0x7b200000
#define MY_USER_TEXT_PA032      0x107b200000
#define MY_USER_TEXT_VA033      0x7a210000
#define MY_USER_TEXT_RA033      0x7b210000
#define MY_USER_TEXT_PA033      0x107b210000
#define MY_USER_TEXT_VA034      0x7a220000
#define MY_USER_TEXT_RA034      0x7b220000
#define MY_USER_TEXT_PA034      0x107b220000
#define MY_USER_TEXT_VA035      0x7a230000
#define MY_USER_TEXT_RA035      0x7b230000
#define MY_USER_TEXT_PA035      0x107b230000
#define MY_USER_TEXT_VA036      0x7a240000
#define MY_USER_TEXT_RA036      0x7b240000
#define MY_USER_TEXT_PA036      0x107b240000
#define MY_USER_TEXT_VA037      0x7a250000
#define MY_USER_TEXT_RA037      0x7b250000
#define MY_USER_TEXT_PA037      0x107b250000
#define MY_USER_TEXT_VA038      0x7a260000
#define MY_USER_TEXT_RA038      0x7b260000
#define MY_USER_TEXT_PA038      0x107b260000
#define MY_USER_TEXT_VA039      0x7a270000
#define MY_USER_TEXT_RA039      0x7b270000
#define MY_USER_TEXT_PA039      0x107b270000
#define MY_USER_TEXT_VA040      0x7a280000
#define MY_USER_TEXT_RA040      0x7b280000
#define MY_USER_TEXT_PA040      0x107b280000
#define MY_USER_TEXT_VA041      0x7a290000
#define MY_USER_TEXT_RA041      0x7b290000
#define MY_USER_TEXT_PA041      0x107b290000
#define MY_USER_TEXT_VA042      0x7a2a0000
#define MY_USER_TEXT_RA042      0x7b2a0000
#define MY_USER_TEXT_PA042      0x107b2a0000
#define MY_USER_TEXT_VA043      0x7a2b0000
#define MY_USER_TEXT_RA043      0x7b2b0000
#define MY_USER_TEXT_PA043      0x107b2b0000
#define MY_USER_TEXT_VA044      0x7a2c0000
#define MY_USER_TEXT_RA044      0x7b2c0000
#define MY_USER_TEXT_PA044      0x107b2c0000
#define MY_USER_TEXT_VA045      0x7a2d0000
#define MY_USER_TEXT_RA045      0x7b2d0000
#define MY_USER_TEXT_PA045      0x107b2d0000
#define MY_USER_TEXT_VA046      0x7a2e0000
#define MY_USER_TEXT_RA046      0x7b2e0000
#define MY_USER_TEXT_PA046      0x107b2e0000
#define MY_USER_TEXT_VA047      0x7a2f0000
#define MY_USER_TEXT_RA047      0x7b2f0000
#define MY_USER_TEXT_PA047      0x107b2f0000
#define MY_USER_TEXT_VA048      0x7a300000
#define MY_USER_TEXT_RA048      0x7b300000
#define MY_USER_TEXT_PA048      0x107b300000
#define MY_USER_TEXT_VA049      0x7a310000
#define MY_USER_TEXT_RA049      0x7b310000
#define MY_USER_TEXT_PA049      0x107b310000
#define MY_USER_TEXT_VA050      0x7a320000
#define MY_USER_TEXT_RA050      0x7b320000
#define MY_USER_TEXT_PA050      0x107b320000
#define MY_USER_TEXT_VA051      0x7a330000
#define MY_USER_TEXT_RA051      0x7b330000
#define MY_USER_TEXT_PA051      0x107b330000
#define MY_USER_TEXT_VA052      0x7a340000
#define MY_USER_TEXT_RA052      0x7b340000
#define MY_USER_TEXT_PA052      0x107b340000
#define MY_USER_TEXT_VA053      0x7a350000
#define MY_USER_TEXT_RA053      0x7b350000
#define MY_USER_TEXT_PA053      0x107b350000
#define MY_USER_TEXT_VA054      0x7a360000
#define MY_USER_TEXT_RA054      0x7b360000
#define MY_USER_TEXT_PA054      0x107b360000
#define MY_USER_TEXT_VA055      0x7a370000
#define MY_USER_TEXT_RA055      0x7b370000
#define MY_USER_TEXT_PA055      0x107b370000
#define MY_USER_TEXT_VA056      0x7a380000
#define MY_USER_TEXT_RA056      0x7b380000
#define MY_USER_TEXT_PA056      0x107b380000
#define MY_USER_TEXT_VA057      0x7a390000
#define MY_USER_TEXT_RA057      0x7b390000
#define MY_USER_TEXT_PA057      0x107b390000
#define MY_USER_TEXT_VA058      0x7a3a0000
#define MY_USER_TEXT_RA058      0x7b3a0000
#define MY_USER_TEXT_PA058      0x107b3a0000
#define MY_USER_TEXT_VA059      0x7a3b0000
#define MY_USER_TEXT_RA059      0x7b3b0000
#define MY_USER_TEXT_PA059      0x107b3b0000
#define MY_USER_TEXT_VA060      0x7a3c0000
#define MY_USER_TEXT_RA060      0x7b3c0000
#define MY_USER_TEXT_PA060      0x107b3c0000
#define MY_USER_TEXT_VA061      0x7a3d0000
#define MY_USER_TEXT_RA061      0x7b3d0000
#define MY_USER_TEXT_PA061      0x107b3d0000
#define MY_USER_TEXT_VA062      0x7a3e0000
#define MY_USER_TEXT_RA062      0x7b3e0000
#define MY_USER_TEXT_PA062      0x107b3e0000
#define MY_USER_TEXT_VA063      0x7a3f0000
#define MY_USER_TEXT_RA063      0x7b3f0000
#define MY_USER_TEXT_PA063      0x107b3f0000
#define MY_USER_TEXT_VA064      0x7a400000
#define MY_USER_TEXT_RA064      0x7b400000
#define MY_USER_TEXT_PA064      0x107b400000
#define MY_USER_TEXT_VA065      0x7a410000
#define MY_USER_TEXT_RA065      0x7b410000
#define MY_USER_TEXT_PA065      0x107b410000
#define MY_USER_TEXT_VA066      0x7a420000
#define MY_USER_TEXT_RA066      0x7b420000
#define MY_USER_TEXT_PA066      0x107b420000
#define MY_USER_TEXT_VA067      0x7a430000
#define MY_USER_TEXT_RA067      0x7b430000
#define MY_USER_TEXT_PA067      0x107b430000
#define MY_USER_TEXT_VA068      0x7a440000
#define MY_USER_TEXT_RA068      0x7b440000
#define MY_USER_TEXT_PA068      0x107b440000
#define MY_USER_TEXT_VA069      0x7a450000
#define MY_USER_TEXT_RA069      0x7b450000
#define MY_USER_TEXT_PA069      0x107b450000
#define MY_USER_TEXT_VA070      0x7a460000
#define MY_USER_TEXT_RA070      0x7b460000
#define MY_USER_TEXT_PA070      0x107b460000
#define MY_USER_TEXT_VA071      0x7a470000
#define MY_USER_TEXT_RA071      0x7b470000
#define MY_USER_TEXT_PA071      0x107b470000
#define MY_USER_TEXT_VA072      0x7a480000
#define MY_USER_TEXT_RA072      0x7b480000
#define MY_USER_TEXT_PA072      0x107b480000
#define MY_USER_TEXT_VA073      0x7a490000
#define MY_USER_TEXT_RA073      0x7b490000
#define MY_USER_TEXT_PA073      0x107b490000
#define MY_USER_TEXT_VA074      0x7a4a0000
#define MY_USER_TEXT_RA074      0x7b4a0000
#define MY_USER_TEXT_PA074      0x107b4a0000
#define MY_USER_TEXT_VA075      0x7a4b0000
#define MY_USER_TEXT_RA075      0x7b4b0000
#define MY_USER_TEXT_PA075      0x107b4b0000
#define MY_USER_TEXT_VA076      0x7a4c0000
#define MY_USER_TEXT_RA076      0x7b4c0000
#define MY_USER_TEXT_PA076      0x107b4c0000
#define MY_USER_TEXT_VA077      0x7a4d0000
#define MY_USER_TEXT_RA077      0x7b4d0000
#define MY_USER_TEXT_PA077      0x107b4d0000
#define MY_USER_TEXT_VA078      0x7a4e0000
#define MY_USER_TEXT_RA078      0x7b4e0000
#define MY_USER_TEXT_PA078      0x107b4e0000
#define MY_USER_TEXT_VA079      0x7a4f0000
#define MY_USER_TEXT_RA079      0x7b4f0000
#define MY_USER_TEXT_PA079      0x107b4f0000
#define MY_USER_TEXT_VA080      0x7a500000
#define MY_USER_TEXT_RA080      0x7b500000
#define MY_USER_TEXT_PA080      0x107b500000
#define MY_USER_TEXT_VA081      0x7a510000
#define MY_USER_TEXT_RA081      0x7b510000
#define MY_USER_TEXT_PA081      0x107b510000
#define MY_USER_TEXT_VA082      0x7a520000
#define MY_USER_TEXT_RA082      0x7b520000
#define MY_USER_TEXT_PA082      0x107b520000
#define MY_USER_TEXT_VA083      0x7a530000
#define MY_USER_TEXT_RA083      0x7b530000
#define MY_USER_TEXT_PA083      0x107b530000
#define MY_USER_TEXT_VA084      0x7a540000
#define MY_USER_TEXT_RA084      0x7b540000
#define MY_USER_TEXT_PA084      0x107b540000
#define MY_USER_TEXT_VA085      0x7a550000
#define MY_USER_TEXT_RA085      0x7b550000
#define MY_USER_TEXT_PA085      0x107b550000
#define MY_USER_TEXT_VA086      0x7a560000
#define MY_USER_TEXT_RA086      0x7b560000
#define MY_USER_TEXT_PA086      0x107b560000
#define MY_USER_TEXT_VA087      0x7a570000
#define MY_USER_TEXT_RA087      0x7b570000
#define MY_USER_TEXT_PA087      0x107b570000
#define MY_USER_TEXT_VA088      0x7a580000
#define MY_USER_TEXT_RA088      0x7b580000
#define MY_USER_TEXT_PA088      0x107b580000
#define MY_USER_TEXT_VA089      0x7a590000
#define MY_USER_TEXT_RA089      0x7b590000
#define MY_USER_TEXT_PA089      0x107b590000
#define MY_USER_TEXT_VA090      0x7a5a0000
#define MY_USER_TEXT_RA090      0x7b5a0000
#define MY_USER_TEXT_PA090      0x107b5a0000
#define MY_USER_TEXT_VA091      0x7a5b0000
#define MY_USER_TEXT_RA091      0x7b5b0000
#define MY_USER_TEXT_PA091      0x107b5b0000
#define MY_USER_TEXT_VA092      0x7a5c0000
#define MY_USER_TEXT_RA092      0x7b5c0000
#define MY_USER_TEXT_PA092      0x107b5c0000
#define MY_USER_TEXT_VA093      0x7a5d0000
#define MY_USER_TEXT_RA093      0x7b5d0000
#define MY_USER_TEXT_PA093      0x107b5d0000
#define MY_USER_TEXT_VA094      0x7a5e0000
#define MY_USER_TEXT_RA094      0x7b5e0000
#define MY_USER_TEXT_PA094      0x107b5e0000
#define MY_USER_TEXT_VA095      0x7a5f0000
#define MY_USER_TEXT_RA095      0x7b5f0000
#define MY_USER_TEXT_PA095      0x107b5f0000
#define MY_USER_TEXT_VA096      0x7a600000
#define MY_USER_TEXT_RA096      0x7b600000
#define MY_USER_TEXT_PA096      0x107b600000
#define MY_USER_TEXT_VA097      0x7a610000
#define MY_USER_TEXT_RA097      0x7b610000
#define MY_USER_TEXT_PA097      0x107b610000
#define MY_USER_TEXT_VA098      0x7a620000
#define MY_USER_TEXT_RA098      0x7b620000
#define MY_USER_TEXT_PA098      0x107b620000
#define MY_USER_TEXT_VA099      0x7a630000
#define MY_USER_TEXT_RA099      0x7b630000
#define MY_USER_TEXT_PA099      0x107b630000
#define MY_USER_TEXT_VA100      0x7a640000
#define MY_USER_TEXT_RA100      0x7b640000
#define MY_USER_TEXT_PA100      0x107b640000
#define MY_USER_TEXT_VA101      0x7a650000
#define MY_USER_TEXT_RA101      0x7b650000
#define MY_USER_TEXT_PA101      0x107b650000
#define MY_USER_TEXT_VA102      0x7a660000
#define MY_USER_TEXT_RA102      0x7b660000
#define MY_USER_TEXT_PA102      0x107b660000
#define MY_USER_TEXT_VA103      0x7a670000
#define MY_USER_TEXT_RA103      0x7b670000
#define MY_USER_TEXT_PA103      0x107b670000
#define MY_USER_TEXT_VA104      0x7a680000
#define MY_USER_TEXT_RA104      0x7b680000
#define MY_USER_TEXT_PA104      0x107b680000
#define MY_USER_TEXT_VA105      0x7a690000
#define MY_USER_TEXT_RA105      0x7b690000
#define MY_USER_TEXT_PA105      0x107b690000
#define MY_USER_TEXT_VA106      0x7a6a0000
#define MY_USER_TEXT_RA106      0x7b6a0000
#define MY_USER_TEXT_PA106      0x107b6a0000
#define MY_USER_TEXT_VA107      0x7a6b0000
#define MY_USER_TEXT_RA107      0x7b6b0000
#define MY_USER_TEXT_PA107      0x107b6b0000
#define MY_USER_TEXT_VA108      0x7a6c0000
#define MY_USER_TEXT_RA108      0x7b6c0000
#define MY_USER_TEXT_PA108      0x107b6c0000
#define MY_USER_TEXT_VA109      0x7a6d0000
#define MY_USER_TEXT_RA109      0x7b6d0000
#define MY_USER_TEXT_PA109      0x107b6d0000
#define MY_USER_TEXT_VA110      0x7a6e0000
#define MY_USER_TEXT_RA110      0x7b6e0000
#define MY_USER_TEXT_PA110      0x107b6e0000
#define MY_USER_TEXT_VA111      0x7a6f0000
#define MY_USER_TEXT_RA111      0x7b6f0000
#define MY_USER_TEXT_PA111      0x107b6f0000
#define MY_USER_TEXT_VA112      0x7a700000
#define MY_USER_TEXT_RA112      0x7b700000
#define MY_USER_TEXT_PA112      0x107b700000
#define MY_USER_TEXT_VA113      0x7a710000
#define MY_USER_TEXT_RA113      0x7b710000
#define MY_USER_TEXT_PA113      0x107b710000
#define MY_USER_TEXT_VA114      0x7a720000
#define MY_USER_TEXT_RA114      0x7b720000
#define MY_USER_TEXT_PA114      0x107b720000
#define MY_USER_TEXT_VA115      0x7a730000
#define MY_USER_TEXT_RA115      0x7b730000
#define MY_USER_TEXT_PA115      0x107b730000
#define MY_USER_TEXT_VA116      0x7a740000
#define MY_USER_TEXT_RA116      0x7b740000
#define MY_USER_TEXT_PA116      0x107b740000
#define MY_USER_TEXT_VA117      0x7a750000
#define MY_USER_TEXT_RA117      0x7b750000
#define MY_USER_TEXT_PA117      0x107b750000
#define MY_USER_TEXT_VA118      0x7a760000
#define MY_USER_TEXT_RA118      0x7b760000
#define MY_USER_TEXT_PA118      0x107b760000
#define MY_USER_TEXT_VA119      0x7a770000
#define MY_USER_TEXT_RA119      0x7b770000
#define MY_USER_TEXT_PA119      0x107b770000
#define MY_USER_TEXT_VA120      0x7a780000
#define MY_USER_TEXT_RA120      0x7b780000
#define MY_USER_TEXT_PA120      0x107b780000
#define MY_USER_TEXT_VA121      0x7a790000
#define MY_USER_TEXT_RA121      0x7b790000
#define MY_USER_TEXT_PA121      0x107b790000
#define MY_USER_TEXT_VA122      0x7a7a0000
#define MY_USER_TEXT_RA122      0x7b7a0000
#define MY_USER_TEXT_PA122      0x107b7a0000
#define MY_USER_TEXT_VA123      0x7a7b0000
#define MY_USER_TEXT_RA123      0x7b7b0000
#define MY_USER_TEXT_PA123      0x107b7b0000
#define MY_USER_TEXT_VA124      0x7a7c0000
#define MY_USER_TEXT_RA124      0x7b7c0000
#define MY_USER_TEXT_PA124      0x107b7c0000
#define MY_USER_TEXT_VA125      0x7a7d0000
#define MY_USER_TEXT_RA125      0x7b7d0000
#define MY_USER_TEXT_PA125      0x107b7d0000
#define MY_USER_TEXT_VA126      0x7a7e0000
#define MY_USER_TEXT_RA126      0x7b7e0000
#define MY_USER_TEXT_PA126      0x107b7e0000
#define MY_USER_TEXT_VA127      0x7a7f0000
#define MY_USER_TEXT_RA127      0x7b7f0000
#define MY_USER_TEXT_PA127      0x107b7f0000
#define MY_USER_DATA_VA000      0x6a000000
#define MY_USER_DATA_RA000      0x6b000000
#define MY_USER_DATA_PA000      0x106b000000
#define MY_USER_DATA_VA001      0x6a010000
#define MY_USER_DATA_RA001      0x6b010000
#define MY_USER_DATA_PA001      0x106b010000
#define MY_USER_DATA_VA002      0x6a020000
#define MY_USER_DATA_RA002      0x6b020000
#define MY_USER_DATA_PA002      0x106b020000
#define MY_USER_DATA_VA003      0x6a030000
#define MY_USER_DATA_RA003      0x6b030000
#define MY_USER_DATA_PA003      0x106b030000
#define MY_USER_DATA_VA004      0x6a040000
#define MY_USER_DATA_RA004      0x6b040000
#define MY_USER_DATA_PA004      0x106b040000
#define MY_USER_DATA_VA005      0x6a050000
#define MY_USER_DATA_RA005      0x6b050000
#define MY_USER_DATA_PA005      0x106b050000
#define MY_USER_DATA_VA006      0x6a060000
#define MY_USER_DATA_RA006      0x6b060000
#define MY_USER_DATA_PA006      0x106b060000
#define MY_USER_DATA_VA007      0x6a070000
#define MY_USER_DATA_RA007      0x6b070000
#define MY_USER_DATA_PA007      0x106b070000
#define MY_USER_DATA_VA008      0x6a080000
#define MY_USER_DATA_RA008      0x6b080000
#define MY_USER_DATA_PA008      0x106b080000
#define MY_USER_DATA_VA009      0x6a090000
#define MY_USER_DATA_RA009      0x6b090000
#define MY_USER_DATA_PA009      0x106b090000
#define MY_USER_DATA_VA010      0x6a0a0000
#define MY_USER_DATA_RA010      0x6b0a0000
#define MY_USER_DATA_PA010      0x106b0a0000
#define MY_USER_DATA_VA011      0x6a0b0000
#define MY_USER_DATA_RA011      0x6b0b0000
#define MY_USER_DATA_PA011      0x106b0b0000
#define MY_USER_DATA_VA012      0x6a0c0000
#define MY_USER_DATA_RA012      0x6b0c0000
#define MY_USER_DATA_PA012      0x106b0c0000
#define MY_USER_DATA_VA013      0x6a0d0000
#define MY_USER_DATA_RA013      0x6b0d0000
#define MY_USER_DATA_PA013      0x106b0d0000
#define MY_USER_DATA_VA014      0x6a0e0000
#define MY_USER_DATA_RA014      0x6b0e0000
#define MY_USER_DATA_PA014      0x106b0e0000
#define MY_USER_DATA_VA015      0x6a0f0000
#define MY_USER_DATA_RA015      0x6b0f0000
#define MY_USER_DATA_PA015      0x106b0f0000
#define MY_USER_DATA_VA016      0x6a100000
#define MY_USER_DATA_RA016      0x6b100000
#define MY_USER_DATA_PA016      0x106b100000
#define MY_USER_DATA_VA017      0x6a110000
#define MY_USER_DATA_RA017      0x6b110000
#define MY_USER_DATA_PA017      0x106b110000
#define MY_USER_DATA_VA018      0x6a120000
#define MY_USER_DATA_RA018      0x6b120000
#define MY_USER_DATA_PA018      0x106b120000
#define MY_USER_DATA_VA019      0x6a130000
#define MY_USER_DATA_RA019      0x6b130000
#define MY_USER_DATA_PA019      0x106b130000
#define MY_USER_DATA_VA020      0x6a140000
#define MY_USER_DATA_RA020      0x6b140000
#define MY_USER_DATA_PA020      0x106b140000
#define MY_USER_DATA_VA021      0x6a150000
#define MY_USER_DATA_RA021      0x6b150000
#define MY_USER_DATA_PA021      0x106b150000
#define MY_USER_DATA_VA022      0x6a160000
#define MY_USER_DATA_RA022      0x6b160000
#define MY_USER_DATA_PA022      0x106b160000
#define MY_USER_DATA_VA023      0x6a170000
#define MY_USER_DATA_RA023      0x6b170000
#define MY_USER_DATA_PA023      0x106b170000
#define MY_USER_DATA_VA024      0x6a180000
#define MY_USER_DATA_RA024      0x6b180000
#define MY_USER_DATA_PA024      0x106b180000
#define MY_USER_DATA_VA025      0x6a190000
#define MY_USER_DATA_RA025      0x6b190000
#define MY_USER_DATA_PA025      0x106b190000
#define MY_USER_DATA_VA026      0x6a1a0000
#define MY_USER_DATA_RA026      0x6b1a0000
#define MY_USER_DATA_PA026      0x106b1a0000
#define MY_USER_DATA_VA027      0x6a1b0000
#define MY_USER_DATA_RA027      0x6b1b0000
#define MY_USER_DATA_PA027      0x106b1b0000
#define MY_USER_DATA_VA028      0x6a1c0000
#define MY_USER_DATA_RA028      0x6b1c0000
#define MY_USER_DATA_PA028      0x106b1c0000
#define MY_USER_DATA_VA029      0x6a1d0000
#define MY_USER_DATA_RA029      0x6b1d0000
#define MY_USER_DATA_PA029      0x106b1d0000
#define MY_USER_DATA_VA030      0x6a1e0000
#define MY_USER_DATA_RA030      0x6b1e0000
#define MY_USER_DATA_PA030      0x106b1e0000
#define MY_USER_DATA_VA031      0x6a1f0000
#define MY_USER_DATA_RA031      0x6b1f0000
#define MY_USER_DATA_PA031      0x106b1f0000
#define MY_USER_DATA_VA032      0x6a200000
#define MY_USER_DATA_RA032      0x6b200000
#define MY_USER_DATA_PA032      0x106b200000
#define MY_USER_DATA_VA033      0x6a210000
#define MY_USER_DATA_RA033      0x6b210000
#define MY_USER_DATA_PA033      0x106b210000
#define MY_USER_DATA_VA034      0x6a220000
#define MY_USER_DATA_RA034      0x6b220000
#define MY_USER_DATA_PA034      0x106b220000
#define MY_USER_DATA_VA035      0x6a230000
#define MY_USER_DATA_RA035      0x6b230000
#define MY_USER_DATA_PA035      0x106b230000
#define MY_USER_DATA_VA036      0x6a240000
#define MY_USER_DATA_RA036      0x6b240000
#define MY_USER_DATA_PA036      0x106b240000
#define MY_USER_DATA_VA037      0x6a250000
#define MY_USER_DATA_RA037      0x6b250000
#define MY_USER_DATA_PA037      0x106b250000
#define MY_USER_DATA_VA038      0x6a260000
#define MY_USER_DATA_RA038      0x6b260000
#define MY_USER_DATA_PA038      0x106b260000
#define MY_USER_DATA_VA039      0x6a270000
#define MY_USER_DATA_RA039      0x6b270000
#define MY_USER_DATA_PA039      0x106b270000
#define MY_USER_DATA_VA040      0x6a280000
#define MY_USER_DATA_RA040      0x6b280000
#define MY_USER_DATA_PA040      0x106b280000
#define MY_USER_DATA_VA041      0x6a290000
#define MY_USER_DATA_RA041      0x6b290000
#define MY_USER_DATA_PA041      0x106b290000
#define MY_USER_DATA_VA042      0x6a2a0000
#define MY_USER_DATA_RA042      0x6b2a0000
#define MY_USER_DATA_PA042      0x106b2a0000
#define MY_USER_DATA_VA043      0x6a2b0000
#define MY_USER_DATA_RA043      0x6b2b0000
#define MY_USER_DATA_PA043      0x106b2b0000
#define MY_USER_DATA_VA044      0x6a2c0000
#define MY_USER_DATA_RA044      0x6b2c0000
#define MY_USER_DATA_PA044      0x106b2c0000
#define MY_USER_DATA_VA045      0x6a2d0000
#define MY_USER_DATA_RA045      0x6b2d0000
#define MY_USER_DATA_PA045      0x106b2d0000
#define MY_USER_DATA_VA046      0x6a2e0000
#define MY_USER_DATA_RA046      0x6b2e0000
#define MY_USER_DATA_PA046      0x106b2e0000
#define MY_USER_DATA_VA047      0x6a2f0000
#define MY_USER_DATA_RA047      0x6b2f0000
#define MY_USER_DATA_PA047      0x106b2f0000
#define MY_USER_DATA_VA048      0x6a300000
#define MY_USER_DATA_RA048      0x6b300000
#define MY_USER_DATA_PA048      0x106b300000
#define MY_USER_DATA_VA049      0x6a310000
#define MY_USER_DATA_RA049      0x6b310000
#define MY_USER_DATA_PA049      0x106b310000
#define MY_USER_DATA_VA050      0x6a320000
#define MY_USER_DATA_RA050      0x6b320000
#define MY_USER_DATA_PA050      0x106b320000
#define MY_USER_DATA_VA051      0x6a330000
#define MY_USER_DATA_RA051      0x6b330000
#define MY_USER_DATA_PA051      0x106b330000
#define MY_USER_DATA_VA052      0x6a340000
#define MY_USER_DATA_RA052      0x6b340000
#define MY_USER_DATA_PA052      0x106b340000
#define MY_USER_DATA_VA053      0x6a350000
#define MY_USER_DATA_RA053      0x6b350000
#define MY_USER_DATA_PA053      0x106b350000
#define MY_USER_DATA_VA054      0x6a360000
#define MY_USER_DATA_RA054      0x6b360000
#define MY_USER_DATA_PA054      0x106b360000
#define MY_USER_DATA_VA055      0x6a370000
#define MY_USER_DATA_RA055      0x6b370000
#define MY_USER_DATA_PA055      0x106b370000
#define MY_USER_DATA_VA056      0x6a380000
#define MY_USER_DATA_RA056      0x6b380000
#define MY_USER_DATA_PA056      0x106b380000
#define MY_USER_DATA_VA057      0x6a390000
#define MY_USER_DATA_RA057      0x6b390000
#define MY_USER_DATA_PA057      0x106b390000
#define MY_USER_DATA_VA058      0x6a3a0000
#define MY_USER_DATA_RA058      0x6b3a0000
#define MY_USER_DATA_PA058      0x106b3a0000
#define MY_USER_DATA_VA059      0x6a3b0000
#define MY_USER_DATA_RA059      0x6b3b0000
#define MY_USER_DATA_PA059      0x106b3b0000
#define MY_USER_DATA_VA060      0x6a3c0000
#define MY_USER_DATA_RA060      0x6b3c0000
#define MY_USER_DATA_PA060      0x106b3c0000
#define MY_USER_DATA_VA061      0x6a3d0000
#define MY_USER_DATA_RA061      0x6b3d0000
#define MY_USER_DATA_PA061      0x106b3d0000
#define MY_USER_DATA_VA062      0x6a3e0000
#define MY_USER_DATA_RA062      0x6b3e0000
#define MY_USER_DATA_PA062      0x106b3e0000
#define MY_USER_DATA_VA063      0x6a3f0000
#define MY_USER_DATA_RA063      0x6b3f0000
#define MY_USER_DATA_PA063      0x106b3f0000
#define MY_USER_DATA_VA064      0x6a400000
#define MY_USER_DATA_RA064      0x6b400000
#define MY_USER_DATA_PA064      0x106b400000
#define MY_USER_DATA_VA065      0x6a410000
#define MY_USER_DATA_RA065      0x6b410000
#define MY_USER_DATA_PA065      0x106b410000
#define MY_USER_DATA_VA066      0x6a420000
#define MY_USER_DATA_RA066      0x6b420000
#define MY_USER_DATA_PA066      0x106b420000
#define MY_USER_DATA_VA067      0x6a430000
#define MY_USER_DATA_RA067      0x6b430000
#define MY_USER_DATA_PA067      0x106b430000
#define MY_USER_DATA_VA068      0x6a440000
#define MY_USER_DATA_RA068      0x6b440000
#define MY_USER_DATA_PA068      0x106b440000
#define MY_USER_DATA_VA069      0x6a450000
#define MY_USER_DATA_RA069      0x6b450000
#define MY_USER_DATA_PA069      0x106b450000
#define MY_USER_DATA_VA070      0x6a460000
#define MY_USER_DATA_RA070      0x6b460000
#define MY_USER_DATA_PA070      0x106b460000
#define MY_USER_DATA_VA071      0x6a470000
#define MY_USER_DATA_RA071      0x6b470000
#define MY_USER_DATA_PA071      0x106b470000
#define MY_USER_DATA_VA072      0x6a480000
#define MY_USER_DATA_RA072      0x6b480000
#define MY_USER_DATA_PA072      0x106b480000
#define MY_USER_DATA_VA073      0x6a490000
#define MY_USER_DATA_RA073      0x6b490000
#define MY_USER_DATA_PA073      0x106b490000
#define MY_USER_DATA_VA074      0x6a4a0000
#define MY_USER_DATA_RA074      0x6b4a0000
#define MY_USER_DATA_PA074      0x106b4a0000
#define MY_USER_DATA_VA075      0x6a4b0000
#define MY_USER_DATA_RA075      0x6b4b0000
#define MY_USER_DATA_PA075      0x106b4b0000
#define MY_USER_DATA_VA076      0x6a4c0000
#define MY_USER_DATA_RA076      0x6b4c0000
#define MY_USER_DATA_PA076      0x106b4c0000
#define MY_USER_DATA_VA077      0x6a4d0000
#define MY_USER_DATA_RA077      0x6b4d0000
#define MY_USER_DATA_PA077      0x106b4d0000
#define MY_USER_DATA_VA078      0x6a4e0000
#define MY_USER_DATA_RA078      0x6b4e0000
#define MY_USER_DATA_PA078      0x106b4e0000
#define MY_USER_DATA_VA079      0x6a4f0000
#define MY_USER_DATA_RA079      0x6b4f0000
#define MY_USER_DATA_PA079      0x106b4f0000
#define MY_USER_DATA_VA080      0x6a500000
#define MY_USER_DATA_RA080      0x6b500000
#define MY_USER_DATA_PA080      0x106b500000
#define MY_USER_DATA_VA081      0x6a510000
#define MY_USER_DATA_RA081      0x6b510000
#define MY_USER_DATA_PA081      0x106b510000
#define MY_USER_DATA_VA082      0x6a520000
#define MY_USER_DATA_RA082      0x6b520000
#define MY_USER_DATA_PA082      0x106b520000
#define MY_USER_DATA_VA083      0x6a530000
#define MY_USER_DATA_RA083      0x6b530000
#define MY_USER_DATA_PA083      0x106b530000
#define MY_USER_DATA_VA084      0x6a540000
#define MY_USER_DATA_RA084      0x6b540000
#define MY_USER_DATA_PA084      0x106b540000
#define MY_USER_DATA_VA085      0x6a550000
#define MY_USER_DATA_RA085      0x6b550000
#define MY_USER_DATA_PA085      0x106b550000
#define MY_USER_DATA_VA086      0x6a560000
#define MY_USER_DATA_RA086      0x6b560000
#define MY_USER_DATA_PA086      0x106b560000
#define MY_USER_DATA_VA087      0x6a570000
#define MY_USER_DATA_RA087      0x6b570000
#define MY_USER_DATA_PA087      0x106b570000
#define MY_USER_DATA_VA088      0x6a580000
#define MY_USER_DATA_RA088      0x6b580000
#define MY_USER_DATA_PA088      0x106b580000
#define MY_USER_DATA_VA089      0x6a590000
#define MY_USER_DATA_RA089      0x6b590000
#define MY_USER_DATA_PA089      0x106b590000
#define MY_USER_DATA_VA090      0x6a5a0000
#define MY_USER_DATA_RA090      0x6b5a0000
#define MY_USER_DATA_PA090      0x106b5a0000
#define MY_USER_DATA_VA091      0x6a5b0000
#define MY_USER_DATA_RA091      0x6b5b0000
#define MY_USER_DATA_PA091      0x106b5b0000
#define MY_USER_DATA_VA092      0x6a5c0000
#define MY_USER_DATA_RA092      0x6b5c0000
#define MY_USER_DATA_PA092      0x106b5c0000
#define MY_USER_DATA_VA093      0x6a5d0000
#define MY_USER_DATA_RA093      0x6b5d0000
#define MY_USER_DATA_PA093      0x106b5d0000
#define MY_USER_DATA_VA094      0x6a5e0000
#define MY_USER_DATA_RA094      0x6b5e0000
#define MY_USER_DATA_PA094      0x106b5e0000
#define MY_USER_DATA_VA095      0x6a5f0000
#define MY_USER_DATA_RA095      0x6b5f0000
#define MY_USER_DATA_PA095      0x106b5f0000
#define MY_USER_DATA_VA096      0x6a600000
#define MY_USER_DATA_RA096      0x6b600000
#define MY_USER_DATA_PA096      0x106b600000
#define MY_USER_DATA_VA097      0x6a610000
#define MY_USER_DATA_RA097      0x6b610000
#define MY_USER_DATA_PA097      0x106b610000
#define MY_USER_DATA_VA098      0x6a620000
#define MY_USER_DATA_RA098      0x6b620000
#define MY_USER_DATA_PA098      0x106b620000
#define MY_USER_DATA_VA099      0x6a630000
#define MY_USER_DATA_RA099      0x6b630000
#define MY_USER_DATA_PA099      0x106b630000
#define MY_USER_DATA_VA100      0x6a640000
#define MY_USER_DATA_RA100      0x6b640000
#define MY_USER_DATA_PA100      0x106b640000
#define MY_USER_DATA_VA101      0x6a650000
#define MY_USER_DATA_RA101      0x6b650000
#define MY_USER_DATA_PA101      0x106b650000
#define MY_USER_DATA_VA102      0x6a660000
#define MY_USER_DATA_RA102      0x6b660000
#define MY_USER_DATA_PA102      0x106b660000
#define MY_USER_DATA_VA103      0x6a670000
#define MY_USER_DATA_RA103      0x6b670000
#define MY_USER_DATA_PA103      0x106b670000
#define MY_USER_DATA_VA104      0x6a680000
#define MY_USER_DATA_RA104      0x6b680000
#define MY_USER_DATA_PA104      0x106b680000
#define MY_USER_DATA_VA105      0x6a690000
#define MY_USER_DATA_RA105      0x6b690000
#define MY_USER_DATA_PA105      0x106b690000
#define MY_USER_DATA_VA106      0x6a6a0000
#define MY_USER_DATA_RA106      0x6b6a0000
#define MY_USER_DATA_PA106      0x106b6a0000
#define MY_USER_DATA_VA107      0x6a6b0000
#define MY_USER_DATA_RA107      0x6b6b0000
#define MY_USER_DATA_PA107      0x106b6b0000
#define MY_USER_DATA_VA108      0x6a6c0000
#define MY_USER_DATA_RA108      0x6b6c0000
#define MY_USER_DATA_PA108      0x106b6c0000
#define MY_USER_DATA_VA109      0x6a6d0000
#define MY_USER_DATA_RA109      0x6b6d0000
#define MY_USER_DATA_PA109      0x106b6d0000
#define MY_USER_DATA_VA110      0x6a6e0000
#define MY_USER_DATA_RA110      0x6b6e0000
#define MY_USER_DATA_PA110      0x106b6e0000
#define MY_USER_DATA_VA111      0x6a6f0000
#define MY_USER_DATA_RA111      0x6b6f0000
#define MY_USER_DATA_PA111      0x106b6f0000
#define MY_USER_DATA_VA112      0x6a700000
#define MY_USER_DATA_RA112      0x6b700000
#define MY_USER_DATA_PA112      0x106b700000
#define MY_USER_DATA_VA113      0x6a710000
#define MY_USER_DATA_RA113      0x6b710000
#define MY_USER_DATA_PA113      0x106b710000
#define MY_USER_DATA_VA114      0x6a720000
#define MY_USER_DATA_RA114      0x6b720000
#define MY_USER_DATA_PA114      0x106b720000
#define MY_USER_DATA_VA115      0x6a730000
#define MY_USER_DATA_RA115      0x6b730000
#define MY_USER_DATA_PA115      0x106b730000
#define MY_USER_DATA_VA116      0x6a740000
#define MY_USER_DATA_RA116      0x6b740000
#define MY_USER_DATA_PA116      0x106b740000
#define MY_USER_DATA_VA117      0x6a750000
#define MY_USER_DATA_RA117      0x6b750000
#define MY_USER_DATA_PA117      0x106b750000
#define MY_USER_DATA_VA118      0x6a760000
#define MY_USER_DATA_RA118      0x6b760000
#define MY_USER_DATA_PA118      0x106b760000
#define MY_USER_DATA_VA119      0x6a770000
#define MY_USER_DATA_RA119      0x6b770000
#define MY_USER_DATA_PA119      0x106b770000
#define MY_USER_DATA_VA120      0x6a780000
#define MY_USER_DATA_RA120      0x6b780000
#define MY_USER_DATA_PA120      0x106b780000
#define MY_USER_DATA_VA121      0x6a790000
#define MY_USER_DATA_RA121      0x6b790000
#define MY_USER_DATA_PA121      0x106b790000
#define MY_USER_DATA_VA122      0x6a7a0000
#define MY_USER_DATA_RA122      0x6b7a0000
#define MY_USER_DATA_PA122      0x106b7a0000
#define MY_USER_DATA_VA123      0x6a7b0000
#define MY_USER_DATA_RA123      0x6b7b0000
#define MY_USER_DATA_PA123      0x106b7b0000
#define MY_USER_DATA_VA124      0x6a7c0000
#define MY_USER_DATA_RA124      0x6b7c0000
#define MY_USER_DATA_PA124      0x106b7c0000
#define MY_USER_DATA_VA125      0x6a7d0000
#define MY_USER_DATA_RA125      0x6b7d0000
#define MY_USER_DATA_PA125      0x106b7d0000
#define MY_USER_DATA_VA126      0x6a7e0000
#define MY_USER_DATA_RA126      0x6b7e0000
#define MY_USER_DATA_PA126      0x106b7e0000
#define MY_USER_DATA_VA127      0x6a7f0000
#define MY_USER_DATA_RA127      0x6b7f0000
#define MY_USER_DATA_PA127      0x106b7f0000

!!! Custom trap handler
#define H_HT0_Instruction_Access_MMU_Miss_0x09
#define My_HT0_Instruction_Access_MMU_Miss_0x09       \
        setx My_HP_Code_Begin, %l1, %l2         ; \
        jmp %l2                 ; \
        nop                     ;

#define H_HT0_Data_Access_MMU_Miss
#define My_HT0_Data_Access_MMU_Miss_0x31	\
	setx My_HP_Code_Begin, %l1, %l2		; \
	jmp %l2			; \
	nop			; 

#define H_HT0_fast_instr_access_MMU_miss
#define SUN_H_HT0_fast_instr_access_MMU_miss	\
	rdpr %tpc, %l2		; \
	set  0x007a, %l0	; \
	srlx %l2, 24, %l2	; \
	sub  %l2, %l0, %l2	; \
	brnz %l2, boot_handler_0x64 ; \
	setx my_handler_0x64, %l1, %l2		; \
	jmp %l2			; \
	nop			; \
boot_handler_0x64:		; \
	ba  immu_miss_handler	; \
	nop			;
	
#define H_HT0_fast_data_access_MMU_miss
#define SUN_H_HT0_fast_data_access_MMU_miss	\
	rdpr %tpc, %l2		; \
	set  0x007a, %l0	; \
	srlx %l2, 24, %l2	; \
	sub  %l2, %l0, %l2	; \
	brnz %l2, boot_handler ; \
	setx My_HP_Code_Begin, %l1, %l2		; \
	jmp %l2			; \
	nop			; \
boot_handler:			; \
	ba   dmmu_miss_handler	; \
	nop			; 

#include "hboot.s"

/************************************************************************
   Test case:	DTLB misses, multi-thread
 ************************************************************************/

.text
.global main

main:		/* test begin */

	th_fork(begin_thread)

	EXIT_BAD

begin_thread_0:
	setx user_code_begin_000, %l1, %l4
	jmp  %l4
	nop
	EXIT_BAD

begin_thread_1:
	setx user_code_begin_005, %l1, %l4
	jmp  %l4
	nop
	EXIT_BAD

begin_thread_2:
	setx user_code_begin_010, %l1, %l4
	jmp  %l4
	nop
	EXIT_BAD

begin_thread_3:
	setx user_code_begin_015, %l1, %l4
	jmp  %l4
	nop
	EXIT_BAD

begin_thread_4:
	setx user_code_begin_020, %l1, %l4
	jmp  %l4
	nop
	EXIT_BAD

begin_thread_5:
	setx user_code_begin_025, %l1, %l4
	jmp  %l4
	nop
	EXIT_BAD

begin_thread_6:
	setx user_code_begin_030, %l1, %l4
	jmp  %l4
	nop
	EXIT_BAD

begin_thread_7:
	setx user_code_begin_035, %l1, %l4
	jmp  %l4
	nop
	EXIT_BAD

/************************************************************************
   Test case data start
 ************************************************************************/
.data

user_data_start:
.word 0xD6B3479D
.word 0xDB28926C

!#***********************************************************************
SECTION .My_HP_Section TEXT_VA=MY_HP_TEXT_PA, DATA_VA=MY_HP_DATA_PA
!#SECTION .My_HP_Section TEXT_VA=MY_HP_TEXT_PA
attr_text {
        Name = .My_HP_Section,
        hypervisor
        }
.text
.global My_HP_Code_Begin
.global my_handler_0x64
	
	!# Registers changed:	g1, g2, g3, g4, l1, l2
My_HP_Code_Begin:
	set  8, %l1
	!# Context value in g1
	ldxa [%g0 + %l1] ASI_PRIMARY_CONTEXT_0, %g1
	
	!# PA in g2
	rdpr %tpc, %g2
	setx 0x10000000, %l1, %l2
	sub  %g2, %l2, %g2
	setx 0x1000010000, %l1, %l2
	add  %g2, %l2, %g2
	setx 0x0ffffffffe000, %l1, %g3
	and  %g3, %g2, %g3

	!# TTE_DATA in g2
	setx 0x8000000000000441, %l1, %g2
	add  %g2, %g3, %g2

	!# Write TTE_DATA in DATA_IN
	set  0x000, %g4
	stxa %g2, [%g4] ASI_DTLB_DATA_IN_REG

	retry
	nop
        EXIT_BAD

my_handler_0x64:
	set  8, %l1
	!# Context value in g1
	ldxa [%g0 + %l1] ASI_PRIMARY_CONTEXT_0, %g1
	
	!# PA in g2
	rdpr %tpc, %g2
	setx 0x1001000000, %l1, %l2
	add  %g2, %l2, %g2
	setx 0x0ffffffffe000, %l1, %g3
	and  %g3, %g2, %g3

	!# TTE_DATA in g2
	setx 0x8000000000000480, %l1, %g2
	add  %g2, %g3, %g2

	!# Write TTE_DATA in DATA_IN
	set  0x000, %g4
	stxa %g2, [%g4] ASI_ITLB_DATA_IN_REG

	retry
	nop

attr_data {
        Name = .My_HP_Section,
        hypervisor
	}
.data	
.global Initial_ptr_value
Initial_ptr_value:
	.word  0x2000
	
SECTION .My_User_Section_4v000 TEXT_VA=MY_USER_TEXT_VA000, DATA_VA=MY_USER_DATA_VA000
attr_text {
	Name = .My_User_Section_4v000,
	part_0_ctx_nonzero_tsb_config_2,
	VA = MY_USER_TEXT_VA000,
	RA = MY_USER_TEXT_PA000,
	PA = MY_USER_TEXT_PA000,
	TTE_Context = PCONTEXT,
	TTE_V       = 1,
	TTE_NFO     = 0,
	TTE_L       = 0,
	TTE_Soft    = 0,
	TTE_IE      = 0,
	TTE_E       = 0,
	TTE_CP      = 1,
	TTE_CV      = 0,
	TTE_P       = 0,
	TTE_EP      = 1,
	TTE_W       = 0,
	TTE_SW1     = 0,
	TTE_SW0     = 0,
	TTE_RSVD1   = 0,
	TTE_Size    = 0,
	}
.text
.global user_code_begin_000
user_code_begin_000:
	setx user_data_begin_001, %l1, %l3
	lduw [%l3], %l1
	setx user_code_begin_001, %l1, %l4
	stuw %l4, [%l3]
	jmp  %l4
	nop
	EXIT_BAD


attr_data {
	Name = .My_User_Section_4v000,
	notsb,
	VA = MY_USER_DATA_VA000,
	RA = MY_USER_DATA_PA000,
	PA = MY_USER_DATA_PA000,
	TTE_Context = PCONTEXT,
	TTE_V       = 1,
	TTE_NFO     = 0,
	TTE_L       = 0,
	TTE_Soft    = 0,
	TTE_IE      = 0,
	TTE_E       = 0,
	TTE_CP      = 1,
	TTE_CV      = 0,
	TTE_P       = 0,
	TTE_EP      = 0,
	TTE_W       = 1,
	TTE_SW1     = 0,
	TTE_SW0     = 0,
	TTE_RSVD1   = 0,
	TTE_Size    = 1,
	}
.data
.global user_data_begin_000
user_data_begin_000:
	.word 0x6c7e
	.word 0x2fbf
	.word 0x2c83
	.word 0x11ab0


SECTION .My_User_Section_4v001 TEXT_VA=MY_USER_TEXT_VA001, DATA_VA=MY_USER_DATA_VA001
attr_text {
	Name = .My_User_Section_4v001,
	part_0_ctx_nonzero_tsb_config_2,
	VA = MY_USER_TEXT_VA001,
	RA = MY_USER_TEXT_PA001,
	PA = MY_USER_TEXT_PA001,
	TTE_Context = PCONTEXT,
	TTE_V       = 1,
	TTE_NFO     = 0,
	TTE_L       = 0,
	TTE_Soft    = 0,
	TTE_IE      = 0,
	TTE_E       = 0,
	TTE_CP      = 1,
	TTE_CV      = 0,
	TTE_P       = 0,
	TTE_EP      = 1,
	TTE_W       = 0,
	TTE_SW1     = 0,
	TTE_SW0     = 0,
	TTE_RSVD1   = 0,
	TTE_Size    = 0,
	}
.text
.global user_code_begin_001
user_code_begin_001:
	setx user_data_begin_002, %l1, %l3
	lduw [%l3], %l1
	setx user_code_begin_002, %l1, %l4
	stuw %l4, [%l3]
	jmp  %l4
	nop
	EXIT_BAD


attr_data {
	Name = .My_User_Section_4v001,
	notsb,
	VA = MY_USER_DATA_VA001,
	RA = MY_USER_DATA_PA001,
	PA = MY_USER_DATA_PA001,
	TTE_Context = PCONTEXT,
	TTE_V       = 1,
	TTE_NFO     = 0,
	TTE_L       = 0,
	TTE_Soft    = 0,
	TTE_IE      = 0,
	TTE_E       = 0,
	TTE_CP      = 1,
	TTE_CV      = 0,
	TTE_P       = 0,
	TTE_EP      = 0,
	TTE_W       = 1,
	TTE_SW1     = 0,
	TTE_SW0     = 0,
	TTE_RSVD1   = 0,
	TTE_Size    = 1,
	}
.data
.global user_data_begin_001
user_data_begin_001:
	.word 0x10731
	.word 0xd027
	.word 0x1350e
	.word 0x10e9d


SECTION .My_User_Section_4v002 TEXT_VA=MY_USER_TEXT_VA002, DATA_VA=MY_USER_DATA_VA002
attr_text {
	Name = .My_User_Section_4v002,
	part_0_ctx_nonzero_tsb_config_2,
	VA = MY_USER_TEXT_VA002,
	RA = MY_USER_TEXT_PA002,
	PA = MY_USER_TEXT_PA002,
	TTE_Context = PCONTEXT,
	TTE_V       = 1,
	TTE_NFO     = 0,
	TTE_L       = 0,
	TTE_Soft    = 0,
	TTE_IE      = 0,
	TTE_E       = 0,
	TTE_CP      = 1,
	TTE_CV      = 0,
	TTE_P       = 0,
	TTE_EP      = 1,
	TTE_W       = 0,
	TTE_SW1     = 0,
	TTE_SW0     = 0,
	TTE_RSVD1   = 0,
	TTE_Size    = 0,
	}
.text
.global user_code_begin_002
user_code_begin_002:
	setx user_data_begin_003, %l1, %l3
	lduw [%l3], %l1
	setx user_code_begin_003, %l1, %l4
	stuw %l4, [%l3]
	jmp  %l4
	nop
	EXIT_BAD


attr_data {
	Name = .My_User_Section_4v002,
	notsb,
	VA = MY_USER_DATA_VA002,
	RA = MY_USER_DATA_PA002,
	PA = MY_USER_DATA_PA002,
	TTE_Context = PCONTEXT,
	TTE_V       = 1,
	TTE_NFO     = 0,
	TTE_L       = 0,
	TTE_Soft    = 0,
	TTE_IE      = 0,
	TTE_E       = 0,
	TTE_CP      = 1,
	TTE_CV      = 0,
	TTE_P       = 0,
	TTE_EP      = 0,
	TTE_W       = 1,
	TTE_SW1     = 0,
	TTE_SW0     = 0,
	TTE_RSVD1   = 0,
	TTE_Size    = 1,
	}
.data
.global user_data_begin_002
user_data_begin_002:
	.word 0x1eb9
	.word 0x43ec
	.word 0xc619
	.word 0x11a06


SECTION .My_User_Section_4v003 TEXT_VA=MY_USER_TEXT_VA003, DATA_VA=MY_USER_DATA_VA003
attr_text {
	Name = .My_User_Section_4v003,
	part_0_ctx_nonzero_tsb_config_2,
	VA = MY_USER_TEXT_VA003,
	RA = MY_USER_TEXT_PA003,
	PA = MY_USER_TEXT_PA003,
	TTE_Context = PCONTEXT,
	TTE_V       = 1,
	TTE_NFO     = 0,
	TTE_L       = 0,
	TTE_Soft    = 0,
	TTE_IE      = 0,
	TTE_E       = 0,
	TTE_CP      = 1,
	TTE_CV      = 0,
	TTE_P       = 0,
	TTE_EP      = 1,
	TTE_W       = 0,
	TTE_SW1     = 0,
	TTE_SW0     = 0,
	TTE_RSVD1   = 0,
	TTE_Size    = 0,
	}
.text
.global user_code_begin_003
user_code_begin_003:
	setx user_data_begin_004, %l1, %l3
	lduw [%l3], %l1
	setx user_code_begin_004, %l1, %l4
	stuw %l4, [%l3]
	jmp  %l4
	nop
	EXIT_BAD


attr_data {
	Name = .My_User_Section_4v003,
	notsb,
	VA = MY_USER_DATA_VA003,
	RA = MY_USER_DATA_PA003,
	PA = MY_USER_DATA_PA003,
	TTE_Context = PCONTEXT,
	TTE_V       = 1,
	TTE_NFO     = 0,
	TTE_L       = 0,
	TTE_Soft    = 0,
	TTE_IE      = 0,
	TTE_E       = 0,
	TTE_CP      = 1,
	TTE_CV      = 0,
	TTE_P       = 0,
	TTE_EP      = 0,
	TTE_W       = 1,
	TTE_SW1     = 0,
	TTE_SW0     = 0,
	TTE_RSVD1   = 0,
	TTE_Size    = 1,
	}
.data
.global user_data_begin_003
user_data_begin_003:
	.word 0xdfaa
	.word 0x39a9
	.word 0xb967
	.word 0x280c


SECTION .My_User_Section_4v004 TEXT_VA=MY_USER_TEXT_VA004, DATA_VA=MY_USER_DATA_VA004
attr_text {
	Name = .My_User_Section_4v004,
	part_0_ctx_nonzero_tsb_config_2,
	VA = MY_USER_TEXT_VA004,
	RA = MY_USER_TEXT_PA004,
	PA = MY_USER_TEXT_PA004,
	TTE_Context = PCONTEXT,
	TTE_V       = 1,
	TTE_NFO     = 0,
	TTE_L       = 0,
	TTE_Soft    = 0,
	TTE_IE      = 0,
	TTE_E       = 0,
	TTE_CP      = 1,
	TTE_CV      = 0,
	TTE_P       = 0,
	TTE_EP      = 1,
	TTE_W       = 0,
	TTE_SW1     = 0,
	TTE_SW0     = 0,
	TTE_RSVD1   = 0,
	TTE_Size    = 0,
	}
.text
.global user_code_begin_004
user_code_begin_004:
	setx user_data_begin_005, %l1, %l3
	lduw [%l3], %l1
	setx user_code_begin_005, %l1, %l4
	stuw %l4, [%l3]
	EXIT_GOOD
	jmp  %l4
	nop
	EXIT_BAD


attr_data {
	Name = .My_User_Section_4v004,
	notsb,
	VA = MY_USER_DATA_VA004,
	RA = MY_USER_DATA_PA004,
	PA = MY_USER_DATA_PA004,
	TTE_Context = PCONTEXT,
	TTE_V       = 1,
	TTE_NFO     = 0,
	TTE_L       = 0,
	TTE_Soft    = 0,
	TTE_IE      = 0,
	TTE_E       = 0,
	TTE_CP      = 1,
	TTE_CV      = 0,
	TTE_P       = 0,
	TTE_EP      = 0,
	TTE_W       = 1,
	TTE_SW1     = 0,
	TTE_SW0     = 0,
	TTE_RSVD1   = 0,
	TTE_Size    = 1,
	}
.data
.global user_data_begin_004
user_data_begin_004:
	.word 0x4069
	.word 0x41ed
	.word 0x14c07
	.word 0x29de


SECTION .My_User_Section_4v005 TEXT_VA=MY_USER_TEXT_VA005, DATA_VA=MY_USER_DATA_VA005
attr_text {
	Name = .My_User_Section_4v005,
	part_0_ctx_nonzero_tsb_config_3,
	VA = MY_USER_TEXT_VA005,
	RA = MY_USER_TEXT_RA005,
	PA = MY_USER_TEXT_PA005,
	TTE_Context = PCONTEXT,
	TTE_V       = 1,
	TTE_NFO     = 0,
	TTE_L       = 0,
	TTE_Soft    = 0,
	TTE_IE      = 0,
	TTE_E       = 0,
	TTE_CP      = 1,
	TTE_CV      = 0,
	TTE_P       = 0,
	TTE_EP      = 1,
	TTE_W       = 0,
	TTE_SW1     = 0,
	TTE_SW0     = 0,
	TTE_RSVD1   = 0,
	TTE_Size    = 0,
	}
.text
.global user_code_begin_005
user_code_begin_005:
	setx user_data_begin_006, %l1, %l3
	lduw [%l3], %l1
	setx user_code_begin_006, %l1, %l4
	stuw %l4, [%l3]
	jmp  %l4
	nop
	EXIT_BAD


attr_data {
	Name = .My_User_Section_4v005,
	notsb,
	VA = MY_USER_DATA_VA005,
	RA = MY_USER_DATA_RA005,
	PA = MY_USER_DATA_PA005,
	TTE_Context = PCONTEXT,
	TTE_V       = 1,
	TTE_NFO     = 0,
	TTE_L       = 0,
	TTE_Soft    = 0,
	TTE_IE      = 0,
	TTE_E       = 0,
	TTE_CP      = 1,
	TTE_CV      = 0,
	TTE_P       = 0,
	TTE_EP      = 0,
	TTE_W       = 1,
	TTE_SW1     = 0,
	TTE_SW0     = 0,
	TTE_RSVD1   = 0,
	TTE_Size    = 1,
	}
.data
.global user_data_begin_005
user_data_begin_005:
	.word 0xf93b
	.word 0xe34b
	.word 0x127e6
	.word 0xd915


SECTION .My_User_Section_4v006 TEXT_VA=MY_USER_TEXT_VA006, DATA_VA=MY_USER_DATA_VA006
attr_text {
	Name = .My_User_Section_4v006,
	part_0_ctx_nonzero_tsb_config_3,
	VA = MY_USER_TEXT_VA006,
	RA = MY_USER_TEXT_RA006,
	PA = MY_USER_TEXT_PA006,
	TTE_Context = PCONTEXT,
	TTE_V       = 1,
	TTE_NFO     = 0,
	TTE_L       = 0,
	TTE_Soft    = 0,
	TTE_IE      = 0,
	TTE_E       = 0,
	TTE_CP      = 1,
	TTE_CV      = 0,
	TTE_P       = 0,
	TTE_EP      = 1,
	TTE_W       = 0,
	TTE_SW1     = 0,
	TTE_SW0     = 0,
	TTE_RSVD1   = 0,
	TTE_Size    = 0,
	}
.text
.global user_code_begin_006
user_code_begin_006:
	setx user_data_begin_007, %l1, %l3
	lduw [%l3], %l1
	setx user_code_begin_007, %l1, %l4
	stuw %l4, [%l3]
	jmp  %l4
	nop
	EXIT_BAD


attr_data {
	Name = .My_User_Section_4v006,
	notsb,
	VA = MY_USER_DATA_VA006,
	RA = MY_USER_DATA_RA006,
	PA = MY_USER_DATA_PA006,
	TTE_Context = PCONTEXT,
	TTE_V       = 1,
	TTE_NFO     = 0,
	TTE_L       = 0,
	TTE_Soft    = 0,
	TTE_IE      = 0,
	TTE_E       = 0,
	TTE_CP      = 1,
	TTE_CV      = 0,
	TTE_P       = 0,
	TTE_EP      = 0,
	TTE_W       = 1,
	TTE_SW1     = 0,
	TTE_SW0     = 0,
	TTE_RSVD1   = 0,
	TTE_Size    = 1,
	}
.data
.global user_data_begin_006
user_data_begin_006:
	.word 0x7551
	.word 0x1535d
	.word 0x59
	.word 0x72f7


SECTION .My_User_Section_4v007 TEXT_VA=MY_USER_TEXT_VA007, DATA_VA=MY_USER_DATA_VA007
attr_text {
	Name = .My_User_Section_4v007,
	part_0_ctx_nonzero_tsb_config_3,
	VA = MY_USER_TEXT_VA007,
	RA = MY_USER_TEXT_RA007,
	PA = MY_USER_TEXT_PA007,
	TTE_Context = PCONTEXT,
	TTE_V       = 1,
	TTE_NFO     = 0,
	TTE_L       = 0,
	TTE_Soft    = 0,
	TTE_IE      = 0,
	TTE_E       = 0,
	TTE_CP      = 1,
	TTE_CV      = 0,
	TTE_P       = 0,
	TTE_EP      = 1,
	TTE_W       = 0,
	TTE_SW1     = 0,
	TTE_SW0     = 0,
	TTE_RSVD1   = 0,
	TTE_Size    = 0,
	}
.text
.global user_code_begin_007
user_code_begin_007:
	setx user_data_begin_008, %l1, %l3
	lduw [%l3], %l1
	setx user_code_begin_008, %l1, %l4
	stuw %l4, [%l3]
	jmp  %l4
	nop
	EXIT_BAD


attr_data {
	Name = .My_User_Section_4v007,
	notsb,
	VA = MY_USER_DATA_VA007,
	RA = MY_USER_DATA_RA007,
	PA = MY_USER_DATA_PA007,
	TTE_Context = PCONTEXT,
	TTE_V       = 1,
	TTE_NFO     = 0,
	TTE_L       = 0,
	TTE_Soft    = 0,
	TTE_IE      = 0,
	TTE_E       = 0,
	TTE_CP      = 1,
	TTE_CV      = 0,
	TTE_P       = 0,
	TTE_EP      = 0,
	TTE_W       = 1,
	TTE_SW1     = 0,
	TTE_SW0     = 0,
	TTE_RSVD1   = 0,
	TTE_Size    = 1,
	}
.data
.global user_data_begin_007
user_data_begin_007:
	.word 0x14a3d
	.word 0x798d
	.word 0xfdd5
	.word 0x9d05


SECTION .My_User_Section_4v008 TEXT_VA=MY_USER_TEXT_VA008, DATA_VA=MY_USER_DATA_VA008
attr_text {
	Name = .My_User_Section_4v008,
	part_0_ctx_nonzero_tsb_config_3,
	VA = MY_USER_TEXT_VA008,
	RA = MY_USER_TEXT_RA008,
	PA = MY_USER_TEXT_PA008,
	TTE_Context = PCONTEXT,
	TTE_V       = 1,
	TTE_NFO     = 0,
	TTE_L       = 0,
	TTE_Soft    = 0,
	TTE_IE      = 0,
	TTE_E       = 0,
	TTE_CP      = 1,
	TTE_CV      = 0,
	TTE_P       = 0,
	TTE_EP      = 1,
	TTE_W       = 0,
	TTE_SW1     = 0,
	TTE_SW0     = 0,
	TTE_RSVD1   = 0,
	TTE_Size    = 0,
	}
.text
.global user_code_begin_008
user_code_begin_008:
	setx user_data_begin_009, %l1, %l3
	lduw [%l3], %l1
	setx user_code_begin_009, %l1, %l4
	stuw %l4, [%l3]
	jmp  %l4
	nop
	EXIT_BAD


attr_data {
	Name = .My_User_Section_4v008,
	notsb,
	VA = MY_USER_DATA_VA008,
	RA = MY_USER_DATA_RA008,
	PA = MY_USER_DATA_PA008,
	TTE_Context = PCONTEXT,
	TTE_V       = 1,
	TTE_NFO     = 0,
	TTE_L       = 0,
	TTE_Soft    = 0,
	TTE_IE      = 0,
	TTE_E       = 0,
	TTE_CP      = 1,
	TTE_CV      = 0,
	TTE_P       = 0,
	TTE_EP      = 0,
	TTE_W       = 1,
	TTE_SW1     = 0,
	TTE_SW0     = 0,
	TTE_RSVD1   = 0,
	TTE_Size    = 1,
	}
.data
.global user_data_begin_008
user_data_begin_008:
	.word 0xfd87
	.word 0x6aa3
	.word 0x4d58
	.word 0x547a


SECTION .My_User_Section_4v009 TEXT_VA=MY_USER_TEXT_VA009, DATA_VA=MY_USER_DATA_VA009
attr_text {
	Name = .My_User_Section_4v009,
	part_0_ctx_nonzero_tsb_config_3,
	VA = MY_USER_TEXT_VA009,
	RA = MY_USER_TEXT_RA009,
	PA = MY_USER_TEXT_PA009,
	TTE_Context = PCONTEXT,
	TTE_V       = 1,
	TTE_NFO     = 0,
	TTE_L       = 0,
	TTE_Soft    = 0,
	TTE_IE      = 0,
	TTE_E       = 0,
	TTE_CP      = 1,
	TTE_CV      = 0,
	TTE_P       = 0,
	TTE_EP      = 1,
	TTE_W       = 0,
	TTE_SW1     = 0,
	TTE_SW0     = 0,
	TTE_RSVD1   = 0,
	TTE_Size    = 0,
	}
.text
.global user_code_begin_009
user_code_begin_009:
	setx user_data_begin_010, %l1, %l3
	lduw [%l3], %l1
	setx user_code_begin_010, %l1, %l4
	stuw %l4, [%l3]
	EXIT_GOOD
	jmp  %l4
	nop
	EXIT_BAD


attr_data {
	Name = .My_User_Section_4v009,
	notsb,
	VA = MY_USER_DATA_VA009,
	RA = MY_USER_DATA_RA009,
	PA = MY_USER_DATA_PA009,
	TTE_Context = PCONTEXT,
	TTE_V       = 1,
	TTE_NFO     = 0,
	TTE_L       = 0,
	TTE_Soft    = 0,
	TTE_IE      = 0,
	TTE_E       = 0,
	TTE_CP      = 1,
	TTE_CV      = 0,
	TTE_P       = 0,
	TTE_EP      = 0,
	TTE_W       = 1,
	TTE_SW1     = 0,
	TTE_SW0     = 0,
	TTE_RSVD1   = 0,
	TTE_Size    = 1,
	}
.data
.global user_data_begin_009
user_data_begin_009:
	.word 0x26f5
	.word 0x14ad8
	.word 0x6417
	.word 0x17560


SECTION .My_User_Section_4v010 TEXT_VA=MY_USER_TEXT_VA010, DATA_VA=MY_USER_DATA_VA010
attr_text {
	Name = .My_User_Section_4v010,
	part_0_ctx_nonzero_tsb_config_2,
	VA = MY_USER_TEXT_VA010,
	RA = MY_USER_TEXT_PA010,
	PA = MY_USER_TEXT_PA010,
	TTE_Context = PCONTEXT,
	TTE_V       = 1,
	TTE_NFO     = 0,
	TTE_L       = 0,
	TTE_Soft    = 0,
	TTE_IE      = 0,
	TTE_E       = 0,
	TTE_CP      = 1,
	TTE_CV      = 0,
	TTE_P       = 0,
	TTE_EP      = 1,
	TTE_W       = 0,
	TTE_SW1     = 0,
	TTE_SW0     = 0,
	TTE_RSVD1   = 0,
	TTE_Size    = 0,
	}
.text
.global user_code_begin_010
user_code_begin_010:
	setx user_data_begin_011, %l1, %l3
	lduw [%l3], %l1
	setx user_code_begin_011, %l1, %l4
	stuw %l4, [%l3]
	jmp  %l4
	nop
	EXIT_BAD


attr_data {
	Name = .My_User_Section_4v010,
	notsb,
	VA = MY_USER_DATA_VA010,
	RA = MY_USER_DATA_PA010,
	PA = MY_USER_DATA_PA010,
	TTE_Context = PCONTEXT,
	TTE_V       = 1,
	TTE_NFO     = 0,
	TTE_L       = 0,
	TTE_Soft    = 0,
	TTE_IE      = 0,
	TTE_E       = 0,
	TTE_CP      = 1,
	TTE_CV      = 0,
	TTE_P       = 0,
	TTE_EP      = 0,
	TTE_W       = 1,
	TTE_SW1     = 0,
	TTE_SW0     = 0,
	TTE_RSVD1   = 0,
	TTE_Size    = 1,
	}
.data
.global user_data_begin_010
user_data_begin_010:
	.word 0xc750
	.word 0x36b
	.word 0x4f6d
	.word 0x108ec


SECTION .My_User_Section_4v011 TEXT_VA=MY_USER_TEXT_VA011, DATA_VA=MY_USER_DATA_VA011
attr_text {
	Name = .My_User_Section_4v011,
	part_0_ctx_nonzero_tsb_config_2,
	VA = MY_USER_TEXT_VA011,
	RA = MY_USER_TEXT_PA011,
	PA = MY_USER_TEXT_PA011,
	TTE_Context = PCONTEXT,
	TTE_V       = 1,
	TTE_NFO     = 0,
	TTE_L       = 0,
	TTE_Soft    = 0,
	TTE_IE      = 0,
	TTE_E       = 0,
	TTE_CP      = 1,
	TTE_CV      = 0,
	TTE_P       = 0,
	TTE_EP      = 1,
	TTE_W       = 0,
	TTE_SW1     = 0,
	TTE_SW0     = 0,
	TTE_RSVD1   = 0,
	TTE_Size    = 0,
	}
.text
.global user_code_begin_011
user_code_begin_011:
	setx user_data_begin_012, %l1, %l3
	lduw [%l3], %l1
	setx user_code_begin_012, %l1, %l4
	stuw %l4, [%l3]
	jmp  %l4
	nop
	EXIT_BAD


attr_data {
	Name = .My_User_Section_4v011,
	notsb,
	VA = MY_USER_DATA_VA011,
	RA = MY_USER_DATA_PA011,
	PA = MY_USER_DATA_PA011,
	TTE_Context = PCONTEXT,
	TTE_V       = 1,
	TTE_NFO     = 0,
	TTE_L       = 0,
	TTE_Soft    = 0,
	TTE_IE      = 0,
	TTE_E       = 0,
	TTE_CP      = 1,
	TTE_CV      = 0,
	TTE_P       = 0,
	TTE_EP      = 0,
	TTE_W       = 1,
	TTE_SW1     = 0,
	TTE_SW0     = 0,
	TTE_RSVD1   = 0,
	TTE_Size    = 1,
	}
.data
.global user_data_begin_011
user_data_begin_011:
	.word 0x1684b
	.word 0xe9eb
	.word 0x39e
	.word 0x15b8


SECTION .My_User_Section_4v012 TEXT_VA=MY_USER_TEXT_VA012, DATA_VA=MY_USER_DATA_VA012
attr_text {
	Name = .My_User_Section_4v012,
	part_0_ctx_nonzero_tsb_config_2,
	VA = MY_USER_TEXT_VA012,
	RA = MY_USER_TEXT_PA012,
	PA = MY_USER_TEXT_PA012,
	TTE_Context = PCONTEXT,
	TTE_V       = 1,
	TTE_NFO     = 0,
	TTE_L       = 0,
	TTE_Soft    = 0,
	TTE_IE      = 0,
	TTE_E       = 0,
	TTE_CP      = 1,
	TTE_CV      = 0,
	TTE_P       = 0,
	TTE_EP      = 1,
	TTE_W       = 0,
	TTE_SW1     = 0,
	TTE_SW0     = 0,
	TTE_RSVD1   = 0,
	TTE_Size    = 0,
	}
.text
.global user_code_begin_012
user_code_begin_012:
	setx user_data_begin_013, %l1, %l3
	lduw [%l3], %l1
	setx user_code_begin_013, %l1, %l4
	stuw %l4, [%l3]
	jmp  %l4
	nop
	EXIT_BAD


attr_data {
	Name = .My_User_Section_4v012,
	notsb,
	VA = MY_USER_DATA_VA012,
	RA = MY_USER_DATA_PA012,
	PA = MY_USER_DATA_PA012,
	TTE_Context = PCONTEXT,
	TTE_V       = 1,
	TTE_NFO     = 0,
	TTE_L       = 0,
	TTE_Soft    = 0,
	TTE_IE      = 0,
	TTE_E       = 0,
	TTE_CP      = 1,
	TTE_CV      = 0,
	TTE_P       = 0,
	TTE_EP      = 0,
	TTE_W       = 1,
	TTE_SW1     = 0,
	TTE_SW0     = 0,
	TTE_RSVD1   = 0,
	TTE_Size    = 1,
	}
.data
.global user_data_begin_012
user_data_begin_012:
	.word 0x1001b
	.word 0x8080
	.word 0x1008a
	.word 0x9431


SECTION .My_User_Section_4v013 TEXT_VA=MY_USER_TEXT_VA013, DATA_VA=MY_USER_DATA_VA013
attr_text {
	Name = .My_User_Section_4v013,
	part_0_ctx_nonzero_tsb_config_2,
	VA = MY_USER_TEXT_VA013,
	RA = MY_USER_TEXT_PA013,
	PA = MY_USER_TEXT_PA013,
	TTE_Context = PCONTEXT,
	TTE_V       = 1,
	TTE_NFO     = 0,
	TTE_L       = 0,
	TTE_Soft    = 0,
	TTE_IE      = 0,
	TTE_E       = 0,
	TTE_CP      = 1,
	TTE_CV      = 0,
	TTE_P       = 0,
	TTE_EP      = 1,
	TTE_W       = 0,
	TTE_SW1     = 0,
	TTE_SW0     = 0,
	TTE_RSVD1   = 0,
	TTE_Size    = 0,
	}
.text
.global user_code_begin_013
user_code_begin_013:
	setx user_data_begin_014, %l1, %l3
	lduw [%l3], %l1
	setx user_code_begin_014, %l1, %l4
	stuw %l4, [%l3]
	jmp  %l4
	nop
	EXIT_BAD


attr_data {
	Name = .My_User_Section_4v013,
	notsb,
	VA = MY_USER_DATA_VA013,
	RA = MY_USER_DATA_PA013,
	PA = MY_USER_DATA_PA013,
	TTE_Context = PCONTEXT,
	TTE_V       = 1,
	TTE_NFO     = 0,
	TTE_L       = 0,
	TTE_Soft    = 0,
	TTE_IE      = 0,
	TTE_E       = 0,
	TTE_CP      = 1,
	TTE_CV      = 0,
	TTE_P       = 0,
	TTE_EP      = 0,
	TTE_W       = 1,
	TTE_SW1     = 0,
	TTE_SW0     = 0,
	TTE_RSVD1   = 0,
	TTE_Size    = 1,
	}
.data
.global user_data_begin_013
user_data_begin_013:
	.word 0x137a8
	.word 0xa14
	.word 0xc9a1
	.word 0x14d93


SECTION .My_User_Section_4v014 TEXT_VA=MY_USER_TEXT_VA014, DATA_VA=MY_USER_DATA_VA014
attr_text {
	Name = .My_User_Section_4v014,
	part_0_ctx_nonzero_tsb_config_2,
	VA = MY_USER_TEXT_VA014,
	RA = MY_USER_TEXT_PA014,
	PA = MY_USER_TEXT_PA014,
	TTE_Context = PCONTEXT,
	TTE_V       = 1,
	TTE_NFO     = 0,
	TTE_L       = 0,
	TTE_Soft    = 0,
	TTE_IE      = 0,
	TTE_E       = 0,
	TTE_CP      = 1,
	TTE_CV      = 0,
	TTE_P       = 0,
	TTE_EP      = 1,
	TTE_W       = 0,
	TTE_SW1     = 0,
	TTE_SW0     = 0,
	TTE_RSVD1   = 0,
	TTE_Size    = 0,
	}
.text
.global user_code_begin_014
user_code_begin_014:
	setx user_data_begin_015, %l1, %l3
	lduw [%l3], %l1
	setx user_code_begin_015, %l1, %l4
	stuw %l4, [%l3]
	EXIT_GOOD
	jmp  %l4
	nop
	EXIT_BAD


attr_data {
	Name = .My_User_Section_4v014,
	notsb,
	VA = MY_USER_DATA_VA014,
	RA = MY_USER_DATA_PA014,
	PA = MY_USER_DATA_PA014,
	TTE_Context = PCONTEXT,
	TTE_V       = 1,
	TTE_NFO     = 0,
	TTE_L       = 0,
	TTE_Soft    = 0,
	TTE_IE      = 0,
	TTE_E       = 0,
	TTE_CP      = 1,
	TTE_CV      = 0,
	TTE_P       = 0,
	TTE_EP      = 0,
	TTE_W       = 1,
	TTE_SW1     = 0,
	TTE_SW0     = 0,
	TTE_RSVD1   = 0,
	TTE_Size    = 1,
	}
.data
.global user_data_begin_014
user_data_begin_014:
	.word 0x8a9f
	.word 0x10ac5
	.word 0xa3ce
	.word 0xd574


SECTION .My_User_Section_4v015 TEXT_VA=MY_USER_TEXT_VA015, DATA_VA=MY_USER_DATA_VA015
attr_text {
	Name = .My_User_Section_4v015,
	part_0_ctx_nonzero_tsb_config_3,
	VA = MY_USER_TEXT_VA015,
	RA = MY_USER_TEXT_RA015,
	PA = MY_USER_TEXT_PA015,
	TTE_Context = PCONTEXT,
	TTE_V       = 1,
	TTE_NFO     = 0,
	TTE_L       = 0,
	TTE_Soft    = 0,
	TTE_IE      = 0,
	TTE_E       = 0,
	TTE_CP      = 1,
	TTE_CV      = 0,
	TTE_P       = 0,
	TTE_EP      = 1,
	TTE_W       = 0,
	TTE_SW1     = 0,
	TTE_SW0     = 0,
	TTE_RSVD1   = 0,
	TTE_Size    = 0,
	}
.text
.global user_code_begin_015
user_code_begin_015:
	setx user_data_begin_016, %l1, %l3
	lduw [%l3], %l1
	setx user_code_begin_016, %l1, %l4
	stuw %l4, [%l3]
	jmp  %l4
	nop
	EXIT_BAD


attr_data {
	Name = .My_User_Section_4v015,
	notsb,
	VA = MY_USER_DATA_VA015,
	RA = MY_USER_DATA_RA015,
	PA = MY_USER_DATA_PA015,
	TTE_Context = PCONTEXT,
	TTE_V       = 1,
	TTE_NFO     = 0,
	TTE_L       = 0,
	TTE_Soft    = 0,
	TTE_IE      = 0,
	TTE_E       = 0,
	TTE_CP      = 1,
	TTE_CV      = 0,
	TTE_P       = 0,
	TTE_EP      = 0,
	TTE_W       = 1,
	TTE_SW1     = 0,
	TTE_SW0     = 0,
	TTE_RSVD1   = 0,
	TTE_Size    = 1,
	}
.data
.global user_data_begin_015
user_data_begin_015:
	.word 0xa1b3
	.word 0x13da3
	.word 0xbbfd
	.word 0x15a9a


SECTION .My_User_Section_4v016 TEXT_VA=MY_USER_TEXT_VA016, DATA_VA=MY_USER_DATA_VA016
attr_text {
	Name = .My_User_Section_4v016,
	part_0_ctx_nonzero_tsb_config_3,
	VA = MY_USER_TEXT_VA016,
	RA = MY_USER_TEXT_RA016,
	PA = MY_USER_TEXT_PA016,
	TTE_Context = PCONTEXT,
	TTE_V       = 1,
	TTE_NFO     = 0,
	TTE_L       = 0,
	TTE_Soft    = 0,
	TTE_IE      = 0,
	TTE_E       = 0,
	TTE_CP      = 1,
	TTE_CV      = 0,
	TTE_P       = 0,
	TTE_EP      = 1,
	TTE_W       = 0,
	TTE_SW1     = 0,
	TTE_SW0     = 0,
	TTE_RSVD1   = 0,
	TTE_Size    = 0,
	}
.text
.global user_code_begin_016
user_code_begin_016:
	setx user_data_begin_017, %l1, %l3
	lduw [%l3], %l1
	setx user_code_begin_017, %l1, %l4
	stuw %l4, [%l3]
	jmp  %l4
	nop
	EXIT_BAD


attr_data {
	Name = .My_User_Section_4v016,
	notsb,
	VA = MY_USER_DATA_VA016,
	RA = MY_USER_DATA_RA016,
	PA = MY_USER_DATA_PA016,
	TTE_Context = PCONTEXT,
	TTE_V       = 1,
	TTE_NFO     = 0,
	TTE_L       = 0,
	TTE_Soft    = 0,
	TTE_IE      = 0,
	TTE_E       = 0,
	TTE_CP      = 1,
	TTE_CV      = 0,
	TTE_P       = 0,
	TTE_EP      = 0,
	TTE_W       = 1,
	TTE_SW1     = 0,
	TTE_SW0     = 0,
	TTE_RSVD1   = 0,
	TTE_Size    = 1,
	}
.data
.global user_data_begin_016
user_data_begin_016:
	.word 0x4c64
	.word 0xdb9a
	.word 0x8483
	.word 0x1461d


SECTION .My_User_Section_4v017 TEXT_VA=MY_USER_TEXT_VA017, DATA_VA=MY_USER_DATA_VA017
attr_text {
	Name = .My_User_Section_4v017,
	part_0_ctx_nonzero_tsb_config_3,
	VA = MY_USER_TEXT_VA017,
	RA = MY_USER_TEXT_RA017,
	PA = MY_USER_TEXT_PA017,
	TTE_Context = PCONTEXT,
	TTE_V       = 1,
	TTE_NFO     = 0,
	TTE_L       = 0,
	TTE_Soft    = 0,
	TTE_IE      = 0,
	TTE_E       = 0,
	TTE_CP      = 1,
	TTE_CV      = 0,
	TTE_P       = 0,
	TTE_EP      = 1,
	TTE_W       = 0,
	TTE_SW1     = 0,
	TTE_SW0     = 0,
	TTE_RSVD1   = 0,
	TTE_Size    = 0,
	}
.text
.global user_code_begin_017
user_code_begin_017:
	setx user_data_begin_018, %l1, %l3
	lduw [%l3], %l1
	setx user_code_begin_018, %l1, %l4
	stuw %l4, [%l3]
	jmp  %l4
	nop
	EXIT_BAD


attr_data {
	Name = .My_User_Section_4v017,
	notsb,
	VA = MY_USER_DATA_VA017,
	RA = MY_USER_DATA_RA017,
	PA = MY_USER_DATA_PA017,
	TTE_Context = PCONTEXT,
	TTE_V       = 1,
	TTE_NFO     = 0,
	TTE_L       = 0,
	TTE_Soft    = 0,
	TTE_IE      = 0,
	TTE_E       = 0,
	TTE_CP      = 1,
	TTE_CV      = 0,
	TTE_P       = 0,
	TTE_EP      = 0,
	TTE_W       = 1,
	TTE_SW1     = 0,
	TTE_SW0     = 0,
	TTE_RSVD1   = 0,
	TTE_Size    = 1,
	}
.data
.global user_data_begin_017
user_data_begin_017:
	.word 0x313f
	.word 0x1870
	.word 0x865
	.word 0x7e00


SECTION .My_User_Section_4v018 TEXT_VA=MY_USER_TEXT_VA018, DATA_VA=MY_USER_DATA_VA018
attr_text {
	Name = .My_User_Section_4v018,
	part_0_ctx_nonzero_tsb_config_3,
	VA = MY_USER_TEXT_VA018,
	RA = MY_USER_TEXT_RA018,
	PA = MY_USER_TEXT_PA018,
	TTE_Context = PCONTEXT,
	TTE_V       = 1,
	TTE_NFO     = 0,
	TTE_L       = 0,
	TTE_Soft    = 0,
	TTE_IE      = 0,
	TTE_E       = 0,
	TTE_CP      = 1,
	TTE_CV      = 0,
	TTE_P       = 0,
	TTE_EP      = 1,
	TTE_W       = 0,
	TTE_SW1     = 0,
	TTE_SW0     = 0,
	TTE_RSVD1   = 0,
	TTE_Size    = 0,
	}
.text
.global user_code_begin_018
user_code_begin_018:
	setx user_data_begin_019, %l1, %l3
	lduw [%l3], %l1
	setx user_code_begin_019, %l1, %l4
	stuw %l4, [%l3]
	jmp  %l4
	nop
	EXIT_BAD


attr_data {
	Name = .My_User_Section_4v018,
	notsb,
	VA = MY_USER_DATA_VA018,
	RA = MY_USER_DATA_RA018,
	PA = MY_USER_DATA_PA018,
	TTE_Context = PCONTEXT,
	TTE_V       = 1,
	TTE_NFO     = 0,
	TTE_L       = 0,
	TTE_Soft    = 0,
	TTE_IE      = 0,
	TTE_E       = 0,
	TTE_CP      = 1,
	TTE_CV      = 0,
	TTE_P       = 0,
	TTE_EP      = 0,
	TTE_W       = 1,
	TTE_SW1     = 0,
	TTE_SW0     = 0,
	TTE_RSVD1   = 0,
	TTE_Size    = 1,
	}
.data
.global user_data_begin_018
user_data_begin_018:
	.word 0x5a34
	.word 0x84ce
	.word 0x46f8
	.word 0x9b45


SECTION .My_User_Section_4v019 TEXT_VA=MY_USER_TEXT_VA019, DATA_VA=MY_USER_DATA_VA019
attr_text {
	Name = .My_User_Section_4v019,
	part_0_ctx_nonzero_tsb_config_3,
	VA = MY_USER_TEXT_VA019,
	RA = MY_USER_TEXT_RA019,
	PA = MY_USER_TEXT_PA019,
	TTE_Context = PCONTEXT,
	TTE_V       = 1,
	TTE_NFO     = 0,
	TTE_L       = 0,
	TTE_Soft    = 0,
	TTE_IE      = 0,
	TTE_E       = 0,
	TTE_CP      = 1,
	TTE_CV      = 0,
	TTE_P       = 0,
	TTE_EP      = 1,
	TTE_W       = 0,
	TTE_SW1     = 0,
	TTE_SW0     = 0,
	TTE_RSVD1   = 0,
	TTE_Size    = 0,
	}
.text
.global user_code_begin_019
user_code_begin_019:
	setx user_data_begin_020, %l1, %l3
	lduw [%l3], %l1
	setx user_code_begin_020, %l1, %l4
	stuw %l4, [%l3]
	EXIT_GOOD
	jmp  %l4
	nop
	EXIT_BAD


attr_data {
	Name = .My_User_Section_4v019,
	notsb,
	VA = MY_USER_DATA_VA019,
	RA = MY_USER_DATA_RA019,
	PA = MY_USER_DATA_PA019,
	TTE_Context = PCONTEXT,
	TTE_V       = 1,
	TTE_NFO     = 0,
	TTE_L       = 0,
	TTE_Soft    = 0,
	TTE_IE      = 0,
	TTE_E       = 0,
	TTE_CP      = 1,
	TTE_CV      = 0,
	TTE_P       = 0,
	TTE_EP      = 0,
	TTE_W       = 1,
	TTE_SW1     = 0,
	TTE_SW0     = 0,
	TTE_RSVD1   = 0,
	TTE_Size    = 1,
	}
.data
.global user_data_begin_019
user_data_begin_019:
	.word 0x17fd7
	.word 0xc93a
	.word 0x113e8
	.word 0x401d


SECTION .My_User_Section_4v020 TEXT_VA=MY_USER_TEXT_VA020, DATA_VA=MY_USER_DATA_VA020
attr_text {
	Name = .My_User_Section_4v020,
	part_0_ctx_nonzero_tsb_config_2,
	VA = MY_USER_TEXT_VA020,
	RA = MY_USER_TEXT_PA020,
	PA = MY_USER_TEXT_PA020,
	TTE_Context = PCONTEXT,
	TTE_V       = 1,
	TTE_NFO     = 0,
	TTE_L       = 0,
	TTE_Soft    = 0,
	TTE_IE      = 0,
	TTE_E       = 0,
	TTE_CP      = 1,
	TTE_CV      = 0,
	TTE_P       = 0,
	TTE_EP      = 1,
	TTE_W       = 0,
	TTE_SW1     = 0,
	TTE_SW0     = 0,
	TTE_RSVD1   = 0,
	TTE_Size    = 0,
	}
.text
.global user_code_begin_020
user_code_begin_020:
	setx user_data_begin_021, %l1, %l3
	lduw [%l3], %l1
	setx user_code_begin_021, %l1, %l4
	stuw %l4, [%l3]
	jmp  %l4
	nop
	EXIT_BAD


attr_data {
	Name = .My_User_Section_4v020,
	notsb,
	VA = MY_USER_DATA_VA020,
	RA = MY_USER_DATA_PA020,
	PA = MY_USER_DATA_PA020,
	TTE_Context = PCONTEXT,
	TTE_V       = 1,
	TTE_NFO     = 0,
	TTE_L       = 0,
	TTE_Soft    = 0,
	TTE_IE      = 0,
	TTE_E       = 0,
	TTE_CP      = 1,
	TTE_CV      = 0,
	TTE_P       = 0,
	TTE_EP      = 0,
	TTE_W       = 1,
	TTE_SW1     = 0,
	TTE_SW0     = 0,
	TTE_RSVD1   = 0,
	TTE_Size    = 1,
	}
.data
.global user_data_begin_020
user_data_begin_020:
	.word 0x140c8
	.word 0x2f44
	.word 0xa8cf
	.word 0x13661


SECTION .My_User_Section_4v021 TEXT_VA=MY_USER_TEXT_VA021, DATA_VA=MY_USER_DATA_VA021
attr_text {
	Name = .My_User_Section_4v021,
	part_0_ctx_nonzero_tsb_config_2,
	VA = MY_USER_TEXT_VA021,
	RA = MY_USER_TEXT_PA021,
	PA = MY_USER_TEXT_PA021,
	TTE_Context = PCONTEXT,
	TTE_V       = 1,
	TTE_NFO     = 0,
	TTE_L       = 0,
	TTE_Soft    = 0,
	TTE_IE      = 0,
	TTE_E       = 0,
	TTE_CP      = 1,
	TTE_CV      = 0,
	TTE_P       = 0,
	TTE_EP      = 1,
	TTE_W       = 0,
	TTE_SW1     = 0,
	TTE_SW0     = 0,
	TTE_RSVD1   = 0,
	TTE_Size    = 0,
	}
.text
.global user_code_begin_021
user_code_begin_021:
	setx user_data_begin_022, %l1, %l3
	lduw [%l3], %l1
	setx user_code_begin_022, %l1, %l4
	stuw %l4, [%l3]
	jmp  %l4
	nop
	EXIT_BAD


attr_data {
	Name = .My_User_Section_4v021,
	notsb,
	VA = MY_USER_DATA_VA021,
	RA = MY_USER_DATA_PA021,
	PA = MY_USER_DATA_PA021,
	TTE_Context = PCONTEXT,
	TTE_V       = 1,
	TTE_NFO     = 0,
	TTE_L       = 0,
	TTE_Soft    = 0,
	TTE_IE      = 0,
	TTE_E       = 0,
	TTE_CP      = 1,
	TTE_CV      = 0,
	TTE_P       = 0,
	TTE_EP      = 0,
	TTE_W       = 1,
	TTE_SW1     = 0,
	TTE_SW0     = 0,
	TTE_RSVD1   = 0,
	TTE_Size    = 1,
	}
.data
.global user_data_begin_021
user_data_begin_021:
	.word 0xda48
	.word 0xfa56
	.word 0x140bc
	.word 0x2e74


SECTION .My_User_Section_4v022 TEXT_VA=MY_USER_TEXT_VA022, DATA_VA=MY_USER_DATA_VA022
attr_text {
	Name = .My_User_Section_4v022,
	part_0_ctx_nonzero_tsb_config_2,
	VA = MY_USER_TEXT_VA022,
	RA = MY_USER_TEXT_PA022,
	PA = MY_USER_TEXT_PA022,
	TTE_Context = PCONTEXT,
	TTE_V       = 1,
	TTE_NFO     = 0,
	TTE_L       = 0,
	TTE_Soft    = 0,
	TTE_IE      = 0,
	TTE_E       = 0,
	TTE_CP      = 1,
	TTE_CV      = 0,
	TTE_P       = 0,
	TTE_EP      = 1,
	TTE_W       = 0,
	TTE_SW1     = 0,
	TTE_SW0     = 0,
	TTE_RSVD1   = 0,
	TTE_Size    = 0,
	}
.text
.global user_code_begin_022
user_code_begin_022:
	setx user_data_begin_023, %l1, %l3
	lduw [%l3], %l1
	setx user_code_begin_023, %l1, %l4
	stuw %l4, [%l3]
	jmp  %l4
	nop
	EXIT_BAD


attr_data {
	Name = .My_User_Section_4v022,
	notsb,
	VA = MY_USER_DATA_VA022,
	RA = MY_USER_DATA_PA022,
	PA = MY_USER_DATA_PA022,
	TTE_Context = PCONTEXT,
	TTE_V       = 1,
	TTE_NFO     = 0,
	TTE_L       = 0,
	TTE_Soft    = 0,
	TTE_IE      = 0,
	TTE_E       = 0,
	TTE_CP      = 1,
	TTE_CV      = 0,
	TTE_P       = 0,
	TTE_EP      = 0,
	TTE_W       = 1,
	TTE_SW1     = 0,
	TTE_SW0     = 0,
	TTE_RSVD1   = 0,
	TTE_Size    = 1,
	}
.data
.global user_data_begin_022
user_data_begin_022:
	.word 0x12e6d
	.word 0x4cbe
	.word 0x7608
	.word 0x11af1


SECTION .My_User_Section_4v023 TEXT_VA=MY_USER_TEXT_VA023, DATA_VA=MY_USER_DATA_VA023
attr_text {
	Name = .My_User_Section_4v023,
	part_0_ctx_nonzero_tsb_config_2,
	VA = MY_USER_TEXT_VA023,
	RA = MY_USER_TEXT_PA023,
	PA = MY_USER_TEXT_PA023,
	TTE_Context = PCONTEXT,
	TTE_V       = 1,
	TTE_NFO     = 0,
	TTE_L       = 0,
	TTE_Soft    = 0,
	TTE_IE      = 0,
	TTE_E       = 0,
	TTE_CP      = 1,
	TTE_CV      = 0,
	TTE_P       = 0,
	TTE_EP      = 1,
	TTE_W       = 0,
	TTE_SW1     = 0,
	TTE_SW0     = 0,
	TTE_RSVD1   = 0,
	TTE_Size    = 0,
	}
.text
.global user_code_begin_023
user_code_begin_023:
	setx user_data_begin_024, %l1, %l3
	lduw [%l3], %l1
	setx user_code_begin_024, %l1, %l4
	stuw %l4, [%l3]
	jmp  %l4
	nop
	EXIT_BAD


attr_data {
	Name = .My_User_Section_4v023,
	notsb,
	VA = MY_USER_DATA_VA023,
	RA = MY_USER_DATA_PA023,
	PA = MY_USER_DATA_PA023,
	TTE_Context = PCONTEXT,
	TTE_V       = 1,
	TTE_NFO     = 0,
	TTE_L       = 0,
	TTE_Soft    = 0,
	TTE_IE      = 0,
	TTE_E       = 0,
	TTE_CP      = 1,
	TTE_CV      = 0,
	TTE_P       = 0,
	TTE_EP      = 0,
	TTE_W       = 1,
	TTE_SW1     = 0,
	TTE_SW0     = 0,
	TTE_RSVD1   = 0,
	TTE_Size    = 1,
	}
.data
.global user_data_begin_023
user_data_begin_023:
	.word 0x10321
	.word 0x8a6
	.word 0x1094b
	.word 0x12a3c


SECTION .My_User_Section_4v024 TEXT_VA=MY_USER_TEXT_VA024, DATA_VA=MY_USER_DATA_VA024
attr_text {
	Name = .My_User_Section_4v024,
	part_0_ctx_nonzero_tsb_config_2,
	VA = MY_USER_TEXT_VA024,
	RA = MY_USER_TEXT_PA024,
	PA = MY_USER_TEXT_PA024,
	TTE_Context = PCONTEXT,
	TTE_V       = 1,
	TTE_NFO     = 0,
	TTE_L       = 0,
	TTE_Soft    = 0,
	TTE_IE      = 0,
	TTE_E       = 0,
	TTE_CP      = 1,
	TTE_CV      = 0,
	TTE_P       = 0,
	TTE_EP      = 1,
	TTE_W       = 0,
	TTE_SW1     = 0,
	TTE_SW0     = 0,
	TTE_RSVD1   = 0,
	TTE_Size    = 0,
	}
.text
.global user_code_begin_024
user_code_begin_024:
	setx user_data_begin_025, %l1, %l3
	lduw [%l3], %l1
	setx user_code_begin_025, %l1, %l4
	stuw %l4, [%l3]
	EXIT_GOOD
	jmp  %l4
	nop
	EXIT_BAD


attr_data {
	Name = .My_User_Section_4v024,
	notsb,
	VA = MY_USER_DATA_VA024,
	RA = MY_USER_DATA_PA024,
	PA = MY_USER_DATA_PA024,
	TTE_Context = PCONTEXT,
	TTE_V       = 1,
	TTE_NFO     = 0,
	TTE_L       = 0,
	TTE_Soft    = 0,
	TTE_IE      = 0,
	TTE_E       = 0,
	TTE_CP      = 1,
	TTE_CV      = 0,
	TTE_P       = 0,
	TTE_EP      = 0,
	TTE_W       = 1,
	TTE_SW1     = 0,
	TTE_SW0     = 0,
	TTE_RSVD1   = 0,
	TTE_Size    = 1,
	}
.data
.global user_data_begin_024
user_data_begin_024:
	.word 0xe09
	.word 0xdb04
	.word 0xd591
	.word 0x98ac


SECTION .My_User_Section_4v025 TEXT_VA=MY_USER_TEXT_VA025, DATA_VA=MY_USER_DATA_VA025
attr_text {
	Name = .My_User_Section_4v025,
	part_0_ctx_nonzero_tsb_config_3,
	VA = MY_USER_TEXT_VA025,
	RA = MY_USER_TEXT_RA025,
	PA = MY_USER_TEXT_PA025,
	TTE_Context = PCONTEXT,
	TTE_V       = 1,
	TTE_NFO     = 0,
	TTE_L       = 0,
	TTE_Soft    = 0,
	TTE_IE      = 0,
	TTE_E       = 0,
	TTE_CP      = 1,
	TTE_CV      = 0,
	TTE_P       = 0,
	TTE_EP      = 1,
	TTE_W       = 0,
	TTE_SW1     = 0,
	TTE_SW0     = 0,
	TTE_RSVD1   = 0,
	TTE_Size    = 0,
	}
.text
.global user_code_begin_025
user_code_begin_025:
	setx user_data_begin_026, %l1, %l3
	lduw [%l3], %l1
	setx user_code_begin_026, %l1, %l4
	stuw %l4, [%l3]
	jmp  %l4
	nop
	EXIT_BAD


attr_data {
	Name = .My_User_Section_4v025,
	notsb,
	VA = MY_USER_DATA_VA025,
	RA = MY_USER_DATA_RA025,
	PA = MY_USER_DATA_PA025,
	TTE_Context = PCONTEXT,
	TTE_V       = 1,
	TTE_NFO     = 0,
	TTE_L       = 0,
	TTE_Soft    = 0,
	TTE_IE      = 0,
	TTE_E       = 0,
	TTE_CP      = 1,
	TTE_CV      = 0,
	TTE_P       = 0,
	TTE_EP      = 0,
	TTE_W       = 1,
	TTE_SW1     = 0,
	TTE_SW0     = 0,
	TTE_RSVD1   = 0,
	TTE_Size    = 1,
	}
.data
.global user_data_begin_025
user_data_begin_025:
	.word 0x1144e
	.word 0x14684
	.word 0x70df
	.word 0xf7f2


SECTION .My_User_Section_4v026 TEXT_VA=MY_USER_TEXT_VA026, DATA_VA=MY_USER_DATA_VA026
attr_text {
	Name = .My_User_Section_4v026,
	part_0_ctx_nonzero_tsb_config_3,
	VA = MY_USER_TEXT_VA026,
	RA = MY_USER_TEXT_RA026,
	PA = MY_USER_TEXT_PA026,
	TTE_Context = PCONTEXT,
	TTE_V       = 1,
	TTE_NFO     = 0,
	TTE_L       = 0,
	TTE_Soft    = 0,
	TTE_IE      = 0,
	TTE_E       = 0,
	TTE_CP      = 1,
	TTE_CV      = 0,
	TTE_P       = 0,
	TTE_EP      = 1,
	TTE_W       = 0,
	TTE_SW1     = 0,
	TTE_SW0     = 0,
	TTE_RSVD1   = 0,
	TTE_Size    = 0,
	}
.text
.global user_code_begin_026
user_code_begin_026:
	setx user_data_begin_027, %l1, %l3
	lduw [%l3], %l1
	setx user_code_begin_027, %l1, %l4
	stuw %l4, [%l3]
	jmp  %l4
	nop
	EXIT_BAD


attr_data {
	Name = .My_User_Section_4v026,
	notsb,
	VA = MY_USER_DATA_VA026,
	RA = MY_USER_DATA_RA026,
	PA = MY_USER_DATA_PA026,
	TTE_Context = PCONTEXT,
	TTE_V       = 1,
	TTE_NFO     = 0,
	TTE_L       = 0,
	TTE_Soft    = 0,
	TTE_IE      = 0,
	TTE_E       = 0,
	TTE_CP      = 1,
	TTE_CV      = 0,
	TTE_P       = 0,
	TTE_EP      = 0,
	TTE_W       = 1,
	TTE_SW1     = 0,
	TTE_SW0     = 0,
	TTE_RSVD1   = 0,
	TTE_Size    = 1,
	}
.data
.global user_data_begin_026
user_data_begin_026:
	.word 0x5b4d
	.word 0x21d1
	.word 0xf89e
	.word 0x10ef5


SECTION .My_User_Section_4v027 TEXT_VA=MY_USER_TEXT_VA027, DATA_VA=MY_USER_DATA_VA027
attr_text {
	Name = .My_User_Section_4v027,
	part_0_ctx_nonzero_tsb_config_3,
	VA = MY_USER_TEXT_VA027,
	RA = MY_USER_TEXT_RA027,
	PA = MY_USER_TEXT_PA027,
	TTE_Context = PCONTEXT,
	TTE_V       = 1,
	TTE_NFO     = 0,
	TTE_L       = 0,
	TTE_Soft    = 0,
	TTE_IE      = 0,
	TTE_E       = 0,
	TTE_CP      = 1,
	TTE_CV      = 0,
	TTE_P       = 0,
	TTE_EP      = 1,
	TTE_W       = 0,
	TTE_SW1     = 0,
	TTE_SW0     = 0,
	TTE_RSVD1   = 0,
	TTE_Size    = 0,
	}
.text
.global user_code_begin_027
user_code_begin_027:
	setx user_data_begin_028, %l1, %l3
	lduw [%l3], %l1
	setx user_code_begin_028, %l1, %l4
	stuw %l4, [%l3]
	jmp  %l4
	nop
	EXIT_BAD


attr_data {
	Name = .My_User_Section_4v027,
	notsb,
	VA = MY_USER_DATA_VA027,
	RA = MY_USER_DATA_RA027,
	PA = MY_USER_DATA_PA027,
	TTE_Context = PCONTEXT,
	TTE_V       = 1,
	TTE_NFO     = 0,
	TTE_L       = 0,
	TTE_Soft    = 0,
	TTE_IE      = 0,
	TTE_E       = 0,
	TTE_CP      = 1,
	TTE_CV      = 0,
	TTE_P       = 0,
	TTE_EP      = 0,
	TTE_W       = 1,
	TTE_SW1     = 0,
	TTE_SW0     = 0,
	TTE_RSVD1   = 0,
	TTE_Size    = 1,
	}
.data
.global user_data_begin_027
user_data_begin_027:
	.word 0x3b92
	.word 0x9a3e
	.word 0x7cf3
	.word 0x155ca


SECTION .My_User_Section_4v028 TEXT_VA=MY_USER_TEXT_VA028, DATA_VA=MY_USER_DATA_VA028
attr_text {
	Name = .My_User_Section_4v028,
	part_0_ctx_nonzero_tsb_config_3,
	VA = MY_USER_TEXT_VA028,
	RA = MY_USER_TEXT_RA028,
	PA = MY_USER_TEXT_PA028,
	TTE_Context = PCONTEXT,
	TTE_V       = 1,
	TTE_NFO     = 0,
	TTE_L       = 0,
	TTE_Soft    = 0,
	TTE_IE      = 0,
	TTE_E       = 0,
	TTE_CP      = 1,
	TTE_CV      = 0,
	TTE_P       = 0,
	TTE_EP      = 1,
	TTE_W       = 0,
	TTE_SW1     = 0,
	TTE_SW0     = 0,
	TTE_RSVD1   = 0,
	TTE_Size    = 0,
	}
.text
.global user_code_begin_028
user_code_begin_028:
	setx user_data_begin_029, %l1, %l3
	lduw [%l3], %l1
	setx user_code_begin_029, %l1, %l4
	stuw %l4, [%l3]
	jmp  %l4
	nop
	EXIT_BAD


attr_data {
	Name = .My_User_Section_4v028,
	notsb,
	VA = MY_USER_DATA_VA028,
	RA = MY_USER_DATA_RA028,
	PA = MY_USER_DATA_PA028,
	TTE_Context = PCONTEXT,
	TTE_V       = 1,
	TTE_NFO     = 0,
	TTE_L       = 0,
	TTE_Soft    = 0,
	TTE_IE      = 0,
	TTE_E       = 0,
	TTE_CP      = 1,
	TTE_CV      = 0,
	TTE_P       = 0,
	TTE_EP      = 0,
	TTE_W       = 1,
	TTE_SW1     = 0,
	TTE_SW0     = 0,
	TTE_RSVD1   = 0,
	TTE_Size    = 1,
	}
.data
.global user_data_begin_028
user_data_begin_028:
	.word 0x1455b
	.word 0x947d
	.word 0xa350
	.word 0x7e3f


SECTION .My_User_Section_4v029 TEXT_VA=MY_USER_TEXT_VA029, DATA_VA=MY_USER_DATA_VA029
attr_text {
	Name = .My_User_Section_4v029,
	part_0_ctx_nonzero_tsb_config_3,
	VA = MY_USER_TEXT_VA029,
	RA = MY_USER_TEXT_RA029,
	PA = MY_USER_TEXT_PA029,
	TTE_Context = PCONTEXT,
	TTE_V       = 1,
	TTE_NFO     = 0,
	TTE_L       = 0,
	TTE_Soft    = 0,
	TTE_IE      = 0,
	TTE_E       = 0,
	TTE_CP      = 1,
	TTE_CV      = 0,
	TTE_P       = 0,
	TTE_EP      = 1,
	TTE_W       = 0,
	TTE_SW1     = 0,
	TTE_SW0     = 0,
	TTE_RSVD1   = 0,
	TTE_Size    = 0,
	}
.text
.global user_code_begin_029
user_code_begin_029:
	setx user_data_begin_030, %l1, %l3
	lduw [%l3], %l1
	setx user_code_begin_030, %l1, %l4
	stuw %l4, [%l3]
	EXIT_GOOD
	jmp  %l4
	nop
	EXIT_BAD


attr_data {
	Name = .My_User_Section_4v029,
	notsb,
	VA = MY_USER_DATA_VA029,
	RA = MY_USER_DATA_RA029,
	PA = MY_USER_DATA_PA029,
	TTE_Context = PCONTEXT,
	TTE_V       = 1,
	TTE_NFO     = 0,
	TTE_L       = 0,
	TTE_Soft    = 0,
	TTE_IE      = 0,
	TTE_E       = 0,
	TTE_CP      = 1,
	TTE_CV      = 0,
	TTE_P       = 0,
	TTE_EP      = 0,
	TTE_W       = 1,
	TTE_SW1     = 0,
	TTE_SW0     = 0,
	TTE_RSVD1   = 0,
	TTE_Size    = 1,
	}
.data
.global user_data_begin_029
user_data_begin_029:
	.word 0x18481
	.word 0xfd49
	.word 0x290d
	.word 0x278d


SECTION .My_User_Section_4v030 TEXT_VA=MY_USER_TEXT_VA030, DATA_VA=MY_USER_DATA_VA030
attr_text {
	Name = .My_User_Section_4v030,
	part_0_ctx_nonzero_tsb_config_2,
	VA = MY_USER_TEXT_VA030,
	RA = MY_USER_TEXT_PA030,
	PA = MY_USER_TEXT_PA030,
	TTE_Context = PCONTEXT,
	TTE_V       = 1,
	TTE_NFO     = 0,
	TTE_L       = 0,
	TTE_Soft    = 0,
	TTE_IE      = 0,
	TTE_E       = 0,
	TTE_CP      = 1,
	TTE_CV      = 0,
	TTE_P       = 0,
	TTE_EP      = 1,
	TTE_W       = 0,
	TTE_SW1     = 0,
	TTE_SW0     = 0,
	TTE_RSVD1   = 0,
	TTE_Size    = 0,
	}
.text
.global user_code_begin_030
user_code_begin_030:
	setx user_data_begin_031, %l1, %l3
	lduw [%l3], %l1
	setx user_code_begin_031, %l1, %l4
	stuw %l4, [%l3]
	jmp  %l4
	nop
	EXIT_BAD


attr_data {
	Name = .My_User_Section_4v030,
	notsb,
	VA = MY_USER_DATA_VA030,
	RA = MY_USER_DATA_PA030,
	PA = MY_USER_DATA_PA030,
	TTE_Context = PCONTEXT,
	TTE_V       = 1,
	TTE_NFO     = 0,
	TTE_L       = 0,
	TTE_Soft    = 0,
	TTE_IE      = 0,
	TTE_E       = 0,
	TTE_CP      = 1,
	TTE_CV      = 0,
	TTE_P       = 0,
	TTE_EP      = 0,
	TTE_W       = 1,
	TTE_SW1     = 0,
	TTE_SW0     = 0,
	TTE_RSVD1   = 0,
	TTE_Size    = 1,
	}
.data
.global user_data_begin_030
user_data_begin_030:
	.word 0xcf9e
	.word 0xf15
	.word 0xfbd7
	.word 0x6c17


SECTION .My_User_Section_4v031 TEXT_VA=MY_USER_TEXT_VA031, DATA_VA=MY_USER_DATA_VA031
attr_text {
	Name = .My_User_Section_4v031,
	part_0_ctx_nonzero_tsb_config_2,
	VA = MY_USER_TEXT_VA031,
	RA = MY_USER_TEXT_PA031,
	PA = MY_USER_TEXT_PA031,
	TTE_Context = PCONTEXT,
	TTE_V       = 1,
	TTE_NFO     = 0,
	TTE_L       = 0,
	TTE_Soft    = 0,
	TTE_IE      = 0,
	TTE_E       = 0,
	TTE_CP      = 1,
	TTE_CV      = 0,
	TTE_P       = 0,
	TTE_EP      = 1,
	TTE_W       = 0,
	TTE_SW1     = 0,
	TTE_SW0     = 0,
	TTE_RSVD1   = 0,
	TTE_Size    = 0,
	}
.text
.global user_code_begin_031
user_code_begin_031:
	setx user_data_begin_032, %l1, %l3
	lduw [%l3], %l1
	setx user_code_begin_032, %l1, %l4
	stuw %l4, [%l3]
	jmp  %l4
	nop
	EXIT_BAD


attr_data {
	Name = .My_User_Section_4v031,
	notsb,
	VA = MY_USER_DATA_VA031,
	RA = MY_USER_DATA_PA031,
	PA = MY_USER_DATA_PA031,
	TTE_Context = PCONTEXT,
	TTE_V       = 1,
	TTE_NFO     = 0,
	TTE_L       = 0,
	TTE_Soft    = 0,
	TTE_IE      = 0,
	TTE_E       = 0,
	TTE_CP      = 1,
	TTE_CV      = 0,
	TTE_P       = 0,
	TTE_EP      = 0,
	TTE_W       = 1,
	TTE_SW1     = 0,
	TTE_SW0     = 0,
	TTE_RSVD1   = 0,
	TTE_Size    = 1,
	}
.data
.global user_data_begin_031
user_data_begin_031:
	.word 0x108c3
	.word 0x6630
	.word 0x9047
	.word 0x5e28


SECTION .My_User_Section_4v032 TEXT_VA=MY_USER_TEXT_VA032, DATA_VA=MY_USER_DATA_VA032
attr_text {
	Name = .My_User_Section_4v032,
	part_0_ctx_nonzero_tsb_config_2,
	VA = MY_USER_TEXT_VA032,
	RA = MY_USER_TEXT_PA032,
	PA = MY_USER_TEXT_PA032,
	TTE_Context = PCONTEXT,
	TTE_V       = 1,
	TTE_NFO     = 0,
	TTE_L       = 0,
	TTE_Soft    = 0,
	TTE_IE      = 0,
	TTE_E       = 0,
	TTE_CP      = 1,
	TTE_CV      = 0,
	TTE_P       = 0,
	TTE_EP      = 1,
	TTE_W       = 0,
	TTE_SW1     = 0,
	TTE_SW0     = 0,
	TTE_RSVD1   = 0,
	TTE_Size    = 0,
	}
.text
.global user_code_begin_032
user_code_begin_032:
	setx user_data_begin_033, %l1, %l3
	lduw [%l3], %l1
	setx user_code_begin_033, %l1, %l4
	stuw %l4, [%l3]
	jmp  %l4
	nop
	EXIT_BAD


attr_data {
	Name = .My_User_Section_4v032,
	notsb,
	VA = MY_USER_DATA_VA032,
	RA = MY_USER_DATA_PA032,
	PA = MY_USER_DATA_PA032,
	TTE_Context = PCONTEXT,
	TTE_V       = 1,
	TTE_NFO     = 0,
	TTE_L       = 0,
	TTE_Soft    = 0,
	TTE_IE      = 0,
	TTE_E       = 0,
	TTE_CP      = 1,
	TTE_CV      = 0,
	TTE_P       = 0,
	TTE_EP      = 0,
	TTE_W       = 1,
	TTE_SW1     = 0,
	TTE_SW0     = 0,
	TTE_RSVD1   = 0,
	TTE_Size    = 1,
	}
.data
.global user_data_begin_032
user_data_begin_032:
	.word 0x13416
	.word 0x884
	.word 0x101cb
	.word 0x69f4


SECTION .My_User_Section_4v033 TEXT_VA=MY_USER_TEXT_VA033, DATA_VA=MY_USER_DATA_VA033
attr_text {
	Name = .My_User_Section_4v033,
	part_0_ctx_nonzero_tsb_config_2,
	VA = MY_USER_TEXT_VA033,
	RA = MY_USER_TEXT_PA033,
	PA = MY_USER_TEXT_PA033,
	TTE_Context = PCONTEXT,
	TTE_V       = 1,
	TTE_NFO     = 0,
	TTE_L       = 0,
	TTE_Soft    = 0,
	TTE_IE      = 0,
	TTE_E       = 0,
	TTE_CP      = 1,
	TTE_CV      = 0,
	TTE_P       = 0,
	TTE_EP      = 1,
	TTE_W       = 0,
	TTE_SW1     = 0,
	TTE_SW0     = 0,
	TTE_RSVD1   = 0,
	TTE_Size    = 0,
	}
.text
.global user_code_begin_033
user_code_begin_033:
	setx user_data_begin_034, %l1, %l3
	lduw [%l3], %l1
	setx user_code_begin_034, %l1, %l4
	stuw %l4, [%l3]
	jmp  %l4
	nop
	EXIT_BAD


attr_data {
	Name = .My_User_Section_4v033,
	notsb,
	VA = MY_USER_DATA_VA033,
	RA = MY_USER_DATA_PA033,
	PA = MY_USER_DATA_PA033,
	TTE_Context = PCONTEXT,
	TTE_V       = 1,
	TTE_NFO     = 0,
	TTE_L       = 0,
	TTE_Soft    = 0,
	TTE_IE      = 0,
	TTE_E       = 0,
	TTE_CP      = 1,
	TTE_CV      = 0,
	TTE_P       = 0,
	TTE_EP      = 0,
	TTE_W       = 1,
	TTE_SW1     = 0,
	TTE_SW0     = 0,
	TTE_RSVD1   = 0,
	TTE_Size    = 1,
	}
.data
.global user_data_begin_033
user_data_begin_033:
	.word 0x48cb
	.word 0x99b2
	.word 0xba17
	.word 0x45c7


SECTION .My_User_Section_4v034 TEXT_VA=MY_USER_TEXT_VA034, DATA_VA=MY_USER_DATA_VA034
attr_text {
	Name = .My_User_Section_4v034,
	part_0_ctx_nonzero_tsb_config_2,
	VA = MY_USER_TEXT_VA034,
	RA = MY_USER_TEXT_PA034,
	PA = MY_USER_TEXT_PA034,
	TTE_Context = PCONTEXT,
	TTE_V       = 1,
	TTE_NFO     = 0,
	TTE_L       = 0,
	TTE_Soft    = 0,
	TTE_IE      = 0,
	TTE_E       = 0,
	TTE_CP      = 1,
	TTE_CV      = 0,
	TTE_P       = 0,
	TTE_EP      = 1,
	TTE_W       = 0,
	TTE_SW1     = 0,
	TTE_SW0     = 0,
	TTE_RSVD1   = 0,
	TTE_Size    = 0,
	}
.text
.global user_code_begin_034
user_code_begin_034:
	setx user_data_begin_035, %l1, %l3
	lduw [%l3], %l1
	setx user_code_begin_035, %l1, %l4
	stuw %l4, [%l3]
	EXIT_GOOD
	jmp  %l4
	nop
	EXIT_BAD


attr_data {
	Name = .My_User_Section_4v034,
	notsb,
	VA = MY_USER_DATA_VA034,
	RA = MY_USER_DATA_PA034,
	PA = MY_USER_DATA_PA034,
	TTE_Context = PCONTEXT,
	TTE_V       = 1,
	TTE_NFO     = 0,
	TTE_L       = 0,
	TTE_Soft    = 0,
	TTE_IE      = 0,
	TTE_E       = 0,
	TTE_CP      = 1,
	TTE_CV      = 0,
	TTE_P       = 0,
	TTE_EP      = 0,
	TTE_W       = 1,
	TTE_SW1     = 0,
	TTE_SW0     = 0,
	TTE_RSVD1   = 0,
	TTE_Size    = 1,
	}
.data
.global user_data_begin_034
user_data_begin_034:
	.word 0x1715
	.word 0x2c31
	.word 0x1f29
	.word 0x924


SECTION .My_User_Section_4v035 TEXT_VA=MY_USER_TEXT_VA035, DATA_VA=MY_USER_DATA_VA035
attr_text {
	Name = .My_User_Section_4v035,
	part_0_ctx_nonzero_tsb_config_3,
	VA = MY_USER_TEXT_VA035,
	RA = MY_USER_TEXT_RA035,
	PA = MY_USER_TEXT_PA035,
	TTE_Context = PCONTEXT,
	TTE_V       = 1,
	TTE_NFO     = 0,
	TTE_L       = 0,
	TTE_Soft    = 0,
	TTE_IE      = 0,
	TTE_E       = 0,
	TTE_CP      = 1,
	TTE_CV      = 0,
	TTE_P       = 0,
	TTE_EP      = 1,
	TTE_W       = 0,
	TTE_SW1     = 0,
	TTE_SW0     = 0,
	TTE_RSVD1   = 0,
	TTE_Size    = 0,
	}
.text
.global user_code_begin_035
user_code_begin_035:
	setx user_data_begin_036, %l1, %l3
	lduw [%l3], %l1
	setx user_code_begin_036, %l1, %l4
	stuw %l4, [%l3]
	jmp  %l4
	nop
	EXIT_BAD


attr_data {
	Name = .My_User_Section_4v035,
	notsb,
	VA = MY_USER_DATA_VA035,
	RA = MY_USER_DATA_RA035,
	PA = MY_USER_DATA_PA035,
	TTE_Context = PCONTEXT,
	TTE_V       = 1,
	TTE_NFO     = 0,
	TTE_L       = 0,
	TTE_Soft    = 0,
	TTE_IE      = 0,
	TTE_E       = 0,
	TTE_CP      = 1,
	TTE_CV      = 0,
	TTE_P       = 0,
	TTE_EP      = 0,
	TTE_W       = 1,
	TTE_SW1     = 0,
	TTE_SW0     = 0,
	TTE_RSVD1   = 0,
	TTE_Size    = 1,
	}
.data
.global user_data_begin_035
user_data_begin_035:
	.word 0x7a5e
	.word 0xe156
	.word 0x62e5
	.word 0x4a2b


SECTION .My_User_Section_4v036 TEXT_VA=MY_USER_TEXT_VA036, DATA_VA=MY_USER_DATA_VA036
attr_text {
	Name = .My_User_Section_4v036,
	part_0_ctx_nonzero_tsb_config_3,
	VA = MY_USER_TEXT_VA036,
	RA = MY_USER_TEXT_RA036,
	PA = MY_USER_TEXT_PA036,
	TTE_Context = PCONTEXT,
	TTE_V       = 1,
	TTE_NFO     = 0,
	TTE_L       = 0,
	TTE_Soft    = 0,
	TTE_IE      = 0,
	TTE_E       = 0,
	TTE_CP      = 1,
	TTE_CV      = 0,
	TTE_P       = 0,
	TTE_EP      = 1,
	TTE_W       = 0,
	TTE_SW1     = 0,
	TTE_SW0     = 0,
	TTE_RSVD1   = 0,
	TTE_Size    = 0,
	}
.text
.global user_code_begin_036
user_code_begin_036:
	setx user_data_begin_037, %l1, %l3
	lduw [%l3], %l1
	setx user_code_begin_037, %l1, %l4
	stuw %l4, [%l3]
	jmp  %l4
	nop
	EXIT_BAD


attr_data {
	Name = .My_User_Section_4v036,
	notsb,
	VA = MY_USER_DATA_VA036,
	RA = MY_USER_DATA_RA036,
	PA = MY_USER_DATA_PA036,
	TTE_Context = PCONTEXT,
	TTE_V       = 1,
	TTE_NFO     = 0,
	TTE_L       = 0,
	TTE_Soft    = 0,
	TTE_IE      = 0,
	TTE_E       = 0,
	TTE_CP      = 1,
	TTE_CV      = 0,
	TTE_P       = 0,
	TTE_EP      = 0,
	TTE_W       = 1,
	TTE_SW1     = 0,
	TTE_SW0     = 0,
	TTE_RSVD1   = 0,
	TTE_Size    = 1,
	}
.data
.global user_data_begin_036
user_data_begin_036:
	.word 0x9782
	.word 0x18476
	.word 0xcfd5
	.word 0x986d


SECTION .My_User_Section_4v037 TEXT_VA=MY_USER_TEXT_VA037, DATA_VA=MY_USER_DATA_VA037
attr_text {
	Name = .My_User_Section_4v037,
	part_0_ctx_nonzero_tsb_config_3,
	VA = MY_USER_TEXT_VA037,
	RA = MY_USER_TEXT_RA037,
	PA = MY_USER_TEXT_PA037,
	TTE_Context = PCONTEXT,
	TTE_V       = 1,
	TTE_NFO     = 0,
	TTE_L       = 0,
	TTE_Soft    = 0,
	TTE_IE      = 0,
	TTE_E       = 0,
	TTE_CP      = 1,
	TTE_CV      = 0,
	TTE_P       = 0,
	TTE_EP      = 1,
	TTE_W       = 0,
	TTE_SW1     = 0,
	TTE_SW0     = 0,
	TTE_RSVD1   = 0,
	TTE_Size    = 0,
	}
.text
.global user_code_begin_037
user_code_begin_037:
	setx user_data_begin_038, %l1, %l3
	lduw [%l3], %l1
	setx user_code_begin_038, %l1, %l4
	stuw %l4, [%l3]
	jmp  %l4
	nop
	EXIT_BAD


attr_data {
	Name = .My_User_Section_4v037,
	notsb,
	VA = MY_USER_DATA_VA037,
	RA = MY_USER_DATA_RA037,
	PA = MY_USER_DATA_PA037,
	TTE_Context = PCONTEXT,
	TTE_V       = 1,
	TTE_NFO     = 0,
	TTE_L       = 0,
	TTE_Soft    = 0,
	TTE_IE      = 0,
	TTE_E       = 0,
	TTE_CP      = 1,
	TTE_CV      = 0,
	TTE_P       = 0,
	TTE_EP      = 0,
	TTE_W       = 1,
	TTE_SW1     = 0,
	TTE_SW0     = 0,
	TTE_RSVD1   = 0,
	TTE_Size    = 1,
	}
.data
.global user_data_begin_037
user_data_begin_037:
	.word 0x68ae
	.word 0x40d8
	.word 0x152c3
	.word 0x789a


SECTION .My_User_Section_4v038 TEXT_VA=MY_USER_TEXT_VA038, DATA_VA=MY_USER_DATA_VA038
attr_text {
	Name = .My_User_Section_4v038,
	part_0_ctx_nonzero_tsb_config_3,
	VA = MY_USER_TEXT_VA038,
	RA = MY_USER_TEXT_RA038,
	PA = MY_USER_TEXT_PA038,
	TTE_Context = PCONTEXT,
	TTE_V       = 1,
	TTE_NFO     = 0,
	TTE_L       = 0,
	TTE_Soft    = 0,
	TTE_IE      = 0,
	TTE_E       = 0,
	TTE_CP      = 1,
	TTE_CV      = 0,
	TTE_P       = 0,
	TTE_EP      = 1,
	TTE_W       = 0,
	TTE_SW1     = 0,
	TTE_SW0     = 0,
	TTE_RSVD1   = 0,
	TTE_Size    = 0,
	}
.text
.global user_code_begin_038
user_code_begin_038:
	setx user_data_begin_039, %l1, %l3
	lduw [%l3], %l1
	setx user_code_begin_039, %l1, %l4
	stuw %l4, [%l3]
	jmp  %l4
	nop
	EXIT_BAD


attr_data {
	Name = .My_User_Section_4v038,
	notsb,
	VA = MY_USER_DATA_VA038,
	RA = MY_USER_DATA_RA038,
	PA = MY_USER_DATA_PA038,
	TTE_Context = PCONTEXT,
	TTE_V       = 1,
	TTE_NFO     = 0,
	TTE_L       = 0,
	TTE_Soft    = 0,
	TTE_IE      = 0,
	TTE_E       = 0,
	TTE_CP      = 1,
	TTE_CV      = 0,
	TTE_P       = 0,
	TTE_EP      = 0,
	TTE_W       = 1,
	TTE_SW1     = 0,
	TTE_SW0     = 0,
	TTE_RSVD1   = 0,
	TTE_Size    = 1,
	}
.data
.global user_data_begin_038
user_data_begin_038:
	.word 0xc7cf
	.word 0x7088
	.word 0x9682
	.word 0x167aa


SECTION .My_User_Section_4v039 TEXT_VA=MY_USER_TEXT_VA039, DATA_VA=MY_USER_DATA_VA039
attr_text {
	Name = .My_User_Section_4v039,
	part_0_ctx_nonzero_tsb_config_3,
	VA = MY_USER_TEXT_VA039,
	RA = MY_USER_TEXT_RA039,
	PA = MY_USER_TEXT_PA039,
	TTE_Context = PCONTEXT,
	TTE_V       = 1,
	TTE_NFO     = 0,
	TTE_L       = 0,
	TTE_Soft    = 0,
	TTE_IE      = 0,
	TTE_E       = 0,
	TTE_CP      = 1,
	TTE_CV      = 0,
	TTE_P       = 0,
	TTE_EP      = 1,
	TTE_W       = 0,
	TTE_SW1     = 0,
	TTE_SW0     = 0,
	TTE_RSVD1   = 0,
	TTE_Size    = 0,
	}
.text
.global user_code_begin_039
user_code_begin_039:
	setx user_data_begin_040, %l1, %l3
	lduw [%l3], %l1
	setx user_code_begin_040, %l1, %l4
	stuw %l4, [%l3]
	EXIT_GOOD
	jmp  %l4
	nop
	EXIT_BAD


attr_data {
	Name = .My_User_Section_4v039,
	notsb,
	VA = MY_USER_DATA_VA039,
	RA = MY_USER_DATA_RA039,
	PA = MY_USER_DATA_PA039,
	TTE_Context = PCONTEXT,
	TTE_V       = 1,
	TTE_NFO     = 0,
	TTE_L       = 0,
	TTE_Soft    = 0,
	TTE_IE      = 0,
	TTE_E       = 0,
	TTE_CP      = 1,
	TTE_CV      = 0,
	TTE_P       = 0,
	TTE_EP      = 0,
	TTE_W       = 1,
	TTE_SW1     = 0,
	TTE_SW0     = 0,
	TTE_RSVD1   = 0,
	TTE_Size    = 1,
	}
.data
.global user_data_begin_039
user_data_begin_039:
	.word 0x14cc2
	.word 0x102c8
	.word 0x13bdb
	.word 0x178f5


SECTION .My_User_Section_4v040 TEXT_VA=MY_USER_TEXT_VA040, DATA_VA=MY_USER_DATA_VA040
attr_text {
	Name = .My_User_Section_4v040,
	part_0_ctx_nonzero_tsb_config_3,
	VA = MY_USER_TEXT_VA040,
	RA = MY_USER_TEXT_RA040,
	PA = MY_USER_TEXT_PA040,
	TTE_Context = PCONTEXT,
	TTE_V       = 1,
	TTE_NFO     = 0,
	TTE_L       = 0,
	TTE_Soft    = 0,
	TTE_IE      = 0,
	TTE_E       = 0,
	TTE_CP      = 1,
	TTE_CV      = 0,
	TTE_P       = 0,
	TTE_EP      = 1,
	TTE_W       = 0,
	TTE_SW1     = 0,
	TTE_SW0     = 0,
	TTE_RSVD1   = 0,
	TTE_Size    = 0,
	}
.text
.global user_code_begin_040
user_code_begin_040:
	setx user_data_begin_041, %l1, %l3
	lduw [%l3], %l1
	setx user_code_begin_041, %l1, %l4
	stuw %l4, [%l3]
	jmp  %l4
	nop
	EXIT_BAD


attr_data {
	Name = .My_User_Section_4v040,
	notsb,
	VA = MY_USER_DATA_VA040,
	RA = MY_USER_DATA_RA040,
	PA = MY_USER_DATA_PA040,
	TTE_Context = PCONTEXT,
	TTE_V       = 1,
	TTE_NFO     = 0,
	TTE_L       = 0,
	TTE_Soft    = 0,
	TTE_IE      = 0,
	TTE_E       = 0,
	TTE_CP      = 1,
	TTE_CV      = 0,
	TTE_P       = 0,
	TTE_EP      = 0,
	TTE_W       = 1,
	TTE_SW1     = 0,
	TTE_SW0     = 0,
	TTE_RSVD1   = 0,
	TTE_Size    = 1,
	}
.data
.global user_data_begin_040
user_data_begin_040:
	.word 0xc4d6
	.word 0xb80
	.word 0x16a15
	.word 0xb1df


SECTION .My_User_Section_4v041 TEXT_VA=MY_USER_TEXT_VA041, DATA_VA=MY_USER_DATA_VA041
attr_text {
	Name = .My_User_Section_4v041,
	part_0_ctx_nonzero_tsb_config_3,
	VA = MY_USER_TEXT_VA041,
	RA = MY_USER_TEXT_RA041,
	PA = MY_USER_TEXT_PA041,
	TTE_Context = PCONTEXT,
	TTE_V       = 1,
	TTE_NFO     = 0,
	TTE_L       = 0,
	TTE_Soft    = 0,
	TTE_IE      = 0,
	TTE_E       = 0,
	TTE_CP      = 1,
	TTE_CV      = 0,
	TTE_P       = 0,
	TTE_EP      = 1,
	TTE_W       = 0,
	TTE_SW1     = 0,
	TTE_SW0     = 0,
	TTE_RSVD1   = 0,
	TTE_Size    = 0,
	}
.text
.global user_code_begin_041
user_code_begin_041:
	setx user_data_begin_042, %l1, %l3
	lduw [%l3], %l1
	setx user_code_begin_042, %l1, %l4
	stuw %l4, [%l3]
	jmp  %l4
	nop
	EXIT_BAD


attr_data {
	Name = .My_User_Section_4v041,
	notsb,
	VA = MY_USER_DATA_VA041,
	RA = MY_USER_DATA_RA041,
	PA = MY_USER_DATA_PA041,
	TTE_Context = PCONTEXT,
	TTE_V       = 1,
	TTE_NFO     = 0,
	TTE_L       = 0,
	TTE_Soft    = 0,
	TTE_IE      = 0,
	TTE_E       = 0,
	TTE_CP      = 1,
	TTE_CV      = 0,
	TTE_P       = 0,
	TTE_EP      = 0,
	TTE_W       = 1,
	TTE_SW1     = 0,
	TTE_SW0     = 0,
	TTE_RSVD1   = 0,
	TTE_Size    = 1,
	}
.data
.global user_data_begin_041
user_data_begin_041:
	.word 0x9dca
	.word 0x14ea4
	.word 0x1287d
	.word 0xb3a2


SECTION .My_User_Section_4v042 TEXT_VA=MY_USER_TEXT_VA042, DATA_VA=MY_USER_DATA_VA042
attr_text {
	Name = .My_User_Section_4v042,
	part_0_ctx_nonzero_tsb_config_3,
	VA = MY_USER_TEXT_VA042,
	RA = MY_USER_TEXT_RA042,
	PA = MY_USER_TEXT_PA042,
	TTE_Context = PCONTEXT,
	TTE_V       = 1,
	TTE_NFO     = 0,
	TTE_L       = 0,
	TTE_Soft    = 0,
	TTE_IE      = 0,
	TTE_E       = 0,
	TTE_CP      = 1,
	TTE_CV      = 0,
	TTE_P       = 0,
	TTE_EP      = 1,
	TTE_W       = 0,
	TTE_SW1     = 0,
	TTE_SW0     = 0,
	TTE_RSVD1   = 0,
	TTE_Size    = 0,
	}
.text
.global user_code_begin_042
user_code_begin_042:
	setx user_data_begin_043, %l1, %l3
	lduw [%l3], %l1
	setx user_code_begin_043, %l1, %l4
	stuw %l4, [%l3]
	jmp  %l4
	nop
	EXIT_BAD


attr_data {
	Name = .My_User_Section_4v042,
	notsb,
	VA = MY_USER_DATA_VA042,
	RA = MY_USER_DATA_RA042,
	PA = MY_USER_DATA_PA042,
	TTE_Context = PCONTEXT,
	TTE_V       = 1,
	TTE_NFO     = 0,
	TTE_L       = 0,
	TTE_Soft    = 0,
	TTE_IE      = 0,
	TTE_E       = 0,
	TTE_CP      = 1,
	TTE_CV      = 0,
	TTE_P       = 0,
	TTE_EP      = 0,
	TTE_W       = 1,
	TTE_SW1     = 0,
	TTE_SW0     = 0,
	TTE_RSVD1   = 0,
	TTE_Size    = 1,
	}
.data
.global user_data_begin_042
user_data_begin_042:
	.word 0x78da
	.word 0xa669
	.word 0xf84c
	.word 0xab5


SECTION .My_User_Section_4v043 TEXT_VA=MY_USER_TEXT_VA043, DATA_VA=MY_USER_DATA_VA043
attr_text {
	Name = .My_User_Section_4v043,
	part_0_ctx_nonzero_tsb_config_3,
	VA = MY_USER_TEXT_VA043,
	RA = MY_USER_TEXT_RA043,
	PA = MY_USER_TEXT_PA043,
	TTE_Context = PCONTEXT,
	TTE_V       = 1,
	TTE_NFO     = 0,
	TTE_L       = 0,
	TTE_Soft    = 0,
	TTE_IE      = 0,
	TTE_E       = 0,
	TTE_CP      = 1,
	TTE_CV      = 0,
	TTE_P       = 0,
	TTE_EP      = 1,
	TTE_W       = 0,
	TTE_SW1     = 0,
	TTE_SW0     = 0,
	TTE_RSVD1   = 0,
	TTE_Size    = 0,
	}
.text
.global user_code_begin_043
user_code_begin_043:
	setx user_data_begin_044, %l1, %l3
	lduw [%l3], %l1
	setx user_code_begin_044, %l1, %l4
	stuw %l4, [%l3]
	jmp  %l4
	nop
	EXIT_BAD


attr_data {
	Name = .My_User_Section_4v043,
	notsb,
	VA = MY_USER_DATA_VA043,
	RA = MY_USER_DATA_RA043,
	PA = MY_USER_DATA_PA043,
	TTE_Context = PCONTEXT,
	TTE_V       = 1,
	TTE_NFO     = 0,
	TTE_L       = 0,
	TTE_Soft    = 0,
	TTE_IE      = 0,
	TTE_E       = 0,
	TTE_CP      = 1,
	TTE_CV      = 0,
	TTE_P       = 0,
	TTE_EP      = 0,
	TTE_W       = 1,
	TTE_SW1     = 0,
	TTE_SW0     = 0,
	TTE_RSVD1   = 0,
	TTE_Size    = 1,
	}
.data
.global user_data_begin_043
user_data_begin_043:
	.word 0xea21
	.word 0x3234
	.word 0x782
	.word 0x291c


SECTION .My_User_Section_4v044 TEXT_VA=MY_USER_TEXT_VA044, DATA_VA=MY_USER_DATA_VA044
attr_text {
	Name = .My_User_Section_4v044,
	part_0_ctx_nonzero_tsb_config_3,
	VA = MY_USER_TEXT_VA044,
	RA = MY_USER_TEXT_RA044,
	PA = MY_USER_TEXT_PA044,
	TTE_Context = PCONTEXT,
	TTE_V       = 1,
	TTE_NFO     = 0,
	TTE_L       = 0,
	TTE_Soft    = 0,
	TTE_IE      = 0,
	TTE_E       = 0,
	TTE_CP      = 1,
	TTE_CV      = 0,
	TTE_P       = 0,
	TTE_EP      = 1,
	TTE_W       = 0,
	TTE_SW1     = 0,
	TTE_SW0     = 0,
	TTE_RSVD1   = 0,
	TTE_Size    = 0,
	}
.text
.global user_code_begin_044
user_code_begin_044:
	setx user_data_begin_045, %l1, %l3
	lduw [%l3], %l1
	setx user_code_begin_045, %l1, %l4
	stuw %l4, [%l3]
	jmp  %l4
	nop
	EXIT_BAD


attr_data {
	Name = .My_User_Section_4v044,
	notsb,
	VA = MY_USER_DATA_VA044,
	RA = MY_USER_DATA_RA044,
	PA = MY_USER_DATA_PA044,
	TTE_Context = PCONTEXT,
	TTE_V       = 1,
	TTE_NFO     = 0,
	TTE_L       = 0,
	TTE_Soft    = 0,
	TTE_IE      = 0,
	TTE_E       = 0,
	TTE_CP      = 1,
	TTE_CV      = 0,
	TTE_P       = 0,
	TTE_EP      = 0,
	TTE_W       = 1,
	TTE_SW1     = 0,
	TTE_SW0     = 0,
	TTE_RSVD1   = 0,
	TTE_Size    = 1,
	}
.data
.global user_data_begin_044
user_data_begin_044:
	.word 0x5319
	.word 0xa808
	.word 0xd0a
	.word 0xb851


SECTION .My_User_Section_4v045 TEXT_VA=MY_USER_TEXT_VA045, DATA_VA=MY_USER_DATA_VA045
attr_text {
	Name = .My_User_Section_4v045,
	part_0_ctx_nonzero_tsb_config_3,
	VA = MY_USER_TEXT_VA045,
	RA = MY_USER_TEXT_RA045,
	PA = MY_USER_TEXT_PA045,
	TTE_Context = PCONTEXT,
	TTE_V       = 1,
	TTE_NFO     = 0,
	TTE_L       = 0,
	TTE_Soft    = 0,
	TTE_IE      = 0,
	TTE_E       = 0,
	TTE_CP      = 1,
	TTE_CV      = 0,
	TTE_P       = 0,
	TTE_EP      = 1,
	TTE_W       = 0,
	TTE_SW1     = 0,
	TTE_SW0     = 0,
	TTE_RSVD1   = 0,
	TTE_Size    = 0,
	}
.text
.global user_code_begin_045
user_code_begin_045:
	setx user_data_begin_046, %l1, %l3
	lduw [%l3], %l1
	setx user_code_begin_046, %l1, %l4
	stuw %l4, [%l3]
	jmp  %l4
	nop
	EXIT_BAD


attr_data {
	Name = .My_User_Section_4v045,
	notsb,
	VA = MY_USER_DATA_VA045,
	RA = MY_USER_DATA_RA045,
	PA = MY_USER_DATA_PA045,
	TTE_Context = PCONTEXT,
	TTE_V       = 1,
	TTE_NFO     = 0,
	TTE_L       = 0,
	TTE_Soft    = 0,
	TTE_IE      = 0,
	TTE_E       = 0,
	TTE_CP      = 1,
	TTE_CV      = 0,
	TTE_P       = 0,
	TTE_EP      = 0,
	TTE_W       = 1,
	TTE_SW1     = 0,
	TTE_SW0     = 0,
	TTE_RSVD1   = 0,
	TTE_Size    = 1,
	}
.data
.global user_data_begin_045
user_data_begin_045:
	.word 0x17a9f
	.word 0xabe0
	.word 0x5176
	.word 0x37bb


SECTION .My_User_Section_4v046 TEXT_VA=MY_USER_TEXT_VA046, DATA_VA=MY_USER_DATA_VA046
attr_text {
	Name = .My_User_Section_4v046,
	part_0_ctx_nonzero_tsb_config_3,
	VA = MY_USER_TEXT_VA046,
	RA = MY_USER_TEXT_RA046,
	PA = MY_USER_TEXT_PA046,
	TTE_Context = PCONTEXT,
	TTE_V       = 1,
	TTE_NFO     = 0,
	TTE_L       = 0,
	TTE_Soft    = 0,
	TTE_IE      = 0,
	TTE_E       = 0,
	TTE_CP      = 1,
	TTE_CV      = 0,
	TTE_P       = 0,
	TTE_EP      = 1,
	TTE_W       = 0,
	TTE_SW1     = 0,
	TTE_SW0     = 0,
	TTE_RSVD1   = 0,
	TTE_Size    = 0,
	}
.text
.global user_code_begin_046
user_code_begin_046:
	setx user_data_begin_047, %l1, %l3
	lduw [%l3], %l1
	setx user_code_begin_047, %l1, %l4
	stuw %l4, [%l3]
	jmp  %l4
	nop
	EXIT_BAD


attr_data {
	Name = .My_User_Section_4v046,
	notsb,
	VA = MY_USER_DATA_VA046,
	RA = MY_USER_DATA_RA046,
	PA = MY_USER_DATA_PA046,
	TTE_Context = PCONTEXT,
	TTE_V       = 1,
	TTE_NFO     = 0,
	TTE_L       = 0,
	TTE_Soft    = 0,
	TTE_IE      = 0,
	TTE_E       = 0,
	TTE_CP      = 1,
	TTE_CV      = 0,
	TTE_P       = 0,
	TTE_EP      = 0,
	TTE_W       = 1,
	TTE_SW1     = 0,
	TTE_SW0     = 0,
	TTE_RSVD1   = 0,
	TTE_Size    = 1,
	}
.data
.global user_data_begin_046
user_data_begin_046:
	.word 0xa023
	.word 0xedb6
	.word 0x26e5
	.word 0x1427d


SECTION .My_User_Section_4v047 TEXT_VA=MY_USER_TEXT_VA047, DATA_VA=MY_USER_DATA_VA047
attr_text {
	Name = .My_User_Section_4v047,
	part_0_ctx_nonzero_tsb_config_3,
	VA = MY_USER_TEXT_VA047,
	RA = MY_USER_TEXT_RA047,
	PA = MY_USER_TEXT_PA047,
	TTE_Context = PCONTEXT,
	TTE_V       = 1,
	TTE_NFO     = 0,
	TTE_L       = 0,
	TTE_Soft    = 0,
	TTE_IE      = 0,
	TTE_E       = 0,
	TTE_CP      = 1,
	TTE_CV      = 0,
	TTE_P       = 0,
	TTE_EP      = 1,
	TTE_W       = 0,
	TTE_SW1     = 0,
	TTE_SW0     = 0,
	TTE_RSVD1   = 0,
	TTE_Size    = 0,
	}
.text
.global user_code_begin_047
user_code_begin_047:
	setx user_data_begin_048, %l1, %l3
	lduw [%l3], %l1
	setx user_code_begin_048, %l1, %l4
	stuw %l4, [%l3]
	jmp  %l4
	nop
	EXIT_BAD


attr_data {
	Name = .My_User_Section_4v047,
	notsb,
	VA = MY_USER_DATA_VA047,
	RA = MY_USER_DATA_RA047,
	PA = MY_USER_DATA_PA047,
	TTE_Context = PCONTEXT,
	TTE_V       = 1,
	TTE_NFO     = 0,
	TTE_L       = 0,
	TTE_Soft    = 0,
	TTE_IE      = 0,
	TTE_E       = 0,
	TTE_CP      = 1,
	TTE_CV      = 0,
	TTE_P       = 0,
	TTE_EP      = 0,
	TTE_W       = 1,
	TTE_SW1     = 0,
	TTE_SW0     = 0,
	TTE_RSVD1   = 0,
	TTE_Size    = 1,
	}
.data
.global user_data_begin_047
user_data_begin_047:
	.word 0x11283
	.word 0xcbdc
	.word 0x3b4b
	.word 0x15739


SECTION .My_User_Section_4v048 TEXT_VA=MY_USER_TEXT_VA048, DATA_VA=MY_USER_DATA_VA048
attr_text {
	Name = .My_User_Section_4v048,
	part_0_ctx_nonzero_tsb_config_3,
	VA = MY_USER_TEXT_VA048,
	RA = MY_USER_TEXT_RA048,
	PA = MY_USER_TEXT_PA048,
	TTE_Context = PCONTEXT,
	TTE_V       = 1,
	TTE_NFO     = 0,
	TTE_L       = 0,
	TTE_Soft    = 0,
	TTE_IE      = 0,
	TTE_E       = 0,
	TTE_CP      = 1,
	TTE_CV      = 0,
	TTE_P       = 0,
	TTE_EP      = 1,
	TTE_W       = 0,
	TTE_SW1     = 0,
	TTE_SW0     = 0,
	TTE_RSVD1   = 0,
	TTE_Size    = 0,
	}
.text
.global user_code_begin_048
user_code_begin_048:
	setx user_data_begin_049, %l1, %l3
	lduw [%l3], %l1
	setx user_code_begin_049, %l1, %l4
	stuw %l4, [%l3]
	jmp  %l4
	nop
	EXIT_BAD


attr_data {
	Name = .My_User_Section_4v048,
	notsb,
	VA = MY_USER_DATA_VA048,
	RA = MY_USER_DATA_RA048,
	PA = MY_USER_DATA_PA048,
	TTE_Context = PCONTEXT,
	TTE_V       = 1,
	TTE_NFO     = 0,
	TTE_L       = 0,
	TTE_Soft    = 0,
	TTE_IE      = 0,
	TTE_E       = 0,
	TTE_CP      = 1,
	TTE_CV      = 0,
	TTE_P       = 0,
	TTE_EP      = 0,
	TTE_W       = 1,
	TTE_SW1     = 0,
	TTE_SW0     = 0,
	TTE_RSVD1   = 0,
	TTE_Size    = 1,
	}
.data
.global user_data_begin_048
user_data_begin_048:
	.word 0x8e3d
	.word 0x9df
	.word 0x95c9
	.word 0x13ef1


SECTION .My_User_Section_4v049 TEXT_VA=MY_USER_TEXT_VA049, DATA_VA=MY_USER_DATA_VA049
attr_text {
	Name = .My_User_Section_4v049,
	part_0_ctx_nonzero_tsb_config_3,
	VA = MY_USER_TEXT_VA049,
	RA = MY_USER_TEXT_RA049,
	PA = MY_USER_TEXT_PA049,
	TTE_Context = PCONTEXT,
	TTE_V       = 1,
	TTE_NFO     = 0,
	TTE_L       = 0,
	TTE_Soft    = 0,
	TTE_IE      = 0,
	TTE_E       = 0,
	TTE_CP      = 1,
	TTE_CV      = 0,
	TTE_P       = 0,
	TTE_EP      = 1,
	TTE_W       = 0,
	TTE_SW1     = 0,
	TTE_SW0     = 0,
	TTE_RSVD1   = 0,
	TTE_Size    = 0,
	}
.text
.global user_code_begin_049
user_code_begin_049:
	setx user_data_begin_050, %l1, %l3
	lduw [%l3], %l1
	setx user_code_begin_050, %l1, %l4
	stuw %l4, [%l3]
	jmp  %l4
	nop
	EXIT_BAD


attr_data {
	Name = .My_User_Section_4v049,
	notsb,
	VA = MY_USER_DATA_VA049,
	RA = MY_USER_DATA_RA049,
	PA = MY_USER_DATA_PA049,
	TTE_Context = PCONTEXT,
	TTE_V       = 1,
	TTE_NFO     = 0,
	TTE_L       = 0,
	TTE_Soft    = 0,
	TTE_IE      = 0,
	TTE_E       = 0,
	TTE_CP      = 1,
	TTE_CV      = 0,
	TTE_P       = 0,
	TTE_EP      = 0,
	TTE_W       = 1,
	TTE_SW1     = 0,
	TTE_SW0     = 0,
	TTE_RSVD1   = 0,
	TTE_Size    = 1,
	}
.data
.global user_data_begin_049
user_data_begin_049:
	.word 0x15bf6
	.word 0xc64d
	.word 0x57a7
	.word 0x142aa


SECTION .My_User_Section_4v050 TEXT_VA=MY_USER_TEXT_VA050, DATA_VA=MY_USER_DATA_VA050
attr_text {
	Name = .My_User_Section_4v050,
	part_0_ctx_nonzero_tsb_config_3,
	VA = MY_USER_TEXT_VA050,
	RA = MY_USER_TEXT_RA050,
	PA = MY_USER_TEXT_PA050,
	TTE_Context = PCONTEXT,
	TTE_V       = 1,
	TTE_NFO     = 0,
	TTE_L       = 0,
	TTE_Soft    = 0,
	TTE_IE      = 0,
	TTE_E       = 0,
	TTE_CP      = 1,
	TTE_CV      = 0,
	TTE_P       = 0,
	TTE_EP      = 1,
	TTE_W       = 0,
	TTE_SW1     = 0,
	TTE_SW0     = 0,
	TTE_RSVD1   = 0,
	TTE_Size    = 0,
	}
.text
.global user_code_begin_050
user_code_begin_050:
	setx user_data_begin_051, %l1, %l3
	lduw [%l3], %l1
	setx user_code_begin_051, %l1, %l4
	stuw %l4, [%l3]
	jmp  %l4
	nop
	EXIT_BAD


attr_data {
	Name = .My_User_Section_4v050,
	notsb,
	VA = MY_USER_DATA_VA050,
	RA = MY_USER_DATA_RA050,
	PA = MY_USER_DATA_PA050,
	TTE_Context = PCONTEXT,
	TTE_V       = 1,
	TTE_NFO     = 0,
	TTE_L       = 0,
	TTE_Soft    = 0,
	TTE_IE      = 0,
	TTE_E       = 0,
	TTE_CP      = 1,
	TTE_CV      = 0,
	TTE_P       = 0,
	TTE_EP      = 0,
	TTE_W       = 1,
	TTE_SW1     = 0,
	TTE_SW0     = 0,
	TTE_RSVD1   = 0,
	TTE_Size    = 1,
	}
.data
.global user_data_begin_050
user_data_begin_050:
	.word 0xd9fa
	.word 0x91cd
	.word 0x128d4
	.word 0xbc14


SECTION .My_User_Section_4v051 TEXT_VA=MY_USER_TEXT_VA051, DATA_VA=MY_USER_DATA_VA051
attr_text {
	Name = .My_User_Section_4v051,
	part_0_ctx_nonzero_tsb_config_3,
	VA = MY_USER_TEXT_VA051,
	RA = MY_USER_TEXT_RA051,
	PA = MY_USER_TEXT_PA051,
	TTE_Context = PCONTEXT,
	TTE_V       = 1,
	TTE_NFO     = 0,
	TTE_L       = 0,
	TTE_Soft    = 0,
	TTE_IE      = 0,
	TTE_E       = 0,
	TTE_CP      = 1,
	TTE_CV      = 0,
	TTE_P       = 0,
	TTE_EP      = 1,
	TTE_W       = 0,
	TTE_SW1     = 0,
	TTE_SW0     = 0,
	TTE_RSVD1   = 0,
	TTE_Size    = 0,
	}
.text
.global user_code_begin_051
user_code_begin_051:
	setx user_data_begin_052, %l1, %l3
	lduw [%l3], %l1
	setx user_code_begin_052, %l1, %l4
	stuw %l4, [%l3]
	jmp  %l4
	nop
	EXIT_BAD


attr_data {
	Name = .My_User_Section_4v051,
	notsb,
	VA = MY_USER_DATA_VA051,
	RA = MY_USER_DATA_RA051,
	PA = MY_USER_DATA_PA051,
	TTE_Context = PCONTEXT,
	TTE_V       = 1,
	TTE_NFO     = 0,
	TTE_L       = 0,
	TTE_Soft    = 0,
	TTE_IE      = 0,
	TTE_E       = 0,
	TTE_CP      = 1,
	TTE_CV      = 0,
	TTE_P       = 0,
	TTE_EP      = 0,
	TTE_W       = 1,
	TTE_SW1     = 0,
	TTE_SW0     = 0,
	TTE_RSVD1   = 0,
	TTE_Size    = 1,
	}
.data
.global user_data_begin_051
user_data_begin_051:
	.word 0x15651
	.word 0x1388c
	.word 0x16f0f
	.word 0x9c1


SECTION .My_User_Section_4v052 TEXT_VA=MY_USER_TEXT_VA052, DATA_VA=MY_USER_DATA_VA052
attr_text {
	Name = .My_User_Section_4v052,
	part_0_ctx_nonzero_tsb_config_3,
	VA = MY_USER_TEXT_VA052,
	RA = MY_USER_TEXT_RA052,
	PA = MY_USER_TEXT_PA052,
	TTE_Context = PCONTEXT,
	TTE_V       = 1,
	TTE_NFO     = 0,
	TTE_L       = 0,
	TTE_Soft    = 0,
	TTE_IE      = 0,
	TTE_E       = 0,
	TTE_CP      = 1,
	TTE_CV      = 0,
	TTE_P       = 0,
	TTE_EP      = 1,
	TTE_W       = 0,
	TTE_SW1     = 0,
	TTE_SW0     = 0,
	TTE_RSVD1   = 0,
	TTE_Size    = 0,
	}
.text
.global user_code_begin_052
user_code_begin_052:
	setx user_data_begin_053, %l1, %l3
	lduw [%l3], %l1
	setx user_code_begin_053, %l1, %l4
	stuw %l4, [%l3]
	jmp  %l4
	nop
	EXIT_BAD


attr_data {
	Name = .My_User_Section_4v052,
	notsb,
	VA = MY_USER_DATA_VA052,
	RA = MY_USER_DATA_RA052,
	PA = MY_USER_DATA_PA052,
	TTE_Context = PCONTEXT,
	TTE_V       = 1,
	TTE_NFO     = 0,
	TTE_L       = 0,
	TTE_Soft    = 0,
	TTE_IE      = 0,
	TTE_E       = 0,
	TTE_CP      = 1,
	TTE_CV      = 0,
	TTE_P       = 0,
	TTE_EP      = 0,
	TTE_W       = 1,
	TTE_SW1     = 0,
	TTE_SW0     = 0,
	TTE_RSVD1   = 0,
	TTE_Size    = 1,
	}
.data
.global user_data_begin_052
user_data_begin_052:
	.word 0xe55b
	.word 0x969d
	.word 0x5dcf
	.word 0x58de


SECTION .My_User_Section_4v053 TEXT_VA=MY_USER_TEXT_VA053, DATA_VA=MY_USER_DATA_VA053
attr_text {
	Name = .My_User_Section_4v053,
	part_0_ctx_nonzero_tsb_config_3,
	VA = MY_USER_TEXT_VA053,
	RA = MY_USER_TEXT_RA053,
	PA = MY_USER_TEXT_PA053,
	TTE_Context = PCONTEXT,
	TTE_V       = 1,
	TTE_NFO     = 0,
	TTE_L       = 0,
	TTE_Soft    = 0,
	TTE_IE      = 0,
	TTE_E       = 0,
	TTE_CP      = 1,
	TTE_CV      = 0,
	TTE_P       = 0,
	TTE_EP      = 1,
	TTE_W       = 0,
	TTE_SW1     = 0,
	TTE_SW0     = 0,
	TTE_RSVD1   = 0,
	TTE_Size    = 0,
	}
.text
.global user_code_begin_053
user_code_begin_053:
	setx user_data_begin_054, %l1, %l3
	lduw [%l3], %l1
	setx user_code_begin_054, %l1, %l4
	stuw %l4, [%l3]
	jmp  %l4
	nop
	EXIT_BAD


attr_data {
	Name = .My_User_Section_4v053,
	notsb,
	VA = MY_USER_DATA_VA053,
	RA = MY_USER_DATA_RA053,
	PA = MY_USER_DATA_PA053,
	TTE_Context = PCONTEXT,
	TTE_V       = 1,
	TTE_NFO     = 0,
	TTE_L       = 0,
	TTE_Soft    = 0,
	TTE_IE      = 0,
	TTE_E       = 0,
	TTE_CP      = 1,
	TTE_CV      = 0,
	TTE_P       = 0,
	TTE_EP      = 0,
	TTE_W       = 1,
	TTE_SW1     = 0,
	TTE_SW0     = 0,
	TTE_RSVD1   = 0,
	TTE_Size    = 1,
	}
.data
.global user_data_begin_053
user_data_begin_053:
	.word 0x13334
	.word 0x695e
	.word 0x5a49
	.word 0x3373


SECTION .My_User_Section_4v054 TEXT_VA=MY_USER_TEXT_VA054, DATA_VA=MY_USER_DATA_VA054
attr_text {
	Name = .My_User_Section_4v054,
	part_0_ctx_nonzero_tsb_config_3,
	VA = MY_USER_TEXT_VA054,
	RA = MY_USER_TEXT_RA054,
	PA = MY_USER_TEXT_PA054,
	TTE_Context = PCONTEXT,
	TTE_V       = 1,
	TTE_NFO     = 0,
	TTE_L       = 0,
	TTE_Soft    = 0,
	TTE_IE      = 0,
	TTE_E       = 0,
	TTE_CP      = 1,
	TTE_CV      = 0,
	TTE_P       = 0,
	TTE_EP      = 1,
	TTE_W       = 0,
	TTE_SW1     = 0,
	TTE_SW0     = 0,
	TTE_RSVD1   = 0,
	TTE_Size    = 0,
	}
.text
.global user_code_begin_054
user_code_begin_054:
	setx user_data_begin_055, %l1, %l3
	lduw [%l3], %l1
	setx user_code_begin_055, %l1, %l4
	stuw %l4, [%l3]
	jmp  %l4
	nop
	EXIT_BAD


attr_data {
	Name = .My_User_Section_4v054,
	notsb,
	VA = MY_USER_DATA_VA054,
	RA = MY_USER_DATA_RA054,
	PA = MY_USER_DATA_PA054,
	TTE_Context = PCONTEXT,
	TTE_V       = 1,
	TTE_NFO     = 0,
	TTE_L       = 0,
	TTE_Soft    = 0,
	TTE_IE      = 0,
	TTE_E       = 0,
	TTE_CP      = 1,
	TTE_CV      = 0,
	TTE_P       = 0,
	TTE_EP      = 0,
	TTE_W       = 1,
	TTE_SW1     = 0,
	TTE_SW0     = 0,
	TTE_RSVD1   = 0,
	TTE_Size    = 1,
	}
.data
.global user_data_begin_054
user_data_begin_054:
	.word 0x6c52
	.word 0xf941
	.word 0x90de
	.word 0xb234


SECTION .My_User_Section_4v055 TEXT_VA=MY_USER_TEXT_VA055, DATA_VA=MY_USER_DATA_VA055
attr_text {
	Name = .My_User_Section_4v055,
	part_0_ctx_nonzero_tsb_config_3,
	VA = MY_USER_TEXT_VA055,
	RA = MY_USER_TEXT_RA055,
	PA = MY_USER_TEXT_PA055,
	TTE_Context = PCONTEXT,
	TTE_V       = 1,
	TTE_NFO     = 0,
	TTE_L       = 0,
	TTE_Soft    = 0,
	TTE_IE      = 0,
	TTE_E       = 0,
	TTE_CP      = 1,
	TTE_CV      = 0,
	TTE_P       = 0,
	TTE_EP      = 1,
	TTE_W       = 0,
	TTE_SW1     = 0,
	TTE_SW0     = 0,
	TTE_RSVD1   = 0,
	TTE_Size    = 0,
	}
.text
.global user_code_begin_055
user_code_begin_055:
	setx user_data_begin_056, %l1, %l3
	lduw [%l3], %l1
	setx user_code_begin_056, %l1, %l4
	stuw %l4, [%l3]
	jmp  %l4
	nop
	EXIT_BAD


attr_data {
	Name = .My_User_Section_4v055,
	notsb,
	VA = MY_USER_DATA_VA055,
	RA = MY_USER_DATA_RA055,
	PA = MY_USER_DATA_PA055,
	TTE_Context = PCONTEXT,
	TTE_V       = 1,
	TTE_NFO     = 0,
	TTE_L       = 0,
	TTE_Soft    = 0,
	TTE_IE      = 0,
	TTE_E       = 0,
	TTE_CP      = 1,
	TTE_CV      = 0,
	TTE_P       = 0,
	TTE_EP      = 0,
	TTE_W       = 1,
	TTE_SW1     = 0,
	TTE_SW0     = 0,
	TTE_RSVD1   = 0,
	TTE_Size    = 1,
	}
.data
.global user_data_begin_055
user_data_begin_055:
	.word 0xf99d
	.word 0x17e17
	.word 0x11466
	.word 0x7911


SECTION .My_User_Section_4v056 TEXT_VA=MY_USER_TEXT_VA056, DATA_VA=MY_USER_DATA_VA056
attr_text {
	Name = .My_User_Section_4v056,
	part_0_ctx_nonzero_tsb_config_3,
	VA = MY_USER_TEXT_VA056,
	RA = MY_USER_TEXT_RA056,
	PA = MY_USER_TEXT_PA056,
	TTE_Context = PCONTEXT,
	TTE_V       = 1,
	TTE_NFO     = 0,
	TTE_L       = 0,
	TTE_Soft    = 0,
	TTE_IE      = 0,
	TTE_E       = 0,
	TTE_CP      = 1,
	TTE_CV      = 0,
	TTE_P       = 0,
	TTE_EP      = 1,
	TTE_W       = 0,
	TTE_SW1     = 0,
	TTE_SW0     = 0,
	TTE_RSVD1   = 0,
	TTE_Size    = 0,
	}
.text
.global user_code_begin_056
user_code_begin_056:
	setx user_data_begin_057, %l1, %l3
	lduw [%l3], %l1
	setx user_code_begin_057, %l1, %l4
	stuw %l4, [%l3]
	jmp  %l4
	nop
	EXIT_BAD


attr_data {
	Name = .My_User_Section_4v056,
	notsb,
	VA = MY_USER_DATA_VA056,
	RA = MY_USER_DATA_RA056,
	PA = MY_USER_DATA_PA056,
	TTE_Context = PCONTEXT,
	TTE_V       = 1,
	TTE_NFO     = 0,
	TTE_L       = 0,
	TTE_Soft    = 0,
	TTE_IE      = 0,
	TTE_E       = 0,
	TTE_CP      = 1,
	TTE_CV      = 0,
	TTE_P       = 0,
	TTE_EP      = 0,
	TTE_W       = 1,
	TTE_SW1     = 0,
	TTE_SW0     = 0,
	TTE_RSVD1   = 0,
	TTE_Size    = 1,
	}
.data
.global user_data_begin_056
user_data_begin_056:
	.word 0xffee
	.word 0x53e1
	.word 0xd01d
	.word 0x51a7


SECTION .My_User_Section_4v057 TEXT_VA=MY_USER_TEXT_VA057, DATA_VA=MY_USER_DATA_VA057
attr_text {
	Name = .My_User_Section_4v057,
	part_0_ctx_nonzero_tsb_config_3,
	VA = MY_USER_TEXT_VA057,
	RA = MY_USER_TEXT_RA057,
	PA = MY_USER_TEXT_PA057,
	TTE_Context = PCONTEXT,
	TTE_V       = 1,
	TTE_NFO     = 0,
	TTE_L       = 0,
	TTE_Soft    = 0,
	TTE_IE      = 0,
	TTE_E       = 0,
	TTE_CP      = 1,
	TTE_CV      = 0,
	TTE_P       = 0,
	TTE_EP      = 1,
	TTE_W       = 0,
	TTE_SW1     = 0,
	TTE_SW0     = 0,
	TTE_RSVD1   = 0,
	TTE_Size    = 0,
	}
.text
.global user_code_begin_057
user_code_begin_057:
	setx user_data_begin_058, %l1, %l3
	lduw [%l3], %l1
	setx user_code_begin_058, %l1, %l4
	stuw %l4, [%l3]
	jmp  %l4
	nop
	EXIT_BAD


attr_data {
	Name = .My_User_Section_4v057,
	notsb,
	VA = MY_USER_DATA_VA057,
	RA = MY_USER_DATA_RA057,
	PA = MY_USER_DATA_PA057,
	TTE_Context = PCONTEXT,
	TTE_V       = 1,
	TTE_NFO     = 0,
	TTE_L       = 0,
	TTE_Soft    = 0,
	TTE_IE      = 0,
	TTE_E       = 0,
	TTE_CP      = 1,
	TTE_CV      = 0,
	TTE_P       = 0,
	TTE_EP      = 0,
	TTE_W       = 1,
	TTE_SW1     = 0,
	TTE_SW0     = 0,
	TTE_RSVD1   = 0,
	TTE_Size    = 1,
	}
.data
.global user_data_begin_057
user_data_begin_057:
	.word 0xfa79
	.word 0xc1f2
	.word 0x36f5
	.word 0xaaac


SECTION .My_User_Section_4v058 TEXT_VA=MY_USER_TEXT_VA058, DATA_VA=MY_USER_DATA_VA058
attr_text {
	Name = .My_User_Section_4v058,
	part_0_ctx_nonzero_tsb_config_3,
	VA = MY_USER_TEXT_VA058,
	RA = MY_USER_TEXT_RA058,
	PA = MY_USER_TEXT_PA058,
	TTE_Context = PCONTEXT,
	TTE_V       = 1,
	TTE_NFO     = 0,
	TTE_L       = 0,
	TTE_Soft    = 0,
	TTE_IE      = 0,
	TTE_E       = 0,
	TTE_CP      = 1,
	TTE_CV      = 0,
	TTE_P       = 0,
	TTE_EP      = 1,
	TTE_W       = 0,
	TTE_SW1     = 0,
	TTE_SW0     = 0,
	TTE_RSVD1   = 0,
	TTE_Size    = 0,
	}
.text
.global user_code_begin_058
user_code_begin_058:
	setx user_data_begin_059, %l1, %l3
	lduw [%l3], %l1
	setx user_code_begin_059, %l1, %l4
	stuw %l4, [%l3]
	jmp  %l4
	nop
	EXIT_BAD


attr_data {
	Name = .My_User_Section_4v058,
	notsb,
	VA = MY_USER_DATA_VA058,
	RA = MY_USER_DATA_RA058,
	PA = MY_USER_DATA_PA058,
	TTE_Context = PCONTEXT,
	TTE_V       = 1,
	TTE_NFO     = 0,
	TTE_L       = 0,
	TTE_Soft    = 0,
	TTE_IE      = 0,
	TTE_E       = 0,
	TTE_CP      = 1,
	TTE_CV      = 0,
	TTE_P       = 0,
	TTE_EP      = 0,
	TTE_W       = 1,
	TTE_SW1     = 0,
	TTE_SW0     = 0,
	TTE_RSVD1   = 0,
	TTE_Size    = 1,
	}
.data
.global user_data_begin_058
user_data_begin_058:
	.word 0x3bcf
	.word 0x8823
	.word 0x15a00
	.word 0x3db3


SECTION .My_User_Section_4v059 TEXT_VA=MY_USER_TEXT_VA059, DATA_VA=MY_USER_DATA_VA059
attr_text {
	Name = .My_User_Section_4v059,
	part_0_ctx_nonzero_tsb_config_3,
	VA = MY_USER_TEXT_VA059,
	RA = MY_USER_TEXT_RA059,
	PA = MY_USER_TEXT_PA059,
	TTE_Context = PCONTEXT,
	TTE_V       = 1,
	TTE_NFO     = 0,
	TTE_L       = 0,
	TTE_Soft    = 0,
	TTE_IE      = 0,
	TTE_E       = 0,
	TTE_CP      = 1,
	TTE_CV      = 0,
	TTE_P       = 0,
	TTE_EP      = 1,
	TTE_W       = 0,
	TTE_SW1     = 0,
	TTE_SW0     = 0,
	TTE_RSVD1   = 0,
	TTE_Size    = 0,
	}
.text
.global user_code_begin_059
user_code_begin_059:
	setx user_data_begin_060, %l1, %l3
	lduw [%l3], %l1
	setx user_code_begin_060, %l1, %l4
	stuw %l4, [%l3]
	jmp  %l4
	nop
	EXIT_BAD


attr_data {
	Name = .My_User_Section_4v059,
	notsb,
	VA = MY_USER_DATA_VA059,
	RA = MY_USER_DATA_RA059,
	PA = MY_USER_DATA_PA059,
	TTE_Context = PCONTEXT,
	TTE_V       = 1,
	TTE_NFO     = 0,
	TTE_L       = 0,
	TTE_Soft    = 0,
	TTE_IE      = 0,
	TTE_E       = 0,
	TTE_CP      = 1,
	TTE_CV      = 0,
	TTE_P       = 0,
	TTE_EP      = 0,
	TTE_W       = 1,
	TTE_SW1     = 0,
	TTE_SW0     = 0,
	TTE_RSVD1   = 0,
	TTE_Size    = 1,
	}
.data
.global user_data_begin_059
user_data_begin_059:
	.word 0xa64c
	.word 0xd520
	.word 0xe35a
	.word 0xfc31


SECTION .My_User_Section_4v060 TEXT_VA=MY_USER_TEXT_VA060, DATA_VA=MY_USER_DATA_VA060
attr_text {
	Name = .My_User_Section_4v060,
	part_0_ctx_nonzero_tsb_config_3,
	VA = MY_USER_TEXT_VA060,
	RA = MY_USER_TEXT_RA060,
	PA = MY_USER_TEXT_PA060,
	TTE_Context = PCONTEXT,
	TTE_V       = 1,
	TTE_NFO     = 0,
	TTE_L       = 0,
	TTE_Soft    = 0,
	TTE_IE      = 0,
	TTE_E       = 0,
	TTE_CP      = 1,
	TTE_CV      = 0,
	TTE_P       = 0,
	TTE_EP      = 1,
	TTE_W       = 0,
	TTE_SW1     = 0,
	TTE_SW0     = 0,
	TTE_RSVD1   = 0,
	TTE_Size    = 0,
	}
.text
.global user_code_begin_060
user_code_begin_060:
	setx user_data_begin_061, %l1, %l3
	lduw [%l3], %l1
	setx user_code_begin_061, %l1, %l4
	stuw %l4, [%l3]
	jmp  %l4
	nop
	EXIT_BAD


attr_data {
	Name = .My_User_Section_4v060,
	notsb,
	VA = MY_USER_DATA_VA060,
	RA = MY_USER_DATA_RA060,
	PA = MY_USER_DATA_PA060,
	TTE_Context = PCONTEXT,
	TTE_V       = 1,
	TTE_NFO     = 0,
	TTE_L       = 0,
	TTE_Soft    = 0,
	TTE_IE      = 0,
	TTE_E       = 0,
	TTE_CP      = 1,
	TTE_CV      = 0,
	TTE_P       = 0,
	TTE_EP      = 0,
	TTE_W       = 1,
	TTE_SW1     = 0,
	TTE_SW0     = 0,
	TTE_RSVD1   = 0,
	TTE_Size    = 1,
	}
.data
.global user_data_begin_060
user_data_begin_060:
	.word 0x96fc
	.word 0x1cf8
	.word 0x1374e
	.word 0x1046b


SECTION .My_User_Section_4v061 TEXT_VA=MY_USER_TEXT_VA061, DATA_VA=MY_USER_DATA_VA061
attr_text {
	Name = .My_User_Section_4v061,
	part_0_ctx_nonzero_tsb_config_3,
	VA = MY_USER_TEXT_VA061,
	RA = MY_USER_TEXT_RA061,
	PA = MY_USER_TEXT_PA061,
	TTE_Context = PCONTEXT,
	TTE_V       = 1,
	TTE_NFO     = 0,
	TTE_L       = 0,
	TTE_Soft    = 0,
	TTE_IE      = 0,
	TTE_E       = 0,
	TTE_CP      = 1,
	TTE_CV      = 0,
	TTE_P       = 0,
	TTE_EP      = 1,
	TTE_W       = 0,
	TTE_SW1     = 0,
	TTE_SW0     = 0,
	TTE_RSVD1   = 0,
	TTE_Size    = 0,
	}
.text
.global user_code_begin_061
user_code_begin_061:
	setx user_data_begin_062, %l1, %l3
	lduw [%l3], %l1
	setx user_code_begin_062, %l1, %l4
	stuw %l4, [%l3]
	jmp  %l4
	nop
	EXIT_BAD


attr_data {
	Name = .My_User_Section_4v061,
	notsb,
	VA = MY_USER_DATA_VA061,
	RA = MY_USER_DATA_RA061,
	PA = MY_USER_DATA_PA061,
	TTE_Context = PCONTEXT,
	TTE_V       = 1,
	TTE_NFO     = 0,
	TTE_L       = 0,
	TTE_Soft    = 0,
	TTE_IE      = 0,
	TTE_E       = 0,
	TTE_CP      = 1,
	TTE_CV      = 0,
	TTE_P       = 0,
	TTE_EP      = 0,
	TTE_W       = 1,
	TTE_SW1     = 0,
	TTE_SW0     = 0,
	TTE_RSVD1   = 0,
	TTE_Size    = 1,
	}
.data
.global user_data_begin_061
user_data_begin_061:
	.word 0x2f6
	.word 0x3010
	.word 0x138b6
	.word 0x12a3a


SECTION .My_User_Section_4v062 TEXT_VA=MY_USER_TEXT_VA062, DATA_VA=MY_USER_DATA_VA062
attr_text {
	Name = .My_User_Section_4v062,
	part_0_ctx_nonzero_tsb_config_3,
	VA = MY_USER_TEXT_VA062,
	RA = MY_USER_TEXT_RA062,
	PA = MY_USER_TEXT_PA062,
	TTE_Context = PCONTEXT,
	TTE_V       = 1,
	TTE_NFO     = 0,
	TTE_L       = 0,
	TTE_Soft    = 0,
	TTE_IE      = 0,
	TTE_E       = 0,
	TTE_CP      = 1,
	TTE_CV      = 0,
	TTE_P       = 0,
	TTE_EP      = 1,
	TTE_W       = 0,
	TTE_SW1     = 0,
	TTE_SW0     = 0,
	TTE_RSVD1   = 0,
	TTE_Size    = 0,
	}
.text
.global user_code_begin_062
user_code_begin_062:
	setx user_data_begin_063, %l1, %l3
	lduw [%l3], %l1
	setx user_code_begin_063, %l1, %l4
	stuw %l4, [%l3]
	jmp  %l4
	nop
	EXIT_BAD


attr_data {
	Name = .My_User_Section_4v062,
	notsb,
	VA = MY_USER_DATA_VA062,
	RA = MY_USER_DATA_RA062,
	PA = MY_USER_DATA_PA062,
	TTE_Context = PCONTEXT,
	TTE_V       = 1,
	TTE_NFO     = 0,
	TTE_L       = 0,
	TTE_Soft    = 0,
	TTE_IE      = 0,
	TTE_E       = 0,
	TTE_CP      = 1,
	TTE_CV      = 0,
	TTE_P       = 0,
	TTE_EP      = 0,
	TTE_W       = 1,
	TTE_SW1     = 0,
	TTE_SW0     = 0,
	TTE_RSVD1   = 0,
	TTE_Size    = 1,
	}
.data
.global user_data_begin_062
user_data_begin_062:
	.word 0x50f3
	.word 0x33c5
	.word 0x8351
	.word 0xe189


SECTION .My_User_Section_4v063 TEXT_VA=MY_USER_TEXT_VA063, DATA_VA=MY_USER_DATA_VA063
attr_text {
	Name = .My_User_Section_4v063,
	part_0_ctx_nonzero_tsb_config_3,
	VA = MY_USER_TEXT_VA063,
	RA = MY_USER_TEXT_RA063,
	PA = MY_USER_TEXT_PA063,
	TTE_Context = PCONTEXT,
	TTE_V       = 1,
	TTE_NFO     = 0,
	TTE_L       = 0,
	TTE_Soft    = 0,
	TTE_IE      = 0,
	TTE_E       = 0,
	TTE_CP      = 1,
	TTE_CV      = 0,
	TTE_P       = 0,
	TTE_EP      = 1,
	TTE_W       = 0,
	TTE_SW1     = 0,
	TTE_SW0     = 0,
	TTE_RSVD1   = 0,
	TTE_Size    = 0,
	}
.text
.global user_code_begin_063
user_code_begin_063:
	setx user_data_begin_064, %l1, %l3
	lduw [%l3], %l1
	setx user_code_begin_064, %l1, %l4
	stuw %l4, [%l3]
	jmp  %l4
	nop
	EXIT_BAD


attr_data {
	Name = .My_User_Section_4v063,
	notsb,
	VA = MY_USER_DATA_VA063,
	RA = MY_USER_DATA_RA063,
	PA = MY_USER_DATA_PA063,
	TTE_Context = PCONTEXT,
	TTE_V       = 1,
	TTE_NFO     = 0,
	TTE_L       = 0,
	TTE_Soft    = 0,
	TTE_IE      = 0,
	TTE_E       = 0,
	TTE_CP      = 1,
	TTE_CV      = 0,
	TTE_P       = 0,
	TTE_EP      = 0,
	TTE_W       = 1,
	TTE_SW1     = 0,
	TTE_SW0     = 0,
	TTE_RSVD1   = 0,
	TTE_Size    = 1,
	}
.data
.global user_data_begin_063
user_data_begin_063:
	.word 0x48e7
	.word 0xc438
	.word 0x471f
	.word 0x130f2


SECTION .My_User_Section_4v064 TEXT_VA=MY_USER_TEXT_VA064, DATA_VA=MY_USER_DATA_VA064
attr_text {
	Name = .My_User_Section_4v064,
	part_0_ctx_nonzero_tsb_config_3,
	VA = MY_USER_TEXT_VA064,
	RA = MY_USER_TEXT_RA064,
	PA = MY_USER_TEXT_PA064,
	TTE_Context = PCONTEXT,
	TTE_V       = 1,
	TTE_NFO     = 0,
	TTE_L       = 0,
	TTE_Soft    = 0,
	TTE_IE      = 0,
	TTE_E       = 0,
	TTE_CP      = 1,
	TTE_CV      = 0,
	TTE_P       = 0,
	TTE_EP      = 1,
	TTE_W       = 0,
	TTE_SW1     = 0,
	TTE_SW0     = 0,
	TTE_RSVD1   = 0,
	TTE_Size    = 0,
	}
.text
.global user_code_begin_064
user_code_begin_064:
	setx user_data_begin_065, %l1, %l3
	lduw [%l3], %l1
	setx user_code_begin_065, %l1, %l4
	stuw %l4, [%l3]
	jmp  %l4
	nop
	EXIT_BAD


attr_data {
	Name = .My_User_Section_4v064,
	notsb,
	VA = MY_USER_DATA_VA064,
	RA = MY_USER_DATA_RA064,
	PA = MY_USER_DATA_PA064,
	TTE_Context = PCONTEXT,
	TTE_V       = 1,
	TTE_NFO     = 0,
	TTE_L       = 0,
	TTE_Soft    = 0,
	TTE_IE      = 0,
	TTE_E       = 0,
	TTE_CP      = 1,
	TTE_CV      = 0,
	TTE_P       = 0,
	TTE_EP      = 0,
	TTE_W       = 1,
	TTE_SW1     = 0,
	TTE_SW0     = 0,
	TTE_RSVD1   = 0,
	TTE_Size    = 1,
	}
.data
.global user_data_begin_064
user_data_begin_064:
	.word 0xc5b5
	.word 0x14cce
	.word 0x142ca
	.word 0x14847


SECTION .My_User_Section_4v065 TEXT_VA=MY_USER_TEXT_VA065, DATA_VA=MY_USER_DATA_VA065
attr_text {
	Name = .My_User_Section_4v065,
	part_0_ctx_nonzero_tsb_config_3,
	VA = MY_USER_TEXT_VA065,
	RA = MY_USER_TEXT_RA065,
	PA = MY_USER_TEXT_PA065,
	TTE_Context = PCONTEXT,
	TTE_V       = 1,
	TTE_NFO     = 0,
	TTE_L       = 0,
	TTE_Soft    = 0,
	TTE_IE      = 0,
	TTE_E       = 0,
	TTE_CP      = 1,
	TTE_CV      = 0,
	TTE_P       = 0,
	TTE_EP      = 1,
	TTE_W       = 0,
	TTE_SW1     = 0,
	TTE_SW0     = 0,
	TTE_RSVD1   = 0,
	TTE_Size    = 0,
	}
.text
.global user_code_begin_065
user_code_begin_065:
	setx user_data_begin_066, %l1, %l3
	lduw [%l3], %l1
	setx user_code_begin_066, %l1, %l4
	stuw %l4, [%l3]
	jmp  %l4
	nop
	EXIT_BAD


attr_data {
	Name = .My_User_Section_4v065,
	notsb,
	VA = MY_USER_DATA_VA065,
	RA = MY_USER_DATA_RA065,
	PA = MY_USER_DATA_PA065,
	TTE_Context = PCONTEXT,
	TTE_V       = 1,
	TTE_NFO     = 0,
	TTE_L       = 0,
	TTE_Soft    = 0,
	TTE_IE      = 0,
	TTE_E       = 0,
	TTE_CP      = 1,
	TTE_CV      = 0,
	TTE_P       = 0,
	TTE_EP      = 0,
	TTE_W       = 1,
	TTE_SW1     = 0,
	TTE_SW0     = 0,
	TTE_RSVD1   = 0,
	TTE_Size    = 1,
	}
.data
.global user_data_begin_065
user_data_begin_065:
	.word 0x17a90
	.word 0xbf73
	.word 0x14769
	.word 0x2037


SECTION .My_User_Section_4v066 TEXT_VA=MY_USER_TEXT_VA066, DATA_VA=MY_USER_DATA_VA066
attr_text {
	Name = .My_User_Section_4v066,
	part_0_ctx_nonzero_tsb_config_3,
	VA = MY_USER_TEXT_VA066,
	RA = MY_USER_TEXT_RA066,
	PA = MY_USER_TEXT_PA066,
	TTE_Context = PCONTEXT,
	TTE_V       = 1,
	TTE_NFO     = 0,
	TTE_L       = 0,
	TTE_Soft    = 0,
	TTE_IE      = 0,
	TTE_E       = 0,
	TTE_CP      = 1,
	TTE_CV      = 0,
	TTE_P       = 0,
	TTE_EP      = 1,
	TTE_W       = 0,
	TTE_SW1     = 0,
	TTE_SW0     = 0,
	TTE_RSVD1   = 0,
	TTE_Size    = 0,
	}
.text
.global user_code_begin_066
user_code_begin_066:
	setx user_data_begin_067, %l1, %l3
	lduw [%l3], %l1
	setx user_code_begin_067, %l1, %l4
	stuw %l4, [%l3]
	jmp  %l4
	nop
	EXIT_BAD


attr_data {
	Name = .My_User_Section_4v066,
	notsb,
	VA = MY_USER_DATA_VA066,
	RA = MY_USER_DATA_RA066,
	PA = MY_USER_DATA_PA066,
	TTE_Context = PCONTEXT,
	TTE_V       = 1,
	TTE_NFO     = 0,
	TTE_L       = 0,
	TTE_Soft    = 0,
	TTE_IE      = 0,
	TTE_E       = 0,
	TTE_CP      = 1,
	TTE_CV      = 0,
	TTE_P       = 0,
	TTE_EP      = 0,
	TTE_W       = 1,
	TTE_SW1     = 0,
	TTE_SW0     = 0,
	TTE_RSVD1   = 0,
	TTE_Size    = 1,
	}
.data
.global user_data_begin_066
user_data_begin_066:
	.word 0xa253
	.word 0xc2d6
	.word 0xc188
	.word 0x25f6


SECTION .My_User_Section_4v067 TEXT_VA=MY_USER_TEXT_VA067, DATA_VA=MY_USER_DATA_VA067
attr_text {
	Name = .My_User_Section_4v067,
	part_0_ctx_nonzero_tsb_config_3,
	VA = MY_USER_TEXT_VA067,
	RA = MY_USER_TEXT_RA067,
	PA = MY_USER_TEXT_PA067,
	TTE_Context = PCONTEXT,
	TTE_V       = 1,
	TTE_NFO     = 0,
	TTE_L       = 0,
	TTE_Soft    = 0,
	TTE_IE      = 0,
	TTE_E       = 0,
	TTE_CP      = 1,
	TTE_CV      = 0,
	TTE_P       = 0,
	TTE_EP      = 1,
	TTE_W       = 0,
	TTE_SW1     = 0,
	TTE_SW0     = 0,
	TTE_RSVD1   = 0,
	TTE_Size    = 0,
	}
.text
.global user_code_begin_067
user_code_begin_067:
	setx user_data_begin_068, %l1, %l3
	lduw [%l3], %l1
	setx user_code_begin_068, %l1, %l4
	stuw %l4, [%l3]
	jmp  %l4
	nop
	EXIT_BAD


attr_data {
	Name = .My_User_Section_4v067,
	notsb,
	VA = MY_USER_DATA_VA067,
	RA = MY_USER_DATA_RA067,
	PA = MY_USER_DATA_PA067,
	TTE_Context = PCONTEXT,
	TTE_V       = 1,
	TTE_NFO     = 0,
	TTE_L       = 0,
	TTE_Soft    = 0,
	TTE_IE      = 0,
	TTE_E       = 0,
	TTE_CP      = 1,
	TTE_CV      = 0,
	TTE_P       = 0,
	TTE_EP      = 0,
	TTE_W       = 1,
	TTE_SW1     = 0,
	TTE_SW0     = 0,
	TTE_RSVD1   = 0,
	TTE_Size    = 1,
	}
.data
.global user_data_begin_067
user_data_begin_067:
	.word 0x83b0
	.word 0x2ae3
	.word 0xa9e9
	.word 0x13e1b


SECTION .My_User_Section_4v068 TEXT_VA=MY_USER_TEXT_VA068, DATA_VA=MY_USER_DATA_VA068
attr_text {
	Name = .My_User_Section_4v068,
	part_0_ctx_nonzero_tsb_config_3,
	VA = MY_USER_TEXT_VA068,
	RA = MY_USER_TEXT_RA068,
	PA = MY_USER_TEXT_PA068,
	TTE_Context = PCONTEXT,
	TTE_V       = 1,
	TTE_NFO     = 0,
	TTE_L       = 0,
	TTE_Soft    = 0,
	TTE_IE      = 0,
	TTE_E       = 0,
	TTE_CP      = 1,
	TTE_CV      = 0,
	TTE_P       = 0,
	TTE_EP      = 1,
	TTE_W       = 0,
	TTE_SW1     = 0,
	TTE_SW0     = 0,
	TTE_RSVD1   = 0,
	TTE_Size    = 0,
	}
.text
.global user_code_begin_068
user_code_begin_068:
	setx user_data_begin_069, %l1, %l3
	lduw [%l3], %l1
	setx user_code_begin_069, %l1, %l4
	stuw %l4, [%l3]
	jmp  %l4
	nop
	EXIT_BAD


attr_data {
	Name = .My_User_Section_4v068,
	notsb,
	VA = MY_USER_DATA_VA068,
	RA = MY_USER_DATA_RA068,
	PA = MY_USER_DATA_PA068,
	TTE_Context = PCONTEXT,
	TTE_V       = 1,
	TTE_NFO     = 0,
	TTE_L       = 0,
	TTE_Soft    = 0,
	TTE_IE      = 0,
	TTE_E       = 0,
	TTE_CP      = 1,
	TTE_CV      = 0,
	TTE_P       = 0,
	TTE_EP      = 0,
	TTE_W       = 1,
	TTE_SW1     = 0,
	TTE_SW0     = 0,
	TTE_RSVD1   = 0,
	TTE_Size    = 1,
	}
.data
.global user_data_begin_068
user_data_begin_068:
	.word 0x3870
	.word 0xf89c
	.word 0x18404
	.word 0x14c84


SECTION .My_User_Section_4v069 TEXT_VA=MY_USER_TEXT_VA069, DATA_VA=MY_USER_DATA_VA069
attr_text {
	Name = .My_User_Section_4v069,
	part_0_ctx_nonzero_tsb_config_3,
	VA = MY_USER_TEXT_VA069,
	RA = MY_USER_TEXT_RA069,
	PA = MY_USER_TEXT_PA069,
	TTE_Context = PCONTEXT,
	TTE_V       = 1,
	TTE_NFO     = 0,
	TTE_L       = 0,
	TTE_Soft    = 0,
	TTE_IE      = 0,
	TTE_E       = 0,
	TTE_CP      = 1,
	TTE_CV      = 0,
	TTE_P       = 0,
	TTE_EP      = 1,
	TTE_W       = 0,
	TTE_SW1     = 0,
	TTE_SW0     = 0,
	TTE_RSVD1   = 0,
	TTE_Size    = 0,
	}
.text
.global user_code_begin_069
user_code_begin_069:
	setx user_data_begin_070, %l1, %l3
	lduw [%l3], %l1
	setx user_code_begin_070, %l1, %l4
	stuw %l4, [%l3]
	jmp  %l4
	nop
	EXIT_BAD


attr_data {
	Name = .My_User_Section_4v069,
	notsb,
	VA = MY_USER_DATA_VA069,
	RA = MY_USER_DATA_RA069,
	PA = MY_USER_DATA_PA069,
	TTE_Context = PCONTEXT,
	TTE_V       = 1,
	TTE_NFO     = 0,
	TTE_L       = 0,
	TTE_Soft    = 0,
	TTE_IE      = 0,
	TTE_E       = 0,
	TTE_CP      = 1,
	TTE_CV      = 0,
	TTE_P       = 0,
	TTE_EP      = 0,
	TTE_W       = 1,
	TTE_SW1     = 0,
	TTE_SW0     = 0,
	TTE_RSVD1   = 0,
	TTE_Size    = 1,
	}
.data
.global user_data_begin_069
user_data_begin_069:
	.word 0x8ac8
	.word 0xad14
	.word 0x42f2
	.word 0xa19d


SECTION .My_User_Section_4v070 TEXT_VA=MY_USER_TEXT_VA070, DATA_VA=MY_USER_DATA_VA070
attr_text {
	Name = .My_User_Section_4v070,
	part_0_ctx_nonzero_tsb_config_3,
	VA = MY_USER_TEXT_VA070,
	RA = MY_USER_TEXT_RA070,
	PA = MY_USER_TEXT_PA070,
	TTE_Context = PCONTEXT,
	TTE_V       = 1,
	TTE_NFO     = 0,
	TTE_L       = 0,
	TTE_Soft    = 0,
	TTE_IE      = 0,
	TTE_E       = 0,
	TTE_CP      = 1,
	TTE_CV      = 0,
	TTE_P       = 0,
	TTE_EP      = 1,
	TTE_W       = 0,
	TTE_SW1     = 0,
	TTE_SW0     = 0,
	TTE_RSVD1   = 0,
	TTE_Size    = 0,
	}
.text
.global user_code_begin_070
user_code_begin_070:
	setx user_data_begin_071, %l1, %l3
	lduw [%l3], %l1
	setx user_code_begin_071, %l1, %l4
	stuw %l4, [%l3]
	jmp  %l4
	nop
	EXIT_BAD


attr_data {
	Name = .My_User_Section_4v070,
	notsb,
	VA = MY_USER_DATA_VA070,
	RA = MY_USER_DATA_RA070,
	PA = MY_USER_DATA_PA070,
	TTE_Context = PCONTEXT,
	TTE_V       = 1,
	TTE_NFO     = 0,
	TTE_L       = 0,
	TTE_Soft    = 0,
	TTE_IE      = 0,
	TTE_E       = 0,
	TTE_CP      = 1,
	TTE_CV      = 0,
	TTE_P       = 0,
	TTE_EP      = 0,
	TTE_W       = 1,
	TTE_SW1     = 0,
	TTE_SW0     = 0,
	TTE_RSVD1   = 0,
	TTE_Size    = 1,
	}
.data
.global user_data_begin_070
user_data_begin_070:
	.word 0x10584
	.word 0x8daf
	.word 0x162b6
	.word 0x16675


SECTION .My_User_Section_4v071 TEXT_VA=MY_USER_TEXT_VA071, DATA_VA=MY_USER_DATA_VA071
attr_text {
	Name = .My_User_Section_4v071,
	part_0_ctx_nonzero_tsb_config_3,
	VA = MY_USER_TEXT_VA071,
	RA = MY_USER_TEXT_RA071,
	PA = MY_USER_TEXT_PA071,
	TTE_Context = PCONTEXT,
	TTE_V       = 1,
	TTE_NFO     = 0,
	TTE_L       = 0,
	TTE_Soft    = 0,
	TTE_IE      = 0,
	TTE_E       = 0,
	TTE_CP      = 1,
	TTE_CV      = 0,
	TTE_P       = 0,
	TTE_EP      = 1,
	TTE_W       = 0,
	TTE_SW1     = 0,
	TTE_SW0     = 0,
	TTE_RSVD1   = 0,
	TTE_Size    = 0,
	}
.text
.global user_code_begin_071
user_code_begin_071:
	setx user_data_begin_072, %l1, %l3
	lduw [%l3], %l1
	setx user_code_begin_072, %l1, %l4
	stuw %l4, [%l3]
	jmp  %l4
	nop
	EXIT_BAD


attr_data {
	Name = .My_User_Section_4v071,
	notsb,
	VA = MY_USER_DATA_VA071,
	RA = MY_USER_DATA_RA071,
	PA = MY_USER_DATA_PA071,
	TTE_Context = PCONTEXT,
	TTE_V       = 1,
	TTE_NFO     = 0,
	TTE_L       = 0,
	TTE_Soft    = 0,
	TTE_IE      = 0,
	TTE_E       = 0,
	TTE_CP      = 1,
	TTE_CV      = 0,
	TTE_P       = 0,
	TTE_EP      = 0,
	TTE_W       = 1,
	TTE_SW1     = 0,
	TTE_SW0     = 0,
	TTE_RSVD1   = 0,
	TTE_Size    = 1,
	}
.data
.global user_data_begin_071
user_data_begin_071:
	.word 0x4331
	.word 0x113cf
	.word 0xa08b
	.word 0xef2


SECTION .My_User_Section_4v072 TEXT_VA=MY_USER_TEXT_VA072, DATA_VA=MY_USER_DATA_VA072
attr_text {
	Name = .My_User_Section_4v072,
	part_0_ctx_nonzero_tsb_config_3,
	VA = MY_USER_TEXT_VA072,
	RA = MY_USER_TEXT_RA072,
	PA = MY_USER_TEXT_PA072,
	TTE_Context = PCONTEXT,
	TTE_V       = 1,
	TTE_NFO     = 0,
	TTE_L       = 0,
	TTE_Soft    = 0,
	TTE_IE      = 0,
	TTE_E       = 0,
	TTE_CP      = 1,
	TTE_CV      = 0,
	TTE_P       = 0,
	TTE_EP      = 1,
	TTE_W       = 0,
	TTE_SW1     = 0,
	TTE_SW0     = 0,
	TTE_RSVD1   = 0,
	TTE_Size    = 0,
	}
.text
.global user_code_begin_072
user_code_begin_072:
	setx user_data_begin_073, %l1, %l3
	lduw [%l3], %l1
	setx user_code_begin_073, %l1, %l4
	stuw %l4, [%l3]
	jmp  %l4
	nop
	EXIT_BAD


attr_data {
	Name = .My_User_Section_4v072,
	notsb,
	VA = MY_USER_DATA_VA072,
	RA = MY_USER_DATA_RA072,
	PA = MY_USER_DATA_PA072,
	TTE_Context = PCONTEXT,
	TTE_V       = 1,
	TTE_NFO     = 0,
	TTE_L       = 0,
	TTE_Soft    = 0,
	TTE_IE      = 0,
	TTE_E       = 0,
	TTE_CP      = 1,
	TTE_CV      = 0,
	TTE_P       = 0,
	TTE_EP      = 0,
	TTE_W       = 1,
	TTE_SW1     = 0,
	TTE_SW0     = 0,
	TTE_RSVD1   = 0,
	TTE_Size    = 1,
	}
.data
.global user_data_begin_072
user_data_begin_072:
	.word 0x15f35
	.word 0x16108
	.word 0xade2
	.word 0xa758


SECTION .My_User_Section_4v073 TEXT_VA=MY_USER_TEXT_VA073, DATA_VA=MY_USER_DATA_VA073
attr_text {
	Name = .My_User_Section_4v073,
	part_0_ctx_nonzero_tsb_config_3,
	VA = MY_USER_TEXT_VA073,
	RA = MY_USER_TEXT_RA073,
	PA = MY_USER_TEXT_PA073,
	TTE_Context = PCONTEXT,
	TTE_V       = 1,
	TTE_NFO     = 0,
	TTE_L       = 0,
	TTE_Soft    = 0,
	TTE_IE      = 0,
	TTE_E       = 0,
	TTE_CP      = 1,
	TTE_CV      = 0,
	TTE_P       = 0,
	TTE_EP      = 1,
	TTE_W       = 0,
	TTE_SW1     = 0,
	TTE_SW0     = 0,
	TTE_RSVD1   = 0,
	TTE_Size    = 0,
	}
.text
.global user_code_begin_073
user_code_begin_073:
	setx user_data_begin_074, %l1, %l3
	lduw [%l3], %l1
	setx user_code_begin_074, %l1, %l4
	stuw %l4, [%l3]
	jmp  %l4
	nop
	EXIT_BAD


attr_data {
	Name = .My_User_Section_4v073,
	notsb,
	VA = MY_USER_DATA_VA073,
	RA = MY_USER_DATA_RA073,
	PA = MY_USER_DATA_PA073,
	TTE_Context = PCONTEXT,
	TTE_V       = 1,
	TTE_NFO     = 0,
	TTE_L       = 0,
	TTE_Soft    = 0,
	TTE_IE      = 0,
	TTE_E       = 0,
	TTE_CP      = 1,
	TTE_CV      = 0,
	TTE_P       = 0,
	TTE_EP      = 0,
	TTE_W       = 1,
	TTE_SW1     = 0,
	TTE_SW0     = 0,
	TTE_RSVD1   = 0,
	TTE_Size    = 1,
	}
.data
.global user_data_begin_073
user_data_begin_073:
	.word 0x17176
	.word 0x129bf
	.word 0x112fc
	.word 0x880b


SECTION .My_User_Section_4v074 TEXT_VA=MY_USER_TEXT_VA074, DATA_VA=MY_USER_DATA_VA074
attr_text {
	Name = .My_User_Section_4v074,
	part_0_ctx_nonzero_tsb_config_3,
	VA = MY_USER_TEXT_VA074,
	RA = MY_USER_TEXT_RA074,
	PA = MY_USER_TEXT_PA074,
	TTE_Context = PCONTEXT,
	TTE_V       = 1,
	TTE_NFO     = 0,
	TTE_L       = 0,
	TTE_Soft    = 0,
	TTE_IE      = 0,
	TTE_E       = 0,
	TTE_CP      = 1,
	TTE_CV      = 0,
	TTE_P       = 0,
	TTE_EP      = 1,
	TTE_W       = 0,
	TTE_SW1     = 0,
	TTE_SW0     = 0,
	TTE_RSVD1   = 0,
	TTE_Size    = 0,
	}
.text
.global user_code_begin_074
user_code_begin_074:
	setx user_data_begin_075, %l1, %l3
	lduw [%l3], %l1
	setx user_code_begin_075, %l1, %l4
	stuw %l4, [%l3]
	jmp  %l4
	nop
	EXIT_BAD


attr_data {
	Name = .My_User_Section_4v074,
	notsb,
	VA = MY_USER_DATA_VA074,
	RA = MY_USER_DATA_RA074,
	PA = MY_USER_DATA_PA074,
	TTE_Context = PCONTEXT,
	TTE_V       = 1,
	TTE_NFO     = 0,
	TTE_L       = 0,
	TTE_Soft    = 0,
	TTE_IE      = 0,
	TTE_E       = 0,
	TTE_CP      = 1,
	TTE_CV      = 0,
	TTE_P       = 0,
	TTE_EP      = 0,
	TTE_W       = 1,
	TTE_SW1     = 0,
	TTE_SW0     = 0,
	TTE_RSVD1   = 0,
	TTE_Size    = 1,
	}
.data
.global user_data_begin_074
user_data_begin_074:
	.word 0x11dd5
	.word 0x16db3
	.word 0x2dc8
	.word 0x13449


SECTION .My_User_Section_4v075 TEXT_VA=MY_USER_TEXT_VA075, DATA_VA=MY_USER_DATA_VA075
attr_text {
	Name = .My_User_Section_4v075,
	part_0_ctx_nonzero_tsb_config_3,
	VA = MY_USER_TEXT_VA075,
	RA = MY_USER_TEXT_RA075,
	PA = MY_USER_TEXT_PA075,
	TTE_Context = PCONTEXT,
	TTE_V       = 1,
	TTE_NFO     = 0,
	TTE_L       = 0,
	TTE_Soft    = 0,
	TTE_IE      = 0,
	TTE_E       = 0,
	TTE_CP      = 1,
	TTE_CV      = 0,
	TTE_P       = 0,
	TTE_EP      = 1,
	TTE_W       = 0,
	TTE_SW1     = 0,
	TTE_SW0     = 0,
	TTE_RSVD1   = 0,
	TTE_Size    = 0,
	}
.text
.global user_code_begin_075
user_code_begin_075:
	setx user_data_begin_076, %l1, %l3
	lduw [%l3], %l1
	setx user_code_begin_076, %l1, %l4
	stuw %l4, [%l3]
	jmp  %l4
	nop
	EXIT_BAD


attr_data {
	Name = .My_User_Section_4v075,
	notsb,
	VA = MY_USER_DATA_VA075,
	RA = MY_USER_DATA_RA075,
	PA = MY_USER_DATA_PA075,
	TTE_Context = PCONTEXT,
	TTE_V       = 1,
	TTE_NFO     = 0,
	TTE_L       = 0,
	TTE_Soft    = 0,
	TTE_IE      = 0,
	TTE_E       = 0,
	TTE_CP      = 1,
	TTE_CV      = 0,
	TTE_P       = 0,
	TTE_EP      = 0,
	TTE_W       = 1,
	TTE_SW1     = 0,
	TTE_SW0     = 0,
	TTE_RSVD1   = 0,
	TTE_Size    = 1,
	}
.data
.global user_data_begin_075
user_data_begin_075:
	.word 0x29e0
	.word 0x4713
	.word 0x7de3
	.word 0x14fc9


SECTION .My_User_Section_4v076 TEXT_VA=MY_USER_TEXT_VA076, DATA_VA=MY_USER_DATA_VA076
attr_text {
	Name = .My_User_Section_4v076,
	part_0_ctx_nonzero_tsb_config_3,
	VA = MY_USER_TEXT_VA076,
	RA = MY_USER_TEXT_RA076,
	PA = MY_USER_TEXT_PA076,
	TTE_Context = PCONTEXT,
	TTE_V       = 1,
	TTE_NFO     = 0,
	TTE_L       = 0,
	TTE_Soft    = 0,
	TTE_IE      = 0,
	TTE_E       = 0,
	TTE_CP      = 1,
	TTE_CV      = 0,
	TTE_P       = 0,
	TTE_EP      = 1,
	TTE_W       = 0,
	TTE_SW1     = 0,
	TTE_SW0     = 0,
	TTE_RSVD1   = 0,
	TTE_Size    = 0,
	}
.text
.global user_code_begin_076
user_code_begin_076:
	setx user_data_begin_077, %l1, %l3
	lduw [%l3], %l1
	setx user_code_begin_077, %l1, %l4
	stuw %l4, [%l3]
	jmp  %l4
	nop
	EXIT_BAD


attr_data {
	Name = .My_User_Section_4v076,
	notsb,
	VA = MY_USER_DATA_VA076,
	RA = MY_USER_DATA_RA076,
	PA = MY_USER_DATA_PA076,
	TTE_Context = PCONTEXT,
	TTE_V       = 1,
	TTE_NFO     = 0,
	TTE_L       = 0,
	TTE_Soft    = 0,
	TTE_IE      = 0,
	TTE_E       = 0,
	TTE_CP      = 1,
	TTE_CV      = 0,
	TTE_P       = 0,
	TTE_EP      = 0,
	TTE_W       = 1,
	TTE_SW1     = 0,
	TTE_SW0     = 0,
	TTE_RSVD1   = 0,
	TTE_Size    = 1,
	}
.data
.global user_data_begin_076
user_data_begin_076:
	.word 0xf7fa
	.word 0x469b
	.word 0xf755
	.word 0xf72b


SECTION .My_User_Section_4v077 TEXT_VA=MY_USER_TEXT_VA077, DATA_VA=MY_USER_DATA_VA077
attr_text {
	Name = .My_User_Section_4v077,
	part_0_ctx_nonzero_tsb_config_3,
	VA = MY_USER_TEXT_VA077,
	RA = MY_USER_TEXT_RA077,
	PA = MY_USER_TEXT_PA077,
	TTE_Context = PCONTEXT,
	TTE_V       = 1,
	TTE_NFO     = 0,
	TTE_L       = 0,
	TTE_Soft    = 0,
	TTE_IE      = 0,
	TTE_E       = 0,
	TTE_CP      = 1,
	TTE_CV      = 0,
	TTE_P       = 0,
	TTE_EP      = 1,
	TTE_W       = 0,
	TTE_SW1     = 0,
	TTE_SW0     = 0,
	TTE_RSVD1   = 0,
	TTE_Size    = 0,
	}
.text
.global user_code_begin_077
user_code_begin_077:
	setx user_data_begin_078, %l1, %l3
	lduw [%l3], %l1
	setx user_code_begin_078, %l1, %l4
	stuw %l4, [%l3]
	jmp  %l4
	nop
	EXIT_BAD


attr_data {
	Name = .My_User_Section_4v077,
	notsb,
	VA = MY_USER_DATA_VA077,
	RA = MY_USER_DATA_RA077,
	PA = MY_USER_DATA_PA077,
	TTE_Context = PCONTEXT,
	TTE_V       = 1,
	TTE_NFO     = 0,
	TTE_L       = 0,
	TTE_Soft    = 0,
	TTE_IE      = 0,
	TTE_E       = 0,
	TTE_CP      = 1,
	TTE_CV      = 0,
	TTE_P       = 0,
	TTE_EP      = 0,
	TTE_W       = 1,
	TTE_SW1     = 0,
	TTE_SW0     = 0,
	TTE_RSVD1   = 0,
	TTE_Size    = 1,
	}
.data
.global user_data_begin_077
user_data_begin_077:
	.word 0xff14
	.word 0xfca1
	.word 0x17d59
	.word 0x1552b


SECTION .My_User_Section_4v078 TEXT_VA=MY_USER_TEXT_VA078, DATA_VA=MY_USER_DATA_VA078
attr_text {
	Name = .My_User_Section_4v078,
	part_0_ctx_nonzero_tsb_config_3,
	VA = MY_USER_TEXT_VA078,
	RA = MY_USER_TEXT_RA078,
	PA = MY_USER_TEXT_PA078,
	TTE_Context = PCONTEXT,
	TTE_V       = 1,
	TTE_NFO     = 0,
	TTE_L       = 0,
	TTE_Soft    = 0,
	TTE_IE      = 0,
	TTE_E       = 0,
	TTE_CP      = 1,
	TTE_CV      = 0,
	TTE_P       = 0,
	TTE_EP      = 1,
	TTE_W       = 0,
	TTE_SW1     = 0,
	TTE_SW0     = 0,
	TTE_RSVD1   = 0,
	TTE_Size    = 0,
	}
.text
.global user_code_begin_078
user_code_begin_078:
	setx user_data_begin_079, %l1, %l3
	lduw [%l3], %l1
	setx user_code_begin_079, %l1, %l4
	stuw %l4, [%l3]
	jmp  %l4
	nop
	EXIT_BAD


attr_data {
	Name = .My_User_Section_4v078,
	notsb,
	VA = MY_USER_DATA_VA078,
	RA = MY_USER_DATA_RA078,
	PA = MY_USER_DATA_PA078,
	TTE_Context = PCONTEXT,
	TTE_V       = 1,
	TTE_NFO     = 0,
	TTE_L       = 0,
	TTE_Soft    = 0,
	TTE_IE      = 0,
	TTE_E       = 0,
	TTE_CP      = 1,
	TTE_CV      = 0,
	TTE_P       = 0,
	TTE_EP      = 0,
	TTE_W       = 1,
	TTE_SW1     = 0,
	TTE_SW0     = 0,
	TTE_RSVD1   = 0,
	TTE_Size    = 1,
	}
.data
.global user_data_begin_078
user_data_begin_078:
	.word 0x181af
	.word 0x67bf
	.word 0x4348
	.word 0x1842b


SECTION .My_User_Section_4v079 TEXT_VA=MY_USER_TEXT_VA079, DATA_VA=MY_USER_DATA_VA079
attr_text {
	Name = .My_User_Section_4v079,
	part_0_ctx_nonzero_tsb_config_3,
	VA = MY_USER_TEXT_VA079,
	RA = MY_USER_TEXT_RA079,
	PA = MY_USER_TEXT_PA079,
	TTE_Context = PCONTEXT,
	TTE_V       = 1,
	TTE_NFO     = 0,
	TTE_L       = 0,
	TTE_Soft    = 0,
	TTE_IE      = 0,
	TTE_E       = 0,
	TTE_CP      = 1,
	TTE_CV      = 0,
	TTE_P       = 0,
	TTE_EP      = 1,
	TTE_W       = 0,
	TTE_SW1     = 0,
	TTE_SW0     = 0,
	TTE_RSVD1   = 0,
	TTE_Size    = 0,
	}
.text
.global user_code_begin_079
user_code_begin_079:
	setx user_data_begin_080, %l1, %l3
	lduw [%l3], %l1
	setx user_code_begin_080, %l1, %l4
	stuw %l4, [%l3]
	jmp  %l4
	nop
	EXIT_BAD


attr_data {
	Name = .My_User_Section_4v079,
	notsb,
	VA = MY_USER_DATA_VA079,
	RA = MY_USER_DATA_RA079,
	PA = MY_USER_DATA_PA079,
	TTE_Context = PCONTEXT,
	TTE_V       = 1,
	TTE_NFO     = 0,
	TTE_L       = 0,
	TTE_Soft    = 0,
	TTE_IE      = 0,
	TTE_E       = 0,
	TTE_CP      = 1,
	TTE_CV      = 0,
	TTE_P       = 0,
	TTE_EP      = 0,
	TTE_W       = 1,
	TTE_SW1     = 0,
	TTE_SW0     = 0,
	TTE_RSVD1   = 0,
	TTE_Size    = 1,
	}
.data
.global user_data_begin_079
user_data_begin_079:
	.word 0x8d6c
	.word 0x17953
	.word 0x1f41
	.word 0x13c76


SECTION .My_User_Section_4v080 TEXT_VA=MY_USER_TEXT_VA080, DATA_VA=MY_USER_DATA_VA080
attr_text {
	Name = .My_User_Section_4v080,
	part_0_ctx_nonzero_tsb_config_3,
	VA = MY_USER_TEXT_VA080,
	RA = MY_USER_TEXT_RA080,
	PA = MY_USER_TEXT_PA080,
	TTE_Context = PCONTEXT,
	TTE_V       = 1,
	TTE_NFO     = 0,
	TTE_L       = 0,
	TTE_Soft    = 0,
	TTE_IE      = 0,
	TTE_E       = 0,
	TTE_CP      = 1,
	TTE_CV      = 0,
	TTE_P       = 0,
	TTE_EP      = 1,
	TTE_W       = 0,
	TTE_SW1     = 0,
	TTE_SW0     = 0,
	TTE_RSVD1   = 0,
	TTE_Size    = 0,
	}
.text
.global user_code_begin_080
user_code_begin_080:
	setx user_data_begin_081, %l1, %l3
	lduw [%l3], %l1
	setx user_code_begin_081, %l1, %l4
	stuw %l4, [%l3]
	jmp  %l4
	nop
	EXIT_BAD


attr_data {
	Name = .My_User_Section_4v080,
	notsb,
	VA = MY_USER_DATA_VA080,
	RA = MY_USER_DATA_RA080,
	PA = MY_USER_DATA_PA080,
	TTE_Context = PCONTEXT,
	TTE_V       = 1,
	TTE_NFO     = 0,
	TTE_L       = 0,
	TTE_Soft    = 0,
	TTE_IE      = 0,
	TTE_E       = 0,
	TTE_CP      = 1,
	TTE_CV      = 0,
	TTE_P       = 0,
	TTE_EP      = 0,
	TTE_W       = 1,
	TTE_SW1     = 0,
	TTE_SW0     = 0,
	TTE_RSVD1   = 0,
	TTE_Size    = 1,
	}
.data
.global user_data_begin_080
user_data_begin_080:
	.word 0xaf23
	.word 0xe74e
	.word 0x1587d
	.word 0xfb69


SECTION .My_User_Section_4v081 TEXT_VA=MY_USER_TEXT_VA081, DATA_VA=MY_USER_DATA_VA081
attr_text {
	Name = .My_User_Section_4v081,
	part_0_ctx_nonzero_tsb_config_3,
	VA = MY_USER_TEXT_VA081,
	RA = MY_USER_TEXT_RA081,
	PA = MY_USER_TEXT_PA081,
	TTE_Context = PCONTEXT,
	TTE_V       = 1,
	TTE_NFO     = 0,
	TTE_L       = 0,
	TTE_Soft    = 0,
	TTE_IE      = 0,
	TTE_E       = 0,
	TTE_CP      = 1,
	TTE_CV      = 0,
	TTE_P       = 0,
	TTE_EP      = 1,
	TTE_W       = 0,
	TTE_SW1     = 0,
	TTE_SW0     = 0,
	TTE_RSVD1   = 0,
	TTE_Size    = 0,
	}
.text
.global user_code_begin_081
user_code_begin_081:
	setx user_data_begin_082, %l1, %l3
	lduw [%l3], %l1
	setx user_code_begin_082, %l1, %l4
	stuw %l4, [%l3]
	jmp  %l4
	nop
	EXIT_BAD


attr_data {
	Name = .My_User_Section_4v081,
	notsb,
	VA = MY_USER_DATA_VA081,
	RA = MY_USER_DATA_RA081,
	PA = MY_USER_DATA_PA081,
	TTE_Context = PCONTEXT,
	TTE_V       = 1,
	TTE_NFO     = 0,
	TTE_L       = 0,
	TTE_Soft    = 0,
	TTE_IE      = 0,
	TTE_E       = 0,
	TTE_CP      = 1,
	TTE_CV      = 0,
	TTE_P       = 0,
	TTE_EP      = 0,
	TTE_W       = 1,
	TTE_SW1     = 0,
	TTE_SW0     = 0,
	TTE_RSVD1   = 0,
	TTE_Size    = 1,
	}
.data
.global user_data_begin_081
user_data_begin_081:
	.word 0x1675d
	.word 0x57e5
	.word 0x134a5
	.word 0xf59f


SECTION .My_User_Section_4v082 TEXT_VA=MY_USER_TEXT_VA082, DATA_VA=MY_USER_DATA_VA082
attr_text {
	Name = .My_User_Section_4v082,
	part_0_ctx_nonzero_tsb_config_3,
	VA = MY_USER_TEXT_VA082,
	RA = MY_USER_TEXT_RA082,
	PA = MY_USER_TEXT_PA082,
	TTE_Context = PCONTEXT,
	TTE_V       = 1,
	TTE_NFO     = 0,
	TTE_L       = 0,
	TTE_Soft    = 0,
	TTE_IE      = 0,
	TTE_E       = 0,
	TTE_CP      = 1,
	TTE_CV      = 0,
	TTE_P       = 0,
	TTE_EP      = 1,
	TTE_W       = 0,
	TTE_SW1     = 0,
	TTE_SW0     = 0,
	TTE_RSVD1   = 0,
	TTE_Size    = 0,
	}
.text
.global user_code_begin_082
user_code_begin_082:
	setx user_data_begin_083, %l1, %l3
	lduw [%l3], %l1
	setx user_code_begin_083, %l1, %l4
	stuw %l4, [%l3]
	jmp  %l4
	nop
	EXIT_BAD


attr_data {
	Name = .My_User_Section_4v082,
	notsb,
	VA = MY_USER_DATA_VA082,
	RA = MY_USER_DATA_RA082,
	PA = MY_USER_DATA_PA082,
	TTE_Context = PCONTEXT,
	TTE_V       = 1,
	TTE_NFO     = 0,
	TTE_L       = 0,
	TTE_Soft    = 0,
	TTE_IE      = 0,
	TTE_E       = 0,
	TTE_CP      = 1,
	TTE_CV      = 0,
	TTE_P       = 0,
	TTE_EP      = 0,
	TTE_W       = 1,
	TTE_SW1     = 0,
	TTE_SW0     = 0,
	TTE_RSVD1   = 0,
	TTE_Size    = 1,
	}
.data
.global user_data_begin_082
user_data_begin_082:
	.word 0xfec
	.word 0x17478
	.word 0x1245e
	.word 0x12b13


SECTION .My_User_Section_4v083 TEXT_VA=MY_USER_TEXT_VA083, DATA_VA=MY_USER_DATA_VA083
attr_text {
	Name = .My_User_Section_4v083,
	part_0_ctx_nonzero_tsb_config_3,
	VA = MY_USER_TEXT_VA083,
	RA = MY_USER_TEXT_RA083,
	PA = MY_USER_TEXT_PA083,
	TTE_Context = PCONTEXT,
	TTE_V       = 1,
	TTE_NFO     = 0,
	TTE_L       = 0,
	TTE_Soft    = 0,
	TTE_IE      = 0,
	TTE_E       = 0,
	TTE_CP      = 1,
	TTE_CV      = 0,
	TTE_P       = 0,
	TTE_EP      = 1,
	TTE_W       = 0,
	TTE_SW1     = 0,
	TTE_SW0     = 0,
	TTE_RSVD1   = 0,
	TTE_Size    = 0,
	}
.text
.global user_code_begin_083
user_code_begin_083:
	setx user_data_begin_084, %l1, %l3
	lduw [%l3], %l1
	setx user_code_begin_084, %l1, %l4
	stuw %l4, [%l3]
	jmp  %l4
	nop
	EXIT_BAD


attr_data {
	Name = .My_User_Section_4v083,
	notsb,
	VA = MY_USER_DATA_VA083,
	RA = MY_USER_DATA_RA083,
	PA = MY_USER_DATA_PA083,
	TTE_Context = PCONTEXT,
	TTE_V       = 1,
	TTE_NFO     = 0,
	TTE_L       = 0,
	TTE_Soft    = 0,
	TTE_IE      = 0,
	TTE_E       = 0,
	TTE_CP      = 1,
	TTE_CV      = 0,
	TTE_P       = 0,
	TTE_EP      = 0,
	TTE_W       = 1,
	TTE_SW1     = 0,
	TTE_SW0     = 0,
	TTE_RSVD1   = 0,
	TTE_Size    = 1,
	}
.data
.global user_data_begin_083
user_data_begin_083:
	.word 0x1716f
	.word 0xf08e
	.word 0x1556
	.word 0x15d54


SECTION .My_User_Section_4v084 TEXT_VA=MY_USER_TEXT_VA084, DATA_VA=MY_USER_DATA_VA084
attr_text {
	Name = .My_User_Section_4v084,
	part_0_ctx_nonzero_tsb_config_3,
	VA = MY_USER_TEXT_VA084,
	RA = MY_USER_TEXT_RA084,
	PA = MY_USER_TEXT_PA084,
	TTE_Context = PCONTEXT,
	TTE_V       = 1,
	TTE_NFO     = 0,
	TTE_L       = 0,
	TTE_Soft    = 0,
	TTE_IE      = 0,
	TTE_E       = 0,
	TTE_CP      = 1,
	TTE_CV      = 0,
	TTE_P       = 0,
	TTE_EP      = 1,
	TTE_W       = 0,
	TTE_SW1     = 0,
	TTE_SW0     = 0,
	TTE_RSVD1   = 0,
	TTE_Size    = 0,
	}
.text
.global user_code_begin_084
user_code_begin_084:
	setx user_data_begin_085, %l1, %l3
	lduw [%l3], %l1
	setx user_code_begin_085, %l1, %l4
	stuw %l4, [%l3]
	jmp  %l4
	nop
	EXIT_BAD


attr_data {
	Name = .My_User_Section_4v084,
	notsb,
	VA = MY_USER_DATA_VA084,
	RA = MY_USER_DATA_RA084,
	PA = MY_USER_DATA_PA084,
	TTE_Context = PCONTEXT,
	TTE_V       = 1,
	TTE_NFO     = 0,
	TTE_L       = 0,
	TTE_Soft    = 0,
	TTE_IE      = 0,
	TTE_E       = 0,
	TTE_CP      = 1,
	TTE_CV      = 0,
	TTE_P       = 0,
	TTE_EP      = 0,
	TTE_W       = 1,
	TTE_SW1     = 0,
	TTE_SW0     = 0,
	TTE_RSVD1   = 0,
	TTE_Size    = 1,
	}
.data
.global user_data_begin_084
user_data_begin_084:
	.word 0xb8c0
	.word 0x17443
	.word 0x174f2
	.word 0x16947


SECTION .My_User_Section_4v085 TEXT_VA=MY_USER_TEXT_VA085, DATA_VA=MY_USER_DATA_VA085
attr_text {
	Name = .My_User_Section_4v085,
	part_0_ctx_nonzero_tsb_config_3,
	VA = MY_USER_TEXT_VA085,
	RA = MY_USER_TEXT_RA085,
	PA = MY_USER_TEXT_PA085,
	TTE_Context = PCONTEXT,
	TTE_V       = 1,
	TTE_NFO     = 0,
	TTE_L       = 0,
	TTE_Soft    = 0,
	TTE_IE      = 0,
	TTE_E       = 0,
	TTE_CP      = 1,
	TTE_CV      = 0,
	TTE_P       = 0,
	TTE_EP      = 1,
	TTE_W       = 0,
	TTE_SW1     = 0,
	TTE_SW0     = 0,
	TTE_RSVD1   = 0,
	TTE_Size    = 0,
	}
.text
.global user_code_begin_085
user_code_begin_085:
	setx user_data_begin_086, %l1, %l3
	lduw [%l3], %l1
	setx user_code_begin_086, %l1, %l4
	stuw %l4, [%l3]
	jmp  %l4
	nop
	EXIT_BAD


attr_data {
	Name = .My_User_Section_4v085,
	notsb,
	VA = MY_USER_DATA_VA085,
	RA = MY_USER_DATA_RA085,
	PA = MY_USER_DATA_PA085,
	TTE_Context = PCONTEXT,
	TTE_V       = 1,
	TTE_NFO     = 0,
	TTE_L       = 0,
	TTE_Soft    = 0,
	TTE_IE      = 0,
	TTE_E       = 0,
	TTE_CP      = 1,
	TTE_CV      = 0,
	TTE_P       = 0,
	TTE_EP      = 0,
	TTE_W       = 1,
	TTE_SW1     = 0,
	TTE_SW0     = 0,
	TTE_RSVD1   = 0,
	TTE_Size    = 1,
	}
.data
.global user_data_begin_085
user_data_begin_085:
	.word 0x141b2
	.word 0x7ac7
	.word 0x1e74
	.word 0x17c0c


SECTION .My_User_Section_4v086 TEXT_VA=MY_USER_TEXT_VA086, DATA_VA=MY_USER_DATA_VA086
attr_text {
	Name = .My_User_Section_4v086,
	part_0_ctx_nonzero_tsb_config_3,
	VA = MY_USER_TEXT_VA086,
	RA = MY_USER_TEXT_RA086,
	PA = MY_USER_TEXT_PA086,
	TTE_Context = PCONTEXT,
	TTE_V       = 1,
	TTE_NFO     = 0,
	TTE_L       = 0,
	TTE_Soft    = 0,
	TTE_IE      = 0,
	TTE_E       = 0,
	TTE_CP      = 1,
	TTE_CV      = 0,
	TTE_P       = 0,
	TTE_EP      = 1,
	TTE_W       = 0,
	TTE_SW1     = 0,
	TTE_SW0     = 0,
	TTE_RSVD1   = 0,
	TTE_Size    = 0,
	}
.text
.global user_code_begin_086
user_code_begin_086:
	setx user_data_begin_087, %l1, %l3
	lduw [%l3], %l1
	setx user_code_begin_087, %l1, %l4
	stuw %l4, [%l3]
	jmp  %l4
	nop
	EXIT_BAD


attr_data {
	Name = .My_User_Section_4v086,
	notsb,
	VA = MY_USER_DATA_VA086,
	RA = MY_USER_DATA_RA086,
	PA = MY_USER_DATA_PA086,
	TTE_Context = PCONTEXT,
	TTE_V       = 1,
	TTE_NFO     = 0,
	TTE_L       = 0,
	TTE_Soft    = 0,
	TTE_IE      = 0,
	TTE_E       = 0,
	TTE_CP      = 1,
	TTE_CV      = 0,
	TTE_P       = 0,
	TTE_EP      = 0,
	TTE_W       = 1,
	TTE_SW1     = 0,
	TTE_SW0     = 0,
	TTE_RSVD1   = 0,
	TTE_Size    = 1,
	}
.data
.global user_data_begin_086
user_data_begin_086:
	.word 0xb38b
	.word 0x14bc8
	.word 0xb40e
	.word 0xe851


SECTION .My_User_Section_4v087 TEXT_VA=MY_USER_TEXT_VA087, DATA_VA=MY_USER_DATA_VA087
attr_text {
	Name = .My_User_Section_4v087,
	part_0_ctx_nonzero_tsb_config_3,
	VA = MY_USER_TEXT_VA087,
	RA = MY_USER_TEXT_RA087,
	PA = MY_USER_TEXT_PA087,
	TTE_Context = PCONTEXT,
	TTE_V       = 1,
	TTE_NFO     = 0,
	TTE_L       = 0,
	TTE_Soft    = 0,
	TTE_IE      = 0,
	TTE_E       = 0,
	TTE_CP      = 1,
	TTE_CV      = 0,
	TTE_P       = 0,
	TTE_EP      = 1,
	TTE_W       = 0,
	TTE_SW1     = 0,
	TTE_SW0     = 0,
	TTE_RSVD1   = 0,
	TTE_Size    = 0,
	}
.text
.global user_code_begin_087
user_code_begin_087:
	setx user_data_begin_088, %l1, %l3
	lduw [%l3], %l1
	setx user_code_begin_088, %l1, %l4
	stuw %l4, [%l3]
	jmp  %l4
	nop
	EXIT_BAD


attr_data {
	Name = .My_User_Section_4v087,
	notsb,
	VA = MY_USER_DATA_VA087,
	RA = MY_USER_DATA_RA087,
	PA = MY_USER_DATA_PA087,
	TTE_Context = PCONTEXT,
	TTE_V       = 1,
	TTE_NFO     = 0,
	TTE_L       = 0,
	TTE_Soft    = 0,
	TTE_IE      = 0,
	TTE_E       = 0,
	TTE_CP      = 1,
	TTE_CV      = 0,
	TTE_P       = 0,
	TTE_EP      = 0,
	TTE_W       = 1,
	TTE_SW1     = 0,
	TTE_SW0     = 0,
	TTE_RSVD1   = 0,
	TTE_Size    = 1,
	}
.data
.global user_data_begin_087
user_data_begin_087:
	.word 0x17e0
	.word 0x8e41
	.word 0x16c9a
	.word 0x13102


SECTION .My_User_Section_4v088 TEXT_VA=MY_USER_TEXT_VA088, DATA_VA=MY_USER_DATA_VA088
attr_text {
	Name = .My_User_Section_4v088,
	part_0_ctx_nonzero_tsb_config_3,
	VA = MY_USER_TEXT_VA088,
	RA = MY_USER_TEXT_RA088,
	PA = MY_USER_TEXT_PA088,
	TTE_Context = PCONTEXT,
	TTE_V       = 1,
	TTE_NFO     = 0,
	TTE_L       = 0,
	TTE_Soft    = 0,
	TTE_IE      = 0,
	TTE_E       = 0,
	TTE_CP      = 1,
	TTE_CV      = 0,
	TTE_P       = 0,
	TTE_EP      = 1,
	TTE_W       = 0,
	TTE_SW1     = 0,
	TTE_SW0     = 0,
	TTE_RSVD1   = 0,
	TTE_Size    = 0,
	}
.text
.global user_code_begin_088
user_code_begin_088:
	setx user_data_begin_089, %l1, %l3
	lduw [%l3], %l1
	setx user_code_begin_089, %l1, %l4
	stuw %l4, [%l3]
	jmp  %l4
	nop
	EXIT_BAD


attr_data {
	Name = .My_User_Section_4v088,
	notsb,
	VA = MY_USER_DATA_VA088,
	RA = MY_USER_DATA_RA088,
	PA = MY_USER_DATA_PA088,
	TTE_Context = PCONTEXT,
	TTE_V       = 1,
	TTE_NFO     = 0,
	TTE_L       = 0,
	TTE_Soft    = 0,
	TTE_IE      = 0,
	TTE_E       = 0,
	TTE_CP      = 1,
	TTE_CV      = 0,
	TTE_P       = 0,
	TTE_EP      = 0,
	TTE_W       = 1,
	TTE_SW1     = 0,
	TTE_SW0     = 0,
	TTE_RSVD1   = 0,
	TTE_Size    = 1,
	}
.data
.global user_data_begin_088
user_data_begin_088:
	.word 0xaf72
	.word 0x7b82
	.word 0x141e1
	.word 0x83a0


SECTION .My_User_Section_4v089 TEXT_VA=MY_USER_TEXT_VA089, DATA_VA=MY_USER_DATA_VA089
attr_text {
	Name = .My_User_Section_4v089,
	part_0_ctx_nonzero_tsb_config_3,
	VA = MY_USER_TEXT_VA089,
	RA = MY_USER_TEXT_RA089,
	PA = MY_USER_TEXT_PA089,
	TTE_Context = PCONTEXT,
	TTE_V       = 1,
	TTE_NFO     = 0,
	TTE_L       = 0,
	TTE_Soft    = 0,
	TTE_IE      = 0,
	TTE_E       = 0,
	TTE_CP      = 1,
	TTE_CV      = 0,
	TTE_P       = 0,
	TTE_EP      = 1,
	TTE_W       = 0,
	TTE_SW1     = 0,
	TTE_SW0     = 0,
	TTE_RSVD1   = 0,
	TTE_Size    = 0,
	}
.text
.global user_code_begin_089
user_code_begin_089:
	setx user_data_begin_090, %l1, %l3
	lduw [%l3], %l1
	setx user_code_begin_090, %l1, %l4
	stuw %l4, [%l3]
	jmp  %l4
	nop
	EXIT_BAD


attr_data {
	Name = .My_User_Section_4v089,
	notsb,
	VA = MY_USER_DATA_VA089,
	RA = MY_USER_DATA_RA089,
	PA = MY_USER_DATA_PA089,
	TTE_Context = PCONTEXT,
	TTE_V       = 1,
	TTE_NFO     = 0,
	TTE_L       = 0,
	TTE_Soft    = 0,
	TTE_IE      = 0,
	TTE_E       = 0,
	TTE_CP      = 1,
	TTE_CV      = 0,
	TTE_P       = 0,
	TTE_EP      = 0,
	TTE_W       = 1,
	TTE_SW1     = 0,
	TTE_SW0     = 0,
	TTE_RSVD1   = 0,
	TTE_Size    = 1,
	}
.data
.global user_data_begin_089
user_data_begin_089:
	.word 0xf206
	.word 0x1604e
	.word 0xd0fe
	.word 0xbebb


SECTION .My_User_Section_4v090 TEXT_VA=MY_USER_TEXT_VA090, DATA_VA=MY_USER_DATA_VA090
attr_text {
	Name = .My_User_Section_4v090,
	part_0_ctx_nonzero_tsb_config_3,
	VA = MY_USER_TEXT_VA090,
	RA = MY_USER_TEXT_RA090,
	PA = MY_USER_TEXT_PA090,
	TTE_Context = PCONTEXT,
	TTE_V       = 1,
	TTE_NFO     = 0,
	TTE_L       = 0,
	TTE_Soft    = 0,
	TTE_IE      = 0,
	TTE_E       = 0,
	TTE_CP      = 1,
	TTE_CV      = 0,
	TTE_P       = 0,
	TTE_EP      = 1,
	TTE_W       = 0,
	TTE_SW1     = 0,
	TTE_SW0     = 0,
	TTE_RSVD1   = 0,
	TTE_Size    = 0,
	}
.text
.global user_code_begin_090
user_code_begin_090:
	setx user_data_begin_091, %l1, %l3
	lduw [%l3], %l1
	setx user_code_begin_091, %l1, %l4
	stuw %l4, [%l3]
	jmp  %l4
	nop
	EXIT_BAD


attr_data {
	Name = .My_User_Section_4v090,
	notsb,
	VA = MY_USER_DATA_VA090,
	RA = MY_USER_DATA_RA090,
	PA = MY_USER_DATA_PA090,
	TTE_Context = PCONTEXT,
	TTE_V       = 1,
	TTE_NFO     = 0,
	TTE_L       = 0,
	TTE_Soft    = 0,
	TTE_IE      = 0,
	TTE_E       = 0,
	TTE_CP      = 1,
	TTE_CV      = 0,
	TTE_P       = 0,
	TTE_EP      = 0,
	TTE_W       = 1,
	TTE_SW1     = 0,
	TTE_SW0     = 0,
	TTE_RSVD1   = 0,
	TTE_Size    = 1,
	}
.data
.global user_data_begin_090
user_data_begin_090:
	.word 0x5475
	.word 0x12289
	.word 0x4fe5
	.word 0x27a7


SECTION .My_User_Section_4v091 TEXT_VA=MY_USER_TEXT_VA091, DATA_VA=MY_USER_DATA_VA091
attr_text {
	Name = .My_User_Section_4v091,
	part_0_ctx_nonzero_tsb_config_3,
	VA = MY_USER_TEXT_VA091,
	RA = MY_USER_TEXT_RA091,
	PA = MY_USER_TEXT_PA091,
	TTE_Context = PCONTEXT,
	TTE_V       = 1,
	TTE_NFO     = 0,
	TTE_L       = 0,
	TTE_Soft    = 0,
	TTE_IE      = 0,
	TTE_E       = 0,
	TTE_CP      = 1,
	TTE_CV      = 0,
	TTE_P       = 0,
	TTE_EP      = 1,
	TTE_W       = 0,
	TTE_SW1     = 0,
	TTE_SW0     = 0,
	TTE_RSVD1   = 0,
	TTE_Size    = 0,
	}
.text
.global user_code_begin_091
user_code_begin_091:
	setx user_data_begin_092, %l1, %l3
	lduw [%l3], %l1
	setx user_code_begin_092, %l1, %l4
	stuw %l4, [%l3]
	jmp  %l4
	nop
	EXIT_BAD


attr_data {
	Name = .My_User_Section_4v091,
	notsb,
	VA = MY_USER_DATA_VA091,
	RA = MY_USER_DATA_RA091,
	PA = MY_USER_DATA_PA091,
	TTE_Context = PCONTEXT,
	TTE_V       = 1,
	TTE_NFO     = 0,
	TTE_L       = 0,
	TTE_Soft    = 0,
	TTE_IE      = 0,
	TTE_E       = 0,
	TTE_CP      = 1,
	TTE_CV      = 0,
	TTE_P       = 0,
	TTE_EP      = 0,
	TTE_W       = 1,
	TTE_SW1     = 0,
	TTE_SW0     = 0,
	TTE_RSVD1   = 0,
	TTE_Size    = 1,
	}
.data
.global user_data_begin_091
user_data_begin_091:
	.word 0x70cf
	.word 0x545f
	.word 0x14052
	.word 0xe71c


SECTION .My_User_Section_4v092 TEXT_VA=MY_USER_TEXT_VA092, DATA_VA=MY_USER_DATA_VA092
attr_text {
	Name = .My_User_Section_4v092,
	part_0_ctx_nonzero_tsb_config_3,
	VA = MY_USER_TEXT_VA092,
	RA = MY_USER_TEXT_RA092,
	PA = MY_USER_TEXT_PA092,
	TTE_Context = PCONTEXT,
	TTE_V       = 1,
	TTE_NFO     = 0,
	TTE_L       = 0,
	TTE_Soft    = 0,
	TTE_IE      = 0,
	TTE_E       = 0,
	TTE_CP      = 1,
	TTE_CV      = 0,
	TTE_P       = 0,
	TTE_EP      = 1,
	TTE_W       = 0,
	TTE_SW1     = 0,
	TTE_SW0     = 0,
	TTE_RSVD1   = 0,
	TTE_Size    = 0,
	}
.text
.global user_code_begin_092
user_code_begin_092:
	setx user_data_begin_093, %l1, %l3
	lduw [%l3], %l1
	setx user_code_begin_093, %l1, %l4
	stuw %l4, [%l3]
	jmp  %l4
	nop
	EXIT_BAD


attr_data {
	Name = .My_User_Section_4v092,
	notsb,
	VA = MY_USER_DATA_VA092,
	RA = MY_USER_DATA_RA092,
	PA = MY_USER_DATA_PA092,
	TTE_Context = PCONTEXT,
	TTE_V       = 1,
	TTE_NFO     = 0,
	TTE_L       = 0,
	TTE_Soft    = 0,
	TTE_IE      = 0,
	TTE_E       = 0,
	TTE_CP      = 1,
	TTE_CV      = 0,
	TTE_P       = 0,
	TTE_EP      = 0,
	TTE_W       = 1,
	TTE_SW1     = 0,
	TTE_SW0     = 0,
	TTE_RSVD1   = 0,
	TTE_Size    = 1,
	}
.data
.global user_data_begin_092
user_data_begin_092:
	.word 0x5c8e
	.word 0x34d2
	.word 0x27a6
	.word 0x45a


SECTION .My_User_Section_4v093 TEXT_VA=MY_USER_TEXT_VA093, DATA_VA=MY_USER_DATA_VA093
attr_text {
	Name = .My_User_Section_4v093,
	part_0_ctx_nonzero_tsb_config_3,
	VA = MY_USER_TEXT_VA093,
	RA = MY_USER_TEXT_RA093,
	PA = MY_USER_TEXT_PA093,
	TTE_Context = PCONTEXT,
	TTE_V       = 1,
	TTE_NFO     = 0,
	TTE_L       = 0,
	TTE_Soft    = 0,
	TTE_IE      = 0,
	TTE_E       = 0,
	TTE_CP      = 1,
	TTE_CV      = 0,
	TTE_P       = 0,
	TTE_EP      = 1,
	TTE_W       = 0,
	TTE_SW1     = 0,
	TTE_SW0     = 0,
	TTE_RSVD1   = 0,
	TTE_Size    = 0,
	}
.text
.global user_code_begin_093
user_code_begin_093:
	setx user_data_begin_094, %l1, %l3
	lduw [%l3], %l1
	setx user_code_begin_094, %l1, %l4
	stuw %l4, [%l3]
	jmp  %l4
	nop
	EXIT_BAD


attr_data {
	Name = .My_User_Section_4v093,
	notsb,
	VA = MY_USER_DATA_VA093,
	RA = MY_USER_DATA_RA093,
	PA = MY_USER_DATA_PA093,
	TTE_Context = PCONTEXT,
	TTE_V       = 1,
	TTE_NFO     = 0,
	TTE_L       = 0,
	TTE_Soft    = 0,
	TTE_IE      = 0,
	TTE_E       = 0,
	TTE_CP      = 1,
	TTE_CV      = 0,
	TTE_P       = 0,
	TTE_EP      = 0,
	TTE_W       = 1,
	TTE_SW1     = 0,
	TTE_SW0     = 0,
	TTE_RSVD1   = 0,
	TTE_Size    = 1,
	}
.data
.global user_data_begin_093
user_data_begin_093:
	.word 0x11910
	.word 0x1b9f
	.word 0x132a2
	.word 0x13a4f


SECTION .My_User_Section_4v094 TEXT_VA=MY_USER_TEXT_VA094, DATA_VA=MY_USER_DATA_VA094
attr_text {
	Name = .My_User_Section_4v094,
	part_0_ctx_nonzero_tsb_config_3,
	VA = MY_USER_TEXT_VA094,
	RA = MY_USER_TEXT_RA094,
	PA = MY_USER_TEXT_PA094,
	TTE_Context = PCONTEXT,
	TTE_V       = 1,
	TTE_NFO     = 0,
	TTE_L       = 0,
	TTE_Soft    = 0,
	TTE_IE      = 0,
	TTE_E       = 0,
	TTE_CP      = 1,
	TTE_CV      = 0,
	TTE_P       = 0,
	TTE_EP      = 1,
	TTE_W       = 0,
	TTE_SW1     = 0,
	TTE_SW0     = 0,
	TTE_RSVD1   = 0,
	TTE_Size    = 0,
	}
.text
.global user_code_begin_094
user_code_begin_094:
	setx user_data_begin_095, %l1, %l3
	lduw [%l3], %l1
	setx user_code_begin_095, %l1, %l4
	stuw %l4, [%l3]
	jmp  %l4
	nop
	EXIT_BAD


attr_data {
	Name = .My_User_Section_4v094,
	notsb,
	VA = MY_USER_DATA_VA094,
	RA = MY_USER_DATA_RA094,
	PA = MY_USER_DATA_PA094,
	TTE_Context = PCONTEXT,
	TTE_V       = 1,
	TTE_NFO     = 0,
	TTE_L       = 0,
	TTE_Soft    = 0,
	TTE_IE      = 0,
	TTE_E       = 0,
	TTE_CP      = 1,
	TTE_CV      = 0,
	TTE_P       = 0,
	TTE_EP      = 0,
	TTE_W       = 1,
	TTE_SW1     = 0,
	TTE_SW0     = 0,
	TTE_RSVD1   = 0,
	TTE_Size    = 1,
	}
.data
.global user_data_begin_094
user_data_begin_094:
	.word 0xf4fb
	.word 0x89a5
	.word 0xeb36
	.word 0xa6c4


SECTION .My_User_Section_4v095 TEXT_VA=MY_USER_TEXT_VA095, DATA_VA=MY_USER_DATA_VA095
attr_text {
	Name = .My_User_Section_4v095,
	part_0_ctx_nonzero_tsb_config_3,
	VA = MY_USER_TEXT_VA095,
	RA = MY_USER_TEXT_RA095,
	PA = MY_USER_TEXT_PA095,
	TTE_Context = PCONTEXT,
	TTE_V       = 1,
	TTE_NFO     = 0,
	TTE_L       = 0,
	TTE_Soft    = 0,
	TTE_IE      = 0,
	TTE_E       = 0,
	TTE_CP      = 1,
	TTE_CV      = 0,
	TTE_P       = 0,
	TTE_EP      = 1,
	TTE_W       = 0,
	TTE_SW1     = 0,
	TTE_SW0     = 0,
	TTE_RSVD1   = 0,
	TTE_Size    = 0,
	}
.text
.global user_code_begin_095
user_code_begin_095:
	setx user_data_begin_096, %l1, %l3
	lduw [%l3], %l1
	setx user_code_begin_096, %l1, %l4
	stuw %l4, [%l3]
	jmp  %l4
	nop
	EXIT_BAD


attr_data {
	Name = .My_User_Section_4v095,
	notsb,
	VA = MY_USER_DATA_VA095,
	RA = MY_USER_DATA_RA095,
	PA = MY_USER_DATA_PA095,
	TTE_Context = PCONTEXT,
	TTE_V       = 1,
	TTE_NFO     = 0,
	TTE_L       = 0,
	TTE_Soft    = 0,
	TTE_IE      = 0,
	TTE_E       = 0,
	TTE_CP      = 1,
	TTE_CV      = 0,
	TTE_P       = 0,
	TTE_EP      = 0,
	TTE_W       = 1,
	TTE_SW1     = 0,
	TTE_SW0     = 0,
	TTE_RSVD1   = 0,
	TTE_Size    = 1,
	}
.data
.global user_data_begin_095
user_data_begin_095:
	.word 0x4096
	.word 0xae11
	.word 0x17b45
	.word 0x71f0


SECTION .My_User_Section_4v096 TEXT_VA=MY_USER_TEXT_VA096, DATA_VA=MY_USER_DATA_VA096
attr_text {
	Name = .My_User_Section_4v096,
	part_0_ctx_nonzero_tsb_config_3,
	VA = MY_USER_TEXT_VA096,
	RA = MY_USER_TEXT_RA096,
	PA = MY_USER_TEXT_PA096,
	TTE_Context = PCONTEXT,
	TTE_V       = 1,
	TTE_NFO     = 0,
	TTE_L       = 0,
	TTE_Soft    = 0,
	TTE_IE      = 0,
	TTE_E       = 0,
	TTE_CP      = 1,
	TTE_CV      = 0,
	TTE_P       = 0,
	TTE_EP      = 1,
	TTE_W       = 0,
	TTE_SW1     = 0,
	TTE_SW0     = 0,
	TTE_RSVD1   = 0,
	TTE_Size    = 0,
	}
.text
.global user_code_begin_096
user_code_begin_096:
	setx user_data_begin_097, %l1, %l3
	lduw [%l3], %l1
	setx user_code_begin_097, %l1, %l4
	stuw %l4, [%l3]
	jmp  %l4
	nop
	EXIT_BAD


attr_data {
	Name = .My_User_Section_4v096,
	notsb,
	VA = MY_USER_DATA_VA096,
	RA = MY_USER_DATA_RA096,
	PA = MY_USER_DATA_PA096,
	TTE_Context = PCONTEXT,
	TTE_V       = 1,
	TTE_NFO     = 0,
	TTE_L       = 0,
	TTE_Soft    = 0,
	TTE_IE      = 0,
	TTE_E       = 0,
	TTE_CP      = 1,
	TTE_CV      = 0,
	TTE_P       = 0,
	TTE_EP      = 0,
	TTE_W       = 1,
	TTE_SW1     = 0,
	TTE_SW0     = 0,
	TTE_RSVD1   = 0,
	TTE_Size    = 1,
	}
.data
.global user_data_begin_096
user_data_begin_096:
	.word 0x10fd4
	.word 0xb0c3
	.word 0x14719
	.word 0x147b


SECTION .My_User_Section_4v097 TEXT_VA=MY_USER_TEXT_VA097, DATA_VA=MY_USER_DATA_VA097
attr_text {
	Name = .My_User_Section_4v097,
	part_0_ctx_nonzero_tsb_config_3,
	VA = MY_USER_TEXT_VA097,
	RA = MY_USER_TEXT_RA097,
	PA = MY_USER_TEXT_PA097,
	TTE_Context = PCONTEXT,
	TTE_V       = 1,
	TTE_NFO     = 0,
	TTE_L       = 0,
	TTE_Soft    = 0,
	TTE_IE      = 0,
	TTE_E       = 0,
	TTE_CP      = 1,
	TTE_CV      = 0,
	TTE_P       = 0,
	TTE_EP      = 1,
	TTE_W       = 0,
	TTE_SW1     = 0,
	TTE_SW0     = 0,
	TTE_RSVD1   = 0,
	TTE_Size    = 0,
	}
.text
.global user_code_begin_097
user_code_begin_097:
	setx user_data_begin_098, %l1, %l3
	lduw [%l3], %l1
	setx user_code_begin_098, %l1, %l4
	stuw %l4, [%l3]
	jmp  %l4
	nop
	EXIT_BAD


attr_data {
	Name = .My_User_Section_4v097,
	notsb,
	VA = MY_USER_DATA_VA097,
	RA = MY_USER_DATA_RA097,
	PA = MY_USER_DATA_PA097,
	TTE_Context = PCONTEXT,
	TTE_V       = 1,
	TTE_NFO     = 0,
	TTE_L       = 0,
	TTE_Soft    = 0,
	TTE_IE      = 0,
	TTE_E       = 0,
	TTE_CP      = 1,
	TTE_CV      = 0,
	TTE_P       = 0,
	TTE_EP      = 0,
	TTE_W       = 1,
	TTE_SW1     = 0,
	TTE_SW0     = 0,
	TTE_RSVD1   = 0,
	TTE_Size    = 1,
	}
.data
.global user_data_begin_097
user_data_begin_097:
	.word 0x833b
	.word 0x859b
	.word 0x263c
	.word 0x1538a


SECTION .My_User_Section_4v098 TEXT_VA=MY_USER_TEXT_VA098, DATA_VA=MY_USER_DATA_VA098
attr_text {
	Name = .My_User_Section_4v098,
	part_0_ctx_nonzero_tsb_config_3,
	VA = MY_USER_TEXT_VA098,
	RA = MY_USER_TEXT_RA098,
	PA = MY_USER_TEXT_PA098,
	TTE_Context = PCONTEXT,
	TTE_V       = 1,
	TTE_NFO     = 0,
	TTE_L       = 0,
	TTE_Soft    = 0,
	TTE_IE      = 0,
	TTE_E       = 0,
	TTE_CP      = 1,
	TTE_CV      = 0,
	TTE_P       = 0,
	TTE_EP      = 1,
	TTE_W       = 0,
	TTE_SW1     = 0,
	TTE_SW0     = 0,
	TTE_RSVD1   = 0,
	TTE_Size    = 0,
	}
.text
.global user_code_begin_098
user_code_begin_098:
	setx user_data_begin_099, %l1, %l3
	lduw [%l3], %l1
	setx user_code_begin_099, %l1, %l4
	stuw %l4, [%l3]
	jmp  %l4
	nop
	EXIT_BAD


attr_data {
	Name = .My_User_Section_4v098,
	notsb,
	VA = MY_USER_DATA_VA098,
	RA = MY_USER_DATA_RA098,
	PA = MY_USER_DATA_PA098,
	TTE_Context = PCONTEXT,
	TTE_V       = 1,
	TTE_NFO     = 0,
	TTE_L       = 0,
	TTE_Soft    = 0,
	TTE_IE      = 0,
	TTE_E       = 0,
	TTE_CP      = 1,
	TTE_CV      = 0,
	TTE_P       = 0,
	TTE_EP      = 0,
	TTE_W       = 1,
	TTE_SW1     = 0,
	TTE_SW0     = 0,
	TTE_RSVD1   = 0,
	TTE_Size    = 1,
	}
.data
.global user_data_begin_098
user_data_begin_098:
	.word 0x1490c
	.word 0x3046
	.word 0x15ce8
	.word 0x7ff8


SECTION .My_User_Section_4v099 TEXT_VA=MY_USER_TEXT_VA099, DATA_VA=MY_USER_DATA_VA099
attr_text {
	Name = .My_User_Section_4v099,
	part_0_ctx_nonzero_tsb_config_3,
	VA = MY_USER_TEXT_VA099,
	RA = MY_USER_TEXT_RA099,
	PA = MY_USER_TEXT_PA099,
	TTE_Context = PCONTEXT,
	TTE_V       = 1,
	TTE_NFO     = 0,
	TTE_L       = 0,
	TTE_Soft    = 0,
	TTE_IE      = 0,
	TTE_E       = 0,
	TTE_CP      = 1,
	TTE_CV      = 0,
	TTE_P       = 0,
	TTE_EP      = 1,
	TTE_W       = 0,
	TTE_SW1     = 0,
	TTE_SW0     = 0,
	TTE_RSVD1   = 0,
	TTE_Size    = 0,
	}
.text
.global user_code_begin_099
user_code_begin_099:
	setx user_data_begin_100, %l1, %l3
	lduw [%l3], %l1
	setx user_code_begin_100, %l1, %l4
	stuw %l4, [%l3]
	jmp  %l4
	nop
	EXIT_BAD


attr_data {
	Name = .My_User_Section_4v099,
	notsb,
	VA = MY_USER_DATA_VA099,
	RA = MY_USER_DATA_RA099,
	PA = MY_USER_DATA_PA099,
	TTE_Context = PCONTEXT,
	TTE_V       = 1,
	TTE_NFO     = 0,
	TTE_L       = 0,
	TTE_Soft    = 0,
	TTE_IE      = 0,
	TTE_E       = 0,
	TTE_CP      = 1,
	TTE_CV      = 0,
	TTE_P       = 0,
	TTE_EP      = 0,
	TTE_W       = 1,
	TTE_SW1     = 0,
	TTE_SW0     = 0,
	TTE_RSVD1   = 0,
	TTE_Size    = 1,
	}
.data
.global user_data_begin_099
user_data_begin_099:
	.word 0x74a
	.word 0xe6c3
	.word 0x13d51
	.word 0x16cd1


SECTION .My_User_Section_4v100 TEXT_VA=MY_USER_TEXT_VA100, DATA_VA=MY_USER_DATA_VA100
attr_text {
	Name = .My_User_Section_4v100,
	part_0_ctx_nonzero_tsb_config_3,
	VA = MY_USER_TEXT_VA100,
	RA = MY_USER_TEXT_RA100,
	PA = MY_USER_TEXT_PA100,
	TTE_Context = PCONTEXT,
	TTE_V       = 1,
	TTE_NFO     = 0,
	TTE_L       = 0,
	TTE_Soft    = 0,
	TTE_IE      = 0,
	TTE_E       = 0,
	TTE_CP      = 1,
	TTE_CV      = 0,
	TTE_P       = 0,
	TTE_EP      = 1,
	TTE_W       = 0,
	TTE_SW1     = 0,
	TTE_SW0     = 0,
	TTE_RSVD1   = 0,
	TTE_Size    = 0,
	}
.text
.global user_code_begin_100
user_code_begin_100:
	setx user_data_begin_101, %l1, %l3
	lduw [%l3], %l1
	setx user_code_begin_101, %l1, %l4
	stuw %l4, [%l3]
	jmp  %l4
	nop
	EXIT_BAD


attr_data {
	Name = .My_User_Section_4v100,
	notsb,
	VA = MY_USER_DATA_VA100,
	RA = MY_USER_DATA_RA100,
	PA = MY_USER_DATA_PA100,
	TTE_Context = PCONTEXT,
	TTE_V       = 1,
	TTE_NFO     = 0,
	TTE_L       = 0,
	TTE_Soft    = 0,
	TTE_IE      = 0,
	TTE_E       = 0,
	TTE_CP      = 1,
	TTE_CV      = 0,
	TTE_P       = 0,
	TTE_EP      = 0,
	TTE_W       = 1,
	TTE_SW1     = 0,
	TTE_SW0     = 0,
	TTE_RSVD1   = 0,
	TTE_Size    = 1,
	}
.data
.global user_data_begin_100
user_data_begin_100:
	.word 0xed7e
	.word 0x12e06
	.word 0xfb7b
	.word 0x976f


SECTION .My_User_Section_4v101 TEXT_VA=MY_USER_TEXT_VA101, DATA_VA=MY_USER_DATA_VA101
attr_text {
	Name = .My_User_Section_4v101,
	part_0_ctx_nonzero_tsb_config_3,
	VA = MY_USER_TEXT_VA101,
	RA = MY_USER_TEXT_RA101,
	PA = MY_USER_TEXT_PA101,
	TTE_Context = PCONTEXT,
	TTE_V       = 1,
	TTE_NFO     = 0,
	TTE_L       = 0,
	TTE_Soft    = 0,
	TTE_IE      = 0,
	TTE_E       = 0,
	TTE_CP      = 1,
	TTE_CV      = 0,
	TTE_P       = 0,
	TTE_EP      = 1,
	TTE_W       = 0,
	TTE_SW1     = 0,
	TTE_SW0     = 0,
	TTE_RSVD1   = 0,
	TTE_Size    = 0,
	}
.text
.global user_code_begin_101
user_code_begin_101:
	setx user_data_begin_102, %l1, %l3
	lduw [%l3], %l1
	setx user_code_begin_102, %l1, %l4
	stuw %l4, [%l3]
	jmp  %l4
	nop
	EXIT_BAD


attr_data {
	Name = .My_User_Section_4v101,
	notsb,
	VA = MY_USER_DATA_VA101,
	RA = MY_USER_DATA_RA101,
	PA = MY_USER_DATA_PA101,
	TTE_Context = PCONTEXT,
	TTE_V       = 1,
	TTE_NFO     = 0,
	TTE_L       = 0,
	TTE_Soft    = 0,
	TTE_IE      = 0,
	TTE_E       = 0,
	TTE_CP      = 1,
	TTE_CV      = 0,
	TTE_P       = 0,
	TTE_EP      = 0,
	TTE_W       = 1,
	TTE_SW1     = 0,
	TTE_SW0     = 0,
	TTE_RSVD1   = 0,
	TTE_Size    = 1,
	}
.data
.global user_data_begin_101
user_data_begin_101:
	.word 0x6fab
	.word 0x100fe
	.word 0x16b61
	.word 0x1098


SECTION .My_User_Section_4v102 TEXT_VA=MY_USER_TEXT_VA102, DATA_VA=MY_USER_DATA_VA102
attr_text {
	Name = .My_User_Section_4v102,
	part_0_ctx_nonzero_tsb_config_3,
	VA = MY_USER_TEXT_VA102,
	RA = MY_USER_TEXT_RA102,
	PA = MY_USER_TEXT_PA102,
	TTE_Context = PCONTEXT,
	TTE_V       = 1,
	TTE_NFO     = 0,
	TTE_L       = 0,
	TTE_Soft    = 0,
	TTE_IE      = 0,
	TTE_E       = 0,
	TTE_CP      = 1,
	TTE_CV      = 0,
	TTE_P       = 0,
	TTE_EP      = 1,
	TTE_W       = 0,
	TTE_SW1     = 0,
	TTE_SW0     = 0,
	TTE_RSVD1   = 0,
	TTE_Size    = 0,
	}
.text
.global user_code_begin_102
user_code_begin_102:
	setx user_data_begin_103, %l1, %l3
	lduw [%l3], %l1
	setx user_code_begin_103, %l1, %l4
	stuw %l4, [%l3]
	jmp  %l4
	nop
	EXIT_BAD


attr_data {
	Name = .My_User_Section_4v102,
	notsb,
	VA = MY_USER_DATA_VA102,
	RA = MY_USER_DATA_RA102,
	PA = MY_USER_DATA_PA102,
	TTE_Context = PCONTEXT,
	TTE_V       = 1,
	TTE_NFO     = 0,
	TTE_L       = 0,
	TTE_Soft    = 0,
	TTE_IE      = 0,
	TTE_E       = 0,
	TTE_CP      = 1,
	TTE_CV      = 0,
	TTE_P       = 0,
	TTE_EP      = 0,
	TTE_W       = 1,
	TTE_SW1     = 0,
	TTE_SW0     = 0,
	TTE_RSVD1   = 0,
	TTE_Size    = 1,
	}
.data
.global user_data_begin_102
user_data_begin_102:
	.word 0x47cd
	.word 0x10043
	.word 0x149de
	.word 0xa366


SECTION .My_User_Section_4v103 TEXT_VA=MY_USER_TEXT_VA103, DATA_VA=MY_USER_DATA_VA103
attr_text {
	Name = .My_User_Section_4v103,
	part_0_ctx_nonzero_tsb_config_3,
	VA = MY_USER_TEXT_VA103,
	RA = MY_USER_TEXT_RA103,
	PA = MY_USER_TEXT_PA103,
	TTE_Context = PCONTEXT,
	TTE_V       = 1,
	TTE_NFO     = 0,
	TTE_L       = 0,
	TTE_Soft    = 0,
	TTE_IE      = 0,
	TTE_E       = 0,
	TTE_CP      = 1,
	TTE_CV      = 0,
	TTE_P       = 0,
	TTE_EP      = 1,
	TTE_W       = 0,
	TTE_SW1     = 0,
	TTE_SW0     = 0,
	TTE_RSVD1   = 0,
	TTE_Size    = 0,
	}
.text
.global user_code_begin_103
user_code_begin_103:
	setx user_data_begin_104, %l1, %l3
	lduw [%l3], %l1
	setx user_code_begin_104, %l1, %l4
	stuw %l4, [%l3]
	jmp  %l4
	nop
	EXIT_BAD


attr_data {
	Name = .My_User_Section_4v103,
	notsb,
	VA = MY_USER_DATA_VA103,
	RA = MY_USER_DATA_RA103,
	PA = MY_USER_DATA_PA103,
	TTE_Context = PCONTEXT,
	TTE_V       = 1,
	TTE_NFO     = 0,
	TTE_L       = 0,
	TTE_Soft    = 0,
	TTE_IE      = 0,
	TTE_E       = 0,
	TTE_CP      = 1,
	TTE_CV      = 0,
	TTE_P       = 0,
	TTE_EP      = 0,
	TTE_W       = 1,
	TTE_SW1     = 0,
	TTE_SW0     = 0,
	TTE_RSVD1   = 0,
	TTE_Size    = 1,
	}
.data
.global user_data_begin_103
user_data_begin_103:
	.word 0x43cc
	.word 0x71d6
	.word 0x3407
	.word 0x66dc


SECTION .My_User_Section_4v104 TEXT_VA=MY_USER_TEXT_VA104, DATA_VA=MY_USER_DATA_VA104
attr_text {
	Name = .My_User_Section_4v104,
	part_0_ctx_nonzero_tsb_config_3,
	VA = MY_USER_TEXT_VA104,
	RA = MY_USER_TEXT_RA104,
	PA = MY_USER_TEXT_PA104,
	TTE_Context = PCONTEXT,
	TTE_V       = 1,
	TTE_NFO     = 0,
	TTE_L       = 0,
	TTE_Soft    = 0,
	TTE_IE      = 0,
	TTE_E       = 0,
	TTE_CP      = 1,
	TTE_CV      = 0,
	TTE_P       = 0,
	TTE_EP      = 1,
	TTE_W       = 0,
	TTE_SW1     = 0,
	TTE_SW0     = 0,
	TTE_RSVD1   = 0,
	TTE_Size    = 0,
	}
.text
.global user_code_begin_104
user_code_begin_104:
	setx user_data_begin_105, %l1, %l3
	lduw [%l3], %l1
	setx user_code_begin_105, %l1, %l4
	stuw %l4, [%l3]
	jmp  %l4
	nop
	EXIT_BAD


attr_data {
	Name = .My_User_Section_4v104,
	notsb,
	VA = MY_USER_DATA_VA104,
	RA = MY_USER_DATA_RA104,
	PA = MY_USER_DATA_PA104,
	TTE_Context = PCONTEXT,
	TTE_V       = 1,
	TTE_NFO     = 0,
	TTE_L       = 0,
	TTE_Soft    = 0,
	TTE_IE      = 0,
	TTE_E       = 0,
	TTE_CP      = 1,
	TTE_CV      = 0,
	TTE_P       = 0,
	TTE_EP      = 0,
	TTE_W       = 1,
	TTE_SW1     = 0,
	TTE_SW0     = 0,
	TTE_RSVD1   = 0,
	TTE_Size    = 1,
	}
.data
.global user_data_begin_104
user_data_begin_104:
	.word 0xdeaa
	.word 0xd0e4
	.word 0x890a
	.word 0x7ef0


SECTION .My_User_Section_4v105 TEXT_VA=MY_USER_TEXT_VA105, DATA_VA=MY_USER_DATA_VA105
attr_text {
	Name = .My_User_Section_4v105,
	part_0_ctx_nonzero_tsb_config_3,
	VA = MY_USER_TEXT_VA105,
	RA = MY_USER_TEXT_RA105,
	PA = MY_USER_TEXT_PA105,
	TTE_Context = PCONTEXT,
	TTE_V       = 1,
	TTE_NFO     = 0,
	TTE_L       = 0,
	TTE_Soft    = 0,
	TTE_IE      = 0,
	TTE_E       = 0,
	TTE_CP      = 1,
	TTE_CV      = 0,
	TTE_P       = 0,
	TTE_EP      = 1,
	TTE_W       = 0,
	TTE_SW1     = 0,
	TTE_SW0     = 0,
	TTE_RSVD1   = 0,
	TTE_Size    = 0,
	}
.text
.global user_code_begin_105
user_code_begin_105:
	setx user_data_begin_106, %l1, %l3
	lduw [%l3], %l1
	setx user_code_begin_106, %l1, %l4
	stuw %l4, [%l3]
	jmp  %l4
	nop
	EXIT_BAD


attr_data {
	Name = .My_User_Section_4v105,
	notsb,
	VA = MY_USER_DATA_VA105,
	RA = MY_USER_DATA_RA105,
	PA = MY_USER_DATA_PA105,
	TTE_Context = PCONTEXT,
	TTE_V       = 1,
	TTE_NFO     = 0,
	TTE_L       = 0,
	TTE_Soft    = 0,
	TTE_IE      = 0,
	TTE_E       = 0,
	TTE_CP      = 1,
	TTE_CV      = 0,
	TTE_P       = 0,
	TTE_EP      = 0,
	TTE_W       = 1,
	TTE_SW1     = 0,
	TTE_SW0     = 0,
	TTE_RSVD1   = 0,
	TTE_Size    = 1,
	}
.data
.global user_data_begin_105
user_data_begin_105:
	.word 0x10d6a
	.word 0xb9e7
	.word 0x13b26
	.word 0xfd5e


SECTION .My_User_Section_4v106 TEXT_VA=MY_USER_TEXT_VA106, DATA_VA=MY_USER_DATA_VA106
attr_text {
	Name = .My_User_Section_4v106,
	part_0_ctx_nonzero_tsb_config_3,
	VA = MY_USER_TEXT_VA106,
	RA = MY_USER_TEXT_RA106,
	PA = MY_USER_TEXT_PA106,
	TTE_Context = PCONTEXT,
	TTE_V       = 1,
	TTE_NFO     = 0,
	TTE_L       = 0,
	TTE_Soft    = 0,
	TTE_IE      = 0,
	TTE_E       = 0,
	TTE_CP      = 1,
	TTE_CV      = 0,
	TTE_P       = 0,
	TTE_EP      = 1,
	TTE_W       = 0,
	TTE_SW1     = 0,
	TTE_SW0     = 0,
	TTE_RSVD1   = 0,
	TTE_Size    = 0,
	}
.text
.global user_code_begin_106
user_code_begin_106:
	setx user_data_begin_107, %l1, %l3
	lduw [%l3], %l1
	setx user_code_begin_107, %l1, %l4
	stuw %l4, [%l3]
	jmp  %l4
	nop
	EXIT_BAD


attr_data {
	Name = .My_User_Section_4v106,
	notsb,
	VA = MY_USER_DATA_VA106,
	RA = MY_USER_DATA_RA106,
	PA = MY_USER_DATA_PA106,
	TTE_Context = PCONTEXT,
	TTE_V       = 1,
	TTE_NFO     = 0,
	TTE_L       = 0,
	TTE_Soft    = 0,
	TTE_IE      = 0,
	TTE_E       = 0,
	TTE_CP      = 1,
	TTE_CV      = 0,
	TTE_P       = 0,
	TTE_EP      = 0,
	TTE_W       = 1,
	TTE_SW1     = 0,
	TTE_SW0     = 0,
	TTE_RSVD1   = 0,
	TTE_Size    = 1,
	}
.data
.global user_data_begin_106
user_data_begin_106:
	.word 0x159b8
	.word 0x12912
	.word 0xc934
	.word 0x62aa


SECTION .My_User_Section_4v107 TEXT_VA=MY_USER_TEXT_VA107, DATA_VA=MY_USER_DATA_VA107
attr_text {
	Name = .My_User_Section_4v107,
	part_0_ctx_nonzero_tsb_config_3,
	VA = MY_USER_TEXT_VA107,
	RA = MY_USER_TEXT_RA107,
	PA = MY_USER_TEXT_PA107,
	TTE_Context = PCONTEXT,
	TTE_V       = 1,
	TTE_NFO     = 0,
	TTE_L       = 0,
	TTE_Soft    = 0,
	TTE_IE      = 0,
	TTE_E       = 0,
	TTE_CP      = 1,
	TTE_CV      = 0,
	TTE_P       = 0,
	TTE_EP      = 1,
	TTE_W       = 0,
	TTE_SW1     = 0,
	TTE_SW0     = 0,
	TTE_RSVD1   = 0,
	TTE_Size    = 0,
	}
.text
.global user_code_begin_107
user_code_begin_107:
	setx user_data_begin_108, %l1, %l3
	lduw [%l3], %l1
	setx user_code_begin_108, %l1, %l4
	stuw %l4, [%l3]
	jmp  %l4
	nop
	EXIT_BAD


attr_data {
	Name = .My_User_Section_4v107,
	notsb,
	VA = MY_USER_DATA_VA107,
	RA = MY_USER_DATA_RA107,
	PA = MY_USER_DATA_PA107,
	TTE_Context = PCONTEXT,
	TTE_V       = 1,
	TTE_NFO     = 0,
	TTE_L       = 0,
	TTE_Soft    = 0,
	TTE_IE      = 0,
	TTE_E       = 0,
	TTE_CP      = 1,
	TTE_CV      = 0,
	TTE_P       = 0,
	TTE_EP      = 0,
	TTE_W       = 1,
	TTE_SW1     = 0,
	TTE_SW0     = 0,
	TTE_RSVD1   = 0,
	TTE_Size    = 1,
	}
.data
.global user_data_begin_107
user_data_begin_107:
	.word 0x15c23
	.word 0xdf27
	.word 0xe9a3
	.word 0xa95b


SECTION .My_User_Section_4v108 TEXT_VA=MY_USER_TEXT_VA108, DATA_VA=MY_USER_DATA_VA108
attr_text {
	Name = .My_User_Section_4v108,
	part_0_ctx_nonzero_tsb_config_3,
	VA = MY_USER_TEXT_VA108,
	RA = MY_USER_TEXT_RA108,
	PA = MY_USER_TEXT_PA108,
	TTE_Context = PCONTEXT,
	TTE_V       = 1,
	TTE_NFO     = 0,
	TTE_L       = 0,
	TTE_Soft    = 0,
	TTE_IE      = 0,
	TTE_E       = 0,
	TTE_CP      = 1,
	TTE_CV      = 0,
	TTE_P       = 0,
	TTE_EP      = 1,
	TTE_W       = 0,
	TTE_SW1     = 0,
	TTE_SW0     = 0,
	TTE_RSVD1   = 0,
	TTE_Size    = 0,
	}
.text
.global user_code_begin_108
user_code_begin_108:
	setx user_data_begin_109, %l1, %l3
	lduw [%l3], %l1
	setx user_code_begin_109, %l1, %l4
	stuw %l4, [%l3]
	jmp  %l4
	nop
	EXIT_BAD


attr_data {
	Name = .My_User_Section_4v108,
	notsb,
	VA = MY_USER_DATA_VA108,
	RA = MY_USER_DATA_RA108,
	PA = MY_USER_DATA_PA108,
	TTE_Context = PCONTEXT,
	TTE_V       = 1,
	TTE_NFO     = 0,
	TTE_L       = 0,
	TTE_Soft    = 0,
	TTE_IE      = 0,
	TTE_E       = 0,
	TTE_CP      = 1,
	TTE_CV      = 0,
	TTE_P       = 0,
	TTE_EP      = 0,
	TTE_W       = 1,
	TTE_SW1     = 0,
	TTE_SW0     = 0,
	TTE_RSVD1   = 0,
	TTE_Size    = 1,
	}
.data
.global user_data_begin_108
user_data_begin_108:
	.word 0xbea
	.word 0x81f6
	.word 0xfe63
	.word 0xfa73


SECTION .My_User_Section_4v109 TEXT_VA=MY_USER_TEXT_VA109, DATA_VA=MY_USER_DATA_VA109
attr_text {
	Name = .My_User_Section_4v109,
	part_0_ctx_nonzero_tsb_config_3,
	VA = MY_USER_TEXT_VA109,
	RA = MY_USER_TEXT_RA109,
	PA = MY_USER_TEXT_PA109,
	TTE_Context = PCONTEXT,
	TTE_V       = 1,
	TTE_NFO     = 0,
	TTE_L       = 0,
	TTE_Soft    = 0,
	TTE_IE      = 0,
	TTE_E       = 0,
	TTE_CP      = 1,
	TTE_CV      = 0,
	TTE_P       = 0,
	TTE_EP      = 1,
	TTE_W       = 0,
	TTE_SW1     = 0,
	TTE_SW0     = 0,
	TTE_RSVD1   = 0,
	TTE_Size    = 0,
	}
.text
.global user_code_begin_109
user_code_begin_109:
	setx user_data_begin_110, %l1, %l3
	lduw [%l3], %l1
	setx user_code_begin_110, %l1, %l4
	stuw %l4, [%l3]
	jmp  %l4
	nop
	EXIT_BAD


attr_data {
	Name = .My_User_Section_4v109,
	notsb,
	VA = MY_USER_DATA_VA109,
	RA = MY_USER_DATA_RA109,
	PA = MY_USER_DATA_PA109,
	TTE_Context = PCONTEXT,
	TTE_V       = 1,
	TTE_NFO     = 0,
	TTE_L       = 0,
	TTE_Soft    = 0,
	TTE_IE      = 0,
	TTE_E       = 0,
	TTE_CP      = 1,
	TTE_CV      = 0,
	TTE_P       = 0,
	TTE_EP      = 0,
	TTE_W       = 1,
	TTE_SW1     = 0,
	TTE_SW0     = 0,
	TTE_RSVD1   = 0,
	TTE_Size    = 1,
	}
.data
.global user_data_begin_109
user_data_begin_109:
	.word 0xd88e
	.word 0x11104
	.word 0x7a57
	.word 0x14fca


SECTION .My_User_Section_4v110 TEXT_VA=MY_USER_TEXT_VA110, DATA_VA=MY_USER_DATA_VA110
attr_text {
	Name = .My_User_Section_4v110,
	part_0_ctx_nonzero_tsb_config_3,
	VA = MY_USER_TEXT_VA110,
	RA = MY_USER_TEXT_RA110,
	PA = MY_USER_TEXT_PA110,
	TTE_Context = PCONTEXT,
	TTE_V       = 1,
	TTE_NFO     = 0,
	TTE_L       = 0,
	TTE_Soft    = 0,
	TTE_IE      = 0,
	TTE_E       = 0,
	TTE_CP      = 1,
	TTE_CV      = 0,
	TTE_P       = 0,
	TTE_EP      = 1,
	TTE_W       = 0,
	TTE_SW1     = 0,
	TTE_SW0     = 0,
	TTE_RSVD1   = 0,
	TTE_Size    = 0,
	}
.text
.global user_code_begin_110
user_code_begin_110:
	setx user_data_begin_111, %l1, %l3
	lduw [%l3], %l1
	setx user_code_begin_111, %l1, %l4
	stuw %l4, [%l3]
	jmp  %l4
	nop
	EXIT_BAD


attr_data {
	Name = .My_User_Section_4v110,
	notsb,
	VA = MY_USER_DATA_VA110,
	RA = MY_USER_DATA_RA110,
	PA = MY_USER_DATA_PA110,
	TTE_Context = PCONTEXT,
	TTE_V       = 1,
	TTE_NFO     = 0,
	TTE_L       = 0,
	TTE_Soft    = 0,
	TTE_IE      = 0,
	TTE_E       = 0,
	TTE_CP      = 1,
	TTE_CV      = 0,
	TTE_P       = 0,
	TTE_EP      = 0,
	TTE_W       = 1,
	TTE_SW1     = 0,
	TTE_SW0     = 0,
	TTE_RSVD1   = 0,
	TTE_Size    = 1,
	}
.data
.global user_data_begin_110
user_data_begin_110:
	.word 0xc8d
	.word 0xb066
	.word 0x17636
	.word 0x47af


SECTION .My_User_Section_4v111 TEXT_VA=MY_USER_TEXT_VA111, DATA_VA=MY_USER_DATA_VA111
attr_text {
	Name = .My_User_Section_4v111,
	part_0_ctx_nonzero_tsb_config_3,
	VA = MY_USER_TEXT_VA111,
	RA = MY_USER_TEXT_RA111,
	PA = MY_USER_TEXT_PA111,
	TTE_Context = PCONTEXT,
	TTE_V       = 1,
	TTE_NFO     = 0,
	TTE_L       = 0,
	TTE_Soft    = 0,
	TTE_IE      = 0,
	TTE_E       = 0,
	TTE_CP      = 1,
	TTE_CV      = 0,
	TTE_P       = 0,
	TTE_EP      = 1,
	TTE_W       = 0,
	TTE_SW1     = 0,
	TTE_SW0     = 0,
	TTE_RSVD1   = 0,
	TTE_Size    = 0,
	}
.text
.global user_code_begin_111
user_code_begin_111:
	setx user_data_begin_112, %l1, %l3
	lduw [%l3], %l1
	setx user_code_begin_112, %l1, %l4
	stuw %l4, [%l3]
	jmp  %l4
	nop
	EXIT_BAD


attr_data {
	Name = .My_User_Section_4v111,
	notsb,
	VA = MY_USER_DATA_VA111,
	RA = MY_USER_DATA_RA111,
	PA = MY_USER_DATA_PA111,
	TTE_Context = PCONTEXT,
	TTE_V       = 1,
	TTE_NFO     = 0,
	TTE_L       = 0,
	TTE_Soft    = 0,
	TTE_IE      = 0,
	TTE_E       = 0,
	TTE_CP      = 1,
	TTE_CV      = 0,
	TTE_P       = 0,
	TTE_EP      = 0,
	TTE_W       = 1,
	TTE_SW1     = 0,
	TTE_SW0     = 0,
	TTE_RSVD1   = 0,
	TTE_Size    = 1,
	}
.data
.global user_data_begin_111
user_data_begin_111:
	.word 0x10018
	.word 0x9fbc
	.word 0x17cda
	.word 0x1485d


SECTION .My_User_Section_4v112 TEXT_VA=MY_USER_TEXT_VA112, DATA_VA=MY_USER_DATA_VA112
attr_text {
	Name = .My_User_Section_4v112,
	part_0_ctx_nonzero_tsb_config_3,
	VA = MY_USER_TEXT_VA112,
	RA = MY_USER_TEXT_RA112,
	PA = MY_USER_TEXT_PA112,
	TTE_Context = PCONTEXT,
	TTE_V       = 1,
	TTE_NFO     = 0,
	TTE_L       = 0,
	TTE_Soft    = 0,
	TTE_IE      = 0,
	TTE_E       = 0,
	TTE_CP      = 1,
	TTE_CV      = 0,
	TTE_P       = 0,
	TTE_EP      = 1,
	TTE_W       = 0,
	TTE_SW1     = 0,
	TTE_SW0     = 0,
	TTE_RSVD1   = 0,
	TTE_Size    = 0,
	}
.text
.global user_code_begin_112
user_code_begin_112:
	setx user_data_begin_113, %l1, %l3
	lduw [%l3], %l1
	setx user_code_begin_113, %l1, %l4
	stuw %l4, [%l3]
	jmp  %l4
	nop
	EXIT_BAD


attr_data {
	Name = .My_User_Section_4v112,
	notsb,
	VA = MY_USER_DATA_VA112,
	RA = MY_USER_DATA_RA112,
	PA = MY_USER_DATA_PA112,
	TTE_Context = PCONTEXT,
	TTE_V       = 1,
	TTE_NFO     = 0,
	TTE_L       = 0,
	TTE_Soft    = 0,
	TTE_IE      = 0,
	TTE_E       = 0,
	TTE_CP      = 1,
	TTE_CV      = 0,
	TTE_P       = 0,
	TTE_EP      = 0,
	TTE_W       = 1,
	TTE_SW1     = 0,
	TTE_SW0     = 0,
	TTE_RSVD1   = 0,
	TTE_Size    = 1,
	}
.data
.global user_data_begin_112
user_data_begin_112:
	.word 0x15e84
	.word 0x79e1
	.word 0xac75
	.word 0x66eb


SECTION .My_User_Section_4v113 TEXT_VA=MY_USER_TEXT_VA113, DATA_VA=MY_USER_DATA_VA113
attr_text {
	Name = .My_User_Section_4v113,
	part_0_ctx_nonzero_tsb_config_3,
	VA = MY_USER_TEXT_VA113,
	RA = MY_USER_TEXT_RA113,
	PA = MY_USER_TEXT_PA113,
	TTE_Context = PCONTEXT,
	TTE_V       = 1,
	TTE_NFO     = 0,
	TTE_L       = 0,
	TTE_Soft    = 0,
	TTE_IE      = 0,
	TTE_E       = 0,
	TTE_CP      = 1,
	TTE_CV      = 0,
	TTE_P       = 0,
	TTE_EP      = 1,
	TTE_W       = 0,
	TTE_SW1     = 0,
	TTE_SW0     = 0,
	TTE_RSVD1   = 0,
	TTE_Size    = 0,
	}
.text
.global user_code_begin_113
user_code_begin_113:
	setx user_data_begin_114, %l1, %l3
	lduw [%l3], %l1
	setx user_code_begin_114, %l1, %l4
	stuw %l4, [%l3]
	jmp  %l4
	nop
	EXIT_BAD


attr_data {
	Name = .My_User_Section_4v113,
	notsb,
	VA = MY_USER_DATA_VA113,
	RA = MY_USER_DATA_RA113,
	PA = MY_USER_DATA_PA113,
	TTE_Context = PCONTEXT,
	TTE_V       = 1,
	TTE_NFO     = 0,
	TTE_L       = 0,
	TTE_Soft    = 0,
	TTE_IE      = 0,
	TTE_E       = 0,
	TTE_CP      = 1,
	TTE_CV      = 0,
	TTE_P       = 0,
	TTE_EP      = 0,
	TTE_W       = 1,
	TTE_SW1     = 0,
	TTE_SW0     = 0,
	TTE_RSVD1   = 0,
	TTE_Size    = 1,
	}
.data
.global user_data_begin_113
user_data_begin_113:
	.word 0xbb0e
	.word 0xa12c
	.word 0x55d8
	.word 0x1051


SECTION .My_User_Section_4v114 TEXT_VA=MY_USER_TEXT_VA114, DATA_VA=MY_USER_DATA_VA114
attr_text {
	Name = .My_User_Section_4v114,
	part_0_ctx_nonzero_tsb_config_3,
	VA = MY_USER_TEXT_VA114,
	RA = MY_USER_TEXT_RA114,
	PA = MY_USER_TEXT_PA114,
	TTE_Context = PCONTEXT,
	TTE_V       = 1,
	TTE_NFO     = 0,
	TTE_L       = 0,
	TTE_Soft    = 0,
	TTE_IE      = 0,
	TTE_E       = 0,
	TTE_CP      = 1,
	TTE_CV      = 0,
	TTE_P       = 0,
	TTE_EP      = 1,
	TTE_W       = 0,
	TTE_SW1     = 0,
	TTE_SW0     = 0,
	TTE_RSVD1   = 0,
	TTE_Size    = 0,
	}
.text
.global user_code_begin_114
user_code_begin_114:
	setx user_data_begin_115, %l1, %l3
	lduw [%l3], %l1
	setx user_code_begin_115, %l1, %l4
	stuw %l4, [%l3]
	jmp  %l4
	nop
	EXIT_BAD


attr_data {
	Name = .My_User_Section_4v114,
	notsb,
	VA = MY_USER_DATA_VA114,
	RA = MY_USER_DATA_RA114,
	PA = MY_USER_DATA_PA114,
	TTE_Context = PCONTEXT,
	TTE_V       = 1,
	TTE_NFO     = 0,
	TTE_L       = 0,
	TTE_Soft    = 0,
	TTE_IE      = 0,
	TTE_E       = 0,
	TTE_CP      = 1,
	TTE_CV      = 0,
	TTE_P       = 0,
	TTE_EP      = 0,
	TTE_W       = 1,
	TTE_SW1     = 0,
	TTE_SW0     = 0,
	TTE_RSVD1   = 0,
	TTE_Size    = 1,
	}
.data
.global user_data_begin_114
user_data_begin_114:
	.word 0x127ae
	.word 0x9dee
	.word 0x4a1d
	.word 0x4c60


SECTION .My_User_Section_4v115 TEXT_VA=MY_USER_TEXT_VA115, DATA_VA=MY_USER_DATA_VA115
attr_text {
	Name = .My_User_Section_4v115,
	part_0_ctx_nonzero_tsb_config_3,
	VA = MY_USER_TEXT_VA115,
	RA = MY_USER_TEXT_RA115,
	PA = MY_USER_TEXT_PA115,
	TTE_Context = PCONTEXT,
	TTE_V       = 1,
	TTE_NFO     = 0,
	TTE_L       = 0,
	TTE_Soft    = 0,
	TTE_IE      = 0,
	TTE_E       = 0,
	TTE_CP      = 1,
	TTE_CV      = 0,
	TTE_P       = 0,
	TTE_EP      = 1,
	TTE_W       = 0,
	TTE_SW1     = 0,
	TTE_SW0     = 0,
	TTE_RSVD1   = 0,
	TTE_Size    = 0,
	}
.text
.global user_code_begin_115
user_code_begin_115:
	setx user_data_begin_116, %l1, %l3
	lduw [%l3], %l1
	setx user_code_begin_116, %l1, %l4
	stuw %l4, [%l3]
	jmp  %l4
	nop
	EXIT_BAD


attr_data {
	Name = .My_User_Section_4v115,
	notsb,
	VA = MY_USER_DATA_VA115,
	RA = MY_USER_DATA_RA115,
	PA = MY_USER_DATA_PA115,
	TTE_Context = PCONTEXT,
	TTE_V       = 1,
	TTE_NFO     = 0,
	TTE_L       = 0,
	TTE_Soft    = 0,
	TTE_IE      = 0,
	TTE_E       = 0,
	TTE_CP      = 1,
	TTE_CV      = 0,
	TTE_P       = 0,
	TTE_EP      = 0,
	TTE_W       = 1,
	TTE_SW1     = 0,
	TTE_SW0     = 0,
	TTE_RSVD1   = 0,
	TTE_Size    = 1,
	}
.data
.global user_data_begin_115
user_data_begin_115:
	.word 0x105bb
	.word 0x1105e
	.word 0x119f0
	.word 0x7fba


SECTION .My_User_Section_4v116 TEXT_VA=MY_USER_TEXT_VA116, DATA_VA=MY_USER_DATA_VA116
attr_text {
	Name = .My_User_Section_4v116,
	part_0_ctx_nonzero_tsb_config_3,
	VA = MY_USER_TEXT_VA116,
	RA = MY_USER_TEXT_RA116,
	PA = MY_USER_TEXT_PA116,
	TTE_Context = PCONTEXT,
	TTE_V       = 1,
	TTE_NFO     = 0,
	TTE_L       = 0,
	TTE_Soft    = 0,
	TTE_IE      = 0,
	TTE_E       = 0,
	TTE_CP      = 1,
	TTE_CV      = 0,
	TTE_P       = 0,
	TTE_EP      = 1,
	TTE_W       = 0,
	TTE_SW1     = 0,
	TTE_SW0     = 0,
	TTE_RSVD1   = 0,
	TTE_Size    = 0,
	}
.text
.global user_code_begin_116
user_code_begin_116:
	setx user_data_begin_117, %l1, %l3
	lduw [%l3], %l1
	setx user_code_begin_117, %l1, %l4
	stuw %l4, [%l3]
	jmp  %l4
	nop
	EXIT_BAD


attr_data {
	Name = .My_User_Section_4v116,
	notsb,
	VA = MY_USER_DATA_VA116,
	RA = MY_USER_DATA_RA116,
	PA = MY_USER_DATA_PA116,
	TTE_Context = PCONTEXT,
	TTE_V       = 1,
	TTE_NFO     = 0,
	TTE_L       = 0,
	TTE_Soft    = 0,
	TTE_IE      = 0,
	TTE_E       = 0,
	TTE_CP      = 1,
	TTE_CV      = 0,
	TTE_P       = 0,
	TTE_EP      = 0,
	TTE_W       = 1,
	TTE_SW1     = 0,
	TTE_SW0     = 0,
	TTE_RSVD1   = 0,
	TTE_Size    = 1,
	}
.data
.global user_data_begin_116
user_data_begin_116:
	.word 0x9908
	.word 0x966d
	.word 0x13eb7
	.word 0x150b6


SECTION .My_User_Section_4v117 TEXT_VA=MY_USER_TEXT_VA117, DATA_VA=MY_USER_DATA_VA117
attr_text {
	Name = .My_User_Section_4v117,
	part_0_ctx_nonzero_tsb_config_3,
	VA = MY_USER_TEXT_VA117,
	RA = MY_USER_TEXT_RA117,
	PA = MY_USER_TEXT_PA117,
	TTE_Context = PCONTEXT,
	TTE_V       = 1,
	TTE_NFO     = 0,
	TTE_L       = 0,
	TTE_Soft    = 0,
	TTE_IE      = 0,
	TTE_E       = 0,
	TTE_CP      = 1,
	TTE_CV      = 0,
	TTE_P       = 0,
	TTE_EP      = 1,
	TTE_W       = 0,
	TTE_SW1     = 0,
	TTE_SW0     = 0,
	TTE_RSVD1   = 0,
	TTE_Size    = 0,
	}
.text
.global user_code_begin_117
user_code_begin_117:
	setx user_data_begin_118, %l1, %l3
	lduw [%l3], %l1
	setx user_code_begin_118, %l1, %l4
	stuw %l4, [%l3]
	jmp  %l4
	nop
	EXIT_BAD


attr_data {
	Name = .My_User_Section_4v117,
	notsb,
	VA = MY_USER_DATA_VA117,
	RA = MY_USER_DATA_RA117,
	PA = MY_USER_DATA_PA117,
	TTE_Context = PCONTEXT,
	TTE_V       = 1,
	TTE_NFO     = 0,
	TTE_L       = 0,
	TTE_Soft    = 0,
	TTE_IE      = 0,
	TTE_E       = 0,
	TTE_CP      = 1,
	TTE_CV      = 0,
	TTE_P       = 0,
	TTE_EP      = 0,
	TTE_W       = 1,
	TTE_SW1     = 0,
	TTE_SW0     = 0,
	TTE_RSVD1   = 0,
	TTE_Size    = 1,
	}
.data
.global user_data_begin_117
user_data_begin_117:
	.word 0x17b01
	.word 0xff27
	.word 0x1f9
	.word 0x17092


SECTION .My_User_Section_4v118 TEXT_VA=MY_USER_TEXT_VA118, DATA_VA=MY_USER_DATA_VA118
attr_text {
	Name = .My_User_Section_4v118,
	part_0_ctx_nonzero_tsb_config_3,
	VA = MY_USER_TEXT_VA118,
	RA = MY_USER_TEXT_RA118,
	PA = MY_USER_TEXT_PA118,
	TTE_Context = PCONTEXT,
	TTE_V       = 1,
	TTE_NFO     = 0,
	TTE_L       = 0,
	TTE_Soft    = 0,
	TTE_IE      = 0,
	TTE_E       = 0,
	TTE_CP      = 1,
	TTE_CV      = 0,
	TTE_P       = 0,
	TTE_EP      = 1,
	TTE_W       = 0,
	TTE_SW1     = 0,
	TTE_SW0     = 0,
	TTE_RSVD1   = 0,
	TTE_Size    = 0,
	}
.text
.global user_code_begin_118
user_code_begin_118:
	setx user_data_begin_119, %l1, %l3
	lduw [%l3], %l1
	setx user_code_begin_119, %l1, %l4
	stuw %l4, [%l3]
	jmp  %l4
	nop
	EXIT_BAD


attr_data {
	Name = .My_User_Section_4v118,
	notsb,
	VA = MY_USER_DATA_VA118,
	RA = MY_USER_DATA_RA118,
	PA = MY_USER_DATA_PA118,
	TTE_Context = PCONTEXT,
	TTE_V       = 1,
	TTE_NFO     = 0,
	TTE_L       = 0,
	TTE_Soft    = 0,
	TTE_IE      = 0,
	TTE_E       = 0,
	TTE_CP      = 1,
	TTE_CV      = 0,
	TTE_P       = 0,
	TTE_EP      = 0,
	TTE_W       = 1,
	TTE_SW1     = 0,
	TTE_SW0     = 0,
	TTE_RSVD1   = 0,
	TTE_Size    = 1,
	}
.data
.global user_data_begin_118
user_data_begin_118:
	.word 0x18022
	.word 0x1021c
	.word 0x42c
	.word 0x3a2b


SECTION .My_User_Section_4v119 TEXT_VA=MY_USER_TEXT_VA119, DATA_VA=MY_USER_DATA_VA119
attr_text {
	Name = .My_User_Section_4v119,
	part_0_ctx_nonzero_tsb_config_3,
	VA = MY_USER_TEXT_VA119,
	RA = MY_USER_TEXT_RA119,
	PA = MY_USER_TEXT_PA119,
	TTE_Context = PCONTEXT,
	TTE_V       = 1,
	TTE_NFO     = 0,
	TTE_L       = 0,
	TTE_Soft    = 0,
	TTE_IE      = 0,
	TTE_E       = 0,
	TTE_CP      = 1,
	TTE_CV      = 0,
	TTE_P       = 0,
	TTE_EP      = 1,
	TTE_W       = 0,
	TTE_SW1     = 0,
	TTE_SW0     = 0,
	TTE_RSVD1   = 0,
	TTE_Size    = 0,
	}
.text
.global user_code_begin_119
user_code_begin_119:
	setx user_data_begin_120, %l1, %l3
	lduw [%l3], %l1
	setx user_code_begin_120, %l1, %l4
	stuw %l4, [%l3]
	jmp  %l4
	nop
	EXIT_BAD


attr_data {
	Name = .My_User_Section_4v119,
	notsb,
	VA = MY_USER_DATA_VA119,
	RA = MY_USER_DATA_RA119,
	PA = MY_USER_DATA_PA119,
	TTE_Context = PCONTEXT,
	TTE_V       = 1,
	TTE_NFO     = 0,
	TTE_L       = 0,
	TTE_Soft    = 0,
	TTE_IE      = 0,
	TTE_E       = 0,
	TTE_CP      = 1,
	TTE_CV      = 0,
	TTE_P       = 0,
	TTE_EP      = 0,
	TTE_W       = 1,
	TTE_SW1     = 0,
	TTE_SW0     = 0,
	TTE_RSVD1   = 0,
	TTE_Size    = 1,
	}
.data
.global user_data_begin_119
user_data_begin_119:
	.word 0x108a2
	.word 0x16e5f
	.word 0x14314
	.word 0x65bb


SECTION .My_User_Section_4v120 TEXT_VA=MY_USER_TEXT_VA120, DATA_VA=MY_USER_DATA_VA120
attr_text {
	Name = .My_User_Section_4v120,
	part_0_ctx_nonzero_tsb_config_3,
	VA = MY_USER_TEXT_VA120,
	RA = MY_USER_TEXT_RA120,
	PA = MY_USER_TEXT_PA120,
	TTE_Context = PCONTEXT,
	TTE_V       = 1,
	TTE_NFO     = 0,
	TTE_L       = 0,
	TTE_Soft    = 0,
	TTE_IE      = 0,
	TTE_E       = 0,
	TTE_CP      = 1,
	TTE_CV      = 0,
	TTE_P       = 0,
	TTE_EP      = 1,
	TTE_W       = 0,
	TTE_SW1     = 0,
	TTE_SW0     = 0,
	TTE_RSVD1   = 0,
	TTE_Size    = 0,
	}
.text
.global user_code_begin_120
user_code_begin_120:
	setx user_data_begin_121, %l1, %l3
	lduw [%l3], %l1
	setx user_code_begin_121, %l1, %l4
	stuw %l4, [%l3]
	jmp  %l4
	nop
	EXIT_BAD


attr_data {
	Name = .My_User_Section_4v120,
	notsb,
	VA = MY_USER_DATA_VA120,
	RA = MY_USER_DATA_RA120,
	PA = MY_USER_DATA_PA120,
	TTE_Context = PCONTEXT,
	TTE_V       = 1,
	TTE_NFO     = 0,
	TTE_L       = 0,
	TTE_Soft    = 0,
	TTE_IE      = 0,
	TTE_E       = 0,
	TTE_CP      = 1,
	TTE_CV      = 0,
	TTE_P       = 0,
	TTE_EP      = 0,
	TTE_W       = 1,
	TTE_SW1     = 0,
	TTE_SW0     = 0,
	TTE_RSVD1   = 0,
	TTE_Size    = 1,
	}
.data
.global user_data_begin_120
user_data_begin_120:
	.word 0x1d33
	.word 0x48a9
	.word 0x167b9
	.word 0x16703


SECTION .My_User_Section_4v121 TEXT_VA=MY_USER_TEXT_VA121, DATA_VA=MY_USER_DATA_VA121
attr_text {
	Name = .My_User_Section_4v121,
	part_0_ctx_nonzero_tsb_config_3,
	VA = MY_USER_TEXT_VA121,
	RA = MY_USER_TEXT_RA121,
	PA = MY_USER_TEXT_PA121,
	TTE_Context = PCONTEXT,
	TTE_V       = 1,
	TTE_NFO     = 0,
	TTE_L       = 0,
	TTE_Soft    = 0,
	TTE_IE      = 0,
	TTE_E       = 0,
	TTE_CP      = 1,
	TTE_CV      = 0,
	TTE_P       = 0,
	TTE_EP      = 1,
	TTE_W       = 0,
	TTE_SW1     = 0,
	TTE_SW0     = 0,
	TTE_RSVD1   = 0,
	TTE_Size    = 0,
	}
.text
.global user_code_begin_121
user_code_begin_121:
	setx user_data_begin_122, %l1, %l3
	lduw [%l3], %l1
	setx user_code_begin_122, %l1, %l4
	stuw %l4, [%l3]
	jmp  %l4
	nop
	EXIT_BAD


attr_data {
	Name = .My_User_Section_4v121,
	notsb,
	VA = MY_USER_DATA_VA121,
	RA = MY_USER_DATA_RA121,
	PA = MY_USER_DATA_PA121,
	TTE_Context = PCONTEXT,
	TTE_V       = 1,
	TTE_NFO     = 0,
	TTE_L       = 0,
	TTE_Soft    = 0,
	TTE_IE      = 0,
	TTE_E       = 0,
	TTE_CP      = 1,
	TTE_CV      = 0,
	TTE_P       = 0,
	TTE_EP      = 0,
	TTE_W       = 1,
	TTE_SW1     = 0,
	TTE_SW0     = 0,
	TTE_RSVD1   = 0,
	TTE_Size    = 1,
	}
.data
.global user_data_begin_121
user_data_begin_121:
	.word 0x2a8b
	.word 0x108f6
	.word 0x74f1
	.word 0x8a2e


SECTION .My_User_Section_4v122 TEXT_VA=MY_USER_TEXT_VA122, DATA_VA=MY_USER_DATA_VA122
attr_text {
	Name = .My_User_Section_4v122,
	part_0_ctx_nonzero_tsb_config_3,
	VA = MY_USER_TEXT_VA122,
	RA = MY_USER_TEXT_RA122,
	PA = MY_USER_TEXT_PA122,
	TTE_Context = PCONTEXT,
	TTE_V       = 1,
	TTE_NFO     = 0,
	TTE_L       = 0,
	TTE_Soft    = 0,
	TTE_IE      = 0,
	TTE_E       = 0,
	TTE_CP      = 1,
	TTE_CV      = 0,
	TTE_P       = 0,
	TTE_EP      = 1,
	TTE_W       = 0,
	TTE_SW1     = 0,
	TTE_SW0     = 0,
	TTE_RSVD1   = 0,
	TTE_Size    = 0,
	}
.text
.global user_code_begin_122
user_code_begin_122:
	setx user_data_begin_123, %l1, %l3
	lduw [%l3], %l1
	setx user_code_begin_123, %l1, %l4
	stuw %l4, [%l3]
	jmp  %l4
	nop
	EXIT_BAD


attr_data {
	Name = .My_User_Section_4v122,
	notsb,
	VA = MY_USER_DATA_VA122,
	RA = MY_USER_DATA_RA122,
	PA = MY_USER_DATA_PA122,
	TTE_Context = PCONTEXT,
	TTE_V       = 1,
	TTE_NFO     = 0,
	TTE_L       = 0,
	TTE_Soft    = 0,
	TTE_IE      = 0,
	TTE_E       = 0,
	TTE_CP      = 1,
	TTE_CV      = 0,
	TTE_P       = 0,
	TTE_EP      = 0,
	TTE_W       = 1,
	TTE_SW1     = 0,
	TTE_SW0     = 0,
	TTE_RSVD1   = 0,
	TTE_Size    = 1,
	}
.data
.global user_data_begin_122
user_data_begin_122:
	.word 0x6c67
	.word 0xf2fb
	.word 0xc647
	.word 0x3232


SECTION .My_User_Section_4v123 TEXT_VA=MY_USER_TEXT_VA123, DATA_VA=MY_USER_DATA_VA123
attr_text {
	Name = .My_User_Section_4v123,
	part_0_ctx_nonzero_tsb_config_3,
	VA = MY_USER_TEXT_VA123,
	RA = MY_USER_TEXT_RA123,
	PA = MY_USER_TEXT_PA123,
	TTE_Context = PCONTEXT,
	TTE_V       = 1,
	TTE_NFO     = 0,
	TTE_L       = 0,
	TTE_Soft    = 0,
	TTE_IE      = 0,
	TTE_E       = 0,
	TTE_CP      = 1,
	TTE_CV      = 0,
	TTE_P       = 0,
	TTE_EP      = 1,
	TTE_W       = 0,
	TTE_SW1     = 0,
	TTE_SW0     = 0,
	TTE_RSVD1   = 0,
	TTE_Size    = 0,
	}
.text
.global user_code_begin_123
user_code_begin_123:
	setx user_data_begin_124, %l1, %l3
	lduw [%l3], %l1
	setx user_code_begin_124, %l1, %l4
	stuw %l4, [%l3]
	jmp  %l4
	nop
	EXIT_BAD


attr_data {
	Name = .My_User_Section_4v123,
	notsb,
	VA = MY_USER_DATA_VA123,
	RA = MY_USER_DATA_RA123,
	PA = MY_USER_DATA_PA123,
	TTE_Context = PCONTEXT,
	TTE_V       = 1,
	TTE_NFO     = 0,
	TTE_L       = 0,
	TTE_Soft    = 0,
	TTE_IE      = 0,
	TTE_E       = 0,
	TTE_CP      = 1,
	TTE_CV      = 0,
	TTE_P       = 0,
	TTE_EP      = 0,
	TTE_W       = 1,
	TTE_SW1     = 0,
	TTE_SW0     = 0,
	TTE_RSVD1   = 0,
	TTE_Size    = 1,
	}
.data
.global user_data_begin_123
user_data_begin_123:
	.word 0xb69e
	.word 0x6912
	.word 0x131e
	.word 0x5e3f


SECTION .My_User_Section_4v124 TEXT_VA=MY_USER_TEXT_VA124, DATA_VA=MY_USER_DATA_VA124
attr_text {
	Name = .My_User_Section_4v124,
	part_0_ctx_nonzero_tsb_config_3,
	VA = MY_USER_TEXT_VA124,
	RA = MY_USER_TEXT_RA124,
	PA = MY_USER_TEXT_PA124,
	TTE_Context = PCONTEXT,
	TTE_V       = 1,
	TTE_NFO     = 0,
	TTE_L       = 0,
	TTE_Soft    = 0,
	TTE_IE      = 0,
	TTE_E       = 0,
	TTE_CP      = 1,
	TTE_CV      = 0,
	TTE_P       = 0,
	TTE_EP      = 1,
	TTE_W       = 0,
	TTE_SW1     = 0,
	TTE_SW0     = 0,
	TTE_RSVD1   = 0,
	TTE_Size    = 0,
	}
.text
.global user_code_begin_124
user_code_begin_124:
	setx user_data_begin_125, %l1, %l3
	lduw [%l3], %l1
	setx user_code_begin_125, %l1, %l4
	stuw %l4, [%l3]
	jmp  %l4
	nop
	EXIT_BAD


attr_data {
	Name = .My_User_Section_4v124,
	notsb,
	VA = MY_USER_DATA_VA124,
	RA = MY_USER_DATA_RA124,
	PA = MY_USER_DATA_PA124,
	TTE_Context = PCONTEXT,
	TTE_V       = 1,
	TTE_NFO     = 0,
	TTE_L       = 0,
	TTE_Soft    = 0,
	TTE_IE      = 0,
	TTE_E       = 0,
	TTE_CP      = 1,
	TTE_CV      = 0,
	TTE_P       = 0,
	TTE_EP      = 0,
	TTE_W       = 1,
	TTE_SW1     = 0,
	TTE_SW0     = 0,
	TTE_RSVD1   = 0,
	TTE_Size    = 1,
	}
.data
.global user_data_begin_124
user_data_begin_124:
	.word 0x5652
	.word 0x167e2
	.word 0x3161
	.word 0x2422


SECTION .My_User_Section_4v125 TEXT_VA=MY_USER_TEXT_VA125, DATA_VA=MY_USER_DATA_VA125
attr_text {
	Name = .My_User_Section_4v125,
	part_0_ctx_nonzero_tsb_config_3,
	VA = MY_USER_TEXT_VA125,
	RA = MY_USER_TEXT_RA125,
	PA = MY_USER_TEXT_PA125,
	TTE_Context = PCONTEXT,
	TTE_V       = 1,
	TTE_NFO     = 0,
	TTE_L       = 0,
	TTE_Soft    = 0,
	TTE_IE      = 0,
	TTE_E       = 0,
	TTE_CP      = 1,
	TTE_CV      = 0,
	TTE_P       = 0,
	TTE_EP      = 1,
	TTE_W       = 0,
	TTE_SW1     = 0,
	TTE_SW0     = 0,
	TTE_RSVD1   = 0,
	TTE_Size    = 0,
	}
.text
.global user_code_begin_125
user_code_begin_125:
	setx user_data_begin_126, %l1, %l3
	lduw [%l3], %l1
	setx user_code_begin_126, %l1, %l4
	stuw %l4, [%l3]
	jmp  %l4
	nop
	EXIT_BAD


attr_data {
	Name = .My_User_Section_4v125,
	notsb,
	VA = MY_USER_DATA_VA125,
	RA = MY_USER_DATA_RA125,
	PA = MY_USER_DATA_PA125,
	TTE_Context = PCONTEXT,
	TTE_V       = 1,
	TTE_NFO     = 0,
	TTE_L       = 0,
	TTE_Soft    = 0,
	TTE_IE      = 0,
	TTE_E       = 0,
	TTE_CP      = 1,
	TTE_CV      = 0,
	TTE_P       = 0,
	TTE_EP      = 0,
	TTE_W       = 1,
	TTE_SW1     = 0,
	TTE_SW0     = 0,
	TTE_RSVD1   = 0,
	TTE_Size    = 1,
	}
.data
.global user_data_begin_125
user_data_begin_125:
	.word 0xd720
	.word 0xb4fd
	.word 0x6d8
	.word 0x2a88


SECTION .My_User_Section_4v126 TEXT_VA=MY_USER_TEXT_VA126, DATA_VA=MY_USER_DATA_VA126
attr_text {
	Name = .My_User_Section_4v126,
	part_0_ctx_nonzero_tsb_config_3,
	VA = MY_USER_TEXT_VA126,
	RA = MY_USER_TEXT_RA126,
	PA = MY_USER_TEXT_PA126,
	TTE_Context = PCONTEXT,
	TTE_V       = 1,
	TTE_NFO     = 0,
	TTE_L       = 0,
	TTE_Soft    = 0,
	TTE_IE      = 0,
	TTE_E       = 0,
	TTE_CP      = 1,
	TTE_CV      = 0,
	TTE_P       = 0,
	TTE_EP      = 1,
	TTE_W       = 0,
	TTE_SW1     = 0,
	TTE_SW0     = 0,
	TTE_RSVD1   = 0,
	TTE_Size    = 0,
	}
.text
.global user_code_begin_126
user_code_begin_126:
	setx user_data_begin_127, %l1, %l3
	lduw [%l3], %l1
	setx user_code_begin_127, %l1, %l4
	stuw %l4, [%l3]
	jmp  %l4
	nop
	EXIT_BAD


attr_data {
	Name = .My_User_Section_4v126,
	notsb,
	VA = MY_USER_DATA_VA126,
	RA = MY_USER_DATA_RA126,
	PA = MY_USER_DATA_PA126,
	TTE_Context = PCONTEXT,
	TTE_V       = 1,
	TTE_NFO     = 0,
	TTE_L       = 0,
	TTE_Soft    = 0,
	TTE_IE      = 0,
	TTE_E       = 0,
	TTE_CP      = 1,
	TTE_CV      = 0,
	TTE_P       = 0,
	TTE_EP      = 0,
	TTE_W       = 1,
	TTE_SW1     = 0,
	TTE_SW0     = 0,
	TTE_RSVD1   = 0,
	TTE_Size    = 1,
	}
.data
.global user_data_begin_126
user_data_begin_126:
	.word 0xeb3d
	.word 0xee71
	.word 0x7d4e
	.word 0x14738


SECTION .My_User_Section_4v127 TEXT_VA=MY_USER_TEXT_VA127, DATA_VA=MY_USER_DATA_VA127
attr_text {
	Name = .My_User_Section_4v127,
	part_0_ctx_nonzero_tsb_config_3,
	VA = MY_USER_TEXT_VA127,
	RA = MY_USER_TEXT_RA127,
	PA = MY_USER_TEXT_PA127,
	TTE_Context = PCONTEXT,
	TTE_V       = 1,
	TTE_NFO     = 0,
	TTE_L       = 0,
	TTE_Soft    = 0,
	TTE_IE      = 0,
	TTE_E       = 0,
	TTE_CP      = 1,
	TTE_CV      = 0,
	TTE_P       = 0,
	TTE_EP      = 1,
	TTE_W       = 0,
	TTE_SW1     = 0,
	TTE_SW0     = 0,
	TTE_RSVD1   = 0,
	TTE_Size    = 0,
	}
.text
.global user_code_begin_127
user_code_begin_127:
	EXIT_GOOD


attr_data {
	Name = .My_User_Section_4v127,
	notsb,
	VA = MY_USER_DATA_VA127,
	RA = MY_USER_DATA_RA127,
	PA = MY_USER_DATA_PA127,
	TTE_Context = PCONTEXT,
	TTE_V       = 1,
	TTE_NFO     = 0,
	TTE_L       = 0,
	TTE_Soft    = 0,
	TTE_IE      = 0,
	TTE_E       = 0,
	TTE_CP      = 1,
	TTE_CV      = 0,
	TTE_P       = 0,
	TTE_EP      = 0,
	TTE_W       = 1,
	TTE_SW1     = 0,
	TTE_SW0     = 0,
	TTE_RSVD1   = 0,
	TTE_Size    = 1,
	}
.data
.global user_data_begin_127
user_data_begin_127:
	.word 0x10b00
	.word 0x1070d
	.word 0x171ac
	.word 0xaca8
.end
