package vs.co.co_001_1.service;

import java.util.List;

import vs.ac.ac_001_1.vo.AcVO;
import vs.co.co_001_1.dto.Page_DTO;
import vs.co.co_001_1.vo.CoVO;


public interface Co_Service {

	public List<AcVO> co_List(Page_DTO dto);
	
	public int get_total(Page_DTO dto);
	
	public List<AcVO> co_detail(String co_b_index);
	
	public List<AcVO> ap_list(String co_b_index) throws Exception;
	
	public int ap_insert(CoVO crvo) throws Exception;
	
}
