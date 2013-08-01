#include <stdio.h>
#include "vera_directc.h"
#include "include/pg.h"

extern void uChartoVec32(  char *in, int size, vec32** s);
extern void genCPacket ( int index, vec32** flow_vars, vec32** s ) ;

#define TOTAL_NUMBER 100

 
static pgInterface pgInt[TOTAL_NUMBER];

int pgWrap(  char** s) {

  char * data;
  // data = libnet_call();
  // int len = toStr(s, data,84);
  return(0);
}

int pgWrap1(  vec32** s) {
  // char * data;
  // data = libnet_call();

   // toVec32(data ,84,s);

}


void init_packgen( int index) {
	int i;
	/*
	if(!pgInt[index]) {
           pgInt[index] = (pgInterface	*) malloc(sizeof(pgInterface));
        }
	case(type) 
	// get correct syntax
        FRAME_TYPE: pgInt[index]->frame_type = ???;
        IP_DST_ADDR: pgInt[index]->ip_dest_addr = ??
	*/
        // for(i=0;i<10;i++) {
	  // printf(" i - %d s - %x \n",i,*s[0]);
	// }
}
void SetPktGenFields ( int type, vec32** s) {
/*
*         case(type) 
*          FRAME_TYPE: pgInt[index]->frame_type = ???;
*          IP_DST_ADDR: pgInt[index]->ip_dest_addr = ??
*/

}
void SetPktLength ( int index, int l2_len, int l3_len, int l4_len) {
	pgInt[index].l2_length = l2_len;
	pgInt[index].l3_length = l3_len;
	pgInt[index].l4_length = l4_len;
}


unsigned int concat( char a, char b,char c, char d) {
	unsigned int retval;
	retval = 0;
	retval = d;
	retval = (retval<<8) | c;
	retval = (retval<<8) | b;
	retval = (retval<<8) | a;
	return(retval);
}
void uChartoVec32(  char *in, int size, vec32 **s) {
	int len,i,j;
	len = (size%4) ? size/4:  ( size/4 +1 );
	j=0;

	for(i =0;i<size;i++ ) {
		s[j]->d = in[i];
		// printf(" j - %d  - %x \n",j,s[j]->d);
		s[j]->c = 0;
	        j++;	
	}
}

void Vec32touChar ( char *in, int size, vec32 **s) {
	int len,i,j;
	for(i =0;i<size;i++ ) {
         in[i] = s[i]->d & 0xff;
	}
}
unsigned int  Vec32touInt ( vec32 **s) {
	return(s[0]->d);
}


void uInttoVec32(  unsigned int *in, int size, vec32 **s) {
  int len,i,j;
  for(i =0;i<size;i++ ) {
    s[i]->d = in[i];
    s[i]->c = 0;
  }
}

