package vs.lc.lc_002_1.service;

import java.util.List;

import vs.lc.lc_002_1.vo.Criteria;
import vs.lc.lc_002_1.vo.LC_002_1_VO;

public interface LC_002_1_Service {

	public List<LC_002_1_VO> getList(Criteria cri);
	
	public List<LC_002_1_VO> getGood(Criteria cri);

	public int getTotal(Criteria cri);
}
