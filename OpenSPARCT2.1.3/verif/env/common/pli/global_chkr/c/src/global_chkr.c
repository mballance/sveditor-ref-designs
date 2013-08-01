/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: global_chkr.c
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
#include "global_chkr.h"

void global_chkr_l1dump() 
{
   s_tfnodeinfo node_info;
   int core;
   int dc_way;
   int ic_way;
   int arg = 3;
   int cores_in_model;

   core_present = tf_getp(1);
   cores_in_model = tf_getp(2);
   
   sample_plusargs();

   if (gchkr_debug)
      io_printf("core_present = %0x, cores_in_model = %0x\n", core_present, cores_in_model);
   for (core = 0; core < 8; core++)
   {
    if (cores_in_model >> core & 1)
    {
      for (dc_way = 0; dc_way < 4; dc_way++)
      {
        if (!tf_nodeinfo(arg, &node_info))
        	io_printf("ERROR: DC%0d, way %0d getting node_info.\n", core, dc_way);
        /* 
        switch (node_info.node_type) 
        {
           case TF_MEMORY_NODE:
             io_printf("DC%0d, way %0d is memory node\n", core, dc_way); break;
           default:
             io_printf("ERROR: DC%0d, way %0d. Unexpected node_type = %0d.\n", core, dc_way, node_info.node_type); break;
	}
      
	io_printf("dc_array node_ngroups = %d\n", node_info.node_ngroups);
	io_printf("dc_array node_mem_size = %d\n", node_info.node_mem_size);
	*/

      	l1vars.dtag[core][dc_way] = node_info.node_value.memoryval_p;
	l1vars.dtag_ngroups = node_info.node_ngroups;
	l1vars.dtag_mem_size = node_info.node_mem_size;
        arg++;
      }
      
      for (ic_way = 0; ic_way < 8; ic_way++)
      {
        if (!tf_nodeinfo(arg, &node_info))
        	io_printf("ERROR: IC%0d, way %0d getting node_info.\n", core, ic_way);
     
	/*
        switch (node_info.node_type) 
        {
           case TF_MEMORY_NODE:
             io_printf("IC%0d, way %0d is memory node\n", core, ic_way); break;
           default:
             io_printf("ERROR: IC%0d, way %0d. Unexpected node_type = %0d.\n", core, ic_way, node_info.node_type); break;
	}
      
	io_printf("ic_array node_ngroups = %d\n", node_info.node_ngroups);
	io_printf("ic_array node_mem_size = %d\n", node_info.node_mem_size);
	*/

      	l1vars.itag[core][ic_way] = node_info.node_value.memoryval_p;
	l1vars.itag_ngroups = node_info.node_ngroups;
	l1vars.itag_mem_size = node_info.node_mem_size;
        arg++;
      }
        
      if (!tf_nodeinfo(arg++, &node_info))
       	io_printf("ERROR: DC%0d getting node_info for vld array\n", core);
      l1vars.dvld[core] = node_info.node_value.memoryval_p;
      l1vars.dvld_ngroups = node_info.node_ngroups;
      l1vars.dvld_mem_size = node_info.node_mem_size;
	
      //io_printf("dvld_array node_ngroups = %d\n", node_info.node_ngroups);
      //io_printf("dvld_array node_mem_size = %d\n", node_info.node_mem_size);

      if (!tf_nodeinfo(arg++, &node_info))
       	io_printf("ERROR: IC%0d getting node_info for vld array\n", core);
      l1vars.ivld[core] = node_info.node_value.memoryval_p;
      l1vars.ivld_ngroups = node_info.node_ngroups;
      l1vars.ivld_mem_size = node_info.node_mem_size;

      //io_printf("ivld_array node_ngroups = %d\n", node_info.node_ngroups);
      //io_printf("ivld_array node_mem_size = %d\n", node_info.node_mem_size);
   }
 }
}

void global_chkr_read_l2_tag() 
{
   s_tfnodeinfo node_info;
   int arg = 1;
   int bank;
   int way_bank;

   for (bank = 0; bank < 8; bank++)
   {
     for (way_bank = 0; way_bank < 8; way_bank++)
     {
        if (!tf_nodeinfo(arg++, &node_info))
        	io_printf("ERROR: L2T: Bank=%0d, left way_bank=%0d getting node_info.\n", bank, way_bank);
        if (node_info.node_type != TF_MEMORY_NODE) 
             io_printf("ERROR: L2T: Bank=%0d, left way_bank=%0d. Unexpected node_type = %0d.\n", bank, way_bank, node_info.node_type);
      
	//io_printf("l2t_array node_ngroups = %d\n", node_info.node_ngroups);
	//io_printf("l2t_array node_mem_size = %d\n", node_info.node_mem_size);

      	l2vars.l2t_lft[bank][way_bank] = node_info.node_value.memoryval_p;
	if (l2vars.l2t_lft_ngroups == 0)
		l2vars.l2t_lft_ngroups = node_info.node_ngroups;
	else
	{  if (l2vars.l2t_lft_ngroups != node_info.node_ngroups)
             io_printf("ERROR: L2T: Bank=%0d, left way_bank=%0d. l2vars.l2t_lft_ngroups(%0d) != node_info.node_ngroups(%0d).\n", bank, way_bank, l2vars.l2t_lft_ngroups, node_info.node_ngroups);
        }

	if (l2vars.l2t_lft_mem_size == 0)
		l2vars.l2t_lft_mem_size = node_info.node_mem_size;
	else
	{  if (l2vars.l2t_lft_mem_size != node_info.node_mem_size)
             io_printf("ERROR: L2T: Bank=%0d, left way_bank=%0d. l2vars.l2t_lft_mem_size(%0d) != node_info.node_mem_size(%0d).\n", bank, way_bank, l2vars.l2t_lft_mem_size, node_info.node_mem_size);
        }

        if (!tf_nodeinfo(arg++, &node_info))
        	io_printf("ERROR: L2T: Bank=%0d, rt way_bank=%0d getting node_info.\n", bank, way_bank);
        if (node_info.node_type != TF_MEMORY_NODE) 
             io_printf("ERROR: L2T: Bank=%0d, rt way_bank=%0d. Unexpected node_type = %0d.\n", bank, way_bank, node_info.node_type);
      
	//io_printf("l2t_array node_ngroups = %d\n", node_info.node_ngroups);
	//io_printf("l2t_array node_mem_size = %d\n", node_info.node_mem_size);

      	l2vars.l2t_rgt[bank][way_bank] = node_info.node_value.memoryval_p;
	if (l2vars.l2t_rgt_ngroups == 0)
		l2vars.l2t_rgt_ngroups = node_info.node_ngroups;
	else
	{  if (l2vars.l2t_rgt_ngroups != node_info.node_ngroups)
             io_printf("ERROR: L2T: Bank=%0d, rt way_bank=%0d. l2vars.l2t_rgt_ngroups(%0d) != node_info.node_ngroups(%0d).\n", bank, way_bank, l2vars.l2t_rgt_ngroups, node_info.node_ngroups);
        }

	if (l2vars.l2t_rgt_mem_size == 0)
		l2vars.l2t_rgt_mem_size = node_info.node_mem_size;
	else
	{  if (l2vars.l2t_rgt_mem_size != node_info.node_mem_size)
             io_printf("ERROR: L2T: Bank=%0d, rt way_bank=%0d. l2vars.l2t_rgt_mem_size(%0d) != node_info.node_mem_size(%0d).\n", bank, way_bank, l2vars.l2t_rgt_mem_size, node_info.node_mem_size);
        }
     } //for way_bank
   } //for bank
}

