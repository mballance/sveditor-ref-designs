#if (HAVE_CONFIG_H)
#include "../include/config.h"
#endif
#if (!(_WIN32) || (__CYGWIN__)) 
#include "../include/libnet.h"
#else
#include "../include/win32/libnet.h"
#endif

libnet_ptag_t
libnet_build_pim(u_int8_t vers, u_int8_t type, u_int16_t chksum,
		 u_int8_t *payload, u_int32_t payload_s, libnet_t *l,
		 libnet_ptag_t ptag)
{
    u_int32_t n, h;
    libnet_pblock_t *p;
    struct libnet_pim_hdr pim_hdr;

    if (l == NULL)
    { 
        return (-1);
    }

    n = LIBNET_PIM_H + payload_s;
    h = LIBNET_PIM_H;

    /*
     *  Find the existing protocol block if a ptag is specified, or create
     *  a new one.
     */
    p = libnet_pblock_probe(l, ptag, n, LIBNET_PBLOCK_PIM_H);
    if (p == NULL)
    {
        return (-1);
    }

    memset(&pim_hdr, 0, sizeof(pim_hdr));
    pim_hdr.pim_ver_type = (vers << 4) | (type & 0x0f); /* version and type */
    pim_hdr.pim_sum = (chksum ? htons(chksum) : 0);   /* checksum */ 

    n = libnet_pblock_append(l, p, (u_int8_t *)&pim_hdr, LIBNET_PIM_H);
    if (n == -1)
    {
        goto bad;
    }

    if ((payload && !payload_s) || (!payload && payload_s))
    {
         snprintf(l->err_buf, LIBNET_ERRBUF_SIZE,
			     "%s(): payload inconsistency\n", __func__);
        goto bad;
    }

    if (payload && payload_s)
    {
        n = libnet_pblock_append(l, p, payload, payload_s);
        if (n == -1)
        {
            goto bad;
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


    return (ptag ? ptag : libnet_pblock_update(l, p, h, LIBNET_PBLOCK_PIM_H));
bad:
    libnet_pblock_delete(l, p);
    return (-1);
}

/* EOF */
