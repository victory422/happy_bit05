package vs.mb.mb_001_1.service;

import java.util.List;
import java.util.Map;

import vs.lc.lc_003_1.vo.LC_003_1_VO;
import vs.lo.lo_001.vo.LO_001_VO;
import vs.mb.mb_001_1.vo.PR_VO;

public interface MB_service {
	
	public LC_003_1_VO getLC(String lc_index);
	
	public List<LC_003_1_VO> get_CourseList();
	
	public Boolean login(LO_001_VO vo);

	List<Map<String, String>> getMyRecordList(String m_index);

	List<Map<String, String>> getMyRecordListSort(Map<String, String> map);
	
	public void regist(PR_VO pr_vo);

}
