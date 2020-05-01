package vs.mb.mb_001_1.service;

import java.util.List;

import vs.lc.lc_003_1.vo.LC_003_1_VO;

public interface MB_service {
	
	public LC_003_1_VO getLC(String lc_index);
	
	public List<LC_003_1_VO> getCourseList();

}
