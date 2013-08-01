--
--======================================================================
--Copyright 1999-2003 by Denali Software, Inc.  All rights reserved.
--======================================================================
--
--This SOMA file describes a memory model, using Denali Software's
--proprietary SOMA language.  By using this SOMA file, you agree to the
--following terms.  If you do not agree to these terms, you may not use
--this SOMA file.
--
--Subject to the restrictions set forth below, Denali Software grants
--you a non-exclusive, non-transferable license only to use this SOMA
--file to simulate the memory described in it using tools supplied by
--Denali Software.
--
--You may not:
--
--  (1)  Use this SOMA file to create software programs or tools that use
--       SOMA files as either input or output.
--
--  (2)  Modify this SOMA file or the SOMA language in any manner.
--
--  (3)  Use this SOMA file to create other languages for describing
--       memory models.
--
--  (4)  Distribute this SOMA file to others.
--
--This SOMA file is based on information received by Denali Software
--from third parties.  DENALI SOFTWARE PROVIDES THIS SOMA FILE "AS IS"
--AND EXPRESSLY DISCLAIMS ALL REPRESENTATIONS, WARRANTIES AND
--CONDITIONS, INCLUDING BUT NOT LIMITED TO WARRANTIES AND CONDITIONS OF
--MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE, TITLE AND
--NONINFRINGEMENT.  DENALI SOFTWARE'S AGGREGATE LIABILITY ARISING FROM
--YOUR USE OF THIS SOMA FILE IS LIMITED TO ONE U.S. DOLLAR.
--
--If you have any questions or if you would like to inquire about
--obtaining additional or different rights in SOMA files or the SOMA
--language, please contact Denali Software, at www.denali.com or at
--info@denalisoft.com.
--
--Written on 03 Apr 2003
--PureView version: 3.100  $DENALI: /home/scratch/guoqing/work/main/platform/SunOS/denali
Version 0.001
pcie

