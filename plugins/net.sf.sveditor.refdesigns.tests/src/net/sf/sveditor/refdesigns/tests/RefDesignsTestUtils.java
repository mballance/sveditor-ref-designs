package net.sf.sveditor.refdesigns.tests;

import java.io.File;
import java.net.URL;

public class RefDesignsTestUtils {
	
	public static File getRefDesignsPath() {
		String this_cls_path = "net/sf/sveditor/refdesigns/tests/RefDesignsTestUtils.class";
		URL this_cls = RefDesignsTestUtils.class.getClassLoader().getResource(this_cls_path);
		String path = this_cls.toExternalForm();
		path = path.substring("file:".length());
		path = path.substring(0, path.length()-(this_cls_path.length()+"/bin/".length()));
		
		// path is the path to the plugin directory
		File plugin_dir = new File(path);
		File plugins_dir = plugin_dir.getParentFile();
		File sveditor_ref_designs = plugins_dir.getParentFile();
		
		return sveditor_ref_designs;
	}
	
	public static File getUvmRefFlowPath() {
		return new File(getRefDesignsPath(), "uvm_ref_flow_2013.05");
	}
	
	public static File getOpenSparcPath() {
		return new File(getRefDesignsPath(), "OpenSPARCT2.1.3");
	}

}
