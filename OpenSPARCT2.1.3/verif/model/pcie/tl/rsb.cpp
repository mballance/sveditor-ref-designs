#include "rsb.hpp"
#include "pcie_common/logger.hpp"

namespace pcie{

    /**
     *  This method initializes module registers and flags.
     *  It also spawns threads that handle module operation.
     */
    void rsb::init(){
        for(unsigned int i=0; i<NUM_RSB_ENTRIES ; i++){
            rsb_db[i].vld=0;
        }
        POR_RESET=false;
        STOP_TIMER=false;
        eg_handler_ph = sc_spawn(sc_bind(&rsb::eg_handler,this));
        update_timer_ph = sc_spawn(sc_bind(&rsb::update_timer,this));
        LOG_INFO << "RSB: SW Reset : threads spawned";
    }

    /**
     *  This thread processes ingress TLP CMPL headers. Detected errors are flagged and reported.
     */
    void rsb::ing_handler(){
        RefPciePacket in_pkt;
        while(1){
            try{
                ing_port->get(in_pkt);
                LOG_DEBUG << "ITL->RSB: Get Packet: " << in_pkt->getPacketId() << "\n";
                sc_uint<RSB_TAG_SIZE> rsb_tag = GET_TLP_CMPL_TAG(in_pkt).range(RSB_TAG_SIZE-1,0);

                rs2it_err = 0;  //Reset error bits

                if(in_pkt->isCmpl()){
                    sc_uint<64> peu_diag_reg = csr_port.read_csr(PEU_CSR_A_TLU_DIAG_HW_ADDR);
                    LOG_DEBUG << "PEU_DIAG_CSR: " << peu_diag_reg;

                    if( (!rsb_db[rsb_tag].vld) ||
                            (GET_TLP_CMPL_REQ_ID(in_pkt)!=rsb_db[rsb_tag].req_id) || 
                            (in_pkt->get_byte(TLP_HDR_START) == tlp_CplLk) || 
                            (in_pkt->get_byte(TLP_HDR_START) == tlp_CplDLk)  ||
                            (rsb_db[rsb_tag].vld && (rsb_db[rsb_tag].tlp_tag != GET_TLP_CMPL_TAG(in_pkt)))
                      ){
                        //Check for Unsolicited CMPLs

                        LOG_WARNING << "Warning: Unsolicited CMPLs " ;
                        rs2it_err.range(3,3) = 1;

                    } else if(in_pkt->hasData() && GET_TLP_CMPL_STATUS(in_pkt)!=0 && GET_TLP_CMPL_STATUS(in_pkt)!=0x2){
                        //Check for Malformed Completion/////////////////////////////////
                        //1. CplD with unsuccessful status

                        LOG_WARNING << "Warning: CplD with unsuccessful status." ;
                        rs2it_err.range(2,2) = 1;

                    } else if((peu_diag_reg.range(40,40)!=1) &&  //Error check is not disabled
                            (GET_TLP_CMPL_STATUS(in_pkt)==0x2 &&
                             (rsb_db[rsb_tag].raw_payload[0] != tlp_CfgRd0 &&
                              rsb_db[rsb_tag].raw_payload[0] != tlp_CfgRd1 &&
                              rsb_db[rsb_tag].raw_payload[0] != tlp_CfgWr0 &&
                              rsb_db[rsb_tag].raw_payload[0] != tlp_CfgWr1 ))
                            ) {
                        //2. completion status is "configuration retry" for a non-configuration PIO request.

                        LOG_WARNING << "Warning: completion status is configuration retry for a non-configuration PIO request." ;
                        rs2it_err.range(2,2) = 1;

                    } else if((in_pkt->get_byte(TLP_HDR_START) == tlp_CplD) &&
                            ((rsb_db[rsb_tag].raw_payload[0] == tlp_MWr_32) ||
                             (rsb_db[rsb_tag].raw_payload[0] == tlp_MWr_64) ||
                             (rsb_db[rsb_tag].raw_payload[0] == tlp_IOWr) ||
                             (rsb_db[rsb_tag].raw_payload[0] == tlp_CfgWr0) ||
                             (rsb_db[rsb_tag].raw_payload[0] == tlp_CfgWr1) )
                            ) {
                        //3. CplD associates with a PIO write request.

                        LOG_WARNING << "Warning: CplD associates with a PIO write request. " ;
                        rs2it_err.range(2,2) = 1;

                    } else if((in_pkt->get_byte(TLP_HDR_START) == tlp_Cpl) &&
                            ( GET_TLP_CMPL_STATUS(in_pkt) == 0) &&
                            ((rsb_db[rsb_tag].raw_payload[0] == tlp_MRd_32) ||
                             (rsb_db[rsb_tag].raw_payload[0] == tlp_MRd_64) ||
                             (rsb_db[rsb_tag].raw_payload[0] == tlp_IORd) ||
                             (rsb_db[rsb_tag].raw_payload[0] == tlp_CfgRd0) ||
                             (rsb_db[rsb_tag].raw_payload[0] == tlp_CfgRd1) )
                            ) {
                        //4. Successful Cpl associates with a PIO read request.

                        LOG_WARNING << "Warning: Successful Cpl associates with a PIO read request." ;
                        rs2it_err.range(2,2) = 1;

                    } else if((GET_TLP_ATTR(in_pkt)!=0 && peu_diag_reg.range(42,42)!=1) || (GET_TLP_TC(in_pkt)!=0 && peu_diag_reg.range(41,41)!=1)) {
                        //5. Hdr field mis-match: (i) TC!=0. (ii) Attr!=0
                        LOG_WARNING << "Warning: Incorrect (non-zero) Attr/TC fields. Attr: " << GET_TLP_ATTR(in_pkt) << " TC: " << GET_TLP_TC(in_pkt) ;
                        rs2it_err.range(2,2) = 1;

                    } else if( in_pkt->get_byte(TLP_HDR_START) == tlp_CplD &&
                            (GET_TLP_LEN(in_pkt) != (rsb_db[rsb_tag].raw_payload[2].range(1,0),rsb_db[rsb_tag].raw_payload[3]))
                            ){
                        // (iii) length for CplD

                        LOG_WARNING << "Warning: length for CplD" ;
                        rs2it_err.range(2,2) = 1;

                    } else if( (peu_diag_reg.range(43,43)!=1) &&  //Error check is not disabled
                            (((rsb_db[rsb_tag].raw_payload[0] == tlp_IORd || rsb_db[rsb_tag].raw_payload[0] == tlp_IOWr ||
                               rsb_db[rsb_tag].raw_payload[0] == tlp_CfgRd0 ||            //if IO/Cfg Rd/Wr, byteCount==4
                               rsb_db[rsb_tag].raw_payload[0] == tlp_CfgWr0 || rsb_db[rsb_tag].raw_payload[0] == tlp_CfgRd1 ||
                               rsb_db[rsb_tag].raw_payload[0] == tlp_CfgWr1 ) && (GET_TLP_BYTEC(in_pkt)!=0x4) ) ||

                             ((rsb_db[rsb_tag].raw_payload[0] == tlp_MRd_32 || rsb_db[rsb_tag].raw_payload[0] == tlp_MRd_64) &&
                              (GET_TLP_BYTEC(in_pkt) != rsb_db[rsb_tag].expect_bc) )
                            )
                            ) {    
                        // (iv) Byte Count (it should be 12?h4 in Cpl/CplD resulted from PIO io/cfg rd/wr requests)

                        LOG_WARNING << "Warning: Byte Count (it should be 12?h4 in Cpl/CplD resulted from PIO io/cfg rd/wr requests). ByteCnt= " << GET_TLP_BYTEC(in_pkt) ;
                        rs2it_err.range(2,2) = 1;

                    } else if(  (peu_diag_reg.range(44,44)!=1) &&  //Error check is not disabled
                            (((rsb_db[rsb_tag].raw_payload[0] == tlp_IORd || rsb_db[rsb_tag].raw_payload[0] == tlp_IOWr ||
                               rsb_db[rsb_tag].raw_payload[0] == tlp_CfgRd0 ||            //if IO/Cfg Rd/Wr, lowAddr==0
                               rsb_db[rsb_tag].raw_payload[0] == tlp_CfgWr0 || rsb_db[rsb_tag].raw_payload[0] == tlp_CfgRd1 ||
                               rsb_db[rsb_tag].raw_payload[0] == tlp_CfgWr1 ) && (GET_TLP_CMPL_LADDR(in_pkt)!=0) ) ||

                             ((rsb_db[rsb_tag].raw_payload[0] == tlp_MRd_32 || rsb_db[rsb_tag].raw_payload[0] == tlp_MRd_64) &&
                              (GET_TLP_CMPL_LADDR(in_pkt) != rsb_db[rsb_tag].expect_la) )
                            ) 
                            ) {
                        // (v) Lower Address (it should be 7?b0 in Cpl/CplD resulted from PIO io/cfg rd/wr requests)

                        LOG_WARNING << "Warning: Lower Address (it should be 7?b0 in Cpl/CplD resulted from PIO io/cfg rd/wr requests). LowAddr= " << GET_TLP_CMPL_LADDR(in_pkt) ;
                        rs2it_err.range(2,2) = 1;

                        //////////////////////////////////////////////////////////////////
                    } else if( GET_TLP_CMPL_STATUS(in_pkt)==0x2 &&
                            (rsb_db[rsb_tag].raw_payload[0] == tlp_CfgRd0 ||
                             rsb_db[rsb_tag].raw_payload[0] == tlp_CfgRd1 ||
                             rsb_db[rsb_tag].raw_payload[0] == tlp_CfgWr0 ||
                             rsb_db[rsb_tag].raw_payload[0] == tlp_CfgWr1 )
                            ){
                        LOG_WARNING << "Configuration retry error - completion status in Cpl header is configuration retry for a configuration PIO request." ;
                        rs2it_err.range(1,1) = 1;
                    } else if( (peu_diag_reg.range(40,40)==1) &&
                            GET_TLP_CMPL_STATUS(in_pkt)!=0x0 &&
                            (rsb_db[rsb_tag].raw_payload[0] == tlp_IORd ||
                             rsb_db[rsb_tag].raw_payload[0] == tlp_MRd_32 ||
                             rsb_db[rsb_tag].raw_payload[0] == tlp_MRd_64 ||
                             rsb_db[rsb_tag].raw_payload[0] == tlp_CfgRd0 ||
                             rsb_db[rsb_tag].raw_payload[0] == tlp_CfgRd1 )
                            ){
                        LOG_WARNING << "Unsuccessful read error - completion resulted from PIO read request, whose status in Cpl header is not successful completion" ;
                        rs2it_err.range(4,4) = 1;
                        rsb_db[rsb_tag].vld=false;
                    } else if( (peu_diag_reg.range(40,40)==1) &&
                            GET_TLP_CMPL_STATUS(in_pkt)!=0x0 &&
                            (rsb_db[rsb_tag].raw_payload[0] == tlp_IOWr ||
                             rsb_db[rsb_tag].raw_payload[0] == tlp_MWr_32 ||
                             rsb_db[rsb_tag].raw_payload[0] == tlp_MWr_64 ||
                             rsb_db[rsb_tag].raw_payload[0] == tlp_CfgWr0 ||
                             rsb_db[rsb_tag].raw_payload[0] == tlp_CfgWr1 )
                            ){
                        LOG_WARNING << "Unsuccessful write error - completion resulted from PIO write request, whose status in Cpl header is not successful completion" ;
                        rs2it_err.range(5,5) = 1;
                        rsb_db[rsb_tag].vld=false;
                    } else if( GET_TLP_CMPL_STATUS(in_pkt)==0x4 &&
                            (rsb_db[rsb_tag].raw_payload[0] == tlp_IORd ||
                             rsb_db[rsb_tag].raw_payload[0] == tlp_MRd_32 ||
                             rsb_db[rsb_tag].raw_payload[0] == tlp_MRd_64 ||
                             rsb_db[rsb_tag].raw_payload[0] == tlp_CfgRd0 ||
                             rsb_db[rsb_tag].raw_payload[0] == tlp_CfgRd1 )
                            ){
                        LOG_WARNING << "Rd CMPL with Completer Abort Status set" ;
                        rs2it_err.range(4,4) = 1;
                    } else if( GET_TLP_CMPL_STATUS(in_pkt)==0x4 &&
                            (rsb_db[rsb_tag].raw_payload[0] == tlp_IOWr ||
                             rsb_db[rsb_tag].raw_payload[0] == tlp_CfgWr0 ||
                             rsb_db[rsb_tag].raw_payload[0] == tlp_CfgWr1 )
                            ){
                        LOG_WARNING << "Wr CMPL with Completer Abort Status set" ;
                        rs2it_err.range(5,5) = 1;

                    } else if(((GET_TLP_CMPL_STATUS(in_pkt)==0x1) ||   //CMPL Status is UR 
                                (GET_TLP_CMPL_STATUS(in_pkt)!=0x0 && GET_TLP_CMPL_STATUS(in_pkt)!=0x1 &&   //or CMPL Status is a reserved value
                                 GET_TLP_CMPL_STATUS(in_pkt)!=0x2 && GET_TLP_CMPL_STATUS(in_pkt)!=0x4)) &&
                            (rsb_db[rsb_tag].raw_payload[0] == tlp_IOWr ||
                             rsb_db[rsb_tag].raw_payload[0] == tlp_CfgWr0 ||
                             rsb_db[rsb_tag].raw_payload[0] == tlp_CfgWr1 )
                            ){
                        LOG_WARNING << "IO/CfgWr with UR status" ;
                        rs2it_err.range(5,5) = 1;
                    } else if( ((GET_TLP_CMPL_STATUS(in_pkt)==0x1) ||   //CMPL Status is UR 
                                (GET_TLP_CMPL_STATUS(in_pkt)!=0x0 && GET_TLP_CMPL_STATUS(in_pkt)!=0x1 &&   //or CMPL Status is a reserved value
                                 GET_TLP_CMPL_STATUS(in_pkt)!=0x2 && GET_TLP_CMPL_STATUS(in_pkt)!=0x4)) &&
                            (rsb_db[rsb_tag].raw_payload[0] == tlp_IORd ||
                             rsb_db[rsb_tag].raw_payload[0] == tlp_MRd_32 ||
                             rsb_db[rsb_tag].raw_payload[0] == tlp_MRd_64 ||
                             rsb_db[rsb_tag].raw_payload[0] == tlp_CfgRd0 ||
                             rsb_db[rsb_tag].raw_payload[0] == tlp_CfgRd1 )
                            ){
                        LOG_WARNING << "Rd CMPL with UR Status set" ;
                        rs2it_err.range(4,4) = 1;

                    } else {
                        rsb_db[rsb_tag].vld=false;
                    }
                    /////////////////////////////////////////////////////////////////
                    if(rs2it_err==0)
                        ing_port->put(false);
                    else {
                        if(rs2it_err.range(4,4)==1 || rs2it_err.range(5,5)==1)
                            ing_port->put(false);
                        else
                            ing_port->put(true);

                        //CSR Error Bit and Header Log updates
                        //Error Bits
                        sc_uint<64> peu_oes_clr_reg; //PEU Other Event   Error Clr Status Reg
                        sc_uint<64> peu_ues_clr_reg; //PEU Uncorrectable Error Clr Status Reg
                        if(rs2it_err.range(2,2)==1){
                            write_error_csr(OE,22,54,"mfc");
                        }
                        if(rs2it_err.range(1,1)==1){
                            write_error_csr(OE,15,47,"crs");
                        }
                        if(rs2it_err.range(4,4)==1){
                            write_error_csr(OE,16,48,"ruc");
                        }
                        if(rs2it_err.range(5,5)==1){
                            write_error_csr(OE,17,49,"wuc");
                        }

                        if(rs2it_err.range(3,3)==1 ){
                            write_error_csr(UE,16,48,"uc");

                            sc_uint<64> peu_rcv_ueh1_log_reg; //PEU Recv Other Event Header1 Log Register
                            sc_uint<64> peu_rcv_ueh2_log_reg; //PEU Recv Other Event Header2 Log Register 
                            peu_rcv_ueh1_log_reg(63,56) = in_pkt->get_byte(TLP_HDR_START+ 0);
                            peu_rcv_ueh1_log_reg(55,48) = in_pkt->get_byte(TLP_HDR_START+ 1);
                            peu_rcv_ueh1_log_reg(47,40) = in_pkt->get_byte(TLP_HDR_START+ 2);
                            peu_rcv_ueh1_log_reg(39,32) = in_pkt->get_byte(TLP_HDR_START+ 3);
                            peu_rcv_ueh1_log_reg(31,24) = in_pkt->get_byte(TLP_HDR_START+ 4);
                            peu_rcv_ueh1_log_reg(23,16) = in_pkt->get_byte(TLP_HDR_START+ 5);
                            peu_rcv_ueh1_log_reg(15, 8) = in_pkt->get_byte(TLP_HDR_START+ 6);
                            peu_rcv_ueh1_log_reg( 7, 0) = in_pkt->get_byte(TLP_HDR_START+ 7);

                            peu_rcv_ueh2_log_reg(63,56) = in_pkt->get_byte(TLP_HDR_START+ 8);
                            peu_rcv_ueh2_log_reg(55,48) = in_pkt->get_byte(TLP_HDR_START+ 9);
                            peu_rcv_ueh2_log_reg(47,40) = in_pkt->get_byte(TLP_HDR_START+10);
                            peu_rcv_ueh2_log_reg(39,32) = in_pkt->get_byte(TLP_HDR_START+11);
                            if(GET_TLP_FMT(in_pkt) == 1 || GET_TLP_FMT(in_pkt) == 3)
                            {
                                peu_rcv_ueh2_log_reg(31,24) = in_pkt->get_byte(TLP_HDR_START+12);
                                peu_rcv_ueh2_log_reg(23,16) = in_pkt->get_byte(TLP_HDR_START+13);
                                peu_rcv_ueh2_log_reg(15, 8) = in_pkt->get_byte(TLP_HDR_START+14);
                                peu_rcv_ueh2_log_reg( 7, 0) = in_pkt->get_byte(TLP_HDR_START+15);
                            }
                            LOG_INFO << "RUEH1: " << peu_rcv_ueh1_log_reg ;
                            LOG_INFO << "RUEH2: " << peu_rcv_ueh2_log_reg ;
                            csr_port.write_csr(PEU_CSR_A_RUE_HDR1_HW_ADDR,peu_rcv_ueh1_log_reg);
                            csr_port.write_csr(PEU_CSR_A_RUE_HDR2_HW_ADDR,peu_rcv_ueh2_log_reg);
                        }

                        //Log Header
                        if(rs2it_err.range(2,2)==1 || rs2it_err.range(1,1)==1 || rs2it_err.range(4,4)==1 || rs2it_err.range(5,5)==1){
                            sc_uint<64> peu_rcv_oeh1_log_reg; //PEU Recv Other Event Header1 Log Register
                            sc_uint<64> peu_rcv_oeh2_log_reg; //PEU Recv Other Event Header2 Log Register 
                            peu_rcv_oeh1_log_reg(63,56) = in_pkt->get_byte(TLP_HDR_START+ 0);
                            peu_rcv_oeh1_log_reg(55,48) = in_pkt->get_byte(TLP_HDR_START+ 1);
                            peu_rcv_oeh1_log_reg(47,40) = in_pkt->get_byte(TLP_HDR_START+ 2);
                            peu_rcv_oeh1_log_reg(39,32) = in_pkt->get_byte(TLP_HDR_START+ 3);
                            peu_rcv_oeh1_log_reg(31,24) = in_pkt->get_byte(TLP_HDR_START+ 4);
                            peu_rcv_oeh1_log_reg(23,16) = in_pkt->get_byte(TLP_HDR_START+ 5);
                            peu_rcv_oeh1_log_reg(15, 8) = in_pkt->get_byte(TLP_HDR_START+ 6);
                            peu_rcv_oeh1_log_reg( 7, 0) = in_pkt->get_byte(TLP_HDR_START+ 7);

                            peu_rcv_oeh2_log_reg(63,56) = in_pkt->get_byte(TLP_HDR_START+ 8);
                            peu_rcv_oeh2_log_reg(55,48) = in_pkt->get_byte(TLP_HDR_START+ 9);
                            peu_rcv_oeh2_log_reg(47,40) = in_pkt->get_byte(TLP_HDR_START+10);
                            peu_rcv_oeh2_log_reg(39,32) = in_pkt->get_byte(TLP_HDR_START+11);
                            if(GET_TLP_FMT(in_pkt) == 1 || GET_TLP_FMT(in_pkt) == 3)
                            {
                                peu_rcv_oeh2_log_reg(31,24) = in_pkt->get_byte(TLP_HDR_START+12);
                                peu_rcv_oeh2_log_reg(23,16) = in_pkt->get_byte(TLP_HDR_START+13);
                                peu_rcv_oeh2_log_reg(15, 8) = in_pkt->get_byte(TLP_HDR_START+14);
                                peu_rcv_oeh2_log_reg( 7, 0) = in_pkt->get_byte(TLP_HDR_START+15);
                            }
                            LOG_INFO << "ROEH1: " << peu_rcv_oeh1_log_reg ;
                            LOG_INFO << "ROEH2: " << peu_rcv_oeh2_log_reg ;
                            csr_port.write_csr(PEU_CSR_A_ROE_HDR1_HW_ADDR,peu_rcv_oeh1_log_reg);
                            csr_port.write_csr(PEU_CSR_A_ROE_HDR2_HW_ADDR,peu_rcv_oeh2_log_reg);


                            sc_uint<RSB_TAG_SIZE> tlp_tag = GET_TLP_CMPL_TAG(in_pkt).range(RSB_TAG_SIZE-1,0);
                            sc_uint<64> peu_xmt_oeh1_log_reg; //PEU Xmit Other Event Header1 Log Register
                            sc_uint<64> peu_xmt_oeh2_log_reg; //PEU Xmit Other Event Header2 Log Register 
                            peu_xmt_oeh1_log_reg(63,56) = rsb_db[tlp_tag].raw_payload[0];
                            peu_xmt_oeh1_log_reg(55,48) = rsb_db[tlp_tag].raw_payload[1];
                            peu_xmt_oeh1_log_reg(47,40) = rsb_db[tlp_tag].raw_payload[2];
                            peu_xmt_oeh1_log_reg(39,32) = rsb_db[tlp_tag].raw_payload[3];
                            peu_xmt_oeh1_log_reg(31,24) = rsb_db[tlp_tag].raw_payload[4];
                            peu_xmt_oeh1_log_reg(23,16) = rsb_db[tlp_tag].raw_payload[5];
                            peu_xmt_oeh1_log_reg(15, 8) = rsb_db[tlp_tag].raw_payload[6];
                            peu_xmt_oeh1_log_reg( 7, 0) = rsb_db[tlp_tag].raw_payload[7];

                            peu_xmt_oeh2_log_reg(63,56) = rsb_db[tlp_tag].raw_payload[8];
                            peu_xmt_oeh2_log_reg(55,48) = rsb_db[tlp_tag].raw_payload[9];
                            peu_xmt_oeh2_log_reg(47,40) = rsb_db[tlp_tag].raw_payload[10];
                            peu_xmt_oeh2_log_reg(39,32) = rsb_db[tlp_tag].raw_payload[11];
                            peu_xmt_oeh2_log_reg(31,24) = rsb_db[tlp_tag].raw_payload[12];
                            peu_xmt_oeh2_log_reg(23,16) = rsb_db[tlp_tag].raw_payload[13];
                            peu_xmt_oeh2_log_reg(15, 8) = rsb_db[tlp_tag].raw_payload[14];
                            peu_xmt_oeh2_log_reg( 7, 0) = rsb_db[tlp_tag].raw_payload[15];
                            LOG_INFO << "TOEH1: " << peu_xmt_oeh1_log_reg ;
                            LOG_INFO << "TOEH2: " << peu_xmt_oeh2_log_reg ;
                            csr_port.write_csr(PEU_CSR_A_TOE_HDR1_HW_ADDR,peu_xmt_oeh1_log_reg);
                            csr_port.write_csr(PEU_CSR_A_TOE_HDR2_HW_ADDR,peu_xmt_oeh2_log_reg);
                        }
                        if(rs2it_err.range(2,2)==1 || rs2it_err.range(1,1)==1)
                            cto_req_port->put(GET_TLP_CMPL_TAG(in_pkt).range(CTO_TAG_SIZE-1,0));
                    }
                }
                else
                    LOG_WARNING << "Warning: RSB has received a non-CMPL for processing." ;
            }
            catch(sc_exception &e){
                LOG_WARNING<<"RSB: ing_handler exception...remaining in the thread";
            }
        }//end while(1)
    } //ing_handler()

