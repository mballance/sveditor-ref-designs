#ifndef  _PACKET_TYPE
#define _PACKET_TYPE

#ifdef  __cplusplus
extern "C" {
#endif

typedef struct pgI{
 // L2
  unsigned char l2_sa[6];
  unsigned char l2_da[6];
  int l2_length;
  int type ; // type field

  // L3/L4
  int flow_id ;
  int tpid ;
  int tci ;

  int header_length ;
  int ttl ;
  unsigned char spi[4]; ;
  unsigned char nxthdr ;
  unsigned char tos ;
  unsigned char src_ipv6_addr[16] ;
  unsigned char dst_ipv6_addr[16] ;
  unsigned char src_ip_addr[8] ;
  unsigned char dst_ip_addr[8] ;
  unsigned char src_port[2]  ;
  unsigned char dst_port[2] ;
  unsigned char tcp_flags ;
  unsigned char rcv_isn[4] ;
  int l3_length;
  int l4_length;


  int frame_class ;
  int frame_type;
  // Payload related fields
  int data_type  ;
  int data_seed ;
  int gId ;
  int data_length;

}pgInterface;

#define TOTAL_NUMBER 100

#define DATA_RAND        0
#define DATA_SEQ         1
#define DATA_FC_PAUSE	 4
#define DATA_ALL0        6
#define DATA_ALL1        7
#define DATA_FIXED       8

#ifdef  __cplusplus
}
#endif

#endif  /* _PACKET_TYPE */