Sizes
SpecVersion "1.0A2"
linkWidths "1 2 4 8"
numDownPort 1
numRCRB 0
BusNumber 0
portNumber 0
numFunc 1
FuncNumber 0
RCRBid 0
configID 0
portRCRBid 0
VendorID 0
DeviceID 0
RevisionID 0
BaseClass 0
SubClass 0
InterfaceClass 0
InterruptNum 1
ROMsize 0
SubSysID 0
SubVendorID 0
Breg0Width 64
Breg0Size 36
Breg0RdMin 0
Breg0RdMax 0
Breg1Width 32
Breg1Size 10
Breg1RdMin 0
Breg1RdMax 0
Breg2Width 32
Breg2Size 10
Breg2RdMin 0
Breg2RdMax 0
Breg3Width 32
Breg3Size 10
Breg3RdMin 0
Breg3RdMax 0
Breg4Width 32
Breg4Size 10
Breg4RdMin 0
Breg4RdMax 0
Breg5Width 32
Breg5Size 10
Breg5RdMin 0
Breg5RdMax 0
BrPrimBus 0
BrSecBus 0
BrSubBus 0
brBreg0Width 32
brBreg0Size 10
brBreg0RdMin 0
brBreg0RdMax 0
brBreg1Width 32
brBreg1Size 10
brBreg1RdMin 0
brBreg1RdMax 0
PMSCsel 0
PMSCsca 0
PMSCdata 0
PMCaux 0
MSInumMsg 1
PCIEdevMaxPL 4096
PCIEdevPF 3
PCIEdevTag 8
PCIEdevPowLimit 0
PCIEdcMaxPL 512
PCIEdcMaxRead 4096
PCIElkPort 0
PCIElcRCB 64
PCIEslNum 0
PCIEslPowLimit 0
PCIEXvc1Evc 0
PCIEXvc1LEvc 0
PCIEXvc1Arb 0
PCIEXvcARsel 0
PCIEXvcARtab "0"
PCIEXvcR0FCPH 115
PCIEXvcR0FCPD 2047
PCIEXvcR0FCNPH 115
PCIEXvcR0FCNPD 2047
PCIEXvcR0FCCPLH 0
PCIEXvcR0FCCPLD 0
PCIEXvcR0time 0
PCIEXvcR0map 255
PCIEXvcR0sel 0
PCIEXvcR0tab "0"
PCIEXvcR1FCPH 1
PCIEXvcR1FCPD 257
PCIEXvcR1FCNPH 1
PCIEXvcR1FCNPD 1
PCIEXvcR1FCCPLH 0
PCIEXvcR1FCCPLD 0
PCIEXvcR1time 0
PCIEXvcR1map 0
PCIEXvcR1sel 0
PCIEXvcR1vcID 1
PCIEXvcR1tab "0"
PCIEXds1 0
PCIEXds2 0
PCIEXpbDVal 0
PCIEXpbDsubState 0
PCIEXpbDstate 0
CntPollingActiveTS1 16
CntPollingConfigTS1 16
linkNum "0"
numFTS 2
invertPolarity "0"
DLretBuf 4096
TLplSize 4096
TLtrSize 20
TLCplQSize 16
vendorIDS ""
PCIEXvcR2FCPH 1
PCIEXvcR2FCPD 257
PCIEXvcR2FCNPH 1
PCIEXvcR2FCNPD 1
PCIEXvcR2FCCPLH 0
PCIEXvcR2FCCPLD 0
PCIEXvcR2time 0
PCIEXvcR2map 0
PCIEXvcR2sel 0
PCIEXvcR2vcID 1
PCIEXvcR2tab "0"
PCIEXvcR3FCPH 1
PCIEXvcR3FCPD 257
PCIEXvcR3FCNPH 1
PCIEXvcR3FCNPD 1
PCIEXvcR3FCCPLH 0
PCIEXvcR3FCCPLD 0
PCIEXvcR3time 0
PCIEXvcR3map 0
PCIEXvcR3sel 0
PCIEXvcR3vcID 1
PCIEXvcR3tab "0"
PCIEXvcR4FCPH 1
PCIEXvcR4FCPD 257
PCIEXvcR4FCNPH 1
PCIEXvcR4FCNPD 1
PCIEXvcR4FCCPLH 0
PCIEXvcR4FCCPLD 0
PCIEXvcR4time 0
PCIEXvcR4map 0
PCIEXvcR4sel 0
PCIEXvcR4vcID 1
PCIEXvcR4tab "0"
PCIEXvcR5FCPH 1
PCIEXvcR5FCPD 257
PCIEXvcR5FCNPH 1
PCIEXvcR5FCNPD 1
PCIEXvcR5FCCPLH 0
PCIEXvcR5FCCPLD 0
PCIEXvcR5time 0
PCIEXvcR5map 0
PCIEXvcR5sel 0
PCIEXvcR5vcID 1
PCIEXvcR5tab "0"
PCIEXvcR6FCPH 1
PCIEXvcR6FCPD 257
PCIEXvcR6FCNPH 1
PCIEXvcR6FCNPD 1
PCIEXvcR6FCCPLH 0
PCIEXvcR6FCCPLD 0
PCIEXvcR6time 0
PCIEXvcR6map 0
PCIEXvcR6sel 0
PCIEXvcR6vcID 1
PCIEXvcR6tab "0"
PCIEXvcR7FCPH 1
PCIEXvcR7FCPD 257
PCIEXvcR7FCNPH 1
PCIEXvcR7FCNPD 1
PCIEXvcR7FCCPLH 0
PCIEXvcR7FCCPLD 0
PCIEXvcR7time 0
PCIEXvcR7map 0
PCIEXvcR7sel 0
PCIEXvcR7vcID 1
PCIEXvcR7tab "0"
laneRXstatus " 0 1"
txLaneSKEW "0"
numSKIP 1
laneTxDisable " 0"
laneRxDisable " 0"
redundantInitFc1Dllps 2
redundantInitFc2Dllps 2
DevNumber 0
CardBus 0
portCount 1
CacheLsize 0
InterruptLine 0
capPtr 0
Cardbus 0
ROMsize0 0
BrSLTval 0
ROMsize1 0
PMCaddr 0
capPMPtr 0
MSIaddr 0
capMSIPtr 0
AGPaddr 0
capAGPPtr 0
AGPsize 3
VPDaddr 0
capVPDPtr 0
VPDsize 2
SLOTaddr 0
capSLOTPtr 0
SLOTsize 1
HSaddr 0
capHSPtr 0
HSsize 1
PCIXaddr 0
capPCIXPtr 0
PCIXsize 1
AMDaddr 0
capAMDPtr 0
AMDsize 1
VSaddr 0
capVSPtr 0
VSsize 4
DPaddr 0
capDPPtr 0
DPsize 1
CRCaddr 0
capCRCPtr 0
CRCsize 1
HPaddr 0
capHPPtr 0
HPsize 1
PCIEaddr 0
capPEPtr 0
PCIEAEaddr 0
capAEPtr 0
PCIEVCaddr 0
capVCPtr 0
PCIEXvcARloc 0
PCIEDSaddr 0
capDSPtr 0
PCIEPBaddr 0
capPBPtr 0
numSymbolErrors 4
skipIntervalMax 1538
skipIntervalMin 1180
beaconSymbol "K28.5+"
DlTxQueueDelay 0
DlRxQueueDelay 0
capSLOTcnt 0
capSSIDaddr 0
capSSIDPtr 0
capSSIDvid 0
capSSIDsid 0
phyLaneCount 8
refClkMultiplier 1
NFTSWithCommonClock 27
NFTSWithoutCommonClock 27
txBitSkewValues "random"
txSymbolSkewValues "random"
TLpmeSize 1
TLCRSCnt 1
TLTxQDelay 0
MSIXaddr 0
capMSIXPtr 0
MSIXts 1
MSIXtblOS 0
MSIXtblBIR 0
MSIXpbaOS 0
MSIXpbaBIR 0
PCIEdsOwnNP 1
PCIEXaeImTr 1
PCIEXaeImFC 1
PCIEXaeImCA 1
PCIEXaeImRcvrOvf 1
PCIEXaeImEcrc 1
PCIEXaeImRcvr 1
PCIEXvcR0offset 0
PCIEXvcR1offset 0
PCIEXvcR2offset 0
PCIEXvcR3offset 0
PCIEXvcR4offset 0
PCIEXvcR5offset 0
PCIEXvcR6offset 0
PCIEXvcR7offset 0
PCIEXvsecDef ""

