/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: monitor.c
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
#include <string.h>
#include <stdarg.h>

//#include "public_platform.h"
#include "veriuser.h"
#include "vcsuser.h"
#include "hasher.h"
//#include "saverestore.h"
#include "monitor.h"

#define MAXTAGS         50

#define NO_MON_TYPE       (0)
#define WARNING_MON_TYPE  (1)
#define ERROR_MON_TYPE    (2)
#define NORMAL_MON_TYPE   (3)
#define INFO_MON_TYPE     (4)
#define DEBUG_MON_TYPE    (5)
#define ALWAYS_MON_TYPE   (3)

int ch_dispmon(char *l_unit_name, int l_tag, int l_value);

typedef struct unit_info
{
  char *unit;
  unsigned int enable[MAXTAGS];
} UnitInfo;

typedef struct monitor_state {
  int global_errors;
  int global_warnings;
  int max_warnings;
  int max_errors;
  int external_finish;
  int finish_pending;
  int finish_type;
  int newLine; /* 1 if last char written was \n, 0 otherwise */
  HASH_TBL *unit_tbl;
  UnitInfo default_unit;
} monitor_state_t;

/* All monitor state is kept in this struct to simplify
   save and restore. The whole struct is saved at once.
   New state may be added to the struct without needing
   to modify the save/restore code.
*/
static monitor_state_t ms = {0,0,1,1,1,0,0,1,NULL,
			     /* default unit: */
			     {"default",
			      {1,0,0,0,0,0,0,0,0,0,
			       0,0,0,0,0,0,0,0,0,0,
			       0,0,0,0,0,0,0,0,0,0,
			       1,1,1,1,1,1,1,1,1,1,
			       1,1,1,1,1,1,1,1,1,1}}
			     /* end default unit */
};

static const char *modulename = "monitor.c";
static const char *has_nfld="bBoOdDhHsxX";
static const char *no_nparam="%mt";

/* Tag values are defined as follows:
* 1-19 default Disabled, displays:  <time>: DBG: <unit>[module]: formatted_data 
* 20-29 default disabled, displays: <time>:INFO: <unit>[module]: formatted_data 
* 31-47 default Enabled, displays:  <time>: <unit>[<module>]: formatted_data
* 48 default enabled,displays: <time>: WARNING: <unit>[<module>]:formatted_data 
* 49 default enabled, displays: <time>: ERROR: <unit>[<module>]: formatted_data 
* this is now essentially hardwired 
* (It used to be configurable by unit but we've eliminated the syntax
   which does that) 
*/



/*----------------------------------------------------------------------------
* static int
* UnitInfo_cmp(const void *p_a, const void *p_b)
* comparison function for UnitInfo, qsort friendly
*
* Return Value --
* -1 if a<b, 0 if a==b, 1 if a>b
*
* Design --
* compares UnitInfo based solely on the unit name
*
* Side effects --
* No side effects
*----------------------------------------------------------------------------
*/
static int 
UnitInfo_cmp(const void *p_a, const void *p_b)
{
  const UnitInfo *l_ua=(const UnitInfo *)p_a;
  const UnitInfo *l_ub=(const UnitInfo *)p_b;

  return strcmp(l_ua->unit, l_ub->unit);
}

/* int monitor_SAVE_RESTORE(int user_data, int reason)
 *
 * This is called during a save or a restore; it causes the monitor
 * to save itself or restore itself. Arguments and return value
 * match those of a misctf call, though this is not called from
 * the simulator, but from saverestore.c
 */

/* 
 * N2 - Not using this right now. Need saverestore from
 *  vobs/valid-east/simulator/saverestore/ to make this work ..
*/

// int monitor_SAVE_RESTORE(int user_data, int reason) {
//   UnitInfo **unit_list;
//   int num_units;
// 
//   if(reason==reason_save)
//   {
//     /* save top level monitor_state_t struct */
//     PLI_SAVE("monitor", &ms, sizeof(ms));
// 
//     /* obtain a list of unitInfos from the hash table */
//     unit_list = ht_sorted_list(ms.unit_tbl, UnitInfo_cmp);
// 
//     /* find and store the length of the list */
//     for(num_units=0; unit_list[num_units]!=NULL; num_units++)
//     { }    
//     PLI_SAVE("monitor", &num_units, sizeof(num_units));
// 
//     /* store each unitInfo */
//     while(num_units > 0)
//     {
//       int len;
// 
//       num_units--;
// 
//       /* save each unitInfo's struct */
//       PLI_SAVE("monitor", unit_list[num_units], sizeof(UnitInfo) );
// 
//       /* save the unit name */
//       len = strlen(unit_list[num_units]->unit) + 1;
//       PLI_SAVE("monitor", &len, sizeof(len));
//       PLI_SAVE("monitor", unit_list[num_units]->unit, sizeof(char) * len);
//     }
// 
//     free(unit_list);
//   }
//   else if(reason==reason_restart)
//   {
//     /* restore top level monitor_state_t struct */
//     PLI_RESTORE("monitor", &ms, sizeof(ms));
//     
//     /* allocate a hash table */
//     ms.unit_tbl = ht_new(256);
// 
//     /* restore the number of unit_infos */
//     PLI_RESTORE("monitor", &num_units, sizeof(num_units));
// 
//     while(num_units > 0)
//     {
//       int len;
//       UnitInfo *unit = malloc(sizeof(UnitInfo));
//       num_units--;
// 
//       /* restore the unitInfo's struct */
//       PLI_RESTORE("monitor", unit, sizeof(UnitInfo));
// 
//       /* restore the unit name */
//       PLI_RESTORE("monitor", &len, sizeof(len));
//       unit->unit = malloc(sizeof(char) * len);
//       PLI_RESTORE("monitor", unit->unit, sizeof(char) * len);
// 
//       /* put it in the hash table */
//       ht_put(ms.unit_tbl, unit->unit, unit);
//     }
//   }
// 
//   return 0; /* not meaningful */
// }




