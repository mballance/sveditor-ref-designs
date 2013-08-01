#define FRAME_TYPE_INDEX      					0
#define FRAME_TYPE_SIZE      				        1
#define FRAME_CLASS_INDEX     					FRAME_TYPE_INDEX + FRAME_TYPE_SIZE	
#define FRAME_CLASS_SIZE					1
#define L2_DA_SIZE     						6
#define L2_SA_INDEX						FRAME_CLASS_INDEX + FRAME_CLASS_SIZE
#define L2_SA_SIZE     						6
#define L2_DA_INDEX					        L2_SA_INDEX + L2_SA_SIZE
#define TPID_SIZE						2
#define TPID_INDEX						L2_DA_INDEX + L2_DA_SIZE
#define TCI_SIZE       						2
#define TCI_INDEX						TPID_INDEX + TPID_SIZE
#define IP_OPTION_SIZE						1
#define IP_OPTION_INDEX						TCI_INDEX + TCI_SIZE
#define IPV4_SRC_ADDR_SIZE					4
#define IPV4_SRC_ADDR_INDEX					IP_OPTION_INDEX + IP_OPTION_SIZE
#define IPV4_DST_ADDR_SIZE					4
#define IPV4_DST_ADDR_INDEX					IPV4_SRC_ADDR_INDEX + IPV4_DST_ADDR_SIZE
#define IPV4_SRC_PRT_SIZE					2
#define IPV4_SRC_PRT_INDEX					IPV4_DST_ADDR_INDEX + IPV4_DST_ADDR_SIZE
#define IPV4_DST_PRT_SIZE				        2
#define IPV4_DST_PRT_INDEX					IPV4_SRC_PRT_INDEX + IPV4_SRC_PRT_SIZE
#define TCP_FLAGS_SIZE					        1
#define TCP_FLAGS_INDEX						IPV4_DST_PRT_INDEX + IPV4_DST_PRT_SIZE
#define TCP_SEQ_NO_SIZE                                         4
#define TCP_SEQ_NO_INDEX                                        TCP_FLAGS_INDEX + TCP_FLAGS_SIZE
#define SPI_SIZE                                                4
#define SPI_INDEX                                               TCP_SEQ_NO_INDEX + TCP_SEQ_NO_SIZE

#define ESP_AH_SEQ_NO_INDEX                                     SPI_INDEX + SPI_SIZE    
#define ESP_AH_SEQ_NO_SIZE                                      4

#define IPV6_SRC_ADDR_INDEX                                     ESP_AH_SEQ_NO_INDEX + ESP_AH_SEQ_NO_SIZE

#define IPV6_SRC_ADDR_SIZE                                      16
#define IPV6_DST_ADDR_INDEX                                     IPV6_SRC_ADDR_SIZE + IPV6_SRC_ADDR_INDEX
#define IPV6_DST_ADDR_SIZE                                      16
#define IPV6_NXT_HDR                                            IPV6_DST_ADDR_INDEX + IPV6_DST_ADDR_SIZE
#define IPV6_NXT_HDR_SIZE					1
#define TOS_INDEX						IPV6_NXT_HDR + IPV6_NXT_HDR_SIZE
#define TOS_SIZE						1


#define IP_FRAG_INDEX                                           TOS_INDEX + TOS_SIZE
#define IP_FRAG_SIZE                                            2

#define SCTP_SRC_PRT_SIZE                                       2
#define SCTP_SRC_PRT_INDEX                                      IP_FRAG_SIZE + IP_FRAG_INDEX


#define SCTP_DST_PRT_SIZE                                       2
#define SCTP_DST_PRT_INDEX                                      SCTP_SRC_PRT_INDEX + SCTP_SRC_PRT_SIZE
#define SCTP_VTAG_SIZE                                          4
#define SCTP_VTAG_INDEX                                         SCTP_DST_PRT_INDEX + SCTP_DST_PRT_SIZE

#define ARP_HW_TYPE_INDEX                                       SCTP_VTAG_INDEX + SCTP_VTAG_SIZE
#define ARP_HW_TYPE_SIZE                                        2

#define ARP_PROTO_TYPE_INDEX                                    ARP_HW_TYPE_INDEX + ARP_HW_TYPE_SIZE
#define ARP_PROTO_TYPE_SIZE                                     2

#define ARP_HW_LEN_INDEX                                        ARP_PROTO_TYPE_INDEX + ARP_PROTO_TYPE_SIZE
#define ARP_HW_LEN_SIZE                                         1

#define ARP_PROTO_LEN_INDEX					ARP_HW_LEN_INDEX + ARP_HW_LEN_SIZE
#define ARP_PROTO_LEN_SIZE					1

#define ARP_OPCODE_INDEX					ARP_PROTO_LEN_INDEX + ARP_PROTO_LEN_SIZE
#define ARP_OPCODE_SIZE                                         2

#define ARP_SRC_ADDR_INDEX                                      ARP_OPCODE_INDEX + ARP_OPCODE_SIZE
#define ARP_SRC_ADDR_SIZE                                       6

#define ARP_TGT_ADDR_INDEX                                      ARP_SRC_ADDR_INDEX + ARP_SRC_ADDR_SIZE
#define ARP_TGT_ADDR_SIZE                                       6

#define ARP_SRCIP_ADDR_INDEX                                    ARP_TGT_ADDR_INDEX + ARP_TGT_ADDR_SIZE
#define ARP_SRCIP_ADDR_SIZE                                     4

#define ARP_TGTIP_ADDR_INDEX                                    ARP_SRCIP_ADDR_INDEX + ARP_SRCIP_ADDR_SIZE
#define ARP_TGTIP_ADDR_SIZE                                     4



#define DATA_LENGTH_INDEX                                       142
#define DATA_LENGTH_SIZE                                         2 


#define DATA_TYPE_INDEX                                         DATA_LENGTH_INDEX + DATA_LENGTH_SIZE
#define DATA_TYPE_SIZE                                           1

#define DATA_SEED_INDEX                                         DATA_TYPE_INDEX + DATA_TYPE_SIZE
#define DATA_SEED_SIZE                                           4

#define DATA_ERR_CODE_INDEX    					DATA_SEED_INDEX + DATA_SEED_SIZE
#define DATA_ERR_CODE_SIZE                                        4

#define DATA_ERR_DATA_INDEX    					DATA_ERR_CODE_INDEX + DATA_ERR_CODE_SIZE
#define DATA_ERR_DATA_SIZE                                        4

#define L2_PAD_LENGTH_INDEX                                     DATA_ERR_DATA_INDEX + DATA_ERR_DATA_SIZE
#define L2_PAD_LENGTH_SIZE                                      2

#define L4_PROTO_ERR_INDEX                                      L2_PAD_LENGTH_INDEX + L2_PAD_LENGTH_SIZE
#define L4_PROTO_ERR_SIZE                                       1


// to be used for returning from pktgen
#define L2_PAYLOAD_LENGTH 0
#define L3_PAYLOAD_LENGTH 1
#define L4_PAYLOAD_LENGTH 2
#define L2_HDR_LENGTH 3
#define L3_HDR_LENGTH 4
#define L4_HDR_LENGTH 5