    /**
     *  This thread receives out-going TLP requests and populates the RSB for check on the ingress side.
     */
    void rsb::eg_handler(){
        LOG_INFO << "RSB: eg_handler begins...";
        RefPciePacket   in_pkt;
        try{
            while(1){
                eg_port.get_packet(in_pkt);
                LOG_DEBUG << "ETL->RSB: In_pkt: " << in_pkt->to_string();

                sc_uint<RSB_TAG_SIZE> rsb_tag = GET_TLP_REQ_TAG(in_pkt).range(RSB_TAG_SIZE-1,0);

                if(rsb_db[rsb_tag].vld)
                    LOG_WARNING << "\tWarning: RSB already has a valid entry at location: " << rsb_tag ;

                rsb_db[rsb_tag].vld = 1;
                rsb_db[rsb_tag].raw_payload.resize((in_pkt->get_pkt_size())-TLP_HDR_START);
                for(unsigned int i=0; i<(rsb_db[rsb_tag].raw_payload.size()) ; i++){
                    rsb_db[rsb_tag].raw_payload[i]=in_pkt->get_byte(TLP_HDR_START+i);
                }
                rsb_db[rsb_tag].tlp_tag = GET_TLP_REQ_TAG(in_pkt).range(CTO_TAG_SIZE-1,0);
                rsb_db[rsb_tag].timeout = get_Cpl_TO(); 
                if(rsb_db[rsb_tag].timeout == SC_ZERO_TIME) rsb_db[rsb_tag].infTO = true; 
                else rsb_db[rsb_tag].infTO = false;

                rsb_db[rsb_tag].req_id = GET_TLP_REQ_ID(in_pkt);

                sc_uint<4> becount = 0;
                sc_uint<8> benable = 0;
                benable=GET_TLP_BE(in_pkt);
                if(benable!=0){
                    if(benable.range(7,4)==0){
                        if(benable.range(3,0) == 1 || benable.range(3,0) == 2 || benable.range(3,0) == 4 || benable.range(3,0) == 8){
                            rsb_db[rsb_tag].expect_bc = 1;
                        } else if(benable.range(3,0) == 3 || benable.range(3,0) == 6 || benable.range(3,0) == 12){
                            rsb_db[rsb_tag].expect_bc = 2;
                        } else if(benable.range(0,0) == 1 && benable.range(3,3)==1 ){
                            rsb_db[rsb_tag].expect_bc = 4;
                        } else {
                            rsb_db[rsb_tag].expect_bc = 3;
                        }
                        unsigned int index = 0;
                        while(benable.range(index,index)!=1 && index<4) {becount++; index++;}
                        rsb_db[rsb_tag].expect_la.range(1,0) = becount;
                    } else {
                        unsigned int index = 0;
                        while(benable.range(index,index)!=1 && index<4) {becount++; index++;}
                        rsb_db[rsb_tag].expect_la.range(1,0) = becount;
                        if(GET_TLP_LEN(in_pkt)!=1){
                            index=7;
                            while(benable.range(index,index)!=1 && index>3) {becount++; index--;}
                        }
                        rsb_db[rsb_tag].expect_bc = GET_TLP_LEN(in_pkt)*4 - becount;
                    }
                } else {
                    rsb_db[rsb_tag].expect_bc = 1;
                    rsb_db[rsb_tag].expect_la.range(1,0) = 0;
                }
                if(GET_TLP_FMT(in_pkt)==1 || GET_TLP_FMT(in_pkt)==3){
                    rsb_db[rsb_tag].expect_la.range(6,2) = in_pkt->get_byte(TLP_HDR_START+15)(6,2);
                } else
                    rsb_db[rsb_tag].expect_la.range(6,2) = in_pkt->get_byte(TLP_HDR_START+11)(6,2);
            } //end while()
        }
        catch(sc_exception &e){
            LOG_WARNING<<"RSB: Out of eg_handler";
        }
    } //eg_handler()