/*----------------------------------------------------------------------------
* static UnitInfo *
* UnitInfo_new(const char *p_unitname)
* Constructor for UnitInfo, which tracks which tags are enabled
*
* Return Value --
* A UnitInfo structure
*
* Design --
* It tries to allocate some memory and copies the default info into it
*
* Side effects --
* No side effects
*----------------------------------------------------------------------------
*/
static UnitInfo *
UnitInfo_new(const char *p_unitname)
{
  UnitInfo *l_r=(UnitInfo*)malloc(sizeof *l_r);
  if(!l_r)
  {
    printf("ERROR(%s):No memory to allocate unit info",modulename);
    exit(1);
  }
  l_r->unit=strdup(p_unitname);
  memmove(l_r->enable, ms.default_unit.enable, sizeof l_r->enable);
  return l_r;
}

/*----------------------------------------------------------------------------
 * void scan_n_chdispmon
 *
 * Takes a string of the form 
 *          +mon+<unit>=<level>=<value>(,<unit>=<level>=<value>)*
 * and does ch_dispmon for all spcified units ..
 *
 *----------------------------------------------------------------------------
*/
static void scan_n_chdispmon (char *str) {

  int level, value;
  char *argseq, unit [36];

    argseq = strtok(str, ",");
    while (argseq != NULL) {
        if (3 == sscanf(argseq, "%[a-z_0-9]=%d=%d", unit, &level, &value)) {
            ch_dispmon(unit, level, value);
        } else {
            cDispmon ("disp", MON_WARN, "Format incorrect in monitor spec \"%s\" - ignored", 
                    argseq);
        }
        argseq = strtok(NULL, ",");
    }
}

/*----------------------------------------------------------------------------
 * int parse_ch_dispmon 
 * 
 * Entry point for $parse_ch_dispmon
 *----------------------------------------------------------------------------
*/

int parse_ch_dispmon(void)
{
  if (tf_nump() != 1) {
    printf("ERROR(parse_ch_dispmon): Usage: "
	   "$parse_ch_dispmon(\"<unit>=<level>=<0/1>(,<unit>=<level>=<0/1>)*\"\n");
  } else {
    char *l_string=tf_getcstringp(1);
    scan_n_chdispmon(l_string);
  }
    return 0;
}
 
/*----------------------------------------------------------------------------
* static void
* parse_dispmon_plusargs()
* parse command line plus args for dispmon, +maxerror, +maxwarning
* +debug_all +mon+<name>+<level>
*
* Return Value --
* none
*
* Design --
* looks at plusargs, sets variable values
*
* Side effects --
* sets max_errors and max_warnings and updates hash tables
*----------------------------------------------------------------------------
*/
static void 
parse_dispmon_plusargs()
{
  char *l_cp;
  char *m_cp;
  int  n;

  // Max err/warn check
  if (!((l_cp=mc_scan_plusargs("maxerror=")) || 
	(l_cp=mc_scan_plusargs("maxerror"))) ||
      !(ms.max_errors=strtoul(l_cp, 0,10)))
  {
    cDispmon("disp", MON_NORMAL, "Can't find valid +maxerror arg, setting to 1");
    ms.max_errors = 1;
  }
    
  if (!((l_cp=mc_scan_plusargs("maxwarning=")) || 
	(l_cp=mc_scan_plusargs("maxwarning"))) ||
      !(ms.max_warnings=strtoul(l_cp, 0,10)))
  {
    cDispmon("disp", MON_NORMAL, "Can't find valid +maxwarning arg, setting to 5");
    ms.max_warnings = 5;
  }

  // Debug mode for all
  if (mc_scan_plusargs("debug_all")) {
    cDispmon("disp", MON_NORMAL, "Detected global debug mode request. Setting all units");
    ch_dispmon("all", MON_DEBUG, 1);
  }

  // Info mode for all
  if (mc_scan_plusargs("info_all")) {
    cDispmon("disp", MON_NORMAL, "Detected global info mode request. Setting all units");
    ch_dispmon("all", MON_INFO, 1);
  }

  // Parse generic options of the form
  // +mon+<unit>=<level>=<value>(,<unit>=<level>=<value>)*
  l_cp = mc_scan_plusargs("mon+");
  if (!(l_cp == NULL)) {
    n = strlen(l_cp);
    m_cp = (char*)malloc(sizeof(char) * n);
    strcpy(m_cp,l_cp);
    cDispmon ("disp", MON_NORMAL, "Scanned Monitors specification: %s", m_cp); 
    scan_n_chdispmon(m_cp);
  }

  // Quiet mode - overrides all 
  if (mc_scan_plusargs("quiet") && !mc_scan_plusargs("noquiet")) {
    cDispmon("disp", MON_NORMAL, "Detected global quiet mode request.");
    ch_dispmon("all", MON_ERR, 1);
    ch_dispmon("all", MON_NORMAL, 0);
  }

}

