#include <stdio.h>

#define N 25
#define M 7

unsigned int rand();        /* returns a random integer */
void init( unsigned int );     /* initialize the generator */


/* return a random float >= 0 and < 1 */
#define rand_float          ((double)rand() / 4294967296.0)


static unsigned int x[N];         /* the 25 seeds */

static unsigned int mag01[2];
static int randk;
void setpgSeed( unsigned int seed )
{
   int k;

   x[0] = (seed|1) & 0xffffffff;
   for (k=1; k<N; k++)
      x[k] = (69069 * x[k-1]) & 0xffffffff;
   mag01[0]= 0x0;
   mag01[1]= 0x8ebfd028;  /* "magic" vector */
   randk  = 0;
}


unsigned int pgrand()
   {
   unsigned int y;
   unsigned int retval;
   int kk;


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

   retval = y;
   return (retval);
}