    /**
     *  This thread updates the RSB timer and checks for CMPL timeout.
     *  A detected timeout is reported to the ILU interface.
     */
    void rsb::update_timer(){
        LOG_INFO << "RSB: update_timer begins..." ;
        sc_uint<RSB_TAG_SIZE> rsb_ctr = 0;
        try{
            while(1){
                WAIT(rsb_clk.posedge_event());
                WAIT(rsb_clk.posedge_event());
                WAIT(rsb_clk.posedge_event());
                WAIT(rsb_clk.posedge_event());
                if(!STOP_TIMER && rsb_db[rsb_ctr].vld){
                    if(!rsb_db[rsb_ctr].infTO)

                        if((sc_time_stamp()) >= rsb_db[rsb_ctr].timeout){
                            sc_uint<64> peu_csr_ue_log_enable = csr_port.read_csr(PEU_CSR_A_UE_LOG_HW_ADDR);
                            sc_uint<64> peu_csr_oe_log_enable = csr_port.read_csr(PEU_CSR_A_OE_LOG_HW_ADDR);

                            LOG_WARNING << "RSB: Warning: CMPL Timeout for tag " << rsb_db[rsb_ctr].tlp_tag ;
                            LOG_WARNING << "RSB: CTO ENABLED..." ;
                            cto_req_port->put((rsb_db[rsb_ctr].tlp_tag));
                            rsb_db[rsb_ctr].vld = false;

                            if(peu_csr_ue_log_enable.range(14,14)==1 && peu_csr_oe_log_enable.range(21,21)==1){

                                write_error_csr(UE,14,46,"cto");

                                sc_uint<64> peu_ueh1_log_reg; //PEU Uncorrectable Error Header1 Log Register
                                sc_uint<64> peu_ueh2_log_reg; //PEU Uncorrectable Error Header2 Log Register 
                                peu_ueh1_log_reg(63,56) = rsb_db[rsb_ctr].raw_payload[0];
                                peu_ueh1_log_reg(55,48) = rsb_db[rsb_ctr].raw_payload[1];
                                peu_ueh1_log_reg(47,40) = rsb_db[rsb_ctr].raw_payload[2];
                                peu_ueh1_log_reg(39,32) = rsb_db[rsb_ctr].raw_payload[3];
                                peu_ueh1_log_reg(31,24) = rsb_db[rsb_ctr].raw_payload[4];
                                peu_ueh1_log_reg(23,16) = rsb_db[rsb_ctr].raw_payload[5];
                                peu_ueh1_log_reg(15, 8) = rsb_db[rsb_ctr].raw_payload[6];
                                peu_ueh1_log_reg( 7, 0) = rsb_db[rsb_ctr].raw_payload[7];

                                peu_ueh2_log_reg(63,56) = rsb_db[rsb_ctr].raw_payload[8];
                                peu_ueh2_log_reg(55,48) = rsb_db[rsb_ctr].raw_payload[9];
                                peu_ueh2_log_reg(47,40) = rsb_db[rsb_ctr].raw_payload[10];
                                peu_ueh2_log_reg(39,32) = rsb_db[rsb_ctr].raw_payload[11];
                                peu_ueh2_log_reg(31,24) = rsb_db[rsb_ctr].raw_payload[12];
                                peu_ueh2_log_reg(23,16) = rsb_db[rsb_ctr].raw_payload[13];
                                peu_ueh2_log_reg(15, 8) = rsb_db[rsb_ctr].raw_payload[14];
                                peu_ueh2_log_reg( 7, 0) = rsb_db[rsb_ctr].raw_payload[15];
                                LOG_INFO << "TUEH1: " << peu_ueh1_log_reg ;
                                LOG_INFO << "TUEH2: " << peu_ueh2_log_reg ;
                                csr_port.write_csr(PEU_CSR_A_TUE_HDR1_HW_ADDR,peu_ueh1_log_reg);
                                csr_port.write_csr(PEU_CSR_A_TUE_HDR2_HW_ADDR,peu_ueh2_log_reg);

                                write_error_csr(OE,21,53,"cto");

                                sc_uint<64> peu_xmt_oeh1_log_reg; //PEU Xmit Other Event Header1 Log Register
                                sc_uint<64> peu_xmt_oeh2_log_reg; //PEU Xmit Other Event Header2 Log Register 
                                peu_xmt_oeh1_log_reg(63,56) = rsb_db[rsb_ctr].raw_payload[0];
                                peu_xmt_oeh1_log_reg(55,48) = rsb_db[rsb_ctr].raw_payload[1];
                                peu_xmt_oeh1_log_reg(47,40) = rsb_db[rsb_ctr].raw_payload[2];
                                peu_xmt_oeh1_log_reg(39,32) = rsb_db[rsb_ctr].raw_payload[3];
                                peu_xmt_oeh1_log_reg(31,24) = rsb_db[rsb_ctr].raw_payload[4];
                                peu_xmt_oeh1_log_reg(23,16) = rsb_db[rsb_ctr].raw_payload[5];
                                peu_xmt_oeh1_log_reg(15, 8) = rsb_db[rsb_ctr].raw_payload[6];
                                peu_xmt_oeh1_log_reg( 7, 0) = rsb_db[rsb_ctr].raw_payload[7];

                                peu_xmt_oeh2_log_reg(63,56) = rsb_db[rsb_ctr].raw_payload[8];
                                peu_xmt_oeh2_log_reg(55,48) = rsb_db[rsb_ctr].raw_payload[9];
                                peu_xmt_oeh2_log_reg(47,40) = rsb_db[rsb_ctr].raw_payload[10];
                                peu_xmt_oeh2_log_reg(39,32) = rsb_db[rsb_ctr].raw_payload[11];
                                peu_xmt_oeh2_log_reg(31,24) = rsb_db[rsb_ctr].raw_payload[12];
                                peu_xmt_oeh2_log_reg(23,16) = rsb_db[rsb_ctr].raw_payload[13];
                                peu_xmt_oeh2_log_reg(15, 8) = rsb_db[rsb_ctr].raw_payload[14];
                                peu_xmt_oeh2_log_reg( 7, 0) = rsb_db[rsb_ctr].raw_payload[15];
                                LOG_INFO << "TOEH1: " << peu_xmt_oeh1_log_reg ;
                                LOG_INFO << "TOEH2: " << peu_xmt_oeh2_log_reg ;
                                csr_port.write_csr(PEU_CSR_A_TOE_HDR1_HW_ADDR,peu_xmt_oeh1_log_reg);
                                csr_port.write_csr(PEU_CSR_A_TOE_HDR2_HW_ADDR,peu_xmt_oeh2_log_reg);
                            } 
                            else
                                LOG_INFO << "RSB: Error log disabled..." ;
                        }       
                }
                rsb_ctr++;
            }//end while(1)
        }//end try
        catch(sc_exception &e){
            LOG_WARNING<<"RSB: Out of update_timer";
        }
    }//update_timer()

