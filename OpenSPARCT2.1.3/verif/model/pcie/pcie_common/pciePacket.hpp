// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: pciePacket.hpp
// Copyright (C) 1995-2007 Sun Microsystems, Inc. All Rights Reserved
// 4150 Network Circle, Santa Clara, California 95054, U.S.A.
//
// * DO NOT ALTER OR REMOVE COPYRIGHT NOTICES OR THIS FILE HEADER. 
//
// This program is free software; you can redistribute it and/or modify
// it under the terms of the GNU General Public License as published by
// the Free Software Foundation; version 2 of the License.
//
// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU General Public License for more details.
//
// You should have received a copy of the GNU General Public License
// along with this program; if not, write to the Free Software
// Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
// 
// For the avoidance of doubt, and except that if any non-GPL license 
// choice is available it will apply instead, Sun elects to use only 
// the General Public License version 2 (GPLv2) at this time for any 
// software where a choice of GPL license versions is made 
// available with the language indicating that GPLv2 or any later version 
// may be used, or where a choice of which version of the GPL is applied is 
// otherwise unspecified. 
//
// Please contact Sun Microsystems, Inc., 4150 Network Circle, Santa Clara, 
// CA 95054 USA or visit www.sun.com if you need additional information or 
// have any questions. 
// 
// ========== Copyright Header End ============================================
#ifndef INC_pciePacket_hpp__
#define INC_pciePacket_hpp__

#include "pcie_common/config.hpp"
#include "pcie_common/packetRefCount.hpp"
#include "pcie_common/packet.hpp"
#include "pcie_common/basePacket.hpp"
#include "pcie_common/logger.hpp"
#include "pcie_common/symbol_encoding.hpp"

#include <string>
#include <vector>

namespace pcie {

#define PKT_END  -1
#define PKT_BEGIN  0

#define ROWSIZE 8

#define PKT_FRM_SIZE 1
#define DLLP_PKT_SIZE 6
#define DL_SEQ_NUM_SIZE 2
#define LCRC_SIZE  4
#define TLP_HDR_SIZE  12
#define TLP_HDR_START (PKT_FRM_SIZE + DL_SEQ_NUM_SIZE)
#define DLP_START PKT_FRM_SIZE


#define PCIE_PLD_LEN_WDTH 10

#define DLLP_ACK 				0x00
#define DLLP_NAK				0x10
#define DLLP_NAK_FRAMING			0x11
#define DLLP_PM_ENTER_L1		0x20
#define DLLP_PM_ENTER_L23		0x21
#define DLLP_PM_AS_REQ_L1		0x23
#define DLLP_PM_ACK				0x24
#define DLLP_VENDOR				0x30
#define DLLP_INITFC1_P(VC)		(0x47 & (VC))
#define DLLP_INITFC1_NP(VC)		(0x57 & (VC))
#define DLLP_INITFC1_Cpl(VC)	(0x67 & (VC))
#define DLLP_INITFC2_P(VC)		(0xC7 & (VC))
#define DLLP_INITFC2_NP(VC)		(0xD7 & (VC))
#define DLLP_INITFC2_Cpl(VC)	(0xE7 & (VC))
#define DLLP_UPDATEFC_P(VC)		(0x87 & (VC))
#define DLLP_UPDATEFC_NP(VC)	(0x97 & (VC))
#define DLLP_UPDATEFC_Cpl(VC)	(0xA7 & (VC))

#define NEW_DLLP (new pciePacket(DLLP_PKT_SIZE+PKT_FRM_SIZE))
#define NEW_TLP(HDR_SIZE) (new pciePacket(HDR_SIZE+PKT_FRM_SIZE+DL_SEQ_NUM_SIZE+LCRC_SIZE))

#define GET_TLP_FMT(pkt_ref)	(pkt_ref->get_byte(TLP_HDR_START)(6,5))
#define GET_TLP_TYPE(pkt_ref)	(pkt_ref->get_byte(TLP_HDR_START)(4,0))
#define GET_TLP_TC(pkt_ref)	(pkt_ref->get_byte(TLP_HDR_START+1)(6,4))
#define GET_TLP_TD(pkt_ref)	(pkt_ref->get_byte(TLP_HDR_START+2)[7])
#define GET_TLP_EP(pkt_ref)	(pkt_ref->get_byte(TLP_HDR_START+2)[6])
#define GET_TLP_ATTR(pkt_ref)	(pkt_ref->get_byte(TLP_HDR_START+2)(5,4))
#define GET_TLP_LEN(pkt_ref)	((pkt_ref->get_byte(TLP_HDR_START+2)(1,0)),\
        (pkt_ref->get_byte(TLP_HDR_START+3)))
