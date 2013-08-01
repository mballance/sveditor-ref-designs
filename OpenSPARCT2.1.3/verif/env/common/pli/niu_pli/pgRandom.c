/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: pgRandom.c
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
#include "vera_directc.h"
#include <stdlib.h>
#define N 25
#define M 7

//unsigned int rand();        /* returns a random integer */
void init( unsigned int );     /* initialize the generator */


/* return a random float >= 0 and < 1 */
#define rand_float          ((double)rand() / 4294967296.0)


static unsigned int x[N];         /* the 25 seeds */

static unsigned int mag01[2];
static int randk;
void InitpgSeed( unsigned int seed )
{
   int k;

   x[0] = (seed|1) & 0xffffffff;
   for (k=1; k<N; k++)
      x[k] = (69069 * x[k-1]) & 0xffffffff;
   mag01[0]= 0x0;
   mag01[1]= 0x8ebfd028;  /* "magic" vector */
   randk  = 0;
}


vec32 * pgRand()
   {
   unsigned int y;
   vec32 *retval;
   int kk;

   retval = (vec32 *) malloc(sizeof(vec32));

   if (randk==N)
      {
      for (kk=0; kk < N-M; kk++)
         x[kk] = x[kk+M] ^ (x[kk] >> 1) ^ mag01[x[kk] & 1];

      for (; kk < N; kk++)
         x[kk] = x[kk+(M-N)] ^ (x[kk] >> 1) ^ mag01[x[kk] & 1];

      randk=0;
      }
   y = x[randk++];
   y ^= (y << 7) & 0x2b5b2500;
   y ^= (y << 15) & 0xdb8b0000;
   y &= 0xffffffff;     /* you may delete this line if word size = 32 */
   y ^= (y >> 16);

   retval->d = y;
   retval->c = 0;
   return (retval);
}

