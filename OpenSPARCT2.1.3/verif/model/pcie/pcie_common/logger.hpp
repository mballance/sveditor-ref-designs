// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: logger.hpp
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
#ifndef INC_Logger_hpp__
#define INC_Logger_hpp__

#include <iostream>
#include <fstream>
#include <string>
#include "config.hpp"

namespace Logger {

#ifdef LOG_SYSTEMC 
#ifdef LOG_SERVICE
#define WHERE_S __FILE__,__LINE__, ""
#define TIME "@(" << sc_time_stamp()   << ")\t"
#else 
#define WHERE __FILE__,__LINE__, name()
#define WHERE_S __FILE__,__LINE__, ""
#define TIME "@(" << sc_time_stamp() << " from: " << inst << ")\t"
#endif // LOG_SERVICE
#else
#define WHERE __FILE__,__LINE__, ""
#define TIME "\t"
#endif //LOG_SYSTEMC

#define LOG_ALWAYS (logger::instance()->log_always(WHERE))
#define LOG_ERROR (logger::instance()->log_error(WHERE))
#define LOG_WARNING (logger::instance()->log_warning(WHERE))
#define LOG_NORMAL (logger::instance()->log_normal(WHERE))
#define LOG_VERBOSE (logger::instance()->log_verbose(WHERE))
#define LOG_INFO (logger::instance()->log_info(WHERE))
#define LOG_DEBUG (logger::instance()->log_debug(WHERE))

#define LOG_ALWAYS_S (logger::instance()->log_always(WHERE_S))
#define LOG_ERROR_S (logger::instance()->log_error(WHERE_S))
#define LOG_WARNING_S (logger::instance()->log_warning(WHERE_S))
#define LOG_NORMAL_S (logger::instance()->log_normal(WHERE_S))
#define LOG_VERBOSE_S (logger::instance()->log_verbose(WHERE_S))
#define LOG_INFO_S (logger::instance()->log_info(WHERE_S))
#define LOG_DEBUG_S (logger::instance()->log_debug(WHERE_S))


  USING_NAMESPACE(std)

  enum LogLevel {NEVER, ALWAYS, ERROR, WARNING, NORMAL, VERBOSE, INFO, DEBUG, ALL};
  
  class logger
  {
  public:
	static logger* instance(LogLevel log_l = ALL) {
	  if (inst == NULL) {
		inst = new logger(log_l);
	  }
	  return inst;
	}

	inline logger& log_always (string file, int line, string inst) {
	  log_stat = ALWAYS;
	  if (disp_level >= log_stat) {
		(*disp_stream) << "\n-------------------------------------------------------------------------------\n";
		(*disp_stream) << TIME << "@(" << file << ":" << line << "):\n";
	  }
	  if (log_level >= log_stat) {
		(*log_stream) << "\n-------------------------------------------------------------------------------\n";
		(*log_stream) << TIME << "@(" << file << ":" << line << "):\n";
		log_stream->flush();
	  }
	  return (*this);
	}
	
	inline logger& log_error (string file, int line, string inst) {
	  log_stat = ERROR;
	  if (disp_level >= log_stat) {
		(*disp_stream) << "\n-------------------------------------------------------------------------------\n";
		(*disp_stream) << TIME << "ERROR@(" << file << ":" << line << "):\n";
	  }
	  if (log_level >= log_stat) {
		(*log_stream) << "\n-------------------------------------------------------------------------------\n";
		(*log_stream) << TIME << "ERROR@(" << file << ":" << line << "):\n";
		log_stream->flush();
	  }
	  return (*this);
	}
	
	inline logger& log_warning (string file, int line, string inst) {
	  log_stat = WARNING;
	  if (disp_level >= log_stat) {
		(*disp_stream) << "\n-------------------------------------------------------------------------------\n";
		(*disp_stream) << TIME << "WARNING@(" << file << ":" << line << "):\n";
	  }
	  if (log_level >= log_stat) {
		(*log_stream) << "\n-------------------------------------------------------------------------------\n";
		(*log_stream) << TIME << "WARNING@(" << file << ":" << line << "):\n";
		log_stream->flush();
	  }
	  return (*this);
	}
	
	inline logger& log_normal (string file, int line, string inst) {
	  log_stat = NORMAL;
	  if (disp_level >= log_stat) {
		(*disp_stream) << "\n-------------------------------------------------------------------------------\n";
		(*disp_stream) << TIME << "@(" << file << ":" << line << "):\n";
	  }
	  if (log_level >= log_stat) {
		(*log_stream) << "\n-------------------------------------------------------------------------------\n";
		(*log_stream) << TIME << "@(" << file << ":" << line << "):\n";
		log_stream->flush();
	  }
	  return (*this);
	}
	
	inline logger& log_info (string file, int line, string inst) {
	  log_stat = INFO;
	  if (disp_level >= log_stat) {
		(*disp_stream) << "\n-------------------------------------------------------------------------------\n";
		(*disp_stream) << TIME << "INFO@(" << file << ":" << line << "):\n";
	  }
	  if (log_level >= log_stat) {
		(*log_stream) << "\n-------------------------------------------------------------------------------\n";
		(*log_stream) << TIME << "INFO@(" << file << ":" << line << "):\n";
		log_stream->flush();
	  }
	  return (*this);
	}
	
