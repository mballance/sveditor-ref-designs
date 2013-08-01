#include <stdio.h>
#include "vera_directc.h"

// #if (HAVE_CONFIG_H)
  // #include "../include/config.h"
// #endif
// #include "./libnet_test.h"

#include "include/libnet.h"

#include "include/vera_flow_vars.h"
#include "include/packet.h"

#define FLOW_SIZE 200
#define SIZE_OF_PKT_FIELDS 8

extern void uChartoVec32(  char *in, int size, vec32** s);
extern void uInttoVec32(  unsigned int *in, int size, vec32 **s) ;

extern void Vec32touChar ( char *in, int size, vec32 **s);
extern char * libnet_call(struct packet_desc *packet_vars, u_int32_t *len);
extern unsigned int * getPktFields(struct packet_desc  *packet_vars) ;

uint8_t decode_old_type( uint8_t frame_type, uint8_t frame_class, uint8_t layer ) {
  uint8_t returnval;
  
  returnval = 0;
  // L4 Decodes
       if(layer==4) {
	 
	 if( (frame_class == PKTGEN_CL_TCP)       || (frame_class == PKTGEN_CL_TCP_FRAG ) ||
	     (frame_class == PKTGEN_CL_TCP_OPT  ) || (frame_class == PKTGEN_CL_TCP_IP_V6)) {
	   returnval = L4_PKT_TYPE_TCP;
	 } 
	 else if(  (frame_class == PKTGEN_CL_UDP)        || (frame_class == PKTGEN_CL_UDP_FRAG )  ||
		   (frame_class == PKTGEN_CL_UDP_OPT)    || (frame_class == PKTGEN_CL_UDP_IP_V6)) {
	   returnval = L4_PKT_TYPE_UDP;
	 } 
	 else if(  (frame_class == PKTGEN_CL_SCTP)       || (frame_class == PKTGEN_CL_SCTP_FRAG)  ||
		   (frame_class == PKTGEN_CL_SCTP_OPT)   || (frame_class == PKTGEN_CL_SCTP_IP_V6)) {
	   returnval = L4_PKT_TYPE_SCTP;
	 } 
	 else if(  (frame_class == PKTGEN_CL_IP_SEC_AH)    || (frame_class == PKTGEN_CL_IP_V6_SEC_AH)) {
	   returnval = L4_PKT_TYPE_AH;
	 } 
	 else if(  (frame_class == PKTGEN_CL_IP_SEC_ESP)   || (frame_class == PKTGEN_CL_IP_V6_SEC_ESP)) {
	   returnval = L4_PKT_TYPE_ESP;
	 } 
	 else {
	   /* TO BE DONE*/
	 }
	 
       }
  // L3 Decodes
       if(layer==3) {
	 if((frame_type&0x2) && ( frame_type & 0x8)) {
	   returnval = L3_PKT_TYPE_IPV6;
	 } else if( (frame_type&0x2)) {
	   returnval = L3_PKT_TYPE_IPV4;
	 } 

	 if( (frame_class == PKTGEN_CL_TCP_FRAG)  || (frame_class == PKTGEN_CL_UDP_FRAG)  || (frame_class == PKTGEN_CL_SCTP_FRAG)) {
	   returnval = returnval | L3_PKT_TYPE_FRAG;
	 }

	 // Add more code here for FRAG, OPTions
	// returnval = returnval | L3_PKT_TYPE_OPT
	// returnval = returnval | L3_PKT_TYPE_FRAG
	      }

  // L2 Decodes
       if(layer==2) {
	 returnval = L2_PKT;
	 if((frame_type&0x4)) {
	   returnval = returnval | L2_PKT_TYPE_TAGGED; 
	 }
	 if((frame_type&0x1)) {
	   returnval = returnval | L2_PKT_TYPE_LLCSNAP; 
	 }
	 if(frame_class == PKTGEN_CL_ARP) {
	   returnval = returnval | L2_PKT_TYPE_ARP;
	 }
	 if(frame_class == PKTGEN_CL_RARP) {
	   returnval = returnval | L2_PKT_TYPE_RARP;
	 }
	 if(frame_class == PKTGEN_CL_RUNT) {
	   returnval= L2_RUNT;
	 }
	 // Add more code here for other l2 types
	 

	      }
  return(returnval);


}

