package net.sf.sveditor.refdesigns.tests;

import java.io.File;

import net.sf.sveditor.core.SVCorePlugin;
import net.sf.sveditor.core.tests.SVCoreTestCaseBase;

public class SVRefDesignsTestCaseBase extends SVCoreTestCaseBase {
	protected File						fRefDesignsDir;

	@Override
	protected void setUp() throws Exception {
		// Set Ref Designs-specific variables
		fRefDesignsDir = RefDesignsTestUtils.getRefDesignsPath();
		
		SVCorePlugin.setenv("UVM_HOME", 
				fRefDesignsDir.getAbsolutePath() + "/uvm-1.1d");
		
		SVCorePlugin.setenv("UVM_REF_HOME", 
				fRefDesignsDir.getAbsolutePath() + "/uvm_ref_flow_2013.05");
		
		super.setUp();
	}

	@Override
	protected void tearDown() throws Exception {
		// TODO Auto-generated method stub
		super.tearDown();
	}
	
	

}
