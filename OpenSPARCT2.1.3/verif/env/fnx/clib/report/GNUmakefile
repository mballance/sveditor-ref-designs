# *************************************************************************
#
#
#  Creation Date  :  2001
#
#  Description    :  makefile for C++ ReportClass
#
#-------------------------------------------------------------------------------
# Makefile for C++ ReportClass library
#-------------------------------------------------------------------------------


VERA_LIBDIR    ?= ./lib

pli			= report

cds_inc_dir		= $(VCS_HOME)/include

static_pli_tab		 = $(pli).tab
static_pli_lib		 = $(VERA_LIBDIR)/$(pli).a
static_pli_obj		 = $(VERA_LIBDIR)/report_pli.o \
			   $(VERA_LIBDIR)/report_pli_util.o

dynamic_pli_lib		 = $(VERA_LIBDIR)/$(pli).so
#dynamic_pli_obj		 = ./cc/veriuser.o $(static_pli_lib) # order matters

dynamic_pli_obj          = $(static_pli_lib)

test_pli_obj		 = $(VERA_LIBDIR)/report_test.o

#--------------------------------------------------------------------------------

#ccflags		= -fPIC -I./include -I$(cds_inc_dir) -g
ccflags			= -fpic -I./include -I$(cds_inc_dir) -g
#cppflags		= -fPIC -I./include -I$(cds_inc_dir) -g -pedantic
cppflags		= -fpic -I./include -I$(cds_inc_dir) -g -pedantic

CCFLAGS			= -KPIC -I./include -I$(cds_inc_dir) -dalign -xtarget=ultra #-xO4 
CPPFLAGS		= -KPIC -I./include -I$(cds_inc_dir) -dalign -xtarget=ultra #-xO4

report_cc_headers	= ./include/Hash.h \
			  ./include/cReport.h \
			  ./include/report_info.h \
			  ./include/report_msg_format.h

report_cc_src 		= Hash.cc \
			  cReport.cc

#report_cc_obj		= $(VERA_LIBDIR)/$(report_cc_src:.cc=.o)
report_cc_obj		= $(VERA_LIBDIR)/Hash.o \
                          $(VERA_LIBDIR)/cReport.o


#--------------------------------------------------------------------------------

.PHONY: all test
all: $(static_pli_lib) $(dynamic_pli_lib)

$(static_pli_lib) : $(static_pli_obj) $(static_pli_tab) $(report_cc_obj)
	$(ar) rv $(static_pli_lib) $(static_pli_obj) $(report_cc_obj)

ifeq ($(USE_CC),) # {
$(dynamic_pli_lib) : $(dynamic_pli_obj)
	$(ld) -G  $(dynamic_pli_obj) -o $(dynamic_pli_lib)

$(VERA_LIBDIR)/%.o: cc/%.cc
	$(cpp) $(cppflags) -c $< -o $@

$(VERA_LIBDIR)/%.o: cc/%.c
	$(cc) $(ccflags) -c $< -o $@

test : all $(test_pli_obj)
	$(ld) $(test_pli_obj) $(static_pli_lib) -o test

else # }{

$(dynamic_pli_lib) : $(dynamic_pli_obj)
	$(LD) -G $(dynamic_pli_obj) -o $(dynamic_pli_lib)

$(VERA_LIBDIR)/%.o: cc/%.cc
	$(CPP) $(CPPFLAGS) -c $< -o $@

$(VERA_LIBDIR)/%.o: cc/%.c
	$(CC) $(CCFLAGS) -c $< -o $@

test : all $(test_pli_obj)
	$(LD) $(test_pli_obj) $(static_pli_lib) -o test

endif # }


#clean clobber ::
#	$(RM) $(static_pli_obj) $(static_pli_lib) 
##	$(RM) $(static_pli_obj) $(static_pli_lib) $(static_pli_tab)
#	$(RM) $(dynamic_pli_obj) $(dynamic_pli_lib)
#	$(RM) $(report_cc_obj)

#-----------------------------------------------------------------------------
# Get the common definitions if we haven't already
#-----------------------------------------------------------------------------
include $(DV_ROOT)/verif/env/fnx/runsim/makefiles/Makefile.defs
#-----------------------------------------------------------------------------