unsigned int * getPktFields(struct packet_desc  *packet_vars) {
// This is to be used by the vera-pktgen to figure out the various fields calculated by 
// C pktgen
//
  unsigned int * pkt_fields;
  pkt_fields = ( unsigned int * ) malloc(SIZE_OF_PKT_FIELDS*(sizeof(unsigned int)));
  pkt_fields[L2_PAYLOAD_LENGTH] = packet_vars->l2_len;
  pkt_fields[L2_HDR_LENGTH] = packet_vars->l2_hdr;
  pkt_fields[L3_PAYLOAD_LENGTH] = packet_vars->l3_len;
  pkt_fields[L3_HDR_LENGTH] = packet_vars->l3_hdr;
  pkt_fields[L4_PAYLOAD_LENGTH] = packet_vars->l4_len;
  pkt_fields[L4_HDR_LENGTH] = packet_vars->l4_hdr;

  return(pkt_fields);

}

struct packet_desc parseVeraflowVars (unsigned char * flow)  {
  int i;
  struct packet_desc packet_vars;
  int l2_headers, l3_headers, l4_headers;

  memset(&packet_vars, 0, sizeof (struct packet_desc));



  packet_vars.frame_type = flow[FRAME_TYPE_INDEX] ;
  packet_vars.frame_class = flow[FRAME_CLASS_INDEX] ;

  for(i = 0;i< L2_DA_SIZE ;i++) {
    packet_vars.ether.dst_addr[L2_DA_SIZE -1 -i]=  flow[L2_DA_INDEX + i];
    // printf(" C Index - %d value - %x \n",L2_DA_INDEX + i,flow[L2_DA_INDEX + i]);
  }

  for(i = 0;i<  L2_SA_SIZE;i++) {
    packet_vars.ether.src_addr[L2_SA_SIZE -1 -i] = flow[L2_SA_INDEX + i];
    // printf(" C Index - %d value - %x \n",L2_SA_INDEX + i,flow[L2_SA_INDEX + i]);
  }

  packet_vars.ether.vlan_id = 0;
  for(i = 0;i<  TPID_SIZE;i++) 
    packet_vars.ether.vlan_id = (flow[TPID_INDEX + i] << (i*8)) | (  packet_vars.ether.vlan_id );
   
  packet_vars.ether.tci = 0;
  for(i = 0;i<  TCI_SIZE;i++) 
    packet_vars.ether.tci = (flow[TCI_INDEX + i] << (i*8)) | (  packet_vars.ether.tci);

  packet_vars.ip.options = flow[IP_OPTION_INDEX];
  

  packet_vars.ip.frag = 0;//default 0x0;
  for(i = 0;i<  IP_FRAG_SIZE ;i++)
   packet_vars.ip.frag = (flow[ IP_FRAG_INDEX+ i] << (i*8)) | ( packet_vars.ip.frag);

  packet_vars.ip.src_addr = 0;
  for(i = 0;i<  IPV4_SRC_ADDR_SIZE;i++) 
    packet_vars.ip.src_addr = (flow [IPV4_SRC_ADDR_INDEX + i] << (i*8)) | (packet_vars.ip.src_addr );

  packet_vars.ip.dst_addr = 0;
  for(i = 0;i<  IPV4_DST_ADDR_SIZE;i++) 
    packet_vars.ip.dst_addr = (flow[IPV4_DST_ADDR_INDEX + i] << (i*8))| ( packet_vars.ip.dst_addr );

