/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: global_chkr.h
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
#include <stdio.h>
#include <stdlib.h>
#include <strings.h>

#include "veriuser.h"
#include "vcsuser.h"

#define MAX_CORES 8
#define MAX_BANKS 8
#define MAX_PANELS 8
#define DC_ENTRIES_PER_PANEL 8
#define IC_ENTRIES_PER_PANEL 8
#define DC_WAYS 4
#define IC_WAYS 8
#define DC 1
#define IC 0

struct dcache_dir
{
	int valid;
	int l2_index;
	int l2_way;
	int l2_pa;
};

struct icache_dir
{
	int valid;
	int l2_index;
	int l2_way;
	int l2_pa;
};

//created for debug. Shows the actual cache contents for a particular l2 bank
struct cache
{
	int valid;
	int way;
	int l1_tag;
	int l1_index;
};

struct l1dump_variables
{
	char *dtag[MAX_CORES][DC_WAYS];  //L1-dtags for 8 cores
	char *itag[MAX_CORES][IC_WAYS];  //L1-itags for 8 cores
	int dtag_ngroups;
	int dtag_mem_size;
	int itag_ngroups;
	int itag_mem_size;
	char *dvld[MAX_CORES];	 	//L1-dvld array for 8 cores
	char *ivld[MAX_CORES];	 	//L1-ivld array for 8 cores
	int dvld_ngroups;
	int dvld_mem_size;
	int ivld_ngroups;
	int ivld_mem_size;
	struct dcache_dir dc[MAX_CORES][DC_ENTRIES_PER_PANEL]; //D$ created for chkr comparison
	struct icache_dir ic[MAX_CORES][IC_ENTRIES_PER_PANEL]; //I$ created for chkr comparison
};

struct l2tag_dir_variables
{
	char *l2t_lft[MAX_BANKS][8];   //l2t left array for 8 quad/bank for the 8 banks
	char *l2t_rgt[MAX_BANKS][8];   //l2t right array for 8 quad/bank for the 8 banks
	int  l2t_lft_ngroups;
	int  l2t_lft_mem_size;
	int  l2t_rgt_ngroups;
	int  l2t_rgt_mem_size;

	char *l2_ddir[MAX_BANKS][MAX_PANELS];  // l2-D directory data for 8 panels for 8 banks
	p_vecval l2_dvld[MAX_BANKS][MAX_PANELS]; // l2-dvld data for 8 panels for 8 banks
	int  l2ddir_ngroups;
	int  l2ddir_mem_size;
	int  l2dvld_ngroups;
	
	char *l2_idir[MAX_BANKS][MAX_PANELS]; // l2-I directory data for 8 panels for 8 banks
	p_vecval l2_ivld[MAX_BANKS][MAX_PANELS]; //l2-ivld data for 8 panels for 8 banks
	int  l2idir_ngroups;
	int  l2idir_mem_size;
	int  l2ivld_ngroups;
};


static struct l1dump_variables l1vars;
static struct l2tag_dir_variables l2vars;
static int core_present;
static int gchkr_debug;
static int hash_on;
static long long int good_trap_addr[8];

void init_chkr_caches(int bank, int panel);
void create_dcdir(int bank, int panel);
void create_icdir(int bank, int panel);
int get_l2tag(int bank, int l2index, int l2way);
int get_lword(int in_val);
int get_rword(int in_val);
int cmp_dcdir(int bank, int panel);
int cmp_icdir(int bank, int panel);
int cmp_dc_core_data(int core, int bank, int panel, struct cache dc[]);
int cmp_ic_core_data(int core, int bank, int panel, struct cache ic[]);
int get_l2dir_vld(int bank, int panel, int addr, int type);
int get_dc_vld_data(int core, int addr);
int get_ic_vld_data(int core, int addr);
void display_cache_entry(int core, int entry, int type);
void dump_l2dcdir(int bank, int panel);
void dump_l2icdir(int bank, int panel);
void dump_dc(int core, int bank, int panel, struct cache dc[]);
void dump_ic(int core, int bank, int panel, struct cache ic[]);
void disp_chkr_caches(void);
int chk_ic_dc_exclusion(int bank, int panel);
void sample_plusargs(void);
int is_reset_addr(long long l2pa);
int get_unhashed_index(int l2_pa, int l2_ind);
