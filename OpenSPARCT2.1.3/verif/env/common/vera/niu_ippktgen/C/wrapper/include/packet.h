#ifndef  _PACKET_H
#define _PACKET_H

#ifdef  __cplusplus
extern "C" {
#endif

// Layer 4 defines
#define L4_PKT_TYPE_TCP 0x1
#define L4_PKT_TYPE_UDP 0x2
#define L4_PKT_TYPE_SCTP 0x4
#define L4_PKT_TYPE_AH  0x8
#define L4_PKT_TYPE_ESP  0x10
#define L4_PKT_TYPE_ICMP  0x20
#define L4_PKT_TYPE_IGMP  0x40
#define L4_PKT_TYPE_GRE  0x80
#define L4_PKT_TYPE_EGRE  0x100
#define L4_PKT_TYPE_PIM  0x200
#define L4_PKT_TYPE_RSVP  0x400

// Layer 3 defines
#define L3_PKT_TYPE_FRAG 0x8
#define L3_PKT_TYPE_OPT 0x4
#define L3_PKT_TYPE_IPV6 0x2
#define L3_PKT_TYPE_IPV4 0x1

// Layer 2 defines
#define L2_PKT_TYPE_LLCSNAP 0x10
#define L2_PKT_TYPE_TAGGED 0x8
// Need some defines for ARP, etc
// sbehera
#define L2_PKT_TYPE_RARP 0x4
#define L2_PKT_TYPE_ARP 0x2


#define L2_PKT             0x1
#define L2_RUNT           0x40


// defines from old pktgen - only for compatibility 
#define PKTGEN_TCP 16
#define PKTGEN_UDP 13

// Class Type Definitions   
//
// // IPv4 defines  
#define PKTGEN_CL_ARP                  0
#define PKTGEN_CL_RARP                 1
#define PKTGEN_CL_RSVP                 2
#define PKTGEN_CL_IGMP                 3
#define PKTGEN_CL_ICMP                 4
#define PKTGEN_CL_PIM                  5
#define PKTGEN_CL_GRE                  6
#define PKTGEN_CL_IP                   7 
#define PKTGEN_CL_IP_OPT               8  
#define PKTGEN_CL_IP_FRAG              9  
#define PKTGEN_CL_IP_ROUTE             10 
#define PKTGEN_CL_IP_SEC_AH            11     
#define PKTGEN_CL_IP_SEC_ESP           12     
#define PKTGEN_CL_UDP                  13   
#define PKTGEN_CL_UDP_FRAG             14   
#define PKTGEN_CL_UDP_OPT              15 
#define PKTGEN_CL_TCP                  16   
#define PKTGEN_CL_TCP_FRAG             17  
#define PKTGEN_CL_TCP_OPT              18   
#define PKTGEN_CL_SCTP                 19   
#define PKTGEN_CL_SCTP_OPT                 20   
#define PKTGEN_CL_SCTP_FRAG                 21   

#define PKTGEN_DELTA           22      

// IPv6 defines 
//  (Values must be a DETLA apart from their IPv4 class)  
#define PKTGEN_CL_ARP_IP_V6            PKTGEN_DELTA + 0
#define PKTGEN_CL_RARP_IP_V6           PKTGEN_DELTA + 1
#define PKTGEN_CL_RSVP_IP_V6           PKTGEN_DELTA + 2 
#define PKTGEN_CL_IGMP_IP_V6           PKTGEN_DELTA + 3  
#define PKTGEN_CL_ICMP_IP_V6           PKTGEN_DELTA + 4  
#define PKTGEN_CL_PIM_IP_V6            PKTGEN_DELTA + 5  
#define PKTGEN_CL_GRE_IP_V6            PKTGEN_DELTA + 6  
#define PKTGEN_CL_IP_V6                PKTGEN_DELTA + 7    
#define PKTGEN_CL_IP_V6_OPT            PKTGEN_DELTA + 8  
#define PKTGEN_CL_IP_V6_FRAG           PKTGEN_DELTA + 9    
#define PKTGEN_CL_IP_V6_ROUTE          PKTGEN_DELTA + 10    
#define PKTGEN_CL_IP_V6_SEC_AH         PKTGEN_DELTA + 11            
#define PKTGEN_CL_IP_V6_SEC_ESP        PKTGEN_DELTA + 12             
#define PKTGEN_CL_UDP_IP_V6            PKTGEN_DELTA + 13         
#define PKTGEN_CL_UDP_FRAG_IP_V6       PKTGEN_DELTA + 14        
#define PKTGEN_CL_UDP_OPT_IP_V6        PKTGEN_DELTA + 15        
#define PKTGEN_CL_TCP_IP_V6            PKTGEN_DELTA + 16        
#define PKTGEN_CL_TCP_FRAG_IP_V6       PKTGEN_DELTA + 17         
#define PKTGEN_CL_TCP_OPT_IP_V6        PKTGEN_DELTA + 18         

#define PKTGEN_CL_IP_TUN_V4_V4         PKTGEN_DELTA + 19         
#define PKTGEN_CL_IP_TUN_V4_V6         PKTGEN_DELTA + 20        
#define PKTGEN_CL_IP_TUN_V6_V4         PKTGEN_DELTA + 21   
#define PKTGEN_CL_IP_TUN_V6_V6         PKTGEN_DELTA + 22                  
#define PKTGEN_CL_SCTP_IP_V6           PKTGEN_DELTA + 23   
#define PKTGEN_CL_IP_V6_LAST_VALUE     PKTGEN_CL_IP_TUN_V6_V6 
//

#define PKTGEN_CL_RUNT     200 

// ERROR DEFINES

#define PG_CHKSUM_ERR 0x1
#define PG_CHKSUM_USER_MODE 0x2
#define PG_CRC_ERR 0x4
#define PG_TYPE_LEN_ERR 0x8
#define PG_L4_PROTO_USER_MODE 0x10
#define PG_TYPE_LEN_USER_MODE 0x20

struct ether_packet_desc {
    uint8_t            src_addr[6];         
    uint8_t            dst_addr[6];
    uint16_t           vlan_id;   
    uint16_t           tci;   
    uint16_t           proto;   
} ether_packet_desc_t;

struct arp_packet_desc {
	uint16_t	hw_type;	/* format of hardware addr, 0x01 for
					   ethernet */
	uint16_t	proto_type;	/* format of protocol addr, 0x0800 for
					   IP */
	uint8_t		hw_len;		/* length of hardware addr, 0x06 for
					   ethernet */
	uint8_t		proto_len;	/* length of protocol addr, 0x04 for
					   IP  */
	uint16_t	op_code;	/* ARP opcode, 0x01 - ARP req,
					   0x02 - ARP reply, 0x03 - RARP req,
					   0x04 - RARP reply */

	uint8_t	      	src_ha[6];       /* sender hardware address */
	uint8_t	      	src_ip[4];       /* sender IP address */
	uint8_t	      	tgt_ha[6];       /* target hardware address */
	uint8_t	      	tgt_ip[4];       /* target IP address */
} arp_packet_desc_t;


struct ip_packet_desc {
	// IPV4  ONLY
    uint32_t            src_addr;         
    uint32_t            dst_addr;
    uint16_t            proto;   
    uint8_t             options;
    uint8_t             tos;
    uint16_t            frag;   
} ip_packet_desc_t;
struct ipv6_packet_desc {
// IPV4  ONLY
uint8_t            src_addr[16];
uint8_t            dst_addr[16];
uint8_t             nexthdr;
uint8_t             tc;
uint16_t            frag;
uint32_t 	    ipv6FragId;
} ipv6_packet_desc_t;


struct tcp_packet_desc {
    uint8_t 		tcp_flags;
    uint16_t            service;   
    uint16_t            src_port;   
    uint16_t            dst_port;   
    uint16_t            window;   
    uint32_t            seq_no;   
    uint32_t            ack_no;   
    uint16_t            checksum;   
} tcp_packet_desc_t;


struct udp_packet_desc {
    uint16_t            service;   
    uint16_t            src_port;   
    uint16_t            dst_port;   
    uint16_t            checksum;   
} udp_packet_desc_t;

struct ipsec_ah_packet_desc {
    u_int8_t   	 nh;
    u_int8_t  	len;
    u_int16_t  	res;
    u_int32_t  	spi;
    u_int32_t  	seq;
    u_int32_t  	auth;
} ipsec_ah_packet_desc_t;

struct sctp_packet_desc {
	u_int16_t src_port;	/* source port */
	u_int16_t dst_port;	/* destination port */
	u_int32_t vtag;		/* verification tag */
	u_int32_t checksum;	/* checksum */
} sctp_packet_desc_t;
// sbehera
struct icmp_packet_desc {
  u_int8_t type;
#define ICMP_TYPE_ECHO_REQ 1
#define ICMP_TYPE_ECHO_REPLY 2
  u_int16_t checksum;
  u_int16_t id;
  u_int16_t seq;
} icmp_packet_desc_t;

// sbehera
struct igmp_packet_desc {
  u_int8_t type;
  u_int16_t checksum;
  u_int32_t grp_ip; /* IGMP host IP */
} igmp_packet_desc_t;

// sbehera
struct pim_packet_desc {
  u_int8_t version;
  u_int8_t type;
  u_int16_t checksum;
} pim_packet_desc_t;

// sbehera
struct rsvp_packet_desc {
  u_int8_t version;
  u_int8_t flags;
  u_int8_t type;
  u_int8_t ttl;
  u_int16_t checksum;
  int do_chksum;
} rsvp_packet_desc_t;

// sbehera
/* GRE version 0 */
struct gre_packet_desc {
  uint8_t csum : 1,
    rout : 1,
    key : 1,
    seq : 1,
    rsvd : 4;
  uint16_t checksum;
  uint32_t key_val;
  uint32_t seq_num;    
} gre_packet_desc_t;

// sbehera
/* Enhanced GRE (GRE version 1) */
struct egre_packet_desc {
  uint8_t seq:1,
    ack:1,
    rsvd:6;
  uint16_t call_id;
  uint32_t seq_num;
  uint32_t ack_num;
} egre_packet_desc_t;




struct psd_hdr {
    uint32_t src_addr;
    uint32_t dst_addr;
    uint32_t zero:8;
    uint32_t proto:8;
    uint32_t len:16;
} psd_hdr_t;

struct payload_desc {
    uint32_t data_type  ;
    uint32_t data_seed ;
    uint32_t error_code;
    uint32_t error_data; // used for user input based upon the error code 
    uint32_t gId ;
    uint32_t data_length;
    uint32_t l2_pad_length;
} payload_t;

struct packet_desc {
    uint8_t            frame_type;
    uint8_t            frame_class;

    uint8_t            l4_flag;         /* Packet Type */

    uint16_t           l2_len;       /* Ethernet packet len */
    uint8_t            l2_pkt_type;         /* Packet Type */
    uint16_t          l2_hdr;    /*l2 hdr length*/

    uint16_t           l3_len;       /* L3 packet len */
    uint8_t            l3_pkt_type;         /* Packet Type */
    uint16_t          l3_hdr;    /*l3 hdr length*/

    uint16_t           l4_len;       /* L4 packet len */
    uint16_t            l4_pkt_type;         /* Packet Type */
    uint16_t          l4_hdr;    /*l4 hdr length*/

    uint8_t            *buffer;   /* Allocated Ethernet Buffer */

    struct tcp_packet_desc tcp;
    struct udp_packet_desc udp;
    struct icmp_packet_desc icmp;
    struct igmp_packet_desc igmp;
    struct pim_packet_desc pim;
    struct gre_packet_desc gre;
    struct rsvp_packet_desc rsvp;
    struct egre_packet_desc egre;

    struct ip_packet_desc  ip;
    struct sctp_packet_desc sctp;
    struct arp_packet_desc arp; 
    struct ipv6_packet_desc  ipv6;
    struct ipsec_ah_packet_desc  ipsec_ah;
    struct ether_packet_desc ether;
    struct payload_desc payload;
} packet_desc_t;



#ifdef  __cplusplus
}
#endif

#endif	/* _PACKET_H */
