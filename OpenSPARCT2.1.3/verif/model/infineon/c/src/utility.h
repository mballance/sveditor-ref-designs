/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: utility.h
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
#include "vcsuser.h"
#include "acc_user.h"
#include <malloc.h>
#include <stdio.h>
#include <string.h>

#define	 BUFFER		1024

typedef struct f_state_node{
  union{
    char cval[144];//total number of dimms
    int  ival[36];
  } aval;
  char bval[144];
}state_node, *f_state_ptr;
// define avl tree data structure for memory model
typedef struct avl_node{
  long long  addr;
  f_state_ptr         val;
  int     state, balance;
  char*   comment;
  struct avl_node *leftPtr;
  struct avl_node *rightPtr;
} *avl_node_ptr;

// define avl data structure.
typedef struct avl_conf_node{
  avl_node_ptr data;
  int          dram;
  int          size, d_size;
  int          word, d_word;
  int          addr;     //how many bits
  int          half_byte;//how many half_byte;
} *avl_conf_ptr;
avl_node_ptr search_node(avl_node_ptr* t_ptr, long long* addr);
/*-------------------------------------------------------------------------------
   create new avl_node.
  state bit : 
     0 dirty,
     1 valid
     2 clean
--------------------------------------------------------------------------------*/
avl_node_ptr create_avl_node(long long addr, f_state_ptr val){
  avl_node_ptr n_ptr;
  f_state_ptr  t_tmp;

  n_ptr = (avl_node_ptr)malloc(sizeof(struct avl_node));
  if(n_ptr != 0){
    t_tmp          = (f_state_ptr)malloc(sizeof(struct f_state_node));
    t_tmp[0]       = val[0];
    n_ptr->val     = t_tmp;
    n_ptr->state   = 2;
    n_ptr->addr    = addr;
    n_ptr->balance = 0;
    n_ptr->leftPtr = 0;
    n_ptr->rightPtr= 0;
  }
  else {
    io_printf((char *)"Error : Out of memory\n");
    tf_dofinish();
  }
  return n_ptr;
}
/*-------------------------------------------------------------------------------
   check difference.
--------------------------------------------------------------------------------*/
int difference(avl_node_ptr t_ptr){
  int left, right;
  left  = -1;right = -1;

  if(t_ptr == 0)return 0;
  if(t_ptr->leftPtr  != 0)left  = t_ptr->leftPtr->balance;
  if(t_ptr->rightPtr != 0)right = t_ptr->rightPtr->balance;
  return (left - right);
}
/*-------------------------------------------------------------------------------
   rotate nodes pointed to by pivotptr.
   pivotptr: leftPtr.
--------------------------------------------------------------------------------*/
void rotate_right(avl_node_ptr* pivot_ptr){
  avl_node_ptr t_ptr;
  
  if((*pivot_ptr) != 0){
    if((*pivot_ptr)->leftPtr != 0){
      t_ptr                 = (*pivot_ptr)->leftPtr;
      (*pivot_ptr)->leftPtr = t_ptr->rightPtr;
      t_ptr->rightPtr       = *pivot_ptr;
      *pivot_ptr            = t_ptr; // t_ptr becomes new root of this whole subtree.
    }
  }
}
/*-------------------------------------------------------------------------------
   rotate nodes pointed to by pivotptr.
   pivotptr: leftPtr.
--------------------------------------------------------------------------------*/
void rotate_left(avl_node_ptr* pivot_ptr){
  avl_node_ptr t_ptr;
  
  if((*pivot_ptr) != 0){
    if((*pivot_ptr)->rightPtr != 0){
      t_ptr                  = (*pivot_ptr)->rightPtr;
      (*pivot_ptr)->rightPtr = t_ptr->leftPtr;
      t_ptr->leftPtr         = *pivot_ptr;
      *pivot_ptr             = t_ptr; // t_ptr becomes new root of this whole subtree.
    }
  }
}
/*-------------------------------------------------------------------------------
   rotate nodes pointed to by pivotptr.
   pivotptr: leftPtr.
--------------------------------------------------------------------------------*/
void balance_right(avl_node_ptr* t_ptr){

  if(difference((*t_ptr)->rightPtr) == 0){
    rotate_left(&(*t_ptr));
    (*t_ptr)->balance--;
    (*t_ptr)->leftPtr->balance++;

  }
  else if(difference((*t_ptr)->rightPtr) < 0){
    rotate_left(&(*t_ptr));
    (*t_ptr)->leftPtr->balance -= 2;
  }
  else{
    rotate_right(&(*t_ptr)->rightPtr);
    rotate_left(&(*t_ptr));
    (*t_ptr)->balance++;
    (*t_ptr)->leftPtr->balance -= 2;
    (*t_ptr)->rightPtr->balance--;
  }
}
/*-------------------------------------------------------------------------------
   rotate nodes pointed to by pivotptr.
   pivotptr: rightPtr.
--------------------------------------------------------------------------------*/
void balance_left(avl_node_ptr* t_ptr){

  if(difference((*t_ptr)->leftPtr) == 0){
    rotate_right(&(*t_ptr));
    (*t_ptr)->balance--;
    (*t_ptr)->rightPtr->balance++;

  }
  else if(difference((*t_ptr)->leftPtr) < 0){
    rotate_right(&(*t_ptr));
    (*t_ptr)->rightPtr->balance -= 2;
  }
  else{
    rotate_left(&(*t_ptr)->leftPtr);
    rotate_right(&(*t_ptr));
    (*t_ptr)->balance++;
    (*t_ptr)->rightPtr->balance -= 2;
    (*t_ptr)->leftPtr->balance--;
  }
}
/*-------------------------------------------------------------------------------
   update balance.
--------------------------------------------------------------------------------*/
void fixFB(avl_node_ptr t_ptr){
  int left, right;
  left  = -1;right = -1;

  if(t_ptr->leftPtr  != 0)left  = t_ptr->leftPtr->balance;
  if(t_ptr->rightPtr != 0)right = t_ptr->rightPtr->balance;
  if(left > right)t_ptr->balance   = left + 1;
  else            t_ptr->balance   = right + 1;
}
/*-------------------------------------------------------------------------------
   write data into memory.
--------------------------------------------------------------------------------*/
int insert_avl_node(avl_node_ptr *t_ptr, long long* addr, f_state_ptr val){
  
  if((*t_ptr) == 0){
    (*t_ptr)  = create_avl_node(*addr, val); // add new node to tree.
    if((*t_ptr) == 0){
      io_printf((char *)"Error : Out of Memory\n");
      tf_dofinish();
    }
  }
  else if(*addr == (*t_ptr)->addr)return 1;
  else{
    if(*addr < (*t_ptr)->addr)insert_avl_node(&(*t_ptr)->leftPtr, addr, val);
    else insert_avl_node(&(*t_ptr)->rightPtr, addr, val);
    fixFB(*t_ptr);
    if(difference(*t_ptr) > 1)       balance_left (&(*t_ptr));
    else if(difference(*t_ptr) < -1) balance_right(&(*t_ptr));
  }
  return 0;
}
/*-------------------------------------------------------------------------------
search address on avl.
--------------------------------------------------------------------------------*/
avl_node_ptr search_node(avl_node_ptr* t_ptr, long long* addr){
  
  if((*t_ptr)->addr == *addr){
    return *t_ptr;
  }
  if((*t_ptr)->addr > *addr){
    if((*t_ptr)->leftPtr == 0){
      return 0;
    }
    return search_node(&(*t_ptr)->leftPtr, addr);
  }
  else{
    if((*t_ptr)->rightPtr == 0){
      return 0;
    }
    return search_node(&(*t_ptr)->rightPtr, addr);
  }
}
/*-------------------------------------------------------------------------------
   convert unsigned int to char array
--------------------------------------------------------------------------------*/
long long mask_upbit(int width, long long val){
  long long mask;

  mask    = ~0x0;
  mask  <<= width;
  mask    = ~mask;
  val     = (val) & mask;
  return val;
}
/*-------------------------------------------------------------------------------
   traverse an avl-tree by visitint a left subtree. 
--------------------------------------------------------------------------------*/
void in_order(avl_node_ptr* t_ptr, FILE* fp, int* shft, int* size){
  int i, num;
  if(*t_ptr != 0){
    in_order(&(*t_ptr)->leftPtr, fp, shft, size);
    if(*shft > 0){
      fprintf(fp, "way -> %x  ", mask_upbit(64 - (*shft), (*t_ptr)->addr >> (*shft)));
      fprintf(fp, "index -> %02x  data -> ", mask_upbit(*shft, (*t_ptr)->addr));
      num = (*size) / 32;if(((*size) % 32) != 0)num++;
      for(i = num - 1;i >= 0;i--)fprintf(fp, "%x", (*t_ptr)->val[i].aval);
      fprintf(fp, "\n");
    }
    else{
      fprintf(fp, "address -> %016llx data -> ", (*t_ptr)->addr);
      num = (*size) / 32;if(((*size) % 32) != 0)num++;
      for(i = num - 1;i >= 0;i--)fprintf(fp, "%x", (*t_ptr)->val[i].aval);
      fprintf(fp, "\n"); 
    }
    in_order(&(*t_ptr)->rightPtr, fp, shft, size);
  }
}
/*-------------------------------------------------------------------------------
   utility routines.
--------------------------------------------------------------------------------*/
/*-------------------------------------------------------------------------------
   remove leading space or tab.
   if found carriage return, return -1 to indicate anenpty string.
--------------------------------------------------------------------------------*/
int remove_leading_space(char* buf, int index, int max){
  while((index < max) && (buf[index] == ' ' || buf[index] == '\t'))index++;
  return buf[index] == '\n' || buf[index] == '\0' ? -1 : index;
}
/*-------------------------------------------------------------------------------
   make address from alpha string.
   --------------------------------------------------------------------------------*/