/*----------------------------------------------------------------------------
* static void
* init_unit_tbl()
* initializes the hash table used to hold units
*
* Return Value --
* none
*
* Design --
* calls the hash package to get a hash table, puts in default unit
* calls parse_dispmon_plusargs
*
* Side effects --
* sets unit_tbl
*----------------------------------------------------------------------------
*/
static void 
init_unit_tbl()
{
  ms.unit_tbl=ht_new(256);
  ht_put(ms.unit_tbl, "default", &ms.default_unit);
  parse_dispmon_plusargs();
}

/*----------------------------------------------------------------------------
* static int 
* tag2mon_type(int p_tag)
* give a tag, return a tag type
*
* Return Value --
* tag type
*
* Design --
* Figures out tag type based on tag number
*
* Side effects --
* none
*----------------------------------------------------------------------------
*/
static int 
tag2mon_type(int p_tag)
{
  return ((p_tag >=  MON_NORMAL && p_tag<=MON_WARN)) ? NORMAL_MON_TYPE :
          (p_tag ==  MON_ALWAYS)                     ? ALWAYS_MON_TYPE :
          (p_tag <  MON_INFO)                        ? DEBUG_MON_TYPE :
          (p_tag <  MON_NORMAL)                      ? INFO_MON_TYPE :
          (p_tag == MON_WARN)                        ? WARNING_MON_TYPE :
          (p_tag == MON_ERR)                         ? ERROR_MON_TYPE :
                                                       NO_MON_TYPE;
}

/*----------------------------------------------------------------------------
* static void 
* smart_write_tagged_output(char *p_tag_string, char *p_message, 
*                           int p_add_newline)
* prints out tag_string if the global newLine variable is set,
* then replaces any \n$text in message with \n$tag_string$text
*
* Return Value --
* none
*
* Design --
* prints everything up to the newline, if there is a newline,
* prints the tag_string, repeat. Then print what's left
*
* Side effects --
* sets newLine if last char printed is a newline
* modifies p_message
*----------------------------------------------------------------------------
*/
static void 
smart_write_tagged_output(char *p_tag_string, char *p_message, 
			  int p_add_newline)
{
  char *l_pos;
  char *l_next;
  size_t l_buflen=strlen(p_message);
  l_pos = p_message;
  while ((l_next=strchr(l_pos,'\n'))!=0)
  {
    *l_next=0;
    if (ms.newLine)
      printf("%s", p_tag_string);
    printf("%s\n",l_pos);
    l_pos=l_next+1;
    ms.newLine=1;
    fflush(stdout);
  }

  // if l_buflen was zero, there was no newline and the while loop 
  // above didn't print anything out
  if((l_pos < l_buflen+p_message) || (l_buflen == 0))
  {
    if (ms.newLine)
      printf("%s", p_tag_string);
    printf("%s",l_pos);
    ms.newLine=0;
    fflush(stdout);
  }

  if(p_add_newline!=0)
  {
    puts("");
    ms.newLine=1;
    fflush(stdout);
  }
}

/*----------------------------------------------------------------------------
* int
* warningCheck()
* checks to see if we've reached max_warnings
*
* Return Value --
* 1 on warning kill, 0 otherwise
*
* Design --
* inhibit printing warnings and errors if we've reached max_warnings
* either by dying or turning them off
*
* Side effects --
* possible death, modifies finish_pending and finish_type
*----------------------------------------------------------------------------
*/
static int 
warningCheck()
{   
  int l_r=0;

  if (ms.global_warnings >= ms.max_warnings)
  {
    if(ms.external_finish!=0)
    {
      if(ms.finish_pending==0)
      {
	UnitInfo **l_ul=(UnitInfo **)ht_sorted_list(ms.unit_tbl, UnitInfo_cmp);
	UnitInfo **l_uit=0;
	//printf("Setting finish pending for verilog, and warn_stop as type.\n");
	ms.finish_pending = 1;
	ms.finish_type = 2;
	for(l_uit=l_ul; *l_uit; l_uit++)
	{
	  (*l_uit)->enable[MON_WARN]=0;
	  (*l_uit)->enable[MON_ERR]=0;
	}
	l_r=1;
	free(l_ul);
      }
    } else
    {
      printf("\nINFO(%s): MAX WARNINGS REACHED - SIMULATION TERMINATED\n",
	     modulename);
      printf("INFO(%s): TIME %s, ABNORMAL END--"
	     "MONITOR CAUSED END OF SIMULATION\n", modulename, tf_strgettime());
      printf("Ending simulation \nSIM_ERR_STATUS:2 \n");
      tf_dofinish();
    }
  }
  return l_r;
}
 