    /**
     *  This method determines the CMPL timeout value specified in the control CSR.
     */
    sc_time rsb::get_Cpl_TO(){
        sc_time to4US(4,SC_US);
        sc_time to8_4MS(8.4,SC_MS);
        sc_time to16_8MS(16.8,SC_MS);
        sc_time to33_6MS(33.6,SC_MS);
        sc_time to67_1MS(67.1,SC_MS);
        sc_time to134MS(134,SC_MS);
        sc_time to268MS(2684,SC_MS);

        sc_uint<64> peu_ctrl_csr_reg = csr_port.read_csr(PEU_CSR_A_TLU_CTL_HW_ADDR);

        switch(peu_ctrl_csr_reg.range(18,16)){
            case 0: return SC_ZERO_TIME;//RSB_TIMER_MAX_TIME; //Infinite CPL Timeout
            case 1: return (to268MS +sc_time_stamp());
            case 2: return (to134MS +sc_time_stamp());
            case 3: return (to67_1MS+sc_time_stamp());
            case 4: return (to33_6MS+sc_time_stamp());
            case 5: return (to16_8MS+sc_time_stamp());
            case 6: return (to8_4MS +sc_time_stamp());
            case 7: return (to4US   +sc_time_stamp());
        }//end switch
    }//end get_Cpl_TO()

