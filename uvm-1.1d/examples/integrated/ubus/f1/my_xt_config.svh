

/**
 * Class: my_xt_config
 * Provides configuration information for agent my_xt
 */
class my_xt_config extends uvm_object;
	`uvm_object_utils(my_xt_config)
	
	static const string report_id = "my_xt_config";
	
	// TODO: Add virtual interface handles

	// Specify the config values
	bit					has_monitor		= 1;
	bit					has_driver		= 1;
	bit					has_sequencer	= 1;

	
	/**
	 * Function: get_config
	 * Convenience function that obtains the config object from the
	 * UVM configuration database and reports an error if not present
	 */
	static function my_xt_config get_config(
			uvm_component			comp,
			string					cfg_name = "my_xt_config");
		my_xt_config cfg;
		
		if (!uvm_config_db #(my_xt_config)::get(comp, "", cfg_name, cfg)) begin
			comp.uvm_report_error(report_id,
				$psprintf("%s has no config associated with id %s",
					comp.get_full_name(), cfg_name),, `__FILE__, `__LINE__);
			return null;
		/*
		 */
		end
		return cfg;
	endfunction

endclass