void global_chkr_read_l2_dc_dir()
{
   s_tfnodeinfo node_info;
   int arg = 1;
   int bank;
   int panel;

   for (bank = 0; bank < 8; bank++)
   {
     for (panel = 0; panel < 8; panel++)
     {
        if (!tf_nodeinfo(arg++, &node_info))
        	io_printf("ERROR: L2_ddir: Bank=%0d, panel=%0d getting node_info.\n", bank, panel);
        if (node_info.node_type != TF_MEMORY_NODE) 
             io_printf("ERROR: L2_ddir: Bank=%0d, panel=%0d. Unexpected node_type = %0d.\n", bank, panel, node_info.node_type);
      
	//io_printf("l2_ddir node_ngroups = %d\n", node_info.node_ngroups);
	//io_printf("l2_ddir node_mem_size = %d\n", node_info.node_mem_size);

      	l2vars.l2_ddir[bank][panel] = node_info.node_value.memoryval_p;
	if (l2vars.l2ddir_ngroups == 0)
		l2vars.l2ddir_ngroups = node_info.node_ngroups;
	else
	{  if (l2vars.l2ddir_ngroups != node_info.node_ngroups)
             io_printf("ERROR: L2T: Bank=%0d, panel=%0d. l2vars.l2ddir_ngroups(%0d) != node_info.node_ngroups(%0d).\n", bank, panel, l2vars.l2ddir_ngroups, node_info.node_ngroups);
        }

	if (l2vars.l2ddir_mem_size == 0)
		l2vars.l2ddir_mem_size = node_info.node_mem_size;
	else
	{  if (l2vars.l2ddir_mem_size != node_info.node_mem_size)
             io_printf("ERROR: L2T: Bank=%0d, panel=%0d. l2vars.l2ddir_mem_size(%0d) != node_info.node_mem_size(%0d).\n", bank, panel, l2vars.l2ddir_mem_size, node_info.node_mem_size);
  	}
        
	if (!tf_nodeinfo(arg++, &node_info))
        	io_printf("ERROR: L2_dvld: Bank=%0d, panel=%0d getting node_info.\n", bank, panel);
        if (node_info.node_type != TF_REG_NODE) 
             io_printf("ERROR: L2_dvld: Bank=%0d, panel=%0d. Unexpected node_type = %0d.\n", bank, panel, node_info.node_type);
      
	//io_printf("l2_dvld node_ngroups = %d\n", node_info.node_ngroups);

      	l2vars.l2_dvld[bank][panel] = node_info.node_value.vecval_p;
	if (l2vars.l2dvld_ngroups == 0)
		l2vars.l2dvld_ngroups = node_info.node_ngroups;
	else
	{  if (l2vars.l2dvld_ngroups != node_info.node_ngroups)
             io_printf("ERROR: L2T: Bank=%0d, panel=%0d. l2vars.l2dvld_ngroups(%0d) != node_info.node_ngroups(%0d).\n", bank, panel, l2vars.l2dvld_ngroups, node_info.node_ngroups);
        }
     } //panel
  }  //bank
}

void global_chkr_read_l2_ic_dir()
{
   s_tfnodeinfo node_info;
   int arg = 1;
   int bank;
   int panel;

   for (bank = 0; bank < 8; bank++)
   {
     for (panel = 0; panel < 8; panel++)
     {
        if (!tf_nodeinfo(arg++, &node_info))
        	io_printf("ERROR: L2_idir: Bank=%0d, panel=%0d getting node_info.\n", bank, panel);
        if (node_info.node_type != TF_MEMORY_NODE) 
             io_printf("ERROR: L2_idir: Bank=%0d, panel=%0d. Unexpected node_type = %0d.\n", bank, panel, node_info.node_type);
      
	//io_printf("l2_idir node_ngroups = %d\n", node_info.node_ngroups);
	//io_printf("l2_idir node_mem_size = %d\n", node_info.node_mem_size);

      	l2vars.l2_idir[bank][panel] = node_info.node_value.memoryval_p;
	if (l2vars.l2idir_ngroups == 0)
		l2vars.l2idir_ngroups = node_info.node_ngroups;
	else
	{  if (l2vars.l2idir_ngroups != node_info.node_ngroups)
             io_printf("ERROR: L2T: Bank=%0d, panel=%0d. l2vars.l2idir_ngroups(%0d) != node_info.node_ngroups(%0d).\n", bank, panel, l2vars.l2idir_ngroups, node_info.node_ngroups);
        }

	if (l2vars.l2idir_mem_size == 0)
		l2vars.l2idir_mem_size = node_info.node_mem_size;
	else
	{  if (l2vars.l2idir_mem_size != node_info.node_mem_size)
             io_printf("ERROR: L2T: Bank=%0d, panel=%0d. l2vars.l2idir_mem_size(%0d) != node_info.node_mem_size(%0d).\n", bank, panel, l2vars.l2idir_mem_size, node_info.node_mem_size);
  	}
        
	if (!tf_nodeinfo(arg++, &node_info))
        	io_printf("ERROR: L2_ivld: Bank=%0d, panel=%0d getting node_info.\n", bank, panel);
        if (node_info.node_type != TF_REG_NODE) 
             io_printf("ERROR: L2_ivld: Bank=%0d, panel=%0d. Unexpected node_type = %0d.\n", bank, panel, node_info.node_type);
      
	//io_printf("l2_ivld node_ngroups = %d\n", node_info.node_ngroups);
	//io_printf("l2_ivld node_mem_size = %d\n", node_info.node_mem_size);

      	l2vars.l2_ivld[bank][panel] = node_info.node_value.vecval_p;
	if (l2vars.l2ivld_ngroups == 0)
		l2vars.l2ivld_ngroups = node_info.node_ngroups;
	else
	{  if (l2vars.l2ivld_ngroups != node_info.node_ngroups)
             io_printf("ERROR: L2T: Bank=%0d, panel=%0d. l2vars.l2ivld_ngroups(%0d) != node_info.node_ngroups(%0d).\n", bank, panel, l2vars.l2ivld_ngroups, node_info.node_ngroups);
        }

     } //panel
  }  //bank
}

