package vs.lc.lc_003_1.service;

import java.util.Map;

import vs.lc.lc_003_1.vo.LC_003_1_VO;

public interface LC_003_1_Service {
	
	public LC_003_1_VO getLC(String lc_index);

	public boolean modifyLC(LC_003_1_VO vo);
	
	public boolean modifyLC_thumbnail(Map<String, Object> hmap);
}