long long ato_long(char* buf, int* index){
 long long val;
  val = 0;
  while((buf[*index] != ' ') && (buf[*index] != '\0') && (buf[*index] != '\n')){
    val <<= 4;
    val  |= buf[*index] > '9' ? ((buf[*index] & 0xf) + 9) : buf[*index] & 0xf;
    (*index)++;
  }
  return val;
}
/*-------------------------------------------------------------------------------
   convert ascii to hex array.
   --------------------------------------------------------------------------------*/
void convert_a2b(char* buf, int* index, char* d_buf, int* d_ind, int* num_bit){

  while((buf[*index] != ' ') && (buf[*index] != '\0') && (buf[*index] != '\n')){
    d_buf[*d_ind]  = buf[*index] > '9' ? ((buf[*index] & 0xf) + 9) : buf[*index] & 0xf;
    (*index)++;
    (*d_ind)++;
    *num_bit += 4;
  }
}
/*-------------------------------------------------------------------------------
   convert unsigned int to char array
--------------------------------------------------------------------------------*/
unsigned int mask_low_bits(int mask_num, int num, unsigned int val){
  unsigned int mask;

  val    >>= (num - mask_num);// shift and drop bits.
  mask    = ~0x0;
  mask  <<= mask_num;
  mask    = ~mask;
  val     = val & mask;
  return val;
}
/*-------------------------------------------------------------------------------
   convert ascii to hex.
   --------------------------------------------------------------------------------*/