void global_chkr_cmp_l1_data()
{
 int bank = 0;
 int panel = 0;
 int dc_err_cnt = 0;
 int ic_err_cnt = 0;
 int exc_err = 0;
 
 bank = tf_getp(1);

  for (panel = 0; panel < 8; panel++)
  {
    init_chkr_caches(bank, panel);
    //if (gchkr_debug) disp_chkr_caches();
    create_dcdir(bank, panel);
    dc_err_cnt = dc_err_cnt + cmp_dcdir(bank, panel);
    create_icdir(bank, panel);
    ic_err_cnt = ic_err_cnt + cmp_icdir(bank, panel);
    exc_err = exc_err + chk_ic_dc_exclusion(bank, panel);
  }

 tf_putp(2, dc_err_cnt);
 tf_putp(3, ic_err_cnt);
 tf_putp(4, exc_err);

}

void init_chkr_caches(int bank, int panel)
{
  int core;
  int entry;
   
  for (core = 0; core < 8; core++)
  {
   if (core_present >> core & 1)
   {
     for (entry = 0; entry < DC_ENTRIES_PER_PANEL; entry++)
     {
        l1vars.dc[core][entry].valid = 0; 
        l1vars.dc[core][entry].l2_index = 0; 
        l1vars.dc[core][entry].l2_way = 0; 
        l1vars.dc[core][entry].l2_pa = 0; 
     }
     for (entry = 0; entry < IC_ENTRIES_PER_PANEL; entry++)
     {
        l1vars.ic[core][entry].valid = 0; 
        l1vars.ic[core][entry].l2_index = 0; 
        l1vars.ic[core][entry].l2_way = 0; 
        l1vars.ic[core][entry].l2_pa = 0; 
     }
    }
  }
  if (gchkr_debug)
       	io_printf("L2Bank%0d, Panel%0d: Caches are init.\n", bank, panel);
}

void disp_chkr_caches(void)
{
  int core;
  int entry;
  
     io_printf("I AM CALLED\n");

   
  for (core = 0; core < 8; core++)
  {
     io_printf("core = %0d \n", core);
    if (core_present >> core & 1)
    {
     io_printf("CHKR L2D DATA\n");
     io_printf("ENT\tVLD\tL2_IND\tWAY\tPA\n");
     for (entry = 0; entry < DC_ENTRIES_PER_PANEL; entry++)
     {
        l1vars.dc[core][entry].valid = 0; 
        l1vars.dc[core][entry].l2_index = 0; 
        l1vars.dc[core][entry].l2_way = 0; 
        l1vars.dc[core][entry].l2_pa = 0; 
        io_printf("%0x\t%0x\t%0x\t%0x\t%0x\n", entry, l1vars.dc[core][entry].valid, l1vars.dc[core][entry].l2_index, l1vars.dc[core][entry].l2_way, l1vars.dc[core][entry].l2_pa);
     }
     io_printf("CHKR L2I DATA\n");
     io_printf("ENT\tVLD\tL2_IND\tWAY\tPA\n");
     for (entry = 0; entry < IC_ENTRIES_PER_PANEL; entry++)
     {
        l1vars.ic[core][entry].valid = 0; 
        l1vars.ic[core][entry].l2_index = 0; 
        l1vars.ic[core][entry].l2_way = 0; 
        l1vars.ic[core][entry].l2_pa = 0; 
        io_printf("%0x\t%0x\t%0x\t%0x\t%0x\n", entry, l1vars.ic[core][entry].valid, l1vars.ic[core][entry].l2_index, l1vars.ic[core][entry].l2_way, l1vars.ic[core][entry].l2_pa);
     }
    }
  }  //core
}

void create_dcdir(int bank, int panel)
{
  int addr;
  int group_num;
  int vld;
  int word;
  int core;
  int caddr = 0;
  char *aval_ptr; 
  int bit_5 = 0;
  int bit_4 = 0;
  int l2way, l2index, l2tag;
  int word_increment;

      for (addr = 0; addr < l2vars.l2ddir_mem_size; addr++)
      {
       word_increment = l2vars.l2ddir_ngroups * 2;
       aval_ptr = l2vars.l2_ddir[bank][panel] + (word_increment * addr);
       vld = get_l2dir_vld(bank, panel, addr, DC);
       if (vld)
       {
	  word = 0;
          for (group_num = l2vars.l2ddir_ngroups - 1; group_num >= 0; group_num--)
          {
             word <<= 8;
             word |= aval_ptr[group_num] & 0xff;
          }
	  l2way = word & 0xf;
	  l2index = word >> 4 & 0x1ff;
	  l2tag = get_l2tag(bank, l2index, l2way);
          if (panel > 3)
 		bit_5 = 1;
          bit_4 = addr >> 5 & 1;

         //cache_addr = bits 10:9, bits 5:4, way [1:0]
	 //To access the directory L2$ uses a 6 bits address decodes as:
	 //bit 4, cpuid[2:0], way [1:0]
	
         caddr = bit_4 << 2 | (addr & 0x3);
	 core = addr >> 2 & 0x7;
         //io_printf("L2D_DIR: ENTRY: Bank = %0x, panel = %0x, core = %0x, dir_addr = %0x, l2tag = %x, l2_index = %x, l2way = %x, caddr = %x\n", bank, panel, core, addr,  l2tag, l2index, l2way, caddr);

	 if ((core_present & 1 << core) == 0)
            io_printf("L2D_DIR: ERROR: Core not present while entry present in l2d_dir. Bank = %0x, panel = %0x, dir_addr = %0x, l2tag = %x, l2_index = %x, l2way = %x, caddr = %x\n", bank, panel, addr, l2tag, l2index, l2way, caddr);
         
         l1vars.dc[core][caddr].valid = 1; 
         l1vars.dc[core][caddr].l2_index = l2index; 
         l1vars.dc[core][caddr].l2_way = l2way; 
         l1vars.dc[core][caddr].l2_pa = l2tag; 

       } //if vld
     } //for adr
     if (gchkr_debug)
     {
	 dump_l2dcdir(bank, panel);
     }
}

void create_icdir(int bank, int panel)
{
  int addr;
  int group_num;
  int vld;
  int word;
  int core;
  int caddr;
  char *aval_ptr; 
  int bit_5 = 0;
  int l2way, l2index, l2tag;
  int word_increment;
  int way_2 = 0;
      
      for (addr = 0; addr < l2vars.l2idir_mem_size; addr++)
      {
       word_increment = l2vars.l2idir_ngroups * 2;
       aval_ptr = l2vars.l2_idir[bank][panel] + (word_increment * addr);
       vld = get_l2dir_vld(bank, panel, addr, IC);
       if (vld)
       {
	  word = 0;
          for (group_num = l2vars.l2idir_ngroups - 1; group_num >= 0; group_num--)
          {
             word <<= 8;
             word |= aval_ptr[group_num] & 0xff;
          }
	  l2way = word & 0xf;
	  l2index = word >> 4 & 0x1ff;
	  l2tag = get_l2tag(bank, l2index, l2way);
          if (panel > 3)
 		bit_5 = 1;

         //cache_addr = bits 10:9, bits 5, way [2:0]
	 //To access the directory L2$ uses a 6 bits address decodes as:
	 //way[2] cpuid[2:0], way [1:0]
	 way_2 = addr >> 5 & 1;
         caddr = way_2 << 2 | (addr & 0x3);
	 core = addr >> 2 & 0x7;
	 if ((core_present & 1 << core) == 0)
            io_printf("L2I_DIR: ERROR: Core  = %0d not present while entry present in l2i_dir. Bank = %0x, panel = %0x, dir_addr = %0x, l2tag = %x, l2_index = %x, l2way = %x, caddr = %x\n", core, bank, panel, addr, l2tag, l2index, l2way, caddr);
         
	 if (gchkr_debug)
	    io_printf("L2I_DIR: ENTRY: Bank = %0x, panel = %0x, core = %0x, dir_addr = %0x, l2tag = %x, l2_index = %x, l2way = %x, caddr = %x\n", bank, panel, core, addr,  l2tag, l2index, l2way, caddr);
         
         l1vars.ic[core][caddr].valid = 1; 
         l1vars.ic[core][caddr].l2_index = l2index; 
         l1vars.ic[core][caddr].l2_way = l2way; 
         l1vars.ic[core][caddr].l2_pa = l2tag; 
       } //if vld
     } //for adr
     if (gchkr_debug)
     {
	 dump_l2icdir(bank, panel);
     }
}


