#  Creation Date  :  08/24/2004
#
#  File name      :  GNUmakefile                                         
#  Description    :  makefile for building DMUXtr
#
# *************************************************************************
lib		= DMUXtr
lib_list	= 

# for now, generate its own headers.
lib_additional_vera_cmp_args = 

# tell runsim to concatenate the vera files
lib_$(lib)_combine_vera = 1

#--------------------------------------------------------------------
# Use `lib_$(lib)_vera_src' to define the list of vera source files
# which compose this library.
#--------------------------------------------------------------------
include vera/Makefile.include

#----------------------------------------------------------------
#
# get all the usual targets and dependencies.
#
include $(DV_ROOT)/verif/env/fire/runsim/makefiles/Makefile.libtop
#----------------------------------------------------------------