Features
ModelMode 1
DeviceMode 0
MonitorMode 1
Layer 1
modelTLP 1
modelLLP 1
modelPLP 1
intLayer 1
intLbit 1
intLsymbol 0
intLbyte 0
intLpipe 0
intLpacket 0
DeviceType 1
RC 1
Switch 0
Bridge 0
PCIEtoPCI 0
PCItoPCIE 0
Endpoint 0
Express 0
Legacy 0
Port 1
genSoma 1
genRCRB 0
genConfig0 1
genConfig1 0
upstream 0
hasRCRB 0
ConfigSpace 0
CommonConfig 0
ClassCode 0
BIST 0
Command 1
IOspace 1
MEMspace 1
EnBusMaster 0
EnParityError 0
EnSERR 0
DisINT 0
ROMbase 0
ROMen 0
config0 1
baseReg0 1
Breg0IO 0
Breg0Pref 0
baseReg1 1
Breg1IO 0
Breg1Pref 0
baseReg2 0
Breg2IO 0
Breg2Pref 0
baseReg3 0
Breg3IO 0
Breg3Pref 0
baseReg4 0
Breg4IO 0
Breg4Pref 0
baseReg5 0
Breg5IO 0
Breg5Pref 0
config1 0
brBaseReg0 0
brBreg0IO 0
brBreg0Pref 0
brBaseReg1 0
brBreg1IO 0
brBreg1Pref 0
BrIOrange 0
BrIO16 0
BrIO32 0
BrPreMemRange 0
BrPreMem32 0
BrPreMem64 0
BridgeCtrl 0
BrPerrRes 0
BrSERR 0
PMCap 1
PMdata 0
PMCd1 0
PMCd2 0
PMCd3cold 0
PMCd3hot 0
PMCdsi 0
MSI 0
MSI64en 0
PCIECap 1
PCIEslot 0
PCIEdev 1
PCIEdevL0 0
PCIEdevL00 1
PCIEdevL01 0
PCIEdevL02 0
PCIEdevL03 0
PCIEdevL04 0
PCIEdevL05 0
PCIEdevL06 0
PCIEdevL07 0
PCIEdevL1 0
PCIEdevL10 1
PCIEdevL11 0
PCIEdevL12 0
PCIEdevL13 0
PCIEdevL14 0
PCIEdevL15 0
PCIEdevL16 0
PCIEdevL17 0
PCIEdevAttB 0
PCIEdevAttI 0
PCIEdevPowI 0
PCIEdevPowScale 0
PCIEdevPowScale0 1
PCIEdevPowScale1 0
PCIEdevPowScale2 0
PCIEdevPowScale3 0
PCIEdc 1
PCIEdcCorErr 0
PCIEdcNonFatalErr 0
PCIEdcFatalErr 0
PCIEdcUR 0
PCIEdcRelOrder 0
PCIEdcEtag 1
PCIEdcPF 1
PCIEdcAux 0
PCIEdcNoSnoop 1
PCIElk 0
PCIElkL0 1
PCIElkL00 1
PCIElkL01 0
PCIElkL02 0
PCIElkL03 0
PCIElkL04 0
PCIElkL05 0
PCIElkL06 0
PCIElkL1support 0
PCIElkL1 0
PCIElkL10 0
PCIElkL11 0
PCIElkL12 0
PCIElkL13 0
PCIElkL14 0
PCIElkL15 0
PCIElkL16 0
PCIElkL17 0
PCIElc 0
PCIElcL1 0
PCIElcLkDis 0
PCIElcExtSyn 0
PCIEls 1
PCIElsSlot 1
PCIEsl 0
PCIEslAttB 0
PCIEslPow 0
PCIEslMRL 0
PCIEslAttI 0
PCIEslPowI 0
PCIEslHPS 0
PCIEslHPen 0
PCIEslPowScale 0
PCIEslPowScale0 1
PCIEslPowScale1 0
PCIEslPowScale2 0
PCIEslPowScale3 0
PCIEsc 0
PCIEscAttB 0
PCIEscPowF 0
PCIEscMRL 0
PCIEscPres 0
PCIEscCom 0
PCIEscHPI 0
PCIErc 0
PCIErcCorErr 0
PCIErcNonFatalErr 0
PCIErcFatalErr 0
PCIErcPME 0
PCIEX 0
PCIEXae 1
PCIEXaeUM 0
PCIEXaeUMtrain 0
PCIEXaeUMdll 1
PCIEXaeUMpoison 1
PCIEXaeUMfc 0
PCIEXaeUMcplTO 0
PCIEXaeUMcplAB 0
PCIEXaeUMun 0
PCIEXaeUMofl 1
PCIEXaeUMmal 1
PCIEXaeUMecrc 0
PCIEXaeUMus 0
PCIEXaeUV 0
PCIEXaeUVtrain 1
PCIEXaeUVdll 1
PCIEXaeUVpoison 0
PCIEXaeUVfc 0
PCIEXaeUVcplTO 0
PCIEXaeUVcplAB 0
PCIEXaeUVun 0
PCIEXaeUVofl 1
PCIEXaeUVmal 1
PCIEXaeUVecrc 0
PCIEXaeUVus 0
PCIEXaeCM 0
PCIEXaeCMrec 0
PCIEXaeCMtlp 0
PCIEXaeCMDLLP 0
PCIEXaeCMrepN 0
PCIEXaeCMrepT 0
PCIEXaeCT 0
PCIEXaeCTgenEn 0
PCIEXaeCTgenCap 0
PCIEXaeCTchkEn 0
PCIEXaeCTchkCap 0
PCIEXaeRC 0
PCIEXaeRCcor 0
PCIEXaeRCnonFatal 0
PCIEXaeRCfatal 0
PCIEXvc 1
PCIEXvc1 0
PCIEXvc2 0
PCIEXvc2arb1 0
PCIEXvc2arb2 0
PCIEXvc2arb4 0
PCIEXvc2arb8 0
PCIEXvcR0 1
PCIEXvcR0FC 1
PCIEXvcR0Ca 0
PCIEXvcR0Arb 0
PCIEXvcR0Arb0 1
PCIEXvcR0Arb1 0
PCIEXvcR0Arb2 0
PCIEXvcR0Arb3 0
PCIEXvcR0Arb4 0
PCIEXvcR0Arb5 0
PCIEXvcR0APS 0
PCIEXvcR0snoop 0
PCIEXvcR0CT 1
PCIEXvcR1 1
PCIEXvcR1FC 1
PCIEXvcR1Ca 0
PCIEXvcR1Arb 0
PCIEXvcR1Arb0 1
PCIEXvcR1Arb1 0
PCIEXvcR1Arb2 0
PCIEXvcR1Arb3 0
PCIEXvcR1Arb4 0
PCIEXvcR1Arb5 0
PCIEXvcR1APS 0
PCIEXvcR1snoop 0
PCIEXvcR1CT 0
PCIEXds 0
PCIEXpb 0
PCIEXpbD 0
PCIEXpbDsca 1
PCIEXpbDsca0 1
PCIEXpbDsca1 0
PCIEXpbDsca2 0
PCIEXpbDsca3 0
PCIEXpbDtype 1
PCIEXpbDtype0 1
PCIEXpbDtype1 0
PCIEXpbDtype2 0
PCIEXpbDtype3 0
PCIEXpbDtype7 0
PCIEXpbDrail 1
PCIEXpbDrail0 1
PCIEXpbDrail1 0
PCIEXpbDrail2 0
PCIEXpbDrail7 0
PCIEXpbC 0
PCIEXpbCsys 0
prot 1
PL 1
supportLaneReversal 1
reverseLanes 0
elecIdleValue 1
elecIdleValue0 1
elecIdleValue1 0
elecIdleValueZ 0
usePosSKP 0
DLL 1
TL 1
application 0
Sideband 1
sbWake 0
sbReset 1
PCIEXvcR2 1
PCIEXvcR2FC 1
PCIEXvcR2Ca 0
PCIEXvcR2Arb 0
PCIEXvcR2Arb0 1
PCIEXvcR2Arb1 0
PCIEXvcR2Arb2 0
PCIEXvcR2Arb3 0
PCIEXvcR2Arb4 0
PCIEXvcR2Arb5 0
PCIEXvcR2APS 0
PCIEXvcR2snoop 0
PCIEXvcR2CT 0
PCIEXvcR3 1
PCIEXvcR3FC 1
PCIEXvcR3Ca 0
PCIEXvcR3Arb 0
PCIEXvcR3Arb0 1
PCIEXvcR3Arb1 0
PCIEXvcR3Arb2 0
PCIEXvcR3Arb3 0
PCIEXvcR3Arb4 0
PCIEXvcR3Arb5 0
PCIEXvcR3APS 0
PCIEXvcR3snoop 0
PCIEXvcR3CT 0
PCIEXvcR4 1
PCIEXvcR4FC 1
PCIEXvcR4Ca 0
PCIEXvcR4Arb 0
PCIEXvcR4Arb0 1
PCIEXvcR4Arb1 0
PCIEXvcR4Arb2 0
PCIEXvcR4Arb3 0
PCIEXvcR4Arb4 0
PCIEXvcR4Arb5 0
PCIEXvcR4APS 0
PCIEXvcR4snoop 0
PCIEXvcR4CT 0
PCIEXvcR5 1
PCIEXvcR5FC 1
PCIEXvcR5Ca 0
PCIEXvcR5Arb 0
PCIEXvcR5Arb0 1
PCIEXvcR5Arb1 0
PCIEXvcR5Arb2 0
PCIEXvcR5Arb3 0
PCIEXvcR5Arb4 0
PCIEXvcR5Arb5 0
PCIEXvcR5APS 0
PCIEXvcR5snoop 0
PCIEXvcR5CT 0
PCIEXvcR6 1
PCIEXvcR6FC 1
PCIEXvcR6Ca 0
PCIEXvcR6Arb 0
PCIEXvcR6Arb0 1
PCIEXvcR6Arb1 0
PCIEXvcR6Arb2 0
PCIEXvcR6Arb3 0
PCIEXvcR6Arb4 0
PCIEXvcR6Arb5 0
PCIEXvcR6APS 0
PCIEXvcR6snoop 0
PCIEXvcR6CT 0
PCIEXvcR7 1
PCIEXvcR7FC 1
PCIEXvcR7Ca 0
PCIEXvcR7Arb 0
PCIEXvcR7Arb0 1
PCIEXvcR7Arb1 0
PCIEXvcR7Arb2 0
PCIEXvcR7Arb3 0
PCIEXvcR7Arb4 0
PCIEXvcR7Arb5 0
PCIEXvcR7APS 0
PCIEXvcR7snoop 0
PCIEXvcR7CT 0
pipeDevice 0
pipeMacro 0
pipe8bit 1
pipe16bit 0
RCRB 0
BARspec 0
ROMbase0 0
BrSecLat 1
BrSLTBurst2 1
BrSLT8 0
BrSLThardW 0
BrSecSt 0
BrSecSt66 0
BrSecStB2B 0
BrSecStDev 0
BrSecStDev0 1
BrSecStDev1 0
BrSecStDev2 0
ROMbase1 0
BrISA 0
BrVGA 0
BrVGA16 0
BrMasterAbort 0
BrFastB2B 0
BrSecDCTimer 0
BrTimerSerrEn 0
PMEsupport 0
PMEd0 1
PMEd1 1
PMEd2 1
MSIen 0
AGP 0
VPD 0
SLOT 0
HS 0
PCIX 0
AMD 0
VS 0
DP 0
CRC 0
HotPlug 0
PCIElcAspmDis 1
PCIEXae2UM 0
PCIEXae2UMta 0
PCIEXae2UMma 0
PCIEXae2UMrta 0
PCIEXae2UMrma 1
PCIEXae2UMue 1
PCIEXae2UMucMsg 0
PCIEXae2UMucData 1
PCIEXae2UMucAttr 1
PCIEXae2UMucAddr 1
PCIEXae2UMdelay 1
PCIEXae2UMperr 0
PCIEXae2UMserr 1
PCIEXae2UMint 0
PCIEXae2US 0
PCIEXae2USta 0
PCIEXae2USma 0
PCIEXae2USrta 0
PCIEXae2USrma 0
PCIEXae2USue 0
PCIEXae2USucMsg 1
PCIEXae2USucData 0
PCIEXae2USucAttr 1
PCIEXae2USucAddr 1
PCIEXae2USdelay 0
PCIEXae2USperr 0
PCIEXae2USserr 1
PCIEXae2USint 0
reverseLaneNumbers 1
skipInterval 0
mergeErrMsgs 0
disVDMsg0 1
disVDMsg1 1
disPoisonTX 0
AS_EP 0
capSLOT1st 0
SSID 0
PcieSpecVersion 1
SpecVersion_1_0a2 1
SpecVersion_1_1 0
RelativeOrderOnlyInitDllps 0
PHY 0
PL_PHY 0
unknownValue 1
unknownValue0 1
unknownValue1 0
unknownValueZ 0
unknownValueX 0
unknownTimingWindow 0
recoveryFinishesCurrentPkt 1
capBeacon 0
capLBmaster 0
capXLink 0
fcTimeout 0
implRCMEM 0
implRCIO 0
mfCRS 1
disP2P 0
ImInterruptLine 1
ImMasEn 1
MasEn 1
ImMwrInv 1
PMEclk 0
B2B3 0
BPCCen 0
PMEd3cold 1
PMEd3hot 1
PMEImEn 1
MSIPVMen 0
MSIX 0
PCIEdcImRelOrder 1
PCIEdcImEtag 1
PCIEdcImPF 1
PCIEdcImAux 1
PCIEdcImNoSnoop 1
PCIEdcImMaxRead 1
PCIEds 0
PCIElkL07 0
PCIElcL0s 1
PCIEXvcR0FCPHun 0
PCIEXvcR0FCPDun 0
PCIEXvcR0FCNPHun 0
PCIEXvcR0FCNPDun 0
PCIEXvcR0FCCPLHun 0
PCIEXvcR0FCCPLDun 0
PCIEXvcR1FCPHun 0
PCIEXvcR1FCPDun 0
PCIEXvcR1FCNPHun 0
PCIEXvcR1FCNPDun 0
PCIEXvcR1FCCPLHun 0
PCIEXvcR1FCCPLDun 0
PCIEXvcR2FCPHun 0
PCIEXvcR2FCPDun 0
PCIEXvcR2FCNPHun 0
PCIEXvcR2FCNPDun 0
PCIEXvcR2FCCPLHun 0
PCIEXvcR2FCCPLDun 0
PCIEXvcR3FCPHun 0
PCIEXvcR3FCPDun 0
PCIEXvcR3FCNPHun 0
PCIEXvcR3FCNPDun 0
PCIEXvcR3FCCPLHun 0
PCIEXvcR3FCCPLDun 0
PCIEXvcR4FCPHun 0
PCIEXvcR4FCPDun 0
PCIEXvcR4FCNPHun 0
PCIEXvcR4FCNPDun 0
PCIEXvcR4FCCPLHun 0
PCIEXvcR4FCCPLDun 0
PCIEXvcR5FCPHun 0
PCIEXvcR5FCPDun 0
PCIEXvcR5FCNPHun 0
PCIEXvcR5FCNPDun 0
PCIEXvcR5FCCPLHun 0
PCIEXvcR5FCCPLDun 0
PCIEXvcR6FCPHun 0
PCIEXvcR6FCPDun 0
PCIEXvcR6FCNPHun 0
PCIEXvcR6FCNPDun 0
PCIEXvcR6FCCPLHun 0
PCIEXvcR6FCCPLDun 0
PCIEXvcR7FCPHun 0
PCIEXvcR7FCPDun 0
PCIEXvcR7FCNPHun 0
PCIEXvcR7FCNPDun 0
PCIEXvcR7FCCPLHun 0
PCIEXvcR7FCCPLDun 0
PCIEXvsec 0