    /**
     *  This function updates the requested UE, CE and OE error bits.
     */
    void rsb::write_error_csr(uint8 err_type, uint8 primary, uint8 secondary, char field_name[3]){
        sc_uint<64> orig_csr_val;
        sc_uint<64> new_csr_val=0;
        sc_uint<64> log_enable;

        LOG_WARNING << "Setting err bit: " << field_name;

        switch(err_type){
            case OE: orig_csr_val = csr_port.read_csr(PEU_CSR_A_OE_ERR_RW1C_ALIAS_HW_ADDR);
                     LOG_INFO << "Updating OE CSR (orig val: " << orig_csr_val << ")";
                     log_enable = csr_port.read_csr(PEU_CSR_A_OE_LOG_HW_ADDR);
                     LOG_INFO << "OE Log enable            : " << log_enable << ")";
                     break;
            case UE: orig_csr_val = csr_port.read_csr(PEU_CSR_A_UE_ERR_RW1C_ALIAS_HW_ADDR);
                     LOG_INFO << "Updating UE CSR (orig val: " << orig_csr_val << ")";
                     log_enable = csr_port.read_csr(PEU_CSR_A_UE_LOG_HW_ADDR);
                     LOG_INFO << "UE Log Enable            : " << log_enable << ")";
                     break;
            case CE: orig_csr_val = csr_port.read_csr(PEU_CSR_A_CE_ERR_RW1C_ALIAS_HW_ADDR);
                     LOG_INFO << "Updating CE CSR (orig val: " << orig_csr_val << ")";
                     log_enable = csr_port.read_csr(PEU_CSR_A_CE_LOG_HW_ADDR);
                     LOG_INFO << "CE Log Enable            : " << log_enable << ")";
                     break;
            default: LOG_ERROR << "Warning: undefined error type!";
                     return;
        }

        if(log_enable.range(primary,primary)==1)
        {
            if(orig_csr_val.range(primary,primary)!=1)
                new_csr_val.range(primary,primary)=1;
            else if(orig_csr_val.range(secondary,secondary)!=1)
                new_csr_val.range(secondary,secondary)=1;
            else
                LOG_DEBUG << "Warning: Both PRIMARY and SECONDARY of " << field_name << "are set.";
        }

        switch(err_type){
            case OE: csr_port.write_csr(PEU_CSR_A_OE_ERR_RW1S_ALIAS_HW_ADDR,new_csr_val);
                     LOG_DEBUG << "Updating OE CSR (new val : " << new_csr_val << ")";
                     break;
            case UE: csr_port.write_csr(PEU_CSR_A_UE_ERR_RW1S_ALIAS_HW_ADDR,new_csr_val);
                     LOG_DEBUG << "Updating UE CSR (new val : " << new_csr_val << ")";
                     break;
            case CE: csr_port.write_csr(PEU_CSR_A_CE_ERR_RW1S_ALIAS_HW_ADDR,new_csr_val);
                     LOG_DEBUG << "Updating CE CSR (new val : " << new_csr_val << ")";
                     break;
        }
        return;
    }//end write_csr_error