/*----------------------------------------------------------------------------
* int
* errorCheck()
* checks to see if we've reached max_errors
*
* Return Value --
* 1 on error kill, 0 otherwise
*
* Design --
* inhibit printing warnings and errors if we've reached max_errors
* either by dying or turning them off
*
* Side effects --
* possible death, modifies finish_pending and finish_type
*----------------------------------------------------------------------------
*/
static int 
errorCheck()
{
  int l_r=0;
  if (ms.global_errors >= ms.max_errors)
  {
    if(ms.external_finish!=0)
    {
      if (ms.finish_pending==0)
      {
	UnitInfo **l_ul=(UnitInfo **)ht_sorted_list(ms.unit_tbl, UnitInfo_cmp);
	UnitInfo **l_uit=0;
	//printf("Setting finish pending for verilog, and warn_stop as type.\n");
	ms.finish_pending = 1;
	ms.finish_type = 1;
	/* termination pending due to max error */
	/* disable further warn/errors till external */
	/* verilog shuts down simulator. */
	for(l_uit=l_ul; *l_uit; l_uit++)
	{
	  (*l_uit)->enable[MON_WARN]=0;
	  (*l_uit)->enable[MON_ERR]=0;
	}
	l_r=1;
	free(l_ul);
      }
    } else
    {
      printf("\nINFO(%s): MAX ERRORS REACHED - SIMULATION TERMINATED\n", 
	     modulename);
      printf("INFO(%s): TIME %s, ABNORMAL END--"
	     "MONITOR CAUSED END OF SIMULATION\n", modulename, tf_strgettime());
      printf("Ending simulation \nSIM_ERR_STATUS:1 \n");
      tf_dofinish();
    }
  }
  return l_r;
}

typedef struct rstr
{
  char *str;
  size_t sz;
} RStr;

/*----------------------------------------------------------------------------
* static RStr *
* RStr_new(size_t p_init_sz)
* "constructor" for a resizeable string
*
* Return Value --
* ptr to a resizeable string
*
* Design --
* return a pointer and the amount of memory associated with it
*
* Side effects --
* none
*----------------------------------------------------------------------------
*/

static RStr *
RStr_new(size_t p_init_sz)
{
  RStr *l_r=(RStr*)malloc(sizeof *l_r);

  if(!l_r)
  {
    printf("ERROR(%s):Not enough memory to make resizeable string\n",
	   modulename);
    exit(1);
  }
  
  l_r->str= p_init_sz ? (char*)malloc(p_init_sz) : 0;
  if(l_r->str) {
    l_r->sz = p_init_sz;
    l_r->str[0] = '\0';
  } else
    l_r->sz = 0;

  return l_r;
}

/*----------------------------------------------------------------------------
* static void
* RStr_delete(RStr *p_r)
* "constructor" for a resizeable string
*
* Return Value --
* none
*
* Design --
* free memory
*
* Side effects --
* none
*----------------------------------------------------------------------------
*/

static void 
RStr_delete(RStr *p_r)
{
  if(p_r->str) {
    free(p_r->str);
    p_r->str = NULL;
  }
  free(p_r);
}

/*----------------------------------------------------------------------------
* static RStr *
* expanding_strcat(RStr *p_r, char *p_s)
* concat str in p_r with p_s
*
* Return Value --
* the RStr * you passed in
*
* Design --
* realloc more memory if necessary, strcat
*
* Side effects --
* possible death
*----------------------------------------------------------------------------
*/

static RStr *
expanding_strcat(RStr *p_r, const char *p_s)
{
  size_t l_sl=strlen(p_s);
  size_t l_rl=strlen(p_r->str);

  if(l_rl+l_sl>=p_r->sz && 0==(p_r->str=(char*)realloc(p_r->str,l_rl+l_sl+100)))
  {
    printf("ERROR(%s): can't expand string\n", modulename);
    tf_dofinish();
  }

  strcat(p_r->str,p_s);
  return p_r;
}

#if 0   /* b/c this is unused, which would make lint complain */
static RStr *
expanding_strncat(RStr *p_r, const char *p_s, size_t n)
{
  size_t l_sl=strlen(p_s);
  size_t l_rl=strlen(p_r->str);
  if (l_sl > n)
    l_sl = n;

  if(((l_rl + l_sl) >= p_r->sz) &&
     ((p_r->str = realloc(p_r->str, l_rl + l_sl + 100)) == NULL))
  {
    printf("ERROR(%s): can't expand string\n", modulename);
    tf_dofinish();
  }

  strncat(p_r->str, p_s, n);
  return p_r;
}
#endif

/* failed means we tried to parse the format spec and failed */
typedef struct fmt_info
{
  char cvt_spec;
  unsigned int strip:1,lalign:1,failed:1;
  unsigned long long width;
  char *text;
} FmtInfo;

/* yes, this is more or less identical to the RStr stuff.  A future
   implementation should think about uniting them if possible.  The obvious
   ways are not typesafe. */

typedef struct fmt_array
{
  FmtInfo **f;
  size_t used;
  size_t sz;
} FmtArray;

static FmtArray *FmtArray_new(size_t init_sz)
{
  FmtArray *r=(FmtArray*)malloc(sizeof *r);

  if(!r)
  {
    printf("ERROR(%s):Not enough memory to parse format string\n",
	   modulename);
    tf_dofinish();
  }
  
  r->f= init_sz ? (FmtInfo**)malloc(init_sz*sizeof(FmtInfo *)) : 0;
  r->sz = r->f ? init_sz : 0;
  r->used=0;

  return r;
}

/* user creates new text which must be freeable! or null */
static FmtInfo *FmtInfo_new(char cvt_spec,int strip,int lalign, 
			    unsigned long long width,int failed,char *text)
{
  FmtInfo *f=(FmtInfo*)malloc(sizeof *f);
  if(!f)
  {
    printf("ERROR(monitor.c):Can't generate new FmtInfo\n");
    tf_dofinish();
  }
  f->cvt_spec=cvt_spec;
  f->strip=strip;
  f->lalign=lalign;
  f->width=width;
  f->failed=failed;
  f->text=text;
  return f;
}

