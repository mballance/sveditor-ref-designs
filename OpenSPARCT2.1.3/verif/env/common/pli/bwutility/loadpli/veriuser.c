
#ifdef WIN32
# define Dll_Export __declspec(dllexport)
#else
# define Dll_Export
#endif


#include "veriuser.h"
#include "acc_user.h"

#ifndef accVersionLatest
#include "vxl_acc_user.h"
#include "vxl_veriuser.h"
#endif

#include "utility_funext.h"


Dll_Export char *veriuser_version_str = 
	"=== OpenSparc T2 utility loadpli ===\n";	


Dll_Export bool err_intercept(level,facility,code)
int level;
char *facility;
char *code;
{
return(true);
}

Dll_Export static s_tfcell utility_veriusertfs[] =
{
 /*** Template for an entry:
  *  { usertask|userfunction, data,
  *    checktf(), sizetf(), calltf(), misctff(),
  *    "$tfname", forwref?, Vtool?, ErrMsg? 
  *  },
  *  Example:
  *  { usertask, 0, my_check, 0, my_func, my_misctf, "$my_task" 
  *  },
  * ***/
	
# include "utility_fundef.c"
	  
/*** add user entries here ***/
	  
{0} /*** final entry must be 0 ***/

};
Dll_Export p_tfcell utility_pli_boot()
{
io_printf("*** Registering OpenSparc T2 utility system tasks...\n");
return utility_veriusertfs;
}

#ifdef MTI
# ifdef linux
# include <malloc.h>
# endif

Dll_Export void init_usertfs()
{
   p_tfcell usertf;

# ifdef linux
   mallopt(M_MMAP_MAX, (sizeof(void*) > 4) ? 4096*1024 : 65536);
# endif

   for (usertf = veriusertfs; usertf; usertf++){
      if (usertf->type == 0)
         return;
      mti_RegisterUserTF(usertf);
   }
}
#endif

Dll_Export int (*endofcompile_routines[])() = 
{
/*** my_eoc_routine, ***/
0 /*** final entry must be 0 ***/
};