void shift_left(unsigned int o_data, char* val, int num){
  *val = (o_data << num) | *val;
}

/*-------------------------------------------------------------------------------
   calculate tag.
--------------------------------------------------------------------------------*/
void tag_address(long long addr, long long * way, unsigned int* tag_data){

  *way      = addr & 0xfffff;
  *tag_data = (addr >> 16) & 0xffffff; //[39:16] 
}
/*-------------------------------------------------------------------------------
  slam meory.
  slam_memory(data pointer, size, argument location, valid);
--------------------------------------------------------------------------------*/
void slam_memory(f_state_ptr val, int size, int arg_loc, int valid, int loc){
           char* avalPtr, *bvalPtr;
           int  word, ind, groups;
           s_tfnodeinfo node_info;
           s_tfexprinfo expr_info;
             tf_nodeinfo(arg_loc, &node_info);
           switch(node_info.node_type){
           case TF_MEMORY_NODE :
             tf_nodeinfo(arg_loc, &node_info);
             word = node_info.node_ngroups * 2;
             ind  = 0;
             for(size = 0;size < node_info.node_mem_size;size++){
               avalPtr = node_info.node_value.memoryval_p + size * word;
               bvalPtr = avalPtr + node_info.node_ngroups;
               for(groups = node_info.node_ngroups - 1; groups >= 0;groups--){
                 avalPtr[groups] = valid ? val[ind].aval.cval[loc] : 0 ; //0xff;
                 bvalPtr[groups] = valid ? val[ind].bval[loc] : 0; //0xff;
                 ind++;
               }
             }
             break;
           case TF_REG_NODE :
             tf_exprinfo(arg_loc, &expr_info);
             for(groups = 0; groups < expr_info.expr_ngroups ; groups++){
               expr_info.expr_value_p[groups].avalbits = valid ? val[groups].aval.cval[loc] : 0xffffffff;
               expr_info.expr_value_p[groups].bvalbits = valid ? val[groups].bval[loc]      : 0xffffffff;
             }
             tf_propagatep(arg_loc);
             break;
           case TF_NETVECTOR_NODE :
             tf_exprinfo(arg_loc, &expr_info);
             for(groups = 0; groups < expr_info.expr_ngroups ; groups++){
               expr_info.expr_value_p[groups].avalbits = valid ? val[groups].aval.cval[loc] : 0xffffffff;
               expr_info.expr_value_p[groups].bvalbits = valid ? val[groups].bval[loc] : 0xffffffff;
             }
             tf_propagatep(arg_loc);
             break;
           }
}

