# include $(INSTALL_DIR)/tools.lnx86/inca/files/Makefile.nc.defines
include Makefile.nc.defines
# Uncomment the following line to use the GCC compiler
USE_COMPILER = gcc
# Uncomment the following line to use the C++ compiler to link shared libs
USE_LINKER = gcc
# include $(INSTALL_DIR)/tools.lnx86/inca/files/Makefile.nc.$(ARCH)
include Makefile.nc.$(ARCH)

################# PUT ALL USER MACROS AFTER THIS LINE #################

#
# Makefile.nc
#
# This makefile can be used as a template makefile for statically or
# dynamically linking PLI/VPI, LMSI, or SWIFT code into the NC-Verilog tools
# For C++ Rules and Macros refer to 'C++ HOWTO' in this file.
#
# All of the defines in this Makefile also exist in
#   $(INSTALL_DIR)/tools.lnx86/inca/files/Makefile.nc.defines
# By modifying them here, you will override the default values there.
#
# Any targets that you do not need can be safely deleted from this file.
#

#
# The TARGETDIR macro should be set to the directory where the resulting
# executables should be placed. This defaults to the current directory.
#
TARGETDIR=.

# Shared libraries
VPILIB = $(TARGETDIR)/libvpi.$(SHARED_LIB_POSTFIX)
# PLILIB = $(TARGETDIR)/libpli.$(SHARED_LIB_POSTFIX)
PLILIB = $(TARGETDIR)/libverapli.$(SHARED_LIB_POSTFIX)
VHPILIB = $(TARGETDIR)/libvhpi.$(SHARED_LIB_POSTFIX)
CFCLIB = $(TARGETDIR)/libcfc.$(SHARED_LIB_POSTFIX)
FMILIB = $(TARGETDIR)/libfmi.$(SHARED_LIB_POSTFIX)
DPILIB = $(TARGETDIR)/libdpi.$(SHARED_LIB_POSTFIX)

#
# Set this to the set of targets that you want executed.  For example, if
# you want to create a libpli.so file, then set it to:
#
FIRST_TARGET = $(PLILIB)

# 
# Specify any defines that you want set by uncommenting the USR_DEFINES
# Macro below.  All defines should have a '-D' prefix to work properly
# e.g. INCA, INCA_test, MYTEST and ETC are defined below.
# 
# USR_DEFINES = -DINCA -DINCA_test -DMYTEST -DETC

#
# The VPI_USER_C macro should be set to the vpi_user.c file containing any
# user defined 'C' routines for use with VPI (PLI 2.0).
# vpi_user.c can be copied from $(INSTALL_DIR)/tools.lnx86/inca/src/vpi_user.c
#
VPI_USER_C = ./vpi_user.c
# VPI_USER_O = $(TARGETDIR)/vpi_user.$(OBJ_POSTFIX)
VPI_USER_O =

#
# The VPI_OBJECTS_SAFE macro should be set to the object files which you do
# not want deleted in "clean" target.
#
VPI_OBJECTS_SAFE = 

#
# Add any VPI objects which need to be compiled, and can be deleted using the
# "clean" target here:
#
VPI_OBJECTS = 

#
# Add any library linking options needed to resolve external references for
# the VPILIB shared library
#
VPI_EXTERN_LIBS =

#
# The VERIUSER_C macro should be set to the veriuser.c file containing any
# user defined 'C' routines for use with PLI 1.0.
# veriuser.c can be copied from $(INSTALL_DIR)/tools.lnx86/inca/src/veriuser.c
#
VERIUSER_C = ./veriuser.c
# VERIUSER_O = $(DV_ROOT)/verif/env/common/pli/vera/loadpli/veriuser.$(OBJ_POSTFIX)
VERIUSER_O =

#
# The PLI_OBJECTS_SAFE macro should be set to the object files which you do
# not want deleted in "clean" target.
#
PLI_OBJECTS_SAFE = $(DV_ROOT)/verif/env/common/pli/vera/loadpli/linux/vmc.o \
	$(DV_ROOT)/verif/env/common/pli/vera/loadpli/linux/veriuser.o \
	$(VERA_HOME)/lib/vlog/libSysSciTask.a \
	$(VERA_HOME)/lib/vlog/libvlog_br.a \
	$(VERA_HOME)/lib/libVERA.a \
	$(VERA_HOME)/lib/vera_user.o

#
# Add any PLI objects which need to be compiled, and can be deleted using the
# "clean" target here:
#
PLI_OBJECTS = 

#
# Add any library linking options needed to resolve external references for
# the PLILIB shared library
#
PLI_EXTERN_LIBS =

#
# The VHPI_OBJECTS_SAFE macro should be set to the object files which you do
# not want deleted in "clean" target.
#
VHPI_OBJECTS_SAFE = 

#
# Add any VHPI objects which need to be compiled, and can be deleted using the
# "clean" target here:
#
VHPI_OBJECTS = 

