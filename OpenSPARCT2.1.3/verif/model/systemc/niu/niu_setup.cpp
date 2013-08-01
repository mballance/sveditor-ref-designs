// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: niu_setup.cpp
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
// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: niu_setup.cpp
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
#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>
#include <sys/types.h>
#include <signal.h>


#include <systemc.h>
#include <string.h>
#include <sys/types.h>
#include <sys/ipc.h>
#include <sys/shm.h>
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <thread.h>
#include <synch.h>
#include <pthread.h>
#include "niu_setup.h"

#include "loader.h"
#include "sharedmem.h"

extern sharedmem *shmem;

mmi_info_t module_info;
#define NUMARGS 1
#define DEBUGLVL 2
#define NIUBASE 0x8100000000ull


niu_setup::niu_setup(sc_module_name) {
  shmem = new sharedmem(getpid(), 1);

  const char *dv_root = getenv("DV_ROOT");
  char *dlpath = new char[strlen(dv_root) + 100];
  sprintf(dlpath, "%s/verif/model/systemc/niu/n2niu.so", dv_root);

  void *handle = dlopen(dlpath, RTLD_LAZY);

  if(handle == NULL) {
    char *dlerr = dlerror();
    fprintf(stderr,"dlopen failed\nError: %s\n", dlerr);
    exit(1);
  } else {
    init_instance(handle, "n2niu", "n2niu");
  }
}

void init_instance(void *handle, char *modname, char*instname) {
  if (module_info.create_instance == NULL) {
    fprintf(stderr,"failed to find module instance creator\n");
    exit(1);
  }
  parse_mod_args(modname, instname);
  module_info.create_instance(module_info.modname, module_info.instance_name);
  module_info.access_fn = (mmi_access)dlsym(handle,"niu_access");
  fprintf(stderr, "Done creating instance %s of %s\n", instname, modname);
}

// Setup all the module parameters 
void parse_mod_args(char *modname, char*instname) {
  module_info.modname = strdup(modname);
  module_info.instance_name = strdup(instname);
  module_info.argc = NUMARGS;
  module_info.argv = (char**)calloc(NUMARGS,sizeof(char*));
  module_info.argv[0] = strdup("-d2");
}


struct AccessData {
  uint64_t pa;
  uint64_t pl;
};


uint64_t swap64(uint64_t data) {
    return ((data & 0x00000000000000ffull) << 56) + ((data & 0x000000000000ff00ull) << 40) +
           ((data & 0x0000000000ff0000ull) << 24) + ((data & 0x00000000ff000000ull) << 8) +
           ((data & 0x000000ff00000000ull) >> 8) + ((data & 0x0000ff0000000000ull) >> 24) +
           ((data & 0x00ff000000000000ull) >> 40) + ((data & 0xff00000000000000ull) >> 56);
}

void parseUCBPacket(uint32_t *mem, uint32_t &req, uint64_t &pa, uint64_t &pl,
		    uint32_t &cpu,  uint32_t &thread,  uint32_t &buf,  uint32_t &size) {

  pl = (((unsigned long long int) mem[3]) << 32) + mem[2];
  pa = (((unsigned long long int)mem[1] & 0x7fffff) << 17)  + (mem[0] >> 15);

  pa &= 0x00000000ffffffffull;
  pa |= NIUBASE;
  printf("NIU Address: %016llx\n",pa);

  cpu = (mem[0] >> 7) & 0x7;
  thread = (mem[0] >> 4) & 0x7;
  buf = (mem[0] >> 10) & 0x3; 
  size = (mem[0] >> 12) & 0x7;
  req = mem[0] & 0xf;

  //printf("NCU REQ:%x Cpu:%x Thread:%x Buf:%x Size:%x PA:%llx Payload:%llx\n", req, cpu, thread, buf, size, pa, pl);
}


void* niu_write_access_thread (void *arg) {
  mmi_access niu_access = module_info.access_fn;
  void *modptr = module_info.cb_data;
  AccessData *adata = (AccessData *) arg;

  int res = niu_access(0, modptr, adata->pa , mmi_true, 8, &(adata->pl), 0); 
  
  return (void *) 0x0;
}




void ncu_interface(unsigned int mem[4]) {
  mmi_access niu_access = module_info.access_fn;
  void *modptr = module_info.cb_data;
  uint64_t  data;

  uint64_t pa, pl;
  uint32_t req, cpu, thread, buf, size;
  parseUCBPacket(mem, req, pa, pl, cpu, thread, buf, size);

  data = pl;

  int corrected = 0;
  if(req !=5) {
    if(pa == 0x8100182000ull)  {
      corrected = 1;
      data = swap64(0x0000000000002040ull);
    }
    if(pa == 0x8100182008ull)  {
      corrected = 1;
      data = swap64(0x0000000000000084ull);
    }
    if(pa == 0x8100188008ull)  {
      corrected = 1;
      data = swap64(0x0000000000000084ull);
    }
  }
  if(req == 5)
    printf("%lld NIU MODEL W: PA:%llx Data:%llx\n", sc_time_stamp().value(), pa, data); 
  else 
    printf("%lld NIU MODEL R: PA:%llx\n", sc_time_stamp().value(), pa);

  fflush(stdout);
  
  if(!corrected) {
    if(req == 5) {
      AccessData *adata = new AccessData;
      adata->pa = pa;
      adata->pl = data;
      thread_t tid;
      int ret = thr_create(NULL, NULL, niu_write_access_thread, adata, THR_DETACHED , &tid);
      if(ret != 0) {
	printf("NIU Write access thread creation failed!\n\n");
      }
     } else {
      int res = niu_access(0, modptr, pa,  mmi_false, 8, &data, 0); 
      if(res == 1) {
        printf("Error in niu_access function!: %d\n",res);
      }
    }
  }

  if(req == 4) {
    fprintf(stdout,"Read Data=0x%llx\n\n",data);
    mem[2] = data & 0xffffffff;
    mem[3] = (data >> 32) & 0xffffffff;
  }

}


