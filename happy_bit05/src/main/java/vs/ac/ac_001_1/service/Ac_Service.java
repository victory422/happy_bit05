package vs.ac.ac_001_1.service;

import java.util.List;
import java.util.Map;

import vs.ac.ac_001_1.vo.AcVO;
import vs.co.co_001_1.dto.Page_DTO;
import vs.co.co_001_1.vo.CoVO;

public interface Ac_Service {
	
	
	public void ac_insert(AcVO acvo);
	
	public void insertTu(Map<String, Object> hmap);
	
	//public List<CoVO> ac_mlist(String co_b_index);
}
