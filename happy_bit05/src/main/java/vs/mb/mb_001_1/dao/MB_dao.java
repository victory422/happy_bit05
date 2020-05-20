package vs.mb.mb_001_1.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import vs.lc.lc_003_1.vo.LC_003_1_VO;
import vs.lo.lo_001.vo.LO_001_VO;
import vs.mb.mb_001_1.vo.PR_VO;
import vs.pr.pr_002_1.vo.Pr_002_1VO;
import vs.pr.pr_002_1.vo.Upload_pr_vo;

public interface MB_dao {
	
	public LC_003_1_VO getLC(String lc_index);
	
	public List<LC_003_1_VO> getCourseList();
	
	public Boolean login(LO_001_VO vo);

	List<Map<String, String>> getMyRecordList(String m_index);

	List<Map<String, String>> getMyRecordListSort(Map<String, String> map);
	
	void regist(PR_VO pr_vo);
	
	//코스 데이터 맵 데이터 불러오는 쿼리
	public Pr_002_1VO upload(String pr_index);
	
	public void update1(Upload_pr_vo pr_vo);
	
	public void update2(Map<String, Object> hmap);
	
	public List<Pr_002_1VO> pr_list();

	public List<Map<String, String>> getMCListAppSort(Map<String, String> map);
}
