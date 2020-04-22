package vs.ac.ac_001_1.service;

import java.util.List;

import vs.ac.ac_001_1.vo.AcVO;
import vs.co.co_001_1.dto.Page_DTO;

public interface Ac_Service {
	
	public List<AcVO> ac_List(Page_DTO dto);
	
	public void ac_insert(AcVO acvo);
	
	
}