Pins
TX TX 8
TX_ TX_ 8
RX RX 8
RX_ RX_ 8
CLK_TX CLK_TX 1
CLK_RX CLK_RX 1
TxData TxData 8
TxDataK TxDataK 1
RxData RxData 8
RxDataK RxDataK 1
PCLK PCLK 1
WAKE_ WAKE_ 1
PERST_ PERST_ 1
TxDetectRx TxDetectRx 1
TxElecIdle TxElecIdle 1
TxCompliance TxCompliance 1
RxPolarity RxPolarity 1
Reset_ Reset_ 1
PowerDown PowerDown 2
RxValid RxValid 1
PhyStatus PhyStatus 1
RxElecIdle RxElecIdle 1
RxStatus RxStatus 3

Timing
ttoPollSpeed 400.12 ps
ttoCfgLnWaitUp 2 ms
ttoCfgLnWaitDn 2 ms
ttoPollConfig 48 ms
ttoPollActive 2 us
ttoDetectQuiet 400 ns
ttoDetectActive 200 ns
ttoCfgLkStartDn 24 ms
ttoCfgLkStartUp 24 ms
ttoCfgCompDn 2 ms
ttoCfgCompUp 24 ms
ttoCfgLkAcceptDn 2 ms
ttoCfgLkAcceptUp 2 ms
ttoCfgIdle 2 ms
ttoRcvrCfg 48 ms
ttoRcvrLock 24 ms
ttoRcvrIdle 2 ms
ttoDisabled 2 ms
ttoHotReset 2 ms
ttoLoopback 2 ms
ttoTLCpl 1000 ns
ttxUImin 399.88 ps
ttxUImax 400.12 ps
ttxIDLEmin 50 clk
ttxSetToIDLEmax 20 clk
ttxLaneSKEWmax 1300 ps
ttxCxLKmin 0 ms
ttxCxLKmax 1 ms
trxUImin 399.88 ps
trxUImax 400.12 ps
trxSetToDetectmax 10 ms
trxTotalSKEWmax 20 ns
ttoFcInitRollover disabled
ttxIdleToDiff disabled
ttoTLCplRx disabled
ttoFCmin disabled
ttoFCmax disabled
ttoPMEmin disabled
ttoPMEmax disabled
ttoL0smax disabled
ttoL0smin disabled
ttoL1aspmmin disabled
ttoL1aspmmax disabled
ttoTurnOffmax disabled
ttoPMmax disabled
ttoD3hot2D0max disabled
ttoPMHSmax disabled
ttoCRSmax disabled
ttoSysInit disabled
ttxIdleToValid disabled
ttxReceiverDetect disabled
ttxFCmin disabled
ttxFCmax disabled
ttxFCESmin disabled
ttxFCESmax disabled
ttxPhyLatency disabled
trxPhyLatency disabled
ttxLoopbackEnableLatency disabled
ttxBeaconMax disabled
ttxBeaconMin disabled
trxBeaconMax disabled
trxBeaconMin disabled
trxElecIdleMax disabled
trxElecIdleMin disabled
ttxDetectRxMax disabled
ttxDetectRxMin disabled
trxPhyLockMax disabled
tP0ToP0sMax disabled
tP0ToP0sMin disabled
tP0ToP1Max disabled
tP0ToP1Min disabled
tP0ToP2Max disabled
tP0ToP2Min disabled
tP0sToP0Max disabled
tP0sToP0Min disabled
tP1ToP0Max disabled
tP1ToP0Min disabled
tP2ToP1Max disabled
tP2ToP1Min disabled
tP2ShutdownMax disabled
tP2ShutdownMin disabled
tP1StartupMax disabled
tP1StartupMin disabled
tResetToReadyMax disabled
tResetToReadyMin disabled
ttxPCLKToDataValidMax disabled
ttxPCLKToDataValidMin disabled
trxPCLKSetupMax disabled
trxPCLKHoldMin disabled
ttxResetToOutputMax disabled
ttxResetToOutputMin disabled
ttxAsyncPhyStatusMax disabled
ttxAsyncPhyStatusMin disabled