	inline logger& log_verbose (string file, int line, string inst) {
	  log_stat = VERBOSE;
	  if (disp_level >= log_stat) {
		(*disp_stream) << "\n-------------------------------------------------------------------------------\n";
		(*disp_stream) << TIME << "VERBOSE@(" << file << ":" << line << "):\n";
	  }
	  if (log_level >= log_stat) {
		(*log_stream) << "\n-------------------------------------------------------------------------------\n";
		(*log_stream) << TIME << "VERBOSE@(" << file << ":" << line << "):\n";
		log_stream->flush();
	  }
	  return (*this);
	}
	
	inline logger& log_debug (string file, int line, string inst) {
	  log_stat = DEBUG;
	  if (disp_level >= log_stat) {
		(*disp_stream) << "\n-------------------------------------------------------------------------------\n";
		(*disp_stream) << TIME << "DEBUG@(" << file << ":" << line << "):\n";
	  }
	  if (log_level >= log_stat) {
		(*log_stream) << "\n-------------------------------------------------------------------------------\n";
		(*log_stream) << TIME << "DEBUG@(" << file << ":" << line << "):\n";
		log_stream->flush();
	  }
	  return (*this);
	}
	
	
	logger& operator<<(const string __s) {
	  if (disp_level >= log_stat)
		(*disp_stream) << __s;
	  if (log_level >= log_stat)
		(*log_stream) << __s;
	  return *this;
	}

	logger& operator<<(const int __i) {
	  if (disp_level >= log_stat)
		(*disp_stream) << __i;
	  if (log_level >= log_stat)
		(*log_stream) << __i;
	  return *this;
	}
  
	logger& operator<<(int8 __i) {
	  if (disp_level >= log_stat)
		(*disp_stream) << __i;
	  if (log_level >= log_stat)
		(*log_stream) << __i;
	  
	  return *this;
	}
	logger& operator<<(int16 __i) {
	  if (disp_level >= log_stat)
		(*disp_stream) << __i;
	  if (log_level >= log_stat)
		(*log_stream) << __i;
	  
	  return *this;
	}
	logger& operator<<(int32 __i) {
	  if (disp_level >= log_stat)
		(*disp_stream) << __i;
	  if (log_level >= log_stat)
		(*log_stream) << __i;
	  
	  return *this;
	}
	logger& operator<<(int64 __i) {
	  if (disp_level >= log_stat)
		(*disp_stream) << __i;
	  if (log_level >= log_stat)
		(*log_stream) << __i;
	  
	  return *this;
	}
	logger& operator<<(const unsigned int __i) {
	  if (disp_level >= log_stat)
		(*disp_stream) << __i;
	  if (log_level >= log_stat)
		(*log_stream) << __i;
	  
	  return *this;
	}

	logger& operator<<(uint8 __i) {
	  if (disp_level >= log_stat)
		(*disp_stream) << __i;
	  if (log_level >= log_stat)
		(*log_stream) << __i;
	  
	  return *this;
	}
	logger& operator<<(uint16 __i) {
	  if (disp_level >= log_stat)
		(*disp_stream) << __i;
	  if (log_level >= log_stat)
		(*log_stream) << __i;
	  
	  return *this;
	}
	logger& operator<<(uint32 __i) {
	  if (disp_level >= log_stat)
		(*disp_stream) << __i;
	  if (log_level >= log_stat)
		(*log_stream) << __i;
	  
	  return *this;
	}
	logger& operator<<(uint64 __i) {
	  if (disp_level >= log_stat)
		(*disp_stream) << __i;
	  if (log_level >= log_stat)
		(*log_stream) << __i;
	  
	  return *this;
	}

	logger& operator<<(double __i) {
	  if (disp_level >= log_stat)
		(*disp_stream) << __i;
	  if (log_level >= log_stat)
		(*log_stream) << __i;

	  return *this;
	}

  protected:
	logger(LogLevel log_l = ALL, LogLevel disp_l = NORMAL, const char* log_file = "simulation.log") {
	  disp_stream = &cerr;
	  log_stream = new ofstream(log_file, ios::out);
	  (*log_stream) << hex;
	  (*disp_stream) << hex;
#ifdef NO_LOG
	  log_level = NEVER;
	  disp_level = NEVER;
#else
#ifdef DEBUG_LOG
	  log_level = DEBUG;
	  disp_level = NORMAL;
#else
#ifdef NORMAL_LOG
        log_level = NORMAL;
        disp_level = NORMAL;
#else
#ifdef ALWAYS_LOG
        log_level = ALWAYS;
        disp_level = NORMAL;

#else
#ifdef ALL_LOG
        log_level = log_l;
        disp_level = disp_l;
#else
        log_level = NEVER;
        disp_level = NEVER;
#endif
#endif
#endif
#endif
#endif

	  
	}

  public:
	LogLevel	log_level;
	
  private:
	LogLevel	disp_level;
	LogLevel	log_stat;

	ofstream	*log_stream;
	ostream 	*disp_stream;
	static logger		*inst;
	  
  };  
  
} // namespace logger

#endif // INC_Logger_hpp__
