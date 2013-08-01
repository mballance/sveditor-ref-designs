#include "include/libnet.h"
#include "include/pg.h"
#include "include/packet.h"


extern unsigned char * genPayload (int data_type, unsigned int seed,
				   int data_length);

uint16_t libnet_get_ethernet_proto(struct packet_desc *packet_vars) {

        uint16_t proto = 0;

	if (packet_vars->l3_pkt_type) {
		if (packet_vars->l3_pkt_type & L3_PKT_TYPE_IPV4) {
			proto = ETHERTYPE_IP;
		} else if (packet_vars->l3_pkt_type & L3_PKT_TYPE_IPV6) {
			proto = ETHERTYPE_IPV6;
		} else {
			proto = 0;
		}
	} else if (packet_vars->l2_pkt_type & L2_PKT_TYPE_ARP) {
		proto = ETHERTYPE_ARP;
	} else if (packet_vars->l2_pkt_type & L2_PKT_TYPE_RARP) {
		proto = ETHERTYPE_REVARP;
#if 0	/* Needs to be implemented to support user defined frame types */
	} else if (packet_vars->ether.proto) {
		frame_type = packet_vars->ether.proto;
#endif
	}

	return (proto);
}

int libnet_gen_l4_packet( struct packet_desc *packet_vars, libnet_t *l ) {
  
  libnet_ptag_t t;
  char *payload;
  u_short payload_s;
  u_long src_ip, dst_ip;
  u_short src_prt, dst_prt;
  u_short options = 0;

  if (packet_vars->l4_pkt_type == 0) {
    /* NO L4 Processing*/
    return(1);
  }
  if ((packet_vars->l3_pkt_type == 0) || (packet_vars->l2_pkt_type == 0)) {
    printf(" TEST PROGRAM ERROR !! \n");
    return(-1);
  }
#if 0
  if( /*TCP_OPTIONS*/) {
    // Add code here
	 }
#endif
  payload = genPayload(packet_vars->payload.data_type,
		       packet_vars->payload.data_seed,packet_vars->l4_len);
  payload_s = packet_vars->l4_len;

  if (packet_vars->l4_pkt_type & L4_PKT_TYPE_TCP) { 
    printf(" Building TCP Packet!! \n");
    t = libnet_build_tcp(
			 packet_vars->tcp.src_port, /* source port */
			 packet_vars->tcp.dst_port, /* destination port */
			 packet_vars->tcp.seq_no, /* sequence number */
			 packet_vars->tcp.ack_no, /* acknowledgement num */
			 packet_vars->tcp.tcp_flags, /* control flags */
			 0, /* window size */
			 packet_vars->tcp.checksum, /* checksum */
			 0, /* urgent pointer */
			 LIBNET_TCP_H + options + payload_s, /* TCP packet size */
			 payload, /* payload */
			 payload_s, /* payload size */
			 l, /* libnet handle */
			 0); /* libnet id */

    if (t == -1)
      {
 	fprintf(stderr, "Can't build TCP header: %s\n", libnet_geterror(l));
	return(-1);
      }

  } else if (packet_vars->l4_pkt_type & L4_PKT_TYPE_UDP) {

    printf(" Building UDP Packet!! \n");
    t = libnet_build_udp(
			  packet_vars->udp.src_port, /* source port */
			  packet_vars->udp.dst_port , /* destination port */
			  LIBNET_UDP_H + payload_s, /* packet length */
			  packet_vars->udp.checksum, /* checksum */
			  payload, /* payload */
			  payload_s, /* payload size */
			  l, /* libnet handle */
			  0); /* libnet id */
    if (t == -1)
      {
	fprintf(stderr, "Can't build UDP header: %s\n", libnet_geterror(l));
	return(-1);
      }

  } else if (packet_vars->l4_pkt_type & L4_PKT_TYPE_AH) {
    printf(" Building AH Packet!! \n");
    packet_vars->ipsec_ah.nh = 0;
    packet_vars->ipsec_ah.len = 
      packet_vars->ipsec_ah.res = 0;
    packet_vars->ipsec_ah.auth = 0xa5a5a5a5; 

    t = libnet_build_ipsec_ah(   	
			      packet_vars->ipsec_ah.nh,
			      packet_vars->ipsec_ah.len,
			      packet_vars->ipsec_ah.res,
			      packet_vars->ipsec_ah.spi,
			      packet_vars->ipsec_ah.seq,
			      packet_vars->ipsec_ah.auth,
			      payload,
			      payload_s,
			      l,
			      0);
    if (t == -1)
      {
	fprintf(stderr, "Can't build IPSEC_AH header: %s\n",
		libnet_geterror(l));
	return(-1);
      }

  } else if (packet_vars->l4_pkt_type & L4_PKT_TYPE_ESP) {
    printf(" Building ESP Packet!! \n");
    t = libnet_build_ipsec_esp_hdr(   
				   packet_vars->ipsec_ah.spi,
			           packet_vars->ipsec_ah.seq,
				   0xa5a5a5a5, // TMP - not sure what can be used here
				   payload,
				   payload_s,
				   l,
				   0);
    if (t == -1) {
	fprintf(stderr, "Can't build IPSEC_ESP header: %s\n",
		libnet_geterror(l));
	return(-1);
      }
   } else if (packet_vars->l4_pkt_type & L4_PKT_TYPE_SCTP) {
     printf("---Building SCTP packet\n");
     t = libnet_build_sctp(
			    packet_vars->sctp.src_port, /* source port */
			    packet_vars->sctp.dst_port, /* dest port */
			    packet_vars->sctp.vtag, /* verification tag */
			    packet_vars->sctp.checksum, /* checksum */
			    payload, /* payload */
			    payload_s, /* payload size */
			    l, /* libnet handle */
			    0); /* libnet id */
     if (t == -1) {
       fprintf(stderr, "Can't build SCTP header: %s\n", libnet_geterror(l));
       return(-1);
     }
   } else if (packet_vars->l4_pkt_type & L4_PKT_TYPE_ICMP) {
     u_int8_t icmp_type;

     if (packet_vars->l3_pkt_type & L3_PKT_TYPE_IPV4) {
       if (packet_vars->icmp.type == ICMP_TYPE_ECHO_REQ) {
	 icmp_type = ICMP_ECHO;
       } else if (packet_vars->icmp.type == ICMP_TYPE_ECHO_REPLY) {
	 icmp_type = ICMP_ECHOREPLY;
       } else {
	 fprintf(stderr, "Unsupported ICMP type: %d\n", packet_vars->icmp.type);
	 return(-1);
       }
       printf("---Building ICMPv4 packet\n");
     } else if (packet_vars->l3_pkt_type & L3_PKT_TYPE_IPV6) {
       if (packet_vars->icmp.type == ICMP_TYPE_ECHO_REQ) {
	 icmp_type = ICMP6_ECHO;
       } else if (packet_vars->icmp.type == ICMP_TYPE_ECHO_REPLY) {
	 icmp_type = ICMP6_ECHOREPLY;
       } else {
	 fprintf(stderr, "Unsupported ICMP type: %d\n", packet_vars->icmp.type);
	 return(-1);
       }
       printf("---Building ICMPv6 packet\n");
     } else {
       fprintf(stderr, "Unsupported L3 type %d for ICMP\n",
	       packet_vars->l3_pkt_type);
       return(-1);
     }

     t = libnet_build_icmpv4_echo(
				   icmp_type, /* type */
				   0, /* code */
				   packet_vars->icmp.checksum, /* checksum */
				   packet_vars->icmp.id, /* id */
				   packet_vars->icmp.seq, /* sequence number */
				   payload, /* payload */
				   payload_s, /* payload size */
				   l, /* libnet handle */
				   0); /* libnet id */
     if (t == -1) {
       fprintf(stderr, "Can't build ICMP header: %s\n", libnet_geterror(l));
       return(-1);
     }
   } else if (packet_vars->l4_pkt_type & L4_PKT_TYPE_IGMP) {
     printf("---Building IGMP packet\n");
     t = libnet_build_igmp(
			    packet_vars->igmp.type, /* IGMP type */
			    0, /* IGMP code (unused in v1 and v2) */
			    packet_vars->igmp.checksum, /* checksum */
			    packet_vars->igmp.grp_ip, /* Group host IP */
			    payload, /* payload */
			    payload_s, /* payload size */
			    l, /* libnet handle */
			    0); /* libnet id */
     if (t == -1) {
       fprintf(stderr, "Can't build IGMP header: %s\n", libnet_geterror(l));
       return(-1);
     }
   } else if (packet_vars->l4_pkt_type & L4_PKT_TYPE_PIM) {
     printf("---Building PIM packet\n");
     t = libnet_build_pim(
			    packet_vars->pim.version, /* PIM version */
			    packet_vars->pim.type, /* PIM type */
			    packet_vars->pim.checksum, /* checksum */
			    payload, /* payload */
			    payload_s, /* payload size */
			    l, /* libnet handle */
			    0); /* libnet id */
     if (t == -1) {
       fprintf(stderr, "Can't build PIM header: %s\n", libnet_geterror(l));
       return(-1);
     }
   } else if (packet_vars->l4_pkt_type & L4_PKT_TYPE_RSVP) {
     printf("---Building RSVP packet\n");
     t = libnet_build_rsvp(
			    packet_vars->rsvp.version, /* RSVP version */
			    packet_vars->rsvp.flags, /* RSVP flags */
			    packet_vars->rsvp.type, /* RSVP mesg type */
			    packet_vars->rsvp.do_chksum, /* 1 - pkt is chksummed, 0, its not */
			    packet_vars->rsvp.checksum, /* checksum */
			    packet_vars->rsvp.ttl, /* IP TTL */
			    LIBNET_RSVP_H + payload_s, /* pkt len */
			    payload, /* payload */
			    payload_s, /* payload size */
			    l, /* libnet handle */
			    0); /* libnet id */
     if (t == -1) {
       fprintf(stderr, "Can't build RSVP header: %s\n", libnet_geterror(l));
       return(-1);
     }
   } else if (packet_vars->l4_pkt_type & L4_PKT_TYPE_GRE) {
     /* update l4_len */
     uint16_t flag_ver = 0;
     uint16_t type = 0;
     uint16_t len = 0;

     printf("---Building GRE,v0 packet\n");

     if (packet_vars->gre.csum) {
       flag_ver |= GRE_CSUM;
     }
     if (packet_vars->gre.rout) {
       flag_ver |= GRE_ROUTING;
     }
     if (packet_vars->gre.key) {
       flag_ver |= GRE_KEY;
     }
     if (packet_vars->gre.seq) {
       flag_ver |= GRE_SEQ;
     }
     flag_ver |= GRE_VERSION_0;

     type = libnet_get_ethernet_proto(packet_vars);

     len = libnet_getgre_length(flag_ver);
     packet_vars->l4_len += (len - LIBNET_GRE_H);
     packet_vars->payload.data_length += (len - LIBNET_GRE_H);
     len += payload_s;
     
     t = libnet_build_gre(
			   flag_ver, /* flags and version fields */
			   type, /* protocol type */
			   packet_vars->gre.checksum, /* checksum */
			   0, /* offset */
			   packet_vars->gre.key_val, /* key */
			   packet_vars->gre.seq_num, /* sequence number */
			   len, /* GRE pkt length */
			   payload,
			   payload_s,
			   l, 
			   0);
     if (t == -1) {
       fprintf(stderr, "Can't build GRE,v0 header: %s\n", libnet_geterror(l));
       return(-1);
     }
   } else if (packet_vars->l4_pkt_type & L4_PKT_TYPE_EGRE) {
     /* update l4_len */
     uint16_t flag_ver = 0;
     uint16_t len = 0;

     printf("---Building GRE,v1 packet\n");

     flag_ver |= GRE_KEY;
     if (packet_vars->egre.seq) {
       flag_ver |= GRE_SEQ;
     }
     if (packet_vars->egre.ack) {
       flag_ver |= GRE_ACK;
     }
     flag_ver |= GRE_VERSION_1;

     len = libnet_getgre_length(flag_ver);
     packet_vars->l4_len += (len - LIBNET_GRE_H);
     packet_vars->payload.data_length += (len - LIBNET_GRE_H);
     len += payload_s;
     
     t = libnet_build_egre(
			   flag_ver, /* flags and version fields */
			   0x880b, /* protocol type */
			   payload_s, /* payload length */
			   0, /* call ID */
			   packet_vars->egre.seq_num, /* sequence number */
			   packet_vars->egre.ack_num, /* ack number */
			   len, /* GRE pkt length */
			   payload,
			   payload_s,
			   l, 
			   0);
     if (t == -1) {
       fprintf(stderr, "Can't build GRE,v1 header: %s\n", libnet_geterror(l));
       return(-1);
     }
   } else {/*??*/
    printf("UNSUPPORTED PKT_TYPE !! \n");
    return(-1);
  }

  return(1);
}