int get_l2dir_vld(int bank, int panel, int addr, int type)
{
   int gidx;
   int sidx;
   int vld = 0;
   int avld;

   gidx = addr / 32;
   sidx = addr % 32;

   if (gchkr_debug & (addr == 0))  //print it only for the first access to panel
   {
    if (type)
      io_printf("\nL2D_DIR: Bank%0x:Panel%0x: addr = %0x, vld = %x:%x\n", bank, panel, addr, l2vars.l2_dvld[bank][panel][1].avalbits, l2vars.l2_dvld[bank][panel][0].avalbits);
    else
      io_printf("\nL2I_DIR: bank%0x:Panel%0x: addr = %0x, vld = %0x:%0x\n", bank, panel, addr, l2vars.l2_ivld[bank][panel][1].avalbits, l2vars.l2_ivld[bank][panel][0].avalbits);
   }

   if (type)
     avld = l2vars.l2_dvld[bank][panel][gidx].avalbits;
   else
     avld = l2vars.l2_ivld[bank][panel][gidx].avalbits;

   if (avld & (1 << sidx))
      vld = 1;
   
   //if (type) io_printf("L2D_DIR: <%0x:%0x:%0d> vld = %d\n", bank, panel, addr, vld);
   //else io_printf("L2I_DIR: <%0x:%0x:%0d> vld = %d\n", bank, panel, addr, vld);

   return vld;
}

int get_l2tag(int bank, int l2index, int l2way)
{
  char *lt_ptr;
  char *rt_ptr;
  int lt_word_increment;
  int rt_word_increment;
  char *aval_lt_ptr;
  char *aval_rt_ptr;
  int even = 0;
  int lword = 0;
  int rword = 0;
  int ldata = 0;
  int rdata = 0;
  int group_num;
  int tag = 0;

  switch (l2way)
  {
      case 0: 
      case 4: lt_ptr = l2vars.l2t_lft[bank][0]; rt_ptr = l2vars.l2t_rgt[bank][0]; break; 
      case 1:
      case 5: lt_ptr = l2vars.l2t_lft[bank][1]; rt_ptr = l2vars.l2t_rgt[bank][1]; break; 
      case 8:
      case 12: lt_ptr = l2vars.l2t_lft[bank][2]; rt_ptr = l2vars.l2t_rgt[bank][2]; break; 
      case 9: 
      case 13: lt_ptr = l2vars.l2t_lft[bank][3]; rt_ptr = l2vars.l2t_rgt[bank][3]; break; 
      case 2: 
      case 6: lt_ptr = l2vars.l2t_lft[bank][4]; rt_ptr = l2vars.l2t_rgt[bank][4]; break; 
      case 3: 
      case 7: lt_ptr = l2vars.l2t_lft[bank][5]; rt_ptr = l2vars.l2t_rgt[bank][5]; break; 
      case 10: 
      case 14: lt_ptr = l2vars.l2t_lft[bank][6]; rt_ptr = l2vars.l2t_rgt[bank][6]; break; 
      case 11: 
      case 15: lt_ptr = l2vars.l2t_lft[bank][7]; rt_ptr = l2vars.l2t_rgt[bank][7]; break; 
  }
  
  lt_word_increment = l2vars.l2t_lft_ngroups * 2;
  aval_lt_ptr = lt_ptr + (l2index * lt_word_increment); 
  
  rt_word_increment = l2vars.l2t_rgt_ngroups * 2;
  aval_rt_ptr = rt_ptr + (l2index * rt_word_increment); 

//even is the higher way

  switch (l2way)
  {
      case 4: 
      case 5: 
      case 12: 
      case 13: 
      case 6: 
      case 7: 
      case 14: 
      case 15: even = 1;break;
      default: even = 0; break;
  }

  for (group_num = l2vars.l2t_lft_ngroups - 1; group_num >= 0; group_num--)
  {
       lword <<= 8;
       lword |= aval_lt_ptr[group_num] & 0xff;
  }

  for (group_num = l2vars.l2t_rgt_ngroups - 1; group_num >= 0; group_num--)
  {
       rword <<= 8;
       rword |= aval_rt_ptr[group_num] & 0xff;
  }
  
  if (gchkr_debug) io_printf("L2TAG: <bank[%0x]:index[%0x]:way[%0d]> lword = %x, rword = %x\n", bank, l2index, l2way, lword, rword);

  switch (even)
  {
     case 1: ldata = get_lword(lword >> 2); rdata = get_rword(rword); break;  
     case 0: ldata = get_lword(lword >> 1); rdata = get_rword(rword >> 1); break;
  }
  
  if (gchkr_debug) io_printf("L2TAG: <bank[%0x]:index[%0x]:way[%0d]> lword = %x, rword = %x, ldata=%x, rdata=%x\n", bank, l2index, l2way, lword, rword, ldata, rdata);

//15 bits are received from left side and 13 bits from the right side.
    
  tag = ldata << 7 | rdata >> 6;
  return tag;
}


//Lft array is 31 bits. Rightmost bit is the redundancy bit which is removed.
//So, this function is passed 30 bits, out of which we extract 15 bits.
//left array is 30:0
//29 27 25 23 21 19 17 15 13 11  9 7 5 3 1  <= odd sequence
//30 28 26 24 22 20 18 16 14 12 10 8 6 4 2  <= even sequence


//for this to work bit 0 shd have the lsb of data we want to extract

int get_lword (int in_val)
{
  int new_val = 0;
  int i;

  //io_printf("get_lword: in_val = %x, new_val = %x\n", in_val, new_val);
  for (i = 0; i < 15; i++)
  {
      new_val |= (in_val & 1) << i;
      in_val >>= 2;
  }
  //io_printf("get_lword: in_val = %x, new_val = %x\n", in_val, new_val);
  return new_val;
}

//for rt array, the redundancy bits are on left. No need to
//remove them, just don't grab them. We still need to make sure 
//that bit in the lsb position is valid;

//rt array is: 0:26
//1 3 5 7 9  11 13 15 17 19 21 23 25   <= odd sequence
//2 4 6 8 10 12 14 16 18 20 22 24 26   <= even sequence

