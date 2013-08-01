#
# to set up OpenSparc_T2 environment:
#

# User needs to define these new variables
setenv PROJECT OpenSparc_N2
setenv DV_ROOT /home/johndoe/OpenSPARCT2
setenv MODEL_DIR /home/johndoe/OpenSPARCT2_model
setenv TEMPDIR /var/tmp/cache.$USER/Cache

setenv TRE_ENTRY /
setenv TRE_SEARCH $DV_ROOT/tools/env/$PROJECT.iver

# User needs to define following paths depending on the environment

if ((`/bin/uname -s` == "SunOS") && (`/bin/uname -p` == "sparc")) then
  setenv CC_BIN /import/freetools/local/gcc/3.3.2/bin
  setenv AR_BIN /import/freetools/local/binutils/2.13/bin

# Please define VCS_HOME if using vcs, otherwise comment it out
  setenv VCS_HOME /import/EDAtools/vcs/vcsY-2006.06-7 

# Please define VERA_HOME if using vera, otherwise comment it out
  setenv VERA_HOME /import/EDAtools/vera/vera,vX-2005.12-1/5.x 

# Please define NOVAS_HOME only if you have Debussy, otherwise comment it out
  setenv NOVAS_HOME /import/EDAtools/debussy/debussy,v5.3v19/5.x

# Please define DENALI only if you have Denali Purespec PCI-Express.
# Required for the fullchip with PEU and NIU
   setenv DENALI /import/EDAtools/denali/v3.2.053_32bit
   setenv DENALIRC $DV_ROOT/verif/env/denalirc

# Please define NCV_HOME if using ncverilog, otherwise comment it out
  setenv NCV_HOME /import/EDAtools/ncverilog/ncverilog,v6.11.s3/5.x
  setenv CDS_INST_DIR $NCV_HOME
  setenv INSTALL_DIR $NCV_HOME
  setenv ARCH sun4v

  setenv LM_LICENSE_FILE /import/EDAtools/licenses/keys/synopsys/synopsys_key:/import/EDAtools/licenses/keys/cadence/cadence_key 

endif

# Please define SYN_HOME if you are running synopsys design compiler
setenv SYN_HOME /import/EDAtools/synopsys/synopsys.vX-2005.09 

# Synopsys variables from $SYN_HOME

setenv SYN_LIB $SYN_HOME/libraries/syn
setenv SYN_BIN $SYN_HOME/sparcOS5/syn/bin

# Set Perl related variables
if ((`uname -s` == "SunOS") && (`uname -p` == "sparc")) then
  setenv PERL_VER 5.8.0
  setenv PERL_MODULE_BASE $DV_ROOT/tools/perlmod
  setenv PERL_PATH $DV_ROOT/tools/perl-$PERL_VER
  setenv PERL5_PATH $PERL_PATH/lib
  setenv PERL_CMD "$PERL_PATH/bin/perl"
else
  setenv PERL_CMD "/usr/bin/perl"
endif


# Set path

set path = (. /bin /usr/bin /usr/ccs/bin $DV_ROOT/tools/bin $PERL_PATH/bin $VCS_HOME/bin $VERA_HOME/bin $SYN_BIN $NOVAS_HOME/bin $CC_BIN $DV_ROOT/tools/bin /import/gnutools/exe /usr/dist/share/sunstudio_sparc,v11.0/SUNWspro/bin $path)

setenv LD_LIBRARY_PATH "/usr/lib:$CC_HOME/lib:$DV_ROOT/tools/SunOS/sparc/lib:$DV_ROOT/tools/src/nas,`configsrch nas`/lib/python/lib"

# this is specifically for NC-Verilog

setenv LD_LIBRARY_PATH $VERA_HOME/lib:$NCV_HOME/tools/lib:$NCV_HOME/tools/verilog/lib:$NCV_HOME/tools/inca/lib:${LD_LIBRARY_PATH}

setenv LD_LIBRARY_PATH $NOVAS_HOME/share/PLI/nc`configsrch debussy_ncv /`/SOLARIS2/nc_loadpli1:$DV_ROOT/verif/env/common/pli/monitor/loadpli:$DV_ROOT/verif/env/common/pli/global_chkr/loadpli:$DV_ROOT/verif/env/common/pli/socket/loadpli:$DV_ROOT/verif/env/common/pli/bwutility/loadpli:$DV_ROOT/verif/env/common/pli/cache/loadpli:$DV_ROOT/verif/model/infineon/loadpli:${LD_LIBRARY_PATH}

setenv LD_LIBRARY_PATH_64 $LD_LIBRARY_PATH
