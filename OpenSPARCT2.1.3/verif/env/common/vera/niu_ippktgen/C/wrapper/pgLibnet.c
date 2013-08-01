#if (HAVE_CONFIG_H)
#include "../include/config.h"
#endif

#include "include/libnet.h"

#include "include/pg.h"
#include "include/packet.h"

/* AJXXXX */
libnet_t * libnet_init_pkt(int injection_type, char *device, char *err_buf);
int libnet_write_pkt(libnet_t *l, u_int8_t **packet, u_int32_t *len,
		     u_int32_t align);
void libnet_print_pkt(u_int8_t *pktbuf, u_int32_t pktlen);


extern unsigned char * genPayload (int data_type, unsigned int seed,
				   int data_length);
extern unsigned char * addPayload (unsigned char *p1, int l1,
				   unsigned char *p2, int l2) ;
extern unsigned char * addCrc (unsigned char *p1, int l1, unsigned int crc) ;
extern unsigned char *  addL2Pad(unsigned char * pktbuf,int pktlen,int l2_pad_length) ;

extern int libnet_gen_l4_packet(struct packet_desc *packet_vars, libnet_t *l);
extern int libnet_gen_l3_packet(struct packet_desc *packet_vars, libnet_t *l);
extern int libnet_gen_l2_packet(struct packet_desc *packet_vars, libnet_t *l);



char * libnet_call(struct packet_desc *packet_vars, u_int32_t *total_len) {

    int c;
    libnet_t *l;
    char errbuf[LIBNET_ERRBUF_SIZE];
    /* AJXXXX */
    struct libnet_stats ls;
    u_int32_t pktlen=0;
    u_int32_t pktalign=0;
    u_int8_t *pktbuf=NULL;
    u_int32_t crc;
    int status;
    int l2_length;
    int payload_start_ptr;


/*
     *  Initialize the library.  Root priviledges are required.
     */
    /* AJXXXX */
    l = libnet_init_pkt(
            LIBNET_LINK,                            /* injection type */
            NULL,                                   /* network interface */
            errbuf);                                /* error buffer */

    if (l == NULL)
    {
        fprintf(stderr, "libnet_init() failed: %s", errbuf);
        exit(EXIT_FAILURE);
    }


    // The guts of packet gen

    if(packet_vars->l2_pkt_type==L2_RUNT) {
	    l2_length = packet_vars->payload.data_length;
	    if(l2_length>4) {
		    l2_length= l2_length - 4;
		    // generate payload
		    pktbuf = genPayload(packet_vars->payload.data_type,
					packet_vars->payload.data_seed,
					l2_length);
		    pktlen = l2_length;
                    crc = libnet_compute_crc(pktbuf,pktlen);
     	            pktbuf = addCrc(pktbuf,pktlen,crc); 
     	            pktlen+=4;
     	            *total_len = pktlen;
	    } else { /*NOCRC*/
		    // generate payload
		    pktbuf = genPayload(packet_vars->payload.data_type,
					packet_vars->payload.data_seed,
					l2_length);
		    pktlen = l2_length;
     	            *total_len = pktlen;

	    }
    } else {
      status = libnet_gen_l4_packet(packet_vars, l); 
      if(status == -1) {
       printf("ERROR libnet_gen_l4_packet failed \n");
       return(NULL);
      }


      status = libnet_gen_l3_packet(packet_vars, l); 
      if(status == -1) {
       printf("ERROR libnet_gen_l3_packet failed \n");
       return(NULL);
      }
      status = libnet_gen_l2_packet(packet_vars, l); 
      if(status == -1) {
       printf("ERROR libnet_gen_l2_packet failed \n");
       return(NULL);
      }

      /* sbehera - need this for IP header alignment */
      pktalign = 2;
      c = libnet_write_pkt(l, &pktbuf, &pktlen, pktalign);
      if (c == -1)
      { 
       fprintf(stderr, "Write error: %s\n", libnet_geterror(l));
       return(NULL);
      }
      payload_start_ptr = packet_vars->l2_hdr+packet_vars->l3_hdr+ packet_vars->l4_hdr;

      if( ( packet_vars->payload.error_code & PG_CHKSUM_ERR) ){
       if (packet_vars->l4_pkt_type & L4_PKT_TYPE_TCP) { 
	    printf("Libnet CheckSum - %x%x\n",pktbuf[payload_start_ptr-4],pktbuf[payload_start_ptr-3]);
	    pktbuf[payload_start_ptr-4] =  pktbuf[payload_start_ptr-4]^1;
       } else if(packet_vars->l4_pkt_type & L4_PKT_TYPE_UDP) {
	    printf("Libnet CheckSum - %x%x\n",pktbuf[payload_start_ptr-2],pktbuf[payload_start_ptr-1]);
	    pktbuf[payload_start_ptr-1] =  pktbuf[payload_start_ptr-1]^1;
       }
      }


     pktbuf = addL2Pad(pktbuf,pktlen,packet_vars->payload.l2_pad_length); 
     pktlen+=packet_vars->payload.l2_pad_length;

     crc = libnet_compute_crc(pktbuf,pktlen);
     
     printf(" Libnet CRC - %x \n",crc);
     if(packet_vars->payload.error_code & PG_CRC_ERR) {
      crc = crc^0x01010101;
      printf("Libnet CRCError - %x \n",crc);
      }
      
     pktbuf = addCrc(pktbuf,pktlen,crc); 
     pktlen+=4;
     *total_len = pktlen;
    }


#if 1 /* AJXXXX */
    // c = libnet_write_pkt(l, &pktbuf, &pktlen, pktalign);
    // crc = libnet_compute_crc(pktbuf,pktlen);
    // pktbuf = addCrc(pktbuf,pktlen,crc);
    // pktlen+=4;
#endif

    if (c == -1) {
        fprintf(stderr, "Write error: %s\n", libnet_geterror(l));
	return(NULL);
    } else {
        fprintf(stderr, "Wrote %d byte packet; check the wire.\n", pktlen);
#if 1 /* AJXXXX */
        // libnet_print_pkt(pktbuf, pktlen);
	return(pktbuf);
#endif
    }

}
