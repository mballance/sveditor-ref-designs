/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: print_dimm.h
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
#include "vcsuser.h"
#include <malloc.h>
#include <strings.h>
#include <stdlib.h>


void print_dimm() {
    
// 1st line prints part,channel,low/high rank,rank side
// 2nd line prints dimm size,# of dimms
// 3rd line prints partial bank

  int i=(mc_scan_plusargs("X8") !=(char *)NULL) ? 1 : 0;
  int j=(mc_scan_plusargs("SNG_CHANNEL") !=(char *)NULL) ? 1 : 0;
  int k=(mc_scan_plusargs("RANK_LOW") !=(char *)NULL) ? 1 : 0;
  int l=(mc_scan_plusargs("STACK_DIMM") !=(char *)NULL) ? 1 : 0;
  int m=(mc_scan_plusargs("DIMM_SIZE_256") !=(char *)NULL) ? 256 : (
        (mc_scan_plusargs("DIMM_SIZE_512") !=(char *)NULL) ? 512 : (
        (mc_scan_plusargs("DIMM_SIZE_1G") !=(char *)NULL) ? 1024 : 2048 ) );
  int n=(mc_scan_plusargs("8_FBDIMMS") !=(char *)NULL) ? 8 : (
        (mc_scan_plusargs("7_FBDIMMS") !=(char *)NULL) ? 7 : (
        (mc_scan_plusargs("6_FBDIMMS") !=(char *)NULL) ? 6 : (
        (mc_scan_plusargs("5_FBDIMMS") !=(char *)NULL) ? 5 : (
        (mc_scan_plusargs("4_FBDIMMS") !=(char *)NULL) ? 4 : (
        (mc_scan_plusargs("3_FBDIMMS") !=(char *)NULL) ? 3 : (
        (mc_scan_plusargs("2_FBDIMMS") !=(char *)NULL) ? 2 : 1 ) ) ) ) ) ); 
  
  char *a=(char *)NULL; a=(char *)malloc(10000*sizeof(char));
  a = strcat(a,(const char *)"\n");
  a = strcat(a,(const char *)"**************************************************************************************************************************\n");
  a = strcat(a,(const char *)"**************************************************************************************************************************\n");
  a = strcat(a,(const char *)"\n");
  a = i ? strcat(a,(const char *)"  #     #  #####         "):
	strcat(a,(const char *)"  #     # #              ");
  a = j ? strcat(a,(const char *)" #####  #     #  #####                   "):
    strcat(a,(const char *)"######  #     #    #    #                ");
  a = k ? strcat(a,(const char *)"#        #####  #     #                  "):
    strcat(a,(const char *)"#     #   ###    #####  #     #          ");
  a = l ? strcat(a,(const char *)" #####   #####\n"):
	strcat(a,(const char *)"   #     #####\n");

  a = i ? strcat(a,(const char *)"   #   #  #     #        "):
	strcat(a,(const char *)"   #   #  #    #         ");
  a = j ? strcat(a,(const char *)"#     # ##    # #     #                  "):
	strcat(a,(const char *)"#     # #     #   # #   #                ");
  a = k ? strcat(a,(const char *)"#       #     # #  #  #                  "):
	strcat(a,(const char *)"#     #    #    #     # #     #          ");
  a = l ? strcat(a,(const char *)"#     # #     #\n"):
	strcat(a,(const char *)"  ##    #     #\n");

  a = i ? strcat(a,(const char *)"    # #   #     #        "):
	strcat(a,(const char *)"    # #   #    #         ");
  a = j ? strcat(a,(const char *)"#       # #   # #                        "):
	strcat(a,(const char *)"#     # #     #  #   #  #                ");
  a = k ? strcat(a,(const char *)"#       #     # #  #  #                  "):
	strcat(a,(const char *)"#     #    #    #       #     #          ");
  a = l ? strcat(a,(const char *)"      # #\n"):
	strcat(a,(const char *)" # #    #\n");
  
  a = i ? strcat(a,(const char *)"     #     #####         "):
	strcat(a,(const char *)"     #    #    #         ");
  a = j ? strcat(a,(const char *)" #####  #  #  # #  ####                  "):
	strcat(a,(const char *)"#     # #     # #     # #                ");
  a = k ? strcat(a,(const char *)"#       #     # #  #  #                  "):
	strcat(a,(const char *)"#######    #    #  #### #######          ");
  a = l ? strcat(a,(const char *)" #####   #####\n"):
	strcat(a,(const char *)"   #     #####\n");
  
  a = i ? strcat(a,(const char *)"    # #   #     #        "):
	strcat(a,(const char *)"    # #   #######        ");
  a = j ? strcat(a,(const char *)"      # #   # # #     #                  "):
	strcat(a,(const char *)"#     # #     # ####### #                ");
  a = k ? strcat(a,(const char *)"#       #     # #  #  #                  "):
	strcat(a,(const char *)"#     #    #    #     # #     #          ");
  a = l ? strcat(a,(const char *)"#             #\n"):
	strcat(a,(const char *)"   #          #\n");
  
  a = i ? strcat(a,(const char *)"   #   #  #     #        "):
	strcat(a,(const char *)"   #   #       #         ");
  a = j ? strcat(a,(const char *)"#     # #    ## #     #                  "):
	strcat(a,(const char *)"#     # #     # #     # #                ");
  a = k ? strcat(a,(const char *)"#       #     # #  #  #                  "):
	strcat(a,(const char *)"#     #    #    #     # #     #          ");
  a = l ? strcat(a,(const char *)"#       #     #\n"):
	strcat(a,(const char *)"   #    #     #\n");
  
  a = i ? strcat(a,(const char *)"  #     #  #####         "):
	strcat(a,(const char *)"  #     #      #         ");
  a = j ? strcat(a,(const char *)" #####  #     #  #####                   "):
	strcat(a,(const char *)"######   #####  #     # #######          ");
  a = k ? strcat(a,(const char *)"#######  #####   ## ##                   "):
	strcat(a,(const char *)"#     #   ###    #####  #     #          ");
  a = l ? strcat(a,(const char *)"#######  #####\n"):
	strcat(a,(const char *)" #####   #####\n");
  
  a = strcat(a,(const char *)"\n\n");

  a = (m==256) ? strcat(a,(const char *)"   #####  #######  #####  #     # ######           "): (
      (m==512) ? strcat(a,(const char *)"  #######    #     #####  #     # ######           "): (
      (m==1024) ? strcat(a,(const char *)"     #     #####  ######                "): (
                  strcat(a,(const char *)"   #####   #####  ######                ") ) ) );
  a = (n==8) ? strcat(a,(const char *)" #####     ######    ###   #     # #     #  #####\n"): (
      (n==7) ? strcat(a,(const char *)"#######    ######    ###   #     # #     #  #####\n"): (
      (n==6) ? strcat(a,(const char *)" #####     ######    ###   #     # #     #  #####\n"): (
      (n==5) ? strcat(a,(const char *)"#######    ######    ###   #     # #     #  #####\n"): (
      (n==4) ? strcat(a,(const char *)"#          ######    ###   #     # #     #  #####\n"): (
      (n==3) ? strcat(a,(const char *)" #####     ######    ###   #     # #     #  #####\n"): (
      (n==2) ? strcat(a,(const char *)" #####     ######    ###   #     # #     #  #####\n"): (
               strcat(a,(const char *)"   #       ######    ###   #     # #     #\n") ) ) ) ) ) ) );

  a = (m==256) ? strcat(a,(const char *)"  #     # #       #     # ##   ## #     #          "): (
      (m==512) ? strcat(a,(const char *)"  #         ##    #     # ##   ## #     #          "): (
      (m==1024) ? strcat(a,(const char *)"    ##    #     # #     #               "): (
                  strcat(a,(const char *)"  #     # #     # #     #               ") ) ) );
  a = (n==8) ? strcat(a,(const char *)"#     #    #     #    #    ##   ## ##   ## #     #\n"): (
      (n==7) ? strcat(a,(const char *)"#    #     #     #    #    ##   ## ##   ## #     #\n"): (
      (n==6) ? strcat(a,(const char *)"#     #    #     #    #    ##   ## ##   ## #     #\n"): (
      (n==5) ? strcat(a,(const char *)"#          #     #    #    ##   ## ##   ## #     #\n"): (
      (n==4) ? strcat(a,(const char *)"#    #     #     #    #    ##   ## ##   ## #     #\n"): (
      (n==3) ? strcat(a,(const char *)"#     #    #     #    #    ##   ## ##   ## #     #\n"): (
      (n==2) ? strcat(a,(const char *)"#     #    #     #    #    ##   ## ##   ## #     #\n"): (
               strcat(a,(const char *)"  ##       #     #    #    ##   ## ##   ##\n") ) ) ) ) ) ) );

  a = (m==256) ? strcat(a,(const char *)"        # #       #       # # # # #     #          "): (
      (m==512) ? strcat(a,(const char *)"  #        # #          # # # # # #     #          "): (
      (m==1024) ? strcat(a,(const char *)"   # #    #       #     #               "): (
                  strcat(a,(const char *)"        # #       #     #               ") ) ) );
  a = (n==8) ? strcat(a,(const char *)"#     #    #     #    #    # # # # # # # # #\n"): (
      (n==7) ? strcat(a,(const char *)"    #      #     #    #    # # # # # # # # #\n"): (
      (n==6) ? strcat(a,(const char *)"#          #     #    #    # # # # # # # # #\n"): (
      (n==5) ? strcat(a,(const char *)"#          #     #    #    # # # # # # # # #\n"): (
      (n==4) ? strcat(a,(const char *)"#    #     #     #    #    # # # # # # # # #\n"): (
      (n==3) ? strcat(a,(const char *)"      #    #     #    #    # # # # # # # # #\n"): (
      (n==2) ? strcat(a,(const char *)"      #    #     #    #    # # # # # # # # #\n"): (
               strcat(a,(const char *)" # #       #     #    #    # # # # # # # #\n") ) ) ) ) ) ) );

  a = (m==256) ? strcat(a,(const char *)"   #####  ######  ######  #  #  # ######           "): (
      (m==512) ? strcat(a,(const char *)"  ######     #     #####  #  #  # ######           "): (
      (m==1024) ? strcat(a,(const char *)"     #    #  #### ######                "): (
                  strcat(a,(const char *)"   #####  #  #### ######                ") ) ) );
  a = (n==8) ? strcat(a,(const char *)" #####     #     #    #    #  #  # #  #  #  #####\n"): (
      (n==7) ? strcat(a,(const char *)"   #       #     #    #    #  #  # #  #  #  #####\n"): (
      (n==6) ? strcat(a,(const char *)"######     #     #    #    #  #  # #  #  #  #####\n"): (
      (n==5) ? strcat(a,(const char *)"######     #     #    #    #  #  # #  #  #  #####\n"): (
      (n==4) ? strcat(a,(const char *)"#    #     #     #    #    #  #  # #  #  #  #####\n"): (
      (n==3) ? strcat(a,(const char *)" #####     #     #    #    #  #  # #  #  #  #####\n"): (
      (n==2) ? strcat(a,(const char *)" #####     #     #    #    #  #  # #  #  #  #####\n"): (
               strcat(a,(const char *)"   #       #     #    #    #  #  # #  #  #\n") ) ) ) ) ) ) );

  a = (m==256) ? strcat(a,(const char *)"  #             # #     # #     # #     #          "): (
      (m==512) ? strcat(a,(const char *)"        #    #    #       #     # #     #          "): (
      (m==1024) ? strcat(a,(const char *)"     #    #     # #     #               "): (
                  strcat(a,(const char *)"  #       #     # #     #               ") ) ) );
  a = (n==8) ? strcat(a,(const char *)"#     #    #     #    #    #     # #     #       #\n"): (
      (n==7) ? strcat(a,(const char *)"  #        #     #    #    #     # #     #       #\n"): (
      (n==6) ? strcat(a,(const char *)"#     #    #     #    #    #     # #     #       #\n"): (
      (n==5) ? strcat(a,(const char *)"      #    #     #    #    #     # #     #       #\n"): (
      (n==4) ? strcat(a,(const char *)"#######    #     #    #    #     # #     #       #\n"): (
      (n==3) ? strcat(a,(const char *)"      #    #     #    #    #     # #     #       #\n"): (
      (n==2) ? strcat(a,(const char *)"#          #     #    #    #     # #     #       #\n"): (
               strcat(a,(const char *)"   #       #     #    #    #     # #     #\n") ) ) ) ) ) ) );

  a = (m==256) ? strcat(a,(const char *)"  #       #     # #     # #     # #     #          "): (
      (m==512) ? strcat(a,(const char *)"  #     #    #    #       #     # #     #          "): (
      (m==1024) ? strcat(a,(const char *)"     #    #     # #     #               "): (
                  strcat(a,(const char *)"  #       #     # #     #               ") ) ) );
  a = (n==8) ? strcat(a,(const char *)"#     #    #     #    #    #     # #     # #     #\n"): (
      (n==7) ? strcat(a,(const char *)"  #        #     #    #    #     # #     # #     #\n"): (
      (n==6) ? strcat(a,(const char *)"#     #    #     #    #    #     # #     # #     #\n"): (
      (n==5) ? strcat(a,(const char *)"#     #    #     #    #    #     # #     # #     #\n"): (
      (n==4) ? strcat(a,(const char *)"     #     #     #    #    #     # #     # #     #\n"): (
      (n==3) ? strcat(a,(const char *)"#     #    #     #    #    #     # #     # #     #\n"): (
      (n==2) ? strcat(a,(const char *)"#          #     #    #    #     # #     # #     #\n"): (
               strcat(a,(const char *)"   #       #     #    #    #     # #     #\n") ) ) ) ) ) ) );

  a = (m==256) ? strcat(a,(const char *)"  #######  #####   #####  #     # ######           "): (
      (m==512) ? strcat(a,(const char *)"   #####   #####  ####### #     # ######           "): (
      (m==1024) ? strcat(a,(const char *)"   #####   #####  ######                "): (
                  strcat(a,(const char *)"  #######  #####  ######                ") ) ) );
  a = (n==8) ? strcat(a,(const char *)" #####     ######    ###   #     # #     #  #####\n"): (
      (n==7) ? strcat(a,(const char *)"  #        ######    ###   #     # #     #  #####\n"): (
      (n==6) ? strcat(a,(const char *)" #####     ######    ###   #     # #     #  #####\n"): (
      (n==5) ? strcat(a,(const char *)" #####     ######    ###   #     # #     #  #####\n"): (
      (n==4) ? strcat(a,(const char *)"     #     ######    ###   #     # #     #  #####\n"): (
      (n==3) ? strcat(a,(const char *)" #####     ######    ###   #     # #     #  #####\n"): (
      (n==2) ? strcat(a,(const char *)"#######    ######    ###   #     # #     #  #####\n"): (
               strcat(a,(const char *)" #####     ######    ###   #     # #     #\n") ) ) ) ) ) ) );

/*
  a = strcat(a,(const char *)"\n");
  io_printf((char *)"%s",a);
  a=(char *)"";
  char *c=(char *)NULL;
  c=mc_scan_plusargs("bank_set_mask=");
  if (c && *c != 'f') {
  	long x=strtol(c,0,16);
	io_printf((char *)"\n");
	switch(x){
	 case 1: system("banner \" PB 01\""); break;
	 case 2: system("banner \" PB 23\""); break;
	 case 4: system("banner \" PB 45\""); break;
	 case 8: system("banner \" PB 67\""); break;
	 case 3: system("banner \" PB 01 23\""); break;
	 case 5: system("banner \" PB 01 45\""); break;
	 case 9: system("banner \" PB 01 67\""); break;
	 case 6: system("banner \" PB 23 45\""); break;
	 case 0xa: system("banner \" PB 23 67\""); break;
	 case 0xc: system("banner \" PB 45 67\""); break;
	 default: break;
	}
  }
*/

  a = strcat(a,(const char *)"\n");
  a = strcat(a,(const char *)"**************************************************************************************************************************\n");
  a = strcat(a,(const char *)"**************************************************************************************************************************\n");
  a = strcat(a,(const char *)"\n");
    io_printf((char *)"%s",a);
    free(a);
}