int get_rword (int in_val)
{
  int new_val = 0;
  int i;

  //io_printf("get_rword: in_val = %x, new_val = %x\n", in_val, new_val);
  for (i = 0; i < 13; i++)
  {
      new_val |= (in_val & 1) << i;
      in_val >>= 2;
  }
  //io_printf("get_rword: in_val = %x, new_val = %x\n", in_val, new_val);
  return new_val;
}

int cmp_dcdir(int bank, int panel)
{
 int core;
 int word_increment;
 int group_num;
 int bit_10_9 = 0;
 int bit_5 = 0;
 int bit_4 = 0;
 int way;
 int dtag_addr;
 int caddr = 0;
 int tag = 0;
 int dc_way_vld, i;
 char *aval_ptr;
 struct cache dc_tmp[8];
 int err = 0;
 int err_cnt = 0;
  
  for (i = 0; i < 8; i++)
  {
           dc_tmp[i].valid = 0;
           dc_tmp[i].way = 0;
           dc_tmp[i].l1_tag = 0;
           dc_tmp[i].l1_index = 0;
  }
   for (core = 0; core < 8; core++)
   {
     if (core_present >> core & 1)
     {
      word_increment =  l1vars.dtag_ngroups * 2;
      switch (panel)
      {
	 case 0: bit_10_9 = 0; bit_5 = 0; break;
	 case 1: bit_10_9 = 1; bit_5 = 0; break;
	 case 2: bit_10_9 = 2; bit_5 = 0; break;
	 case 3: bit_10_9 = 3; bit_5 = 0; break;
	 case 4: bit_10_9 = 0; bit_5 = 1; break;
	 case 5: bit_10_9 = 1; bit_5 = 1; break;
	 case 6: bit_10_9 = 2; bit_5 = 1; break;
	 case 7: bit_10_9 = 3; bit_5 = 1; break;
      }
       for (bit_4 = 0; bit_4 < 2; bit_4++)
       {
             dtag_addr = bit_10_9 << 5 | bank << 2 | bit_5 << 1 | bit_4;
             dc_way_vld = get_dc_vld_data(core, dtag_addr);
             //io_printf("DC%0d\tINDEX\t\tWAY\t\tTAG\t\t\t dc_way_vld = %0x\n", core, dc_way_vld);

	     for (way = 0; way < 4; way++)
	     {
	       aval_ptr = l1vars.dtag[core][way] + (word_increment * dtag_addr);
	       tag = 0;
	       for (group_num = l1vars.dtag_ngroups - 1; group_num >= 0; group_num--)
	       {
	           tag <<= 8;
	           tag |= aval_ptr[group_num] & 0xff;
               }
	       //Only tag bits 29:0 are valid and bit 29 is parity bit.
	       //remove parity bit
	       tag = (tag << 3 ) >> 3;
               //io_printf("L1D: index = %x, way%0d, tag = %x\n", dtag_addr, way, tag);
	       
	       caddr = bit_4 << 2 | way;
	       if (dc_way_vld >> way & 1)
	       {
	           dc_tmp[caddr].valid = 1;
	           dc_tmp[caddr].way = way;
	           dc_tmp[caddr].l1_tag = tag;
                   dc_tmp[caddr].l1_index = dtag_addr;
               }
	     }
        } //bit 4
      if (gchkr_debug) dump_dc(core, bank, panel, dc_tmp);	 

      err = cmp_dc_core_data(core, bank, panel, dc_tmp);
	if (err)
          io_printf("ERROR: L2D_DIR: core<%0x>:bank<%0x>:panel<%0x>: %0d mismatches.\n", core, bank, panel, err);
        err_cnt += err;
	for (i = 0; i < 8; i++)
	{
           dc_tmp[i].valid = 0;
           dc_tmp[i].way = 0;
           dc_tmp[i].l1_tag = 0;
           dc_tmp[i].l1_index = 0;
        }
     }
   } // core
   return err_cnt;
}

int cmp_dc_core_data(int core, int bank, int panel, struct cache dc[])
{
    long long l1pa, l1tmp_pa;
    long long l2pa, l2tmp_pa;
    int mismatch = 0;
    int i;
    int l2dir_index = 0;
    int dtag_addr = 0;
    int bit_5 = 0;
    int bit_4 = 0;
    int l2_ind_unhash = 0;

    if (panel > 3) bit_5 = 1;
    for (i = 0; i < 8; i++)
    {
       l2dir_index = (i >> 2 & 0x1) << 5 | core << 2 | (i & 0x3);  //bit_4, core, way
       dtag_addr =  dc[i].l1_index;
       l1tmp_pa = dc[i].l1_tag;
       l2tmp_pa = l1vars.dc[core][i].l2_pa;
       l1pa = l1tmp_pa << 11 | dtag_addr << 4; 
       bit_4 = i >> 2 & 1;

       if (hash_on)
	l2_ind_unhash = get_unhashed_index(l1vars.dc[core][i].l2_pa, l1vars.dc[core][i].l2_index);
       else
	l2_ind_unhash = l1vars.dc[core][i].l2_index;

       l2pa = l2tmp_pa << 18 | l2_ind_unhash << 9 | bank << 6 | bit_5 << 5 | bit_4 << 4;
	       
      if (l1vars.dc[core][i].valid != dc[i].valid)
      {
          io_printf("\nERROR: L2D_DIR: core<%0x>:bank<%0x>:panel<%0x> Vld bit mismatch between L2$_ddir(vld=%0d) and L1_D$(vld=%0d).\n", core, bank, panel, l1vars.dc[core][i].valid, dc[i].valid);
	  
	  io_printf("l2_dir_index<%0x>:l2_index<%0x>:l2_way<%0x>: L2_tag[39:18] = %0x, L2_tag[39:0] = %0llx\n", l2dir_index, l1vars.dc[core][i].l2_index, l1vars.dc[core][i].l2_way, l1vars.dc[core][i].l2_pa, l2pa);

	  io_printf("\nl1_D$_index<%0x>:l1_way<%0x>: L1_tag[39:11] = %0x, L1_tag[39:0] = %0llx\n", dtag_addr, dc[i].way, dc[i].l1_tag, l1pa);
	  mismatch = mismatch + 1;
      }
      else if (dc[i].valid)
      {
        if (l1pa != l2pa)
        {
          io_printf("\nERROR: L2D_DIR: core<%0x>:bank<%0x>:panel<%0x> PA mismatch between L2$_ddir(PA=%0llx) and L1_D$(PA=%0llx).\n", core, bank, panel, l2pa, l1pa);
	  
	  io_printf("l2_dir_index<%0x>:l2_way<%0x>:l2_index<%0x>: L2_tag[39:18] = %0x, L2_tag[39:0] = %0llx\n", l2dir_index, l1vars.dc[core][i].l2_way, l1vars.dc[core][i].l2_index, l1vars.dc[core][i].l2_pa, l2pa);

	  io_printf("\nl1_D$_index<%0x>:l1_way<%0x>: L1_tag[39:11] = %0x, L1_tag[39:0] = %0llx\n", dtag_addr, dc[i].way, dc[i].l1_tag, l1pa);
	  mismatch = mismatch + 1;
        }
      }
    }
      return mismatch;
}