  packet_vars.tcp.src_port = 0;
  packet_vars.udp.src_port = 0;
  for(i = 0;i<  IPV4_SRC_PRT_SIZE;i++) {
    packet_vars.tcp.src_port = (flow[IPV4_SRC_PRT_INDEX + i] << (i*8)) | ( packet_vars.tcp.src_port ) ;
    packet_vars.udp.src_port = (flow[IPV4_SRC_PRT_INDEX + i] << (i*8)) | ( packet_vars.udp.src_port ) ;
  }

  packet_vars.tcp.dst_port = 0;
  packet_vars.udp.dst_port = 0;
  for(i = 0;i<  IPV4_DST_PRT_SIZE;i++) {
    packet_vars.tcp.dst_port = (flow[IPV4_DST_PRT_INDEX + i] << (i*8)) | ( packet_vars.tcp.dst_port );
    packet_vars.udp.dst_port = (flow[IPV4_DST_PRT_INDEX + i] << (i*8)) | ( packet_vars.udp.dst_port );
  }

  packet_vars.tcp.tcp_flags = flow[TCP_FLAGS_INDEX];

  packet_vars.ipsec_ah.spi = 0;
  for(i = 0;i<  SPI_SIZE;i++) 
    packet_vars.ipsec_ah.spi = (flow[SPI_INDEX + i] << (i*8)) | ( packet_vars.ipsec_ah.spi );

  packet_vars.ipsec_ah.seq = 0;
  for(i = 0;i<  ESP_AH_SEQ_NO_SIZE;i++) 
    packet_vars.ipsec_ah.seq = (flow[ESP_AH_SEQ_NO_INDEX + i] << (i*8)) | ( packet_vars.ipsec_ah.seq );

  for(i = 0;i<  IPV6_SRC_ADDR_SIZE;i++)
   packet_vars.ipv6.src_addr[IPV6_SRC_ADDR_SIZE - i -1] = flow[IPV6_SRC_ADDR_INDEX + i];

  for(i = 0;i<  IPV6_DST_ADDR_SIZE;i++) {
   packet_vars.ipv6.dst_addr[IPV6_DST_ADDR_SIZE - i - 1] = flow[IPV6_DST_ADDR_INDEX + i];
   // printf(" Index - %d Vera Value - %x  C Value - %x \n",IPV6_DST_ADDR_INDEX + i,flow[IPV6_DST_ADDR_INDEX + i], packet_vars.ipv6.dst_addr[IPV6_DST_ADDR_SIZE - i - 1]);
  }
  // Old packet gen uses the TOS field for traffic class in case of Ipv6
  packet_vars.ip.tos = flow[TOS_INDEX];
  packet_vars.ipv6.tc = flow[TOS_INDEX];
  // printf("Index - %d Tos - %x \n",TOS_INDEX,packet_vars.ipv6.tc);


  // To OverWrite from test
   packet_vars.ipv6.nexthdr = flow[IPV6_NXT_HDR ] ;
   packet_vars.ipv6.nexthdr = 0xff; // Remove this later


  packet_vars.tcp.seq_no = 0;
  for(i = 0;i<  TCP_SEQ_NO_SIZE;i++) {
    packet_vars.tcp.seq_no = (flow[TCP_SEQ_NO_INDEX + i] << (i*8)) | ( packet_vars.tcp.seq_no );
  }
  packet_vars.tcp.ack_no = 0;
  // Need more parameters for ipsec_ah packets

// packet_vars.tcp.seq_no = 0x00190114;
  // packet_vars.tcp.ack_no = 0x00000014;


  /*sctp*/
  packet_vars.sctp.vtag = 0;
  for(i = 0;i<  SCTP_VTAG_SIZE;i++) 
    packet_vars.sctp.vtag  = (flow[SCTP_VTAG_INDEX + i] << (i*8)) | ( packet_vars.sctp.vtag  );

  packet_vars.sctp.src_port = 0;
  for(i = 0;i<  SCTP_SRC_PRT_SIZE;i++) {
    packet_vars.sctp.src_port = (flow[SCTP_SRC_PRT_INDEX + i] << (i*8)) | ( packet_vars.sctp.src_port );
  }
  packet_vars.sctp.dst_port = 0;
  for(i = 0;i<  SCTP_DST_PRT_SIZE;i++) {
    packet_vars.sctp.dst_port = (flow[SCTP_DST_PRT_INDEX + i] << (i*8)) | ( packet_vars.sctp.dst_port );
  }
  packet_vars.sctp.checksum = 0;