static void FmtInfo_delete(FmtInfo *fi)
{
  if(fi->text)
  {
    free(fi->text);
    fi->text = NULL;
  }
  free(fi);
}

static void FmtArray_delete(FmtArray *r)
{
  size_t i;
  for(i=0;i<r->used; i++)
  {
    FmtInfo_delete(r->f[i]);
    r->f[i] = NULL;
  }

  if(r->f)
  {
    free(r->f);
    r->f = NULL;
  }
  free(r);
}

static FmtArray *FmtArray_add(FmtArray *f, FmtInfo *fmt)
{
  if(f->used==f->sz)
  {
    f->sz+=10;
    if(!(f->f=(FmtInfo**)realloc(f->f,f->sz*sizeof *(f->f))))
    {
      printf("ERROR(%s):Not enough memory to expand FmtArray\n",modulename);
      tf_dofinish();
    }
  }
  f->f[f->used++]=fmt;
  return f;
}

static char *substring(const char *s, const char *e)
{
  size_t textlen; /* =e ? e-s : strlen(s); */
  char *text;

  if(e)
  {
    if(e > s)
    {
      /* Casts get around lint error involving substracting 
	 one ptr from another. Lint doesn't seem to like that,
	 even though we just checked that e > s. */
      textlen = (unsigned )e-(unsigned )s;
    }
    else
    {
      printf("ERROR: Assertion failed, in fn 'substring()', "
	     "in monitor.c\n");
      tf_dofinish();
    }
  }
  else
  {
    textlen = strlen(s);
  }

  text=(char*)malloc(textlen+1);
  if(textlen)
  {
    if(text==NULL)
    {
      printf("ERROR(%s):Not enough memory to copy substring\n",modulename);
      tf_dofinish();
    }
    /* strlcpy(text,s,textlen+1); NO STRLCPY ! BAD ON SOLARIS 7 ! */
    strncpy(text, s, textlen); text[textlen] = 0;
  }
  return text;
}

#if 0 /* b/c this is unused, which would make lint complain */
static FmtArray *add_nfmtstring(FmtArray *f, const char *s,const char *e)
{
  return f;
}
#endif

/* parses and adds format string to FmtArray, increments ptr to end of fmt 
   string.  Being able to return multiple values would have been nice */
/* adds string if we can't figure out what we've parsed */

static FmtArray *add_fmt(FmtArray *f, const char *fmt, const char **end_pos)
{
  int lalign=0, strip=0, failed=0;
  unsigned long long width=0;
  const char *pos=fmt;

  if(!fmt) return f;

  if(*pos=='%') pos++;

  /* check for cvt_spec with no options */
  if (strchr(no_nparam,*pos))
  {
    if(end_pos) *end_pos=pos+1;
    return FmtArray_add(f,FmtInfo_new(*pos,0,0,0,0,0));
  }

  /* check for flags */
  /* in a reverse from printf style, %0x *removes* zeros, not pads them */
  for(;*pos&& (*pos=='-' || *pos=='0');pos++)
  {
    if(!lalign) lalign=*pos=='-';
    if(!strip) strip=*pos=='0';
  }

  width=strtoull(pos,(char **)&pos,10);
  failed=!strchr(has_nfld, *pos) || !*pos;
  
  if(end_pos) *end_pos=pos+1;
  return FmtArray_add(f,FmtInfo_new(*pos,strip,lalign,width,failed,
				    failed ? substring(fmt,pos+1) : 0));
}

/* takes format string, returns resizeable array with info about broken up
   pieces of the format string */
static FmtArray* parse_fmt(const char *fmt)
{
  FmtArray *f=FmtArray_new(10);

  const char *i,*k;

  for(i=fmt; i && *i; i=k)
  {
    k=strchr(i,'%');
    if(k!=i)
      f=FmtArray_add(f,FmtInfo_new(0,0,0,0,0,substring(i,k)));
    if(k)
      f=add_fmt(f,k,&k);
  }
  return f;
}

static char *format_val(FmtInfo *fi, char *val)
{
  char *ftext;
  size_t len,width;

  if(fi->strip && val && *val)
    while((*val=='0' || *val==' ') && val[1])
      val++;
  len=strlen(val);
  width=len > fi->width ? len+1 : fi->width+1;
  ftext=(char*)malloc(width);
  if(ftext==NULL)
  {
    printf("ERROR(%s):Can't get memory to form output!\n",modulename);
    tf_dofinish();
  }
  if(fi->lalign)
  {
    strcpy(ftext,val);
    memset(ftext+len, ' ',width-len-1);
  } else
  {
    strcpy(ftext+width-len-1,val);
    memset(ftext, ' ', width-len-1);
  }
  ftext[width-1]=0;

  return ftext;
}