int get_dc_vld_data(int core, int addr)
{
  char *aval_ptr;
  int group_num;
  int vld = 0;
  int vld1, vld2;
     
     group_num = l1vars.dvld_ngroups;
     aval_ptr = l1vars.dvld[core] + (l1vars.dvld_ngroups * 2) * (addr >> 2);	

     for (--group_num; group_num >= 0; group_num--)
     {
        vld <<= 8;
        vld |= aval_ptr[group_num] & 0xff;
     }
     //io_printf("addr = %0x, vld = %0x\n", addr, vld); 

     switch(addr & 0x3)
     {
        case 0: vld1 = vld & 0xf; vld2 = vld >> 16 & 0xf; break;  
        case 1: vld1 = vld >> 4 & 0xf; vld2 = vld >> 20 & 0xf; break;  
        case 2: vld1 = vld >> 8 & 0xf; vld2 = vld >> 24 & 0xf; break;  
        case 3: vld1 = vld >> 12 & 0xf; vld2 = vld >> 28 & 0xf; break;  
     }
     //if (gchkr_debug) 
        //io_printf("addr = %0x, vld = %0x, vld1 = %0x, vld2 = %0x\n", addr, vld, vld1, vld2); 

     if (vld1 != vld2)
          io_printf("ERROR: DC%0d, vld1 (%x) != vld2 (%x) for index %x.\n", core, vld1, vld2, addr);

     return vld1;
}

int cmp_icdir(int bank, int panel)
{
 int core;
 int word_increment;
 int group_num;
 int bit_10_9 = 0;
 int bit_5 = 0;
 int way;
 int itag_addr;
 int caddr;
 int tag = 0;
 int ic_way_vld, i;
 char *aval_ptr;
 struct cache ic_tmp[8];
 int err = 0;
 int err_cnt = 0;
  
  for (i = 0; i < 8; i++)
  {
           ic_tmp[i].valid = 0;
           ic_tmp[i].way = 0;
           ic_tmp[i].l1_tag = 0;
           ic_tmp[i].l1_index = 0;
  }
      switch (panel)
      {
	 case 0: bit_10_9 = 0; bit_5 = 0; break;
	 case 1: bit_10_9 = 1; bit_5 = 0; break;
	 case 2: bit_10_9 = 2; bit_5 = 0; break;
	 case 3: bit_10_9 = 3; bit_5 = 0; break;
	 case 4: bit_10_9 = 0; bit_5 = 1; break;
	 case 5: bit_10_9 = 1; bit_5 = 1; break;
	 case 6: bit_10_9 = 2; bit_5 = 1; break;
	 case 7: bit_10_9 = 3; bit_5 = 1; break;
      }
   for (core = 0; core < 8; core++)
   {
       if (core_present >> core & 1)
       {
             word_increment =  l1vars.itag_ngroups * 2;
             itag_addr = bit_10_9 << 4 | bank << 1 | bit_5;
             ic_way_vld = get_ic_vld_data(core, itag_addr);
             //io_printf("DC%0d\tINDEX\t\tWAY\t\tTAG\t\t\t ic_way_vld = %0x\n", core, ic_way_vld);

	     for (way = 0; way < 8; way++)
	     {
	       aval_ptr = l1vars.itag[core][way] + (word_increment * itag_addr);
	       tag = 0;
	       for (group_num = l1vars.itag_ngroups - 1; group_num >= 0; group_num--)
	       {
	           tag <<= 8;
	           tag |= aval_ptr[group_num] & 0xff;
               }
	       //Only tag bits 29:0 are valid and bit 29 is parity bit.
	       //remove parity bit
	       //if (ic_way_vld >> way & 1)
                   //io_printf("L1I: index = %x, way%0d, tag = %x\n", itag_addr, way, tag);
	       tag = (tag << 3 ) >> 3;
	       
	       caddr = way;
	       if (ic_way_vld >> way & 1)
	       {
	           ic_tmp[caddr].valid = 1;
	           ic_tmp[caddr].way = way;
	           ic_tmp[caddr].l1_tag = tag;
	           ic_tmp[caddr].l1_index = itag_addr;
               }
	     }
             if (gchkr_debug) dump_ic(core, bank, panel, ic_tmp);	 

	     err = cmp_ic_core_data(core, bank, panel, ic_tmp);
	     if (err)
               io_printf("ERROR: L2I_DIR: core<%0x>:bank<%0x>:panel<%0d>: %0d mismatches.\n", core, bank, panel, err);
             err_cnt += err;
	     for (i = 0; i < 8; i++)
	     {
                ic_tmp[i].valid = 0;
                ic_tmp[i].way = 0;
                ic_tmp[i].l1_tag = 0;
                ic_tmp[i].l1_index = 0;
             }
	}
   } // core
   return err_cnt;
}

int cmp_ic_core_data(int core, int bank, int panel, struct cache ic[])
{
    long long l1pa, l1tmp_pa;
    long long l2pa, l2tmp_pa;
    int mismatch = 0;
    int i;
    int bit_5 = 0;
    int l2dir_index, itag_addr;
    int l2_ind_unhash = 0;

    if (panel > 3) bit_5 = 1;
    for (i = 0; i < 8; i++)
    {
       l2dir_index =  (i >> 2 & 0x1) << 5 | core << 2 | (i & 0x3);  //way[2], core, way
       itag_addr =  ic[i].l1_index;
       l1tmp_pa = ic[i].l1_tag;
       l2tmp_pa = l1vars.ic[core][i].l2_pa;
       l1pa = l1tmp_pa << 11 | itag_addr << 5; 
       if (hash_on)
	l2_ind_unhash = get_unhashed_index(l1vars.ic[core][i].l2_pa, l1vars.ic[core][i].l2_index);
       else
	l2_ind_unhash = l1vars.ic[core][i].l2_index;

       l2pa = l2tmp_pa << 18 | l2_ind_unhash << 9 | bank << 6 | bit_5 << 5;
	       
      if (l1vars.ic[core][i].valid != ic[i].valid)
      {
	  if (l1vars.ic[core][i].valid & is_reset_addr(l2pa))
	  {
             io_printf("\nL2I_DIR: core<%0x>:bank<%0x>:panel<%0x> Vld bit mismatch between L2$_idir(vld=%0d) and L1_I$(vld=%0d). Ignoring the mismatch as L2$ addr is good trap addr.\n", core, bank, panel, l1vars.ic[core][i].valid, ic[i].valid);
	  }
          else
	  {
             io_printf("\nERROR: L2I_DIR: core<%0x>:bank<%0x>:panel<%0x> Vld bit mismatch between L2$_idir(vld=%0d) and L1_I$(vld=%0d).\n", core, bank, panel, l1vars.ic[core][i].valid, ic[i].valid);
	  
	      io_printf("l2_dir_index<%0x>:l2_index<%0x>:l2_way<%0x>: L2_tag[39:18] = %0x, L2_tag[39:0] = %0llx\n", l2dir_index, l1vars.ic[core][i].l2_index, l1vars.ic[core][i].l2_way, l1vars.ic[core][i].l2_pa, l2pa);

	      io_printf("\nl1_I$_index<%0x>:l1_way<%0x>: L1_tag[39:11] = %0x, L1_tag[39:0] = %0llx\n", itag_addr, ic[i].way, ic[i].l1_tag, l1pa);
	      mismatch = mismatch + 1;
	  }
      }
      else if (ic[i].valid)   //if valid then only chkr for pa match
      {
        if (l1pa != l2pa)
        {
	  if (is_reset_addr(l2pa))
	  {
             io_printf("\nL2I_DIR: core<%0x>:bank<%0x>:panel<%0x> PA mismatch between L2$_idir(PA=%0llx) and L1_I$(PA=%0llx).Ignoring the mismatch as L2$ addr is good trap addr.\n", core, bank, panel, l2pa, l1pa);
	  }
	  else
	  {
              io_printf("\nERROR: L2I_DIR: core<%0x>:bank<%0x>:panel<%0x> PA mismatch between L2$_idir(PA=%0llx) and L1_I$(PA=%0llx).\n", core, bank, panel, l2pa, l1pa);
	  
	      io_printf("l2_dir_index<%0x>:l2_way<%0x>:l2_index<%0x>: L2_tag[39:18] = %0x, L2_tag[39:0] = %0llx\n", l2dir_index, l1vars.ic[core][i].l2_way, l1vars.ic[core][i].l2_index, l1vars.ic[core][i].l2_pa, l2pa);

	      io_printf("\nl1_I$_index<%0x>:l1_way<%0x>: L1_tag[39:11] = %0x, L1_tag[39:0] = %0llx\n", itag_addr, ic[i].way, ic[i].l1_tag, l1pa);
	      mismatch = mismatch + 1;
	  }
        }
      }
    }
      return mismatch;
}