#define GET_TLP_FBE(pkt_ref)	(pkt_ref->get_byte(TLP_HDR_START+7)(3,0))
#define GET_TLP_LBE(pkt_ref)	(pkt_ref->get_byte(TLP_HDR_START+7)(7,4))
#define GET_TLP_BE(pkt_ref)	(pkt_ref->get_byte(TLP_HDR_START+7)(7,0))
#define GET_TLP_REQ_TAG(pkt_ref)	(pkt_ref->get_byte(TLP_HDR_START+6))
#define GET_TLP_CMPL_TAG(pkt_ref)	(pkt_ref->get_byte(TLP_HDR_START+10))
#define GET_TLP_REQ_ID(pkt_ref)	((pkt_ref->get_byte(TLP_HDR_START+5)),\
        (pkt_ref->get_byte(TLP_HDR_START+4)))
#define GET_TLP_ADDR(pkt_ref) 	((pkt_ref->get_byte(TLP_HDR_START+11)(7,2)),\
        (pkt_ref->get_byte(TLP_HDR_START+10)),\
        (pkt_ref->get_byte(TLP_HDR_START+9)),\
        (pkt_ref->get_byte(TLP_HDR_START+8)) )
#define GET_TLP_EX_ADDR(pkt_ref)((pkt_ref->get_byte(TLP_HDR_START+8)(7,2)),\
        (pkt_ref->get_byte(TLP_HDR_START+7)),\
        (pkt_ref->get_byte(TLP_HDR_START+6)),\
        (pkt_ref->get_byte(TLP_HDR_START+5)) )
#define GET_TLP_CMP_ID(pkt_ref) ((pkt_ref->get_byte(TLP_HDR_START+9)),\
        (pkt_ref->get_byte(TLP_HDR_START+8)))
#define GET_TLP_BCM(pkt_ref)	(pkt_ref->get_byte(TLP_HDR_START+6)[4])
#define GET_TLP_REG_NUM(pkt_ref) (pkt_ref->get_byte(TLP_HDR_START+11)(7,2))
#define GET_TLP_EX_REG_NUM(pkt_ref) (pkt_ref->get_byte(TLP_HDR_START+10)(3,2))
#define GET_TLP_CMPL_STATUS(pkt_ref) (pkt_ref->get_byte(TLP_HDR_START+6)(7,5))
#define GET_TLP_CMPL_LADDR(pkt_ref) (pkt_ref->get_byte(TLP_HDR_START+11)(6,0))
#define GET_TLP_BYTEC(pkt_ref) ((pkt_ref->get_byte(TLP_HDR_START+6)(3,0)), \
        (pkt_ref->get_byte(TLP_HDR_START+7)(7,0)) )
#define GET_TLP_CMPL_REQ_ID(pkt_ref) ((pkt_ref->get_byte(TLP_HDR_START+9)(7,0)),\
        (pkt_ref->get_byte(TLP_HDR_START+8)(7,0)) )



  /// TLP Packet Types: fmt [1:0] type[4:0]
#define tlp_MRd_32	0x00
#define tlp_MRd_64	0x20
#define tlp_MRdLk_32	0x01
#define tlp_MRdLk_64	0x21
#define tlp_MWr_32	0x40
#define tlp_MWr_64	0x60
#define tlp_IORd	0x02
#define tlp_IOWr	0x42
#define tlp_CfgRd0	0x04
#define tlp_CfgWr0	0x44
#define tlp_CfgRd1	0x05
#define tlp_CfgWr1	0x45
#define tlp_Msg(R)	(0x37 & R)
#define tlp_MsgD(R)	(0x77 & R)
#define tlp_Cpl		0x0A
#define tlp_CplD	0x4A
#define tlp_CplLk	0x0B
#define tlp_CplDLk	0x4B

#define TLP_CMPL	0xA
#define TLP_CMPLK	0xB

#define DROP_TLP_ILUINTF_RECOVER_CREDITS 0xb

  USING_NAMESPACE(std)
	USING_NAMESPACE(Logger)