  packet_vars.payload.data_length = 0;
  for(i = 0;i<  DATA_LENGTH_SIZE ;i++)
    packet_vars.payload.data_length = (flow[DATA_LENGTH_INDEX + i] << (i*8)) | ( packet_vars.payload.data_length );

  // printf(" Data Length in C - %d \n",packet_vars.payload.data_length);
  // printf(" Flow in C - %x %x \n",flow[DATA_LENGTH_INDEX +0],flow[DATA_LENGTH_INDEX +1]);

  packet_vars.payload.l2_pad_length = 0;
  for(i = 0;i< L2_PAD_LENGTH_SIZE ;i++)
    packet_vars.payload.l2_pad_length = (flow[L2_PAD_LENGTH_INDEX + i] << (i*8)) | ( packet_vars.payload.l2_pad_length );

  // printf(" PAD Length in C - %d \n",packet_vars.payload.l2_pad_length);
    // printf(" Index - %d %d, Value - %x %x\n",L2_PAD_LENGTH_INDEX,L2_PAD_LENGTH_INDEX + 1,flow[L2_PAD_LENGTH_INDEX + 0],flow[L2_PAD_LENGTH_INDEX + 1]); 
  // packet_vars.payload.data_seed = 0x03020100;
  // packet_vars.payload.data_type = 0x1;
    packet_vars.payload.data_type = flow[DATA_TYPE_INDEX]&0xff;
  packet_vars.payload.data_seed = 0;
  for(i = 0;i<  DATA_SEED_SIZE ;i++)
    packet_vars.payload.data_seed = (flow[DATA_SEED_INDEX + i] << (i*8)) | ( packet_vars.payload.data_seed );
  // printf("DataSeed - %x Data Type - %d \n",packet_vars.payload.data_seed,packet_vars.payload.data_type);
     

  packet_vars.payload.error_code = 0;
  for(i = 0;i<  DATA_ERR_CODE_SIZE ;i++) {
    packet_vars.payload.error_code = (flow[DATA_ERR_CODE_INDEX + i] << (i*8)) | ( packet_vars.payload.error_code );
    // printf("Index - %d Value - %d \n",DATA_ERR_CODE_INDEX + i, flow[DATA_ERR_CODE_INDEX + i]);
  }

  packet_vars.payload.error_data = 0;
  for(i = 0;i<  DATA_ERR_DATA_SIZE ;i++)
    packet_vars.payload.error_data = (flow[DATA_ERR_DATA_INDEX + i] << (i*8)) | ( packet_vars.payload.error_data );
  // printf("ErrorCode - %x ErrorData - %x \n",packet_vars.payload.error_code,packet_vars.payload.error_data);


  // check for any checksum error injection from the test,if so change it here
  if( ( packet_vars.payload.error_code & PG_CHKSUM_USER_MODE) ) {
   packet_vars.udp.checksum = packet_vars.payload.error_data&0xffff;
   packet_vars.tcp.checksum = packet_vars.payload.error_data&0xffff;
  } else if(packet_vars.payload.error_code & PG_CHKSUM_ERR ){
   //packet_vars.udp.checksum = 0xdead;
   //packet_vars.tcp.checksum = 0xbeef;
   packet_vars.udp.checksum = 0;
   packet_vars.tcp.checksum = 0;
  } else {
   packet_vars.udp.checksum = 0;
   packet_vars.tcp.checksum = 0;
  }

  packet_vars.ip.proto = flow[L4_PROTO_ERR_INDEX] ;