static int insert_var(RStr *output, FmtInfo *fi, int pn)
{
  switch(fi->cvt_spec)
  {
   case 'm':
    expanding_strcat(output,tf_mipname()); /* calling module */
    break;
   case 't':
    expanding_strcat(output,tf_strgettime()); /* current simulator time */
    break;
   case '%':
    expanding_strcat(output,"%"); /* percent sign */
    break;
   default:
    /* don't need this check if checktf errors */
    if(strchr(has_nfld,fi->cvt_spec))
    {
      char *text;
      /* translate x's to h's for hex; NC segfaults if you don't */
      if(fi->cvt_spec=='x')
	fi->cvt_spec='h';
      if(fi->cvt_spec=='X')
	fi->cvt_spec='H';
      text= format_val(fi,
		       fi->cvt_spec=='s' ? tf_getcstringp(pn) :
		       tf_strgetp(pn,fi->cvt_spec));
      expanding_strcat(output,text);
      free(text);
      pn++;
    }
  }
  return pn;
}

/* might as well make this public since the assertion stuff seemed be 
   using it anyways */
char *dispmon_parse(const char *fmt, int nump, int start, 
		    const char *unit)
{
  FmtArray *f=parse_fmt(fmt);
  size_t i=0, pno=start;
  RStr *output=RStr_new(256);
  char *s;

  for(i=0; i<f->used && output; i++)
  {
    if(f->f[i]->text)
      expanding_strcat(output,f->f[i]->text);
    else
    {
      /* should not need this check if checktf errors */
      if(pno>nump)
      {
	//cDispmon(modulename, MON_ERR,
        //      "insufficient parameters for format string \"%s\" in "
	//      "$dispmon/$writemon", fmt);
	RStr_delete(output);
	output = NULL;
      } else
	pno=insert_var(output,f->f[i],pno);
    }
  }
  FmtArray_delete(f);
  s = output ? output->str : 0;
  free(output);
  return s;
}

/*----------------------------------------------------------------------------
* static int
* mon_type_for(char *p_unit, int p_tag)
* look up monitor type
*
* Return Value --
* returns the monitor type to use for display
*
* Design --
* Gets unit from hash table, do array look up
* defaults to how ever the enables are set for "default"
* Side effects --
* none
*----------------------------------------------------------------------------
*/
static int 
mon_type_for(const char *p_unit, int p_tag)
{
  UnitInfo *l_ui=(UnitInfo*)ht_get(ms.unit_tbl, p_unit);

  if(0==l_ui)
    l_ui=(UnitInfo*)ht_get(ms.unit_tbl, "default");

  if(0==l_ui)
  {
    printf("ERROR(%s):Unit hash not set up right!\n", modulename);
    tf_dofinish();
  }

  return l_ui->enable[p_tag] ? tag2mon_type(p_tag) : NO_MON_TYPE;
}

/*----------------------------------------------------------------------------
* static void
* print_tagged_line(char *p_prefix, char *p_unit, char *p_output, 
*                   int p_mon_type, int p_add_newline)
* print out the line with timestamp and unit responsible
*
* Return Value --
* none
*
* Design --
* Get timestamp. Go through way too much effort to come up with a module name 
* put it together to get a tag, call smart_write_tagged_output
* Side effects --
* possible death since it calls warningCheck() and errorCheck()
* may modify global_errors or global_warnings
*----------------------------------------------------------------------------
*/
static void 
print_tagged_line(const char *p_prefix, const char *p_unit, char *p_output, 
		  int p_mon_type, int p_add_newline)
{
  char *l_instance=tf_mipname();
  char *l_pt1=0;
  char *l_modname=0;
  char *l_tag_gen[]={"%s%s%s%s", "%s: WARNING: %s[%s%s]: ",
		     "%s: ERROR: %s[%s%s]: ", "%s: %s[%s%s]: ", 
             "%s: INFO: %s[%s%s]: ", "%s: DBG: %s[%s%s]: "};
  
  /* If l_instance == NULL, then we may be in a callback */
  if (l_instance == NULL)
  {
    l_instance = "pli callback";
  }

  /* get the module instance name. */
  /* Generally, ch_sys.cheetah_mod.cpu..... */
  /* Display as: (<mod>...<end_path_name>) */
  if (0==(l_pt1 = strchr(l_instance, '.')))
  {
    /* No module */
    l_modname=strdup(l_instance);
  } 
  else
  {
    /* we just want the full instance name from the mod level down. */
    /* that's what we print out, always!  If that's too long and your */
    /* printouts end up hard to read, tough! Post process. */
    l_modname=strdup(l_pt1+1);
  }
  
  if(0!=l_modname)
  {
    char *l_tagbuffer=0;
    /* lacking a predictable snprintf or asprintf, we guess at how large
       tagbuffer needs to be */
    if(0==(l_tagbuffer=(char*)malloc(strlen(l_tag_gen[p_mon_type])+strlen(p_unit)+
			      strlen(p_prefix)+strlen(l_modname)+20)))
    {
      printf("ERROR(%s): Can not generate tag for output\n",modulename);
      tf_dofinish();
    }
    sprintf(l_tagbuffer, l_tag_gen[p_mon_type], tf_strgettime(), p_unit, 
	    p_prefix, l_modname);
    if(WARNING_MON_TYPE==p_mon_type)
      ms.global_warnings++;
    if(ERROR_MON_TYPE==p_mon_type)
    {
      ms.global_errors++;
      /* if we do a dispmon (not writemon!) with an error monitor type. 
	 Force the start of a new line. */
      if(p_add_newline && 0==ms.newLine)
      {
	puts("");
	ms.newLine=1;
      }
    }
    smart_write_tagged_output(l_tagbuffer, p_output, p_add_newline);
    free(l_modname);
    free(l_tagbuffer);
    warningCheck();
    errorCheck();
  }
}
     
