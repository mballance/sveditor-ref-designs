#
# Makefile 
#

ifdef SIMS_64BIT
GCC = /pkg/gnu/bin/gcc
else
GCC = gcc
endif

CFLAGS = 
CC = $(GCC) -g -Wparentheses -Wimplicit -W $(CFLAGS)
FCC = g++ -L/usr/local/lib
AR = ar -r

$(VERA_LIBDIR)/%.o : %.cpp
	$(CC) -c $< -o $@

$(VERA_LIBDIR)/%.o : %.c
	$(CC) -c $< -o $@

all : $(VERA_LIBDIR)/pgRandom.o $(VERA_LIBDIR)/get_plus_args.o

$(VERA_LIBDIR)/pgRandom.o : pgRandom.c
	$(CC) -I$(VERA_HOME)/lib -o $(VERA_LIBDIR)/pgRandom.o -c pgRandom.c -fPIC $(CFLAGS)
$(VERA_LIBDIR)/get_plus_args.o: get_plus_args.c
	$(CC) -I$(VCS_HOME)/include -o $(VERA_LIBDIR)/get_plus_args.o -c get_plus_args.c -fPIC $(CFLAGS)

clean:	
	rm -rf  $(VERA_LIBDIR)/pgRandom.o $(VERA_LIBDIR)/get_plus_args.o