  packet_vars.l4_pkt_type = 0;
  packet_vars.l3_pkt_type = 0;
  packet_vars.l2_pkt_type = 0;
  // To maintain compatibility with old pktgen
       packet_vars.l4_pkt_type = decode_old_type(packet_vars.frame_type, packet_vars.frame_class,4);
  packet_vars.l3_pkt_type = decode_old_type(packet_vars.frame_type, packet_vars.frame_class,3);
  packet_vars.l2_pkt_type = decode_old_type(packet_vars.frame_type, packet_vars.frame_class,2);

  //  Set various lengths - in case of total frame length being specified 
	
  if(packet_vars.l2_pkt_type) {
    l2_headers = 0;
    if(packet_vars.l2_pkt_type & L2_PKT_TYPE_LLCSNAP) {
      l2_headers +=LIBNET_802_2SNAP_H;
    } 
   if(packet_vars.l2_pkt_type & L2_PKT_TYPE_TAGGED) {
      l2_headers += 4;
    }
   l2_headers+= LIBNET_ETH_H;
   packet_vars.l2_len = packet_vars.payload.data_length - 4 - l2_headers;
  } else packet_vars.l2_len = 0;

  /* Fix for ARP, RARP Packets */
  /* Old Pktgen seems to harcode values for various fields with the ARP, RARP packets
   * These fields needs to be controlled by the tests. In the absence of that, these
   * fields are being set to some random value- untell they are tied to through the tests*/
   if(packet_vars.l2_pkt_type & L2_PKT_TYPE_ARP) {
      packet_vars.l3_pkt_type = 0;
      packet_vars.l2_len = packet_vars.payload.data_length - 4 - LIBNET_ARP_ETH_IP_H -l2_headers;
   }
   if(packet_vars.l2_pkt_type & L2_PKT_TYPE_RARP) {
      packet_vars.l3_pkt_type = 0;
      packet_vars.l2_len = packet_vars.payload.data_length - 4  -LIBNET_ARP_ETH_IP_H  -l2_headers;
   }
   packet_vars.arp.hw_type =0;
  for(i = 0;i<  ARP_HW_TYPE_SIZE ;i++)
    packet_vars.arp.hw_type = (flow[ARP_HW_TYPE_INDEX + i] << (i*8)) | ( packet_vars.arp.hw_type);

  packet_vars.arp.proto_type = 0x0; // default - 0x0800
  for(i = 0;i<  ARP_PROTO_TYPE_SIZE ;i++)
    packet_vars.arp.proto_type = (flow[ARP_PROTO_TYPE_INDEX + i] << (i*8)) | ( packet_vars.arp.proto_type);

  packet_vars.arp.hw_len = flow[ARP_HW_LEN_INDEX]&0xff;// default 0x6;
  packet_vars.arp.proto_len = flow[ARP_PROTO_LEN_INDEX]&0xff;//default 0x4;

  packet_vars.arp.op_code = 0;//default 0x1;
  for(i = 0;i<  ARP_PROTO_TYPE_SIZE ;i++)
   packet_vars.arp.op_code = (flow[ ARP_OPCODE_INDEX+ i] << (i*8)) | ( packet_vars.arp.op_code);

  /* Various Address fields in the Arp Packet */
  for(i=0;i<ARP_SRC_ADDR_SIZE;i++)  {
   packet_vars.arp.src_ha[ARP_SRC_ADDR_SIZE - 1 - i] = flow[ARP_SRC_ADDR_INDEX + i] ;
   packet_vars.arp.tgt_ha[ARP_SRC_ADDR_SIZE - 1 - i] = flow[ARP_TGT_ADDR_INDEX + i] ;
  }
  for(i=0;i<ARP_SRCIP_ADDR_SIZE;i++) {
   packet_vars.arp.src_ip[ARP_SRCIP_ADDR_SIZE - 1 -i] = flow[ARP_SRCIP_ADDR_INDEX + i] ;
   packet_vars.arp.tgt_ip[ARP_SRCIP_ADDR_SIZE - 1 -i] = flow[ARP_TGTIP_ADDR_INDEX + i] ;
  }



