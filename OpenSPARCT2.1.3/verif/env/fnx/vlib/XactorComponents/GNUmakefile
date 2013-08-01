# *************************************************************************
#
#
#  Original Author:  
#  Creation Date  :  
#
#  File name      :  GNUmakefile                                         
#  Description    :  makefile for building Vera lib components
#
#                    Users of this lib should call make using this
#                    makefile to build the exportable objects.  This makefile
#                    may use make variables exported from superior makes
#                    processes.
#
# *************************************************************************

#--------------------------------------------------------------------
# Use `lib' to define the name of the library we are building.
# the exported library will be called $(lib).libvrl
#--------------------------------------------------------------------
lib			= XactorComponents

#--------------------------------------------------------------------
# Use `lib_list' to specify the names of libraries on which this library
# depends.  Be careful that these other libraries don't in turn depend on
# this one.
#--------------------------------------------------------------------
lib_list		= XactorFmwork

#--------------------------------------------------------------------
# Use `lib_XactorComponents_vera_src' to define the list of vera source files
# which compose this library.
#--------------------------------------------------------------------
lib_XactorComponents_vera_src		= XactorUtilities.vr \
					  XactorCtrl.vr \
					  XactorBinTree.vr \
                                          XactorBinTreeDupExpect.vr \
					  XactorList.vr \
                                          XactorListDupExpect.vr \
                                          XactorListOrdered.vr \
                                          XactorListWildCard.vr \
                                          XactorListWCDupExpect.vr \
					  XactorHash.vr \
					  XactorManager.vr \
                                          XactorBuilder.vr \
					  XactorTransaction.vr

#====================================================================
#======= you probably don't have to change anything below ===========
#====================================================================
# Get all the usual targets and dependencies.
#--------------------------------------------------------------------
include $(DV_ROOT)/verif/env/fnx/runsim/makefiles/Makefile.libtop
#====================================================================

#--------------------------- The End --------------------------------
