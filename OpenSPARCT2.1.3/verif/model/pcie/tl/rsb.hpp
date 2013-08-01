#ifndef INC_rsb_hpp__
#define INC_rsb_hpp__

#include <systemc.h>

#include "pcie_common/config.hpp"
#include "pcie_common/pciePacket.hpp"

#include "pcie_common/data_port.hpp"
#include "pcie_common/csr_if_port.hpp"
#include "pcie_common/peu_csr_defines.hpp"
#include "pcie_common/peu_defines.hpp"

#include "tlm.h"

using tlm::tlm_transport_if;
using tlm::tlm_slave_if;

#define NUM_RSB_ENTRIES 32
#define RSB_TAG_SIZE 4
#define CTO_TAG_SIZE 5

#include <queue>

#define WAIT(__EV__) if(!POR_RESET) wait( __EV__ | reset_ev); \
    if(POR_RESET) {LOG_WARNING<<"RSB: WAIT throwing an exception"; throw sc_exception();}

namespace pcie {

    class rsb_data
    {
        public:
            sc_uint<CTO_TAG_SIZE>       tlp_tag;   ///< RSB index field
            sc_uint<16>                 req_id;    ///< requester id
            vector < sc_uint < 8 > >    raw_payload;
            bool                        vld;       ///< Valid bit
            sc_uint<12>                 expect_bc; ///< expected byte count value
            sc_uint<7>                  expect_la; ///< expected last address bits
            sc_time                     timeout;   ///< timeout value
            bool                        infTO;     ///< Infinite timeout flag 

            rsb_data(){
                tlp_tag = 0;
                raw_payload.resize(1);
                raw_payload[0]=0;
                vld = false;
                expect_bc=0;
                infTO=false;
            }
    };

    class rsb : public sc_module
    {
        public: 
            rsb(sc_module_name module_name, sc_event *parent_global_ev, uint8 *global_event_type) :
                sc_module (module_name),
                ing_port("ing_itl_rsb_port"),
                csr_port("CSR_PORT"),
                eg_port("eg_etl_rsb_port"),
                rsb_clk("RSB_CLK",4,SC_NS,0.5),    ///Assuming a 250MHz clock domain
                cto_req_port("cto_rsb_ilu_req_port")
            {
                this->parent_global_ev = parent_global_ev;
                this->global_event_type = global_event_type;
                SC_THREAD(ing_handler);
                SC_METHOD(init);
                SC_THREAD(reset_handler);
            }

            SC_HAS_PROCESS(rsb);

            sc_port< tlm_slave_if< RefPciePacket, bool > > ing_port;
            data_in_port<RefPciePacket>                    eg_port;
            csr_if_port< CSR_ADDR_T, CSR_DATA_T >          csr_port;
            sc_port< tlm_put_if< sc_uint<CTO_TAG_SIZE> > > cto_req_port;

            sc_clock    rsb_clk;        ///< RSB clk

        private:
            //Module threads and methods
            void ing_handler();
            void eg_handler();
            void update_timer();
            sc_time get_Cpl_TO();
            void write_error_csr(uint8,uint8,uint8,char[]);
            void init();
            void reset_handler();

            sc_event reset_ev;              ///< Reset event for threads in the module
            sc_event *parent_global_ev;     ///< Global event to the module
            uint8 *global_event_type;       ///< Global event type

            bool        POR_RESET;          ///< Power-on Reset flag
            bool        STOP_TIMER;

            //Proc handles
            sc_process_handle eg_handler_ph;
            sc_process_handle update_timer_ph;

            USE_NAMESPACE(std)map<sc_uint<4>, rsb_data > rsb_db; ///< RSB look-up table

            enum {OE,UE,CE};

            sc_uint<6>  rs2it_err;   ///< RSB error type local register
    }; 
} //namespace pcie
#endif //INC_rsb_hpp
