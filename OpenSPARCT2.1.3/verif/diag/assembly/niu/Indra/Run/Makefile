################################################################################
## $Id: Makefile,v 1.1.1.1 2007/02/13 22:20:25 drp Exp $
##
## File:        Makefile
## Notes:       runs with "gmake" only, not with "make"
##
## Description:
## -----------
##      Makefile to generate testcases and diaglist from Indra jal files
##
################################################################################

DIAG_COUNT = 1

all:	create_indra

create_indra: FcNiuTxRand_DMA_PktCnt

set_jalpath:
	setenv JALPATH "${DV_ROOT}/verif/diag/assembly/niu/Indra"

FcNiuTxRand_DMA_PktCnt:
	@echo " -----------------------------------------------------"
	@echo " Creating Diag and Diaglist from FcNiuBasicTxRand.j"
	@echo " -----------------------------------------------------"
	@rm -rf ${DV_ROOT}/verif/diag/assembly/niu/Indra/raw_random/FcNiuBasicTxMac0Rand/*
	indra -p=FcNiuTxRand_DMA_PktCnt FcNiuBasicTxRand.j -t=1 -c=$(DIAG_COUNT) -D TX_DMA_CH_NO -D TX_PKT_CNT -D TX_DESC_START_ADDR
	@chmod +w ${DV_ROOT}/verif/diag/diaglists/fc/FcNiuTxRand_DMA_PktCnt.diaglist
	@ls -l ${DV_ROOT}/verif/diag/assembly/niu/Indra/raw_random/FcNiuTxRand_DMA_PktCnt | \
	awk '{print $$9}' >> ${DV_ROOT}/verif/diag/diaglists/fc/FcNiuTxRand_DMA_PktCnt.diaglist
