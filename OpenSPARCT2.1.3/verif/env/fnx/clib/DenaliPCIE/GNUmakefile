VERA_LIBDIR            ?= ./lib
denali_dir              = $(DENALI)

pli			= denali_pcie

cds_inc_dir		= $(VCS_HOME)/include

#denali_veriuser_c	= ./cc/veriuser.c   ## dnh - not needed by vcs
#denali_veriuser_o	= ./cc/veriuser.o

denali_pcievera_c	= $(denali_dir)/ddvapi/vera/pcievera.c

#denali_pcievera_o	= ./cc/pcievera.o
denali_pcievera_o	= $(VERA_LIBDIR)/pcievera.o

denali_pli_tab		= $(denali_dir)/verilog/pli.tab

denali_verlib_o		= $(denali_dir)/verilog/denverlib.o

#static_pli_tab 		= $(pli).tab
static_pli_tab 		= $(VERA_LIBDIR)/$(pli).tab
#static_pli_obj		= $(pli).o
static_pli_obj		= $(VERA_LIBDIR)/$(pli).o

#dynamic_pli_lib		= $(pli).so
dynamic_pli_lib		= $(VERA_LIBDIR)/$(pli).so
dynamic_pli_obj		= $(denali_veriuser_o) $(static_pli_obj)

#directc_pli_lib		= $(pli).dl
directc_pli_lib		= $(VERA_LIBDIR)/$(pli).dl

.PHONY: all
all: $(static_pli_tab) $(static_pli_obj) $(dynamic_pli_lib) $(directc_pli_lib)

$(static_pli_tab) : $(denali_pli_tab) $(denali_rev)
	$(RM) $@
	$(cp) $(denali_pli_tab) $@

$(static_pli_obj) : $(denali_verlib_o) $(static_pli_tab) $(denali_rev)
	$(RM) $@
	$(cp) $(denali_verlib_o) $@

$(denali_veriuser_o) : $(denali_veriuser_c) $(denali_rev)
	$(RM) $@
	$(cc) -fPIC -c $(denali_veriuser_c) -I$(cds_inc_dir) -I${VERA_HOME}/lib/vlog -I$(denali_dir)/verilog -o $@

$(denali_pcievera_o) : $(denali_pcievera_c) $(denali_rev)
	$(RM) $@
	$(cc) -DDEN_PCIE_VERA=1 -fPIC -c $(denali_pcievera_c) -I${VERA_HOME}/lib -I$(denali_dir) -I$(denali_dir)/ddvapi -g -o $@

$(directc_pli_lib) : $(denali_pcievera_o) $(denali_rev)
	$(RM) $@
	$(ld) -G $(denali_pcievera_o) -o $(directc_pli_lib)

$(dynamic_pli_lib) : $(dynamic_pli_obj) $(denali_rev)
	$(RM) $@
	$(ld) -G $(denali_veriuser_o) $(static_pli_obj) -lsocket -lnsl -lintl -o $@

#clean clobber ::
#	$(RM)	$(static_pli_tab) $(static_pli_obj)
#	$(RM)	$(dynamic_pli_obj) $(dynamic_pli_lib)
#	$(RM)	$(denali_veriuser_o) $(denali_pcievera_o) $(directc_pli_lib)


#-----------------------------------------------------------------------------
# Get the common definitions if we haven't already
#-----------------------------------------------------------------------------
include $(DV_ROOT)/verif/env/fnx/runsim/makefiles/Makefile.defs
#-----------------------------------------------------------------------------
