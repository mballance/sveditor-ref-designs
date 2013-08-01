#include <stdio.h>
#include "vera_directc.h"

unsigned int concat( char a, char b,char c, char d) {
	unsigned int retval;
	retval = 0;
	retval = d;
	retval = (retval<<8) | c;
	retval = (retval<<8) | b;
	retval = (retval<<8) | a;
	return(retval);
}
static void uInttoVec32(  unsigned int *in, int size, vec32 **s) {
	int len,i,j;
	for(i =0;i<size;i++ ) {
		s[i]->d = in[i];
		s[i]->c = 0;
	}
}
static void uChartoVec32(  char *in, int size, vec32 **s) {
	int len,i,j;
	len = (size%4) ? size/4:  ( size/4 +1 );
	j=0;

	for(i =0;i<size;i++ ) {
		s[j]->d = in[i];
		s[j]->c = 0;
	        j++;	
	}
}

static void Vec32touChar ( char *in, int size, vec32 **s) {
	int len,i,j;
	for(i =0;i<size;i++ ) {
         in[i] = s[i]->d & 0xff;
	}
}
static unsigned int  Vec32touInt ( vec32 **s) {
	return(s[0]->d);
}