    /**
     *  This thread handles reset behavior of the module. On the arrival of a reset global event,
     *  it issue termination requests to threads in this module. Following the reset exit global event
     *  it invokes init() to re-spawn terminated threads.
     */
    void rsb::reset_handler(){
        while(1){
            wait(*parent_global_ev);
            switch(*global_event_type){
                case POR_RESET_ENTER:
                case WMR_RESET_ENTER:
                    LOG_WARNING << "\tRSB: WMR/POR_RESET enter signal..." ;
                    POR_RESET=true;
                    //Notify wait()'s in ITL thread
                    reset_ev.notify();
                    //Wait for all thread to terminate
                    while(1){
                        if(eg_handler_ph.terminated() && update_timer_ph.terminated()) break;
                        wait(eg_handler_ph.terminated_event()|update_timer_ph.terminated_event());
                    }
                    LOG_WARNING << "RSB: WMR/POR Reset threads terminated" ;
                    LOG_WARNING << "RSB: WMR/POR Reset dbs cleared" ;
                    break;

                case POR_RESET_EXIT:
                case WMR_RESET_EXIT:
                    LOG_INFO << "\tRSB: WMR/POR_RESET exit signal..." ;
                    init();
                    break;

                case SW_RESET_ENTER:
                    LOG_WARNING<<"RSB: SW_RESET_ENTER";
                    STOP_TIMER=true;
                    break;

                case SW_RESET_EXIT:
                    LOG_INFO<<"RSB: SW_RESET_EXIT";
                    STOP_TIMER=false;
                    break;
            }
        }//end while(1)
    }//end reset_handler()
}
