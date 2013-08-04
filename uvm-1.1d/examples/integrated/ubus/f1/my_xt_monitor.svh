

class my_xt_monitor extends uvm_monitor;

	uvm_analysis_port #(my_xt_seq_item)			ap;
	
	my_xt_config									m_cfg;
	
	const string report_id = "my_xt_monitor";
	
	`uvm_component_utils(my_xt_monitor)
	
	function new(string name, uvm_component parent);
		super.new(name, parent);
	endfunction
	
	function void build_phase(uvm_phase phase);
		super.build_phase(phase);
	
		// Obtain the config object
		m_cfg = my_xt_config::get_config(this);
	
		// Create the analysis port
		ap = new("ap", this);

	endfunction
	
	function void connect_phase(uvm_phase phase);
		super.connect_phase(phase);
	endfunction
	
	task run_phase(uvm_phase phase);
		// TODO: implement my_xt_monitor run_phase
	endtask
	
	
endclass


