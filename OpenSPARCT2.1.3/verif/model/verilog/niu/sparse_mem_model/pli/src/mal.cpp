/***********************************************************************
 *   Functions to generate and manage random memory address 
 *   *  Orignal Author(s):   Arvind Srinivasan
 *   *  Modifier(s):
 *   *  Project(s):          Neptune
 *   *
 *   *  Copyright (c) 2004   Sun Microsystems, Inc.
 *   *
 *   *  All Rights Reserved.
 *   *
 *   *  This verilog model is the confidential and proprietary property of
 *   *  Sun Microsystems, Inc., and the possession or use of this model
 *   *  requires a written license from Sun Microsystems, Inc.
 *   *
************************************************************************/

#include <iostream>
#include <stdio.h>

#ifdef N2_AXIS
#else
   #include <map>
	using namespace std;
#endif

#include "vera_directc.h"

#define MASKL 0xffffffff
#define MAX_ITER 1000
#define VALID 1

#define NOHOLES 0
#define INC_NOHOLES 100
#define RANDOM_HOLES 200

#if defined(__cplusplus)
extern "C" {
#endif


unsigned int  MASKH ;
unsigned int  VIRTMASKH ;

static int verbose;
class PAGEINFO {
public:
  unsigned int mask;
  unsigned int value;
  unsigned int reloc;
  int id;
  int xlate_on;
  int valid;
  unsigned int byte_allocated;
  int page_size;
  unsigned int calc_value();
  unsigned int calc_reloc();
  unsigned char check_addr_match(unsigned long long int addr);
  unsigned long long int xlate_addr( unsigned long long int addr);
  PAGEINFO() {
    valid = 0;
    mask = 0;
    xlate_on = 0;
    byte_allocated = 0;
  }

};
unsigned int PAGEINFO::calc_value() {
  value = random();
//   VJH This code can be cleaned up but seems OK for now..confer with Arvind/Vernon
#ifdef NEPTUNE
  if(id<64) {
   value = value & mask & 0x0fffffff ; // Force top bits to be 0 for now-
  } else
   value = value & mask & 0x0fffffe0 ; // Force top bits to be 0 for now-
// HACK NEED TO CLEAN THIS
   value = value & mask & 0x0fffffff ; // Force top bits to be 0 for now-
#else
 #ifdef N2_FC
        if(id<64) {
  	 value = value & mask & 0x000fffff ; // Force top bits to be 0 for now-
	} else 
  	 value = value & mask & 0x000fffe0 ; // Force top bits to be 0 for now-

  	 value = value & mask & 0x000fffff ; // Force top bits to be 0 for now-
 #else
        if(id<64) {
	 value = value & mask & 0x07ffffff ; // Force top bits to be 0 for now-
	} else 
	 value = value & mask & 0x07ffffe0 ; // Force top bits to be 0 for now-

	 value = value & mask & 0x07ffffff ; // Force top bits to be 0 for now-
 #endif
#endif
	 value = value & VIRTMASKH; // for supporting 32bit address mode in Neptune
  if(verbose) printf(" MALLOC_DEBUG:  Value for id - %d set to %x \n",id,value);
  return(value);
}
unsigned int PAGEINFO::calc_reloc() {
/* For neptune, we need to block the following address range 0xF8FFFFFF - 0xF5000000
 * This belongs to the EEPROM 
 *
 */

#define NEPT_EEPROM_BASE_MAX 0xF8FFF
#define NEPT_EEPROM_BASE_MIN 0xF5000


#ifdef NEPTUNE
	int match;
	int i;
	match =0;
	i=0;
	while(match==0) {
	  reloc = random();
          reloc = reloc & mask;
	  if((reloc<=NEPT_EEPROM_BASE_MAX) && ( reloc >= NEPT_EEPROM_BASE_MIN)) {
	   // continue
	   i++;
	   if(i>1000) {
            // cannot converge...
	    printf("PAGEINFO::calc_reloc ERROR Cannot find a suitable reloc for PageID - %d \n",id);
	    reloc = 0;
	   }
	  } else { match=1; }
	}
#else
  reloc = random();
  reloc = reloc & mask;
#endif


#ifdef NEPTUNE
  reloc = reloc & 0x0fffffff; // Force top bits to be 0 for now-
#else
 #ifdef N2_FC
  	reloc = reloc & 0x000fffff; // Force top bits to be 0 for now-
 #else

// OLD CODE  if(id<64) {
// OLD CODE reloc = reloc & 0x07ffffff; // Force top bits to be 0 for now-
// OLD CODE  } else 
// OLD CODE  reloc = reloc & 0x07ffffe0; // Force top bits to be 0 for now-
// VJH Doesn't this following line over-writes the previous lines?
//
	 reloc = reloc & 0x07ffffff; // Force top bits to be 0 for now-
 #endif
#endif
	 reloc = reloc & VIRTMASKH; // for supporting 32bit address mode in Neptune
  if(verbose) printf(" MALLOC_DEBUG:  reloc for id - %d set to %x \n",id,reloc);
  return(reloc);
}

unsigned long long int PAGEINFO::xlate_addr( unsigned long long int addr) {

  unsigned int xlate;
  unsigned long long int retval;
  unsigned int p = addr & 0xfff;
  unsigned long long int orig_address;
  orig_address = addr;
  addr = addr >> 12;
  xlate = addr & 0xffffffff;
  xlate = reloc & mask | xlate & (mask ^ 0xffffffff);
  retval = xlate;
  retval =  retval <<12 | p;
#ifdef NEPTUNE
  /* This is only to check if EEPROM base address is not getting generated.*/
  if((retval<=NEPT_EEPROM_BASE_MAX) && ( retval >= NEPT_EEPROM_BASE_MIN)) {
    printf(" MALLOC_DEBUG:  Xlated Address is within EEPROM Range!! ERROR! FIX THIS!!!\n");
    retval = 0;
  }
#endif
  if(verbose) printf(" MALLOC_DEBUG:  Xlated Address = %llx  orig address - %llx \n",retval,orig_address);
  return(retval);

}
unsigned char PAGEINFO::check_addr_match(unsigned long long int addr){
	addr = addr>>12;
	if(valid ) {
	  if((addr& mask)==reloc) {
		return(1);
	  } else {
		return(0);
	  }
	} else return(0);

}

PAGEINFO *page[128];
static int pages_allocated = 0; // needed to prevent user errors
static unsigned char page_bits[32];

#ifdef N2_AXIS
   #define VALID_BIT (1ULL<<56)
   unsigned long long *hash_mem=NULL;
   int num_entries;
   int max_entries=1*1024*1024;
#else
   map< unsigned long long int,unsigned char> hash_mem;
#endif

static int BITS_TO_IGNORE; 

int deleteHashTabEntry (unsigned long long int addr){

// printf(" MALLOC DEBUG in deleteHashTabEntry addr = %x xx = %x \n",addr,hash_mem[addr]);
#ifdef N2_AXIS
unsigned long long match=addr|VALID_BIT;
int i;
if (!hash_mem){
	  printf("  AXIS_MALLOC_DEBUG: ERROR: remove entry when hash table==NULL \n"); return (0);
	  }
for (i=0;i<num_entries;i++){
  if (hash_mem[i]==match){
    hash_mem[i]=0ULL;
    return 1;
  }
}
printf("  AXIS_MALLOC_DEBUG: address not found ERROR \n");
	  return(0);

#else
  if(hash_mem.find(addr)!=hash_mem.end()) {
	  hash_mem.erase(hash_mem.find(addr));
	  // printf("  MALLOC_DEBUG: deleteaddress - %x found \n",addr);
	  return(1);
  } else {
	  printf("  MALLOC_DEBUG: deleteaddress - %x not found ERROR \n",addr);
	  return(0);
  }
#endif
	  
}

#ifdef N2_AXIS
int getHashTabEntry (unsigned long long int addr){
unsigned long long match=addr|VALID_BIT;
int i;
if (!hash_mem){
	  printf("  AXIS_MALLOC_DEBUG: get entry when hash table==NULL \n");
	  hash_mem=(unsigned long long *)calloc(max_entries,sizeof(unsigned long long));
	  if (!hash_mem){
	    printf("  could not calloc %d bytes \n", max_entries*sizeof(unsigned long long)); exit(1);
	  }
      }
for (i=0;i<num_entries;i++){
  if (hash_mem[i]==match){
    return VALID;
  }
}
  return(0);
}
void addHashTabEntry(unsigned long long int addr){

unsigned long long match=addr|VALID_BIT;
int i;
if  (num_entries < max_entries){
  hash_mem[num_entries++] = match;
    return;
}else {
  for (i=0;i<num_entries;i++){
    if (!hash_mem[i]){
      hash_mem[i]=match;
      return;
    }
  }
}
printf("ERROR: AXIS MALLOC DEBUG table is full adding %llx\n", addr);
}
#else
int getHashTabEntry (unsigned long long int addr){
	map<unsigned long long int,unsigned char>:: iterator it;
	it = hash_mem.find(addr);
	// printf("MALLOC DEBUG1 getHashTabEntry addr = %llx xx = %x \n",addr,hash_mem[addr]);

	if(it!=hash_mem.end()) {
          // printf("MALLOC DEBUG1 getHashTabEntry return VALID addr = %llx xx = %x \n",addr,hash_mem[addr]);
	  return(VALID);
	}
	else return(0);
}

void addHashTabEntry(unsigned long long int addr){

	hash_mem[addr] = 1;
        // printf(" MALLOC DEBUG1 addHashTabEntry addr = %llx xx = %x \n",addr,hash_mem[addr]);
}
#endif

int check_page_match(unsigned long long int addr, int page_id) {
unsigned long long  int addr_to_check, mask , value,  reloc;
	    
addr_to_check =  addr >> 12; // <- this determines the block size
mask = page[page_id]->mask;
value = page[page_id]->value;
reloc = page[page_id]->reloc;

// printf(" value - %x \n",value);
// printf(" mask - %x \n",mask);
// printf(" addr_to_check - %x \n",addr_to_check);
// printf(" addr - %llx \n",addr);

// add  your function
if((addr_to_check & mask) == value) 
   return(0); 
else {
       // printf("MAL_CPP : NO Match found\n");
       return(1);
     }
}

		    

#ifdef N2_AXIS
int check_allocated ( unsigned long long int addr, int no_of_blocks,int page_id){
#else
int check_allocated ( unsigned long long int addr, int no_of_blocks,int page_id,int alignment){
#endif

int i;
unsigned long long int xlate_addr;
unsigned long long int addr_with_blocks;
unsigned int block_size;
int status0,status1;
  
if(addr == 0) return(1);

            
block_size = 1<<BITS_TO_IGNORE;

//
	    
// translate this address and then check
if(page[page_id]->xlate_on) 
  xlate_addr = page[page_id]->xlate_addr(addr);
else xlate_addr = addr;

// translate this address and then check
status0 = check_page_match(addr, page_id);
status1 = check_page_match(addr + (no_of_blocks* block_size) ,page_id);
if(status1 | status0) return(1);


addr = xlate_addr >>BITS_TO_IGNORE; // <- this determines the block size 
for(i=0;i<no_of_blocks;i++) {
  if(getHashTabEntry(addr + i) == VALID ) {
    return(1); // This address is already allocated
  }
}
addr_with_blocks = xlate_addr + no_of_blocks* ( 1<<BITS_TO_IGNORE);

addr = addr_with_blocks >>BITS_TO_IGNORE; // <- this determines the block size 

#ifdef N2_AXIS
for(i=0;i<1;i++) {
  if(getHashTabEntry(addr + i) == VALID ) {
    return(1); // This address is already allocated
  }
}
#else
if(alignment<block_size) {
	// Only when alignment is less than the blocks size, there are chances that 
	// the assigned blocks will straddle
  for(i=0;i<1;i++) {
    if(getHashTabEntry(addr + i) == VALID ) {
      return(1); // This address is already allocated
    }
  }
}
#endif

return(0); 

}

	
unsigned long long int malloc_addr(int no_of_blocks, int block_size, unsigned int page_mask, int page_id,int alignment) {

  // block size has to be power of 2

unsigned long long int addr;	
unsigned int page_mask_h;
unsigned int page_mask_l;

unsigned int value_h;
unsigned int value_l;

// MASK sets up the range of address needed
//
  addr =0;
  int cnt;
  int status;

  int i;
  unsigned int a;
  i = 0;
  a = alignment>>1;
  while(a) {
    a = a>>1;
    i++;
  }
  unsigned int mask_4K;
  mask_4K = 0x0;
  for(int j = 0; j < i; j ++) {
    mask_4K = mask_4K | ( 1<<j);
  }
  mask_4K = 0xffffffff ^ mask_4K;

  unsigned int value;
  value = page[page_id]->value;
  page_mask = page[page_id]->mask ;

  page_mask_l = ((page_mask & 0x000fffff) << 12);
  page_mask_h = (page_mask & 0xfff00000) >> 20;
      
  value_h = ((page[page_id]->value & 0x000fffff) << 12);
  value_l = (page[page_id]->value & 0xfff00000) >> 20;

  unsigned int addr_43_12;

  cnt =0;
  status =1;      	
  while( status & (cnt < MAX_ITER)) {
#ifdef NEPTUNE
    addr_43_12 = 0x0fffffff & random() & ( page_mask ^0xffffffff ) | value;
    addr_43_12 = addr_43_12 & VIRTMASKH;
#else
 #ifdef N2_FC
	addr_43_12 = 0x000fffff & random() & ( page_mask ^0xffffffff ) | value;
 #else
	addr_43_12 = 0x07ffffff & random() & ( page_mask ^0xffffffff ) | value;
 #endif
#endif
    addr = (unsigned long long int ) (addr_43_12  & ( 0xfffffff0 | (( ( mask_4K&0xf000)>>12 )&0xf)))<<12 ;
    // printf(" MALLOC_DEBUG: 1 addr = %llx status = %d cnt = %d \n",addr,status,cnt);
    /// FIX FOR RDMC addr = (addr |(  ( random() & MASKL & mask_4K ) & 0xfff)) ; 
    addr = (addr |(  ( random() & MASKL & mask_4K ) & 0xfff)) ; 
#ifdef N2_AXIS
    status = check_allocated(addr, no_of_blocks,page_id);
#else
    status = check_allocated(addr, no_of_blocks,page_id,alignment);
#endif
    // printf(" MALLOC_DEBUG: 2 addr = %llx status = %d cnt = %d \n",addr,status,cnt);
    cnt ++;
  }	
  if(cnt==MAX_ITER) {
    printf(" MALLOC_DEBUG:  Cannot allocate Memory, Free up some locations ---\n");
    return(0);
  }
  
  // Add all the allocated entries into the hash table
  
  page[page_id]->byte_allocated = page[page_id]->byte_allocated + block_size* no_of_blocks;
  // printf(" MALLOC_DEBUG:  PageID %d - BytesAllocated - %d\n",page_id,page[page_id]->byte_allocated);
  
  unsigned long long int addr_tobe_added;
  
  addr_tobe_added = (page[page_id]->xlate_addr(addr)) >> BITS_TO_IGNORE;
  
  for(int i =0;i<no_of_blocks;i++) { 
    addHashTabEntry(addr_tobe_added + i);
  }
  // Add the next block if overflow is detected
#ifdef N2_AXIS
addr_tobe_added = ((page[page_id]->xlate_addr(addr)) + block_size* no_of_blocks) >> BITS_TO_IGNORE;
  addHashTabEntry(addr_tobe_added);
#else
  if(alignment<block_size) {
    addr_tobe_added = ((page[page_id]->xlate_addr(addr)) + block_size* no_of_blocks) >> BITS_TO_IGNORE;
    addHashTabEntry(addr_tobe_added);
  }
#endif
  
  return(addr);
}

int free_addr(unsigned long long int addr, int no_of_blocks,int page_id){
  //  if return value is 0 then there has been an error
  int status,i;
  unsigned long long int addr_tobe_deleted;
  int block_size;
  unsigned int alignment;

  if((page_id<0)| ( page_id>127)) {
	  printf("free_addr: Incorrect PAGE ID Specified!! TB ERROR\n");
	  return(-1);
  } 
  block_size = 1 << BITS_TO_IGNORE; // Start with some number -- 

  alignment = addr&0xfff;
  addr_tobe_deleted = addr >> BITS_TO_IGNORE;

  status = 0;
  for(i =0; i< no_of_blocks; i ++) {
    status = deleteHashTabEntry(addr_tobe_deleted + i) + status;
  }
  if(alignment) { // else already 4K alignment
   if(alignment<block_size) {
   status = deleteHashTabEntry(addr_tobe_deleted + 1) + status;
   }
  }

  if(status) {
    page[page_id]->byte_allocated = page[page_id]->byte_allocated - block_size* no_of_blocks;
    if(verbose)
#ifdef N2_AXIS
    printf(" AXIS MALLOC_DEBUG:  NoOfBytes Freed - %d PageID %d - Current BytesAllocated - %d\n",block_size*
no_of_blocks, page_id,page[page_id]->byte_allocated);
#else
    printf(" MALLOC_DEBUG:  NoOfBytes Freed - %d PageID %d - Current BytesAllocated - %d\n",block_size*no_of_blocks, page_id,page[page_id]->byte_allocated);
#endif
  }
  return(status);
}

void set_block_size(int block_size, int mode_32b) {

	BITS_TO_IGNORE = -1; 

        MASKH  = mode_32b? 0x0 : 0xff;
	VIRTMASKH = mode_32b? 0x000fffff: 0xffffffff;

	int blocks;
	blocks = block_size;
	while(blocks) {
	  BITS_TO_IGNORE++;
	  blocks = blocks >>1;
	}


}


int CheckPageId(vec32 *addrh, vec32 *addrl) {
    int page_id = -1;
    unsigned long long int addr;
    int match;

    addr = addrh->d & 0xff ; // Restrict this to 40 bits only for now
    addr = addr<<32;
    addr = addr | ( (unsigned long long int) addrl->d );

    match =0;
    page_id=-1;
    while((match==0) && (page_id<128)) {
      page_id++;
      match = page[page_id]->check_addr_match(addr);
    }
    if(match) return(page_id) ;
    else return(-1);
	
}
void MarkUsedLocations(vec32 *addrh, vec32 *addrl, int no_of_blocks) {

 unsigned long long int addr;
 unsigned long long int addr_tobe_added;

 addr = addrh->d & 0xff ; // Restrict this to 40 bits only for now
 addr = addr<<32;
 addr = addr | ( (unsigned long long int) addrl->d );

 addr_tobe_added = addr >>BITS_TO_IGNORE;
 if(verbose) {
   printf("MALLOC DEBUG Marking Addresses from %llx to Address  %llx as Used \n", addr, (addr + no_of_blocks* (1<<BITS_TO_IGNORE)));
 }
 
 for(int i =0;i<no_of_blocks;i++) { 
   addHashTabEntry(addr_tobe_added + i);
 }
}
unsigned long long int xlate_addr( unsigned long long int addr, int page_id ) {
unsigned long long int retval;
// translate this address and then check
if(page[page_id]->xlate_on) {
  retval = page[page_id]->xlate_addr(addr); }
else retval = addr;

return(retval);
}


vec32* XlateAddr( vec32 * addrh, vec32 * addrl, int page_id) {
unsigned long long int init_addr;
unsigned long long int xlateaddr;
vec32 retval[2];

  if(pages_allocated == 0) {
    // enable only only one page ie page0 
    for(int i = 0; i <128;i++) {
      page[i] = new PAGEINFO ();
    page[i]->valid = 1;
    page[i]->xlate_on = 0;
    page[i]->page_size = -1;
    page[i]->mask = 0;
    page[i]->value = 0x0;
    }
    pages_allocated = 1;
  }

if(page_id <128) {
  init_addr = addrh->d;
  init_addr = init_addr <<32;
  init_addr = init_addr | addrl->d;
  xlateaddr = xlate_addr( init_addr, page_id);
  retval[0].d = xlateaddr & 0xffffffff;
  retval[0].c = 0x0;
  retval[1].d =  (unsigned long long int ) xlateaddr>>32;;
  retval[1].c = 0x0; 
  return(retval);
} else {
  printf(" XlateAddr:: TESTBENCH ERROR \n");
  retval[0].d = 0;
  retval[0].c = 0xffffffff;
  retval[1].d = 0;
  retval[1].c = 0xffffffff; 
  return(retval);
}
}


void SetExtMemBlockSize(int block_size, int mode_32b) {

  set_block_size(block_size,mode_32b);

}



int FreeAddr (vec32 *  addrh, vec32 *  addrl,  int no_of_blocks, int page_id){

    unsigned long long int addr;
    int status;
    addr = addrh->d;
    addr = addr <<32;
    addr = addr | addrl->d;
    status = free_addr(addr, no_of_blocks,page_id);
    return(status);
}

int ForcePageContexts (int page_id, vec32 * mask, vec32 * value, vec32 * reloc) {
  if(pages_allocated == 0) {
    for(int i = 0; i <128;i++) {
     page[i] = new PAGEINFO ();
     page[i]->valid = 1;
     page[i]->xlate_on = 0;
     page[i]->page_size = -1;
     page[i]->mask = 0;
     page[i]->value = 0x0;
   }
    pages_allocated = 1;
  }
  if(page_id>=128) {
    printf(" MALLOC_DEBUG:  page id - %d greater than 128!! ERROR \n");
    return(-1);
  }
  page[page_id]->valid = 1;
  page[page_id]->xlate_on = 1;
  page[page_id]->page_size = -1;
  page[page_id]->mask = mask->d;
  page[page_id]->value = value->d;
  page[page_id]->reloc = reloc->d;

  return(1);
}

vec32* MallocBlock(int no_of_blocks,  int page_id, int alignment ) {

  unsigned long long int addr;
  vec32  returnval[2];
  unsigned int addrl,addrh;
  unsigned int page_mask;

  int block_size;
  block_size = 1 << BITS_TO_IGNORE; // Start with some number -- 

  if(pages_allocated == 0) {
    // enable only only one page ie page0 
    for(int i = 0; i <128;i++) {
      page[i] = new PAGEINFO ();
    page[i]->valid = 1;
    page[i]->xlate_on = 0;
    page[i]->page_size = -1;
    page[i]->mask = 0;
    page[i]->value = 0x0;
    }
    pages_allocated = 1;
  }

  if(page_id>=128) {
    printf(" MALLOC_DEBUG:  page id - %d greater than 128!! ERROR \n");
    returnval[0].d = 0;
    returnval[0].c = 0xffffffff;
    returnval[1].d = 0;
    returnval[1].c = 0xffffffff; 
    return(returnval);
  }
  if(page[page_id]->valid) {
    // printf(" MALLOC_DEBUG:  page_id - %d bytes_allocated - %d , page_size - %d \n",page_id,page[page_id]->byte_allocated,page[page_id]->page_size);
    if( ( (block_size*no_of_blocks) + page[page_id]->byte_allocated )  > page[page_id]->page_size) {
      printf(" MALLOC_DEBUG:  No Space available!!! - ERROR \n");
      returnval[0].d = 0;
      returnval[0].c = 0xffffffff;
      returnval[1].d = 0;
      returnval[1].c = 0xffffffff;
      return(returnval);
    }

    if(page[page_id]->xlate_on)
      page_mask = page[page_id]->mask;
    else page_mask = 0;

#ifdef N2_AXIS
#else
    if(verbose)
     printf(" MALLOC_DEBUG:  malloc called with page_id - %d page_mask - %x \n",page_id,page_mask);
#endif

    addr = malloc_addr( no_of_blocks, block_size, page_mask, page_id,alignment);
    if(verbose) 
	    printf(" MALLOC_DEBUG: Virtual Allocated address = %llx  with NoOfBlock - %d  page_mask - %x page_id - %d BytesAllocated - %d Page Size - %d ByteAlignment - %d \n",addr,no_of_blocks, page_mask,page_id,page[page_id]->byte_allocated,page[page_id]->page_size, alignment);
    if(addr==0) {
      printf("  MALLOC_DEBUG: No Space available!!! - ERROR \n");
      returnval[0].d = 0;
      returnval[0].c = 0xffffffff;
      returnval[1].d = 0;
      returnval[1].c = 0xffffffff;
      return(returnval); 
    }
    
    // returnval = (vec32 *) malloc(sizeof(vec32));
    addrl = addr & 0xffffffff;
    addr = (unsigned long long int ) addr>>32;
    addrh = addr;
    returnval[0].d = addrl;
    returnval[0].c = 0;
    returnval[1].d = addrh;
    returnval[1].c = 0;
  } else {
    printf(" MALLOC_DEBUG:  page id - %d Not initialized!! ERROR \n",page_id);
    returnval[0].d = 0;
    returnval[0].c = 0;
    returnval[1].d = 0;
    returnval[1].c = 0;
  }

  return(returnval);
  

}



// Functions to return handle to page; ( top 20bits in Address)
#ifdef N2_AXIS
int check_page_handle_alloc ( unsigned int handle) {
if (!hash_mem){
	  printf("  MALLOC_DEBUG: check_page_handle_alloc when hash table==NULL \n");
	  hash_mem=(unsigned long long *)calloc(max_entries,sizeof(unsigned long long));
	  if (!hash_mem){
	    printf("  could not calloc %d bytes \n", max_entries*sizeof(unsigned long long)); exit(1);
	  }

	  }
  if (hash_mem[handle] & VALID_BIT)
    return(VALID);
else return(0);
}
#else
map< unsigned int,unsigned char> page_handle;
int check_page_handle_alloc ( unsigned int handle) {
  map<unsigned int,unsigned char>:: iterator it;
  it = page_handle.find(handle);
  // printf(" addr = %x xx = %x \n",addr,hash_mem[addr]);
  if(it!=page_handle.end())
  return(VALID);
  else return(0);
}
#endif
vec32* GetPageHandle() {
	unsigned int handle;
	vec32 *retval;
	retval = (vec32 *) malloc(sizeof(vec32));	
	int status;
	status = 1;
	while(status) {
		handle = random() & 0xfffff;// 20 bits only
		status = check_page_handle_alloc(handle);
	}
#ifdef N2_AXIS
#else
	page_handle[handle] = 1;
#endif
	if(verbose) printf(" MALLOC_DEBUG:  Page Handle Allocated - %x \n",handle);
	retval->d = handle;
	retval->c = 0;
	return(retval);
}

#ifdef N2_AXIS
unsigned int DeletePageHandle( unsigned int handle)  {
if (hash_mem[handle] & VALID_BIT){
    hash_mem[handle] =0;
    return(1);
  } else {
    printf(" AXIS MALLOC_DEBUG:  address not found ERROR \n");
  return(0);
  }
}
#else
unsigned int DeletePageHandle( unsigned int handle)  {
  if(page_handle.find(handle)!=page_handle.end()) {
    page_handle.erase(page_handle.find(handle));
    return(1);
  } else {
    printf(" MALLOC_DEBUG:  address not found ERROR \n");
  return(0);
  }
}
#endif

// functions to return page masks

vec32 * GetPageMask (int id) {
   vec32 *retval;
   retval = (vec32 *) malloc(sizeof(vec32));	
  if(page[id]->valid) {
    retval->d = page[id]->mask;
  } else 
  retval->d = 0;
  retval->c = 0;
  return(retval);
}
vec32 * GetPageValue (int id) {
  vec32 *retval;
  retval = (vec32 *) malloc(sizeof(vec32));
  if(page[id]->valid) {
    retval->d = page[id]->value;
  } else 
    retval->d = 0;
  retval->c = 0;
  return(retval);
}
vec32 * GetPageReloc (int id) {
  vec32 *retval;
  retval = (vec32 *) malloc(sizeof(vec32));
  if(page[id]->valid) {
    retval->d = page[id]->reloc;
  } else 
    retval->d = 0;
  retval->c = 0;
  return(retval);

}
int SetConfig ( int config, unsigned int gSeed ){
	srandom(gSeed);
	if(config == 1) {
	 verbose = 1;
	}
	else {
	 verbose = 0;
	}
	// Can have more configs here
return 0;
}

int DeletePageContext ( int id) {
 if(pages_allocated) {
      delete page[id];
      page[id] = new PAGEINFO ();
      page[id]->xlate_on = 1;
      return(1);
 } else return(0);
}
int SetPageMask ( int no_of_pages /* NoOf4KPages*/, int type, int id) {


       
  static int id_assigned = 0; 
  unsigned char b[32];
  static int init= 0;
  unsigned int mask;
  int entry_free;
  int cnt;
  int index;
  int status;
  if(!init) {
    for(int i = 0; i <128;i++) {
      page[i] = new PAGEINFO ();
      page[i]->xlate_on = 1;
    }
    init = 1; 
    pages_allocated = 1;
#ifdef N2_AXIS
#else
    for(int i = 0; i < 32;i++) page_bits[i] = 0;
#endif
  }

  if(page[id]->valid) {
    printf(" MALLOC_DEBUG:  ERROR- Pageid - %d already allocated - Delete this page before re-allocating \n",id);
    return(-1);
  }


  if(no_of_pages == 1) {  // Need 4K size
    
    page[id]->mask = 0xffffffff;
    page[id]->mask = page[id]->mask & VIRTMASKH;
    page[id]->id = id;
    page[id]->page_size  = 4096;
    unsigned int value = page[id]->calc_value();
    unsigned int reloc = page[id]->calc_reloc();
    page[id]->valid = 1;
    status = 1;
    return(status);
  } 
  if(no_of_pages == -1) { // get the entire memory -- only one large page is valid
    id = 0;  // force to 0
    page[id]->mask = 0;
    page[id]->mask = page[id]->mask & VIRTMASKH;
    page[id]->page_size  = -1;
    page[id]->xlate_on = 0;
    page[id]->id = id;
    unsigned int value = page[id]->calc_value();
    unsigned int reloc = page[id]->calc_reloc();
    page[id]->valid = 1;
    status =1 ;
    return(status);
  }  
  
  cnt = 0;
  int no_of_0s;
  no_of_0s = 0;
  int no_of_4Kpages = no_of_pages;
  while(no_of_4Kpages) { 
    no_of_0s++;
    no_of_4Kpages = no_of_4Kpages>>1;
  }
  // printf(" NoOf 0s = %d  required for #%d NoOf4KPages \n",no_of_0s,no_of_pages);

  // fill in appropriate number of 0s and return the mask

#ifdef N2_AXIS
 for(int i = 0; i < 32;i++) b[i] = 0;

  if(type == 0 /* No holes*/) {
    mask = 0xffffffff;
    for(int i = 0 ; i < no_of_0s; i ++) {
      mask = mask ^ ( 1 << i); 
    }
    cnt = 0;
  } else {
    mask = 0xffffffff;
    for(int i = 0 ; i < no_of_0s; i ++) {
      entry_free = 0;
      cnt = 0;
      while(!entry_free & (cnt <32)) {
	index = random() % 32;
	cnt ++;
	if(b[index]!=0) entry_free = 0;
	else { entry_free = 1; b[index] = 1;}
      } 
      // flip the appropriate bit as indicated by the index
      mask = mask ^ ( 1 << index);
    }
  }
#else 
  if(type== NOHOLES) {
    mask = 0xffffffff;
    for(int i = 0 ; i < no_of_0s; i ++) {
     mask = mask ^ ( 1 << i); 
    }
   cnt = 0;
  } else if(type==INC_NOHOLES/*Noholes*/) {
	  // pick up the first available 0 from bottom
   index = 31;
   while((page_bits[index]==1)&( index >=0))  {
     index--;
   }

   // move this index such that index+no_of_page <32
   if( (index+no_of_0s) > 32) {
    index = index - (  index + no_of_0s -32 );
   }
   int start_index = index;
   // int end_index = index + no_of_0s;  
   int end_index = 32;
   mask = 0xffffffff;
   printf("MALLOC DEBUG start_index - %d end_index - %d \n",start_index,end_index);
   for(int i= start_index; i< end_index;i++) {
     mask = mask ^ ( 1 << (31 - i)); 
     page_bits[i] = 1;
   }
  } else {
    for(int i = 0; i < 32;i++) b[i] = 0;

    if(type== RANDOM_HOLES) {
      mask = 0xffffffff;
    } else {
      // add no of contg 0s based upon the type and leave the rest to 
      // random
      mask = 0xffffffff;
      for(int i = 0 ; i < type; i ++) {
       mask = mask ^ ( 1 << i); 
       b[i] = 1;
      }
      if((no_of_0s - type)<0) {
       printf("MALLOC USER ERROR In correct Type given!!! \n");
       status = -1;
       return(status);
      }
     }
     for(int i = 0 ; i < no_of_0s - type; i ++) {
      entry_free = 0;
      cnt = 0;
      while(!entry_free & (cnt <32)) {
	index = random() % 32;
	cnt ++;
	if(b[index]!=0) entry_free = 0;
	else { entry_free = 1; b[index] = 1;}
      } 
       // flip the appropriate bit as indicated by the index
       mask = mask ^ ( 1 << index);
      }
    }
#endif
  if(cnt >= 32) {
    printf(" MALLOC_DEBUG:  ERROR - All entries are occupied in the page mask generation!! \n");
    page[id]->valid = 0;
    page[id]->mask = 0;
    page[id]->id = id;
    page[id]->page_size  = 0;
    unsigned int value = page[id]->calc_value();
    unsigned int reloc = page[id]->calc_reloc();
    page[id]->valid = 1;
    status = -1;
    return(status);
    
  }
  
  if(verbose) printf(" MALLOC_DEBUG:  Page Mask Derived - %x \n",mask);
  page[id]->mask = mask;
  page[id]->id = id;
  page[id]->page_size  = 4096*no_of_pages ;
  unsigned int value = page[id]->calc_value();
  unsigned int reloc = page[id]->calc_reloc();
  page[id]->valid = 1;
  status = 1;
  return(status);
}

/*
int main() {


	int i;
	unsigned long long int addr;
	int block_size;
	int no_of_blocks;
	
	block_size = 512; // Start with some number -- 
	no_of_blocks = 4; // 4 blocks of 512 bytes


	set_block_size(block_size);

	for( i = 0; i< 100000; i ++) {
		addr = malloc_addr( no_of_blocks, block_size);
		printf(" i = %d addr = %x \n",i,addr);

	}


return(1);
}

*/
#if defined(__cplusplus) 
} /* extern "C" */
#endif