int get_ic_vld_data(int core, int addr)
{
  char *aval_ptr;
  int group_num;
  int vld = 0;
  int vld1 = 0;
  int vld2 = 0;

     group_num = l1vars.ivld_ngroups;
     aval_ptr = l1vars.ivld[core] + (l1vars.ivld_ngroups * 2) * (addr >> 1);	

     for (--group_num; group_num >= 0; group_num--)
     {
        vld <<= 8;
        vld |= aval_ptr[group_num] & 0xff;
     }

     switch(addr & 0x1)
     {
        case 0: vld1 = vld & 0xff; vld2 = vld >> 16 & 0xff; break;  
        case 1: vld1 = vld >> 8 & 0xff; vld2 = vld >> 24 & 0xff; break;  
     }
     
     //if (gchkr_debug) 
        //io_printf("addr = %0x, vld = %0x, vld1 = %0x, vld2 = %0x\n", addr, vld, vld1, vld2); 

     if (vld1 != vld2)
          io_printf("ERROR: IC%0d, vld1 (%x) != vld2 (%x) for index %x.\n", core, vld1, vld2, addr);
     
     return vld1;
}
    
int chk_ic_dc_exclusion(int bank, int panel)
{
  int i, j;
  int err  = 0;
  int core  = 0;
  
  for (core= 0; core< 8; core++)
  {
     for (i= 0; i< 8; i++)
     {
        if (l1vars.ic[core][i].valid)
        {
           for (j = 0; j < 8; j++)
           {
               if (l1vars.dc[core][j].valid & (l1vars.ic[core][i].l2_index == l1vars.dc[core][j].l2_index) & (l1vars.ic[core][i].l2_way == l1vars.dc[core][j].l2_way))
	       {
		   err = err + 1;
        	   io_printf("ERROR: D$-I$ mutual exclusion violation. L2bank = %0d, Panel = %0d, core=%0d, I$_entry=%0d, D$_entry=%0d\n", bank, panel, core, i, j);
               }
            }
	 }
      }
   }

   return err;
}

void display_cache_entry(int core, int entry, int type)
{
   long long full_pa;
   if (type)
   {
     full_pa = l1vars.dc[core][entry].l2_pa;
     full_pa = l1vars.dc[core][entry].l2_pa << 11  | l1vars.dc[core][entry].l2_index << 4;
     io_printf("DC%0d, entry = %x, way = %x, index = %x, pa = %llx\n", core, entry, l1vars.dc[core][entry].l2_way, l1vars.dc[core][entry].l2_index, full_pa);
   }
   else
   {
     full_pa = l1vars.ic[core][entry].l2_pa;
     full_pa = l1vars.ic[core][entry].l2_pa << 11  | l1vars.ic[core][entry].l2_index << 4;
     io_printf("ic%0d, entry = %x, way = %x, index = %x, pa = %llx\n", core, entry, l1vars.ic[core][entry].l2_way, l1vars.ic[core][entry].l2_index, full_pa);
   }
}

void dump_l2dcdir(int bank, int panel)
{
  int bit_5 = 0;
  int core = 0;
  int i;
  long long l2pa, l2tmp_pa;
  int bit_4 = 0;
  int caddr = 0;
  int l1_index = 0;
  int l1_way = 0;
  int l2_ind_unhash = 0;

  io_printf("L2D_dir Bank%0d, Panel%0d valid Data.\n", bank, panel);
  if (hash_on)
     io_printf("INDEX\tCORE\tL1_INDEX\tL1_WAY\tL2_INDEX\tL2_INDEX_UNHASH\tL2_WAY\tL2_Tag[39:18]\t\tL2_PA[39:0]\n");
  else
     io_printf("INDEX\tCORE\tL1_INDEX\tL1_WAY\tL2_INDEX\tL2_WAY\tL2_Tag[39:18]\t\tL2_PA[39:0]\n");

  for (i = 0; i < 64; i++)
  {
    core = i >> 2 & 0x7;
    if (panel > 3) bit_5 = 1;
    bit_4 = i >> 5 & 1;
    l1_index = (panel & 0x3) << 5 | bank << 2 | bit_5 << 1 | bit_4;
    l1_way = i & 0x3;
    caddr = bit_4 << 2 | (i & 0x3);

    if (l1vars.dc[core][caddr].valid)
    {
      l2tmp_pa = l1vars.dc[core][caddr].l2_pa;
      if (hash_on)
	l2_ind_unhash = get_unhashed_index(l1vars.dc[core][caddr].l2_pa, l1vars.dc[core][caddr].l2_index);
      else
	l2_ind_unhash = l1vars.dc[core][caddr].l2_index;

      l2pa = l2tmp_pa << 18 | l2_ind_unhash  << 9 | bank << 6 | bit_5 << 5 | ((i >> 1) & 0x10); 
      if (hash_on)
         io_printf("%0x\t%0x\t%0x\t\t%0x\t%0x\t\t%0x\t\t%0x\t%0x\t\t%0llx\n", i, core, l1_index, l1_way, l1vars.dc[core][caddr].l2_index, l2_ind_unhash, l1vars.dc[core][caddr].l2_way, l1vars.dc[core][caddr].l2_pa, l2pa);
      else
         io_printf("%0x\t%0x\t%0x\t\t%0x\t%0x\t\t%0x\t%0x\t\t%0llx\n", i, core, l1_index, l1_way, l1vars.dc[core][caddr].l2_index, l1vars.dc[core][caddr].l2_way, l1vars.dc[core][caddr].l2_pa, l2pa);
    }
  }
}

