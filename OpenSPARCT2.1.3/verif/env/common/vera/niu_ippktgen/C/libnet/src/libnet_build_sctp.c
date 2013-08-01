#if (HAVE_CONFIG_H)
#include "../include/config.h"
#endif
#if (!(_WIN32) || (__CYGWIN__)) 
#include "../include/libnet.h"
#else
#include "../include/win32/libnet.h"
#endif

libnet_ptag_t
libnet_build_sctp(u_int16_t sp, u_int16_t dp, u_int32_t vtag, u_int32_t chksum, u_int8_t *payload, u_int32_t payload_s, libnet_t *l, libnet_ptag_t ptag)
{
    int n, offset;
    libnet_pblock_t *p, *p_data, *p_temp;
    libnet_ptag_t ptag_hold, ptag_data;
    struct libnet_sctp_hdr sctp_hdr;
    struct libnet_ipv4_hdr *ip_hdr;

    if (l == NULL)
    { 
        return (-1);
    }

    ptag_data = 0;

    /*
     *  Find the existing protocol block if a ptag is specified, or create
     *  a new one.
     */
    p = libnet_pblock_probe(l, ptag, LIBNET_SCTP_H, LIBNET_PBLOCK_SCTP_H);
    if (p == NULL)
    {
        return (-1);
    }

    memset(&sctp_hdr, 0, sizeof(sctp_hdr));
    sctp_hdr.src_port = htons(sp);    	/* source port */
    sctp_hdr.dst_port = htons(dp);    	/* destination port */
    sctp_hdr.vtag = htonl(vtag);	/* verification tag */
    sctp_hdr.checksum = (chksum ? htonl(chksum) : 0);   /* checksum */ 

    n = libnet_pblock_append(l, p, (u_int8_t *)&sctp_hdr, LIBNET_SCTP_H);
    if (n == -1)
    {
        goto bad;
    }

    ptag_hold = ptag;
    if (ptag == LIBNET_PTAG_INITIALIZER)
    {
        ptag = libnet_pblock_update(l, p, LIBNET_SCTP_H + payload_s,
				    LIBNET_PBLOCK_SCTP_H);
    }

    /* find and set the appropriate ptag, or else use the default of 0 */
    offset = payload_s;
    if (ptag_hold && p->prev)
    {
        p_temp = p->prev;
        while (p_temp->prev &&
              (p_temp->type != LIBNET_PBLOCK_SCTP_CHNK_DATA) &&
              (p_temp->type != LIBNET_PBLOCK_SCTP_H))
        {
           p_temp = p_temp->prev;
        }

        if (p_temp->type == LIBNET_PBLOCK_SCTP_CHNK_DATA)
        {
            ptag_data = p_temp->ptag;
            offset -=  p_temp->b_len;
            p->h_len += offset;
        }
        else
        {
            snprintf(l->err_buf, LIBNET_ERRBUF_SIZE,
				    "%s(): SCTP data pblock not found\n", __func__);
        }
     }

    /* update ip_len if present */
    if (ptag_hold && p->next)
    {
        p_temp = p->next;
        while (p_temp->next && (p_temp->type != LIBNET_PBLOCK_IPV4_H))
        {
            p_temp = p_temp->next;
        }
        if (p_temp->type == LIBNET_PBLOCK_IPV4_H)
        {
            ip_hdr = (struct libnet_ipv4_hdr *)p_temp->buf;
            n = ntohs(ip_hdr->ip_len) + offset;
            ip_hdr->ip_len = htons(n);
        }
    }

    if ((payload && !payload_s) || (!payload && payload_s))
    {
        snprintf(l->err_buf, LIBNET_ERRBUF_SIZE,
			    "%s(): payload inconsistency\n", __func__);
        goto bad;
    }

    /* if there is a payload, add it in the context */
    if (payload && payload_s)
    {
        /* update ptag_data with the new payload */
        p_data = libnet_pblock_probe(l, ptag_data, payload_s,
				     LIBNET_PBLOCK_SCTP_CHNK_DATA);
        if (p_data == NULL) 
        {
            return (-1);
        }

        if (libnet_pblock_append(l, p_data, payload, payload_s) == -1)
        {
            goto bad;
        }

        if (ptag_data == LIBNET_PTAG_INITIALIZER)
        {
            if (p_data->prev->type == LIBNET_PBLOCK_SCTP_H)
            {
                libnet_pblock_update(l, p_data, payload_s,
				     LIBNET_PBLOCK_SCTP_CHNK_DATA);
                /* swap pblocks to correct the protocol order */
                libnet_pblock_swap(l, p->ptag, p_data->ptag);
            }
            else
            {
                /* update without setting this as the final pblock */
                p_data->type  =  LIBNET_PBLOCK_SCTP_CHNK_DATA;
                p_data->ptag  =  ++(l->ptag_state);
                p_data->h_len =  payload_s;

                /* Adjust h_len for checksum. */
                p->h_len += payload_s;

                /* data was added after the initial construction */
                for (p_temp = l->protocol_blocks;
                        p_temp->type == LIBNET_PBLOCK_SCTP_H;
                        p_temp = p_temp->next)
                {
                    libnet_pblock_insert_before(l, p_temp->ptag, p_data->ptag);
                    break;
                }
                /* The end block needs to have its next pointer cleared. */
                l->pblock_end->next = NULL;
            }
        }
    }
    else
    {
        p_data = libnet_pblock_find(l, ptag_data);
        if (p_data) 
        {
            libnet_pblock_delete(l, p_data);
        }
    }

    if (chksum == 0)
    {
        /*
         *  If checksum is zero, by default libnet will compute a checksum
         *  for the user.  The programmer can override this by calling
         *  libnet_toggle_checksum(l, ptag, 1);
         */
        libnet_pblock_setflags(p, LIBNET_PBLOCK_DO_CHECKSUM);
    }
    return (ptag);
bad:
    libnet_pblock_delete(l, p);
    return (-1);
}

/* EOF */
