package vs.co.co_001_1.service;

import java.util.List;

import vs.ac.ac_001_1.vo.AcVO;
import vs.co.co_001_1.vo.CoVO;


public interface Co_Service {

	public List<AcVO> co_List(AcVO acvo);
	
	public List<AcVO> co_detail(String co_b_index);
	
	public List<AcVO> ap_list(String co_b_index) throws Exception;
	
	public int ap_insert(CoVO crvo) throws Exception;
}
