package vs.li.li_001_1.service;

import java.util.List;

import vs.li.li_001_01.vo.LI_VO;

public interface LI_Service {

	public void li_regist(LI_VO vo);
	

	public List<LI_VO> get_list(LI_VO vo);

}
