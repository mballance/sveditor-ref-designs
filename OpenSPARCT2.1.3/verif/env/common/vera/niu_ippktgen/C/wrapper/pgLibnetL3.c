#include "include/libnet.h"
#include "include/pg.h"
#include "include/packet.h"

extern unsigned char * genPayload (int data_type, unsigned int seed,
				   int data_length);

int libnet_gen_l3_packet (struct packet_desc *packet_vars, libnet_t *l) {

 libnet_ptag_t t,t1,t2,t3,ipo;
 char *payload;
 u_short payload_s;
 u_long src_ip, dst_ip;
 u_short src_prt, dst_prt;
 u_short options =0;
 int l4_header_length;
 u_short L4Protocol;
 u_char opt[40];
 u_short ip_frag =0;
 int i,no_of_options_bytes;
 u_short  ipv6_nexthdr=0;

 struct libnet_in6_addr ipv6_src_ip;
 struct libnet_in6_addr ipv6_dst_ip;
 int total_length;
 
 if(packet_vars->l3_pkt_type == 0 ) {
   /* NO L4 Processing*/
   return(1);
 }
 if((packet_vars->l2_pkt_type == 0) ){
   printf(" TEST PROGRAM ERROR !! \n");
   return(-1);
 }
 
 if(packet_vars->l3_len) {
   payload = genPayload(packet_vars->payload.data_type,
			packet_vars->payload.data_seed,packet_vars->l3_len);
   payload_s = packet_vars->l3_len;
 }else {
   payload = NULL;
   payload_s = 0;
 }
 
 no_of_options_bytes = 0;
 /* fill up options in case it is needed*/
 for(i=0;i<40; i ++) {
   opt[i] = 0xa0 + i; /*load up options with some value*/
 }	
 no_of_options_bytes = packet_vars->ip.options ;

 if ((packet_vars->l3_pkt_type & L3_PKT_TYPE_IPV4) &&
     (no_of_options_bytes > 0)) {
   printf(" Build IPV4 with options - length - %d \n", no_of_options_bytes);
   ipo = libnet_build_ipv4_options(
				   opt,
				   no_of_options_bytes,
				   l,
				   0);
   if (ipo == -1)
     {
       fprintf(stderr, "Can't build IPV4 options: %s\n", libnet_geterror(l));
       return(-1);
     }
 }
 
 /* Default value for l4_header and L4_protocol*/
 l4_header_length = 0;
 L4Protocol = 0;
 
 /*Determine L4Protocol field based upon input*/
 if(packet_vars->l4_pkt_type & L4_PKT_TYPE_TCP) {
   l4_header_length = LIBNET_TCP_H;
   L4Protocol = IPPROTO_TCP;
 } else if(packet_vars->l4_pkt_type & L4_PKT_TYPE_UDP) {
   l4_header_length = LIBNET_UDP_H;
   L4Protocol = IPPROTO_UDP;
 } else if(packet_vars->l4_pkt_type & L4_PKT_TYPE_SCTP) {
   l4_header_length = LIBNET_SCTP_H;
   L4Protocol = IPPROTO_SCTP;
 } else if(packet_vars->l4_pkt_type & L4_PKT_TYPE_AH) {
   l4_header_length = LIBNET_IPSEC_AH_H;
   L4Protocol = IPPROTO_AH;
 } else if(packet_vars->l4_pkt_type & L4_PKT_TYPE_ESP) {
   l4_header_length = LIBNET_IPSEC_ESP_HDR_H;
   L4Protocol = IPPROTO_ESP;
 } else if(packet_vars->l4_pkt_type & L4_PKT_TYPE_ICMP) {
   if(packet_vars->l3_pkt_type & L3_PKT_TYPE_IPV4) {
     l4_header_length = LIBNET_ICMPV4_H;
     L4Protocol = IPPROTO_ICMP;
   } else if(packet_vars->l3_pkt_type & L3_PKT_TYPE_IPV6) {
     l4_header_length = LIBNET_ICMPV6_H;
     L4Protocol = IPPROTO_ICMP6;
   } else {
     fprintf(stderr, "Incompatible L3 protocol type for ICMP\n");
     return(-1);
   }
 } else if(packet_vars->l4_pkt_type & L4_PKT_TYPE_IGMP) {
   l4_header_length = LIBNET_IGMP_H;
   L4Protocol = IPPROTO_IGMP;
 } else if(packet_vars->l4_pkt_type & L4_PKT_TYPE_PIM) {
   l4_header_length = LIBNET_PIM_H;
   L4Protocol = IPPROTO_PIM;
 } else if(packet_vars->l4_pkt_type & L4_PKT_TYPE_RSVP) {
   l4_header_length = LIBNET_RSVP_H;
   L4Protocol = IPPROTO_RSVP;
 } else if((packet_vars->l4_pkt_type & L4_PKT_TYPE_GRE) ||
	   (packet_vars->l4_pkt_type & L4_PKT_TYPE_EGRE)) {
   l4_header_length = LIBNET_GRE_H;
   L4Protocol = IPPROTO_GRE;
 } else {/* MORE TO BE ADDED */}

 // if user wants to override the protocol chosen for error condition 
 //
  if( ( packet_vars->payload.error_code & PG_L4_PROTO_USER_MODE) ) 
     L4Protocol = packet_vars->ip.proto;
 
 printf("L4PktType - %x L4Protocol Chosen as - 0x%x \n",
	packet_vars->l4_pkt_type,L4Protocol);
  
 if ((packet_vars->l3_pkt_type & L3_PKT_TYPE_FRAG) &&
     (packet_vars->l3_pkt_type & L3_PKT_TYPE_IPV4)) {
   ip_frag = packet_vars->ip.frag; /* NO SURE WHAT TO CHOOSE TBD */ 
 } else ip_frag = 0;


 if(packet_vars->l3_pkt_type & L3_PKT_TYPE_IPV4) {
   
   printf(" BUILDING L3Packet -\n");
   t1 = libnet_build_ipv4(
			  LIBNET_IPV4_H + l4_header_length + no_of_options_bytes +  packet_vars->l4_len +  payload_s,/* length */
			  packet_vars->ip.tos,                                          /* TOS */
			  242,                                        /* IP ID */
			  ip_frag,    				      /* IP Frag */
			  64,                                         /* TTL */
			  L4Protocol,                                 /* protocol */
			  0x0,                                        /* checksum */
			  packet_vars->ip.src_addr,                    /* source IP */
			  packet_vars->ip.dst_addr,                    /* destination IP */
			  payload,                                    /* payload */
			  payload_s,                                  /* payload size */
			  l,                                          /* libnet handle */
			  0);                                         /* libnet id */
   
   if (t1 == -1)
     {
       fprintf(stderr, "Can't build IPV4 header: %s\n", libnet_geterror(l));
       return(-1);
     }
 } else if (packet_vars->l3_pkt_type & L3_PKT_TYPE_IPV6) {
   /* Begin addition */
   /* Need variable nh, ipv6FragId to be supported */
   /* This is an extension header, the first header must have been formed first */
#if 0
   if( (packet_vars->l3_pkt_type & L3_PKT_TYPE_IPV6) &&
       (no_of_options_bytes > 0)){
     printf(" Build IPV6 with options - length - %d \n", no_of_options_bytes);
     /* This needs new src to be cloned in the libnet */
     ipo = libnet_build_ipv6_options(0,	/* ot  */
				     no_of_options_bytes, /* ip_ol */
				     opt,		 /* ip_od */
				     NULL,
				     0,
				     l,
				     0);
     if (ipo == -1)
       {
	 fprintf(stderr, "Can't build IPV6 options: %s\n", libnet_geterror(l));
	 return(-1);
       }
   } /*end ipv6_options*/
#endif
#if 0  
   /* This is an extension header, the first header must have been formed first */
   if(packet_vars->l3_pkt_type & L3_PKT_TYPE_FRAG) {
     printf(" Build IPV6 with fragment \n");
     ipo = libnet_build_ipv6_frag(packet_vars->ipv6.nexthdr,
				  0, /* ip_nh (toberesolved), reserved  */
				  1, /* fragment */
				  packet_vars->ipv6.ipv6FragId, /* ip_id (toberesolved)*/
				  NULL, /* payload */
				  0, /* payload */
				  l,
				  0);
     if (ipo == -1)
       {
	 fprintf(stderr, "Can't build IPV6 fragment : %s\n", libnet_geterror(l));
	 return(-1);
       }
     
   } /*end  ipv6_frag*/
#endif

   if(packet_vars->l3_pkt_type & L3_PKT_TYPE_IPV6) {
     printf(" Build IPV6 first header \n");
     /* toberesolved. this needs to be a function - depending on whether there is extension header following. This assumes no ext hdr */
     total_length = l4_header_length + no_of_options_bytes + 
       packet_vars->l4_len +  payload_s;

     // Override from TEST if set to 0xff - 
     if(ipv6_nexthdr != 0xff) {
      ipv6_nexthdr = L4Protocol;
     } else ipv6_nexthdr = packet_vars->ipv6.nexthdr;

     for(i=0;i<16;i++) {
       ipv6_src_ip.libnet_s6_addr[i] = packet_vars->ipv6.src_addr[i];
       ipv6_dst_ip.libnet_s6_addr[i] = packet_vars->ipv6.dst_addr[i];
     }
     ipo = libnet_build_ipv6(
			     packet_vars->ipv6.tc,
			     0,
			     total_length,
			     ipv6_nexthdr,
			     64,
			     ipv6_src_ip,
			     ipv6_dst_ip,
			     payload,
			     payload_s,
			     l,
			     0);
     if (ipo == -1)
       {
	 fprintf(stderr, "Can't build IPV6: %s\n", libnet_geterror(l));
	 return(-1);
       }
   } /*end first ipv6 header*/
} else {/*??*/
  printf(" UNSUPPORTED PROTOCOL !! \n");
  return(-1);
}

return(1);
}

