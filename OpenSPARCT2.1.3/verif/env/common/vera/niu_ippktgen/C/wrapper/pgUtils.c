#include <stdio.h>
#include "vera_directc.h"
#include "include/pg.h"
// CRC GEN Function 
//
//
//

extern void setpgSeed( unsigned int seed );
extern unsigned int pgrand();


#if 0
// global name crc32 collides with one in the denali library
unsigned int crc32(unsigned char *pktbuf,unsigned int pktlen )
{
  
  unsigned int crc;
  unsigned int c;
  unsigned int byte;
  int bit;
  
  crc = (unsigned int) 0xffffffff;
  for (byte = 0; byte < pktlen; byte++) {
    c = (unsigned int) pktbuf[byte];
    printf("index - %d CRC Byte - %x  CRC So far - %x \n",byte,c,crc);
    for (bit = 0; bit < 8; bit++) {
      if ((c & 0x1) ^ (crc & 0x1))
	crc = (crc >> 1)^0xedb88320;
      else
	crc = (crc >> 1);
      c >>= 1;
    }
  }
  printf("CRC - %x \n",~crc);
  return ((~crc) );
  
}
#endif

unsigned char getNextByte(unsigned char in, int data_type) {
  
  // data_type = DATA_SEQ;
  if(data_type== DATA_SEQ) {
    return(in +1);
  } else if(data_type == DATA_FIXED) {
    return(in);
  } else if(data_type== DATA_RAND) {
    return(pgrand()&0xff);
  } else if(data_type == DATA_ALL0) {
    return(0);
  } else if(data_type == DATA_ALL1) {
    return(0xff);
  } else {
	  // default to DATA_SEQ
    return(in +1);
  }
			
}

unsigned char * genPayload ( int data_type, unsigned int seed, int data_length) {
/* defined data types are
*  DATA_RANDOM - Random data
*  DATA_SEQ - In Sequence
*  More to be defined later
*/

  unsigned char *payload;
  int index,i;
  if(data_length==0) {
    return(NULL); 
  }
  payload = (unsigned char *) malloc(data_length* sizeof(unsigned char));
  index =0;

  if(data_type== DATA_RAND) {
    setpgSeed(seed ) ;  
  } else if(data_type == DATA_ALL0) {
     seed =0;	
  } else if(data_type== DATA_ALL1) {
     seed =0xffffffff;	
  } else if(data_type == DATA_FC_PAUSE) {
    // maintain seed for first 4 bytes and then all0s
    data_type = DATA_ALL0;
  }

  for(i=0;i<data_length;i++) {
     if(i<4) {
      // Start with Seed
      payload[index]= ((seed & (0xff << (8*i)))>>(8*i));
     } else {
     payload[index] = getNextByte(payload[index-1],data_type);
     // printf(" Index - %d data -0 %x \n",index, payload[index] );
     }
     index++;
  }
  return(payload);

}
unsigned char *  addL2Pad(unsigned char * pktbuf,int pktlen,int l2_pad_length) {
        unsigned char *payload;
	int i; 
	if(l2_pad_length==0) {
         return(pktbuf);	
	} else {
         payload = (unsigned char *) malloc((pktlen + l2_pad_length)* sizeof(unsigned char));
         for(i=0;i<pktlen;i++){
          payload[i] = pktbuf[i];
         } 
         for(i=pktlen;i<pktlen + l2_pad_length ;i++){
          payload[i] = (i%2) ? 0xa5:0x5a ;
         } 
         return(payload);
       }
}

unsigned char * addCrc ( unsigned char * p1, int l1, unsigned int crc) {
        unsigned char *payload;
        int i;
        payload = (unsigned char *) malloc((l1+4)* sizeof(unsigned char));
        for(i=0;i<l1;i++){
         payload[i] = p1[i];
        } 
        for(i=0;i<4;i++) {
         payload[l1+ i]= ((crc & (0xff << (8*i)))>>(8*i));
        }
        return(payload);
}
unsigned char * addPayload ( unsigned char * p1, int l1, unsigned char * p2, int l2) {
        unsigned char *payload;
        int i;
        if( (l1+l2) == 0) return(NULL);
        payload = (unsigned char *) malloc((l1+l2)* sizeof(unsigned char));
        for(i=0;i<l1;i++) {
                payload[i] = p1[i];
        }
        for(i=l1;i<l1 + l2;i++) {
                payload[i] = p2[i];
        }
        return(payload);
}

