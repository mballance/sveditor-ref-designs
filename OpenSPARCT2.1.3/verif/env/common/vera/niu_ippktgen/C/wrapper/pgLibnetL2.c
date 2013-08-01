#include "include/libnet.h"
#include "include/pg.h"
#include "include/packet.h"
extern unsigned char * genPayload(int data_type, unsigned int seed,
				  int data_length);


int libnet_gen_l2_packet(struct packet_desc *packet_vars, libnet_t *l) {

	libnet_ptag_t t;
	char *payload;
	u_short payload_s;
	u_char *cp, oui[3];

	u_short priority, cfi;
	u_short frame_type;
	int is_llc_snap, is_arp, is_802_3;
	u_short len_proto;

	/* TMP CODE ONLY TO TEST OTHER LAYERS  */
	if (packet_vars->l2_pkt_type == 0) {
		printf("***TEST PROGRAM ERROR !! \n");
		return(-1);
	}

	is_llc_snap = is_arp = is_802_3 = 0;
  
	payload = NULL;
	payload_s = 0;
	if (packet_vars->l2_len) {
		payload = genPayload(packet_vars->payload.data_type,
				     packet_vars->payload.data_seed,
				     packet_vars->l2_len);
		payload_s = packet_vars->l2_len;
	} else {
		payload = NULL;
		payload_s = 0;
	}

	frame_type = 0;
	if (packet_vars->l3_pkt_type) {
		if (packet_vars->l3_pkt_type & L3_PKT_TYPE_IPV4) {
			frame_type = ETHERTYPE_IP;
		} else if (packet_vars->l3_pkt_type & L3_PKT_TYPE_IPV6) {
			frame_type = ETHERTYPE_IPV6;
		} else {
			frame_type = 0;
		}
		printf("L3 protocol chosen - %x\n", frame_type);
	} else if (packet_vars->l2_pkt_type & L2_PKT_TYPE_ARP) {
		frame_type = ETHERTYPE_ARP;
	} else if (packet_vars->l2_pkt_type & L2_PKT_TYPE_RARP) {
		frame_type = ETHERTYPE_REVARP;
#if 0	/* Needs to be implemented to support user defined frame types */
	} else if (packet_vars->ether.proto) {
		frame_type = packet_vars->ether.proto;
#endif
	} else {
		is_802_3 = 1;
	}

	if ((packet_vars->l2_pkt_type & L2_PKT_TYPE_ARP) ||
	    (packet_vars->l2_pkt_type & L2_PKT_TYPE_RARP)) {

		printf("---Generating ARP/RARP header \n");
		t = libnet_build_arp(packet_vars->arp.hw_type,
				     packet_vars->arp.proto_type,
				     packet_vars->arp.hw_len,
				     packet_vars->arp.proto_len,
				     packet_vars->arp.op_code,
				     packet_vars->arp.src_ha,
				     packet_vars->arp.src_ip,
				     packet_vars->arp.tgt_ha,
				     packet_vars->arp.tgt_ip,
				     payload,		/* payload */
				     payload_s,		/* payload size */
				     l,			/* libnet handle */
				     0);		/* libnet id */
		if (t == -1) {
			fprintf(stderr, "***Can't build ARP header: %s\n",
				libnet_geterror(l));
			return (NULL);
		}

		payload = NULL;
		payload_s = 0;
		is_arp = 1;
	}

	if (packet_vars->l2_pkt_type & L2_PKT_TYPE_LLCSNAP) {

		memset(&oui, 0, 3);
		printf("---Generating LLC header \n");
		t = libnet_build_802_2snap (
					    0xaa,	/* SNAP DSAP */
					    0xaa,	/* SNAP SSAP */
					    0x3,	/* control */
					    oui,	/* oui */
					    frame_type,	/* protocol */
					    payload,	/* payload */
					    payload_s,	/* payload size */
					    l,		/* libnet handle */
					    0);		/* libnet id */


		if (t == -1) {
			fprintf(stderr, "***Can't build LLC SNAP header: "
				"%s\n", libnet_geterror(l));
			return(NULL);
		}

		payload = NULL;
		payload_s = 0;
		is_llc_snap = 1;
	}
	if(packet_vars->payload.error_code & PG_TYPE_LEN_USER_MODE) {
          len_proto = (packet_vars->payload.error_data & 0xffff0000)>>16;
	}else if(packet_vars->payload.error_code & PG_TYPE_LEN_ERR) {
          len_proto = (packet_vars->payload.error_data & 0xffff0000)>>16;
	} else {	
	  if (is_llc_snap || is_802_3) {
		  len_proto = packet_vars->payload.data_length +  packet_vars->payload.l2_pad_length  - 4;
	  } else {
		  len_proto = frame_type;
	  }
	}

	if (packet_vars->l2_pkt_type & L2_PKT_TYPE_TAGGED) {

		printf("---Generating VLAN tagged ethernet header \n");
		priority = (packet_vars->ether.tci & 0xe000) >> 13;
		cfi = (packet_vars->ether.tci & 0x1000) >> 12;
		t = libnet_build_802_1q(
					packet_vars->ether.dst_addr,
					packet_vars->ether.src_addr,
					ETHERTYPE_VLAN,	/* TPI */
					priority,	/* priority (0 - 7) */
					cfi,		/* CFI flag */
					(packet_vars->ether.tci) & 0xfff,	/* vid (0 - 4095) */
					len_proto,	/* frame size */
					payload,	/* payload */
					payload_s,	/* payload size */
					l,		/* libnet handle */
					0);		/* libnet id */

		if (t == -1) {
			fprintf(stderr, "***Can't build ethernet VLAN header: "
				"%s\n", libnet_geterror(l));
			return(NULL);
		}
	} else {

		printf("---Generating ethernet header \n");
		t = libnet_build_ethernet(
					  packet_vars->ether.dst_addr,
					  packet_vars->ether.src_addr,
					  len_proto,
					  payload,	/* payload */
					  payload_s,	/* payload size */
					  l,		/* libnet handle */
					  0);		/* libnet id */
		if (t == -1) {
			fprintf(stderr, "***Can't build ethernet header: %s\n",
				libnet_geterror(l));
			return(NULL);
		}
	}


	return(1);
}
