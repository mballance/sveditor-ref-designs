/*
 *  $Id: libnet_pkt.c,v 1.19 2005/11/29 22:48:29 carlosc Exp $
 *
 *  libnet
 *  libnet_pkt.c - routines.
 *
 *  Copyright (c) 1998 - 2004 Mike D. Schiffman <mike@infonexus.com>
 *  All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions
 * are met:
 * 1. Redistributions of source code must retain the above copyright
 *    notice, this list of conditions and the following disclaimer.
 * 2. Redistributions in binary form must reproduce the above copyright
 *    notice, this list of conditions and the following disclaimer in the
 *    documentation and/or other materials provided with the distribution.
 *
 * THIS SOFTWARE IS PROVIDED BY THE AUTHOR AND CONTRIBUTORS ``AS IS'' AND
 * ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
 * IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
 * ARE DISCLAIMED.  IN NO EVENT SHALL THE AUTHOR OR CONTRIBUTORS BE LIABLE
 * FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
 * DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS
 * OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION)
 * HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT
 * LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY
 * OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF
 * SUCH DAMAGE.
 *
 */

#if (HAVE_CONFIG_H)
#include "../include/config.h"
#endif
#if (!(_WIN32) || (__CYGWIN__)) 
#include "../include/libnet.h"
#else
#include "../include/win32/libnet.h"
#endif

libnet_t *
libnet_init_pkt(int injection_type, char *device, char *err_buf)
{
    libnet_t *l = NULL;

#if 0 
#if !defined(__WIN32__)
    if (getuid() && geteuid())
    {
        snprintf(err_buf, LIBNET_ERRBUF_SIZE,
                "%s(): UID or EUID of 0 required\n", __func__);
        goto bad;
    }
#else
    WSADATA wsaData;

    if ((WSAStartup(0x0202, &wsaData)) != 0)
    {
        snprintf(err_buf, LIBNET_ERRBUF_SIZE, 
                "%s(): unable to initialize winsock 2\n", __func__);
        goto bad;
    }
#endif
#endif

    l = (libnet_t *)malloc(sizeof (libnet_t));
    if (l == NULL)
    {
        snprintf(err_buf, LIBNET_ERRBUF_SIZE, "%s(): malloc(): %s\n", __func__,
                strerror(errno));
        goto bad;
    }
	
    memset(l, 0, sizeof (*l));

    l->injection_type   = injection_type;
    l->ptag_state       = LIBNET_PTAG_INITIALIZER;
    l->device           = (device ? strdup(device) : NULL);

    strncpy(l->label, LIBNET_LABEL_DEFAULT, LIBNET_LABEL_SIZE);
    l->label[sizeof(l->label)] = '\0';

#if 0
    switch (l->injection_type)
    {
        case LIBNET_LINK:
        case LIBNET_LINK_ADV:
            if (libnet_select_device(l) == -1)
            {
                snprintf(err_buf, LIBNET_ERRBUF_SIZE, l->err_buf);
		goto bad;
            }
            if (libnet_open_link(l) == -1)
            {
                snprintf(err_buf, LIBNET_ERRBUF_SIZE, l->err_buf);
                goto bad;
            }
            break;
        case LIBNET_RAW4:
        case LIBNET_RAW4_ADV:
            if (libnet_open_raw4(l) == -1)
            {
                snprintf(err_buf, LIBNET_ERRBUF_SIZE, l->err_buf);
                goto bad;
            }
            break;
        case LIBNET_RAW6:
        case LIBNET_RAW6_ADV:
            if (libnet_open_raw6(l) == -1)
            {
                snprintf(err_buf, LIBNET_ERRBUF_SIZE, l->err_buf);
                goto bad;
            }
            break;
        default:
            snprintf(err_buf, LIBNET_ERRBUF_SIZE,
                    "%s(): unsupported injection type\n", __func__);
            goto bad;
            break;
    }
#endif

    return (l);

bad:
    if (l)
    {
        libnet_destroy(l);
    }
    return (NULL);
}



int
libnet_pblock_coalesce_pkt(libnet_t *l, u_int8_t **packet, u_int32_t *size, u_int32_t align);