/*----------------------------------------------------------------------------
* static void
* do_mon(int p_add_newline)
* error check Verilog side arguments, generate then print line
*
* Return Value --
* none
*
* Design --
* 
* Side effects --1H
* possible death, modifies global_errors
*----------------------------------------------------------------------------
*/
static int
do_mon(int p_add_newline)
{
  char *unit_name_arg = tf_getcstringp(1);
  char *l_unit;
  int l_tag = tf_getp(2);
  int l_mon_type;

  if(!unit_name_arg)
  {
    char *mipname = tf_mipname();
    printf("ERROR: failed to read first argument to $dispmon or "
	   "$writemon, in 'do_mon()'. Hierarchy is '%s'\n",
	   mipname ? mipname : "NULL");
    return 0;
  }
  else
  {
    l_unit = strdup(unit_name_arg);
    if(!l_unit)
    {
      printf("ERROR: strdup failed in 'do_mon()'\n");
      return 0;
    }
  }

  if(!ms.unit_tbl)
    init_unit_tbl();

  l_mon_type=mon_type_for(l_unit, l_tag);
  
  if(l_mon_type!=NO_MON_TYPE)
  {
    int l_input_parms = tf_nump();   
    char *l_output=dispmon_parse(tf_getcstringp(3), l_input_parms, 4, 
				 l_unit);
    if (0!=l_output)
    {
      print_tagged_line("", l_unit, l_output, l_mon_type, p_add_newline);
      free(l_output);
    }
  }
  free(l_unit);
  return 0;
}

int
do_dispmon_mon(void)
{
    return(do_mon(1));
}

int
do_writemon_mon(void)
{
    return(do_mon(0));
}

size_t monitor_nfmtargs(char *fmt)
{
  /* validate # of parameters and correct tokens by parsing format */
  FmtArray *f=parse_fmt(fmt);
  size_t i=0,nargs=0;

  for(i=0; i<f->used; i++)
  {
    if(!f->f[i]->text && !strchr(no_nparam, f->f[i]->cvt_spec))
      nargs++;
    
    if(f->f[i]->failed)
      cDispmon("disp", MON_ERR, "invalid format spec: \"%s\" in "
	       "format string \"%s\"\nin instance %s",
	       f->f[i]->text, tf_getcstringp(3),tf_mipname());
  }
  FmtArray_delete(f);
  return nargs;
}

int monitor_checktf(void)
{
  int nump=tf_nump();
  if (nump < 3)
  {
    cDispmon("disp", MON_ERR, "Usage: $dispmon(\"unit\", tag, "
           "\"printf-style-format\", modulename, reg-or-int, "
	   "reg-or-int);\nin instance %s", tf_mipname());
  } else if (tf_typep(1) != tf_string)
  {
    cDispmon("disp", MON_ERR,"dispmon unit name is not a string\n"
	     "in instance %s",tf_mipname());
  } else if (tf_typep(3) != tf_string)
  {
    cDispmon("disp", MON_ERR, "dispmon format field is not a string\n"
	     "in instance %s", tf_mipname());
  } else
  {
    size_t nargs=monitor_nfmtargs(tf_getcstringp(3));
    if(nargs+3!=nump)
    {
      cDispmon("disp",MON_ERR, 
	       "wrong number of parameters for format string \"%s\"\n"
	       "in instance %s", tf_getcstringp(3), tf_mipname());
    }
  }
  return 0;
}

/*----------------------------------------------------------------------------
* int
* check_num_dispmon_errors()
* entry point for $check_num_dispmon_errors
*
* Return Value --
* always 0
*
* Design --
* 
* Side effects --
* none
*----------------------------------------------------------------------------
*/
int 
check_num_dispmon_errors()
{
  tf_putp(1, ms.global_errors);
  return 0;
}

/*----------------------------------------------------------------------------
* int
* enable_dispmon_finish()
* entry point for $enable_dispmon_finish
*
* Return Value --
* always 0
*
* Design --
* parameter to syscall is 1=let dispmon finish
* 0=let external prog finish
* This is exactly the opposite of what we're tracking
* Side effects --
* none
*----------------------------------------------------------------------------
*/
int 
enable_dispmon_finish()
{
  ms.external_finish=tf_getp(1);
  ms.external_finish=!ms.external_finish;
  return 0;
}

/*----------------------------------------------------------------------------
* int
* check_mon()
* entry point for $check_mon
*
* Return Value --
* always 0
*
* Design --
* syscall return is whether we should finish
* first param of syscall returns why
* Side effects --
* none
*----------------------------------------------------------------------------
*/
int 
check_mon()
{
  tf_putp(2, ms.finish_pending);
  tf_putp(1, ms.finish_type);
  return 0;
}

