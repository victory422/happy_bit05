package vs.ac.ac_001_1.service;

import java.util.List;

import vs.ac.ac_001_1.vo.AcVO;

public interface Ac_Service {
	
	public List<AcVO> ac_List(AcVO acvo);
	
	public void ac_insert(AcVO acvo);
	
	
}
