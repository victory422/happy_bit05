package vs.lc.lc_002_1.dao;

import java.util.List;

import vs.lc.lc_002_1.vo.Criteria;
import vs.lc.lc_002_1.vo.LC_002_1_VO;

public interface LC_002_1_Dao {
	
	public List<LC_002_1_VO> getList(Criteria cri);
	
	public List<LC_002_1_VO> getGood();

	public List<LC_002_1_VO> getSearch(String keyword);
	
	public List<LC_002_1_VO> getSearch_good(String keyword);

	public int getTotalCount(Criteria cri);
}