void
libnet_print_pkt(u_int8_t *pktbuf, u_int32_t pktlen)
{
       int i;
                                                                                
       fprintf(stderr, "pktbuf = 0x%p, pktlen = %d\n", pktbuf, pktlen);
       for (i=0; i<pktlen; i++) {
          if(!(i%16)) fprintf (stderr,"\n %06d\t\t",i);
          fprintf(stderr,"%02x ", pktbuf[i]);
       }
       fprintf (stderr,"\n");
}


int
libnet_write_pkt(libnet_t *l, u_int8_t **packet, u_int32_t *len, u_int32_t align)
{
    int c;
#if 0
    u_int32_t len;
    u_int8_t *packet = NULL;
#endif

    if (l == NULL)
    { 
        return (-1);
    }

    c = libnet_pblock_coalesce_pkt(l, packet, len, align);
    if (c == - 1)
    {
        /* err msg set in libnet_pblock_coalesce() */
        return (-1);
    }

#if 0
    /* assume error */
    c = -1;
    switch (l->injection_type)
    {
        case LIBNET_RAW4:
        case LIBNET_RAW4_ADV:
            if (len > LIBNET_MAX_PACKET)
            {
                snprintf(l->err_buf, LIBNET_ERRBUF_SIZE,
                        "%s(): packet is too large (%d bytes)\n",
                        __func__, len);
                goto done;
            }
            c = libnet_write_raw_ipv4(l, packet, len);
            break;
        case LIBNET_RAW6:
        case LIBNET_RAW6_ADV:
            c = libnet_write_raw_ipv6(l, packet, len);
            break;
        case LIBNET_LINK:
        case LIBNET_LINK_ADV:
            c = libnet_write_link(l, packet, len);
            break;
        default:
            snprintf(l->err_buf, LIBNET_ERRBUF_SIZE,
                        "%s(): unsuported injection type\n", __func__);
            goto done;
    }
#endif

    /* do statistics */
    if (c == *len)
    {
        l->stats.packets_sent++;
        l->stats.bytes_written += c;
    }
    else
    {
        l->stats.packet_errors++;
        /*
         *  XXX - we probably should have a way to retrieve the number of
         *  bytes actually written (since we might have written something).
         */
        if (c > 0)
        {
            l->stats.bytes_written += c;
        }
    }
done:
#if 0
    /*
     *  Restore original pointer address so free won't complain about a
     *  modified chunk pointer.
     */
    if (l->aligner > 0)
    {
        *packet = *packet - l->aligner;
    }

    free(packet);
#endif
    return (c);
}


