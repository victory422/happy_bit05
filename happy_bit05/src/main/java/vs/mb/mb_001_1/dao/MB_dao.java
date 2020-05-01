package vs.mb.mb_001_1.dao;

import java.util.List;

import vs.lc.lc_003_1.vo.LC_003_1_VO;

public interface MB_dao {
	
	public LC_003_1_VO getLC(String lc_index);
	
	public List<LC_003_1_VO> getCourseList();

}
