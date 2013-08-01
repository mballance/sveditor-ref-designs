// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: sam_internal.cpp
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
// OpenSPARC T2 Processor File: sam_internal.cpp
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
#include "loader.h"

void *g_vcpu;
extern "C" {
  // Complains if this is missing
  void __1cRUI_register_cmd_26Fpc0pFpvip0_ipF_i_v_() {}
};

// Trivial MMI APIs
mmi_bool_t   mmi_register_instance_creator (const char * _modname, mmi_instance_creator fn) {  
  fprintf(stderr, "Registering %s\n", _modname);
  module_info.create_instance = fn;
  return mmi_true;
}

mmi_instance_t mmi_get_instance(const char * instancename) {
  return (mmi_instance_t)(&module_info);
}

int mmi_argc(mmi_instance_t instance) {
  return module_info.argc;
}

char* mmi_argv(mmi_instance_t instance, int index) {
  return module_info.argv[index];
}

void mmi_register_start_stop(mmi_start_stop_cb start_action, mmi_start_stop_cb stop_action, void * userdata) {
}

mmi_bool_t mmi_register_dump_restore(const char *name, mmi_dump_cb dump_fn, mmi_restore_cb restore_fn, void *userdata) {
  return mmi_true;
}

mmi_instance_t   mmi_register_instance  (const char * modname, const char *instance_name, void * instance_data, const char * help) {
  module_info.cb_data = instance_data;  
  return (mmi_instance_t)(&module_info);
}

mmi_bool_t mmi_register_modinfo_cb (mmi_instance_t instance, mmi_modinfo_cb fn) {
  module_info.modinfo_cb = fn;
  return mmi_true;
}

mmi_bool_t mmi_register_interface_cb (mmi_instance_t instance, mmi_interface_cb fn) {
  module_info.interface_cb = fn;
  return mmi_true;
}

mmi_bool_t
mmi_register_config_cb (mmi_instance_t instance, mmi_config_cb fn)
{
   module_info.config_cb = fn;
  return mmi_true;
}

int netsim_snoop (char * buf, int len, int dbglvl) {
  return 1;
}

void mmi_register_instance_cmd(mmi_instance_t instance, const char * helpstring, mmi_instance_cmd_fn fn) {
  return;
}

// New
extern "C" bool SYSTEM_is_sync_on() {
  return false;
}

typedef enum {          
	TW_CURRENT,     
	TW_INTERVAL,    
	TW_MARK,        
	TW_LENGTH 	
} timewhence_t;

uint64_t SYSTEM_get_time (timewhence_t whence) {
  return 0;
}

void SYSTEM_register_event (
	uint64_t stime,			 /* microsecs, simulated time */
        void* callback, void * arg1, void * arg2,
	void* unloadfunc,
	const char * debugstring) {
  return;
}