int
libnet_pblock_coalesce_pkt(libnet_t *l, u_int8_t **packet, u_int32_t *size, u_int32_t align)
{
    libnet_pblock_t *p, *q;
    u_int32_t c, n;

    /*
     *  Determine the offset required to keep memory aligned (strict
     *  architectures like solaris enforce this, but's a good practice
     *  either way).  This is only required on the link layer with the
     *  14 byte ethernet offset (others are similarly unkind).
     */
#if 1
    if (l->injection_type == LIBNET_LINK || 
        l->injection_type == LIBNET_LINK_ADV)
    {
        /* 8 byte alignment should work */
        if (align)
        	l->aligner = align - (l->link_offset % align);
	else
        	l->aligner = 0;
    }
    else
    {
        l->aligner = 0;
    }
#else
    l->aligner = align;
#endif

/**********    fprintf(stderr, "libnet_pblock_coalesce_pkt: aligner = %d\n", l->aligner);***/

    *packet = malloc(l->aligner + l->total_size);
    if (*packet == NULL)
    {
        snprintf(l->err_buf, LIBNET_ERRBUF_SIZE, "%s(): malloc(): %s\n",
                __func__, strerror(errno));
        return (-1);
    }

    memset(*packet, 0, l->aligner + l->total_size);

    if (l->injection_type == LIBNET_RAW4 && 
        l->pblock_end->type == LIBNET_PBLOCK_IPV4_H)
    {
        libnet_pblock_setflags(l->pblock_end, LIBNET_PBLOCK_DO_CHECKSUM); 
#if 0
        libnet_pblock_setflags(l->pblock_end, 0x0); 
#endif
    }
    
    /* additional sanity checks to perform if we're not in advanced mode */
    if (!(l->injection_type & LIBNET_ADV_MASK))
    {
    	switch (l->injection_type)
    	{
            case LIBNET_LINK:
                if ((l->pblock_end->type != LIBNET_PBLOCK_TOKEN_RING_H) &&
                    (l->pblock_end->type != LIBNET_PBLOCK_FDDI_H)       &&
                    (l->pblock_end->type != LIBNET_PBLOCK_ETH_H)        &&
                    (l->pblock_end->type != LIBNET_PBLOCK_802_1Q_H)     &&
                    (l->pblock_end->type != LIBNET_PBLOCK_ISL_H)        &&
                    (l->pblock_end->type != LIBNET_PBLOCK_802_3_H))
                {
                    snprintf(l->err_buf, LIBNET_ERRBUF_SIZE, 
                    "%s(): packet assembly cannot find a layer 2 header\n",
                    __func__);
                    return (-1);
                }
                break;
            case LIBNET_RAW4:
                if ((l->pblock_end->type != LIBNET_PBLOCK_IPV4_H))
                {
                    snprintf(l->err_buf, LIBNET_ERRBUF_SIZE, 
                    "%s(): packet assembly cannot find an IPv4 header\n",
                     __func__);
                    return (-1);
                }
                break;
            case LIBNET_RAW6:
                if ((l->pblock_end->type != LIBNET_PBLOCK_IPV6_H))
                {
                    snprintf(l->err_buf, LIBNET_ERRBUF_SIZE, 
                    "%s(): packet assembly cannot find an IPv6 header\n",
                     __func__);
                    return (-1);
                }
                break;
            default:
                /* we should not end up here ever */
                snprintf(l->err_buf, LIBNET_ERRBUF_SIZE, 
                "%s(): suddenly the dungeon collapses -- you die\n",
                 __func__);
                return (-1);
            break;
        }
    }

    q = NULL; 
    for (n = l->aligner + l->total_size, p = l->protocol_blocks; p || q; )
    {

        if (q)
        {
            p = p->next;
        }
#if 0
	    if (p != NULL) {
/***********/fprintf(stderr, "libnet_pblock_coalesce_pkt: p(%d) proto=%d, p->next(%d)\n", p, libnet_pblock_p2p(p->type), p->next);
	    } else {
		   fprintf(stderr, "libnet_pblock_coalesce_pkt: p is null");
	    }
#endif
        if (p)
        {
            n -= p->b_len;
            /* copy over the packet chunk */
            memcpy(*packet + n, p->buf, p->b_len);
/*************fprintf(stderr, "libnet_pblock_coalesce_pkt: Copying over %d bytes from the end\n", p->b_len);*/
        }
        if (q)
        {
            if (p == NULL || ((p->flags) & LIBNET_PBLOCK_DO_CHECKSUM))
#if 0
            if (p == NULL || ((p->flags) & 0x0))
#endif
            {
                if ((q->flags) & LIBNET_PBLOCK_DO_CHECKSUM)
#if 0
                if ((q->flags) & 0x0)
#endif
                {
                    int offset = (l->total_size + l->aligner) - q->ip_offset;
/******fprintf(stderr, "libnet_pblock_coalesce_pkt: Calling libnet_do_checksum with the packet offset set at %d, ip_offset being %d, and buf %d, proto %d, len %d\n", offset, q->ip_offset, (unsigned int)(*packet + offset), libnet_pblock_p2p(q->type), q->h_len);*/

                    c = libnet_do_checksum(l, *packet + offset,
                            libnet_pblock_p2p(q->type), q->h_len);
                    if (c == -1)
                    {
                        /* err msg set in libnet_do_checksum() */
                        return (-1);
                    }
                }
                q = p;
            }
        }
        else
        {
            q = p;
        }
    }
    *size = l->aligner + l->total_size;

    /*
     *  Set the packet pointer to the true beginning of the packet and set
     *  the size for transmission.
     */
    if ((l->injection_type == LIBNET_LINK ||
        l->injection_type == LIBNET_LINK_ADV) && l->aligner)
    {
        *packet += l->aligner;
        *size -= l->aligner;
    }
#if 0
    return (1);
#endif
    return (*size);
}

/* EOF */
