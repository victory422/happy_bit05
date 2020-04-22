package vs.lc.lc_003_1.dao;

import java.util.Map;

import vs.lc.lc_003_1.vo.LC_003_1_VO; 

public interface LC_003_1_Dao {

	public LC_003_1_VO getLC(String lc_index);
	
	public int modifyLC(LC_003_1_VO vo);
	
	public int modifyLC_thumbnail(Map<String, Object> hmap);
}