/*----------------------------------------------------------------------------
* int
* do_ch_dispmon()
* entry point for $ch_dispmon
*
* int
* ch_dispmon()
* Return Value --
* always 0
*
* Design --
* Error check V-side arguments, modify hash table entries
* - Set all tags >= l_tag on/off
* - Set default if "all" is specified so later initialized units may
* use the 'all' setting too.
* 
* Side effects --
* modifies hash table entries and default ms entries ..
*----------------------------------------------------------------------------
*/
int
do_ch_dispmon(void)
{
  if (tf_nump() < 3) {
    printf("ERROR(ch_dispmon): Usage: "
	   "$ch_dispmon(unit, tag, value(1 = on, 0 = off))\n");
  } else {
    char *l_unit_name=tf_getcstringp(1);
    int l_tag= tf_getp(2);
    int l_value=tf_getp(3);
    return(ch_dispmon(l_unit_name, l_tag, l_value));
  }
return 0;
}

int 
ch_dispmon(char *l_unit_name, int l_tag, int l_value)
{
  int i;

  if (l_tag < 1 || l_tag > 49) {
      printf("ERROR(ch_dispmon): tag should be between 1 and 49\n");
  } else if (l_value < 0 || l_value > 1) {
      printf("ERROR(ch_dispmon): Use 0 to turn off the tag display or "
	     "1 to turn it on (%0d)\n", l_value);
  } else if (0==strcmp(l_unit_name, "all")) {
      UnitInfo **l_ul;
      UnitInfo **l_uit;
      if (l_value == 0) {
          ms.default_unit.enable[l_tag] = l_value ;
      } else {
          for (i=1;i<=49;i++) {
              ms.default_unit.enable[i] = (i>=l_tag) ? l_value : ms.default_unit.enable[i];
          }
      }
      if(!ms.unit_tbl) {
        init_unit_tbl();
        cDispmon("disp", MON_ALWAYS, "All units added to monitor list");
      }
      l_ul=(UnitInfo **)ht_sorted_list(ms.unit_tbl, UnitInfo_cmp);
      l_uit=l_ul;
      if (l_value == 0) {
           (*l_uit)->enable[l_tag] = l_value ;
      } else {
          for(l_uit=l_ul; 0!=*l_uit; l_uit++) {
            for (i=1;i<=49;i++) {
                (*l_uit)->enable[i]= (i>=l_tag) ? l_value : ms.default_unit.enable[i];
            }
          }
      cDispmon("disp", MON_ALWAYS, "All Units, tags >= %d value changed to %d",
	     l_tag, l_value);
      }
      free(l_ul);
  } else {
      UnitInfo *l_ui;
      if(!ms.unit_tbl) init_unit_tbl();
      l_ui=(UnitInfo*)ht_get(ms.unit_tbl,l_unit_name);
      if(0==l_ui) {
        l_ui=UnitInfo_new(l_unit_name);
        ht_put(ms.unit_tbl,l_unit_name,l_ui);
      }
      if (l_value == 0) {
          l_ui->enable[l_tag] = l_value ;
      } else {
        for (i=1;i<=49;i++) {
            l_ui->enable[i]= (i>=l_tag) ? l_value : 0 ;
        }
      }
      cDispmon("disp", MON_NORMAL, "Unit \"%s\" tag >= %d value changed to %d", 
	     l_unit_name, l_tag, l_value);
    }
  return 0;
}

/*----------------------------------------------------------------------------
* static void
* cDomon(int p_add_newline, char *p_unitName, int p_tag, char *p_format, 
*        va_list p_args)
* prints out C side monitor output
*
* Return Value --
* none
*
* Design --
* Error check, vsprintf, print_tagged_output_line
* 
* Side effects --
* could die in print_tagged_line
*----------------------------------------------------------------------------
*/
void
cDomon(int p_add_newline, const char *p_unitName, int p_tag,
    const char *p_format, va_list p_args)
{
  if(!ms.unit_tbl)
    init_unit_tbl();

  if (p_tag < 0 || p_tag > 49)
  {
    printf("ERROR(cDispmon): tag should be between 0 and 49\n");
  }
  else
  {
    int l_mon_type=mon_type_for(p_unitName, p_tag);
    if(NO_MON_TYPE!=l_mon_type)
    {
      char *output;
      char otemp;
      int osize;
      osize = vsnprintf(&otemp, 1, p_format, p_args);
      output = (char *)malloc(osize + 1);
      vsnprintf(output, osize + 1, p_format, p_args);
      print_tagged_line("", p_unitName, output, l_mon_type, 
			p_add_newline);
      free(output);
    }
  }
}

/*----------------------------------------------------------------------------
* int
* cDispmon(char *p_unitName, int p_tag, char *p_format,...)
* user entry point for writing with '\n' at end
*
* Return Value --
* always 0
*
* Design --
* 
* Side effects --
* possible death since it calls cDomon()
*----------------------------------------------------------------------------
*/
int 
cDispmon(const char *p_unitName, int p_tag, const char *p_format,...)
{
  va_list l_args;

  va_start(l_args, p_format);
  cDomon(1, p_unitName, p_tag, p_format, l_args);
  va_end(l_args);
  return 0;
}

/*----------------------------------------------------------------------------
* int
* cWritemon(char *p_unitName, int p_tag, char *p_format,...)
* user entry point for writing without '\n' at end
*
* Return Value --
* always 0
*
* Design --
* 
* Side effects --
* possible death since it calls cDomon()
*----------------------------------------------------------------------------
*/
int
cWritemon(const char *p_unitName, int p_tag, const char *p_format,...)
{
  va_list l_args;

  va_start(l_args, p_format);
  cDomon(0, p_unitName, p_tag, p_format, l_args);
  va_end(l_args);
  return 0;
}