#
# Add any library linking options needed to resolve external references for
# the VHPILIB shared library
#
VHPI_EXTERN_LIBS =

#
# The CFC_OBJECTS_SAFE macro should be set to the object files which you do
# not want deleted in "clean" target.
#
CFC_OBJECTS_SAFE = 

#
# Add any CFC objects which need to be compiled, and can be deleted using the
# "clean" target here:
#
CFC_OBJECTS = 

#
# Add any library linking options needed to resolve external references for
# the CFCLIB shared library
#
CFC_EXTERN_LIBS =

#
# The FMI_OBJECTS_SAFE macro should be set to the object files which you do
# not want deleted in "clean" target.
#
FMI_OBJECTS_SAFE = 

#
# Add any FMI objects which need to be compiled, and can be deleted using the
# "clean" target here:
#
FMI_OBJECTS = 

#
# Add any library linking options needed to resolve external references for
# the FMILIB shared library
#
FMI_EXTERN_LIBS =

#
# The DPI_OBJECTS_SAFE macro should be set to the object files which you do
# not want deleted in "clean" target.
#
DPI_OBJECTS_SAFE =

#
# Add any DPI objects which need to be compiled, and can be deleted using the
# "clean" target here:
#
DPI_OBJECTS =

#
# Add any library linking options needed to resolve external references for
# the DPILIB shared library
#
DPI_EXTERN_LIBS =

DPI_USER_C = ./_sv_export.c
DPI_USER_O = $(TARGETDIR)/_sv_export.$(OBJ_POSTFIX)

#
# LMC_HOME is set to the swift installation
# Shared library path environment variable should be set to include the
# path of the swift shared library.
#
LMC_HOME = 

#
# The SFI_ROOT macro should be set to the lmsi installation
#
SFI_ROOT =

#
# The NCELAB macro should be set to the name of the elaborator which should
# be generated by the static link.
#
NCELAB = $(TARGETDIR)/ncelab

#
# The NCSIM macro should be set to the name of the simulator which should
# be generated by the static link.
#
NCSIM = $(TARGETDIR)/ncsim

#
# The TARGETS macro should be set to pli/vpi objects/executables with statically
# linked PLI/VPI objects
#
PLI_O_TARGETS = $(VERIUSER_O) $(PLI_OBJECTS) $(PLI_OBJECTS_SAFE)
VPI_O_TARGETS = $(VPI_USER_O) $(VPI_OBJECTS) $(VPI_OBJECTS_SAFE)
VHPI_O_TARGETS = $(VHPI_OBJECTS) $(VHPI_OBJECTS_SAFE)
DPI_O_TARGETS = $(DPI_OBJECTS) $(DPI_OBJECTS_SAFE)

# To add PLI 1.0 applications when linking statically, add $(PLI_O_TARGETS) to
# the O_TARGETS list below.
#
# To add VPI applications when linking statically, add $(VPI_O_TARGETS) to
# the O_TARGETS list below.
#
# To add VHPI applications when linking statically, add $(VHPI_O_TARGETS) to
# the O_TARGETS list below.
#
#O_TARGETS = $(PLI_O_TARGETS) $(VPI_O_TARGETS) $(VHPI_O_TARGETS)

O_TARGETS = 

# The CFC_O_TARGETS and FMI_O_TARGETS should be set to CFC/FMI objects/
# executables with statically linked CFC/FMI objects respectively
CFC_O_TARGETS = $(CFC_OBJECTS) $(CFC_OBJECTS_SAFE)
FMI_O_TARGETS = $(FMI_OBJECTS) $(FMI_OBJECTS_SAFE)

# To add CFC applications to ncsim when linking statically, add $(CFC_O_TARGETS)
# to the NCSIM_O_TARGETS list below.
#
# To add FMI applications to ncsim when linking statically, add $(FMI_O_TARGETS)
# to the NCSIM_O_TARGETS list below.

NCSIM_O_TARGETS = \
	$(CFC_OBJECTS) $(CFC_OBJECTS_SAFE) \
	$(FMI_OBJECTS) $(FMI_OBJECTS_SAFE)

TARGETS = $(NCELAB) $(NCSIM)

# DYNAMIC LINKING

# Begin targets for PLI/VPI dynamic linking
# The dynamic target builds the NC executables for debugging with shared
# libraries
# The shared_libs target builds the VPI and PLI shared libraries.
#

DYN_TARGETS = $(NCELAB)_dynamic $(NCSIM)_dynamic