#define LOG_SERVICE
	uint32 genUniqPacketId();

  class pciePacket : public basePacket {
  public:
	pciePacket() : basePacket("PCIE_PACKET")
	{ 
	  size = 1;
	  raw_payload.resize(size);
	  for (int i = 0; i < size; i++)  raw_payload[i] = 0;
	}

	pciePacket(int pkt_size) : basePacket("PCIE_PACKET")
	{ 
	  size = pkt_size;
	  raw_payload.resize(size);
	  for (int i = 0; i < size; i++)  raw_payload[i] = 0;
	}

	pciePacket(const pciePacket& other)
	{ 
	  size = other.size;
	  raw_payload = other.raw_payload;
	}

	/// return the raw payload size
	uint32 get_size() {
	  return size;
	}

	/// return the raw payload size
	uint32 get_pkt_size() {
	  return size;
	}

	/// return the expected length for the packet, based on HDR fields
	uint32 get_expect_len(){
	  uint32 lsize;    
	  lsize = 3 + 4 + 1; //1st 3 bytes, LCRC, END
	  if(raw_payload[TLP_HDR_START].range(6,5)==1 || 
		 raw_payload[TLP_HDR_START].range(6,5)==3 )
		lsize += 16;
	  else 
		lsize += 12;
	  if(raw_payload[TLP_HDR_START+2].range(7,7)==1)
		lsize += 4;        //Digest present
	  //If pkt contains data, add to lsize, else ignore length
	  if( raw_payload[TLP_HDR_START]==tlp_MWr_32 || raw_payload[TLP_HDR_START]==tlp_MWr_64 ||
		  raw_payload[TLP_HDR_START]==tlp_IOWr || raw_payload[TLP_HDR_START]==tlp_CfgWr0 ||
		  raw_payload[TLP_HDR_START]==tlp_CplD || raw_payload[TLP_HDR_START]==tlp_CfgWr1 ||
		  raw_payload[TLP_HDR_START]==tlp_CplDLk)
		{
		  sc_uint<12> pl_len = (raw_payload[TLP_HDR_START+2].range(1,0),raw_payload[TLP_HDR_START+3])*4;
		  lsize += pl_len;
		}
	  return lsize;
	}

	/// Gets the value of a byte at location loc [0..size)
	sc_uint<8> get_byte (int loc) {
	  if (loc < size) {
		return raw_payload[loc];
	  }  else {
		LOG_ERROR_S << "Reading Packet Byte @ " << loc 
					<< "Max size is " << size << "\n";
		return 0;
	  }
	}

	/// Modifys the byte at location loc [0..size)
	sc_uint<8> modify_byte (int loc, sc_uint<8> byte_val = 0) {
	  if (loc >= size || loc < 0) {
		LOG_ERROR_S << "Modifying Packet Byte @ " << loc 
					<< "Max size is " << size << "\n";
	  } else {
		return raw_payload[loc] = byte_val;
	  }
	  return 0;
	}


	void display_packet() {
	  int i;
	  cout << sc_time_stamp() << endl;

	  cout << " _DLL_ : ----------- PCIE PACKET BEGIN ---------------" << endl;         
	  for(i=0; i < size; i++)
		{
		  cout << "_DLL_ : Byte " << i << " PAYLOAD " << hex << raw_payload[i] << endl;

		}
	  cout << " _DLL_ : ----------- PCIE PACKET END -----------------" << endl;         

	}


	void pl2dll_display_stp_packet() {
	  int i;
	  sc_uint<8> tmp_byte;
	  sc_uint<12> seq_num;
	  sc_uint<10> pkt_len;

	  cout << sc_time_stamp() << endl;

	  cout << " _STP_ : ----------- STP PACKET BEGIN ---------------" << endl;         

	  tmp_byte = raw_payload[1];
	  seq_num.range(11,8)=tmp_byte.range(3,0);
	  tmp_byte = raw_payload[2];
	  seq_num.range(7,0)=tmp_byte.range(7,0);

	  cout << " _STP_ : Seq_Num  " << seq_num << endl; 

	  tmp_byte = raw_payload[3];
	  cout << " _STP_ : R = " << tmp_byte.range(7,7) << endl;
	  cout << " _STP_ : Fmt = " << tmp_byte.range(6,5) << endl;
	  cout << " _STP_ : Type = " << tmp_byte.range(4,0) << endl;

	  tmp_byte = raw_payload[4];
	  cout << " _STP_ : R = " << tmp_byte.range(7,7) << endl;
	  cout << " _STP_ : TC = " << tmp_byte.range(6,4) << endl;
	  cout << " _STP_ : R = " << tmp_byte.range(3,0) << endl;

	  tmp_byte = raw_payload[5];
	  cout << " _STP_ : TD = " << tmp_byte.range(7,7) << endl;
	  cout << " _STP_ : EP = " << tmp_byte.range(6,6) << endl;
	  cout << " _STP_ : Attr = " << tmp_byte.range(5,4) << endl;
	  cout << " _STP_ : R = " << tmp_byte.range(3,2) << endl;
	  pkt_len.range(9,8)=tmp_byte.range(1,0);

	  tmp_byte = raw_payload[6];
	  pkt_len.range(7,0)=tmp_byte.range(7,0);

	  cout << " _STP_ : Length = " << pkt_len << endl;

	  if (  raw_payload[size-1] == END )
		cout << " _STP_ : -----------  SDP PACKET END -----------------" << endl;         
	  else if ( raw_payload[size-1] == EDB )
		cout << " _STP_ : -----------  PACKET EDB   -----------------" << endl;         

	}


	void dll2pl_display_sdp_packet(int type) {
	  int i;
	  sc_uint<8> tmp_byte,HdrFC;
	  sc_uint<12> seq_num;
	  sc_uint<10> pkt_len;
	  sc_uint<12> DataFC;

	  seq_num.range(11,8)=raw_payload[2].range(3,0);
	  seq_num.range(7,0) =raw_payload[3].range(7,0);

	  HdrFC.range(7,2)=raw_payload[1].range(5,0);
	  HdrFC.range(1,0)=raw_payload[2].range(7,6);

	  DataFC.range(11,8)= raw_payload[2].range(3,0);
	  DataFC.range(7,0)= raw_payload[3];

	  cout << sc_time_stamp() << endl;

	  if ( type )
		cout << "_SDP_ : ----------- TX SDP PACKET " << _id << " BEGIN ---------------"  << endl;         
	  else
		cout << "_SDP_ : ----------- RX SDP PACKET " << _id << " BEGIN ---------------"  << endl;         

	  if (  raw_payload[0].range(7,4) == 1 )
		cout << "_SDP_  PKT: NAK  SEQ_NUM= " << seq_num ;
	  else if ( raw_payload[0].range(7,4) == 0 )
		cout << "_SDP_  PKT: ACK  SEQ_NUM= " << seq_num ;


	  switch ( raw_payload[0].range(7,4) )
		{
		case 0: cout << "_SDP_  PKT: ACK  SEQ_NUM= " << seq_num ;
		  break;
		case 1: cout << "_SDP_  PKT: NAK  SEQ_NUM= " << seq_num ;
		  break;
		case 4: cout << "_SDP_  PKT: InitFC1_P HdrFC = " << HdrFC << " DataFC = " << DataFC ;
		  break;
		case 5: cout << "_SDP_ PKT: InitFC1_NP HdrFC = " << HdrFC << " DataFC = " << DataFC ;
		  break;
		case 6: cout << "_SDP_ PKT: InitFC1_Cpl HdrFC = " << HdrFC << " DataFC = " << DataFC;
		  break;

		case 12: cout << "_SDP_ PKT: InitFC2_P HdrFC = " <<HdrFC<< " DataFC = " <<DataFC;
		  break;
		case 13: cout << "_SDP_ PKT: InitFC2_NP HdrFC = " << HdrFC << " DataFC = " <<DataFC ;

		  break;
		case 14: cout << "_SDP_ PKT: InitFC2_Cpl HdrFC = " << HdrFC<< " DataFC = " <<DataFC ;
		  break;

		case 8: cout << "_SDP_ PKT: UpdateFC_P HdrFC = " <<HdrFC << " DataFC = " << DataFC ;
		  break;
		case 9: cout << "_SDP_ PKT: UpdateFC_NP HdrFC = " <<HdrFC<< " DataFC = " << DataFC;
		  break;
		case 10: cout << "_SDP PKT: UpdateFC_Cpl HdrFC = " <<HdrFC<< " DataFC = " <<DataFC ;
		  break;
		case 2: cout << "_SDP_ PKT: PM " ;
		  break;
		}
	  cout << endl;

	  if ( type )
		cout << "_SDP_ : ----------- TX SDP PACKET END ---------------" << endl;         
	  else {
		if (  raw_payload[size-1] == END )
		  cout << "_SDP_ : -----------  RX SDP PACKET END -----------------" << endl;         
		else if ( raw_payload[size-1] == EDB )
		  cout << "_SDP_ : -----------  RX SDP PACKET EDB   -----------------" << endl;         
	  }
	}




	void pl2dll_display_sdp_packet(int type) {
	  int i;
	  sc_uint<8> tmp_byte,HdrFC;

	  sc_uint<12> seq_num;
	  sc_uint<10> pkt_len;
	  sc_uint<12> DataFC;

	  seq_num.range(11,8)=raw_payload[2].range(3,0);
	  seq_num.range(7,0) =raw_payload[3].range(7,0);

	  HdrFC.range(7,2)=raw_payload[2].range(5,0);
	  HdrFC.range(1,0)=raw_payload[3].range(7,6);

	  DataFC.range(11,8)= raw_payload[3].range(3,0);
	  DataFC.range(7,0)= raw_payload[4];

	  cout << sc_time_stamp() << endl;

	  if ( type )
		cout << "_SDP_ : ----------- TX SDP PACKET " << _id << " BEGIN ---------------"  << endl;         
	  else
		cout << "_SDP_ : ----------- RX SDP PACKET " << _id << " BEGIN ---------------"  << endl;         

	  switch ( raw_payload[1].range(7,4) )
		{
		case 0: cout << "_SDP_  PKT: ACK  SEQ_NUM= " << seq_num ;
		  break;
		case 1: cout << "_SDP_  PKT: NAK  SEQ_NUM= " << seq_num ;
		  break;
		case 4: cout << "_SDP_  PKT: InitFC1_P HdrFC = " << HdrFC << " DataFC = " << DataFC ;
		  break;
		case 5: cout << "_SDP_ PKT: InitFC1_NP HdrFC = " << HdrFC << " DataFC = " << DataFC ;
		  break;
		case 6: cout << "_SDP_ PKT: InitFC1_Cpl HdrFC = " << HdrFC << " DataFC = " << DataFC;
		  break;

		case 12: cout << "_SDP_ PKT: InitFC2_P HdrFC = " <<HdrFC<< " DataFC = " <<DataFC;
		  break;
		case 13: cout << "_SDP_ PKT: InitFC2_NP HdrFC = " << HdrFC << " DataFC = " <<DataFC ;

		  break;
		case 14: cout << "_SDP_ PKT: InitFC2_Cpl HdrFC = " << HdrFC<< " DataFC = " <<DataFC ;
		  break;

		case 8: cout << "_SDP_ PKT: UpdateFC_P HdrFC = " <<HdrFC << " DataFC = " << DataFC ;
		  break;
		case 9: cout << "_SDP_ PKT: UpdateFC_NP HdrFC = " <<HdrFC<< " DataFC = " << DataFC;
		  break;
		case 10: cout << "_SDP PKT: UpdateFC_Cpl HdrFC = " <<HdrFC<< " DataFC = " <<DataFC ;
		  break;
		case 2: cout << "_SDP_ PKT: PM " ;
		  break;
		}
	  cout << endl;

	  if ( type )
		cout << "_SDP_ : ----------- TX SDP PACKET END ---------------" << endl;         
	  else {
		if (  raw_payload[size-1] == END )
		  cout << "_SDP_ : -----------  RX SDP PACKET END -----------------" << endl;         
		else if ( raw_payload[size-1] == EDB )
		  cout << "_SDP_ : -----------  RX SDP PACKET EDB   -----------------" << endl;         
	  }
	}


	void set_control (sc_lv<5> control) { is_control = control; }
	sc_lv<5> get_control () { return is_control; }

	void alloc_bytes(int num) {
	  raw_payload.resize(size+num);
	  for (int i=size; i < size+num; i++)  raw_payload[i] = 0;
	  size += num;
	}

	/// adds byte at loc, default PKT_END  .. 
	/// if loc > PKT_END adds default value bytes
	sc_uint<8> add_byte (sc_uint<8> byte_val, int loc = PKT_END) {
	  if (loc == PKT_BEGIN) {
		raw_payload.insert( raw_payload.begin(),byte_val);
		size++;
		return byte_val;
	  }
	  if (loc == PKT_END) {
		raw_payload.push_back(byte_val);
		size++;
		return byte_val;
	  }
	  if (loc >= size) {
		size = loc;
		raw_payload.resize(size);
		raw_payload.push_back(byte_val);
		return byte_val;
	  } 
	  LOG_WARNING_S << "Insert byte -- Not Implemented \n";
	  return 0;
	}

	virtual ~pciePacket() 
	{ }

	virtual const USE_NAMESPACE(std)string to_string () const {
	  USE_NAMESPACE(std)string ts;

	  ts += ("PCIE Packet Id: " + (sc_uint<32>(_id)).to_string()
			 + " Size = " + (sc_uint<32>(size)).to_string(SC_HEX)
			 + " Control : " + is_control.to_string() + "\n");

	  if (raw_payload[0] == STP) {
		ts += "TLP Packet : ";
		switch (raw_payload[TLP_HDR_START]) {
		case tlp_MRd_32: 
		  ts += ("Mem Read32 (Tag: " 
				 + (sc_uint<8>(raw_payload[TLP_HDR_START+6])).to_string(SC_HEX)
				 + " Len: " 
				 + (sc_uint<10>((raw_payload[TLP_HDR_START+2](1,0),
								 raw_payload[TLP_HDR_START+3]))).to_string(SC_HEX)
				 + ")");
		  break;
		case  tlp_MRd_64: 
		  ts += ("Mem Read64 (Tag: " 
				 + (sc_uint<8>(raw_payload[TLP_HDR_START+6])).to_string(SC_HEX)
				 + " Len: " 
				 + (sc_uint<10>((raw_payload[TLP_HDR_START+2](1,0),
								 raw_payload[TLP_HDR_START+3]))).to_string(SC_HEX)
				 + ")");
		  break;
		case  tlp_MRdLk_32: 
		  ts += ("Mem ReadLock32 (Tag: " 
				 + (sc_uint<8>(raw_payload[TLP_HDR_START+6])).to_string(SC_HEX)
				 + " Len: " 
				 + (sc_uint<10>((raw_payload[TLP_HDR_START+2](1,0),
								 raw_payload[TLP_HDR_START+3]))).to_string(SC_HEX)
				 + ")");
		  break;
		case  tlp_MRdLk_64: 
		  ts += ("Mem ReadLock64 (Tag: " 
				 + (sc_uint<8>(raw_payload[TLP_HDR_START+6])).to_string(SC_HEX)
				 + " Len: " 
				 + (sc_uint<10>((raw_payload[TLP_HDR_START+2](1,0),
								 raw_payload[TLP_HDR_START+3]))).to_string(SC_HEX)
				 + ")");
		  break;
		case  tlp_MWr_32: 
		  ts += ("Mem Write32 (Tag: " 
				 + (sc_uint<8>(raw_payload[TLP_HDR_START+6])).to_string(SC_HEX)
				 + " Len: " 
				 + (sc_uint<10>((raw_payload[TLP_HDR_START+2](1,0),
								 raw_payload[TLP_HDR_START+3]))).to_string(SC_HEX)
				 + ")");
		  break;
		case  tlp_MWr_64: 
		  ts += ("Mem Write64 (Tag: " 
				 + (sc_uint<8>(raw_payload[TLP_HDR_START+6])).to_string(SC_HEX)
				 + " Len: " 
				 + (sc_uint<10>((raw_payload[TLP_HDR_START+2](1,0),
								 raw_payload[TLP_HDR_START+3]))).to_string(SC_HEX)
				 + ")");
		  break;
		case  tlp_IORd: 
		  ts += ("IO Read (Tag: " 
				 + (sc_uint<8>(raw_payload[TLP_HDR_START+6])).to_string(SC_HEX)
				 + " Len: " 
				 + (sc_uint<10>((raw_payload[TLP_HDR_START+2](1,0),
								 raw_payload[TLP_HDR_START+3]))).to_string(SC_HEX)
				 + ")");
		  break;
		case  tlp_IOWr: 
		  ts += ("IO Write (Tag: " 
				 + (sc_uint<8>(raw_payload[TLP_HDR_START+6])).to_string(SC_HEX)
				 + " Len: " 
				 + (sc_uint<10>((raw_payload[TLP_HDR_START+2](1,0),
								 raw_payload[TLP_HDR_START+3]))).to_string(SC_HEX)
				 + ")");
		  break;
		case  tlp_CfgRd0: 
		  ts += ("CFG Read0 (Tag: " 
				 + (sc_uint<8>(raw_payload[TLP_HDR_START+6])).to_string(SC_HEX)
				 + " Len: " 
				 + (sc_uint<10>((raw_payload[TLP_HDR_START+2](1,0),
								 raw_payload[TLP_HDR_START+3]))).to_string(SC_HEX)
				 + ")");
		  break;
		case  tlp_CfgWr0: 
		  ts += ("CFG Write0 (Tag: " 
				 + (sc_uint<8>(raw_payload[TLP_HDR_START+6])).to_string(SC_HEX)
				 + " Len: " 
				 + (sc_uint<10>((raw_payload[TLP_HDR_START+2](1,0),
								 raw_payload[TLP_HDR_START+3]))).to_string(SC_HEX)
				 + ")");
		  break;
		case  tlp_CfgRd1: 
		  ts += ("CFG Read1 (Tag: " 
				 + (sc_uint<8>(raw_payload[TLP_HDR_START+6])).to_string(SC_HEX)
				 + " Len: " 
				 + (sc_uint<10>((raw_payload[TLP_HDR_START+2](1,0),
								 raw_payload[TLP_HDR_START+3]))).to_string(SC_HEX)
				 + ")");
		  break;
		case  tlp_CfgWr1: 
		  ts += ("CFG Write1 (Tag: " 
				 + (sc_uint<8>(raw_payload[TLP_HDR_START+6])).to_string(SC_HEX)
				 + " Len: " 
				 + (sc_uint<10>((raw_payload[TLP_HDR_START+2](1,0),
								 raw_payload[TLP_HDR_START+3]))).to_string(SC_HEX)
				 + ")");
		  break;
		case  tlp_Cpl: 
		  ts += ("CMPL (Tag: " 
				 + (sc_uint<8>(raw_payload[TLP_HDR_START+10])).to_string(SC_HEX)
				 + " Len: " 
				 + (sc_uint<10>((raw_payload[TLP_HDR_START+2](1,0),
								 raw_payload[TLP_HDR_START+3]))).to_string(SC_HEX)
				 + ")");
		  break;
		case  tlp_CplD: 
		  ts += ("CMPL with Data (Tag: " 
				 + (sc_uint<8>(raw_payload[TLP_HDR_START+10])).to_string(SC_HEX)
				 + " Len: " 
				 + (sc_uint<10>((raw_payload[TLP_HDR_START+2](1,0),
								 raw_payload[TLP_HDR_START+3]))).to_string(SC_HEX)
				 + ")");
		  break;
		case  tlp_CplLk: 
		  ts += ("CMPL Lock (Tag: " 
				 + (sc_uint<8>(raw_payload[TLP_HDR_START+10])).to_string(SC_HEX)
				 + " Len: " 
				 + (sc_uint<10>((raw_payload[TLP_HDR_START+2](1,0),
								 raw_payload[TLP_HDR_START+3]))).to_string(SC_HEX)
				 + ")");
		  break;
		case  tlp_CplDLk: 
		  ts += ("CMPL Lock with Data (Tag: " 
				 + (sc_uint<8>(raw_payload[TLP_HDR_START+10])).to_string(SC_HEX)
				 + " Len: " 
				 + (sc_uint<10>((raw_payload[TLP_HDR_START+2](1,0),
								 raw_payload[TLP_HDR_START+3]))).to_string(SC_HEX)
				 + ")");
		  break;
		}
		ts += (" TC: " + (sc_uint<3>(raw_payload[TLP_HDR_START+1](6,4))).to_string(SC_HEX)
			   + " TD: " + (sc_uint<1>(raw_payload[TLP_HDR_START+2][7])).to_string(SC_HEX)
			   + " EP: " + (sc_uint<1>(raw_payload[TLP_HDR_START+2][6])).to_string(SC_HEX)
			   + "\n");
		if( (raw_payload[TLP_HDR_START] == tlp_Cpl) ||
			(raw_payload[TLP_HDR_START] == tlp_CplD) ||
			(raw_payload[TLP_HDR_START] == tlp_CplLk) ||
			(raw_payload[TLP_HDR_START] == tlp_CplDLk) 
			){
		  ts += ("ReqId: " + (sc_uint<16>((raw_payload[TLP_HDR_START+9],
										   raw_payload[TLP_HDR_START+8]))).to_string(SC_HEX)
				 + "\n");
		} else
		  ts += ("ReqId: " + (sc_uint<16>((raw_payload[TLP_HDR_START+5],
										   raw_payload[TLP_HDR_START+4]))).to_string(SC_HEX)
				 + "\n");
	  }

	  int total_rows = size/ROWSIZE + ((size%ROWSIZE) ? 1 : 0);
	  for (int row = 0; row < total_rows; row++) {
		int total_cols = ((size - row*ROWSIZE) > ROWSIZE) ? ROWSIZE :  (size - row*ROWSIZE);
		for (int col = 0; col < total_cols; col++) {
		  ts +=  ((sc_uint<8>(raw_payload[row*ROWSIZE+col])).to_string(SC_HEX) + "  ");
		}
		ts += "\n";
	  }
	  return ts;
	}

	RefPacket clone( void ) const {
	  pciePacket *p = new pciePacket(*this);
	  p->raw_payload = raw_payload;
	  return RefPacket(p);
	}


	bool isPosted() const {
	  if (raw_payload[0] != STP) return false;
	  if ( (raw_payload[TLP_HDR_START] == tlp_MWr_32) ||
		   (raw_payload[TLP_HDR_START] == tlp_MWr_64) ||
		   (raw_payload[TLP_HDR_START][4] == 0x1) ) 
		return true;

	  return false;
	}

	bool isCmpl() const {
	  if (raw_payload[0] != STP) return false;
	  if (raw_payload[TLP_HDR_START][3] == 0x1)
		return true;
	  return false;
	}

	bool hasData() const {
	  if (raw_payload[0] != STP) return false;
	  if (raw_payload[TLP_HDR_START][6] == 0x1)
		return true;
	  return false;
	}

	bool isValidDWBE() const {

	  if(this->isCmpl()) return false;

	  //CMPLs do not have DWBEs
	  sc_uint<10> len = (raw_payload[TLP_HDR_START+2].range(1,0),raw_payload[TLP_HDR_START+3]);
	  sc_uint<4>  fBE = raw_payload[TLP_HDR_START+7].range(3,0);
	  sc_uint<4>  lBE = raw_payload[TLP_HDR_START+7].range(7,4);

	  if( (raw_payload[TLP_HDR_START]==tlp_CfgRd0 || raw_payload[TLP_HDR_START]==tlp_CfgRd1 ||
		   raw_payload[TLP_HDR_START]==tlp_CfgWr0 || raw_payload[TLP_HDR_START]==tlp_CfgWr1 ||
		   raw_payload[TLP_HDR_START]==tlp_IORd || raw_payload[TLP_HDR_START]==tlp_IOWr) &&
		  (lBE!=0)){
		return false;
	  } 

	  bool isContiguous = false;
	  if((fBE==8 || fBE==12 || fBE==14 || fBE==15) && (lBE==1 || lBE==3 || lBE==7 || lBE==15))
		isContiguous = true;

	  bool qwbndry = false;
	  sc_uint<2> addr_lsb = 0;
	  if(raw_payload[TLP_HDR_START].range(6,5)==1 || raw_payload[TLP_HDR_START].range(6,5)==3)
		addr_lsb = raw_payload[TLP_HDR_START+15].range(3,2);
	  else
		addr_lsb = raw_payload[TLP_HDR_START+11].range(3,2);
	  if(addr_lsb==0){
		qwbndry = true;
	  }

	  if( (len==0x1 && lBE!=0)        || (len>0x1  && lBE==0) || (len>0x1  && fBE==0) || 
		  (len>0x2  && !isContiguous) || (len==0x2 && !isContiguous && !qwbndry))
		return false;
	  return true;
	}

	bool isCross4KB() const {
	  if(raw_payload[TLP_HDR_START]==tlp_MRd_32 || raw_payload[TLP_HDR_START]==tlp_MRd_64 ||
		 raw_payload[TLP_HDR_START]==tlp_MWr_32 || raw_payload[TLP_HDR_START]==tlp_MWr_64)
		{
		  sc_uint<64> addr=0;
		  sc_uint<10> len= (raw_payload[TLP_HDR_START+2].range(1,0),raw_payload[TLP_HDR_START+3]);
		  if(raw_payload[TLP_HDR_START].range(6,5)==1 || raw_payload[TLP_HDR_START].range(6,5)==3 )
			{
			  addr.range(63,2) = (raw_payload[TLP_HDR_START+8],raw_payload[TLP_HDR_START+9],raw_payload[TLP_HDR_START+10],raw_payload[TLP_HDR_START+11],raw_payload[TLP_HDR_START+12],raw_payload[TLP_HDR_START+13],raw_payload[TLP_HDR_START+14],raw_payload[TLP_HDR_START+15].range(7,2));
			}
		  else 
			addr.range(31,2) = (raw_payload[TLP_HDR_START+8],raw_payload[TLP_HDR_START+9],raw_payload[TLP_HDR_START+10],raw_payload[TLP_HDR_START+11].range(7,2));
		  if( (addr%0x1000 + len*4) > 0x1000 )
			return true;
		}
	  return false;
	}

	bool isMalformed(sc_uint<64> peu_diag_reg){
	  if( (this->get_size() != this->get_expect_len())  || 
		  (peu_diag_reg.range(36,36)!=1 && !this->isValidDWBE() && 
		   !(raw_payload[TLP_HDR_START].range(6,5)==1 && raw_payload[TLP_HDR_START].range(4,0)>=0x10) //TLP is not a MsgD
		   || (peu_diag_reg.range(37,37)!=1 && this->isCross4KB() ))) 
		return true;
	  return false;
	}

  private:
	uint32 size;
	sc_lv<5> is_control;
	// is_control[4:0] = {EDB, END, SDP, STP, Control}
	vector < sc_uint < 8 > >  raw_payload;

  };

  typedef packetRefCount<pciePacket> RefPciePacket;

#undef LOG_SERVICE
}
#endif //INC_pciePacket_hpp__