/*-------------------------------------------------------------------------------
   slam meory.
  slam_memory(data pointer, size, argument location, valid);
--------------------------------------------------------------------------------*/
void dump_memory(f_state_ptr val, int size, int arg_loc, int loc){
  char* avalPtr, *bvalPtr;
  int  word, ind, groups;
  s_tfnodeinfo node_info;
  
  tf_nodeinfo(arg_loc, &node_info);
  switch(node_info.node_type){
  case TF_MEMORY_NODE :
    word = node_info.node_ngroups * 2;
    ind = 0;
    for(size = 0;size < node_info.node_mem_size;size++){
      avalPtr = node_info.node_value.memoryval_p + size * word;
      bvalPtr = avalPtr + node_info.node_ngroups;
    }
    break;
  case TF_REG_NODE :
    for(groups = 0; groups < node_info.node_ngroups ; groups++){
      val[groups].aval.cval[loc] = node_info.node_value.vecval_p[groups].avalbits;
      val[groups].bval[loc]      = node_info.node_value.vecval_p[groups].bvalbits;
    }
    break;
  case TF_NETVECTOR_NODE :
    for(groups = 0; groups < node_info.node_ngroups ; groups++){
      val[groups].aval.cval[loc] = node_info.node_value.vecval_p[groups].avalbits;
      val[groups].bval[loc]      = node_info.node_value.vecval_p[groups].bvalbits;
    }
    break;
  }
}
/*-------------------------------------------------------------------------------
   convert unsigned int to char array
--------------------------------------------------------------------------------*/
void mask_value(int width, long long* val){
 long long mask;

  mask    = ~0x0;
  mask  <<= width;
  mask    = ~mask;
  *val    = (*val) & mask;
}
/*-------------------------------------------------------------------------------
   create new avl_node.
  
  state bit : 
     0 dirty,
     1 valid
     2 clean
--------------------------------------------------------------------------------*/
avl_node_ptr create_event_node(long long addr, f_state_ptr val, char* buf, int size){
  avl_node_ptr n_ptr;
  f_state_ptr  t_tmp;
  int          i;
  char         *cmt;

  n_ptr = (avl_node_ptr)malloc(sizeof(struct avl_node));
  if(n_ptr != 0){
    t_tmp          = (f_state_ptr)malloc(sizeof(struct f_state_node) * 1);
    if(strlen(buf)){
      cmt            = (char*)malloc(strlen(buf));
      strcpy(cmt, buf);
    }
    else cmt  = 0;
    for(i = 0; i < size;i++)t_tmp[i] = val[i];
    n_ptr->comment   = cmt;
    n_ptr->val       = t_tmp;
    n_ptr->state     = 2;
    n_ptr->addr      = addr;
    n_ptr->balance   = 0;
    n_ptr->leftPtr   = 0;
    n_ptr->rightPtr  = 0;
  }
  return n_ptr;
}
/*-------------------------------------------------------------------------------
   write data into memory.
--------------------------------------------------------------------------------*/
int insert_event_node(avl_node_ptr *t_ptr, long long* addr, 
		      f_state_ptr val,     char* buf,               int* size){
  
  if((*t_ptr) == 0){
    (*t_ptr)  = create_event_node(*addr, val, buf, *size); // add new node to tree.
    if((*t_ptr) == 0){
    	io_printf((char *)"Error : Out of memory\n");
      tf_dofinish();
    }
  }
  else if(*addr == (*t_ptr)->addr){
    int i;//update memory
    for(i = 0; i < *size;i++)(*t_ptr)->val[i] = val[i];
    return 1;
  }
  else{
    if(*addr < (*t_ptr)->addr)insert_event_node(&(*t_ptr)->leftPtr, addr, val, buf, size);
    else insert_event_node(&(*t_ptr)->rightPtr, addr, val, buf, size);
    fixFB(*t_ptr);
    if(difference(*t_ptr) > 1)       balance_left (&(*t_ptr));
    else if(difference(*t_ptr) < -1) balance_right(&(*t_ptr));
  }
  return 0;
}
/*-------------------------------------------------------------------------------
   read event file
--------------------------------------------------------------------------------*/
void get_event(avl_conf_ptr a_tree, FILE *fp){
  long long  addr;
  char  buf[BUFFER], d_buf[BUFFER];
  int  ind, d_ind, num_bit, type, reg, size;
       state_node         f_val[2];
  num_bit = 0;
  size    = 1;
  while(fgets(buf, BUFFER, fp)){
    ind = remove_leading_space(buf, 0, BUFFER);
    if(ind < 0)continue;//empty string
    d_ind   = 0;
    if(strncmp(buf,"trig_pc_d", 9) == 0){
      strcpy(buf, buf + 10);
      for(ind = 0; ind < strlen(buf); ind++)
	if(buf[ind] == '-' || 
	   buf[ind] == '>' || 
	   buf[ind] == ',' ||
	   buf[ind] == ')' ||
	   buf[ind] == '(')buf[ind] = ' ';
      ind = remove_leading_space(buf, 0, BUFFER);
      convert_a2b(buf, &ind, d_buf, &d_ind, &num_bit);     
      strcpy(buf, buf + ind);//remove dummy argument
      ind = remove_leading_space(buf, 0, BUFFER);
      strcpy(buf, buf + ind);//remove hexa indicator
      for(ind = 0; ind < strlen(buf); ind++)
	if(((buf[ind] == '\'') && (buf[ind+1] == 'h')) ||
	   ((buf[ind] == '0')  && (buf[ind+1] == 'x'))) {
	  ind++;
	  strcpy(buf, buf + ind);   
	}
      //get pc value
      ind   = 0;
      addr  = ato_long(buf, &ind);
      strcpy(buf, buf + ind);  
      //what is the event?
      ind = remove_leading_space(buf, 0, BUFFER);
      strcpy(buf, buf + ind);
      type = 0;
      if(strncmp(buf,"printhex", 8) == 0)type = 1;
      if(strncmp(buf,"printdec", 8) == 0)type = 2;
      if(type == 0)continue;//find verilog event only
      strcpy(buf, buf + 8);
      ind  = remove_leading_space(buf, 0, BUFFER);
      strcpy(buf, buf + ind);	
      if(buf[0] == '"'){
	strcpy(buf, buf + 1);//remove the leading "
	//get comments
	for(ind = 0; ind < strlen(buf);ind++)
	  if((buf[ind] != '"') && 
	     (buf[ind] != '\0')&&
	     (buf[ind] != '\n'))d_buf[ind] = buf[ind];
	  else break;
	if(buf[ind] == '\0' || 
	   buf[ind] == '\n' )continue;
	strcpy(buf, buf + ind + 1);//remove the tailing "
	ind = remove_leading_space(buf, 0, BUFFER); 
	strcpy(buf, buf + ind);
      }
      else d_buf[0] = '\0';
      //get register number
      if(buf[0] == '%'){
	switch(buf[1]){
	case('g') :
	  reg = buf[2] & 0x0f;
	  break;
	case('o') :
	  reg =  8 + (buf[2] & 0x0f);
	  break;
	case('l') : 
	  reg = 16 + (buf[2] & 0x0f);
	  break;
	case('i') :
	  reg = 24 + (buf[2] & 0x0f);
	  break;
	default :continue;
	}
      }
      else continue;//no register
      f_val[0].aval.ival[0] = reg;
      f_val[0].bval[0] = type;
      insert_event_node(&(a_tree)->data,  &addr, f_val, d_buf, &size);
    }
  }
}
// /*-------------------------------------------------------------------------------
// create an instance for any needs.
// --------------------------------------------------------------------------------*/
// void create_event_handle_call()
// {
//   avl_conf_ptr a_tree; 
//   FILE *fp;
//   char *str;
// 
//   a_tree = (avl_conf_ptr)malloc(sizeof(struct avl_conf_node));
//   str    = tf_getcstringp(1);  // get a file name.
//   if((fp = fopen(str, "r")) == NULL){
//     tf_error((char *)"Error: cannot open the file %s for reading\n", str);
//     tf_dofinish();
//   }
//   a_tree->data        = 0;
//   a_tree->dram        = 0;//dram
//   get_event(a_tree, fp);
//   tf_putp(0, (unsigned int)a_tree);//reurn handle
//   fclose(fp);
// }
// /*-------------------------------------------------------------------------------
// monitor verilog even and do the proper action when it hits.
// --------------------------------------------------------------------------------*/
// void mon_event_call()
// {
//   long long addr, val;
//   int thread, word, size, groups, low, high;
//   avl_conf_ptr        handle;
//   avl_node_ptr        t_ptr;
//   char* avalPtr;
//   s_tfnodeinfo node_info; 
//   char str;
// 
//   handle = (avl_conf_ptr) tf_getp(1); 
//   // addr   = (unsigned long long)tf_getp(3);
//   low    = tf_getlongp(&high, 3);
//   addr   = high;
//   addr <<= 32;
//   addr  |= low;
//   t_ptr  = search_node(&(handle)->data, &addr);
//   if(t_ptr == 0)return; 
//   //active window.
//   if(t_ptr->val[0].aval.ival[0] < 8)str       = 'g';
//   else if(t_ptr->val[0].aval.ival[0] < 16)str = 'o';
//   else if(t_ptr->val[0].aval.ival[0] < 24)str = 'l';
//   else str= 'i';
//   thread  = tf_getp(2);//get thread
//   size    = (thread << 5) | (t_ptr->val[0].aval.ival[0] & 0x1f);
//   tf_nodeinfo(4, &node_info);
//   word    = node_info.node_ngroups * 2;
//   avalPtr = node_info.node_value.memoryval_p + size * word;
//   val     = 0;
//   for(groups = node_info.node_ngroups - 2; groups >= 0;groups--){
//     val<<= 8;
//     val |= (avalPtr[groups] & 0xff);
//   }
//   switch(t_ptr->val[0].bval[0]){//type
//   case(1):
//     if(t_ptr->comment)io_printf((char *)"%0dInfo:%s reg(%c%d)->val(0x%llx)\n", tf_gettime(), t_ptr->comment, str, 
// 				(t_ptr->val[0].aval.ival[0] & 7), val);
//     else io_printf((char *)"%0dInfo: reg(%c%d)->val(0x%llx)\n", tf_gettime(),  str, 
// 		  (t_ptr->val[0].aval.ival[0] & 7), val);
//     break;
//   case(2):
//     if(t_ptr->comment)io_printf((char *)"%0dInfo:%s reg(%c%d)->val(%lld)\n",   tf_gettime(), t_ptr->comment, str, 
// 				(t_ptr->val[0].aval.ival[0] & 7), val);
//     else io_printf((char *)"%0dInfo: reg(%c%d)->val(%lld)\n",   tf_gettime(), str, 
// 		  (t_ptr->val[0].aval.ival[0] & 7), val);
//     break;
//   }
// }