#
#
#
# C++ HOWTO
# 
# History:
# The Elaborator as well as the Simulator routines are written in C.
# The supporting library routines are written in C too.  However, there
# are applications which have been written using C++. There are
# some 3rd party vendors that have written their IP in C++ too. We 
# therefore need a way to integrate all of this into a single Elaborator
# executable and a single Simulator executable.
#
# In order for C++ objects to be properly integrated with the ncelab and
# ncsim objects (i.e. ncelab.$(OBJ_POSTFIX) and ncsim.$(OBJ_POSTFIX)) it
# is required that the main() routine be compiled using C++.  That was
# the motivation for the following set of Rules and Macros.
#
# Gotchas:
# There are some quirks that you should be aware of before integrating
# the C++ routines.
#
# o You should ensure that the same C++ compiler is used to compile all
#   of the code, including the IP's provided by 3rd party vendor's.
#   It is not possible for a user.cc, compiled using CC and vendor.cc,
#   compiled using gcc, to be integrated together, due to name-mangling and
#   various other issues.
#
# o The routines and variables in your C++ code that are used in veriuser.c 
#   and vpi_user.c, should be explicitly declared in your C++ code as an 
#   'extern "C"'. This tells the C++ compiler not to mangle the names that 
#   will eventually be used in routines compiled using a C compiler.  e.g.
#   File: veriuser.c
#   ----------------
#     extern int hello_world(int);
#     s_tfcell veriusertfs[TF_MAXARRAY] = {
#       {usertask, 0, 0, 0, (int (*)())hello_world, 0, "$hello_world", 1 },
#       0 
#     };
#
#   File: user_code.cc
#   -------------------
#     extern "C" int hello_world(int);
#     extern "C" void io_printf(char*);
#     int hello_world(int foo) { io_printf("Hello World\n"); return(foo);}
#
# o If you intend on including some of the VPI/PLI include files, you
#   should ensure that proper defines are put in place. e.g.
#   File: user_code.cc
#   -------------------
#     #define PROTO_PARAMS(params) params
#     #define PLI_EXTERN extern "C"
#     #include <stdio.h>
#     #include "vpi_user.h"
#     #undef PROTO_PARAMS
#     #undef PLI_EXTERN
#     /* Other routines and declarations. */
#
# o '.cc' is the assumed extension of all the C++ files used here.  You 
#   should make appropriate corrections if you are using different
#   extensions, via the CC_EXTENSION macro.
#
# o You should copy over main.cc and veriuser.c and/or vpi_user.c from
#   $(INSTALL_DIR)/tools.lnx86/inca/src and make the appropriate changes before
#   using them.
#
# o You should remember to modify the following macros as appropriate.
#   CCC              -> To specify the C++ compiler (Default: CC)
#   CCFLAGS          -> Flags for the C++ compiler (Default: CFLAGS)
#   CC_EXTENSION     -> Extensions for C++ files (Default: .cc)
#   TARGETDIR        -> Directory where targets will be put (Default: .)
#   VPI_USER_C       -> Your vpi_user.c file if any (Default: ./vpi_user.c)
#   VERIUSER_C       -> Your veriuser.c file if any (Default: ./veriuser.c)
#   CCC_MAIN_CC      -> main.cc copied from $(INSTALL_DIR)/tools.lnx86/inca/src
#   CCC_OBJECTS      -> Objects created from your C++ files
#


#
# The CCC_MAIN_CC macro should be set to the main.cc file containing the
# main() routine.  This topmost routine should be compiled using a C++
# compiler.  It can be copied from $(INSTALL_DIR)/tools.lnx86/inca/src/main.cc.
# If copied to another location make appropriate changes to following macros.
#
CCC_MAIN_CC = $(INSTALL_DIR)/tools.lnx86/inca/src/main.$(CC_EXTENSION)
CCC_MAIN_O = main.$(OBJ_POSTFIX)


#
# The CCC_OBJECTS macro should be populated with the names of your
# C++ files' objects.  For example:
#   If your sources are foo1.cc and foo2.cc then
#     CCC_OBJECTS = foo1.$(OBJ_POSTFIX) foo2.$(OBJ_POSTFIX)
# These objects will be deleted by the 'clean' target.
#
CCC_OBJECTS = 


#
# The CCC_OBJECTS_SAFE macro should be populated with the names of your
# C++ files' objects.  For example:
#   If your sources are foo1.cc and foo2.cc then
#     CCC_OBJECTS_SAFE = foo1.$(OBJ_POSTFIX) foo2.$(OBJ_POSTFIX)
# These objects will *NOT* be deleted by the 'clean' target.
#
CCC_OBJECTS_SAFE = 


#
# The OCCC_TARGETS macro should be set to pli/vpi objects 
# OCCC_TARGETS = $(VPI_USER_O) $(VERIUSER_O) $(CCC_OBJECTS) $(CCC_OBJECTS_SAFE) 
#
OCCC_TARGETS = 

CCC_TARGETS = $(NCELAB)C $(NCSIM)C

################# PUT ALL USER MACROS BEFORE THIS LINE #################
include $(INSTALL_DIR)/tools.lnx86/inca/files/Makefile.nc.targets
