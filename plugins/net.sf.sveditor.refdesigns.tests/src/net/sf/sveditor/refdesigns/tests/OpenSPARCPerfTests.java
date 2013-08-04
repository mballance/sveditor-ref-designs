package net.sf.sveditor.refdesigns.tests;

import java.io.File;
import java.util.List;

import org.eclipse.core.runtime.NullProgressMonitor;

import net.sf.sveditor.core.SVCorePlugin;
import net.sf.sveditor.core.db.SVDBMarker;
import net.sf.sveditor.core.db.index.ISVDBIndex;
import net.sf.sveditor.core.db.index.SVDBFSFileSystemProvider;
import net.sf.sveditor.core.db.index.SVDBIndexStats;
import net.sf.sveditor.core.db.index.argfile.SVDBArgFileIndex2;
import net.sf.sveditor.core.db.index.builder.ISVDBIndexChangePlan;
import net.sf.sveditor.core.db.index.builder.SVDBIndexChangePlanRebuild;
import net.sf.sveditor.core.db.index.cache.ISVDBIndexCache;
import net.sf.sveditor.core.db.index.ops.SVDBGetMarkersIndexOp;
import net.sf.sveditor.core.tests.SVCoreTestCaseBase;

public class OpenSPARCPerfTests extends SVCoreTestCaseBase {

	@Override
	protected void setUp() throws Exception {
		super.setUp();
		
		SVCorePlugin.testInit();
	}

	public void testOpenSPARCPreProcPerf() {
		
	}
	
	public void testOpenSPARCIndexPerf() {
		File opensparc_dir = RefDesignsTestUtils.getOpenSparcPath();
		SVCorePlugin.setenv("DV_ROOT", opensparc_dir.getAbsolutePath());
		String cpu_flist = opensparc_dir.getAbsolutePath() + "/design/sys/iop/cpu/cpu.flist";
		
		ISVDBIndexCache cache = fCacheFactory.createIndexCache(
				"DEFAULT",
				cpu_flist);
		
		ISVDBIndex index = new SVDBArgFileIndex2(
				"DEFAULT",
				cpu_flist,
				new SVDBFSFileSystemProvider(),
				cache,
				null);
	
		index.init(new NullProgressMonitor(), null);
	
		ISVDBIndexChangePlan plan = new SVDBIndexChangePlanRebuild(index);
		index.execIndexChangePlan(new NullProgressMonitor(), plan);
		
		if (index instanceof SVDBArgFileIndex2) {
			SVDBIndexStats stats = ((SVDBArgFileIndex2)index).getIndexStats();
			
			System.out.println("Index Stats:\n" + stats.toString());
		}

		List<SVDBMarker> markers = SVDBGetMarkersIndexOp.op(index, true);
		
		for (SVDBMarker m : markers) {
			System.out.println("Marker: " + m.getMessage());
		}
		
		/*
		ISVDBIndexInt index_i = (ISVDBIndexInt)index;
		ISVPreProcessor pp = index_i.createPreProcScanner(uvm_ref_flow.getAbsolutePath() + "/designs/socv/rtl/rtl_lpw/opencores/spi/rtl/spi_shift.v");
		SVPreProcOutput pp_out = pp.preprocess();
		
		System.out.println("spi_shift.v:\n" + pp_out.toString());
		
		List<SVDBDeclCacheItem> items = SVDBFindDeclOp.op(index, "", 
				new ISVDBFindNameMatcher() {
					
					public boolean match(ISVDBNamedItem it, String name) {
						return true;
					}
				}, true);
		
		for (SVDBDeclCacheItem it : items) {
			System.out.println("Item: " + it.getName());
		}
		 */		
	}
	

}
