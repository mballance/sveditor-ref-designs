
`ifndef INCLUDED_my_xt_seq_base_SVH
`define INCLUDED_my_xt_seq_base_SVH

class my_xt_seq_base extends uvm_sequence #(my_xt_seq_item);
	`uvm_object_utils(my_xt_seq_base);
	
	static const string report_id = "my_xt_seq_base";
	
	function new(string name="my_xt_seq_base");
		super.new(name);
	endfunction
	
	task body();
		`uvm_error(report_id, "base-class body task not overridden");
	endtask
	
endclass

`endif /* INCLUDED_my_xt_seq_base_SVH */



