#
# Makefile 
#

ifdef SIMS_64BIT
CFLAGS =
CC = /pkg/gnu/bin/gcc -g -Wparentheses -Wimplicit -W $(CFLAGS)
else
CC = gcc -g -Wparentheses -Wimplicit -W
endif
#CC = g++ -g -Wparentheses -Wimplicit -W
FCC = g++ -L/usr/local/lib
AR = ar -r


LIBNET_HOME = ${DV_ROOT}/verif/env/common/vera/niu_ippktgen/C/libnet
VERA_LIBDIR = ${DV_ROOT}/verif/env/common/vera/niu_ippktgen/C/wrapper

prefix = $(VERA_LIBDIR)
$(VERA_LIBDIR)/%.o : %.cpp
	$(CC) -c $< -o $@

$(VERA_LIBDIR)/%.o : %.c
	$(CC) -c $< -o $@


all :${prefix}/pgVeraCIf.o ${prefix}/pgVeraWrap.o   ${prefix}/pgUtils.o  ${prefix}/genCpacket.o ${prefix}/pgLibnet.o ${prefix}/pgLibnetL4.o ${prefix}/pgLibnetL3.o ${prefix}/pgLibnetL2.o ${prefix}/pgrand.o
	$(AR) ${prefix}/pgVera.a ${prefix}/pgVeraCIf.o  ${prefix}/pgUtils.o ${prefix}/pgLibnet.o ${prefix}/pgLibnetL4.o ${prefix}/pgLibnetL3.o ${prefix}/pgLibnetL2.o ${prefix}/pgrand.o
	ranlib ${prefix}/pgVera.a

${prefix}/pgLibnetL2.o : pgLibnetL2.c
	$(CC) -g -Wparentheses -Wimplicit -W -I$(LIBNET_HOME) -I$(LIBNET_HOME)/include -I./include -I$(VERA_HOME)/lib -c pgLibnetL2.c -fPIC -o $@
${prefix}/pgLibnetL3.o : pgLibnetL3.c
	$(CC) -g -Wparentheses -Wimplicit -W -I$(LIBNET_HOME) -I$(LIBNET_HOME)/include -I./include -I$(VERA_HOME)/lib -c pgLibnetL3.c -fPIC -o $@
${prefix}/pgLibnetL4.o : pgLibnetL4.c
	$(CC) -g -Wparentheses -Wimplicit -W -I$(LIBNET_HOME) -I$(LIBNET_HOME)/include -I./include -I$(VERA_HOME)/lib -c pgLibnetL4.c -fPIC -o $@

${prefix}/pgrand.o : pgrand.c
	$(CC) -g -Wparentheses -Wimplicit -W -I./include -I$(VERA_HOME)/lib -c pgrand.c -fPIC -o $@
${prefix}/pgUtils.o : pgUtils.c
	$(CC) -g -Wparentheses -Wimplicit -W -I./include -I$(VERA_HOME)/lib -c pgUtils.c -fPIC -o $@
${prefix}/pgVeraCIf.o : pgVeraCIf.c
	$(CC) -g -Wparentheses -Wimplicit -W -I./include -I$(VERA_HOME)/lib -c pgVeraCIf.c -fPIC -o $@
${prefix}/pgVeraWrap.o : pgVeraWrap.c
	$(CC) -g -Wparentheses -Wimplicit -W -I./include -I$(VERA_HOME)/lib -c pgVeraWrap.c -fPIC -o $@
${prefix}/pgLibnet.o : pgLibnet.c
	$(CC) -I. -I$(LIBNET_HOME) -I./include -I$(LIBNET_HOME)/include -g -O2 -Wall -c `test -f 'pgLibnet.c' || './'`pgLibnet.c -o $@

${prefix}/genCpacket.o : genCpacket.c
	$(CC) -g -Wparentheses -Wimplicit -W -I$(VERA_HOME)/lib -c genCpacket.c -fPIC -o $@

clean:	
	rm -rf  ${prefix}/*.o ${prefix}/*.a
