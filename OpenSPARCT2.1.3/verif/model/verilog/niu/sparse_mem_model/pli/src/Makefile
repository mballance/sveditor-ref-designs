#
# Makefile 
#
ifdef SIMS_64BIT
CFLAGS = -m64
GCC = /pkg/gnu/bin/gcc 
else
CFLAGS= 
GCC = gcc 
endif
CC = $(GCC) -g -Wparentheses -Wimplicit -W  $(CFLAGS)
FCC = g++ -L/usr/local/lib
AR = ar -r


#  Use the string NEPTUNE_MODE to define swithces to
# determine which -D option to pass to gcc

DFLAGS = XXXX
N2_AXIS_FLAG = N2_AXIS


$(VERA_LIBDIR)/%.o : %.cpp
	$(CC) -c $< -o $@

$(VERA_LIBDIR)/%.o : %.c
	$(CC) -c $< -o $@


all : $(VERA_LIBDIR)/mempli.o $(VERA_LIBDIR)/ext_sys_mem.o $(VERA_LIBDIR)/mal.o
	$(AR) $(VERA_LIBDIR)/mempli.a $(VERA_LIBDIR)/mempli.o $(VERA_LIBDIR)/ext_sys_mem.o
	ranlib $(VERA_LIBDIR)/mempli.a

$(VERA_LIBDIR)/mempli.o : mempli.cc
	$(CC) -I$(VCS_HOME)/include -o $(VERA_LIBDIR)/mempli.o -c mempli.cc

$(VERA_LIBDIR)/ext_sys_mem.o : ext_sys_mem.cc ext_sys_mem.h
	$(CC) -I$(VCS_HOME)/include -o $(VERA_LIBDIR)/ext_sys_mem.o -c ext_sys_mem.cc

ifdef N2_AXIS
$(VERA_LIBDIR)/mal.o :	mal.cpp
	$(CC) -I$(VERA_HOME)/lib -o $(VERA_LIBDIR)/mal.o -c mal.cpp -fPIC -D$(N2_AXIS_FLAG)
else
$(VERA_LIBDIR)/mal.o :	mal.cpp
		$(CC) -I$(VERA_HOME)/lib -o $(VERA_LIBDIR)/mal.o -c mal.cpp -fPIC -D$(DFLAGS)  $(CFLAGS)
endif

clean:	
	rm -rf  $(VERA_LIBDIR)/mempli.a $(VERA_LIBDIR)/mal.o