void dump_l2icdir(int bank, int panel)
{
  int bit_5 = 0;
  int core = 0;
  int i;
  long long l2pa, l2tmp_pa;
  int caddr = 0;
  int way_2 = 0;
  int l1_index = 0;
  int l1_way = 0;
  int l2_ind_unhash = 0;

  io_printf("L2I_dir Bank%0d, Panel%0d valid Data.\n", bank, panel);
  if (hash_on)
     io_printf("INDEX\tCORE\tL1_INDEX\tL1_WAY\tL2_INDEX\tL2_INDEX_UNHASH\tL2_WAY\tL2_Tag[39:18]\t\tL2_PA[39:0]\n");
  else
     io_printf("INDEX\tCORE\tL1_INDEX\tL1_WAY\tL2_INDEX\tL2_WAY\tL2_Tag[39:18]\t\tL2_PA[39:0]\n");

  for (i = 0; i < 64; i++)
  {
    core = i >> 2 & 0x7;
    if (panel > 3) bit_5 = 1;
    way_2 = i >> 5 & 1;
    l1_index = (panel & 0x3) << 4 | bank << 1 | bit_5;
    l1_way = way_2 << 2 | (i & 0x3);
    caddr = l1_way;
    if (l1vars.ic[core][caddr].valid)
    {
      l2tmp_pa = l1vars.ic[core][caddr].l2_pa;
      if (hash_on)
	l2_ind_unhash = get_unhashed_index(l1vars.ic[core][caddr].l2_pa, l1vars.ic[core][caddr].l2_index);
      else
	l2_ind_unhash = l1vars.ic[core][caddr].l2_index;

      l2pa = l2tmp_pa << 18 | l2_ind_unhash << 9 | bank << 6 | bit_5 << 5;
      if (hash_on)
         io_printf("%0x\t%0x\t%0x\t\t%0x\t%0x\t\t%0x\t\t%0x\t%0x\t\t%0llx\n", i, core, l1_index, l1_way, l1vars.ic[core][caddr].l2_index, l2_ind_unhash, l1vars.ic[core][caddr].l2_way, l1vars.ic[core][caddr].l2_pa, l2pa);
      else
         io_printf("%0x\t%0x\t%0x\t\t%0x\t%0x\t\t%0x\t%0x\t\t%0llx\n", i, core, l1_index, l1_way, l1vars.ic[core][caddr].l2_index, l1vars.ic[core][caddr].l2_way, l1vars.ic[core][caddr].l2_pa, l2pa);
    }
  }
}

void dump_dc(int core, int bank, int panel, struct cache dc[])
{
  int i;
  long long l1pa, l1tmp_pa;
  int index;

  io_printf("\nL1D Core%0d, Bank%0d Panel %0d valid Data.\n", core, bank, panel);
  io_printf("INDEX\tWAY\tL1_Tag[39:11]\t\tL1_PA[39:0]\n");

  for (i = 0; i < 8; i++)
  {
    if (dc[i].valid)
    {
      index = dc[i].l1_index;
      l1tmp_pa = dc[i].l1_tag;
      l1pa = l1tmp_pa << 11 | index << 4;
      io_printf("%0x\t%0x\t%0x\t\t%0llx\n", index, (i & 0x3), dc[i].l1_tag, l1pa);
    }
  }
}

void dump_ic(int core, int bank, int panel, struct cache ic[])
{

  int i;
  long long l1pa, l1tmp_pa;
  int index;

  io_printf("\nL1I Core%0d, Bank%0d Panel%0d valid Data.\n", core, bank, panel);
  io_printf("INDEX\tWAY\tL1_Tag[39:11]\t\tL1_PA[39:0]\n");

  for (i = 0; i < 8; i++)
  {
    if (ic[i].valid)
    {
      index = ic[i].l1_index;
      l1tmp_pa = ic[i].l1_tag;
      l1pa = l1tmp_pa << 11 | index << 5;
      io_printf("%0x\t%0x\t%0x\t\t%0llx\n", index, (i & 0x7), ic[i].l1_tag, l1pa);
    }
  }
}
	
int get_unhashed_index(int l2_pa, int l2_ind)
{
	int unhashed_index = 0;
        unhashed_index  = ((((l2_pa >> 10 & 0x1f) ^ (l2_ind >> 4 & 0x1f)) << 4) | (((l2_pa & 0x3) ^ (l2_ind >> 2 & 0x3)) << 2) | (l2_ind & 0x3));
	return unhashed_index;
}

void sample_plusargs(void)
{
   int i = 0;
   char *gtrap;
   char *tok;

   for (i = 0; i < 8; i++) good_trap_addr[i] = 0;
   

	if (mc_scan_plusargs("gchkr_debug"))
		gchkr_debug = 1;
	else
		gchkr_debug = 0;
	
	if (mc_scan_plusargs("hash_on"))
		hash_on = 1;
	else
		hash_on = 0;
	i = 0;

	if ((gtrap = mc_scan_plusargs("good_trap=")) != NULL)
	{
	   //io_printf("good_trap = %s\n", gtrap);
	   if (strchr(gtrap, ':') == NULL)
	   {
		good_trap_addr[i] = strtoll(gtrap,NULL,16);
	        //io_printf("gtrap = %s, addr=%0llx\n", gtrap, good_trap_addr[i]);
	   }
	   else
	   {
	        tok = strtok(gtrap, ":");
        	good_trap_addr[i] = strtoll(tok,NULL,16);
	        //io_printf("tok = %s, addr=%0llx\n", tok, good_trap_addr[i]);
        	while ((tok = strtok(NULL, ":")) != NULL)
        	{
          	   i++;
          	   good_trap_addr[i] = strtoll(tok,NULL,16);
	           //io_printf("tok = %s, addr=%0llx\n", tok, good_trap_addr[i]);
                }
	    }
         }
	 if (gchkr_debug)
	 {
	    io_printf("gchkr_debug = %0d, hash_on = %0d\n", gchkr_debug, hash_on);
   	    for (i = 0; i < 8; i++)
		io_printf("good_trap_addr[%0d] = %0llx\n", i, good_trap_addr[i]);
         }
}
	
int is_reset_addr(long long l2pa)
{

   int match = 0;
   int i = 0;

   for (i = 0; i < 8; i++)
   {
      //io_printf("good_trap_addr[%0d] = %0llx,  l2pa = %0llx\n", i, good_trap_addr[i], l2pa);
      if (good_trap_addr[i] == l2pa)
	match = 1;
      //io_printf("good_trap_addr[%0d] = %0llx,  l2pa = %0llx, match = %0x\n", i, good_trap_addr[i], l2pa, match);
   }
   return match;
}

        