  if(packet_vars.l3_pkt_type) {
    if( packet_vars.l3_pkt_type & L3_PKT_TYPE_IPV4) {
      l3_headers = LIBNET_IPV4_H + packet_vars.ip.options;	
      packet_vars.l3_len = packet_vars.payload.data_length - 4 - l2_headers  - l3_headers;
    } else if(packet_vars.l3_pkt_type & L3_PKT_TYPE_IPV6) {
      l3_headers = LIBNET_IPV6_H + packet_vars.ip.options;	
      packet_vars.l3_len = packet_vars.payload.data_length - 4 - l2_headers  - l3_headers;
    }
    packet_vars.l2_len = 0;

#if 0
    // old code!!
    // choose the fragment bits and offset
	 if(packet_vars.l3_pkt_type & L3_PKT_TYPE_FRAG) {
	   packet_vars.ip.frag = 0; // NO SURE WHAT TO CHOOSE
	   packet_vars.ip.frag  = 0x20fa;
	 }
#endif
  } else packet_vars.l3_len = 0;
   
  if(packet_vars.l4_pkt_type) {
    if(packet_vars.l4_pkt_type & L4_PKT_TYPE_TCP) {
      l4_headers = LIBNET_TCP_H;
      packet_vars.l4_len = packet_vars.payload.data_length - 4 - l2_headers - l3_headers - l4_headers;
    } else if(packet_vars.l4_pkt_type & L4_PKT_TYPE_UDP) {
      l4_headers = LIBNET_UDP_H;
      packet_vars.l4_len = packet_vars.payload.data_length - 4 - l2_headers  - l3_headers - l4_headers;
    } else if(packet_vars.l4_pkt_type & L4_PKT_TYPE_AH) {
      l4_headers = LIBNET_IPSEC_AH_H;
      packet_vars.l4_len = packet_vars.payload.data_length - 4 - l2_headers  - l3_headers - l4_headers;
    } else if(packet_vars.l4_pkt_type & L4_PKT_TYPE_ESP) {
      l4_headers = LIBNET_IPSEC_ESP_HDR_H;
      packet_vars.l4_len = packet_vars.payload.data_length - 4 - l2_headers  - l3_headers - l4_headers;
    } else if(packet_vars.l4_pkt_type & L4_PKT_TYPE_SCTP) {
      l4_headers = LIBNET_SCTP_H;
      packet_vars.l4_len = packet_vars.payload.data_length - 4 - l2_headers  - l3_headers - l4_headers;
    } else {}
    packet_vars.l3_len = 0;
    packet_vars.l2_len = 0;
  } else {
    packet_vars.l4_len  = 0;
  }
    packet_vars.l2_hdr  = l2_headers;
    packet_vars.l3_hdr  = l3_headers;
    packet_vars.l4_hdr  = l4_headers;
   
  // printf(" L4 Length Set to %d \n",packet_vars.l4_len);

  return(packet_vars);


}
void genCPacket ( int index, vec32** flow_vars, vec32** s, vec32** p ) {
  char * data;
  struct packet_desc packet_vars;
  u_int32_t pktlen=0;
  unsigned char *flow;
  unsigned int *pkt_fields;

  flow = (unsigned char *) malloc(FLOW_SIZE*sizeof(unsigned char));

  Vec32touChar(flow,FLOW_SIZE/*CHOOSE CORRECT SIZE*/ ,flow_vars);
  packet_vars = parseVeraflowVars(flow);


  pkt_fields = getPktFields(&packet_vars);
  uInttoVec32(pkt_fields ,SIZE_OF_PKT_FIELDS ,p);

  // Parse flow_vars and populate struct for libnet
    // generate packet through libnet, return it to vera
  // check for user error!!
  if( (packet_vars.l4_len<0) | (packet_vars.l3_len<0) |(packet_vars.l2_len<0)){
   printf("USER ERROR!!! payload length set to be less than 0!! \n");
  } else {
    data = libnet_call(&packet_vars,  &pktlen);
    uChartoVec32(data ,/*packet_vars.l2_len*/pktlen ,s);
  }

}


